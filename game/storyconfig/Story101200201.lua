return {
	Play120021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120021001
		arg_1_1.duration_ = 4.366

		local var_1_0 = {
			zh = 4.299999999999,
			ja = 4.366
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
				arg_1_0:Play120021002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST29"

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
				local var_4_5 = arg_1_1.bgs_.ST29

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
					if iter_4_0 ~= "ST29" then
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

			local var_4_22 = "1072ui_story"

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

			local var_4_26 = arg_1_1.actors_["1072ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1072ui_story = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, -0.71, -6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1072ui_story, var_4_30, var_4_29)

				local var_4_31 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_31.x, var_4_31.y, var_4_31.z)

				local var_4_32 = var_4_26.localEulerAngles

				var_4_32.z = 0
				var_4_32.x = 0
				var_4_26.localEulerAngles = var_4_32
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.71, -6)

				local var_4_33 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_33.x, var_4_33.y, var_4_33.z)

				local var_4_34 = var_4_26.localEulerAngles

				var_4_34.z = 0
				var_4_34.x = 0
				var_4_26.localEulerAngles = var_4_34
			end

			local var_4_35 = arg_1_1.actors_["1072ui_story"]
			local var_4_36 = 2

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 and arg_1_1.var_.characterEffect1072ui_story == nil then
				arg_1_1.var_.characterEffect1072ui_story = var_4_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_37 = 0.2

			if var_4_36 <= arg_1_1.time_ and arg_1_1.time_ < var_4_36 + var_4_37 then
				local var_4_38 = (arg_1_1.time_ - var_4_36) / var_4_37

				if arg_1_1.var_.characterEffect1072ui_story then
					arg_1_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_36 + var_4_37 and arg_1_1.time_ < var_4_36 + var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1072ui_story then
				arg_1_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_4_39 = 2

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_4_41 = 0
			local var_4_42 = 0.166666666666667

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				local var_4_43 = "play"
				local var_4_44 = "music"

				arg_1_1:AudioAction(var_4_43, var_4_44, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_45 = 0.4
			local var_4_46 = 1

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_49 = 2
			local var_4_50 = 0.2

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_51 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_51:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_52 = arg_1_1:FormatText(StoryNameCfg[379].name)

				arg_1_1.leftNameTxt_.text = var_4_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_53 = arg_1_1:GetWordFromCfg(120021001)
				local var_4_54 = arg_1_1:FormatText(var_4_53.content)

				arg_1_1.text_.text = var_4_54

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_55 = 8
				local var_4_56 = utf8.len(var_4_54)
				local var_4_57 = var_4_55 <= 0 and var_4_50 or var_4_50 * (var_4_56 / var_4_55)

				if var_4_57 > 0 and var_4_50 < var_4_57 then
					arg_1_1.talkMaxDuration = var_4_57
					var_4_49 = var_4_49 + 0.3

					if var_4_57 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_57 + var_4_49
					end
				end

				arg_1_1.text_.text = var_4_54
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021001", "story_v_out_120021.awb") ~= 0 then
					local var_4_58 = manager.audio:GetVoiceLength("story_v_out_120021", "120021001", "story_v_out_120021.awb") / 1000

					if var_4_58 + var_4_49 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_58 + var_4_49
					end

					if var_4_53.prefab_name ~= "" and arg_1_1.actors_[var_4_53.prefab_name] ~= nil then
						local var_4_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_53.prefab_name].transform, "story_v_out_120021", "120021001", "story_v_out_120021.awb")

						arg_1_1:RecordAudio("120021001", var_4_59)
						arg_1_1:RecordAudio("120021001", var_4_59)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_120021", "120021001", "story_v_out_120021.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_120021", "120021001", "story_v_out_120021.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_60 = var_4_49 + 0.3
			local var_4_61 = math.max(var_4_50, arg_1_1.talkMaxDuration)

			if var_4_60 <= arg_1_1.time_ and arg_1_1.time_ < var_4_60 + var_4_61 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_60) / var_4_61

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_60 + var_4_61 and arg_1_1.time_ < var_4_60 + var_4_61 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play120021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120021002
		arg_7_1.duration_ = 13.833

		local var_7_0 = {
			zh = 13.2,
			ja = 13.833
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
				arg_7_0:Play120021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_10_1 = 0
			local var_10_2 = 1.575

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_3 = arg_7_1:FormatText(StoryNameCfg[379].name)

				arg_7_1.leftNameTxt_.text = var_10_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_4 = arg_7_1:GetWordFromCfg(120021002)
				local var_10_5 = arg_7_1:FormatText(var_10_4.content)

				arg_7_1.text_.text = var_10_5

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_6 = 63
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

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021002", "story_v_out_120021.awb") ~= 0 then
					local var_10_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021002", "story_v_out_120021.awb") / 1000

					if var_10_9 + var_10_1 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_9 + var_10_1
					end

					if var_10_4.prefab_name ~= "" and arg_7_1.actors_[var_10_4.prefab_name] ~= nil then
						local var_10_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_4.prefab_name].transform, "story_v_out_120021", "120021002", "story_v_out_120021.awb")

						arg_7_1:RecordAudio("120021002", var_10_10)
						arg_7_1:RecordAudio("120021002", var_10_10)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_120021", "120021002", "story_v_out_120021.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_120021", "120021002", "story_v_out_120021.awb")
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
	Play120021003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 120021003
		arg_11_1.duration_ = 12.1

		local var_11_0 = {
			zh = 10.033,
			ja = 12.1
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
				arg_11_0:Play120021004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_14_2 = 0
			local var_14_3 = 1.35

			if var_14_2 < arg_11_1.time_ and arg_11_1.time_ <= var_14_2 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_4 = arg_11_1:FormatText(StoryNameCfg[379].name)

				arg_11_1.leftNameTxt_.text = var_14_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_5 = arg_11_1:GetWordFromCfg(120021003)
				local var_14_6 = arg_11_1:FormatText(var_14_5.content)

				arg_11_1.text_.text = var_14_6

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_7 = 53
				local var_14_8 = utf8.len(var_14_6)
				local var_14_9 = var_14_7 <= 0 and var_14_3 or var_14_3 * (var_14_8 / var_14_7)

				if var_14_9 > 0 and var_14_3 < var_14_9 then
					arg_11_1.talkMaxDuration = var_14_9

					if var_14_9 + var_14_2 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_9 + var_14_2
					end
				end

				arg_11_1.text_.text = var_14_6
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021003", "story_v_out_120021.awb") ~= 0 then
					local var_14_10 = manager.audio:GetVoiceLength("story_v_out_120021", "120021003", "story_v_out_120021.awb") / 1000

					if var_14_10 + var_14_2 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_10 + var_14_2
					end

					if var_14_5.prefab_name ~= "" and arg_11_1.actors_[var_14_5.prefab_name] ~= nil then
						local var_14_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_5.prefab_name].transform, "story_v_out_120021", "120021003", "story_v_out_120021.awb")

						arg_11_1:RecordAudio("120021003", var_14_11)
						arg_11_1:RecordAudio("120021003", var_14_11)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_120021", "120021003", "story_v_out_120021.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_120021", "120021003", "story_v_out_120021.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_12 = math.max(var_14_3, arg_11_1.talkMaxDuration)

			if var_14_2 <= arg_11_1.time_ and arg_11_1.time_ < var_14_2 + var_14_12 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_2) / var_14_12

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_2 + var_14_12 and arg_11_1.time_ < var_14_2 + var_14_12 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play120021004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 120021004
		arg_15_1.duration_ = 14.2

		local var_15_0 = {
			zh = 12.166,
			ja = 14.2
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
				arg_15_0:Play120021005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 then
				arg_15_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_2")
			end

			local var_18_2 = 0
			local var_18_3 = 1.3

			if var_18_2 < arg_15_1.time_ and arg_15_1.time_ <= var_18_2 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_4 = arg_15_1:FormatText(StoryNameCfg[379].name)

				arg_15_1.leftNameTxt_.text = var_18_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_5 = arg_15_1:GetWordFromCfg(120021004)
				local var_18_6 = arg_15_1:FormatText(var_18_5.content)

				arg_15_1.text_.text = var_18_6

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_7 = 51
				local var_18_8 = utf8.len(var_18_6)
				local var_18_9 = var_18_7 <= 0 and var_18_3 or var_18_3 * (var_18_8 / var_18_7)

				if var_18_9 > 0 and var_18_3 < var_18_9 then
					arg_15_1.talkMaxDuration = var_18_9

					if var_18_9 + var_18_2 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_9 + var_18_2
					end
				end

				arg_15_1.text_.text = var_18_6
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021004", "story_v_out_120021.awb") ~= 0 then
					local var_18_10 = manager.audio:GetVoiceLength("story_v_out_120021", "120021004", "story_v_out_120021.awb") / 1000

					if var_18_10 + var_18_2 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_10 + var_18_2
					end

					if var_18_5.prefab_name ~= "" and arg_15_1.actors_[var_18_5.prefab_name] ~= nil then
						local var_18_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_5.prefab_name].transform, "story_v_out_120021", "120021004", "story_v_out_120021.awb")

						arg_15_1:RecordAudio("120021004", var_18_11)
						arg_15_1:RecordAudio("120021004", var_18_11)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_120021", "120021004", "story_v_out_120021.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_120021", "120021004", "story_v_out_120021.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_12 = math.max(var_18_3, arg_15_1.talkMaxDuration)

			if var_18_2 <= arg_15_1.time_ and arg_15_1.time_ < var_18_2 + var_18_12 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_2) / var_18_12

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_2 + var_18_12 and arg_15_1.time_ < var_18_2 + var_18_12 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play120021005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 120021005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play120021006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["1072ui_story"].transform
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				arg_19_1.var_.moveOldPos1072ui_story = var_22_0.localPosition
			end

			local var_22_2 = 0.001

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2
				local var_22_4 = Vector3.New(0, 100, 0)

				var_22_0.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1072ui_story, var_22_4, var_22_3)

				local var_22_5 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_5.x, var_22_5.y, var_22_5.z)

				local var_22_6 = var_22_0.localEulerAngles

				var_22_6.z = 0
				var_22_6.x = 0
				var_22_0.localEulerAngles = var_22_6
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 then
				var_22_0.localPosition = Vector3.New(0, 100, 0)

				local var_22_7 = manager.ui.mainCamera.transform.position - var_22_0.position

				var_22_0.forward = Vector3.New(var_22_7.x, var_22_7.y, var_22_7.z)

				local var_22_8 = var_22_0.localEulerAngles

				var_22_8.z = 0
				var_22_8.x = 0
				var_22_0.localEulerAngles = var_22_8
			end

			local var_22_9 = 0
			local var_22_10 = 1.075

			if var_22_9 < arg_19_1.time_ and arg_19_1.time_ <= var_22_9 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_11 = arg_19_1:GetWordFromCfg(120021005)
				local var_22_12 = arg_19_1:FormatText(var_22_11.content)

				arg_19_1.text_.text = var_22_12

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_13 = 43
				local var_22_14 = utf8.len(var_22_12)
				local var_22_15 = var_22_13 <= 0 and var_22_10 or var_22_10 * (var_22_14 / var_22_13)

				if var_22_15 > 0 and var_22_10 < var_22_15 then
					arg_19_1.talkMaxDuration = var_22_15

					if var_22_15 + var_22_9 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_15 + var_22_9
					end
				end

				arg_19_1.text_.text = var_22_12
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_16 = math.max(var_22_10, arg_19_1.talkMaxDuration)

			if var_22_9 <= arg_19_1.time_ and arg_19_1.time_ < var_22_9 + var_22_16 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_9) / var_22_16

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_9 + var_22_16 and arg_19_1.time_ < var_22_9 + var_22_16 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play120021006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 120021006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play120021007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.875

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_2 = arg_23_1:GetWordFromCfg(120021006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 35
				local var_26_5 = utf8.len(var_26_3)
				local var_26_6 = var_26_4 <= 0 and var_26_1 or var_26_1 * (var_26_5 / var_26_4)

				if var_26_6 > 0 and var_26_1 < var_26_6 then
					arg_23_1.talkMaxDuration = var_26_6

					if var_26_6 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_6 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_3
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_7 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_7 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_7

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_7 and arg_23_1.time_ < var_26_0 + var_26_7 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play120021007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 120021007
		arg_27_1.duration_ = 5.766

		local var_27_0 = {
			zh = 3.966,
			ja = 5.766
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
				arg_27_0:Play120021008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "1069ui_story"

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

			local var_30_4 = arg_27_1.actors_["1069ui_story"].transform
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos1069ui_story = var_30_4.localPosition
			end

			local var_30_6 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6
				local var_30_8 = Vector3.New(-0.7, -1, -6)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1069ui_story, var_30_8, var_30_7)

				local var_30_9 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_9.x, var_30_9.y, var_30_9.z)

				local var_30_10 = var_30_4.localEulerAngles

				var_30_10.z = 0
				var_30_10.x = 0
				var_30_4.localEulerAngles = var_30_10
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(-0.7, -1, -6)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_4.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_4.localEulerAngles = var_30_12
			end

			local var_30_13 = arg_27_1.actors_["1069ui_story"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 and arg_27_1.var_.characterEffect1069ui_story == nil then
				arg_27_1.var_.characterEffect1069ui_story = var_30_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_15 = 0.2

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15

				if arg_27_1.var_.characterEffect1069ui_story then
					arg_27_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 and arg_27_1.var_.characterEffect1069ui_story then
				arg_27_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_30_17 = 0

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 then
				arg_27_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_30_18 = 0

			if var_30_18 < arg_27_1.time_ and arg_27_1.time_ <= var_30_18 + arg_30_0 then
				arg_27_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action1_1")
			end

			local var_30_19 = arg_27_1.actors_["1072ui_story"].transform
			local var_30_20 = 0

			if var_30_20 < arg_27_1.time_ and arg_27_1.time_ <= var_30_20 + arg_30_0 then
				arg_27_1.var_.moveOldPos1072ui_story = var_30_19.localPosition
			end

			local var_30_21 = 0.001

			if var_30_20 <= arg_27_1.time_ and arg_27_1.time_ < var_30_20 + var_30_21 then
				local var_30_22 = (arg_27_1.time_ - var_30_20) / var_30_21
				local var_30_23 = Vector3.New(0.7, -0.71, -6)

				var_30_19.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1072ui_story, var_30_23, var_30_22)

				local var_30_24 = manager.ui.mainCamera.transform.position - var_30_19.position

				var_30_19.forward = Vector3.New(var_30_24.x, var_30_24.y, var_30_24.z)

				local var_30_25 = var_30_19.localEulerAngles

				var_30_25.z = 0
				var_30_25.x = 0
				var_30_19.localEulerAngles = var_30_25
			end

			if arg_27_1.time_ >= var_30_20 + var_30_21 and arg_27_1.time_ < var_30_20 + var_30_21 + arg_30_0 then
				var_30_19.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_30_26 = manager.ui.mainCamera.transform.position - var_30_19.position

				var_30_19.forward = Vector3.New(var_30_26.x, var_30_26.y, var_30_26.z)

				local var_30_27 = var_30_19.localEulerAngles

				var_30_27.z = 0
				var_30_27.x = 0
				var_30_19.localEulerAngles = var_30_27
			end

			local var_30_28 = arg_27_1.actors_["1072ui_story"]
			local var_30_29 = 0

			if var_30_29 < arg_27_1.time_ and arg_27_1.time_ <= var_30_29 + arg_30_0 and arg_27_1.var_.characterEffect1072ui_story == nil then
				arg_27_1.var_.characterEffect1072ui_story = var_30_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_30 = 0.0166666666666667

			if var_30_29 <= arg_27_1.time_ and arg_27_1.time_ < var_30_29 + var_30_30 then
				local var_30_31 = (arg_27_1.time_ - var_30_29) / var_30_30

				if arg_27_1.var_.characterEffect1072ui_story then
					local var_30_32 = Mathf.Lerp(0, 0.5, var_30_31)

					arg_27_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_27_1.var_.characterEffect1072ui_story.fillRatio = var_30_32
				end
			end

			if arg_27_1.time_ >= var_30_29 + var_30_30 and arg_27_1.time_ < var_30_29 + var_30_30 + arg_30_0 and arg_27_1.var_.characterEffect1072ui_story then
				local var_30_33 = 0.5

				arg_27_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_27_1.var_.characterEffect1072ui_story.fillRatio = var_30_33
			end

			local var_30_34 = 0
			local var_30_35 = 0.425

			if var_30_34 < arg_27_1.time_ and arg_27_1.time_ <= var_30_34 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_36 = arg_27_1:FormatText(StoryNameCfg[378].name)

				arg_27_1.leftNameTxt_.text = var_30_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_37 = arg_27_1:GetWordFromCfg(120021007)
				local var_30_38 = arg_27_1:FormatText(var_30_37.content)

				arg_27_1.text_.text = var_30_38

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_39 = 17
				local var_30_40 = utf8.len(var_30_38)
				local var_30_41 = var_30_39 <= 0 and var_30_35 or var_30_35 * (var_30_40 / var_30_39)

				if var_30_41 > 0 and var_30_35 < var_30_41 then
					arg_27_1.talkMaxDuration = var_30_41

					if var_30_41 + var_30_34 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_41 + var_30_34
					end
				end

				arg_27_1.text_.text = var_30_38
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021007", "story_v_out_120021.awb") ~= 0 then
					local var_30_42 = manager.audio:GetVoiceLength("story_v_out_120021", "120021007", "story_v_out_120021.awb") / 1000

					if var_30_42 + var_30_34 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_42 + var_30_34
					end

					if var_30_37.prefab_name ~= "" and arg_27_1.actors_[var_30_37.prefab_name] ~= nil then
						local var_30_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_37.prefab_name].transform, "story_v_out_120021", "120021007", "story_v_out_120021.awb")

						arg_27_1:RecordAudio("120021007", var_30_43)
						arg_27_1:RecordAudio("120021007", var_30_43)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_120021", "120021007", "story_v_out_120021.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_120021", "120021007", "story_v_out_120021.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_44 = math.max(var_30_35, arg_27_1.talkMaxDuration)

			if var_30_34 <= arg_27_1.time_ and arg_27_1.time_ < var_30_34 + var_30_44 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_34) / var_30_44

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_34 + var_30_44 and arg_27_1.time_ < var_30_34 + var_30_44 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play120021008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 120021008
		arg_31_1.duration_ = 4.733

		local var_31_0 = {
			zh = 4.733,
			ja = 2.566
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
				arg_31_0:Play120021009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1072ui_story"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1072ui_story = var_34_0.localPosition
			end

			local var_34_2 = 0.001

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2
				local var_34_4 = Vector3.New(0.7, -0.71, -6)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1072ui_story, var_34_4, var_34_3)

				local var_34_5 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_5.x, var_34_5.y, var_34_5.z)

				local var_34_6 = var_34_0.localEulerAngles

				var_34_6.z = 0
				var_34_6.x = 0
				var_34_0.localEulerAngles = var_34_6
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_34_7 = manager.ui.mainCamera.transform.position - var_34_0.position

				var_34_0.forward = Vector3.New(var_34_7.x, var_34_7.y, var_34_7.z)

				local var_34_8 = var_34_0.localEulerAngles

				var_34_8.z = 0
				var_34_8.x = 0
				var_34_0.localEulerAngles = var_34_8
			end

			local var_34_9 = arg_31_1.actors_["1072ui_story"]
			local var_34_10 = 0

			if var_34_10 < arg_31_1.time_ and arg_31_1.time_ <= var_34_10 + arg_34_0 and arg_31_1.var_.characterEffect1072ui_story == nil then
				arg_31_1.var_.characterEffect1072ui_story = var_34_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_11 = 0.2

			if var_34_10 <= arg_31_1.time_ and arg_31_1.time_ < var_34_10 + var_34_11 then
				local var_34_12 = (arg_31_1.time_ - var_34_10) / var_34_11

				if arg_31_1.var_.characterEffect1072ui_story then
					arg_31_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_31_1.time_ >= var_34_10 + var_34_11 and arg_31_1.time_ < var_34_10 + var_34_11 + arg_34_0 and arg_31_1.var_.characterEffect1072ui_story then
				arg_31_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_34_13 = 0

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action4_1")
			end

			local var_34_15 = arg_31_1.actors_["1069ui_story"]
			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 and arg_31_1.var_.characterEffect1069ui_story == nil then
				arg_31_1.var_.characterEffect1069ui_story = var_34_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_17 = 0.2

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17

				if arg_31_1.var_.characterEffect1069ui_story then
					local var_34_19 = Mathf.Lerp(0, 0.5, var_34_18)

					arg_31_1.var_.characterEffect1069ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1069ui_story.fillRatio = var_34_19
				end
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 and arg_31_1.var_.characterEffect1069ui_story then
				local var_34_20 = 0.5

				arg_31_1.var_.characterEffect1069ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1069ui_story.fillRatio = var_34_20
			end

			local var_34_21 = 0
			local var_34_22 = 0.425

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_23 = arg_31_1:FormatText(StoryNameCfg[379].name)

				arg_31_1.leftNameTxt_.text = var_34_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_24 = arg_31_1:GetWordFromCfg(120021008)
				local var_34_25 = arg_31_1:FormatText(var_34_24.content)

				arg_31_1.text_.text = var_34_25

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_26 = 17
				local var_34_27 = utf8.len(var_34_25)
				local var_34_28 = var_34_26 <= 0 and var_34_22 or var_34_22 * (var_34_27 / var_34_26)

				if var_34_28 > 0 and var_34_22 < var_34_28 then
					arg_31_1.talkMaxDuration = var_34_28

					if var_34_28 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_28 + var_34_21
					end
				end

				arg_31_1.text_.text = var_34_25
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021008", "story_v_out_120021.awb") ~= 0 then
					local var_34_29 = manager.audio:GetVoiceLength("story_v_out_120021", "120021008", "story_v_out_120021.awb") / 1000

					if var_34_29 + var_34_21 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_29 + var_34_21
					end

					if var_34_24.prefab_name ~= "" and arg_31_1.actors_[var_34_24.prefab_name] ~= nil then
						local var_34_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_24.prefab_name].transform, "story_v_out_120021", "120021008", "story_v_out_120021.awb")

						arg_31_1:RecordAudio("120021008", var_34_30)
						arg_31_1:RecordAudio("120021008", var_34_30)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_120021", "120021008", "story_v_out_120021.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_120021", "120021008", "story_v_out_120021.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_31 = math.max(var_34_22, arg_31_1.talkMaxDuration)

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_31 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_21) / var_34_31

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_21 + var_34_31 and arg_31_1.time_ < var_34_21 + var_34_31 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play120021009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 120021009
		arg_35_1.duration_ = 14.2

		local var_35_0 = {
			zh = 10.833,
			ja = 14.2
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
				arg_35_0:Play120021010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_38_1 = 0
			local var_38_2 = 1.05

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_3 = arg_35_1:FormatText(StoryNameCfg[379].name)

				arg_35_1.leftNameTxt_.text = var_38_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_4 = arg_35_1:GetWordFromCfg(120021009)
				local var_38_5 = arg_35_1:FormatText(var_38_4.content)

				arg_35_1.text_.text = var_38_5

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_6 = 42
				local var_38_7 = utf8.len(var_38_5)
				local var_38_8 = var_38_6 <= 0 and var_38_2 or var_38_2 * (var_38_7 / var_38_6)

				if var_38_8 > 0 and var_38_2 < var_38_8 then
					arg_35_1.talkMaxDuration = var_38_8

					if var_38_8 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_1
					end
				end

				arg_35_1.text_.text = var_38_5
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021009", "story_v_out_120021.awb") ~= 0 then
					local var_38_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021009", "story_v_out_120021.awb") / 1000

					if var_38_9 + var_38_1 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_9 + var_38_1
					end

					if var_38_4.prefab_name ~= "" and arg_35_1.actors_[var_38_4.prefab_name] ~= nil then
						local var_38_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_4.prefab_name].transform, "story_v_out_120021", "120021009", "story_v_out_120021.awb")

						arg_35_1:RecordAudio("120021009", var_38_10)
						arg_35_1:RecordAudio("120021009", var_38_10)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_120021", "120021009", "story_v_out_120021.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_120021", "120021009", "story_v_out_120021.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_11 = math.max(var_38_2, arg_35_1.talkMaxDuration)

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_11 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_1) / var_38_11

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_1 + var_38_11 and arg_35_1.time_ < var_38_1 + var_38_11 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play120021010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 120021010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play120021011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1072ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1072ui_story == nil then
				arg_39_1.var_.characterEffect1072ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1072ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1072ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1072ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1072ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action4_2")
			end

			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 then
				arg_39_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_42_8 = 0
			local var_42_9 = 0.3

			if var_42_8 < arg_39_1.time_ and arg_39_1.time_ <= var_42_8 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_10 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_11 = arg_39_1:GetWordFromCfg(120021010)
				local var_42_12 = arg_39_1:FormatText(var_42_11.content)

				arg_39_1.text_.text = var_42_12

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_13 = 12
				local var_42_14 = utf8.len(var_42_12)
				local var_42_15 = var_42_13 <= 0 and var_42_9 or var_42_9 * (var_42_14 / var_42_13)

				if var_42_15 > 0 and var_42_9 < var_42_15 then
					arg_39_1.talkMaxDuration = var_42_15

					if var_42_15 + var_42_8 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_15 + var_42_8
					end
				end

				arg_39_1.text_.text = var_42_12
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_16 = math.max(var_42_9, arg_39_1.talkMaxDuration)

			if var_42_8 <= arg_39_1.time_ and arg_39_1.time_ < var_42_8 + var_42_16 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_8) / var_42_16

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_8 + var_42_16 and arg_39_1.time_ < var_42_8 + var_42_16 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play120021011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 120021011
		arg_43_1.duration_ = 10.766

		local var_43_0 = {
			zh = 9.2,
			ja = 10.766
		}
		local var_43_1 = manager.audio:GetLocalizationFlag()

		if var_43_0[var_43_1] ~= nil then
			arg_43_1.duration_ = var_43_0[var_43_1]
		end

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play120021012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1072ui_story"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.characterEffect1072ui_story == nil then
				arg_43_1.var_.characterEffect1072ui_story = var_46_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_2 = 0.2

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.characterEffect1072ui_story then
					arg_43_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.characterEffect1072ui_story then
				arg_43_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_46_4 = 0
			local var_46_5 = 0.7

			if var_46_4 < arg_43_1.time_ and arg_43_1.time_ <= var_46_4 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_6 = arg_43_1:FormatText(StoryNameCfg[379].name)

				arg_43_1.leftNameTxt_.text = var_46_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_7 = arg_43_1:GetWordFromCfg(120021011)
				local var_46_8 = arg_43_1:FormatText(var_46_7.content)

				arg_43_1.text_.text = var_46_8

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_9 = 28
				local var_46_10 = utf8.len(var_46_8)
				local var_46_11 = var_46_9 <= 0 and var_46_5 or var_46_5 * (var_46_10 / var_46_9)

				if var_46_11 > 0 and var_46_5 < var_46_11 then
					arg_43_1.talkMaxDuration = var_46_11

					if var_46_11 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_11 + var_46_4
					end
				end

				arg_43_1.text_.text = var_46_8
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021011", "story_v_out_120021.awb") ~= 0 then
					local var_46_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021011", "story_v_out_120021.awb") / 1000

					if var_46_12 + var_46_4 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_12 + var_46_4
					end

					if var_46_7.prefab_name ~= "" and arg_43_1.actors_[var_46_7.prefab_name] ~= nil then
						local var_46_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_7.prefab_name].transform, "story_v_out_120021", "120021011", "story_v_out_120021.awb")

						arg_43_1:RecordAudio("120021011", var_46_13)
						arg_43_1:RecordAudio("120021011", var_46_13)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_120021", "120021011", "story_v_out_120021.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_120021", "120021011", "story_v_out_120021.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_14 = math.max(var_46_5, arg_43_1.talkMaxDuration)

			if var_46_4 <= arg_43_1.time_ and arg_43_1.time_ < var_46_4 + var_46_14 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_4) / var_46_14

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_4 + var_46_14 and arg_43_1.time_ < var_46_4 + var_46_14 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play120021012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 120021012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play120021013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1072ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1072ui_story == nil then
				arg_47_1.var_.characterEffect1072ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1072ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1072ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1072ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1072ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0
			local var_50_7 = 0.2

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[7].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(120021012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 8
				local var_50_12 = utf8.len(var_50_10)
				local var_50_13 = var_50_11 <= 0 and var_50_7 or var_50_7 * (var_50_12 / var_50_11)

				if var_50_13 > 0 and var_50_7 < var_50_13 then
					arg_47_1.talkMaxDuration = var_50_13

					if var_50_13 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_10
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_14 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_14 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_14

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_14 and arg_47_1.time_ < var_50_6 + var_50_14 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play120021013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 120021013
		arg_51_1.duration_ = 5.8

		local var_51_0 = {
			zh = 5.5,
			ja = 5.8
		}
		local var_51_1 = manager.audio:GetLocalizationFlag()

		if var_51_0[var_51_1] ~= nil then
			arg_51_1.duration_ = var_51_0[var_51_1]
		end

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play120021014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1072ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1072ui_story == nil then
				arg_51_1.var_.characterEffect1072ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.2

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1072ui_story then
					arg_51_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1072ui_story then
				arg_51_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_54_4 = 0
			local var_54_5 = 0.7

			if var_54_4 < arg_51_1.time_ and arg_51_1.time_ <= var_54_4 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_6 = arg_51_1:FormatText(StoryNameCfg[379].name)

				arg_51_1.leftNameTxt_.text = var_54_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_7 = arg_51_1:GetWordFromCfg(120021013)
				local var_54_8 = arg_51_1:FormatText(var_54_7.content)

				arg_51_1.text_.text = var_54_8

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_9 = 26
				local var_54_10 = utf8.len(var_54_8)
				local var_54_11 = var_54_9 <= 0 and var_54_5 or var_54_5 * (var_54_10 / var_54_9)

				if var_54_11 > 0 and var_54_5 < var_54_11 then
					arg_51_1.talkMaxDuration = var_54_11

					if var_54_11 + var_54_4 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_11 + var_54_4
					end
				end

				arg_51_1.text_.text = var_54_8
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021013", "story_v_out_120021.awb") ~= 0 then
					local var_54_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021013", "story_v_out_120021.awb") / 1000

					if var_54_12 + var_54_4 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_12 + var_54_4
					end

					if var_54_7.prefab_name ~= "" and arg_51_1.actors_[var_54_7.prefab_name] ~= nil then
						local var_54_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_7.prefab_name].transform, "story_v_out_120021", "120021013", "story_v_out_120021.awb")

						arg_51_1:RecordAudio("120021013", var_54_13)
						arg_51_1:RecordAudio("120021013", var_54_13)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_120021", "120021013", "story_v_out_120021.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_120021", "120021013", "story_v_out_120021.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_14 = math.max(var_54_5, arg_51_1.talkMaxDuration)

			if var_54_4 <= arg_51_1.time_ and arg_51_1.time_ < var_54_4 + var_54_14 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_4) / var_54_14

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_4 + var_54_14 and arg_51_1.time_ < var_54_4 + var_54_14 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play120021014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120021014
		arg_55_1.duration_ = 13.766

		local var_55_0 = {
			zh = 13,
			ja = 13.766
		}
		local var_55_1 = manager.audio:GetLocalizationFlag()

		if var_55_0[var_55_1] ~= nil then
			arg_55_1.duration_ = var_55_0[var_55_1]
		end

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play120021015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 1.55

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[379].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(120021014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 62
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021014", "story_v_out_120021.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021014", "story_v_out_120021.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_120021", "120021014", "story_v_out_120021.awb")

						arg_55_1:RecordAudio("120021014", var_58_9)
						arg_55_1:RecordAudio("120021014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_120021", "120021014", "story_v_out_120021.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_120021", "120021014", "story_v_out_120021.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play120021015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 120021015
		arg_59_1.duration_ = 6.633

		local var_59_0 = {
			zh = 6.133,
			ja = 6.633
		}
		local var_59_1 = manager.audio:GetLocalizationFlag()

		if var_59_0[var_59_1] ~= nil then
			arg_59_1.duration_ = var_59_0[var_59_1]
		end

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play120021016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.65

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[379].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(120021015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021015", "story_v_out_120021.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021015", "story_v_out_120021.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_120021", "120021015", "story_v_out_120021.awb")

						arg_59_1:RecordAudio("120021015", var_62_9)
						arg_59_1:RecordAudio("120021015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_120021", "120021015", "story_v_out_120021.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_120021", "120021015", "story_v_out_120021.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_10 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_10 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_10

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_10 and arg_59_1.time_ < var_62_0 + var_62_10 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play120021016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 120021016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play120021017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1072ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story == nil then
				arg_63_1.var_.characterEffect1072ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1072ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1072ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1072ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1072ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0
			local var_66_7 = 0.2

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[7].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(120021016)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 8
				local var_66_12 = utf8.len(var_66_10)
				local var_66_13 = var_66_11 <= 0 and var_66_7 or var_66_7 * (var_66_12 / var_66_11)

				if var_66_13 > 0 and var_66_7 < var_66_13 then
					arg_63_1.talkMaxDuration = var_66_13

					if var_66_13 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_13 + var_66_6
					end
				end

				arg_63_1.text_.text = var_66_10
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_14 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_14 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_14

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_14 and arg_63_1.time_ < var_66_6 + var_66_14 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play120021017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 120021017
		arg_67_1.duration_ = 9.9

		local var_67_0 = {
			zh = 5.2,
			ja = 9.9
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
				arg_67_0:Play120021018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1072ui_story"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story == nil then
				arg_67_1.var_.characterEffect1072ui_story = var_70_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_2 = 0.2

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.characterEffect1072ui_story then
					arg_67_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.characterEffect1072ui_story then
				arg_67_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_70_4 = 0

			if var_70_4 < arg_67_1.time_ and arg_67_1.time_ <= var_70_4 + arg_70_0 then
				arg_67_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_70_5 = 0

			if var_70_5 < arg_67_1.time_ and arg_67_1.time_ <= var_70_5 + arg_70_0 then
				arg_67_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action4_1")
			end

			local var_70_6 = 0
			local var_70_7 = 0.525

			if var_70_6 < arg_67_1.time_ and arg_67_1.time_ <= var_70_6 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_8 = arg_67_1:FormatText(StoryNameCfg[379].name)

				arg_67_1.leftNameTxt_.text = var_70_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_9 = arg_67_1:GetWordFromCfg(120021017)
				local var_70_10 = arg_67_1:FormatText(var_70_9.content)

				arg_67_1.text_.text = var_70_10

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_11 = 22
				local var_70_12 = utf8.len(var_70_10)
				local var_70_13 = var_70_11 <= 0 and var_70_7 or var_70_7 * (var_70_12 / var_70_11)

				if var_70_13 > 0 and var_70_7 < var_70_13 then
					arg_67_1.talkMaxDuration = var_70_13

					if var_70_13 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_13 + var_70_6
					end
				end

				arg_67_1.text_.text = var_70_10
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021017", "story_v_out_120021.awb") ~= 0 then
					local var_70_14 = manager.audio:GetVoiceLength("story_v_out_120021", "120021017", "story_v_out_120021.awb") / 1000

					if var_70_14 + var_70_6 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_14 + var_70_6
					end

					if var_70_9.prefab_name ~= "" and arg_67_1.actors_[var_70_9.prefab_name] ~= nil then
						local var_70_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_9.prefab_name].transform, "story_v_out_120021", "120021017", "story_v_out_120021.awb")

						arg_67_1:RecordAudio("120021017", var_70_15)
						arg_67_1:RecordAudio("120021017", var_70_15)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_120021", "120021017", "story_v_out_120021.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_120021", "120021017", "story_v_out_120021.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_16 = math.max(var_70_7, arg_67_1.talkMaxDuration)

			if var_70_6 <= arg_67_1.time_ and arg_67_1.time_ < var_70_6 + var_70_16 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_6) / var_70_16

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_6 + var_70_16 and arg_67_1.time_ < var_70_6 + var_70_16 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play120021018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 120021018
		arg_71_1.duration_ = 11.2

		local var_71_0 = {
			zh = 9.866,
			ja = 11.2
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
				arg_71_0:Play120021019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action4_2")
			end

			local var_74_1 = 0
			local var_74_2 = 1.05

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_3 = arg_71_1:FormatText(StoryNameCfg[379].name)

				arg_71_1.leftNameTxt_.text = var_74_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_4 = arg_71_1:GetWordFromCfg(120021018)
				local var_74_5 = arg_71_1:FormatText(var_74_4.content)

				arg_71_1.text_.text = var_74_5

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_6 = 42
				local var_74_7 = utf8.len(var_74_5)
				local var_74_8 = var_74_6 <= 0 and var_74_2 or var_74_2 * (var_74_7 / var_74_6)

				if var_74_8 > 0 and var_74_2 < var_74_8 then
					arg_71_1.talkMaxDuration = var_74_8

					if var_74_8 + var_74_1 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_1
					end
				end

				arg_71_1.text_.text = var_74_5
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021018", "story_v_out_120021.awb") ~= 0 then
					local var_74_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021018", "story_v_out_120021.awb") / 1000

					if var_74_9 + var_74_1 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_9 + var_74_1
					end

					if var_74_4.prefab_name ~= "" and arg_71_1.actors_[var_74_4.prefab_name] ~= nil then
						local var_74_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_4.prefab_name].transform, "story_v_out_120021", "120021018", "story_v_out_120021.awb")

						arg_71_1:RecordAudio("120021018", var_74_10)
						arg_71_1:RecordAudio("120021018", var_74_10)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_120021", "120021018", "story_v_out_120021.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_120021", "120021018", "story_v_out_120021.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_11 = math.max(var_74_2, arg_71_1.talkMaxDuration)

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_11 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_1) / var_74_11

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_1 + var_74_11 and arg_71_1.time_ < var_74_1 + var_74_11 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play120021019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 120021019
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play120021020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1072ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1072ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, 100, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1072ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, 100, 0)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1069ui_story"].transform
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.var_.moveOldPos1069ui_story = var_78_9.localPosition
			end

			local var_78_11 = 0.001

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11
				local var_78_13 = Vector3.New(0, 100, 0)

				var_78_9.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1069ui_story, var_78_13, var_78_12)

				local var_78_14 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_14.x, var_78_14.y, var_78_14.z)

				local var_78_15 = var_78_9.localEulerAngles

				var_78_15.z = 0
				var_78_15.x = 0
				var_78_9.localEulerAngles = var_78_15
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 then
				var_78_9.localPosition = Vector3.New(0, 100, 0)

				local var_78_16 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_16.x, var_78_16.y, var_78_16.z)

				local var_78_17 = var_78_9.localEulerAngles

				var_78_17.z = 0
				var_78_17.x = 0
				var_78_9.localEulerAngles = var_78_17
			end

			local var_78_18 = 0
			local var_78_19 = 1.1

			if var_78_18 < arg_75_1.time_ and arg_75_1.time_ <= var_78_18 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_20 = arg_75_1:GetWordFromCfg(120021019)
				local var_78_21 = arg_75_1:FormatText(var_78_20.content)

				arg_75_1.text_.text = var_78_21

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_22 = 44
				local var_78_23 = utf8.len(var_78_21)
				local var_78_24 = var_78_22 <= 0 and var_78_19 or var_78_19 * (var_78_23 / var_78_22)

				if var_78_24 > 0 and var_78_19 < var_78_24 then
					arg_75_1.talkMaxDuration = var_78_24

					if var_78_24 + var_78_18 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_24 + var_78_18
					end
				end

				arg_75_1.text_.text = var_78_21
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_25 = math.max(var_78_19, arg_75_1.talkMaxDuration)

			if var_78_18 <= arg_75_1.time_ and arg_75_1.time_ < var_78_18 + var_78_25 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_18) / var_78_25

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_18 + var_78_25 and arg_75_1.time_ < var_78_18 + var_78_25 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play120021020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 120021020
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play120021021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.1

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[7].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(120021020)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 4
				local var_82_6 = utf8.len(var_82_4)
				local var_82_7 = var_82_5 <= 0 and var_82_1 or var_82_1 * (var_82_6 / var_82_5)

				if var_82_7 > 0 and var_82_1 < var_82_7 then
					arg_79_1.talkMaxDuration = var_82_7

					if var_82_7 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_7 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_4
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_8 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_8 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_8

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_8 and arg_79_1.time_ < var_82_0 + var_82_8 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play120021021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 120021021
		arg_83_1.duration_ = 11.566

		local var_83_0 = {
			zh = 9.5,
			ja = 11.566
		}
		local var_83_1 = manager.audio:GetLocalizationFlag()

		if var_83_0[var_83_1] ~= nil then
			arg_83_1.duration_ = var_83_0[var_83_1]
		end

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play120021022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1072ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1072ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, -0.71, -6)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1072ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1072ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1072ui_story == nil then
				arg_83_1.var_.characterEffect1072ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.2

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1072ui_story then
					arg_83_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1072ui_story then
				arg_83_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_86_15 = 0
			local var_86_16 = 1.175

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[379].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(120021021)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 47
				local var_86_21 = utf8.len(var_86_19)
				local var_86_22 = var_86_20 <= 0 and var_86_16 or var_86_16 * (var_86_21 / var_86_20)

				if var_86_22 > 0 and var_86_16 < var_86_22 then
					arg_83_1.talkMaxDuration = var_86_22

					if var_86_22 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_19
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021021", "story_v_out_120021.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_out_120021", "120021021", "story_v_out_120021.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_out_120021", "120021021", "story_v_out_120021.awb")

						arg_83_1:RecordAudio("120021021", var_86_24)
						arg_83_1:RecordAudio("120021021", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_120021", "120021021", "story_v_out_120021.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_120021", "120021021", "story_v_out_120021.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_25 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_25 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_25

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_25 and arg_83_1.time_ < var_86_15 + var_86_25 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play120021022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 120021022
		arg_87_1.duration_ = 8.966

		local var_87_0 = {
			zh = 8.966,
			ja = 5
		}
		local var_87_1 = manager.audio:GetLocalizationFlag()

		if var_87_0[var_87_1] ~= nil then
			arg_87_1.duration_ = var_87_0[var_87_1]
		end

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play120021023(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 1.05

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[379].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(120021022)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 42
				local var_90_6 = utf8.len(var_90_4)
				local var_90_7 = var_90_5 <= 0 and var_90_1 or var_90_1 * (var_90_6 / var_90_5)

				if var_90_7 > 0 and var_90_1 < var_90_7 then
					arg_87_1.talkMaxDuration = var_90_7

					if var_90_7 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_7 + var_90_0
					end
				end

				arg_87_1.text_.text = var_90_4
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021022", "story_v_out_120021.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021022", "story_v_out_120021.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_120021", "120021022", "story_v_out_120021.awb")

						arg_87_1:RecordAudio("120021022", var_90_9)
						arg_87_1:RecordAudio("120021022", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_120021", "120021022", "story_v_out_120021.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_120021", "120021022", "story_v_out_120021.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_10 = math.max(var_90_1, arg_87_1.talkMaxDuration)

			if var_90_0 <= arg_87_1.time_ and arg_87_1.time_ < var_90_0 + var_90_10 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_0) / var_90_10

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_0 + var_90_10 and arg_87_1.time_ < var_90_0 + var_90_10 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play120021023 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 120021023
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play120021024(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1072ui_story"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.characterEffect1072ui_story == nil then
				arg_91_1.var_.characterEffect1072ui_story = var_94_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_2 = 0.2

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.characterEffect1072ui_story then
					local var_94_4 = Mathf.Lerp(0, 0.5, var_94_3)

					arg_91_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1072ui_story.fillRatio = var_94_4
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.characterEffect1072ui_story then
				local var_94_5 = 0.5

				arg_91_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1072ui_story.fillRatio = var_94_5
			end

			local var_94_6 = 0
			local var_94_7 = 1.25

			if var_94_6 < arg_91_1.time_ and arg_91_1.time_ <= var_94_6 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_8 = arg_91_1:GetWordFromCfg(120021023)
				local var_94_9 = arg_91_1:FormatText(var_94_8.content)

				arg_91_1.text_.text = var_94_9

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_10 = 50
				local var_94_11 = utf8.len(var_94_9)
				local var_94_12 = var_94_10 <= 0 and var_94_7 or var_94_7 * (var_94_11 / var_94_10)

				if var_94_12 > 0 and var_94_7 < var_94_12 then
					arg_91_1.talkMaxDuration = var_94_12

					if var_94_12 + var_94_6 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_12 + var_94_6
					end
				end

				arg_91_1.text_.text = var_94_9
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_13 = math.max(var_94_7, arg_91_1.talkMaxDuration)

			if var_94_6 <= arg_91_1.time_ and arg_91_1.time_ < var_94_6 + var_94_13 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_6) / var_94_13

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_6 + var_94_13 and arg_91_1.time_ < var_94_6 + var_94_13 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play120021024 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 120021024
		arg_95_1.duration_ = 4.5

		local var_95_0 = {
			zh = 2.5,
			ja = 4.5
		}
		local var_95_1 = manager.audio:GetLocalizationFlag()

		if var_95_0[var_95_1] ~= nil then
			arg_95_1.duration_ = var_95_0[var_95_1]
		end

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play120021025(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1072ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1072ui_story == nil then
				arg_95_1.var_.characterEffect1072ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.2

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1072ui_story then
					arg_95_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1072ui_story then
				arg_95_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_98_4 = 0
			local var_98_5 = 0.275

			if var_98_4 < arg_95_1.time_ and arg_95_1.time_ <= var_98_4 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_6 = arg_95_1:FormatText(StoryNameCfg[379].name)

				arg_95_1.leftNameTxt_.text = var_98_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_7 = arg_95_1:GetWordFromCfg(120021024)
				local var_98_8 = arg_95_1:FormatText(var_98_7.content)

				arg_95_1.text_.text = var_98_8

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_9 = 11
				local var_98_10 = utf8.len(var_98_8)
				local var_98_11 = var_98_9 <= 0 and var_98_5 or var_98_5 * (var_98_10 / var_98_9)

				if var_98_11 > 0 and var_98_5 < var_98_11 then
					arg_95_1.talkMaxDuration = var_98_11

					if var_98_11 + var_98_4 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_11 + var_98_4
					end
				end

				arg_95_1.text_.text = var_98_8
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021024", "story_v_out_120021.awb") ~= 0 then
					local var_98_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021024", "story_v_out_120021.awb") / 1000

					if var_98_12 + var_98_4 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_12 + var_98_4
					end

					if var_98_7.prefab_name ~= "" and arg_95_1.actors_[var_98_7.prefab_name] ~= nil then
						local var_98_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_7.prefab_name].transform, "story_v_out_120021", "120021024", "story_v_out_120021.awb")

						arg_95_1:RecordAudio("120021024", var_98_13)
						arg_95_1:RecordAudio("120021024", var_98_13)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_120021", "120021024", "story_v_out_120021.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_120021", "120021024", "story_v_out_120021.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_14 = math.max(var_98_5, arg_95_1.talkMaxDuration)

			if var_98_4 <= arg_95_1.time_ and arg_95_1.time_ < var_98_4 + var_98_14 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_4) / var_98_14

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_4 + var_98_14 and arg_95_1.time_ < var_98_4 + var_98_14 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play120021025 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 120021025
		arg_99_1.duration_ = 6.233

		local var_99_0 = {
			zh = 6.233,
			ja = 6.133
		}
		local var_99_1 = manager.audio:GetLocalizationFlag()

		if var_99_0[var_99_1] ~= nil then
			arg_99_1.duration_ = var_99_0[var_99_1]
		end

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play120021026(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = "XH0103"

			if arg_99_1.bgs_[var_102_0] == nil then
				local var_102_1 = Object.Instantiate(arg_99_1.paintGo_)

				var_102_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_102_0)
				var_102_1.name = var_102_0
				var_102_1.transform.parent = arg_99_1.stage_.transform
				var_102_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_99_1.bgs_[var_102_0] = var_102_1
			end

			local var_102_2 = 2

			if var_102_2 < arg_99_1.time_ and arg_99_1.time_ <= var_102_2 + arg_102_0 then
				local var_102_3 = manager.ui.mainCamera.transform.localPosition
				local var_102_4 = Vector3.New(0, 0, 10) + Vector3.New(var_102_3.x, var_102_3.y, 0)
				local var_102_5 = arg_99_1.bgs_.XH0103

				var_102_5.transform.localPosition = var_102_4
				var_102_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_102_6 = var_102_5:GetComponent("SpriteRenderer")

				if var_102_6 and var_102_6.sprite then
					local var_102_7 = (var_102_5.transform.localPosition - var_102_3).z
					local var_102_8 = manager.ui.mainCameraCom_
					local var_102_9 = 2 * var_102_7 * Mathf.Tan(var_102_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_102_10 = var_102_9 * var_102_8.aspect
					local var_102_11 = var_102_6.sprite.bounds.size.x
					local var_102_12 = var_102_6.sprite.bounds.size.y
					local var_102_13 = var_102_10 / var_102_11
					local var_102_14 = var_102_9 / var_102_12
					local var_102_15 = var_102_14 < var_102_13 and var_102_13 or var_102_14

					var_102_5.transform.localScale = Vector3.New(var_102_15, var_102_15, 0)
				end

				for iter_102_0, iter_102_1 in pairs(arg_99_1.bgs_) do
					if iter_102_0 ~= "XH0103" then
						iter_102_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_102_16 = arg_99_1.actors_["1072ui_story"].transform
			local var_102_17 = 2

			if var_102_17 < arg_99_1.time_ and arg_99_1.time_ <= var_102_17 + arg_102_0 then
				arg_99_1.var_.moveOldPos1072ui_story = var_102_16.localPosition
			end

			local var_102_18 = 0.001

			if var_102_17 <= arg_99_1.time_ and arg_99_1.time_ < var_102_17 + var_102_18 then
				local var_102_19 = (arg_99_1.time_ - var_102_17) / var_102_18
				local var_102_20 = Vector3.New(0, 100, 0)

				var_102_16.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1072ui_story, var_102_20, var_102_19)

				local var_102_21 = manager.ui.mainCamera.transform.position - var_102_16.position

				var_102_16.forward = Vector3.New(var_102_21.x, var_102_21.y, var_102_21.z)

				local var_102_22 = var_102_16.localEulerAngles

				var_102_22.z = 0
				var_102_22.x = 0
				var_102_16.localEulerAngles = var_102_22
			end

			if arg_99_1.time_ >= var_102_17 + var_102_18 and arg_99_1.time_ < var_102_17 + var_102_18 + arg_102_0 then
				var_102_16.localPosition = Vector3.New(0, 100, 0)

				local var_102_23 = manager.ui.mainCamera.transform.position - var_102_16.position

				var_102_16.forward = Vector3.New(var_102_23.x, var_102_23.y, var_102_23.z)

				local var_102_24 = var_102_16.localEulerAngles

				var_102_24.z = 0
				var_102_24.x = 0
				var_102_16.localEulerAngles = var_102_24
			end

			local var_102_25 = 0

			if var_102_25 < arg_99_1.time_ and arg_99_1.time_ <= var_102_25 + arg_102_0 then
				arg_99_1.mask_.enabled = true
				arg_99_1.mask_.raycastTarget = true

				arg_99_1:SetGaussion(false)
			end

			local var_102_26 = 2

			if var_102_25 <= arg_99_1.time_ and arg_99_1.time_ < var_102_25 + var_102_26 then
				local var_102_27 = (arg_99_1.time_ - var_102_25) / var_102_26
				local var_102_28 = Color.New(0, 0, 0)

				var_102_28.a = Mathf.Lerp(0, 1, var_102_27)
				arg_99_1.mask_.color = var_102_28
			end

			if arg_99_1.time_ >= var_102_25 + var_102_26 and arg_99_1.time_ < var_102_25 + var_102_26 + arg_102_0 then
				local var_102_29 = Color.New(0, 0, 0)

				var_102_29.a = 1
				arg_99_1.mask_.color = var_102_29
			end

			local var_102_30 = 2

			if var_102_30 < arg_99_1.time_ and arg_99_1.time_ <= var_102_30 + arg_102_0 then
				arg_99_1.mask_.enabled = true
				arg_99_1.mask_.raycastTarget = true

				arg_99_1:SetGaussion(false)
			end

			local var_102_31 = 2

			if var_102_30 <= arg_99_1.time_ and arg_99_1.time_ < var_102_30 + var_102_31 then
				local var_102_32 = (arg_99_1.time_ - var_102_30) / var_102_31
				local var_102_33 = Color.New(0, 0, 0)

				var_102_33.a = Mathf.Lerp(1, 0, var_102_32)
				arg_99_1.mask_.color = var_102_33
			end

			if arg_99_1.time_ >= var_102_30 + var_102_31 and arg_99_1.time_ < var_102_30 + var_102_31 + arg_102_0 then
				local var_102_34 = Color.New(0, 0, 0)
				local var_102_35 = 0

				arg_99_1.mask_.enabled = false
				var_102_34.a = var_102_35
				arg_99_1.mask_.color = var_102_34
			end

			local var_102_36 = arg_99_1.bgs_.XH0103.transform
			local var_102_37 = 2

			if var_102_37 < arg_99_1.time_ and arg_99_1.time_ <= var_102_37 + arg_102_0 then
				arg_99_1.var_.moveOldPosXH0103 = var_102_36.localPosition
			end

			local var_102_38 = 0.001

			if var_102_37 <= arg_99_1.time_ and arg_99_1.time_ < var_102_37 + var_102_38 then
				local var_102_39 = (arg_99_1.time_ - var_102_37) / var_102_38
				local var_102_40 = Vector3.New(4.54, -1.3, -0.66)

				var_102_36.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPosXH0103, var_102_40, var_102_39)
			end

			if arg_99_1.time_ >= var_102_37 + var_102_38 and arg_99_1.time_ < var_102_37 + var_102_38 + arg_102_0 then
				var_102_36.localPosition = Vector3.New(4.54, -1.3, -0.66)
			end

			local var_102_41 = arg_99_1.bgs_.XH0103.transform
			local var_102_42 = 2.01666666666667

			if var_102_42 < arg_99_1.time_ and arg_99_1.time_ <= var_102_42 + arg_102_0 then
				arg_99_1.var_.moveOldPosXH0103 = var_102_41.localPosition
			end

			local var_102_43 = 3.5

			if var_102_42 <= arg_99_1.time_ and arg_99_1.time_ < var_102_42 + var_102_43 then
				local var_102_44 = (arg_99_1.time_ - var_102_42) / var_102_43
				local var_102_45 = Vector3.New(5.02, -1.3, -0.66)

				var_102_41.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPosXH0103, var_102_45, var_102_44)
			end

			if arg_99_1.time_ >= var_102_42 + var_102_43 and arg_99_1.time_ < var_102_42 + var_102_43 + arg_102_0 then
				var_102_41.localPosition = Vector3.New(5.02, -1.3, -0.66)
			end

			if arg_99_1.frameCnt_ <= 1 then
				arg_99_1.dialog_:SetActive(false)
			end

			local var_102_46 = 4
			local var_102_47 = 0.175

			if var_102_46 < arg_99_1.time_ and arg_99_1.time_ <= var_102_46 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0

				arg_99_1.dialog_:SetActive(true)

				local var_102_48 = LeanTween.value(arg_99_1.dialog_, 0, 1, 0.3)

				var_102_48:setOnUpdate(LuaHelper.FloatAction(function(arg_103_0)
					arg_99_1.dialogCg_.alpha = arg_103_0
				end))
				var_102_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_99_1.dialog_)
					var_102_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_99_1.duration_ = arg_99_1.duration_ + 0.3

				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_49 = arg_99_1:FormatText(StoryNameCfg[380].name)

				arg_99_1.leftNameTxt_.text = var_102_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_50 = arg_99_1:GetWordFromCfg(120021025)
				local var_102_51 = arg_99_1:FormatText(var_102_50.content)

				arg_99_1.text_.text = var_102_51

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_52 = 7
				local var_102_53 = utf8.len(var_102_51)
				local var_102_54 = var_102_52 <= 0 and var_102_47 or var_102_47 * (var_102_53 / var_102_52)

				if var_102_54 > 0 and var_102_47 < var_102_54 then
					arg_99_1.talkMaxDuration = var_102_54
					var_102_46 = var_102_46 + 0.3

					if var_102_54 + var_102_46 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_54 + var_102_46
					end
				end

				arg_99_1.text_.text = var_102_51
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021025", "story_v_out_120021.awb") ~= 0 then
					local var_102_55 = manager.audio:GetVoiceLength("story_v_out_120021", "120021025", "story_v_out_120021.awb") / 1000

					if var_102_55 + var_102_46 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_55 + var_102_46
					end

					if var_102_50.prefab_name ~= "" and arg_99_1.actors_[var_102_50.prefab_name] ~= nil then
						local var_102_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_50.prefab_name].transform, "story_v_out_120021", "120021025", "story_v_out_120021.awb")

						arg_99_1:RecordAudio("120021025", var_102_56)
						arg_99_1:RecordAudio("120021025", var_102_56)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_120021", "120021025", "story_v_out_120021.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_120021", "120021025", "story_v_out_120021.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_57 = var_102_46 + 0.3
			local var_102_58 = math.max(var_102_47, arg_99_1.talkMaxDuration)

			if var_102_57 <= arg_99_1.time_ and arg_99_1.time_ < var_102_57 + var_102_58 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_57) / var_102_58

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_57 + var_102_58 and arg_99_1.time_ < var_102_57 + var_102_58 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play120021026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 120021026
		arg_105_1.duration_ = 9.733

		local var_105_0 = {
			zh = 8.533,
			ja = 9.733
		}
		local var_105_1 = manager.audio:GetLocalizationFlag()

		if var_105_0[var_105_1] ~= nil then
			arg_105_1.duration_ = var_105_0[var_105_1]
		end

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play120021027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.bgs_.XH0103.transform
			local var_108_1 = 2

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPosXH0103 = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(-1.7, -1.3, -0.66)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPosXH0103, var_108_4, var_108_3)
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(-1.7, -1.3, -0.66)
			end

			local var_108_5 = arg_105_1.bgs_.XH0103.transform
			local var_108_6 = 2.01666666666667

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.var_.moveOldPosXH0103 = var_108_5.localPosition
			end

			local var_108_7 = 3.5

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_7 then
				local var_108_8 = (arg_105_1.time_ - var_108_6) / var_108_7
				local var_108_9 = Vector3.New(-2.3, -1.3, -0.66)

				var_108_5.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPosXH0103, var_108_9, var_108_8)
			end

			if arg_105_1.time_ >= var_108_6 + var_108_7 and arg_105_1.time_ < var_108_6 + var_108_7 + arg_108_0 then
				var_108_5.localPosition = Vector3.New(-2.3, -1.3, -0.66)
			end

			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 then
				arg_105_1.mask_.enabled = true
				arg_105_1.mask_.raycastTarget = true

				arg_105_1:SetGaussion(false)
			end

			local var_108_11 = 2

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11
				local var_108_13 = Color.New(0, 0, 0)

				var_108_13.a = Mathf.Lerp(0, 1, var_108_12)
				arg_105_1.mask_.color = var_108_13
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 then
				local var_108_14 = Color.New(0, 0, 0)

				var_108_14.a = 1
				arg_105_1.mask_.color = var_108_14
			end

			local var_108_15 = 2

			if var_108_15 < arg_105_1.time_ and arg_105_1.time_ <= var_108_15 + arg_108_0 then
				arg_105_1.mask_.enabled = true
				arg_105_1.mask_.raycastTarget = true

				arg_105_1:SetGaussion(false)
			end

			local var_108_16 = 2

			if var_108_15 <= arg_105_1.time_ and arg_105_1.time_ < var_108_15 + var_108_16 then
				local var_108_17 = (arg_105_1.time_ - var_108_15) / var_108_16
				local var_108_18 = Color.New(0, 0, 0)

				var_108_18.a = Mathf.Lerp(1, 0, var_108_17)
				arg_105_1.mask_.color = var_108_18
			end

			if arg_105_1.time_ >= var_108_15 + var_108_16 and arg_105_1.time_ < var_108_15 + var_108_16 + arg_108_0 then
				local var_108_19 = Color.New(0, 0, 0)
				local var_108_20 = 0

				arg_105_1.mask_.enabled = false
				var_108_19.a = var_108_20
				arg_105_1.mask_.color = var_108_19
			end

			if arg_105_1.frameCnt_ <= 1 then
				arg_105_1.dialog_:SetActive(false)
			end

			local var_108_21 = 4.5
			local var_108_22 = 0.25

			if var_108_21 < arg_105_1.time_ and arg_105_1.time_ <= var_108_21 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0

				arg_105_1.dialog_:SetActive(true)

				local var_108_23 = LeanTween.value(arg_105_1.dialog_, 0, 1, 0.3)

				var_108_23:setOnUpdate(LuaHelper.FloatAction(function(arg_109_0)
					arg_105_1.dialogCg_.alpha = arg_109_0
				end))
				var_108_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_105_1.dialog_)
					var_108_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_105_1.duration_ = arg_105_1.duration_ + 0.3

				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_24 = arg_105_1:FormatText(StoryNameCfg[381].name)

				arg_105_1.leftNameTxt_.text = var_108_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, true)
				arg_105_1.iconController_:SetSelectedState("hero")

				arg_105_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_25 = arg_105_1:GetWordFromCfg(120021026)
				local var_108_26 = arg_105_1:FormatText(var_108_25.content)

				arg_105_1.text_.text = var_108_26

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_27 = 9
				local var_108_28 = utf8.len(var_108_26)
				local var_108_29 = var_108_27 <= 0 and var_108_22 or var_108_22 * (var_108_28 / var_108_27)

				if var_108_29 > 0 and var_108_22 < var_108_29 then
					arg_105_1.talkMaxDuration = var_108_29
					var_108_21 = var_108_21 + 0.3

					if var_108_29 + var_108_21 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_29 + var_108_21
					end
				end

				arg_105_1.text_.text = var_108_26
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021026", "story_v_out_120021.awb") ~= 0 then
					local var_108_30 = manager.audio:GetVoiceLength("story_v_out_120021", "120021026", "story_v_out_120021.awb") / 1000

					if var_108_30 + var_108_21 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_30 + var_108_21
					end

					if var_108_25.prefab_name ~= "" and arg_105_1.actors_[var_108_25.prefab_name] ~= nil then
						local var_108_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_25.prefab_name].transform, "story_v_out_120021", "120021026", "story_v_out_120021.awb")

						arg_105_1:RecordAudio("120021026", var_108_31)
						arg_105_1:RecordAudio("120021026", var_108_31)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_120021", "120021026", "story_v_out_120021.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_120021", "120021026", "story_v_out_120021.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_32 = var_108_21 + 0.3
			local var_108_33 = math.max(var_108_22, arg_105_1.talkMaxDuration)

			if var_108_32 <= arg_105_1.time_ and arg_105_1.time_ < var_108_32 + var_108_33 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_32) / var_108_33

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_32 + var_108_33 and arg_105_1.time_ < var_108_32 + var_108_33 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play120021027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 120021027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play120021028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.875

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, false)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_2 = arg_111_1:GetWordFromCfg(120021027)
				local var_114_3 = arg_111_1:FormatText(var_114_2.content)

				arg_111_1.text_.text = var_114_3

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_4 = 35
				local var_114_5 = utf8.len(var_114_3)
				local var_114_6 = var_114_4 <= 0 and var_114_1 or var_114_1 * (var_114_5 / var_114_4)

				if var_114_6 > 0 and var_114_1 < var_114_6 then
					arg_111_1.talkMaxDuration = var_114_6

					if var_114_6 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_6 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_3
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_7 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_7 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_7

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_7 and arg_111_1.time_ < var_114_0 + var_114_7 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play120021028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 120021028
		arg_115_1.duration_ = 13.333

		local var_115_0 = {
			zh = 9.933,
			ja = 13.333
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
				arg_115_0:Play120021029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				local var_118_1 = manager.ui.mainCamera.transform.localPosition
				local var_118_2 = Vector3.New(0, 0, 10) + Vector3.New(var_118_1.x, var_118_1.y, 0)
				local var_118_3 = arg_115_1.bgs_.XH0103

				var_118_3.transform.localPosition = var_118_2
				var_118_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_118_4 = var_118_3:GetComponent("SpriteRenderer")

				if var_118_4 and var_118_4.sprite then
					local var_118_5 = (var_118_3.transform.localPosition - var_118_1).z
					local var_118_6 = manager.ui.mainCameraCom_
					local var_118_7 = 2 * var_118_5 * Mathf.Tan(var_118_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_118_8 = var_118_7 * var_118_6.aspect
					local var_118_9 = var_118_4.sprite.bounds.size.x
					local var_118_10 = var_118_4.sprite.bounds.size.y
					local var_118_11 = var_118_8 / var_118_9
					local var_118_12 = var_118_7 / var_118_10
					local var_118_13 = var_118_12 < var_118_11 and var_118_11 or var_118_12

					var_118_3.transform.localScale = Vector3.New(var_118_13, var_118_13, 0)
				end

				for iter_118_0, iter_118_1 in pairs(arg_115_1.bgs_) do
					if iter_118_0 ~= "XH0103" then
						iter_118_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 then
				arg_115_1.mask_.enabled = true
				arg_115_1.mask_.raycastTarget = true

				arg_115_1:SetGaussion(false)
			end

			local var_118_15 = 3.5

			if var_118_14 <= arg_115_1.time_ and arg_115_1.time_ < var_118_14 + var_118_15 then
				local var_118_16 = (arg_115_1.time_ - var_118_14) / var_118_15
				local var_118_17 = Color.New(1, 1, 1)

				var_118_17.a = Mathf.Lerp(1, 0, var_118_16)
				arg_115_1.mask_.color = var_118_17
			end

			if arg_115_1.time_ >= var_118_14 + var_118_15 and arg_115_1.time_ < var_118_14 + var_118_15 + arg_118_0 then
				local var_118_18 = Color.New(1, 1, 1)
				local var_118_19 = 0

				arg_115_1.mask_.enabled = false
				var_118_18.a = var_118_19
				arg_115_1.mask_.color = var_118_18
			end

			if arg_115_1.frameCnt_ <= 1 then
				arg_115_1.dialog_:SetActive(false)
			end

			local var_118_20 = 3.5
			local var_118_21 = 0.6

			if var_118_20 < arg_115_1.time_ and arg_115_1.time_ <= var_118_20 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0

				arg_115_1.dialog_:SetActive(true)

				local var_118_22 = LeanTween.value(arg_115_1.dialog_, 0, 1, 0.3)

				var_118_22:setOnUpdate(LuaHelper.FloatAction(function(arg_119_0)
					arg_115_1.dialogCg_.alpha = arg_119_0
				end))
				var_118_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_115_1.dialog_)
					var_118_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_115_1.duration_ = arg_115_1.duration_ + 0.3

				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_23 = arg_115_1:FormatText(StoryNameCfg[381].name)

				arg_115_1.leftNameTxt_.text = var_118_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, true)
				arg_115_1.iconController_:SetSelectedState("hero")

				arg_115_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_24 = arg_115_1:GetWordFromCfg(120021028)
				local var_118_25 = arg_115_1:FormatText(var_118_24.content)

				arg_115_1.text_.text = var_118_25

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_26 = 24
				local var_118_27 = utf8.len(var_118_25)
				local var_118_28 = var_118_26 <= 0 and var_118_21 or var_118_21 * (var_118_27 / var_118_26)

				if var_118_28 > 0 and var_118_21 < var_118_28 then
					arg_115_1.talkMaxDuration = var_118_28
					var_118_20 = var_118_20 + 0.3

					if var_118_28 + var_118_20 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_28 + var_118_20
					end
				end

				arg_115_1.text_.text = var_118_25
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021028", "story_v_out_120021.awb") ~= 0 then
					local var_118_29 = manager.audio:GetVoiceLength("story_v_out_120021", "120021028", "story_v_out_120021.awb") / 1000

					if var_118_29 + var_118_20 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_29 + var_118_20
					end

					if var_118_24.prefab_name ~= "" and arg_115_1.actors_[var_118_24.prefab_name] ~= nil then
						local var_118_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_24.prefab_name].transform, "story_v_out_120021", "120021028", "story_v_out_120021.awb")

						arg_115_1:RecordAudio("120021028", var_118_30)
						arg_115_1:RecordAudio("120021028", var_118_30)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_120021", "120021028", "story_v_out_120021.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_120021", "120021028", "story_v_out_120021.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_31 = var_118_20 + 0.3
			local var_118_32 = math.max(var_118_21, arg_115_1.talkMaxDuration)

			if var_118_31 <= arg_115_1.time_ and arg_115_1.time_ < var_118_31 + var_118_32 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_31) / var_118_32

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_31 + var_118_32 and arg_115_1.time_ < var_118_31 + var_118_32 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play120021029 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 120021029
		arg_121_1.duration_ = 1.4

		local var_121_0 = {
			zh = 1.3,
			ja = 1.4
		}
		local var_121_1 = manager.audio:GetLocalizationFlag()

		if var_121_0[var_121_1] ~= nil then
			arg_121_1.duration_ = var_121_0[var_121_1]
		end

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play120021030(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.075

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[380].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, true)
				arg_121_1.iconController_:SetSelectedState("hero")

				arg_121_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10044")

				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(120021029)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021029", "story_v_out_120021.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021029", "story_v_out_120021.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_out_120021", "120021029", "story_v_out_120021.awb")

						arg_121_1:RecordAudio("120021029", var_124_9)
						arg_121_1:RecordAudio("120021029", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_120021", "120021029", "story_v_out_120021.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_120021", "120021029", "story_v_out_120021.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_10 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_10 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_10

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_10 and arg_121_1.time_ < var_124_0 + var_124_10 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play120021030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 120021030
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play120021031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.25

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_2 = arg_125_1:FormatText(StoryNameCfg[7].name)

				arg_125_1.leftNameTxt_.text = var_128_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_3 = arg_125_1:GetWordFromCfg(120021030)
				local var_128_4 = arg_125_1:FormatText(var_128_3.content)

				arg_125_1.text_.text = var_128_4

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_5 = 10
				local var_128_6 = utf8.len(var_128_4)
				local var_128_7 = var_128_5 <= 0 and var_128_1 or var_128_1 * (var_128_6 / var_128_5)

				if var_128_7 > 0 and var_128_1 < var_128_7 then
					arg_125_1.talkMaxDuration = var_128_7

					if var_128_7 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_7 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_4
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_8 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_8 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_8

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_8 and arg_125_1.time_ < var_128_0 + var_128_8 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play120021031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 120021031
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play120021032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 1.325

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_2 = arg_129_1:GetWordFromCfg(120021031)
				local var_132_3 = arg_129_1:FormatText(var_132_2.content)

				arg_129_1.text_.text = var_132_3

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_4 = 53
				local var_132_5 = utf8.len(var_132_3)
				local var_132_6 = var_132_4 <= 0 and var_132_1 or var_132_1 * (var_132_5 / var_132_4)

				if var_132_6 > 0 and var_132_1 < var_132_6 then
					arg_129_1.talkMaxDuration = var_132_6

					if var_132_6 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_6 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_3
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_7 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_7 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_7

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_7 and arg_129_1.time_ < var_132_0 + var_132_7 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play120021032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 120021032
		arg_133_1.duration_ = 5.166

		local var_133_0 = {
			zh = 5.166,
			ja = 4.5
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
				arg_133_0:Play120021033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 0.475

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[380].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, true)
				arg_133_1.iconController_:SetSelectedState("hero")

				arg_133_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10044")

				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(120021032)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 21
				local var_136_6 = utf8.len(var_136_4)
				local var_136_7 = var_136_5 <= 0 and var_136_1 or var_136_1 * (var_136_6 / var_136_5)

				if var_136_7 > 0 and var_136_1 < var_136_7 then
					arg_133_1.talkMaxDuration = var_136_7

					if var_136_7 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_7 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_4
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021032", "story_v_out_120021.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021032", "story_v_out_120021.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_120021", "120021032", "story_v_out_120021.awb")

						arg_133_1:RecordAudio("120021032", var_136_9)
						arg_133_1:RecordAudio("120021032", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_120021", "120021032", "story_v_out_120021.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_120021", "120021032", "story_v_out_120021.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_10 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_10 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_10

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_10 and arg_133_1.time_ < var_136_0 + var_136_10 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play120021033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 120021033
		arg_137_1.duration_ = 9.4

		local var_137_0 = {
			zh = 9.4,
			ja = 7.733
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
				arg_137_0:Play120021034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 1.05

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[381].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(120021033)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 42
				local var_140_6 = utf8.len(var_140_4)
				local var_140_7 = var_140_5 <= 0 and var_140_1 or var_140_1 * (var_140_6 / var_140_5)

				if var_140_7 > 0 and var_140_1 < var_140_7 then
					arg_137_1.talkMaxDuration = var_140_7

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_4
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021033", "story_v_out_120021.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021033", "story_v_out_120021.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_120021", "120021033", "story_v_out_120021.awb")

						arg_137_1:RecordAudio("120021033", var_140_9)
						arg_137_1:RecordAudio("120021033", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_120021", "120021033", "story_v_out_120021.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_120021", "120021033", "story_v_out_120021.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_10 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_10 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_10

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_10 and arg_137_1.time_ < var_140_0 + var_140_10 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play120021034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 120021034
		arg_141_1.duration_ = 5.2

		local var_141_0 = {
			zh = 5.2,
			ja = 4.666
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
				arg_141_0:Play120021035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.525

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_2 = arg_141_1:FormatText(StoryNameCfg[382].name)

				arg_141_1.leftNameTxt_.text = var_144_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, true)
				arg_141_1.iconController_:SetSelectedState("hero")

				arg_141_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_3 = arg_141_1:GetWordFromCfg(120021034)
				local var_144_4 = arg_141_1:FormatText(var_144_3.content)

				arg_141_1.text_.text = var_144_4

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021034", "story_v_out_120021.awb") ~= 0 then
					local var_144_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021034", "story_v_out_120021.awb") / 1000

					if var_144_8 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_0
					end

					if var_144_3.prefab_name ~= "" and arg_141_1.actors_[var_144_3.prefab_name] ~= nil then
						local var_144_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_3.prefab_name].transform, "story_v_out_120021", "120021034", "story_v_out_120021.awb")

						arg_141_1:RecordAudio("120021034", var_144_9)
						arg_141_1:RecordAudio("120021034", var_144_9)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_120021", "120021034", "story_v_out_120021.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_120021", "120021034", "story_v_out_120021.awb")
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
	Play120021035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 120021035
		arg_145_1.duration_ = 5.066

		local var_145_0 = {
			zh = 5.066,
			ja = 2.633
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
				arg_145_0:Play120021036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.4

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[381].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, true)
				arg_145_1.iconController_:SetSelectedState("hero")

				arg_145_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(120021035)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 16
				local var_148_6 = utf8.len(var_148_4)
				local var_148_7 = var_148_5 <= 0 and var_148_1 or var_148_1 * (var_148_6 / var_148_5)

				if var_148_7 > 0 and var_148_1 < var_148_7 then
					arg_145_1.talkMaxDuration = var_148_7

					if var_148_7 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_7 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_4
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021035", "story_v_out_120021.awb") ~= 0 then
					local var_148_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021035", "story_v_out_120021.awb") / 1000

					if var_148_8 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_8 + var_148_0
					end

					if var_148_3.prefab_name ~= "" and arg_145_1.actors_[var_148_3.prefab_name] ~= nil then
						local var_148_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_3.prefab_name].transform, "story_v_out_120021", "120021035", "story_v_out_120021.awb")

						arg_145_1:RecordAudio("120021035", var_148_9)
						arg_145_1:RecordAudio("120021035", var_148_9)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_120021", "120021035", "story_v_out_120021.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_120021", "120021035", "story_v_out_120021.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_10 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_10 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_10

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_10 and arg_145_1.time_ < var_148_0 + var_148_10 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play120021036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 120021036
		arg_149_1.duration_ = 11.233

		local var_149_0 = {
			zh = 9.8,
			ja = 11.233
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
				arg_149_0:Play120021037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 1.1

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[381].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(120021036)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 44
				local var_152_6 = utf8.len(var_152_4)
				local var_152_7 = var_152_5 <= 0 and var_152_1 or var_152_1 * (var_152_6 / var_152_5)

				if var_152_7 > 0 and var_152_1 < var_152_7 then
					arg_149_1.talkMaxDuration = var_152_7

					if var_152_7 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_7 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_4
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021036", "story_v_out_120021.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021036", "story_v_out_120021.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_120021", "120021036", "story_v_out_120021.awb")

						arg_149_1:RecordAudio("120021036", var_152_9)
						arg_149_1:RecordAudio("120021036", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_120021", "120021036", "story_v_out_120021.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_120021", "120021036", "story_v_out_120021.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_10 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_10 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_10

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_10 and arg_149_1.time_ < var_152_0 + var_152_10 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play120021037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 120021037
		arg_153_1.duration_ = 9.1

		local var_153_0 = {
			zh = 6.9,
			ja = 9.1
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
				arg_153_0:Play120021038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.75

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[382].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, true)
				arg_153_1.iconController_:SetSelectedState("hero")

				arg_153_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadowm")

				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(120021037)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 30
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021037", "story_v_out_120021.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021037", "story_v_out_120021.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_120021", "120021037", "story_v_out_120021.awb")

						arg_153_1:RecordAudio("120021037", var_156_9)
						arg_153_1:RecordAudio("120021037", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_120021", "120021037", "story_v_out_120021.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_120021", "120021037", "story_v_out_120021.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_10 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_10 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_10

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_10 and arg_153_1.time_ < var_156_0 + var_156_10 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play120021038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 120021038
		arg_157_1.duration_ = 5.633

		local var_157_0 = {
			zh = 4.566,
			ja = 5.633
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
				arg_157_0:Play120021039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.475

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[381].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, true)
				arg_157_1.iconController_:SetSelectedState("hero")

				arg_157_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(120021038)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 19
				local var_160_6 = utf8.len(var_160_4)
				local var_160_7 = var_160_5 <= 0 and var_160_1 or var_160_1 * (var_160_6 / var_160_5)

				if var_160_7 > 0 and var_160_1 < var_160_7 then
					arg_157_1.talkMaxDuration = var_160_7

					if var_160_7 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_7 + var_160_0
					end
				end

				arg_157_1.text_.text = var_160_4
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021038", "story_v_out_120021.awb") ~= 0 then
					local var_160_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021038", "story_v_out_120021.awb") / 1000

					if var_160_8 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_8 + var_160_0
					end

					if var_160_3.prefab_name ~= "" and arg_157_1.actors_[var_160_3.prefab_name] ~= nil then
						local var_160_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_3.prefab_name].transform, "story_v_out_120021", "120021038", "story_v_out_120021.awb")

						arg_157_1:RecordAudio("120021038", var_160_9)
						arg_157_1:RecordAudio("120021038", var_160_9)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_120021", "120021038", "story_v_out_120021.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_120021", "120021038", "story_v_out_120021.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_10 = math.max(var_160_1, arg_157_1.talkMaxDuration)

			if var_160_0 <= arg_157_1.time_ and arg_157_1.time_ < var_160_0 + var_160_10 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_0) / var_160_10

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_0 + var_160_10 and arg_157_1.time_ < var_160_0 + var_160_10 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play120021039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 120021039
		arg_161_1.duration_ = 3.733

		local var_161_0 = {
			zh = 3.633,
			ja = 3.733
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
				arg_161_0:Play120021040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.4

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[381].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, true)
				arg_161_1.iconController_:SetSelectedState("hero")

				arg_161_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(120021039)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 16
				local var_164_6 = utf8.len(var_164_4)
				local var_164_7 = var_164_5 <= 0 and var_164_1 or var_164_1 * (var_164_6 / var_164_5)

				if var_164_7 > 0 and var_164_1 < var_164_7 then
					arg_161_1.talkMaxDuration = var_164_7

					if var_164_7 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_7 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_4
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021039", "story_v_out_120021.awb") ~= 0 then
					local var_164_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021039", "story_v_out_120021.awb") / 1000

					if var_164_8 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_8 + var_164_0
					end

					if var_164_3.prefab_name ~= "" and arg_161_1.actors_[var_164_3.prefab_name] ~= nil then
						local var_164_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_3.prefab_name].transform, "story_v_out_120021", "120021039", "story_v_out_120021.awb")

						arg_161_1:RecordAudio("120021039", var_164_9)
						arg_161_1:RecordAudio("120021039", var_164_9)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_120021", "120021039", "story_v_out_120021.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_120021", "120021039", "story_v_out_120021.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_10 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_10 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_10

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_10 and arg_161_1.time_ < var_164_0 + var_164_10 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play120021040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 120021040
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play120021041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 1.475

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_2 = arg_165_1:GetWordFromCfg(120021040)
				local var_168_3 = arg_165_1:FormatText(var_168_2.content)

				arg_165_1.text_.text = var_168_3

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_4 = 59
				local var_168_5 = utf8.len(var_168_3)
				local var_168_6 = var_168_4 <= 0 and var_168_1 or var_168_1 * (var_168_5 / var_168_4)

				if var_168_6 > 0 and var_168_1 < var_168_6 then
					arg_165_1.talkMaxDuration = var_168_6

					if var_168_6 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_6 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_3
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_7 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_7 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_7

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_7 and arg_165_1.time_ < var_168_0 + var_168_7 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play120021041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 120021041
		arg_169_1.duration_ = 9

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play120021042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 2

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				local var_172_1 = manager.ui.mainCamera.transform.localPosition
				local var_172_2 = Vector3.New(0, 0, 10) + Vector3.New(var_172_1.x, var_172_1.y, 0)
				local var_172_3 = arg_169_1.bgs_.ST29

				var_172_3.transform.localPosition = var_172_2
				var_172_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_172_4 = var_172_3:GetComponent("SpriteRenderer")

				if var_172_4 and var_172_4.sprite then
					local var_172_5 = (var_172_3.transform.localPosition - var_172_1).z
					local var_172_6 = manager.ui.mainCameraCom_
					local var_172_7 = 2 * var_172_5 * Mathf.Tan(var_172_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_172_8 = var_172_7 * var_172_6.aspect
					local var_172_9 = var_172_4.sprite.bounds.size.x
					local var_172_10 = var_172_4.sprite.bounds.size.y
					local var_172_11 = var_172_8 / var_172_9
					local var_172_12 = var_172_7 / var_172_10
					local var_172_13 = var_172_12 < var_172_11 and var_172_11 or var_172_12

					var_172_3.transform.localScale = Vector3.New(var_172_13, var_172_13, 0)
				end

				for iter_172_0, iter_172_1 in pairs(arg_169_1.bgs_) do
					if iter_172_0 ~= "ST29" then
						iter_172_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1.mask_.enabled = true
				arg_169_1.mask_.raycastTarget = true

				arg_169_1:SetGaussion(false)
			end

			local var_172_15 = 2

			if var_172_14 <= arg_169_1.time_ and arg_169_1.time_ < var_172_14 + var_172_15 then
				local var_172_16 = (arg_169_1.time_ - var_172_14) / var_172_15
				local var_172_17 = Color.New(0, 0, 0)

				var_172_17.a = Mathf.Lerp(0, 1, var_172_16)
				arg_169_1.mask_.color = var_172_17
			end

			if arg_169_1.time_ >= var_172_14 + var_172_15 and arg_169_1.time_ < var_172_14 + var_172_15 + arg_172_0 then
				local var_172_18 = Color.New(0, 0, 0)

				var_172_18.a = 1
				arg_169_1.mask_.color = var_172_18
			end

			local var_172_19 = 2

			if var_172_19 < arg_169_1.time_ and arg_169_1.time_ <= var_172_19 + arg_172_0 then
				arg_169_1.mask_.enabled = true
				arg_169_1.mask_.raycastTarget = true

				arg_169_1:SetGaussion(false)
			end

			local var_172_20 = 2

			if var_172_19 <= arg_169_1.time_ and arg_169_1.time_ < var_172_19 + var_172_20 then
				local var_172_21 = (arg_169_1.time_ - var_172_19) / var_172_20
				local var_172_22 = Color.New(0, 0, 0)

				var_172_22.a = Mathf.Lerp(1, 0, var_172_21)
				arg_169_1.mask_.color = var_172_22
			end

			if arg_169_1.time_ >= var_172_19 + var_172_20 and arg_169_1.time_ < var_172_19 + var_172_20 + arg_172_0 then
				local var_172_23 = Color.New(0, 0, 0)
				local var_172_24 = 0

				arg_169_1.mask_.enabled = false
				var_172_23.a = var_172_24
				arg_169_1.mask_.color = var_172_23
			end

			if arg_169_1.frameCnt_ <= 1 then
				arg_169_1.dialog_:SetActive(false)
			end

			local var_172_25 = 4
			local var_172_26 = 1.15

			if var_172_25 < arg_169_1.time_ and arg_169_1.time_ <= var_172_25 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0

				arg_169_1.dialog_:SetActive(true)

				local var_172_27 = LeanTween.value(arg_169_1.dialog_, 0, 1, 0.3)

				var_172_27:setOnUpdate(LuaHelper.FloatAction(function(arg_173_0)
					arg_169_1.dialogCg_.alpha = arg_173_0
				end))
				var_172_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_169_1.dialog_)
					var_172_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_169_1.duration_ = arg_169_1.duration_ + 0.3

				SetActive(arg_169_1.leftNameGo_, false)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_28 = arg_169_1:GetWordFromCfg(120021041)
				local var_172_29 = arg_169_1:FormatText(var_172_28.content)

				arg_169_1.text_.text = var_172_29

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_30 = 46
				local var_172_31 = utf8.len(var_172_29)
				local var_172_32 = var_172_30 <= 0 and var_172_26 or var_172_26 * (var_172_31 / var_172_30)

				if var_172_32 > 0 and var_172_26 < var_172_32 then
					arg_169_1.talkMaxDuration = var_172_32
					var_172_25 = var_172_25 + 0.3

					if var_172_32 + var_172_25 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_32 + var_172_25
					end
				end

				arg_169_1.text_.text = var_172_29
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_33 = var_172_25 + 0.3
			local var_172_34 = math.max(var_172_26, arg_169_1.talkMaxDuration)

			if var_172_33 <= arg_169_1.time_ and arg_169_1.time_ < var_172_33 + var_172_34 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_33) / var_172_34

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_33 + var_172_34 and arg_169_1.time_ < var_172_33 + var_172_34 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play120021042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 120021042
		arg_175_1.duration_ = 12.066

		local var_175_0 = {
			zh = 4.3,
			ja = 12.066
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
				arg_175_0:Play120021043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = "1075ui_story"

			if arg_175_1.actors_[var_178_0] == nil then
				local var_178_1 = Object.Instantiate(Asset.Load("Char/" .. var_178_0), arg_175_1.stage_.transform)

				var_178_1.name = var_178_0
				var_178_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_175_1.actors_[var_178_0] = var_178_1

				local var_178_2 = var_178_1:GetComponentInChildren(typeof(CharacterEffect))

				var_178_2.enabled = true

				local var_178_3 = GameObjectTools.GetOrAddComponent(var_178_1, typeof(DynamicBoneHelper))

				if var_178_3 then
					var_178_3:EnableDynamicBone(false)
				end

				arg_175_1:ShowWeapon(var_178_2.transform, false)

				arg_175_1.var_[var_178_0 .. "Animator"] = var_178_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_175_1.var_[var_178_0 .. "Animator"].applyRootMotion = true
				arg_175_1.var_[var_178_0 .. "LipSync"] = var_178_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_178_4 = arg_175_1.actors_["1075ui_story"].transform
			local var_178_5 = 0

			if var_178_5 < arg_175_1.time_ and arg_175_1.time_ <= var_178_5 + arg_178_0 then
				arg_175_1.var_.moveOldPos1075ui_story = var_178_4.localPosition
			end

			local var_178_6 = 0.001

			if var_178_5 <= arg_175_1.time_ and arg_175_1.time_ < var_178_5 + var_178_6 then
				local var_178_7 = (arg_175_1.time_ - var_178_5) / var_178_6
				local var_178_8 = Vector3.New(-0.7, -1.055, -6.16)

				var_178_4.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1075ui_story, var_178_8, var_178_7)

				local var_178_9 = manager.ui.mainCamera.transform.position - var_178_4.position

				var_178_4.forward = Vector3.New(var_178_9.x, var_178_9.y, var_178_9.z)

				local var_178_10 = var_178_4.localEulerAngles

				var_178_10.z = 0
				var_178_10.x = 0
				var_178_4.localEulerAngles = var_178_10
			end

			if arg_175_1.time_ >= var_178_5 + var_178_6 and arg_175_1.time_ < var_178_5 + var_178_6 + arg_178_0 then
				var_178_4.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_178_11 = manager.ui.mainCamera.transform.position - var_178_4.position

				var_178_4.forward = Vector3.New(var_178_11.x, var_178_11.y, var_178_11.z)

				local var_178_12 = var_178_4.localEulerAngles

				var_178_12.z = 0
				var_178_12.x = 0
				var_178_4.localEulerAngles = var_178_12
			end

			local var_178_13 = arg_175_1.actors_["1075ui_story"]
			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 and arg_175_1.var_.characterEffect1075ui_story == nil then
				arg_175_1.var_.characterEffect1075ui_story = var_178_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_15 = 0.2

			if var_178_14 <= arg_175_1.time_ and arg_175_1.time_ < var_178_14 + var_178_15 then
				local var_178_16 = (arg_175_1.time_ - var_178_14) / var_178_15

				if arg_175_1.var_.characterEffect1075ui_story then
					arg_175_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_14 + var_178_15 and arg_175_1.time_ < var_178_14 + var_178_15 + arg_178_0 and arg_175_1.var_.characterEffect1075ui_story then
				arg_175_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_178_17 = 0

			if var_178_17 < arg_175_1.time_ and arg_175_1.time_ <= var_178_17 + arg_178_0 then
				arg_175_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action2_1")
			end

			local var_178_18 = 0

			if var_178_18 < arg_175_1.time_ and arg_175_1.time_ <= var_178_18 + arg_178_0 then
				arg_175_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_178_19 = "10044ui_story"

			if arg_175_1.actors_[var_178_19] == nil then
				local var_178_20 = Object.Instantiate(Asset.Load("Char/" .. var_178_19), arg_175_1.stage_.transform)

				var_178_20.name = var_178_19
				var_178_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_175_1.actors_[var_178_19] = var_178_20

				local var_178_21 = var_178_20:GetComponentInChildren(typeof(CharacterEffect))

				var_178_21.enabled = true

				local var_178_22 = GameObjectTools.GetOrAddComponent(var_178_20, typeof(DynamicBoneHelper))

				if var_178_22 then
					var_178_22:EnableDynamicBone(false)
				end

				arg_175_1:ShowWeapon(var_178_21.transform, false)

				arg_175_1.var_[var_178_19 .. "Animator"] = var_178_21.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_175_1.var_[var_178_19 .. "Animator"].applyRootMotion = true
				arg_175_1.var_[var_178_19 .. "LipSync"] = var_178_21.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_178_23 = arg_175_1.actors_["10044ui_story"].transform
			local var_178_24 = 0

			if var_178_24 < arg_175_1.time_ and arg_175_1.time_ <= var_178_24 + arg_178_0 then
				arg_175_1.var_.moveOldPos10044ui_story = var_178_23.localPosition
			end

			local var_178_25 = 0.001

			if var_178_24 <= arg_175_1.time_ and arg_175_1.time_ < var_178_24 + var_178_25 then
				local var_178_26 = (arg_175_1.time_ - var_178_24) / var_178_25
				local var_178_27 = Vector3.New(0.7, -0.72, -6.3)

				var_178_23.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10044ui_story, var_178_27, var_178_26)

				local var_178_28 = manager.ui.mainCamera.transform.position - var_178_23.position

				var_178_23.forward = Vector3.New(var_178_28.x, var_178_28.y, var_178_28.z)

				local var_178_29 = var_178_23.localEulerAngles

				var_178_29.z = 0
				var_178_29.x = 0
				var_178_23.localEulerAngles = var_178_29
			end

			if arg_175_1.time_ >= var_178_24 + var_178_25 and arg_175_1.time_ < var_178_24 + var_178_25 + arg_178_0 then
				var_178_23.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_178_30 = manager.ui.mainCamera.transform.position - var_178_23.position

				var_178_23.forward = Vector3.New(var_178_30.x, var_178_30.y, var_178_30.z)

				local var_178_31 = var_178_23.localEulerAngles

				var_178_31.z = 0
				var_178_31.x = 0
				var_178_23.localEulerAngles = var_178_31
			end

			local var_178_32 = arg_175_1.actors_["10044ui_story"]
			local var_178_33 = 0

			if var_178_33 < arg_175_1.time_ and arg_175_1.time_ <= var_178_33 + arg_178_0 and arg_175_1.var_.characterEffect10044ui_story == nil then
				arg_175_1.var_.characterEffect10044ui_story = var_178_32:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_34 = 0.0166666666666667

			if var_178_33 <= arg_175_1.time_ and arg_175_1.time_ < var_178_33 + var_178_34 then
				local var_178_35 = (arg_175_1.time_ - var_178_33) / var_178_34

				if arg_175_1.var_.characterEffect10044ui_story then
					local var_178_36 = Mathf.Lerp(0, 0.5, var_178_35)

					arg_175_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_175_1.var_.characterEffect10044ui_story.fillRatio = var_178_36
				end
			end

			if arg_175_1.time_ >= var_178_33 + var_178_34 and arg_175_1.time_ < var_178_33 + var_178_34 + arg_178_0 and arg_175_1.var_.characterEffect10044ui_story then
				local var_178_37 = 0.5

				arg_175_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_175_1.var_.characterEffect10044ui_story.fillRatio = var_178_37
			end

			local var_178_38 = 0

			if var_178_38 < arg_175_1.time_ and arg_175_1.time_ <= var_178_38 + arg_178_0 then
				arg_175_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_178_39 = 0
			local var_178_40 = 0.525

			if var_178_39 < arg_175_1.time_ and arg_175_1.time_ <= var_178_39 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_41 = arg_175_1:FormatText(StoryNameCfg[381].name)

				arg_175_1.leftNameTxt_.text = var_178_41

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_42 = arg_175_1:GetWordFromCfg(120021042)
				local var_178_43 = arg_175_1:FormatText(var_178_42.content)

				arg_175_1.text_.text = var_178_43

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_44 = 21
				local var_178_45 = utf8.len(var_178_43)
				local var_178_46 = var_178_44 <= 0 and var_178_40 or var_178_40 * (var_178_45 / var_178_44)

				if var_178_46 > 0 and var_178_40 < var_178_46 then
					arg_175_1.talkMaxDuration = var_178_46

					if var_178_46 + var_178_39 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_46 + var_178_39
					end
				end

				arg_175_1.text_.text = var_178_43
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021042", "story_v_out_120021.awb") ~= 0 then
					local var_178_47 = manager.audio:GetVoiceLength("story_v_out_120021", "120021042", "story_v_out_120021.awb") / 1000

					if var_178_47 + var_178_39 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_47 + var_178_39
					end

					if var_178_42.prefab_name ~= "" and arg_175_1.actors_[var_178_42.prefab_name] ~= nil then
						local var_178_48 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_42.prefab_name].transform, "story_v_out_120021", "120021042", "story_v_out_120021.awb")

						arg_175_1:RecordAudio("120021042", var_178_48)
						arg_175_1:RecordAudio("120021042", var_178_48)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_120021", "120021042", "story_v_out_120021.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_120021", "120021042", "story_v_out_120021.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_49 = math.max(var_178_40, arg_175_1.talkMaxDuration)

			if var_178_39 <= arg_175_1.time_ and arg_175_1.time_ < var_178_39 + var_178_49 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_39) / var_178_49

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_39 + var_178_49 and arg_175_1.time_ < var_178_39 + var_178_49 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play120021043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120021043
		arg_179_1.duration_ = 6.8

		local var_179_0 = {
			zh = 6.6,
			ja = 6.8
		}
		local var_179_1 = manager.audio:GetLocalizationFlag()

		if var_179_0[var_179_1] ~= nil then
			arg_179_1.duration_ = var_179_0[var_179_1]
		end

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play120021044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 0.725

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[381].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(120021043)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 29
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021043", "story_v_out_120021.awb") ~= 0 then
					local var_182_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021043", "story_v_out_120021.awb") / 1000

					if var_182_8 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_8 + var_182_0
					end

					if var_182_3.prefab_name ~= "" and arg_179_1.actors_[var_182_3.prefab_name] ~= nil then
						local var_182_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_3.prefab_name].transform, "story_v_out_120021", "120021043", "story_v_out_120021.awb")

						arg_179_1:RecordAudio("120021043", var_182_9)
						arg_179_1:RecordAudio("120021043", var_182_9)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_120021", "120021043", "story_v_out_120021.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_120021", "120021043", "story_v_out_120021.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_10 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_10 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_10

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_10 and arg_179_1.time_ < var_182_0 + var_182_10 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play120021044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120021044
		arg_183_1.duration_ = 7.6

		local var_183_0 = {
			zh = 6.1,
			ja = 7.6
		}
		local var_183_1 = manager.audio:GetLocalizationFlag()

		if var_183_0[var_183_1] ~= nil then
			arg_183_1.duration_ = var_183_0[var_183_1]
		end

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play120021045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1075ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story == nil then
				arg_183_1.var_.characterEffect1075ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.2

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1075ui_story then
					local var_186_4 = Mathf.Lerp(0, 0.5, var_186_3)

					arg_183_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1075ui_story.fillRatio = var_186_4
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story then
				local var_186_5 = 0.5

				arg_183_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1075ui_story.fillRatio = var_186_5
			end

			local var_186_6 = arg_183_1.actors_["10044ui_story"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 and arg_183_1.var_.characterEffect10044ui_story == nil then
				arg_183_1.var_.characterEffect10044ui_story = var_186_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_8 = 0.2

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8

				if arg_183_1.var_.characterEffect10044ui_story then
					arg_183_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 and arg_183_1.var_.characterEffect10044ui_story then
				arg_183_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 then
				arg_183_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_186_11 = 0

			if var_186_11 < arg_183_1.time_ and arg_183_1.time_ <= var_186_11 + arg_186_0 then
				arg_183_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_186_12 = 0
			local var_186_13 = 0.625

			if var_186_12 < arg_183_1.time_ and arg_183_1.time_ <= var_186_12 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_14 = arg_183_1:FormatText(StoryNameCfg[380].name)

				arg_183_1.leftNameTxt_.text = var_186_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_15 = arg_183_1:GetWordFromCfg(120021044)
				local var_186_16 = arg_183_1:FormatText(var_186_15.content)

				arg_183_1.text_.text = var_186_16

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_17 = 25
				local var_186_18 = utf8.len(var_186_16)
				local var_186_19 = var_186_17 <= 0 and var_186_13 or var_186_13 * (var_186_18 / var_186_17)

				if var_186_19 > 0 and var_186_13 < var_186_19 then
					arg_183_1.talkMaxDuration = var_186_19

					if var_186_19 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_19 + var_186_12
					end
				end

				arg_183_1.text_.text = var_186_16
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021044", "story_v_out_120021.awb") ~= 0 then
					local var_186_20 = manager.audio:GetVoiceLength("story_v_out_120021", "120021044", "story_v_out_120021.awb") / 1000

					if var_186_20 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_20 + var_186_12
					end

					if var_186_15.prefab_name ~= "" and arg_183_1.actors_[var_186_15.prefab_name] ~= nil then
						local var_186_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_15.prefab_name].transform, "story_v_out_120021", "120021044", "story_v_out_120021.awb")

						arg_183_1:RecordAudio("120021044", var_186_21)
						arg_183_1:RecordAudio("120021044", var_186_21)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_120021", "120021044", "story_v_out_120021.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_120021", "120021044", "story_v_out_120021.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_22 = math.max(var_186_13, arg_183_1.talkMaxDuration)

			if var_186_12 <= arg_183_1.time_ and arg_183_1.time_ < var_186_12 + var_186_22 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_12) / var_186_22

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_12 + var_186_22 and arg_183_1.time_ < var_186_12 + var_186_22 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play120021045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120021045
		arg_187_1.duration_ = 5.766

		local var_187_0 = {
			zh = 5.766,
			ja = 5.6
		}
		local var_187_1 = manager.audio:GetLocalizationFlag()

		if var_187_0[var_187_1] ~= nil then
			arg_187_1.duration_ = var_187_0[var_187_1]
		end

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play120021046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1075ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story == nil then
				arg_187_1.var_.characterEffect1075ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.2

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1075ui_story then
					arg_187_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story then
				arg_187_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_190_4 = arg_187_1.actors_["10044ui_story"]
			local var_190_5 = 0

			if var_190_5 < arg_187_1.time_ and arg_187_1.time_ <= var_190_5 + arg_190_0 and arg_187_1.var_.characterEffect10044ui_story == nil then
				arg_187_1.var_.characterEffect10044ui_story = var_190_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_6 = 0.2

			if var_190_5 <= arg_187_1.time_ and arg_187_1.time_ < var_190_5 + var_190_6 then
				local var_190_7 = (arg_187_1.time_ - var_190_5) / var_190_6

				if arg_187_1.var_.characterEffect10044ui_story then
					local var_190_8 = Mathf.Lerp(0, 0.5, var_190_7)

					arg_187_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_187_1.var_.characterEffect10044ui_story.fillRatio = var_190_8
				end
			end

			if arg_187_1.time_ >= var_190_5 + var_190_6 and arg_187_1.time_ < var_190_5 + var_190_6 + arg_190_0 and arg_187_1.var_.characterEffect10044ui_story then
				local var_190_9 = 0.5

				arg_187_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_187_1.var_.characterEffect10044ui_story.fillRatio = var_190_9
			end

			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 then
				arg_187_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action2_2")
			end

			local var_190_11 = 0

			if var_190_11 < arg_187_1.time_ and arg_187_1.time_ <= var_190_11 + arg_190_0 then
				arg_187_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_190_12 = 0
			local var_190_13 = 0.5

			if var_190_12 < arg_187_1.time_ and arg_187_1.time_ <= var_190_12 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_14 = arg_187_1:FormatText(StoryNameCfg[381].name)

				arg_187_1.leftNameTxt_.text = var_190_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_15 = arg_187_1:GetWordFromCfg(120021045)
				local var_190_16 = arg_187_1:FormatText(var_190_15.content)

				arg_187_1.text_.text = var_190_16

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_17 = 20
				local var_190_18 = utf8.len(var_190_16)
				local var_190_19 = var_190_17 <= 0 and var_190_13 or var_190_13 * (var_190_18 / var_190_17)

				if var_190_19 > 0 and var_190_13 < var_190_19 then
					arg_187_1.talkMaxDuration = var_190_19

					if var_190_19 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_19 + var_190_12
					end
				end

				arg_187_1.text_.text = var_190_16
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021045", "story_v_out_120021.awb") ~= 0 then
					local var_190_20 = manager.audio:GetVoiceLength("story_v_out_120021", "120021045", "story_v_out_120021.awb") / 1000

					if var_190_20 + var_190_12 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_20 + var_190_12
					end

					if var_190_15.prefab_name ~= "" and arg_187_1.actors_[var_190_15.prefab_name] ~= nil then
						local var_190_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_15.prefab_name].transform, "story_v_out_120021", "120021045", "story_v_out_120021.awb")

						arg_187_1:RecordAudio("120021045", var_190_21)
						arg_187_1:RecordAudio("120021045", var_190_21)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_120021", "120021045", "story_v_out_120021.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_120021", "120021045", "story_v_out_120021.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_22 = math.max(var_190_13, arg_187_1.talkMaxDuration)

			if var_190_12 <= arg_187_1.time_ and arg_187_1.time_ < var_190_12 + var_190_22 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_12) / var_190_22

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_12 + var_190_22 and arg_187_1.time_ < var_190_12 + var_190_22 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play120021046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120021046
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play120021047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1075ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1075ui_story == nil then
				arg_191_1.var_.characterEffect1075ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.2

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1075ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1075ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1075ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1075ui_story.fillRatio = var_194_5
			end

			local var_194_6 = 0
			local var_194_7 = 0.275

			if var_194_6 < arg_191_1.time_ and arg_191_1.time_ <= var_194_6 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_8 = arg_191_1:FormatText(StoryNameCfg[7].name)

				arg_191_1.leftNameTxt_.text = var_194_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_9 = arg_191_1:GetWordFromCfg(120021046)
				local var_194_10 = arg_191_1:FormatText(var_194_9.content)

				arg_191_1.text_.text = var_194_10

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_11 = 11
				local var_194_12 = utf8.len(var_194_10)
				local var_194_13 = var_194_11 <= 0 and var_194_7 or var_194_7 * (var_194_12 / var_194_11)

				if var_194_13 > 0 and var_194_7 < var_194_13 then
					arg_191_1.talkMaxDuration = var_194_13

					if var_194_13 + var_194_6 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_13 + var_194_6
					end
				end

				arg_191_1.text_.text = var_194_10
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_14 = math.max(var_194_7, arg_191_1.talkMaxDuration)

			if var_194_6 <= arg_191_1.time_ and arg_191_1.time_ < var_194_6 + var_194_14 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_6) / var_194_14

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_6 + var_194_14 and arg_191_1.time_ < var_194_6 + var_194_14 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play120021047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120021047
		arg_195_1.duration_ = 6.433

		local var_195_0 = {
			zh = 5.233,
			ja = 6.433
		}
		local var_195_1 = manager.audio:GetLocalizationFlag()

		if var_195_0[var_195_1] ~= nil then
			arg_195_1.duration_ = var_195_0[var_195_1]
		end

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play120021048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1075ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1075ui_story == nil then
				arg_195_1.var_.characterEffect1075ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.2

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1075ui_story then
					arg_195_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1075ui_story then
				arg_195_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_198_4 = 0

			if var_198_4 < arg_195_1.time_ and arg_195_1.time_ <= var_198_4 + arg_198_0 then
				arg_195_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_198_5 = 0

			if var_198_5 < arg_195_1.time_ and arg_195_1.time_ <= var_198_5 + arg_198_0 then
				arg_195_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action6_1")
			end

			local var_198_6 = 0
			local var_198_7 = 0.55

			if var_198_6 < arg_195_1.time_ and arg_195_1.time_ <= var_198_6 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_8 = arg_195_1:FormatText(StoryNameCfg[381].name)

				arg_195_1.leftNameTxt_.text = var_198_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_9 = arg_195_1:GetWordFromCfg(120021047)
				local var_198_10 = arg_195_1:FormatText(var_198_9.content)

				arg_195_1.text_.text = var_198_10

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_11 = 22
				local var_198_12 = utf8.len(var_198_10)
				local var_198_13 = var_198_11 <= 0 and var_198_7 or var_198_7 * (var_198_12 / var_198_11)

				if var_198_13 > 0 and var_198_7 < var_198_13 then
					arg_195_1.talkMaxDuration = var_198_13

					if var_198_13 + var_198_6 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_13 + var_198_6
					end
				end

				arg_195_1.text_.text = var_198_10
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021047", "story_v_out_120021.awb") ~= 0 then
					local var_198_14 = manager.audio:GetVoiceLength("story_v_out_120021", "120021047", "story_v_out_120021.awb") / 1000

					if var_198_14 + var_198_6 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_14 + var_198_6
					end

					if var_198_9.prefab_name ~= "" and arg_195_1.actors_[var_198_9.prefab_name] ~= nil then
						local var_198_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_9.prefab_name].transform, "story_v_out_120021", "120021047", "story_v_out_120021.awb")

						arg_195_1:RecordAudio("120021047", var_198_15)
						arg_195_1:RecordAudio("120021047", var_198_15)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_120021", "120021047", "story_v_out_120021.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_120021", "120021047", "story_v_out_120021.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_16 = math.max(var_198_7, arg_195_1.talkMaxDuration)

			if var_198_6 <= arg_195_1.time_ and arg_195_1.time_ < var_198_6 + var_198_16 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_6) / var_198_16

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_6 + var_198_16 and arg_195_1.time_ < var_198_6 + var_198_16 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play120021048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 120021048
		arg_199_1.duration_ = 2.066

		local var_199_0 = {
			zh = 2.066,
			ja = 1.999999999999
		}
		local var_199_1 = manager.audio:GetLocalizationFlag()

		if var_199_0[var_199_1] ~= nil then
			arg_199_1.duration_ = var_199_0[var_199_1]
		end

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play120021049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10044ui_story"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos10044ui_story = var_202_0.localPosition
			end

			local var_202_2 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2
				local var_202_4 = Vector3.New(0, 100, 0)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10044ui_story, var_202_4, var_202_3)

				local var_202_5 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_5.x, var_202_5.y, var_202_5.z)

				local var_202_6 = var_202_0.localEulerAngles

				var_202_6.z = 0
				var_202_6.x = 0
				var_202_0.localEulerAngles = var_202_6
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0, 100, 0)

				local var_202_7 = manager.ui.mainCamera.transform.position - var_202_0.position

				var_202_0.forward = Vector3.New(var_202_7.x, var_202_7.y, var_202_7.z)

				local var_202_8 = var_202_0.localEulerAngles

				var_202_8.z = 0
				var_202_8.x = 0
				var_202_0.localEulerAngles = var_202_8
			end

			local var_202_9 = arg_199_1.actors_["1069ui_story"].transform
			local var_202_10 = 0

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1.var_.moveOldPos1069ui_story = var_202_9.localPosition
			end

			local var_202_11 = 0.001

			if var_202_10 <= arg_199_1.time_ and arg_199_1.time_ < var_202_10 + var_202_11 then
				local var_202_12 = (arg_199_1.time_ - var_202_10) / var_202_11
				local var_202_13 = Vector3.New(0.7, -1, -6)

				var_202_9.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos1069ui_story, var_202_13, var_202_12)

				local var_202_14 = manager.ui.mainCamera.transform.position - var_202_9.position

				var_202_9.forward = Vector3.New(var_202_14.x, var_202_14.y, var_202_14.z)

				local var_202_15 = var_202_9.localEulerAngles

				var_202_15.z = 0
				var_202_15.x = 0
				var_202_9.localEulerAngles = var_202_15
			end

			if arg_199_1.time_ >= var_202_10 + var_202_11 and arg_199_1.time_ < var_202_10 + var_202_11 + arg_202_0 then
				var_202_9.localPosition = Vector3.New(0.7, -1, -6)

				local var_202_16 = manager.ui.mainCamera.transform.position - var_202_9.position

				var_202_9.forward = Vector3.New(var_202_16.x, var_202_16.y, var_202_16.z)

				local var_202_17 = var_202_9.localEulerAngles

				var_202_17.z = 0
				var_202_17.x = 0
				var_202_9.localEulerAngles = var_202_17
			end

			local var_202_18 = arg_199_1.actors_["1069ui_story"]
			local var_202_19 = 0

			if var_202_19 < arg_199_1.time_ and arg_199_1.time_ <= var_202_19 + arg_202_0 and arg_199_1.var_.characterEffect1069ui_story == nil then
				arg_199_1.var_.characterEffect1069ui_story = var_202_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_20 = 0.2

			if var_202_19 <= arg_199_1.time_ and arg_199_1.time_ < var_202_19 + var_202_20 then
				local var_202_21 = (arg_199_1.time_ - var_202_19) / var_202_20

				if arg_199_1.var_.characterEffect1069ui_story then
					arg_199_1.var_.characterEffect1069ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_19 + var_202_20 and arg_199_1.time_ < var_202_19 + var_202_20 + arg_202_0 and arg_199_1.var_.characterEffect1069ui_story then
				arg_199_1.var_.characterEffect1069ui_story.fillFlat = false
			end

			local var_202_22 = arg_199_1.actors_["1075ui_story"]
			local var_202_23 = 0

			if var_202_23 < arg_199_1.time_ and arg_199_1.time_ <= var_202_23 + arg_202_0 and arg_199_1.var_.characterEffect1075ui_story == nil then
				arg_199_1.var_.characterEffect1075ui_story = var_202_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_24 = 0.2

			if var_202_23 <= arg_199_1.time_ and arg_199_1.time_ < var_202_23 + var_202_24 then
				local var_202_25 = (arg_199_1.time_ - var_202_23) / var_202_24

				if arg_199_1.var_.characterEffect1075ui_story then
					local var_202_26 = Mathf.Lerp(0, 0.5, var_202_25)

					arg_199_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_199_1.var_.characterEffect1075ui_story.fillRatio = var_202_26
				end
			end

			if arg_199_1.time_ >= var_202_23 + var_202_24 and arg_199_1.time_ < var_202_23 + var_202_24 + arg_202_0 and arg_199_1.var_.characterEffect1075ui_story then
				local var_202_27 = 0.5

				arg_199_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_199_1.var_.characterEffect1075ui_story.fillRatio = var_202_27
			end

			local var_202_28 = 0

			if var_202_28 < arg_199_1.time_ and arg_199_1.time_ <= var_202_28 + arg_202_0 then
				arg_199_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/story1069/story1069action/1069action4_1")
			end

			local var_202_29 = 0

			if var_202_29 < arg_199_1.time_ and arg_199_1.time_ <= var_202_29 + arg_202_0 then
				arg_199_1:PlayTimeline("1069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_202_30 = 0
			local var_202_31 = 0.15

			if var_202_30 < arg_199_1.time_ and arg_199_1.time_ <= var_202_30 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_32 = arg_199_1:FormatText(StoryNameCfg[378].name)

				arg_199_1.leftNameTxt_.text = var_202_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_33 = arg_199_1:GetWordFromCfg(120021048)
				local var_202_34 = arg_199_1:FormatText(var_202_33.content)

				arg_199_1.text_.text = var_202_34

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_35 = 6
				local var_202_36 = utf8.len(var_202_34)
				local var_202_37 = var_202_35 <= 0 and var_202_31 or var_202_31 * (var_202_36 / var_202_35)

				if var_202_37 > 0 and var_202_31 < var_202_37 then
					arg_199_1.talkMaxDuration = var_202_37

					if var_202_37 + var_202_30 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_37 + var_202_30
					end
				end

				arg_199_1.text_.text = var_202_34
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021048", "story_v_out_120021.awb") ~= 0 then
					local var_202_38 = manager.audio:GetVoiceLength("story_v_out_120021", "120021048", "story_v_out_120021.awb") / 1000

					if var_202_38 + var_202_30 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_38 + var_202_30
					end

					if var_202_33.prefab_name ~= "" and arg_199_1.actors_[var_202_33.prefab_name] ~= nil then
						local var_202_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_33.prefab_name].transform, "story_v_out_120021", "120021048", "story_v_out_120021.awb")

						arg_199_1:RecordAudio("120021048", var_202_39)
						arg_199_1:RecordAudio("120021048", var_202_39)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_120021", "120021048", "story_v_out_120021.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_120021", "120021048", "story_v_out_120021.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_40 = math.max(var_202_31, arg_199_1.talkMaxDuration)

			if var_202_30 <= arg_199_1.time_ and arg_199_1.time_ < var_202_30 + var_202_40 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_30) / var_202_40

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_30 + var_202_40 and arg_199_1.time_ < var_202_30 + var_202_40 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play120021049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 120021049
		arg_203_1.duration_ = 5

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play120021050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1075ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1075ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0, 100, 0)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1075ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, 100, 0)

				local var_206_7 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_7.x, var_206_7.y, var_206_7.z)

				local var_206_8 = var_206_0.localEulerAngles

				var_206_8.z = 0
				var_206_8.x = 0
				var_206_0.localEulerAngles = var_206_8
			end

			local var_206_9 = arg_203_1.actors_["1069ui_story"].transform
			local var_206_10 = 0

			if var_206_10 < arg_203_1.time_ and arg_203_1.time_ <= var_206_10 + arg_206_0 then
				arg_203_1.var_.moveOldPos1069ui_story = var_206_9.localPosition
			end

			local var_206_11 = 0.001

			if var_206_10 <= arg_203_1.time_ and arg_203_1.time_ < var_206_10 + var_206_11 then
				local var_206_12 = (arg_203_1.time_ - var_206_10) / var_206_11
				local var_206_13 = Vector3.New(0, 100, 0)

				var_206_9.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1069ui_story, var_206_13, var_206_12)

				local var_206_14 = manager.ui.mainCamera.transform.position - var_206_9.position

				var_206_9.forward = Vector3.New(var_206_14.x, var_206_14.y, var_206_14.z)

				local var_206_15 = var_206_9.localEulerAngles

				var_206_15.z = 0
				var_206_15.x = 0
				var_206_9.localEulerAngles = var_206_15
			end

			if arg_203_1.time_ >= var_206_10 + var_206_11 and arg_203_1.time_ < var_206_10 + var_206_11 + arg_206_0 then
				var_206_9.localPosition = Vector3.New(0, 100, 0)

				local var_206_16 = manager.ui.mainCamera.transform.position - var_206_9.position

				var_206_9.forward = Vector3.New(var_206_16.x, var_206_16.y, var_206_16.z)

				local var_206_17 = var_206_9.localEulerAngles

				var_206_17.z = 0
				var_206_17.x = 0
				var_206_9.localEulerAngles = var_206_17
			end

			local var_206_18 = 0
			local var_206_19 = 0.7

			if var_206_18 < arg_203_1.time_ and arg_203_1.time_ <= var_206_18 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, false)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_20 = arg_203_1:GetWordFromCfg(120021049)
				local var_206_21 = arg_203_1:FormatText(var_206_20.content)

				arg_203_1.text_.text = var_206_21

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_22 = 28
				local var_206_23 = utf8.len(var_206_21)
				local var_206_24 = var_206_22 <= 0 and var_206_19 or var_206_19 * (var_206_23 / var_206_22)

				if var_206_24 > 0 and var_206_19 < var_206_24 then
					arg_203_1.talkMaxDuration = var_206_24

					if var_206_24 + var_206_18 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_24 + var_206_18
					end
				end

				arg_203_1.text_.text = var_206_21
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)
				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_25 = math.max(var_206_19, arg_203_1.talkMaxDuration)

			if var_206_18 <= arg_203_1.time_ and arg_203_1.time_ < var_206_18 + var_206_25 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_18) / var_206_25

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_18 + var_206_25 and arg_203_1.time_ < var_206_18 + var_206_25 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play120021050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 120021050
		arg_207_1.duration_ = 5.466

		local var_207_0 = {
			zh = 5.466,
			ja = 3.666
		}
		local var_207_1 = manager.audio:GetLocalizationFlag()

		if var_207_0[var_207_1] ~= nil then
			arg_207_1.duration_ = var_207_0[var_207_1]
		end

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play120021051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.625

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[378].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, true)
				arg_207_1.iconController_:SetSelectedState("hero")

				arg_207_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(120021050)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 25
				local var_210_6 = utf8.len(var_210_4)
				local var_210_7 = var_210_5 <= 0 and var_210_1 or var_210_1 * (var_210_6 / var_210_5)

				if var_210_7 > 0 and var_210_1 < var_210_7 then
					arg_207_1.talkMaxDuration = var_210_7

					if var_210_7 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_7 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_4
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021050", "story_v_out_120021.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021050", "story_v_out_120021.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_120021", "120021050", "story_v_out_120021.awb")

						arg_207_1:RecordAudio("120021050", var_210_9)
						arg_207_1:RecordAudio("120021050", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_120021", "120021050", "story_v_out_120021.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_120021", "120021050", "story_v_out_120021.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_10 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_10 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_10

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_10 and arg_207_1.time_ < var_210_0 + var_210_10 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play120021051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 120021051
		arg_211_1.duration_ = 2.866

		local var_211_0 = {
			zh = 1.933,
			ja = 2.866
		}
		local var_211_1 = manager.audio:GetLocalizationFlag()

		if var_211_0[var_211_1] ~= nil then
			arg_211_1.duration_ = var_211_0[var_211_1]
		end

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play120021052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 0.25

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_2 = arg_211_1:FormatText(StoryNameCfg[378].name)

				arg_211_1.leftNameTxt_.text = var_214_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, true)
				arg_211_1.iconController_:SetSelectedState("hero")

				arg_211_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1069")

				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_3 = arg_211_1:GetWordFromCfg(120021051)
				local var_214_4 = arg_211_1:FormatText(var_214_3.content)

				arg_211_1.text_.text = var_214_4

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_5 = 10
				local var_214_6 = utf8.len(var_214_4)
				local var_214_7 = var_214_5 <= 0 and var_214_1 or var_214_1 * (var_214_6 / var_214_5)

				if var_214_7 > 0 and var_214_1 < var_214_7 then
					arg_211_1.talkMaxDuration = var_214_7

					if var_214_7 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_7 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_4
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021051", "story_v_out_120021.awb") ~= 0 then
					local var_214_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021051", "story_v_out_120021.awb") / 1000

					if var_214_8 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_8 + var_214_0
					end

					if var_214_3.prefab_name ~= "" and arg_211_1.actors_[var_214_3.prefab_name] ~= nil then
						local var_214_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_3.prefab_name].transform, "story_v_out_120021", "120021051", "story_v_out_120021.awb")

						arg_211_1:RecordAudio("120021051", var_214_9)
						arg_211_1:RecordAudio("120021051", var_214_9)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_120021", "120021051", "story_v_out_120021.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_120021", "120021051", "story_v_out_120021.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_10 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_10 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_10

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_10 and arg_211_1.time_ < var_214_0 + var_214_10 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play120021052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 120021052
		arg_215_1.duration_ = 5

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play120021053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 0.425

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, false)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_2 = arg_215_1:GetWordFromCfg(120021052)
				local var_218_3 = arg_215_1:FormatText(var_218_2.content)

				arg_215_1.text_.text = var_218_3

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_4 = 17
				local var_218_5 = utf8.len(var_218_3)
				local var_218_6 = var_218_4 <= 0 and var_218_1 or var_218_1 * (var_218_5 / var_218_4)

				if var_218_6 > 0 and var_218_1 < var_218_6 then
					arg_215_1.talkMaxDuration = var_218_6

					if var_218_6 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_6 + var_218_0
					end
				end

				arg_215_1.text_.text = var_218_3
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)
				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_7 = math.max(var_218_1, arg_215_1.talkMaxDuration)

			if var_218_0 <= arg_215_1.time_ and arg_215_1.time_ < var_218_0 + var_218_7 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_0) / var_218_7

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_0 + var_218_7 and arg_215_1.time_ < var_218_0 + var_218_7 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play120021053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 120021053
		arg_219_1.duration_ = 7.266

		local var_219_0 = {
			zh = 5.066,
			ja = 7.266
		}
		local var_219_1 = manager.audio:GetLocalizationFlag()

		if var_219_0[var_219_1] ~= nil then
			arg_219_1.duration_ = var_219_0[var_219_1]
		end

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play120021054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_222_2 = arg_219_1.actors_["1075ui_story"]
			local var_222_3 = 0

			if var_222_3 < arg_219_1.time_ and arg_219_1.time_ <= var_222_3 + arg_222_0 and arg_219_1.var_.characterEffect1075ui_story == nil then
				arg_219_1.var_.characterEffect1075ui_story = var_222_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_4 = 0.2

			if var_222_3 <= arg_219_1.time_ and arg_219_1.time_ < var_222_3 + var_222_4 then
				local var_222_5 = (arg_219_1.time_ - var_222_3) / var_222_4

				if arg_219_1.var_.characterEffect1075ui_story then
					arg_219_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_3 + var_222_4 and arg_219_1.time_ < var_222_3 + var_222_4 + arg_222_0 and arg_219_1.var_.characterEffect1075ui_story then
				arg_219_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_222_6 = arg_219_1.actors_["1075ui_story"].transform
			local var_222_7 = 0

			if var_222_7 < arg_219_1.time_ and arg_219_1.time_ <= var_222_7 + arg_222_0 then
				arg_219_1.var_.moveOldPos1075ui_story = var_222_6.localPosition
			end

			local var_222_8 = 0.001

			if var_222_7 <= arg_219_1.time_ and arg_219_1.time_ < var_222_7 + var_222_8 then
				local var_222_9 = (arg_219_1.time_ - var_222_7) / var_222_8
				local var_222_10 = Vector3.New(0, -1.055, -6.16)

				var_222_6.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1075ui_story, var_222_10, var_222_9)

				local var_222_11 = manager.ui.mainCamera.transform.position - var_222_6.position

				var_222_6.forward = Vector3.New(var_222_11.x, var_222_11.y, var_222_11.z)

				local var_222_12 = var_222_6.localEulerAngles

				var_222_12.z = 0
				var_222_12.x = 0
				var_222_6.localEulerAngles = var_222_12
			end

			if arg_219_1.time_ >= var_222_7 + var_222_8 and arg_219_1.time_ < var_222_7 + var_222_8 + arg_222_0 then
				var_222_6.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_222_13 = manager.ui.mainCamera.transform.position - var_222_6.position

				var_222_6.forward = Vector3.New(var_222_13.x, var_222_13.y, var_222_13.z)

				local var_222_14 = var_222_6.localEulerAngles

				var_222_14.z = 0
				var_222_14.x = 0
				var_222_6.localEulerAngles = var_222_14
			end

			local var_222_15 = 0
			local var_222_16 = 0.5

			if var_222_15 < arg_219_1.time_ and arg_219_1.time_ <= var_222_15 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_17 = arg_219_1:FormatText(StoryNameCfg[381].name)

				arg_219_1.leftNameTxt_.text = var_222_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_18 = arg_219_1:GetWordFromCfg(120021053)
				local var_222_19 = arg_219_1:FormatText(var_222_18.content)

				arg_219_1.text_.text = var_222_19

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_20 = 20
				local var_222_21 = utf8.len(var_222_19)
				local var_222_22 = var_222_20 <= 0 and var_222_16 or var_222_16 * (var_222_21 / var_222_20)

				if var_222_22 > 0 and var_222_16 < var_222_22 then
					arg_219_1.talkMaxDuration = var_222_22

					if var_222_22 + var_222_15 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_22 + var_222_15
					end
				end

				arg_219_1.text_.text = var_222_19
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021053", "story_v_out_120021.awb") ~= 0 then
					local var_222_23 = manager.audio:GetVoiceLength("story_v_out_120021", "120021053", "story_v_out_120021.awb") / 1000

					if var_222_23 + var_222_15 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_23 + var_222_15
					end

					if var_222_18.prefab_name ~= "" and arg_219_1.actors_[var_222_18.prefab_name] ~= nil then
						local var_222_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_18.prefab_name].transform, "story_v_out_120021", "120021053", "story_v_out_120021.awb")

						arg_219_1:RecordAudio("120021053", var_222_24)
						arg_219_1:RecordAudio("120021053", var_222_24)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_120021", "120021053", "story_v_out_120021.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_120021", "120021053", "story_v_out_120021.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_25 = math.max(var_222_16, arg_219_1.talkMaxDuration)

			if var_222_15 <= arg_219_1.time_ and arg_219_1.time_ < var_222_15 + var_222_25 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_15) / var_222_25

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_15 + var_222_25 and arg_219_1.time_ < var_222_15 + var_222_25 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play120021054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 120021054
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play120021055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1075ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1075ui_story == nil then
				arg_223_1.var_.characterEffect1075ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.2

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1075ui_story then
					local var_226_4 = Mathf.Lerp(0, 0.5, var_226_3)

					arg_223_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1075ui_story.fillRatio = var_226_4
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1075ui_story then
				local var_226_5 = 0.5

				arg_223_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1075ui_story.fillRatio = var_226_5
			end

			local var_226_6 = 0
			local var_226_7 = 0.15

			if var_226_6 < arg_223_1.time_ and arg_223_1.time_ <= var_226_6 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_8 = arg_223_1:FormatText(StoryNameCfg[7].name)

				arg_223_1.leftNameTxt_.text = var_226_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_9 = arg_223_1:GetWordFromCfg(120021054)
				local var_226_10 = arg_223_1:FormatText(var_226_9.content)

				arg_223_1.text_.text = var_226_10

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_11 = 6
				local var_226_12 = utf8.len(var_226_10)
				local var_226_13 = var_226_11 <= 0 and var_226_7 or var_226_7 * (var_226_12 / var_226_11)

				if var_226_13 > 0 and var_226_7 < var_226_13 then
					arg_223_1.talkMaxDuration = var_226_13

					if var_226_13 + var_226_6 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_13 + var_226_6
					end
				end

				arg_223_1.text_.text = var_226_10
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_14 = math.max(var_226_7, arg_223_1.talkMaxDuration)

			if var_226_6 <= arg_223_1.time_ and arg_223_1.time_ < var_226_6 + var_226_14 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_6) / var_226_14

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_6 + var_226_14 and arg_223_1.time_ < var_226_6 + var_226_14 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play120021055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 120021055
		arg_227_1.duration_ = 4.133333333332

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play120021056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1075ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1075ui_story == nil then
				arg_227_1.var_.characterEffect1075ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.2

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1075ui_story then
					arg_227_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1075ui_story then
				arg_227_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_230_4 = 0

			if var_230_4 < arg_227_1.time_ and arg_227_1.time_ <= var_230_4 + arg_230_0 then
				arg_227_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 then
				arg_227_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_2")
			end

			local var_230_6 = "XH0108"

			if arg_227_1.bgs_[var_230_6] == nil then
				local var_230_7 = Object.Instantiate(arg_227_1.paintGo_)

				var_230_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_230_6)
				var_230_7.name = var_230_6
				var_230_7.transform.parent = arg_227_1.stage_.transform
				var_230_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_227_1.bgs_[var_230_6] = var_230_7
			end

			local var_230_8 = 0

			if var_230_8 < arg_227_1.time_ and arg_227_1.time_ <= var_230_8 + arg_230_0 then
				local var_230_9 = manager.ui.mainCamera.transform.localPosition
				local var_230_10 = Vector3.New(0, 0, 10) + Vector3.New(var_230_9.x, var_230_9.y, 0)
				local var_230_11 = arg_227_1.bgs_.XH0108

				var_230_11.transform.localPosition = var_230_10
				var_230_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_230_12 = var_230_11:GetComponent("SpriteRenderer")

				if var_230_12 and var_230_12.sprite then
					local var_230_13 = (var_230_11.transform.localPosition - var_230_9).z
					local var_230_14 = manager.ui.mainCameraCom_
					local var_230_15 = 2 * var_230_13 * Mathf.Tan(var_230_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_230_16 = var_230_15 * var_230_14.aspect
					local var_230_17 = var_230_12.sprite.bounds.size.x
					local var_230_18 = var_230_12.sprite.bounds.size.y
					local var_230_19 = var_230_16 / var_230_17
					local var_230_20 = var_230_15 / var_230_18
					local var_230_21 = var_230_20 < var_230_19 and var_230_19 or var_230_20

					var_230_11.transform.localScale = Vector3.New(var_230_21, var_230_21, 0)
				end

				for iter_230_0, iter_230_1 in pairs(arg_227_1.bgs_) do
					if iter_230_0 ~= "XH0108" then
						iter_230_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_230_22 = 0

			if var_230_22 < arg_227_1.time_ and arg_227_1.time_ <= var_230_22 + arg_230_0 then
				arg_227_1.mask_.enabled = true
				arg_227_1.mask_.raycastTarget = true

				arg_227_1:SetGaussion(false)
			end

			local var_230_23 = 2

			if var_230_22 <= arg_227_1.time_ and arg_227_1.time_ < var_230_22 + var_230_23 then
				local var_230_24 = (arg_227_1.time_ - var_230_22) / var_230_23
				local var_230_25 = Color.New(1, 1, 1)

				var_230_25.a = Mathf.Lerp(1, 0, var_230_24)
				arg_227_1.mask_.color = var_230_25
			end

			if arg_227_1.time_ >= var_230_22 + var_230_23 and arg_227_1.time_ < var_230_22 + var_230_23 + arg_230_0 then
				local var_230_26 = Color.New(1, 1, 1)
				local var_230_27 = 0

				arg_227_1.mask_.enabled = false
				var_230_26.a = var_230_27
				arg_227_1.mask_.color = var_230_26
			end

			local var_230_28 = arg_227_1.actors_["1075ui_story"].transform
			local var_230_29 = 0

			if var_230_29 < arg_227_1.time_ and arg_227_1.time_ <= var_230_29 + arg_230_0 then
				arg_227_1.var_.moveOldPos1075ui_story = var_230_28.localPosition
			end

			local var_230_30 = 0.001

			if var_230_29 <= arg_227_1.time_ and arg_227_1.time_ < var_230_29 + var_230_30 then
				local var_230_31 = (arg_227_1.time_ - var_230_29) / var_230_30
				local var_230_32 = Vector3.New(0, 100, 0)

				var_230_28.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos1075ui_story, var_230_32, var_230_31)

				local var_230_33 = manager.ui.mainCamera.transform.position - var_230_28.position

				var_230_28.forward = Vector3.New(var_230_33.x, var_230_33.y, var_230_33.z)

				local var_230_34 = var_230_28.localEulerAngles

				var_230_34.z = 0
				var_230_34.x = 0
				var_230_28.localEulerAngles = var_230_34
			end

			if arg_227_1.time_ >= var_230_29 + var_230_30 and arg_227_1.time_ < var_230_29 + var_230_30 + arg_230_0 then
				var_230_28.localPosition = Vector3.New(0, 100, 0)

				local var_230_35 = manager.ui.mainCamera.transform.position - var_230_28.position

				var_230_28.forward = Vector3.New(var_230_35.x, var_230_35.y, var_230_35.z)

				local var_230_36 = var_230_28.localEulerAngles

				var_230_36.z = 0
				var_230_36.x = 0
				var_230_28.localEulerAngles = var_230_36
			end

			local var_230_37 = arg_227_1.bgs_.XH0108.transform
			local var_230_38 = 0

			if var_230_38 < arg_227_1.time_ and arg_227_1.time_ <= var_230_38 + arg_230_0 then
				arg_227_1.var_.moveOldPosXH0108 = var_230_37.localPosition
			end

			local var_230_39 = 0.001

			if var_230_38 <= arg_227_1.time_ and arg_227_1.time_ < var_230_38 + var_230_39 then
				local var_230_40 = (arg_227_1.time_ - var_230_38) / var_230_39
				local var_230_41 = Vector3.New(0, 1, 0)

				var_230_37.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPosXH0108, var_230_41, var_230_40)
			end

			if arg_227_1.time_ >= var_230_38 + var_230_39 and arg_227_1.time_ < var_230_38 + var_230_39 + arg_230_0 then
				var_230_37.localPosition = Vector3.New(0, 1, 0)
			end

			local var_230_42 = arg_227_1.bgs_.XH0108.transform
			local var_230_43 = 0.0166666666666666

			if var_230_43 < arg_227_1.time_ and arg_227_1.time_ <= var_230_43 + arg_230_0 then
				arg_227_1.var_.moveOldPosXH0108 = var_230_42.localPosition
			end

			local var_230_44 = 3.5

			if var_230_43 <= arg_227_1.time_ and arg_227_1.time_ < var_230_43 + var_230_44 then
				local var_230_45 = (arg_227_1.time_ - var_230_43) / var_230_44
				local var_230_46 = Vector3.New(0, 0.5, 0)

				var_230_42.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPosXH0108, var_230_46, var_230_45)
			end

			if arg_227_1.time_ >= var_230_43 + var_230_44 and arg_227_1.time_ < var_230_43 + var_230_44 + arg_230_0 then
				var_230_42.localPosition = Vector3.New(0, 0.5, 0)
			end

			local var_230_47 = 2

			if var_230_47 < arg_227_1.time_ and arg_227_1.time_ <= var_230_47 + arg_230_0 then
				arg_227_1.allBtn_.enabled = false
			end

			local var_230_48 = 1.51666666666667

			if arg_227_1.time_ >= var_230_47 + var_230_48 and arg_227_1.time_ < var_230_47 + var_230_48 + arg_230_0 then
				arg_227_1.allBtn_.enabled = true
			end

			if arg_227_1.frameCnt_ <= 1 then
				arg_227_1.dialog_:SetActive(false)
			end

			local var_230_49 = 2
			local var_230_50 = 0.1

			if var_230_49 < arg_227_1.time_ and arg_227_1.time_ <= var_230_49 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0

				arg_227_1.dialog_:SetActive(true)

				local var_230_51 = LeanTween.value(arg_227_1.dialog_, 0, 1, 0.3)

				var_230_51:setOnUpdate(LuaHelper.FloatAction(function(arg_231_0)
					arg_227_1.dialogCg_.alpha = arg_231_0
				end))
				var_230_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_227_1.dialog_)
					var_230_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_227_1.duration_ = arg_227_1.duration_ + 0.3

				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_52 = arg_227_1:FormatText(StoryNameCfg[381].name)

				arg_227_1.leftNameTxt_.text = var_230_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_53 = arg_227_1:GetWordFromCfg(120021055)
				local var_230_54 = arg_227_1:FormatText(var_230_53.content)

				arg_227_1.text_.text = var_230_54

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_55 = 4
				local var_230_56 = utf8.len(var_230_54)
				local var_230_57 = var_230_55 <= 0 and var_230_50 or var_230_50 * (var_230_56 / var_230_55)

				if var_230_57 > 0 and var_230_50 < var_230_57 then
					arg_227_1.talkMaxDuration = var_230_57
					var_230_49 = var_230_49 + 0.3

					if var_230_57 + var_230_49 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_57 + var_230_49
					end
				end

				arg_227_1.text_.text = var_230_54
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021055", "story_v_out_120021.awb") ~= 0 then
					local var_230_58 = manager.audio:GetVoiceLength("story_v_out_120021", "120021055", "story_v_out_120021.awb") / 1000

					if var_230_58 + var_230_49 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_58 + var_230_49
					end

					if var_230_53.prefab_name ~= "" and arg_227_1.actors_[var_230_53.prefab_name] ~= nil then
						local var_230_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_53.prefab_name].transform, "story_v_out_120021", "120021055", "story_v_out_120021.awb")

						arg_227_1:RecordAudio("120021055", var_230_59)
						arg_227_1:RecordAudio("120021055", var_230_59)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_120021", "120021055", "story_v_out_120021.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_120021", "120021055", "story_v_out_120021.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_60 = var_230_49 + 0.3
			local var_230_61 = math.max(var_230_50, arg_227_1.talkMaxDuration)

			if var_230_60 <= arg_227_1.time_ and arg_227_1.time_ < var_230_60 + var_230_61 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_60) / var_230_61

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_60 + var_230_61 and arg_227_1.time_ < var_230_60 + var_230_61 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play120021056 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 120021056
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play120021057(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0
			local var_236_1 = 1.6

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, false)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_2 = arg_233_1:GetWordFromCfg(120021056)
				local var_236_3 = arg_233_1:FormatText(var_236_2.content)

				arg_233_1.text_.text = var_236_3

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_4 = 64
				local var_236_5 = utf8.len(var_236_3)
				local var_236_6 = var_236_4 <= 0 and var_236_1 or var_236_1 * (var_236_5 / var_236_4)

				if var_236_6 > 0 and var_236_1 < var_236_6 then
					arg_233_1.talkMaxDuration = var_236_6

					if var_236_6 + var_236_0 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_6 + var_236_0
					end
				end

				arg_233_1.text_.text = var_236_3
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_7 = math.max(var_236_1, arg_233_1.talkMaxDuration)

			if var_236_0 <= arg_233_1.time_ and arg_233_1.time_ < var_236_0 + var_236_7 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_0) / var_236_7

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_0 + var_236_7 and arg_233_1.time_ < var_236_0 + var_236_7 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play120021057 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 120021057
		arg_237_1.duration_ = 1.566

		local var_237_0 = {
			zh = 0.999999999999,
			ja = 1.566
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
				arg_237_0:Play120021058(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.075

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[381].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(120021057)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 3
				local var_240_6 = utf8.len(var_240_4)
				local var_240_7 = var_240_5 <= 0 and var_240_1 or var_240_1 * (var_240_6 / var_240_5)

				if var_240_7 > 0 and var_240_1 < var_240_7 then
					arg_237_1.talkMaxDuration = var_240_7

					if var_240_7 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_7 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_4
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021057", "story_v_out_120021.awb") ~= 0 then
					local var_240_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021057", "story_v_out_120021.awb") / 1000

					if var_240_8 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_0
					end

					if var_240_3.prefab_name ~= "" and arg_237_1.actors_[var_240_3.prefab_name] ~= nil then
						local var_240_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_3.prefab_name].transform, "story_v_out_120021", "120021057", "story_v_out_120021.awb")

						arg_237_1:RecordAudio("120021057", var_240_9)
						arg_237_1:RecordAudio("120021057", var_240_9)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_120021", "120021057", "story_v_out_120021.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_120021", "120021057", "story_v_out_120021.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_10 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_10 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_10

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_10 and arg_237_1.time_ < var_240_0 + var_240_10 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play120021058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 120021058
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play120021059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0
			local var_244_1 = 0.975

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_2 = arg_241_1:GetWordFromCfg(120021058)
				local var_244_3 = arg_241_1:FormatText(var_244_2.content)

				arg_241_1.text_.text = var_244_3

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_4 = 39
				local var_244_5 = utf8.len(var_244_3)
				local var_244_6 = var_244_4 <= 0 and var_244_1 or var_244_1 * (var_244_5 / var_244_4)

				if var_244_6 > 0 and var_244_1 < var_244_6 then
					arg_241_1.talkMaxDuration = var_244_6

					if var_244_6 + var_244_0 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_6 + var_244_0
					end
				end

				arg_241_1.text_.text = var_244_3
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_7 = math.max(var_244_1, arg_241_1.talkMaxDuration)

			if var_244_0 <= arg_241_1.time_ and arg_241_1.time_ < var_244_0 + var_244_7 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_0) / var_244_7

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_0 + var_244_7 and arg_241_1.time_ < var_244_0 + var_244_7 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play120021059 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 120021059
		arg_245_1.duration_ = 14.333

		local var_245_0 = {
			zh = 12.6,
			ja = 14.333
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
				arg_245_0:Play120021060(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 2

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				local var_248_1 = manager.ui.mainCamera.transform.localPosition
				local var_248_2 = Vector3.New(0, 0, 10) + Vector3.New(var_248_1.x, var_248_1.y, 0)
				local var_248_3 = arg_245_1.bgs_.XH0108

				var_248_3.transform.localPosition = var_248_2
				var_248_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_248_4 = var_248_3:GetComponent("SpriteRenderer")

				if var_248_4 and var_248_4.sprite then
					local var_248_5 = (var_248_3.transform.localPosition - var_248_1).z
					local var_248_6 = manager.ui.mainCameraCom_
					local var_248_7 = 2 * var_248_5 * Mathf.Tan(var_248_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_248_8 = var_248_7 * var_248_6.aspect
					local var_248_9 = var_248_4.sprite.bounds.size.x
					local var_248_10 = var_248_4.sprite.bounds.size.y
					local var_248_11 = var_248_8 / var_248_9
					local var_248_12 = var_248_7 / var_248_10
					local var_248_13 = var_248_12 < var_248_11 and var_248_11 or var_248_12

					var_248_3.transform.localScale = Vector3.New(var_248_13, var_248_13, 0)
				end

				for iter_248_0, iter_248_1 in pairs(arg_245_1.bgs_) do
					if iter_248_0 ~= "XH0108" then
						iter_248_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 then
				arg_245_1.mask_.enabled = true
				arg_245_1.mask_.raycastTarget = true

				arg_245_1:SetGaussion(false)
			end

			local var_248_15 = 2

			if var_248_14 <= arg_245_1.time_ and arg_245_1.time_ < var_248_14 + var_248_15 then
				local var_248_16 = (arg_245_1.time_ - var_248_14) / var_248_15
				local var_248_17 = Color.New(0, 0, 0)

				var_248_17.a = Mathf.Lerp(0, 1, var_248_16)
				arg_245_1.mask_.color = var_248_17
			end

			if arg_245_1.time_ >= var_248_14 + var_248_15 and arg_245_1.time_ < var_248_14 + var_248_15 + arg_248_0 then
				local var_248_18 = Color.New(0, 0, 0)

				var_248_18.a = 1
				arg_245_1.mask_.color = var_248_18
			end

			local var_248_19 = 2

			if var_248_19 < arg_245_1.time_ and arg_245_1.time_ <= var_248_19 + arg_248_0 then
				arg_245_1.mask_.enabled = true
				arg_245_1.mask_.raycastTarget = true

				arg_245_1:SetGaussion(false)
			end

			local var_248_20 = 2

			if var_248_19 <= arg_245_1.time_ and arg_245_1.time_ < var_248_19 + var_248_20 then
				local var_248_21 = (arg_245_1.time_ - var_248_19) / var_248_20
				local var_248_22 = Color.New(0, 0, 0)

				var_248_22.a = Mathf.Lerp(1, 0, var_248_21)
				arg_245_1.mask_.color = var_248_22
			end

			if arg_245_1.time_ >= var_248_19 + var_248_20 and arg_245_1.time_ < var_248_19 + var_248_20 + arg_248_0 then
				local var_248_23 = Color.New(0, 0, 0)
				local var_248_24 = 0

				arg_245_1.mask_.enabled = false
				var_248_23.a = var_248_24
				arg_245_1.mask_.color = var_248_23
			end

			if arg_245_1.frameCnt_ <= 1 then
				arg_245_1.dialog_:SetActive(false)
			end

			local var_248_25 = 4
			local var_248_26 = 1

			if var_248_25 < arg_245_1.time_ and arg_245_1.time_ <= var_248_25 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0

				arg_245_1.dialog_:SetActive(true)

				local var_248_27 = LeanTween.value(arg_245_1.dialog_, 0, 1, 0.3)

				var_248_27:setOnUpdate(LuaHelper.FloatAction(function(arg_249_0)
					arg_245_1.dialogCg_.alpha = arg_249_0
				end))
				var_248_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_245_1.dialog_)
					var_248_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_245_1.duration_ = arg_245_1.duration_ + 0.3

				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_28 = arg_245_1:FormatText(StoryNameCfg[381].name)

				arg_245_1.leftNameTxt_.text = var_248_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_29 = arg_245_1:GetWordFromCfg(120021059)
				local var_248_30 = arg_245_1:FormatText(var_248_29.content)

				arg_245_1.text_.text = var_248_30

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_31 = 40
				local var_248_32 = utf8.len(var_248_30)
				local var_248_33 = var_248_31 <= 0 and var_248_26 or var_248_26 * (var_248_32 / var_248_31)

				if var_248_33 > 0 and var_248_26 < var_248_33 then
					arg_245_1.talkMaxDuration = var_248_33
					var_248_25 = var_248_25 + 0.3

					if var_248_33 + var_248_25 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_33 + var_248_25
					end
				end

				arg_245_1.text_.text = var_248_30
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021059", "story_v_out_120021.awb") ~= 0 then
					local var_248_34 = manager.audio:GetVoiceLength("story_v_out_120021", "120021059", "story_v_out_120021.awb") / 1000

					if var_248_34 + var_248_25 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_34 + var_248_25
					end

					if var_248_29.prefab_name ~= "" and arg_245_1.actors_[var_248_29.prefab_name] ~= nil then
						local var_248_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_29.prefab_name].transform, "story_v_out_120021", "120021059", "story_v_out_120021.awb")

						arg_245_1:RecordAudio("120021059", var_248_35)
						arg_245_1:RecordAudio("120021059", var_248_35)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_120021", "120021059", "story_v_out_120021.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_120021", "120021059", "story_v_out_120021.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_36 = var_248_25 + 0.3
			local var_248_37 = math.max(var_248_26, arg_245_1.talkMaxDuration)

			if var_248_36 <= arg_245_1.time_ and arg_245_1.time_ < var_248_36 + var_248_37 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_36) / var_248_37

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_36 + var_248_37 and arg_245_1.time_ < var_248_36 + var_248_37 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play120021060 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 120021060
		arg_251_1.duration_ = 3.066

		local var_251_0 = {
			zh = 2.133,
			ja = 3.066
		}
		local var_251_1 = manager.audio:GetLocalizationFlag()

		if var_251_0[var_251_1] ~= nil then
			arg_251_1.duration_ = var_251_0[var_251_1]
		end

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play120021061(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.25

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[6].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, true)
				arg_251_1.iconController_:SetSelectedState("hero")

				arg_251_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(120021060)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 10
				local var_254_6 = utf8.len(var_254_4)
				local var_254_7 = var_254_5 <= 0 and var_254_1 or var_254_1 * (var_254_6 / var_254_5)

				if var_254_7 > 0 and var_254_1 < var_254_7 then
					arg_251_1.talkMaxDuration = var_254_7

					if var_254_7 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_7 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_4
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021060", "story_v_out_120021.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021060", "story_v_out_120021.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_out_120021", "120021060", "story_v_out_120021.awb")

						arg_251_1:RecordAudio("120021060", var_254_9)
						arg_251_1:RecordAudio("120021060", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_120021", "120021060", "story_v_out_120021.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_120021", "120021060", "story_v_out_120021.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_10 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_10 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_10

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_10 and arg_251_1.time_ < var_254_0 + var_254_10 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play120021061 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 120021061
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play120021062(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.1

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[7].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(120021061)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 4
				local var_258_6 = utf8.len(var_258_4)
				local var_258_7 = var_258_5 <= 0 and var_258_1 or var_258_1 * (var_258_6 / var_258_5)

				if var_258_7 > 0 and var_258_1 < var_258_7 then
					arg_255_1.talkMaxDuration = var_258_7

					if var_258_7 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_7 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_4
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_8 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_8 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_8

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_8 and arg_255_1.time_ < var_258_0 + var_258_8 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play120021062 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 120021062
		arg_259_1.duration_ = 5.366

		local var_259_0 = {
			zh = 4.366,
			ja = 5.366
		}
		local var_259_1 = manager.audio:GetLocalizationFlag()

		if var_259_0[var_259_1] ~= nil then
			arg_259_1.duration_ = var_259_0[var_259_1]
		end

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play120021063(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.325

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[381].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(120021062)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 13
				local var_262_6 = utf8.len(var_262_4)
				local var_262_7 = var_262_5 <= 0 and var_262_1 or var_262_1 * (var_262_6 / var_262_5)

				if var_262_7 > 0 and var_262_1 < var_262_7 then
					arg_259_1.talkMaxDuration = var_262_7

					if var_262_7 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_7 + var_262_0
					end
				end

				arg_259_1.text_.text = var_262_4
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021062", "story_v_out_120021.awb") ~= 0 then
					local var_262_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021062", "story_v_out_120021.awb") / 1000

					if var_262_8 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_8 + var_262_0
					end

					if var_262_3.prefab_name ~= "" and arg_259_1.actors_[var_262_3.prefab_name] ~= nil then
						local var_262_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_3.prefab_name].transform, "story_v_out_120021", "120021062", "story_v_out_120021.awb")

						arg_259_1:RecordAudio("120021062", var_262_9)
						arg_259_1:RecordAudio("120021062", var_262_9)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_120021", "120021062", "story_v_out_120021.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_120021", "120021062", "story_v_out_120021.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_10 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_10 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_10

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_10 and arg_259_1.time_ < var_262_0 + var_262_10 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play120021063 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 120021063
		arg_263_1.duration_ = 5

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play120021064(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 0
			local var_266_1 = 0.625

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_2 = arg_263_1:FormatText(StoryNameCfg[7].name)

				arg_263_1.leftNameTxt_.text = var_266_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_3 = arg_263_1:GetWordFromCfg(120021063)
				local var_266_4 = arg_263_1:FormatText(var_266_3.content)

				arg_263_1.text_.text = var_266_4

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_5 = 25
				local var_266_6 = utf8.len(var_266_4)
				local var_266_7 = var_266_5 <= 0 and var_266_1 or var_266_1 * (var_266_6 / var_266_5)

				if var_266_7 > 0 and var_266_1 < var_266_7 then
					arg_263_1.talkMaxDuration = var_266_7

					if var_266_7 + var_266_0 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_7 + var_266_0
					end
				end

				arg_263_1.text_.text = var_266_4
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_8 = math.max(var_266_1, arg_263_1.talkMaxDuration)

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_8 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_0) / var_266_8

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_0 + var_266_8 and arg_263_1.time_ < var_266_0 + var_266_8 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play120021064 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 120021064
		arg_267_1.duration_ = 4.066

		local var_267_0 = {
			zh = 4.066,
			ja = 2.833
		}
		local var_267_1 = manager.audio:GetLocalizationFlag()

		if var_267_0[var_267_1] ~= nil then
			arg_267_1.duration_ = var_267_0[var_267_1]
		end

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play120021065(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0
			local var_270_1 = 0.325

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_2 = arg_267_1:FormatText(StoryNameCfg[381].name)

				arg_267_1.leftNameTxt_.text = var_270_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_3 = arg_267_1:GetWordFromCfg(120021064)
				local var_270_4 = arg_267_1:FormatText(var_270_3.content)

				arg_267_1.text_.text = var_270_4

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_5 = 13
				local var_270_6 = utf8.len(var_270_4)
				local var_270_7 = var_270_5 <= 0 and var_270_1 or var_270_1 * (var_270_6 / var_270_5)

				if var_270_7 > 0 and var_270_1 < var_270_7 then
					arg_267_1.talkMaxDuration = var_270_7

					if var_270_7 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_7 + var_270_0
					end
				end

				arg_267_1.text_.text = var_270_4
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021064", "story_v_out_120021.awb") ~= 0 then
					local var_270_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021064", "story_v_out_120021.awb") / 1000

					if var_270_8 + var_270_0 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_8 + var_270_0
					end

					if var_270_3.prefab_name ~= "" and arg_267_1.actors_[var_270_3.prefab_name] ~= nil then
						local var_270_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_3.prefab_name].transform, "story_v_out_120021", "120021064", "story_v_out_120021.awb")

						arg_267_1:RecordAudio("120021064", var_270_9)
						arg_267_1:RecordAudio("120021064", var_270_9)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_120021", "120021064", "story_v_out_120021.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_120021", "120021064", "story_v_out_120021.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_10 = math.max(var_270_1, arg_267_1.talkMaxDuration)

			if var_270_0 <= arg_267_1.time_ and arg_267_1.time_ < var_270_0 + var_270_10 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_0) / var_270_10

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_0 + var_270_10 and arg_267_1.time_ < var_270_0 + var_270_10 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play120021065 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 120021065
		arg_271_1.duration_ = 9

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play120021066(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 2

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				local var_274_1 = manager.ui.mainCamera.transform.localPosition
				local var_274_2 = Vector3.New(0, 0, 10) + Vector3.New(var_274_1.x, var_274_1.y, 0)
				local var_274_3 = arg_271_1.bgs_.ST29

				var_274_3.transform.localPosition = var_274_2
				var_274_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_274_4 = var_274_3:GetComponent("SpriteRenderer")

				if var_274_4 and var_274_4.sprite then
					local var_274_5 = (var_274_3.transform.localPosition - var_274_1).z
					local var_274_6 = manager.ui.mainCameraCom_
					local var_274_7 = 2 * var_274_5 * Mathf.Tan(var_274_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_274_8 = var_274_7 * var_274_6.aspect
					local var_274_9 = var_274_4.sprite.bounds.size.x
					local var_274_10 = var_274_4.sprite.bounds.size.y
					local var_274_11 = var_274_8 / var_274_9
					local var_274_12 = var_274_7 / var_274_10
					local var_274_13 = var_274_12 < var_274_11 and var_274_11 or var_274_12

					var_274_3.transform.localScale = Vector3.New(var_274_13, var_274_13, 0)
				end

				for iter_274_0, iter_274_1 in pairs(arg_271_1.bgs_) do
					if iter_274_0 ~= "ST29" then
						iter_274_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_274_14 = 0

			if var_274_14 < arg_271_1.time_ and arg_271_1.time_ <= var_274_14 + arg_274_0 then
				arg_271_1.mask_.enabled = true
				arg_271_1.mask_.raycastTarget = true

				arg_271_1:SetGaussion(false)
			end

			local var_274_15 = 2

			if var_274_14 <= arg_271_1.time_ and arg_271_1.time_ < var_274_14 + var_274_15 then
				local var_274_16 = (arg_271_1.time_ - var_274_14) / var_274_15
				local var_274_17 = Color.New(1, 1, 1)

				var_274_17.a = Mathf.Lerp(0, 1, var_274_16)
				arg_271_1.mask_.color = var_274_17
			end

			if arg_271_1.time_ >= var_274_14 + var_274_15 and arg_271_1.time_ < var_274_14 + var_274_15 + arg_274_0 then
				local var_274_18 = Color.New(1, 1, 1)

				var_274_18.a = 1
				arg_271_1.mask_.color = var_274_18
			end

			local var_274_19 = 2

			if var_274_19 < arg_271_1.time_ and arg_271_1.time_ <= var_274_19 + arg_274_0 then
				arg_271_1.mask_.enabled = true
				arg_271_1.mask_.raycastTarget = true

				arg_271_1:SetGaussion(false)
			end

			local var_274_20 = 2

			if var_274_19 <= arg_271_1.time_ and arg_271_1.time_ < var_274_19 + var_274_20 then
				local var_274_21 = (arg_271_1.time_ - var_274_19) / var_274_20
				local var_274_22 = Color.New(1, 1, 1)

				var_274_22.a = Mathf.Lerp(1, 0, var_274_21)
				arg_271_1.mask_.color = var_274_22
			end

			if arg_271_1.time_ >= var_274_19 + var_274_20 and arg_271_1.time_ < var_274_19 + var_274_20 + arg_274_0 then
				local var_274_23 = Color.New(1, 1, 1)
				local var_274_24 = 0

				arg_271_1.mask_.enabled = false
				var_274_23.a = var_274_24
				arg_271_1.mask_.color = var_274_23
			end

			if arg_271_1.frameCnt_ <= 1 then
				arg_271_1.dialog_:SetActive(false)
			end

			local var_274_25 = 4
			local var_274_26 = 0.85

			if var_274_25 < arg_271_1.time_ and arg_271_1.time_ <= var_274_25 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0

				arg_271_1.dialog_:SetActive(true)

				local var_274_27 = LeanTween.value(arg_271_1.dialog_, 0, 1, 0.3)

				var_274_27:setOnUpdate(LuaHelper.FloatAction(function(arg_275_0)
					arg_271_1.dialogCg_.alpha = arg_275_0
				end))
				var_274_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_271_1.dialog_)
					var_274_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_271_1.duration_ = arg_271_1.duration_ + 0.3

				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_28 = arg_271_1:GetWordFromCfg(120021065)
				local var_274_29 = arg_271_1:FormatText(var_274_28.content)

				arg_271_1.text_.text = var_274_29

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_30 = 34
				local var_274_31 = utf8.len(var_274_29)
				local var_274_32 = var_274_30 <= 0 and var_274_26 or var_274_26 * (var_274_31 / var_274_30)

				if var_274_32 > 0 and var_274_26 < var_274_32 then
					arg_271_1.talkMaxDuration = var_274_32
					var_274_25 = var_274_25 + 0.3

					if var_274_32 + var_274_25 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_32 + var_274_25
					end
				end

				arg_271_1.text_.text = var_274_29
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_33 = var_274_25 + 0.3
			local var_274_34 = math.max(var_274_26, arg_271_1.talkMaxDuration)

			if var_274_33 <= arg_271_1.time_ and arg_271_1.time_ < var_274_33 + var_274_34 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_33) / var_274_34

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_33 + var_274_34 and arg_271_1.time_ < var_274_33 + var_274_34 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play120021066 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 120021066
		arg_277_1.duration_ = 6.566

		local var_277_0 = {
			zh = 4.866,
			ja = 6.566
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
				arg_277_0:Play120021067(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1072ui_story"].transform
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 then
				arg_277_1.var_.moveOldPos1072ui_story = var_280_0.localPosition
			end

			local var_280_2 = 0.001

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2
				local var_280_4 = Vector3.New(0, -0.71, -6)

				var_280_0.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos1072ui_story, var_280_4, var_280_3)

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

			local var_280_9 = arg_277_1.actors_["1072ui_story"]
			local var_280_10 = 0

			if var_280_10 < arg_277_1.time_ and arg_277_1.time_ <= var_280_10 + arg_280_0 and arg_277_1.var_.characterEffect1072ui_story == nil then
				arg_277_1.var_.characterEffect1072ui_story = var_280_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_11 = 0.2

			if var_280_10 <= arg_277_1.time_ and arg_277_1.time_ < var_280_10 + var_280_11 then
				local var_280_12 = (arg_277_1.time_ - var_280_10) / var_280_11

				if arg_277_1.var_.characterEffect1072ui_story then
					arg_277_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_10 + var_280_11 and arg_277_1.time_ < var_280_10 + var_280_11 + arg_280_0 and arg_277_1.var_.characterEffect1072ui_story then
				arg_277_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_280_13 = 0

			if var_280_13 < arg_277_1.time_ and arg_277_1.time_ <= var_280_13 + arg_280_0 then
				arg_277_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_280_14 = 0

			if var_280_14 < arg_277_1.time_ and arg_277_1.time_ <= var_280_14 + arg_280_0 then
				arg_277_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action7_1")
			end

			local var_280_15 = 0
			local var_280_16 = 0.65

			if var_280_15 < arg_277_1.time_ and arg_277_1.time_ <= var_280_15 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_17 = arg_277_1:FormatText(StoryNameCfg[379].name)

				arg_277_1.leftNameTxt_.text = var_280_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_18 = arg_277_1:GetWordFromCfg(120021066)
				local var_280_19 = arg_277_1:FormatText(var_280_18.content)

				arg_277_1.text_.text = var_280_19

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_20 = 26
				local var_280_21 = utf8.len(var_280_19)
				local var_280_22 = var_280_20 <= 0 and var_280_16 or var_280_16 * (var_280_21 / var_280_20)

				if var_280_22 > 0 and var_280_16 < var_280_22 then
					arg_277_1.talkMaxDuration = var_280_22

					if var_280_22 + var_280_15 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_22 + var_280_15
					end
				end

				arg_277_1.text_.text = var_280_19
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021066", "story_v_out_120021.awb") ~= 0 then
					local var_280_23 = manager.audio:GetVoiceLength("story_v_out_120021", "120021066", "story_v_out_120021.awb") / 1000

					if var_280_23 + var_280_15 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_23 + var_280_15
					end

					if var_280_18.prefab_name ~= "" and arg_277_1.actors_[var_280_18.prefab_name] ~= nil then
						local var_280_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_18.prefab_name].transform, "story_v_out_120021", "120021066", "story_v_out_120021.awb")

						arg_277_1:RecordAudio("120021066", var_280_24)
						arg_277_1:RecordAudio("120021066", var_280_24)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_120021", "120021066", "story_v_out_120021.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_120021", "120021066", "story_v_out_120021.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_25 = math.max(var_280_16, arg_277_1.talkMaxDuration)

			if var_280_15 <= arg_277_1.time_ and arg_277_1.time_ < var_280_15 + var_280_25 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_15) / var_280_25

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_15 + var_280_25 and arg_277_1.time_ < var_280_15 + var_280_25 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play120021067 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 120021067
		arg_281_1.duration_ = 8.8

		local var_281_0 = {
			zh = 5.166,
			ja = 8.8
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play120021068(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action7_2")
			end

			local var_284_1 = 0
			local var_284_2 = 0.65

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_3 = arg_281_1:FormatText(StoryNameCfg[379].name)

				arg_281_1.leftNameTxt_.text = var_284_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_4 = arg_281_1:GetWordFromCfg(120021067)
				local var_284_5 = arg_281_1:FormatText(var_284_4.content)

				arg_281_1.text_.text = var_284_5

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_6 = 26
				local var_284_7 = utf8.len(var_284_5)
				local var_284_8 = var_284_6 <= 0 and var_284_2 or var_284_2 * (var_284_7 / var_284_6)

				if var_284_8 > 0 and var_284_2 < var_284_8 then
					arg_281_1.talkMaxDuration = var_284_8

					if var_284_8 + var_284_1 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_1
					end
				end

				arg_281_1.text_.text = var_284_5
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021067", "story_v_out_120021.awb") ~= 0 then
					local var_284_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021067", "story_v_out_120021.awb") / 1000

					if var_284_9 + var_284_1 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_9 + var_284_1
					end

					if var_284_4.prefab_name ~= "" and arg_281_1.actors_[var_284_4.prefab_name] ~= nil then
						local var_284_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_4.prefab_name].transform, "story_v_out_120021", "120021067", "story_v_out_120021.awb")

						arg_281_1:RecordAudio("120021067", var_284_10)
						arg_281_1:RecordAudio("120021067", var_284_10)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_120021", "120021067", "story_v_out_120021.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_120021", "120021067", "story_v_out_120021.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_11 = math.max(var_284_2, arg_281_1.talkMaxDuration)

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_11 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_1) / var_284_11

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_1 + var_284_11 and arg_281_1.time_ < var_284_1 + var_284_11 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play120021068 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 120021068
		arg_285_1.duration_ = 1.133

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play120021069(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1072ui_story"].transform
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.var_.moveOldPos1072ui_story = var_288_0.localPosition
			end

			local var_288_2 = 0.001

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2
				local var_288_4 = Vector3.New(0, 100, 0)

				var_288_0.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1072ui_story, var_288_4, var_288_3)

				local var_288_5 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_5.x, var_288_5.y, var_288_5.z)

				local var_288_6 = var_288_0.localEulerAngles

				var_288_6.z = 0
				var_288_6.x = 0
				var_288_0.localEulerAngles = var_288_6
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 then
				var_288_0.localPosition = Vector3.New(0, 100, 0)

				local var_288_7 = manager.ui.mainCamera.transform.position - var_288_0.position

				var_288_0.forward = Vector3.New(var_288_7.x, var_288_7.y, var_288_7.z)

				local var_288_8 = var_288_0.localEulerAngles

				var_288_8.z = 0
				var_288_8.x = 0
				var_288_0.localEulerAngles = var_288_8
			end

			local var_288_9 = 0
			local var_288_10 = 0.075

			if var_288_9 < arg_285_1.time_ and arg_285_1.time_ <= var_288_9 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_11 = arg_285_1:FormatText(StoryNameCfg[380].name)

				arg_285_1.leftNameTxt_.text = var_288_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10044")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_12 = arg_285_1:GetWordFromCfg(120021068)
				local var_288_13 = arg_285_1:FormatText(var_288_12.content)

				arg_285_1.text_.text = var_288_13

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_14 = 3
				local var_288_15 = utf8.len(var_288_13)
				local var_288_16 = var_288_14 <= 0 and var_288_10 or var_288_10 * (var_288_15 / var_288_14)

				if var_288_16 > 0 and var_288_10 < var_288_16 then
					arg_285_1.talkMaxDuration = var_288_16

					if var_288_16 + var_288_9 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_16 + var_288_9
					end
				end

				arg_285_1.text_.text = var_288_13
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021068", "story_v_out_120021.awb") ~= 0 then
					local var_288_17 = manager.audio:GetVoiceLength("story_v_out_120021", "120021068", "story_v_out_120021.awb") / 1000

					if var_288_17 + var_288_9 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_17 + var_288_9
					end

					if var_288_12.prefab_name ~= "" and arg_285_1.actors_[var_288_12.prefab_name] ~= nil then
						local var_288_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_12.prefab_name].transform, "story_v_out_120021", "120021068", "story_v_out_120021.awb")

						arg_285_1:RecordAudio("120021068", var_288_18)
						arg_285_1:RecordAudio("120021068", var_288_18)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_120021", "120021068", "story_v_out_120021.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_120021", "120021068", "story_v_out_120021.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_19 = math.max(var_288_10, arg_285_1.talkMaxDuration)

			if var_288_9 <= arg_285_1.time_ and arg_285_1.time_ < var_288_9 + var_288_19 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_9) / var_288_19

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_9 + var_288_19 and arg_285_1.time_ < var_288_9 + var_288_19 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play120021069 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 120021069
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play120021070(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 1.225

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_2 = arg_289_1:GetWordFromCfg(120021069)
				local var_292_3 = arg_289_1:FormatText(var_292_2.content)

				arg_289_1.text_.text = var_292_3

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_4 = 49
				local var_292_5 = utf8.len(var_292_3)
				local var_292_6 = var_292_4 <= 0 and var_292_1 or var_292_1 * (var_292_5 / var_292_4)

				if var_292_6 > 0 and var_292_1 < var_292_6 then
					arg_289_1.talkMaxDuration = var_292_6

					if var_292_6 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_6 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_3
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_7 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_7 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_7

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_7 and arg_289_1.time_ < var_292_0 + var_292_7 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play120021070 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 120021070
		arg_293_1.duration_ = 2.666

		local var_293_0 = {
			zh = 2.433333333332,
			ja = 2.666
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play120021071(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = "10037ui_story"

			if arg_293_1.actors_[var_296_0] == nil then
				local var_296_1 = Object.Instantiate(Asset.Load("Char/" .. var_296_0), arg_293_1.stage_.transform)

				var_296_1.name = var_296_0
				var_296_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_293_1.actors_[var_296_0] = var_296_1

				local var_296_2 = var_296_1:GetComponentInChildren(typeof(CharacterEffect))

				var_296_2.enabled = true

				local var_296_3 = GameObjectTools.GetOrAddComponent(var_296_1, typeof(DynamicBoneHelper))

				if var_296_3 then
					var_296_3:EnableDynamicBone(false)
				end

				arg_293_1:ShowWeapon(var_296_2.transform, false)

				arg_293_1.var_[var_296_0 .. "Animator"] = var_296_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_293_1.var_[var_296_0 .. "Animator"].applyRootMotion = true
				arg_293_1.var_[var_296_0 .. "LipSync"] = var_296_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_296_4 = arg_293_1.actors_["10037ui_story"]
			local var_296_5 = 0

			if var_296_5 < arg_293_1.time_ and arg_293_1.time_ <= var_296_5 + arg_296_0 and arg_293_1.var_.characterEffect10037ui_story == nil then
				arg_293_1.var_.characterEffect10037ui_story = var_296_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_6 = 0.2

			if var_296_5 <= arg_293_1.time_ and arg_293_1.time_ < var_296_5 + var_296_6 then
				local var_296_7 = (arg_293_1.time_ - var_296_5) / var_296_6

				if arg_293_1.var_.characterEffect10037ui_story then
					arg_293_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_5 + var_296_6 and arg_293_1.time_ < var_296_5 + var_296_6 + arg_296_0 and arg_293_1.var_.characterEffect10037ui_story then
				arg_293_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_296_8 = 0

			if var_296_8 < arg_293_1.time_ and arg_293_1.time_ <= var_296_8 + arg_296_0 then
				arg_293_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action1_1")
			end

			local var_296_9 = 0

			if var_296_9 < arg_293_1.time_ and arg_293_1.time_ <= var_296_9 + arg_296_0 then
				arg_293_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_296_10 = arg_293_1.actors_["10037ui_story"].transform
			local var_296_11 = 0

			if var_296_11 < arg_293_1.time_ and arg_293_1.time_ <= var_296_11 + arg_296_0 then
				arg_293_1.var_.moveOldPos10037ui_story = var_296_10.localPosition
			end

			local var_296_12 = 0.001

			if var_296_11 <= arg_293_1.time_ and arg_293_1.time_ < var_296_11 + var_296_12 then
				local var_296_13 = (arg_293_1.time_ - var_296_11) / var_296_12
				local var_296_14 = Vector3.New(0.7, -1.13, -6.2)

				var_296_10.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos10037ui_story, var_296_14, var_296_13)

				local var_296_15 = manager.ui.mainCamera.transform.position - var_296_10.position

				var_296_10.forward = Vector3.New(var_296_15.x, var_296_15.y, var_296_15.z)

				local var_296_16 = var_296_10.localEulerAngles

				var_296_16.z = 0
				var_296_16.x = 0
				var_296_10.localEulerAngles = var_296_16
			end

			if arg_293_1.time_ >= var_296_11 + var_296_12 and arg_293_1.time_ < var_296_11 + var_296_12 + arg_296_0 then
				var_296_10.localPosition = Vector3.New(0.7, -1.13, -6.2)

				local var_296_17 = manager.ui.mainCamera.transform.position - var_296_10.position

				var_296_10.forward = Vector3.New(var_296_17.x, var_296_17.y, var_296_17.z)

				local var_296_18 = var_296_10.localEulerAngles

				var_296_18.z = 0
				var_296_18.x = 0
				var_296_10.localEulerAngles = var_296_18
			end

			local var_296_19 = arg_293_1.actors_["10044ui_story"].transform
			local var_296_20 = 0

			if var_296_20 < arg_293_1.time_ and arg_293_1.time_ <= var_296_20 + arg_296_0 then
				arg_293_1.var_.moveOldPos10044ui_story = var_296_19.localPosition
			end

			local var_296_21 = 0.001

			if var_296_20 <= arg_293_1.time_ and arg_293_1.time_ < var_296_20 + var_296_21 then
				local var_296_22 = (arg_293_1.time_ - var_296_20) / var_296_21
				local var_296_23 = Vector3.New(-0.7, -0.72, -6.3)

				var_296_19.localPosition = Vector3.Lerp(arg_293_1.var_.moveOldPos10044ui_story, var_296_23, var_296_22)

				local var_296_24 = manager.ui.mainCamera.transform.position - var_296_19.position

				var_296_19.forward = Vector3.New(var_296_24.x, var_296_24.y, var_296_24.z)

				local var_296_25 = var_296_19.localEulerAngles

				var_296_25.z = 0
				var_296_25.x = 0
				var_296_19.localEulerAngles = var_296_25
			end

			if arg_293_1.time_ >= var_296_20 + var_296_21 and arg_293_1.time_ < var_296_20 + var_296_21 + arg_296_0 then
				var_296_19.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_296_26 = manager.ui.mainCamera.transform.position - var_296_19.position

				var_296_19.forward = Vector3.New(var_296_26.x, var_296_26.y, var_296_26.z)

				local var_296_27 = var_296_19.localEulerAngles

				var_296_27.z = 0
				var_296_27.x = 0
				var_296_19.localEulerAngles = var_296_27
			end

			local var_296_28 = 0

			if var_296_28 < arg_293_1.time_ and arg_293_1.time_ <= var_296_28 + arg_296_0 then
				arg_293_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_296_29 = arg_293_1.actors_["10044ui_story"]
			local var_296_30 = 0

			if var_296_30 < arg_293_1.time_ and arg_293_1.time_ <= var_296_30 + arg_296_0 and arg_293_1.var_.characterEffect10044ui_story == nil then
				arg_293_1.var_.characterEffect10044ui_story = var_296_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_31 = 0.0166666666666667

			if var_296_30 <= arg_293_1.time_ and arg_293_1.time_ < var_296_30 + var_296_31 then
				local var_296_32 = (arg_293_1.time_ - var_296_30) / var_296_31

				if arg_293_1.var_.characterEffect10044ui_story then
					local var_296_33 = Mathf.Lerp(0, 0.5, var_296_32)

					arg_293_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_293_1.var_.characterEffect10044ui_story.fillRatio = var_296_33
				end
			end

			if arg_293_1.time_ >= var_296_30 + var_296_31 and arg_293_1.time_ < var_296_30 + var_296_31 + arg_296_0 and arg_293_1.var_.characterEffect10044ui_story then
				local var_296_34 = 0.5

				arg_293_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_293_1.var_.characterEffect10044ui_story.fillRatio = var_296_34
			end

			local var_296_35 = 0
			local var_296_36 = 0.25

			if var_296_35 < arg_293_1.time_ and arg_293_1.time_ <= var_296_35 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_37 = arg_293_1:FormatText(StoryNameCfg[36].name)

				arg_293_1.leftNameTxt_.text = var_296_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_38 = arg_293_1:GetWordFromCfg(120021070)
				local var_296_39 = arg_293_1:FormatText(var_296_38.content)

				arg_293_1.text_.text = var_296_39

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_40 = 10
				local var_296_41 = utf8.len(var_296_39)
				local var_296_42 = var_296_40 <= 0 and var_296_36 or var_296_36 * (var_296_41 / var_296_40)

				if var_296_42 > 0 and var_296_36 < var_296_42 then
					arg_293_1.talkMaxDuration = var_296_42

					if var_296_42 + var_296_35 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_42 + var_296_35
					end
				end

				arg_293_1.text_.text = var_296_39
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021070", "story_v_out_120021.awb") ~= 0 then
					local var_296_43 = manager.audio:GetVoiceLength("story_v_out_120021", "120021070", "story_v_out_120021.awb") / 1000

					if var_296_43 + var_296_35 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_43 + var_296_35
					end

					if var_296_38.prefab_name ~= "" and arg_293_1.actors_[var_296_38.prefab_name] ~= nil then
						local var_296_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_38.prefab_name].transform, "story_v_out_120021", "120021070", "story_v_out_120021.awb")

						arg_293_1:RecordAudio("120021070", var_296_44)
						arg_293_1:RecordAudio("120021070", var_296_44)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_120021", "120021070", "story_v_out_120021.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_120021", "120021070", "story_v_out_120021.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_45 = math.max(var_296_36, arg_293_1.talkMaxDuration)

			if var_296_35 <= arg_293_1.time_ and arg_293_1.time_ < var_296_35 + var_296_45 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_35) / var_296_45

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_35 + var_296_45 and arg_293_1.time_ < var_296_35 + var_296_45 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play120021071 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 120021071
		arg_297_1.duration_ = 4.3

		local var_297_0 = {
			zh = 3.066,
			ja = 4.3
		}
		local var_297_1 = manager.audio:GetLocalizationFlag()

		if var_297_0[var_297_1] ~= nil then
			arg_297_1.duration_ = var_297_0[var_297_1]
		end

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play120021072(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 then
				arg_297_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action4_1")
			end

			local var_300_2 = 0
			local var_300_3 = 0.325

			if var_300_2 < arg_297_1.time_ and arg_297_1.time_ <= var_300_2 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_4 = arg_297_1:FormatText(StoryNameCfg[36].name)

				arg_297_1.leftNameTxt_.text = var_300_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_5 = arg_297_1:GetWordFromCfg(120021071)
				local var_300_6 = arg_297_1:FormatText(var_300_5.content)

				arg_297_1.text_.text = var_300_6

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_7 = 13
				local var_300_8 = utf8.len(var_300_6)
				local var_300_9 = var_300_7 <= 0 and var_300_3 or var_300_3 * (var_300_8 / var_300_7)

				if var_300_9 > 0 and var_300_3 < var_300_9 then
					arg_297_1.talkMaxDuration = var_300_9

					if var_300_9 + var_300_2 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_9 + var_300_2
					end
				end

				arg_297_1.text_.text = var_300_6
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021071", "story_v_out_120021.awb") ~= 0 then
					local var_300_10 = manager.audio:GetVoiceLength("story_v_out_120021", "120021071", "story_v_out_120021.awb") / 1000

					if var_300_10 + var_300_2 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_10 + var_300_2
					end

					if var_300_5.prefab_name ~= "" and arg_297_1.actors_[var_300_5.prefab_name] ~= nil then
						local var_300_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_5.prefab_name].transform, "story_v_out_120021", "120021071", "story_v_out_120021.awb")

						arg_297_1:RecordAudio("120021071", var_300_11)
						arg_297_1:RecordAudio("120021071", var_300_11)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_120021", "120021071", "story_v_out_120021.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_120021", "120021071", "story_v_out_120021.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_12 = math.max(var_300_3, arg_297_1.talkMaxDuration)

			if var_300_2 <= arg_297_1.time_ and arg_297_1.time_ < var_300_2 + var_300_12 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_2) / var_300_12

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_2 + var_300_12 and arg_297_1.time_ < var_300_2 + var_300_12 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play120021072 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 120021072
		arg_301_1.duration_ = 7.466

		local var_301_0 = {
			zh = 4.633,
			ja = 7.466
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
				arg_301_0:Play120021073(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["10044ui_story"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and arg_301_1.var_.characterEffect10044ui_story == nil then
				arg_301_1.var_.characterEffect10044ui_story = var_304_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_2 = 0.2

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.characterEffect10044ui_story then
					arg_301_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and arg_301_1.var_.characterEffect10044ui_story then
				arg_301_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_304_4 = arg_301_1.actors_["10037ui_story"]
			local var_304_5 = 0

			if var_304_5 < arg_301_1.time_ and arg_301_1.time_ <= var_304_5 + arg_304_0 and arg_301_1.var_.characterEffect10037ui_story == nil then
				arg_301_1.var_.characterEffect10037ui_story = var_304_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_6 = 0.2

			if var_304_5 <= arg_301_1.time_ and arg_301_1.time_ < var_304_5 + var_304_6 then
				local var_304_7 = (arg_301_1.time_ - var_304_5) / var_304_6

				if arg_301_1.var_.characterEffect10037ui_story then
					local var_304_8 = Mathf.Lerp(0, 0.5, var_304_7)

					arg_301_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_301_1.var_.characterEffect10037ui_story.fillRatio = var_304_8
				end
			end

			if arg_301_1.time_ >= var_304_5 + var_304_6 and arg_301_1.time_ < var_304_5 + var_304_6 + arg_304_0 and arg_301_1.var_.characterEffect10037ui_story then
				local var_304_9 = 0.5

				arg_301_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_301_1.var_.characterEffect10037ui_story.fillRatio = var_304_9
			end

			local var_304_10 = arg_301_1.actors_["10037ui_story"].transform
			local var_304_11 = 0

			if var_304_11 < arg_301_1.time_ and arg_301_1.time_ <= var_304_11 + arg_304_0 then
				arg_301_1.var_.moveOldPos10037ui_story = var_304_10.localPosition
			end

			local var_304_12 = 0.001

			if var_304_11 <= arg_301_1.time_ and arg_301_1.time_ < var_304_11 + var_304_12 then
				local var_304_13 = (arg_301_1.time_ - var_304_11) / var_304_12
				local var_304_14 = Vector3.New(0.7, -1.13, -6.2)

				var_304_10.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos10037ui_story, var_304_14, var_304_13)

				local var_304_15 = manager.ui.mainCamera.transform.position - var_304_10.position

				var_304_10.forward = Vector3.New(var_304_15.x, var_304_15.y, var_304_15.z)

				local var_304_16 = var_304_10.localEulerAngles

				var_304_16.z = 0
				var_304_16.x = 0
				var_304_10.localEulerAngles = var_304_16
			end

			if arg_301_1.time_ >= var_304_11 + var_304_12 and arg_301_1.time_ < var_304_11 + var_304_12 + arg_304_0 then
				var_304_10.localPosition = Vector3.New(0.7, -1.13, -6.2)

				local var_304_17 = manager.ui.mainCamera.transform.position - var_304_10.position

				var_304_10.forward = Vector3.New(var_304_17.x, var_304_17.y, var_304_17.z)

				local var_304_18 = var_304_10.localEulerAngles

				var_304_18.z = 0
				var_304_18.x = 0
				var_304_10.localEulerAngles = var_304_18
			end

			local var_304_19 = arg_301_1.actors_["10044ui_story"].transform
			local var_304_20 = 0

			if var_304_20 < arg_301_1.time_ and arg_301_1.time_ <= var_304_20 + arg_304_0 then
				arg_301_1.var_.moveOldPos10044ui_story = var_304_19.localPosition
			end

			local var_304_21 = 0.001

			if var_304_20 <= arg_301_1.time_ and arg_301_1.time_ < var_304_20 + var_304_21 then
				local var_304_22 = (arg_301_1.time_ - var_304_20) / var_304_21
				local var_304_23 = Vector3.New(-0.7, -0.72, -6.3)

				var_304_19.localPosition = Vector3.Lerp(arg_301_1.var_.moveOldPos10044ui_story, var_304_23, var_304_22)

				local var_304_24 = manager.ui.mainCamera.transform.position - var_304_19.position

				var_304_19.forward = Vector3.New(var_304_24.x, var_304_24.y, var_304_24.z)

				local var_304_25 = var_304_19.localEulerAngles

				var_304_25.z = 0
				var_304_25.x = 0
				var_304_19.localEulerAngles = var_304_25
			end

			if arg_301_1.time_ >= var_304_20 + var_304_21 and arg_301_1.time_ < var_304_20 + var_304_21 + arg_304_0 then
				var_304_19.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_304_26 = manager.ui.mainCamera.transform.position - var_304_19.position

				var_304_19.forward = Vector3.New(var_304_26.x, var_304_26.y, var_304_26.z)

				local var_304_27 = var_304_19.localEulerAngles

				var_304_27.z = 0
				var_304_27.x = 0
				var_304_19.localEulerAngles = var_304_27
			end

			local var_304_28 = 0

			if var_304_28 < arg_301_1.time_ and arg_301_1.time_ <= var_304_28 + arg_304_0 then
				arg_301_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action4_1")
			end

			local var_304_29 = 0

			if var_304_29 < arg_301_1.time_ and arg_301_1.time_ <= var_304_29 + arg_304_0 then
				arg_301_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_304_30 = 0
			local var_304_31 = 0.375

			if var_304_30 < arg_301_1.time_ and arg_301_1.time_ <= var_304_30 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_32 = arg_301_1:FormatText(StoryNameCfg[380].name)

				arg_301_1.leftNameTxt_.text = var_304_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_33 = arg_301_1:GetWordFromCfg(120021072)
				local var_304_34 = arg_301_1:FormatText(var_304_33.content)

				arg_301_1.text_.text = var_304_34

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_35 = 15
				local var_304_36 = utf8.len(var_304_34)
				local var_304_37 = var_304_35 <= 0 and var_304_31 or var_304_31 * (var_304_36 / var_304_35)

				if var_304_37 > 0 and var_304_31 < var_304_37 then
					arg_301_1.talkMaxDuration = var_304_37

					if var_304_37 + var_304_30 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_37 + var_304_30
					end
				end

				arg_301_1.text_.text = var_304_34
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021072", "story_v_out_120021.awb") ~= 0 then
					local var_304_38 = manager.audio:GetVoiceLength("story_v_out_120021", "120021072", "story_v_out_120021.awb") / 1000

					if var_304_38 + var_304_30 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_38 + var_304_30
					end

					if var_304_33.prefab_name ~= "" and arg_301_1.actors_[var_304_33.prefab_name] ~= nil then
						local var_304_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_33.prefab_name].transform, "story_v_out_120021", "120021072", "story_v_out_120021.awb")

						arg_301_1:RecordAudio("120021072", var_304_39)
						arg_301_1:RecordAudio("120021072", var_304_39)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_120021", "120021072", "story_v_out_120021.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_120021", "120021072", "story_v_out_120021.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_40 = math.max(var_304_31, arg_301_1.talkMaxDuration)

			if var_304_30 <= arg_301_1.time_ and arg_301_1.time_ < var_304_30 + var_304_40 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_30) / var_304_40

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_30 + var_304_40 and arg_301_1.time_ < var_304_30 + var_304_40 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play120021073 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 120021073
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play120021074(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["10037ui_story"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos10037ui_story = var_308_0.localPosition
			end

			local var_308_2 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2
				local var_308_4 = Vector3.New(0, 100, 0)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos10037ui_story, var_308_4, var_308_3)

				local var_308_5 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_5.x, var_308_5.y, var_308_5.z)

				local var_308_6 = var_308_0.localEulerAngles

				var_308_6.z = 0
				var_308_6.x = 0
				var_308_0.localEulerAngles = var_308_6
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(0, 100, 0)

				local var_308_7 = manager.ui.mainCamera.transform.position - var_308_0.position

				var_308_0.forward = Vector3.New(var_308_7.x, var_308_7.y, var_308_7.z)

				local var_308_8 = var_308_0.localEulerAngles

				var_308_8.z = 0
				var_308_8.x = 0
				var_308_0.localEulerAngles = var_308_8
			end

			local var_308_9 = arg_305_1.actors_["10044ui_story"].transform
			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 then
				arg_305_1.var_.moveOldPos10044ui_story = var_308_9.localPosition
			end

			local var_308_11 = 0.001

			if var_308_10 <= arg_305_1.time_ and arg_305_1.time_ < var_308_10 + var_308_11 then
				local var_308_12 = (arg_305_1.time_ - var_308_10) / var_308_11
				local var_308_13 = Vector3.New(0, 100, 0)

				var_308_9.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos10044ui_story, var_308_13, var_308_12)

				local var_308_14 = manager.ui.mainCamera.transform.position - var_308_9.position

				var_308_9.forward = Vector3.New(var_308_14.x, var_308_14.y, var_308_14.z)

				local var_308_15 = var_308_9.localEulerAngles

				var_308_15.z = 0
				var_308_15.x = 0
				var_308_9.localEulerAngles = var_308_15
			end

			if arg_305_1.time_ >= var_308_10 + var_308_11 and arg_305_1.time_ < var_308_10 + var_308_11 + arg_308_0 then
				var_308_9.localPosition = Vector3.New(0, 100, 0)

				local var_308_16 = manager.ui.mainCamera.transform.position - var_308_9.position

				var_308_9.forward = Vector3.New(var_308_16.x, var_308_16.y, var_308_16.z)

				local var_308_17 = var_308_9.localEulerAngles

				var_308_17.z = 0
				var_308_17.x = 0
				var_308_9.localEulerAngles = var_308_17
			end

			local var_308_18 = 0
			local var_308_19 = 1.275

			if var_308_18 < arg_305_1.time_ and arg_305_1.time_ <= var_308_18 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, false)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_20 = arg_305_1:GetWordFromCfg(120021073)
				local var_308_21 = arg_305_1:FormatText(var_308_20.content)

				arg_305_1.text_.text = var_308_21

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_22 = 51
				local var_308_23 = utf8.len(var_308_21)
				local var_308_24 = var_308_22 <= 0 and var_308_19 or var_308_19 * (var_308_23 / var_308_22)

				if var_308_24 > 0 and var_308_19 < var_308_24 then
					arg_305_1.talkMaxDuration = var_308_24

					if var_308_24 + var_308_18 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_24 + var_308_18
					end
				end

				arg_305_1.text_.text = var_308_21
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_25 = math.max(var_308_19, arg_305_1.talkMaxDuration)

			if var_308_18 <= arg_305_1.time_ and arg_305_1.time_ < var_308_18 + var_308_25 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_18) / var_308_25

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_18 + var_308_25 and arg_305_1.time_ < var_308_18 + var_308_25 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play120021074 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 120021074
		arg_309_1.duration_ = 2.266

		local var_309_0 = {
			zh = 1.999999999999,
			ja = 2.266
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
				arg_309_0:Play120021075(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["10037ui_story"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 and arg_309_1.var_.characterEffect10037ui_story == nil then
				arg_309_1.var_.characterEffect10037ui_story = var_312_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_2 = 0.2

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2

				if arg_309_1.var_.characterEffect10037ui_story then
					arg_309_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 and arg_309_1.var_.characterEffect10037ui_story then
				arg_309_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_312_4 = arg_309_1.actors_["10044ui_story"].transform
			local var_312_5 = 0

			if var_312_5 < arg_309_1.time_ and arg_309_1.time_ <= var_312_5 + arg_312_0 then
				arg_309_1.var_.moveOldPos10044ui_story = var_312_4.localPosition
			end

			local var_312_6 = 0.001

			if var_312_5 <= arg_309_1.time_ and arg_309_1.time_ < var_312_5 + var_312_6 then
				local var_312_7 = (arg_309_1.time_ - var_312_5) / var_312_6
				local var_312_8 = Vector3.New(-0.7, -0.72, -6.3)

				var_312_4.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10044ui_story, var_312_8, var_312_7)

				local var_312_9 = manager.ui.mainCamera.transform.position - var_312_4.position

				var_312_4.forward = Vector3.New(var_312_9.x, var_312_9.y, var_312_9.z)

				local var_312_10 = var_312_4.localEulerAngles

				var_312_10.z = 0
				var_312_10.x = 0
				var_312_4.localEulerAngles = var_312_10
			end

			if arg_309_1.time_ >= var_312_5 + var_312_6 and arg_309_1.time_ < var_312_5 + var_312_6 + arg_312_0 then
				var_312_4.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_312_11 = manager.ui.mainCamera.transform.position - var_312_4.position

				var_312_4.forward = Vector3.New(var_312_11.x, var_312_11.y, var_312_11.z)

				local var_312_12 = var_312_4.localEulerAngles

				var_312_12.z = 0
				var_312_12.x = 0
				var_312_4.localEulerAngles = var_312_12
			end

			local var_312_13 = arg_309_1.actors_["10037ui_story"].transform
			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 then
				arg_309_1.var_.moveOldPos10037ui_story = var_312_13.localPosition
			end

			local var_312_15 = 0.001

			if var_312_14 <= arg_309_1.time_ and arg_309_1.time_ < var_312_14 + var_312_15 then
				local var_312_16 = (arg_309_1.time_ - var_312_14) / var_312_15
				local var_312_17 = Vector3.New(0.7, -1.13, -6.2)

				var_312_13.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10037ui_story, var_312_17, var_312_16)

				local var_312_18 = manager.ui.mainCamera.transform.position - var_312_13.position

				var_312_13.forward = Vector3.New(var_312_18.x, var_312_18.y, var_312_18.z)

				local var_312_19 = var_312_13.localEulerAngles

				var_312_19.z = 0
				var_312_19.x = 0
				var_312_13.localEulerAngles = var_312_19
			end

			if arg_309_1.time_ >= var_312_14 + var_312_15 and arg_309_1.time_ < var_312_14 + var_312_15 + arg_312_0 then
				var_312_13.localPosition = Vector3.New(0.7, -1.13, -6.2)

				local var_312_20 = manager.ui.mainCamera.transform.position - var_312_13.position

				var_312_13.forward = Vector3.New(var_312_20.x, var_312_20.y, var_312_20.z)

				local var_312_21 = var_312_13.localEulerAngles

				var_312_21.z = 0
				var_312_21.x = 0
				var_312_13.localEulerAngles = var_312_21
			end

			local var_312_22 = 0

			if var_312_22 < arg_309_1.time_ and arg_309_1.time_ <= var_312_22 + arg_312_0 then
				arg_309_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action5_1")
			end

			local var_312_23 = 0

			if var_312_23 < arg_309_1.time_ and arg_309_1.time_ <= var_312_23 + arg_312_0 then
				arg_309_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_312_24 = 0

			if var_312_24 < arg_309_1.time_ and arg_309_1.time_ <= var_312_24 + arg_312_0 then
				arg_309_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_312_25 = arg_309_1.actors_["10044ui_story"]
			local var_312_26 = 0

			if var_312_26 < arg_309_1.time_ and arg_309_1.time_ <= var_312_26 + arg_312_0 and arg_309_1.var_.characterEffect10044ui_story == nil then
				arg_309_1.var_.characterEffect10044ui_story = var_312_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_27 = 0.0166666666666667

			if var_312_26 <= arg_309_1.time_ and arg_309_1.time_ < var_312_26 + var_312_27 then
				local var_312_28 = (arg_309_1.time_ - var_312_26) / var_312_27

				if arg_309_1.var_.characterEffect10044ui_story then
					local var_312_29 = Mathf.Lerp(0, 0.5, var_312_28)

					arg_309_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_309_1.var_.characterEffect10044ui_story.fillRatio = var_312_29
				end
			end

			if arg_309_1.time_ >= var_312_26 + var_312_27 and arg_309_1.time_ < var_312_26 + var_312_27 + arg_312_0 and arg_309_1.var_.characterEffect10044ui_story then
				local var_312_30 = 0.5

				arg_309_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_309_1.var_.characterEffect10044ui_story.fillRatio = var_312_30
			end

			local var_312_31 = 0
			local var_312_32 = 0.225

			if var_312_31 < arg_309_1.time_ and arg_309_1.time_ <= var_312_31 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_33 = arg_309_1:FormatText(StoryNameCfg[36].name)

				arg_309_1.leftNameTxt_.text = var_312_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_34 = arg_309_1:GetWordFromCfg(120021074)
				local var_312_35 = arg_309_1:FormatText(var_312_34.content)

				arg_309_1.text_.text = var_312_35

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_36 = 9
				local var_312_37 = utf8.len(var_312_35)
				local var_312_38 = var_312_36 <= 0 and var_312_32 or var_312_32 * (var_312_37 / var_312_36)

				if var_312_38 > 0 and var_312_32 < var_312_38 then
					arg_309_1.talkMaxDuration = var_312_38

					if var_312_38 + var_312_31 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_38 + var_312_31
					end
				end

				arg_309_1.text_.text = var_312_35
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021074", "story_v_out_120021.awb") ~= 0 then
					local var_312_39 = manager.audio:GetVoiceLength("story_v_out_120021", "120021074", "story_v_out_120021.awb") / 1000

					if var_312_39 + var_312_31 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_39 + var_312_31
					end

					if var_312_34.prefab_name ~= "" and arg_309_1.actors_[var_312_34.prefab_name] ~= nil then
						local var_312_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_34.prefab_name].transform, "story_v_out_120021", "120021074", "story_v_out_120021.awb")

						arg_309_1:RecordAudio("120021074", var_312_40)
						arg_309_1:RecordAudio("120021074", var_312_40)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_120021", "120021074", "story_v_out_120021.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_120021", "120021074", "story_v_out_120021.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_41 = math.max(var_312_32, arg_309_1.talkMaxDuration)

			if var_312_31 <= arg_309_1.time_ and arg_309_1.time_ < var_312_31 + var_312_41 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_31) / var_312_41

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_31 + var_312_41 and arg_309_1.time_ < var_312_31 + var_312_41 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play120021075 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 120021075
		arg_313_1.duration_ = 3.466

		local var_313_0 = {
			zh = 2.5,
			ja = 3.466
		}
		local var_313_1 = manager.audio:GetLocalizationFlag()

		if var_313_0[var_313_1] ~= nil then
			arg_313_1.duration_ = var_313_0[var_313_1]
		end

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play120021076(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["10044ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect10044ui_story == nil then
				arg_313_1.var_.characterEffect10044ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.2

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect10044ui_story then
					arg_313_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect10044ui_story then
				arg_313_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_316_4 = arg_313_1.actors_["10037ui_story"]
			local var_316_5 = 0

			if var_316_5 < arg_313_1.time_ and arg_313_1.time_ <= var_316_5 + arg_316_0 and arg_313_1.var_.characterEffect10037ui_story == nil then
				arg_313_1.var_.characterEffect10037ui_story = var_316_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_6 = 0.2

			if var_316_5 <= arg_313_1.time_ and arg_313_1.time_ < var_316_5 + var_316_6 then
				local var_316_7 = (arg_313_1.time_ - var_316_5) / var_316_6

				if arg_313_1.var_.characterEffect10037ui_story then
					local var_316_8 = Mathf.Lerp(0, 0.5, var_316_7)

					arg_313_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_313_1.var_.characterEffect10037ui_story.fillRatio = var_316_8
				end
			end

			if arg_313_1.time_ >= var_316_5 + var_316_6 and arg_313_1.time_ < var_316_5 + var_316_6 + arg_316_0 and arg_313_1.var_.characterEffect10037ui_story then
				local var_316_9 = 0.5

				arg_313_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_313_1.var_.characterEffect10037ui_story.fillRatio = var_316_9
			end

			local var_316_10 = 0

			if var_316_10 < arg_313_1.time_ and arg_313_1.time_ <= var_316_10 + arg_316_0 then
				arg_313_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_316_11 = 0

			if var_316_11 < arg_313_1.time_ and arg_313_1.time_ <= var_316_11 + arg_316_0 then
				arg_313_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_316_12 = 0
			local var_316_13 = 0.3

			if var_316_12 < arg_313_1.time_ and arg_313_1.time_ <= var_316_12 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_14 = arg_313_1:FormatText(StoryNameCfg[380].name)

				arg_313_1.leftNameTxt_.text = var_316_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_15 = arg_313_1:GetWordFromCfg(120021075)
				local var_316_16 = arg_313_1:FormatText(var_316_15.content)

				arg_313_1.text_.text = var_316_16

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_17 = 12
				local var_316_18 = utf8.len(var_316_16)
				local var_316_19 = var_316_17 <= 0 and var_316_13 or var_316_13 * (var_316_18 / var_316_17)

				if var_316_19 > 0 and var_316_13 < var_316_19 then
					arg_313_1.talkMaxDuration = var_316_19

					if var_316_19 + var_316_12 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_19 + var_316_12
					end
				end

				arg_313_1.text_.text = var_316_16
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021075", "story_v_out_120021.awb") ~= 0 then
					local var_316_20 = manager.audio:GetVoiceLength("story_v_out_120021", "120021075", "story_v_out_120021.awb") / 1000

					if var_316_20 + var_316_12 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_20 + var_316_12
					end

					if var_316_15.prefab_name ~= "" and arg_313_1.actors_[var_316_15.prefab_name] ~= nil then
						local var_316_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_15.prefab_name].transform, "story_v_out_120021", "120021075", "story_v_out_120021.awb")

						arg_313_1:RecordAudio("120021075", var_316_21)
						arg_313_1:RecordAudio("120021075", var_316_21)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_120021", "120021075", "story_v_out_120021.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_120021", "120021075", "story_v_out_120021.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_22 = math.max(var_316_13, arg_313_1.talkMaxDuration)

			if var_316_12 <= arg_313_1.time_ and arg_313_1.time_ < var_316_12 + var_316_22 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_12) / var_316_22

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_12 + var_316_22 and arg_313_1.time_ < var_316_12 + var_316_22 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play120021076 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 120021076
		arg_317_1.duration_ = 3.3

		local var_317_0 = {
			zh = 1.999999999999,
			ja = 3.3
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
				arg_317_0:Play120021077(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10044ui_story"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos10044ui_story = var_320_0.localPosition
			end

			local var_320_2 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2
				local var_320_4 = Vector3.New(0, 100, 0)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos10044ui_story, var_320_4, var_320_3)

				local var_320_5 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_5.x, var_320_5.y, var_320_5.z)

				local var_320_6 = var_320_0.localEulerAngles

				var_320_6.z = 0
				var_320_6.x = 0
				var_320_0.localEulerAngles = var_320_6
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(0, 100, 0)

				local var_320_7 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_7.x, var_320_7.y, var_320_7.z)

				local var_320_8 = var_320_0.localEulerAngles

				var_320_8.z = 0
				var_320_8.x = 0
				var_320_0.localEulerAngles = var_320_8
			end

			local var_320_9 = arg_317_1.actors_["1072ui_story"].transform
			local var_320_10 = 0

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 then
				arg_317_1.var_.moveOldPos1072ui_story = var_320_9.localPosition
			end

			local var_320_11 = 0.001

			if var_320_10 <= arg_317_1.time_ and arg_317_1.time_ < var_320_10 + var_320_11 then
				local var_320_12 = (arg_317_1.time_ - var_320_10) / var_320_11
				local var_320_13 = Vector3.New(-0.7, -0.71, -6)

				var_320_9.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1072ui_story, var_320_13, var_320_12)

				local var_320_14 = manager.ui.mainCamera.transform.position - var_320_9.position

				var_320_9.forward = Vector3.New(var_320_14.x, var_320_14.y, var_320_14.z)

				local var_320_15 = var_320_9.localEulerAngles

				var_320_15.z = 0
				var_320_15.x = 0
				var_320_9.localEulerAngles = var_320_15
			end

			if arg_317_1.time_ >= var_320_10 + var_320_11 and arg_317_1.time_ < var_320_10 + var_320_11 + arg_320_0 then
				var_320_9.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_320_16 = manager.ui.mainCamera.transform.position - var_320_9.position

				var_320_9.forward = Vector3.New(var_320_16.x, var_320_16.y, var_320_16.z)

				local var_320_17 = var_320_9.localEulerAngles

				var_320_17.z = 0
				var_320_17.x = 0
				var_320_9.localEulerAngles = var_320_17
			end

			local var_320_18 = arg_317_1.actors_["1072ui_story"]
			local var_320_19 = 0

			if var_320_19 < arg_317_1.time_ and arg_317_1.time_ <= var_320_19 + arg_320_0 and arg_317_1.var_.characterEffect1072ui_story == nil then
				arg_317_1.var_.characterEffect1072ui_story = var_320_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_20 = 0.2

			if var_320_19 <= arg_317_1.time_ and arg_317_1.time_ < var_320_19 + var_320_20 then
				local var_320_21 = (arg_317_1.time_ - var_320_19) / var_320_20

				if arg_317_1.var_.characterEffect1072ui_story then
					arg_317_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_19 + var_320_20 and arg_317_1.time_ < var_320_19 + var_320_20 + arg_320_0 and arg_317_1.var_.characterEffect1072ui_story then
				arg_317_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_320_22 = 0

			if var_320_22 < arg_317_1.time_ and arg_317_1.time_ <= var_320_22 + arg_320_0 then
				arg_317_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_320_23 = 0

			if var_320_23 < arg_317_1.time_ and arg_317_1.time_ <= var_320_23 + arg_320_0 then
				arg_317_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_320_24 = 0
			local var_320_25 = 0.15

			if var_320_24 < arg_317_1.time_ and arg_317_1.time_ <= var_320_24 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_26 = arg_317_1:FormatText(StoryNameCfg[379].name)

				arg_317_1.leftNameTxt_.text = var_320_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_27 = arg_317_1:GetWordFromCfg(120021076)
				local var_320_28 = arg_317_1:FormatText(var_320_27.content)

				arg_317_1.text_.text = var_320_28

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_29 = 6
				local var_320_30 = utf8.len(var_320_28)
				local var_320_31 = var_320_29 <= 0 and var_320_25 or var_320_25 * (var_320_30 / var_320_29)

				if var_320_31 > 0 and var_320_25 < var_320_31 then
					arg_317_1.talkMaxDuration = var_320_31

					if var_320_31 + var_320_24 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_31 + var_320_24
					end
				end

				arg_317_1.text_.text = var_320_28
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021076", "story_v_out_120021.awb") ~= 0 then
					local var_320_32 = manager.audio:GetVoiceLength("story_v_out_120021", "120021076", "story_v_out_120021.awb") / 1000

					if var_320_32 + var_320_24 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_32 + var_320_24
					end

					if var_320_27.prefab_name ~= "" and arg_317_1.actors_[var_320_27.prefab_name] ~= nil then
						local var_320_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_27.prefab_name].transform, "story_v_out_120021", "120021076", "story_v_out_120021.awb")

						arg_317_1:RecordAudio("120021076", var_320_33)
						arg_317_1:RecordAudio("120021076", var_320_33)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_120021", "120021076", "story_v_out_120021.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_120021", "120021076", "story_v_out_120021.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_34 = math.max(var_320_25, arg_317_1.talkMaxDuration)

			if var_320_24 <= arg_317_1.time_ and arg_317_1.time_ < var_320_24 + var_320_34 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_24) / var_320_34

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_24 + var_320_34 and arg_317_1.time_ < var_320_24 + var_320_34 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play120021077 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 120021077
		arg_321_1.duration_ = 8.666

		local var_321_0 = {
			zh = 8.666,
			ja = 6.733
		}
		local var_321_1 = manager.audio:GetLocalizationFlag()

		if var_321_0[var_321_1] ~= nil then
			arg_321_1.duration_ = var_321_0[var_321_1]
		end

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play120021078(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1072ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect1072ui_story == nil then
				arg_321_1.var_.characterEffect1072ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.2

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect1072ui_story then
					local var_324_4 = Mathf.Lerp(0, 0.5, var_324_3)

					arg_321_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1072ui_story.fillRatio = var_324_4
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect1072ui_story then
				local var_324_5 = 0.5

				arg_321_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1072ui_story.fillRatio = var_324_5
			end

			local var_324_6 = arg_321_1.actors_["10037ui_story"]
			local var_324_7 = 0

			if var_324_7 < arg_321_1.time_ and arg_321_1.time_ <= var_324_7 + arg_324_0 and arg_321_1.var_.characterEffect10037ui_story == nil then
				arg_321_1.var_.characterEffect10037ui_story = var_324_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_8 = 0.2

			if var_324_7 <= arg_321_1.time_ and arg_321_1.time_ < var_324_7 + var_324_8 then
				local var_324_9 = (arg_321_1.time_ - var_324_7) / var_324_8

				if arg_321_1.var_.characterEffect10037ui_story then
					arg_321_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_321_1.time_ >= var_324_7 + var_324_8 and arg_321_1.time_ < var_324_7 + var_324_8 + arg_324_0 and arg_321_1.var_.characterEffect10037ui_story then
				arg_321_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_324_10 = 0

			if var_324_10 < arg_321_1.time_ and arg_321_1.time_ <= var_324_10 + arg_324_0 then
				arg_321_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action5_2")
			end

			local var_324_11 = 0
			local var_324_12 = 0.875

			if var_324_11 < arg_321_1.time_ and arg_321_1.time_ <= var_324_11 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_13 = arg_321_1:FormatText(StoryNameCfg[383].name)

				arg_321_1.leftNameTxt_.text = var_324_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_14 = arg_321_1:GetWordFromCfg(120021077)
				local var_324_15 = arg_321_1:FormatText(var_324_14.content)

				arg_321_1.text_.text = var_324_15

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_16 = 35
				local var_324_17 = utf8.len(var_324_15)
				local var_324_18 = var_324_16 <= 0 and var_324_12 or var_324_12 * (var_324_17 / var_324_16)

				if var_324_18 > 0 and var_324_12 < var_324_18 then
					arg_321_1.talkMaxDuration = var_324_18

					if var_324_18 + var_324_11 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_18 + var_324_11
					end
				end

				arg_321_1.text_.text = var_324_15
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021077", "story_v_out_120021.awb") ~= 0 then
					local var_324_19 = manager.audio:GetVoiceLength("story_v_out_120021", "120021077", "story_v_out_120021.awb") / 1000

					if var_324_19 + var_324_11 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_19 + var_324_11
					end

					if var_324_14.prefab_name ~= "" and arg_321_1.actors_[var_324_14.prefab_name] ~= nil then
						local var_324_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_14.prefab_name].transform, "story_v_out_120021", "120021077", "story_v_out_120021.awb")

						arg_321_1:RecordAudio("120021077", var_324_20)
						arg_321_1:RecordAudio("120021077", var_324_20)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_120021", "120021077", "story_v_out_120021.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_120021", "120021077", "story_v_out_120021.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_21 = math.max(var_324_12, arg_321_1.talkMaxDuration)

			if var_324_11 <= arg_321_1.time_ and arg_321_1.time_ < var_324_11 + var_324_21 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_11) / var_324_21

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_11 + var_324_21 and arg_321_1.time_ < var_324_11 + var_324_21 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play120021078 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 120021078
		arg_325_1.duration_ = 5.8

		local var_325_0 = {
			zh = 3.2,
			ja = 5.8
		}
		local var_325_1 = manager.audio:GetLocalizationFlag()

		if var_325_0[var_325_1] ~= nil then
			arg_325_1.duration_ = var_325_0[var_325_1]
		end

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play120021079(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 0.3

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_2 = arg_325_1:FormatText(StoryNameCfg[383].name)

				arg_325_1.leftNameTxt_.text = var_328_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_3 = arg_325_1:GetWordFromCfg(120021078)
				local var_328_4 = arg_325_1:FormatText(var_328_3.content)

				arg_325_1.text_.text = var_328_4

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_5 = 12
				local var_328_6 = utf8.len(var_328_4)
				local var_328_7 = var_328_5 <= 0 and var_328_1 or var_328_1 * (var_328_6 / var_328_5)

				if var_328_7 > 0 and var_328_1 < var_328_7 then
					arg_325_1.talkMaxDuration = var_328_7

					if var_328_7 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_7 + var_328_0
					end
				end

				arg_325_1.text_.text = var_328_4
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021078", "story_v_out_120021.awb") ~= 0 then
					local var_328_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021078", "story_v_out_120021.awb") / 1000

					if var_328_8 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_0
					end

					if var_328_3.prefab_name ~= "" and arg_325_1.actors_[var_328_3.prefab_name] ~= nil then
						local var_328_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_3.prefab_name].transform, "story_v_out_120021", "120021078", "story_v_out_120021.awb")

						arg_325_1:RecordAudio("120021078", var_328_9)
						arg_325_1:RecordAudio("120021078", var_328_9)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_120021", "120021078", "story_v_out_120021.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_120021", "120021078", "story_v_out_120021.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_10 = math.max(var_328_1, arg_325_1.talkMaxDuration)

			if var_328_0 <= arg_325_1.time_ and arg_325_1.time_ < var_328_0 + var_328_10 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_0) / var_328_10

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_0 + var_328_10 and arg_325_1.time_ < var_328_0 + var_328_10 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play120021079 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 120021079
		arg_329_1.duration_ = 10.2

		local var_329_0 = {
			zh = 7.233,
			ja = 10.2
		}
		local var_329_1 = manager.audio:GetLocalizationFlag()

		if var_329_0[var_329_1] ~= nil then
			arg_329_1.duration_ = var_329_0[var_329_1]
		end

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play120021080(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1072ui_story"]
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 and arg_329_1.var_.characterEffect1072ui_story == nil then
				arg_329_1.var_.characterEffect1072ui_story = var_332_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_2 = 0.2

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2

				if arg_329_1.var_.characterEffect1072ui_story then
					arg_329_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 and arg_329_1.var_.characterEffect1072ui_story then
				arg_329_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_332_4 = arg_329_1.actors_["10037ui_story"]
			local var_332_5 = 0

			if var_332_5 < arg_329_1.time_ and arg_329_1.time_ <= var_332_5 + arg_332_0 and arg_329_1.var_.characterEffect10037ui_story == nil then
				arg_329_1.var_.characterEffect10037ui_story = var_332_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_332_6 = 0.2

			if var_332_5 <= arg_329_1.time_ and arg_329_1.time_ < var_332_5 + var_332_6 then
				local var_332_7 = (arg_329_1.time_ - var_332_5) / var_332_6

				if arg_329_1.var_.characterEffect10037ui_story then
					local var_332_8 = Mathf.Lerp(0, 0.5, var_332_7)

					arg_329_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_329_1.var_.characterEffect10037ui_story.fillRatio = var_332_8
				end
			end

			if arg_329_1.time_ >= var_332_5 + var_332_6 and arg_329_1.time_ < var_332_5 + var_332_6 + arg_332_0 and arg_329_1.var_.characterEffect10037ui_story then
				local var_332_9 = 0.5

				arg_329_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_329_1.var_.characterEffect10037ui_story.fillRatio = var_332_9
			end

			local var_332_10 = 0
			local var_332_11 = 0.925

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_12 = arg_329_1:FormatText(StoryNameCfg[379].name)

				arg_329_1.leftNameTxt_.text = var_332_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_13 = arg_329_1:GetWordFromCfg(120021079)
				local var_332_14 = arg_329_1:FormatText(var_332_13.content)

				arg_329_1.text_.text = var_332_14

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_15 = 36
				local var_332_16 = utf8.len(var_332_14)
				local var_332_17 = var_332_15 <= 0 and var_332_11 or var_332_11 * (var_332_16 / var_332_15)

				if var_332_17 > 0 and var_332_11 < var_332_17 then
					arg_329_1.talkMaxDuration = var_332_17

					if var_332_17 + var_332_10 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_17 + var_332_10
					end
				end

				arg_329_1.text_.text = var_332_14
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021079", "story_v_out_120021.awb") ~= 0 then
					local var_332_18 = manager.audio:GetVoiceLength("story_v_out_120021", "120021079", "story_v_out_120021.awb") / 1000

					if var_332_18 + var_332_10 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_18 + var_332_10
					end

					if var_332_13.prefab_name ~= "" and arg_329_1.actors_[var_332_13.prefab_name] ~= nil then
						local var_332_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_13.prefab_name].transform, "story_v_out_120021", "120021079", "story_v_out_120021.awb")

						arg_329_1:RecordAudio("120021079", var_332_19)
						arg_329_1:RecordAudio("120021079", var_332_19)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_120021", "120021079", "story_v_out_120021.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_120021", "120021079", "story_v_out_120021.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_20 = math.max(var_332_11, arg_329_1.talkMaxDuration)

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_20 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_10) / var_332_20

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_10 + var_332_20 and arg_329_1.time_ < var_332_10 + var_332_20 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play120021080 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 120021080
		arg_333_1.duration_ = 7.066

		local var_333_0 = {
			zh = 6.033,
			ja = 7.066
		}
		local var_333_1 = manager.audio:GetLocalizationFlag()

		if var_333_0[var_333_1] ~= nil then
			arg_333_1.duration_ = var_333_0[var_333_1]
		end

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play120021081(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1072ui_story"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.characterEffect1072ui_story == nil then
				arg_333_1.var_.characterEffect1072ui_story = var_336_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_2 = 0.2

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.characterEffect1072ui_story then
					local var_336_4 = Mathf.Lerp(0, 0.5, var_336_3)

					arg_333_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_333_1.var_.characterEffect1072ui_story.fillRatio = var_336_4
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.characterEffect1072ui_story then
				local var_336_5 = 0.5

				arg_333_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_333_1.var_.characterEffect1072ui_story.fillRatio = var_336_5
			end

			local var_336_6 = arg_333_1.actors_["10037ui_story"]
			local var_336_7 = 0

			if var_336_7 < arg_333_1.time_ and arg_333_1.time_ <= var_336_7 + arg_336_0 and arg_333_1.var_.characterEffect10037ui_story == nil then
				arg_333_1.var_.characterEffect10037ui_story = var_336_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_8 = 0.2

			if var_336_7 <= arg_333_1.time_ and arg_333_1.time_ < var_336_7 + var_336_8 then
				local var_336_9 = (arg_333_1.time_ - var_336_7) / var_336_8

				if arg_333_1.var_.characterEffect10037ui_story then
					arg_333_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_7 + var_336_8 and arg_333_1.time_ < var_336_7 + var_336_8 + arg_336_0 and arg_333_1.var_.characterEffect10037ui_story then
				arg_333_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_336_10 = 0
			local var_336_11 = 0.5

			if var_336_10 < arg_333_1.time_ and arg_333_1.time_ <= var_336_10 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_12 = arg_333_1:FormatText(StoryNameCfg[383].name)

				arg_333_1.leftNameTxt_.text = var_336_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_13 = arg_333_1:GetWordFromCfg(120021080)
				local var_336_14 = arg_333_1:FormatText(var_336_13.content)

				arg_333_1.text_.text = var_336_14

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_15 = 20
				local var_336_16 = utf8.len(var_336_14)
				local var_336_17 = var_336_15 <= 0 and var_336_11 or var_336_11 * (var_336_16 / var_336_15)

				if var_336_17 > 0 and var_336_11 < var_336_17 then
					arg_333_1.talkMaxDuration = var_336_17

					if var_336_17 + var_336_10 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_17 + var_336_10
					end
				end

				arg_333_1.text_.text = var_336_14
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021080", "story_v_out_120021.awb") ~= 0 then
					local var_336_18 = manager.audio:GetVoiceLength("story_v_out_120021", "120021080", "story_v_out_120021.awb") / 1000

					if var_336_18 + var_336_10 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_18 + var_336_10
					end

					if var_336_13.prefab_name ~= "" and arg_333_1.actors_[var_336_13.prefab_name] ~= nil then
						local var_336_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_13.prefab_name].transform, "story_v_out_120021", "120021080", "story_v_out_120021.awb")

						arg_333_1:RecordAudio("120021080", var_336_19)
						arg_333_1:RecordAudio("120021080", var_336_19)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_120021", "120021080", "story_v_out_120021.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_120021", "120021080", "story_v_out_120021.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_20 = math.max(var_336_11, arg_333_1.talkMaxDuration)

			if var_336_10 <= arg_333_1.time_ and arg_333_1.time_ < var_336_10 + var_336_20 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_10) / var_336_20

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_10 + var_336_20 and arg_333_1.time_ < var_336_10 + var_336_20 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play120021081 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 120021081
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play120021082(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["10037ui_story"]
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 and arg_337_1.var_.characterEffect10037ui_story == nil then
				arg_337_1.var_.characterEffect10037ui_story = var_340_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_340_2 = 0.2

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_2 then
				local var_340_3 = (arg_337_1.time_ - var_340_1) / var_340_2

				if arg_337_1.var_.characterEffect10037ui_story then
					local var_340_4 = Mathf.Lerp(0, 0.5, var_340_3)

					arg_337_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_337_1.var_.characterEffect10037ui_story.fillRatio = var_340_4
				end
			end

			if arg_337_1.time_ >= var_340_1 + var_340_2 and arg_337_1.time_ < var_340_1 + var_340_2 + arg_340_0 and arg_337_1.var_.characterEffect10037ui_story then
				local var_340_5 = 0.5

				arg_337_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_337_1.var_.characterEffect10037ui_story.fillRatio = var_340_5
			end

			local var_340_6 = 0
			local var_340_7 = 1.25

			if var_340_6 < arg_337_1.time_ and arg_337_1.time_ <= var_340_6 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_8 = arg_337_1:GetWordFromCfg(120021081)
				local var_340_9 = arg_337_1:FormatText(var_340_8.content)

				arg_337_1.text_.text = var_340_9

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_10 = 50
				local var_340_11 = utf8.len(var_340_9)
				local var_340_12 = var_340_10 <= 0 and var_340_7 or var_340_7 * (var_340_11 / var_340_10)

				if var_340_12 > 0 and var_340_7 < var_340_12 then
					arg_337_1.talkMaxDuration = var_340_12

					if var_340_12 + var_340_6 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_12 + var_340_6
					end
				end

				arg_337_1.text_.text = var_340_9
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_13 = math.max(var_340_7, arg_337_1.talkMaxDuration)

			if var_340_6 <= arg_337_1.time_ and arg_337_1.time_ < var_340_6 + var_340_13 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_6) / var_340_13

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_6 + var_340_13 and arg_337_1.time_ < var_340_6 + var_340_13 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play120021082 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 120021082
		arg_341_1.duration_ = 4.433

		local var_341_0 = {
			zh = 3.033,
			ja = 4.433
		}
		local var_341_1 = manager.audio:GetLocalizationFlag()

		if var_341_0[var_341_1] ~= nil then
			arg_341_1.duration_ = var_341_0[var_341_1]
		end

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play120021083(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["10037ui_story"]
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 and arg_341_1.var_.characterEffect10037ui_story == nil then
				arg_341_1.var_.characterEffect10037ui_story = var_344_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_2 = 0.2

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2

				if arg_341_1.var_.characterEffect10037ui_story then
					arg_341_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 and arg_341_1.var_.characterEffect10037ui_story then
				arg_341_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_344_4 = 0
			local var_344_5 = 0.35

			if var_344_4 < arg_341_1.time_ and arg_341_1.time_ <= var_344_4 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_6 = arg_341_1:FormatText(StoryNameCfg[383].name)

				arg_341_1.leftNameTxt_.text = var_344_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_7 = arg_341_1:GetWordFromCfg(120021082)
				local var_344_8 = arg_341_1:FormatText(var_344_7.content)

				arg_341_1.text_.text = var_344_8

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_9 = 14
				local var_344_10 = utf8.len(var_344_8)
				local var_344_11 = var_344_9 <= 0 and var_344_5 or var_344_5 * (var_344_10 / var_344_9)

				if var_344_11 > 0 and var_344_5 < var_344_11 then
					arg_341_1.talkMaxDuration = var_344_11

					if var_344_11 + var_344_4 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_11 + var_344_4
					end
				end

				arg_341_1.text_.text = var_344_8
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021082", "story_v_out_120021.awb") ~= 0 then
					local var_344_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021082", "story_v_out_120021.awb") / 1000

					if var_344_12 + var_344_4 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_12 + var_344_4
					end

					if var_344_7.prefab_name ~= "" and arg_341_1.actors_[var_344_7.prefab_name] ~= nil then
						local var_344_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_7.prefab_name].transform, "story_v_out_120021", "120021082", "story_v_out_120021.awb")

						arg_341_1:RecordAudio("120021082", var_344_13)
						arg_341_1:RecordAudio("120021082", var_344_13)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_120021", "120021082", "story_v_out_120021.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_120021", "120021082", "story_v_out_120021.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_14 = math.max(var_344_5, arg_341_1.talkMaxDuration)

			if var_344_4 <= arg_341_1.time_ and arg_341_1.time_ < var_344_4 + var_344_14 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_4) / var_344_14

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_4 + var_344_14 and arg_341_1.time_ < var_344_4 + var_344_14 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play120021083 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 120021083
		arg_345_1.duration_ = 4.366

		local var_345_0 = {
			zh = 1.999999999999,
			ja = 4.366
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
				arg_345_0:Play120021084(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["1072ui_story"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos1072ui_story = var_348_0.localPosition
			end

			local var_348_2 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_2 then
				local var_348_3 = (arg_345_1.time_ - var_348_1) / var_348_2
				local var_348_4 = Vector3.New(0, 100, 0)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1072ui_story, var_348_4, var_348_3)

				local var_348_5 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_5.x, var_348_5.y, var_348_5.z)

				local var_348_6 = var_348_0.localEulerAngles

				var_348_6.z = 0
				var_348_6.x = 0
				var_348_0.localEulerAngles = var_348_6
			end

			if arg_345_1.time_ >= var_348_1 + var_348_2 and arg_345_1.time_ < var_348_1 + var_348_2 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(0, 100, 0)

				local var_348_7 = manager.ui.mainCamera.transform.position - var_348_0.position

				var_348_0.forward = Vector3.New(var_348_7.x, var_348_7.y, var_348_7.z)

				local var_348_8 = var_348_0.localEulerAngles

				var_348_8.z = 0
				var_348_8.x = 0
				var_348_0.localEulerAngles = var_348_8
			end

			local var_348_9 = arg_345_1.actors_["1075ui_story"].transform
			local var_348_10 = 0

			if var_348_10 < arg_345_1.time_ and arg_345_1.time_ <= var_348_10 + arg_348_0 then
				arg_345_1.var_.moveOldPos1075ui_story = var_348_9.localPosition
			end

			local var_348_11 = 0.001

			if var_348_10 <= arg_345_1.time_ and arg_345_1.time_ < var_348_10 + var_348_11 then
				local var_348_12 = (arg_345_1.time_ - var_348_10) / var_348_11
				local var_348_13 = Vector3.New(-0.7, -1.055, -6.16)

				var_348_9.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos1075ui_story, var_348_13, var_348_12)

				local var_348_14 = manager.ui.mainCamera.transform.position - var_348_9.position

				var_348_9.forward = Vector3.New(var_348_14.x, var_348_14.y, var_348_14.z)

				local var_348_15 = var_348_9.localEulerAngles

				var_348_15.z = 0
				var_348_15.x = 0
				var_348_9.localEulerAngles = var_348_15
			end

			if arg_345_1.time_ >= var_348_10 + var_348_11 and arg_345_1.time_ < var_348_10 + var_348_11 + arg_348_0 then
				var_348_9.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_348_16 = manager.ui.mainCamera.transform.position - var_348_9.position

				var_348_9.forward = Vector3.New(var_348_16.x, var_348_16.y, var_348_16.z)

				local var_348_17 = var_348_9.localEulerAngles

				var_348_17.z = 0
				var_348_17.x = 0
				var_348_9.localEulerAngles = var_348_17
			end

			local var_348_18 = arg_345_1.actors_["1075ui_story"]
			local var_348_19 = 0

			if var_348_19 < arg_345_1.time_ and arg_345_1.time_ <= var_348_19 + arg_348_0 and arg_345_1.var_.characterEffect1075ui_story == nil then
				arg_345_1.var_.characterEffect1075ui_story = var_348_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_20 = 0.2

			if var_348_19 <= arg_345_1.time_ and arg_345_1.time_ < var_348_19 + var_348_20 then
				local var_348_21 = (arg_345_1.time_ - var_348_19) / var_348_20

				if arg_345_1.var_.characterEffect1075ui_story then
					arg_345_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_345_1.time_ >= var_348_19 + var_348_20 and arg_345_1.time_ < var_348_19 + var_348_20 + arg_348_0 and arg_345_1.var_.characterEffect1075ui_story then
				arg_345_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_348_22 = arg_345_1.actors_["10037ui_story"]
			local var_348_23 = 0

			if var_348_23 < arg_345_1.time_ and arg_345_1.time_ <= var_348_23 + arg_348_0 and arg_345_1.var_.characterEffect10037ui_story == nil then
				arg_345_1.var_.characterEffect10037ui_story = var_348_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_348_24 = 0.2

			if var_348_23 <= arg_345_1.time_ and arg_345_1.time_ < var_348_23 + var_348_24 then
				local var_348_25 = (arg_345_1.time_ - var_348_23) / var_348_24

				if arg_345_1.var_.characterEffect10037ui_story then
					local var_348_26 = Mathf.Lerp(0, 0.5, var_348_25)

					arg_345_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_345_1.var_.characterEffect10037ui_story.fillRatio = var_348_26
				end
			end

			if arg_345_1.time_ >= var_348_23 + var_348_24 and arg_345_1.time_ < var_348_23 + var_348_24 + arg_348_0 and arg_345_1.var_.characterEffect10037ui_story then
				local var_348_27 = 0.5

				arg_345_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_345_1.var_.characterEffect10037ui_story.fillRatio = var_348_27
			end

			local var_348_28 = 0

			if var_348_28 < arg_345_1.time_ and arg_345_1.time_ <= var_348_28 + arg_348_0 then
				arg_345_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_348_29 = 0

			if var_348_29 < arg_345_1.time_ and arg_345_1.time_ <= var_348_29 + arg_348_0 then
				arg_345_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_348_30 = 0
			local var_348_31 = 0.15

			if var_348_30 < arg_345_1.time_ and arg_345_1.time_ <= var_348_30 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_32 = arg_345_1:FormatText(StoryNameCfg[381].name)

				arg_345_1.leftNameTxt_.text = var_348_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_33 = arg_345_1:GetWordFromCfg(120021083)
				local var_348_34 = arg_345_1:FormatText(var_348_33.content)

				arg_345_1.text_.text = var_348_34

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_35 = 6
				local var_348_36 = utf8.len(var_348_34)
				local var_348_37 = var_348_35 <= 0 and var_348_31 or var_348_31 * (var_348_36 / var_348_35)

				if var_348_37 > 0 and var_348_31 < var_348_37 then
					arg_345_1.talkMaxDuration = var_348_37

					if var_348_37 + var_348_30 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_37 + var_348_30
					end
				end

				arg_345_1.text_.text = var_348_34
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021083", "story_v_out_120021.awb") ~= 0 then
					local var_348_38 = manager.audio:GetVoiceLength("story_v_out_120021", "120021083", "story_v_out_120021.awb") / 1000

					if var_348_38 + var_348_30 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_38 + var_348_30
					end

					if var_348_33.prefab_name ~= "" and arg_345_1.actors_[var_348_33.prefab_name] ~= nil then
						local var_348_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_33.prefab_name].transform, "story_v_out_120021", "120021083", "story_v_out_120021.awb")

						arg_345_1:RecordAudio("120021083", var_348_39)
						arg_345_1:RecordAudio("120021083", var_348_39)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_120021", "120021083", "story_v_out_120021.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_120021", "120021083", "story_v_out_120021.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_40 = math.max(var_348_31, arg_345_1.talkMaxDuration)

			if var_348_30 <= arg_345_1.time_ and arg_345_1.time_ < var_348_30 + var_348_40 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_30) / var_348_40

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_30 + var_348_40 and arg_345_1.time_ < var_348_30 + var_348_40 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play120021084 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 120021084
		arg_349_1.duration_ = 3.666

		local var_349_0 = {
			zh = 2.8,
			ja = 3.666
		}
		local var_349_1 = manager.audio:GetLocalizationFlag()

		if var_349_0[var_349_1] ~= nil then
			arg_349_1.duration_ = var_349_0[var_349_1]
		end

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play120021085(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1075ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect1075ui_story == nil then
				arg_349_1.var_.characterEffect1075ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.2

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1075ui_story then
					local var_352_4 = Mathf.Lerp(0, 0.5, var_352_3)

					arg_349_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_349_1.var_.characterEffect1075ui_story.fillRatio = var_352_4
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1075ui_story then
				local var_352_5 = 0.5

				arg_349_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_349_1.var_.characterEffect1075ui_story.fillRatio = var_352_5
			end

			local var_352_6 = arg_349_1.actors_["10037ui_story"]
			local var_352_7 = 0

			if var_352_7 < arg_349_1.time_ and arg_349_1.time_ <= var_352_7 + arg_352_0 and arg_349_1.var_.characterEffect10037ui_story == nil then
				arg_349_1.var_.characterEffect10037ui_story = var_352_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_8 = 0.2

			if var_352_7 <= arg_349_1.time_ and arg_349_1.time_ < var_352_7 + var_352_8 then
				local var_352_9 = (arg_349_1.time_ - var_352_7) / var_352_8

				if arg_349_1.var_.characterEffect10037ui_story then
					arg_349_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_349_1.time_ >= var_352_7 + var_352_8 and arg_349_1.time_ < var_352_7 + var_352_8 + arg_352_0 and arg_349_1.var_.characterEffect10037ui_story then
				arg_349_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_352_10 = 0
			local var_352_11 = 0.275

			if var_352_10 < arg_349_1.time_ and arg_349_1.time_ <= var_352_10 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_12 = arg_349_1:FormatText(StoryNameCfg[383].name)

				arg_349_1.leftNameTxt_.text = var_352_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_13 = arg_349_1:GetWordFromCfg(120021084)
				local var_352_14 = arg_349_1:FormatText(var_352_13.content)

				arg_349_1.text_.text = var_352_14

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_15 = 11
				local var_352_16 = utf8.len(var_352_14)
				local var_352_17 = var_352_15 <= 0 and var_352_11 or var_352_11 * (var_352_16 / var_352_15)

				if var_352_17 > 0 and var_352_11 < var_352_17 then
					arg_349_1.talkMaxDuration = var_352_17

					if var_352_17 + var_352_10 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_17 + var_352_10
					end
				end

				arg_349_1.text_.text = var_352_14
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021084", "story_v_out_120021.awb") ~= 0 then
					local var_352_18 = manager.audio:GetVoiceLength("story_v_out_120021", "120021084", "story_v_out_120021.awb") / 1000

					if var_352_18 + var_352_10 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_18 + var_352_10
					end

					if var_352_13.prefab_name ~= "" and arg_349_1.actors_[var_352_13.prefab_name] ~= nil then
						local var_352_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_13.prefab_name].transform, "story_v_out_120021", "120021084", "story_v_out_120021.awb")

						arg_349_1:RecordAudio("120021084", var_352_19)
						arg_349_1:RecordAudio("120021084", var_352_19)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_120021", "120021084", "story_v_out_120021.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_120021", "120021084", "story_v_out_120021.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_20 = math.max(var_352_11, arg_349_1.talkMaxDuration)

			if var_352_10 <= arg_349_1.time_ and arg_349_1.time_ < var_352_10 + var_352_20 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_10) / var_352_20

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_10 + var_352_20 and arg_349_1.time_ < var_352_10 + var_352_20 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play120021085 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 120021085
		arg_353_1.duration_ = 6.9

		local var_353_0 = {
			zh = 4.433,
			ja = 6.9
		}
		local var_353_1 = manager.audio:GetLocalizationFlag()

		if var_353_0[var_353_1] ~= nil then
			arg_353_1.duration_ = var_353_0[var_353_1]
		end

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play120021086(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["1075ui_story"]
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 and arg_353_1.var_.characterEffect1075ui_story == nil then
				arg_353_1.var_.characterEffect1075ui_story = var_356_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_2 = 0.2

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_2 then
				local var_356_3 = (arg_353_1.time_ - var_356_1) / var_356_2

				if arg_353_1.var_.characterEffect1075ui_story then
					arg_353_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_353_1.time_ >= var_356_1 + var_356_2 and arg_353_1.time_ < var_356_1 + var_356_2 + arg_356_0 and arg_353_1.var_.characterEffect1075ui_story then
				arg_353_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_356_4 = arg_353_1.actors_["10037ui_story"]
			local var_356_5 = 0

			if var_356_5 < arg_353_1.time_ and arg_353_1.time_ <= var_356_5 + arg_356_0 and arg_353_1.var_.characterEffect10037ui_story == nil then
				arg_353_1.var_.characterEffect10037ui_story = var_356_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_356_6 = 0.2

			if var_356_5 <= arg_353_1.time_ and arg_353_1.time_ < var_356_5 + var_356_6 then
				local var_356_7 = (arg_353_1.time_ - var_356_5) / var_356_6

				if arg_353_1.var_.characterEffect10037ui_story then
					local var_356_8 = Mathf.Lerp(0, 0.5, var_356_7)

					arg_353_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_353_1.var_.characterEffect10037ui_story.fillRatio = var_356_8
				end
			end

			if arg_353_1.time_ >= var_356_5 + var_356_6 and arg_353_1.time_ < var_356_5 + var_356_6 + arg_356_0 and arg_353_1.var_.characterEffect10037ui_story then
				local var_356_9 = 0.5

				arg_353_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_353_1.var_.characterEffect10037ui_story.fillRatio = var_356_9
			end

			local var_356_10 = 0
			local var_356_11 = 0.475

			if var_356_10 < arg_353_1.time_ and arg_353_1.time_ <= var_356_10 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_12 = arg_353_1:FormatText(StoryNameCfg[381].name)

				arg_353_1.leftNameTxt_.text = var_356_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_13 = arg_353_1:GetWordFromCfg(120021085)
				local var_356_14 = arg_353_1:FormatText(var_356_13.content)

				arg_353_1.text_.text = var_356_14

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_15 = 19
				local var_356_16 = utf8.len(var_356_14)
				local var_356_17 = var_356_15 <= 0 and var_356_11 or var_356_11 * (var_356_16 / var_356_15)

				if var_356_17 > 0 and var_356_11 < var_356_17 then
					arg_353_1.talkMaxDuration = var_356_17

					if var_356_17 + var_356_10 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_17 + var_356_10
					end
				end

				arg_353_1.text_.text = var_356_14
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021085", "story_v_out_120021.awb") ~= 0 then
					local var_356_18 = manager.audio:GetVoiceLength("story_v_out_120021", "120021085", "story_v_out_120021.awb") / 1000

					if var_356_18 + var_356_10 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_18 + var_356_10
					end

					if var_356_13.prefab_name ~= "" and arg_353_1.actors_[var_356_13.prefab_name] ~= nil then
						local var_356_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_13.prefab_name].transform, "story_v_out_120021", "120021085", "story_v_out_120021.awb")

						arg_353_1:RecordAudio("120021085", var_356_19)
						arg_353_1:RecordAudio("120021085", var_356_19)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_120021", "120021085", "story_v_out_120021.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_120021", "120021085", "story_v_out_120021.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_20 = math.max(var_356_11, arg_353_1.talkMaxDuration)

			if var_356_10 <= arg_353_1.time_ and arg_353_1.time_ < var_356_10 + var_356_20 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_10) / var_356_20

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_10 + var_356_20 and arg_353_1.time_ < var_356_10 + var_356_20 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play120021086 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 120021086
		arg_357_1.duration_ = 3.966

		local var_357_0 = {
			zh = 3.333,
			ja = 3.966
		}
		local var_357_1 = manager.audio:GetLocalizationFlag()

		if var_357_0[var_357_1] ~= nil then
			arg_357_1.duration_ = var_357_0[var_357_1]
		end

		SetActive(arg_357_1.tipsGo_, false)

		function arg_357_1.onSingleLineFinish_()
			arg_357_1.onSingleLineUpdate_ = nil
			arg_357_1.onSingleLineFinish_ = nil
			arg_357_1.state_ = "waiting"
		end

		function arg_357_1.playNext_(arg_359_0)
			if arg_359_0 == 1 then
				arg_357_0:Play120021087(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["1075ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect1075ui_story == nil then
				arg_357_1.var_.characterEffect1075ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.2

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect1075ui_story then
					local var_360_4 = Mathf.Lerp(0, 0.5, var_360_3)

					arg_357_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_357_1.var_.characterEffect1075ui_story.fillRatio = var_360_4
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect1075ui_story then
				local var_360_5 = 0.5

				arg_357_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_357_1.var_.characterEffect1075ui_story.fillRatio = var_360_5
			end

			local var_360_6 = arg_357_1.actors_["10037ui_story"]
			local var_360_7 = 0

			if var_360_7 < arg_357_1.time_ and arg_357_1.time_ <= var_360_7 + arg_360_0 and arg_357_1.var_.characterEffect10037ui_story == nil then
				arg_357_1.var_.characterEffect10037ui_story = var_360_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_8 = 0.2

			if var_360_7 <= arg_357_1.time_ and arg_357_1.time_ < var_360_7 + var_360_8 then
				local var_360_9 = (arg_357_1.time_ - var_360_7) / var_360_8

				if arg_357_1.var_.characterEffect10037ui_story then
					arg_357_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_7 + var_360_8 and arg_357_1.time_ < var_360_7 + var_360_8 + arg_360_0 and arg_357_1.var_.characterEffect10037ui_story then
				arg_357_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_360_10 = 0
			local var_360_11 = 0.225

			if var_360_10 < arg_357_1.time_ and arg_357_1.time_ <= var_360_10 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_12 = arg_357_1:FormatText(StoryNameCfg[383].name)

				arg_357_1.leftNameTxt_.text = var_360_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_13 = arg_357_1:GetWordFromCfg(120021086)
				local var_360_14 = arg_357_1:FormatText(var_360_13.content)

				arg_357_1.text_.text = var_360_14

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_15 = 10
				local var_360_16 = utf8.len(var_360_14)
				local var_360_17 = var_360_15 <= 0 and var_360_11 or var_360_11 * (var_360_16 / var_360_15)

				if var_360_17 > 0 and var_360_11 < var_360_17 then
					arg_357_1.talkMaxDuration = var_360_17

					if var_360_17 + var_360_10 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_17 + var_360_10
					end
				end

				arg_357_1.text_.text = var_360_14
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021086", "story_v_out_120021.awb") ~= 0 then
					local var_360_18 = manager.audio:GetVoiceLength("story_v_out_120021", "120021086", "story_v_out_120021.awb") / 1000

					if var_360_18 + var_360_10 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_18 + var_360_10
					end

					if var_360_13.prefab_name ~= "" and arg_357_1.actors_[var_360_13.prefab_name] ~= nil then
						local var_360_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_13.prefab_name].transform, "story_v_out_120021", "120021086", "story_v_out_120021.awb")

						arg_357_1:RecordAudio("120021086", var_360_19)
						arg_357_1:RecordAudio("120021086", var_360_19)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_120021", "120021086", "story_v_out_120021.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_120021", "120021086", "story_v_out_120021.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_20 = math.max(var_360_11, arg_357_1.talkMaxDuration)

			if var_360_10 <= arg_357_1.time_ and arg_357_1.time_ < var_360_10 + var_360_20 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_10) / var_360_20

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_10 + var_360_20 and arg_357_1.time_ < var_360_10 + var_360_20 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play120021087 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 120021087
		arg_361_1.duration_ = 7.766

		local var_361_0 = {
			zh = 5.4,
			ja = 7.766
		}
		local var_361_1 = manager.audio:GetLocalizationFlag()

		if var_361_0[var_361_1] ~= nil then
			arg_361_1.duration_ = var_361_0[var_361_1]
		end

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play120021088(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1075ui_story"].transform
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1.var_.moveOldPos1075ui_story = var_364_0.localPosition
			end

			local var_364_2 = 0.001

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2
				local var_364_4 = Vector3.New(0, 100, 0)

				var_364_0.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos1075ui_story, var_364_4, var_364_3)

				local var_364_5 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_5.x, var_364_5.y, var_364_5.z)

				local var_364_6 = var_364_0.localEulerAngles

				var_364_6.z = 0
				var_364_6.x = 0
				var_364_0.localEulerAngles = var_364_6
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 then
				var_364_0.localPosition = Vector3.New(0, 100, 0)

				local var_364_7 = manager.ui.mainCamera.transform.position - var_364_0.position

				var_364_0.forward = Vector3.New(var_364_7.x, var_364_7.y, var_364_7.z)

				local var_364_8 = var_364_0.localEulerAngles

				var_364_8.z = 0
				var_364_8.x = 0
				var_364_0.localEulerAngles = var_364_8
			end

			local var_364_9 = arg_361_1.actors_["1072ui_story"].transform
			local var_364_10 = 0

			if var_364_10 < arg_361_1.time_ and arg_361_1.time_ <= var_364_10 + arg_364_0 then
				arg_361_1.var_.moveOldPos1072ui_story = var_364_9.localPosition
			end

			local var_364_11 = 0.001

			if var_364_10 <= arg_361_1.time_ and arg_361_1.time_ < var_364_10 + var_364_11 then
				local var_364_12 = (arg_361_1.time_ - var_364_10) / var_364_11
				local var_364_13 = Vector3.New(-0.7, -0.71, -6)

				var_364_9.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos1072ui_story, var_364_13, var_364_12)

				local var_364_14 = manager.ui.mainCamera.transform.position - var_364_9.position

				var_364_9.forward = Vector3.New(var_364_14.x, var_364_14.y, var_364_14.z)

				local var_364_15 = var_364_9.localEulerAngles

				var_364_15.z = 0
				var_364_15.x = 0
				var_364_9.localEulerAngles = var_364_15
			end

			if arg_361_1.time_ >= var_364_10 + var_364_11 and arg_361_1.time_ < var_364_10 + var_364_11 + arg_364_0 then
				var_364_9.localPosition = Vector3.New(-0.7, -0.71, -6)

				local var_364_16 = manager.ui.mainCamera.transform.position - var_364_9.position

				var_364_9.forward = Vector3.New(var_364_16.x, var_364_16.y, var_364_16.z)

				local var_364_17 = var_364_9.localEulerAngles

				var_364_17.z = 0
				var_364_17.x = 0
				var_364_9.localEulerAngles = var_364_17
			end

			local var_364_18 = arg_361_1.actors_["1072ui_story"]
			local var_364_19 = 0

			if var_364_19 < arg_361_1.time_ and arg_361_1.time_ <= var_364_19 + arg_364_0 and arg_361_1.var_.characterEffect1072ui_story == nil then
				arg_361_1.var_.characterEffect1072ui_story = var_364_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_20 = 0.2

			if var_364_19 <= arg_361_1.time_ and arg_361_1.time_ < var_364_19 + var_364_20 then
				local var_364_21 = (arg_361_1.time_ - var_364_19) / var_364_20

				if arg_361_1.var_.characterEffect1072ui_story then
					arg_361_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_361_1.time_ >= var_364_19 + var_364_20 and arg_361_1.time_ < var_364_19 + var_364_20 + arg_364_0 and arg_361_1.var_.characterEffect1072ui_story then
				arg_361_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_364_22 = arg_361_1.actors_["10037ui_story"]
			local var_364_23 = 0

			if var_364_23 < arg_361_1.time_ and arg_361_1.time_ <= var_364_23 + arg_364_0 and arg_361_1.var_.characterEffect10037ui_story == nil then
				arg_361_1.var_.characterEffect10037ui_story = var_364_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_24 = 0.2

			if var_364_23 <= arg_361_1.time_ and arg_361_1.time_ < var_364_23 + var_364_24 then
				local var_364_25 = (arg_361_1.time_ - var_364_23) / var_364_24

				if arg_361_1.var_.characterEffect10037ui_story then
					local var_364_26 = Mathf.Lerp(0, 0.5, var_364_25)

					arg_361_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_361_1.var_.characterEffect10037ui_story.fillRatio = var_364_26
				end
			end

			if arg_361_1.time_ >= var_364_23 + var_364_24 and arg_361_1.time_ < var_364_23 + var_364_24 + arg_364_0 and arg_361_1.var_.characterEffect10037ui_story then
				local var_364_27 = 0.5

				arg_361_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_361_1.var_.characterEffect10037ui_story.fillRatio = var_364_27
			end

			local var_364_28 = 0

			if var_364_28 < arg_361_1.time_ and arg_361_1.time_ <= var_364_28 + arg_364_0 then
				arg_361_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_364_29 = 0
			local var_364_30 = 0.8

			if var_364_29 < arg_361_1.time_ and arg_361_1.time_ <= var_364_29 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_31 = arg_361_1:FormatText(StoryNameCfg[379].name)

				arg_361_1.leftNameTxt_.text = var_364_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_32 = arg_361_1:GetWordFromCfg(120021087)
				local var_364_33 = arg_361_1:FormatText(var_364_32.content)

				arg_361_1.text_.text = var_364_33

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_34 = 32
				local var_364_35 = utf8.len(var_364_33)
				local var_364_36 = var_364_34 <= 0 and var_364_30 or var_364_30 * (var_364_35 / var_364_34)

				if var_364_36 > 0 and var_364_30 < var_364_36 then
					arg_361_1.talkMaxDuration = var_364_36

					if var_364_36 + var_364_29 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_36 + var_364_29
					end
				end

				arg_361_1.text_.text = var_364_33
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021087", "story_v_out_120021.awb") ~= 0 then
					local var_364_37 = manager.audio:GetVoiceLength("story_v_out_120021", "120021087", "story_v_out_120021.awb") / 1000

					if var_364_37 + var_364_29 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_37 + var_364_29
					end

					if var_364_32.prefab_name ~= "" and arg_361_1.actors_[var_364_32.prefab_name] ~= nil then
						local var_364_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_32.prefab_name].transform, "story_v_out_120021", "120021087", "story_v_out_120021.awb")

						arg_361_1:RecordAudio("120021087", var_364_38)
						arg_361_1:RecordAudio("120021087", var_364_38)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_120021", "120021087", "story_v_out_120021.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_120021", "120021087", "story_v_out_120021.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_39 = math.max(var_364_30, arg_361_1.talkMaxDuration)

			if var_364_29 <= arg_361_1.time_ and arg_361_1.time_ < var_364_29 + var_364_39 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_29) / var_364_39

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_29 + var_364_39 and arg_361_1.time_ < var_364_29 + var_364_39 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play120021088 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 120021088
		arg_365_1.duration_ = 7.533

		local var_365_0 = {
			zh = 5.2,
			ja = 7.533
		}
		local var_365_1 = manager.audio:GetLocalizationFlag()

		if var_365_0[var_365_1] ~= nil then
			arg_365_1.duration_ = var_365_0[var_365_1]
		end

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play120021089(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["10037ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect10037ui_story == nil then
				arg_365_1.var_.characterEffect10037ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.2

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect10037ui_story then
					arg_365_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect10037ui_story then
				arg_365_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_368_4 = arg_365_1.actors_["1072ui_story"]
			local var_368_5 = 0

			if var_368_5 < arg_365_1.time_ and arg_365_1.time_ <= var_368_5 + arg_368_0 and arg_365_1.var_.characterEffect1072ui_story == nil then
				arg_365_1.var_.characterEffect1072ui_story = var_368_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_6 = 0.2

			if var_368_5 <= arg_365_1.time_ and arg_365_1.time_ < var_368_5 + var_368_6 then
				local var_368_7 = (arg_365_1.time_ - var_368_5) / var_368_6

				if arg_365_1.var_.characterEffect1072ui_story then
					local var_368_8 = Mathf.Lerp(0, 0.5, var_368_7)

					arg_365_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_365_1.var_.characterEffect1072ui_story.fillRatio = var_368_8
				end
			end

			if arg_365_1.time_ >= var_368_5 + var_368_6 and arg_365_1.time_ < var_368_5 + var_368_6 + arg_368_0 and arg_365_1.var_.characterEffect1072ui_story then
				local var_368_9 = 0.5

				arg_365_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_365_1.var_.characterEffect1072ui_story.fillRatio = var_368_9
			end

			local var_368_10 = 0
			local var_368_11 = 0.65

			if var_368_10 < arg_365_1.time_ and arg_365_1.time_ <= var_368_10 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_12 = arg_365_1:FormatText(StoryNameCfg[383].name)

				arg_365_1.leftNameTxt_.text = var_368_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_13 = arg_365_1:GetWordFromCfg(120021088)
				local var_368_14 = arg_365_1:FormatText(var_368_13.content)

				arg_365_1.text_.text = var_368_14

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_15 = 26
				local var_368_16 = utf8.len(var_368_14)
				local var_368_17 = var_368_15 <= 0 and var_368_11 or var_368_11 * (var_368_16 / var_368_15)

				if var_368_17 > 0 and var_368_11 < var_368_17 then
					arg_365_1.talkMaxDuration = var_368_17

					if var_368_17 + var_368_10 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_17 + var_368_10
					end
				end

				arg_365_1.text_.text = var_368_14
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021088", "story_v_out_120021.awb") ~= 0 then
					local var_368_18 = manager.audio:GetVoiceLength("story_v_out_120021", "120021088", "story_v_out_120021.awb") / 1000

					if var_368_18 + var_368_10 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_18 + var_368_10
					end

					if var_368_13.prefab_name ~= "" and arg_365_1.actors_[var_368_13.prefab_name] ~= nil then
						local var_368_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_13.prefab_name].transform, "story_v_out_120021", "120021088", "story_v_out_120021.awb")

						arg_365_1:RecordAudio("120021088", var_368_19)
						arg_365_1:RecordAudio("120021088", var_368_19)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_120021", "120021088", "story_v_out_120021.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_120021", "120021088", "story_v_out_120021.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_20 = math.max(var_368_11, arg_365_1.talkMaxDuration)

			if var_368_10 <= arg_365_1.time_ and arg_365_1.time_ < var_368_10 + var_368_20 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_10) / var_368_20

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_10 + var_368_20 and arg_365_1.time_ < var_368_10 + var_368_20 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play120021089 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 120021089
		arg_369_1.duration_ = 20.133

		local var_369_0 = {
			zh = 6.3,
			ja = 20.133
		}
		local var_369_1 = manager.audio:GetLocalizationFlag()

		if var_369_0[var_369_1] ~= nil then
			arg_369_1.duration_ = var_369_0[var_369_1]
		end

		SetActive(arg_369_1.tipsGo_, false)

		function arg_369_1.onSingleLineFinish_()
			arg_369_1.onSingleLineUpdate_ = nil
			arg_369_1.onSingleLineFinish_ = nil
			arg_369_1.state_ = "waiting"
		end

		function arg_369_1.playNext_(arg_371_0)
			if arg_371_0 == 1 then
				arg_369_0:Play120021090(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 0.75

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[383].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(120021089)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 30
				local var_372_6 = utf8.len(var_372_4)
				local var_372_7 = var_372_5 <= 0 and var_372_1 or var_372_1 * (var_372_6 / var_372_5)

				if var_372_7 > 0 and var_372_1 < var_372_7 then
					arg_369_1.talkMaxDuration = var_372_7

					if var_372_7 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_7 + var_372_0
					end
				end

				arg_369_1.text_.text = var_372_4
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021089", "story_v_out_120021.awb") ~= 0 then
					local var_372_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021089", "story_v_out_120021.awb") / 1000

					if var_372_8 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_0
					end

					if var_372_3.prefab_name ~= "" and arg_369_1.actors_[var_372_3.prefab_name] ~= nil then
						local var_372_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_3.prefab_name].transform, "story_v_out_120021", "120021089", "story_v_out_120021.awb")

						arg_369_1:RecordAudio("120021089", var_372_9)
						arg_369_1:RecordAudio("120021089", var_372_9)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_120021", "120021089", "story_v_out_120021.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_120021", "120021089", "story_v_out_120021.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_10 = math.max(var_372_1, arg_369_1.talkMaxDuration)

			if var_372_0 <= arg_369_1.time_ and arg_369_1.time_ < var_372_0 + var_372_10 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_0) / var_372_10

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_0 + var_372_10 and arg_369_1.time_ < var_372_0 + var_372_10 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play120021090 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 120021090
		arg_373_1.duration_ = 4.9

		local var_373_0 = {
			zh = 2.033,
			ja = 4.9
		}
		local var_373_1 = manager.audio:GetLocalizationFlag()

		if var_373_0[var_373_1] ~= nil then
			arg_373_1.duration_ = var_373_0[var_373_1]
		end

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play120021091(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["10037ui_story"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.characterEffect10037ui_story == nil then
				arg_373_1.var_.characterEffect10037ui_story = var_376_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_2 = 0.2

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.characterEffect10037ui_story then
					local var_376_4 = Mathf.Lerp(0, 0.5, var_376_3)

					arg_373_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_373_1.var_.characterEffect10037ui_story.fillRatio = var_376_4
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.characterEffect10037ui_story then
				local var_376_5 = 0.5

				arg_373_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_373_1.var_.characterEffect10037ui_story.fillRatio = var_376_5
			end

			local var_376_6 = arg_373_1.actors_["1072ui_story"]
			local var_376_7 = 0

			if var_376_7 < arg_373_1.time_ and arg_373_1.time_ <= var_376_7 + arg_376_0 and arg_373_1.var_.characterEffect1072ui_story == nil then
				arg_373_1.var_.characterEffect1072ui_story = var_376_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_8 = 0.2

			if var_376_7 <= arg_373_1.time_ and arg_373_1.time_ < var_376_7 + var_376_8 then
				local var_376_9 = (arg_373_1.time_ - var_376_7) / var_376_8

				if arg_373_1.var_.characterEffect1072ui_story then
					arg_373_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_7 + var_376_8 and arg_373_1.time_ < var_376_7 + var_376_8 + arg_376_0 and arg_373_1.var_.characterEffect1072ui_story then
				arg_373_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_376_10 = 0
			local var_376_11 = 0.25

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_12 = arg_373_1:FormatText(StoryNameCfg[379].name)

				arg_373_1.leftNameTxt_.text = var_376_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_13 = arg_373_1:GetWordFromCfg(120021090)
				local var_376_14 = arg_373_1:FormatText(var_376_13.content)

				arg_373_1.text_.text = var_376_14

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_15 = 10
				local var_376_16 = utf8.len(var_376_14)
				local var_376_17 = var_376_15 <= 0 and var_376_11 or var_376_11 * (var_376_16 / var_376_15)

				if var_376_17 > 0 and var_376_11 < var_376_17 then
					arg_373_1.talkMaxDuration = var_376_17

					if var_376_17 + var_376_10 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_17 + var_376_10
					end
				end

				arg_373_1.text_.text = var_376_14
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021090", "story_v_out_120021.awb") ~= 0 then
					local var_376_18 = manager.audio:GetVoiceLength("story_v_out_120021", "120021090", "story_v_out_120021.awb") / 1000

					if var_376_18 + var_376_10 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_18 + var_376_10
					end

					if var_376_13.prefab_name ~= "" and arg_373_1.actors_[var_376_13.prefab_name] ~= nil then
						local var_376_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_13.prefab_name].transform, "story_v_out_120021", "120021090", "story_v_out_120021.awb")

						arg_373_1:RecordAudio("120021090", var_376_19)
						arg_373_1:RecordAudio("120021090", var_376_19)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_120021", "120021090", "story_v_out_120021.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_120021", "120021090", "story_v_out_120021.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_20 = math.max(var_376_11, arg_373_1.talkMaxDuration)

			if var_376_10 <= arg_373_1.time_ and arg_373_1.time_ < var_376_10 + var_376_20 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_10) / var_376_20

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_10 + var_376_20 and arg_373_1.time_ < var_376_10 + var_376_20 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play120021091 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 120021091
		arg_377_1.duration_ = 17.866

		local var_377_0 = {
			zh = 9.4,
			ja = 17.866
		}
		local var_377_1 = manager.audio:GetLocalizationFlag()

		if var_377_0[var_377_1] ~= nil then
			arg_377_1.duration_ = var_377_0[var_377_1]
		end

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play120021092(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["10037ui_story"]
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 and arg_377_1.var_.characterEffect10037ui_story == nil then
				arg_377_1.var_.characterEffect10037ui_story = var_380_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_2 = 0.2

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2

				if arg_377_1.var_.characterEffect10037ui_story then
					arg_377_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 and arg_377_1.var_.characterEffect10037ui_story then
				arg_377_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_380_4 = arg_377_1.actors_["1072ui_story"]
			local var_380_5 = 0

			if var_380_5 < arg_377_1.time_ and arg_377_1.time_ <= var_380_5 + arg_380_0 and arg_377_1.var_.characterEffect1072ui_story == nil then
				arg_377_1.var_.characterEffect1072ui_story = var_380_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_380_6 = 0.2

			if var_380_5 <= arg_377_1.time_ and arg_377_1.time_ < var_380_5 + var_380_6 then
				local var_380_7 = (arg_377_1.time_ - var_380_5) / var_380_6

				if arg_377_1.var_.characterEffect1072ui_story then
					local var_380_8 = Mathf.Lerp(0, 0.5, var_380_7)

					arg_377_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_377_1.var_.characterEffect1072ui_story.fillRatio = var_380_8
				end
			end

			if arg_377_1.time_ >= var_380_5 + var_380_6 and arg_377_1.time_ < var_380_5 + var_380_6 + arg_380_0 and arg_377_1.var_.characterEffect1072ui_story then
				local var_380_9 = 0.5

				arg_377_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_377_1.var_.characterEffect1072ui_story.fillRatio = var_380_9
			end

			local var_380_10 = 0

			if var_380_10 < arg_377_1.time_ and arg_377_1.time_ <= var_380_10 + arg_380_0 then
				arg_377_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_380_11 = 0

			if var_380_11 < arg_377_1.time_ and arg_377_1.time_ <= var_380_11 + arg_380_0 then
				arg_377_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037action/10037action4_1")
			end

			local var_380_12 = 0
			local var_380_13 = 1

			if var_380_12 < arg_377_1.time_ and arg_377_1.time_ <= var_380_12 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_14 = arg_377_1:FormatText(StoryNameCfg[383].name)

				arg_377_1.leftNameTxt_.text = var_380_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_15 = arg_377_1:GetWordFromCfg(120021091)
				local var_380_16 = arg_377_1:FormatText(var_380_15.content)

				arg_377_1.text_.text = var_380_16

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_17 = 40
				local var_380_18 = utf8.len(var_380_16)
				local var_380_19 = var_380_17 <= 0 and var_380_13 or var_380_13 * (var_380_18 / var_380_17)

				if var_380_19 > 0 and var_380_13 < var_380_19 then
					arg_377_1.talkMaxDuration = var_380_19

					if var_380_19 + var_380_12 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_19 + var_380_12
					end
				end

				arg_377_1.text_.text = var_380_16
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021091", "story_v_out_120021.awb") ~= 0 then
					local var_380_20 = manager.audio:GetVoiceLength("story_v_out_120021", "120021091", "story_v_out_120021.awb") / 1000

					if var_380_20 + var_380_12 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_20 + var_380_12
					end

					if var_380_15.prefab_name ~= "" and arg_377_1.actors_[var_380_15.prefab_name] ~= nil then
						local var_380_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_15.prefab_name].transform, "story_v_out_120021", "120021091", "story_v_out_120021.awb")

						arg_377_1:RecordAudio("120021091", var_380_21)
						arg_377_1:RecordAudio("120021091", var_380_21)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_120021", "120021091", "story_v_out_120021.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_120021", "120021091", "story_v_out_120021.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_22 = math.max(var_380_13, arg_377_1.talkMaxDuration)

			if var_380_12 <= arg_377_1.time_ and arg_377_1.time_ < var_380_12 + var_380_22 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_12) / var_380_22

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_12 + var_380_22 and arg_377_1.time_ < var_380_12 + var_380_22 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play120021092 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 120021092
		arg_381_1.duration_ = 12.433

		local var_381_0 = {
			zh = 6,
			ja = 12.433
		}
		local var_381_1 = manager.audio:GetLocalizationFlag()

		if var_381_0[var_381_1] ~= nil then
			arg_381_1.duration_ = var_381_0[var_381_1]
		end

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play120021093(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.8

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_2 = arg_381_1:FormatText(StoryNameCfg[383].name)

				arg_381_1.leftNameTxt_.text = var_384_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_3 = arg_381_1:GetWordFromCfg(120021092)
				local var_384_4 = arg_381_1:FormatText(var_384_3.content)

				arg_381_1.text_.text = var_384_4

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_5 = 32
				local var_384_6 = utf8.len(var_384_4)
				local var_384_7 = var_384_5 <= 0 and var_384_1 or var_384_1 * (var_384_6 / var_384_5)

				if var_384_7 > 0 and var_384_1 < var_384_7 then
					arg_381_1.talkMaxDuration = var_384_7

					if var_384_7 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_7 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_4
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021092", "story_v_out_120021.awb") ~= 0 then
					local var_384_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021092", "story_v_out_120021.awb") / 1000

					if var_384_8 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_8 + var_384_0
					end

					if var_384_3.prefab_name ~= "" and arg_381_1.actors_[var_384_3.prefab_name] ~= nil then
						local var_384_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_3.prefab_name].transform, "story_v_out_120021", "120021092", "story_v_out_120021.awb")

						arg_381_1:RecordAudio("120021092", var_384_9)
						arg_381_1:RecordAudio("120021092", var_384_9)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_120021", "120021092", "story_v_out_120021.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_120021", "120021092", "story_v_out_120021.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_10 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_10 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_10

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_10 and arg_381_1.time_ < var_384_0 + var_384_10 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play120021093 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 120021093
		arg_385_1.duration_ = 16.166

		local var_385_0 = {
			zh = 11.166,
			ja = 16.166
		}
		local var_385_1 = manager.audio:GetLocalizationFlag()

		if var_385_0[var_385_1] ~= nil then
			arg_385_1.duration_ = var_385_0[var_385_1]
		end

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play120021094(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 1.35

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_2 = arg_385_1:FormatText(StoryNameCfg[383].name)

				arg_385_1.leftNameTxt_.text = var_388_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_3 = arg_385_1:GetWordFromCfg(120021093)
				local var_388_4 = arg_385_1:FormatText(var_388_3.content)

				arg_385_1.text_.text = var_388_4

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_5 = 54
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

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021093", "story_v_out_120021.awb") ~= 0 then
					local var_388_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021093", "story_v_out_120021.awb") / 1000

					if var_388_8 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_8 + var_388_0
					end

					if var_388_3.prefab_name ~= "" and arg_385_1.actors_[var_388_3.prefab_name] ~= nil then
						local var_388_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_3.prefab_name].transform, "story_v_out_120021", "120021093", "story_v_out_120021.awb")

						arg_385_1:RecordAudio("120021093", var_388_9)
						arg_385_1:RecordAudio("120021093", var_388_9)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_120021", "120021093", "story_v_out_120021.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_120021", "120021093", "story_v_out_120021.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_10 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_10 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_10

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_10 and arg_385_1.time_ < var_388_0 + var_388_10 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play120021094 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 120021094
		arg_389_1.duration_ = 13.233

		local var_389_0 = {
			zh = 10.9,
			ja = 13.233
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
				arg_389_0:Play120021095(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_392_1 = 0
			local var_392_2 = 1.4

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_3 = arg_389_1:FormatText(StoryNameCfg[383].name)

				arg_389_1.leftNameTxt_.text = var_392_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_4 = arg_389_1:GetWordFromCfg(120021094)
				local var_392_5 = arg_389_1:FormatText(var_392_4.content)

				arg_389_1.text_.text = var_392_5

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_6 = 56
				local var_392_7 = utf8.len(var_392_5)
				local var_392_8 = var_392_6 <= 0 and var_392_2 or var_392_2 * (var_392_7 / var_392_6)

				if var_392_8 > 0 and var_392_2 < var_392_8 then
					arg_389_1.talkMaxDuration = var_392_8

					if var_392_8 + var_392_1 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_8 + var_392_1
					end
				end

				arg_389_1.text_.text = var_392_5
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021094", "story_v_out_120021.awb") ~= 0 then
					local var_392_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021094", "story_v_out_120021.awb") / 1000

					if var_392_9 + var_392_1 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_9 + var_392_1
					end

					if var_392_4.prefab_name ~= "" and arg_389_1.actors_[var_392_4.prefab_name] ~= nil then
						local var_392_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_4.prefab_name].transform, "story_v_out_120021", "120021094", "story_v_out_120021.awb")

						arg_389_1:RecordAudio("120021094", var_392_10)
						arg_389_1:RecordAudio("120021094", var_392_10)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_120021", "120021094", "story_v_out_120021.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_120021", "120021094", "story_v_out_120021.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_11 = math.max(var_392_2, arg_389_1.talkMaxDuration)

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_11 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_1) / var_392_11

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_1 + var_392_11 and arg_389_1.time_ < var_392_1 + var_392_11 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play120021095 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 120021095
		arg_393_1.duration_ = 9.2

		local var_393_0 = {
			zh = 3.966,
			ja = 9.2
		}
		local var_393_1 = manager.audio:GetLocalizationFlag()

		if var_393_0[var_393_1] ~= nil then
			arg_393_1.duration_ = var_393_0[var_393_1]
		end

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play120021096(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/story10037/story10037actionlink/10037action443")
			end

			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 then
				arg_393_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2203cva")
			end

			local var_396_2 = 0
			local var_396_3 = 0.4

			if var_396_2 < arg_393_1.time_ and arg_393_1.time_ <= var_396_2 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_4 = arg_393_1:FormatText(StoryNameCfg[383].name)

				arg_393_1.leftNameTxt_.text = var_396_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_5 = arg_393_1:GetWordFromCfg(120021095)
				local var_396_6 = arg_393_1:FormatText(var_396_5.content)

				arg_393_1.text_.text = var_396_6

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_7 = 16
				local var_396_8 = utf8.len(var_396_6)
				local var_396_9 = var_396_7 <= 0 and var_396_3 or var_396_3 * (var_396_8 / var_396_7)

				if var_396_9 > 0 and var_396_3 < var_396_9 then
					arg_393_1.talkMaxDuration = var_396_9

					if var_396_9 + var_396_2 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_9 + var_396_2
					end
				end

				arg_393_1.text_.text = var_396_6
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021095", "story_v_out_120021.awb") ~= 0 then
					local var_396_10 = manager.audio:GetVoiceLength("story_v_out_120021", "120021095", "story_v_out_120021.awb") / 1000

					if var_396_10 + var_396_2 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_10 + var_396_2
					end

					if var_396_5.prefab_name ~= "" and arg_393_1.actors_[var_396_5.prefab_name] ~= nil then
						local var_396_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_5.prefab_name].transform, "story_v_out_120021", "120021095", "story_v_out_120021.awb")

						arg_393_1:RecordAudio("120021095", var_396_11)
						arg_393_1:RecordAudio("120021095", var_396_11)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_120021", "120021095", "story_v_out_120021.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_120021", "120021095", "story_v_out_120021.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_12 = math.max(var_396_3, arg_393_1.talkMaxDuration)

			if var_396_2 <= arg_393_1.time_ and arg_393_1.time_ < var_396_2 + var_396_12 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_2) / var_396_12

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_2 + var_396_12 and arg_393_1.time_ < var_396_2 + var_396_12 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play120021096 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 120021096
		arg_397_1.duration_ = 13.733

		local var_397_0 = {
			zh = 10.166,
			ja = 13.733
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
				arg_397_0:Play120021097(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1072ui_story"]
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 and arg_397_1.var_.characterEffect1072ui_story == nil then
				arg_397_1.var_.characterEffect1072ui_story = var_400_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_2 = 0.2

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_2 then
				local var_400_3 = (arg_397_1.time_ - var_400_1) / var_400_2

				if arg_397_1.var_.characterEffect1072ui_story then
					arg_397_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_397_1.time_ >= var_400_1 + var_400_2 and arg_397_1.time_ < var_400_1 + var_400_2 + arg_400_0 and arg_397_1.var_.characterEffect1072ui_story then
				arg_397_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_400_4 = arg_397_1.actors_["10037ui_story"]
			local var_400_5 = 0

			if var_400_5 < arg_397_1.time_ and arg_397_1.time_ <= var_400_5 + arg_400_0 and arg_397_1.var_.characterEffect10037ui_story == nil then
				arg_397_1.var_.characterEffect10037ui_story = var_400_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_400_6 = 0.2

			if var_400_5 <= arg_397_1.time_ and arg_397_1.time_ < var_400_5 + var_400_6 then
				local var_400_7 = (arg_397_1.time_ - var_400_5) / var_400_6

				if arg_397_1.var_.characterEffect10037ui_story then
					local var_400_8 = Mathf.Lerp(0, 0.5, var_400_7)

					arg_397_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_397_1.var_.characterEffect10037ui_story.fillRatio = var_400_8
				end
			end

			if arg_397_1.time_ >= var_400_5 + var_400_6 and arg_397_1.time_ < var_400_5 + var_400_6 + arg_400_0 and arg_397_1.var_.characterEffect10037ui_story then
				local var_400_9 = 0.5

				arg_397_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_397_1.var_.characterEffect10037ui_story.fillRatio = var_400_9
			end

			local var_400_10 = 0
			local var_400_11 = 1.4

			if var_400_10 < arg_397_1.time_ and arg_397_1.time_ <= var_400_10 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_12 = arg_397_1:FormatText(StoryNameCfg[379].name)

				arg_397_1.leftNameTxt_.text = var_400_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_13 = arg_397_1:GetWordFromCfg(120021096)
				local var_400_14 = arg_397_1:FormatText(var_400_13.content)

				arg_397_1.text_.text = var_400_14

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_15 = 56
				local var_400_16 = utf8.len(var_400_14)
				local var_400_17 = var_400_15 <= 0 and var_400_11 or var_400_11 * (var_400_16 / var_400_15)

				if var_400_17 > 0 and var_400_11 < var_400_17 then
					arg_397_1.talkMaxDuration = var_400_17

					if var_400_17 + var_400_10 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_17 + var_400_10
					end
				end

				arg_397_1.text_.text = var_400_14
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021096", "story_v_out_120021.awb") ~= 0 then
					local var_400_18 = manager.audio:GetVoiceLength("story_v_out_120021", "120021096", "story_v_out_120021.awb") / 1000

					if var_400_18 + var_400_10 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_18 + var_400_10
					end

					if var_400_13.prefab_name ~= "" and arg_397_1.actors_[var_400_13.prefab_name] ~= nil then
						local var_400_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_13.prefab_name].transform, "story_v_out_120021", "120021096", "story_v_out_120021.awb")

						arg_397_1:RecordAudio("120021096", var_400_19)
						arg_397_1:RecordAudio("120021096", var_400_19)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_120021", "120021096", "story_v_out_120021.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_120021", "120021096", "story_v_out_120021.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_20 = math.max(var_400_11, arg_397_1.talkMaxDuration)

			if var_400_10 <= arg_397_1.time_ and arg_397_1.time_ < var_400_10 + var_400_20 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_10) / var_400_20

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_10 + var_400_20 and arg_397_1.time_ < var_400_10 + var_400_20 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play120021097 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 120021097
		arg_401_1.duration_ = 12.033

		local var_401_0 = {
			zh = 11.766,
			ja = 12.033
		}
		local var_401_1 = manager.audio:GetLocalizationFlag()

		if var_401_0[var_401_1] ~= nil then
			arg_401_1.duration_ = var_401_0[var_401_1]
		end

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play120021098(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0
			local var_404_1 = 1.5

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_2 = arg_401_1:FormatText(StoryNameCfg[379].name)

				arg_401_1.leftNameTxt_.text = var_404_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_3 = arg_401_1:GetWordFromCfg(120021097)
				local var_404_4 = arg_401_1:FormatText(var_404_3.content)

				arg_401_1.text_.text = var_404_4

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_5 = 60
				local var_404_6 = utf8.len(var_404_4)
				local var_404_7 = var_404_5 <= 0 and var_404_1 or var_404_1 * (var_404_6 / var_404_5)

				if var_404_7 > 0 and var_404_1 < var_404_7 then
					arg_401_1.talkMaxDuration = var_404_7

					if var_404_7 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_7 + var_404_0
					end
				end

				arg_401_1.text_.text = var_404_4
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021097", "story_v_out_120021.awb") ~= 0 then
					local var_404_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021097", "story_v_out_120021.awb") / 1000

					if var_404_8 + var_404_0 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_8 + var_404_0
					end

					if var_404_3.prefab_name ~= "" and arg_401_1.actors_[var_404_3.prefab_name] ~= nil then
						local var_404_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_3.prefab_name].transform, "story_v_out_120021", "120021097", "story_v_out_120021.awb")

						arg_401_1:RecordAudio("120021097", var_404_9)
						arg_401_1:RecordAudio("120021097", var_404_9)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_120021", "120021097", "story_v_out_120021.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_120021", "120021097", "story_v_out_120021.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_10 = math.max(var_404_1, arg_401_1.talkMaxDuration)

			if var_404_0 <= arg_401_1.time_ and arg_401_1.time_ < var_404_0 + var_404_10 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_0) / var_404_10

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_0 + var_404_10 and arg_401_1.time_ < var_404_0 + var_404_10 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play120021098 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 120021098
		arg_405_1.duration_ = 13.9

		local var_405_0 = {
			zh = 5.733,
			ja = 13.9
		}
		local var_405_1 = manager.audio:GetLocalizationFlag()

		if var_405_0[var_405_1] ~= nil then
			arg_405_1.duration_ = var_405_0[var_405_1]
		end

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play120021099(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1072ui_story"]
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 and arg_405_1.var_.characterEffect1072ui_story == nil then
				arg_405_1.var_.characterEffect1072ui_story = var_408_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_2 = 0.2

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2

				if arg_405_1.var_.characterEffect1072ui_story then
					local var_408_4 = Mathf.Lerp(0, 0.5, var_408_3)

					arg_405_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_405_1.var_.characterEffect1072ui_story.fillRatio = var_408_4
				end
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 and arg_405_1.var_.characterEffect1072ui_story then
				local var_408_5 = 0.5

				arg_405_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_405_1.var_.characterEffect1072ui_story.fillRatio = var_408_5
			end

			local var_408_6 = arg_405_1.actors_["10037ui_story"]
			local var_408_7 = 0

			if var_408_7 < arg_405_1.time_ and arg_405_1.time_ <= var_408_7 + arg_408_0 and arg_405_1.var_.characterEffect10037ui_story == nil then
				arg_405_1.var_.characterEffect10037ui_story = var_408_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_8 = 0.2

			if var_408_7 <= arg_405_1.time_ and arg_405_1.time_ < var_408_7 + var_408_8 then
				local var_408_9 = (arg_405_1.time_ - var_408_7) / var_408_8

				if arg_405_1.var_.characterEffect10037ui_story then
					arg_405_1.var_.characterEffect10037ui_story.fillFlat = false
				end
			end

			if arg_405_1.time_ >= var_408_7 + var_408_8 and arg_405_1.time_ < var_408_7 + var_408_8 + arg_408_0 and arg_405_1.var_.characterEffect10037ui_story then
				arg_405_1.var_.characterEffect10037ui_story.fillFlat = false
			end

			local var_408_10 = 0

			if var_408_10 < arg_405_1.time_ and arg_405_1.time_ <= var_408_10 + arg_408_0 then
				arg_405_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_408_11 = 0
			local var_408_12 = 0.575

			if var_408_11 < arg_405_1.time_ and arg_405_1.time_ <= var_408_11 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_13 = arg_405_1:FormatText(StoryNameCfg[383].name)

				arg_405_1.leftNameTxt_.text = var_408_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_14 = arg_405_1:GetWordFromCfg(120021098)
				local var_408_15 = arg_405_1:FormatText(var_408_14.content)

				arg_405_1.text_.text = var_408_15

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_16 = 23
				local var_408_17 = utf8.len(var_408_15)
				local var_408_18 = var_408_16 <= 0 and var_408_12 or var_408_12 * (var_408_17 / var_408_16)

				if var_408_18 > 0 and var_408_12 < var_408_18 then
					arg_405_1.talkMaxDuration = var_408_18

					if var_408_18 + var_408_11 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_18 + var_408_11
					end
				end

				arg_405_1.text_.text = var_408_15
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021098", "story_v_out_120021.awb") ~= 0 then
					local var_408_19 = manager.audio:GetVoiceLength("story_v_out_120021", "120021098", "story_v_out_120021.awb") / 1000

					if var_408_19 + var_408_11 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_19 + var_408_11
					end

					if var_408_14.prefab_name ~= "" and arg_405_1.actors_[var_408_14.prefab_name] ~= nil then
						local var_408_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_14.prefab_name].transform, "story_v_out_120021", "120021098", "story_v_out_120021.awb")

						arg_405_1:RecordAudio("120021098", var_408_20)
						arg_405_1:RecordAudio("120021098", var_408_20)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_120021", "120021098", "story_v_out_120021.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_120021", "120021098", "story_v_out_120021.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_21 = math.max(var_408_12, arg_405_1.talkMaxDuration)

			if var_408_11 <= arg_405_1.time_ and arg_405_1.time_ < var_408_11 + var_408_21 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_11) / var_408_21

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_11 + var_408_21 and arg_405_1.time_ < var_408_11 + var_408_21 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play120021099 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 120021099
		arg_409_1.duration_ = 13.5

		local var_409_0 = {
			zh = 9.266,
			ja = 13.5
		}
		local var_409_1 = manager.audio:GetLocalizationFlag()

		if var_409_0[var_409_1] ~= nil then
			arg_409_1.duration_ = var_409_0[var_409_1]
		end

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play120021100(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = 0

			if var_412_0 < arg_409_1.time_ and arg_409_1.time_ <= var_412_0 + arg_412_0 then
				arg_409_1:PlayTimeline("10037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_412_1 = 0
			local var_412_2 = 1.05

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_3 = arg_409_1:FormatText(StoryNameCfg[383].name)

				arg_409_1.leftNameTxt_.text = var_412_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_4 = arg_409_1:GetWordFromCfg(120021099)
				local var_412_5 = arg_409_1:FormatText(var_412_4.content)

				arg_409_1.text_.text = var_412_5

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_6 = 42
				local var_412_7 = utf8.len(var_412_5)
				local var_412_8 = var_412_6 <= 0 and var_412_2 or var_412_2 * (var_412_7 / var_412_6)

				if var_412_8 > 0 and var_412_2 < var_412_8 then
					arg_409_1.talkMaxDuration = var_412_8

					if var_412_8 + var_412_1 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_8 + var_412_1
					end
				end

				arg_409_1.text_.text = var_412_5
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021099", "story_v_out_120021.awb") ~= 0 then
					local var_412_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021099", "story_v_out_120021.awb") / 1000

					if var_412_9 + var_412_1 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_9 + var_412_1
					end

					if var_412_4.prefab_name ~= "" and arg_409_1.actors_[var_412_4.prefab_name] ~= nil then
						local var_412_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_4.prefab_name].transform, "story_v_out_120021", "120021099", "story_v_out_120021.awb")

						arg_409_1:RecordAudio("120021099", var_412_10)
						arg_409_1:RecordAudio("120021099", var_412_10)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_120021", "120021099", "story_v_out_120021.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_120021", "120021099", "story_v_out_120021.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_11 = math.max(var_412_2, arg_409_1.talkMaxDuration)

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_11 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_1) / var_412_11

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_1 + var_412_11 and arg_409_1.time_ < var_412_1 + var_412_11 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play120021100 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 120021100
		arg_413_1.duration_ = 9.3

		local var_413_0 = {
			zh = 4.666,
			ja = 9.3
		}
		local var_413_1 = manager.audio:GetLocalizationFlag()

		if var_413_0[var_413_1] ~= nil then
			arg_413_1.duration_ = var_413_0[var_413_1]
		end

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play120021101(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["10037ui_story"]
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 and arg_413_1.var_.characterEffect10037ui_story == nil then
				arg_413_1.var_.characterEffect10037ui_story = var_416_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_2 = 0.2

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2

				if arg_413_1.var_.characterEffect10037ui_story then
					local var_416_4 = Mathf.Lerp(0, 0.5, var_416_3)

					arg_413_1.var_.characterEffect10037ui_story.fillFlat = true
					arg_413_1.var_.characterEffect10037ui_story.fillRatio = var_416_4
				end
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 and arg_413_1.var_.characterEffect10037ui_story then
				local var_416_5 = 0.5

				arg_413_1.var_.characterEffect10037ui_story.fillFlat = true
				arg_413_1.var_.characterEffect10037ui_story.fillRatio = var_416_5
			end

			local var_416_6 = arg_413_1.actors_["1072ui_story"]
			local var_416_7 = 0

			if var_416_7 < arg_413_1.time_ and arg_413_1.time_ <= var_416_7 + arg_416_0 and arg_413_1.var_.characterEffect1072ui_story == nil then
				arg_413_1.var_.characterEffect1072ui_story = var_416_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_8 = 0.2

			if var_416_7 <= arg_413_1.time_ and arg_413_1.time_ < var_416_7 + var_416_8 then
				local var_416_9 = (arg_413_1.time_ - var_416_7) / var_416_8

				if arg_413_1.var_.characterEffect1072ui_story then
					arg_413_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_7 + var_416_8 and arg_413_1.time_ < var_416_7 + var_416_8 + arg_416_0 and arg_413_1.var_.characterEffect1072ui_story then
				arg_413_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_416_10 = 0
			local var_416_11 = 0.575

			if var_416_10 < arg_413_1.time_ and arg_413_1.time_ <= var_416_10 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_12 = arg_413_1:FormatText(StoryNameCfg[379].name)

				arg_413_1.leftNameTxt_.text = var_416_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_13 = arg_413_1:GetWordFromCfg(120021100)
				local var_416_14 = arg_413_1:FormatText(var_416_13.content)

				arg_413_1.text_.text = var_416_14

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_15 = 23
				local var_416_16 = utf8.len(var_416_14)
				local var_416_17 = var_416_15 <= 0 and var_416_11 or var_416_11 * (var_416_16 / var_416_15)

				if var_416_17 > 0 and var_416_11 < var_416_17 then
					arg_413_1.talkMaxDuration = var_416_17

					if var_416_17 + var_416_10 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_17 + var_416_10
					end
				end

				arg_413_1.text_.text = var_416_14
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021100", "story_v_out_120021.awb") ~= 0 then
					local var_416_18 = manager.audio:GetVoiceLength("story_v_out_120021", "120021100", "story_v_out_120021.awb") / 1000

					if var_416_18 + var_416_10 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_18 + var_416_10
					end

					if var_416_13.prefab_name ~= "" and arg_413_1.actors_[var_416_13.prefab_name] ~= nil then
						local var_416_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_13.prefab_name].transform, "story_v_out_120021", "120021100", "story_v_out_120021.awb")

						arg_413_1:RecordAudio("120021100", var_416_19)
						arg_413_1:RecordAudio("120021100", var_416_19)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_120021", "120021100", "story_v_out_120021.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_120021", "120021100", "story_v_out_120021.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_20 = math.max(var_416_11, arg_413_1.talkMaxDuration)

			if var_416_10 <= arg_413_1.time_ and arg_413_1.time_ < var_416_10 + var_416_20 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_10) / var_416_20

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_10 + var_416_20 and arg_413_1.time_ < var_416_10 + var_416_20 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play120021101 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 120021101
		arg_417_1.duration_ = 9.966

		local var_417_0 = {
			zh = 6.6,
			ja = 9.966
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
				arg_417_0:Play120021102(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = 0

			if var_420_0 < arg_417_1.time_ and arg_417_1.time_ <= var_420_0 + arg_420_0 then
				arg_417_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action5_1")
			end

			local var_420_1 = 0
			local var_420_2 = 0.75

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_3 = arg_417_1:FormatText(StoryNameCfg[379].name)

				arg_417_1.leftNameTxt_.text = var_420_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_4 = arg_417_1:GetWordFromCfg(120021101)
				local var_420_5 = arg_417_1:FormatText(var_420_4.content)

				arg_417_1.text_.text = var_420_5

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_6 = 30
				local var_420_7 = utf8.len(var_420_5)
				local var_420_8 = var_420_6 <= 0 and var_420_2 or var_420_2 * (var_420_7 / var_420_6)

				if var_420_8 > 0 and var_420_2 < var_420_8 then
					arg_417_1.talkMaxDuration = var_420_8

					if var_420_8 + var_420_1 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_8 + var_420_1
					end
				end

				arg_417_1.text_.text = var_420_5
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021101", "story_v_out_120021.awb") ~= 0 then
					local var_420_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021101", "story_v_out_120021.awb") / 1000

					if var_420_9 + var_420_1 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_9 + var_420_1
					end

					if var_420_4.prefab_name ~= "" and arg_417_1.actors_[var_420_4.prefab_name] ~= nil then
						local var_420_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_4.prefab_name].transform, "story_v_out_120021", "120021101", "story_v_out_120021.awb")

						arg_417_1:RecordAudio("120021101", var_420_10)
						arg_417_1:RecordAudio("120021101", var_420_10)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_120021", "120021101", "story_v_out_120021.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_120021", "120021101", "story_v_out_120021.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_11 = math.max(var_420_2, arg_417_1.talkMaxDuration)

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_11 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_1) / var_420_11

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_1 + var_420_11 and arg_417_1.time_ < var_420_1 + var_420_11 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play120021102 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 120021102
		arg_421_1.duration_ = 5

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play120021103(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1072ui_story"]
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 and arg_421_1.var_.characterEffect1072ui_story == nil then
				arg_421_1.var_.characterEffect1072ui_story = var_424_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_2 = 0.2

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2

				if arg_421_1.var_.characterEffect1072ui_story then
					local var_424_4 = Mathf.Lerp(0, 0.5, var_424_3)

					arg_421_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1072ui_story.fillRatio = var_424_4
				end
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 and arg_421_1.var_.characterEffect1072ui_story then
				local var_424_5 = 0.5

				arg_421_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1072ui_story.fillRatio = var_424_5
			end

			local var_424_6 = 0
			local var_424_7 = 1.025

			if var_424_6 < arg_421_1.time_ and arg_421_1.time_ <= var_424_6 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, false)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_8 = arg_421_1:GetWordFromCfg(120021102)
				local var_424_9 = arg_421_1:FormatText(var_424_8.content)

				arg_421_1.text_.text = var_424_9

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_10 = 41
				local var_424_11 = utf8.len(var_424_9)
				local var_424_12 = var_424_10 <= 0 and var_424_7 or var_424_7 * (var_424_11 / var_424_10)

				if var_424_12 > 0 and var_424_7 < var_424_12 then
					arg_421_1.talkMaxDuration = var_424_12

					if var_424_12 + var_424_6 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_12 + var_424_6
					end
				end

				arg_421_1.text_.text = var_424_9
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_13 = math.max(var_424_7, arg_421_1.talkMaxDuration)

			if var_424_6 <= arg_421_1.time_ and arg_421_1.time_ < var_424_6 + var_424_13 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_6) / var_424_13

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_6 + var_424_13 and arg_421_1.time_ < var_424_6 + var_424_13 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play120021103 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 120021103
		arg_425_1.duration_ = 8

		local var_425_0 = {
			zh = 6.9,
			ja = 8
		}
		local var_425_1 = manager.audio:GetLocalizationFlag()

		if var_425_0[var_425_1] ~= nil then
			arg_425_1.duration_ = var_425_0[var_425_1]
		end

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play120021104(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1072ui_story"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.characterEffect1072ui_story == nil then
				arg_425_1.var_.characterEffect1072ui_story = var_428_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_2 = 0.2

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.characterEffect1072ui_story then
					arg_425_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.characterEffect1072ui_story then
				arg_425_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_428_4 = 0
			local var_428_5 = 0.85

			if var_428_4 < arg_425_1.time_ and arg_425_1.time_ <= var_428_4 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_6 = arg_425_1:FormatText(StoryNameCfg[379].name)

				arg_425_1.leftNameTxt_.text = var_428_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_7 = arg_425_1:GetWordFromCfg(120021103)
				local var_428_8 = arg_425_1:FormatText(var_428_7.content)

				arg_425_1.text_.text = var_428_8

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_9 = 34
				local var_428_10 = utf8.len(var_428_8)
				local var_428_11 = var_428_9 <= 0 and var_428_5 or var_428_5 * (var_428_10 / var_428_9)

				if var_428_11 > 0 and var_428_5 < var_428_11 then
					arg_425_1.talkMaxDuration = var_428_11

					if var_428_11 + var_428_4 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_11 + var_428_4
					end
				end

				arg_425_1.text_.text = var_428_8
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021103", "story_v_out_120021.awb") ~= 0 then
					local var_428_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021103", "story_v_out_120021.awb") / 1000

					if var_428_12 + var_428_4 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_12 + var_428_4
					end

					if var_428_7.prefab_name ~= "" and arg_425_1.actors_[var_428_7.prefab_name] ~= nil then
						local var_428_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_7.prefab_name].transform, "story_v_out_120021", "120021103", "story_v_out_120021.awb")

						arg_425_1:RecordAudio("120021103", var_428_13)
						arg_425_1:RecordAudio("120021103", var_428_13)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_120021", "120021103", "story_v_out_120021.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_120021", "120021103", "story_v_out_120021.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_14 = math.max(var_428_5, arg_425_1.talkMaxDuration)

			if var_428_4 <= arg_425_1.time_ and arg_425_1.time_ < var_428_4 + var_428_14 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_4) / var_428_14

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_4 + var_428_14 and arg_425_1.time_ < var_428_4 + var_428_14 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play120021104 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 120021104
		arg_429_1.duration_ = 17.233

		local var_429_0 = {
			zh = 12.033,
			ja = 17.233
		}
		local var_429_1 = manager.audio:GetLocalizationFlag()

		if var_429_0[var_429_1] ~= nil then
			arg_429_1.duration_ = var_429_0[var_429_1]
		end

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play120021105(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = "ST32"

			if arg_429_1.bgs_[var_432_0] == nil then
				local var_432_1 = Object.Instantiate(arg_429_1.paintGo_)

				var_432_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_432_0)
				var_432_1.name = var_432_0
				var_432_1.transform.parent = arg_429_1.stage_.transform
				var_432_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_429_1.bgs_[var_432_0] = var_432_1
			end

			local var_432_2 = 2

			if var_432_2 < arg_429_1.time_ and arg_429_1.time_ <= var_432_2 + arg_432_0 then
				local var_432_3 = manager.ui.mainCamera.transform.localPosition
				local var_432_4 = Vector3.New(0, 0, 10) + Vector3.New(var_432_3.x, var_432_3.y, 0)
				local var_432_5 = arg_429_1.bgs_.ST32

				var_432_5.transform.localPosition = var_432_4
				var_432_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_432_6 = var_432_5:GetComponent("SpriteRenderer")

				if var_432_6 and var_432_6.sprite then
					local var_432_7 = (var_432_5.transform.localPosition - var_432_3).z
					local var_432_8 = manager.ui.mainCameraCom_
					local var_432_9 = 2 * var_432_7 * Mathf.Tan(var_432_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_432_10 = var_432_9 * var_432_8.aspect
					local var_432_11 = var_432_6.sprite.bounds.size.x
					local var_432_12 = var_432_6.sprite.bounds.size.y
					local var_432_13 = var_432_10 / var_432_11
					local var_432_14 = var_432_9 / var_432_12
					local var_432_15 = var_432_14 < var_432_13 and var_432_13 or var_432_14

					var_432_5.transform.localScale = Vector3.New(var_432_15, var_432_15, 0)
				end

				for iter_432_0, iter_432_1 in pairs(arg_429_1.bgs_) do
					if iter_432_0 ~= "ST32" then
						iter_432_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_432_16 = 0

			if var_432_16 < arg_429_1.time_ and arg_429_1.time_ <= var_432_16 + arg_432_0 then
				arg_429_1.mask_.enabled = true
				arg_429_1.mask_.raycastTarget = true

				arg_429_1:SetGaussion(false)
			end

			local var_432_17 = 2

			if var_432_16 <= arg_429_1.time_ and arg_429_1.time_ < var_432_16 + var_432_17 then
				local var_432_18 = (arg_429_1.time_ - var_432_16) / var_432_17
				local var_432_19 = Color.New(0, 0, 0)

				var_432_19.a = Mathf.Lerp(0, 1, var_432_18)
				arg_429_1.mask_.color = var_432_19
			end

			if arg_429_1.time_ >= var_432_16 + var_432_17 and arg_429_1.time_ < var_432_16 + var_432_17 + arg_432_0 then
				local var_432_20 = Color.New(0, 0, 0)

				var_432_20.a = 1
				arg_429_1.mask_.color = var_432_20
			end

			local var_432_21 = 2

			if var_432_21 < arg_429_1.time_ and arg_429_1.time_ <= var_432_21 + arg_432_0 then
				arg_429_1.mask_.enabled = true
				arg_429_1.mask_.raycastTarget = true

				arg_429_1:SetGaussion(false)
			end

			local var_432_22 = 2

			if var_432_21 <= arg_429_1.time_ and arg_429_1.time_ < var_432_21 + var_432_22 then
				local var_432_23 = (arg_429_1.time_ - var_432_21) / var_432_22
				local var_432_24 = Color.New(0, 0, 0)

				var_432_24.a = Mathf.Lerp(1, 0, var_432_23)
				arg_429_1.mask_.color = var_432_24
			end

			if arg_429_1.time_ >= var_432_21 + var_432_22 and arg_429_1.time_ < var_432_21 + var_432_22 + arg_432_0 then
				local var_432_25 = Color.New(0, 0, 0)
				local var_432_26 = 0

				arg_429_1.mask_.enabled = false
				var_432_25.a = var_432_26
				arg_429_1.mask_.color = var_432_25
			end

			local var_432_27 = arg_429_1.actors_["1072ui_story"].transform
			local var_432_28 = 1.966

			if var_432_28 < arg_429_1.time_ and arg_429_1.time_ <= var_432_28 + arg_432_0 then
				arg_429_1.var_.moveOldPos1072ui_story = var_432_27.localPosition
			end

			local var_432_29 = 0.001

			if var_432_28 <= arg_429_1.time_ and arg_429_1.time_ < var_432_28 + var_432_29 then
				local var_432_30 = (arg_429_1.time_ - var_432_28) / var_432_29
				local var_432_31 = Vector3.New(0, 100, 0)

				var_432_27.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1072ui_story, var_432_31, var_432_30)

				local var_432_32 = manager.ui.mainCamera.transform.position - var_432_27.position

				var_432_27.forward = Vector3.New(var_432_32.x, var_432_32.y, var_432_32.z)

				local var_432_33 = var_432_27.localEulerAngles

				var_432_33.z = 0
				var_432_33.x = 0
				var_432_27.localEulerAngles = var_432_33
			end

			if arg_429_1.time_ >= var_432_28 + var_432_29 and arg_429_1.time_ < var_432_28 + var_432_29 + arg_432_0 then
				var_432_27.localPosition = Vector3.New(0, 100, 0)

				local var_432_34 = manager.ui.mainCamera.transform.position - var_432_27.position

				var_432_27.forward = Vector3.New(var_432_34.x, var_432_34.y, var_432_34.z)

				local var_432_35 = var_432_27.localEulerAngles

				var_432_35.z = 0
				var_432_35.x = 0
				var_432_27.localEulerAngles = var_432_35
			end

			local var_432_36 = arg_429_1.actors_["10037ui_story"].transform
			local var_432_37 = 1.966

			if var_432_37 < arg_429_1.time_ and arg_429_1.time_ <= var_432_37 + arg_432_0 then
				arg_429_1.var_.moveOldPos10037ui_story = var_432_36.localPosition
			end

			local var_432_38 = 0.001

			if var_432_37 <= arg_429_1.time_ and arg_429_1.time_ < var_432_37 + var_432_38 then
				local var_432_39 = (arg_429_1.time_ - var_432_37) / var_432_38
				local var_432_40 = Vector3.New(0, 100, 0)

				var_432_36.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos10037ui_story, var_432_40, var_432_39)

				local var_432_41 = manager.ui.mainCamera.transform.position - var_432_36.position

				var_432_36.forward = Vector3.New(var_432_41.x, var_432_41.y, var_432_41.z)

				local var_432_42 = var_432_36.localEulerAngles

				var_432_42.z = 0
				var_432_42.x = 0
				var_432_36.localEulerAngles = var_432_42
			end

			if arg_429_1.time_ >= var_432_37 + var_432_38 and arg_429_1.time_ < var_432_37 + var_432_38 + arg_432_0 then
				var_432_36.localPosition = Vector3.New(0, 100, 0)

				local var_432_43 = manager.ui.mainCamera.transform.position - var_432_36.position

				var_432_36.forward = Vector3.New(var_432_43.x, var_432_43.y, var_432_43.z)

				local var_432_44 = var_432_36.localEulerAngles

				var_432_44.z = 0
				var_432_44.x = 0
				var_432_36.localEulerAngles = var_432_44
			end

			local var_432_45 = arg_429_1.actors_["1072ui_story"]
			local var_432_46 = 4

			if var_432_46 < arg_429_1.time_ and arg_429_1.time_ <= var_432_46 + arg_432_0 and arg_429_1.var_.characterEffect1072ui_story == nil then
				arg_429_1.var_.characterEffect1072ui_story = var_432_45:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_47 = 0.2

			if var_432_46 <= arg_429_1.time_ and arg_429_1.time_ < var_432_46 + var_432_47 then
				local var_432_48 = (arg_429_1.time_ - var_432_46) / var_432_47

				if arg_429_1.var_.characterEffect1072ui_story then
					arg_429_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_429_1.time_ >= var_432_46 + var_432_47 and arg_429_1.time_ < var_432_46 + var_432_47 + arg_432_0 and arg_429_1.var_.characterEffect1072ui_story then
				arg_429_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_432_49 = 4

			if var_432_49 < arg_429_1.time_ and arg_429_1.time_ <= var_432_49 + arg_432_0 then
				arg_429_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_432_50 = 4

			if var_432_50 < arg_429_1.time_ and arg_429_1.time_ <= var_432_50 + arg_432_0 then
				arg_429_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_432_51 = arg_429_1.actors_["1072ui_story"].transform
			local var_432_52 = 4

			if var_432_52 < arg_429_1.time_ and arg_429_1.time_ <= var_432_52 + arg_432_0 then
				arg_429_1.var_.moveOldPos1072ui_story = var_432_51.localPosition
			end

			local var_432_53 = 0.001

			if var_432_52 <= arg_429_1.time_ and arg_429_1.time_ < var_432_52 + var_432_53 then
				local var_432_54 = (arg_429_1.time_ - var_432_52) / var_432_53
				local var_432_55 = Vector3.New(0, -0.71, -6)

				var_432_51.localPosition = Vector3.Lerp(arg_429_1.var_.moveOldPos1072ui_story, var_432_55, var_432_54)

				local var_432_56 = manager.ui.mainCamera.transform.position - var_432_51.position

				var_432_51.forward = Vector3.New(var_432_56.x, var_432_56.y, var_432_56.z)

				local var_432_57 = var_432_51.localEulerAngles

				var_432_57.z = 0
				var_432_57.x = 0
				var_432_51.localEulerAngles = var_432_57
			end

			if arg_429_1.time_ >= var_432_52 + var_432_53 and arg_429_1.time_ < var_432_52 + var_432_53 + arg_432_0 then
				var_432_51.localPosition = Vector3.New(0, -0.71, -6)

				local var_432_58 = manager.ui.mainCamera.transform.position - var_432_51.position

				var_432_51.forward = Vector3.New(var_432_58.x, var_432_58.y, var_432_58.z)

				local var_432_59 = var_432_51.localEulerAngles

				var_432_59.z = 0
				var_432_59.x = 0
				var_432_51.localEulerAngles = var_432_59
			end

			if arg_429_1.frameCnt_ <= 1 then
				arg_429_1.dialog_:SetActive(false)
			end

			local var_432_60 = 4
			local var_432_61 = 0.7

			if var_432_60 < arg_429_1.time_ and arg_429_1.time_ <= var_432_60 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0

				arg_429_1.dialog_:SetActive(true)

				local var_432_62 = LeanTween.value(arg_429_1.dialog_, 0, 1, 0.3)

				var_432_62:setOnUpdate(LuaHelper.FloatAction(function(arg_433_0)
					arg_429_1.dialogCg_.alpha = arg_433_0
				end))
				var_432_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_429_1.dialog_)
					var_432_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_429_1.duration_ = arg_429_1.duration_ + 0.3

				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_63 = arg_429_1:FormatText(StoryNameCfg[379].name)

				arg_429_1.leftNameTxt_.text = var_432_63

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_64 = arg_429_1:GetWordFromCfg(120021104)
				local var_432_65 = arg_429_1:FormatText(var_432_64.content)

				arg_429_1.text_.text = var_432_65

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_66 = 28
				local var_432_67 = utf8.len(var_432_65)
				local var_432_68 = var_432_66 <= 0 and var_432_61 or var_432_61 * (var_432_67 / var_432_66)

				if var_432_68 > 0 and var_432_61 < var_432_68 then
					arg_429_1.talkMaxDuration = var_432_68
					var_432_60 = var_432_60 + 0.3

					if var_432_68 + var_432_60 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_68 + var_432_60
					end
				end

				arg_429_1.text_.text = var_432_65
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021104", "story_v_out_120021.awb") ~= 0 then
					local var_432_69 = manager.audio:GetVoiceLength("story_v_out_120021", "120021104", "story_v_out_120021.awb") / 1000

					if var_432_69 + var_432_60 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_69 + var_432_60
					end

					if var_432_64.prefab_name ~= "" and arg_429_1.actors_[var_432_64.prefab_name] ~= nil then
						local var_432_70 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_64.prefab_name].transform, "story_v_out_120021", "120021104", "story_v_out_120021.awb")

						arg_429_1:RecordAudio("120021104", var_432_70)
						arg_429_1:RecordAudio("120021104", var_432_70)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_120021", "120021104", "story_v_out_120021.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_120021", "120021104", "story_v_out_120021.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_71 = var_432_60 + 0.3
			local var_432_72 = math.max(var_432_61, arg_429_1.talkMaxDuration)

			if var_432_71 <= arg_429_1.time_ and arg_429_1.time_ < var_432_71 + var_432_72 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_71) / var_432_72

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_71 + var_432_72 and arg_429_1.time_ < var_432_71 + var_432_72 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play120021105 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 120021105
		arg_435_1.duration_ = 9.2

		local var_435_0 = {
			zh = 4.266,
			ja = 9.2
		}
		local var_435_1 = manager.audio:GetLocalizationFlag()

		if var_435_0[var_435_1] ~= nil then
			arg_435_1.duration_ = var_435_0[var_435_1]
		end

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play120021106(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 0.55

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_2 = arg_435_1:FormatText(StoryNameCfg[379].name)

				arg_435_1.leftNameTxt_.text = var_438_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_3 = arg_435_1:GetWordFromCfg(120021105)
				local var_438_4 = arg_435_1:FormatText(var_438_3.content)

				arg_435_1.text_.text = var_438_4

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_5 = 22
				local var_438_6 = utf8.len(var_438_4)
				local var_438_7 = var_438_5 <= 0 and var_438_1 or var_438_1 * (var_438_6 / var_438_5)

				if var_438_7 > 0 and var_438_1 < var_438_7 then
					arg_435_1.talkMaxDuration = var_438_7

					if var_438_7 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_7 + var_438_0
					end
				end

				arg_435_1.text_.text = var_438_4
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021105", "story_v_out_120021.awb") ~= 0 then
					local var_438_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021105", "story_v_out_120021.awb") / 1000

					if var_438_8 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_8 + var_438_0
					end

					if var_438_3.prefab_name ~= "" and arg_435_1.actors_[var_438_3.prefab_name] ~= nil then
						local var_438_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_3.prefab_name].transform, "story_v_out_120021", "120021105", "story_v_out_120021.awb")

						arg_435_1:RecordAudio("120021105", var_438_9)
						arg_435_1:RecordAudio("120021105", var_438_9)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_120021", "120021105", "story_v_out_120021.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_120021", "120021105", "story_v_out_120021.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_10 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_10 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_10

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_10 and arg_435_1.time_ < var_438_0 + var_438_10 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play120021106 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 120021106
		arg_439_1.duration_ = 7.733

		local var_439_0 = {
			zh = 6.166,
			ja = 7.733
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
				arg_439_0:Play120021107(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0
			local var_442_1 = 0.725

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_2 = arg_439_1:FormatText(StoryNameCfg[379].name)

				arg_439_1.leftNameTxt_.text = var_442_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_3 = arg_439_1:GetWordFromCfg(120021106)
				local var_442_4 = arg_439_1:FormatText(var_442_3.content)

				arg_439_1.text_.text = var_442_4

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_5 = 29
				local var_442_6 = utf8.len(var_442_4)
				local var_442_7 = var_442_5 <= 0 and var_442_1 or var_442_1 * (var_442_6 / var_442_5)

				if var_442_7 > 0 and var_442_1 < var_442_7 then
					arg_439_1.talkMaxDuration = var_442_7

					if var_442_7 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_7 + var_442_0
					end
				end

				arg_439_1.text_.text = var_442_4
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021106", "story_v_out_120021.awb") ~= 0 then
					local var_442_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021106", "story_v_out_120021.awb") / 1000

					if var_442_8 + var_442_0 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_8 + var_442_0
					end

					if var_442_3.prefab_name ~= "" and arg_439_1.actors_[var_442_3.prefab_name] ~= nil then
						local var_442_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_3.prefab_name].transform, "story_v_out_120021", "120021106", "story_v_out_120021.awb")

						arg_439_1:RecordAudio("120021106", var_442_9)
						arg_439_1:RecordAudio("120021106", var_442_9)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_120021", "120021106", "story_v_out_120021.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_120021", "120021106", "story_v_out_120021.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_10 = math.max(var_442_1, arg_439_1.talkMaxDuration)

			if var_442_0 <= arg_439_1.time_ and arg_439_1.time_ < var_442_0 + var_442_10 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_0) / var_442_10

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_0 + var_442_10 and arg_439_1.time_ < var_442_0 + var_442_10 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play120021107 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 120021107
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play120021108(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1072ui_story"].transform
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				arg_443_1.var_.moveOldPos1072ui_story = var_446_0.localPosition
			end

			local var_446_2 = 0.001

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2
				local var_446_4 = Vector3.New(0, 100, 0)

				var_446_0.localPosition = Vector3.Lerp(arg_443_1.var_.moveOldPos1072ui_story, var_446_4, var_446_3)

				local var_446_5 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_5.x, var_446_5.y, var_446_5.z)

				local var_446_6 = var_446_0.localEulerAngles

				var_446_6.z = 0
				var_446_6.x = 0
				var_446_0.localEulerAngles = var_446_6
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 then
				var_446_0.localPosition = Vector3.New(0, 100, 0)

				local var_446_7 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_7.x, var_446_7.y, var_446_7.z)

				local var_446_8 = var_446_0.localEulerAngles

				var_446_8.z = 0
				var_446_8.x = 0
				var_446_0.localEulerAngles = var_446_8
			end

			local var_446_9 = 0
			local var_446_10 = 1.45

			if var_446_9 < arg_443_1.time_ and arg_443_1.time_ <= var_446_9 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, false)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_11 = arg_443_1:GetWordFromCfg(120021107)
				local var_446_12 = arg_443_1:FormatText(var_446_11.content)

				arg_443_1.text_.text = var_446_12

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_13 = 58
				local var_446_14 = utf8.len(var_446_12)
				local var_446_15 = var_446_13 <= 0 and var_446_10 or var_446_10 * (var_446_14 / var_446_13)

				if var_446_15 > 0 and var_446_10 < var_446_15 then
					arg_443_1.talkMaxDuration = var_446_15

					if var_446_15 + var_446_9 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_15 + var_446_9
					end
				end

				arg_443_1.text_.text = var_446_12
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_16 = math.max(var_446_10, arg_443_1.talkMaxDuration)

			if var_446_9 <= arg_443_1.time_ and arg_443_1.time_ < var_446_9 + var_446_16 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_9) / var_446_16

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_9 + var_446_16 and arg_443_1.time_ < var_446_9 + var_446_16 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play120021108 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 120021108
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play120021109(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 0.175

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

				local var_450_3 = arg_447_1:GetWordFromCfg(120021108)
				local var_450_4 = arg_447_1:FormatText(var_450_3.content)

				arg_447_1.text_.text = var_450_4

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_5 = 7
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
	Play120021109 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 120021109
		arg_451_1.duration_ = 2.033

		local var_451_0 = {
			zh = 1.999999999999,
			ja = 2.033
		}
		local var_451_1 = manager.audio:GetLocalizationFlag()

		if var_451_0[var_451_1] ~= nil then
			arg_451_1.duration_ = var_451_0[var_451_1]
		end

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play120021110(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["1075ui_story"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos1075ui_story = var_454_0.localPosition
			end

			local var_454_2 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2
				local var_454_4 = Vector3.New(0, -1.055, -6.16)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos1075ui_story, var_454_4, var_454_3)

				local var_454_5 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_5.x, var_454_5.y, var_454_5.z)

				local var_454_6 = var_454_0.localEulerAngles

				var_454_6.z = 0
				var_454_6.x = 0
				var_454_0.localEulerAngles = var_454_6
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_454_7 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_7.x, var_454_7.y, var_454_7.z)

				local var_454_8 = var_454_0.localEulerAngles

				var_454_8.z = 0
				var_454_8.x = 0
				var_454_0.localEulerAngles = var_454_8
			end

			local var_454_9 = arg_451_1.actors_["1075ui_story"]
			local var_454_10 = 0

			if var_454_10 < arg_451_1.time_ and arg_451_1.time_ <= var_454_10 + arg_454_0 and arg_451_1.var_.characterEffect1075ui_story == nil then
				arg_451_1.var_.characterEffect1075ui_story = var_454_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_11 = 0.2

			if var_454_10 <= arg_451_1.time_ and arg_451_1.time_ < var_454_10 + var_454_11 then
				local var_454_12 = (arg_451_1.time_ - var_454_10) / var_454_11

				if arg_451_1.var_.characterEffect1075ui_story then
					arg_451_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_451_1.time_ >= var_454_10 + var_454_11 and arg_451_1.time_ < var_454_10 + var_454_11 + arg_454_0 and arg_451_1.var_.characterEffect1075ui_story then
				arg_451_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_454_13 = 0

			if var_454_13 < arg_451_1.time_ and arg_451_1.time_ <= var_454_13 + arg_454_0 then
				arg_451_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_1")
			end

			local var_454_14 = 0

			if var_454_14 < arg_451_1.time_ and arg_451_1.time_ <= var_454_14 + arg_454_0 then
				arg_451_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_454_15 = 0
			local var_454_16 = 0.1

			if var_454_15 < arg_451_1.time_ and arg_451_1.time_ <= var_454_15 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_17 = arg_451_1:FormatText(StoryNameCfg[381].name)

				arg_451_1.leftNameTxt_.text = var_454_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_18 = arg_451_1:GetWordFromCfg(120021109)
				local var_454_19 = arg_451_1:FormatText(var_454_18.content)

				arg_451_1.text_.text = var_454_19

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_20 = 4
				local var_454_21 = utf8.len(var_454_19)
				local var_454_22 = var_454_20 <= 0 and var_454_16 or var_454_16 * (var_454_21 / var_454_20)

				if var_454_22 > 0 and var_454_16 < var_454_22 then
					arg_451_1.talkMaxDuration = var_454_22

					if var_454_22 + var_454_15 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_22 + var_454_15
					end
				end

				arg_451_1.text_.text = var_454_19
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021109", "story_v_out_120021.awb") ~= 0 then
					local var_454_23 = manager.audio:GetVoiceLength("story_v_out_120021", "120021109", "story_v_out_120021.awb") / 1000

					if var_454_23 + var_454_15 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_23 + var_454_15
					end

					if var_454_18.prefab_name ~= "" and arg_451_1.actors_[var_454_18.prefab_name] ~= nil then
						local var_454_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_18.prefab_name].transform, "story_v_out_120021", "120021109", "story_v_out_120021.awb")

						arg_451_1:RecordAudio("120021109", var_454_24)
						arg_451_1:RecordAudio("120021109", var_454_24)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_120021", "120021109", "story_v_out_120021.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_120021", "120021109", "story_v_out_120021.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_25 = math.max(var_454_16, arg_451_1.talkMaxDuration)

			if var_454_15 <= arg_451_1.time_ and arg_451_1.time_ < var_454_15 + var_454_25 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_15) / var_454_25

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_15 + var_454_25 and arg_451_1.time_ < var_454_15 + var_454_25 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play120021110 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 120021110
		arg_455_1.duration_ = 7

		local var_455_0 = {
			zh = 6.066,
			ja = 7
		}
		local var_455_1 = manager.audio:GetLocalizationFlag()

		if var_455_0[var_455_1] ~= nil then
			arg_455_1.duration_ = var_455_0[var_455_1]
		end

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play120021111(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_458_1 = 0
			local var_458_2 = 0.8

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_3 = arg_455_1:FormatText(StoryNameCfg[381].name)

				arg_455_1.leftNameTxt_.text = var_458_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_4 = arg_455_1:GetWordFromCfg(120021110)
				local var_458_5 = arg_455_1:FormatText(var_458_4.content)

				arg_455_1.text_.text = var_458_5

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_6 = 32
				local var_458_7 = utf8.len(var_458_5)
				local var_458_8 = var_458_6 <= 0 and var_458_2 or var_458_2 * (var_458_7 / var_458_6)

				if var_458_8 > 0 and var_458_2 < var_458_8 then
					arg_455_1.talkMaxDuration = var_458_8

					if var_458_8 + var_458_1 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_8 + var_458_1
					end
				end

				arg_455_1.text_.text = var_458_5
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021110", "story_v_out_120021.awb") ~= 0 then
					local var_458_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021110", "story_v_out_120021.awb") / 1000

					if var_458_9 + var_458_1 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_9 + var_458_1
					end

					if var_458_4.prefab_name ~= "" and arg_455_1.actors_[var_458_4.prefab_name] ~= nil then
						local var_458_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_4.prefab_name].transform, "story_v_out_120021", "120021110", "story_v_out_120021.awb")

						arg_455_1:RecordAudio("120021110", var_458_10)
						arg_455_1:RecordAudio("120021110", var_458_10)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_out_120021", "120021110", "story_v_out_120021.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_out_120021", "120021110", "story_v_out_120021.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_11 = math.max(var_458_2, arg_455_1.talkMaxDuration)

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_11 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_1) / var_458_11

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_1 + var_458_11 and arg_455_1.time_ < var_458_1 + var_458_11 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play120021111 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 120021111
		arg_459_1.duration_ = 13.866

		local var_459_0 = {
			zh = 6.366,
			ja = 13.866
		}
		local var_459_1 = manager.audio:GetLocalizationFlag()

		if var_459_0[var_459_1] ~= nil then
			arg_459_1.duration_ = var_459_0[var_459_1]
		end

		SetActive(arg_459_1.tipsGo_, false)

		function arg_459_1.onSingleLineFinish_()
			arg_459_1.onSingleLineUpdate_ = nil
			arg_459_1.onSingleLineFinish_ = nil
			arg_459_1.state_ = "waiting"
		end

		function arg_459_1.playNext_(arg_461_0)
			if arg_461_0 == 1 then
				arg_459_0:Play120021112(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = 0

			if var_462_0 < arg_459_1.time_ and arg_459_1.time_ <= var_462_0 + arg_462_0 then
				arg_459_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075actionlink/1075action454")
			end

			local var_462_1 = 0
			local var_462_2 = 0.725

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_3 = arg_459_1:FormatText(StoryNameCfg[381].name)

				arg_459_1.leftNameTxt_.text = var_462_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_4 = arg_459_1:GetWordFromCfg(120021111)
				local var_462_5 = arg_459_1:FormatText(var_462_4.content)

				arg_459_1.text_.text = var_462_5

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_6 = 29
				local var_462_7 = utf8.len(var_462_5)
				local var_462_8 = var_462_6 <= 0 and var_462_2 or var_462_2 * (var_462_7 / var_462_6)

				if var_462_8 > 0 and var_462_2 < var_462_8 then
					arg_459_1.talkMaxDuration = var_462_8

					if var_462_8 + var_462_1 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_8 + var_462_1
					end
				end

				arg_459_1.text_.text = var_462_5
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021111", "story_v_out_120021.awb") ~= 0 then
					local var_462_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021111", "story_v_out_120021.awb") / 1000

					if var_462_9 + var_462_1 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_9 + var_462_1
					end

					if var_462_4.prefab_name ~= "" and arg_459_1.actors_[var_462_4.prefab_name] ~= nil then
						local var_462_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_4.prefab_name].transform, "story_v_out_120021", "120021111", "story_v_out_120021.awb")

						arg_459_1:RecordAudio("120021111", var_462_10)
						arg_459_1:RecordAudio("120021111", var_462_10)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_120021", "120021111", "story_v_out_120021.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_120021", "120021111", "story_v_out_120021.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_11 = math.max(var_462_2, arg_459_1.talkMaxDuration)

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_11 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_1) / var_462_11

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_1 + var_462_11 and arg_459_1.time_ < var_462_1 + var_462_11 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play120021112 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 120021112
		arg_463_1.duration_ = 14.6

		local var_463_0 = {
			zh = 11.433,
			ja = 14.6
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
				arg_463_0:Play120021113(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0
			local var_466_1 = 1.4

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_2 = arg_463_1:FormatText(StoryNameCfg[381].name)

				arg_463_1.leftNameTxt_.text = var_466_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_3 = arg_463_1:GetWordFromCfg(120021112)
				local var_466_4 = arg_463_1:FormatText(var_466_3.content)

				arg_463_1.text_.text = var_466_4

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_5 = 56
				local var_466_6 = utf8.len(var_466_4)
				local var_466_7 = var_466_5 <= 0 and var_466_1 or var_466_1 * (var_466_6 / var_466_5)

				if var_466_7 > 0 and var_466_1 < var_466_7 then
					arg_463_1.talkMaxDuration = var_466_7

					if var_466_7 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_7 + var_466_0
					end
				end

				arg_463_1.text_.text = var_466_4
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021112", "story_v_out_120021.awb") ~= 0 then
					local var_466_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021112", "story_v_out_120021.awb") / 1000

					if var_466_8 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_8 + var_466_0
					end

					if var_466_3.prefab_name ~= "" and arg_463_1.actors_[var_466_3.prefab_name] ~= nil then
						local var_466_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_3.prefab_name].transform, "story_v_out_120021", "120021112", "story_v_out_120021.awb")

						arg_463_1:RecordAudio("120021112", var_466_9)
						arg_463_1:RecordAudio("120021112", var_466_9)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_out_120021", "120021112", "story_v_out_120021.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_out_120021", "120021112", "story_v_out_120021.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_10 = math.max(var_466_1, arg_463_1.talkMaxDuration)

			if var_466_0 <= arg_463_1.time_ and arg_463_1.time_ < var_466_0 + var_466_10 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_0) / var_466_10

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_0 + var_466_10 and arg_463_1.time_ < var_466_0 + var_466_10 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play120021113 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 120021113
		arg_467_1.duration_ = 5

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play120021114(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["1075ui_story"]
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 and arg_467_1.var_.characterEffect1075ui_story == nil then
				arg_467_1.var_.characterEffect1075ui_story = var_470_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_470_2 = 0.2

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_2 then
				local var_470_3 = (arg_467_1.time_ - var_470_1) / var_470_2

				if arg_467_1.var_.characterEffect1075ui_story then
					local var_470_4 = Mathf.Lerp(0, 0.5, var_470_3)

					arg_467_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_467_1.var_.characterEffect1075ui_story.fillRatio = var_470_4
				end
			end

			if arg_467_1.time_ >= var_470_1 + var_470_2 and arg_467_1.time_ < var_470_1 + var_470_2 + arg_470_0 and arg_467_1.var_.characterEffect1075ui_story then
				local var_470_5 = 0.5

				arg_467_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_467_1.var_.characterEffect1075ui_story.fillRatio = var_470_5
			end

			local var_470_6 = 0
			local var_470_7 = 1.15

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

				local var_470_9 = arg_467_1:GetWordFromCfg(120021113)
				local var_470_10 = arg_467_1:FormatText(var_470_9.content)

				arg_467_1.text_.text = var_470_10

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_11 = 46
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
	Play120021114 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 120021114
		arg_471_1.duration_ = 16.3

		local var_471_0 = {
			zh = 11.666,
			ja = 16.3
		}
		local var_471_1 = manager.audio:GetLocalizationFlag()

		if var_471_0[var_471_1] ~= nil then
			arg_471_1.duration_ = var_471_0[var_471_1]
		end

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play120021115(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["1075ui_story"]
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 and arg_471_1.var_.characterEffect1075ui_story == nil then
				arg_471_1.var_.characterEffect1075ui_story = var_474_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_2 = 0.2

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2

				if arg_471_1.var_.characterEffect1075ui_story then
					arg_471_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 and arg_471_1.var_.characterEffect1075ui_story then
				arg_471_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_474_4 = 0
			local var_474_5 = 1.2

			if var_474_4 < arg_471_1.time_ and arg_471_1.time_ <= var_474_4 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_6 = arg_471_1:FormatText(StoryNameCfg[381].name)

				arg_471_1.leftNameTxt_.text = var_474_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_7 = arg_471_1:GetWordFromCfg(120021114)
				local var_474_8 = arg_471_1:FormatText(var_474_7.content)

				arg_471_1.text_.text = var_474_8

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_9 = 48
				local var_474_10 = utf8.len(var_474_8)
				local var_474_11 = var_474_9 <= 0 and var_474_5 or var_474_5 * (var_474_10 / var_474_9)

				if var_474_11 > 0 and var_474_5 < var_474_11 then
					arg_471_1.talkMaxDuration = var_474_11

					if var_474_11 + var_474_4 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_11 + var_474_4
					end
				end

				arg_471_1.text_.text = var_474_8
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021114", "story_v_out_120021.awb") ~= 0 then
					local var_474_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021114", "story_v_out_120021.awb") / 1000

					if var_474_12 + var_474_4 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_12 + var_474_4
					end

					if var_474_7.prefab_name ~= "" and arg_471_1.actors_[var_474_7.prefab_name] ~= nil then
						local var_474_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_7.prefab_name].transform, "story_v_out_120021", "120021114", "story_v_out_120021.awb")

						arg_471_1:RecordAudio("120021114", var_474_13)
						arg_471_1:RecordAudio("120021114", var_474_13)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_120021", "120021114", "story_v_out_120021.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_120021", "120021114", "story_v_out_120021.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_14 = math.max(var_474_5, arg_471_1.talkMaxDuration)

			if var_474_4 <= arg_471_1.time_ and arg_471_1.time_ < var_474_4 + var_474_14 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_4) / var_474_14

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_4 + var_474_14 and arg_471_1.time_ < var_474_4 + var_474_14 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play120021115 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 120021115
		arg_475_1.duration_ = 8.466

		local var_475_0 = {
			zh = 5.6,
			ja = 8.466
		}
		local var_475_1 = manager.audio:GetLocalizationFlag()

		if var_475_0[var_475_1] ~= nil then
			arg_475_1.duration_ = var_475_0[var_475_1]
		end

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play120021116(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0
			local var_478_1 = 0.7

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_2 = arg_475_1:FormatText(StoryNameCfg[381].name)

				arg_475_1.leftNameTxt_.text = var_478_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_3 = arg_475_1:GetWordFromCfg(120021115)
				local var_478_4 = arg_475_1:FormatText(var_478_3.content)

				arg_475_1.text_.text = var_478_4

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021115", "story_v_out_120021.awb") ~= 0 then
					local var_478_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021115", "story_v_out_120021.awb") / 1000

					if var_478_8 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_8 + var_478_0
					end

					if var_478_3.prefab_name ~= "" and arg_475_1.actors_[var_478_3.prefab_name] ~= nil then
						local var_478_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_3.prefab_name].transform, "story_v_out_120021", "120021115", "story_v_out_120021.awb")

						arg_475_1:RecordAudio("120021115", var_478_9)
						arg_475_1:RecordAudio("120021115", var_478_9)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_120021", "120021115", "story_v_out_120021.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_120021", "120021115", "story_v_out_120021.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_10 = math.max(var_478_1, arg_475_1.talkMaxDuration)

			if var_478_0 <= arg_475_1.time_ and arg_475_1.time_ < var_478_0 + var_478_10 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_0) / var_478_10

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_0 + var_478_10 and arg_475_1.time_ < var_478_0 + var_478_10 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play120021116 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 120021116
		arg_479_1.duration_ = 5.666

		local var_479_0 = {
			zh = 5.666,
			ja = 5.433
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
				arg_479_0:Play120021117(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = 0

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_2")
			end

			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 then
				arg_479_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_482_2 = 0
			local var_482_3 = 0.525

			if var_482_2 < arg_479_1.time_ and arg_479_1.time_ <= var_482_2 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_4 = arg_479_1:FormatText(StoryNameCfg[381].name)

				arg_479_1.leftNameTxt_.text = var_482_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_5 = arg_479_1:GetWordFromCfg(120021116)
				local var_482_6 = arg_479_1:FormatText(var_482_5.content)

				arg_479_1.text_.text = var_482_6

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_7 = 21
				local var_482_8 = utf8.len(var_482_6)
				local var_482_9 = var_482_7 <= 0 and var_482_3 or var_482_3 * (var_482_8 / var_482_7)

				if var_482_9 > 0 and var_482_3 < var_482_9 then
					arg_479_1.talkMaxDuration = var_482_9

					if var_482_9 + var_482_2 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_9 + var_482_2
					end
				end

				arg_479_1.text_.text = var_482_6
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021116", "story_v_out_120021.awb") ~= 0 then
					local var_482_10 = manager.audio:GetVoiceLength("story_v_out_120021", "120021116", "story_v_out_120021.awb") / 1000

					if var_482_10 + var_482_2 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_10 + var_482_2
					end

					if var_482_5.prefab_name ~= "" and arg_479_1.actors_[var_482_5.prefab_name] ~= nil then
						local var_482_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_5.prefab_name].transform, "story_v_out_120021", "120021116", "story_v_out_120021.awb")

						arg_479_1:RecordAudio("120021116", var_482_11)
						arg_479_1:RecordAudio("120021116", var_482_11)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_120021", "120021116", "story_v_out_120021.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_120021", "120021116", "story_v_out_120021.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_12 = math.max(var_482_3, arg_479_1.talkMaxDuration)

			if var_482_2 <= arg_479_1.time_ and arg_479_1.time_ < var_482_2 + var_482_12 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_2) / var_482_12

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_2 + var_482_12 and arg_479_1.time_ < var_482_2 + var_482_12 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play120021117 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 120021117
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play120021118(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1075ui_story"]
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 and arg_483_1.var_.characterEffect1075ui_story == nil then
				arg_483_1.var_.characterEffect1075ui_story = var_486_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_2 = 0.2

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2

				if arg_483_1.var_.characterEffect1075ui_story then
					local var_486_4 = Mathf.Lerp(0, 0.5, var_486_3)

					arg_483_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_483_1.var_.characterEffect1075ui_story.fillRatio = var_486_4
				end
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 and arg_483_1.var_.characterEffect1075ui_story then
				local var_486_5 = 0.5

				arg_483_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_483_1.var_.characterEffect1075ui_story.fillRatio = var_486_5
			end

			local var_486_6 = 0
			local var_486_7 = 0.925

			if var_486_6 < arg_483_1.time_ and arg_483_1.time_ <= var_486_6 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, false)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_8 = arg_483_1:GetWordFromCfg(120021117)
				local var_486_9 = arg_483_1:FormatText(var_486_8.content)

				arg_483_1.text_.text = var_486_9

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_10 = 37
				local var_486_11 = utf8.len(var_486_9)
				local var_486_12 = var_486_10 <= 0 and var_486_7 or var_486_7 * (var_486_11 / var_486_10)

				if var_486_12 > 0 and var_486_7 < var_486_12 then
					arg_483_1.talkMaxDuration = var_486_12

					if var_486_12 + var_486_6 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_12 + var_486_6
					end
				end

				arg_483_1.text_.text = var_486_9
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_13 = math.max(var_486_7, arg_483_1.talkMaxDuration)

			if var_486_6 <= arg_483_1.time_ and arg_483_1.time_ < var_486_6 + var_486_13 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_6) / var_486_13

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_6 + var_486_13 and arg_483_1.time_ < var_486_6 + var_486_13 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play120021118 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 120021118
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play120021119(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 0
			local var_490_1 = 1.05

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_2 = arg_487_1:FormatText(StoryNameCfg[7].name)

				arg_487_1.leftNameTxt_.text = var_490_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_3 = arg_487_1:GetWordFromCfg(120021118)
				local var_490_4 = arg_487_1:FormatText(var_490_3.content)

				arg_487_1.text_.text = var_490_4

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_5 = 42
				local var_490_6 = utf8.len(var_490_4)
				local var_490_7 = var_490_5 <= 0 and var_490_1 or var_490_1 * (var_490_6 / var_490_5)

				if var_490_7 > 0 and var_490_1 < var_490_7 then
					arg_487_1.talkMaxDuration = var_490_7

					if var_490_7 + var_490_0 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_7 + var_490_0
					end
				end

				arg_487_1.text_.text = var_490_4
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_8 = math.max(var_490_1, arg_487_1.talkMaxDuration)

			if var_490_0 <= arg_487_1.time_ and arg_487_1.time_ < var_490_0 + var_490_8 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_0) / var_490_8

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_0 + var_490_8 and arg_487_1.time_ < var_490_0 + var_490_8 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play120021119 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 120021119
		arg_491_1.duration_ = 8.7

		local var_491_0 = {
			zh = 3,
			ja = 8.7
		}
		local var_491_1 = manager.audio:GetLocalizationFlag()

		if var_491_0[var_491_1] ~= nil then
			arg_491_1.duration_ = var_491_0[var_491_1]
		end

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play120021120(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1075ui_story"]
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 and arg_491_1.var_.characterEffect1075ui_story == nil then
				arg_491_1.var_.characterEffect1075ui_story = var_494_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_2 = 0.2

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2

				if arg_491_1.var_.characterEffect1075ui_story then
					arg_491_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 and arg_491_1.var_.characterEffect1075ui_story then
				arg_491_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_494_4 = 0
			local var_494_5 = 0.3

			if var_494_4 < arg_491_1.time_ and arg_491_1.time_ <= var_494_4 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_6 = arg_491_1:FormatText(StoryNameCfg[381].name)

				arg_491_1.leftNameTxt_.text = var_494_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_7 = arg_491_1:GetWordFromCfg(120021119)
				local var_494_8 = arg_491_1:FormatText(var_494_7.content)

				arg_491_1.text_.text = var_494_8

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_9 = 12
				local var_494_10 = utf8.len(var_494_8)
				local var_494_11 = var_494_9 <= 0 and var_494_5 or var_494_5 * (var_494_10 / var_494_9)

				if var_494_11 > 0 and var_494_5 < var_494_11 then
					arg_491_1.talkMaxDuration = var_494_11

					if var_494_11 + var_494_4 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_11 + var_494_4
					end
				end

				arg_491_1.text_.text = var_494_8
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021119", "story_v_out_120021.awb") ~= 0 then
					local var_494_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021119", "story_v_out_120021.awb") / 1000

					if var_494_12 + var_494_4 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_12 + var_494_4
					end

					if var_494_7.prefab_name ~= "" and arg_491_1.actors_[var_494_7.prefab_name] ~= nil then
						local var_494_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_7.prefab_name].transform, "story_v_out_120021", "120021119", "story_v_out_120021.awb")

						arg_491_1:RecordAudio("120021119", var_494_13)
						arg_491_1:RecordAudio("120021119", var_494_13)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_120021", "120021119", "story_v_out_120021.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_120021", "120021119", "story_v_out_120021.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_14 = math.max(var_494_5, arg_491_1.talkMaxDuration)

			if var_494_4 <= arg_491_1.time_ and arg_491_1.time_ < var_494_4 + var_494_14 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_4) / var_494_14

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_4 + var_494_14 and arg_491_1.time_ < var_494_4 + var_494_14 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play120021120 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 120021120
		arg_495_1.duration_ = 12.433

		local var_495_0 = {
			zh = 7.4,
			ja = 12.433
		}
		local var_495_1 = manager.audio:GetLocalizationFlag()

		if var_495_0[var_495_1] ~= nil then
			arg_495_1.duration_ = var_495_0[var_495_1]
		end

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play120021121(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = 0
			local var_498_1 = 0.775

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_2 = arg_495_1:FormatText(StoryNameCfg[381].name)

				arg_495_1.leftNameTxt_.text = var_498_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_3 = arg_495_1:GetWordFromCfg(120021120)
				local var_498_4 = arg_495_1:FormatText(var_498_3.content)

				arg_495_1.text_.text = var_498_4

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_5 = 31
				local var_498_6 = utf8.len(var_498_4)
				local var_498_7 = var_498_5 <= 0 and var_498_1 or var_498_1 * (var_498_6 / var_498_5)

				if var_498_7 > 0 and var_498_1 < var_498_7 then
					arg_495_1.talkMaxDuration = var_498_7

					if var_498_7 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_7 + var_498_0
					end
				end

				arg_495_1.text_.text = var_498_4
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021120", "story_v_out_120021.awb") ~= 0 then
					local var_498_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021120", "story_v_out_120021.awb") / 1000

					if var_498_8 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_8 + var_498_0
					end

					if var_498_3.prefab_name ~= "" and arg_495_1.actors_[var_498_3.prefab_name] ~= nil then
						local var_498_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_3.prefab_name].transform, "story_v_out_120021", "120021120", "story_v_out_120021.awb")

						arg_495_1:RecordAudio("120021120", var_498_9)
						arg_495_1:RecordAudio("120021120", var_498_9)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_120021", "120021120", "story_v_out_120021.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_120021", "120021120", "story_v_out_120021.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_10 = math.max(var_498_1, arg_495_1.talkMaxDuration)

			if var_498_0 <= arg_495_1.time_ and arg_495_1.time_ < var_498_0 + var_498_10 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_0) / var_498_10

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_0 + var_498_10 and arg_495_1.time_ < var_498_0 + var_498_10 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play120021121 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 120021121
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play120021122(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1075ui_story"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 and arg_499_1.var_.characterEffect1075ui_story == nil then
				arg_499_1.var_.characterEffect1075ui_story = var_502_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_2 = 0.2

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2

				if arg_499_1.var_.characterEffect1075ui_story then
					local var_502_4 = Mathf.Lerp(0, 0.5, var_502_3)

					arg_499_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_499_1.var_.characterEffect1075ui_story.fillRatio = var_502_4
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 and arg_499_1.var_.characterEffect1075ui_story then
				local var_502_5 = 0.5

				arg_499_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_499_1.var_.characterEffect1075ui_story.fillRatio = var_502_5
			end

			local var_502_6 = 0

			if var_502_6 < arg_499_1.time_ and arg_499_1.time_ <= var_502_6 + arg_502_0 then
				arg_499_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_502_7 = 0
			local var_502_8 = 0.575

			if var_502_7 < arg_499_1.time_ and arg_499_1.time_ <= var_502_7 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, false)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_9 = arg_499_1:GetWordFromCfg(120021121)
				local var_502_10 = arg_499_1:FormatText(var_502_9.content)

				arg_499_1.text_.text = var_502_10

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_11 = 23
				local var_502_12 = utf8.len(var_502_10)
				local var_502_13 = var_502_11 <= 0 and var_502_8 or var_502_8 * (var_502_12 / var_502_11)

				if var_502_13 > 0 and var_502_8 < var_502_13 then
					arg_499_1.talkMaxDuration = var_502_13

					if var_502_13 + var_502_7 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_13 + var_502_7
					end
				end

				arg_499_1.text_.text = var_502_10
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_14 = math.max(var_502_8, arg_499_1.talkMaxDuration)

			if var_502_7 <= arg_499_1.time_ and arg_499_1.time_ < var_502_7 + var_502_14 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_7) / var_502_14

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_7 + var_502_14 and arg_499_1.time_ < var_502_7 + var_502_14 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play120021122 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 120021122
		arg_503_1.duration_ = 6.7

		local var_503_0 = {
			zh = 3.333,
			ja = 6.7
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
				arg_503_0:Play120021123(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["1075ui_story"]
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 and arg_503_1.var_.characterEffect1075ui_story == nil then
				arg_503_1.var_.characterEffect1075ui_story = var_506_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_2 = 0.2

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2

				if arg_503_1.var_.characterEffect1075ui_story then
					arg_503_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 and arg_503_1.var_.characterEffect1075ui_story then
				arg_503_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_506_4 = 0

			if var_506_4 < arg_503_1.time_ and arg_503_1.time_ <= var_506_4 + arg_506_0 then
				arg_503_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_506_5 = 0

			if var_506_5 < arg_503_1.time_ and arg_503_1.time_ <= var_506_5 + arg_506_0 then
				arg_503_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action6_1")
			end

			local var_506_6 = 0
			local var_506_7 = 0.425

			if var_506_6 < arg_503_1.time_ and arg_503_1.time_ <= var_506_6 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_8 = arg_503_1:FormatText(StoryNameCfg[381].name)

				arg_503_1.leftNameTxt_.text = var_506_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_9 = arg_503_1:GetWordFromCfg(120021122)
				local var_506_10 = arg_503_1:FormatText(var_506_9.content)

				arg_503_1.text_.text = var_506_10

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_11 = 17
				local var_506_12 = utf8.len(var_506_10)
				local var_506_13 = var_506_11 <= 0 and var_506_7 or var_506_7 * (var_506_12 / var_506_11)

				if var_506_13 > 0 and var_506_7 < var_506_13 then
					arg_503_1.talkMaxDuration = var_506_13

					if var_506_13 + var_506_6 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_13 + var_506_6
					end
				end

				arg_503_1.text_.text = var_506_10
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021122", "story_v_out_120021.awb") ~= 0 then
					local var_506_14 = manager.audio:GetVoiceLength("story_v_out_120021", "120021122", "story_v_out_120021.awb") / 1000

					if var_506_14 + var_506_6 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_14 + var_506_6
					end

					if var_506_9.prefab_name ~= "" and arg_503_1.actors_[var_506_9.prefab_name] ~= nil then
						local var_506_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_9.prefab_name].transform, "story_v_out_120021", "120021122", "story_v_out_120021.awb")

						arg_503_1:RecordAudio("120021122", var_506_15)
						arg_503_1:RecordAudio("120021122", var_506_15)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_out_120021", "120021122", "story_v_out_120021.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_out_120021", "120021122", "story_v_out_120021.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_16 = math.max(var_506_7, arg_503_1.talkMaxDuration)

			if var_506_6 <= arg_503_1.time_ and arg_503_1.time_ < var_506_6 + var_506_16 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_6) / var_506_16

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_6 + var_506_16 and arg_503_1.time_ < var_506_6 + var_506_16 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play120021123 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 120021123
		arg_507_1.duration_ = 15.233

		local var_507_0 = {
			zh = 9.966,
			ja = 15.233
		}
		local var_507_1 = manager.audio:GetLocalizationFlag()

		if var_507_0[var_507_1] ~= nil then
			arg_507_1.duration_ = var_507_0[var_507_1]
		end

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play120021124(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = 0

			if var_510_0 < arg_507_1.time_ and arg_507_1.time_ <= var_510_0 + arg_510_0 then
				arg_507_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_510_1 = 0
			local var_510_2 = 1.1

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_3 = arg_507_1:FormatText(StoryNameCfg[381].name)

				arg_507_1.leftNameTxt_.text = var_510_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_4 = arg_507_1:GetWordFromCfg(120021123)
				local var_510_5 = arg_507_1:FormatText(var_510_4.content)

				arg_507_1.text_.text = var_510_5

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_6 = 44
				local var_510_7 = utf8.len(var_510_5)
				local var_510_8 = var_510_6 <= 0 and var_510_2 or var_510_2 * (var_510_7 / var_510_6)

				if var_510_8 > 0 and var_510_2 < var_510_8 then
					arg_507_1.talkMaxDuration = var_510_8

					if var_510_8 + var_510_1 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_8 + var_510_1
					end
				end

				arg_507_1.text_.text = var_510_5
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021123", "story_v_out_120021.awb") ~= 0 then
					local var_510_9 = manager.audio:GetVoiceLength("story_v_out_120021", "120021123", "story_v_out_120021.awb") / 1000

					if var_510_9 + var_510_1 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_9 + var_510_1
					end

					if var_510_4.prefab_name ~= "" and arg_507_1.actors_[var_510_4.prefab_name] ~= nil then
						local var_510_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_4.prefab_name].transform, "story_v_out_120021", "120021123", "story_v_out_120021.awb")

						arg_507_1:RecordAudio("120021123", var_510_10)
						arg_507_1:RecordAudio("120021123", var_510_10)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_120021", "120021123", "story_v_out_120021.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_120021", "120021123", "story_v_out_120021.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_11 = math.max(var_510_2, arg_507_1.talkMaxDuration)

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_11 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_1) / var_510_11

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_1 + var_510_11 and arg_507_1.time_ < var_510_1 + var_510_11 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play120021124 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 120021124
		arg_511_1.duration_ = 20.933

		local var_511_0 = {
			zh = 8.966,
			ja = 20.933
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
				arg_511_0:Play120021125(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = 0

			if var_514_0 < arg_511_1.time_ and arg_511_1.time_ <= var_514_0 + arg_514_0 then
				arg_511_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				arg_511_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action6_2")
			end

			local var_514_2 = 0
			local var_514_3 = 1

			if var_514_2 < arg_511_1.time_ and arg_511_1.time_ <= var_514_2 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_4 = arg_511_1:FormatText(StoryNameCfg[381].name)

				arg_511_1.leftNameTxt_.text = var_514_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_5 = arg_511_1:GetWordFromCfg(120021124)
				local var_514_6 = arg_511_1:FormatText(var_514_5.content)

				arg_511_1.text_.text = var_514_6

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_7 = 40
				local var_514_8 = utf8.len(var_514_6)
				local var_514_9 = var_514_7 <= 0 and var_514_3 or var_514_3 * (var_514_8 / var_514_7)

				if var_514_9 > 0 and var_514_3 < var_514_9 then
					arg_511_1.talkMaxDuration = var_514_9

					if var_514_9 + var_514_2 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_9 + var_514_2
					end
				end

				arg_511_1.text_.text = var_514_6
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021124", "story_v_out_120021.awb") ~= 0 then
					local var_514_10 = manager.audio:GetVoiceLength("story_v_out_120021", "120021124", "story_v_out_120021.awb") / 1000

					if var_514_10 + var_514_2 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_10 + var_514_2
					end

					if var_514_5.prefab_name ~= "" and arg_511_1.actors_[var_514_5.prefab_name] ~= nil then
						local var_514_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_5.prefab_name].transform, "story_v_out_120021", "120021124", "story_v_out_120021.awb")

						arg_511_1:RecordAudio("120021124", var_514_11)
						arg_511_1:RecordAudio("120021124", var_514_11)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_120021", "120021124", "story_v_out_120021.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_120021", "120021124", "story_v_out_120021.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_12 = math.max(var_514_3, arg_511_1.talkMaxDuration)

			if var_514_2 <= arg_511_1.time_ and arg_511_1.time_ < var_514_2 + var_514_12 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_2) / var_514_12

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_2 + var_514_12 and arg_511_1.time_ < var_514_2 + var_514_12 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play120021125 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 120021125
		arg_515_1.duration_ = 7.466

		local var_515_0 = {
			zh = 7.466,
			ja = 6.133
		}
		local var_515_1 = manager.audio:GetLocalizationFlag()

		if var_515_0[var_515_1] ~= nil then
			arg_515_1.duration_ = var_515_0[var_515_1]
		end

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play120021126(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = 0
			local var_518_1 = 0.725

			if var_518_0 < arg_515_1.time_ and arg_515_1.time_ <= var_518_0 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_2 = arg_515_1:FormatText(StoryNameCfg[381].name)

				arg_515_1.leftNameTxt_.text = var_518_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_3 = arg_515_1:GetWordFromCfg(120021125)
				local var_518_4 = arg_515_1:FormatText(var_518_3.content)

				arg_515_1.text_.text = var_518_4

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_5 = 29
				local var_518_6 = utf8.len(var_518_4)
				local var_518_7 = var_518_5 <= 0 and var_518_1 or var_518_1 * (var_518_6 / var_518_5)

				if var_518_7 > 0 and var_518_1 < var_518_7 then
					arg_515_1.talkMaxDuration = var_518_7

					if var_518_7 + var_518_0 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_7 + var_518_0
					end
				end

				arg_515_1.text_.text = var_518_4
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021125", "story_v_out_120021.awb") ~= 0 then
					local var_518_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021125", "story_v_out_120021.awb") / 1000

					if var_518_8 + var_518_0 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_8 + var_518_0
					end

					if var_518_3.prefab_name ~= "" and arg_515_1.actors_[var_518_3.prefab_name] ~= nil then
						local var_518_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_3.prefab_name].transform, "story_v_out_120021", "120021125", "story_v_out_120021.awb")

						arg_515_1:RecordAudio("120021125", var_518_9)
						arg_515_1:RecordAudio("120021125", var_518_9)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_120021", "120021125", "story_v_out_120021.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_120021", "120021125", "story_v_out_120021.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_10 = math.max(var_518_1, arg_515_1.talkMaxDuration)

			if var_518_0 <= arg_515_1.time_ and arg_515_1.time_ < var_518_0 + var_518_10 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_0) / var_518_10

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_0 + var_518_10 and arg_515_1.time_ < var_518_0 + var_518_10 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play120021126 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 120021126
		arg_519_1.duration_ = 15.066

		local var_519_0 = {
			zh = 9.7,
			ja = 15.066
		}
		local var_519_1 = manager.audio:GetLocalizationFlag()

		if var_519_0[var_519_1] ~= nil then
			arg_519_1.duration_ = var_519_0[var_519_1]
		end

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play120021127(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = 0
			local var_522_1 = 0.95

			if var_522_0 < arg_519_1.time_ and arg_519_1.time_ <= var_522_0 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_2 = arg_519_1:FormatText(StoryNameCfg[381].name)

				arg_519_1.leftNameTxt_.text = var_522_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_3 = arg_519_1:GetWordFromCfg(120021126)
				local var_522_4 = arg_519_1:FormatText(var_522_3.content)

				arg_519_1.text_.text = var_522_4

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_5 = 38
				local var_522_6 = utf8.len(var_522_4)
				local var_522_7 = var_522_5 <= 0 and var_522_1 or var_522_1 * (var_522_6 / var_522_5)

				if var_522_7 > 0 and var_522_1 < var_522_7 then
					arg_519_1.talkMaxDuration = var_522_7

					if var_522_7 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_7 + var_522_0
					end
				end

				arg_519_1.text_.text = var_522_4
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021126", "story_v_out_120021.awb") ~= 0 then
					local var_522_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021126", "story_v_out_120021.awb") / 1000

					if var_522_8 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_8 + var_522_0
					end

					if var_522_3.prefab_name ~= "" and arg_519_1.actors_[var_522_3.prefab_name] ~= nil then
						local var_522_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_3.prefab_name].transform, "story_v_out_120021", "120021126", "story_v_out_120021.awb")

						arg_519_1:RecordAudio("120021126", var_522_9)
						arg_519_1:RecordAudio("120021126", var_522_9)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_120021", "120021126", "story_v_out_120021.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_120021", "120021126", "story_v_out_120021.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_10 = math.max(var_522_1, arg_519_1.talkMaxDuration)

			if var_522_0 <= arg_519_1.time_ and arg_519_1.time_ < var_522_0 + var_522_10 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_0) / var_522_10

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_0 + var_522_10 and arg_519_1.time_ < var_522_0 + var_522_10 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play120021127 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 120021127
		arg_523_1.duration_ = 15.433

		local var_523_0 = {
			zh = 9.8,
			ja = 15.433
		}
		local var_523_1 = manager.audio:GetLocalizationFlag()

		if var_523_0[var_523_1] ~= nil then
			arg_523_1.duration_ = var_523_0[var_523_1]
		end

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play120021128(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = 0

			if var_526_0 < arg_523_1.time_ and arg_523_1.time_ <= var_526_0 + arg_526_0 then
				arg_523_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 then
				arg_523_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action3_1")
			end

			local var_526_2 = 0
			local var_526_3 = 0.95

			if var_526_2 < arg_523_1.time_ and arg_523_1.time_ <= var_526_2 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_4 = arg_523_1:FormatText(StoryNameCfg[381].name)

				arg_523_1.leftNameTxt_.text = var_526_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_5 = arg_523_1:GetWordFromCfg(120021127)
				local var_526_6 = arg_523_1:FormatText(var_526_5.content)

				arg_523_1.text_.text = var_526_6

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_7 = 38
				local var_526_8 = utf8.len(var_526_6)
				local var_526_9 = var_526_7 <= 0 and var_526_3 or var_526_3 * (var_526_8 / var_526_7)

				if var_526_9 > 0 and var_526_3 < var_526_9 then
					arg_523_1.talkMaxDuration = var_526_9

					if var_526_9 + var_526_2 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_9 + var_526_2
					end
				end

				arg_523_1.text_.text = var_526_6
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021127", "story_v_out_120021.awb") ~= 0 then
					local var_526_10 = manager.audio:GetVoiceLength("story_v_out_120021", "120021127", "story_v_out_120021.awb") / 1000

					if var_526_10 + var_526_2 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_10 + var_526_2
					end

					if var_526_5.prefab_name ~= "" and arg_523_1.actors_[var_526_5.prefab_name] ~= nil then
						local var_526_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_523_1.actors_[var_526_5.prefab_name].transform, "story_v_out_120021", "120021127", "story_v_out_120021.awb")

						arg_523_1:RecordAudio("120021127", var_526_11)
						arg_523_1:RecordAudio("120021127", var_526_11)
					else
						arg_523_1:AudioAction("play", "voice", "story_v_out_120021", "120021127", "story_v_out_120021.awb")
					end

					arg_523_1:RecordHistoryTalkVoice("story_v_out_120021", "120021127", "story_v_out_120021.awb")
				end

				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_12 = math.max(var_526_3, arg_523_1.talkMaxDuration)

			if var_526_2 <= arg_523_1.time_ and arg_523_1.time_ < var_526_2 + var_526_12 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_2) / var_526_12

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_2 + var_526_12 and arg_523_1.time_ < var_526_2 + var_526_12 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play120021128 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 120021128
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play120021129(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = arg_527_1.actors_["1075ui_story"]
			local var_530_1 = 0

			if var_530_1 < arg_527_1.time_ and arg_527_1.time_ <= var_530_1 + arg_530_0 and arg_527_1.var_.characterEffect1075ui_story == nil then
				arg_527_1.var_.characterEffect1075ui_story = var_530_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_530_2 = 0.2

			if var_530_1 <= arg_527_1.time_ and arg_527_1.time_ < var_530_1 + var_530_2 then
				local var_530_3 = (arg_527_1.time_ - var_530_1) / var_530_2

				if arg_527_1.var_.characterEffect1075ui_story then
					local var_530_4 = Mathf.Lerp(0, 0.5, var_530_3)

					arg_527_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_527_1.var_.characterEffect1075ui_story.fillRatio = var_530_4
				end
			end

			if arg_527_1.time_ >= var_530_1 + var_530_2 and arg_527_1.time_ < var_530_1 + var_530_2 + arg_530_0 and arg_527_1.var_.characterEffect1075ui_story then
				local var_530_5 = 0.5

				arg_527_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_527_1.var_.characterEffect1075ui_story.fillRatio = var_530_5
			end

			local var_530_6 = 0
			local var_530_7 = 0.6

			if var_530_6 < arg_527_1.time_ and arg_527_1.time_ <= var_530_6 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, false)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_8 = arg_527_1:GetWordFromCfg(120021128)
				local var_530_9 = arg_527_1:FormatText(var_530_8.content)

				arg_527_1.text_.text = var_530_9

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_10 = 24
				local var_530_11 = utf8.len(var_530_9)
				local var_530_12 = var_530_10 <= 0 and var_530_7 or var_530_7 * (var_530_11 / var_530_10)

				if var_530_12 > 0 and var_530_7 < var_530_12 then
					arg_527_1.talkMaxDuration = var_530_12

					if var_530_12 + var_530_6 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_12 + var_530_6
					end
				end

				arg_527_1.text_.text = var_530_9
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)
				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_13 = math.max(var_530_7, arg_527_1.talkMaxDuration)

			if var_530_6 <= arg_527_1.time_ and arg_527_1.time_ < var_530_6 + var_530_13 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_6) / var_530_13

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_6 + var_530_13 and arg_527_1.time_ < var_530_6 + var_530_13 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play120021129 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 120021129
		arg_531_1.duration_ = 5.533

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play120021130(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["1075ui_story"].transform
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 then
				arg_531_1.var_.moveOldPos1075ui_story = var_534_0.localPosition
			end

			local var_534_2 = 0.001

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2
				local var_534_4 = Vector3.New(0, 100, 0)

				var_534_0.localPosition = Vector3.Lerp(arg_531_1.var_.moveOldPos1075ui_story, var_534_4, var_534_3)

				local var_534_5 = manager.ui.mainCamera.transform.position - var_534_0.position

				var_534_0.forward = Vector3.New(var_534_5.x, var_534_5.y, var_534_5.z)

				local var_534_6 = var_534_0.localEulerAngles

				var_534_6.z = 0
				var_534_6.x = 0
				var_534_0.localEulerAngles = var_534_6
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 then
				var_534_0.localPosition = Vector3.New(0, 100, 0)

				local var_534_7 = manager.ui.mainCamera.transform.position - var_534_0.position

				var_534_0.forward = Vector3.New(var_534_7.x, var_534_7.y, var_534_7.z)

				local var_534_8 = var_534_0.localEulerAngles

				var_534_8.z = 0
				var_534_8.x = 0
				var_534_0.localEulerAngles = var_534_8
			end

			local var_534_9 = "1084ui_story"

			if arg_531_1.actors_[var_534_9] == nil then
				local var_534_10 = Object.Instantiate(Asset.Load("Char/" .. var_534_9), arg_531_1.stage_.transform)

				var_534_10.name = var_534_9
				var_534_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_531_1.actors_[var_534_9] = var_534_10

				local var_534_11 = var_534_10:GetComponentInChildren(typeof(CharacterEffect))

				var_534_11.enabled = true

				local var_534_12 = GameObjectTools.GetOrAddComponent(var_534_10, typeof(DynamicBoneHelper))

				if var_534_12 then
					var_534_12:EnableDynamicBone(false)
				end

				arg_531_1:ShowWeapon(var_534_11.transform, false)

				arg_531_1.var_[var_534_9 .. "Animator"] = var_534_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_531_1.var_[var_534_9 .. "Animator"].applyRootMotion = true
				arg_531_1.var_[var_534_9 .. "LipSync"] = var_534_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_534_13 = arg_531_1.actors_["1084ui_story"].transform
			local var_534_14 = 0

			if var_534_14 < arg_531_1.time_ and arg_531_1.time_ <= var_534_14 + arg_534_0 then
				arg_531_1.var_.moveOldPos1084ui_story = var_534_13.localPosition
			end

			local var_534_15 = 0.001

			if var_534_14 <= arg_531_1.time_ and arg_531_1.time_ < var_534_14 + var_534_15 then
				local var_534_16 = (arg_531_1.time_ - var_534_14) / var_534_15
				local var_534_17 = Vector3.New(0, -0.97, -6)

				var_534_13.localPosition = Vector3.Lerp(arg_531_1.var_.moveOldPos1084ui_story, var_534_17, var_534_16)

				local var_534_18 = manager.ui.mainCamera.transform.position - var_534_13.position

				var_534_13.forward = Vector3.New(var_534_18.x, var_534_18.y, var_534_18.z)

				local var_534_19 = var_534_13.localEulerAngles

				var_534_19.z = 0
				var_534_19.x = 0
				var_534_13.localEulerAngles = var_534_19
			end

			if arg_531_1.time_ >= var_534_14 + var_534_15 and arg_531_1.time_ < var_534_14 + var_534_15 + arg_534_0 then
				var_534_13.localPosition = Vector3.New(0, -0.97, -6)

				local var_534_20 = manager.ui.mainCamera.transform.position - var_534_13.position

				var_534_13.forward = Vector3.New(var_534_20.x, var_534_20.y, var_534_20.z)

				local var_534_21 = var_534_13.localEulerAngles

				var_534_21.z = 0
				var_534_21.x = 0
				var_534_13.localEulerAngles = var_534_21
			end

			local var_534_22 = arg_531_1.actors_["1084ui_story"]
			local var_534_23 = 0

			if var_534_23 < arg_531_1.time_ and arg_531_1.time_ <= var_534_23 + arg_534_0 and arg_531_1.var_.characterEffect1084ui_story == nil then
				arg_531_1.var_.characterEffect1084ui_story = var_534_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_534_24 = 0.2

			if var_534_23 <= arg_531_1.time_ and arg_531_1.time_ < var_534_23 + var_534_24 then
				local var_534_25 = (arg_531_1.time_ - var_534_23) / var_534_24

				if arg_531_1.var_.characterEffect1084ui_story then
					arg_531_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_531_1.time_ >= var_534_23 + var_534_24 and arg_531_1.time_ < var_534_23 + var_534_24 + arg_534_0 and arg_531_1.var_.characterEffect1084ui_story then
				arg_531_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_534_26 = 0

			if var_534_26 < arg_531_1.time_ and arg_531_1.time_ <= var_534_26 + arg_534_0 then
				arg_531_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_534_27 = 0

			if var_534_27 < arg_531_1.time_ and arg_531_1.time_ <= var_534_27 + arg_534_0 then
				arg_531_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_534_28 = 0
			local var_534_29 = 0.65

			if var_534_28 < arg_531_1.time_ and arg_531_1.time_ <= var_534_28 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_30 = arg_531_1:FormatText(StoryNameCfg[6].name)

				arg_531_1.leftNameTxt_.text = var_534_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_31 = arg_531_1:GetWordFromCfg(120021129)
				local var_534_32 = arg_531_1:FormatText(var_534_31.content)

				arg_531_1.text_.text = var_534_32

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_33 = 26
				local var_534_34 = utf8.len(var_534_32)
				local var_534_35 = var_534_33 <= 0 and var_534_29 or var_534_29 * (var_534_34 / var_534_33)

				if var_534_35 > 0 and var_534_29 < var_534_35 then
					arg_531_1.talkMaxDuration = var_534_35

					if var_534_35 + var_534_28 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_35 + var_534_28
					end
				end

				arg_531_1.text_.text = var_534_32
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021129", "story_v_out_120021.awb") ~= 0 then
					local var_534_36 = manager.audio:GetVoiceLength("story_v_out_120021", "120021129", "story_v_out_120021.awb") / 1000

					if var_534_36 + var_534_28 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_36 + var_534_28
					end

					if var_534_31.prefab_name ~= "" and arg_531_1.actors_[var_534_31.prefab_name] ~= nil then
						local var_534_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_31.prefab_name].transform, "story_v_out_120021", "120021129", "story_v_out_120021.awb")

						arg_531_1:RecordAudio("120021129", var_534_37)
						arg_531_1:RecordAudio("120021129", var_534_37)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_out_120021", "120021129", "story_v_out_120021.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_out_120021", "120021129", "story_v_out_120021.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_38 = math.max(var_534_29, arg_531_1.talkMaxDuration)

			if var_534_28 <= arg_531_1.time_ and arg_531_1.time_ < var_534_28 + var_534_38 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_28) / var_534_38

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_28 + var_534_38 and arg_531_1.time_ < var_534_28 + var_534_38 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play120021130 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 120021130
		arg_535_1.duration_ = 5

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play120021131(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1084ui_story"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 and arg_535_1.var_.characterEffect1084ui_story == nil then
				arg_535_1.var_.characterEffect1084ui_story = var_538_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_2 = 0.2

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2

				if arg_535_1.var_.characterEffect1084ui_story then
					local var_538_4 = Mathf.Lerp(0, 0.5, var_538_3)

					arg_535_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_535_1.var_.characterEffect1084ui_story.fillRatio = var_538_4
				end
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 and arg_535_1.var_.characterEffect1084ui_story then
				local var_538_5 = 0.5

				arg_535_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_535_1.var_.characterEffect1084ui_story.fillRatio = var_538_5
			end

			local var_538_6 = 0
			local var_538_7 = 0.525

			if var_538_6 < arg_535_1.time_ and arg_535_1.time_ <= var_538_6 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_8 = arg_535_1:FormatText(StoryNameCfg[7].name)

				arg_535_1.leftNameTxt_.text = var_538_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_9 = arg_535_1:GetWordFromCfg(120021130)
				local var_538_10 = arg_535_1:FormatText(var_538_9.content)

				arg_535_1.text_.text = var_538_10

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_11 = 21
				local var_538_12 = utf8.len(var_538_10)
				local var_538_13 = var_538_11 <= 0 and var_538_7 or var_538_7 * (var_538_12 / var_538_11)

				if var_538_13 > 0 and var_538_7 < var_538_13 then
					arg_535_1.talkMaxDuration = var_538_13

					if var_538_13 + var_538_6 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_13 + var_538_6
					end
				end

				arg_535_1.text_.text = var_538_10
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)
				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_14 = math.max(var_538_7, arg_535_1.talkMaxDuration)

			if var_538_6 <= arg_535_1.time_ and arg_535_1.time_ < var_538_6 + var_538_14 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_6) / var_538_14

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_6 + var_538_14 and arg_535_1.time_ < var_538_6 + var_538_14 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play120021131 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 120021131
		arg_539_1.duration_ = 9.566

		local var_539_0 = {
			zh = 8.366,
			ja = 9.566
		}
		local var_539_1 = manager.audio:GetLocalizationFlag()

		if var_539_0[var_539_1] ~= nil then
			arg_539_1.duration_ = var_539_0[var_539_1]
		end

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play120021132(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["1075ui_story"]
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 and arg_539_1.var_.characterEffect1075ui_story == nil then
				arg_539_1.var_.characterEffect1075ui_story = var_542_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_2 = 0.2

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2

				if arg_539_1.var_.characterEffect1075ui_story then
					arg_539_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 and arg_539_1.var_.characterEffect1075ui_story then
				arg_539_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_542_4 = 0

			if var_542_4 < arg_539_1.time_ and arg_539_1.time_ <= var_542_4 + arg_542_0 then
				arg_539_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_542_5 = 0

			if var_542_5 < arg_539_1.time_ and arg_539_1.time_ <= var_542_5 + arg_542_0 then
				arg_539_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_542_6 = arg_539_1.actors_["1084ui_story"].transform
			local var_542_7 = 0

			if var_542_7 < arg_539_1.time_ and arg_539_1.time_ <= var_542_7 + arg_542_0 then
				arg_539_1.var_.moveOldPos1084ui_story = var_542_6.localPosition
			end

			local var_542_8 = 0.001

			if var_542_7 <= arg_539_1.time_ and arg_539_1.time_ < var_542_7 + var_542_8 then
				local var_542_9 = (arg_539_1.time_ - var_542_7) / var_542_8
				local var_542_10 = Vector3.New(0, 100, 0)

				var_542_6.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos1084ui_story, var_542_10, var_542_9)

				local var_542_11 = manager.ui.mainCamera.transform.position - var_542_6.position

				var_542_6.forward = Vector3.New(var_542_11.x, var_542_11.y, var_542_11.z)

				local var_542_12 = var_542_6.localEulerAngles

				var_542_12.z = 0
				var_542_12.x = 0
				var_542_6.localEulerAngles = var_542_12
			end

			if arg_539_1.time_ >= var_542_7 + var_542_8 and arg_539_1.time_ < var_542_7 + var_542_8 + arg_542_0 then
				var_542_6.localPosition = Vector3.New(0, 100, 0)

				local var_542_13 = manager.ui.mainCamera.transform.position - var_542_6.position

				var_542_6.forward = Vector3.New(var_542_13.x, var_542_13.y, var_542_13.z)

				local var_542_14 = var_542_6.localEulerAngles

				var_542_14.z = 0
				var_542_14.x = 0
				var_542_6.localEulerAngles = var_542_14
			end

			local var_542_15 = arg_539_1.actors_["1075ui_story"].transform
			local var_542_16 = 0

			if var_542_16 < arg_539_1.time_ and arg_539_1.time_ <= var_542_16 + arg_542_0 then
				arg_539_1.var_.moveOldPos1075ui_story = var_542_15.localPosition
			end

			local var_542_17 = 0.001

			if var_542_16 <= arg_539_1.time_ and arg_539_1.time_ < var_542_16 + var_542_17 then
				local var_542_18 = (arg_539_1.time_ - var_542_16) / var_542_17
				local var_542_19 = Vector3.New(0, -1.055, -6.16)

				var_542_15.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos1075ui_story, var_542_19, var_542_18)

				local var_542_20 = manager.ui.mainCamera.transform.position - var_542_15.position

				var_542_15.forward = Vector3.New(var_542_20.x, var_542_20.y, var_542_20.z)

				local var_542_21 = var_542_15.localEulerAngles

				var_542_21.z = 0
				var_542_21.x = 0
				var_542_15.localEulerAngles = var_542_21
			end

			if arg_539_1.time_ >= var_542_16 + var_542_17 and arg_539_1.time_ < var_542_16 + var_542_17 + arg_542_0 then
				var_542_15.localPosition = Vector3.New(0, -1.055, -6.16)

				local var_542_22 = manager.ui.mainCamera.transform.position - var_542_15.position

				var_542_15.forward = Vector3.New(var_542_22.x, var_542_22.y, var_542_22.z)

				local var_542_23 = var_542_15.localEulerAngles

				var_542_23.z = 0
				var_542_23.x = 0
				var_542_15.localEulerAngles = var_542_23
			end

			local var_542_24 = 0
			local var_542_25 = 0.925

			if var_542_24 < arg_539_1.time_ and arg_539_1.time_ <= var_542_24 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_26 = arg_539_1:FormatText(StoryNameCfg[381].name)

				arg_539_1.leftNameTxt_.text = var_542_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_27 = arg_539_1:GetWordFromCfg(120021131)
				local var_542_28 = arg_539_1:FormatText(var_542_27.content)

				arg_539_1.text_.text = var_542_28

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_29 = 37
				local var_542_30 = utf8.len(var_542_28)
				local var_542_31 = var_542_29 <= 0 and var_542_25 or var_542_25 * (var_542_30 / var_542_29)

				if var_542_31 > 0 and var_542_25 < var_542_31 then
					arg_539_1.talkMaxDuration = var_542_31

					if var_542_31 + var_542_24 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_31 + var_542_24
					end
				end

				arg_539_1.text_.text = var_542_28
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021131", "story_v_out_120021.awb") ~= 0 then
					local var_542_32 = manager.audio:GetVoiceLength("story_v_out_120021", "120021131", "story_v_out_120021.awb") / 1000

					if var_542_32 + var_542_24 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_32 + var_542_24
					end

					if var_542_27.prefab_name ~= "" and arg_539_1.actors_[var_542_27.prefab_name] ~= nil then
						local var_542_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_27.prefab_name].transform, "story_v_out_120021", "120021131", "story_v_out_120021.awb")

						arg_539_1:RecordAudio("120021131", var_542_33)
						arg_539_1:RecordAudio("120021131", var_542_33)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_out_120021", "120021131", "story_v_out_120021.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_out_120021", "120021131", "story_v_out_120021.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_34 = math.max(var_542_25, arg_539_1.talkMaxDuration)

			if var_542_24 <= arg_539_1.time_ and arg_539_1.time_ < var_542_24 + var_542_34 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_24) / var_542_34

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_24 + var_542_34 and arg_539_1.time_ < var_542_24 + var_542_34 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play120021132 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 120021132
		arg_543_1.duration_ = 16.2

		local var_543_0 = {
			zh = 9.866,
			ja = 16.2
		}
		local var_543_1 = manager.audio:GetLocalizationFlag()

		if var_543_0[var_543_1] ~= nil then
			arg_543_1.duration_ = var_543_0[var_543_1]
		end

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play120021133(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0
			local var_546_1 = 1.125

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_2 = arg_543_1:FormatText(StoryNameCfg[381].name)

				arg_543_1.leftNameTxt_.text = var_546_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_3 = arg_543_1:GetWordFromCfg(120021132)
				local var_546_4 = arg_543_1:FormatText(var_546_3.content)

				arg_543_1.text_.text = var_546_4

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_5 = 45
				local var_546_6 = utf8.len(var_546_4)
				local var_546_7 = var_546_5 <= 0 and var_546_1 or var_546_1 * (var_546_6 / var_546_5)

				if var_546_7 > 0 and var_546_1 < var_546_7 then
					arg_543_1.talkMaxDuration = var_546_7

					if var_546_7 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_7 + var_546_0
					end
				end

				arg_543_1.text_.text = var_546_4
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021132", "story_v_out_120021.awb") ~= 0 then
					local var_546_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021132", "story_v_out_120021.awb") / 1000

					if var_546_8 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_8 + var_546_0
					end

					if var_546_3.prefab_name ~= "" and arg_543_1.actors_[var_546_3.prefab_name] ~= nil then
						local var_546_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_543_1.actors_[var_546_3.prefab_name].transform, "story_v_out_120021", "120021132", "story_v_out_120021.awb")

						arg_543_1:RecordAudio("120021132", var_546_9)
						arg_543_1:RecordAudio("120021132", var_546_9)
					else
						arg_543_1:AudioAction("play", "voice", "story_v_out_120021", "120021132", "story_v_out_120021.awb")
					end

					arg_543_1:RecordHistoryTalkVoice("story_v_out_120021", "120021132", "story_v_out_120021.awb")
				end

				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_10 = math.max(var_546_1, arg_543_1.talkMaxDuration)

			if var_546_0 <= arg_543_1.time_ and arg_543_1.time_ < var_546_0 + var_546_10 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_0) / var_546_10

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_0 + var_546_10 and arg_543_1.time_ < var_546_0 + var_546_10 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play120021133 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 120021133
		arg_547_1.duration_ = 9.5

		local var_547_0 = {
			zh = 9.5,
			ja = 8.433
		}
		local var_547_1 = manager.audio:GetLocalizationFlag()

		if var_547_0[var_547_1] ~= nil then
			arg_547_1.duration_ = var_547_0[var_547_1]
		end

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play120021134(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 1.2

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_2 = arg_547_1:FormatText(StoryNameCfg[381].name)

				arg_547_1.leftNameTxt_.text = var_550_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_3 = arg_547_1:GetWordFromCfg(120021133)
				local var_550_4 = arg_547_1:FormatText(var_550_3.content)

				arg_547_1.text_.text = var_550_4

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_5 = 48
				local var_550_6 = utf8.len(var_550_4)
				local var_550_7 = var_550_5 <= 0 and var_550_1 or var_550_1 * (var_550_6 / var_550_5)

				if var_550_7 > 0 and var_550_1 < var_550_7 then
					arg_547_1.talkMaxDuration = var_550_7

					if var_550_7 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_7 + var_550_0
					end
				end

				arg_547_1.text_.text = var_550_4
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021133", "story_v_out_120021.awb") ~= 0 then
					local var_550_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021133", "story_v_out_120021.awb") / 1000

					if var_550_8 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_8 + var_550_0
					end

					if var_550_3.prefab_name ~= "" and arg_547_1.actors_[var_550_3.prefab_name] ~= nil then
						local var_550_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_3.prefab_name].transform, "story_v_out_120021", "120021133", "story_v_out_120021.awb")

						arg_547_1:RecordAudio("120021133", var_550_9)
						arg_547_1:RecordAudio("120021133", var_550_9)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_out_120021", "120021133", "story_v_out_120021.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_out_120021", "120021133", "story_v_out_120021.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_10 = math.max(var_550_1, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_10 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_0) / var_550_10

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_10 and arg_547_1.time_ < var_550_0 + var_550_10 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play120021134 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 120021134
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play120021135(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["1075ui_story"]
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 and arg_551_1.var_.characterEffect1075ui_story == nil then
				arg_551_1.var_.characterEffect1075ui_story = var_554_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_2 = 0.2

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2

				if arg_551_1.var_.characterEffect1075ui_story then
					local var_554_4 = Mathf.Lerp(0, 0.5, var_554_3)

					arg_551_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_551_1.var_.characterEffect1075ui_story.fillRatio = var_554_4
				end
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 and arg_551_1.var_.characterEffect1075ui_story then
				local var_554_5 = 0.5

				arg_551_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_551_1.var_.characterEffect1075ui_story.fillRatio = var_554_5
			end

			local var_554_6 = 0
			local var_554_7 = 0.175

			if var_554_6 < arg_551_1.time_ and arg_551_1.time_ <= var_554_6 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_8 = arg_551_1:FormatText(StoryNameCfg[7].name)

				arg_551_1.leftNameTxt_.text = var_554_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_9 = arg_551_1:GetWordFromCfg(120021134)
				local var_554_10 = arg_551_1:FormatText(var_554_9.content)

				arg_551_1.text_.text = var_554_10

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_11 = 7
				local var_554_12 = utf8.len(var_554_10)
				local var_554_13 = var_554_11 <= 0 and var_554_7 or var_554_7 * (var_554_12 / var_554_11)

				if var_554_13 > 0 and var_554_7 < var_554_13 then
					arg_551_1.talkMaxDuration = var_554_13

					if var_554_13 + var_554_6 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_13 + var_554_6
					end
				end

				arg_551_1.text_.text = var_554_10
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_14 = math.max(var_554_7, arg_551_1.talkMaxDuration)

			if var_554_6 <= arg_551_1.time_ and arg_551_1.time_ < var_554_6 + var_554_14 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_6) / var_554_14

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_6 + var_554_14 and arg_551_1.time_ < var_554_6 + var_554_14 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play120021135 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 120021135
		arg_555_1.duration_ = 11.3

		local var_555_0 = {
			zh = 8.3,
			ja = 11.3
		}
		local var_555_1 = manager.audio:GetLocalizationFlag()

		if var_555_0[var_555_1] ~= nil then
			arg_555_1.duration_ = var_555_0[var_555_1]
		end

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play120021136(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = arg_555_1.actors_["1075ui_story"]
			local var_558_1 = 0

			if var_558_1 < arg_555_1.time_ and arg_555_1.time_ <= var_558_1 + arg_558_0 and arg_555_1.var_.characterEffect1075ui_story == nil then
				arg_555_1.var_.characterEffect1075ui_story = var_558_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_558_2 = 0.2

			if var_558_1 <= arg_555_1.time_ and arg_555_1.time_ < var_558_1 + var_558_2 then
				local var_558_3 = (arg_555_1.time_ - var_558_1) / var_558_2

				if arg_555_1.var_.characterEffect1075ui_story then
					arg_555_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_555_1.time_ >= var_558_1 + var_558_2 and arg_555_1.time_ < var_558_1 + var_558_2 + arg_558_0 and arg_555_1.var_.characterEffect1075ui_story then
				arg_555_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_558_4 = 0

			if var_558_4 < arg_555_1.time_ and arg_555_1.time_ <= var_558_4 + arg_558_0 then
				arg_555_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_558_5 = 0
			local var_558_6 = 0.875

			if var_558_5 < arg_555_1.time_ and arg_555_1.time_ <= var_558_5 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_7 = arg_555_1:FormatText(StoryNameCfg[381].name)

				arg_555_1.leftNameTxt_.text = var_558_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_8 = arg_555_1:GetWordFromCfg(120021135)
				local var_558_9 = arg_555_1:FormatText(var_558_8.content)

				arg_555_1.text_.text = var_558_9

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_10 = 35
				local var_558_11 = utf8.len(var_558_9)
				local var_558_12 = var_558_10 <= 0 and var_558_6 or var_558_6 * (var_558_11 / var_558_10)

				if var_558_12 > 0 and var_558_6 < var_558_12 then
					arg_555_1.talkMaxDuration = var_558_12

					if var_558_12 + var_558_5 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_12 + var_558_5
					end
				end

				arg_555_1.text_.text = var_558_9
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021135", "story_v_out_120021.awb") ~= 0 then
					local var_558_13 = manager.audio:GetVoiceLength("story_v_out_120021", "120021135", "story_v_out_120021.awb") / 1000

					if var_558_13 + var_558_5 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_13 + var_558_5
					end

					if var_558_8.prefab_name ~= "" and arg_555_1.actors_[var_558_8.prefab_name] ~= nil then
						local var_558_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_555_1.actors_[var_558_8.prefab_name].transform, "story_v_out_120021", "120021135", "story_v_out_120021.awb")

						arg_555_1:RecordAudio("120021135", var_558_14)
						arg_555_1:RecordAudio("120021135", var_558_14)
					else
						arg_555_1:AudioAction("play", "voice", "story_v_out_120021", "120021135", "story_v_out_120021.awb")
					end

					arg_555_1:RecordHistoryTalkVoice("story_v_out_120021", "120021135", "story_v_out_120021.awb")
				end

				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_15 = math.max(var_558_6, arg_555_1.talkMaxDuration)

			if var_558_5 <= arg_555_1.time_ and arg_555_1.time_ < var_558_5 + var_558_15 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_5) / var_558_15

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_5 + var_558_15 and arg_555_1.time_ < var_558_5 + var_558_15 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play120021136 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 120021136
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play120021137(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = arg_559_1.actors_["1075ui_story"]
			local var_562_1 = 0

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 and arg_559_1.var_.characterEffect1075ui_story == nil then
				arg_559_1.var_.characterEffect1075ui_story = var_562_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_562_2 = 0.2

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_2 then
				local var_562_3 = (arg_559_1.time_ - var_562_1) / var_562_2

				if arg_559_1.var_.characterEffect1075ui_story then
					local var_562_4 = Mathf.Lerp(0, 0.5, var_562_3)

					arg_559_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_559_1.var_.characterEffect1075ui_story.fillRatio = var_562_4
				end
			end

			if arg_559_1.time_ >= var_562_1 + var_562_2 and arg_559_1.time_ < var_562_1 + var_562_2 + arg_562_0 and arg_559_1.var_.characterEffect1075ui_story then
				local var_562_5 = 0.5

				arg_559_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_559_1.var_.characterEffect1075ui_story.fillRatio = var_562_5
			end

			local var_562_6 = 0
			local var_562_7 = 0.75

			if var_562_6 < arg_559_1.time_ and arg_559_1.time_ <= var_562_6 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_8 = arg_559_1:FormatText(StoryNameCfg[7].name)

				arg_559_1.leftNameTxt_.text = var_562_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_9 = arg_559_1:GetWordFromCfg(120021136)
				local var_562_10 = arg_559_1:FormatText(var_562_9.content)

				arg_559_1.text_.text = var_562_10

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_11 = 30
				local var_562_12 = utf8.len(var_562_10)
				local var_562_13 = var_562_11 <= 0 and var_562_7 or var_562_7 * (var_562_12 / var_562_11)

				if var_562_13 > 0 and var_562_7 < var_562_13 then
					arg_559_1.talkMaxDuration = var_562_13

					if var_562_13 + var_562_6 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_13 + var_562_6
					end
				end

				arg_559_1.text_.text = var_562_10
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_14 = math.max(var_562_7, arg_559_1.talkMaxDuration)

			if var_562_6 <= arg_559_1.time_ and arg_559_1.time_ < var_562_6 + var_562_14 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_6) / var_562_14

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_6 + var_562_14 and arg_559_1.time_ < var_562_6 + var_562_14 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play120021137 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 120021137
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play120021138(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = 0
			local var_566_1 = 0.275

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_2 = arg_563_1:FormatText(StoryNameCfg[7].name)

				arg_563_1.leftNameTxt_.text = var_566_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_3 = arg_563_1:GetWordFromCfg(120021137)
				local var_566_4 = arg_563_1:FormatText(var_566_3.content)

				arg_563_1.text_.text = var_566_4

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_5 = 11
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
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_8 = math.max(var_566_1, arg_563_1.talkMaxDuration)

			if var_566_0 <= arg_563_1.time_ and arg_563_1.time_ < var_566_0 + var_566_8 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_0) / var_566_8

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_0 + var_566_8 and arg_563_1.time_ < var_566_0 + var_566_8 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play120021138 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 120021138
		arg_567_1.duration_ = 5

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play120021139(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0
			local var_570_1 = 0.425

			if var_570_0 < arg_567_1.time_ and arg_567_1.time_ <= var_570_0 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, false)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_2 = arg_567_1:GetWordFromCfg(120021138)
				local var_570_3 = arg_567_1:FormatText(var_570_2.content)

				arg_567_1.text_.text = var_570_3

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_4 = 17
				local var_570_5 = utf8.len(var_570_3)
				local var_570_6 = var_570_4 <= 0 and var_570_1 or var_570_1 * (var_570_5 / var_570_4)

				if var_570_6 > 0 and var_570_1 < var_570_6 then
					arg_567_1.talkMaxDuration = var_570_6

					if var_570_6 + var_570_0 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_6 + var_570_0
					end
				end

				arg_567_1.text_.text = var_570_3
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)
				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_7 = math.max(var_570_1, arg_567_1.talkMaxDuration)

			if var_570_0 <= arg_567_1.time_ and arg_567_1.time_ < var_570_0 + var_570_7 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_0) / var_570_7

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_0 + var_570_7 and arg_567_1.time_ < var_570_0 + var_570_7 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play120021139 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 120021139
		arg_571_1.duration_ = 3.633

		local var_571_0 = {
			zh = 2.6,
			ja = 3.633
		}
		local var_571_1 = manager.audio:GetLocalizationFlag()

		if var_571_0[var_571_1] ~= nil then
			arg_571_1.duration_ = var_571_0[var_571_1]
		end

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play120021140(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["1075ui_story"]
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 and arg_571_1.var_.characterEffect1075ui_story == nil then
				arg_571_1.var_.characterEffect1075ui_story = var_574_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_2 = 0.2

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2

				if arg_571_1.var_.characterEffect1075ui_story then
					arg_571_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 and arg_571_1.var_.characterEffect1075ui_story then
				arg_571_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_574_4 = 0

			if var_574_4 < arg_571_1.time_ and arg_571_1.time_ <= var_574_4 + arg_574_0 then
				arg_571_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_2")
			end

			local var_574_5 = 0
			local var_574_6 = 0.325

			if var_574_5 < arg_571_1.time_ and arg_571_1.time_ <= var_574_5 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_7 = arg_571_1:FormatText(StoryNameCfg[381].name)

				arg_571_1.leftNameTxt_.text = var_574_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_8 = arg_571_1:GetWordFromCfg(120021139)
				local var_574_9 = arg_571_1:FormatText(var_574_8.content)

				arg_571_1.text_.text = var_574_9

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_10 = 13
				local var_574_11 = utf8.len(var_574_9)
				local var_574_12 = var_574_10 <= 0 and var_574_6 or var_574_6 * (var_574_11 / var_574_10)

				if var_574_12 > 0 and var_574_6 < var_574_12 then
					arg_571_1.talkMaxDuration = var_574_12

					if var_574_12 + var_574_5 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_12 + var_574_5
					end
				end

				arg_571_1.text_.text = var_574_9
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021139", "story_v_out_120021.awb") ~= 0 then
					local var_574_13 = manager.audio:GetVoiceLength("story_v_out_120021", "120021139", "story_v_out_120021.awb") / 1000

					if var_574_13 + var_574_5 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_13 + var_574_5
					end

					if var_574_8.prefab_name ~= "" and arg_571_1.actors_[var_574_8.prefab_name] ~= nil then
						local var_574_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_571_1.actors_[var_574_8.prefab_name].transform, "story_v_out_120021", "120021139", "story_v_out_120021.awb")

						arg_571_1:RecordAudio("120021139", var_574_14)
						arg_571_1:RecordAudio("120021139", var_574_14)
					else
						arg_571_1:AudioAction("play", "voice", "story_v_out_120021", "120021139", "story_v_out_120021.awb")
					end

					arg_571_1:RecordHistoryTalkVoice("story_v_out_120021", "120021139", "story_v_out_120021.awb")
				end

				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_15 = math.max(var_574_6, arg_571_1.talkMaxDuration)

			if var_574_5 <= arg_571_1.time_ and arg_571_1.time_ < var_574_5 + var_574_15 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_5) / var_574_15

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_5 + var_574_15 and arg_571_1.time_ < var_574_5 + var_574_15 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play120021140 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 120021140
		arg_575_1.duration_ = 5

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play120021141(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = arg_575_1.actors_["1075ui_story"]
			local var_578_1 = 0

			if var_578_1 < arg_575_1.time_ and arg_575_1.time_ <= var_578_1 + arg_578_0 and arg_575_1.var_.characterEffect1075ui_story == nil then
				arg_575_1.var_.characterEffect1075ui_story = var_578_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_578_2 = 0.2

			if var_578_1 <= arg_575_1.time_ and arg_575_1.time_ < var_578_1 + var_578_2 then
				local var_578_3 = (arg_575_1.time_ - var_578_1) / var_578_2

				if arg_575_1.var_.characterEffect1075ui_story then
					local var_578_4 = Mathf.Lerp(0, 0.5, var_578_3)

					arg_575_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_575_1.var_.characterEffect1075ui_story.fillRatio = var_578_4
				end
			end

			if arg_575_1.time_ >= var_578_1 + var_578_2 and arg_575_1.time_ < var_578_1 + var_578_2 + arg_578_0 and arg_575_1.var_.characterEffect1075ui_story then
				local var_578_5 = 0.5

				arg_575_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_575_1.var_.characterEffect1075ui_story.fillRatio = var_578_5
			end

			local var_578_6 = 0
			local var_578_7 = 0.625

			if var_578_6 < arg_575_1.time_ and arg_575_1.time_ <= var_578_6 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, true)

				local var_578_8 = arg_575_1:FormatText(StoryNameCfg[7].name)

				arg_575_1.leftNameTxt_.text = var_578_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_575_1.leftNameTxt_.transform)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1.leftNameTxt_.text)
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_9 = arg_575_1:GetWordFromCfg(120021140)
				local var_578_10 = arg_575_1:FormatText(var_578_9.content)

				arg_575_1.text_.text = var_578_10

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_11 = 25
				local var_578_12 = utf8.len(var_578_10)
				local var_578_13 = var_578_11 <= 0 and var_578_7 or var_578_7 * (var_578_12 / var_578_11)

				if var_578_13 > 0 and var_578_7 < var_578_13 then
					arg_575_1.talkMaxDuration = var_578_13

					if var_578_13 + var_578_6 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_13 + var_578_6
					end
				end

				arg_575_1.text_.text = var_578_10
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)
				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_14 = math.max(var_578_7, arg_575_1.talkMaxDuration)

			if var_578_6 <= arg_575_1.time_ and arg_575_1.time_ < var_578_6 + var_578_14 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_6) / var_578_14

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_6 + var_578_14 and arg_575_1.time_ < var_578_6 + var_578_14 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play120021141 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 120021141
		arg_579_1.duration_ = 5

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play120021142(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = 0
			local var_582_1 = 1

			if var_582_0 < arg_579_1.time_ and arg_579_1.time_ <= var_582_0 + arg_582_0 then
				local var_582_2 = "play"
				local var_582_3 = "effect"

				arg_579_1:AudioAction(var_582_2, var_582_3, "se_story_10", "se_story_10_UI", "")
			end

			local var_582_4 = 0
			local var_582_5 = 0.875

			if var_582_4 < arg_579_1.time_ and arg_579_1.time_ <= var_582_4 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, false)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_6 = arg_579_1:GetWordFromCfg(120021141)
				local var_582_7 = arg_579_1:FormatText(var_582_6.content)

				arg_579_1.text_.text = var_582_7

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_8 = 35
				local var_582_9 = utf8.len(var_582_7)
				local var_582_10 = var_582_8 <= 0 and var_582_5 or var_582_5 * (var_582_9 / var_582_8)

				if var_582_10 > 0 and var_582_5 < var_582_10 then
					arg_579_1.talkMaxDuration = var_582_10

					if var_582_10 + var_582_4 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_10 + var_582_4
					end
				end

				arg_579_1.text_.text = var_582_7
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)
				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_11 = math.max(var_582_5, arg_579_1.talkMaxDuration)

			if var_582_4 <= arg_579_1.time_ and arg_579_1.time_ < var_582_4 + var_582_11 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_4) / var_582_11

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_4 + var_582_11 and arg_579_1.time_ < var_582_4 + var_582_11 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play120021142 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 120021142
		arg_583_1.duration_ = 6.8

		local var_583_0 = {
			zh = 4.7,
			ja = 6.8
		}
		local var_583_1 = manager.audio:GetLocalizationFlag()

		if var_583_0[var_583_1] ~= nil then
			arg_583_1.duration_ = var_583_0[var_583_1]
		end

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play120021143(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1075ui_story"].transform
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 then
				arg_583_1.var_.moveOldPos1075ui_story = var_586_0.localPosition
			end

			local var_586_2 = 0.001

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2
				local var_586_4 = Vector3.New(-0.7, -1.055, -6.16)

				var_586_0.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos1075ui_story, var_586_4, var_586_3)

				local var_586_5 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_5.x, var_586_5.y, var_586_5.z)

				local var_586_6 = var_586_0.localEulerAngles

				var_586_6.z = 0
				var_586_6.x = 0
				var_586_0.localEulerAngles = var_586_6
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 then
				var_586_0.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_586_7 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_7.x, var_586_7.y, var_586_7.z)

				local var_586_8 = var_586_0.localEulerAngles

				var_586_8.z = 0
				var_586_8.x = 0
				var_586_0.localEulerAngles = var_586_8
			end

			local var_586_9 = arg_583_1.actors_["10044ui_story"].transform
			local var_586_10 = 0

			if var_586_10 < arg_583_1.time_ and arg_583_1.time_ <= var_586_10 + arg_586_0 then
				arg_583_1.var_.moveOldPos10044ui_story = var_586_9.localPosition
			end

			local var_586_11 = 0.001

			if var_586_10 <= arg_583_1.time_ and arg_583_1.time_ < var_586_10 + var_586_11 then
				local var_586_12 = (arg_583_1.time_ - var_586_10) / var_586_11
				local var_586_13 = Vector3.New(0.7, -0.72, -6.3)

				var_586_9.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos10044ui_story, var_586_13, var_586_12)

				local var_586_14 = manager.ui.mainCamera.transform.position - var_586_9.position

				var_586_9.forward = Vector3.New(var_586_14.x, var_586_14.y, var_586_14.z)

				local var_586_15 = var_586_9.localEulerAngles

				var_586_15.z = 0
				var_586_15.x = 0
				var_586_9.localEulerAngles = var_586_15
			end

			if arg_583_1.time_ >= var_586_10 + var_586_11 and arg_583_1.time_ < var_586_10 + var_586_11 + arg_586_0 then
				var_586_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_586_16 = manager.ui.mainCamera.transform.position - var_586_9.position

				var_586_9.forward = Vector3.New(var_586_16.x, var_586_16.y, var_586_16.z)

				local var_586_17 = var_586_9.localEulerAngles

				var_586_17.z = 0
				var_586_17.x = 0
				var_586_9.localEulerAngles = var_586_17
			end

			local var_586_18 = arg_583_1.actors_["10044ui_story"]
			local var_586_19 = 0

			if var_586_19 < arg_583_1.time_ and arg_583_1.time_ <= var_586_19 + arg_586_0 and arg_583_1.var_.characterEffect10044ui_story == nil then
				arg_583_1.var_.characterEffect10044ui_story = var_586_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_20 = 0.2

			if var_586_19 <= arg_583_1.time_ and arg_583_1.time_ < var_586_19 + var_586_20 then
				local var_586_21 = (arg_583_1.time_ - var_586_19) / var_586_20

				if arg_583_1.var_.characterEffect10044ui_story then
					arg_583_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_583_1.time_ >= var_586_19 + var_586_20 and arg_583_1.time_ < var_586_19 + var_586_20 + arg_586_0 and arg_583_1.var_.characterEffect10044ui_story then
				arg_583_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_586_22 = 0

			if var_586_22 < arg_583_1.time_ and arg_583_1.time_ <= var_586_22 + arg_586_0 then
				arg_583_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action5_1")
			end

			local var_586_23 = 0

			if var_586_23 < arg_583_1.time_ and arg_583_1.time_ <= var_586_23 + arg_586_0 then
				arg_583_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_586_24 = 0
			local var_586_25 = 0.4

			if var_586_24 < arg_583_1.time_ and arg_583_1.time_ <= var_586_24 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, true)

				local var_586_26 = arg_583_1:FormatText(StoryNameCfg[380].name)

				arg_583_1.leftNameTxt_.text = var_586_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_583_1.leftNameTxt_.transform)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1.leftNameTxt_.text)
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_27 = arg_583_1:GetWordFromCfg(120021142)
				local var_586_28 = arg_583_1:FormatText(var_586_27.content)

				arg_583_1.text_.text = var_586_28

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_29 = 16
				local var_586_30 = utf8.len(var_586_28)
				local var_586_31 = var_586_29 <= 0 and var_586_25 or var_586_25 * (var_586_30 / var_586_29)

				if var_586_31 > 0 and var_586_25 < var_586_31 then
					arg_583_1.talkMaxDuration = var_586_31

					if var_586_31 + var_586_24 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_31 + var_586_24
					end
				end

				arg_583_1.text_.text = var_586_28
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021142", "story_v_out_120021.awb") ~= 0 then
					local var_586_32 = manager.audio:GetVoiceLength("story_v_out_120021", "120021142", "story_v_out_120021.awb") / 1000

					if var_586_32 + var_586_24 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_32 + var_586_24
					end

					if var_586_27.prefab_name ~= "" and arg_583_1.actors_[var_586_27.prefab_name] ~= nil then
						local var_586_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_583_1.actors_[var_586_27.prefab_name].transform, "story_v_out_120021", "120021142", "story_v_out_120021.awb")

						arg_583_1:RecordAudio("120021142", var_586_33)
						arg_583_1:RecordAudio("120021142", var_586_33)
					else
						arg_583_1:AudioAction("play", "voice", "story_v_out_120021", "120021142", "story_v_out_120021.awb")
					end

					arg_583_1:RecordHistoryTalkVoice("story_v_out_120021", "120021142", "story_v_out_120021.awb")
				end

				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_34 = math.max(var_586_25, arg_583_1.talkMaxDuration)

			if var_586_24 <= arg_583_1.time_ and arg_583_1.time_ < var_586_24 + var_586_34 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_24) / var_586_34

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_24 + var_586_34 and arg_583_1.time_ < var_586_24 + var_586_34 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play120021143 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 120021143
		arg_587_1.duration_ = 5

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play120021144(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = arg_587_1.actors_["10044ui_story"]
			local var_590_1 = 0

			if var_590_1 < arg_587_1.time_ and arg_587_1.time_ <= var_590_1 + arg_590_0 and arg_587_1.var_.characterEffect10044ui_story == nil then
				arg_587_1.var_.characterEffect10044ui_story = var_590_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_590_2 = 0.2

			if var_590_1 <= arg_587_1.time_ and arg_587_1.time_ < var_590_1 + var_590_2 then
				local var_590_3 = (arg_587_1.time_ - var_590_1) / var_590_2

				if arg_587_1.var_.characterEffect10044ui_story then
					local var_590_4 = Mathf.Lerp(0, 0.5, var_590_3)

					arg_587_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_587_1.var_.characterEffect10044ui_story.fillRatio = var_590_4
				end
			end

			if arg_587_1.time_ >= var_590_1 + var_590_2 and arg_587_1.time_ < var_590_1 + var_590_2 + arg_590_0 and arg_587_1.var_.characterEffect10044ui_story then
				local var_590_5 = 0.5

				arg_587_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_587_1.var_.characterEffect10044ui_story.fillRatio = var_590_5
			end

			local var_590_6 = 0
			local var_590_7 = 1.025

			if var_590_6 < arg_587_1.time_ and arg_587_1.time_ <= var_590_6 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_8 = arg_587_1:FormatText(StoryNameCfg[7].name)

				arg_587_1.leftNameTxt_.text = var_590_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_9 = arg_587_1:GetWordFromCfg(120021143)
				local var_590_10 = arg_587_1:FormatText(var_590_9.content)

				arg_587_1.text_.text = var_590_10

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_11 = 41
				local var_590_12 = utf8.len(var_590_10)
				local var_590_13 = var_590_11 <= 0 and var_590_7 or var_590_7 * (var_590_12 / var_590_11)

				if var_590_13 > 0 and var_590_7 < var_590_13 then
					arg_587_1.talkMaxDuration = var_590_13

					if var_590_13 + var_590_6 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_13 + var_590_6
					end
				end

				arg_587_1.text_.text = var_590_10
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)
				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_14 = math.max(var_590_7, arg_587_1.talkMaxDuration)

			if var_590_6 <= arg_587_1.time_ and arg_587_1.time_ < var_590_6 + var_590_14 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_6) / var_590_14

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_6 + var_590_14 and arg_587_1.time_ < var_590_6 + var_590_14 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play120021144 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 120021144
		arg_591_1.duration_ = 5

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play120021145(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = 0
			local var_594_1 = 1.15

			if var_594_0 < arg_591_1.time_ and arg_591_1.time_ <= var_594_0 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_2 = arg_591_1:FormatText(StoryNameCfg[7].name)

				arg_591_1.leftNameTxt_.text = var_594_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_3 = arg_591_1:GetWordFromCfg(120021144)
				local var_594_4 = arg_591_1:FormatText(var_594_3.content)

				arg_591_1.text_.text = var_594_4

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_5 = 46
				local var_594_6 = utf8.len(var_594_4)
				local var_594_7 = var_594_5 <= 0 and var_594_1 or var_594_1 * (var_594_6 / var_594_5)

				if var_594_7 > 0 and var_594_1 < var_594_7 then
					arg_591_1.talkMaxDuration = var_594_7

					if var_594_7 + var_594_0 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_7 + var_594_0
					end
				end

				arg_591_1.text_.text = var_594_4
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)
				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_8 = math.max(var_594_1, arg_591_1.talkMaxDuration)

			if var_594_0 <= arg_591_1.time_ and arg_591_1.time_ < var_594_0 + var_594_8 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_0) / var_594_8

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_0 + var_594_8 and arg_591_1.time_ < var_594_0 + var_594_8 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play120021145 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 120021145
		arg_595_1.duration_ = 10.466

		local var_595_0 = {
			zh = 8.266,
			ja = 10.466
		}
		local var_595_1 = manager.audio:GetLocalizationFlag()

		if var_595_0[var_595_1] ~= nil then
			arg_595_1.duration_ = var_595_0[var_595_1]
		end

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play120021146(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["1075ui_story"]
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 and arg_595_1.var_.characterEffect1075ui_story == nil then
				arg_595_1.var_.characterEffect1075ui_story = var_598_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_2 = 0.2

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2

				if arg_595_1.var_.characterEffect1075ui_story then
					arg_595_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 and arg_595_1.var_.characterEffect1075ui_story then
				arg_595_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_598_4 = 0

			if var_598_4 < arg_595_1.time_ and arg_595_1.time_ <= var_598_4 + arg_598_0 then
				arg_595_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action5_2")
			end

			local var_598_5 = 0
			local var_598_6 = 0.85

			if var_598_5 < arg_595_1.time_ and arg_595_1.time_ <= var_598_5 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, true)

				local var_598_7 = arg_595_1:FormatText(StoryNameCfg[381].name)

				arg_595_1.leftNameTxt_.text = var_598_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_595_1.leftNameTxt_.transform)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1.leftNameTxt_.text)
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_8 = arg_595_1:GetWordFromCfg(120021145)
				local var_598_9 = arg_595_1:FormatText(var_598_8.content)

				arg_595_1.text_.text = var_598_9

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_10 = 34
				local var_598_11 = utf8.len(var_598_9)
				local var_598_12 = var_598_10 <= 0 and var_598_6 or var_598_6 * (var_598_11 / var_598_10)

				if var_598_12 > 0 and var_598_6 < var_598_12 then
					arg_595_1.talkMaxDuration = var_598_12

					if var_598_12 + var_598_5 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_12 + var_598_5
					end
				end

				arg_595_1.text_.text = var_598_9
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021145", "story_v_out_120021.awb") ~= 0 then
					local var_598_13 = manager.audio:GetVoiceLength("story_v_out_120021", "120021145", "story_v_out_120021.awb") / 1000

					if var_598_13 + var_598_5 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_13 + var_598_5
					end

					if var_598_8.prefab_name ~= "" and arg_595_1.actors_[var_598_8.prefab_name] ~= nil then
						local var_598_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_595_1.actors_[var_598_8.prefab_name].transform, "story_v_out_120021", "120021145", "story_v_out_120021.awb")

						arg_595_1:RecordAudio("120021145", var_598_14)
						arg_595_1:RecordAudio("120021145", var_598_14)
					else
						arg_595_1:AudioAction("play", "voice", "story_v_out_120021", "120021145", "story_v_out_120021.awb")
					end

					arg_595_1:RecordHistoryTalkVoice("story_v_out_120021", "120021145", "story_v_out_120021.awb")
				end

				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_15 = math.max(var_598_6, arg_595_1.talkMaxDuration)

			if var_598_5 <= arg_595_1.time_ and arg_595_1.time_ < var_598_5 + var_598_15 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_5) / var_598_15

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_5 + var_598_15 and arg_595_1.time_ < var_598_5 + var_598_15 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play120021146 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 120021146
		arg_599_1.duration_ = 5

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play120021147(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = arg_599_1.actors_["1075ui_story"]
			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 and arg_599_1.var_.characterEffect1075ui_story == nil then
				arg_599_1.var_.characterEffect1075ui_story = var_602_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_2 = 0.2

			if var_602_1 <= arg_599_1.time_ and arg_599_1.time_ < var_602_1 + var_602_2 then
				local var_602_3 = (arg_599_1.time_ - var_602_1) / var_602_2

				if arg_599_1.var_.characterEffect1075ui_story then
					local var_602_4 = Mathf.Lerp(0, 0.5, var_602_3)

					arg_599_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_599_1.var_.characterEffect1075ui_story.fillRatio = var_602_4
				end
			end

			if arg_599_1.time_ >= var_602_1 + var_602_2 and arg_599_1.time_ < var_602_1 + var_602_2 + arg_602_0 and arg_599_1.var_.characterEffect1075ui_story then
				local var_602_5 = 0.5

				arg_599_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_599_1.var_.characterEffect1075ui_story.fillRatio = var_602_5
			end

			local var_602_6 = 0
			local var_602_7 = 1.1

			if var_602_6 < arg_599_1.time_ and arg_599_1.time_ <= var_602_6 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_8 = arg_599_1:FormatText(StoryNameCfg[7].name)

				arg_599_1.leftNameTxt_.text = var_602_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_9 = arg_599_1:GetWordFromCfg(120021146)
				local var_602_10 = arg_599_1:FormatText(var_602_9.content)

				arg_599_1.text_.text = var_602_10

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_11 = 44
				local var_602_12 = utf8.len(var_602_10)
				local var_602_13 = var_602_11 <= 0 and var_602_7 or var_602_7 * (var_602_12 / var_602_11)

				if var_602_13 > 0 and var_602_7 < var_602_13 then
					arg_599_1.talkMaxDuration = var_602_13

					if var_602_13 + var_602_6 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_13 + var_602_6
					end
				end

				arg_599_1.text_.text = var_602_10
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)
				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_14 = math.max(var_602_7, arg_599_1.talkMaxDuration)

			if var_602_6 <= arg_599_1.time_ and arg_599_1.time_ < var_602_6 + var_602_14 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_6) / var_602_14

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_6 + var_602_14 and arg_599_1.time_ < var_602_6 + var_602_14 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play120021147 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 120021147
		arg_603_1.duration_ = 5

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play120021148(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0
			local var_606_1 = 0.8

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

				local var_606_2 = arg_603_1:GetWordFromCfg(120021147)
				local var_606_3 = arg_603_1:FormatText(var_606_2.content)

				arg_603_1.text_.text = var_606_3

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_4 = 32
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
	Play120021148 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 120021148
		arg_607_1.duration_ = 8.7

		local var_607_0 = {
			zh = 6.5,
			ja = 8.7
		}
		local var_607_1 = manager.audio:GetLocalizationFlag()

		if var_607_0[var_607_1] ~= nil then
			arg_607_1.duration_ = var_607_0[var_607_1]
		end

		SetActive(arg_607_1.tipsGo_, false)

		function arg_607_1.onSingleLineFinish_()
			arg_607_1.onSingleLineUpdate_ = nil
			arg_607_1.onSingleLineFinish_ = nil
			arg_607_1.state_ = "waiting"
		end

		function arg_607_1.playNext_(arg_609_0)
			if arg_609_0 == 1 then
				arg_607_0:Play120021149(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["10044ui_story"]
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 and arg_607_1.var_.characterEffect10044ui_story == nil then
				arg_607_1.var_.characterEffect10044ui_story = var_610_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_610_2 = 0.2

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_2 then
				local var_610_3 = (arg_607_1.time_ - var_610_1) / var_610_2

				if arg_607_1.var_.characterEffect10044ui_story then
					arg_607_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_607_1.time_ >= var_610_1 + var_610_2 and arg_607_1.time_ < var_610_1 + var_610_2 + arg_610_0 and arg_607_1.var_.characterEffect10044ui_story then
				arg_607_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_610_4 = 0
			local var_610_5 = 0.7

			if var_610_4 < arg_607_1.time_ and arg_607_1.time_ <= var_610_4 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_6 = arg_607_1:FormatText(StoryNameCfg[380].name)

				arg_607_1.leftNameTxt_.text = var_610_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, false)
				arg_607_1.callingController_:SetSelectedState("normal")

				local var_610_7 = arg_607_1:GetWordFromCfg(120021148)
				local var_610_8 = arg_607_1:FormatText(var_610_7.content)

				arg_607_1.text_.text = var_610_8

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_9 = 28
				local var_610_10 = utf8.len(var_610_8)
				local var_610_11 = var_610_9 <= 0 and var_610_5 or var_610_5 * (var_610_10 / var_610_9)

				if var_610_11 > 0 and var_610_5 < var_610_11 then
					arg_607_1.talkMaxDuration = var_610_11

					if var_610_11 + var_610_4 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_11 + var_610_4
					end
				end

				arg_607_1.text_.text = var_610_8
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021148", "story_v_out_120021.awb") ~= 0 then
					local var_610_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021148", "story_v_out_120021.awb") / 1000

					if var_610_12 + var_610_4 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_12 + var_610_4
					end

					if var_610_7.prefab_name ~= "" and arg_607_1.actors_[var_610_7.prefab_name] ~= nil then
						local var_610_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_7.prefab_name].transform, "story_v_out_120021", "120021148", "story_v_out_120021.awb")

						arg_607_1:RecordAudio("120021148", var_610_13)
						arg_607_1:RecordAudio("120021148", var_610_13)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_out_120021", "120021148", "story_v_out_120021.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_out_120021", "120021148", "story_v_out_120021.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_14 = math.max(var_610_5, arg_607_1.talkMaxDuration)

			if var_610_4 <= arg_607_1.time_ and arg_607_1.time_ < var_610_4 + var_610_14 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_4) / var_610_14

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_4 + var_610_14 and arg_607_1.time_ < var_610_4 + var_610_14 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play120021149 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 120021149
		arg_611_1.duration_ = 3.266

		local var_611_0 = {
			zh = 1.933,
			ja = 3.266
		}
		local var_611_1 = manager.audio:GetLocalizationFlag()

		if var_611_0[var_611_1] ~= nil then
			arg_611_1.duration_ = var_611_0[var_611_1]
		end

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play120021150(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["10044ui_story"]
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 and arg_611_1.var_.characterEffect10044ui_story == nil then
				arg_611_1.var_.characterEffect10044ui_story = var_614_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_614_2 = 0.2

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_2 then
				local var_614_3 = (arg_611_1.time_ - var_614_1) / var_614_2

				if arg_611_1.var_.characterEffect10044ui_story then
					local var_614_4 = Mathf.Lerp(0, 0.5, var_614_3)

					arg_611_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_611_1.var_.characterEffect10044ui_story.fillRatio = var_614_4
				end
			end

			if arg_611_1.time_ >= var_614_1 + var_614_2 and arg_611_1.time_ < var_614_1 + var_614_2 + arg_614_0 and arg_611_1.var_.characterEffect10044ui_story then
				local var_614_5 = 0.5

				arg_611_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_611_1.var_.characterEffect10044ui_story.fillRatio = var_614_5
			end

			local var_614_6 = arg_611_1.actors_["1075ui_story"].transform
			local var_614_7 = 0

			if var_614_7 < arg_611_1.time_ and arg_611_1.time_ <= var_614_7 + arg_614_0 then
				arg_611_1.var_.moveOldPos1075ui_story = var_614_6.localPosition
			end

			local var_614_8 = 0.001

			if var_614_7 <= arg_611_1.time_ and arg_611_1.time_ < var_614_7 + var_614_8 then
				local var_614_9 = (arg_611_1.time_ - var_614_7) / var_614_8
				local var_614_10 = Vector3.New(0, 100, 0)

				var_614_6.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos1075ui_story, var_614_10, var_614_9)

				local var_614_11 = manager.ui.mainCamera.transform.position - var_614_6.position

				var_614_6.forward = Vector3.New(var_614_11.x, var_614_11.y, var_614_11.z)

				local var_614_12 = var_614_6.localEulerAngles

				var_614_12.z = 0
				var_614_12.x = 0
				var_614_6.localEulerAngles = var_614_12
			end

			if arg_611_1.time_ >= var_614_7 + var_614_8 and arg_611_1.time_ < var_614_7 + var_614_8 + arg_614_0 then
				var_614_6.localPosition = Vector3.New(0, 100, 0)

				local var_614_13 = manager.ui.mainCamera.transform.position - var_614_6.position

				var_614_6.forward = Vector3.New(var_614_13.x, var_614_13.y, var_614_13.z)

				local var_614_14 = var_614_6.localEulerAngles

				var_614_14.z = 0
				var_614_14.x = 0
				var_614_6.localEulerAngles = var_614_14
			end

			local var_614_15 = arg_611_1.actors_["10044ui_story"].transform
			local var_614_16 = 0

			if var_614_16 < arg_611_1.time_ and arg_611_1.time_ <= var_614_16 + arg_614_0 then
				arg_611_1.var_.moveOldPos10044ui_story = var_614_15.localPosition
			end

			local var_614_17 = 0.001

			if var_614_16 <= arg_611_1.time_ and arg_611_1.time_ < var_614_16 + var_614_17 then
				local var_614_18 = (arg_611_1.time_ - var_614_16) / var_614_17
				local var_614_19 = Vector3.New(0, 100, 0)

				var_614_15.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos10044ui_story, var_614_19, var_614_18)

				local var_614_20 = manager.ui.mainCamera.transform.position - var_614_15.position

				var_614_15.forward = Vector3.New(var_614_20.x, var_614_20.y, var_614_20.z)

				local var_614_21 = var_614_15.localEulerAngles

				var_614_21.z = 0
				var_614_21.x = 0
				var_614_15.localEulerAngles = var_614_21
			end

			if arg_611_1.time_ >= var_614_16 + var_614_17 and arg_611_1.time_ < var_614_16 + var_614_17 + arg_614_0 then
				var_614_15.localPosition = Vector3.New(0, 100, 0)

				local var_614_22 = manager.ui.mainCamera.transform.position - var_614_15.position

				var_614_15.forward = Vector3.New(var_614_22.x, var_614_22.y, var_614_22.z)

				local var_614_23 = var_614_15.localEulerAngles

				var_614_23.z = 0
				var_614_23.x = 0
				var_614_15.localEulerAngles = var_614_23
			end

			local var_614_24 = 0
			local var_614_25 = 0.125

			if var_614_24 < arg_611_1.time_ and arg_611_1.time_ <= var_614_24 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0
				arg_611_1.dialogCg_.alpha = 1

				arg_611_1.dialog_:SetActive(true)
				SetActive(arg_611_1.leftNameGo_, true)

				local var_614_26 = arg_611_1:FormatText(StoryNameCfg[10].name)

				arg_611_1.leftNameTxt_.text = var_614_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_611_1.leftNameTxt_.transform)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1.leftNameTxt_.text)
				SetActive(arg_611_1.iconTrs_.gameObject, true)
				arg_611_1.iconController_:SetSelectedState("hero")

				arg_611_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_27 = arg_611_1:GetWordFromCfg(120021149)
				local var_614_28 = arg_611_1:FormatText(var_614_27.content)

				arg_611_1.text_.text = var_614_28

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_29 = 5
				local var_614_30 = utf8.len(var_614_28)
				local var_614_31 = var_614_29 <= 0 and var_614_25 or var_614_25 * (var_614_30 / var_614_29)

				if var_614_31 > 0 and var_614_25 < var_614_31 then
					arg_611_1.talkMaxDuration = var_614_31

					if var_614_31 + var_614_24 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_31 + var_614_24
					end
				end

				arg_611_1.text_.text = var_614_28
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021149", "story_v_out_120021.awb") ~= 0 then
					local var_614_32 = manager.audio:GetVoiceLength("story_v_out_120021", "120021149", "story_v_out_120021.awb") / 1000

					if var_614_32 + var_614_24 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_32 + var_614_24
					end

					if var_614_27.prefab_name ~= "" and arg_611_1.actors_[var_614_27.prefab_name] ~= nil then
						local var_614_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_611_1.actors_[var_614_27.prefab_name].transform, "story_v_out_120021", "120021149", "story_v_out_120021.awb")

						arg_611_1:RecordAudio("120021149", var_614_33)
						arg_611_1:RecordAudio("120021149", var_614_33)
					else
						arg_611_1:AudioAction("play", "voice", "story_v_out_120021", "120021149", "story_v_out_120021.awb")
					end

					arg_611_1:RecordHistoryTalkVoice("story_v_out_120021", "120021149", "story_v_out_120021.awb")
				end

				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_34 = math.max(var_614_25, arg_611_1.talkMaxDuration)

			if var_614_24 <= arg_611_1.time_ and arg_611_1.time_ < var_614_24 + var_614_34 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_24) / var_614_34

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_24 + var_614_34 and arg_611_1.time_ < var_614_24 + var_614_34 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play120021150 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 120021150
		arg_615_1.duration_ = 15.733

		local var_615_0 = {
			zh = 15.733,
			ja = 10.333
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
				arg_615_0:Play120021151(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0
			local var_618_1 = 1.675

			if var_618_0 < arg_615_1.time_ and arg_615_1.time_ <= var_618_0 + arg_618_0 then
				arg_615_1.talkMaxDuration = 0
				arg_615_1.dialogCg_.alpha = 1

				arg_615_1.dialog_:SetActive(true)
				SetActive(arg_615_1.leftNameGo_, true)

				local var_618_2 = arg_615_1:FormatText(StoryNameCfg[10].name)

				arg_615_1.leftNameTxt_.text = var_618_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_615_1.leftNameTxt_.transform)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1.leftNameTxt_.text)
				SetActive(arg_615_1.iconTrs_.gameObject, true)
				arg_615_1.iconController_:SetSelectedState("hero")

				arg_615_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_3 = arg_615_1:GetWordFromCfg(120021150)
				local var_618_4 = arg_615_1:FormatText(var_618_3.content)

				arg_615_1.text_.text = var_618_4

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_5 = 67
				local var_618_6 = utf8.len(var_618_4)
				local var_618_7 = var_618_5 <= 0 and var_618_1 or var_618_1 * (var_618_6 / var_618_5)

				if var_618_7 > 0 and var_618_1 < var_618_7 then
					arg_615_1.talkMaxDuration = var_618_7

					if var_618_7 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_7 + var_618_0
					end
				end

				arg_615_1.text_.text = var_618_4
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021150", "story_v_out_120021.awb") ~= 0 then
					local var_618_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021150", "story_v_out_120021.awb") / 1000

					if var_618_8 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_8 + var_618_0
					end

					if var_618_3.prefab_name ~= "" and arg_615_1.actors_[var_618_3.prefab_name] ~= nil then
						local var_618_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_615_1.actors_[var_618_3.prefab_name].transform, "story_v_out_120021", "120021150", "story_v_out_120021.awb")

						arg_615_1:RecordAudio("120021150", var_618_9)
						arg_615_1:RecordAudio("120021150", var_618_9)
					else
						arg_615_1:AudioAction("play", "voice", "story_v_out_120021", "120021150", "story_v_out_120021.awb")
					end

					arg_615_1:RecordHistoryTalkVoice("story_v_out_120021", "120021150", "story_v_out_120021.awb")
				end

				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_10 = math.max(var_618_1, arg_615_1.talkMaxDuration)

			if var_618_0 <= arg_615_1.time_ and arg_615_1.time_ < var_618_0 + var_618_10 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_0) / var_618_10

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_0 + var_618_10 and arg_615_1.time_ < var_618_0 + var_618_10 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play120021151 = function(arg_619_0, arg_619_1)
		arg_619_1.time_ = 0
		arg_619_1.frameCnt_ = 0
		arg_619_1.state_ = "playing"
		arg_619_1.curTalkId_ = 120021151
		arg_619_1.duration_ = 12.2

		local var_619_0 = {
			zh = 8.3,
			ja = 12.2
		}
		local var_619_1 = manager.audio:GetLocalizationFlag()

		if var_619_0[var_619_1] ~= nil then
			arg_619_1.duration_ = var_619_0[var_619_1]
		end

		SetActive(arg_619_1.tipsGo_, false)

		function arg_619_1.onSingleLineFinish_()
			arg_619_1.onSingleLineUpdate_ = nil
			arg_619_1.onSingleLineFinish_ = nil
			arg_619_1.state_ = "waiting"
		end

		function arg_619_1.playNext_(arg_621_0)
			if arg_621_0 == 1 then
				arg_619_0:Play120021152(arg_619_1)
			end
		end

		function arg_619_1.onSingleLineUpdate_(arg_622_0)
			local var_622_0 = 0
			local var_622_1 = 0.85

			if var_622_0 < arg_619_1.time_ and arg_619_1.time_ <= var_622_0 + arg_622_0 then
				arg_619_1.talkMaxDuration = 0
				arg_619_1.dialogCg_.alpha = 1

				arg_619_1.dialog_:SetActive(true)
				SetActive(arg_619_1.leftNameGo_, true)

				local var_622_2 = arg_619_1:FormatText(StoryNameCfg[10].name)

				arg_619_1.leftNameTxt_.text = var_622_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_619_1.leftNameTxt_.transform)

				arg_619_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_619_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_619_1:RecordName(arg_619_1.leftNameTxt_.text)
				SetActive(arg_619_1.iconTrs_.gameObject, true)
				arg_619_1.iconController_:SetSelectedState("hero")

				arg_619_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_619_1.callingController_:SetSelectedState("normal")

				local var_622_3 = arg_619_1:GetWordFromCfg(120021151)
				local var_622_4 = arg_619_1:FormatText(var_622_3.content)

				arg_619_1.text_.text = var_622_4

				LuaForUtil.ClearLinePrefixSymbol(arg_619_1.text_)

				local var_622_5 = 34
				local var_622_6 = utf8.len(var_622_4)
				local var_622_7 = var_622_5 <= 0 and var_622_1 or var_622_1 * (var_622_6 / var_622_5)

				if var_622_7 > 0 and var_622_1 < var_622_7 then
					arg_619_1.talkMaxDuration = var_622_7

					if var_622_7 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_7 + var_622_0
					end
				end

				arg_619_1.text_.text = var_622_4
				arg_619_1.typewritter.percent = 0

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021151", "story_v_out_120021.awb") ~= 0 then
					local var_622_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021151", "story_v_out_120021.awb") / 1000

					if var_622_8 + var_622_0 > arg_619_1.duration_ then
						arg_619_1.duration_ = var_622_8 + var_622_0
					end

					if var_622_3.prefab_name ~= "" and arg_619_1.actors_[var_622_3.prefab_name] ~= nil then
						local var_622_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_619_1.actors_[var_622_3.prefab_name].transform, "story_v_out_120021", "120021151", "story_v_out_120021.awb")

						arg_619_1:RecordAudio("120021151", var_622_9)
						arg_619_1:RecordAudio("120021151", var_622_9)
					else
						arg_619_1:AudioAction("play", "voice", "story_v_out_120021", "120021151", "story_v_out_120021.awb")
					end

					arg_619_1:RecordHistoryTalkVoice("story_v_out_120021", "120021151", "story_v_out_120021.awb")
				end

				arg_619_1:RecordContent(arg_619_1.text_.text)
			end

			local var_622_10 = math.max(var_622_1, arg_619_1.talkMaxDuration)

			if var_622_0 <= arg_619_1.time_ and arg_619_1.time_ < var_622_0 + var_622_10 then
				arg_619_1.typewritter.percent = (arg_619_1.time_ - var_622_0) / var_622_10

				arg_619_1.typewritter:SetDirty()
			end

			if arg_619_1.time_ >= var_622_0 + var_622_10 and arg_619_1.time_ < var_622_0 + var_622_10 + arg_622_0 then
				arg_619_1.typewritter.percent = 1

				arg_619_1.typewritter:SetDirty()
				arg_619_1:ShowNextGo(true)
			end
		end
	end,
	Play120021152 = function(arg_623_0, arg_623_1)
		arg_623_1.time_ = 0
		arg_623_1.frameCnt_ = 0
		arg_623_1.state_ = "playing"
		arg_623_1.curTalkId_ = 120021152
		arg_623_1.duration_ = 2.733

		local var_623_0 = {
			zh = 2.733,
			ja = 1.999999999999
		}
		local var_623_1 = manager.audio:GetLocalizationFlag()

		if var_623_0[var_623_1] ~= nil then
			arg_623_1.duration_ = var_623_0[var_623_1]
		end

		SetActive(arg_623_1.tipsGo_, false)

		function arg_623_1.onSingleLineFinish_()
			arg_623_1.onSingleLineUpdate_ = nil
			arg_623_1.onSingleLineFinish_ = nil
			arg_623_1.state_ = "waiting"
		end

		function arg_623_1.playNext_(arg_625_0)
			if arg_625_0 == 1 then
				arg_623_0:Play120021153(arg_623_1)
			end
		end

		function arg_623_1.onSingleLineUpdate_(arg_626_0)
			local var_626_0 = arg_623_1.actors_["1075ui_story"]
			local var_626_1 = 0

			if var_626_1 < arg_623_1.time_ and arg_623_1.time_ <= var_626_1 + arg_626_0 and arg_623_1.var_.characterEffect1075ui_story == nil then
				arg_623_1.var_.characterEffect1075ui_story = var_626_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_626_2 = 0.2

			if var_626_1 <= arg_623_1.time_ and arg_623_1.time_ < var_626_1 + var_626_2 then
				local var_626_3 = (arg_623_1.time_ - var_626_1) / var_626_2

				if arg_623_1.var_.characterEffect1075ui_story then
					arg_623_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_623_1.time_ >= var_626_1 + var_626_2 and arg_623_1.time_ < var_626_1 + var_626_2 + arg_626_0 and arg_623_1.var_.characterEffect1075ui_story then
				arg_623_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_626_4 = 0

			if var_626_4 < arg_623_1.time_ and arg_623_1.time_ <= var_626_4 + arg_626_0 then
				arg_623_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_626_5 = arg_623_1.actors_["1075ui_story"].transform
			local var_626_6 = 0

			if var_626_6 < arg_623_1.time_ and arg_623_1.time_ <= var_626_6 + arg_626_0 then
				arg_623_1.var_.moveOldPos1075ui_story = var_626_5.localPosition
			end

			local var_626_7 = 0.001

			if var_626_6 <= arg_623_1.time_ and arg_623_1.time_ < var_626_6 + var_626_7 then
				local var_626_8 = (arg_623_1.time_ - var_626_6) / var_626_7
				local var_626_9 = Vector3.New(-0.7, -1.055, -6.16)

				var_626_5.localPosition = Vector3.Lerp(arg_623_1.var_.moveOldPos1075ui_story, var_626_9, var_626_8)

				local var_626_10 = manager.ui.mainCamera.transform.position - var_626_5.position

				var_626_5.forward = Vector3.New(var_626_10.x, var_626_10.y, var_626_10.z)

				local var_626_11 = var_626_5.localEulerAngles

				var_626_11.z = 0
				var_626_11.x = 0
				var_626_5.localEulerAngles = var_626_11
			end

			if arg_623_1.time_ >= var_626_6 + var_626_7 and arg_623_1.time_ < var_626_6 + var_626_7 + arg_626_0 then
				var_626_5.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_626_12 = manager.ui.mainCamera.transform.position - var_626_5.position

				var_626_5.forward = Vector3.New(var_626_12.x, var_626_12.y, var_626_12.z)

				local var_626_13 = var_626_5.localEulerAngles

				var_626_13.z = 0
				var_626_13.x = 0
				var_626_5.localEulerAngles = var_626_13
			end

			local var_626_14 = 0
			local var_626_15 = 0.075

			if var_626_14 < arg_623_1.time_ and arg_623_1.time_ <= var_626_14 + arg_626_0 then
				arg_623_1.talkMaxDuration = 0
				arg_623_1.dialogCg_.alpha = 1

				arg_623_1.dialog_:SetActive(true)
				SetActive(arg_623_1.leftNameGo_, true)

				local var_626_16 = arg_623_1:FormatText(StoryNameCfg[381].name)

				arg_623_1.leftNameTxt_.text = var_626_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_623_1.leftNameTxt_.transform)

				arg_623_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_623_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_623_1:RecordName(arg_623_1.leftNameTxt_.text)
				SetActive(arg_623_1.iconTrs_.gameObject, false)
				arg_623_1.callingController_:SetSelectedState("normal")

				local var_626_17 = arg_623_1:GetWordFromCfg(120021152)
				local var_626_18 = arg_623_1:FormatText(var_626_17.content)

				arg_623_1.text_.text = var_626_18

				LuaForUtil.ClearLinePrefixSymbol(arg_623_1.text_)

				local var_626_19 = 3
				local var_626_20 = utf8.len(var_626_18)
				local var_626_21 = var_626_19 <= 0 and var_626_15 or var_626_15 * (var_626_20 / var_626_19)

				if var_626_21 > 0 and var_626_15 < var_626_21 then
					arg_623_1.talkMaxDuration = var_626_21

					if var_626_21 + var_626_14 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_21 + var_626_14
					end
				end

				arg_623_1.text_.text = var_626_18
				arg_623_1.typewritter.percent = 0

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021152", "story_v_out_120021.awb") ~= 0 then
					local var_626_22 = manager.audio:GetVoiceLength("story_v_out_120021", "120021152", "story_v_out_120021.awb") / 1000

					if var_626_22 + var_626_14 > arg_623_1.duration_ then
						arg_623_1.duration_ = var_626_22 + var_626_14
					end

					if var_626_17.prefab_name ~= "" and arg_623_1.actors_[var_626_17.prefab_name] ~= nil then
						local var_626_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_623_1.actors_[var_626_17.prefab_name].transform, "story_v_out_120021", "120021152", "story_v_out_120021.awb")

						arg_623_1:RecordAudio("120021152", var_626_23)
						arg_623_1:RecordAudio("120021152", var_626_23)
					else
						arg_623_1:AudioAction("play", "voice", "story_v_out_120021", "120021152", "story_v_out_120021.awb")
					end

					arg_623_1:RecordHistoryTalkVoice("story_v_out_120021", "120021152", "story_v_out_120021.awb")
				end

				arg_623_1:RecordContent(arg_623_1.text_.text)
			end

			local var_626_24 = math.max(var_626_15, arg_623_1.talkMaxDuration)

			if var_626_14 <= arg_623_1.time_ and arg_623_1.time_ < var_626_14 + var_626_24 then
				arg_623_1.typewritter.percent = (arg_623_1.time_ - var_626_14) / var_626_24

				arg_623_1.typewritter:SetDirty()
			end

			if arg_623_1.time_ >= var_626_14 + var_626_24 and arg_623_1.time_ < var_626_14 + var_626_24 + arg_626_0 then
				arg_623_1.typewritter.percent = 1

				arg_623_1.typewritter:SetDirty()
				arg_623_1:ShowNextGo(true)
			end
		end
	end,
	Play120021153 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 120021153
		arg_627_1.duration_ = 4.8

		local var_627_0 = {
			zh = 2.4,
			ja = 4.8
		}
		local var_627_1 = manager.audio:GetLocalizationFlag()

		if var_627_0[var_627_1] ~= nil then
			arg_627_1.duration_ = var_627_0[var_627_1]
		end

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
		end

		function arg_627_1.playNext_(arg_629_0)
			if arg_629_0 == 1 then
				arg_627_0:Play120021154(arg_627_1)
			end
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["10044ui_story"].transform
			local var_630_1 = 0

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 then
				arg_627_1.var_.moveOldPos10044ui_story = var_630_0.localPosition
			end

			local var_630_2 = 0.001

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2
				local var_630_4 = Vector3.New(0, 100, 0)

				var_630_0.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos10044ui_story, var_630_4, var_630_3)

				local var_630_5 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_5.x, var_630_5.y, var_630_5.z)

				local var_630_6 = var_630_0.localEulerAngles

				var_630_6.z = 0
				var_630_6.x = 0
				var_630_0.localEulerAngles = var_630_6
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 then
				var_630_0.localPosition = Vector3.New(0, 100, 0)

				local var_630_7 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_7.x, var_630_7.y, var_630_7.z)

				local var_630_8 = var_630_0.localEulerAngles

				var_630_8.z = 0
				var_630_8.x = 0
				var_630_0.localEulerAngles = var_630_8
			end

			local var_630_9 = arg_627_1.actors_["1084ui_story"].transform
			local var_630_10 = 0

			if var_630_10 < arg_627_1.time_ and arg_627_1.time_ <= var_630_10 + arg_630_0 then
				arg_627_1.var_.moveOldPos1084ui_story = var_630_9.localPosition
			end

			local var_630_11 = 0.001

			if var_630_10 <= arg_627_1.time_ and arg_627_1.time_ < var_630_10 + var_630_11 then
				local var_630_12 = (arg_627_1.time_ - var_630_10) / var_630_11
				local var_630_13 = Vector3.New(0.7, -0.97, -6)

				var_630_9.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos1084ui_story, var_630_13, var_630_12)

				local var_630_14 = manager.ui.mainCamera.transform.position - var_630_9.position

				var_630_9.forward = Vector3.New(var_630_14.x, var_630_14.y, var_630_14.z)

				local var_630_15 = var_630_9.localEulerAngles

				var_630_15.z = 0
				var_630_15.x = 0
				var_630_9.localEulerAngles = var_630_15
			end

			if arg_627_1.time_ >= var_630_10 + var_630_11 and arg_627_1.time_ < var_630_10 + var_630_11 + arg_630_0 then
				var_630_9.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_630_16 = manager.ui.mainCamera.transform.position - var_630_9.position

				var_630_9.forward = Vector3.New(var_630_16.x, var_630_16.y, var_630_16.z)

				local var_630_17 = var_630_9.localEulerAngles

				var_630_17.z = 0
				var_630_17.x = 0
				var_630_9.localEulerAngles = var_630_17
			end

			local var_630_18 = arg_627_1.actors_["1075ui_story"]
			local var_630_19 = 0

			if var_630_19 < arg_627_1.time_ and arg_627_1.time_ <= var_630_19 + arg_630_0 and arg_627_1.var_.characterEffect1075ui_story == nil then
				arg_627_1.var_.characterEffect1075ui_story = var_630_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_20 = 0.2

			if var_630_19 <= arg_627_1.time_ and arg_627_1.time_ < var_630_19 + var_630_20 then
				local var_630_21 = (arg_627_1.time_ - var_630_19) / var_630_20

				if arg_627_1.var_.characterEffect1075ui_story then
					local var_630_22 = Mathf.Lerp(0, 0.5, var_630_21)

					arg_627_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_627_1.var_.characterEffect1075ui_story.fillRatio = var_630_22
				end
			end

			if arg_627_1.time_ >= var_630_19 + var_630_20 and arg_627_1.time_ < var_630_19 + var_630_20 + arg_630_0 and arg_627_1.var_.characterEffect1075ui_story then
				local var_630_23 = 0.5

				arg_627_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_627_1.var_.characterEffect1075ui_story.fillRatio = var_630_23
			end

			local var_630_24 = arg_627_1.actors_["1084ui_story"]
			local var_630_25 = 0

			if var_630_25 < arg_627_1.time_ and arg_627_1.time_ <= var_630_25 + arg_630_0 and arg_627_1.var_.characterEffect1084ui_story == nil then
				arg_627_1.var_.characterEffect1084ui_story = var_630_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_26 = 0.2

			if var_630_25 <= arg_627_1.time_ and arg_627_1.time_ < var_630_25 + var_630_26 then
				local var_630_27 = (arg_627_1.time_ - var_630_25) / var_630_26

				if arg_627_1.var_.characterEffect1084ui_story then
					arg_627_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_627_1.time_ >= var_630_25 + var_630_26 and arg_627_1.time_ < var_630_25 + var_630_26 + arg_630_0 and arg_627_1.var_.characterEffect1084ui_story then
				arg_627_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_630_28 = 0

			if var_630_28 < arg_627_1.time_ and arg_627_1.time_ <= var_630_28 + arg_630_0 then
				arg_627_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_630_29 = 0

			if var_630_29 < arg_627_1.time_ and arg_627_1.time_ <= var_630_29 + arg_630_0 then
				arg_627_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_630_30 = 0
			local var_630_31 = 0.25

			if var_630_30 < arg_627_1.time_ and arg_627_1.time_ <= var_630_30 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0
				arg_627_1.dialogCg_.alpha = 1

				arg_627_1.dialog_:SetActive(true)
				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_32 = arg_627_1:FormatText(StoryNameCfg[6].name)

				arg_627_1.leftNameTxt_.text = var_630_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_33 = arg_627_1:GetWordFromCfg(120021153)
				local var_630_34 = arg_627_1:FormatText(var_630_33.content)

				arg_627_1.text_.text = var_630_34

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_35 = 10
				local var_630_36 = utf8.len(var_630_34)
				local var_630_37 = var_630_35 <= 0 and var_630_31 or var_630_31 * (var_630_36 / var_630_35)

				if var_630_37 > 0 and var_630_31 < var_630_37 then
					arg_627_1.talkMaxDuration = var_630_37

					if var_630_37 + var_630_30 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_37 + var_630_30
					end
				end

				arg_627_1.text_.text = var_630_34
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021153", "story_v_out_120021.awb") ~= 0 then
					local var_630_38 = manager.audio:GetVoiceLength("story_v_out_120021", "120021153", "story_v_out_120021.awb") / 1000

					if var_630_38 + var_630_30 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_38 + var_630_30
					end

					if var_630_33.prefab_name ~= "" and arg_627_1.actors_[var_630_33.prefab_name] ~= nil then
						local var_630_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_33.prefab_name].transform, "story_v_out_120021", "120021153", "story_v_out_120021.awb")

						arg_627_1:RecordAudio("120021153", var_630_39)
						arg_627_1:RecordAudio("120021153", var_630_39)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_out_120021", "120021153", "story_v_out_120021.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_out_120021", "120021153", "story_v_out_120021.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_40 = math.max(var_630_31, arg_627_1.talkMaxDuration)

			if var_630_30 <= arg_627_1.time_ and arg_627_1.time_ < var_630_30 + var_630_40 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_30) / var_630_40

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_30 + var_630_40 and arg_627_1.time_ < var_630_30 + var_630_40 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play120021154 = function(arg_631_0, arg_631_1)
		arg_631_1.time_ = 0
		arg_631_1.frameCnt_ = 0
		arg_631_1.state_ = "playing"
		arg_631_1.curTalkId_ = 120021154
		arg_631_1.duration_ = 5

		SetActive(arg_631_1.tipsGo_, false)

		function arg_631_1.onSingleLineFinish_()
			arg_631_1.onSingleLineUpdate_ = nil
			arg_631_1.onSingleLineFinish_ = nil
			arg_631_1.state_ = "waiting"
		end

		function arg_631_1.playNext_(arg_633_0)
			if arg_633_0 == 1 then
				arg_631_0:Play120021155(arg_631_1)
			end
		end

		function arg_631_1.onSingleLineUpdate_(arg_634_0)
			local var_634_0 = arg_631_1.actors_["1084ui_story"]
			local var_634_1 = 0

			if var_634_1 < arg_631_1.time_ and arg_631_1.time_ <= var_634_1 + arg_634_0 and arg_631_1.var_.characterEffect1084ui_story == nil then
				arg_631_1.var_.characterEffect1084ui_story = var_634_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_634_2 = 0.2

			if var_634_1 <= arg_631_1.time_ and arg_631_1.time_ < var_634_1 + var_634_2 then
				local var_634_3 = (arg_631_1.time_ - var_634_1) / var_634_2

				if arg_631_1.var_.characterEffect1084ui_story then
					local var_634_4 = Mathf.Lerp(0, 0.5, var_634_3)

					arg_631_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_631_1.var_.characterEffect1084ui_story.fillRatio = var_634_4
				end
			end

			if arg_631_1.time_ >= var_634_1 + var_634_2 and arg_631_1.time_ < var_634_1 + var_634_2 + arg_634_0 and arg_631_1.var_.characterEffect1084ui_story then
				local var_634_5 = 0.5

				arg_631_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_631_1.var_.characterEffect1084ui_story.fillRatio = var_634_5
			end

			local var_634_6 = 0

			if var_634_6 < arg_631_1.time_ and arg_631_1.time_ <= var_634_6 + arg_634_0 then
				arg_631_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_634_7 = 0
			local var_634_8 = 0.925

			if var_634_7 < arg_631_1.time_ and arg_631_1.time_ <= var_634_7 + arg_634_0 then
				arg_631_1.talkMaxDuration = 0
				arg_631_1.dialogCg_.alpha = 1

				arg_631_1.dialog_:SetActive(true)
				SetActive(arg_631_1.leftNameGo_, true)

				local var_634_9 = arg_631_1:FormatText(StoryNameCfg[7].name)

				arg_631_1.leftNameTxt_.text = var_634_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_631_1.leftNameTxt_.transform)

				arg_631_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_631_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_631_1:RecordName(arg_631_1.leftNameTxt_.text)
				SetActive(arg_631_1.iconTrs_.gameObject, false)
				arg_631_1.callingController_:SetSelectedState("normal")

				local var_634_10 = arg_631_1:GetWordFromCfg(120021154)
				local var_634_11 = arg_631_1:FormatText(var_634_10.content)

				arg_631_1.text_.text = var_634_11

				LuaForUtil.ClearLinePrefixSymbol(arg_631_1.text_)

				local var_634_12 = 37
				local var_634_13 = utf8.len(var_634_11)
				local var_634_14 = var_634_12 <= 0 and var_634_8 or var_634_8 * (var_634_13 / var_634_12)

				if var_634_14 > 0 and var_634_8 < var_634_14 then
					arg_631_1.talkMaxDuration = var_634_14

					if var_634_14 + var_634_7 > arg_631_1.duration_ then
						arg_631_1.duration_ = var_634_14 + var_634_7
					end
				end

				arg_631_1.text_.text = var_634_11
				arg_631_1.typewritter.percent = 0

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(false)
				arg_631_1:RecordContent(arg_631_1.text_.text)
			end

			local var_634_15 = math.max(var_634_8, arg_631_1.talkMaxDuration)

			if var_634_7 <= arg_631_1.time_ and arg_631_1.time_ < var_634_7 + var_634_15 then
				arg_631_1.typewritter.percent = (arg_631_1.time_ - var_634_7) / var_634_15

				arg_631_1.typewritter:SetDirty()
			end

			if arg_631_1.time_ >= var_634_7 + var_634_15 and arg_631_1.time_ < var_634_7 + var_634_15 + arg_634_0 then
				arg_631_1.typewritter.percent = 1

				arg_631_1.typewritter:SetDirty()
				arg_631_1:ShowNextGo(true)
			end
		end
	end,
	Play120021155 = function(arg_635_0, arg_635_1)
		arg_635_1.time_ = 0
		arg_635_1.frameCnt_ = 0
		arg_635_1.state_ = "playing"
		arg_635_1.curTalkId_ = 120021155
		arg_635_1.duration_ = 5

		SetActive(arg_635_1.tipsGo_, false)

		function arg_635_1.onSingleLineFinish_()
			arg_635_1.onSingleLineUpdate_ = nil
			arg_635_1.onSingleLineFinish_ = nil
			arg_635_1.state_ = "waiting"
		end

		function arg_635_1.playNext_(arg_637_0)
			if arg_637_0 == 1 then
				arg_635_0:Play120021156(arg_635_1)
			end
		end

		function arg_635_1.onSingleLineUpdate_(arg_638_0)
			local var_638_0 = 0
			local var_638_1 = 0.275

			if var_638_0 < arg_635_1.time_ and arg_635_1.time_ <= var_638_0 + arg_638_0 then
				arg_635_1.talkMaxDuration = 0
				arg_635_1.dialogCg_.alpha = 1

				arg_635_1.dialog_:SetActive(true)
				SetActive(arg_635_1.leftNameGo_, true)

				local var_638_2 = arg_635_1:FormatText(StoryNameCfg[7].name)

				arg_635_1.leftNameTxt_.text = var_638_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_635_1.leftNameTxt_.transform)

				arg_635_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_635_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_635_1:RecordName(arg_635_1.leftNameTxt_.text)
				SetActive(arg_635_1.iconTrs_.gameObject, false)
				arg_635_1.callingController_:SetSelectedState("normal")

				local var_638_3 = arg_635_1:GetWordFromCfg(120021155)
				local var_638_4 = arg_635_1:FormatText(var_638_3.content)

				arg_635_1.text_.text = var_638_4

				LuaForUtil.ClearLinePrefixSymbol(arg_635_1.text_)

				local var_638_5 = 11
				local var_638_6 = utf8.len(var_638_4)
				local var_638_7 = var_638_5 <= 0 and var_638_1 or var_638_1 * (var_638_6 / var_638_5)

				if var_638_7 > 0 and var_638_1 < var_638_7 then
					arg_635_1.talkMaxDuration = var_638_7

					if var_638_7 + var_638_0 > arg_635_1.duration_ then
						arg_635_1.duration_ = var_638_7 + var_638_0
					end
				end

				arg_635_1.text_.text = var_638_4
				arg_635_1.typewritter.percent = 0

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(false)
				arg_635_1:RecordContent(arg_635_1.text_.text)
			end

			local var_638_8 = math.max(var_638_1, arg_635_1.talkMaxDuration)

			if var_638_0 <= arg_635_1.time_ and arg_635_1.time_ < var_638_0 + var_638_8 then
				arg_635_1.typewritter.percent = (arg_635_1.time_ - var_638_0) / var_638_8

				arg_635_1.typewritter:SetDirty()
			end

			if arg_635_1.time_ >= var_638_0 + var_638_8 and arg_635_1.time_ < var_638_0 + var_638_8 + arg_638_0 then
				arg_635_1.typewritter.percent = 1

				arg_635_1.typewritter:SetDirty()
				arg_635_1:ShowNextGo(true)
			end
		end
	end,
	Play120021156 = function(arg_639_0, arg_639_1)
		arg_639_1.time_ = 0
		arg_639_1.frameCnt_ = 0
		arg_639_1.state_ = "playing"
		arg_639_1.curTalkId_ = 120021156
		arg_639_1.duration_ = 15.433

		local var_639_0 = {
			zh = 15.433,
			ja = 7.933
		}
		local var_639_1 = manager.audio:GetLocalizationFlag()

		if var_639_0[var_639_1] ~= nil then
			arg_639_1.duration_ = var_639_0[var_639_1]
		end

		SetActive(arg_639_1.tipsGo_, false)

		function arg_639_1.onSingleLineFinish_()
			arg_639_1.onSingleLineUpdate_ = nil
			arg_639_1.onSingleLineFinish_ = nil
			arg_639_1.state_ = "waiting"
		end

		function arg_639_1.playNext_(arg_641_0)
			if arg_641_0 == 1 then
				arg_639_0:Play120021157(arg_639_1)
			end
		end

		function arg_639_1.onSingleLineUpdate_(arg_642_0)
			local var_642_0 = arg_639_1.actors_["1075ui_story"]
			local var_642_1 = 0

			if var_642_1 < arg_639_1.time_ and arg_639_1.time_ <= var_642_1 + arg_642_0 and arg_639_1.var_.characterEffect1075ui_story == nil then
				arg_639_1.var_.characterEffect1075ui_story = var_642_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_642_2 = 0.2

			if var_642_1 <= arg_639_1.time_ and arg_639_1.time_ < var_642_1 + var_642_2 then
				local var_642_3 = (arg_639_1.time_ - var_642_1) / var_642_2

				if arg_639_1.var_.characterEffect1075ui_story then
					arg_639_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_639_1.time_ >= var_642_1 + var_642_2 and arg_639_1.time_ < var_642_1 + var_642_2 + arg_642_0 and arg_639_1.var_.characterEffect1075ui_story then
				arg_639_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_642_4 = 0

			if var_642_4 < arg_639_1.time_ and arg_639_1.time_ <= var_642_4 + arg_642_0 then
				arg_639_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_1")
			end

			local var_642_5 = 0

			if var_642_5 < arg_639_1.time_ and arg_639_1.time_ <= var_642_5 + arg_642_0 then
				arg_639_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_642_6 = 0
			local var_642_7 = 1.275

			if var_642_6 < arg_639_1.time_ and arg_639_1.time_ <= var_642_6 + arg_642_0 then
				arg_639_1.talkMaxDuration = 0
				arg_639_1.dialogCg_.alpha = 1

				arg_639_1.dialog_:SetActive(true)
				SetActive(arg_639_1.leftNameGo_, true)

				local var_642_8 = arg_639_1:FormatText(StoryNameCfg[381].name)

				arg_639_1.leftNameTxt_.text = var_642_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_639_1.leftNameTxt_.transform)

				arg_639_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_639_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_639_1:RecordName(arg_639_1.leftNameTxt_.text)
				SetActive(arg_639_1.iconTrs_.gameObject, false)
				arg_639_1.callingController_:SetSelectedState("normal")

				local var_642_9 = arg_639_1:GetWordFromCfg(120021156)
				local var_642_10 = arg_639_1:FormatText(var_642_9.content)

				arg_639_1.text_.text = var_642_10

				LuaForUtil.ClearLinePrefixSymbol(arg_639_1.text_)

				local var_642_11 = 51
				local var_642_12 = utf8.len(var_642_10)
				local var_642_13 = var_642_11 <= 0 and var_642_7 or var_642_7 * (var_642_12 / var_642_11)

				if var_642_13 > 0 and var_642_7 < var_642_13 then
					arg_639_1.talkMaxDuration = var_642_13

					if var_642_13 + var_642_6 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_13 + var_642_6
					end
				end

				arg_639_1.text_.text = var_642_10
				arg_639_1.typewritter.percent = 0

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021156", "story_v_out_120021.awb") ~= 0 then
					local var_642_14 = manager.audio:GetVoiceLength("story_v_out_120021", "120021156", "story_v_out_120021.awb") / 1000

					if var_642_14 + var_642_6 > arg_639_1.duration_ then
						arg_639_1.duration_ = var_642_14 + var_642_6
					end

					if var_642_9.prefab_name ~= "" and arg_639_1.actors_[var_642_9.prefab_name] ~= nil then
						local var_642_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_639_1.actors_[var_642_9.prefab_name].transform, "story_v_out_120021", "120021156", "story_v_out_120021.awb")

						arg_639_1:RecordAudio("120021156", var_642_15)
						arg_639_1:RecordAudio("120021156", var_642_15)
					else
						arg_639_1:AudioAction("play", "voice", "story_v_out_120021", "120021156", "story_v_out_120021.awb")
					end

					arg_639_1:RecordHistoryTalkVoice("story_v_out_120021", "120021156", "story_v_out_120021.awb")
				end

				arg_639_1:RecordContent(arg_639_1.text_.text)
			end

			local var_642_16 = math.max(var_642_7, arg_639_1.talkMaxDuration)

			if var_642_6 <= arg_639_1.time_ and arg_639_1.time_ < var_642_6 + var_642_16 then
				arg_639_1.typewritter.percent = (arg_639_1.time_ - var_642_6) / var_642_16

				arg_639_1.typewritter:SetDirty()
			end

			if arg_639_1.time_ >= var_642_6 + var_642_16 and arg_639_1.time_ < var_642_6 + var_642_16 + arg_642_0 then
				arg_639_1.typewritter.percent = 1

				arg_639_1.typewritter:SetDirty()
				arg_639_1:ShowNextGo(true)
			end
		end
	end,
	Play120021157 = function(arg_643_0, arg_643_1)
		arg_643_1.time_ = 0
		arg_643_1.frameCnt_ = 0
		arg_643_1.state_ = "playing"
		arg_643_1.curTalkId_ = 120021157
		arg_643_1.duration_ = 12.133

		local var_643_0 = {
			zh = 7.8,
			ja = 12.133
		}
		local var_643_1 = manager.audio:GetLocalizationFlag()

		if var_643_0[var_643_1] ~= nil then
			arg_643_1.duration_ = var_643_0[var_643_1]
		end

		SetActive(arg_643_1.tipsGo_, false)

		function arg_643_1.onSingleLineFinish_()
			arg_643_1.onSingleLineUpdate_ = nil
			arg_643_1.onSingleLineFinish_ = nil
			arg_643_1.state_ = "waiting"
		end

		function arg_643_1.playNext_(arg_645_0)
			if arg_645_0 == 1 then
				arg_643_0:Play120021158(arg_643_1)
			end
		end

		function arg_643_1.onSingleLineUpdate_(arg_646_0)
			local var_646_0 = 0
			local var_646_1 = 0.75

			if var_646_0 < arg_643_1.time_ and arg_643_1.time_ <= var_646_0 + arg_646_0 then
				arg_643_1.talkMaxDuration = 0
				arg_643_1.dialogCg_.alpha = 1

				arg_643_1.dialog_:SetActive(true)
				SetActive(arg_643_1.leftNameGo_, true)

				local var_646_2 = arg_643_1:FormatText(StoryNameCfg[381].name)

				arg_643_1.leftNameTxt_.text = var_646_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_643_1.leftNameTxt_.transform)

				arg_643_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_643_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_643_1:RecordName(arg_643_1.leftNameTxt_.text)
				SetActive(arg_643_1.iconTrs_.gameObject, false)
				arg_643_1.callingController_:SetSelectedState("normal")

				local var_646_3 = arg_643_1:GetWordFromCfg(120021157)
				local var_646_4 = arg_643_1:FormatText(var_646_3.content)

				arg_643_1.text_.text = var_646_4

				LuaForUtil.ClearLinePrefixSymbol(arg_643_1.text_)

				local var_646_5 = 30
				local var_646_6 = utf8.len(var_646_4)
				local var_646_7 = var_646_5 <= 0 and var_646_1 or var_646_1 * (var_646_6 / var_646_5)

				if var_646_7 > 0 and var_646_1 < var_646_7 then
					arg_643_1.talkMaxDuration = var_646_7

					if var_646_7 + var_646_0 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_7 + var_646_0
					end
				end

				arg_643_1.text_.text = var_646_4
				arg_643_1.typewritter.percent = 0

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021157", "story_v_out_120021.awb") ~= 0 then
					local var_646_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021157", "story_v_out_120021.awb") / 1000

					if var_646_8 + var_646_0 > arg_643_1.duration_ then
						arg_643_1.duration_ = var_646_8 + var_646_0
					end

					if var_646_3.prefab_name ~= "" and arg_643_1.actors_[var_646_3.prefab_name] ~= nil then
						local var_646_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_643_1.actors_[var_646_3.prefab_name].transform, "story_v_out_120021", "120021157", "story_v_out_120021.awb")

						arg_643_1:RecordAudio("120021157", var_646_9)
						arg_643_1:RecordAudio("120021157", var_646_9)
					else
						arg_643_1:AudioAction("play", "voice", "story_v_out_120021", "120021157", "story_v_out_120021.awb")
					end

					arg_643_1:RecordHistoryTalkVoice("story_v_out_120021", "120021157", "story_v_out_120021.awb")
				end

				arg_643_1:RecordContent(arg_643_1.text_.text)
			end

			local var_646_10 = math.max(var_646_1, arg_643_1.talkMaxDuration)

			if var_646_0 <= arg_643_1.time_ and arg_643_1.time_ < var_646_0 + var_646_10 then
				arg_643_1.typewritter.percent = (arg_643_1.time_ - var_646_0) / var_646_10

				arg_643_1.typewritter:SetDirty()
			end

			if arg_643_1.time_ >= var_646_0 + var_646_10 and arg_643_1.time_ < var_646_0 + var_646_10 + arg_646_0 then
				arg_643_1.typewritter.percent = 1

				arg_643_1.typewritter:SetDirty()
				arg_643_1:ShowNextGo(true)
			end
		end
	end,
	Play120021158 = function(arg_647_0, arg_647_1)
		arg_647_1.time_ = 0
		arg_647_1.frameCnt_ = 0
		arg_647_1.state_ = "playing"
		arg_647_1.curTalkId_ = 120021158
		arg_647_1.duration_ = 5.333

		local var_647_0 = {
			zh = 3.3,
			ja = 5.333
		}
		local var_647_1 = manager.audio:GetLocalizationFlag()

		if var_647_0[var_647_1] ~= nil then
			arg_647_1.duration_ = var_647_0[var_647_1]
		end

		SetActive(arg_647_1.tipsGo_, false)

		function arg_647_1.onSingleLineFinish_()
			arg_647_1.onSingleLineUpdate_ = nil
			arg_647_1.onSingleLineFinish_ = nil
			arg_647_1.state_ = "waiting"
		end

		function arg_647_1.playNext_(arg_649_0)
			if arg_649_0 == 1 then
				arg_647_0:Play120021159(arg_647_1)
			end
		end

		function arg_647_1.onSingleLineUpdate_(arg_650_0)
			local var_650_0 = arg_647_1.actors_["1075ui_story"]
			local var_650_1 = 0

			if var_650_1 < arg_647_1.time_ and arg_647_1.time_ <= var_650_1 + arg_650_0 and arg_647_1.var_.characterEffect1075ui_story == nil then
				arg_647_1.var_.characterEffect1075ui_story = var_650_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_2 = 0.2

			if var_650_1 <= arg_647_1.time_ and arg_647_1.time_ < var_650_1 + var_650_2 then
				local var_650_3 = (arg_647_1.time_ - var_650_1) / var_650_2

				if arg_647_1.var_.characterEffect1075ui_story then
					local var_650_4 = Mathf.Lerp(0, 0.5, var_650_3)

					arg_647_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_647_1.var_.characterEffect1075ui_story.fillRatio = var_650_4
				end
			end

			if arg_647_1.time_ >= var_650_1 + var_650_2 and arg_647_1.time_ < var_650_1 + var_650_2 + arg_650_0 and arg_647_1.var_.characterEffect1075ui_story then
				local var_650_5 = 0.5

				arg_647_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_647_1.var_.characterEffect1075ui_story.fillRatio = var_650_5
			end

			local var_650_6 = arg_647_1.actors_["1084ui_story"]
			local var_650_7 = 0

			if var_650_7 < arg_647_1.time_ and arg_647_1.time_ <= var_650_7 + arg_650_0 and arg_647_1.var_.characterEffect1084ui_story == nil then
				arg_647_1.var_.characterEffect1084ui_story = var_650_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_650_8 = 0.2

			if var_650_7 <= arg_647_1.time_ and arg_647_1.time_ < var_650_7 + var_650_8 then
				local var_650_9 = (arg_647_1.time_ - var_650_7) / var_650_8

				if arg_647_1.var_.characterEffect1084ui_story then
					arg_647_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_647_1.time_ >= var_650_7 + var_650_8 and arg_647_1.time_ < var_650_7 + var_650_8 + arg_650_0 and arg_647_1.var_.characterEffect1084ui_story then
				arg_647_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_650_10 = 0

			if var_650_10 < arg_647_1.time_ and arg_647_1.time_ <= var_650_10 + arg_650_0 then
				arg_647_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_650_11 = 0

			if var_650_11 < arg_647_1.time_ and arg_647_1.time_ <= var_650_11 + arg_650_0 then
				arg_647_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_650_12 = 0
			local var_650_13 = 0.4

			if var_650_12 < arg_647_1.time_ and arg_647_1.time_ <= var_650_12 + arg_650_0 then
				arg_647_1.talkMaxDuration = 0
				arg_647_1.dialogCg_.alpha = 1

				arg_647_1.dialog_:SetActive(true)
				SetActive(arg_647_1.leftNameGo_, true)

				local var_650_14 = arg_647_1:FormatText(StoryNameCfg[6].name)

				arg_647_1.leftNameTxt_.text = var_650_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_647_1.leftNameTxt_.transform)

				arg_647_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_647_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_647_1:RecordName(arg_647_1.leftNameTxt_.text)
				SetActive(arg_647_1.iconTrs_.gameObject, false)
				arg_647_1.callingController_:SetSelectedState("normal")

				local var_650_15 = arg_647_1:GetWordFromCfg(120021158)
				local var_650_16 = arg_647_1:FormatText(var_650_15.content)

				arg_647_1.text_.text = var_650_16

				LuaForUtil.ClearLinePrefixSymbol(arg_647_1.text_)

				local var_650_17 = 16
				local var_650_18 = utf8.len(var_650_16)
				local var_650_19 = var_650_17 <= 0 and var_650_13 or var_650_13 * (var_650_18 / var_650_17)

				if var_650_19 > 0 and var_650_13 < var_650_19 then
					arg_647_1.talkMaxDuration = var_650_19

					if var_650_19 + var_650_12 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_19 + var_650_12
					end
				end

				arg_647_1.text_.text = var_650_16
				arg_647_1.typewritter.percent = 0

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021158", "story_v_out_120021.awb") ~= 0 then
					local var_650_20 = manager.audio:GetVoiceLength("story_v_out_120021", "120021158", "story_v_out_120021.awb") / 1000

					if var_650_20 + var_650_12 > arg_647_1.duration_ then
						arg_647_1.duration_ = var_650_20 + var_650_12
					end

					if var_650_15.prefab_name ~= "" and arg_647_1.actors_[var_650_15.prefab_name] ~= nil then
						local var_650_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_647_1.actors_[var_650_15.prefab_name].transform, "story_v_out_120021", "120021158", "story_v_out_120021.awb")

						arg_647_1:RecordAudio("120021158", var_650_21)
						arg_647_1:RecordAudio("120021158", var_650_21)
					else
						arg_647_1:AudioAction("play", "voice", "story_v_out_120021", "120021158", "story_v_out_120021.awb")
					end

					arg_647_1:RecordHistoryTalkVoice("story_v_out_120021", "120021158", "story_v_out_120021.awb")
				end

				arg_647_1:RecordContent(arg_647_1.text_.text)
			end

			local var_650_22 = math.max(var_650_13, arg_647_1.talkMaxDuration)

			if var_650_12 <= arg_647_1.time_ and arg_647_1.time_ < var_650_12 + var_650_22 then
				arg_647_1.typewritter.percent = (arg_647_1.time_ - var_650_12) / var_650_22

				arg_647_1.typewritter:SetDirty()
			end

			if arg_647_1.time_ >= var_650_12 + var_650_22 and arg_647_1.time_ < var_650_12 + var_650_22 + arg_650_0 then
				arg_647_1.typewritter.percent = 1

				arg_647_1.typewritter:SetDirty()
				arg_647_1:ShowNextGo(true)
			end
		end
	end,
	Play120021159 = function(arg_651_0, arg_651_1)
		arg_651_1.time_ = 0
		arg_651_1.frameCnt_ = 0
		arg_651_1.state_ = "playing"
		arg_651_1.curTalkId_ = 120021159
		arg_651_1.duration_ = 2.8

		local var_651_0 = {
			zh = 2.1,
			ja = 2.8
		}
		local var_651_1 = manager.audio:GetLocalizationFlag()

		if var_651_0[var_651_1] ~= nil then
			arg_651_1.duration_ = var_651_0[var_651_1]
		end

		SetActive(arg_651_1.tipsGo_, false)

		function arg_651_1.onSingleLineFinish_()
			arg_651_1.onSingleLineUpdate_ = nil
			arg_651_1.onSingleLineFinish_ = nil
			arg_651_1.state_ = "waiting"
		end

		function arg_651_1.playNext_(arg_653_0)
			if arg_653_0 == 1 then
				arg_651_0:Play120021160(arg_651_1)
			end
		end

		function arg_651_1.onSingleLineUpdate_(arg_654_0)
			local var_654_0 = 0

			if var_654_0 < arg_651_1.time_ and arg_651_1.time_ <= var_654_0 + arg_654_0 then
				arg_651_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4512")
			end

			local var_654_1 = 0

			if var_654_1 < arg_651_1.time_ and arg_651_1.time_ <= var_654_1 + arg_654_0 then
				arg_651_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_654_2 = 0
			local var_654_3 = 0.225

			if var_654_2 < arg_651_1.time_ and arg_651_1.time_ <= var_654_2 + arg_654_0 then
				arg_651_1.talkMaxDuration = 0
				arg_651_1.dialogCg_.alpha = 1

				arg_651_1.dialog_:SetActive(true)
				SetActive(arg_651_1.leftNameGo_, true)

				local var_654_4 = arg_651_1:FormatText(StoryNameCfg[6].name)

				arg_651_1.leftNameTxt_.text = var_654_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_651_1.leftNameTxt_.transform)

				arg_651_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_651_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_651_1:RecordName(arg_651_1.leftNameTxt_.text)
				SetActive(arg_651_1.iconTrs_.gameObject, false)
				arg_651_1.callingController_:SetSelectedState("normal")

				local var_654_5 = arg_651_1:GetWordFromCfg(120021159)
				local var_654_6 = arg_651_1:FormatText(var_654_5.content)

				arg_651_1.text_.text = var_654_6

				LuaForUtil.ClearLinePrefixSymbol(arg_651_1.text_)

				local var_654_7 = 9
				local var_654_8 = utf8.len(var_654_6)
				local var_654_9 = var_654_7 <= 0 and var_654_3 or var_654_3 * (var_654_8 / var_654_7)

				if var_654_9 > 0 and var_654_3 < var_654_9 then
					arg_651_1.talkMaxDuration = var_654_9

					if var_654_9 + var_654_2 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_9 + var_654_2
					end
				end

				arg_651_1.text_.text = var_654_6
				arg_651_1.typewritter.percent = 0

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021159", "story_v_out_120021.awb") ~= 0 then
					local var_654_10 = manager.audio:GetVoiceLength("story_v_out_120021", "120021159", "story_v_out_120021.awb") / 1000

					if var_654_10 + var_654_2 > arg_651_1.duration_ then
						arg_651_1.duration_ = var_654_10 + var_654_2
					end

					if var_654_5.prefab_name ~= "" and arg_651_1.actors_[var_654_5.prefab_name] ~= nil then
						local var_654_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_651_1.actors_[var_654_5.prefab_name].transform, "story_v_out_120021", "120021159", "story_v_out_120021.awb")

						arg_651_1:RecordAudio("120021159", var_654_11)
						arg_651_1:RecordAudio("120021159", var_654_11)
					else
						arg_651_1:AudioAction("play", "voice", "story_v_out_120021", "120021159", "story_v_out_120021.awb")
					end

					arg_651_1:RecordHistoryTalkVoice("story_v_out_120021", "120021159", "story_v_out_120021.awb")
				end

				arg_651_1:RecordContent(arg_651_1.text_.text)
			end

			local var_654_12 = math.max(var_654_3, arg_651_1.talkMaxDuration)

			if var_654_2 <= arg_651_1.time_ and arg_651_1.time_ < var_654_2 + var_654_12 then
				arg_651_1.typewritter.percent = (arg_651_1.time_ - var_654_2) / var_654_12

				arg_651_1.typewritter:SetDirty()
			end

			if arg_651_1.time_ >= var_654_2 + var_654_12 and arg_651_1.time_ < var_654_2 + var_654_12 + arg_654_0 then
				arg_651_1.typewritter.percent = 1

				arg_651_1.typewritter:SetDirty()
				arg_651_1:ShowNextGo(true)
			end
		end
	end,
	Play120021160 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 120021160
		arg_655_1.duration_ = 6.1

		local var_655_0 = {
			zh = 6.1,
			ja = 5.6
		}
		local var_655_1 = manager.audio:GetLocalizationFlag()

		if var_655_0[var_655_1] ~= nil then
			arg_655_1.duration_ = var_655_0[var_655_1]
		end

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play120021161(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = arg_655_1.actors_["1075ui_story"]
			local var_658_1 = 0

			if var_658_1 < arg_655_1.time_ and arg_655_1.time_ <= var_658_1 + arg_658_0 and arg_655_1.var_.characterEffect1075ui_story == nil then
				arg_655_1.var_.characterEffect1075ui_story = var_658_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_658_2 = 0.2

			if var_658_1 <= arg_655_1.time_ and arg_655_1.time_ < var_658_1 + var_658_2 then
				local var_658_3 = (arg_655_1.time_ - var_658_1) / var_658_2

				if arg_655_1.var_.characterEffect1075ui_story then
					arg_655_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_655_1.time_ >= var_658_1 + var_658_2 and arg_655_1.time_ < var_658_1 + var_658_2 + arg_658_0 and arg_655_1.var_.characterEffect1075ui_story then
				arg_655_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_658_4 = arg_655_1.actors_["1084ui_story"]
			local var_658_5 = 0

			if var_658_5 < arg_655_1.time_ and arg_655_1.time_ <= var_658_5 + arg_658_0 and arg_655_1.var_.characterEffect1084ui_story == nil then
				arg_655_1.var_.characterEffect1084ui_story = var_658_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_658_6 = 0.2

			if var_658_5 <= arg_655_1.time_ and arg_655_1.time_ < var_658_5 + var_658_6 then
				local var_658_7 = (arg_655_1.time_ - var_658_5) / var_658_6

				if arg_655_1.var_.characterEffect1084ui_story then
					local var_658_8 = Mathf.Lerp(0, 0.5, var_658_7)

					arg_655_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_655_1.var_.characterEffect1084ui_story.fillRatio = var_658_8
				end
			end

			if arg_655_1.time_ >= var_658_5 + var_658_6 and arg_655_1.time_ < var_658_5 + var_658_6 + arg_658_0 and arg_655_1.var_.characterEffect1084ui_story then
				local var_658_9 = 0.5

				arg_655_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_655_1.var_.characterEffect1084ui_story.fillRatio = var_658_9
			end

			local var_658_10 = 0

			if var_658_10 < arg_655_1.time_ and arg_655_1.time_ <= var_658_10 + arg_658_0 then
				arg_655_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_2")
			end

			local var_658_11 = 0

			if var_658_11 < arg_655_1.time_ and arg_655_1.time_ <= var_658_11 + arg_658_0 then
				arg_655_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_658_12 = 0
			local var_658_13 = 0.75

			if var_658_12 < arg_655_1.time_ and arg_655_1.time_ <= var_658_12 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_14 = arg_655_1:FormatText(StoryNameCfg[381].name)

				arg_655_1.leftNameTxt_.text = var_658_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, false)
				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_15 = arg_655_1:GetWordFromCfg(120021160)
				local var_658_16 = arg_655_1:FormatText(var_658_15.content)

				arg_655_1.text_.text = var_658_16

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_17 = 30
				local var_658_18 = utf8.len(var_658_16)
				local var_658_19 = var_658_17 <= 0 and var_658_13 or var_658_13 * (var_658_18 / var_658_17)

				if var_658_19 > 0 and var_658_13 < var_658_19 then
					arg_655_1.talkMaxDuration = var_658_19

					if var_658_19 + var_658_12 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_19 + var_658_12
					end
				end

				arg_655_1.text_.text = var_658_16
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021160", "story_v_out_120021.awb") ~= 0 then
					local var_658_20 = manager.audio:GetVoiceLength("story_v_out_120021", "120021160", "story_v_out_120021.awb") / 1000

					if var_658_20 + var_658_12 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_20 + var_658_12
					end

					if var_658_15.prefab_name ~= "" and arg_655_1.actors_[var_658_15.prefab_name] ~= nil then
						local var_658_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_655_1.actors_[var_658_15.prefab_name].transform, "story_v_out_120021", "120021160", "story_v_out_120021.awb")

						arg_655_1:RecordAudio("120021160", var_658_21)
						arg_655_1:RecordAudio("120021160", var_658_21)
					else
						arg_655_1:AudioAction("play", "voice", "story_v_out_120021", "120021160", "story_v_out_120021.awb")
					end

					arg_655_1:RecordHistoryTalkVoice("story_v_out_120021", "120021160", "story_v_out_120021.awb")
				end

				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_22 = math.max(var_658_13, arg_655_1.talkMaxDuration)

			if var_658_12 <= arg_655_1.time_ and arg_655_1.time_ < var_658_12 + var_658_22 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_12) / var_658_22

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_12 + var_658_22 and arg_655_1.time_ < var_658_12 + var_658_22 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play120021161 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 120021161
		arg_659_1.duration_ = 5

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play120021162(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = arg_659_1.actors_["1075ui_story"]
			local var_662_1 = 0

			if var_662_1 < arg_659_1.time_ and arg_659_1.time_ <= var_662_1 + arg_662_0 and arg_659_1.var_.characterEffect1075ui_story == nil then
				arg_659_1.var_.characterEffect1075ui_story = var_662_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_662_2 = 0.2

			if var_662_1 <= arg_659_1.time_ and arg_659_1.time_ < var_662_1 + var_662_2 then
				local var_662_3 = (arg_659_1.time_ - var_662_1) / var_662_2

				if arg_659_1.var_.characterEffect1075ui_story then
					local var_662_4 = Mathf.Lerp(0, 0.5, var_662_3)

					arg_659_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_659_1.var_.characterEffect1075ui_story.fillRatio = var_662_4
				end
			end

			if arg_659_1.time_ >= var_662_1 + var_662_2 and arg_659_1.time_ < var_662_1 + var_662_2 + arg_662_0 and arg_659_1.var_.characterEffect1075ui_story then
				local var_662_5 = 0.5

				arg_659_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_659_1.var_.characterEffect1075ui_story.fillRatio = var_662_5
			end

			local var_662_6 = 0
			local var_662_7 = 0.1

			if var_662_6 < arg_659_1.time_ and arg_659_1.time_ <= var_662_6 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0
				arg_659_1.dialogCg_.alpha = 1

				arg_659_1.dialog_:SetActive(true)
				SetActive(arg_659_1.leftNameGo_, true)

				local var_662_8 = arg_659_1:FormatText(StoryNameCfg[7].name)

				arg_659_1.leftNameTxt_.text = var_662_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_659_1.leftNameTxt_.transform)

				arg_659_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_659_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_659_1:RecordName(arg_659_1.leftNameTxt_.text)
				SetActive(arg_659_1.iconTrs_.gameObject, false)
				arg_659_1.callingController_:SetSelectedState("normal")

				local var_662_9 = arg_659_1:GetWordFromCfg(120021161)
				local var_662_10 = arg_659_1:FormatText(var_662_9.content)

				arg_659_1.text_.text = var_662_10

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.text_)

				local var_662_11 = 4
				local var_662_12 = utf8.len(var_662_10)
				local var_662_13 = var_662_11 <= 0 and var_662_7 or var_662_7 * (var_662_12 / var_662_11)

				if var_662_13 > 0 and var_662_7 < var_662_13 then
					arg_659_1.talkMaxDuration = var_662_13

					if var_662_13 + var_662_6 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_13 + var_662_6
					end
				end

				arg_659_1.text_.text = var_662_10
				arg_659_1.typewritter.percent = 0

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(false)
				arg_659_1:RecordContent(arg_659_1.text_.text)
			end

			local var_662_14 = math.max(var_662_7, arg_659_1.talkMaxDuration)

			if var_662_6 <= arg_659_1.time_ and arg_659_1.time_ < var_662_6 + var_662_14 then
				arg_659_1.typewritter.percent = (arg_659_1.time_ - var_662_6) / var_662_14

				arg_659_1.typewritter:SetDirty()
			end

			if arg_659_1.time_ >= var_662_6 + var_662_14 and arg_659_1.time_ < var_662_6 + var_662_14 + arg_662_0 then
				arg_659_1.typewritter.percent = 1

				arg_659_1.typewritter:SetDirty()
				arg_659_1:ShowNextGo(true)
			end
		end
	end,
	Play120021162 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 120021162
		arg_663_1.duration_ = 5.933

		local var_663_0 = {
			zh = 3.4,
			ja = 5.933
		}
		local var_663_1 = manager.audio:GetLocalizationFlag()

		if var_663_0[var_663_1] ~= nil then
			arg_663_1.duration_ = var_663_0[var_663_1]
		end

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play120021163(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = arg_663_1.actors_["1075ui_story"]
			local var_666_1 = 0

			if var_666_1 < arg_663_1.time_ and arg_663_1.time_ <= var_666_1 + arg_666_0 and arg_663_1.var_.characterEffect1075ui_story == nil then
				arg_663_1.var_.characterEffect1075ui_story = var_666_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_666_2 = 0.2

			if var_666_1 <= arg_663_1.time_ and arg_663_1.time_ < var_666_1 + var_666_2 then
				local var_666_3 = (arg_663_1.time_ - var_666_1) / var_666_2

				if arg_663_1.var_.characterEffect1075ui_story then
					arg_663_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_663_1.time_ >= var_666_1 + var_666_2 and arg_663_1.time_ < var_666_1 + var_666_2 + arg_666_0 and arg_663_1.var_.characterEffect1075ui_story then
				arg_663_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_666_4 = 0
			local var_666_5 = 0.4

			if var_666_4 < arg_663_1.time_ and arg_663_1.time_ <= var_666_4 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0
				arg_663_1.dialogCg_.alpha = 1

				arg_663_1.dialog_:SetActive(true)
				SetActive(arg_663_1.leftNameGo_, true)

				local var_666_6 = arg_663_1:FormatText(StoryNameCfg[381].name)

				arg_663_1.leftNameTxt_.text = var_666_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_663_1.leftNameTxt_.transform)

				arg_663_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_663_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_663_1:RecordName(arg_663_1.leftNameTxt_.text)
				SetActive(arg_663_1.iconTrs_.gameObject, false)
				arg_663_1.callingController_:SetSelectedState("normal")

				local var_666_7 = arg_663_1:GetWordFromCfg(120021162)
				local var_666_8 = arg_663_1:FormatText(var_666_7.content)

				arg_663_1.text_.text = var_666_8

				LuaForUtil.ClearLinePrefixSymbol(arg_663_1.text_)

				local var_666_9 = 16
				local var_666_10 = utf8.len(var_666_8)
				local var_666_11 = var_666_9 <= 0 and var_666_5 or var_666_5 * (var_666_10 / var_666_9)

				if var_666_11 > 0 and var_666_5 < var_666_11 then
					arg_663_1.talkMaxDuration = var_666_11

					if var_666_11 + var_666_4 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_11 + var_666_4
					end
				end

				arg_663_1.text_.text = var_666_8
				arg_663_1.typewritter.percent = 0

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021162", "story_v_out_120021.awb") ~= 0 then
					local var_666_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021162", "story_v_out_120021.awb") / 1000

					if var_666_12 + var_666_4 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_12 + var_666_4
					end

					if var_666_7.prefab_name ~= "" and arg_663_1.actors_[var_666_7.prefab_name] ~= nil then
						local var_666_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_663_1.actors_[var_666_7.prefab_name].transform, "story_v_out_120021", "120021162", "story_v_out_120021.awb")

						arg_663_1:RecordAudio("120021162", var_666_13)
						arg_663_1:RecordAudio("120021162", var_666_13)
					else
						arg_663_1:AudioAction("play", "voice", "story_v_out_120021", "120021162", "story_v_out_120021.awb")
					end

					arg_663_1:RecordHistoryTalkVoice("story_v_out_120021", "120021162", "story_v_out_120021.awb")
				end

				arg_663_1:RecordContent(arg_663_1.text_.text)
			end

			local var_666_14 = math.max(var_666_5, arg_663_1.talkMaxDuration)

			if var_666_4 <= arg_663_1.time_ and arg_663_1.time_ < var_666_4 + var_666_14 then
				arg_663_1.typewritter.percent = (arg_663_1.time_ - var_666_4) / var_666_14

				arg_663_1.typewritter:SetDirty()
			end

			if arg_663_1.time_ >= var_666_4 + var_666_14 and arg_663_1.time_ < var_666_4 + var_666_14 + arg_666_0 then
				arg_663_1.typewritter.percent = 1

				arg_663_1.typewritter:SetDirty()
				arg_663_1:ShowNextGo(true)
			end
		end
	end,
	Play120021163 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 120021163
		arg_667_1.duration_ = 4.6

		local var_667_0 = {
			zh = 3.2,
			ja = 4.6
		}
		local var_667_1 = manager.audio:GetLocalizationFlag()

		if var_667_0[var_667_1] ~= nil then
			arg_667_1.duration_ = var_667_0[var_667_1]
		end

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play120021164(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0
			local var_670_1 = 0.375

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0
				arg_667_1.dialogCg_.alpha = 1

				arg_667_1.dialog_:SetActive(true)
				SetActive(arg_667_1.leftNameGo_, true)

				local var_670_2 = arg_667_1:FormatText(StoryNameCfg[381].name)

				arg_667_1.leftNameTxt_.text = var_670_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_667_1.leftNameTxt_.transform)

				arg_667_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_667_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_667_1:RecordName(arg_667_1.leftNameTxt_.text)
				SetActive(arg_667_1.iconTrs_.gameObject, false)
				arg_667_1.callingController_:SetSelectedState("normal")

				local var_670_3 = arg_667_1:GetWordFromCfg(120021163)
				local var_670_4 = arg_667_1:FormatText(var_670_3.content)

				arg_667_1.text_.text = var_670_4

				LuaForUtil.ClearLinePrefixSymbol(arg_667_1.text_)

				local var_670_5 = 15
				local var_670_6 = utf8.len(var_670_4)
				local var_670_7 = var_670_5 <= 0 and var_670_1 or var_670_1 * (var_670_6 / var_670_5)

				if var_670_7 > 0 and var_670_1 < var_670_7 then
					arg_667_1.talkMaxDuration = var_670_7

					if var_670_7 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_7 + var_670_0
					end
				end

				arg_667_1.text_.text = var_670_4
				arg_667_1.typewritter.percent = 0

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021163", "story_v_out_120021.awb") ~= 0 then
					local var_670_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021163", "story_v_out_120021.awb") / 1000

					if var_670_8 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_8 + var_670_0
					end

					if var_670_3.prefab_name ~= "" and arg_667_1.actors_[var_670_3.prefab_name] ~= nil then
						local var_670_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_667_1.actors_[var_670_3.prefab_name].transform, "story_v_out_120021", "120021163", "story_v_out_120021.awb")

						arg_667_1:RecordAudio("120021163", var_670_9)
						arg_667_1:RecordAudio("120021163", var_670_9)
					else
						arg_667_1:AudioAction("play", "voice", "story_v_out_120021", "120021163", "story_v_out_120021.awb")
					end

					arg_667_1:RecordHistoryTalkVoice("story_v_out_120021", "120021163", "story_v_out_120021.awb")
				end

				arg_667_1:RecordContent(arg_667_1.text_.text)
			end

			local var_670_10 = math.max(var_670_1, arg_667_1.talkMaxDuration)

			if var_670_0 <= arg_667_1.time_ and arg_667_1.time_ < var_670_0 + var_670_10 then
				arg_667_1.typewritter.percent = (arg_667_1.time_ - var_670_0) / var_670_10

				arg_667_1.typewritter:SetDirty()
			end

			if arg_667_1.time_ >= var_670_0 + var_670_10 and arg_667_1.time_ < var_670_0 + var_670_10 + arg_670_0 then
				arg_667_1.typewritter.percent = 1

				arg_667_1.typewritter:SetDirty()
				arg_667_1:ShowNextGo(true)
			end
		end
	end,
	Play120021164 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 120021164
		arg_671_1.duration_ = 5

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play120021165(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = arg_671_1.actors_["1084ui_story"].transform
			local var_674_1 = 0

			if var_674_1 < arg_671_1.time_ and arg_671_1.time_ <= var_674_1 + arg_674_0 then
				arg_671_1.var_.moveOldPos1084ui_story = var_674_0.localPosition
			end

			local var_674_2 = 0.001

			if var_674_1 <= arg_671_1.time_ and arg_671_1.time_ < var_674_1 + var_674_2 then
				local var_674_3 = (arg_671_1.time_ - var_674_1) / var_674_2
				local var_674_4 = Vector3.New(0, 100, 0)

				var_674_0.localPosition = Vector3.Lerp(arg_671_1.var_.moveOldPos1084ui_story, var_674_4, var_674_3)

				local var_674_5 = manager.ui.mainCamera.transform.position - var_674_0.position

				var_674_0.forward = Vector3.New(var_674_5.x, var_674_5.y, var_674_5.z)

				local var_674_6 = var_674_0.localEulerAngles

				var_674_6.z = 0
				var_674_6.x = 0
				var_674_0.localEulerAngles = var_674_6
			end

			if arg_671_1.time_ >= var_674_1 + var_674_2 and arg_671_1.time_ < var_674_1 + var_674_2 + arg_674_0 then
				var_674_0.localPosition = Vector3.New(0, 100, 0)

				local var_674_7 = manager.ui.mainCamera.transform.position - var_674_0.position

				var_674_0.forward = Vector3.New(var_674_7.x, var_674_7.y, var_674_7.z)

				local var_674_8 = var_674_0.localEulerAngles

				var_674_8.z = 0
				var_674_8.x = 0
				var_674_0.localEulerAngles = var_674_8
			end

			local var_674_9 = arg_671_1.actors_["10044ui_story"].transform
			local var_674_10 = 0

			if var_674_10 < arg_671_1.time_ and arg_671_1.time_ <= var_674_10 + arg_674_0 then
				arg_671_1.var_.moveOldPos10044ui_story = var_674_9.localPosition
			end

			local var_674_11 = 0.001

			if var_674_10 <= arg_671_1.time_ and arg_671_1.time_ < var_674_10 + var_674_11 then
				local var_674_12 = (arg_671_1.time_ - var_674_10) / var_674_11
				local var_674_13 = Vector3.New(0, -0.72, -6.3)

				var_674_9.localPosition = Vector3.Lerp(arg_671_1.var_.moveOldPos10044ui_story, var_674_13, var_674_12)

				local var_674_14 = manager.ui.mainCamera.transform.position - var_674_9.position

				var_674_9.forward = Vector3.New(var_674_14.x, var_674_14.y, var_674_14.z)

				local var_674_15 = var_674_9.localEulerAngles

				var_674_15.z = 0
				var_674_15.x = 0
				var_674_9.localEulerAngles = var_674_15
			end

			if arg_671_1.time_ >= var_674_10 + var_674_11 and arg_671_1.time_ < var_674_10 + var_674_11 + arg_674_0 then
				var_674_9.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_674_16 = manager.ui.mainCamera.transform.position - var_674_9.position

				var_674_9.forward = Vector3.New(var_674_16.x, var_674_16.y, var_674_16.z)

				local var_674_17 = var_674_9.localEulerAngles

				var_674_17.z = 0
				var_674_17.x = 0
				var_674_9.localEulerAngles = var_674_17
			end

			local var_674_18 = arg_671_1.actors_["1075ui_story"]
			local var_674_19 = 0

			if var_674_19 < arg_671_1.time_ and arg_671_1.time_ <= var_674_19 + arg_674_0 and arg_671_1.var_.characterEffect1075ui_story == nil then
				arg_671_1.var_.characterEffect1075ui_story = var_674_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_674_20 = 0.034

			if var_674_19 <= arg_671_1.time_ and arg_671_1.time_ < var_674_19 + var_674_20 then
				local var_674_21 = (arg_671_1.time_ - var_674_19) / var_674_20

				if arg_671_1.var_.characterEffect1075ui_story then
					local var_674_22 = Mathf.Lerp(0, 0.5, var_674_21)

					arg_671_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_671_1.var_.characterEffect1075ui_story.fillRatio = var_674_22
				end
			end

			if arg_671_1.time_ >= var_674_19 + var_674_20 and arg_671_1.time_ < var_674_19 + var_674_20 + arg_674_0 and arg_671_1.var_.characterEffect1075ui_story then
				local var_674_23 = 0.5

				arg_671_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_671_1.var_.characterEffect1075ui_story.fillRatio = var_674_23
			end

			local var_674_24 = 0
			local var_674_25 = 1

			if var_674_24 < arg_671_1.time_ and arg_671_1.time_ <= var_674_24 + arg_674_0 then
				local var_674_26 = "play"
				local var_674_27 = "effect"

				arg_671_1:AudioAction(var_674_26, var_674_27, "se_story_120_00", "se_story_120_00_tool", "")
			end

			local var_674_28 = 0

			if var_674_28 < arg_671_1.time_ and arg_671_1.time_ <= var_674_28 + arg_674_0 then
				arg_671_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_674_29 = 0

			if var_674_29 < arg_671_1.time_ and arg_671_1.time_ <= var_674_29 + arg_674_0 then
				arg_671_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_674_30 = arg_671_1.actors_["1075ui_story"].transform
			local var_674_31 = 0

			if var_674_31 < arg_671_1.time_ and arg_671_1.time_ <= var_674_31 + arg_674_0 then
				arg_671_1.var_.moveOldPos1075ui_story = var_674_30.localPosition
			end

			local var_674_32 = 0.001

			if var_674_31 <= arg_671_1.time_ and arg_671_1.time_ < var_674_31 + var_674_32 then
				local var_674_33 = (arg_671_1.time_ - var_674_31) / var_674_32
				local var_674_34 = Vector3.New(0, 100, 0)

				var_674_30.localPosition = Vector3.Lerp(arg_671_1.var_.moveOldPos1075ui_story, var_674_34, var_674_33)

				local var_674_35 = manager.ui.mainCamera.transform.position - var_674_30.position

				var_674_30.forward = Vector3.New(var_674_35.x, var_674_35.y, var_674_35.z)

				local var_674_36 = var_674_30.localEulerAngles

				var_674_36.z = 0
				var_674_36.x = 0
				var_674_30.localEulerAngles = var_674_36
			end

			if arg_671_1.time_ >= var_674_31 + var_674_32 and arg_671_1.time_ < var_674_31 + var_674_32 + arg_674_0 then
				var_674_30.localPosition = Vector3.New(0, 100, 0)

				local var_674_37 = manager.ui.mainCamera.transform.position - var_674_30.position

				var_674_30.forward = Vector3.New(var_674_37.x, var_674_37.y, var_674_37.z)

				local var_674_38 = var_674_30.localEulerAngles

				var_674_38.z = 0
				var_674_38.x = 0
				var_674_30.localEulerAngles = var_674_38
			end

			local var_674_39 = 0
			local var_674_40 = 0.75

			if var_674_39 < arg_671_1.time_ and arg_671_1.time_ <= var_674_39 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0
				arg_671_1.dialogCg_.alpha = 1

				arg_671_1.dialog_:SetActive(true)
				SetActive(arg_671_1.leftNameGo_, false)

				arg_671_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_671_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_671_1:RecordName(arg_671_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_671_1.iconTrs_.gameObject, false)
				arg_671_1.callingController_:SetSelectedState("normal")

				local var_674_41 = arg_671_1:GetWordFromCfg(120021164)
				local var_674_42 = arg_671_1:FormatText(var_674_41.content)

				arg_671_1.text_.text = var_674_42

				LuaForUtil.ClearLinePrefixSymbol(arg_671_1.text_)

				local var_674_43 = 30
				local var_674_44 = utf8.len(var_674_42)
				local var_674_45 = var_674_43 <= 0 and var_674_40 or var_674_40 * (var_674_44 / var_674_43)

				if var_674_45 > 0 and var_674_40 < var_674_45 then
					arg_671_1.talkMaxDuration = var_674_45

					if var_674_45 + var_674_39 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_45 + var_674_39
					end
				end

				arg_671_1.text_.text = var_674_42
				arg_671_1.typewritter.percent = 0

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(false)
				arg_671_1:RecordContent(arg_671_1.text_.text)
			end

			local var_674_46 = math.max(var_674_40, arg_671_1.talkMaxDuration)

			if var_674_39 <= arg_671_1.time_ and arg_671_1.time_ < var_674_39 + var_674_46 then
				arg_671_1.typewritter.percent = (arg_671_1.time_ - var_674_39) / var_674_46

				arg_671_1.typewritter:SetDirty()
			end

			if arg_671_1.time_ >= var_674_39 + var_674_46 and arg_671_1.time_ < var_674_39 + var_674_46 + arg_674_0 then
				arg_671_1.typewritter.percent = 1

				arg_671_1.typewritter:SetDirty()
				arg_671_1:ShowNextGo(true)
			end
		end
	end,
	Play120021165 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 120021165
		arg_675_1.duration_ = 2.9

		local var_675_0 = {
			zh = 1.5,
			ja = 2.9
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
				arg_675_0:Play120021166(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = arg_675_1.actors_["10044ui_story"]
			local var_678_1 = 0

			if var_678_1 < arg_675_1.time_ and arg_675_1.time_ <= var_678_1 + arg_678_0 and arg_675_1.var_.characterEffect10044ui_story == nil then
				arg_675_1.var_.characterEffect10044ui_story = var_678_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_678_2 = 0.2

			if var_678_1 <= arg_675_1.time_ and arg_675_1.time_ < var_678_1 + var_678_2 then
				local var_678_3 = (arg_675_1.time_ - var_678_1) / var_678_2

				if arg_675_1.var_.characterEffect10044ui_story then
					arg_675_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_675_1.time_ >= var_678_1 + var_678_2 and arg_675_1.time_ < var_678_1 + var_678_2 + arg_678_0 and arg_675_1.var_.characterEffect10044ui_story then
				arg_675_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_678_4 = 0
			local var_678_5 = 0.175

			if var_678_4 < arg_675_1.time_ and arg_675_1.time_ <= var_678_4 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0
				arg_675_1.dialogCg_.alpha = 1

				arg_675_1.dialog_:SetActive(true)
				SetActive(arg_675_1.leftNameGo_, true)

				local var_678_6 = arg_675_1:FormatText(StoryNameCfg[380].name)

				arg_675_1.leftNameTxt_.text = var_678_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_675_1.leftNameTxt_.transform)

				arg_675_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_675_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_675_1:RecordName(arg_675_1.leftNameTxt_.text)
				SetActive(arg_675_1.iconTrs_.gameObject, false)
				arg_675_1.callingController_:SetSelectedState("normal")

				local var_678_7 = arg_675_1:GetWordFromCfg(120021165)
				local var_678_8 = arg_675_1:FormatText(var_678_7.content)

				arg_675_1.text_.text = var_678_8

				LuaForUtil.ClearLinePrefixSymbol(arg_675_1.text_)

				local var_678_9 = 7
				local var_678_10 = utf8.len(var_678_8)
				local var_678_11 = var_678_9 <= 0 and var_678_5 or var_678_5 * (var_678_10 / var_678_9)

				if var_678_11 > 0 and var_678_5 < var_678_11 then
					arg_675_1.talkMaxDuration = var_678_11

					if var_678_11 + var_678_4 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_11 + var_678_4
					end
				end

				arg_675_1.text_.text = var_678_8
				arg_675_1.typewritter.percent = 0

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021165", "story_v_out_120021.awb") ~= 0 then
					local var_678_12 = manager.audio:GetVoiceLength("story_v_out_120021", "120021165", "story_v_out_120021.awb") / 1000

					if var_678_12 + var_678_4 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_12 + var_678_4
					end

					if var_678_7.prefab_name ~= "" and arg_675_1.actors_[var_678_7.prefab_name] ~= nil then
						local var_678_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_675_1.actors_[var_678_7.prefab_name].transform, "story_v_out_120021", "120021165", "story_v_out_120021.awb")

						arg_675_1:RecordAudio("120021165", var_678_13)
						arg_675_1:RecordAudio("120021165", var_678_13)
					else
						arg_675_1:AudioAction("play", "voice", "story_v_out_120021", "120021165", "story_v_out_120021.awb")
					end

					arg_675_1:RecordHistoryTalkVoice("story_v_out_120021", "120021165", "story_v_out_120021.awb")
				end

				arg_675_1:RecordContent(arg_675_1.text_.text)
			end

			local var_678_14 = math.max(var_678_5, arg_675_1.talkMaxDuration)

			if var_678_4 <= arg_675_1.time_ and arg_675_1.time_ < var_678_4 + var_678_14 then
				arg_675_1.typewritter.percent = (arg_675_1.time_ - var_678_4) / var_678_14

				arg_675_1.typewritter:SetDirty()
			end

			if arg_675_1.time_ >= var_678_4 + var_678_14 and arg_675_1.time_ < var_678_4 + var_678_14 + arg_678_0 then
				arg_675_1.typewritter.percent = 1

				arg_675_1.typewritter:SetDirty()
				arg_675_1:ShowNextGo(true)
			end
		end
	end,
	Play120021166 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 120021166
		arg_679_1.duration_ = 6.366

		local var_679_0 = {
			zh = 4.5,
			ja = 6.366
		}
		local var_679_1 = manager.audio:GetLocalizationFlag()

		if var_679_0[var_679_1] ~= nil then
			arg_679_1.duration_ = var_679_0[var_679_1]
		end

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
			arg_679_1.auto_ = false
		end

		function arg_679_1.playNext_(arg_681_0)
			arg_679_1.onStoryFinished_()
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = 0
			local var_682_1 = 0.625

			if var_682_0 < arg_679_1.time_ and arg_679_1.time_ <= var_682_0 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0
				arg_679_1.dialogCg_.alpha = 1

				arg_679_1.dialog_:SetActive(true)
				SetActive(arg_679_1.leftNameGo_, true)

				local var_682_2 = arg_679_1:FormatText(StoryNameCfg[380].name)

				arg_679_1.leftNameTxt_.text = var_682_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_679_1.leftNameTxt_.transform)

				arg_679_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_679_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_679_1:RecordName(arg_679_1.leftNameTxt_.text)
				SetActive(arg_679_1.iconTrs_.gameObject, false)
				arg_679_1.callingController_:SetSelectedState("normal")

				local var_682_3 = arg_679_1:GetWordFromCfg(120021166)
				local var_682_4 = arg_679_1:FormatText(var_682_3.content)

				arg_679_1.text_.text = var_682_4

				LuaForUtil.ClearLinePrefixSymbol(arg_679_1.text_)

				local var_682_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_120021", "120021166", "story_v_out_120021.awb") ~= 0 then
					local var_682_8 = manager.audio:GetVoiceLength("story_v_out_120021", "120021166", "story_v_out_120021.awb") / 1000

					if var_682_8 + var_682_0 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_8 + var_682_0
					end

					if var_682_3.prefab_name ~= "" and arg_679_1.actors_[var_682_3.prefab_name] ~= nil then
						local var_682_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_679_1.actors_[var_682_3.prefab_name].transform, "story_v_out_120021", "120021166", "story_v_out_120021.awb")

						arg_679_1:RecordAudio("120021166", var_682_9)
						arg_679_1:RecordAudio("120021166", var_682_9)
					else
						arg_679_1:AudioAction("play", "voice", "story_v_out_120021", "120021166", "story_v_out_120021.awb")
					end

					arg_679_1:RecordHistoryTalkVoice("story_v_out_120021", "120021166", "story_v_out_120021.awb")
				end

				arg_679_1:RecordContent(arg_679_1.text_.text)
			end

			local var_682_10 = math.max(var_682_1, arg_679_1.talkMaxDuration)

			if var_682_0 <= arg_679_1.time_ and arg_679_1.time_ < var_682_0 + var_682_10 then
				arg_679_1.typewritter.percent = (arg_679_1.time_ - var_682_0) / var_682_10

				arg_679_1.typewritter:SetDirty()
			end

			if arg_679_1.time_ >= var_682_0 + var_682_10 and arg_679_1.time_ < var_682_0 + var_682_10 + arg_682_0 then
				arg_679_1.typewritter.percent = 1

				arg_679_1.typewritter:SetDirty()
				arg_679_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST29",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0103",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0108",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST32"
	},
	voices = {
		"story_v_out_120021.awb"
	}
}
