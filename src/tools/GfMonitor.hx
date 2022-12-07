package tools;
import gml.Syntax;
import gml.ds.ArrayList;
import gml.input.Display;
import gml.input.Window;

/**
 * ...
 * @author 
 */

@:native("gameframe_tools_mon")
class GfMonitor {
	static var getActive_list:ArrayList<GfMonInfo> = null;
	static var dummy:GfMonInfo = null;
	public static function getActive():GfMonInfo {
		var _list = getActive_list;
		if (_list == null) {
			_list = new ArrayList();
			getActive_list = _list;
		}
		var _count:Int = GfNative.get_monitors(_list);
		var _cx = Window.x + Syntax.div(Window.width, 2);
		var _cy = Window.y + Syntax.div(Window.height, 2);
		for (i in 0 ... _count) {
			var _item = _list[i];
			var _mntr = _item.screen;
			if (_cx >= _mntr.x && _cy >= _mntr.y && _cx < _mntr.right && _cy < _mntr.bottom) return _item;
		}
		var _item = _list[0];
		if (_item == null) {
			_item = dummy;
			if (_item == null) {
				_item = {
					screen: new GfRect(0, 0, Display.width, Display.height),
					workspace: new GfRect(0, 0, Display.width, Display.height - 40),
					flags: 0x0,
				};
				dummy = _item;
			}
			_list[0] = _item;
		}
		return _item;
	}
}
@:gml.linear typedef GfMonInfo = {
	var screen:GfRect;
	var workspace:GfRect;
	var flags:Int;
}