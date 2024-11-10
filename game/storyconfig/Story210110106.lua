return {
	Play1101106001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1101106001
		arg_1_1.duration_ = 5.6

		local var_1_0 = {
			zh = 5.266,
			ja = 5.6
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
				arg_1_0:Play1101106002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST19"

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
				local var_4_5 = arg_1_1.bgs_.ST19

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
					if iter_4_0 ~= "ST19" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_17 = 2

			if var_4_16 <= arg_1_1.time_ and arg_1_1.time_ < var_4_16 + var_4_17 then
				local var_4_18 = (arg_1_1.time_ - var_4_16) / var_4_17
				local var_4_19 = Color.New(0, 0, 0)

				var_4_19.a = Mathf.Lerp(1, 0, var_4_18)
				arg_1_1.mask_.color = var_4_19
			end

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				local var_4_20 = Color.New(0, 0, 0)
				local var_4_21 = 0

				arg_1_1.mask_.enabled = false
				var_4_20.a = var_4_21
				arg_1_1.mask_.color = var_4_20
			end

			local var_4_22 = "1111ui_story"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("Char/" .. var_4_22), arg_1_1.stage_.transform)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_22] = var_4_23

				local var_4_24 = var_4_23:GetComponentInChildren(typeof(CharacterEffect))

				var_4_24.enabled = true

				local var_4_25 = GameObjectTools.GetOrAddComponent(var_4_23, typeof(DynamicBoneHelper))

				if var_4_25 then
					var_4_25:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_24.transform, false)

				arg_1_1.var_[var_4_22 .. "Animator"] = var_4_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_22 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_22 .. "LipSync"] = var_4_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_26 = arg_1_1.actors_["1111ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1111ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(-0.7, -0.83, -6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1111ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(-0.7, -0.83, -6)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1111ui_story"]
			local var_4_36 = 2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1111ui_story == nil then
				arg_1_1.var_.characterEffect1111ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.200000002980232

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1111ui_story then
					arg_1_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1111ui_story then
				arg_1_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_4_39 = 2

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action1_1")
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_4_41 = "1011ui_story"

			if arg_1_1.actors_[var_4_41] == nil then
				local var_4_42 = Object.Instantiate(Asset.Load("Char/" .. var_4_41), arg_1_1.stage_.transform)

				var_4_42.name = var_4_41
				var_4_42.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_41] = var_4_42

				local var_4_43 = var_4_42:GetComponentInChildren(typeof(CharacterEffect))

				var_4_43.enabled = true

				local var_4_44 = GameObjectTools.GetOrAddComponent(var_4_42, typeof(DynamicBoneHelper))

				if var_4_44 then
					var_4_44:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_43.transform, false)

				arg_1_1.var_[var_4_41 .. "Animator"] = var_4_43.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_41 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_41 .. "LipSync"] = var_4_43.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_45 = arg_1_1.actors_["1011ui_story"].transform
			local var_4_46 = 2

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				arg_1_1.var_.moveOldPos1011ui_story = var_4_45.localPosition
			end

			local var_4_47 = 0.001

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				local var_4_48 = (arg_1_1.time_ - var_4_46) / var_4_47
				local var_4_49 = Vector3.New(0.7, -0.71, -6)

				var_4_45.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1011ui_story, var_4_49, var_4_48)

				local var_4_50 = manager.ui.mainCamera.transform.position - var_4_45.position

				var_4_45.forward = Vector3.New(var_4_50.x, var_4_50.y, var_4_50.z)

				local var_4_51 = var_4_45.localEulerAngles

				var_4_51.z = 0
				var_4_51.x = 0
				var_4_45.localEulerAngles = var_4_51
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 then
				var_4_45.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_4_52 = manager.ui.mainCamera.transform.position - var_4_45.position

				var_4_45.forward = Vector3.New(var_4_52.x, var_4_52.y, var_4_52.z)

				local var_4_53 = var_4_45.localEulerAngles

				var_4_53.z = 0
				var_4_53.x = 0
				var_4_45.localEulerAngles = var_4_53
			end

			local var_4_54 = arg_1_1.actors_["1011ui_story"]
			local var_4_55 = 2

			if var_4_55 < arg_1_1.time_ and arg_1_1.time_ <= var_4_55 + arg_4_0 and arg_1_1.var_.characterEffect1011ui_story == nil then
				arg_1_1.var_.characterEffect1011ui_story = var_4_54:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_56 = 0.200000002980232

			if var_4_55 <= arg_1_1.time_ and arg_1_1.time_ < var_4_55 + var_4_56 then
				local var_4_57 = (arg_1_1.time_ - var_4_55) / var_4_56

				if arg_1_1.var_.characterEffect1011ui_story then
					local var_4_58 = Mathf.Lerp(0, 0.5, var_4_57)

					arg_1_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_1_1.var_.characterEffect1011ui_story.fillRatio = var_4_58
				end
			end

			if arg_1_1.time_ >= var_4_55 + var_4_56 and arg_1_1.time_ < var_4_55 + var_4_56 + arg_4_0 and arg_1_1.var_.characterEffect1011ui_story then
				local var_4_59 = 0.5

				arg_1_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_1_1.var_.characterEffect1011ui_story.fillRatio = var_4_59
			end

			local var_4_60 = 0
			local var_4_61 = 0.3

			if var_4_60 < arg_1_1.time_ and arg_1_1.time_ <= var_4_60 + arg_4_0 then
				local var_4_62 = "play"
				local var_4_63 = "music"

				arg_1_1:AudioAction(var_4_62, var_4_63, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_64 = 0.533333333333333
			local var_4_65 = 1

			if var_4_64 < arg_1_1.time_ and arg_1_1.time_ <= var_4_64 + arg_4_0 then
				local var_4_66 = "play"
				local var_4_67 = "music"

				arg_1_1:AudioAction(var_4_66, var_4_67, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")
			end

			local var_4_68 = 2

			if var_4_68 < arg_1_1.time_ and arg_1_1.time_ <= var_4_68 + arg_4_0 then
				arg_1_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_4_69 = 2

			if var_4_69 < arg_1_1.time_ and arg_1_1.time_ <= var_4_69 + arg_4_0 then
				arg_1_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_70 = 2
			local var_4_71 = 0.3

			if var_4_70 < arg_1_1.time_ and arg_1_1.time_ <= var_4_70 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_72 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_72:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_72:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_72:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_73 = arg_1_1:FormatText(StoryNameCfg[67].name)

				arg_1_1.leftNameTxt_.text = var_4_73

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_74 = arg_1_1:GetWordFromCfg(1101106001)
				local var_4_75 = arg_1_1:FormatText(var_4_74.content)

				arg_1_1.text_.text = var_4_75

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_76 = 12
				local var_4_77 = utf8.len(var_4_75)
				local var_4_78 = var_4_76 <= 0 and var_4_71 or var_4_71 * (var_4_77 / var_4_76)

				if var_4_78 > 0 and var_4_71 < var_4_78 then
					arg_1_1.talkMaxDuration = var_4_78
					var_4_70 = var_4_70 + 0.3

					if var_4_78 + var_4_70 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_78 + var_4_70
					end
				end

				arg_1_1.text_.text = var_4_75
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb") ~= 0 then
					local var_4_79 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb") / 1000

					if var_4_79 + var_4_70 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_79 + var_4_70
					end

					if var_4_74.prefab_name ~= "" and arg_1_1.actors_[var_4_74.prefab_name] ~= nil then
						local var_4_80 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_74.prefab_name].transform, "story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb")

						arg_1_1:RecordAudio("1101106001", var_4_80)
						arg_1_1:RecordAudio("1101106001", var_4_80)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106001", "story_v_side_new_1101106.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_81 = var_4_70 + 0.3
			local var_4_82 = math.max(var_4_71, arg_1_1.talkMaxDuration)

			if var_4_81 <= arg_1_1.time_ and arg_1_1.time_ < var_4_81 + var_4_82 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_81) / var_4_82

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_81 + var_4_82 and arg_1_1.time_ < var_4_81 + var_4_82 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 1101106002
		arg_7_1.duration_ = 5.966

		local var_7_0 = {
			zh = 5.033,
			ja = 5.966
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
				arg_7_0:Play1101106003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action8_1")
			end

			local var_10_1 = 0
			local var_10_2 = 0.65

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_3 = arg_7_1:FormatText(StoryNameCfg[67].name)

				arg_7_1.leftNameTxt_.text = var_10_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_4 = arg_7_1:GetWordFromCfg(1101106002)
				local var_10_5 = arg_7_1:FormatText(var_10_4.content)

				arg_7_1.text_.text = var_10_5

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_6 = 26
				local var_10_7 = utf8.len(var_10_5)
				local var_10_8 = var_10_6 <= 0 and var_10_2 or var_10_2 * (var_10_7 / var_10_6)

				if var_10_8 > 0 and var_10_2 < var_10_8 then
					arg_7_1.talkMaxDuration = var_10_8

					if var_10_8 + var_10_1 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_1
					end
				end

				arg_7_1.text_.text = var_10_5
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb") ~= 0 then
					local var_10_9 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb") / 1000

					if var_10_9 + var_10_1 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_9 + var_10_1
					end

					if var_10_4.prefab_name ~= "" and arg_7_1.actors_[var_10_4.prefab_name] ~= nil then
						local var_10_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_4.prefab_name].transform, "story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb")

						arg_7_1:RecordAudio("1101106002", var_10_10)
						arg_7_1:RecordAudio("1101106002", var_10_10)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106002", "story_v_side_new_1101106.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_11 = math.max(var_10_2, arg_7_1.talkMaxDuration)

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_11 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_1) / var_10_11

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_1 + var_10_11 and arg_7_1.time_ < var_10_1 + var_10_11 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 1101106003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play1101106004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["1111ui_story"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.characterEffect1111ui_story == nil then
				arg_11_1.var_.characterEffect1111ui_story = var_14_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_14_2 = 0.200000002980232

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.characterEffect1111ui_story then
					local var_14_4 = Mathf.Lerp(0, 0.5, var_14_3)

					arg_11_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_11_1.var_.characterEffect1111ui_story.fillRatio = var_14_4
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.characterEffect1111ui_story then
				local var_14_5 = 0.5

				arg_11_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_11_1.var_.characterEffect1111ui_story.fillRatio = var_14_5
			end

			local var_14_6 = 0
			local var_14_7 = 0.85

			if var_14_6 < arg_11_1.time_ and arg_11_1.time_ <= var_14_6 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_8 = arg_11_1:GetWordFromCfg(1101106003)
				local var_14_9 = arg_11_1:FormatText(var_14_8.content)

				arg_11_1.text_.text = var_14_9

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_10 = 34
				local var_14_11 = utf8.len(var_14_9)
				local var_14_12 = var_14_10 <= 0 and var_14_7 or var_14_7 * (var_14_11 / var_14_10)

				if var_14_12 > 0 and var_14_7 < var_14_12 then
					arg_11_1.talkMaxDuration = var_14_12

					if var_14_12 + var_14_6 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_12 + var_14_6
					end
				end

				arg_11_1.text_.text = var_14_9
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_13 = math.max(var_14_7, arg_11_1.talkMaxDuration)

			if var_14_6 <= arg_11_1.time_ and arg_11_1.time_ < var_14_6 + var_14_13 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_6) / var_14_13

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_6 + var_14_13 and arg_11_1.time_ < var_14_6 + var_14_13 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 1101106004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play1101106005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.75

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[7].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(1101106004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 30
				local var_18_6 = utf8.len(var_18_4)
				local var_18_7 = var_18_5 <= 0 and var_18_1 or var_18_1 * (var_18_6 / var_18_5)

				if var_18_7 > 0 and var_18_1 < var_18_7 then
					arg_15_1.talkMaxDuration = var_18_7

					if var_18_7 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_7 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_4
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_8 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_8 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_8

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_8 and arg_15_1.time_ < var_18_0 + var_18_8 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 1101106005
		arg_19_1.duration_ = 2.966

		local var_19_0 = {
			zh = 1.999999999999,
			ja = 2.966
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
				arg_19_0:Play1101106006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1111ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1111ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(-0.7, -0.83, -6)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1111ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(-0.7, -0.83, -6)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = arg_19_1.actors_["1111ui_story"]
			local var_22_10 = 0

			if var_22_10 < arg_19_1.time_ and arg_19_1.time_ <= var_22_10 + arg_22_0 and arg_19_1.var_.characterEffect1111ui_story == nil then
				arg_19_1.var_.characterEffect1111ui_story = var_22_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_11 = 0.200000002980232

			if var_22_10 <= arg_19_1.time_ and arg_19_1.time_ < var_22_10 + var_22_11 then
				local var_22_12 = (arg_19_1.time_ - var_22_10) / var_22_11

				if arg_19_1.var_.characterEffect1111ui_story then
					arg_19_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_10 + var_22_11 and arg_19_1.time_ < var_22_10 + var_22_11 + arg_22_0 and arg_19_1.var_.characterEffect1111ui_story then
				arg_19_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_22_13 = 0

			if var_22_13 < arg_19_1.time_ and arg_19_1.time_ <= var_22_13 + arg_22_0 then
				arg_19_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action486")
			end

			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 then
				arg_19_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_22_15 = 0
			local var_22_16 = 0.125

			if var_22_15 < arg_19_1.time_ and arg_19_1.time_ <= var_22_15 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_17 = arg_19_1:FormatText(StoryNameCfg[67].name)

				arg_19_1.leftNameTxt_.text = var_22_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_18 = arg_19_1:GetWordFromCfg(1101106005)
				local var_22_19 = arg_19_1:FormatText(var_22_18.content)

				arg_19_1.text_.text = var_22_19

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_20 = 5
				local var_22_21 = utf8.len(var_22_19)
				local var_22_22 = var_22_20 <= 0 and var_22_16 or var_22_16 * (var_22_21 / var_22_20)

				if var_22_22 > 0 and var_22_16 < var_22_22 then
					arg_19_1.talkMaxDuration = var_22_22

					if var_22_22 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_22 + var_22_15
					end
				end

				arg_19_1.text_.text = var_22_19
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb") ~= 0 then
					local var_22_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb") / 1000

					if var_22_23 + var_22_15 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_23 + var_22_15
					end

					if var_22_18.prefab_name ~= "" and arg_19_1.actors_[var_22_18.prefab_name] ~= nil then
						local var_22_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_18.prefab_name].transform, "story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb")

						arg_19_1:RecordAudio("1101106005", var_22_24)
						arg_19_1:RecordAudio("1101106005", var_22_24)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106005", "story_v_side_new_1101106.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_25 = math.max(var_22_16, arg_19_1.talkMaxDuration)

			if var_22_15 <= arg_19_1.time_ and arg_19_1.time_ < var_22_15 + var_22_25 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_15) / var_22_25

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_15 + var_22_25 and arg_19_1.time_ < var_22_15 + var_22_25 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 1101106006
		arg_23_1.duration_ = 6.566

		local var_23_0 = {
			zh = 6.566,
			ja = 5.333
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
				arg_23_0:Play1101106007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1011ui_story"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos1011ui_story = var_26_0.localPosition
			end

			local var_26_2 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2
				local var_26_4 = Vector3.New(0.7, -0.71, -6)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos1011ui_story, var_26_4, var_26_3)

				local var_26_5 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_5.x, var_26_5.y, var_26_5.z)

				local var_26_6 = var_26_0.localEulerAngles

				var_26_6.z = 0
				var_26_6.x = 0
				var_26_0.localEulerAngles = var_26_6
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_26_7 = manager.ui.mainCamera.transform.position - var_26_0.position

				var_26_0.forward = Vector3.New(var_26_7.x, var_26_7.y, var_26_7.z)

				local var_26_8 = var_26_0.localEulerAngles

				var_26_8.z = 0
				var_26_8.x = 0
				var_26_0.localEulerAngles = var_26_8
			end

			local var_26_9 = arg_23_1.actors_["1011ui_story"]
			local var_26_10 = 0

			if var_26_10 < arg_23_1.time_ and arg_23_1.time_ <= var_26_10 + arg_26_0 and arg_23_1.var_.characterEffect1011ui_story == nil then
				arg_23_1.var_.characterEffect1011ui_story = var_26_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_11 = 0.200000002980232

			if var_26_10 <= arg_23_1.time_ and arg_23_1.time_ < var_26_10 + var_26_11 then
				local var_26_12 = (arg_23_1.time_ - var_26_10) / var_26_11

				if arg_23_1.var_.characterEffect1011ui_story then
					arg_23_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_23_1.time_ >= var_26_10 + var_26_11 and arg_23_1.time_ < var_26_10 + var_26_11 + arg_26_0 and arg_23_1.var_.characterEffect1011ui_story then
				arg_23_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_26_13 = 0

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_26_14 = 0

			if var_26_14 < arg_23_1.time_ and arg_23_1.time_ <= var_26_14 + arg_26_0 then
				arg_23_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_26_15 = arg_23_1.actors_["1111ui_story"]
			local var_26_16 = 0

			if var_26_16 < arg_23_1.time_ and arg_23_1.time_ <= var_26_16 + arg_26_0 and arg_23_1.var_.characterEffect1111ui_story == nil then
				arg_23_1.var_.characterEffect1111ui_story = var_26_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_17 = 0.200000002980232

			if var_26_16 <= arg_23_1.time_ and arg_23_1.time_ < var_26_16 + var_26_17 then
				local var_26_18 = (arg_23_1.time_ - var_26_16) / var_26_17

				if arg_23_1.var_.characterEffect1111ui_story then
					local var_26_19 = Mathf.Lerp(0, 0.5, var_26_18)

					arg_23_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1111ui_story.fillRatio = var_26_19
				end
			end

			if arg_23_1.time_ >= var_26_16 + var_26_17 and arg_23_1.time_ < var_26_16 + var_26_17 + arg_26_0 and arg_23_1.var_.characterEffect1111ui_story then
				local var_26_20 = 0.5

				arg_23_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1111ui_story.fillRatio = var_26_20
			end

			local var_26_21 = 0
			local var_26_22 = 0.7

			if var_26_21 < arg_23_1.time_ and arg_23_1.time_ <= var_26_21 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_23 = arg_23_1:FormatText(StoryNameCfg[37].name)

				arg_23_1.leftNameTxt_.text = var_26_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_24 = arg_23_1:GetWordFromCfg(1101106006)
				local var_26_25 = arg_23_1:FormatText(var_26_24.content)

				arg_23_1.text_.text = var_26_25

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_26 = 28
				local var_26_27 = utf8.len(var_26_25)
				local var_26_28 = var_26_26 <= 0 and var_26_22 or var_26_22 * (var_26_27 / var_26_26)

				if var_26_28 > 0 and var_26_22 < var_26_28 then
					arg_23_1.talkMaxDuration = var_26_28

					if var_26_28 + var_26_21 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_28 + var_26_21
					end
				end

				arg_23_1.text_.text = var_26_25
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb") ~= 0 then
					local var_26_29 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb") / 1000

					if var_26_29 + var_26_21 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_29 + var_26_21
					end

					if var_26_24.prefab_name ~= "" and arg_23_1.actors_[var_26_24.prefab_name] ~= nil then
						local var_26_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_24.prefab_name].transform, "story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb")

						arg_23_1:RecordAudio("1101106006", var_26_30)
						arg_23_1:RecordAudio("1101106006", var_26_30)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106006", "story_v_side_new_1101106.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_31 = math.max(var_26_22, arg_23_1.talkMaxDuration)

			if var_26_21 <= arg_23_1.time_ and arg_23_1.time_ < var_26_21 + var_26_31 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_21) / var_26_31

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_21 + var_26_31 and arg_23_1.time_ < var_26_21 + var_26_31 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 1101106007
		arg_27_1.duration_ = 2.833

		local var_27_0 = {
			zh = 2.833,
			ja = 1.999999999999
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
				arg_27_0:Play1101106008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["1111ui_story"].transform
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 then
				arg_27_1.var_.moveOldPos1111ui_story = var_30_0.localPosition
			end

			local var_30_2 = 0.001

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2
				local var_30_4 = Vector3.New(-0.7, -0.83, -6)

				var_30_0.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1111ui_story, var_30_4, var_30_3)

				local var_30_5 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_5.x, var_30_5.y, var_30_5.z)

				local var_30_6 = var_30_0.localEulerAngles

				var_30_6.z = 0
				var_30_6.x = 0
				var_30_0.localEulerAngles = var_30_6
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 then
				var_30_0.localPosition = Vector3.New(-0.7, -0.83, -6)

				local var_30_7 = manager.ui.mainCamera.transform.position - var_30_0.position

				var_30_0.forward = Vector3.New(var_30_7.x, var_30_7.y, var_30_7.z)

				local var_30_8 = var_30_0.localEulerAngles

				var_30_8.z = 0
				var_30_8.x = 0
				var_30_0.localEulerAngles = var_30_8
			end

			local var_30_9 = arg_27_1.actors_["1111ui_story"]
			local var_30_10 = 0

			if var_30_10 < arg_27_1.time_ and arg_27_1.time_ <= var_30_10 + arg_30_0 and arg_27_1.var_.characterEffect1111ui_story == nil then
				arg_27_1.var_.characterEffect1111ui_story = var_30_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_11 = 0.200000002980232

			if var_30_10 <= arg_27_1.time_ and arg_27_1.time_ < var_30_10 + var_30_11 then
				local var_30_12 = (arg_27_1.time_ - var_30_10) / var_30_11

				if arg_27_1.var_.characterEffect1111ui_story then
					arg_27_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_10 + var_30_11 and arg_27_1.time_ < var_30_10 + var_30_11 + arg_30_0 and arg_27_1.var_.characterEffect1111ui_story then
				arg_27_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_30_13 = 0

			if var_30_13 < arg_27_1.time_ and arg_27_1.time_ <= var_30_13 + arg_30_0 then
				arg_27_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_2")
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_30_15 = arg_27_1.actors_["1011ui_story"]
			local var_30_16 = 0

			if var_30_16 < arg_27_1.time_ and arg_27_1.time_ <= var_30_16 + arg_30_0 and arg_27_1.var_.characterEffect1011ui_story == nil then
				arg_27_1.var_.characterEffect1011ui_story = var_30_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_17 = 0.200000002980232

			if var_30_16 <= arg_27_1.time_ and arg_27_1.time_ < var_30_16 + var_30_17 then
				local var_30_18 = (arg_27_1.time_ - var_30_16) / var_30_17

				if arg_27_1.var_.characterEffect1011ui_story then
					local var_30_19 = Mathf.Lerp(0, 0.5, var_30_18)

					arg_27_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1011ui_story.fillRatio = var_30_19
				end
			end

			if arg_27_1.time_ >= var_30_16 + var_30_17 and arg_27_1.time_ < var_30_16 + var_30_17 + arg_30_0 and arg_27_1.var_.characterEffect1011ui_story then
				local var_30_20 = 0.5

				arg_27_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1011ui_story.fillRatio = var_30_20
			end

			local var_30_21 = 0
			local var_30_22 = 0.275

			if var_30_21 < arg_27_1.time_ and arg_27_1.time_ <= var_30_21 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_23 = arg_27_1:FormatText(StoryNameCfg[67].name)

				arg_27_1.leftNameTxt_.text = var_30_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_24 = arg_27_1:GetWordFromCfg(1101106007)
				local var_30_25 = arg_27_1:FormatText(var_30_24.content)

				arg_27_1.text_.text = var_30_25

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_26 = 11
				local var_30_27 = utf8.len(var_30_25)
				local var_30_28 = var_30_26 <= 0 and var_30_22 or var_30_22 * (var_30_27 / var_30_26)

				if var_30_28 > 0 and var_30_22 < var_30_28 then
					arg_27_1.talkMaxDuration = var_30_28

					if var_30_28 + var_30_21 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_28 + var_30_21
					end
				end

				arg_27_1.text_.text = var_30_25
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb") ~= 0 then
					local var_30_29 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb") / 1000

					if var_30_29 + var_30_21 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_29 + var_30_21
					end

					if var_30_24.prefab_name ~= "" and arg_27_1.actors_[var_30_24.prefab_name] ~= nil then
						local var_30_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_24.prefab_name].transform, "story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb")

						arg_27_1:RecordAudio("1101106007", var_30_30)
						arg_27_1:RecordAudio("1101106007", var_30_30)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106007", "story_v_side_new_1101106.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_31 = math.max(var_30_22, arg_27_1.talkMaxDuration)

			if var_30_21 <= arg_27_1.time_ and arg_27_1.time_ < var_30_21 + var_30_31 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_21) / var_30_31

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_21 + var_30_31 and arg_27_1.time_ < var_30_21 + var_30_31 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 1101106008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play1101106009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1111ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1111ui_story == nil then
				arg_31_1.var_.characterEffect1111ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1111ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1111ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1111ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1111ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.525

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_8 = arg_31_1:FormatText(StoryNameCfg[7].name)

				arg_31_1.leftNameTxt_.text = var_34_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_9 = arg_31_1:GetWordFromCfg(1101106008)
				local var_34_10 = arg_31_1:FormatText(var_34_9.content)

				arg_31_1.text_.text = var_34_10

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_11 = 21
				local var_34_12 = utf8.len(var_34_10)
				local var_34_13 = var_34_11 <= 0 and var_34_7 or var_34_7 * (var_34_12 / var_34_11)

				if var_34_13 > 0 and var_34_7 < var_34_13 then
					arg_31_1.talkMaxDuration = var_34_13

					if var_34_13 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_13 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_10
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_14 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_14 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_14

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_14 and arg_31_1.time_ < var_34_6 + var_34_14 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 1101106009
		arg_35_1.duration_ = 7.166

		local var_35_0 = {
			zh = 4.9,
			ja = 7.166
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
				arg_35_0:Play1101106010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1111ui_story"].transform
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.var_.moveOldPos1111ui_story = var_38_0.localPosition
			end

			local var_38_2 = 0.001

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2
				local var_38_4 = Vector3.New(-0.7, -0.83, -6)

				var_38_0.localPosition = Vector3.Lerp(arg_35_1.var_.moveOldPos1111ui_story, var_38_4, var_38_3)

				local var_38_5 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_5.x, var_38_5.y, var_38_5.z)

				local var_38_6 = var_38_0.localEulerAngles

				var_38_6.z = 0
				var_38_6.x = 0
				var_38_0.localEulerAngles = var_38_6
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 then
				var_38_0.localPosition = Vector3.New(-0.7, -0.83, -6)

				local var_38_7 = manager.ui.mainCamera.transform.position - var_38_0.position

				var_38_0.forward = Vector3.New(var_38_7.x, var_38_7.y, var_38_7.z)

				local var_38_8 = var_38_0.localEulerAngles

				var_38_8.z = 0
				var_38_8.x = 0
				var_38_0.localEulerAngles = var_38_8
			end

			local var_38_9 = arg_35_1.actors_["1111ui_story"]
			local var_38_10 = 0

			if var_38_10 < arg_35_1.time_ and arg_35_1.time_ <= var_38_10 + arg_38_0 and arg_35_1.var_.characterEffect1111ui_story == nil then
				arg_35_1.var_.characterEffect1111ui_story = var_38_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_11 = 0.200000002980232

			if var_38_10 <= arg_35_1.time_ and arg_35_1.time_ < var_38_10 + var_38_11 then
				local var_38_12 = (arg_35_1.time_ - var_38_10) / var_38_11

				if arg_35_1.var_.characterEffect1111ui_story then
					arg_35_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_10 + var_38_11 and arg_35_1.time_ < var_38_10 + var_38_11 + arg_38_0 and arg_35_1.var_.characterEffect1111ui_story then
				arg_35_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				arg_35_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_1")
			end

			local var_38_14 = 0

			if var_38_14 < arg_35_1.time_ and arg_35_1.time_ <= var_38_14 + arg_38_0 then
				arg_35_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_38_15 = 0
			local var_38_16 = 0.775

			if var_38_15 < arg_35_1.time_ and arg_35_1.time_ <= var_38_15 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_17 = arg_35_1:FormatText(StoryNameCfg[67].name)

				arg_35_1.leftNameTxt_.text = var_38_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_18 = arg_35_1:GetWordFromCfg(1101106009)
				local var_38_19 = arg_35_1:FormatText(var_38_18.content)

				arg_35_1.text_.text = var_38_19

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_20 = 18
				local var_38_21 = utf8.len(var_38_19)
				local var_38_22 = var_38_20 <= 0 and var_38_16 or var_38_16 * (var_38_21 / var_38_20)

				if var_38_22 > 0 and var_38_16 < var_38_22 then
					arg_35_1.talkMaxDuration = var_38_22

					if var_38_22 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_22 + var_38_15
					end
				end

				arg_35_1.text_.text = var_38_19
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb") ~= 0 then
					local var_38_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb") / 1000

					if var_38_23 + var_38_15 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_23 + var_38_15
					end

					if var_38_18.prefab_name ~= "" and arg_35_1.actors_[var_38_18.prefab_name] ~= nil then
						local var_38_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_18.prefab_name].transform, "story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb")

						arg_35_1:RecordAudio("1101106009", var_38_24)
						arg_35_1:RecordAudio("1101106009", var_38_24)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106009", "story_v_side_new_1101106.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_25 = math.max(var_38_16, arg_35_1.talkMaxDuration)

			if var_38_15 <= arg_35_1.time_ and arg_35_1.time_ < var_38_15 + var_38_25 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_15) / var_38_25

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_15 + var_38_25 and arg_35_1.time_ < var_38_15 + var_38_25 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 1101106010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play1101106011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1111ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1111ui_story == nil then
				arg_39_1.var_.characterEffect1111ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1111ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1111ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1111ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1111ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.475

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, false)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_8 = arg_39_1:GetWordFromCfg(1101106010)
				local var_42_9 = arg_39_1:FormatText(var_42_8.content)

				arg_39_1.text_.text = var_42_9

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_10 = 19
				local var_42_11 = utf8.len(var_42_9)
				local var_42_12 = var_42_10 <= 0 and var_42_7 or var_42_7 * (var_42_11 / var_42_10)

				if var_42_12 > 0 and var_42_7 < var_42_12 then
					arg_39_1.talkMaxDuration = var_42_12

					if var_42_12 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_12 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_9
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_13 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_13 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_13

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_13 and arg_39_1.time_ < var_42_6 + var_42_13 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 1101106011
		arg_43_1.duration_ = 1.999999999999

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play1101106012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1111ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1111ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(-0.7, -0.83, -6)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1111ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-0.7, -0.83, -6)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1111ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1111ui_story == nil then
				arg_43_1.var_.characterEffect1111ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1111ui_story then
					local var_46_13 = Mathf.Lerp(0, 0.5, var_46_12)

					arg_43_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1111ui_story.fillRatio = var_46_13
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1111ui_story then
				local var_46_14 = 0.5

				arg_43_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1111ui_story.fillRatio = var_46_14
			end

			local var_46_15 = arg_43_1.actors_["1011ui_story"].transform
			local var_46_16 = 0

			if var_46_16 < arg_43_1.time_ and arg_43_1.time_ <= var_46_16 + arg_46_0 then
				arg_43_1.var_.moveOldPos1011ui_story = var_46_15.localPosition
			end

			local var_46_17 = 0.001

			if var_46_16 <= arg_43_1.time_ and arg_43_1.time_ < var_46_16 + var_46_17 then
				local var_46_18 = (arg_43_1.time_ - var_46_16) / var_46_17
				local var_46_19 = Vector3.New(0.7, -0.71, -6)

				var_46_15.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1011ui_story, var_46_19, var_46_18)

				local var_46_20 = manager.ui.mainCamera.transform.position - var_46_15.position

				var_46_15.forward = Vector3.New(var_46_20.x, var_46_20.y, var_46_20.z)

				local var_46_21 = var_46_15.localEulerAngles

				var_46_21.z = 0
				var_46_21.x = 0
				var_46_15.localEulerAngles = var_46_21
			end

			if arg_43_1.time_ >= var_46_16 + var_46_17 and arg_43_1.time_ < var_46_16 + var_46_17 + arg_46_0 then
				var_46_15.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_46_22 = manager.ui.mainCamera.transform.position - var_46_15.position

				var_46_15.forward = Vector3.New(var_46_22.x, var_46_22.y, var_46_22.z)

				local var_46_23 = var_46_15.localEulerAngles

				var_46_23.z = 0
				var_46_23.x = 0
				var_46_15.localEulerAngles = var_46_23
			end

			local var_46_24 = arg_43_1.actors_["1011ui_story"]
			local var_46_25 = 0

			if var_46_25 < arg_43_1.time_ and arg_43_1.time_ <= var_46_25 + arg_46_0 and arg_43_1.var_.characterEffect1011ui_story == nil then
				arg_43_1.var_.characterEffect1011ui_story = var_46_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_26 = 0.200000002980232

			if var_46_25 <= arg_43_1.time_ and arg_43_1.time_ < var_46_25 + var_46_26 then
				local var_46_27 = (arg_43_1.time_ - var_46_25) / var_46_26

				if arg_43_1.var_.characterEffect1011ui_story then
					arg_43_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_25 + var_46_26 and arg_43_1.time_ < var_46_25 + var_46_26 + arg_46_0 and arg_43_1.var_.characterEffect1011ui_story then
				arg_43_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_46_28 = 0

			if var_46_28 < arg_43_1.time_ and arg_43_1.time_ <= var_46_28 + arg_46_0 then
				arg_43_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_2")
			end

			local var_46_29 = 0

			if var_46_29 < arg_43_1.time_ and arg_43_1.time_ <= var_46_29 + arg_46_0 then
				arg_43_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_46_30 = 0

			if var_46_30 < arg_43_1.time_ and arg_43_1.time_ <= var_46_30 + arg_46_0 then
				arg_43_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_46_31 = 0
			local var_46_32 = 0.075

			if var_46_31 < arg_43_1.time_ and arg_43_1.time_ <= var_46_31 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_33 = arg_43_1:FormatText(StoryNameCfg[37].name)

				arg_43_1.leftNameTxt_.text = var_46_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_34 = arg_43_1:GetWordFromCfg(1101106011)
				local var_46_35 = arg_43_1:FormatText(var_46_34.content)

				arg_43_1.text_.text = var_46_35

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_36 = 3
				local var_46_37 = utf8.len(var_46_35)
				local var_46_38 = var_46_36 <= 0 and var_46_32 or var_46_32 * (var_46_37 / var_46_36)

				if var_46_38 > 0 and var_46_32 < var_46_38 then
					arg_43_1.talkMaxDuration = var_46_38

					if var_46_38 + var_46_31 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_38 + var_46_31
					end
				end

				arg_43_1.text_.text = var_46_35
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb") ~= 0 then
					local var_46_39 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb") / 1000

					if var_46_39 + var_46_31 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_39 + var_46_31
					end

					if var_46_34.prefab_name ~= "" and arg_43_1.actors_[var_46_34.prefab_name] ~= nil then
						local var_46_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_34.prefab_name].transform, "story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb")

						arg_43_1:RecordAudio("1101106011", var_46_40)
						arg_43_1:RecordAudio("1101106011", var_46_40)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106011", "story_v_side_new_1101106.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_41 = math.max(var_46_32, arg_43_1.talkMaxDuration)

			if var_46_31 <= arg_43_1.time_ and arg_43_1.time_ < var_46_31 + var_46_41 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_31) / var_46_41

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_31 + var_46_41 and arg_43_1.time_ < var_46_31 + var_46_41 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 1101106012
		arg_47_1.duration_ = 2.6

		local var_47_0 = {
			zh = 1.999999999999,
			ja = 2.6
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
				arg_47_0:Play1101106013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1111ui_story"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos1111ui_story = var_50_0.localPosition
			end

			local var_50_2 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2
				local var_50_4 = Vector3.New(-0.7, -0.83, -6)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1111ui_story, var_50_4, var_50_3)

				local var_50_5 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_5.x, var_50_5.y, var_50_5.z)

				local var_50_6 = var_50_0.localEulerAngles

				var_50_6.z = 0
				var_50_6.x = 0
				var_50_0.localEulerAngles = var_50_6
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(-0.7, -0.83, -6)

				local var_50_7 = manager.ui.mainCamera.transform.position - var_50_0.position

				var_50_0.forward = Vector3.New(var_50_7.x, var_50_7.y, var_50_7.z)

				local var_50_8 = var_50_0.localEulerAngles

				var_50_8.z = 0
				var_50_8.x = 0
				var_50_0.localEulerAngles = var_50_8
			end

			local var_50_9 = arg_47_1.actors_["1111ui_story"]
			local var_50_10 = 0

			if var_50_10 < arg_47_1.time_ and arg_47_1.time_ <= var_50_10 + arg_50_0 and arg_47_1.var_.characterEffect1111ui_story == nil then
				arg_47_1.var_.characterEffect1111ui_story = var_50_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_11 = 0.200000002980232

			if var_50_10 <= arg_47_1.time_ and arg_47_1.time_ < var_50_10 + var_50_11 then
				local var_50_12 = (arg_47_1.time_ - var_50_10) / var_50_11

				if arg_47_1.var_.characterEffect1111ui_story then
					arg_47_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_10 + var_50_11 and arg_47_1.time_ < var_50_10 + var_50_11 + arg_50_0 and arg_47_1.var_.characterEffect1111ui_story then
				arg_47_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_50_13 = 0

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				arg_47_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_50_14 = arg_47_1.actors_["1011ui_story"]
			local var_50_15 = 0

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect1011ui_story == nil then
				arg_47_1.var_.characterEffect1011ui_story = var_50_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_16 = 0.200000002980232

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_16 then
				local var_50_17 = (arg_47_1.time_ - var_50_15) / var_50_16

				if arg_47_1.var_.characterEffect1011ui_story then
					local var_50_18 = Mathf.Lerp(0, 0.5, var_50_17)

					arg_47_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1011ui_story.fillRatio = var_50_18
				end
			end

			if arg_47_1.time_ >= var_50_15 + var_50_16 and arg_47_1.time_ < var_50_15 + var_50_16 + arg_50_0 and arg_47_1.var_.characterEffect1011ui_story then
				local var_50_19 = 0.5

				arg_47_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1011ui_story.fillRatio = var_50_19
			end

			local var_50_20 = 0
			local var_50_21 = 0.125

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_22 = arg_47_1:FormatText(StoryNameCfg[67].name)

				arg_47_1.leftNameTxt_.text = var_50_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_23 = arg_47_1:GetWordFromCfg(1101106012)
				local var_50_24 = arg_47_1:FormatText(var_50_23.content)

				arg_47_1.text_.text = var_50_24

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_25 = 5
				local var_50_26 = utf8.len(var_50_24)
				local var_50_27 = var_50_25 <= 0 and var_50_21 or var_50_21 * (var_50_26 / var_50_25)

				if var_50_27 > 0 and var_50_21 < var_50_27 then
					arg_47_1.talkMaxDuration = var_50_27

					if var_50_27 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_20
					end
				end

				arg_47_1.text_.text = var_50_24
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb") ~= 0 then
					local var_50_28 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb") / 1000

					if var_50_28 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_28 + var_50_20
					end

					if var_50_23.prefab_name ~= "" and arg_47_1.actors_[var_50_23.prefab_name] ~= nil then
						local var_50_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_23.prefab_name].transform, "story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb")

						arg_47_1:RecordAudio("1101106012", var_50_29)
						arg_47_1:RecordAudio("1101106012", var_50_29)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106012", "story_v_side_new_1101106.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_30 = math.max(var_50_21, arg_47_1.talkMaxDuration)

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_30 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_20) / var_50_30

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_20 + var_50_30 and arg_47_1.time_ < var_50_20 + var_50_30 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 1101106013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play1101106014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1011ui_story"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos1011ui_story = var_54_0.localPosition
			end

			local var_54_2 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2
				local var_54_4 = Vector3.New(0.7, -0.71, -6)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1011ui_story, var_54_4, var_54_3)

				local var_54_5 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_5.x, var_54_5.y, var_54_5.z)

				local var_54_6 = var_54_0.localEulerAngles

				var_54_6.z = 0
				var_54_6.x = 0
				var_54_0.localEulerAngles = var_54_6
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_54_7 = manager.ui.mainCamera.transform.position - var_54_0.position

				var_54_0.forward = Vector3.New(var_54_7.x, var_54_7.y, var_54_7.z)

				local var_54_8 = var_54_0.localEulerAngles

				var_54_8.z = 0
				var_54_8.x = 0
				var_54_0.localEulerAngles = var_54_8
			end

			local var_54_9 = arg_51_1.actors_["1111ui_story"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.characterEffect1111ui_story == nil then
				arg_51_1.var_.characterEffect1111ui_story = var_54_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_11 = 0.200000002980232

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.characterEffect1111ui_story then
					local var_54_13 = Mathf.Lerp(0, 0.5, var_54_12)

					arg_51_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_51_1.var_.characterEffect1111ui_story.fillRatio = var_54_13
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.characterEffect1111ui_story then
				local var_54_14 = 0.5

				arg_51_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_51_1.var_.characterEffect1111ui_story.fillRatio = var_54_14
			end

			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 then
				arg_51_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_54_16 = 0
			local var_54_17 = 0.25

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_18 = arg_51_1:FormatText(StoryNameCfg[7].name)

				arg_51_1.leftNameTxt_.text = var_54_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_19 = arg_51_1:GetWordFromCfg(1101106013)
				local var_54_20 = arg_51_1:FormatText(var_54_19.content)

				arg_51_1.text_.text = var_54_20

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_21 = 10
				local var_54_22 = utf8.len(var_54_20)
				local var_54_23 = var_54_21 <= 0 and var_54_17 or var_54_17 * (var_54_22 / var_54_21)

				if var_54_23 > 0 and var_54_17 < var_54_23 then
					arg_51_1.talkMaxDuration = var_54_23

					if var_54_23 + var_54_16 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_23 + var_54_16
					end
				end

				arg_51_1.text_.text = var_54_20
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_24 = math.max(var_54_17, arg_51_1.talkMaxDuration)

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_24 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_16) / var_54_24

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_16 + var_54_24 and arg_51_1.time_ < var_54_16 + var_54_24 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 1101106014
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play1101106015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_2")
			end

			local var_58_2 = 0
			local var_58_3 = 0.925

			if var_58_2 < arg_55_1.time_ and arg_55_1.time_ <= var_58_2 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_4 = arg_55_1:GetWordFromCfg(1101106014)
				local var_58_5 = arg_55_1:FormatText(var_58_4.content)

				arg_55_1.text_.text = var_58_5

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_6 = 37
				local var_58_7 = utf8.len(var_58_5)
				local var_58_8 = var_58_6 <= 0 and var_58_3 or var_58_3 * (var_58_7 / var_58_6)

				if var_58_8 > 0 and var_58_3 < var_58_8 then
					arg_55_1.talkMaxDuration = var_58_8

					if var_58_8 + var_58_2 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_2
					end
				end

				arg_55_1.text_.text = var_58_5
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_9 = math.max(var_58_3, arg_55_1.talkMaxDuration)

			if var_58_2 <= arg_55_1.time_ and arg_55_1.time_ < var_58_2 + var_58_9 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_2) / var_58_9

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_2 + var_58_9 and arg_55_1.time_ < var_58_2 + var_58_9 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 1101106015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play1101106016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.55

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_2 = arg_59_1:GetWordFromCfg(1101106015)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 22
				local var_62_5 = utf8.len(var_62_3)
				local var_62_6 = var_62_4 <= 0 and var_62_1 or var_62_1 * (var_62_5 / var_62_4)

				if var_62_6 > 0 and var_62_1 < var_62_6 then
					arg_59_1.talkMaxDuration = var_62_6

					if var_62_6 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_6 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_3
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_7 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_7 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_7

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_7 and arg_59_1.time_ < var_62_0 + var_62_7 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 1101106016
		arg_63_1.duration_ = 4.349999999999

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play1101106017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = "STblack"

			if arg_63_1.bgs_[var_66_0] == nil then
				local var_66_1 = Object.Instantiate(arg_63_1.paintGo_)

				var_66_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_66_0)
				var_66_1.name = var_66_0
				var_66_1.transform.parent = arg_63_1.stage_.transform
				var_66_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_63_1.bgs_[var_66_0] = var_66_1
			end

			local var_66_2 = 2

			if var_66_2 < arg_63_1.time_ and arg_63_1.time_ <= var_66_2 + arg_66_0 then
				local var_66_3 = manager.ui.mainCamera.transform.localPosition
				local var_66_4 = Vector3.New(0, 0, 10) + Vector3.New(var_66_3.x, var_66_3.y, 0)
				local var_66_5 = arg_63_1.bgs_.STblack

				var_66_5.transform.localPosition = var_66_4
				var_66_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_66_6 = var_66_5:GetComponent("SpriteRenderer")

				if var_66_6 and var_66_6.sprite then
					local var_66_7 = (var_66_5.transform.localPosition - var_66_3).z
					local var_66_8 = manager.ui.mainCameraCom_
					local var_66_9 = 2 * var_66_7 * Mathf.Tan(var_66_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_66_10 = var_66_9 * var_66_8.aspect
					local var_66_11 = var_66_6.sprite.bounds.size.x
					local var_66_12 = var_66_6.sprite.bounds.size.y
					local var_66_13 = var_66_10 / var_66_11
					local var_66_14 = var_66_9 / var_66_12
					local var_66_15 = var_66_14 < var_66_13 and var_66_13 or var_66_14

					var_66_5.transform.localScale = Vector3.New(var_66_15, var_66_15, 0)
				end

				for iter_66_0, iter_66_1 in pairs(arg_63_1.bgs_) do
					if iter_66_0 ~= "STblack" then
						iter_66_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_66_16 = 0

			if var_66_16 < arg_63_1.time_ and arg_63_1.time_ <= var_66_16 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_17 = 2

			if var_66_16 <= arg_63_1.time_ and arg_63_1.time_ < var_66_16 + var_66_17 then
				local var_66_18 = (arg_63_1.time_ - var_66_16) / var_66_17
				local var_66_19 = Color.New(0, 0, 0)

				var_66_19.a = Mathf.Lerp(0, 1, var_66_18)
				arg_63_1.mask_.color = var_66_19
			end

			if arg_63_1.time_ >= var_66_16 + var_66_17 and arg_63_1.time_ < var_66_16 + var_66_17 + arg_66_0 then
				local var_66_20 = Color.New(0, 0, 0)

				var_66_20.a = 1
				arg_63_1.mask_.color = var_66_20
			end

			local var_66_21 = 2

			if var_66_21 < arg_63_1.time_ and arg_63_1.time_ <= var_66_21 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_22 = 2

			if var_66_21 <= arg_63_1.time_ and arg_63_1.time_ < var_66_21 + var_66_22 then
				local var_66_23 = (arg_63_1.time_ - var_66_21) / var_66_22
				local var_66_24 = Color.New(0, 0, 0)

				var_66_24.a = Mathf.Lerp(1, 0, var_66_23)
				arg_63_1.mask_.color = var_66_24
			end

			if arg_63_1.time_ >= var_66_21 + var_66_22 and arg_63_1.time_ < var_66_21 + var_66_22 + arg_66_0 then
				local var_66_25 = Color.New(0, 0, 0)
				local var_66_26 = 0

				arg_63_1.mask_.enabled = false
				var_66_25.a = var_66_26
				arg_63_1.mask_.color = var_66_25
			end

			local var_66_27 = 2

			if var_66_27 < arg_63_1.time_ and arg_63_1.time_ <= var_66_27 + arg_66_0 then
				arg_63_1.fswbg_:SetActive(true)
				arg_63_1.dialog_:SetActive(false)

				arg_63_1.fswtw_.percent = 0

				local var_66_28 = arg_63_1:GetWordFromCfg(1101106016)
				local var_66_29 = arg_63_1:FormatText(var_66_28.content)

				arg_63_1.fswt_.text = var_66_29

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.fswt_)

				arg_63_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_63_1.fswtw_:SetDirty()

				arg_63_1.typewritterCharCountI18N = 0

				SetActive(arg_63_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_63_1:ShowNextGo(false)
			end

			local var_66_30 = 4.01666666666667

			if var_66_30 < arg_63_1.time_ and arg_63_1.time_ <= var_66_30 + arg_66_0 then
				arg_63_1.var_.oldValueTypewriter = arg_63_1.fswtw_.percent

				arg_63_1:ShowNextGo(false)
			end

			local var_66_31 = 5
			local var_66_32 = 0.333333333333333
			local var_66_33 = arg_63_1:GetWordFromCfg(1101106016)
			local var_66_34 = arg_63_1:FormatText(var_66_33.content)
			local var_66_35, var_66_36 = arg_63_1:GetPercentByPara(var_66_34, 1)

			if var_66_30 < arg_63_1.time_ and arg_63_1.time_ <= var_66_30 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				local var_66_37 = var_66_31 <= 0 and var_66_32 or var_66_32 * ((var_66_36 - arg_63_1.typewritterCharCountI18N) / var_66_31)

				if var_66_37 > 0 and var_66_32 < var_66_37 then
					arg_63_1.talkMaxDuration = var_66_37

					if var_66_37 + var_66_30 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_37 + var_66_30
					end
				end
			end

			local var_66_38 = 0.333333333333333
			local var_66_39 = math.max(var_66_38, arg_63_1.talkMaxDuration)

			if var_66_30 <= arg_63_1.time_ and arg_63_1.time_ < var_66_30 + var_66_39 then
				local var_66_40 = (arg_63_1.time_ - var_66_30) / var_66_39

				arg_63_1.fswtw_.percent = Mathf.Lerp(arg_63_1.var_.oldValueTypewriter, var_66_35, var_66_40)
				arg_63_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_63_1.fswtw_:SetDirty()
			end

			if arg_63_1.time_ >= var_66_30 + var_66_39 and arg_63_1.time_ < var_66_30 + var_66_39 + arg_66_0 then
				arg_63_1.fswtw_.percent = var_66_35

				arg_63_1.fswtw_:SetDirty()
				arg_63_1:ShowNextGo(true)

				arg_63_1.typewritterCharCountI18N = var_66_36
			end

			local var_66_41 = 4

			if var_66_41 < arg_63_1.time_ and arg_63_1.time_ <= var_66_41 + arg_66_0 then
				local var_66_42 = arg_63_1.fswbg_.transform:Find("textbox/adapt/content") or arg_63_1.fswbg_.transform:Find("textbox/content")
				local var_66_43 = var_66_42:GetComponent("Text")
				local var_66_44 = var_66_42:GetComponent("RectTransform")

				var_66_43.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_66_44.offsetMin = Vector2.New(0, 0)
				var_66_44.offsetMax = Vector2.New(0, 0)
			end

			local var_66_45 = arg_63_1.actors_["1111ui_story"].transform
			local var_66_46 = 2

			if var_66_46 < arg_63_1.time_ and arg_63_1.time_ <= var_66_46 + arg_66_0 then
				arg_63_1.var_.moveOldPos1111ui_story = var_66_45.localPosition
			end

			local var_66_47 = 0.001

			if var_66_46 <= arg_63_1.time_ and arg_63_1.time_ < var_66_46 + var_66_47 then
				local var_66_48 = (arg_63_1.time_ - var_66_46) / var_66_47
				local var_66_49 = Vector3.New(0, 100, 0)

				var_66_45.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1111ui_story, var_66_49, var_66_48)

				local var_66_50 = manager.ui.mainCamera.transform.position - var_66_45.position

				var_66_45.forward = Vector3.New(var_66_50.x, var_66_50.y, var_66_50.z)

				local var_66_51 = var_66_45.localEulerAngles

				var_66_51.z = 0
				var_66_51.x = 0
				var_66_45.localEulerAngles = var_66_51
			end

			if arg_63_1.time_ >= var_66_46 + var_66_47 and arg_63_1.time_ < var_66_46 + var_66_47 + arg_66_0 then
				var_66_45.localPosition = Vector3.New(0, 100, 0)

				local var_66_52 = manager.ui.mainCamera.transform.position - var_66_45.position

				var_66_45.forward = Vector3.New(var_66_52.x, var_66_52.y, var_66_52.z)

				local var_66_53 = var_66_45.localEulerAngles

				var_66_53.z = 0
				var_66_53.x = 0
				var_66_45.localEulerAngles = var_66_53
			end

			local var_66_54 = arg_63_1.actors_["1011ui_story"].transform
			local var_66_55 = 2

			if var_66_55 < arg_63_1.time_ and arg_63_1.time_ <= var_66_55 + arg_66_0 then
				arg_63_1.var_.moveOldPos1011ui_story = var_66_54.localPosition
			end

			local var_66_56 = 0.001

			if var_66_55 <= arg_63_1.time_ and arg_63_1.time_ < var_66_55 + var_66_56 then
				local var_66_57 = (arg_63_1.time_ - var_66_55) / var_66_56
				local var_66_58 = Vector3.New(0, 100, 0)

				var_66_54.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1011ui_story, var_66_58, var_66_57)

				local var_66_59 = manager.ui.mainCamera.transform.position - var_66_54.position

				var_66_54.forward = Vector3.New(var_66_59.x, var_66_59.y, var_66_59.z)

				local var_66_60 = var_66_54.localEulerAngles

				var_66_60.z = 0
				var_66_60.x = 0
				var_66_54.localEulerAngles = var_66_60
			end

			if arg_63_1.time_ >= var_66_55 + var_66_56 and arg_63_1.time_ < var_66_55 + var_66_56 + arg_66_0 then
				var_66_54.localPosition = Vector3.New(0, 100, 0)

				local var_66_61 = manager.ui.mainCamera.transform.position - var_66_54.position

				var_66_54.forward = Vector3.New(var_66_61.x, var_66_61.y, var_66_61.z)

				local var_66_62 = var_66_54.localEulerAngles

				var_66_62.z = 0
				var_66_62.x = 0
				var_66_54.localEulerAngles = var_66_62
			end
		end
	end,
	Play1101106017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 1101106017
		arg_67_1.duration_ = 6.833

		local var_67_0 = {
			zh = 5.933,
			ja = 6.833
		}
		local var_67_1 = manager.audio:GetLocalizationFlag()

		if var_67_0[var_67_1] ~= nil then
			arg_67_1.duration_ = var_67_0[var_67_1]
		end

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play1101106018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "ST18"

			if arg_67_1.bgs_[var_70_0] == nil then
				local var_70_1 = Object.Instantiate(arg_67_1.paintGo_)

				var_70_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_70_0)
				var_70_1.name = var_70_0
				var_70_1.transform.parent = arg_67_1.stage_.transform
				var_70_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.bgs_[var_70_0] = var_70_1
			end

			local var_70_2 = 0

			if var_70_2 < arg_67_1.time_ and arg_67_1.time_ <= var_70_2 + arg_70_0 then
				local var_70_3 = manager.ui.mainCamera.transform.localPosition
				local var_70_4 = Vector3.New(0, 0, 10) + Vector3.New(var_70_3.x, var_70_3.y, 0)
				local var_70_5 = arg_67_1.bgs_.ST18

				var_70_5.transform.localPosition = var_70_4
				var_70_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_70_6 = var_70_5:GetComponent("SpriteRenderer")

				if var_70_6 and var_70_6.sprite then
					local var_70_7 = (var_70_5.transform.localPosition - var_70_3).z
					local var_70_8 = manager.ui.mainCameraCom_
					local var_70_9 = 2 * var_70_7 * Mathf.Tan(var_70_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_70_10 = var_70_9 * var_70_8.aspect
					local var_70_11 = var_70_6.sprite.bounds.size.x
					local var_70_12 = var_70_6.sprite.bounds.size.y
					local var_70_13 = var_70_10 / var_70_11
					local var_70_14 = var_70_9 / var_70_12
					local var_70_15 = var_70_14 < var_70_13 and var_70_13 or var_70_14

					var_70_5.transform.localScale = Vector3.New(var_70_15, var_70_15, 0)
				end

				for iter_70_0, iter_70_1 in pairs(arg_67_1.bgs_) do
					if iter_70_0 ~= "ST18" then
						iter_70_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_70_16 = 0

			if var_70_16 < arg_67_1.time_ and arg_67_1.time_ <= var_70_16 + arg_70_0 then
				arg_67_1.mask_.enabled = true
				arg_67_1.mask_.raycastTarget = true

				arg_67_1:SetGaussion(false)
			end

			local var_70_17 = 2

			if var_70_16 <= arg_67_1.time_ and arg_67_1.time_ < var_70_16 + var_70_17 then
				local var_70_18 = (arg_67_1.time_ - var_70_16) / var_70_17
				local var_70_19 = Color.New(0, 0, 0)

				var_70_19.a = Mathf.Lerp(1, 0, var_70_18)
				arg_67_1.mask_.color = var_70_19
			end

			if arg_67_1.time_ >= var_70_16 + var_70_17 and arg_67_1.time_ < var_70_16 + var_70_17 + arg_70_0 then
				local var_70_20 = Color.New(0, 0, 0)
				local var_70_21 = 0

				arg_67_1.mask_.enabled = false
				var_70_20.a = var_70_21
				arg_67_1.mask_.color = var_70_20
			end

			local var_70_22 = "1033ui_story"

			if arg_67_1.actors_[var_70_22] == nil then
				local var_70_23 = Object.Instantiate(Asset.Load("Char/" .. var_70_22), arg_67_1.stage_.transform)

				var_70_23.name = var_70_22
				var_70_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.actors_[var_70_22] = var_70_23

				local var_70_24 = var_70_23:GetComponentInChildren(typeof(CharacterEffect))

				var_70_24.enabled = true

				local var_70_25 = GameObjectTools.GetOrAddComponent(var_70_23, typeof(DynamicBoneHelper))

				if var_70_25 then
					var_70_25:EnableDynamicBone(false)
				end

				arg_67_1:ShowWeapon(var_70_24.transform, false)

				arg_67_1.var_[var_70_22 .. "Animator"] = var_70_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_67_1.var_[var_70_22 .. "Animator"].applyRootMotion = true
				arg_67_1.var_[var_70_22 .. "LipSync"] = var_70_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_70_26 = arg_67_1.actors_["1033ui_story"].transform
			local var_70_27 = 2

			if var_70_27 < arg_67_1.time_ and arg_67_1.time_ <= var_70_27 + arg_70_0 then
				arg_67_1.var_.moveOldPos1033ui_story = var_70_26.localPosition
			end

			local var_70_28 = 0.001

			if var_70_27 <= arg_67_1.time_ and arg_67_1.time_ < var_70_27 + var_70_28 then
				local var_70_29 = (arg_67_1.time_ - var_70_27) / var_70_28
				local var_70_30 = Vector3.New(0, -0.9, -6.35)

				var_70_26.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1033ui_story, var_70_30, var_70_29)

				local var_70_31 = manager.ui.mainCamera.transform.position - var_70_26.position

				var_70_26.forward = Vector3.New(var_70_31.x, var_70_31.y, var_70_31.z)

				local var_70_32 = var_70_26.localEulerAngles

				var_70_32.z = 0
				var_70_32.x = 0
				var_70_26.localEulerAngles = var_70_32
			end

			if arg_67_1.time_ >= var_70_27 + var_70_28 and arg_67_1.time_ < var_70_27 + var_70_28 + arg_70_0 then
				var_70_26.localPosition = Vector3.New(0, -0.9, -6.35)

				local var_70_33 = manager.ui.mainCamera.transform.position - var_70_26.position

				var_70_26.forward = Vector3.New(var_70_33.x, var_70_33.y, var_70_33.z)

				local var_70_34 = var_70_26.localEulerAngles

				var_70_34.z = 0
				var_70_34.x = 0
				var_70_26.localEulerAngles = var_70_34
			end

			local var_70_35 = arg_67_1.actors_["1033ui_story"]
			local var_70_36 = 2

			if var_70_36 < arg_67_1.time_ and arg_67_1.time_ <= var_70_36 + arg_70_0 and arg_67_1.var_.characterEffect1033ui_story == nil then
				arg_67_1.var_.characterEffect1033ui_story = var_70_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_37 = 0.200000002980232

			if var_70_36 <= arg_67_1.time_ and arg_67_1.time_ < var_70_36 + var_70_37 then
				local var_70_38 = (arg_67_1.time_ - var_70_36) / var_70_37

				if arg_67_1.var_.characterEffect1033ui_story then
					arg_67_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_36 + var_70_37 and arg_67_1.time_ < var_70_36 + var_70_37 + arg_70_0 and arg_67_1.var_.characterEffect1033ui_story then
				arg_67_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_70_39 = 2

			if var_70_39 < arg_67_1.time_ and arg_67_1.time_ <= var_70_39 + arg_70_0 then
				arg_67_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033action/1033action3_1")
			end

			local var_70_40 = 2

			if var_70_40 < arg_67_1.time_ and arg_67_1.time_ <= var_70_40 + arg_70_0 then
				arg_67_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_70_41 = 0

			if var_70_41 < arg_67_1.time_ and arg_67_1.time_ <= var_70_41 + arg_70_0 then
				arg_67_1.fswbg_:SetActive(false)
				arg_67_1.dialog_:SetActive(false)
				arg_67_1:ShowNextGo(false)
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_42 = 2
			local var_70_43 = 0.475

			if var_70_42 < arg_67_1.time_ and arg_67_1.time_ <= var_70_42 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_44 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_44:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_45 = arg_67_1:FormatText(StoryNameCfg[236].name)

				arg_67_1.leftNameTxt_.text = var_70_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_46 = arg_67_1:GetWordFromCfg(1101106017)
				local var_70_47 = arg_67_1:FormatText(var_70_46.content)

				arg_67_1.text_.text = var_70_47

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_48 = 19
				local var_70_49 = utf8.len(var_70_47)
				local var_70_50 = var_70_48 <= 0 and var_70_43 or var_70_43 * (var_70_49 / var_70_48)

				if var_70_50 > 0 and var_70_43 < var_70_50 then
					arg_67_1.talkMaxDuration = var_70_50
					var_70_42 = var_70_42 + 0.3

					if var_70_50 + var_70_42 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_50 + var_70_42
					end
				end

				arg_67_1.text_.text = var_70_47
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb") ~= 0 then
					local var_70_51 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb") / 1000

					if var_70_51 + var_70_42 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_51 + var_70_42
					end

					if var_70_46.prefab_name ~= "" and arg_67_1.actors_[var_70_46.prefab_name] ~= nil then
						local var_70_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_46.prefab_name].transform, "story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb")

						arg_67_1:RecordAudio("1101106017", var_70_52)
						arg_67_1:RecordAudio("1101106017", var_70_52)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106017", "story_v_side_new_1101106.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_53 = var_70_42 + 0.3
			local var_70_54 = math.max(var_70_43, arg_67_1.talkMaxDuration)

			if var_70_53 <= arg_67_1.time_ and arg_67_1.time_ < var_70_53 + var_70_54 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_53) / var_70_54

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_53 + var_70_54 and arg_67_1.time_ < var_70_53 + var_70_54 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 1101106018
		arg_73_1.duration_ = 14.1

		local var_73_0 = {
			zh = 9.8,
			ja = 14.1
		}
		local var_73_1 = manager.audio:GetLocalizationFlag()

		if var_73_0[var_73_1] ~= nil then
			arg_73_1.duration_ = var_73_0[var_73_1]
		end

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play1101106019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 1.25

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[236].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(1101106018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 50
				local var_76_6 = utf8.len(var_76_4)
				local var_76_7 = var_76_5 <= 0 and var_76_1 or var_76_1 * (var_76_6 / var_76_5)

				if var_76_7 > 0 and var_76_1 < var_76_7 then
					arg_73_1.talkMaxDuration = var_76_7

					if var_76_7 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_7 + var_76_0
					end
				end

				arg_73_1.text_.text = var_76_4
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb")

						arg_73_1:RecordAudio("1101106018", var_76_9)
						arg_73_1:RecordAudio("1101106018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106018", "story_v_side_new_1101106.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_10 = math.max(var_76_1, arg_73_1.talkMaxDuration)

			if var_76_0 <= arg_73_1.time_ and arg_73_1.time_ < var_76_0 + var_76_10 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_0) / var_76_10

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_0 + var_76_10 and arg_73_1.time_ < var_76_0 + var_76_10 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 1101106019
		arg_77_1.duration_ = 12.533

		local var_77_0 = {
			zh = 12.533,
			ja = 9.5
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
				arg_77_0:Play1101106020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 1.65

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[236].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(1101106019)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 66
				local var_80_6 = utf8.len(var_80_4)
				local var_80_7 = var_80_5 <= 0 and var_80_1 or var_80_1 * (var_80_6 / var_80_5)

				if var_80_7 > 0 and var_80_1 < var_80_7 then
					arg_77_1.talkMaxDuration = var_80_7

					if var_80_7 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_7 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_4
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb") ~= 0 then
					local var_80_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb") / 1000

					if var_80_8 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_8 + var_80_0
					end

					if var_80_3.prefab_name ~= "" and arg_77_1.actors_[var_80_3.prefab_name] ~= nil then
						local var_80_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_3.prefab_name].transform, "story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb")

						arg_77_1:RecordAudio("1101106019", var_80_9)
						arg_77_1:RecordAudio("1101106019", var_80_9)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106019", "story_v_side_new_1101106.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_10 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_10 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_10

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_10 and arg_77_1.time_ < var_80_0 + var_80_10 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 1101106020
		arg_81_1.duration_ = 5

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play1101106021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1033ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1033ui_story == nil then
				arg_81_1.var_.characterEffect1033ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.200000002980232

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1033ui_story then
					local var_84_4 = Mathf.Lerp(0, 0.5, var_84_3)

					arg_81_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1033ui_story.fillRatio = var_84_4
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1033ui_story then
				local var_84_5 = 0.5

				arg_81_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1033ui_story.fillRatio = var_84_5
			end

			local var_84_6 = 0
			local var_84_7 = 0.6

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

				local var_84_9 = arg_81_1:GetWordFromCfg(1101106020)
				local var_84_10 = arg_81_1:FormatText(var_84_9.content)

				arg_81_1.text_.text = var_84_10

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_11 = 24
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
	Play1101106021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 1101106021
		arg_85_1.duration_ = 6.733

		local var_85_0 = {
			zh = 5.833,
			ja = 6.733
		}
		local var_85_1 = manager.audio:GetLocalizationFlag()

		if var_85_0[var_85_1] ~= nil then
			arg_85_1.duration_ = var_85_0[var_85_1]
		end

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play1101106022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1033ui_story"].transform
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.var_.moveOldPos1033ui_story = var_88_0.localPosition
			end

			local var_88_2 = 0.001

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2
				local var_88_4 = Vector3.New(0, -0.9, -6.35)

				var_88_0.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1033ui_story, var_88_4, var_88_3)

				local var_88_5 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_5.x, var_88_5.y, var_88_5.z)

				local var_88_6 = var_88_0.localEulerAngles

				var_88_6.z = 0
				var_88_6.x = 0
				var_88_0.localEulerAngles = var_88_6
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 then
				var_88_0.localPosition = Vector3.New(0, -0.9, -6.35)

				local var_88_7 = manager.ui.mainCamera.transform.position - var_88_0.position

				var_88_0.forward = Vector3.New(var_88_7.x, var_88_7.y, var_88_7.z)

				local var_88_8 = var_88_0.localEulerAngles

				var_88_8.z = 0
				var_88_8.x = 0
				var_88_0.localEulerAngles = var_88_8
			end

			local var_88_9 = arg_85_1.actors_["1033ui_story"]
			local var_88_10 = 0

			if var_88_10 < arg_85_1.time_ and arg_85_1.time_ <= var_88_10 + arg_88_0 and arg_85_1.var_.characterEffect1033ui_story == nil then
				arg_85_1.var_.characterEffect1033ui_story = var_88_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_11 = 0.200000002980232

			if var_88_10 <= arg_85_1.time_ and arg_85_1.time_ < var_88_10 + var_88_11 then
				local var_88_12 = (arg_85_1.time_ - var_88_10) / var_88_11

				if arg_85_1.var_.characterEffect1033ui_story then
					arg_85_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_85_1.time_ >= var_88_10 + var_88_11 and arg_85_1.time_ < var_88_10 + var_88_11 + arg_88_0 and arg_85_1.var_.characterEffect1033ui_story then
				arg_85_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_88_13 = 0

			if var_88_13 < arg_85_1.time_ and arg_85_1.time_ <= var_88_13 + arg_88_0 then
				arg_85_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033action/1033action3_2")
			end

			local var_88_14 = 0

			if var_88_14 < arg_85_1.time_ and arg_85_1.time_ <= var_88_14 + arg_88_0 then
				arg_85_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_88_15 = 0
			local var_88_16 = 0.75

			if var_88_15 < arg_85_1.time_ and arg_85_1.time_ <= var_88_15 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_17 = arg_85_1:FormatText(StoryNameCfg[236].name)

				arg_85_1.leftNameTxt_.text = var_88_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_18 = arg_85_1:GetWordFromCfg(1101106021)
				local var_88_19 = arg_85_1:FormatText(var_88_18.content)

				arg_85_1.text_.text = var_88_19

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_20 = 30
				local var_88_21 = utf8.len(var_88_19)
				local var_88_22 = var_88_20 <= 0 and var_88_16 or var_88_16 * (var_88_21 / var_88_20)

				if var_88_22 > 0 and var_88_16 < var_88_22 then
					arg_85_1.talkMaxDuration = var_88_22

					if var_88_22 + var_88_15 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_22 + var_88_15
					end
				end

				arg_85_1.text_.text = var_88_19
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb") ~= 0 then
					local var_88_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb") / 1000

					if var_88_23 + var_88_15 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_23 + var_88_15
					end

					if var_88_18.prefab_name ~= "" and arg_85_1.actors_[var_88_18.prefab_name] ~= nil then
						local var_88_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_18.prefab_name].transform, "story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb")

						arg_85_1:RecordAudio("1101106021", var_88_24)
						arg_85_1:RecordAudio("1101106021", var_88_24)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106021", "story_v_side_new_1101106.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_25 = math.max(var_88_16, arg_85_1.talkMaxDuration)

			if var_88_15 <= arg_85_1.time_ and arg_85_1.time_ < var_88_15 + var_88_25 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_15) / var_88_25

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_15 + var_88_25 and arg_85_1.time_ < var_88_15 + var_88_25 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 1101106022
		arg_89_1.duration_ = 5

		SetActive(arg_89_1.tipsGo_, false)

		function arg_89_1.onSingleLineFinish_()
			arg_89_1.onSingleLineUpdate_ = nil
			arg_89_1.onSingleLineFinish_ = nil
			arg_89_1.state_ = "waiting"
		end

		function arg_89_1.playNext_(arg_91_0)
			if arg_91_0 == 1 then
				arg_89_0:Play1101106023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1033ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1033ui_story == nil then
				arg_89_1.var_.characterEffect1033ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1033ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_89_1.var_.characterEffect1033ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1033ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_89_1.var_.characterEffect1033ui_story.fillRatio = var_92_5
			end

			local var_92_6 = 0
			local var_92_7 = 0.05

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_8 = arg_89_1:FormatText(StoryNameCfg[7].name)

				arg_89_1.leftNameTxt_.text = var_92_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_9 = arg_89_1:GetWordFromCfg(1101106022)
				local var_92_10 = arg_89_1:FormatText(var_92_9.content)

				arg_89_1.text_.text = var_92_10

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_11 = 2
				local var_92_12 = utf8.len(var_92_10)
				local var_92_13 = var_92_11 <= 0 and var_92_7 or var_92_7 * (var_92_12 / var_92_11)

				if var_92_13 > 0 and var_92_7 < var_92_13 then
					arg_89_1.talkMaxDuration = var_92_13

					if var_92_13 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_13 + var_92_6
					end
				end

				arg_89_1.text_.text = var_92_10
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)
				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_14 = math.max(var_92_7, arg_89_1.talkMaxDuration)

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_14 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_6) / var_92_14

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_6 + var_92_14 and arg_89_1.time_ < var_92_6 + var_92_14 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 1101106023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play1101106024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1033ui_story"].transform
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos1033ui_story = var_96_0.localPosition
			end

			local var_96_2 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2
				local var_96_4 = Vector3.New(0, 100, 0)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1033ui_story, var_96_4, var_96_3)

				local var_96_5 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_5.x, var_96_5.y, var_96_5.z)

				local var_96_6 = var_96_0.localEulerAngles

				var_96_6.z = 0
				var_96_6.x = 0
				var_96_0.localEulerAngles = var_96_6
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(0, 100, 0)

				local var_96_7 = manager.ui.mainCamera.transform.position - var_96_0.position

				var_96_0.forward = Vector3.New(var_96_7.x, var_96_7.y, var_96_7.z)

				local var_96_8 = var_96_0.localEulerAngles

				var_96_8.z = 0
				var_96_8.x = 0
				var_96_0.localEulerAngles = var_96_8
			end

			local var_96_9 = arg_93_1.actors_["1033ui_story"]
			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 and arg_93_1.var_.characterEffect1033ui_story == nil then
				arg_93_1.var_.characterEffect1033ui_story = var_96_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_11 = 0.200000002980232

			if var_96_10 <= arg_93_1.time_ and arg_93_1.time_ < var_96_10 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_10) / var_96_11

				if arg_93_1.var_.characterEffect1033ui_story then
					local var_96_13 = Mathf.Lerp(0, 0.5, var_96_12)

					arg_93_1.var_.characterEffect1033ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1033ui_story.fillRatio = var_96_13
				end
			end

			if arg_93_1.time_ >= var_96_10 + var_96_11 and arg_93_1.time_ < var_96_10 + var_96_11 + arg_96_0 and arg_93_1.var_.characterEffect1033ui_story then
				local var_96_14 = 0.5

				arg_93_1.var_.characterEffect1033ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1033ui_story.fillRatio = var_96_14
			end

			local var_96_15 = 0
			local var_96_16 = 0.45

			if var_96_15 < arg_93_1.time_ and arg_93_1.time_ <= var_96_15 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_17 = arg_93_1:GetWordFromCfg(1101106023)
				local var_96_18 = arg_93_1:FormatText(var_96_17.content)

				arg_93_1.text_.text = var_96_18

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_19 = 18
				local var_96_20 = utf8.len(var_96_18)
				local var_96_21 = var_96_19 <= 0 and var_96_16 or var_96_16 * (var_96_20 / var_96_19)

				if var_96_21 > 0 and var_96_16 < var_96_21 then
					arg_93_1.talkMaxDuration = var_96_21

					if var_96_21 + var_96_15 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_21 + var_96_15
					end
				end

				arg_93_1.text_.text = var_96_18
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_22 = math.max(var_96_16, arg_93_1.talkMaxDuration)

			if var_96_15 <= arg_93_1.time_ and arg_93_1.time_ < var_96_15 + var_96_22 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_15) / var_96_22

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_15 + var_96_22 and arg_93_1.time_ < var_96_15 + var_96_22 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 1101106024
		arg_97_1.duration_ = 9.6

		local var_97_0 = {
			zh = 7.166,
			ja = 9.6
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
				arg_97_0:Play1101106025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1033ui_story"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos1033ui_story = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(0, -0.9, -6.35)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1033ui_story, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(0, -0.9, -6.35)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = arg_97_1.actors_["1033ui_story"]
			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 and arg_97_1.var_.characterEffect1033ui_story == nil then
				arg_97_1.var_.characterEffect1033ui_story = var_100_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_11 = 0.200000002980232

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_11 then
				local var_100_12 = (arg_97_1.time_ - var_100_10) / var_100_11

				if arg_97_1.var_.characterEffect1033ui_story then
					arg_97_1.var_.characterEffect1033ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_10 + var_100_11 and arg_97_1.time_ < var_100_10 + var_100_11 + arg_100_0 and arg_97_1.var_.characterEffect1033ui_story then
				arg_97_1.var_.characterEffect1033ui_story.fillFlat = false
			end

			local var_100_13 = 0

			if var_100_13 < arg_97_1.time_ and arg_97_1.time_ <= var_100_13 + arg_100_0 then
				arg_97_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/1033/1033action/1033action8_1")
			end

			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 then
				arg_97_1:PlayTimeline("1033ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_100_15 = 0
			local var_100_16 = 0.975

			if var_100_15 < arg_97_1.time_ and arg_97_1.time_ <= var_100_15 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_17 = arg_97_1:FormatText(StoryNameCfg[236].name)

				arg_97_1.leftNameTxt_.text = var_100_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_18 = arg_97_1:GetWordFromCfg(1101106024)
				local var_100_19 = arg_97_1:FormatText(var_100_18.content)

				arg_97_1.text_.text = var_100_19

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_20 = 39
				local var_100_21 = utf8.len(var_100_19)
				local var_100_22 = var_100_20 <= 0 and var_100_16 or var_100_16 * (var_100_21 / var_100_20)

				if var_100_22 > 0 and var_100_16 < var_100_22 then
					arg_97_1.talkMaxDuration = var_100_22

					if var_100_22 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_22 + var_100_15
					end
				end

				arg_97_1.text_.text = var_100_19
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb") ~= 0 then
					local var_100_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb") / 1000

					if var_100_23 + var_100_15 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_23 + var_100_15
					end

					if var_100_18.prefab_name ~= "" and arg_97_1.actors_[var_100_18.prefab_name] ~= nil then
						local var_100_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_18.prefab_name].transform, "story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb")

						arg_97_1:RecordAudio("1101106024", var_100_24)
						arg_97_1:RecordAudio("1101106024", var_100_24)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106024", "story_v_side_new_1101106.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_25 = math.max(var_100_16, arg_97_1.talkMaxDuration)

			if var_100_15 <= arg_97_1.time_ and arg_97_1.time_ < var_100_15 + var_100_25 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_15) / var_100_25

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_15 + var_100_25 and arg_97_1.time_ < var_100_15 + var_100_25 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 1101106025
		arg_101_1.duration_ = 11.8

		local var_101_0 = {
			zh = 10.433,
			ja = 11.8
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
				arg_101_0:Play1101106026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = "ST04a"

			if arg_101_1.bgs_[var_104_0] == nil then
				local var_104_1 = Object.Instantiate(arg_101_1.paintGo_)

				var_104_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_104_0)
				var_104_1.name = var_104_0
				var_104_1.transform.parent = arg_101_1.stage_.transform
				var_104_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_101_1.bgs_[var_104_0] = var_104_1
			end

			local var_104_2 = 2

			if var_104_2 < arg_101_1.time_ and arg_101_1.time_ <= var_104_2 + arg_104_0 then
				local var_104_3 = manager.ui.mainCamera.transform.localPosition
				local var_104_4 = Vector3.New(0, 0, 10) + Vector3.New(var_104_3.x, var_104_3.y, 0)
				local var_104_5 = arg_101_1.bgs_.ST04a

				var_104_5.transform.localPosition = var_104_4
				var_104_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_104_6 = var_104_5:GetComponent("SpriteRenderer")

				if var_104_6 and var_104_6.sprite then
					local var_104_7 = (var_104_5.transform.localPosition - var_104_3).z
					local var_104_8 = manager.ui.mainCameraCom_
					local var_104_9 = 2 * var_104_7 * Mathf.Tan(var_104_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_104_10 = var_104_9 * var_104_8.aspect
					local var_104_11 = var_104_6.sprite.bounds.size.x
					local var_104_12 = var_104_6.sprite.bounds.size.y
					local var_104_13 = var_104_10 / var_104_11
					local var_104_14 = var_104_9 / var_104_12
					local var_104_15 = var_104_14 < var_104_13 and var_104_13 or var_104_14

					var_104_5.transform.localScale = Vector3.New(var_104_15, var_104_15, 0)
				end

				for iter_104_0, iter_104_1 in pairs(arg_101_1.bgs_) do
					if iter_104_0 ~= "ST04a" then
						iter_104_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_104_16 = 0

			if var_104_16 < arg_101_1.time_ and arg_101_1.time_ <= var_104_16 + arg_104_0 then
				arg_101_1.mask_.enabled = true
				arg_101_1.mask_.raycastTarget = true

				arg_101_1:SetGaussion(false)
			end

			local var_104_17 = 2

			if var_104_16 <= arg_101_1.time_ and arg_101_1.time_ < var_104_16 + var_104_17 then
				local var_104_18 = (arg_101_1.time_ - var_104_16) / var_104_17
				local var_104_19 = Color.New(0, 0, 0)

				var_104_19.a = Mathf.Lerp(0, 1, var_104_18)
				arg_101_1.mask_.color = var_104_19
			end

			if arg_101_1.time_ >= var_104_16 + var_104_17 and arg_101_1.time_ < var_104_16 + var_104_17 + arg_104_0 then
				local var_104_20 = Color.New(0, 0, 0)

				var_104_20.a = 1
				arg_101_1.mask_.color = var_104_20
			end

			local var_104_21 = 2

			if var_104_21 < arg_101_1.time_ and arg_101_1.time_ <= var_104_21 + arg_104_0 then
				arg_101_1.mask_.enabled = true
				arg_101_1.mask_.raycastTarget = true

				arg_101_1:SetGaussion(false)
			end

			local var_104_22 = 2

			if var_104_21 <= arg_101_1.time_ and arg_101_1.time_ < var_104_21 + var_104_22 then
				local var_104_23 = (arg_101_1.time_ - var_104_21) / var_104_22
				local var_104_24 = Color.New(0, 0, 0)

				var_104_24.a = Mathf.Lerp(1, 0, var_104_23)
				arg_101_1.mask_.color = var_104_24
			end

			if arg_101_1.time_ >= var_104_21 + var_104_22 and arg_101_1.time_ < var_104_21 + var_104_22 + arg_104_0 then
				local var_104_25 = Color.New(0, 0, 0)
				local var_104_26 = 0

				arg_101_1.mask_.enabled = false
				var_104_25.a = var_104_26
				arg_101_1.mask_.color = var_104_25
			end

			local var_104_27 = arg_101_1.actors_["1033ui_story"].transform
			local var_104_28 = 2

			if var_104_28 < arg_101_1.time_ and arg_101_1.time_ <= var_104_28 + arg_104_0 then
				arg_101_1.var_.moveOldPos1033ui_story = var_104_27.localPosition
			end

			local var_104_29 = 0.001

			if var_104_28 <= arg_101_1.time_ and arg_101_1.time_ < var_104_28 + var_104_29 then
				local var_104_30 = (arg_101_1.time_ - var_104_28) / var_104_29
				local var_104_31 = Vector3.New(0, 100, 0)

				var_104_27.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1033ui_story, var_104_31, var_104_30)

				local var_104_32 = manager.ui.mainCamera.transform.position - var_104_27.position

				var_104_27.forward = Vector3.New(var_104_32.x, var_104_32.y, var_104_32.z)

				local var_104_33 = var_104_27.localEulerAngles

				var_104_33.z = 0
				var_104_33.x = 0
				var_104_27.localEulerAngles = var_104_33
			end

			if arg_101_1.time_ >= var_104_28 + var_104_29 and arg_101_1.time_ < var_104_28 + var_104_29 + arg_104_0 then
				var_104_27.localPosition = Vector3.New(0, 100, 0)

				local var_104_34 = manager.ui.mainCamera.transform.position - var_104_27.position

				var_104_27.forward = Vector3.New(var_104_34.x, var_104_34.y, var_104_34.z)

				local var_104_35 = var_104_27.localEulerAngles

				var_104_35.z = 0
				var_104_35.x = 0
				var_104_27.localEulerAngles = var_104_35
			end

			local var_104_36 = arg_101_1.actors_["1111ui_story"].transform
			local var_104_37 = 4

			if var_104_37 < arg_101_1.time_ and arg_101_1.time_ <= var_104_37 + arg_104_0 then
				arg_101_1.var_.moveOldPos1111ui_story = var_104_36.localPosition
			end

			local var_104_38 = 0.001

			if var_104_37 <= arg_101_1.time_ and arg_101_1.time_ < var_104_37 + var_104_38 then
				local var_104_39 = (arg_101_1.time_ - var_104_37) / var_104_38
				local var_104_40 = Vector3.New(0.7, -0.83, -6)

				var_104_36.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1111ui_story, var_104_40, var_104_39)

				local var_104_41 = manager.ui.mainCamera.transform.position - var_104_36.position

				var_104_36.forward = Vector3.New(var_104_41.x, var_104_41.y, var_104_41.z)

				local var_104_42 = var_104_36.localEulerAngles

				var_104_42.z = 0
				var_104_42.x = 0
				var_104_36.localEulerAngles = var_104_42
			end

			if arg_101_1.time_ >= var_104_37 + var_104_38 and arg_101_1.time_ < var_104_37 + var_104_38 + arg_104_0 then
				var_104_36.localPosition = Vector3.New(0.7, -0.83, -6)

				local var_104_43 = manager.ui.mainCamera.transform.position - var_104_36.position

				var_104_36.forward = Vector3.New(var_104_43.x, var_104_43.y, var_104_43.z)

				local var_104_44 = var_104_36.localEulerAngles

				var_104_44.z = 0
				var_104_44.x = 0
				var_104_36.localEulerAngles = var_104_44
			end

			local var_104_45 = arg_101_1.actors_["1111ui_story"]
			local var_104_46 = 4

			if var_104_46 < arg_101_1.time_ and arg_101_1.time_ <= var_104_46 + arg_104_0 and arg_101_1.var_.characterEffect1111ui_story == nil then
				arg_101_1.var_.characterEffect1111ui_story = var_104_45:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_47 = 0.200000002980232

			if var_104_46 <= arg_101_1.time_ and arg_101_1.time_ < var_104_46 + var_104_47 then
				local var_104_48 = (arg_101_1.time_ - var_104_46) / var_104_47

				if arg_101_1.var_.characterEffect1111ui_story then
					arg_101_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_46 + var_104_47 and arg_101_1.time_ < var_104_46 + var_104_47 + arg_104_0 and arg_101_1.var_.characterEffect1111ui_story then
				arg_101_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_104_49 = 4

			if var_104_49 < arg_101_1.time_ and arg_101_1.time_ <= var_104_49 + arg_104_0 then
				arg_101_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_1")
			end

			local var_104_50 = 4

			if var_104_50 < arg_101_1.time_ and arg_101_1.time_ <= var_104_50 + arg_104_0 then
				arg_101_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_104_51 = arg_101_1.actors_["1011ui_story"].transform
			local var_104_52 = 4

			if var_104_52 < arg_101_1.time_ and arg_101_1.time_ <= var_104_52 + arg_104_0 then
				arg_101_1.var_.moveOldPos1011ui_story = var_104_51.localPosition
			end

			local var_104_53 = 0.001

			if var_104_52 <= arg_101_1.time_ and arg_101_1.time_ < var_104_52 + var_104_53 then
				local var_104_54 = (arg_101_1.time_ - var_104_52) / var_104_53
				local var_104_55 = Vector3.New(-0.7, -0.71, -6)

				var_104_51.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1011ui_story, var_104_55, var_104_54)

				local var_104_56 = manager.ui.mainCamera.transform.position - var_104_51.position

				var_104_51.forward = Vector3.New(var_104_56.x, var_104_56.y, var_104_56.z)

				local var_104_57 = var_104_51.localEulerAngles

				var_104_57.z = 0
				var_104_57.x = 0
				var_104_51.localEulerAngles = var_104_57
			end

			if arg_101_1.time_ >= var_104_52 + var_104_53 and arg_101_1.time_ < var_104_52 + var_104_53 + arg_104_0 then
				var_104_51.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_104_58 = manager.ui.mainCamera.transform.position - var_104_51.position

				var_104_51.forward = Vector3.New(var_104_58.x, var_104_58.y, var_104_58.z)

				local var_104_59 = var_104_51.localEulerAngles

				var_104_59.z = 0
				var_104_59.x = 0
				var_104_51.localEulerAngles = var_104_59
			end

			local var_104_60 = arg_101_1.actors_["1011ui_story"]
			local var_104_61 = 4

			if var_104_61 < arg_101_1.time_ and arg_101_1.time_ <= var_104_61 + arg_104_0 and arg_101_1.var_.characterEffect1011ui_story == nil then
				arg_101_1.var_.characterEffect1011ui_story = var_104_60:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_62 = 0.200000002980232

			if var_104_61 <= arg_101_1.time_ and arg_101_1.time_ < var_104_61 + var_104_62 then
				local var_104_63 = (arg_101_1.time_ - var_104_61) / var_104_62

				if arg_101_1.var_.characterEffect1011ui_story then
					local var_104_64 = Mathf.Lerp(0, 0.5, var_104_63)

					arg_101_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1011ui_story.fillRatio = var_104_64
				end
			end

			if arg_101_1.time_ >= var_104_61 + var_104_62 and arg_101_1.time_ < var_104_61 + var_104_62 + arg_104_0 and arg_101_1.var_.characterEffect1011ui_story then
				local var_104_65 = 0.5

				arg_101_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1011ui_story.fillRatio = var_104_65
			end

			local var_104_66 = 4

			if var_104_66 < arg_101_1.time_ and arg_101_1.time_ <= var_104_66 + arg_104_0 then
				arg_101_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_104_67 = 4

			if var_104_67 < arg_101_1.time_ and arg_101_1.time_ <= var_104_67 + arg_104_0 then
				arg_101_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			if arg_101_1.frameCnt_ <= 1 then
				arg_101_1.dialog_:SetActive(false)
			end

			local var_104_68 = 4
			local var_104_69 = 0.675

			if var_104_68 < arg_101_1.time_ and arg_101_1.time_ <= var_104_68 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0

				arg_101_1.dialog_:SetActive(true)

				local var_104_70 = LeanTween.value(arg_101_1.dialog_, 0, 1, 0.3)

				var_104_70:setOnUpdate(LuaHelper.FloatAction(function(arg_105_0)
					arg_101_1.dialogCg_.alpha = arg_105_0
				end))
				var_104_70:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_101_1.dialog_)
					var_104_70:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_101_1.duration_ = arg_101_1.duration_ + 0.3

				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_71 = arg_101_1:FormatText(StoryNameCfg[67].name)

				arg_101_1.leftNameTxt_.text = var_104_71

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_72 = arg_101_1:GetWordFromCfg(1101106025)
				local var_104_73 = arg_101_1:FormatText(var_104_72.content)

				arg_101_1.text_.text = var_104_73

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_74 = 27
				local var_104_75 = utf8.len(var_104_73)
				local var_104_76 = var_104_74 <= 0 and var_104_69 or var_104_69 * (var_104_75 / var_104_74)

				if var_104_76 > 0 and var_104_69 < var_104_76 then
					arg_101_1.talkMaxDuration = var_104_76
					var_104_68 = var_104_68 + 0.3

					if var_104_76 + var_104_68 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_76 + var_104_68
					end
				end

				arg_101_1.text_.text = var_104_73
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb") ~= 0 then
					local var_104_77 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb") / 1000

					if var_104_77 + var_104_68 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_77 + var_104_68
					end

					if var_104_72.prefab_name ~= "" and arg_101_1.actors_[var_104_72.prefab_name] ~= nil then
						local var_104_78 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_72.prefab_name].transform, "story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb")

						arg_101_1:RecordAudio("1101106025", var_104_78)
						arg_101_1:RecordAudio("1101106025", var_104_78)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106025", "story_v_side_new_1101106.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_79 = var_104_68 + 0.3
			local var_104_80 = math.max(var_104_69, arg_101_1.talkMaxDuration)

			if var_104_79 <= arg_101_1.time_ and arg_101_1.time_ < var_104_79 + var_104_80 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_79) / var_104_80

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_79 + var_104_80 and arg_101_1.time_ < var_104_79 + var_104_80 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 1101106026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play1101106027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1111ui_story"]
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 and arg_107_1.var_.characterEffect1111ui_story == nil then
				arg_107_1.var_.characterEffect1111ui_story = var_110_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_2 = 0.200000002980232

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2

				if arg_107_1.var_.characterEffect1111ui_story then
					local var_110_4 = Mathf.Lerp(0, 0.5, var_110_3)

					arg_107_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1111ui_story.fillRatio = var_110_4
				end
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 and arg_107_1.var_.characterEffect1111ui_story then
				local var_110_5 = 0.5

				arg_107_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1111ui_story.fillRatio = var_110_5
			end

			local var_110_6 = 0
			local var_110_7 = 0.95

			if var_110_6 < arg_107_1.time_ and arg_107_1.time_ <= var_110_6 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_8 = arg_107_1:FormatText(StoryNameCfg[7].name)

				arg_107_1.leftNameTxt_.text = var_110_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_9 = arg_107_1:GetWordFromCfg(1101106026)
				local var_110_10 = arg_107_1:FormatText(var_110_9.content)

				arg_107_1.text_.text = var_110_10

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_11 = 38
				local var_110_12 = utf8.len(var_110_10)
				local var_110_13 = var_110_11 <= 0 and var_110_7 or var_110_7 * (var_110_12 / var_110_11)

				if var_110_13 > 0 and var_110_7 < var_110_13 then
					arg_107_1.talkMaxDuration = var_110_13

					if var_110_13 + var_110_6 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_13 + var_110_6
					end
				end

				arg_107_1.text_.text = var_110_10
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_14 = math.max(var_110_7, arg_107_1.talkMaxDuration)

			if var_110_6 <= arg_107_1.time_ and arg_107_1.time_ < var_110_6 + var_110_14 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_6) / var_110_14

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_6 + var_110_14 and arg_107_1.time_ < var_110_6 + var_110_14 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 1101106027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play1101106028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.275

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[7].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(1101106027)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 11
				local var_114_6 = utf8.len(var_114_4)
				local var_114_7 = var_114_5 <= 0 and var_114_1 or var_114_1 * (var_114_6 / var_114_5)

				if var_114_7 > 0 and var_114_1 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_4
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_8 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_8 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_8

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_8 and arg_111_1.time_ < var_114_0 + var_114_8 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 1101106028
		arg_115_1.duration_ = 11.7

		local var_115_0 = {
			zh = 6.466,
			ja = 11.7
		}
		local var_115_1 = manager.audio:GetLocalizationFlag()

		if var_115_0[var_115_1] ~= nil then
			arg_115_1.duration_ = var_115_0[var_115_1]
		end

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play1101106029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1111ui_story"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1111ui_story = var_118_0.localPosition
			end

			local var_118_2 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2
				local var_118_4 = Vector3.New(0.7, -0.83, -6)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1111ui_story, var_118_4, var_118_3)

				local var_118_5 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_5.x, var_118_5.y, var_118_5.z)

				local var_118_6 = var_118_0.localEulerAngles

				var_118_6.z = 0
				var_118_6.x = 0
				var_118_0.localEulerAngles = var_118_6
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0.7, -0.83, -6)

				local var_118_7 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_7.x, var_118_7.y, var_118_7.z)

				local var_118_8 = var_118_0.localEulerAngles

				var_118_8.z = 0
				var_118_8.x = 0
				var_118_0.localEulerAngles = var_118_8
			end

			local var_118_9 = arg_115_1.actors_["1111ui_story"]
			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 and arg_115_1.var_.characterEffect1111ui_story == nil then
				arg_115_1.var_.characterEffect1111ui_story = var_118_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_11 = 0.200000002980232

			if var_118_10 <= arg_115_1.time_ and arg_115_1.time_ < var_118_10 + var_118_11 then
				local var_118_12 = (arg_115_1.time_ - var_118_10) / var_118_11

				if arg_115_1.var_.characterEffect1111ui_story then
					arg_115_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_10 + var_118_11 and arg_115_1.time_ < var_118_10 + var_118_11 + arg_118_0 and arg_115_1.var_.characterEffect1111ui_story then
				arg_115_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_118_13 = 0

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 then
				arg_115_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_2")
			end

			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 then
				arg_115_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_118_15 = 0
			local var_118_16 = 0.725

			if var_118_15 < arg_115_1.time_ and arg_115_1.time_ <= var_118_15 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_17 = arg_115_1:FormatText(StoryNameCfg[67].name)

				arg_115_1.leftNameTxt_.text = var_118_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_18 = arg_115_1:GetWordFromCfg(1101106028)
				local var_118_19 = arg_115_1:FormatText(var_118_18.content)

				arg_115_1.text_.text = var_118_19

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_20 = 29
				local var_118_21 = utf8.len(var_118_19)
				local var_118_22 = var_118_20 <= 0 and var_118_16 or var_118_16 * (var_118_21 / var_118_20)

				if var_118_22 > 0 and var_118_16 < var_118_22 then
					arg_115_1.talkMaxDuration = var_118_22

					if var_118_22 + var_118_15 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_22 + var_118_15
					end
				end

				arg_115_1.text_.text = var_118_19
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb") ~= 0 then
					local var_118_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb") / 1000

					if var_118_23 + var_118_15 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_23 + var_118_15
					end

					if var_118_18.prefab_name ~= "" and arg_115_1.actors_[var_118_18.prefab_name] ~= nil then
						local var_118_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_18.prefab_name].transform, "story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb")

						arg_115_1:RecordAudio("1101106028", var_118_24)
						arg_115_1:RecordAudio("1101106028", var_118_24)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106028", "story_v_side_new_1101106.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_25 = math.max(var_118_16, arg_115_1.talkMaxDuration)

			if var_118_15 <= arg_115_1.time_ and arg_115_1.time_ < var_118_15 + var_118_25 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_15) / var_118_25

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_15 + var_118_25 and arg_115_1.time_ < var_118_15 + var_118_25 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 1101106029
		arg_119_1.duration_ = 4.6

		local var_119_0 = {
			zh = 4.6,
			ja = 4.1
		}
		local var_119_1 = manager.audio:GetLocalizationFlag()

		if var_119_0[var_119_1] ~= nil then
			arg_119_1.duration_ = var_119_0[var_119_1]
		end

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play1101106030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1011ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1011ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(-0.7, -0.71, -6)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1011ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1011ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1011ui_story == nil then
				arg_119_1.var_.characterEffect1011ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1011ui_story then
					arg_119_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1011ui_story then
				arg_119_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_122_13 = 0

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				arg_119_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_122_15 = arg_119_1.actors_["1111ui_story"]
			local var_122_16 = 0

			if var_122_16 < arg_119_1.time_ and arg_119_1.time_ <= var_122_16 + arg_122_0 and arg_119_1.var_.characterEffect1111ui_story == nil then
				arg_119_1.var_.characterEffect1111ui_story = var_122_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_17 = 0.200000002980232

			if var_122_16 <= arg_119_1.time_ and arg_119_1.time_ < var_122_16 + var_122_17 then
				local var_122_18 = (arg_119_1.time_ - var_122_16) / var_122_17

				if arg_119_1.var_.characterEffect1111ui_story then
					local var_122_19 = Mathf.Lerp(0, 0.5, var_122_18)

					arg_119_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1111ui_story.fillRatio = var_122_19
				end
			end

			if arg_119_1.time_ >= var_122_16 + var_122_17 and arg_119_1.time_ < var_122_16 + var_122_17 + arg_122_0 and arg_119_1.var_.characterEffect1111ui_story then
				local var_122_20 = 0.5

				arg_119_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1111ui_story.fillRatio = var_122_20
			end

			local var_122_21 = 0
			local var_122_22 = 0.475

			if var_122_21 < arg_119_1.time_ and arg_119_1.time_ <= var_122_21 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_23 = arg_119_1:FormatText(StoryNameCfg[37].name)

				arg_119_1.leftNameTxt_.text = var_122_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_24 = arg_119_1:GetWordFromCfg(1101106029)
				local var_122_25 = arg_119_1:FormatText(var_122_24.content)

				arg_119_1.text_.text = var_122_25

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_26 = 19
				local var_122_27 = utf8.len(var_122_25)
				local var_122_28 = var_122_26 <= 0 and var_122_22 or var_122_22 * (var_122_27 / var_122_26)

				if var_122_28 > 0 and var_122_22 < var_122_28 then
					arg_119_1.talkMaxDuration = var_122_28

					if var_122_28 + var_122_21 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_28 + var_122_21
					end
				end

				arg_119_1.text_.text = var_122_25
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb") ~= 0 then
					local var_122_29 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb") / 1000

					if var_122_29 + var_122_21 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_29 + var_122_21
					end

					if var_122_24.prefab_name ~= "" and arg_119_1.actors_[var_122_24.prefab_name] ~= nil then
						local var_122_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_24.prefab_name].transform, "story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb")

						arg_119_1:RecordAudio("1101106029", var_122_30)
						arg_119_1:RecordAudio("1101106029", var_122_30)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106029", "story_v_side_new_1101106.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_31 = math.max(var_122_22, arg_119_1.talkMaxDuration)

			if var_122_21 <= arg_119_1.time_ and arg_119_1.time_ < var_122_21 + var_122_31 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_21) / var_122_31

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_21 + var_122_31 and arg_119_1.time_ < var_122_21 + var_122_31 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 1101106030
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play1101106031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1011ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1011ui_story == nil then
				arg_123_1.var_.characterEffect1011ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.200000002980232

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1011ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1011ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1011ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1011ui_story.fillRatio = var_126_5
			end

			local var_126_6 = 0
			local var_126_7 = 0.075

			if var_126_6 < arg_123_1.time_ and arg_123_1.time_ <= var_126_6 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_8 = arg_123_1:FormatText(StoryNameCfg[7].name)

				arg_123_1.leftNameTxt_.text = var_126_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_9 = arg_123_1:GetWordFromCfg(1101106030)
				local var_126_10 = arg_123_1:FormatText(var_126_9.content)

				arg_123_1.text_.text = var_126_10

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_11 = 3
				local var_126_12 = utf8.len(var_126_10)
				local var_126_13 = var_126_11 <= 0 and var_126_7 or var_126_7 * (var_126_12 / var_126_11)

				if var_126_13 > 0 and var_126_7 < var_126_13 then
					arg_123_1.talkMaxDuration = var_126_13

					if var_126_13 + var_126_6 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_13 + var_126_6
					end
				end

				arg_123_1.text_.text = var_126_10
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_14 = math.max(var_126_7, arg_123_1.talkMaxDuration)

			if var_126_6 <= arg_123_1.time_ and arg_123_1.time_ < var_126_6 + var_126_14 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_6) / var_126_14

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_6 + var_126_14 and arg_123_1.time_ < var_126_6 + var_126_14 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 1101106031
		arg_127_1.duration_ = 5.9

		local var_127_0 = {
			zh = 3.8,
			ja = 5.9
		}
		local var_127_1 = manager.audio:GetLocalizationFlag()

		if var_127_0[var_127_1] ~= nil then
			arg_127_1.duration_ = var_127_0[var_127_1]
		end

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play1101106032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1011ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1011ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(-0.7, -0.71, -6)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1011ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = arg_127_1.actors_["1011ui_story"]
			local var_130_10 = 0

			if var_130_10 < arg_127_1.time_ and arg_127_1.time_ <= var_130_10 + arg_130_0 and arg_127_1.var_.characterEffect1011ui_story == nil then
				arg_127_1.var_.characterEffect1011ui_story = var_130_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_130_11 = 0.200000002980232

			if var_130_10 <= arg_127_1.time_ and arg_127_1.time_ < var_130_10 + var_130_11 then
				local var_130_12 = (arg_127_1.time_ - var_130_10) / var_130_11

				if arg_127_1.var_.characterEffect1011ui_story then
					arg_127_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_127_1.time_ >= var_130_10 + var_130_11 and arg_127_1.time_ < var_130_10 + var_130_11 + arg_130_0 and arg_127_1.var_.characterEffect1011ui_story then
				arg_127_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_130_13 = 0

			if var_130_13 < arg_127_1.time_ and arg_127_1.time_ <= var_130_13 + arg_130_0 then
				arg_127_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action445")
			end

			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 then
				arg_127_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_130_15 = 0
			local var_130_16 = 0.35

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_17 = arg_127_1:FormatText(StoryNameCfg[37].name)

				arg_127_1.leftNameTxt_.text = var_130_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_18 = arg_127_1:GetWordFromCfg(1101106031)
				local var_130_19 = arg_127_1:FormatText(var_130_18.content)

				arg_127_1.text_.text = var_130_19

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_20 = 14
				local var_130_21 = utf8.len(var_130_19)
				local var_130_22 = var_130_20 <= 0 and var_130_16 or var_130_16 * (var_130_21 / var_130_20)

				if var_130_22 > 0 and var_130_16 < var_130_22 then
					arg_127_1.talkMaxDuration = var_130_22

					if var_130_22 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_22 + var_130_15
					end
				end

				arg_127_1.text_.text = var_130_19
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb") ~= 0 then
					local var_130_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb") / 1000

					if var_130_23 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_23 + var_130_15
					end

					if var_130_18.prefab_name ~= "" and arg_127_1.actors_[var_130_18.prefab_name] ~= nil then
						local var_130_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_18.prefab_name].transform, "story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb")

						arg_127_1:RecordAudio("1101106031", var_130_24)
						arg_127_1:RecordAudio("1101106031", var_130_24)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106031", "story_v_side_new_1101106.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_25 = math.max(var_130_16, arg_127_1.talkMaxDuration)

			if var_130_15 <= arg_127_1.time_ and arg_127_1.time_ < var_130_15 + var_130_25 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_15) / var_130_25

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_15 + var_130_25 and arg_127_1.time_ < var_130_15 + var_130_25 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 1101106032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play1101106033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1011ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1011ui_story == nil then
				arg_131_1.var_.characterEffect1011ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.200000002980232

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1011ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1011ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1011ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1011ui_story.fillRatio = var_134_5
			end

			local var_134_6 = 0
			local var_134_7 = 0.45

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_8 = arg_131_1:FormatText(StoryNameCfg[7].name)

				arg_131_1.leftNameTxt_.text = var_134_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_9 = arg_131_1:GetWordFromCfg(1101106032)
				local var_134_10 = arg_131_1:FormatText(var_134_9.content)

				arg_131_1.text_.text = var_134_10

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_11 = 18
				local var_134_12 = utf8.len(var_134_10)
				local var_134_13 = var_134_11 <= 0 and var_134_7 or var_134_7 * (var_134_12 / var_134_11)

				if var_134_13 > 0 and var_134_7 < var_134_13 then
					arg_131_1.talkMaxDuration = var_134_13

					if var_134_13 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_13 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_10
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_14 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_14 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_14

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_14 and arg_131_1.time_ < var_134_6 + var_134_14 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 1101106033
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play1101106034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1111ui_story"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos1111ui_story = var_138_0.localPosition
			end

			local var_138_2 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2
				local var_138_4 = Vector3.New(0, 100, 0)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1111ui_story, var_138_4, var_138_3)

				local var_138_5 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_5.x, var_138_5.y, var_138_5.z)

				local var_138_6 = var_138_0.localEulerAngles

				var_138_6.z = 0
				var_138_6.x = 0
				var_138_0.localEulerAngles = var_138_6
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(0, 100, 0)

				local var_138_7 = manager.ui.mainCamera.transform.position - var_138_0.position

				var_138_0.forward = Vector3.New(var_138_7.x, var_138_7.y, var_138_7.z)

				local var_138_8 = var_138_0.localEulerAngles

				var_138_8.z = 0
				var_138_8.x = 0
				var_138_0.localEulerAngles = var_138_8
			end

			local var_138_9 = arg_135_1.actors_["1011ui_story"].transform
			local var_138_10 = 0

			if var_138_10 < arg_135_1.time_ and arg_135_1.time_ <= var_138_10 + arg_138_0 then
				arg_135_1.var_.moveOldPos1011ui_story = var_138_9.localPosition
			end

			local var_138_11 = 0.001

			if var_138_10 <= arg_135_1.time_ and arg_135_1.time_ < var_138_10 + var_138_11 then
				local var_138_12 = (arg_135_1.time_ - var_138_10) / var_138_11
				local var_138_13 = Vector3.New(0, 100, 0)

				var_138_9.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1011ui_story, var_138_13, var_138_12)

				local var_138_14 = manager.ui.mainCamera.transform.position - var_138_9.position

				var_138_9.forward = Vector3.New(var_138_14.x, var_138_14.y, var_138_14.z)

				local var_138_15 = var_138_9.localEulerAngles

				var_138_15.z = 0
				var_138_15.x = 0
				var_138_9.localEulerAngles = var_138_15
			end

			if arg_135_1.time_ >= var_138_10 + var_138_11 and arg_135_1.time_ < var_138_10 + var_138_11 + arg_138_0 then
				var_138_9.localPosition = Vector3.New(0, 100, 0)

				local var_138_16 = manager.ui.mainCamera.transform.position - var_138_9.position

				var_138_9.forward = Vector3.New(var_138_16.x, var_138_16.y, var_138_16.z)

				local var_138_17 = var_138_9.localEulerAngles

				var_138_17.z = 0
				var_138_17.x = 0
				var_138_9.localEulerAngles = var_138_17
			end

			local var_138_18 = 0
			local var_138_19 = 0.75

			if var_138_18 < arg_135_1.time_ and arg_135_1.time_ <= var_138_18 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_20 = arg_135_1:GetWordFromCfg(1101106033)
				local var_138_21 = arg_135_1:FormatText(var_138_20.content)

				arg_135_1.text_.text = var_138_21

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_22 = 30
				local var_138_23 = utf8.len(var_138_21)
				local var_138_24 = var_138_22 <= 0 and var_138_19 or var_138_19 * (var_138_23 / var_138_22)

				if var_138_24 > 0 and var_138_19 < var_138_24 then
					arg_135_1.talkMaxDuration = var_138_24

					if var_138_24 + var_138_18 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_24 + var_138_18
					end
				end

				arg_135_1.text_.text = var_138_21
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_25 = math.max(var_138_19, arg_135_1.talkMaxDuration)

			if var_138_18 <= arg_135_1.time_ and arg_135_1.time_ < var_138_18 + var_138_25 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_18) / var_138_25

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_18 + var_138_25 and arg_135_1.time_ < var_138_18 + var_138_25 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 1101106034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play1101106035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 1

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_2 = arg_139_1:FormatText(StoryNameCfg[7].name)

				arg_139_1.leftNameTxt_.text = var_142_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_3 = arg_139_1:GetWordFromCfg(1101106034)
				local var_142_4 = arg_139_1:FormatText(var_142_3.content)

				arg_139_1.text_.text = var_142_4

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_5 = 40
				local var_142_6 = utf8.len(var_142_4)
				local var_142_7 = var_142_5 <= 0 and var_142_1 or var_142_1 * (var_142_6 / var_142_5)

				if var_142_7 > 0 and var_142_1 < var_142_7 then
					arg_139_1.talkMaxDuration = var_142_7

					if var_142_7 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_7 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_4
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_8 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_8 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_8

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_8 and arg_139_1.time_ < var_142_0 + var_142_8 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 1101106035
		arg_143_1.duration_ = 4.9

		local var_143_0 = {
			zh = 3.333,
			ja = 4.9
		}
		local var_143_1 = manager.audio:GetLocalizationFlag()

		if var_143_0[var_143_1] ~= nil then
			arg_143_1.duration_ = var_143_0[var_143_1]
		end

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play1101106036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1011ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1011ui_story = var_146_0.localPosition
			end

			local var_146_2 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2
				local var_146_4 = Vector3.New(0, -0.71, -6)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1011ui_story, var_146_4, var_146_3)

				local var_146_5 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_5.x, var_146_5.y, var_146_5.z)

				local var_146_6 = var_146_0.localEulerAngles

				var_146_6.z = 0
				var_146_6.x = 0
				var_146_0.localEulerAngles = var_146_6
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_146_7 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_7.x, var_146_7.y, var_146_7.z)

				local var_146_8 = var_146_0.localEulerAngles

				var_146_8.z = 0
				var_146_8.x = 0
				var_146_0.localEulerAngles = var_146_8
			end

			local var_146_9 = arg_143_1.actors_["1011ui_story"]
			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 and arg_143_1.var_.characterEffect1011ui_story == nil then
				arg_143_1.var_.characterEffect1011ui_story = var_146_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_11 = 0.200000002980232

			if var_146_10 <= arg_143_1.time_ and arg_143_1.time_ < var_146_10 + var_146_11 then
				local var_146_12 = (arg_143_1.time_ - var_146_10) / var_146_11

				if arg_143_1.var_.characterEffect1011ui_story then
					arg_143_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_10 + var_146_11 and arg_143_1.time_ < var_146_10 + var_146_11 + arg_146_0 and arg_143_1.var_.characterEffect1011ui_story then
				arg_143_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_146_13 = 0

			if var_146_13 < arg_143_1.time_ and arg_143_1.time_ <= var_146_13 + arg_146_0 then
				arg_143_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_1")
			end

			local var_146_14 = 0

			if var_146_14 < arg_143_1.time_ and arg_143_1.time_ <= var_146_14 + arg_146_0 then
				arg_143_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_146_15 = 0
			local var_146_16 = 0.35

			if var_146_15 < arg_143_1.time_ and arg_143_1.time_ <= var_146_15 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_17 = arg_143_1:FormatText(StoryNameCfg[37].name)

				arg_143_1.leftNameTxt_.text = var_146_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_18 = arg_143_1:GetWordFromCfg(1101106035)
				local var_146_19 = arg_143_1:FormatText(var_146_18.content)

				arg_143_1.text_.text = var_146_19

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_20 = 14
				local var_146_21 = utf8.len(var_146_19)
				local var_146_22 = var_146_20 <= 0 and var_146_16 or var_146_16 * (var_146_21 / var_146_20)

				if var_146_22 > 0 and var_146_16 < var_146_22 then
					arg_143_1.talkMaxDuration = var_146_22

					if var_146_22 + var_146_15 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_22 + var_146_15
					end
				end

				arg_143_1.text_.text = var_146_19
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb") ~= 0 then
					local var_146_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb") / 1000

					if var_146_23 + var_146_15 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_23 + var_146_15
					end

					if var_146_18.prefab_name ~= "" and arg_143_1.actors_[var_146_18.prefab_name] ~= nil then
						local var_146_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_18.prefab_name].transform, "story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb")

						arg_143_1:RecordAudio("1101106035", var_146_24)
						arg_143_1:RecordAudio("1101106035", var_146_24)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106035", "story_v_side_new_1101106.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_25 = math.max(var_146_16, arg_143_1.talkMaxDuration)

			if var_146_15 <= arg_143_1.time_ and arg_143_1.time_ < var_146_15 + var_146_25 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_15) / var_146_25

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_15 + var_146_25 and arg_143_1.time_ < var_146_15 + var_146_25 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 1101106036
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play1101106037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["1011ui_story"]
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 and arg_147_1.var_.characterEffect1011ui_story == nil then
				arg_147_1.var_.characterEffect1011ui_story = var_150_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_2 = 0.200000002980232

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_2 then
				local var_150_3 = (arg_147_1.time_ - var_150_1) / var_150_2

				if arg_147_1.var_.characterEffect1011ui_story then
					local var_150_4 = Mathf.Lerp(0, 0.5, var_150_3)

					arg_147_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1011ui_story.fillRatio = var_150_4
				end
			end

			if arg_147_1.time_ >= var_150_1 + var_150_2 and arg_147_1.time_ < var_150_1 + var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1011ui_story then
				local var_150_5 = 0.5

				arg_147_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1011ui_story.fillRatio = var_150_5
			end

			local var_150_6 = 0
			local var_150_7 = 0.475

			if var_150_6 < arg_147_1.time_ and arg_147_1.time_ <= var_150_6 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, false)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_8 = arg_147_1:GetWordFromCfg(1101106036)
				local var_150_9 = arg_147_1:FormatText(var_150_8.content)

				arg_147_1.text_.text = var_150_9

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_10 = 19
				local var_150_11 = utf8.len(var_150_9)
				local var_150_12 = var_150_10 <= 0 and var_150_7 or var_150_7 * (var_150_11 / var_150_10)

				if var_150_12 > 0 and var_150_7 < var_150_12 then
					arg_147_1.talkMaxDuration = var_150_12

					if var_150_12 + var_150_6 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_12 + var_150_6
					end
				end

				arg_147_1.text_.text = var_150_9
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_13 = math.max(var_150_7, arg_147_1.talkMaxDuration)

			if var_150_6 <= arg_147_1.time_ and arg_147_1.time_ < var_150_6 + var_150_13 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_6) / var_150_13

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_6 + var_150_13 and arg_147_1.time_ < var_150_6 + var_150_13 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 1101106037
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play1101106038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.4

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[7].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(1101106037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 16
				local var_154_6 = utf8.len(var_154_4)
				local var_154_7 = var_154_5 <= 0 and var_154_1 or var_154_1 * (var_154_6 / var_154_5)

				if var_154_7 > 0 and var_154_1 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_4
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_8 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_8 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_8

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_8 and arg_151_1.time_ < var_154_0 + var_154_8 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 1101106038
		arg_155_1.duration_ = 3.433

		local var_155_0 = {
			zh = 3.433,
			ja = 1.999999999999
		}
		local var_155_1 = manager.audio:GetLocalizationFlag()

		if var_155_0[var_155_1] ~= nil then
			arg_155_1.duration_ = var_155_0[var_155_1]
		end

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play1101106039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1011ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1011ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(0, -0.71, -6)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1011ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = arg_155_1.actors_["1011ui_story"]
			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 and arg_155_1.var_.characterEffect1011ui_story == nil then
				arg_155_1.var_.characterEffect1011ui_story = var_158_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_11 = 0.200000002980232

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_11 then
				local var_158_12 = (arg_155_1.time_ - var_158_10) / var_158_11

				if arg_155_1.var_.characterEffect1011ui_story then
					arg_155_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_10 + var_158_11 and arg_155_1.time_ < var_158_10 + var_158_11 + arg_158_0 and arg_155_1.var_.characterEffect1011ui_story then
				arg_155_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_158_13 = 0

			if var_158_13 < arg_155_1.time_ and arg_155_1.time_ <= var_158_13 + arg_158_0 then
				arg_155_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_2")
			end

			local var_158_14 = 0

			if var_158_14 < arg_155_1.time_ and arg_155_1.time_ <= var_158_14 + arg_158_0 then
				arg_155_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_158_15 = 0
			local var_158_16 = 0.225

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_17 = arg_155_1:FormatText(StoryNameCfg[37].name)

				arg_155_1.leftNameTxt_.text = var_158_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_18 = arg_155_1:GetWordFromCfg(1101106038)
				local var_158_19 = arg_155_1:FormatText(var_158_18.content)

				arg_155_1.text_.text = var_158_19

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_20 = 9
				local var_158_21 = utf8.len(var_158_19)
				local var_158_22 = var_158_20 <= 0 and var_158_16 or var_158_16 * (var_158_21 / var_158_20)

				if var_158_22 > 0 and var_158_16 < var_158_22 then
					arg_155_1.talkMaxDuration = var_158_22

					if var_158_22 + var_158_15 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_22 + var_158_15
					end
				end

				arg_155_1.text_.text = var_158_19
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb") ~= 0 then
					local var_158_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb") / 1000

					if var_158_23 + var_158_15 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_23 + var_158_15
					end

					if var_158_18.prefab_name ~= "" and arg_155_1.actors_[var_158_18.prefab_name] ~= nil then
						local var_158_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_18.prefab_name].transform, "story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb")

						arg_155_1:RecordAudio("1101106038", var_158_24)
						arg_155_1:RecordAudio("1101106038", var_158_24)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106038", "story_v_side_new_1101106.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_25 = math.max(var_158_16, arg_155_1.talkMaxDuration)

			if var_158_15 <= arg_155_1.time_ and arg_155_1.time_ < var_158_15 + var_158_25 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_15) / var_158_25

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_15 + var_158_25 and arg_155_1.time_ < var_158_15 + var_158_25 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 1101106039
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play1101106040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1011ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1011ui_story == nil then
				arg_159_1.var_.characterEffect1011ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.200000002980232

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1011ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1011ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1011ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1011ui_story.fillRatio = var_162_5
			end

			local var_162_6 = 0
			local var_162_7 = 0.425

			if var_162_6 < arg_159_1.time_ and arg_159_1.time_ <= var_162_6 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_8 = arg_159_1:GetWordFromCfg(1101106039)
				local var_162_9 = arg_159_1:FormatText(var_162_8.content)

				arg_159_1.text_.text = var_162_9

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_10 = 17
				local var_162_11 = utf8.len(var_162_9)
				local var_162_12 = var_162_10 <= 0 and var_162_7 or var_162_7 * (var_162_11 / var_162_10)

				if var_162_12 > 0 and var_162_7 < var_162_12 then
					arg_159_1.talkMaxDuration = var_162_12

					if var_162_12 + var_162_6 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_12 + var_162_6
					end
				end

				arg_159_1.text_.text = var_162_9
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_13 = math.max(var_162_7, arg_159_1.talkMaxDuration)

			if var_162_6 <= arg_159_1.time_ and arg_159_1.time_ < var_162_6 + var_162_13 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_6) / var_162_13

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_6 + var_162_13 and arg_159_1.time_ < var_162_6 + var_162_13 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 1101106040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play1101106041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.325

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[7].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(1101106040)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 13
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_8 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_8 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_8

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_8 and arg_163_1.time_ < var_166_0 + var_166_8 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 1101106041
		arg_167_1.duration_ = 2.433

		local var_167_0 = {
			zh = 1.999999999999,
			ja = 2.433
		}
		local var_167_1 = manager.audio:GetLocalizationFlag()

		if var_167_0[var_167_1] ~= nil then
			arg_167_1.duration_ = var_167_0[var_167_1]
		end

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play1101106042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1011ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1011ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(0, 100, 0)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1011ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(0, 100, 0)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = arg_167_1.actors_["1011ui_story"]
			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 and arg_167_1.var_.characterEffect1011ui_story == nil then
				arg_167_1.var_.characterEffect1011ui_story = var_170_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_11 = 0.200000002980232

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_10) / var_170_11

				if arg_167_1.var_.characterEffect1011ui_story then
					local var_170_13 = Mathf.Lerp(0, 0.5, var_170_12)

					arg_167_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1011ui_story.fillRatio = var_170_13
				end
			end

			if arg_167_1.time_ >= var_170_10 + var_170_11 and arg_167_1.time_ < var_170_10 + var_170_11 + arg_170_0 and arg_167_1.var_.characterEffect1011ui_story then
				local var_170_14 = 0.5

				arg_167_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1011ui_story.fillRatio = var_170_14
			end

			local var_170_15 = arg_167_1.actors_["1111ui_story"].transform
			local var_170_16 = 0

			if var_170_16 < arg_167_1.time_ and arg_167_1.time_ <= var_170_16 + arg_170_0 then
				arg_167_1.var_.moveOldPos1111ui_story = var_170_15.localPosition
			end

			local var_170_17 = 0.001

			if var_170_16 <= arg_167_1.time_ and arg_167_1.time_ < var_170_16 + var_170_17 then
				local var_170_18 = (arg_167_1.time_ - var_170_16) / var_170_17
				local var_170_19 = Vector3.New(0, -0.83, -6)

				var_170_15.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1111ui_story, var_170_19, var_170_18)

				local var_170_20 = manager.ui.mainCamera.transform.position - var_170_15.position

				var_170_15.forward = Vector3.New(var_170_20.x, var_170_20.y, var_170_20.z)

				local var_170_21 = var_170_15.localEulerAngles

				var_170_21.z = 0
				var_170_21.x = 0
				var_170_15.localEulerAngles = var_170_21
			end

			if arg_167_1.time_ >= var_170_16 + var_170_17 and arg_167_1.time_ < var_170_16 + var_170_17 + arg_170_0 then
				var_170_15.localPosition = Vector3.New(0, -0.83, -6)

				local var_170_22 = manager.ui.mainCamera.transform.position - var_170_15.position

				var_170_15.forward = Vector3.New(var_170_22.x, var_170_22.y, var_170_22.z)

				local var_170_23 = var_170_15.localEulerAngles

				var_170_23.z = 0
				var_170_23.x = 0
				var_170_15.localEulerAngles = var_170_23
			end

			local var_170_24 = arg_167_1.actors_["1111ui_story"]
			local var_170_25 = 0

			if var_170_25 < arg_167_1.time_ and arg_167_1.time_ <= var_170_25 + arg_170_0 and arg_167_1.var_.characterEffect1111ui_story == nil then
				arg_167_1.var_.characterEffect1111ui_story = var_170_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_26 = 0.200000002980232

			if var_170_25 <= arg_167_1.time_ and arg_167_1.time_ < var_170_25 + var_170_26 then
				local var_170_27 = (arg_167_1.time_ - var_170_25) / var_170_26

				if arg_167_1.var_.characterEffect1111ui_story then
					arg_167_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_25 + var_170_26 and arg_167_1.time_ < var_170_25 + var_170_26 + arg_170_0 and arg_167_1.var_.characterEffect1111ui_story then
				arg_167_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_170_28 = 0

			if var_170_28 < arg_167_1.time_ and arg_167_1.time_ <= var_170_28 + arg_170_0 then
				arg_167_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_1")
			end

			local var_170_29 = 0

			if var_170_29 < arg_167_1.time_ and arg_167_1.time_ <= var_170_29 + arg_170_0 then
				arg_167_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_170_30 = 0
			local var_170_31 = 0.075

			if var_170_30 < arg_167_1.time_ and arg_167_1.time_ <= var_170_30 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_32 = arg_167_1:FormatText(StoryNameCfg[67].name)

				arg_167_1.leftNameTxt_.text = var_170_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_33 = arg_167_1:GetWordFromCfg(1101106041)
				local var_170_34 = arg_167_1:FormatText(var_170_33.content)

				arg_167_1.text_.text = var_170_34

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_35 = 3
				local var_170_36 = utf8.len(var_170_34)
				local var_170_37 = var_170_35 <= 0 and var_170_31 or var_170_31 * (var_170_36 / var_170_35)

				if var_170_37 > 0 and var_170_31 < var_170_37 then
					arg_167_1.talkMaxDuration = var_170_37

					if var_170_37 + var_170_30 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_37 + var_170_30
					end
				end

				arg_167_1.text_.text = var_170_34
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb") ~= 0 then
					local var_170_38 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb") / 1000

					if var_170_38 + var_170_30 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_38 + var_170_30
					end

					if var_170_33.prefab_name ~= "" and arg_167_1.actors_[var_170_33.prefab_name] ~= nil then
						local var_170_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_33.prefab_name].transform, "story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb")

						arg_167_1:RecordAudio("1101106041", var_170_39)
						arg_167_1:RecordAudio("1101106041", var_170_39)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106041", "story_v_side_new_1101106.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_40 = math.max(var_170_31, arg_167_1.talkMaxDuration)

			if var_170_30 <= arg_167_1.time_ and arg_167_1.time_ < var_170_30 + var_170_40 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_30) / var_170_40

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_30 + var_170_40 and arg_167_1.time_ < var_170_30 + var_170_40 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 1101106042
		arg_171_1.duration_ = 2.9

		local var_171_0 = {
			zh = 2.6,
			ja = 2.9
		}
		local var_171_1 = manager.audio:GetLocalizationFlag()

		if var_171_0[var_171_1] ~= nil then
			arg_171_1.duration_ = var_171_0[var_171_1]
		end

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play1101106043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1011ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1011ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(-0.7, -0.71, -6)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1011ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = arg_171_1.actors_["1011ui_story"]
			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 and arg_171_1.var_.characterEffect1011ui_story == nil then
				arg_171_1.var_.characterEffect1011ui_story = var_174_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_11 = 0.200000002980232

			if var_174_10 <= arg_171_1.time_ and arg_171_1.time_ < var_174_10 + var_174_11 then
				local var_174_12 = (arg_171_1.time_ - var_174_10) / var_174_11

				if arg_171_1.var_.characterEffect1011ui_story then
					arg_171_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_10 + var_174_11 and arg_171_1.time_ < var_174_10 + var_174_11 + arg_174_0 and arg_171_1.var_.characterEffect1011ui_story then
				arg_171_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_174_13 = 0

			if var_174_13 < arg_171_1.time_ and arg_171_1.time_ <= var_174_13 + arg_174_0 then
				arg_171_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 then
				arg_171_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_174_15 = arg_171_1.actors_["1111ui_story"].transform
			local var_174_16 = 0

			if var_174_16 < arg_171_1.time_ and arg_171_1.time_ <= var_174_16 + arg_174_0 then
				arg_171_1.var_.moveOldPos1111ui_story = var_174_15.localPosition
			end

			local var_174_17 = 0.001

			if var_174_16 <= arg_171_1.time_ and arg_171_1.time_ < var_174_16 + var_174_17 then
				local var_174_18 = (arg_171_1.time_ - var_174_16) / var_174_17
				local var_174_19 = Vector3.New(0.7, -0.83, -6)

				var_174_15.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1111ui_story, var_174_19, var_174_18)

				local var_174_20 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_20.x, var_174_20.y, var_174_20.z)

				local var_174_21 = var_174_15.localEulerAngles

				var_174_21.z = 0
				var_174_21.x = 0
				var_174_15.localEulerAngles = var_174_21
			end

			if arg_171_1.time_ >= var_174_16 + var_174_17 and arg_171_1.time_ < var_174_16 + var_174_17 + arg_174_0 then
				var_174_15.localPosition = Vector3.New(0.7, -0.83, -6)

				local var_174_22 = manager.ui.mainCamera.transform.position - var_174_15.position

				var_174_15.forward = Vector3.New(var_174_22.x, var_174_22.y, var_174_22.z)

				local var_174_23 = var_174_15.localEulerAngles

				var_174_23.z = 0
				var_174_23.x = 0
				var_174_15.localEulerAngles = var_174_23
			end

			local var_174_24 = arg_171_1.actors_["1111ui_story"]
			local var_174_25 = 0

			if var_174_25 < arg_171_1.time_ and arg_171_1.time_ <= var_174_25 + arg_174_0 and arg_171_1.var_.characterEffect1111ui_story == nil then
				arg_171_1.var_.characterEffect1111ui_story = var_174_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_26 = 0.200000002980232

			if var_174_25 <= arg_171_1.time_ and arg_171_1.time_ < var_174_25 + var_174_26 then
				local var_174_27 = (arg_171_1.time_ - var_174_25) / var_174_26

				if arg_171_1.var_.characterEffect1111ui_story then
					local var_174_28 = Mathf.Lerp(0, 0.5, var_174_27)

					arg_171_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1111ui_story.fillRatio = var_174_28
				end
			end

			if arg_171_1.time_ >= var_174_25 + var_174_26 and arg_171_1.time_ < var_174_25 + var_174_26 + arg_174_0 and arg_171_1.var_.characterEffect1111ui_story then
				local var_174_29 = 0.5

				arg_171_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1111ui_story.fillRatio = var_174_29
			end

			local var_174_30 = 0
			local var_174_31 = 0.225

			if var_174_30 < arg_171_1.time_ and arg_171_1.time_ <= var_174_30 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_32 = arg_171_1:FormatText(StoryNameCfg[37].name)

				arg_171_1.leftNameTxt_.text = var_174_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_33 = arg_171_1:GetWordFromCfg(1101106042)
				local var_174_34 = arg_171_1:FormatText(var_174_33.content)

				arg_171_1.text_.text = var_174_34

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_35 = 9
				local var_174_36 = utf8.len(var_174_34)
				local var_174_37 = var_174_35 <= 0 and var_174_31 or var_174_31 * (var_174_36 / var_174_35)

				if var_174_37 > 0 and var_174_31 < var_174_37 then
					arg_171_1.talkMaxDuration = var_174_37

					if var_174_37 + var_174_30 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_37 + var_174_30
					end
				end

				arg_171_1.text_.text = var_174_34
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb") ~= 0 then
					local var_174_38 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb") / 1000

					if var_174_38 + var_174_30 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_38 + var_174_30
					end

					if var_174_33.prefab_name ~= "" and arg_171_1.actors_[var_174_33.prefab_name] ~= nil then
						local var_174_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_33.prefab_name].transform, "story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb")

						arg_171_1:RecordAudio("1101106042", var_174_39)
						arg_171_1:RecordAudio("1101106042", var_174_39)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106042", "story_v_side_new_1101106.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_40 = math.max(var_174_31, arg_171_1.talkMaxDuration)

			if var_174_30 <= arg_171_1.time_ and arg_171_1.time_ < var_174_30 + var_174_40 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_30) / var_174_40

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_30 + var_174_40 and arg_171_1.time_ < var_174_30 + var_174_40 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 1101106043
		arg_175_1.duration_ = 2.733

		local var_175_0 = {
			zh = 2.333,
			ja = 2.733
		}
		local var_175_1 = manager.audio:GetLocalizationFlag()

		if var_175_0[var_175_1] ~= nil then
			arg_175_1.duration_ = var_175_0[var_175_1]
		end

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play1101106044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1111ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1111ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0.7, -0.83, -6)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1111ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0.7, -0.83, -6)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["1111ui_story"]
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect1111ui_story == nil then
				arg_175_1.var_.characterEffect1111ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.200000002980232

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect1111ui_story then
					arg_175_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect1111ui_story then
				arg_175_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_178_13 = 0

			if var_178_13 < arg_175_1.time_ and arg_175_1.time_ <= var_178_13 + arg_178_0 then
				arg_175_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_2")
			end

			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				arg_175_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_178_15 = arg_175_1.actors_["1011ui_story"]
			local var_178_16 = 0

			if var_178_16 < arg_175_1.time_ and arg_175_1.time_ <= var_178_16 + arg_178_0 and arg_175_1.var_.characterEffect1011ui_story == nil then
				arg_175_1.var_.characterEffect1011ui_story = var_178_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_17 = 0.200000002980232

			if var_178_16 <= arg_175_1.time_ and arg_175_1.time_ < var_178_16 + var_178_17 then
				local var_178_18 = (arg_175_1.time_ - var_178_16) / var_178_17

				if arg_175_1.var_.characterEffect1011ui_story then
					local var_178_19 = Mathf.Lerp(0, 0.5, var_178_18)

					arg_175_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_175_1.var_.characterEffect1011ui_story.fillRatio = var_178_19
				end
			end

			if arg_175_1.time_ >= var_178_16 + var_178_17 and arg_175_1.time_ < var_178_16 + var_178_17 + arg_178_0 and arg_175_1.var_.characterEffect1011ui_story then
				local var_178_20 = 0.5

				arg_175_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_175_1.var_.characterEffect1011ui_story.fillRatio = var_178_20
			end

			local var_178_21 = 0
			local var_178_22 = 0.175

			if var_178_21 < arg_175_1.time_ and arg_175_1.time_ <= var_178_21 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_23 = arg_175_1:FormatText(StoryNameCfg[67].name)

				arg_175_1.leftNameTxt_.text = var_178_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_24 = arg_175_1:GetWordFromCfg(1101106043)
				local var_178_25 = arg_175_1:FormatText(var_178_24.content)

				arg_175_1.text_.text = var_178_25

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_26 = 7
				local var_178_27 = utf8.len(var_178_25)
				local var_178_28 = var_178_26 <= 0 and var_178_22 or var_178_22 * (var_178_27 / var_178_26)

				if var_178_28 > 0 and var_178_22 < var_178_28 then
					arg_175_1.talkMaxDuration = var_178_28

					if var_178_28 + var_178_21 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_28 + var_178_21
					end
				end

				arg_175_1.text_.text = var_178_25
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb") ~= 0 then
					local var_178_29 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb") / 1000

					if var_178_29 + var_178_21 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_29 + var_178_21
					end

					if var_178_24.prefab_name ~= "" and arg_175_1.actors_[var_178_24.prefab_name] ~= nil then
						local var_178_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_24.prefab_name].transform, "story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb")

						arg_175_1:RecordAudio("1101106043", var_178_30)
						arg_175_1:RecordAudio("1101106043", var_178_30)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106043", "story_v_side_new_1101106.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_31 = math.max(var_178_22, arg_175_1.talkMaxDuration)

			if var_178_21 <= arg_175_1.time_ and arg_175_1.time_ < var_178_21 + var_178_31 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_21) / var_178_31

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_21 + var_178_31 and arg_175_1.time_ < var_178_21 + var_178_31 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 1101106044
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play1101106045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1011ui_story"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos1011ui_story = var_182_0.localPosition
			end

			local var_182_2 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2
				local var_182_4 = Vector3.New(0, 100, 0)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1011ui_story, var_182_4, var_182_3)

				local var_182_5 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_5.x, var_182_5.y, var_182_5.z)

				local var_182_6 = var_182_0.localEulerAngles

				var_182_6.z = 0
				var_182_6.x = 0
				var_182_0.localEulerAngles = var_182_6
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, 100, 0)

				local var_182_7 = manager.ui.mainCamera.transform.position - var_182_0.position

				var_182_0.forward = Vector3.New(var_182_7.x, var_182_7.y, var_182_7.z)

				local var_182_8 = var_182_0.localEulerAngles

				var_182_8.z = 0
				var_182_8.x = 0
				var_182_0.localEulerAngles = var_182_8
			end

			local var_182_9 = arg_179_1.actors_["1111ui_story"].transform
			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 then
				arg_179_1.var_.moveOldPos1111ui_story = var_182_9.localPosition
			end

			local var_182_11 = 0.001

			if var_182_10 <= arg_179_1.time_ and arg_179_1.time_ < var_182_10 + var_182_11 then
				local var_182_12 = (arg_179_1.time_ - var_182_10) / var_182_11
				local var_182_13 = Vector3.New(0, 100, 0)

				var_182_9.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1111ui_story, var_182_13, var_182_12)

				local var_182_14 = manager.ui.mainCamera.transform.position - var_182_9.position

				var_182_9.forward = Vector3.New(var_182_14.x, var_182_14.y, var_182_14.z)

				local var_182_15 = var_182_9.localEulerAngles

				var_182_15.z = 0
				var_182_15.x = 0
				var_182_9.localEulerAngles = var_182_15
			end

			if arg_179_1.time_ >= var_182_10 + var_182_11 and arg_179_1.time_ < var_182_10 + var_182_11 + arg_182_0 then
				var_182_9.localPosition = Vector3.New(0, 100, 0)

				local var_182_16 = manager.ui.mainCamera.transform.position - var_182_9.position

				var_182_9.forward = Vector3.New(var_182_16.x, var_182_16.y, var_182_16.z)

				local var_182_17 = var_182_9.localEulerAngles

				var_182_17.z = 0
				var_182_17.x = 0
				var_182_9.localEulerAngles = var_182_17
			end

			local var_182_18 = 0
			local var_182_19 = 0.5

			if var_182_18 < arg_179_1.time_ and arg_179_1.time_ <= var_182_18 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_20 = arg_179_1:FormatText(StoryNameCfg[7].name)

				arg_179_1.leftNameTxt_.text = var_182_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_21 = arg_179_1:GetWordFromCfg(1101106044)
				local var_182_22 = arg_179_1:FormatText(var_182_21.content)

				arg_179_1.text_.text = var_182_22

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_23 = 20
				local var_182_24 = utf8.len(var_182_22)
				local var_182_25 = var_182_23 <= 0 and var_182_19 or var_182_19 * (var_182_24 / var_182_23)

				if var_182_25 > 0 and var_182_19 < var_182_25 then
					arg_179_1.talkMaxDuration = var_182_25

					if var_182_25 + var_182_18 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_25 + var_182_18
					end
				end

				arg_179_1.text_.text = var_182_22
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_26 = math.max(var_182_19, arg_179_1.talkMaxDuration)

			if var_182_18 <= arg_179_1.time_ and arg_179_1.time_ < var_182_18 + var_182_26 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_18) / var_182_26

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_18 + var_182_26 and arg_179_1.time_ < var_182_18 + var_182_26 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 1101106045
		arg_183_1.duration_ = 9

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play1101106046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = "ST04b"

			if arg_183_1.bgs_[var_186_0] == nil then
				local var_186_1 = Object.Instantiate(arg_183_1.paintGo_)

				var_186_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_186_0)
				var_186_1.name = var_186_0
				var_186_1.transform.parent = arg_183_1.stage_.transform
				var_186_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_183_1.bgs_[var_186_0] = var_186_1
			end

			local var_186_2 = 2

			if var_186_2 < arg_183_1.time_ and arg_183_1.time_ <= var_186_2 + arg_186_0 then
				local var_186_3 = manager.ui.mainCamera.transform.localPosition
				local var_186_4 = Vector3.New(0, 0, 10) + Vector3.New(var_186_3.x, var_186_3.y, 0)
				local var_186_5 = arg_183_1.bgs_.ST04b

				var_186_5.transform.localPosition = var_186_4
				var_186_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_186_6 = var_186_5:GetComponent("SpriteRenderer")

				if var_186_6 and var_186_6.sprite then
					local var_186_7 = (var_186_5.transform.localPosition - var_186_3).z
					local var_186_8 = manager.ui.mainCameraCom_
					local var_186_9 = 2 * var_186_7 * Mathf.Tan(var_186_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_186_10 = var_186_9 * var_186_8.aspect
					local var_186_11 = var_186_6.sprite.bounds.size.x
					local var_186_12 = var_186_6.sprite.bounds.size.y
					local var_186_13 = var_186_10 / var_186_11
					local var_186_14 = var_186_9 / var_186_12
					local var_186_15 = var_186_14 < var_186_13 and var_186_13 or var_186_14

					var_186_5.transform.localScale = Vector3.New(var_186_15, var_186_15, 0)
				end

				for iter_186_0, iter_186_1 in pairs(arg_183_1.bgs_) do
					if iter_186_0 ~= "ST04b" then
						iter_186_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_186_16 = 0

			if var_186_16 < arg_183_1.time_ and arg_183_1.time_ <= var_186_16 + arg_186_0 then
				arg_183_1.mask_.enabled = true
				arg_183_1.mask_.raycastTarget = true

				arg_183_1:SetGaussion(false)
			end

			local var_186_17 = 2

			if var_186_16 <= arg_183_1.time_ and arg_183_1.time_ < var_186_16 + var_186_17 then
				local var_186_18 = (arg_183_1.time_ - var_186_16) / var_186_17
				local var_186_19 = Color.New(0, 0, 0)

				var_186_19.a = Mathf.Lerp(0, 1, var_186_18)
				arg_183_1.mask_.color = var_186_19
			end

			if arg_183_1.time_ >= var_186_16 + var_186_17 and arg_183_1.time_ < var_186_16 + var_186_17 + arg_186_0 then
				local var_186_20 = Color.New(0, 0, 0)

				var_186_20.a = 1
				arg_183_1.mask_.color = var_186_20
			end

			local var_186_21 = 2

			if var_186_21 < arg_183_1.time_ and arg_183_1.time_ <= var_186_21 + arg_186_0 then
				arg_183_1.mask_.enabled = true
				arg_183_1.mask_.raycastTarget = true

				arg_183_1:SetGaussion(false)
			end

			local var_186_22 = 2

			if var_186_21 <= arg_183_1.time_ and arg_183_1.time_ < var_186_21 + var_186_22 then
				local var_186_23 = (arg_183_1.time_ - var_186_21) / var_186_22
				local var_186_24 = Color.New(0, 0, 0)

				var_186_24.a = Mathf.Lerp(1, 0, var_186_23)
				arg_183_1.mask_.color = var_186_24
			end

			if arg_183_1.time_ >= var_186_21 + var_186_22 and arg_183_1.time_ < var_186_21 + var_186_22 + arg_186_0 then
				local var_186_25 = Color.New(0, 0, 0)
				local var_186_26 = 0

				arg_183_1.mask_.enabled = false
				var_186_25.a = var_186_26
				arg_183_1.mask_.color = var_186_25
			end

			if arg_183_1.frameCnt_ <= 1 then
				arg_183_1.dialog_:SetActive(false)
			end

			local var_186_27 = 4
			local var_186_28 = 1.05

			if var_186_27 < arg_183_1.time_ and arg_183_1.time_ <= var_186_27 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0

				arg_183_1.dialog_:SetActive(true)

				local var_186_29 = LeanTween.value(arg_183_1.dialog_, 0, 1, 0.3)

				var_186_29:setOnUpdate(LuaHelper.FloatAction(function(arg_187_0)
					arg_183_1.dialogCg_.alpha = arg_187_0
				end))
				var_186_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_183_1.dialog_)
					var_186_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_183_1.duration_ = arg_183_1.duration_ + 0.3

				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_30 = arg_183_1:GetWordFromCfg(1101106045)
				local var_186_31 = arg_183_1:FormatText(var_186_30.content)

				arg_183_1.text_.text = var_186_31

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_32 = 42
				local var_186_33 = utf8.len(var_186_31)
				local var_186_34 = var_186_32 <= 0 and var_186_28 or var_186_28 * (var_186_33 / var_186_32)

				if var_186_34 > 0 and var_186_28 < var_186_34 then
					arg_183_1.talkMaxDuration = var_186_34
					var_186_27 = var_186_27 + 0.3

					if var_186_34 + var_186_27 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_34 + var_186_27
					end
				end

				arg_183_1.text_.text = var_186_31
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_35 = var_186_27 + 0.3
			local var_186_36 = math.max(var_186_28, arg_183_1.talkMaxDuration)

			if var_186_35 <= arg_183_1.time_ and arg_183_1.time_ < var_186_35 + var_186_36 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_35) / var_186_36

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_35 + var_186_36 and arg_183_1.time_ < var_186_35 + var_186_36 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 1101106046
		arg_189_1.duration_ = 9.966

		local var_189_0 = {
			zh = 7.9,
			ja = 9.966
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
				arg_189_0:Play1101106047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1111ui_story"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1111ui_story = var_192_0.localPosition
			end

			local var_192_2 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2
				local var_192_4 = Vector3.New(0, -0.83, -6)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1111ui_story, var_192_4, var_192_3)

				local var_192_5 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_5.x, var_192_5.y, var_192_5.z)

				local var_192_6 = var_192_0.localEulerAngles

				var_192_6.z = 0
				var_192_6.x = 0
				var_192_0.localEulerAngles = var_192_6
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(0, -0.83, -6)

				local var_192_7 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_7.x, var_192_7.y, var_192_7.z)

				local var_192_8 = var_192_0.localEulerAngles

				var_192_8.z = 0
				var_192_8.x = 0
				var_192_0.localEulerAngles = var_192_8
			end

			local var_192_9 = arg_189_1.actors_["1111ui_story"]
			local var_192_10 = 0

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 and arg_189_1.var_.characterEffect1111ui_story == nil then
				arg_189_1.var_.characterEffect1111ui_story = var_192_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_11 = 0.200000002980232

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_11 then
				local var_192_12 = (arg_189_1.time_ - var_192_10) / var_192_11

				if arg_189_1.var_.characterEffect1111ui_story then
					arg_189_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_10 + var_192_11 and arg_189_1.time_ < var_192_10 + var_192_11 + arg_192_0 and arg_189_1.var_.characterEffect1111ui_story then
				arg_189_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_192_13 = 0

			if var_192_13 < arg_189_1.time_ and arg_189_1.time_ <= var_192_13 + arg_192_0 then
				arg_189_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action8_1")
			end

			local var_192_14 = 0

			if var_192_14 < arg_189_1.time_ and arg_189_1.time_ <= var_192_14 + arg_192_0 then
				arg_189_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_192_15 = 0
			local var_192_16 = 0.925

			if var_192_15 < arg_189_1.time_ and arg_189_1.time_ <= var_192_15 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_17 = arg_189_1:FormatText(StoryNameCfg[67].name)

				arg_189_1.leftNameTxt_.text = var_192_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_18 = arg_189_1:GetWordFromCfg(1101106046)
				local var_192_19 = arg_189_1:FormatText(var_192_18.content)

				arg_189_1.text_.text = var_192_19

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_20 = 37
				local var_192_21 = utf8.len(var_192_19)
				local var_192_22 = var_192_20 <= 0 and var_192_16 or var_192_16 * (var_192_21 / var_192_20)

				if var_192_22 > 0 and var_192_16 < var_192_22 then
					arg_189_1.talkMaxDuration = var_192_22

					if var_192_22 + var_192_15 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_22 + var_192_15
					end
				end

				arg_189_1.text_.text = var_192_19
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb") ~= 0 then
					local var_192_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb") / 1000

					if var_192_23 + var_192_15 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_23 + var_192_15
					end

					if var_192_18.prefab_name ~= "" and arg_189_1.actors_[var_192_18.prefab_name] ~= nil then
						local var_192_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_18.prefab_name].transform, "story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb")

						arg_189_1:RecordAudio("1101106046", var_192_24)
						arg_189_1:RecordAudio("1101106046", var_192_24)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106046", "story_v_side_new_1101106.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_25 = math.max(var_192_16, arg_189_1.talkMaxDuration)

			if var_192_15 <= arg_189_1.time_ and arg_189_1.time_ < var_192_15 + var_192_25 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_15) / var_192_25

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_15 + var_192_25 and arg_189_1.time_ < var_192_15 + var_192_25 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 1101106047
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play1101106048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1111ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect1111ui_story == nil then
				arg_193_1.var_.characterEffect1111ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.200000002980232

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect1111ui_story then
					local var_196_4 = Mathf.Lerp(0, 0.5, var_196_3)

					arg_193_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1111ui_story.fillRatio = var_196_4
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect1111ui_story then
				local var_196_5 = 0.5

				arg_193_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1111ui_story.fillRatio = var_196_5
			end

			local var_196_6 = 0
			local var_196_7 = 0.05

			if var_196_6 < arg_193_1.time_ and arg_193_1.time_ <= var_196_6 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_8 = arg_193_1:FormatText(StoryNameCfg[583].name)

				arg_193_1.leftNameTxt_.text = var_196_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_9 = arg_193_1:GetWordFromCfg(1101106047)
				local var_196_10 = arg_193_1:FormatText(var_196_9.content)

				arg_193_1.text_.text = var_196_10

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_11 = 2
				local var_196_12 = utf8.len(var_196_10)
				local var_196_13 = var_196_11 <= 0 and var_196_7 or var_196_7 * (var_196_12 / var_196_11)

				if var_196_13 > 0 and var_196_7 < var_196_13 then
					arg_193_1.talkMaxDuration = var_196_13

					if var_196_13 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_13 + var_196_6
					end
				end

				arg_193_1.text_.text = var_196_10
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_14 = math.max(var_196_7, arg_193_1.talkMaxDuration)

			if var_196_6 <= arg_193_1.time_ and arg_193_1.time_ < var_196_6 + var_196_14 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_6) / var_196_14

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_6 + var_196_14 and arg_193_1.time_ < var_196_6 + var_196_14 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 1101106048
		arg_197_1.duration_ = 3.7

		local var_197_0 = {
			zh = 2.166,
			ja = 3.7
		}
		local var_197_1 = manager.audio:GetLocalizationFlag()

		if var_197_0[var_197_1] ~= nil then
			arg_197_1.duration_ = var_197_0[var_197_1]
		end

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play1101106049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1111ui_story"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos1111ui_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(0, -0.83, -6)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos1111ui_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(0, -0.83, -6)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["1111ui_story"]
			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 and arg_197_1.var_.characterEffect1111ui_story == nil then
				arg_197_1.var_.characterEffect1111ui_story = var_200_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_11 = 0.200000002980232

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11

				if arg_197_1.var_.characterEffect1111ui_story then
					arg_197_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 and arg_197_1.var_.characterEffect1111ui_story then
				arg_197_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_200_13 = 0

			if var_200_13 < arg_197_1.time_ and arg_197_1.time_ <= var_200_13 + arg_200_0 then
				arg_197_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_200_14 = 0
			local var_200_15 = 0.175

			if var_200_14 < arg_197_1.time_ and arg_197_1.time_ <= var_200_14 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_16 = arg_197_1:FormatText(StoryNameCfg[67].name)

				arg_197_1.leftNameTxt_.text = var_200_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_17 = arg_197_1:GetWordFromCfg(1101106048)
				local var_200_18 = arg_197_1:FormatText(var_200_17.content)

				arg_197_1.text_.text = var_200_18

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_19 = 7
				local var_200_20 = utf8.len(var_200_18)
				local var_200_21 = var_200_19 <= 0 and var_200_15 or var_200_15 * (var_200_20 / var_200_19)

				if var_200_21 > 0 and var_200_15 < var_200_21 then
					arg_197_1.talkMaxDuration = var_200_21

					if var_200_21 + var_200_14 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_21 + var_200_14
					end
				end

				arg_197_1.text_.text = var_200_18
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb") ~= 0 then
					local var_200_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb") / 1000

					if var_200_22 + var_200_14 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_22 + var_200_14
					end

					if var_200_17.prefab_name ~= "" and arg_197_1.actors_[var_200_17.prefab_name] ~= nil then
						local var_200_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_17.prefab_name].transform, "story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb")

						arg_197_1:RecordAudio("1101106048", var_200_23)
						arg_197_1:RecordAudio("1101106048", var_200_23)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106048", "story_v_side_new_1101106.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_24 = math.max(var_200_15, arg_197_1.talkMaxDuration)

			if var_200_14 <= arg_197_1.time_ and arg_197_1.time_ < var_200_14 + var_200_24 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_14) / var_200_24

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_14 + var_200_24 and arg_197_1.time_ < var_200_14 + var_200_24 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 1101106049
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play1101106050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1111ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect1111ui_story == nil then
				arg_201_1.var_.characterEffect1111ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.200000002980232

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect1111ui_story then
					local var_204_4 = Mathf.Lerp(0, 0.5, var_204_3)

					arg_201_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1111ui_story.fillRatio = var_204_4
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect1111ui_story then
				local var_204_5 = 0.5

				arg_201_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1111ui_story.fillRatio = var_204_5
			end

			local var_204_6 = 0
			local var_204_7 = 0.625

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_8 = arg_201_1:FormatText(StoryNameCfg[7].name)

				arg_201_1.leftNameTxt_.text = var_204_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_9 = arg_201_1:GetWordFromCfg(1101106049)
				local var_204_10 = arg_201_1:FormatText(var_204_9.content)

				arg_201_1.text_.text = var_204_10

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_11 = 25
				local var_204_12 = utf8.len(var_204_10)
				local var_204_13 = var_204_11 <= 0 and var_204_7 or var_204_7 * (var_204_12 / var_204_11)

				if var_204_13 > 0 and var_204_7 < var_204_13 then
					arg_201_1.talkMaxDuration = var_204_13

					if var_204_13 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_13 + var_204_6
					end
				end

				arg_201_1.text_.text = var_204_10
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_14 = math.max(var_204_7, arg_201_1.talkMaxDuration)

			if var_204_6 <= arg_201_1.time_ and arg_201_1.time_ < var_204_6 + var_204_14 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_6) / var_204_14

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_6 + var_204_14 and arg_201_1.time_ < var_204_6 + var_204_14 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 1101106050
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play1101106051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1111ui_story"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos1111ui_story = var_208_0.localPosition
			end

			local var_208_2 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2
				local var_208_4 = Vector3.New(0, 100, 0)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1111ui_story, var_208_4, var_208_3)

				local var_208_5 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_5.x, var_208_5.y, var_208_5.z)

				local var_208_6 = var_208_0.localEulerAngles

				var_208_6.z = 0
				var_208_6.x = 0
				var_208_0.localEulerAngles = var_208_6
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(0, 100, 0)

				local var_208_7 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_7.x, var_208_7.y, var_208_7.z)

				local var_208_8 = var_208_0.localEulerAngles

				var_208_8.z = 0
				var_208_8.x = 0
				var_208_0.localEulerAngles = var_208_8
			end

			local var_208_9 = 0
			local var_208_10 = 0.725

			if var_208_9 < arg_205_1.time_ and arg_205_1.time_ <= var_208_9 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, false)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_11 = arg_205_1:GetWordFromCfg(1101106050)
				local var_208_12 = arg_205_1:FormatText(var_208_11.content)

				arg_205_1.text_.text = var_208_12

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_13 = 29
				local var_208_14 = utf8.len(var_208_12)
				local var_208_15 = var_208_13 <= 0 and var_208_10 or var_208_10 * (var_208_14 / var_208_13)

				if var_208_15 > 0 and var_208_10 < var_208_15 then
					arg_205_1.talkMaxDuration = var_208_15

					if var_208_15 + var_208_9 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_15 + var_208_9
					end
				end

				arg_205_1.text_.text = var_208_12
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_16 = math.max(var_208_10, arg_205_1.talkMaxDuration)

			if var_208_9 <= arg_205_1.time_ and arg_205_1.time_ < var_208_9 + var_208_16 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_9) / var_208_16

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_9 + var_208_16 and arg_205_1.time_ < var_208_9 + var_208_16 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 1101106051
		arg_209_1.duration_ = 5.2

		local var_209_0 = {
			zh = 5.2,
			ja = 4.466
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
				arg_209_0:Play1101106052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1111ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1111ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, -0.83, -6)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1111ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -0.83, -6)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = arg_209_1.actors_["1111ui_story"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 and arg_209_1.var_.characterEffect1111ui_story == nil then
				arg_209_1.var_.characterEffect1111ui_story = var_212_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_11 = 0.200000002980232

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_11 then
				local var_212_12 = (arg_209_1.time_ - var_212_10) / var_212_11

				if arg_209_1.var_.characterEffect1111ui_story then
					arg_209_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_11 and arg_209_1.time_ < var_212_10 + var_212_11 + arg_212_0 and arg_209_1.var_.characterEffect1111ui_story then
				arg_209_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_212_13 = 0

			if var_212_13 < arg_209_1.time_ and arg_209_1.time_ <= var_212_13 + arg_212_0 then
				arg_209_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action9_1")
			end

			local var_212_14 = 0

			if var_212_14 < arg_209_1.time_ and arg_209_1.time_ <= var_212_14 + arg_212_0 then
				arg_209_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_212_15 = 0
			local var_212_16 = 0.5

			if var_212_15 < arg_209_1.time_ and arg_209_1.time_ <= var_212_15 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_17 = arg_209_1:FormatText(StoryNameCfg[67].name)

				arg_209_1.leftNameTxt_.text = var_212_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_18 = arg_209_1:GetWordFromCfg(1101106051)
				local var_212_19 = arg_209_1:FormatText(var_212_18.content)

				arg_209_1.text_.text = var_212_19

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_20 = 20
				local var_212_21 = utf8.len(var_212_19)
				local var_212_22 = var_212_20 <= 0 and var_212_16 or var_212_16 * (var_212_21 / var_212_20)

				if var_212_22 > 0 and var_212_16 < var_212_22 then
					arg_209_1.talkMaxDuration = var_212_22

					if var_212_22 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_22 + var_212_15
					end
				end

				arg_209_1.text_.text = var_212_19
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb") ~= 0 then
					local var_212_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb") / 1000

					if var_212_23 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_23 + var_212_15
					end

					if var_212_18.prefab_name ~= "" and arg_209_1.actors_[var_212_18.prefab_name] ~= nil then
						local var_212_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_18.prefab_name].transform, "story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb")

						arg_209_1:RecordAudio("1101106051", var_212_24)
						arg_209_1:RecordAudio("1101106051", var_212_24)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106051", "story_v_side_new_1101106.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_25 = math.max(var_212_16, arg_209_1.talkMaxDuration)

			if var_212_15 <= arg_209_1.time_ and arg_209_1.time_ < var_212_15 + var_212_25 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_15) / var_212_25

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_15 + var_212_25 and arg_209_1.time_ < var_212_15 + var_212_25 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 1101106052
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play1101106053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1111ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1111ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, 100, 0)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1111ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, 100, 0)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["1111ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect1111ui_story == nil then
				arg_213_1.var_.characterEffect1111ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect1111ui_story then
					local var_216_13 = Mathf.Lerp(0, 0.5, var_216_12)

					arg_213_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1111ui_story.fillRatio = var_216_13
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect1111ui_story then
				local var_216_14 = 0.5

				arg_213_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1111ui_story.fillRatio = var_216_14
			end

			local var_216_15 = 0
			local var_216_16 = 0.4

			if var_216_15 < arg_213_1.time_ and arg_213_1.time_ <= var_216_15 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_17 = arg_213_1:GetWordFromCfg(1101106052)
				local var_216_18 = arg_213_1:FormatText(var_216_17.content)

				arg_213_1.text_.text = var_216_18

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_19 = 16
				local var_216_20 = utf8.len(var_216_18)
				local var_216_21 = var_216_19 <= 0 and var_216_16 or var_216_16 * (var_216_20 / var_216_19)

				if var_216_21 > 0 and var_216_16 < var_216_21 then
					arg_213_1.talkMaxDuration = var_216_21

					if var_216_21 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_21 + var_216_15
					end
				end

				arg_213_1.text_.text = var_216_18
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_22 = math.max(var_216_16, arg_213_1.talkMaxDuration)

			if var_216_15 <= arg_213_1.time_ and arg_213_1.time_ < var_216_15 + var_216_22 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_15) / var_216_22

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_15 + var_216_22 and arg_213_1.time_ < var_216_15 + var_216_22 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 1101106053
		arg_217_1.duration_ = 8

		local var_217_0 = {
			zh = 5.4,
			ja = 8
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
				arg_217_0:Play1101106054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1011ui_story"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos1011ui_story = var_220_0.localPosition
			end

			local var_220_2 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2
				local var_220_4 = Vector3.New(0, -0.71, -6)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos1011ui_story, var_220_4, var_220_3)

				local var_220_5 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_5.x, var_220_5.y, var_220_5.z)

				local var_220_6 = var_220_0.localEulerAngles

				var_220_6.z = 0
				var_220_6.x = 0
				var_220_0.localEulerAngles = var_220_6
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_220_7 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_7.x, var_220_7.y, var_220_7.z)

				local var_220_8 = var_220_0.localEulerAngles

				var_220_8.z = 0
				var_220_8.x = 0
				var_220_0.localEulerAngles = var_220_8
			end

			local var_220_9 = arg_217_1.actors_["1011ui_story"]
			local var_220_10 = 0

			if var_220_10 < arg_217_1.time_ and arg_217_1.time_ <= var_220_10 + arg_220_0 and arg_217_1.var_.characterEffect1011ui_story == nil then
				arg_217_1.var_.characterEffect1011ui_story = var_220_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_11 = 0.200000002980232

			if var_220_10 <= arg_217_1.time_ and arg_217_1.time_ < var_220_10 + var_220_11 then
				local var_220_12 = (arg_217_1.time_ - var_220_10) / var_220_11

				if arg_217_1.var_.characterEffect1011ui_story then
					arg_217_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_10 + var_220_11 and arg_217_1.time_ < var_220_10 + var_220_11 + arg_220_0 and arg_217_1.var_.characterEffect1011ui_story then
				arg_217_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_220_13 = 0

			if var_220_13 < arg_217_1.time_ and arg_217_1.time_ <= var_220_13 + arg_220_0 then
				arg_217_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_220_14 = 0

			if var_220_14 < arg_217_1.time_ and arg_217_1.time_ <= var_220_14 + arg_220_0 then
				arg_217_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_220_15 = 0
			local var_220_16 = 0.6

			if var_220_15 < arg_217_1.time_ and arg_217_1.time_ <= var_220_15 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_17 = arg_217_1:FormatText(StoryNameCfg[37].name)

				arg_217_1.leftNameTxt_.text = var_220_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_18 = arg_217_1:GetWordFromCfg(1101106053)
				local var_220_19 = arg_217_1:FormatText(var_220_18.content)

				arg_217_1.text_.text = var_220_19

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_20 = 24
				local var_220_21 = utf8.len(var_220_19)
				local var_220_22 = var_220_20 <= 0 and var_220_16 or var_220_16 * (var_220_21 / var_220_20)

				if var_220_22 > 0 and var_220_16 < var_220_22 then
					arg_217_1.talkMaxDuration = var_220_22

					if var_220_22 + var_220_15 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_22 + var_220_15
					end
				end

				arg_217_1.text_.text = var_220_19
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb") ~= 0 then
					local var_220_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb") / 1000

					if var_220_23 + var_220_15 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_23 + var_220_15
					end

					if var_220_18.prefab_name ~= "" and arg_217_1.actors_[var_220_18.prefab_name] ~= nil then
						local var_220_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_18.prefab_name].transform, "story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb")

						arg_217_1:RecordAudio("1101106053", var_220_24)
						arg_217_1:RecordAudio("1101106053", var_220_24)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106053", "story_v_side_new_1101106.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_25 = math.max(var_220_16, arg_217_1.talkMaxDuration)

			if var_220_15 <= arg_217_1.time_ and arg_217_1.time_ < var_220_15 + var_220_25 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_15) / var_220_25

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_15 + var_220_25 and arg_217_1.time_ < var_220_15 + var_220_25 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 1101106054
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play1101106055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1011ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1011ui_story == nil then
				arg_221_1.var_.characterEffect1011ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.200000002980232

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1011ui_story then
					local var_224_4 = Mathf.Lerp(0, 0.5, var_224_3)

					arg_221_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1011ui_story.fillRatio = var_224_4
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1011ui_story then
				local var_224_5 = 0.5

				arg_221_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1011ui_story.fillRatio = var_224_5
			end

			local var_224_6 = 0
			local var_224_7 = 0.5

			if var_224_6 < arg_221_1.time_ and arg_221_1.time_ <= var_224_6 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_8 = arg_221_1:FormatText(StoryNameCfg[7].name)

				arg_221_1.leftNameTxt_.text = var_224_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_9 = arg_221_1:GetWordFromCfg(1101106054)
				local var_224_10 = arg_221_1:FormatText(var_224_9.content)

				arg_221_1.text_.text = var_224_10

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_11 = 20
				local var_224_12 = utf8.len(var_224_10)
				local var_224_13 = var_224_11 <= 0 and var_224_7 or var_224_7 * (var_224_12 / var_224_11)

				if var_224_13 > 0 and var_224_7 < var_224_13 then
					arg_221_1.talkMaxDuration = var_224_13

					if var_224_13 + var_224_6 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_13 + var_224_6
					end
				end

				arg_221_1.text_.text = var_224_10
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_14 = math.max(var_224_7, arg_221_1.talkMaxDuration)

			if var_224_6 <= arg_221_1.time_ and arg_221_1.time_ < var_224_6 + var_224_14 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_6) / var_224_14

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_6 + var_224_14 and arg_221_1.time_ < var_224_6 + var_224_14 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 1101106055
		arg_225_1.duration_ = 7.9

		local var_225_0 = {
			zh = 6.1,
			ja = 7.9
		}
		local var_225_1 = manager.audio:GetLocalizationFlag()

		if var_225_0[var_225_1] ~= nil then
			arg_225_1.duration_ = var_225_0[var_225_1]
		end

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play1101106056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1011ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1011ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(0, -0.71, -6)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1011ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = arg_225_1.actors_["1011ui_story"]
			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 and arg_225_1.var_.characterEffect1011ui_story == nil then
				arg_225_1.var_.characterEffect1011ui_story = var_228_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_11 = 0.200000002980232

			if var_228_10 <= arg_225_1.time_ and arg_225_1.time_ < var_228_10 + var_228_11 then
				local var_228_12 = (arg_225_1.time_ - var_228_10) / var_228_11

				if arg_225_1.var_.characterEffect1011ui_story then
					arg_225_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_10 + var_228_11 and arg_225_1.time_ < var_228_10 + var_228_11 + arg_228_0 and arg_225_1.var_.characterEffect1011ui_story then
				arg_225_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_228_13 = 0

			if var_228_13 < arg_225_1.time_ and arg_225_1.time_ <= var_228_13 + arg_228_0 then
				arg_225_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_228_14 = 0

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 then
				arg_225_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_228_15 = 0
			local var_228_16 = 0.65

			if var_228_15 < arg_225_1.time_ and arg_225_1.time_ <= var_228_15 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_17 = arg_225_1:FormatText(StoryNameCfg[37].name)

				arg_225_1.leftNameTxt_.text = var_228_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_18 = arg_225_1:GetWordFromCfg(1101106055)
				local var_228_19 = arg_225_1:FormatText(var_228_18.content)

				arg_225_1.text_.text = var_228_19

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_20 = 26
				local var_228_21 = utf8.len(var_228_19)
				local var_228_22 = var_228_20 <= 0 and var_228_16 or var_228_16 * (var_228_21 / var_228_20)

				if var_228_22 > 0 and var_228_16 < var_228_22 then
					arg_225_1.talkMaxDuration = var_228_22

					if var_228_22 + var_228_15 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_22 + var_228_15
					end
				end

				arg_225_1.text_.text = var_228_19
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb") ~= 0 then
					local var_228_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb") / 1000

					if var_228_23 + var_228_15 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_23 + var_228_15
					end

					if var_228_18.prefab_name ~= "" and arg_225_1.actors_[var_228_18.prefab_name] ~= nil then
						local var_228_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_18.prefab_name].transform, "story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb")

						arg_225_1:RecordAudio("1101106055", var_228_24)
						arg_225_1:RecordAudio("1101106055", var_228_24)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106055", "story_v_side_new_1101106.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_25 = math.max(var_228_16, arg_225_1.talkMaxDuration)

			if var_228_15 <= arg_225_1.time_ and arg_225_1.time_ < var_228_15 + var_228_25 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_15) / var_228_25

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_15 + var_228_25 and arg_225_1.time_ < var_228_15 + var_228_25 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 1101106056
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play1101106057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1011ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.characterEffect1011ui_story == nil then
				arg_229_1.var_.characterEffect1011ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.200000002980232

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1011ui_story then
					local var_232_4 = Mathf.Lerp(0, 0.5, var_232_3)

					arg_229_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_229_1.var_.characterEffect1011ui_story.fillRatio = var_232_4
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1011ui_story then
				local var_232_5 = 0.5

				arg_229_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_229_1.var_.characterEffect1011ui_story.fillRatio = var_232_5
			end

			local var_232_6 = 0
			local var_232_7 = 0.725

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_8 = arg_229_1:FormatText(StoryNameCfg[7].name)

				arg_229_1.leftNameTxt_.text = var_232_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_9 = arg_229_1:GetWordFromCfg(1101106056)
				local var_232_10 = arg_229_1:FormatText(var_232_9.content)

				arg_229_1.text_.text = var_232_10

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_11 = 29
				local var_232_12 = utf8.len(var_232_10)
				local var_232_13 = var_232_11 <= 0 and var_232_7 or var_232_7 * (var_232_12 / var_232_11)

				if var_232_13 > 0 and var_232_7 < var_232_13 then
					arg_229_1.talkMaxDuration = var_232_13

					if var_232_13 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_13 + var_232_6
					end
				end

				arg_229_1.text_.text = var_232_10
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_14 = math.max(var_232_7, arg_229_1.talkMaxDuration)

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_14 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_6) / var_232_14

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_6 + var_232_14 and arg_229_1.time_ < var_232_6 + var_232_14 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 1101106057
		arg_233_1.duration_ = 4.2

		local var_233_0 = {
			zh = 2.466,
			ja = 4.2
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
				arg_233_0:Play1101106058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1011ui_story"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos1011ui_story = var_236_0.localPosition
			end

			local var_236_2 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2
				local var_236_4 = Vector3.New(0, -0.71, -6)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1011ui_story, var_236_4, var_236_3)

				local var_236_5 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_5.x, var_236_5.y, var_236_5.z)

				local var_236_6 = var_236_0.localEulerAngles

				var_236_6.z = 0
				var_236_6.x = 0
				var_236_0.localEulerAngles = var_236_6
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_236_7 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_7.x, var_236_7.y, var_236_7.z)

				local var_236_8 = var_236_0.localEulerAngles

				var_236_8.z = 0
				var_236_8.x = 0
				var_236_0.localEulerAngles = var_236_8
			end

			local var_236_9 = arg_233_1.actors_["1011ui_story"]
			local var_236_10 = 0

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 and arg_233_1.var_.characterEffect1011ui_story == nil then
				arg_233_1.var_.characterEffect1011ui_story = var_236_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_11 = 0.200000002980232

			if var_236_10 <= arg_233_1.time_ and arg_233_1.time_ < var_236_10 + var_236_11 then
				local var_236_12 = (arg_233_1.time_ - var_236_10) / var_236_11

				if arg_233_1.var_.characterEffect1011ui_story then
					arg_233_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_10 + var_236_11 and arg_233_1.time_ < var_236_10 + var_236_11 + arg_236_0 and arg_233_1.var_.characterEffect1011ui_story then
				arg_233_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_236_13 = 0

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_2")
			end

			local var_236_14 = 0

			if var_236_14 < arg_233_1.time_ and arg_233_1.time_ <= var_236_14 + arg_236_0 then
				arg_233_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_236_15 = 0
			local var_236_16 = 0.225

			if var_236_15 < arg_233_1.time_ and arg_233_1.time_ <= var_236_15 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_17 = arg_233_1:FormatText(StoryNameCfg[37].name)

				arg_233_1.leftNameTxt_.text = var_236_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_18 = arg_233_1:GetWordFromCfg(1101106057)
				local var_236_19 = arg_233_1:FormatText(var_236_18.content)

				arg_233_1.text_.text = var_236_19

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_20 = 9
				local var_236_21 = utf8.len(var_236_19)
				local var_236_22 = var_236_20 <= 0 and var_236_16 or var_236_16 * (var_236_21 / var_236_20)

				if var_236_22 > 0 and var_236_16 < var_236_22 then
					arg_233_1.talkMaxDuration = var_236_22

					if var_236_22 + var_236_15 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_22 + var_236_15
					end
				end

				arg_233_1.text_.text = var_236_19
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb") ~= 0 then
					local var_236_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb") / 1000

					if var_236_23 + var_236_15 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_23 + var_236_15
					end

					if var_236_18.prefab_name ~= "" and arg_233_1.actors_[var_236_18.prefab_name] ~= nil then
						local var_236_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_18.prefab_name].transform, "story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb")

						arg_233_1:RecordAudio("1101106057", var_236_24)
						arg_233_1:RecordAudio("1101106057", var_236_24)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106057", "story_v_side_new_1101106.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_25 = math.max(var_236_16, arg_233_1.talkMaxDuration)

			if var_236_15 <= arg_233_1.time_ and arg_233_1.time_ < var_236_15 + var_236_25 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_15) / var_236_25

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_15 + var_236_25 and arg_233_1.time_ < var_236_15 + var_236_25 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 1101106058
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play1101106059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1011ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1011ui_story == nil then
				arg_237_1.var_.characterEffect1011ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

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
			local var_240_7 = 1.05

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_8 = arg_237_1:FormatText(StoryNameCfg[7].name)

				arg_237_1.leftNameTxt_.text = var_240_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_9 = arg_237_1:GetWordFromCfg(1101106058)
				local var_240_10 = arg_237_1:FormatText(var_240_9.content)

				arg_237_1.text_.text = var_240_10

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_11 = 42
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
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_14 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_14 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_14

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_14 and arg_237_1.time_ < var_240_6 + var_240_14 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 1101106059
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play1101106060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_244_1 = 0
			local var_244_2 = 1.075

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_3 = arg_241_1:GetWordFromCfg(1101106059)
				local var_244_4 = arg_241_1:FormatText(var_244_3.content)

				arg_241_1.text_.text = var_244_4

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_5 = 43
				local var_244_6 = utf8.len(var_244_4)
				local var_244_7 = var_244_5 <= 0 and var_244_2 or var_244_2 * (var_244_6 / var_244_5)

				if var_244_7 > 0 and var_244_2 < var_244_7 then
					arg_241_1.talkMaxDuration = var_244_7

					if var_244_7 + var_244_1 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_7 + var_244_1
					end
				end

				arg_241_1.text_.text = var_244_4
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_8 = math.max(var_244_2, arg_241_1.talkMaxDuration)

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_8 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_1) / var_244_8

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_1 + var_244_8 and arg_241_1.time_ < var_244_1 + var_244_8 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 1101106060
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play1101106061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0
			local var_248_1 = 0.125

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_2 = arg_245_1:FormatText(StoryNameCfg[7].name)

				arg_245_1.leftNameTxt_.text = var_248_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_3 = arg_245_1:GetWordFromCfg(1101106060)
				local var_248_4 = arg_245_1:FormatText(var_248_3.content)

				arg_245_1.text_.text = var_248_4

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_5 = 5
				local var_248_6 = utf8.len(var_248_4)
				local var_248_7 = var_248_5 <= 0 and var_248_1 or var_248_1 * (var_248_6 / var_248_5)

				if var_248_7 > 0 and var_248_1 < var_248_7 then
					arg_245_1.talkMaxDuration = var_248_7

					if var_248_7 + var_248_0 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_7 + var_248_0
					end
				end

				arg_245_1.text_.text = var_248_4
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_8 = math.max(var_248_1, arg_245_1.talkMaxDuration)

			if var_248_0 <= arg_245_1.time_ and arg_245_1.time_ < var_248_0 + var_248_8 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_0) / var_248_8

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_0 + var_248_8 and arg_245_1.time_ < var_248_0 + var_248_8 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 1101106061
		arg_249_1.duration_ = 4.3

		local var_249_0 = {
			zh = 4.166,
			ja = 4.3
		}
		local var_249_1 = manager.audio:GetLocalizationFlag()

		if var_249_0[var_249_1] ~= nil then
			arg_249_1.duration_ = var_249_0[var_249_1]
		end

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play1101106062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1011ui_story"].transform
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.var_.moveOldPos1011ui_story = var_252_0.localPosition
			end

			local var_252_2 = 0.001

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2
				local var_252_4 = Vector3.New(0, -0.71, -6)

				var_252_0.localPosition = Vector3.Lerp(arg_249_1.var_.moveOldPos1011ui_story, var_252_4, var_252_3)

				local var_252_5 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_5.x, var_252_5.y, var_252_5.z)

				local var_252_6 = var_252_0.localEulerAngles

				var_252_6.z = 0
				var_252_6.x = 0
				var_252_0.localEulerAngles = var_252_6
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 then
				var_252_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_252_7 = manager.ui.mainCamera.transform.position - var_252_0.position

				var_252_0.forward = Vector3.New(var_252_7.x, var_252_7.y, var_252_7.z)

				local var_252_8 = var_252_0.localEulerAngles

				var_252_8.z = 0
				var_252_8.x = 0
				var_252_0.localEulerAngles = var_252_8
			end

			local var_252_9 = arg_249_1.actors_["1011ui_story"]
			local var_252_10 = 0

			if var_252_10 < arg_249_1.time_ and arg_249_1.time_ <= var_252_10 + arg_252_0 and arg_249_1.var_.characterEffect1011ui_story == nil then
				arg_249_1.var_.characterEffect1011ui_story = var_252_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_11 = 0.200000002980232

			if var_252_10 <= arg_249_1.time_ and arg_249_1.time_ < var_252_10 + var_252_11 then
				local var_252_12 = (arg_249_1.time_ - var_252_10) / var_252_11

				if arg_249_1.var_.characterEffect1011ui_story then
					arg_249_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_249_1.time_ >= var_252_10 + var_252_11 and arg_249_1.time_ < var_252_10 + var_252_11 + arg_252_0 and arg_249_1.var_.characterEffect1011ui_story then
				arg_249_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_252_13 = 0

			if var_252_13 < arg_249_1.time_ and arg_249_1.time_ <= var_252_13 + arg_252_0 then
				arg_249_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_252_14 = 0

			if var_252_14 < arg_249_1.time_ and arg_249_1.time_ <= var_252_14 + arg_252_0 then
				arg_249_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_252_15 = 0
			local var_252_16 = 0.375

			if var_252_15 < arg_249_1.time_ and arg_249_1.time_ <= var_252_15 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_17 = arg_249_1:FormatText(StoryNameCfg[37].name)

				arg_249_1.leftNameTxt_.text = var_252_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_18 = arg_249_1:GetWordFromCfg(1101106061)
				local var_252_19 = arg_249_1:FormatText(var_252_18.content)

				arg_249_1.text_.text = var_252_19

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_20 = 15
				local var_252_21 = utf8.len(var_252_19)
				local var_252_22 = var_252_20 <= 0 and var_252_16 or var_252_16 * (var_252_21 / var_252_20)

				if var_252_22 > 0 and var_252_16 < var_252_22 then
					arg_249_1.talkMaxDuration = var_252_22

					if var_252_22 + var_252_15 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_22 + var_252_15
					end
				end

				arg_249_1.text_.text = var_252_19
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb") ~= 0 then
					local var_252_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb") / 1000

					if var_252_23 + var_252_15 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_23 + var_252_15
					end

					if var_252_18.prefab_name ~= "" and arg_249_1.actors_[var_252_18.prefab_name] ~= nil then
						local var_252_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_18.prefab_name].transform, "story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb")

						arg_249_1:RecordAudio("1101106061", var_252_24)
						arg_249_1:RecordAudio("1101106061", var_252_24)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106061", "story_v_side_new_1101106.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_25 = math.max(var_252_16, arg_249_1.talkMaxDuration)

			if var_252_15 <= arg_249_1.time_ and arg_249_1.time_ < var_252_15 + var_252_25 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_15) / var_252_25

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_15 + var_252_25 and arg_249_1.time_ < var_252_15 + var_252_25 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 1101106062
		arg_253_1.duration_ = 5.933

		local var_253_0 = {
			zh = 3.933,
			ja = 5.933
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
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play1101106063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.375

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[37].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(1101106062)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 15
				local var_256_6 = utf8.len(var_256_4)
				local var_256_7 = var_256_5 <= 0 and var_256_1 or var_256_1 * (var_256_6 / var_256_5)

				if var_256_7 > 0 and var_256_1 < var_256_7 then
					arg_253_1.talkMaxDuration = var_256_7

					if var_256_7 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_7 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_4
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb")

						arg_253_1:RecordAudio("1101106062", var_256_9)
						arg_253_1:RecordAudio("1101106062", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106062", "story_v_side_new_1101106.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_10 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_10 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_0) / var_256_10

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_10 and arg_253_1.time_ < var_256_0 + var_256_10 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 1101106063
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play1101106064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1011ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect1011ui_story == nil then
				arg_257_1.var_.characterEffect1011ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.200000002980232

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect1011ui_story then
					local var_260_4 = Mathf.Lerp(0, 0.5, var_260_3)

					arg_257_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_257_1.var_.characterEffect1011ui_story.fillRatio = var_260_4
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect1011ui_story then
				local var_260_5 = 0.5

				arg_257_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_257_1.var_.characterEffect1011ui_story.fillRatio = var_260_5
			end

			local var_260_6 = 0

			if var_260_6 < arg_257_1.time_ and arg_257_1.time_ <= var_260_6 + arg_260_0 then
				arg_257_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_2")
			end

			local var_260_7 = 0
			local var_260_8 = 1.1

			if var_260_7 < arg_257_1.time_ and arg_257_1.time_ <= var_260_7 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, false)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_9 = arg_257_1:GetWordFromCfg(1101106063)
				local var_260_10 = arg_257_1:FormatText(var_260_9.content)

				arg_257_1.text_.text = var_260_10

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_11 = 44
				local var_260_12 = utf8.len(var_260_10)
				local var_260_13 = var_260_11 <= 0 and var_260_8 or var_260_8 * (var_260_12 / var_260_11)

				if var_260_13 > 0 and var_260_8 < var_260_13 then
					arg_257_1.talkMaxDuration = var_260_13

					if var_260_13 + var_260_7 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_13 + var_260_7
					end
				end

				arg_257_1.text_.text = var_260_10
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_14 = math.max(var_260_8, arg_257_1.talkMaxDuration)

			if var_260_7 <= arg_257_1.time_ and arg_257_1.time_ < var_260_7 + var_260_14 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_7) / var_260_14

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_7 + var_260_14 and arg_257_1.time_ < var_260_7 + var_260_14 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 1101106064
		arg_261_1.duration_ = 4.466

		local var_261_0 = {
			zh = 1.533,
			ja = 4.466
		}
		local var_261_1 = manager.audio:GetLocalizationFlag()

		if var_261_0[var_261_1] ~= nil then
			arg_261_1.duration_ = var_261_0[var_261_1]
		end

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play1101106065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 0.175

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[146].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, true)
				arg_261_1.iconController_:SetSelectedState("hero")

				arg_261_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(1101106064)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 7
				local var_264_6 = utf8.len(var_264_4)
				local var_264_7 = var_264_5 <= 0 and var_264_1 or var_264_1 * (var_264_6 / var_264_5)

				if var_264_7 > 0 and var_264_1 < var_264_7 then
					arg_261_1.talkMaxDuration = var_264_7

					if var_264_7 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_7 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_4
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb") ~= 0 then
					local var_264_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb") / 1000

					if var_264_8 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_8 + var_264_0
					end

					if var_264_3.prefab_name ~= "" and arg_261_1.actors_[var_264_3.prefab_name] ~= nil then
						local var_264_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_3.prefab_name].transform, "story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb")

						arg_261_1:RecordAudio("1101106064", var_264_9)
						arg_261_1:RecordAudio("1101106064", var_264_9)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106064", "story_v_side_new_1101106.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_10 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_10 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_10

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_10 and arg_261_1.time_ < var_264_0 + var_264_10 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 1101106065
		arg_265_1.duration_ = 1.999999999999

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play1101106066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1011ui_story"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos1011ui_story = var_268_0.localPosition
			end

			local var_268_2 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2
				local var_268_4 = Vector3.New(0, -0.71, -6)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1011ui_story, var_268_4, var_268_3)

				local var_268_5 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_5.x, var_268_5.y, var_268_5.z)

				local var_268_6 = var_268_0.localEulerAngles

				var_268_6.z = 0
				var_268_6.x = 0
				var_268_0.localEulerAngles = var_268_6
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_268_7 = manager.ui.mainCamera.transform.position - var_268_0.position

				var_268_0.forward = Vector3.New(var_268_7.x, var_268_7.y, var_268_7.z)

				local var_268_8 = var_268_0.localEulerAngles

				var_268_8.z = 0
				var_268_8.x = 0
				var_268_0.localEulerAngles = var_268_8
			end

			local var_268_9 = arg_265_1.actors_["1011ui_story"]
			local var_268_10 = 0

			if var_268_10 < arg_265_1.time_ and arg_265_1.time_ <= var_268_10 + arg_268_0 and arg_265_1.var_.characterEffect1011ui_story == nil then
				arg_265_1.var_.characterEffect1011ui_story = var_268_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_11 = 0.200000002980232

			if var_268_10 <= arg_265_1.time_ and arg_265_1.time_ < var_268_10 + var_268_11 then
				local var_268_12 = (arg_265_1.time_ - var_268_10) / var_268_11

				if arg_265_1.var_.characterEffect1011ui_story then
					arg_265_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_265_1.time_ >= var_268_10 + var_268_11 and arg_265_1.time_ < var_268_10 + var_268_11 + arg_268_0 and arg_265_1.var_.characterEffect1011ui_story then
				arg_265_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_268_13 = 0

			if var_268_13 < arg_265_1.time_ and arg_265_1.time_ <= var_268_13 + arg_268_0 then
				arg_265_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_268_14 = 0

			if var_268_14 < arg_265_1.time_ and arg_265_1.time_ <= var_268_14 + arg_268_0 then
				arg_265_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_268_15 = 0
			local var_268_16 = 0.075

			if var_268_15 < arg_265_1.time_ and arg_265_1.time_ <= var_268_15 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_17 = arg_265_1:FormatText(StoryNameCfg[37].name)

				arg_265_1.leftNameTxt_.text = var_268_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_18 = arg_265_1:GetWordFromCfg(1101106065)
				local var_268_19 = arg_265_1:FormatText(var_268_18.content)

				arg_265_1.text_.text = var_268_19

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_20 = 3
				local var_268_21 = utf8.len(var_268_19)
				local var_268_22 = var_268_20 <= 0 and var_268_16 or var_268_16 * (var_268_21 / var_268_20)

				if var_268_22 > 0 and var_268_16 < var_268_22 then
					arg_265_1.talkMaxDuration = var_268_22

					if var_268_22 + var_268_15 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_22 + var_268_15
					end
				end

				arg_265_1.text_.text = var_268_19
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb") ~= 0 then
					local var_268_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb") / 1000

					if var_268_23 + var_268_15 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_23 + var_268_15
					end

					if var_268_18.prefab_name ~= "" and arg_265_1.actors_[var_268_18.prefab_name] ~= nil then
						local var_268_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_18.prefab_name].transform, "story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb")

						arg_265_1:RecordAudio("1101106065", var_268_24)
						arg_265_1:RecordAudio("1101106065", var_268_24)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106065", "story_v_side_new_1101106.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_25 = math.max(var_268_16, arg_265_1.talkMaxDuration)

			if var_268_15 <= arg_265_1.time_ and arg_265_1.time_ < var_268_15 + var_268_25 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_15) / var_268_25

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_15 + var_268_25 and arg_265_1.time_ < var_268_15 + var_268_25 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 1101106066
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play1101106067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1011ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect1011ui_story == nil then
				arg_269_1.var_.characterEffect1011ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.200000002980232

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1011ui_story then
					local var_272_4 = Mathf.Lerp(0, 0.5, var_272_3)

					arg_269_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1011ui_story.fillRatio = var_272_4
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1011ui_story then
				local var_272_5 = 0.5

				arg_269_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1011ui_story.fillRatio = var_272_5
			end

			local var_272_6 = 0
			local var_272_7 = 0.525

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_8 = arg_269_1:GetWordFromCfg(1101106066)
				local var_272_9 = arg_269_1:FormatText(var_272_8.content)

				arg_269_1.text_.text = var_272_9

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_10 = 38
				local var_272_11 = utf8.len(var_272_9)
				local var_272_12 = var_272_10 <= 0 and var_272_7 or var_272_7 * (var_272_11 / var_272_10)

				if var_272_12 > 0 and var_272_7 < var_272_12 then
					arg_269_1.talkMaxDuration = var_272_12

					if var_272_12 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_12 + var_272_6
					end
				end

				arg_269_1.text_.text = var_272_9
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_13 = math.max(var_272_7, arg_269_1.talkMaxDuration)

			if var_272_6 <= arg_269_1.time_ and arg_269_1.time_ < var_272_6 + var_272_13 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_6) / var_272_13

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_6 + var_272_13 and arg_269_1.time_ < var_272_6 + var_272_13 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 1101106067
		arg_273_1.duration_ = 6.733

		local var_273_0 = {
			zh = 3.7,
			ja = 6.733
		}
		local var_273_1 = manager.audio:GetLocalizationFlag()

		if var_273_0[var_273_1] ~= nil then
			arg_273_1.duration_ = var_273_0[var_273_1]
		end

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play1101106068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.525

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_2 = arg_273_1:FormatText(StoryNameCfg[146].name)

				arg_273_1.leftNameTxt_.text = var_276_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, true)
				arg_273_1.iconController_:SetSelectedState("hero")

				arg_273_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_3 = arg_273_1:GetWordFromCfg(1101106067)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 21
				local var_276_6 = utf8.len(var_276_4)
				local var_276_7 = var_276_5 <= 0 and var_276_1 or var_276_1 * (var_276_6 / var_276_5)

				if var_276_7 > 0 and var_276_1 < var_276_7 then
					arg_273_1.talkMaxDuration = var_276_7

					if var_276_7 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_7 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_4
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb") ~= 0 then
					local var_276_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb") / 1000

					if var_276_8 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_8 + var_276_0
					end

					if var_276_3.prefab_name ~= "" and arg_273_1.actors_[var_276_3.prefab_name] ~= nil then
						local var_276_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_3.prefab_name].transform, "story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb")

						arg_273_1:RecordAudio("1101106067", var_276_9)
						arg_273_1:RecordAudio("1101106067", var_276_9)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106067", "story_v_side_new_1101106.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_10 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_10 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_10

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_10 and arg_273_1.time_ < var_276_0 + var_276_10 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 1101106068
		arg_277_1.duration_ = 4.633

		local var_277_0 = {
			zh = 3.566,
			ja = 4.633
		}
		local var_277_1 = manager.audio:GetLocalizationFlag()

		if var_277_0[var_277_1] ~= nil then
			arg_277_1.duration_ = var_277_0[var_277_1]
		end

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play1101106069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1011ui_story"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos1011ui_story = var_280_0.localPosition
			end

			local var_280_2 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2
				local var_280_4 = Vector3.New(0, -0.71, -6)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1011ui_story, var_280_4, var_280_3)

				local var_280_5 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_5.x, var_280_5.y, var_280_5.z)

				local var_280_6 = var_280_0.localEulerAngles

				var_280_6.z = 0
				var_280_6.x = 0
				var_280_0.localEulerAngles = var_280_6
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 then
				var_280_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_280_7 = manager.ui.mainCamera.transform.position - var_280_0.position

				var_280_0.forward = Vector3.New(var_280_7.x, var_280_7.y, var_280_7.z)

				local var_280_8 = var_280_0.localEulerAngles

				var_280_8.z = 0
				var_280_8.x = 0
				var_280_0.localEulerAngles = var_280_8
			end

			local var_280_9 = arg_277_1.actors_["1011ui_story"]
			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 and arg_277_1.var_.characterEffect1011ui_story == nil then
				arg_277_1.var_.characterEffect1011ui_story = var_280_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_11 = 0.200000002980232

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_11 then
				local var_280_12 = (arg_277_1.time_ - var_280_10) / var_280_11

				if arg_277_1.var_.characterEffect1011ui_story then
					arg_277_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_10 + var_280_11 and arg_277_1.time_ < var_280_10 + var_280_11 + arg_280_0 and arg_277_1.var_.characterEffect1011ui_story then
				arg_277_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_280_13 = 0

			if var_280_13 < arg_277_1.time_ and arg_277_1.time_ <= var_280_13 + arg_280_0 then
				arg_277_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_280_14 = 0
			local var_280_15 = 0.3

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_16 = arg_277_1:FormatText(StoryNameCfg[37].name)

				arg_277_1.leftNameTxt_.text = var_280_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_17 = arg_277_1:GetWordFromCfg(1101106068)
				local var_280_18 = arg_277_1:FormatText(var_280_17.content)

				arg_277_1.text_.text = var_280_18

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_19 = 12
				local var_280_20 = utf8.len(var_280_18)
				local var_280_21 = var_280_19 <= 0 and var_280_15 or var_280_15 * (var_280_20 / var_280_19)

				if var_280_21 > 0 and var_280_15 < var_280_21 then
					arg_277_1.talkMaxDuration = var_280_21

					if var_280_21 + var_280_14 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_21 + var_280_14
					end
				end

				arg_277_1.text_.text = var_280_18
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb") ~= 0 then
					local var_280_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb") / 1000

					if var_280_22 + var_280_14 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_22 + var_280_14
					end

					if var_280_17.prefab_name ~= "" and arg_277_1.actors_[var_280_17.prefab_name] ~= nil then
						local var_280_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_17.prefab_name].transform, "story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb")

						arg_277_1:RecordAudio("1101106068", var_280_23)
						arg_277_1:RecordAudio("1101106068", var_280_23)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106068", "story_v_side_new_1101106.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_24 = math.max(var_280_15, arg_277_1.talkMaxDuration)

			if var_280_14 <= arg_277_1.time_ and arg_277_1.time_ < var_280_14 + var_280_24 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_14) / var_280_24

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_14 + var_280_24 and arg_277_1.time_ < var_280_14 + var_280_24 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 1101106069
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play1101106070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1011ui_story"].transform
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.var_.moveOldPos1011ui_story = var_284_0.localPosition
			end

			local var_284_2 = 0.001

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2
				local var_284_4 = Vector3.New(0, 100, 0)

				var_284_0.localPosition = Vector3.Lerp(arg_281_1.var_.moveOldPos1011ui_story, var_284_4, var_284_3)

				local var_284_5 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_5.x, var_284_5.y, var_284_5.z)

				local var_284_6 = var_284_0.localEulerAngles

				var_284_6.z = 0
				var_284_6.x = 0
				var_284_0.localEulerAngles = var_284_6
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 then
				var_284_0.localPosition = Vector3.New(0, 100, 0)

				local var_284_7 = manager.ui.mainCamera.transform.position - var_284_0.position

				var_284_0.forward = Vector3.New(var_284_7.x, var_284_7.y, var_284_7.z)

				local var_284_8 = var_284_0.localEulerAngles

				var_284_8.z = 0
				var_284_8.x = 0
				var_284_0.localEulerAngles = var_284_8
			end

			local var_284_9 = arg_281_1.actors_["1011ui_story"]
			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 and arg_281_1.var_.characterEffect1011ui_story == nil then
				arg_281_1.var_.characterEffect1011ui_story = var_284_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_11 = 0.200000002980232

			if var_284_10 <= arg_281_1.time_ and arg_281_1.time_ < var_284_10 + var_284_11 then
				local var_284_12 = (arg_281_1.time_ - var_284_10) / var_284_11

				if arg_281_1.var_.characterEffect1011ui_story then
					local var_284_13 = Mathf.Lerp(0, 0.5, var_284_12)

					arg_281_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1011ui_story.fillRatio = var_284_13
				end
			end

			if arg_281_1.time_ >= var_284_10 + var_284_11 and arg_281_1.time_ < var_284_10 + var_284_11 + arg_284_0 and arg_281_1.var_.characterEffect1011ui_story then
				local var_284_14 = 0.5

				arg_281_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1011ui_story.fillRatio = var_284_14
			end

			local var_284_15 = 0
			local var_284_16 = 1.1

			if var_284_15 < arg_281_1.time_ and arg_281_1.time_ <= var_284_15 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, false)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_17 = arg_281_1:GetWordFromCfg(1101106069)
				local var_284_18 = arg_281_1:FormatText(var_284_17.content)

				arg_281_1.text_.text = var_284_18

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_19 = 57
				local var_284_20 = utf8.len(var_284_18)
				local var_284_21 = var_284_19 <= 0 and var_284_16 or var_284_16 * (var_284_20 / var_284_19)

				if var_284_21 > 0 and var_284_16 < var_284_21 then
					arg_281_1.talkMaxDuration = var_284_21

					if var_284_21 + var_284_15 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_21 + var_284_15
					end
				end

				arg_281_1.text_.text = var_284_18
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_22 = math.max(var_284_16, arg_281_1.talkMaxDuration)

			if var_284_15 <= arg_281_1.time_ and arg_281_1.time_ < var_284_15 + var_284_22 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_15) / var_284_22

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_15 + var_284_22 and arg_281_1.time_ < var_284_15 + var_284_22 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 1101106070
		arg_285_1.duration_ = 9

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play1101106071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 2

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				local var_288_1 = manager.ui.mainCamera.transform.localPosition
				local var_288_2 = Vector3.New(0, 0, 10) + Vector3.New(var_288_1.x, var_288_1.y, 0)
				local var_288_3 = arg_285_1.bgs_.STblack

				var_288_3.transform.localPosition = var_288_2
				var_288_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_288_4 = var_288_3:GetComponent("SpriteRenderer")

				if var_288_4 and var_288_4.sprite then
					local var_288_5 = (var_288_3.transform.localPosition - var_288_1).z
					local var_288_6 = manager.ui.mainCameraCom_
					local var_288_7 = 2 * var_288_5 * Mathf.Tan(var_288_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_288_8 = var_288_7 * var_288_6.aspect
					local var_288_9 = var_288_4.sprite.bounds.size.x
					local var_288_10 = var_288_4.sprite.bounds.size.y
					local var_288_11 = var_288_8 / var_288_9
					local var_288_12 = var_288_7 / var_288_10
					local var_288_13 = var_288_12 < var_288_11 and var_288_11 or var_288_12

					var_288_3.transform.localScale = Vector3.New(var_288_13, var_288_13, 0)
				end

				for iter_288_0, iter_288_1 in pairs(arg_285_1.bgs_) do
					if iter_288_0 ~= "STblack" then
						iter_288_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_288_14 = 0

			if var_288_14 < arg_285_1.time_ and arg_285_1.time_ <= var_288_14 + arg_288_0 then
				arg_285_1.mask_.enabled = true
				arg_285_1.mask_.raycastTarget = true

				arg_285_1:SetGaussion(false)
			end

			local var_288_15 = 2

			if var_288_14 <= arg_285_1.time_ and arg_285_1.time_ < var_288_14 + var_288_15 then
				local var_288_16 = (arg_285_1.time_ - var_288_14) / var_288_15
				local var_288_17 = Color.New(0, 0, 0)

				var_288_17.a = Mathf.Lerp(0, 1, var_288_16)
				arg_285_1.mask_.color = var_288_17
			end

			if arg_285_1.time_ >= var_288_14 + var_288_15 and arg_285_1.time_ < var_288_14 + var_288_15 + arg_288_0 then
				local var_288_18 = Color.New(0, 0, 0)

				var_288_18.a = 1
				arg_285_1.mask_.color = var_288_18
			end

			local var_288_19 = 2

			if var_288_19 < arg_285_1.time_ and arg_285_1.time_ <= var_288_19 + arg_288_0 then
				arg_285_1.mask_.enabled = true
				arg_285_1.mask_.raycastTarget = true

				arg_285_1:SetGaussion(false)
			end

			local var_288_20 = 2

			if var_288_19 <= arg_285_1.time_ and arg_285_1.time_ < var_288_19 + var_288_20 then
				local var_288_21 = (arg_285_1.time_ - var_288_19) / var_288_20
				local var_288_22 = Color.New(0, 0, 0)

				var_288_22.a = Mathf.Lerp(1, 0, var_288_21)
				arg_285_1.mask_.color = var_288_22
			end

			if arg_285_1.time_ >= var_288_19 + var_288_20 and arg_285_1.time_ < var_288_19 + var_288_20 + arg_288_0 then
				local var_288_23 = Color.New(0, 0, 0)
				local var_288_24 = 0

				arg_285_1.mask_.enabled = false
				var_288_23.a = var_288_24
				arg_285_1.mask_.color = var_288_23
			end

			if arg_285_1.frameCnt_ <= 1 then
				arg_285_1.dialog_:SetActive(false)
			end

			local var_288_25 = 4
			local var_288_26 = 0.2

			if var_288_25 < arg_285_1.time_ and arg_285_1.time_ <= var_288_25 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0

				arg_285_1.dialog_:SetActive(true)

				local var_288_27 = LeanTween.value(arg_285_1.dialog_, 0, 1, 0.3)

				var_288_27:setOnUpdate(LuaHelper.FloatAction(function(arg_289_0)
					arg_285_1.dialogCg_.alpha = arg_289_0
				end))
				var_288_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_285_1.dialog_)
					var_288_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_285_1.duration_ = arg_285_1.duration_ + 0.3

				SetActive(arg_285_1.leftNameGo_, false)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_28 = arg_285_1:GetWordFromCfg(1101106070)
				local var_288_29 = arg_285_1:FormatText(var_288_28.content)

				arg_285_1.text_.text = var_288_29

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_30 = 8
				local var_288_31 = utf8.len(var_288_29)
				local var_288_32 = var_288_30 <= 0 and var_288_26 or var_288_26 * (var_288_31 / var_288_30)

				if var_288_32 > 0 and var_288_26 < var_288_32 then
					arg_285_1.talkMaxDuration = var_288_32
					var_288_25 = var_288_25 + 0.3

					if var_288_32 + var_288_25 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_32 + var_288_25
					end
				end

				arg_285_1.text_.text = var_288_29
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_33 = var_288_25 + 0.3
			local var_288_34 = math.max(var_288_26, arg_285_1.talkMaxDuration)

			if var_288_33 <= arg_285_1.time_ and arg_285_1.time_ < var_288_33 + var_288_34 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_33) / var_288_34

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_33 + var_288_34 and arg_285_1.time_ < var_288_33 + var_288_34 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 1101106071
		arg_291_1.duration_ = 7

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play1101106072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = "ST14"

			if arg_291_1.bgs_[var_294_0] == nil then
				local var_294_1 = Object.Instantiate(arg_291_1.paintGo_)

				var_294_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_294_0)
				var_294_1.name = var_294_0
				var_294_1.transform.parent = arg_291_1.stage_.transform
				var_294_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_291_1.bgs_[var_294_0] = var_294_1
			end

			local var_294_2 = 0

			if var_294_2 < arg_291_1.time_ and arg_291_1.time_ <= var_294_2 + arg_294_0 then
				local var_294_3 = manager.ui.mainCamera.transform.localPosition
				local var_294_4 = Vector3.New(0, 0, 10) + Vector3.New(var_294_3.x, var_294_3.y, 0)
				local var_294_5 = arg_291_1.bgs_.ST14

				var_294_5.transform.localPosition = var_294_4
				var_294_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_294_6 = var_294_5:GetComponent("SpriteRenderer")

				if var_294_6 and var_294_6.sprite then
					local var_294_7 = (var_294_5.transform.localPosition - var_294_3).z
					local var_294_8 = manager.ui.mainCameraCom_
					local var_294_9 = 2 * var_294_7 * Mathf.Tan(var_294_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_294_10 = var_294_9 * var_294_8.aspect
					local var_294_11 = var_294_6.sprite.bounds.size.x
					local var_294_12 = var_294_6.sprite.bounds.size.y
					local var_294_13 = var_294_10 / var_294_11
					local var_294_14 = var_294_9 / var_294_12
					local var_294_15 = var_294_14 < var_294_13 and var_294_13 or var_294_14

					var_294_5.transform.localScale = Vector3.New(var_294_15, var_294_15, 0)
				end

				for iter_294_0, iter_294_1 in pairs(arg_291_1.bgs_) do
					if iter_294_0 ~= "ST14" then
						iter_294_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_294_16 = 0

			if var_294_16 < arg_291_1.time_ and arg_291_1.time_ <= var_294_16 + arg_294_0 then
				arg_291_1.mask_.enabled = true
				arg_291_1.mask_.raycastTarget = true

				arg_291_1:SetGaussion(false)
			end

			local var_294_17 = 2

			if var_294_16 <= arg_291_1.time_ and arg_291_1.time_ < var_294_16 + var_294_17 then
				local var_294_18 = (arg_291_1.time_ - var_294_16) / var_294_17
				local var_294_19 = Color.New(0, 0, 0)

				var_294_19.a = Mathf.Lerp(1, 0, var_294_18)
				arg_291_1.mask_.color = var_294_19
			end

			if arg_291_1.time_ >= var_294_16 + var_294_17 and arg_291_1.time_ < var_294_16 + var_294_17 + arg_294_0 then
				local var_294_20 = Color.New(0, 0, 0)
				local var_294_21 = 0

				arg_291_1.mask_.enabled = false
				var_294_20.a = var_294_21
				arg_291_1.mask_.color = var_294_20
			end

			if arg_291_1.frameCnt_ <= 1 then
				arg_291_1.dialog_:SetActive(false)
			end

			local var_294_22 = 2
			local var_294_23 = 0.75

			if var_294_22 < arg_291_1.time_ and arg_291_1.time_ <= var_294_22 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0

				arg_291_1.dialog_:SetActive(true)

				local var_294_24 = LeanTween.value(arg_291_1.dialog_, 0, 1, 0.3)

				var_294_24:setOnUpdate(LuaHelper.FloatAction(function(arg_295_0)
					arg_291_1.dialogCg_.alpha = arg_295_0
				end))
				var_294_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_291_1.dialog_)
					var_294_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_291_1.duration_ = arg_291_1.duration_ + 0.3

				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_25 = arg_291_1:GetWordFromCfg(1101106071)
				local var_294_26 = arg_291_1:FormatText(var_294_25.content)

				arg_291_1.text_.text = var_294_26

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_27 = 30
				local var_294_28 = utf8.len(var_294_26)
				local var_294_29 = var_294_27 <= 0 and var_294_23 or var_294_23 * (var_294_28 / var_294_27)

				if var_294_29 > 0 and var_294_23 < var_294_29 then
					arg_291_1.talkMaxDuration = var_294_29
					var_294_22 = var_294_22 + 0.3

					if var_294_29 + var_294_22 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_29 + var_294_22
					end
				end

				arg_291_1.text_.text = var_294_26
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_30 = var_294_22 + 0.3
			local var_294_31 = math.max(var_294_23, arg_291_1.talkMaxDuration)

			if var_294_30 <= arg_291_1.time_ and arg_291_1.time_ < var_294_30 + var_294_31 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_30) / var_294_31

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_30 + var_294_31 and arg_291_1.time_ < var_294_30 + var_294_31 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106072 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 1101106072
		arg_297_1.duration_ = 5

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play1101106073(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_300_1 = arg_297_1.actors_["1011ui_story"].transform
			local var_300_2 = 0

			if var_300_2 < arg_297_1.time_ and arg_297_1.time_ <= var_300_2 + arg_300_0 then
				arg_297_1.var_.moveOldPos1011ui_story = var_300_1.localPosition
			end

			local var_300_3 = 0.001

			if var_300_2 <= arg_297_1.time_ and arg_297_1.time_ < var_300_2 + var_300_3 then
				local var_300_4 = (arg_297_1.time_ - var_300_2) / var_300_3
				local var_300_5 = Vector3.New(0, -0.71, -6)

				var_300_1.localPosition = Vector3.Lerp(arg_297_1.var_.moveOldPos1011ui_story, var_300_5, var_300_4)

				local var_300_6 = manager.ui.mainCamera.transform.position - var_300_1.position

				var_300_1.forward = Vector3.New(var_300_6.x, var_300_6.y, var_300_6.z)

				local var_300_7 = var_300_1.localEulerAngles

				var_300_7.z = 0
				var_300_7.x = 0
				var_300_1.localEulerAngles = var_300_7
			end

			if arg_297_1.time_ >= var_300_2 + var_300_3 and arg_297_1.time_ < var_300_2 + var_300_3 + arg_300_0 then
				var_300_1.localPosition = Vector3.New(0, -0.71, -6)

				local var_300_8 = manager.ui.mainCamera.transform.position - var_300_1.position

				var_300_1.forward = Vector3.New(var_300_8.x, var_300_8.y, var_300_8.z)

				local var_300_9 = var_300_1.localEulerAngles

				var_300_9.z = 0
				var_300_9.x = 0
				var_300_1.localEulerAngles = var_300_9
			end

			local var_300_10 = 0

			if var_300_10 < arg_297_1.time_ and arg_297_1.time_ <= var_300_10 + arg_300_0 then
				arg_297_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_300_11 = arg_297_1.actors_["1011ui_story"]
			local var_300_12 = 0

			if var_300_12 < arg_297_1.time_ and arg_297_1.time_ <= var_300_12 + arg_300_0 and arg_297_1.var_.characterEffect1011ui_story == nil then
				arg_297_1.var_.characterEffect1011ui_story = var_300_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_13 = 0.0166666666666667

			if var_300_12 <= arg_297_1.time_ and arg_297_1.time_ < var_300_12 + var_300_13 then
				local var_300_14 = (arg_297_1.time_ - var_300_12) / var_300_13

				if arg_297_1.var_.characterEffect1011ui_story then
					local var_300_15 = Mathf.Lerp(0, 0.5, var_300_14)

					arg_297_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_297_1.var_.characterEffect1011ui_story.fillRatio = var_300_15
				end
			end

			if arg_297_1.time_ >= var_300_12 + var_300_13 and arg_297_1.time_ < var_300_12 + var_300_13 + arg_300_0 and arg_297_1.var_.characterEffect1011ui_story then
				local var_300_16 = 0.5

				arg_297_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_297_1.var_.characterEffect1011ui_story.fillRatio = var_300_16
			end

			local var_300_17 = 0
			local var_300_18 = 0.675

			if var_300_17 < arg_297_1.time_ and arg_297_1.time_ <= var_300_17 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, false)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_19 = arg_297_1:GetWordFromCfg(1101106072)
				local var_300_20 = arg_297_1:FormatText(var_300_19.content)

				arg_297_1.text_.text = var_300_20

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_21 = 27
				local var_300_22 = utf8.len(var_300_20)
				local var_300_23 = var_300_21 <= 0 and var_300_18 or var_300_18 * (var_300_22 / var_300_21)

				if var_300_23 > 0 and var_300_18 < var_300_23 then
					arg_297_1.talkMaxDuration = var_300_23

					if var_300_23 + var_300_17 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_23 + var_300_17
					end
				end

				arg_297_1.text_.text = var_300_20
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)
				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_24 = math.max(var_300_18, arg_297_1.talkMaxDuration)

			if var_300_17 <= arg_297_1.time_ and arg_297_1.time_ < var_300_17 + var_300_24 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_17) / var_300_24

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_17 + var_300_24 and arg_297_1.time_ < var_300_17 + var_300_24 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 1101106073
		arg_301_1.duration_ = 3.7

		local var_301_0 = {
			zh = 3.1,
			ja = 3.7
		}
		local var_301_1 = manager.audio:GetLocalizationFlag()

		if var_301_0[var_301_1] ~= nil then
			arg_301_1.duration_ = var_301_0[var_301_1]
		end

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play1101106074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1111ui_story"].transform
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1.var_.moveOldPos1111ui_story = var_304_0.localPosition
			end

			local var_304_2 = 0.001

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2
				local var_304_4 = Vector3.New(0, -0.83, -6)

				var_304_0.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1111ui_story, var_304_4, var_304_3)

				local var_304_5 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_5.x, var_304_5.y, var_304_5.z)

				local var_304_6 = var_304_0.localEulerAngles

				var_304_6.z = 0
				var_304_6.x = 0
				var_304_0.localEulerAngles = var_304_6
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 then
				var_304_0.localPosition = Vector3.New(0, -0.83, -6)

				local var_304_7 = manager.ui.mainCamera.transform.position - var_304_0.position

				var_304_0.forward = Vector3.New(var_304_7.x, var_304_7.y, var_304_7.z)

				local var_304_8 = var_304_0.localEulerAngles

				var_304_8.z = 0
				var_304_8.x = 0
				var_304_0.localEulerAngles = var_304_8
			end

			local var_304_9 = arg_301_1.actors_["1111ui_story"]
			local var_304_10 = 0

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 and arg_301_1.var_.characterEffect1111ui_story == nil then
				arg_301_1.var_.characterEffect1111ui_story = var_304_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_11 = 0.200000002980232

			if var_304_10 <= arg_301_1.time_ and arg_301_1.time_ < var_304_10 + var_304_11 then
				local var_304_12 = (arg_301_1.time_ - var_304_10) / var_304_11

				if arg_301_1.var_.characterEffect1111ui_story then
					arg_301_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_10 + var_304_11 and arg_301_1.time_ < var_304_10 + var_304_11 + arg_304_0 and arg_301_1.var_.characterEffect1111ui_story then
				arg_301_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_304_13 = 0

			if var_304_13 < arg_301_1.time_ and arg_301_1.time_ <= var_304_13 + arg_304_0 then
				arg_301_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action8_1")
			end

			local var_304_14 = 0

			if var_304_14 < arg_301_1.time_ and arg_301_1.time_ <= var_304_14 + arg_304_0 then
				arg_301_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_304_15 = arg_301_1.actors_["1011ui_story"].transform
			local var_304_16 = 0

			if var_304_16 < arg_301_1.time_ and arg_301_1.time_ <= var_304_16 + arg_304_0 then
				arg_301_1.var_.moveOldPos1011ui_story = var_304_15.localPosition
			end

			local var_304_17 = 0.001

			if var_304_16 <= arg_301_1.time_ and arg_301_1.time_ < var_304_16 + var_304_17 then
				local var_304_18 = (arg_301_1.time_ - var_304_16) / var_304_17
				local var_304_19 = Vector3.New(0, 100, 0)

				var_304_15.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos1011ui_story, var_304_19, var_304_18)

				local var_304_20 = manager.ui.mainCamera.transform.position - var_304_15.position

				var_304_15.forward = Vector3.New(var_304_20.x, var_304_20.y, var_304_20.z)

				local var_304_21 = var_304_15.localEulerAngles

				var_304_21.z = 0
				var_304_21.x = 0
				var_304_15.localEulerAngles = var_304_21
			end

			if arg_301_1.time_ >= var_304_16 + var_304_17 and arg_301_1.time_ < var_304_16 + var_304_17 + arg_304_0 then
				var_304_15.localPosition = Vector3.New(0, 100, 0)

				local var_304_22 = manager.ui.mainCamera.transform.position - var_304_15.position

				var_304_15.forward = Vector3.New(var_304_22.x, var_304_22.y, var_304_22.z)

				local var_304_23 = var_304_15.localEulerAngles

				var_304_23.z = 0
				var_304_23.x = 0
				var_304_15.localEulerAngles = var_304_23
			end

			local var_304_24 = 0
			local var_304_25 = 0.3

			if var_304_24 < arg_301_1.time_ and arg_301_1.time_ <= var_304_24 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_26 = arg_301_1:FormatText(StoryNameCfg[67].name)

				arg_301_1.leftNameTxt_.text = var_304_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_27 = arg_301_1:GetWordFromCfg(1101106073)
				local var_304_28 = arg_301_1:FormatText(var_304_27.content)

				arg_301_1.text_.text = var_304_28

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_29 = 12
				local var_304_30 = utf8.len(var_304_28)
				local var_304_31 = var_304_29 <= 0 and var_304_25 or var_304_25 * (var_304_30 / var_304_29)

				if var_304_31 > 0 and var_304_25 < var_304_31 then
					arg_301_1.talkMaxDuration = var_304_31

					if var_304_31 + var_304_24 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_31 + var_304_24
					end
				end

				arg_301_1.text_.text = var_304_28
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb") ~= 0 then
					local var_304_32 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb") / 1000

					if var_304_32 + var_304_24 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_32 + var_304_24
					end

					if var_304_27.prefab_name ~= "" and arg_301_1.actors_[var_304_27.prefab_name] ~= nil then
						local var_304_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_27.prefab_name].transform, "story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb")

						arg_301_1:RecordAudio("1101106073", var_304_33)
						arg_301_1:RecordAudio("1101106073", var_304_33)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106073", "story_v_side_new_1101106.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_34 = math.max(var_304_25, arg_301_1.talkMaxDuration)

			if var_304_24 <= arg_301_1.time_ and arg_301_1.time_ < var_304_24 + var_304_34 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_24) / var_304_34

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_24 + var_304_34 and arg_301_1.time_ < var_304_24 + var_304_34 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 1101106074
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play1101106075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1111ui_story"]
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 and arg_305_1.var_.characterEffect1111ui_story == nil then
				arg_305_1.var_.characterEffect1111ui_story = var_308_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_2 = 0.200000002980232

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2

				if arg_305_1.var_.characterEffect1111ui_story then
					local var_308_4 = Mathf.Lerp(0, 0.5, var_308_3)

					arg_305_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_305_1.var_.characterEffect1111ui_story.fillRatio = var_308_4
				end
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 and arg_305_1.var_.characterEffect1111ui_story then
				local var_308_5 = 0.5

				arg_305_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_305_1.var_.characterEffect1111ui_story.fillRatio = var_308_5
			end

			local var_308_6 = 0
			local var_308_7 = 0.425

			if var_308_6 < arg_305_1.time_ and arg_305_1.time_ <= var_308_6 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_8 = arg_305_1:FormatText(StoryNameCfg[7].name)

				arg_305_1.leftNameTxt_.text = var_308_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_9 = arg_305_1:GetWordFromCfg(1101106074)
				local var_308_10 = arg_305_1:FormatText(var_308_9.content)

				arg_305_1.text_.text = var_308_10

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_11 = 17
				local var_308_12 = utf8.len(var_308_10)
				local var_308_13 = var_308_11 <= 0 and var_308_7 or var_308_7 * (var_308_12 / var_308_11)

				if var_308_13 > 0 and var_308_7 < var_308_13 then
					arg_305_1.talkMaxDuration = var_308_13

					if var_308_13 + var_308_6 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_13 + var_308_6
					end
				end

				arg_305_1.text_.text = var_308_10
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_14 = math.max(var_308_7, arg_305_1.talkMaxDuration)

			if var_308_6 <= arg_305_1.time_ and arg_305_1.time_ < var_308_6 + var_308_14 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_6) / var_308_14

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_6 + var_308_14 and arg_305_1.time_ < var_308_6 + var_308_14 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 1101106075
		arg_309_1.duration_ = 4.1

		local var_309_0 = {
			zh = 3.8,
			ja = 4.1
		}
		local var_309_1 = manager.audio:GetLocalizationFlag()

		if var_309_0[var_309_1] ~= nil then
			arg_309_1.duration_ = var_309_0[var_309_1]
		end

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play1101106076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1011ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos1011ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0, -0.71, -6)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1011ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["1011ui_story"]
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 and arg_309_1.var_.characterEffect1011ui_story == nil then
				arg_309_1.var_.characterEffect1011ui_story = var_312_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_11 = 0.200000002980232

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11

				if arg_309_1.var_.characterEffect1011ui_story then
					arg_309_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 and arg_309_1.var_.characterEffect1011ui_story then
				arg_309_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_312_13 = 0

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action8_1")
			end

			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 then
				arg_309_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_312_15 = arg_309_1.actors_["1111ui_story"].transform
			local var_312_16 = 0

			if var_312_16 < arg_309_1.time_ and arg_309_1.time_ <= var_312_16 + arg_312_0 then
				arg_309_1.var_.moveOldPos1111ui_story = var_312_15.localPosition
			end

			local var_312_17 = 0.001

			if var_312_16 <= arg_309_1.time_ and arg_309_1.time_ < var_312_16 + var_312_17 then
				local var_312_18 = (arg_309_1.time_ - var_312_16) / var_312_17
				local var_312_19 = Vector3.New(0, 100, 0)

				var_312_15.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1111ui_story, var_312_19, var_312_18)

				local var_312_20 = manager.ui.mainCamera.transform.position - var_312_15.position

				var_312_15.forward = Vector3.New(var_312_20.x, var_312_20.y, var_312_20.z)

				local var_312_21 = var_312_15.localEulerAngles

				var_312_21.z = 0
				var_312_21.x = 0
				var_312_15.localEulerAngles = var_312_21
			end

			if arg_309_1.time_ >= var_312_16 + var_312_17 and arg_309_1.time_ < var_312_16 + var_312_17 + arg_312_0 then
				var_312_15.localPosition = Vector3.New(0, 100, 0)

				local var_312_22 = manager.ui.mainCamera.transform.position - var_312_15.position

				var_312_15.forward = Vector3.New(var_312_22.x, var_312_22.y, var_312_22.z)

				local var_312_23 = var_312_15.localEulerAngles

				var_312_23.z = 0
				var_312_23.x = 0
				var_312_15.localEulerAngles = var_312_23
			end

			local var_312_24 = arg_309_1.actors_["1111ui_story"]
			local var_312_25 = 0

			if var_312_25 < arg_309_1.time_ and arg_309_1.time_ <= var_312_25 + arg_312_0 and arg_309_1.var_.characterEffect1111ui_story == nil then
				arg_309_1.var_.characterEffect1111ui_story = var_312_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_26 = 0.200000002980232

			if var_312_25 <= arg_309_1.time_ and arg_309_1.time_ < var_312_25 + var_312_26 then
				local var_312_27 = (arg_309_1.time_ - var_312_25) / var_312_26

				if arg_309_1.var_.characterEffect1111ui_story then
					local var_312_28 = Mathf.Lerp(0, 0.5, var_312_27)

					arg_309_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_309_1.var_.characterEffect1111ui_story.fillRatio = var_312_28
				end
			end

			if arg_309_1.time_ >= var_312_25 + var_312_26 and arg_309_1.time_ < var_312_25 + var_312_26 + arg_312_0 and arg_309_1.var_.characterEffect1111ui_story then
				local var_312_29 = 0.5

				arg_309_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_309_1.var_.characterEffect1111ui_story.fillRatio = var_312_29
			end

			local var_312_30 = 0
			local var_312_31 = 0.35

			if var_312_30 < arg_309_1.time_ and arg_309_1.time_ <= var_312_30 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_32 = arg_309_1:FormatText(StoryNameCfg[37].name)

				arg_309_1.leftNameTxt_.text = var_312_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_33 = arg_309_1:GetWordFromCfg(1101106075)
				local var_312_34 = arg_309_1:FormatText(var_312_33.content)

				arg_309_1.text_.text = var_312_34

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_35 = 14
				local var_312_36 = utf8.len(var_312_34)
				local var_312_37 = var_312_35 <= 0 and var_312_31 or var_312_31 * (var_312_36 / var_312_35)

				if var_312_37 > 0 and var_312_31 < var_312_37 then
					arg_309_1.talkMaxDuration = var_312_37

					if var_312_37 + var_312_30 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_37 + var_312_30
					end
				end

				arg_309_1.text_.text = var_312_34
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb") ~= 0 then
					local var_312_38 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb") / 1000

					if var_312_38 + var_312_30 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_38 + var_312_30
					end

					if var_312_33.prefab_name ~= "" and arg_309_1.actors_[var_312_33.prefab_name] ~= nil then
						local var_312_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_33.prefab_name].transform, "story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb")

						arg_309_1:RecordAudio("1101106075", var_312_39)
						arg_309_1:RecordAudio("1101106075", var_312_39)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106075", "story_v_side_new_1101106.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_40 = math.max(var_312_31, arg_309_1.talkMaxDuration)

			if var_312_30 <= arg_309_1.time_ and arg_309_1.time_ < var_312_30 + var_312_40 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_30) / var_312_40

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_30 + var_312_40 and arg_309_1.time_ < var_312_30 + var_312_40 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 1101106076
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play1101106077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1011ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect1011ui_story == nil then
				arg_313_1.var_.characterEffect1011ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.200000002980232

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect1011ui_story then
					local var_316_4 = Mathf.Lerp(0, 0.5, var_316_3)

					arg_313_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1011ui_story.fillRatio = var_316_4
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect1011ui_story then
				local var_316_5 = 0.5

				arg_313_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1011ui_story.fillRatio = var_316_5
			end

			local var_316_6 = 0
			local var_316_7 = 0.325

			if var_316_6 < arg_313_1.time_ and arg_313_1.time_ <= var_316_6 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_8 = arg_313_1:FormatText(StoryNameCfg[7].name)

				arg_313_1.leftNameTxt_.text = var_316_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_9 = arg_313_1:GetWordFromCfg(1101106076)
				local var_316_10 = arg_313_1:FormatText(var_316_9.content)

				arg_313_1.text_.text = var_316_10

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_11 = 13
				local var_316_12 = utf8.len(var_316_10)
				local var_316_13 = var_316_11 <= 0 and var_316_7 or var_316_7 * (var_316_12 / var_316_11)

				if var_316_13 > 0 and var_316_7 < var_316_13 then
					arg_313_1.talkMaxDuration = var_316_13

					if var_316_13 + var_316_6 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_13 + var_316_6
					end
				end

				arg_313_1.text_.text = var_316_10
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_14 = math.max(var_316_7, arg_313_1.talkMaxDuration)

			if var_316_6 <= arg_313_1.time_ and arg_313_1.time_ < var_316_6 + var_316_14 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_6) / var_316_14

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_6 + var_316_14 and arg_313_1.time_ < var_316_6 + var_316_14 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 1101106077
		arg_317_1.duration_ = 4.933

		local var_317_0 = {
			zh = 4.433,
			ja = 4.933
		}
		local var_317_1 = manager.audio:GetLocalizationFlag()

		if var_317_0[var_317_1] ~= nil then
			arg_317_1.duration_ = var_317_0[var_317_1]
		end

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play1101106078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1111ui_story"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos1111ui_story = var_320_0.localPosition
			end

			local var_320_2 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2
				local var_320_4 = Vector3.New(0, -0.83, -6)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1111ui_story, var_320_4, var_320_3)

				local var_320_5 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_5.x, var_320_5.y, var_320_5.z)

				local var_320_6 = var_320_0.localEulerAngles

				var_320_6.z = 0
				var_320_6.x = 0
				var_320_0.localEulerAngles = var_320_6
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(0, -0.83, -6)

				local var_320_7 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_7.x, var_320_7.y, var_320_7.z)

				local var_320_8 = var_320_0.localEulerAngles

				var_320_8.z = 0
				var_320_8.x = 0
				var_320_0.localEulerAngles = var_320_8
			end

			local var_320_9 = arg_317_1.actors_["1111ui_story"]
			local var_320_10 = 0

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 and arg_317_1.var_.characterEffect1111ui_story == nil then
				arg_317_1.var_.characterEffect1111ui_story = var_320_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_11 = 0.200000002980232

			if var_320_10 <= arg_317_1.time_ and arg_317_1.time_ < var_320_10 + var_320_11 then
				local var_320_12 = (arg_317_1.time_ - var_320_10) / var_320_11

				if arg_317_1.var_.characterEffect1111ui_story then
					arg_317_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_10 + var_320_11 and arg_317_1.time_ < var_320_10 + var_320_11 + arg_320_0 and arg_317_1.var_.characterEffect1111ui_story then
				arg_317_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_320_13 = 0

			if var_320_13 < arg_317_1.time_ and arg_317_1.time_ <= var_320_13 + arg_320_0 then
				arg_317_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_1")
			end

			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 then
				arg_317_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_320_15 = arg_317_1.actors_["1011ui_story"].transform
			local var_320_16 = 0

			if var_320_16 < arg_317_1.time_ and arg_317_1.time_ <= var_320_16 + arg_320_0 then
				arg_317_1.var_.moveOldPos1011ui_story = var_320_15.localPosition
			end

			local var_320_17 = 0.001

			if var_320_16 <= arg_317_1.time_ and arg_317_1.time_ < var_320_16 + var_320_17 then
				local var_320_18 = (arg_317_1.time_ - var_320_16) / var_320_17
				local var_320_19 = Vector3.New(0, 100, 0)

				var_320_15.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1011ui_story, var_320_19, var_320_18)

				local var_320_20 = manager.ui.mainCamera.transform.position - var_320_15.position

				var_320_15.forward = Vector3.New(var_320_20.x, var_320_20.y, var_320_20.z)

				local var_320_21 = var_320_15.localEulerAngles

				var_320_21.z = 0
				var_320_21.x = 0
				var_320_15.localEulerAngles = var_320_21
			end

			if arg_317_1.time_ >= var_320_16 + var_320_17 and arg_317_1.time_ < var_320_16 + var_320_17 + arg_320_0 then
				var_320_15.localPosition = Vector3.New(0, 100, 0)

				local var_320_22 = manager.ui.mainCamera.transform.position - var_320_15.position

				var_320_15.forward = Vector3.New(var_320_22.x, var_320_22.y, var_320_22.z)

				local var_320_23 = var_320_15.localEulerAngles

				var_320_23.z = 0
				var_320_23.x = 0
				var_320_15.localEulerAngles = var_320_23
			end

			local var_320_24 = arg_317_1.actors_["1011ui_story"]
			local var_320_25 = 0

			if var_320_25 < arg_317_1.time_ and arg_317_1.time_ <= var_320_25 + arg_320_0 and arg_317_1.var_.characterEffect1011ui_story == nil then
				arg_317_1.var_.characterEffect1011ui_story = var_320_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_26 = 0.200000002980232

			if var_320_25 <= arg_317_1.time_ and arg_317_1.time_ < var_320_25 + var_320_26 then
				local var_320_27 = (arg_317_1.time_ - var_320_25) / var_320_26

				if arg_317_1.var_.characterEffect1011ui_story then
					local var_320_28 = Mathf.Lerp(0, 0.5, var_320_27)

					arg_317_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_317_1.var_.characterEffect1011ui_story.fillRatio = var_320_28
				end
			end

			if arg_317_1.time_ >= var_320_25 + var_320_26 and arg_317_1.time_ < var_320_25 + var_320_26 + arg_320_0 and arg_317_1.var_.characterEffect1011ui_story then
				local var_320_29 = 0.5

				arg_317_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_317_1.var_.characterEffect1011ui_story.fillRatio = var_320_29
			end

			local var_320_30 = 0
			local var_320_31 = 0.3

			if var_320_30 < arg_317_1.time_ and arg_317_1.time_ <= var_320_30 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_32 = arg_317_1:FormatText(StoryNameCfg[67].name)

				arg_317_1.leftNameTxt_.text = var_320_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_33 = arg_317_1:GetWordFromCfg(1101106077)
				local var_320_34 = arg_317_1:FormatText(var_320_33.content)

				arg_317_1.text_.text = var_320_34

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_35 = 12
				local var_320_36 = utf8.len(var_320_34)
				local var_320_37 = var_320_35 <= 0 and var_320_31 or var_320_31 * (var_320_36 / var_320_35)

				if var_320_37 > 0 and var_320_31 < var_320_37 then
					arg_317_1.talkMaxDuration = var_320_37

					if var_320_37 + var_320_30 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_37 + var_320_30
					end
				end

				arg_317_1.text_.text = var_320_34
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb") ~= 0 then
					local var_320_38 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb") / 1000

					if var_320_38 + var_320_30 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_38 + var_320_30
					end

					if var_320_33.prefab_name ~= "" and arg_317_1.actors_[var_320_33.prefab_name] ~= nil then
						local var_320_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_33.prefab_name].transform, "story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb")

						arg_317_1:RecordAudio("1101106077", var_320_39)
						arg_317_1:RecordAudio("1101106077", var_320_39)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106077", "story_v_side_new_1101106.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_40 = math.max(var_320_31, arg_317_1.talkMaxDuration)

			if var_320_30 <= arg_317_1.time_ and arg_317_1.time_ < var_320_30 + var_320_40 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_30) / var_320_40

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_30 + var_320_40 and arg_317_1.time_ < var_320_30 + var_320_40 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 1101106078
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play1101106079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1111ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect1111ui_story == nil then
				arg_321_1.var_.characterEffect1111ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.200000002980232

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect1111ui_story then
					local var_324_4 = Mathf.Lerp(0, 0.5, var_324_3)

					arg_321_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1111ui_story.fillRatio = var_324_4
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect1111ui_story then
				local var_324_5 = 0.5

				arg_321_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1111ui_story.fillRatio = var_324_5
			end

			local var_324_6 = 0
			local var_324_7 = 0.55

			if var_324_6 < arg_321_1.time_ and arg_321_1.time_ <= var_324_6 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_8 = arg_321_1:GetWordFromCfg(1101106078)
				local var_324_9 = arg_321_1:FormatText(var_324_8.content)

				arg_321_1.text_.text = var_324_9

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_10 = 22
				local var_324_11 = utf8.len(var_324_9)
				local var_324_12 = var_324_10 <= 0 and var_324_7 or var_324_7 * (var_324_11 / var_324_10)

				if var_324_12 > 0 and var_324_7 < var_324_12 then
					arg_321_1.talkMaxDuration = var_324_12

					if var_324_12 + var_324_6 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_12 + var_324_6
					end
				end

				arg_321_1.text_.text = var_324_9
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_13 = math.max(var_324_7, arg_321_1.talkMaxDuration)

			if var_324_6 <= arg_321_1.time_ and arg_321_1.time_ < var_324_6 + var_324_13 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_6) / var_324_13

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_6 + var_324_13 and arg_321_1.time_ < var_324_6 + var_324_13 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 1101106079
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play1101106080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 0.975

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_2 = arg_325_1:GetWordFromCfg(1101106079)
				local var_328_3 = arg_325_1:FormatText(var_328_2.content)

				arg_325_1.text_.text = var_328_3

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_4 = 39
				local var_328_5 = utf8.len(var_328_3)
				local var_328_6 = var_328_4 <= 0 and var_328_1 or var_328_1 * (var_328_5 / var_328_4)

				if var_328_6 > 0 and var_328_1 < var_328_6 then
					arg_325_1.talkMaxDuration = var_328_6

					if var_328_6 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_6 + var_328_0
					end
				end

				arg_325_1.text_.text = var_328_3
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_7 = math.max(var_328_1, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_7 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_0) / var_328_7

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_7 and arg_325_1.time_ < var_328_0 + var_328_7 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 1101106080
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play1101106081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1011ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1011ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(-0.7, -0.71, -6)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1011ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["1011ui_story"]
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 and arg_329_1.var_.characterEffect1011ui_story == nil then
				arg_329_1.var_.characterEffect1011ui_story = var_332_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_11 = 0.034000001847744

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11

				if arg_329_1.var_.characterEffect1011ui_story then
					local var_332_13 = Mathf.Lerp(0, 0.5, var_332_12)

					arg_329_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_329_1.var_.characterEffect1011ui_story.fillRatio = var_332_13
				end
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 and arg_329_1.var_.characterEffect1011ui_story then
				local var_332_14 = 0.5

				arg_329_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_329_1.var_.characterEffect1011ui_story.fillRatio = var_332_14
			end

			local var_332_15 = arg_329_1.actors_["1111ui_story"].transform
			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 then
				arg_329_1.var_.moveOldPos1111ui_story = var_332_15.localPosition
			end

			local var_332_17 = 0.001

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17
				local var_332_19 = Vector3.New(0.7, -0.83, -6)

				var_332_15.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1111ui_story, var_332_19, var_332_18)

				local var_332_20 = manager.ui.mainCamera.transform.position - var_332_15.position

				var_332_15.forward = Vector3.New(var_332_20.x, var_332_20.y, var_332_20.z)

				local var_332_21 = var_332_15.localEulerAngles

				var_332_21.z = 0
				var_332_21.x = 0
				var_332_15.localEulerAngles = var_332_21
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 then
				var_332_15.localPosition = Vector3.New(0.7, -0.83, -6)

				local var_332_22 = manager.ui.mainCamera.transform.position - var_332_15.position

				var_332_15.forward = Vector3.New(var_332_22.x, var_332_22.y, var_332_22.z)

				local var_332_23 = var_332_15.localEulerAngles

				var_332_23.z = 0
				var_332_23.x = 0
				var_332_15.localEulerAngles = var_332_23
			end

			local var_332_24 = arg_329_1.actors_["1111ui_story"]
			local var_332_25 = 0

			if var_332_25 < arg_329_1.time_ and arg_329_1.time_ <= var_332_25 + arg_332_0 and arg_329_1.var_.characterEffect1111ui_story == nil then
				arg_329_1.var_.characterEffect1111ui_story = var_332_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_26 = 0.034000001847744

			if var_332_25 <= arg_329_1.time_ and arg_329_1.time_ < var_332_25 + var_332_26 then
				local var_332_27 = (arg_329_1.time_ - var_332_25) / var_332_26

				if arg_329_1.var_.characterEffect1111ui_story then
					local var_332_28 = Mathf.Lerp(0, 0.5, var_332_27)

					arg_329_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_329_1.var_.characterEffect1111ui_story.fillRatio = var_332_28
				end
			end

			if arg_329_1.time_ >= var_332_25 + var_332_26 and arg_329_1.time_ < var_332_25 + var_332_26 + arg_332_0 and arg_329_1.var_.characterEffect1111ui_story then
				local var_332_29 = 0.5

				arg_329_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_329_1.var_.characterEffect1111ui_story.fillRatio = var_332_29
			end

			local var_332_30 = 0
			local var_332_31 = 0.525

			if var_332_30 < arg_329_1.time_ and arg_329_1.time_ <= var_332_30 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_32 = arg_329_1:FormatText(StoryNameCfg[7].name)

				arg_329_1.leftNameTxt_.text = var_332_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_33 = arg_329_1:GetWordFromCfg(1101106080)
				local var_332_34 = arg_329_1:FormatText(var_332_33.content)

				arg_329_1.text_.text = var_332_34

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_35 = 21
				local var_332_36 = utf8.len(var_332_34)
				local var_332_37 = var_332_35 <= 0 and var_332_31 or var_332_31 * (var_332_36 / var_332_35)

				if var_332_37 > 0 and var_332_31 < var_332_37 then
					arg_329_1.talkMaxDuration = var_332_37

					if var_332_37 + var_332_30 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_37 + var_332_30
					end
				end

				arg_329_1.text_.text = var_332_34
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_38 = math.max(var_332_31, arg_329_1.talkMaxDuration)

			if var_332_30 <= arg_329_1.time_ and arg_329_1.time_ < var_332_30 + var_332_38 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_30) / var_332_38

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_30 + var_332_38 and arg_329_1.time_ < var_332_30 + var_332_38 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 1101106081
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play1101106082(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.675

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, false)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_2 = arg_333_1:GetWordFromCfg(1101106081)
				local var_336_3 = arg_333_1:FormatText(var_336_2.content)

				arg_333_1.text_.text = var_336_3

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_4 = 27
				local var_336_5 = utf8.len(var_336_3)
				local var_336_6 = var_336_4 <= 0 and var_336_1 or var_336_1 * (var_336_5 / var_336_4)

				if var_336_6 > 0 and var_336_1 < var_336_6 then
					arg_333_1.talkMaxDuration = var_336_6

					if var_336_6 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_6 + var_336_0
					end
				end

				arg_333_1.text_.text = var_336_3
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_7 = math.max(var_336_1, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_7 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_0) / var_336_7

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_7 and arg_333_1.time_ < var_336_0 + var_336_7 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106082 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 1101106082
		arg_337_1.duration_ = 6.6

		local var_337_0 = {
			zh = 6.6,
			ja = 6
		}
		local var_337_1 = manager.audio:GetLocalizationFlag()

		if var_337_0[var_337_1] ~= nil then
			arg_337_1.duration_ = var_337_0[var_337_1]
		end

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play1101106083(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1111ui_story"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1111ui_story = var_340_0.localPosition
			end

			local var_340_2 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2
				local var_340_4 = Vector3.New(0.7, -0.83, -6)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1111ui_story, var_340_4, var_340_3)

				local var_340_5 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_5.x, var_340_5.y, var_340_5.z)

				local var_340_6 = var_340_0.localEulerAngles

				var_340_6.z = 0
				var_340_6.x = 0
				var_340_0.localEulerAngles = var_340_6
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(0.7, -0.83, -6)

				local var_340_7 = manager.ui.mainCamera.transform.position - var_340_0.position

				var_340_0.forward = Vector3.New(var_340_7.x, var_340_7.y, var_340_7.z)

				local var_340_8 = var_340_0.localEulerAngles

				var_340_8.z = 0
				var_340_8.x = 0
				var_340_0.localEulerAngles = var_340_8
			end

			local var_340_9 = arg_337_1.actors_["1111ui_story"]
			local var_340_10 = 0

			if var_340_10 < arg_337_1.time_ and arg_337_1.time_ <= var_340_10 + arg_340_0 and arg_337_1.var_.characterEffect1111ui_story == nil then
				arg_337_1.var_.characterEffect1111ui_story = var_340_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_11 = 0.200000002980232

			if var_340_10 <= arg_337_1.time_ and arg_337_1.time_ < var_340_10 + var_340_11 then
				local var_340_12 = (arg_337_1.time_ - var_340_10) / var_340_11

				if arg_337_1.var_.characterEffect1111ui_story then
					arg_337_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_337_1.time_ >= var_340_10 + var_340_11 and arg_337_1.time_ < var_340_10 + var_340_11 + arg_340_0 and arg_337_1.var_.characterEffect1111ui_story then
				arg_337_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_340_13 = 0

			if var_340_13 < arg_337_1.time_ and arg_337_1.time_ <= var_340_13 + arg_340_0 then
				arg_337_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action464")
			end

			local var_340_14 = 0

			if var_340_14 < arg_337_1.time_ and arg_337_1.time_ <= var_340_14 + arg_340_0 then
				arg_337_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_340_15 = 0
			local var_340_16 = 0.725

			if var_340_15 < arg_337_1.time_ and arg_337_1.time_ <= var_340_15 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_17 = arg_337_1:FormatText(StoryNameCfg[67].name)

				arg_337_1.leftNameTxt_.text = var_340_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_18 = arg_337_1:GetWordFromCfg(1101106082)
				local var_340_19 = arg_337_1:FormatText(var_340_18.content)

				arg_337_1.text_.text = var_340_19

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_20 = 29
				local var_340_21 = utf8.len(var_340_19)
				local var_340_22 = var_340_20 <= 0 and var_340_16 or var_340_16 * (var_340_21 / var_340_20)

				if var_340_22 > 0 and var_340_16 < var_340_22 then
					arg_337_1.talkMaxDuration = var_340_22

					if var_340_22 + var_340_15 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_22 + var_340_15
					end
				end

				arg_337_1.text_.text = var_340_19
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb") ~= 0 then
					local var_340_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb") / 1000

					if var_340_23 + var_340_15 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_23 + var_340_15
					end

					if var_340_18.prefab_name ~= "" and arg_337_1.actors_[var_340_18.prefab_name] ~= nil then
						local var_340_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_18.prefab_name].transform, "story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb")

						arg_337_1:RecordAudio("1101106082", var_340_24)
						arg_337_1:RecordAudio("1101106082", var_340_24)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106082", "story_v_side_new_1101106.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_25 = math.max(var_340_16, arg_337_1.talkMaxDuration)

			if var_340_15 <= arg_337_1.time_ and arg_337_1.time_ < var_340_15 + var_340_25 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_15) / var_340_25

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_15 + var_340_25 and arg_337_1.time_ < var_340_15 + var_340_25 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 1101106083
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play1101106084(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1111ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect1111ui_story == nil then
				arg_341_1.var_.characterEffect1111ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.200000002980232

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect1111ui_story then
					local var_344_4 = Mathf.Lerp(0, 0.5, var_344_3)

					arg_341_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_341_1.var_.characterEffect1111ui_story.fillRatio = var_344_4
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect1111ui_story then
				local var_344_5 = 0.5

				arg_341_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_341_1.var_.characterEffect1111ui_story.fillRatio = var_344_5
			end

			local var_344_6 = arg_341_1.actors_["1111ui_story"].transform
			local var_344_7 = 0

			if var_344_7 < arg_341_1.time_ and arg_341_1.time_ <= var_344_7 + arg_344_0 then
				arg_341_1.var_.moveOldPos1111ui_story = var_344_6.localPosition
			end

			local var_344_8 = 0.001

			if var_344_7 <= arg_341_1.time_ and arg_341_1.time_ < var_344_7 + var_344_8 then
				local var_344_9 = (arg_341_1.time_ - var_344_7) / var_344_8
				local var_344_10 = Vector3.New(0, -0.83, -6)

				var_344_6.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1111ui_story, var_344_10, var_344_9)

				local var_344_11 = manager.ui.mainCamera.transform.position - var_344_6.position

				var_344_6.forward = Vector3.New(var_344_11.x, var_344_11.y, var_344_11.z)

				local var_344_12 = var_344_6.localEulerAngles

				var_344_12.z = 0
				var_344_12.x = 0
				var_344_6.localEulerAngles = var_344_12
			end

			if arg_341_1.time_ >= var_344_7 + var_344_8 and arg_341_1.time_ < var_344_7 + var_344_8 + arg_344_0 then
				var_344_6.localPosition = Vector3.New(0, -0.83, -6)

				local var_344_13 = manager.ui.mainCamera.transform.position - var_344_6.position

				var_344_6.forward = Vector3.New(var_344_13.x, var_344_13.y, var_344_13.z)

				local var_344_14 = var_344_6.localEulerAngles

				var_344_14.z = 0
				var_344_14.x = 0
				var_344_6.localEulerAngles = var_344_14
			end

			local var_344_15 = arg_341_1.actors_["1011ui_story"].transform
			local var_344_16 = 0

			if var_344_16 < arg_341_1.time_ and arg_341_1.time_ <= var_344_16 + arg_344_0 then
				arg_341_1.var_.moveOldPos1011ui_story = var_344_15.localPosition
			end

			local var_344_17 = 0.001

			if var_344_16 <= arg_341_1.time_ and arg_341_1.time_ < var_344_16 + var_344_17 then
				local var_344_18 = (arg_341_1.time_ - var_344_16) / var_344_17
				local var_344_19 = Vector3.New(0, 100, 0)

				var_344_15.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1011ui_story, var_344_19, var_344_18)

				local var_344_20 = manager.ui.mainCamera.transform.position - var_344_15.position

				var_344_15.forward = Vector3.New(var_344_20.x, var_344_20.y, var_344_20.z)

				local var_344_21 = var_344_15.localEulerAngles

				var_344_21.z = 0
				var_344_21.x = 0
				var_344_15.localEulerAngles = var_344_21
			end

			if arg_341_1.time_ >= var_344_16 + var_344_17 and arg_341_1.time_ < var_344_16 + var_344_17 + arg_344_0 then
				var_344_15.localPosition = Vector3.New(0, 100, 0)

				local var_344_22 = manager.ui.mainCamera.transform.position - var_344_15.position

				var_344_15.forward = Vector3.New(var_344_22.x, var_344_22.y, var_344_22.z)

				local var_344_23 = var_344_15.localEulerAngles

				var_344_23.z = 0
				var_344_23.x = 0
				var_344_15.localEulerAngles = var_344_23
			end

			local var_344_24 = arg_341_1.bgs_.ST14.transform
			local var_344_25 = 0

			if var_344_25 < arg_341_1.time_ and arg_341_1.time_ <= var_344_25 + arg_344_0 then
				arg_341_1.var_.moveOldPosST14 = var_344_24.localPosition
			end

			local var_344_26 = 3

			if var_344_25 <= arg_341_1.time_ and arg_341_1.time_ < var_344_25 + var_344_26 then
				local var_344_27 = (arg_341_1.time_ - var_344_25) / var_344_26
				local var_344_28 = Vector3.New(0, 1, 8)

				var_344_24.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPosST14, var_344_28, var_344_27)
			end

			if arg_341_1.time_ >= var_344_25 + var_344_26 and arg_341_1.time_ < var_344_25 + var_344_26 + arg_344_0 then
				var_344_24.localPosition = Vector3.New(0, 1, 8)
			end

			local var_344_29 = 0
			local var_344_30 = 0.4

			if var_344_29 < arg_341_1.time_ and arg_341_1.time_ <= var_344_29 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, false)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_31 = arg_341_1:GetWordFromCfg(1101106083)
				local var_344_32 = arg_341_1:FormatText(var_344_31.content)

				arg_341_1.text_.text = var_344_32

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_33 = 16
				local var_344_34 = utf8.len(var_344_32)
				local var_344_35 = var_344_33 <= 0 and var_344_30 or var_344_30 * (var_344_34 / var_344_33)

				if var_344_35 > 0 and var_344_30 < var_344_35 then
					arg_341_1.talkMaxDuration = var_344_35

					if var_344_35 + var_344_29 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_35 + var_344_29
					end
				end

				arg_341_1.text_.text = var_344_32
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_36 = math.max(var_344_30, arg_341_1.talkMaxDuration)

			if var_344_29 <= arg_341_1.time_ and arg_341_1.time_ < var_344_29 + var_344_36 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_29) / var_344_36

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_29 + var_344_36 and arg_341_1.time_ < var_344_29 + var_344_36 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106084 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 1101106084
		arg_345_1.duration_ = 4.8

		local var_345_0 = {
			zh = 4.066,
			ja = 4.8
		}
		local var_345_1 = manager.audio:GetLocalizationFlag()

		if var_345_0[var_345_1] ~= nil then
			arg_345_1.duration_ = var_345_0[var_345_1]
		end

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play1101106085(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1011ui_story"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1011ui_story = var_348_0.localPosition
			end

			local var_348_2 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2
				local var_348_4 = Vector3.New(0, -0.71, -6)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1011ui_story, var_348_4, var_348_3)

				local var_348_5 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_5.x, var_348_5.y, var_348_5.z)

				local var_348_6 = var_348_0.localEulerAngles

				var_348_6.z = 0
				var_348_6.x = 0
				var_348_0.localEulerAngles = var_348_6
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_348_7 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_7.x, var_348_7.y, var_348_7.z)

				local var_348_8 = var_348_0.localEulerAngles

				var_348_8.z = 0
				var_348_8.x = 0
				var_348_0.localEulerAngles = var_348_8
			end

			local var_348_9 = arg_345_1.actors_["1011ui_story"]
			local var_348_10 = 0

			if var_348_10 < arg_345_1.time_ and arg_345_1.time_ <= var_348_10 + arg_348_0 and arg_345_1.var_.characterEffect1011ui_story == nil then
				arg_345_1.var_.characterEffect1011ui_story = var_348_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_11 = 0.200000002980232

			if var_348_10 <= arg_345_1.time_ and arg_345_1.time_ < var_348_10 + var_348_11 then
				local var_348_12 = (arg_345_1.time_ - var_348_10) / var_348_11

				if arg_345_1.var_.characterEffect1011ui_story then
					arg_345_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_345_1.time_ >= var_348_10 + var_348_11 and arg_345_1.time_ < var_348_10 + var_348_11 + arg_348_0 and arg_345_1.var_.characterEffect1011ui_story then
				arg_345_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_348_13 = 0

			if var_348_13 < arg_345_1.time_ and arg_345_1.time_ <= var_348_13 + arg_348_0 then
				arg_345_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_348_14 = 0

			if var_348_14 < arg_345_1.time_ and arg_345_1.time_ <= var_348_14 + arg_348_0 then
				arg_345_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_348_15 = arg_345_1.actors_["1111ui_story"].transform
			local var_348_16 = 0

			if var_348_16 < arg_345_1.time_ and arg_345_1.time_ <= var_348_16 + arg_348_0 then
				arg_345_1.var_.moveOldPos1111ui_story = var_348_15.localPosition
			end

			local var_348_17 = 0.001

			if var_348_16 <= arg_345_1.time_ and arg_345_1.time_ < var_348_16 + var_348_17 then
				local var_348_18 = (arg_345_1.time_ - var_348_16) / var_348_17
				local var_348_19 = Vector3.New(0, 100, 0)

				var_348_15.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1111ui_story, var_348_19, var_348_18)

				local var_348_20 = manager.ui.mainCamera.transform.position - var_348_15.position

				var_348_15.forward = Vector3.New(var_348_20.x, var_348_20.y, var_348_20.z)

				local var_348_21 = var_348_15.localEulerAngles

				var_348_21.z = 0
				var_348_21.x = 0
				var_348_15.localEulerAngles = var_348_21
			end

			if arg_345_1.time_ >= var_348_16 + var_348_17 and arg_345_1.time_ < var_348_16 + var_348_17 + arg_348_0 then
				var_348_15.localPosition = Vector3.New(0, 100, 0)

				local var_348_22 = manager.ui.mainCamera.transform.position - var_348_15.position

				var_348_15.forward = Vector3.New(var_348_22.x, var_348_22.y, var_348_22.z)

				local var_348_23 = var_348_15.localEulerAngles

				var_348_23.z = 0
				var_348_23.x = 0
				var_348_15.localEulerAngles = var_348_23
			end

			local var_348_24 = 0
			local var_348_25 = 0.4

			if var_348_24 < arg_345_1.time_ and arg_345_1.time_ <= var_348_24 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_26 = arg_345_1:FormatText(StoryNameCfg[37].name)

				arg_345_1.leftNameTxt_.text = var_348_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_27 = arg_345_1:GetWordFromCfg(1101106084)
				local var_348_28 = arg_345_1:FormatText(var_348_27.content)

				arg_345_1.text_.text = var_348_28

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_29 = 16
				local var_348_30 = utf8.len(var_348_28)
				local var_348_31 = var_348_29 <= 0 and var_348_25 or var_348_25 * (var_348_30 / var_348_29)

				if var_348_31 > 0 and var_348_25 < var_348_31 then
					arg_345_1.talkMaxDuration = var_348_31

					if var_348_31 + var_348_24 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_31 + var_348_24
					end
				end

				arg_345_1.text_.text = var_348_28
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb") ~= 0 then
					local var_348_32 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb") / 1000

					if var_348_32 + var_348_24 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_32 + var_348_24
					end

					if var_348_27.prefab_name ~= "" and arg_345_1.actors_[var_348_27.prefab_name] ~= nil then
						local var_348_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_27.prefab_name].transform, "story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb")

						arg_345_1:RecordAudio("1101106084", var_348_33)
						arg_345_1:RecordAudio("1101106084", var_348_33)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106084", "story_v_side_new_1101106.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_34 = math.max(var_348_25, arg_345_1.talkMaxDuration)

			if var_348_24 <= arg_345_1.time_ and arg_345_1.time_ < var_348_24 + var_348_34 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_24) / var_348_34

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_24 + var_348_34 and arg_345_1.time_ < var_348_24 + var_348_34 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106085 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 1101106085
		arg_349_1.duration_ = 9

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play1101106086(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 2

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				local var_352_1 = manager.ui.mainCamera.transform.localPosition
				local var_352_2 = Vector3.New(0, 0, 10) + Vector3.New(var_352_1.x, var_352_1.y, 0)
				local var_352_3 = arg_349_1.bgs_.ST14

				var_352_3.transform.localPosition = var_352_2
				var_352_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_352_4 = var_352_3:GetComponent("SpriteRenderer")

				if var_352_4 and var_352_4.sprite then
					local var_352_5 = (var_352_3.transform.localPosition - var_352_1).z
					local var_352_6 = manager.ui.mainCameraCom_
					local var_352_7 = 2 * var_352_5 * Mathf.Tan(var_352_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_352_8 = var_352_7 * var_352_6.aspect
					local var_352_9 = var_352_4.sprite.bounds.size.x
					local var_352_10 = var_352_4.sprite.bounds.size.y
					local var_352_11 = var_352_8 / var_352_9
					local var_352_12 = var_352_7 / var_352_10
					local var_352_13 = var_352_12 < var_352_11 and var_352_11 or var_352_12

					var_352_3.transform.localScale = Vector3.New(var_352_13, var_352_13, 0)
				end

				for iter_352_0, iter_352_1 in pairs(arg_349_1.bgs_) do
					if iter_352_0 ~= "ST14" then
						iter_352_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_352_14 = 0

			if var_352_14 < arg_349_1.time_ and arg_349_1.time_ <= var_352_14 + arg_352_0 then
				arg_349_1.mask_.enabled = true
				arg_349_1.mask_.raycastTarget = true

				arg_349_1:SetGaussion(false)
			end

			local var_352_15 = 2

			if var_352_14 <= arg_349_1.time_ and arg_349_1.time_ < var_352_14 + var_352_15 then
				local var_352_16 = (arg_349_1.time_ - var_352_14) / var_352_15
				local var_352_17 = Color.New(0, 0, 0)

				var_352_17.a = Mathf.Lerp(0, 1, var_352_16)
				arg_349_1.mask_.color = var_352_17
			end

			if arg_349_1.time_ >= var_352_14 + var_352_15 and arg_349_1.time_ < var_352_14 + var_352_15 + arg_352_0 then
				local var_352_18 = Color.New(0, 0, 0)

				var_352_18.a = 1
				arg_349_1.mask_.color = var_352_18
			end

			local var_352_19 = 2

			if var_352_19 < arg_349_1.time_ and arg_349_1.time_ <= var_352_19 + arg_352_0 then
				arg_349_1.mask_.enabled = true
				arg_349_1.mask_.raycastTarget = true

				arg_349_1:SetGaussion(false)
			end

			local var_352_20 = 2

			if var_352_19 <= arg_349_1.time_ and arg_349_1.time_ < var_352_19 + var_352_20 then
				local var_352_21 = (arg_349_1.time_ - var_352_19) / var_352_20
				local var_352_22 = Color.New(0, 0, 0)

				var_352_22.a = Mathf.Lerp(1, 0, var_352_21)
				arg_349_1.mask_.color = var_352_22
			end

			if arg_349_1.time_ >= var_352_19 + var_352_20 and arg_349_1.time_ < var_352_19 + var_352_20 + arg_352_0 then
				local var_352_23 = Color.New(0, 0, 0)
				local var_352_24 = 0

				arg_349_1.mask_.enabled = false
				var_352_23.a = var_352_24
				arg_349_1.mask_.color = var_352_23
			end

			local var_352_25 = arg_349_1.actors_["1011ui_story"].transform
			local var_352_26 = 2

			if var_352_26 < arg_349_1.time_ and arg_349_1.time_ <= var_352_26 + arg_352_0 then
				arg_349_1.var_.moveOldPos1011ui_story = var_352_25.localPosition
			end

			local var_352_27 = 0.001

			if var_352_26 <= arg_349_1.time_ and arg_349_1.time_ < var_352_26 + var_352_27 then
				local var_352_28 = (arg_349_1.time_ - var_352_26) / var_352_27
				local var_352_29 = Vector3.New(0, 100, 0)

				var_352_25.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1011ui_story, var_352_29, var_352_28)

				local var_352_30 = manager.ui.mainCamera.transform.position - var_352_25.position

				var_352_25.forward = Vector3.New(var_352_30.x, var_352_30.y, var_352_30.z)

				local var_352_31 = var_352_25.localEulerAngles

				var_352_31.z = 0
				var_352_31.x = 0
				var_352_25.localEulerAngles = var_352_31
			end

			if arg_349_1.time_ >= var_352_26 + var_352_27 and arg_349_1.time_ < var_352_26 + var_352_27 + arg_352_0 then
				var_352_25.localPosition = Vector3.New(0, 100, 0)

				local var_352_32 = manager.ui.mainCamera.transform.position - var_352_25.position

				var_352_25.forward = Vector3.New(var_352_32.x, var_352_32.y, var_352_32.z)

				local var_352_33 = var_352_25.localEulerAngles

				var_352_33.z = 0
				var_352_33.x = 0
				var_352_25.localEulerAngles = var_352_33
			end

			local var_352_34 = arg_349_1.actors_["1111ui_story"].transform
			local var_352_35 = 2

			if var_352_35 < arg_349_1.time_ and arg_349_1.time_ <= var_352_35 + arg_352_0 then
				arg_349_1.var_.moveOldPos1111ui_story = var_352_34.localPosition
			end

			local var_352_36 = 0.001

			if var_352_35 <= arg_349_1.time_ and arg_349_1.time_ < var_352_35 + var_352_36 then
				local var_352_37 = (arg_349_1.time_ - var_352_35) / var_352_36
				local var_352_38 = Vector3.New(0, 100, 0)

				var_352_34.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1111ui_story, var_352_38, var_352_37)

				local var_352_39 = manager.ui.mainCamera.transform.position - var_352_34.position

				var_352_34.forward = Vector3.New(var_352_39.x, var_352_39.y, var_352_39.z)

				local var_352_40 = var_352_34.localEulerAngles

				var_352_40.z = 0
				var_352_40.x = 0
				var_352_34.localEulerAngles = var_352_40
			end

			if arg_349_1.time_ >= var_352_35 + var_352_36 and arg_349_1.time_ < var_352_35 + var_352_36 + arg_352_0 then
				var_352_34.localPosition = Vector3.New(0, 100, 0)

				local var_352_41 = manager.ui.mainCamera.transform.position - var_352_34.position

				var_352_34.forward = Vector3.New(var_352_41.x, var_352_41.y, var_352_41.z)

				local var_352_42 = var_352_34.localEulerAngles

				var_352_42.z = 0
				var_352_42.x = 0
				var_352_34.localEulerAngles = var_352_42
			end

			local var_352_43 = arg_349_1.actors_["1011ui_story"].transform
			local var_352_44 = 4

			if var_352_44 < arg_349_1.time_ and arg_349_1.time_ <= var_352_44 + arg_352_0 then
				arg_349_1.var_.moveOldPos1011ui_story = var_352_43.localPosition
			end

			local var_352_45 = 0.001

			if var_352_44 <= arg_349_1.time_ and arg_349_1.time_ < var_352_44 + var_352_45 then
				local var_352_46 = (arg_349_1.time_ - var_352_44) / var_352_45
				local var_352_47 = Vector3.New(0, -0.71, -6)

				var_352_43.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1011ui_story, var_352_47, var_352_46)

				local var_352_48 = manager.ui.mainCamera.transform.position - var_352_43.position

				var_352_43.forward = Vector3.New(var_352_48.x, var_352_48.y, var_352_48.z)

				local var_352_49 = var_352_43.localEulerAngles

				var_352_49.z = 0
				var_352_49.x = 0
				var_352_43.localEulerAngles = var_352_49
			end

			if arg_349_1.time_ >= var_352_44 + var_352_45 and arg_349_1.time_ < var_352_44 + var_352_45 + arg_352_0 then
				var_352_43.localPosition = Vector3.New(0, -0.71, -6)

				local var_352_50 = manager.ui.mainCamera.transform.position - var_352_43.position

				var_352_43.forward = Vector3.New(var_352_50.x, var_352_50.y, var_352_50.z)

				local var_352_51 = var_352_43.localEulerAngles

				var_352_51.z = 0
				var_352_51.x = 0
				var_352_43.localEulerAngles = var_352_51
			end

			local var_352_52 = 4

			if var_352_52 < arg_349_1.time_ and arg_349_1.time_ <= var_352_52 + arg_352_0 then
				arg_349_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_352_53 = 2

			if var_352_53 < arg_349_1.time_ and arg_349_1.time_ <= var_352_53 + arg_352_0 then
				arg_349_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_352_54 = arg_349_1.actors_["1011ui_story"]
			local var_352_55 = 4

			if var_352_55 < arg_349_1.time_ and arg_349_1.time_ <= var_352_55 + arg_352_0 and arg_349_1.var_.characterEffect1011ui_story == nil then
				arg_349_1.var_.characterEffect1011ui_story = var_352_54:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_56 = 0.0166666666666667

			if var_352_55 <= arg_349_1.time_ and arg_349_1.time_ < var_352_55 + var_352_56 then
				local var_352_57 = (arg_349_1.time_ - var_352_55) / var_352_56

				if arg_349_1.var_.characterEffect1011ui_story then
					local var_352_58 = Mathf.Lerp(0, 0.5, var_352_57)

					arg_349_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_349_1.var_.characterEffect1011ui_story.fillRatio = var_352_58
				end
			end

			if arg_349_1.time_ >= var_352_55 + var_352_56 and arg_349_1.time_ < var_352_55 + var_352_56 + arg_352_0 and arg_349_1.var_.characterEffect1011ui_story then
				local var_352_59 = 0.5

				arg_349_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_349_1.var_.characterEffect1011ui_story.fillRatio = var_352_59
			end

			if arg_349_1.frameCnt_ <= 1 then
				arg_349_1.dialog_:SetActive(false)
			end

			local var_352_60 = 4
			local var_352_61 = 1

			if var_352_60 < arg_349_1.time_ and arg_349_1.time_ <= var_352_60 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0

				arg_349_1.dialog_:SetActive(true)

				local var_352_62 = LeanTween.value(arg_349_1.dialog_, 0, 1, 0.3)

				var_352_62:setOnUpdate(LuaHelper.FloatAction(function(arg_353_0)
					arg_349_1.dialogCg_.alpha = arg_353_0
				end))
				var_352_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_349_1.dialog_)
					var_352_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_349_1.duration_ = arg_349_1.duration_ + 0.3

				SetActive(arg_349_1.leftNameGo_, false)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_63 = arg_349_1:GetWordFromCfg(1101106085)
				local var_352_64 = arg_349_1:FormatText(var_352_63.content)

				arg_349_1.text_.text = var_352_64

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_65 = 40
				local var_352_66 = utf8.len(var_352_64)
				local var_352_67 = var_352_65 <= 0 and var_352_61 or var_352_61 * (var_352_66 / var_352_65)

				if var_352_67 > 0 and var_352_61 < var_352_67 then
					arg_349_1.talkMaxDuration = var_352_67
					var_352_60 = var_352_60 + 0.3

					if var_352_67 + var_352_60 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_67 + var_352_60
					end
				end

				arg_349_1.text_.text = var_352_64
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_68 = var_352_60 + 0.3
			local var_352_69 = math.max(var_352_61, arg_349_1.talkMaxDuration)

			if var_352_68 <= arg_349_1.time_ and arg_349_1.time_ < var_352_68 + var_352_69 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_68) / var_352_69

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_68 + var_352_69 and arg_349_1.time_ < var_352_68 + var_352_69 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106086 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 1101106086
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play1101106087(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = 0

			if var_358_0 < arg_355_1.time_ and arg_355_1.time_ <= var_358_0 + arg_358_0 then
				arg_355_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_358_1 = arg_355_1.actors_["1011ui_story"]
			local var_358_2 = 0

			if var_358_2 < arg_355_1.time_ and arg_355_1.time_ <= var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1011ui_story == nil then
				arg_355_1.var_.characterEffect1011ui_story = var_358_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_3 = 0.2

			if var_358_2 <= arg_355_1.time_ and arg_355_1.time_ < var_358_2 + var_358_3 then
				local var_358_4 = (arg_355_1.time_ - var_358_2) / var_358_3

				if arg_355_1.var_.characterEffect1011ui_story then
					arg_355_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_2 + var_358_3 and arg_355_1.time_ < var_358_2 + var_358_3 + arg_358_0 and arg_355_1.var_.characterEffect1011ui_story then
				arg_355_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_358_5 = 0
			local var_358_6 = 0.45

			if var_358_5 < arg_355_1.time_ and arg_355_1.time_ <= var_358_5 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_7 = arg_355_1:FormatText(StoryNameCfg[7].name)

				arg_355_1.leftNameTxt_.text = var_358_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_8 = arg_355_1:GetWordFromCfg(1101106086)
				local var_358_9 = arg_355_1:FormatText(var_358_8.content)

				arg_355_1.text_.text = var_358_9

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_10 = 18
				local var_358_11 = utf8.len(var_358_9)
				local var_358_12 = var_358_10 <= 0 and var_358_6 or var_358_6 * (var_358_11 / var_358_10)

				if var_358_12 > 0 and var_358_6 < var_358_12 then
					arg_355_1.talkMaxDuration = var_358_12

					if var_358_12 + var_358_5 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_12 + var_358_5
					end
				end

				arg_355_1.text_.text = var_358_9
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_13 = math.max(var_358_6, arg_355_1.talkMaxDuration)

			if var_358_5 <= arg_355_1.time_ and arg_355_1.time_ < var_358_5 + var_358_13 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_5) / var_358_13

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_5 + var_358_13 and arg_355_1.time_ < var_358_5 + var_358_13 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106087 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 1101106087
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play1101106088(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 0.575

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[7].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(1101106087)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 23
				local var_362_6 = utf8.len(var_362_4)
				local var_362_7 = var_362_5 <= 0 and var_362_1 or var_362_1 * (var_362_6 / var_362_5)

				if var_362_7 > 0 and var_362_1 < var_362_7 then
					arg_359_1.talkMaxDuration = var_362_7

					if var_362_7 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_7 + var_362_0
					end
				end

				arg_359_1.text_.text = var_362_4
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_8 = math.max(var_362_1, arg_359_1.talkMaxDuration)

			if var_362_0 <= arg_359_1.time_ and arg_359_1.time_ < var_362_0 + var_362_8 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_0) / var_362_8

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_0 + var_362_8 and arg_359_1.time_ < var_362_0 + var_362_8 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106088 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 1101106088
		arg_363_1.duration_ = 6.966

		local var_363_0 = {
			zh = 4.766,
			ja = 6.966
		}
		local var_363_1 = manager.audio:GetLocalizationFlag()

		if var_363_0[var_363_1] ~= nil then
			arg_363_1.duration_ = var_363_0[var_363_1]
		end

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play1101106089(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1011ui_story"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos1011ui_story = var_366_0.localPosition
			end

			local var_366_2 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2
				local var_366_4 = Vector3.New(0, -0.71, -6)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1011ui_story, var_366_4, var_366_3)

				local var_366_5 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_5.x, var_366_5.y, var_366_5.z)

				local var_366_6 = var_366_0.localEulerAngles

				var_366_6.z = 0
				var_366_6.x = 0
				var_366_0.localEulerAngles = var_366_6
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_366_7 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_7.x, var_366_7.y, var_366_7.z)

				local var_366_8 = var_366_0.localEulerAngles

				var_366_8.z = 0
				var_366_8.x = 0
				var_366_0.localEulerAngles = var_366_8
			end

			local var_366_9 = 0

			if var_366_9 < arg_363_1.time_ and arg_363_1.time_ <= var_366_9 + arg_366_0 then
				arg_363_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action8_1")
			end

			local var_366_10 = 0

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 then
				arg_363_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_366_11 = 0
			local var_366_12 = 0.625

			if var_366_11 < arg_363_1.time_ and arg_363_1.time_ <= var_366_11 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_13 = arg_363_1:FormatText(StoryNameCfg[37].name)

				arg_363_1.leftNameTxt_.text = var_366_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_14 = arg_363_1:GetWordFromCfg(1101106088)
				local var_366_15 = arg_363_1:FormatText(var_366_14.content)

				arg_363_1.text_.text = var_366_15

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_16 = 25
				local var_366_17 = utf8.len(var_366_15)
				local var_366_18 = var_366_16 <= 0 and var_366_12 or var_366_12 * (var_366_17 / var_366_16)

				if var_366_18 > 0 and var_366_12 < var_366_18 then
					arg_363_1.talkMaxDuration = var_366_18

					if var_366_18 + var_366_11 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_18 + var_366_11
					end
				end

				arg_363_1.text_.text = var_366_15
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb") ~= 0 then
					local var_366_19 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb") / 1000

					if var_366_19 + var_366_11 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_19 + var_366_11
					end

					if var_366_14.prefab_name ~= "" and arg_363_1.actors_[var_366_14.prefab_name] ~= nil then
						local var_366_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_14.prefab_name].transform, "story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb")

						arg_363_1:RecordAudio("1101106088", var_366_20)
						arg_363_1:RecordAudio("1101106088", var_366_20)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106088", "story_v_side_new_1101106.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_21 = math.max(var_366_12, arg_363_1.talkMaxDuration)

			if var_366_11 <= arg_363_1.time_ and arg_363_1.time_ < var_366_11 + var_366_21 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_11) / var_366_21

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_11 + var_366_21 and arg_363_1.time_ < var_366_11 + var_366_21 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106089 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 1101106089
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play1101106090(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1011ui_story"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and arg_367_1.var_.characterEffect1011ui_story == nil then
				arg_367_1.var_.characterEffect1011ui_story = var_370_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_2 = 0.200000002980232

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.characterEffect1011ui_story then
					local var_370_4 = Mathf.Lerp(0, 0.5, var_370_3)

					arg_367_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1011ui_story.fillRatio = var_370_4
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and arg_367_1.var_.characterEffect1011ui_story then
				local var_370_5 = 0.5

				arg_367_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1011ui_story.fillRatio = var_370_5
			end

			local var_370_6 = 0
			local var_370_7 = 0.125

			if var_370_6 < arg_367_1.time_ and arg_367_1.time_ <= var_370_6 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_8 = arg_367_1:FormatText(StoryNameCfg[7].name)

				arg_367_1.leftNameTxt_.text = var_370_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_9 = arg_367_1:GetWordFromCfg(1101106089)
				local var_370_10 = arg_367_1:FormatText(var_370_9.content)

				arg_367_1.text_.text = var_370_10

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_11 = 5
				local var_370_12 = utf8.len(var_370_10)
				local var_370_13 = var_370_11 <= 0 and var_370_7 or var_370_7 * (var_370_12 / var_370_11)

				if var_370_13 > 0 and var_370_7 < var_370_13 then
					arg_367_1.talkMaxDuration = var_370_13

					if var_370_13 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_13 + var_370_6
					end
				end

				arg_367_1.text_.text = var_370_10
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_14 = math.max(var_370_7, arg_367_1.talkMaxDuration)

			if var_370_6 <= arg_367_1.time_ and arg_367_1.time_ < var_370_6 + var_370_14 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_6) / var_370_14

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_6 + var_370_14 and arg_367_1.time_ < var_370_6 + var_370_14 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106090 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 1101106090
		arg_371_1.duration_ = 8.1

		local var_371_0 = {
			zh = 4.5,
			ja = 8.1
		}
		local var_371_1 = manager.audio:GetLocalizationFlag()

		if var_371_0[var_371_1] ~= nil then
			arg_371_1.duration_ = var_371_0[var_371_1]
		end

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play1101106091(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1011ui_story"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1011ui_story = var_374_0.localPosition
			end

			local var_374_2 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_2 then
				local var_374_3 = (arg_371_1.time_ - var_374_1) / var_374_2
				local var_374_4 = Vector3.New(0, -0.71, -6)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1011ui_story, var_374_4, var_374_3)

				local var_374_5 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_5.x, var_374_5.y, var_374_5.z)

				local var_374_6 = var_374_0.localEulerAngles

				var_374_6.z = 0
				var_374_6.x = 0
				var_374_0.localEulerAngles = var_374_6
			end

			if arg_371_1.time_ >= var_374_1 + var_374_2 and arg_371_1.time_ < var_374_1 + var_374_2 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_374_7 = manager.ui.mainCamera.transform.position - var_374_0.position

				var_374_0.forward = Vector3.New(var_374_7.x, var_374_7.y, var_374_7.z)

				local var_374_8 = var_374_0.localEulerAngles

				var_374_8.z = 0
				var_374_8.x = 0
				var_374_0.localEulerAngles = var_374_8
			end

			local var_374_9 = 0

			if var_374_9 < arg_371_1.time_ and arg_371_1.time_ <= var_374_9 + arg_374_0 then
				arg_371_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action484")
			end

			local var_374_10 = 0

			if var_374_10 < arg_371_1.time_ and arg_371_1.time_ <= var_374_10 + arg_374_0 then
				arg_371_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_374_11 = 0
			local var_374_12 = 0.275

			if var_374_11 < arg_371_1.time_ and arg_371_1.time_ <= var_374_11 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_13 = arg_371_1:FormatText(StoryNameCfg[37].name)

				arg_371_1.leftNameTxt_.text = var_374_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_14 = arg_371_1:GetWordFromCfg(1101106090)
				local var_374_15 = arg_371_1:FormatText(var_374_14.content)

				arg_371_1.text_.text = var_374_15

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_16 = 11
				local var_374_17 = utf8.len(var_374_15)
				local var_374_18 = var_374_16 <= 0 and var_374_12 or var_374_12 * (var_374_17 / var_374_16)

				if var_374_18 > 0 and var_374_12 < var_374_18 then
					arg_371_1.talkMaxDuration = var_374_18

					if var_374_18 + var_374_11 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_18 + var_374_11
					end
				end

				arg_371_1.text_.text = var_374_15
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb") ~= 0 then
					local var_374_19 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb") / 1000

					if var_374_19 + var_374_11 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_19 + var_374_11
					end

					if var_374_14.prefab_name ~= "" and arg_371_1.actors_[var_374_14.prefab_name] ~= nil then
						local var_374_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_14.prefab_name].transform, "story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb")

						arg_371_1:RecordAudio("1101106090", var_374_20)
						arg_371_1:RecordAudio("1101106090", var_374_20)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106090", "story_v_side_new_1101106.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_21 = math.max(var_374_12, arg_371_1.talkMaxDuration)

			if var_374_11 <= arg_371_1.time_ and arg_371_1.time_ < var_374_11 + var_374_21 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_11) / var_374_21

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_11 + var_374_21 and arg_371_1.time_ < var_374_11 + var_374_21 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106091 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 1101106091
		arg_375_1.duration_ = 6.3

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play1101106092(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 1

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				local var_378_1 = manager.ui.mainCamera.transform.localPosition
				local var_378_2 = Vector3.New(0, 0, 10) + Vector3.New(var_378_1.x, var_378_1.y, 0)
				local var_378_3 = arg_375_1.bgs_.STblack

				var_378_3.transform.localPosition = var_378_2
				var_378_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_378_4 = var_378_3:GetComponent("SpriteRenderer")

				if var_378_4 and var_378_4.sprite then
					local var_378_5 = (var_378_3.transform.localPosition - var_378_1).z
					local var_378_6 = manager.ui.mainCameraCom_
					local var_378_7 = 2 * var_378_5 * Mathf.Tan(var_378_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_378_8 = var_378_7 * var_378_6.aspect
					local var_378_9 = var_378_4.sprite.bounds.size.x
					local var_378_10 = var_378_4.sprite.bounds.size.y
					local var_378_11 = var_378_8 / var_378_9
					local var_378_12 = var_378_7 / var_378_10
					local var_378_13 = var_378_12 < var_378_11 and var_378_11 or var_378_12

					var_378_3.transform.localScale = Vector3.New(var_378_13, var_378_13, 0)
				end

				for iter_378_0, iter_378_1 in pairs(arg_375_1.bgs_) do
					if iter_378_0 ~= "STblack" then
						iter_378_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_378_14 = arg_375_1.actors_["1011ui_story"]
			local var_378_15 = 0

			if var_378_15 < arg_375_1.time_ and arg_375_1.time_ <= var_378_15 + arg_378_0 and arg_375_1.var_.characterEffect1011ui_story == nil then
				arg_375_1.var_.characterEffect1011ui_story = var_378_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_16 = 0.200000002980232

			if var_378_15 <= arg_375_1.time_ and arg_375_1.time_ < var_378_15 + var_378_16 then
				local var_378_17 = (arg_375_1.time_ - var_378_15) / var_378_16

				if arg_375_1.var_.characterEffect1011ui_story then
					local var_378_18 = Mathf.Lerp(0, 0.5, var_378_17)

					arg_375_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_375_1.var_.characterEffect1011ui_story.fillRatio = var_378_18
				end
			end

			if arg_375_1.time_ >= var_378_15 + var_378_16 and arg_375_1.time_ < var_378_15 + var_378_16 + arg_378_0 and arg_375_1.var_.characterEffect1011ui_story then
				local var_378_19 = 0.5

				arg_375_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_375_1.var_.characterEffect1011ui_story.fillRatio = var_378_19
			end

			local var_378_20 = 0

			if var_378_20 < arg_375_1.time_ and arg_375_1.time_ <= var_378_20 + arg_378_0 then
				arg_375_1.mask_.enabled = true
				arg_375_1.mask_.raycastTarget = true

				arg_375_1:SetGaussion(false)
			end

			local var_378_21 = 1

			if var_378_20 <= arg_375_1.time_ and arg_375_1.time_ < var_378_20 + var_378_21 then
				local var_378_22 = (arg_375_1.time_ - var_378_20) / var_378_21
				local var_378_23 = Color.New(0, 0, 0)

				var_378_23.a = Mathf.Lerp(0, 1, var_378_22)
				arg_375_1.mask_.color = var_378_23
			end

			if arg_375_1.time_ >= var_378_20 + var_378_21 and arg_375_1.time_ < var_378_20 + var_378_21 + arg_378_0 then
				local var_378_24 = Color.New(0, 0, 0)

				var_378_24.a = 1
				arg_375_1.mask_.color = var_378_24
			end

			local var_378_25 = 1

			if var_378_25 < arg_375_1.time_ and arg_375_1.time_ <= var_378_25 + arg_378_0 then
				arg_375_1.mask_.enabled = true
				arg_375_1.mask_.raycastTarget = true

				arg_375_1:SetGaussion(false)
			end

			local var_378_26 = 0.3

			if var_378_25 <= arg_375_1.time_ and arg_375_1.time_ < var_378_25 + var_378_26 then
				local var_378_27 = (arg_375_1.time_ - var_378_25) / var_378_26
				local var_378_28 = Color.New(0, 0, 0)

				var_378_28.a = Mathf.Lerp(1, 0, var_378_27)
				arg_375_1.mask_.color = var_378_28
			end

			if arg_375_1.time_ >= var_378_25 + var_378_26 and arg_375_1.time_ < var_378_25 + var_378_26 + arg_378_0 then
				local var_378_29 = Color.New(0, 0, 0)
				local var_378_30 = 0

				arg_375_1.mask_.enabled = false
				var_378_29.a = var_378_30
				arg_375_1.mask_.color = var_378_29
			end

			local var_378_31 = arg_375_1.actors_["1011ui_story"].transform
			local var_378_32 = 1

			if var_378_32 < arg_375_1.time_ and arg_375_1.time_ <= var_378_32 + arg_378_0 then
				arg_375_1.var_.moveOldPos1011ui_story = var_378_31.localPosition
			end

			local var_378_33 = 0.001

			if var_378_32 <= arg_375_1.time_ and arg_375_1.time_ < var_378_32 + var_378_33 then
				local var_378_34 = (arg_375_1.time_ - var_378_32) / var_378_33
				local var_378_35 = Vector3.New(0, 100, 0)

				var_378_31.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1011ui_story, var_378_35, var_378_34)

				local var_378_36 = manager.ui.mainCamera.transform.position - var_378_31.position

				var_378_31.forward = Vector3.New(var_378_36.x, var_378_36.y, var_378_36.z)

				local var_378_37 = var_378_31.localEulerAngles

				var_378_37.z = 0
				var_378_37.x = 0
				var_378_31.localEulerAngles = var_378_37
			end

			if arg_375_1.time_ >= var_378_32 + var_378_33 and arg_375_1.time_ < var_378_32 + var_378_33 + arg_378_0 then
				var_378_31.localPosition = Vector3.New(0, 100, 0)

				local var_378_38 = manager.ui.mainCamera.transform.position - var_378_31.position

				var_378_31.forward = Vector3.New(var_378_38.x, var_378_38.y, var_378_38.z)

				local var_378_39 = var_378_31.localEulerAngles

				var_378_39.z = 0
				var_378_39.x = 0
				var_378_31.localEulerAngles = var_378_39
			end

			local var_378_40 = 1.1
			local var_378_41 = 0.75

			if var_378_40 < arg_375_1.time_ and arg_375_1.time_ <= var_378_40 + arg_378_0 then
				local var_378_42 = "play"
				local var_378_43 = "effect"

				arg_375_1:AudioAction(var_378_42, var_378_43, "se_story_side_1011", "se_story_side_1011_whale", "")
			end

			if arg_375_1.frameCnt_ <= 1 then
				arg_375_1.dialog_:SetActive(false)
			end

			local var_378_44 = 1.3
			local var_378_45 = 0.55

			if var_378_44 < arg_375_1.time_ and arg_375_1.time_ <= var_378_44 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0

				arg_375_1.dialog_:SetActive(true)

				local var_378_46 = LeanTween.value(arg_375_1.dialog_, 0, 1, 0.3)

				var_378_46:setOnUpdate(LuaHelper.FloatAction(function(arg_379_0)
					arg_375_1.dialogCg_.alpha = arg_379_0
				end))
				var_378_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_375_1.dialog_)
					var_378_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_375_1.duration_ = arg_375_1.duration_ + 0.3

				SetActive(arg_375_1.leftNameGo_, false)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_47 = arg_375_1:GetWordFromCfg(1101106091)
				local var_378_48 = arg_375_1:FormatText(var_378_47.content)

				arg_375_1.text_.text = var_378_48

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_49 = 22
				local var_378_50 = utf8.len(var_378_48)
				local var_378_51 = var_378_49 <= 0 and var_378_45 or var_378_45 * (var_378_50 / var_378_49)

				if var_378_51 > 0 and var_378_45 < var_378_51 then
					arg_375_1.talkMaxDuration = var_378_51
					var_378_44 = var_378_44 + 0.3

					if var_378_51 + var_378_44 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_51 + var_378_44
					end
				end

				arg_375_1.text_.text = var_378_48
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)
				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_52 = var_378_44 + 0.3
			local var_378_53 = math.max(var_378_45, arg_375_1.talkMaxDuration)

			if var_378_52 <= arg_375_1.time_ and arg_375_1.time_ < var_378_52 + var_378_53 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_52) / var_378_53

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_52 + var_378_53 and arg_375_1.time_ < var_378_52 + var_378_53 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106092 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 1101106092
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play1101106093(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.95

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, false)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_2 = arg_381_1:GetWordFromCfg(1101106092)
				local var_384_3 = arg_381_1:FormatText(var_384_2.content)

				arg_381_1.text_.text = var_384_3

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_4 = 38
				local var_384_5 = utf8.len(var_384_3)
				local var_384_6 = var_384_4 <= 0 and var_384_1 or var_384_1 * (var_384_5 / var_384_4)

				if var_384_6 > 0 and var_384_1 < var_384_6 then
					arg_381_1.talkMaxDuration = var_384_6

					if var_384_6 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_6 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_3
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_7 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_7 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_7

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_7 and arg_381_1.time_ < var_384_0 + var_384_7 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106093 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 1101106093
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play1101106094(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 0.65

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_2 = arg_385_1:FormatText(StoryNameCfg[7].name)

				arg_385_1.leftNameTxt_.text = var_388_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_3 = arg_385_1:GetWordFromCfg(1101106093)
				local var_388_4 = arg_385_1:FormatText(var_388_3.content)

				arg_385_1.text_.text = var_388_4

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_5 = 26
				local var_388_6 = utf8.len(var_388_4)
				local var_388_7 = var_388_5 <= 0 and var_388_1 or var_388_1 * (var_388_6 / var_388_5)

				if var_388_7 > 0 and var_388_1 < var_388_7 then
					arg_385_1.talkMaxDuration = var_388_7

					if var_388_7 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_7 + var_388_0
					end
				end

				arg_385_1.text_.text = var_388_4
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_8 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_8 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_8

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_8 and arg_385_1.time_ < var_388_0 + var_388_8 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106094 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 1101106094
		arg_389_1.duration_ = 3.166

		local var_389_0 = {
			zh = 2.966,
			ja = 3.166
		}
		local var_389_1 = manager.audio:GetLocalizationFlag()

		if var_389_0[var_389_1] ~= nil then
			arg_389_1.duration_ = var_389_0[var_389_1]
		end

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play1101106095(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1011ui_story"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos1011ui_story = var_392_0.localPosition
			end

			local var_392_2 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2
				local var_392_4 = Vector3.New(0, -0.71, -6)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1011ui_story, var_392_4, var_392_3)

				local var_392_5 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_5.x, var_392_5.y, var_392_5.z)

				local var_392_6 = var_392_0.localEulerAngles

				var_392_6.z = 0
				var_392_6.x = 0
				var_392_0.localEulerAngles = var_392_6
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_392_7 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_7.x, var_392_7.y, var_392_7.z)

				local var_392_8 = var_392_0.localEulerAngles

				var_392_8.z = 0
				var_392_8.x = 0
				var_392_0.localEulerAngles = var_392_8
			end

			local var_392_9 = arg_389_1.actors_["1011ui_story"]
			local var_392_10 = 0

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 and arg_389_1.var_.characterEffect1011ui_story == nil then
				arg_389_1.var_.characterEffect1011ui_story = var_392_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_11 = 0.200000002980232

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_11 then
				local var_392_12 = (arg_389_1.time_ - var_392_10) / var_392_11

				if arg_389_1.var_.characterEffect1011ui_story then
					arg_389_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_10 + var_392_11 and arg_389_1.time_ < var_392_10 + var_392_11 + arg_392_0 and arg_389_1.var_.characterEffect1011ui_story then
				arg_389_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_392_13 = 0

			if var_392_13 < arg_389_1.time_ and arg_389_1.time_ <= var_392_13 + arg_392_0 then
				arg_389_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_392_14 = 0

			if var_392_14 < arg_389_1.time_ and arg_389_1.time_ <= var_392_14 + arg_392_0 then
				arg_389_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_392_15 = 0
			local var_392_16 = 0.175

			if var_392_15 < arg_389_1.time_ and arg_389_1.time_ <= var_392_15 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_17 = arg_389_1:FormatText(StoryNameCfg[37].name)

				arg_389_1.leftNameTxt_.text = var_392_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_18 = arg_389_1:GetWordFromCfg(1101106094)
				local var_392_19 = arg_389_1:FormatText(var_392_18.content)

				arg_389_1.text_.text = var_392_19

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_20 = 7
				local var_392_21 = utf8.len(var_392_19)
				local var_392_22 = var_392_20 <= 0 and var_392_16 or var_392_16 * (var_392_21 / var_392_20)

				if var_392_22 > 0 and var_392_16 < var_392_22 then
					arg_389_1.talkMaxDuration = var_392_22

					if var_392_22 + var_392_15 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_22 + var_392_15
					end
				end

				arg_389_1.text_.text = var_392_19
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb") ~= 0 then
					local var_392_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb") / 1000

					if var_392_23 + var_392_15 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_23 + var_392_15
					end

					if var_392_18.prefab_name ~= "" and arg_389_1.actors_[var_392_18.prefab_name] ~= nil then
						local var_392_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_18.prefab_name].transform, "story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb")

						arg_389_1:RecordAudio("1101106094", var_392_24)
						arg_389_1:RecordAudio("1101106094", var_392_24)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106094", "story_v_side_new_1101106.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_25 = math.max(var_392_16, arg_389_1.talkMaxDuration)

			if var_392_15 <= arg_389_1.time_ and arg_389_1.time_ < var_392_15 + var_392_25 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_15) / var_392_25

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_15 + var_392_25 and arg_389_1.time_ < var_392_15 + var_392_25 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106095 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 1101106095
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play1101106096(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1011ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect1011ui_story == nil then
				arg_393_1.var_.characterEffect1011ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.200000002980232

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect1011ui_story then
					local var_396_4 = Mathf.Lerp(0, 0.5, var_396_3)

					arg_393_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1011ui_story.fillRatio = var_396_4
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect1011ui_story then
				local var_396_5 = 0.5

				arg_393_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1011ui_story.fillRatio = var_396_5
			end

			local var_396_6 = 0
			local var_396_7 = 0.225

			if var_396_6 < arg_393_1.time_ and arg_393_1.time_ <= var_396_6 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_8 = arg_393_1:FormatText(StoryNameCfg[7].name)

				arg_393_1.leftNameTxt_.text = var_396_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_9 = arg_393_1:GetWordFromCfg(1101106095)
				local var_396_10 = arg_393_1:FormatText(var_396_9.content)

				arg_393_1.text_.text = var_396_10

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_11 = 9
				local var_396_12 = utf8.len(var_396_10)
				local var_396_13 = var_396_11 <= 0 and var_396_7 or var_396_7 * (var_396_12 / var_396_11)

				if var_396_13 > 0 and var_396_7 < var_396_13 then
					arg_393_1.talkMaxDuration = var_396_13

					if var_396_13 + var_396_6 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_13 + var_396_6
					end
				end

				arg_393_1.text_.text = var_396_10
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_14 = math.max(var_396_7, arg_393_1.talkMaxDuration)

			if var_396_6 <= arg_393_1.time_ and arg_393_1.time_ < var_396_6 + var_396_14 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_6) / var_396_14

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_6 + var_396_14 and arg_393_1.time_ < var_396_6 + var_396_14 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106096 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 1101106096
		arg_397_1.duration_ = 5.133

		local var_397_0 = {
			zh = 5.133,
			ja = 1.5
		}
		local var_397_1 = manager.audio:GetLocalizationFlag()

		if var_397_0[var_397_1] ~= nil then
			arg_397_1.duration_ = var_397_0[var_397_1]
		end

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play1101106097(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1011ui_story"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.characterEffect1011ui_story == nil then
				arg_397_1.var_.characterEffect1011ui_story = var_400_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_2 = 0.200000002980232

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.characterEffect1011ui_story then
					arg_397_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.characterEffect1011ui_story then
				arg_397_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_400_4 = 0
			local var_400_5 = 0.3

			if var_400_4 < arg_397_1.time_ and arg_397_1.time_ <= var_400_4 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_6 = arg_397_1:FormatText(StoryNameCfg[37].name)

				arg_397_1.leftNameTxt_.text = var_400_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_7 = arg_397_1:GetWordFromCfg(1101106096)
				local var_400_8 = arg_397_1:FormatText(var_400_7.content)

				arg_397_1.text_.text = var_400_8

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_9 = 12
				local var_400_10 = utf8.len(var_400_8)
				local var_400_11 = var_400_9 <= 0 and var_400_5 or var_400_5 * (var_400_10 / var_400_9)

				if var_400_11 > 0 and var_400_5 < var_400_11 then
					arg_397_1.talkMaxDuration = var_400_11

					if var_400_11 + var_400_4 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_11 + var_400_4
					end
				end

				arg_397_1.text_.text = var_400_8
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb") ~= 0 then
					local var_400_12 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb") / 1000

					if var_400_12 + var_400_4 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_12 + var_400_4
					end

					if var_400_7.prefab_name ~= "" and arg_397_1.actors_[var_400_7.prefab_name] ~= nil then
						local var_400_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_7.prefab_name].transform, "story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb")

						arg_397_1:RecordAudio("1101106096", var_400_13)
						arg_397_1:RecordAudio("1101106096", var_400_13)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106096", "story_v_side_new_1101106.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_14 = math.max(var_400_5, arg_397_1.talkMaxDuration)

			if var_400_4 <= arg_397_1.time_ and arg_397_1.time_ < var_400_4 + var_400_14 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_4) / var_400_14

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_4 + var_400_14 and arg_397_1.time_ < var_400_4 + var_400_14 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106097 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 1101106097
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play1101106098(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1011ui_story"]
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 and arg_401_1.var_.characterEffect1011ui_story == nil then
				arg_401_1.var_.characterEffect1011ui_story = var_404_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_2 = 0.200000002980232

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2

				if arg_401_1.var_.characterEffect1011ui_story then
					local var_404_4 = Mathf.Lerp(0, 0.5, var_404_3)

					arg_401_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_401_1.var_.characterEffect1011ui_story.fillRatio = var_404_4
				end
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 and arg_401_1.var_.characterEffect1011ui_story then
				local var_404_5 = 0.5

				arg_401_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_401_1.var_.characterEffect1011ui_story.fillRatio = var_404_5
			end

			local var_404_6 = 0
			local var_404_7 = 0.8

			if var_404_6 < arg_401_1.time_ and arg_401_1.time_ <= var_404_6 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_8 = arg_401_1:GetWordFromCfg(1101106097)
				local var_404_9 = arg_401_1:FormatText(var_404_8.content)

				arg_401_1.text_.text = var_404_9

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_10 = 32
				local var_404_11 = utf8.len(var_404_9)
				local var_404_12 = var_404_10 <= 0 and var_404_7 or var_404_7 * (var_404_11 / var_404_10)

				if var_404_12 > 0 and var_404_7 < var_404_12 then
					arg_401_1.talkMaxDuration = var_404_12

					if var_404_12 + var_404_6 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_12 + var_404_6
					end
				end

				arg_401_1.text_.text = var_404_9
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_13 = math.max(var_404_7, arg_401_1.talkMaxDuration)

			if var_404_6 <= arg_401_1.time_ and arg_401_1.time_ < var_404_6 + var_404_13 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_6) / var_404_13

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_6 + var_404_13 and arg_401_1.time_ < var_404_6 + var_404_13 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106098 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 1101106098
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play1101106099(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 0.65

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, false)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_2 = arg_405_1:GetWordFromCfg(1101106098)
				local var_408_3 = arg_405_1:FormatText(var_408_2.content)

				arg_405_1.text_.text = var_408_3

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_4 = 26
				local var_408_5 = utf8.len(var_408_3)
				local var_408_6 = var_408_4 <= 0 and var_408_1 or var_408_1 * (var_408_5 / var_408_4)

				if var_408_6 > 0 and var_408_1 < var_408_6 then
					arg_405_1.talkMaxDuration = var_408_6

					if var_408_6 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_6 + var_408_0
					end
				end

				arg_405_1.text_.text = var_408_3
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_7 = math.max(var_408_1, arg_405_1.talkMaxDuration)

			if var_408_0 <= arg_405_1.time_ and arg_405_1.time_ < var_408_0 + var_408_7 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_0) / var_408_7

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_0 + var_408_7 and arg_405_1.time_ < var_408_0 + var_408_7 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106099 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 1101106099
		arg_409_1.duration_ = 1.999999999999

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play1101106100(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1011ui_story"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos1011ui_story = var_412_0.localPosition
			end

			local var_412_2 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2
				local var_412_4 = Vector3.New(0, -0.71, -6)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos1011ui_story, var_412_4, var_412_3)

				local var_412_5 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_5.x, var_412_5.y, var_412_5.z)

				local var_412_6 = var_412_0.localEulerAngles

				var_412_6.z = 0
				var_412_6.x = 0
				var_412_0.localEulerAngles = var_412_6
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_412_7 = manager.ui.mainCamera.transform.position - var_412_0.position

				var_412_0.forward = Vector3.New(var_412_7.x, var_412_7.y, var_412_7.z)

				local var_412_8 = var_412_0.localEulerAngles

				var_412_8.z = 0
				var_412_8.x = 0
				var_412_0.localEulerAngles = var_412_8
			end

			local var_412_9 = arg_409_1.actors_["1011ui_story"]
			local var_412_10 = 0

			if var_412_10 < arg_409_1.time_ and arg_409_1.time_ <= var_412_10 + arg_412_0 and arg_409_1.var_.characterEffect1011ui_story == nil then
				arg_409_1.var_.characterEffect1011ui_story = var_412_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_11 = 0.200000002980232

			if var_412_10 <= arg_409_1.time_ and arg_409_1.time_ < var_412_10 + var_412_11 then
				local var_412_12 = (arg_409_1.time_ - var_412_10) / var_412_11

				if arg_409_1.var_.characterEffect1011ui_story then
					arg_409_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_10 + var_412_11 and arg_409_1.time_ < var_412_10 + var_412_11 + arg_412_0 and arg_409_1.var_.characterEffect1011ui_story then
				arg_409_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_412_13 = 0

			if var_412_13 < arg_409_1.time_ and arg_409_1.time_ <= var_412_13 + arg_412_0 then
				arg_409_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_2")
			end

			local var_412_14 = 0
			local var_412_15 = 0.125

			if var_412_14 < arg_409_1.time_ and arg_409_1.time_ <= var_412_14 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_16 = arg_409_1:FormatText(StoryNameCfg[37].name)

				arg_409_1.leftNameTxt_.text = var_412_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_17 = arg_409_1:GetWordFromCfg(1101106099)
				local var_412_18 = arg_409_1:FormatText(var_412_17.content)

				arg_409_1.text_.text = var_412_18

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_19 = 5
				local var_412_20 = utf8.len(var_412_18)
				local var_412_21 = var_412_19 <= 0 and var_412_15 or var_412_15 * (var_412_20 / var_412_19)

				if var_412_21 > 0 and var_412_15 < var_412_21 then
					arg_409_1.talkMaxDuration = var_412_21

					if var_412_21 + var_412_14 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_21 + var_412_14
					end
				end

				arg_409_1.text_.text = var_412_18
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb") ~= 0 then
					local var_412_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb") / 1000

					if var_412_22 + var_412_14 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_22 + var_412_14
					end

					if var_412_17.prefab_name ~= "" and arg_409_1.actors_[var_412_17.prefab_name] ~= nil then
						local var_412_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_17.prefab_name].transform, "story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb")

						arg_409_1:RecordAudio("1101106099", var_412_23)
						arg_409_1:RecordAudio("1101106099", var_412_23)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106099", "story_v_side_new_1101106.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_24 = math.max(var_412_15, arg_409_1.talkMaxDuration)

			if var_412_14 <= arg_409_1.time_ and arg_409_1.time_ < var_412_14 + var_412_24 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_14) / var_412_24

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_14 + var_412_24 and arg_409_1.time_ < var_412_14 + var_412_24 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106100 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 1101106100
		arg_413_1.duration_ = 5

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play1101106101(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1011ui_story"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.characterEffect1011ui_story == nil then
				arg_413_1.var_.characterEffect1011ui_story = var_416_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_2 = 0.200000002980232

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.characterEffect1011ui_story then
					local var_416_4 = Mathf.Lerp(0, 0.5, var_416_3)

					arg_413_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_413_1.var_.characterEffect1011ui_story.fillRatio = var_416_4
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.characterEffect1011ui_story then
				local var_416_5 = 0.5

				arg_413_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_413_1.var_.characterEffect1011ui_story.fillRatio = var_416_5
			end

			local var_416_6 = 0
			local var_416_7 = 0.8

			if var_416_6 < arg_413_1.time_ and arg_413_1.time_ <= var_416_6 + arg_416_0 then
				local var_416_8 = "play"
				local var_416_9 = "effect"

				arg_413_1:AudioAction(var_416_8, var_416_9, "se_story_side_1011", "se_story_side_1011_tour", "")
			end

			local var_416_10 = 0
			local var_416_11 = 0.8

			if var_416_10 < arg_413_1.time_ and arg_413_1.time_ <= var_416_10 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, false)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_12 = arg_413_1:GetWordFromCfg(1101106100)
				local var_416_13 = arg_413_1:FormatText(var_416_12.content)

				arg_413_1.text_.text = var_416_13

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_14 = 32
				local var_416_15 = utf8.len(var_416_13)
				local var_416_16 = var_416_14 <= 0 and var_416_11 or var_416_11 * (var_416_15 / var_416_14)

				if var_416_16 > 0 and var_416_11 < var_416_16 then
					arg_413_1.talkMaxDuration = var_416_16

					if var_416_16 + var_416_10 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_16 + var_416_10
					end
				end

				arg_413_1.text_.text = var_416_13
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_17 = math.max(var_416_11, arg_413_1.talkMaxDuration)

			if var_416_10 <= arg_413_1.time_ and arg_413_1.time_ < var_416_10 + var_416_17 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_10) / var_416_17

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_10 + var_416_17 and arg_413_1.time_ < var_416_10 + var_416_17 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106101 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 1101106101
		arg_417_1.duration_ = 9.1

		local var_417_0 = {
			zh = 4.233,
			ja = 9.1
		}
		local var_417_1 = manager.audio:GetLocalizationFlag()

		if var_417_0[var_417_1] ~= nil then
			arg_417_1.duration_ = var_417_0[var_417_1]
		end

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play1101106102(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1011ui_story"].transform
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				arg_417_1.var_.moveOldPos1011ui_story = var_420_0.localPosition
			end

			local var_420_2 = 0.001

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2
				local var_420_4 = Vector3.New(0, -0.71, -6)

				var_420_0.localPosition = Vector3.Lerp(arg_417_1.var_.moveOldPos1011ui_story, var_420_4, var_420_3)

				local var_420_5 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_5.x, var_420_5.y, var_420_5.z)

				local var_420_6 = var_420_0.localEulerAngles

				var_420_6.z = 0
				var_420_6.x = 0
				var_420_0.localEulerAngles = var_420_6
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 then
				var_420_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_420_7 = manager.ui.mainCamera.transform.position - var_420_0.position

				var_420_0.forward = Vector3.New(var_420_7.x, var_420_7.y, var_420_7.z)

				local var_420_8 = var_420_0.localEulerAngles

				var_420_8.z = 0
				var_420_8.x = 0
				var_420_0.localEulerAngles = var_420_8
			end

			local var_420_9 = arg_417_1.actors_["1011ui_story"]
			local var_420_10 = 0

			if var_420_10 < arg_417_1.time_ and arg_417_1.time_ <= var_420_10 + arg_420_0 and arg_417_1.var_.characterEffect1011ui_story == nil then
				arg_417_1.var_.characterEffect1011ui_story = var_420_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_11 = 0.200000002980232

			if var_420_10 <= arg_417_1.time_ and arg_417_1.time_ < var_420_10 + var_420_11 then
				local var_420_12 = (arg_417_1.time_ - var_420_10) / var_420_11

				if arg_417_1.var_.characterEffect1011ui_story then
					arg_417_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_10 + var_420_11 and arg_417_1.time_ < var_420_10 + var_420_11 + arg_420_0 and arg_417_1.var_.characterEffect1011ui_story then
				arg_417_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_420_13 = 0

			if var_420_13 < arg_417_1.time_ and arg_417_1.time_ <= var_420_13 + arg_420_0 then
				arg_417_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_420_14 = 0

			if var_420_14 < arg_417_1.time_ and arg_417_1.time_ <= var_420_14 + arg_420_0 then
				arg_417_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_420_15 = 0
			local var_420_16 = 0.25

			if var_420_15 < arg_417_1.time_ and arg_417_1.time_ <= var_420_15 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_17 = arg_417_1:FormatText(StoryNameCfg[37].name)

				arg_417_1.leftNameTxt_.text = var_420_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_18 = arg_417_1:GetWordFromCfg(1101106101)
				local var_420_19 = arg_417_1:FormatText(var_420_18.content)

				arg_417_1.text_.text = var_420_19

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_20 = 12
				local var_420_21 = utf8.len(var_420_19)
				local var_420_22 = var_420_20 <= 0 and var_420_16 or var_420_16 * (var_420_21 / var_420_20)

				if var_420_22 > 0 and var_420_16 < var_420_22 then
					arg_417_1.talkMaxDuration = var_420_22

					if var_420_22 + var_420_15 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_22 + var_420_15
					end
				end

				arg_417_1.text_.text = var_420_19
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb") ~= 0 then
					local var_420_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb") / 1000

					if var_420_23 + var_420_15 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_23 + var_420_15
					end

					if var_420_18.prefab_name ~= "" and arg_417_1.actors_[var_420_18.prefab_name] ~= nil then
						local var_420_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_18.prefab_name].transform, "story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb")

						arg_417_1:RecordAudio("1101106101", var_420_24)
						arg_417_1:RecordAudio("1101106101", var_420_24)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106101", "story_v_side_new_1101106.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_25 = math.max(var_420_16, arg_417_1.talkMaxDuration)

			if var_420_15 <= arg_417_1.time_ and arg_417_1.time_ < var_420_15 + var_420_25 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_15) / var_420_25

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_15 + var_420_25 and arg_417_1.time_ < var_420_15 + var_420_25 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106102 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 1101106102
		arg_421_1.duration_ = 9

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play1101106103(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = "I06"

			if arg_421_1.bgs_[var_424_0] == nil then
				local var_424_1 = Object.Instantiate(arg_421_1.paintGo_)

				var_424_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_424_0)
				var_424_1.name = var_424_0
				var_424_1.transform.parent = arg_421_1.stage_.transform
				var_424_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_421_1.bgs_[var_424_0] = var_424_1
			end

			local var_424_2 = 2

			if var_424_2 < arg_421_1.time_ and arg_421_1.time_ <= var_424_2 + arg_424_0 then
				local var_424_3 = manager.ui.mainCamera.transform.localPosition
				local var_424_4 = Vector3.New(0, 0, 10) + Vector3.New(var_424_3.x, var_424_3.y, 0)
				local var_424_5 = arg_421_1.bgs_.I06

				var_424_5.transform.localPosition = var_424_4
				var_424_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_424_6 = var_424_5:GetComponent("SpriteRenderer")

				if var_424_6 and var_424_6.sprite then
					local var_424_7 = (var_424_5.transform.localPosition - var_424_3).z
					local var_424_8 = manager.ui.mainCameraCom_
					local var_424_9 = 2 * var_424_7 * Mathf.Tan(var_424_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_424_10 = var_424_9 * var_424_8.aspect
					local var_424_11 = var_424_6.sprite.bounds.size.x
					local var_424_12 = var_424_6.sprite.bounds.size.y
					local var_424_13 = var_424_10 / var_424_11
					local var_424_14 = var_424_9 / var_424_12
					local var_424_15 = var_424_14 < var_424_13 and var_424_13 or var_424_14

					var_424_5.transform.localScale = Vector3.New(var_424_15, var_424_15, 0)
				end

				for iter_424_0, iter_424_1 in pairs(arg_421_1.bgs_) do
					if iter_424_0 ~= "I06" then
						iter_424_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_424_16 = 0

			if var_424_16 < arg_421_1.time_ and arg_421_1.time_ <= var_424_16 + arg_424_0 then
				arg_421_1.mask_.enabled = true
				arg_421_1.mask_.raycastTarget = true

				arg_421_1:SetGaussion(false)
			end

			local var_424_17 = 2

			if var_424_16 <= arg_421_1.time_ and arg_421_1.time_ < var_424_16 + var_424_17 then
				local var_424_18 = (arg_421_1.time_ - var_424_16) / var_424_17
				local var_424_19 = Color.New(0, 0, 0)

				var_424_19.a = Mathf.Lerp(0, 1, var_424_18)
				arg_421_1.mask_.color = var_424_19
			end

			if arg_421_1.time_ >= var_424_16 + var_424_17 and arg_421_1.time_ < var_424_16 + var_424_17 + arg_424_0 then
				local var_424_20 = Color.New(0, 0, 0)

				var_424_20.a = 1
				arg_421_1.mask_.color = var_424_20
			end

			local var_424_21 = 2

			if var_424_21 < arg_421_1.time_ and arg_421_1.time_ <= var_424_21 + arg_424_0 then
				arg_421_1.mask_.enabled = true
				arg_421_1.mask_.raycastTarget = true

				arg_421_1:SetGaussion(false)
			end

			local var_424_22 = 2

			if var_424_21 <= arg_421_1.time_ and arg_421_1.time_ < var_424_21 + var_424_22 then
				local var_424_23 = (arg_421_1.time_ - var_424_21) / var_424_22
				local var_424_24 = Color.New(0, 0, 0)

				var_424_24.a = Mathf.Lerp(1, 0, var_424_23)
				arg_421_1.mask_.color = var_424_24
			end

			if arg_421_1.time_ >= var_424_21 + var_424_22 and arg_421_1.time_ < var_424_21 + var_424_22 + arg_424_0 then
				local var_424_25 = Color.New(0, 0, 0)
				local var_424_26 = 0

				arg_421_1.mask_.enabled = false
				var_424_25.a = var_424_26
				arg_421_1.mask_.color = var_424_25
			end

			local var_424_27 = arg_421_1.actors_["1011ui_story"].transform
			local var_424_28 = 2

			if var_424_28 < arg_421_1.time_ and arg_421_1.time_ <= var_424_28 + arg_424_0 then
				arg_421_1.var_.moveOldPos1011ui_story = var_424_27.localPosition
			end

			local var_424_29 = 0.001

			if var_424_28 <= arg_421_1.time_ and arg_421_1.time_ < var_424_28 + var_424_29 then
				local var_424_30 = (arg_421_1.time_ - var_424_28) / var_424_29
				local var_424_31 = Vector3.New(0, 100, 0)

				var_424_27.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos1011ui_story, var_424_31, var_424_30)

				local var_424_32 = manager.ui.mainCamera.transform.position - var_424_27.position

				var_424_27.forward = Vector3.New(var_424_32.x, var_424_32.y, var_424_32.z)

				local var_424_33 = var_424_27.localEulerAngles

				var_424_33.z = 0
				var_424_33.x = 0
				var_424_27.localEulerAngles = var_424_33
			end

			if arg_421_1.time_ >= var_424_28 + var_424_29 and arg_421_1.time_ < var_424_28 + var_424_29 + arg_424_0 then
				var_424_27.localPosition = Vector3.New(0, 100, 0)

				local var_424_34 = manager.ui.mainCamera.transform.position - var_424_27.position

				var_424_27.forward = Vector3.New(var_424_34.x, var_424_34.y, var_424_34.z)

				local var_424_35 = var_424_27.localEulerAngles

				var_424_35.z = 0
				var_424_35.x = 0
				var_424_27.localEulerAngles = var_424_35
			end

			local var_424_36 = arg_421_1.actors_["1011ui_story"]
			local var_424_37 = 2

			if var_424_37 < arg_421_1.time_ and arg_421_1.time_ <= var_424_37 + arg_424_0 and arg_421_1.var_.characterEffect1011ui_story == nil then
				arg_421_1.var_.characterEffect1011ui_story = var_424_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_38 = 0.200000002980232

			if var_424_37 <= arg_421_1.time_ and arg_421_1.time_ < var_424_37 + var_424_38 then
				local var_424_39 = (arg_421_1.time_ - var_424_37) / var_424_38

				if arg_421_1.var_.characterEffect1011ui_story then
					local var_424_40 = Mathf.Lerp(0, 0.5, var_424_39)

					arg_421_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1011ui_story.fillRatio = var_424_40
				end
			end

			if arg_421_1.time_ >= var_424_37 + var_424_38 and arg_421_1.time_ < var_424_37 + var_424_38 + arg_424_0 and arg_421_1.var_.characterEffect1011ui_story then
				local var_424_41 = 0.5

				arg_421_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1011ui_story.fillRatio = var_424_41
			end

			if arg_421_1.frameCnt_ <= 1 then
				arg_421_1.dialog_:SetActive(false)
			end

			local var_424_42 = 4
			local var_424_43 = 0.875

			if var_424_42 < arg_421_1.time_ and arg_421_1.time_ <= var_424_42 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0

				arg_421_1.dialog_:SetActive(true)

				local var_424_44 = LeanTween.value(arg_421_1.dialog_, 0, 1, 0.3)

				var_424_44:setOnUpdate(LuaHelper.FloatAction(function(arg_425_0)
					arg_421_1.dialogCg_.alpha = arg_425_0
				end))
				var_424_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_421_1.dialog_)
					var_424_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_421_1.duration_ = arg_421_1.duration_ + 0.3

				SetActive(arg_421_1.leftNameGo_, false)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_45 = arg_421_1:GetWordFromCfg(1101106102)
				local var_424_46 = arg_421_1:FormatText(var_424_45.content)

				arg_421_1.text_.text = var_424_46

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_47 = 35
				local var_424_48 = utf8.len(var_424_46)
				local var_424_49 = var_424_47 <= 0 and var_424_43 or var_424_43 * (var_424_48 / var_424_47)

				if var_424_49 > 0 and var_424_43 < var_424_49 then
					arg_421_1.talkMaxDuration = var_424_49
					var_424_42 = var_424_42 + 0.3

					if var_424_49 + var_424_42 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_49 + var_424_42
					end
				end

				arg_421_1.text_.text = var_424_46
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_50 = var_424_42 + 0.3
			local var_424_51 = math.max(var_424_43, arg_421_1.talkMaxDuration)

			if var_424_50 <= arg_421_1.time_ and arg_421_1.time_ < var_424_50 + var_424_51 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_50) / var_424_51

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_50 + var_424_51 and arg_421_1.time_ < var_424_50 + var_424_51 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106103 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 1101106103
		arg_427_1.duration_ = 5

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play1101106104(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 0.4

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_2 = arg_427_1:FormatText(StoryNameCfg[7].name)

				arg_427_1.leftNameTxt_.text = var_430_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_3 = arg_427_1:GetWordFromCfg(1101106103)
				local var_430_4 = arg_427_1:FormatText(var_430_3.content)

				arg_427_1.text_.text = var_430_4

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_5 = 16
				local var_430_6 = utf8.len(var_430_4)
				local var_430_7 = var_430_5 <= 0 and var_430_1 or var_430_1 * (var_430_6 / var_430_5)

				if var_430_7 > 0 and var_430_1 < var_430_7 then
					arg_427_1.talkMaxDuration = var_430_7

					if var_430_7 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_7 + var_430_0
					end
				end

				arg_427_1.text_.text = var_430_4
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)
				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_8 = math.max(var_430_1, arg_427_1.talkMaxDuration)

			if var_430_0 <= arg_427_1.time_ and arg_427_1.time_ < var_430_0 + var_430_8 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_0) / var_430_8

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_0 + var_430_8 and arg_427_1.time_ < var_430_0 + var_430_8 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106104 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 1101106104
		arg_431_1.duration_ = 9.7

		local var_431_0 = {
			zh = 9.7,
			ja = 6.7
		}
		local var_431_1 = manager.audio:GetLocalizationFlag()

		if var_431_0[var_431_1] ~= nil then
			arg_431_1.duration_ = var_431_0[var_431_1]
		end

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play1101106105(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["1011ui_story"].transform
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 then
				arg_431_1.var_.moveOldPos1011ui_story = var_434_0.localPosition
			end

			local var_434_2 = 0.001

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2
				local var_434_4 = Vector3.New(0, -0.71, -6)

				var_434_0.localPosition = Vector3.Lerp(arg_431_1.var_.moveOldPos1011ui_story, var_434_4, var_434_3)

				local var_434_5 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_5.x, var_434_5.y, var_434_5.z)

				local var_434_6 = var_434_0.localEulerAngles

				var_434_6.z = 0
				var_434_6.x = 0
				var_434_0.localEulerAngles = var_434_6
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 then
				var_434_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_434_7 = manager.ui.mainCamera.transform.position - var_434_0.position

				var_434_0.forward = Vector3.New(var_434_7.x, var_434_7.y, var_434_7.z)

				local var_434_8 = var_434_0.localEulerAngles

				var_434_8.z = 0
				var_434_8.x = 0
				var_434_0.localEulerAngles = var_434_8
			end

			local var_434_9 = arg_431_1.actors_["1011ui_story"]
			local var_434_10 = 0

			if var_434_10 < arg_431_1.time_ and arg_431_1.time_ <= var_434_10 + arg_434_0 and arg_431_1.var_.characterEffect1011ui_story == nil then
				arg_431_1.var_.characterEffect1011ui_story = var_434_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_11 = 0.200000002980232

			if var_434_10 <= arg_431_1.time_ and arg_431_1.time_ < var_434_10 + var_434_11 then
				local var_434_12 = (arg_431_1.time_ - var_434_10) / var_434_11

				if arg_431_1.var_.characterEffect1011ui_story then
					arg_431_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_10 + var_434_11 and arg_431_1.time_ < var_434_10 + var_434_11 + arg_434_0 and arg_431_1.var_.characterEffect1011ui_story then
				arg_431_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_434_13 = 0

			if var_434_13 < arg_431_1.time_ and arg_431_1.time_ <= var_434_13 + arg_434_0 then
				arg_431_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_434_14 = 0

			if var_434_14 < arg_431_1.time_ and arg_431_1.time_ <= var_434_14 + arg_434_0 then
				arg_431_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_434_15 = 0
			local var_434_16 = 0.8

			if var_434_15 < arg_431_1.time_ and arg_431_1.time_ <= var_434_15 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_17 = arg_431_1:FormatText(StoryNameCfg[37].name)

				arg_431_1.leftNameTxt_.text = var_434_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_18 = arg_431_1:GetWordFromCfg(1101106104)
				local var_434_19 = arg_431_1:FormatText(var_434_18.content)

				arg_431_1.text_.text = var_434_19

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_20 = 32
				local var_434_21 = utf8.len(var_434_19)
				local var_434_22 = var_434_20 <= 0 and var_434_16 or var_434_16 * (var_434_21 / var_434_20)

				if var_434_22 > 0 and var_434_16 < var_434_22 then
					arg_431_1.talkMaxDuration = var_434_22

					if var_434_22 + var_434_15 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_22 + var_434_15
					end
				end

				arg_431_1.text_.text = var_434_19
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb") ~= 0 then
					local var_434_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb") / 1000

					if var_434_23 + var_434_15 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_23 + var_434_15
					end

					if var_434_18.prefab_name ~= "" and arg_431_1.actors_[var_434_18.prefab_name] ~= nil then
						local var_434_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_18.prefab_name].transform, "story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb")

						arg_431_1:RecordAudio("1101106104", var_434_24)
						arg_431_1:RecordAudio("1101106104", var_434_24)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106104", "story_v_side_new_1101106.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_25 = math.max(var_434_16, arg_431_1.talkMaxDuration)

			if var_434_15 <= arg_431_1.time_ and arg_431_1.time_ < var_434_15 + var_434_25 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_15) / var_434_25

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_15 + var_434_25 and arg_431_1.time_ < var_434_15 + var_434_25 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106105 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 1101106105
		arg_435_1.duration_ = 5

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play1101106106(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["1011ui_story"]
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 and arg_435_1.var_.characterEffect1011ui_story == nil then
				arg_435_1.var_.characterEffect1011ui_story = var_438_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_2 = 0.200000002980232

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2

				if arg_435_1.var_.characterEffect1011ui_story then
					local var_438_4 = Mathf.Lerp(0, 0.5, var_438_3)

					arg_435_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_435_1.var_.characterEffect1011ui_story.fillRatio = var_438_4
				end
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 and arg_435_1.var_.characterEffect1011ui_story then
				local var_438_5 = 0.5

				arg_435_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_435_1.var_.characterEffect1011ui_story.fillRatio = var_438_5
			end

			local var_438_6 = 0
			local var_438_7 = 0.15

			if var_438_6 < arg_435_1.time_ and arg_435_1.time_ <= var_438_6 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_8 = arg_435_1:FormatText(StoryNameCfg[7].name)

				arg_435_1.leftNameTxt_.text = var_438_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_9 = arg_435_1:GetWordFromCfg(1101106105)
				local var_438_10 = arg_435_1:FormatText(var_438_9.content)

				arg_435_1.text_.text = var_438_10

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_11 = 6
				local var_438_12 = utf8.len(var_438_10)
				local var_438_13 = var_438_11 <= 0 and var_438_7 or var_438_7 * (var_438_12 / var_438_11)

				if var_438_13 > 0 and var_438_7 < var_438_13 then
					arg_435_1.talkMaxDuration = var_438_13

					if var_438_13 + var_438_6 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_13 + var_438_6
					end
				end

				arg_435_1.text_.text = var_438_10
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)
				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_14 = math.max(var_438_7, arg_435_1.talkMaxDuration)

			if var_438_6 <= arg_435_1.time_ and arg_435_1.time_ < var_438_6 + var_438_14 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_6) / var_438_14

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_6 + var_438_14 and arg_435_1.time_ < var_438_6 + var_438_14 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106106 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 1101106106
		arg_439_1.duration_ = 3

		local var_439_0 = {
			zh = 3,
			ja = 2.733
		}
		local var_439_1 = manager.audio:GetLocalizationFlag()

		if var_439_0[var_439_1] ~= nil then
			arg_439_1.duration_ = var_439_0[var_439_1]
		end

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play1101106107(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1011ui_story"]
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 and arg_439_1.var_.characterEffect1011ui_story == nil then
				arg_439_1.var_.characterEffect1011ui_story = var_442_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_2 = 0.200000002980232

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2

				if arg_439_1.var_.characterEffect1011ui_story then
					arg_439_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 and arg_439_1.var_.characterEffect1011ui_story then
				arg_439_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_442_4 = 0

			if var_442_4 < arg_439_1.time_ and arg_439_1.time_ <= var_442_4 + arg_442_0 then
				arg_439_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_442_5 = 0
			local var_442_6 = 0.225

			if var_442_5 < arg_439_1.time_ and arg_439_1.time_ <= var_442_5 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_7 = arg_439_1:FormatText(StoryNameCfg[37].name)

				arg_439_1.leftNameTxt_.text = var_442_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_8 = arg_439_1:GetWordFromCfg(1101106106)
				local var_442_9 = arg_439_1:FormatText(var_442_8.content)

				arg_439_1.text_.text = var_442_9

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_10 = 9
				local var_442_11 = utf8.len(var_442_9)
				local var_442_12 = var_442_10 <= 0 and var_442_6 or var_442_6 * (var_442_11 / var_442_10)

				if var_442_12 > 0 and var_442_6 < var_442_12 then
					arg_439_1.talkMaxDuration = var_442_12

					if var_442_12 + var_442_5 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_12 + var_442_5
					end
				end

				arg_439_1.text_.text = var_442_9
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb") ~= 0 then
					local var_442_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb") / 1000

					if var_442_13 + var_442_5 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_13 + var_442_5
					end

					if var_442_8.prefab_name ~= "" and arg_439_1.actors_[var_442_8.prefab_name] ~= nil then
						local var_442_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_8.prefab_name].transform, "story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb")

						arg_439_1:RecordAudio("1101106106", var_442_14)
						arg_439_1:RecordAudio("1101106106", var_442_14)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106106", "story_v_side_new_1101106.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_15 = math.max(var_442_6, arg_439_1.talkMaxDuration)

			if var_442_5 <= arg_439_1.time_ and arg_439_1.time_ < var_442_5 + var_442_15 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_5) / var_442_15

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_5 + var_442_15 and arg_439_1.time_ < var_442_5 + var_442_15 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106107 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 1101106107
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play1101106108(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1011ui_story"].transform
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				arg_443_1.var_.moveOldPos1011ui_story = var_446_0.localPosition
			end

			local var_446_2 = 0.001

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2
				local var_446_4 = Vector3.New(0, -0.71, -6)

				var_446_0.localPosition = Vector3.Lerp(arg_443_1.var_.moveOldPos1011ui_story, var_446_4, var_446_3)

				local var_446_5 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_5.x, var_446_5.y, var_446_5.z)

				local var_446_6 = var_446_0.localEulerAngles

				var_446_6.z = 0
				var_446_6.x = 0
				var_446_0.localEulerAngles = var_446_6
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 then
				var_446_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_446_7 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_7.x, var_446_7.y, var_446_7.z)

				local var_446_8 = var_446_0.localEulerAngles

				var_446_8.z = 0
				var_446_8.x = 0
				var_446_0.localEulerAngles = var_446_8
			end

			local var_446_9 = 0

			if var_446_9 < arg_443_1.time_ and arg_443_1.time_ <= var_446_9 + arg_446_0 then
				arg_443_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action428")
			end

			local var_446_10 = 0
			local var_446_11 = 0.325

			if var_446_10 < arg_443_1.time_ and arg_443_1.time_ <= var_446_10 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, false)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_12 = arg_443_1:GetWordFromCfg(1101106107)
				local var_446_13 = arg_443_1:FormatText(var_446_12.content)

				arg_443_1.text_.text = var_446_13

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_14 = 13
				local var_446_15 = utf8.len(var_446_13)
				local var_446_16 = var_446_14 <= 0 and var_446_11 or var_446_11 * (var_446_15 / var_446_14)

				if var_446_16 > 0 and var_446_11 < var_446_16 then
					arg_443_1.talkMaxDuration = var_446_16

					if var_446_16 + var_446_10 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_16 + var_446_10
					end
				end

				arg_443_1.text_.text = var_446_13
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_17 = math.max(var_446_11, arg_443_1.talkMaxDuration)

			if var_446_10 <= arg_443_1.time_ and arg_443_1.time_ < var_446_10 + var_446_17 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_10) / var_446_17

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_10 + var_446_17 and arg_443_1.time_ < var_446_10 + var_446_17 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106108 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 1101106108
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play1101106109(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 1.075

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_2 = arg_447_1:FormatText(StoryNameCfg[7].name)

				arg_447_1.leftNameTxt_.text = var_450_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_3 = arg_447_1:GetWordFromCfg(1101106108)
				local var_450_4 = arg_447_1:FormatText(var_450_3.content)

				arg_447_1.text_.text = var_450_4

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_5 = 43
				local var_450_6 = utf8.len(var_450_4)
				local var_450_7 = var_450_5 <= 0 and var_450_1 or var_450_1 * (var_450_6 / var_450_5)

				if var_450_7 > 0 and var_450_1 < var_450_7 then
					arg_447_1.talkMaxDuration = var_450_7

					if var_450_7 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_7 + var_450_0
					end
				end

				arg_447_1.text_.text = var_450_4
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_8 = math.max(var_450_1, arg_447_1.talkMaxDuration)

			if var_450_0 <= arg_447_1.time_ and arg_447_1.time_ < var_450_0 + var_450_8 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_0) / var_450_8

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_0 + var_450_8 and arg_447_1.time_ < var_450_0 + var_450_8 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106109 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 1101106109
		arg_451_1.duration_ = 5

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play1101106110(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["1011ui_story"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos1011ui_story = var_454_0.localPosition
			end

			local var_454_2 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2
				local var_454_4 = Vector3.New(0, 100, 0)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos1011ui_story, var_454_4, var_454_3)

				local var_454_5 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_5.x, var_454_5.y, var_454_5.z)

				local var_454_6 = var_454_0.localEulerAngles

				var_454_6.z = 0
				var_454_6.x = 0
				var_454_0.localEulerAngles = var_454_6
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(0, 100, 0)

				local var_454_7 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_7.x, var_454_7.y, var_454_7.z)

				local var_454_8 = var_454_0.localEulerAngles

				var_454_8.z = 0
				var_454_8.x = 0
				var_454_0.localEulerAngles = var_454_8
			end

			local var_454_9 = 0
			local var_454_10 = 0.925

			if var_454_9 < arg_451_1.time_ and arg_451_1.time_ <= var_454_9 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, false)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_11 = arg_451_1:GetWordFromCfg(1101106109)
				local var_454_12 = arg_451_1:FormatText(var_454_11.content)

				arg_451_1.text_.text = var_454_12

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_13 = 37
				local var_454_14 = utf8.len(var_454_12)
				local var_454_15 = var_454_13 <= 0 and var_454_10 or var_454_10 * (var_454_14 / var_454_13)

				if var_454_15 > 0 and var_454_10 < var_454_15 then
					arg_451_1.talkMaxDuration = var_454_15

					if var_454_15 + var_454_9 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_15 + var_454_9
					end
				end

				arg_451_1.text_.text = var_454_12
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_16 = math.max(var_454_10, arg_451_1.talkMaxDuration)

			if var_454_9 <= arg_451_1.time_ and arg_451_1.time_ < var_454_9 + var_454_16 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_9) / var_454_16

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_9 + var_454_16 and arg_451_1.time_ < var_454_9 + var_454_16 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106110 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 1101106110
		arg_455_1.duration_ = 5

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play1101106111(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0
			local var_458_1 = 0.7

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_2 = arg_455_1:FormatText(StoryNameCfg[7].name)

				arg_455_1.leftNameTxt_.text = var_458_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_3 = arg_455_1:GetWordFromCfg(1101106110)
				local var_458_4 = arg_455_1:FormatText(var_458_3.content)

				arg_455_1.text_.text = var_458_4

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_5 = 28
				local var_458_6 = utf8.len(var_458_4)
				local var_458_7 = var_458_5 <= 0 and var_458_1 or var_458_1 * (var_458_6 / var_458_5)

				if var_458_7 > 0 and var_458_1 < var_458_7 then
					arg_455_1.talkMaxDuration = var_458_7

					if var_458_7 + var_458_0 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_7 + var_458_0
					end
				end

				arg_455_1.text_.text = var_458_4
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)
				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_8 = math.max(var_458_1, arg_455_1.talkMaxDuration)

			if var_458_0 <= arg_455_1.time_ and arg_455_1.time_ < var_458_0 + var_458_8 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_0) / var_458_8

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_0 + var_458_8 and arg_455_1.time_ < var_458_0 + var_458_8 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106111 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 1101106111
		arg_459_1.duration_ = 5

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play1101106112(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = 0
			local var_462_1 = 0.2

			if var_462_0 < arg_459_1.time_ and arg_459_1.time_ <= var_462_0 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_2 = arg_459_1:FormatText(StoryNameCfg[7].name)

				arg_459_1.leftNameTxt_.text = var_462_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_3 = arg_459_1:GetWordFromCfg(1101106111)
				local var_462_4 = arg_459_1:FormatText(var_462_3.content)

				arg_459_1.text_.text = var_462_4

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_5 = 8
				local var_462_6 = utf8.len(var_462_4)
				local var_462_7 = var_462_5 <= 0 and var_462_1 or var_462_1 * (var_462_6 / var_462_5)

				if var_462_7 > 0 and var_462_1 < var_462_7 then
					arg_459_1.talkMaxDuration = var_462_7

					if var_462_7 + var_462_0 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_7 + var_462_0
					end
				end

				arg_459_1.text_.text = var_462_4
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)
				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_8 = math.max(var_462_1, arg_459_1.talkMaxDuration)

			if var_462_0 <= arg_459_1.time_ and arg_459_1.time_ < var_462_0 + var_462_8 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_0) / var_462_8

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_0 + var_462_8 and arg_459_1.time_ < var_462_0 + var_462_8 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106112 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 1101106112
		arg_463_1.duration_ = 7.033

		local var_463_0 = {
			zh = 7.033,
			ja = 5.4
		}
		local var_463_1 = manager.audio:GetLocalizationFlag()

		if var_463_0[var_463_1] ~= nil then
			arg_463_1.duration_ = var_463_0[var_463_1]
		end

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play1101106113(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["1011ui_story"].transform
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				arg_463_1.var_.moveOldPos1011ui_story = var_466_0.localPosition
			end

			local var_466_2 = 0.001

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_2 then
				local var_466_3 = (arg_463_1.time_ - var_466_1) / var_466_2
				local var_466_4 = Vector3.New(0, -0.71, -6)

				var_466_0.localPosition = Vector3.Lerp(arg_463_1.var_.moveOldPos1011ui_story, var_466_4, var_466_3)

				local var_466_5 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_5.x, var_466_5.y, var_466_5.z)

				local var_466_6 = var_466_0.localEulerAngles

				var_466_6.z = 0
				var_466_6.x = 0
				var_466_0.localEulerAngles = var_466_6
			end

			if arg_463_1.time_ >= var_466_1 + var_466_2 and arg_463_1.time_ < var_466_1 + var_466_2 + arg_466_0 then
				var_466_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_466_7 = manager.ui.mainCamera.transform.position - var_466_0.position

				var_466_0.forward = Vector3.New(var_466_7.x, var_466_7.y, var_466_7.z)

				local var_466_8 = var_466_0.localEulerAngles

				var_466_8.z = 0
				var_466_8.x = 0
				var_466_0.localEulerAngles = var_466_8
			end

			local var_466_9 = arg_463_1.actors_["1011ui_story"]
			local var_466_10 = 0

			if var_466_10 < arg_463_1.time_ and arg_463_1.time_ <= var_466_10 + arg_466_0 and arg_463_1.var_.characterEffect1011ui_story == nil then
				arg_463_1.var_.characterEffect1011ui_story = var_466_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_466_11 = 0.200000002980232

			if var_466_10 <= arg_463_1.time_ and arg_463_1.time_ < var_466_10 + var_466_11 then
				local var_466_12 = (arg_463_1.time_ - var_466_10) / var_466_11

				if arg_463_1.var_.characterEffect1011ui_story then
					arg_463_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_463_1.time_ >= var_466_10 + var_466_11 and arg_463_1.time_ < var_466_10 + var_466_11 + arg_466_0 and arg_463_1.var_.characterEffect1011ui_story then
				arg_463_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_466_13 = 0

			if var_466_13 < arg_463_1.time_ and arg_463_1.time_ <= var_466_13 + arg_466_0 then
				arg_463_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_466_14 = 0
			local var_466_15 = 0.8

			if var_466_14 < arg_463_1.time_ and arg_463_1.time_ <= var_466_14 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_16 = arg_463_1:FormatText(StoryNameCfg[37].name)

				arg_463_1.leftNameTxt_.text = var_466_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_17 = arg_463_1:GetWordFromCfg(1101106112)
				local var_466_18 = arg_463_1:FormatText(var_466_17.content)

				arg_463_1.text_.text = var_466_18

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_19 = 32
				local var_466_20 = utf8.len(var_466_18)
				local var_466_21 = var_466_19 <= 0 and var_466_15 or var_466_15 * (var_466_20 / var_466_19)

				if var_466_21 > 0 and var_466_15 < var_466_21 then
					arg_463_1.talkMaxDuration = var_466_21

					if var_466_21 + var_466_14 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_21 + var_466_14
					end
				end

				arg_463_1.text_.text = var_466_18
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb") ~= 0 then
					local var_466_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb") / 1000

					if var_466_22 + var_466_14 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_22 + var_466_14
					end

					if var_466_17.prefab_name ~= "" and arg_463_1.actors_[var_466_17.prefab_name] ~= nil then
						local var_466_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_17.prefab_name].transform, "story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb")

						arg_463_1:RecordAudio("1101106112", var_466_23)
						arg_463_1:RecordAudio("1101106112", var_466_23)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106112", "story_v_side_new_1101106.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_24 = math.max(var_466_15, arg_463_1.talkMaxDuration)

			if var_466_14 <= arg_463_1.time_ and arg_463_1.time_ < var_466_14 + var_466_24 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_14) / var_466_24

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_14 + var_466_24 and arg_463_1.time_ < var_466_14 + var_466_24 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106113 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 1101106113
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play1101106114(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["1011ui_story"]
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 and arg_467_1.var_.characterEffect1011ui_story == nil then
				arg_467_1.var_.characterEffect1011ui_story = var_470_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_470_2 = 0.200000002980232

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_2 then
				local var_470_3 = (arg_467_1.time_ - var_470_1) / var_470_2

				if arg_467_1.var_.characterEffect1011ui_story then
					local var_470_4 = Mathf.Lerp(0, 0.5, var_470_3)

					arg_467_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_467_1.var_.characterEffect1011ui_story.fillRatio = var_470_4
				end
			end

			if arg_467_1.time_ >= var_470_1 + var_470_2 and arg_467_1.time_ < var_470_1 + var_470_2 + arg_470_0 and arg_467_1.var_.characterEffect1011ui_story then
				local var_470_5 = 0.5

				arg_467_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_467_1.var_.characterEffect1011ui_story.fillRatio = var_470_5
			end

			local var_470_6 = 0
			local var_470_7 = 0.275

			if var_470_6 < arg_467_1.time_ and arg_467_1.time_ <= var_470_6 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_8 = arg_467_1:FormatText(StoryNameCfg[7].name)

				arg_467_1.leftNameTxt_.text = var_470_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_9 = arg_467_1:GetWordFromCfg(1101106113)
				local var_470_10 = arg_467_1:FormatText(var_470_9.content)

				arg_467_1.text_.text = var_470_10

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_11 = 11
				local var_470_12 = utf8.len(var_470_10)
				local var_470_13 = var_470_11 <= 0 and var_470_7 or var_470_7 * (var_470_12 / var_470_11)

				if var_470_13 > 0 and var_470_7 < var_470_13 then
					arg_467_1.talkMaxDuration = var_470_13

					if var_470_13 + var_470_6 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_13 + var_470_6
					end
				end

				arg_467_1.text_.text = var_470_10
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)
				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_14 = math.max(var_470_7, arg_467_1.talkMaxDuration)

			if var_470_6 <= arg_467_1.time_ and arg_467_1.time_ < var_470_6 + var_470_14 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_6) / var_470_14

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_6 + var_470_14 and arg_467_1.time_ < var_470_6 + var_470_14 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106114 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 1101106114
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play1101106115(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0
			local var_474_1 = 0.6

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_2 = arg_471_1:GetWordFromCfg(1101106114)
				local var_474_3 = arg_471_1:FormatText(var_474_2.content)

				arg_471_1.text_.text = var_474_3

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_4 = 24
				local var_474_5 = utf8.len(var_474_3)
				local var_474_6 = var_474_4 <= 0 and var_474_1 or var_474_1 * (var_474_5 / var_474_4)

				if var_474_6 > 0 and var_474_1 < var_474_6 then
					arg_471_1.talkMaxDuration = var_474_6

					if var_474_6 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_6 + var_474_0
					end
				end

				arg_471_1.text_.text = var_474_3
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_7 = math.max(var_474_1, arg_471_1.talkMaxDuration)

			if var_474_0 <= arg_471_1.time_ and arg_471_1.time_ < var_474_0 + var_474_7 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_0) / var_474_7

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_0 + var_474_7 and arg_471_1.time_ < var_474_0 + var_474_7 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106115 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 1101106115
		arg_475_1.duration_ = 5

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play1101106116(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0
			local var_478_1 = 0.65

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_2 = arg_475_1:FormatText(StoryNameCfg[7].name)

				arg_475_1.leftNameTxt_.text = var_478_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_3 = arg_475_1:GetWordFromCfg(1101106115)
				local var_478_4 = arg_475_1:FormatText(var_478_3.content)

				arg_475_1.text_.text = var_478_4

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_5 = 26
				local var_478_6 = utf8.len(var_478_4)
				local var_478_7 = var_478_5 <= 0 and var_478_1 or var_478_1 * (var_478_6 / var_478_5)

				if var_478_7 > 0 and var_478_1 < var_478_7 then
					arg_475_1.talkMaxDuration = var_478_7

					if var_478_7 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_7 + var_478_0
					end
				end

				arg_475_1.text_.text = var_478_4
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)
				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_8 = math.max(var_478_1, arg_475_1.talkMaxDuration)

			if var_478_0 <= arg_475_1.time_ and arg_475_1.time_ < var_478_0 + var_478_8 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_0) / var_478_8

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_0 + var_478_8 and arg_475_1.time_ < var_478_0 + var_478_8 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106116 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 1101106116
		arg_479_1.duration_ = 3.8

		local var_479_0 = {
			zh = 3.233,
			ja = 3.8
		}
		local var_479_1 = manager.audio:GetLocalizationFlag()

		if var_479_0[var_479_1] ~= nil then
			arg_479_1.duration_ = var_479_0[var_479_1]
		end

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play1101106117(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["1011ui_story"].transform
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 then
				arg_479_1.var_.moveOldPos1011ui_story = var_482_0.localPosition
			end

			local var_482_2 = 0.001

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2
				local var_482_4 = Vector3.New(0, -0.71, -6)

				var_482_0.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos1011ui_story, var_482_4, var_482_3)

				local var_482_5 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_5.x, var_482_5.y, var_482_5.z)

				local var_482_6 = var_482_0.localEulerAngles

				var_482_6.z = 0
				var_482_6.x = 0
				var_482_0.localEulerAngles = var_482_6
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 then
				var_482_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_482_7 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_7.x, var_482_7.y, var_482_7.z)

				local var_482_8 = var_482_0.localEulerAngles

				var_482_8.z = 0
				var_482_8.x = 0
				var_482_0.localEulerAngles = var_482_8
			end

			local var_482_9 = arg_479_1.actors_["1011ui_story"]
			local var_482_10 = 0

			if var_482_10 < arg_479_1.time_ and arg_479_1.time_ <= var_482_10 + arg_482_0 and arg_479_1.var_.characterEffect1011ui_story == nil then
				arg_479_1.var_.characterEffect1011ui_story = var_482_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_11 = 0.200000002980232

			if var_482_10 <= arg_479_1.time_ and arg_479_1.time_ < var_482_10 + var_482_11 then
				local var_482_12 = (arg_479_1.time_ - var_482_10) / var_482_11

				if arg_479_1.var_.characterEffect1011ui_story then
					arg_479_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_479_1.time_ >= var_482_10 + var_482_11 and arg_479_1.time_ < var_482_10 + var_482_11 + arg_482_0 and arg_479_1.var_.characterEffect1011ui_story then
				arg_479_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_482_13 = 0

			if var_482_13 < arg_479_1.time_ and arg_479_1.time_ <= var_482_13 + arg_482_0 then
				arg_479_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action8_2")
			end

			local var_482_14 = 0

			if var_482_14 < arg_479_1.time_ and arg_479_1.time_ <= var_482_14 + arg_482_0 then
				arg_479_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_482_15 = 0
			local var_482_16 = 0.2

			if var_482_15 < arg_479_1.time_ and arg_479_1.time_ <= var_482_15 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_17 = arg_479_1:FormatText(StoryNameCfg[37].name)

				arg_479_1.leftNameTxt_.text = var_482_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_18 = arg_479_1:GetWordFromCfg(1101106116)
				local var_482_19 = arg_479_1:FormatText(var_482_18.content)

				arg_479_1.text_.text = var_482_19

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_20 = 8
				local var_482_21 = utf8.len(var_482_19)
				local var_482_22 = var_482_20 <= 0 and var_482_16 or var_482_16 * (var_482_21 / var_482_20)

				if var_482_22 > 0 and var_482_16 < var_482_22 then
					arg_479_1.talkMaxDuration = var_482_22

					if var_482_22 + var_482_15 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_22 + var_482_15
					end
				end

				arg_479_1.text_.text = var_482_19
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb") ~= 0 then
					local var_482_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb") / 1000

					if var_482_23 + var_482_15 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_23 + var_482_15
					end

					if var_482_18.prefab_name ~= "" and arg_479_1.actors_[var_482_18.prefab_name] ~= nil then
						local var_482_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_18.prefab_name].transform, "story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb")

						arg_479_1:RecordAudio("1101106116", var_482_24)
						arg_479_1:RecordAudio("1101106116", var_482_24)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106116", "story_v_side_new_1101106.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_25 = math.max(var_482_16, arg_479_1.talkMaxDuration)

			if var_482_15 <= arg_479_1.time_ and arg_479_1.time_ < var_482_15 + var_482_25 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_15) / var_482_25

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_15 + var_482_25 and arg_479_1.time_ < var_482_15 + var_482_25 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106117 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 1101106117
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play1101106118(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1011ui_story"]
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 and arg_483_1.var_.characterEffect1011ui_story == nil then
				arg_483_1.var_.characterEffect1011ui_story = var_486_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_2 = 0.200000002980232

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2

				if arg_483_1.var_.characterEffect1011ui_story then
					local var_486_4 = Mathf.Lerp(0, 0.5, var_486_3)

					arg_483_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_483_1.var_.characterEffect1011ui_story.fillRatio = var_486_4
				end
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 and arg_483_1.var_.characterEffect1011ui_story then
				local var_486_5 = 0.5

				arg_483_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_483_1.var_.characterEffect1011ui_story.fillRatio = var_486_5
			end

			local var_486_6 = 0
			local var_486_7 = 0.3

			if var_486_6 < arg_483_1.time_ and arg_483_1.time_ <= var_486_6 + arg_486_0 then
				local var_486_8 = "play"
				local var_486_9 = "music"

				arg_483_1:AudioAction(var_486_8, var_486_9, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_486_10 = 0
			local var_486_11 = 0.6

			if var_486_10 < arg_483_1.time_ and arg_483_1.time_ <= var_486_10 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_12 = arg_483_1:FormatText(StoryNameCfg[7].name)

				arg_483_1.leftNameTxt_.text = var_486_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_13 = arg_483_1:GetWordFromCfg(1101106117)
				local var_486_14 = arg_483_1:FormatText(var_486_13.content)

				arg_483_1.text_.text = var_486_14

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_15 = 24
				local var_486_16 = utf8.len(var_486_14)
				local var_486_17 = var_486_15 <= 0 and var_486_11 or var_486_11 * (var_486_16 / var_486_15)

				if var_486_17 > 0 and var_486_11 < var_486_17 then
					arg_483_1.talkMaxDuration = var_486_17

					if var_486_17 + var_486_10 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_17 + var_486_10
					end
				end

				arg_483_1.text_.text = var_486_14
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_18 = math.max(var_486_11, arg_483_1.talkMaxDuration)

			if var_486_10 <= arg_483_1.time_ and arg_483_1.time_ < var_486_10 + var_486_18 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_10) / var_486_18

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_10 + var_486_18 and arg_483_1.time_ < var_486_10 + var_486_18 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106118 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 1101106118
		arg_487_1.duration_ = 10.966

		local var_487_0 = {
			zh = 8.5,
			ja = 10.966
		}
		local var_487_1 = manager.audio:GetLocalizationFlag()

		if var_487_0[var_487_1] ~= nil then
			arg_487_1.duration_ = var_487_0[var_487_1]
		end

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play1101106119(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 2

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				local var_490_1 = manager.ui.mainCamera.transform.localPosition
				local var_490_2 = Vector3.New(0, 0, 10) + Vector3.New(var_490_1.x, var_490_1.y, 0)
				local var_490_3 = arg_487_1.bgs_.ST14

				var_490_3.transform.localPosition = var_490_2
				var_490_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_490_4 = var_490_3:GetComponent("SpriteRenderer")

				if var_490_4 and var_490_4.sprite then
					local var_490_5 = (var_490_3.transform.localPosition - var_490_1).z
					local var_490_6 = manager.ui.mainCameraCom_
					local var_490_7 = 2 * var_490_5 * Mathf.Tan(var_490_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_490_8 = var_490_7 * var_490_6.aspect
					local var_490_9 = var_490_4.sprite.bounds.size.x
					local var_490_10 = var_490_4.sprite.bounds.size.y
					local var_490_11 = var_490_8 / var_490_9
					local var_490_12 = var_490_7 / var_490_10
					local var_490_13 = var_490_12 < var_490_11 and var_490_11 or var_490_12

					var_490_3.transform.localScale = Vector3.New(var_490_13, var_490_13, 0)
				end

				for iter_490_0, iter_490_1 in pairs(arg_487_1.bgs_) do
					if iter_490_0 ~= "ST14" then
						iter_490_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_490_14 = 0

			if var_490_14 < arg_487_1.time_ and arg_487_1.time_ <= var_490_14 + arg_490_0 then
				arg_487_1.mask_.enabled = true
				arg_487_1.mask_.raycastTarget = true

				arg_487_1:SetGaussion(false)
			end

			local var_490_15 = 2

			if var_490_14 <= arg_487_1.time_ and arg_487_1.time_ < var_490_14 + var_490_15 then
				local var_490_16 = (arg_487_1.time_ - var_490_14) / var_490_15
				local var_490_17 = Color.New(0, 0, 0)

				var_490_17.a = Mathf.Lerp(0, 1, var_490_16)
				arg_487_1.mask_.color = var_490_17
			end

			if arg_487_1.time_ >= var_490_14 + var_490_15 and arg_487_1.time_ < var_490_14 + var_490_15 + arg_490_0 then
				local var_490_18 = Color.New(0, 0, 0)

				var_490_18.a = 1
				arg_487_1.mask_.color = var_490_18
			end

			local var_490_19 = 2

			if var_490_19 < arg_487_1.time_ and arg_487_1.time_ <= var_490_19 + arg_490_0 then
				arg_487_1.mask_.enabled = true
				arg_487_1.mask_.raycastTarget = true

				arg_487_1:SetGaussion(false)
			end

			local var_490_20 = 2

			if var_490_19 <= arg_487_1.time_ and arg_487_1.time_ < var_490_19 + var_490_20 then
				local var_490_21 = (arg_487_1.time_ - var_490_19) / var_490_20
				local var_490_22 = Color.New(0, 0, 0)

				var_490_22.a = Mathf.Lerp(1, 0, var_490_21)
				arg_487_1.mask_.color = var_490_22
			end

			if arg_487_1.time_ >= var_490_19 + var_490_20 and arg_487_1.time_ < var_490_19 + var_490_20 + arg_490_0 then
				local var_490_23 = Color.New(0, 0, 0)
				local var_490_24 = 0

				arg_487_1.mask_.enabled = false
				var_490_23.a = var_490_24
				arg_487_1.mask_.color = var_490_23
			end

			local var_490_25 = arg_487_1.actors_["1011ui_story"].transform
			local var_490_26 = 2

			if var_490_26 < arg_487_1.time_ and arg_487_1.time_ <= var_490_26 + arg_490_0 then
				arg_487_1.var_.moveOldPos1011ui_story = var_490_25.localPosition
			end

			local var_490_27 = 0.001

			if var_490_26 <= arg_487_1.time_ and arg_487_1.time_ < var_490_26 + var_490_27 then
				local var_490_28 = (arg_487_1.time_ - var_490_26) / var_490_27
				local var_490_29 = Vector3.New(0, 100, 0)

				var_490_25.localPosition = Vector3.Lerp(arg_487_1.var_.moveOldPos1011ui_story, var_490_29, var_490_28)

				local var_490_30 = manager.ui.mainCamera.transform.position - var_490_25.position

				var_490_25.forward = Vector3.New(var_490_30.x, var_490_30.y, var_490_30.z)

				local var_490_31 = var_490_25.localEulerAngles

				var_490_31.z = 0
				var_490_31.x = 0
				var_490_25.localEulerAngles = var_490_31
			end

			if arg_487_1.time_ >= var_490_26 + var_490_27 and arg_487_1.time_ < var_490_26 + var_490_27 + arg_490_0 then
				var_490_25.localPosition = Vector3.New(0, 100, 0)

				local var_490_32 = manager.ui.mainCamera.transform.position - var_490_25.position

				var_490_25.forward = Vector3.New(var_490_32.x, var_490_32.y, var_490_32.z)

				local var_490_33 = var_490_25.localEulerAngles

				var_490_33.z = 0
				var_490_33.x = 0
				var_490_25.localEulerAngles = var_490_33
			end

			local var_490_34 = 2

			if var_490_34 < arg_487_1.time_ and arg_487_1.time_ <= var_490_34 + arg_490_0 then
				arg_487_1.screenFilterGo_:SetActive(true)

				arg_487_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_490_35 = 0.0166666666666667

			if var_490_34 <= arg_487_1.time_ and arg_487_1.time_ < var_490_34 + var_490_35 then
				local var_490_36 = (arg_487_1.time_ - var_490_34) / var_490_35

				arg_487_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_490_36)
			end

			if arg_487_1.time_ >= var_490_34 + var_490_35 and arg_487_1.time_ < var_490_34 + var_490_35 + arg_490_0 then
				arg_487_1.screenFilterEffect_.weight = 1
			end

			local var_490_37 = arg_487_1.actors_["1011ui_story"].transform
			local var_490_38 = 4

			if var_490_38 < arg_487_1.time_ and arg_487_1.time_ <= var_490_38 + arg_490_0 then
				arg_487_1.var_.moveOldPos1011ui_story = var_490_37.localPosition
			end

			local var_490_39 = 0.001

			if var_490_38 <= arg_487_1.time_ and arg_487_1.time_ < var_490_38 + var_490_39 then
				local var_490_40 = (arg_487_1.time_ - var_490_38) / var_490_39
				local var_490_41 = Vector3.New(0, -0.71, -6)

				var_490_37.localPosition = Vector3.Lerp(arg_487_1.var_.moveOldPos1011ui_story, var_490_41, var_490_40)

				local var_490_42 = manager.ui.mainCamera.transform.position - var_490_37.position

				var_490_37.forward = Vector3.New(var_490_42.x, var_490_42.y, var_490_42.z)

				local var_490_43 = var_490_37.localEulerAngles

				var_490_43.z = 0
				var_490_43.x = 0
				var_490_37.localEulerAngles = var_490_43
			end

			if arg_487_1.time_ >= var_490_38 + var_490_39 and arg_487_1.time_ < var_490_38 + var_490_39 + arg_490_0 then
				var_490_37.localPosition = Vector3.New(0, -0.71, -6)

				local var_490_44 = manager.ui.mainCamera.transform.position - var_490_37.position

				var_490_37.forward = Vector3.New(var_490_44.x, var_490_44.y, var_490_44.z)

				local var_490_45 = var_490_37.localEulerAngles

				var_490_45.z = 0
				var_490_45.x = 0
				var_490_37.localEulerAngles = var_490_45
			end

			local var_490_46 = 4

			if var_490_46 < arg_487_1.time_ and arg_487_1.time_ <= var_490_46 + arg_490_0 then
				arg_487_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action484")
			end

			local var_490_47 = 4

			if var_490_47 < arg_487_1.time_ and arg_487_1.time_ <= var_490_47 + arg_490_0 then
				arg_487_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_490_48 = arg_487_1.actors_["1011ui_story"]
			local var_490_49 = 4

			if var_490_49 < arg_487_1.time_ and arg_487_1.time_ <= var_490_49 + arg_490_0 and arg_487_1.var_.characterEffect1011ui_story == nil then
				arg_487_1.var_.characterEffect1011ui_story = var_490_48:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_50 = 0.2

			if var_490_49 <= arg_487_1.time_ and arg_487_1.time_ < var_490_49 + var_490_50 then
				local var_490_51 = (arg_487_1.time_ - var_490_49) / var_490_50

				if arg_487_1.var_.characterEffect1011ui_story then
					arg_487_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_487_1.time_ >= var_490_49 + var_490_50 and arg_487_1.time_ < var_490_49 + var_490_50 + arg_490_0 and arg_487_1.var_.characterEffect1011ui_story then
				arg_487_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			if arg_487_1.frameCnt_ <= 1 then
				arg_487_1.dialog_:SetActive(false)
			end

			local var_490_52 = 4
			local var_490_53 = 0.275

			if var_490_52 < arg_487_1.time_ and arg_487_1.time_ <= var_490_52 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0

				arg_487_1.dialog_:SetActive(true)

				local var_490_54 = LeanTween.value(arg_487_1.dialog_, 0, 1, 0.3)

				var_490_54:setOnUpdate(LuaHelper.FloatAction(function(arg_491_0)
					arg_487_1.dialogCg_.alpha = arg_491_0
				end))
				var_490_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_487_1.dialog_)
					var_490_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_487_1.duration_ = arg_487_1.duration_ + 0.3

				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_55 = arg_487_1:FormatText(StoryNameCfg[37].name)

				arg_487_1.leftNameTxt_.text = var_490_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_56 = arg_487_1:GetWordFromCfg(1101106118)
				local var_490_57 = arg_487_1:FormatText(var_490_56.content)

				arg_487_1.text_.text = var_490_57

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_58 = 11
				local var_490_59 = utf8.len(var_490_57)
				local var_490_60 = var_490_58 <= 0 and var_490_53 or var_490_53 * (var_490_59 / var_490_58)

				if var_490_60 > 0 and var_490_53 < var_490_60 then
					arg_487_1.talkMaxDuration = var_490_60
					var_490_52 = var_490_52 + 0.3

					if var_490_60 + var_490_52 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_60 + var_490_52
					end
				end

				arg_487_1.text_.text = var_490_57
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb") ~= 0 then
					local var_490_61 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb") / 1000

					if var_490_61 + var_490_52 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_61 + var_490_52
					end

					if var_490_56.prefab_name ~= "" and arg_487_1.actors_[var_490_56.prefab_name] ~= nil then
						local var_490_62 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_56.prefab_name].transform, "story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb")

						arg_487_1:RecordAudio("1101106118", var_490_62)
						arg_487_1:RecordAudio("1101106118", var_490_62)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106118", "story_v_side_new_1101106.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_63 = var_490_52 + 0.3
			local var_490_64 = math.max(var_490_53, arg_487_1.talkMaxDuration)

			if var_490_63 <= arg_487_1.time_ and arg_487_1.time_ < var_490_63 + var_490_64 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_63) / var_490_64

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_63 + var_490_64 and arg_487_1.time_ < var_490_63 + var_490_64 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106119 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 1101106119
		arg_493_1.duration_ = 9

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play1101106120(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = 2
			local var_496_1 = 0.3

			if var_496_0 < arg_493_1.time_ and arg_493_1.time_ <= var_496_0 + arg_496_0 then
				local var_496_2 = "play"
				local var_496_3 = "music"

				arg_493_1:AudioAction(var_496_2, var_496_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_496_4 = 2.53333333333333
			local var_496_5 = 1

			if var_496_4 < arg_493_1.time_ and arg_493_1.time_ <= var_496_4 + arg_496_0 then
				local var_496_6 = "play"
				local var_496_7 = "music"

				arg_493_1:AudioAction(var_496_6, var_496_7, "bgm_side_daily07", "bgm_side_daily07", "bgm_side_daily07.awb")
			end

			local var_496_8 = 2

			if var_496_8 < arg_493_1.time_ and arg_493_1.time_ <= var_496_8 + arg_496_0 then
				arg_493_1.screenFilterGo_:SetActive(false)
			end

			local var_496_9 = 0.0166666666666667

			if var_496_8 <= arg_493_1.time_ and arg_493_1.time_ < var_496_8 + var_496_9 then
				local var_496_10 = (arg_493_1.time_ - var_496_8) / var_496_9

				arg_493_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_496_10)
			end

			if arg_493_1.time_ >= var_496_8 + var_496_9 and arg_493_1.time_ < var_496_8 + var_496_9 + arg_496_0 then
				arg_493_1.screenFilterEffect_.weight = 0
			end

			local var_496_11 = 2

			if var_496_11 < arg_493_1.time_ and arg_493_1.time_ <= var_496_11 + arg_496_0 then
				local var_496_12 = manager.ui.mainCamera.transform.localPosition
				local var_496_13 = Vector3.New(0, 0, 10) + Vector3.New(var_496_12.x, var_496_12.y, 0)
				local var_496_14 = arg_493_1.bgs_.I06

				var_496_14.transform.localPosition = var_496_13
				var_496_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_496_15 = var_496_14:GetComponent("SpriteRenderer")

				if var_496_15 and var_496_15.sprite then
					local var_496_16 = (var_496_14.transform.localPosition - var_496_12).z
					local var_496_17 = manager.ui.mainCameraCom_
					local var_496_18 = 2 * var_496_16 * Mathf.Tan(var_496_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_496_19 = var_496_18 * var_496_17.aspect
					local var_496_20 = var_496_15.sprite.bounds.size.x
					local var_496_21 = var_496_15.sprite.bounds.size.y
					local var_496_22 = var_496_19 / var_496_20
					local var_496_23 = var_496_18 / var_496_21
					local var_496_24 = var_496_23 < var_496_22 and var_496_22 or var_496_23

					var_496_14.transform.localScale = Vector3.New(var_496_24, var_496_24, 0)
				end

				for iter_496_0, iter_496_1 in pairs(arg_493_1.bgs_) do
					if iter_496_0 ~= "I06" then
						iter_496_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_496_25 = 0

			if var_496_25 < arg_493_1.time_ and arg_493_1.time_ <= var_496_25 + arg_496_0 then
				arg_493_1.mask_.enabled = true
				arg_493_1.mask_.raycastTarget = true

				arg_493_1:SetGaussion(false)
			end

			local var_496_26 = 2

			if var_496_25 <= arg_493_1.time_ and arg_493_1.time_ < var_496_25 + var_496_26 then
				local var_496_27 = (arg_493_1.time_ - var_496_25) / var_496_26
				local var_496_28 = Color.New(0, 0, 0)

				var_496_28.a = Mathf.Lerp(0, 1, var_496_27)
				arg_493_1.mask_.color = var_496_28
			end

			if arg_493_1.time_ >= var_496_25 + var_496_26 and arg_493_1.time_ < var_496_25 + var_496_26 + arg_496_0 then
				local var_496_29 = Color.New(0, 0, 0)

				var_496_29.a = 1
				arg_493_1.mask_.color = var_496_29
			end

			local var_496_30 = 2

			if var_496_30 < arg_493_1.time_ and arg_493_1.time_ <= var_496_30 + arg_496_0 then
				arg_493_1.mask_.enabled = true
				arg_493_1.mask_.raycastTarget = true

				arg_493_1:SetGaussion(false)
			end

			local var_496_31 = 2

			if var_496_30 <= arg_493_1.time_ and arg_493_1.time_ < var_496_30 + var_496_31 then
				local var_496_32 = (arg_493_1.time_ - var_496_30) / var_496_31
				local var_496_33 = Color.New(0, 0, 0)

				var_496_33.a = Mathf.Lerp(1, 0, var_496_32)
				arg_493_1.mask_.color = var_496_33
			end

			if arg_493_1.time_ >= var_496_30 + var_496_31 and arg_493_1.time_ < var_496_30 + var_496_31 + arg_496_0 then
				local var_496_34 = Color.New(0, 0, 0)
				local var_496_35 = 0

				arg_493_1.mask_.enabled = false
				var_496_34.a = var_496_35
				arg_493_1.mask_.color = var_496_34
			end

			local var_496_36 = arg_493_1.actors_["1011ui_story"].transform
			local var_496_37 = 4

			if var_496_37 < arg_493_1.time_ and arg_493_1.time_ <= var_496_37 + arg_496_0 then
				arg_493_1.var_.moveOldPos1011ui_story = var_496_36.localPosition
			end

			local var_496_38 = 0.001

			if var_496_37 <= arg_493_1.time_ and arg_493_1.time_ < var_496_37 + var_496_38 then
				local var_496_39 = (arg_493_1.time_ - var_496_37) / var_496_38
				local var_496_40 = Vector3.New(0, -0.71, -6)

				var_496_36.localPosition = Vector3.Lerp(arg_493_1.var_.moveOldPos1011ui_story, var_496_40, var_496_39)

				local var_496_41 = manager.ui.mainCamera.transform.position - var_496_36.position

				var_496_36.forward = Vector3.New(var_496_41.x, var_496_41.y, var_496_41.z)

				local var_496_42 = var_496_36.localEulerAngles

				var_496_42.z = 0
				var_496_42.x = 0
				var_496_36.localEulerAngles = var_496_42
			end

			if arg_493_1.time_ >= var_496_37 + var_496_38 and arg_493_1.time_ < var_496_37 + var_496_38 + arg_496_0 then
				var_496_36.localPosition = Vector3.New(0, -0.71, -6)

				local var_496_43 = manager.ui.mainCamera.transform.position - var_496_36.position

				var_496_36.forward = Vector3.New(var_496_43.x, var_496_43.y, var_496_43.z)

				local var_496_44 = var_496_36.localEulerAngles

				var_496_44.z = 0
				var_496_44.x = 0
				var_496_36.localEulerAngles = var_496_44
			end

			local var_496_45 = arg_493_1.actors_["1011ui_story"]
			local var_496_46 = 4

			if var_496_46 < arg_493_1.time_ and arg_493_1.time_ <= var_496_46 + arg_496_0 and arg_493_1.var_.characterEffect1011ui_story == nil then
				arg_493_1.var_.characterEffect1011ui_story = var_496_45:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_47 = 0.200000002980232

			if var_496_46 <= arg_493_1.time_ and arg_493_1.time_ < var_496_46 + var_496_47 then
				local var_496_48 = (arg_493_1.time_ - var_496_46) / var_496_47

				if arg_493_1.var_.characterEffect1011ui_story then
					arg_493_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_493_1.time_ >= var_496_46 + var_496_47 and arg_493_1.time_ < var_496_46 + var_496_47 + arg_496_0 and arg_493_1.var_.characterEffect1011ui_story then
				arg_493_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_496_49 = 4

			if var_496_49 < arg_493_1.time_ and arg_493_1.time_ <= var_496_49 + arg_496_0 then
				arg_493_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_496_50 = 4

			if var_496_50 < arg_493_1.time_ and arg_493_1.time_ <= var_496_50 + arg_496_0 then
				arg_493_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_496_51 = arg_493_1.actors_["1011ui_story"].transform
			local var_496_52 = 2

			if var_496_52 < arg_493_1.time_ and arg_493_1.time_ <= var_496_52 + arg_496_0 then
				arg_493_1.var_.moveOldPos1011ui_story = var_496_51.localPosition
			end

			local var_496_53 = 0.001

			if var_496_52 <= arg_493_1.time_ and arg_493_1.time_ < var_496_52 + var_496_53 then
				local var_496_54 = (arg_493_1.time_ - var_496_52) / var_496_53
				local var_496_55 = Vector3.New(0, 100, 0)

				var_496_51.localPosition = Vector3.Lerp(arg_493_1.var_.moveOldPos1011ui_story, var_496_55, var_496_54)

				local var_496_56 = manager.ui.mainCamera.transform.position - var_496_51.position

				var_496_51.forward = Vector3.New(var_496_56.x, var_496_56.y, var_496_56.z)

				local var_496_57 = var_496_51.localEulerAngles

				var_496_57.z = 0
				var_496_57.x = 0
				var_496_51.localEulerAngles = var_496_57
			end

			if arg_493_1.time_ >= var_496_52 + var_496_53 and arg_493_1.time_ < var_496_52 + var_496_53 + arg_496_0 then
				var_496_51.localPosition = Vector3.New(0, 100, 0)

				local var_496_58 = manager.ui.mainCamera.transform.position - var_496_51.position

				var_496_51.forward = Vector3.New(var_496_58.x, var_496_58.y, var_496_58.z)

				local var_496_59 = var_496_51.localEulerAngles

				var_496_59.z = 0
				var_496_59.x = 0
				var_496_51.localEulerAngles = var_496_59
			end

			if arg_493_1.frameCnt_ <= 1 then
				arg_493_1.dialog_:SetActive(false)
			end

			local var_496_60 = 4
			local var_496_61 = 0.525

			if var_496_60 < arg_493_1.time_ and arg_493_1.time_ <= var_496_60 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0

				arg_493_1.dialog_:SetActive(true)

				local var_496_62 = LeanTween.value(arg_493_1.dialog_, 0, 1, 0.3)

				var_496_62:setOnUpdate(LuaHelper.FloatAction(function(arg_497_0)
					arg_493_1.dialogCg_.alpha = arg_497_0
				end))
				var_496_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_493_1.dialog_)
					var_496_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_493_1.duration_ = arg_493_1.duration_ + 0.3

				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_63 = arg_493_1:FormatText(StoryNameCfg[7].name)

				arg_493_1.leftNameTxt_.text = var_496_63

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_64 = arg_493_1:GetWordFromCfg(1101106119)
				local var_496_65 = arg_493_1:FormatText(var_496_64.content)

				arg_493_1.text_.text = var_496_65

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_66 = 21
				local var_496_67 = utf8.len(var_496_65)
				local var_496_68 = var_496_66 <= 0 and var_496_61 or var_496_61 * (var_496_67 / var_496_66)

				if var_496_68 > 0 and var_496_61 < var_496_68 then
					arg_493_1.talkMaxDuration = var_496_68
					var_496_60 = var_496_60 + 0.3

					if var_496_68 + var_496_60 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_68 + var_496_60
					end
				end

				arg_493_1.text_.text = var_496_65
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)
				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_69 = var_496_60 + 0.3
			local var_496_70 = math.max(var_496_61, arg_493_1.talkMaxDuration)

			if var_496_69 <= arg_493_1.time_ and arg_493_1.time_ < var_496_69 + var_496_70 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_69) / var_496_70

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_69 + var_496_70 and arg_493_1.time_ < var_496_69 + var_496_70 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106120 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 1101106120
		arg_499_1.duration_ = 3.833

		local var_499_0 = {
			zh = 3.833,
			ja = 3.3
		}
		local var_499_1 = manager.audio:GetLocalizationFlag()

		if var_499_0[var_499_1] ~= nil then
			arg_499_1.duration_ = var_499_0[var_499_1]
		end

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play1101106121(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1011ui_story"].transform
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 then
				arg_499_1.var_.moveOldPos1011ui_story = var_502_0.localPosition
			end

			local var_502_2 = 0.001

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2
				local var_502_4 = Vector3.New(0, -0.71, -6)

				var_502_0.localPosition = Vector3.Lerp(arg_499_1.var_.moveOldPos1011ui_story, var_502_4, var_502_3)

				local var_502_5 = manager.ui.mainCamera.transform.position - var_502_0.position

				var_502_0.forward = Vector3.New(var_502_5.x, var_502_5.y, var_502_5.z)

				local var_502_6 = var_502_0.localEulerAngles

				var_502_6.z = 0
				var_502_6.x = 0
				var_502_0.localEulerAngles = var_502_6
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 then
				var_502_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_502_7 = manager.ui.mainCamera.transform.position - var_502_0.position

				var_502_0.forward = Vector3.New(var_502_7.x, var_502_7.y, var_502_7.z)

				local var_502_8 = var_502_0.localEulerAngles

				var_502_8.z = 0
				var_502_8.x = 0
				var_502_0.localEulerAngles = var_502_8
			end

			local var_502_9 = arg_499_1.actors_["1011ui_story"]
			local var_502_10 = 0

			if var_502_10 < arg_499_1.time_ and arg_499_1.time_ <= var_502_10 + arg_502_0 and arg_499_1.var_.characterEffect1011ui_story == nil then
				arg_499_1.var_.characterEffect1011ui_story = var_502_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_11 = 0.200000002980232

			if var_502_10 <= arg_499_1.time_ and arg_499_1.time_ < var_502_10 + var_502_11 then
				local var_502_12 = (arg_499_1.time_ - var_502_10) / var_502_11

				if arg_499_1.var_.characterEffect1011ui_story then
					arg_499_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_499_1.time_ >= var_502_10 + var_502_11 and arg_499_1.time_ < var_502_10 + var_502_11 + arg_502_0 and arg_499_1.var_.characterEffect1011ui_story then
				arg_499_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_502_13 = 0

			if var_502_13 < arg_499_1.time_ and arg_499_1.time_ <= var_502_13 + arg_502_0 then
				arg_499_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_502_14 = 0

			if var_502_14 < arg_499_1.time_ and arg_499_1.time_ <= var_502_14 + arg_502_0 then
				arg_499_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_502_15 = 0
			local var_502_16 = 0.2

			if var_502_15 < arg_499_1.time_ and arg_499_1.time_ <= var_502_15 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_17 = arg_499_1:FormatText(StoryNameCfg[37].name)

				arg_499_1.leftNameTxt_.text = var_502_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_18 = arg_499_1:GetWordFromCfg(1101106120)
				local var_502_19 = arg_499_1:FormatText(var_502_18.content)

				arg_499_1.text_.text = var_502_19

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_20 = 8
				local var_502_21 = utf8.len(var_502_19)
				local var_502_22 = var_502_20 <= 0 and var_502_16 or var_502_16 * (var_502_21 / var_502_20)

				if var_502_22 > 0 and var_502_16 < var_502_22 then
					arg_499_1.talkMaxDuration = var_502_22

					if var_502_22 + var_502_15 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_22 + var_502_15
					end
				end

				arg_499_1.text_.text = var_502_19
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb") ~= 0 then
					local var_502_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb") / 1000

					if var_502_23 + var_502_15 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_23 + var_502_15
					end

					if var_502_18.prefab_name ~= "" and arg_499_1.actors_[var_502_18.prefab_name] ~= nil then
						local var_502_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_18.prefab_name].transform, "story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb")

						arg_499_1:RecordAudio("1101106120", var_502_24)
						arg_499_1:RecordAudio("1101106120", var_502_24)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106120", "story_v_side_new_1101106.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_25 = math.max(var_502_16, arg_499_1.talkMaxDuration)

			if var_502_15 <= arg_499_1.time_ and arg_499_1.time_ < var_502_15 + var_502_25 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_15) / var_502_25

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_15 + var_502_25 and arg_499_1.time_ < var_502_15 + var_502_25 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106121 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 1101106121
		arg_503_1.duration_ = 3.7

		local var_503_0 = {
			zh = 3.7,
			ja = 2.3
		}
		local var_503_1 = manager.audio:GetLocalizationFlag()

		if var_503_0[var_503_1] ~= nil then
			arg_503_1.duration_ = var_503_0[var_503_1]
		end

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play1101106122(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["1011ui_story"].transform
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 then
				arg_503_1.var_.moveOldPos1011ui_story = var_506_0.localPosition
			end

			local var_506_2 = 0.001

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2
				local var_506_4 = Vector3.New(0, -0.71, -6)

				var_506_0.localPosition = Vector3.Lerp(arg_503_1.var_.moveOldPos1011ui_story, var_506_4, var_506_3)

				local var_506_5 = manager.ui.mainCamera.transform.position - var_506_0.position

				var_506_0.forward = Vector3.New(var_506_5.x, var_506_5.y, var_506_5.z)

				local var_506_6 = var_506_0.localEulerAngles

				var_506_6.z = 0
				var_506_6.x = 0
				var_506_0.localEulerAngles = var_506_6
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 then
				var_506_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_506_7 = manager.ui.mainCamera.transform.position - var_506_0.position

				var_506_0.forward = Vector3.New(var_506_7.x, var_506_7.y, var_506_7.z)

				local var_506_8 = var_506_0.localEulerAngles

				var_506_8.z = 0
				var_506_8.x = 0
				var_506_0.localEulerAngles = var_506_8
			end

			local var_506_9 = arg_503_1.actors_["1011ui_story"]
			local var_506_10 = 0

			if var_506_10 < arg_503_1.time_ and arg_503_1.time_ <= var_506_10 + arg_506_0 and arg_503_1.var_.characterEffect1011ui_story == nil then
				arg_503_1.var_.characterEffect1011ui_story = var_506_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_11 = 0.200000002980232

			if var_506_10 <= arg_503_1.time_ and arg_503_1.time_ < var_506_10 + var_506_11 then
				local var_506_12 = (arg_503_1.time_ - var_506_10) / var_506_11

				if arg_503_1.var_.characterEffect1011ui_story then
					arg_503_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_503_1.time_ >= var_506_10 + var_506_11 and arg_503_1.time_ < var_506_10 + var_506_11 + arg_506_0 and arg_503_1.var_.characterEffect1011ui_story then
				arg_503_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_506_13 = 0

			if var_506_13 < arg_503_1.time_ and arg_503_1.time_ <= var_506_13 + arg_506_0 then
				arg_503_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action435")
			end

			local var_506_14 = 0

			if var_506_14 < arg_503_1.time_ and arg_503_1.time_ <= var_506_14 + arg_506_0 then
				arg_503_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_506_15 = 0
			local var_506_16 = 0.225

			if var_506_15 < arg_503_1.time_ and arg_503_1.time_ <= var_506_15 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_17 = arg_503_1:FormatText(StoryNameCfg[37].name)

				arg_503_1.leftNameTxt_.text = var_506_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_18 = arg_503_1:GetWordFromCfg(1101106121)
				local var_506_19 = arg_503_1:FormatText(var_506_18.content)

				arg_503_1.text_.text = var_506_19

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_20 = 9
				local var_506_21 = utf8.len(var_506_19)
				local var_506_22 = var_506_20 <= 0 and var_506_16 or var_506_16 * (var_506_21 / var_506_20)

				if var_506_22 > 0 and var_506_16 < var_506_22 then
					arg_503_1.talkMaxDuration = var_506_22

					if var_506_22 + var_506_15 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_22 + var_506_15
					end
				end

				arg_503_1.text_.text = var_506_19
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb") ~= 0 then
					local var_506_23 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb") / 1000

					if var_506_23 + var_506_15 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_23 + var_506_15
					end

					if var_506_18.prefab_name ~= "" and arg_503_1.actors_[var_506_18.prefab_name] ~= nil then
						local var_506_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_18.prefab_name].transform, "story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb")

						arg_503_1:RecordAudio("1101106121", var_506_24)
						arg_503_1:RecordAudio("1101106121", var_506_24)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106121", "story_v_side_new_1101106.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_25 = math.max(var_506_16, arg_503_1.talkMaxDuration)

			if var_506_15 <= arg_503_1.time_ and arg_503_1.time_ < var_506_15 + var_506_25 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_15) / var_506_25

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_15 + var_506_25 and arg_503_1.time_ < var_506_15 + var_506_25 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106122 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 1101106122
		arg_507_1.duration_ = 5

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play1101106123(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1011ui_story"]
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 and arg_507_1.var_.characterEffect1011ui_story == nil then
				arg_507_1.var_.characterEffect1011ui_story = var_510_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_2 = 0.200000002980232

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2

				if arg_507_1.var_.characterEffect1011ui_story then
					local var_510_4 = Mathf.Lerp(0, 0.5, var_510_3)

					arg_507_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_507_1.var_.characterEffect1011ui_story.fillRatio = var_510_4
				end
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 and arg_507_1.var_.characterEffect1011ui_story then
				local var_510_5 = 0.5

				arg_507_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_507_1.var_.characterEffect1011ui_story.fillRatio = var_510_5
			end

			local var_510_6 = 0
			local var_510_7 = 0.45

			if var_510_6 < arg_507_1.time_ and arg_507_1.time_ <= var_510_6 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_8 = arg_507_1:FormatText(StoryNameCfg[7].name)

				arg_507_1.leftNameTxt_.text = var_510_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_9 = arg_507_1:GetWordFromCfg(1101106122)
				local var_510_10 = arg_507_1:FormatText(var_510_9.content)

				arg_507_1.text_.text = var_510_10

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_11 = 18
				local var_510_12 = utf8.len(var_510_10)
				local var_510_13 = var_510_11 <= 0 and var_510_7 or var_510_7 * (var_510_12 / var_510_11)

				if var_510_13 > 0 and var_510_7 < var_510_13 then
					arg_507_1.talkMaxDuration = var_510_13

					if var_510_13 + var_510_6 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_13 + var_510_6
					end
				end

				arg_507_1.text_.text = var_510_10
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)
				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_14 = math.max(var_510_7, arg_507_1.talkMaxDuration)

			if var_510_6 <= arg_507_1.time_ and arg_507_1.time_ < var_510_6 + var_510_14 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_6) / var_510_14

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_6 + var_510_14 and arg_507_1.time_ < var_510_6 + var_510_14 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106123 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 1101106123
		arg_511_1.duration_ = 6.133

		local var_511_0 = {
			zh = 6.133,
			ja = 5.1
		}
		local var_511_1 = manager.audio:GetLocalizationFlag()

		if var_511_0[var_511_1] ~= nil then
			arg_511_1.duration_ = var_511_0[var_511_1]
		end

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play1101106124(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1011ui_story"].transform
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				arg_511_1.var_.moveOldPos1011ui_story = var_514_0.localPosition
			end

			local var_514_2 = 0.001

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_2 then
				local var_514_3 = (arg_511_1.time_ - var_514_1) / var_514_2
				local var_514_4 = Vector3.New(0, -0.71, -6)

				var_514_0.localPosition = Vector3.Lerp(arg_511_1.var_.moveOldPos1011ui_story, var_514_4, var_514_3)

				local var_514_5 = manager.ui.mainCamera.transform.position - var_514_0.position

				var_514_0.forward = Vector3.New(var_514_5.x, var_514_5.y, var_514_5.z)

				local var_514_6 = var_514_0.localEulerAngles

				var_514_6.z = 0
				var_514_6.x = 0
				var_514_0.localEulerAngles = var_514_6
			end

			if arg_511_1.time_ >= var_514_1 + var_514_2 and arg_511_1.time_ < var_514_1 + var_514_2 + arg_514_0 then
				var_514_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_514_7 = manager.ui.mainCamera.transform.position - var_514_0.position

				var_514_0.forward = Vector3.New(var_514_7.x, var_514_7.y, var_514_7.z)

				local var_514_8 = var_514_0.localEulerAngles

				var_514_8.z = 0
				var_514_8.x = 0
				var_514_0.localEulerAngles = var_514_8
			end

			local var_514_9 = arg_511_1.actors_["1011ui_story"]
			local var_514_10 = 0

			if var_514_10 < arg_511_1.time_ and arg_511_1.time_ <= var_514_10 + arg_514_0 and arg_511_1.var_.characterEffect1011ui_story == nil then
				arg_511_1.var_.characterEffect1011ui_story = var_514_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_514_11 = 0.200000002980232

			if var_514_10 <= arg_511_1.time_ and arg_511_1.time_ < var_514_10 + var_514_11 then
				local var_514_12 = (arg_511_1.time_ - var_514_10) / var_514_11

				if arg_511_1.var_.characterEffect1011ui_story then
					arg_511_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_511_1.time_ >= var_514_10 + var_514_11 and arg_511_1.time_ < var_514_10 + var_514_11 + arg_514_0 and arg_511_1.var_.characterEffect1011ui_story then
				arg_511_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_514_13 = 0

			if var_514_13 < arg_511_1.time_ and arg_511_1.time_ <= var_514_13 + arg_514_0 then
				arg_511_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_514_14 = 0
			local var_514_15 = 0.425

			if var_514_14 < arg_511_1.time_ and arg_511_1.time_ <= var_514_14 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_16 = arg_511_1:FormatText(StoryNameCfg[37].name)

				arg_511_1.leftNameTxt_.text = var_514_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_17 = arg_511_1:GetWordFromCfg(1101106123)
				local var_514_18 = arg_511_1:FormatText(var_514_17.content)

				arg_511_1.text_.text = var_514_18

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_19 = 17
				local var_514_20 = utf8.len(var_514_18)
				local var_514_21 = var_514_19 <= 0 and var_514_15 or var_514_15 * (var_514_20 / var_514_19)

				if var_514_21 > 0 and var_514_15 < var_514_21 then
					arg_511_1.talkMaxDuration = var_514_21

					if var_514_21 + var_514_14 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_21 + var_514_14
					end
				end

				arg_511_1.text_.text = var_514_18
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb") ~= 0 then
					local var_514_22 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb") / 1000

					if var_514_22 + var_514_14 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_22 + var_514_14
					end

					if var_514_17.prefab_name ~= "" and arg_511_1.actors_[var_514_17.prefab_name] ~= nil then
						local var_514_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_17.prefab_name].transform, "story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb")

						arg_511_1:RecordAudio("1101106123", var_514_23)
						arg_511_1:RecordAudio("1101106123", var_514_23)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106123", "story_v_side_new_1101106.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_24 = math.max(var_514_15, arg_511_1.talkMaxDuration)

			if var_514_14 <= arg_511_1.time_ and arg_511_1.time_ < var_514_14 + var_514_24 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_14) / var_514_24

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_14 + var_514_24 and arg_511_1.time_ < var_514_14 + var_514_24 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106124 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 1101106124
		arg_515_1.duration_ = 5

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play1101106125(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["1011ui_story"].transform
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 then
				arg_515_1.var_.moveOldPos1011ui_story = var_518_0.localPosition
			end

			local var_518_2 = 0.001

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2
				local var_518_4 = Vector3.New(0, -0.71, -6)

				var_518_0.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos1011ui_story, var_518_4, var_518_3)

				local var_518_5 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_5.x, var_518_5.y, var_518_5.z)

				local var_518_6 = var_518_0.localEulerAngles

				var_518_6.z = 0
				var_518_6.x = 0
				var_518_0.localEulerAngles = var_518_6
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 then
				var_518_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_518_7 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_7.x, var_518_7.y, var_518_7.z)

				local var_518_8 = var_518_0.localEulerAngles

				var_518_8.z = 0
				var_518_8.x = 0
				var_518_0.localEulerAngles = var_518_8
			end

			local var_518_9 = arg_515_1.actors_["1011ui_story"]
			local var_518_10 = 0

			if var_518_10 < arg_515_1.time_ and arg_515_1.time_ <= var_518_10 + arg_518_0 and arg_515_1.var_.characterEffect1011ui_story == nil then
				arg_515_1.var_.characterEffect1011ui_story = var_518_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_11 = 0.2

			if var_518_10 <= arg_515_1.time_ and arg_515_1.time_ < var_518_10 + var_518_11 then
				local var_518_12 = (arg_515_1.time_ - var_518_10) / var_518_11

				if arg_515_1.var_.characterEffect1011ui_story then
					local var_518_13 = Mathf.Lerp(0, 0.5, var_518_12)

					arg_515_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_515_1.var_.characterEffect1011ui_story.fillRatio = var_518_13
				end
			end

			if arg_515_1.time_ >= var_518_10 + var_518_11 and arg_515_1.time_ < var_518_10 + var_518_11 + arg_518_0 and arg_515_1.var_.characterEffect1011ui_story then
				local var_518_14 = 0.5

				arg_515_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_515_1.var_.characterEffect1011ui_story.fillRatio = var_518_14
			end

			local var_518_15 = 0
			local var_518_16 = 0.775

			if var_518_15 < arg_515_1.time_ and arg_515_1.time_ <= var_518_15 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0

				arg_515_1.dialog_:SetActive(true)

				local var_518_17 = LeanTween.value(arg_515_1.dialog_, 0, 1, 0.3)

				var_518_17:setOnUpdate(LuaHelper.FloatAction(function(arg_519_0)
					arg_515_1.dialogCg_.alpha = arg_519_0
				end))
				var_518_17:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_515_1.dialog_)
					var_518_17:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_515_1.duration_ = arg_515_1.duration_ + 0.3

				SetActive(arg_515_1.leftNameGo_, false)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_18 = arg_515_1:GetWordFromCfg(1101106124)
				local var_518_19 = arg_515_1:FormatText(var_518_18.content)

				arg_515_1.text_.text = var_518_19

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_20 = 31
				local var_518_21 = utf8.len(var_518_19)
				local var_518_22 = var_518_20 <= 0 and var_518_16 or var_518_16 * (var_518_21 / var_518_20)

				if var_518_22 > 0 and var_518_16 < var_518_22 then
					arg_515_1.talkMaxDuration = var_518_22
					var_518_15 = var_518_15 + 0.3

					if var_518_22 + var_518_15 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_22 + var_518_15
					end
				end

				arg_515_1.text_.text = var_518_19
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)
				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_23 = var_518_15 + 0.3
			local var_518_24 = math.max(var_518_16, arg_515_1.talkMaxDuration)

			if var_518_23 <= arg_515_1.time_ and arg_515_1.time_ < var_518_23 + var_518_24 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_23) / var_518_24

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_23 + var_518_24 and arg_515_1.time_ < var_518_23 + var_518_24 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106125 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 1101106125
		arg_521_1.duration_ = 5

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play1101106126(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = 0
			local var_524_1 = 0.125

			if var_524_0 < arg_521_1.time_ and arg_521_1.time_ <= var_524_0 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, false)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_2 = arg_521_1:GetWordFromCfg(1101106125)
				local var_524_3 = arg_521_1:FormatText(var_524_2.content)

				arg_521_1.text_.text = var_524_3

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_4 = 5
				local var_524_5 = utf8.len(var_524_3)
				local var_524_6 = var_524_4 <= 0 and var_524_1 or var_524_1 * (var_524_5 / var_524_4)

				if var_524_6 > 0 and var_524_1 < var_524_6 then
					arg_521_1.talkMaxDuration = var_524_6

					if var_524_6 + var_524_0 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_6 + var_524_0
					end
				end

				arg_521_1.text_.text = var_524_3
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)
				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_7 = math.max(var_524_1, arg_521_1.talkMaxDuration)

			if var_524_0 <= arg_521_1.time_ and arg_521_1.time_ < var_524_0 + var_524_7 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_0) / var_524_7

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_0 + var_524_7 and arg_521_1.time_ < var_524_0 + var_524_7 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106126 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 1101106126
		arg_525_1.duration_ = 5

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play1101106127(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = 0
			local var_528_1 = 0.325

			if var_528_0 < arg_525_1.time_ and arg_525_1.time_ <= var_528_0 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, false)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_2 = arg_525_1:GetWordFromCfg(1101106126)
				local var_528_3 = arg_525_1:FormatText(var_528_2.content)

				arg_525_1.text_.text = var_528_3

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_4 = 13
				local var_528_5 = utf8.len(var_528_3)
				local var_528_6 = var_528_4 <= 0 and var_528_1 or var_528_1 * (var_528_5 / var_528_4)

				if var_528_6 > 0 and var_528_1 < var_528_6 then
					arg_525_1.talkMaxDuration = var_528_6

					if var_528_6 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_6 + var_528_0
					end
				end

				arg_525_1.text_.text = var_528_3
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)
				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_7 = math.max(var_528_1, arg_525_1.talkMaxDuration)

			if var_528_0 <= arg_525_1.time_ and arg_525_1.time_ < var_528_0 + var_528_7 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_0) / var_528_7

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_0 + var_528_7 and arg_525_1.time_ < var_528_0 + var_528_7 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106127 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 1101106127
		arg_529_1.duration_ = 5

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play1101106128(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = arg_529_1.actors_["1011ui_story"].transform
			local var_532_1 = 0

			if var_532_1 < arg_529_1.time_ and arg_529_1.time_ <= var_532_1 + arg_532_0 then
				arg_529_1.var_.moveOldPos1011ui_story = var_532_0.localPosition
			end

			local var_532_2 = 0.001

			if var_532_1 <= arg_529_1.time_ and arg_529_1.time_ < var_532_1 + var_532_2 then
				local var_532_3 = (arg_529_1.time_ - var_532_1) / var_532_2
				local var_532_4 = Vector3.New(0, -0.71, -6)

				var_532_0.localPosition = Vector3.Lerp(arg_529_1.var_.moveOldPos1011ui_story, var_532_4, var_532_3)

				local var_532_5 = manager.ui.mainCamera.transform.position - var_532_0.position

				var_532_0.forward = Vector3.New(var_532_5.x, var_532_5.y, var_532_5.z)

				local var_532_6 = var_532_0.localEulerAngles

				var_532_6.z = 0
				var_532_6.x = 0
				var_532_0.localEulerAngles = var_532_6
			end

			if arg_529_1.time_ >= var_532_1 + var_532_2 and arg_529_1.time_ < var_532_1 + var_532_2 + arg_532_0 then
				var_532_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_532_7 = manager.ui.mainCamera.transform.position - var_532_0.position

				var_532_0.forward = Vector3.New(var_532_7.x, var_532_7.y, var_532_7.z)

				local var_532_8 = var_532_0.localEulerAngles

				var_532_8.z = 0
				var_532_8.x = 0
				var_532_0.localEulerAngles = var_532_8
			end

			local var_532_9 = arg_529_1.actors_["1011ui_story"]
			local var_532_10 = 0

			if var_532_10 < arg_529_1.time_ and arg_529_1.time_ <= var_532_10 + arg_532_0 and arg_529_1.var_.characterEffect1011ui_story == nil then
				arg_529_1.var_.characterEffect1011ui_story = var_532_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_532_11 = 0.200000002980232

			if var_532_10 <= arg_529_1.time_ and arg_529_1.time_ < var_532_10 + var_532_11 then
				local var_532_12 = (arg_529_1.time_ - var_532_10) / var_532_11

				if arg_529_1.var_.characterEffect1011ui_story then
					arg_529_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_529_1.time_ >= var_532_10 + var_532_11 and arg_529_1.time_ < var_532_10 + var_532_11 + arg_532_0 and arg_529_1.var_.characterEffect1011ui_story then
				arg_529_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_532_13 = 0

			if var_532_13 < arg_529_1.time_ and arg_529_1.time_ <= var_532_13 + arg_532_0 then
				arg_529_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_2")
			end

			local var_532_14 = 0

			if var_532_14 < arg_529_1.time_ and arg_529_1.time_ <= var_532_14 + arg_532_0 then
				arg_529_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_532_15 = 0
			local var_532_16 = 1.075

			if var_532_15 < arg_529_1.time_ and arg_529_1.time_ <= var_532_15 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, false)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_17 = arg_529_1:GetWordFromCfg(1101106127)
				local var_532_18 = arg_529_1:FormatText(var_532_17.content)

				arg_529_1.text_.text = var_532_18

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_19 = 43
				local var_532_20 = utf8.len(var_532_18)
				local var_532_21 = var_532_19 <= 0 and var_532_16 or var_532_16 * (var_532_20 / var_532_19)

				if var_532_21 > 0 and var_532_16 < var_532_21 then
					arg_529_1.talkMaxDuration = var_532_21

					if var_532_21 + var_532_15 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_21 + var_532_15
					end
				end

				arg_529_1.text_.text = var_532_18
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_22 = math.max(var_532_16, arg_529_1.talkMaxDuration)

			if var_532_15 <= arg_529_1.time_ and arg_529_1.time_ < var_532_15 + var_532_22 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_15) / var_532_22

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_15 + var_532_22 and arg_529_1.time_ < var_532_15 + var_532_22 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106128 = function(arg_533_0, arg_533_1)
		arg_533_1.time_ = 0
		arg_533_1.frameCnt_ = 0
		arg_533_1.state_ = "playing"
		arg_533_1.curTalkId_ = 1101106128
		arg_533_1.duration_ = 5

		SetActive(arg_533_1.tipsGo_, false)

		function arg_533_1.onSingleLineFinish_()
			arg_533_1.onSingleLineUpdate_ = nil
			arg_533_1.onSingleLineFinish_ = nil
			arg_533_1.state_ = "waiting"
		end

		function arg_533_1.playNext_(arg_535_0)
			if arg_535_0 == 1 then
				arg_533_0:Play1101106129(arg_533_1)
			end
		end

		function arg_533_1.onSingleLineUpdate_(arg_536_0)
			local var_536_0 = 0
			local var_536_1 = 0.925

			if var_536_0 < arg_533_1.time_ and arg_533_1.time_ <= var_536_0 + arg_536_0 then
				arg_533_1.talkMaxDuration = 0
				arg_533_1.dialogCg_.alpha = 1

				arg_533_1.dialog_:SetActive(true)
				SetActive(arg_533_1.leftNameGo_, true)

				local var_536_2 = arg_533_1:FormatText(StoryNameCfg[7].name)

				arg_533_1.leftNameTxt_.text = var_536_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_533_1.leftNameTxt_.transform)

				arg_533_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_533_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_533_1:RecordName(arg_533_1.leftNameTxt_.text)
				SetActive(arg_533_1.iconTrs_.gameObject, false)
				arg_533_1.callingController_:SetSelectedState("normal")

				local var_536_3 = arg_533_1:GetWordFromCfg(1101106128)
				local var_536_4 = arg_533_1:FormatText(var_536_3.content)

				arg_533_1.text_.text = var_536_4

				LuaForUtil.ClearLinePrefixSymbol(arg_533_1.text_)

				local var_536_5 = 42
				local var_536_6 = utf8.len(var_536_4)
				local var_536_7 = var_536_5 <= 0 and var_536_1 or var_536_1 * (var_536_6 / var_536_5)

				if var_536_7 > 0 and var_536_1 < var_536_7 then
					arg_533_1.talkMaxDuration = var_536_7

					if var_536_7 + var_536_0 > arg_533_1.duration_ then
						arg_533_1.duration_ = var_536_7 + var_536_0
					end
				end

				arg_533_1.text_.text = var_536_4
				arg_533_1.typewritter.percent = 0

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(false)
				arg_533_1:RecordContent(arg_533_1.text_.text)
			end

			local var_536_8 = math.max(var_536_1, arg_533_1.talkMaxDuration)

			if var_536_0 <= arg_533_1.time_ and arg_533_1.time_ < var_536_0 + var_536_8 then
				arg_533_1.typewritter.percent = (arg_533_1.time_ - var_536_0) / var_536_8

				arg_533_1.typewritter:SetDirty()
			end

			if arg_533_1.time_ >= var_536_0 + var_536_8 and arg_533_1.time_ < var_536_0 + var_536_8 + arg_536_0 then
				arg_533_1.typewritter.percent = 1

				arg_533_1.typewritter:SetDirty()
				arg_533_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106129 = function(arg_537_0, arg_537_1)
		arg_537_1.time_ = 0
		arg_537_1.frameCnt_ = 0
		arg_537_1.state_ = "playing"
		arg_537_1.curTalkId_ = 1101106129
		arg_537_1.duration_ = 1.999999999999

		SetActive(arg_537_1.tipsGo_, false)

		function arg_537_1.onSingleLineFinish_()
			arg_537_1.onSingleLineUpdate_ = nil
			arg_537_1.onSingleLineFinish_ = nil
			arg_537_1.state_ = "waiting"
		end

		function arg_537_1.playNext_(arg_539_0)
			if arg_539_0 == 1 then
				arg_537_0:Play1101106130(arg_537_1)
			end
		end

		function arg_537_1.onSingleLineUpdate_(arg_540_0)
			local var_540_0 = arg_537_1.actors_["1011ui_story"].transform
			local var_540_1 = 0

			if var_540_1 < arg_537_1.time_ and arg_537_1.time_ <= var_540_1 + arg_540_0 then
				arg_537_1.var_.moveOldPos1011ui_story = var_540_0.localPosition
			end

			local var_540_2 = 0.001

			if var_540_1 <= arg_537_1.time_ and arg_537_1.time_ < var_540_1 + var_540_2 then
				local var_540_3 = (arg_537_1.time_ - var_540_1) / var_540_2
				local var_540_4 = Vector3.New(0, -0.71, -6)

				var_540_0.localPosition = Vector3.Lerp(arg_537_1.var_.moveOldPos1011ui_story, var_540_4, var_540_3)

				local var_540_5 = manager.ui.mainCamera.transform.position - var_540_0.position

				var_540_0.forward = Vector3.New(var_540_5.x, var_540_5.y, var_540_5.z)

				local var_540_6 = var_540_0.localEulerAngles

				var_540_6.z = 0
				var_540_6.x = 0
				var_540_0.localEulerAngles = var_540_6
			end

			if arg_537_1.time_ >= var_540_1 + var_540_2 and arg_537_1.time_ < var_540_1 + var_540_2 + arg_540_0 then
				var_540_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_540_7 = manager.ui.mainCamera.transform.position - var_540_0.position

				var_540_0.forward = Vector3.New(var_540_7.x, var_540_7.y, var_540_7.z)

				local var_540_8 = var_540_0.localEulerAngles

				var_540_8.z = 0
				var_540_8.x = 0
				var_540_0.localEulerAngles = var_540_8
			end

			local var_540_9 = 0

			if var_540_9 < arg_537_1.time_ and arg_537_1.time_ <= var_540_9 + arg_540_0 then
				arg_537_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_540_10 = 0

			if var_540_10 < arg_537_1.time_ and arg_537_1.time_ <= var_540_10 + arg_540_0 then
				arg_537_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_540_11 = 0
			local var_540_12 = 0.125

			if var_540_11 < arg_537_1.time_ and arg_537_1.time_ <= var_540_11 + arg_540_0 then
				arg_537_1.talkMaxDuration = 0
				arg_537_1.dialogCg_.alpha = 1

				arg_537_1.dialog_:SetActive(true)
				SetActive(arg_537_1.leftNameGo_, true)

				local var_540_13 = arg_537_1:FormatText(StoryNameCfg[37].name)

				arg_537_1.leftNameTxt_.text = var_540_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_537_1.leftNameTxt_.transform)

				arg_537_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_537_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_537_1:RecordName(arg_537_1.leftNameTxt_.text)
				SetActive(arg_537_1.iconTrs_.gameObject, false)
				arg_537_1.callingController_:SetSelectedState("normal")

				local var_540_14 = arg_537_1:GetWordFromCfg(1101106129)
				local var_540_15 = arg_537_1:FormatText(var_540_14.content)

				arg_537_1.text_.text = var_540_15

				LuaForUtil.ClearLinePrefixSymbol(arg_537_1.text_)

				local var_540_16 = 5
				local var_540_17 = utf8.len(var_540_15)
				local var_540_18 = var_540_16 <= 0 and var_540_12 or var_540_12 * (var_540_17 / var_540_16)

				if var_540_18 > 0 and var_540_12 < var_540_18 then
					arg_537_1.talkMaxDuration = var_540_18

					if var_540_18 + var_540_11 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_18 + var_540_11
					end
				end

				arg_537_1.text_.text = var_540_15
				arg_537_1.typewritter.percent = 0

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb") ~= 0 then
					local var_540_19 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb") / 1000

					if var_540_19 + var_540_11 > arg_537_1.duration_ then
						arg_537_1.duration_ = var_540_19 + var_540_11
					end

					if var_540_14.prefab_name ~= "" and arg_537_1.actors_[var_540_14.prefab_name] ~= nil then
						local var_540_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_537_1.actors_[var_540_14.prefab_name].transform, "story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb")

						arg_537_1:RecordAudio("1101106129", var_540_20)
						arg_537_1:RecordAudio("1101106129", var_540_20)
					else
						arg_537_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb")
					end

					arg_537_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106129", "story_v_side_new_1101106.awb")
				end

				arg_537_1:RecordContent(arg_537_1.text_.text)
			end

			local var_540_21 = math.max(var_540_12, arg_537_1.talkMaxDuration)

			if var_540_11 <= arg_537_1.time_ and arg_537_1.time_ < var_540_11 + var_540_21 then
				arg_537_1.typewritter.percent = (arg_537_1.time_ - var_540_11) / var_540_21

				arg_537_1.typewritter:SetDirty()
			end

			if arg_537_1.time_ >= var_540_11 + var_540_21 and arg_537_1.time_ < var_540_11 + var_540_21 + arg_540_0 then
				arg_537_1.typewritter.percent = 1

				arg_537_1.typewritter:SetDirty()
				arg_537_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106130 = function(arg_541_0, arg_541_1)
		arg_541_1.time_ = 0
		arg_541_1.frameCnt_ = 0
		arg_541_1.state_ = "playing"
		arg_541_1.curTalkId_ = 1101106130
		arg_541_1.duration_ = 5

		SetActive(arg_541_1.tipsGo_, false)

		function arg_541_1.onSingleLineFinish_()
			arg_541_1.onSingleLineUpdate_ = nil
			arg_541_1.onSingleLineFinish_ = nil
			arg_541_1.state_ = "waiting"
		end

		function arg_541_1.playNext_(arg_543_0)
			if arg_543_0 == 1 then
				arg_541_0:Play1101106131(arg_541_1)
			end
		end

		function arg_541_1.onSingleLineUpdate_(arg_544_0)
			local var_544_0 = 0

			if var_544_0 < arg_541_1.time_ and arg_541_1.time_ <= var_544_0 + arg_544_0 then
				arg_541_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_544_1 = 0

			if var_544_1 < arg_541_1.time_ and arg_541_1.time_ <= var_544_1 + arg_544_0 then
				arg_541_1.allBtn_.enabled = false
			end

			local var_544_2 = 2

			if arg_541_1.time_ >= var_544_1 + var_544_2 and arg_541_1.time_ < var_544_1 + var_544_2 + arg_544_0 then
				arg_541_1.allBtn_.enabled = true
			end

			local var_544_3 = 0
			local var_544_4 = 1.025

			if var_544_3 < arg_541_1.time_ and arg_541_1.time_ <= var_544_3 + arg_544_0 then
				arg_541_1.talkMaxDuration = 0
				arg_541_1.dialogCg_.alpha = 1

				arg_541_1.dialog_:SetActive(true)
				SetActive(arg_541_1.leftNameGo_, true)

				local var_544_5 = arg_541_1:FormatText(StoryNameCfg[7].name)

				arg_541_1.leftNameTxt_.text = var_544_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_541_1.leftNameTxt_.transform)

				arg_541_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_541_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_541_1:RecordName(arg_541_1.leftNameTxt_.text)
				SetActive(arg_541_1.iconTrs_.gameObject, false)
				arg_541_1.callingController_:SetSelectedState("normal")

				local var_544_6 = arg_541_1:GetWordFromCfg(1101106130)
				local var_544_7 = arg_541_1:FormatText(var_544_6.content)

				arg_541_1.text_.text = var_544_7

				LuaForUtil.ClearLinePrefixSymbol(arg_541_1.text_)

				local var_544_8 = 41
				local var_544_9 = utf8.len(var_544_7)
				local var_544_10 = var_544_8 <= 0 and var_544_4 or var_544_4 * (var_544_9 / var_544_8)

				if var_544_10 > 0 and var_544_4 < var_544_10 then
					arg_541_1.talkMaxDuration = var_544_10

					if var_544_10 + var_544_3 > arg_541_1.duration_ then
						arg_541_1.duration_ = var_544_10 + var_544_3
					end
				end

				arg_541_1.text_.text = var_544_7
				arg_541_1.typewritter.percent = 0

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(false)
				arg_541_1:RecordContent(arg_541_1.text_.text)
			end

			local var_544_11 = math.max(var_544_4, arg_541_1.talkMaxDuration)

			if var_544_3 <= arg_541_1.time_ and arg_541_1.time_ < var_544_3 + var_544_11 then
				arg_541_1.typewritter.percent = (arg_541_1.time_ - var_544_3) / var_544_11

				arg_541_1.typewritter:SetDirty()
			end

			if arg_541_1.time_ >= var_544_3 + var_544_11 and arg_541_1.time_ < var_544_3 + var_544_11 + arg_544_0 then
				arg_541_1.typewritter.percent = 1

				arg_541_1.typewritter:SetDirty()
				arg_541_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106131 = function(arg_545_0, arg_545_1)
		arg_545_1.time_ = 0
		arg_545_1.frameCnt_ = 0
		arg_545_1.state_ = "playing"
		arg_545_1.curTalkId_ = 1101106131
		arg_545_1.duration_ = 5

		SetActive(arg_545_1.tipsGo_, false)

		function arg_545_1.onSingleLineFinish_()
			arg_545_1.onSingleLineUpdate_ = nil
			arg_545_1.onSingleLineFinish_ = nil
			arg_545_1.state_ = "waiting"
		end

		function arg_545_1.playNext_(arg_547_0)
			if arg_547_0 == 1 then
				arg_545_0:Play1101106132(arg_545_1)
			end
		end

		function arg_545_1.onSingleLineUpdate_(arg_548_0)
			local var_548_0 = 0

			if var_548_0 < arg_545_1.time_ and arg_545_1.time_ <= var_548_0 + arg_548_0 then
				arg_545_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_548_1 = 0

			if var_548_1 < arg_545_1.time_ and arg_545_1.time_ <= var_548_1 + arg_548_0 then
				arg_545_1.allBtn_.enabled = false
			end

			local var_548_2 = 1.43333333333333

			if arg_545_1.time_ >= var_548_1 + var_548_2 and arg_545_1.time_ < var_548_1 + var_548_2 + arg_548_0 then
				arg_545_1.allBtn_.enabled = true
			end

			local var_548_3 = 0
			local var_548_4 = 0.7

			if var_548_3 < arg_545_1.time_ and arg_545_1.time_ <= var_548_3 + arg_548_0 then
				arg_545_1.talkMaxDuration = 0
				arg_545_1.dialogCg_.alpha = 1

				arg_545_1.dialog_:SetActive(true)
				SetActive(arg_545_1.leftNameGo_, true)

				local var_548_5 = arg_545_1:FormatText(StoryNameCfg[7].name)

				arg_545_1.leftNameTxt_.text = var_548_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_545_1.leftNameTxt_.transform)

				arg_545_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_545_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_545_1:RecordName(arg_545_1.leftNameTxt_.text)
				SetActive(arg_545_1.iconTrs_.gameObject, false)
				arg_545_1.callingController_:SetSelectedState("normal")

				local var_548_6 = arg_545_1:GetWordFromCfg(1101106131)
				local var_548_7 = arg_545_1:FormatText(var_548_6.content)

				arg_545_1.text_.text = var_548_7

				LuaForUtil.ClearLinePrefixSymbol(arg_545_1.text_)

				local var_548_8 = 28
				local var_548_9 = utf8.len(var_548_7)
				local var_548_10 = var_548_8 <= 0 and var_548_4 or var_548_4 * (var_548_9 / var_548_8)

				if var_548_10 > 0 and var_548_4 < var_548_10 then
					arg_545_1.talkMaxDuration = var_548_10

					if var_548_10 + var_548_3 > arg_545_1.duration_ then
						arg_545_1.duration_ = var_548_10 + var_548_3
					end
				end

				arg_545_1.text_.text = var_548_7
				arg_545_1.typewritter.percent = 0

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(false)
				arg_545_1:RecordContent(arg_545_1.text_.text)
			end

			local var_548_11 = math.max(var_548_4, arg_545_1.talkMaxDuration)

			if var_548_3 <= arg_545_1.time_ and arg_545_1.time_ < var_548_3 + var_548_11 then
				arg_545_1.typewritter.percent = (arg_545_1.time_ - var_548_3) / var_548_11

				arg_545_1.typewritter:SetDirty()
			end

			if arg_545_1.time_ >= var_548_3 + var_548_11 and arg_545_1.time_ < var_548_3 + var_548_11 + arg_548_0 then
				arg_545_1.typewritter.percent = 1

				arg_545_1.typewritter:SetDirty()
				arg_545_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106132 = function(arg_549_0, arg_549_1)
		arg_549_1.time_ = 0
		arg_549_1.frameCnt_ = 0
		arg_549_1.state_ = "playing"
		arg_549_1.curTalkId_ = 1101106132
		arg_549_1.duration_ = 5

		SetActive(arg_549_1.tipsGo_, false)

		function arg_549_1.onSingleLineFinish_()
			arg_549_1.onSingleLineUpdate_ = nil
			arg_549_1.onSingleLineFinish_ = nil
			arg_549_1.state_ = "waiting"
		end

		function arg_549_1.playNext_(arg_551_0)
			if arg_551_0 == 1 then
				arg_549_0:Play1101106133(arg_549_1)
			end
		end

		function arg_549_1.onSingleLineUpdate_(arg_552_0)
			local var_552_0 = 0

			if var_552_0 < arg_549_1.time_ and arg_549_1.time_ <= var_552_0 + arg_552_0 then
				arg_549_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_552_1 = 0

			if var_552_1 < arg_549_1.time_ and arg_549_1.time_ <= var_552_1 + arg_552_0 then
				arg_549_1.allBtn_.enabled = false
			end

			local var_552_2 = 2

			if arg_549_1.time_ >= var_552_1 + var_552_2 and arg_549_1.time_ < var_552_1 + var_552_2 + arg_552_0 then
				arg_549_1.allBtn_.enabled = true
			end

			local var_552_3 = 0
			local var_552_4 = 0.3

			if var_552_3 < arg_549_1.time_ and arg_549_1.time_ <= var_552_3 + arg_552_0 then
				arg_549_1.talkMaxDuration = 0
				arg_549_1.dialogCg_.alpha = 1

				arg_549_1.dialog_:SetActive(true)
				SetActive(arg_549_1.leftNameGo_, true)

				local var_552_5 = arg_549_1:FormatText(StoryNameCfg[7].name)

				arg_549_1.leftNameTxt_.text = var_552_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_549_1.leftNameTxt_.transform)

				arg_549_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_549_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_549_1:RecordName(arg_549_1.leftNameTxt_.text)
				SetActive(arg_549_1.iconTrs_.gameObject, false)
				arg_549_1.callingController_:SetSelectedState("normal")

				local var_552_6 = arg_549_1:GetWordFromCfg(1101106132)
				local var_552_7 = arg_549_1:FormatText(var_552_6.content)

				arg_549_1.text_.text = var_552_7

				LuaForUtil.ClearLinePrefixSymbol(arg_549_1.text_)

				local var_552_8 = 12
				local var_552_9 = utf8.len(var_552_7)
				local var_552_10 = var_552_8 <= 0 and var_552_4 or var_552_4 * (var_552_9 / var_552_8)

				if var_552_10 > 0 and var_552_4 < var_552_10 then
					arg_549_1.talkMaxDuration = var_552_10

					if var_552_10 + var_552_3 > arg_549_1.duration_ then
						arg_549_1.duration_ = var_552_10 + var_552_3
					end
				end

				arg_549_1.text_.text = var_552_7
				arg_549_1.typewritter.percent = 0

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(false)
				arg_549_1:RecordContent(arg_549_1.text_.text)
			end

			local var_552_11 = math.max(var_552_4, arg_549_1.talkMaxDuration)

			if var_552_3 <= arg_549_1.time_ and arg_549_1.time_ < var_552_3 + var_552_11 then
				arg_549_1.typewritter.percent = (arg_549_1.time_ - var_552_3) / var_552_11

				arg_549_1.typewritter:SetDirty()
			end

			if arg_549_1.time_ >= var_552_3 + var_552_11 and arg_549_1.time_ < var_552_3 + var_552_11 + arg_552_0 then
				arg_549_1.typewritter.percent = 1

				arg_549_1.typewritter:SetDirty()
				arg_549_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106133 = function(arg_553_0, arg_553_1)
		arg_553_1.time_ = 0
		arg_553_1.frameCnt_ = 0
		arg_553_1.state_ = "playing"
		arg_553_1.curTalkId_ = 1101106133
		arg_553_1.duration_ = 9.2

		local var_553_0 = {
			zh = 9,
			ja = 9.2
		}
		local var_553_1 = manager.audio:GetLocalizationFlag()

		if var_553_0[var_553_1] ~= nil then
			arg_553_1.duration_ = var_553_0[var_553_1]
		end

		SetActive(arg_553_1.tipsGo_, false)

		function arg_553_1.onSingleLineFinish_()
			arg_553_1.onSingleLineUpdate_ = nil
			arg_553_1.onSingleLineFinish_ = nil
			arg_553_1.state_ = "waiting"
		end

		function arg_553_1.playNext_(arg_555_0)
			if arg_555_0 == 1 then
				arg_553_0:Play1101106134(arg_553_1)
			end
		end

		function arg_553_1.onSingleLineUpdate_(arg_556_0)
			local var_556_0 = arg_553_1.actors_["1011ui_story"].transform
			local var_556_1 = 4

			if var_556_1 < arg_553_1.time_ and arg_553_1.time_ <= var_556_1 + arg_556_0 then
				arg_553_1.var_.moveOldPos1011ui_story = var_556_0.localPosition
			end

			local var_556_2 = 0.001

			if var_556_1 <= arg_553_1.time_ and arg_553_1.time_ < var_556_1 + var_556_2 then
				local var_556_3 = (arg_553_1.time_ - var_556_1) / var_556_2
				local var_556_4 = Vector3.New(0, 100, 0)

				var_556_0.localPosition = Vector3.Lerp(arg_553_1.var_.moveOldPos1011ui_story, var_556_4, var_556_3)

				local var_556_5 = manager.ui.mainCamera.transform.position - var_556_0.position

				var_556_0.forward = Vector3.New(var_556_5.x, var_556_5.y, var_556_5.z)

				local var_556_6 = var_556_0.localEulerAngles

				var_556_6.z = 0
				var_556_6.x = 0
				var_556_0.localEulerAngles = var_556_6
			end

			if arg_553_1.time_ >= var_556_1 + var_556_2 and arg_553_1.time_ < var_556_1 + var_556_2 + arg_556_0 then
				var_556_0.localPosition = Vector3.New(0, 100, 0)

				local var_556_7 = manager.ui.mainCamera.transform.position - var_556_0.position

				var_556_0.forward = Vector3.New(var_556_7.x, var_556_7.y, var_556_7.z)

				local var_556_8 = var_556_0.localEulerAngles

				var_556_8.z = 0
				var_556_8.x = 0
				var_556_0.localEulerAngles = var_556_8
			end

			local var_556_9 = "R1102a"

			if arg_553_1.bgs_[var_556_9] == nil then
				local var_556_10 = Object.Instantiate(arg_553_1.paintGo_)

				var_556_10:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_556_9)
				var_556_10.name = var_556_9
				var_556_10.transform.parent = arg_553_1.stage_.transform
				var_556_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_553_1.bgs_[var_556_9] = var_556_10
			end

			local var_556_11 = arg_553_1.bgs_.R1102a.transform
			local var_556_12 = 4

			if var_556_12 < arg_553_1.time_ and arg_553_1.time_ <= var_556_12 + arg_556_0 then
				arg_553_1.var_.moveOldPosR1102a = var_556_11.localPosition
			end

			local var_556_13 = 0.001

			if var_556_12 <= arg_553_1.time_ and arg_553_1.time_ < var_556_12 + var_556_13 then
				local var_556_14 = (arg_553_1.time_ - var_556_12) / var_556_13
				local var_556_15 = Vector3.New(0.4, -1.1, 2.15)

				var_556_11.localPosition = Vector3.Lerp(arg_553_1.var_.moveOldPosR1102a, var_556_15, var_556_14)
			end

			if arg_553_1.time_ >= var_556_12 + var_556_13 and arg_553_1.time_ < var_556_12 + var_556_13 + arg_556_0 then
				var_556_11.localPosition = Vector3.New(0.4, -1.1, 2.15)
			end

			local var_556_16 = arg_553_1.bgs_.R1102a.transform
			local var_556_17 = 4.034

			if var_556_17 < arg_553_1.time_ and arg_553_1.time_ <= var_556_17 + arg_556_0 then
				arg_553_1.var_.moveOldPosR1102a = var_556_16.localPosition
			end

			local var_556_18 = 4.641

			if var_556_17 <= arg_553_1.time_ and arg_553_1.time_ < var_556_17 + var_556_18 then
				local var_556_19 = (arg_553_1.time_ - var_556_17) / var_556_18
				local var_556_20 = Vector3.New(0.4, -1.1, 2)

				var_556_16.localPosition = Vector3.Lerp(arg_553_1.var_.moveOldPosR1102a, var_556_20, var_556_19)
			end

			if arg_553_1.time_ >= var_556_17 + var_556_18 and arg_553_1.time_ < var_556_17 + var_556_18 + arg_556_0 then
				var_556_16.localPosition = Vector3.New(0.4, -1.1, 2)
			end

			local var_556_21 = arg_553_1.actors_.R1102a
			local var_556_22 = 4.00000000184774

			if var_556_22 < arg_553_1.time_ and arg_553_1.time_ <= var_556_22 + arg_556_0 then
				local var_556_23 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_556_23 then
					var_556_23.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_556_23.radialBlurScale = 0
					var_556_23.radialBlurGradient = 0
					var_556_23.radialBlurIntensity = 0

					if var_556_21 then
						var_556_23.radialBlurTarget = var_556_21.transform
					end
				end
			end

			local var_556_24 = 3.59933333148559

			if var_556_22 <= arg_553_1.time_ and arg_553_1.time_ < var_556_22 + var_556_24 then
				local var_556_25 = (arg_553_1.time_ - var_556_22) / var_556_24
				local var_556_26 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_556_26 then
					var_556_26.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_556_26.radialBlurScale = Mathf.Lerp(0, 0.35, var_556_25)
					var_556_26.radialBlurGradient = Mathf.Lerp(0, 1, var_556_25)
					var_556_26.radialBlurIntensity = Mathf.Lerp(0, 1, var_556_25)
				end
			end

			if arg_553_1.time_ >= var_556_22 + var_556_24 and arg_553_1.time_ < var_556_22 + var_556_24 + arg_556_0 then
				local var_556_27 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_556_27 then
					var_556_27.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.BlurByBackground
					var_556_27.radialBlurScale = 0.35
					var_556_27.radialBlurGradient = 1
					var_556_27.radialBlurIntensity = 1
				end
			end

			local var_556_28 = 4

			if var_556_28 < arg_553_1.time_ and arg_553_1.time_ <= var_556_28 + arg_556_0 then
				arg_553_1.allBtn_.enabled = false
			end

			local var_556_29 = 3.59933333333333

			if arg_553_1.time_ >= var_556_28 + var_556_29 and arg_553_1.time_ < var_556_28 + var_556_29 + arg_556_0 then
				arg_553_1.allBtn_.enabled = true
			end

			local var_556_30 = 0

			if var_556_30 < arg_553_1.time_ and arg_553_1.time_ <= var_556_30 + arg_556_0 then
				arg_553_1.mask_.enabled = true
				arg_553_1.mask_.raycastTarget = true

				arg_553_1:SetGaussion(false)
			end

			local var_556_31 = 4

			if var_556_30 <= arg_553_1.time_ and arg_553_1.time_ < var_556_30 + var_556_31 then
				local var_556_32 = (arg_553_1.time_ - var_556_30) / var_556_31
				local var_556_33 = Color.New(0, 0, 0)

				var_556_33.a = Mathf.Lerp(0, 1, var_556_32)
				arg_553_1.mask_.color = var_556_33
			end

			if arg_553_1.time_ >= var_556_30 + var_556_31 and arg_553_1.time_ < var_556_30 + var_556_31 + arg_556_0 then
				local var_556_34 = Color.New(0, 0, 0)

				var_556_34.a = 1
				arg_553_1.mask_.color = var_556_34
			end

			local var_556_35 = 4

			if var_556_35 < arg_553_1.time_ and arg_553_1.time_ <= var_556_35 + arg_556_0 then
				arg_553_1.mask_.enabled = true
				arg_553_1.mask_.raycastTarget = true

				arg_553_1:SetGaussion(false)
			end

			local var_556_36 = 4

			if var_556_35 <= arg_553_1.time_ and arg_553_1.time_ < var_556_35 + var_556_36 then
				local var_556_37 = (arg_553_1.time_ - var_556_35) / var_556_36
				local var_556_38 = Color.New(0, 0, 0)

				var_556_38.a = Mathf.Lerp(1, 0, var_556_37)
				arg_553_1.mask_.color = var_556_38
			end

			if arg_553_1.time_ >= var_556_35 + var_556_36 and arg_553_1.time_ < var_556_35 + var_556_36 + arg_556_0 then
				local var_556_39 = Color.New(0, 0, 0)
				local var_556_40 = 0

				arg_553_1.mask_.enabled = false
				var_556_39.a = var_556_40
				arg_553_1.mask_.color = var_556_39
			end

			if arg_553_1.frameCnt_ <= 1 then
				arg_553_1.dialog_:SetActive(false)
			end

			local var_556_41 = 8
			local var_556_42 = 0.075

			if var_556_41 < arg_553_1.time_ and arg_553_1.time_ <= var_556_41 + arg_556_0 then
				arg_553_1.talkMaxDuration = 0

				arg_553_1.dialog_:SetActive(true)

				local var_556_43 = LeanTween.value(arg_553_1.dialog_, 0, 1, 0.3)

				var_556_43:setOnUpdate(LuaHelper.FloatAction(function(arg_557_0)
					arg_553_1.dialogCg_.alpha = arg_557_0
				end))
				var_556_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_553_1.dialog_)
					var_556_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_553_1.duration_ = arg_553_1.duration_ + 0.3

				SetActive(arg_553_1.leftNameGo_, true)

				local var_556_44 = arg_553_1:FormatText(StoryNameCfg[37].name)

				arg_553_1.leftNameTxt_.text = var_556_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_553_1.leftNameTxt_.transform)

				arg_553_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_553_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_553_1:RecordName(arg_553_1.leftNameTxt_.text)
				SetActive(arg_553_1.iconTrs_.gameObject, false)
				arg_553_1.callingController_:SetSelectedState("normal")

				local var_556_45 = arg_553_1:GetWordFromCfg(1101106133)
				local var_556_46 = arg_553_1:FormatText(var_556_45.content)

				arg_553_1.text_.text = var_556_46

				LuaForUtil.ClearLinePrefixSymbol(arg_553_1.text_)

				local var_556_47 = 3
				local var_556_48 = utf8.len(var_556_46)
				local var_556_49 = var_556_47 <= 0 and var_556_42 or var_556_42 * (var_556_48 / var_556_47)

				if var_556_49 > 0 and var_556_42 < var_556_49 then
					arg_553_1.talkMaxDuration = var_556_49
					var_556_41 = var_556_41 + 0.3

					if var_556_49 + var_556_41 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_49 + var_556_41
					end
				end

				arg_553_1.text_.text = var_556_46
				arg_553_1.typewritter.percent = 0

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb") ~= 0 then
					local var_556_50 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb") / 1000

					if var_556_50 + var_556_41 > arg_553_1.duration_ then
						arg_553_1.duration_ = var_556_50 + var_556_41
					end

					if var_556_45.prefab_name ~= "" and arg_553_1.actors_[var_556_45.prefab_name] ~= nil then
						local var_556_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_553_1.actors_[var_556_45.prefab_name].transform, "story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb")

						arg_553_1:RecordAudio("1101106133", var_556_51)
						arg_553_1:RecordAudio("1101106133", var_556_51)
					else
						arg_553_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb")
					end

					arg_553_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106133", "story_v_side_new_1101106.awb")
				end

				arg_553_1:RecordContent(arg_553_1.text_.text)
			end

			local var_556_52 = var_556_41 + 0.3
			local var_556_53 = math.max(var_556_42, arg_553_1.talkMaxDuration)

			if var_556_52 <= arg_553_1.time_ and arg_553_1.time_ < var_556_52 + var_556_53 then
				arg_553_1.typewritter.percent = (arg_553_1.time_ - var_556_52) / var_556_53

				arg_553_1.typewritter:SetDirty()
			end

			if arg_553_1.time_ >= var_556_52 + var_556_53 and arg_553_1.time_ < var_556_52 + var_556_53 + arg_556_0 then
				arg_553_1.typewritter.percent = 1

				arg_553_1.typewritter:SetDirty()
				arg_553_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106134 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 1101106134
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play1101106135(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = arg_559_1.actors_.R1102a
			local var_562_1 = 0

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 then
				local var_562_2 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_562_2 then
					var_562_2.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_562_2.radialBlurScale = 0
					var_562_2.radialBlurGradient = 0
					var_562_2.radialBlurIntensity = 0

					if var_562_0 then
						var_562_2.radialBlurTarget = var_562_0.transform
					end
				end
			end

			local var_562_3 = 3.59933333148559

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_3 then
				local var_562_4 = (arg_559_1.time_ - var_562_1) / var_562_3
				local var_562_5 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_562_5 then
					var_562_5.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_562_5.radialBlurScale = Mathf.Lerp(0, 0.35, var_562_4)
					var_562_5.radialBlurGradient = Mathf.Lerp(0, 1, var_562_4)
					var_562_5.radialBlurIntensity = Mathf.Lerp(0, 1, var_562_4)
				end
			end

			if arg_559_1.time_ >= var_562_1 + var_562_3 and arg_559_1.time_ < var_562_1 + var_562_3 + arg_562_0 then
				local var_562_6 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_562_6 then
					var_562_6.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_562_6.radialBlurScale = 0.35
					var_562_6.radialBlurGradient = 1
					var_562_6.radialBlurIntensity = 1
				end
			end

			local var_562_7 = 0
			local var_562_8 = 0.5

			if var_562_7 < arg_559_1.time_ and arg_559_1.time_ <= var_562_7 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, false)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_9 = arg_559_1:GetWordFromCfg(1101106134)
				local var_562_10 = arg_559_1:FormatText(var_562_9.content)

				arg_559_1.text_.text = var_562_10

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_11 = 20
				local var_562_12 = utf8.len(var_562_10)
				local var_562_13 = var_562_11 <= 0 and var_562_8 or var_562_8 * (var_562_12 / var_562_11)

				if var_562_13 > 0 and var_562_8 < var_562_13 then
					arg_559_1.talkMaxDuration = var_562_13

					if var_562_13 + var_562_7 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_13 + var_562_7
					end
				end

				arg_559_1.text_.text = var_562_10
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_14 = math.max(var_562_8, arg_559_1.talkMaxDuration)

			if var_562_7 <= arg_559_1.time_ and arg_559_1.time_ < var_562_7 + var_562_14 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_7) / var_562_14

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_7 + var_562_14 and arg_559_1.time_ < var_562_7 + var_562_14 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106135 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 1101106135
		arg_563_1.duration_ = 2.666

		local var_563_0 = {
			zh = 2.466,
			ja = 2.666
		}
		local var_563_1 = manager.audio:GetLocalizationFlag()

		if var_563_0[var_563_1] ~= nil then
			arg_563_1.duration_ = var_563_0[var_563_1]
		end

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play1101106136(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0
			local var_566_1 = 0.125

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_2 = arg_563_1:FormatText(StoryNameCfg[37].name)

				arg_563_1.leftNameTxt_.text = var_566_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_3 = arg_563_1:GetWordFromCfg(1101106135)
				local var_566_4 = arg_563_1:FormatText(var_566_3.content)

				arg_563_1.text_.text = var_566_4

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_5 = 5
				local var_566_6 = utf8.len(var_566_4)
				local var_566_7 = var_566_5 <= 0 and var_566_1 or var_566_1 * (var_566_6 / var_566_5)

				if var_566_7 > 0 and var_566_1 < var_566_7 then
					arg_563_1.talkMaxDuration = var_566_7

					if var_566_7 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_7 + var_566_0
					end
				end

				arg_563_1.text_.text = var_566_4
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb") ~= 0 then
					local var_566_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb") / 1000

					if var_566_8 + var_566_0 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_8 + var_566_0
					end

					if var_566_3.prefab_name ~= "" and arg_563_1.actors_[var_566_3.prefab_name] ~= nil then
						local var_566_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_563_1.actors_[var_566_3.prefab_name].transform, "story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb")

						arg_563_1:RecordAudio("1101106135", var_566_9)
						arg_563_1:RecordAudio("1101106135", var_566_9)
					else
						arg_563_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb")
					end

					arg_563_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106135", "story_v_side_new_1101106.awb")
				end

				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_10 = math.max(var_566_1, arg_563_1.talkMaxDuration)

			if var_566_0 <= arg_563_1.time_ and arg_563_1.time_ < var_566_0 + var_566_10 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_0) / var_566_10

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_0 + var_566_10 and arg_563_1.time_ < var_566_0 + var_566_10 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106136 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 1101106136
		arg_567_1.duration_ = 8.733

		local var_567_0 = {
			zh = 8.733,
			ja = 8.366
		}
		local var_567_1 = manager.audio:GetLocalizationFlag()

		if var_567_0[var_567_1] ~= nil then
			arg_567_1.duration_ = var_567_0[var_567_1]
		end

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play1101106137(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0
			local var_570_1 = 0.625

			if var_570_0 < arg_567_1.time_ and arg_567_1.time_ <= var_570_0 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_2 = arg_567_1:FormatText(StoryNameCfg[37].name)

				arg_567_1.leftNameTxt_.text = var_570_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_3 = arg_567_1:GetWordFromCfg(1101106136)
				local var_570_4 = arg_567_1:FormatText(var_570_3.content)

				arg_567_1.text_.text = var_570_4

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_5 = 25
				local var_570_6 = utf8.len(var_570_4)
				local var_570_7 = var_570_5 <= 0 and var_570_1 or var_570_1 * (var_570_6 / var_570_5)

				if var_570_7 > 0 and var_570_1 < var_570_7 then
					arg_567_1.talkMaxDuration = var_570_7

					if var_570_7 + var_570_0 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_7 + var_570_0
					end
				end

				arg_567_1.text_.text = var_570_4
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb") ~= 0 then
					local var_570_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb") / 1000

					if var_570_8 + var_570_0 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_8 + var_570_0
					end

					if var_570_3.prefab_name ~= "" and arg_567_1.actors_[var_570_3.prefab_name] ~= nil then
						local var_570_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_567_1.actors_[var_570_3.prefab_name].transform, "story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb")

						arg_567_1:RecordAudio("1101106136", var_570_9)
						arg_567_1:RecordAudio("1101106136", var_570_9)
					else
						arg_567_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb")
					end

					arg_567_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106136", "story_v_side_new_1101106.awb")
				end

				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_10 = math.max(var_570_1, arg_567_1.talkMaxDuration)

			if var_570_0 <= arg_567_1.time_ and arg_567_1.time_ < var_570_0 + var_570_10 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_0) / var_570_10

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_0 + var_570_10 and arg_567_1.time_ < var_570_0 + var_570_10 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106137 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 1101106137
		arg_571_1.duration_ = 9

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play1101106138(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = "A00"

			if arg_571_1.bgs_[var_574_0] == nil then
				local var_574_1 = Object.Instantiate(arg_571_1.paintGo_)

				var_574_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_574_0)
				var_574_1.name = var_574_0
				var_574_1.transform.parent = arg_571_1.stage_.transform
				var_574_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_571_1.bgs_[var_574_0] = var_574_1
			end

			local var_574_2 = 2

			if var_574_2 < arg_571_1.time_ and arg_571_1.time_ <= var_574_2 + arg_574_0 then
				local var_574_3 = manager.ui.mainCamera.transform.localPosition
				local var_574_4 = Vector3.New(0, 0, 10) + Vector3.New(var_574_3.x, var_574_3.y, 0)
				local var_574_5 = arg_571_1.bgs_.A00

				var_574_5.transform.localPosition = var_574_4
				var_574_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_574_6 = var_574_5:GetComponent("SpriteRenderer")

				if var_574_6 and var_574_6.sprite then
					local var_574_7 = (var_574_5.transform.localPosition - var_574_3).z
					local var_574_8 = manager.ui.mainCameraCom_
					local var_574_9 = 2 * var_574_7 * Mathf.Tan(var_574_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_574_10 = var_574_9 * var_574_8.aspect
					local var_574_11 = var_574_6.sprite.bounds.size.x
					local var_574_12 = var_574_6.sprite.bounds.size.y
					local var_574_13 = var_574_10 / var_574_11
					local var_574_14 = var_574_9 / var_574_12
					local var_574_15 = var_574_14 < var_574_13 and var_574_13 or var_574_14

					var_574_5.transform.localScale = Vector3.New(var_574_15, var_574_15, 0)
				end

				for iter_574_0, iter_574_1 in pairs(arg_571_1.bgs_) do
					if iter_574_0 ~= "A00" then
						iter_574_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_574_16 = arg_571_1.actors_["1011ui_story"].transform
			local var_574_17 = 2

			if var_574_17 < arg_571_1.time_ and arg_571_1.time_ <= var_574_17 + arg_574_0 then
				arg_571_1.var_.moveOldPos1011ui_story = var_574_16.localPosition
			end

			local var_574_18 = 0.001

			if var_574_17 <= arg_571_1.time_ and arg_571_1.time_ < var_574_17 + var_574_18 then
				local var_574_19 = (arg_571_1.time_ - var_574_17) / var_574_18
				local var_574_20 = Vector3.New(0, -0.71, -6)

				var_574_16.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1011ui_story, var_574_20, var_574_19)

				local var_574_21 = manager.ui.mainCamera.transform.position - var_574_16.position

				var_574_16.forward = Vector3.New(var_574_21.x, var_574_21.y, var_574_21.z)

				local var_574_22 = var_574_16.localEulerAngles

				var_574_22.z = 0
				var_574_22.x = 0
				var_574_16.localEulerAngles = var_574_22
			end

			if arg_571_1.time_ >= var_574_17 + var_574_18 and arg_571_1.time_ < var_574_17 + var_574_18 + arg_574_0 then
				var_574_16.localPosition = Vector3.New(0, -0.71, -6)

				local var_574_23 = manager.ui.mainCamera.transform.position - var_574_16.position

				var_574_16.forward = Vector3.New(var_574_23.x, var_574_23.y, var_574_23.z)

				local var_574_24 = var_574_16.localEulerAngles

				var_574_24.z = 0
				var_574_24.x = 0
				var_574_16.localEulerAngles = var_574_24
			end

			local var_574_25 = arg_571_1.actors_["1011ui_story"]
			local var_574_26 = 2

			if var_574_26 < arg_571_1.time_ and arg_571_1.time_ <= var_574_26 + arg_574_0 and arg_571_1.var_.characterEffect1011ui_story == nil then
				arg_571_1.var_.characterEffect1011ui_story = var_574_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_27 = 0.200000002980232

			if var_574_26 <= arg_571_1.time_ and arg_571_1.time_ < var_574_26 + var_574_27 then
				local var_574_28 = (arg_571_1.time_ - var_574_26) / var_574_27

				if arg_571_1.var_.characterEffect1011ui_story then
					arg_571_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_571_1.time_ >= var_574_26 + var_574_27 and arg_571_1.time_ < var_574_26 + var_574_27 + arg_574_0 and arg_571_1.var_.characterEffect1011ui_story then
				arg_571_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_574_29 = 0

			if var_574_29 < arg_571_1.time_ and arg_571_1.time_ <= var_574_29 + arg_574_0 then
				arg_571_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_574_30 = 0

			if var_574_30 < arg_571_1.time_ and arg_571_1.time_ <= var_574_30 + arg_574_0 then
				arg_571_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_574_31 = 0

			if var_574_31 < arg_571_1.time_ and arg_571_1.time_ <= var_574_31 + arg_574_0 then
				arg_571_1.mask_.enabled = true
				arg_571_1.mask_.raycastTarget = true

				arg_571_1:SetGaussion(false)
			end

			local var_574_32 = 2

			if var_574_31 <= arg_571_1.time_ and arg_571_1.time_ < var_574_31 + var_574_32 then
				local var_574_33 = (arg_571_1.time_ - var_574_31) / var_574_32
				local var_574_34 = Color.New(0, 0, 0)

				var_574_34.a = Mathf.Lerp(0, 1, var_574_33)
				arg_571_1.mask_.color = var_574_34
			end

			if arg_571_1.time_ >= var_574_31 + var_574_32 and arg_571_1.time_ < var_574_31 + var_574_32 + arg_574_0 then
				local var_574_35 = Color.New(0, 0, 0)

				var_574_35.a = 1
				arg_571_1.mask_.color = var_574_35
			end

			local var_574_36 = 2

			if var_574_36 < arg_571_1.time_ and arg_571_1.time_ <= var_574_36 + arg_574_0 then
				arg_571_1.mask_.enabled = true
				arg_571_1.mask_.raycastTarget = true

				arg_571_1:SetGaussion(false)
			end

			local var_574_37 = 2

			if var_574_36 <= arg_571_1.time_ and arg_571_1.time_ < var_574_36 + var_574_37 then
				local var_574_38 = (arg_571_1.time_ - var_574_36) / var_574_37
				local var_574_39 = Color.New(0, 0, 0)

				var_574_39.a = Mathf.Lerp(1, 0, var_574_38)
				arg_571_1.mask_.color = var_574_39
			end

			if arg_571_1.time_ >= var_574_36 + var_574_37 and arg_571_1.time_ < var_574_36 + var_574_37 + arg_574_0 then
				local var_574_40 = Color.New(0, 0, 0)
				local var_574_41 = 0

				arg_571_1.mask_.enabled = false
				var_574_40.a = var_574_41
				arg_571_1.mask_.color = var_574_40
			end

			local var_574_42 = 2

			if var_574_42 < arg_571_1.time_ and arg_571_1.time_ <= var_574_42 + arg_574_0 then
				arg_571_1.screenFilterGo_:SetActive(true)

				arg_571_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_574_43 = 0.034000001847744

			if var_574_42 <= arg_571_1.time_ and arg_571_1.time_ < var_574_42 + var_574_43 then
				local var_574_44 = (arg_571_1.time_ - var_574_42) / var_574_43

				arg_571_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_574_44)
			end

			if arg_571_1.time_ >= var_574_42 + var_574_43 and arg_571_1.time_ < var_574_42 + var_574_43 + arg_574_0 then
				arg_571_1.screenFilterEffect_.weight = 1
			end

			if arg_571_1.frameCnt_ <= 1 then
				arg_571_1.dialog_:SetActive(false)
			end

			local var_574_45 = 4
			local var_574_46 = 0.575

			if var_574_45 < arg_571_1.time_ and arg_571_1.time_ <= var_574_45 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0

				arg_571_1.dialog_:SetActive(true)

				local var_574_47 = LeanTween.value(arg_571_1.dialog_, 0, 1, 0.3)

				var_574_47:setOnUpdate(LuaHelper.FloatAction(function(arg_575_0)
					arg_571_1.dialogCg_.alpha = arg_575_0
				end))
				var_574_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_571_1.dialog_)
					var_574_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_571_1.duration_ = arg_571_1.duration_ + 0.3

				SetActive(arg_571_1.leftNameGo_, false)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_48 = arg_571_1:GetWordFromCfg(1101106137)
				local var_574_49 = arg_571_1:FormatText(var_574_48.content)

				arg_571_1.text_.text = var_574_49

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_50 = 23
				local var_574_51 = utf8.len(var_574_49)
				local var_574_52 = var_574_50 <= 0 and var_574_46 or var_574_46 * (var_574_51 / var_574_50)

				if var_574_52 > 0 and var_574_46 < var_574_52 then
					arg_571_1.talkMaxDuration = var_574_52
					var_574_45 = var_574_45 + 0.3

					if var_574_52 + var_574_45 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_52 + var_574_45
					end
				end

				arg_571_1.text_.text = var_574_49
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_53 = var_574_45 + 0.3
			local var_574_54 = math.max(var_574_46, arg_571_1.talkMaxDuration)

			if var_574_53 <= arg_571_1.time_ and arg_571_1.time_ < var_574_53 + var_574_54 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_53) / var_574_54

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_53 + var_574_54 and arg_571_1.time_ < var_574_53 + var_574_54 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106138 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 1101106138
		arg_577_1.duration_ = 9

		SetActive(arg_577_1.tipsGo_, false)

		function arg_577_1.onSingleLineFinish_()
			arg_577_1.onSingleLineUpdate_ = nil
			arg_577_1.onSingleLineFinish_ = nil
			arg_577_1.state_ = "waiting"
		end

		function arg_577_1.playNext_(arg_579_0)
			if arg_579_0 == 1 then
				arg_577_0:Play1101106139(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = "ST12"

			if arg_577_1.bgs_[var_580_0] == nil then
				local var_580_1 = Object.Instantiate(arg_577_1.paintGo_)

				var_580_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_580_0)
				var_580_1.name = var_580_0
				var_580_1.transform.parent = arg_577_1.stage_.transform
				var_580_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_577_1.bgs_[var_580_0] = var_580_1
			end

			local var_580_2 = 2

			if var_580_2 < arg_577_1.time_ and arg_577_1.time_ <= var_580_2 + arg_580_0 then
				local var_580_3 = manager.ui.mainCamera.transform.localPosition
				local var_580_4 = Vector3.New(0, 0, 10) + Vector3.New(var_580_3.x, var_580_3.y, 0)
				local var_580_5 = arg_577_1.bgs_.ST12

				var_580_5.transform.localPosition = var_580_4
				var_580_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_580_6 = var_580_5:GetComponent("SpriteRenderer")

				if var_580_6 and var_580_6.sprite then
					local var_580_7 = (var_580_5.transform.localPosition - var_580_3).z
					local var_580_8 = manager.ui.mainCameraCom_
					local var_580_9 = 2 * var_580_7 * Mathf.Tan(var_580_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_580_10 = var_580_9 * var_580_8.aspect
					local var_580_11 = var_580_6.sprite.bounds.size.x
					local var_580_12 = var_580_6.sprite.bounds.size.y
					local var_580_13 = var_580_10 / var_580_11
					local var_580_14 = var_580_9 / var_580_12
					local var_580_15 = var_580_14 < var_580_13 and var_580_13 or var_580_14

					var_580_5.transform.localScale = Vector3.New(var_580_15, var_580_15, 0)
				end

				for iter_580_0, iter_580_1 in pairs(arg_577_1.bgs_) do
					if iter_580_0 ~= "ST12" then
						iter_580_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_580_16 = 0

			if var_580_16 < arg_577_1.time_ and arg_577_1.time_ <= var_580_16 + arg_580_0 then
				arg_577_1.mask_.enabled = true
				arg_577_1.mask_.raycastTarget = true

				arg_577_1:SetGaussion(false)
			end

			local var_580_17 = 2

			if var_580_16 <= arg_577_1.time_ and arg_577_1.time_ < var_580_16 + var_580_17 then
				local var_580_18 = (arg_577_1.time_ - var_580_16) / var_580_17
				local var_580_19 = Color.New(0, 0, 0)

				var_580_19.a = Mathf.Lerp(0, 1, var_580_18)
				arg_577_1.mask_.color = var_580_19
			end

			if arg_577_1.time_ >= var_580_16 + var_580_17 and arg_577_1.time_ < var_580_16 + var_580_17 + arg_580_0 then
				local var_580_20 = Color.New(0, 0, 0)

				var_580_20.a = 1
				arg_577_1.mask_.color = var_580_20
			end

			local var_580_21 = 2

			if var_580_21 < arg_577_1.time_ and arg_577_1.time_ <= var_580_21 + arg_580_0 then
				arg_577_1.mask_.enabled = true
				arg_577_1.mask_.raycastTarget = true

				arg_577_1:SetGaussion(false)
			end

			local var_580_22 = 2

			if var_580_21 <= arg_577_1.time_ and arg_577_1.time_ < var_580_21 + var_580_22 then
				local var_580_23 = (arg_577_1.time_ - var_580_21) / var_580_22
				local var_580_24 = Color.New(0, 0, 0)

				var_580_24.a = Mathf.Lerp(1, 0, var_580_23)
				arg_577_1.mask_.color = var_580_24
			end

			if arg_577_1.time_ >= var_580_21 + var_580_22 and arg_577_1.time_ < var_580_21 + var_580_22 + arg_580_0 then
				local var_580_25 = Color.New(0, 0, 0)
				local var_580_26 = 0

				arg_577_1.mask_.enabled = false
				var_580_25.a = var_580_26
				arg_577_1.mask_.color = var_580_25
			end

			local var_580_27 = arg_577_1.actors_["1011ui_story"].transform
			local var_580_28 = 4

			if var_580_28 < arg_577_1.time_ and arg_577_1.time_ <= var_580_28 + arg_580_0 then
				arg_577_1.var_.moveOldPos1011ui_story = var_580_27.localPosition
			end

			local var_580_29 = 0.001

			if var_580_28 <= arg_577_1.time_ and arg_577_1.time_ < var_580_28 + var_580_29 then
				local var_580_30 = (arg_577_1.time_ - var_580_28) / var_580_29
				local var_580_31 = Vector3.New(0, -0.71, -6)

				var_580_27.localPosition = Vector3.Lerp(arg_577_1.var_.moveOldPos1011ui_story, var_580_31, var_580_30)

				local var_580_32 = manager.ui.mainCamera.transform.position - var_580_27.position

				var_580_27.forward = Vector3.New(var_580_32.x, var_580_32.y, var_580_32.z)

				local var_580_33 = var_580_27.localEulerAngles

				var_580_33.z = 0
				var_580_33.x = 0
				var_580_27.localEulerAngles = var_580_33
			end

			if arg_577_1.time_ >= var_580_28 + var_580_29 and arg_577_1.time_ < var_580_28 + var_580_29 + arg_580_0 then
				var_580_27.localPosition = Vector3.New(0, -0.71, -6)

				local var_580_34 = manager.ui.mainCamera.transform.position - var_580_27.position

				var_580_27.forward = Vector3.New(var_580_34.x, var_580_34.y, var_580_34.z)

				local var_580_35 = var_580_27.localEulerAngles

				var_580_35.z = 0
				var_580_35.x = 0
				var_580_27.localEulerAngles = var_580_35
			end

			local var_580_36 = arg_577_1.actors_["1011ui_story"]
			local var_580_37 = 4

			if var_580_37 < arg_577_1.time_ and arg_577_1.time_ <= var_580_37 + arg_580_0 and arg_577_1.var_.characterEffect1011ui_story == nil then
				arg_577_1.var_.characterEffect1011ui_story = var_580_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_580_38 = 0.200000002980232

			if var_580_37 <= arg_577_1.time_ and arg_577_1.time_ < var_580_37 + var_580_38 then
				local var_580_39 = (arg_577_1.time_ - var_580_37) / var_580_38

				if arg_577_1.var_.characterEffect1011ui_story then
					arg_577_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_577_1.time_ >= var_580_37 + var_580_38 and arg_577_1.time_ < var_580_37 + var_580_38 + arg_580_0 and arg_577_1.var_.characterEffect1011ui_story then
				arg_577_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_580_40 = 2

			if var_580_40 < arg_577_1.time_ and arg_577_1.time_ <= var_580_40 + arg_580_0 then
				arg_577_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action8_1")
			end

			local var_580_41 = 4

			if var_580_41 < arg_577_1.time_ and arg_577_1.time_ <= var_580_41 + arg_580_0 then
				arg_577_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			if arg_577_1.frameCnt_ <= 1 then
				arg_577_1.dialog_:SetActive(false)
			end

			local var_580_42 = 4
			local var_580_43 = 0.325

			if var_580_42 < arg_577_1.time_ and arg_577_1.time_ <= var_580_42 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0

				arg_577_1.dialog_:SetActive(true)

				local var_580_44 = LeanTween.value(arg_577_1.dialog_, 0, 1, 0.3)

				var_580_44:setOnUpdate(LuaHelper.FloatAction(function(arg_581_0)
					arg_577_1.dialogCg_.alpha = arg_581_0
				end))
				var_580_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_577_1.dialog_)
					var_580_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_577_1.duration_ = arg_577_1.duration_ + 0.3

				SetActive(arg_577_1.leftNameGo_, false)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_577_1.iconTrs_.gameObject, false)
				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_45 = arg_577_1:GetWordFromCfg(1101106138)
				local var_580_46 = arg_577_1:FormatText(var_580_45.content)

				arg_577_1.text_.text = var_580_46

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_47 = 13
				local var_580_48 = utf8.len(var_580_46)
				local var_580_49 = var_580_47 <= 0 and var_580_43 or var_580_43 * (var_580_48 / var_580_47)

				if var_580_49 > 0 and var_580_43 < var_580_49 then
					arg_577_1.talkMaxDuration = var_580_49
					var_580_42 = var_580_42 + 0.3

					if var_580_49 + var_580_42 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_49 + var_580_42
					end
				end

				arg_577_1.text_.text = var_580_46
				arg_577_1.typewritter.percent = 0

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(false)
				arg_577_1:RecordContent(arg_577_1.text_.text)
			end

			local var_580_50 = var_580_42 + 0.3
			local var_580_51 = math.max(var_580_43, arg_577_1.talkMaxDuration)

			if var_580_50 <= arg_577_1.time_ and arg_577_1.time_ < var_580_50 + var_580_51 then
				arg_577_1.typewritter.percent = (arg_577_1.time_ - var_580_50) / var_580_51

				arg_577_1.typewritter:SetDirty()
			end

			if arg_577_1.time_ >= var_580_50 + var_580_51 and arg_577_1.time_ < var_580_50 + var_580_51 + arg_580_0 then
				arg_577_1.typewritter.percent = 1

				arg_577_1.typewritter:SetDirty()
				arg_577_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106139 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 1101106139
		arg_583_1.duration_ = 4.999999999999

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"

			SetActive(arg_583_1.choicesGo_, true)

			for iter_584_0, iter_584_1 in ipairs(arg_583_1.choices_) do
				local var_584_0 = iter_584_0 <= 1

				SetActive(iter_584_1.go, var_584_0)
			end

			arg_583_1.choices_[1].txt.text = arg_583_1:FormatText(StoryChoiceCfg[622].name)
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play1101106140(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = 4

			if var_586_0 < arg_583_1.time_ and arg_583_1.time_ <= var_586_0 + arg_586_0 then
				arg_583_1.allBtn_.enabled = false
			end

			local var_586_1 = 0.5

			if arg_583_1.time_ >= var_586_0 + var_586_1 and arg_583_1.time_ < var_586_0 + var_586_1 + arg_586_0 then
				arg_583_1.allBtn_.enabled = true
			end

			local var_586_2 = 0

			if var_586_2 < arg_583_1.time_ and arg_583_1.time_ <= var_586_2 + arg_586_0 then
				arg_583_1.mask_.enabled = true
				arg_583_1.mask_.raycastTarget = true

				arg_583_1:SetGaussion(false)
			end

			local var_586_3 = 2

			if var_586_2 <= arg_583_1.time_ and arg_583_1.time_ < var_586_2 + var_586_3 then
				local var_586_4 = (arg_583_1.time_ - var_586_2) / var_586_3
				local var_586_5 = Color.New(0, 0, 0)

				var_586_5.a = Mathf.Lerp(0, 1, var_586_4)
				arg_583_1.mask_.color = var_586_5
			end

			if arg_583_1.time_ >= var_586_2 + var_586_3 and arg_583_1.time_ < var_586_2 + var_586_3 + arg_586_0 then
				local var_586_6 = Color.New(0, 0, 0)

				var_586_6.a = 1
				arg_583_1.mask_.color = var_586_6
			end

			local var_586_7 = 2

			if var_586_7 < arg_583_1.time_ and arg_583_1.time_ <= var_586_7 + arg_586_0 then
				arg_583_1.mask_.enabled = true
				arg_583_1.mask_.raycastTarget = true

				arg_583_1:SetGaussion(false)
			end

			local var_586_8 = 2

			if var_586_7 <= arg_583_1.time_ and arg_583_1.time_ < var_586_7 + var_586_8 then
				local var_586_9 = (arg_583_1.time_ - var_586_7) / var_586_8
				local var_586_10 = Color.New(0, 0, 0)

				var_586_10.a = Mathf.Lerp(1, 0, var_586_9)
				arg_583_1.mask_.color = var_586_10
			end

			if arg_583_1.time_ >= var_586_7 + var_586_8 and arg_583_1.time_ < var_586_7 + var_586_8 + arg_586_0 then
				local var_586_11 = Color.New(0, 0, 0)
				local var_586_12 = 0

				arg_583_1.mask_.enabled = false
				var_586_11.a = var_586_12
				arg_583_1.mask_.color = var_586_11
			end

			local var_586_13 = arg_583_1.actors_["1011ui_story"].transform
			local var_586_14 = 2

			if var_586_14 < arg_583_1.time_ and arg_583_1.time_ <= var_586_14 + arg_586_0 then
				arg_583_1.var_.moveOldPos1011ui_story = var_586_13.localPosition
			end

			local var_586_15 = 0.001

			if var_586_14 <= arg_583_1.time_ and arg_583_1.time_ < var_586_14 + var_586_15 then
				local var_586_16 = (arg_583_1.time_ - var_586_14) / var_586_15
				local var_586_17 = Vector3.New(0, 100, 0)

				var_586_13.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos1011ui_story, var_586_17, var_586_16)

				local var_586_18 = manager.ui.mainCamera.transform.position - var_586_13.position

				var_586_13.forward = Vector3.New(var_586_18.x, var_586_18.y, var_586_18.z)

				local var_586_19 = var_586_13.localEulerAngles

				var_586_19.z = 0
				var_586_19.x = 0
				var_586_13.localEulerAngles = var_586_19
			end

			if arg_583_1.time_ >= var_586_14 + var_586_15 and arg_583_1.time_ < var_586_14 + var_586_15 + arg_586_0 then
				var_586_13.localPosition = Vector3.New(0, 100, 0)

				local var_586_20 = manager.ui.mainCamera.transform.position - var_586_13.position

				var_586_13.forward = Vector3.New(var_586_20.x, var_586_20.y, var_586_20.z)

				local var_586_21 = var_586_13.localEulerAngles

				var_586_21.z = 0
				var_586_21.x = 0
				var_586_13.localEulerAngles = var_586_21
			end

			local var_586_22 = 2

			if var_586_22 < arg_583_1.time_ and arg_583_1.time_ <= var_586_22 + arg_586_0 then
				arg_583_1.screenFilterGo_:SetActive(false)
			end

			local var_586_23 = 0.0166666666666667

			if var_586_22 <= arg_583_1.time_ and arg_583_1.time_ < var_586_22 + var_586_23 then
				local var_586_24 = (arg_583_1.time_ - var_586_22) / var_586_23

				arg_583_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_586_24)
			end

			if arg_583_1.time_ >= var_586_22 + var_586_23 and arg_583_1.time_ < var_586_22 + var_586_23 + arg_586_0 then
				arg_583_1.screenFilterEffect_.weight = 0
			end

			local var_586_25 = arg_583_1.bgs_.R1102a.transform
			local var_586_26 = 2

			if var_586_26 < arg_583_1.time_ and arg_583_1.time_ <= var_586_26 + arg_586_0 then
				arg_583_1.var_.moveOldPosR1102a = var_586_25.localPosition
			end

			local var_586_27 = 0.001

			if var_586_26 <= arg_583_1.time_ and arg_583_1.time_ < var_586_26 + var_586_27 then
				local var_586_28 = (arg_583_1.time_ - var_586_26) / var_586_27
				local var_586_29 = Vector3.New(0.4, -1.1, 2)

				var_586_25.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPosR1102a, var_586_29, var_586_28)
			end

			if arg_583_1.time_ >= var_586_26 + var_586_27 and arg_583_1.time_ < var_586_26 + var_586_27 + arg_586_0 then
				var_586_25.localPosition = Vector3.New(0.4, -1.1, 2)
			end
		end
	end,
	Play1101106140 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 1101106140
		arg_587_1.duration_ = 4.433

		local var_587_0 = {
			zh = 3.433,
			ja = 4.433
		}
		local var_587_1 = manager.audio:GetLocalizationFlag()

		if var_587_0[var_587_1] ~= nil then
			arg_587_1.duration_ = var_587_0[var_587_1]
		end

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play1101106141(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = 0
			local var_590_1 = 0.175

			if var_590_0 < arg_587_1.time_ and arg_587_1.time_ <= var_590_0 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_2 = arg_587_1:FormatText(StoryNameCfg[37].name)

				arg_587_1.leftNameTxt_.text = var_590_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_3 = arg_587_1:GetWordFromCfg(1101106140)
				local var_590_4 = arg_587_1:FormatText(var_590_3.content)

				arg_587_1.text_.text = var_590_4

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_5 = 7
				local var_590_6 = utf8.len(var_590_4)
				local var_590_7 = var_590_5 <= 0 and var_590_1 or var_590_1 * (var_590_6 / var_590_5)

				if var_590_7 > 0 and var_590_1 < var_590_7 then
					arg_587_1.talkMaxDuration = var_590_7

					if var_590_7 + var_590_0 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_7 + var_590_0
					end
				end

				arg_587_1.text_.text = var_590_4
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb") ~= 0 then
					local var_590_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb") / 1000

					if var_590_8 + var_590_0 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_8 + var_590_0
					end

					if var_590_3.prefab_name ~= "" and arg_587_1.actors_[var_590_3.prefab_name] ~= nil then
						local var_590_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_587_1.actors_[var_590_3.prefab_name].transform, "story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb")

						arg_587_1:RecordAudio("1101106140", var_590_9)
						arg_587_1:RecordAudio("1101106140", var_590_9)
					else
						arg_587_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb")
					end

					arg_587_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106140", "story_v_side_new_1101106.awb")
				end

				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_10 = math.max(var_590_1, arg_587_1.talkMaxDuration)

			if var_590_0 <= arg_587_1.time_ and arg_587_1.time_ < var_590_0 + var_590_10 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_0) / var_590_10

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_0 + var_590_10 and arg_587_1.time_ < var_590_0 + var_590_10 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106141 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 1101106141
		arg_591_1.duration_ = 5

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play1101106142(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = 0
			local var_594_1 = 0.05

			if var_594_0 < arg_591_1.time_ and arg_591_1.time_ <= var_594_0 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, false)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_2 = arg_591_1:GetWordFromCfg(1101106141)
				local var_594_3 = arg_591_1:FormatText(var_594_2.content)

				arg_591_1.text_.text = var_594_3

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_4 = 2
				local var_594_5 = utf8.len(var_594_3)
				local var_594_6 = var_594_4 <= 0 and var_594_1 or var_594_1 * (var_594_5 / var_594_4)

				if var_594_6 > 0 and var_594_1 < var_594_6 then
					arg_591_1.talkMaxDuration = var_594_6

					if var_594_6 + var_594_0 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_6 + var_594_0
					end
				end

				arg_591_1.text_.text = var_594_3
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)
				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_7 = math.max(var_594_1, arg_591_1.talkMaxDuration)

			if var_594_0 <= arg_591_1.time_ and arg_591_1.time_ < var_594_0 + var_594_7 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_0) / var_594_7

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_0 + var_594_7 and arg_591_1.time_ < var_594_0 + var_594_7 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106142 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 1101106142
		arg_595_1.duration_ = 5

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play1101106143(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = 0
			local var_598_1 = 0.675

			if var_598_0 < arg_595_1.time_ and arg_595_1.time_ <= var_598_0 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, false)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_2 = arg_595_1:GetWordFromCfg(1101106142)
				local var_598_3 = arg_595_1:FormatText(var_598_2.content)

				arg_595_1.text_.text = var_598_3

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_4 = 27
				local var_598_5 = utf8.len(var_598_3)
				local var_598_6 = var_598_4 <= 0 and var_598_1 or var_598_1 * (var_598_5 / var_598_4)

				if var_598_6 > 0 and var_598_1 < var_598_6 then
					arg_595_1.talkMaxDuration = var_598_6

					if var_598_6 + var_598_0 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_6 + var_598_0
					end
				end

				arg_595_1.text_.text = var_598_3
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)
				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_7 = math.max(var_598_1, arg_595_1.talkMaxDuration)

			if var_598_0 <= arg_595_1.time_ and arg_595_1.time_ < var_598_0 + var_598_7 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_0) / var_598_7

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_0 + var_598_7 and arg_595_1.time_ < var_598_0 + var_598_7 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106143 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 1101106143
		arg_599_1.duration_ = 5

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play1101106144(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = 0
			local var_602_1 = 0.925

			if var_602_0 < arg_599_1.time_ and arg_599_1.time_ <= var_602_0 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_2 = arg_599_1:FormatText(StoryNameCfg[7].name)

				arg_599_1.leftNameTxt_.text = var_602_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_3 = arg_599_1:GetWordFromCfg(1101106143)
				local var_602_4 = arg_599_1:FormatText(var_602_3.content)

				arg_599_1.text_.text = var_602_4

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_5 = 37
				local var_602_6 = utf8.len(var_602_4)
				local var_602_7 = var_602_5 <= 0 and var_602_1 or var_602_1 * (var_602_6 / var_602_5)

				if var_602_7 > 0 and var_602_1 < var_602_7 then
					arg_599_1.talkMaxDuration = var_602_7

					if var_602_7 + var_602_0 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_7 + var_602_0
					end
				end

				arg_599_1.text_.text = var_602_4
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)
				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_8 = math.max(var_602_1, arg_599_1.talkMaxDuration)

			if var_602_0 <= arg_599_1.time_ and arg_599_1.time_ < var_602_0 + var_602_8 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_0) / var_602_8

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_0 + var_602_8 and arg_599_1.time_ < var_602_0 + var_602_8 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106144 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 1101106144
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play1101106145(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 0.675

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, false)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_2 = arg_603_1:GetWordFromCfg(1101106144)
				local var_606_3 = arg_603_1:FormatText(var_606_2.content)

				arg_603_1.text_.text = var_606_3

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_4 = 27
				local var_606_5 = utf8.len(var_606_3)
				local var_606_6 = var_606_4 <= 0 and var_606_1 or var_606_1 * (var_606_5 / var_606_4)

				if var_606_6 > 0 and var_606_1 < var_606_6 then
					arg_603_1.talkMaxDuration = var_606_6

					if var_606_6 + var_606_0 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_6 + var_606_0
					end
				end

				arg_603_1.text_.text = var_606_3
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_7 = math.max(var_606_1, arg_603_1.talkMaxDuration)

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_7 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_0) / var_606_7

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_0 + var_606_7 and arg_603_1.time_ < var_606_0 + var_606_7 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106145 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 1101106145
		arg_607_1.duration_ = 5

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play1101106146(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = 0
			local var_610_1 = 0.05

			if var_610_0 < arg_607_1.time_ and arg_607_1.time_ <= var_610_0 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, false)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_2 = arg_607_1:GetWordFromCfg(1101106145)
				local var_610_3 = arg_607_1:FormatText(var_610_2.content)

				arg_607_1.text_.text = var_610_3

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_4 = 2
				local var_610_5 = utf8.len(var_610_3)
				local var_610_6 = var_610_4 <= 0 and var_610_1 or var_610_1 * (var_610_5 / var_610_4)

				if var_610_6 > 0 and var_610_1 < var_610_6 then
					arg_607_1.talkMaxDuration = var_610_6

					if var_610_6 + var_610_0 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_6 + var_610_0
					end
				end

				arg_607_1.text_.text = var_610_3
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)
				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_7 = math.max(var_610_1, arg_607_1.talkMaxDuration)

			if var_610_0 <= arg_607_1.time_ and arg_607_1.time_ < var_610_0 + var_610_7 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_0) / var_610_7

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_0 + var_610_7 and arg_607_1.time_ < var_610_0 + var_610_7 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106146 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 1101106146
		arg_611_1.duration_ = 5

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play1101106147(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = 0
			local var_614_1 = 0.55

			if var_614_0 < arg_611_1.time_ and arg_611_1.time_ <= var_614_0 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, false)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_2 = arg_611_1:GetWordFromCfg(1101106146)
				local var_614_3 = arg_611_1:FormatText(var_614_2.content)

				arg_611_1.text_.text = var_614_3

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_4 = 22
				local var_614_5 = utf8.len(var_614_3)
				local var_614_6 = var_614_4 <= 0 and var_614_1 or var_614_1 * (var_614_5 / var_614_4)

				if var_614_6 > 0 and var_614_1 < var_614_6 then
					arg_611_1.talkMaxDuration = var_614_6

					if var_614_6 + var_614_0 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_6 + var_614_0
					end
				end

				arg_611_1.text_.text = var_614_3
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_7 = math.max(var_614_1, arg_611_1.talkMaxDuration)

			if var_614_0 <= arg_611_1.time_ and arg_611_1.time_ < var_614_0 + var_614_7 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_0) / var_614_7

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_0 + var_614_7 and arg_611_1.time_ < var_614_0 + var_614_7 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106147 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 1101106147
		arg_615_1.duration_ = 2.933

		local var_615_0 = {
			zh = 2.933,
			ja = 1.9
		}
		local var_615_1 = manager.audio:GetLocalizationFlag()

		if var_615_0[var_615_1] ~= nil then
			arg_615_1.duration_ = var_615_0[var_615_1]
		end

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play1101106148(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0
			local var_618_1 = 0.35

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0

				arg_615_1.dialog_:SetActive(true)

				local var_618_2 = LeanTween.value(arg_615_1.dialog_, 0, 1, 0.3)

				var_618_2:setOnUpdate(LuaHelper.FloatAction(function(arg_619_0)
					arg_615_1.dialogCg_.alpha = arg_619_0
				end))
				var_618_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_615_1.dialog_)
					var_618_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_615_1.duration_ = arg_615_1.duration_ + 0.3

				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_3 = arg_615_1:FormatText(StoryNameCfg[37].name)

				arg_615_1.leftNameTxt_.text = var_618_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_4 = arg_615_1:GetWordFromCfg(1101106147)
				local var_618_5 = arg_615_1:FormatText(var_618_4.content)

				arg_615_1.text_.text = var_618_5

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_6 = 14
				local var_618_7 = utf8.len(var_618_5)
				local var_618_8 = var_618_6 <= 0 and var_618_1 or var_618_1 * (var_618_7 / var_618_6)

				if var_618_8 > 0 and var_618_1 < var_618_8 then
					arg_615_1.talkMaxDuration = var_618_8
					var_618_0 = var_618_0 + 0.3

					if var_618_8 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_8 + var_618_0
					end
				end

				arg_615_1.text_.text = var_618_5
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb") ~= 0 then
					local var_618_9 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb") / 1000

					if var_618_9 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_9 + var_618_0
					end

					if var_618_4.prefab_name ~= "" and arg_615_1.actors_[var_618_4.prefab_name] ~= nil then
						local var_618_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_4.prefab_name].transform, "story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb")

						arg_615_1:RecordAudio("1101106147", var_618_10)
						arg_615_1:RecordAudio("1101106147", var_618_10)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106147", "story_v_side_new_1101106.awb")
				end

				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_11 = var_618_0 + 0.3
			local var_618_12 = math.max(var_618_1, arg_615_1.talkMaxDuration)

			if var_618_11 <= arg_615_1.time_ and arg_615_1.time_ < var_618_11 + var_618_12 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_11) / var_618_12

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_11 + var_618_12 and arg_615_1.time_ < var_618_11 + var_618_12 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106148 = function(arg_621_0, arg_621_1)
		arg_621_1.time_ = 0
		arg_621_1.frameCnt_ = 0
		arg_621_1.state_ = "playing"
		arg_621_1.curTalkId_ = 1101106148
		arg_621_1.duration_ = 5

		SetActive(arg_621_1.tipsGo_, false)

		function arg_621_1.onSingleLineFinish_()
			arg_621_1.onSingleLineUpdate_ = nil
			arg_621_1.onSingleLineFinish_ = nil
			arg_621_1.state_ = "waiting"
		end

		function arg_621_1.playNext_(arg_623_0)
			if arg_623_0 == 1 then
				arg_621_0:Play1101106149(arg_621_1)
			end
		end

		function arg_621_1.onSingleLineUpdate_(arg_624_0)
			local var_624_0 = 0
			local var_624_1 = 0.15

			if var_624_0 < arg_621_1.time_ and arg_621_1.time_ <= var_624_0 + arg_624_0 then
				arg_621_1.talkMaxDuration = 0
				arg_621_1.dialogCg_.alpha = 1

				arg_621_1.dialog_:SetActive(true)
				SetActive(arg_621_1.leftNameGo_, false)

				arg_621_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_621_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_621_1:RecordName(arg_621_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_621_1.iconTrs_.gameObject, false)
				arg_621_1.callingController_:SetSelectedState("normal")

				local var_624_2 = arg_621_1:GetWordFromCfg(1101106148)
				local var_624_3 = arg_621_1:FormatText(var_624_2.content)

				arg_621_1.text_.text = var_624_3

				LuaForUtil.ClearLinePrefixSymbol(arg_621_1.text_)

				local var_624_4 = 9
				local var_624_5 = utf8.len(var_624_3)
				local var_624_6 = var_624_4 <= 0 and var_624_1 or var_624_1 * (var_624_5 / var_624_4)

				if var_624_6 > 0 and var_624_1 < var_624_6 then
					arg_621_1.talkMaxDuration = var_624_6

					if var_624_6 + var_624_0 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_6 + var_624_0
					end
				end

				arg_621_1.text_.text = var_624_3
				arg_621_1.typewritter.percent = 0

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(false)
				arg_621_1:RecordContent(arg_621_1.text_.text)
			end

			local var_624_7 = math.max(var_624_1, arg_621_1.talkMaxDuration)

			if var_624_0 <= arg_621_1.time_ and arg_621_1.time_ < var_624_0 + var_624_7 then
				arg_621_1.typewritter.percent = (arg_621_1.time_ - var_624_0) / var_624_7

				arg_621_1.typewritter:SetDirty()
			end

			if arg_621_1.time_ >= var_624_0 + var_624_7 and arg_621_1.time_ < var_624_0 + var_624_7 + arg_624_0 then
				arg_621_1.typewritter.percent = 1

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106149 = function(arg_625_0, arg_625_1)
		arg_625_1.time_ = 0
		arg_625_1.frameCnt_ = 0
		arg_625_1.state_ = "playing"
		arg_625_1.curTalkId_ = 1101106149
		arg_625_1.duration_ = 3.4

		local var_625_0 = {
			zh = 3.4,
			ja = 2.5
		}
		local var_625_1 = manager.audio:GetLocalizationFlag()

		if var_625_0[var_625_1] ~= nil then
			arg_625_1.duration_ = var_625_0[var_625_1]
		end

		SetActive(arg_625_1.tipsGo_, false)

		function arg_625_1.onSingleLineFinish_()
			arg_625_1.onSingleLineUpdate_ = nil
			arg_625_1.onSingleLineFinish_ = nil
			arg_625_1.state_ = "waiting"
		end

		function arg_625_1.playNext_(arg_627_0)
			if arg_627_0 == 1 then
				arg_625_0:Play1101106150(arg_625_1)
			end
		end

		function arg_625_1.onSingleLineUpdate_(arg_628_0)
			local var_628_0 = 0
			local var_628_1 = 0.325

			if var_628_0 < arg_625_1.time_ and arg_625_1.time_ <= var_628_0 + arg_628_0 then
				arg_625_1.talkMaxDuration = 0
				arg_625_1.dialogCg_.alpha = 1

				arg_625_1.dialog_:SetActive(true)
				SetActive(arg_625_1.leftNameGo_, true)

				local var_628_2 = arg_625_1:FormatText(StoryNameCfg[37].name)

				arg_625_1.leftNameTxt_.text = var_628_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_625_1.leftNameTxt_.transform)

				arg_625_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_625_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_625_1:RecordName(arg_625_1.leftNameTxt_.text)
				SetActive(arg_625_1.iconTrs_.gameObject, false)
				arg_625_1.callingController_:SetSelectedState("normal")

				local var_628_3 = arg_625_1:GetWordFromCfg(1101106149)
				local var_628_4 = arg_625_1:FormatText(var_628_3.content)

				arg_625_1.text_.text = var_628_4

				LuaForUtil.ClearLinePrefixSymbol(arg_625_1.text_)

				local var_628_5 = 13
				local var_628_6 = utf8.len(var_628_4)
				local var_628_7 = var_628_5 <= 0 and var_628_1 or var_628_1 * (var_628_6 / var_628_5)

				if var_628_7 > 0 and var_628_1 < var_628_7 then
					arg_625_1.talkMaxDuration = var_628_7

					if var_628_7 + var_628_0 > arg_625_1.duration_ then
						arg_625_1.duration_ = var_628_7 + var_628_0
					end
				end

				arg_625_1.text_.text = var_628_4
				arg_625_1.typewritter.percent = 0

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb") ~= 0 then
					local var_628_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb") / 1000

					if var_628_8 + var_628_0 > arg_625_1.duration_ then
						arg_625_1.duration_ = var_628_8 + var_628_0
					end

					if var_628_3.prefab_name ~= "" and arg_625_1.actors_[var_628_3.prefab_name] ~= nil then
						local var_628_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_625_1.actors_[var_628_3.prefab_name].transform, "story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb")

						arg_625_1:RecordAudio("1101106149", var_628_9)
						arg_625_1:RecordAudio("1101106149", var_628_9)
					else
						arg_625_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb")
					end

					arg_625_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106149", "story_v_side_new_1101106.awb")
				end

				arg_625_1:RecordContent(arg_625_1.text_.text)
			end

			local var_628_10 = math.max(var_628_1, arg_625_1.talkMaxDuration)

			if var_628_0 <= arg_625_1.time_ and arg_625_1.time_ < var_628_0 + var_628_10 then
				arg_625_1.typewritter.percent = (arg_625_1.time_ - var_628_0) / var_628_10

				arg_625_1.typewritter:SetDirty()
			end

			if arg_625_1.time_ >= var_628_0 + var_628_10 and arg_625_1.time_ < var_628_0 + var_628_10 + arg_628_0 then
				arg_625_1.typewritter.percent = 1

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106150 = function(arg_629_0, arg_629_1)
		arg_629_1.time_ = 0
		arg_629_1.frameCnt_ = 0
		arg_629_1.state_ = "playing"
		arg_629_1.curTalkId_ = 1101106150
		arg_629_1.duration_ = 5

		SetActive(arg_629_1.tipsGo_, false)

		function arg_629_1.onSingleLineFinish_()
			arg_629_1.onSingleLineUpdate_ = nil
			arg_629_1.onSingleLineFinish_ = nil
			arg_629_1.state_ = "waiting"
		end

		function arg_629_1.playNext_(arg_631_0)
			if arg_631_0 == 1 then
				arg_629_0:Play1101106151(arg_629_1)
			end
		end

		function arg_629_1.onSingleLineUpdate_(arg_632_0)
			local var_632_0 = 0
			local var_632_1 = 0.225

			if var_632_0 < arg_629_1.time_ and arg_629_1.time_ <= var_632_0 + arg_632_0 then
				arg_629_1.talkMaxDuration = 0
				arg_629_1.dialogCg_.alpha = 1

				arg_629_1.dialog_:SetActive(true)
				SetActive(arg_629_1.leftNameGo_, false)

				arg_629_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_629_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_629_1:RecordName(arg_629_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_629_1.iconTrs_.gameObject, false)
				arg_629_1.callingController_:SetSelectedState("normal")

				local var_632_2 = arg_629_1:GetWordFromCfg(1101106150)
				local var_632_3 = arg_629_1:FormatText(var_632_2.content)

				arg_629_1.text_.text = var_632_3

				LuaForUtil.ClearLinePrefixSymbol(arg_629_1.text_)

				local var_632_4 = 6
				local var_632_5 = utf8.len(var_632_3)
				local var_632_6 = var_632_4 <= 0 and var_632_1 or var_632_1 * (var_632_5 / var_632_4)

				if var_632_6 > 0 and var_632_1 < var_632_6 then
					arg_629_1.talkMaxDuration = var_632_6

					if var_632_6 + var_632_0 > arg_629_1.duration_ then
						arg_629_1.duration_ = var_632_6 + var_632_0
					end
				end

				arg_629_1.text_.text = var_632_3
				arg_629_1.typewritter.percent = 0

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(false)
				arg_629_1:RecordContent(arg_629_1.text_.text)
			end

			local var_632_7 = math.max(var_632_1, arg_629_1.talkMaxDuration)

			if var_632_0 <= arg_629_1.time_ and arg_629_1.time_ < var_632_0 + var_632_7 then
				arg_629_1.typewritter.percent = (arg_629_1.time_ - var_632_0) / var_632_7

				arg_629_1.typewritter:SetDirty()
			end

			if arg_629_1.time_ >= var_632_0 + var_632_7 and arg_629_1.time_ < var_632_0 + var_632_7 + arg_632_0 then
				arg_629_1.typewritter.percent = 1

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106151 = function(arg_633_0, arg_633_1)
		arg_633_1.time_ = 0
		arg_633_1.frameCnt_ = 0
		arg_633_1.state_ = "playing"
		arg_633_1.curTalkId_ = 1101106151
		arg_633_1.duration_ = 2.833

		local var_633_0 = {
			zh = 1.6,
			ja = 2.833
		}
		local var_633_1 = manager.audio:GetLocalizationFlag()

		if var_633_0[var_633_1] ~= nil then
			arg_633_1.duration_ = var_633_0[var_633_1]
		end

		SetActive(arg_633_1.tipsGo_, false)

		function arg_633_1.onSingleLineFinish_()
			arg_633_1.onSingleLineUpdate_ = nil
			arg_633_1.onSingleLineFinish_ = nil
			arg_633_1.state_ = "waiting"
		end

		function arg_633_1.playNext_(arg_635_0)
			if arg_635_0 == 1 then
				arg_633_0:Play1101106152(arg_633_1)
			end
		end

		function arg_633_1.onSingleLineUpdate_(arg_636_0)
			local var_636_0 = 0
			local var_636_1 = 0.325

			if var_636_0 < arg_633_1.time_ and arg_633_1.time_ <= var_636_0 + arg_636_0 then
				arg_633_1.talkMaxDuration = 0
				arg_633_1.dialogCg_.alpha = 1

				arg_633_1.dialog_:SetActive(true)
				SetActive(arg_633_1.leftNameGo_, true)

				local var_636_2 = arg_633_1:FormatText(StoryNameCfg[37].name)

				arg_633_1.leftNameTxt_.text = var_636_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_633_1.leftNameTxt_.transform)

				arg_633_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_633_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_633_1:RecordName(arg_633_1.leftNameTxt_.text)
				SetActive(arg_633_1.iconTrs_.gameObject, false)
				arg_633_1.callingController_:SetSelectedState("normal")

				local var_636_3 = arg_633_1:GetWordFromCfg(1101106151)
				local var_636_4 = arg_633_1:FormatText(var_636_3.content)

				arg_633_1.text_.text = var_636_4

				LuaForUtil.ClearLinePrefixSymbol(arg_633_1.text_)

				local var_636_5 = 13
				local var_636_6 = utf8.len(var_636_4)
				local var_636_7 = var_636_5 <= 0 and var_636_1 or var_636_1 * (var_636_6 / var_636_5)

				if var_636_7 > 0 and var_636_1 < var_636_7 then
					arg_633_1.talkMaxDuration = var_636_7

					if var_636_7 + var_636_0 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_7 + var_636_0
					end
				end

				arg_633_1.text_.text = var_636_4
				arg_633_1.typewritter.percent = 0

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb") ~= 0 then
					local var_636_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb") / 1000

					if var_636_8 + var_636_0 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_8 + var_636_0
					end

					if var_636_3.prefab_name ~= "" and arg_633_1.actors_[var_636_3.prefab_name] ~= nil then
						local var_636_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_633_1.actors_[var_636_3.prefab_name].transform, "story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb")

						arg_633_1:RecordAudio("1101106151", var_636_9)
						arg_633_1:RecordAudio("1101106151", var_636_9)
					else
						arg_633_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb")
					end

					arg_633_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106151", "story_v_side_new_1101106.awb")
				end

				arg_633_1:RecordContent(arg_633_1.text_.text)
			end

			local var_636_10 = math.max(var_636_1, arg_633_1.talkMaxDuration)

			if var_636_0 <= arg_633_1.time_ and arg_633_1.time_ < var_636_0 + var_636_10 then
				arg_633_1.typewritter.percent = (arg_633_1.time_ - var_636_0) / var_636_10

				arg_633_1.typewritter:SetDirty()
			end

			if arg_633_1.time_ >= var_636_0 + var_636_10 and arg_633_1.time_ < var_636_0 + var_636_10 + arg_636_0 then
				arg_633_1.typewritter.percent = 1

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106152 = function(arg_637_0, arg_637_1)
		arg_637_1.time_ = 0
		arg_637_1.frameCnt_ = 0
		arg_637_1.state_ = "playing"
		arg_637_1.curTalkId_ = 1101106152
		arg_637_1.duration_ = 1.433

		local var_637_0 = {
			zh = 1.433,
			ja = 1.4
		}
		local var_637_1 = manager.audio:GetLocalizationFlag()

		if var_637_0[var_637_1] ~= nil then
			arg_637_1.duration_ = var_637_0[var_637_1]
		end

		SetActive(arg_637_1.tipsGo_, false)

		function arg_637_1.onSingleLineFinish_()
			arg_637_1.onSingleLineUpdate_ = nil
			arg_637_1.onSingleLineFinish_ = nil
			arg_637_1.state_ = "waiting"
		end

		function arg_637_1.playNext_(arg_639_0)
			if arg_639_0 == 1 then
				arg_637_0:Play1101106153(arg_637_1)
			end
		end

		function arg_637_1.onSingleLineUpdate_(arg_640_0)
			local var_640_0 = 0
			local var_640_1 = 0.075

			if var_640_0 < arg_637_1.time_ and arg_637_1.time_ <= var_640_0 + arg_640_0 then
				arg_637_1.talkMaxDuration = 0
				arg_637_1.dialogCg_.alpha = 1

				arg_637_1.dialog_:SetActive(true)
				SetActive(arg_637_1.leftNameGo_, true)

				local var_640_2 = arg_637_1:FormatText(StoryNameCfg[37].name)

				arg_637_1.leftNameTxt_.text = var_640_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_637_1.leftNameTxt_.transform)

				arg_637_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_637_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_637_1:RecordName(arg_637_1.leftNameTxt_.text)
				SetActive(arg_637_1.iconTrs_.gameObject, false)
				arg_637_1.callingController_:SetSelectedState("normal")

				local var_640_3 = arg_637_1:GetWordFromCfg(1101106152)
				local var_640_4 = arg_637_1:FormatText(var_640_3.content)

				arg_637_1.text_.text = var_640_4

				LuaForUtil.ClearLinePrefixSymbol(arg_637_1.text_)

				local var_640_5 = 3
				local var_640_6 = utf8.len(var_640_4)
				local var_640_7 = var_640_5 <= 0 and var_640_1 or var_640_1 * (var_640_6 / var_640_5)

				if var_640_7 > 0 and var_640_1 < var_640_7 then
					arg_637_1.talkMaxDuration = var_640_7

					if var_640_7 + var_640_0 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_7 + var_640_0
					end
				end

				arg_637_1.text_.text = var_640_4
				arg_637_1.typewritter.percent = 0

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb") ~= 0 then
					local var_640_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb") / 1000

					if var_640_8 + var_640_0 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_8 + var_640_0
					end

					if var_640_3.prefab_name ~= "" and arg_637_1.actors_[var_640_3.prefab_name] ~= nil then
						local var_640_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_637_1.actors_[var_640_3.prefab_name].transform, "story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb")

						arg_637_1:RecordAudio("1101106152", var_640_9)
						arg_637_1:RecordAudio("1101106152", var_640_9)
					else
						arg_637_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb")
					end

					arg_637_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106152", "story_v_side_new_1101106.awb")
				end

				arg_637_1:RecordContent(arg_637_1.text_.text)
			end

			local var_640_10 = math.max(var_640_1, arg_637_1.talkMaxDuration)

			if var_640_0 <= arg_637_1.time_ and arg_637_1.time_ < var_640_0 + var_640_10 then
				arg_637_1.typewritter.percent = (arg_637_1.time_ - var_640_0) / var_640_10

				arg_637_1.typewritter:SetDirty()
			end

			if arg_637_1.time_ >= var_640_0 + var_640_10 and arg_637_1.time_ < var_640_0 + var_640_10 + arg_640_0 then
				arg_637_1.typewritter.percent = 1

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106153 = function(arg_641_0, arg_641_1)
		arg_641_1.time_ = 0
		arg_641_1.frameCnt_ = 0
		arg_641_1.state_ = "playing"
		arg_641_1.curTalkId_ = 1101106153
		arg_641_1.duration_ = 5

		SetActive(arg_641_1.tipsGo_, false)

		function arg_641_1.onSingleLineFinish_()
			arg_641_1.onSingleLineUpdate_ = nil
			arg_641_1.onSingleLineFinish_ = nil
			arg_641_1.state_ = "waiting"
		end

		function arg_641_1.playNext_(arg_643_0)
			if arg_643_0 == 1 then
				arg_641_0:Play1101106154(arg_641_1)
			end
		end

		function arg_641_1.onSingleLineUpdate_(arg_644_0)
			local var_644_0 = 0
			local var_644_1 = 0.2

			if var_644_0 < arg_641_1.time_ and arg_641_1.time_ <= var_644_0 + arg_644_0 then
				arg_641_1.talkMaxDuration = 0
				arg_641_1.dialogCg_.alpha = 1

				arg_641_1.dialog_:SetActive(true)
				SetActive(arg_641_1.leftNameGo_, true)

				local var_644_2 = arg_641_1:FormatText(StoryNameCfg[7].name)

				arg_641_1.leftNameTxt_.text = var_644_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_641_1.leftNameTxt_.transform)

				arg_641_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_641_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_641_1:RecordName(arg_641_1.leftNameTxt_.text)
				SetActive(arg_641_1.iconTrs_.gameObject, false)
				arg_641_1.callingController_:SetSelectedState("normal")

				local var_644_3 = arg_641_1:GetWordFromCfg(1101106153)
				local var_644_4 = arg_641_1:FormatText(var_644_3.content)

				arg_641_1.text_.text = var_644_4

				LuaForUtil.ClearLinePrefixSymbol(arg_641_1.text_)

				local var_644_5 = 8
				local var_644_6 = utf8.len(var_644_4)
				local var_644_7 = var_644_5 <= 0 and var_644_1 or var_644_1 * (var_644_6 / var_644_5)

				if var_644_7 > 0 and var_644_1 < var_644_7 then
					arg_641_1.talkMaxDuration = var_644_7

					if var_644_7 + var_644_0 > arg_641_1.duration_ then
						arg_641_1.duration_ = var_644_7 + var_644_0
					end
				end

				arg_641_1.text_.text = var_644_4
				arg_641_1.typewritter.percent = 0

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(false)
				arg_641_1:RecordContent(arg_641_1.text_.text)
			end

			local var_644_8 = math.max(var_644_1, arg_641_1.talkMaxDuration)

			if var_644_0 <= arg_641_1.time_ and arg_641_1.time_ < var_644_0 + var_644_8 then
				arg_641_1.typewritter.percent = (arg_641_1.time_ - var_644_0) / var_644_8

				arg_641_1.typewritter:SetDirty()
			end

			if arg_641_1.time_ >= var_644_0 + var_644_8 and arg_641_1.time_ < var_644_0 + var_644_8 + arg_644_0 then
				arg_641_1.typewritter.percent = 1

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106154 = function(arg_645_0, arg_645_1)
		arg_645_1.time_ = 0
		arg_645_1.frameCnt_ = 0
		arg_645_1.state_ = "playing"
		arg_645_1.curTalkId_ = 1101106154
		arg_645_1.duration_ = 5

		SetActive(arg_645_1.tipsGo_, false)

		function arg_645_1.onSingleLineFinish_()
			arg_645_1.onSingleLineUpdate_ = nil
			arg_645_1.onSingleLineFinish_ = nil
			arg_645_1.state_ = "waiting"
		end

		function arg_645_1.playNext_(arg_647_0)
			if arg_647_0 == 1 then
				arg_645_0:Play1101106155(arg_645_1)
			end
		end

		function arg_645_1.onSingleLineUpdate_(arg_648_0)
			local var_648_0 = 0
			local var_648_1 = 0.7

			if var_648_0 < arg_645_1.time_ and arg_645_1.time_ <= var_648_0 + arg_648_0 then
				arg_645_1.talkMaxDuration = 0
				arg_645_1.dialogCg_.alpha = 1

				arg_645_1.dialog_:SetActive(true)
				SetActive(arg_645_1.leftNameGo_, false)

				arg_645_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_645_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_645_1:RecordName(arg_645_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_645_1.iconTrs_.gameObject, false)
				arg_645_1.callingController_:SetSelectedState("normal")

				local var_648_2 = arg_645_1:GetWordFromCfg(1101106154)
				local var_648_3 = arg_645_1:FormatText(var_648_2.content)

				arg_645_1.text_.text = var_648_3

				LuaForUtil.ClearLinePrefixSymbol(arg_645_1.text_)

				local var_648_4 = 40
				local var_648_5 = utf8.len(var_648_3)
				local var_648_6 = var_648_4 <= 0 and var_648_1 or var_648_1 * (var_648_5 / var_648_4)

				if var_648_6 > 0 and var_648_1 < var_648_6 then
					arg_645_1.talkMaxDuration = var_648_6

					if var_648_6 + var_648_0 > arg_645_1.duration_ then
						arg_645_1.duration_ = var_648_6 + var_648_0
					end
				end

				arg_645_1.text_.text = var_648_3
				arg_645_1.typewritter.percent = 0

				arg_645_1.typewritter:SetDirty()
				arg_645_1:ShowNextGo(false)
				arg_645_1:RecordContent(arg_645_1.text_.text)
			end

			local var_648_7 = math.max(var_648_1, arg_645_1.talkMaxDuration)

			if var_648_0 <= arg_645_1.time_ and arg_645_1.time_ < var_648_0 + var_648_7 then
				arg_645_1.typewritter.percent = (arg_645_1.time_ - var_648_0) / var_648_7

				arg_645_1.typewritter:SetDirty()
			end

			if arg_645_1.time_ >= var_648_0 + var_648_7 and arg_645_1.time_ < var_648_0 + var_648_7 + arg_648_0 then
				arg_645_1.typewritter.percent = 1

				arg_645_1.typewritter:SetDirty()
				arg_645_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106155 = function(arg_649_0, arg_649_1)
		arg_649_1.time_ = 0
		arg_649_1.frameCnt_ = 0
		arg_649_1.state_ = "playing"
		arg_649_1.curTalkId_ = 1101106155
		arg_649_1.duration_ = 3.5

		local var_649_0 = {
			zh = 3.5,
			ja = 1.8
		}
		local var_649_1 = manager.audio:GetLocalizationFlag()

		if var_649_0[var_649_1] ~= nil then
			arg_649_1.duration_ = var_649_0[var_649_1]
		end

		SetActive(arg_649_1.tipsGo_, false)

		function arg_649_1.onSingleLineFinish_()
			arg_649_1.onSingleLineUpdate_ = nil
			arg_649_1.onSingleLineFinish_ = nil
			arg_649_1.state_ = "waiting"
		end

		function arg_649_1.playNext_(arg_651_0)
			if arg_651_0 == 1 then
				arg_649_0:Play1101106156(arg_649_1)
			end
		end

		function arg_649_1.onSingleLineUpdate_(arg_652_0)
			local var_652_0 = 0
			local var_652_1 = 0.15

			if var_652_0 < arg_649_1.time_ and arg_649_1.time_ <= var_652_0 + arg_652_0 then
				arg_649_1.talkMaxDuration = 0
				arg_649_1.dialogCg_.alpha = 1

				arg_649_1.dialog_:SetActive(true)
				SetActive(arg_649_1.leftNameGo_, true)

				local var_652_2 = arg_649_1:FormatText(StoryNameCfg[37].name)

				arg_649_1.leftNameTxt_.text = var_652_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_649_1.leftNameTxt_.transform)

				arg_649_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_649_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_649_1:RecordName(arg_649_1.leftNameTxt_.text)
				SetActive(arg_649_1.iconTrs_.gameObject, false)
				arg_649_1.callingController_:SetSelectedState("normal")

				local var_652_3 = arg_649_1:GetWordFromCfg(1101106155)
				local var_652_4 = arg_649_1:FormatText(var_652_3.content)

				arg_649_1.text_.text = var_652_4

				LuaForUtil.ClearLinePrefixSymbol(arg_649_1.text_)

				local var_652_5 = 6
				local var_652_6 = utf8.len(var_652_4)
				local var_652_7 = var_652_5 <= 0 and var_652_1 or var_652_1 * (var_652_6 / var_652_5)

				if var_652_7 > 0 and var_652_1 < var_652_7 then
					arg_649_1.talkMaxDuration = var_652_7

					if var_652_7 + var_652_0 > arg_649_1.duration_ then
						arg_649_1.duration_ = var_652_7 + var_652_0
					end
				end

				arg_649_1.text_.text = var_652_4
				arg_649_1.typewritter.percent = 0

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb") ~= 0 then
					local var_652_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb") / 1000

					if var_652_8 + var_652_0 > arg_649_1.duration_ then
						arg_649_1.duration_ = var_652_8 + var_652_0
					end

					if var_652_3.prefab_name ~= "" and arg_649_1.actors_[var_652_3.prefab_name] ~= nil then
						local var_652_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_649_1.actors_[var_652_3.prefab_name].transform, "story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb")

						arg_649_1:RecordAudio("1101106155", var_652_9)
						arg_649_1:RecordAudio("1101106155", var_652_9)
					else
						arg_649_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb")
					end

					arg_649_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106155", "story_v_side_new_1101106.awb")
				end

				arg_649_1:RecordContent(arg_649_1.text_.text)
			end

			local var_652_10 = math.max(var_652_1, arg_649_1.talkMaxDuration)

			if var_652_0 <= arg_649_1.time_ and arg_649_1.time_ < var_652_0 + var_652_10 then
				arg_649_1.typewritter.percent = (arg_649_1.time_ - var_652_0) / var_652_10

				arg_649_1.typewritter:SetDirty()
			end

			if arg_649_1.time_ >= var_652_0 + var_652_10 and arg_649_1.time_ < var_652_0 + var_652_10 + arg_652_0 then
				arg_649_1.typewritter.percent = 1

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106156 = function(arg_653_0, arg_653_1)
		arg_653_1.time_ = 0
		arg_653_1.frameCnt_ = 0
		arg_653_1.state_ = "playing"
		arg_653_1.curTalkId_ = 1101106156
		arg_653_1.duration_ = 9

		SetActive(arg_653_1.tipsGo_, false)

		function arg_653_1.onSingleLineFinish_()
			arg_653_1.onSingleLineUpdate_ = nil
			arg_653_1.onSingleLineFinish_ = nil
			arg_653_1.state_ = "waiting"
		end

		function arg_653_1.playNext_(arg_655_0)
			if arg_655_0 == 1 then
				arg_653_0:Play1101106157(arg_653_1)
			end
		end

		function arg_653_1.onSingleLineUpdate_(arg_656_0)
			local var_656_0 = 2

			if var_656_0 < arg_653_1.time_ and arg_653_1.time_ <= var_656_0 + arg_656_0 then
				local var_656_1 = manager.ui.mainCamera.transform.localPosition
				local var_656_2 = Vector3.New(0, 0, 10) + Vector3.New(var_656_1.x, var_656_1.y, 0)
				local var_656_3 = arg_653_1.bgs_.R1102a

				var_656_3.transform.localPosition = var_656_2
				var_656_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_656_4 = var_656_3:GetComponent("SpriteRenderer")

				if var_656_4 and var_656_4.sprite then
					local var_656_5 = (var_656_3.transform.localPosition - var_656_1).z
					local var_656_6 = manager.ui.mainCameraCom_
					local var_656_7 = 2 * var_656_5 * Mathf.Tan(var_656_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_656_8 = var_656_7 * var_656_6.aspect
					local var_656_9 = var_656_4.sprite.bounds.size.x
					local var_656_10 = var_656_4.sprite.bounds.size.y
					local var_656_11 = var_656_8 / var_656_9
					local var_656_12 = var_656_7 / var_656_10
					local var_656_13 = var_656_12 < var_656_11 and var_656_11 or var_656_12

					var_656_3.transform.localScale = Vector3.New(var_656_13, var_656_13, 0)
				end

				for iter_656_0, iter_656_1 in pairs(arg_653_1.bgs_) do
					if iter_656_0 ~= "R1102a" then
						iter_656_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_656_14 = 0

			if var_656_14 < arg_653_1.time_ and arg_653_1.time_ <= var_656_14 + arg_656_0 then
				arg_653_1.mask_.enabled = true
				arg_653_1.mask_.raycastTarget = true

				arg_653_1:SetGaussion(false)
			end

			local var_656_15 = 2

			if var_656_14 <= arg_653_1.time_ and arg_653_1.time_ < var_656_14 + var_656_15 then
				local var_656_16 = (arg_653_1.time_ - var_656_14) / var_656_15
				local var_656_17 = Color.New(0, 0, 0)

				var_656_17.a = Mathf.Lerp(0, 1, var_656_16)
				arg_653_1.mask_.color = var_656_17
			end

			if arg_653_1.time_ >= var_656_14 + var_656_15 and arg_653_1.time_ < var_656_14 + var_656_15 + arg_656_0 then
				local var_656_18 = Color.New(0, 0, 0)

				var_656_18.a = 1
				arg_653_1.mask_.color = var_656_18
			end

			local var_656_19 = 2

			if var_656_19 < arg_653_1.time_ and arg_653_1.time_ <= var_656_19 + arg_656_0 then
				arg_653_1.mask_.enabled = true
				arg_653_1.mask_.raycastTarget = true

				arg_653_1:SetGaussion(false)
			end

			local var_656_20 = 2

			if var_656_19 <= arg_653_1.time_ and arg_653_1.time_ < var_656_19 + var_656_20 then
				local var_656_21 = (arg_653_1.time_ - var_656_19) / var_656_20
				local var_656_22 = Color.New(0, 0, 0)

				var_656_22.a = Mathf.Lerp(1, 0, var_656_21)
				arg_653_1.mask_.color = var_656_22
			end

			if arg_653_1.time_ >= var_656_19 + var_656_20 and arg_653_1.time_ < var_656_19 + var_656_20 + arg_656_0 then
				local var_656_23 = Color.New(0, 0, 0)
				local var_656_24 = 0

				arg_653_1.mask_.enabled = false
				var_656_23.a = var_656_24
				arg_653_1.mask_.color = var_656_23
			end

			local var_656_25
			local var_656_26 = 2

			if var_656_26 < arg_653_1.time_ and arg_653_1.time_ <= var_656_26 + arg_656_0 then
				local var_656_27 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_656_27 then
					var_656_27.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_656_27.radialBlurScale = 0
					var_656_27.radialBlurGradient = 1
					var_656_27.radialBlurIntensity = 1

					if var_656_25 then
						var_656_27.radialBlurTarget = var_656_25.transform
					end
				end
			end

			local var_656_28 = 0.0166666666666667

			if var_656_26 <= arg_653_1.time_ and arg_653_1.time_ < var_656_26 + var_656_28 then
				local var_656_29 = (arg_653_1.time_ - var_656_26) / var_656_28
				local var_656_30 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_656_30 then
					var_656_30.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_656_30.radialBlurScale = Mathf.Lerp(0, 0, var_656_29)
					var_656_30.radialBlurGradient = Mathf.Lerp(1, 1, var_656_29)
					var_656_30.radialBlurIntensity = Mathf.Lerp(1, 1, var_656_29)
				end
			end

			if arg_653_1.time_ >= var_656_26 + var_656_28 and arg_653_1.time_ < var_656_26 + var_656_28 + arg_656_0 then
				local var_656_31 = manager.ui.mainCamera:GetComponent("CameraExtension")

				if var_656_31 then
					var_656_31.dofType = UnityEngine.Pipelines.SimPipeline.DepthOfFieldType.Disabled
					var_656_31.radialBlurScale = 0
					var_656_31.radialBlurGradient = 1
					var_656_31.radialBlurIntensity = 1
				end
			end

			if arg_653_1.frameCnt_ <= 1 then
				arg_653_1.dialog_:SetActive(false)
			end

			local var_656_32 = 4
			local var_656_33 = 0.6

			if var_656_32 < arg_653_1.time_ and arg_653_1.time_ <= var_656_32 + arg_656_0 then
				arg_653_1.talkMaxDuration = 0

				arg_653_1.dialog_:SetActive(true)

				local var_656_34 = LeanTween.value(arg_653_1.dialog_, 0, 1, 0.3)

				var_656_34:setOnUpdate(LuaHelper.FloatAction(function(arg_657_0)
					arg_653_1.dialogCg_.alpha = arg_657_0
				end))
				var_656_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_653_1.dialog_)
					var_656_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_653_1.duration_ = arg_653_1.duration_ + 0.3

				SetActive(arg_653_1.leftNameGo_, false)

				arg_653_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_653_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_653_1:RecordName(arg_653_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_653_1.iconTrs_.gameObject, false)
				arg_653_1.callingController_:SetSelectedState("normal")

				local var_656_35 = arg_653_1:GetWordFromCfg(1101106156)
				local var_656_36 = arg_653_1:FormatText(var_656_35.content)

				arg_653_1.text_.text = var_656_36

				LuaForUtil.ClearLinePrefixSymbol(arg_653_1.text_)

				local var_656_37 = 24
				local var_656_38 = utf8.len(var_656_36)
				local var_656_39 = var_656_37 <= 0 and var_656_33 or var_656_33 * (var_656_38 / var_656_37)

				if var_656_39 > 0 and var_656_33 < var_656_39 then
					arg_653_1.talkMaxDuration = var_656_39
					var_656_32 = var_656_32 + 0.3

					if var_656_39 + var_656_32 > arg_653_1.duration_ then
						arg_653_1.duration_ = var_656_39 + var_656_32
					end
				end

				arg_653_1.text_.text = var_656_36
				arg_653_1.typewritter.percent = 0

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(false)
				arg_653_1:RecordContent(arg_653_1.text_.text)
			end

			local var_656_40 = var_656_32 + 0.3
			local var_656_41 = math.max(var_656_33, arg_653_1.talkMaxDuration)

			if var_656_40 <= arg_653_1.time_ and arg_653_1.time_ < var_656_40 + var_656_41 then
				arg_653_1.typewritter.percent = (arg_653_1.time_ - var_656_40) / var_656_41

				arg_653_1.typewritter:SetDirty()
			end

			if arg_653_1.time_ >= var_656_40 + var_656_41 and arg_653_1.time_ < var_656_40 + var_656_41 + arg_656_0 then
				arg_653_1.typewritter.percent = 1

				arg_653_1.typewritter:SetDirty()
				arg_653_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106157 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 1101106157
		arg_659_1.duration_ = 5

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play1101106158(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = 0
			local var_662_1 = 0.775

			if var_662_0 < arg_659_1.time_ and arg_659_1.time_ <= var_662_0 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, false)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_2 = arg_659_1:GetWordFromCfg(1101106157)
				local var_662_3 = arg_659_1:FormatText(var_662_2.content)

				arg_659_1.text_.text = var_662_3

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_4 = 31
				local var_662_5 = utf8.len(var_662_3)
				local var_662_6 = var_662_4 <= 0 and var_662_1 or var_662_1 * (var_662_5 / var_662_4)

				if var_662_6 > 0 and var_662_1 < var_662_6 then
					arg_659_1.talkMaxDuration = var_662_6

					if var_662_6 + var_662_0 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_6 + var_662_0
					end
				end

				arg_659_1.text_.text = var_662_3
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)
				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_7 = math.max(var_662_1, arg_659_1.talkMaxDuration)

			if var_662_0 <= arg_659_1.time_ and arg_659_1.time_ < var_662_0 + var_662_7 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_0) / var_662_7

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_0 + var_662_7 and arg_659_1.time_ < var_662_0 + var_662_7 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106158 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 1101106158
		arg_663_1.duration_ = 5

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play1101106159(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = 0
			local var_666_1 = 0.65

			if var_666_0 < arg_663_1.time_ and arg_663_1.time_ <= var_666_0 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, false)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_2 = arg_663_1:GetWordFromCfg(1101106158)
				local var_666_3 = arg_663_1:FormatText(var_666_2.content)

				arg_663_1.text_.text = var_666_3

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_4 = 26
				local var_666_5 = utf8.len(var_666_3)
				local var_666_6 = var_666_4 <= 0 and var_666_1 or var_666_1 * (var_666_5 / var_666_4)

				if var_666_6 > 0 and var_666_1 < var_666_6 then
					arg_663_1.talkMaxDuration = var_666_6

					if var_666_6 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_6 + var_666_0
					end
				end

				arg_663_1.text_.text = var_666_3
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)
				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_7 = math.max(var_666_1, arg_663_1.talkMaxDuration)

			if var_666_0 <= arg_663_1.time_ and arg_663_1.time_ < var_666_0 + var_666_7 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_0) / var_666_7

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_0 + var_666_7 and arg_663_1.time_ < var_666_0 + var_666_7 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106159 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 1101106159
		arg_667_1.duration_ = 5

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play1101106160(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0
			local var_670_1 = 0.15

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, false)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_2 = arg_667_1:GetWordFromCfg(1101106159)
				local var_670_3 = arg_667_1:FormatText(var_670_2.content)

				arg_667_1.text_.text = var_670_3

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_4 = 6
				local var_670_5 = utf8.len(var_670_3)
				local var_670_6 = var_670_4 <= 0 and var_670_1 or var_670_1 * (var_670_5 / var_670_4)

				if var_670_6 > 0 and var_670_1 < var_670_6 then
					arg_667_1.talkMaxDuration = var_670_6

					if var_670_6 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_6 + var_670_0
					end
				end

				arg_667_1.text_.text = var_670_3
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)
				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_7 = math.max(var_670_1, arg_667_1.talkMaxDuration)

			if var_670_0 <= arg_667_1.time_ and arg_667_1.time_ < var_670_0 + var_670_7 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_0) / var_670_7

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_0 + var_670_7 and arg_667_1.time_ < var_670_0 + var_670_7 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106160 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 1101106160
		arg_671_1.duration_ = 5

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play1101106161(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = 0
			local var_674_1 = 0.15

			if var_674_0 < arg_671_1.time_ and arg_671_1.time_ <= var_674_0 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, true)

				local var_674_2 = arg_671_1:FormatText(StoryNameCfg[7].name)

				arg_671_1.leftNameTxt_.text = var_674_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_671_1.leftNameTxt_.transform)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1.leftNameTxt_.text)
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_3 = arg_671_1:GetWordFromCfg(1101106160)
				local var_674_4 = arg_671_1:FormatText(var_674_3.content)

				arg_671_1.text_.text = var_674_4

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_5 = 6
				local var_674_6 = utf8.len(var_674_4)
				local var_674_7 = var_674_5 <= 0 and var_674_1 or var_674_1 * (var_674_6 / var_674_5)

				if var_674_7 > 0 and var_674_1 < var_674_7 then
					arg_671_1.talkMaxDuration = var_674_7

					if var_674_7 + var_674_0 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_7 + var_674_0
					end
				end

				arg_671_1.text_.text = var_674_4
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)
				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_8 = math.max(var_674_1, arg_671_1.talkMaxDuration)

			if var_674_0 <= arg_671_1.time_ and arg_671_1.time_ < var_674_0 + var_674_8 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_0) / var_674_8

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_0 + var_674_8 and arg_671_1.time_ < var_674_0 + var_674_8 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106161 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 1101106161
		arg_675_1.duration_ = 8.266

		local var_675_0 = {
			zh = 7.7,
			ja = 8.266
		}
		local var_675_1 = manager.audio:GetLocalizationFlag()

		if var_675_0[var_675_1] ~= nil then
			arg_675_1.duration_ = var_675_0[var_675_1]
		end

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play1101106162(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = 0
			local var_678_1 = 0.525

			if var_678_0 < arg_675_1.time_ and arg_675_1.time_ <= var_678_0 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_2 = arg_675_1:FormatText(StoryNameCfg[37].name)

				arg_675_1.leftNameTxt_.text = var_678_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_3 = arg_675_1:GetWordFromCfg(1101106161)
				local var_678_4 = arg_675_1:FormatText(var_678_3.content)

				arg_675_1.text_.text = var_678_4

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_5 = 21
				local var_678_6 = utf8.len(var_678_4)
				local var_678_7 = var_678_5 <= 0 and var_678_1 or var_678_1 * (var_678_6 / var_678_5)

				if var_678_7 > 0 and var_678_1 < var_678_7 then
					arg_675_1.talkMaxDuration = var_678_7

					if var_678_7 + var_678_0 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_7 + var_678_0
					end
				end

				arg_675_1.text_.text = var_678_4
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb") ~= 0 then
					local var_678_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb") / 1000

					if var_678_8 + var_678_0 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_8 + var_678_0
					end

					if var_678_3.prefab_name ~= "" and arg_675_1.actors_[var_678_3.prefab_name] ~= nil then
						local var_678_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_675_1.actors_[var_678_3.prefab_name].transform, "story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb")

						arg_675_1:RecordAudio("1101106161", var_678_9)
						arg_675_1:RecordAudio("1101106161", var_678_9)
					else
						arg_675_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb")
					end

					arg_675_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106161", "story_v_side_new_1101106.awb")
				end

				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_10 = math.max(var_678_1, arg_675_1.talkMaxDuration)

			if var_678_0 <= arg_675_1.time_ and arg_675_1.time_ < var_678_0 + var_678_10 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_0) / var_678_10

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_0 + var_678_10 and arg_675_1.time_ < var_678_0 + var_678_10 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106162 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 1101106162
		arg_679_1.duration_ = 5

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play1101106163(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = 0
			local var_682_1 = 0.425

			if var_682_0 < arg_679_1.time_ and arg_679_1.time_ <= var_682_0 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_2 = arg_679_1:FormatText(StoryNameCfg[7].name)

				arg_679_1.leftNameTxt_.text = var_682_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_3 = arg_679_1:GetWordFromCfg(1101106162)
				local var_682_4 = arg_679_1:FormatText(var_682_3.content)

				arg_679_1.text_.text = var_682_4

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_5 = 17
				local var_682_6 = utf8.len(var_682_4)
				local var_682_7 = var_682_5 <= 0 and var_682_1 or var_682_1 * (var_682_6 / var_682_5)

				if var_682_7 > 0 and var_682_1 < var_682_7 then
					arg_679_1.talkMaxDuration = var_682_7

					if var_682_7 + var_682_0 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_7 + var_682_0
					end
				end

				arg_679_1.text_.text = var_682_4
				arg_679_1.typewritter.percent = 0

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(false)
				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_8 = math.max(var_682_1, arg_679_1.talkMaxDuration)

			if var_682_0 <= arg_679_1.time_ and arg_679_1.time_ < var_682_0 + var_682_8 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_0) / var_682_8

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_0 + var_682_8 and arg_679_1.time_ < var_682_0 + var_682_8 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106163 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 1101106163
		arg_683_1.duration_ = 5.1

		local var_683_0 = {
			zh = 5.1,
			ja = 3.233
		}
		local var_683_1 = manager.audio:GetLocalizationFlag()

		if var_683_0[var_683_1] ~= nil then
			arg_683_1.duration_ = var_683_0[var_683_1]
		end

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
		end

		function arg_683_1.playNext_(arg_685_0)
			if arg_685_0 == 1 then
				arg_683_0:Play1101106164(arg_683_1)
			end
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = 0
			local var_686_1 = 0.35

			if var_686_0 < arg_683_1.time_ and arg_683_1.time_ <= var_686_0 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0
				arg_683_1.dialogCg_.alpha = 1

				arg_683_1.dialog_:SetActive(true)
				SetActive(arg_683_1.leftNameGo_, true)

				local var_686_2 = arg_683_1:FormatText(StoryNameCfg[37].name)

				arg_683_1.leftNameTxt_.text = var_686_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_683_1.leftNameTxt_.transform)

				arg_683_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_683_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_683_1:RecordName(arg_683_1.leftNameTxt_.text)
				SetActive(arg_683_1.iconTrs_.gameObject, false)
				arg_683_1.callingController_:SetSelectedState("normal")

				local var_686_3 = arg_683_1:GetWordFromCfg(1101106163)
				local var_686_4 = arg_683_1:FormatText(var_686_3.content)

				arg_683_1.text_.text = var_686_4

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.text_)

				local var_686_5 = 14
				local var_686_6 = utf8.len(var_686_4)
				local var_686_7 = var_686_5 <= 0 and var_686_1 or var_686_1 * (var_686_6 / var_686_5)

				if var_686_7 > 0 and var_686_1 < var_686_7 then
					arg_683_1.talkMaxDuration = var_686_7

					if var_686_7 + var_686_0 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_7 + var_686_0
					end
				end

				arg_683_1.text_.text = var_686_4
				arg_683_1.typewritter.percent = 0

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb") ~= 0 then
					local var_686_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb") / 1000

					if var_686_8 + var_686_0 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_8 + var_686_0
					end

					if var_686_3.prefab_name ~= "" and arg_683_1.actors_[var_686_3.prefab_name] ~= nil then
						local var_686_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_683_1.actors_[var_686_3.prefab_name].transform, "story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb")

						arg_683_1:RecordAudio("1101106163", var_686_9)
						arg_683_1:RecordAudio("1101106163", var_686_9)
					else
						arg_683_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb")
					end

					arg_683_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106163", "story_v_side_new_1101106.awb")
				end

				arg_683_1:RecordContent(arg_683_1.text_.text)
			end

			local var_686_10 = math.max(var_686_1, arg_683_1.talkMaxDuration)

			if var_686_0 <= arg_683_1.time_ and arg_683_1.time_ < var_686_0 + var_686_10 then
				arg_683_1.typewritter.percent = (arg_683_1.time_ - var_686_0) / var_686_10

				arg_683_1.typewritter:SetDirty()
			end

			if arg_683_1.time_ >= var_686_0 + var_686_10 and arg_683_1.time_ < var_686_0 + var_686_10 + arg_686_0 then
				arg_683_1.typewritter.percent = 1

				arg_683_1.typewritter:SetDirty()
				arg_683_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106164 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 1101106164
		arg_687_1.duration_ = 4.3

		local var_687_0 = {
			zh = 3.533,
			ja = 4.3
		}
		local var_687_1 = manager.audio:GetLocalizationFlag()

		if var_687_0[var_687_1] ~= nil then
			arg_687_1.duration_ = var_687_0[var_687_1]
		end

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play1101106165(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = 0
			local var_690_1 = 0.3

			if var_690_0 < arg_687_1.time_ and arg_687_1.time_ <= var_690_0 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0
				arg_687_1.dialogCg_.alpha = 1

				arg_687_1.dialog_:SetActive(true)
				SetActive(arg_687_1.leftNameGo_, true)

				local var_690_2 = arg_687_1:FormatText(StoryNameCfg[67].name)

				arg_687_1.leftNameTxt_.text = var_690_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_687_1.leftNameTxt_.transform)

				arg_687_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_687_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_687_1:RecordName(arg_687_1.leftNameTxt_.text)
				SetActive(arg_687_1.iconTrs_.gameObject, true)
				arg_687_1.iconController_:SetSelectedState("hero")

				arg_687_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1111")

				arg_687_1.callingController_:SetSelectedState("normal")

				local var_690_3 = arg_687_1:GetWordFromCfg(1101106164)
				local var_690_4 = arg_687_1:FormatText(var_690_3.content)

				arg_687_1.text_.text = var_690_4

				LuaForUtil.ClearLinePrefixSymbol(arg_687_1.text_)

				local var_690_5 = 12
				local var_690_6 = utf8.len(var_690_4)
				local var_690_7 = var_690_5 <= 0 and var_690_1 or var_690_1 * (var_690_6 / var_690_5)

				if var_690_7 > 0 and var_690_1 < var_690_7 then
					arg_687_1.talkMaxDuration = var_690_7

					if var_690_7 + var_690_0 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_7 + var_690_0
					end
				end

				arg_687_1.text_.text = var_690_4
				arg_687_1.typewritter.percent = 0

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb") ~= 0 then
					local var_690_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb") / 1000

					if var_690_8 + var_690_0 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_8 + var_690_0
					end

					if var_690_3.prefab_name ~= "" and arg_687_1.actors_[var_690_3.prefab_name] ~= nil then
						local var_690_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_687_1.actors_[var_690_3.prefab_name].transform, "story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb")

						arg_687_1:RecordAudio("1101106164", var_690_9)
						arg_687_1:RecordAudio("1101106164", var_690_9)
					else
						arg_687_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb")
					end

					arg_687_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106164", "story_v_side_new_1101106.awb")
				end

				arg_687_1:RecordContent(arg_687_1.text_.text)
			end

			local var_690_10 = math.max(var_690_1, arg_687_1.talkMaxDuration)

			if var_690_0 <= arg_687_1.time_ and arg_687_1.time_ < var_690_0 + var_690_10 then
				arg_687_1.typewritter.percent = (arg_687_1.time_ - var_690_0) / var_690_10

				arg_687_1.typewritter:SetDirty()
			end

			if arg_687_1.time_ >= var_690_0 + var_690_10 and arg_687_1.time_ < var_690_0 + var_690_10 + arg_690_0 then
				arg_687_1.typewritter.percent = 1

				arg_687_1.typewritter:SetDirty()
				arg_687_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106165 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 1101106165
		arg_691_1.duration_ = 5

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
		end

		function arg_691_1.playNext_(arg_693_0)
			if arg_693_0 == 1 then
				arg_691_0:Play1101106166(arg_691_1)
			end
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = 0
			local var_694_1 = 0.6

			if var_694_0 < arg_691_1.time_ and arg_691_1.time_ <= var_694_0 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0
				arg_691_1.dialogCg_.alpha = 1

				arg_691_1.dialog_:SetActive(true)
				SetActive(arg_691_1.leftNameGo_, false)

				arg_691_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_691_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_691_1:RecordName(arg_691_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_691_1.iconTrs_.gameObject, false)
				arg_691_1.callingController_:SetSelectedState("normal")

				local var_694_2 = arg_691_1:GetWordFromCfg(1101106165)
				local var_694_3 = arg_691_1:FormatText(var_694_2.content)

				arg_691_1.text_.text = var_694_3

				LuaForUtil.ClearLinePrefixSymbol(arg_691_1.text_)

				local var_694_4 = 24
				local var_694_5 = utf8.len(var_694_3)
				local var_694_6 = var_694_4 <= 0 and var_694_1 or var_694_1 * (var_694_5 / var_694_4)

				if var_694_6 > 0 and var_694_1 < var_694_6 then
					arg_691_1.talkMaxDuration = var_694_6

					if var_694_6 + var_694_0 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_6 + var_694_0
					end
				end

				arg_691_1.text_.text = var_694_3
				arg_691_1.typewritter.percent = 0

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(false)
				arg_691_1:RecordContent(arg_691_1.text_.text)
			end

			local var_694_7 = math.max(var_694_1, arg_691_1.talkMaxDuration)

			if var_694_0 <= arg_691_1.time_ and arg_691_1.time_ < var_694_0 + var_694_7 then
				arg_691_1.typewritter.percent = (arg_691_1.time_ - var_694_0) / var_694_7

				arg_691_1.typewritter:SetDirty()
			end

			if arg_691_1.time_ >= var_694_0 + var_694_7 and arg_691_1.time_ < var_694_0 + var_694_7 + arg_694_0 then
				arg_691_1.typewritter.percent = 1

				arg_691_1.typewritter:SetDirty()
				arg_691_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106166 = function(arg_695_0, arg_695_1)
		arg_695_1.time_ = 0
		arg_695_1.frameCnt_ = 0
		arg_695_1.state_ = "playing"
		arg_695_1.curTalkId_ = 1101106166
		arg_695_1.duration_ = 9.233

		local var_695_0 = {
			zh = 9.233,
			ja = 5.433
		}
		local var_695_1 = manager.audio:GetLocalizationFlag()

		if var_695_0[var_695_1] ~= nil then
			arg_695_1.duration_ = var_695_0[var_695_1]
		end

		SetActive(arg_695_1.tipsGo_, false)

		function arg_695_1.onSingleLineFinish_()
			arg_695_1.onSingleLineUpdate_ = nil
			arg_695_1.onSingleLineFinish_ = nil
			arg_695_1.state_ = "waiting"
		end

		function arg_695_1.playNext_(arg_697_0)
			if arg_697_0 == 1 then
				arg_695_0:Play1101106167(arg_695_1)
			end
		end

		function arg_695_1.onSingleLineUpdate_(arg_698_0)
			local var_698_0 = 0
			local var_698_1 = 0.5

			if var_698_0 < arg_695_1.time_ and arg_695_1.time_ <= var_698_0 + arg_698_0 then
				arg_695_1.talkMaxDuration = 0
				arg_695_1.dialogCg_.alpha = 1

				arg_695_1.dialog_:SetActive(true)
				SetActive(arg_695_1.leftNameGo_, true)

				local var_698_2 = arg_695_1:FormatText(StoryNameCfg[37].name)

				arg_695_1.leftNameTxt_.text = var_698_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_695_1.leftNameTxt_.transform)

				arg_695_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_695_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_695_1:RecordName(arg_695_1.leftNameTxt_.text)
				SetActive(arg_695_1.iconTrs_.gameObject, false)
				arg_695_1.callingController_:SetSelectedState("normal")

				local var_698_3 = arg_695_1:GetWordFromCfg(1101106166)
				local var_698_4 = arg_695_1:FormatText(var_698_3.content)

				arg_695_1.text_.text = var_698_4

				LuaForUtil.ClearLinePrefixSymbol(arg_695_1.text_)

				local var_698_5 = 20
				local var_698_6 = utf8.len(var_698_4)
				local var_698_7 = var_698_5 <= 0 and var_698_1 or var_698_1 * (var_698_6 / var_698_5)

				if var_698_7 > 0 and var_698_1 < var_698_7 then
					arg_695_1.talkMaxDuration = var_698_7

					if var_698_7 + var_698_0 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_7 + var_698_0
					end
				end

				arg_695_1.text_.text = var_698_4
				arg_695_1.typewritter.percent = 0

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb") ~= 0 then
					local var_698_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb") / 1000

					if var_698_8 + var_698_0 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_8 + var_698_0
					end

					if var_698_3.prefab_name ~= "" and arg_695_1.actors_[var_698_3.prefab_name] ~= nil then
						local var_698_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_695_1.actors_[var_698_3.prefab_name].transform, "story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb")

						arg_695_1:RecordAudio("1101106166", var_698_9)
						arg_695_1:RecordAudio("1101106166", var_698_9)
					else
						arg_695_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb")
					end

					arg_695_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106166", "story_v_side_new_1101106.awb")
				end

				arg_695_1:RecordContent(arg_695_1.text_.text)
			end

			local var_698_10 = math.max(var_698_1, arg_695_1.talkMaxDuration)

			if var_698_0 <= arg_695_1.time_ and arg_695_1.time_ < var_698_0 + var_698_10 then
				arg_695_1.typewritter.percent = (arg_695_1.time_ - var_698_0) / var_698_10

				arg_695_1.typewritter:SetDirty()
			end

			if arg_695_1.time_ >= var_698_0 + var_698_10 and arg_695_1.time_ < var_698_0 + var_698_10 + arg_698_0 then
				arg_695_1.typewritter.percent = 1

				arg_695_1.typewritter:SetDirty()
				arg_695_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106167 = function(arg_699_0, arg_699_1)
		arg_699_1.time_ = 0
		arg_699_1.frameCnt_ = 0
		arg_699_1.state_ = "playing"
		arg_699_1.curTalkId_ = 1101106167
		arg_699_1.duration_ = 4.566

		local var_699_0 = {
			zh = 4.566,
			ja = 4.5
		}
		local var_699_1 = manager.audio:GetLocalizationFlag()

		if var_699_0[var_699_1] ~= nil then
			arg_699_1.duration_ = var_699_0[var_699_1]
		end

		SetActive(arg_699_1.tipsGo_, false)

		function arg_699_1.onSingleLineFinish_()
			arg_699_1.onSingleLineUpdate_ = nil
			arg_699_1.onSingleLineFinish_ = nil
			arg_699_1.state_ = "waiting"
		end

		function arg_699_1.playNext_(arg_701_0)
			if arg_701_0 == 1 then
				arg_699_0:Play1101106168(arg_699_1)
			end
		end

		function arg_699_1.onSingleLineUpdate_(arg_702_0)
			local var_702_0 = 0
			local var_702_1 = 0.4

			if var_702_0 < arg_699_1.time_ and arg_699_1.time_ <= var_702_0 + arg_702_0 then
				arg_699_1.talkMaxDuration = 0
				arg_699_1.dialogCg_.alpha = 1

				arg_699_1.dialog_:SetActive(true)
				SetActive(arg_699_1.leftNameGo_, true)

				local var_702_2 = arg_699_1:FormatText(StoryNameCfg[37].name)

				arg_699_1.leftNameTxt_.text = var_702_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_699_1.leftNameTxt_.transform)

				arg_699_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_699_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_699_1:RecordName(arg_699_1.leftNameTxt_.text)
				SetActive(arg_699_1.iconTrs_.gameObject, false)
				arg_699_1.callingController_:SetSelectedState("normal")

				local var_702_3 = arg_699_1:GetWordFromCfg(1101106167)
				local var_702_4 = arg_699_1:FormatText(var_702_3.content)

				arg_699_1.text_.text = var_702_4

				LuaForUtil.ClearLinePrefixSymbol(arg_699_1.text_)

				local var_702_5 = 16
				local var_702_6 = utf8.len(var_702_4)
				local var_702_7 = var_702_5 <= 0 and var_702_1 or var_702_1 * (var_702_6 / var_702_5)

				if var_702_7 > 0 and var_702_1 < var_702_7 then
					arg_699_1.talkMaxDuration = var_702_7

					if var_702_7 + var_702_0 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_7 + var_702_0
					end
				end

				arg_699_1.text_.text = var_702_4
				arg_699_1.typewritter.percent = 0

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb") ~= 0 then
					local var_702_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb") / 1000

					if var_702_8 + var_702_0 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_8 + var_702_0
					end

					if var_702_3.prefab_name ~= "" and arg_699_1.actors_[var_702_3.prefab_name] ~= nil then
						local var_702_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_699_1.actors_[var_702_3.prefab_name].transform, "story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb")

						arg_699_1:RecordAudio("1101106167", var_702_9)
						arg_699_1:RecordAudio("1101106167", var_702_9)
					else
						arg_699_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb")
					end

					arg_699_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106167", "story_v_side_new_1101106.awb")
				end

				arg_699_1:RecordContent(arg_699_1.text_.text)
			end

			local var_702_10 = math.max(var_702_1, arg_699_1.talkMaxDuration)

			if var_702_0 <= arg_699_1.time_ and arg_699_1.time_ < var_702_0 + var_702_10 then
				arg_699_1.typewritter.percent = (arg_699_1.time_ - var_702_0) / var_702_10

				arg_699_1.typewritter:SetDirty()
			end

			if arg_699_1.time_ >= var_702_0 + var_702_10 and arg_699_1.time_ < var_702_0 + var_702_10 + arg_702_0 then
				arg_699_1.typewritter.percent = 1

				arg_699_1.typewritter:SetDirty()
				arg_699_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106168 = function(arg_703_0, arg_703_1)
		arg_703_1.time_ = 0
		arg_703_1.frameCnt_ = 0
		arg_703_1.state_ = "playing"
		arg_703_1.curTalkId_ = 1101106168
		arg_703_1.duration_ = 5

		SetActive(arg_703_1.tipsGo_, false)

		function arg_703_1.onSingleLineFinish_()
			arg_703_1.onSingleLineUpdate_ = nil
			arg_703_1.onSingleLineFinish_ = nil
			arg_703_1.state_ = "waiting"
		end

		function arg_703_1.playNext_(arg_705_0)
			if arg_705_0 == 1 then
				arg_703_0:Play1101106169(arg_703_1)
			end
		end

		function arg_703_1.onSingleLineUpdate_(arg_706_0)
			local var_706_0 = 0
			local var_706_1 = 0.375

			if var_706_0 < arg_703_1.time_ and arg_703_1.time_ <= var_706_0 + arg_706_0 then
				arg_703_1.talkMaxDuration = 0
				arg_703_1.dialogCg_.alpha = 1

				arg_703_1.dialog_:SetActive(true)
				SetActive(arg_703_1.leftNameGo_, true)

				local var_706_2 = arg_703_1:FormatText(StoryNameCfg[7].name)

				arg_703_1.leftNameTxt_.text = var_706_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_703_1.leftNameTxt_.transform)

				arg_703_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_703_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_703_1:RecordName(arg_703_1.leftNameTxt_.text)
				SetActive(arg_703_1.iconTrs_.gameObject, false)
				arg_703_1.callingController_:SetSelectedState("normal")

				local var_706_3 = arg_703_1:GetWordFromCfg(1101106168)
				local var_706_4 = arg_703_1:FormatText(var_706_3.content)

				arg_703_1.text_.text = var_706_4

				LuaForUtil.ClearLinePrefixSymbol(arg_703_1.text_)

				local var_706_5 = 15
				local var_706_6 = utf8.len(var_706_4)
				local var_706_7 = var_706_5 <= 0 and var_706_1 or var_706_1 * (var_706_6 / var_706_5)

				if var_706_7 > 0 and var_706_1 < var_706_7 then
					arg_703_1.talkMaxDuration = var_706_7

					if var_706_7 + var_706_0 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_7 + var_706_0
					end
				end

				arg_703_1.text_.text = var_706_4
				arg_703_1.typewritter.percent = 0

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(false)
				arg_703_1:RecordContent(arg_703_1.text_.text)
			end

			local var_706_8 = math.max(var_706_1, arg_703_1.talkMaxDuration)

			if var_706_0 <= arg_703_1.time_ and arg_703_1.time_ < var_706_0 + var_706_8 then
				arg_703_1.typewritter.percent = (arg_703_1.time_ - var_706_0) / var_706_8

				arg_703_1.typewritter:SetDirty()
			end

			if arg_703_1.time_ >= var_706_0 + var_706_8 and arg_703_1.time_ < var_706_0 + var_706_8 + arg_706_0 then
				arg_703_1.typewritter.percent = 1

				arg_703_1.typewritter:SetDirty()
				arg_703_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106169 = function(arg_707_0, arg_707_1)
		arg_707_1.time_ = 0
		arg_707_1.frameCnt_ = 0
		arg_707_1.state_ = "playing"
		arg_707_1.curTalkId_ = 1101106169
		arg_707_1.duration_ = 5.599999999999

		SetActive(arg_707_1.tipsGo_, false)

		function arg_707_1.onSingleLineFinish_()
			arg_707_1.onSingleLineUpdate_ = nil
			arg_707_1.onSingleLineFinish_ = nil
			arg_707_1.state_ = "waiting"
		end

		function arg_707_1.playNext_(arg_709_0)
			if arg_709_0 == 1 then
				arg_707_0:Play1101106170(arg_707_1)
			end
		end

		function arg_707_1.onSingleLineUpdate_(arg_710_0)
			local var_710_0 = 2

			if var_710_0 < arg_707_1.time_ and arg_707_1.time_ <= var_710_0 + arg_710_0 then
				local var_710_1 = manager.ui.mainCamera.transform.localPosition
				local var_710_2 = Vector3.New(0, 0, 10) + Vector3.New(var_710_1.x, var_710_1.y, 0)
				local var_710_3 = arg_707_1.bgs_.STblack

				var_710_3.transform.localPosition = var_710_2
				var_710_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_710_4 = var_710_3:GetComponent("SpriteRenderer")

				if var_710_4 and var_710_4.sprite then
					local var_710_5 = (var_710_3.transform.localPosition - var_710_1).z
					local var_710_6 = manager.ui.mainCameraCom_
					local var_710_7 = 2 * var_710_5 * Mathf.Tan(var_710_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_710_8 = var_710_7 * var_710_6.aspect
					local var_710_9 = var_710_4.sprite.bounds.size.x
					local var_710_10 = var_710_4.sprite.bounds.size.y
					local var_710_11 = var_710_8 / var_710_9
					local var_710_12 = var_710_7 / var_710_10
					local var_710_13 = var_710_12 < var_710_11 and var_710_11 or var_710_12

					var_710_3.transform.localScale = Vector3.New(var_710_13, var_710_13, 0)
				end

				for iter_710_0, iter_710_1 in pairs(arg_707_1.bgs_) do
					if iter_710_0 ~= "STblack" then
						iter_710_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_710_14 = 0

			if var_710_14 < arg_707_1.time_ and arg_707_1.time_ <= var_710_14 + arg_710_0 then
				arg_707_1.mask_.enabled = true
				arg_707_1.mask_.raycastTarget = true

				arg_707_1:SetGaussion(false)
			end

			local var_710_15 = 2

			if var_710_14 <= arg_707_1.time_ and arg_707_1.time_ < var_710_14 + var_710_15 then
				local var_710_16 = (arg_707_1.time_ - var_710_14) / var_710_15
				local var_710_17 = Color.New(0, 0, 0)

				var_710_17.a = Mathf.Lerp(0, 1, var_710_16)
				arg_707_1.mask_.color = var_710_17
			end

			if arg_707_1.time_ >= var_710_14 + var_710_15 and arg_707_1.time_ < var_710_14 + var_710_15 + arg_710_0 then
				local var_710_18 = Color.New(0, 0, 0)

				var_710_18.a = 1
				arg_707_1.mask_.color = var_710_18
			end

			local var_710_19 = 2

			if var_710_19 < arg_707_1.time_ and arg_707_1.time_ <= var_710_19 + arg_710_0 then
				arg_707_1.mask_.enabled = true
				arg_707_1.mask_.raycastTarget = true

				arg_707_1:SetGaussion(false)
			end

			local var_710_20 = 2

			if var_710_19 <= arg_707_1.time_ and arg_707_1.time_ < var_710_19 + var_710_20 then
				local var_710_21 = (arg_707_1.time_ - var_710_19) / var_710_20
				local var_710_22 = Color.New(0, 0, 0)

				var_710_22.a = Mathf.Lerp(1, 0, var_710_21)
				arg_707_1.mask_.color = var_710_22
			end

			if arg_707_1.time_ >= var_710_19 + var_710_20 and arg_707_1.time_ < var_710_19 + var_710_20 + arg_710_0 then
				local var_710_23 = Color.New(0, 0, 0)
				local var_710_24 = 0

				arg_707_1.mask_.enabled = false
				var_710_23.a = var_710_24
				arg_707_1.mask_.color = var_710_23
			end

			local var_710_25 = 2

			if var_710_25 < arg_707_1.time_ and arg_707_1.time_ <= var_710_25 + arg_710_0 then
				arg_707_1.fswbg_:SetActive(true)
				arg_707_1.dialog_:SetActive(false)

				arg_707_1.fswtw_.percent = 0

				local var_710_26 = arg_707_1:GetWordFromCfg(1101106169)
				local var_710_27 = arg_707_1:FormatText(var_710_26.content)

				arg_707_1.fswt_.text = var_710_27

				LuaForUtil.ClearLinePrefixSymbol(arg_707_1.fswt_)

				arg_707_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_707_1.fswtw_:SetDirty()

				arg_707_1.typewritterCharCountI18N = 0

				SetActive(arg_707_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_707_1:ShowNextGo(false)
			end

			local var_710_28 = 4

			if var_710_28 < arg_707_1.time_ and arg_707_1.time_ <= var_710_28 + arg_710_0 then
				arg_707_1.var_.oldValueTypewriter = arg_707_1.fswtw_.percent

				arg_707_1:ShowNextGo(false)
			end

			local var_710_29 = 24
			local var_710_30 = 1.6
			local var_710_31 = arg_707_1:GetWordFromCfg(1101106169)
			local var_710_32 = arg_707_1:FormatText(var_710_31.content)
			local var_710_33, var_710_34 = arg_707_1:GetPercentByPara(var_710_32, 1)

			if var_710_28 < arg_707_1.time_ and arg_707_1.time_ <= var_710_28 + arg_710_0 then
				arg_707_1.talkMaxDuration = 0

				local var_710_35 = var_710_29 <= 0 and var_710_30 or var_710_30 * ((var_710_34 - arg_707_1.typewritterCharCountI18N) / var_710_29)

				if var_710_35 > 0 and var_710_30 < var_710_35 then
					arg_707_1.talkMaxDuration = var_710_35

					if var_710_35 + var_710_28 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_35 + var_710_28
					end
				end
			end

			local var_710_36 = 1.6
			local var_710_37 = math.max(var_710_36, arg_707_1.talkMaxDuration)

			if var_710_28 <= arg_707_1.time_ and arg_707_1.time_ < var_710_28 + var_710_37 then
				local var_710_38 = (arg_707_1.time_ - var_710_28) / var_710_37

				arg_707_1.fswtw_.percent = Mathf.Lerp(arg_707_1.var_.oldValueTypewriter, var_710_33, var_710_38)
				arg_707_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_707_1.fswtw_:SetDirty()
			end

			if arg_707_1.time_ >= var_710_28 + var_710_37 and arg_707_1.time_ < var_710_28 + var_710_37 + arg_710_0 then
				arg_707_1.fswtw_.percent = var_710_33

				arg_707_1.fswtw_:SetDirty()
				arg_707_1:ShowNextGo(true)

				arg_707_1.typewritterCharCountI18N = var_710_34
			end

			local var_710_39 = 4.01666666666667

			if var_710_39 < arg_707_1.time_ and arg_707_1.time_ <= var_710_39 + arg_710_0 then
				local var_710_40 = arg_707_1.fswbg_.transform:Find("textbox/adapt/content") or arg_707_1.fswbg_.transform:Find("textbox/content")
				local var_710_41 = var_710_40:GetComponent("Text")
				local var_710_42 = var_710_40:GetComponent("RectTransform")

				var_710_41.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_710_42.offsetMin = Vector2.New(0, 0)
				var_710_42.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play1101106170 = function(arg_711_0, arg_711_1)
		arg_711_1.time_ = 0
		arg_711_1.frameCnt_ = 0
		arg_711_1.state_ = "playing"
		arg_711_1.curTalkId_ = 1101106170
		arg_711_1.duration_ = 3.966

		local var_711_0 = {
			zh = 2.133,
			ja = 3.966
		}
		local var_711_1 = manager.audio:GetLocalizationFlag()

		if var_711_0[var_711_1] ~= nil then
			arg_711_1.duration_ = var_711_0[var_711_1]
		end

		SetActive(arg_711_1.tipsGo_, false)

		function arg_711_1.onSingleLineFinish_()
			arg_711_1.onSingleLineUpdate_ = nil
			arg_711_1.onSingleLineFinish_ = nil
			arg_711_1.state_ = "waiting"
		end

		function arg_711_1.playNext_(arg_713_0)
			if arg_713_0 == 1 then
				arg_711_0:Play1101106171(arg_711_1)
			end
		end

		function arg_711_1.onSingleLineUpdate_(arg_714_0)
			local var_714_0 = 0

			if var_714_0 < arg_711_1.time_ and arg_711_1.time_ <= var_714_0 + arg_714_0 then
				arg_711_1.fswbg_:SetActive(false)
				arg_711_1.dialog_:SetActive(true)
				arg_711_1:ShowNextGo(false)
			end

			local var_714_1 = 0
			local var_714_2 = 0.125

			if var_714_1 < arg_711_1.time_ and arg_711_1.time_ <= var_714_1 + arg_714_0 then
				arg_711_1.talkMaxDuration = 0
				arg_711_1.dialogCg_.alpha = 1

				arg_711_1.dialog_:SetActive(true)
				SetActive(arg_711_1.leftNameGo_, true)

				local var_714_3 = arg_711_1:FormatText(StoryNameCfg[37].name)

				arg_711_1.leftNameTxt_.text = var_714_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_711_1.leftNameTxt_.transform)

				arg_711_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_711_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_711_1:RecordName(arg_711_1.leftNameTxt_.text)
				SetActive(arg_711_1.iconTrs_.gameObject, true)
				arg_711_1.iconController_:SetSelectedState("hero")

				arg_711_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_711_1.callingController_:SetSelectedState("normal")

				local var_714_4 = arg_711_1:GetWordFromCfg(1101106170)
				local var_714_5 = arg_711_1:FormatText(var_714_4.content)

				arg_711_1.text_.text = var_714_5

				LuaForUtil.ClearLinePrefixSymbol(arg_711_1.text_)

				local var_714_6 = 5
				local var_714_7 = utf8.len(var_714_5)
				local var_714_8 = var_714_6 <= 0 and var_714_2 or var_714_2 * (var_714_7 / var_714_6)

				if var_714_8 > 0 and var_714_2 < var_714_8 then
					arg_711_1.talkMaxDuration = var_714_8

					if var_714_8 + var_714_1 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_8 + var_714_1
					end
				end

				arg_711_1.text_.text = var_714_5
				arg_711_1.typewritter.percent = 0

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb") ~= 0 then
					local var_714_9 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb") / 1000

					if var_714_9 + var_714_1 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_9 + var_714_1
					end

					if var_714_4.prefab_name ~= "" and arg_711_1.actors_[var_714_4.prefab_name] ~= nil then
						local var_714_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_711_1.actors_[var_714_4.prefab_name].transform, "story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb")

						arg_711_1:RecordAudio("1101106170", var_714_10)
						arg_711_1:RecordAudio("1101106170", var_714_10)
					else
						arg_711_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb")
					end

					arg_711_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106170", "story_v_side_new_1101106.awb")
				end

				arg_711_1:RecordContent(arg_711_1.text_.text)
			end

			local var_714_11 = math.max(var_714_2, arg_711_1.talkMaxDuration)

			if var_714_1 <= arg_711_1.time_ and arg_711_1.time_ < var_714_1 + var_714_11 then
				arg_711_1.typewritter.percent = (arg_711_1.time_ - var_714_1) / var_714_11

				arg_711_1.typewritter:SetDirty()
			end

			if arg_711_1.time_ >= var_714_1 + var_714_11 and arg_711_1.time_ < var_714_1 + var_714_11 + arg_714_0 then
				arg_711_1.typewritter.percent = 1

				arg_711_1.typewritter:SetDirty()
				arg_711_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106171 = function(arg_715_0, arg_715_1)
		arg_715_1.time_ = 0
		arg_715_1.frameCnt_ = 0
		arg_715_1.state_ = "playing"
		arg_715_1.curTalkId_ = 1101106171
		arg_715_1.duration_ = 5

		SetActive(arg_715_1.tipsGo_, false)

		function arg_715_1.onSingleLineFinish_()
			arg_715_1.onSingleLineUpdate_ = nil
			arg_715_1.onSingleLineFinish_ = nil
			arg_715_1.state_ = "waiting"
		end

		function arg_715_1.playNext_(arg_717_0)
			if arg_717_0 == 1 then
				arg_715_0:Play1101106172(arg_715_1)
			end
		end

		function arg_715_1.onSingleLineUpdate_(arg_718_0)
			local var_718_0 = 0
			local var_718_1 = 0.175

			if var_718_0 < arg_715_1.time_ and arg_715_1.time_ <= var_718_0 + arg_718_0 then
				arg_715_1.talkMaxDuration = 0
				arg_715_1.dialogCg_.alpha = 1

				arg_715_1.dialog_:SetActive(true)
				SetActive(arg_715_1.leftNameGo_, true)

				local var_718_2 = arg_715_1:FormatText(StoryNameCfg[7].name)

				arg_715_1.leftNameTxt_.text = var_718_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_715_1.leftNameTxt_.transform)

				arg_715_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_715_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_715_1:RecordName(arg_715_1.leftNameTxt_.text)
				SetActive(arg_715_1.iconTrs_.gameObject, false)
				arg_715_1.callingController_:SetSelectedState("normal")

				local var_718_3 = arg_715_1:GetWordFromCfg(1101106171)
				local var_718_4 = arg_715_1:FormatText(var_718_3.content)

				arg_715_1.text_.text = var_718_4

				LuaForUtil.ClearLinePrefixSymbol(arg_715_1.text_)

				local var_718_5 = 7
				local var_718_6 = utf8.len(var_718_4)
				local var_718_7 = var_718_5 <= 0 and var_718_1 or var_718_1 * (var_718_6 / var_718_5)

				if var_718_7 > 0 and var_718_1 < var_718_7 then
					arg_715_1.talkMaxDuration = var_718_7

					if var_718_7 + var_718_0 > arg_715_1.duration_ then
						arg_715_1.duration_ = var_718_7 + var_718_0
					end
				end

				arg_715_1.text_.text = var_718_4
				arg_715_1.typewritter.percent = 0

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(false)
				arg_715_1:RecordContent(arg_715_1.text_.text)
			end

			local var_718_8 = math.max(var_718_1, arg_715_1.talkMaxDuration)

			if var_718_0 <= arg_715_1.time_ and arg_715_1.time_ < var_718_0 + var_718_8 then
				arg_715_1.typewritter.percent = (arg_715_1.time_ - var_718_0) / var_718_8

				arg_715_1.typewritter:SetDirty()
			end

			if arg_715_1.time_ >= var_718_0 + var_718_8 and arg_715_1.time_ < var_718_0 + var_718_8 + arg_718_0 then
				arg_715_1.typewritter.percent = 1

				arg_715_1.typewritter:SetDirty()
				arg_715_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106172 = function(arg_719_0, arg_719_1)
		arg_719_1.time_ = 0
		arg_719_1.frameCnt_ = 0
		arg_719_1.state_ = "playing"
		arg_719_1.curTalkId_ = 1101106172
		arg_719_1.duration_ = 3.8

		local var_719_0 = {
			zh = 3.166,
			ja = 3.8
		}
		local var_719_1 = manager.audio:GetLocalizationFlag()

		if var_719_0[var_719_1] ~= nil then
			arg_719_1.duration_ = var_719_0[var_719_1]
		end

		SetActive(arg_719_1.tipsGo_, false)

		function arg_719_1.onSingleLineFinish_()
			arg_719_1.onSingleLineUpdate_ = nil
			arg_719_1.onSingleLineFinish_ = nil
			arg_719_1.state_ = "waiting"
		end

		function arg_719_1.playNext_(arg_721_0)
			if arg_721_0 == 1 then
				arg_719_0:Play1101106173(arg_719_1)
			end
		end

		function arg_719_1.onSingleLineUpdate_(arg_722_0)
			local var_722_0 = 0
			local var_722_1 = 0.2

			if var_722_0 < arg_719_1.time_ and arg_719_1.time_ <= var_722_0 + arg_722_0 then
				arg_719_1.talkMaxDuration = 0
				arg_719_1.dialogCg_.alpha = 1

				arg_719_1.dialog_:SetActive(true)
				SetActive(arg_719_1.leftNameGo_, true)

				local var_722_2 = arg_719_1:FormatText(StoryNameCfg[37].name)

				arg_719_1.leftNameTxt_.text = var_722_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_719_1.leftNameTxt_.transform)

				arg_719_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_719_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_719_1:RecordName(arg_719_1.leftNameTxt_.text)
				SetActive(arg_719_1.iconTrs_.gameObject, true)
				arg_719_1.iconController_:SetSelectedState("hero")

				arg_719_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_719_1.callingController_:SetSelectedState("normal")

				local var_722_3 = arg_719_1:GetWordFromCfg(1101106172)
				local var_722_4 = arg_719_1:FormatText(var_722_3.content)

				arg_719_1.text_.text = var_722_4

				LuaForUtil.ClearLinePrefixSymbol(arg_719_1.text_)

				local var_722_5 = 8
				local var_722_6 = utf8.len(var_722_4)
				local var_722_7 = var_722_5 <= 0 and var_722_1 or var_722_1 * (var_722_6 / var_722_5)

				if var_722_7 > 0 and var_722_1 < var_722_7 then
					arg_719_1.talkMaxDuration = var_722_7

					if var_722_7 + var_722_0 > arg_719_1.duration_ then
						arg_719_1.duration_ = var_722_7 + var_722_0
					end
				end

				arg_719_1.text_.text = var_722_4
				arg_719_1.typewritter.percent = 0

				arg_719_1.typewritter:SetDirty()
				arg_719_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb") ~= 0 then
					local var_722_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb") / 1000

					if var_722_8 + var_722_0 > arg_719_1.duration_ then
						arg_719_1.duration_ = var_722_8 + var_722_0
					end

					if var_722_3.prefab_name ~= "" and arg_719_1.actors_[var_722_3.prefab_name] ~= nil then
						local var_722_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_719_1.actors_[var_722_3.prefab_name].transform, "story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb")

						arg_719_1:RecordAudio("1101106172", var_722_9)
						arg_719_1:RecordAudio("1101106172", var_722_9)
					else
						arg_719_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb")
					end

					arg_719_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106172", "story_v_side_new_1101106.awb")
				end

				arg_719_1:RecordContent(arg_719_1.text_.text)
			end

			local var_722_10 = math.max(var_722_1, arg_719_1.talkMaxDuration)

			if var_722_0 <= arg_719_1.time_ and arg_719_1.time_ < var_722_0 + var_722_10 then
				arg_719_1.typewritter.percent = (arg_719_1.time_ - var_722_0) / var_722_10

				arg_719_1.typewritter:SetDirty()
			end

			if arg_719_1.time_ >= var_722_0 + var_722_10 and arg_719_1.time_ < var_722_0 + var_722_10 + arg_722_0 then
				arg_719_1.typewritter.percent = 1

				arg_719_1.typewritter:SetDirty()
				arg_719_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106173 = function(arg_723_0, arg_723_1)
		arg_723_1.time_ = 0
		arg_723_1.frameCnt_ = 0
		arg_723_1.state_ = "playing"
		arg_723_1.curTalkId_ = 1101106173
		arg_723_1.duration_ = 5

		SetActive(arg_723_1.tipsGo_, false)

		function arg_723_1.onSingleLineFinish_()
			arg_723_1.onSingleLineUpdate_ = nil
			arg_723_1.onSingleLineFinish_ = nil
			arg_723_1.state_ = "waiting"
		end

		function arg_723_1.playNext_(arg_725_0)
			if arg_725_0 == 1 then
				arg_723_0:Play1101106174(arg_723_1)
			end
		end

		function arg_723_1.onSingleLineUpdate_(arg_726_0)
			local var_726_0 = 0
			local var_726_1 = 0.55

			if var_726_0 < arg_723_1.time_ and arg_723_1.time_ <= var_726_0 + arg_726_0 then
				arg_723_1.talkMaxDuration = 0
				arg_723_1.dialogCg_.alpha = 1

				arg_723_1.dialog_:SetActive(true)
				SetActive(arg_723_1.leftNameGo_, true)

				local var_726_2 = arg_723_1:FormatText(StoryNameCfg[7].name)

				arg_723_1.leftNameTxt_.text = var_726_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_723_1.leftNameTxt_.transform)

				arg_723_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_723_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_723_1:RecordName(arg_723_1.leftNameTxt_.text)
				SetActive(arg_723_1.iconTrs_.gameObject, false)
				arg_723_1.callingController_:SetSelectedState("normal")

				local var_726_3 = arg_723_1:GetWordFromCfg(1101106173)
				local var_726_4 = arg_723_1:FormatText(var_726_3.content)

				arg_723_1.text_.text = var_726_4

				LuaForUtil.ClearLinePrefixSymbol(arg_723_1.text_)

				local var_726_5 = 22
				local var_726_6 = utf8.len(var_726_4)
				local var_726_7 = var_726_5 <= 0 and var_726_1 or var_726_1 * (var_726_6 / var_726_5)

				if var_726_7 > 0 and var_726_1 < var_726_7 then
					arg_723_1.talkMaxDuration = var_726_7

					if var_726_7 + var_726_0 > arg_723_1.duration_ then
						arg_723_1.duration_ = var_726_7 + var_726_0
					end
				end

				arg_723_1.text_.text = var_726_4
				arg_723_1.typewritter.percent = 0

				arg_723_1.typewritter:SetDirty()
				arg_723_1:ShowNextGo(false)
				arg_723_1:RecordContent(arg_723_1.text_.text)
			end

			local var_726_8 = math.max(var_726_1, arg_723_1.talkMaxDuration)

			if var_726_0 <= arg_723_1.time_ and arg_723_1.time_ < var_726_0 + var_726_8 then
				arg_723_1.typewritter.percent = (arg_723_1.time_ - var_726_0) / var_726_8

				arg_723_1.typewritter:SetDirty()
			end

			if arg_723_1.time_ >= var_726_0 + var_726_8 and arg_723_1.time_ < var_726_0 + var_726_8 + arg_726_0 then
				arg_723_1.typewritter.percent = 1

				arg_723_1.typewritter:SetDirty()
				arg_723_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106174 = function(arg_727_0, arg_727_1)
		arg_727_1.time_ = 0
		arg_727_1.frameCnt_ = 0
		arg_727_1.state_ = "playing"
		arg_727_1.curTalkId_ = 1101106174
		arg_727_1.duration_ = 5

		SetActive(arg_727_1.tipsGo_, false)

		function arg_727_1.onSingleLineFinish_()
			arg_727_1.onSingleLineUpdate_ = nil
			arg_727_1.onSingleLineFinish_ = nil
			arg_727_1.state_ = "waiting"
		end

		function arg_727_1.playNext_(arg_729_0)
			if arg_729_0 == 1 then
				arg_727_0:Play1101106175(arg_727_1)
			end
		end

		function arg_727_1.onSingleLineUpdate_(arg_730_0)
			local var_730_0 = 0
			local var_730_1 = 0.575

			if var_730_0 < arg_727_1.time_ and arg_727_1.time_ <= var_730_0 + arg_730_0 then
				arg_727_1.talkMaxDuration = 0
				arg_727_1.dialogCg_.alpha = 1

				arg_727_1.dialog_:SetActive(true)
				SetActive(arg_727_1.leftNameGo_, true)

				local var_730_2 = arg_727_1:FormatText(StoryNameCfg[7].name)

				arg_727_1.leftNameTxt_.text = var_730_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_727_1.leftNameTxt_.transform)

				arg_727_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_727_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_727_1:RecordName(arg_727_1.leftNameTxt_.text)
				SetActive(arg_727_1.iconTrs_.gameObject, false)
				arg_727_1.callingController_:SetSelectedState("normal")

				local var_730_3 = arg_727_1:GetWordFromCfg(1101106174)
				local var_730_4 = arg_727_1:FormatText(var_730_3.content)

				arg_727_1.text_.text = var_730_4

				LuaForUtil.ClearLinePrefixSymbol(arg_727_1.text_)

				local var_730_5 = 23
				local var_730_6 = utf8.len(var_730_4)
				local var_730_7 = var_730_5 <= 0 and var_730_1 or var_730_1 * (var_730_6 / var_730_5)

				if var_730_7 > 0 and var_730_1 < var_730_7 then
					arg_727_1.talkMaxDuration = var_730_7

					if var_730_7 + var_730_0 > arg_727_1.duration_ then
						arg_727_1.duration_ = var_730_7 + var_730_0
					end
				end

				arg_727_1.text_.text = var_730_4
				arg_727_1.typewritter.percent = 0

				arg_727_1.typewritter:SetDirty()
				arg_727_1:ShowNextGo(false)
				arg_727_1:RecordContent(arg_727_1.text_.text)
			end

			local var_730_8 = math.max(var_730_1, arg_727_1.talkMaxDuration)

			if var_730_0 <= arg_727_1.time_ and arg_727_1.time_ < var_730_0 + var_730_8 then
				arg_727_1.typewritter.percent = (arg_727_1.time_ - var_730_0) / var_730_8

				arg_727_1.typewritter:SetDirty()
			end

			if arg_727_1.time_ >= var_730_0 + var_730_8 and arg_727_1.time_ < var_730_0 + var_730_8 + arg_730_0 then
				arg_727_1.typewritter.percent = 1

				arg_727_1.typewritter:SetDirty()
				arg_727_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106175 = function(arg_731_0, arg_731_1)
		arg_731_1.time_ = 0
		arg_731_1.frameCnt_ = 0
		arg_731_1.state_ = "playing"
		arg_731_1.curTalkId_ = 1101106175
		arg_731_1.duration_ = 3.466

		local var_731_0 = {
			zh = 1.833,
			ja = 3.466
		}
		local var_731_1 = manager.audio:GetLocalizationFlag()

		if var_731_0[var_731_1] ~= nil then
			arg_731_1.duration_ = var_731_0[var_731_1]
		end

		SetActive(arg_731_1.tipsGo_, false)

		function arg_731_1.onSingleLineFinish_()
			arg_731_1.onSingleLineUpdate_ = nil
			arg_731_1.onSingleLineFinish_ = nil
			arg_731_1.state_ = "waiting"
		end

		function arg_731_1.playNext_(arg_733_0)
			if arg_733_0 == 1 then
				arg_731_0:Play1101106176(arg_731_1)
			end
		end

		function arg_731_1.onSingleLineUpdate_(arg_734_0)
			local var_734_0 = 0
			local var_734_1 = 0.125

			if var_734_0 < arg_731_1.time_ and arg_731_1.time_ <= var_734_0 + arg_734_0 then
				arg_731_1.talkMaxDuration = 0
				arg_731_1.dialogCg_.alpha = 1

				arg_731_1.dialog_:SetActive(true)
				SetActive(arg_731_1.leftNameGo_, true)

				local var_734_2 = arg_731_1:FormatText(StoryNameCfg[37].name)

				arg_731_1.leftNameTxt_.text = var_734_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_731_1.leftNameTxt_.transform)

				arg_731_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_731_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_731_1:RecordName(arg_731_1.leftNameTxt_.text)
				SetActive(arg_731_1.iconTrs_.gameObject, true)
				arg_731_1.iconController_:SetSelectedState("hero")

				arg_731_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_731_1.callingController_:SetSelectedState("normal")

				local var_734_3 = arg_731_1:GetWordFromCfg(1101106175)
				local var_734_4 = arg_731_1:FormatText(var_734_3.content)

				arg_731_1.text_.text = var_734_4

				LuaForUtil.ClearLinePrefixSymbol(arg_731_1.text_)

				local var_734_5 = 5
				local var_734_6 = utf8.len(var_734_4)
				local var_734_7 = var_734_5 <= 0 and var_734_1 or var_734_1 * (var_734_6 / var_734_5)

				if var_734_7 > 0 and var_734_1 < var_734_7 then
					arg_731_1.talkMaxDuration = var_734_7

					if var_734_7 + var_734_0 > arg_731_1.duration_ then
						arg_731_1.duration_ = var_734_7 + var_734_0
					end
				end

				arg_731_1.text_.text = var_734_4
				arg_731_1.typewritter.percent = 0

				arg_731_1.typewritter:SetDirty()
				arg_731_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb") ~= 0 then
					local var_734_8 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb") / 1000

					if var_734_8 + var_734_0 > arg_731_1.duration_ then
						arg_731_1.duration_ = var_734_8 + var_734_0
					end

					if var_734_3.prefab_name ~= "" and arg_731_1.actors_[var_734_3.prefab_name] ~= nil then
						local var_734_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_731_1.actors_[var_734_3.prefab_name].transform, "story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb")

						arg_731_1:RecordAudio("1101106175", var_734_9)
						arg_731_1:RecordAudio("1101106175", var_734_9)
					else
						arg_731_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb")
					end

					arg_731_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106175", "story_v_side_new_1101106.awb")
				end

				arg_731_1:RecordContent(arg_731_1.text_.text)
			end

			local var_734_10 = math.max(var_734_1, arg_731_1.talkMaxDuration)

			if var_734_0 <= arg_731_1.time_ and arg_731_1.time_ < var_734_0 + var_734_10 then
				arg_731_1.typewritter.percent = (arg_731_1.time_ - var_734_0) / var_734_10

				arg_731_1.typewritter:SetDirty()
			end

			if arg_731_1.time_ >= var_734_0 + var_734_10 and arg_731_1.time_ < var_734_0 + var_734_10 + arg_734_0 then
				arg_731_1.typewritter.percent = 1

				arg_731_1.typewritter:SetDirty()
				arg_731_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106176 = function(arg_735_0, arg_735_1)
		arg_735_1.time_ = 0
		arg_735_1.frameCnt_ = 0
		arg_735_1.state_ = "playing"
		arg_735_1.curTalkId_ = 1101106176
		arg_735_1.duration_ = 8

		SetActive(arg_735_1.tipsGo_, false)

		function arg_735_1.onSingleLineFinish_()
			arg_735_1.onSingleLineUpdate_ = nil
			arg_735_1.onSingleLineFinish_ = nil
			arg_735_1.state_ = "waiting"
		end

		function arg_735_1.playNext_(arg_737_0)
			if arg_737_0 == 1 then
				arg_735_0:Play1101106177(arg_735_1)
			end
		end

		function arg_735_1.onSingleLineUpdate_(arg_738_0)
			local var_738_0 = 0

			if var_738_0 < arg_735_1.time_ and arg_735_1.time_ <= var_738_0 + arg_738_0 then
				arg_735_1.mask_.enabled = true
				arg_735_1.mask_.raycastTarget = true

				arg_735_1:SetGaussion(false)
			end

			local var_738_1 = 3

			if var_738_0 <= arg_735_1.time_ and arg_735_1.time_ < var_738_0 + var_738_1 then
				local var_738_2 = (arg_735_1.time_ - var_738_0) / var_738_1
				local var_738_3 = Color.New(0, 0, 0)

				var_738_3.a = Mathf.Lerp(1, 0, var_738_2)
				arg_735_1.mask_.color = var_738_3
			end

			if arg_735_1.time_ >= var_738_0 + var_738_1 and arg_735_1.time_ < var_738_0 + var_738_1 + arg_738_0 then
				local var_738_4 = Color.New(0, 0, 0)
				local var_738_5 = 0

				arg_735_1.mask_.enabled = false
				var_738_4.a = var_738_5
				arg_735_1.mask_.color = var_738_4
			end

			local var_738_6 = "R1102"

			if arg_735_1.bgs_[var_738_6] == nil then
				local var_738_7 = Object.Instantiate(arg_735_1.paintGo_)

				var_738_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_738_6)
				var_738_7.name = var_738_6
				var_738_7.transform.parent = arg_735_1.stage_.transform
				var_738_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_735_1.bgs_[var_738_6] = var_738_7
			end

			local var_738_8 = arg_735_1.bgs_.R1102.transform
			local var_738_9 = 0

			if var_738_9 < arg_735_1.time_ and arg_735_1.time_ <= var_738_9 + arg_738_0 then
				arg_735_1.var_.moveOldPosR1102 = var_738_8.localPosition
			end

			local var_738_10 = 0.001

			if var_738_9 <= arg_735_1.time_ and arg_735_1.time_ < var_738_9 + var_738_10 then
				local var_738_11 = (arg_735_1.time_ - var_738_9) / var_738_10
				local var_738_12 = Vector3.New(0, 1, 10)

				var_738_8.localPosition = Vector3.Lerp(arg_735_1.var_.moveOldPosR1102, var_738_12, var_738_11)
			end

			if arg_735_1.time_ >= var_738_9 + var_738_10 and arg_735_1.time_ < var_738_9 + var_738_10 + arg_738_0 then
				var_738_8.localPosition = Vector3.New(0, 1, 10)
			end

			local var_738_13 = arg_735_1.bgs_.R1102.transform
			local var_738_14 = 0.034

			if var_738_14 < arg_735_1.time_ and arg_735_1.time_ <= var_738_14 + arg_738_0 then
				arg_735_1.var_.moveOldPosR1102 = var_738_13.localPosition
			end

			local var_738_15 = 7

			if var_738_14 <= arg_735_1.time_ and arg_735_1.time_ < var_738_14 + var_738_15 then
				local var_738_16 = (arg_735_1.time_ - var_738_14) / var_738_15
				local var_738_17 = Vector3.New(0, 1, 8)

				var_738_13.localPosition = Vector3.Lerp(arg_735_1.var_.moveOldPosR1102, var_738_17, var_738_16)
			end

			if arg_735_1.time_ >= var_738_14 + var_738_15 and arg_735_1.time_ < var_738_14 + var_738_15 + arg_738_0 then
				var_738_13.localPosition = Vector3.New(0, 1, 8)
			end

			local var_738_18 = 3

			if var_738_18 < arg_735_1.time_ and arg_735_1.time_ <= var_738_18 + arg_738_0 then
				arg_735_1.allBtn_.enabled = false
			end

			local var_738_19 = 1.63333333333333

			if arg_735_1.time_ >= var_738_18 + var_738_19 and arg_735_1.time_ < var_738_18 + var_738_19 + arg_738_0 then
				arg_735_1.allBtn_.enabled = true
			end

			if arg_735_1.frameCnt_ <= 1 then
				arg_735_1.dialog_:SetActive(false)
			end

			local var_738_20 = 3
			local var_738_21 = 0.925

			if var_738_20 < arg_735_1.time_ and arg_735_1.time_ <= var_738_20 + arg_738_0 then
				arg_735_1.talkMaxDuration = 0

				arg_735_1.dialog_:SetActive(true)

				local var_738_22 = LeanTween.value(arg_735_1.dialog_, 0, 1, 0.3)

				var_738_22:setOnUpdate(LuaHelper.FloatAction(function(arg_739_0)
					arg_735_1.dialogCg_.alpha = arg_739_0
				end))
				var_738_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_735_1.dialog_)
					var_738_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_735_1.duration_ = arg_735_1.duration_ + 0.3

				SetActive(arg_735_1.leftNameGo_, false)

				arg_735_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_735_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_735_1:RecordName(arg_735_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_735_1.iconTrs_.gameObject, false)
				arg_735_1.callingController_:SetSelectedState("normal")

				local var_738_23 = arg_735_1:GetWordFromCfg(1101106176)
				local var_738_24 = arg_735_1:FormatText(var_738_23.content)

				arg_735_1.text_.text = var_738_24

				LuaForUtil.ClearLinePrefixSymbol(arg_735_1.text_)

				local var_738_25 = 37
				local var_738_26 = utf8.len(var_738_24)
				local var_738_27 = var_738_25 <= 0 and var_738_21 or var_738_21 * (var_738_26 / var_738_25)

				if var_738_27 > 0 and var_738_21 < var_738_27 then
					arg_735_1.talkMaxDuration = var_738_27
					var_738_20 = var_738_20 + 0.3

					if var_738_27 + var_738_20 > arg_735_1.duration_ then
						arg_735_1.duration_ = var_738_27 + var_738_20
					end
				end

				arg_735_1.text_.text = var_738_24
				arg_735_1.typewritter.percent = 0

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(false)
				arg_735_1:RecordContent(arg_735_1.text_.text)
			end

			local var_738_28 = var_738_20 + 0.3
			local var_738_29 = math.max(var_738_21, arg_735_1.talkMaxDuration)

			if var_738_28 <= arg_735_1.time_ and arg_735_1.time_ < var_738_28 + var_738_29 then
				arg_735_1.typewritter.percent = (arg_735_1.time_ - var_738_28) / var_738_29

				arg_735_1.typewritter:SetDirty()
			end

			if arg_735_1.time_ >= var_738_28 + var_738_29 and arg_735_1.time_ < var_738_28 + var_738_29 + arg_738_0 then
				arg_735_1.typewritter.percent = 1

				arg_735_1.typewritter:SetDirty()
				arg_735_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106177 = function(arg_741_0, arg_741_1)
		arg_741_1.time_ = 0
		arg_741_1.frameCnt_ = 0
		arg_741_1.state_ = "playing"
		arg_741_1.curTalkId_ = 1101106177
		arg_741_1.duration_ = 12.999999999999

		SetActive(arg_741_1.tipsGo_, false)

		function arg_741_1.onSingleLineFinish_()
			arg_741_1.onSingleLineUpdate_ = nil
			arg_741_1.onSingleLineFinish_ = nil
			arg_741_1.state_ = "waiting"
		end

		function arg_741_1.playNext_(arg_743_0)
			if arg_743_0 == 1 then
				arg_741_0:Play1101106178(arg_741_1)
			end
		end

		function arg_741_1.onSingleLineUpdate_(arg_744_0)
			local var_744_0 = 0

			if var_744_0 < arg_741_1.time_ and arg_741_1.time_ <= var_744_0 + arg_744_0 then
				arg_741_1.fswbg_:SetActive(true)
				arg_741_1.dialog_:SetActive(false)

				arg_741_1.fswtw_.percent = 0

				local var_744_1 = arg_741_1:GetWordFromCfg(1101106177)
				local var_744_2 = arg_741_1:FormatText(var_744_1.content)

				arg_741_1.fswt_.text = var_744_2

				LuaForUtil.ClearLinePrefixSymbol(arg_741_1.fswt_)

				arg_741_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_741_1.fswtw_:SetDirty()

				arg_741_1.typewritterCharCountI18N = 0

				SetActive(arg_741_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_741_1:ShowNextGo(false)
			end

			local var_744_3 = 0.0166666666666667

			if var_744_3 < arg_741_1.time_ and arg_741_1.time_ <= var_744_3 + arg_744_0 then
				arg_741_1.var_.oldValueTypewriter = arg_741_1.fswtw_.percent

				arg_741_1:ShowNextGo(false)
			end

			local var_744_4 = 50
			local var_744_5 = 3.33333333333333
			local var_744_6 = arg_741_1:GetWordFromCfg(1101106177)
			local var_744_7 = arg_741_1:FormatText(var_744_6.content)
			local var_744_8, var_744_9 = arg_741_1:GetPercentByPara(var_744_7, 1)

			if var_744_3 < arg_741_1.time_ and arg_741_1.time_ <= var_744_3 + arg_744_0 then
				arg_741_1.talkMaxDuration = 0

				local var_744_10 = var_744_4 <= 0 and var_744_5 or var_744_5 * ((var_744_9 - arg_741_1.typewritterCharCountI18N) / var_744_4)

				if var_744_10 > 0 and var_744_5 < var_744_10 then
					arg_741_1.talkMaxDuration = var_744_10

					if var_744_10 + var_744_3 > arg_741_1.duration_ then
						arg_741_1.duration_ = var_744_10 + var_744_3
					end
				end
			end

			local var_744_11 = 3.33333333333333
			local var_744_12 = math.max(var_744_11, arg_741_1.talkMaxDuration)

			if var_744_3 <= arg_741_1.time_ and arg_741_1.time_ < var_744_3 + var_744_12 then
				local var_744_13 = (arg_741_1.time_ - var_744_3) / var_744_12

				arg_741_1.fswtw_.percent = Mathf.Lerp(arg_741_1.var_.oldValueTypewriter, var_744_8, var_744_13)
				arg_741_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_741_1.fswtw_:SetDirty()
			end

			if arg_741_1.time_ >= var_744_3 + var_744_12 and arg_741_1.time_ < var_744_3 + var_744_12 + arg_744_0 then
				arg_741_1.fswtw_.percent = var_744_8

				arg_741_1.fswtw_:SetDirty()
				arg_741_1:ShowNextGo(true)

				arg_741_1.typewritterCharCountI18N = var_744_9
			end

			local var_744_14 = 0

			if var_744_14 < arg_741_1.time_ and arg_741_1.time_ <= var_744_14 + arg_744_0 then
				local var_744_15 = arg_741_1.fswbg_.transform:Find("textbox/adapt/content") or arg_741_1.fswbg_.transform:Find("textbox/content")
				local var_744_16 = var_744_15:GetComponent("Text")
				local var_744_17 = var_744_15:GetComponent("RectTransform")

				var_744_16.alignment = UnityEngine.TextAnchor.UpperLeft
				var_744_17.offsetMin = Vector2.New(0, 0)
				var_744_17.offsetMax = Vector2.New(0, 0)
			end

			local var_744_18 = 0
			local var_744_19 = 13
			local var_744_20 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106177", "story_v_side_new_1101106.awb") / 1000

			if var_744_20 > 0 and var_744_19 < var_744_20 and var_744_20 + var_744_18 > arg_741_1.duration_ then
				local var_744_21 = var_744_20

				arg_741_1.duration_ = var_744_20 + var_744_18
			end

			if var_744_18 < arg_741_1.time_ and arg_741_1.time_ <= var_744_18 + arg_744_0 then
				local var_744_22 = "play"
				local var_744_23 = "voice"

				arg_741_1:AudioAction(var_744_22, var_744_23, "story_v_side_new_1101106", "1101106177", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106178 = function(arg_745_0, arg_745_1)
		arg_745_1.time_ = 0
		arg_745_1.frameCnt_ = 0
		arg_745_1.state_ = "playing"
		arg_745_1.curTalkId_ = 1101106178
		arg_745_1.duration_ = 12.932999999999

		SetActive(arg_745_1.tipsGo_, false)

		function arg_745_1.onSingleLineFinish_()
			arg_745_1.onSingleLineUpdate_ = nil
			arg_745_1.onSingleLineFinish_ = nil
			arg_745_1.state_ = "waiting"
		end

		function arg_745_1.playNext_(arg_747_0)
			if arg_747_0 == 1 then
				arg_745_0:Play1101106179(arg_745_1)
			end
		end

		function arg_745_1.onSingleLineUpdate_(arg_748_0)
			local var_748_0 = 0

			if var_748_0 < arg_745_1.time_ and arg_745_1.time_ <= var_748_0 + arg_748_0 then
				arg_745_1.var_.oldValueTypewriter = arg_745_1.fswtw_.percent

				arg_745_1:ShowNextGo(false)
			end

			local var_748_1 = 53
			local var_748_2 = 3.53333333333333
			local var_748_3 = arg_745_1:GetWordFromCfg(1101106177)
			local var_748_4 = arg_745_1:FormatText(var_748_3.content)
			local var_748_5, var_748_6 = arg_745_1:GetPercentByPara(var_748_4, 2)

			if var_748_0 < arg_745_1.time_ and arg_745_1.time_ <= var_748_0 + arg_748_0 then
				arg_745_1.talkMaxDuration = 0

				local var_748_7 = var_748_1 <= 0 and var_748_2 or var_748_2 * ((var_748_6 - arg_745_1.typewritterCharCountI18N) / var_748_1)

				if var_748_7 > 0 and var_748_2 < var_748_7 then
					arg_745_1.talkMaxDuration = var_748_7

					if var_748_7 + var_748_0 > arg_745_1.duration_ then
						arg_745_1.duration_ = var_748_7 + var_748_0
					end
				end
			end

			local var_748_8 = 3.53333333333333
			local var_748_9 = math.max(var_748_8, arg_745_1.talkMaxDuration)

			if var_748_0 <= arg_745_1.time_ and arg_745_1.time_ < var_748_0 + var_748_9 then
				local var_748_10 = (arg_745_1.time_ - var_748_0) / var_748_9

				arg_745_1.fswtw_.percent = Mathf.Lerp(arg_745_1.var_.oldValueTypewriter, var_748_5, var_748_10)
				arg_745_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_745_1.fswtw_:SetDirty()
			end

			if arg_745_1.time_ >= var_748_0 + var_748_9 and arg_745_1.time_ < var_748_0 + var_748_9 + arg_748_0 then
				arg_745_1.fswtw_.percent = var_748_5

				arg_745_1.fswtw_:SetDirty()
				arg_745_1:ShowNextGo(true)

				arg_745_1.typewritterCharCountI18N = var_748_6
			end

			local var_748_11 = 0
			local var_748_12 = 12.933
			local var_748_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106178", "story_v_side_new_1101106.awb") / 1000

			if var_748_13 > 0 and var_748_12 < var_748_13 and var_748_13 + var_748_11 > arg_745_1.duration_ then
				local var_748_14 = var_748_13

				arg_745_1.duration_ = var_748_13 + var_748_11
			end

			if var_748_11 < arg_745_1.time_ and arg_745_1.time_ <= var_748_11 + arg_748_0 then
				local var_748_15 = "play"
				local var_748_16 = "voice"

				arg_745_1:AudioAction(var_748_15, var_748_16, "story_v_side_new_1101106", "1101106178", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106179 = function(arg_749_0, arg_749_1)
		arg_749_1.time_ = 0
		arg_749_1.frameCnt_ = 0
		arg_749_1.state_ = "playing"
		arg_749_1.curTalkId_ = 1101106179
		arg_749_1.duration_ = 10.465999999999

		SetActive(arg_749_1.tipsGo_, false)

		function arg_749_1.onSingleLineFinish_()
			arg_749_1.onSingleLineUpdate_ = nil
			arg_749_1.onSingleLineFinish_ = nil
			arg_749_1.state_ = "waiting"
		end

		function arg_749_1.playNext_(arg_751_0)
			if arg_751_0 == 1 then
				arg_749_0:Play1101106180(arg_749_1)
			end
		end

		function arg_749_1.onSingleLineUpdate_(arg_752_0)
			local var_752_0 = 0

			if var_752_0 < arg_749_1.time_ and arg_749_1.time_ <= var_752_0 + arg_752_0 then
				arg_749_1.var_.oldValueTypewriter = arg_749_1.fswtw_.percent

				arg_749_1:ShowNextGo(false)
			end

			local var_752_1 = 36
			local var_752_2 = 2.4
			local var_752_3 = arg_749_1:GetWordFromCfg(1101106177)
			local var_752_4 = arg_749_1:FormatText(var_752_3.content)
			local var_752_5, var_752_6 = arg_749_1:GetPercentByPara(var_752_4, 3)

			if var_752_0 < arg_749_1.time_ and arg_749_1.time_ <= var_752_0 + arg_752_0 then
				arg_749_1.talkMaxDuration = 0

				local var_752_7 = var_752_1 <= 0 and var_752_2 or var_752_2 * ((var_752_6 - arg_749_1.typewritterCharCountI18N) / var_752_1)

				if var_752_7 > 0 and var_752_2 < var_752_7 then
					arg_749_1.talkMaxDuration = var_752_7

					if var_752_7 + var_752_0 > arg_749_1.duration_ then
						arg_749_1.duration_ = var_752_7 + var_752_0
					end
				end
			end

			local var_752_8 = 2.4
			local var_752_9 = math.max(var_752_8, arg_749_1.talkMaxDuration)

			if var_752_0 <= arg_749_1.time_ and arg_749_1.time_ < var_752_0 + var_752_9 then
				local var_752_10 = (arg_749_1.time_ - var_752_0) / var_752_9

				arg_749_1.fswtw_.percent = Mathf.Lerp(arg_749_1.var_.oldValueTypewriter, var_752_5, var_752_10)
				arg_749_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_749_1.fswtw_:SetDirty()
			end

			if arg_749_1.time_ >= var_752_0 + var_752_9 and arg_749_1.time_ < var_752_0 + var_752_9 + arg_752_0 then
				arg_749_1.fswtw_.percent = var_752_5

				arg_749_1.fswtw_:SetDirty()
				arg_749_1:ShowNextGo(true)

				arg_749_1.typewritterCharCountI18N = var_752_6
			end

			local var_752_11 = 0
			local var_752_12 = 10.466
			local var_752_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106179", "story_v_side_new_1101106.awb") / 1000

			if var_752_13 > 0 and var_752_12 < var_752_13 and var_752_13 + var_752_11 > arg_749_1.duration_ then
				local var_752_14 = var_752_13

				arg_749_1.duration_ = var_752_13 + var_752_11
			end

			if var_752_11 < arg_749_1.time_ and arg_749_1.time_ <= var_752_11 + arg_752_0 then
				local var_752_15 = "play"
				local var_752_16 = "voice"

				arg_749_1:AudioAction(var_752_15, var_752_16, "story_v_side_new_1101106", "1101106179", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106180 = function(arg_753_0, arg_753_1)
		arg_753_1.time_ = 0
		arg_753_1.frameCnt_ = 0
		arg_753_1.state_ = "playing"
		arg_753_1.curTalkId_ = 1101106180
		arg_753_1.duration_ = 6.399999999999

		SetActive(arg_753_1.tipsGo_, false)

		function arg_753_1.onSingleLineFinish_()
			arg_753_1.onSingleLineUpdate_ = nil
			arg_753_1.onSingleLineFinish_ = nil
			arg_753_1.state_ = "waiting"
		end

		function arg_753_1.playNext_(arg_755_0)
			if arg_755_0 == 1 then
				arg_753_0:Play1101106181(arg_753_1)
			end
		end

		function arg_753_1.onSingleLineUpdate_(arg_756_0)
			local var_756_0 = 0

			if var_756_0 < arg_753_1.time_ and arg_753_1.time_ <= var_756_0 + arg_756_0 then
				arg_753_1.var_.oldValueTypewriter = arg_753_1.fswtw_.percent

				arg_753_1:ShowNextGo(false)
			end

			local var_756_1 = 25
			local var_756_2 = 1.66666666666667
			local var_756_3 = arg_753_1:GetWordFromCfg(1101106177)
			local var_756_4 = arg_753_1:FormatText(var_756_3.content)
			local var_756_5, var_756_6 = arg_753_1:GetPercentByPara(var_756_4, 4)

			if var_756_0 < arg_753_1.time_ and arg_753_1.time_ <= var_756_0 + arg_756_0 then
				arg_753_1.talkMaxDuration = 0

				local var_756_7 = var_756_1 <= 0 and var_756_2 or var_756_2 * ((var_756_6 - arg_753_1.typewritterCharCountI18N) / var_756_1)

				if var_756_7 > 0 and var_756_2 < var_756_7 then
					arg_753_1.talkMaxDuration = var_756_7

					if var_756_7 + var_756_0 > arg_753_1.duration_ then
						arg_753_1.duration_ = var_756_7 + var_756_0
					end
				end
			end

			local var_756_8 = 1.66666666666667
			local var_756_9 = math.max(var_756_8, arg_753_1.talkMaxDuration)

			if var_756_0 <= arg_753_1.time_ and arg_753_1.time_ < var_756_0 + var_756_9 then
				local var_756_10 = (arg_753_1.time_ - var_756_0) / var_756_9

				arg_753_1.fswtw_.percent = Mathf.Lerp(arg_753_1.var_.oldValueTypewriter, var_756_5, var_756_10)
				arg_753_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_753_1.fswtw_:SetDirty()
			end

			if arg_753_1.time_ >= var_756_0 + var_756_9 and arg_753_1.time_ < var_756_0 + var_756_9 + arg_756_0 then
				arg_753_1.fswtw_.percent = var_756_5

				arg_753_1.fswtw_:SetDirty()
				arg_753_1:ShowNextGo(true)

				arg_753_1.typewritterCharCountI18N = var_756_6
			end

			local var_756_11 = 0
			local var_756_12 = 6.4
			local var_756_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106180", "story_v_side_new_1101106.awb") / 1000

			if var_756_13 > 0 and var_756_12 < var_756_13 and var_756_13 + var_756_11 > arg_753_1.duration_ then
				local var_756_14 = var_756_13

				arg_753_1.duration_ = var_756_13 + var_756_11
			end

			if var_756_11 < arg_753_1.time_ and arg_753_1.time_ <= var_756_11 + arg_756_0 then
				local var_756_15 = "play"
				local var_756_16 = "voice"

				arg_753_1:AudioAction(var_756_15, var_756_16, "story_v_side_new_1101106", "1101106180", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106181 = function(arg_757_0, arg_757_1)
		arg_757_1.time_ = 0
		arg_757_1.frameCnt_ = 0
		arg_757_1.state_ = "playing"
		arg_757_1.curTalkId_ = 1101106181
		arg_757_1.duration_ = 11.132999999999

		SetActive(arg_757_1.tipsGo_, false)

		function arg_757_1.onSingleLineFinish_()
			arg_757_1.onSingleLineUpdate_ = nil
			arg_757_1.onSingleLineFinish_ = nil
			arg_757_1.state_ = "waiting"
		end

		function arg_757_1.playNext_(arg_759_0)
			if arg_759_0 == 1 then
				arg_757_0:Play1101106182(arg_757_1)
			end
		end

		function arg_757_1.onSingleLineUpdate_(arg_760_0)
			local var_760_0 = 0

			if var_760_0 < arg_757_1.time_ and arg_757_1.time_ <= var_760_0 + arg_760_0 then
				arg_757_1.var_.oldValueTypewriter = arg_757_1.fswtw_.percent

				arg_757_1:ShowNextGo(false)
			end

			local var_760_1 = 39
			local var_760_2 = 2.6
			local var_760_3 = arg_757_1:GetWordFromCfg(1101106177)
			local var_760_4 = arg_757_1:FormatText(var_760_3.content)
			local var_760_5, var_760_6 = arg_757_1:GetPercentByPara(var_760_4, 5)

			if var_760_0 < arg_757_1.time_ and arg_757_1.time_ <= var_760_0 + arg_760_0 then
				arg_757_1.talkMaxDuration = 0

				local var_760_7 = var_760_1 <= 0 and var_760_2 or var_760_2 * ((var_760_6 - arg_757_1.typewritterCharCountI18N) / var_760_1)

				if var_760_7 > 0 and var_760_2 < var_760_7 then
					arg_757_1.talkMaxDuration = var_760_7

					if var_760_7 + var_760_0 > arg_757_1.duration_ then
						arg_757_1.duration_ = var_760_7 + var_760_0
					end
				end
			end

			local var_760_8 = 2.6
			local var_760_9 = math.max(var_760_8, arg_757_1.talkMaxDuration)

			if var_760_0 <= arg_757_1.time_ and arg_757_1.time_ < var_760_0 + var_760_9 then
				local var_760_10 = (arg_757_1.time_ - var_760_0) / var_760_9

				arg_757_1.fswtw_.percent = Mathf.Lerp(arg_757_1.var_.oldValueTypewriter, var_760_5, var_760_10)
				arg_757_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_757_1.fswtw_:SetDirty()
			end

			if arg_757_1.time_ >= var_760_0 + var_760_9 and arg_757_1.time_ < var_760_0 + var_760_9 + arg_760_0 then
				arg_757_1.fswtw_.percent = var_760_5

				arg_757_1.fswtw_:SetDirty()
				arg_757_1:ShowNextGo(true)

				arg_757_1.typewritterCharCountI18N = var_760_6
			end

			local var_760_11 = 0
			local var_760_12 = 11.133
			local var_760_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106181", "story_v_side_new_1101106.awb") / 1000

			if var_760_13 > 0 and var_760_12 < var_760_13 and var_760_13 + var_760_11 > arg_757_1.duration_ then
				local var_760_14 = var_760_13

				arg_757_1.duration_ = var_760_13 + var_760_11
			end

			if var_760_11 < arg_757_1.time_ and arg_757_1.time_ <= var_760_11 + arg_760_0 then
				local var_760_15 = "play"
				local var_760_16 = "voice"

				arg_757_1:AudioAction(var_760_15, var_760_16, "story_v_side_new_1101106", "1101106181", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106182 = function(arg_761_0, arg_761_1)
		arg_761_1.time_ = 0
		arg_761_1.frameCnt_ = 0
		arg_761_1.state_ = "playing"
		arg_761_1.curTalkId_ = 1101106182
		arg_761_1.duration_ = 6.632999999999

		SetActive(arg_761_1.tipsGo_, false)

		function arg_761_1.onSingleLineFinish_()
			arg_761_1.onSingleLineUpdate_ = nil
			arg_761_1.onSingleLineFinish_ = nil
			arg_761_1.state_ = "waiting"
		end

		function arg_761_1.playNext_(arg_763_0)
			if arg_763_0 == 1 then
				arg_761_0:Play1101106183(arg_761_1)
			end
		end

		function arg_761_1.onSingleLineUpdate_(arg_764_0)
			local var_764_0 = 0

			if var_764_0 < arg_761_1.time_ and arg_761_1.time_ <= var_764_0 + arg_764_0 then
				arg_761_1.var_.oldValueTypewriter = arg_761_1.fswtw_.percent

				arg_761_1:ShowNextGo(false)
			end

			local var_764_1 = 26
			local var_764_2 = 1.73333333333333
			local var_764_3 = arg_761_1:GetWordFromCfg(1101106177)
			local var_764_4 = arg_761_1:FormatText(var_764_3.content)
			local var_764_5, var_764_6 = arg_761_1:GetPercentByPara(var_764_4, 6)

			if var_764_0 < arg_761_1.time_ and arg_761_1.time_ <= var_764_0 + arg_764_0 then
				arg_761_1.talkMaxDuration = 0

				local var_764_7 = var_764_1 <= 0 and var_764_2 or var_764_2 * ((var_764_6 - arg_761_1.typewritterCharCountI18N) / var_764_1)

				if var_764_7 > 0 and var_764_2 < var_764_7 then
					arg_761_1.talkMaxDuration = var_764_7

					if var_764_7 + var_764_0 > arg_761_1.duration_ then
						arg_761_1.duration_ = var_764_7 + var_764_0
					end
				end
			end

			local var_764_8 = 1.73333333333333
			local var_764_9 = math.max(var_764_8, arg_761_1.talkMaxDuration)

			if var_764_0 <= arg_761_1.time_ and arg_761_1.time_ < var_764_0 + var_764_9 then
				local var_764_10 = (arg_761_1.time_ - var_764_0) / var_764_9

				arg_761_1.fswtw_.percent = Mathf.Lerp(arg_761_1.var_.oldValueTypewriter, var_764_5, var_764_10)
				arg_761_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_761_1.fswtw_:SetDirty()
			end

			if arg_761_1.time_ >= var_764_0 + var_764_9 and arg_761_1.time_ < var_764_0 + var_764_9 + arg_764_0 then
				arg_761_1.fswtw_.percent = var_764_5

				arg_761_1.fswtw_:SetDirty()
				arg_761_1:ShowNextGo(true)

				arg_761_1.typewritterCharCountI18N = var_764_6
			end

			local var_764_11 = 0
			local var_764_12 = 6.633
			local var_764_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106182", "story_v_side_new_1101106.awb") / 1000

			if var_764_13 > 0 and var_764_12 < var_764_13 and var_764_13 + var_764_11 > arg_761_1.duration_ then
				local var_764_14 = var_764_13

				arg_761_1.duration_ = var_764_13 + var_764_11
			end

			if var_764_11 < arg_761_1.time_ and arg_761_1.time_ <= var_764_11 + arg_764_0 then
				local var_764_15 = "play"
				local var_764_16 = "voice"

				arg_761_1:AudioAction(var_764_15, var_764_16, "story_v_side_new_1101106", "1101106182", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106183 = function(arg_765_0, arg_765_1)
		arg_765_1.time_ = 0
		arg_765_1.frameCnt_ = 0
		arg_765_1.state_ = "playing"
		arg_765_1.curTalkId_ = 1101106183
		arg_765_1.duration_ = 9.065999999999

		SetActive(arg_765_1.tipsGo_, false)

		function arg_765_1.onSingleLineFinish_()
			arg_765_1.onSingleLineUpdate_ = nil
			arg_765_1.onSingleLineFinish_ = nil
			arg_765_1.state_ = "waiting"
		end

		function arg_765_1.playNext_(arg_767_0)
			if arg_767_0 == 1 then
				arg_765_0:Play1101106184(arg_765_1)
			end
		end

		function arg_765_1.onSingleLineUpdate_(arg_768_0)
			local var_768_0 = 0

			if var_768_0 < arg_765_1.time_ and arg_765_1.time_ <= var_768_0 + arg_768_0 then
				arg_765_1.fswbg_:SetActive(true)
				arg_765_1.dialog_:SetActive(false)

				arg_765_1.fswtw_.percent = 0

				local var_768_1 = arg_765_1:GetWordFromCfg(1101106183)
				local var_768_2 = arg_765_1:FormatText(var_768_1.content)

				arg_765_1.fswt_.text = var_768_2

				LuaForUtil.ClearLinePrefixSymbol(arg_765_1.fswt_)

				arg_765_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_765_1.fswtw_:SetDirty()

				arg_765_1.typewritterCharCountI18N = 0

				SetActive(arg_765_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_765_1:ShowNextGo(false)
			end

			local var_768_3 = 0.0166666666666667

			if var_768_3 < arg_765_1.time_ and arg_765_1.time_ <= var_768_3 + arg_768_0 then
				arg_765_1.var_.oldValueTypewriter = arg_765_1.fswtw_.percent

				arg_765_1:ShowNextGo(false)
			end

			local var_768_4 = 29
			local var_768_5 = 1.93333333333333
			local var_768_6 = arg_765_1:GetWordFromCfg(1101106183)
			local var_768_7 = arg_765_1:FormatText(var_768_6.content)
			local var_768_8, var_768_9 = arg_765_1:GetPercentByPara(var_768_7, 1)

			if var_768_3 < arg_765_1.time_ and arg_765_1.time_ <= var_768_3 + arg_768_0 then
				arg_765_1.talkMaxDuration = 0

				local var_768_10 = var_768_4 <= 0 and var_768_5 or var_768_5 * ((var_768_9 - arg_765_1.typewritterCharCountI18N) / var_768_4)

				if var_768_10 > 0 and var_768_5 < var_768_10 then
					arg_765_1.talkMaxDuration = var_768_10

					if var_768_10 + var_768_3 > arg_765_1.duration_ then
						arg_765_1.duration_ = var_768_10 + var_768_3
					end
				end
			end

			local var_768_11 = 1.93333333333333
			local var_768_12 = math.max(var_768_11, arg_765_1.talkMaxDuration)

			if var_768_3 <= arg_765_1.time_ and arg_765_1.time_ < var_768_3 + var_768_12 then
				local var_768_13 = (arg_765_1.time_ - var_768_3) / var_768_12

				arg_765_1.fswtw_.percent = Mathf.Lerp(arg_765_1.var_.oldValueTypewriter, var_768_8, var_768_13)
				arg_765_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_765_1.fswtw_:SetDirty()
			end

			if arg_765_1.time_ >= var_768_3 + var_768_12 and arg_765_1.time_ < var_768_3 + var_768_12 + arg_768_0 then
				arg_765_1.fswtw_.percent = var_768_8

				arg_765_1.fswtw_:SetDirty()
				arg_765_1:ShowNextGo(true)

				arg_765_1.typewritterCharCountI18N = var_768_9
			end

			local var_768_14 = 0
			local var_768_15 = 9.066
			local var_768_16 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106183", "story_v_side_new_1101106.awb") / 1000

			if var_768_16 > 0 and var_768_15 < var_768_16 and var_768_16 + var_768_14 > arg_765_1.duration_ then
				local var_768_17 = var_768_16

				arg_765_1.duration_ = var_768_16 + var_768_14
			end

			if var_768_14 < arg_765_1.time_ and arg_765_1.time_ <= var_768_14 + arg_768_0 then
				local var_768_18 = "play"
				local var_768_19 = "voice"

				arg_765_1:AudioAction(var_768_18, var_768_19, "story_v_side_new_1101106", "1101106183", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106184 = function(arg_769_0, arg_769_1)
		arg_769_1.time_ = 0
		arg_769_1.frameCnt_ = 0
		arg_769_1.state_ = "playing"
		arg_769_1.curTalkId_ = 1101106184
		arg_769_1.duration_ = 8.532999999999

		SetActive(arg_769_1.tipsGo_, false)

		function arg_769_1.onSingleLineFinish_()
			arg_769_1.onSingleLineUpdate_ = nil
			arg_769_1.onSingleLineFinish_ = nil
			arg_769_1.state_ = "waiting"
		end

		function arg_769_1.playNext_(arg_771_0)
			if arg_771_0 == 1 then
				arg_769_0:Play1101106185(arg_769_1)
			end
		end

		function arg_769_1.onSingleLineUpdate_(arg_772_0)
			local var_772_0 = 0

			if var_772_0 < arg_769_1.time_ and arg_769_1.time_ <= var_772_0 + arg_772_0 then
				arg_769_1.var_.oldValueTypewriter = arg_769_1.fswtw_.percent

				arg_769_1:ShowNextGo(false)
			end

			local var_772_1 = 34
			local var_772_2 = 2.26666666666667
			local var_772_3 = arg_769_1:GetWordFromCfg(1101106183)
			local var_772_4 = arg_769_1:FormatText(var_772_3.content)
			local var_772_5, var_772_6 = arg_769_1:GetPercentByPara(var_772_4, 2)

			if var_772_0 < arg_769_1.time_ and arg_769_1.time_ <= var_772_0 + arg_772_0 then
				arg_769_1.talkMaxDuration = 0

				local var_772_7 = var_772_1 <= 0 and var_772_2 or var_772_2 * ((var_772_6 - arg_769_1.typewritterCharCountI18N) / var_772_1)

				if var_772_7 > 0 and var_772_2 < var_772_7 then
					arg_769_1.talkMaxDuration = var_772_7

					if var_772_7 + var_772_0 > arg_769_1.duration_ then
						arg_769_1.duration_ = var_772_7 + var_772_0
					end
				end
			end

			local var_772_8 = 2.26666666666667
			local var_772_9 = math.max(var_772_8, arg_769_1.talkMaxDuration)

			if var_772_0 <= arg_769_1.time_ and arg_769_1.time_ < var_772_0 + var_772_9 then
				local var_772_10 = (arg_769_1.time_ - var_772_0) / var_772_9

				arg_769_1.fswtw_.percent = Mathf.Lerp(arg_769_1.var_.oldValueTypewriter, var_772_5, var_772_10)
				arg_769_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_769_1.fswtw_:SetDirty()
			end

			if arg_769_1.time_ >= var_772_0 + var_772_9 and arg_769_1.time_ < var_772_0 + var_772_9 + arg_772_0 then
				arg_769_1.fswtw_.percent = var_772_5

				arg_769_1.fswtw_:SetDirty()
				arg_769_1:ShowNextGo(true)

				arg_769_1.typewritterCharCountI18N = var_772_6
			end

			local var_772_11 = 0
			local var_772_12 = 8.533
			local var_772_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106184", "story_v_side_new_1101106.awb") / 1000

			if var_772_13 > 0 and var_772_12 < var_772_13 and var_772_13 + var_772_11 > arg_769_1.duration_ then
				local var_772_14 = var_772_13

				arg_769_1.duration_ = var_772_13 + var_772_11
			end

			if var_772_11 < arg_769_1.time_ and arg_769_1.time_ <= var_772_11 + arg_772_0 then
				local var_772_15 = "play"
				local var_772_16 = "voice"

				arg_769_1:AudioAction(var_772_15, var_772_16, "story_v_side_new_1101106", "1101106184", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106185 = function(arg_773_0, arg_773_1)
		arg_773_1.time_ = 0
		arg_773_1.frameCnt_ = 0
		arg_773_1.state_ = "playing"
		arg_773_1.curTalkId_ = 1101106185
		arg_773_1.duration_ = 4.399999999999

		SetActive(arg_773_1.tipsGo_, false)

		function arg_773_1.onSingleLineFinish_()
			arg_773_1.onSingleLineUpdate_ = nil
			arg_773_1.onSingleLineFinish_ = nil
			arg_773_1.state_ = "waiting"
		end

		function arg_773_1.playNext_(arg_775_0)
			if arg_775_0 == 1 then
				arg_773_0:Play1101106186(arg_773_1)
			end
		end

		function arg_773_1.onSingleLineUpdate_(arg_776_0)
			local var_776_0 = 0

			if var_776_0 < arg_773_1.time_ and arg_773_1.time_ <= var_776_0 + arg_776_0 then
				arg_773_1.var_.oldValueTypewriter = arg_773_1.fswtw_.percent

				arg_773_1:ShowNextGo(false)
			end

			local var_776_1 = 20
			local var_776_2 = 1.33333333333333
			local var_776_3 = arg_773_1:GetWordFromCfg(1101106183)
			local var_776_4 = arg_773_1:FormatText(var_776_3.content)
			local var_776_5, var_776_6 = arg_773_1:GetPercentByPara(var_776_4, 3)

			if var_776_0 < arg_773_1.time_ and arg_773_1.time_ <= var_776_0 + arg_776_0 then
				arg_773_1.talkMaxDuration = 0

				local var_776_7 = var_776_1 <= 0 and var_776_2 or var_776_2 * ((var_776_6 - arg_773_1.typewritterCharCountI18N) / var_776_1)

				if var_776_7 > 0 and var_776_2 < var_776_7 then
					arg_773_1.talkMaxDuration = var_776_7

					if var_776_7 + var_776_0 > arg_773_1.duration_ then
						arg_773_1.duration_ = var_776_7 + var_776_0
					end
				end
			end

			local var_776_8 = 1.33333333333333
			local var_776_9 = math.max(var_776_8, arg_773_1.talkMaxDuration)

			if var_776_0 <= arg_773_1.time_ and arg_773_1.time_ < var_776_0 + var_776_9 then
				local var_776_10 = (arg_773_1.time_ - var_776_0) / var_776_9

				arg_773_1.fswtw_.percent = Mathf.Lerp(arg_773_1.var_.oldValueTypewriter, var_776_5, var_776_10)
				arg_773_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_773_1.fswtw_:SetDirty()
			end

			if arg_773_1.time_ >= var_776_0 + var_776_9 and arg_773_1.time_ < var_776_0 + var_776_9 + arg_776_0 then
				arg_773_1.fswtw_.percent = var_776_5

				arg_773_1.fswtw_:SetDirty()
				arg_773_1:ShowNextGo(true)

				arg_773_1.typewritterCharCountI18N = var_776_6
			end

			local var_776_11 = 0
			local var_776_12 = 4.4
			local var_776_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106185", "story_v_side_new_1101106.awb") / 1000

			if var_776_13 > 0 and var_776_12 < var_776_13 and var_776_13 + var_776_11 > arg_773_1.duration_ then
				local var_776_14 = var_776_13

				arg_773_1.duration_ = var_776_13 + var_776_11
			end

			if var_776_11 < arg_773_1.time_ and arg_773_1.time_ <= var_776_11 + arg_776_0 then
				local var_776_15 = "play"
				local var_776_16 = "voice"

				arg_773_1:AudioAction(var_776_15, var_776_16, "story_v_side_new_1101106", "1101106185", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106186 = function(arg_777_0, arg_777_1)
		arg_777_1.time_ = 0
		arg_777_1.frameCnt_ = 0
		arg_777_1.state_ = "playing"
		arg_777_1.curTalkId_ = 1101106186
		arg_777_1.duration_ = 4.265999999999

		SetActive(arg_777_1.tipsGo_, false)

		function arg_777_1.onSingleLineFinish_()
			arg_777_1.onSingleLineUpdate_ = nil
			arg_777_1.onSingleLineFinish_ = nil
			arg_777_1.state_ = "waiting"
		end

		function arg_777_1.playNext_(arg_779_0)
			if arg_779_0 == 1 then
				arg_777_0:Play1101106187(arg_777_1)
			end
		end

		function arg_777_1.onSingleLineUpdate_(arg_780_0)
			local var_780_0 = 0

			if var_780_0 < arg_777_1.time_ and arg_777_1.time_ <= var_780_0 + arg_780_0 then
				arg_777_1.var_.oldValueTypewriter = arg_777_1.fswtw_.percent

				arg_777_1:ShowNextGo(false)
			end

			local var_780_1 = 18
			local var_780_2 = 1.2
			local var_780_3 = arg_777_1:GetWordFromCfg(1101106183)
			local var_780_4 = arg_777_1:FormatText(var_780_3.content)
			local var_780_5, var_780_6 = arg_777_1:GetPercentByPara(var_780_4, 4)

			if var_780_0 < arg_777_1.time_ and arg_777_1.time_ <= var_780_0 + arg_780_0 then
				arg_777_1.talkMaxDuration = 0

				local var_780_7 = var_780_1 <= 0 and var_780_2 or var_780_2 * ((var_780_6 - arg_777_1.typewritterCharCountI18N) / var_780_1)

				if var_780_7 > 0 and var_780_2 < var_780_7 then
					arg_777_1.talkMaxDuration = var_780_7

					if var_780_7 + var_780_0 > arg_777_1.duration_ then
						arg_777_1.duration_ = var_780_7 + var_780_0
					end
				end
			end

			local var_780_8 = 1.2
			local var_780_9 = math.max(var_780_8, arg_777_1.talkMaxDuration)

			if var_780_0 <= arg_777_1.time_ and arg_777_1.time_ < var_780_0 + var_780_9 then
				local var_780_10 = (arg_777_1.time_ - var_780_0) / var_780_9

				arg_777_1.fswtw_.percent = Mathf.Lerp(arg_777_1.var_.oldValueTypewriter, var_780_5, var_780_10)
				arg_777_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_777_1.fswtw_:SetDirty()
			end

			if arg_777_1.time_ >= var_780_0 + var_780_9 and arg_777_1.time_ < var_780_0 + var_780_9 + arg_780_0 then
				arg_777_1.fswtw_.percent = var_780_5

				arg_777_1.fswtw_:SetDirty()
				arg_777_1:ShowNextGo(true)

				arg_777_1.typewritterCharCountI18N = var_780_6
			end

			local var_780_11 = 0
			local var_780_12 = 4.266
			local var_780_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106186", "story_v_side_new_1101106.awb") / 1000

			if var_780_13 > 0 and var_780_12 < var_780_13 and var_780_13 + var_780_11 > arg_777_1.duration_ then
				local var_780_14 = var_780_13

				arg_777_1.duration_ = var_780_13 + var_780_11
			end

			if var_780_11 < arg_777_1.time_ and arg_777_1.time_ <= var_780_11 + arg_780_0 then
				local var_780_15 = "play"
				local var_780_16 = "voice"

				arg_777_1:AudioAction(var_780_15, var_780_16, "story_v_side_new_1101106", "1101106186", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106187 = function(arg_781_0, arg_781_1)
		arg_781_1.time_ = 0
		arg_781_1.frameCnt_ = 0
		arg_781_1.state_ = "playing"
		arg_781_1.curTalkId_ = 1101106187
		arg_781_1.duration_ = 5.132999999999

		SetActive(arg_781_1.tipsGo_, false)

		function arg_781_1.onSingleLineFinish_()
			arg_781_1.onSingleLineUpdate_ = nil
			arg_781_1.onSingleLineFinish_ = nil
			arg_781_1.state_ = "waiting"
		end

		function arg_781_1.playNext_(arg_783_0)
			if arg_783_0 == 1 then
				arg_781_0:Play1101106188(arg_781_1)
			end
		end

		function arg_781_1.onSingleLineUpdate_(arg_784_0)
			local var_784_0 = 0

			if var_784_0 < arg_781_1.time_ and arg_781_1.time_ <= var_784_0 + arg_784_0 then
				arg_781_1.var_.oldValueTypewriter = arg_781_1.fswtw_.percent

				arg_781_1:ShowNextGo(false)
			end

			local var_784_1 = 17
			local var_784_2 = 1.13333333333333
			local var_784_3 = arg_781_1:GetWordFromCfg(1101106183)
			local var_784_4 = arg_781_1:FormatText(var_784_3.content)
			local var_784_5, var_784_6 = arg_781_1:GetPercentByPara(var_784_4, 5)

			if var_784_0 < arg_781_1.time_ and arg_781_1.time_ <= var_784_0 + arg_784_0 then
				arg_781_1.talkMaxDuration = 0

				local var_784_7 = var_784_1 <= 0 and var_784_2 or var_784_2 * ((var_784_6 - arg_781_1.typewritterCharCountI18N) / var_784_1)

				if var_784_7 > 0 and var_784_2 < var_784_7 then
					arg_781_1.talkMaxDuration = var_784_7

					if var_784_7 + var_784_0 > arg_781_1.duration_ then
						arg_781_1.duration_ = var_784_7 + var_784_0
					end
				end
			end

			local var_784_8 = 1.13333333333333
			local var_784_9 = math.max(var_784_8, arg_781_1.talkMaxDuration)

			if var_784_0 <= arg_781_1.time_ and arg_781_1.time_ < var_784_0 + var_784_9 then
				local var_784_10 = (arg_781_1.time_ - var_784_0) / var_784_9

				arg_781_1.fswtw_.percent = Mathf.Lerp(arg_781_1.var_.oldValueTypewriter, var_784_5, var_784_10)
				arg_781_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_781_1.fswtw_:SetDirty()
			end

			if arg_781_1.time_ >= var_784_0 + var_784_9 and arg_781_1.time_ < var_784_0 + var_784_9 + arg_784_0 then
				arg_781_1.fswtw_.percent = var_784_5

				arg_781_1.fswtw_:SetDirty()
				arg_781_1:ShowNextGo(true)

				arg_781_1.typewritterCharCountI18N = var_784_6
			end

			local var_784_11 = 0
			local var_784_12 = 5.133
			local var_784_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106187", "story_v_side_new_1101106.awb") / 1000

			if var_784_13 > 0 and var_784_12 < var_784_13 and var_784_13 + var_784_11 > arg_781_1.duration_ then
				local var_784_14 = var_784_13

				arg_781_1.duration_ = var_784_13 + var_784_11
			end

			if var_784_11 < arg_781_1.time_ and arg_781_1.time_ <= var_784_11 + arg_784_0 then
				local var_784_15 = "play"
				local var_784_16 = "voice"

				arg_781_1:AudioAction(var_784_15, var_784_16, "story_v_side_new_1101106", "1101106187", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106188 = function(arg_785_0, arg_785_1)
		arg_785_1.time_ = 0
		arg_785_1.frameCnt_ = 0
		arg_785_1.state_ = "playing"
		arg_785_1.curTalkId_ = 1101106188
		arg_785_1.duration_ = 9.965999999999

		SetActive(arg_785_1.tipsGo_, false)

		function arg_785_1.onSingleLineFinish_()
			arg_785_1.onSingleLineUpdate_ = nil
			arg_785_1.onSingleLineFinish_ = nil
			arg_785_1.state_ = "waiting"
		end

		function arg_785_1.playNext_(arg_787_0)
			if arg_787_0 == 1 then
				arg_785_0:Play1101106189(arg_785_1)
			end
		end

		function arg_785_1.onSingleLineUpdate_(arg_788_0)
			local var_788_0 = 0

			if var_788_0 < arg_785_1.time_ and arg_785_1.time_ <= var_788_0 + arg_788_0 then
				arg_785_1.var_.oldValueTypewriter = arg_785_1.fswtw_.percent

				arg_785_1:ShowNextGo(false)
			end

			local var_788_1 = 27
			local var_788_2 = 1.8
			local var_788_3 = arg_785_1:GetWordFromCfg(1101106183)
			local var_788_4 = arg_785_1:FormatText(var_788_3.content)
			local var_788_5, var_788_6 = arg_785_1:GetPercentByPara(var_788_4, 6)

			if var_788_0 < arg_785_1.time_ and arg_785_1.time_ <= var_788_0 + arg_788_0 then
				arg_785_1.talkMaxDuration = 0

				local var_788_7 = var_788_1 <= 0 and var_788_2 or var_788_2 * ((var_788_6 - arg_785_1.typewritterCharCountI18N) / var_788_1)

				if var_788_7 > 0 and var_788_2 < var_788_7 then
					arg_785_1.talkMaxDuration = var_788_7

					if var_788_7 + var_788_0 > arg_785_1.duration_ then
						arg_785_1.duration_ = var_788_7 + var_788_0
					end
				end
			end

			local var_788_8 = 1.8
			local var_788_9 = math.max(var_788_8, arg_785_1.talkMaxDuration)

			if var_788_0 <= arg_785_1.time_ and arg_785_1.time_ < var_788_0 + var_788_9 then
				local var_788_10 = (arg_785_1.time_ - var_788_0) / var_788_9

				arg_785_1.fswtw_.percent = Mathf.Lerp(arg_785_1.var_.oldValueTypewriter, var_788_5, var_788_10)
				arg_785_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_785_1.fswtw_:SetDirty()
			end

			if arg_785_1.time_ >= var_788_0 + var_788_9 and arg_785_1.time_ < var_788_0 + var_788_9 + arg_788_0 then
				arg_785_1.fswtw_.percent = var_788_5

				arg_785_1.fswtw_:SetDirty()
				arg_785_1:ShowNextGo(true)

				arg_785_1.typewritterCharCountI18N = var_788_6
			end

			local var_788_11 = 0
			local var_788_12 = 9.966
			local var_788_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106188", "story_v_side_new_1101106.awb") / 1000

			if var_788_13 > 0 and var_788_12 < var_788_13 and var_788_13 + var_788_11 > arg_785_1.duration_ then
				local var_788_14 = var_788_13

				arg_785_1.duration_ = var_788_13 + var_788_11
			end

			if var_788_11 < arg_785_1.time_ and arg_785_1.time_ <= var_788_11 + arg_788_0 then
				local var_788_15 = "play"
				local var_788_16 = "voice"

				arg_785_1:AudioAction(var_788_15, var_788_16, "story_v_side_new_1101106", "1101106188", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106189 = function(arg_789_0, arg_789_1)
		arg_789_1.time_ = 0
		arg_789_1.frameCnt_ = 0
		arg_789_1.state_ = "playing"
		arg_789_1.curTalkId_ = 1101106189
		arg_789_1.duration_ = 4.599999999999

		SetActive(arg_789_1.tipsGo_, false)

		function arg_789_1.onSingleLineFinish_()
			arg_789_1.onSingleLineUpdate_ = nil
			arg_789_1.onSingleLineFinish_ = nil
			arg_789_1.state_ = "waiting"
		end

		function arg_789_1.playNext_(arg_791_0)
			if arg_791_0 == 1 then
				arg_789_0:Play1101106190(arg_789_1)
			end
		end

		function arg_789_1.onSingleLineUpdate_(arg_792_0)
			local var_792_0 = 0

			if var_792_0 < arg_789_1.time_ and arg_789_1.time_ <= var_792_0 + arg_792_0 then
				arg_789_1.var_.oldValueTypewriter = arg_789_1.fswtw_.percent

				arg_789_1:ShowNextGo(false)
			end

			local var_792_1 = 10
			local var_792_2 = 0.666666666666667
			local var_792_3 = arg_789_1:GetWordFromCfg(1101106183)
			local var_792_4 = arg_789_1:FormatText(var_792_3.content)
			local var_792_5, var_792_6 = arg_789_1:GetPercentByPara(var_792_4, 7)

			if var_792_0 < arg_789_1.time_ and arg_789_1.time_ <= var_792_0 + arg_792_0 then
				arg_789_1.talkMaxDuration = 0

				local var_792_7 = var_792_1 <= 0 and var_792_2 or var_792_2 * ((var_792_6 - arg_789_1.typewritterCharCountI18N) / var_792_1)

				if var_792_7 > 0 and var_792_2 < var_792_7 then
					arg_789_1.talkMaxDuration = var_792_7

					if var_792_7 + var_792_0 > arg_789_1.duration_ then
						arg_789_1.duration_ = var_792_7 + var_792_0
					end
				end
			end

			local var_792_8 = 0.666666666666667
			local var_792_9 = math.max(var_792_8, arg_789_1.talkMaxDuration)

			if var_792_0 <= arg_789_1.time_ and arg_789_1.time_ < var_792_0 + var_792_9 then
				local var_792_10 = (arg_789_1.time_ - var_792_0) / var_792_9

				arg_789_1.fswtw_.percent = Mathf.Lerp(arg_789_1.var_.oldValueTypewriter, var_792_5, var_792_10)
				arg_789_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_789_1.fswtw_:SetDirty()
			end

			if arg_789_1.time_ >= var_792_0 + var_792_9 and arg_789_1.time_ < var_792_0 + var_792_9 + arg_792_0 then
				arg_789_1.fswtw_.percent = var_792_5

				arg_789_1.fswtw_:SetDirty()
				arg_789_1:ShowNextGo(true)

				arg_789_1.typewritterCharCountI18N = var_792_6
			end

			local var_792_11 = 0
			local var_792_12 = 4.6
			local var_792_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106189", "story_v_side_new_1101106.awb") / 1000

			if var_792_13 > 0 and var_792_12 < var_792_13 and var_792_13 + var_792_11 > arg_789_1.duration_ then
				local var_792_14 = var_792_13

				arg_789_1.duration_ = var_792_13 + var_792_11
			end

			if var_792_11 < arg_789_1.time_ and arg_789_1.time_ <= var_792_11 + arg_792_0 then
				local var_792_15 = "play"
				local var_792_16 = "voice"

				arg_789_1:AudioAction(var_792_15, var_792_16, "story_v_side_new_1101106", "1101106189", "story_v_side_new_1101106.awb")
			end
		end
	end,
	Play1101106190 = function(arg_793_0, arg_793_1)
		arg_793_1.time_ = 0
		arg_793_1.frameCnt_ = 0
		arg_793_1.state_ = "playing"
		arg_793_1.curTalkId_ = 1101106190
		arg_793_1.duration_ = 13

		SetActive(arg_793_1.tipsGo_, false)

		function arg_793_1.onSingleLineFinish_()
			arg_793_1.onSingleLineUpdate_ = nil
			arg_793_1.onSingleLineFinish_ = nil
			arg_793_1.state_ = "waiting"
		end

		function arg_793_1.playNext_(arg_795_0)
			if arg_795_0 == 1 then
				arg_793_0:Play1101106191(arg_793_1)
			end
		end

		function arg_793_1.onSingleLineUpdate_(arg_796_0)
			local var_796_0 = 4

			if var_796_0 < arg_793_1.time_ and arg_793_1.time_ <= var_796_0 + arg_796_0 then
				local var_796_1 = manager.ui.mainCamera.transform.localPosition
				local var_796_2 = Vector3.New(0, 0, 10) + Vector3.New(var_796_1.x, var_796_1.y, 0)
				local var_796_3 = arg_793_1.bgs_.I06

				var_796_3.transform.localPosition = var_796_2
				var_796_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_796_4 = var_796_3:GetComponent("SpriteRenderer")

				if var_796_4 and var_796_4.sprite then
					local var_796_5 = (var_796_3.transform.localPosition - var_796_1).z
					local var_796_6 = manager.ui.mainCameraCom_
					local var_796_7 = 2 * var_796_5 * Mathf.Tan(var_796_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_796_8 = var_796_7 * var_796_6.aspect
					local var_796_9 = var_796_4.sprite.bounds.size.x
					local var_796_10 = var_796_4.sprite.bounds.size.y
					local var_796_11 = var_796_8 / var_796_9
					local var_796_12 = var_796_7 / var_796_10
					local var_796_13 = var_796_12 < var_796_11 and var_796_11 or var_796_12

					var_796_3.transform.localScale = Vector3.New(var_796_13, var_796_13, 0)
				end

				for iter_796_0, iter_796_1 in pairs(arg_793_1.bgs_) do
					if iter_796_0 ~= "I06" then
						iter_796_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_796_14 = 0

			if var_796_14 < arg_793_1.time_ and arg_793_1.time_ <= var_796_14 + arg_796_0 then
				arg_793_1.mask_.enabled = true
				arg_793_1.mask_.raycastTarget = true

				arg_793_1:SetGaussion(false)
			end

			local var_796_15 = 4

			if var_796_14 <= arg_793_1.time_ and arg_793_1.time_ < var_796_14 + var_796_15 then
				local var_796_16 = (arg_793_1.time_ - var_796_14) / var_796_15
				local var_796_17 = Color.New(0, 0, 0)

				var_796_17.a = Mathf.Lerp(0, 1, var_796_16)
				arg_793_1.mask_.color = var_796_17
			end

			if arg_793_1.time_ >= var_796_14 + var_796_15 and arg_793_1.time_ < var_796_14 + var_796_15 + arg_796_0 then
				local var_796_18 = Color.New(0, 0, 0)

				var_796_18.a = 1
				arg_793_1.mask_.color = var_796_18
			end

			local var_796_19 = 4

			if var_796_19 < arg_793_1.time_ and arg_793_1.time_ <= var_796_19 + arg_796_0 then
				arg_793_1.mask_.enabled = true
				arg_793_1.mask_.raycastTarget = true

				arg_793_1:SetGaussion(false)
			end

			local var_796_20 = 4

			if var_796_19 <= arg_793_1.time_ and arg_793_1.time_ < var_796_19 + var_796_20 then
				local var_796_21 = (arg_793_1.time_ - var_796_19) / var_796_20
				local var_796_22 = Color.New(0, 0, 0)

				var_796_22.a = Mathf.Lerp(1, 0, var_796_21)
				arg_793_1.mask_.color = var_796_22
			end

			if arg_793_1.time_ >= var_796_19 + var_796_20 and arg_793_1.time_ < var_796_19 + var_796_20 + arg_796_0 then
				local var_796_23 = Color.New(0, 0, 0)
				local var_796_24 = 0

				arg_793_1.mask_.enabled = false
				var_796_23.a = var_796_24
				arg_793_1.mask_.color = var_796_23
			end

			local var_796_25 = arg_793_1.actors_["1011ui_story"].transform
			local var_796_26 = 8

			if var_796_26 < arg_793_1.time_ and arg_793_1.time_ <= var_796_26 + arg_796_0 then
				arg_793_1.var_.moveOldPos1011ui_story = var_796_25.localPosition
			end

			local var_796_27 = 0.001

			if var_796_26 <= arg_793_1.time_ and arg_793_1.time_ < var_796_26 + var_796_27 then
				local var_796_28 = (arg_793_1.time_ - var_796_26) / var_796_27
				local var_796_29 = Vector3.New(0, -0.71, -6)

				var_796_25.localPosition = Vector3.Lerp(arg_793_1.var_.moveOldPos1011ui_story, var_796_29, var_796_28)

				local var_796_30 = manager.ui.mainCamera.transform.position - var_796_25.position

				var_796_25.forward = Vector3.New(var_796_30.x, var_796_30.y, var_796_30.z)

				local var_796_31 = var_796_25.localEulerAngles

				var_796_31.z = 0
				var_796_31.x = 0
				var_796_25.localEulerAngles = var_796_31
			end

			if arg_793_1.time_ >= var_796_26 + var_796_27 and arg_793_1.time_ < var_796_26 + var_796_27 + arg_796_0 then
				var_796_25.localPosition = Vector3.New(0, -0.71, -6)

				local var_796_32 = manager.ui.mainCamera.transform.position - var_796_25.position

				var_796_25.forward = Vector3.New(var_796_32.x, var_796_32.y, var_796_32.z)

				local var_796_33 = var_796_25.localEulerAngles

				var_796_33.z = 0
				var_796_33.x = 0
				var_796_25.localEulerAngles = var_796_33
			end

			local var_796_34 = arg_793_1.actors_["1011ui_story"]
			local var_796_35 = 8

			if var_796_35 < arg_793_1.time_ and arg_793_1.time_ <= var_796_35 + arg_796_0 and arg_793_1.var_.characterEffect1011ui_story == nil then
				arg_793_1.var_.characterEffect1011ui_story = var_796_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_796_36 = 0.200000002980232

			if var_796_35 <= arg_793_1.time_ and arg_793_1.time_ < var_796_35 + var_796_36 then
				local var_796_37 = (arg_793_1.time_ - var_796_35) / var_796_36

				if arg_793_1.var_.characterEffect1011ui_story then
					arg_793_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_793_1.time_ >= var_796_35 + var_796_36 and arg_793_1.time_ < var_796_35 + var_796_36 + arg_796_0 and arg_793_1.var_.characterEffect1011ui_story then
				arg_793_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_796_38 = 2

			if var_796_38 < arg_793_1.time_ and arg_793_1.time_ <= var_796_38 + arg_796_0 then
				arg_793_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_796_39 = 8

			if var_796_39 < arg_793_1.time_ and arg_793_1.time_ <= var_796_39 + arg_796_0 then
				arg_793_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_796_40 = 4

			if var_796_40 < arg_793_1.time_ and arg_793_1.time_ <= var_796_40 + arg_796_0 then
				arg_793_1.fswbg_:SetActive(false)
				arg_793_1.dialog_:SetActive(false)
				arg_793_1:ShowNextGo(false)
			end

			if arg_793_1.frameCnt_ <= 1 then
				arg_793_1.dialog_:SetActive(false)
			end

			local var_796_41 = 8
			local var_796_42 = 0.1

			if var_796_41 < arg_793_1.time_ and arg_793_1.time_ <= var_796_41 + arg_796_0 then
				arg_793_1.talkMaxDuration = 0

				arg_793_1.dialog_:SetActive(true)

				local var_796_43 = LeanTween.value(arg_793_1.dialog_, 0, 1, 0.3)

				var_796_43:setOnUpdate(LuaHelper.FloatAction(function(arg_797_0)
					arg_793_1.dialogCg_.alpha = arg_797_0
				end))
				var_796_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_793_1.dialog_)
					var_796_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_793_1.duration_ = arg_793_1.duration_ + 0.3

				SetActive(arg_793_1.leftNameGo_, true)

				local var_796_44 = arg_793_1:FormatText(StoryNameCfg[7].name)

				arg_793_1.leftNameTxt_.text = var_796_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_793_1.leftNameTxt_.transform)

				arg_793_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_793_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_793_1:RecordName(arg_793_1.leftNameTxt_.text)
				SetActive(arg_793_1.iconTrs_.gameObject, false)
				arg_793_1.callingController_:SetSelectedState("normal")

				local var_796_45 = arg_793_1:GetWordFromCfg(1101106190)
				local var_796_46 = arg_793_1:FormatText(var_796_45.content)

				arg_793_1.text_.text = var_796_46

				LuaForUtil.ClearLinePrefixSymbol(arg_793_1.text_)

				local var_796_47 = 4
				local var_796_48 = utf8.len(var_796_46)
				local var_796_49 = var_796_47 <= 0 and var_796_42 or var_796_42 * (var_796_48 / var_796_47)

				if var_796_49 > 0 and var_796_42 < var_796_49 then
					arg_793_1.talkMaxDuration = var_796_49
					var_796_41 = var_796_41 + 0.3

					if var_796_49 + var_796_41 > arg_793_1.duration_ then
						arg_793_1.duration_ = var_796_49 + var_796_41
					end
				end

				arg_793_1.text_.text = var_796_46
				arg_793_1.typewritter.percent = 0

				arg_793_1.typewritter:SetDirty()
				arg_793_1:ShowNextGo(false)
				arg_793_1:RecordContent(arg_793_1.text_.text)
			end

			local var_796_50 = var_796_41 + 0.3
			local var_796_51 = math.max(var_796_42, arg_793_1.talkMaxDuration)

			if var_796_50 <= arg_793_1.time_ and arg_793_1.time_ < var_796_50 + var_796_51 then
				arg_793_1.typewritter.percent = (arg_793_1.time_ - var_796_50) / var_796_51

				arg_793_1.typewritter:SetDirty()
			end

			if arg_793_1.time_ >= var_796_50 + var_796_51 and arg_793_1.time_ < var_796_50 + var_796_51 + arg_796_0 then
				arg_793_1.typewritter.percent = 1

				arg_793_1.typewritter:SetDirty()
				arg_793_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106191 = function(arg_799_0, arg_799_1)
		arg_799_1.time_ = 0
		arg_799_1.frameCnt_ = 0
		arg_799_1.state_ = "playing"
		arg_799_1.curTalkId_ = 1101106191
		arg_799_1.duration_ = 5

		SetActive(arg_799_1.tipsGo_, false)

		function arg_799_1.onSingleLineFinish_()
			arg_799_1.onSingleLineUpdate_ = nil
			arg_799_1.onSingleLineFinish_ = nil
			arg_799_1.state_ = "waiting"
		end

		function arg_799_1.playNext_(arg_801_0)
			if arg_801_0 == 1 then
				arg_799_0:Play1101106192(arg_799_1)
			end
		end

		function arg_799_1.onSingleLineUpdate_(arg_802_0)
			local var_802_0 = arg_799_1.actors_["1011ui_story"]
			local var_802_1 = 0

			if var_802_1 < arg_799_1.time_ and arg_799_1.time_ <= var_802_1 + arg_802_0 and arg_799_1.var_.characterEffect1011ui_story == nil then
				arg_799_1.var_.characterEffect1011ui_story = var_802_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_802_2 = 0.200000002980232

			if var_802_1 <= arg_799_1.time_ and arg_799_1.time_ < var_802_1 + var_802_2 then
				local var_802_3 = (arg_799_1.time_ - var_802_1) / var_802_2

				if arg_799_1.var_.characterEffect1011ui_story then
					local var_802_4 = Mathf.Lerp(0, 0.5, var_802_3)

					arg_799_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_799_1.var_.characterEffect1011ui_story.fillRatio = var_802_4
				end
			end

			if arg_799_1.time_ >= var_802_1 + var_802_2 and arg_799_1.time_ < var_802_1 + var_802_2 + arg_802_0 and arg_799_1.var_.characterEffect1011ui_story then
				local var_802_5 = 0.5

				arg_799_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_799_1.var_.characterEffect1011ui_story.fillRatio = var_802_5
			end

			local var_802_6 = 0
			local var_802_7 = 0.425

			if var_802_6 < arg_799_1.time_ and arg_799_1.time_ <= var_802_6 + arg_802_0 then
				arg_799_1.talkMaxDuration = 0
				arg_799_1.dialogCg_.alpha = 1

				arg_799_1.dialog_:SetActive(true)
				SetActive(arg_799_1.leftNameGo_, false)

				arg_799_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_799_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_799_1:RecordName(arg_799_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_799_1.iconTrs_.gameObject, false)
				arg_799_1.callingController_:SetSelectedState("normal")

				local var_802_8 = arg_799_1:GetWordFromCfg(1101106191)
				local var_802_9 = arg_799_1:FormatText(var_802_8.content)

				arg_799_1.text_.text = var_802_9

				LuaForUtil.ClearLinePrefixSymbol(arg_799_1.text_)

				local var_802_10 = 17
				local var_802_11 = utf8.len(var_802_9)
				local var_802_12 = var_802_10 <= 0 and var_802_7 or var_802_7 * (var_802_11 / var_802_10)

				if var_802_12 > 0 and var_802_7 < var_802_12 then
					arg_799_1.talkMaxDuration = var_802_12

					if var_802_12 + var_802_6 > arg_799_1.duration_ then
						arg_799_1.duration_ = var_802_12 + var_802_6
					end
				end

				arg_799_1.text_.text = var_802_9
				arg_799_1.typewritter.percent = 0

				arg_799_1.typewritter:SetDirty()
				arg_799_1:ShowNextGo(false)
				arg_799_1:RecordContent(arg_799_1.text_.text)
			end

			local var_802_13 = math.max(var_802_7, arg_799_1.talkMaxDuration)

			if var_802_6 <= arg_799_1.time_ and arg_799_1.time_ < var_802_6 + var_802_13 then
				arg_799_1.typewritter.percent = (arg_799_1.time_ - var_802_6) / var_802_13

				arg_799_1.typewritter:SetDirty()
			end

			if arg_799_1.time_ >= var_802_6 + var_802_13 and arg_799_1.time_ < var_802_6 + var_802_13 + arg_802_0 then
				arg_799_1.typewritter.percent = 1

				arg_799_1.typewritter:SetDirty()
				arg_799_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106192 = function(arg_803_0, arg_803_1)
		arg_803_1.time_ = 0
		arg_803_1.frameCnt_ = 0
		arg_803_1.state_ = "playing"
		arg_803_1.curTalkId_ = 1101106192
		arg_803_1.duration_ = 4.5

		local var_803_0 = {
			zh = 4.5,
			ja = 2.9
		}
		local var_803_1 = manager.audio:GetLocalizationFlag()

		if var_803_0[var_803_1] ~= nil then
			arg_803_1.duration_ = var_803_0[var_803_1]
		end

		SetActive(arg_803_1.tipsGo_, false)

		function arg_803_1.onSingleLineFinish_()
			arg_803_1.onSingleLineUpdate_ = nil
			arg_803_1.onSingleLineFinish_ = nil
			arg_803_1.state_ = "waiting"
		end

		function arg_803_1.playNext_(arg_805_0)
			if arg_805_0 == 1 then
				arg_803_0:Play1101106193(arg_803_1)
			end
		end

		function arg_803_1.onSingleLineUpdate_(arg_806_0)
			local var_806_0 = 0

			if var_806_0 < arg_803_1.time_ and arg_803_1.time_ <= var_806_0 + arg_806_0 then
				arg_803_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_806_1 = arg_803_1.actors_["1011ui_story"]
			local var_806_2 = 0

			if var_806_2 < arg_803_1.time_ and arg_803_1.time_ <= var_806_2 + arg_806_0 and arg_803_1.var_.characterEffect1011ui_story == nil then
				arg_803_1.var_.characterEffect1011ui_story = var_806_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_806_3 = 0.200000002980232

			if var_806_2 <= arg_803_1.time_ and arg_803_1.time_ < var_806_2 + var_806_3 then
				local var_806_4 = (arg_803_1.time_ - var_806_2) / var_806_3

				if arg_803_1.var_.characterEffect1011ui_story then
					arg_803_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_803_1.time_ >= var_806_2 + var_806_3 and arg_803_1.time_ < var_806_2 + var_806_3 + arg_806_0 and arg_803_1.var_.characterEffect1011ui_story then
				arg_803_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_806_5 = 0
			local var_806_6 = 0.35

			if var_806_5 < arg_803_1.time_ and arg_803_1.time_ <= var_806_5 + arg_806_0 then
				arg_803_1.talkMaxDuration = 0
				arg_803_1.dialogCg_.alpha = 1

				arg_803_1.dialog_:SetActive(true)
				SetActive(arg_803_1.leftNameGo_, true)

				local var_806_7 = arg_803_1:FormatText(StoryNameCfg[37].name)

				arg_803_1.leftNameTxt_.text = var_806_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_803_1.leftNameTxt_.transform)

				arg_803_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_803_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_803_1:RecordName(arg_803_1.leftNameTxt_.text)
				SetActive(arg_803_1.iconTrs_.gameObject, false)
				arg_803_1.callingController_:SetSelectedState("normal")

				local var_806_8 = arg_803_1:GetWordFromCfg(1101106192)
				local var_806_9 = arg_803_1:FormatText(var_806_8.content)

				arg_803_1.text_.text = var_806_9

				LuaForUtil.ClearLinePrefixSymbol(arg_803_1.text_)

				local var_806_10 = 14
				local var_806_11 = utf8.len(var_806_9)
				local var_806_12 = var_806_10 <= 0 and var_806_6 or var_806_6 * (var_806_11 / var_806_10)

				if var_806_12 > 0 and var_806_6 < var_806_12 then
					arg_803_1.talkMaxDuration = var_806_12

					if var_806_12 + var_806_5 > arg_803_1.duration_ then
						arg_803_1.duration_ = var_806_12 + var_806_5
					end
				end

				arg_803_1.text_.text = var_806_9
				arg_803_1.typewritter.percent = 0

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb") ~= 0 then
					local var_806_13 = manager.audio:GetVoiceLength("story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb") / 1000

					if var_806_13 + var_806_5 > arg_803_1.duration_ then
						arg_803_1.duration_ = var_806_13 + var_806_5
					end

					if var_806_8.prefab_name ~= "" and arg_803_1.actors_[var_806_8.prefab_name] ~= nil then
						local var_806_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_803_1.actors_[var_806_8.prefab_name].transform, "story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb")

						arg_803_1:RecordAudio("1101106192", var_806_14)
						arg_803_1:RecordAudio("1101106192", var_806_14)
					else
						arg_803_1:AudioAction("play", "voice", "story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb")
					end

					arg_803_1:RecordHistoryTalkVoice("story_v_side_new_1101106", "1101106192", "story_v_side_new_1101106.awb")
				end

				arg_803_1:RecordContent(arg_803_1.text_.text)
			end

			local var_806_15 = math.max(var_806_6, arg_803_1.talkMaxDuration)

			if var_806_5 <= arg_803_1.time_ and arg_803_1.time_ < var_806_5 + var_806_15 then
				arg_803_1.typewritter.percent = (arg_803_1.time_ - var_806_5) / var_806_15

				arg_803_1.typewritter:SetDirty()
			end

			if arg_803_1.time_ >= var_806_5 + var_806_15 and arg_803_1.time_ < var_806_5 + var_806_15 + arg_806_0 then
				arg_803_1.typewritter.percent = 1

				arg_803_1.typewritter:SetDirty()
				arg_803_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106193 = function(arg_807_0, arg_807_1)
		arg_807_1.time_ = 0
		arg_807_1.frameCnt_ = 0
		arg_807_1.state_ = "playing"
		arg_807_1.curTalkId_ = 1101106193
		arg_807_1.duration_ = 5

		SetActive(arg_807_1.tipsGo_, false)

		function arg_807_1.onSingleLineFinish_()
			arg_807_1.onSingleLineUpdate_ = nil
			arg_807_1.onSingleLineFinish_ = nil
			arg_807_1.state_ = "waiting"
		end

		function arg_807_1.playNext_(arg_809_0)
			if arg_809_0 == 1 then
				arg_807_0:Play1101106194(arg_807_1)
			end
		end

		function arg_807_1.onSingleLineUpdate_(arg_810_0)
			local var_810_0 = 0
			local var_810_1 = 0.1

			if var_810_0 < arg_807_1.time_ and arg_807_1.time_ <= var_810_0 + arg_810_0 then
				arg_807_1.talkMaxDuration = 0
				arg_807_1.dialogCg_.alpha = 1

				arg_807_1.dialog_:SetActive(true)
				SetActive(arg_807_1.leftNameGo_, false)

				arg_807_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_807_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_807_1:RecordName(arg_807_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_807_1.iconTrs_.gameObject, false)
				arg_807_1.callingController_:SetSelectedState("normal")

				local var_810_2 = arg_807_1:GetWordFromCfg(1101106193)
				local var_810_3 = arg_807_1:FormatText(var_810_2.content)

				arg_807_1.text_.text = var_810_3

				LuaForUtil.ClearLinePrefixSymbol(arg_807_1.text_)

				local var_810_4 = 4
				local var_810_5 = utf8.len(var_810_3)
				local var_810_6 = var_810_4 <= 0 and var_810_1 or var_810_1 * (var_810_5 / var_810_4)

				if var_810_6 > 0 and var_810_1 < var_810_6 then
					arg_807_1.talkMaxDuration = var_810_6

					if var_810_6 + var_810_0 > arg_807_1.duration_ then
						arg_807_1.duration_ = var_810_6 + var_810_0
					end
				end

				arg_807_1.text_.text = var_810_3
				arg_807_1.typewritter.percent = 0

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(false)
				arg_807_1:RecordContent(arg_807_1.text_.text)
			end

			local var_810_7 = math.max(var_810_1, arg_807_1.talkMaxDuration)

			if var_810_0 <= arg_807_1.time_ and arg_807_1.time_ < var_810_0 + var_810_7 then
				arg_807_1.typewritter.percent = (arg_807_1.time_ - var_810_0) / var_810_7

				arg_807_1.typewritter:SetDirty()
			end

			if arg_807_1.time_ >= var_810_0 + var_810_7 and arg_807_1.time_ < var_810_0 + var_810_7 + arg_810_0 then
				arg_807_1.typewritter.percent = 1

				arg_807_1.typewritter:SetDirty()
				arg_807_1:ShowNextGo(true)
			end
		end
	end,
	Play1101106194 = function(arg_811_0, arg_811_1)
		arg_811_1.time_ = 0
		arg_811_1.frameCnt_ = 0
		arg_811_1.state_ = "playing"
		arg_811_1.curTalkId_ = 1101106194
		arg_811_1.duration_ = 5

		SetActive(arg_811_1.tipsGo_, false)

		function arg_811_1.onSingleLineFinish_()
			arg_811_1.onSingleLineUpdate_ = nil
			arg_811_1.onSingleLineFinish_ = nil
			arg_811_1.state_ = "waiting"
			arg_811_1.auto_ = false
		end

		function arg_811_1.playNext_(arg_813_0)
			arg_811_1.onStoryFinished_()
		end

		function arg_811_1.onSingleLineUpdate_(arg_814_0)
			local var_814_0 = 0
			local var_814_1 = 0.2

			if var_814_0 < arg_811_1.time_ and arg_811_1.time_ <= var_814_0 + arg_814_0 then
				arg_811_1.talkMaxDuration = 0
				arg_811_1.dialogCg_.alpha = 1

				arg_811_1.dialog_:SetActive(true)
				SetActive(arg_811_1.leftNameGo_, true)

				local var_814_2 = arg_811_1:FormatText(StoryNameCfg[7].name)

				arg_811_1.leftNameTxt_.text = var_814_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_811_1.leftNameTxt_.transform)

				arg_811_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_811_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_811_1:RecordName(arg_811_1.leftNameTxt_.text)
				SetActive(arg_811_1.iconTrs_.gameObject, false)
				arg_811_1.callingController_:SetSelectedState("normal")

				local var_814_3 = arg_811_1:GetWordFromCfg(1101106194)
				local var_814_4 = arg_811_1:FormatText(var_814_3.content)

				arg_811_1.text_.text = var_814_4

				LuaForUtil.ClearLinePrefixSymbol(arg_811_1.text_)

				local var_814_5 = 8
				local var_814_6 = utf8.len(var_814_4)
				local var_814_7 = var_814_5 <= 0 and var_814_1 or var_814_1 * (var_814_6 / var_814_5)

				if var_814_7 > 0 and var_814_1 < var_814_7 then
					arg_811_1.talkMaxDuration = var_814_7

					if var_814_7 + var_814_0 > arg_811_1.duration_ then
						arg_811_1.duration_ = var_814_7 + var_814_0
					end
				end

				arg_811_1.text_.text = var_814_4
				arg_811_1.typewritter.percent = 0

				arg_811_1.typewritter:SetDirty()
				arg_811_1:ShowNextGo(false)
				arg_811_1:RecordContent(arg_811_1.text_.text)
			end

			local var_814_8 = math.max(var_814_1, arg_811_1.talkMaxDuration)

			if var_814_0 <= arg_811_1.time_ and arg_811_1.time_ < var_814_0 + var_814_8 then
				arg_811_1.typewritter.percent = (arg_811_1.time_ - var_814_0) / var_814_8

				arg_811_1.typewritter:SetDirty()
			end

			if arg_811_1.time_ >= var_814_0 + var_814_8 and arg_811_1.time_ < var_814_0 + var_814_8 + arg_814_0 then
				arg_811_1.typewritter.percent = 1

				arg_811_1.typewritter:SetDirty()
				arg_811_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST19",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST18",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST04a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST04b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST14",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I06",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R1102a"
	},
	voices = {
		"story_v_side_new_1101106.awb"
	}
}
