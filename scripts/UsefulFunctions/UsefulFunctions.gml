function Approach(value, dest, amount) {
	return (value + clamp(dest - value, -amount, amount));
}

function ApproachDelta(value, dest, amount) {
	return (value + clamp(dest-value, -amount*DT, amount*DT));
}

function ReachTween(value, destination, smoothness, threshold = 0.01) {
	var difference = destination - value;
    if (abs(difference) < threshold) return destination;
	return(lerp(value, destination, 1/smoothness));
}

function Chance(value) {
	return value>random(1);
}

function Wave(from, dest, duration, offset) {
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	var a4 = (dest - from) * 0.5;
	return from + a4 + sin((((current_time * 0.001) + duration * offset) / duration) * (pi*2)) * a4;
}

function DrawSetText(_color, _font, _haling, _valing, _alpha) {
	/// @desc DrawSetText(colour,font,halign,valign,alpha)
	if _color != undefined draw_set_colour(_color);
	if _font != undefined draw_set_font(_font);
	if _haling != undefined draw_set_halign(_haling);
	if _valing != undefined draw_set_valign(_valing);
	if _alpha != undefined draw_set_alpha(_alpha);
}

function DrawTextShadow(x, y, _string) {
	var color = draw_get_color();
	draw_set_color(c_black);
	draw_text(x + 1, y + 1, _string);
	draw_set_color(color);
	draw_text(x, y, _string);
}

function draw_text_outline(_x, _y, _string, _outwidth, _outcolor, _outfidelity) {
	///@desc draw_text_outline(x,y,str,outwidth,outcol,outfidelity)
	//Created by Andrew McCluskey http://nalgames.com/
	//x,y: Coordinates to draw
	//str: String to draw
	//outwidth: Width of outline in pixels
	//outcol: Colour of outline (main text draws with regular set colour)
	//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)

	var dto_dcol=draw_get_color();

	draw_set_color(_outcolor);

	for(var dto_i=45; dto_i<405; dto_i+=360/_outfidelity)
	{
	    draw_text(_x+lengthdir_x(_outwidth,dto_i),_y+lengthdir_y(_outwidth,dto_i),_string);
	}

	draw_set_color(dto_dcol);
	draw_text(_x,_y,_string);
}

function format(_string, struct) {
	var list = variable_struct_get_names(struct);
	for(var i = 0; i < array_length(list); i++){
		var find = "${"+list[i]+"}"
		_string = string_replace_all(_string, find, struct[$ list[i]]);
	}
	return _string;
}

function print() {
	var time = format("[${hour}:${minute}:${second}]",{
		hour: current_hour,
		minute: current_minute,
		second: current_second
	});
	var caller = format("[${caller}]",{caller: argument[0]});
	var msg = "";
	for(var i = 1; i < argument_count; i++){
		msg += string(argument[i]) + " ";
	}
	var result = time+caller+": "+msg;
	show_debug_message(result);
}