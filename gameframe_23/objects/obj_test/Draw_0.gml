draw_set_font(fnt_test);
draw_set_color(c_white);
var _h = draw_get_halign();
var _v = draw_get_valign();
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(room_width/2, room_height/2, "Your videogame here")
draw_set_halign(_h)
draw_set_valign(_v)
var _dragFlags = gameframe_get_drag_flags();
draw_text(5, 35,
	sfmt("Window size: %x%", window_get_width(), window_get_height())
	+ sfmt("\nGame size: %x%", browser_width, browser_height)
	+ sfmt("\nDragging: % (flags=%)", _dragFlags?"yes":"no",_dragFlags)
	//+ `\nScale: ${gameframe_effective_scale}`
	+ "\n\nTry things:"
	+ "\n1: Windowed"
	+ sfmt("\n2: True fullscreen (%)", window_get_fullscreen() ? "on" : "off")
	+ sfmt("\n3: Fullscreen window (%)", gameframe_is_fullscreen_window() ? "on" : "off")
	+ "\n4: Change alpha"
	+ sfmt("\n5: Toggle interactions (%)", gameframe_can_input ? "on" : "off")
	+ sfmt("\n6: Toggle resize (%)", gameframe_can_resize ? "on" : "off")
)