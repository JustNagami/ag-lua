﻿local var_0_0 = require("protobuf")

module("chapter_hrl_pb", package.seeall)

local var_0_1 = {
	CHAPTER_INFO_FIELD_LIST = {}
}

CHAPTER_INFO = var_0_0.Descriptor()
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD = var_0_0.FieldDescriptor()
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD = var_0_0.FieldDescriptor()
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD = var_0_0.FieldDescriptor()
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD.name = "id"
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD.full_name = ".common.chapter_info.id"
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD.number = 1
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD.index = 0
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD.label = 2
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD.has_default_value = false
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD.default_value = 0
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD.type = 13
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD.cpp_type = 3
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD.name = "star_list"
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD.full_name = ".common.chapter_info.star_list"
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD.number = 2
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD.index = 1
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD.label = 1
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD.has_default_value = false
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD.default_value = 0
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD.type = 13
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD.cpp_type = 3
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD.name = "clear_times"
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD.full_name = ".common.chapter_info.clear_times"
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD.number = 3
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD.index = 2
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD.label = 2
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD.has_default_value = false
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD.default_value = 0
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD.type = 13
var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD.cpp_type = 3
CHAPTER_INFO.name = "chapter_info"
CHAPTER_INFO.full_name = ".common.chapter_info"
CHAPTER_INFO.nested_types = {}
CHAPTER_INFO.enum_types = {}
CHAPTER_INFO.fields = {
	var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_ID_FIELD,
	var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_STAR_LIST_FIELD,
	var_0_1.CHAPTER_INFO_FIELD_LIST.CHAPTER_INFO_CLEAR_TIMES_FIELD
}
CHAPTER_INFO.is_extendable = false
CHAPTER_INFO.extensions = {}
chapter_info = var_0_0.Message(CHAPTER_INFO)

return chapter_hrl_pb
