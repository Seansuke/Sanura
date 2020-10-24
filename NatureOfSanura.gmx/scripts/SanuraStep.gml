if(hp <= 0) {
    playerSprite = ShadowSprite;
    image_alpha -= 0.01;
    if(image_alpha <= 0) {
        room = SelectRoom;
    }
    exit;
}
playerSprite = SanuraIdleSprite;

// TODO - move this
base_size = 512;
width = browser_width;
height = browser_height;
canvas_fullscreen(base_size);

// Determine target tile based on gamepad input.
var selectedTile = noone;
var gamepadIndex = 0;
var pressed = getPressedArray();
if(pressed[DIRECTION_LEFT]) {
    selectedTile = (ds_list_find_value(global.tiles, TILES_LEFT)).id;   
}
else if(pressed[DIRECTION_RIGHT]) {
    selectedTile = (ds_list_find_value(global.tiles, TILES_RIGHT)).id;  
}
if(pressed[DIRECTION_DOWN]) {
    if(pressed[DIRECTION_LEFT]) {
        selectedTile = (ds_list_find_value(global.tiles, TILES_DOWNLEFT)).id;   
    }
    else if(pressed[DIRECTION_RIGHT]) {
        selectedTile = (ds_list_find_value(global.tiles, TILES_DOWNRIGHT)).id;   
    }
    else {
        selectedTile = (ds_list_find_value(global.tiles, TILES_DOWN)).id;   
    }
}
else if(pressed[DIRECTION_UP]) {
    if(pressed[DIRECTION_LEFT]) {
        selectedTile = (ds_list_find_value(global.tiles, TILES_UPLEFT)).id;   
    }
    else if(pressed[DIRECTION_RIGHT]) {
        selectedTile = (ds_list_find_value(global.tiles, TILES_UPRIGHT)).id;   
    }
    else {
        selectedTile = (ds_list_find_value(global.tiles, TILES_UP)).id;   
    }
}
var attackPressed = gamepad_button_check(gamepadIndex, gp_face1);
if(attackPressed) {
    setTargetTileToAttackTile();
}
var darkenPressed = gamepad_button_check(gamepadIndex, gp_face2);
if(darkenPressed) {
    with(DarkenButton) { 
        event_user(0);
    }
}
if(selectedTile != noone) { 
    setTargetTile(self, selectedTile);
}

attackTile = getCurrentAttackTile(Sanura.currentTile);

// Move towards target.
isMoving = false;
speed = 0;
if(targetTile != noone && targetTile != undefined && alarm[MOVE_COOLDOWN_ALARM] <= 0) {
    if(instance_exists(targetTile)) {
        var distanceToTile = distance_to_point((targetTile).x, (targetTile).y);
        if(distanceToTile > 0) {
            isMoving = true;
            if(targetTile == attackTile) {
                if(dashSpeed < distanceToTile) {
                    move_towards_point((targetTile).x, (targetTile).y, dashSpeed);
                }
                else {
                    x = (targetTile).x;
                    y = (targetTile).y;
                }
            }
            else {
                // Teleport
                effect_create_above(ef_spark, x, y, 2, c_white);
                effect_create_above(ef_spark, x, y, 1, c_ltgray);
                effect_create_above(ef_spark, x, y, 0, c_black);
                x = (targetTile).x;
                y = (targetTile).y;
                targetTile = noone;
            }
        }
        else {
            currentTile = targetTile;
            if(nextTargetTile != noone) {
                targetTile = nextTargetTile;
                nextTargetTile = noone;
                attackTile = getCurrentAttackTile(Sanura.currentTile);
                isAttacking = (attackTile == targetTile);
            }
        }
    }
}
else if(nextTargetTile != noone && alarm[MOVE_COOLDOWN_ALARM] <= 0) {
    targetTile = nextTargetTile;
    nextTargetTile = noone;
    attackTile = getCurrentAttackTile(Sanura.currentTile);
    isAttacking = (attackTile == targetTile);
}

attackTile = getCurrentAttackTile(Sanura.currentTile);

// Determine player sprite.
if(isMoving) {
    playerSprite = SanuraRunSprite;
}
if(attackingTimer > 0) {
    attackingTimer -= 1;
    playerSprite = SanuraAttackSprite;
}
else {
    faceDirection = FACE_RIGHT;
    if((Foe).x - 10 < x) {
        faceDirection = FACE_LEFT;
    }
}

