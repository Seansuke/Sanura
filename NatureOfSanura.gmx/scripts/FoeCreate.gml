//FoeCreate(numberOfTiles, alarm)

hp = argument4;
maxHp = hp;
stamina = 0;

lastGapDirection = TILES_DOWN;

numberOfTiles = argument0;
if(numberOfTiles < 1) {
    // TODO - log error silently.
    numberOfTiles = 8;
}
attackWait = argument1;

attackGap = argument2;
attackGapMovement = argument3;

//Generate Tiles.
var radius = 150;

ds_list_clear(global.tiles);
global.tiles = CreateInRadius(radius, Tile, numberOfTiles);

// Make numerous bulletnode circles at difference radii.
for(var i = 0; i < BULLET_PATH_COUNT; i += 1) {
    var bulletRadius = (i + 1) * radius / (BULLET_PATH_COUNT + 1);
    var pathNodeList = CreateInRadius(bulletRadius, BulletPathNode, numberOfTiles);
}

alarm[0] = 30;
