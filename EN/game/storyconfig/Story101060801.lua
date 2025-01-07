﻿return {
	Play106081001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 106081001
		arg_1_1.duration_ = 6

		local var_1_0 = {
			ja = 5.4,
			ko = 4.733,
			zh = 6,
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
				arg_1_0:Play106081002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "C07_1"

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
				local var_4_5 = arg_1_1.bgs_.C07_1

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
					if iter_4_0 ~= "C07_1" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.C07_1
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueC07_1 = var_4_20.a
					arg_1_1.var_.alphaMatValueC07_1 = var_4_19
				end

				arg_1_1.var_.alphaOldValueC07_1 = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueC07_1, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueC07_1 then
					local var_4_24 = arg_1_1.var_.alphaMatValueC07_1
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueC07_1 then
				local var_4_26 = arg_1_1.var_.alphaMatValueC07_1
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = 0
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_story_scheme", "bgm_story_scheme", "bgm_story_scheme.awb")

				local var_4_32 = ""
				local var_4_33 = manager.audio:GetAudioName("bgm_story_scheme", "bgm_story_scheme")

				if var_4_33 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_33 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_33

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_33
					end

					if arg_1_1.bgmTimer then
						arg_1_1.bgmTimer:Stop()

						arg_1_1.bgmTimer = nil
					end

					if arg_1_1.settingData.show_music_name == 1 then
						arg_1_1.musicController:SetSelectedState("show")
						arg_1_1.musicAnimator_:Play("open", 0, 0)

						if arg_1_1.settingData.music_time ~= 0 then
							arg_1_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_1_1.settingData.music_time), function()
								if arg_1_1 == nil or isNil(arg_1_1.bgmTxt_) then
									return
								end

								arg_1_1.musicController:SetSelectedState("hide")
								arg_1_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_4_34 = 0

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_35 = 2

			if arg_1_1.time_ >= var_4_34 + var_4_35 and arg_1_1.time_ < var_4_34 + var_4_35 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_36 = "10004ui_story"

			if arg_1_1.actors_[var_4_36] == nil then
				local var_4_37 = Object.Instantiate(Asset.Load("Char/" .. var_4_36), arg_1_1.stage_.transform)

				var_4_37.name = var_4_36
				var_4_37.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.actors_[var_4_36] = var_4_37

				local var_4_38 = var_4_37:GetComponentInChildren(typeof(CharacterEffect))

				var_4_38.enabled = true

				local var_4_39 = GameObjectTools.GetOrAddComponent(var_4_37, typeof(DynamicBoneHelper))

				if var_4_39 then
					var_4_39:EnableDynamicBone(false)
				end

				arg_1_1:ShowWeapon(var_4_38.transform, false)

				arg_1_1.var_[var_4_36 .. "Animator"] = var_4_38.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_1_1.var_[var_4_36 .. "Animator"].applyRootMotion = true
				arg_1_1.var_[var_4_36 .. "LipSync"] = var_4_38.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_4_40 = arg_1_1.actors_["10004ui_story"].transform
			local var_4_41 = 1.5

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1.var_.moveOldPos10004ui_story = var_4_40.localPosition
			end

			local var_4_42 = 0.001

			if var_4_41 <= arg_1_1.time_ and arg_1_1.time_ < var_4_41 + var_4_42 then
				local var_4_43 = (arg_1_1.time_ - var_4_41) / var_4_42
				local var_4_44 = Vector3.New(-0.7, -1.1, -5.6)

				var_4_40.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10004ui_story, var_4_44, var_4_43)

				local var_4_45 = manager.ui.mainCamera.transform.position - var_4_40.position

				var_4_40.forward = Vector3.New(var_4_45.x, var_4_45.y, var_4_45.z)

				local var_4_46 = var_4_40.localEulerAngles

				var_4_46.z = 0
				var_4_46.x = 0
				var_4_40.localEulerAngles = var_4_46
			end

			if arg_1_1.time_ >= var_4_41 + var_4_42 and arg_1_1.time_ < var_4_41 + var_4_42 + arg_4_0 then
				var_4_40.localPosition = Vector3.New(-0.7, -1.1, -5.6)

				local var_4_47 = manager.ui.mainCamera.transform.position - var_4_40.position

				var_4_40.forward = Vector3.New(var_4_47.x, var_4_47.y, var_4_47.z)

				local var_4_48 = var_4_40.localEulerAngles

				var_4_48.z = 0
				var_4_48.x = 0
				var_4_40.localEulerAngles = var_4_48
			end

			local var_4_49 = arg_1_1.actors_["10004ui_story"]
			local var_4_50 = 1.5

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 and arg_1_1.var_.characterEffect10004ui_story == nil then
				arg_1_1.var_.characterEffect10004ui_story = var_4_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_51 = 0.2

			if var_4_50 <= arg_1_1.time_ and arg_1_1.time_ < var_4_50 + var_4_51 then
				local var_4_52 = (arg_1_1.time_ - var_4_50) / var_4_51

				if arg_1_1.var_.characterEffect10004ui_story then
					arg_1_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_50 + var_4_51 and arg_1_1.time_ < var_4_50 + var_4_51 + arg_4_0 and arg_1_1.var_.characterEffect10004ui_story then
				arg_1_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_4_53 = 1.5

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action1_1")
			end

			local var_4_54 = 1.5

			if var_4_54 < arg_1_1.time_ and arg_1_1.time_ <= var_4_54 + arg_4_0 then
				arg_1_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_55 = 2
			local var_4_56 = 0.325

			if var_4_55 < arg_1_1.time_ and arg_1_1.time_ <= var_4_55 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_57 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_57:setOnUpdate(LuaHelper.FloatAction(function(arg_6_0)
					arg_1_1.dialogCg_.alpha = arg_6_0
				end))
				var_4_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_58 = arg_1_1:FormatText(StoryNameCfg[80].name)

				arg_1_1.leftNameTxt_.text = var_4_58

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_59 = arg_1_1:GetWordFromCfg(106081001)
				local var_4_60 = arg_1_1:FormatText(var_4_59.content)

				arg_1_1.text_.text = var_4_60

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_61 = 13
				local var_4_62 = utf8.len(var_4_60)
				local var_4_63 = var_4_61 <= 0 and var_4_56 or var_4_56 * (var_4_62 / var_4_61)

				if var_4_63 > 0 and var_4_56 < var_4_63 then
					arg_1_1.talkMaxDuration = var_4_63
					var_4_55 = var_4_55 + 0.3

					if var_4_63 + var_4_55 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_63 + var_4_55
					end
				end

				arg_1_1.text_.text = var_4_60
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081001", "story_v_out_106081.awb") ~= 0 then
					local var_4_64 = manager.audio:GetVoiceLength("story_v_out_106081", "106081001", "story_v_out_106081.awb") / 1000

					if var_4_64 + var_4_55 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_64 + var_4_55
					end

					if var_4_59.prefab_name ~= "" and arg_1_1.actors_[var_4_59.prefab_name] ~= nil then
						local var_4_65 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_59.prefab_name].transform, "story_v_out_106081", "106081001", "story_v_out_106081.awb")

						arg_1_1:RecordAudio("106081001", var_4_65)
						arg_1_1:RecordAudio("106081001", var_4_65)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_106081", "106081001", "story_v_out_106081.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_106081", "106081001", "story_v_out_106081.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_66 = var_4_55 + 0.3
			local var_4_67 = math.max(var_4_56, arg_1_1.talkMaxDuration)

			if var_4_66 <= arg_1_1.time_ and arg_1_1.time_ < var_4_66 + var_4_67 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_66) / var_4_67

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_66 + var_4_67 and arg_1_1.time_ < var_4_66 + var_4_67 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play106081002 = function(arg_8_0, arg_8_1)
		arg_8_1.time_ = 0
		arg_8_1.frameCnt_ = 0
		arg_8_1.state_ = "playing"
		arg_8_1.curTalkId_ = 106081002
		arg_8_1.duration_ = 2.23

		local var_8_0 = {
			ja = 1.1,
			ko = 2.1,
			zh = 2.233,
			en = 1.6
		}
		local var_8_1 = manager.audio:GetLocalizationFlag()

		if var_8_0[var_8_1] ~= nil then
			arg_8_1.duration_ = var_8_0[var_8_1]
		end

		SetActive(arg_8_1.tipsGo_, false)

		function arg_8_1.onSingleLineFinish_()
			arg_8_1.onSingleLineUpdate_ = nil
			arg_8_1.onSingleLineFinish_ = nil
			arg_8_1.state_ = "waiting"
		end

		function arg_8_1.playNext_(arg_10_0)
			if arg_10_0 == 1 then
				arg_8_0:Play106081003(arg_8_1)
			end
		end

		function arg_8_1.onSingleLineUpdate_(arg_11_0)
			local var_11_0 = arg_8_1.actors_["10004ui_story"]
			local var_11_1 = 0

			if var_11_1 < arg_8_1.time_ and arg_8_1.time_ <= var_11_1 + arg_11_0 and arg_8_1.var_.characterEffect10004ui_story == nil then
				arg_8_1.var_.characterEffect10004ui_story = var_11_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_11_2 = 0.2

			if var_11_1 <= arg_8_1.time_ and arg_8_1.time_ < var_11_1 + var_11_2 then
				local var_11_3 = (arg_8_1.time_ - var_11_1) / var_11_2

				if arg_8_1.var_.characterEffect10004ui_story then
					local var_11_4 = Mathf.Lerp(0, 0.5, var_11_3)

					arg_8_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_8_1.var_.characterEffect10004ui_story.fillRatio = var_11_4
				end
			end

			if arg_8_1.time_ >= var_11_1 + var_11_2 and arg_8_1.time_ < var_11_1 + var_11_2 + arg_11_0 and arg_8_1.var_.characterEffect10004ui_story then
				local var_11_5 = 0.5

				arg_8_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_8_1.var_.characterEffect10004ui_story.fillRatio = var_11_5
			end

			local var_11_6 = 0
			local var_11_7 = 0.125

			if var_11_6 < arg_8_1.time_ and arg_8_1.time_ <= var_11_6 + arg_11_0 then
				arg_8_1.talkMaxDuration = 0
				arg_8_1.dialogCg_.alpha = 1

				arg_8_1.dialog_:SetActive(true)
				SetActive(arg_8_1.leftNameGo_, true)

				local var_11_8 = arg_8_1:FormatText(StoryNameCfg[86].name)

				arg_8_1.leftNameTxt_.text = var_11_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_1.leftNameTxt_.transform)

				arg_8_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_8_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_8_1:RecordName(arg_8_1.leftNameTxt_.text)
				SetActive(arg_8_1.iconTrs_.gameObject, true)
				arg_8_1.iconController_:SetSelectedState("hero")

				arg_8_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2032")

				arg_8_1.callingController_:SetSelectedState("normal")

				arg_8_1.keyicon_.color = Color.New(1, 1, 1)
				arg_8_1.icon_.color = Color.New(1, 1, 1)

				local var_11_9 = arg_8_1:GetWordFromCfg(106081002)
				local var_11_10 = arg_8_1:FormatText(var_11_9.content)

				arg_8_1.text_.text = var_11_10

				LuaForUtil.ClearLinePrefixSymbol(arg_8_1.text_)

				local var_11_11 = 5
				local var_11_12 = utf8.len(var_11_10)
				local var_11_13 = var_11_11 <= 0 and var_11_7 or var_11_7 * (var_11_12 / var_11_11)

				if var_11_13 > 0 and var_11_7 < var_11_13 then
					arg_8_1.talkMaxDuration = var_11_13

					if var_11_13 + var_11_6 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_13 + var_11_6
					end
				end

				arg_8_1.text_.text = var_11_10
				arg_8_1.typewritter.percent = 0

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081002", "story_v_out_106081.awb") ~= 0 then
					local var_11_14 = manager.audio:GetVoiceLength("story_v_out_106081", "106081002", "story_v_out_106081.awb") / 1000

					if var_11_14 + var_11_6 > arg_8_1.duration_ then
						arg_8_1.duration_ = var_11_14 + var_11_6
					end

					if var_11_9.prefab_name ~= "" and arg_8_1.actors_[var_11_9.prefab_name] ~= nil then
						local var_11_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_8_1.actors_[var_11_9.prefab_name].transform, "story_v_out_106081", "106081002", "story_v_out_106081.awb")

						arg_8_1:RecordAudio("106081002", var_11_15)
						arg_8_1:RecordAudio("106081002", var_11_15)
					else
						arg_8_1:AudioAction("play", "voice", "story_v_out_106081", "106081002", "story_v_out_106081.awb")
					end

					arg_8_1:RecordHistoryTalkVoice("story_v_out_106081", "106081002", "story_v_out_106081.awb")
				end

				arg_8_1:RecordContent(arg_8_1.text_.text)
			end

			local var_11_16 = math.max(var_11_7, arg_8_1.talkMaxDuration)

			if var_11_6 <= arg_8_1.time_ and arg_8_1.time_ < var_11_6 + var_11_16 then
				arg_8_1.typewritter.percent = (arg_8_1.time_ - var_11_6) / var_11_16

				arg_8_1.typewritter:SetDirty()
			end

			if arg_8_1.time_ >= var_11_6 + var_11_16 and arg_8_1.time_ < var_11_6 + var_11_16 + arg_11_0 then
				arg_8_1.typewritter.percent = 1

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(true)
			end
		end
	end,
	Play106081003 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 106081003
		arg_12_1.duration_ = 5.53

		local var_12_0 = {
			ja = 4.333,
			ko = 4.433,
			zh = 4.766,
			en = 5.533
		}
		local var_12_1 = manager.audio:GetLocalizationFlag()

		if var_12_0[var_12_1] ~= nil then
			arg_12_1.duration_ = var_12_0[var_12_1]
		end

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play106081004(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = "4014_tpose"

			if arg_12_1.actors_[var_15_0] == nil then
				local var_15_1 = Object.Instantiate(Asset.Load("Char/" .. var_15_0), arg_12_1.stage_.transform)

				var_15_1.name = var_15_0
				var_15_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_12_1.actors_[var_15_0] = var_15_1

				local var_15_2 = var_15_1:GetComponentInChildren(typeof(CharacterEffect))

				var_15_2.enabled = true

				local var_15_3 = GameObjectTools.GetOrAddComponent(var_15_1, typeof(DynamicBoneHelper))

				if var_15_3 then
					var_15_3:EnableDynamicBone(false)
				end

				arg_12_1:ShowWeapon(var_15_2.transform, false)

				arg_12_1.var_[var_15_0 .. "Animator"] = var_15_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_12_1.var_[var_15_0 .. "Animator"].applyRootMotion = true
				arg_12_1.var_[var_15_0 .. "LipSync"] = var_15_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_15_4 = arg_12_1.actors_["4014_tpose"]
			local var_15_5 = 0

			if var_15_5 < arg_12_1.time_ and arg_12_1.time_ <= var_15_5 + arg_15_0 and arg_12_1.var_.characterEffect4014_tpose == nil then
				arg_12_1.var_.characterEffect4014_tpose = var_15_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_6 = 0.1

			if var_15_5 <= arg_12_1.time_ and arg_12_1.time_ < var_15_5 + var_15_6 then
				local var_15_7 = (arg_12_1.time_ - var_15_5) / var_15_6

				if arg_12_1.var_.characterEffect4014_tpose then
					arg_12_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_12_1.time_ >= var_15_5 + var_15_6 and arg_12_1.time_ < var_15_5 + var_15_6 + arg_15_0 and arg_12_1.var_.characterEffect4014_tpose then
				arg_12_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_15_8 = arg_12_1.actors_["4014_tpose"].transform
			local var_15_9 = 0

			if var_15_9 < arg_12_1.time_ and arg_12_1.time_ <= var_15_9 + arg_15_0 then
				arg_12_1.var_.moveOldPos4014_tpose = var_15_8.localPosition
			end

			local var_15_10 = 0.001

			if var_15_9 <= arg_12_1.time_ and arg_12_1.time_ < var_15_9 + var_15_10 then
				local var_15_11 = (arg_12_1.time_ - var_15_9) / var_15_10
				local var_15_12 = Vector3.New(0.7, -1.95, -4.2)

				var_15_8.localPosition = Vector3.Lerp(arg_12_1.var_.moveOldPos4014_tpose, var_15_12, var_15_11)

				local var_15_13 = manager.ui.mainCamera.transform.position - var_15_8.position

				var_15_8.forward = Vector3.New(var_15_13.x, var_15_13.y, var_15_13.z)

				local var_15_14 = var_15_8.localEulerAngles

				var_15_14.z = 0
				var_15_14.x = 0
				var_15_8.localEulerAngles = var_15_14
			end

			if arg_12_1.time_ >= var_15_9 + var_15_10 and arg_12_1.time_ < var_15_9 + var_15_10 + arg_15_0 then
				var_15_8.localPosition = Vector3.New(0.7, -1.95, -4.2)

				local var_15_15 = manager.ui.mainCamera.transform.position - var_15_8.position

				var_15_8.forward = Vector3.New(var_15_15.x, var_15_15.y, var_15_15.z)

				local var_15_16 = var_15_8.localEulerAngles

				var_15_16.z = 0
				var_15_16.x = 0
				var_15_8.localEulerAngles = var_15_16
			end

			local var_15_17 = 0

			if var_15_17 < arg_12_1.time_ and arg_12_1.time_ <= var_15_17 + arg_15_0 then
				arg_12_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_15_18 = "10003ui_story"

			if arg_12_1.actors_[var_15_18] == nil then
				local var_15_19 = Object.Instantiate(Asset.Load("Char/" .. var_15_18), arg_12_1.stage_.transform)

				var_15_19.name = var_15_18
				var_15_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_12_1.actors_[var_15_18] = var_15_19

				local var_15_20 = var_15_19:GetComponentInChildren(typeof(CharacterEffect))

				var_15_20.enabled = true

				local var_15_21 = GameObjectTools.GetOrAddComponent(var_15_19, typeof(DynamicBoneHelper))

				if var_15_21 then
					var_15_21:EnableDynamicBone(false)
				end

				arg_12_1:ShowWeapon(var_15_20.transform, false)

				arg_12_1.var_[var_15_18 .. "Animator"] = var_15_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_12_1.var_[var_15_18 .. "Animator"].applyRootMotion = true
				arg_12_1.var_[var_15_18 .. "LipSync"] = var_15_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_15_22 = 0

			if var_15_22 < arg_12_1.time_ and arg_12_1.time_ <= var_15_22 + arg_15_0 then
				arg_12_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/story10003/story10003action/10003action2_1")
			end

			local var_15_23 = arg_12_1.actors_["10003ui_story"].transform
			local var_15_24 = 0

			if var_15_24 < arg_12_1.time_ and arg_12_1.time_ <= var_15_24 + arg_15_0 then
				arg_12_1.var_.moveOldPos10003ui_story = var_15_23.localPosition
			end

			local var_15_25 = 0.001

			if var_15_24 <= arg_12_1.time_ and arg_12_1.time_ < var_15_24 + var_15_25 then
				local var_15_26 = (arg_12_1.time_ - var_15_24) / var_15_25
				local var_15_27 = Vector3.New(0, 100, 0)

				var_15_23.localPosition = Vector3.Lerp(arg_12_1.var_.moveOldPos10003ui_story, var_15_27, var_15_26)

				local var_15_28 = manager.ui.mainCamera.transform.position - var_15_23.position

				var_15_23.forward = Vector3.New(var_15_28.x, var_15_28.y, var_15_28.z)

				local var_15_29 = var_15_23.localEulerAngles

				var_15_29.z = 0
				var_15_29.x = 0
				var_15_23.localEulerAngles = var_15_29
			end

			if arg_12_1.time_ >= var_15_24 + var_15_25 and arg_12_1.time_ < var_15_24 + var_15_25 + arg_15_0 then
				var_15_23.localPosition = Vector3.New(0, 100, 0)

				local var_15_30 = manager.ui.mainCamera.transform.position - var_15_23.position

				var_15_23.forward = Vector3.New(var_15_30.x, var_15_30.y, var_15_30.z)

				local var_15_31 = var_15_23.localEulerAngles

				var_15_31.z = 0
				var_15_31.x = 0
				var_15_23.localEulerAngles = var_15_31
			end

			local var_15_32 = 0

			if var_15_32 < arg_12_1.time_ and arg_12_1.time_ <= var_15_32 + arg_15_0 then
				arg_12_1.allBtn_.enabled = false
			end

			local var_15_33 = 0.666666666666667

			if arg_12_1.time_ >= var_15_32 + var_15_33 and arg_12_1.time_ < var_15_32 + var_15_33 + arg_15_0 then
				arg_12_1.allBtn_.enabled = true
			end

			local var_15_34 = 0
			local var_15_35 = 0.375

			if var_15_34 < arg_12_1.time_ and arg_12_1.time_ <= var_15_34 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0
				arg_12_1.dialogCg_.alpha = 1

				arg_12_1.dialog_:SetActive(true)
				SetActive(arg_12_1.leftNameGo_, true)

				local var_15_36 = arg_12_1:FormatText(StoryNameCfg[87].name)

				arg_12_1.leftNameTxt_.text = var_15_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_1.leftNameTxt_.transform)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1.leftNameTxt_.text)
				SetActive(arg_12_1.iconTrs_.gameObject, false)
				arg_12_1.callingController_:SetSelectedState("normal")

				local var_15_37 = arg_12_1:GetWordFromCfg(106081003)
				local var_15_38 = arg_12_1:FormatText(var_15_37.content)

				arg_12_1.text_.text = var_15_38

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_39 = 16
				local var_15_40 = utf8.len(var_15_38)
				local var_15_41 = var_15_39 <= 0 and var_15_35 or var_15_35 * (var_15_40 / var_15_39)

				if var_15_41 > 0 and var_15_35 < var_15_41 then
					arg_12_1.talkMaxDuration = var_15_41

					if var_15_41 + var_15_34 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_41 + var_15_34
					end
				end

				arg_12_1.text_.text = var_15_38
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081003", "story_v_out_106081.awb") ~= 0 then
					local var_15_42 = manager.audio:GetVoiceLength("story_v_out_106081", "106081003", "story_v_out_106081.awb") / 1000

					if var_15_42 + var_15_34 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_42 + var_15_34
					end

					if var_15_37.prefab_name ~= "" and arg_12_1.actors_[var_15_37.prefab_name] ~= nil then
						local var_15_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_12_1.actors_[var_15_37.prefab_name].transform, "story_v_out_106081", "106081003", "story_v_out_106081.awb")

						arg_12_1:RecordAudio("106081003", var_15_43)
						arg_12_1:RecordAudio("106081003", var_15_43)
					else
						arg_12_1:AudioAction("play", "voice", "story_v_out_106081", "106081003", "story_v_out_106081.awb")
					end

					arg_12_1:RecordHistoryTalkVoice("story_v_out_106081", "106081003", "story_v_out_106081.awb")
				end

				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_44 = math.max(var_15_35, arg_12_1.talkMaxDuration)

			if var_15_34 <= arg_12_1.time_ and arg_12_1.time_ < var_15_34 + var_15_44 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_34) / var_15_44

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_34 + var_15_44 and arg_12_1.time_ < var_15_34 + var_15_44 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play106081004 = function(arg_16_0, arg_16_1)
		arg_16_1.time_ = 0
		arg_16_1.frameCnt_ = 0
		arg_16_1.state_ = "playing"
		arg_16_1.curTalkId_ = 106081004
		arg_16_1.duration_ = 2.1

		local var_16_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.1
		}
		local var_16_1 = manager.audio:GetLocalizationFlag()

		if var_16_0[var_16_1] ~= nil then
			arg_16_1.duration_ = var_16_0[var_16_1]
		end

		SetActive(arg_16_1.tipsGo_, false)

		function arg_16_1.onSingleLineFinish_()
			arg_16_1.onSingleLineUpdate_ = nil
			arg_16_1.onSingleLineFinish_ = nil
			arg_16_1.state_ = "waiting"
		end

		function arg_16_1.playNext_(arg_18_0)
			if arg_18_0 == 1 then
				arg_16_0:Play106081005(arg_16_1)
			end
		end

		function arg_16_1.onSingleLineUpdate_(arg_19_0)
			local var_19_0 = arg_16_1.actors_["4014_tpose"]
			local var_19_1 = 0

			if var_19_1 < arg_16_1.time_ and arg_16_1.time_ <= var_19_1 + arg_19_0 and arg_16_1.var_.characterEffect4014_tpose == nil then
				arg_16_1.var_.characterEffect4014_tpose = var_19_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_19_2 = 0.1

			if var_19_1 <= arg_16_1.time_ and arg_16_1.time_ < var_19_1 + var_19_2 then
				local var_19_3 = (arg_16_1.time_ - var_19_1) / var_19_2

				if arg_16_1.var_.characterEffect4014_tpose then
					local var_19_4 = Mathf.Lerp(0, 0.5, var_19_3)

					arg_16_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_16_1.var_.characterEffect4014_tpose.fillRatio = var_19_4
				end
			end

			if arg_16_1.time_ >= var_19_1 + var_19_2 and arg_16_1.time_ < var_19_1 + var_19_2 + arg_19_0 and arg_16_1.var_.characterEffect4014_tpose then
				local var_19_5 = 0.5

				arg_16_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_16_1.var_.characterEffect4014_tpose.fillRatio = var_19_5
			end

			local var_19_6 = arg_16_1.actors_["10003ui_story"]
			local var_19_7 = 0

			if var_19_7 < arg_16_1.time_ and arg_16_1.time_ <= var_19_7 + arg_19_0 and arg_16_1.var_.characterEffect10003ui_story == nil then
				arg_16_1.var_.characterEffect10003ui_story = var_19_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_19_8 = 0.1

			if var_19_7 <= arg_16_1.time_ and arg_16_1.time_ < var_19_7 + var_19_8 then
				local var_19_9 = (arg_16_1.time_ - var_19_7) / var_19_8

				if arg_16_1.var_.characterEffect10003ui_story then
					arg_16_1.var_.characterEffect10003ui_story.fillFlat = false
				end
			end

			if arg_16_1.time_ >= var_19_7 + var_19_8 and arg_16_1.time_ < var_19_7 + var_19_8 + arg_19_0 and arg_16_1.var_.characterEffect10003ui_story then
				arg_16_1.var_.characterEffect10003ui_story.fillFlat = false
			end

			local var_19_10 = arg_16_1.actors_["10004ui_story"].transform
			local var_19_11 = 0

			if var_19_11 < arg_16_1.time_ and arg_16_1.time_ <= var_19_11 + arg_19_0 then
				arg_16_1.var_.moveOldPos10004ui_story = var_19_10.localPosition
			end

			local var_19_12 = 0.001

			if var_19_11 <= arg_16_1.time_ and arg_16_1.time_ < var_19_11 + var_19_12 then
				local var_19_13 = (arg_16_1.time_ - var_19_11) / var_19_12
				local var_19_14 = Vector3.New(0, 100, 0)

				var_19_10.localPosition = Vector3.Lerp(arg_16_1.var_.moveOldPos10004ui_story, var_19_14, var_19_13)

				local var_19_15 = manager.ui.mainCamera.transform.position - var_19_10.position

				var_19_10.forward = Vector3.New(var_19_15.x, var_19_15.y, var_19_15.z)

				local var_19_16 = var_19_10.localEulerAngles

				var_19_16.z = 0
				var_19_16.x = 0
				var_19_10.localEulerAngles = var_19_16
			end

			if arg_16_1.time_ >= var_19_11 + var_19_12 and arg_16_1.time_ < var_19_11 + var_19_12 + arg_19_0 then
				var_19_10.localPosition = Vector3.New(0, 100, 0)

				local var_19_17 = manager.ui.mainCamera.transform.position - var_19_10.position

				var_19_10.forward = Vector3.New(var_19_17.x, var_19_17.y, var_19_17.z)

				local var_19_18 = var_19_10.localEulerAngles

				var_19_18.z = 0
				var_19_18.x = 0
				var_19_10.localEulerAngles = var_19_18
			end

			local var_19_19 = arg_16_1.actors_["10003ui_story"].transform
			local var_19_20 = 0

			if var_19_20 < arg_16_1.time_ and arg_16_1.time_ <= var_19_20 + arg_19_0 then
				arg_16_1.var_.moveOldPos10003ui_story = var_19_19.localPosition
			end

			local var_19_21 = 0.001

			if var_19_20 <= arg_16_1.time_ and arg_16_1.time_ < var_19_20 + var_19_21 then
				local var_19_22 = (arg_16_1.time_ - var_19_20) / var_19_21
				local var_19_23 = Vector3.New(-0.7, -1.05, -5.9)

				var_19_19.localPosition = Vector3.Lerp(arg_16_1.var_.moveOldPos10003ui_story, var_19_23, var_19_22)

				local var_19_24 = manager.ui.mainCamera.transform.position - var_19_19.position

				var_19_19.forward = Vector3.New(var_19_24.x, var_19_24.y, var_19_24.z)

				local var_19_25 = var_19_19.localEulerAngles

				var_19_25.z = 0
				var_19_25.x = 0
				var_19_19.localEulerAngles = var_19_25
			end

			if arg_16_1.time_ >= var_19_20 + var_19_21 and arg_16_1.time_ < var_19_20 + var_19_21 + arg_19_0 then
				var_19_19.localPosition = Vector3.New(-0.7, -1.05, -5.9)

				local var_19_26 = manager.ui.mainCamera.transform.position - var_19_19.position

				var_19_19.forward = Vector3.New(var_19_26.x, var_19_26.y, var_19_26.z)

				local var_19_27 = var_19_19.localEulerAngles

				var_19_27.z = 0
				var_19_27.x = 0
				var_19_19.localEulerAngles = var_19_27
			end

			local var_19_28 = 0

			if var_19_28 < arg_16_1.time_ and arg_16_1.time_ <= var_19_28 + arg_19_0 then
				arg_16_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_19_29 = 0

			if var_19_29 < arg_16_1.time_ and arg_16_1.time_ <= var_19_29 + arg_19_0 then
				arg_16_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/story10003/story10003action/10003action1_1")
			end

			local var_19_30 = 0
			local var_19_31 = 0.05

			if var_19_30 < arg_16_1.time_ and arg_16_1.time_ <= var_19_30 + arg_19_0 then
				arg_16_1.talkMaxDuration = 0
				arg_16_1.dialogCg_.alpha = 1

				arg_16_1.dialog_:SetActive(true)
				SetActive(arg_16_1.leftNameGo_, true)

				local var_19_32 = arg_16_1:FormatText(StoryNameCfg[81].name)

				arg_16_1.leftNameTxt_.text = var_19_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_16_1.leftNameTxt_.transform)

				arg_16_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_16_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_16_1:RecordName(arg_16_1.leftNameTxt_.text)
				SetActive(arg_16_1.iconTrs_.gameObject, false)
				arg_16_1.callingController_:SetSelectedState("normal")

				local var_19_33 = arg_16_1:GetWordFromCfg(106081004)
				local var_19_34 = arg_16_1:FormatText(var_19_33.content)

				arg_16_1.text_.text = var_19_34

				LuaForUtil.ClearLinePrefixSymbol(arg_16_1.text_)

				local var_19_35 = 2
				local var_19_36 = utf8.len(var_19_34)
				local var_19_37 = var_19_35 <= 0 and var_19_31 or var_19_31 * (var_19_36 / var_19_35)

				if var_19_37 > 0 and var_19_31 < var_19_37 then
					arg_16_1.talkMaxDuration = var_19_37

					if var_19_37 + var_19_30 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_37 + var_19_30
					end
				end

				arg_16_1.text_.text = var_19_34
				arg_16_1.typewritter.percent = 0

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081004", "story_v_out_106081.awb") ~= 0 then
					local var_19_38 = manager.audio:GetVoiceLength("story_v_out_106081", "106081004", "story_v_out_106081.awb") / 1000

					if var_19_38 + var_19_30 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_38 + var_19_30
					end

					if var_19_33.prefab_name ~= "" and arg_16_1.actors_[var_19_33.prefab_name] ~= nil then
						local var_19_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_16_1.actors_[var_19_33.prefab_name].transform, "story_v_out_106081", "106081004", "story_v_out_106081.awb")

						arg_16_1:RecordAudio("106081004", var_19_39)
						arg_16_1:RecordAudio("106081004", var_19_39)
					else
						arg_16_1:AudioAction("play", "voice", "story_v_out_106081", "106081004", "story_v_out_106081.awb")
					end

					arg_16_1:RecordHistoryTalkVoice("story_v_out_106081", "106081004", "story_v_out_106081.awb")
				end

				arg_16_1:RecordContent(arg_16_1.text_.text)
			end

			local var_19_40 = math.max(var_19_31, arg_16_1.talkMaxDuration)

			if var_19_30 <= arg_16_1.time_ and arg_16_1.time_ < var_19_30 + var_19_40 then
				arg_16_1.typewritter.percent = (arg_16_1.time_ - var_19_30) / var_19_40

				arg_16_1.typewritter:SetDirty()
			end

			if arg_16_1.time_ >= var_19_30 + var_19_40 and arg_16_1.time_ < var_19_30 + var_19_40 + arg_19_0 then
				arg_16_1.typewritter.percent = 1

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(true)
			end
		end
	end,
	Play106081005 = function(arg_20_0, arg_20_1)
		arg_20_1.time_ = 0
		arg_20_1.frameCnt_ = 0
		arg_20_1.state_ = "playing"
		arg_20_1.curTalkId_ = 106081005
		arg_20_1.duration_ = 7.17

		local var_20_0 = {
			ja = 7.166,
			ko = 5.533,
			zh = 5.033,
			en = 5.7
		}
		local var_20_1 = manager.audio:GetLocalizationFlag()

		if var_20_0[var_20_1] ~= nil then
			arg_20_1.duration_ = var_20_0[var_20_1]
		end

		SetActive(arg_20_1.tipsGo_, false)

		function arg_20_1.onSingleLineFinish_()
			arg_20_1.onSingleLineUpdate_ = nil
			arg_20_1.onSingleLineFinish_ = nil
			arg_20_1.state_ = "waiting"
		end

		function arg_20_1.playNext_(arg_22_0)
			if arg_22_0 == 1 then
				arg_20_0:Play106081006(arg_20_1)
			end
		end

		function arg_20_1.onSingleLineUpdate_(arg_23_0)
			local var_23_0 = arg_20_1.actors_["4014_tpose"]
			local var_23_1 = 0

			if var_23_1 < arg_20_1.time_ and arg_20_1.time_ <= var_23_1 + arg_23_0 and arg_20_1.var_.characterEffect4014_tpose == nil then
				arg_20_1.var_.characterEffect4014_tpose = var_23_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_2 = 0.1

			if var_23_1 <= arg_20_1.time_ and arg_20_1.time_ < var_23_1 + var_23_2 then
				local var_23_3 = (arg_20_1.time_ - var_23_1) / var_23_2

				if arg_20_1.var_.characterEffect4014_tpose then
					arg_20_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_20_1.time_ >= var_23_1 + var_23_2 and arg_20_1.time_ < var_23_1 + var_23_2 + arg_23_0 and arg_20_1.var_.characterEffect4014_tpose then
				arg_20_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_23_4 = arg_20_1.actors_["10003ui_story"]
			local var_23_5 = 0

			if var_23_5 < arg_20_1.time_ and arg_20_1.time_ <= var_23_5 + arg_23_0 and arg_20_1.var_.characterEffect10003ui_story == nil then
				arg_20_1.var_.characterEffect10003ui_story = var_23_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_6 = 0.1

			if var_23_5 <= arg_20_1.time_ and arg_20_1.time_ < var_23_5 + var_23_6 then
				local var_23_7 = (arg_20_1.time_ - var_23_5) / var_23_6

				if arg_20_1.var_.characterEffect10003ui_story then
					local var_23_8 = Mathf.Lerp(0, 0.5, var_23_7)

					arg_20_1.var_.characterEffect10003ui_story.fillFlat = true
					arg_20_1.var_.characterEffect10003ui_story.fillRatio = var_23_8
				end
			end

			if arg_20_1.time_ >= var_23_5 + var_23_6 and arg_20_1.time_ < var_23_5 + var_23_6 + arg_23_0 and arg_20_1.var_.characterEffect10003ui_story then
				local var_23_9 = 0.5

				arg_20_1.var_.characterEffect10003ui_story.fillFlat = true
				arg_20_1.var_.characterEffect10003ui_story.fillRatio = var_23_9
			end

			local var_23_10 = 0
			local var_23_11 = 0.6

			if var_23_10 < arg_20_1.time_ and arg_20_1.time_ <= var_23_10 + arg_23_0 then
				arg_20_1.talkMaxDuration = 0
				arg_20_1.dialogCg_.alpha = 1

				arg_20_1.dialog_:SetActive(true)
				SetActive(arg_20_1.leftNameGo_, true)

				local var_23_12 = arg_20_1:FormatText(StoryNameCfg[87].name)

				arg_20_1.leftNameTxt_.text = var_23_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_20_1.leftNameTxt_.transform)

				arg_20_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_20_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_20_1:RecordName(arg_20_1.leftNameTxt_.text)
				SetActive(arg_20_1.iconTrs_.gameObject, false)
				arg_20_1.callingController_:SetSelectedState("normal")

				local var_23_13 = arg_20_1:GetWordFromCfg(106081005)
				local var_23_14 = arg_20_1:FormatText(var_23_13.content)

				arg_20_1.text_.text = var_23_14

				LuaForUtil.ClearLinePrefixSymbol(arg_20_1.text_)

				local var_23_15 = 23
				local var_23_16 = utf8.len(var_23_14)
				local var_23_17 = var_23_15 <= 0 and var_23_11 or var_23_11 * (var_23_16 / var_23_15)

				if var_23_17 > 0 and var_23_11 < var_23_17 then
					arg_20_1.talkMaxDuration = var_23_17

					if var_23_17 + var_23_10 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_17 + var_23_10
					end
				end

				arg_20_1.text_.text = var_23_14
				arg_20_1.typewritter.percent = 0

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081005", "story_v_out_106081.awb") ~= 0 then
					local var_23_18 = manager.audio:GetVoiceLength("story_v_out_106081", "106081005", "story_v_out_106081.awb") / 1000

					if var_23_18 + var_23_10 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_18 + var_23_10
					end

					if var_23_13.prefab_name ~= "" and arg_20_1.actors_[var_23_13.prefab_name] ~= nil then
						local var_23_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_20_1.actors_[var_23_13.prefab_name].transform, "story_v_out_106081", "106081005", "story_v_out_106081.awb")

						arg_20_1:RecordAudio("106081005", var_23_19)
						arg_20_1:RecordAudio("106081005", var_23_19)
					else
						arg_20_1:AudioAction("play", "voice", "story_v_out_106081", "106081005", "story_v_out_106081.awb")
					end

					arg_20_1:RecordHistoryTalkVoice("story_v_out_106081", "106081005", "story_v_out_106081.awb")
				end

				arg_20_1:RecordContent(arg_20_1.text_.text)
			end

			local var_23_20 = math.max(var_23_11, arg_20_1.talkMaxDuration)

			if var_23_10 <= arg_20_1.time_ and arg_20_1.time_ < var_23_10 + var_23_20 then
				arg_20_1.typewritter.percent = (arg_20_1.time_ - var_23_10) / var_23_20

				arg_20_1.typewritter:SetDirty()
			end

			if arg_20_1.time_ >= var_23_10 + var_23_20 and arg_20_1.time_ < var_23_10 + var_23_20 + arg_23_0 then
				arg_20_1.typewritter.percent = 1

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(true)
			end
		end
	end,
	Play106081006 = function(arg_24_0, arg_24_1)
		arg_24_1.time_ = 0
		arg_24_1.frameCnt_ = 0
		arg_24_1.state_ = "playing"
		arg_24_1.curTalkId_ = 106081006
		arg_24_1.duration_ = 6.93

		local var_24_0 = {
			ja = 6.4,
			ko = 5.7,
			zh = 6.933,
			en = 5.166
		}
		local var_24_1 = manager.audio:GetLocalizationFlag()

		if var_24_0[var_24_1] ~= nil then
			arg_24_1.duration_ = var_24_0[var_24_1]
		end

		SetActive(arg_24_1.tipsGo_, false)

		function arg_24_1.onSingleLineFinish_()
			arg_24_1.onSingleLineUpdate_ = nil
			arg_24_1.onSingleLineFinish_ = nil
			arg_24_1.state_ = "waiting"
		end

		function arg_24_1.playNext_(arg_26_0)
			if arg_26_0 == 1 then
				arg_24_0:Play106081007(arg_24_1)
			end
		end

		function arg_24_1.onSingleLineUpdate_(arg_27_0)
			local var_27_0 = arg_24_1.actors_["4014_tpose"]
			local var_27_1 = 0

			if var_27_1 < arg_24_1.time_ and arg_24_1.time_ <= var_27_1 + arg_27_0 and arg_24_1.var_.characterEffect4014_tpose == nil then
				arg_24_1.var_.characterEffect4014_tpose = var_27_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_2 = 0.1

			if var_27_1 <= arg_24_1.time_ and arg_24_1.time_ < var_27_1 + var_27_2 then
				local var_27_3 = (arg_24_1.time_ - var_27_1) / var_27_2

				if arg_24_1.var_.characterEffect4014_tpose then
					local var_27_4 = Mathf.Lerp(0, 0.5, var_27_3)

					arg_24_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_24_1.var_.characterEffect4014_tpose.fillRatio = var_27_4
				end
			end

			if arg_24_1.time_ >= var_27_1 + var_27_2 and arg_24_1.time_ < var_27_1 + var_27_2 + arg_27_0 and arg_24_1.var_.characterEffect4014_tpose then
				local var_27_5 = 0.5

				arg_24_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_24_1.var_.characterEffect4014_tpose.fillRatio = var_27_5
			end

			local var_27_6 = arg_24_1.actors_["10003ui_story"]
			local var_27_7 = 0

			if var_27_7 < arg_24_1.time_ and arg_24_1.time_ <= var_27_7 + arg_27_0 and arg_24_1.var_.characterEffect10003ui_story == nil then
				arg_24_1.var_.characterEffect10003ui_story = var_27_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_8 = 0.1

			if var_27_7 <= arg_24_1.time_ and arg_24_1.time_ < var_27_7 + var_27_8 then
				local var_27_9 = (arg_24_1.time_ - var_27_7) / var_27_8

				if arg_24_1.var_.characterEffect10003ui_story then
					arg_24_1.var_.characterEffect10003ui_story.fillFlat = false
				end
			end

			if arg_24_1.time_ >= var_27_7 + var_27_8 and arg_24_1.time_ < var_27_7 + var_27_8 + arg_27_0 and arg_24_1.var_.characterEffect10003ui_story then
				arg_24_1.var_.characterEffect10003ui_story.fillFlat = false
			end

			local var_27_10 = 0

			if var_27_10 < arg_24_1.time_ and arg_24_1.time_ <= var_27_10 + arg_27_0 then
				arg_24_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_27_11 = 0
			local var_27_12 = 0.525

			if var_27_11 < arg_24_1.time_ and arg_24_1.time_ <= var_27_11 + arg_27_0 then
				arg_24_1.talkMaxDuration = 0
				arg_24_1.dialogCg_.alpha = 1

				arg_24_1.dialog_:SetActive(true)
				SetActive(arg_24_1.leftNameGo_, true)

				local var_27_13 = arg_24_1:FormatText(StoryNameCfg[81].name)

				arg_24_1.leftNameTxt_.text = var_27_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_24_1.leftNameTxt_.transform)

				arg_24_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_24_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_24_1:RecordName(arg_24_1.leftNameTxt_.text)
				SetActive(arg_24_1.iconTrs_.gameObject, false)
				arg_24_1.callingController_:SetSelectedState("normal")

				local var_27_14 = arg_24_1:GetWordFromCfg(106081006)
				local var_27_15 = arg_24_1:FormatText(var_27_14.content)

				arg_24_1.text_.text = var_27_15

				LuaForUtil.ClearLinePrefixSymbol(arg_24_1.text_)

				local var_27_16 = 25
				local var_27_17 = utf8.len(var_27_15)
				local var_27_18 = var_27_16 <= 0 and var_27_12 or var_27_12 * (var_27_17 / var_27_16)

				if var_27_18 > 0 and var_27_12 < var_27_18 then
					arg_24_1.talkMaxDuration = var_27_18

					if var_27_18 + var_27_11 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_18 + var_27_11
					end
				end

				arg_24_1.text_.text = var_27_15
				arg_24_1.typewritter.percent = 0

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081006", "story_v_out_106081.awb") ~= 0 then
					local var_27_19 = manager.audio:GetVoiceLength("story_v_out_106081", "106081006", "story_v_out_106081.awb") / 1000

					if var_27_19 + var_27_11 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_19 + var_27_11
					end

					if var_27_14.prefab_name ~= "" and arg_24_1.actors_[var_27_14.prefab_name] ~= nil then
						local var_27_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_24_1.actors_[var_27_14.prefab_name].transform, "story_v_out_106081", "106081006", "story_v_out_106081.awb")

						arg_24_1:RecordAudio("106081006", var_27_20)
						arg_24_1:RecordAudio("106081006", var_27_20)
					else
						arg_24_1:AudioAction("play", "voice", "story_v_out_106081", "106081006", "story_v_out_106081.awb")
					end

					arg_24_1:RecordHistoryTalkVoice("story_v_out_106081", "106081006", "story_v_out_106081.awb")
				end

				arg_24_1:RecordContent(arg_24_1.text_.text)
			end

			local var_27_21 = math.max(var_27_12, arg_24_1.talkMaxDuration)

			if var_27_11 <= arg_24_1.time_ and arg_24_1.time_ < var_27_11 + var_27_21 then
				arg_24_1.typewritter.percent = (arg_24_1.time_ - var_27_11) / var_27_21

				arg_24_1.typewritter:SetDirty()
			end

			if arg_24_1.time_ >= var_27_11 + var_27_21 and arg_24_1.time_ < var_27_11 + var_27_21 + arg_27_0 then
				arg_24_1.typewritter.percent = 1

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(true)
			end
		end
	end,
	Play106081007 = function(arg_28_0, arg_28_1)
		arg_28_1.time_ = 0
		arg_28_1.frameCnt_ = 0
		arg_28_1.state_ = "playing"
		arg_28_1.curTalkId_ = 106081007
		arg_28_1.duration_ = 8.67

		local var_28_0 = {
			ja = 8.666,
			ko = 7.7,
			zh = 8.566,
			en = 8.6
		}
		local var_28_1 = manager.audio:GetLocalizationFlag()

		if var_28_0[var_28_1] ~= nil then
			arg_28_1.duration_ = var_28_0[var_28_1]
		end

		SetActive(arg_28_1.tipsGo_, false)

		function arg_28_1.onSingleLineFinish_()
			arg_28_1.onSingleLineUpdate_ = nil
			arg_28_1.onSingleLineFinish_ = nil
			arg_28_1.state_ = "waiting"
		end

		function arg_28_1.playNext_(arg_30_0)
			if arg_30_0 == 1 then
				arg_28_0:Play106081008(arg_28_1)
			end
		end

		function arg_28_1.onSingleLineUpdate_(arg_31_0)
			local var_31_0 = arg_28_1.actors_["4014_tpose"]
			local var_31_1 = 0

			if var_31_1 < arg_28_1.time_ and arg_28_1.time_ <= var_31_1 + arg_31_0 and arg_28_1.var_.characterEffect4014_tpose == nil then
				arg_28_1.var_.characterEffect4014_tpose = var_31_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_31_2 = 0.1

			if var_31_1 <= arg_28_1.time_ and arg_28_1.time_ < var_31_1 + var_31_2 then
				local var_31_3 = (arg_28_1.time_ - var_31_1) / var_31_2

				if arg_28_1.var_.characterEffect4014_tpose then
					arg_28_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_28_1.time_ >= var_31_1 + var_31_2 and arg_28_1.time_ < var_31_1 + var_31_2 + arg_31_0 and arg_28_1.var_.characterEffect4014_tpose then
				arg_28_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_31_4 = arg_28_1.actors_["10003ui_story"]
			local var_31_5 = 0

			if var_31_5 < arg_28_1.time_ and arg_28_1.time_ <= var_31_5 + arg_31_0 and arg_28_1.var_.characterEffect10003ui_story == nil then
				arg_28_1.var_.characterEffect10003ui_story = var_31_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_31_6 = 0.1

			if var_31_5 <= arg_28_1.time_ and arg_28_1.time_ < var_31_5 + var_31_6 then
				local var_31_7 = (arg_28_1.time_ - var_31_5) / var_31_6

				if arg_28_1.var_.characterEffect10003ui_story then
					local var_31_8 = Mathf.Lerp(0, 0.5, var_31_7)

					arg_28_1.var_.characterEffect10003ui_story.fillFlat = true
					arg_28_1.var_.characterEffect10003ui_story.fillRatio = var_31_8
				end
			end

			if arg_28_1.time_ >= var_31_5 + var_31_6 and arg_28_1.time_ < var_31_5 + var_31_6 + arg_31_0 and arg_28_1.var_.characterEffect10003ui_story then
				local var_31_9 = 0.5

				arg_28_1.var_.characterEffect10003ui_story.fillFlat = true
				arg_28_1.var_.characterEffect10003ui_story.fillRatio = var_31_9
			end

			local var_31_10 = 0
			local var_31_11 = 0.65

			if var_31_10 < arg_28_1.time_ and arg_28_1.time_ <= var_31_10 + arg_31_0 then
				arg_28_1.talkMaxDuration = 0
				arg_28_1.dialogCg_.alpha = 1

				arg_28_1.dialog_:SetActive(true)
				SetActive(arg_28_1.leftNameGo_, true)

				local var_31_12 = arg_28_1:FormatText(StoryNameCfg[87].name)

				arg_28_1.leftNameTxt_.text = var_31_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_28_1.leftNameTxt_.transform)

				arg_28_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_28_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_28_1:RecordName(arg_28_1.leftNameTxt_.text)
				SetActive(arg_28_1.iconTrs_.gameObject, false)
				arg_28_1.callingController_:SetSelectedState("normal")

				local var_31_13 = arg_28_1:GetWordFromCfg(106081007)
				local var_31_14 = arg_28_1:FormatText(var_31_13.content)

				arg_28_1.text_.text = var_31_14

				LuaForUtil.ClearLinePrefixSymbol(arg_28_1.text_)

				local var_31_15 = 26
				local var_31_16 = utf8.len(var_31_14)
				local var_31_17 = var_31_15 <= 0 and var_31_11 or var_31_11 * (var_31_16 / var_31_15)

				if var_31_17 > 0 and var_31_11 < var_31_17 then
					arg_28_1.talkMaxDuration = var_31_17

					if var_31_17 + var_31_10 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_17 + var_31_10
					end
				end

				arg_28_1.text_.text = var_31_14
				arg_28_1.typewritter.percent = 0

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081007", "story_v_out_106081.awb") ~= 0 then
					local var_31_18 = manager.audio:GetVoiceLength("story_v_out_106081", "106081007", "story_v_out_106081.awb") / 1000

					if var_31_18 + var_31_10 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_18 + var_31_10
					end

					if var_31_13.prefab_name ~= "" and arg_28_1.actors_[var_31_13.prefab_name] ~= nil then
						local var_31_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_28_1.actors_[var_31_13.prefab_name].transform, "story_v_out_106081", "106081007", "story_v_out_106081.awb")

						arg_28_1:RecordAudio("106081007", var_31_19)
						arg_28_1:RecordAudio("106081007", var_31_19)
					else
						arg_28_1:AudioAction("play", "voice", "story_v_out_106081", "106081007", "story_v_out_106081.awb")
					end

					arg_28_1:RecordHistoryTalkVoice("story_v_out_106081", "106081007", "story_v_out_106081.awb")
				end

				arg_28_1:RecordContent(arg_28_1.text_.text)
			end

			local var_31_20 = math.max(var_31_11, arg_28_1.talkMaxDuration)

			if var_31_10 <= arg_28_1.time_ and arg_28_1.time_ < var_31_10 + var_31_20 then
				arg_28_1.typewritter.percent = (arg_28_1.time_ - var_31_10) / var_31_20

				arg_28_1.typewritter:SetDirty()
			end

			if arg_28_1.time_ >= var_31_10 + var_31_20 and arg_28_1.time_ < var_31_10 + var_31_20 + arg_31_0 then
				arg_28_1.typewritter.percent = 1

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(true)
			end
		end
	end,
	Play106081008 = function(arg_32_0, arg_32_1)
		arg_32_1.time_ = 0
		arg_32_1.frameCnt_ = 0
		arg_32_1.state_ = "playing"
		arg_32_1.curTalkId_ = 106081008
		arg_32_1.duration_ = 4.77

		local var_32_0 = {
			ja = 4.766,
			ko = 3.8,
			zh = 4.5,
			en = 2.6
		}
		local var_32_1 = manager.audio:GetLocalizationFlag()

		if var_32_0[var_32_1] ~= nil then
			arg_32_1.duration_ = var_32_0[var_32_1]
		end

		SetActive(arg_32_1.tipsGo_, false)

		function arg_32_1.onSingleLineFinish_()
			arg_32_1.onSingleLineUpdate_ = nil
			arg_32_1.onSingleLineFinish_ = nil
			arg_32_1.state_ = "waiting"
		end

		function arg_32_1.playNext_(arg_34_0)
			if arg_34_0 == 1 then
				arg_32_0:Play106081009(arg_32_1)
			end
		end

		function arg_32_1.onSingleLineUpdate_(arg_35_0)
			local var_35_0 = arg_32_1.actors_["4014_tpose"]
			local var_35_1 = 0

			if var_35_1 < arg_32_1.time_ and arg_32_1.time_ <= var_35_1 + arg_35_0 and arg_32_1.var_.characterEffect4014_tpose == nil then
				arg_32_1.var_.characterEffect4014_tpose = var_35_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_35_2 = 0.1

			if var_35_1 <= arg_32_1.time_ and arg_32_1.time_ < var_35_1 + var_35_2 then
				local var_35_3 = (arg_32_1.time_ - var_35_1) / var_35_2

				if arg_32_1.var_.characterEffect4014_tpose then
					local var_35_4 = Mathf.Lerp(0, 0.5, var_35_3)

					arg_32_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_32_1.var_.characterEffect4014_tpose.fillRatio = var_35_4
				end
			end

			if arg_32_1.time_ >= var_35_1 + var_35_2 and arg_32_1.time_ < var_35_1 + var_35_2 + arg_35_0 and arg_32_1.var_.characterEffect4014_tpose then
				local var_35_5 = 0.5

				arg_32_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_32_1.var_.characterEffect4014_tpose.fillRatio = var_35_5
			end

			local var_35_6 = arg_32_1.actors_["10003ui_story"].transform
			local var_35_7 = 0

			if var_35_7 < arg_32_1.time_ and arg_32_1.time_ <= var_35_7 + arg_35_0 then
				arg_32_1.var_.moveOldPos10003ui_story = var_35_6.localPosition
			end

			local var_35_8 = 0.001

			if var_35_7 <= arg_32_1.time_ and arg_32_1.time_ < var_35_7 + var_35_8 then
				local var_35_9 = (arg_32_1.time_ - var_35_7) / var_35_8
				local var_35_10 = Vector3.New(0, 100, 0)

				var_35_6.localPosition = Vector3.Lerp(arg_32_1.var_.moveOldPos10003ui_story, var_35_10, var_35_9)

				local var_35_11 = manager.ui.mainCamera.transform.position - var_35_6.position

				var_35_6.forward = Vector3.New(var_35_11.x, var_35_11.y, var_35_11.z)

				local var_35_12 = var_35_6.localEulerAngles

				var_35_12.z = 0
				var_35_12.x = 0
				var_35_6.localEulerAngles = var_35_12
			end

			if arg_32_1.time_ >= var_35_7 + var_35_8 and arg_32_1.time_ < var_35_7 + var_35_8 + arg_35_0 then
				var_35_6.localPosition = Vector3.New(0, 100, 0)

				local var_35_13 = manager.ui.mainCamera.transform.position - var_35_6.position

				var_35_6.forward = Vector3.New(var_35_13.x, var_35_13.y, var_35_13.z)

				local var_35_14 = var_35_6.localEulerAngles

				var_35_14.z = 0
				var_35_14.x = 0
				var_35_6.localEulerAngles = var_35_14
			end

			local var_35_15 = arg_32_1.actors_["10004ui_story"].transform
			local var_35_16 = 0

			if var_35_16 < arg_32_1.time_ and arg_32_1.time_ <= var_35_16 + arg_35_0 then
				arg_32_1.var_.moveOldPos10004ui_story = var_35_15.localPosition
			end

			local var_35_17 = 0.001

			if var_35_16 <= arg_32_1.time_ and arg_32_1.time_ < var_35_16 + var_35_17 then
				local var_35_18 = (arg_32_1.time_ - var_35_16) / var_35_17
				local var_35_19 = Vector3.New(-0.7, -1.1, -5.6)

				var_35_15.localPosition = Vector3.Lerp(arg_32_1.var_.moveOldPos10004ui_story, var_35_19, var_35_18)

				local var_35_20 = manager.ui.mainCamera.transform.position - var_35_15.position

				var_35_15.forward = Vector3.New(var_35_20.x, var_35_20.y, var_35_20.z)

				local var_35_21 = var_35_15.localEulerAngles

				var_35_21.z = 0
				var_35_21.x = 0
				var_35_15.localEulerAngles = var_35_21
			end

			if arg_32_1.time_ >= var_35_16 + var_35_17 and arg_32_1.time_ < var_35_16 + var_35_17 + arg_35_0 then
				var_35_15.localPosition = Vector3.New(-0.7, -1.1, -5.6)

				local var_35_22 = manager.ui.mainCamera.transform.position - var_35_15.position

				var_35_15.forward = Vector3.New(var_35_22.x, var_35_22.y, var_35_22.z)

				local var_35_23 = var_35_15.localEulerAngles

				var_35_23.z = 0
				var_35_23.x = 0
				var_35_15.localEulerAngles = var_35_23
			end

			local var_35_24 = arg_32_1.actors_["10004ui_story"]
			local var_35_25 = 0

			if var_35_25 < arg_32_1.time_ and arg_32_1.time_ <= var_35_25 + arg_35_0 and arg_32_1.var_.characterEffect10004ui_story == nil then
				arg_32_1.var_.characterEffect10004ui_story = var_35_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_35_26 = 0.2

			if var_35_25 <= arg_32_1.time_ and arg_32_1.time_ < var_35_25 + var_35_26 then
				local var_35_27 = (arg_32_1.time_ - var_35_25) / var_35_26

				if arg_32_1.var_.characterEffect10004ui_story then
					arg_32_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_32_1.time_ >= var_35_25 + var_35_26 and arg_32_1.time_ < var_35_25 + var_35_26 + arg_35_0 and arg_32_1.var_.characterEffect10004ui_story then
				arg_32_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_35_28 = 0

			if var_35_28 < arg_32_1.time_ and arg_32_1.time_ <= var_35_28 + arg_35_0 then
				arg_32_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action1_1")
			end

			local var_35_29 = 0

			if var_35_29 < arg_32_1.time_ and arg_32_1.time_ <= var_35_29 + arg_35_0 then
				arg_32_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_35_30 = 0
			local var_35_31 = 0.45

			if var_35_30 < arg_32_1.time_ and arg_32_1.time_ <= var_35_30 + arg_35_0 then
				arg_32_1.talkMaxDuration = 0
				arg_32_1.dialogCg_.alpha = 1

				arg_32_1.dialog_:SetActive(true)
				SetActive(arg_32_1.leftNameGo_, true)

				local var_35_32 = arg_32_1:FormatText(StoryNameCfg[80].name)

				arg_32_1.leftNameTxt_.text = var_35_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_32_1.leftNameTxt_.transform)

				arg_32_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_32_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_32_1:RecordName(arg_32_1.leftNameTxt_.text)
				SetActive(arg_32_1.iconTrs_.gameObject, false)
				arg_32_1.callingController_:SetSelectedState("normal")

				local var_35_33 = arg_32_1:GetWordFromCfg(106081008)
				local var_35_34 = arg_32_1:FormatText(var_35_33.content)

				arg_32_1.text_.text = var_35_34

				LuaForUtil.ClearLinePrefixSymbol(arg_32_1.text_)

				local var_35_35 = 18
				local var_35_36 = utf8.len(var_35_34)
				local var_35_37 = var_35_35 <= 0 and var_35_31 or var_35_31 * (var_35_36 / var_35_35)

				if var_35_37 > 0 and var_35_31 < var_35_37 then
					arg_32_1.talkMaxDuration = var_35_37

					if var_35_37 + var_35_30 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_37 + var_35_30
					end
				end

				arg_32_1.text_.text = var_35_34
				arg_32_1.typewritter.percent = 0

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081008", "story_v_out_106081.awb") ~= 0 then
					local var_35_38 = manager.audio:GetVoiceLength("story_v_out_106081", "106081008", "story_v_out_106081.awb") / 1000

					if var_35_38 + var_35_30 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_38 + var_35_30
					end

					if var_35_33.prefab_name ~= "" and arg_32_1.actors_[var_35_33.prefab_name] ~= nil then
						local var_35_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_32_1.actors_[var_35_33.prefab_name].transform, "story_v_out_106081", "106081008", "story_v_out_106081.awb")

						arg_32_1:RecordAudio("106081008", var_35_39)
						arg_32_1:RecordAudio("106081008", var_35_39)
					else
						arg_32_1:AudioAction("play", "voice", "story_v_out_106081", "106081008", "story_v_out_106081.awb")
					end

					arg_32_1:RecordHistoryTalkVoice("story_v_out_106081", "106081008", "story_v_out_106081.awb")
				end

				arg_32_1:RecordContent(arg_32_1.text_.text)
			end

			local var_35_40 = math.max(var_35_31, arg_32_1.talkMaxDuration)

			if var_35_30 <= arg_32_1.time_ and arg_32_1.time_ < var_35_30 + var_35_40 then
				arg_32_1.typewritter.percent = (arg_32_1.time_ - var_35_30) / var_35_40

				arg_32_1.typewritter:SetDirty()
			end

			if arg_32_1.time_ >= var_35_30 + var_35_40 and arg_32_1.time_ < var_35_30 + var_35_40 + arg_35_0 then
				arg_32_1.typewritter.percent = 1

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(true)
			end
		end
	end,
	Play106081009 = function(arg_36_0, arg_36_1)
		arg_36_1.time_ = 0
		arg_36_1.frameCnt_ = 0
		arg_36_1.state_ = "playing"
		arg_36_1.curTalkId_ = 106081009
		arg_36_1.duration_ = 15.4

		local var_36_0 = {
			ja = 15.4,
			ko = 11.2,
			zh = 11.166,
			en = 9.433
		}
		local var_36_1 = manager.audio:GetLocalizationFlag()

		if var_36_0[var_36_1] ~= nil then
			arg_36_1.duration_ = var_36_0[var_36_1]
		end

		SetActive(arg_36_1.tipsGo_, false)

		function arg_36_1.onSingleLineFinish_()
			arg_36_1.onSingleLineUpdate_ = nil
			arg_36_1.onSingleLineFinish_ = nil
			arg_36_1.state_ = "waiting"
		end

		function arg_36_1.playNext_(arg_38_0)
			if arg_38_0 == 1 then
				arg_36_0:Play106081010(arg_36_1)
			end
		end

		function arg_36_1.onSingleLineUpdate_(arg_39_0)
			local var_39_0 = arg_36_1.actors_["4014_tpose"]
			local var_39_1 = 0

			if var_39_1 < arg_36_1.time_ and arg_36_1.time_ <= var_39_1 + arg_39_0 and arg_36_1.var_.characterEffect4014_tpose == nil then
				arg_36_1.var_.characterEffect4014_tpose = var_39_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_2 = 0.2

			if var_39_1 <= arg_36_1.time_ and arg_36_1.time_ < var_39_1 + var_39_2 then
				local var_39_3 = (arg_36_1.time_ - var_39_1) / var_39_2

				if arg_36_1.var_.characterEffect4014_tpose then
					arg_36_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_36_1.time_ >= var_39_1 + var_39_2 and arg_36_1.time_ < var_39_1 + var_39_2 + arg_39_0 and arg_36_1.var_.characterEffect4014_tpose then
				arg_36_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_39_4 = arg_36_1.actors_["10004ui_story"]
			local var_39_5 = 0

			if var_39_5 < arg_36_1.time_ and arg_36_1.time_ <= var_39_5 + arg_39_0 and arg_36_1.var_.characterEffect10004ui_story == nil then
				arg_36_1.var_.characterEffect10004ui_story = var_39_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_6 = 0.2

			if var_39_5 <= arg_36_1.time_ and arg_36_1.time_ < var_39_5 + var_39_6 then
				local var_39_7 = (arg_36_1.time_ - var_39_5) / var_39_6

				if arg_36_1.var_.characterEffect10004ui_story then
					local var_39_8 = Mathf.Lerp(0, 0.5, var_39_7)

					arg_36_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_36_1.var_.characterEffect10004ui_story.fillRatio = var_39_8
				end
			end

			if arg_36_1.time_ >= var_39_5 + var_39_6 and arg_36_1.time_ < var_39_5 + var_39_6 + arg_39_0 and arg_36_1.var_.characterEffect10004ui_story then
				local var_39_9 = 0.5

				arg_36_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_36_1.var_.characterEffect10004ui_story.fillRatio = var_39_9
			end

			local var_39_10 = 0
			local var_39_11 = 1

			if var_39_10 < arg_36_1.time_ and arg_36_1.time_ <= var_39_10 + arg_39_0 then
				arg_36_1.talkMaxDuration = 0
				arg_36_1.dialogCg_.alpha = 1

				arg_36_1.dialog_:SetActive(true)
				SetActive(arg_36_1.leftNameGo_, true)

				local var_39_12 = arg_36_1:FormatText(StoryNameCfg[87].name)

				arg_36_1.leftNameTxt_.text = var_39_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_36_1.leftNameTxt_.transform)

				arg_36_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_36_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_36_1:RecordName(arg_36_1.leftNameTxt_.text)
				SetActive(arg_36_1.iconTrs_.gameObject, false)
				arg_36_1.callingController_:SetSelectedState("normal")

				local var_39_13 = arg_36_1:GetWordFromCfg(106081009)
				local var_39_14 = arg_36_1:FormatText(var_39_13.content)

				arg_36_1.text_.text = var_39_14

				LuaForUtil.ClearLinePrefixSymbol(arg_36_1.text_)

				local var_39_15 = 40
				local var_39_16 = utf8.len(var_39_14)
				local var_39_17 = var_39_15 <= 0 and var_39_11 or var_39_11 * (var_39_16 / var_39_15)

				if var_39_17 > 0 and var_39_11 < var_39_17 then
					arg_36_1.talkMaxDuration = var_39_17

					if var_39_17 + var_39_10 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_17 + var_39_10
					end
				end

				arg_36_1.text_.text = var_39_14
				arg_36_1.typewritter.percent = 0

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081009", "story_v_out_106081.awb") ~= 0 then
					local var_39_18 = manager.audio:GetVoiceLength("story_v_out_106081", "106081009", "story_v_out_106081.awb") / 1000

					if var_39_18 + var_39_10 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_18 + var_39_10
					end

					if var_39_13.prefab_name ~= "" and arg_36_1.actors_[var_39_13.prefab_name] ~= nil then
						local var_39_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_36_1.actors_[var_39_13.prefab_name].transform, "story_v_out_106081", "106081009", "story_v_out_106081.awb")

						arg_36_1:RecordAudio("106081009", var_39_19)
						arg_36_1:RecordAudio("106081009", var_39_19)
					else
						arg_36_1:AudioAction("play", "voice", "story_v_out_106081", "106081009", "story_v_out_106081.awb")
					end

					arg_36_1:RecordHistoryTalkVoice("story_v_out_106081", "106081009", "story_v_out_106081.awb")
				end

				arg_36_1:RecordContent(arg_36_1.text_.text)
			end

			local var_39_20 = math.max(var_39_11, arg_36_1.talkMaxDuration)

			if var_39_10 <= arg_36_1.time_ and arg_36_1.time_ < var_39_10 + var_39_20 then
				arg_36_1.typewritter.percent = (arg_36_1.time_ - var_39_10) / var_39_20

				arg_36_1.typewritter:SetDirty()
			end

			if arg_36_1.time_ >= var_39_10 + var_39_20 and arg_36_1.time_ < var_39_10 + var_39_20 + arg_39_0 then
				arg_36_1.typewritter.percent = 1

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(true)
			end
		end
	end,
	Play106081010 = function(arg_40_0, arg_40_1)
		arg_40_1.time_ = 0
		arg_40_1.frameCnt_ = 0
		arg_40_1.state_ = "playing"
		arg_40_1.curTalkId_ = 106081010
		arg_40_1.duration_ = 5.67

		local var_40_0 = {
			ja = 3.333,
			ko = 5.666,
			zh = 4.5,
			en = 5.566
		}
		local var_40_1 = manager.audio:GetLocalizationFlag()

		if var_40_0[var_40_1] ~= nil then
			arg_40_1.duration_ = var_40_0[var_40_1]
		end

		SetActive(arg_40_1.tipsGo_, false)

		function arg_40_1.onSingleLineFinish_()
			arg_40_1.onSingleLineUpdate_ = nil
			arg_40_1.onSingleLineFinish_ = nil
			arg_40_1.state_ = "waiting"
		end

		function arg_40_1.playNext_(arg_42_0)
			if arg_42_0 == 1 then
				arg_40_0:Play106081011(arg_40_1)
			end
		end

		function arg_40_1.onSingleLineUpdate_(arg_43_0)
			local var_43_0 = 0
			local var_43_1 = 0.4

			if var_43_0 < arg_40_1.time_ and arg_40_1.time_ <= var_43_0 + arg_43_0 then
				arg_40_1.talkMaxDuration = 0
				arg_40_1.dialogCg_.alpha = 1

				arg_40_1.dialog_:SetActive(true)
				SetActive(arg_40_1.leftNameGo_, true)

				local var_43_2 = arg_40_1:FormatText(StoryNameCfg[87].name)

				arg_40_1.leftNameTxt_.text = var_43_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_40_1.leftNameTxt_.transform)

				arg_40_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_40_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_40_1:RecordName(arg_40_1.leftNameTxt_.text)
				SetActive(arg_40_1.iconTrs_.gameObject, false)
				arg_40_1.callingController_:SetSelectedState("normal")

				local var_43_3 = arg_40_1:GetWordFromCfg(106081010)
				local var_43_4 = arg_40_1:FormatText(var_43_3.content)

				arg_40_1.text_.text = var_43_4

				LuaForUtil.ClearLinePrefixSymbol(arg_40_1.text_)

				local var_43_5 = 16
				local var_43_6 = utf8.len(var_43_4)
				local var_43_7 = var_43_5 <= 0 and var_43_1 or var_43_1 * (var_43_6 / var_43_5)

				if var_43_7 > 0 and var_43_1 < var_43_7 then
					arg_40_1.talkMaxDuration = var_43_7

					if var_43_7 + var_43_0 > arg_40_1.duration_ then
						arg_40_1.duration_ = var_43_7 + var_43_0
					end
				end

				arg_40_1.text_.text = var_43_4
				arg_40_1.typewritter.percent = 0

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081010", "story_v_out_106081.awb") ~= 0 then
					local var_43_8 = manager.audio:GetVoiceLength("story_v_out_106081", "106081010", "story_v_out_106081.awb") / 1000

					if var_43_8 + var_43_0 > arg_40_1.duration_ then
						arg_40_1.duration_ = var_43_8 + var_43_0
					end

					if var_43_3.prefab_name ~= "" and arg_40_1.actors_[var_43_3.prefab_name] ~= nil then
						local var_43_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_40_1.actors_[var_43_3.prefab_name].transform, "story_v_out_106081", "106081010", "story_v_out_106081.awb")

						arg_40_1:RecordAudio("106081010", var_43_9)
						arg_40_1:RecordAudio("106081010", var_43_9)
					else
						arg_40_1:AudioAction("play", "voice", "story_v_out_106081", "106081010", "story_v_out_106081.awb")
					end

					arg_40_1:RecordHistoryTalkVoice("story_v_out_106081", "106081010", "story_v_out_106081.awb")
				end

				arg_40_1:RecordContent(arg_40_1.text_.text)
			end

			local var_43_10 = math.max(var_43_1, arg_40_1.talkMaxDuration)

			if var_43_0 <= arg_40_1.time_ and arg_40_1.time_ < var_43_0 + var_43_10 then
				arg_40_1.typewritter.percent = (arg_40_1.time_ - var_43_0) / var_43_10

				arg_40_1.typewritter:SetDirty()
			end

			if arg_40_1.time_ >= var_43_0 + var_43_10 and arg_40_1.time_ < var_43_0 + var_43_10 + arg_43_0 then
				arg_40_1.typewritter.percent = 1

				arg_40_1.typewritter:SetDirty()
				arg_40_1:ShowNextGo(true)
			end
		end
	end,
	Play106081011 = function(arg_44_0, arg_44_1)
		arg_44_1.time_ = 0
		arg_44_1.frameCnt_ = 0
		arg_44_1.state_ = "playing"
		arg_44_1.curTalkId_ = 106081011
		arg_44_1.duration_ = 7

		local var_44_0 = {
			ja = 7,
			ko = 2,
			zh = 2.033,
			en = 2.066
		}
		local var_44_1 = manager.audio:GetLocalizationFlag()

		if var_44_0[var_44_1] ~= nil then
			arg_44_1.duration_ = var_44_0[var_44_1]
		end

		SetActive(arg_44_1.tipsGo_, false)

		function arg_44_1.onSingleLineFinish_()
			arg_44_1.onSingleLineUpdate_ = nil
			arg_44_1.onSingleLineFinish_ = nil
			arg_44_1.state_ = "waiting"
		end

		function arg_44_1.playNext_(arg_46_0)
			if arg_46_0 == 1 then
				arg_44_0:Play106081012(arg_44_1)
			end
		end

		function arg_44_1.onSingleLineUpdate_(arg_47_0)
			local var_47_0 = arg_44_1.actors_["4014_tpose"]
			local var_47_1 = 0

			if var_47_1 < arg_44_1.time_ and arg_44_1.time_ <= var_47_1 + arg_47_0 and arg_44_1.var_.characterEffect4014_tpose == nil then
				arg_44_1.var_.characterEffect4014_tpose = var_47_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_47_2 = 0.199999999999

			if var_47_1 <= arg_44_1.time_ and arg_44_1.time_ < var_47_1 + var_47_2 then
				local var_47_3 = (arg_44_1.time_ - var_47_1) / var_47_2

				if arg_44_1.var_.characterEffect4014_tpose then
					local var_47_4 = Mathf.Lerp(0, 0.5, var_47_3)

					arg_44_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_44_1.var_.characterEffect4014_tpose.fillRatio = var_47_4
				end
			end

			if arg_44_1.time_ >= var_47_1 + var_47_2 and arg_44_1.time_ < var_47_1 + var_47_2 + arg_47_0 and arg_44_1.var_.characterEffect4014_tpose then
				local var_47_5 = 0.5

				arg_44_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_44_1.var_.characterEffect4014_tpose.fillRatio = var_47_5
			end

			local var_47_6 = arg_44_1.actors_["10004ui_story"]
			local var_47_7 = 0

			if var_47_7 < arg_44_1.time_ and arg_44_1.time_ <= var_47_7 + arg_47_0 and arg_44_1.var_.characterEffect10004ui_story == nil then
				arg_44_1.var_.characterEffect10004ui_story = var_47_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_47_8 = 0.2

			if var_47_7 <= arg_44_1.time_ and arg_44_1.time_ < var_47_7 + var_47_8 then
				local var_47_9 = (arg_44_1.time_ - var_47_7) / var_47_8

				if arg_44_1.var_.characterEffect10004ui_story then
					arg_44_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_44_1.time_ >= var_47_7 + var_47_8 and arg_44_1.time_ < var_47_7 + var_47_8 + arg_47_0 and arg_44_1.var_.characterEffect10004ui_story then
				arg_44_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_47_10 = 0

			if var_47_10 < arg_44_1.time_ and arg_44_1.time_ <= var_47_10 + arg_47_0 then
				arg_44_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_47_11 = 0
			local var_47_12 = 0.2

			if var_47_11 < arg_44_1.time_ and arg_44_1.time_ <= var_47_11 + arg_47_0 then
				arg_44_1.talkMaxDuration = 0
				arg_44_1.dialogCg_.alpha = 1

				arg_44_1.dialog_:SetActive(true)
				SetActive(arg_44_1.leftNameGo_, true)

				local var_47_13 = arg_44_1:FormatText(StoryNameCfg[80].name)

				arg_44_1.leftNameTxt_.text = var_47_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_44_1.leftNameTxt_.transform)

				arg_44_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_44_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_44_1:RecordName(arg_44_1.leftNameTxt_.text)
				SetActive(arg_44_1.iconTrs_.gameObject, false)
				arg_44_1.callingController_:SetSelectedState("normal")

				local var_47_14 = arg_44_1:GetWordFromCfg(106081011)
				local var_47_15 = arg_44_1:FormatText(var_47_14.content)

				arg_44_1.text_.text = var_47_15

				LuaForUtil.ClearLinePrefixSymbol(arg_44_1.text_)

				local var_47_16 = 8
				local var_47_17 = utf8.len(var_47_15)
				local var_47_18 = var_47_16 <= 0 and var_47_12 or var_47_12 * (var_47_17 / var_47_16)

				if var_47_18 > 0 and var_47_12 < var_47_18 then
					arg_44_1.talkMaxDuration = var_47_18

					if var_47_18 + var_47_11 > arg_44_1.duration_ then
						arg_44_1.duration_ = var_47_18 + var_47_11
					end
				end

				arg_44_1.text_.text = var_47_15
				arg_44_1.typewritter.percent = 0

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081011", "story_v_out_106081.awb") ~= 0 then
					local var_47_19 = manager.audio:GetVoiceLength("story_v_out_106081", "106081011", "story_v_out_106081.awb") / 1000

					if var_47_19 + var_47_11 > arg_44_1.duration_ then
						arg_44_1.duration_ = var_47_19 + var_47_11
					end

					if var_47_14.prefab_name ~= "" and arg_44_1.actors_[var_47_14.prefab_name] ~= nil then
						local var_47_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_44_1.actors_[var_47_14.prefab_name].transform, "story_v_out_106081", "106081011", "story_v_out_106081.awb")

						arg_44_1:RecordAudio("106081011", var_47_20)
						arg_44_1:RecordAudio("106081011", var_47_20)
					else
						arg_44_1:AudioAction("play", "voice", "story_v_out_106081", "106081011", "story_v_out_106081.awb")
					end

					arg_44_1:RecordHistoryTalkVoice("story_v_out_106081", "106081011", "story_v_out_106081.awb")
				end

				arg_44_1:RecordContent(arg_44_1.text_.text)
			end

			local var_47_21 = math.max(var_47_12, arg_44_1.talkMaxDuration)

			if var_47_11 <= arg_44_1.time_ and arg_44_1.time_ < var_47_11 + var_47_21 then
				arg_44_1.typewritter.percent = (arg_44_1.time_ - var_47_11) / var_47_21

				arg_44_1.typewritter:SetDirty()
			end

			if arg_44_1.time_ >= var_47_11 + var_47_21 and arg_44_1.time_ < var_47_11 + var_47_21 + arg_47_0 then
				arg_44_1.typewritter.percent = 1

				arg_44_1.typewritter:SetDirty()
				arg_44_1:ShowNextGo(true)
			end
		end
	end,
	Play106081012 = function(arg_48_0, arg_48_1)
		arg_48_1.time_ = 0
		arg_48_1.frameCnt_ = 0
		arg_48_1.state_ = "playing"
		arg_48_1.curTalkId_ = 106081012
		arg_48_1.duration_ = 6.7

		local var_48_0 = {
			ja = 6.7,
			ko = 6.033,
			zh = 4.666,
			en = 6
		}
		local var_48_1 = manager.audio:GetLocalizationFlag()

		if var_48_0[var_48_1] ~= nil then
			arg_48_1.duration_ = var_48_0[var_48_1]
		end

		SetActive(arg_48_1.tipsGo_, false)

		function arg_48_1.onSingleLineFinish_()
			arg_48_1.onSingleLineUpdate_ = nil
			arg_48_1.onSingleLineFinish_ = nil
			arg_48_1.state_ = "waiting"
		end

		function arg_48_1.playNext_(arg_50_0)
			if arg_50_0 == 1 then
				arg_48_0:Play106081013(arg_48_1)
			end
		end

		function arg_48_1.onSingleLineUpdate_(arg_51_0)
			local var_51_0 = arg_48_1.actors_["4014_tpose"]
			local var_51_1 = 0

			if var_51_1 < arg_48_1.time_ and arg_48_1.time_ <= var_51_1 + arg_51_0 and arg_48_1.var_.characterEffect4014_tpose == nil then
				arg_48_1.var_.characterEffect4014_tpose = var_51_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_51_2 = 0.2

			if var_51_1 <= arg_48_1.time_ and arg_48_1.time_ < var_51_1 + var_51_2 then
				local var_51_3 = (arg_48_1.time_ - var_51_1) / var_51_2

				if arg_48_1.var_.characterEffect4014_tpose then
					arg_48_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_48_1.time_ >= var_51_1 + var_51_2 and arg_48_1.time_ < var_51_1 + var_51_2 + arg_51_0 and arg_48_1.var_.characterEffect4014_tpose then
				arg_48_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_51_4 = arg_48_1.actors_["10004ui_story"]
			local var_51_5 = 0

			if var_51_5 < arg_48_1.time_ and arg_48_1.time_ <= var_51_5 + arg_51_0 and arg_48_1.var_.characterEffect10004ui_story == nil then
				arg_48_1.var_.characterEffect10004ui_story = var_51_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_51_6 = 0.2

			if var_51_5 <= arg_48_1.time_ and arg_48_1.time_ < var_51_5 + var_51_6 then
				local var_51_7 = (arg_48_1.time_ - var_51_5) / var_51_6

				if arg_48_1.var_.characterEffect10004ui_story then
					local var_51_8 = Mathf.Lerp(0, 0.5, var_51_7)

					arg_48_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_48_1.var_.characterEffect10004ui_story.fillRatio = var_51_8
				end
			end

			if arg_48_1.time_ >= var_51_5 + var_51_6 and arg_48_1.time_ < var_51_5 + var_51_6 + arg_51_0 and arg_48_1.var_.characterEffect10004ui_story then
				local var_51_9 = 0.5

				arg_48_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_48_1.var_.characterEffect10004ui_story.fillRatio = var_51_9
			end

			local var_51_10 = 0
			local var_51_11 = 0.475

			if var_51_10 < arg_48_1.time_ and arg_48_1.time_ <= var_51_10 + arg_51_0 then
				arg_48_1.talkMaxDuration = 0
				arg_48_1.dialogCg_.alpha = 1

				arg_48_1.dialog_:SetActive(true)
				SetActive(arg_48_1.leftNameGo_, true)

				local var_51_12 = arg_48_1:FormatText(StoryNameCfg[87].name)

				arg_48_1.leftNameTxt_.text = var_51_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_48_1.leftNameTxt_.transform)

				arg_48_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_48_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_48_1:RecordName(arg_48_1.leftNameTxt_.text)
				SetActive(arg_48_1.iconTrs_.gameObject, false)
				arg_48_1.callingController_:SetSelectedState("normal")

				local var_51_13 = arg_48_1:GetWordFromCfg(106081012)
				local var_51_14 = arg_48_1:FormatText(var_51_13.content)

				arg_48_1.text_.text = var_51_14

				LuaForUtil.ClearLinePrefixSymbol(arg_48_1.text_)

				local var_51_15 = 19
				local var_51_16 = utf8.len(var_51_14)
				local var_51_17 = var_51_15 <= 0 and var_51_11 or var_51_11 * (var_51_16 / var_51_15)

				if var_51_17 > 0 and var_51_11 < var_51_17 then
					arg_48_1.talkMaxDuration = var_51_17

					if var_51_17 + var_51_10 > arg_48_1.duration_ then
						arg_48_1.duration_ = var_51_17 + var_51_10
					end
				end

				arg_48_1.text_.text = var_51_14
				arg_48_1.typewritter.percent = 0

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081012", "story_v_out_106081.awb") ~= 0 then
					local var_51_18 = manager.audio:GetVoiceLength("story_v_out_106081", "106081012", "story_v_out_106081.awb") / 1000

					if var_51_18 + var_51_10 > arg_48_1.duration_ then
						arg_48_1.duration_ = var_51_18 + var_51_10
					end

					if var_51_13.prefab_name ~= "" and arg_48_1.actors_[var_51_13.prefab_name] ~= nil then
						local var_51_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_48_1.actors_[var_51_13.prefab_name].transform, "story_v_out_106081", "106081012", "story_v_out_106081.awb")

						arg_48_1:RecordAudio("106081012", var_51_19)
						arg_48_1:RecordAudio("106081012", var_51_19)
					else
						arg_48_1:AudioAction("play", "voice", "story_v_out_106081", "106081012", "story_v_out_106081.awb")
					end

					arg_48_1:RecordHistoryTalkVoice("story_v_out_106081", "106081012", "story_v_out_106081.awb")
				end

				arg_48_1:RecordContent(arg_48_1.text_.text)
			end

			local var_51_20 = math.max(var_51_11, arg_48_1.talkMaxDuration)

			if var_51_10 <= arg_48_1.time_ and arg_48_1.time_ < var_51_10 + var_51_20 then
				arg_48_1.typewritter.percent = (arg_48_1.time_ - var_51_10) / var_51_20

				arg_48_1.typewritter:SetDirty()
			end

			if arg_48_1.time_ >= var_51_10 + var_51_20 and arg_48_1.time_ < var_51_10 + var_51_20 + arg_51_0 then
				arg_48_1.typewritter.percent = 1

				arg_48_1.typewritter:SetDirty()
				arg_48_1:ShowNextGo(true)
			end
		end
	end,
	Play106081013 = function(arg_52_0, arg_52_1)
		arg_52_1.time_ = 0
		arg_52_1.frameCnt_ = 0
		arg_52_1.state_ = "playing"
		arg_52_1.curTalkId_ = 106081013
		arg_52_1.duration_ = 6.67

		local var_52_0 = {
			ja = 4.966,
			ko = 4.833,
			zh = 4.366,
			en = 6.666
		}
		local var_52_1 = manager.audio:GetLocalizationFlag()

		if var_52_0[var_52_1] ~= nil then
			arg_52_1.duration_ = var_52_0[var_52_1]
		end

		SetActive(arg_52_1.tipsGo_, false)

		function arg_52_1.onSingleLineFinish_()
			arg_52_1.onSingleLineUpdate_ = nil
			arg_52_1.onSingleLineFinish_ = nil
			arg_52_1.state_ = "waiting"
		end

		function arg_52_1.playNext_(arg_54_0)
			if arg_54_0 == 1 then
				arg_52_0:Play106081014(arg_52_1)
			end
		end

		function arg_52_1.onSingleLineUpdate_(arg_55_0)
			local var_55_0 = 0
			local var_55_1 = 0.425

			if var_55_0 < arg_52_1.time_ and arg_52_1.time_ <= var_55_0 + arg_55_0 then
				arg_52_1.talkMaxDuration = 0
				arg_52_1.dialogCg_.alpha = 1

				arg_52_1.dialog_:SetActive(true)
				SetActive(arg_52_1.leftNameGo_, true)

				local var_55_2 = arg_52_1:FormatText(StoryNameCfg[87].name)

				arg_52_1.leftNameTxt_.text = var_55_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_52_1.leftNameTxt_.transform)

				arg_52_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_52_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_52_1:RecordName(arg_52_1.leftNameTxt_.text)
				SetActive(arg_52_1.iconTrs_.gameObject, false)
				arg_52_1.callingController_:SetSelectedState("normal")

				local var_55_3 = arg_52_1:GetWordFromCfg(106081013)
				local var_55_4 = arg_52_1:FormatText(var_55_3.content)

				arg_52_1.text_.text = var_55_4

				LuaForUtil.ClearLinePrefixSymbol(arg_52_1.text_)

				local var_55_5 = 17
				local var_55_6 = utf8.len(var_55_4)
				local var_55_7 = var_55_5 <= 0 and var_55_1 or var_55_1 * (var_55_6 / var_55_5)

				if var_55_7 > 0 and var_55_1 < var_55_7 then
					arg_52_1.talkMaxDuration = var_55_7

					if var_55_7 + var_55_0 > arg_52_1.duration_ then
						arg_52_1.duration_ = var_55_7 + var_55_0
					end
				end

				arg_52_1.text_.text = var_55_4
				arg_52_1.typewritter.percent = 0

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081013", "story_v_out_106081.awb") ~= 0 then
					local var_55_8 = manager.audio:GetVoiceLength("story_v_out_106081", "106081013", "story_v_out_106081.awb") / 1000

					if var_55_8 + var_55_0 > arg_52_1.duration_ then
						arg_52_1.duration_ = var_55_8 + var_55_0
					end

					if var_55_3.prefab_name ~= "" and arg_52_1.actors_[var_55_3.prefab_name] ~= nil then
						local var_55_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_52_1.actors_[var_55_3.prefab_name].transform, "story_v_out_106081", "106081013", "story_v_out_106081.awb")

						arg_52_1:RecordAudio("106081013", var_55_9)
						arg_52_1:RecordAudio("106081013", var_55_9)
					else
						arg_52_1:AudioAction("play", "voice", "story_v_out_106081", "106081013", "story_v_out_106081.awb")
					end

					arg_52_1:RecordHistoryTalkVoice("story_v_out_106081", "106081013", "story_v_out_106081.awb")
				end

				arg_52_1:RecordContent(arg_52_1.text_.text)
			end

			local var_55_10 = math.max(var_55_1, arg_52_1.talkMaxDuration)

			if var_55_0 <= arg_52_1.time_ and arg_52_1.time_ < var_55_0 + var_55_10 then
				arg_52_1.typewritter.percent = (arg_52_1.time_ - var_55_0) / var_55_10

				arg_52_1.typewritter:SetDirty()
			end

			if arg_52_1.time_ >= var_55_0 + var_55_10 and arg_52_1.time_ < var_55_0 + var_55_10 + arg_55_0 then
				arg_52_1.typewritter.percent = 1

				arg_52_1.typewritter:SetDirty()
				arg_52_1:ShowNextGo(true)
			end
		end
	end,
	Play106081014 = function(arg_56_0, arg_56_1)
		arg_56_1.time_ = 0
		arg_56_1.frameCnt_ = 0
		arg_56_1.state_ = "playing"
		arg_56_1.curTalkId_ = 106081014
		arg_56_1.duration_ = 10.2

		local var_56_0 = {
			ja = 7.566,
			ko = 9.2,
			zh = 9.4,
			en = 10.2
		}
		local var_56_1 = manager.audio:GetLocalizationFlag()

		if var_56_0[var_56_1] ~= nil then
			arg_56_1.duration_ = var_56_0[var_56_1]
		end

		SetActive(arg_56_1.tipsGo_, false)

		function arg_56_1.onSingleLineFinish_()
			arg_56_1.onSingleLineUpdate_ = nil
			arg_56_1.onSingleLineFinish_ = nil
			arg_56_1.state_ = "waiting"
		end

		function arg_56_1.playNext_(arg_58_0)
			if arg_58_0 == 1 then
				arg_56_0:Play106081015(arg_56_1)
			end
		end

		function arg_56_1.onSingleLineUpdate_(arg_59_0)
			local var_59_0 = 0
			local var_59_1 = 0.975

			if var_59_0 < arg_56_1.time_ and arg_56_1.time_ <= var_59_0 + arg_59_0 then
				arg_56_1.talkMaxDuration = 0
				arg_56_1.dialogCg_.alpha = 1

				arg_56_1.dialog_:SetActive(true)
				SetActive(arg_56_1.leftNameGo_, true)

				local var_59_2 = arg_56_1:FormatText(StoryNameCfg[87].name)

				arg_56_1.leftNameTxt_.text = var_59_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_56_1.leftNameTxt_.transform)

				arg_56_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_56_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_56_1:RecordName(arg_56_1.leftNameTxt_.text)
				SetActive(arg_56_1.iconTrs_.gameObject, false)
				arg_56_1.callingController_:SetSelectedState("normal")

				local var_59_3 = arg_56_1:GetWordFromCfg(106081014)
				local var_59_4 = arg_56_1:FormatText(var_59_3.content)

				arg_56_1.text_.text = var_59_4

				LuaForUtil.ClearLinePrefixSymbol(arg_56_1.text_)

				local var_59_5 = 39
				local var_59_6 = utf8.len(var_59_4)
				local var_59_7 = var_59_5 <= 0 and var_59_1 or var_59_1 * (var_59_6 / var_59_5)

				if var_59_7 > 0 and var_59_1 < var_59_7 then
					arg_56_1.talkMaxDuration = var_59_7

					if var_59_7 + var_59_0 > arg_56_1.duration_ then
						arg_56_1.duration_ = var_59_7 + var_59_0
					end
				end

				arg_56_1.text_.text = var_59_4
				arg_56_1.typewritter.percent = 0

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081014", "story_v_out_106081.awb") ~= 0 then
					local var_59_8 = manager.audio:GetVoiceLength("story_v_out_106081", "106081014", "story_v_out_106081.awb") / 1000

					if var_59_8 + var_59_0 > arg_56_1.duration_ then
						arg_56_1.duration_ = var_59_8 + var_59_0
					end

					if var_59_3.prefab_name ~= "" and arg_56_1.actors_[var_59_3.prefab_name] ~= nil then
						local var_59_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_56_1.actors_[var_59_3.prefab_name].transform, "story_v_out_106081", "106081014", "story_v_out_106081.awb")

						arg_56_1:RecordAudio("106081014", var_59_9)
						arg_56_1:RecordAudio("106081014", var_59_9)
					else
						arg_56_1:AudioAction("play", "voice", "story_v_out_106081", "106081014", "story_v_out_106081.awb")
					end

					arg_56_1:RecordHistoryTalkVoice("story_v_out_106081", "106081014", "story_v_out_106081.awb")
				end

				arg_56_1:RecordContent(arg_56_1.text_.text)
			end

			local var_59_10 = math.max(var_59_1, arg_56_1.talkMaxDuration)

			if var_59_0 <= arg_56_1.time_ and arg_56_1.time_ < var_59_0 + var_59_10 then
				arg_56_1.typewritter.percent = (arg_56_1.time_ - var_59_0) / var_59_10

				arg_56_1.typewritter:SetDirty()
			end

			if arg_56_1.time_ >= var_59_0 + var_59_10 and arg_56_1.time_ < var_59_0 + var_59_10 + arg_59_0 then
				arg_56_1.typewritter.percent = 1

				arg_56_1.typewritter:SetDirty()
				arg_56_1:ShowNextGo(true)
			end
		end
	end,
	Play106081015 = function(arg_60_0, arg_60_1)
		arg_60_1.time_ = 0
		arg_60_1.frameCnt_ = 0
		arg_60_1.state_ = "playing"
		arg_60_1.curTalkId_ = 106081015
		arg_60_1.duration_ = 6.53

		local var_60_0 = {
			ja = 5,
			ko = 4.866,
			zh = 6.533,
			en = 4.666
		}
		local var_60_1 = manager.audio:GetLocalizationFlag()

		if var_60_0[var_60_1] ~= nil then
			arg_60_1.duration_ = var_60_0[var_60_1]
		end

		SetActive(arg_60_1.tipsGo_, false)

		function arg_60_1.onSingleLineFinish_()
			arg_60_1.onSingleLineUpdate_ = nil
			arg_60_1.onSingleLineFinish_ = nil
			arg_60_1.state_ = "waiting"
		end

		function arg_60_1.playNext_(arg_62_0)
			if arg_62_0 == 1 then
				arg_60_0:Play106081016(arg_60_1)
			end
		end

		function arg_60_1.onSingleLineUpdate_(arg_63_0)
			local var_63_0 = arg_60_1.actors_["4014_tpose"]
			local var_63_1 = 0

			if var_63_1 < arg_60_1.time_ and arg_60_1.time_ <= var_63_1 + arg_63_0 and arg_60_1.var_.characterEffect4014_tpose == nil then
				arg_60_1.var_.characterEffect4014_tpose = var_63_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_63_2 = 0.2

			if var_63_1 <= arg_60_1.time_ and arg_60_1.time_ < var_63_1 + var_63_2 then
				local var_63_3 = (arg_60_1.time_ - var_63_1) / var_63_2

				if arg_60_1.var_.characterEffect4014_tpose then
					local var_63_4 = Mathf.Lerp(0, 0.5, var_63_3)

					arg_60_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_60_1.var_.characterEffect4014_tpose.fillRatio = var_63_4
				end
			end

			if arg_60_1.time_ >= var_63_1 + var_63_2 and arg_60_1.time_ < var_63_1 + var_63_2 + arg_63_0 and arg_60_1.var_.characterEffect4014_tpose then
				local var_63_5 = 0.5

				arg_60_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_60_1.var_.characterEffect4014_tpose.fillRatio = var_63_5
			end

			local var_63_6 = arg_60_1.actors_["10004ui_story"]
			local var_63_7 = 0

			if var_63_7 < arg_60_1.time_ and arg_60_1.time_ <= var_63_7 + arg_63_0 and arg_60_1.var_.characterEffect10004ui_story == nil then
				arg_60_1.var_.characterEffect10004ui_story = var_63_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_63_8 = 0.2

			if var_63_7 <= arg_60_1.time_ and arg_60_1.time_ < var_63_7 + var_63_8 then
				local var_63_9 = (arg_60_1.time_ - var_63_7) / var_63_8

				if arg_60_1.var_.characterEffect10004ui_story then
					arg_60_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_60_1.time_ >= var_63_7 + var_63_8 and arg_60_1.time_ < var_63_7 + var_63_8 + arg_63_0 and arg_60_1.var_.characterEffect10004ui_story then
				arg_60_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_63_10 = 0

			if var_63_10 < arg_60_1.time_ and arg_60_1.time_ <= var_63_10 + arg_63_0 then
				arg_60_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action5_1")
			end

			local var_63_11 = 0

			if var_63_11 < arg_60_1.time_ and arg_60_1.time_ <= var_63_11 + arg_63_0 then
				arg_60_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_63_12 = 0
			local var_63_13 = 0.525

			if var_63_12 < arg_60_1.time_ and arg_60_1.time_ <= var_63_12 + arg_63_0 then
				arg_60_1.talkMaxDuration = 0
				arg_60_1.dialogCg_.alpha = 1

				arg_60_1.dialog_:SetActive(true)
				SetActive(arg_60_1.leftNameGo_, true)

				local var_63_14 = arg_60_1:FormatText(StoryNameCfg[80].name)

				arg_60_1.leftNameTxt_.text = var_63_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_60_1.leftNameTxt_.transform)

				arg_60_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_60_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_60_1:RecordName(arg_60_1.leftNameTxt_.text)
				SetActive(arg_60_1.iconTrs_.gameObject, false)
				arg_60_1.callingController_:SetSelectedState("normal")

				local var_63_15 = arg_60_1:GetWordFromCfg(106081015)
				local var_63_16 = arg_60_1:FormatText(var_63_15.content)

				arg_60_1.text_.text = var_63_16

				LuaForUtil.ClearLinePrefixSymbol(arg_60_1.text_)

				local var_63_17 = 21
				local var_63_18 = utf8.len(var_63_16)
				local var_63_19 = var_63_17 <= 0 and var_63_13 or var_63_13 * (var_63_18 / var_63_17)

				if var_63_19 > 0 and var_63_13 < var_63_19 then
					arg_60_1.talkMaxDuration = var_63_19

					if var_63_19 + var_63_12 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_19 + var_63_12
					end
				end

				arg_60_1.text_.text = var_63_16
				arg_60_1.typewritter.percent = 0

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081015", "story_v_out_106081.awb") ~= 0 then
					local var_63_20 = manager.audio:GetVoiceLength("story_v_out_106081", "106081015", "story_v_out_106081.awb") / 1000

					if var_63_20 + var_63_12 > arg_60_1.duration_ then
						arg_60_1.duration_ = var_63_20 + var_63_12
					end

					if var_63_15.prefab_name ~= "" and arg_60_1.actors_[var_63_15.prefab_name] ~= nil then
						local var_63_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_60_1.actors_[var_63_15.prefab_name].transform, "story_v_out_106081", "106081015", "story_v_out_106081.awb")

						arg_60_1:RecordAudio("106081015", var_63_21)
						arg_60_1:RecordAudio("106081015", var_63_21)
					else
						arg_60_1:AudioAction("play", "voice", "story_v_out_106081", "106081015", "story_v_out_106081.awb")
					end

					arg_60_1:RecordHistoryTalkVoice("story_v_out_106081", "106081015", "story_v_out_106081.awb")
				end

				arg_60_1:RecordContent(arg_60_1.text_.text)
			end

			local var_63_22 = math.max(var_63_13, arg_60_1.talkMaxDuration)

			if var_63_12 <= arg_60_1.time_ and arg_60_1.time_ < var_63_12 + var_63_22 then
				arg_60_1.typewritter.percent = (arg_60_1.time_ - var_63_12) / var_63_22

				arg_60_1.typewritter:SetDirty()
			end

			if arg_60_1.time_ >= var_63_12 + var_63_22 and arg_60_1.time_ < var_63_12 + var_63_22 + arg_63_0 then
				arg_60_1.typewritter.percent = 1

				arg_60_1.typewritter:SetDirty()
				arg_60_1:ShowNextGo(true)
			end
		end
	end,
	Play106081016 = function(arg_64_0, arg_64_1)
		arg_64_1.time_ = 0
		arg_64_1.frameCnt_ = 0
		arg_64_1.state_ = "playing"
		arg_64_1.curTalkId_ = 106081016
		arg_64_1.duration_ = 8.8

		local var_64_0 = {
			ja = 4.266,
			ko = 7.366,
			zh = 8.8,
			en = 8.766
		}
		local var_64_1 = manager.audio:GetLocalizationFlag()

		if var_64_0[var_64_1] ~= nil then
			arg_64_1.duration_ = var_64_0[var_64_1]
		end

		SetActive(arg_64_1.tipsGo_, false)

		function arg_64_1.onSingleLineFinish_()
			arg_64_1.onSingleLineUpdate_ = nil
			arg_64_1.onSingleLineFinish_ = nil
			arg_64_1.state_ = "waiting"
		end

		function arg_64_1.playNext_(arg_66_0)
			if arg_66_0 == 1 then
				arg_64_0:Play106081017(arg_64_1)
			end
		end

		function arg_64_1.onSingleLineUpdate_(arg_67_0)
			local var_67_0 = 0

			if var_67_0 < arg_64_1.time_ and arg_64_1.time_ <= var_67_0 + arg_67_0 then
				arg_64_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_67_1 = 0
			local var_67_2 = 0.875

			if var_67_1 < arg_64_1.time_ and arg_64_1.time_ <= var_67_1 + arg_67_0 then
				arg_64_1.talkMaxDuration = 0
				arg_64_1.dialogCg_.alpha = 1

				arg_64_1.dialog_:SetActive(true)
				SetActive(arg_64_1.leftNameGo_, true)

				local var_67_3 = arg_64_1:FormatText(StoryNameCfg[80].name)

				arg_64_1.leftNameTxt_.text = var_67_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_64_1.leftNameTxt_.transform)

				arg_64_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_64_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_64_1:RecordName(arg_64_1.leftNameTxt_.text)
				SetActive(arg_64_1.iconTrs_.gameObject, false)
				arg_64_1.callingController_:SetSelectedState("normal")

				local var_67_4 = arg_64_1:GetWordFromCfg(106081016)
				local var_67_5 = arg_64_1:FormatText(var_67_4.content)

				arg_64_1.text_.text = var_67_5

				LuaForUtil.ClearLinePrefixSymbol(arg_64_1.text_)

				local var_67_6 = 35
				local var_67_7 = utf8.len(var_67_5)
				local var_67_8 = var_67_6 <= 0 and var_67_2 or var_67_2 * (var_67_7 / var_67_6)

				if var_67_8 > 0 and var_67_2 < var_67_8 then
					arg_64_1.talkMaxDuration = var_67_8

					if var_67_8 + var_67_1 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_8 + var_67_1
					end
				end

				arg_64_1.text_.text = var_67_5
				arg_64_1.typewritter.percent = 0

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081016", "story_v_out_106081.awb") ~= 0 then
					local var_67_9 = manager.audio:GetVoiceLength("story_v_out_106081", "106081016", "story_v_out_106081.awb") / 1000

					if var_67_9 + var_67_1 > arg_64_1.duration_ then
						arg_64_1.duration_ = var_67_9 + var_67_1
					end

					if var_67_4.prefab_name ~= "" and arg_64_1.actors_[var_67_4.prefab_name] ~= nil then
						local var_67_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_64_1.actors_[var_67_4.prefab_name].transform, "story_v_out_106081", "106081016", "story_v_out_106081.awb")

						arg_64_1:RecordAudio("106081016", var_67_10)
						arg_64_1:RecordAudio("106081016", var_67_10)
					else
						arg_64_1:AudioAction("play", "voice", "story_v_out_106081", "106081016", "story_v_out_106081.awb")
					end

					arg_64_1:RecordHistoryTalkVoice("story_v_out_106081", "106081016", "story_v_out_106081.awb")
				end

				arg_64_1:RecordContent(arg_64_1.text_.text)
			end

			local var_67_11 = math.max(var_67_2, arg_64_1.talkMaxDuration)

			if var_67_1 <= arg_64_1.time_ and arg_64_1.time_ < var_67_1 + var_67_11 then
				arg_64_1.typewritter.percent = (arg_64_1.time_ - var_67_1) / var_67_11

				arg_64_1.typewritter:SetDirty()
			end

			if arg_64_1.time_ >= var_67_1 + var_67_11 and arg_64_1.time_ < var_67_1 + var_67_11 + arg_67_0 then
				arg_64_1.typewritter.percent = 1

				arg_64_1.typewritter:SetDirty()
				arg_64_1:ShowNextGo(true)
			end
		end
	end,
	Play106081017 = function(arg_68_0, arg_68_1)
		arg_68_1.time_ = 0
		arg_68_1.frameCnt_ = 0
		arg_68_1.state_ = "playing"
		arg_68_1.curTalkId_ = 106081017
		arg_68_1.duration_ = 10.3

		local var_68_0 = {
			ja = 10.3,
			ko = 5.333,
			zh = 5.4,
			en = 5.3
		}
		local var_68_1 = manager.audio:GetLocalizationFlag()

		if var_68_0[var_68_1] ~= nil then
			arg_68_1.duration_ = var_68_0[var_68_1]
		end

		SetActive(arg_68_1.tipsGo_, false)

		function arg_68_1.onSingleLineFinish_()
			arg_68_1.onSingleLineUpdate_ = nil
			arg_68_1.onSingleLineFinish_ = nil
			arg_68_1.state_ = "waiting"
		end

		function arg_68_1.playNext_(arg_70_0)
			if arg_70_0 == 1 then
				arg_68_0:Play106081018(arg_68_1)
			end
		end

		function arg_68_1.onSingleLineUpdate_(arg_71_0)
			local var_71_0 = 0

			if var_71_0 < arg_68_1.time_ and arg_68_1.time_ <= var_71_0 + arg_71_0 then
				arg_68_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_71_1 = 0
			local var_71_2 = 0.65

			if var_71_1 < arg_68_1.time_ and arg_68_1.time_ <= var_71_1 + arg_71_0 then
				arg_68_1.talkMaxDuration = 0
				arg_68_1.dialogCg_.alpha = 1

				arg_68_1.dialog_:SetActive(true)
				SetActive(arg_68_1.leftNameGo_, true)

				local var_71_3 = arg_68_1:FormatText(StoryNameCfg[80].name)

				arg_68_1.leftNameTxt_.text = var_71_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_68_1.leftNameTxt_.transform)

				arg_68_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_68_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_68_1:RecordName(arg_68_1.leftNameTxt_.text)
				SetActive(arg_68_1.iconTrs_.gameObject, false)
				arg_68_1.callingController_:SetSelectedState("normal")

				local var_71_4 = arg_68_1:GetWordFromCfg(106081017)
				local var_71_5 = arg_68_1:FormatText(var_71_4.content)

				arg_68_1.text_.text = var_71_5

				LuaForUtil.ClearLinePrefixSymbol(arg_68_1.text_)

				local var_71_6 = 26
				local var_71_7 = utf8.len(var_71_5)
				local var_71_8 = var_71_6 <= 0 and var_71_2 or var_71_2 * (var_71_7 / var_71_6)

				if var_71_8 > 0 and var_71_2 < var_71_8 then
					arg_68_1.talkMaxDuration = var_71_8

					if var_71_8 + var_71_1 > arg_68_1.duration_ then
						arg_68_1.duration_ = var_71_8 + var_71_1
					end
				end

				arg_68_1.text_.text = var_71_5
				arg_68_1.typewritter.percent = 0

				arg_68_1.typewritter:SetDirty()
				arg_68_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081017", "story_v_out_106081.awb") ~= 0 then
					local var_71_9 = manager.audio:GetVoiceLength("story_v_out_106081", "106081017", "story_v_out_106081.awb") / 1000

					if var_71_9 + var_71_1 > arg_68_1.duration_ then
						arg_68_1.duration_ = var_71_9 + var_71_1
					end

					if var_71_4.prefab_name ~= "" and arg_68_1.actors_[var_71_4.prefab_name] ~= nil then
						local var_71_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_68_1.actors_[var_71_4.prefab_name].transform, "story_v_out_106081", "106081017", "story_v_out_106081.awb")

						arg_68_1:RecordAudio("106081017", var_71_10)
						arg_68_1:RecordAudio("106081017", var_71_10)
					else
						arg_68_1:AudioAction("play", "voice", "story_v_out_106081", "106081017", "story_v_out_106081.awb")
					end

					arg_68_1:RecordHistoryTalkVoice("story_v_out_106081", "106081017", "story_v_out_106081.awb")
				end

				arg_68_1:RecordContent(arg_68_1.text_.text)
			end

			local var_71_11 = math.max(var_71_2, arg_68_1.talkMaxDuration)

			if var_71_1 <= arg_68_1.time_ and arg_68_1.time_ < var_71_1 + var_71_11 then
				arg_68_1.typewritter.percent = (arg_68_1.time_ - var_71_1) / var_71_11

				arg_68_1.typewritter:SetDirty()
			end

			if arg_68_1.time_ >= var_71_1 + var_71_11 and arg_68_1.time_ < var_71_1 + var_71_11 + arg_71_0 then
				arg_68_1.typewritter.percent = 1

				arg_68_1.typewritter:SetDirty()
				arg_68_1:ShowNextGo(true)
			end
		end
	end,
	Play106081018 = function(arg_72_0, arg_72_1)
		arg_72_1.time_ = 0
		arg_72_1.frameCnt_ = 0
		arg_72_1.state_ = "playing"
		arg_72_1.curTalkId_ = 106081018
		arg_72_1.duration_ = 14.07

		local var_72_0 = {
			ja = 14.066,
			ko = 8.866,
			zh = 12.966,
			en = 6.5
		}
		local var_72_1 = manager.audio:GetLocalizationFlag()

		if var_72_0[var_72_1] ~= nil then
			arg_72_1.duration_ = var_72_0[var_72_1]
		end

		SetActive(arg_72_1.tipsGo_, false)

		function arg_72_1.onSingleLineFinish_()
			arg_72_1.onSingleLineUpdate_ = nil
			arg_72_1.onSingleLineFinish_ = nil
			arg_72_1.state_ = "waiting"
		end

		function arg_72_1.playNext_(arg_74_0)
			if arg_74_0 == 1 then
				arg_72_0:Play106081019(arg_72_1)
			end
		end

		function arg_72_1.onSingleLineUpdate_(arg_75_0)
			local var_75_0 = 0

			if var_75_0 < arg_72_1.time_ and arg_72_1.time_ <= var_75_0 + arg_75_0 then
				arg_72_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004actionlink/10004action452")
			end

			local var_75_1 = 0

			if var_75_1 < arg_72_1.time_ and arg_72_1.time_ <= var_75_1 + arg_75_0 then
				arg_72_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_75_2 = 0
			local var_75_3 = 1

			if var_75_2 < arg_72_1.time_ and arg_72_1.time_ <= var_75_2 + arg_75_0 then
				arg_72_1.talkMaxDuration = 0
				arg_72_1.dialogCg_.alpha = 1

				arg_72_1.dialog_:SetActive(true)
				SetActive(arg_72_1.leftNameGo_, true)

				local var_75_4 = arg_72_1:FormatText(StoryNameCfg[80].name)

				arg_72_1.leftNameTxt_.text = var_75_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_72_1.leftNameTxt_.transform)

				arg_72_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_72_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_72_1:RecordName(arg_72_1.leftNameTxt_.text)
				SetActive(arg_72_1.iconTrs_.gameObject, false)
				arg_72_1.callingController_:SetSelectedState("normal")

				local var_75_5 = arg_72_1:GetWordFromCfg(106081018)
				local var_75_6 = arg_72_1:FormatText(var_75_5.content)

				arg_72_1.text_.text = var_75_6

				LuaForUtil.ClearLinePrefixSymbol(arg_72_1.text_)

				local var_75_7 = 40
				local var_75_8 = utf8.len(var_75_6)
				local var_75_9 = var_75_7 <= 0 and var_75_3 or var_75_3 * (var_75_8 / var_75_7)

				if var_75_9 > 0 and var_75_3 < var_75_9 then
					arg_72_1.talkMaxDuration = var_75_9

					if var_75_9 + var_75_2 > arg_72_1.duration_ then
						arg_72_1.duration_ = var_75_9 + var_75_2
					end
				end

				arg_72_1.text_.text = var_75_6
				arg_72_1.typewritter.percent = 0

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081018", "story_v_out_106081.awb") ~= 0 then
					local var_75_10 = manager.audio:GetVoiceLength("story_v_out_106081", "106081018", "story_v_out_106081.awb") / 1000

					if var_75_10 + var_75_2 > arg_72_1.duration_ then
						arg_72_1.duration_ = var_75_10 + var_75_2
					end

					if var_75_5.prefab_name ~= "" and arg_72_1.actors_[var_75_5.prefab_name] ~= nil then
						local var_75_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_72_1.actors_[var_75_5.prefab_name].transform, "story_v_out_106081", "106081018", "story_v_out_106081.awb")

						arg_72_1:RecordAudio("106081018", var_75_11)
						arg_72_1:RecordAudio("106081018", var_75_11)
					else
						arg_72_1:AudioAction("play", "voice", "story_v_out_106081", "106081018", "story_v_out_106081.awb")
					end

					arg_72_1:RecordHistoryTalkVoice("story_v_out_106081", "106081018", "story_v_out_106081.awb")
				end

				arg_72_1:RecordContent(arg_72_1.text_.text)
			end

			local var_75_12 = math.max(var_75_3, arg_72_1.talkMaxDuration)

			if var_75_2 <= arg_72_1.time_ and arg_72_1.time_ < var_75_2 + var_75_12 then
				arg_72_1.typewritter.percent = (arg_72_1.time_ - var_75_2) / var_75_12

				arg_72_1.typewritter:SetDirty()
			end

			if arg_72_1.time_ >= var_75_2 + var_75_12 and arg_72_1.time_ < var_75_2 + var_75_12 + arg_75_0 then
				arg_72_1.typewritter.percent = 1

				arg_72_1.typewritter:SetDirty()
				arg_72_1:ShowNextGo(true)
			end
		end
	end,
	Play106081019 = function(arg_76_0, arg_76_1)
		arg_76_1.time_ = 0
		arg_76_1.frameCnt_ = 0
		arg_76_1.state_ = "playing"
		arg_76_1.curTalkId_ = 106081019
		arg_76_1.duration_ = 11.77

		local var_76_0 = {
			ja = 10.766,
			ko = 9.733,
			zh = 9.8,
			en = 11.766
		}
		local var_76_1 = manager.audio:GetLocalizationFlag()

		if var_76_0[var_76_1] ~= nil then
			arg_76_1.duration_ = var_76_0[var_76_1]
		end

		SetActive(arg_76_1.tipsGo_, false)

		function arg_76_1.onSingleLineFinish_()
			arg_76_1.onSingleLineUpdate_ = nil
			arg_76_1.onSingleLineFinish_ = nil
			arg_76_1.state_ = "waiting"
		end

		function arg_76_1.playNext_(arg_78_0)
			if arg_78_0 == 1 then
				arg_76_0:Play106081020(arg_76_1)
			end
		end

		function arg_76_1.onSingleLineUpdate_(arg_79_0)
			local var_79_0 = arg_76_1.actors_["4014_tpose"]
			local var_79_1 = 0

			if var_79_1 < arg_76_1.time_ and arg_76_1.time_ <= var_79_1 + arg_79_0 and arg_76_1.var_.characterEffect4014_tpose == nil then
				arg_76_1.var_.characterEffect4014_tpose = var_79_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_79_2 = 0.2

			if var_79_1 <= arg_76_1.time_ and arg_76_1.time_ < var_79_1 + var_79_2 then
				local var_79_3 = (arg_76_1.time_ - var_79_1) / var_79_2

				if arg_76_1.var_.characterEffect4014_tpose then
					arg_76_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_76_1.time_ >= var_79_1 + var_79_2 and arg_76_1.time_ < var_79_1 + var_79_2 + arg_79_0 and arg_76_1.var_.characterEffect4014_tpose then
				arg_76_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_79_4 = arg_76_1.actors_["10004ui_story"]
			local var_79_5 = 0

			if var_79_5 < arg_76_1.time_ and arg_76_1.time_ <= var_79_5 + arg_79_0 and arg_76_1.var_.characterEffect10004ui_story == nil then
				arg_76_1.var_.characterEffect10004ui_story = var_79_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_79_6 = 0.2

			if var_79_5 <= arg_76_1.time_ and arg_76_1.time_ < var_79_5 + var_79_6 then
				local var_79_7 = (arg_76_1.time_ - var_79_5) / var_79_6

				if arg_76_1.var_.characterEffect10004ui_story then
					local var_79_8 = Mathf.Lerp(0, 0.5, var_79_7)

					arg_76_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_76_1.var_.characterEffect10004ui_story.fillRatio = var_79_8
				end
			end

			if arg_76_1.time_ >= var_79_5 + var_79_6 and arg_76_1.time_ < var_79_5 + var_79_6 + arg_79_0 and arg_76_1.var_.characterEffect10004ui_story then
				local var_79_9 = 0.5

				arg_76_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_76_1.var_.characterEffect10004ui_story.fillRatio = var_79_9
			end

			local var_79_10 = 0
			local var_79_11 = 1.025

			if var_79_10 < arg_76_1.time_ and arg_76_1.time_ <= var_79_10 + arg_79_0 then
				arg_76_1.talkMaxDuration = 0
				arg_76_1.dialogCg_.alpha = 1

				arg_76_1.dialog_:SetActive(true)
				SetActive(arg_76_1.leftNameGo_, true)

				local var_79_12 = arg_76_1:FormatText(StoryNameCfg[87].name)

				arg_76_1.leftNameTxt_.text = var_79_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_76_1.leftNameTxt_.transform)

				arg_76_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_76_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_76_1:RecordName(arg_76_1.leftNameTxt_.text)
				SetActive(arg_76_1.iconTrs_.gameObject, false)
				arg_76_1.callingController_:SetSelectedState("normal")

				local var_79_13 = arg_76_1:GetWordFromCfg(106081019)
				local var_79_14 = arg_76_1:FormatText(var_79_13.content)

				arg_76_1.text_.text = var_79_14

				LuaForUtil.ClearLinePrefixSymbol(arg_76_1.text_)

				local var_79_15 = 41
				local var_79_16 = utf8.len(var_79_14)
				local var_79_17 = var_79_15 <= 0 and var_79_11 or var_79_11 * (var_79_16 / var_79_15)

				if var_79_17 > 0 and var_79_11 < var_79_17 then
					arg_76_1.talkMaxDuration = var_79_17

					if var_79_17 + var_79_10 > arg_76_1.duration_ then
						arg_76_1.duration_ = var_79_17 + var_79_10
					end
				end

				arg_76_1.text_.text = var_79_14
				arg_76_1.typewritter.percent = 0

				arg_76_1.typewritter:SetDirty()
				arg_76_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081019", "story_v_out_106081.awb") ~= 0 then
					local var_79_18 = manager.audio:GetVoiceLength("story_v_out_106081", "106081019", "story_v_out_106081.awb") / 1000

					if var_79_18 + var_79_10 > arg_76_1.duration_ then
						arg_76_1.duration_ = var_79_18 + var_79_10
					end

					if var_79_13.prefab_name ~= "" and arg_76_1.actors_[var_79_13.prefab_name] ~= nil then
						local var_79_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_76_1.actors_[var_79_13.prefab_name].transform, "story_v_out_106081", "106081019", "story_v_out_106081.awb")

						arg_76_1:RecordAudio("106081019", var_79_19)
						arg_76_1:RecordAudio("106081019", var_79_19)
					else
						arg_76_1:AudioAction("play", "voice", "story_v_out_106081", "106081019", "story_v_out_106081.awb")
					end

					arg_76_1:RecordHistoryTalkVoice("story_v_out_106081", "106081019", "story_v_out_106081.awb")
				end

				arg_76_1:RecordContent(arg_76_1.text_.text)
			end

			local var_79_20 = math.max(var_79_11, arg_76_1.talkMaxDuration)

			if var_79_10 <= arg_76_1.time_ and arg_76_1.time_ < var_79_10 + var_79_20 then
				arg_76_1.typewritter.percent = (arg_76_1.time_ - var_79_10) / var_79_20

				arg_76_1.typewritter:SetDirty()
			end

			if arg_76_1.time_ >= var_79_10 + var_79_20 and arg_76_1.time_ < var_79_10 + var_79_20 + arg_79_0 then
				arg_76_1.typewritter.percent = 1

				arg_76_1.typewritter:SetDirty()
				arg_76_1:ShowNextGo(true)
			end
		end
	end,
	Play106081020 = function(arg_80_0, arg_80_1)
		arg_80_1.time_ = 0
		arg_80_1.frameCnt_ = 0
		arg_80_1.state_ = "playing"
		arg_80_1.curTalkId_ = 106081020
		arg_80_1.duration_ = 4.43

		local var_80_0 = {
			ja = 0.6,
			ko = 0.6,
			zh = 4.433,
			en = 0.833
		}
		local var_80_1 = manager.audio:GetLocalizationFlag()

		if var_80_0[var_80_1] ~= nil then
			arg_80_1.duration_ = var_80_0[var_80_1]
		end

		SetActive(arg_80_1.tipsGo_, false)

		function arg_80_1.onSingleLineFinish_()
			arg_80_1.onSingleLineUpdate_ = nil
			arg_80_1.onSingleLineFinish_ = nil
			arg_80_1.state_ = "waiting"
		end

		function arg_80_1.playNext_(arg_82_0)
			if arg_82_0 == 1 then
				arg_80_0:Play106081021(arg_80_1)
			end
		end

		function arg_80_1.onSingleLineUpdate_(arg_83_0)
			local var_83_0 = arg_80_1.actors_["4014_tpose"]
			local var_83_1 = 0

			if var_83_1 < arg_80_1.time_ and arg_80_1.time_ <= var_83_1 + arg_83_0 and arg_80_1.var_.characterEffect4014_tpose == nil then
				arg_80_1.var_.characterEffect4014_tpose = var_83_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_83_2 = 0.1

			if var_83_1 <= arg_80_1.time_ and arg_80_1.time_ < var_83_1 + var_83_2 then
				local var_83_3 = (arg_80_1.time_ - var_83_1) / var_83_2

				if arg_80_1.var_.characterEffect4014_tpose then
					local var_83_4 = Mathf.Lerp(0, 0.5, var_83_3)

					arg_80_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_80_1.var_.characterEffect4014_tpose.fillRatio = var_83_4
				end
			end

			if arg_80_1.time_ >= var_83_1 + var_83_2 and arg_80_1.time_ < var_83_1 + var_83_2 + arg_83_0 and arg_80_1.var_.characterEffect4014_tpose then
				local var_83_5 = 0.5

				arg_80_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_80_1.var_.characterEffect4014_tpose.fillRatio = var_83_5
			end

			local var_83_6 = arg_80_1.actors_["4014_tpose"].transform
			local var_83_7 = 0

			if var_83_7 < arg_80_1.time_ and arg_80_1.time_ <= var_83_7 + arg_83_0 then
				arg_80_1.var_.moveOldPos4014_tpose = var_83_6.localPosition
			end

			local var_83_8 = 0.001

			if var_83_7 <= arg_80_1.time_ and arg_80_1.time_ < var_83_7 + var_83_8 then
				local var_83_9 = (arg_80_1.time_ - var_83_7) / var_83_8
				local var_83_10 = Vector3.New(0, 100, 0)

				var_83_6.localPosition = Vector3.Lerp(arg_80_1.var_.moveOldPos4014_tpose, var_83_10, var_83_9)

				local var_83_11 = manager.ui.mainCamera.transform.position - var_83_6.position

				var_83_6.forward = Vector3.New(var_83_11.x, var_83_11.y, var_83_11.z)

				local var_83_12 = var_83_6.localEulerAngles

				var_83_12.z = 0
				var_83_12.x = 0
				var_83_6.localEulerAngles = var_83_12
			end

			if arg_80_1.time_ >= var_83_7 + var_83_8 and arg_80_1.time_ < var_83_7 + var_83_8 + arg_83_0 then
				var_83_6.localPosition = Vector3.New(0, 100, 0)

				local var_83_13 = manager.ui.mainCamera.transform.position - var_83_6.position

				var_83_6.forward = Vector3.New(var_83_13.x, var_83_13.y, var_83_13.z)

				local var_83_14 = var_83_6.localEulerAngles

				var_83_14.z = 0
				var_83_14.x = 0
				var_83_6.localEulerAngles = var_83_14
			end

			local var_83_15 = arg_80_1.actors_["10004ui_story"]
			local var_83_16 = 0

			if var_83_16 < arg_80_1.time_ and arg_80_1.time_ <= var_83_16 + arg_83_0 and arg_80_1.var_.characterEffect10004ui_story == nil then
				arg_80_1.var_.characterEffect10004ui_story = var_83_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_83_17 = 0.100000001490116

			if var_83_16 <= arg_80_1.time_ and arg_80_1.time_ < var_83_16 + var_83_17 then
				local var_83_18 = (arg_80_1.time_ - var_83_16) / var_83_17

				if arg_80_1.var_.characterEffect10004ui_story then
					arg_80_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_80_1.time_ >= var_83_16 + var_83_17 and arg_80_1.time_ < var_83_16 + var_83_17 + arg_83_0 and arg_80_1.var_.characterEffect10004ui_story then
				arg_80_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_83_19 = 0
			local var_83_20 = 0.05

			if var_83_19 < arg_80_1.time_ and arg_80_1.time_ <= var_83_19 + arg_83_0 then
				arg_80_1.talkMaxDuration = 0
				arg_80_1.dialogCg_.alpha = 1

				arg_80_1.dialog_:SetActive(true)
				SetActive(arg_80_1.leftNameGo_, true)

				local var_83_21 = arg_80_1:FormatText(StoryNameCfg[80].name)

				arg_80_1.leftNameTxt_.text = var_83_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_80_1.leftNameTxt_.transform)

				arg_80_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_80_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_80_1:RecordName(arg_80_1.leftNameTxt_.text)
				SetActive(arg_80_1.iconTrs_.gameObject, false)
				arg_80_1.callingController_:SetSelectedState("normal")

				local var_83_22 = arg_80_1:GetWordFromCfg(106081020)
				local var_83_23 = arg_80_1:FormatText(var_83_22.content)

				arg_80_1.text_.text = var_83_23

				LuaForUtil.ClearLinePrefixSymbol(arg_80_1.text_)

				local var_83_24 = 2
				local var_83_25 = utf8.len(var_83_23)
				local var_83_26 = var_83_24 <= 0 and var_83_20 or var_83_20 * (var_83_25 / var_83_24)

				if var_83_26 > 0 and var_83_20 < var_83_26 then
					arg_80_1.talkMaxDuration = var_83_26

					if var_83_26 + var_83_19 > arg_80_1.duration_ then
						arg_80_1.duration_ = var_83_26 + var_83_19
					end
				end

				arg_80_1.text_.text = var_83_23
				arg_80_1.typewritter.percent = 0

				arg_80_1.typewritter:SetDirty()
				arg_80_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081020", "story_v_out_106081.awb") ~= 0 then
					local var_83_27 = manager.audio:GetVoiceLength("story_v_out_106081", "106081020", "story_v_out_106081.awb") / 1000

					if var_83_27 + var_83_19 > arg_80_1.duration_ then
						arg_80_1.duration_ = var_83_27 + var_83_19
					end

					if var_83_22.prefab_name ~= "" and arg_80_1.actors_[var_83_22.prefab_name] ~= nil then
						local var_83_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_80_1.actors_[var_83_22.prefab_name].transform, "story_v_out_106081", "106081020", "story_v_out_106081.awb")

						arg_80_1:RecordAudio("106081020", var_83_28)
						arg_80_1:RecordAudio("106081020", var_83_28)
					else
						arg_80_1:AudioAction("play", "voice", "story_v_out_106081", "106081020", "story_v_out_106081.awb")
					end

					arg_80_1:RecordHistoryTalkVoice("story_v_out_106081", "106081020", "story_v_out_106081.awb")
				end

				arg_80_1:RecordContent(arg_80_1.text_.text)
			end

			local var_83_29 = math.max(var_83_20, arg_80_1.talkMaxDuration)

			if var_83_19 <= arg_80_1.time_ and arg_80_1.time_ < var_83_19 + var_83_29 then
				arg_80_1.typewritter.percent = (arg_80_1.time_ - var_83_19) / var_83_29

				arg_80_1.typewritter:SetDirty()
			end

			if arg_80_1.time_ >= var_83_19 + var_83_29 and arg_80_1.time_ < var_83_19 + var_83_29 + arg_83_0 then
				arg_80_1.typewritter.percent = 1

				arg_80_1.typewritter:SetDirty()
				arg_80_1:ShowNextGo(true)
			end
		end
	end,
	Play106081021 = function(arg_84_0, arg_84_1)
		arg_84_1.time_ = 0
		arg_84_1.frameCnt_ = 0
		arg_84_1.state_ = "playing"
		arg_84_1.curTalkId_ = 106081021
		arg_84_1.duration_ = 4.9

		local var_84_0 = {
			ja = 4.9,
			ko = 3.633,
			zh = 2.366,
			en = 2.266
		}
		local var_84_1 = manager.audio:GetLocalizationFlag()

		if var_84_0[var_84_1] ~= nil then
			arg_84_1.duration_ = var_84_0[var_84_1]
		end

		SetActive(arg_84_1.tipsGo_, false)

		function arg_84_1.onSingleLineFinish_()
			arg_84_1.onSingleLineUpdate_ = nil
			arg_84_1.onSingleLineFinish_ = nil
			arg_84_1.state_ = "waiting"
		end

		function arg_84_1.playNext_(arg_86_0)
			if arg_86_0 == 1 then
				arg_84_0:Play106081022(arg_84_1)
			end
		end

		function arg_84_1.onSingleLineUpdate_(arg_87_0)
			local var_87_0 = arg_84_1.actors_["10003ui_story"].transform
			local var_87_1 = 0

			if var_87_1 < arg_84_1.time_ and arg_84_1.time_ <= var_87_1 + arg_87_0 then
				arg_84_1.var_.moveOldPos10003ui_story = var_87_0.localPosition
			end

			local var_87_2 = 0.001

			if var_87_1 <= arg_84_1.time_ and arg_84_1.time_ < var_87_1 + var_87_2 then
				local var_87_3 = (arg_84_1.time_ - var_87_1) / var_87_2
				local var_87_4 = Vector3.New(0.7, -1.05, -5.9)

				var_87_0.localPosition = Vector3.Lerp(arg_84_1.var_.moveOldPos10003ui_story, var_87_4, var_87_3)

				local var_87_5 = manager.ui.mainCamera.transform.position - var_87_0.position

				var_87_0.forward = Vector3.New(var_87_5.x, var_87_5.y, var_87_5.z)

				local var_87_6 = var_87_0.localEulerAngles

				var_87_6.z = 0
				var_87_6.x = 0
				var_87_0.localEulerAngles = var_87_6
			end

			if arg_84_1.time_ >= var_87_1 + var_87_2 and arg_84_1.time_ < var_87_1 + var_87_2 + arg_87_0 then
				var_87_0.localPosition = Vector3.New(0.7, -1.05, -5.9)

				local var_87_7 = manager.ui.mainCamera.transform.position - var_87_0.position

				var_87_0.forward = Vector3.New(var_87_7.x, var_87_7.y, var_87_7.z)

				local var_87_8 = var_87_0.localEulerAngles

				var_87_8.z = 0
				var_87_8.x = 0
				var_87_0.localEulerAngles = var_87_8
			end

			local var_87_9 = arg_84_1.actors_["10004ui_story"]
			local var_87_10 = 0

			if var_87_10 < arg_84_1.time_ and arg_84_1.time_ <= var_87_10 + arg_87_0 and arg_84_1.var_.characterEffect10004ui_story == nil then
				arg_84_1.var_.characterEffect10004ui_story = var_87_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_87_11 = 0.2

			if var_87_10 <= arg_84_1.time_ and arg_84_1.time_ < var_87_10 + var_87_11 then
				local var_87_12 = (arg_84_1.time_ - var_87_10) / var_87_11

				if arg_84_1.var_.characterEffect10004ui_story then
					local var_87_13 = Mathf.Lerp(0, 0.5, var_87_12)

					arg_84_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_84_1.var_.characterEffect10004ui_story.fillRatio = var_87_13
				end
			end

			if arg_84_1.time_ >= var_87_10 + var_87_11 and arg_84_1.time_ < var_87_10 + var_87_11 + arg_87_0 and arg_84_1.var_.characterEffect10004ui_story then
				local var_87_14 = 0.5

				arg_84_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_84_1.var_.characterEffect10004ui_story.fillRatio = var_87_14
			end

			local var_87_15 = arg_84_1.actors_["10003ui_story"]
			local var_87_16 = 0

			if var_87_16 < arg_84_1.time_ and arg_84_1.time_ <= var_87_16 + arg_87_0 and arg_84_1.var_.characterEffect10003ui_story == nil then
				arg_84_1.var_.characterEffect10003ui_story = var_87_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_87_17 = 0.2

			if var_87_16 <= arg_84_1.time_ and arg_84_1.time_ < var_87_16 + var_87_17 then
				local var_87_18 = (arg_84_1.time_ - var_87_16) / var_87_17

				if arg_84_1.var_.characterEffect10003ui_story then
					arg_84_1.var_.characterEffect10003ui_story.fillFlat = false
				end
			end

			if arg_84_1.time_ >= var_87_16 + var_87_17 and arg_84_1.time_ < var_87_16 + var_87_17 + arg_87_0 and arg_84_1.var_.characterEffect10003ui_story then
				arg_84_1.var_.characterEffect10003ui_story.fillFlat = false
			end

			local var_87_19 = 0

			if var_87_19 < arg_84_1.time_ and arg_84_1.time_ <= var_87_19 + arg_87_0 then
				arg_84_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_87_20 = 0

			if var_87_20 < arg_84_1.time_ and arg_84_1.time_ <= var_87_20 + arg_87_0 then
				arg_84_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/story10003/story10003action/10003action1_1")
			end

			local var_87_21 = 0
			local var_87_22 = 0.3

			if var_87_21 < arg_84_1.time_ and arg_84_1.time_ <= var_87_21 + arg_87_0 then
				arg_84_1.talkMaxDuration = 0
				arg_84_1.dialogCg_.alpha = 1

				arg_84_1.dialog_:SetActive(true)
				SetActive(arg_84_1.leftNameGo_, true)

				local var_87_23 = arg_84_1:FormatText(StoryNameCfg[81].name)

				arg_84_1.leftNameTxt_.text = var_87_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_84_1.leftNameTxt_.transform)

				arg_84_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_84_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_84_1:RecordName(arg_84_1.leftNameTxt_.text)
				SetActive(arg_84_1.iconTrs_.gameObject, false)
				arg_84_1.callingController_:SetSelectedState("normal")

				local var_87_24 = arg_84_1:GetWordFromCfg(106081021)
				local var_87_25 = arg_84_1:FormatText(var_87_24.content)

				arg_84_1.text_.text = var_87_25

				LuaForUtil.ClearLinePrefixSymbol(arg_84_1.text_)

				local var_87_26 = 12
				local var_87_27 = utf8.len(var_87_25)
				local var_87_28 = var_87_26 <= 0 and var_87_22 or var_87_22 * (var_87_27 / var_87_26)

				if var_87_28 > 0 and var_87_22 < var_87_28 then
					arg_84_1.talkMaxDuration = var_87_28

					if var_87_28 + var_87_21 > arg_84_1.duration_ then
						arg_84_1.duration_ = var_87_28 + var_87_21
					end
				end

				arg_84_1.text_.text = var_87_25
				arg_84_1.typewritter.percent = 0

				arg_84_1.typewritter:SetDirty()
				arg_84_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081021", "story_v_out_106081.awb") ~= 0 then
					local var_87_29 = manager.audio:GetVoiceLength("story_v_out_106081", "106081021", "story_v_out_106081.awb") / 1000

					if var_87_29 + var_87_21 > arg_84_1.duration_ then
						arg_84_1.duration_ = var_87_29 + var_87_21
					end

					if var_87_24.prefab_name ~= "" and arg_84_1.actors_[var_87_24.prefab_name] ~= nil then
						local var_87_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_84_1.actors_[var_87_24.prefab_name].transform, "story_v_out_106081", "106081021", "story_v_out_106081.awb")

						arg_84_1:RecordAudio("106081021", var_87_30)
						arg_84_1:RecordAudio("106081021", var_87_30)
					else
						arg_84_1:AudioAction("play", "voice", "story_v_out_106081", "106081021", "story_v_out_106081.awb")
					end

					arg_84_1:RecordHistoryTalkVoice("story_v_out_106081", "106081021", "story_v_out_106081.awb")
				end

				arg_84_1:RecordContent(arg_84_1.text_.text)
			end

			local var_87_31 = math.max(var_87_22, arg_84_1.talkMaxDuration)

			if var_87_21 <= arg_84_1.time_ and arg_84_1.time_ < var_87_21 + var_87_31 then
				arg_84_1.typewritter.percent = (arg_84_1.time_ - var_87_21) / var_87_31

				arg_84_1.typewritter:SetDirty()
			end

			if arg_84_1.time_ >= var_87_21 + var_87_31 and arg_84_1.time_ < var_87_21 + var_87_31 + arg_87_0 then
				arg_84_1.typewritter.percent = 1

				arg_84_1.typewritter:SetDirty()
				arg_84_1:ShowNextGo(true)
			end
		end
	end,
	Play106081022 = function(arg_88_0, arg_88_1)
		arg_88_1.time_ = 0
		arg_88_1.frameCnt_ = 0
		arg_88_1.state_ = "playing"
		arg_88_1.curTalkId_ = 106081022
		arg_88_1.duration_ = 15.2

		local var_88_0 = {
			ja = 10.666,
			ko = 9.2,
			zh = 15.2,
			en = 13.633
		}
		local var_88_1 = manager.audio:GetLocalizationFlag()

		if var_88_0[var_88_1] ~= nil then
			arg_88_1.duration_ = var_88_0[var_88_1]
		end

		SetActive(arg_88_1.tipsGo_, false)

		function arg_88_1.onSingleLineFinish_()
			arg_88_1.onSingleLineUpdate_ = nil
			arg_88_1.onSingleLineFinish_ = nil
			arg_88_1.state_ = "waiting"
		end

		function arg_88_1.playNext_(arg_90_0)
			if arg_90_0 == 1 then
				arg_88_0:Play106081023(arg_88_1)
			end
		end

		function arg_88_1.onSingleLineUpdate_(arg_91_0)
			local var_91_0 = arg_88_1.actors_["10004ui_story"]
			local var_91_1 = 0

			if var_91_1 < arg_88_1.time_ and arg_88_1.time_ <= var_91_1 + arg_91_0 and arg_88_1.var_.characterEffect10004ui_story == nil then
				arg_88_1.var_.characterEffect10004ui_story = var_91_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_91_2 = 0.2

			if var_91_1 <= arg_88_1.time_ and arg_88_1.time_ < var_91_1 + var_91_2 then
				local var_91_3 = (arg_88_1.time_ - var_91_1) / var_91_2

				if arg_88_1.var_.characterEffect10004ui_story then
					arg_88_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_88_1.time_ >= var_91_1 + var_91_2 and arg_88_1.time_ < var_91_1 + var_91_2 + arg_91_0 and arg_88_1.var_.characterEffect10004ui_story then
				arg_88_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_91_4 = arg_88_1.actors_["10003ui_story"]
			local var_91_5 = 0

			if var_91_5 < arg_88_1.time_ and arg_88_1.time_ <= var_91_5 + arg_91_0 and arg_88_1.var_.characterEffect10003ui_story == nil then
				arg_88_1.var_.characterEffect10003ui_story = var_91_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_91_6 = 0.2

			if var_91_5 <= arg_88_1.time_ and arg_88_1.time_ < var_91_5 + var_91_6 then
				local var_91_7 = (arg_88_1.time_ - var_91_5) / var_91_6

				if arg_88_1.var_.characterEffect10003ui_story then
					local var_91_8 = Mathf.Lerp(0, 0.5, var_91_7)

					arg_88_1.var_.characterEffect10003ui_story.fillFlat = true
					arg_88_1.var_.characterEffect10003ui_story.fillRatio = var_91_8
				end
			end

			if arg_88_1.time_ >= var_91_5 + var_91_6 and arg_88_1.time_ < var_91_5 + var_91_6 + arg_91_0 and arg_88_1.var_.characterEffect10003ui_story then
				local var_91_9 = 0.5

				arg_88_1.var_.characterEffect10003ui_story.fillFlat = true
				arg_88_1.var_.characterEffect10003ui_story.fillRatio = var_91_9
			end

			local var_91_10 = 0

			if var_91_10 < arg_88_1.time_ and arg_88_1.time_ <= var_91_10 + arg_91_0 then
				arg_88_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004actionlink/10004action425")
			end

			local var_91_11 = 0

			if var_91_11 < arg_88_1.time_ and arg_88_1.time_ <= var_91_11 + arg_91_0 then
				arg_88_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_91_12 = 0
			local var_91_13 = 1.1

			if var_91_12 < arg_88_1.time_ and arg_88_1.time_ <= var_91_12 + arg_91_0 then
				arg_88_1.talkMaxDuration = 0
				arg_88_1.dialogCg_.alpha = 1

				arg_88_1.dialog_:SetActive(true)
				SetActive(arg_88_1.leftNameGo_, true)

				local var_91_14 = arg_88_1:FormatText(StoryNameCfg[80].name)

				arg_88_1.leftNameTxt_.text = var_91_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_88_1.leftNameTxt_.transform)

				arg_88_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_88_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_88_1:RecordName(arg_88_1.leftNameTxt_.text)
				SetActive(arg_88_1.iconTrs_.gameObject, false)
				arg_88_1.callingController_:SetSelectedState("normal")

				local var_91_15 = arg_88_1:GetWordFromCfg(106081022)
				local var_91_16 = arg_88_1:FormatText(var_91_15.content)

				arg_88_1.text_.text = var_91_16

				LuaForUtil.ClearLinePrefixSymbol(arg_88_1.text_)

				local var_91_17 = 49
				local var_91_18 = utf8.len(var_91_16)
				local var_91_19 = var_91_17 <= 0 and var_91_13 or var_91_13 * (var_91_18 / var_91_17)

				if var_91_19 > 0 and var_91_13 < var_91_19 then
					arg_88_1.talkMaxDuration = var_91_19

					if var_91_19 + var_91_12 > arg_88_1.duration_ then
						arg_88_1.duration_ = var_91_19 + var_91_12
					end
				end

				arg_88_1.text_.text = var_91_16
				arg_88_1.typewritter.percent = 0

				arg_88_1.typewritter:SetDirty()
				arg_88_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081022", "story_v_out_106081.awb") ~= 0 then
					local var_91_20 = manager.audio:GetVoiceLength("story_v_out_106081", "106081022", "story_v_out_106081.awb") / 1000

					if var_91_20 + var_91_12 > arg_88_1.duration_ then
						arg_88_1.duration_ = var_91_20 + var_91_12
					end

					if var_91_15.prefab_name ~= "" and arg_88_1.actors_[var_91_15.prefab_name] ~= nil then
						local var_91_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_88_1.actors_[var_91_15.prefab_name].transform, "story_v_out_106081", "106081022", "story_v_out_106081.awb")

						arg_88_1:RecordAudio("106081022", var_91_21)
						arg_88_1:RecordAudio("106081022", var_91_21)
					else
						arg_88_1:AudioAction("play", "voice", "story_v_out_106081", "106081022", "story_v_out_106081.awb")
					end

					arg_88_1:RecordHistoryTalkVoice("story_v_out_106081", "106081022", "story_v_out_106081.awb")
				end

				arg_88_1:RecordContent(arg_88_1.text_.text)
			end

			local var_91_22 = math.max(var_91_13, arg_88_1.talkMaxDuration)

			if var_91_12 <= arg_88_1.time_ and arg_88_1.time_ < var_91_12 + var_91_22 then
				arg_88_1.typewritter.percent = (arg_88_1.time_ - var_91_12) / var_91_22

				arg_88_1.typewritter:SetDirty()
			end

			if arg_88_1.time_ >= var_91_12 + var_91_22 and arg_88_1.time_ < var_91_12 + var_91_22 + arg_91_0 then
				arg_88_1.typewritter.percent = 1

				arg_88_1.typewritter:SetDirty()
				arg_88_1:ShowNextGo(true)
			end
		end
	end,
	Play106081023 = function(arg_92_0, arg_92_1)
		arg_92_1.time_ = 0
		arg_92_1.frameCnt_ = 0
		arg_92_1.state_ = "playing"
		arg_92_1.curTalkId_ = 106081023
		arg_92_1.duration_ = 7.8

		local var_92_0 = {
			ja = 5.566,
			ko = 5.966,
			zh = 7.8,
			en = 7.433
		}
		local var_92_1 = manager.audio:GetLocalizationFlag()

		if var_92_0[var_92_1] ~= nil then
			arg_92_1.duration_ = var_92_0[var_92_1]
		end

		SetActive(arg_92_1.tipsGo_, false)

		function arg_92_1.onSingleLineFinish_()
			arg_92_1.onSingleLineUpdate_ = nil
			arg_92_1.onSingleLineFinish_ = nil
			arg_92_1.state_ = "waiting"
		end

		function arg_92_1.playNext_(arg_94_0)
			if arg_94_0 == 1 then
				arg_92_0:Play106081024(arg_92_1)
			end
		end

		function arg_92_1.onSingleLineUpdate_(arg_95_0)
			local var_95_0 = 0

			if var_95_0 < arg_92_1.time_ and arg_92_1.time_ <= var_95_0 + arg_95_0 then
				arg_92_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_95_1 = 0
			local var_95_2 = 0.725

			if var_95_1 < arg_92_1.time_ and arg_92_1.time_ <= var_95_1 + arg_95_0 then
				arg_92_1.talkMaxDuration = 0
				arg_92_1.dialogCg_.alpha = 1

				arg_92_1.dialog_:SetActive(true)
				SetActive(arg_92_1.leftNameGo_, true)

				local var_95_3 = arg_92_1:FormatText(StoryNameCfg[80].name)

				arg_92_1.leftNameTxt_.text = var_95_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_92_1.leftNameTxt_.transform)

				arg_92_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_92_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_92_1:RecordName(arg_92_1.leftNameTxt_.text)
				SetActive(arg_92_1.iconTrs_.gameObject, false)
				arg_92_1.callingController_:SetSelectedState("normal")

				local var_95_4 = arg_92_1:GetWordFromCfg(106081023)
				local var_95_5 = arg_92_1:FormatText(var_95_4.content)

				arg_92_1.text_.text = var_95_5

				LuaForUtil.ClearLinePrefixSymbol(arg_92_1.text_)

				local var_95_6 = 29
				local var_95_7 = utf8.len(var_95_5)
				local var_95_8 = var_95_6 <= 0 and var_95_2 or var_95_2 * (var_95_7 / var_95_6)

				if var_95_8 > 0 and var_95_2 < var_95_8 then
					arg_92_1.talkMaxDuration = var_95_8

					if var_95_8 + var_95_1 > arg_92_1.duration_ then
						arg_92_1.duration_ = var_95_8 + var_95_1
					end
				end

				arg_92_1.text_.text = var_95_5
				arg_92_1.typewritter.percent = 0

				arg_92_1.typewritter:SetDirty()
				arg_92_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081023", "story_v_out_106081.awb") ~= 0 then
					local var_95_9 = manager.audio:GetVoiceLength("story_v_out_106081", "106081023", "story_v_out_106081.awb") / 1000

					if var_95_9 + var_95_1 > arg_92_1.duration_ then
						arg_92_1.duration_ = var_95_9 + var_95_1
					end

					if var_95_4.prefab_name ~= "" and arg_92_1.actors_[var_95_4.prefab_name] ~= nil then
						local var_95_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_92_1.actors_[var_95_4.prefab_name].transform, "story_v_out_106081", "106081023", "story_v_out_106081.awb")

						arg_92_1:RecordAudio("106081023", var_95_10)
						arg_92_1:RecordAudio("106081023", var_95_10)
					else
						arg_92_1:AudioAction("play", "voice", "story_v_out_106081", "106081023", "story_v_out_106081.awb")
					end

					arg_92_1:RecordHistoryTalkVoice("story_v_out_106081", "106081023", "story_v_out_106081.awb")
				end

				arg_92_1:RecordContent(arg_92_1.text_.text)
			end

			local var_95_11 = math.max(var_95_2, arg_92_1.talkMaxDuration)

			if var_95_1 <= arg_92_1.time_ and arg_92_1.time_ < var_95_1 + var_95_11 then
				arg_92_1.typewritter.percent = (arg_92_1.time_ - var_95_1) / var_95_11

				arg_92_1.typewritter:SetDirty()
			end

			if arg_92_1.time_ >= var_95_1 + var_95_11 and arg_92_1.time_ < var_95_1 + var_95_11 + arg_95_0 then
				arg_92_1.typewritter.percent = 1

				arg_92_1.typewritter:SetDirty()
				arg_92_1:ShowNextGo(true)
			end
		end
	end,
	Play106081024 = function(arg_96_0, arg_96_1)
		arg_96_1.time_ = 0
		arg_96_1.frameCnt_ = 0
		arg_96_1.state_ = "playing"
		arg_96_1.curTalkId_ = 106081024
		arg_96_1.duration_ = 8.77

		local var_96_0 = {
			ja = 6.166,
			ko = 7.1,
			zh = 6.3,
			en = 8.766
		}
		local var_96_1 = manager.audio:GetLocalizationFlag()

		if var_96_0[var_96_1] ~= nil then
			arg_96_1.duration_ = var_96_0[var_96_1]
		end

		SetActive(arg_96_1.tipsGo_, false)

		function arg_96_1.onSingleLineFinish_()
			arg_96_1.onSingleLineUpdate_ = nil
			arg_96_1.onSingleLineFinish_ = nil
			arg_96_1.state_ = "waiting"
		end

		function arg_96_1.playNext_(arg_98_0)
			if arg_98_0 == 1 then
				arg_96_0:Play106081025(arg_96_1)
			end
		end

		function arg_96_1.onSingleLineUpdate_(arg_99_0)
			local var_99_0 = arg_96_1.actors_["10004ui_story"]
			local var_99_1 = 0

			if var_99_1 < arg_96_1.time_ and arg_96_1.time_ <= var_99_1 + arg_99_0 and arg_96_1.var_.characterEffect10004ui_story == nil then
				arg_96_1.var_.characterEffect10004ui_story = var_99_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_99_2 = 0.2

			if var_99_1 <= arg_96_1.time_ and arg_96_1.time_ < var_99_1 + var_99_2 then
				local var_99_3 = (arg_96_1.time_ - var_99_1) / var_99_2

				if arg_96_1.var_.characterEffect10004ui_story then
					local var_99_4 = Mathf.Lerp(0, 0.5, var_99_3)

					arg_96_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_96_1.var_.characterEffect10004ui_story.fillRatio = var_99_4
				end
			end

			if arg_96_1.time_ >= var_99_1 + var_99_2 and arg_96_1.time_ < var_99_1 + var_99_2 + arg_99_0 and arg_96_1.var_.characterEffect10004ui_story then
				local var_99_5 = 0.5

				arg_96_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_96_1.var_.characterEffect10004ui_story.fillRatio = var_99_5
			end

			local var_99_6 = arg_96_1.actors_["10003ui_story"]
			local var_99_7 = 0

			if var_99_7 < arg_96_1.time_ and arg_96_1.time_ <= var_99_7 + arg_99_0 and arg_96_1.var_.characterEffect10003ui_story == nil then
				arg_96_1.var_.characterEffect10003ui_story = var_99_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_99_8 = 0.2

			if var_99_7 <= arg_96_1.time_ and arg_96_1.time_ < var_99_7 + var_99_8 then
				local var_99_9 = (arg_96_1.time_ - var_99_7) / var_99_8

				if arg_96_1.var_.characterEffect10003ui_story then
					arg_96_1.var_.characterEffect10003ui_story.fillFlat = false
				end
			end

			if arg_96_1.time_ >= var_99_7 + var_99_8 and arg_96_1.time_ < var_99_7 + var_99_8 + arg_99_0 and arg_96_1.var_.characterEffect10003ui_story then
				arg_96_1.var_.characterEffect10003ui_story.fillFlat = false
			end

			local var_99_10 = 0

			if var_99_10 < arg_96_1.time_ and arg_96_1.time_ <= var_99_10 + arg_99_0 then
				arg_96_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_99_11 = 0
			local var_99_12 = 0.65

			if var_99_11 < arg_96_1.time_ and arg_96_1.time_ <= var_99_11 + arg_99_0 then
				arg_96_1.talkMaxDuration = 0
				arg_96_1.dialogCg_.alpha = 1

				arg_96_1.dialog_:SetActive(true)
				SetActive(arg_96_1.leftNameGo_, true)

				local var_99_13 = arg_96_1:FormatText(StoryNameCfg[81].name)

				arg_96_1.leftNameTxt_.text = var_99_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_96_1.leftNameTxt_.transform)

				arg_96_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_96_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_96_1:RecordName(arg_96_1.leftNameTxt_.text)
				SetActive(arg_96_1.iconTrs_.gameObject, false)
				arg_96_1.callingController_:SetSelectedState("normal")

				local var_99_14 = arg_96_1:GetWordFromCfg(106081024)
				local var_99_15 = arg_96_1:FormatText(var_99_14.content)

				arg_96_1.text_.text = var_99_15

				LuaForUtil.ClearLinePrefixSymbol(arg_96_1.text_)

				local var_99_16 = 26
				local var_99_17 = utf8.len(var_99_15)
				local var_99_18 = var_99_16 <= 0 and var_99_12 or var_99_12 * (var_99_17 / var_99_16)

				if var_99_18 > 0 and var_99_12 < var_99_18 then
					arg_96_1.talkMaxDuration = var_99_18

					if var_99_18 + var_99_11 > arg_96_1.duration_ then
						arg_96_1.duration_ = var_99_18 + var_99_11
					end
				end

				arg_96_1.text_.text = var_99_15
				arg_96_1.typewritter.percent = 0

				arg_96_1.typewritter:SetDirty()
				arg_96_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081024", "story_v_out_106081.awb") ~= 0 then
					local var_99_19 = manager.audio:GetVoiceLength("story_v_out_106081", "106081024", "story_v_out_106081.awb") / 1000

					if var_99_19 + var_99_11 > arg_96_1.duration_ then
						arg_96_1.duration_ = var_99_19 + var_99_11
					end

					if var_99_14.prefab_name ~= "" and arg_96_1.actors_[var_99_14.prefab_name] ~= nil then
						local var_99_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_96_1.actors_[var_99_14.prefab_name].transform, "story_v_out_106081", "106081024", "story_v_out_106081.awb")

						arg_96_1:RecordAudio("106081024", var_99_20)
						arg_96_1:RecordAudio("106081024", var_99_20)
					else
						arg_96_1:AudioAction("play", "voice", "story_v_out_106081", "106081024", "story_v_out_106081.awb")
					end

					arg_96_1:RecordHistoryTalkVoice("story_v_out_106081", "106081024", "story_v_out_106081.awb")
				end

				arg_96_1:RecordContent(arg_96_1.text_.text)
			end

			local var_99_21 = math.max(var_99_12, arg_96_1.talkMaxDuration)

			if var_99_11 <= arg_96_1.time_ and arg_96_1.time_ < var_99_11 + var_99_21 then
				arg_96_1.typewritter.percent = (arg_96_1.time_ - var_99_11) / var_99_21

				arg_96_1.typewritter:SetDirty()
			end

			if arg_96_1.time_ >= var_99_11 + var_99_21 and arg_96_1.time_ < var_99_11 + var_99_21 + arg_99_0 then
				arg_96_1.typewritter.percent = 1

				arg_96_1.typewritter:SetDirty()
				arg_96_1:ShowNextGo(true)
			end
		end
	end,
	Play106081025 = function(arg_100_0, arg_100_1)
		arg_100_1.time_ = 0
		arg_100_1.frameCnt_ = 0
		arg_100_1.state_ = "playing"
		arg_100_1.curTalkId_ = 106081025
		arg_100_1.duration_ = 7.93

		local var_100_0 = {
			ja = 7.933,
			ko = 5.733,
			zh = 5.4,
			en = 5.433
		}
		local var_100_1 = manager.audio:GetLocalizationFlag()

		if var_100_0[var_100_1] ~= nil then
			arg_100_1.duration_ = var_100_0[var_100_1]
		end

		SetActive(arg_100_1.tipsGo_, false)

		function arg_100_1.onSingleLineFinish_()
			arg_100_1.onSingleLineUpdate_ = nil
			arg_100_1.onSingleLineFinish_ = nil
			arg_100_1.state_ = "waiting"
		end

		function arg_100_1.playNext_(arg_102_0)
			if arg_102_0 == 1 then
				arg_100_0:Play106081026(arg_100_1)
			end
		end

		function arg_100_1.onSingleLineUpdate_(arg_103_0)
			local var_103_0 = 0

			if var_103_0 < arg_100_1.time_ and arg_100_1.time_ <= var_103_0 + arg_103_0 then
				arg_100_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004actionlink/10004action454")
			end

			local var_103_1 = arg_100_1.actors_["10004ui_story"]
			local var_103_2 = 0

			if var_103_2 < arg_100_1.time_ and arg_100_1.time_ <= var_103_2 + arg_103_0 and arg_100_1.var_.characterEffect10004ui_story == nil then
				arg_100_1.var_.characterEffect10004ui_story = var_103_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_103_3 = 0.2

			if var_103_2 <= arg_100_1.time_ and arg_100_1.time_ < var_103_2 + var_103_3 then
				local var_103_4 = (arg_100_1.time_ - var_103_2) / var_103_3

				if arg_100_1.var_.characterEffect10004ui_story then
					arg_100_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_100_1.time_ >= var_103_2 + var_103_3 and arg_100_1.time_ < var_103_2 + var_103_3 + arg_103_0 and arg_100_1.var_.characterEffect10004ui_story then
				arg_100_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_103_5 = arg_100_1.actors_["10003ui_story"]
			local var_103_6 = 0

			if var_103_6 < arg_100_1.time_ and arg_100_1.time_ <= var_103_6 + arg_103_0 and arg_100_1.var_.characterEffect10003ui_story == nil then
				arg_100_1.var_.characterEffect10003ui_story = var_103_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_103_7 = 0.2

			if var_103_6 <= arg_100_1.time_ and arg_100_1.time_ < var_103_6 + var_103_7 then
				local var_103_8 = (arg_100_1.time_ - var_103_6) / var_103_7

				if arg_100_1.var_.characterEffect10003ui_story then
					local var_103_9 = Mathf.Lerp(0, 0.5, var_103_8)

					arg_100_1.var_.characterEffect10003ui_story.fillFlat = true
					arg_100_1.var_.characterEffect10003ui_story.fillRatio = var_103_9
				end
			end

			if arg_100_1.time_ >= var_103_6 + var_103_7 and arg_100_1.time_ < var_103_6 + var_103_7 + arg_103_0 and arg_100_1.var_.characterEffect10003ui_story then
				local var_103_10 = 0.5

				arg_100_1.var_.characterEffect10003ui_story.fillFlat = true
				arg_100_1.var_.characterEffect10003ui_story.fillRatio = var_103_10
			end

			local var_103_11 = 0

			if var_103_11 < arg_100_1.time_ and arg_100_1.time_ <= var_103_11 + arg_103_0 then
				arg_100_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_103_12 = 0
			local var_103_13 = 0.675

			if var_103_12 < arg_100_1.time_ and arg_100_1.time_ <= var_103_12 + arg_103_0 then
				arg_100_1.talkMaxDuration = 0
				arg_100_1.dialogCg_.alpha = 1

				arg_100_1.dialog_:SetActive(true)
				SetActive(arg_100_1.leftNameGo_, true)

				local var_103_14 = arg_100_1:FormatText(StoryNameCfg[80].name)

				arg_100_1.leftNameTxt_.text = var_103_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_100_1.leftNameTxt_.transform)

				arg_100_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_100_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_100_1:RecordName(arg_100_1.leftNameTxt_.text)
				SetActive(arg_100_1.iconTrs_.gameObject, false)
				arg_100_1.callingController_:SetSelectedState("normal")

				local var_103_15 = arg_100_1:GetWordFromCfg(106081025)
				local var_103_16 = arg_100_1:FormatText(var_103_15.content)

				arg_100_1.text_.text = var_103_16

				LuaForUtil.ClearLinePrefixSymbol(arg_100_1.text_)

				local var_103_17 = 27
				local var_103_18 = utf8.len(var_103_16)
				local var_103_19 = var_103_17 <= 0 and var_103_13 or var_103_13 * (var_103_18 / var_103_17)

				if var_103_19 > 0 and var_103_13 < var_103_19 then
					arg_100_1.talkMaxDuration = var_103_19

					if var_103_19 + var_103_12 > arg_100_1.duration_ then
						arg_100_1.duration_ = var_103_19 + var_103_12
					end
				end

				arg_100_1.text_.text = var_103_16
				arg_100_1.typewritter.percent = 0

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081025", "story_v_out_106081.awb") ~= 0 then
					local var_103_20 = manager.audio:GetVoiceLength("story_v_out_106081", "106081025", "story_v_out_106081.awb") / 1000

					if var_103_20 + var_103_12 > arg_100_1.duration_ then
						arg_100_1.duration_ = var_103_20 + var_103_12
					end

					if var_103_15.prefab_name ~= "" and arg_100_1.actors_[var_103_15.prefab_name] ~= nil then
						local var_103_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_100_1.actors_[var_103_15.prefab_name].transform, "story_v_out_106081", "106081025", "story_v_out_106081.awb")

						arg_100_1:RecordAudio("106081025", var_103_21)
						arg_100_1:RecordAudio("106081025", var_103_21)
					else
						arg_100_1:AudioAction("play", "voice", "story_v_out_106081", "106081025", "story_v_out_106081.awb")
					end

					arg_100_1:RecordHistoryTalkVoice("story_v_out_106081", "106081025", "story_v_out_106081.awb")
				end

				arg_100_1:RecordContent(arg_100_1.text_.text)
			end

			local var_103_22 = math.max(var_103_13, arg_100_1.talkMaxDuration)

			if var_103_12 <= arg_100_1.time_ and arg_100_1.time_ < var_103_12 + var_103_22 then
				arg_100_1.typewritter.percent = (arg_100_1.time_ - var_103_12) / var_103_22

				arg_100_1.typewritter:SetDirty()
			end

			if arg_100_1.time_ >= var_103_12 + var_103_22 and arg_100_1.time_ < var_103_12 + var_103_22 + arg_103_0 then
				arg_100_1.typewritter.percent = 1

				arg_100_1.typewritter:SetDirty()
				arg_100_1:ShowNextGo(true)
			end
		end
	end,
	Play106081026 = function(arg_104_0, arg_104_1)
		arg_104_1.time_ = 0
		arg_104_1.frameCnt_ = 0
		arg_104_1.state_ = "playing"
		arg_104_1.curTalkId_ = 106081026
		arg_104_1.duration_ = 5

		SetActive(arg_104_1.tipsGo_, false)

		function arg_104_1.onSingleLineFinish_()
			arg_104_1.onSingleLineUpdate_ = nil
			arg_104_1.onSingleLineFinish_ = nil
			arg_104_1.state_ = "waiting"
		end

		function arg_104_1.playNext_(arg_106_0)
			if arg_106_0 == 1 then
				arg_104_0:Play106081027(arg_104_1)
			end
		end

		function arg_104_1.onSingleLineUpdate_(arg_107_0)
			local var_107_0 = 0

			if var_107_0 < arg_104_1.time_ and arg_104_1.time_ <= var_107_0 + arg_107_0 then
				arg_104_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action4_2")
			end

			local var_107_1 = arg_104_1.actors_["10004ui_story"]
			local var_107_2 = 0

			if var_107_2 < arg_104_1.time_ and arg_104_1.time_ <= var_107_2 + arg_107_0 and arg_104_1.var_.characterEffect10004ui_story == nil then
				arg_104_1.var_.characterEffect10004ui_story = var_107_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_107_3 = 0.2

			if var_107_2 <= arg_104_1.time_ and arg_104_1.time_ < var_107_2 + var_107_3 then
				local var_107_4 = (arg_104_1.time_ - var_107_2) / var_107_3

				if arg_104_1.var_.characterEffect10004ui_story then
					local var_107_5 = Mathf.Lerp(0, 0.5, var_107_4)

					arg_104_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_104_1.var_.characterEffect10004ui_story.fillRatio = var_107_5
				end
			end

			if arg_104_1.time_ >= var_107_2 + var_107_3 and arg_104_1.time_ < var_107_2 + var_107_3 + arg_107_0 and arg_104_1.var_.characterEffect10004ui_story then
				local var_107_6 = 0.5

				arg_104_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_104_1.var_.characterEffect10004ui_story.fillRatio = var_107_6
			end

			local var_107_7 = 0
			local var_107_8 = 0.825

			if var_107_7 < arg_104_1.time_ and arg_104_1.time_ <= var_107_7 + arg_107_0 then
				arg_104_1.talkMaxDuration = 0
				arg_104_1.dialogCg_.alpha = 1

				arg_104_1.dialog_:SetActive(true)
				SetActive(arg_104_1.leftNameGo_, false)

				arg_104_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_104_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_104_1:RecordName(arg_104_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_104_1.iconTrs_.gameObject, false)
				arg_104_1.callingController_:SetSelectedState("normal")

				local var_107_9 = arg_104_1:GetWordFromCfg(106081026)
				local var_107_10 = arg_104_1:FormatText(var_107_9.content)

				arg_104_1.text_.text = var_107_10

				LuaForUtil.ClearLinePrefixSymbol(arg_104_1.text_)

				local var_107_11 = 33
				local var_107_12 = utf8.len(var_107_10)
				local var_107_13 = var_107_11 <= 0 and var_107_8 or var_107_8 * (var_107_12 / var_107_11)

				if var_107_13 > 0 and var_107_8 < var_107_13 then
					arg_104_1.talkMaxDuration = var_107_13

					if var_107_13 + var_107_7 > arg_104_1.duration_ then
						arg_104_1.duration_ = var_107_13 + var_107_7
					end
				end

				arg_104_1.text_.text = var_107_10
				arg_104_1.typewritter.percent = 0

				arg_104_1.typewritter:SetDirty()
				arg_104_1:ShowNextGo(false)
				arg_104_1:RecordContent(arg_104_1.text_.text)
			end

			local var_107_14 = math.max(var_107_8, arg_104_1.talkMaxDuration)

			if var_107_7 <= arg_104_1.time_ and arg_104_1.time_ < var_107_7 + var_107_14 then
				arg_104_1.typewritter.percent = (arg_104_1.time_ - var_107_7) / var_107_14

				arg_104_1.typewritter:SetDirty()
			end

			if arg_104_1.time_ >= var_107_7 + var_107_14 and arg_104_1.time_ < var_107_7 + var_107_14 + arg_107_0 then
				arg_104_1.typewritter.percent = 1

				arg_104_1.typewritter:SetDirty()
				arg_104_1:ShowNextGo(true)
			end
		end
	end,
	Play106081027 = function(arg_108_0, arg_108_1)
		arg_108_1.time_ = 0
		arg_108_1.frameCnt_ = 0
		arg_108_1.state_ = "playing"
		arg_108_1.curTalkId_ = 106081027
		arg_108_1.duration_ = 16.77

		local var_108_0 = {
			ja = 16.766,
			ko = 9.566,
			zh = 14.066,
			en = 9.8
		}
		local var_108_1 = manager.audio:GetLocalizationFlag()

		if var_108_0[var_108_1] ~= nil then
			arg_108_1.duration_ = var_108_0[var_108_1]
		end

		SetActive(arg_108_1.tipsGo_, false)

		function arg_108_1.onSingleLineFinish_()
			arg_108_1.onSingleLineUpdate_ = nil
			arg_108_1.onSingleLineFinish_ = nil
			arg_108_1.state_ = "waiting"
		end

		function arg_108_1.playNext_(arg_110_0)
			if arg_110_0 == 1 then
				arg_108_0:Play106081028(arg_108_1)
			end
		end

		function arg_108_1.onSingleLineUpdate_(arg_111_0)
			local var_111_0 = arg_108_1.actors_["10004ui_story"]
			local var_111_1 = 0

			if var_111_1 < arg_108_1.time_ and arg_108_1.time_ <= var_111_1 + arg_111_0 and arg_108_1.var_.characterEffect10004ui_story == nil then
				arg_108_1.var_.characterEffect10004ui_story = var_111_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_111_2 = 0.2

			if var_111_1 <= arg_108_1.time_ and arg_108_1.time_ < var_111_1 + var_111_2 then
				local var_111_3 = (arg_108_1.time_ - var_111_1) / var_111_2

				if arg_108_1.var_.characterEffect10004ui_story then
					arg_108_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_108_1.time_ >= var_111_1 + var_111_2 and arg_108_1.time_ < var_111_1 + var_111_2 + arg_111_0 and arg_108_1.var_.characterEffect10004ui_story then
				arg_108_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_111_4 = 0

			if var_111_4 < arg_108_1.time_ and arg_108_1.time_ <= var_111_4 + arg_111_0 then
				arg_108_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_111_5 = 0
			local var_111_6 = 1.025

			if var_111_5 < arg_108_1.time_ and arg_108_1.time_ <= var_111_5 + arg_111_0 then
				arg_108_1.talkMaxDuration = 0
				arg_108_1.dialogCg_.alpha = 1

				arg_108_1.dialog_:SetActive(true)
				SetActive(arg_108_1.leftNameGo_, true)

				local var_111_7 = arg_108_1:FormatText(StoryNameCfg[80].name)

				arg_108_1.leftNameTxt_.text = var_111_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_108_1.leftNameTxt_.transform)

				arg_108_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_108_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_108_1:RecordName(arg_108_1.leftNameTxt_.text)
				SetActive(arg_108_1.iconTrs_.gameObject, false)
				arg_108_1.callingController_:SetSelectedState("normal")

				local var_111_8 = arg_108_1:GetWordFromCfg(106081027)
				local var_111_9 = arg_108_1:FormatText(var_111_8.content)

				arg_108_1.text_.text = var_111_9

				LuaForUtil.ClearLinePrefixSymbol(arg_108_1.text_)

				local var_111_10 = 41
				local var_111_11 = utf8.len(var_111_9)
				local var_111_12 = var_111_10 <= 0 and var_111_6 or var_111_6 * (var_111_11 / var_111_10)

				if var_111_12 > 0 and var_111_6 < var_111_12 then
					arg_108_1.talkMaxDuration = var_111_12

					if var_111_12 + var_111_5 > arg_108_1.duration_ then
						arg_108_1.duration_ = var_111_12 + var_111_5
					end
				end

				arg_108_1.text_.text = var_111_9
				arg_108_1.typewritter.percent = 0

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081027", "story_v_out_106081.awb") ~= 0 then
					local var_111_13 = manager.audio:GetVoiceLength("story_v_out_106081", "106081027", "story_v_out_106081.awb") / 1000

					if var_111_13 + var_111_5 > arg_108_1.duration_ then
						arg_108_1.duration_ = var_111_13 + var_111_5
					end

					if var_111_8.prefab_name ~= "" and arg_108_1.actors_[var_111_8.prefab_name] ~= nil then
						local var_111_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_108_1.actors_[var_111_8.prefab_name].transform, "story_v_out_106081", "106081027", "story_v_out_106081.awb")

						arg_108_1:RecordAudio("106081027", var_111_14)
						arg_108_1:RecordAudio("106081027", var_111_14)
					else
						arg_108_1:AudioAction("play", "voice", "story_v_out_106081", "106081027", "story_v_out_106081.awb")
					end

					arg_108_1:RecordHistoryTalkVoice("story_v_out_106081", "106081027", "story_v_out_106081.awb")
				end

				arg_108_1:RecordContent(arg_108_1.text_.text)
			end

			local var_111_15 = math.max(var_111_6, arg_108_1.talkMaxDuration)

			if var_111_5 <= arg_108_1.time_ and arg_108_1.time_ < var_111_5 + var_111_15 then
				arg_108_1.typewritter.percent = (arg_108_1.time_ - var_111_5) / var_111_15

				arg_108_1.typewritter:SetDirty()
			end

			if arg_108_1.time_ >= var_111_5 + var_111_15 and arg_108_1.time_ < var_111_5 + var_111_15 + arg_111_0 then
				arg_108_1.typewritter.percent = 1

				arg_108_1.typewritter:SetDirty()
				arg_108_1:ShowNextGo(true)
			end
		end
	end,
	Play106081028 = function(arg_112_0, arg_112_1)
		arg_112_1.time_ = 0
		arg_112_1.frameCnt_ = 0
		arg_112_1.state_ = "playing"
		arg_112_1.curTalkId_ = 106081028
		arg_112_1.duration_ = 2

		SetActive(arg_112_1.tipsGo_, false)

		function arg_112_1.onSingleLineFinish_()
			arg_112_1.onSingleLineUpdate_ = nil
			arg_112_1.onSingleLineFinish_ = nil
			arg_112_1.state_ = "waiting"
		end

		function arg_112_1.playNext_(arg_114_0)
			if arg_114_0 == 1 then
				arg_112_0:Play106081029(arg_112_1)
			end
		end

		function arg_112_1.onSingleLineUpdate_(arg_115_0)
			local var_115_0 = arg_112_1.actors_["10004ui_story"]
			local var_115_1 = 0

			if var_115_1 < arg_112_1.time_ and arg_112_1.time_ <= var_115_1 + arg_115_0 and arg_112_1.var_.characterEffect10004ui_story == nil then
				arg_112_1.var_.characterEffect10004ui_story = var_115_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_115_2 = 0.2

			if var_115_1 <= arg_112_1.time_ and arg_112_1.time_ < var_115_1 + var_115_2 then
				local var_115_3 = (arg_112_1.time_ - var_115_1) / var_115_2

				if arg_112_1.var_.characterEffect10004ui_story then
					local var_115_4 = Mathf.Lerp(0, 0.5, var_115_3)

					arg_112_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_112_1.var_.characterEffect10004ui_story.fillRatio = var_115_4
				end
			end

			if arg_112_1.time_ >= var_115_1 + var_115_2 and arg_112_1.time_ < var_115_1 + var_115_2 + arg_115_0 and arg_112_1.var_.characterEffect10004ui_story then
				local var_115_5 = 0.5

				arg_112_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_112_1.var_.characterEffect10004ui_story.fillRatio = var_115_5
			end

			local var_115_6 = arg_112_1.actors_["10003ui_story"]
			local var_115_7 = 0

			if var_115_7 < arg_112_1.time_ and arg_112_1.time_ <= var_115_7 + arg_115_0 and arg_112_1.var_.characterEffect10003ui_story == nil then
				arg_112_1.var_.characterEffect10003ui_story = var_115_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_115_8 = 0.2

			if var_115_7 <= arg_112_1.time_ and arg_112_1.time_ < var_115_7 + var_115_8 then
				local var_115_9 = (arg_112_1.time_ - var_115_7) / var_115_8

				if arg_112_1.var_.characterEffect10003ui_story then
					arg_112_1.var_.characterEffect10003ui_story.fillFlat = false
				end
			end

			if arg_112_1.time_ >= var_115_7 + var_115_8 and arg_112_1.time_ < var_115_7 + var_115_8 + arg_115_0 and arg_112_1.var_.characterEffect10003ui_story then
				arg_112_1.var_.characterEffect10003ui_story.fillFlat = false
			end

			local var_115_10 = 0

			if var_115_10 < arg_112_1.time_ and arg_112_1.time_ <= var_115_10 + arg_115_0 then
				arg_112_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_115_11 = 0
			local var_115_12 = 0.15

			if var_115_11 < arg_112_1.time_ and arg_112_1.time_ <= var_115_11 + arg_115_0 then
				arg_112_1.talkMaxDuration = 0
				arg_112_1.dialogCg_.alpha = 1

				arg_112_1.dialog_:SetActive(true)
				SetActive(arg_112_1.leftNameGo_, true)

				local var_115_13 = arg_112_1:FormatText(StoryNameCfg[81].name)

				arg_112_1.leftNameTxt_.text = var_115_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_112_1.leftNameTxt_.transform)

				arg_112_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_112_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_112_1:RecordName(arg_112_1.leftNameTxt_.text)
				SetActive(arg_112_1.iconTrs_.gameObject, false)
				arg_112_1.callingController_:SetSelectedState("normal")

				local var_115_14 = arg_112_1:GetWordFromCfg(106081028)
				local var_115_15 = arg_112_1:FormatText(var_115_14.content)

				arg_112_1.text_.text = var_115_15

				LuaForUtil.ClearLinePrefixSymbol(arg_112_1.text_)

				local var_115_16 = 6
				local var_115_17 = utf8.len(var_115_15)
				local var_115_18 = var_115_16 <= 0 and var_115_12 or var_115_12 * (var_115_17 / var_115_16)

				if var_115_18 > 0 and var_115_12 < var_115_18 then
					arg_112_1.talkMaxDuration = var_115_18

					if var_115_18 + var_115_11 > arg_112_1.duration_ then
						arg_112_1.duration_ = var_115_18 + var_115_11
					end
				end

				arg_112_1.text_.text = var_115_15
				arg_112_1.typewritter.percent = 0

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081028", "story_v_out_106081.awb") ~= 0 then
					local var_115_19 = manager.audio:GetVoiceLength("story_v_out_106081", "106081028", "story_v_out_106081.awb") / 1000

					if var_115_19 + var_115_11 > arg_112_1.duration_ then
						arg_112_1.duration_ = var_115_19 + var_115_11
					end

					if var_115_14.prefab_name ~= "" and arg_112_1.actors_[var_115_14.prefab_name] ~= nil then
						local var_115_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_112_1.actors_[var_115_14.prefab_name].transform, "story_v_out_106081", "106081028", "story_v_out_106081.awb")

						arg_112_1:RecordAudio("106081028", var_115_20)
						arg_112_1:RecordAudio("106081028", var_115_20)
					else
						arg_112_1:AudioAction("play", "voice", "story_v_out_106081", "106081028", "story_v_out_106081.awb")
					end

					arg_112_1:RecordHistoryTalkVoice("story_v_out_106081", "106081028", "story_v_out_106081.awb")
				end

				arg_112_1:RecordContent(arg_112_1.text_.text)
			end

			local var_115_21 = math.max(var_115_12, arg_112_1.talkMaxDuration)

			if var_115_11 <= arg_112_1.time_ and arg_112_1.time_ < var_115_11 + var_115_21 then
				arg_112_1.typewritter.percent = (arg_112_1.time_ - var_115_11) / var_115_21

				arg_112_1.typewritter:SetDirty()
			end

			if arg_112_1.time_ >= var_115_11 + var_115_21 and arg_112_1.time_ < var_115_11 + var_115_21 + arg_115_0 then
				arg_112_1.typewritter.percent = 1

				arg_112_1.typewritter:SetDirty()
				arg_112_1:ShowNextGo(true)
			end
		end
	end,
	Play106081029 = function(arg_116_0, arg_116_1)
		arg_116_1.time_ = 0
		arg_116_1.frameCnt_ = 0
		arg_116_1.state_ = "playing"
		arg_116_1.curTalkId_ = 106081029
		arg_116_1.duration_ = 4.9

		local var_116_0 = {
			ja = 4.9,
			ko = 2.8,
			zh = 4.133,
			en = 1.999999999999
		}
		local var_116_1 = manager.audio:GetLocalizationFlag()

		if var_116_0[var_116_1] ~= nil then
			arg_116_1.duration_ = var_116_0[var_116_1]
		end

		SetActive(arg_116_1.tipsGo_, false)

		function arg_116_1.onSingleLineFinish_()
			arg_116_1.onSingleLineUpdate_ = nil
			arg_116_1.onSingleLineFinish_ = nil
			arg_116_1.state_ = "waiting"
		end

		function arg_116_1.playNext_(arg_118_0)
			if arg_118_0 == 1 then
				arg_116_0:Play106081030(arg_116_1)
			end
		end

		function arg_116_1.onSingleLineUpdate_(arg_119_0)
			local var_119_0 = 0

			if var_119_0 < arg_116_1.time_ and arg_116_1.time_ <= var_119_0 + arg_119_0 then
				arg_116_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_119_1 = 0
			local var_119_2 = 0.275

			if var_119_1 < arg_116_1.time_ and arg_116_1.time_ <= var_119_1 + arg_119_0 then
				arg_116_1.talkMaxDuration = 0
				arg_116_1.dialogCg_.alpha = 1

				arg_116_1.dialog_:SetActive(true)
				SetActive(arg_116_1.leftNameGo_, true)

				local var_119_3 = arg_116_1:FormatText(StoryNameCfg[81].name)

				arg_116_1.leftNameTxt_.text = var_119_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_116_1.leftNameTxt_.transform)

				arg_116_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_116_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_116_1:RecordName(arg_116_1.leftNameTxt_.text)
				SetActive(arg_116_1.iconTrs_.gameObject, false)
				arg_116_1.callingController_:SetSelectedState("normal")

				local var_119_4 = arg_116_1:GetWordFromCfg(106081029)
				local var_119_5 = arg_116_1:FormatText(var_119_4.content)

				arg_116_1.text_.text = var_119_5

				LuaForUtil.ClearLinePrefixSymbol(arg_116_1.text_)

				local var_119_6 = 11
				local var_119_7 = utf8.len(var_119_5)
				local var_119_8 = var_119_6 <= 0 and var_119_2 or var_119_2 * (var_119_7 / var_119_6)

				if var_119_8 > 0 and var_119_2 < var_119_8 then
					arg_116_1.talkMaxDuration = var_119_8

					if var_119_8 + var_119_1 > arg_116_1.duration_ then
						arg_116_1.duration_ = var_119_8 + var_119_1
					end
				end

				arg_116_1.text_.text = var_119_5
				arg_116_1.typewritter.percent = 0

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081029", "story_v_out_106081.awb") ~= 0 then
					local var_119_9 = manager.audio:GetVoiceLength("story_v_out_106081", "106081029", "story_v_out_106081.awb") / 1000

					if var_119_9 + var_119_1 > arg_116_1.duration_ then
						arg_116_1.duration_ = var_119_9 + var_119_1
					end

					if var_119_4.prefab_name ~= "" and arg_116_1.actors_[var_119_4.prefab_name] ~= nil then
						local var_119_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_116_1.actors_[var_119_4.prefab_name].transform, "story_v_out_106081", "106081029", "story_v_out_106081.awb")

						arg_116_1:RecordAudio("106081029", var_119_10)
						arg_116_1:RecordAudio("106081029", var_119_10)
					else
						arg_116_1:AudioAction("play", "voice", "story_v_out_106081", "106081029", "story_v_out_106081.awb")
					end

					arg_116_1:RecordHistoryTalkVoice("story_v_out_106081", "106081029", "story_v_out_106081.awb")
				end

				arg_116_1:RecordContent(arg_116_1.text_.text)
			end

			local var_119_11 = math.max(var_119_2, arg_116_1.talkMaxDuration)

			if var_119_1 <= arg_116_1.time_ and arg_116_1.time_ < var_119_1 + var_119_11 then
				arg_116_1.typewritter.percent = (arg_116_1.time_ - var_119_1) / var_119_11

				arg_116_1.typewritter:SetDirty()
			end

			if arg_116_1.time_ >= var_119_1 + var_119_11 and arg_116_1.time_ < var_119_1 + var_119_11 + arg_119_0 then
				arg_116_1.typewritter.percent = 1

				arg_116_1.typewritter:SetDirty()
				arg_116_1:ShowNextGo(true)
			end
		end
	end,
	Play106081030 = function(arg_120_0, arg_120_1)
		arg_120_1.time_ = 0
		arg_120_1.frameCnt_ = 0
		arg_120_1.state_ = "playing"
		arg_120_1.curTalkId_ = 106081030
		arg_120_1.duration_ = 12.1

		local var_120_0 = {
			ja = 10.833,
			ko = 12,
			zh = 12.1,
			en = 11.733
		}
		local var_120_1 = manager.audio:GetLocalizationFlag()

		if var_120_0[var_120_1] ~= nil then
			arg_120_1.duration_ = var_120_0[var_120_1]
		end

		SetActive(arg_120_1.tipsGo_, false)

		function arg_120_1.onSingleLineFinish_()
			arg_120_1.onSingleLineUpdate_ = nil
			arg_120_1.onSingleLineFinish_ = nil
			arg_120_1.state_ = "waiting"
		end

		function arg_120_1.playNext_(arg_122_0)
			if arg_122_0 == 1 then
				arg_120_0:Play106081031(arg_120_1)
			end
		end

		function arg_120_1.onSingleLineUpdate_(arg_123_0)
			local var_123_0 = arg_120_1.actors_["4014_tpose"]
			local var_123_1 = 0

			if var_123_1 < arg_120_1.time_ and arg_120_1.time_ <= var_123_1 + arg_123_0 and arg_120_1.var_.characterEffect4014_tpose == nil then
				arg_120_1.var_.characterEffect4014_tpose = var_123_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_123_2 = 0.1

			if var_123_1 <= arg_120_1.time_ and arg_120_1.time_ < var_123_1 + var_123_2 then
				local var_123_3 = (arg_120_1.time_ - var_123_1) / var_123_2

				if arg_120_1.var_.characterEffect4014_tpose then
					arg_120_1.var_.characterEffect4014_tpose.fillFlat = false
				end
			end

			if arg_120_1.time_ >= var_123_1 + var_123_2 and arg_120_1.time_ < var_123_1 + var_123_2 + arg_123_0 and arg_120_1.var_.characterEffect4014_tpose then
				arg_120_1.var_.characterEffect4014_tpose.fillFlat = false
			end

			local var_123_4 = arg_120_1.actors_["4014_tpose"].transform
			local var_123_5 = 0

			if var_123_5 < arg_120_1.time_ and arg_120_1.time_ <= var_123_5 + arg_123_0 then
				arg_120_1.var_.moveOldPos4014_tpose = var_123_4.localPosition
			end

			local var_123_6 = 0.001

			if var_123_5 <= arg_120_1.time_ and arg_120_1.time_ < var_123_5 + var_123_6 then
				local var_123_7 = (arg_120_1.time_ - var_123_5) / var_123_6
				local var_123_8 = Vector3.New(0, -1.95, -4.2)

				var_123_4.localPosition = Vector3.Lerp(arg_120_1.var_.moveOldPos4014_tpose, var_123_8, var_123_7)

				local var_123_9 = manager.ui.mainCamera.transform.position - var_123_4.position

				var_123_4.forward = Vector3.New(var_123_9.x, var_123_9.y, var_123_9.z)

				local var_123_10 = var_123_4.localEulerAngles

				var_123_10.z = 0
				var_123_10.x = 0
				var_123_4.localEulerAngles = var_123_10
			end

			if arg_120_1.time_ >= var_123_5 + var_123_6 and arg_120_1.time_ < var_123_5 + var_123_6 + arg_123_0 then
				var_123_4.localPosition = Vector3.New(0, -1.95, -4.2)

				local var_123_11 = manager.ui.mainCamera.transform.position - var_123_4.position

				var_123_4.forward = Vector3.New(var_123_11.x, var_123_11.y, var_123_11.z)

				local var_123_12 = var_123_4.localEulerAngles

				var_123_12.z = 0
				var_123_12.x = 0
				var_123_4.localEulerAngles = var_123_12
			end

			local var_123_13 = 0

			if var_123_13 < arg_120_1.time_ and arg_120_1.time_ <= var_123_13 + arg_123_0 then
				arg_120_1:PlayTimeline("4014_tpose", "StoryTimeline/CharAction/story4014/story4014action/4014action1_1")
			end

			local var_123_14 = arg_120_1.actors_["10003ui_story"].transform
			local var_123_15 = 0

			if var_123_15 < arg_120_1.time_ and arg_120_1.time_ <= var_123_15 + arg_123_0 then
				arg_120_1.var_.moveOldPos10003ui_story = var_123_14.localPosition
			end

			local var_123_16 = 0.001

			if var_123_15 <= arg_120_1.time_ and arg_120_1.time_ < var_123_15 + var_123_16 then
				local var_123_17 = (arg_120_1.time_ - var_123_15) / var_123_16
				local var_123_18 = Vector3.New(0, 100, 0)

				var_123_14.localPosition = Vector3.Lerp(arg_120_1.var_.moveOldPos10003ui_story, var_123_18, var_123_17)

				local var_123_19 = manager.ui.mainCamera.transform.position - var_123_14.position

				var_123_14.forward = Vector3.New(var_123_19.x, var_123_19.y, var_123_19.z)

				local var_123_20 = var_123_14.localEulerAngles

				var_123_20.z = 0
				var_123_20.x = 0
				var_123_14.localEulerAngles = var_123_20
			end

			if arg_120_1.time_ >= var_123_15 + var_123_16 and arg_120_1.time_ < var_123_15 + var_123_16 + arg_123_0 then
				var_123_14.localPosition = Vector3.New(0, 100, 0)

				local var_123_21 = manager.ui.mainCamera.transform.position - var_123_14.position

				var_123_14.forward = Vector3.New(var_123_21.x, var_123_21.y, var_123_21.z)

				local var_123_22 = var_123_14.localEulerAngles

				var_123_22.z = 0
				var_123_22.x = 0
				var_123_14.localEulerAngles = var_123_22
			end

			local var_123_23 = arg_120_1.actors_["10004ui_story"].transform
			local var_123_24 = 0

			if var_123_24 < arg_120_1.time_ and arg_120_1.time_ <= var_123_24 + arg_123_0 then
				arg_120_1.var_.moveOldPos10004ui_story = var_123_23.localPosition
			end

			local var_123_25 = 0.001

			if var_123_24 <= arg_120_1.time_ and arg_120_1.time_ < var_123_24 + var_123_25 then
				local var_123_26 = (arg_120_1.time_ - var_123_24) / var_123_25
				local var_123_27 = Vector3.New(0, 100, 0)

				var_123_23.localPosition = Vector3.Lerp(arg_120_1.var_.moveOldPos10004ui_story, var_123_27, var_123_26)

				local var_123_28 = manager.ui.mainCamera.transform.position - var_123_23.position

				var_123_23.forward = Vector3.New(var_123_28.x, var_123_28.y, var_123_28.z)

				local var_123_29 = var_123_23.localEulerAngles

				var_123_29.z = 0
				var_123_29.x = 0
				var_123_23.localEulerAngles = var_123_29
			end

			if arg_120_1.time_ >= var_123_24 + var_123_25 and arg_120_1.time_ < var_123_24 + var_123_25 + arg_123_0 then
				var_123_23.localPosition = Vector3.New(0, 100, 0)

				local var_123_30 = manager.ui.mainCamera.transform.position - var_123_23.position

				var_123_23.forward = Vector3.New(var_123_30.x, var_123_30.y, var_123_30.z)

				local var_123_31 = var_123_23.localEulerAngles

				var_123_31.z = 0
				var_123_31.x = 0
				var_123_23.localEulerAngles = var_123_31
			end

			local var_123_32 = 0
			local var_123_33 = 1.025

			if var_123_32 < arg_120_1.time_ and arg_120_1.time_ <= var_123_32 + arg_123_0 then
				arg_120_1.talkMaxDuration = 0
				arg_120_1.dialogCg_.alpha = 1

				arg_120_1.dialog_:SetActive(true)
				SetActive(arg_120_1.leftNameGo_, true)

				local var_123_34 = arg_120_1:FormatText(StoryNameCfg[87].name)

				arg_120_1.leftNameTxt_.text = var_123_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_120_1.leftNameTxt_.transform)

				arg_120_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_120_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_120_1:RecordName(arg_120_1.leftNameTxt_.text)
				SetActive(arg_120_1.iconTrs_.gameObject, false)
				arg_120_1.callingController_:SetSelectedState("normal")

				local var_123_35 = arg_120_1:GetWordFromCfg(106081030)
				local var_123_36 = arg_120_1:FormatText(var_123_35.content)

				arg_120_1.text_.text = var_123_36

				LuaForUtil.ClearLinePrefixSymbol(arg_120_1.text_)

				local var_123_37 = 42
				local var_123_38 = utf8.len(var_123_36)
				local var_123_39 = var_123_37 <= 0 and var_123_33 or var_123_33 * (var_123_38 / var_123_37)

				if var_123_39 > 0 and var_123_33 < var_123_39 then
					arg_120_1.talkMaxDuration = var_123_39

					if var_123_39 + var_123_32 > arg_120_1.duration_ then
						arg_120_1.duration_ = var_123_39 + var_123_32
					end
				end

				arg_120_1.text_.text = var_123_36
				arg_120_1.typewritter.percent = 0

				arg_120_1.typewritter:SetDirty()
				arg_120_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081030", "story_v_out_106081.awb") ~= 0 then
					local var_123_40 = manager.audio:GetVoiceLength("story_v_out_106081", "106081030", "story_v_out_106081.awb") / 1000

					if var_123_40 + var_123_32 > arg_120_1.duration_ then
						arg_120_1.duration_ = var_123_40 + var_123_32
					end

					if var_123_35.prefab_name ~= "" and arg_120_1.actors_[var_123_35.prefab_name] ~= nil then
						local var_123_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_120_1.actors_[var_123_35.prefab_name].transform, "story_v_out_106081", "106081030", "story_v_out_106081.awb")

						arg_120_1:RecordAudio("106081030", var_123_41)
						arg_120_1:RecordAudio("106081030", var_123_41)
					else
						arg_120_1:AudioAction("play", "voice", "story_v_out_106081", "106081030", "story_v_out_106081.awb")
					end

					arg_120_1:RecordHistoryTalkVoice("story_v_out_106081", "106081030", "story_v_out_106081.awb")
				end

				arg_120_1:RecordContent(arg_120_1.text_.text)
			end

			local var_123_42 = math.max(var_123_33, arg_120_1.talkMaxDuration)

			if var_123_32 <= arg_120_1.time_ and arg_120_1.time_ < var_123_32 + var_123_42 then
				arg_120_1.typewritter.percent = (arg_120_1.time_ - var_123_32) / var_123_42

				arg_120_1.typewritter:SetDirty()
			end

			if arg_120_1.time_ >= var_123_32 + var_123_42 and arg_120_1.time_ < var_123_32 + var_123_42 + arg_123_0 then
				arg_120_1.typewritter.percent = 1

				arg_120_1.typewritter:SetDirty()
				arg_120_1:ShowNextGo(true)
			end
		end
	end,
	Play106081031 = function(arg_124_0, arg_124_1)
		arg_124_1.time_ = 0
		arg_124_1.frameCnt_ = 0
		arg_124_1.state_ = "playing"
		arg_124_1.curTalkId_ = 106081031
		arg_124_1.duration_ = 17.7

		local var_124_0 = {
			ja = 17.7,
			ko = 9.5,
			zh = 11.433,
			en = 10.6
		}
		local var_124_1 = manager.audio:GetLocalizationFlag()

		if var_124_0[var_124_1] ~= nil then
			arg_124_1.duration_ = var_124_0[var_124_1]
		end

		SetActive(arg_124_1.tipsGo_, false)

		function arg_124_1.onSingleLineFinish_()
			arg_124_1.onSingleLineUpdate_ = nil
			arg_124_1.onSingleLineFinish_ = nil
			arg_124_1.state_ = "waiting"
		end

		function arg_124_1.playNext_(arg_126_0)
			if arg_126_0 == 1 then
				arg_124_0:Play106081032(arg_124_1)
			end
		end

		function arg_124_1.onSingleLineUpdate_(arg_127_0)
			local var_127_0 = 0

			if var_127_0 < arg_124_1.time_ and arg_124_1.time_ <= var_127_0 + arg_127_0 then
				arg_124_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/story10003/story10003action/10003action2_1")
			end

			local var_127_1 = 0

			if var_127_1 < arg_124_1.time_ and arg_124_1.time_ <= var_127_1 + arg_127_0 then
				arg_124_1.allBtn_.enabled = false
			end

			local var_127_2 = 0.533333333333333

			if arg_124_1.time_ >= var_127_1 + var_127_2 and arg_124_1.time_ < var_127_1 + var_127_2 + arg_127_0 then
				arg_124_1.allBtn_.enabled = true
			end

			local var_127_3 = 0
			local var_127_4 = 1.1

			if var_127_3 < arg_124_1.time_ and arg_124_1.time_ <= var_127_3 + arg_127_0 then
				arg_124_1.talkMaxDuration = 0
				arg_124_1.dialogCg_.alpha = 1

				arg_124_1.dialog_:SetActive(true)
				SetActive(arg_124_1.leftNameGo_, true)

				local var_127_5 = arg_124_1:FormatText(StoryNameCfg[87].name)

				arg_124_1.leftNameTxt_.text = var_127_5

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_124_1.leftNameTxt_.transform)

				arg_124_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_124_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_124_1:RecordName(arg_124_1.leftNameTxt_.text)
				SetActive(arg_124_1.iconTrs_.gameObject, false)
				arg_124_1.callingController_:SetSelectedState("normal")

				local var_127_6 = arg_124_1:GetWordFromCfg(106081031)
				local var_127_7 = arg_124_1:FormatText(var_127_6.content)

				arg_124_1.text_.text = var_127_7

				LuaForUtil.ClearLinePrefixSymbol(arg_124_1.text_)

				local var_127_8 = 44
				local var_127_9 = utf8.len(var_127_7)
				local var_127_10 = var_127_8 <= 0 and var_127_4 or var_127_4 * (var_127_9 / var_127_8)

				if var_127_10 > 0 and var_127_4 < var_127_10 then
					arg_124_1.talkMaxDuration = var_127_10

					if var_127_10 + var_127_3 > arg_124_1.duration_ then
						arg_124_1.duration_ = var_127_10 + var_127_3
					end
				end

				arg_124_1.text_.text = var_127_7
				arg_124_1.typewritter.percent = 0

				arg_124_1.typewritter:SetDirty()
				arg_124_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081031", "story_v_out_106081.awb") ~= 0 then
					local var_127_11 = manager.audio:GetVoiceLength("story_v_out_106081", "106081031", "story_v_out_106081.awb") / 1000

					if var_127_11 + var_127_3 > arg_124_1.duration_ then
						arg_124_1.duration_ = var_127_11 + var_127_3
					end

					if var_127_6.prefab_name ~= "" and arg_124_1.actors_[var_127_6.prefab_name] ~= nil then
						local var_127_12 = LuaForUtil.PlayVoiceWithCriLipsync(arg_124_1.actors_[var_127_6.prefab_name].transform, "story_v_out_106081", "106081031", "story_v_out_106081.awb")

						arg_124_1:RecordAudio("106081031", var_127_12)
						arg_124_1:RecordAudio("106081031", var_127_12)
					else
						arg_124_1:AudioAction("play", "voice", "story_v_out_106081", "106081031", "story_v_out_106081.awb")
					end

					arg_124_1:RecordHistoryTalkVoice("story_v_out_106081", "106081031", "story_v_out_106081.awb")
				end

				arg_124_1:RecordContent(arg_124_1.text_.text)
			end

			local var_127_13 = math.max(var_127_4, arg_124_1.talkMaxDuration)

			if var_127_3 <= arg_124_1.time_ and arg_124_1.time_ < var_127_3 + var_127_13 then
				arg_124_1.typewritter.percent = (arg_124_1.time_ - var_127_3) / var_127_13

				arg_124_1.typewritter:SetDirty()
			end

			if arg_124_1.time_ >= var_127_3 + var_127_13 and arg_124_1.time_ < var_127_3 + var_127_13 + arg_127_0 then
				arg_124_1.typewritter.percent = 1

				arg_124_1.typewritter:SetDirty()
				arg_124_1:ShowNextGo(true)
			end
		end
	end,
	Play106081032 = function(arg_128_0, arg_128_1)
		arg_128_1.time_ = 0
		arg_128_1.frameCnt_ = 0
		arg_128_1.state_ = "playing"
		arg_128_1.curTalkId_ = 106081032
		arg_128_1.duration_ = 3.87

		local var_128_0 = {
			ja = 3.866,
			ko = 2.433,
			zh = 2.433,
			en = 3.3
		}
		local var_128_1 = manager.audio:GetLocalizationFlag()

		if var_128_0[var_128_1] ~= nil then
			arg_128_1.duration_ = var_128_0[var_128_1]
		end

		SetActive(arg_128_1.tipsGo_, false)

		function arg_128_1.onSingleLineFinish_()
			arg_128_1.onSingleLineUpdate_ = nil
			arg_128_1.onSingleLineFinish_ = nil
			arg_128_1.state_ = "waiting"
		end

		function arg_128_1.playNext_(arg_130_0)
			if arg_130_0 == 1 then
				arg_128_0:Play106081033(arg_128_1)
			end
		end

		function arg_128_1.onSingleLineUpdate_(arg_131_0)
			local var_131_0 = arg_128_1.actors_["4014_tpose"]
			local var_131_1 = 0

			if var_131_1 < arg_128_1.time_ and arg_128_1.time_ <= var_131_1 + arg_131_0 and arg_128_1.var_.characterEffect4014_tpose == nil then
				arg_128_1.var_.characterEffect4014_tpose = var_131_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_131_2 = 0.1

			if var_131_1 <= arg_128_1.time_ and arg_128_1.time_ < var_131_1 + var_131_2 then
				local var_131_3 = (arg_128_1.time_ - var_131_1) / var_131_2

				if arg_128_1.var_.characterEffect4014_tpose then
					local var_131_4 = Mathf.Lerp(0, 0.5, var_131_3)

					arg_128_1.var_.characterEffect4014_tpose.fillFlat = true
					arg_128_1.var_.characterEffect4014_tpose.fillRatio = var_131_4
				end
			end

			if arg_128_1.time_ >= var_131_1 + var_131_2 and arg_128_1.time_ < var_131_1 + var_131_2 + arg_131_0 and arg_128_1.var_.characterEffect4014_tpose then
				local var_131_5 = 0.5

				arg_128_1.var_.characterEffect4014_tpose.fillFlat = true
				arg_128_1.var_.characterEffect4014_tpose.fillRatio = var_131_5
			end

			local var_131_6 = arg_128_1.actors_["10004ui_story"]
			local var_131_7 = 0

			if var_131_7 < arg_128_1.time_ and arg_128_1.time_ <= var_131_7 + arg_131_0 and arg_128_1.var_.characterEffect10004ui_story == nil then
				arg_128_1.var_.characterEffect10004ui_story = var_131_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_131_8 = 0.2

			if var_131_7 <= arg_128_1.time_ and arg_128_1.time_ < var_131_7 + var_131_8 then
				local var_131_9 = (arg_128_1.time_ - var_131_7) / var_131_8

				if arg_128_1.var_.characterEffect10004ui_story then
					local var_131_10 = Mathf.Lerp(0, 0.5, var_131_9)

					arg_128_1.var_.characterEffect10004ui_story.fillFlat = true
					arg_128_1.var_.characterEffect10004ui_story.fillRatio = var_131_10
				end
			end

			if arg_128_1.time_ >= var_131_7 + var_131_8 and arg_128_1.time_ < var_131_7 + var_131_8 + arg_131_0 and arg_128_1.var_.characterEffect10004ui_story then
				local var_131_11 = 0.5

				arg_128_1.var_.characterEffect10004ui_story.fillFlat = true
				arg_128_1.var_.characterEffect10004ui_story.fillRatio = var_131_11
			end

			local var_131_12 = arg_128_1.actors_["10003ui_story"]
			local var_131_13 = 0

			if var_131_13 < arg_128_1.time_ and arg_128_1.time_ <= var_131_13 + arg_131_0 and arg_128_1.var_.characterEffect10003ui_story == nil then
				arg_128_1.var_.characterEffect10003ui_story = var_131_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_131_14 = 0.2

			if var_131_13 <= arg_128_1.time_ and arg_128_1.time_ < var_131_13 + var_131_14 then
				local var_131_15 = (arg_128_1.time_ - var_131_13) / var_131_14

				if arg_128_1.var_.characterEffect10003ui_story then
					arg_128_1.var_.characterEffect10003ui_story.fillFlat = false
				end
			end

			if arg_128_1.time_ >= var_131_13 + var_131_14 and arg_128_1.time_ < var_131_13 + var_131_14 + arg_131_0 and arg_128_1.var_.characterEffect10003ui_story then
				arg_128_1.var_.characterEffect10003ui_story.fillFlat = false
			end

			local var_131_16 = arg_128_1.actors_["10003ui_story"].transform
			local var_131_17 = 0

			if var_131_17 < arg_128_1.time_ and arg_128_1.time_ <= var_131_17 + arg_131_0 then
				arg_128_1.var_.moveOldPos10003ui_story = var_131_16.localPosition
			end

			local var_131_18 = 0.001

			if var_131_17 <= arg_128_1.time_ and arg_128_1.time_ < var_131_17 + var_131_18 then
				local var_131_19 = (arg_128_1.time_ - var_131_17) / var_131_18
				local var_131_20 = Vector3.New(0.7, -1.05, -5.9)

				var_131_16.localPosition = Vector3.Lerp(arg_128_1.var_.moveOldPos10003ui_story, var_131_20, var_131_19)

				local var_131_21 = manager.ui.mainCamera.transform.position - var_131_16.position

				var_131_16.forward = Vector3.New(var_131_21.x, var_131_21.y, var_131_21.z)

				local var_131_22 = var_131_16.localEulerAngles

				var_131_22.z = 0
				var_131_22.x = 0
				var_131_16.localEulerAngles = var_131_22
			end

			if arg_128_1.time_ >= var_131_17 + var_131_18 and arg_128_1.time_ < var_131_17 + var_131_18 + arg_131_0 then
				var_131_16.localPosition = Vector3.New(0.7, -1.05, -5.9)

				local var_131_23 = manager.ui.mainCamera.transform.position - var_131_16.position

				var_131_16.forward = Vector3.New(var_131_23.x, var_131_23.y, var_131_23.z)

				local var_131_24 = var_131_16.localEulerAngles

				var_131_24.z = 0
				var_131_24.x = 0
				var_131_16.localEulerAngles = var_131_24
			end

			local var_131_25 = arg_128_1.actors_["10004ui_story"].transform
			local var_131_26 = 0

			if var_131_26 < arg_128_1.time_ and arg_128_1.time_ <= var_131_26 + arg_131_0 then
				arg_128_1.var_.moveOldPos10004ui_story = var_131_25.localPosition
			end

			local var_131_27 = 0.001

			if var_131_26 <= arg_128_1.time_ and arg_128_1.time_ < var_131_26 + var_131_27 then
				local var_131_28 = (arg_128_1.time_ - var_131_26) / var_131_27
				local var_131_29 = Vector3.New(-0.7, -1.1, -5.6)

				var_131_25.localPosition = Vector3.Lerp(arg_128_1.var_.moveOldPos10004ui_story, var_131_29, var_131_28)

				local var_131_30 = manager.ui.mainCamera.transform.position - var_131_25.position

				var_131_25.forward = Vector3.New(var_131_30.x, var_131_30.y, var_131_30.z)

				local var_131_31 = var_131_25.localEulerAngles

				var_131_31.z = 0
				var_131_31.x = 0
				var_131_25.localEulerAngles = var_131_31
			end

			if arg_128_1.time_ >= var_131_26 + var_131_27 and arg_128_1.time_ < var_131_26 + var_131_27 + arg_131_0 then
				var_131_25.localPosition = Vector3.New(-0.7, -1.1, -5.6)

				local var_131_32 = manager.ui.mainCamera.transform.position - var_131_25.position

				var_131_25.forward = Vector3.New(var_131_32.x, var_131_32.y, var_131_32.z)

				local var_131_33 = var_131_25.localEulerAngles

				var_131_33.z = 0
				var_131_33.x = 0
				var_131_25.localEulerAngles = var_131_33
			end

			local var_131_34 = arg_128_1.actors_["4014_tpose"].transform
			local var_131_35 = 0

			if var_131_35 < arg_128_1.time_ and arg_128_1.time_ <= var_131_35 + arg_131_0 then
				arg_128_1.var_.moveOldPos4014_tpose = var_131_34.localPosition
			end

			local var_131_36 = 0.001

			if var_131_35 <= arg_128_1.time_ and arg_128_1.time_ < var_131_35 + var_131_36 then
				local var_131_37 = (arg_128_1.time_ - var_131_35) / var_131_36
				local var_131_38 = Vector3.New(0, 100, 0)

				var_131_34.localPosition = Vector3.Lerp(arg_128_1.var_.moveOldPos4014_tpose, var_131_38, var_131_37)

				local var_131_39 = manager.ui.mainCamera.transform.position - var_131_34.position

				var_131_34.forward = Vector3.New(var_131_39.x, var_131_39.y, var_131_39.z)

				local var_131_40 = var_131_34.localEulerAngles

				var_131_40.z = 0
				var_131_40.x = 0
				var_131_34.localEulerAngles = var_131_40
			end

			if arg_128_1.time_ >= var_131_35 + var_131_36 and arg_128_1.time_ < var_131_35 + var_131_36 + arg_131_0 then
				var_131_34.localPosition = Vector3.New(0, 100, 0)

				local var_131_41 = manager.ui.mainCamera.transform.position - var_131_34.position

				var_131_34.forward = Vector3.New(var_131_41.x, var_131_41.y, var_131_41.z)

				local var_131_42 = var_131_34.localEulerAngles

				var_131_42.z = 0
				var_131_42.x = 0
				var_131_34.localEulerAngles = var_131_42
			end

			local var_131_43 = 0

			if var_131_43 < arg_128_1.time_ and arg_128_1.time_ <= var_131_43 + arg_131_0 then
				arg_128_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action1_1")
			end

			local var_131_44 = 0

			if var_131_44 < arg_128_1.time_ and arg_128_1.time_ <= var_131_44 + arg_131_0 then
				arg_128_1:PlayTimeline("10003ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_131_45 = 0
			local var_131_46 = 0.275

			if var_131_45 < arg_128_1.time_ and arg_128_1.time_ <= var_131_45 + arg_131_0 then
				arg_128_1.talkMaxDuration = 0
				arg_128_1.dialogCg_.alpha = 1

				arg_128_1.dialog_:SetActive(true)
				SetActive(arg_128_1.leftNameGo_, true)

				local var_131_47 = arg_128_1:FormatText(StoryNameCfg[81].name)

				arg_128_1.leftNameTxt_.text = var_131_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_128_1.leftNameTxt_.transform)

				arg_128_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_128_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_128_1:RecordName(arg_128_1.leftNameTxt_.text)
				SetActive(arg_128_1.iconTrs_.gameObject, false)
				arg_128_1.callingController_:SetSelectedState("normal")

				local var_131_48 = arg_128_1:GetWordFromCfg(106081032)
				local var_131_49 = arg_128_1:FormatText(var_131_48.content)

				arg_128_1.text_.text = var_131_49

				LuaForUtil.ClearLinePrefixSymbol(arg_128_1.text_)

				local var_131_50 = 11
				local var_131_51 = utf8.len(var_131_49)
				local var_131_52 = var_131_50 <= 0 and var_131_46 or var_131_46 * (var_131_51 / var_131_50)

				if var_131_52 > 0 and var_131_46 < var_131_52 then
					arg_128_1.talkMaxDuration = var_131_52

					if var_131_52 + var_131_45 > arg_128_1.duration_ then
						arg_128_1.duration_ = var_131_52 + var_131_45
					end
				end

				arg_128_1.text_.text = var_131_49
				arg_128_1.typewritter.percent = 0

				arg_128_1.typewritter:SetDirty()
				arg_128_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081032", "story_v_out_106081.awb") ~= 0 then
					local var_131_53 = manager.audio:GetVoiceLength("story_v_out_106081", "106081032", "story_v_out_106081.awb") / 1000

					if var_131_53 + var_131_45 > arg_128_1.duration_ then
						arg_128_1.duration_ = var_131_53 + var_131_45
					end

					if var_131_48.prefab_name ~= "" and arg_128_1.actors_[var_131_48.prefab_name] ~= nil then
						local var_131_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_128_1.actors_[var_131_48.prefab_name].transform, "story_v_out_106081", "106081032", "story_v_out_106081.awb")

						arg_128_1:RecordAudio("106081032", var_131_54)
						arg_128_1:RecordAudio("106081032", var_131_54)
					else
						arg_128_1:AudioAction("play", "voice", "story_v_out_106081", "106081032", "story_v_out_106081.awb")
					end

					arg_128_1:RecordHistoryTalkVoice("story_v_out_106081", "106081032", "story_v_out_106081.awb")
				end

				arg_128_1:RecordContent(arg_128_1.text_.text)
			end

			local var_131_55 = math.max(var_131_46, arg_128_1.talkMaxDuration)

			if var_131_45 <= arg_128_1.time_ and arg_128_1.time_ < var_131_45 + var_131_55 then
				arg_128_1.typewritter.percent = (arg_128_1.time_ - var_131_45) / var_131_55

				arg_128_1.typewritter:SetDirty()
			end

			if arg_128_1.time_ >= var_131_45 + var_131_55 and arg_128_1.time_ < var_131_45 + var_131_55 + arg_131_0 then
				arg_128_1.typewritter.percent = 1

				arg_128_1.typewritter:SetDirty()
				arg_128_1:ShowNextGo(true)
			end
		end
	end,
	Play106081033 = function(arg_132_0, arg_132_1)
		arg_132_1.time_ = 0
		arg_132_1.frameCnt_ = 0
		arg_132_1.state_ = "playing"
		arg_132_1.curTalkId_ = 106081033
		arg_132_1.duration_ = 10.27

		local var_132_0 = {
			ja = 6.6,
			ko = 5.733,
			zh = 7.3,
			en = 10.266
		}
		local var_132_1 = manager.audio:GetLocalizationFlag()

		if var_132_0[var_132_1] ~= nil then
			arg_132_1.duration_ = var_132_0[var_132_1]
		end

		SetActive(arg_132_1.tipsGo_, false)

		function arg_132_1.onSingleLineFinish_()
			arg_132_1.onSingleLineUpdate_ = nil
			arg_132_1.onSingleLineFinish_ = nil
			arg_132_1.state_ = "waiting"
		end

		function arg_132_1.playNext_(arg_134_0)
			if arg_134_0 == 1 then
				arg_132_0:Play106081034(arg_132_1)
			end
		end

		function arg_132_1.onSingleLineUpdate_(arg_135_0)
			local var_135_0 = arg_132_1.actors_["10004ui_story"]
			local var_135_1 = 0

			if var_135_1 < arg_132_1.time_ and arg_132_1.time_ <= var_135_1 + arg_135_0 and arg_132_1.var_.characterEffect10004ui_story == nil then
				arg_132_1.var_.characterEffect10004ui_story = var_135_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_135_2 = 0.2

			if var_135_1 <= arg_132_1.time_ and arg_132_1.time_ < var_135_1 + var_135_2 then
				local var_135_3 = (arg_132_1.time_ - var_135_1) / var_135_2

				if arg_132_1.var_.characterEffect10004ui_story then
					arg_132_1.var_.characterEffect10004ui_story.fillFlat = false
				end
			end

			if arg_132_1.time_ >= var_135_1 + var_135_2 and arg_132_1.time_ < var_135_1 + var_135_2 + arg_135_0 and arg_132_1.var_.characterEffect10004ui_story then
				arg_132_1.var_.characterEffect10004ui_story.fillFlat = false
			end

			local var_135_4 = arg_132_1.actors_["10003ui_story"]
			local var_135_5 = 0

			if var_135_5 < arg_132_1.time_ and arg_132_1.time_ <= var_135_5 + arg_135_0 and arg_132_1.var_.characterEffect10003ui_story == nil then
				arg_132_1.var_.characterEffect10003ui_story = var_135_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_135_6 = 0.2

			if var_135_5 <= arg_132_1.time_ and arg_132_1.time_ < var_135_5 + var_135_6 then
				local var_135_7 = (arg_132_1.time_ - var_135_5) / var_135_6

				if arg_132_1.var_.characterEffect10003ui_story then
					local var_135_8 = Mathf.Lerp(0, 0.5, var_135_7)

					arg_132_1.var_.characterEffect10003ui_story.fillFlat = true
					arg_132_1.var_.characterEffect10003ui_story.fillRatio = var_135_8
				end
			end

			if arg_132_1.time_ >= var_135_5 + var_135_6 and arg_132_1.time_ < var_135_5 + var_135_6 + arg_135_0 and arg_132_1.var_.characterEffect10003ui_story then
				local var_135_9 = 0.5

				arg_132_1.var_.characterEffect10003ui_story.fillFlat = true
				arg_132_1.var_.characterEffect10003ui_story.fillRatio = var_135_9
			end

			local var_135_10 = 0

			if var_135_10 < arg_132_1.time_ and arg_132_1.time_ <= var_135_10 + arg_135_0 then
				arg_132_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_135_11 = 0
			local var_135_12 = 0.625

			if var_135_11 < arg_132_1.time_ and arg_132_1.time_ <= var_135_11 + arg_135_0 then
				arg_132_1.talkMaxDuration = 0
				arg_132_1.dialogCg_.alpha = 1

				arg_132_1.dialog_:SetActive(true)
				SetActive(arg_132_1.leftNameGo_, true)

				local var_135_13 = arg_132_1:FormatText(StoryNameCfg[80].name)

				arg_132_1.leftNameTxt_.text = var_135_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_132_1.leftNameTxt_.transform)

				arg_132_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_132_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_132_1:RecordName(arg_132_1.leftNameTxt_.text)
				SetActive(arg_132_1.iconTrs_.gameObject, false)
				arg_132_1.callingController_:SetSelectedState("normal")

				local var_135_14 = arg_132_1:GetWordFromCfg(106081033)
				local var_135_15 = arg_132_1:FormatText(var_135_14.content)

				arg_132_1.text_.text = var_135_15

				LuaForUtil.ClearLinePrefixSymbol(arg_132_1.text_)

				local var_135_16 = 25
				local var_135_17 = utf8.len(var_135_15)
				local var_135_18 = var_135_16 <= 0 and var_135_12 or var_135_12 * (var_135_17 / var_135_16)

				if var_135_18 > 0 and var_135_12 < var_135_18 then
					arg_132_1.talkMaxDuration = var_135_18

					if var_135_18 + var_135_11 > arg_132_1.duration_ then
						arg_132_1.duration_ = var_135_18 + var_135_11
					end
				end

				arg_132_1.text_.text = var_135_15
				arg_132_1.typewritter.percent = 0

				arg_132_1.typewritter:SetDirty()
				arg_132_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081033", "story_v_out_106081.awb") ~= 0 then
					local var_135_19 = manager.audio:GetVoiceLength("story_v_out_106081", "106081033", "story_v_out_106081.awb") / 1000

					if var_135_19 + var_135_11 > arg_132_1.duration_ then
						arg_132_1.duration_ = var_135_19 + var_135_11
					end

					if var_135_14.prefab_name ~= "" and arg_132_1.actors_[var_135_14.prefab_name] ~= nil then
						local var_135_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_132_1.actors_[var_135_14.prefab_name].transform, "story_v_out_106081", "106081033", "story_v_out_106081.awb")

						arg_132_1:RecordAudio("106081033", var_135_20)
						arg_132_1:RecordAudio("106081033", var_135_20)
					else
						arg_132_1:AudioAction("play", "voice", "story_v_out_106081", "106081033", "story_v_out_106081.awb")
					end

					arg_132_1:RecordHistoryTalkVoice("story_v_out_106081", "106081033", "story_v_out_106081.awb")
				end

				arg_132_1:RecordContent(arg_132_1.text_.text)
			end

			local var_135_21 = math.max(var_135_12, arg_132_1.talkMaxDuration)

			if var_135_11 <= arg_132_1.time_ and arg_132_1.time_ < var_135_11 + var_135_21 then
				arg_132_1.typewritter.percent = (arg_132_1.time_ - var_135_11) / var_135_21

				arg_132_1.typewritter:SetDirty()
			end

			if arg_132_1.time_ >= var_135_11 + var_135_21 and arg_132_1.time_ < var_135_11 + var_135_21 + arg_135_0 then
				arg_132_1.typewritter.percent = 1

				arg_132_1.typewritter:SetDirty()
				arg_132_1:ShowNextGo(true)
			end
		end
	end,
	Play106081034 = function(arg_136_0, arg_136_1)
		arg_136_1.time_ = 0
		arg_136_1.frameCnt_ = 0
		arg_136_1.state_ = "playing"
		arg_136_1.curTalkId_ = 106081034
		arg_136_1.duration_ = 9.13

		local var_136_0 = {
			ja = 8.433,
			ko = 9.133,
			zh = 9.133,
			en = 7.8
		}
		local var_136_1 = manager.audio:GetLocalizationFlag()

		if var_136_0[var_136_1] ~= nil then
			arg_136_1.duration_ = var_136_0[var_136_1]
		end

		SetActive(arg_136_1.tipsGo_, false)

		function arg_136_1.onSingleLineFinish_()
			arg_136_1.onSingleLineUpdate_ = nil
			arg_136_1.onSingleLineFinish_ = nil
			arg_136_1.state_ = "waiting"
		end

		function arg_136_1.playNext_(arg_138_0)
			if arg_138_0 == 1 then
				arg_136_0:Play106081035(arg_136_1)
			end
		end

		function arg_136_1.onSingleLineUpdate_(arg_139_0)
			local var_139_0 = 0

			if var_139_0 < arg_136_1.time_ and arg_136_1.time_ <= var_139_0 + arg_139_0 then
				arg_136_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_139_1 = 0
			local var_139_2 = 0.75

			if var_139_1 < arg_136_1.time_ and arg_136_1.time_ <= var_139_1 + arg_139_0 then
				arg_136_1.talkMaxDuration = 0
				arg_136_1.dialogCg_.alpha = 1

				arg_136_1.dialog_:SetActive(true)
				SetActive(arg_136_1.leftNameGo_, true)

				local var_139_3 = arg_136_1:FormatText(StoryNameCfg[80].name)

				arg_136_1.leftNameTxt_.text = var_139_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_136_1.leftNameTxt_.transform)

				arg_136_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_136_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_136_1:RecordName(arg_136_1.leftNameTxt_.text)
				SetActive(arg_136_1.iconTrs_.gameObject, false)
				arg_136_1.callingController_:SetSelectedState("normal")

				local var_139_4 = arg_136_1:GetWordFromCfg(106081034)
				local var_139_5 = arg_136_1:FormatText(var_139_4.content)

				arg_136_1.text_.text = var_139_5

				LuaForUtil.ClearLinePrefixSymbol(arg_136_1.text_)

				local var_139_6 = 30
				local var_139_7 = utf8.len(var_139_5)
				local var_139_8 = var_139_6 <= 0 and var_139_2 or var_139_2 * (var_139_7 / var_139_6)

				if var_139_8 > 0 and var_139_2 < var_139_8 then
					arg_136_1.talkMaxDuration = var_139_8

					if var_139_8 + var_139_1 > arg_136_1.duration_ then
						arg_136_1.duration_ = var_139_8 + var_139_1
					end
				end

				arg_136_1.text_.text = var_139_5
				arg_136_1.typewritter.percent = 0

				arg_136_1.typewritter:SetDirty()
				arg_136_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081034", "story_v_out_106081.awb") ~= 0 then
					local var_139_9 = manager.audio:GetVoiceLength("story_v_out_106081", "106081034", "story_v_out_106081.awb") / 1000

					if var_139_9 + var_139_1 > arg_136_1.duration_ then
						arg_136_1.duration_ = var_139_9 + var_139_1
					end

					if var_139_4.prefab_name ~= "" and arg_136_1.actors_[var_139_4.prefab_name] ~= nil then
						local var_139_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_136_1.actors_[var_139_4.prefab_name].transform, "story_v_out_106081", "106081034", "story_v_out_106081.awb")

						arg_136_1:RecordAudio("106081034", var_139_10)
						arg_136_1:RecordAudio("106081034", var_139_10)
					else
						arg_136_1:AudioAction("play", "voice", "story_v_out_106081", "106081034", "story_v_out_106081.awb")
					end

					arg_136_1:RecordHistoryTalkVoice("story_v_out_106081", "106081034", "story_v_out_106081.awb")
				end

				arg_136_1:RecordContent(arg_136_1.text_.text)
			end

			local var_139_11 = math.max(var_139_2, arg_136_1.talkMaxDuration)

			if var_139_1 <= arg_136_1.time_ and arg_136_1.time_ < var_139_1 + var_139_11 then
				arg_136_1.typewritter.percent = (arg_136_1.time_ - var_139_1) / var_139_11

				arg_136_1.typewritter:SetDirty()
			end

			if arg_136_1.time_ >= var_139_1 + var_139_11 and arg_136_1.time_ < var_139_1 + var_139_11 + arg_139_0 then
				arg_136_1.typewritter.percent = 1

				arg_136_1.typewritter:SetDirty()
				arg_136_1:ShowNextGo(true)
			end
		end
	end,
	Play106081035 = function(arg_140_0, arg_140_1)
		arg_140_1.time_ = 0
		arg_140_1.frameCnt_ = 0
		arg_140_1.state_ = "playing"
		arg_140_1.curTalkId_ = 106081035
		arg_140_1.duration_ = 10.5

		local var_140_0 = {
			ja = 5.466,
			ko = 5.166,
			zh = 10.5,
			en = 6.366
		}
		local var_140_1 = manager.audio:GetLocalizationFlag()

		if var_140_0[var_140_1] ~= nil then
			arg_140_1.duration_ = var_140_0[var_140_1]
		end

		SetActive(arg_140_1.tipsGo_, false)

		function arg_140_1.onSingleLineFinish_()
			arg_140_1.onSingleLineUpdate_ = nil
			arg_140_1.onSingleLineFinish_ = nil
			arg_140_1.state_ = "waiting"
			arg_140_1.auto_ = false
		end

		function arg_140_1.playNext_(arg_142_0)
			arg_140_1.onStoryFinished_()
		end

		function arg_140_1.onSingleLineUpdate_(arg_143_0)
			local var_143_0 = 0

			if var_143_0 < arg_140_1.time_ and arg_140_1.time_ <= var_143_0 + arg_143_0 then
				arg_140_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/story10004/story10004action/10004action5_1")
			end

			local var_143_1 = 0

			if var_143_1 < arg_140_1.time_ and arg_140_1.time_ <= var_143_1 + arg_143_0 then
				arg_140_1:PlayTimeline("10004ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_143_2 = 0
			local var_143_3 = 0.65

			if var_143_2 < arg_140_1.time_ and arg_140_1.time_ <= var_143_2 + arg_143_0 then
				arg_140_1.talkMaxDuration = 0
				arg_140_1.dialogCg_.alpha = 1

				arg_140_1.dialog_:SetActive(true)
				SetActive(arg_140_1.leftNameGo_, true)

				local var_143_4 = arg_140_1:FormatText(StoryNameCfg[80].name)

				arg_140_1.leftNameTxt_.text = var_143_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_140_1.leftNameTxt_.transform)

				arg_140_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_140_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_140_1:RecordName(arg_140_1.leftNameTxt_.text)
				SetActive(arg_140_1.iconTrs_.gameObject, false)
				arg_140_1.callingController_:SetSelectedState("normal")

				local var_143_5 = arg_140_1:GetWordFromCfg(106081035)
				local var_143_6 = arg_140_1:FormatText(var_143_5.content)

				arg_140_1.text_.text = var_143_6

				LuaForUtil.ClearLinePrefixSymbol(arg_140_1.text_)

				local var_143_7 = 26
				local var_143_8 = utf8.len(var_143_6)
				local var_143_9 = var_143_7 <= 0 and var_143_3 or var_143_3 * (var_143_8 / var_143_7)

				if var_143_9 > 0 and var_143_3 < var_143_9 then
					arg_140_1.talkMaxDuration = var_143_9

					if var_143_9 + var_143_2 > arg_140_1.duration_ then
						arg_140_1.duration_ = var_143_9 + var_143_2
					end
				end

				arg_140_1.text_.text = var_143_6
				arg_140_1.typewritter.percent = 0

				arg_140_1.typewritter:SetDirty()
				arg_140_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_106081", "106081035", "story_v_out_106081.awb") ~= 0 then
					local var_143_10 = manager.audio:GetVoiceLength("story_v_out_106081", "106081035", "story_v_out_106081.awb") / 1000

					if var_143_10 + var_143_2 > arg_140_1.duration_ then
						arg_140_1.duration_ = var_143_10 + var_143_2
					end

					if var_143_5.prefab_name ~= "" and arg_140_1.actors_[var_143_5.prefab_name] ~= nil then
						local var_143_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_140_1.actors_[var_143_5.prefab_name].transform, "story_v_out_106081", "106081035", "story_v_out_106081.awb")

						arg_140_1:RecordAudio("106081035", var_143_11)
						arg_140_1:RecordAudio("106081035", var_143_11)
					else
						arg_140_1:AudioAction("play", "voice", "story_v_out_106081", "106081035", "story_v_out_106081.awb")
					end

					arg_140_1:RecordHistoryTalkVoice("story_v_out_106081", "106081035", "story_v_out_106081.awb")
				end

				arg_140_1:RecordContent(arg_140_1.text_.text)
			end

			local var_143_12 = math.max(var_143_3, arg_140_1.talkMaxDuration)

			if var_143_2 <= arg_140_1.time_ and arg_140_1.time_ < var_143_2 + var_143_12 then
				arg_140_1.typewritter.percent = (arg_140_1.time_ - var_143_2) / var_143_12

				arg_140_1.typewritter:SetDirty()
			end

			if arg_140_1.time_ >= var_143_2 + var_143_12 and arg_140_1.time_ < var_143_2 + var_143_12 + arg_143_0 then
				arg_140_1.typewritter.percent = 1

				arg_140_1.typewritter:SetDirty()
				arg_140_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/C07_1"
	},
	voices = {
		"story_v_out_106081.awb"
	}
}
