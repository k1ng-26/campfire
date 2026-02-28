// Găsește Player
if (instance_exists(oPlayer)) {
    var distance = distance_to_object(oPlayer);
    var detect_range = 200; // distanța la care inamic "vede" playerul
    var proximity_range = 5; // distanța la care trebuie să fii lângă inamic pentru a-l ucide
    var damage_range = 15; // distanța la care inamicul dă damage
    
    // Dacă playerul e în detect range, urmărește-l
    if (distance < detect_range) {
        var target_x = oPlayer.x - x;
        var target_y = oPlayer.y - y;
        var dist = sqrt(target_x * target_x + target_y * target_y);
        
        if (dist > 0) {
            x = x + (target_x / dist) * speed_move;
            y = y + (target_y / dist) * speed_move;
        }
        
        // Check coliziune cu perete și rebut dacă e coliziune
        if (place_meeting(x, y, oWall2)) {
            x = x - (target_x / dist) * speed_move;
            y = y - (target_y / dist) * speed_move;
        }
        
        // Flip sprite
        if (target_x < 0) {
            image_xscale = -1;
        } else if (target_x > 0) {
            image_xscale = 1;
        }
    }
    
    // Inamicul dă damage cu delay (o dată pe secundă)
    if (distance < damage_range) {
        damage_cooldown -= 1;
        if (damage_cooldown <= 0) {
            oPlayer.hp -= 2; // Dă 10 damage
            damage_cooldown = 60; // Delay 60 frames = 1 sec la 60 FPS
        }
    }
    
    // Dacă apesi SPACE ȘI ești în contact cu inamicul
    if (keyboard_check_pressed(vk_space) && distance < proximity_range) {
        instance_destroy(); // distruge inamicul imediat
    }
}