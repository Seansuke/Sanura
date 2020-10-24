var clickX = argument0;
var clickY = argument1;
if(instance_position(clickX, clickY, DarkenButton)) {
    exit;
}
var tile = instance_nearest(clickX, clickY, Tile);
var foe = instance_nearest(x, y, Foe);
var tileDistance = point_distance(clickX, clickY, tile.x, tile.y);
var foeDistance = point_distance(clickX, clickY, foe.x, foe.y);
if(foeDistance < tileDistance && (Sanura).attackTile != undefined) {
    if(instance_exists((Sanura).attackTile)) {
        // Attack foe
        setTargetTile(Sanura, (Sanura).attackTile);
    }
} else {
    // Go to Tile
    setTargetTile(Sanura, tile);
}
