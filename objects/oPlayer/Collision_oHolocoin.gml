/// @description Insert description here
// You can write your code in this editor
instance_destroy(other);
var coins = 10;
//feather disable once GM2017
for (var i = 0; i < global.shopUpgrades.MoneyGain.level; ++i) { //TODO: Is this working?
    coins = coins + ((coins * 20) / 100);
}
global.newcoins+= coins;