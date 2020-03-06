// damageAlarm
if(alarm[0] <= 0) {
    alarm[0] = 30;
    hp -= 1;
    effect_create_below(ef_ring, x, y, 1, c_maroon);
}
