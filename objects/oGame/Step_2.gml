if (keyboard_check_pressed(vk_escape) or gamepad_button_check_pressed(global.gPnum, gp_start) and global.upgrade == false and !ANVIL) {
	if (global.gamePaused and room == rInicio ) {
	    PauseGame();
	}
	
	switch (room) {
	    case rCharacterSelect:
	        room_goto(rInicio);
	        break;
		case rShop:
			break;
	    default:
	        if (room != rInicio) {
			    PauseGame();
			}
	        break;
	}
}