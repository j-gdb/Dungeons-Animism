image_speed = 0;

var _timer = function() { global.current_hp-- };
hp_timer = time_source_create(time_source_game, .1, time_source_units_seconds, _timer, [], -1);
time_source_start(hp_timer);

effect_active = false;
iframes = 45
global.can_hit = true