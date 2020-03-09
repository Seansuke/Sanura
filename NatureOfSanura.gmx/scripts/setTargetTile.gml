//setTargetTile(player, targetTileId);
player = argument0;
targetTile = argument1;
if((player).targetTile != (player).currentTile) {
    //
    (player).targetTile = targetTile;
}
else {
    // 
    (player).nextTargetTile = targetTile;
}
if((player).attackTile == targetTile) {
    // 
    (player).isAttacking = true;
}
