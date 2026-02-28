/// Draw Event
draw_self(); // Desenează playerul

// Afișează HP deasupra playerului (mai mic)
draw_text_color(x, y - 30, "HP: " + string(hp), c_white, c_white, c_white, c_white, 1);
draw_set_font(-1); // Reset font la default (mai mic)

// Dacă e mort, afișează mesaj
if (hp <= 0) {
    draw_text_color(400, 300, "YOU DIED!", c_red, c_red, c_red, c_red, 1);
}