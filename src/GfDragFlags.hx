package ;

/**
 * ...
 * @author 
 */
@:keep @:native("game_frame_drag_flag")
class GfDragFlags {
	public static inline var None = 0;
	public static inline var Left = 1;
	public static inline var Top = 2;
	public static inline var Right = 4;
	public static inline var Bottom = 8;
	public static inline var Move = 16;
	public static inline var Unmax = 32;
	public static inline var TopLeft = Top | Left;
	public static inline var TopRight = Top | Right;
	public static inline var BottomLeft = Bottom | Left;
	public static inline var BottomRight = Bottom | Right;
}