package tools;
import gml.input.Window;

/**
 * @author YellowAfterlife
 */
@:forward @:native("gameframe_tools_rect")
abstract GfRect(GfRectImpl) {
	public var right(get, never):Int;
	private inline function get_right() {
		return this.x + this.width;
	}
	
	public var bottom(get, never):Int;
	private inline function get_bottom() {
		return this.y + this.height;
	}
	
	public function new(x:Int = 0, y:Int = 0, w:Int = 0, h:Int = 0) {
		this = { x: x, y: y, width: w, height: h };
	}
	
	public function getWindowRect() {
		this.x = Window.x;
		this.y = Window.y;
		this.width = Window.width;
		this.height = Window.height;
	}
	public function setWindowRect() {
		Window.setRect(this.x, this.y, this.width, this.height);
	}
	public function equals(o:GfRect) {
		return this.x == o.x
			&& this.y == o.y
			&& this.width == o.width
			&& this.height == o.height;
	}
	public function setTo(o:GfRect) {
		this.x = o.x;
		this.y = o.y;
		this.width = o.width;
		this.height = o.height;
	}
}
@:gml.linear typedef GfRectImpl = {
	var x:Int;
	var y:Int;
	var width:Int;
	var height:Int;
}