
// Feather disable GM2016
if(keyboard_check(ord("R"))) v-=0.01;
if(keyboard_check(ord("T"))) v+=0.01;
if (keyboard_check_pressed(ord("H")) and global.debug) {
	//summonCircle();
	global.xp=neededxp;
	//98
}
if (keyboard_check_pressed(vk_shift)) {
//show_message(array_length(global.upgrades))
}
if (!global.gamePaused) {
	tickPowers();
	tickItems();
	tickPerks();
	Movement();
	
	#region XP Range
		inRange = collision_circle(x,y-16,pickupRadius, oXP, false, true);
		if (inRange != noone) {
		    inRange.onArea = true;
		}
	#endregion
    //if (input_check_pressed("shoot")) instance_create_layer(mouse_x, mouse_y, "Instances", oEnemy);
	
	if (global.xp >= neededxp) {
		global.level += 1;
		global.xp-=neededxp;
		neededxp += round((4*(global.level + 1)) *2.1) - round((4*global.level)*2.1);
		//81
		//98
		//155
		//192
		randomUpgrades()
		keyboard_clear(ord("Z"));
		audio_play_sound(snd_LvlUp,0,0);
		//if (instance_exists(oJoystick)) { global.mode = "menu"; }
		global.upgrade=1;	
		oGui.selected=0;		
		PauseGame()
	}
	
	if (global.hp <= 0) {
		if (revives <= 0) {
			global.mode = "menu";
		    game_restart();
		}
		else {
		    HP = MAXHP/2;
			revives -= 1;
			with (oEnemy) {
			   if (!boss) {
			       instance_destroy();
			   }
			}
		}
		
	}
}
if (global.debug) {
    HP=999999;
}
if (global.xp<0) {
    global.xp = 0;
}
if (HP > MAXHP) {
    HP=MAXHP;
}
#region spd calc
	var calc = 0;
	for (var i = 0; i < array_length(Bonuses[BonusType.Speed]); ++i) {
		if (Bonuses[BonusType.Speed][i] != 0) {
		    calc += Bonuses[BonusType.Speed][i];
		}    
	}
	for (var i = 0; i < array_length(PerkBonuses[BonusType.Speed]); ++i) {
		if (PerkBonuses[BonusType.Speed][i] != 0) {
		    calc += PerkBonuses[BonusType.Speed][i];
		}    
	}
	for (var i = 0; i < global.ShopUpgrades[$ "Spd"][$ "level"]; ++i) {
	    calc = calc + ((calc * 6) / 100);
	}
	if (calc == 0) {
	    calc = 1;
	}
	var shopBonus = ospd;
	for (var i = 0; i < global.ShopUpgrades[$ "Spd"][$ "level"]; ++i) {
	    shopBonus = shopBonus + ((shopBonus* 6) / 100);
	}
	shopBonus = shopBonus - ospd;
	//if (calc != 0) {
	    spd = (ospd + shopBonus) * calc;
		//show_message(shopBonus);
	//}
#endregion

#region pickup calc
	calc = 1;
	for (var i = 0; i < array_length(Bonuses[BonusType.PickupRange]); ++i) {
		if (Bonuses[BonusType.PickupRange][i] != 0) {
		    calc += Bonuses[BonusType.PickupRange][i];
		}    
	}
	//for (var i = 0; i < array_length(PerkBonuses[BonusType.PickupRange]); ++i) {
	//	if (PerkBonuses[BonusType.PickupRange][i] != 0) {
	//	    calc += PerkBonuses[BonusType.PickupRange][i];
	//	}    
	//}//TODO: if there is a pickuprange bonus perk
	shopBonus = originalPickupRadius;
	for (var i = 0; i < global.ShopUpgrades[$ "PickUp"][$ "level"]; ++i) {
	    shopBonus = shopBonus + ((shopBonus* 10) / 100);
	}
	shopBonus = shopBonus - originalPickupRadius;
	if (calc != 0) {
	    pickupRadius = (originalPickupRadius + shopBonus) * calc;
	}
#endregion
if (global.gamePaused) {
    image_speed=0;
}else{
	image_speed=1;
}

#region heal every five seconds if shop upgrade
if (global.ShopUpgrades[$ "Regeneration"][$ "level"] > 0 and !global.gamePaused) {
    healSeconds+=1/60;
	if (healSeconds > 5) {
	    HP += 1 * global.ShopUpgrades[$ "Regeneration"][$ "level"];
		healSeconds = 0;
		//show_message("healed: " + string(1 * global.ShopUpgrades[$ "Regeneration"][$ "level"]));
	}
}
#endregion