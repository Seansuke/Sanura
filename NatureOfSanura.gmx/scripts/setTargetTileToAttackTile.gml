if(alarm[MOVE_COOLDOWN_ALARM] > 0) {
    exit;
}
attackTile = getCurrentAttackTile(currentTile);
setTargetTile(self, attackTile);
