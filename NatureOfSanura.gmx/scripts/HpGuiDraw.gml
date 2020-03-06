// target = argument0
draw_sprite_stretched(argument0.sprite_index,0,x-8,y+8,16,16);
if(argument0.hp > MAX_HP_BALLS) {
    draw_healthbar(x,y,room_width - x - 8,y+8, 
        100 * argument0.hp / argument0.maxHp, 
        c_gray, c_red, c_green, 
        DIRECTION_RIGHT, true, true);
}
else {
    for(var i = 1; i <= argument0.maxHp && i < MAX_HP_BALLS; i+=1) {
        if(argument0.hp >= i) {
            draw_sprite(HpSprite, -1, x + i * HP_GUI_OFFSET, y);
        }
        else {
            draw_sprite(EmptyHpSprite, -1, x + i * HP_GUI_OFFSET, y);
        }
    }
}
