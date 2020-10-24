
var gamepadIndex = 0;
pressed[DIRECTION_LEFT] = gamepad_button_check(gamepadIndex, gp_padl) 
    || keyboard_check(vk_left) 
    || keyboard_check(ord('A'))
    || gamepad_axis_value(gamepadIndex, gp_axislh) < - gamepad_get_axis_deadzone(gamepadIndex) 
    || gamepad_axis_value(gamepadIndex, gp_axisrh) < - gamepad_get_axis_deadzone(gamepadIndex);
pressed[DIRECTION_RIGHT] = gamepad_button_check(gamepadIndex, gp_padr) 
    || keyboard_check(vk_right) 
    || keyboard_check(ord('D'))
    || gamepad_axis_value(gamepadIndex, gp_axislh) > gamepad_get_axis_deadzone(gamepadIndex) 
    || gamepad_axis_value(gamepadIndex, gp_axisrh) > gamepad_get_axis_deadzone(gamepadIndex);
pressed[DIRECTION_DOWN] = gamepad_button_check(gamepadIndex, gp_padd) 
    || keyboard_check(vk_down) 
    || keyboard_check(ord('S'))
    || gamepad_axis_value(gamepadIndex, gp_axislv) > gamepad_get_axis_deadzone(gamepadIndex) 
    || gamepad_axis_value(gamepadIndex, gp_axisrv) > gamepad_get_axis_deadzone(gamepadIndex);
pressed[DIRECTION_UP] = gamepad_button_check(gamepadIndex, gp_padu) 
    || keyboard_check(vk_up) 
    || keyboard_check(ord('W'))
    || gamepad_axis_value(gamepadIndex, gp_axislv) < - gamepad_get_axis_deadzone(gamepadIndex) 
    || gamepad_axis_value(gamepadIndex, gp_axisrv) < - gamepad_get_axis_deadzone(gamepadIndex);
return pressed;
