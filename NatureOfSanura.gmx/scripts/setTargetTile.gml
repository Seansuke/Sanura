//setTargetTile(player, targetTileId);
player = argument0;
selectedTile = argument1;
if((player).currentTile != selectedTile || (player).targetTile != selectedTile || (player).nextTargetTile != selectedTile) {
    // We're not there and we don't have set plans to go there.  So let's make plans to go there.
    (player).nextTargetTile = selectedTile;
}

// If just BARELY dodging a bullet, gain stamina.
if((player).currentTile != selectedTile && alarm[DAMAGE_ALARM] <= 0 && alarm[MOVE_COOLDOWN_ALARM] <= 0) {
    closestBullet = instance_nearest((player).x, (player).y, Bullet);
    bulletDistance = distance_to_object(closestBullet);
    if(bulletDistance < 20) {
        effect_create_above(ef_star, x - 16 + random(64), y - 16 + random(32), 0, c_white);
        subStamina += 1;
    }
    if(bulletDistance < 8) {
        effect_create_above(ef_star, x - 16 + random(64), y - 16 + random(32), 1, c_lime);
        subStamina += 1;
    }
    if(bulletDistance < 4) {
        effect_create_above(ef_star, x - 16 + random(64), y - 16 + random(32), 2, c_green);
        subStamina += 1;
    }
    if(subStamina >= maxSubStamina) {
        subStamina -= maxSubStamina;
        stamina += 1;
        if(stamina >= maxStamina) {
           stamina = maxStamina;
           subStamina = 0;
        }
    }
}

