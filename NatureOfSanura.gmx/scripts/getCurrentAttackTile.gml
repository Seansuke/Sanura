//getCurrentAttackTile(tileId)
//returns the instance ID of the attack tile.
var tileId = argument0;
var tileIndex = ds_list_find_index(global.tiles, tileId);
var attackTileIndex = floor((tileIndex + TILES_MAX / 2) mod TILES_MAX);
return ds_list_find_value(global.tiles, attackTileIndex);
