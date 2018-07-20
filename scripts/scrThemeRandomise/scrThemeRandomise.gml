var colours = [$2196F3, $FFEB3B, $4CAF50, $E91E63];

var colour = global.THEME;
while (colour == global.THEME || colour == global.THEME_LAST) {
	colour = scrRGBColour(colours[irandom(array_length_1d(colours)-1)]);
}
global.THEME_LAST = global.THEME;
global.THEME = colour;