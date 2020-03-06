if(hp <= 0) {
    instance_deactivate_object(Bullet);
    image_alpha -= 0.02;
    if(image_alpha <= 0) {
        room = SelectRoom;
    }
    exit;
}
image_xscale = FACE_RIGHT;
if((Sanura).x - 20 < x) {
    image_xscale = FACE_LEFT;
}

