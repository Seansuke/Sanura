if(hp <= 0) {
    playerSprite = ShadowSprite;
    image_alpha -= 0.01;
    if(image_alpha <= 0) {
        room = SelectRoom;
    }
    exit;
}
playerSprite = SanuraIdleSprite;

base_size = 512;
width = browser_width;
height = browser_height;
canvas_fullscreen(base_size);

// Determine target tile based on gamepad input.
var selectedTile = noone;
var gamepadIndex = 0;
if(gamepad_button_check(gamepadIndex, gp_padl) || keyboard_check(vk_left)) {
    selectedTile = (ds_list_find_value(global.tiles, TILES_LEFT)).id;   
}
else if(gamepad_button_check(gamepadIndex, gp_padr) || keyboard_check(vk_right)) {
    selectedTile = (ds_list_find_value(global.tiles, TILES_RIGHT)).id;  
}
if(gamepad_button_check(gamepadIndex, gp_padd) || keyboard_check(vk_down)) {
    if(gamepad_button_check(gamepadIndex, gp_padl) || keyboard_check(vk_left)) {
        selectedTile = (ds_list_find_value(global.tiles, TILES_DOWNLEFT)).id;   
    }
    else if(gamepad_button_check(gamepadIndex, gp_padr) || keyboard_check(vk_right)) {
        selectedTile = (ds_list_find_value(global.tiles, TILES_DOWNRIGHT)).id;   
    }
    else {
        selectedTile = (ds_list_find_value(global.tiles, TILES_DOWN)).id;   
    }
}
else if(gamepad_button_check(gamepadIndex, gp_padu) || keyboard_check(vk_up)) {
    if(gamepad_button_check(gamepadIndex, gp_padl) || keyboard_check(vk_left)) {
        selectedTile = (ds_list_find_value(global.tiles, TILES_UPLEFT)).id;   
    }
    else if(gamepad_button_check(gamepadIndex, gp_padr) || keyboard_check(vk_right)) {
        selectedTile = (ds_list_find_value(global.tiles, TILES_UPRIGHT)).id;   
    }
    else {
        selectedTile = (ds_list_find_value(global.tiles, TILES_UP)).id;   
    }
}
if(selectedTile != noone) { 
    setTargetTile(self, selectedTile);
}

// Move towards target.
isMoving = false;
if(targetTile != noone) {
    speed = 0;
    if(distance_to_point(targetTile.x, targetTile.y) > 0) {
        isMoving = true;
        move_towards_point(targetTile.x, targetTile.y, min(dashSpeed, distance_to_point(targetTile.x, targetTile.y)));
    }
}

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

