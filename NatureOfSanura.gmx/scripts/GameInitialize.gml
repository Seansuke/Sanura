global.beatsPerMinuteRate = 1/20;
global.tiles = ds_list_create();
global.gapTiles = ds_list_create();
global.bulletSpeed = 4;

global.sanuraHp = 4;
global.sanuraStamina = 2;
global.dashLevel = 1;
global.attackSpeed = 1;
global.experience = 0;
global.spellStamina[DARKEN] = 2;

draw_set_font(TimesNewRomanFont);


base_size = 512;
width = browser_width;
height = browser_height;
canvas_fullscreen(base_size);

/*
Add music
Add to the beat
instructions
fix stage select.

Test:

Done:
Show the foes rest time. 
lag time for attacking
lag time when selecting multiple areas to go to.
DDRisms
mana bar
magic
more foes with lower variation.

*/



