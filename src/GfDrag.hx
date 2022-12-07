package ;
import gml.Mathf;
import gml.input.Display;
import gml.input.Window;

/**
 * ...
 * @author 
 */
@:keep @:native("gameframe_drag")
class GfDrag {
	public static var flags = 0x0;
	public static var mx = 0;
	public static var my = 0;
	public static var left = 0;
	public static var top = 0;
	public static var right = 0;
	public static var bottom = 0;
	public static function start(_flags:Int) {
		flags = _flags;
		mx = Std.int(Display.mouseX);
		my = Std.int(Display.mouseY);
		left = Window.x;
		top = Window.y;
		right = left + Window.width;
		bottom = top + Window.height;
	}
	public static function stop() {
		flags = GfDragFlags.None;
	}
	public static inline function setRect(x:Int, y:Int, w:Int, h:Int) {
		Window.setRect(x, y, w, h);
	}
	public static function update() {
		if (flags == GfDragFlags.None) return;
		var _mx = Std.int(Display.mouseX);
		var _my = Std.int(Display.mouseY);
		switch (flags) {
			case GfDragFlags.Move:
				Window.move(
					_mx - (mx - left),
					_my - (my - top)
				);
				
			case GfDragFlags.Unmax:
				if (Mathf.dist2d(_mx, _my, mx, my) > 5) {
					var _x, _y = my - top;
					if (mx - left < (right - left) / 2) {
						_x = Mathf.min(mx - left, GfState.restoreRect.width >> 1);
					} else {
						_x = Mathf.max(GfState.restoreRect.width + mx - right, GfState.restoreRect.width >> 1);
					}
					GfState.isMaximized = false;
					setRect(_mx - _x, _my - _y, GfState.restoreRect.width, GfState.restoreRect.height);
					start(GfDragFlags.Move);
					//trace(_x);
				}
				
			case GfDragFlags.Left:
				var _x = _mx - (mx - left);
				setRect(_x, top, right - _x, bottom - top);
				
			case GfDragFlags.Top:
				var _y = _my - (my - top);
				setRect(left, _y, right - left, bottom - _y);
				
			case GfDragFlags.Right:
				setRect(left, top, right - left - mx + _mx, bottom - top);
				
			case GfDragFlags.Bottom:
				setRect(left, top, right - left, bottom - top - my + _my);
				
			
			case GfDragFlags.TopLeft:
				var _x = _mx - (mx - left);
				var _y = _my - (my - top);
				setRect(_x, _y, right - _x, bottom - _y);
				
			case GfDragFlags.BottomLeft:
				var _x = _mx - (mx - left);
				setRect(_x, top, right - _x, bottom - top - my + _my);
				
			case GfDragFlags.TopRight:
				var _y = _my - (my - top);
				setRect(left, _y, right - left - mx + _mx, bottom - _y);
				
			case GfDragFlags.BottomRight:
				setRect(left, top, right - left - mx + _mx, bottom - top - my + _my);
				
		}
	}
}