//FoeShoot(forcedDirection, currentAttackGap, gapMovement);
// forcedDirection - Can be noone or a TILES_DOWN, TILES_UP, etc.
// currentAttackGap - must be 1 or more. it is the amount of tiles that can be open for the player to movr
// gapMovement - Must be between 1 and 3.  Changes how many tiles the center gap can move at maximum.

var forcedDirection = argument0;
var currentAttackGap = argument1;
var gapMovement = argument2;

ds_list_clear( global.gapTiles);

currentGapDirection = DIRECTION_DOWN;

if(forcedDirection != noone) {
    // if a forced direction was provided, just use that.
    currentGapDirection = forcedDirection;
}
else {
    // TODO - Make the gap direction more sporadic.
    // TODO - Make the gap direction ACTUALLY go to the upper right.
    // Choose a random direction based off the last direction
    currentGapDirection = lastGapDirection;
    currentGapDirection += round(TILES_MAX + random(gapMovement * 2) - gapMovement) mod TILES_MAX;
    lastGapDirection = currentGapDirection;
}
currentGapDirection = round(currentGapDirection) mod TILES_MAX;
ds_list_add(global.gapTiles, currentGapDirection);
for(var i = 0; i < currentAttackGap; i += 1) {
    // 50% chance of making the gap wider.
    if(round(random(1)) == 1) {
        currentGapDirection += 1;
        ds_list_add(global.gapTiles, currentGapDirection);
    }
}

for(var i = 0; i < TILES_MAX; i += 1) {
    var chosenTileIndex = ds_list_find_index(global.gapTiles, i);
    if(chosenTileIndex != -1) {
        continue;
    }
    // TODO - Spawn bullets in the non-gap areas.  Or dont!  Whatever!
    
    // TODO - Fix this so it can't make gaps of 0.
    selectedTile = (ds_list_find_value(global.tiles, i));
    bullet = instance_create(x,y, Bullet);
    (bullet).direction = point_direction(x,y,(selectedTile).x, (selectedTile).y);
    // TODO - Fix this speed
    (bullet).speed = global.bulletSpeed;
    
}


// TODO - no clue how to calculate this yet.
alarm[0] = attackWait;

    // 10% chance to take a per attack
    if(random(100) < 10) {
        alarm[0] = attackWait * 3;
        if(alarm[0] <= 60) { 
            alarm[0] *= 2;
        }
    }
