LJ^  6  99 8::  " L 
valueweapon_fixed_attributesGameSetting 
  , )  6  9 ) )˙˙M	6	 8		9	  X	 ! XO÷  J weapon_lv_exp_sumGameLevelSettingWEAPON_LV_MAXHeroConstv  
+  6  99  86 89L weapon_lv_exp_sumGameLevelSetting
valueweapon_exp_limitGameSetting  )  )  )  + -  9  B   X	! + 6	 9		
 B	
 	 	 
   J	  ŔExpToLvWeaponToolsCurMaxExpô  ')   X)  4  J 6  99  8  X6 B6 89) 4  ::	 X::)  ) M	 6
 8B
<
	Oú  J deepCloneitem_listEquipMaterialCfg
print
valueweapon_break_costGameSetting =4  -  9 9B6 999 8)   X9  X9 X6 98  X9 9	:9		:		<	::	 "	 ":  X	)   >6
 8 99 8::	:
8

 
 X)
   	
	<	L  Ŕweapon_break_attributeHeroCfgattributeattrib_additionWeaponServantCfgidbreakthrough
valueweapon_fixed_attributesGameSettingexpExpToLv ÷Ńđúáőü˛   6    B6 ' B6 89:6 9 6 9 B6	 6	
 8		9		:		)
 ,  B C strengthen_descriptionWeaponEffectCfgGetCfgDescriptiongetItemNameItemToolsformatstringeffectWeaponServantCfg'WEAPON_MODULE_SKILL_TIP_TEMPLATE_4GetTips#getWeaponServantAffectByModule+   9  9   X+ X+ L exp+   9  9   X+ X+ L exp˛
 # 4  4  )   )	 M	6  9 5 8
 9=BO÷4  ) 	  )
 MB8 6 989:6 96 96 9	#B9
B)  B<8"!)   X$)  X!  ) )˙˙M8 6 989:6 9#B6 98 B 6 9)  8!B<"!" Oä)   XXOž) 	  )
 M	8  X)  <88=O÷ )	 )
˙˙M
89	 X6  9  BOö) 	 )
 M"86 989)  X9
	  X+ X+   X6 9896 998)   X6  9 9B!OŢ)   X` 4	  6
 6 96 998B
X6 896 99 X6  9	 5 =6 89:=BERë6
  9

	 3 B
)
 	 ) M
8	9 X
U	8	8	9 =8	9!Xň)   XX
O
í)
  
 X

	 8

		 8	9 =

	 ) )˙˙M
8	9)   X6  9	  BO
ő6
  9

	 3  B
6
! 9
"
 	 B

  	 !
2  J MergeMaterialListByNameWeaponTools  	sortexp num WEAPON_LEVEL_UPMATERIAL_TYPEMaterialConstsub_typeMATERIALITEM_TYPEItemConstget_id_list_by_typeipairsuid
valuebase_exp_weapon_servantGameSetting	rareremovenum	modfnumber	ceilminmax	math
paramItemCfg num idinsert
table    6   BX+ 6  	  BX
:: X:: >+ XERô X6 9	  
 BERćL  insert
tableipairs   6   BX+ 6  	  BX
99 X99 =+ XERô X6 9	  
 BERćL  insert
tablenumidipairs+   9  9   X+ X+ L expť  ?4  6  6 96 998BX6 896	 9		9				 X6
 9	 5
 =
6 89:=
BERë6
 9 3 B) )  ) M89  X XOů6 989B6 989# B  2  J 	ceil	mathgetItemNameItemTools 	sortexp
paramid  insert
tableWEAPON_LEVEL_UPMATERIAL_TYPEMaterialConstsub_typeMATERIALITEM_TYPEItemConstget_id_list_by_typeItemCfgipairs>   6    BX9 XL ERúK  uidipairs¸   4   3 =  3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 2  L   GetServantByUid GetMaterialAndNum MergeMaterialListByName MergeMaterialList QuickSelectList GetWeaponModuleDes CalWeaponAttribute BreakMaterial AddWeaponExp CurMaxExp ExpToLv WeaponAtk 