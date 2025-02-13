﻿local var_0_0 = require("protobuf")
local var_0_1 = require("protocol/chapter_hrl_pb")

module("p47_pb", package.seeall)

local var_0_2 = {
	SC_47001_FIELD_LIST = {},
	SC_47003_FIELD_LIST = {},
	HERO_TEACHING_FIELD_LIST = {}
}

SC_47001 = var_0_0.Descriptor()
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD = var_0_0.FieldDescriptor()
SC_47003 = var_0_0.Descriptor()
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD = var_0_0.FieldDescriptor()
HERO_TEACHING = var_0_0.Descriptor()
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD = var_0_0.FieldDescriptor()
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD = var_0_0.FieldDescriptor()
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.name = "base_stage_list"
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.full_name = ".common.sc_47001.base_stage_list"
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.number = 1
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.index = 0
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.label = 3
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.has_default_value = false
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.default_value = {}
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.message_type = var_0_1.CHAPTER_INFO
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.type = 11
var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD.cpp_type = 10
SC_47001.name = "sc_47001"
SC_47001.full_name = ".common.sc_47001"
SC_47001.nested_types = {}
SC_47001.enum_types = {}
SC_47001.fields = {
	var_0_2.SC_47001_FIELD_LIST.SC_47001_BASE_STAGE_LIST_FIELD
}
SC_47001.is_extendable = false
SC_47001.extensions = {}
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.name = "hero_teaching_list"
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.full_name = ".common.sc_47003.hero_teaching_list"
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.number = 1
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.index = 0
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.label = 3
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.has_default_value = false
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.default_value = {}
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.message_type = HERO_TEACHING
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.type = 11
var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD.cpp_type = 10
SC_47003.name = "sc_47003"
SC_47003.full_name = ".common.sc_47003"
SC_47003.nested_types = {}
SC_47003.enum_types = {}
SC_47003.fields = {
	var_0_2.SC_47003_FIELD_LIST.SC_47003_HERO_TEACHING_LIST_FIELD
}
SC_47003.is_extendable = false
SC_47003.extensions = {}
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD.name = "hero_id"
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD.full_name = ".common.hero_teaching.hero_id"
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD.number = 1
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD.index = 0
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD.label = 2
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD.has_default_value = false
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD.default_value = 0
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD.type = 13
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD.cpp_type = 3
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.name = "stage_list"
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.full_name = ".common.hero_teaching.stage_list"
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.number = 2
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.index = 1
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.label = 3
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.has_default_value = false
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.default_value = {}
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.message_type = var_0_1.CHAPTER_INFO
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.type = 11
var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD.cpp_type = 10
HERO_TEACHING.name = "hero_teaching"
HERO_TEACHING.full_name = ".common.hero_teaching"
HERO_TEACHING.nested_types = {}
HERO_TEACHING.enum_types = {}
HERO_TEACHING.fields = {
	var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_HERO_ID_FIELD,
	var_0_2.HERO_TEACHING_FIELD_LIST.HERO_TEACHING_STAGE_LIST_FIELD
}
HERO_TEACHING.is_extendable = false
HERO_TEACHING.extensions = {}
hero_teaching = var_0_0.Message(HERO_TEACHING)
sc_47001 = var_0_0.Message(SC_47001)
sc_47003 = var_0_0.Message(SC_47003)

return p47_pb
