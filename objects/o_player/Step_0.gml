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
    // Calculate the position in front of the player based on the player's direction
    var slash_x = x;
    var slash_y = y;

    // Check the direction the player is facing and spawn the slash in front of the player
    if (image_angle == 0) { // Facing right
        slash_x = x + 48;  // Adjust as needed based on your sprite size
        slash_y = y;
    } else if (image_angle == 180) { // Facing left
        slash_x = x - 32;  // Adjust as needed
        slash_y = y;
    } else if (image_angle == 90) { // Facing down
        slash_x = x;
        slash_y = y + 32; // Adjust as needed
    } else if (image_angle == 270) { // Facing up
        slash_x = x;
        slash_y = y - 32; // Adjust as needed
    }
    
    // Create the slash object in front of the player
    instance_create_layer(slash_x, slash_y, "Instances", o_slash);
}