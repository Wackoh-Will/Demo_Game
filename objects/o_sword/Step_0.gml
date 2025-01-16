if (!global.is_sword_picked_up) {
    // Check if the player collides with the gun
    if (place_meeting(x, y, o_player)) {
        // Pick up the gun
        global.is_sword_picked_up = true;
    }
} else {
    // Attach the sword to the player
    x = o_player.x;
    y = o_player.y;
}


