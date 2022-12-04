// Feather disable GM2017
#macro HP global.hp
#macro MAXHP global.maxhp
#macro NAME global.name
function initializePlayer(_p){
	attacktick=true;
	HP=_p[?"hp"];
	MAXHP=_p[?"hp"];
	NAME=_p[?"name"];
	for (i=0; i<6; i++) {
		UPGRADES[i]=global.null;
	}
	for (i=0; i<6; i++) {
		playerItems[i]=global.nullitem;
	}
	global.upgrade=0;
	global.xp=0;
	global.level = 1;
	damaged=false;
	spddefault=_p[?"speed"];
	spd=_p[?"speed"];
	// Feather disable GM2017
	canShoot = 1;
	arrowDir=0;
	// Feather enable GM2017
	atk=_p[?"atk"];
	sprite=_p[?"sprite"];
	runningsprite=_p[?"runningsprite"];
	sprite_index=sprite;
	global.upgrades[0] = _p[?"weapon"][1];
	Shield = 0;
	MaxShield = 0;
	revives = 0;
	pickupRadius = 35;
	#region Reset bonuses
		for (var i = 0; i < array_length(Bonuses); ++i) {
			if (is_array(Bonuses[i])) {
			    for (var j = 0; j < array_length(Bonuses[i]); ++j) {
					Bonuses[i][j]=0;
				}
			}
			else{
				Bonuses[i]=0;
			}
		}
	#endregion
	
	#region reset perk bonuses
		for (var i = 0; i < array_length(PerkBonuses); ++i) {
			if (is_array(PerkBonuses[i])) {
			    for (var j = 0; j < array_length(PerkBonuses[i]); ++j) {
					PerkBonuses[i][j]=0;
				}
			}
			else{
				PerkBonuses[i]=0;
			}
		}
	#endregion
}

global.characters=[];
#macro CHARACTERS global.characters
function createCharacter(_id, _name, _portrait, _sprite, _runningsprite, _hp, _speed, _atk, _weapon)
{
	global.characters[_id]=ds_map_create();
	m = global.characters[_id];
	ds_map_add(m, "id", _id);
	ds_map_add(m, "name", _name);
	ds_map_add(m, "portrait", _portrait);
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "runningsprite", _runningsprite);
	ds_map_add(m, "hp", _hp);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "atk", _atk);
	ds_map_add(m, "weapon", _weapon);
}
function populateCharacters(){
	createCharacter(Characters.Amelia,"Watson Amelia",sAmePortrait,sAmeIdle,sAmeRunning,75,1.35,1.30,u[Weapons.AmePistol]);
	createCharacter(Characters.Gura,"Gawr Gura",sGuraPortrait,sGuraIdle,sGuraRunning,65,1.40,1.10,u[Weapons.GuraTrident]);
	//createCharacter(Characters.Ina,"Ninomae Ina'nis",sInaPortrait,sInaIdle,sInaRunning,75,1.50,0.90,u[Weapons.InaTentacle]);
	//createCharacter(Characters.Kiara,"Takanashi Kiara",sAmePortrait,sAmeIdle,sAmeRunning,30,1.35,10,u[Weapons.AmePistol]);
	//createCharacter(Characters.Calli,"Mori Calliope",sAmePortrait,sAmeIdle,sAmeRunning,30,1.35,10,u[Weapons.AmePistol]);
	NAME=CHARACTERS[Characters.Amelia][?"name"];
}


enum Characters {
	Amelia,
	Gura,
	//Ina,
	//Kiara,
	//Calli,
	Lenght
}


function Movement()
{

// if the variable _hspd does not equal zero

// or

// if the variable _vspd does not equal zero

if can_move == true{

    var _left = (keyboard_check(LEFTKEY)) ;
    var _right = (keyboard_check(RIGHTKEY));
    var _up = (keyboard_check(UPKEY));
    var _down = (keyboard_check(DOWNKEY));
	if (!instance_exists(oJoystick) and !global.strafe) {
		if (_down) { global.arrowDir=270; }
		if (_up) { global.arrowDir=90; }
		if (_right) { global.arrowDir=0; }
		if (_left) { global.arrowDir=180; }
		if (_up and _right) { global.arrowDir=45; }
		if (_up and _left) { global.arrowDir=135; }
		if (_down and _right) { global.arrowDir=315; }
		if (_down and _left) { global.arrowDir=225; }
	}
	
	
    var _hspd = _right - _left;

    var _vspd = _down - _up;

    if (_hspd != 0 || _vspd != 0)
    {
		if (_hspd != 0) {
			if (!global.strafe and !instance_exists(oJoystick)) {
			    image_xscale=_hspd;
			}		    
		}
		
        var _spd = spd;

        var _dir = point_direction(0, 0, _hspd, _vspd);
		
        var _xadd = lengthdir_x(_spd, _dir);

        var _yadd = lengthdir_y(_spd, _dir);

        x = x + _xadd;

        y = y + _yadd;
		sprite_index=runningsprite;
        }
		else {
			sprite_index=sprite;
		}
    } 
	else {
		sprite_index=sprite;
		}
}