package ;
import gml.assets.Sprite;
import gml.ds.Color;
import gml.input.Window;

/**
 * ...
 * @author 
 */
@:native("gameframe_draw")
@:doc class GfRender {
	#if sfgml.modern
	@:noDoc public static inline function draw9slice(spr:Sprite, subimg:Int, x:Int, y:Int, w:Int, h:Int, c:Color, a:Float, fill:Bool) {
		spr.drawStretchedExt(subimg, x, y, w, h, c, a);
	}
	#else
	@:native("9slice")
	@:noDoc public static function draw9slice(spr:Sprite, subimg:Int, x:Int, y:Int, w:Int, h:Int, c:Color, a:Float, fill:Bool) {
		var sw = spr.width;
		var sw1 = sw >> 1;
		var sw2 = sw >> 2;
		var sw3 = sw - sw2;
		var sh = spr.height;
		var sh1 = sh >> 1;
		var sh2 = sh >> 2;
		var sh3 = sh - sh2;
		inline function part(pl:Int, pt:Int, pw:Int, ph:Int, x:Int, y:Int) {
			spr.drawPartExt(subimg, pl, pt, pw, ph, x, y, 1, 1, c, a);
		}
		part(0, 0, sw2, sh2, x, y);
		part(sw3, 0, sw2, sh2, x + w - sw2, y);
		part(0, sh3, sw2, sh2, x, y + h - sh2);
		part(sw3, sh3, sw2, sh2, x + w - sw2, y + h - sh2);
		inline function stretch(pl:Int, pt:Int, pw:Int, ph:Int, x:Int, y:Int, w:Int, h:Int) {
			spr.drawPartExt(subimg, pl, pt, pw, ph, x, y, w / pw, h / ph, c, a);
		}
		stretch(sw2, 0, sw1, sh2, x + sw2, y, w - sw1, sh2); // T
		stretch(sw2, sh3, sw1, sh2, x + sw2, y + h - sh2, w - sw1, sh2); // B
		stretch(0, sh2, sw2, sh1, x, y + sh2, sw2, h - sh1); // L
		stretch(sw3, sh2, sw2, sh1, x + w - sw2, y + sh2, sw2, h - sh1); // R
		
		if (fill) stretch(sw2, sh2, sw1, sh1, x + sw2, y + sh2, w - sw1, h - sh1);
	}
	#end
	
	/**
	 * Should be called in **Draw GUI** event to draw the frame.  
	 * If you don't rely on drawing logic, you may opt out of doing this when alpha is close to 0
	 * or you otherwise know that you don't need the frame.
	 */
	@:expose("gameframe_draw")
	@:keep public static function draw() {
		if (!Gameframe.isReady) return;
		if (Window.fullscreen || GfState.isFullscreen) return;
		
		var gw = Window.width;
		var gh = Window.height;
		untyped __display_set_gui_maximise_base(browser_width/gw, browser_height/gh, (gw%2)/-2, (gh%2)/-2);
		var _borderWidth = GfState.getBorderWidth();
		var _titlebarHeight = GfCaption.getHeight();
		var _buttons_x = GfButtons.getCombinedOffset(gw);
		
		if (!GfState.isMaximized) GfCaption.drawBorder(0, 0, gw, gh);
		GfCaption.drawBackground(_borderWidth, _borderWidth, gw-_borderWidth*2, _titlebarHeight, _buttons_x);
		GfCaption.drawText(_borderWidth, _borderWidth, _buttons_x-_borderWidth, _titlebarHeight);
		GfButtons.draw(_buttons_x, _borderWidth, _titlebarHeight);
		
		untyped __display_gui_restore();
	}
}