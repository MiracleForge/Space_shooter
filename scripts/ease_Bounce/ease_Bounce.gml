function ease_Bounce() {


	var t = argument[0];  // time
	var b = argument[1];  // begin
	var c = argument[2];  // change
	var d = argument[3];  // duration


	var s = 1.7;
	var p = 0;
	var a = c;

	if (t == 0) return b;

	t/=d;

	if (t == 1) return b + c;
	if (!p) p = d *0.1;   // bounce value ajust here
	if (a < abs(c)) {  
	    a = c;
		s = p/4; }
	
		else {     s = p/ (2*pi ) *arcsin( c/a);    }
	
	
	
		return a * power (2, -10*t) * sin( (t*d -s ) * (2*pi) / p ) + c + b;





}
