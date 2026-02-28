var input_x = 0;
var input_y = 0;

if keyboard_check(vk_right) input_x = input_x + 1;
if keyboard_check(vk_left) input_x = input_x - 1;
if keyboard_check(vk_down) input_y = input_y + 1;
if keyboard_check(vk_up) input_y = input_y - 1;

// Mișcă playerul
x = x + input_x * move_speed;
y = y + input_y * move_speed;

// Check coliziune cu perete și rebut dacă e coliziune
if (place_meeting(x, y, oWall1)) {
    x = x - input_x * move_speed; // Mergi înapoi
    y = y - input_y * move_speed;
}
if (place_meeting(x, y, oWall2)) {
    x = x - input_x * move_speed; // Mergi înapoi
    y = y - input_y * move_speed;
}

if (input_x < 0) {
    image_xscale = -1;
}
if (input_x > 0) {
    image_xscale = 1;
}

// Cooldown
if (attack_cooldown > 0) {
    attack_cooldown -= 1;
}

// Attack input
if (keyboard_check_pressed(vk_space)) {
    if (attack_cooldown <= 0) {
        is_attacking = true;
        attack_cooldown = 30; // 0.5 sec la 60 FPS
    }
}

// Check collision cu enemy
if (is_attacking) {
    if (instance_exists(oEnemy)) {
        if (distance_to_object(oEnemy) < attack_range) {
            oEnemy.hp -= attack_damage;
            if (oEnemy.hp <= 0) {
                instance_destroy(oEnemy);
            }
        }
    }
    is_attacking = false;
}

var cam = view_camera[0];
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);

// Setează camera în centrul playerului
var cam_x = x - cam_width / 2;
var cam_y = y - cam_height / 2;

camera_set_view_pos(cam, cam_x, cam_y);

// Verifică dacă playerul a murit
if (hp <= 0) {
    room_restart(); // Reînceputul nivelului
}