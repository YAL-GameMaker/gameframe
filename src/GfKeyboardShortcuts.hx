package ;
import gml.input.KeyCode;
import gml.input.Keyboard;
import gml.input.Window;

/**
 * ...
 * @author 
 */
@:native("gameframe.tools.keyctl")
class GfKeyboardShortcuts {
	static var up = createKey(KeyCode.Up);
	static var down = createKey(KeyCode.Down);
	static var keys:Array<GfKeyboardKey> = [up, down];
	static function createKey(keyCode:KeyCode):GfKeyboardKey {
		return { keyCode: keyCode, down: false, pressed: false };
	}
	static inline function resetKey(key:GfKeyboardKey) {
		key.down = false;
	}
	static function updateKey(key:GfKeyboardKey) {
		var down0 = key.down;
		var down1 = Keyboard.rawValue(key.keyCode) != 0;
		key.pressed = !down0 && down1;
		key.down = down1;
	}
	public static function reset() {
		for (i in 0 ... keys.length) {
			resetKey(keys[i]);
		}
	}
	public static function update() {
		if (Window.hasFocus && (Keyboard.rawValue(0x5B) != 0 || Keyboard.rawValue(0x5C) != 0)) {
			// ->
		} else {
			reset();
			return;
		}
		for (i in 0 ... keys.length) {
			updateKey(keys[i]);
		}
		if (up.pressed) {
			if (GfConfig.canResize) GfState.maximize();
		} else if (down.pressed) {
			if (GfState.isMaximized) {
				if (GfConfig.canResize) GfState.restore();
			} else GfState.minimize();
		}
	}
}
typedef GfKeyboardKey = { keyCode:KeyCode, down:Bool, pressed:Bool }