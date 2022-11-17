#macro UPGRADES global.upgrades
global.upgrade=0;
#region Null Upgrade
global.null=ds_map_create()
ds_map_add(global.null, "name", "");
ds_map_add(global.null, "sprite", blank);
ds_map_add(global.null, "thumb", blank);
ds_map_add(global.null, "level", "");
ds_map_add(global.null, "dmg", 1);
ds_map_add(global.null, "cooldown", 0);
ds_map_add(global.null, "speed", 0);
ds_map_add(global.null, "hits", 0);
global.upgradesAvaliable=[0];
for (i=0; i<4; i++) {
    global.upgrade_options[i]=global.null;
}
#endregion
#region Upgrades
function createUpgrade(_id, _name, _level, _sprite, _thumb, _mindmg, _maxdmg, _cooldown, _speed, _hits, _type, _shoots, _perk = 0)
{
	global.upgradesAvaliable[_id][0]=global.null;
	global.upgradesAvaliable[_id][_level]=ds_map_create();
	var m = global.upgradesAvaliable[_id][_level];
	ds_map_add(m, "id", _id);
	ds_map_add(m, "name", _name);
	ds_map_add(m, "sprite", _sprite);
	ds_map_add(m, "thumb", _thumb);
	ds_map_add(m, "level", _level);
	ds_map_add(m, "mindmg", _mindmg);
	ds_map_add(m, "maxdmg", _maxdmg);
	ds_map_add(m, "cooldown", _cooldown);
	ds_map_add(m, "speed", _speed);
	ds_map_add(m, "hits", _hits);
	ds_map_add(m, "type", _type);	
	ds_map_add(m, "shoots", _shoots);	
	ds_map_add(m, "perk", _perk);	
}
//createUpgrade(0,"Speed", suSpeed);		
//createUpgrade(0,"Atk", suATK,10,3);		
enum weapons
{
	AmePistol,
	GuraTrident,
	InaTentacle,
	PlugAsaCoco,
	DouglasShoot
}
#region Character Perks
	#region Amelia Perks
		#region AmePistol
			createUpgrade(weapons.AmePistol,"AmePistol",1, sAmeShoot, sAmePistol,7,13,80,4,1, "red", 3,1);
			createUpgrade(weapons.AmePistol,"AmePistol",2, sAmeShoot, sAmePistol,7,13,80,4,2, "red", 4,1);
			createUpgrade(weapons.AmePistol,"AmePistol",3, sAmeShoot, sAmePistol,7*1.25,13*1.25,80,4,2, "red", 4,1);
			createUpgrade(weapons.AmePistol,"AmePistol",4, sAmeShoot, sAmePistol,7*1.25,13*1.25,80,4,2, "red", 4,1);
			createUpgrade(weapons.AmePistol,"AmePistol",5, sAmeShoot, sAmePistol,7*1.25,13*1.25,80,4,3, "red", 4,1);
			createUpgrade(weapons.AmePistol,"AmePistol",6, sAmeShoot, sAmePistol,(7*1.25)*1.40,(13*1.25)*1.40,80,4,2, "red", 4,1);
			createUpgrade(weapons.AmePistol,"AmePistol",7, sAmeShoot, sAmePistol,(7*1.25)*1.40,(13*1.25)*1.40,80,4,2, "red", 6,1);
		#endregion
	#endregion
	
	#region Gura Perks
		#region GuraTrident
			createUpgrade(weapons.GuraTrident,"GuraTrident",1, sGuraTridentShoot, sGuraTrident,11,21,70,0,999, "red", 1,1);
			createUpgrade(weapons.GuraTrident,"GuraTrident",2, sGuraTridentShoot, sGuraTrident,11*1.20,21*1.20,70,0,999, "red", 1,1);
			createUpgrade(weapons.GuraTrident,"GuraTrident",3, sGuraTridentShoot, sGuraTrident,11*1.20,21*1.20,70,0,999, "red", 2,1);
			createUpgrade(weapons.GuraTrident,"GuraTrident",4, sGuraTridentShoot, sGuraTrident,11*1.20,21*1.20,70*0.85,0,999, "red", 2,1);
			createUpgrade(weapons.GuraTrident,"GuraTrident",5, sGuraTridentShoot, sGuraTrident,11*1.20*1.40,21*1.20*1.40,70*0.85,0,999, "red", 2,1);
			createUpgrade(weapons.GuraTrident,"GuraTrident",6, sGuraTridentShoot, sGuraTrident,11*1.20*1.40,21*1.20*1.40,70*0.85,0,999, "red", 2,1);
			createUpgrade(weapons.GuraTrident,"GuraTrident",7, sGuraTridentShoot, sGuraTrident,11*1.20*1.40,21*1.20*1.40,70*0.85,0,999, "red", 3,1);
		#endregion
	#endregion
	
	#region Ina Perks
		#region InaTentacle
			createUpgrade(weapons.InaTentacle,"InaTentacle",1, sInaTentacleShoot, sInaTentacle,8,16,90,0,999, "red", 1,1);
		#endregion
	#endregion
#endregion

createUpgrade(weapons.PlugAsaCoco,"Plug-type Asacoco",1,sAsaCocoShoot,sAsaCocoThumb,10,18,150,5,99,"white",1,0);
createUpgrade(weapons.DouglasShoot,"teste",1,sJohn,sJohn,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+1,"teste2",1,sDouglas,sDouglasPortrait,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+2,"teste3",1,sJohn,sJohn,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+3,"teste4",1,sDouglas,sDouglasPortrait,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+4,"teste5",1,sJohn,sJohn,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+5,"teste6",1,sDouglas,sDouglasPortrait,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+6,"teste7",1,sJohn,sJohn,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+7,"teste8",1,sDouglas,sDouglasPortrait,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+8,"teste9",1,sDouglas,sDouglasPortrait,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+9,"teste10",1,sDouglas,sDouglasPortrait,0,100,0,3,10,"white",1,0);
createUpgrade(weapons.DouglasShoot+10,"teste11",1,sDouglas,sDouglasPortrait,0,100,0,3,10,"white",1,0);


#endregion
//generate random list of possible upgrades
function randomUpgrades(){
	random_set_seed(current_time);
	name="";
	var ups = [];
	for (var i = 0; i < array_length(global.upgradesAvaliable); ++i) {
	    ups[i] = global.upgradesAvaliable[i];
	}
	show_debug_message(string(array_length(ups)));
	for (i=0; i<4; i++) {
		do {
			var rdnnumber = irandom_range(0,array_length(ups)-1);
			var pickedupgrade = ups[rdnnumber][1];
		    name = pickedupgrade[?"name"];
			var isperk = pickedupgrade[?"perk"];
			array_delete(ups, rdnnumber, 1);
		} until (isperk != 1);
		array_delete(ups, rdnnumber, 1);
		global.upgrade_options[i] = name;
	}
	global.upgrade_options[0] = global.Player[?"weapon"][1][?"name"];
	global.upgrade_options[1] = global.upgradesAvaliable[weapons.PlugAsaCoco][1][?"name"];
}	

function tickPowers(){
	if (attacktick == true and UPGRADES[0][?"name"]!="") {
		attacktick=false;
		alarm[2]=120;
		for (i=0; i < array_length(UPGRADES); i++) {
			if (UPGRADES[i] != global.null) {
			    inst = (instance_create_layer(x,y-8,"Upgrades",oUpgrade));
				inst.upg=UPGRADES[i];
				inst.speed=UPGRADES[i][?"speed"];
				inst.hits=UPGRADES[i][?"hits"];
				inst.shoots = UPGRADES[i][?"shoots"];
				inst.sprite_index=UPGRADES[i][?"sprite"];
				//inst.image_xscale=oPlayer.image_xscale;
			}			
		}
	}
}

function defaultBehaviour()
{
	if (oPlayer.image_xscale==1) 
	{
		direction = point_direction(x,y,x+100,y+diroffset);
	}
	else 
	{
		direction = point_direction(x,y,x-100,y-diroffset);
	}
	image_xscale=oPlayer.image_xscale;
	image_speed=1;
}






