// Decrease the timer
slash_timer -= 1;

if (slash_timer <= 0) {
    // Destroy the slash object after 1 second
    instance_destroy();
}