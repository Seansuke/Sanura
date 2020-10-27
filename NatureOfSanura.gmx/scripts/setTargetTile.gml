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
    if(lastTimingBulletId == closestBullet) {
        // We already gained timing bonuses off of this bullet.
        exit;
    }
    bulletDistance = distance_to_object(closestBullet);
    // TODO - change these to be relative to the beat, not just pixels.
    if(bulletDistance == 0) {
        // Do not gain anything if it is right on top of you.
    }
    else if(bulletDistance < 2) {
        NewTextAnimation(Foe.x, Foe.y + random(32), "IMPOSSIBLE!!!", noone, 0,-2, 0, c_lime);
        effect_create_above(ef_star, x - 16 + random(64), y - 16 + random(32), 2, c_green);
        subStamina += 10;
    }
    else if(bulletDistance < 8) {
        NewTextAnimation(Foe.x, Foe.y + random(32), "Perfect!!", noone, 0,-2, 0, c_green);
        effect_create_above(ef_star, x - 16 + random(64), y - 16 + random(32), 2, c_green);
        subStamina += 3;
    }
    else if(bulletDistance < 16) {
        NewTextAnimation(Foe.x, Foe.y + random(32), "Great!", noone, 0,-2, 0, c_yellow);
        effect_create_above(ef_star, x - 16 + random(64), y - 16 + random(32), 1, c_lime);
        subStamina += 2;
    }
    else if(bulletDistance < 32) {
        NewTextAnimation(Foe.x, Foe.y + random(32), "Good", noone, 0,-2, 0, c_white);
        effect_create_above(ef_star, x - 16 + random(64), y - 16 + random(32), 0, c_white);
        subStamina += 1;
    }
    else {
        // Bullet is too far for us to count as a dodge, so just exit.
        exit;
    }
    lastTimingBulletId = closestBullet;
    if(subStamina >= maxSubStamina) {
        subStamina -= maxSubStamina;
        stamina += 1;
        if(stamina >= maxStamina) {
           stamina = maxStamina;
           subStamina = 0;
        }
    }
}

