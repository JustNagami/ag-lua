﻿local var_0_0 = require("protobuf")

module("p22_pb", package.seeall)

local var_0_1 = {
	SC_22007_FIELD_LIST = {},
	SC_22009_FIELD_LIST = {},
	CS_22010_FIELD_LIST = {},
	SC_22011_FIELD_LIST = {},
	CS_22012_FIELD_LIST = {},
	SC_22013_FIELD_LIST = {},
	CS_22014_FIELD_LIST = {},
	SC_22015_FIELD_LIST = {}
}

SC_22007 = var_0_0.Descriptor()
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD = var_0_0.FieldDescriptor()
SC_22009 = var_0_0.Descriptor()
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD = var_0_0.FieldDescriptor()
CS_22010 = var_0_0.Descriptor()
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD = var_0_0.FieldDescriptor()
SC_22011 = var_0_0.Descriptor()
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD = var_0_0.FieldDescriptor()
CS_22012 = var_0_0.Descriptor()
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD = var_0_0.FieldDescriptor()
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD = var_0_0.FieldDescriptor()
SC_22013 = var_0_0.Descriptor()
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD = var_0_0.FieldDescriptor()
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD = var_0_0.FieldDescriptor()
CS_22014 = var_0_0.Descriptor()
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD = var_0_0.FieldDescriptor()
SC_22015 = var_0_0.Descriptor()
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD = var_0_0.FieldDescriptor()
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD.name = "left_time"
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD.full_name = ".p22.sc_22007.left_time"
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD.number = 1
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD.index = 0
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD.label = 2
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD.has_default_value = false
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD.default_value = 0
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD.type = 13
var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD.cpp_type = 3
SC_22007.name = "sc_22007"
SC_22007.full_name = ".p22.sc_22007"
SC_22007.nested_types = {}
SC_22007.enum_types = {}
SC_22007.fields = {
	var_0_1.SC_22007_FIELD_LIST.SC_22007_LEFT_TIME_FIELD
}
SC_22007.is_extendable = false
SC_22007.extensions = {}
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD.name = "fatigue"
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD.full_name = ".p22.sc_22009.fatigue"
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD.number = 1
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD.index = 0
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD.label = 2
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD.has_default_value = false
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD.default_value = 0
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD.type = 13
var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD.cpp_type = 3
SC_22009.name = "sc_22009"
SC_22009.full_name = ".p22.sc_22009"
SC_22009.nested_types = {}
SC_22009.enum_types = {}
SC_22009.fields = {
	var_0_1.SC_22009_FIELD_LIST.SC_22009_FATIGUE_FIELD
}
SC_22009.is_extendable = false
SC_22009.extensions = {}
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD.name = "nothing"
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD.full_name = ".p22.cs_22010.nothing"
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD.number = 1
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD.index = 0
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD.label = 2
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD.has_default_value = false
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD.default_value = 0
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD.type = 13
var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD.cpp_type = 3
CS_22010.name = "cs_22010"
CS_22010.full_name = ".p22.cs_22010"
CS_22010.nested_types = {}
CS_22010.enum_types = {}
CS_22010.fields = {
	var_0_1.CS_22010_FIELD_LIST.CS_22010_NOTHING_FIELD
}
CS_22010.is_extendable = false
CS_22010.extensions = {}
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD.name = "result"
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD.full_name = ".p22.sc_22011.result"
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD.number = 1
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD.index = 0
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD.label = 2
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD.has_default_value = false
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD.default_value = 0
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD.type = 13
var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD.cpp_type = 3
SC_22011.name = "sc_22011"
SC_22011.full_name = ".p22.sc_22011"
SC_22011.nested_types = {}
SC_22011.enum_types = {}
SC_22011.fields = {
	var_0_1.SC_22011_FIELD_LIST.SC_22011_RESULT_FIELD
}
SC_22011.is_extendable = false
SC_22011.extensions = {}
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD.name = "request"
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD.full_name = ".p22.cs_22012.request"
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD.number = 1
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD.index = 0
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD.label = 2
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD.has_default_value = false
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD.default_value = 0
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD.type = 13
var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD.cpp_type = 3
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD.name = "timestamp"
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD.full_name = ".p22.cs_22012.timestamp"
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD.number = 2
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD.index = 1
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD.label = 2
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD.has_default_value = false
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD.default_value = 0
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD.type = 13
var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD.cpp_type = 3
CS_22012.name = "cs_22012"
CS_22012.full_name = ".p22.cs_22012"
CS_22012.nested_types = {}
CS_22012.enum_types = {}
CS_22012.fields = {
	var_0_1.CS_22012_FIELD_LIST.CS_22012_REQUEST_FIELD,
	var_0_1.CS_22012_FIELD_LIST.CS_22012_TIMESTAMP_FIELD
}
CS_22012.is_extendable = false
CS_22012.extensions = {}
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD.name = "timestamp"
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD.full_name = ".p22.sc_22013.timestamp"
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD.number = 1
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD.index = 0
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD.label = 2
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD.has_default_value = false
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD.default_value = 0
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD.type = 13
var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD.cpp_type = 3
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD.name = "result"
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD.full_name = ".p22.sc_22013.result"
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD.number = 2
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD.index = 1
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD.label = 2
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD.has_default_value = false
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD.default_value = 0
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD.type = 13
var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD.cpp_type = 3
SC_22013.name = "sc_22013"
SC_22013.full_name = ".p22.sc_22013"
SC_22013.nested_types = {}
SC_22013.enum_types = {}
SC_22013.fields = {
	var_0_1.SC_22013_FIELD_LIST.SC_22013_TIMESTAMP_FIELD,
	var_0_1.SC_22013_FIELD_LIST.SC_22013_RESULT_FIELD
}
SC_22013.is_extendable = false
SC_22013.extensions = {}
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD.name = "add_fatigue"
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD.full_name = ".p22.cs_22014.add_fatigue"
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD.number = 1
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD.index = 0
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD.label = 2
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD.has_default_value = false
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD.default_value = 0
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD.type = 13
var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD.cpp_type = 3
CS_22014.name = "cs_22014"
CS_22014.full_name = ".p22.cs_22014"
CS_22014.nested_types = {}
CS_22014.enum_types = {}
CS_22014.fields = {
	var_0_1.CS_22014_FIELD_LIST.CS_22014_ADD_FATIGUE_FIELD
}
CS_22014.is_extendable = false
CS_22014.extensions = {}
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD.name = "result"
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD.full_name = ".p22.sc_22015.result"
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD.number = 1
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD.index = 0
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD.label = 2
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD.has_default_value = false
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD.default_value = 0
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD.type = 13
var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD.cpp_type = 3
SC_22015.name = "sc_22015"
SC_22015.full_name = ".p22.sc_22015"
SC_22015.nested_types = {}
SC_22015.enum_types = {}
SC_22015.fields = {
	var_0_1.SC_22015_FIELD_LIST.SC_22015_RESULT_FIELD
}
SC_22015.is_extendable = false
SC_22015.extensions = {}
cs_22010 = var_0_0.Message(CS_22010)
cs_22012 = var_0_0.Message(CS_22012)
cs_22014 = var_0_0.Message(CS_22014)
sc_22007 = var_0_0.Message(SC_22007)
sc_22009 = var_0_0.Message(SC_22009)
sc_22011 = var_0_0.Message(SC_22011)
sc_22013 = var_0_0.Message(SC_22013)
sc_22015 = var_0_0.Message(SC_22015)

return p22_pb