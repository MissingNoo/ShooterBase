var rnd = random_range(.25, 1.5);
image_xscale = rnd;
image_yscale = rnd;
spd = random_range(1, 1.50);
alpha = .4;
dir = irandom_range(0, 1);
x = irandom_range(0, GW);
speed = random_range(1,1.2);
direction = point_direction(x,y,x,y+10);
alarm[0] = irandom_range(1,100);
image_angle = irandom_range(0, 360);