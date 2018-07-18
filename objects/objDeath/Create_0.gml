#macro DEATH_COUNT 16

image_angle = (360 / DEATH_COUNT) * instance_number(object_index);
direction = image_angle;
speed = 5;
image_blend = global.THEME;