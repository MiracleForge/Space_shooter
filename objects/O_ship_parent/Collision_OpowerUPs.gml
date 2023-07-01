
if (round(OpowerUPs.image_index) == 0) {
    OpowerUPs.spark = true;
    life_ship += 1;
	life_ship += min(10, max_life - life_ship)
}
else if (round(OpowerUPs.image_index) == 1) {
    OpowerUPs.spark = true;
    life_ship += 1;
    shield += min(10, max_shield - shield);
}
else if (round(OpowerUPs.image_index) == 2) {
    OpowerUPs.spark = true;
    life_ship = max_life;
    shield = max_shield;
}
  instance_create_layer(O_ship_parent.x, O_ship_parent.y, "Instances", Ospark);
with (other){	
	
	  instance_destroy();
	}

