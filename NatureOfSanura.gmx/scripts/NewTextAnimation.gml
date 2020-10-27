// NewTextAnimation(textX, textY, text, spriteIndex, movementX, movementY, time or zero for auto calculate, textColor) */
var node = instance_create(x,y, Animation);
node.x = argument0;
node.y = argument1;
node.text = argument2;
if(argument3 != noone) {
    node.spriteIndex = argument3;
}
node.movementX = argument4;
node.movementY = argument5;
node.alarm[0] = argument6;
if(node.alarm[0] == 0) {
    node.alarm[0] = string_length(node.text) * 10;
}
node.textColor = argument7;
