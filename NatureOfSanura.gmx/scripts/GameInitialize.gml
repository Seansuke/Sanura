global.beatsPerMinuteRate = 1/20;
global.tiles = ds_list_create();
global.gapTiles = ds_list_create();
global.bulletSpeed = 4;
global.sanuraHp = 4;
global.experience = 0;
draw_set_font(TimesNewRomanFont);

base_size = 512;
width = browser_width;
height = browser_height;
canvas_fullscreen(base_size);

/*
Add music
Add to the beat
instructions
DDRisms
mana bar
magic
Show the foes rest time. 
fix stage select.
more foes with lower variation.

lag time for attacking
lag time when selecting multiple areas to go to.

Done:
Make attack tile red.
Touch foe will initiative attack.  
Tiles need bigger touches.
Add teleport
Add another bulletnode. 
*/



