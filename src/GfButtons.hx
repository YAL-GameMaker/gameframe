package ;
import gml.Mathf;
import gml.NativeDate;
import gml.input.Display;
import gml.input.Mouse;
import gml.input.MouseButton;
import gml.input.Window;
import tools.GfNative;

/**
 * The following functions relate to window buttons (minimize/maximize/restore/custom) in general.
 * @dmdPath ["gameframe_button_ctl", "Button controller"]
 * @author YellowAfterlife
 */
@:keep @:native("gameframe_button")
class GfButtons {
	/** An array of buttons! You can add your own to it */
	@:doc public static var array:Array<GfButton> = [];
	
	/**
	 * Controls how fast (in seconds) buttons fade in/out on hover.  
	 * The default value (0.2) matches Win10 behaviour.
	 */
	@:doc public static var fadeTime = 0.2;
	
	public static var waitForMovement = false;
	public static var waitForMovementX = 0.;
	public static var waitForMovementY = 0.;
	
	/**
	 * Returns combined width of all buttons (including margins)
	 */
	@:doc public static function getCombinedWidth():Int {
		var w = 0;
		for (b in array) w += b.marginLeft + b.getWidth(b) + b.marginRight;
		return Math.ceil(w * GfState.effectiveScale);
	}
	
	/**
	 * Returns where the window buttons should be, given the specified window width
	 * (window width - border width - combined width)
	 */
	@:doc public static function getCombinedOffset(windowWidth:Int):Int {
		return windowWidth - GfState.getBorderWidth() - getCombinedWidth();
	}
	
	/**
	 * Un-presses and un-hovers every button.  
	 * Used on occasions like minimizing the window.
	 */
	@:doc public static function reset() {
		for (b in array) {
			b.hover = false;
			b.fade = 0.;
			b.pressed = false;
		}
	}
	
	public static function update(x:Float, y:Float, height:Int, mx:Int, my:Int) {
		// after the window was minimized, we don't want to highlight buttons
		// when the user restores it
		var over_row = (mx >= y && my < y + height);
		if (over_row) {
			if (GfState.hasNativeExtension) {
				over_row = (GfNative.mouse_in_window():Bool);
			} else {
				var wx = Window.x;
				var wy = Window.y;
				var dmx = Display.mouseX;
				var dmy = Display.mouseY;
				over_row = dmx >= wx && dmy >= wy
					&& dmx < wx + Window.width && dmy < wy + Window.height;
			}
		}
		if (waitForMovement) {
			if (mx != waitForMovementX || my != waitForMovementY) {
				waitForMovement = false;
			} else over_row = false;
		}
		
		var dpiScale = GfState.effectiveScale;
		var pressed = Mouse.pressed(MouseButton.MbLeft);
		var released = Mouse.released(MouseButton.MbLeft);
		var disable = GfDrag.flags != GfDragFlags.None || !GfConfig.canInput;
		for (i in 0 ... array.length) {
			var button = array[i];
			button.update(button);
			x += button.marginLeft * dpiScale;
			var width = button.getWidth(button) * dpiScale;
			if (disable || !button.enabled) {
				button.hover = false;
				button.pressed = false;
			} else if (over_row && mx >= x && mx < x + width) {
				button.hover = true;
				if (pressed) button.pressed = true;
			} else {
				button.hover = false;
			}
			if (released && button.pressed && button.hover) {
				button.pressed = false;
				button.click(button);
			}
			x += width + button.marginRight * dpiScale;
		}
	}
	public static function draw(x:Float, y:Float, height:Int) {
		var dpiScale = GfState.effectiveScale;
		for (i in 0 ... array.length) {
			var button = array[i];
			x += button.marginLeft * dpiScale;
			var width = button.getWidth(button) * dpiScale;
			button.drawUnderlay(button, x, y, width, height);
			button.drawIcon(button, x, y, width, height);
			x += width + button.marginRight * dpiScale;
		}
	}
	
	public static function addDefaults() {
		var minimize = new GfButton("minimize", GfConfig.sprButtons, 0, function(button) {
			GfState.minimize();
		});
		if (!GfState.hasNativeExtension) minimize.enabled = false;
		array.push(minimize);
		
		var maxrest = new GfButton("maxrest", GfConfig.sprButtons, 1, function(button) {
			if (GfState.isMaximized) {
				GfState.restore();
			} else GfState.maximize();
			reset();
		});
		maxrest.update = function(b) {
			b.subimg = GfState.isMaximized ? 2 : 1;
			b.enabled = GfConfig.canResize;
		}
		array.push(maxrest);
		
		var close = new GfButton("close", GfConfig.sprButtons, 3, function(_) {
			Sys.exit(0);
		});
		close.drawUnderlay = function(b, _x, _y, _width, _height) {
			var _alpha = 0.;
			if (b.pressed) {
				_alpha = 0.7;
				b.fade = 1;
			} else {
				var dt = NativeDate.deltaTime / 1000000;
				if (b.hover) {
					if (b.fade < 1) {
						b.fade = Mathf.max(b.fade, 0.5);
						b.fade = Mathf.min(b.fade + dt / fadeTime, 1);
					}
				} else if (b.fade > 0) {
					b.fade = Mathf.max(b.fade - dt / fadeTime, 0);
				}
				_alpha = GfConfig.alpha * b.fade;//ease_inout_expo(fade, 0, 1, 1);
			}
			GfConfig.sprPixel.drawStretchedExt(0,
				_x, _y, _width, _height,
				0x2311E8, _alpha);
		}
		array.push(close);
	}
}
