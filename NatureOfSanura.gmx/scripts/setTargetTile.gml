//setTargetTile(player, targetTileId);
player = argument0;
selectedTile = argument1;
if((player).currentTile != selectedTile || (player).targetTile != selectedTile || (player).nextTargetTile != selectedTile) {
    // We're not there and we don't have set plans to go there.  So let's make plans to go there.
    (player).nextTargetTile = selectedTile;
}
