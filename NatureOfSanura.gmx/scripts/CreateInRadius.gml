//CreateInRadius(radius, objectToCreate, numberOfObjectsToCreate)
// returns object list created.
var radius = argument0;
var objectToCreate = argument1;
var numberOfObjectsToCreate = argument2;
var radiansInCircle = 2 * pi;
var changeInRadians = radiansInCircle / numberOfObjectsToCreate;
var startingRadianOffset = radiansInCircle * 3 / 4;
var itemList = ds_list_create();
for(var i = 0; i < numberOfTiles; i += 1) {
    var radiansDifference = i * changeInRadians + startingRadianOffset;
    var someXMultiplier = cos(radiansDifference);
    var someYMultiplier = sin(radiansDifference);
    var designatedX = x + radius * someXMultiplier;
    // Must be negative Y because on a grid the Y goes up but in the game the Y goes down.
    var designatedY = y - radius * someYMultiplier;
    var newTile = instance_create(designatedX, designatedY, objectToCreate);
    ds_list_add(itemList, newTile);
}
return itemList;
