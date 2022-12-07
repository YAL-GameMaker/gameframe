package ;
import gml.NativeDate;
import gml.Syntax;
import gml.assets.Sprite;

/**
 * The following functions allow you to manipulate the existing buttons
 * (minimize/maximize/close) or create your own.
 * @dmdPath ["gameframe_button_api", "Buttons"]
 * @dmdOrder 1
 * @author YellowAfterlife
 */
@:build(tools.AccessorGenerator.build())
@:keep @:native("game_frame_button")
class GfButton {
	/**
		Creates a new button.\
		Don't forget to add it to [GfButtons.array] afterwards!
		
		The [name](get_name) can be anything and is only useful to you.\
		[icon](get_icon) is a sprite displayed in the middle of the button.\
		[subimg](get_subimg) is the subimage to use from that sprite.\
		[onClick](get_click) is the click handler for the button.
	**/
	@:doc public function new(name:String, icon:Sprite, subimg:Int, onClick:GfButton->Void) {
		this.name = name;
		this.icon = icon;
		this.subimg = subimg;
		this.click = onClick;
	}
	
	/** Button names exist purely for telling them apart. */
	@:doc public var name:String;
	
	/** Stores arbitrary user-defined values and can be used to attach additional metadata/state to the button. */
	@:doc public var custom:Any;
	
	/**
	 * @dmdPrefix Icon:
	 * A sprite to be used for the button's icon
	 * (drawn by the default [get_drawIcon] and used for measurement)
	 */
	@:doc public var icon:Sprite;
	
	/** Subimage of above sprite to use */
	@:doc public var subimg:Int;
	
	/**
	 * @dmdPrefix Margins:
	 * Empty space to add to the left of the button
	 */
	@:doc public var marginLeft = 0;
	
	/** Empty space to add to the right of the button */
	@:doc public var marginRight = 0;
	
	/**
	 * @dmdPrefix State:
	 * Indicates whether the mouse is over the button.
	 */
	@:doc public var hover = false;
	
	/**
	 * Indicates whether the button is currently being held down.  
	 * (note that the mouse may no longer be over the button while doing so)
	 */
	@:doc public var pressed = false;
	
	/**
	 * Indicates whether the button is active.  
	 * (setting this to `false` disables interactions with it).
	 */
	@:doc public var enabled = true;
	
	/** A helper variable for fade effect, usually modified by [get_drawUnderlay]. */
	@:doc public var fade = 0.;
	
	/**
	 * @dmdPrefix Handlers:
	 * Executed when the button is clicked.  
	 * Receives a button reference as the first argument.
	 */
	@:doc public var click:(button:GfButton)->Void;
	
	/**
	 * A function/script that takes a button and should return the button's width in pixels.  
	 * By default, returns the button sprite's width.
	 */
	@:doc public var getWidth:(button:GfButton)->Int = getWidth_default;
	@:noDoc static function getWidth_default(b:GfButton) {
		return b.icon.width;
	}
	
	/**
	 * Ran during update loop. Takes a button.  
	 * Can be used for things like calling icon/subimg/enabled to reflect button's state.  
	 * The default maximize/restore button uses this to change state.
	 */
	@:doc public var update:(button:GfButton)->Void = update_default;
	@:noDoc public static function update_default(b:GfButton) {}
	
	/**
	 * Should draw a button's underlay at specified location.  
	 * Takes (button, x, y, width, height).  
	 * By default, draws a rectangle and does fade in/out based on button state.  
	 * Note that the default "close" button has its own handler for a red highlight!
	 */
	@:doc public var drawUnderlay:(button:GfButton, x:Float, y:Float, width:Float, height:Float)->Void = drawUnderlay_default;
	@:noDoc static function drawUnderlay_default(b:GfButton, x:Float, y:Float, width:Float, height:Float) {
		var alpha;
		if (!b.enabled) {
			alpha = 0.;
		} else if (b.pressed) {
			alpha = 0.7;
			b.fade = 1;
		} else {
			var dt = NativeDate.deltaTime / 1000000;
			if (b.hover) {
				if (b.fade < 1) b.fade = Math.min(b.fade + dt / GfButtons.fadeTime, 1);
			} else if (b.fade > 0) {
				b.fade = Math.max(b.fade - dt / GfButtons.fadeTime, 0);
			}
			alpha = b.fade * 0.3;//ease_inout_expo(fade, 0, 1, 1);
		}
		GfConfig.sprPixel.drawStretchedExt(0,
			x, y, width, height,
			GfConfig.blend, GfConfig.alpha * alpha
		);
	}
	
	/**
	 * Should draw the button icon at the specified location.  
	 * Takes (button, x, y, width, height).  
	 * By default, this draws the button's sprite amid the area.
	 */
	@:doc public var drawIcon:(button:GfButton, x:Float, y:Float, width:Float, height:Float)->Void = drawIcon_default;
	@:noDoc static function drawIcon_default(b:GfButton, x:Float, y:Float, width:Float, height:Float) {
		var icon = b.icon;
		var scale = GfState.effectiveScale;
		icon.drawExt(b.subimg,
			x + Syntax.div(width - icon.width * scale, 2) + Std.int(icon.offsetX * scale),
			y + Syntax.div(height - icon.height * scale, 2) + Std.int(icon.offsetY * scale),
			scale, scale, 0,
			GfConfig.blend, GfConfig.alpha * (b.enabled ? 1 : 0.3)
		);
	}
}