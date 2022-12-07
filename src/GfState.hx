package ;
import gml.input.Window;
import tools.GfMonitor;
import tools.GfNative;
import tools.GfRect;

/**
 * @dmdPath ["gameframe_state", "State"]
 * @author 
 */
@:doc @:keep @:native("gameframe")
class GfState {
	@:noDoc public static var effectiveScale = 1.;
	
	/**
	 * If the user gets rid of the DLL, extension will run in reduced mode.
	 */
	public static var hasNativeExtension = false;
	
	/**
	 * Can be read to figure out whether the mouse is currently over the border/titlebar -
	 * you should not be handling mouse press events when it is
	 */
	public static var mouseOverFrame = false;
	
	@:noDoc @:native("isMaximized_hx")
	public static var isMaximized = false;
	
	/** Whether the window is currently in borderless fullscreen mode */
	@:noDoc @:native("isFullscreen_hx")
	public static var isFullscreen = false;
	
	@:noDoc @:native("restoreRect_hx")
	public static var restoreRect = new GfRect();
	
	public static function minimize() {
		if (GfNative.is_natively_minimized()) return;
		GfButtons.reset();
		GfDelay.call0(1, () -> {
			GfButtons.waitForMovement = true;
			GfButtons.waitForMovementX = Window.mouseX;
			GfButtons.waitForMovementY = Window.mouseY;
			GfNative.syscommand(0xF020); // min
		});
	}
	@:noDoc public static function minimise():Void {
		inline minimize();
	}
	
	/**
	 * Returns whether the window is currently minimized.
	 */
	public static function isMinimized():Bool {
		return GfNative.is_natively_minimized();
	}
	@:noDoc public static function isMinimised() {
		return inline isMinimized();
	}
	
	/**
	 * Maximizes the window (much like pressing the button would)
	 */
	public static function maximize() {
		if (isMaximized || isFullscreen || Window.fullscreen) return;
		isMaximized = true;
		storeRect();
		maximize_1();
	}
	@:noDoc public static function maximise() inline maximize();
	
	/**
	 * Returns whether the window is currently maximized.
	 */
	@:native("is_maximized")
	public static function getMaximized() return isMaximized;
	
	@:noDoc @:native("is_maximised")
	public static function getMaximised() return isMaximized;
	
	@:noDoc static function maximize_1() {
		var _work = GfMonitor.getActive().workspace;
		if (GfConfig.debug) Gameframe.log("maximize: ", _work);
		_work.setWindowRect();
		GfNative.set_shadow(false);
	}
	@:noDoc static function storeRect() {
		restoreRect.getWindowRect();
		if (GfConfig.debug) Gameframe.log("storeRect: ", restoreRect);
	}
	
	/**
	 * Restores the window to non-maximized, non-full-screen state.
	 */
	public static function restore(_force = false) {
		if (Window.fullscreen) {
			Window.fullscreen = false;
			GfDelay.call0(1, () -> { restore(); });
			return;
		}
		if (!_force && !isMaximized && !isFullscreen) return;
		isMaximized = false;
		isFullscreen = false;
		var _rect = restoreRect;
		if (GfConfig.debug) Gameframe.log("restore: ", _rect);
		_rect.setWindowRect();
		GfNative.set_shadow(true);
	}
	/**
	 * Changes the fullscreen mode --{
	 * -- `0` for returning to windowed mode
	 * -- `1` for "exclusive" (DirectX) fullscreen
	 * -- `2` for borderless fullscreen
	 * }
	 */
	public static function setFullscreen(mode:Int) {
		setFullscreen_1(mode);
	}
	
	/** Returns the current fullscreen mode */
	public static function getFullscreen():Int {
		if (Window.fullscreen) return 1;
		return isFullscreen ? 2 : 0;
	}
	
	/** Returns whether the window is currently in "fake fullscreen" (mode=2) mode */
	public static function isFullscreenWindow() {
		return !Window.fullscreen && isFullscreen;
	}
	
	@:noDoc public static function setFullscreen_1(_mode:Int, _wasFullscreen = false) {
		if (GfConfig.debug) Gameframe.log("setFullscreen(mode:", _mode, ", wasfs:", _wasFullscreen, ")");
		if (_mode == 1 || _mode == 2) {
			GfButtons.reset();
			GfDrag.stop();
		}
		switch (_mode) {
			case 1: // true fullscreen
				if (Window.fullscreen) return;
				if (isFullscreen) {
					restore();
					GfDelay.call0(1, function() setFullscreen_1(1));
					return;
				} else storeRect();
				Window.fullscreen = true;
			case 2: // fullscreen window
				if (Window.fullscreen) {
					Window.fullscreen = false;
					GfDelay.call0(10, function() setFullscreen_1(2, true));
					return;
				}
				if (isFullscreen) return;
				isFullscreen = true;
				if (!isMaximized && !_wasFullscreen) storeRect();
				var _rect = GfMonitor.getActive().screen;
				_rect.setWindowRect();
				GfNative.set_shadow(false);
			default: // windowed
				if (Window.fullscreen && isFullscreen) {
					Window.fullscreen = false;
					GfDelay.call0(1, function() {
						setFullscreen_1(0);
					});
					return;
				}
				if (Window.fullscreen) {
					Window.fullscreen = false;
				} else {
					if (isMaximized) {
						isFullscreen = false;
						maximize_1();
					} else restore();
				}
		}
	}
	
	@:noDoc public static function setWindowCursor(cr:WindowCursor) {
		GfConfig.currentCursor = cr;
		if (GfConfig.setCursor) {
			if (Window.mouseCursor != cr) {
				Window.mouseCursor = cr;
			}
		}
	}
	
	@:noDoc public static inline function getBorderWidth() {
		return isMaximized ? 0 : GfConfig.borderWidth;
	}
	
	public static function getDragFlags() {
		return GfDrag.flags;
	}
}