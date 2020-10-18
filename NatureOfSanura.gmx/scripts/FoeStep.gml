if(hp <= 0) {
    instance_deactivate_object(Bullet);
    image_alpha -= 0.01;
    if(image_alpha <= 0) {
        global.experience += experience;
        room = SelectRoom;
    }
    exit;
}
faceDirection = FACE_RIGHT;
if((Sanura).x - 20 < x) {
    faceDirection = FACE_LEFT;
}

if(alarm[0] mod 10 == 0) {
    for(var animationX = 0; animationX < alarm[0] / 10; animationX += 1) {
        var animationId = instance_create(x + animationX * 24,y - 50,Animation);
        (animationId).sprite_index = SweatSprite;
    }
}
