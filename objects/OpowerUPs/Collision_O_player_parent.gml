
var powerUpIndex = round(OpowerUPs.image_index);
OpowerUPs.spark = true;
with (O_player_parent) {
    current_life += 1;
    if (powerUpIndex == 0 || (powerUpIndex == 1 && shield_active)) {
        if (powerUpIndex == 1) {
            shield += min(10, max_shield - shield);
        }
    }
    if (powerUpIndex == 2 && shield_active) {
        shield = max_shield;
    }
}

instance_create_layer(O_player_parent.x, O_player_parent.y, "Instances", Ospark);
instance_destroy();

