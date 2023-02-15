#macro SPECIAL_LIST global.specialList
global.specialList=[0];
global.specialBonuses[0] = 0;

#region Item Functions

	function createSpecial(_id, _name, _sprite, _cooldown, _desc, _character)
	{
		SPECIAL_LIST[_id]={};
		var item = SPECIAL_LIST[_id];
		variable_struct_set(item, "id", _id);
		variable_struct_set(item, "name", _name);
		variable_struct_set(item, "thumb", _sprite);
		variable_struct_set(item, "cooldown", _cooldown);
		variable_struct_set(item, "desc", _desc);
		variable_struct_set(item, "characterid", _character);
		ds_map_add(global.characters[_character], "special", _id);
	}

	enum SpecialIds
	{
		Amelia,
	}
#endregion
function populateSpecials(){
	createSpecial(SpecialIds.Amelia, "Slow Time", sAmeSpecial, 60, "Slows all target movement by 80% while Pistol Shot shoots 50% faster for 15 seconds.", Characters.Amelia);
}

function useSpecial(_special)
{
	skilltimer = 0;
	show_message("used special id: " + string(_special.name));
}