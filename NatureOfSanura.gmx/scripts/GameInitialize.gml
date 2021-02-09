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
global.spellStamina[GLOW] = 1;
global.spellStamina[TOXICATE] = 1;
global.spellStamina[PURIFY] = 4;
global.spellStamina[ECHO] = 1;
global.spellStamina[SILENCE] = 2;
global.spellStamina[STATIC] = 3;
global.spellStamina[CLEAVE] = 4;
global.spellStamina[BLEED] = 1;
global.spellStamina[DRAIN] = 4;
global.pause = false;

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



