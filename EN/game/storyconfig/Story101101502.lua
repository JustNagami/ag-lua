return {
	Play110152001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 110152001
		arg_1_1.duration_ = 7.566

		local var_1_0 = {
			ja = 5.033,
			ko = 7.566,
			zh = 7.166,
			en = 5.366
		}
		local var_1_1 = manager.audio:GetLocalizationFlag()

		if var_1_0[var_1_1] ~= nil then
			arg_1_1.duration_ = var_1_0[var_1_1]
		end

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play110152002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "B12a"

			if arg_1_1.bgs_[var_4_0] == nil then
				local var_4_1 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_0)
				var_4_1.name = var_4_0
				var_4_1.transform.parent = arg_1_1.stage_.transform
				var_4_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_0] = var_4_1
			end

			local var_4_2 = 0

			if var_4_2 < arg_1_1.time_ and arg_1_1.time_ <= var_4_2 + arg_4_0 then
				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.B12a

				var_4_5.transform.localPosition = var_4_4
				var_4_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_6 = var_4_5:GetComponent("SpriteRenderer")

				if var_4_6 and var_4_6.sprite then
					local var_4_7 = (var_4_5.transform.localPosition - var_4_3).z
					local var_4_8 = manager.ui.mainCameraCom_
					local var_4_9 = 2 * var_4_7 * Mathf.Tan(var_4_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_10 = var_4_9 * var_4_8.aspect
					local var_4_11 = var_4_6.sprite.bounds.size.x
					local var_4_12 = var_4_6.sprite.bounds.size.y
					local var_4_13 = var_4_10 / var_4_11
					local var_4_14 = var_4_9 / var_4_12
					local var_4_15 = var_4_14 < var_4_13 and var_4_13 or var_4_14

					var_4_5.transform.localScale = Vector3.New(var_4_15, var_4_15, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "B12a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = "1184ui_story"

			if arg_1_1.actors_[var_4_16] == nil then
				local var_4_17 = Object.Instantiate(Asset.Load("Char/" .. var_4_16), arg_1_1.stage_.transform)

				var_4_17.name = var_4_16
				var_4_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_16] = var_4_17

				local var_4_18 = var_4_17:GetComponentInChildren(typeof(CharacterEffect))

				var_4_18.enabled = true

				local var_4_19 = GameObjectTools.GetOrAddComponent(var_4_17, typeof(DynamicBoneHelper))

				if var_4_19 then
					var_4_19:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_18.transform, false)

				arg_1_1.var_[var_4_16 .. "Animator"] = var_4_18.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_16 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_16 .. "LipSync"] = var_4_18.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_20 = arg_1_1.actors_["1184ui_story"].transform
			local var_4_21 = 1.8

			if var_4_21 < arg_1_1.time_ and arg_1_1.time_ <= var_4_21 + arg_4_0 then
				arg_1_1.var_.moveOldPos1184ui_story = var_4_20.localPosition
			end

			local var_4_22 = 0.001

			if var_4_21 <= arg_1_1.time_ and arg_1_1.time_ < var_4_21 + var_4_22 then
				local var_4_23 = (arg_1_1.time_ - var_4_21) / var_4_22
				local var_4_24 = Vector3.New(0, -0.97, -6)

				var_4_20.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1184ui_story, var_4_24, var_4_23)

				local var_4_25 = manager.ui.mainCamera.transform.position - var_4_20.position

				var_4_20.forward = Vector3.New(var_4_25.x, var_4_25.y, var_4_25.z)

				local var_4_26 = var_4_20.localEulerAngles

				var_4_26.z = 0
				var_4_26.x = 0
				var_4_20.localEulerAngles = var_4_26
			end

			if arg_1_1.time_ >= var_4_21 + var_4_22 and arg_1_1.time_ < var_4_21 + var_4_22 + arg_4_0 then
				var_4_20.localPosition = Vector3.New(0, -0.97, -6)

				local var_4_27 = manager.ui.mainCamera.transform.position - var_4_20.position

				var_4_20.forward = Vector3.New(var_4_27.x, var_4_27.y, var_4_27.z)

				local var_4_28 = var_4_20.localEulerAngles

				var_4_28.z = 0
				var_4_28.x = 0
				var_4_20.localEulerAngles = var_4_28
			end

			local var_4_29 = 1.8

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action4_1")
			end

			local var_4_30 = 1.8

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_4_31 = arg_1_1.bgs_.B12a
			local var_4_32 = 0

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				local var_4_33 = var_4_31:GetComponent("SpriteRenderer")

				if var_4_33 then
					var_4_33.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_34 = var_4_33.material
					local var_4_35 = var_4_34:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB12a = var_4_35.a
					arg_1_1.var_.alphaMatValueB12a = var_4_34
				end

				arg_1_1.var_.alphaOldValueB12a = 0
			end

			local var_4_36 = 1.5

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_36 then
				local var_4_37 = (arg_1_1.time_ - var_4_32) / var_4_36
				local var_4_38 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB12a, 1, var_4_37)

				if arg_1_1.var_.alphaMatValueB12a then
					local var_4_39 = arg_1_1.var_.alphaMatValueB12a
					local var_4_40 = var_4_39:GetColor("_Color")

					var_4_40.a = var_4_38

					var_4_39:SetColor("_Color", var_4_40)
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_36 and arg_1_1.time_ < var_4_32 + var_4_36 + arg_4_0 and arg_1_1.var_.alphaMatValueB12a then
				local var_4_41 = arg_1_1.var_.alphaMatValueB12a
				local var_4_42 = var_4_41:GetColor("_Color")

				var_4_42.a = 1

				var_4_41:SetColor("_Color", var_4_42)
			end

			local var_4_43 = manager.ui.mainCamera.transform
			local var_4_44 = 0.5

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				arg_1_1.var_.shakeOldPos = var_4_43.localPosition
			end

			local var_4_45 = 1

			if var_4_44 <= arg_1_1.time_ and arg_1_1.time_ < var_4_44 + var_4_45 then
				local var_4_46 = (arg_1_1.time_ - var_4_44) / 0.066
				local var_4_47, var_4_48 = math.modf(var_4_46)

				var_4_43.localPosition = Vector3.New(var_4_48 * 0.13, var_4_48 * 0.13, var_4_48 * 0.13) + arg_1_1.var_.shakeOldPos
			end

			if arg_1_1.time_ >= var_4_44 + var_4_45 and arg_1_1.time_ < var_4_44 + var_4_45 + arg_4_0 then
				var_4_43.localPosition = arg_1_1.var_.shakeOldPos
			end

			local var_4_49 = arg_1_1.actors_["1184ui_story"]
			local var_4_50 = 1.8

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 and arg_1_1.var_.characterEffect1184ui_story == nil then
				arg_1_1.var_.characterEffect1184ui_story = var_4_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_51 = 0.2

			if var_4_50 <= arg_1_1.time_ and arg_1_1.time_ < var_4_50 + var_4_51 then
				local var_4_52 = (arg_1_1.time_ - var_4_50) / var_4_51

				if arg_1_1.var_.characterEffect1184ui_story then
					arg_1_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_50 + var_4_51 and arg_1_1.time_ < var_4_50 + var_4_51 + arg_4_0 and arg_1_1.var_.characterEffect1184ui_story then
				arg_1_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_4_53 = 0

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_54 = 2

			if arg_1_1.time_ >= var_4_53 + var_4_54 and arg_1_1.time_ < var_4_53 + var_4_54 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_55 = 0
			local var_4_56 = 0.6

			if var_4_55 < arg_1_1.time_ and arg_1_1.time_ <= var_4_55 + arg_4_0 then
				local var_4_57 = "play"
				local var_4_58 = "music"

				arg_1_1:AudioAction(var_4_57, var_4_58, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_59 = 0.738461699336767
			local var_4_60 = 1

			if var_4_59 < arg_1_1.time_ and arg_1_1.time_ <= var_4_59 + arg_4_0 then
				local var_4_61 = "play"
				local var_4_62 = "music"

				arg_1_1:AudioAction(var_4_61, var_4_62, "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2", "bgm_story_v1_battleground_2.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_63 = 2
			local var_4_64 = 0.475

			if var_4_63 < arg_1_1.time_ and arg_1_1.time_ <= var_4_63 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_65 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_65:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_65:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_65:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_66 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_66

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_67 = arg_1_1:GetWordFromCfg(110152001)
				local var_4_68 = arg_1_1:FormatText(var_4_67.content)

				arg_1_1.text_.text = var_4_68

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_69 = 19
				local var_4_70 = utf8.len(var_4_68)
				local var_4_71 = var_4_69 <= 0 and var_4_64 or var_4_64 * (var_4_70 / var_4_69)

				if var_4_71 > 0 and var_4_64 < var_4_71 then
					arg_1_1.talkMaxDuration = var_4_71
					var_4_63 = var_4_63 + 0.3

					if var_4_71 + var_4_63 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_71 + var_4_63
					end
				end

				arg_1_1.text_.text = var_4_68
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152001", "story_v_out_110152.awb") ~= 0 then
					local var_4_72 = manager.audio:GetVoiceLength("story_v_out_110152", "110152001", "story_v_out_110152.awb") / 1000

					if var_4_72 + var_4_63 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_72 + var_4_63
					end

					if var_4_67.prefab_name ~= "" and arg_1_1.actors_[var_4_67.prefab_name] ~= nil then
						local var_4_73 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_67.prefab_name].transform, "story_v_out_110152", "110152001", "story_v_out_110152.awb")

						arg_1_1:RecordAudio("110152001", var_4_73)
						arg_1_1:RecordAudio("110152001", var_4_73)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_110152", "110152001", "story_v_out_110152.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_110152", "110152001", "story_v_out_110152.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_74 = var_4_63 + 0.3
			local var_4_75 = math.max(var_4_64, arg_1_1.talkMaxDuration)

			if var_4_74 <= arg_1_1.time_ and arg_1_1.time_ < var_4_74 + var_4_75 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_74) / var_4_75

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_74 + var_4_75 and arg_1_1.time_ < var_4_74 + var_4_75 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play110152002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 110152002
		arg_7_1.duration_ = 7.766

		local var_7_0 = {
			ja = 5.833,
			ko = 7.5,
			zh = 5.766,
			en = 7.766
		}
		local var_7_1 = manager.audio:GetLocalizationFlag()

		if var_7_0[var_7_1] ~= nil then
			arg_7_1.duration_ = var_7_0[var_7_1]
		end

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play110152003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.actors_["1184ui_story"].transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPos1184ui_story = var_10_0.localPosition
			end

			local var_10_2 = 0.001

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2
				local var_10_4 = Vector3.New(0, 100, 0)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1184ui_story, var_10_4, var_10_3)

				local var_10_5 = manager.ui.mainCamera.transform.position - var_10_0.position

				var_10_0.forward = Vector3.New(var_10_5.x, var_10_5.y, var_10_5.z)

				local var_10_6 = var_10_0.localEulerAngles

				var_10_6.z = 0
				var_10_6.x = 0
				var_10_0.localEulerAngles = var_10_6
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(0, 100, 0)

				local var_10_7 = manager.ui.mainCamera.transform.position - var_10_0.position

				var_10_0.forward = Vector3.New(var_10_7.x, var_10_7.y, var_10_7.z)

				local var_10_8 = var_10_0.localEulerAngles

				var_10_8.z = 0
				var_10_8.x = 0
				var_10_0.localEulerAngles = var_10_8
			end

			local var_10_9 = 0
			local var_10_10 = 0.725

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_11 = arg_7_1:FormatText(StoryNameCfg[10].name)

				arg_7_1.leftNameTxt_.text = var_10_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_12 = arg_7_1:GetWordFromCfg(110152002)
				local var_10_13 = arg_7_1:FormatText(var_10_12.content)

				arg_7_1.text_.text = var_10_13

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_14 = 29
				local var_10_15 = utf8.len(var_10_13)
				local var_10_16 = var_10_14 <= 0 and var_10_10 or var_10_10 * (var_10_15 / var_10_14)

				if var_10_16 > 0 and var_10_10 < var_10_16 then
					arg_7_1.talkMaxDuration = var_10_16

					if var_10_16 + var_10_9 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_16 + var_10_9
					end
				end

				arg_7_1.text_.text = var_10_13
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152002", "story_v_out_110152.awb") ~= 0 then
					local var_10_17 = manager.audio:GetVoiceLength("story_v_out_110152", "110152002", "story_v_out_110152.awb") / 1000

					if var_10_17 + var_10_9 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_17 + var_10_9
					end

					if var_10_12.prefab_name ~= "" and arg_7_1.actors_[var_10_12.prefab_name] ~= nil then
						local var_10_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_12.prefab_name].transform, "story_v_out_110152", "110152002", "story_v_out_110152.awb")

						arg_7_1:RecordAudio("110152002", var_10_18)
						arg_7_1:RecordAudio("110152002", var_10_18)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_110152", "110152002", "story_v_out_110152.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_110152", "110152002", "story_v_out_110152.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_19 = math.max(var_10_10, arg_7_1.talkMaxDuration)

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_19 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_9) / var_10_19

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_9 + var_10_19 and arg_7_1.time_ < var_10_9 + var_10_19 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play110152003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 110152003
		arg_11_1.duration_ = 6.066

		local var_11_0 = {
			ja = 6.066,
			ko = 5.2,
			zh = 3.4,
			en = 4.733
		}
		local var_11_1 = manager.audio:GetLocalizationFlag()

		if var_11_0[var_11_1] ~= nil then
			arg_11_1.duration_ = var_11_0[var_11_1]
		end

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play110152004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_14_1 = arg_11_1.actors_["1184ui_story"]
			local var_14_2 = 0

			if var_14_2 < arg_11_1.time_ and arg_11_1.time_ <= var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1184ui_story == nil then
				arg_11_1.var_.characterEffect1184ui_story = var_14_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_3 = 0.2

			if var_14_2 <= arg_11_1.time_ and arg_11_1.time_ < var_14_2 + var_14_3 then
				local var_14_4 = (arg_11_1.time_ - var_14_2) / var_14_3

				if arg_11_1.var_.characterEffect1184ui_story then
					arg_11_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_11_1.time_ >= var_14_2 + var_14_3 and arg_11_1.time_ < var_14_2 + var_14_3 + arg_14_0 and arg_11_1.var_.characterEffect1184ui_story then
				arg_11_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_14_6 = arg_11_1.actors_["1184ui_story"].transform
			local var_14_7 = 0

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.var_.moveOldPos1184ui_story = var_14_6.localPosition

				local var_14_8 = "1184ui_story"

				arg_11_1:ShowWeapon(arg_11_1.var_[var_14_8 .. "Animator"].transform, false)
			end

			local var_14_9 = 0.001

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_9 then
				local var_14_10 = (arg_11_1.time_ - var_14_7) / var_14_9
				local var_14_11 = Vector3.New(0, -0.97, -6)

				var_14_6.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos1184ui_story, var_14_11, var_14_10)

				local var_14_12 = manager.ui.mainCamera.transform.position - var_14_6.position

				var_14_6.forward = Vector3.New(var_14_12.x, var_14_12.y, var_14_12.z)

				local var_14_13 = var_14_6.localEulerAngles

				var_14_13.z = 0
				var_14_13.x = 0
				var_14_6.localEulerAngles = var_14_13
			end

			if arg_11_1.time_ >= var_14_7 + var_14_9 and arg_11_1.time_ < var_14_7 + var_14_9 + arg_14_0 then
				var_14_6.localPosition = Vector3.New(0, -0.97, -6)

				local var_14_14 = manager.ui.mainCamera.transform.position - var_14_6.position

				var_14_6.forward = Vector3.New(var_14_14.x, var_14_14.y, var_14_14.z)

				local var_14_15 = var_14_6.localEulerAngles

				var_14_15.z = 0
				var_14_15.x = 0
				var_14_6.localEulerAngles = var_14_15
			end

			local var_14_16 = 0
			local var_14_17 = 0.45

			if var_14_16 < arg_11_1.time_ and arg_11_1.time_ <= var_14_16 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_18 = arg_11_1:FormatText(StoryNameCfg[6].name)

				arg_11_1.leftNameTxt_.text = var_14_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_19 = arg_11_1:GetWordFromCfg(110152003)
				local var_14_20 = arg_11_1:FormatText(var_14_19.content)

				arg_11_1.text_.text = var_14_20

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_21 = 18
				local var_14_22 = utf8.len(var_14_20)
				local var_14_23 = var_14_21 <= 0 and var_14_17 or var_14_17 * (var_14_22 / var_14_21)

				if var_14_23 > 0 and var_14_17 < var_14_23 then
					arg_11_1.talkMaxDuration = var_14_23

					if var_14_23 + var_14_16 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_23 + var_14_16
					end
				end

				arg_11_1.text_.text = var_14_20
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152003", "story_v_out_110152.awb") ~= 0 then
					local var_14_24 = manager.audio:GetVoiceLength("story_v_out_110152", "110152003", "story_v_out_110152.awb") / 1000

					if var_14_24 + var_14_16 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_24 + var_14_16
					end

					if var_14_19.prefab_name ~= "" and arg_11_1.actors_[var_14_19.prefab_name] ~= nil then
						local var_14_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_19.prefab_name].transform, "story_v_out_110152", "110152003", "story_v_out_110152.awb")

						arg_11_1:RecordAudio("110152003", var_14_25)
						arg_11_1:RecordAudio("110152003", var_14_25)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_110152", "110152003", "story_v_out_110152.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_110152", "110152003", "story_v_out_110152.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_26 = math.max(var_14_17, arg_11_1.talkMaxDuration)

			if var_14_16 <= arg_11_1.time_ and arg_11_1.time_ < var_14_16 + var_14_26 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_16) / var_14_26

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_16 + var_14_26 and arg_11_1.time_ < var_14_16 + var_14_26 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play110152004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 110152004
		arg_15_1.duration_ = 16.433

		local var_15_0 = {
			ja = 16.433,
			ko = 13.8,
			zh = 12.833,
			en = 15.166
		}
		local var_15_1 = manager.audio:GetLocalizationFlag()

		if var_15_0[var_15_1] ~= nil then
			arg_15_1.duration_ = var_15_0[var_15_1]
		end

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play110152005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["1184ui_story"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.characterEffect1184ui_story == nil then
				arg_15_1.var_.characterEffect1184ui_story = var_18_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_2 = 0.2

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.characterEffect1184ui_story then
					local var_18_4 = Mathf.Lerp(0, 0.5, var_18_3)

					arg_15_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_15_1.var_.characterEffect1184ui_story.fillRatio = var_18_4
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.characterEffect1184ui_story then
				local var_18_5 = 0.5

				arg_15_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_15_1.var_.characterEffect1184ui_story.fillRatio = var_18_5
			end

			local var_18_6 = 0
			local var_18_7 = 1.775

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[10].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(110152004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 71
				local var_18_12 = utf8.len(var_18_10)
				local var_18_13 = var_18_11 <= 0 and var_18_7 or var_18_7 * (var_18_12 / var_18_11)

				if var_18_13 > 0 and var_18_7 < var_18_13 then
					arg_15_1.talkMaxDuration = var_18_13

					if var_18_13 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_13 + var_18_6
					end
				end

				arg_15_1.text_.text = var_18_10
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152004", "story_v_out_110152.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152004", "story_v_out_110152.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_110152", "110152004", "story_v_out_110152.awb")

						arg_15_1:RecordAudio("110152004", var_18_15)
						arg_15_1:RecordAudio("110152004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_110152", "110152004", "story_v_out_110152.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_110152", "110152004", "story_v_out_110152.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_16 = math.max(var_18_7, arg_15_1.talkMaxDuration)

			if var_18_6 <= arg_15_1.time_ and arg_15_1.time_ < var_18_6 + var_18_16 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_6) / var_18_16

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_6 + var_18_16 and arg_15_1.time_ < var_18_6 + var_18_16 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play110152005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 110152005
		arg_19_1.duration_ = 4.666

		local var_19_0 = {
			ja = 4.666,
			ko = 3,
			zh = 2.8,
			en = 3.566
		}
		local var_19_1 = manager.audio:GetLocalizationFlag()

		if var_19_0[var_19_1] ~= nil then
			arg_19_1.duration_ = var_19_0[var_19_1]
		end

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play110152006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1184ui_story"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.characterEffect1184ui_story == nil then
				arg_19_1.var_.characterEffect1184ui_story = var_22_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.characterEffect1184ui_story then
					arg_19_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.characterEffect1184ui_story then
				arg_19_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_22_4 = 0

			if var_22_4 < arg_19_1.time_ and arg_19_1.time_ <= var_22_4 + arg_22_0 then
				arg_19_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4135")
			end

			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_22_6 = 0
			local var_22_7 = 0.375

			if var_22_6 < arg_19_1.time_ and arg_19_1.time_ <= var_22_6 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_8 = arg_19_1:FormatText(StoryNameCfg[6].name)

				arg_19_1.leftNameTxt_.text = var_22_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_9 = arg_19_1:GetWordFromCfg(110152005)
				local var_22_10 = arg_19_1:FormatText(var_22_9.content)

				arg_19_1.text_.text = var_22_10

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_11 = 15
				local var_22_12 = utf8.len(var_22_10)
				local var_22_13 = var_22_11 <= 0 and var_22_7 or var_22_7 * (var_22_12 / var_22_11)

				if var_22_13 > 0 and var_22_7 < var_22_13 then
					arg_19_1.talkMaxDuration = var_22_13

					if var_22_13 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_13 + var_22_6
					end
				end

				arg_19_1.text_.text = var_22_10
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152005", "story_v_out_110152.awb") ~= 0 then
					local var_22_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152005", "story_v_out_110152.awb") / 1000

					if var_22_14 + var_22_6 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_14 + var_22_6
					end

					if var_22_9.prefab_name ~= "" and arg_19_1.actors_[var_22_9.prefab_name] ~= nil then
						local var_22_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_9.prefab_name].transform, "story_v_out_110152", "110152005", "story_v_out_110152.awb")

						arg_19_1:RecordAudio("110152005", var_22_15)
						arg_19_1:RecordAudio("110152005", var_22_15)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_110152", "110152005", "story_v_out_110152.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_110152", "110152005", "story_v_out_110152.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_7, arg_19_1.talkMaxDuration)

			if var_22_6 <= arg_19_1.time_ and arg_19_1.time_ < var_22_6 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_6) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_6 + var_22_16 and arg_19_1.time_ < var_22_6 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play110152006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 110152006
		arg_23_1.duration_ = 6.6

		local var_23_0 = {
			ja = 6.6,
			ko = 5.866,
			zh = 4.366,
			en = 3.966
		}
		local var_23_1 = manager.audio:GetLocalizationFlag()

		if var_23_0[var_23_1] ~= nil then
			arg_23_1.duration_ = var_23_0[var_23_1]
		end

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play110152007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1184ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1184ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0, 100, 0)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1184ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0, 100, 0)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = "1019ui_story"

			if arg_23_1.actors_[var_26_9] == nil then
				local var_26_10 = Object.Instantiate(Asset.Load("Char/" .. var_26_9), arg_23_1.stage_.transform)

				var_26_10.name = var_26_9
				var_26_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_23_1.actors_[var_26_9] = var_26_10

				local var_26_11 = var_26_10:GetComponentInChildren(typeof(CharacterEffect))

				var_26_11.enabled = true

				local var_26_12 = GameObjectTools.GetOrAddComponent(var_26_10, typeof(DynamicBoneHelper))

				if var_26_12 then
					var_26_12:EnableDynamicBone(false)
				end

				arg_23_1:ShowWeapon(var_26_11.transform, false)

				arg_23_1.var_[var_26_9 .. "Animator"] = var_26_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_23_1.var_[var_26_9 .. "Animator"].applyRootMotion = true
				arg_23_1.var_[var_26_9 .. "LipSync"] = var_26_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_26_13 = arg_23_1.actors_["1019ui_story"].transform
			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1.var_.moveOldPos1019ui_story = var_26_13.localPosition
			end

			local var_26_15 = 0.001

			if var_26_14 <= arg_23_1.time_ and arg_23_1.time_ < var_26_14 + var_26_15 then
				local var_26_16 = (arg_23_1.time_ - var_26_14) / var_26_15
				local var_26_17 = Vector3.New(-0.7, -1.08, -5.9)

				var_26_13.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1019ui_story, var_26_17, var_26_16)

				local var_26_18 = manager.ui.mainCamera.transform.position - var_26_13.position

				var_26_13.forward = Vector3.New(var_26_18.x, var_26_18.y, var_26_18.z)

				local var_26_19 = var_26_13.localEulerAngles

				var_26_19.z = 0
				var_26_19.x = 0
				var_26_13.localEulerAngles = var_26_19
			end

			if arg_23_1.time_ >= var_26_14 + var_26_15 and arg_23_1.time_ < var_26_14 + var_26_15 + arg_26_0 then
				var_26_13.localPosition = Vector3.New(-0.7, -1.08, -5.9)

				local var_26_20 = manager.ui.mainCamera.transform.position - var_26_13.position

				var_26_13.forward = Vector3.New(var_26_20.x, var_26_20.y, var_26_20.z)

				local var_26_21 = var_26_13.localEulerAngles

				var_26_21.z = 0
				var_26_21.x = 0
				var_26_13.localEulerAngles = var_26_21
			end

			local var_26_22 = arg_23_1.actors_["1019ui_story"]
			local var_26_23 = 0

			if var_26_23 < arg_23_1.time_ and arg_23_1.time_ <= var_26_23 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story == nil then
				arg_23_1.var_.characterEffect1019ui_story = var_26_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_24 = 0.2

			if var_26_23 <= arg_23_1.time_ and arg_23_1.time_ < var_26_23 + var_26_24 then
				local var_26_25 = (arg_23_1.time_ - var_26_23) / var_26_24

				if arg_23_1.var_.characterEffect1019ui_story then
					arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_23 + var_26_24 and arg_23_1.time_ < var_26_23 + var_26_24 + arg_26_0 and arg_23_1.var_.characterEffect1019ui_story then
				arg_23_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_26_26 = 0

			if var_26_26 < arg_23_1.time_ and arg_23_1.time_ <= var_26_26 + arg_26_0 then
				arg_23_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_26_27 = 0

			if var_26_27 < arg_23_1.time_ and arg_23_1.time_ <= var_26_27 + arg_26_0 then
				arg_23_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_26_28 = 0
			local var_26_29 = 0.5

			if var_26_28 < arg_23_1.time_ and arg_23_1.time_ <= var_26_28 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_30 = arg_23_1:FormatText(StoryNameCfg[13].name)

				arg_23_1.leftNameTxt_.text = var_26_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_31 = arg_23_1:GetWordFromCfg(110152006)
				local var_26_32 = arg_23_1:FormatText(var_26_31.content)

				arg_23_1.text_.text = var_26_32

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_33 = 20
				local var_26_34 = utf8.len(var_26_32)
				local var_26_35 = var_26_33 <= 0 and var_26_29 or var_26_29 * (var_26_34 / var_26_33)

				if var_26_35 > 0 and var_26_29 < var_26_35 then
					arg_23_1.talkMaxDuration = var_26_35

					if var_26_35 + var_26_28 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_35 + var_26_28
					end
				end

				arg_23_1.text_.text = var_26_32
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152006", "story_v_out_110152.awb") ~= 0 then
					local var_26_36 = manager.audio:GetVoiceLength("story_v_out_110152", "110152006", "story_v_out_110152.awb") / 1000

					if var_26_36 + var_26_28 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_36 + var_26_28
					end

					if var_26_31.prefab_name ~= "" and arg_23_1.actors_[var_26_31.prefab_name] ~= nil then
						local var_26_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_31.prefab_name].transform, "story_v_out_110152", "110152006", "story_v_out_110152.awb")

						arg_23_1:RecordAudio("110152006", var_26_37)
						arg_23_1:RecordAudio("110152006", var_26_37)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_110152", "110152006", "story_v_out_110152.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_110152", "110152006", "story_v_out_110152.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_38 = math.max(var_26_29, arg_23_1.talkMaxDuration)

			if var_26_28 <= arg_23_1.time_ and arg_23_1.time_ < var_26_28 + var_26_38 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_28) / var_26_38

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_28 + var_26_38 and arg_23_1.time_ < var_26_28 + var_26_38 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play110152007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 110152007
		arg_27_1.duration_ = 9.4

		local var_27_0 = {
			ja = 8.866,
			ko = 9.4,
			zh = 6.333,
			en = 8.8
		}
		local var_27_1 = manager.audio:GetLocalizationFlag()

		if var_27_0[var_27_1] ~= nil then
			arg_27_1.duration_ = var_27_0[var_27_1]
		end

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play110152008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "1011ui_story"

			if arg_27_1.actors_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(Asset.Load("Char/" .. var_30_0), arg_27_1.stage_.transform)

				var_30_1.name = var_30_0
				var_30_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.actors_[var_30_0] = var_30_1

				local var_30_2 = var_30_1:GetComponentInChildren(typeof(CharacterEffect))

				var_30_2.enabled = true

				local var_30_3 = GameObjectTools.GetOrAddComponent(var_30_1, typeof(DynamicBoneHelper))

				if var_30_3 then
					var_30_3:EnableDynamicBone(false)
				end

				arg_27_1:ShowWeapon(var_30_2.transform, false)

				arg_27_1.var_[var_30_0 .. "Animator"] = var_30_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_27_1.var_[var_30_0 .. "Animator"].applyRootMotion = true
				arg_27_1.var_[var_30_0 .. "LipSync"] = var_30_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_30_4 = arg_27_1.actors_["1011ui_story"].transform
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos1011ui_story = var_30_4.localPosition
			end

			local var_30_6 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6
				local var_30_8 = Vector3.New(0.7, -0.71, -6)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1011ui_story, var_30_8, var_30_7)

				local var_30_9 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_9.x, var_30_9.y, var_30_9.z)

				local var_30_10 = var_30_4.localEulerAngles

				var_30_10.z = 0
				var_30_10.x = 0
				var_30_4.localEulerAngles = var_30_10
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_4.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_4.localEulerAngles = var_30_12
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_30_15 = arg_27_1.actors_["1019ui_story"]
			local var_30_16 = 0

			if var_30_16 < arg_27_1.time_ and arg_27_1.time_ <= var_30_16 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story == nil then
				arg_27_1.var_.characterEffect1019ui_story = var_30_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_17 = 0.2

			if var_30_16 <= arg_27_1.time_ and arg_27_1.time_ < var_30_16 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_16) / var_30_17

				if arg_27_1.var_.characterEffect1019ui_story then
					local var_30_19 = Mathf.Lerp(0, 0.5, var_30_18)

					arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_19
				end
			end

			if arg_27_1.time_ >= var_30_16 + var_30_17 and arg_27_1.time_ < var_30_16 + var_30_17 + arg_30_0 and arg_27_1.var_.characterEffect1019ui_story then
				local var_30_20 = 0.5

				arg_27_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1019ui_story.fillRatio = var_30_20
			end

			local var_30_21 = arg_27_1.actors_["1011ui_story"]
			local var_30_22 = 0

			if var_30_22 < arg_27_1.time_ and arg_27_1.time_ <= var_30_22 + arg_30_0 and arg_27_1.var_.characterEffect1011ui_story == nil then
				arg_27_1.var_.characterEffect1011ui_story = var_30_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_23 = 0.2

			if var_30_22 <= arg_27_1.time_ and arg_27_1.time_ < var_30_22 + var_30_23 then
				local var_30_24 = (arg_27_1.time_ - var_30_22) / var_30_23

				if arg_27_1.var_.characterEffect1011ui_story then
					arg_27_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_22 + var_30_23 and arg_27_1.time_ < var_30_22 + var_30_23 + arg_30_0 and arg_27_1.var_.characterEffect1011ui_story then
				arg_27_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_30_25 = 0
			local var_30_26 = 0.975

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_27 = arg_27_1:FormatText(StoryNameCfg[37].name)

				arg_27_1.leftNameTxt_.text = var_30_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_28 = arg_27_1:GetWordFromCfg(110152007)
				local var_30_29 = arg_27_1:FormatText(var_30_28.content)

				arg_27_1.text_.text = var_30_29

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_30 = 35
				local var_30_31 = utf8.len(var_30_29)
				local var_30_32 = var_30_30 <= 0 and var_30_26 or var_30_26 * (var_30_31 / var_30_30)

				if var_30_32 > 0 and var_30_26 < var_30_32 then
					arg_27_1.talkMaxDuration = var_30_32

					if var_30_32 + var_30_25 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_32 + var_30_25
					end
				end

				arg_27_1.text_.text = var_30_29
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152007", "story_v_out_110152.awb") ~= 0 then
					local var_30_33 = manager.audio:GetVoiceLength("story_v_out_110152", "110152007", "story_v_out_110152.awb") / 1000

					if var_30_33 + var_30_25 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_33 + var_30_25
					end

					if var_30_28.prefab_name ~= "" and arg_27_1.actors_[var_30_28.prefab_name] ~= nil then
						local var_30_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_28.prefab_name].transform, "story_v_out_110152", "110152007", "story_v_out_110152.awb")

						arg_27_1:RecordAudio("110152007", var_30_34)
						arg_27_1:RecordAudio("110152007", var_30_34)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_110152", "110152007", "story_v_out_110152.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_110152", "110152007", "story_v_out_110152.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_35 = math.max(var_30_26, arg_27_1.talkMaxDuration)

			if var_30_25 <= arg_27_1.time_ and arg_27_1.time_ < var_30_25 + var_30_35 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_25) / var_30_35

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_25 + var_30_35 and arg_27_1.time_ < var_30_25 + var_30_35 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play110152008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 110152008
		arg_31_1.duration_ = 7.8

		local var_31_0 = {
			ja = 4.7,
			ko = 7.8,
			zh = 5,
			en = 5.7
		}
		local var_31_1 = manager.audio:GetLocalizationFlag()

		if var_31_0[var_31_1] ~= nil then
			arg_31_1.duration_ = var_31_0[var_31_1]
		end

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play110152009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1019ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1019ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0, 100, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1019ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0, 100, 0)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1184ui_story"].transform
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 then
				arg_31_1.var_.moveOldPos1184ui_story = var_34_9.localPosition
			end

			local var_34_11 = 0.001

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11
				local var_34_13 = Vector3.New(-0.7, -0.97, -6)

				var_34_9.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1184ui_story, var_34_13, var_34_12)

				local var_34_14 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_14.x, var_34_14.y, var_34_14.z)

				local var_34_15 = var_34_9.localEulerAngles

				var_34_15.z = 0
				var_34_15.x = 0
				var_34_9.localEulerAngles = var_34_15
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 then
				var_34_9.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_34_16 = manager.ui.mainCamera.transform.position - var_34_9.position

				var_34_9.forward = Vector3.New(var_34_16.x, var_34_16.y, var_34_16.z)

				local var_34_17 = var_34_9.localEulerAngles

				var_34_17.z = 0
				var_34_17.x = 0
				var_34_9.localEulerAngles = var_34_17
			end

			local var_34_18 = arg_31_1.actors_["1011ui_story"]
			local var_34_19 = 0

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 and arg_31_1.var_.characterEffect1011ui_story == nil then
				arg_31_1.var_.characterEffect1011ui_story = var_34_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_20 = 0.2

			if var_34_19 <= arg_31_1.time_ and arg_31_1.time_ < var_34_19 + var_34_20 then
				local var_34_21 = (arg_31_1.time_ - var_34_19) / var_34_20

				if arg_31_1.var_.characterEffect1011ui_story then
					local var_34_22 = Mathf.Lerp(0, 0.5, var_34_21)

					arg_31_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1011ui_story.fillRatio = var_34_22
				end
			end

			if arg_31_1.time_ >= var_34_19 + var_34_20 and arg_31_1.time_ < var_34_19 + var_34_20 + arg_34_0 and arg_31_1.var_.characterEffect1011ui_story then
				local var_34_23 = 0.5

				arg_31_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1011ui_story.fillRatio = var_34_23
			end

			local var_34_24 = 0

			if var_34_24 < arg_31_1.time_ and arg_31_1.time_ <= var_34_24 + arg_34_0 then
				arg_31_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_34_25 = 0

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				arg_31_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_34_26 = arg_31_1.actors_["1184ui_story"]
			local var_34_27 = 0

			if var_34_27 < arg_31_1.time_ and arg_31_1.time_ <= var_34_27 + arg_34_0 and arg_31_1.var_.characterEffect1184ui_story == nil then
				arg_31_1.var_.characterEffect1184ui_story = var_34_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_28 = 0.2

			if var_34_27 <= arg_31_1.time_ and arg_31_1.time_ < var_34_27 + var_34_28 then
				local var_34_29 = (arg_31_1.time_ - var_34_27) / var_34_28

				if arg_31_1.var_.characterEffect1184ui_story then
					arg_31_1.var_.characterEffect1184ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_27 + var_34_28 and arg_31_1.time_ < var_34_27 + var_34_28 + arg_34_0 and arg_31_1.var_.characterEffect1184ui_story then
				arg_31_1.var_.characterEffect1184ui_story.fillFlat = false
			end

			local var_34_30 = 0
			local var_34_31 = 0.7

			if var_34_30 < arg_31_1.time_ and arg_31_1.time_ <= var_34_30 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_32 = arg_31_1:FormatText(StoryNameCfg[6].name)

				arg_31_1.leftNameTxt_.text = var_34_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_33 = arg_31_1:GetWordFromCfg(110152008)
				local var_34_34 = arg_31_1:FormatText(var_34_33.content)

				arg_31_1.text_.text = var_34_34

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_35 = 28
				local var_34_36 = utf8.len(var_34_34)
				local var_34_37 = var_34_35 <= 0 and var_34_31 or var_34_31 * (var_34_36 / var_34_35)

				if var_34_37 > 0 and var_34_31 < var_34_37 then
					arg_31_1.talkMaxDuration = var_34_37

					if var_34_37 + var_34_30 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_37 + var_34_30
					end
				end

				arg_31_1.text_.text = var_34_34
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152008", "story_v_out_110152.awb") ~= 0 then
					local var_34_38 = manager.audio:GetVoiceLength("story_v_out_110152", "110152008", "story_v_out_110152.awb") / 1000

					if var_34_38 + var_34_30 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_38 + var_34_30
					end

					if var_34_33.prefab_name ~= "" and arg_31_1.actors_[var_34_33.prefab_name] ~= nil then
						local var_34_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_33.prefab_name].transform, "story_v_out_110152", "110152008", "story_v_out_110152.awb")

						arg_31_1:RecordAudio("110152008", var_34_39)
						arg_31_1:RecordAudio("110152008", var_34_39)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_110152", "110152008", "story_v_out_110152.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_110152", "110152008", "story_v_out_110152.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_40 = math.max(var_34_31, arg_31_1.talkMaxDuration)

			if var_34_30 <= arg_31_1.time_ and arg_31_1.time_ < var_34_30 + var_34_40 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_30) / var_34_40

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_30 + var_34_40 and arg_31_1.time_ < var_34_30 + var_34_40 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play110152009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 110152009
		arg_35_1.duration_ = 7.066

		local var_35_0 = {
			ja = 6.266,
			ko = 7.066,
			zh = 5.1,
			en = 4.1
		}
		local var_35_1 = manager.audio:GetLocalizationFlag()

		if var_35_0[var_35_1] ~= nil then
			arg_35_1.duration_ = var_35_0[var_35_1]
		end

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play110152010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1011ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1011ui_story == nil then
				arg_35_1.var_.characterEffect1011ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1011ui_story then
					arg_35_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1011ui_story then
				arg_35_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_38_4 = arg_35_1.actors_["1184ui_story"]
			local var_38_5 = 0

			if var_38_5 < arg_35_1.time_ and arg_35_1.time_ <= var_38_5 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story == nil then
				arg_35_1.var_.characterEffect1184ui_story = var_38_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_6 = 0.2

			if var_38_5 <= arg_35_1.time_ and arg_35_1.time_ < var_38_5 + var_38_6 then
				local var_38_7 = (arg_35_1.time_ - var_38_5) / var_38_6

				if arg_35_1.var_.characterEffect1184ui_story then
					local var_38_8 = Mathf.Lerp(0, 0.5, var_38_7)

					arg_35_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_35_1.var_.characterEffect1184ui_story.fillRatio = var_38_8
				end
			end

			if arg_35_1.time_ >= var_38_5 + var_38_6 and arg_35_1.time_ < var_38_5 + var_38_6 + arg_38_0 and arg_35_1.var_.characterEffect1184ui_story then
				local var_38_9 = 0.5

				arg_35_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_35_1.var_.characterEffect1184ui_story.fillRatio = var_38_9
			end

			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 then
				arg_35_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_38_11 = 0
			local var_38_12 = 0.625

			if var_38_11 < arg_35_1.time_ and arg_35_1.time_ <= var_38_11 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_13 = arg_35_1:FormatText(StoryNameCfg[37].name)

				arg_35_1.leftNameTxt_.text = var_38_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_14 = arg_35_1:GetWordFromCfg(110152009)
				local var_38_15 = arg_35_1:FormatText(var_38_14.content)

				arg_35_1.text_.text = var_38_15

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_16 = 25
				local var_38_17 = utf8.len(var_38_15)
				local var_38_18 = var_38_16 <= 0 and var_38_12 or var_38_12 * (var_38_17 / var_38_16)

				if var_38_18 > 0 and var_38_12 < var_38_18 then
					arg_35_1.talkMaxDuration = var_38_18

					if var_38_18 + var_38_11 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_18 + var_38_11
					end
				end

				arg_35_1.text_.text = var_38_15
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152009", "story_v_out_110152.awb") ~= 0 then
					local var_38_19 = manager.audio:GetVoiceLength("story_v_out_110152", "110152009", "story_v_out_110152.awb") / 1000

					if var_38_19 + var_38_11 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_11
					end

					if var_38_14.prefab_name ~= "" and arg_35_1.actors_[var_38_14.prefab_name] ~= nil then
						local var_38_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_14.prefab_name].transform, "story_v_out_110152", "110152009", "story_v_out_110152.awb")

						arg_35_1:RecordAudio("110152009", var_38_20)
						arg_35_1:RecordAudio("110152009", var_38_20)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_110152", "110152009", "story_v_out_110152.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_110152", "110152009", "story_v_out_110152.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_21 = math.max(var_38_12, arg_35_1.talkMaxDuration)

			if var_38_11 <= arg_35_1.time_ and arg_35_1.time_ < var_38_11 + var_38_21 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_11) / var_38_21

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_11 + var_38_21 and arg_35_1.time_ < var_38_11 + var_38_21 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play110152010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 110152010
		arg_39_1.duration_ = 6.533

		local var_39_0 = {
			ja = 6.533,
			ko = 3.9,
			zh = 3.8,
			en = 4.266
		}
		local var_39_1 = manager.audio:GetLocalizationFlag()

		if var_39_0[var_39_1] ~= nil then
			arg_39_1.duration_ = var_39_0[var_39_1]
		end

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play110152011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1011ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1011ui_story == nil then
				arg_39_1.var_.characterEffect1011ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1011ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1011ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1011ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1011ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.325

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[67].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1111")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(110152010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 13
				local var_42_12 = utf8.len(var_42_10)
				local var_42_13 = var_42_11 <= 0 and var_42_7 or var_42_7 * (var_42_12 / var_42_11)

				if var_42_13 > 0 and var_42_7 < var_42_13 then
					arg_39_1.talkMaxDuration = var_42_13

					if var_42_13 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_10
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152010", "story_v_out_110152.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152010", "story_v_out_110152.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_110152", "110152010", "story_v_out_110152.awb")

						arg_39_1:RecordAudio("110152010", var_42_15)
						arg_39_1:RecordAudio("110152010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_110152", "110152010", "story_v_out_110152.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_110152", "110152010", "story_v_out_110152.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_16 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_16 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_16

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_16 and arg_39_1.time_ < var_42_6 + var_42_16 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play110152011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 110152011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play110152012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1184ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1184ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, 100, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1184ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, 100, 0)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1011ui_story"].transform
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				arg_43_1.var_.moveOldPos1011ui_story = var_46_9.localPosition
			end

			local var_46_11 = 0.001

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11
				local var_46_13 = Vector3.New(0, 100, 0)

				var_46_9.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1011ui_story, var_46_13, var_46_12)

				local var_46_14 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_14.x, var_46_14.y, var_46_14.z)

				local var_46_15 = var_46_9.localEulerAngles

				var_46_15.z = 0
				var_46_15.x = 0
				var_46_9.localEulerAngles = var_46_15
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 then
				var_46_9.localPosition = Vector3.New(0, 100, 0)

				local var_46_16 = manager.ui.mainCamera.transform.position - var_46_9.position

				var_46_9.forward = Vector3.New(var_46_16.x, var_46_16.y, var_46_16.z)

				local var_46_17 = var_46_9.localEulerAngles

				var_46_17.z = 0
				var_46_17.x = 0
				var_46_9.localEulerAngles = var_46_17
			end

			local var_46_18 = 0
			local var_46_19 = 0.4

			if var_46_18 < arg_43_1.time_ and arg_43_1.time_ <= var_46_18 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_20 = arg_43_1:GetWordFromCfg(110152011)
				local var_46_21 = arg_43_1:FormatText(var_46_20.content)

				arg_43_1.text_.text = var_46_21

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_22 = 16
				local var_46_23 = utf8.len(var_46_21)
				local var_46_24 = var_46_22 <= 0 and var_46_19 or var_46_19 * (var_46_23 / var_46_22)

				if var_46_24 > 0 and var_46_19 < var_46_24 then
					arg_43_1.talkMaxDuration = var_46_24

					if var_46_24 + var_46_18 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_24 + var_46_18
					end
				end

				arg_43_1.text_.text = var_46_21
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_25 = math.max(var_46_19, arg_43_1.talkMaxDuration)

			if var_46_18 <= arg_43_1.time_ and arg_43_1.time_ < var_46_18 + var_46_25 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_18) / var_46_25

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_18 + var_46_25 and arg_43_1.time_ < var_46_18 + var_46_25 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play110152012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 110152012
		arg_47_1.duration_ = 8.566

		local var_47_0 = {
			ja = 4.066,
			ko = 6.966,
			zh = 8.566,
			en = 7.933
		}
		local var_47_1 = manager.audio:GetLocalizationFlag()

		if var_47_0[var_47_1] ~= nil then
			arg_47_1.duration_ = var_47_0[var_47_1]
		end

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play110152013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "1111ui_story"

			if arg_47_1.actors_[var_50_0] == nil then
				local var_50_1 = Object.Instantiate(Asset.Load("Char/" .. var_50_0), arg_47_1.stage_.transform)

				var_50_1.name = var_50_0
				var_50_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_47_1.actors_[var_50_0] = var_50_1

				local var_50_2 = var_50_1:GetComponentInChildren(typeof(CharacterEffect))

				var_50_2.enabled = true

				local var_50_3 = GameObjectTools.GetOrAddComponent(var_50_1, typeof(DynamicBoneHelper))

				if var_50_3 then
					var_50_3:EnableDynamicBone(false)
				end

				arg_47_1:ShowWeapon(var_50_2.transform, false)

				arg_47_1.var_[var_50_0 .. "Animator"] = var_50_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_47_1.var_[var_50_0 .. "Animator"].applyRootMotion = true
				arg_47_1.var_[var_50_0 .. "LipSync"] = var_50_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_50_4 = arg_47_1.actors_["1111ui_story"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos1111ui_story = var_50_4.localPosition
			end

			local var_50_6 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_6 then
				local var_50_7 = (arg_47_1.time_ - var_50_5) / var_50_6
				local var_50_8 = Vector3.New(0, -0.83, -6)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1111ui_story, var_50_8, var_50_7)

				local var_50_9 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_9.x, var_50_9.y, var_50_9.z)

				local var_50_10 = var_50_4.localEulerAngles

				var_50_10.z = 0
				var_50_10.x = 0
				var_50_4.localEulerAngles = var_50_10
			end

			if arg_47_1.time_ >= var_50_5 + var_50_6 and arg_47_1.time_ < var_50_5 + var_50_6 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(0, -0.83, -6)

				local var_50_11 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_11.x, var_50_11.y, var_50_11.z)

				local var_50_12 = var_50_4.localEulerAngles

				var_50_12.z = 0
				var_50_12.x = 0
				var_50_4.localEulerAngles = var_50_12
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_1")
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_50_15 = 0
			local var_50_16 = 0.725

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_17 = arg_47_1:FormatText(StoryNameCfg[67].name)

				arg_47_1.leftNameTxt_.text = var_50_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_18 = arg_47_1:GetWordFromCfg(110152012)
				local var_50_19 = arg_47_1:FormatText(var_50_18.content)

				arg_47_1.text_.text = var_50_19

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_20 = 29
				local var_50_21 = utf8.len(var_50_19)
				local var_50_22 = var_50_20 <= 0 and var_50_16 or var_50_16 * (var_50_21 / var_50_20)

				if var_50_22 > 0 and var_50_16 < var_50_22 then
					arg_47_1.talkMaxDuration = var_50_22

					if var_50_22 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_22 + var_50_15
					end
				end

				arg_47_1.text_.text = var_50_19
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152012", "story_v_out_110152.awb") ~= 0 then
					local var_50_23 = manager.audio:GetVoiceLength("story_v_out_110152", "110152012", "story_v_out_110152.awb") / 1000

					if var_50_23 + var_50_15 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_23 + var_50_15
					end

					if var_50_18.prefab_name ~= "" and arg_47_1.actors_[var_50_18.prefab_name] ~= nil then
						local var_50_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_18.prefab_name].transform, "story_v_out_110152", "110152012", "story_v_out_110152.awb")

						arg_47_1:RecordAudio("110152012", var_50_24)
						arg_47_1:RecordAudio("110152012", var_50_24)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_110152", "110152012", "story_v_out_110152.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_110152", "110152012", "story_v_out_110152.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_25 = math.max(var_50_16, arg_47_1.talkMaxDuration)

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_25 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_15) / var_50_25

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_15 + var_50_25 and arg_47_1.time_ < var_50_15 + var_50_25 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play110152013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 110152013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play110152014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1111ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1111ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0, 100, 0)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1111ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0, 100, 0)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = 0
			local var_54_10 = 0.625

			if var_54_9 < arg_51_1.time_ and arg_51_1.time_ <= var_54_9 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_11 = arg_51_1:GetWordFromCfg(110152013)
				local var_54_12 = arg_51_1:FormatText(var_54_11.content)

				arg_51_1.text_.text = var_54_12

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_13 = 25
				local var_54_14 = utf8.len(var_54_12)
				local var_54_15 = var_54_13 <= 0 and var_54_10 or var_54_10 * (var_54_14 / var_54_13)

				if var_54_15 > 0 and var_54_10 < var_54_15 then
					arg_51_1.talkMaxDuration = var_54_15

					if var_54_15 + var_54_9 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_15 + var_54_9
					end
				end

				arg_51_1.text_.text = var_54_12
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_16 = math.max(var_54_10, arg_51_1.talkMaxDuration)

			if var_54_9 <= arg_51_1.time_ and arg_51_1.time_ < var_54_9 + var_54_16 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_9) / var_54_16

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_9 + var_54_16 and arg_51_1.time_ < var_54_9 + var_54_16 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play110152014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 110152014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play110152015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.bgs_.B12a.transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPosB12a = var_58_0.localPosition
			end

			local var_58_2 = 1.5

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, 1, 9.5)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosB12a, var_58_4, var_58_3)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_58_5 = 0
			local var_58_6 = 0.825

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_7 = arg_55_1:GetWordFromCfg(110152014)
				local var_58_8 = arg_55_1:FormatText(var_58_7.content)

				arg_55_1.text_.text = var_58_8

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_9 = 33
				local var_58_10 = utf8.len(var_58_8)
				local var_58_11 = var_58_9 <= 0 and var_58_6 or var_58_6 * (var_58_10 / var_58_9)

				if var_58_11 > 0 and var_58_6 < var_58_11 then
					arg_55_1.talkMaxDuration = var_58_11

					if var_58_11 + var_58_5 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_11 + var_58_5
					end
				end

				arg_55_1.text_.text = var_58_8
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_12 = math.max(var_58_6, arg_55_1.talkMaxDuration)

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_12 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_5) / var_58_12

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_5 + var_58_12 and arg_55_1.time_ < var_58_5 + var_58_12 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play110152015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 110152015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play110152016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.15

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[7].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(110152015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 6
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_8 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_8 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_8

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_8 and arg_59_1.time_ < var_62_0 + var_62_8 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play110152016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 110152016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play110152017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.7

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_2 = arg_63_1:GetWordFromCfg(110152016)
				local var_66_3 = arg_63_1:FormatText(var_66_2.content)

				arg_63_1.text_.text = var_66_3

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_4 = 28
				local var_66_5 = utf8.len(var_66_3)
				local var_66_6 = var_66_4 <= 0 and var_66_1 or var_66_1 * (var_66_5 / var_66_4)

				if var_66_6 > 0 and var_66_1 < var_66_6 then
					arg_63_1.talkMaxDuration = var_66_6

					if var_66_6 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_6 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_3
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_7 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_7 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_7

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_7 and arg_63_1.time_ < var_66_0 + var_66_7 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play110152017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 110152017
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play110152018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.75

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_2 = arg_67_1:GetWordFromCfg(110152017)
				local var_70_3 = arg_67_1:FormatText(var_70_2.content)

				arg_67_1.text_.text = var_70_3

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_4 = 30
				local var_70_5 = utf8.len(var_70_3)
				local var_70_6 = var_70_4 <= 0 and var_70_1 or var_70_1 * (var_70_5 / var_70_4)

				if var_70_6 > 0 and var_70_1 < var_70_6 then
					arg_67_1.talkMaxDuration = var_70_6

					if var_70_6 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_6 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_3
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_7 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_7 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_7

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_7 and arg_67_1.time_ < var_70_0 + var_70_7 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play110152018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 110152018
		arg_71_1.duration_ = 3.966

		local var_71_0 = {
			ja = 3.2,
			ko = 3.233,
			zh = 3.633,
			en = 3.966
		}
		local var_71_1 = manager.audio:GetLocalizationFlag()

		if var_71_0[var_71_1] ~= nil then
			arg_71_1.duration_ = var_71_0[var_71_1]
		end

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play110152019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.mask_.enabled = true
				arg_71_1.mask_.raycastTarget = true

				arg_71_1:SetGaussion(false)
			end

			local var_74_1 = 1.5

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_1 then
				local var_74_2 = (arg_71_1.time_ - var_74_0) / var_74_1
				local var_74_3 = Color.New(1, 1, 1)

				var_74_3.a = Mathf.Lerp(1, 0, var_74_2)
				arg_71_1.mask_.color = var_74_3
			end

			if arg_71_1.time_ >= var_74_0 + var_74_1 and arg_71_1.time_ < var_74_0 + var_74_1 + arg_74_0 then
				local var_74_4 = Color.New(1, 1, 1)
				local var_74_5 = 0

				arg_71_1.mask_.enabled = false
				var_74_4.a = var_74_5
				arg_71_1.mask_.color = var_74_4
			end

			local var_74_6 = manager.ui.mainCamera.transform
			local var_74_7 = 2

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 then
				arg_71_1.var_.shakeOldPos = var_74_6.localPosition
			end

			local var_74_8 = 0.6

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_8 then
				local var_74_9 = (arg_71_1.time_ - var_74_7) / 0.066
				local var_74_10, var_74_11 = math.modf(var_74_9)

				var_74_6.localPosition = Vector3.New(var_74_11 * 0.13, var_74_11 * 0.13, var_74_11 * 0.13) + arg_71_1.var_.shakeOldPos
			end

			if arg_71_1.time_ >= var_74_7 + var_74_8 and arg_71_1.time_ < var_74_7 + var_74_8 + arg_74_0 then
				var_74_6.localPosition = arg_71_1.var_.shakeOldPos
			end

			if arg_71_1.frameCnt_ <= 1 then
				arg_71_1.dialog_:SetActive(false)
			end

			local var_74_12 = 2
			local var_74_13 = 0.1

			if var_74_12 < arg_71_1.time_ and arg_71_1.time_ <= var_74_12 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0

				arg_71_1.dialog_:SetActive(true)

				local var_74_14 = LeanTween.value(arg_71_1.dialog_, 0, 1, 0.3)

				var_74_14:setOnUpdate(LuaHelper.FloatAction(function(arg_75_0)
					arg_71_1.dialogCg_.alpha = arg_75_0
				end))
				var_74_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_71_1.dialog_)
					var_74_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_71_1.duration_ = arg_71_1.duration_ + 0.3

				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_15 = arg_71_1:FormatText(StoryNameCfg[6].name)

				arg_71_1.leftNameTxt_.text = var_74_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_16 = arg_71_1:GetWordFromCfg(110152018)
				local var_74_17 = arg_71_1:FormatText(var_74_16.content)

				arg_71_1.text_.text = var_74_17

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_18 = 4
				local var_74_19 = utf8.len(var_74_17)
				local var_74_20 = var_74_18 <= 0 and var_74_13 or var_74_13 * (var_74_19 / var_74_18)

				if var_74_20 > 0 and var_74_13 < var_74_20 then
					arg_71_1.talkMaxDuration = var_74_20
					var_74_12 = var_74_12 + 0.3

					if var_74_20 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_20 + var_74_12
					end
				end

				arg_71_1.text_.text = var_74_17
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152018", "story_v_out_110152.awb") ~= 0 then
					local var_74_21 = manager.audio:GetVoiceLength("story_v_out_110152", "110152018", "story_v_out_110152.awb") / 1000

					if var_74_21 + var_74_12 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_21 + var_74_12
					end

					if var_74_16.prefab_name ~= "" and arg_71_1.actors_[var_74_16.prefab_name] ~= nil then
						local var_74_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_16.prefab_name].transform, "story_v_out_110152", "110152018", "story_v_out_110152.awb")

						arg_71_1:RecordAudio("110152018", var_74_22)
						arg_71_1:RecordAudio("110152018", var_74_22)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_110152", "110152018", "story_v_out_110152.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_110152", "110152018", "story_v_out_110152.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_23 = var_74_12 + 0.3
			local var_74_24 = math.max(var_74_13, arg_71_1.talkMaxDuration)

			if var_74_23 <= arg_71_1.time_ and arg_71_1.time_ < var_74_23 + var_74_24 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_23) / var_74_24

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_23 + var_74_24 and arg_71_1.time_ < var_74_23 + var_74_24 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play110152019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 110152019
		arg_77_1.duration_ = 2.4

		local var_77_0 = {
			ja = 1.433,
			ko = 2.1,
			zh = 2.4,
			en = 2
		}
		local var_77_1 = manager.audio:GetLocalizationFlag()

		if var_77_0[var_77_1] ~= nil then
			arg_77_1.duration_ = var_77_0[var_77_1]
		end

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play110152020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.15

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				local var_80_2 = "play"
				local var_80_3 = "music"

				arg_77_1:AudioAction(var_80_2, var_80_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_80_4 = 0
			local var_80_5 = 0.15

			if var_80_4 < arg_77_1.time_ and arg_77_1.time_ <= var_80_4 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_6 = arg_77_1:FormatText(StoryNameCfg[37].name)

				arg_77_1.leftNameTxt_.text = var_80_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, true)
				arg_77_1.iconController_:SetSelectedState("hero")

				arg_77_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_7 = arg_77_1:GetWordFromCfg(110152019)
				local var_80_8 = arg_77_1:FormatText(var_80_7.content)

				arg_77_1.text_.text = var_80_8

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_9 = 6
				local var_80_10 = utf8.len(var_80_8)
				local var_80_11 = var_80_9 <= 0 and var_80_5 or var_80_5 * (var_80_10 / var_80_9)

				if var_80_11 > 0 and var_80_5 < var_80_11 then
					arg_77_1.talkMaxDuration = var_80_11

					if var_80_11 + var_80_4 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_11 + var_80_4
					end
				end

				arg_77_1.text_.text = var_80_8
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152019", "story_v_out_110152.awb") ~= 0 then
					local var_80_12 = manager.audio:GetVoiceLength("story_v_out_110152", "110152019", "story_v_out_110152.awb") / 1000

					if var_80_12 + var_80_4 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_12 + var_80_4
					end

					if var_80_7.prefab_name ~= "" and arg_77_1.actors_[var_80_7.prefab_name] ~= nil then
						local var_80_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_7.prefab_name].transform, "story_v_out_110152", "110152019", "story_v_out_110152.awb")

						arg_77_1:RecordAudio("110152019", var_80_13)
						arg_77_1:RecordAudio("110152019", var_80_13)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_110152", "110152019", "story_v_out_110152.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_110152", "110152019", "story_v_out_110152.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_14 = math.max(var_80_5, arg_77_1.talkMaxDuration)

			if var_80_4 <= arg_77_1.time_ and arg_77_1.time_ < var_80_4 + var_80_14 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_4) / var_80_14

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_4 + var_80_14 and arg_77_1.time_ < var_80_4 + var_80_14 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play110152020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 110152020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play110152021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = manager.ui.mainCamera.transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.shakeOldPos = var_84_0.localPosition
			end

			local var_84_2 = 0.6

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / 0.066
				local var_84_4, var_84_5 = math.modf(var_84_3)

				var_84_0.localPosition = Vector3.New(var_84_5 * 0.13, var_84_5 * 0.13, var_84_5 * 0.13) + arg_81_1.var_.shakeOldPos
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 then
				var_84_0.localPosition = arg_81_1.var_.shakeOldPos
			end

			local var_84_6 = 0
			local var_84_7 = 0.1

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_8 = arg_81_1:FormatText(StoryNameCfg[7].name)

				arg_81_1.leftNameTxt_.text = var_84_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_9 = arg_81_1:GetWordFromCfg(110152020)
				local var_84_10 = arg_81_1:FormatText(var_84_9.content)

				arg_81_1.text_.text = var_84_10

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_11 = 4
				local var_84_12 = utf8.len(var_84_10)
				local var_84_13 = var_84_11 <= 0 and var_84_7 or var_84_7 * (var_84_12 / var_84_11)

				if var_84_13 > 0 and var_84_7 < var_84_13 then
					arg_81_1.talkMaxDuration = var_84_13

					if var_84_13 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_13 + var_84_6
					end
				end

				arg_81_1.text_.text = var_84_10
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)
				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_14 = math.max(var_84_7, arg_81_1.talkMaxDuration)

			if var_84_6 <= arg_81_1.time_ and arg_81_1.time_ < var_84_6 + var_84_14 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_6) / var_84_14

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_6 + var_84_14 and arg_81_1.time_ < var_84_6 + var_84_14 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play110152021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 110152021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play110152022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.95

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_2 = arg_85_1:GetWordFromCfg(110152021)
				local var_88_3 = arg_85_1:FormatText(var_88_2.content)

				arg_85_1.text_.text = var_88_3

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_4 = 38
				local var_88_5 = utf8.len(var_88_3)
				local var_88_6 = var_88_4 <= 0 and var_88_1 or var_88_1 * (var_88_5 / var_88_4)

				if var_88_6 > 0 and var_88_1 < var_88_6 then
					arg_85_1.talkMaxDuration = var_88_6

					if var_88_6 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_6 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_3
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_7 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_7 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_7

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_7 and arg_85_1.time_ < var_88_0 + var_88_7 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play110152022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 110152022
		arg_89_1.duration_ = 10.466

		local var_89_0 = {
			ja = 8.066,
			ko = 9.4,
			zh = 8.366,
			en = 10.466
		}
		local var_89_1 = manager.audio:GetLocalizationFlag()

		if var_89_0[var_89_1] ~= nil then
			arg_89_1.duration_ = var_89_0[var_89_1]
		end

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play110152023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1111ui_story"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos1111ui_story = var_92_0.localPosition
			end

			local var_92_2 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2
				local var_92_4 = Vector3.New(0, -0.83, -6)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1111ui_story, var_92_4, var_92_3)

				local var_92_5 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_5.x, var_92_5.y, var_92_5.z)

				local var_92_6 = var_92_0.localEulerAngles

				var_92_6.z = 0
				var_92_6.x = 0
				var_92_0.localEulerAngles = var_92_6
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(0, -0.83, -6)

				local var_92_7 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_7.x, var_92_7.y, var_92_7.z)

				local var_92_8 = var_92_0.localEulerAngles

				var_92_8.z = 0
				var_92_8.x = 0
				var_92_0.localEulerAngles = var_92_8
			end

			local var_92_9 = 0

			if var_92_9 < arg_89_1.time_ and arg_89_1.time_ <= var_92_9 + arg_92_0 then
				arg_89_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action5_1")
			end

			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_92_11 = arg_89_1.actors_["1111ui_story"]
			local var_92_12 = 0

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 and arg_89_1.var_.characterEffect1111ui_story == nil then
				arg_89_1.var_.characterEffect1111ui_story = var_92_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_13 = 0.2

			if var_92_12 <= arg_89_1.time_ and arg_89_1.time_ < var_92_12 + var_92_13 then
				local var_92_14 = (arg_89_1.time_ - var_92_12) / var_92_13

				if arg_89_1.var_.characterEffect1111ui_story then
					arg_89_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_12 + var_92_13 and arg_89_1.time_ < var_92_12 + var_92_13 + arg_92_0 and arg_89_1.var_.characterEffect1111ui_story then
				arg_89_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_92_15 = 0
			local var_92_16 = 0.825

			if var_92_15 < arg_89_1.time_ and arg_89_1.time_ <= var_92_15 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_17 = arg_89_1:FormatText(StoryNameCfg[67].name)

				arg_89_1.leftNameTxt_.text = var_92_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_18 = arg_89_1:GetWordFromCfg(110152022)
				local var_92_19 = arg_89_1:FormatText(var_92_18.content)

				arg_89_1.text_.text = var_92_19

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_20 = 33
				local var_92_21 = utf8.len(var_92_19)
				local var_92_22 = var_92_20 <= 0 and var_92_16 or var_92_16 * (var_92_21 / var_92_20)

				if var_92_22 > 0 and var_92_16 < var_92_22 then
					arg_89_1.talkMaxDuration = var_92_22

					if var_92_22 + var_92_15 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_22 + var_92_15
					end
				end

				arg_89_1.text_.text = var_92_19
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152022", "story_v_out_110152.awb") ~= 0 then
					local var_92_23 = manager.audio:GetVoiceLength("story_v_out_110152", "110152022", "story_v_out_110152.awb") / 1000

					if var_92_23 + var_92_15 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_23 + var_92_15
					end

					if var_92_18.prefab_name ~= "" and arg_89_1.actors_[var_92_18.prefab_name] ~= nil then
						local var_92_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_18.prefab_name].transform, "story_v_out_110152", "110152022", "story_v_out_110152.awb")

						arg_89_1:RecordAudio("110152022", var_92_24)
						arg_89_1:RecordAudio("110152022", var_92_24)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_110152", "110152022", "story_v_out_110152.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_110152", "110152022", "story_v_out_110152.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_25 = math.max(var_92_16, arg_89_1.talkMaxDuration)

			if var_92_15 <= arg_89_1.time_ and arg_89_1.time_ < var_92_15 + var_92_25 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_15) / var_92_25

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_15 + var_92_25 and arg_89_1.time_ < var_92_15 + var_92_25 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play110152023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 110152023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play110152024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1111ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1111ui_story == nil then
				arg_93_1.var_.characterEffect1111ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.2

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1111ui_story then
					local var_96_4 = Mathf.Lerp(0, 0.5, var_96_3)

					arg_93_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1111ui_story.fillRatio = var_96_4
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1111ui_story then
				local var_96_5 = 0.5

				arg_93_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1111ui_story.fillRatio = var_96_5
			end

			local var_96_6 = 0
			local var_96_7 = 0.45

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_8 = arg_93_1:GetWordFromCfg(110152023)
				local var_96_9 = arg_93_1:FormatText(var_96_8.content)

				arg_93_1.text_.text = var_96_9

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_10 = 18
				local var_96_11 = utf8.len(var_96_9)
				local var_96_12 = var_96_10 <= 0 and var_96_7 or var_96_7 * (var_96_11 / var_96_10)

				if var_96_12 > 0 and var_96_7 < var_96_12 then
					arg_93_1.talkMaxDuration = var_96_12

					if var_96_12 + var_96_6 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_12 + var_96_6
					end
				end

				arg_93_1.text_.text = var_96_9
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_13 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_13 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_13

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_13 and arg_93_1.time_ < var_96_6 + var_96_13 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play110152024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 110152024
		arg_97_1.duration_ = 3.9

		local var_97_0 = {
			ja = 3.9,
			ko = 3.533,
			zh = 3.6,
			en = 2.966
		}
		local var_97_1 = manager.audio:GetLocalizationFlag()

		if var_97_0[var_97_1] ~= nil then
			arg_97_1.duration_ = var_97_0[var_97_1]
		end

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play110152025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.275

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[6].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(110152024)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 11
				local var_100_6 = utf8.len(var_100_4)
				local var_100_7 = var_100_5 <= 0 and var_100_1 or var_100_1 * (var_100_6 / var_100_5)

				if var_100_7 > 0 and var_100_1 < var_100_7 then
					arg_97_1.talkMaxDuration = var_100_7

					if var_100_7 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_7 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_4
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152024", "story_v_out_110152.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_out_110152", "110152024", "story_v_out_110152.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_out_110152", "110152024", "story_v_out_110152.awb")

						arg_97_1:RecordAudio("110152024", var_100_9)
						arg_97_1:RecordAudio("110152024", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_110152", "110152024", "story_v_out_110152.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_110152", "110152024", "story_v_out_110152.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_10 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_10 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_10

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_10 and arg_97_1.time_ < var_100_0 + var_100_10 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play110152025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 110152025
		arg_101_1.duration_ = 10.066

		local var_101_0 = {
			ja = 7.466,
			ko = 10.066,
			zh = 7.366,
			en = 7.866
		}
		local var_101_1 = manager.audio:GetLocalizationFlag()

		if var_101_0[var_101_1] ~= nil then
			arg_101_1.duration_ = var_101_0[var_101_1]
		end

		SetActive(arg_101_1.tipsGo_, false)

		function arg_101_1.onSingleLineFinish_()
			arg_101_1.onSingleLineUpdate_ = nil
			arg_101_1.onSingleLineFinish_ = nil
			arg_101_1.state_ = "waiting"
		end

		function arg_101_1.playNext_(arg_103_0)
			if arg_103_0 == 1 then
				arg_101_0:Play110152026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action454")
			end

			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_104_2 = arg_101_1.actors_["1111ui_story"]
			local var_104_3 = 0

			if var_104_3 < arg_101_1.time_ and arg_101_1.time_ <= var_104_3 + arg_104_0 and arg_101_1.var_.characterEffect1111ui_story == nil then
				arg_101_1.var_.characterEffect1111ui_story = var_104_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_4 = 0.2

			if var_104_3 <= arg_101_1.time_ and arg_101_1.time_ < var_104_3 + var_104_4 then
				local var_104_5 = (arg_101_1.time_ - var_104_3) / var_104_4

				if arg_101_1.var_.characterEffect1111ui_story then
					arg_101_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_3 + var_104_4 and arg_101_1.time_ < var_104_3 + var_104_4 + arg_104_0 and arg_101_1.var_.characterEffect1111ui_story then
				arg_101_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_104_6 = 0
			local var_104_7 = 0.775

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_8 = arg_101_1:FormatText(StoryNameCfg[67].name)

				arg_101_1.leftNameTxt_.text = var_104_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_9 = arg_101_1:GetWordFromCfg(110152025)
				local var_104_10 = arg_101_1:FormatText(var_104_9.content)

				arg_101_1.text_.text = var_104_10

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_11 = 31
				local var_104_12 = utf8.len(var_104_10)
				local var_104_13 = var_104_11 <= 0 and var_104_7 or var_104_7 * (var_104_12 / var_104_11)

				if var_104_13 > 0 and var_104_7 < var_104_13 then
					arg_101_1.talkMaxDuration = var_104_13

					if var_104_13 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_13 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_10
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152025", "story_v_out_110152.awb") ~= 0 then
					local var_104_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152025", "story_v_out_110152.awb") / 1000

					if var_104_14 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_14 + var_104_6
					end

					if var_104_9.prefab_name ~= "" and arg_101_1.actors_[var_104_9.prefab_name] ~= nil then
						local var_104_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_9.prefab_name].transform, "story_v_out_110152", "110152025", "story_v_out_110152.awb")

						arg_101_1:RecordAudio("110152025", var_104_15)
						arg_101_1:RecordAudio("110152025", var_104_15)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_110152", "110152025", "story_v_out_110152.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_110152", "110152025", "story_v_out_110152.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_16 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_16 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_16

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_16 and arg_101_1.time_ < var_104_6 + var_104_16 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play110152026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 110152026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play110152027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1111ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1111ui_story == nil then
				arg_105_1.var_.characterEffect1111ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.2

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1111ui_story then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1111ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1111ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1111ui_story.fillRatio = var_108_5
			end

			local var_108_6 = 0
			local var_108_7 = 0.45

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_8 = arg_105_1:FormatText(StoryNameCfg[7].name)

				arg_105_1.leftNameTxt_.text = var_108_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_9 = arg_105_1:GetWordFromCfg(110152026)
				local var_108_10 = arg_105_1:FormatText(var_108_9.content)

				arg_105_1.text_.text = var_108_10

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_11 = 18
				local var_108_12 = utf8.len(var_108_10)
				local var_108_13 = var_108_11 <= 0 and var_108_7 or var_108_7 * (var_108_12 / var_108_11)

				if var_108_13 > 0 and var_108_7 < var_108_13 then
					arg_105_1.talkMaxDuration = var_108_13

					if var_108_13 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_13 + var_108_6
					end
				end

				arg_105_1.text_.text = var_108_10
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_14 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_14 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_14

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_14 and arg_105_1.time_ < var_108_6 + var_108_14 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play110152027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 110152027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play110152028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.425

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[7].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(110152027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 17
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_8 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_8 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_8

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_8 and arg_109_1.time_ < var_112_0 + var_112_8 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play110152028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 110152028
		arg_113_1.duration_ = 1.999999999999

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play110152029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1111ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect1111ui_story == nil then
				arg_113_1.var_.characterEffect1111ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.2

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect1111ui_story then
					arg_113_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect1111ui_story then
				arg_113_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_116_4 = 0

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action445")
			end

			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 then
				arg_113_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_116_6 = 0
			local var_116_7 = 0.05

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_8 = arg_113_1:FormatText(StoryNameCfg[67].name)

				arg_113_1.leftNameTxt_.text = var_116_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_9 = arg_113_1:GetWordFromCfg(110152028)
				local var_116_10 = arg_113_1:FormatText(var_116_9.content)

				arg_113_1.text_.text = var_116_10

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_11 = 2
				local var_116_12 = utf8.len(var_116_10)
				local var_116_13 = var_116_11 <= 0 and var_116_7 or var_116_7 * (var_116_12 / var_116_11)

				if var_116_13 > 0 and var_116_7 < var_116_13 then
					arg_113_1.talkMaxDuration = var_116_13

					if var_116_13 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_13 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_10
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152028", "story_v_out_110152.awb") ~= 0 then
					local var_116_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152028", "story_v_out_110152.awb") / 1000

					if var_116_14 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_14 + var_116_6
					end

					if var_116_9.prefab_name ~= "" and arg_113_1.actors_[var_116_9.prefab_name] ~= nil then
						local var_116_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_9.prefab_name].transform, "story_v_out_110152", "110152028", "story_v_out_110152.awb")

						arg_113_1:RecordAudio("110152028", var_116_15)
						arg_113_1:RecordAudio("110152028", var_116_15)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_110152", "110152028", "story_v_out_110152.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_110152", "110152028", "story_v_out_110152.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_16 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_16 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_16

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_16 and arg_113_1.time_ < var_116_6 + var_116_16 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play110152029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 110152029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play110152030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1111ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1111ui_story == nil then
				arg_117_1.var_.characterEffect1111ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.2

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1111ui_story then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1111ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1111ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1111ui_story.fillRatio = var_120_5
			end

			local var_120_6 = 0
			local var_120_7 = 1.025

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_8 = arg_117_1:FormatText(StoryNameCfg[7].name)

				arg_117_1.leftNameTxt_.text = var_120_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_9 = arg_117_1:GetWordFromCfg(110152029)
				local var_120_10 = arg_117_1:FormatText(var_120_9.content)

				arg_117_1.text_.text = var_120_10

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_11 = 43
				local var_120_12 = utf8.len(var_120_10)
				local var_120_13 = var_120_11 <= 0 and var_120_7 or var_120_7 * (var_120_12 / var_120_11)

				if var_120_13 > 0 and var_120_7 < var_120_13 then
					arg_117_1.talkMaxDuration = var_120_13

					if var_120_13 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_13 + var_120_6
					end
				end

				arg_117_1.text_.text = var_120_10
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_14 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_14 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_14

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_14 and arg_117_1.time_ < var_120_6 + var_120_14 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play110152030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 110152030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play110152031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.5

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[7].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(110152030)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 20
				local var_124_6 = utf8.len(var_124_4)
				local var_124_7 = var_124_5 <= 0 and var_124_1 or var_124_1 * (var_124_6 / var_124_5)

				if var_124_7 > 0 and var_124_1 < var_124_7 then
					arg_121_1.talkMaxDuration = var_124_7

					if var_124_7 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_7 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_4
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_8 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_8 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_8

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_8 and arg_121_1.time_ < var_124_0 + var_124_8 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play110152031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 110152031
		arg_125_1.duration_ = 1.999999999999

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play110152032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action453")
			end

			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 then
				arg_125_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_128_2 = arg_125_1.actors_["1111ui_story"]
			local var_128_3 = 0

			if var_128_3 < arg_125_1.time_ and arg_125_1.time_ <= var_128_3 + arg_128_0 and arg_125_1.var_.characterEffect1111ui_story == nil then
				arg_125_1.var_.characterEffect1111ui_story = var_128_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_4 = 0.2

			if var_128_3 <= arg_125_1.time_ and arg_125_1.time_ < var_128_3 + var_128_4 then
				local var_128_5 = (arg_125_1.time_ - var_128_3) / var_128_4

				if arg_125_1.var_.characterEffect1111ui_story then
					arg_125_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_3 + var_128_4 and arg_125_1.time_ < var_128_3 + var_128_4 + arg_128_0 and arg_125_1.var_.characterEffect1111ui_story then
				arg_125_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_128_6 = 0
			local var_128_7 = 0.05

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_8 = arg_125_1:FormatText(StoryNameCfg[67].name)

				arg_125_1.leftNameTxt_.text = var_128_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_9 = arg_125_1:GetWordFromCfg(110152031)
				local var_128_10 = arg_125_1:FormatText(var_128_9.content)

				arg_125_1.text_.text = var_128_10

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_11 = 2
				local var_128_12 = utf8.len(var_128_10)
				local var_128_13 = var_128_11 <= 0 and var_128_7 or var_128_7 * (var_128_12 / var_128_11)

				if var_128_13 > 0 and var_128_7 < var_128_13 then
					arg_125_1.talkMaxDuration = var_128_13

					if var_128_13 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_13 + var_128_6
					end
				end

				arg_125_1.text_.text = var_128_10
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152031", "story_v_out_110152.awb") ~= 0 then
					local var_128_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152031", "story_v_out_110152.awb") / 1000

					if var_128_14 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_14 + var_128_6
					end

					if var_128_9.prefab_name ~= "" and arg_125_1.actors_[var_128_9.prefab_name] ~= nil then
						local var_128_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_9.prefab_name].transform, "story_v_out_110152", "110152031", "story_v_out_110152.awb")

						arg_125_1:RecordAudio("110152031", var_128_15)
						arg_125_1:RecordAudio("110152031", var_128_15)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_110152", "110152031", "story_v_out_110152.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_110152", "110152031", "story_v_out_110152.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_16 = math.max(var_128_7, arg_125_1.talkMaxDuration)

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_16 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_6) / var_128_16

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_6 + var_128_16 and arg_125_1.time_ < var_128_6 + var_128_16 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play110152032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 110152032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play110152033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1111ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1111ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, 100, 0)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1111ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, 100, 0)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1111ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1111ui_story == nil then
				arg_129_1.var_.characterEffect1111ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.2

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1111ui_story then
					local var_132_13 = Mathf.Lerp(0, 0.5, var_132_12)

					arg_129_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1111ui_story.fillRatio = var_132_13
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect1111ui_story then
				local var_132_14 = 0.5

				arg_129_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1111ui_story.fillRatio = var_132_14
			end

			local var_132_15 = 0
			local var_132_16 = 1.05

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_17 = arg_129_1:GetWordFromCfg(110152032)
				local var_132_18 = arg_129_1:FormatText(var_132_17.content)

				arg_129_1.text_.text = var_132_18

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_19 = 42
				local var_132_20 = utf8.len(var_132_18)
				local var_132_21 = var_132_19 <= 0 and var_132_16 or var_132_16 * (var_132_20 / var_132_19)

				if var_132_21 > 0 and var_132_16 < var_132_21 then
					arg_129_1.talkMaxDuration = var_132_21

					if var_132_21 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_21 + var_132_15
					end
				end

				arg_129_1.text_.text = var_132_18
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_22 = math.max(var_132_16, arg_129_1.talkMaxDuration)

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_22 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_15) / var_132_22

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_15 + var_132_22 and arg_129_1.time_ < var_132_15 + var_132_22 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play110152033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 110152033
		arg_133_1.duration_ = 6.266

		local var_133_0 = {
			ja = 2.633,
			ko = 4.1,
			zh = 5.1,
			en = 6.266
		}
		local var_133_1 = manager.audio:GetLocalizationFlag()

		if var_133_0[var_133_1] ~= nil then
			arg_133_1.duration_ = var_133_0[var_133_1]
		end

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play110152034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action9_1")
			end

			local var_136_1 = arg_133_1.actors_["1111ui_story"].transform
			local var_136_2 = 0

			if var_136_2 < arg_133_1.time_ and arg_133_1.time_ <= var_136_2 + arg_136_0 then
				arg_133_1.var_.moveOldPos1111ui_story = var_136_1.localPosition
			end

			local var_136_3 = 0.001

			if var_136_2 <= arg_133_1.time_ and arg_133_1.time_ < var_136_2 + var_136_3 then
				local var_136_4 = (arg_133_1.time_ - var_136_2) / var_136_3
				local var_136_5 = Vector3.New(0, -0.83, -6)

				var_136_1.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1111ui_story, var_136_5, var_136_4)

				local var_136_6 = manager.ui.mainCamera.transform.position - var_136_1.position

				var_136_1.forward = Vector3.New(var_136_6.x, var_136_6.y, var_136_6.z)

				local var_136_7 = var_136_1.localEulerAngles

				var_136_7.z = 0
				var_136_7.x = 0
				var_136_1.localEulerAngles = var_136_7
			end

			if arg_133_1.time_ >= var_136_2 + var_136_3 and arg_133_1.time_ < var_136_2 + var_136_3 + arg_136_0 then
				var_136_1.localPosition = Vector3.New(0, -0.83, -6)

				local var_136_8 = manager.ui.mainCamera.transform.position - var_136_1.position

				var_136_1.forward = Vector3.New(var_136_8.x, var_136_8.y, var_136_8.z)

				local var_136_9 = var_136_1.localEulerAngles

				var_136_9.z = 0
				var_136_9.x = 0
				var_136_1.localEulerAngles = var_136_9
			end

			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_136_11 = arg_133_1.actors_["1111ui_story"]
			local var_136_12 = 0

			if var_136_12 < arg_133_1.time_ and arg_133_1.time_ <= var_136_12 + arg_136_0 and arg_133_1.var_.characterEffect1111ui_story == nil then
				arg_133_1.var_.characterEffect1111ui_story = var_136_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_13 = 0.2

			if var_136_12 <= arg_133_1.time_ and arg_133_1.time_ < var_136_12 + var_136_13 then
				local var_136_14 = (arg_133_1.time_ - var_136_12) / var_136_13

				if arg_133_1.var_.characterEffect1111ui_story then
					arg_133_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_12 + var_136_13 and arg_133_1.time_ < var_136_12 + var_136_13 + arg_136_0 and arg_133_1.var_.characterEffect1111ui_story then
				arg_133_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_136_15 = 0
			local var_136_16 = 0.425

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_17 = arg_133_1:FormatText(StoryNameCfg[67].name)

				arg_133_1.leftNameTxt_.text = var_136_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_18 = arg_133_1:GetWordFromCfg(110152033)
				local var_136_19 = arg_133_1:FormatText(var_136_18.content)

				arg_133_1.text_.text = var_136_19

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_20 = 17
				local var_136_21 = utf8.len(var_136_19)
				local var_136_22 = var_136_20 <= 0 and var_136_16 or var_136_16 * (var_136_21 / var_136_20)

				if var_136_22 > 0 and var_136_16 < var_136_22 then
					arg_133_1.talkMaxDuration = var_136_22

					if var_136_22 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_22 + var_136_15
					end
				end

				arg_133_1.text_.text = var_136_19
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152033", "story_v_out_110152.awb") ~= 0 then
					local var_136_23 = manager.audio:GetVoiceLength("story_v_out_110152", "110152033", "story_v_out_110152.awb") / 1000

					if var_136_23 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_23 + var_136_15
					end

					if var_136_18.prefab_name ~= "" and arg_133_1.actors_[var_136_18.prefab_name] ~= nil then
						local var_136_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_18.prefab_name].transform, "story_v_out_110152", "110152033", "story_v_out_110152.awb")

						arg_133_1:RecordAudio("110152033", var_136_24)
						arg_133_1:RecordAudio("110152033", var_136_24)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_110152", "110152033", "story_v_out_110152.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_110152", "110152033", "story_v_out_110152.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_25 = math.max(var_136_16, arg_133_1.talkMaxDuration)

			if var_136_15 <= arg_133_1.time_ and arg_133_1.time_ < var_136_15 + var_136_25 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_15) / var_136_25

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_15 + var_136_25 and arg_133_1.time_ < var_136_15 + var_136_25 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play110152034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 110152034
		arg_137_1.duration_ = 3.966

		local var_137_0 = {
			ja = 3.966,
			ko = 2.966,
			zh = 3.8,
			en = 2.833
		}
		local var_137_1 = manager.audio:GetLocalizationFlag()

		if var_137_0[var_137_1] ~= nil then
			arg_137_1.duration_ = var_137_0[var_137_1]
		end

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play110152035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1111ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1111ui_story == nil then
				arg_137_1.var_.characterEffect1111ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.2

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1111ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1111ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1111ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1111ui_story.fillRatio = var_140_5
			end

			local var_140_6 = 0
			local var_140_7 = 0.2

			if var_140_6 < arg_137_1.time_ and arg_137_1.time_ <= var_140_6 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_8 = arg_137_1:FormatText(StoryNameCfg[6].name)

				arg_137_1.leftNameTxt_.text = var_140_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_9 = arg_137_1:GetWordFromCfg(110152034)
				local var_140_10 = arg_137_1:FormatText(var_140_9.content)

				arg_137_1.text_.text = var_140_10

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_11 = 8
				local var_140_12 = utf8.len(var_140_10)
				local var_140_13 = var_140_11 <= 0 and var_140_7 or var_140_7 * (var_140_12 / var_140_11)

				if var_140_13 > 0 and var_140_7 < var_140_13 then
					arg_137_1.talkMaxDuration = var_140_13

					if var_140_13 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_13 + var_140_6
					end
				end

				arg_137_1.text_.text = var_140_10
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152034", "story_v_out_110152.awb") ~= 0 then
					local var_140_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152034", "story_v_out_110152.awb") / 1000

					if var_140_14 + var_140_6 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_14 + var_140_6
					end

					if var_140_9.prefab_name ~= "" and arg_137_1.actors_[var_140_9.prefab_name] ~= nil then
						local var_140_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_9.prefab_name].transform, "story_v_out_110152", "110152034", "story_v_out_110152.awb")

						arg_137_1:RecordAudio("110152034", var_140_15)
						arg_137_1:RecordAudio("110152034", var_140_15)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_110152", "110152034", "story_v_out_110152.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_110152", "110152034", "story_v_out_110152.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_16 = math.max(var_140_7, arg_137_1.talkMaxDuration)

			if var_140_6 <= arg_137_1.time_ and arg_137_1.time_ < var_140_6 + var_140_16 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_6) / var_140_16

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_6 + var_140_16 and arg_137_1.time_ < var_140_6 + var_140_16 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play110152035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 110152035
		arg_141_1.duration_ = 5.966

		local var_141_0 = {
			ja = 5.966,
			ko = 2.233,
			zh = 2.133,
			en = 2.933
		}
		local var_141_1 = manager.audio:GetLocalizationFlag()

		if var_141_0[var_141_1] ~= nil then
			arg_141_1.duration_ = var_141_0[var_141_1]
		end

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play110152036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.3

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[13].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, true)
				arg_141_1.iconController_:SetSelectedState("hero")

				arg_141_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(110152035)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 12
				local var_144_6 = utf8.len(var_144_4)
				local var_144_7 = var_144_5 <= 0 and var_144_1 or var_144_1 * (var_144_6 / var_144_5)

				if var_144_7 > 0 and var_144_1 < var_144_7 then
					arg_141_1.talkMaxDuration = var_144_7

					if var_144_7 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_7 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_4
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152035", "story_v_out_110152.awb") ~= 0 then
					local var_144_8 = manager.audio:GetVoiceLength("story_v_out_110152", "110152035", "story_v_out_110152.awb") / 1000

					if var_144_8 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_0
					end

					if var_144_3.prefab_name ~= "" and arg_141_1.actors_[var_144_3.prefab_name] ~= nil then
						local var_144_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_3.prefab_name].transform, "story_v_out_110152", "110152035", "story_v_out_110152.awb")

						arg_141_1:RecordAudio("110152035", var_144_9)
						arg_141_1:RecordAudio("110152035", var_144_9)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_110152", "110152035", "story_v_out_110152.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_110152", "110152035", "story_v_out_110152.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_10 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_10 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_10

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_10 and arg_141_1.time_ < var_144_0 + var_144_10 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play110152036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 110152036
		arg_145_1.duration_ = 10.866

		local var_145_0 = {
			ja = 9.866,
			ko = 10.866,
			zh = 8.8,
			en = 9
		}
		local var_145_1 = manager.audio:GetLocalizationFlag()

		if var_145_0[var_145_1] ~= nil then
			arg_145_1.duration_ = var_145_0[var_145_1]
		end

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play110152037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action494")
			end

			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_148_2 = arg_145_1.actors_["1111ui_story"]
			local var_148_3 = 0

			if var_148_3 < arg_145_1.time_ and arg_145_1.time_ <= var_148_3 + arg_148_0 and arg_145_1.var_.characterEffect1111ui_story == nil then
				arg_145_1.var_.characterEffect1111ui_story = var_148_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_4 = 0.2

			if var_148_3 <= arg_145_1.time_ and arg_145_1.time_ < var_148_3 + var_148_4 then
				local var_148_5 = (arg_145_1.time_ - var_148_3) / var_148_4

				if arg_145_1.var_.characterEffect1111ui_story then
					arg_145_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_3 + var_148_4 and arg_145_1.time_ < var_148_3 + var_148_4 + arg_148_0 and arg_145_1.var_.characterEffect1111ui_story then
				arg_145_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_148_6 = 0
			local var_148_7 = 1

			if var_148_6 < arg_145_1.time_ and arg_145_1.time_ <= var_148_6 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_8 = arg_145_1:FormatText(StoryNameCfg[67].name)

				arg_145_1.leftNameTxt_.text = var_148_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_9 = arg_145_1:GetWordFromCfg(110152036)
				local var_148_10 = arg_145_1:FormatText(var_148_9.content)

				arg_145_1.text_.text = var_148_10

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_11 = 40
				local var_148_12 = utf8.len(var_148_10)
				local var_148_13 = var_148_11 <= 0 and var_148_7 or var_148_7 * (var_148_12 / var_148_11)

				if var_148_13 > 0 and var_148_7 < var_148_13 then
					arg_145_1.talkMaxDuration = var_148_13

					if var_148_13 + var_148_6 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_13 + var_148_6
					end
				end

				arg_145_1.text_.text = var_148_10
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152036", "story_v_out_110152.awb") ~= 0 then
					local var_148_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152036", "story_v_out_110152.awb") / 1000

					if var_148_14 + var_148_6 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_14 + var_148_6
					end

					if var_148_9.prefab_name ~= "" and arg_145_1.actors_[var_148_9.prefab_name] ~= nil then
						local var_148_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_9.prefab_name].transform, "story_v_out_110152", "110152036", "story_v_out_110152.awb")

						arg_145_1:RecordAudio("110152036", var_148_15)
						arg_145_1:RecordAudio("110152036", var_148_15)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_110152", "110152036", "story_v_out_110152.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_110152", "110152036", "story_v_out_110152.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_16 = math.max(var_148_7, arg_145_1.talkMaxDuration)

			if var_148_6 <= arg_145_1.time_ and arg_145_1.time_ < var_148_6 + var_148_16 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_6) / var_148_16

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_6 + var_148_16 and arg_145_1.time_ < var_148_6 + var_148_16 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play110152037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 110152037
		arg_149_1.duration_ = 16.433

		local var_149_0 = {
			ja = 16.433,
			ko = 13.7,
			zh = 12.2,
			en = 14.833
		}
		local var_149_1 = manager.audio:GetLocalizationFlag()

		if var_149_0[var_149_1] ~= nil then
			arg_149_1.duration_ = var_149_0[var_149_1]
		end

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play110152038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action443")
			end

			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_152_2 = 0
			local var_152_3 = 1.525

			if var_152_2 < arg_149_1.time_ and arg_149_1.time_ <= var_152_2 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_4 = arg_149_1:FormatText(StoryNameCfg[67].name)

				arg_149_1.leftNameTxt_.text = var_152_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_5 = arg_149_1:GetWordFromCfg(110152037)
				local var_152_6 = arg_149_1:FormatText(var_152_5.content)

				arg_149_1.text_.text = var_152_6

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_7 = 61
				local var_152_8 = utf8.len(var_152_6)
				local var_152_9 = var_152_7 <= 0 and var_152_3 or var_152_3 * (var_152_8 / var_152_7)

				if var_152_9 > 0 and var_152_3 < var_152_9 then
					arg_149_1.talkMaxDuration = var_152_9

					if var_152_9 + var_152_2 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_9 + var_152_2
					end
				end

				arg_149_1.text_.text = var_152_6
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152037", "story_v_out_110152.awb") ~= 0 then
					local var_152_10 = manager.audio:GetVoiceLength("story_v_out_110152", "110152037", "story_v_out_110152.awb") / 1000

					if var_152_10 + var_152_2 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_10 + var_152_2
					end

					if var_152_5.prefab_name ~= "" and arg_149_1.actors_[var_152_5.prefab_name] ~= nil then
						local var_152_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_5.prefab_name].transform, "story_v_out_110152", "110152037", "story_v_out_110152.awb")

						arg_149_1:RecordAudio("110152037", var_152_11)
						arg_149_1:RecordAudio("110152037", var_152_11)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_110152", "110152037", "story_v_out_110152.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_110152", "110152037", "story_v_out_110152.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_12 = math.max(var_152_3, arg_149_1.talkMaxDuration)

			if var_152_2 <= arg_149_1.time_ and arg_149_1.time_ < var_152_2 + var_152_12 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_2) / var_152_12

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_2 + var_152_12 and arg_149_1.time_ < var_152_2 + var_152_12 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play110152038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 110152038
		arg_153_1.duration_ = 8.2

		local var_153_0 = {
			ja = 7.533,
			ko = 5.466,
			zh = 6.2,
			en = 8.2
		}
		local var_153_1 = manager.audio:GetLocalizationFlag()

		if var_153_0[var_153_1] ~= nil then
			arg_153_1.duration_ = var_153_0[var_153_1]
		end

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play110152039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_156_1 = 0
			local var_156_2 = 0.825

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_3 = arg_153_1:FormatText(StoryNameCfg[67].name)

				arg_153_1.leftNameTxt_.text = var_156_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_4 = arg_153_1:GetWordFromCfg(110152038)
				local var_156_5 = arg_153_1:FormatText(var_156_4.content)

				arg_153_1.text_.text = var_156_5

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_6 = 31
				local var_156_7 = utf8.len(var_156_5)
				local var_156_8 = var_156_6 <= 0 and var_156_2 or var_156_2 * (var_156_7 / var_156_6)

				if var_156_8 > 0 and var_156_2 < var_156_8 then
					arg_153_1.talkMaxDuration = var_156_8

					if var_156_8 + var_156_1 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_1
					end
				end

				arg_153_1.text_.text = var_156_5
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152038", "story_v_out_110152.awb") ~= 0 then
					local var_156_9 = manager.audio:GetVoiceLength("story_v_out_110152", "110152038", "story_v_out_110152.awb") / 1000

					if var_156_9 + var_156_1 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_9 + var_156_1
					end

					if var_156_4.prefab_name ~= "" and arg_153_1.actors_[var_156_4.prefab_name] ~= nil then
						local var_156_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_4.prefab_name].transform, "story_v_out_110152", "110152038", "story_v_out_110152.awb")

						arg_153_1:RecordAudio("110152038", var_156_10)
						arg_153_1:RecordAudio("110152038", var_156_10)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_110152", "110152038", "story_v_out_110152.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_110152", "110152038", "story_v_out_110152.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_11 = math.max(var_156_2, arg_153_1.talkMaxDuration)

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_11 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_1) / var_156_11

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_1 + var_156_11 and arg_153_1.time_ < var_156_1 + var_156_11 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play110152039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 110152039
		arg_157_1.duration_ = 11.433

		local var_157_0 = {
			ja = 11.433,
			ko = 9.766,
			zh = 7.8,
			en = 7.033
		}
		local var_157_1 = manager.audio:GetLocalizationFlag()

		if var_157_0[var_157_1] ~= nil then
			arg_157_1.duration_ = var_157_0[var_157_1]
		end

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play110152040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action3_2")
			end

			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_160_2 = 0
			local var_160_3 = 0.8

			if var_160_2 < arg_157_1.time_ and arg_157_1.time_ <= var_160_2 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_4 = arg_157_1:FormatText(StoryNameCfg[67].name)

				arg_157_1.leftNameTxt_.text = var_160_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_5 = arg_157_1:GetWordFromCfg(110152039)
				local var_160_6 = arg_157_1:FormatText(var_160_5.content)

				arg_157_1.text_.text = var_160_6

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_7 = 32
				local var_160_8 = utf8.len(var_160_6)
				local var_160_9 = var_160_7 <= 0 and var_160_3 or var_160_3 * (var_160_8 / var_160_7)

				if var_160_9 > 0 and var_160_3 < var_160_9 then
					arg_157_1.talkMaxDuration = var_160_9

					if var_160_9 + var_160_2 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_9 + var_160_2
					end
				end

				arg_157_1.text_.text = var_160_6
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152039", "story_v_out_110152.awb") ~= 0 then
					local var_160_10 = manager.audio:GetVoiceLength("story_v_out_110152", "110152039", "story_v_out_110152.awb") / 1000

					if var_160_10 + var_160_2 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_10 + var_160_2
					end

					if var_160_5.prefab_name ~= "" and arg_157_1.actors_[var_160_5.prefab_name] ~= nil then
						local var_160_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_5.prefab_name].transform, "story_v_out_110152", "110152039", "story_v_out_110152.awb")

						arg_157_1:RecordAudio("110152039", var_160_11)
						arg_157_1:RecordAudio("110152039", var_160_11)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_110152", "110152039", "story_v_out_110152.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_110152", "110152039", "story_v_out_110152.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_12 = math.max(var_160_3, arg_157_1.talkMaxDuration)

			if var_160_2 <= arg_157_1.time_ and arg_157_1.time_ < var_160_2 + var_160_12 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_2) / var_160_12

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_2 + var_160_12 and arg_157_1.time_ < var_160_2 + var_160_12 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play110152040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 110152040
		arg_161_1.duration_ = 5.033

		local var_161_0 = {
			ja = 2.066,
			ko = 3.466,
			zh = 4.4,
			en = 5.033
		}
		local var_161_1 = manager.audio:GetLocalizationFlag()

		if var_161_0[var_161_1] ~= nil then
			arg_161_1.duration_ = var_161_0[var_161_1]
		end

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play110152041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1111ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1111ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.5

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(0.7, -0.83, -6)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1111ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0.7, -0.83, -6)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["1011ui_story"].transform
			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1.var_.moveOldPos1011ui_story = var_164_9.localPosition
			end

			local var_164_11 = 0.001

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11
				local var_164_13 = Vector3.New(-0.7, -0.71, -6)

				var_164_9.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1011ui_story, var_164_13, var_164_12)

				local var_164_14 = manager.ui.mainCamera.transform.position - var_164_9.position

				var_164_9.forward = Vector3.New(var_164_14.x, var_164_14.y, var_164_14.z)

				local var_164_15 = var_164_9.localEulerAngles

				var_164_15.z = 0
				var_164_15.x = 0
				var_164_9.localEulerAngles = var_164_15
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 then
				var_164_9.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_164_16 = manager.ui.mainCamera.transform.position - var_164_9.position

				var_164_9.forward = Vector3.New(var_164_16.x, var_164_16.y, var_164_16.z)

				local var_164_17 = var_164_9.localEulerAngles

				var_164_17.z = 0
				var_164_17.x = 0
				var_164_9.localEulerAngles = var_164_17
			end

			local var_164_18 = 0

			if var_164_18 < arg_161_1.time_ and arg_161_1.time_ <= var_164_18 + arg_164_0 then
				arg_161_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_164_19 = 0

			if var_164_19 < arg_161_1.time_ and arg_161_1.time_ <= var_164_19 + arg_164_0 then
				arg_161_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_164_20 = arg_161_1.actors_["1011ui_story"]
			local var_164_21 = 0

			if var_164_21 < arg_161_1.time_ and arg_161_1.time_ <= var_164_21 + arg_164_0 and arg_161_1.var_.characterEffect1011ui_story == nil then
				arg_161_1.var_.characterEffect1011ui_story = var_164_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_22 = 0.2

			if var_164_21 <= arg_161_1.time_ and arg_161_1.time_ < var_164_21 + var_164_22 then
				local var_164_23 = (arg_161_1.time_ - var_164_21) / var_164_22

				if arg_161_1.var_.characterEffect1011ui_story then
					arg_161_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_21 + var_164_22 and arg_161_1.time_ < var_164_21 + var_164_22 + arg_164_0 and arg_161_1.var_.characterEffect1011ui_story then
				arg_161_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_164_24 = arg_161_1.actors_["1111ui_story"]
			local var_164_25 = 0

			if var_164_25 < arg_161_1.time_ and arg_161_1.time_ <= var_164_25 + arg_164_0 and arg_161_1.var_.characterEffect1111ui_story == nil then
				arg_161_1.var_.characterEffect1111ui_story = var_164_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_26 = 0.2

			if var_164_25 <= arg_161_1.time_ and arg_161_1.time_ < var_164_25 + var_164_26 then
				local var_164_27 = (arg_161_1.time_ - var_164_25) / var_164_26

				if arg_161_1.var_.characterEffect1111ui_story then
					local var_164_28 = Mathf.Lerp(0, 0.5, var_164_27)

					arg_161_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1111ui_story.fillRatio = var_164_28
				end
			end

			if arg_161_1.time_ >= var_164_25 + var_164_26 and arg_161_1.time_ < var_164_25 + var_164_26 + arg_164_0 and arg_161_1.var_.characterEffect1111ui_story then
				local var_164_29 = 0.5

				arg_161_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1111ui_story.fillRatio = var_164_29
			end

			local var_164_30 = 0
			local var_164_31 = 0.425

			if var_164_30 < arg_161_1.time_ and arg_161_1.time_ <= var_164_30 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_32 = arg_161_1:FormatText(StoryNameCfg[37].name)

				arg_161_1.leftNameTxt_.text = var_164_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_33 = arg_161_1:GetWordFromCfg(110152040)
				local var_164_34 = arg_161_1:FormatText(var_164_33.content)

				arg_161_1.text_.text = var_164_34

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_35 = 17
				local var_164_36 = utf8.len(var_164_34)
				local var_164_37 = var_164_35 <= 0 and var_164_31 or var_164_31 * (var_164_36 / var_164_35)

				if var_164_37 > 0 and var_164_31 < var_164_37 then
					arg_161_1.talkMaxDuration = var_164_37

					if var_164_37 + var_164_30 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_37 + var_164_30
					end
				end

				arg_161_1.text_.text = var_164_34
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152040", "story_v_out_110152.awb") ~= 0 then
					local var_164_38 = manager.audio:GetVoiceLength("story_v_out_110152", "110152040", "story_v_out_110152.awb") / 1000

					if var_164_38 + var_164_30 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_38 + var_164_30
					end

					if var_164_33.prefab_name ~= "" and arg_161_1.actors_[var_164_33.prefab_name] ~= nil then
						local var_164_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_33.prefab_name].transform, "story_v_out_110152", "110152040", "story_v_out_110152.awb")

						arg_161_1:RecordAudio("110152040", var_164_39)
						arg_161_1:RecordAudio("110152040", var_164_39)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_110152", "110152040", "story_v_out_110152.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_110152", "110152040", "story_v_out_110152.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_40 = math.max(var_164_31, arg_161_1.talkMaxDuration)

			if var_164_30 <= arg_161_1.time_ and arg_161_1.time_ < var_164_30 + var_164_40 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_30) / var_164_40

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_30 + var_164_40 and arg_161_1.time_ < var_164_30 + var_164_40 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play110152041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 110152041
		arg_165_1.duration_ = 1.999999999999

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play110152042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action5_1")
			end

			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_168_2 = arg_165_1.actors_["1111ui_story"]
			local var_168_3 = 0

			if var_168_3 < arg_165_1.time_ and arg_165_1.time_ <= var_168_3 + arg_168_0 and arg_165_1.var_.characterEffect1111ui_story == nil then
				arg_165_1.var_.characterEffect1111ui_story = var_168_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_4 = 0.2

			if var_168_3 <= arg_165_1.time_ and arg_165_1.time_ < var_168_3 + var_168_4 then
				local var_168_5 = (arg_165_1.time_ - var_168_3) / var_168_4

				if arg_165_1.var_.characterEffect1111ui_story then
					arg_165_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_3 + var_168_4 and arg_165_1.time_ < var_168_3 + var_168_4 + arg_168_0 and arg_165_1.var_.characterEffect1111ui_story then
				arg_165_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_168_6 = arg_165_1.actors_["1011ui_story"]
			local var_168_7 = 0

			if var_168_7 < arg_165_1.time_ and arg_165_1.time_ <= var_168_7 + arg_168_0 and arg_165_1.var_.characterEffect1011ui_story == nil then
				arg_165_1.var_.characterEffect1011ui_story = var_168_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_8 = 0.2

			if var_168_7 <= arg_165_1.time_ and arg_165_1.time_ < var_168_7 + var_168_8 then
				local var_168_9 = (arg_165_1.time_ - var_168_7) / var_168_8

				if arg_165_1.var_.characterEffect1011ui_story then
					local var_168_10 = Mathf.Lerp(0, 0.5, var_168_9)

					arg_165_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1011ui_story.fillRatio = var_168_10
				end
			end

			if arg_165_1.time_ >= var_168_7 + var_168_8 and arg_165_1.time_ < var_168_7 + var_168_8 + arg_168_0 and arg_165_1.var_.characterEffect1011ui_story then
				local var_168_11 = 0.5

				arg_165_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1011ui_story.fillRatio = var_168_11
			end

			local var_168_12 = 0
			local var_168_13 = 0.05

			if var_168_12 < arg_165_1.time_ and arg_165_1.time_ <= var_168_12 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_14 = arg_165_1:FormatText(StoryNameCfg[67].name)

				arg_165_1.leftNameTxt_.text = var_168_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_15 = arg_165_1:GetWordFromCfg(110152041)
				local var_168_16 = arg_165_1:FormatText(var_168_15.content)

				arg_165_1.text_.text = var_168_16

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_17 = 2
				local var_168_18 = utf8.len(var_168_16)
				local var_168_19 = var_168_17 <= 0 and var_168_13 or var_168_13 * (var_168_18 / var_168_17)

				if var_168_19 > 0 and var_168_13 < var_168_19 then
					arg_165_1.talkMaxDuration = var_168_19

					if var_168_19 + var_168_12 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_19 + var_168_12
					end
				end

				arg_165_1.text_.text = var_168_16
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152041", "story_v_out_110152.awb") ~= 0 then
					local var_168_20 = manager.audio:GetVoiceLength("story_v_out_110152", "110152041", "story_v_out_110152.awb") / 1000

					if var_168_20 + var_168_12 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_20 + var_168_12
					end

					if var_168_15.prefab_name ~= "" and arg_165_1.actors_[var_168_15.prefab_name] ~= nil then
						local var_168_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_15.prefab_name].transform, "story_v_out_110152", "110152041", "story_v_out_110152.awb")

						arg_165_1:RecordAudio("110152041", var_168_21)
						arg_165_1:RecordAudio("110152041", var_168_21)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_110152", "110152041", "story_v_out_110152.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_110152", "110152041", "story_v_out_110152.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_22 = math.max(var_168_13, arg_165_1.talkMaxDuration)

			if var_168_12 <= arg_165_1.time_ and arg_165_1.time_ < var_168_12 + var_168_22 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_12) / var_168_22

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_12 + var_168_22 and arg_165_1.time_ < var_168_12 + var_168_22 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play110152042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 110152042
		arg_169_1.duration_ = 12.6

		local var_169_0 = {
			ja = 12.6,
			ko = 8.166,
			zh = 9.633,
			en = 5.266
		}
		local var_169_1 = manager.audio:GetLocalizationFlag()

		if var_169_0[var_169_1] ~= nil then
			arg_169_1.duration_ = var_169_0[var_169_1]
		end

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play110152043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1011ui_story"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and arg_169_1.var_.characterEffect1011ui_story == nil then
				arg_169_1.var_.characterEffect1011ui_story = var_172_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_2 = 0.2

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.characterEffect1011ui_story then
					arg_169_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and arg_169_1.var_.characterEffect1011ui_story then
				arg_169_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_172_4 = arg_169_1.actors_["1111ui_story"]
			local var_172_5 = 0

			if var_172_5 < arg_169_1.time_ and arg_169_1.time_ <= var_172_5 + arg_172_0 and arg_169_1.var_.characterEffect1111ui_story == nil then
				arg_169_1.var_.characterEffect1111ui_story = var_172_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_6 = 0.2

			if var_172_5 <= arg_169_1.time_ and arg_169_1.time_ < var_172_5 + var_172_6 then
				local var_172_7 = (arg_169_1.time_ - var_172_5) / var_172_6

				if arg_169_1.var_.characterEffect1111ui_story then
					local var_172_8 = Mathf.Lerp(0, 0.5, var_172_7)

					arg_169_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1111ui_story.fillRatio = var_172_8
				end
			end

			if arg_169_1.time_ >= var_172_5 + var_172_6 and arg_169_1.time_ < var_172_5 + var_172_6 + arg_172_0 and arg_169_1.var_.characterEffect1111ui_story then
				local var_172_9 = 0.5

				arg_169_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1111ui_story.fillRatio = var_172_9
			end

			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 then
				arg_169_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_172_11 = 0
			local var_172_12 = 0.6

			if var_172_11 < arg_169_1.time_ and arg_169_1.time_ <= var_172_11 + arg_172_0 then
				local var_172_13 = "play"
				local var_172_14 = "music"

				arg_169_1:AudioAction(var_172_13, var_172_14, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_172_15 = 0.738461699336767
			local var_172_16 = 1

			if var_172_15 < arg_169_1.time_ and arg_169_1.time_ <= var_172_15 + arg_172_0 then
				local var_172_17 = "play"
				local var_172_18 = "music"

				arg_169_1:AudioAction(var_172_17, var_172_18, "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui.awb")
			end

			local var_172_19 = 0
			local var_172_20 = 0.775

			if var_172_19 < arg_169_1.time_ and arg_169_1.time_ <= var_172_19 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_21 = arg_169_1:FormatText(StoryNameCfg[37].name)

				arg_169_1.leftNameTxt_.text = var_172_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_22 = arg_169_1:GetWordFromCfg(110152042)
				local var_172_23 = arg_169_1:FormatText(var_172_22.content)

				arg_169_1.text_.text = var_172_23

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_24 = 31
				local var_172_25 = utf8.len(var_172_23)
				local var_172_26 = var_172_24 <= 0 and var_172_20 or var_172_20 * (var_172_25 / var_172_24)

				if var_172_26 > 0 and var_172_20 < var_172_26 then
					arg_169_1.talkMaxDuration = var_172_26

					if var_172_26 + var_172_19 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_26 + var_172_19
					end
				end

				arg_169_1.text_.text = var_172_23
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152042", "story_v_out_110152.awb") ~= 0 then
					local var_172_27 = manager.audio:GetVoiceLength("story_v_out_110152", "110152042", "story_v_out_110152.awb") / 1000

					if var_172_27 + var_172_19 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_27 + var_172_19
					end

					if var_172_22.prefab_name ~= "" and arg_169_1.actors_[var_172_22.prefab_name] ~= nil then
						local var_172_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_22.prefab_name].transform, "story_v_out_110152", "110152042", "story_v_out_110152.awb")

						arg_169_1:RecordAudio("110152042", var_172_28)
						arg_169_1:RecordAudio("110152042", var_172_28)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_110152", "110152042", "story_v_out_110152.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_110152", "110152042", "story_v_out_110152.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_29 = math.max(var_172_20, arg_169_1.talkMaxDuration)

			if var_172_19 <= arg_169_1.time_ and arg_169_1.time_ < var_172_19 + var_172_29 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_19) / var_172_29

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_19 + var_172_29 and arg_169_1.time_ < var_172_19 + var_172_29 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play110152043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 110152043
		arg_173_1.duration_ = 5.166

		local var_173_0 = {
			ja = 3.533,
			ko = 5.166,
			zh = 5,
			en = 5
		}
		local var_173_1 = manager.audio:GetLocalizationFlag()

		if var_173_0[var_173_1] ~= nil then
			arg_173_1.duration_ = var_173_0[var_173_1]
		end

		SetActive(arg_173_1.tipsGo_, false)

		function arg_173_1.onSingleLineFinish_()
			arg_173_1.onSingleLineUpdate_ = nil
			arg_173_1.onSingleLineFinish_ = nil
			arg_173_1.state_ = "waiting"
		end

		function arg_173_1.playNext_(arg_175_0)
			if arg_175_0 == 1 then
				arg_173_0:Play110152044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1111ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect1111ui_story == nil then
				arg_173_1.var_.characterEffect1111ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect1111ui_story then
					arg_173_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect1111ui_story then
				arg_173_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_176_4 = arg_173_1.actors_["1011ui_story"]
			local var_176_5 = 0

			if var_176_5 < arg_173_1.time_ and arg_173_1.time_ <= var_176_5 + arg_176_0 and arg_173_1.var_.characterEffect1011ui_story == nil then
				arg_173_1.var_.characterEffect1011ui_story = var_176_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_6 = 0.2

			if var_176_5 <= arg_173_1.time_ and arg_173_1.time_ < var_176_5 + var_176_6 then
				local var_176_7 = (arg_173_1.time_ - var_176_5) / var_176_6

				if arg_173_1.var_.characterEffect1011ui_story then
					local var_176_8 = Mathf.Lerp(0, 0.5, var_176_7)

					arg_173_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1011ui_story.fillRatio = var_176_8
				end
			end

			if arg_173_1.time_ >= var_176_5 + var_176_6 and arg_173_1.time_ < var_176_5 + var_176_6 + arg_176_0 and arg_173_1.var_.characterEffect1011ui_story then
				local var_176_9 = 0.5

				arg_173_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1011ui_story.fillRatio = var_176_9
			end

			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 then
				arg_173_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action453")
			end

			local var_176_11 = 0

			if var_176_11 < arg_173_1.time_ and arg_173_1.time_ <= var_176_11 + arg_176_0 then
				arg_173_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_176_12 = 0
			local var_176_13 = 0.575

			if var_176_12 < arg_173_1.time_ and arg_173_1.time_ <= var_176_12 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_14 = arg_173_1:FormatText(StoryNameCfg[67].name)

				arg_173_1.leftNameTxt_.text = var_176_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_15 = arg_173_1:GetWordFromCfg(110152043)
				local var_176_16 = arg_173_1:FormatText(var_176_15.content)

				arg_173_1.text_.text = var_176_16

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_17 = 23
				local var_176_18 = utf8.len(var_176_16)
				local var_176_19 = var_176_17 <= 0 and var_176_13 or var_176_13 * (var_176_18 / var_176_17)

				if var_176_19 > 0 and var_176_13 < var_176_19 then
					arg_173_1.talkMaxDuration = var_176_19

					if var_176_19 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_19 + var_176_12
					end
				end

				arg_173_1.text_.text = var_176_16
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152043", "story_v_out_110152.awb") ~= 0 then
					local var_176_20 = manager.audio:GetVoiceLength("story_v_out_110152", "110152043", "story_v_out_110152.awb") / 1000

					if var_176_20 + var_176_12 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_20 + var_176_12
					end

					if var_176_15.prefab_name ~= "" and arg_173_1.actors_[var_176_15.prefab_name] ~= nil then
						local var_176_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_15.prefab_name].transform, "story_v_out_110152", "110152043", "story_v_out_110152.awb")

						arg_173_1:RecordAudio("110152043", var_176_21)
						arg_173_1:RecordAudio("110152043", var_176_21)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_110152", "110152043", "story_v_out_110152.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_110152", "110152043", "story_v_out_110152.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_22 = math.max(var_176_13, arg_173_1.talkMaxDuration)

			if var_176_12 <= arg_173_1.time_ and arg_173_1.time_ < var_176_12 + var_176_22 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_12) / var_176_22

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_12 + var_176_22 and arg_173_1.time_ < var_176_12 + var_176_22 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play110152044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 110152044
		arg_177_1.duration_ = 12.933

		local var_177_0 = {
			ja = 12.4,
			ko = 12.933,
			zh = 12.3,
			en = 12
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play110152045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = 0

			if var_180_0 < arg_177_1.time_ and arg_177_1.time_ <= var_180_0 + arg_180_0 then
				arg_177_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_180_1 = arg_177_1.actors_["1011ui_story"]
			local var_180_2 = 0

			if var_180_2 < arg_177_1.time_ and arg_177_1.time_ <= var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1011ui_story == nil then
				arg_177_1.var_.characterEffect1011ui_story = var_180_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_3 = 0.2

			if var_180_2 <= arg_177_1.time_ and arg_177_1.time_ < var_180_2 + var_180_3 then
				local var_180_4 = (arg_177_1.time_ - var_180_2) / var_180_3

				if arg_177_1.var_.characterEffect1011ui_story then
					arg_177_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_2 + var_180_3 and arg_177_1.time_ < var_180_2 + var_180_3 + arg_180_0 and arg_177_1.var_.characterEffect1011ui_story then
				arg_177_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_180_5 = arg_177_1.actors_["1111ui_story"]
			local var_180_6 = 0

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 and arg_177_1.var_.characterEffect1111ui_story == nil then
				arg_177_1.var_.characterEffect1111ui_story = var_180_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_7 = 0.2

			if var_180_6 <= arg_177_1.time_ and arg_177_1.time_ < var_180_6 + var_180_7 then
				local var_180_8 = (arg_177_1.time_ - var_180_6) / var_180_7

				if arg_177_1.var_.characterEffect1111ui_story then
					local var_180_9 = Mathf.Lerp(0, 0.5, var_180_8)

					arg_177_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1111ui_story.fillRatio = var_180_9
				end
			end

			if arg_177_1.time_ >= var_180_6 + var_180_7 and arg_177_1.time_ < var_180_6 + var_180_7 + arg_180_0 and arg_177_1.var_.characterEffect1111ui_story then
				local var_180_10 = 0.5

				arg_177_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1111ui_story.fillRatio = var_180_10
			end

			local var_180_11 = 0
			local var_180_12 = 1.175

			if var_180_11 < arg_177_1.time_ and arg_177_1.time_ <= var_180_11 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_13 = arg_177_1:FormatText(StoryNameCfg[37].name)

				arg_177_1.leftNameTxt_.text = var_180_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_14 = arg_177_1:GetWordFromCfg(110152044)
				local var_180_15 = arg_177_1:FormatText(var_180_14.content)

				arg_177_1.text_.text = var_180_15

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_16 = 47
				local var_180_17 = utf8.len(var_180_15)
				local var_180_18 = var_180_16 <= 0 and var_180_12 or var_180_12 * (var_180_17 / var_180_16)

				if var_180_18 > 0 and var_180_12 < var_180_18 then
					arg_177_1.talkMaxDuration = var_180_18

					if var_180_18 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_18 + var_180_11
					end
				end

				arg_177_1.text_.text = var_180_15
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152044", "story_v_out_110152.awb") ~= 0 then
					local var_180_19 = manager.audio:GetVoiceLength("story_v_out_110152", "110152044", "story_v_out_110152.awb") / 1000

					if var_180_19 + var_180_11 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_11
					end

					if var_180_14.prefab_name ~= "" and arg_177_1.actors_[var_180_14.prefab_name] ~= nil then
						local var_180_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_14.prefab_name].transform, "story_v_out_110152", "110152044", "story_v_out_110152.awb")

						arg_177_1:RecordAudio("110152044", var_180_20)
						arg_177_1:RecordAudio("110152044", var_180_20)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_110152", "110152044", "story_v_out_110152.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_110152", "110152044", "story_v_out_110152.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_21 = math.max(var_180_12, arg_177_1.talkMaxDuration)

			if var_180_11 <= arg_177_1.time_ and arg_177_1.time_ < var_180_11 + var_180_21 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_11) / var_180_21

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_11 + var_180_21 and arg_177_1.time_ < var_180_11 + var_180_21 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play110152045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 110152045
		arg_181_1.duration_ = 1.999999999999

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play110152046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_184_1 = arg_181_1.actors_["1011ui_story"]
			local var_184_2 = 0

			if var_184_2 < arg_181_1.time_ and arg_181_1.time_ <= var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1011ui_story == nil then
				arg_181_1.var_.characterEffect1011ui_story = var_184_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_3 = 0.2

			if var_184_2 <= arg_181_1.time_ and arg_181_1.time_ < var_184_2 + var_184_3 then
				local var_184_4 = (arg_181_1.time_ - var_184_2) / var_184_3

				if arg_181_1.var_.characterEffect1011ui_story then
					local var_184_5 = Mathf.Lerp(0, 0.5, var_184_4)

					arg_181_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_181_1.var_.characterEffect1011ui_story.fillRatio = var_184_5
				end
			end

			if arg_181_1.time_ >= var_184_2 + var_184_3 and arg_181_1.time_ < var_184_2 + var_184_3 + arg_184_0 and arg_181_1.var_.characterEffect1011ui_story then
				local var_184_6 = 0.5

				arg_181_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_181_1.var_.characterEffect1011ui_story.fillRatio = var_184_6
			end

			local var_184_7 = arg_181_1.actors_["1111ui_story"]
			local var_184_8 = 0

			if var_184_8 < arg_181_1.time_ and arg_181_1.time_ <= var_184_8 + arg_184_0 and arg_181_1.var_.characterEffect1111ui_story == nil then
				arg_181_1.var_.characterEffect1111ui_story = var_184_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_9 = 0.2

			if var_184_8 <= arg_181_1.time_ and arg_181_1.time_ < var_184_8 + var_184_9 then
				local var_184_10 = (arg_181_1.time_ - var_184_8) / var_184_9

				if arg_181_1.var_.characterEffect1111ui_story then
					arg_181_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_8 + var_184_9 and arg_181_1.time_ < var_184_8 + var_184_9 + arg_184_0 and arg_181_1.var_.characterEffect1111ui_story then
				arg_181_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_184_11 = 0
			local var_184_12 = 0.05

			if var_184_11 < arg_181_1.time_ and arg_181_1.time_ <= var_184_11 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_13 = arg_181_1:FormatText(StoryNameCfg[67].name)

				arg_181_1.leftNameTxt_.text = var_184_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_14 = arg_181_1:GetWordFromCfg(110152045)
				local var_184_15 = arg_181_1:FormatText(var_184_14.content)

				arg_181_1.text_.text = var_184_15

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_16 = 2
				local var_184_17 = utf8.len(var_184_15)
				local var_184_18 = var_184_16 <= 0 and var_184_12 or var_184_12 * (var_184_17 / var_184_16)

				if var_184_18 > 0 and var_184_12 < var_184_18 then
					arg_181_1.talkMaxDuration = var_184_18

					if var_184_18 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_18 + var_184_11
					end
				end

				arg_181_1.text_.text = var_184_15
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152045", "story_v_out_110152.awb") ~= 0 then
					local var_184_19 = manager.audio:GetVoiceLength("story_v_out_110152", "110152045", "story_v_out_110152.awb") / 1000

					if var_184_19 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_19 + var_184_11
					end

					if var_184_14.prefab_name ~= "" and arg_181_1.actors_[var_184_14.prefab_name] ~= nil then
						local var_184_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_14.prefab_name].transform, "story_v_out_110152", "110152045", "story_v_out_110152.awb")

						arg_181_1:RecordAudio("110152045", var_184_20)
						arg_181_1:RecordAudio("110152045", var_184_20)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_110152", "110152045", "story_v_out_110152.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_110152", "110152045", "story_v_out_110152.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_21 = math.max(var_184_12, arg_181_1.talkMaxDuration)

			if var_184_11 <= arg_181_1.time_ and arg_181_1.time_ < var_184_11 + var_184_21 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_11) / var_184_21

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_11 + var_184_21 and arg_181_1.time_ < var_184_11 + var_184_21 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play110152046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 110152046
		arg_185_1.duration_ = 12.8

		local var_185_0 = {
			ja = 8.3,
			ko = 11.166,
			zh = 10.766,
			en = 12.8
		}
		local var_185_1 = manager.audio:GetLocalizationFlag()

		if var_185_0[var_185_1] ~= nil then
			arg_185_1.duration_ = var_185_0[var_185_1]
		end

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play110152047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_188_1 = arg_185_1.actors_["1111ui_story"]
			local var_188_2 = 0

			if var_188_2 < arg_185_1.time_ and arg_185_1.time_ <= var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect1111ui_story == nil then
				arg_185_1.var_.characterEffect1111ui_story = var_188_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_3 = 0.2

			if var_188_2 <= arg_185_1.time_ and arg_185_1.time_ < var_188_2 + var_188_3 then
				local var_188_4 = (arg_185_1.time_ - var_188_2) / var_188_3

				if arg_185_1.var_.characterEffect1111ui_story then
					local var_188_5 = Mathf.Lerp(0, 0.5, var_188_4)

					arg_185_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_185_1.var_.characterEffect1111ui_story.fillRatio = var_188_5
				end
			end

			if arg_185_1.time_ >= var_188_2 + var_188_3 and arg_185_1.time_ < var_188_2 + var_188_3 + arg_188_0 and arg_185_1.var_.characterEffect1111ui_story then
				local var_188_6 = 0.5

				arg_185_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_185_1.var_.characterEffect1111ui_story.fillRatio = var_188_6
			end

			local var_188_7 = arg_185_1.actors_["1011ui_story"]
			local var_188_8 = 0

			if var_188_8 < arg_185_1.time_ and arg_185_1.time_ <= var_188_8 + arg_188_0 and arg_185_1.var_.characterEffect1011ui_story == nil then
				arg_185_1.var_.characterEffect1011ui_story = var_188_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_9 = 0.2

			if var_188_8 <= arg_185_1.time_ and arg_185_1.time_ < var_188_8 + var_188_9 then
				local var_188_10 = (arg_185_1.time_ - var_188_8) / var_188_9

				if arg_185_1.var_.characterEffect1011ui_story then
					arg_185_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_8 + var_188_9 and arg_185_1.time_ < var_188_8 + var_188_9 + arg_188_0 and arg_185_1.var_.characterEffect1011ui_story then
				arg_185_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_188_11 = 0
			local var_188_12 = 1.025

			if var_188_11 < arg_185_1.time_ and arg_185_1.time_ <= var_188_11 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_13 = arg_185_1:FormatText(StoryNameCfg[37].name)

				arg_185_1.leftNameTxt_.text = var_188_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_14 = arg_185_1:GetWordFromCfg(110152046)
				local var_188_15 = arg_185_1:FormatText(var_188_14.content)

				arg_185_1.text_.text = var_188_15

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_16 = 41
				local var_188_17 = utf8.len(var_188_15)
				local var_188_18 = var_188_16 <= 0 and var_188_12 or var_188_12 * (var_188_17 / var_188_16)

				if var_188_18 > 0 and var_188_12 < var_188_18 then
					arg_185_1.talkMaxDuration = var_188_18

					if var_188_18 + var_188_11 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_18 + var_188_11
					end
				end

				arg_185_1.text_.text = var_188_15
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152046", "story_v_out_110152.awb") ~= 0 then
					local var_188_19 = manager.audio:GetVoiceLength("story_v_out_110152", "110152046", "story_v_out_110152.awb") / 1000

					if var_188_19 + var_188_11 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_19 + var_188_11
					end

					if var_188_14.prefab_name ~= "" and arg_185_1.actors_[var_188_14.prefab_name] ~= nil then
						local var_188_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_14.prefab_name].transform, "story_v_out_110152", "110152046", "story_v_out_110152.awb")

						arg_185_1:RecordAudio("110152046", var_188_20)
						arg_185_1:RecordAudio("110152046", var_188_20)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_110152", "110152046", "story_v_out_110152.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_110152", "110152046", "story_v_out_110152.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_21 = math.max(var_188_12, arg_185_1.talkMaxDuration)

			if var_188_11 <= arg_185_1.time_ and arg_185_1.time_ < var_188_11 + var_188_21 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_11) / var_188_21

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_11 + var_188_21 and arg_185_1.time_ < var_188_11 + var_188_21 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play110152047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 110152047
		arg_189_1.duration_ = 4.433

		local var_189_0 = {
			ja = 4.433,
			ko = 3.7,
			zh = 2.733,
			en = 3.166
		}
		local var_189_1 = manager.audio:GetLocalizationFlag()

		if var_189_0[var_189_1] ~= nil then
			arg_189_1.duration_ = var_189_0[var_189_1]
		end

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play110152048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action3_2")
			end

			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_192_2 = arg_189_1.actors_["1111ui_story"]
			local var_192_3 = 0

			if var_192_3 < arg_189_1.time_ and arg_189_1.time_ <= var_192_3 + arg_192_0 and arg_189_1.var_.characterEffect1111ui_story == nil then
				arg_189_1.var_.characterEffect1111ui_story = var_192_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_4 = 0.2

			if var_192_3 <= arg_189_1.time_ and arg_189_1.time_ < var_192_3 + var_192_4 then
				local var_192_5 = (arg_189_1.time_ - var_192_3) / var_192_4

				if arg_189_1.var_.characterEffect1111ui_story then
					arg_189_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_3 + var_192_4 and arg_189_1.time_ < var_192_3 + var_192_4 + arg_192_0 and arg_189_1.var_.characterEffect1111ui_story then
				arg_189_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_192_6 = arg_189_1.actors_["1011ui_story"]
			local var_192_7 = 0

			if var_192_7 < arg_189_1.time_ and arg_189_1.time_ <= var_192_7 + arg_192_0 and arg_189_1.var_.characterEffect1011ui_story == nil then
				arg_189_1.var_.characterEffect1011ui_story = var_192_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_8 = 0.2

			if var_192_7 <= arg_189_1.time_ and arg_189_1.time_ < var_192_7 + var_192_8 then
				local var_192_9 = (arg_189_1.time_ - var_192_7) / var_192_8

				if arg_189_1.var_.characterEffect1011ui_story then
					local var_192_10 = Mathf.Lerp(0, 0.5, var_192_9)

					arg_189_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_189_1.var_.characterEffect1011ui_story.fillRatio = var_192_10
				end
			end

			if arg_189_1.time_ >= var_192_7 + var_192_8 and arg_189_1.time_ < var_192_7 + var_192_8 + arg_192_0 and arg_189_1.var_.characterEffect1011ui_story then
				local var_192_11 = 0.5

				arg_189_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_189_1.var_.characterEffect1011ui_story.fillRatio = var_192_11
			end

			local var_192_12 = 0
			local var_192_13 = 0.4

			if var_192_12 < arg_189_1.time_ and arg_189_1.time_ <= var_192_12 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_14 = arg_189_1:FormatText(StoryNameCfg[67].name)

				arg_189_1.leftNameTxt_.text = var_192_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_15 = arg_189_1:GetWordFromCfg(110152047)
				local var_192_16 = arg_189_1:FormatText(var_192_15.content)

				arg_189_1.text_.text = var_192_16

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_17 = 16
				local var_192_18 = utf8.len(var_192_16)
				local var_192_19 = var_192_17 <= 0 and var_192_13 or var_192_13 * (var_192_18 / var_192_17)

				if var_192_19 > 0 and var_192_13 < var_192_19 then
					arg_189_1.talkMaxDuration = var_192_19

					if var_192_19 + var_192_12 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_19 + var_192_12
					end
				end

				arg_189_1.text_.text = var_192_16
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152047", "story_v_out_110152.awb") ~= 0 then
					local var_192_20 = manager.audio:GetVoiceLength("story_v_out_110152", "110152047", "story_v_out_110152.awb") / 1000

					if var_192_20 + var_192_12 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_20 + var_192_12
					end

					if var_192_15.prefab_name ~= "" and arg_189_1.actors_[var_192_15.prefab_name] ~= nil then
						local var_192_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_15.prefab_name].transform, "story_v_out_110152", "110152047", "story_v_out_110152.awb")

						arg_189_1:RecordAudio("110152047", var_192_21)
						arg_189_1:RecordAudio("110152047", var_192_21)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_110152", "110152047", "story_v_out_110152.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_110152", "110152047", "story_v_out_110152.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_22 = math.max(var_192_13, arg_189_1.talkMaxDuration)

			if var_192_12 <= arg_189_1.time_ and arg_189_1.time_ < var_192_12 + var_192_22 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_12) / var_192_22

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_12 + var_192_22 and arg_189_1.time_ < var_192_12 + var_192_22 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play110152048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 110152048
		arg_193_1.duration_ = 5.3

		local var_193_0 = {
			ja = 5.3,
			ko = 4.866,
			zh = 4.366,
			en = 3.7
		}
		local var_193_1 = manager.audio:GetLocalizationFlag()

		if var_193_0[var_193_1] ~= nil then
			arg_193_1.duration_ = var_193_0[var_193_1]
		end

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play110152049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_196_1 = 0
			local var_196_2 = 0.5

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_3 = arg_193_1:FormatText(StoryNameCfg[67].name)

				arg_193_1.leftNameTxt_.text = var_196_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_4 = arg_193_1:GetWordFromCfg(110152048)
				local var_196_5 = arg_193_1:FormatText(var_196_4.content)

				arg_193_1.text_.text = var_196_5

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_6 = 20
				local var_196_7 = utf8.len(var_196_5)
				local var_196_8 = var_196_6 <= 0 and var_196_2 or var_196_2 * (var_196_7 / var_196_6)

				if var_196_8 > 0 and var_196_2 < var_196_8 then
					arg_193_1.talkMaxDuration = var_196_8

					if var_196_8 + var_196_1 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_1
					end
				end

				arg_193_1.text_.text = var_196_5
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152048", "story_v_out_110152.awb") ~= 0 then
					local var_196_9 = manager.audio:GetVoiceLength("story_v_out_110152", "110152048", "story_v_out_110152.awb") / 1000

					if var_196_9 + var_196_1 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_9 + var_196_1
					end

					if var_196_4.prefab_name ~= "" and arg_193_1.actors_[var_196_4.prefab_name] ~= nil then
						local var_196_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_4.prefab_name].transform, "story_v_out_110152", "110152048", "story_v_out_110152.awb")

						arg_193_1:RecordAudio("110152048", var_196_10)
						arg_193_1:RecordAudio("110152048", var_196_10)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_110152", "110152048", "story_v_out_110152.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_110152", "110152048", "story_v_out_110152.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_11 = math.max(var_196_2, arg_193_1.talkMaxDuration)

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_11 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_1) / var_196_11

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_1 + var_196_11 and arg_193_1.time_ < var_196_1 + var_196_11 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play110152049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 110152049
		arg_197_1.duration_ = 1.999999999999

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play110152050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action426")
			end

			local var_200_2 = arg_197_1.actors_["1011ui_story"]
			local var_200_3 = 0

			if var_200_3 < arg_197_1.time_ and arg_197_1.time_ <= var_200_3 + arg_200_0 and arg_197_1.var_.characterEffect1011ui_story == nil then
				arg_197_1.var_.characterEffect1011ui_story = var_200_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_4 = 0.2

			if var_200_3 <= arg_197_1.time_ and arg_197_1.time_ < var_200_3 + var_200_4 then
				local var_200_5 = (arg_197_1.time_ - var_200_3) / var_200_4

				if arg_197_1.var_.characterEffect1011ui_story then
					arg_197_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_3 + var_200_4 and arg_197_1.time_ < var_200_3 + var_200_4 + arg_200_0 and arg_197_1.var_.characterEffect1011ui_story then
				arg_197_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_200_6 = arg_197_1.actors_["1111ui_story"]
			local var_200_7 = 0

			if var_200_7 < arg_197_1.time_ and arg_197_1.time_ <= var_200_7 + arg_200_0 and arg_197_1.var_.characterEffect1111ui_story == nil then
				arg_197_1.var_.characterEffect1111ui_story = var_200_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_8 = 0.2

			if var_200_7 <= arg_197_1.time_ and arg_197_1.time_ < var_200_7 + var_200_8 then
				local var_200_9 = (arg_197_1.time_ - var_200_7) / var_200_8

				if arg_197_1.var_.characterEffect1111ui_story then
					local var_200_10 = Mathf.Lerp(0, 0.5, var_200_9)

					arg_197_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1111ui_story.fillRatio = var_200_10
				end
			end

			if arg_197_1.time_ >= var_200_7 + var_200_8 and arg_197_1.time_ < var_200_7 + var_200_8 + arg_200_0 and arg_197_1.var_.characterEffect1111ui_story then
				local var_200_11 = 0.5

				arg_197_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1111ui_story.fillRatio = var_200_11
			end

			local var_200_12 = 0
			local var_200_13 = 0.075

			if var_200_12 < arg_197_1.time_ and arg_197_1.time_ <= var_200_12 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_14 = arg_197_1:FormatText(StoryNameCfg[37].name)

				arg_197_1.leftNameTxt_.text = var_200_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_15 = arg_197_1:GetWordFromCfg(110152049)
				local var_200_16 = arg_197_1:FormatText(var_200_15.content)

				arg_197_1.text_.text = var_200_16

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_17 = 3
				local var_200_18 = utf8.len(var_200_16)
				local var_200_19 = var_200_17 <= 0 and var_200_13 or var_200_13 * (var_200_18 / var_200_17)

				if var_200_19 > 0 and var_200_13 < var_200_19 then
					arg_197_1.talkMaxDuration = var_200_19

					if var_200_19 + var_200_12 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_19 + var_200_12
					end
				end

				arg_197_1.text_.text = var_200_16
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152049", "story_v_out_110152.awb") ~= 0 then
					local var_200_20 = manager.audio:GetVoiceLength("story_v_out_110152", "110152049", "story_v_out_110152.awb") / 1000

					if var_200_20 + var_200_12 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_20 + var_200_12
					end

					if var_200_15.prefab_name ~= "" and arg_197_1.actors_[var_200_15.prefab_name] ~= nil then
						local var_200_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_15.prefab_name].transform, "story_v_out_110152", "110152049", "story_v_out_110152.awb")

						arg_197_1:RecordAudio("110152049", var_200_21)
						arg_197_1:RecordAudio("110152049", var_200_21)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_110152", "110152049", "story_v_out_110152.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_110152", "110152049", "story_v_out_110152.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_22 = math.max(var_200_13, arg_197_1.talkMaxDuration)

			if var_200_12 <= arg_197_1.time_ and arg_197_1.time_ < var_200_12 + var_200_22 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_12) / var_200_22

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_12 + var_200_22 and arg_197_1.time_ < var_200_12 + var_200_22 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play110152050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 110152050
		arg_201_1.duration_ = 11.833

		local var_201_0 = {
			ja = 7.6,
			ko = 11.833,
			zh = 10,
			en = 7.433
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play110152051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_1")
			end

			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_204_2 = arg_201_1.actors_["1011ui_story"]
			local var_204_3 = 0

			if var_204_3 < arg_201_1.time_ and arg_201_1.time_ <= var_204_3 + arg_204_0 and arg_201_1.var_.characterEffect1011ui_story == nil then
				arg_201_1.var_.characterEffect1011ui_story = var_204_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_4 = 0.2

			if var_204_3 <= arg_201_1.time_ and arg_201_1.time_ < var_204_3 + var_204_4 then
				local var_204_5 = (arg_201_1.time_ - var_204_3) / var_204_4

				if arg_201_1.var_.characterEffect1011ui_story then
					local var_204_6 = Mathf.Lerp(0, 0.5, var_204_5)

					arg_201_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1011ui_story.fillRatio = var_204_6
				end
			end

			if arg_201_1.time_ >= var_204_3 + var_204_4 and arg_201_1.time_ < var_204_3 + var_204_4 + arg_204_0 and arg_201_1.var_.characterEffect1011ui_story then
				local var_204_7 = 0.5

				arg_201_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1011ui_story.fillRatio = var_204_7
			end

			local var_204_8 = arg_201_1.actors_["1111ui_story"]
			local var_204_9 = 0

			if var_204_9 < arg_201_1.time_ and arg_201_1.time_ <= var_204_9 + arg_204_0 and arg_201_1.var_.characterEffect1111ui_story == nil then
				arg_201_1.var_.characterEffect1111ui_story = var_204_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_10 = 0.2

			if var_204_9 <= arg_201_1.time_ and arg_201_1.time_ < var_204_9 + var_204_10 then
				local var_204_11 = (arg_201_1.time_ - var_204_9) / var_204_10

				if arg_201_1.var_.characterEffect1111ui_story then
					arg_201_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_9 + var_204_10 and arg_201_1.time_ < var_204_9 + var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect1111ui_story then
				arg_201_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_204_12 = 0
			local var_204_13 = 1.075

			if var_204_12 < arg_201_1.time_ and arg_201_1.time_ <= var_204_12 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_14 = arg_201_1:FormatText(StoryNameCfg[67].name)

				arg_201_1.leftNameTxt_.text = var_204_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_15 = arg_201_1:GetWordFromCfg(110152050)
				local var_204_16 = arg_201_1:FormatText(var_204_15.content)

				arg_201_1.text_.text = var_204_16

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_17 = 41
				local var_204_18 = utf8.len(var_204_16)
				local var_204_19 = var_204_17 <= 0 and var_204_13 or var_204_13 * (var_204_18 / var_204_17)

				if var_204_19 > 0 and var_204_13 < var_204_19 then
					arg_201_1.talkMaxDuration = var_204_19

					if var_204_19 + var_204_12 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_19 + var_204_12
					end
				end

				arg_201_1.text_.text = var_204_16
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152050", "story_v_out_110152.awb") ~= 0 then
					local var_204_20 = manager.audio:GetVoiceLength("story_v_out_110152", "110152050", "story_v_out_110152.awb") / 1000

					if var_204_20 + var_204_12 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_20 + var_204_12
					end

					if var_204_15.prefab_name ~= "" and arg_201_1.actors_[var_204_15.prefab_name] ~= nil then
						local var_204_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_15.prefab_name].transform, "story_v_out_110152", "110152050", "story_v_out_110152.awb")

						arg_201_1:RecordAudio("110152050", var_204_21)
						arg_201_1:RecordAudio("110152050", var_204_21)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_110152", "110152050", "story_v_out_110152.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_110152", "110152050", "story_v_out_110152.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_22 = math.max(var_204_13, arg_201_1.talkMaxDuration)

			if var_204_12 <= arg_201_1.time_ and arg_201_1.time_ < var_204_12 + var_204_22 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_12) / var_204_22

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_12 + var_204_22 and arg_201_1.time_ < var_204_12 + var_204_22 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play110152051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 110152051
		arg_205_1.duration_ = 1.999999999999

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play110152052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action463")
			end

			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_208_2 = arg_205_1.actors_["1011ui_story"]
			local var_208_3 = 0

			if var_208_3 < arg_205_1.time_ and arg_205_1.time_ <= var_208_3 + arg_208_0 and arg_205_1.var_.characterEffect1011ui_story == nil then
				arg_205_1.var_.characterEffect1011ui_story = var_208_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_4 = 0.2

			if var_208_3 <= arg_205_1.time_ and arg_205_1.time_ < var_208_3 + var_208_4 then
				local var_208_5 = (arg_205_1.time_ - var_208_3) / var_208_4

				if arg_205_1.var_.characterEffect1011ui_story then
					arg_205_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_3 + var_208_4 and arg_205_1.time_ < var_208_3 + var_208_4 + arg_208_0 and arg_205_1.var_.characterEffect1011ui_story then
				arg_205_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_208_6 = arg_205_1.actors_["1111ui_story"]
			local var_208_7 = 0

			if var_208_7 < arg_205_1.time_ and arg_205_1.time_ <= var_208_7 + arg_208_0 and arg_205_1.var_.characterEffect1111ui_story == nil then
				arg_205_1.var_.characterEffect1111ui_story = var_208_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_8 = 0.2

			if var_208_7 <= arg_205_1.time_ and arg_205_1.time_ < var_208_7 + var_208_8 then
				local var_208_9 = (arg_205_1.time_ - var_208_7) / var_208_8

				if arg_205_1.var_.characterEffect1111ui_story then
					local var_208_10 = Mathf.Lerp(0, 0.5, var_208_9)

					arg_205_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1111ui_story.fillRatio = var_208_10
				end
			end

			if arg_205_1.time_ >= var_208_7 + var_208_8 and arg_205_1.time_ < var_208_7 + var_208_8 + arg_208_0 and arg_205_1.var_.characterEffect1111ui_story then
				local var_208_11 = 0.5

				arg_205_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1111ui_story.fillRatio = var_208_11
			end

			local var_208_12 = 0
			local var_208_13 = 0.05

			if var_208_12 < arg_205_1.time_ and arg_205_1.time_ <= var_208_12 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_14 = arg_205_1:FormatText(StoryNameCfg[37].name)

				arg_205_1.leftNameTxt_.text = var_208_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_15 = arg_205_1:GetWordFromCfg(110152051)
				local var_208_16 = arg_205_1:FormatText(var_208_15.content)

				arg_205_1.text_.text = var_208_16

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_17 = 2
				local var_208_18 = utf8.len(var_208_16)
				local var_208_19 = var_208_17 <= 0 and var_208_13 or var_208_13 * (var_208_18 / var_208_17)

				if var_208_19 > 0 and var_208_13 < var_208_19 then
					arg_205_1.talkMaxDuration = var_208_19

					if var_208_19 + var_208_12 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_19 + var_208_12
					end
				end

				arg_205_1.text_.text = var_208_16
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152051", "story_v_out_110152.awb") ~= 0 then
					local var_208_20 = manager.audio:GetVoiceLength("story_v_out_110152", "110152051", "story_v_out_110152.awb") / 1000

					if var_208_20 + var_208_12 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_20 + var_208_12
					end

					if var_208_15.prefab_name ~= "" and arg_205_1.actors_[var_208_15.prefab_name] ~= nil then
						local var_208_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_15.prefab_name].transform, "story_v_out_110152", "110152051", "story_v_out_110152.awb")

						arg_205_1:RecordAudio("110152051", var_208_21)
						arg_205_1:RecordAudio("110152051", var_208_21)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_110152", "110152051", "story_v_out_110152.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_110152", "110152051", "story_v_out_110152.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_22 = math.max(var_208_13, arg_205_1.talkMaxDuration)

			if var_208_12 <= arg_205_1.time_ and arg_205_1.time_ < var_208_12 + var_208_22 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_12) / var_208_22

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_12 + var_208_22 and arg_205_1.time_ < var_208_12 + var_208_22 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play110152052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 110152052
		arg_209_1.duration_ = 9.533

		local var_209_0 = {
			ja = 6.2,
			ko = 9.533,
			zh = 6.933,
			en = 6.933
		}
		local var_209_1 = manager.audio:GetLocalizationFlag()

		if var_209_0[var_209_1] ~= nil then
			arg_209_1.duration_ = var_209_0[var_209_1]
		end

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play110152053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_212_1 = arg_209_1.actors_["1011ui_story"]
			local var_212_2 = 0

			if var_212_2 < arg_209_1.time_ and arg_209_1.time_ <= var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1011ui_story == nil then
				arg_209_1.var_.characterEffect1011ui_story = var_212_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_3 = 0.2

			if var_212_2 <= arg_209_1.time_ and arg_209_1.time_ < var_212_2 + var_212_3 then
				local var_212_4 = (arg_209_1.time_ - var_212_2) / var_212_3

				if arg_209_1.var_.characterEffect1011ui_story then
					local var_212_5 = Mathf.Lerp(0, 0.5, var_212_4)

					arg_209_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1011ui_story.fillRatio = var_212_5
				end
			end

			if arg_209_1.time_ >= var_212_2 + var_212_3 and arg_209_1.time_ < var_212_2 + var_212_3 + arg_212_0 and arg_209_1.var_.characterEffect1011ui_story then
				local var_212_6 = 0.5

				arg_209_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1011ui_story.fillRatio = var_212_6
			end

			local var_212_7 = arg_209_1.actors_["1111ui_story"]
			local var_212_8 = 0

			if var_212_8 < arg_209_1.time_ and arg_209_1.time_ <= var_212_8 + arg_212_0 and arg_209_1.var_.characterEffect1111ui_story == nil then
				arg_209_1.var_.characterEffect1111ui_story = var_212_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_9 = 0.2

			if var_212_8 <= arg_209_1.time_ and arg_209_1.time_ < var_212_8 + var_212_9 then
				local var_212_10 = (arg_209_1.time_ - var_212_8) / var_212_9

				if arg_209_1.var_.characterEffect1111ui_story then
					arg_209_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_8 + var_212_9 and arg_209_1.time_ < var_212_8 + var_212_9 + arg_212_0 and arg_209_1.var_.characterEffect1111ui_story then
				arg_209_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_212_11 = 0
			local var_212_12 = 0.925

			if var_212_11 < arg_209_1.time_ and arg_209_1.time_ <= var_212_11 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_13 = arg_209_1:FormatText(StoryNameCfg[67].name)

				arg_209_1.leftNameTxt_.text = var_212_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_14 = arg_209_1:GetWordFromCfg(110152052)
				local var_212_15 = arg_209_1:FormatText(var_212_14.content)

				arg_209_1.text_.text = var_212_15

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_16 = 37
				local var_212_17 = utf8.len(var_212_15)
				local var_212_18 = var_212_16 <= 0 and var_212_12 or var_212_12 * (var_212_17 / var_212_16)

				if var_212_18 > 0 and var_212_12 < var_212_18 then
					arg_209_1.talkMaxDuration = var_212_18

					if var_212_18 + var_212_11 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_18 + var_212_11
					end
				end

				arg_209_1.text_.text = var_212_15
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152052", "story_v_out_110152.awb") ~= 0 then
					local var_212_19 = manager.audio:GetVoiceLength("story_v_out_110152", "110152052", "story_v_out_110152.awb") / 1000

					if var_212_19 + var_212_11 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_19 + var_212_11
					end

					if var_212_14.prefab_name ~= "" and arg_209_1.actors_[var_212_14.prefab_name] ~= nil then
						local var_212_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_14.prefab_name].transform, "story_v_out_110152", "110152052", "story_v_out_110152.awb")

						arg_209_1:RecordAudio("110152052", var_212_20)
						arg_209_1:RecordAudio("110152052", var_212_20)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_110152", "110152052", "story_v_out_110152.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_110152", "110152052", "story_v_out_110152.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_21 = math.max(var_212_12, arg_209_1.talkMaxDuration)

			if var_212_11 <= arg_209_1.time_ and arg_209_1.time_ < var_212_11 + var_212_21 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_11) / var_212_21

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_11 + var_212_21 and arg_209_1.time_ < var_212_11 + var_212_21 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play110152053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 110152053
		arg_213_1.duration_ = 8.8

		local var_213_0 = {
			ja = 8.8,
			ko = 6.4,
			zh = 8.333,
			en = 7.866
		}
		local var_213_1 = manager.audio:GetLocalizationFlag()

		if var_213_0[var_213_1] ~= nil then
			arg_213_1.duration_ = var_213_0[var_213_1]
		end

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play110152054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action432")
			end

			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_216_2 = arg_213_1.actors_["1111ui_story"]
			local var_216_3 = 0

			if var_216_3 < arg_213_1.time_ and arg_213_1.time_ <= var_216_3 + arg_216_0 and arg_213_1.var_.characterEffect1111ui_story == nil then
				arg_213_1.var_.characterEffect1111ui_story = var_216_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_4 = 0.2

			if var_216_3 <= arg_213_1.time_ and arg_213_1.time_ < var_216_3 + var_216_4 then
				local var_216_5 = (arg_213_1.time_ - var_216_3) / var_216_4

				if arg_213_1.var_.characterEffect1111ui_story then
					local var_216_6 = Mathf.Lerp(0, 0.5, var_216_5)

					arg_213_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1111ui_story.fillRatio = var_216_6
				end
			end

			if arg_213_1.time_ >= var_216_3 + var_216_4 and arg_213_1.time_ < var_216_3 + var_216_4 + arg_216_0 and arg_213_1.var_.characterEffect1111ui_story then
				local var_216_7 = 0.5

				arg_213_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1111ui_story.fillRatio = var_216_7
			end

			local var_216_8 = arg_213_1.actors_["1011ui_story"]
			local var_216_9 = 0

			if var_216_9 < arg_213_1.time_ and arg_213_1.time_ <= var_216_9 + arg_216_0 and arg_213_1.var_.characterEffect1011ui_story == nil then
				arg_213_1.var_.characterEffect1011ui_story = var_216_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_10 = 0.2

			if var_216_9 <= arg_213_1.time_ and arg_213_1.time_ < var_216_9 + var_216_10 then
				local var_216_11 = (arg_213_1.time_ - var_216_9) / var_216_10

				if arg_213_1.var_.characterEffect1011ui_story then
					arg_213_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_9 + var_216_10 and arg_213_1.time_ < var_216_9 + var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect1011ui_story then
				arg_213_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_216_12 = 0
			local var_216_13 = 0.6

			if var_216_12 < arg_213_1.time_ and arg_213_1.time_ <= var_216_12 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_14 = arg_213_1:FormatText(StoryNameCfg[37].name)

				arg_213_1.leftNameTxt_.text = var_216_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_15 = arg_213_1:GetWordFromCfg(110152053)
				local var_216_16 = arg_213_1:FormatText(var_216_15.content)

				arg_213_1.text_.text = var_216_16

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_17 = 24
				local var_216_18 = utf8.len(var_216_16)
				local var_216_19 = var_216_17 <= 0 and var_216_13 or var_216_13 * (var_216_18 / var_216_17)

				if var_216_19 > 0 and var_216_13 < var_216_19 then
					arg_213_1.talkMaxDuration = var_216_19

					if var_216_19 + var_216_12 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_19 + var_216_12
					end
				end

				arg_213_1.text_.text = var_216_16
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152053", "story_v_out_110152.awb") ~= 0 then
					local var_216_20 = manager.audio:GetVoiceLength("story_v_out_110152", "110152053", "story_v_out_110152.awb") / 1000

					if var_216_20 + var_216_12 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_20 + var_216_12
					end

					if var_216_15.prefab_name ~= "" and arg_213_1.actors_[var_216_15.prefab_name] ~= nil then
						local var_216_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_15.prefab_name].transform, "story_v_out_110152", "110152053", "story_v_out_110152.awb")

						arg_213_1:RecordAudio("110152053", var_216_21)
						arg_213_1:RecordAudio("110152053", var_216_21)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_110152", "110152053", "story_v_out_110152.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_110152", "110152053", "story_v_out_110152.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_22 = math.max(var_216_13, arg_213_1.talkMaxDuration)

			if var_216_12 <= arg_213_1.time_ and arg_213_1.time_ < var_216_12 + var_216_22 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_12) / var_216_22

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_12 + var_216_22 and arg_213_1.time_ < var_216_12 + var_216_22 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play110152054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 110152054
		arg_217_1.duration_ = 9.433

		local var_217_0 = {
			ja = 5.8,
			ko = 9.433,
			zh = 9,
			en = 7.6
		}
		local var_217_1 = manager.audio:GetLocalizationFlag()

		if var_217_0[var_217_1] ~= nil then
			arg_217_1.duration_ = var_217_0[var_217_1]
		end

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play110152055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action445")
			end

			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_220_2 = arg_217_1.actors_["1011ui_story"]
			local var_220_3 = 0

			if var_220_3 < arg_217_1.time_ and arg_217_1.time_ <= var_220_3 + arg_220_0 and arg_217_1.var_.characterEffect1011ui_story == nil then
				arg_217_1.var_.characterEffect1011ui_story = var_220_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_4 = 0.2

			if var_220_3 <= arg_217_1.time_ and arg_217_1.time_ < var_220_3 + var_220_4 then
				local var_220_5 = (arg_217_1.time_ - var_220_3) / var_220_4

				if arg_217_1.var_.characterEffect1011ui_story then
					local var_220_6 = Mathf.Lerp(0, 0.5, var_220_5)

					arg_217_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1011ui_story.fillRatio = var_220_6
				end
			end

			if arg_217_1.time_ >= var_220_3 + var_220_4 and arg_217_1.time_ < var_220_3 + var_220_4 + arg_220_0 and arg_217_1.var_.characterEffect1011ui_story then
				local var_220_7 = 0.5

				arg_217_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1011ui_story.fillRatio = var_220_7
			end

			local var_220_8 = arg_217_1.actors_["1111ui_story"]
			local var_220_9 = 0

			if var_220_9 < arg_217_1.time_ and arg_217_1.time_ <= var_220_9 + arg_220_0 and arg_217_1.var_.characterEffect1111ui_story == nil then
				arg_217_1.var_.characterEffect1111ui_story = var_220_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_10 = 0.2

			if var_220_9 <= arg_217_1.time_ and arg_217_1.time_ < var_220_9 + var_220_10 then
				local var_220_11 = (arg_217_1.time_ - var_220_9) / var_220_10

				if arg_217_1.var_.characterEffect1111ui_story then
					arg_217_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_9 + var_220_10 and arg_217_1.time_ < var_220_9 + var_220_10 + arg_220_0 and arg_217_1.var_.characterEffect1111ui_story then
				arg_217_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_220_12 = 0
			local var_220_13 = 0.925

			if var_220_12 < arg_217_1.time_ and arg_217_1.time_ <= var_220_12 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_14 = arg_217_1:FormatText(StoryNameCfg[67].name)

				arg_217_1.leftNameTxt_.text = var_220_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_15 = arg_217_1:GetWordFromCfg(110152054)
				local var_220_16 = arg_217_1:FormatText(var_220_15.content)

				arg_217_1.text_.text = var_220_16

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_17 = 37
				local var_220_18 = utf8.len(var_220_16)
				local var_220_19 = var_220_17 <= 0 and var_220_13 or var_220_13 * (var_220_18 / var_220_17)

				if var_220_19 > 0 and var_220_13 < var_220_19 then
					arg_217_1.talkMaxDuration = var_220_19

					if var_220_19 + var_220_12 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_19 + var_220_12
					end
				end

				arg_217_1.text_.text = var_220_16
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152054", "story_v_out_110152.awb") ~= 0 then
					local var_220_20 = manager.audio:GetVoiceLength("story_v_out_110152", "110152054", "story_v_out_110152.awb") / 1000

					if var_220_20 + var_220_12 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_20 + var_220_12
					end

					if var_220_15.prefab_name ~= "" and arg_217_1.actors_[var_220_15.prefab_name] ~= nil then
						local var_220_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_15.prefab_name].transform, "story_v_out_110152", "110152054", "story_v_out_110152.awb")

						arg_217_1:RecordAudio("110152054", var_220_21)
						arg_217_1:RecordAudio("110152054", var_220_21)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_110152", "110152054", "story_v_out_110152.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_110152", "110152054", "story_v_out_110152.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_22 = math.max(var_220_13, arg_217_1.talkMaxDuration)

			if var_220_12 <= arg_217_1.time_ and arg_217_1.time_ < var_220_12 + var_220_22 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_12) / var_220_22

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_12 + var_220_22 and arg_217_1.time_ < var_220_12 + var_220_22 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play110152055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 110152055
		arg_221_1.duration_ = 5.966

		local var_221_0 = {
			ja = 5.966,
			ko = 3.733,
			zh = 3.7,
			en = 2.4
		}
		local var_221_1 = manager.audio:GetLocalizationFlag()

		if var_221_0[var_221_1] ~= nil then
			arg_221_1.duration_ = var_221_0[var_221_1]
		end

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play110152056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_224_1 = arg_221_1.actors_["1011ui_story"]
			local var_224_2 = 0

			if var_224_2 < arg_221_1.time_ and arg_221_1.time_ <= var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1011ui_story == nil then
				arg_221_1.var_.characterEffect1011ui_story = var_224_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_3 = 0.2

			if var_224_2 <= arg_221_1.time_ and arg_221_1.time_ < var_224_2 + var_224_3 then
				local var_224_4 = (arg_221_1.time_ - var_224_2) / var_224_3

				if arg_221_1.var_.characterEffect1011ui_story then
					arg_221_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_2 + var_224_3 and arg_221_1.time_ < var_224_2 + var_224_3 + arg_224_0 and arg_221_1.var_.characterEffect1011ui_story then
				arg_221_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_224_5 = arg_221_1.actors_["1111ui_story"]
			local var_224_6 = 0

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 and arg_221_1.var_.characterEffect1111ui_story == nil then
				arg_221_1.var_.characterEffect1111ui_story = var_224_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_7 = 0.2

			if var_224_6 <= arg_221_1.time_ and arg_221_1.time_ < var_224_6 + var_224_7 then
				local var_224_8 = (arg_221_1.time_ - var_224_6) / var_224_7

				if arg_221_1.var_.characterEffect1111ui_story then
					local var_224_9 = Mathf.Lerp(0, 0.5, var_224_8)

					arg_221_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1111ui_story.fillRatio = var_224_9
				end
			end

			if arg_221_1.time_ >= var_224_6 + var_224_7 and arg_221_1.time_ < var_224_6 + var_224_7 + arg_224_0 and arg_221_1.var_.characterEffect1111ui_story then
				local var_224_10 = 0.5

				arg_221_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1111ui_story.fillRatio = var_224_10
			end

			local var_224_11 = 0
			local var_224_12 = 0.125

			if var_224_11 < arg_221_1.time_ and arg_221_1.time_ <= var_224_11 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_13 = arg_221_1:FormatText(StoryNameCfg[37].name)

				arg_221_1.leftNameTxt_.text = var_224_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_14 = arg_221_1:GetWordFromCfg(110152055)
				local var_224_15 = arg_221_1:FormatText(var_224_14.content)

				arg_221_1.text_.text = var_224_15

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_16 = 5
				local var_224_17 = utf8.len(var_224_15)
				local var_224_18 = var_224_16 <= 0 and var_224_12 or var_224_12 * (var_224_17 / var_224_16)

				if var_224_18 > 0 and var_224_12 < var_224_18 then
					arg_221_1.talkMaxDuration = var_224_18

					if var_224_18 + var_224_11 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_18 + var_224_11
					end
				end

				arg_221_1.text_.text = var_224_15
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152055", "story_v_out_110152.awb") ~= 0 then
					local var_224_19 = manager.audio:GetVoiceLength("story_v_out_110152", "110152055", "story_v_out_110152.awb") / 1000

					if var_224_19 + var_224_11 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_19 + var_224_11
					end

					if var_224_14.prefab_name ~= "" and arg_221_1.actors_[var_224_14.prefab_name] ~= nil then
						local var_224_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_14.prefab_name].transform, "story_v_out_110152", "110152055", "story_v_out_110152.awb")

						arg_221_1:RecordAudio("110152055", var_224_20)
						arg_221_1:RecordAudio("110152055", var_224_20)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_110152", "110152055", "story_v_out_110152.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_110152", "110152055", "story_v_out_110152.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_21 = math.max(var_224_12, arg_221_1.talkMaxDuration)

			if var_224_11 <= arg_221_1.time_ and arg_221_1.time_ < var_224_11 + var_224_21 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_11) / var_224_21

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_11 + var_224_21 and arg_221_1.time_ < var_224_11 + var_224_21 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play110152056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 110152056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play110152057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1111ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1111ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(0, 100, 0)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1111ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0, 100, 0)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = arg_225_1.actors_["1011ui_story"].transform
			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 then
				arg_225_1.var_.moveOldPos1011ui_story = var_228_9.localPosition
			end

			local var_228_11 = 0.001

			if var_228_10 <= arg_225_1.time_ and arg_225_1.time_ < var_228_10 + var_228_11 then
				local var_228_12 = (arg_225_1.time_ - var_228_10) / var_228_11
				local var_228_13 = Vector3.New(0, 100, 0)

				var_228_9.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1011ui_story, var_228_13, var_228_12)

				local var_228_14 = manager.ui.mainCamera.transform.position - var_228_9.position

				var_228_9.forward = Vector3.New(var_228_14.x, var_228_14.y, var_228_14.z)

				local var_228_15 = var_228_9.localEulerAngles

				var_228_15.z = 0
				var_228_15.x = 0
				var_228_9.localEulerAngles = var_228_15
			end

			if arg_225_1.time_ >= var_228_10 + var_228_11 and arg_225_1.time_ < var_228_10 + var_228_11 + arg_228_0 then
				var_228_9.localPosition = Vector3.New(0, 100, 0)

				local var_228_16 = manager.ui.mainCamera.transform.position - var_228_9.position

				var_228_9.forward = Vector3.New(var_228_16.x, var_228_16.y, var_228_16.z)

				local var_228_17 = var_228_9.localEulerAngles

				var_228_17.z = 0
				var_228_17.x = 0
				var_228_9.localEulerAngles = var_228_17
			end

			local var_228_18 = 0
			local var_228_19 = 0.825

			if var_228_18 < arg_225_1.time_ and arg_225_1.time_ <= var_228_18 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_20 = arg_225_1:GetWordFromCfg(110152056)
				local var_228_21 = arg_225_1:FormatText(var_228_20.content)

				arg_225_1.text_.text = var_228_21

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_22 = 33
				local var_228_23 = utf8.len(var_228_21)
				local var_228_24 = var_228_22 <= 0 and var_228_19 or var_228_19 * (var_228_23 / var_228_22)

				if var_228_24 > 0 and var_228_19 < var_228_24 then
					arg_225_1.talkMaxDuration = var_228_24

					if var_228_24 + var_228_18 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_24 + var_228_18
					end
				end

				arg_225_1.text_.text = var_228_21
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_25 = math.max(var_228_19, arg_225_1.talkMaxDuration)

			if var_228_18 <= arg_225_1.time_ and arg_225_1.time_ < var_228_18 + var_228_25 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_18) / var_228_25

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_18 + var_228_25 and arg_225_1.time_ < var_228_18 + var_228_25 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play110152057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 110152057
		arg_229_1.duration_ = 4.466

		local var_229_0 = {
			ja = 3.733,
			ko = 3.8,
			zh = 4.466,
			en = 4.233
		}
		local var_229_1 = manager.audio:GetLocalizationFlag()

		if var_229_0[var_229_1] ~= nil then
			arg_229_1.duration_ = var_229_0[var_229_1]
		end

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play110152058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_232_1 = arg_229_1.actors_["1011ui_story"].transform
			local var_232_2 = 0

			if var_232_2 < arg_229_1.time_ and arg_229_1.time_ <= var_232_2 + arg_232_0 then
				arg_229_1.var_.moveOldPos1011ui_story = var_232_1.localPosition
			end

			local var_232_3 = 0.001

			if var_232_2 <= arg_229_1.time_ and arg_229_1.time_ < var_232_2 + var_232_3 then
				local var_232_4 = (arg_229_1.time_ - var_232_2) / var_232_3
				local var_232_5 = Vector3.New(0, -0.71, -6)

				var_232_1.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1011ui_story, var_232_5, var_232_4)

				local var_232_6 = manager.ui.mainCamera.transform.position - var_232_1.position

				var_232_1.forward = Vector3.New(var_232_6.x, var_232_6.y, var_232_6.z)

				local var_232_7 = var_232_1.localEulerAngles

				var_232_7.z = 0
				var_232_7.x = 0
				var_232_1.localEulerAngles = var_232_7
			end

			if arg_229_1.time_ >= var_232_2 + var_232_3 and arg_229_1.time_ < var_232_2 + var_232_3 + arg_232_0 then
				var_232_1.localPosition = Vector3.New(0, -0.71, -6)

				local var_232_8 = manager.ui.mainCamera.transform.position - var_232_1.position

				var_232_1.forward = Vector3.New(var_232_8.x, var_232_8.y, var_232_8.z)

				local var_232_9 = var_232_1.localEulerAngles

				var_232_9.z = 0
				var_232_9.x = 0
				var_232_1.localEulerAngles = var_232_9
			end

			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 then
				arg_229_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_232_11 = arg_229_1.actors_["1011ui_story"]
			local var_232_12 = 0

			if var_232_12 < arg_229_1.time_ and arg_229_1.time_ <= var_232_12 + arg_232_0 and arg_229_1.var_.characterEffect1011ui_story == nil then
				arg_229_1.var_.characterEffect1011ui_story = var_232_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_13 = 0.2

			if var_232_12 <= arg_229_1.time_ and arg_229_1.time_ < var_232_12 + var_232_13 then
				local var_232_14 = (arg_229_1.time_ - var_232_12) / var_232_13

				if arg_229_1.var_.characterEffect1011ui_story then
					arg_229_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_12 + var_232_13 and arg_229_1.time_ < var_232_12 + var_232_13 + arg_232_0 and arg_229_1.var_.characterEffect1011ui_story then
				arg_229_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_232_15 = 0
			local var_232_16 = 0.425

			if var_232_15 < arg_229_1.time_ and arg_229_1.time_ <= var_232_15 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_17 = arg_229_1:FormatText(StoryNameCfg[37].name)

				arg_229_1.leftNameTxt_.text = var_232_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_18 = arg_229_1:GetWordFromCfg(110152057)
				local var_232_19 = arg_229_1:FormatText(var_232_18.content)

				arg_229_1.text_.text = var_232_19

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_20 = 17
				local var_232_21 = utf8.len(var_232_19)
				local var_232_22 = var_232_20 <= 0 and var_232_16 or var_232_16 * (var_232_21 / var_232_20)

				if var_232_22 > 0 and var_232_16 < var_232_22 then
					arg_229_1.talkMaxDuration = var_232_22

					if var_232_22 + var_232_15 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_22 + var_232_15
					end
				end

				arg_229_1.text_.text = var_232_19
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152057", "story_v_out_110152.awb") ~= 0 then
					local var_232_23 = manager.audio:GetVoiceLength("story_v_out_110152", "110152057", "story_v_out_110152.awb") / 1000

					if var_232_23 + var_232_15 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_23 + var_232_15
					end

					if var_232_18.prefab_name ~= "" and arg_229_1.actors_[var_232_18.prefab_name] ~= nil then
						local var_232_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_18.prefab_name].transform, "story_v_out_110152", "110152057", "story_v_out_110152.awb")

						arg_229_1:RecordAudio("110152057", var_232_24)
						arg_229_1:RecordAudio("110152057", var_232_24)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_110152", "110152057", "story_v_out_110152.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_110152", "110152057", "story_v_out_110152.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_25 = math.max(var_232_16, arg_229_1.talkMaxDuration)

			if var_232_15 <= arg_229_1.time_ and arg_229_1.time_ < var_232_15 + var_232_25 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_15) / var_232_25

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_15 + var_232_25 and arg_229_1.time_ < var_232_15 + var_232_25 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play110152058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 110152058
		arg_233_1.duration_ = 14.733

		local var_233_0 = {
			ja = 14.733,
			ko = 8.8,
			zh = 9.366,
			en = 11.033
		}
		local var_233_1 = manager.audio:GetLocalizationFlag()

		if var_233_0[var_233_1] ~= nil then
			arg_233_1.duration_ = var_233_0[var_233_1]
		end

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play110152059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_236_1 = 0
			local var_236_2 = 0.675

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_3 = arg_233_1:FormatText(StoryNameCfg[37].name)

				arg_233_1.leftNameTxt_.text = var_236_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_4 = arg_233_1:GetWordFromCfg(110152058)
				local var_236_5 = arg_233_1:FormatText(var_236_4.content)

				arg_233_1.text_.text = var_236_5

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_6 = 27
				local var_236_7 = utf8.len(var_236_5)
				local var_236_8 = var_236_6 <= 0 and var_236_2 or var_236_2 * (var_236_7 / var_236_6)

				if var_236_8 > 0 and var_236_2 < var_236_8 then
					arg_233_1.talkMaxDuration = var_236_8

					if var_236_8 + var_236_1 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_8 + var_236_1
					end
				end

				arg_233_1.text_.text = var_236_5
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152058", "story_v_out_110152.awb") ~= 0 then
					local var_236_9 = manager.audio:GetVoiceLength("story_v_out_110152", "110152058", "story_v_out_110152.awb") / 1000

					if var_236_9 + var_236_1 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_9 + var_236_1
					end

					if var_236_4.prefab_name ~= "" and arg_233_1.actors_[var_236_4.prefab_name] ~= nil then
						local var_236_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_4.prefab_name].transform, "story_v_out_110152", "110152058", "story_v_out_110152.awb")

						arg_233_1:RecordAudio("110152058", var_236_10)
						arg_233_1:RecordAudio("110152058", var_236_10)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_110152", "110152058", "story_v_out_110152.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_110152", "110152058", "story_v_out_110152.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_11 = math.max(var_236_2, arg_233_1.talkMaxDuration)

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_11 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_1) / var_236_11

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_1 + var_236_11 and arg_233_1.time_ < var_236_1 + var_236_11 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play110152059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 110152059
		arg_237_1.duration_ = 2.966

		local var_237_0 = {
			ja = 2.7,
			ko = 2.966,
			zh = 2.333,
			en = 2.633
		}
		local var_237_1 = manager.audio:GetLocalizationFlag()

		if var_237_0[var_237_1] ~= nil then
			arg_237_1.duration_ = var_237_0[var_237_1]
		end

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play110152060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1011ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1011ui_story == nil then
				arg_237_1.var_.characterEffect1011ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1011ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1011ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1011ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1011ui_story.fillRatio = var_240_5
			end

			local var_240_6 = 0
			local var_240_7 = 0.25

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_8 = arg_237_1:FormatText(StoryNameCfg[6].name)

				arg_237_1.leftNameTxt_.text = var_240_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, true)
				arg_237_1.iconController_:SetSelectedState("hero")

				arg_237_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1184")

				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_9 = arg_237_1:GetWordFromCfg(110152059)
				local var_240_10 = arg_237_1:FormatText(var_240_9.content)

				arg_237_1.text_.text = var_240_10

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_11 = 10
				local var_240_12 = utf8.len(var_240_10)
				local var_240_13 = var_240_11 <= 0 and var_240_7 or var_240_7 * (var_240_12 / var_240_11)

				if var_240_13 > 0 and var_240_7 < var_240_13 then
					arg_237_1.talkMaxDuration = var_240_13

					if var_240_13 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_13 + var_240_6
					end
				end

				arg_237_1.text_.text = var_240_10
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152059", "story_v_out_110152.awb") ~= 0 then
					local var_240_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152059", "story_v_out_110152.awb") / 1000

					if var_240_14 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_14 + var_240_6
					end

					if var_240_9.prefab_name ~= "" and arg_237_1.actors_[var_240_9.prefab_name] ~= nil then
						local var_240_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_9.prefab_name].transform, "story_v_out_110152", "110152059", "story_v_out_110152.awb")

						arg_237_1:RecordAudio("110152059", var_240_15)
						arg_237_1:RecordAudio("110152059", var_240_15)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_110152", "110152059", "story_v_out_110152.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_110152", "110152059", "story_v_out_110152.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_16 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_16 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_16

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_16 and arg_237_1.time_ < var_240_6 + var_240_16 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play110152060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 110152060
		arg_241_1.duration_ = 3.233

		local var_241_0 = {
			ja = 2.9,
			ko = 3.233,
			zh = 2.433,
			en = 2.3
		}
		local var_241_1 = manager.audio:GetLocalizationFlag()

		if var_241_0[var_241_1] ~= nil then
			arg_241_1.duration_ = var_241_0[var_241_1]
		end

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play110152061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 0.225

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_2 = arg_241_1:FormatText(StoryNameCfg[13].name)

				arg_241_1.leftNameTxt_.text = var_244_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, true)
				arg_241_1.iconController_:SetSelectedState("hero")

				arg_241_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1019")

				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_3 = arg_241_1:GetWordFromCfg(110152060)
				local var_244_4 = arg_241_1:FormatText(var_244_3.content)

				arg_241_1.text_.text = var_244_4

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_5 = 9
				local var_244_6 = utf8.len(var_244_4)
				local var_244_7 = var_244_5 <= 0 and var_244_1 or var_244_1 * (var_244_6 / var_244_5)

				if var_244_7 > 0 and var_244_1 < var_244_7 then
					arg_241_1.talkMaxDuration = var_244_7

					if var_244_7 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_7 + var_244_0
					end
				end

				arg_241_1.text_.text = var_244_4
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152060", "story_v_out_110152.awb") ~= 0 then
					local var_244_8 = manager.audio:GetVoiceLength("story_v_out_110152", "110152060", "story_v_out_110152.awb") / 1000

					if var_244_8 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_8 + var_244_0
					end

					if var_244_3.prefab_name ~= "" and arg_241_1.actors_[var_244_3.prefab_name] ~= nil then
						local var_244_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_3.prefab_name].transform, "story_v_out_110152", "110152060", "story_v_out_110152.awb")

						arg_241_1:RecordAudio("110152060", var_244_9)
						arg_241_1:RecordAudio("110152060", var_244_9)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_110152", "110152060", "story_v_out_110152.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_110152", "110152060", "story_v_out_110152.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_10 = math.max(var_244_1, arg_241_1.talkMaxDuration)

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_10 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_0) / var_244_10

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_0 + var_244_10 and arg_241_1.time_ < var_244_0 + var_244_10 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play110152061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 110152061
		arg_245_1.duration_ = 9.866

		local var_245_0 = {
			ja = 8.133,
			ko = 5.433,
			zh = 9.866,
			en = 6.066
		}
		local var_245_1 = manager.audio:GetLocalizationFlag()

		if var_245_0[var_245_1] ~= nil then
			arg_245_1.duration_ = var_245_0[var_245_1]
		end

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play110152062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action462")
			end

			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_248_2 = arg_245_1.actors_["1011ui_story"]
			local var_248_3 = 0

			if var_248_3 < arg_245_1.time_ and arg_245_1.time_ <= var_248_3 + arg_248_0 and arg_245_1.var_.characterEffect1011ui_story == nil then
				arg_245_1.var_.characterEffect1011ui_story = var_248_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_4 = 0.2

			if var_248_3 <= arg_245_1.time_ and arg_245_1.time_ < var_248_3 + var_248_4 then
				local var_248_5 = (arg_245_1.time_ - var_248_3) / var_248_4

				if arg_245_1.var_.characterEffect1011ui_story then
					arg_245_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_3 + var_248_4 and arg_245_1.time_ < var_248_3 + var_248_4 + arg_248_0 and arg_245_1.var_.characterEffect1011ui_story then
				arg_245_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_248_6 = 0
			local var_248_7 = 0.45

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_8 = arg_245_1:FormatText(StoryNameCfg[37].name)

				arg_245_1.leftNameTxt_.text = var_248_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_9 = arg_245_1:GetWordFromCfg(110152061)
				local var_248_10 = arg_245_1:FormatText(var_248_9.content)

				arg_245_1.text_.text = var_248_10

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_11 = 18
				local var_248_12 = utf8.len(var_248_10)
				local var_248_13 = var_248_11 <= 0 and var_248_7 or var_248_7 * (var_248_12 / var_248_11)

				if var_248_13 > 0 and var_248_7 < var_248_13 then
					arg_245_1.talkMaxDuration = var_248_13

					if var_248_13 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_13 + var_248_6
					end
				end

				arg_245_1.text_.text = var_248_10
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152061", "story_v_out_110152.awb") ~= 0 then
					local var_248_14 = manager.audio:GetVoiceLength("story_v_out_110152", "110152061", "story_v_out_110152.awb") / 1000

					if var_248_14 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_14 + var_248_6
					end

					if var_248_9.prefab_name ~= "" and arg_245_1.actors_[var_248_9.prefab_name] ~= nil then
						local var_248_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_9.prefab_name].transform, "story_v_out_110152", "110152061", "story_v_out_110152.awb")

						arg_245_1:RecordAudio("110152061", var_248_15)
						arg_245_1:RecordAudio("110152061", var_248_15)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_110152", "110152061", "story_v_out_110152.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_110152", "110152061", "story_v_out_110152.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_16 = math.max(var_248_7, arg_245_1.talkMaxDuration)

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_16 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_6) / var_248_16

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_6 + var_248_16 and arg_245_1.time_ < var_248_6 + var_248_16 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play110152062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 110152062
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play110152063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1011ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect1011ui_story == nil then
				arg_249_1.var_.characterEffect1011ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.2

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect1011ui_story then
					local var_252_4 = Mathf.Lerp(0, 0.5, var_252_3)

					arg_249_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_249_1.var_.characterEffect1011ui_story.fillRatio = var_252_4
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1011ui_story then
				local var_252_5 = 0.5

				arg_249_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_249_1.var_.characterEffect1011ui_story.fillRatio = var_252_5
			end

			local var_252_6 = 0
			local var_252_7 = 0.125

			if var_252_6 < arg_249_1.time_ and arg_249_1.time_ <= var_252_6 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_8 = arg_249_1:FormatText(StoryNameCfg[7].name)

				arg_249_1.leftNameTxt_.text = var_252_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_9 = arg_249_1:GetWordFromCfg(110152062)
				local var_252_10 = arg_249_1:FormatText(var_252_9.content)

				arg_249_1.text_.text = var_252_10

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_11 = 5
				local var_252_12 = utf8.len(var_252_10)
				local var_252_13 = var_252_11 <= 0 and var_252_7 or var_252_7 * (var_252_12 / var_252_11)

				if var_252_13 > 0 and var_252_7 < var_252_13 then
					arg_249_1.talkMaxDuration = var_252_13

					if var_252_13 + var_252_6 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_13 + var_252_6
					end
				end

				arg_249_1.text_.text = var_252_10
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_14 = math.max(var_252_7, arg_249_1.talkMaxDuration)

			if var_252_6 <= arg_249_1.time_ and arg_249_1.time_ < var_252_6 + var_252_14 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_6) / var_252_14

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_6 + var_252_14 and arg_249_1.time_ < var_252_6 + var_252_14 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play110152063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 110152063
		arg_253_1.duration_ = 6.333

		local var_253_0 = {
			ja = 6.333,
			ko = 3.8,
			zh = 4.7,
			en = 3.166
		}
		local var_253_1 = manager.audio:GetLocalizationFlag()

		if var_253_0[var_253_1] ~= nil then
			arg_253_1.duration_ = var_253_0[var_253_1]
		end

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
			arg_253_1.auto_ = false
		end

		function arg_253_1.playNext_(arg_255_0)
			arg_253_1.onStoryFinished_()
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_256_1 = arg_253_1.actors_["1011ui_story"]
			local var_256_2 = 0

			if var_256_2 < arg_253_1.time_ and arg_253_1.time_ <= var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1011ui_story == nil then
				arg_253_1.var_.characterEffect1011ui_story = var_256_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_3 = 0.2

			if var_256_2 <= arg_253_1.time_ and arg_253_1.time_ < var_256_2 + var_256_3 then
				local var_256_4 = (arg_253_1.time_ - var_256_2) / var_256_3

				if arg_253_1.var_.characterEffect1011ui_story then
					arg_253_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_2 + var_256_3 and arg_253_1.time_ < var_256_2 + var_256_3 + arg_256_0 and arg_253_1.var_.characterEffect1011ui_story then
				arg_253_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_256_5 = 0
			local var_256_6 = 0.25

			if var_256_5 < arg_253_1.time_ and arg_253_1.time_ <= var_256_5 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_7 = arg_253_1:FormatText(StoryNameCfg[37].name)

				arg_253_1.leftNameTxt_.text = var_256_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_8 = arg_253_1:GetWordFromCfg(110152063)
				local var_256_9 = arg_253_1:FormatText(var_256_8.content)

				arg_253_1.text_.text = var_256_9

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_10 = 10
				local var_256_11 = utf8.len(var_256_9)
				local var_256_12 = var_256_10 <= 0 and var_256_6 or var_256_6 * (var_256_11 / var_256_10)

				if var_256_12 > 0 and var_256_6 < var_256_12 then
					arg_253_1.talkMaxDuration = var_256_12

					if var_256_12 + var_256_5 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_12 + var_256_5
					end
				end

				arg_253_1.text_.text = var_256_9
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110152", "110152063", "story_v_out_110152.awb") ~= 0 then
					local var_256_13 = manager.audio:GetVoiceLength("story_v_out_110152", "110152063", "story_v_out_110152.awb") / 1000

					if var_256_13 + var_256_5 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_13 + var_256_5
					end

					if var_256_8.prefab_name ~= "" and arg_253_1.actors_[var_256_8.prefab_name] ~= nil then
						local var_256_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_8.prefab_name].transform, "story_v_out_110152", "110152063", "story_v_out_110152.awb")

						arg_253_1:RecordAudio("110152063", var_256_14)
						arg_253_1:RecordAudio("110152063", var_256_14)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_110152", "110152063", "story_v_out_110152.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_110152", "110152063", "story_v_out_110152.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_15 = math.max(var_256_6, arg_253_1.talkMaxDuration)

			if var_256_5 <= arg_253_1.time_ and arg_253_1.time_ < var_256_5 + var_256_15 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_5) / var_256_15

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_5 + var_256_15 and arg_253_1.time_ < var_256_5 + var_256_15 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B12a"
	},
	voices = {
		"story_v_out_110152.awb"
	}
}
