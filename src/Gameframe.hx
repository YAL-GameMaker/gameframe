package ;
import GfButtons;
import Array;
import gml.Mathf;
import gml.input.Display;
import gml.input.KeyCode;
import gml.input.Keyboard;
import gml.input.Mouse;
import gml.input.MouseButton;
import gml.input.Window;
import gml.sys.System;
import gml.sys.SystemType;
import haxe.Rest;
import tools.GfNative;

/**
 * ...
 * @author 
 */
@:keep
class Gameframe {
	public static var isReady = false;
	
	public static var doubleClickTime:Float;
	
	public static var lastTitleClickAt = -5000;
	
	public static function log(args:Rest<Any>) {
		if (!GfConfig.debug) return;
		var s = "[Gameframe]";
		for (arg in gml.Lib.args) s += " " + Std.string(arg);
		gml.Lib.trace(s);
	}
	
	/**
	 * Should be called once a frame in Step event.
	 */
	@:doc static function update() {
		if (!isReady) return;
		GfState.effectiveScale = (Display.dpiX / 96) / GfConfig.dpiScale;
		GfState.mouseOverFrame = false;
		GfDelay.update();
		GfCover.ensure();
		
		// the rest here is non-fullscreen business:
		if (Window.fullscreen || GfState.isFullscreen) {
			GfKeyboardShortcuts.reset();
			return;
		}
		GfKeyboardShortcuts.update();
		
		var mx = Std.int(Window.mouseX);
		var my = Std.int(Window.mouseY);
		var gw = Window.width;
		var gh = Window.height;
		var _borderWidth = GfState.isMaximized ? 0 : GfConfig.borderWidth;
		var _titleHeight = GfCaption.getHeight();
		var _buttons_x = GfButtons.getCombinedOffset(gw);
		
		var _flags = 0x0, _titleHit = false;
		var _hitSomething = true;
		var resizePadding = GfConfig.resizePadding;
		if (Window.fullscreen) {
			//
		}
		else if (Mathf.pointInRect(mx, my,
			_buttons_x, _borderWidth,
			gw - _borderWidth - (GfState.isMaximized ? 0 : resizePadding),
			_borderWidth + _titleHeight
		)) { // mouse over window buttons
			//
		}
		else if (!GfState.isMaximized && GfConfig.canResize && !Mathf.pointInRect(mx, my,
			resizePadding,
			resizePadding,
			gw - resizePadding,
			gh - resizePadding
		)) { // mouse over borders
			if (mx < resizePadding) _flags |= GfDragFlags.Left;
			if (my < resizePadding) _flags |= GfDragFlags.Top;
			if (mx >= gw - resizePadding) _flags |= GfDragFlags.Right;
			if (my >= gh - resizePadding) _flags |= GfDragFlags.Bottom;
		}
		else if (Mathf.pointInRect(mx, my,0, 0, gw, _titleHeight)) {
			_titleHit = true;
		}
		else {
			_hitSomething = false;
		}
		GfState.mouseOverFrame = _hitSomething;
		
		if (GfDrag.flags == 0) {
			var _cursor = GfConfig.defaultCursor;
			if (GfConfig.canInput && GfConfig.canResize) switch (_flags) {
				case 1, 4: _cursor = WindowCursor.sizeWE;
				case 2, 8: _cursor = WindowCursor.sizeNS;
				case 3, 12: _cursor = WindowCursor.sizeNWSE;
				case 6, 9: _cursor = WindowCursor.sizeNESW;
			}
			GfState.setWindowCursor(_cursor);
		}
		
		GfButtons.update(_buttons_x, _borderWidth, _titleHeight, mx, my);
		if (GfConfig.canInput && Mouse.pressed(MouseButton.MbLeft)) {
			if (_titleHit) {
				var _now = gml.Lib.getTimer();
				if (_now < lastTitleClickAt + doubleClickTime) {
					if (GfState.isMaximized) {
						GfState.restore();
					} else GfState.maximize();
				} else {
					lastTitleClickAt = _now;
					if (GfState.isMaximized) {
						GfDrag.start(GfDragFlags.Unmax);
					} else {
						GfDrag.start(GfDragFlags.Move);
					}
				}
			} else if (_flags != 0 && GfConfig.canResize) {
				GfDrag.start(_flags);
			}
		}
		if (!GfConfig.canInput) {
			if (GfDrag.flags != 0) GfDrag.stop();
		} else if (Mouse.released(MouseButton.MbLeft)) {
			GfDrag.stop();
		} else {
			GfDrag.update();
		}
	}
	
	/**
	 * Should be called on Game Start or in Create - before other functions are used.
	 */
	@:doc public static function init() {
		isReady = true;
		GfState.hasNativeExtension = GfNative.check_native_extension();
		doubleClickTime = GfState.hasNativeExtension ? GfNative.get_double_click_time() : 500;
		GfNative.init_native();
		GfState.restoreRect.getWindowRect();
		GfButtons.addDefaults();
		
		#if sfgml.next
		GfNative.set_shadow(true);
		#else
		GfDelay.call0(3, function() {
			if (GfState.isMaximized || GfState.isFullscreen || Window.fullscreen) return;
			GfNative.set_shadow(true);
		});
		#end
	}
	
	public static inline function main() {}
}