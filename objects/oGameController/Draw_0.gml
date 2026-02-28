/// Draw Event
draw_set_color(c_yellow);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(room_width/2, room_height/2, "YOU WIN!");

draw_set_color(c_white);
draw_text(room_width/2, room_height/2 + 60, "Press SPACE to return to lvl1");

draw_set_halign(fa_left);
draw_set_valign(fa_top);