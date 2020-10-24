maxHp = floor(global.sanuraHp);
hp = maxHp;
attackingTimer = 0;
stamina = 0;
maxStamina = floor(global.sanuraStamina);
subStamina = 0;
maxSubStamina = 10;
alarm[DAMAGE_ALARM] = -1;
alarm[MOVE_COOLDOWN_ALARM] = -1;

currentTile = noone;
targetTile = currentTile;
nextTargetTile = noone;
attackTile = noone;

playerSprite = SanuraIdleSprite;
shadowSprite = ShadowSprite;
isMoving = false;
dashSpeed = 5 + global.dashLevel * 5;
attackCooldown = max(20 - global.attackSpeed * 3, 5);
sprite_index = shadowSprite;
faceDirection = FACE_RIGHT;
