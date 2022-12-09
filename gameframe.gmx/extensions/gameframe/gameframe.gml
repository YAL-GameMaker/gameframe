#define gameframe_preinit
// Generated at 2022-12-09 04:53:13 (1149ms) for v1.4.1804+
/// @lint nullToAny true
// Feather disable all
//{ prototypes
globalvar mq_game_frame_button; mq_game_frame_button = [undefined, /* 1:name */undefined, /* 2:custom */undefined, /* 3:icon */undefined, /* 4:subimg */0, /* 5:margin_left */0, /* 6:margin_right */0, /* 7:hover */undefined, /* 8:pressed */undefined, /* 9:enabled */undefined, /* 10:fade */0, /* 11:click */undefined, /* 12:get_width */0, /* 13:update */undefined, /* 14:draw_underlay */undefined, /* 15:draw_icon */undefined];
globalvar mq_gameframe_delayed_item; mq_gameframe_delayed_item = [undefined, /* 1:func */undefined, /* 2:time */0, /* 3:arg0 */undefined, /* 4:arg1 */undefined, /* 5:arg2 */undefined, /* 6:arg3 */undefined];
globalvar mq_gameframe_std_haxe_class; mq_gameframe_std_haxe_class = [undefined, /* 1:marker */undefined, /* 2:index */0, /* 3:name */undefined, /* 4:superClass */undefined, /* 5:constructor */undefined];
//}
//{ functions
globalvar f_gameframe_init_lf; f_gameframe_init_lf = asset_get_index("gameframe_init_lf");
globalvar f_game_frame_button_draw_icon_default; f_game_frame_button_draw_icon_default = asset_get_index("game_frame_button_draw_icon_default");
globalvar f_game_frame_button_draw_underlay_default; f_game_frame_button_draw_underlay_default = asset_get_index("game_frame_button_draw_underlay_default");
globalvar f_game_frame_button_update_default; f_game_frame_button_update_default = asset_get_index("game_frame_button_update_default");
globalvar f_game_frame_button_get_width_default; f_game_frame_button_get_width_default = asset_get_index("game_frame_button_get_width_default");
globalvar f_gameframe_button_add_defaults_lf; f_gameframe_button_add_defaults_lf = asset_get_index("gameframe_button_add_defaults_lf");
globalvar f_gameframe_button_add_defaults_lf1; f_gameframe_button_add_defaults_lf1 = asset_get_index("gameframe_button_add_defaults_lf1");
globalvar f_gameframe_button_add_defaults_update; f_gameframe_button_add_defaults_update = asset_get_index("gameframe_button_add_defaults_update");
globalvar f_gameframe_button_add_defaults_lf2; f_gameframe_button_add_defaults_lf2 = asset_get_index("gameframe_button_add_defaults_lf2");
globalvar f_gameframe_button_add_defaults_draw_underlay; f_gameframe_button_add_defaults_draw_underlay = asset_get_index("gameframe_button_add_defaults_draw_underlay");
globalvar f_gameframe_minimize_lf; f_gameframe_minimize_lf = asset_get_index("gameframe_minimize_lf");
globalvar f_gameframe_minimise_lf; f_gameframe_minimise_lf = asset_get_index("gameframe_minimise_lf");
globalvar f_gameframe_restore_lf; f_gameframe_restore_lf = asset_get_index("gameframe_restore_lf");
globalvar f_gameframe_set_fullscreen_1_lf; f_gameframe_set_fullscreen_1_lf = asset_get_index("gameframe_set_fullscreen_1_lf");
globalvar f_gameframe_set_fullscreen_1_lf1; f_gameframe_set_fullscreen_1_lf1 = asset_get_index("gameframe_set_fullscreen_1_lf1");
globalvar f_gameframe_set_fullscreen_1_lf2; f_gameframe_set_fullscreen_1_lf2 = asset_get_index("gameframe_set_fullscreen_1_lf2");
globalvar f_gameframe_caption_draw_border_default; f_gameframe_caption_draw_border_default = asset_get_index("gameframe_caption_draw_border_default");
globalvar f_gameframe_caption_draw_caption_rect_default; f_gameframe_caption_draw_caption_rect_default = asset_get_index("gameframe_caption_draw_caption_rect_default");
globalvar f_gameframe_caption_draw_caption_text_default; f_gameframe_caption_draw_caption_text_default = asset_get_index("gameframe_caption_draw_caption_text_default");
globalvar f_game_frame_button_click; f_game_frame_button_click = asset_get_index("game_frame_button_click");
globalvar f_game_frame_button_get_width; f_game_frame_button_get_width = asset_get_index("game_frame_button_get_width");
globalvar f_game_frame_button_update; f_game_frame_button_update = asset_get_index("game_frame_button_update");
globalvar f_game_frame_button_draw_underlay; f_game_frame_button_draw_underlay = asset_get_index("game_frame_button_draw_underlay");
globalvar f_game_frame_button_draw_icon; f_game_frame_button_draw_icon = asset_get_index("game_frame_button_draw_icon");
//}
//{ metatype
globalvar gameframe_std_haxe_type_markerValue; gameframe_std_haxe_type_markerValue = [];
globalvar mt_game_frame_button; mt_game_frame_button = gameframe_std_haxe_class_create(7, "game_frame_button");
globalvar mt_gameframe_delayed_item; mt_gameframe_delayed_item = gameframe_std_haxe_class_create(8, "gameframe_delayed_item");
globalvar mt_gameframe_std_haxe_class; mt_gameframe_std_haxe_class = gameframe_std_haxe_class_create(10, "gameframe_std_haxe_class");
//}
// gameframe:
globalvar g_gameframe_is_ready; /// @is {bool}
g_gameframe_is_ready = false;
globalvar g_gameframe_double_click_time; /// @is {number}
globalvar g_gameframe_last_title_click_at; /// @is {int}
g_gameframe_last_title_click_at = -5000;
// gameframe_button:
globalvar g_gameframe_button_array; /// @is {array<game_frame_button>}
g_gameframe_button_array = [];
globalvar g_gameframe_button_fade_time; /// @is {number}
g_gameframe_button_fade_time = 0.2;
globalvar g_gameframe_button_wait_for_movement; /// @is {bool}
g_gameframe_button_wait_for_movement = false;
globalvar g_gameframe_button_wait_for_movement_x; /// @is {number}
g_gameframe_button_wait_for_movement_x = 0.;
globalvar g_gameframe_button_wait_for_movement_y; /// @is {number}
g_gameframe_button_wait_for_movement_y = 0.;
// gameframe:
globalvar g_gameframe_debug; /// @is {bool}
g_gameframe_debug = false;
globalvar g_gameframe_blend; /// @is {int}
g_gameframe_blend = 16777215;
globalvar g_gameframe_alpha; /// @is {number}
g_gameframe_alpha = 1.0;
globalvar g_gameframe_can_input; /// @is {bool}
g_gameframe_can_input = true;
globalvar g_gameframe_can_resize; /// @is {bool}
g_gameframe_can_resize = true;
globalvar g_gameframe_resize_padding; /// @is {int}
g_gameframe_resize_padding = 6;
globalvar g_gameframe_border_width; /// @is {int}
g_gameframe_border_width = 2;
globalvar g_gameframe_spr_border; /// @is {sprite}
g_gameframe_spr_border = asset_get_index("spr_window_border");
globalvar g_gameframe_spr_caption; /// @is {sprite}
g_gameframe_spr_caption = asset_get_index("spr_window_caption");
globalvar g_gameframe_spr_buttons; /// @is {sprite}
g_gameframe_spr_buttons = asset_get_index("spr_window_buttons");
globalvar g_gameframe_spr_pixel; /// @is {sprite}
g_gameframe_spr_pixel = asset_get_index("spr_window_pixel");
globalvar g_gameframe_default_cursor; /// @is {window_cursor}
g_gameframe_default_cursor = cr_arrow;
globalvar g_gameframe_set_cursor; /// @is {bool}
g_gameframe_set_cursor = true;
globalvar g_gameframe_current_cursor; /// @is {window_cursor}
g_gameframe_current_cursor = cr_arrow;
globalvar g_gameframe_dpi_scale; /// @is {number}
g_gameframe_dpi_scale = 1.;
// gameframe:
globalvar g_gameframe_effective_scale; /// @is {number}
g_gameframe_effective_scale = 1.;
globalvar g_gameframe_has_native_extension; /// @is {bool}
g_gameframe_has_native_extension = false;
globalvar g_gameframe_mouse_over_frame; /// @is {bool}
g_gameframe_mouse_over_frame = false;
globalvar g_gameframe_isMaximized_hx; /// @is {bool}
g_gameframe_isMaximized_hx = false;
globalvar g_gameframe_isFullscreen_hx; /// @is {bool}
g_gameframe_isFullscreen_hx = false;
globalvar g_gameframe_restoreRect_hx; /// @is {gameframe_tools_rect}
g_gameframe_restoreRect_hx = gameframe_tools_rect__new();
// gameframe_caption:
globalvar g_gameframe_caption_text; /// @is {string}
g_gameframe_caption_text = window_get_caption();
globalvar g_gameframe_caption_alpha; /// @is {number}
g_gameframe_caption_alpha = 1;
globalvar g_gameframe_caption_font; /// @is {font}
g_gameframe_caption_font = -1;
globalvar g_gameframe_caption_text_align; /// @is {gml_gpu_TextAlign}
g_gameframe_caption_text_align = 0;
globalvar g_gameframe_caption_icon; /// @is {sprite}
g_gameframe_caption_icon = -1;
globalvar g_gameframe_caption_margin; /// @is {int}
g_gameframe_caption_margin = 6;
globalvar g_gameframe_caption_icon_margin; /// @is {int}
g_gameframe_caption_icon_margin = 4;
globalvar g_gameframe_caption_height_normal; /// @is {number}
g_gameframe_caption_height_normal = -1;
globalvar g_gameframe_caption_height_maximized; /// @is {number}
g_gameframe_caption_height_maximized = -0.66667;
globalvar g_gameframe_caption_draw_border; /// @is {function<x:int; y:int; width:int; height:int; void>}
g_gameframe_caption_draw_border = f_gameframe_caption_draw_border_default;
globalvar g_gameframe_caption_draw_background; /// @is {function<x:int; y:int; width:int; height:int; buttonsX:int; void>}
g_gameframe_caption_draw_background = f_gameframe_caption_draw_caption_rect_default;
globalvar g_gameframe_caption_draw_text; /// @is {function<x:number; y:number; width:int; height:int; void>}
g_gameframe_caption_draw_text = f_gameframe_caption_draw_caption_text_default;
// gameframe_cover:
globalvar g_gameframe_cover_check_for_success; /// @is {bool}
g_gameframe_cover_check_for_success = false;
globalvar g_gameframe_cover_ignore_rect; /// @is {gameframe_tools_rect}
g_gameframe_cover_ignore_rect = gameframe_tools_rect__new();
globalvar g_gameframe_cover_can_ignore; /// @is {bool}
g_gameframe_cover_can_ignore = false;
globalvar g_gameframe_cover_curr_rect; /// @is {gameframe_tools_rect}
g_gameframe_cover_curr_rect = gameframe_tools_rect__new();
// gameframe_delayed:
globalvar g_gameframe_delayed_queue; /// @is {ds_queue<gameframe_delayed_item>}
g_gameframe_delayed_queue = ds_queue_create();
globalvar g_gameframe_delayed_pool; /// @is {ds_stack<gameframe_delayed_item>}
g_gameframe_delayed_pool = ds_stack_create();
globalvar g_gameframe_delayed_frame_index; /// @is {int}
g_gameframe_delayed_frame_index = 0;
// gameframe_drag:
globalvar g_gameframe_drag_flags; /// @is {int}
g_gameframe_drag_flags = 0;
globalvar g_gameframe_drag_mx; /// @is {int}
g_gameframe_drag_mx = 0;
globalvar g_gameframe_drag_my; /// @is {int}
g_gameframe_drag_my = 0;
globalvar g_gameframe_drag_left; /// @is {int}
g_gameframe_drag_left = 0;
globalvar g_gameframe_drag_top; /// @is {int}
g_gameframe_drag_top = 0;
globalvar g_gameframe_drag_right; /// @is {int}
g_gameframe_drag_right = 0;
globalvar g_gameframe_drag_bottom; /// @is {int}
g_gameframe_drag_bottom = 0;
// gameframe.tools.keyctl:
globalvar g_gameframe_tools_keyctl_up; /// @is {GfKeyboardKey}
g_gameframe_tools_keyctl_up = gameframe_tools_keyctl_create_key(38);
globalvar g_gameframe_tools_keyctl_down; /// @is {GfKeyboardKey}
g_gameframe_tools_keyctl_down = gameframe_tools_keyctl_create_key(40);
globalvar g_gameframe_tools_keyctl_keys; /// @is {array<GfKeyboardKey>}
g_gameframe_tools_keyctl_keys = [g_gameframe_tools_keyctl_up, g_gameframe_tools_keyctl_down];
// gameframe_tools_mon:
globalvar g_gameframe_tools_mon_get_active_list; /// @is {ds_list<tools_GfMonInfo>}
g_gameframe_tools_mon_get_active_list = undefined;
globalvar g_gameframe_tools_mon_dummy; /// @is {tools_GfMonInfo}
g_gameframe_tools_mon_dummy = undefined;

//{ gameframe

#define gameframe_log
// gameframe_log(args:haxe_Rest<any>)
if (!g_gameframe_debug) return 0;
var _s = "[Gameframe]";
var __g = 0;
while (__g < argument_count) {
	var _arg = argument[__g];
	++__g;
	_s += " " + gameframe_std_Std_string(_arg);
}
show_debug_message(_s);

#define gameframe_update
// gameframe_update()
if (!g_gameframe_is_ready) return 0;
g_gameframe_effective_scale = display_get_dpi_x() / 96 / g_gameframe_dpi_scale;
g_gameframe_mouse_over_frame = false;
gameframe_delayed_update();
gameframe_cover_ensure();
if (window_get_fullscreen() || g_gameframe_isFullscreen_hx) {
	gameframe_tools_keyctl_reset();
	return 0;
}
gameframe_tools_keyctl_update();
if (!g_gameframe_isMaximized_hx && g_gameframe_has_native_extension && g_gameframe_delayed_frame_index > 3 && !gameframe_get_shadow()) gameframe_set_shadow(true);
var _mx = (window_mouse_get_x() | 0);
var _my = (window_mouse_get_y() | 0);
var _gw = window_get_width();
var _gh = window_get_height();
var __borderWidth = (g_gameframe_isMaximized_hx ? 0 : g_gameframe_border_width);
var __titleHeight = gameframe_caption_get_height();
var __buttons_x = gameframe_button_get_combined_offset(_gw);
var __flags = 0;
var __titleHit = false;
var __hitSomething = true;
var _resizePadding = g_gameframe_resize_padding;
if (!point_in_rectangle(_mx, _my, __buttons_x, __borderWidth, _gw - __borderWidth - ((g_gameframe_isMaximized_hx ? 0 : _resizePadding)), __borderWidth + __titleHeight)) {
	if (!g_gameframe_isMaximized_hx && g_gameframe_can_resize && !point_in_rectangle(_mx, _my, _resizePadding, _resizePadding, _gw - _resizePadding, _gh - _resizePadding)) {
		if (_mx < _resizePadding) __flags |= 1;
		if (_my < _resizePadding) __flags |= 2;
		if (_mx >= _gw - _resizePadding) __flags |= 4;
		if (_my >= _gh - _resizePadding) __flags |= 8;
	} else if (point_in_rectangle(_mx, _my, 0, 0, _gw, __titleHeight)) {
		__titleHit = true;
	} else __hitSomething = false;
}
g_gameframe_mouse_over_frame = __hitSomething;
if (g_gameframe_drag_flags == 0) {
	var __cursor = g_gameframe_default_cursor;
	if (g_gameframe_can_input && g_gameframe_can_resize) switch (__flags) {
		case 1: case 4: __cursor = cr_size_we; break;
		case 2: case 8: __cursor = cr_size_ns; break;
		case 3: case 12: __cursor = cr_size_nwse; break;
		case 6: case 9: __cursor = cr_size_nesw; break;
	}
	gameframe_set_window_cursor(__cursor);
}
gameframe_button_update(__buttons_x, __borderWidth, __titleHeight, _mx, _my);
if (g_gameframe_can_input && mouse_check_button_pressed(1)) {
	if (__titleHit) {
		var __now = current_time;
		if (__now < g_gameframe_last_title_click_at + g_gameframe_double_click_time) {
			if (g_gameframe_isMaximized_hx) gameframe_restore(); else gameframe_maximize();
		} else {
			g_gameframe_last_title_click_at = __now;
			if (g_gameframe_isMaximized_hx) gameframe_drag_start(32); else gameframe_drag_start(16);
		}
	} else if (__flags != 0 && g_gameframe_can_resize) {
		gameframe_drag_start(__flags);
	}
}
if (g_gameframe_can_input) {
	if (mouse_check_button_released(1)) gameframe_drag_stop(); else gameframe_drag_update();
} else if (g_gameframe_drag_flags != 0) {
	gameframe_drag_stop();
}

#define gameframe_init_lf
// gameframe_init_lf()
if (g_gameframe_isMaximized_hx || g_gameframe_isFullscreen_hx || window_get_fullscreen()) return 0;
gameframe_set_shadow(true);

#define gameframe_init
// gameframe_init()
g_gameframe_is_ready = true;
g_gameframe_has_native_extension = gameframe_check_native_extension();
g_gameframe_double_click_time = (g_gameframe_has_native_extension ? gameframe_get_double_click_time() : 500);
gameframe_init_native();
gameframe_tools_rect_get_window_rect(g_gameframe_restoreRect_hx);
gameframe_button_add_defaults();
gameframe_delayed_call_impl(f_gameframe_init_lf, 3, undefined, undefined, undefined, undefined);

//}

//{ game_frame_button

#define game_frame_button_create
// game_frame_button_create(name:string, icon:sprite, subimg:int, onClick:function<game_frame_button; void>)
var _this = [mt_game_frame_button];
array_copy(_this, 1, mq_game_frame_button, 1, 15);
/// @typedef {tuple<any,name:string,custom:any,icon:sprite,subimg:int,margin_left:int,margin_right:int,hover:bool,pressed:bool,enabled:bool,fade:number,click:function<button:game_frame_button; void>,get_width:function<button:game_frame_button; int>,update:function<button:game_frame_button; void>,draw_underlay:function<button:game_frame_button; x:number; y:number; width:number; height:number; void>,draw_icon:function<button:game_frame_button; x:number; y:number; width:number; height:number; void>>} game_frame_button
_this[@15/* draw_icon */] = f_game_frame_button_draw_icon_default;
_this[@14/* draw_underlay */] = f_game_frame_button_draw_underlay_default;
_this[@13/* update */] = f_game_frame_button_update_default;
_this[@12/* get_width */] = f_game_frame_button_get_width_default;
_this[@10/* fade */] = 0.;
_this[@9/* enabled */] = true;
_this[@8/* pressed */] = false;
_this[@7/* hover */] = false;
_this[@6/* margin_right */] = 0;
_this[@5/* margin_left */] = 0;
_this[@1/* name */] = argument[0];
_this[@3/* icon */] = argument[1];
_this[@4/* subimg */] = argument[2];
_this[@11/* click */] = argument[3];
return _this;

#define game_frame_button_get_width_default
// game_frame_button_get_width_default(b:game_frame_button)->int
var _b = argument[0];
return sprite_get_width(_b[3/* icon */]);

#define game_frame_button_update_default
// game_frame_button_update_default(b:game_frame_button)


#define game_frame_button_draw_underlay_default
// game_frame_button_draw_underlay_default(b:game_frame_button, x:number, y:number, width:number, height:number)
var _b = argument[0];
var _alpha1;
if (_b[9/* enabled */]) {
	if (_b[8/* pressed */]) {
		_alpha1 = 0.7;
		_b[@10/* fade */] = 1;
	} else {
		var _dt = delta_time / 1000000;
		if (_b[7/* hover */]) {
			if (_b[10/* fade */] < 1) _b[@10/* fade */] = min(_b[10/* fade */] + _dt / g_gameframe_button_fade_time, 1);
		} else if (_b[10/* fade */] > 0) {
			_b[@10/* fade */] = max(_b[10/* fade */] - _dt / g_gameframe_button_fade_time, 0);
		}
		_alpha1 = _b[10/* fade */] * 0.3;
	}
} else _alpha1 = 0.;
draw_sprite_stretched_ext(g_gameframe_spr_pixel, 0, argument[1], argument[2], argument[3], argument[4], g_gameframe_blend, g_gameframe_alpha * _alpha1);

#define game_frame_button_draw_icon_default
// game_frame_button_draw_icon_default(b:game_frame_button, x:number, y:number, width:number, height:number)
var _b = argument[0];
var _icon = _b[3/* icon */];
var _scale = g_gameframe_effective_scale;
draw_sprite_ext(_icon, _b[4/* subimg */], (argument[1] + ((argument[3] - sprite_get_width(_icon) * _scale) div 2) + (sprite_get_xoffset(_icon) * _scale | 0)), argument[2] + ((argument[4] - sprite_get_height(_icon) * _scale) div 2) + (sprite_get_yoffset(_icon) * _scale | 0), _scale, _scale, 0, g_gameframe_blend, g_gameframe_alpha * ((_b[9/* enabled */] ? 1 : 0.3)));

#define game_frame_button_set_name
// game_frame_button_set_name(this:game_frame_button, value:string)
var _this = argument[0];
_this[@1/* name */] = argument[1];

#define game_frame_button_get_name
// game_frame_button_get_name(this:game_frame_button)->string
var _this = argument[0];
return _this[1/* name */];

#define game_frame_button_set_custom
// game_frame_button_set_custom(this:game_frame_button, value:any)
var _this = argument[0];
_this[@2/* custom */] = argument[1];

#define game_frame_button_get_custom
// game_frame_button_get_custom(this:game_frame_button)->any
var _this = argument[0];
return _this[2/* custom */];

#define game_frame_button_set_icon
// game_frame_button_set_icon(this:game_frame_button, value:sprite)
var _this = argument[0];
_this[@3/* icon */] = argument[1];

#define game_frame_button_get_icon
// game_frame_button_get_icon(this:game_frame_button)->sprite
var _this = argument[0];
return _this[3/* icon */];

#define game_frame_button_set_subimg
// game_frame_button_set_subimg(this:game_frame_button, value:int)
var _this = argument[0];
_this[@4/* subimg */] = argument[1];

#define game_frame_button_get_subimg
// game_frame_button_get_subimg(this:game_frame_button)->int
var _this = argument[0];
return _this[4/* subimg */];

#define game_frame_button_set_margin_left
// game_frame_button_set_margin_left(this:game_frame_button, value:int)
var _this = argument[0];
_this[@5/* margin_left */] = argument[1];

#define game_frame_button_get_margin_left
// game_frame_button_get_margin_left(this:game_frame_button)->int
var _this = argument[0];
return _this[5/* margin_left */];

#define game_frame_button_set_margin_right
// game_frame_button_set_margin_right(this:game_frame_button, value:int)
var _this = argument[0];
_this[@6/* margin_right */] = argument[1];

#define game_frame_button_get_margin_right
// game_frame_button_get_margin_right(this:game_frame_button)->int
var _this = argument[0];
return _this[6/* margin_right */];

#define game_frame_button_set_hover
// game_frame_button_set_hover(this:game_frame_button, value:bool)
var _this = argument[0];
_this[@7/* hover */] = argument[1];

#define game_frame_button_get_hover
// game_frame_button_get_hover(this:game_frame_button)->bool
var _this = argument[0];
return _this[7/* hover */];

#define game_frame_button_set_pressed
// game_frame_button_set_pressed(this:game_frame_button, value:bool)
var _this = argument[0];
_this[@8/* pressed */] = argument[1];

#define game_frame_button_get_pressed
// game_frame_button_get_pressed(this:game_frame_button)->bool
var _this = argument[0];
return _this[8/* pressed */];

#define game_frame_button_set_enabled
// game_frame_button_set_enabled(this:game_frame_button, value:bool)
var _this = argument[0];
_this[@9/* enabled */] = argument[1];

#define game_frame_button_get_enabled
// game_frame_button_get_enabled(this:game_frame_button)->bool
var _this = argument[0];
return _this[9/* enabled */];

#define game_frame_button_set_fade
// game_frame_button_set_fade(this:game_frame_button, value:number)
var _this = argument[0];
_this[@10/* fade */] = argument[1];

#define game_frame_button_get_fade
// game_frame_button_get_fade(this:game_frame_button)->number
var _this = argument[0];
return _this[10/* fade */];

#define game_frame_button_set_click
// game_frame_button_set_click(this:game_frame_button, value:function<button:game_frame_button; void>)
var _this = argument[0];
_this[@11/* click */] = argument[1];

#define game_frame_button_get_click
// game_frame_button_get_click(this:game_frame_button)->function<button:game_frame_button; void>
var _this = argument[0];
return _this[11/* click */];

#define game_frame_button_set_get_width
// game_frame_button_set_get_width(this:game_frame_button, value:function<button:game_frame_button; int>)
var _this = argument[0];
_this[@12/* get_width */] = argument[1];

#define game_frame_button_get_get_width
// game_frame_button_get_get_width(this:game_frame_button)->function<button:game_frame_button; int>
var _this = argument[0];
return _this[12/* get_width */];

#define game_frame_button_set_update
// game_frame_button_set_update(this:game_frame_button, value:function<button:game_frame_button; void>)
var _this = argument[0];
_this[@13/* update */] = argument[1];

#define game_frame_button_get_update
// game_frame_button_get_update(this:game_frame_button)->function<button:game_frame_button; void>
var _this = argument[0];
return _this[13/* update */];

#define game_frame_button_set_draw_underlay
// game_frame_button_set_draw_underlay(this:game_frame_button, value:function<button:game_frame_button; x:number; y:number; width:number; height:number; void>)
var _this = argument[0];
_this[@14/* draw_underlay */] = argument[1];

#define game_frame_button_get_draw_underlay
// game_frame_button_get_draw_underlay(this:game_frame_button)->function<button:game_frame_button; x:number; y:number; width:number; height:number; void>
var _this = argument[0];
return _this[14/* draw_underlay */];

#define game_frame_button_set_draw_icon
// game_frame_button_set_draw_icon(this:game_frame_button, value:function<button:game_frame_button; x:number; y:number; width:number; height:number; void>)
var _this = argument[0];
_this[@15/* draw_icon */] = argument[1];

#define game_frame_button_get_draw_icon
// game_frame_button_get_draw_icon(this:game_frame_button)->function<button:game_frame_button; x:number; y:number; width:number; height:number; void>
var _this = argument[0];
return _this[15/* draw_icon */];

//}

//{ gameframe_button

#define gameframe_button_get_combined_width
// gameframe_button_get_combined_width()->int
var _w = 0;
var __g = 0;
var __g1 = g_gameframe_button_array;
while (__g < array_length_1d(__g1)) {
	var _b = __g1[__g];
	++__g;
	_w += _b[5/* margin_left */] + script_execute(_b[12/* get_width */], _b) + _b[6/* margin_right */];
}
return ceil(_w * g_gameframe_effective_scale);

#define gameframe_button_get_combined_offset
// gameframe_button_get_combined_offset(windowWidth:int)->int
return argument[0] - ((g_gameframe_isMaximized_hx ? 0 : g_gameframe_border_width)) - gameframe_button_get_combined_width();

#define gameframe_button_reset
// gameframe_button_reset()
var __g = 0;
var __g1 = g_gameframe_button_array;
while (__g < array_length_1d(__g1)) {
	var _b = __g1[__g];
	++__g;
	_b[@7/* hover */] = false;
	_b[@10/* fade */] = 0.;
	_b[@8/* pressed */] = false;
}

#define gameframe_button_update
// gameframe_button_update(x:number, y:number, height:int, mx:int, my:int)
var _x = argument[0], _y = argument[1], _mx = argument[3], _my = argument[4];
var _over_row = _mx >= _y && _my < _y + argument[2];
if (_over_row) {
	if (g_gameframe_has_native_extension) {
		_over_row = gameframe_mouse_in_window();
	} else {
		var _wx = window_get_x();
		var _wy = window_get_y();
		var _dmx = display_mouse_get_x();
		var _dmy = display_mouse_get_y();
		_over_row = _dmx >= _wx && _dmy >= _wy && _dmx < _wx + window_get_width() && _dmy < _wy + window_get_height();
	}
}
if (g_gameframe_button_wait_for_movement) {
	if (_mx != g_gameframe_button_wait_for_movement_x || _my != g_gameframe_button_wait_for_movement_y) g_gameframe_button_wait_for_movement = false; else _over_row = false;
}
var _dpiScale = g_gameframe_effective_scale;
var _pressed = mouse_check_button_pressed(1);
var _released = mouse_check_button_released(1);
var _disable = g_gameframe_drag_flags != 0 || !g_gameframe_can_input;
var _i = 0;
for (var __g1 = array_length_1d(g_gameframe_button_array); _i < __g1; ++_i) {
	var _button = g_gameframe_button_array[_i];
	script_execute(_button[13/* update */], _button);
	_x += _button[5/* margin_left */] * _dpiScale;
	var _width = script_execute(_button[12/* get_width */], _button) * _dpiScale;
	if (_disable || !_button[9/* enabled */]) {
		_button[@7/* hover */] = false;
		_button[@8/* pressed */] = false;
	} else if (_over_row && _mx >= _x && _mx < _x + _width) {
		_button[@7/* hover */] = true;
		if (_pressed) _button[@8/* pressed */] = true;
	} else _button[@7/* hover */] = false;
	if (_released && _button[8/* pressed */] && _button[7/* hover */]) {
		_button[@8/* pressed */] = false;
		script_execute(_button[11/* click */], _button);
	}
	_x += _width + _button[6/* margin_right */] * _dpiScale;
}

#define gameframe_button_draw
// gameframe_button_draw(x:number, y:number, height:int)
var _x = argument[0], _y = argument[1], _height = argument[2];
var _dpiScale = g_gameframe_effective_scale;
var _i = 0;
for (var __g1 = array_length_1d(g_gameframe_button_array); _i < __g1; ++_i) {
	var _button = g_gameframe_button_array[_i];
	_x += _button[5/* margin_left */] * _dpiScale;
	var _width = script_execute(_button[12/* get_width */], _button) * _dpiScale;
	script_execute(_button[14/* draw_underlay */], _button, _x, _y, _width, _height);
	script_execute(_button[15/* draw_icon */], _button, _x, _y, _width, _height);
	_x += _width + _button[6/* margin_right */] * _dpiScale;
}

#define gameframe_button_add_defaults_lf
// gameframe_button_add_defaults_lf(button:game_frame_button)
gameframe_minimize();

#define gameframe_button_add_defaults_lf1
// gameframe_button_add_defaults_lf1(button:game_frame_button)
if (g_gameframe_isMaximized_hx) gameframe_restore(); else gameframe_maximize();
gameframe_button_reset();

#define gameframe_button_add_defaults_update
// gameframe_button_add_defaults_update(b:game_frame_button)
var _b = argument[0];
_b[@4/* subimg */] = (g_gameframe_isMaximized_hx ? 2 : 1);
_b[@9/* enabled */] = g_gameframe_can_resize;

#define gameframe_button_add_defaults_lf2
// gameframe_button_add_defaults_lf2(_:game_frame_button)
game_end();

#define gameframe_button_add_defaults_draw_underlay
// gameframe_button_add_defaults_draw_underlay(b:game_frame_button, _x:number, _y:number, _width:number, _height:number)
var _b = argument[0];
var __alpha = 0.;
if (_b[8/* pressed */]) {
	__alpha = 0.7;
	_b[@10/* fade */] = 1;
} else {
	var _dt = delta_time / 1000000;
	if (_b[7/* hover */]) {
		if (_b[10/* fade */] < 1) {
			_b[@10/* fade */] = max(_b[10/* fade */], 0.5);
			_b[@10/* fade */] = min(_b[10/* fade */] + _dt / g_gameframe_button_fade_time, 1);
		}
	} else if (_b[10/* fade */] > 0) {
		_b[@10/* fade */] = max(_b[10/* fade */] - _dt / g_gameframe_button_fade_time, 0);
	}
	__alpha = g_gameframe_alpha * _b[10/* fade */];
}
draw_sprite_stretched_ext(g_gameframe_spr_pixel, 0, argument[1], argument[2], argument[3], argument[4], 2298344, __alpha);

#define gameframe_button_add_defaults
// gameframe_button_add_defaults()
var _minimize = game_frame_button_create("minimize", g_gameframe_spr_buttons, 0, f_gameframe_button_add_defaults_lf);
if (!g_gameframe_has_native_extension) _minimize[@9/* enabled */] = false;
gameframe_std_gml_internal_ArrayImpl_push(g_gameframe_button_array, _minimize);
var _maxrest = game_frame_button_create("maxrest", g_gameframe_spr_buttons, 1, f_gameframe_button_add_defaults_lf1);
_maxrest[@13/* update */] = f_gameframe_button_add_defaults_update;
gameframe_std_gml_internal_ArrayImpl_push(g_gameframe_button_array, _maxrest);
var _close = game_frame_button_create("close", g_gameframe_spr_buttons, 3, f_gameframe_button_add_defaults_lf2);
_close[@14/* draw_underlay */] = f_gameframe_button_add_defaults_draw_underlay;
gameframe_std_gml_internal_ArrayImpl_push(g_gameframe_button_array, _close);

//}

//{ gameframe_draw

#define gameframe_draw_9slice
// gameframe_draw_9slice(spr:sprite, subimg:int, x:int, y:int, w:int, h:int, c:int, a:number, fill:bool)
var _spr = argument[0], _subimg = argument[1], _x = argument[2], _y = argument[3], _w = argument[4], _h = argument[5], _c = argument[6], _a = argument[7];
var _sw = sprite_get_width(_spr);
var _sw1 = (_sw >> 1);
var _sw2 = (_sw >> 2);
var _sw3 = _sw - _sw2;
var _sh = sprite_get_height(_spr);
var _sh1 = (_sh >> 1);
var _sh2 = (_sh >> 2);
var _sh3 = _sh - _sh2;
draw_sprite_part_ext(_spr, _subimg, 0, 0, _sw2, _sh2, _x, _y, 1, 1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw3, 0, _sw2, _sh2, _x + _w - _sw2, _y, 1, 1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, 0, _sh3, _sw2, _sh2, _x, _y + _h - _sh2, 1, 1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw3, _sh3, _sw2, _sh2, _x + _w - _sw2, _y + _h - _sh2, 1, 1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw2, 0, _sw1, _sh2, _x + _sw2, _y, (_w - _sw1) / _sw1, _sh2 / _sh2, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw2, _sh3, _sw1, _sh2, _x + _sw2, _y + _h - _sh2, (_w - _sw1) / _sw1, _sh2 / _sh2, _c, _a);
draw_sprite_part_ext(_spr, _subimg, 0, _sh2, _sw2, _sh1, _x, _y + _sh2, _sw2 / _sw2, (_h - _sh1) / _sh1, _c, _a);
draw_sprite_part_ext(_spr, _subimg, _sw3, _sh2, _sw2, _sh1, _x + _w - _sw2, _y + _sh2, _sw2 / _sw2, (_h - _sh1) / _sh1, _c, _a);
if (argument[8]) draw_sprite_part_ext(_spr, _subimg, _sw2, _sh2, _sw1, _sh1, _x + _sw2, _y + _sh2, (_w - _sw1) / _sw1, (_h - _sh1) / _sh1, _c, _a);

#define gameframe_draw
// gameframe_draw()
if (!g_gameframe_is_ready) return 0;
if (window_get_fullscreen() || g_gameframe_isFullscreen_hx) return 0;
var _gw = window_get_width();
var _gh = window_get_height();
__display_set_gui_maximise_base(browser_width / _gw, browser_height / _gh, _gw % 2 / -2, _gh % 2 / -2);
var __borderWidth = (g_gameframe_isMaximized_hx ? 0 : g_gameframe_border_width);
var __titlebarHeight = gameframe_caption_get_height();
var __buttons_x = gameframe_button_get_combined_offset(_gw);
if (!g_gameframe_isMaximized_hx) script_execute(g_gameframe_caption_draw_border, 0, 0, _gw, _gh);
script_execute(g_gameframe_caption_draw_background, __borderWidth, __borderWidth, _gw - __borderWidth * 2, __titlebarHeight, __buttons_x);
script_execute(g_gameframe_caption_draw_text, __borderWidth, __borderWidth, __buttons_x - __borderWidth, __titlebarHeight);
gameframe_button_draw(__buttons_x, __borderWidth, __titlebarHeight);
__display_gui_restore();

//}

//{ gameframe_tools_rect

#define gameframe_tools_rect__new
// gameframe_tools_rect__new(...:int)->gameframe_tools_rect
var _x, _y, _w, _h;
if (argument_count > 0) _x = argument[0]; else _x = 0;
if (argument_count > 1) _y = argument[1]; else _y = 0;
if (argument_count > 2) _w = argument[2]; else _w = 0;
if (argument_count > 3) _h = argument[3]; else _h = 0;
return [/* x: */_x, /* y: */_y, /* width: */_w, /* height: */_h];

#define gameframe_tools_rect_get_window_rect
// gameframe_tools_rect_get_window_rect(this:tools_GfRectImpl)
var _this1 = argument[0];
_this1[@0/* x */] = window_get_x();
_this1[@1/* y */] = window_get_y();
_this1[@2/* width */] = window_get_width();
_this1[@3/* height */] = window_get_height();

#define gameframe_tools_rect_set_window_rect
// gameframe_tools_rect_set_window_rect(this:tools_GfRectImpl)
var _this1 = argument[0];
window_set_rectangle(_this1[0/* x */], _this1[1/* y */], _this1[2/* width */], _this1[3/* height */]);

#define gameframe_tools_rect_equals
// gameframe_tools_rect_equals(this:tools_GfRectImpl, o:gameframe_tools_rect)->bool
var _this1 = argument[0], _o = argument[1];
return _this1[0/* x */] == _o[0/* x */] && _this1[1/* y */] == _o[1/* y */] && _this1[2/* width */] == _o[2/* width */] && _this1[3/* height */] == _o[3/* height */];

#define gameframe_tools_rect_set_to
// gameframe_tools_rect_set_to(this:tools_GfRectImpl, o:gameframe_tools_rect)
var _this1 = argument[0], _o = argument[1];
_this1[@0/* x */] = _o[0/* x */];
_this1[@1/* y */] = _o[1/* y */];
_this1[@2/* width */] = _o[2/* width */];
_this1[@3/* height */] = _o[3/* height */];

//}

//{ gameframe

#define gameframe_minimize_lf
// gameframe_minimize_lf()
g_gameframe_button_wait_for_movement = true;
g_gameframe_button_wait_for_movement_x = window_mouse_get_x();
g_gameframe_button_wait_for_movement_y = window_mouse_get_y();
gameframe_syscommand(61472);

#define gameframe_minimize
// gameframe_minimize()
if (gameframe_is_natively_minimized()) return 0;
gameframe_button_reset();
gameframe_delayed_call_impl(f_gameframe_minimize_lf, 1, undefined, undefined, undefined, undefined);

#define gameframe_minimise_lf
// gameframe_minimise_lf()
g_gameframe_button_wait_for_movement = true;
g_gameframe_button_wait_for_movement_x = window_mouse_get_x();
g_gameframe_button_wait_for_movement_y = window_mouse_get_y();
gameframe_syscommand(61472);

#define gameframe_minimise
// gameframe_minimise()
if (!gameframe_is_natively_minimized()) {
	gameframe_button_reset();
	gameframe_delayed_call_impl(f_gameframe_minimise_lf, 1, undefined, undefined, undefined, undefined);
}

#define gameframe_is_minimized
// gameframe_is_minimized()->bool
return gameframe_is_natively_minimized();

#define gameframe_is_minimised
// gameframe_is_minimised()->bool
return gameframe_is_natively_minimized();

#define gameframe_maximize
// gameframe_maximize()
if (g_gameframe_isMaximized_hx || g_gameframe_isFullscreen_hx || window_get_fullscreen()) return 0;
g_gameframe_isMaximized_hx = true;
gameframe_store_rect();
gameframe_maximize_1();

#define gameframe_maximise
// gameframe_maximise()
if (!(g_gameframe_isMaximized_hx || g_gameframe_isFullscreen_hx || window_get_fullscreen())) {
	g_gameframe_isMaximized_hx = true;
	gameframe_store_rect();
	gameframe_maximize_1();
}

#define gameframe_is_maximized
// gameframe_is_maximized()->bool
return g_gameframe_isMaximized_hx;

#define gameframe_is_maximised
// gameframe_is_maximised()->bool
return g_gameframe_isMaximized_hx;

#define gameframe_maximize_1
// gameframe_maximize_1()
var __work = gameframe_std_haxe_boot_wget(gameframe_tools_mon_get_active(), 1);
if (g_gameframe_debug) gameframe_log("maximize: ", __work);
gameframe_tools_rect_set_window_rect(__work);
gameframe_set_shadow(false);

#define gameframe_store_rect
// gameframe_store_rect()
gameframe_tools_rect_get_window_rect(g_gameframe_restoreRect_hx);
if (g_gameframe_debug) gameframe_log("storeRect: ", g_gameframe_restoreRect_hx);

#define gameframe_restore_lf
// gameframe_restore_lf()
gameframe_restore();

#define gameframe_restore
// gameframe_restore(_force:bool = false)
var __force;
if (argument_count > 0) __force = argument[0]; else __force = false;
if (window_get_fullscreen()) {
	window_set_fullscreen(false);
	gameframe_delayed_call_impl(f_gameframe_restore_lf, 1, undefined, undefined, undefined, undefined);
	return 0;
}
if (!__force && !g_gameframe_isMaximized_hx && !g_gameframe_isFullscreen_hx) return 0;
g_gameframe_isMaximized_hx = false;
g_gameframe_isFullscreen_hx = false;
var __rect = g_gameframe_restoreRect_hx;
if (g_gameframe_debug) gameframe_log("restore: ", __rect);
gameframe_tools_rect_set_window_rect(__rect);
gameframe_set_shadow(true);

#define gameframe_set_fullscreen
// gameframe_set_fullscreen(mode:int)
gameframe_set_fullscreen_1(argument[0]);

#define gameframe_get_fullscreen
// gameframe_get_fullscreen()->int
if (window_get_fullscreen()) return 1;
if (g_gameframe_isFullscreen_hx) return 2; else return 0;

#define gameframe_is_fullscreen_window
// gameframe_is_fullscreen_window()->bool
return !window_get_fullscreen() && g_gameframe_isFullscreen_hx;

#define gameframe_set_fullscreen_1_lf
// gameframe_set_fullscreen_1_lf()
gameframe_set_fullscreen_1(1);

#define gameframe_set_fullscreen_1_lf1
// gameframe_set_fullscreen_1_lf1()
gameframe_set_fullscreen_1(2, true);

#define gameframe_set_fullscreen_1_lf2
// gameframe_set_fullscreen_1_lf2()
gameframe_set_fullscreen_1(0);

#define gameframe_set_fullscreen_1
// gameframe_set_fullscreen_1(_mode:int, _wasFullscreen:bool = false)
var __mode = argument[0], __wasFullscreen;
if (argument_count > 1) __wasFullscreen = argument[1]; else __wasFullscreen = false;
if (g_gameframe_debug) gameframe_log("setFullscreen(mode:", __mode, ", wasfs:", __wasFullscreen, ")");
if (__mode == 1 || __mode == 2) {
	gameframe_button_reset();
	gameframe_drag_stop();
}
switch (__mode) {
	case 1:
		if (window_get_fullscreen()) return 0;
		if (g_gameframe_isFullscreen_hx) {
			gameframe_restore();
			gameframe_delayed_call_impl(f_gameframe_set_fullscreen_1_lf, 1, undefined, undefined, undefined, undefined);
			return 0;
		} else gameframe_store_rect();
		window_set_fullscreen(true);
		break;
	case 2:
		if (window_get_fullscreen()) {
			window_set_fullscreen(false);
			gameframe_delayed_call_impl(f_gameframe_set_fullscreen_1_lf1, 10, undefined, undefined, undefined, undefined);
			return 0;
		}
		if (g_gameframe_isFullscreen_hx) return 0;
		g_gameframe_isFullscreen_hx = true;
		if (!g_gameframe_isMaximized_hx && !__wasFullscreen) gameframe_store_rect();
		gameframe_tools_rect_set_window_rect(gameframe_std_haxe_boot_wget(gameframe_tools_mon_get_active(), 0));
		gameframe_set_shadow(false);
		break;
	default:
		if (window_get_fullscreen() && g_gameframe_isFullscreen_hx) {
			window_set_fullscreen(false);
			gameframe_delayed_call_impl(f_gameframe_set_fullscreen_1_lf2, 1, undefined, undefined, undefined, undefined);
			return 0;
		}
		if (window_get_fullscreen()) {
			gameframe_restore();
		} else if (g_gameframe_isMaximized_hx) {
			g_gameframe_isFullscreen_hx = false;
			gameframe_maximize_1();
		} else gameframe_restore();
}

#define gameframe_set_window_cursor
// gameframe_set_window_cursor(cr:window_cursor)
var _cr1 = argument[0];
g_gameframe_current_cursor = _cr1;
if (g_gameframe_set_cursor) {
	if (window_get_cursor() != _cr1) window_set_cursor(_cr1);
}

#define gameframe_get_border_width
// gameframe_get_border_width()->int
if (g_gameframe_isMaximized_hx) return 0; else return g_gameframe_border_width;

#define gameframe_get_drag_flags
// gameframe_get_drag_flags()->int
return g_gameframe_drag_flags;

//}

//{ gameframe_caption

#define gameframe_caption_get_height
// gameframe_caption_get_height()->int
var _h = (g_gameframe_isMaximized_hx ? g_gameframe_caption_height_maximized : g_gameframe_caption_height_normal);
if (_h > 0) return (_h | 0);
return round(-_h * sprite_get_height(g_gameframe_spr_caption) * g_gameframe_effective_scale);

#define gameframe_caption_get_overlap
// gameframe_caption_get_overlap()->number
if (window_get_fullscreen() || g_gameframe_isFullscreen_hx) return 0.;
var _h = gameframe_caption_get_height();
var _rect = application_get_position();
return max(0, _h - _rect[1]) / ((_rect[2] - _rect[0]) / surface_get_width(application_surface));

#define gameframe_caption_draw_border_default
// gameframe_caption_draw_border_default(_x:int, _y:int, _width:int, _height:int)
gameframe_draw_9slice(g_gameframe_spr_border, (window_has_focus() ? 1 : 0), argument[0], argument[1], argument[2], argument[3], g_gameframe_blend, g_gameframe_alpha, false);

#define gameframe_caption_draw_caption_rect_default
// gameframe_caption_draw_caption_rect_default(_x:int, _y:int, _width:int, _height:int, _buttons_x:int)
gameframe_draw_9slice(g_gameframe_spr_caption, (window_has_focus() ? 1 : 0), argument[0], argument[1], argument[2], argument[3], g_gameframe_blend, g_gameframe_alpha * g_gameframe_caption_alpha, true);

#define gameframe_caption_draw_caption_text_default
// gameframe_caption_draw_caption_text_default(_x:number, _y:number, _width:number, _height:int)
var __x = argument[0], __y = argument[1], __height = argument[3];
var _dpiScale = g_gameframe_effective_scale;
var __right = __x + argument[2];
__x += g_gameframe_caption_margin * _dpiScale;
var _icon = g_gameframe_caption_icon;
if (_icon != -1) {
	draw_sprite_ext(_icon, -1, (__x + sprite_get_xoffset(_icon) * _dpiScale | 0), __y + ((__height - sprite_get_height(_icon) * _dpiScale) div 2) + sprite_get_yoffset(_icon) * _dpiScale, _dpiScale, _dpiScale, 0, 16777215, g_gameframe_caption_alpha * g_gameframe_alpha);
	__x += (sprite_get_width(_icon) + g_gameframe_caption_icon_margin) * _dpiScale;
}
var _text = g_gameframe_caption_text;
if (_text == "") return 0;
var __newFont = g_gameframe_caption_font;
if (__newFont != -1) draw_set_font(__newFont);
draw_set_halign(g_gameframe_caption_text_align);
draw_set_valign(0);
var __alpha = draw_get_alpha();
var __textWidth = __right - __x;
draw_set_alpha((g_gameframe_alpha * g_gameframe_caption_alpha));
draw_text_ext_transformed((__x + ((g_gameframe_caption_text_align * __textWidth) div 2)), __y + ((__height - string_height_ext(_text, -1, __textWidth) * _dpiScale) div 2), _text, -1, __textWidth, _dpiScale, _dpiScale, 0);
draw_set_alpha(__alpha);

//}

//{ gameframe_cover

#define gameframe_cover_ensure
// gameframe_cover_ensure()
var __just_changed = g_gameframe_cover_check_for_success;
if (__just_changed) g_gameframe_cover_check_for_success = false;
var __target_rect;
if (window_get_fullscreen()) {
	g_gameframe_cover_can_ignore = false;
	return 0;
} else if (g_gameframe_isFullscreen_hx) {
	__target_rect = gameframe_std_haxe_boot_wget(gameframe_tools_mon_get_active(), 0);
} else if (g_gameframe_isMaximized_hx) {
	__target_rect = gameframe_std_haxe_boot_wget(gameframe_tools_mon_get_active(), 1);
} else {
	g_gameframe_cover_can_ignore = false;
	return 0;
}
gameframe_tools_rect_get_window_rect(g_gameframe_cover_curr_rect);
if (!gameframe_tools_rect_equals(g_gameframe_cover_curr_rect, __target_rect)) {
	if (__just_changed) {
		g_gameframe_cover_can_ignore = true;
		gameframe_tools_rect_set_to(g_gameframe_cover_ignore_rect, __target_rect);
		if (g_gameframe_debug) gameframe_log("[cover] Resize failed - ignoring");
		return 0;
	}
	if (g_gameframe_cover_can_ignore && gameframe_tools_rect_equals(__target_rect, g_gameframe_cover_ignore_rect)) return 0;
	if (g_gameframe_debug) gameframe_log("[cover] Adjusting window rectangle to", __target_rect);
	gameframe_tools_rect_set_window_rect(__target_rect);
	g_gameframe_cover_check_for_success = true;
}

//}

//{ gameframe_delayed

#define gameframe_delayed_call_impl
// gameframe_delayed_call_impl(func:any, delay:int, arg:any, arg:any, arg:any, arg:any)
var _item;
if (ds_stack_empty(g_gameframe_delayed_pool)) _item = gameframe_delayed_item_create(); else _item = ds_stack_pop(g_gameframe_delayed_pool);
_item[@1/* func */] = argument[0];
_item[@2/* time */] = g_gameframe_delayed_frame_index + argument[1];
_item[@3/* arg0 */] = argument[2];
_item[@4/* arg1 */] = argument[3];
_item[@5/* arg2 */] = argument[4];
_item[@6/* arg3 */] = argument[5];
ds_queue_enqueue(g_gameframe_delayed_queue, _item);

#define gameframe_delayed_update
// gameframe_delayed_update()
g_gameframe_delayed_frame_index += 1;
var _f;
while (!ds_queue_empty(g_gameframe_delayed_queue)) {
	var _head = ds_queue_head(g_gameframe_delayed_queue);
	if (_head[2/* time */] > g_gameframe_delayed_frame_index) break;
	ds_queue_dequeue(g_gameframe_delayed_queue);
	_f = _head[1/* func */];
	script_execute(_f, _head[3/* arg0 */], _head[4/* arg1 */], _head[5/* arg2 */], _head[6/* arg3 */]);
	_head[@1/* func */] = undefined;
	_head[@3/* arg0 */] = undefined;
	_head[@4/* arg1 */] = undefined;
	_head[@5/* arg2 */] = undefined;
	_head[@6/* arg3 */] = undefined;
	ds_stack_push(g_gameframe_delayed_pool, _head);
}

//}

//{ gameframe_delayed_item

#define gameframe_delayed_item_create
// gameframe_delayed_item_create()
var _this = [mt_gameframe_delayed_item];
array_copy(_this, 1, mq_gameframe_delayed_item, 1, 6);
/// @typedef {tuple<any,func:any,time:int,arg0:any,arg1:any,arg2:any,arg3:any>} gameframe_delayed_item

return _this;

//}

//{ gameframe_drag

#define gameframe_drag_start
// gameframe_drag_start(_flags:int)
g_gameframe_drag_flags = argument[0];
g_gameframe_drag_mx = (display_mouse_get_x() | 0);
g_gameframe_drag_my = (display_mouse_get_y() | 0);
g_gameframe_drag_left = window_get_x();
g_gameframe_drag_top = window_get_y();
g_gameframe_drag_right = g_gameframe_drag_left + window_get_width();
g_gameframe_drag_bottom = g_gameframe_drag_top + window_get_height();

#define gameframe_drag_stop
// gameframe_drag_stop()
g_gameframe_drag_flags = 0;

#define gameframe_drag_set_rect
// gameframe_drag_set_rect(x:int, y:int, w:int, h:int)
window_set_rectangle(argument[0], argument[1], argument[2], argument[3]);

#define gameframe_drag_update
// gameframe_drag_update()
if (g_gameframe_drag_flags == 0) return 0;
var __mx = (display_mouse_get_x() | 0);
var __my = (display_mouse_get_y() | 0);
switch (g_gameframe_drag_flags) {
	case 16: window_set_position(__mx - (g_gameframe_drag_mx - g_gameframe_drag_left), __my - (g_gameframe_drag_my - g_gameframe_drag_top)); break;
	case 32:
		if (point_distance(__mx, __my, g_gameframe_drag_mx, g_gameframe_drag_my) > 5) {
			var __x;
			var __y = g_gameframe_drag_my - g_gameframe_drag_top;
			if (g_gameframe_drag_mx - g_gameframe_drag_left < (g_gameframe_drag_right - g_gameframe_drag_left) / 2) __x = min(g_gameframe_drag_mx - g_gameframe_drag_left, (g_gameframe_restoreRect_hx[2/* width */] >> 1)); else __x = max(g_gameframe_restoreRect_hx[2/* width */] + g_gameframe_drag_mx - g_gameframe_drag_right, (g_gameframe_restoreRect_hx[2/* width */] >> 1));
			g_gameframe_isMaximized_hx = false;
			window_set_rectangle(__mx - __x, __my - __y, g_gameframe_restoreRect_hx[2/* width */], g_gameframe_restoreRect_hx[3/* height */]);
			gameframe_drag_start(16);
		}
		break;
	case 1:
		var __x = __mx - (g_gameframe_drag_mx - g_gameframe_drag_left);
		window_set_rectangle(__x, g_gameframe_drag_top, g_gameframe_drag_right - __x, g_gameframe_drag_bottom - g_gameframe_drag_top);
		break;
	case 2:
		var __y = __my - (g_gameframe_drag_my - g_gameframe_drag_top);
		window_set_rectangle(g_gameframe_drag_left, __y, g_gameframe_drag_right - g_gameframe_drag_left, g_gameframe_drag_bottom - __y);
		break;
	case 4: window_set_rectangle(g_gameframe_drag_left, g_gameframe_drag_top, g_gameframe_drag_right - g_gameframe_drag_left - g_gameframe_drag_mx + __mx, g_gameframe_drag_bottom - g_gameframe_drag_top); break;
	case 8: window_set_rectangle(g_gameframe_drag_left, g_gameframe_drag_top, g_gameframe_drag_right - g_gameframe_drag_left, g_gameframe_drag_bottom - g_gameframe_drag_top - g_gameframe_drag_my + __my); break;
	case 3:
		var __x = __mx - (g_gameframe_drag_mx - g_gameframe_drag_left);
		var __y = __my - (g_gameframe_drag_my - g_gameframe_drag_top);
		window_set_rectangle(__x, __y, g_gameframe_drag_right - __x, g_gameframe_drag_bottom - __y);
		break;
	case 9:
		var __x = __mx - (g_gameframe_drag_mx - g_gameframe_drag_left);
		window_set_rectangle(__x, g_gameframe_drag_top, g_gameframe_drag_right - __x, g_gameframe_drag_bottom - g_gameframe_drag_top - g_gameframe_drag_my + __my);
		break;
	case 6:
		var __y = __my - (g_gameframe_drag_my - g_gameframe_drag_top);
		window_set_rectangle(g_gameframe_drag_left, __y, g_gameframe_drag_right - g_gameframe_drag_left - g_gameframe_drag_mx + __mx, g_gameframe_drag_bottom - __y);
		break;
	case 12: window_set_rectangle(g_gameframe_drag_left, g_gameframe_drag_top, g_gameframe_drag_right - g_gameframe_drag_left - g_gameframe_drag_mx + __mx, g_gameframe_drag_bottom - g_gameframe_drag_top - g_gameframe_drag_my + __my); break;
}

//}

//{ gameframe.tools.keyctl

#define gameframe_tools_keyctl_create_key
// gameframe_tools_keyctl_create_key(keyCode:gml_input_KeyCode)->GfKeyboardKey
return [/* keyCode: */argument[0], /* down: */false, /* pressed: */false];

#define gameframe_tools_keyctl_update_key
// gameframe_tools_keyctl_update_key(key:GfKeyboardKey)
var _key = argument[0];
var _down0 = _key[1/* down */];
var _down1 = keyboard_check_direct(_key[0/* keyCode */]) != 0;
_key[@2/* pressed */] = !_down0 && _down1;
_key[@1/* down */] = _down1;

#define gameframe_tools_keyctl_reset
// gameframe_tools_keyctl_reset()
var _i = 0;
for (var __g1 = array_length_1d(g_gameframe_tools_keyctl_keys); _i < __g1; ++_i) {
	gameframe_std_haxe_boot_wset(g_gameframe_tools_keyctl_keys[_i], 1, false);
}

#define gameframe_tools_keyctl_update
// gameframe_tools_keyctl_update()
if (!(window_has_focus() && (keyboard_check_direct(91) != 0 || keyboard_check_direct(92) != 0))) {
	gameframe_tools_keyctl_reset();
	return 0;
}
var _i = 0;
for (var __g1 = array_length_1d(g_gameframe_tools_keyctl_keys); _i < __g1; ++_i) {
	gameframe_tools_keyctl_update_key(g_gameframe_tools_keyctl_keys[_i]);
}
if (g_gameframe_tools_keyctl_up[2/* pressed */]) {
	if (g_gameframe_can_resize) gameframe_maximize();
} else if (g_gameframe_tools_keyctl_down[2/* pressed */]) {
	if (g_gameframe_isMaximized_hx) {
		if (g_gameframe_can_resize) gameframe_restore();
	} else gameframe_minimize();
}

//}

//{ gameframe_std.Std

#define gameframe_std_Std_string
// gameframe_std_Std_string(value:any)->string
var _value = argument[0];
if (_value == undefined) return "null";
if (is_string(_value)) return _value;
var _n, _i, _s;
if (is_real(_value)) {
	_s = string_format(_value, 0, 16);
	if (os_browser != browser_not_a_browser) {
		_n = string_length(_s);
		_i = _n;
		while (_i > 0) {
			switch (string_ord_at(_s, _i)) {
				case 48:
					--_i;
					continue;
				case 46: --_i; break;
			}
			break;
		}
	} else {
		_n = string_byte_length(_s);
		_i = _n;
		while (_i > 0) {
			switch (string_byte_at(_s, _i)) {
				case 48:
					--_i;
					continue;
				case 46: --_i; break;
			}
			break;
		}
	}
	return string_copy(_s, 1, _i);
}
return string(_value);

//}

//{ gameframe_std.haxe.class

#define gameframe_std_haxe_class_create
// gameframe_std_haxe_class_create(id:int, name:string)
var _this = ["mt_gameframe_std_haxe_class"];
array_copy(_this, 1, mq_gameframe_std_haxe_class, 1, 5);
/// @typedef {tuple<any,marker:any,index:int,name:string,superClass:haxe_class<any>,constructor:any>} gameframe_std_haxe_class
_this[@4/* superClass */] = undefined;
_this[@1/* marker */] = gameframe_std_haxe_type_markerValue;
_this[@2/* index */] = argument[0];
_this[@3/* name */] = argument[1];
return _this;

//}

//{ gameframe_std.gml.internal.ArrayImpl

#define gameframe_std_gml_internal_ArrayImpl_push
// gameframe_std_gml_internal_ArrayImpl_push(arr:array<T>, val:T)->int
var _arr = argument[0];
var _i = array_length_1d(_arr);
_arr[@_i] = argument[1];
return _i;

//}

//{ gameframe_std.haxe.boot

#define gameframe_std_haxe_boot_wget
// gameframe_std_haxe_boot_wget(arr:array<T>, index:int)->T
var _arr = argument[0], _index = argument[1];
return _arr[_index];

#define gameframe_std_haxe_boot_wset
// gameframe_std_haxe_boot_wset(arr:array<T>, index:int, value:T)
var _arr = argument[0], _index = argument[1];
_arr[@_index] = argument[2];

//}

//{ gameframe_tools_mon

#define gameframe_tools_mon_get_active
// gameframe_tools_mon_get_active()->tools_GfMonInfo
var __list = g_gameframe_tools_mon_get_active_list;
if (__list == undefined) {
	__list = ds_list_create();
	g_gameframe_tools_mon_get_active_list = __list;
}
var __count = gameframe_get_monitors(__list);
var __cx1 = window_get_x() + (window_get_width() div 2);
var __cy1 = window_get_y() + (window_get_height() div 2);
var _i = 0;
for (var __g1 = __count; _i < __g1; ++_i) {
	var __item = __list[|_i];
	var __mntr = __item[0/* screen */];
	if (__cx1 >= __mntr[0/* x */] && __cy1 >= __mntr[1/* y */] && __cx1 < __mntr[0/* x */] + __mntr[2/* width */] && __cy1 < __mntr[1/* y */] + __mntr[3/* height */]) return __item;
}
var __item = __list[|0];
if (__item == undefined) {
	__item = g_gameframe_tools_mon_dummy;
	if (__item == undefined) {
		__item = [/* screen: */gameframe_tools_rect__new(0, 0, display_get_width(), display_get_height()), /* workspace: */gameframe_tools_rect__new(0, 0, display_get_width(), display_get_height() - 40), /* flags: */0];
		g_gameframe_tools_mon_dummy = __item;
	}
	__list[|0] = __item;
}
return __item;

//}

/// @typedef {any} tools_GfRectImpl
/// @typedef {any} gameframe_tools_rect
/// @typedef {any} tools_GfMonInfo
/// @typedef {any} GfKeyboardKey