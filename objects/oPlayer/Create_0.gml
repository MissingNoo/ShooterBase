initializePlayer(global.player);
pickupRadius = 35;
in_range = noone;
canShoot=1;
neededxp = 79;
atkpercentage=0;
v=0;
global.arrowDir=0;
can_move=true;
if (!instance_exists(oCam)) {
    instance_create_depth(x,y,0,oCam);
}


