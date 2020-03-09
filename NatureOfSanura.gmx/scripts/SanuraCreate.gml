maxHp = floor(global.sanuraHp);
hp = maxHp;
attackingTimer = 0;
stamina = 0;
alarm[0] = -1; // Took damage alarm.

currentTile = noone;
targetTile = currentTile;
nextTargetTile = noone;
attackTile = currentTile;

playerSprite = SanuraIdleSprite;
shadowSprite = ShadowSprite;
isMoving = false;
dashSpeed = 45;
sprite_index = shadowSprite;
faceDirection = FACE_RIGHT;
