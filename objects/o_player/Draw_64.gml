// Draw Event (for drawing the health bar)

// Set colors
var helth_bar_width = 200;  // Width of the health bar (you can adjust as needed)
var helth_bar_height = 20;  // Height of the health bar

// Background of the health bar (grey, for example)
draw_set_color(c_black);
draw_rectangle(10, 10, 10 + helth_bar_width, 10 + helth_bar_height, false);

// Draw the foreground of the health bar (based on current health)
var health_percentage = global.health / global.base_health;  // Health ratio (0 to 1)
var current_bar_width = helth_bar_width * health_percentage;  // Width based on health ratio

// Set color for the health bar (red for health)
draw_set_color(c_red);
draw_rectangle(10, 10, 10 + current_bar_width, 10 + helth_bar_height, false);




// Draw the dash timeout bar
var bar_x = 10;  // X coordinate of the bar's top-left corner
var bar_y = 50;  // Y coordinate of the bar's top-left corner
var bar_width = 200; // Width of the bar (100 is the full length of the bar)
var bar_height = 20; // Height of the bar

// Draw the background of the bar (incomplete bar, maybe a gray color)
draw_set_color(c_gray);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

// Draw the current filled part of the bar (based on the dash timer)

var current_width = (global.dash_timer / 150) * bar_width;  // Calculate how much of the bar should be filled
draw_set_color(c_red);
draw_rectangle(bar_x, bar_y, bar_x + current_width, bar_y + bar_height, false); // true indicates the filled state, color set inside the function

// Optionally, display a message when the dash is available