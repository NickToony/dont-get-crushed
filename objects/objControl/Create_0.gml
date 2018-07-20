// Begin
scrRoundInit();

// Difficulty
lastMode = -1;
scrModeRandomise(false);

currentRow = 0;
lastSides = 0;
targetRotation = 0;
scrThemeRandomise();

lastRemoved = ds_list_create();

nextSpawn = -1;
spawnsSinceLastEvent = -5

pauseGame = false;
levelPause = -1;

bounce = 0;
bounceState = 0;

if (global.MENU != MENU.ACTIVE) {
	if (global.FIRST_GAME) {
		scrMessageAdd("Space to jump\nWASD/Arrow keys to move", true);
		scrMessageAdd("Don't get crushed", false);
		global.FIRST_GAME = false;
	} else {
		scrMessageRandom(global.MESSAGES_START, true);
		scrMessageAdd("Space to jump", false);
	}
	
	instance_create_layer(global.CENTER_X, global.CENTER_Y, global.LAYER_PLAYER, objPlayer);
}

instance_create_layer(0, 0, global.LAYER_CONTROL, objCamera);