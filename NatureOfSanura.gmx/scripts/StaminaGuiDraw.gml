// target = argument0
if(! variable_instance_exists(argument0, "playerSprite")) {
    exit;
}
if(argument0.stamina > MAX_HP_BALLS) {
    draw_healthbar(x,y,room_width - x - 8,y+8, 
        100 * argument0.stamina / argument0.maxStamina, 
        c_gray, c_yellow, c_yellow, 
        DIRECTION_RIGHT, true, true);
}
else {
    for(var i = 1; i <= argument0.maxStamina && i < MAX_HP_BALLS; i+=1) {
        if (argument0.stamina + 1 == i) {
            draw_sprite_ext(StaminaSprite, -1, x + i * HP_GUI_OFFSET, y - 16, 1,1, 0, c_black, 1);
            // Draw a recharging stamina ball
            var subStaminaRatio = argument0.subStamina / argument0.maxSubStamina;
            draw_sprite_ext(StaminaSprite, -1, x + i * HP_GUI_OFFSET, y - 16, subStaminaRatio,subStaminaRatio, 0, c_fuchsia, 1);
        }
        else if(argument0.stamina >= i) {
            draw_sprite(StaminaSprite, -1, x + i * HP_GUI_OFFSET, y - 16);
        }
        else {
            draw_sprite_ext(StaminaSprite, -1, x + i * HP_GUI_OFFSET, y - 16, 1,1, 0, c_black, 1);
        }
    }
}
