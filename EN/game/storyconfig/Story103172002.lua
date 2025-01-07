return {
	Play317202001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317202001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play317202002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K09f"

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
				local var_4_5 = arg_1_1.bgs_.K09f

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
					if iter_4_0 ~= "K09f" then
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

			local var_4_22 = 0
			local var_4_23 = 0.6

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_26 = ""
				local var_4_27 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_27 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_27 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_27

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_27
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

			local var_4_28 = 0.733333333333333
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo.awb")

				local var_4_32 = ""
				local var_4_33 = manager.audio:GetAudioName("bgm_activity_2_6_story_karasugo_tokoyo", "bgm_activity_2_6_story_karasugo_tokoyo")

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

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.9

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_36 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_36:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_37 = arg_1_1:GetWordFromCfg(317202001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 36
				local var_4_40 = utf8.len(var_4_38)
				local var_4_41 = var_4_39 <= 0 and var_4_35 or var_4_35 * (var_4_40 / var_4_39)

				if var_4_41 > 0 and var_4_35 < var_4_41 then
					arg_1_1.talkMaxDuration = var_4_41
					var_4_34 = var_4_34 + 0.3

					if var_4_41 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_34
					end
				end

				arg_1_1.text_.text = var_4_38
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_42 = var_4_34 + 0.3
			local var_4_43 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_43 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_42) / var_4_43

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_42 + var_4_43 and arg_1_1.time_ < var_4_42 + var_4_43 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play317202002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 317202002
		arg_9_1.duration_ = 5

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play317202003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = 0
			local var_12_1 = 1.325

			if var_12_0 < arg_9_1.time_ and arg_9_1.time_ <= var_12_0 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, false)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_2 = arg_9_1:GetWordFromCfg(317202002)
				local var_12_3 = arg_9_1:FormatText(var_12_2.content)

				arg_9_1.text_.text = var_12_3

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_4 = 53
				local var_12_5 = utf8.len(var_12_3)
				local var_12_6 = var_12_4 <= 0 and var_12_1 or var_12_1 * (var_12_5 / var_12_4)

				if var_12_6 > 0 and var_12_1 < var_12_6 then
					arg_9_1.talkMaxDuration = var_12_6

					if var_12_6 + var_12_0 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_6 + var_12_0
					end
				end

				arg_9_1.text_.text = var_12_3
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)
				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_7 = math.max(var_12_1, arg_9_1.talkMaxDuration)

			if var_12_0 <= arg_9_1.time_ and arg_9_1.time_ < var_12_0 + var_12_7 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_0) / var_12_7

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_0 + var_12_7 and arg_9_1.time_ < var_12_0 + var_12_7 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play317202003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 317202003
		arg_13_1.duration_ = 4.07

		local var_13_0 = {
			zh = 3.6,
			ja = 4.066
		}
		local var_13_1 = manager.audio:GetLocalizationFlag()

		if var_13_0[var_13_1] ~= nil then
			arg_13_1.duration_ = var_13_0[var_13_1]
		end

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play317202004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = "1015ui_story"

			if arg_13_1.actors_[var_16_0] == nil then
				local var_16_1 = Object.Instantiate(Asset.Load("Char/" .. var_16_0), arg_13_1.stage_.transform)

				var_16_1.name = var_16_0
				var_16_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_13_1.actors_[var_16_0] = var_16_1

				local var_16_2 = var_16_1:GetComponentInChildren(typeof(CharacterEffect))

				var_16_2.enabled = true

				local var_16_3 = GameObjectTools.GetOrAddComponent(var_16_1, typeof(DynamicBoneHelper))

				if var_16_3 then
					var_16_3:EnableDynamicBone(false)
				end

				arg_13_1:ShowWeapon(var_16_2.transform, false)

				arg_13_1.var_[var_16_0 .. "Animator"] = var_16_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_13_1.var_[var_16_0 .. "Animator"].applyRootMotion = true
				arg_13_1.var_[var_16_0 .. "LipSync"] = var_16_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_16_4 = arg_13_1.actors_["1015ui_story"].transform
			local var_16_5 = 0

			if var_16_5 < arg_13_1.time_ and arg_13_1.time_ <= var_16_5 + arg_16_0 then
				arg_13_1.var_.moveOldPos1015ui_story = var_16_4.localPosition
			end

			local var_16_6 = 0.001

			if var_16_5 <= arg_13_1.time_ and arg_13_1.time_ < var_16_5 + var_16_6 then
				local var_16_7 = (arg_13_1.time_ - var_16_5) / var_16_6
				local var_16_8 = Vector3.New(0, -1.15, -6.2)

				var_16_4.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos1015ui_story, var_16_8, var_16_7)

				local var_16_9 = manager.ui.mainCamera.transform.position - var_16_4.position

				var_16_4.forward = Vector3.New(var_16_9.x, var_16_9.y, var_16_9.z)

				local var_16_10 = var_16_4.localEulerAngles

				var_16_10.z = 0
				var_16_10.x = 0
				var_16_4.localEulerAngles = var_16_10
			end

			if arg_13_1.time_ >= var_16_5 + var_16_6 and arg_13_1.time_ < var_16_5 + var_16_6 + arg_16_0 then
				var_16_4.localPosition = Vector3.New(0, -1.15, -6.2)

				local var_16_11 = manager.ui.mainCamera.transform.position - var_16_4.position

				var_16_4.forward = Vector3.New(var_16_11.x, var_16_11.y, var_16_11.z)

				local var_16_12 = var_16_4.localEulerAngles

				var_16_12.z = 0
				var_16_12.x = 0
				var_16_4.localEulerAngles = var_16_12
			end

			local var_16_13 = arg_13_1.actors_["1015ui_story"]
			local var_16_14 = 0

			if var_16_14 < arg_13_1.time_ and arg_13_1.time_ <= var_16_14 + arg_16_0 and arg_13_1.var_.characterEffect1015ui_story == nil then
				arg_13_1.var_.characterEffect1015ui_story = var_16_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_16_15 = 0.200000002980232

			if var_16_14 <= arg_13_1.time_ and arg_13_1.time_ < var_16_14 + var_16_15 then
				local var_16_16 = (arg_13_1.time_ - var_16_14) / var_16_15

				if arg_13_1.var_.characterEffect1015ui_story then
					arg_13_1.var_.characterEffect1015ui_story.fillFlat = false
				end
			end

			if arg_13_1.time_ >= var_16_14 + var_16_15 and arg_13_1.time_ < var_16_14 + var_16_15 + arg_16_0 and arg_13_1.var_.characterEffect1015ui_story then
				arg_13_1.var_.characterEffect1015ui_story.fillFlat = false
			end

			local var_16_17 = 0

			if var_16_17 < arg_13_1.time_ and arg_13_1.time_ <= var_16_17 + arg_16_0 then
				arg_13_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/story1015/story1015action/1015action1_1")
			end

			local var_16_18 = 0

			if var_16_18 < arg_13_1.time_ and arg_13_1.time_ <= var_16_18 + arg_16_0 then
				arg_13_1:PlayTimeline("1015ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_16_19 = 0
			local var_16_20 = 0.375

			if var_16_19 < arg_13_1.time_ and arg_13_1.time_ <= var_16_19 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_21 = arg_13_1:FormatText(StoryNameCfg[479].name)

				arg_13_1.leftNameTxt_.text = var_16_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_22 = arg_13_1:GetWordFromCfg(317202003)
				local var_16_23 = arg_13_1:FormatText(var_16_22.content)

				arg_13_1.text_.text = var_16_23

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_24 = 15
				local var_16_25 = utf8.len(var_16_23)
				local var_16_26 = var_16_24 <= 0 and var_16_20 or var_16_20 * (var_16_25 / var_16_24)

				if var_16_26 > 0 and var_16_20 < var_16_26 then
					arg_13_1.talkMaxDuration = var_16_26

					if var_16_26 + var_16_19 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_26 + var_16_19
					end
				end

				arg_13_1.text_.text = var_16_23
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317202", "317202003", "story_v_out_317202.awb") ~= 0 then
					local var_16_27 = manager.audio:GetVoiceLength("story_v_out_317202", "317202003", "story_v_out_317202.awb") / 1000

					if var_16_27 + var_16_19 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_27 + var_16_19
					end

					if var_16_22.prefab_name ~= "" and arg_13_1.actors_[var_16_22.prefab_name] ~= nil then
						local var_16_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_22.prefab_name].transform, "story_v_out_317202", "317202003", "story_v_out_317202.awb")

						arg_13_1:RecordAudio("317202003", var_16_28)
						arg_13_1:RecordAudio("317202003", var_16_28)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_317202", "317202003", "story_v_out_317202.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_317202", "317202003", "story_v_out_317202.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_29 = math.max(var_16_20, arg_13_1.talkMaxDuration)

			if var_16_19 <= arg_13_1.time_ and arg_13_1.time_ < var_16_19 + var_16_29 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_19) / var_16_29

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_19 + var_16_29 and arg_13_1.time_ < var_16_19 + var_16_29 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play317202004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 317202004
		arg_17_1.duration_ = 5

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play317202005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["1015ui_story"].transform
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 then
				arg_17_1.var_.moveOldPos1015ui_story = var_20_0.localPosition
			end

			local var_20_2 = 0.001

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_2 then
				local var_20_3 = (arg_17_1.time_ - var_20_1) / var_20_2
				local var_20_4 = Vector3.New(0, 100, 0)

				var_20_0.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos1015ui_story, var_20_4, var_20_3)

				local var_20_5 = manager.ui.mainCamera.transform.position - var_20_0.position

				var_20_0.forward = Vector3.New(var_20_5.x, var_20_5.y, var_20_5.z)

				local var_20_6 = var_20_0.localEulerAngles

				var_20_6.z = 0
				var_20_6.x = 0
				var_20_0.localEulerAngles = var_20_6
			end

			if arg_17_1.time_ >= var_20_1 + var_20_2 and arg_17_1.time_ < var_20_1 + var_20_2 + arg_20_0 then
				var_20_0.localPosition = Vector3.New(0, 100, 0)

				local var_20_7 = manager.ui.mainCamera.transform.position - var_20_0.position

				var_20_0.forward = Vector3.New(var_20_7.x, var_20_7.y, var_20_7.z)

				local var_20_8 = var_20_0.localEulerAngles

				var_20_8.z = 0
				var_20_8.x = 0
				var_20_0.localEulerAngles = var_20_8
			end

			local var_20_9 = arg_17_1.actors_["1015ui_story"]
			local var_20_10 = 0

			if var_20_10 < arg_17_1.time_ and arg_17_1.time_ <= var_20_10 + arg_20_0 and arg_17_1.var_.characterEffect1015ui_story == nil then
				arg_17_1.var_.characterEffect1015ui_story = var_20_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_20_11 = 0.200000002980232

			if var_20_10 <= arg_17_1.time_ and arg_17_1.time_ < var_20_10 + var_20_11 then
				local var_20_12 = (arg_17_1.time_ - var_20_10) / var_20_11

				if arg_17_1.var_.characterEffect1015ui_story then
					local var_20_13 = Mathf.Lerp(0, 0.5, var_20_12)

					arg_17_1.var_.characterEffect1015ui_story.fillFlat = true
					arg_17_1.var_.characterEffect1015ui_story.fillRatio = var_20_13
				end
			end

			if arg_17_1.time_ >= var_20_10 + var_20_11 and arg_17_1.time_ < var_20_10 + var_20_11 + arg_20_0 and arg_17_1.var_.characterEffect1015ui_story then
				local var_20_14 = 0.5

				arg_17_1.var_.characterEffect1015ui_story.fillFlat = true
				arg_17_1.var_.characterEffect1015ui_story.fillRatio = var_20_14
			end

			local var_20_15 = 0
			local var_20_16 = 0.6

			if var_20_15 < arg_17_1.time_ and arg_17_1.time_ <= var_20_15 + arg_20_0 then
				local var_20_17 = "play"
				local var_20_18 = "effect"

				arg_17_1:AudioAction(var_20_17, var_20_18, "se_story_127", "se_story_127_thunder", "")
			end

			local var_20_19 = 0
			local var_20_20 = 0.775

			if var_20_19 < arg_17_1.time_ and arg_17_1.time_ <= var_20_19 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, false)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_21 = arg_17_1:GetWordFromCfg(317202004)
				local var_20_22 = arg_17_1:FormatText(var_20_21.content)

				arg_17_1.text_.text = var_20_22

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_23 = 31
				local var_20_24 = utf8.len(var_20_22)
				local var_20_25 = var_20_23 <= 0 and var_20_20 or var_20_20 * (var_20_24 / var_20_23)

				if var_20_25 > 0 and var_20_20 < var_20_25 then
					arg_17_1.talkMaxDuration = var_20_25

					if var_20_25 + var_20_19 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_25 + var_20_19
					end
				end

				arg_17_1.text_.text = var_20_22
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_26 = math.max(var_20_20, arg_17_1.talkMaxDuration)

			if var_20_19 <= arg_17_1.time_ and arg_17_1.time_ < var_20_19 + var_20_26 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_19) / var_20_26

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_19 + var_20_26 and arg_17_1.time_ < var_20_19 + var_20_26 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play317202005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 317202005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play317202006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.925

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, false)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_2 = arg_21_1:GetWordFromCfg(317202005)
				local var_24_3 = arg_21_1:FormatText(var_24_2.content)

				arg_21_1.text_.text = var_24_3

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_4 = 37
				local var_24_5 = utf8.len(var_24_3)
				local var_24_6 = var_24_4 <= 0 and var_24_1 or var_24_1 * (var_24_5 / var_24_4)

				if var_24_6 > 0 and var_24_1 < var_24_6 then
					arg_21_1.talkMaxDuration = var_24_6

					if var_24_6 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_6 + var_24_0
					end
				end

				arg_21_1.text_.text = var_24_3
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_7 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_7 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_7

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_7 and arg_21_1.time_ < var_24_0 + var_24_7 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play317202006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 317202006
		arg_25_1.duration_ = 1.37

		local var_25_0 = {
			zh = 1.1,
			ja = 1.366
		}
		local var_25_1 = manager.audio:GetLocalizationFlag()

		if var_25_0[var_25_1] ~= nil then
			arg_25_1.duration_ = var_25_0[var_25_1]
		end

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play317202007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = "1093ui_story"

			if arg_25_1.actors_[var_28_0] == nil then
				local var_28_1 = Object.Instantiate(Asset.Load("Char/" .. var_28_0), arg_25_1.stage_.transform)

				var_28_1.name = var_28_0
				var_28_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_25_1.actors_[var_28_0] = var_28_1

				local var_28_2 = var_28_1:GetComponentInChildren(typeof(CharacterEffect))

				var_28_2.enabled = true

				local var_28_3 = GameObjectTools.GetOrAddComponent(var_28_1, typeof(DynamicBoneHelper))

				if var_28_3 then
					var_28_3:EnableDynamicBone(false)
				end

				arg_25_1:ShowWeapon(var_28_2.transform, false)

				arg_25_1.var_[var_28_0 .. "Animator"] = var_28_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_25_1.var_[var_28_0 .. "Animator"].applyRootMotion = true
				arg_25_1.var_[var_28_0 .. "LipSync"] = var_28_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_28_4 = arg_25_1.actors_["1093ui_story"].transform
			local var_28_5 = 0

			if var_28_5 < arg_25_1.time_ and arg_25_1.time_ <= var_28_5 + arg_28_0 then
				arg_25_1.var_.moveOldPos1093ui_story = var_28_4.localPosition
			end

			local var_28_6 = 0.001

			if var_28_5 <= arg_25_1.time_ and arg_25_1.time_ < var_28_5 + var_28_6 then
				local var_28_7 = (arg_25_1.time_ - var_28_5) / var_28_6
				local var_28_8 = Vector3.New(0, -1.11, -5.88)

				var_28_4.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1093ui_story, var_28_8, var_28_7)

				local var_28_9 = manager.ui.mainCamera.transform.position - var_28_4.position

				var_28_4.forward = Vector3.New(var_28_9.x, var_28_9.y, var_28_9.z)

				local var_28_10 = var_28_4.localEulerAngles

				var_28_10.z = 0
				var_28_10.x = 0
				var_28_4.localEulerAngles = var_28_10
			end

			if arg_25_1.time_ >= var_28_5 + var_28_6 and arg_25_1.time_ < var_28_5 + var_28_6 + arg_28_0 then
				var_28_4.localPosition = Vector3.New(0, -1.11, -5.88)

				local var_28_11 = manager.ui.mainCamera.transform.position - var_28_4.position

				var_28_4.forward = Vector3.New(var_28_11.x, var_28_11.y, var_28_11.z)

				local var_28_12 = var_28_4.localEulerAngles

				var_28_12.z = 0
				var_28_12.x = 0
				var_28_4.localEulerAngles = var_28_12
			end

			local var_28_13 = arg_25_1.actors_["1093ui_story"]
			local var_28_14 = 0

			if var_28_14 < arg_25_1.time_ and arg_25_1.time_ <= var_28_14 + arg_28_0 and arg_25_1.var_.characterEffect1093ui_story == nil then
				arg_25_1.var_.characterEffect1093ui_story = var_28_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_28_15 = 0.200000002980232

			if var_28_14 <= arg_25_1.time_ and arg_25_1.time_ < var_28_14 + var_28_15 then
				local var_28_16 = (arg_25_1.time_ - var_28_14) / var_28_15

				if arg_25_1.var_.characterEffect1093ui_story then
					arg_25_1.var_.characterEffect1093ui_story.fillFlat = false
				end
			end

			if arg_25_1.time_ >= var_28_14 + var_28_15 and arg_25_1.time_ < var_28_14 + var_28_15 + arg_28_0 and arg_25_1.var_.characterEffect1093ui_story then
				arg_25_1.var_.characterEffect1093ui_story.fillFlat = false
			end

			local var_28_17 = 0

			if var_28_17 < arg_25_1.time_ and arg_25_1.time_ <= var_28_17 + arg_28_0 then
				arg_25_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/1093/1093action/1093action1_1")
			end

			local var_28_18 = 0

			if var_28_18 < arg_25_1.time_ and arg_25_1.time_ <= var_28_18 + arg_28_0 then
				arg_25_1:PlayTimeline("1093ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_28_19 = 0
			local var_28_20 = 0.125

			if var_28_19 < arg_25_1.time_ and arg_25_1.time_ <= var_28_19 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_21 = arg_25_1:FormatText(StoryNameCfg[73].name)

				arg_25_1.leftNameTxt_.text = var_28_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_22 = arg_25_1:GetWordFromCfg(317202006)
				local var_28_23 = arg_25_1:FormatText(var_28_22.content)

				arg_25_1.text_.text = var_28_23

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_24 = 5
				local var_28_25 = utf8.len(var_28_23)
				local var_28_26 = var_28_24 <= 0 and var_28_20 or var_28_20 * (var_28_25 / var_28_24)

				if var_28_26 > 0 and var_28_20 < var_28_26 then
					arg_25_1.talkMaxDuration = var_28_26

					if var_28_26 + var_28_19 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_26 + var_28_19
					end
				end

				arg_25_1.text_.text = var_28_23
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317202", "317202006", "story_v_out_317202.awb") ~= 0 then
					local var_28_27 = manager.audio:GetVoiceLength("story_v_out_317202", "317202006", "story_v_out_317202.awb") / 1000

					if var_28_27 + var_28_19 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_27 + var_28_19
					end

					if var_28_22.prefab_name ~= "" and arg_25_1.actors_[var_28_22.prefab_name] ~= nil then
						local var_28_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_22.prefab_name].transform, "story_v_out_317202", "317202006", "story_v_out_317202.awb")

						arg_25_1:RecordAudio("317202006", var_28_28)
						arg_25_1:RecordAudio("317202006", var_28_28)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_317202", "317202006", "story_v_out_317202.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_317202", "317202006", "story_v_out_317202.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_29 = math.max(var_28_20, arg_25_1.talkMaxDuration)

			if var_28_19 <= arg_25_1.time_ and arg_25_1.time_ < var_28_19 + var_28_29 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_19) / var_28_29

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_19 + var_28_29 and arg_25_1.time_ < var_28_19 + var_28_29 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play317202007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 317202007
		arg_29_1.duration_ = 2

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
			arg_29_1.auto_ = false
		end

		function arg_29_1.playNext_(arg_31_0)
			arg_29_1.onStoryFinished_()
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1093ui_story"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos1093ui_story = var_32_0.localPosition
			end

			local var_32_2 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2
				local var_32_4 = Vector3.New(0, 100, 0)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1093ui_story, var_32_4, var_32_3)

				local var_32_5 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_5.x, var_32_5.y, var_32_5.z)

				local var_32_6 = var_32_0.localEulerAngles

				var_32_6.z = 0
				var_32_6.x = 0
				var_32_0.localEulerAngles = var_32_6
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(0, 100, 0)

				local var_32_7 = manager.ui.mainCamera.transform.position - var_32_0.position

				var_32_0.forward = Vector3.New(var_32_7.x, var_32_7.y, var_32_7.z)

				local var_32_8 = var_32_0.localEulerAngles

				var_32_8.z = 0
				var_32_8.x = 0
				var_32_0.localEulerAngles = var_32_8
			end

			local var_32_9 = arg_29_1.actors_["1093ui_story"]
			local var_32_10 = 0

			if var_32_10 < arg_29_1.time_ and arg_29_1.time_ <= var_32_10 + arg_32_0 and arg_29_1.var_.characterEffect1093ui_story == nil then
				arg_29_1.var_.characterEffect1093ui_story = var_32_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_11 = 0.200000002980232

			if var_32_10 <= arg_29_1.time_ and arg_29_1.time_ < var_32_10 + var_32_11 then
				local var_32_12 = (arg_29_1.time_ - var_32_10) / var_32_11

				if arg_29_1.var_.characterEffect1093ui_story then
					local var_32_13 = Mathf.Lerp(0, 0.5, var_32_12)

					arg_29_1.var_.characterEffect1093ui_story.fillFlat = true
					arg_29_1.var_.characterEffect1093ui_story.fillRatio = var_32_13
				end
			end

			if arg_29_1.time_ >= var_32_10 + var_32_11 and arg_29_1.time_ < var_32_10 + var_32_11 + arg_32_0 and arg_29_1.var_.characterEffect1093ui_story then
				local var_32_14 = 0.5

				arg_29_1.var_.characterEffect1093ui_story.fillFlat = true
				arg_29_1.var_.characterEffect1093ui_story.fillRatio = var_32_14
			end

			local var_32_15 = "1199ui_story"

			if arg_29_1.actors_[var_32_15] == nil then
				local var_32_16 = Object.Instantiate(Asset.Load("Char/" .. var_32_15), arg_29_1.stage_.transform)

				var_32_16.name = var_32_15
				var_32_16.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.actors_[var_32_15] = var_32_16

				local var_32_17 = var_32_16:GetComponentInChildren(typeof(CharacterEffect))

				var_32_17.enabled = true

				local var_32_18 = GameObjectTools.GetOrAddComponent(var_32_16, typeof(DynamicBoneHelper))

				if var_32_18 then
					var_32_18:EnableDynamicBone(false)
				end

				arg_29_1:ShowWeapon(var_32_17.transform, false)

				arg_29_1.var_[var_32_15 .. "Animator"] = var_32_17.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_29_1.var_[var_32_15 .. "Animator"].applyRootMotion = true
				arg_29_1.var_[var_32_15 .. "LipSync"] = var_32_17.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_32_19 = arg_29_1.actors_["1199ui_story"].transform
			local var_32_20 = 0

			if var_32_20 < arg_29_1.time_ and arg_29_1.time_ <= var_32_20 + arg_32_0 then
				arg_29_1.var_.moveOldPos1199ui_story = var_32_19.localPosition
			end

			local var_32_21 = 0.001

			if var_32_20 <= arg_29_1.time_ and arg_29_1.time_ < var_32_20 + var_32_21 then
				local var_32_22 = (arg_29_1.time_ - var_32_20) / var_32_21
				local var_32_23 = Vector3.New(0, -1.08, -5.9)

				var_32_19.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1199ui_story, var_32_23, var_32_22)

				local var_32_24 = manager.ui.mainCamera.transform.position - var_32_19.position

				var_32_19.forward = Vector3.New(var_32_24.x, var_32_24.y, var_32_24.z)

				local var_32_25 = var_32_19.localEulerAngles

				var_32_25.z = 0
				var_32_25.x = 0
				var_32_19.localEulerAngles = var_32_25
			end

			if arg_29_1.time_ >= var_32_20 + var_32_21 and arg_29_1.time_ < var_32_20 + var_32_21 + arg_32_0 then
				var_32_19.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_32_26 = manager.ui.mainCamera.transform.position - var_32_19.position

				var_32_19.forward = Vector3.New(var_32_26.x, var_32_26.y, var_32_26.z)

				local var_32_27 = var_32_19.localEulerAngles

				var_32_27.z = 0
				var_32_27.x = 0
				var_32_19.localEulerAngles = var_32_27
			end

			local var_32_28 = arg_29_1.actors_["1199ui_story"]
			local var_32_29 = 0

			if var_32_29 < arg_29_1.time_ and arg_29_1.time_ <= var_32_29 + arg_32_0 and arg_29_1.var_.characterEffect1199ui_story == nil then
				arg_29_1.var_.characterEffect1199ui_story = var_32_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_30 = 0.200000002980232

			if var_32_29 <= arg_29_1.time_ and arg_29_1.time_ < var_32_29 + var_32_30 then
				local var_32_31 = (arg_29_1.time_ - var_32_29) / var_32_30

				if arg_29_1.var_.characterEffect1199ui_story then
					arg_29_1.var_.characterEffect1199ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_29 + var_32_30 and arg_29_1.time_ < var_32_29 + var_32_30 + arg_32_0 and arg_29_1.var_.characterEffect1199ui_story then
				arg_29_1.var_.characterEffect1199ui_story.fillFlat = false
			end

			local var_32_32 = 0

			if var_32_32 < arg_29_1.time_ and arg_29_1.time_ <= var_32_32 + arg_32_0 then
				arg_29_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/1099/1099action/1099action1_1")
			end

			local var_32_33 = 0

			if var_32_33 < arg_29_1.time_ and arg_29_1.time_ <= var_32_33 + arg_32_0 then
				arg_29_1:PlayTimeline("1199ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_32_34 = 0
			local var_32_35 = 0.1

			if var_32_34 < arg_29_1.time_ and arg_29_1.time_ <= var_32_34 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_36 = arg_29_1:FormatText(StoryNameCfg[84].name)

				arg_29_1.leftNameTxt_.text = var_32_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_37 = arg_29_1:GetWordFromCfg(317202007)
				local var_32_38 = arg_29_1:FormatText(var_32_37.content)

				arg_29_1.text_.text = var_32_38

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_39 = 4
				local var_32_40 = utf8.len(var_32_38)
				local var_32_41 = var_32_39 <= 0 and var_32_35 or var_32_35 * (var_32_40 / var_32_39)

				if var_32_41 > 0 and var_32_35 < var_32_41 then
					arg_29_1.talkMaxDuration = var_32_41

					if var_32_41 + var_32_34 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_41 + var_32_34
					end
				end

				arg_29_1.text_.text = var_32_38
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317202", "317202007", "story_v_out_317202.awb") ~= 0 then
					local var_32_42 = manager.audio:GetVoiceLength("story_v_out_317202", "317202007", "story_v_out_317202.awb") / 1000

					if var_32_42 + var_32_34 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_42 + var_32_34
					end

					if var_32_37.prefab_name ~= "" and arg_29_1.actors_[var_32_37.prefab_name] ~= nil then
						local var_32_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_37.prefab_name].transform, "story_v_out_317202", "317202007", "story_v_out_317202.awb")

						arg_29_1:RecordAudio("317202007", var_32_43)
						arg_29_1:RecordAudio("317202007", var_32_43)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_317202", "317202007", "story_v_out_317202.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_317202", "317202007", "story_v_out_317202.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_44 = math.max(var_32_35, arg_29_1.talkMaxDuration)

			if var_32_34 <= arg_29_1.time_ and arg_29_1.time_ < var_32_34 + var_32_44 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_34) / var_32_44

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_34 + var_32_44 and arg_29_1.time_ < var_32_34 + var_32_44 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K09f"
	},
	voices = {
		"story_v_out_317202.awb"
	}
}
