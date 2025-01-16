// Player movement variables
  // Movement speed, adjust as necessary
// If the Shift key is being held down, double the speed
if (keyboard_check(vk_shift)) {
    global.player_move_speed = 8;  // Double the speed when Shift is held
} else {
    global.player_move_speed = 4;   // Reset the player's movement speed to 4 when Shift is not pressed
}

// Handle input for movement
if (keyboard_check(ord("W"))) {
    y -= global.player_move_speed;  // Move up
	global.dash_direction = [0, -1];
}
if (keyboard_check(ord("S"))) {
    y += global.player_move_speed;  // Move down
	global.dash_direction = [0, 1];
}
if (keyboard_check(ord("A"))) {
    x -= global.player_move_speed;  // Move left
	global.dash_direction = [-1, 0];
}
if (keyboard_check(ord("D"))) {
    x += global.player_move_speed;  // Move right
	global.dash_direction = [1, 0];
}


if global.medkit = true{
	if global.health > global.base_health {
		global.health += global.base_health / 2}
	else {
		global.health = global.base_health}
	global.medkit = false
}
if global.health <= 0 {
		room_restart();
}

if global.dash_available == true{
	if global.dash_timer == 0{
		if keyboard_check_pressed(ord("E")){
			// Assuming global.dash_direction holds the angle the player is facing or moving
				var dash_x = x - lengthdir_x(0, x);  // 48 is the offset distance, you can adjust it
				var dash_y = y - lengthdir_y(0, y);  // 48 is the offset distance, you can adjust it

				// Create the o_dash instance behind the player
				instance_create_layer(dash_x, dash_y, "Instances", o_dash);
			x += global.dash_direction[0] * global.dash_speed;  // Horizontal movement (left/right)
			y += global.dash_direction[1] * global.dash_speed;  // Vertical movement (up/down)
			global.dash_timer += 150
			
			
		}
	}
	
}
if global.dash_timer > 0{
	global.dash_timer -= 1;
}

 if (global.is_sword_picked_up && mouse_check_button_pressed(mb_left)) {
    // Get the mouse position
    var point_x = mouse_x;
    var point_y = mouse_y;

    // Calculate the angle between the player and the mouse
    var slash_angle = point_direction(x, y, point_x, point_y);

    // Calculate the position in front of the player based on the slash direction
    var slash_x = x + lengthdir_x(48, slash_angle);  // 48 is the offset distance, adjust as needed
    var slash_y = y + lengthdir_y(48, slash_angle);  // 48 is the offset distance, adjust as needed
    
    // Create the slash object in the direction of the mouse
    instance_create_layer(slash_x, slash_y, "Instances", o_slash);
}