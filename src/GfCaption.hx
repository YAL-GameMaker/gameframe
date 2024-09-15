package ;
import gml.Draw;
import gml.Syntax;
import gml.assets.Font;
import gml.assets.Sprite;
import gml.ds.Color;
import gml.gpu.GPU;
import gml.gpu.Surface;
import gml.gpu.TextAlign;
import gml.input.Window;

/**
 * @dmdPath ["gameframe_caption", "Caption & border"]
 * @author YellowAfterlife
 */
@:doc @:keep @:native("gameframe_caption")
class GfCaption {
	/**
	 * Drawn in caption area by the default [drawText].  
	 * Is initially set to value of `window_get_caption()`.
	 */
	public static var text:String = Window.caption;
	
	/**
	 * If you want to fade out the caption but keep the window border,
	 * you can change this instead of [GfConfig.alpha]
	 */
	public static var alpha:Float = 1;
	
	/** If set, is used for drawing the above */
	public static var font:Font = Font.defValue;
	
	/**
	 * Similarly
	 */
	public static var textColor:Color = Color.white;
	
	/** Text alignment for the caption */
	public static var textAlign:TextAlign = TextAlign.Left;
	
	/** If set, drawn in caption area by the default [drawText] implementation */
	public static var icon:Sprite = Sprite.defValue;
	
	/** Number of pixels between the edges of the caption and the icon/text */
	public static var margin = 6;
	
	/** Number of pixels between the icon and the text */
	public static var iconMargin = 4;
	
	/**
	 * Titlebar area height, in pixels.  
	 * If set to a negative value, is measured in a multiplier of [GfConfig.sprCaption]'s height
	 * (default -1 being 1x the height).
	 */
	public static var heightNormal:Float = -1;
	
	/**
	 * Titlebar area height while maximized, same rules as above.
	 * (default -2/3 being 2/3x of the sprite's height).
	 */
	public static var heightMaximized:Float = -0.66667;
	
	/** Returns current height (depending on whether the window is maximized) */
	public static function getHeight():Int {
		var h = GfState.isMaximized ? heightMaximized : heightNormal;
		if (h > 0) return Std.int(h);
		return Math.round( -h * GfConfig.sprCaption.height * GfState.effectiveScale);
	}
	
	/**
	 * Returns the amount of vertical overlap between the window caption and the game's
	 * `application_surface`, _in surface pixels_ and assuming proportional scaling mode.
	 * 
	 * This can be used to adjust non-GUI-layer game elements to not overlap te window caption.
	 * 
	 * If the window is currently in one of the fullscreen modes, returns 0.
	 */
	public static function getOverlap() {
		if (Window.fullscreen || GfState.isFullscreen) return 0.;
		var h = getHeight();
		var rect:Array<Float> = (untyped application_get_position)();
		var surf:Surface = (untyped application_surface);
		var scale = (rect[2] - rect[0]) / surf.width;
		return Math.max(0, h - rect[1]) / scale;
	}
	
	/**
	 * @dmdPrefix Drawing callbacks:
	 * Is called to draw the outer window border.  
	 * Takes (x, y, width, height).  
	 * By default, this will draw [GfConfig.sprBorder].
	 */
	public static var drawBorder:(x:Int, y:Int, width:Int, height:Int)->Void = drawBorder_default;
	@:noDoc static function drawBorder_default(_x:Int, _y:Int, _width:Int, _height:Int) {
		GfRender.draw9slice(GfConfig.sprBorder, Window.hasFocus ? 1 : 0,
			_x, _y, _width, _height,
			GfConfig.blend, GfConfig.alpha, false);
	}
	
	/**
	 * Is called to draw the window caption background.  
	 * By default, this will draw [GfConfig.sprCaption]
	 */
	public static var drawBackground:(x:Int, y:Int, width:Int, height:Int, buttonsX:Int)->Void = drawCaptionRect_default;
	@:noDoc static function drawCaptionRect_default(_x:Int, _y:Int, _width:Int, _height:Int, _buttons_x:Int):Void {
		GfRender.draw9slice(GfConfig.sprCaption, Window.hasFocus ? 1 : 0,
			_x, _y, _width, _height,
			GfConfig.blend, GfConfig.alpha * alpha, true);
	}
	
	/**
	 * Is called to draw the window caption text.  
	 * By default, this will draw [icon] and [text] using [font] (if set).
	 */
	public static var drawText:(x:Float, y:Float, width:Int, height:Int)->Void = drawCaptionText_default;
	@:noDoc static function drawCaptionText_default(_x:Float, _y:Float, _width, _height):Void {
		var dpiScale = GfState.effectiveScale;
		var _right = _x + _width;
		// icon:
		_x += margin * dpiScale;
		var icon:Sprite = icon;
		if (icon != Sprite.defValue) {
			icon.drawExt( -1,
				Std.int(_x + icon.offsetX * dpiScale),
				_y + Syntax.div(_height - icon.height * dpiScale, 2) + icon.offsetY * dpiScale,
				dpiScale, dpiScale, 0, gml.ds.Color.white, alpha * GfConfig.alpha);
			_x += (icon.width + iconMargin) * dpiScale;
		}
		
		//
		var text = text;
		if (text == "") return;
		
		var _newFont = font;
		var _newColor = textColor;
		#if sfgml_next
		var _h = GPU.halign;
		var _v = GPU.valign;
		var _oldFont:Font;
		if (_newFont != Font.defValue) {
			_oldFont = GPU.font;
			GPU.font = _newFont;
		} else _oldFont = Font.defValue;
		var _oldColor = GPU.color;
		#else
		if (_newFont != Font.defValue) GPU.font = _newFont;
		#end
		
		GPU.color = textColor;
		GPU.halign = textAlign;
		GPU.valign = TextAlign.Top;
		var _alpha = GPU.alpha;
		var _textWidth = _right - _x;
		GPU.alpha = GfConfig.alpha * alpha;
		Draw.textExtTransformed(
			_x + Syntax.div((textAlign:Int) * _textWidth, 2),
			_y + Syntax.div(_height - Draw.textHeightExt(text, -1, _textWidth) * dpiScale, 2),
			text, -1, _textWidth,
			dpiScale, dpiScale, 0);
		GPU.alpha = _alpha;
		
		#if sfgml_next
		if (_newFont != Font.defValue) GPU.font = _oldFont;
		GPU.color = _oldColor;
		GPU.halign = _h;
		GPU.valign = _v;
		#end
	}
}