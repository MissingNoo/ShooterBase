/// @description 

#region Spawn
if (canspawn == true and global.gamePaused == false and room == Room1) {
	a = irandom_range(-1,1)
	if (a=0) a = 1;
	b = irandom_range(-1,1)
	if (b=0) b = 1;
	
	random_set_seed(current_time);
    canspawn=false;
	alarm[0]=120;
	instance_create_layer(
	oPlayer.x+(225*a),
	oPlayer.y+(225*b),
	"Instances",
	oEnemy	
	)
}
#endregion
if (global.gamePaused == false) {
    global.seconds+=1/30;
}


if (global.seconds >60) {
	summonCircle();
	global.seconds=0;	
	global.minutes+=1;	
}

if (global.seconds >30 and z==0) {
    z=1
	addEnemyToPool(Enemies.Red_Guy);
}
if (global.seconds >50 and zz=0) {
    zz=1
	removeEnemyFromPool(Enemies.Blue_Guy);
}







