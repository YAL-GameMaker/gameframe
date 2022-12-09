package ;
import gml.assets.Asset;
import gml.assets.Sprite;
import gml.ds.Color;
import gml.input.Window.WindowCursor;

/**
 * @dmdPath ["gameframe_config", "Configuration"]
 * @author YellowAfterlife
 */
@:doc @:keep @:native("gameframe")
class GfConfig {
	/**
	 * @dmdPrefix Essentials:
	 * If enabled, logs semi-important events to output.
	 */
	public static var debug = false;
	
	/** Can be set to quickly apply color blending to default elements */
	public static var blend = Color.white;
	
	/** Can be set to quickly apply an alpha multiplier to default elements */
	public static var alpha = 1.0;
	
	
	/**
	 * Can be set to `false` to disable all input polling.
	 * A common use case is to fade out the frame (using [alpha]) and disable polling
	 * when your game is in "play" state to avoid dealing with window border UI.
	 */
	public static var canInput = true;
	
	/** Can be set to `false` to disable resizing and maximize/restore button */
	public static var canResize = true;
	
	/** Clicking this close (in pixels) to the window edge initiates the resize operation, if enabled */
	public static var resizePadding = 6;
	/** Effective width of window border (see [sprBorder]), used for deciding where to draw the window buttons */
	public static var borderWidth = 2;
	
	/**
	 * @dmdPrefix Sprites:
	 * Outer window border (9-slice, 2 frames - inactive, active)
	 */
	public static var sprBorder:Sprite = Asset.find("spr_window_border");
	/** Window caption (9-slice, 2 frames - inactive, active) */
	public static var sprCaption:Sprite = Asset.find("spr_window_caption");
	/** Window button icons (4 frames - minimize, maximize, restore, close) */
	public static var sprButtons:Sprite = Asset.find("spr_window_buttons");
	/** A white square to be stretched when drawing colored rectangles */
	public static var sprPixel:Sprite = Asset.find("spr_window_pixel");
	
	/**
	 * @dmdPrefix Cursor:
	 * This is the cursor that will be shown for the middle of the window.
	 */
	public static var defaultCursor:WindowCursor = WindowCursor.arrow;
	
	/** If set to false, the extension will not try changing the cursor at all */
	public static var setCursor:Bool = true;
	
	/**
	 * If [setCursor] is false, you can read this to see what cursor the extension wanted to show
	 * and show your own. Check after [Gameframe.update]!
	 */
	public static var currentCursor:WindowCursor = WindowCursor.arrow;
	
	/**
	 * If you want to support multiple DPI levels, you can calculate
	 * `display_get_dpi_x()/96`, provide a set of sprites and fonts for the nearest size,
	 * and set this variable to the scale of the set you have provided - extension
	 * will then scale those to effective size
	 * (e.g. if you provided assets for 2x scale, but the system uses 1.5x,
	 * frame UI will be drawn at 0.75x scale to compensate)
	 * 
	 * *NOTE:* GMS1.4 does not support DPI scaling, `display_get_dpi_x` always returns 96.
	 */
	public static var dpiScale = 1.;
}