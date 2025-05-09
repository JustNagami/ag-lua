﻿local var_0_0 = require("protobuf")
local var_0_1 = require("protocol/item_hrl_pb")

module("p46_pb", package.seeall)

local var_0_2 = {
	CS_46010_FIELD_LIST = {},
	SC_46011_FIELD_LIST = {},
	WEAPON_SERVANT_PB_FIELD_LIST = {},
	CS_46012_FIELD_LIST = {},
	SC_46013_FIELD_LIST = {},
	CS_46014_FIELD_LIST = {},
	SC_46015_FIELD_LIST = {},
	CS_46016_FIELD_LIST = {},
	SC_46017_FIELD_LIST = {},
	CS_46018_FIELD_LIST = {},
	SC_46019_FIELD_LIST = {},
	CS_46020_FIELD_LIST = {},
	SC_46021_FIELD_LIST = {},
	CS_46030_FIELD_LIST = {},
	SC_46031_FIELD_LIST = {},
	CS_46032_FIELD_LIST = {},
	SC_46033_FIELD_LIST = {},
	CS_46034_FIELD_LIST = {},
	SC_46035_FIELD_LIST = {}
}

CS_46010 = var_0_0.Descriptor()
SC_46011 = var_0_0.Descriptor()
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD = var_0_0.FieldDescriptor()
WEAPON_SERVANT_PB = var_0_0.Descriptor()
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD = var_0_0.FieldDescriptor()
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD = var_0_0.FieldDescriptor()
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD = var_0_0.FieldDescriptor()
CS_46012 = var_0_0.Descriptor()
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD = var_0_0.FieldDescriptor()
SC_46013 = var_0_0.Descriptor()
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD = var_0_0.FieldDescriptor()
CS_46014 = var_0_0.Descriptor()
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD = var_0_0.FieldDescriptor()
SC_46015 = var_0_0.Descriptor()
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD = var_0_0.FieldDescriptor()
CS_46016 = var_0_0.Descriptor()
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD = var_0_0.FieldDescriptor()
SC_46017 = var_0_0.Descriptor()
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD = var_0_0.FieldDescriptor()
CS_46018 = var_0_0.Descriptor()
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD = var_0_0.FieldDescriptor()
SC_46019 = var_0_0.Descriptor()
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD = var_0_0.FieldDescriptor()
CS_46020 = var_0_0.Descriptor()
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD = var_0_0.FieldDescriptor()
SC_46021 = var_0_0.Descriptor()
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD = var_0_0.FieldDescriptor()
CS_46030 = var_0_0.Descriptor()
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD = var_0_0.FieldDescriptor()
SC_46031 = var_0_0.Descriptor()
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD = var_0_0.FieldDescriptor()
CS_46032 = var_0_0.Descriptor()
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD = var_0_0.FieldDescriptor()
SC_46033 = var_0_0.Descriptor()
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD = var_0_0.FieldDescriptor()
CS_46034 = var_0_0.Descriptor()
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD = var_0_0.FieldDescriptor()
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD = var_0_0.FieldDescriptor()
SC_46035 = var_0_0.Descriptor()
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD = var_0_0.FieldDescriptor()
CS_46010.name = "cs_46010"
CS_46010.full_name = ".common.cs_46010"
CS_46010.nested_types = {}
CS_46010.enum_types = {}
CS_46010.fields = {}
CS_46010.is_extendable = false
CS_46010.extensions = {}
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.name = "servant_list"
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.full_name = ".common.sc_46011.servant_list"
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.number = 1
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.index = 0
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.label = 3
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.has_default_value = false
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.default_value = {}
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.message_type = WEAPON_SERVANT_PB
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.type = 11
var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD.cpp_type = 10
SC_46011.name = "sc_46011"
SC_46011.full_name = ".common.sc_46011"
SC_46011.nested_types = {}
SC_46011.enum_types = {}
SC_46011.fields = {
	var_0_2.SC_46011_FIELD_LIST.SC_46011_SERVANT_LIST_FIELD
}
SC_46011.is_extendable = false
SC_46011.extensions = {}
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD.name = "uid"
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD.full_name = ".common.weapon_servant_pb.uid"
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD.number = 1
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD.index = 0
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD.label = 2
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD.has_default_value = false
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD.default_value = "0"
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD.type = 4
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD.cpp_type = 4
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD.name = "id"
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD.full_name = ".common.weapon_servant_pb.id"
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD.number = 2
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD.index = 1
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD.label = 2
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD.has_default_value = false
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD.default_value = 0
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD.type = 13
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD.cpp_type = 3
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD.name = "stage"
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD.full_name = ".common.weapon_servant_pb.stage"
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD.number = 3
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD.index = 2
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD.label = 2
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD.has_default_value = false
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD.default_value = 0
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD.type = 13
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD.cpp_type = 3
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD.name = "is_locked"
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD.full_name = ".common.weapon_servant_pb.is_locked"
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD.number = 4
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD.index = 3
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD.label = 2
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD.has_default_value = false
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD.default_value = 0
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD.type = 13
var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD.cpp_type = 3
WEAPON_SERVANT_PB.name = "weapon_servant_pb"
WEAPON_SERVANT_PB.full_name = ".common.weapon_servant_pb"
WEAPON_SERVANT_PB.nested_types = {}
WEAPON_SERVANT_PB.enum_types = {}
WEAPON_SERVANT_PB.fields = {
	var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_UID_FIELD,
	var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_ID_FIELD,
	var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_STAGE_FIELD,
	var_0_2.WEAPON_SERVANT_PB_FIELD_LIST.WEAPON_SERVANT_PB_IS_LOCKED_FIELD
}
WEAPON_SERVANT_PB.is_extendable = false
WEAPON_SERVANT_PB.extensions = {}
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD.name = "refined_type"
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD.full_name = ".common.cs_46012.refined_type"
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD.number = 1
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD.index = 0
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD.label = 2
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD.has_default_value = false
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD.default_value = 0
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD.type = 13
var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD.cpp_type = 3
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD.name = "uid"
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD.full_name = ".common.cs_46012.uid"
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD.number = 2
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD.index = 1
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD.label = 2
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD.has_default_value = false
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD.default_value = "0"
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD.type = 4
var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD.cpp_type = 4
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD.name = "cost_uid"
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD.full_name = ".common.cs_46012.cost_uid"
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD.number = 3
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD.index = 2
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD.label = 1
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD.has_default_value = false
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD.default_value = "0"
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD.type = 4
var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD.cpp_type = 4
CS_46012.name = "cs_46012"
CS_46012.full_name = ".common.cs_46012"
CS_46012.nested_types = {}
CS_46012.enum_types = {}
CS_46012.fields = {
	var_0_2.CS_46012_FIELD_LIST.CS_46012_REFINED_TYPE_FIELD,
	var_0_2.CS_46012_FIELD_LIST.CS_46012_UID_FIELD,
	var_0_2.CS_46012_FIELD_LIST.CS_46012_COST_UID_FIELD
}
CS_46012.is_extendable = false
CS_46012.extensions = {}
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD.name = "result"
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD.full_name = ".common.sc_46013.result"
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD.number = 1
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD.index = 0
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD.label = 2
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD.has_default_value = false
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD.default_value = 0
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD.type = 13
var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD.cpp_type = 3
SC_46013.name = "sc_46013"
SC_46013.full_name = ".common.sc_46013"
SC_46013.nested_types = {}
SC_46013.enum_types = {}
SC_46013.fields = {
	var_0_2.SC_46013_FIELD_LIST.SC_46013_RESULT_FIELD
}
SC_46013.is_extendable = false
SC_46013.extensions = {}
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD.name = "uid"
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD.full_name = ".common.cs_46014.uid"
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD.number = 1
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD.index = 0
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD.label = 2
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD.has_default_value = false
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD.default_value = "0"
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD.type = 4
var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD.cpp_type = 4
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD.name = "is_lock"
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD.full_name = ".common.cs_46014.is_lock"
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD.number = 2
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD.index = 1
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD.label = 2
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD.has_default_value = false
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD.default_value = 0
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD.type = 13
var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD.cpp_type = 3
CS_46014.name = "cs_46014"
CS_46014.full_name = ".common.cs_46014"
CS_46014.nested_types = {}
CS_46014.enum_types = {}
CS_46014.fields = {
	var_0_2.CS_46014_FIELD_LIST.CS_46014_UID_FIELD,
	var_0_2.CS_46014_FIELD_LIST.CS_46014_IS_LOCK_FIELD
}
CS_46014.is_extendable = false
CS_46014.extensions = {}
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD.name = "result"
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD.full_name = ".common.sc_46015.result"
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD.number = 1
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD.index = 0
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD.label = 2
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD.has_default_value = false
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD.default_value = 0
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD.type = 13
var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD.cpp_type = 3
SC_46015.name = "sc_46015"
SC_46015.full_name = ".common.sc_46015"
SC_46015.nested_types = {}
SC_46015.enum_types = {}
SC_46015.fields = {
	var_0_2.SC_46015_FIELD_LIST.SC_46015_RESULT_FIELD
}
SC_46015.is_extendable = false
SC_46015.extensions = {}
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD.name = "hero_id"
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD.full_name = ".common.cs_46016.hero_id"
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD.number = 1
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD.index = 0
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD.label = 2
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD.has_default_value = false
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD.default_value = 0
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD.type = 13
var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD.cpp_type = 3
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.name = "material_list"
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.full_name = ".common.cs_46016.material_list"
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.number = 2
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.index = 1
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.label = 3
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.has_default_value = false
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.default_value = {}
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.message_type = var_0_1.ITEM_NET_REC
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.type = 11
var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD.cpp_type = 10
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD.name = "servant_list"
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD.full_name = ".common.cs_46016.servant_list"
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD.number = 3
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD.index = 2
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD.label = 3
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD.has_default_value = false
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD.default_value = {}
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD.type = 4
var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD.cpp_type = 4
CS_46016.name = "cs_46016"
CS_46016.full_name = ".common.cs_46016"
CS_46016.nested_types = {}
CS_46016.enum_types = {}
CS_46016.fields = {
	var_0_2.CS_46016_FIELD_LIST.CS_46016_HERO_ID_FIELD,
	var_0_2.CS_46016_FIELD_LIST.CS_46016_MATERIAL_LIST_FIELD,
	var_0_2.CS_46016_FIELD_LIST.CS_46016_SERVANT_LIST_FIELD
}
CS_46016.is_extendable = false
CS_46016.extensions = {}
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD.name = "result"
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD.full_name = ".common.sc_46017.result"
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD.number = 1
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD.index = 0
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD.label = 2
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD.has_default_value = false
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD.default_value = 0
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD.type = 13
var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD.cpp_type = 3
SC_46017.name = "sc_46017"
SC_46017.full_name = ".common.sc_46017"
SC_46017.nested_types = {}
SC_46017.enum_types = {}
SC_46017.fields = {
	var_0_2.SC_46017_FIELD_LIST.SC_46017_RESULT_FIELD
}
SC_46017.is_extendable = false
SC_46017.extensions = {}
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD.name = "hero_id"
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD.full_name = ".common.cs_46018.hero_id"
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD.number = 1
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD.index = 0
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD.label = 2
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD.has_default_value = false
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD.default_value = 0
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD.type = 13
var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD.cpp_type = 3
CS_46018.name = "cs_46018"
CS_46018.full_name = ".common.cs_46018"
CS_46018.nested_types = {}
CS_46018.enum_types = {}
CS_46018.fields = {
	var_0_2.CS_46018_FIELD_LIST.CS_46018_HERO_ID_FIELD
}
CS_46018.is_extendable = false
CS_46018.extensions = {}
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD.name = "result"
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD.full_name = ".common.sc_46019.result"
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD.number = 1
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD.index = 0
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD.label = 2
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD.has_default_value = false
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD.default_value = 0
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD.type = 13
var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD.cpp_type = 3
SC_46019.name = "sc_46019"
SC_46019.full_name = ".common.sc_46019"
SC_46019.nested_types = {}
SC_46019.enum_types = {}
SC_46019.fields = {
	var_0_2.SC_46019_FIELD_LIST.SC_46019_RESULT_FIELD
}
SC_46019.is_extendable = false
SC_46019.extensions = {}
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD.name = "hero_id"
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD.full_name = ".common.cs_46020.hero_id"
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD.number = 1
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD.index = 0
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD.label = 2
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD.has_default_value = false
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD.default_value = 0
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD.type = 13
var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD.cpp_type = 3
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD.name = "servant_id"
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD.full_name = ".common.cs_46020.servant_id"
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD.number = 2
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD.index = 1
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD.label = 2
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD.has_default_value = false
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD.default_value = "0"
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD.type = 4
var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD.cpp_type = 4
CS_46020.name = "cs_46020"
CS_46020.full_name = ".common.cs_46020"
CS_46020.nested_types = {}
CS_46020.enum_types = {}
CS_46020.fields = {
	var_0_2.CS_46020_FIELD_LIST.CS_46020_HERO_ID_FIELD,
	var_0_2.CS_46020_FIELD_LIST.CS_46020_SERVANT_ID_FIELD
}
CS_46020.is_extendable = false
CS_46020.extensions = {}
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD.name = "result"
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD.full_name = ".common.sc_46021.result"
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD.number = 1
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD.index = 0
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD.label = 2
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD.has_default_value = false
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD.default_value = 0
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD.type = 13
var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD.cpp_type = 3
SC_46021.name = "sc_46021"
SC_46021.full_name = ".common.sc_46021"
SC_46021.nested_types = {}
SC_46021.enum_types = {}
SC_46021.fields = {
	var_0_2.SC_46021_FIELD_LIST.SC_46021_RESULT_FIELD
}
SC_46021.is_extendable = false
SC_46021.extensions = {}
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD.name = "servant_id"
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD.full_name = ".common.cs_46030.servant_id"
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD.number = 1
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD.index = 0
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD.label = 2
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD.has_default_value = false
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD.default_value = "0"
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD.type = 4
var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD.cpp_type = 4
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD.name = "cost_uid_list"
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD.full_name = ".common.cs_46030.cost_uid_list"
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD.number = 2
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD.index = 1
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD.label = 3
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD.has_default_value = false
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD.default_value = {}
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD.type = 4
var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD.cpp_type = 4
CS_46030.name = "cs_46030"
CS_46030.full_name = ".common.cs_46030"
CS_46030.nested_types = {}
CS_46030.enum_types = {}
CS_46030.fields = {
	var_0_2.CS_46030_FIELD_LIST.CS_46030_SERVANT_ID_FIELD,
	var_0_2.CS_46030_FIELD_LIST.CS_46030_COST_UID_LIST_FIELD
}
CS_46030.is_extendable = false
CS_46030.extensions = {}
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD.name = "result"
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD.full_name = ".common.sc_46031.result"
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD.number = 1
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD.index = 0
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD.label = 2
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD.has_default_value = false
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD.default_value = 0
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD.type = 13
var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD.cpp_type = 3
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD.name = "servant_uid"
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD.full_name = ".common.sc_46031.servant_uid"
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD.number = 2
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD.index = 1
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD.label = 1
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD.has_default_value = false
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD.default_value = "0"
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD.type = 4
var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD.cpp_type = 4
SC_46031.name = "sc_46031"
SC_46031.full_name = ".common.sc_46031"
SC_46031.nested_types = {}
SC_46031.enum_types = {}
SC_46031.fields = {
	var_0_2.SC_46031_FIELD_LIST.SC_46031_RESULT_FIELD,
	var_0_2.SC_46031_FIELD_LIST.SC_46031_SERVANT_UID_FIELD
}
SC_46031.is_extendable = false
SC_46031.extensions = {}
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD.name = "servant_list"
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD.full_name = ".common.cs_46032.servant_list"
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD.number = 1
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD.index = 0
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD.label = 3
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD.has_default_value = false
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD.default_value = {}
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD.type = 4
var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD.cpp_type = 4
CS_46032.name = "cs_46032"
CS_46032.full_name = ".common.cs_46032"
CS_46032.nested_types = {}
CS_46032.enum_types = {}
CS_46032.fields = {
	var_0_2.CS_46032_FIELD_LIST.CS_46032_SERVANT_LIST_FIELD
}
CS_46032.is_extendable = false
CS_46032.extensions = {}
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD.name = "result"
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD.full_name = ".common.sc_46033.result"
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD.number = 1
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD.index = 0
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD.label = 2
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD.has_default_value = false
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD.default_value = 0
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD.type = 13
var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD.cpp_type = 3
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.name = "return_list"
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.full_name = ".common.sc_46033.return_list"
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.number = 2
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.index = 1
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.label = 3
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.has_default_value = false
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.default_value = {}
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.message_type = var_0_1.ITEM_NET_REC
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.type = 11
var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD.cpp_type = 10
SC_46033.name = "sc_46033"
SC_46033.full_name = ".common.sc_46033"
SC_46033.nested_types = {}
SC_46033.enum_types = {}
SC_46033.fields = {
	var_0_2.SC_46033_FIELD_LIST.SC_46033_RESULT_FIELD,
	var_0_2.SC_46033_FIELD_LIST.SC_46033_RETURN_LIST_FIELD
}
SC_46033.is_extendable = false
SC_46033.extensions = {}
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD.name = "hero_id"
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD.full_name = ".common.cs_46034.hero_id"
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD.number = 1
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD.index = 0
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD.label = 2
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD.has_default_value = false
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD.default_value = 0
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD.type = 13
var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD.cpp_type = 3
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.name = "material_list"
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.full_name = ".common.cs_46034.material_list"
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.number = 2
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.index = 1
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.label = 3
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.has_default_value = false
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.default_value = {}
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.message_type = var_0_1.ITEM_NET_REC
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.type = 11
var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD.cpp_type = 10
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD.name = "servant_list"
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD.full_name = ".common.cs_46034.servant_list"
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD.number = 3
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD.index = 2
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD.label = 3
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD.has_default_value = false
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD.default_value = {}
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD.type = 4
var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD.cpp_type = 4
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD.name = "target_level"
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD.full_name = ".common.cs_46034.target_level"
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD.number = 4
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD.index = 3
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD.label = 2
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD.has_default_value = false
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD.default_value = 0
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD.type = 13
var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD.cpp_type = 3
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD.name = "breakthrough_times"
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD.full_name = ".common.cs_46034.breakthrough_times"
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD.number = 5
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD.index = 4
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD.label = 2
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD.has_default_value = false
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD.default_value = 0
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD.type = 13
var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD.cpp_type = 3
CS_46034.name = "cs_46034"
CS_46034.full_name = ".common.cs_46034"
CS_46034.nested_types = {}
CS_46034.enum_types = {}
CS_46034.fields = {
	var_0_2.CS_46034_FIELD_LIST.CS_46034_HERO_ID_FIELD,
	var_0_2.CS_46034_FIELD_LIST.CS_46034_MATERIAL_LIST_FIELD,
	var_0_2.CS_46034_FIELD_LIST.CS_46034_SERVANT_LIST_FIELD,
	var_0_2.CS_46034_FIELD_LIST.CS_46034_TARGET_LEVEL_FIELD,
	var_0_2.CS_46034_FIELD_LIST.CS_46034_BREAKTHROUGH_TIMES_FIELD
}
CS_46034.is_extendable = false
CS_46034.extensions = {}
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD.name = "result"
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD.full_name = ".common.sc_46035.result"
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD.number = 1
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD.index = 0
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD.label = 2
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD.has_default_value = false
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD.default_value = 0
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD.type = 13
var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD.cpp_type = 3
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.name = "mat_list"
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.full_name = ".common.sc_46035.mat_list"
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.number = 2
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.index = 1
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.label = 3
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.has_default_value = false
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.default_value = {}
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.message_type = var_0_1.ITEM_NET_REC
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.type = 11
var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD.cpp_type = 10
SC_46035.name = "sc_46035"
SC_46035.full_name = ".common.sc_46035"
SC_46035.nested_types = {}
SC_46035.enum_types = {}
SC_46035.fields = {
	var_0_2.SC_46035_FIELD_LIST.SC_46035_RESULT_FIELD,
	var_0_2.SC_46035_FIELD_LIST.SC_46035_MAT_LIST_FIELD
}
SC_46035.is_extendable = false
SC_46035.extensions = {}
cs_46010 = var_0_0.Message(CS_46010)
cs_46012 = var_0_0.Message(CS_46012)
cs_46014 = var_0_0.Message(CS_46014)
cs_46016 = var_0_0.Message(CS_46016)
cs_46018 = var_0_0.Message(CS_46018)
cs_46020 = var_0_0.Message(CS_46020)
cs_46030 = var_0_0.Message(CS_46030)
cs_46032 = var_0_0.Message(CS_46032)
cs_46034 = var_0_0.Message(CS_46034)
sc_46011 = var_0_0.Message(SC_46011)
sc_46013 = var_0_0.Message(SC_46013)
sc_46015 = var_0_0.Message(SC_46015)
sc_46017 = var_0_0.Message(SC_46017)
sc_46019 = var_0_0.Message(SC_46019)
sc_46021 = var_0_0.Message(SC_46021)
sc_46031 = var_0_0.Message(SC_46031)
sc_46033 = var_0_0.Message(SC_46033)
sc_46035 = var_0_0.Message(SC_46035)
weapon_servant_pb = var_0_0.Message(WEAPON_SERVANT_PB)

return p46_pb
