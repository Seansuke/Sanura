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

