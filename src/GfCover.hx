package ;
import tools.*;
import gml.input.Window;

/**
 * Just because you told Windows to resize the window, it doesn't mean that it will,
 * and neither does it mean that your window will be the size you asked.
 * @author YellowAfterlife
 */
@:native("gameframe_cover")
class GfCover {
	static var checkForSuccess = false;
	static var ignoreRect = new GfRect();
	static var canIgnore = false;
	static var currRect = new GfRect();
	
	public static function ensure() {
		var _just_changed = checkForSuccess;
		if (_just_changed) checkForSuccess = false;
		var _target_rect;
		if (Window.fullscreen) {
			canIgnore = false;
			return;
		} else if (GfState.isFullscreen) {
			_target_rect = GfMonitor.getActive().screen;
		} else if (GfState.isMaximized) {
			_target_rect = GfMonitor.getActive().workspace;
		} else {
			canIgnore = false;
			return;
		}
		currRect.getWindowRect();
		if (!currRect.equals(_target_rect)) {
			if (_just_changed) {
				canIgnore = true;
				ignoreRect.setTo(_target_rect);
				if (GfConfig.debug) Gameframe.log("[cover] Resize failed - ignoring");
				return;
			}
			if (canIgnore && _target_rect.equals(ignoreRect)) return;
			if (GfConfig.debug) 
				Gameframe.log("[cover] Adjusting window rectangle to", _target_rect);
			_target_rect.setWindowRect();
			checkForSuccess = true;
		}
	}
}