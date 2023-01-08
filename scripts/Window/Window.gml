// Feather disable GM2043
// Feather disable GM1024
// Feather disable GM2017
#macro GW display_get_gui_width()
#macro GH display_get_gui_height()
function drawWindow(x, y, w, h, title){
	//background
	draw_set_alpha(.35);
	draw_set_color(c_black);
	draw_rectangle(x,y,x+w,y+h,false);
	//
	draw_set_alpha(1);
	draw_set_color(c_white);
	//title
	draw_rectangle(x,y,x+w,y+25,false);
	//window
	draw_rectangle(x,y,x+w,y+h,true);
	draw_set_color(c_black);
	draw_text(x+5,y+5,title);
}
function gameWindow(){
//window_set_size( 960, 540 );
var base_w = 640;
var base_h = 360;
var max_w = display_get_width();
var max_h = display_get_height();
var aspect = display_get_width() / display_get_height();
if (max_w < max_h){
	// portait
     var VIEW_WIDTH = min(base_w, max_w);
	var VIEW_HEIGHT = VIEW_WIDTH / aspect;
}
else{
	// landscape
	var VIEW_HEIGHT = min(base_h, max_h);
	var VIEW_WIDTH = VIEW_HEIGHT * aspect;
}
camera_set_view_size(view_camera[0], floor(VIEW_WIDTH), floor(VIEW_HEIGHT))
view_wport[0] = max_w;
view_hport[0] = max_h;
surface_resize(application_surface, view_wport[0], view_hport[0]);
}
function drawDesc(_xx, _yy, _string, maxX, _size = 1){
	_originalSize = font_get_size(global.Font);
	draw_set_font(global.Font); //draw_set_font(fnt_font1);
	draw_set_halign(fa_center);
	var xt=0;
	var yt=0;
	var char = "";
	for (var i = 1; i < string_length(_string); ++i) {
		char = string_copy(_string, i, 1);
		if (_xx + xt >= _xx + maxX) { // past max x jump line
		    xt = 0;
			yt+=20
		}
		if (char == " ") { //if word wont fit jump line
			var totalx = 0
			for (var j = i+1; j < string_length(_string); ++j) {
				char2 = string_copy(_string, j, 1);
				if (char2 != " ") {
					totalx += 10.5;
				}
				else {
					break;
				}
			}
			if (_xx + xt + totalx >= _xx + maxX) {
				xt = -10.5;
				yt+=20
			}
		}
		switch (char) {
		    case "[":
				draw_set_color(c_green);
				i++
				break;
		    case "]":
				draw_set_color(c_white);
				i++
				break;
		}
		char = string_copy(_string, i, 1);
		if (xt == 0 and char == " ") {
		    xt = -10.5;
		}
	    draw_text_transformed(_xx+xt, _yy+yt, char, _size, _size, 0);
		xt+=10.5;
	}
	draw_set_halign(fa_left);
}
	
function mouseOnButton(_startX, _startY, _off, _sprite, _scaleX, _scaleY, _array, _variable = "selected", _direction = "vertical"){
	variable_instance_set(self, "mousein", false);
	var menuX = _startX;
	var menuY = _startY;
	var off = 0;
	if (_direction == "vertical") {
	    for (var i = 0; i < array_length(_array); ++i) {
			if (global.debug) {
			    randomize();
				draw_set_alpha(.1);
			    draw_set_color(make_color_rgb(random(255),random(255),random(255)));
				draw_rectangle( menuX - ((sprite_get_width(_sprite) * _scaleX)/2), (menuY + off) - ((sprite_get_height(_sprite)*_scaleY)/2), menuX + ((sprite_get_width(_sprite) * _scaleX)/2), (menuY + off) + ((sprite_get_height(_sprite)*_scaleY)/2),false);
				draw_set_color(c_white);
				draw_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 3, false);
				draw_set_alpha(1);
			}
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), menuX - ((sprite_get_width(_sprite) * _scaleX)/2), (menuY + off) - ((sprite_get_height(_sprite)*_scaleY)/2), menuX + ((sprite_get_width(_sprite) * _scaleX)/2), (menuY + off) + ((sprite_get_height(_sprite)*_scaleY)/2))) {
				variable_instance_set(self, _variable, i);
				variable_instance_set(self, "mousein", true);
			}
			off += _off;
		}
	}
	if (_direction == "horizontal") {
	    for (var i = 0; i < array_length(_array); ++i) {
			if (global.debug) {
				randomize();
				draw_set_alpha(.1);
			    draw_set_color(make_color_rgb(random(255),random(255),random(255)));
				draw_rectangle((menuX + off) - ((sprite_get_width(_sprite) * _scaleX)/2), menuY - ((sprite_get_height(_sprite)*_scaleY)/2), (menuX + off) + ((sprite_get_width(_sprite) * _scaleX)/2), menuY + ((sprite_get_height(_sprite)*_scaleY)/2),false);
				draw_set_color(c_white);
				draw_circle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 3, false);
				draw_set_alpha(1);
			}
			if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), (menuX + off) - ((sprite_get_width(_sprite) * _scaleX)/2), menuY - ((sprite_get_height(_sprite)*_scaleY)/2), (menuX + off) + ((sprite_get_width(_sprite) * _scaleX)/2), menuY + ((sprite_get_height(_sprite)*_scaleY)/2))) {
				variable_instance_set(self, _variable, i);
				variable_instance_set(self, "mousein", true);
			}
			off += _off;
		}
	}
	
}

