local var_0_0 = {}

HERO_RAISE_ROTATE_TIME = 0.2
ASTROLABE_COLOR_TIME = 0.2
ASTROLABE_COLOR = {
	0.35294117647058826,
	0.39215686274509803,
	0.5098039215686274
}
var_0_0.HeroRaiseRotate = {
	[11] = Vector3(0, 130, 0),
	[60] = Vector3(0, 130, 0),
	[61] = Vector3(0, 130, 0)
}
var_0_0.ViewType = {
	null = "null",
	heroRaiseCommon = "heroRaiseCommon"
}
var_0_0.HeroRaiseType = {
	weapon = 3,
	astrolabe = 5,
	transition = 7,
	attr_promption = 11,
	chip_management = 61,
	equip = 4,
	chip = 6,
	skill = 2,
	skill_details = 21,
	attr = 1
}
var_0_0.HeroServantType = {
	weapon = 1,
	servant = 2
}
var_0_0.HeroRaiseName = {
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"VirtualCamera_Property",
	"VirtualCamera_Property_Transcend",
	"VirtualCamera_Property_Break",
	"VirtualCamera_Property_Files",
	"VirtualCamera_Property_Skin",
	nil,
	nil,
	nil,
	nil,
	nil,
	"VirtualCamera_Skill",
	"VirtualCamera_Skill_Details",
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	nil,
	"VirtualCamera_Weapon",
	"VirtualCamera_Weapon_Break",
	"VirtualCamera_Weapon_WeaponServant",
	[40] = "VirtualCamera_Engraving",
	[60] = "VirtualCamera_Chip",
	[50] = "VirtualCamera_GodHood",
	[70] = "VirtualCamera_Transition",
	[61] = "VirtualCamera_Chip_Management",
	[51] = "VirtualCamera_GodHood_Adjust"
}
var_0_0.HeroRaiseIdleAniName = "action1_1"
var_0_0.HeroAniName = {
	[21] = "Skill_Details",
	[61] = "Chip_Management",
	[11] = "Property_Transcend",
	[12] = "Property_Break",
	[50] = "GodHood",
	[13] = "Property_Files",
	[10] = var_0_0.HeroRaiseIdleAniName,
	[14] = var_0_0.HeroRaiseIdleAniName,
	[20] = var_0_0.HeroRaiseIdleAniName,
	[40] = var_0_0.HeroRaiseIdleAniName,
	[60] = var_0_0.HeroRaiseIdleAniName
}
var_0_0.ModelState = {
	weapon = 3,
	hero = 2,
	none = 1
}

return var_0_0
