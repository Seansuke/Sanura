if(alarm[1] <= 0 && other.hp > 0) {
    alarm[1] = other.attackCooldown;
    hp -= 1;
    if(other.attackBuff > 0) { 
        other.attackBuff -= 1;
        hp -= 1;
    }
    effect_create_below(ef_ring, x, y, 1, c_maroon);

}
