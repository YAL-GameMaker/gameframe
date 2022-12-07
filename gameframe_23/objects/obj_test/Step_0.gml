gameframe_update();
if (keyboard_check_pressed(ord("1"))) gameframe_set_fullscreen(0);
if (keyboard_check_pressed(ord("2"))) gameframe_set_fullscreen(1);
if (keyboard_check_pressed(ord("3"))) gameframe_set_fullscreen(2);
if (keyboard_check_pressed(ord("4"))) targetAlpha = targetAlpha == 1 ? 0.3 : 1;
if (keyboard_check_pressed(ord("5"))) gameframe_can_input = !gameframe_can_input;
if (keyboard_check_pressed(ord("6"))) gameframe_can_resize = !gameframe_can_resize;
if (gameframe_alpha != targetAlpha) {
	gameframe_alpha = lerp(gameframe_alpha, targetAlpha, 0.1);
	if (gameframe_alpha == targetAlpha) gameframe_alpha = targetAlpha; // force if within epsilon
}