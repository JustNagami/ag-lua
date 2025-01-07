return {
	Play910601001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 910601001
		arg_1_1.duration_ = 7.4

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play910601002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "B13"

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
				local var_4_5 = arg_1_1.bgs_.B13

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
					if iter_4_0 ~= "B13" then
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

			local var_4_22 = "1084ui_story"

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

			local var_4_26 = arg_1_1.actors_["1084ui_story"].transform
			local var_4_27 = 2

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPos1084ui_story = var_4_26.localPosition

				local var_4_28 = "1084ui_story"

				arg_1_1:ShowWeapon(arg_1_1.var_[var_4_28 .. "Animator"].transform, false)
			end

			local var_4_29 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_29 then
				local var_4_30 = (arg_1_1.time_ - var_4_27) / var_4_29
				local var_4_31 = Vector3.New(0, -0.97, -6)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos1084ui_story, var_4_31, var_4_30)

				local var_4_32 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_32.x, var_4_32.y, var_4_32.z)

				local var_4_33 = var_4_26.localEulerAngles

				var_4_33.z = 0
				var_4_33.x = 0
				var_4_26.localEulerAngles = var_4_33
			end

			if arg_1_1.time_ >= var_4_27 + var_4_29 and arg_1_1.time_ < var_4_27 + var_4_29 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, -0.97, -6)

				local var_4_34 = manager.ui.mainCamera.transform.position - var_4_26.position

				var_4_26.forward = Vector3.New(var_4_34.x, var_4_34.y, var_4_34.z)

				local var_4_35 = var_4_26.localEulerAngles

				var_4_35.z = 0
				var_4_35.x = 0
				var_4_26.localEulerAngles = var_4_35
			end

			local var_4_36 = arg_1_1.actors_["1084ui_story"]
			local var_4_37 = 2

			if var_4_37 < arg_1_1.time_ and arg_1_1.time_ <= var_4_37 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story == nil then
				arg_1_1.var_.characterEffect1084ui_story = var_4_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_4_38 = 0.200000002980232

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 then
				local var_4_39 = (arg_1_1.time_ - var_4_37) / var_4_38

				if arg_1_1.var_.characterEffect1084ui_story then
					arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 and arg_1_1.var_.characterEffect1084ui_story then
				arg_1_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_4_40 = 2

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_1")
			end

			local var_4_41 = 2

			if var_4_41 < arg_1_1.time_ and arg_1_1.time_ <= var_4_41 + arg_4_0 then
				arg_1_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_4_42 = 0

			arg_1_1.isInRecall_ = false

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1.screenFilterGo_:SetActive(true)

				arg_1_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")

				for iter_4_2, iter_4_3 in pairs(arg_1_1.actors_) do
					local var_4_43 = iter_4_3:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_4_4, iter_4_5 in ipairs(var_4_43) do
						if iter_4_5.color.r > 0.51 then
							iter_4_5.color = Color.New(1, 1, 1)
						else
							iter_4_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end
			end

			local var_4_44 = 2

			if var_4_42 <= arg_1_1.time_ and arg_1_1.time_ < var_4_42 + var_4_44 then
				local var_4_45 = (arg_1_1.time_ - var_4_42) / var_4_44

				arg_1_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_4_45)
			end

			if arg_1_1.time_ >= var_4_42 + var_4_44 and arg_1_1.time_ < var_4_42 + var_4_44 + arg_4_0 then
				arg_1_1.screenFilterEffect_.weight = 1
			end

			local var_4_46 = 0
			local var_4_47 = 0.633333333333333

			if var_4_46 < arg_1_1.time_ and arg_1_1.time_ <= var_4_46 + arg_4_0 then
				local var_4_48 = "play"
				local var_4_49 = "music"

				arg_1_1:AudioAction(var_4_48, var_4_49, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_50 = ""
				local var_4_51 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_51 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_51 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_51

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_51
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

			local var_4_52 = 2
			local var_4_53 = 0.825

			if var_4_52 < arg_1_1.time_ and arg_1_1.time_ <= var_4_52 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_54 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_54:setOnUpdate(LuaHelper.FloatAction(function(arg_6_0)
					arg_1_1.dialogCg_.alpha = arg_6_0
				end))
				var_4_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_55 = arg_1_1:FormatText(StoryNameCfg[6].name)

				arg_1_1.leftNameTxt_.text = var_4_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_56 = arg_1_1:GetWordFromCfg(910601001)
				local var_4_57 = arg_1_1:FormatText(var_4_56.content)

				arg_1_1.text_.text = var_4_57

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_58 = 33
				local var_4_59 = utf8.len(var_4_57)
				local var_4_60 = var_4_58 <= 0 and var_4_53 or var_4_53 * (var_4_59 / var_4_58)

				if var_4_60 > 0 and var_4_53 < var_4_60 then
					arg_1_1.talkMaxDuration = var_4_60
					var_4_52 = var_4_52 + 0.3

					if var_4_60 + var_4_52 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_52
					end
				end

				arg_1_1.text_.text = var_4_57
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601001", "story_v_out_910601.awb") ~= 0 then
					local var_4_61 = manager.audio:GetVoiceLength("story_v_out_910601", "910601001", "story_v_out_910601.awb") / 1000

					if var_4_61 + var_4_52 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_61 + var_4_52
					end

					if var_4_56.prefab_name ~= "" and arg_1_1.actors_[var_4_56.prefab_name] ~= nil then
						local var_4_62 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_56.prefab_name].transform, "story_v_out_910601", "910601001", "story_v_out_910601.awb")

						arg_1_1:RecordAudio("910601001", var_4_62)
						arg_1_1:RecordAudio("910601001", var_4_62)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_910601", "910601001", "story_v_out_910601.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_910601", "910601001", "story_v_out_910601.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_63 = var_4_52 + 0.3
			local var_4_64 = math.max(var_4_53, arg_1_1.talkMaxDuration)

			if var_4_63 <= arg_1_1.time_ and arg_1_1.time_ < var_4_63 + var_4_64 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_63) / var_4_64

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_63 + var_4_64 and arg_1_1.time_ < var_4_63 + var_4_64 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play910601002 = function(arg_8_0, arg_8_1)
		arg_8_1.time_ = 0
		arg_8_1.frameCnt_ = 0
		arg_8_1.state_ = "playing"
		arg_8_1.curTalkId_ = 910601002
		arg_8_1.duration_ = 5

		SetActive(arg_8_1.tipsGo_, false)

		function arg_8_1.onSingleLineFinish_()
			arg_8_1.onSingleLineUpdate_ = nil
			arg_8_1.onSingleLineFinish_ = nil
			arg_8_1.state_ = "waiting"
		end

		function arg_8_1.playNext_(arg_10_0)
			if arg_10_0 == 1 then
				arg_8_0:Play910601003(arg_8_1)
			end
		end

		function arg_8_1.onSingleLineUpdate_(arg_11_0)
			local var_11_0 = arg_8_1.actors_["1084ui_story"]
			local var_11_1 = 0

			if var_11_1 < arg_8_1.time_ and arg_8_1.time_ <= var_11_1 + arg_11_0 and arg_8_1.var_.characterEffect1084ui_story == nil then
				arg_8_1.var_.characterEffect1084ui_story = var_11_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_11_2 = 0.200000002980232

			if var_11_1 <= arg_8_1.time_ and arg_8_1.time_ < var_11_1 + var_11_2 then
				local var_11_3 = (arg_8_1.time_ - var_11_1) / var_11_2

				if arg_8_1.var_.characterEffect1084ui_story then
					local var_11_4 = Mathf.Lerp(0, 0.5, var_11_3)

					arg_8_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_8_1.var_.characterEffect1084ui_story.fillRatio = var_11_4
				end
			end

			if arg_8_1.time_ >= var_11_1 + var_11_2 and arg_8_1.time_ < var_11_1 + var_11_2 + arg_11_0 and arg_8_1.var_.characterEffect1084ui_story then
				local var_11_5 = 0.5

				arg_8_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_8_1.var_.characterEffect1084ui_story.fillRatio = var_11_5
			end

			local var_11_6 = 0
			local var_11_7 = 0.65

			if var_11_6 < arg_8_1.time_ and arg_8_1.time_ <= var_11_6 + arg_11_0 then
				arg_8_1.talkMaxDuration = 0
				arg_8_1.dialogCg_.alpha = 1

				arg_8_1.dialog_:SetActive(true)
				SetActive(arg_8_1.leftNameGo_, true)

				local var_11_8 = arg_8_1:FormatText(StoryNameCfg[7].name)

				arg_8_1.leftNameTxt_.text = var_11_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_8_1.leftNameTxt_.transform)

				arg_8_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_8_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_8_1:RecordName(arg_8_1.leftNameTxt_.text)
				SetActive(arg_8_1.iconTrs_.gameObject, false)
				arg_8_1.callingController_:SetSelectedState("normal")

				local var_11_9 = arg_8_1:GetWordFromCfg(910601002)
				local var_11_10 = arg_8_1:FormatText(var_11_9.content)

				arg_8_1.text_.text = var_11_10

				LuaForUtil.ClearLinePrefixSymbol(arg_8_1.text_)

				local var_11_11 = 26
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
				arg_8_1:RecordContent(arg_8_1.text_.text)
			end

			local var_11_14 = math.max(var_11_7, arg_8_1.talkMaxDuration)

			if var_11_6 <= arg_8_1.time_ and arg_8_1.time_ < var_11_6 + var_11_14 then
				arg_8_1.typewritter.percent = (arg_8_1.time_ - var_11_6) / var_11_14

				arg_8_1.typewritter:SetDirty()
			end

			if arg_8_1.time_ >= var_11_6 + var_11_14 and arg_8_1.time_ < var_11_6 + var_11_14 + arg_11_0 then
				arg_8_1.typewritter.percent = 1

				arg_8_1.typewritter:SetDirty()
				arg_8_1:ShowNextGo(true)
			end
		end
	end,
	Play910601003 = function(arg_12_0, arg_12_1)
		arg_12_1.time_ = 0
		arg_12_1.frameCnt_ = 0
		arg_12_1.state_ = "playing"
		arg_12_1.curTalkId_ = 910601003
		arg_12_1.duration_ = 5.03

		SetActive(arg_12_1.tipsGo_, false)

		function arg_12_1.onSingleLineFinish_()
			arg_12_1.onSingleLineUpdate_ = nil
			arg_12_1.onSingleLineFinish_ = nil
			arg_12_1.state_ = "waiting"
		end

		function arg_12_1.playNext_(arg_14_0)
			if arg_14_0 == 1 then
				arg_12_0:Play910601004(arg_12_1)
			end
		end

		function arg_12_1.onSingleLineUpdate_(arg_15_0)
			local var_15_0 = "1011ui_story"

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

			local var_15_4 = arg_12_1.actors_["1011ui_story"].transform
			local var_15_5 = 0

			if var_15_5 < arg_12_1.time_ and arg_12_1.time_ <= var_15_5 + arg_15_0 then
				arg_12_1.var_.moveOldPos1011ui_story = var_15_4.localPosition
			end

			local var_15_6 = 0.001

			if var_15_5 <= arg_12_1.time_ and arg_12_1.time_ < var_15_5 + var_15_6 then
				local var_15_7 = (arg_12_1.time_ - var_15_5) / var_15_6
				local var_15_8 = Vector3.New(0.7, -0.71, -6)

				var_15_4.localPosition = Vector3.Lerp(arg_12_1.var_.moveOldPos1011ui_story, var_15_8, var_15_7)

				local var_15_9 = manager.ui.mainCamera.transform.position - var_15_4.position

				var_15_4.forward = Vector3.New(var_15_9.x, var_15_9.y, var_15_9.z)

				local var_15_10 = var_15_4.localEulerAngles

				var_15_10.z = 0
				var_15_10.x = 0
				var_15_4.localEulerAngles = var_15_10
			end

			if arg_12_1.time_ >= var_15_5 + var_15_6 and arg_12_1.time_ < var_15_5 + var_15_6 + arg_15_0 then
				var_15_4.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_15_11 = manager.ui.mainCamera.transform.position - var_15_4.position

				var_15_4.forward = Vector3.New(var_15_11.x, var_15_11.y, var_15_11.z)

				local var_15_12 = var_15_4.localEulerAngles

				var_15_12.z = 0
				var_15_12.x = 0
				var_15_4.localEulerAngles = var_15_12
			end

			local var_15_13 = arg_12_1.actors_["1011ui_story"]
			local var_15_14 = 0

			if var_15_14 < arg_12_1.time_ and arg_12_1.time_ <= var_15_14 + arg_15_0 and arg_12_1.var_.characterEffect1011ui_story == nil then
				arg_12_1.var_.characterEffect1011ui_story = var_15_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_15 = 0.200000002980232

			if var_15_14 <= arg_12_1.time_ and arg_12_1.time_ < var_15_14 + var_15_15 then
				local var_15_16 = (arg_12_1.time_ - var_15_14) / var_15_15

				if arg_12_1.var_.characterEffect1011ui_story then
					arg_12_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_12_1.time_ >= var_15_14 + var_15_15 and arg_12_1.time_ < var_15_14 + var_15_15 + arg_15_0 and arg_12_1.var_.characterEffect1011ui_story then
				arg_12_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_15_17 = 0

			if var_15_17 < arg_12_1.time_ and arg_12_1.time_ <= var_15_17 + arg_15_0 then
				arg_12_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_15_18 = 0

			if var_15_18 < arg_12_1.time_ and arg_12_1.time_ <= var_15_18 + arg_15_0 then
				arg_12_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_15_19 = arg_12_1.actors_["1084ui_story"].transform
			local var_15_20 = 0

			if var_15_20 < arg_12_1.time_ and arg_12_1.time_ <= var_15_20 + arg_15_0 then
				arg_12_1.var_.moveOldPos1084ui_story = var_15_19.localPosition
			end

			local var_15_21 = 0.001

			if var_15_20 <= arg_12_1.time_ and arg_12_1.time_ < var_15_20 + var_15_21 then
				local var_15_22 = (arg_12_1.time_ - var_15_20) / var_15_21
				local var_15_23 = Vector3.New(-0.7, -0.97, -6)

				var_15_19.localPosition = Vector3.Lerp(arg_12_1.var_.moveOldPos1084ui_story, var_15_23, var_15_22)

				local var_15_24 = manager.ui.mainCamera.transform.position - var_15_19.position

				var_15_19.forward = Vector3.New(var_15_24.x, var_15_24.y, var_15_24.z)

				local var_15_25 = var_15_19.localEulerAngles

				var_15_25.z = 0
				var_15_25.x = 0
				var_15_19.localEulerAngles = var_15_25
			end

			if arg_12_1.time_ >= var_15_20 + var_15_21 and arg_12_1.time_ < var_15_20 + var_15_21 + arg_15_0 then
				var_15_19.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_15_26 = manager.ui.mainCamera.transform.position - var_15_19.position

				var_15_19.forward = Vector3.New(var_15_26.x, var_15_26.y, var_15_26.z)

				local var_15_27 = var_15_19.localEulerAngles

				var_15_27.z = 0
				var_15_27.x = 0
				var_15_19.localEulerAngles = var_15_27
			end

			local var_15_28 = arg_12_1.actors_["1084ui_story"]
			local var_15_29 = 0

			if var_15_29 < arg_12_1.time_ and arg_12_1.time_ <= var_15_29 + arg_15_0 and arg_12_1.var_.characterEffect1084ui_story == nil then
				arg_12_1.var_.characterEffect1084ui_story = var_15_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_15_30 = 0.200000002980232

			if var_15_29 <= arg_12_1.time_ and arg_12_1.time_ < var_15_29 + var_15_30 then
				local var_15_31 = (arg_12_1.time_ - var_15_29) / var_15_30

				if arg_12_1.var_.characterEffect1084ui_story then
					local var_15_32 = Mathf.Lerp(0, 0.5, var_15_31)

					arg_12_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_12_1.var_.characterEffect1084ui_story.fillRatio = var_15_32
				end
			end

			if arg_12_1.time_ >= var_15_29 + var_15_30 and arg_12_1.time_ < var_15_29 + var_15_30 + arg_15_0 and arg_12_1.var_.characterEffect1084ui_story then
				local var_15_33 = 0.5

				arg_12_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_12_1.var_.characterEffect1084ui_story.fillRatio = var_15_33
			end

			local var_15_34 = 0

			if var_15_34 < arg_12_1.time_ and arg_12_1.time_ <= var_15_34 + arg_15_0 then
				arg_12_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_2")
			end

			local var_15_35 = 0

			if var_15_35 < arg_12_1.time_ and arg_12_1.time_ <= var_15_35 + arg_15_0 then
				arg_12_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_15_36 = 0
			local var_15_37 = 0.725

			if var_15_36 < arg_12_1.time_ and arg_12_1.time_ <= var_15_36 + arg_15_0 then
				arg_12_1.talkMaxDuration = 0
				arg_12_1.dialogCg_.alpha = 1

				arg_12_1.dialog_:SetActive(true)
				SetActive(arg_12_1.leftNameGo_, true)

				local var_15_38 = arg_12_1:FormatText(StoryNameCfg[37].name)

				arg_12_1.leftNameTxt_.text = var_15_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_12_1.leftNameTxt_.transform)

				arg_12_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_12_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_12_1:RecordName(arg_12_1.leftNameTxt_.text)
				SetActive(arg_12_1.iconTrs_.gameObject, false)
				arg_12_1.callingController_:SetSelectedState("normal")

				local var_15_39 = arg_12_1:GetWordFromCfg(910601003)
				local var_15_40 = arg_12_1:FormatText(var_15_39.content)

				arg_12_1.text_.text = var_15_40

				LuaForUtil.ClearLinePrefixSymbol(arg_12_1.text_)

				local var_15_41 = 29
				local var_15_42 = utf8.len(var_15_40)
				local var_15_43 = var_15_41 <= 0 and var_15_37 or var_15_37 * (var_15_42 / var_15_41)

				if var_15_43 > 0 and var_15_37 < var_15_43 then
					arg_12_1.talkMaxDuration = var_15_43

					if var_15_43 + var_15_36 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_43 + var_15_36
					end
				end

				arg_12_1.text_.text = var_15_40
				arg_12_1.typewritter.percent = 0

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601003", "story_v_out_910601.awb") ~= 0 then
					local var_15_44 = manager.audio:GetVoiceLength("story_v_out_910601", "910601003", "story_v_out_910601.awb") / 1000

					if var_15_44 + var_15_36 > arg_12_1.duration_ then
						arg_12_1.duration_ = var_15_44 + var_15_36
					end

					if var_15_39.prefab_name ~= "" and arg_12_1.actors_[var_15_39.prefab_name] ~= nil then
						local var_15_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_12_1.actors_[var_15_39.prefab_name].transform, "story_v_out_910601", "910601003", "story_v_out_910601.awb")

						arg_12_1:RecordAudio("910601003", var_15_45)
						arg_12_1:RecordAudio("910601003", var_15_45)
					else
						arg_12_1:AudioAction("play", "voice", "story_v_out_910601", "910601003", "story_v_out_910601.awb")
					end

					arg_12_1:RecordHistoryTalkVoice("story_v_out_910601", "910601003", "story_v_out_910601.awb")
				end

				arg_12_1:RecordContent(arg_12_1.text_.text)
			end

			local var_15_46 = math.max(var_15_37, arg_12_1.talkMaxDuration)

			if var_15_36 <= arg_12_1.time_ and arg_12_1.time_ < var_15_36 + var_15_46 then
				arg_12_1.typewritter.percent = (arg_12_1.time_ - var_15_36) / var_15_46

				arg_12_1.typewritter:SetDirty()
			end

			if arg_12_1.time_ >= var_15_36 + var_15_46 and arg_12_1.time_ < var_15_36 + var_15_46 + arg_15_0 then
				arg_12_1.typewritter.percent = 1

				arg_12_1.typewritter:SetDirty()
				arg_12_1:ShowNextGo(true)
			end
		end
	end,
	Play910601004 = function(arg_16_0, arg_16_1)
		arg_16_1.time_ = 0
		arg_16_1.frameCnt_ = 0
		arg_16_1.state_ = "playing"
		arg_16_1.curTalkId_ = 910601004
		arg_16_1.duration_ = 5

		SetActive(arg_16_1.tipsGo_, false)

		function arg_16_1.onSingleLineFinish_()
			arg_16_1.onSingleLineUpdate_ = nil
			arg_16_1.onSingleLineFinish_ = nil
			arg_16_1.state_ = "waiting"
		end

		function arg_16_1.playNext_(arg_18_0)
			if arg_18_0 == 1 then
				arg_16_0:Play910601005(arg_16_1)
			end
		end

		function arg_16_1.onSingleLineUpdate_(arg_19_0)
			local var_19_0 = arg_16_1.actors_["1011ui_story"]
			local var_19_1 = 0

			if var_19_1 < arg_16_1.time_ and arg_16_1.time_ <= var_19_1 + arg_19_0 and arg_16_1.var_.characterEffect1011ui_story == nil then
				arg_16_1.var_.characterEffect1011ui_story = var_19_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_19_2 = 0.200000002980232

			if var_19_1 <= arg_16_1.time_ and arg_16_1.time_ < var_19_1 + var_19_2 then
				local var_19_3 = (arg_16_1.time_ - var_19_1) / var_19_2

				if arg_16_1.var_.characterEffect1011ui_story then
					local var_19_4 = Mathf.Lerp(0, 0.5, var_19_3)

					arg_16_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_16_1.var_.characterEffect1011ui_story.fillRatio = var_19_4
				end
			end

			if arg_16_1.time_ >= var_19_1 + var_19_2 and arg_16_1.time_ < var_19_1 + var_19_2 + arg_19_0 and arg_16_1.var_.characterEffect1011ui_story then
				local var_19_5 = 0.5

				arg_16_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_16_1.var_.characterEffect1011ui_story.fillRatio = var_19_5
			end

			local var_19_6 = 0
			local var_19_7 = 0.65

			if var_19_6 < arg_16_1.time_ and arg_16_1.time_ <= var_19_6 + arg_19_0 then
				arg_16_1.talkMaxDuration = 0
				arg_16_1.dialogCg_.alpha = 1

				arg_16_1.dialog_:SetActive(true)
				SetActive(arg_16_1.leftNameGo_, true)

				local var_19_8 = arg_16_1:FormatText(StoryNameCfg[7].name)

				arg_16_1.leftNameTxt_.text = var_19_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_16_1.leftNameTxt_.transform)

				arg_16_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_16_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_16_1:RecordName(arg_16_1.leftNameTxt_.text)
				SetActive(arg_16_1.iconTrs_.gameObject, false)
				arg_16_1.callingController_:SetSelectedState("normal")

				local var_19_9 = arg_16_1:GetWordFromCfg(910601004)
				local var_19_10 = arg_16_1:FormatText(var_19_9.content)

				arg_16_1.text_.text = var_19_10

				LuaForUtil.ClearLinePrefixSymbol(arg_16_1.text_)

				local var_19_11 = 26
				local var_19_12 = utf8.len(var_19_10)
				local var_19_13 = var_19_11 <= 0 and var_19_7 or var_19_7 * (var_19_12 / var_19_11)

				if var_19_13 > 0 and var_19_7 < var_19_13 then
					arg_16_1.talkMaxDuration = var_19_13

					if var_19_13 + var_19_6 > arg_16_1.duration_ then
						arg_16_1.duration_ = var_19_13 + var_19_6
					end
				end

				arg_16_1.text_.text = var_19_10
				arg_16_1.typewritter.percent = 0

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(false)
				arg_16_1:RecordContent(arg_16_1.text_.text)
			end

			local var_19_14 = math.max(var_19_7, arg_16_1.talkMaxDuration)

			if var_19_6 <= arg_16_1.time_ and arg_16_1.time_ < var_19_6 + var_19_14 then
				arg_16_1.typewritter.percent = (arg_16_1.time_ - var_19_6) / var_19_14

				arg_16_1.typewritter:SetDirty()
			end

			if arg_16_1.time_ >= var_19_6 + var_19_14 and arg_16_1.time_ < var_19_6 + var_19_14 + arg_19_0 then
				arg_16_1.typewritter.percent = 1

				arg_16_1.typewritter:SetDirty()
				arg_16_1:ShowNextGo(true)
			end
		end
	end,
	Play910601005 = function(arg_20_0, arg_20_1)
		arg_20_1.time_ = 0
		arg_20_1.frameCnt_ = 0
		arg_20_1.state_ = "playing"
		arg_20_1.curTalkId_ = 910601005
		arg_20_1.duration_ = 7.53

		SetActive(arg_20_1.tipsGo_, false)

		function arg_20_1.onSingleLineFinish_()
			arg_20_1.onSingleLineUpdate_ = nil
			arg_20_1.onSingleLineFinish_ = nil
			arg_20_1.state_ = "waiting"
		end

		function arg_20_1.playNext_(arg_22_0)
			if arg_22_0 == 1 then
				arg_20_0:Play910601006(arg_20_1)
			end
		end

		function arg_20_1.onSingleLineUpdate_(arg_23_0)
			local var_23_0 = "1048ui_story"

			if arg_20_1.actors_[var_23_0] == nil then
				local var_23_1 = Object.Instantiate(Asset.Load("Char/" .. var_23_0), arg_20_1.stage_.transform)

				var_23_1.name = var_23_0
				var_23_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_20_1.actors_[var_23_0] = var_23_1

				local var_23_2 = var_23_1:GetComponentInChildren(typeof(CharacterEffect))

				var_23_2.enabled = true

				local var_23_3 = GameObjectTools.GetOrAddComponent(var_23_1, typeof(DynamicBoneHelper))

				if var_23_3 then
					var_23_3:EnableDynamicBone(false)
				end

				arg_20_1:ShowWeapon(var_23_2.transform, false)

				arg_20_1.var_[var_23_0 .. "Animator"] = var_23_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_20_1.var_[var_23_0 .. "Animator"].applyRootMotion = true
				arg_20_1.var_[var_23_0 .. "LipSync"] = var_23_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_23_4 = arg_20_1.actors_["1048ui_story"].transform
			local var_23_5 = 0

			if var_23_5 < arg_20_1.time_ and arg_20_1.time_ <= var_23_5 + arg_23_0 then
				arg_20_1.var_.moveOldPos1048ui_story = var_23_4.localPosition

				local var_23_6 = "1048ui_story"

				arg_20_1:ShowWeapon(arg_20_1.var_[var_23_6 .. "Animator"].transform, false)
			end

			local var_23_7 = 0.001

			if var_23_5 <= arg_20_1.time_ and arg_20_1.time_ < var_23_5 + var_23_7 then
				local var_23_8 = (arg_20_1.time_ - var_23_5) / var_23_7
				local var_23_9 = Vector3.New(0, -0.8, -6.2)

				var_23_4.localPosition = Vector3.Lerp(arg_20_1.var_.moveOldPos1048ui_story, var_23_9, var_23_8)

				local var_23_10 = manager.ui.mainCamera.transform.position - var_23_4.position

				var_23_4.forward = Vector3.New(var_23_10.x, var_23_10.y, var_23_10.z)

				local var_23_11 = var_23_4.localEulerAngles

				var_23_11.z = 0
				var_23_11.x = 0
				var_23_4.localEulerAngles = var_23_11
			end

			if arg_20_1.time_ >= var_23_5 + var_23_7 and arg_20_1.time_ < var_23_5 + var_23_7 + arg_23_0 then
				var_23_4.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_23_12 = manager.ui.mainCamera.transform.position - var_23_4.position

				var_23_4.forward = Vector3.New(var_23_12.x, var_23_12.y, var_23_12.z)

				local var_23_13 = var_23_4.localEulerAngles

				var_23_13.z = 0
				var_23_13.x = 0
				var_23_4.localEulerAngles = var_23_13
			end

			local var_23_14 = arg_20_1.actors_["1048ui_story"]
			local var_23_15 = 0

			if var_23_15 < arg_20_1.time_ and arg_20_1.time_ <= var_23_15 + arg_23_0 and arg_20_1.var_.characterEffect1048ui_story == nil then
				arg_20_1.var_.characterEffect1048ui_story = var_23_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_16 = 0.200000002980232

			if var_23_15 <= arg_20_1.time_ and arg_20_1.time_ < var_23_15 + var_23_16 then
				local var_23_17 = (arg_20_1.time_ - var_23_15) / var_23_16

				if arg_20_1.var_.characterEffect1048ui_story then
					arg_20_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_20_1.time_ >= var_23_15 + var_23_16 and arg_20_1.time_ < var_23_15 + var_23_16 + arg_23_0 and arg_20_1.var_.characterEffect1048ui_story then
				arg_20_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_23_18 = 0

			if var_23_18 < arg_20_1.time_ and arg_20_1.time_ <= var_23_18 + arg_23_0 then
				arg_20_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_23_19 = 0

			if var_23_19 < arg_20_1.time_ and arg_20_1.time_ <= var_23_19 + arg_23_0 then
				arg_20_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_23_20 = arg_20_1.actors_["1011ui_story"].transform
			local var_23_21 = 0

			if var_23_21 < arg_20_1.time_ and arg_20_1.time_ <= var_23_21 + arg_23_0 then
				arg_20_1.var_.moveOldPos1011ui_story = var_23_20.localPosition
			end

			local var_23_22 = 0.001

			if var_23_21 <= arg_20_1.time_ and arg_20_1.time_ < var_23_21 + var_23_22 then
				local var_23_23 = (arg_20_1.time_ - var_23_21) / var_23_22
				local var_23_24 = Vector3.New(0, 100, 0)

				var_23_20.localPosition = Vector3.Lerp(arg_20_1.var_.moveOldPos1011ui_story, var_23_24, var_23_23)

				local var_23_25 = manager.ui.mainCamera.transform.position - var_23_20.position

				var_23_20.forward = Vector3.New(var_23_25.x, var_23_25.y, var_23_25.z)

				local var_23_26 = var_23_20.localEulerAngles

				var_23_26.z = 0
				var_23_26.x = 0
				var_23_20.localEulerAngles = var_23_26
			end

			if arg_20_1.time_ >= var_23_21 + var_23_22 and arg_20_1.time_ < var_23_21 + var_23_22 + arg_23_0 then
				var_23_20.localPosition = Vector3.New(0, 100, 0)

				local var_23_27 = manager.ui.mainCamera.transform.position - var_23_20.position

				var_23_20.forward = Vector3.New(var_23_27.x, var_23_27.y, var_23_27.z)

				local var_23_28 = var_23_20.localEulerAngles

				var_23_28.z = 0
				var_23_28.x = 0
				var_23_20.localEulerAngles = var_23_28
			end

			local var_23_29 = arg_20_1.actors_["1011ui_story"]
			local var_23_30 = 0

			if var_23_30 < arg_20_1.time_ and arg_20_1.time_ <= var_23_30 + arg_23_0 and arg_20_1.var_.characterEffect1011ui_story == nil then
				arg_20_1.var_.characterEffect1011ui_story = var_23_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_31 = 0.200000002980232

			if var_23_30 <= arg_20_1.time_ and arg_20_1.time_ < var_23_30 + var_23_31 then
				local var_23_32 = (arg_20_1.time_ - var_23_30) / var_23_31

				if arg_20_1.var_.characterEffect1011ui_story then
					local var_23_33 = Mathf.Lerp(0, 0.5, var_23_32)

					arg_20_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_20_1.var_.characterEffect1011ui_story.fillRatio = var_23_33
				end
			end

			if arg_20_1.time_ >= var_23_30 + var_23_31 and arg_20_1.time_ < var_23_30 + var_23_31 + arg_23_0 and arg_20_1.var_.characterEffect1011ui_story then
				local var_23_34 = 0.5

				arg_20_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_20_1.var_.characterEffect1011ui_story.fillRatio = var_23_34
			end

			local var_23_35 = arg_20_1.actors_["1084ui_story"].transform
			local var_23_36 = 0

			if var_23_36 < arg_20_1.time_ and arg_20_1.time_ <= var_23_36 + arg_23_0 then
				arg_20_1.var_.moveOldPos1084ui_story = var_23_35.localPosition
			end

			local var_23_37 = 0.001

			if var_23_36 <= arg_20_1.time_ and arg_20_1.time_ < var_23_36 + var_23_37 then
				local var_23_38 = (arg_20_1.time_ - var_23_36) / var_23_37
				local var_23_39 = Vector3.New(0, 100, 0)

				var_23_35.localPosition = Vector3.Lerp(arg_20_1.var_.moveOldPos1084ui_story, var_23_39, var_23_38)

				local var_23_40 = manager.ui.mainCamera.transform.position - var_23_35.position

				var_23_35.forward = Vector3.New(var_23_40.x, var_23_40.y, var_23_40.z)

				local var_23_41 = var_23_35.localEulerAngles

				var_23_41.z = 0
				var_23_41.x = 0
				var_23_35.localEulerAngles = var_23_41
			end

			if arg_20_1.time_ >= var_23_36 + var_23_37 and arg_20_1.time_ < var_23_36 + var_23_37 + arg_23_0 then
				var_23_35.localPosition = Vector3.New(0, 100, 0)

				local var_23_42 = manager.ui.mainCamera.transform.position - var_23_35.position

				var_23_35.forward = Vector3.New(var_23_42.x, var_23_42.y, var_23_42.z)

				local var_23_43 = var_23_35.localEulerAngles

				var_23_43.z = 0
				var_23_43.x = 0
				var_23_35.localEulerAngles = var_23_43
			end

			local var_23_44 = arg_20_1.actors_["1084ui_story"]
			local var_23_45 = 0

			if var_23_45 < arg_20_1.time_ and arg_20_1.time_ <= var_23_45 + arg_23_0 and arg_20_1.var_.characterEffect1084ui_story == nil then
				arg_20_1.var_.characterEffect1084ui_story = var_23_44:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_23_46 = 0.200000002980232

			if var_23_45 <= arg_20_1.time_ and arg_20_1.time_ < var_23_45 + var_23_46 then
				local var_23_47 = (arg_20_1.time_ - var_23_45) / var_23_46

				if arg_20_1.var_.characterEffect1084ui_story then
					local var_23_48 = Mathf.Lerp(0, 0.5, var_23_47)

					arg_20_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_20_1.var_.characterEffect1084ui_story.fillRatio = var_23_48
				end
			end

			if arg_20_1.time_ >= var_23_45 + var_23_46 and arg_20_1.time_ < var_23_45 + var_23_46 + arg_23_0 and arg_20_1.var_.characterEffect1084ui_story then
				local var_23_49 = 0.5

				arg_20_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_20_1.var_.characterEffect1084ui_story.fillRatio = var_23_49
			end

			local var_23_50 = 0
			local var_23_51 = 0.875

			if var_23_50 < arg_20_1.time_ and arg_20_1.time_ <= var_23_50 + arg_23_0 then
				arg_20_1.talkMaxDuration = 0
				arg_20_1.dialogCg_.alpha = 1

				arg_20_1.dialog_:SetActive(true)
				SetActive(arg_20_1.leftNameGo_, true)

				local var_23_52 = arg_20_1:FormatText(StoryNameCfg[8].name)

				arg_20_1.leftNameTxt_.text = var_23_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_20_1.leftNameTxt_.transform)

				arg_20_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_20_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_20_1:RecordName(arg_20_1.leftNameTxt_.text)
				SetActive(arg_20_1.iconTrs_.gameObject, false)
				arg_20_1.callingController_:SetSelectedState("normal")

				local var_23_53 = arg_20_1:GetWordFromCfg(910601005)
				local var_23_54 = arg_20_1:FormatText(var_23_53.content)

				arg_20_1.text_.text = var_23_54

				LuaForUtil.ClearLinePrefixSymbol(arg_20_1.text_)

				local var_23_55 = 35
				local var_23_56 = utf8.len(var_23_54)
				local var_23_57 = var_23_55 <= 0 and var_23_51 or var_23_51 * (var_23_56 / var_23_55)

				if var_23_57 > 0 and var_23_51 < var_23_57 then
					arg_20_1.talkMaxDuration = var_23_57

					if var_23_57 + var_23_50 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_57 + var_23_50
					end
				end

				arg_20_1.text_.text = var_23_54
				arg_20_1.typewritter.percent = 0

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601005", "story_v_out_910601.awb") ~= 0 then
					local var_23_58 = manager.audio:GetVoiceLength("story_v_out_910601", "910601005", "story_v_out_910601.awb") / 1000

					if var_23_58 + var_23_50 > arg_20_1.duration_ then
						arg_20_1.duration_ = var_23_58 + var_23_50
					end

					if var_23_53.prefab_name ~= "" and arg_20_1.actors_[var_23_53.prefab_name] ~= nil then
						local var_23_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_20_1.actors_[var_23_53.prefab_name].transform, "story_v_out_910601", "910601005", "story_v_out_910601.awb")

						arg_20_1:RecordAudio("910601005", var_23_59)
						arg_20_1:RecordAudio("910601005", var_23_59)
					else
						arg_20_1:AudioAction("play", "voice", "story_v_out_910601", "910601005", "story_v_out_910601.awb")
					end

					arg_20_1:RecordHistoryTalkVoice("story_v_out_910601", "910601005", "story_v_out_910601.awb")
				end

				arg_20_1:RecordContent(arg_20_1.text_.text)
			end

			local var_23_60 = math.max(var_23_51, arg_20_1.talkMaxDuration)

			if var_23_50 <= arg_20_1.time_ and arg_20_1.time_ < var_23_50 + var_23_60 then
				arg_20_1.typewritter.percent = (arg_20_1.time_ - var_23_50) / var_23_60

				arg_20_1.typewritter:SetDirty()
			end

			if arg_20_1.time_ >= var_23_50 + var_23_60 and arg_20_1.time_ < var_23_50 + var_23_60 + arg_23_0 then
				arg_20_1.typewritter.percent = 1

				arg_20_1.typewritter:SetDirty()
				arg_20_1:ShowNextGo(true)
			end
		end
	end,
	Play910601006 = function(arg_24_0, arg_24_1)
		arg_24_1.time_ = 0
		arg_24_1.frameCnt_ = 0
		arg_24_1.state_ = "playing"
		arg_24_1.curTalkId_ = 910601006
		arg_24_1.duration_ = 5

		SetActive(arg_24_1.tipsGo_, false)

		function arg_24_1.onSingleLineFinish_()
			arg_24_1.onSingleLineUpdate_ = nil
			arg_24_1.onSingleLineFinish_ = nil
			arg_24_1.state_ = "waiting"
		end

		function arg_24_1.playNext_(arg_26_0)
			if arg_26_0 == 1 then
				arg_24_0:Play910601007(arg_24_1)
			end
		end

		function arg_24_1.onSingleLineUpdate_(arg_27_0)
			local var_27_0 = arg_24_1.actors_["1048ui_story"]
			local var_27_1 = 0

			if var_27_1 < arg_24_1.time_ and arg_24_1.time_ <= var_27_1 + arg_27_0 and arg_24_1.var_.characterEffect1048ui_story == nil then
				arg_24_1.var_.characterEffect1048ui_story = var_27_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_27_2 = 0.200000002980232

			if var_27_1 <= arg_24_1.time_ and arg_24_1.time_ < var_27_1 + var_27_2 then
				local var_27_3 = (arg_24_1.time_ - var_27_1) / var_27_2

				if arg_24_1.var_.characterEffect1048ui_story then
					local var_27_4 = Mathf.Lerp(0, 0.5, var_27_3)

					arg_24_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_24_1.var_.characterEffect1048ui_story.fillRatio = var_27_4
				end
			end

			if arg_24_1.time_ >= var_27_1 + var_27_2 and arg_24_1.time_ < var_27_1 + var_27_2 + arg_27_0 and arg_24_1.var_.characterEffect1048ui_story then
				local var_27_5 = 0.5

				arg_24_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_24_1.var_.characterEffect1048ui_story.fillRatio = var_27_5
			end

			local var_27_6 = 0
			local var_27_7 = 0.425

			if var_27_6 < arg_24_1.time_ and arg_24_1.time_ <= var_27_6 + arg_27_0 then
				arg_24_1.talkMaxDuration = 0
				arg_24_1.dialogCg_.alpha = 1

				arg_24_1.dialog_:SetActive(true)
				SetActive(arg_24_1.leftNameGo_, true)

				local var_27_8 = arg_24_1:FormatText(StoryNameCfg[7].name)

				arg_24_1.leftNameTxt_.text = var_27_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_24_1.leftNameTxt_.transform)

				arg_24_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_24_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_24_1:RecordName(arg_24_1.leftNameTxt_.text)
				SetActive(arg_24_1.iconTrs_.gameObject, false)
				arg_24_1.callingController_:SetSelectedState("normal")

				local var_27_9 = arg_24_1:GetWordFromCfg(910601006)
				local var_27_10 = arg_24_1:FormatText(var_27_9.content)

				arg_24_1.text_.text = var_27_10

				LuaForUtil.ClearLinePrefixSymbol(arg_24_1.text_)

				local var_27_11 = 17
				local var_27_12 = utf8.len(var_27_10)
				local var_27_13 = var_27_11 <= 0 and var_27_7 or var_27_7 * (var_27_12 / var_27_11)

				if var_27_13 > 0 and var_27_7 < var_27_13 then
					arg_24_1.talkMaxDuration = var_27_13

					if var_27_13 + var_27_6 > arg_24_1.duration_ then
						arg_24_1.duration_ = var_27_13 + var_27_6
					end
				end

				arg_24_1.text_.text = var_27_10
				arg_24_1.typewritter.percent = 0

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(false)
				arg_24_1:RecordContent(arg_24_1.text_.text)
			end

			local var_27_14 = math.max(var_27_7, arg_24_1.talkMaxDuration)

			if var_27_6 <= arg_24_1.time_ and arg_24_1.time_ < var_27_6 + var_27_14 then
				arg_24_1.typewritter.percent = (arg_24_1.time_ - var_27_6) / var_27_14

				arg_24_1.typewritter:SetDirty()
			end

			if arg_24_1.time_ >= var_27_6 + var_27_14 and arg_24_1.time_ < var_27_6 + var_27_14 + arg_27_0 then
				arg_24_1.typewritter.percent = 1

				arg_24_1.typewritter:SetDirty()
				arg_24_1:ShowNextGo(true)
			end
		end
	end,
	Play910601007 = function(arg_28_0, arg_28_1)
		arg_28_1.time_ = 0
		arg_28_1.frameCnt_ = 0
		arg_28_1.state_ = "playing"
		arg_28_1.curTalkId_ = 910601007
		arg_28_1.duration_ = 9.47

		SetActive(arg_28_1.tipsGo_, false)

		function arg_28_1.onSingleLineFinish_()
			arg_28_1.onSingleLineUpdate_ = nil
			arg_28_1.onSingleLineFinish_ = nil
			arg_28_1.state_ = "waiting"
		end

		function arg_28_1.playNext_(arg_30_0)
			if arg_30_0 == 1 then
				arg_28_0:Play910601008(arg_28_1)
			end
		end

		function arg_28_1.onSingleLineUpdate_(arg_31_0)
			local var_31_0 = "1019ui_story"

			if arg_28_1.actors_[var_31_0] == nil then
				local var_31_1 = Object.Instantiate(Asset.Load("Char/" .. var_31_0), arg_28_1.stage_.transform)

				var_31_1.name = var_31_0
				var_31_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_28_1.actors_[var_31_0] = var_31_1

				local var_31_2 = var_31_1:GetComponentInChildren(typeof(CharacterEffect))

				var_31_2.enabled = true

				local var_31_3 = GameObjectTools.GetOrAddComponent(var_31_1, typeof(DynamicBoneHelper))

				if var_31_3 then
					var_31_3:EnableDynamicBone(false)
				end

				arg_28_1:ShowWeapon(var_31_2.transform, false)

				arg_28_1.var_[var_31_0 .. "Animator"] = var_31_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_28_1.var_[var_31_0 .. "Animator"].applyRootMotion = true
				arg_28_1.var_[var_31_0 .. "LipSync"] = var_31_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_31_4 = arg_28_1.actors_["1019ui_story"].transform
			local var_31_5 = 0

			if var_31_5 < arg_28_1.time_ and arg_28_1.time_ <= var_31_5 + arg_31_0 then
				arg_28_1.var_.moveOldPos1019ui_story = var_31_4.localPosition
			end

			local var_31_6 = 0.001

			if var_31_5 <= arg_28_1.time_ and arg_28_1.time_ < var_31_5 + var_31_6 then
				local var_31_7 = (arg_28_1.time_ - var_31_5) / var_31_6
				local var_31_8 = Vector3.New(0.7, -1.08, -5.9)

				var_31_4.localPosition = Vector3.Lerp(arg_28_1.var_.moveOldPos1019ui_story, var_31_8, var_31_7)

				local var_31_9 = manager.ui.mainCamera.transform.position - var_31_4.position

				var_31_4.forward = Vector3.New(var_31_9.x, var_31_9.y, var_31_9.z)

				local var_31_10 = var_31_4.localEulerAngles

				var_31_10.z = 0
				var_31_10.x = 0
				var_31_4.localEulerAngles = var_31_10
			end

			if arg_28_1.time_ >= var_31_5 + var_31_6 and arg_28_1.time_ < var_31_5 + var_31_6 + arg_31_0 then
				var_31_4.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_31_11 = manager.ui.mainCamera.transform.position - var_31_4.position

				var_31_4.forward = Vector3.New(var_31_11.x, var_31_11.y, var_31_11.z)

				local var_31_12 = var_31_4.localEulerAngles

				var_31_12.z = 0
				var_31_12.x = 0
				var_31_4.localEulerAngles = var_31_12
			end

			local var_31_13 = arg_28_1.actors_["1019ui_story"]
			local var_31_14 = 0

			if var_31_14 < arg_28_1.time_ and arg_28_1.time_ <= var_31_14 + arg_31_0 and arg_28_1.var_.characterEffect1019ui_story == nil then
				arg_28_1.var_.characterEffect1019ui_story = var_31_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_31_15 = 0.200000002980232

			if var_31_14 <= arg_28_1.time_ and arg_28_1.time_ < var_31_14 + var_31_15 then
				local var_31_16 = (arg_28_1.time_ - var_31_14) / var_31_15

				if arg_28_1.var_.characterEffect1019ui_story then
					arg_28_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_28_1.time_ >= var_31_14 + var_31_15 and arg_28_1.time_ < var_31_14 + var_31_15 + arg_31_0 and arg_28_1.var_.characterEffect1019ui_story then
				arg_28_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_31_17 = 0

			if var_31_17 < arg_28_1.time_ and arg_28_1.time_ <= var_31_17 + arg_31_0 then
				arg_28_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action2_1")
			end

			local var_31_18 = 0

			if var_31_18 < arg_28_1.time_ and arg_28_1.time_ <= var_31_18 + arg_31_0 then
				arg_28_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_31_19 = arg_28_1.actors_["1048ui_story"].transform
			local var_31_20 = 0

			if var_31_20 < arg_28_1.time_ and arg_28_1.time_ <= var_31_20 + arg_31_0 then
				arg_28_1.var_.moveOldPos1048ui_story = var_31_19.localPosition
			end

			local var_31_21 = 0.001

			if var_31_20 <= arg_28_1.time_ and arg_28_1.time_ < var_31_20 + var_31_21 then
				local var_31_22 = (arg_28_1.time_ - var_31_20) / var_31_21
				local var_31_23 = Vector3.New(-0.7, -0.8, -6.2)

				var_31_19.localPosition = Vector3.Lerp(arg_28_1.var_.moveOldPos1048ui_story, var_31_23, var_31_22)

				local var_31_24 = manager.ui.mainCamera.transform.position - var_31_19.position

				var_31_19.forward = Vector3.New(var_31_24.x, var_31_24.y, var_31_24.z)

				local var_31_25 = var_31_19.localEulerAngles

				var_31_25.z = 0
				var_31_25.x = 0
				var_31_19.localEulerAngles = var_31_25
			end

			if arg_28_1.time_ >= var_31_20 + var_31_21 and arg_28_1.time_ < var_31_20 + var_31_21 + arg_31_0 then
				var_31_19.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_31_26 = manager.ui.mainCamera.transform.position - var_31_19.position

				var_31_19.forward = Vector3.New(var_31_26.x, var_31_26.y, var_31_26.z)

				local var_31_27 = var_31_19.localEulerAngles

				var_31_27.z = 0
				var_31_27.x = 0
				var_31_19.localEulerAngles = var_31_27
			end

			local var_31_28 = arg_28_1.actors_["1048ui_story"]
			local var_31_29 = 0

			if var_31_29 < arg_28_1.time_ and arg_28_1.time_ <= var_31_29 + arg_31_0 and arg_28_1.var_.characterEffect1048ui_story == nil then
				arg_28_1.var_.characterEffect1048ui_story = var_31_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_31_30 = 0.200000002980232

			if var_31_29 <= arg_28_1.time_ and arg_28_1.time_ < var_31_29 + var_31_30 then
				local var_31_31 = (arg_28_1.time_ - var_31_29) / var_31_30

				if arg_28_1.var_.characterEffect1048ui_story then
					local var_31_32 = Mathf.Lerp(0, 0.5, var_31_31)

					arg_28_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_28_1.var_.characterEffect1048ui_story.fillRatio = var_31_32
				end
			end

			if arg_28_1.time_ >= var_31_29 + var_31_30 and arg_28_1.time_ < var_31_29 + var_31_30 + arg_31_0 and arg_28_1.var_.characterEffect1048ui_story then
				local var_31_33 = 0.5

				arg_28_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_28_1.var_.characterEffect1048ui_story.fillRatio = var_31_33
			end

			local var_31_34 = 0
			local var_31_35 = 1.05

			if var_31_34 < arg_28_1.time_ and arg_28_1.time_ <= var_31_34 + arg_31_0 then
				arg_28_1.talkMaxDuration = 0
				arg_28_1.dialogCg_.alpha = 1

				arg_28_1.dialog_:SetActive(true)
				SetActive(arg_28_1.leftNameGo_, true)

				local var_31_36 = arg_28_1:FormatText(StoryNameCfg[13].name)

				arg_28_1.leftNameTxt_.text = var_31_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_28_1.leftNameTxt_.transform)

				arg_28_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_28_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_28_1:RecordName(arg_28_1.leftNameTxt_.text)
				SetActive(arg_28_1.iconTrs_.gameObject, false)
				arg_28_1.callingController_:SetSelectedState("normal")

				local var_31_37 = arg_28_1:GetWordFromCfg(910601007)
				local var_31_38 = arg_28_1:FormatText(var_31_37.content)

				arg_28_1.text_.text = var_31_38

				LuaForUtil.ClearLinePrefixSymbol(arg_28_1.text_)

				local var_31_39 = 42
				local var_31_40 = utf8.len(var_31_38)
				local var_31_41 = var_31_39 <= 0 and var_31_35 or var_31_35 * (var_31_40 / var_31_39)

				if var_31_41 > 0 and var_31_35 < var_31_41 then
					arg_28_1.talkMaxDuration = var_31_41

					if var_31_41 + var_31_34 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_41 + var_31_34
					end
				end

				arg_28_1.text_.text = var_31_38
				arg_28_1.typewritter.percent = 0

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601007", "story_v_out_910601.awb") ~= 0 then
					local var_31_42 = manager.audio:GetVoiceLength("story_v_out_910601", "910601007", "story_v_out_910601.awb") / 1000

					if var_31_42 + var_31_34 > arg_28_1.duration_ then
						arg_28_1.duration_ = var_31_42 + var_31_34
					end

					if var_31_37.prefab_name ~= "" and arg_28_1.actors_[var_31_37.prefab_name] ~= nil then
						local var_31_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_28_1.actors_[var_31_37.prefab_name].transform, "story_v_out_910601", "910601007", "story_v_out_910601.awb")

						arg_28_1:RecordAudio("910601007", var_31_43)
						arg_28_1:RecordAudio("910601007", var_31_43)
					else
						arg_28_1:AudioAction("play", "voice", "story_v_out_910601", "910601007", "story_v_out_910601.awb")
					end

					arg_28_1:RecordHistoryTalkVoice("story_v_out_910601", "910601007", "story_v_out_910601.awb")
				end

				arg_28_1:RecordContent(arg_28_1.text_.text)
			end

			local var_31_44 = math.max(var_31_35, arg_28_1.talkMaxDuration)

			if var_31_34 <= arg_28_1.time_ and arg_28_1.time_ < var_31_34 + var_31_44 then
				arg_28_1.typewritter.percent = (arg_28_1.time_ - var_31_34) / var_31_44

				arg_28_1.typewritter:SetDirty()
			end

			if arg_28_1.time_ >= var_31_34 + var_31_44 and arg_28_1.time_ < var_31_34 + var_31_44 + arg_31_0 then
				arg_28_1.typewritter.percent = 1

				arg_28_1.typewritter:SetDirty()
				arg_28_1:ShowNextGo(true)
			end
		end
	end,
	Play910601008 = function(arg_32_0, arg_32_1)
		arg_32_1.time_ = 0
		arg_32_1.frameCnt_ = 0
		arg_32_1.state_ = "playing"
		arg_32_1.curTalkId_ = 910601008
		arg_32_1.duration_ = 5

		SetActive(arg_32_1.tipsGo_, false)

		function arg_32_1.onSingleLineFinish_()
			arg_32_1.onSingleLineUpdate_ = nil
			arg_32_1.onSingleLineFinish_ = nil
			arg_32_1.state_ = "waiting"
		end

		function arg_32_1.playNext_(arg_34_0)
			if arg_34_0 == 1 then
				arg_32_0:Play910601009(arg_32_1)
			end
		end

		function arg_32_1.onSingleLineUpdate_(arg_35_0)
			local var_35_0 = arg_32_1.actors_["1019ui_story"]
			local var_35_1 = 0

			if var_35_1 < arg_32_1.time_ and arg_32_1.time_ <= var_35_1 + arg_35_0 and arg_32_1.var_.characterEffect1019ui_story == nil then
				arg_32_1.var_.characterEffect1019ui_story = var_35_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_35_2 = 0.200000002980232

			if var_35_1 <= arg_32_1.time_ and arg_32_1.time_ < var_35_1 + var_35_2 then
				local var_35_3 = (arg_32_1.time_ - var_35_1) / var_35_2

				if arg_32_1.var_.characterEffect1019ui_story then
					local var_35_4 = Mathf.Lerp(0, 0.5, var_35_3)

					arg_32_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_32_1.var_.characterEffect1019ui_story.fillRatio = var_35_4
				end
			end

			if arg_32_1.time_ >= var_35_1 + var_35_2 and arg_32_1.time_ < var_35_1 + var_35_2 + arg_35_0 and arg_32_1.var_.characterEffect1019ui_story then
				local var_35_5 = 0.5

				arg_32_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_32_1.var_.characterEffect1019ui_story.fillRatio = var_35_5
			end

			local var_35_6 = 0
			local var_35_7 = 0.45

			if var_35_6 < arg_32_1.time_ and arg_32_1.time_ <= var_35_6 + arg_35_0 then
				arg_32_1.talkMaxDuration = 0
				arg_32_1.dialogCg_.alpha = 1

				arg_32_1.dialog_:SetActive(true)
				SetActive(arg_32_1.leftNameGo_, true)

				local var_35_8 = arg_32_1:FormatText(StoryNameCfg[7].name)

				arg_32_1.leftNameTxt_.text = var_35_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_32_1.leftNameTxt_.transform)

				arg_32_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_32_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_32_1:RecordName(arg_32_1.leftNameTxt_.text)
				SetActive(arg_32_1.iconTrs_.gameObject, false)
				arg_32_1.callingController_:SetSelectedState("normal")

				local var_35_9 = arg_32_1:GetWordFromCfg(910601008)
				local var_35_10 = arg_32_1:FormatText(var_35_9.content)

				arg_32_1.text_.text = var_35_10

				LuaForUtil.ClearLinePrefixSymbol(arg_32_1.text_)

				local var_35_11 = 18
				local var_35_12 = utf8.len(var_35_10)
				local var_35_13 = var_35_11 <= 0 and var_35_7 or var_35_7 * (var_35_12 / var_35_11)

				if var_35_13 > 0 and var_35_7 < var_35_13 then
					arg_32_1.talkMaxDuration = var_35_13

					if var_35_13 + var_35_6 > arg_32_1.duration_ then
						arg_32_1.duration_ = var_35_13 + var_35_6
					end
				end

				arg_32_1.text_.text = var_35_10
				arg_32_1.typewritter.percent = 0

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(false)
				arg_32_1:RecordContent(arg_32_1.text_.text)
			end

			local var_35_14 = math.max(var_35_7, arg_32_1.talkMaxDuration)

			if var_35_6 <= arg_32_1.time_ and arg_32_1.time_ < var_35_6 + var_35_14 then
				arg_32_1.typewritter.percent = (arg_32_1.time_ - var_35_6) / var_35_14

				arg_32_1.typewritter:SetDirty()
			end

			if arg_32_1.time_ >= var_35_6 + var_35_14 and arg_32_1.time_ < var_35_6 + var_35_14 + arg_35_0 then
				arg_32_1.typewritter.percent = 1

				arg_32_1.typewritter:SetDirty()
				arg_32_1:ShowNextGo(true)
			end
		end
	end,
	Play910601009 = function(arg_36_0, arg_36_1)
		arg_36_1.time_ = 0
		arg_36_1.frameCnt_ = 0
		arg_36_1.state_ = "playing"
		arg_36_1.curTalkId_ = 910601009
		arg_36_1.duration_ = 9

		SetActive(arg_36_1.tipsGo_, false)

		function arg_36_1.onSingleLineFinish_()
			arg_36_1.onSingleLineUpdate_ = nil
			arg_36_1.onSingleLineFinish_ = nil
			arg_36_1.state_ = "waiting"
		end

		function arg_36_1.playNext_(arg_38_0)
			if arg_38_0 == 1 then
				arg_36_0:Play910601010(arg_36_1)
			end
		end

		function arg_36_1.onSingleLineUpdate_(arg_39_0)
			local var_39_0 = "STwhite"

			if arg_36_1.bgs_[var_39_0] == nil then
				local var_39_1 = Object.Instantiate(arg_36_1.paintGo_)

				var_39_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_39_0)
				var_39_1.name = var_39_0
				var_39_1.transform.parent = arg_36_1.stage_.transform
				var_39_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_36_1.bgs_[var_39_0] = var_39_1
			end

			local var_39_2 = 2

			if var_39_2 < arg_36_1.time_ and arg_36_1.time_ <= var_39_2 + arg_39_0 then
				local var_39_3 = manager.ui.mainCamera.transform.localPosition
				local var_39_4 = Vector3.New(0, 0, 10) + Vector3.New(var_39_3.x, var_39_3.y, 0)
				local var_39_5 = arg_36_1.bgs_.STwhite

				var_39_5.transform.localPosition = var_39_4
				var_39_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_39_6 = var_39_5:GetComponent("SpriteRenderer")

				if var_39_6 and var_39_6.sprite then
					local var_39_7 = (var_39_5.transform.localPosition - var_39_3).z
					local var_39_8 = manager.ui.mainCameraCom_
					local var_39_9 = 2 * var_39_7 * Mathf.Tan(var_39_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_39_10 = var_39_9 * var_39_8.aspect
					local var_39_11 = var_39_6.sprite.bounds.size.x
					local var_39_12 = var_39_6.sprite.bounds.size.y
					local var_39_13 = var_39_10 / var_39_11
					local var_39_14 = var_39_9 / var_39_12
					local var_39_15 = var_39_14 < var_39_13 and var_39_13 or var_39_14

					var_39_5.transform.localScale = Vector3.New(var_39_15, var_39_15, 0)
				end

				for iter_39_0, iter_39_1 in pairs(arg_36_1.bgs_) do
					if iter_39_0 ~= "STwhite" then
						iter_39_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_39_16 = 0

			if var_39_16 < arg_36_1.time_ and arg_36_1.time_ <= var_39_16 + arg_39_0 then
				arg_36_1.mask_.enabled = true
				arg_36_1.mask_.raycastTarget = true

				arg_36_1:SetGaussion(false)
			end

			local var_39_17 = 2

			if var_39_16 <= arg_36_1.time_ and arg_36_1.time_ < var_39_16 + var_39_17 then
				local var_39_18 = (arg_36_1.time_ - var_39_16) / var_39_17
				local var_39_19 = Color.New(0, 0, 0)

				var_39_19.a = Mathf.Lerp(0, 1, var_39_18)
				arg_36_1.mask_.color = var_39_19
			end

			if arg_36_1.time_ >= var_39_16 + var_39_17 and arg_36_1.time_ < var_39_16 + var_39_17 + arg_39_0 then
				local var_39_20 = Color.New(0, 0, 0)

				var_39_20.a = 1
				arg_36_1.mask_.color = var_39_20
			end

			local var_39_21 = 2

			if var_39_21 < arg_36_1.time_ and arg_36_1.time_ <= var_39_21 + arg_39_0 then
				arg_36_1.mask_.enabled = true
				arg_36_1.mask_.raycastTarget = true

				arg_36_1:SetGaussion(false)
			end

			local var_39_22 = 2

			if var_39_21 <= arg_36_1.time_ and arg_36_1.time_ < var_39_21 + var_39_22 then
				local var_39_23 = (arg_36_1.time_ - var_39_21) / var_39_22
				local var_39_24 = Color.New(0, 0, 0)

				var_39_24.a = Mathf.Lerp(1, 0, var_39_23)
				arg_36_1.mask_.color = var_39_24
			end

			if arg_36_1.time_ >= var_39_21 + var_39_22 and arg_36_1.time_ < var_39_21 + var_39_22 + arg_39_0 then
				local var_39_25 = Color.New(0, 0, 0)
				local var_39_26 = 0

				arg_36_1.mask_.enabled = false
				var_39_25.a = var_39_26
				arg_36_1.mask_.color = var_39_25
			end

			local var_39_27 = arg_36_1.actors_["1019ui_story"].transform
			local var_39_28 = 2

			if var_39_28 < arg_36_1.time_ and arg_36_1.time_ <= var_39_28 + arg_39_0 then
				arg_36_1.var_.moveOldPos1019ui_story = var_39_27.localPosition
			end

			local var_39_29 = 0.001

			if var_39_28 <= arg_36_1.time_ and arg_36_1.time_ < var_39_28 + var_39_29 then
				local var_39_30 = (arg_36_1.time_ - var_39_28) / var_39_29
				local var_39_31 = Vector3.New(0, 100, 0)

				var_39_27.localPosition = Vector3.Lerp(arg_36_1.var_.moveOldPos1019ui_story, var_39_31, var_39_30)

				local var_39_32 = manager.ui.mainCamera.transform.position - var_39_27.position

				var_39_27.forward = Vector3.New(var_39_32.x, var_39_32.y, var_39_32.z)

				local var_39_33 = var_39_27.localEulerAngles

				var_39_33.z = 0
				var_39_33.x = 0
				var_39_27.localEulerAngles = var_39_33
			end

			if arg_36_1.time_ >= var_39_28 + var_39_29 and arg_36_1.time_ < var_39_28 + var_39_29 + arg_39_0 then
				var_39_27.localPosition = Vector3.New(0, 100, 0)

				local var_39_34 = manager.ui.mainCamera.transform.position - var_39_27.position

				var_39_27.forward = Vector3.New(var_39_34.x, var_39_34.y, var_39_34.z)

				local var_39_35 = var_39_27.localEulerAngles

				var_39_35.z = 0
				var_39_35.x = 0
				var_39_27.localEulerAngles = var_39_35
			end

			local var_39_36 = arg_36_1.actors_["1019ui_story"]
			local var_39_37 = 2

			if var_39_37 < arg_36_1.time_ and arg_36_1.time_ <= var_39_37 + arg_39_0 and arg_36_1.var_.characterEffect1019ui_story == nil then
				arg_36_1.var_.characterEffect1019ui_story = var_39_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_38 = 0.200000002980232

			if var_39_37 <= arg_36_1.time_ and arg_36_1.time_ < var_39_37 + var_39_38 then
				local var_39_39 = (arg_36_1.time_ - var_39_37) / var_39_38

				if arg_36_1.var_.characterEffect1019ui_story then
					local var_39_40 = Mathf.Lerp(0, 0.5, var_39_39)

					arg_36_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_36_1.var_.characterEffect1019ui_story.fillRatio = var_39_40
				end
			end

			if arg_36_1.time_ >= var_39_37 + var_39_38 and arg_36_1.time_ < var_39_37 + var_39_38 + arg_39_0 and arg_36_1.var_.characterEffect1019ui_story then
				local var_39_41 = 0.5

				arg_36_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_36_1.var_.characterEffect1019ui_story.fillRatio = var_39_41
			end

			local var_39_42 = arg_36_1.actors_["1048ui_story"].transform
			local var_39_43 = 2

			if var_39_43 < arg_36_1.time_ and arg_36_1.time_ <= var_39_43 + arg_39_0 then
				arg_36_1.var_.moveOldPos1048ui_story = var_39_42.localPosition
			end

			local var_39_44 = 0.001

			if var_39_43 <= arg_36_1.time_ and arg_36_1.time_ < var_39_43 + var_39_44 then
				local var_39_45 = (arg_36_1.time_ - var_39_43) / var_39_44
				local var_39_46 = Vector3.New(0, 100, 0)

				var_39_42.localPosition = Vector3.Lerp(arg_36_1.var_.moveOldPos1048ui_story, var_39_46, var_39_45)

				local var_39_47 = manager.ui.mainCamera.transform.position - var_39_42.position

				var_39_42.forward = Vector3.New(var_39_47.x, var_39_47.y, var_39_47.z)

				local var_39_48 = var_39_42.localEulerAngles

				var_39_48.z = 0
				var_39_48.x = 0
				var_39_42.localEulerAngles = var_39_48
			end

			if arg_36_1.time_ >= var_39_43 + var_39_44 and arg_36_1.time_ < var_39_43 + var_39_44 + arg_39_0 then
				var_39_42.localPosition = Vector3.New(0, 100, 0)

				local var_39_49 = manager.ui.mainCamera.transform.position - var_39_42.position

				var_39_42.forward = Vector3.New(var_39_49.x, var_39_49.y, var_39_49.z)

				local var_39_50 = var_39_42.localEulerAngles

				var_39_50.z = 0
				var_39_50.x = 0
				var_39_42.localEulerAngles = var_39_50
			end

			local var_39_51 = arg_36_1.actors_["1048ui_story"]
			local var_39_52 = 2

			if var_39_52 < arg_36_1.time_ and arg_36_1.time_ <= var_39_52 + arg_39_0 and arg_36_1.var_.characterEffect1048ui_story == nil then
				arg_36_1.var_.characterEffect1048ui_story = var_39_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_39_53 = 0.200000002980232

			if var_39_52 <= arg_36_1.time_ and arg_36_1.time_ < var_39_52 + var_39_53 then
				local var_39_54 = (arg_36_1.time_ - var_39_52) / var_39_53

				if arg_36_1.var_.characterEffect1048ui_story then
					local var_39_55 = Mathf.Lerp(0, 0.5, var_39_54)

					arg_36_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_36_1.var_.characterEffect1048ui_story.fillRatio = var_39_55
				end
			end

			if arg_36_1.time_ >= var_39_52 + var_39_53 and arg_36_1.time_ < var_39_52 + var_39_53 + arg_39_0 and arg_36_1.var_.characterEffect1048ui_story then
				local var_39_56 = 0.5

				arg_36_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_36_1.var_.characterEffect1048ui_story.fillRatio = var_39_56
			end

			local var_39_57 = 2

			arg_36_1.isInRecall_ = false

			if var_39_57 < arg_36_1.time_ and arg_36_1.time_ <= var_39_57 + arg_39_0 then
				arg_36_1.screenFilterGo_:SetActive(false)

				for iter_39_2, iter_39_3 in pairs(arg_36_1.actors_) do
					local var_39_58 = iter_39_3:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_39_4, iter_39_5 in ipairs(var_39_58) do
						if iter_39_5.color.r > 0.51 then
							iter_39_5.color = Color.New(1, 1, 1)
						else
							iter_39_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end
			end

			local var_39_59 = 0.0166666666666667

			if var_39_57 <= arg_36_1.time_ and arg_36_1.time_ < var_39_57 + var_39_59 then
				local var_39_60 = (arg_36_1.time_ - var_39_57) / var_39_59

				arg_36_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_39_60)
			end

			if arg_36_1.time_ >= var_39_57 + var_39_59 and arg_36_1.time_ < var_39_57 + var_39_59 + arg_39_0 then
				arg_36_1.screenFilterEffect_.weight = 0
			end

			if arg_36_1.frameCnt_ <= 1 then
				arg_36_1.dialog_:SetActive(false)
			end

			local var_39_61 = 4
			local var_39_62 = 0.05

			if var_39_61 < arg_36_1.time_ and arg_36_1.time_ <= var_39_61 + arg_39_0 then
				arg_36_1.talkMaxDuration = 0

				arg_36_1.dialog_:SetActive(true)

				local var_39_63 = LeanTween.value(arg_36_1.dialog_, 0, 1, 0.3)

				var_39_63:setOnUpdate(LuaHelper.FloatAction(function(arg_40_0)
					arg_36_1.dialogCg_.alpha = arg_40_0
				end))
				var_39_63:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_36_1.dialog_)
					var_39_63:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_36_1.duration_ = arg_36_1.duration_ + 0.3

				SetActive(arg_36_1.leftNameGo_, false)

				arg_36_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_36_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_36_1:RecordName(arg_36_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_36_1.iconTrs_.gameObject, false)
				arg_36_1.callingController_:SetSelectedState("normal")

				local var_39_64 = arg_36_1:GetWordFromCfg(910601009)
				local var_39_65 = arg_36_1:FormatText(var_39_64.content)

				arg_36_1.text_.text = var_39_65

				LuaForUtil.ClearLinePrefixSymbol(arg_36_1.text_)

				local var_39_66 = 2
				local var_39_67 = utf8.len(var_39_65)
				local var_39_68 = var_39_66 <= 0 and var_39_62 or var_39_62 * (var_39_67 / var_39_66)

				if var_39_68 > 0 and var_39_62 < var_39_68 then
					arg_36_1.talkMaxDuration = var_39_68
					var_39_61 = var_39_61 + 0.3

					if var_39_68 + var_39_61 > arg_36_1.duration_ then
						arg_36_1.duration_ = var_39_68 + var_39_61
					end
				end

				arg_36_1.text_.text = var_39_65
				arg_36_1.typewritter.percent = 0

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(false)
				arg_36_1:RecordContent(arg_36_1.text_.text)
			end

			local var_39_69 = var_39_61 + 0.3
			local var_39_70 = math.max(var_39_62, arg_36_1.talkMaxDuration)

			if var_39_69 <= arg_36_1.time_ and arg_36_1.time_ < var_39_69 + var_39_70 then
				arg_36_1.typewritter.percent = (arg_36_1.time_ - var_39_69) / var_39_70

				arg_36_1.typewritter:SetDirty()
			end

			if arg_36_1.time_ >= var_39_69 + var_39_70 and arg_36_1.time_ < var_39_69 + var_39_70 + arg_39_0 then
				arg_36_1.typewritter.percent = 1

				arg_36_1.typewritter:SetDirty()
				arg_36_1:ShowNextGo(true)
			end
		end
	end,
	Play910601010 = function(arg_42_0, arg_42_1)
		arg_42_1.time_ = 0
		arg_42_1.frameCnt_ = 0
		arg_42_1.state_ = "playing"
		arg_42_1.curTalkId_ = 910601010
		arg_42_1.duration_ = 9

		SetActive(arg_42_1.tipsGo_, false)

		function arg_42_1.onSingleLineFinish_()
			arg_42_1.onSingleLineUpdate_ = nil
			arg_42_1.onSingleLineFinish_ = nil
			arg_42_1.state_ = "waiting"
		end

		function arg_42_1.playNext_(arg_44_0)
			if arg_44_0 == 1 then
				arg_42_0:Play910601011(arg_42_1)
			end
		end

		function arg_42_1.onSingleLineUpdate_(arg_45_0)
			local var_45_0 = 2

			if var_45_0 < arg_42_1.time_ and arg_42_1.time_ <= var_45_0 + arg_45_0 then
				local var_45_1 = manager.ui.mainCamera.transform.localPosition
				local var_45_2 = Vector3.New(0, 0, 10) + Vector3.New(var_45_1.x, var_45_1.y, 0)
				local var_45_3 = arg_42_1.bgs_.B13

				var_45_3.transform.localPosition = var_45_2
				var_45_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_45_4 = var_45_3:GetComponent("SpriteRenderer")

				if var_45_4 and var_45_4.sprite then
					local var_45_5 = (var_45_3.transform.localPosition - var_45_1).z
					local var_45_6 = manager.ui.mainCameraCom_
					local var_45_7 = 2 * var_45_5 * Mathf.Tan(var_45_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_45_8 = var_45_7 * var_45_6.aspect
					local var_45_9 = var_45_4.sprite.bounds.size.x
					local var_45_10 = var_45_4.sprite.bounds.size.y
					local var_45_11 = var_45_8 / var_45_9
					local var_45_12 = var_45_7 / var_45_10
					local var_45_13 = var_45_12 < var_45_11 and var_45_11 or var_45_12

					var_45_3.transform.localScale = Vector3.New(var_45_13, var_45_13, 0)
				end

				for iter_45_0, iter_45_1 in pairs(arg_42_1.bgs_) do
					if iter_45_0 ~= "B13" then
						iter_45_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_45_14 = 0

			if var_45_14 < arg_42_1.time_ and arg_42_1.time_ <= var_45_14 + arg_45_0 then
				arg_42_1.mask_.enabled = true
				arg_42_1.mask_.raycastTarget = true

				arg_42_1:SetGaussion(false)
			end

			local var_45_15 = 2

			if var_45_14 <= arg_42_1.time_ and arg_42_1.time_ < var_45_14 + var_45_15 then
				local var_45_16 = (arg_42_1.time_ - var_45_14) / var_45_15
				local var_45_17 = Color.New(0, 0, 0)

				var_45_17.a = Mathf.Lerp(0, 1, var_45_16)
				arg_42_1.mask_.color = var_45_17
			end

			if arg_42_1.time_ >= var_45_14 + var_45_15 and arg_42_1.time_ < var_45_14 + var_45_15 + arg_45_0 then
				local var_45_18 = Color.New(0, 0, 0)

				var_45_18.a = 1
				arg_42_1.mask_.color = var_45_18
			end

			local var_45_19 = 2

			if var_45_19 < arg_42_1.time_ and arg_42_1.time_ <= var_45_19 + arg_45_0 then
				arg_42_1.mask_.enabled = true
				arg_42_1.mask_.raycastTarget = true

				arg_42_1:SetGaussion(false)
			end

			local var_45_20 = 2

			if var_45_19 <= arg_42_1.time_ and arg_42_1.time_ < var_45_19 + var_45_20 then
				local var_45_21 = (arg_42_1.time_ - var_45_19) / var_45_20
				local var_45_22 = Color.New(0, 0, 0)

				var_45_22.a = Mathf.Lerp(1, 0, var_45_21)
				arg_42_1.mask_.color = var_45_22
			end

			if arg_42_1.time_ >= var_45_19 + var_45_20 and arg_42_1.time_ < var_45_19 + var_45_20 + arg_45_0 then
				local var_45_23 = Color.New(0, 0, 0)
				local var_45_24 = 0

				arg_42_1.mask_.enabled = false
				var_45_23.a = var_45_24
				arg_42_1.mask_.color = var_45_23
			end

			local var_45_25 = manager.ui.mainCamera.transform
			local var_45_26 = 3.99999999999933

			if var_45_26 < arg_42_1.time_ and arg_42_1.time_ <= var_45_26 + arg_45_0 then
				arg_42_1.var_.shakeOldPos = var_45_25.localPosition
			end

			local var_45_27 = 1.133333333334

			if var_45_26 <= arg_42_1.time_ and arg_42_1.time_ < var_45_26 + var_45_27 then
				local var_45_28 = (arg_42_1.time_ - var_45_26) / 0.066
				local var_45_29, var_45_30 = math.modf(var_45_28)

				var_45_25.localPosition = Vector3.New(var_45_30 * 0.13, var_45_30 * 0.13, var_45_30 * 0.13) + arg_42_1.var_.shakeOldPos
			end

			if arg_42_1.time_ >= var_45_26 + var_45_27 and arg_42_1.time_ < var_45_26 + var_45_27 + arg_45_0 then
				var_45_25.localPosition = arg_42_1.var_.shakeOldPos
			end

			local var_45_31 = 0
			local var_45_32 = 0.633333333333333

			if var_45_31 < arg_42_1.time_ and arg_42_1.time_ <= var_45_31 + arg_45_0 then
				local var_45_33 = "play"
				local var_45_34 = "music"

				arg_42_1:AudioAction(var_45_33, var_45_34, "ui_battle", "ui_battle_stopbgm", "")

				local var_45_35 = ""
				local var_45_36 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_45_36 ~= "" then
					if arg_42_1.bgmTxt_.text ~= var_45_36 and arg_42_1.bgmTxt_.text ~= "" then
						if arg_42_1.bgmTxt2_.text ~= "" then
							arg_42_1.bgmTxt_.text = arg_42_1.bgmTxt2_.text
						end

						arg_42_1.bgmTxt2_.text = var_45_36

						arg_42_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_42_1.bgmTxt_.text = var_45_36
					end

					if arg_42_1.bgmTimer then
						arg_42_1.bgmTimer:Stop()

						arg_42_1.bgmTimer = nil
					end

					if arg_42_1.settingData.show_music_name == 1 then
						arg_42_1.musicController:SetSelectedState("show")
						arg_42_1.musicAnimator_:Play("open", 0, 0)

						if arg_42_1.settingData.music_time ~= 0 then
							arg_42_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_42_1.settingData.music_time), function()
								if arg_42_1 == nil or isNil(arg_42_1.bgmTxt_) then
									return
								end

								arg_42_1.musicController:SetSelectedState("hide")
								arg_42_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_45_37 = 0.8
			local var_45_38 = 1

			if var_45_37 < arg_42_1.time_ and arg_42_1.time_ <= var_45_37 + arg_45_0 then
				local var_45_39 = "play"
				local var_45_40 = "music"

				arg_42_1:AudioAction(var_45_39, var_45_40, "bgm_side_daily02", "bgm_side_daily02", "bgm_side_daily02.awb")

				local var_45_41 = ""
				local var_45_42 = manager.audio:GetAudioName("bgm_side_daily02", "bgm_side_daily02")

				if var_45_42 ~= "" then
					if arg_42_1.bgmTxt_.text ~= var_45_42 and arg_42_1.bgmTxt_.text ~= "" then
						if arg_42_1.bgmTxt2_.text ~= "" then
							arg_42_1.bgmTxt_.text = arg_42_1.bgmTxt2_.text
						end

						arg_42_1.bgmTxt2_.text = var_45_42

						arg_42_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_42_1.bgmTxt_.text = var_45_42
					end

					if arg_42_1.bgmTimer then
						arg_42_1.bgmTimer:Stop()

						arg_42_1.bgmTimer = nil
					end

					if arg_42_1.settingData.show_music_name == 1 then
						arg_42_1.musicController:SetSelectedState("show")
						arg_42_1.musicAnimator_:Play("open", 0, 0)

						if arg_42_1.settingData.music_time ~= 0 then
							arg_42_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_42_1.settingData.music_time), function()
								if arg_42_1 == nil or isNil(arg_42_1.bgmTxt_) then
									return
								end

								arg_42_1.musicController:SetSelectedState("hide")
								arg_42_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			if arg_42_1.frameCnt_ <= 1 then
				arg_42_1.dialog_:SetActive(false)
			end

			local var_45_43 = 4
			local var_45_44 = 0.3

			if var_45_43 < arg_42_1.time_ and arg_42_1.time_ <= var_45_43 + arg_45_0 then
				arg_42_1.talkMaxDuration = 0

				arg_42_1.dialog_:SetActive(true)

				local var_45_45 = LeanTween.value(arg_42_1.dialog_, 0, 1, 0.3)

				var_45_45:setOnUpdate(LuaHelper.FloatAction(function(arg_48_0)
					arg_42_1.dialogCg_.alpha = arg_48_0
				end))
				var_45_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_42_1.dialog_)
					var_45_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_42_1.duration_ = arg_42_1.duration_ + 0.3

				SetActive(arg_42_1.leftNameGo_, true)

				local var_45_46 = arg_42_1:FormatText(StoryNameCfg[7].name)

				arg_42_1.leftNameTxt_.text = var_45_46

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_42_1.leftNameTxt_.transform)

				arg_42_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_42_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_42_1:RecordName(arg_42_1.leftNameTxt_.text)
				SetActive(arg_42_1.iconTrs_.gameObject, false)
				arg_42_1.callingController_:SetSelectedState("normal")

				local var_45_47 = arg_42_1:GetWordFromCfg(910601010)
				local var_45_48 = arg_42_1:FormatText(var_45_47.content)

				arg_42_1.text_.text = var_45_48

				LuaForUtil.ClearLinePrefixSymbol(arg_42_1.text_)

				local var_45_49 = 12
				local var_45_50 = utf8.len(var_45_48)
				local var_45_51 = var_45_49 <= 0 and var_45_44 or var_45_44 * (var_45_50 / var_45_49)

				if var_45_51 > 0 and var_45_44 < var_45_51 then
					arg_42_1.talkMaxDuration = var_45_51
					var_45_43 = var_45_43 + 0.3

					if var_45_51 + var_45_43 > arg_42_1.duration_ then
						arg_42_1.duration_ = var_45_51 + var_45_43
					end
				end

				arg_42_1.text_.text = var_45_48
				arg_42_1.typewritter.percent = 0

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(false)
				arg_42_1:RecordContent(arg_42_1.text_.text)
			end

			local var_45_52 = var_45_43 + 0.3
			local var_45_53 = math.max(var_45_44, arg_42_1.talkMaxDuration)

			if var_45_52 <= arg_42_1.time_ and arg_42_1.time_ < var_45_52 + var_45_53 then
				arg_42_1.typewritter.percent = (arg_42_1.time_ - var_45_52) / var_45_53

				arg_42_1.typewritter:SetDirty()
			end

			if arg_42_1.time_ >= var_45_52 + var_45_53 and arg_42_1.time_ < var_45_52 + var_45_53 + arg_45_0 then
				arg_42_1.typewritter.percent = 1

				arg_42_1.typewritter:SetDirty()
				arg_42_1:ShowNextGo(true)
			end
		end
	end,
	Play910601011 = function(arg_50_0, arg_50_1)
		arg_50_1.time_ = 0
		arg_50_1.frameCnt_ = 0
		arg_50_1.state_ = "playing"
		arg_50_1.curTalkId_ = 910601011
		arg_50_1.duration_ = 5.77

		SetActive(arg_50_1.tipsGo_, false)

		function arg_50_1.onSingleLineFinish_()
			arg_50_1.onSingleLineUpdate_ = nil
			arg_50_1.onSingleLineFinish_ = nil
			arg_50_1.state_ = "waiting"
		end

		function arg_50_1.playNext_(arg_52_0)
			if arg_52_0 == 1 then
				arg_50_0:Play910601012(arg_50_1)
			end
		end

		function arg_50_1.onSingleLineUpdate_(arg_53_0)
			local var_53_0 = arg_50_1.actors_["1084ui_story"].transform
			local var_53_1 = 0

			if var_53_1 < arg_50_1.time_ and arg_50_1.time_ <= var_53_1 + arg_53_0 then
				arg_50_1.var_.moveOldPos1084ui_story = var_53_0.localPosition
			end

			local var_53_2 = 0.001

			if var_53_1 <= arg_50_1.time_ and arg_50_1.time_ < var_53_1 + var_53_2 then
				local var_53_3 = (arg_50_1.time_ - var_53_1) / var_53_2
				local var_53_4 = Vector3.New(-0.7, -0.97, -6)

				var_53_0.localPosition = Vector3.Lerp(arg_50_1.var_.moveOldPos1084ui_story, var_53_4, var_53_3)

				local var_53_5 = manager.ui.mainCamera.transform.position - var_53_0.position

				var_53_0.forward = Vector3.New(var_53_5.x, var_53_5.y, var_53_5.z)

				local var_53_6 = var_53_0.localEulerAngles

				var_53_6.z = 0
				var_53_6.x = 0
				var_53_0.localEulerAngles = var_53_6
			end

			if arg_50_1.time_ >= var_53_1 + var_53_2 and arg_50_1.time_ < var_53_1 + var_53_2 + arg_53_0 then
				var_53_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_53_7 = manager.ui.mainCamera.transform.position - var_53_0.position

				var_53_0.forward = Vector3.New(var_53_7.x, var_53_7.y, var_53_7.z)

				local var_53_8 = var_53_0.localEulerAngles

				var_53_8.z = 0
				var_53_8.x = 0
				var_53_0.localEulerAngles = var_53_8
			end

			local var_53_9 = arg_50_1.actors_["1084ui_story"]
			local var_53_10 = 0

			if var_53_10 < arg_50_1.time_ and arg_50_1.time_ <= var_53_10 + arg_53_0 and arg_50_1.var_.characterEffect1084ui_story == nil then
				arg_50_1.var_.characterEffect1084ui_story = var_53_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_53_11 = 0.200000002980232

			if var_53_10 <= arg_50_1.time_ and arg_50_1.time_ < var_53_10 + var_53_11 then
				local var_53_12 = (arg_50_1.time_ - var_53_10) / var_53_11

				if arg_50_1.var_.characterEffect1084ui_story then
					arg_50_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_50_1.time_ >= var_53_10 + var_53_11 and arg_50_1.time_ < var_53_10 + var_53_11 + arg_53_0 and arg_50_1.var_.characterEffect1084ui_story then
				arg_50_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_53_13 = 0

			if var_53_13 < arg_50_1.time_ and arg_50_1.time_ <= var_53_13 + arg_53_0 then
				arg_50_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_53_14 = 0

			if var_53_14 < arg_50_1.time_ and arg_50_1.time_ <= var_53_14 + arg_53_0 then
				arg_50_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_53_15 = 0
			local var_53_16 = 0.775

			if var_53_15 < arg_50_1.time_ and arg_50_1.time_ <= var_53_15 + arg_53_0 then
				arg_50_1.talkMaxDuration = 0
				arg_50_1.dialogCg_.alpha = 1

				arg_50_1.dialog_:SetActive(true)
				SetActive(arg_50_1.leftNameGo_, true)

				local var_53_17 = arg_50_1:FormatText(StoryNameCfg[6].name)

				arg_50_1.leftNameTxt_.text = var_53_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_50_1.leftNameTxt_.transform)

				arg_50_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_50_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_50_1:RecordName(arg_50_1.leftNameTxt_.text)
				SetActive(arg_50_1.iconTrs_.gameObject, false)
				arg_50_1.callingController_:SetSelectedState("normal")

				local var_53_18 = arg_50_1:GetWordFromCfg(910601011)
				local var_53_19 = arg_50_1:FormatText(var_53_18.content)

				arg_50_1.text_.text = var_53_19

				LuaForUtil.ClearLinePrefixSymbol(arg_50_1.text_)

				local var_53_20 = 31
				local var_53_21 = utf8.len(var_53_19)
				local var_53_22 = var_53_20 <= 0 and var_53_16 or var_53_16 * (var_53_21 / var_53_20)

				if var_53_22 > 0 and var_53_16 < var_53_22 then
					arg_50_1.talkMaxDuration = var_53_22

					if var_53_22 + var_53_15 > arg_50_1.duration_ then
						arg_50_1.duration_ = var_53_22 + var_53_15
					end
				end

				arg_50_1.text_.text = var_53_19
				arg_50_1.typewritter.percent = 0

				arg_50_1.typewritter:SetDirty()
				arg_50_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601011", "story_v_out_910601.awb") ~= 0 then
					local var_53_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601011", "story_v_out_910601.awb") / 1000

					if var_53_23 + var_53_15 > arg_50_1.duration_ then
						arg_50_1.duration_ = var_53_23 + var_53_15
					end

					if var_53_18.prefab_name ~= "" and arg_50_1.actors_[var_53_18.prefab_name] ~= nil then
						local var_53_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_50_1.actors_[var_53_18.prefab_name].transform, "story_v_out_910601", "910601011", "story_v_out_910601.awb")

						arg_50_1:RecordAudio("910601011", var_53_24)
						arg_50_1:RecordAudio("910601011", var_53_24)
					else
						arg_50_1:AudioAction("play", "voice", "story_v_out_910601", "910601011", "story_v_out_910601.awb")
					end

					arg_50_1:RecordHistoryTalkVoice("story_v_out_910601", "910601011", "story_v_out_910601.awb")
				end

				arg_50_1:RecordContent(arg_50_1.text_.text)
			end

			local var_53_25 = math.max(var_53_16, arg_50_1.talkMaxDuration)

			if var_53_15 <= arg_50_1.time_ and arg_50_1.time_ < var_53_15 + var_53_25 then
				arg_50_1.typewritter.percent = (arg_50_1.time_ - var_53_15) / var_53_25

				arg_50_1.typewritter:SetDirty()
			end

			if arg_50_1.time_ >= var_53_15 + var_53_25 and arg_50_1.time_ < var_53_15 + var_53_25 + arg_53_0 then
				arg_50_1.typewritter.percent = 1

				arg_50_1.typewritter:SetDirty()
				arg_50_1:ShowNextGo(true)
			end
		end
	end,
	Play910601012 = function(arg_54_0, arg_54_1)
		arg_54_1.time_ = 0
		arg_54_1.frameCnt_ = 0
		arg_54_1.state_ = "playing"
		arg_54_1.curTalkId_ = 910601012
		arg_54_1.duration_ = 2.93

		SetActive(arg_54_1.tipsGo_, false)

		function arg_54_1.onSingleLineFinish_()
			arg_54_1.onSingleLineUpdate_ = nil
			arg_54_1.onSingleLineFinish_ = nil
			arg_54_1.state_ = "waiting"
		end

		function arg_54_1.playNext_(arg_56_0)
			if arg_56_0 == 1 then
				arg_54_0:Play910601013(arg_54_1)
			end
		end

		function arg_54_1.onSingleLineUpdate_(arg_57_0)
			local var_57_0 = arg_54_1.actors_["1011ui_story"].transform
			local var_57_1 = 0

			if var_57_1 < arg_54_1.time_ and arg_54_1.time_ <= var_57_1 + arg_57_0 then
				arg_54_1.var_.moveOldPos1011ui_story = var_57_0.localPosition
			end

			local var_57_2 = 0.001

			if var_57_1 <= arg_54_1.time_ and arg_54_1.time_ < var_57_1 + var_57_2 then
				local var_57_3 = (arg_54_1.time_ - var_57_1) / var_57_2
				local var_57_4 = Vector3.New(0.7, -0.71, -6)

				var_57_0.localPosition = Vector3.Lerp(arg_54_1.var_.moveOldPos1011ui_story, var_57_4, var_57_3)

				local var_57_5 = manager.ui.mainCamera.transform.position - var_57_0.position

				var_57_0.forward = Vector3.New(var_57_5.x, var_57_5.y, var_57_5.z)

				local var_57_6 = var_57_0.localEulerAngles

				var_57_6.z = 0
				var_57_6.x = 0
				var_57_0.localEulerAngles = var_57_6
			end

			if arg_54_1.time_ >= var_57_1 + var_57_2 and arg_54_1.time_ < var_57_1 + var_57_2 + arg_57_0 then
				var_57_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_57_7 = manager.ui.mainCamera.transform.position - var_57_0.position

				var_57_0.forward = Vector3.New(var_57_7.x, var_57_7.y, var_57_7.z)

				local var_57_8 = var_57_0.localEulerAngles

				var_57_8.z = 0
				var_57_8.x = 0
				var_57_0.localEulerAngles = var_57_8
			end

			local var_57_9 = arg_54_1.actors_["1011ui_story"]
			local var_57_10 = 0

			if var_57_10 < arg_54_1.time_ and arg_54_1.time_ <= var_57_10 + arg_57_0 and arg_54_1.var_.characterEffect1011ui_story == nil then
				arg_54_1.var_.characterEffect1011ui_story = var_57_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_57_11 = 0.200000002980232

			if var_57_10 <= arg_54_1.time_ and arg_54_1.time_ < var_57_10 + var_57_11 then
				local var_57_12 = (arg_54_1.time_ - var_57_10) / var_57_11

				if arg_54_1.var_.characterEffect1011ui_story then
					arg_54_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_54_1.time_ >= var_57_10 + var_57_11 and arg_54_1.time_ < var_57_10 + var_57_11 + arg_57_0 and arg_54_1.var_.characterEffect1011ui_story then
				arg_54_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_57_13 = 0

			if var_57_13 < arg_54_1.time_ and arg_54_1.time_ <= var_57_13 + arg_57_0 then
				arg_54_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_57_14 = 0

			if var_57_14 < arg_54_1.time_ and arg_54_1.time_ <= var_57_14 + arg_57_0 then
				arg_54_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_57_15 = arg_54_1.actors_["1084ui_story"].transform
			local var_57_16 = 0

			if var_57_16 < arg_54_1.time_ and arg_54_1.time_ <= var_57_16 + arg_57_0 then
				arg_54_1.var_.moveOldPos1084ui_story = var_57_15.localPosition
			end

			local var_57_17 = 0.001

			if var_57_16 <= arg_54_1.time_ and arg_54_1.time_ < var_57_16 + var_57_17 then
				local var_57_18 = (arg_54_1.time_ - var_57_16) / var_57_17
				local var_57_19 = Vector3.New(-0.7, -0.97, -6)

				var_57_15.localPosition = Vector3.Lerp(arg_54_1.var_.moveOldPos1084ui_story, var_57_19, var_57_18)

				local var_57_20 = manager.ui.mainCamera.transform.position - var_57_15.position

				var_57_15.forward = Vector3.New(var_57_20.x, var_57_20.y, var_57_20.z)

				local var_57_21 = var_57_15.localEulerAngles

				var_57_21.z = 0
				var_57_21.x = 0
				var_57_15.localEulerAngles = var_57_21
			end

			if arg_54_1.time_ >= var_57_16 + var_57_17 and arg_54_1.time_ < var_57_16 + var_57_17 + arg_57_0 then
				var_57_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_57_22 = manager.ui.mainCamera.transform.position - var_57_15.position

				var_57_15.forward = Vector3.New(var_57_22.x, var_57_22.y, var_57_22.z)

				local var_57_23 = var_57_15.localEulerAngles

				var_57_23.z = 0
				var_57_23.x = 0
				var_57_15.localEulerAngles = var_57_23
			end

			local var_57_24 = arg_54_1.actors_["1084ui_story"]
			local var_57_25 = 0

			if var_57_25 < arg_54_1.time_ and arg_54_1.time_ <= var_57_25 + arg_57_0 and arg_54_1.var_.characterEffect1084ui_story == nil then
				arg_54_1.var_.characterEffect1084ui_story = var_57_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_57_26 = 0.200000002980232

			if var_57_25 <= arg_54_1.time_ and arg_54_1.time_ < var_57_25 + var_57_26 then
				local var_57_27 = (arg_54_1.time_ - var_57_25) / var_57_26

				if arg_54_1.var_.characterEffect1084ui_story then
					local var_57_28 = Mathf.Lerp(0, 0.5, var_57_27)

					arg_54_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_54_1.var_.characterEffect1084ui_story.fillRatio = var_57_28
				end
			end

			if arg_54_1.time_ >= var_57_25 + var_57_26 and arg_54_1.time_ < var_57_25 + var_57_26 + arg_57_0 and arg_54_1.var_.characterEffect1084ui_story then
				local var_57_29 = 0.5

				arg_54_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_54_1.var_.characterEffect1084ui_story.fillRatio = var_57_29
			end

			local var_57_30 = 0
			local var_57_31 = 0.3

			if var_57_30 < arg_54_1.time_ and arg_54_1.time_ <= var_57_30 + arg_57_0 then
				arg_54_1.talkMaxDuration = 0
				arg_54_1.dialogCg_.alpha = 1

				arg_54_1.dialog_:SetActive(true)
				SetActive(arg_54_1.leftNameGo_, true)

				local var_57_32 = arg_54_1:FormatText(StoryNameCfg[37].name)

				arg_54_1.leftNameTxt_.text = var_57_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_54_1.leftNameTxt_.transform)

				arg_54_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_54_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_54_1:RecordName(arg_54_1.leftNameTxt_.text)
				SetActive(arg_54_1.iconTrs_.gameObject, false)
				arg_54_1.callingController_:SetSelectedState("normal")

				local var_57_33 = arg_54_1:GetWordFromCfg(910601012)
				local var_57_34 = arg_54_1:FormatText(var_57_33.content)

				arg_54_1.text_.text = var_57_34

				LuaForUtil.ClearLinePrefixSymbol(arg_54_1.text_)

				local var_57_35 = 12
				local var_57_36 = utf8.len(var_57_34)
				local var_57_37 = var_57_35 <= 0 and var_57_31 or var_57_31 * (var_57_36 / var_57_35)

				if var_57_37 > 0 and var_57_31 < var_57_37 then
					arg_54_1.talkMaxDuration = var_57_37

					if var_57_37 + var_57_30 > arg_54_1.duration_ then
						arg_54_1.duration_ = var_57_37 + var_57_30
					end
				end

				arg_54_1.text_.text = var_57_34
				arg_54_1.typewritter.percent = 0

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601012", "story_v_out_910601.awb") ~= 0 then
					local var_57_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601012", "story_v_out_910601.awb") / 1000

					if var_57_38 + var_57_30 > arg_54_1.duration_ then
						arg_54_1.duration_ = var_57_38 + var_57_30
					end

					if var_57_33.prefab_name ~= "" and arg_54_1.actors_[var_57_33.prefab_name] ~= nil then
						local var_57_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_54_1.actors_[var_57_33.prefab_name].transform, "story_v_out_910601", "910601012", "story_v_out_910601.awb")

						arg_54_1:RecordAudio("910601012", var_57_39)
						arg_54_1:RecordAudio("910601012", var_57_39)
					else
						arg_54_1:AudioAction("play", "voice", "story_v_out_910601", "910601012", "story_v_out_910601.awb")
					end

					arg_54_1:RecordHistoryTalkVoice("story_v_out_910601", "910601012", "story_v_out_910601.awb")
				end

				arg_54_1:RecordContent(arg_54_1.text_.text)
			end

			local var_57_40 = math.max(var_57_31, arg_54_1.talkMaxDuration)

			if var_57_30 <= arg_54_1.time_ and arg_54_1.time_ < var_57_30 + var_57_40 then
				arg_54_1.typewritter.percent = (arg_54_1.time_ - var_57_30) / var_57_40

				arg_54_1.typewritter:SetDirty()
			end

			if arg_54_1.time_ >= var_57_30 + var_57_40 and arg_54_1.time_ < var_57_30 + var_57_40 + arg_57_0 then
				arg_54_1.typewritter.percent = 1

				arg_54_1.typewritter:SetDirty()
				arg_54_1:ShowNextGo(true)
			end
		end
	end,
	Play910601013 = function(arg_58_0, arg_58_1)
		arg_58_1.time_ = 0
		arg_58_1.frameCnt_ = 0
		arg_58_1.state_ = "playing"
		arg_58_1.curTalkId_ = 910601013
		arg_58_1.duration_ = 5

		SetActive(arg_58_1.tipsGo_, false)

		function arg_58_1.onSingleLineFinish_()
			arg_58_1.onSingleLineUpdate_ = nil
			arg_58_1.onSingleLineFinish_ = nil
			arg_58_1.state_ = "waiting"
		end

		function arg_58_1.playNext_(arg_60_0)
			if arg_60_0 == 1 then
				arg_58_0:Play910601014(arg_58_1)
			end
		end

		function arg_58_1.onSingleLineUpdate_(arg_61_0)
			local var_61_0 = arg_58_1.actors_["1011ui_story"]
			local var_61_1 = 0

			if var_61_1 < arg_58_1.time_ and arg_58_1.time_ <= var_61_1 + arg_61_0 and arg_58_1.var_.characterEffect1011ui_story == nil then
				arg_58_1.var_.characterEffect1011ui_story = var_61_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_61_2 = 0.200000002980232

			if var_61_1 <= arg_58_1.time_ and arg_58_1.time_ < var_61_1 + var_61_2 then
				local var_61_3 = (arg_58_1.time_ - var_61_1) / var_61_2

				if arg_58_1.var_.characterEffect1011ui_story then
					local var_61_4 = Mathf.Lerp(0, 0.5, var_61_3)

					arg_58_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_58_1.var_.characterEffect1011ui_story.fillRatio = var_61_4
				end
			end

			if arg_58_1.time_ >= var_61_1 + var_61_2 and arg_58_1.time_ < var_61_1 + var_61_2 + arg_61_0 and arg_58_1.var_.characterEffect1011ui_story then
				local var_61_5 = 0.5

				arg_58_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_58_1.var_.characterEffect1011ui_story.fillRatio = var_61_5
			end

			local var_61_6 = 0
			local var_61_7 = 0.65

			if var_61_6 < arg_58_1.time_ and arg_58_1.time_ <= var_61_6 + arg_61_0 then
				arg_58_1.talkMaxDuration = 0
				arg_58_1.dialogCg_.alpha = 1

				arg_58_1.dialog_:SetActive(true)
				SetActive(arg_58_1.leftNameGo_, true)

				local var_61_8 = arg_58_1:FormatText(StoryNameCfg[7].name)

				arg_58_1.leftNameTxt_.text = var_61_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_58_1.leftNameTxt_.transform)

				arg_58_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_58_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_58_1:RecordName(arg_58_1.leftNameTxt_.text)
				SetActive(arg_58_1.iconTrs_.gameObject, false)
				arg_58_1.callingController_:SetSelectedState("normal")

				local var_61_9 = arg_58_1:GetWordFromCfg(910601013)
				local var_61_10 = arg_58_1:FormatText(var_61_9.content)

				arg_58_1.text_.text = var_61_10

				LuaForUtil.ClearLinePrefixSymbol(arg_58_1.text_)

				local var_61_11 = 26
				local var_61_12 = utf8.len(var_61_10)
				local var_61_13 = var_61_11 <= 0 and var_61_7 or var_61_7 * (var_61_12 / var_61_11)

				if var_61_13 > 0 and var_61_7 < var_61_13 then
					arg_58_1.talkMaxDuration = var_61_13

					if var_61_13 + var_61_6 > arg_58_1.duration_ then
						arg_58_1.duration_ = var_61_13 + var_61_6
					end
				end

				arg_58_1.text_.text = var_61_10
				arg_58_1.typewritter.percent = 0

				arg_58_1.typewritter:SetDirty()
				arg_58_1:ShowNextGo(false)
				arg_58_1:RecordContent(arg_58_1.text_.text)
			end

			local var_61_14 = math.max(var_61_7, arg_58_1.talkMaxDuration)

			if var_61_6 <= arg_58_1.time_ and arg_58_1.time_ < var_61_6 + var_61_14 then
				arg_58_1.typewritter.percent = (arg_58_1.time_ - var_61_6) / var_61_14

				arg_58_1.typewritter:SetDirty()
			end

			if arg_58_1.time_ >= var_61_6 + var_61_14 and arg_58_1.time_ < var_61_6 + var_61_14 + arg_61_0 then
				arg_58_1.typewritter.percent = 1

				arg_58_1.typewritter:SetDirty()
				arg_58_1:ShowNextGo(true)
			end
		end
	end,
	Play910601014 = function(arg_62_0, arg_62_1)
		arg_62_1.time_ = 0
		arg_62_1.frameCnt_ = 0
		arg_62_1.state_ = "playing"
		arg_62_1.curTalkId_ = 910601014
		arg_62_1.duration_ = 5

		SetActive(arg_62_1.tipsGo_, false)

		function arg_62_1.onSingleLineFinish_()
			arg_62_1.onSingleLineUpdate_ = nil
			arg_62_1.onSingleLineFinish_ = nil
			arg_62_1.state_ = "waiting"
		end

		function arg_62_1.playNext_(arg_64_0)
			if arg_64_0 == 1 then
				arg_62_0:Play910601015(arg_62_1)
			end
		end

		function arg_62_1.onSingleLineUpdate_(arg_65_0)
			local var_65_0 = arg_62_1.actors_["1011ui_story"].transform
			local var_65_1 = 0

			if var_65_1 < arg_62_1.time_ and arg_62_1.time_ <= var_65_1 + arg_65_0 then
				arg_62_1.var_.moveOldPos1011ui_story = var_65_0.localPosition
			end

			local var_65_2 = 0.001

			if var_65_1 <= arg_62_1.time_ and arg_62_1.time_ < var_65_1 + var_65_2 then
				local var_65_3 = (arg_62_1.time_ - var_65_1) / var_65_2
				local var_65_4 = Vector3.New(0, 100, 0)

				var_65_0.localPosition = Vector3.Lerp(arg_62_1.var_.moveOldPos1011ui_story, var_65_4, var_65_3)

				local var_65_5 = manager.ui.mainCamera.transform.position - var_65_0.position

				var_65_0.forward = Vector3.New(var_65_5.x, var_65_5.y, var_65_5.z)

				local var_65_6 = var_65_0.localEulerAngles

				var_65_6.z = 0
				var_65_6.x = 0
				var_65_0.localEulerAngles = var_65_6
			end

			if arg_62_1.time_ >= var_65_1 + var_65_2 and arg_62_1.time_ < var_65_1 + var_65_2 + arg_65_0 then
				var_65_0.localPosition = Vector3.New(0, 100, 0)

				local var_65_7 = manager.ui.mainCamera.transform.position - var_65_0.position

				var_65_0.forward = Vector3.New(var_65_7.x, var_65_7.y, var_65_7.z)

				local var_65_8 = var_65_0.localEulerAngles

				var_65_8.z = 0
				var_65_8.x = 0
				var_65_0.localEulerAngles = var_65_8
			end

			local var_65_9 = arg_62_1.actors_["1011ui_story"]
			local var_65_10 = 0

			if var_65_10 < arg_62_1.time_ and arg_62_1.time_ <= var_65_10 + arg_65_0 and arg_62_1.var_.characterEffect1011ui_story == nil then
				arg_62_1.var_.characterEffect1011ui_story = var_65_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_65_11 = 0.200000002980232

			if var_65_10 <= arg_62_1.time_ and arg_62_1.time_ < var_65_10 + var_65_11 then
				local var_65_12 = (arg_62_1.time_ - var_65_10) / var_65_11

				if arg_62_1.var_.characterEffect1011ui_story then
					local var_65_13 = Mathf.Lerp(0, 0.5, var_65_12)

					arg_62_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_62_1.var_.characterEffect1011ui_story.fillRatio = var_65_13
				end
			end

			if arg_62_1.time_ >= var_65_10 + var_65_11 and arg_62_1.time_ < var_65_10 + var_65_11 + arg_65_0 and arg_62_1.var_.characterEffect1011ui_story then
				local var_65_14 = 0.5

				arg_62_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_62_1.var_.characterEffect1011ui_story.fillRatio = var_65_14
			end

			local var_65_15 = arg_62_1.actors_["1084ui_story"].transform
			local var_65_16 = 0

			if var_65_16 < arg_62_1.time_ and arg_62_1.time_ <= var_65_16 + arg_65_0 then
				arg_62_1.var_.moveOldPos1084ui_story = var_65_15.localPosition
			end

			local var_65_17 = 0.001

			if var_65_16 <= arg_62_1.time_ and arg_62_1.time_ < var_65_16 + var_65_17 then
				local var_65_18 = (arg_62_1.time_ - var_65_16) / var_65_17
				local var_65_19 = Vector3.New(0, 100, 0)

				var_65_15.localPosition = Vector3.Lerp(arg_62_1.var_.moveOldPos1084ui_story, var_65_19, var_65_18)

				local var_65_20 = manager.ui.mainCamera.transform.position - var_65_15.position

				var_65_15.forward = Vector3.New(var_65_20.x, var_65_20.y, var_65_20.z)

				local var_65_21 = var_65_15.localEulerAngles

				var_65_21.z = 0
				var_65_21.x = 0
				var_65_15.localEulerAngles = var_65_21
			end

			if arg_62_1.time_ >= var_65_16 + var_65_17 and arg_62_1.time_ < var_65_16 + var_65_17 + arg_65_0 then
				var_65_15.localPosition = Vector3.New(0, 100, 0)

				local var_65_22 = manager.ui.mainCamera.transform.position - var_65_15.position

				var_65_15.forward = Vector3.New(var_65_22.x, var_65_22.y, var_65_22.z)

				local var_65_23 = var_65_15.localEulerAngles

				var_65_23.z = 0
				var_65_23.x = 0
				var_65_15.localEulerAngles = var_65_23
			end

			local var_65_24 = arg_62_1.actors_["1084ui_story"]
			local var_65_25 = 0

			if var_65_25 < arg_62_1.time_ and arg_62_1.time_ <= var_65_25 + arg_65_0 and arg_62_1.var_.characterEffect1084ui_story == nil then
				arg_62_1.var_.characterEffect1084ui_story = var_65_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_65_26 = 0.200000002980232

			if var_65_25 <= arg_62_1.time_ and arg_62_1.time_ < var_65_25 + var_65_26 then
				local var_65_27 = (arg_62_1.time_ - var_65_25) / var_65_26

				if arg_62_1.var_.characterEffect1084ui_story then
					local var_65_28 = Mathf.Lerp(0, 0.5, var_65_27)

					arg_62_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_62_1.var_.characterEffect1084ui_story.fillRatio = var_65_28
				end
			end

			if arg_62_1.time_ >= var_65_25 + var_65_26 and arg_62_1.time_ < var_65_25 + var_65_26 + arg_65_0 and arg_62_1.var_.characterEffect1084ui_story then
				local var_65_29 = 0.5

				arg_62_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_62_1.var_.characterEffect1084ui_story.fillRatio = var_65_29
			end

			local var_65_30 = 0
			local var_65_31 = 1.225

			if var_65_30 < arg_62_1.time_ and arg_62_1.time_ <= var_65_30 + arg_65_0 then
				arg_62_1.talkMaxDuration = 0
				arg_62_1.dialogCg_.alpha = 1

				arg_62_1.dialog_:SetActive(true)
				SetActive(arg_62_1.leftNameGo_, false)

				arg_62_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_62_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_62_1:RecordName(arg_62_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_62_1.iconTrs_.gameObject, false)
				arg_62_1.callingController_:SetSelectedState("normal")

				local var_65_32 = arg_62_1:GetWordFromCfg(910601014)
				local var_65_33 = arg_62_1:FormatText(var_65_32.content)

				arg_62_1.text_.text = var_65_33

				LuaForUtil.ClearLinePrefixSymbol(arg_62_1.text_)

				local var_65_34 = 49
				local var_65_35 = utf8.len(var_65_33)
				local var_65_36 = var_65_34 <= 0 and var_65_31 or var_65_31 * (var_65_35 / var_65_34)

				if var_65_36 > 0 and var_65_31 < var_65_36 then
					arg_62_1.talkMaxDuration = var_65_36

					if var_65_36 + var_65_30 > arg_62_1.duration_ then
						arg_62_1.duration_ = var_65_36 + var_65_30
					end
				end

				arg_62_1.text_.text = var_65_33
				arg_62_1.typewritter.percent = 0

				arg_62_1.typewritter:SetDirty()
				arg_62_1:ShowNextGo(false)
				arg_62_1:RecordContent(arg_62_1.text_.text)
			end

			local var_65_37 = math.max(var_65_31, arg_62_1.talkMaxDuration)

			if var_65_30 <= arg_62_1.time_ and arg_62_1.time_ < var_65_30 + var_65_37 then
				arg_62_1.typewritter.percent = (arg_62_1.time_ - var_65_30) / var_65_37

				arg_62_1.typewritter:SetDirty()
			end

			if arg_62_1.time_ >= var_65_30 + var_65_37 and arg_62_1.time_ < var_65_30 + var_65_37 + arg_65_0 then
				arg_62_1.typewritter.percent = 1

				arg_62_1.typewritter:SetDirty()
				arg_62_1:ShowNextGo(true)
			end
		end
	end,
	Play910601015 = function(arg_66_0, arg_66_1)
		arg_66_1.time_ = 0
		arg_66_1.frameCnt_ = 0
		arg_66_1.state_ = "playing"
		arg_66_1.curTalkId_ = 910601015
		arg_66_1.duration_ = 3.5

		SetActive(arg_66_1.tipsGo_, false)

		function arg_66_1.onSingleLineFinish_()
			arg_66_1.onSingleLineUpdate_ = nil
			arg_66_1.onSingleLineFinish_ = nil
			arg_66_1.state_ = "waiting"
		end

		function arg_66_1.playNext_(arg_68_0)
			if arg_68_0 == 1 then
				arg_66_0:Play910601016(arg_66_1)
			end
		end

		function arg_66_1.onSingleLineUpdate_(arg_69_0)
			local var_69_0 = "1059ui_story"

			if arg_66_1.actors_[var_69_0] == nil then
				local var_69_1 = Object.Instantiate(Asset.Load("Char/" .. var_69_0), arg_66_1.stage_.transform)

				var_69_1.name = var_69_0
				var_69_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_66_1.actors_[var_69_0] = var_69_1

				local var_69_2 = var_69_1:GetComponentInChildren(typeof(CharacterEffect))

				var_69_2.enabled = true

				local var_69_3 = GameObjectTools.GetOrAddComponent(var_69_1, typeof(DynamicBoneHelper))

				if var_69_3 then
					var_69_3:EnableDynamicBone(false)
				end

				arg_66_1:ShowWeapon(var_69_2.transform, false)

				arg_66_1.var_[var_69_0 .. "Animator"] = var_69_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_66_1.var_[var_69_0 .. "Animator"].applyRootMotion = true
				arg_66_1.var_[var_69_0 .. "LipSync"] = var_69_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_69_4 = arg_66_1.actors_["1059ui_story"].transform
			local var_69_5 = 0

			if var_69_5 < arg_66_1.time_ and arg_66_1.time_ <= var_69_5 + arg_69_0 then
				arg_66_1.var_.moveOldPos1059ui_story = var_69_4.localPosition
			end

			local var_69_6 = 0.001

			if var_69_5 <= arg_66_1.time_ and arg_66_1.time_ < var_69_5 + var_69_6 then
				local var_69_7 = (arg_66_1.time_ - var_69_5) / var_69_6
				local var_69_8 = Vector3.New(0, -1.05, -6)

				var_69_4.localPosition = Vector3.Lerp(arg_66_1.var_.moveOldPos1059ui_story, var_69_8, var_69_7)

				local var_69_9 = manager.ui.mainCamera.transform.position - var_69_4.position

				var_69_4.forward = Vector3.New(var_69_9.x, var_69_9.y, var_69_9.z)

				local var_69_10 = var_69_4.localEulerAngles

				var_69_10.z = 0
				var_69_10.x = 0
				var_69_4.localEulerAngles = var_69_10
			end

			if arg_66_1.time_ >= var_69_5 + var_69_6 and arg_66_1.time_ < var_69_5 + var_69_6 + arg_69_0 then
				var_69_4.localPosition = Vector3.New(0, -1.05, -6)

				local var_69_11 = manager.ui.mainCamera.transform.position - var_69_4.position

				var_69_4.forward = Vector3.New(var_69_11.x, var_69_11.y, var_69_11.z)

				local var_69_12 = var_69_4.localEulerAngles

				var_69_12.z = 0
				var_69_12.x = 0
				var_69_4.localEulerAngles = var_69_12
			end

			local var_69_13 = arg_66_1.actors_["1059ui_story"]
			local var_69_14 = 0

			if var_69_14 < arg_66_1.time_ and arg_66_1.time_ <= var_69_14 + arg_69_0 and arg_66_1.var_.characterEffect1059ui_story == nil then
				arg_66_1.var_.characterEffect1059ui_story = var_69_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_69_15 = 0.200000002980232

			if var_69_14 <= arg_66_1.time_ and arg_66_1.time_ < var_69_14 + var_69_15 then
				local var_69_16 = (arg_66_1.time_ - var_69_14) / var_69_15

				if arg_66_1.var_.characterEffect1059ui_story then
					arg_66_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_66_1.time_ >= var_69_14 + var_69_15 and arg_66_1.time_ < var_69_14 + var_69_15 + arg_69_0 and arg_66_1.var_.characterEffect1059ui_story then
				arg_66_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_69_17 = 0

			if var_69_17 < arg_66_1.time_ and arg_66_1.time_ <= var_69_17 + arg_69_0 then
				arg_66_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_69_18 = 0

			if var_69_18 < arg_66_1.time_ and arg_66_1.time_ <= var_69_18 + arg_69_0 then
				arg_66_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_69_19 = 0
			local var_69_20 = 0.45

			if var_69_19 < arg_66_1.time_ and arg_66_1.time_ <= var_69_19 + arg_69_0 then
				arg_66_1.talkMaxDuration = 0
				arg_66_1.dialogCg_.alpha = 1

				arg_66_1.dialog_:SetActive(true)
				SetActive(arg_66_1.leftNameGo_, true)

				local var_69_21 = arg_66_1:FormatText(StoryNameCfg[28].name)

				arg_66_1.leftNameTxt_.text = var_69_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_66_1.leftNameTxt_.transform)

				arg_66_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_66_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_66_1:RecordName(arg_66_1.leftNameTxt_.text)
				SetActive(arg_66_1.iconTrs_.gameObject, false)
				arg_66_1.callingController_:SetSelectedState("normal")

				local var_69_22 = arg_66_1:GetWordFromCfg(910601015)
				local var_69_23 = arg_66_1:FormatText(var_69_22.content)

				arg_66_1.text_.text = var_69_23

				LuaForUtil.ClearLinePrefixSymbol(arg_66_1.text_)

				local var_69_24 = 18
				local var_69_25 = utf8.len(var_69_23)
				local var_69_26 = var_69_24 <= 0 and var_69_20 or var_69_20 * (var_69_25 / var_69_24)

				if var_69_26 > 0 and var_69_20 < var_69_26 then
					arg_66_1.talkMaxDuration = var_69_26

					if var_69_26 + var_69_19 > arg_66_1.duration_ then
						arg_66_1.duration_ = var_69_26 + var_69_19
					end
				end

				arg_66_1.text_.text = var_69_23
				arg_66_1.typewritter.percent = 0

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601015", "story_v_out_910601.awb") ~= 0 then
					local var_69_27 = manager.audio:GetVoiceLength("story_v_out_910601", "910601015", "story_v_out_910601.awb") / 1000

					if var_69_27 + var_69_19 > arg_66_1.duration_ then
						arg_66_1.duration_ = var_69_27 + var_69_19
					end

					if var_69_22.prefab_name ~= "" and arg_66_1.actors_[var_69_22.prefab_name] ~= nil then
						local var_69_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_66_1.actors_[var_69_22.prefab_name].transform, "story_v_out_910601", "910601015", "story_v_out_910601.awb")

						arg_66_1:RecordAudio("910601015", var_69_28)
						arg_66_1:RecordAudio("910601015", var_69_28)
					else
						arg_66_1:AudioAction("play", "voice", "story_v_out_910601", "910601015", "story_v_out_910601.awb")
					end

					arg_66_1:RecordHistoryTalkVoice("story_v_out_910601", "910601015", "story_v_out_910601.awb")
				end

				arg_66_1:RecordContent(arg_66_1.text_.text)
			end

			local var_69_29 = math.max(var_69_20, arg_66_1.talkMaxDuration)

			if var_69_19 <= arg_66_1.time_ and arg_66_1.time_ < var_69_19 + var_69_29 then
				arg_66_1.typewritter.percent = (arg_66_1.time_ - var_69_19) / var_69_29

				arg_66_1.typewritter:SetDirty()
			end

			if arg_66_1.time_ >= var_69_19 + var_69_29 and arg_66_1.time_ < var_69_19 + var_69_29 + arg_69_0 then
				arg_66_1.typewritter.percent = 1

				arg_66_1.typewritter:SetDirty()
				arg_66_1:ShowNextGo(true)
			end
		end
	end,
	Play910601016 = function(arg_70_0, arg_70_1)
		arg_70_1.time_ = 0
		arg_70_1.frameCnt_ = 0
		arg_70_1.state_ = "playing"
		arg_70_1.curTalkId_ = 910601016
		arg_70_1.duration_ = 2

		SetActive(arg_70_1.tipsGo_, false)

		function arg_70_1.onSingleLineFinish_()
			arg_70_1.onSingleLineUpdate_ = nil
			arg_70_1.onSingleLineFinish_ = nil
			arg_70_1.state_ = "waiting"
		end

		function arg_70_1.playNext_(arg_72_0)
			if arg_72_0 == 1 then
				arg_70_0:Play910601017(arg_70_1)
			end
		end

		function arg_70_1.onSingleLineUpdate_(arg_73_0)
			local var_73_0 = "1028ui_story"

			if arg_70_1.actors_[var_73_0] == nil then
				local var_73_1 = Object.Instantiate(Asset.Load("Char/" .. var_73_0), arg_70_1.stage_.transform)

				var_73_1.name = var_73_0
				var_73_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_70_1.actors_[var_73_0] = var_73_1

				local var_73_2 = var_73_1:GetComponentInChildren(typeof(CharacterEffect))

				var_73_2.enabled = true

				local var_73_3 = GameObjectTools.GetOrAddComponent(var_73_1, typeof(DynamicBoneHelper))

				if var_73_3 then
					var_73_3:EnableDynamicBone(false)
				end

				arg_70_1:ShowWeapon(var_73_2.transform, false)

				arg_70_1.var_[var_73_0 .. "Animator"] = var_73_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_70_1.var_[var_73_0 .. "Animator"].applyRootMotion = true
				arg_70_1.var_[var_73_0 .. "LipSync"] = var_73_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_73_4 = arg_70_1.actors_["1028ui_story"].transform
			local var_73_5 = 0

			if var_73_5 < arg_70_1.time_ and arg_70_1.time_ <= var_73_5 + arg_73_0 then
				arg_70_1.var_.moveOldPos1028ui_story = var_73_4.localPosition

				local var_73_6 = "1028ui_story"

				arg_70_1:ShowWeapon(arg_70_1.var_[var_73_6 .. "Animator"].transform, false)
			end

			local var_73_7 = 0.001

			if var_73_5 <= arg_70_1.time_ and arg_70_1.time_ < var_73_5 + var_73_7 then
				local var_73_8 = (arg_70_1.time_ - var_73_5) / var_73_7
				local var_73_9 = Vector3.New(0, -0.9, -5.9)

				var_73_4.localPosition = Vector3.Lerp(arg_70_1.var_.moveOldPos1028ui_story, var_73_9, var_73_8)

				local var_73_10 = manager.ui.mainCamera.transform.position - var_73_4.position

				var_73_4.forward = Vector3.New(var_73_10.x, var_73_10.y, var_73_10.z)

				local var_73_11 = var_73_4.localEulerAngles

				var_73_11.z = 0
				var_73_11.x = 0
				var_73_4.localEulerAngles = var_73_11
			end

			if arg_70_1.time_ >= var_73_5 + var_73_7 and arg_70_1.time_ < var_73_5 + var_73_7 + arg_73_0 then
				var_73_4.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_73_12 = manager.ui.mainCamera.transform.position - var_73_4.position

				var_73_4.forward = Vector3.New(var_73_12.x, var_73_12.y, var_73_12.z)

				local var_73_13 = var_73_4.localEulerAngles

				var_73_13.z = 0
				var_73_13.x = 0
				var_73_4.localEulerAngles = var_73_13
			end

			local var_73_14 = arg_70_1.actors_["1028ui_story"]
			local var_73_15 = 0

			if var_73_15 < arg_70_1.time_ and arg_70_1.time_ <= var_73_15 + arg_73_0 and arg_70_1.var_.characterEffect1028ui_story == nil then
				arg_70_1.var_.characterEffect1028ui_story = var_73_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_73_16 = 0.200000002980232

			if var_73_15 <= arg_70_1.time_ and arg_70_1.time_ < var_73_15 + var_73_16 then
				local var_73_17 = (arg_70_1.time_ - var_73_15) / var_73_16

				if arg_70_1.var_.characterEffect1028ui_story then
					arg_70_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_70_1.time_ >= var_73_15 + var_73_16 and arg_70_1.time_ < var_73_15 + var_73_16 + arg_73_0 and arg_70_1.var_.characterEffect1028ui_story then
				arg_70_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_73_18 = 0

			if var_73_18 < arg_70_1.time_ and arg_70_1.time_ <= var_73_18 + arg_73_0 then
				arg_70_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_73_19 = 0

			if var_73_19 < arg_70_1.time_ and arg_70_1.time_ <= var_73_19 + arg_73_0 then
				arg_70_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_73_20 = arg_70_1.actors_["1059ui_story"].transform
			local var_73_21 = 0

			if var_73_21 < arg_70_1.time_ and arg_70_1.time_ <= var_73_21 + arg_73_0 then
				arg_70_1.var_.moveOldPos1059ui_story = var_73_20.localPosition
			end

			local var_73_22 = 0.001

			if var_73_21 <= arg_70_1.time_ and arg_70_1.time_ < var_73_21 + var_73_22 then
				local var_73_23 = (arg_70_1.time_ - var_73_21) / var_73_22
				local var_73_24 = Vector3.New(0, 100, 0)

				var_73_20.localPosition = Vector3.Lerp(arg_70_1.var_.moveOldPos1059ui_story, var_73_24, var_73_23)

				local var_73_25 = manager.ui.mainCamera.transform.position - var_73_20.position

				var_73_20.forward = Vector3.New(var_73_25.x, var_73_25.y, var_73_25.z)

				local var_73_26 = var_73_20.localEulerAngles

				var_73_26.z = 0
				var_73_26.x = 0
				var_73_20.localEulerAngles = var_73_26
			end

			if arg_70_1.time_ >= var_73_21 + var_73_22 and arg_70_1.time_ < var_73_21 + var_73_22 + arg_73_0 then
				var_73_20.localPosition = Vector3.New(0, 100, 0)

				local var_73_27 = manager.ui.mainCamera.transform.position - var_73_20.position

				var_73_20.forward = Vector3.New(var_73_27.x, var_73_27.y, var_73_27.z)

				local var_73_28 = var_73_20.localEulerAngles

				var_73_28.z = 0
				var_73_28.x = 0
				var_73_20.localEulerAngles = var_73_28
			end

			local var_73_29 = arg_70_1.actors_["1059ui_story"]
			local var_73_30 = 0

			if var_73_30 < arg_70_1.time_ and arg_70_1.time_ <= var_73_30 + arg_73_0 and arg_70_1.var_.characterEffect1059ui_story == nil then
				arg_70_1.var_.characterEffect1059ui_story = var_73_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_73_31 = 0.200000002980232

			if var_73_30 <= arg_70_1.time_ and arg_70_1.time_ < var_73_30 + var_73_31 then
				local var_73_32 = (arg_70_1.time_ - var_73_30) / var_73_31

				if arg_70_1.var_.characterEffect1059ui_story then
					local var_73_33 = Mathf.Lerp(0, 0.5, var_73_32)

					arg_70_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_70_1.var_.characterEffect1059ui_story.fillRatio = var_73_33
				end
			end

			if arg_70_1.time_ >= var_73_30 + var_73_31 and arg_70_1.time_ < var_73_30 + var_73_31 + arg_73_0 and arg_70_1.var_.characterEffect1059ui_story then
				local var_73_34 = 0.5

				arg_70_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_70_1.var_.characterEffect1059ui_story.fillRatio = var_73_34
			end

			local var_73_35 = 0
			local var_73_36 = 0.225

			if var_73_35 < arg_70_1.time_ and arg_70_1.time_ <= var_73_35 + arg_73_0 then
				arg_70_1.talkMaxDuration = 0
				arg_70_1.dialogCg_.alpha = 1

				arg_70_1.dialog_:SetActive(true)
				SetActive(arg_70_1.leftNameGo_, true)

				local var_73_37 = arg_70_1:FormatText(StoryNameCfg[327].name)

				arg_70_1.leftNameTxt_.text = var_73_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_70_1.leftNameTxt_.transform)

				arg_70_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_70_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_70_1:RecordName(arg_70_1.leftNameTxt_.text)
				SetActive(arg_70_1.iconTrs_.gameObject, false)
				arg_70_1.callingController_:SetSelectedState("normal")

				local var_73_38 = arg_70_1:GetWordFromCfg(910601016)
				local var_73_39 = arg_70_1:FormatText(var_73_38.content)

				arg_70_1.text_.text = var_73_39

				LuaForUtil.ClearLinePrefixSymbol(arg_70_1.text_)

				local var_73_40 = 9
				local var_73_41 = utf8.len(var_73_39)
				local var_73_42 = var_73_40 <= 0 and var_73_36 or var_73_36 * (var_73_41 / var_73_40)

				if var_73_42 > 0 and var_73_36 < var_73_42 then
					arg_70_1.talkMaxDuration = var_73_42

					if var_73_42 + var_73_35 > arg_70_1.duration_ then
						arg_70_1.duration_ = var_73_42 + var_73_35
					end
				end

				arg_70_1.text_.text = var_73_39
				arg_70_1.typewritter.percent = 0

				arg_70_1.typewritter:SetDirty()
				arg_70_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601016", "story_v_out_910601.awb") ~= 0 then
					local var_73_43 = manager.audio:GetVoiceLength("story_v_out_910601", "910601016", "story_v_out_910601.awb") / 1000

					if var_73_43 + var_73_35 > arg_70_1.duration_ then
						arg_70_1.duration_ = var_73_43 + var_73_35
					end

					if var_73_38.prefab_name ~= "" and arg_70_1.actors_[var_73_38.prefab_name] ~= nil then
						local var_73_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_70_1.actors_[var_73_38.prefab_name].transform, "story_v_out_910601", "910601016", "story_v_out_910601.awb")

						arg_70_1:RecordAudio("910601016", var_73_44)
						arg_70_1:RecordAudio("910601016", var_73_44)
					else
						arg_70_1:AudioAction("play", "voice", "story_v_out_910601", "910601016", "story_v_out_910601.awb")
					end

					arg_70_1:RecordHistoryTalkVoice("story_v_out_910601", "910601016", "story_v_out_910601.awb")
				end

				arg_70_1:RecordContent(arg_70_1.text_.text)
			end

			local var_73_45 = math.max(var_73_36, arg_70_1.talkMaxDuration)

			if var_73_35 <= arg_70_1.time_ and arg_70_1.time_ < var_73_35 + var_73_45 then
				arg_70_1.typewritter.percent = (arg_70_1.time_ - var_73_35) / var_73_45

				arg_70_1.typewritter:SetDirty()
			end

			if arg_70_1.time_ >= var_73_35 + var_73_45 and arg_70_1.time_ < var_73_35 + var_73_45 + arg_73_0 then
				arg_70_1.typewritter.percent = 1

				arg_70_1.typewritter:SetDirty()
				arg_70_1:ShowNextGo(true)
			end
		end
	end,
	Play910601017 = function(arg_74_0, arg_74_1)
		arg_74_1.time_ = 0
		arg_74_1.frameCnt_ = 0
		arg_74_1.state_ = "playing"
		arg_74_1.curTalkId_ = 910601017
		arg_74_1.duration_ = 5

		SetActive(arg_74_1.tipsGo_, false)

		function arg_74_1.onSingleLineFinish_()
			arg_74_1.onSingleLineUpdate_ = nil
			arg_74_1.onSingleLineFinish_ = nil
			arg_74_1.state_ = "waiting"
		end

		function arg_74_1.playNext_(arg_76_0)
			if arg_76_0 == 1 then
				arg_74_0:Play910601018(arg_74_1)
			end
		end

		function arg_74_1.onSingleLineUpdate_(arg_77_0)
			local var_77_0 = arg_74_1.actors_["1028ui_story"]
			local var_77_1 = 0

			if var_77_1 < arg_74_1.time_ and arg_74_1.time_ <= var_77_1 + arg_77_0 and arg_74_1.var_.characterEffect1028ui_story == nil then
				arg_74_1.var_.characterEffect1028ui_story = var_77_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_77_2 = 0.200000002980232

			if var_77_1 <= arg_74_1.time_ and arg_74_1.time_ < var_77_1 + var_77_2 then
				local var_77_3 = (arg_74_1.time_ - var_77_1) / var_77_2

				if arg_74_1.var_.characterEffect1028ui_story then
					local var_77_4 = Mathf.Lerp(0, 0.5, var_77_3)

					arg_74_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_74_1.var_.characterEffect1028ui_story.fillRatio = var_77_4
				end
			end

			if arg_74_1.time_ >= var_77_1 + var_77_2 and arg_74_1.time_ < var_77_1 + var_77_2 + arg_77_0 and arg_74_1.var_.characterEffect1028ui_story then
				local var_77_5 = 0.5

				arg_74_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_74_1.var_.characterEffect1028ui_story.fillRatio = var_77_5
			end

			local var_77_6 = 0

			if var_77_6 < arg_74_1.time_ and arg_74_1.time_ <= var_77_6 + arg_77_0 then
				arg_74_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_77_7 = arg_74_1.actors_["1028ui_story"].transform
			local var_77_8 = 0

			if var_77_8 < arg_74_1.time_ and arg_74_1.time_ <= var_77_8 + arg_77_0 then
				arg_74_1.var_.moveOldPos1028ui_story = var_77_7.localPosition
			end

			local var_77_9 = 0.001

			if var_77_8 <= arg_74_1.time_ and arg_74_1.time_ < var_77_8 + var_77_9 then
				local var_77_10 = (arg_74_1.time_ - var_77_8) / var_77_9
				local var_77_11 = Vector3.New(0, 100, 0)

				var_77_7.localPosition = Vector3.Lerp(arg_74_1.var_.moveOldPos1028ui_story, var_77_11, var_77_10)

				local var_77_12 = manager.ui.mainCamera.transform.position - var_77_7.position

				var_77_7.forward = Vector3.New(var_77_12.x, var_77_12.y, var_77_12.z)

				local var_77_13 = var_77_7.localEulerAngles

				var_77_13.z = 0
				var_77_13.x = 0
				var_77_7.localEulerAngles = var_77_13
			end

			if arg_74_1.time_ >= var_77_8 + var_77_9 and arg_74_1.time_ < var_77_8 + var_77_9 + arg_77_0 then
				var_77_7.localPosition = Vector3.New(0, 100, 0)

				local var_77_14 = manager.ui.mainCamera.transform.position - var_77_7.position

				var_77_7.forward = Vector3.New(var_77_14.x, var_77_14.y, var_77_14.z)

				local var_77_15 = var_77_7.localEulerAngles

				var_77_15.z = 0
				var_77_15.x = 0
				var_77_7.localEulerAngles = var_77_15
			end

			local var_77_16 = 0
			local var_77_17 = 1.3

			if var_77_16 < arg_74_1.time_ and arg_74_1.time_ <= var_77_16 + arg_77_0 then
				arg_74_1.talkMaxDuration = 0
				arg_74_1.dialogCg_.alpha = 1

				arg_74_1.dialog_:SetActive(true)
				SetActive(arg_74_1.leftNameGo_, false)

				arg_74_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_74_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_74_1:RecordName(arg_74_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_74_1.iconTrs_.gameObject, false)
				arg_74_1.callingController_:SetSelectedState("normal")

				local var_77_18 = arg_74_1:GetWordFromCfg(910601017)
				local var_77_19 = arg_74_1:FormatText(var_77_18.content)

				arg_74_1.text_.text = var_77_19

				LuaForUtil.ClearLinePrefixSymbol(arg_74_1.text_)

				local var_77_20 = 52
				local var_77_21 = utf8.len(var_77_19)
				local var_77_22 = var_77_20 <= 0 and var_77_17 or var_77_17 * (var_77_21 / var_77_20)

				if var_77_22 > 0 and var_77_17 < var_77_22 then
					arg_74_1.talkMaxDuration = var_77_22

					if var_77_22 + var_77_16 > arg_74_1.duration_ then
						arg_74_1.duration_ = var_77_22 + var_77_16
					end
				end

				arg_74_1.text_.text = var_77_19
				arg_74_1.typewritter.percent = 0

				arg_74_1.typewritter:SetDirty()
				arg_74_1:ShowNextGo(false)
				arg_74_1:RecordContent(arg_74_1.text_.text)
			end

			local var_77_23 = math.max(var_77_17, arg_74_1.talkMaxDuration)

			if var_77_16 <= arg_74_1.time_ and arg_74_1.time_ < var_77_16 + var_77_23 then
				arg_74_1.typewritter.percent = (arg_74_1.time_ - var_77_16) / var_77_23

				arg_74_1.typewritter:SetDirty()
			end

			if arg_74_1.time_ >= var_77_16 + var_77_23 and arg_74_1.time_ < var_77_16 + var_77_23 + arg_77_0 then
				arg_74_1.typewritter.percent = 1

				arg_74_1.typewritter:SetDirty()
				arg_74_1:ShowNextGo(true)
			end
		end
	end,
	Play910601018 = function(arg_78_0, arg_78_1)
		arg_78_1.time_ = 0
		arg_78_1.frameCnt_ = 0
		arg_78_1.state_ = "playing"
		arg_78_1.curTalkId_ = 910601018
		arg_78_1.duration_ = 3.4

		SetActive(arg_78_1.tipsGo_, false)

		function arg_78_1.onSingleLineFinish_()
			arg_78_1.onSingleLineUpdate_ = nil
			arg_78_1.onSingleLineFinish_ = nil
			arg_78_1.state_ = "waiting"
		end

		function arg_78_1.playNext_(arg_80_0)
			if arg_80_0 == 1 then
				arg_78_0:Play910601019(arg_78_1)
			end
		end

		function arg_78_1.onSingleLineUpdate_(arg_81_0)
			local var_81_0 = arg_78_1.actors_["1028ui_story"].transform
			local var_81_1 = 0

			if var_81_1 < arg_78_1.time_ and arg_78_1.time_ <= var_81_1 + arg_81_0 then
				arg_78_1.var_.moveOldPos1028ui_story = var_81_0.localPosition
			end

			local var_81_2 = 0.001

			if var_81_1 <= arg_78_1.time_ and arg_78_1.time_ < var_81_1 + var_81_2 then
				local var_81_3 = (arg_78_1.time_ - var_81_1) / var_81_2
				local var_81_4 = Vector3.New(0, -0.9, -5.9)

				var_81_0.localPosition = Vector3.Lerp(arg_78_1.var_.moveOldPos1028ui_story, var_81_4, var_81_3)

				local var_81_5 = manager.ui.mainCamera.transform.position - var_81_0.position

				var_81_0.forward = Vector3.New(var_81_5.x, var_81_5.y, var_81_5.z)

				local var_81_6 = var_81_0.localEulerAngles

				var_81_6.z = 0
				var_81_6.x = 0
				var_81_0.localEulerAngles = var_81_6
			end

			if arg_78_1.time_ >= var_81_1 + var_81_2 and arg_78_1.time_ < var_81_1 + var_81_2 + arg_81_0 then
				var_81_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_81_7 = manager.ui.mainCamera.transform.position - var_81_0.position

				var_81_0.forward = Vector3.New(var_81_7.x, var_81_7.y, var_81_7.z)

				local var_81_8 = var_81_0.localEulerAngles

				var_81_8.z = 0
				var_81_8.x = 0
				var_81_0.localEulerAngles = var_81_8
			end

			local var_81_9 = arg_78_1.actors_["1028ui_story"]
			local var_81_10 = 0

			if var_81_10 < arg_78_1.time_ and arg_78_1.time_ <= var_81_10 + arg_81_0 and arg_78_1.var_.characterEffect1028ui_story == nil then
				arg_78_1.var_.characterEffect1028ui_story = var_81_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_81_11 = 0.200000002980232

			if var_81_10 <= arg_78_1.time_ and arg_78_1.time_ < var_81_10 + var_81_11 then
				local var_81_12 = (arg_78_1.time_ - var_81_10) / var_81_11

				if arg_78_1.var_.characterEffect1028ui_story then
					arg_78_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_78_1.time_ >= var_81_10 + var_81_11 and arg_78_1.time_ < var_81_10 + var_81_11 + arg_81_0 and arg_78_1.var_.characterEffect1028ui_story then
				arg_78_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_81_13 = 0

			if var_81_13 < arg_78_1.time_ and arg_78_1.time_ <= var_81_13 + arg_81_0 then
				arg_78_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_2")
			end

			local var_81_14 = 0

			if var_81_14 < arg_78_1.time_ and arg_78_1.time_ <= var_81_14 + arg_81_0 then
				arg_78_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_81_15 = 0
			local var_81_16 = 0.5

			if var_81_15 < arg_78_1.time_ and arg_78_1.time_ <= var_81_15 + arg_81_0 then
				arg_78_1.talkMaxDuration = 0
				arg_78_1.dialogCg_.alpha = 1

				arg_78_1.dialog_:SetActive(true)
				SetActive(arg_78_1.leftNameGo_, true)

				local var_81_17 = arg_78_1:FormatText(StoryNameCfg[327].name)

				arg_78_1.leftNameTxt_.text = var_81_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_78_1.leftNameTxt_.transform)

				arg_78_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_78_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_78_1:RecordName(arg_78_1.leftNameTxt_.text)
				SetActive(arg_78_1.iconTrs_.gameObject, false)
				arg_78_1.callingController_:SetSelectedState("normal")

				local var_81_18 = arg_78_1:GetWordFromCfg(910601018)
				local var_81_19 = arg_78_1:FormatText(var_81_18.content)

				arg_78_1.text_.text = var_81_19

				LuaForUtil.ClearLinePrefixSymbol(arg_78_1.text_)

				local var_81_20 = 20
				local var_81_21 = utf8.len(var_81_19)
				local var_81_22 = var_81_20 <= 0 and var_81_16 or var_81_16 * (var_81_21 / var_81_20)

				if var_81_22 > 0 and var_81_16 < var_81_22 then
					arg_78_1.talkMaxDuration = var_81_22

					if var_81_22 + var_81_15 > arg_78_1.duration_ then
						arg_78_1.duration_ = var_81_22 + var_81_15
					end
				end

				arg_78_1.text_.text = var_81_19
				arg_78_1.typewritter.percent = 0

				arg_78_1.typewritter:SetDirty()
				arg_78_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601018", "story_v_out_910601.awb") ~= 0 then
					local var_81_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601018", "story_v_out_910601.awb") / 1000

					if var_81_23 + var_81_15 > arg_78_1.duration_ then
						arg_78_1.duration_ = var_81_23 + var_81_15
					end

					if var_81_18.prefab_name ~= "" and arg_78_1.actors_[var_81_18.prefab_name] ~= nil then
						local var_81_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_78_1.actors_[var_81_18.prefab_name].transform, "story_v_out_910601", "910601018", "story_v_out_910601.awb")

						arg_78_1:RecordAudio("910601018", var_81_24)
						arg_78_1:RecordAudio("910601018", var_81_24)
					else
						arg_78_1:AudioAction("play", "voice", "story_v_out_910601", "910601018", "story_v_out_910601.awb")
					end

					arg_78_1:RecordHistoryTalkVoice("story_v_out_910601", "910601018", "story_v_out_910601.awb")
				end

				arg_78_1:RecordContent(arg_78_1.text_.text)
			end

			local var_81_25 = math.max(var_81_16, arg_78_1.talkMaxDuration)

			if var_81_15 <= arg_78_1.time_ and arg_78_1.time_ < var_81_15 + var_81_25 then
				arg_78_1.typewritter.percent = (arg_78_1.time_ - var_81_15) / var_81_25

				arg_78_1.typewritter:SetDirty()
			end

			if arg_78_1.time_ >= var_81_15 + var_81_25 and arg_78_1.time_ < var_81_15 + var_81_25 + arg_81_0 then
				arg_78_1.typewritter.percent = 1

				arg_78_1.typewritter:SetDirty()
				arg_78_1:ShowNextGo(true)
			end
		end
	end,
	Play910601019 = function(arg_82_0, arg_82_1)
		arg_82_1.time_ = 0
		arg_82_1.frameCnt_ = 0
		arg_82_1.state_ = "playing"
		arg_82_1.curTalkId_ = 910601019
		arg_82_1.duration_ = 5

		SetActive(arg_82_1.tipsGo_, false)

		function arg_82_1.onSingleLineFinish_()
			arg_82_1.onSingleLineUpdate_ = nil
			arg_82_1.onSingleLineFinish_ = nil
			arg_82_1.state_ = "waiting"
		end

		function arg_82_1.playNext_(arg_84_0)
			if arg_84_0 == 1 then
				arg_82_0:Play910601020(arg_82_1)
			end
		end

		function arg_82_1.onSingleLineUpdate_(arg_85_0)
			local var_85_0 = arg_82_1.actors_["1028ui_story"]
			local var_85_1 = 0

			if var_85_1 < arg_82_1.time_ and arg_82_1.time_ <= var_85_1 + arg_85_0 and arg_82_1.var_.characterEffect1028ui_story == nil then
				arg_82_1.var_.characterEffect1028ui_story = var_85_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_85_2 = 0.200000002980232

			if var_85_1 <= arg_82_1.time_ and arg_82_1.time_ < var_85_1 + var_85_2 then
				local var_85_3 = (arg_82_1.time_ - var_85_1) / var_85_2

				if arg_82_1.var_.characterEffect1028ui_story then
					local var_85_4 = Mathf.Lerp(0, 0.5, var_85_3)

					arg_82_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_82_1.var_.characterEffect1028ui_story.fillRatio = var_85_4
				end
			end

			if arg_82_1.time_ >= var_85_1 + var_85_2 and arg_82_1.time_ < var_85_1 + var_85_2 + arg_85_0 and arg_82_1.var_.characterEffect1028ui_story then
				local var_85_5 = 0.5

				arg_82_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_82_1.var_.characterEffect1028ui_story.fillRatio = var_85_5
			end

			local var_85_6 = 0
			local var_85_7 = 0.075

			if var_85_6 < arg_82_1.time_ and arg_82_1.time_ <= var_85_6 + arg_85_0 then
				arg_82_1.talkMaxDuration = 0
				arg_82_1.dialogCg_.alpha = 1

				arg_82_1.dialog_:SetActive(true)
				SetActive(arg_82_1.leftNameGo_, true)

				local var_85_8 = arg_82_1:FormatText(StoryNameCfg[7].name)

				arg_82_1.leftNameTxt_.text = var_85_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_82_1.leftNameTxt_.transform)

				arg_82_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_82_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_82_1:RecordName(arg_82_1.leftNameTxt_.text)
				SetActive(arg_82_1.iconTrs_.gameObject, false)
				arg_82_1.callingController_:SetSelectedState("normal")

				local var_85_9 = arg_82_1:GetWordFromCfg(910601019)
				local var_85_10 = arg_82_1:FormatText(var_85_9.content)

				arg_82_1.text_.text = var_85_10

				LuaForUtil.ClearLinePrefixSymbol(arg_82_1.text_)

				local var_85_11 = 3
				local var_85_12 = utf8.len(var_85_10)
				local var_85_13 = var_85_11 <= 0 and var_85_7 or var_85_7 * (var_85_12 / var_85_11)

				if var_85_13 > 0 and var_85_7 < var_85_13 then
					arg_82_1.talkMaxDuration = var_85_13

					if var_85_13 + var_85_6 > arg_82_1.duration_ then
						arg_82_1.duration_ = var_85_13 + var_85_6
					end
				end

				arg_82_1.text_.text = var_85_10
				arg_82_1.typewritter.percent = 0

				arg_82_1.typewritter:SetDirty()
				arg_82_1:ShowNextGo(false)
				arg_82_1:RecordContent(arg_82_1.text_.text)
			end

			local var_85_14 = math.max(var_85_7, arg_82_1.talkMaxDuration)

			if var_85_6 <= arg_82_1.time_ and arg_82_1.time_ < var_85_6 + var_85_14 then
				arg_82_1.typewritter.percent = (arg_82_1.time_ - var_85_6) / var_85_14

				arg_82_1.typewritter:SetDirty()
			end

			if arg_82_1.time_ >= var_85_6 + var_85_14 and arg_82_1.time_ < var_85_6 + var_85_14 + arg_85_0 then
				arg_82_1.typewritter.percent = 1

				arg_82_1.typewritter:SetDirty()
				arg_82_1:ShowNextGo(true)
			end
		end
	end,
	Play910601020 = function(arg_86_0, arg_86_1)
		arg_86_1.time_ = 0
		arg_86_1.frameCnt_ = 0
		arg_86_1.state_ = "playing"
		arg_86_1.curTalkId_ = 910601020
		arg_86_1.duration_ = 7.9

		SetActive(arg_86_1.tipsGo_, false)

		function arg_86_1.onSingleLineFinish_()
			arg_86_1.onSingleLineUpdate_ = nil
			arg_86_1.onSingleLineFinish_ = nil
			arg_86_1.state_ = "waiting"
		end

		function arg_86_1.playNext_(arg_88_0)
			if arg_88_0 == 1 then
				arg_86_0:Play910601021(arg_86_1)
			end
		end

		function arg_86_1.onSingleLineUpdate_(arg_89_0)
			local var_89_0 = arg_86_1.actors_["1059ui_story"].transform
			local var_89_1 = 0

			if var_89_1 < arg_86_1.time_ and arg_86_1.time_ <= var_89_1 + arg_89_0 then
				arg_86_1.var_.moveOldPos1059ui_story = var_89_0.localPosition
			end

			local var_89_2 = 0.001

			if var_89_1 <= arg_86_1.time_ and arg_86_1.time_ < var_89_1 + var_89_2 then
				local var_89_3 = (arg_86_1.time_ - var_89_1) / var_89_2
				local var_89_4 = Vector3.New(0, -1.05, -6)

				var_89_0.localPosition = Vector3.Lerp(arg_86_1.var_.moveOldPos1059ui_story, var_89_4, var_89_3)

				local var_89_5 = manager.ui.mainCamera.transform.position - var_89_0.position

				var_89_0.forward = Vector3.New(var_89_5.x, var_89_5.y, var_89_5.z)

				local var_89_6 = var_89_0.localEulerAngles

				var_89_6.z = 0
				var_89_6.x = 0
				var_89_0.localEulerAngles = var_89_6
			end

			if arg_86_1.time_ >= var_89_1 + var_89_2 and arg_86_1.time_ < var_89_1 + var_89_2 + arg_89_0 then
				var_89_0.localPosition = Vector3.New(0, -1.05, -6)

				local var_89_7 = manager.ui.mainCamera.transform.position - var_89_0.position

				var_89_0.forward = Vector3.New(var_89_7.x, var_89_7.y, var_89_7.z)

				local var_89_8 = var_89_0.localEulerAngles

				var_89_8.z = 0
				var_89_8.x = 0
				var_89_0.localEulerAngles = var_89_8
			end

			local var_89_9 = arg_86_1.actors_["1059ui_story"]
			local var_89_10 = 0

			if var_89_10 < arg_86_1.time_ and arg_86_1.time_ <= var_89_10 + arg_89_0 and arg_86_1.var_.characterEffect1059ui_story == nil then
				arg_86_1.var_.characterEffect1059ui_story = var_89_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_89_11 = 0.200000002980232

			if var_89_10 <= arg_86_1.time_ and arg_86_1.time_ < var_89_10 + var_89_11 then
				local var_89_12 = (arg_86_1.time_ - var_89_10) / var_89_11

				if arg_86_1.var_.characterEffect1059ui_story then
					arg_86_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_86_1.time_ >= var_89_10 + var_89_11 and arg_86_1.time_ < var_89_10 + var_89_11 + arg_89_0 and arg_86_1.var_.characterEffect1059ui_story then
				arg_86_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_89_13 = 0

			if var_89_13 < arg_86_1.time_ and arg_86_1.time_ <= var_89_13 + arg_89_0 then
				arg_86_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action5_1")
			end

			local var_89_14 = 0

			if var_89_14 < arg_86_1.time_ and arg_86_1.time_ <= var_89_14 + arg_89_0 then
				arg_86_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_89_15 = arg_86_1.actors_["1028ui_story"].transform
			local var_89_16 = 0

			if var_89_16 < arg_86_1.time_ and arg_86_1.time_ <= var_89_16 + arg_89_0 then
				arg_86_1.var_.moveOldPos1028ui_story = var_89_15.localPosition
			end

			local var_89_17 = 0.001

			if var_89_16 <= arg_86_1.time_ and arg_86_1.time_ < var_89_16 + var_89_17 then
				local var_89_18 = (arg_86_1.time_ - var_89_16) / var_89_17
				local var_89_19 = Vector3.New(0, 100, 0)

				var_89_15.localPosition = Vector3.Lerp(arg_86_1.var_.moveOldPos1028ui_story, var_89_19, var_89_18)

				local var_89_20 = manager.ui.mainCamera.transform.position - var_89_15.position

				var_89_15.forward = Vector3.New(var_89_20.x, var_89_20.y, var_89_20.z)

				local var_89_21 = var_89_15.localEulerAngles

				var_89_21.z = 0
				var_89_21.x = 0
				var_89_15.localEulerAngles = var_89_21
			end

			if arg_86_1.time_ >= var_89_16 + var_89_17 and arg_86_1.time_ < var_89_16 + var_89_17 + arg_89_0 then
				var_89_15.localPosition = Vector3.New(0, 100, 0)

				local var_89_22 = manager.ui.mainCamera.transform.position - var_89_15.position

				var_89_15.forward = Vector3.New(var_89_22.x, var_89_22.y, var_89_22.z)

				local var_89_23 = var_89_15.localEulerAngles

				var_89_23.z = 0
				var_89_23.x = 0
				var_89_15.localEulerAngles = var_89_23
			end

			local var_89_24 = arg_86_1.actors_["1028ui_story"]
			local var_89_25 = 0

			if var_89_25 < arg_86_1.time_ and arg_86_1.time_ <= var_89_25 + arg_89_0 and arg_86_1.var_.characterEffect1028ui_story == nil then
				arg_86_1.var_.characterEffect1028ui_story = var_89_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_89_26 = 0.200000002980232

			if var_89_25 <= arg_86_1.time_ and arg_86_1.time_ < var_89_25 + var_89_26 then
				local var_89_27 = (arg_86_1.time_ - var_89_25) / var_89_26

				if arg_86_1.var_.characterEffect1028ui_story then
					local var_89_28 = Mathf.Lerp(0, 0.5, var_89_27)

					arg_86_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_86_1.var_.characterEffect1028ui_story.fillRatio = var_89_28
				end
			end

			if arg_86_1.time_ >= var_89_25 + var_89_26 and arg_86_1.time_ < var_89_25 + var_89_26 + arg_89_0 and arg_86_1.var_.characterEffect1028ui_story then
				local var_89_29 = 0.5

				arg_86_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_86_1.var_.characterEffect1028ui_story.fillRatio = var_89_29
			end

			local var_89_30 = 0
			local var_89_31 = 0.875

			if var_89_30 < arg_86_1.time_ and arg_86_1.time_ <= var_89_30 + arg_89_0 then
				arg_86_1.talkMaxDuration = 0
				arg_86_1.dialogCg_.alpha = 1

				arg_86_1.dialog_:SetActive(true)
				SetActive(arg_86_1.leftNameGo_, true)

				local var_89_32 = arg_86_1:FormatText(StoryNameCfg[28].name)

				arg_86_1.leftNameTxt_.text = var_89_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_86_1.leftNameTxt_.transform)

				arg_86_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_86_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_86_1:RecordName(arg_86_1.leftNameTxt_.text)
				SetActive(arg_86_1.iconTrs_.gameObject, false)
				arg_86_1.callingController_:SetSelectedState("normal")

				local var_89_33 = arg_86_1:GetWordFromCfg(910601020)
				local var_89_34 = arg_86_1:FormatText(var_89_33.content)

				arg_86_1.text_.text = var_89_34

				LuaForUtil.ClearLinePrefixSymbol(arg_86_1.text_)

				local var_89_35 = 35
				local var_89_36 = utf8.len(var_89_34)
				local var_89_37 = var_89_35 <= 0 and var_89_31 or var_89_31 * (var_89_36 / var_89_35)

				if var_89_37 > 0 and var_89_31 < var_89_37 then
					arg_86_1.talkMaxDuration = var_89_37

					if var_89_37 + var_89_30 > arg_86_1.duration_ then
						arg_86_1.duration_ = var_89_37 + var_89_30
					end
				end

				arg_86_1.text_.text = var_89_34
				arg_86_1.typewritter.percent = 0

				arg_86_1.typewritter:SetDirty()
				arg_86_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601020", "story_v_out_910601.awb") ~= 0 then
					local var_89_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601020", "story_v_out_910601.awb") / 1000

					if var_89_38 + var_89_30 > arg_86_1.duration_ then
						arg_86_1.duration_ = var_89_38 + var_89_30
					end

					if var_89_33.prefab_name ~= "" and arg_86_1.actors_[var_89_33.prefab_name] ~= nil then
						local var_89_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_86_1.actors_[var_89_33.prefab_name].transform, "story_v_out_910601", "910601020", "story_v_out_910601.awb")

						arg_86_1:RecordAudio("910601020", var_89_39)
						arg_86_1:RecordAudio("910601020", var_89_39)
					else
						arg_86_1:AudioAction("play", "voice", "story_v_out_910601", "910601020", "story_v_out_910601.awb")
					end

					arg_86_1:RecordHistoryTalkVoice("story_v_out_910601", "910601020", "story_v_out_910601.awb")
				end

				arg_86_1:RecordContent(arg_86_1.text_.text)
			end

			local var_89_40 = math.max(var_89_31, arg_86_1.talkMaxDuration)

			if var_89_30 <= arg_86_1.time_ and arg_86_1.time_ < var_89_30 + var_89_40 then
				arg_86_1.typewritter.percent = (arg_86_1.time_ - var_89_30) / var_89_40

				arg_86_1.typewritter:SetDirty()
			end

			if arg_86_1.time_ >= var_89_30 + var_89_40 and arg_86_1.time_ < var_89_30 + var_89_40 + arg_89_0 then
				arg_86_1.typewritter.percent = 1

				arg_86_1.typewritter:SetDirty()
				arg_86_1:ShowNextGo(true)
			end
		end
	end,
	Play910601021 = function(arg_90_0, arg_90_1)
		arg_90_1.time_ = 0
		arg_90_1.frameCnt_ = 0
		arg_90_1.state_ = "playing"
		arg_90_1.curTalkId_ = 910601021
		arg_90_1.duration_ = 5

		SetActive(arg_90_1.tipsGo_, false)

		function arg_90_1.onSingleLineFinish_()
			arg_90_1.onSingleLineUpdate_ = nil
			arg_90_1.onSingleLineFinish_ = nil
			arg_90_1.state_ = "waiting"
		end

		function arg_90_1.playNext_(arg_92_0)
			if arg_92_0 == 1 then
				arg_90_0:Play910601022(arg_90_1)
			end
		end

		function arg_90_1.onSingleLineUpdate_(arg_93_0)
			local var_93_0 = arg_90_1.actors_["1059ui_story"]
			local var_93_1 = 0

			if var_93_1 < arg_90_1.time_ and arg_90_1.time_ <= var_93_1 + arg_93_0 and arg_90_1.var_.characterEffect1059ui_story == nil then
				arg_90_1.var_.characterEffect1059ui_story = var_93_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_93_2 = 0.200000002980232

			if var_93_1 <= arg_90_1.time_ and arg_90_1.time_ < var_93_1 + var_93_2 then
				local var_93_3 = (arg_90_1.time_ - var_93_1) / var_93_2

				if arg_90_1.var_.characterEffect1059ui_story then
					local var_93_4 = Mathf.Lerp(0, 0.5, var_93_3)

					arg_90_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_90_1.var_.characterEffect1059ui_story.fillRatio = var_93_4
				end
			end

			if arg_90_1.time_ >= var_93_1 + var_93_2 and arg_90_1.time_ < var_93_1 + var_93_2 + arg_93_0 and arg_90_1.var_.characterEffect1059ui_story then
				local var_93_5 = 0.5

				arg_90_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_90_1.var_.characterEffect1059ui_story.fillRatio = var_93_5
			end

			local var_93_6 = 0
			local var_93_7 = 0.675

			if var_93_6 < arg_90_1.time_ and arg_90_1.time_ <= var_93_6 + arg_93_0 then
				arg_90_1.talkMaxDuration = 0
				arg_90_1.dialogCg_.alpha = 1

				arg_90_1.dialog_:SetActive(true)
				SetActive(arg_90_1.leftNameGo_, true)

				local var_93_8 = arg_90_1:FormatText(StoryNameCfg[7].name)

				arg_90_1.leftNameTxt_.text = var_93_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_90_1.leftNameTxt_.transform)

				arg_90_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_90_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_90_1:RecordName(arg_90_1.leftNameTxt_.text)
				SetActive(arg_90_1.iconTrs_.gameObject, false)
				arg_90_1.callingController_:SetSelectedState("normal")

				local var_93_9 = arg_90_1:GetWordFromCfg(910601021)
				local var_93_10 = arg_90_1:FormatText(var_93_9.content)

				arg_90_1.text_.text = var_93_10

				LuaForUtil.ClearLinePrefixSymbol(arg_90_1.text_)

				local var_93_11 = 27
				local var_93_12 = utf8.len(var_93_10)
				local var_93_13 = var_93_11 <= 0 and var_93_7 or var_93_7 * (var_93_12 / var_93_11)

				if var_93_13 > 0 and var_93_7 < var_93_13 then
					arg_90_1.talkMaxDuration = var_93_13

					if var_93_13 + var_93_6 > arg_90_1.duration_ then
						arg_90_1.duration_ = var_93_13 + var_93_6
					end
				end

				arg_90_1.text_.text = var_93_10
				arg_90_1.typewritter.percent = 0

				arg_90_1.typewritter:SetDirty()
				arg_90_1:ShowNextGo(false)
				arg_90_1:RecordContent(arg_90_1.text_.text)
			end

			local var_93_14 = math.max(var_93_7, arg_90_1.talkMaxDuration)

			if var_93_6 <= arg_90_1.time_ and arg_90_1.time_ < var_93_6 + var_93_14 then
				arg_90_1.typewritter.percent = (arg_90_1.time_ - var_93_6) / var_93_14

				arg_90_1.typewritter:SetDirty()
			end

			if arg_90_1.time_ >= var_93_6 + var_93_14 and arg_90_1.time_ < var_93_6 + var_93_14 + arg_93_0 then
				arg_90_1.typewritter.percent = 1

				arg_90_1.typewritter:SetDirty()
				arg_90_1:ShowNextGo(true)
			end
		end
	end,
	Play910601022 = function(arg_94_0, arg_94_1)
		arg_94_1.time_ = 0
		arg_94_1.frameCnt_ = 0
		arg_94_1.state_ = "playing"
		arg_94_1.curTalkId_ = 910601022
		arg_94_1.duration_ = 2.57

		SetActive(arg_94_1.tipsGo_, false)

		function arg_94_1.onSingleLineFinish_()
			arg_94_1.onSingleLineUpdate_ = nil
			arg_94_1.onSingleLineFinish_ = nil
			arg_94_1.state_ = "waiting"
		end

		function arg_94_1.playNext_(arg_96_0)
			if arg_96_0 == 1 then
				arg_94_0:Play910601023(arg_94_1)
			end
		end

		function arg_94_1.onSingleLineUpdate_(arg_97_0)
			local var_97_0 = arg_94_1.actors_["1048ui_story"].transform
			local var_97_1 = 0

			if var_97_1 < arg_94_1.time_ and arg_94_1.time_ <= var_97_1 + arg_97_0 then
				arg_94_1.var_.moveOldPos1048ui_story = var_97_0.localPosition
			end

			local var_97_2 = 0.001

			if var_97_1 <= arg_94_1.time_ and arg_94_1.time_ < var_97_1 + var_97_2 then
				local var_97_3 = (arg_94_1.time_ - var_97_1) / var_97_2
				local var_97_4 = Vector3.New(0, -0.8, -6.2)

				var_97_0.localPosition = Vector3.Lerp(arg_94_1.var_.moveOldPos1048ui_story, var_97_4, var_97_3)

				local var_97_5 = manager.ui.mainCamera.transform.position - var_97_0.position

				var_97_0.forward = Vector3.New(var_97_5.x, var_97_5.y, var_97_5.z)

				local var_97_6 = var_97_0.localEulerAngles

				var_97_6.z = 0
				var_97_6.x = 0
				var_97_0.localEulerAngles = var_97_6
			end

			if arg_94_1.time_ >= var_97_1 + var_97_2 and arg_94_1.time_ < var_97_1 + var_97_2 + arg_97_0 then
				var_97_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_97_7 = manager.ui.mainCamera.transform.position - var_97_0.position

				var_97_0.forward = Vector3.New(var_97_7.x, var_97_7.y, var_97_7.z)

				local var_97_8 = var_97_0.localEulerAngles

				var_97_8.z = 0
				var_97_8.x = 0
				var_97_0.localEulerAngles = var_97_8
			end

			local var_97_9 = arg_94_1.actors_["1048ui_story"]
			local var_97_10 = 0

			if var_97_10 < arg_94_1.time_ and arg_94_1.time_ <= var_97_10 + arg_97_0 and arg_94_1.var_.characterEffect1048ui_story == nil then
				arg_94_1.var_.characterEffect1048ui_story = var_97_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_97_11 = 0.200000002980232

			if var_97_10 <= arg_94_1.time_ and arg_94_1.time_ < var_97_10 + var_97_11 then
				local var_97_12 = (arg_94_1.time_ - var_97_10) / var_97_11

				if arg_94_1.var_.characterEffect1048ui_story then
					arg_94_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_94_1.time_ >= var_97_10 + var_97_11 and arg_94_1.time_ < var_97_10 + var_97_11 + arg_97_0 and arg_94_1.var_.characterEffect1048ui_story then
				arg_94_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_97_13 = 0

			if var_97_13 < arg_94_1.time_ and arg_94_1.time_ <= var_97_13 + arg_97_0 then
				arg_94_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action5_1")
			end

			local var_97_14 = 0

			if var_97_14 < arg_94_1.time_ and arg_94_1.time_ <= var_97_14 + arg_97_0 then
				arg_94_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_97_15 = arg_94_1.actors_["1059ui_story"].transform
			local var_97_16 = 0

			if var_97_16 < arg_94_1.time_ and arg_94_1.time_ <= var_97_16 + arg_97_0 then
				arg_94_1.var_.moveOldPos1059ui_story = var_97_15.localPosition
			end

			local var_97_17 = 0.001

			if var_97_16 <= arg_94_1.time_ and arg_94_1.time_ < var_97_16 + var_97_17 then
				local var_97_18 = (arg_94_1.time_ - var_97_16) / var_97_17
				local var_97_19 = Vector3.New(0, 100, 0)

				var_97_15.localPosition = Vector3.Lerp(arg_94_1.var_.moveOldPos1059ui_story, var_97_19, var_97_18)

				local var_97_20 = manager.ui.mainCamera.transform.position - var_97_15.position

				var_97_15.forward = Vector3.New(var_97_20.x, var_97_20.y, var_97_20.z)

				local var_97_21 = var_97_15.localEulerAngles

				var_97_21.z = 0
				var_97_21.x = 0
				var_97_15.localEulerAngles = var_97_21
			end

			if arg_94_1.time_ >= var_97_16 + var_97_17 and arg_94_1.time_ < var_97_16 + var_97_17 + arg_97_0 then
				var_97_15.localPosition = Vector3.New(0, 100, 0)

				local var_97_22 = manager.ui.mainCamera.transform.position - var_97_15.position

				var_97_15.forward = Vector3.New(var_97_22.x, var_97_22.y, var_97_22.z)

				local var_97_23 = var_97_15.localEulerAngles

				var_97_23.z = 0
				var_97_23.x = 0
				var_97_15.localEulerAngles = var_97_23
			end

			local var_97_24 = arg_94_1.actors_["1059ui_story"]
			local var_97_25 = 0

			if var_97_25 < arg_94_1.time_ and arg_94_1.time_ <= var_97_25 + arg_97_0 and arg_94_1.var_.characterEffect1059ui_story == nil then
				arg_94_1.var_.characterEffect1059ui_story = var_97_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_97_26 = 0.200000002980232

			if var_97_25 <= arg_94_1.time_ and arg_94_1.time_ < var_97_25 + var_97_26 then
				local var_97_27 = (arg_94_1.time_ - var_97_25) / var_97_26

				if arg_94_1.var_.characterEffect1059ui_story then
					local var_97_28 = Mathf.Lerp(0, 0.5, var_97_27)

					arg_94_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_94_1.var_.characterEffect1059ui_story.fillRatio = var_97_28
				end
			end

			if arg_94_1.time_ >= var_97_25 + var_97_26 and arg_94_1.time_ < var_97_25 + var_97_26 + arg_97_0 and arg_94_1.var_.characterEffect1059ui_story then
				local var_97_29 = 0.5

				arg_94_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_94_1.var_.characterEffect1059ui_story.fillRatio = var_97_29
			end

			local var_97_30 = 0
			local var_97_31 = 0.225

			if var_97_30 < arg_94_1.time_ and arg_94_1.time_ <= var_97_30 + arg_97_0 then
				arg_94_1.talkMaxDuration = 0
				arg_94_1.dialogCg_.alpha = 1

				arg_94_1.dialog_:SetActive(true)
				SetActive(arg_94_1.leftNameGo_, true)

				local var_97_32 = arg_94_1:FormatText(StoryNameCfg[8].name)

				arg_94_1.leftNameTxt_.text = var_97_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_94_1.leftNameTxt_.transform)

				arg_94_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_94_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_94_1:RecordName(arg_94_1.leftNameTxt_.text)
				SetActive(arg_94_1.iconTrs_.gameObject, false)
				arg_94_1.callingController_:SetSelectedState("normal")

				local var_97_33 = arg_94_1:GetWordFromCfg(910601022)
				local var_97_34 = arg_94_1:FormatText(var_97_33.content)

				arg_94_1.text_.text = var_97_34

				LuaForUtil.ClearLinePrefixSymbol(arg_94_1.text_)

				local var_97_35 = 9
				local var_97_36 = utf8.len(var_97_34)
				local var_97_37 = var_97_35 <= 0 and var_97_31 or var_97_31 * (var_97_36 / var_97_35)

				if var_97_37 > 0 and var_97_31 < var_97_37 then
					arg_94_1.talkMaxDuration = var_97_37

					if var_97_37 + var_97_30 > arg_94_1.duration_ then
						arg_94_1.duration_ = var_97_37 + var_97_30
					end
				end

				arg_94_1.text_.text = var_97_34
				arg_94_1.typewritter.percent = 0

				arg_94_1.typewritter:SetDirty()
				arg_94_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601022", "story_v_out_910601.awb") ~= 0 then
					local var_97_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601022", "story_v_out_910601.awb") / 1000

					if var_97_38 + var_97_30 > arg_94_1.duration_ then
						arg_94_1.duration_ = var_97_38 + var_97_30
					end

					if var_97_33.prefab_name ~= "" and arg_94_1.actors_[var_97_33.prefab_name] ~= nil then
						local var_97_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_94_1.actors_[var_97_33.prefab_name].transform, "story_v_out_910601", "910601022", "story_v_out_910601.awb")

						arg_94_1:RecordAudio("910601022", var_97_39)
						arg_94_1:RecordAudio("910601022", var_97_39)
					else
						arg_94_1:AudioAction("play", "voice", "story_v_out_910601", "910601022", "story_v_out_910601.awb")
					end

					arg_94_1:RecordHistoryTalkVoice("story_v_out_910601", "910601022", "story_v_out_910601.awb")
				end

				arg_94_1:RecordContent(arg_94_1.text_.text)
			end

			local var_97_40 = math.max(var_97_31, arg_94_1.talkMaxDuration)

			if var_97_30 <= arg_94_1.time_ and arg_94_1.time_ < var_97_30 + var_97_40 then
				arg_94_1.typewritter.percent = (arg_94_1.time_ - var_97_30) / var_97_40

				arg_94_1.typewritter:SetDirty()
			end

			if arg_94_1.time_ >= var_97_30 + var_97_40 and arg_94_1.time_ < var_97_30 + var_97_40 + arg_97_0 then
				arg_94_1.typewritter.percent = 1

				arg_94_1.typewritter:SetDirty()
				arg_94_1:ShowNextGo(true)
			end
		end
	end,
	Play910601023 = function(arg_98_0, arg_98_1)
		arg_98_1.time_ = 0
		arg_98_1.frameCnt_ = 0
		arg_98_1.state_ = "playing"
		arg_98_1.curTalkId_ = 910601023
		arg_98_1.duration_ = 5

		SetActive(arg_98_1.tipsGo_, false)

		function arg_98_1.onSingleLineFinish_()
			arg_98_1.onSingleLineUpdate_ = nil
			arg_98_1.onSingleLineFinish_ = nil
			arg_98_1.state_ = "waiting"
		end

		function arg_98_1.playNext_(arg_100_0)
			if arg_100_0 == 1 then
				arg_98_0:Play910601024(arg_98_1)
			end
		end

		function arg_98_1.onSingleLineUpdate_(arg_101_0)
			local var_101_0 = arg_98_1.actors_["1048ui_story"]
			local var_101_1 = 0

			if var_101_1 < arg_98_1.time_ and arg_98_1.time_ <= var_101_1 + arg_101_0 and arg_98_1.var_.characterEffect1048ui_story == nil then
				arg_98_1.var_.characterEffect1048ui_story = var_101_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_101_2 = 0.200000002980232

			if var_101_1 <= arg_98_1.time_ and arg_98_1.time_ < var_101_1 + var_101_2 then
				local var_101_3 = (arg_98_1.time_ - var_101_1) / var_101_2

				if arg_98_1.var_.characterEffect1048ui_story then
					local var_101_4 = Mathf.Lerp(0, 0.5, var_101_3)

					arg_98_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_98_1.var_.characterEffect1048ui_story.fillRatio = var_101_4
				end
			end

			if arg_98_1.time_ >= var_101_1 + var_101_2 and arg_98_1.time_ < var_101_1 + var_101_2 + arg_101_0 and arg_98_1.var_.characterEffect1048ui_story then
				local var_101_5 = 0.5

				arg_98_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_98_1.var_.characterEffect1048ui_story.fillRatio = var_101_5
			end

			local var_101_6 = 0
			local var_101_7 = 0.15

			if var_101_6 < arg_98_1.time_ and arg_98_1.time_ <= var_101_6 + arg_101_0 then
				arg_98_1.talkMaxDuration = 0
				arg_98_1.dialogCg_.alpha = 1

				arg_98_1.dialog_:SetActive(true)
				SetActive(arg_98_1.leftNameGo_, true)

				local var_101_8 = arg_98_1:FormatText(StoryNameCfg[7].name)

				arg_98_1.leftNameTxt_.text = var_101_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_98_1.leftNameTxt_.transform)

				arg_98_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_98_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_98_1:RecordName(arg_98_1.leftNameTxt_.text)
				SetActive(arg_98_1.iconTrs_.gameObject, false)
				arg_98_1.callingController_:SetSelectedState("normal")

				local var_101_9 = arg_98_1:GetWordFromCfg(910601023)
				local var_101_10 = arg_98_1:FormatText(var_101_9.content)

				arg_98_1.text_.text = var_101_10

				LuaForUtil.ClearLinePrefixSymbol(arg_98_1.text_)

				local var_101_11 = 6
				local var_101_12 = utf8.len(var_101_10)
				local var_101_13 = var_101_11 <= 0 and var_101_7 or var_101_7 * (var_101_12 / var_101_11)

				if var_101_13 > 0 and var_101_7 < var_101_13 then
					arg_98_1.talkMaxDuration = var_101_13

					if var_101_13 + var_101_6 > arg_98_1.duration_ then
						arg_98_1.duration_ = var_101_13 + var_101_6
					end
				end

				arg_98_1.text_.text = var_101_10
				arg_98_1.typewritter.percent = 0

				arg_98_1.typewritter:SetDirty()
				arg_98_1:ShowNextGo(false)
				arg_98_1:RecordContent(arg_98_1.text_.text)
			end

			local var_101_14 = math.max(var_101_7, arg_98_1.talkMaxDuration)

			if var_101_6 <= arg_98_1.time_ and arg_98_1.time_ < var_101_6 + var_101_14 then
				arg_98_1.typewritter.percent = (arg_98_1.time_ - var_101_6) / var_101_14

				arg_98_1.typewritter:SetDirty()
			end

			if arg_98_1.time_ >= var_101_6 + var_101_14 and arg_98_1.time_ < var_101_6 + var_101_14 + arg_101_0 then
				arg_98_1.typewritter.percent = 1

				arg_98_1.typewritter:SetDirty()
				arg_98_1:ShowNextGo(true)
			end
		end
	end,
	Play910601024 = function(arg_102_0, arg_102_1)
		arg_102_1.time_ = 0
		arg_102_1.frameCnt_ = 0
		arg_102_1.state_ = "playing"
		arg_102_1.curTalkId_ = 910601024
		arg_102_1.duration_ = 6.3

		SetActive(arg_102_1.tipsGo_, false)

		function arg_102_1.onSingleLineFinish_()
			arg_102_1.onSingleLineUpdate_ = nil
			arg_102_1.onSingleLineFinish_ = nil
			arg_102_1.state_ = "waiting"
		end

		function arg_102_1.playNext_(arg_104_0)
			if arg_104_0 == 1 then
				arg_102_0:Play910601025(arg_102_1)
			end
		end

		function arg_102_1.onSingleLineUpdate_(arg_105_0)
			local var_105_0 = arg_102_1.actors_["1059ui_story"].transform
			local var_105_1 = 0

			if var_105_1 < arg_102_1.time_ and arg_102_1.time_ <= var_105_1 + arg_105_0 then
				arg_102_1.var_.moveOldPos1059ui_story = var_105_0.localPosition
			end

			local var_105_2 = 0.001

			if var_105_1 <= arg_102_1.time_ and arg_102_1.time_ < var_105_1 + var_105_2 then
				local var_105_3 = (arg_102_1.time_ - var_105_1) / var_105_2
				local var_105_4 = Vector3.New(0, -1.05, -6)

				var_105_0.localPosition = Vector3.Lerp(arg_102_1.var_.moveOldPos1059ui_story, var_105_4, var_105_3)

				local var_105_5 = manager.ui.mainCamera.transform.position - var_105_0.position

				var_105_0.forward = Vector3.New(var_105_5.x, var_105_5.y, var_105_5.z)

				local var_105_6 = var_105_0.localEulerAngles

				var_105_6.z = 0
				var_105_6.x = 0
				var_105_0.localEulerAngles = var_105_6
			end

			if arg_102_1.time_ >= var_105_1 + var_105_2 and arg_102_1.time_ < var_105_1 + var_105_2 + arg_105_0 then
				var_105_0.localPosition = Vector3.New(0, -1.05, -6)

				local var_105_7 = manager.ui.mainCamera.transform.position - var_105_0.position

				var_105_0.forward = Vector3.New(var_105_7.x, var_105_7.y, var_105_7.z)

				local var_105_8 = var_105_0.localEulerAngles

				var_105_8.z = 0
				var_105_8.x = 0
				var_105_0.localEulerAngles = var_105_8
			end

			local var_105_9 = arg_102_1.actors_["1059ui_story"]
			local var_105_10 = 0

			if var_105_10 < arg_102_1.time_ and arg_102_1.time_ <= var_105_10 + arg_105_0 and arg_102_1.var_.characterEffect1059ui_story == nil then
				arg_102_1.var_.characterEffect1059ui_story = var_105_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_105_11 = 0.200000002980232

			if var_105_10 <= arg_102_1.time_ and arg_102_1.time_ < var_105_10 + var_105_11 then
				local var_105_12 = (arg_102_1.time_ - var_105_10) / var_105_11

				if arg_102_1.var_.characterEffect1059ui_story then
					arg_102_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_102_1.time_ >= var_105_10 + var_105_11 and arg_102_1.time_ < var_105_10 + var_105_11 + arg_105_0 and arg_102_1.var_.characterEffect1059ui_story then
				arg_102_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_105_13 = 0

			if var_105_13 < arg_102_1.time_ and arg_102_1.time_ <= var_105_13 + arg_105_0 then
				arg_102_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action7_1")
			end

			local var_105_14 = 0

			if var_105_14 < arg_102_1.time_ and arg_102_1.time_ <= var_105_14 + arg_105_0 then
				arg_102_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_105_15 = arg_102_1.actors_["1048ui_story"].transform
			local var_105_16 = 0

			if var_105_16 < arg_102_1.time_ and arg_102_1.time_ <= var_105_16 + arg_105_0 then
				arg_102_1.var_.moveOldPos1048ui_story = var_105_15.localPosition
			end

			local var_105_17 = 0.001

			if var_105_16 <= arg_102_1.time_ and arg_102_1.time_ < var_105_16 + var_105_17 then
				local var_105_18 = (arg_102_1.time_ - var_105_16) / var_105_17
				local var_105_19 = Vector3.New(0, 100, 0)

				var_105_15.localPosition = Vector3.Lerp(arg_102_1.var_.moveOldPos1048ui_story, var_105_19, var_105_18)

				local var_105_20 = manager.ui.mainCamera.transform.position - var_105_15.position

				var_105_15.forward = Vector3.New(var_105_20.x, var_105_20.y, var_105_20.z)

				local var_105_21 = var_105_15.localEulerAngles

				var_105_21.z = 0
				var_105_21.x = 0
				var_105_15.localEulerAngles = var_105_21
			end

			if arg_102_1.time_ >= var_105_16 + var_105_17 and arg_102_1.time_ < var_105_16 + var_105_17 + arg_105_0 then
				var_105_15.localPosition = Vector3.New(0, 100, 0)

				local var_105_22 = manager.ui.mainCamera.transform.position - var_105_15.position

				var_105_15.forward = Vector3.New(var_105_22.x, var_105_22.y, var_105_22.z)

				local var_105_23 = var_105_15.localEulerAngles

				var_105_23.z = 0
				var_105_23.x = 0
				var_105_15.localEulerAngles = var_105_23
			end

			local var_105_24 = arg_102_1.actors_["1048ui_story"]
			local var_105_25 = 0

			if var_105_25 < arg_102_1.time_ and arg_102_1.time_ <= var_105_25 + arg_105_0 and arg_102_1.var_.characterEffect1048ui_story == nil then
				arg_102_1.var_.characterEffect1048ui_story = var_105_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_105_26 = 0.200000002980232

			if var_105_25 <= arg_102_1.time_ and arg_102_1.time_ < var_105_25 + var_105_26 then
				local var_105_27 = (arg_102_1.time_ - var_105_25) / var_105_26

				if arg_102_1.var_.characterEffect1048ui_story then
					local var_105_28 = Mathf.Lerp(0, 0.5, var_105_27)

					arg_102_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_102_1.var_.characterEffect1048ui_story.fillRatio = var_105_28
				end
			end

			if arg_102_1.time_ >= var_105_25 + var_105_26 and arg_102_1.time_ < var_105_25 + var_105_26 + arg_105_0 and arg_102_1.var_.characterEffect1048ui_story then
				local var_105_29 = 0.5

				arg_102_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_102_1.var_.characterEffect1048ui_story.fillRatio = var_105_29
			end

			local var_105_30 = 0
			local var_105_31 = 0.675

			if var_105_30 < arg_102_1.time_ and arg_102_1.time_ <= var_105_30 + arg_105_0 then
				arg_102_1.talkMaxDuration = 0
				arg_102_1.dialogCg_.alpha = 1

				arg_102_1.dialog_:SetActive(true)
				SetActive(arg_102_1.leftNameGo_, true)

				local var_105_32 = arg_102_1:FormatText(StoryNameCfg[28].name)

				arg_102_1.leftNameTxt_.text = var_105_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_102_1.leftNameTxt_.transform)

				arg_102_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_102_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_102_1:RecordName(arg_102_1.leftNameTxt_.text)
				SetActive(arg_102_1.iconTrs_.gameObject, false)
				arg_102_1.callingController_:SetSelectedState("normal")

				local var_105_33 = arg_102_1:GetWordFromCfg(910601024)
				local var_105_34 = arg_102_1:FormatText(var_105_33.content)

				arg_102_1.text_.text = var_105_34

				LuaForUtil.ClearLinePrefixSymbol(arg_102_1.text_)

				local var_105_35 = 27
				local var_105_36 = utf8.len(var_105_34)
				local var_105_37 = var_105_35 <= 0 and var_105_31 or var_105_31 * (var_105_36 / var_105_35)

				if var_105_37 > 0 and var_105_31 < var_105_37 then
					arg_102_1.talkMaxDuration = var_105_37

					if var_105_37 + var_105_30 > arg_102_1.duration_ then
						arg_102_1.duration_ = var_105_37 + var_105_30
					end
				end

				arg_102_1.text_.text = var_105_34
				arg_102_1.typewritter.percent = 0

				arg_102_1.typewritter:SetDirty()
				arg_102_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601024", "story_v_out_910601.awb") ~= 0 then
					local var_105_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601024", "story_v_out_910601.awb") / 1000

					if var_105_38 + var_105_30 > arg_102_1.duration_ then
						arg_102_1.duration_ = var_105_38 + var_105_30
					end

					if var_105_33.prefab_name ~= "" and arg_102_1.actors_[var_105_33.prefab_name] ~= nil then
						local var_105_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_102_1.actors_[var_105_33.prefab_name].transform, "story_v_out_910601", "910601024", "story_v_out_910601.awb")

						arg_102_1:RecordAudio("910601024", var_105_39)
						arg_102_1:RecordAudio("910601024", var_105_39)
					else
						arg_102_1:AudioAction("play", "voice", "story_v_out_910601", "910601024", "story_v_out_910601.awb")
					end

					arg_102_1:RecordHistoryTalkVoice("story_v_out_910601", "910601024", "story_v_out_910601.awb")
				end

				arg_102_1:RecordContent(arg_102_1.text_.text)
			end

			local var_105_40 = math.max(var_105_31, arg_102_1.talkMaxDuration)

			if var_105_30 <= arg_102_1.time_ and arg_102_1.time_ < var_105_30 + var_105_40 then
				arg_102_1.typewritter.percent = (arg_102_1.time_ - var_105_30) / var_105_40

				arg_102_1.typewritter:SetDirty()
			end

			if arg_102_1.time_ >= var_105_30 + var_105_40 and arg_102_1.time_ < var_105_30 + var_105_40 + arg_105_0 then
				arg_102_1.typewritter.percent = 1

				arg_102_1.typewritter:SetDirty()
				arg_102_1:ShowNextGo(true)
			end
		end
	end,
	Play910601025 = function(arg_106_0, arg_106_1)
		arg_106_1.time_ = 0
		arg_106_1.frameCnt_ = 0
		arg_106_1.state_ = "playing"
		arg_106_1.curTalkId_ = 910601025
		arg_106_1.duration_ = 5

		SetActive(arg_106_1.tipsGo_, false)

		function arg_106_1.onSingleLineFinish_()
			arg_106_1.onSingleLineUpdate_ = nil
			arg_106_1.onSingleLineFinish_ = nil
			arg_106_1.state_ = "waiting"
		end

		function arg_106_1.playNext_(arg_108_0)
			if arg_108_0 == 1 then
				arg_106_0:Play910601026(arg_106_1)
			end
		end

		function arg_106_1.onSingleLineUpdate_(arg_109_0)
			local var_109_0 = arg_106_1.actors_["1059ui_story"]
			local var_109_1 = 0

			if var_109_1 < arg_106_1.time_ and arg_106_1.time_ <= var_109_1 + arg_109_0 and arg_106_1.var_.characterEffect1059ui_story == nil then
				arg_106_1.var_.characterEffect1059ui_story = var_109_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_109_2 = 0.200000002980232

			if var_109_1 <= arg_106_1.time_ and arg_106_1.time_ < var_109_1 + var_109_2 then
				local var_109_3 = (arg_106_1.time_ - var_109_1) / var_109_2

				if arg_106_1.var_.characterEffect1059ui_story then
					local var_109_4 = Mathf.Lerp(0, 0.5, var_109_3)

					arg_106_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_106_1.var_.characterEffect1059ui_story.fillRatio = var_109_4
				end
			end

			if arg_106_1.time_ >= var_109_1 + var_109_2 and arg_106_1.time_ < var_109_1 + var_109_2 + arg_109_0 and arg_106_1.var_.characterEffect1059ui_story then
				local var_109_5 = 0.5

				arg_106_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_106_1.var_.characterEffect1059ui_story.fillRatio = var_109_5
			end

			local var_109_6 = 0
			local var_109_7 = 0.05

			if var_109_6 < arg_106_1.time_ and arg_106_1.time_ <= var_109_6 + arg_109_0 then
				arg_106_1.talkMaxDuration = 0
				arg_106_1.dialogCg_.alpha = 1

				arg_106_1.dialog_:SetActive(true)
				SetActive(arg_106_1.leftNameGo_, true)

				local var_109_8 = arg_106_1:FormatText(StoryNameCfg[7].name)

				arg_106_1.leftNameTxt_.text = var_109_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_106_1.leftNameTxt_.transform)

				arg_106_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_106_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_106_1:RecordName(arg_106_1.leftNameTxt_.text)
				SetActive(arg_106_1.iconTrs_.gameObject, false)
				arg_106_1.callingController_:SetSelectedState("normal")

				local var_109_9 = arg_106_1:GetWordFromCfg(910601025)
				local var_109_10 = arg_106_1:FormatText(var_109_9.content)

				arg_106_1.text_.text = var_109_10

				LuaForUtil.ClearLinePrefixSymbol(arg_106_1.text_)

				local var_109_11 = 2
				local var_109_12 = utf8.len(var_109_10)
				local var_109_13 = var_109_11 <= 0 and var_109_7 or var_109_7 * (var_109_12 / var_109_11)

				if var_109_13 > 0 and var_109_7 < var_109_13 then
					arg_106_1.talkMaxDuration = var_109_13

					if var_109_13 + var_109_6 > arg_106_1.duration_ then
						arg_106_1.duration_ = var_109_13 + var_109_6
					end
				end

				arg_106_1.text_.text = var_109_10
				arg_106_1.typewritter.percent = 0

				arg_106_1.typewritter:SetDirty()
				arg_106_1:ShowNextGo(false)
				arg_106_1:RecordContent(arg_106_1.text_.text)
			end

			local var_109_14 = math.max(var_109_7, arg_106_1.talkMaxDuration)

			if var_109_6 <= arg_106_1.time_ and arg_106_1.time_ < var_109_6 + var_109_14 then
				arg_106_1.typewritter.percent = (arg_106_1.time_ - var_109_6) / var_109_14

				arg_106_1.typewritter:SetDirty()
			end

			if arg_106_1.time_ >= var_109_6 + var_109_14 and arg_106_1.time_ < var_109_6 + var_109_14 + arg_109_0 then
				arg_106_1.typewritter.percent = 1

				arg_106_1.typewritter:SetDirty()
				arg_106_1:ShowNextGo(true)
			end
		end
	end,
	Play910601026 = function(arg_110_0, arg_110_1)
		arg_110_1.time_ = 0
		arg_110_1.frameCnt_ = 0
		arg_110_1.state_ = "playing"
		arg_110_1.curTalkId_ = 910601026
		arg_110_1.duration_ = 5

		SetActive(arg_110_1.tipsGo_, false)

		function arg_110_1.onSingleLineFinish_()
			arg_110_1.onSingleLineUpdate_ = nil
			arg_110_1.onSingleLineFinish_ = nil
			arg_110_1.state_ = "waiting"
		end

		function arg_110_1.playNext_(arg_112_0)
			if arg_112_0 == 1 then
				arg_110_0:Play910601027(arg_110_1)
			end
		end

		function arg_110_1.onSingleLineUpdate_(arg_113_0)
			local var_113_0 = 0
			local var_113_1 = 0.7

			if var_113_0 < arg_110_1.time_ and arg_110_1.time_ <= var_113_0 + arg_113_0 then
				arg_110_1.talkMaxDuration = 0
				arg_110_1.dialogCg_.alpha = 1

				arg_110_1.dialog_:SetActive(true)
				SetActive(arg_110_1.leftNameGo_, true)

				local var_113_2 = arg_110_1:FormatText(StoryNameCfg[7].name)

				arg_110_1.leftNameTxt_.text = var_113_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_110_1.leftNameTxt_.transform)

				arg_110_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_110_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_110_1:RecordName(arg_110_1.leftNameTxt_.text)
				SetActive(arg_110_1.iconTrs_.gameObject, false)
				arg_110_1.callingController_:SetSelectedState("normal")

				local var_113_3 = arg_110_1:GetWordFromCfg(910601026)
				local var_113_4 = arg_110_1:FormatText(var_113_3.content)

				arg_110_1.text_.text = var_113_4

				LuaForUtil.ClearLinePrefixSymbol(arg_110_1.text_)

				local var_113_5 = 28
				local var_113_6 = utf8.len(var_113_4)
				local var_113_7 = var_113_5 <= 0 and var_113_1 or var_113_1 * (var_113_6 / var_113_5)

				if var_113_7 > 0 and var_113_1 < var_113_7 then
					arg_110_1.talkMaxDuration = var_113_7

					if var_113_7 + var_113_0 > arg_110_1.duration_ then
						arg_110_1.duration_ = var_113_7 + var_113_0
					end
				end

				arg_110_1.text_.text = var_113_4
				arg_110_1.typewritter.percent = 0

				arg_110_1.typewritter:SetDirty()
				arg_110_1:ShowNextGo(false)
				arg_110_1:RecordContent(arg_110_1.text_.text)
			end

			local var_113_8 = math.max(var_113_1, arg_110_1.talkMaxDuration)

			if var_113_0 <= arg_110_1.time_ and arg_110_1.time_ < var_113_0 + var_113_8 then
				arg_110_1.typewritter.percent = (arg_110_1.time_ - var_113_0) / var_113_8

				arg_110_1.typewritter:SetDirty()
			end

			if arg_110_1.time_ >= var_113_0 + var_113_8 and arg_110_1.time_ < var_113_0 + var_113_8 + arg_113_0 then
				arg_110_1.typewritter.percent = 1

				arg_110_1.typewritter:SetDirty()
				arg_110_1:ShowNextGo(true)
			end
		end
	end,
	Play910601027 = function(arg_114_0, arg_114_1)
		arg_114_1.time_ = 0
		arg_114_1.frameCnt_ = 0
		arg_114_1.state_ = "playing"
		arg_114_1.curTalkId_ = 910601027
		arg_114_1.duration_ = 2.57

		SetActive(arg_114_1.tipsGo_, false)

		function arg_114_1.onSingleLineFinish_()
			arg_114_1.onSingleLineUpdate_ = nil
			arg_114_1.onSingleLineFinish_ = nil
			arg_114_1.state_ = "waiting"
		end

		function arg_114_1.playNext_(arg_116_0)
			if arg_116_0 == 1 then
				arg_114_0:Play910601028(arg_114_1)
			end
		end

		function arg_114_1.onSingleLineUpdate_(arg_117_0)
			local var_117_0 = arg_114_1.actors_["1028ui_story"].transform
			local var_117_1 = 0

			if var_117_1 < arg_114_1.time_ and arg_114_1.time_ <= var_117_1 + arg_117_0 then
				arg_114_1.var_.moveOldPos1028ui_story = var_117_0.localPosition
			end

			local var_117_2 = 0.001

			if var_117_1 <= arg_114_1.time_ and arg_114_1.time_ < var_117_1 + var_117_2 then
				local var_117_3 = (arg_114_1.time_ - var_117_1) / var_117_2
				local var_117_4 = Vector3.New(0, -0.9, -5.9)

				var_117_0.localPosition = Vector3.Lerp(arg_114_1.var_.moveOldPos1028ui_story, var_117_4, var_117_3)

				local var_117_5 = manager.ui.mainCamera.transform.position - var_117_0.position

				var_117_0.forward = Vector3.New(var_117_5.x, var_117_5.y, var_117_5.z)

				local var_117_6 = var_117_0.localEulerAngles

				var_117_6.z = 0
				var_117_6.x = 0
				var_117_0.localEulerAngles = var_117_6
			end

			if arg_114_1.time_ >= var_117_1 + var_117_2 and arg_114_1.time_ < var_117_1 + var_117_2 + arg_117_0 then
				var_117_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_117_7 = manager.ui.mainCamera.transform.position - var_117_0.position

				var_117_0.forward = Vector3.New(var_117_7.x, var_117_7.y, var_117_7.z)

				local var_117_8 = var_117_0.localEulerAngles

				var_117_8.z = 0
				var_117_8.x = 0
				var_117_0.localEulerAngles = var_117_8
			end

			local var_117_9 = arg_114_1.actors_["1028ui_story"]
			local var_117_10 = 0

			if var_117_10 < arg_114_1.time_ and arg_114_1.time_ <= var_117_10 + arg_117_0 and arg_114_1.var_.characterEffect1028ui_story == nil then
				arg_114_1.var_.characterEffect1028ui_story = var_117_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_117_11 = 0.200000002980232

			if var_117_10 <= arg_114_1.time_ and arg_114_1.time_ < var_117_10 + var_117_11 then
				local var_117_12 = (arg_114_1.time_ - var_117_10) / var_117_11

				if arg_114_1.var_.characterEffect1028ui_story then
					arg_114_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_114_1.time_ >= var_117_10 + var_117_11 and arg_114_1.time_ < var_117_10 + var_117_11 + arg_117_0 and arg_114_1.var_.characterEffect1028ui_story then
				arg_114_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_117_13 = 0

			if var_117_13 < arg_114_1.time_ and arg_114_1.time_ <= var_117_13 + arg_117_0 then
				arg_114_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action7_1")
			end

			local var_117_14 = 0

			if var_117_14 < arg_114_1.time_ and arg_114_1.time_ <= var_117_14 + arg_117_0 then
				arg_114_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_117_15 = arg_114_1.actors_["1059ui_story"].transform
			local var_117_16 = 0

			if var_117_16 < arg_114_1.time_ and arg_114_1.time_ <= var_117_16 + arg_117_0 then
				arg_114_1.var_.moveOldPos1059ui_story = var_117_15.localPosition
			end

			local var_117_17 = 0.001

			if var_117_16 <= arg_114_1.time_ and arg_114_1.time_ < var_117_16 + var_117_17 then
				local var_117_18 = (arg_114_1.time_ - var_117_16) / var_117_17
				local var_117_19 = Vector3.New(0, 100, 0)

				var_117_15.localPosition = Vector3.Lerp(arg_114_1.var_.moveOldPos1059ui_story, var_117_19, var_117_18)

				local var_117_20 = manager.ui.mainCamera.transform.position - var_117_15.position

				var_117_15.forward = Vector3.New(var_117_20.x, var_117_20.y, var_117_20.z)

				local var_117_21 = var_117_15.localEulerAngles

				var_117_21.z = 0
				var_117_21.x = 0
				var_117_15.localEulerAngles = var_117_21
			end

			if arg_114_1.time_ >= var_117_16 + var_117_17 and arg_114_1.time_ < var_117_16 + var_117_17 + arg_117_0 then
				var_117_15.localPosition = Vector3.New(0, 100, 0)

				local var_117_22 = manager.ui.mainCamera.transform.position - var_117_15.position

				var_117_15.forward = Vector3.New(var_117_22.x, var_117_22.y, var_117_22.z)

				local var_117_23 = var_117_15.localEulerAngles

				var_117_23.z = 0
				var_117_23.x = 0
				var_117_15.localEulerAngles = var_117_23
			end

			local var_117_24 = arg_114_1.actors_["1059ui_story"]
			local var_117_25 = 0

			if var_117_25 < arg_114_1.time_ and arg_114_1.time_ <= var_117_25 + arg_117_0 and arg_114_1.var_.characterEffect1059ui_story == nil then
				arg_114_1.var_.characterEffect1059ui_story = var_117_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_117_26 = 0.200000002980232

			if var_117_25 <= arg_114_1.time_ and arg_114_1.time_ < var_117_25 + var_117_26 then
				local var_117_27 = (arg_114_1.time_ - var_117_25) / var_117_26

				if arg_114_1.var_.characterEffect1059ui_story then
					local var_117_28 = Mathf.Lerp(0, 0.5, var_117_27)

					arg_114_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_114_1.var_.characterEffect1059ui_story.fillRatio = var_117_28
				end
			end

			if arg_114_1.time_ >= var_117_25 + var_117_26 and arg_114_1.time_ < var_117_25 + var_117_26 + arg_117_0 and arg_114_1.var_.characterEffect1059ui_story then
				local var_117_29 = 0.5

				arg_114_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_114_1.var_.characterEffect1059ui_story.fillRatio = var_117_29
			end

			local var_117_30 = 0
			local var_117_31 = 0.2

			if var_117_30 < arg_114_1.time_ and arg_114_1.time_ <= var_117_30 + arg_117_0 then
				arg_114_1.talkMaxDuration = 0
				arg_114_1.dialogCg_.alpha = 1

				arg_114_1.dialog_:SetActive(true)
				SetActive(arg_114_1.leftNameGo_, true)

				local var_117_32 = arg_114_1:FormatText(StoryNameCfg[327].name)

				arg_114_1.leftNameTxt_.text = var_117_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_114_1.leftNameTxt_.transform)

				arg_114_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_114_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_114_1:RecordName(arg_114_1.leftNameTxt_.text)
				SetActive(arg_114_1.iconTrs_.gameObject, false)
				arg_114_1.callingController_:SetSelectedState("normal")

				local var_117_33 = arg_114_1:GetWordFromCfg(910601027)
				local var_117_34 = arg_114_1:FormatText(var_117_33.content)

				arg_114_1.text_.text = var_117_34

				LuaForUtil.ClearLinePrefixSymbol(arg_114_1.text_)

				local var_117_35 = 8
				local var_117_36 = utf8.len(var_117_34)
				local var_117_37 = var_117_35 <= 0 and var_117_31 or var_117_31 * (var_117_36 / var_117_35)

				if var_117_37 > 0 and var_117_31 < var_117_37 then
					arg_114_1.talkMaxDuration = var_117_37

					if var_117_37 + var_117_30 > arg_114_1.duration_ then
						arg_114_1.duration_ = var_117_37 + var_117_30
					end
				end

				arg_114_1.text_.text = var_117_34
				arg_114_1.typewritter.percent = 0

				arg_114_1.typewritter:SetDirty()
				arg_114_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601027", "story_v_out_910601.awb") ~= 0 then
					local var_117_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601027", "story_v_out_910601.awb") / 1000

					if var_117_38 + var_117_30 > arg_114_1.duration_ then
						arg_114_1.duration_ = var_117_38 + var_117_30
					end

					if var_117_33.prefab_name ~= "" and arg_114_1.actors_[var_117_33.prefab_name] ~= nil then
						local var_117_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_114_1.actors_[var_117_33.prefab_name].transform, "story_v_out_910601", "910601027", "story_v_out_910601.awb")

						arg_114_1:RecordAudio("910601027", var_117_39)
						arg_114_1:RecordAudio("910601027", var_117_39)
					else
						arg_114_1:AudioAction("play", "voice", "story_v_out_910601", "910601027", "story_v_out_910601.awb")
					end

					arg_114_1:RecordHistoryTalkVoice("story_v_out_910601", "910601027", "story_v_out_910601.awb")
				end

				arg_114_1:RecordContent(arg_114_1.text_.text)
			end

			local var_117_40 = math.max(var_117_31, arg_114_1.talkMaxDuration)

			if var_117_30 <= arg_114_1.time_ and arg_114_1.time_ < var_117_30 + var_117_40 then
				arg_114_1.typewritter.percent = (arg_114_1.time_ - var_117_30) / var_117_40

				arg_114_1.typewritter:SetDirty()
			end

			if arg_114_1.time_ >= var_117_30 + var_117_40 and arg_114_1.time_ < var_117_30 + var_117_40 + arg_117_0 then
				arg_114_1.typewritter.percent = 1

				arg_114_1.typewritter:SetDirty()
				arg_114_1:ShowNextGo(true)
			end
		end
	end,
	Play910601028 = function(arg_118_0, arg_118_1)
		arg_118_1.time_ = 0
		arg_118_1.frameCnt_ = 0
		arg_118_1.state_ = "playing"
		arg_118_1.curTalkId_ = 910601028
		arg_118_1.duration_ = 5

		SetActive(arg_118_1.tipsGo_, false)

		function arg_118_1.onSingleLineFinish_()
			arg_118_1.onSingleLineUpdate_ = nil
			arg_118_1.onSingleLineFinish_ = nil
			arg_118_1.state_ = "waiting"
		end

		function arg_118_1.playNext_(arg_120_0)
			if arg_120_0 == 1 then
				arg_118_0:Play910601029(arg_118_1)
			end
		end

		function arg_118_1.onSingleLineUpdate_(arg_121_0)
			local var_121_0 = arg_118_1.actors_["1028ui_story"]
			local var_121_1 = 0

			if var_121_1 < arg_118_1.time_ and arg_118_1.time_ <= var_121_1 + arg_121_0 and arg_118_1.var_.characterEffect1028ui_story == nil then
				arg_118_1.var_.characterEffect1028ui_story = var_121_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_121_2 = 0.200000002980232

			if var_121_1 <= arg_118_1.time_ and arg_118_1.time_ < var_121_1 + var_121_2 then
				local var_121_3 = (arg_118_1.time_ - var_121_1) / var_121_2

				if arg_118_1.var_.characterEffect1028ui_story then
					local var_121_4 = Mathf.Lerp(0, 0.5, var_121_3)

					arg_118_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_118_1.var_.characterEffect1028ui_story.fillRatio = var_121_4
				end
			end

			if arg_118_1.time_ >= var_121_1 + var_121_2 and arg_118_1.time_ < var_121_1 + var_121_2 + arg_121_0 and arg_118_1.var_.characterEffect1028ui_story then
				local var_121_5 = 0.5

				arg_118_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_118_1.var_.characterEffect1028ui_story.fillRatio = var_121_5
			end

			local var_121_6 = arg_118_1.actors_["1028ui_story"].transform
			local var_121_7 = 0

			if var_121_7 < arg_118_1.time_ and arg_118_1.time_ <= var_121_7 + arg_121_0 then
				arg_118_1.var_.moveOldPos1028ui_story = var_121_6.localPosition
			end

			local var_121_8 = 0.001

			if var_121_7 <= arg_118_1.time_ and arg_118_1.time_ < var_121_7 + var_121_8 then
				local var_121_9 = (arg_118_1.time_ - var_121_7) / var_121_8
				local var_121_10 = Vector3.New(0, 100, 0)

				var_121_6.localPosition = Vector3.Lerp(arg_118_1.var_.moveOldPos1028ui_story, var_121_10, var_121_9)

				local var_121_11 = manager.ui.mainCamera.transform.position - var_121_6.position

				var_121_6.forward = Vector3.New(var_121_11.x, var_121_11.y, var_121_11.z)

				local var_121_12 = var_121_6.localEulerAngles

				var_121_12.z = 0
				var_121_12.x = 0
				var_121_6.localEulerAngles = var_121_12
			end

			if arg_118_1.time_ >= var_121_7 + var_121_8 and arg_118_1.time_ < var_121_7 + var_121_8 + arg_121_0 then
				var_121_6.localPosition = Vector3.New(0, 100, 0)

				local var_121_13 = manager.ui.mainCamera.transform.position - var_121_6.position

				var_121_6.forward = Vector3.New(var_121_13.x, var_121_13.y, var_121_13.z)

				local var_121_14 = var_121_6.localEulerAngles

				var_121_14.z = 0
				var_121_14.x = 0
				var_121_6.localEulerAngles = var_121_14
			end

			local var_121_15 = 0
			local var_121_16 = 0.75

			if var_121_15 < arg_118_1.time_ and arg_118_1.time_ <= var_121_15 + arg_121_0 then
				arg_118_1.talkMaxDuration = 0
				arg_118_1.dialogCg_.alpha = 1

				arg_118_1.dialog_:SetActive(true)
				SetActive(arg_118_1.leftNameGo_, false)

				arg_118_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_118_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_118_1:RecordName(arg_118_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_118_1.iconTrs_.gameObject, false)
				arg_118_1.callingController_:SetSelectedState("normal")

				local var_121_17 = arg_118_1:GetWordFromCfg(910601028)
				local var_121_18 = arg_118_1:FormatText(var_121_17.content)

				arg_118_1.text_.text = var_121_18

				LuaForUtil.ClearLinePrefixSymbol(arg_118_1.text_)

				local var_121_19 = 30
				local var_121_20 = utf8.len(var_121_18)
				local var_121_21 = var_121_19 <= 0 and var_121_16 or var_121_16 * (var_121_20 / var_121_19)

				if var_121_21 > 0 and var_121_16 < var_121_21 then
					arg_118_1.talkMaxDuration = var_121_21

					if var_121_21 + var_121_15 > arg_118_1.duration_ then
						arg_118_1.duration_ = var_121_21 + var_121_15
					end
				end

				arg_118_1.text_.text = var_121_18
				arg_118_1.typewritter.percent = 0

				arg_118_1.typewritter:SetDirty()
				arg_118_1:ShowNextGo(false)
				arg_118_1:RecordContent(arg_118_1.text_.text)
			end

			local var_121_22 = math.max(var_121_16, arg_118_1.talkMaxDuration)

			if var_121_15 <= arg_118_1.time_ and arg_118_1.time_ < var_121_15 + var_121_22 then
				arg_118_1.typewritter.percent = (arg_118_1.time_ - var_121_15) / var_121_22

				arg_118_1.typewritter:SetDirty()
			end

			if arg_118_1.time_ >= var_121_15 + var_121_22 and arg_118_1.time_ < var_121_15 + var_121_22 + arg_121_0 then
				arg_118_1.typewritter.percent = 1

				arg_118_1.typewritter:SetDirty()
				arg_118_1:ShowNextGo(true)
			end
		end
	end,
	Play910601029 = function(arg_122_0, arg_122_1)
		arg_122_1.time_ = 0
		arg_122_1.frameCnt_ = 0
		arg_122_1.state_ = "playing"
		arg_122_1.curTalkId_ = 910601029
		arg_122_1.duration_ = 5

		SetActive(arg_122_1.tipsGo_, false)

		function arg_122_1.onSingleLineFinish_()
			arg_122_1.onSingleLineUpdate_ = nil
			arg_122_1.onSingleLineFinish_ = nil
			arg_122_1.state_ = "waiting"
		end

		function arg_122_1.playNext_(arg_124_0)
			if arg_124_0 == 1 then
				arg_122_0:Play910601030(arg_122_1)
			end
		end

		function arg_122_1.onSingleLineUpdate_(arg_125_0)
			local var_125_0 = 0
			local var_125_1 = 1.125

			if var_125_0 < arg_122_1.time_ and arg_122_1.time_ <= var_125_0 + arg_125_0 then
				arg_122_1.talkMaxDuration = 0
				arg_122_1.dialogCg_.alpha = 1

				arg_122_1.dialog_:SetActive(true)
				SetActive(arg_122_1.leftNameGo_, false)

				arg_122_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_122_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_122_1:RecordName(arg_122_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_122_1.iconTrs_.gameObject, false)
				arg_122_1.callingController_:SetSelectedState("normal")

				local var_125_2 = arg_122_1:GetWordFromCfg(910601029)
				local var_125_3 = arg_122_1:FormatText(var_125_2.content)

				arg_122_1.text_.text = var_125_3

				LuaForUtil.ClearLinePrefixSymbol(arg_122_1.text_)

				local var_125_4 = 45
				local var_125_5 = utf8.len(var_125_3)
				local var_125_6 = var_125_4 <= 0 and var_125_1 or var_125_1 * (var_125_5 / var_125_4)

				if var_125_6 > 0 and var_125_1 < var_125_6 then
					arg_122_1.talkMaxDuration = var_125_6

					if var_125_6 + var_125_0 > arg_122_1.duration_ then
						arg_122_1.duration_ = var_125_6 + var_125_0
					end
				end

				arg_122_1.text_.text = var_125_3
				arg_122_1.typewritter.percent = 0

				arg_122_1.typewritter:SetDirty()
				arg_122_1:ShowNextGo(false)
				arg_122_1:RecordContent(arg_122_1.text_.text)
			end

			local var_125_7 = math.max(var_125_1, arg_122_1.talkMaxDuration)

			if var_125_0 <= arg_122_1.time_ and arg_122_1.time_ < var_125_0 + var_125_7 then
				arg_122_1.typewritter.percent = (arg_122_1.time_ - var_125_0) / var_125_7

				arg_122_1.typewritter:SetDirty()
			end

			if arg_122_1.time_ >= var_125_0 + var_125_7 and arg_122_1.time_ < var_125_0 + var_125_7 + arg_125_0 then
				arg_122_1.typewritter.percent = 1

				arg_122_1.typewritter:SetDirty()
				arg_122_1:ShowNextGo(true)
			end
		end
	end,
	Play910601030 = function(arg_126_0, arg_126_1)
		arg_126_1.time_ = 0
		arg_126_1.frameCnt_ = 0
		arg_126_1.state_ = "playing"
		arg_126_1.curTalkId_ = 910601030
		arg_126_1.duration_ = 3.73

		SetActive(arg_126_1.tipsGo_, false)

		function arg_126_1.onSingleLineFinish_()
			arg_126_1.onSingleLineUpdate_ = nil
			arg_126_1.onSingleLineFinish_ = nil
			arg_126_1.state_ = "waiting"
		end

		function arg_126_1.playNext_(arg_128_0)
			if arg_128_0 == 1 then
				arg_126_0:Play910601031(arg_126_1)
			end
		end

		function arg_126_1.onSingleLineUpdate_(arg_129_0)
			local var_129_0 = arg_126_1.actors_["1028ui_story"].transform
			local var_129_1 = 0

			if var_129_1 < arg_126_1.time_ and arg_126_1.time_ <= var_129_1 + arg_129_0 then
				arg_126_1.var_.moveOldPos1028ui_story = var_129_0.localPosition

				local var_129_2 = "1028ui_story"

				arg_126_1:ShowWeapon(arg_126_1.var_[var_129_2 .. "Animator"].transform, false)
			end

			local var_129_3 = 0.001

			if var_129_1 <= arg_126_1.time_ and arg_126_1.time_ < var_129_1 + var_129_3 then
				local var_129_4 = (arg_126_1.time_ - var_129_1) / var_129_3
				local var_129_5 = Vector3.New(0, -0.9, -5.9)

				var_129_0.localPosition = Vector3.Lerp(arg_126_1.var_.moveOldPos1028ui_story, var_129_5, var_129_4)

				local var_129_6 = manager.ui.mainCamera.transform.position - var_129_0.position

				var_129_0.forward = Vector3.New(var_129_6.x, var_129_6.y, var_129_6.z)

				local var_129_7 = var_129_0.localEulerAngles

				var_129_7.z = 0
				var_129_7.x = 0
				var_129_0.localEulerAngles = var_129_7
			end

			if arg_126_1.time_ >= var_129_1 + var_129_3 and arg_126_1.time_ < var_129_1 + var_129_3 + arg_129_0 then
				var_129_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_129_8 = manager.ui.mainCamera.transform.position - var_129_0.position

				var_129_0.forward = Vector3.New(var_129_8.x, var_129_8.y, var_129_8.z)

				local var_129_9 = var_129_0.localEulerAngles

				var_129_9.z = 0
				var_129_9.x = 0
				var_129_0.localEulerAngles = var_129_9
			end

			local var_129_10 = arg_126_1.actors_["1028ui_story"]
			local var_129_11 = 0

			if var_129_11 < arg_126_1.time_ and arg_126_1.time_ <= var_129_11 + arg_129_0 and arg_126_1.var_.characterEffect1028ui_story == nil then
				arg_126_1.var_.characterEffect1028ui_story = var_129_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_129_12 = 0.200000002980232

			if var_129_11 <= arg_126_1.time_ and arg_126_1.time_ < var_129_11 + var_129_12 then
				local var_129_13 = (arg_126_1.time_ - var_129_11) / var_129_12

				if arg_126_1.var_.characterEffect1028ui_story then
					arg_126_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_126_1.time_ >= var_129_11 + var_129_12 and arg_126_1.time_ < var_129_11 + var_129_12 + arg_129_0 and arg_126_1.var_.characterEffect1028ui_story then
				arg_126_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_129_14 = 0

			if var_129_14 < arg_126_1.time_ and arg_126_1.time_ <= var_129_14 + arg_129_0 then
				arg_126_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_1")
			end

			local var_129_15 = 0

			if var_129_15 < arg_126_1.time_ and arg_126_1.time_ <= var_129_15 + arg_129_0 then
				arg_126_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_129_16 = arg_126_1.actors_["1059ui_story"].transform
			local var_129_17 = 0

			if var_129_17 < arg_126_1.time_ and arg_126_1.time_ <= var_129_17 + arg_129_0 then
				arg_126_1.var_.moveOldPos1059ui_story = var_129_16.localPosition
			end

			local var_129_18 = 0.001

			if var_129_17 <= arg_126_1.time_ and arg_126_1.time_ < var_129_17 + var_129_18 then
				local var_129_19 = (arg_126_1.time_ - var_129_17) / var_129_18
				local var_129_20 = Vector3.New(0, 100, 0)

				var_129_16.localPosition = Vector3.Lerp(arg_126_1.var_.moveOldPos1059ui_story, var_129_20, var_129_19)

				local var_129_21 = manager.ui.mainCamera.transform.position - var_129_16.position

				var_129_16.forward = Vector3.New(var_129_21.x, var_129_21.y, var_129_21.z)

				local var_129_22 = var_129_16.localEulerAngles

				var_129_22.z = 0
				var_129_22.x = 0
				var_129_16.localEulerAngles = var_129_22
			end

			if arg_126_1.time_ >= var_129_17 + var_129_18 and arg_126_1.time_ < var_129_17 + var_129_18 + arg_129_0 then
				var_129_16.localPosition = Vector3.New(0, 100, 0)

				local var_129_23 = manager.ui.mainCamera.transform.position - var_129_16.position

				var_129_16.forward = Vector3.New(var_129_23.x, var_129_23.y, var_129_23.z)

				local var_129_24 = var_129_16.localEulerAngles

				var_129_24.z = 0
				var_129_24.x = 0
				var_129_16.localEulerAngles = var_129_24
			end

			local var_129_25 = arg_126_1.actors_["1059ui_story"]
			local var_129_26 = 0

			if var_129_26 < arg_126_1.time_ and arg_126_1.time_ <= var_129_26 + arg_129_0 and arg_126_1.var_.characterEffect1059ui_story == nil then
				arg_126_1.var_.characterEffect1059ui_story = var_129_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_129_27 = 0.200000002980232

			if var_129_26 <= arg_126_1.time_ and arg_126_1.time_ < var_129_26 + var_129_27 then
				local var_129_28 = (arg_126_1.time_ - var_129_26) / var_129_27

				if arg_126_1.var_.characterEffect1059ui_story then
					local var_129_29 = Mathf.Lerp(0, 0.5, var_129_28)

					arg_126_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_126_1.var_.characterEffect1059ui_story.fillRatio = var_129_29
				end
			end

			if arg_126_1.time_ >= var_129_26 + var_129_27 and arg_126_1.time_ < var_129_26 + var_129_27 + arg_129_0 and arg_126_1.var_.characterEffect1059ui_story then
				local var_129_30 = 0.5

				arg_126_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_126_1.var_.characterEffect1059ui_story.fillRatio = var_129_30
			end

			local var_129_31 = 0

			if var_129_31 < arg_126_1.time_ and arg_126_1.time_ <= var_129_31 + arg_129_0 then
				arg_126_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_129_32 = 0

			if var_129_32 < arg_126_1.time_ and arg_126_1.time_ <= var_129_32 + arg_129_0 then
				arg_126_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_129_33 = arg_126_1.actors_["1048ui_story"].transform
			local var_129_34 = 0

			if var_129_34 < arg_126_1.time_ and arg_126_1.time_ <= var_129_34 + arg_129_0 then
				arg_126_1.var_.moveOldPos1048ui_story = var_129_33.localPosition
			end

			local var_129_35 = 0.001

			if var_129_34 <= arg_126_1.time_ and arg_126_1.time_ < var_129_34 + var_129_35 then
				local var_129_36 = (arg_126_1.time_ - var_129_34) / var_129_35
				local var_129_37 = Vector3.New(0, 100, 0)

				var_129_33.localPosition = Vector3.Lerp(arg_126_1.var_.moveOldPos1048ui_story, var_129_37, var_129_36)

				local var_129_38 = manager.ui.mainCamera.transform.position - var_129_33.position

				var_129_33.forward = Vector3.New(var_129_38.x, var_129_38.y, var_129_38.z)

				local var_129_39 = var_129_33.localEulerAngles

				var_129_39.z = 0
				var_129_39.x = 0
				var_129_33.localEulerAngles = var_129_39
			end

			if arg_126_1.time_ >= var_129_34 + var_129_35 and arg_126_1.time_ < var_129_34 + var_129_35 + arg_129_0 then
				var_129_33.localPosition = Vector3.New(0, 100, 0)

				local var_129_40 = manager.ui.mainCamera.transform.position - var_129_33.position

				var_129_33.forward = Vector3.New(var_129_40.x, var_129_40.y, var_129_40.z)

				local var_129_41 = var_129_33.localEulerAngles

				var_129_41.z = 0
				var_129_41.x = 0
				var_129_33.localEulerAngles = var_129_41
			end

			local var_129_42 = arg_126_1.actors_["1048ui_story"]
			local var_129_43 = 0

			if var_129_43 < arg_126_1.time_ and arg_126_1.time_ <= var_129_43 + arg_129_0 and arg_126_1.var_.characterEffect1048ui_story == nil then
				arg_126_1.var_.characterEffect1048ui_story = var_129_42:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_129_44 = 0.200000002980232

			if var_129_43 <= arg_126_1.time_ and arg_126_1.time_ < var_129_43 + var_129_44 then
				local var_129_45 = (arg_126_1.time_ - var_129_43) / var_129_44

				if arg_126_1.var_.characterEffect1048ui_story then
					local var_129_46 = Mathf.Lerp(0, 0.5, var_129_45)

					arg_126_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_126_1.var_.characterEffect1048ui_story.fillRatio = var_129_46
				end
			end

			if arg_126_1.time_ >= var_129_43 + var_129_44 and arg_126_1.time_ < var_129_43 + var_129_44 + arg_129_0 and arg_126_1.var_.characterEffect1048ui_story then
				local var_129_47 = 0.5

				arg_126_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_126_1.var_.characterEffect1048ui_story.fillRatio = var_129_47
			end

			local var_129_48 = 0
			local var_129_49 = 0.25

			if var_129_48 < arg_126_1.time_ and arg_126_1.time_ <= var_129_48 + arg_129_0 then
				arg_126_1.talkMaxDuration = 0
				arg_126_1.dialogCg_.alpha = 1

				arg_126_1.dialog_:SetActive(true)
				SetActive(arg_126_1.leftNameGo_, true)

				local var_129_50 = arg_126_1:FormatText(StoryNameCfg[327].name)

				arg_126_1.leftNameTxt_.text = var_129_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_126_1.leftNameTxt_.transform)

				arg_126_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_126_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_126_1:RecordName(arg_126_1.leftNameTxt_.text)
				SetActive(arg_126_1.iconTrs_.gameObject, false)
				arg_126_1.callingController_:SetSelectedState("normal")

				local var_129_51 = arg_126_1:GetWordFromCfg(910601030)
				local var_129_52 = arg_126_1:FormatText(var_129_51.content)

				arg_126_1.text_.text = var_129_52

				LuaForUtil.ClearLinePrefixSymbol(arg_126_1.text_)

				local var_129_53 = 10
				local var_129_54 = utf8.len(var_129_52)
				local var_129_55 = var_129_53 <= 0 and var_129_49 or var_129_49 * (var_129_54 / var_129_53)

				if var_129_55 > 0 and var_129_49 < var_129_55 then
					arg_126_1.talkMaxDuration = var_129_55

					if var_129_55 + var_129_48 > arg_126_1.duration_ then
						arg_126_1.duration_ = var_129_55 + var_129_48
					end
				end

				arg_126_1.text_.text = var_129_52
				arg_126_1.typewritter.percent = 0

				arg_126_1.typewritter:SetDirty()
				arg_126_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601030", "story_v_out_910601.awb") ~= 0 then
					local var_129_56 = manager.audio:GetVoiceLength("story_v_out_910601", "910601030", "story_v_out_910601.awb") / 1000

					if var_129_56 + var_129_48 > arg_126_1.duration_ then
						arg_126_1.duration_ = var_129_56 + var_129_48
					end

					if var_129_51.prefab_name ~= "" and arg_126_1.actors_[var_129_51.prefab_name] ~= nil then
						local var_129_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_126_1.actors_[var_129_51.prefab_name].transform, "story_v_out_910601", "910601030", "story_v_out_910601.awb")

						arg_126_1:RecordAudio("910601030", var_129_57)
						arg_126_1:RecordAudio("910601030", var_129_57)
					else
						arg_126_1:AudioAction("play", "voice", "story_v_out_910601", "910601030", "story_v_out_910601.awb")
					end

					arg_126_1:RecordHistoryTalkVoice("story_v_out_910601", "910601030", "story_v_out_910601.awb")
				end

				arg_126_1:RecordContent(arg_126_1.text_.text)
			end

			local var_129_58 = math.max(var_129_49, arg_126_1.talkMaxDuration)

			if var_129_48 <= arg_126_1.time_ and arg_126_1.time_ < var_129_48 + var_129_58 then
				arg_126_1.typewritter.percent = (arg_126_1.time_ - var_129_48) / var_129_58

				arg_126_1.typewritter:SetDirty()
			end

			if arg_126_1.time_ >= var_129_48 + var_129_58 and arg_126_1.time_ < var_129_48 + var_129_58 + arg_129_0 then
				arg_126_1.typewritter.percent = 1

				arg_126_1.typewritter:SetDirty()
				arg_126_1:ShowNextGo(true)
			end
		end
	end,
	Play910601031 = function(arg_130_0, arg_130_1)
		arg_130_1.time_ = 0
		arg_130_1.frameCnt_ = 0
		arg_130_1.state_ = "playing"
		arg_130_1.curTalkId_ = 910601031
		arg_130_1.duration_ = 3.57

		SetActive(arg_130_1.tipsGo_, false)

		function arg_130_1.onSingleLineFinish_()
			arg_130_1.onSingleLineUpdate_ = nil
			arg_130_1.onSingleLineFinish_ = nil
			arg_130_1.state_ = "waiting"
		end

		function arg_130_1.playNext_(arg_132_0)
			if arg_132_0 == 1 then
				arg_130_0:Play910601032(arg_130_1)
			end
		end

		function arg_130_1.onSingleLineUpdate_(arg_133_0)
			local var_133_0 = arg_130_1.actors_["1028ui_story"]
			local var_133_1 = 0

			if var_133_1 < arg_130_1.time_ and arg_130_1.time_ <= var_133_1 + arg_133_0 and arg_130_1.var_.characterEffect1028ui_story == nil then
				arg_130_1.var_.characterEffect1028ui_story = var_133_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_133_2 = 0.200000002980232

			if var_133_1 <= arg_130_1.time_ and arg_130_1.time_ < var_133_1 + var_133_2 then
				local var_133_3 = (arg_130_1.time_ - var_133_1) / var_133_2

				if arg_130_1.var_.characterEffect1028ui_story then
					local var_133_4 = Mathf.Lerp(0, 0.5, var_133_3)

					arg_130_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_130_1.var_.characterEffect1028ui_story.fillRatio = var_133_4
				end
			end

			if arg_130_1.time_ >= var_133_1 + var_133_2 and arg_130_1.time_ < var_133_1 + var_133_2 + arg_133_0 and arg_130_1.var_.characterEffect1028ui_story then
				local var_133_5 = 0.5

				arg_130_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_130_1.var_.characterEffect1028ui_story.fillRatio = var_133_5
			end

			local var_133_6 = arg_130_1.actors_["1059ui_story"].transform
			local var_133_7 = 0

			if var_133_7 < arg_130_1.time_ and arg_130_1.time_ <= var_133_7 + arg_133_0 then
				arg_130_1.var_.moveOldPos1059ui_story = var_133_6.localPosition
			end

			local var_133_8 = 0.001

			if var_133_7 <= arg_130_1.time_ and arg_130_1.time_ < var_133_7 + var_133_8 then
				local var_133_9 = (arg_130_1.time_ - var_133_7) / var_133_8
				local var_133_10 = Vector3.New(-0.7, -1.05, -6)

				var_133_6.localPosition = Vector3.Lerp(arg_130_1.var_.moveOldPos1059ui_story, var_133_10, var_133_9)

				local var_133_11 = manager.ui.mainCamera.transform.position - var_133_6.position

				var_133_6.forward = Vector3.New(var_133_11.x, var_133_11.y, var_133_11.z)

				local var_133_12 = var_133_6.localEulerAngles

				var_133_12.z = 0
				var_133_12.x = 0
				var_133_6.localEulerAngles = var_133_12
			end

			if arg_130_1.time_ >= var_133_7 + var_133_8 and arg_130_1.time_ < var_133_7 + var_133_8 + arg_133_0 then
				var_133_6.localPosition = Vector3.New(-0.7, -1.05, -6)

				local var_133_13 = manager.ui.mainCamera.transform.position - var_133_6.position

				var_133_6.forward = Vector3.New(var_133_13.x, var_133_13.y, var_133_13.z)

				local var_133_14 = var_133_6.localEulerAngles

				var_133_14.z = 0
				var_133_14.x = 0
				var_133_6.localEulerAngles = var_133_14
			end

			local var_133_15 = arg_130_1.actors_["1059ui_story"]
			local var_133_16 = 0

			if var_133_16 < arg_130_1.time_ and arg_130_1.time_ <= var_133_16 + arg_133_0 and arg_130_1.var_.characterEffect1059ui_story == nil then
				arg_130_1.var_.characterEffect1059ui_story = var_133_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_133_17 = 0.200000002980232

			if var_133_16 <= arg_130_1.time_ and arg_130_1.time_ < var_133_16 + var_133_17 then
				local var_133_18 = (arg_130_1.time_ - var_133_16) / var_133_17

				if arg_130_1.var_.characterEffect1059ui_story then
					arg_130_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_130_1.time_ >= var_133_16 + var_133_17 and arg_130_1.time_ < var_133_16 + var_133_17 + arg_133_0 and arg_130_1.var_.characterEffect1059ui_story then
				arg_130_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_133_19 = 0

			if var_133_19 < arg_130_1.time_ and arg_130_1.time_ <= var_133_19 + arg_133_0 then
				arg_130_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action6_1")
			end

			local var_133_20 = arg_130_1.actors_["1048ui_story"].transform
			local var_133_21 = 0

			if var_133_21 < arg_130_1.time_ and arg_130_1.time_ <= var_133_21 + arg_133_0 then
				arg_130_1.var_.moveOldPos1048ui_story = var_133_20.localPosition

				local var_133_22 = "1048ui_story"

				arg_130_1:ShowWeapon(arg_130_1.var_[var_133_22 .. "Animator"].transform, false)
			end

			local var_133_23 = 0.001

			if var_133_21 <= arg_130_1.time_ and arg_130_1.time_ < var_133_21 + var_133_23 then
				local var_133_24 = (arg_130_1.time_ - var_133_21) / var_133_23
				local var_133_25 = Vector3.New(0.7, -0.8, -6.2)

				var_133_20.localPosition = Vector3.Lerp(arg_130_1.var_.moveOldPos1048ui_story, var_133_25, var_133_24)

				local var_133_26 = manager.ui.mainCamera.transform.position - var_133_20.position

				var_133_20.forward = Vector3.New(var_133_26.x, var_133_26.y, var_133_26.z)

				local var_133_27 = var_133_20.localEulerAngles

				var_133_27.z = 0
				var_133_27.x = 0
				var_133_20.localEulerAngles = var_133_27
			end

			if arg_130_1.time_ >= var_133_21 + var_133_23 and arg_130_1.time_ < var_133_21 + var_133_23 + arg_133_0 then
				var_133_20.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_133_28 = manager.ui.mainCamera.transform.position - var_133_20.position

				var_133_20.forward = Vector3.New(var_133_28.x, var_133_28.y, var_133_28.z)

				local var_133_29 = var_133_20.localEulerAngles

				var_133_29.z = 0
				var_133_29.x = 0
				var_133_20.localEulerAngles = var_133_29
			end

			local var_133_30 = arg_130_1.actors_["1048ui_story"]
			local var_133_31 = 0

			if var_133_31 < arg_130_1.time_ and arg_130_1.time_ <= var_133_31 + arg_133_0 and arg_130_1.var_.characterEffect1048ui_story == nil then
				arg_130_1.var_.characterEffect1048ui_story = var_133_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_133_32 = 0.200000002980232

			if var_133_31 <= arg_130_1.time_ and arg_130_1.time_ < var_133_31 + var_133_32 then
				local var_133_33 = (arg_130_1.time_ - var_133_31) / var_133_32

				if arg_130_1.var_.characterEffect1048ui_story then
					arg_130_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_130_1.time_ >= var_133_31 + var_133_32 and arg_130_1.time_ < var_133_31 + var_133_32 + arg_133_0 and arg_130_1.var_.characterEffect1048ui_story then
				arg_130_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_133_34 = 0

			if var_133_34 < arg_130_1.time_ and arg_130_1.time_ <= var_133_34 + arg_133_0 then
				arg_130_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_133_35 = 0

			if var_133_35 < arg_130_1.time_ and arg_130_1.time_ <= var_133_35 + arg_133_0 then
				arg_130_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_133_36 = arg_130_1.actors_["1028ui_story"].transform
			local var_133_37 = 0

			if var_133_37 < arg_130_1.time_ and arg_130_1.time_ <= var_133_37 + arg_133_0 then
				arg_130_1.var_.moveOldPos1028ui_story = var_133_36.localPosition

				local var_133_38 = "1028ui_story"

				arg_130_1:ShowWeapon(arg_130_1.var_[var_133_38 .. "Animator"].transform, false)
			end

			local var_133_39 = 0.001

			if var_133_37 <= arg_130_1.time_ and arg_130_1.time_ < var_133_37 + var_133_39 then
				local var_133_40 = (arg_130_1.time_ - var_133_37) / var_133_39
				local var_133_41 = Vector3.New(0, 100, 0)

				var_133_36.localPosition = Vector3.Lerp(arg_130_1.var_.moveOldPos1028ui_story, var_133_41, var_133_40)

				local var_133_42 = manager.ui.mainCamera.transform.position - var_133_36.position

				var_133_36.forward = Vector3.New(var_133_42.x, var_133_42.y, var_133_42.z)

				local var_133_43 = var_133_36.localEulerAngles

				var_133_43.z = 0
				var_133_43.x = 0
				var_133_36.localEulerAngles = var_133_43
			end

			if arg_130_1.time_ >= var_133_37 + var_133_39 and arg_130_1.time_ < var_133_37 + var_133_39 + arg_133_0 then
				var_133_36.localPosition = Vector3.New(0, 100, 0)

				local var_133_44 = manager.ui.mainCamera.transform.position - var_133_36.position

				var_133_36.forward = Vector3.New(var_133_44.x, var_133_44.y, var_133_44.z)

				local var_133_45 = var_133_36.localEulerAngles

				var_133_45.z = 0
				var_133_45.x = 0
				var_133_36.localEulerAngles = var_133_45
			end

			local var_133_46 = 0
			local var_133_47 = 0.225

			if var_133_46 < arg_130_1.time_ and arg_130_1.time_ <= var_133_46 + arg_133_0 then
				arg_130_1.talkMaxDuration = 0
				arg_130_1.dialogCg_.alpha = 1

				arg_130_1.dialog_:SetActive(true)
				SetActive(arg_130_1.leftNameGo_, true)

				local var_133_48 = arg_130_1:FormatText(StoryNameCfg[335].name)

				arg_130_1.leftNameTxt_.text = var_133_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_130_1.leftNameTxt_.transform)

				arg_130_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_130_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_130_1:RecordName(arg_130_1.leftNameTxt_.text)
				SetActive(arg_130_1.iconTrs_.gameObject, false)
				arg_130_1.callingController_:SetSelectedState("normal")

				local var_133_49 = arg_130_1:GetWordFromCfg(910601031)
				local var_133_50 = arg_130_1:FormatText(var_133_49.content)

				arg_130_1.text_.text = var_133_50

				LuaForUtil.ClearLinePrefixSymbol(arg_130_1.text_)

				local var_133_51 = 9
				local var_133_52 = utf8.len(var_133_50)
				local var_133_53 = var_133_51 <= 0 and var_133_47 or var_133_47 * (var_133_52 / var_133_51)

				if var_133_53 > 0 and var_133_47 < var_133_53 then
					arg_130_1.talkMaxDuration = var_133_53

					if var_133_53 + var_133_46 > arg_130_1.duration_ then
						arg_130_1.duration_ = var_133_53 + var_133_46
					end
				end

				arg_130_1.text_.text = var_133_50
				arg_130_1.typewritter.percent = 0

				arg_130_1.typewritter:SetDirty()
				arg_130_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601031", "story_v_out_910601.awb") ~= 0 then
					local var_133_54 = manager.audio:GetVoiceLength("story_v_out_910601", "910601031", "story_v_out_910601.awb") / 1000

					if var_133_54 + var_133_46 > arg_130_1.duration_ then
						arg_130_1.duration_ = var_133_54 + var_133_46
					end

					if var_133_49.prefab_name ~= "" and arg_130_1.actors_[var_133_49.prefab_name] ~= nil then
						local var_133_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_130_1.actors_[var_133_49.prefab_name].transform, "story_v_out_910601", "910601031", "story_v_out_910601.awb")

						arg_130_1:RecordAudio("910601031", var_133_55)
						arg_130_1:RecordAudio("910601031", var_133_55)
					else
						arg_130_1:AudioAction("play", "voice", "story_v_out_910601", "910601031", "story_v_out_910601.awb")
					end

					arg_130_1:RecordHistoryTalkVoice("story_v_out_910601", "910601031", "story_v_out_910601.awb")
				end

				arg_130_1:RecordContent(arg_130_1.text_.text)
			end

			local var_133_56 = math.max(var_133_47, arg_130_1.talkMaxDuration)

			if var_133_46 <= arg_130_1.time_ and arg_130_1.time_ < var_133_46 + var_133_56 then
				arg_130_1.typewritter.percent = (arg_130_1.time_ - var_133_46) / var_133_56

				arg_130_1.typewritter:SetDirty()
			end

			if arg_130_1.time_ >= var_133_46 + var_133_56 and arg_130_1.time_ < var_133_46 + var_133_56 + arg_133_0 then
				arg_130_1.typewritter.percent = 1

				arg_130_1.typewritter:SetDirty()
				arg_130_1:ShowNextGo(true)
			end
		end
	end,
	Play910601032 = function(arg_134_0, arg_134_1)
		arg_134_1.time_ = 0
		arg_134_1.frameCnt_ = 0
		arg_134_1.state_ = "playing"
		arg_134_1.curTalkId_ = 910601032
		arg_134_1.duration_ = 5

		SetActive(arg_134_1.tipsGo_, false)

		function arg_134_1.onSingleLineFinish_()
			arg_134_1.onSingleLineUpdate_ = nil
			arg_134_1.onSingleLineFinish_ = nil
			arg_134_1.state_ = "waiting"
		end

		function arg_134_1.playNext_(arg_136_0)
			if arg_136_0 == 1 then
				arg_134_0:Play910601033(arg_134_1)
			end
		end

		function arg_134_1.onSingleLineUpdate_(arg_137_0)
			local var_137_0 = arg_134_1.actors_["1048ui_story"]
			local var_137_1 = 0

			if var_137_1 < arg_134_1.time_ and arg_134_1.time_ <= var_137_1 + arg_137_0 and arg_134_1.var_.characterEffect1048ui_story == nil then
				arg_134_1.var_.characterEffect1048ui_story = var_137_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_137_2 = 0.200000002980232

			if var_137_1 <= arg_134_1.time_ and arg_134_1.time_ < var_137_1 + var_137_2 then
				local var_137_3 = (arg_134_1.time_ - var_137_1) / var_137_2

				if arg_134_1.var_.characterEffect1048ui_story then
					local var_137_4 = Mathf.Lerp(0, 0.5, var_137_3)

					arg_134_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_134_1.var_.characterEffect1048ui_story.fillRatio = var_137_4
				end
			end

			if arg_134_1.time_ >= var_137_1 + var_137_2 and arg_134_1.time_ < var_137_1 + var_137_2 + arg_137_0 and arg_134_1.var_.characterEffect1048ui_story then
				local var_137_5 = 0.5

				arg_134_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_134_1.var_.characterEffect1048ui_story.fillRatio = var_137_5
			end

			local var_137_6 = arg_134_1.actors_["1059ui_story"]
			local var_137_7 = 0

			if var_137_7 < arg_134_1.time_ and arg_134_1.time_ <= var_137_7 + arg_137_0 and arg_134_1.var_.characterEffect1059ui_story == nil then
				arg_134_1.var_.characterEffect1059ui_story = var_137_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_137_8 = 0.200000002980232

			if var_137_7 <= arg_134_1.time_ and arg_134_1.time_ < var_137_7 + var_137_8 then
				local var_137_9 = (arg_134_1.time_ - var_137_7) / var_137_8

				if arg_134_1.var_.characterEffect1059ui_story then
					local var_137_10 = Mathf.Lerp(0, 0.5, var_137_9)

					arg_134_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_134_1.var_.characterEffect1059ui_story.fillRatio = var_137_10
				end
			end

			if arg_134_1.time_ >= var_137_7 + var_137_8 and arg_134_1.time_ < var_137_7 + var_137_8 + arg_137_0 and arg_134_1.var_.characterEffect1059ui_story then
				local var_137_11 = 0.5

				arg_134_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_134_1.var_.characterEffect1059ui_story.fillRatio = var_137_11
			end

			local var_137_12 = 0
			local var_137_13 = 0.35

			if var_137_12 < arg_134_1.time_ and arg_134_1.time_ <= var_137_12 + arg_137_0 then
				arg_134_1.talkMaxDuration = 0
				arg_134_1.dialogCg_.alpha = 1

				arg_134_1.dialog_:SetActive(true)
				SetActive(arg_134_1.leftNameGo_, true)

				local var_137_14 = arg_134_1:FormatText(StoryNameCfg[7].name)

				arg_134_1.leftNameTxt_.text = var_137_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_134_1.leftNameTxt_.transform)

				arg_134_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_134_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_134_1:RecordName(arg_134_1.leftNameTxt_.text)
				SetActive(arg_134_1.iconTrs_.gameObject, false)
				arg_134_1.callingController_:SetSelectedState("normal")

				local var_137_15 = arg_134_1:GetWordFromCfg(910601032)
				local var_137_16 = arg_134_1:FormatText(var_137_15.content)

				arg_134_1.text_.text = var_137_16

				LuaForUtil.ClearLinePrefixSymbol(arg_134_1.text_)

				local var_137_17 = 14
				local var_137_18 = utf8.len(var_137_16)
				local var_137_19 = var_137_17 <= 0 and var_137_13 or var_137_13 * (var_137_18 / var_137_17)

				if var_137_19 > 0 and var_137_13 < var_137_19 then
					arg_134_1.talkMaxDuration = var_137_19

					if var_137_19 + var_137_12 > arg_134_1.duration_ then
						arg_134_1.duration_ = var_137_19 + var_137_12
					end
				end

				arg_134_1.text_.text = var_137_16
				arg_134_1.typewritter.percent = 0

				arg_134_1.typewritter:SetDirty()
				arg_134_1:ShowNextGo(false)
				arg_134_1:RecordContent(arg_134_1.text_.text)
			end

			local var_137_20 = math.max(var_137_13, arg_134_1.talkMaxDuration)

			if var_137_12 <= arg_134_1.time_ and arg_134_1.time_ < var_137_12 + var_137_20 then
				arg_134_1.typewritter.percent = (arg_134_1.time_ - var_137_12) / var_137_20

				arg_134_1.typewritter:SetDirty()
			end

			if arg_134_1.time_ >= var_137_12 + var_137_20 and arg_134_1.time_ < var_137_12 + var_137_20 + arg_137_0 then
				arg_134_1.typewritter.percent = 1

				arg_134_1.typewritter:SetDirty()
				arg_134_1:ShowNextGo(true)
			end
		end
	end,
	Play910601033 = function(arg_138_0, arg_138_1)
		arg_138_1.time_ = 0
		arg_138_1.frameCnt_ = 0
		arg_138_1.state_ = "playing"
		arg_138_1.curTalkId_ = 910601033
		arg_138_1.duration_ = 4.23

		SetActive(arg_138_1.tipsGo_, false)

		function arg_138_1.onSingleLineFinish_()
			arg_138_1.onSingleLineUpdate_ = nil
			arg_138_1.onSingleLineFinish_ = nil
			arg_138_1.state_ = "waiting"
		end

		function arg_138_1.playNext_(arg_140_0)
			if arg_140_0 == 1 then
				arg_138_0:Play910601034(arg_138_1)
			end
		end

		function arg_138_1.onSingleLineUpdate_(arg_141_0)
			local var_141_0 = arg_138_1.actors_["1084ui_story"].transform
			local var_141_1 = 0

			if var_141_1 < arg_138_1.time_ and arg_138_1.time_ <= var_141_1 + arg_141_0 then
				arg_138_1.var_.moveOldPos1084ui_story = var_141_0.localPosition
			end

			local var_141_2 = 0.001

			if var_141_1 <= arg_138_1.time_ and arg_138_1.time_ < var_141_1 + var_141_2 then
				local var_141_3 = (arg_138_1.time_ - var_141_1) / var_141_2
				local var_141_4 = Vector3.New(0, -0.97, -6)

				var_141_0.localPosition = Vector3.Lerp(arg_138_1.var_.moveOldPos1084ui_story, var_141_4, var_141_3)

				local var_141_5 = manager.ui.mainCamera.transform.position - var_141_0.position

				var_141_0.forward = Vector3.New(var_141_5.x, var_141_5.y, var_141_5.z)

				local var_141_6 = var_141_0.localEulerAngles

				var_141_6.z = 0
				var_141_6.x = 0
				var_141_0.localEulerAngles = var_141_6
			end

			if arg_138_1.time_ >= var_141_1 + var_141_2 and arg_138_1.time_ < var_141_1 + var_141_2 + arg_141_0 then
				var_141_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_141_7 = manager.ui.mainCamera.transform.position - var_141_0.position

				var_141_0.forward = Vector3.New(var_141_7.x, var_141_7.y, var_141_7.z)

				local var_141_8 = var_141_0.localEulerAngles

				var_141_8.z = 0
				var_141_8.x = 0
				var_141_0.localEulerAngles = var_141_8
			end

			local var_141_9 = arg_138_1.actors_["1084ui_story"]
			local var_141_10 = 0

			if var_141_10 < arg_138_1.time_ and arg_138_1.time_ <= var_141_10 + arg_141_0 and arg_138_1.var_.characterEffect1084ui_story == nil then
				arg_138_1.var_.characterEffect1084ui_story = var_141_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_141_11 = 0.200000002980232

			if var_141_10 <= arg_138_1.time_ and arg_138_1.time_ < var_141_10 + var_141_11 then
				local var_141_12 = (arg_138_1.time_ - var_141_10) / var_141_11

				if arg_138_1.var_.characterEffect1084ui_story then
					arg_138_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_138_1.time_ >= var_141_10 + var_141_11 and arg_138_1.time_ < var_141_10 + var_141_11 + arg_141_0 and arg_138_1.var_.characterEffect1084ui_story then
				arg_138_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_141_13 = 0

			if var_141_13 < arg_138_1.time_ and arg_138_1.time_ <= var_141_13 + arg_141_0 then
				arg_138_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_141_14 = 0

			if var_141_14 < arg_138_1.time_ and arg_138_1.time_ <= var_141_14 + arg_141_0 then
				arg_138_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_141_15 = arg_138_1.actors_["1028ui_story"].transform
			local var_141_16 = 0

			if var_141_16 < arg_138_1.time_ and arg_138_1.time_ <= var_141_16 + arg_141_0 then
				arg_138_1.var_.moveOldPos1028ui_story = var_141_15.localPosition
			end

			local var_141_17 = 0.001

			if var_141_16 <= arg_138_1.time_ and arg_138_1.time_ < var_141_16 + var_141_17 then
				local var_141_18 = (arg_138_1.time_ - var_141_16) / var_141_17
				local var_141_19 = Vector3.New(0, 100, 0)

				var_141_15.localPosition = Vector3.Lerp(arg_138_1.var_.moveOldPos1028ui_story, var_141_19, var_141_18)

				local var_141_20 = manager.ui.mainCamera.transform.position - var_141_15.position

				var_141_15.forward = Vector3.New(var_141_20.x, var_141_20.y, var_141_20.z)

				local var_141_21 = var_141_15.localEulerAngles

				var_141_21.z = 0
				var_141_21.x = 0
				var_141_15.localEulerAngles = var_141_21
			end

			if arg_138_1.time_ >= var_141_16 + var_141_17 and arg_138_1.time_ < var_141_16 + var_141_17 + arg_141_0 then
				var_141_15.localPosition = Vector3.New(0, 100, 0)

				local var_141_22 = manager.ui.mainCamera.transform.position - var_141_15.position

				var_141_15.forward = Vector3.New(var_141_22.x, var_141_22.y, var_141_22.z)

				local var_141_23 = var_141_15.localEulerAngles

				var_141_23.z = 0
				var_141_23.x = 0
				var_141_15.localEulerAngles = var_141_23
			end

			local var_141_24 = arg_138_1.actors_["1028ui_story"]
			local var_141_25 = 0

			if var_141_25 < arg_138_1.time_ and arg_138_1.time_ <= var_141_25 + arg_141_0 and arg_138_1.var_.characterEffect1028ui_story == nil then
				arg_138_1.var_.characterEffect1028ui_story = var_141_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_141_26 = 0.200000002980232

			if var_141_25 <= arg_138_1.time_ and arg_138_1.time_ < var_141_25 + var_141_26 then
				local var_141_27 = (arg_138_1.time_ - var_141_25) / var_141_26

				if arg_138_1.var_.characterEffect1028ui_story then
					local var_141_28 = Mathf.Lerp(0, 0.5, var_141_27)

					arg_138_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_138_1.var_.characterEffect1028ui_story.fillRatio = var_141_28
				end
			end

			if arg_138_1.time_ >= var_141_25 + var_141_26 and arg_138_1.time_ < var_141_25 + var_141_26 + arg_141_0 and arg_138_1.var_.characterEffect1028ui_story then
				local var_141_29 = 0.5

				arg_138_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_138_1.var_.characterEffect1028ui_story.fillRatio = var_141_29
			end

			local var_141_30 = arg_138_1.actors_["1059ui_story"].transform
			local var_141_31 = 0

			if var_141_31 < arg_138_1.time_ and arg_138_1.time_ <= var_141_31 + arg_141_0 then
				arg_138_1.var_.moveOldPos1059ui_story = var_141_30.localPosition
			end

			local var_141_32 = 0.001

			if var_141_31 <= arg_138_1.time_ and arg_138_1.time_ < var_141_31 + var_141_32 then
				local var_141_33 = (arg_138_1.time_ - var_141_31) / var_141_32
				local var_141_34 = Vector3.New(0, 100, 0)

				var_141_30.localPosition = Vector3.Lerp(arg_138_1.var_.moveOldPos1059ui_story, var_141_34, var_141_33)

				local var_141_35 = manager.ui.mainCamera.transform.position - var_141_30.position

				var_141_30.forward = Vector3.New(var_141_35.x, var_141_35.y, var_141_35.z)

				local var_141_36 = var_141_30.localEulerAngles

				var_141_36.z = 0
				var_141_36.x = 0
				var_141_30.localEulerAngles = var_141_36
			end

			if arg_138_1.time_ >= var_141_31 + var_141_32 and arg_138_1.time_ < var_141_31 + var_141_32 + arg_141_0 then
				var_141_30.localPosition = Vector3.New(0, 100, 0)

				local var_141_37 = manager.ui.mainCamera.transform.position - var_141_30.position

				var_141_30.forward = Vector3.New(var_141_37.x, var_141_37.y, var_141_37.z)

				local var_141_38 = var_141_30.localEulerAngles

				var_141_38.z = 0
				var_141_38.x = 0
				var_141_30.localEulerAngles = var_141_38
			end

			local var_141_39 = arg_138_1.actors_["1048ui_story"].transform
			local var_141_40 = 0

			if var_141_40 < arg_138_1.time_ and arg_138_1.time_ <= var_141_40 + arg_141_0 then
				arg_138_1.var_.moveOldPos1048ui_story = var_141_39.localPosition
			end

			local var_141_41 = 0.001

			if var_141_40 <= arg_138_1.time_ and arg_138_1.time_ < var_141_40 + var_141_41 then
				local var_141_42 = (arg_138_1.time_ - var_141_40) / var_141_41
				local var_141_43 = Vector3.New(0, 100, 0)

				var_141_39.localPosition = Vector3.Lerp(arg_138_1.var_.moveOldPos1048ui_story, var_141_43, var_141_42)

				local var_141_44 = manager.ui.mainCamera.transform.position - var_141_39.position

				var_141_39.forward = Vector3.New(var_141_44.x, var_141_44.y, var_141_44.z)

				local var_141_45 = var_141_39.localEulerAngles

				var_141_45.z = 0
				var_141_45.x = 0
				var_141_39.localEulerAngles = var_141_45
			end

			if arg_138_1.time_ >= var_141_40 + var_141_41 and arg_138_1.time_ < var_141_40 + var_141_41 + arg_141_0 then
				var_141_39.localPosition = Vector3.New(0, 100, 0)

				local var_141_46 = manager.ui.mainCamera.transform.position - var_141_39.position

				var_141_39.forward = Vector3.New(var_141_46.x, var_141_46.y, var_141_46.z)

				local var_141_47 = var_141_39.localEulerAngles

				var_141_47.z = 0
				var_141_47.x = 0
				var_141_39.localEulerAngles = var_141_47
			end

			local var_141_48 = 0
			local var_141_49 = 0.5

			if var_141_48 < arg_138_1.time_ and arg_138_1.time_ <= var_141_48 + arg_141_0 then
				arg_138_1.talkMaxDuration = 0
				arg_138_1.dialogCg_.alpha = 1

				arg_138_1.dialog_:SetActive(true)
				SetActive(arg_138_1.leftNameGo_, true)

				local var_141_50 = arg_138_1:FormatText(StoryNameCfg[6].name)

				arg_138_1.leftNameTxt_.text = var_141_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_138_1.leftNameTxt_.transform)

				arg_138_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_138_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_138_1:RecordName(arg_138_1.leftNameTxt_.text)
				SetActive(arg_138_1.iconTrs_.gameObject, false)
				arg_138_1.callingController_:SetSelectedState("normal")

				local var_141_51 = arg_138_1:GetWordFromCfg(910601033)
				local var_141_52 = arg_138_1:FormatText(var_141_51.content)

				arg_138_1.text_.text = var_141_52

				LuaForUtil.ClearLinePrefixSymbol(arg_138_1.text_)

				local var_141_53 = 20
				local var_141_54 = utf8.len(var_141_52)
				local var_141_55 = var_141_53 <= 0 and var_141_49 or var_141_49 * (var_141_54 / var_141_53)

				if var_141_55 > 0 and var_141_49 < var_141_55 then
					arg_138_1.talkMaxDuration = var_141_55

					if var_141_55 + var_141_48 > arg_138_1.duration_ then
						arg_138_1.duration_ = var_141_55 + var_141_48
					end
				end

				arg_138_1.text_.text = var_141_52
				arg_138_1.typewritter.percent = 0

				arg_138_1.typewritter:SetDirty()
				arg_138_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601033", "story_v_out_910601.awb") ~= 0 then
					local var_141_56 = manager.audio:GetVoiceLength("story_v_out_910601", "910601033", "story_v_out_910601.awb") / 1000

					if var_141_56 + var_141_48 > arg_138_1.duration_ then
						arg_138_1.duration_ = var_141_56 + var_141_48
					end

					if var_141_51.prefab_name ~= "" and arg_138_1.actors_[var_141_51.prefab_name] ~= nil then
						local var_141_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_138_1.actors_[var_141_51.prefab_name].transform, "story_v_out_910601", "910601033", "story_v_out_910601.awb")

						arg_138_1:RecordAudio("910601033", var_141_57)
						arg_138_1:RecordAudio("910601033", var_141_57)
					else
						arg_138_1:AudioAction("play", "voice", "story_v_out_910601", "910601033", "story_v_out_910601.awb")
					end

					arg_138_1:RecordHistoryTalkVoice("story_v_out_910601", "910601033", "story_v_out_910601.awb")
				end

				arg_138_1:RecordContent(arg_138_1.text_.text)
			end

			local var_141_58 = math.max(var_141_49, arg_138_1.talkMaxDuration)

			if var_141_48 <= arg_138_1.time_ and arg_138_1.time_ < var_141_48 + var_141_58 then
				arg_138_1.typewritter.percent = (arg_138_1.time_ - var_141_48) / var_141_58

				arg_138_1.typewritter:SetDirty()
			end

			if arg_138_1.time_ >= var_141_48 + var_141_58 and arg_138_1.time_ < var_141_48 + var_141_58 + arg_141_0 then
				arg_138_1.typewritter.percent = 1

				arg_138_1.typewritter:SetDirty()
				arg_138_1:ShowNextGo(true)
			end
		end
	end,
	Play910601034 = function(arg_142_0, arg_142_1)
		arg_142_1.time_ = 0
		arg_142_1.frameCnt_ = 0
		arg_142_1.state_ = "playing"
		arg_142_1.curTalkId_ = 910601034
		arg_142_1.duration_ = 7.03

		SetActive(arg_142_1.tipsGo_, false)

		function arg_142_1.onSingleLineFinish_()
			arg_142_1.onSingleLineUpdate_ = nil
			arg_142_1.onSingleLineFinish_ = nil
			arg_142_1.state_ = "waiting"
		end

		function arg_142_1.playNext_(arg_144_0)
			if arg_144_0 == 1 then
				arg_142_0:Play910601035(arg_142_1)
			end
		end

		function arg_142_1.onSingleLineUpdate_(arg_145_0)
			local var_145_0 = 0

			if var_145_0 < arg_142_1.time_ and arg_142_1.time_ <= var_145_0 + arg_145_0 then
				arg_142_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_145_1 = 0

			if var_145_1 < arg_142_1.time_ and arg_142_1.time_ <= var_145_1 + arg_145_0 then
				arg_142_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_145_2 = 0
			local var_145_3 = 0.925

			if var_145_2 < arg_142_1.time_ and arg_142_1.time_ <= var_145_2 + arg_145_0 then
				arg_142_1.talkMaxDuration = 0
				arg_142_1.dialogCg_.alpha = 1

				arg_142_1.dialog_:SetActive(true)
				SetActive(arg_142_1.leftNameGo_, true)

				local var_145_4 = arg_142_1:FormatText(StoryNameCfg[6].name)

				arg_142_1.leftNameTxt_.text = var_145_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_142_1.leftNameTxt_.transform)

				arg_142_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_142_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_142_1:RecordName(arg_142_1.leftNameTxt_.text)
				SetActive(arg_142_1.iconTrs_.gameObject, false)
				arg_142_1.callingController_:SetSelectedState("normal")

				local var_145_5 = arg_142_1:GetWordFromCfg(910601034)
				local var_145_6 = arg_142_1:FormatText(var_145_5.content)

				arg_142_1.text_.text = var_145_6

				LuaForUtil.ClearLinePrefixSymbol(arg_142_1.text_)

				local var_145_7 = 37
				local var_145_8 = utf8.len(var_145_6)
				local var_145_9 = var_145_7 <= 0 and var_145_3 or var_145_3 * (var_145_8 / var_145_7)

				if var_145_9 > 0 and var_145_3 < var_145_9 then
					arg_142_1.talkMaxDuration = var_145_9

					if var_145_9 + var_145_2 > arg_142_1.duration_ then
						arg_142_1.duration_ = var_145_9 + var_145_2
					end
				end

				arg_142_1.text_.text = var_145_6
				arg_142_1.typewritter.percent = 0

				arg_142_1.typewritter:SetDirty()
				arg_142_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601034", "story_v_out_910601.awb") ~= 0 then
					local var_145_10 = manager.audio:GetVoiceLength("story_v_out_910601", "910601034", "story_v_out_910601.awb") / 1000

					if var_145_10 + var_145_2 > arg_142_1.duration_ then
						arg_142_1.duration_ = var_145_10 + var_145_2
					end

					if var_145_5.prefab_name ~= "" and arg_142_1.actors_[var_145_5.prefab_name] ~= nil then
						local var_145_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_142_1.actors_[var_145_5.prefab_name].transform, "story_v_out_910601", "910601034", "story_v_out_910601.awb")

						arg_142_1:RecordAudio("910601034", var_145_11)
						arg_142_1:RecordAudio("910601034", var_145_11)
					else
						arg_142_1:AudioAction("play", "voice", "story_v_out_910601", "910601034", "story_v_out_910601.awb")
					end

					arg_142_1:RecordHistoryTalkVoice("story_v_out_910601", "910601034", "story_v_out_910601.awb")
				end

				arg_142_1:RecordContent(arg_142_1.text_.text)
			end

			local var_145_12 = math.max(var_145_3, arg_142_1.talkMaxDuration)

			if var_145_2 <= arg_142_1.time_ and arg_142_1.time_ < var_145_2 + var_145_12 then
				arg_142_1.typewritter.percent = (arg_142_1.time_ - var_145_2) / var_145_12

				arg_142_1.typewritter:SetDirty()
			end

			if arg_142_1.time_ >= var_145_2 + var_145_12 and arg_142_1.time_ < var_145_2 + var_145_12 + arg_145_0 then
				arg_142_1.typewritter.percent = 1

				arg_142_1.typewritter:SetDirty()
				arg_142_1:ShowNextGo(true)
			end
		end
	end,
	Play910601035 = function(arg_146_0, arg_146_1)
		arg_146_1.time_ = 0
		arg_146_1.frameCnt_ = 0
		arg_146_1.state_ = "playing"
		arg_146_1.curTalkId_ = 910601035
		arg_146_1.duration_ = 7.37

		SetActive(arg_146_1.tipsGo_, false)

		function arg_146_1.onSingleLineFinish_()
			arg_146_1.onSingleLineUpdate_ = nil
			arg_146_1.onSingleLineFinish_ = nil
			arg_146_1.state_ = "waiting"
		end

		function arg_146_1.playNext_(arg_148_0)
			if arg_148_0 == 1 then
				arg_146_0:Play910601036(arg_146_1)
			end
		end

		function arg_146_1.onSingleLineUpdate_(arg_149_0)
			local var_149_0 = 0

			if var_149_0 < arg_146_1.time_ and arg_146_1.time_ <= var_149_0 + arg_149_0 then
				arg_146_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_149_1 = 0

			if var_149_1 < arg_146_1.time_ and arg_146_1.time_ <= var_149_1 + arg_149_0 then
				arg_146_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_149_2 = 0
			local var_149_3 = 1.025

			if var_149_2 < arg_146_1.time_ and arg_146_1.time_ <= var_149_2 + arg_149_0 then
				arg_146_1.talkMaxDuration = 0
				arg_146_1.dialogCg_.alpha = 1

				arg_146_1.dialog_:SetActive(true)
				SetActive(arg_146_1.leftNameGo_, true)

				local var_149_4 = arg_146_1:FormatText(StoryNameCfg[6].name)

				arg_146_1.leftNameTxt_.text = var_149_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_146_1.leftNameTxt_.transform)

				arg_146_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_146_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_146_1:RecordName(arg_146_1.leftNameTxt_.text)
				SetActive(arg_146_1.iconTrs_.gameObject, false)
				arg_146_1.callingController_:SetSelectedState("normal")

				local var_149_5 = arg_146_1:GetWordFromCfg(910601035)
				local var_149_6 = arg_146_1:FormatText(var_149_5.content)

				arg_146_1.text_.text = var_149_6

				LuaForUtil.ClearLinePrefixSymbol(arg_146_1.text_)

				local var_149_7 = 41
				local var_149_8 = utf8.len(var_149_6)
				local var_149_9 = var_149_7 <= 0 and var_149_3 or var_149_3 * (var_149_8 / var_149_7)

				if var_149_9 > 0 and var_149_3 < var_149_9 then
					arg_146_1.talkMaxDuration = var_149_9

					if var_149_9 + var_149_2 > arg_146_1.duration_ then
						arg_146_1.duration_ = var_149_9 + var_149_2
					end
				end

				arg_146_1.text_.text = var_149_6
				arg_146_1.typewritter.percent = 0

				arg_146_1.typewritter:SetDirty()
				arg_146_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601035", "story_v_out_910601.awb") ~= 0 then
					local var_149_10 = manager.audio:GetVoiceLength("story_v_out_910601", "910601035", "story_v_out_910601.awb") / 1000

					if var_149_10 + var_149_2 > arg_146_1.duration_ then
						arg_146_1.duration_ = var_149_10 + var_149_2
					end

					if var_149_5.prefab_name ~= "" and arg_146_1.actors_[var_149_5.prefab_name] ~= nil then
						local var_149_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_146_1.actors_[var_149_5.prefab_name].transform, "story_v_out_910601", "910601035", "story_v_out_910601.awb")

						arg_146_1:RecordAudio("910601035", var_149_11)
						arg_146_1:RecordAudio("910601035", var_149_11)
					else
						arg_146_1:AudioAction("play", "voice", "story_v_out_910601", "910601035", "story_v_out_910601.awb")
					end

					arg_146_1:RecordHistoryTalkVoice("story_v_out_910601", "910601035", "story_v_out_910601.awb")
				end

				arg_146_1:RecordContent(arg_146_1.text_.text)
			end

			local var_149_12 = math.max(var_149_3, arg_146_1.talkMaxDuration)

			if var_149_2 <= arg_146_1.time_ and arg_146_1.time_ < var_149_2 + var_149_12 then
				arg_146_1.typewritter.percent = (arg_146_1.time_ - var_149_2) / var_149_12

				arg_146_1.typewritter:SetDirty()
			end

			if arg_146_1.time_ >= var_149_2 + var_149_12 and arg_146_1.time_ < var_149_2 + var_149_12 + arg_149_0 then
				arg_146_1.typewritter.percent = 1

				arg_146_1.typewritter:SetDirty()
				arg_146_1:ShowNextGo(true)
			end
		end
	end,
	Play910601036 = function(arg_150_0, arg_150_1)
		arg_150_1.time_ = 0
		arg_150_1.frameCnt_ = 0
		arg_150_1.state_ = "playing"
		arg_150_1.curTalkId_ = 910601036
		arg_150_1.duration_ = 5

		SetActive(arg_150_1.tipsGo_, false)

		function arg_150_1.onSingleLineFinish_()
			arg_150_1.onSingleLineUpdate_ = nil
			arg_150_1.onSingleLineFinish_ = nil
			arg_150_1.state_ = "waiting"
		end

		function arg_150_1.playNext_(arg_152_0)
			if arg_152_0 == 1 then
				arg_150_0:Play910601037(arg_150_1)
			end
		end

		function arg_150_1.onSingleLineUpdate_(arg_153_0)
			local var_153_0 = arg_150_1.actors_["1084ui_story"].transform
			local var_153_1 = 0

			if var_153_1 < arg_150_1.time_ and arg_150_1.time_ <= var_153_1 + arg_153_0 then
				arg_150_1.var_.moveOldPos1084ui_story = var_153_0.localPosition
			end

			local var_153_2 = 0.001

			if var_153_1 <= arg_150_1.time_ and arg_150_1.time_ < var_153_1 + var_153_2 then
				local var_153_3 = (arg_150_1.time_ - var_153_1) / var_153_2
				local var_153_4 = Vector3.New(0, 100, 0)

				var_153_0.localPosition = Vector3.Lerp(arg_150_1.var_.moveOldPos1084ui_story, var_153_4, var_153_3)

				local var_153_5 = manager.ui.mainCamera.transform.position - var_153_0.position

				var_153_0.forward = Vector3.New(var_153_5.x, var_153_5.y, var_153_5.z)

				local var_153_6 = var_153_0.localEulerAngles

				var_153_6.z = 0
				var_153_6.x = 0
				var_153_0.localEulerAngles = var_153_6
			end

			if arg_150_1.time_ >= var_153_1 + var_153_2 and arg_150_1.time_ < var_153_1 + var_153_2 + arg_153_0 then
				var_153_0.localPosition = Vector3.New(0, 100, 0)

				local var_153_7 = manager.ui.mainCamera.transform.position - var_153_0.position

				var_153_0.forward = Vector3.New(var_153_7.x, var_153_7.y, var_153_7.z)

				local var_153_8 = var_153_0.localEulerAngles

				var_153_8.z = 0
				var_153_8.x = 0
				var_153_0.localEulerAngles = var_153_8
			end

			local var_153_9 = 0
			local var_153_10 = 0.5

			if var_153_9 < arg_150_1.time_ and arg_150_1.time_ <= var_153_9 + arg_153_0 then
				arg_150_1.talkMaxDuration = 0
				arg_150_1.dialogCg_.alpha = 1

				arg_150_1.dialog_:SetActive(true)
				SetActive(arg_150_1.leftNameGo_, false)

				arg_150_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_150_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_150_1:RecordName(arg_150_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_150_1.iconTrs_.gameObject, false)
				arg_150_1.callingController_:SetSelectedState("normal")

				local var_153_11 = arg_150_1:GetWordFromCfg(910601036)
				local var_153_12 = arg_150_1:FormatText(var_153_11.content)

				arg_150_1.text_.text = var_153_12

				LuaForUtil.ClearLinePrefixSymbol(arg_150_1.text_)

				local var_153_13 = 20
				local var_153_14 = utf8.len(var_153_12)
				local var_153_15 = var_153_13 <= 0 and var_153_10 or var_153_10 * (var_153_14 / var_153_13)

				if var_153_15 > 0 and var_153_10 < var_153_15 then
					arg_150_1.talkMaxDuration = var_153_15

					if var_153_15 + var_153_9 > arg_150_1.duration_ then
						arg_150_1.duration_ = var_153_15 + var_153_9
					end
				end

				arg_150_1.text_.text = var_153_12
				arg_150_1.typewritter.percent = 0

				arg_150_1.typewritter:SetDirty()
				arg_150_1:ShowNextGo(false)
				arg_150_1:RecordContent(arg_150_1.text_.text)
			end

			local var_153_16 = math.max(var_153_10, arg_150_1.talkMaxDuration)

			if var_153_9 <= arg_150_1.time_ and arg_150_1.time_ < var_153_9 + var_153_16 then
				arg_150_1.typewritter.percent = (arg_150_1.time_ - var_153_9) / var_153_16

				arg_150_1.typewritter:SetDirty()
			end

			if arg_150_1.time_ >= var_153_9 + var_153_16 and arg_150_1.time_ < var_153_9 + var_153_16 + arg_153_0 then
				arg_150_1.typewritter.percent = 1

				arg_150_1.typewritter:SetDirty()
				arg_150_1:ShowNextGo(true)
			end
		end
	end,
	Play910601037 = function(arg_154_0, arg_154_1)
		arg_154_1.time_ = 0
		arg_154_1.frameCnt_ = 0
		arg_154_1.state_ = "playing"
		arg_154_1.curTalkId_ = 910601037
		arg_154_1.duration_ = 5

		SetActive(arg_154_1.tipsGo_, false)

		function arg_154_1.onSingleLineFinish_()
			arg_154_1.onSingleLineUpdate_ = nil
			arg_154_1.onSingleLineFinish_ = nil
			arg_154_1.state_ = "waiting"
		end

		function arg_154_1.playNext_(arg_156_0)
			if arg_156_0 == 1 then
				arg_154_0:Play910601038(arg_154_1)
			end
		end

		function arg_154_1.onSingleLineUpdate_(arg_157_0)
			local var_157_0 = manager.ui.mainCamera.transform
			local var_157_1 = 0

			if var_157_1 < arg_154_1.time_ and arg_154_1.time_ <= var_157_1 + arg_157_0 then
				arg_154_1.var_.shakeOldPos = var_157_0.localPosition
			end

			local var_157_2 = 0.6

			if var_157_1 <= arg_154_1.time_ and arg_154_1.time_ < var_157_1 + var_157_2 then
				local var_157_3 = (arg_154_1.time_ - var_157_1) / 0.066
				local var_157_4, var_157_5 = math.modf(var_157_3)

				var_157_0.localPosition = Vector3.New(var_157_5 * 0.13, var_157_5 * 0.13, var_157_5 * 0.13) + arg_154_1.var_.shakeOldPos
			end

			if arg_154_1.time_ >= var_157_1 + var_157_2 and arg_154_1.time_ < var_157_1 + var_157_2 + arg_157_0 then
				var_157_0.localPosition = arg_154_1.var_.shakeOldPos
			end

			local var_157_6 = 0

			if var_157_6 < arg_154_1.time_ and arg_154_1.time_ <= var_157_6 + arg_157_0 then
				arg_154_1.allBtn_.enabled = false
			end

			local var_157_7 = 0.6

			if arg_154_1.time_ >= var_157_6 + var_157_7 and arg_154_1.time_ < var_157_6 + var_157_7 + arg_157_0 then
				arg_154_1.allBtn_.enabled = true
			end

			local var_157_8 = 0
			local var_157_9 = 0.225

			if var_157_8 < arg_154_1.time_ and arg_154_1.time_ <= var_157_8 + arg_157_0 then
				arg_154_1.talkMaxDuration = 0
				arg_154_1.dialogCg_.alpha = 1

				arg_154_1.dialog_:SetActive(true)
				SetActive(arg_154_1.leftNameGo_, true)

				local var_157_10 = arg_154_1:FormatText(StoryNameCfg[7].name)

				arg_154_1.leftNameTxt_.text = var_157_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_154_1.leftNameTxt_.transform)

				arg_154_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_154_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_154_1:RecordName(arg_154_1.leftNameTxt_.text)
				SetActive(arg_154_1.iconTrs_.gameObject, false)
				arg_154_1.callingController_:SetSelectedState("normal")

				local var_157_11 = arg_154_1:GetWordFromCfg(910601037)
				local var_157_12 = arg_154_1:FormatText(var_157_11.content)

				arg_154_1.text_.text = var_157_12

				LuaForUtil.ClearLinePrefixSymbol(arg_154_1.text_)

				local var_157_13 = 9
				local var_157_14 = utf8.len(var_157_12)
				local var_157_15 = var_157_13 <= 0 and var_157_9 or var_157_9 * (var_157_14 / var_157_13)

				if var_157_15 > 0 and var_157_9 < var_157_15 then
					arg_154_1.talkMaxDuration = var_157_15

					if var_157_15 + var_157_8 > arg_154_1.duration_ then
						arg_154_1.duration_ = var_157_15 + var_157_8
					end
				end

				arg_154_1.text_.text = var_157_12
				arg_154_1.typewritter.percent = 0

				arg_154_1.typewritter:SetDirty()
				arg_154_1:ShowNextGo(false)
				arg_154_1:RecordContent(arg_154_1.text_.text)
			end

			local var_157_16 = math.max(var_157_9, arg_154_1.talkMaxDuration)

			if var_157_8 <= arg_154_1.time_ and arg_154_1.time_ < var_157_8 + var_157_16 then
				arg_154_1.typewritter.percent = (arg_154_1.time_ - var_157_8) / var_157_16

				arg_154_1.typewritter:SetDirty()
			end

			if arg_154_1.time_ >= var_157_8 + var_157_16 and arg_154_1.time_ < var_157_8 + var_157_16 + arg_157_0 then
				arg_154_1.typewritter.percent = 1

				arg_154_1.typewritter:SetDirty()
				arg_154_1:ShowNextGo(true)
			end
		end
	end,
	Play910601038 = function(arg_158_0, arg_158_1)
		arg_158_1.time_ = 0
		arg_158_1.frameCnt_ = 0
		arg_158_1.state_ = "playing"
		arg_158_1.curTalkId_ = 910601038
		arg_158_1.duration_ = 4.83

		SetActive(arg_158_1.tipsGo_, false)

		function arg_158_1.onSingleLineFinish_()
			arg_158_1.onSingleLineUpdate_ = nil
			arg_158_1.onSingleLineFinish_ = nil
			arg_158_1.state_ = "waiting"
		end

		function arg_158_1.playNext_(arg_160_0)
			if arg_160_0 == 1 then
				arg_158_0:Play910601039(arg_158_1)
			end
		end

		function arg_158_1.onSingleLineUpdate_(arg_161_0)
			local var_161_0 = arg_158_1.actors_["1011ui_story"].transform
			local var_161_1 = 0

			if var_161_1 < arg_158_1.time_ and arg_158_1.time_ <= var_161_1 + arg_161_0 then
				arg_158_1.var_.moveOldPos1011ui_story = var_161_0.localPosition

				local var_161_2 = "1011ui_story"

				arg_158_1:ShowWeapon(arg_158_1.var_[var_161_2 .. "Animator"].transform, false)
			end

			local var_161_3 = 0.001

			if var_161_1 <= arg_158_1.time_ and arg_158_1.time_ < var_161_1 + var_161_3 then
				local var_161_4 = (arg_158_1.time_ - var_161_1) / var_161_3
				local var_161_5 = Vector3.New(0, -0.71, -6)

				var_161_0.localPosition = Vector3.Lerp(arg_158_1.var_.moveOldPos1011ui_story, var_161_5, var_161_4)

				local var_161_6 = manager.ui.mainCamera.transform.position - var_161_0.position

				var_161_0.forward = Vector3.New(var_161_6.x, var_161_6.y, var_161_6.z)

				local var_161_7 = var_161_0.localEulerAngles

				var_161_7.z = 0
				var_161_7.x = 0
				var_161_0.localEulerAngles = var_161_7
			end

			if arg_158_1.time_ >= var_161_1 + var_161_3 and arg_158_1.time_ < var_161_1 + var_161_3 + arg_161_0 then
				var_161_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_161_8 = manager.ui.mainCamera.transform.position - var_161_0.position

				var_161_0.forward = Vector3.New(var_161_8.x, var_161_8.y, var_161_8.z)

				local var_161_9 = var_161_0.localEulerAngles

				var_161_9.z = 0
				var_161_9.x = 0
				var_161_0.localEulerAngles = var_161_9
			end

			local var_161_10 = arg_158_1.actors_["1011ui_story"]
			local var_161_11 = 0

			if var_161_11 < arg_158_1.time_ and arg_158_1.time_ <= var_161_11 + arg_161_0 and arg_158_1.var_.characterEffect1011ui_story == nil then
				arg_158_1.var_.characterEffect1011ui_story = var_161_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_161_12 = 0.200000002980232

			if var_161_11 <= arg_158_1.time_ and arg_158_1.time_ < var_161_11 + var_161_12 then
				local var_161_13 = (arg_158_1.time_ - var_161_11) / var_161_12

				if arg_158_1.var_.characterEffect1011ui_story then
					arg_158_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_158_1.time_ >= var_161_11 + var_161_12 and arg_158_1.time_ < var_161_11 + var_161_12 + arg_161_0 and arg_158_1.var_.characterEffect1011ui_story then
				arg_158_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_161_14 = 0

			if var_161_14 < arg_158_1.time_ and arg_158_1.time_ <= var_161_14 + arg_161_0 then
				arg_158_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_161_15 = 0

			if var_161_15 < arg_158_1.time_ and arg_158_1.time_ <= var_161_15 + arg_161_0 then
				arg_158_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_161_16 = 0
			local var_161_17 = 0.6

			if var_161_16 < arg_158_1.time_ and arg_158_1.time_ <= var_161_16 + arg_161_0 then
				arg_158_1.talkMaxDuration = 0
				arg_158_1.dialogCg_.alpha = 1

				arg_158_1.dialog_:SetActive(true)
				SetActive(arg_158_1.leftNameGo_, true)

				local var_161_18 = arg_158_1:FormatText(StoryNameCfg[37].name)

				arg_158_1.leftNameTxt_.text = var_161_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_158_1.leftNameTxt_.transform)

				arg_158_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_158_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_158_1:RecordName(arg_158_1.leftNameTxt_.text)
				SetActive(arg_158_1.iconTrs_.gameObject, false)
				arg_158_1.callingController_:SetSelectedState("normal")

				local var_161_19 = arg_158_1:GetWordFromCfg(910601038)
				local var_161_20 = arg_158_1:FormatText(var_161_19.content)

				arg_158_1.text_.text = var_161_20

				LuaForUtil.ClearLinePrefixSymbol(arg_158_1.text_)

				local var_161_21 = 24
				local var_161_22 = utf8.len(var_161_20)
				local var_161_23 = var_161_21 <= 0 and var_161_17 or var_161_17 * (var_161_22 / var_161_21)

				if var_161_23 > 0 and var_161_17 < var_161_23 then
					arg_158_1.talkMaxDuration = var_161_23

					if var_161_23 + var_161_16 > arg_158_1.duration_ then
						arg_158_1.duration_ = var_161_23 + var_161_16
					end
				end

				arg_158_1.text_.text = var_161_20
				arg_158_1.typewritter.percent = 0

				arg_158_1.typewritter:SetDirty()
				arg_158_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601038", "story_v_out_910601.awb") ~= 0 then
					local var_161_24 = manager.audio:GetVoiceLength("story_v_out_910601", "910601038", "story_v_out_910601.awb") / 1000

					if var_161_24 + var_161_16 > arg_158_1.duration_ then
						arg_158_1.duration_ = var_161_24 + var_161_16
					end

					if var_161_19.prefab_name ~= "" and arg_158_1.actors_[var_161_19.prefab_name] ~= nil then
						local var_161_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_158_1.actors_[var_161_19.prefab_name].transform, "story_v_out_910601", "910601038", "story_v_out_910601.awb")

						arg_158_1:RecordAudio("910601038", var_161_25)
						arg_158_1:RecordAudio("910601038", var_161_25)
					else
						arg_158_1:AudioAction("play", "voice", "story_v_out_910601", "910601038", "story_v_out_910601.awb")
					end

					arg_158_1:RecordHistoryTalkVoice("story_v_out_910601", "910601038", "story_v_out_910601.awb")
				end

				arg_158_1:RecordContent(arg_158_1.text_.text)
			end

			local var_161_26 = math.max(var_161_17, arg_158_1.talkMaxDuration)

			if var_161_16 <= arg_158_1.time_ and arg_158_1.time_ < var_161_16 + var_161_26 then
				arg_158_1.typewritter.percent = (arg_158_1.time_ - var_161_16) / var_161_26

				arg_158_1.typewritter:SetDirty()
			end

			if arg_158_1.time_ >= var_161_16 + var_161_26 and arg_158_1.time_ < var_161_16 + var_161_26 + arg_161_0 then
				arg_158_1.typewritter.percent = 1

				arg_158_1.typewritter:SetDirty()
				arg_158_1:ShowNextGo(true)
			end
		end
	end,
	Play910601039 = function(arg_162_0, arg_162_1)
		arg_162_1.time_ = 0
		arg_162_1.frameCnt_ = 0
		arg_162_1.state_ = "playing"
		arg_162_1.curTalkId_ = 910601039
		arg_162_1.duration_ = 5

		SetActive(arg_162_1.tipsGo_, false)

		function arg_162_1.onSingleLineFinish_()
			arg_162_1.onSingleLineUpdate_ = nil
			arg_162_1.onSingleLineFinish_ = nil
			arg_162_1.state_ = "waiting"
		end

		function arg_162_1.playNext_(arg_164_0)
			if arg_164_0 == 1 then
				arg_162_0:Play910601040(arg_162_1)
			end
		end

		function arg_162_1.onSingleLineUpdate_(arg_165_0)
			local var_165_0 = arg_162_1.actors_["1011ui_story"]
			local var_165_1 = 0

			if var_165_1 < arg_162_1.time_ and arg_162_1.time_ <= var_165_1 + arg_165_0 and arg_162_1.var_.characterEffect1011ui_story == nil then
				arg_162_1.var_.characterEffect1011ui_story = var_165_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_165_2 = 0.200000002980232

			if var_165_1 <= arg_162_1.time_ and arg_162_1.time_ < var_165_1 + var_165_2 then
				local var_165_3 = (arg_162_1.time_ - var_165_1) / var_165_2

				if arg_162_1.var_.characterEffect1011ui_story then
					local var_165_4 = Mathf.Lerp(0, 0.5, var_165_3)

					arg_162_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_162_1.var_.characterEffect1011ui_story.fillRatio = var_165_4
				end
			end

			if arg_162_1.time_ >= var_165_1 + var_165_2 and arg_162_1.time_ < var_165_1 + var_165_2 + arg_165_0 and arg_162_1.var_.characterEffect1011ui_story then
				local var_165_5 = 0.5

				arg_162_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_162_1.var_.characterEffect1011ui_story.fillRatio = var_165_5
			end

			local var_165_6 = 0
			local var_165_7 = 0.4

			if var_165_6 < arg_162_1.time_ and arg_162_1.time_ <= var_165_6 + arg_165_0 then
				arg_162_1.talkMaxDuration = 0
				arg_162_1.dialogCg_.alpha = 1

				arg_162_1.dialog_:SetActive(true)
				SetActive(arg_162_1.leftNameGo_, true)

				local var_165_8 = arg_162_1:FormatText(StoryNameCfg[7].name)

				arg_162_1.leftNameTxt_.text = var_165_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_162_1.leftNameTxt_.transform)

				arg_162_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_162_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_162_1:RecordName(arg_162_1.leftNameTxt_.text)
				SetActive(arg_162_1.iconTrs_.gameObject, false)
				arg_162_1.callingController_:SetSelectedState("normal")

				local var_165_9 = arg_162_1:GetWordFromCfg(910601039)
				local var_165_10 = arg_162_1:FormatText(var_165_9.content)

				arg_162_1.text_.text = var_165_10

				LuaForUtil.ClearLinePrefixSymbol(arg_162_1.text_)

				local var_165_11 = 16
				local var_165_12 = utf8.len(var_165_10)
				local var_165_13 = var_165_11 <= 0 and var_165_7 or var_165_7 * (var_165_12 / var_165_11)

				if var_165_13 > 0 and var_165_7 < var_165_13 then
					arg_162_1.talkMaxDuration = var_165_13

					if var_165_13 + var_165_6 > arg_162_1.duration_ then
						arg_162_1.duration_ = var_165_13 + var_165_6
					end
				end

				arg_162_1.text_.text = var_165_10
				arg_162_1.typewritter.percent = 0

				arg_162_1.typewritter:SetDirty()
				arg_162_1:ShowNextGo(false)
				arg_162_1:RecordContent(arg_162_1.text_.text)
			end

			local var_165_14 = math.max(var_165_7, arg_162_1.talkMaxDuration)

			if var_165_6 <= arg_162_1.time_ and arg_162_1.time_ < var_165_6 + var_165_14 then
				arg_162_1.typewritter.percent = (arg_162_1.time_ - var_165_6) / var_165_14

				arg_162_1.typewritter:SetDirty()
			end

			if arg_162_1.time_ >= var_165_6 + var_165_14 and arg_162_1.time_ < var_165_6 + var_165_14 + arg_165_0 then
				arg_162_1.typewritter.percent = 1

				arg_162_1.typewritter:SetDirty()
				arg_162_1:ShowNextGo(true)
			end
		end
	end,
	Play910601040 = function(arg_166_0, arg_166_1)
		arg_166_1.time_ = 0
		arg_166_1.frameCnt_ = 0
		arg_166_1.state_ = "playing"
		arg_166_1.curTalkId_ = 910601040
		arg_166_1.duration_ = 5

		SetActive(arg_166_1.tipsGo_, false)

		function arg_166_1.onSingleLineFinish_()
			arg_166_1.onSingleLineUpdate_ = nil
			arg_166_1.onSingleLineFinish_ = nil
			arg_166_1.state_ = "waiting"
		end

		function arg_166_1.playNext_(arg_168_0)
			if arg_168_0 == 1 then
				arg_166_0:Play910601041(arg_166_1)
			end
		end

		function arg_166_1.onSingleLineUpdate_(arg_169_0)
			local var_169_0 = 0
			local var_169_1 = 0.675

			if var_169_0 < arg_166_1.time_ and arg_166_1.time_ <= var_169_0 + arg_169_0 then
				arg_166_1.talkMaxDuration = 0
				arg_166_1.dialogCg_.alpha = 1

				arg_166_1.dialog_:SetActive(true)
				SetActive(arg_166_1.leftNameGo_, true)

				local var_169_2 = arg_166_1:FormatText(StoryNameCfg[7].name)

				arg_166_1.leftNameTxt_.text = var_169_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_166_1.leftNameTxt_.transform)

				arg_166_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_166_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_166_1:RecordName(arg_166_1.leftNameTxt_.text)
				SetActive(arg_166_1.iconTrs_.gameObject, false)
				arg_166_1.callingController_:SetSelectedState("normal")

				local var_169_3 = arg_166_1:GetWordFromCfg(910601040)
				local var_169_4 = arg_166_1:FormatText(var_169_3.content)

				arg_166_1.text_.text = var_169_4

				LuaForUtil.ClearLinePrefixSymbol(arg_166_1.text_)

				local var_169_5 = 27
				local var_169_6 = utf8.len(var_169_4)
				local var_169_7 = var_169_5 <= 0 and var_169_1 or var_169_1 * (var_169_6 / var_169_5)

				if var_169_7 > 0 and var_169_1 < var_169_7 then
					arg_166_1.talkMaxDuration = var_169_7

					if var_169_7 + var_169_0 > arg_166_1.duration_ then
						arg_166_1.duration_ = var_169_7 + var_169_0
					end
				end

				arg_166_1.text_.text = var_169_4
				arg_166_1.typewritter.percent = 0

				arg_166_1.typewritter:SetDirty()
				arg_166_1:ShowNextGo(false)
				arg_166_1:RecordContent(arg_166_1.text_.text)
			end

			local var_169_8 = math.max(var_169_1, arg_166_1.talkMaxDuration)

			if var_169_0 <= arg_166_1.time_ and arg_166_1.time_ < var_169_0 + var_169_8 then
				arg_166_1.typewritter.percent = (arg_166_1.time_ - var_169_0) / var_169_8

				arg_166_1.typewritter:SetDirty()
			end

			if arg_166_1.time_ >= var_169_0 + var_169_8 and arg_166_1.time_ < var_169_0 + var_169_8 + arg_169_0 then
				arg_166_1.typewritter.percent = 1

				arg_166_1.typewritter:SetDirty()
				arg_166_1:ShowNextGo(true)
			end
		end
	end,
	Play910601041 = function(arg_170_0, arg_170_1)
		arg_170_1.time_ = 0
		arg_170_1.frameCnt_ = 0
		arg_170_1.state_ = "playing"
		arg_170_1.curTalkId_ = 910601041
		arg_170_1.duration_ = 2

		SetActive(arg_170_1.tipsGo_, false)

		function arg_170_1.onSingleLineFinish_()
			arg_170_1.onSingleLineUpdate_ = nil
			arg_170_1.onSingleLineFinish_ = nil
			arg_170_1.state_ = "waiting"
		end

		function arg_170_1.playNext_(arg_172_0)
			if arg_172_0 == 1 then
				arg_170_0:Play910601042(arg_170_1)
			end
		end

		function arg_170_1.onSingleLineUpdate_(arg_173_0)
			local var_173_0 = arg_170_1.actors_["1011ui_story"].transform
			local var_173_1 = 0

			if var_173_1 < arg_170_1.time_ and arg_170_1.time_ <= var_173_1 + arg_173_0 then
				arg_170_1.var_.moveOldPos1011ui_story = var_173_0.localPosition

				local var_173_2 = "1011ui_story"

				arg_170_1:ShowWeapon(arg_170_1.var_[var_173_2 .. "Animator"].transform, false)
			end

			local var_173_3 = 0.1

			if var_173_1 <= arg_170_1.time_ and arg_170_1.time_ < var_173_1 + var_173_3 then
				local var_173_4 = (arg_170_1.time_ - var_173_1) / var_173_3
				local var_173_5 = Vector3.New(0.7, -0.71, -6)

				var_173_0.localPosition = Vector3.Lerp(arg_170_1.var_.moveOldPos1011ui_story, var_173_5, var_173_4)

				local var_173_6 = manager.ui.mainCamera.transform.position - var_173_0.position

				var_173_0.forward = Vector3.New(var_173_6.x, var_173_6.y, var_173_6.z)

				local var_173_7 = var_173_0.localEulerAngles

				var_173_7.z = 0
				var_173_7.x = 0
				var_173_0.localEulerAngles = var_173_7
			end

			if arg_170_1.time_ >= var_173_1 + var_173_3 and arg_170_1.time_ < var_173_1 + var_173_3 + arg_173_0 then
				var_173_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_173_8 = manager.ui.mainCamera.transform.position - var_173_0.position

				var_173_0.forward = Vector3.New(var_173_8.x, var_173_8.y, var_173_8.z)

				local var_173_9 = var_173_0.localEulerAngles

				var_173_9.z = 0
				var_173_9.x = 0
				var_173_0.localEulerAngles = var_173_9
			end

			local var_173_10 = 0

			if var_173_10 < arg_170_1.time_ and arg_170_1.time_ <= var_173_10 + arg_173_0 then
				arg_170_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_173_11 = 0

			if var_173_11 < arg_170_1.time_ and arg_170_1.time_ <= var_173_11 + arg_173_0 then
				arg_170_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_173_12 = arg_170_1.actors_["1084ui_story"].transform
			local var_173_13 = 0

			if var_173_13 < arg_170_1.time_ and arg_170_1.time_ <= var_173_13 + arg_173_0 then
				arg_170_1.var_.moveOldPos1084ui_story = var_173_12.localPosition
			end

			local var_173_14 = 0.001

			if var_173_13 <= arg_170_1.time_ and arg_170_1.time_ < var_173_13 + var_173_14 then
				local var_173_15 = (arg_170_1.time_ - var_173_13) / var_173_14
				local var_173_16 = Vector3.New(-0.7, -0.97, -6)

				var_173_12.localPosition = Vector3.Lerp(arg_170_1.var_.moveOldPos1084ui_story, var_173_16, var_173_15)

				local var_173_17 = manager.ui.mainCamera.transform.position - var_173_12.position

				var_173_12.forward = Vector3.New(var_173_17.x, var_173_17.y, var_173_17.z)

				local var_173_18 = var_173_12.localEulerAngles

				var_173_18.z = 0
				var_173_18.x = 0
				var_173_12.localEulerAngles = var_173_18
			end

			if arg_170_1.time_ >= var_173_13 + var_173_14 and arg_170_1.time_ < var_173_13 + var_173_14 + arg_173_0 then
				var_173_12.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_173_19 = manager.ui.mainCamera.transform.position - var_173_12.position

				var_173_12.forward = Vector3.New(var_173_19.x, var_173_19.y, var_173_19.z)

				local var_173_20 = var_173_12.localEulerAngles

				var_173_20.z = 0
				var_173_20.x = 0
				var_173_12.localEulerAngles = var_173_20
			end

			local var_173_21 = arg_170_1.actors_["1084ui_story"]
			local var_173_22 = 0

			if var_173_22 < arg_170_1.time_ and arg_170_1.time_ <= var_173_22 + arg_173_0 and arg_170_1.var_.characterEffect1084ui_story == nil then
				arg_170_1.var_.characterEffect1084ui_story = var_173_21:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_173_23 = 0.200000002980232

			if var_173_22 <= arg_170_1.time_ and arg_170_1.time_ < var_173_22 + var_173_23 then
				local var_173_24 = (arg_170_1.time_ - var_173_22) / var_173_23

				if arg_170_1.var_.characterEffect1084ui_story then
					local var_173_25 = Mathf.Lerp(0, 0.5, var_173_24)

					arg_170_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_170_1.var_.characterEffect1084ui_story.fillRatio = var_173_25
				end
			end

			if arg_170_1.time_ >= var_173_22 + var_173_23 and arg_170_1.time_ < var_173_22 + var_173_23 + arg_173_0 and arg_170_1.var_.characterEffect1084ui_story then
				local var_173_26 = 0.5

				arg_170_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_170_1.var_.characterEffect1084ui_story.fillRatio = var_173_26
			end

			local var_173_27 = 0

			if var_173_27 < arg_170_1.time_ and arg_170_1.time_ <= var_173_27 + arg_173_0 then
				arg_170_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action446")
			end

			local var_173_28 = 0

			if var_173_28 < arg_170_1.time_ and arg_170_1.time_ <= var_173_28 + arg_173_0 then
				arg_170_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_173_29 = 0
			local var_173_30 = 0.05

			if var_173_29 < arg_170_1.time_ and arg_170_1.time_ <= var_173_29 + arg_173_0 then
				arg_170_1.talkMaxDuration = 0
				arg_170_1.dialogCg_.alpha = 1

				arg_170_1.dialog_:SetActive(true)
				SetActive(arg_170_1.leftNameGo_, true)

				local var_173_31 = arg_170_1:FormatText(StoryNameCfg[661].name)

				arg_170_1.leftNameTxt_.text = var_173_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_170_1.leftNameTxt_.transform)

				arg_170_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_170_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_170_1:RecordName(arg_170_1.leftNameTxt_.text)
				SetActive(arg_170_1.iconTrs_.gameObject, false)
				arg_170_1.callingController_:SetSelectedState("normal")

				local var_173_32 = arg_170_1:GetWordFromCfg(910601041)
				local var_173_33 = arg_170_1:FormatText(var_173_32.content)

				arg_170_1.text_.text = var_173_33

				LuaForUtil.ClearLinePrefixSymbol(arg_170_1.text_)

				local var_173_34 = 2
				local var_173_35 = utf8.len(var_173_33)
				local var_173_36 = var_173_34 <= 0 and var_173_30 or var_173_30 * (var_173_35 / var_173_34)

				if var_173_36 > 0 and var_173_30 < var_173_36 then
					arg_170_1.talkMaxDuration = var_173_36

					if var_173_36 + var_173_29 > arg_170_1.duration_ then
						arg_170_1.duration_ = var_173_36 + var_173_29
					end
				end

				arg_170_1.text_.text = var_173_33
				arg_170_1.typewritter.percent = 0

				arg_170_1.typewritter:SetDirty()
				arg_170_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601041", "story_v_out_910601.awb") ~= 0 then
					local var_173_37 = manager.audio:GetVoiceLength("story_v_out_910601", "910601041", "story_v_out_910601.awb") / 1000

					if var_173_37 + var_173_29 > arg_170_1.duration_ then
						arg_170_1.duration_ = var_173_37 + var_173_29
					end

					if var_173_32.prefab_name ~= "" and arg_170_1.actors_[var_173_32.prefab_name] ~= nil then
						local var_173_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_170_1.actors_[var_173_32.prefab_name].transform, "story_v_out_910601", "910601041", "story_v_out_910601.awb")

						arg_170_1:RecordAudio("910601041", var_173_38)
						arg_170_1:RecordAudio("910601041", var_173_38)
					else
						arg_170_1:AudioAction("play", "voice", "story_v_out_910601", "910601041", "story_v_out_910601.awb")
					end

					arg_170_1:RecordHistoryTalkVoice("story_v_out_910601", "910601041", "story_v_out_910601.awb")
				end

				arg_170_1:RecordContent(arg_170_1.text_.text)
			end

			local var_173_39 = math.max(var_173_30, arg_170_1.talkMaxDuration)

			if var_173_29 <= arg_170_1.time_ and arg_170_1.time_ < var_173_29 + var_173_39 then
				arg_170_1.typewritter.percent = (arg_170_1.time_ - var_173_29) / var_173_39

				arg_170_1.typewritter:SetDirty()
			end

			if arg_170_1.time_ >= var_173_29 + var_173_39 and arg_170_1.time_ < var_173_29 + var_173_39 + arg_173_0 then
				arg_170_1.typewritter.percent = 1

				arg_170_1.typewritter:SetDirty()
				arg_170_1:ShowNextGo(true)
			end
		end
	end,
	Play910601042 = function(arg_174_0, arg_174_1)
		arg_174_1.time_ = 0
		arg_174_1.frameCnt_ = 0
		arg_174_1.state_ = "playing"
		arg_174_1.curTalkId_ = 910601042
		arg_174_1.duration_ = 5

		SetActive(arg_174_1.tipsGo_, false)

		function arg_174_1.onSingleLineFinish_()
			arg_174_1.onSingleLineUpdate_ = nil
			arg_174_1.onSingleLineFinish_ = nil
			arg_174_1.state_ = "waiting"
		end

		function arg_174_1.playNext_(arg_176_0)
			if arg_176_0 == 1 then
				arg_174_0:Play910601043(arg_174_1)
			end
		end

		function arg_174_1.onSingleLineUpdate_(arg_177_0)
			local var_177_0 = 0
			local var_177_1 = 0.45

			if var_177_0 < arg_174_1.time_ and arg_174_1.time_ <= var_177_0 + arg_177_0 then
				arg_174_1.talkMaxDuration = 0
				arg_174_1.dialogCg_.alpha = 1

				arg_174_1.dialog_:SetActive(true)
				SetActive(arg_174_1.leftNameGo_, true)

				local var_177_2 = arg_174_1:FormatText(StoryNameCfg[7].name)

				arg_174_1.leftNameTxt_.text = var_177_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_174_1.leftNameTxt_.transform)

				arg_174_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_174_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_174_1:RecordName(arg_174_1.leftNameTxt_.text)
				SetActive(arg_174_1.iconTrs_.gameObject, false)
				arg_174_1.callingController_:SetSelectedState("normal")

				local var_177_3 = arg_174_1:GetWordFromCfg(910601042)
				local var_177_4 = arg_174_1:FormatText(var_177_3.content)

				arg_174_1.text_.text = var_177_4

				LuaForUtil.ClearLinePrefixSymbol(arg_174_1.text_)

				local var_177_5 = 18
				local var_177_6 = utf8.len(var_177_4)
				local var_177_7 = var_177_5 <= 0 and var_177_1 or var_177_1 * (var_177_6 / var_177_5)

				if var_177_7 > 0 and var_177_1 < var_177_7 then
					arg_174_1.talkMaxDuration = var_177_7

					if var_177_7 + var_177_0 > arg_174_1.duration_ then
						arg_174_1.duration_ = var_177_7 + var_177_0
					end
				end

				arg_174_1.text_.text = var_177_4
				arg_174_1.typewritter.percent = 0

				arg_174_1.typewritter:SetDirty()
				arg_174_1:ShowNextGo(false)
				arg_174_1:RecordContent(arg_174_1.text_.text)
			end

			local var_177_8 = math.max(var_177_1, arg_174_1.talkMaxDuration)

			if var_177_0 <= arg_174_1.time_ and arg_174_1.time_ < var_177_0 + var_177_8 then
				arg_174_1.typewritter.percent = (arg_174_1.time_ - var_177_0) / var_177_8

				arg_174_1.typewritter:SetDirty()
			end

			if arg_174_1.time_ >= var_177_0 + var_177_8 and arg_174_1.time_ < var_177_0 + var_177_8 + arg_177_0 then
				arg_174_1.typewritter.percent = 1

				arg_174_1.typewritter:SetDirty()
				arg_174_1:ShowNextGo(true)
			end
		end
	end,
	Play910601043 = function(arg_178_0, arg_178_1)
		arg_178_1.time_ = 0
		arg_178_1.frameCnt_ = 0
		arg_178_1.state_ = "playing"
		arg_178_1.curTalkId_ = 910601043
		arg_178_1.duration_ = 5.47

		SetActive(arg_178_1.tipsGo_, false)

		function arg_178_1.onSingleLineFinish_()
			arg_178_1.onSingleLineUpdate_ = nil
			arg_178_1.onSingleLineFinish_ = nil
			arg_178_1.state_ = "waiting"
		end

		function arg_178_1.playNext_(arg_180_0)
			if arg_180_0 == 1 then
				arg_178_0:Play910601044(arg_178_1)
			end
		end

		function arg_178_1.onSingleLineUpdate_(arg_181_0)
			local var_181_0 = arg_178_1.actors_["1084ui_story"].transform
			local var_181_1 = 0

			if var_181_1 < arg_178_1.time_ and arg_178_1.time_ <= var_181_1 + arg_181_0 then
				arg_178_1.var_.moveOldPos1084ui_story = var_181_0.localPosition
			end

			local var_181_2 = 0.001

			if var_181_1 <= arg_178_1.time_ and arg_178_1.time_ < var_181_1 + var_181_2 then
				local var_181_3 = (arg_178_1.time_ - var_181_1) / var_181_2
				local var_181_4 = Vector3.New(-0.7, -0.97, -6)

				var_181_0.localPosition = Vector3.Lerp(arg_178_1.var_.moveOldPos1084ui_story, var_181_4, var_181_3)

				local var_181_5 = manager.ui.mainCamera.transform.position - var_181_0.position

				var_181_0.forward = Vector3.New(var_181_5.x, var_181_5.y, var_181_5.z)

				local var_181_6 = var_181_0.localEulerAngles

				var_181_6.z = 0
				var_181_6.x = 0
				var_181_0.localEulerAngles = var_181_6
			end

			if arg_178_1.time_ >= var_181_1 + var_181_2 and arg_178_1.time_ < var_181_1 + var_181_2 + arg_181_0 then
				var_181_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_181_7 = manager.ui.mainCamera.transform.position - var_181_0.position

				var_181_0.forward = Vector3.New(var_181_7.x, var_181_7.y, var_181_7.z)

				local var_181_8 = var_181_0.localEulerAngles

				var_181_8.z = 0
				var_181_8.x = 0
				var_181_0.localEulerAngles = var_181_8
			end

			local var_181_9 = arg_178_1.actors_["1084ui_story"]
			local var_181_10 = 0

			if var_181_10 < arg_178_1.time_ and arg_178_1.time_ <= var_181_10 + arg_181_0 and arg_178_1.var_.characterEffect1084ui_story == nil then
				arg_178_1.var_.characterEffect1084ui_story = var_181_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_181_11 = 0.200000002980232

			if var_181_10 <= arg_178_1.time_ and arg_178_1.time_ < var_181_10 + var_181_11 then
				local var_181_12 = (arg_178_1.time_ - var_181_10) / var_181_11

				if arg_178_1.var_.characterEffect1084ui_story then
					arg_178_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_178_1.time_ >= var_181_10 + var_181_11 and arg_178_1.time_ < var_181_10 + var_181_11 + arg_181_0 and arg_178_1.var_.characterEffect1084ui_story then
				arg_178_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_181_13 = 0

			if var_181_13 < arg_178_1.time_ and arg_178_1.time_ <= var_181_13 + arg_181_0 then
				arg_178_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action474")
			end

			local var_181_14 = 0

			if var_181_14 < arg_178_1.time_ and arg_178_1.time_ <= var_181_14 + arg_181_0 then
				arg_178_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_181_15 = 0
			local var_181_16 = 0.55

			if var_181_15 < arg_178_1.time_ and arg_178_1.time_ <= var_181_15 + arg_181_0 then
				arg_178_1.talkMaxDuration = 0
				arg_178_1.dialogCg_.alpha = 1

				arg_178_1.dialog_:SetActive(true)
				SetActive(arg_178_1.leftNameGo_, true)

				local var_181_17 = arg_178_1:FormatText(StoryNameCfg[6].name)

				arg_178_1.leftNameTxt_.text = var_181_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_178_1.leftNameTxt_.transform)

				arg_178_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_178_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_178_1:RecordName(arg_178_1.leftNameTxt_.text)
				SetActive(arg_178_1.iconTrs_.gameObject, false)
				arg_178_1.callingController_:SetSelectedState("normal")

				local var_181_18 = arg_178_1:GetWordFromCfg(910601043)
				local var_181_19 = arg_178_1:FormatText(var_181_18.content)

				arg_178_1.text_.text = var_181_19

				LuaForUtil.ClearLinePrefixSymbol(arg_178_1.text_)

				local var_181_20 = 22
				local var_181_21 = utf8.len(var_181_19)
				local var_181_22 = var_181_20 <= 0 and var_181_16 or var_181_16 * (var_181_21 / var_181_20)

				if var_181_22 > 0 and var_181_16 < var_181_22 then
					arg_178_1.talkMaxDuration = var_181_22

					if var_181_22 + var_181_15 > arg_178_1.duration_ then
						arg_178_1.duration_ = var_181_22 + var_181_15
					end
				end

				arg_178_1.text_.text = var_181_19
				arg_178_1.typewritter.percent = 0

				arg_178_1.typewritter:SetDirty()
				arg_178_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601043", "story_v_out_910601.awb") ~= 0 then
					local var_181_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601043", "story_v_out_910601.awb") / 1000

					if var_181_23 + var_181_15 > arg_178_1.duration_ then
						arg_178_1.duration_ = var_181_23 + var_181_15
					end

					if var_181_18.prefab_name ~= "" and arg_178_1.actors_[var_181_18.prefab_name] ~= nil then
						local var_181_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_178_1.actors_[var_181_18.prefab_name].transform, "story_v_out_910601", "910601043", "story_v_out_910601.awb")

						arg_178_1:RecordAudio("910601043", var_181_24)
						arg_178_1:RecordAudio("910601043", var_181_24)
					else
						arg_178_1:AudioAction("play", "voice", "story_v_out_910601", "910601043", "story_v_out_910601.awb")
					end

					arg_178_1:RecordHistoryTalkVoice("story_v_out_910601", "910601043", "story_v_out_910601.awb")
				end

				arg_178_1:RecordContent(arg_178_1.text_.text)
			end

			local var_181_25 = math.max(var_181_16, arg_178_1.talkMaxDuration)

			if var_181_15 <= arg_178_1.time_ and arg_178_1.time_ < var_181_15 + var_181_25 then
				arg_178_1.typewritter.percent = (arg_178_1.time_ - var_181_15) / var_181_25

				arg_178_1.typewritter:SetDirty()
			end

			if arg_178_1.time_ >= var_181_15 + var_181_25 and arg_178_1.time_ < var_181_15 + var_181_25 + arg_181_0 then
				arg_178_1.typewritter.percent = 1

				arg_178_1.typewritter:SetDirty()
				arg_178_1:ShowNextGo(true)
			end
		end
	end,
	Play910601044 = function(arg_182_0, arg_182_1)
		arg_182_1.time_ = 0
		arg_182_1.frameCnt_ = 0
		arg_182_1.state_ = "playing"
		arg_182_1.curTalkId_ = 910601044
		arg_182_1.duration_ = 2.6

		SetActive(arg_182_1.tipsGo_, false)

		function arg_182_1.onSingleLineFinish_()
			arg_182_1.onSingleLineUpdate_ = nil
			arg_182_1.onSingleLineFinish_ = nil
			arg_182_1.state_ = "waiting"
		end

		function arg_182_1.playNext_(arg_184_0)
			if arg_184_0 == 1 then
				arg_182_0:Play910601045(arg_182_1)
			end
		end

		function arg_182_1.onSingleLineUpdate_(arg_185_0)
			local var_185_0 = arg_182_1.actors_["1011ui_story"].transform
			local var_185_1 = 0

			if var_185_1 < arg_182_1.time_ and arg_182_1.time_ <= var_185_1 + arg_185_0 then
				arg_182_1.var_.moveOldPos1011ui_story = var_185_0.localPosition
			end

			local var_185_2 = 0.001

			if var_185_1 <= arg_182_1.time_ and arg_182_1.time_ < var_185_1 + var_185_2 then
				local var_185_3 = (arg_182_1.time_ - var_185_1) / var_185_2
				local var_185_4 = Vector3.New(0.7, -0.71, -6)

				var_185_0.localPosition = Vector3.Lerp(arg_182_1.var_.moveOldPos1011ui_story, var_185_4, var_185_3)

				local var_185_5 = manager.ui.mainCamera.transform.position - var_185_0.position

				var_185_0.forward = Vector3.New(var_185_5.x, var_185_5.y, var_185_5.z)

				local var_185_6 = var_185_0.localEulerAngles

				var_185_6.z = 0
				var_185_6.x = 0
				var_185_0.localEulerAngles = var_185_6
			end

			if arg_182_1.time_ >= var_185_1 + var_185_2 and arg_182_1.time_ < var_185_1 + var_185_2 + arg_185_0 then
				var_185_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_185_7 = manager.ui.mainCamera.transform.position - var_185_0.position

				var_185_0.forward = Vector3.New(var_185_7.x, var_185_7.y, var_185_7.z)

				local var_185_8 = var_185_0.localEulerAngles

				var_185_8.z = 0
				var_185_8.x = 0
				var_185_0.localEulerAngles = var_185_8
			end

			local var_185_9 = arg_182_1.actors_["1011ui_story"]
			local var_185_10 = 0

			if var_185_10 < arg_182_1.time_ and arg_182_1.time_ <= var_185_10 + arg_185_0 and arg_182_1.var_.characterEffect1011ui_story == nil then
				arg_182_1.var_.characterEffect1011ui_story = var_185_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_185_11 = 0.200000002980232

			if var_185_10 <= arg_182_1.time_ and arg_182_1.time_ < var_185_10 + var_185_11 then
				local var_185_12 = (arg_182_1.time_ - var_185_10) / var_185_11

				if arg_182_1.var_.characterEffect1011ui_story then
					arg_182_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_182_1.time_ >= var_185_10 + var_185_11 and arg_182_1.time_ < var_185_10 + var_185_11 + arg_185_0 and arg_182_1.var_.characterEffect1011ui_story then
				arg_182_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_185_13 = 0

			if var_185_13 < arg_182_1.time_ and arg_182_1.time_ <= var_185_13 + arg_185_0 then
				arg_182_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action462")
			end

			local var_185_14 = 0

			if var_185_14 < arg_182_1.time_ and arg_182_1.time_ <= var_185_14 + arg_185_0 then
				arg_182_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_185_15 = arg_182_1.actors_["1084ui_story"]
			local var_185_16 = 0

			if var_185_16 < arg_182_1.time_ and arg_182_1.time_ <= var_185_16 + arg_185_0 and arg_182_1.var_.characterEffect1084ui_story == nil then
				arg_182_1.var_.characterEffect1084ui_story = var_185_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_185_17 = 0.200000002980232

			if var_185_16 <= arg_182_1.time_ and arg_182_1.time_ < var_185_16 + var_185_17 then
				local var_185_18 = (arg_182_1.time_ - var_185_16) / var_185_17

				if arg_182_1.var_.characterEffect1084ui_story then
					local var_185_19 = Mathf.Lerp(0, 0.5, var_185_18)

					arg_182_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_182_1.var_.characterEffect1084ui_story.fillRatio = var_185_19
				end
			end

			if arg_182_1.time_ >= var_185_16 + var_185_17 and arg_182_1.time_ < var_185_16 + var_185_17 + arg_185_0 and arg_182_1.var_.characterEffect1084ui_story then
				local var_185_20 = 0.5

				arg_182_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_182_1.var_.characterEffect1084ui_story.fillRatio = var_185_20
			end

			local var_185_21 = 0
			local var_185_22 = 0.325

			if var_185_21 < arg_182_1.time_ and arg_182_1.time_ <= var_185_21 + arg_185_0 then
				arg_182_1.talkMaxDuration = 0
				arg_182_1.dialogCg_.alpha = 1

				arg_182_1.dialog_:SetActive(true)
				SetActive(arg_182_1.leftNameGo_, true)

				local var_185_23 = arg_182_1:FormatText(StoryNameCfg[37].name)

				arg_182_1.leftNameTxt_.text = var_185_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_182_1.leftNameTxt_.transform)

				arg_182_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_182_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_182_1:RecordName(arg_182_1.leftNameTxt_.text)
				SetActive(arg_182_1.iconTrs_.gameObject, false)
				arg_182_1.callingController_:SetSelectedState("normal")

				local var_185_24 = arg_182_1:GetWordFromCfg(910601044)
				local var_185_25 = arg_182_1:FormatText(var_185_24.content)

				arg_182_1.text_.text = var_185_25

				LuaForUtil.ClearLinePrefixSymbol(arg_182_1.text_)

				local var_185_26 = 13
				local var_185_27 = utf8.len(var_185_25)
				local var_185_28 = var_185_26 <= 0 and var_185_22 or var_185_22 * (var_185_27 / var_185_26)

				if var_185_28 > 0 and var_185_22 < var_185_28 then
					arg_182_1.talkMaxDuration = var_185_28

					if var_185_28 + var_185_21 > arg_182_1.duration_ then
						arg_182_1.duration_ = var_185_28 + var_185_21
					end
				end

				arg_182_1.text_.text = var_185_25
				arg_182_1.typewritter.percent = 0

				arg_182_1.typewritter:SetDirty()
				arg_182_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601044", "story_v_out_910601.awb") ~= 0 then
					local var_185_29 = manager.audio:GetVoiceLength("story_v_out_910601", "910601044", "story_v_out_910601.awb") / 1000

					if var_185_29 + var_185_21 > arg_182_1.duration_ then
						arg_182_1.duration_ = var_185_29 + var_185_21
					end

					if var_185_24.prefab_name ~= "" and arg_182_1.actors_[var_185_24.prefab_name] ~= nil then
						local var_185_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_182_1.actors_[var_185_24.prefab_name].transform, "story_v_out_910601", "910601044", "story_v_out_910601.awb")

						arg_182_1:RecordAudio("910601044", var_185_30)
						arg_182_1:RecordAudio("910601044", var_185_30)
					else
						arg_182_1:AudioAction("play", "voice", "story_v_out_910601", "910601044", "story_v_out_910601.awb")
					end

					arg_182_1:RecordHistoryTalkVoice("story_v_out_910601", "910601044", "story_v_out_910601.awb")
				end

				arg_182_1:RecordContent(arg_182_1.text_.text)
			end

			local var_185_31 = math.max(var_185_22, arg_182_1.talkMaxDuration)

			if var_185_21 <= arg_182_1.time_ and arg_182_1.time_ < var_185_21 + var_185_31 then
				arg_182_1.typewritter.percent = (arg_182_1.time_ - var_185_21) / var_185_31

				arg_182_1.typewritter:SetDirty()
			end

			if arg_182_1.time_ >= var_185_21 + var_185_31 and arg_182_1.time_ < var_185_21 + var_185_31 + arg_185_0 then
				arg_182_1.typewritter.percent = 1

				arg_182_1.typewritter:SetDirty()
				arg_182_1:ShowNextGo(true)
			end
		end
	end,
	Play910601045 = function(arg_186_0, arg_186_1)
		arg_186_1.time_ = 0
		arg_186_1.frameCnt_ = 0
		arg_186_1.state_ = "playing"
		arg_186_1.curTalkId_ = 910601045
		arg_186_1.duration_ = 4.1

		SetActive(arg_186_1.tipsGo_, false)

		function arg_186_1.onSingleLineFinish_()
			arg_186_1.onSingleLineUpdate_ = nil
			arg_186_1.onSingleLineFinish_ = nil
			arg_186_1.state_ = "waiting"
		end

		function arg_186_1.playNext_(arg_188_0)
			if arg_188_0 == 1 then
				arg_186_0:Play910601046(arg_186_1)
			end
		end

		function arg_186_1.onSingleLineUpdate_(arg_189_0)
			local var_189_0 = arg_186_1.actors_["1084ui_story"].transform
			local var_189_1 = 0

			if var_189_1 < arg_186_1.time_ and arg_186_1.time_ <= var_189_1 + arg_189_0 then
				arg_186_1.var_.moveOldPos1084ui_story = var_189_0.localPosition
			end

			local var_189_2 = 0.001

			if var_189_1 <= arg_186_1.time_ and arg_186_1.time_ < var_189_1 + var_189_2 then
				local var_189_3 = (arg_186_1.time_ - var_189_1) / var_189_2
				local var_189_4 = Vector3.New(-0.7, -0.97, -6)

				var_189_0.localPosition = Vector3.Lerp(arg_186_1.var_.moveOldPos1084ui_story, var_189_4, var_189_3)

				local var_189_5 = manager.ui.mainCamera.transform.position - var_189_0.position

				var_189_0.forward = Vector3.New(var_189_5.x, var_189_5.y, var_189_5.z)

				local var_189_6 = var_189_0.localEulerAngles

				var_189_6.z = 0
				var_189_6.x = 0
				var_189_0.localEulerAngles = var_189_6
			end

			if arg_186_1.time_ >= var_189_1 + var_189_2 and arg_186_1.time_ < var_189_1 + var_189_2 + arg_189_0 then
				var_189_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_189_7 = manager.ui.mainCamera.transform.position - var_189_0.position

				var_189_0.forward = Vector3.New(var_189_7.x, var_189_7.y, var_189_7.z)

				local var_189_8 = var_189_0.localEulerAngles

				var_189_8.z = 0
				var_189_8.x = 0
				var_189_0.localEulerAngles = var_189_8
			end

			local var_189_9 = arg_186_1.actors_["1084ui_story"]
			local var_189_10 = 0

			if var_189_10 < arg_186_1.time_ and arg_186_1.time_ <= var_189_10 + arg_189_0 and arg_186_1.var_.characterEffect1084ui_story == nil then
				arg_186_1.var_.characterEffect1084ui_story = var_189_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_189_11 = 0.200000002980232

			if var_189_10 <= arg_186_1.time_ and arg_186_1.time_ < var_189_10 + var_189_11 then
				local var_189_12 = (arg_186_1.time_ - var_189_10) / var_189_11

				if arg_186_1.var_.characterEffect1084ui_story then
					arg_186_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_186_1.time_ >= var_189_10 + var_189_11 and arg_186_1.time_ < var_189_10 + var_189_11 + arg_189_0 and arg_186_1.var_.characterEffect1084ui_story then
				arg_186_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_189_13 = 0

			if var_189_13 < arg_186_1.time_ and arg_186_1.time_ <= var_189_13 + arg_189_0 then
				arg_186_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action447")
			end

			local var_189_14 = 0

			if var_189_14 < arg_186_1.time_ and arg_186_1.time_ <= var_189_14 + arg_189_0 then
				arg_186_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_189_15 = arg_186_1.actors_["1011ui_story"]
			local var_189_16 = 0

			if var_189_16 < arg_186_1.time_ and arg_186_1.time_ <= var_189_16 + arg_189_0 and arg_186_1.var_.characterEffect1011ui_story == nil then
				arg_186_1.var_.characterEffect1011ui_story = var_189_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_189_17 = 0.200000002980232

			if var_189_16 <= arg_186_1.time_ and arg_186_1.time_ < var_189_16 + var_189_17 then
				local var_189_18 = (arg_186_1.time_ - var_189_16) / var_189_17

				if arg_186_1.var_.characterEffect1011ui_story then
					local var_189_19 = Mathf.Lerp(0, 0.5, var_189_18)

					arg_186_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_186_1.var_.characterEffect1011ui_story.fillRatio = var_189_19
				end
			end

			if arg_186_1.time_ >= var_189_16 + var_189_17 and arg_186_1.time_ < var_189_16 + var_189_17 + arg_189_0 and arg_186_1.var_.characterEffect1011ui_story then
				local var_189_20 = 0.5

				arg_186_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_186_1.var_.characterEffect1011ui_story.fillRatio = var_189_20
			end

			local var_189_21 = 0
			local var_189_22 = 0.525

			if var_189_21 < arg_186_1.time_ and arg_186_1.time_ <= var_189_21 + arg_189_0 then
				arg_186_1.talkMaxDuration = 0
				arg_186_1.dialogCg_.alpha = 1

				arg_186_1.dialog_:SetActive(true)
				SetActive(arg_186_1.leftNameGo_, true)

				local var_189_23 = arg_186_1:FormatText(StoryNameCfg[6].name)

				arg_186_1.leftNameTxt_.text = var_189_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_186_1.leftNameTxt_.transform)

				arg_186_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_186_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_186_1:RecordName(arg_186_1.leftNameTxt_.text)
				SetActive(arg_186_1.iconTrs_.gameObject, false)
				arg_186_1.callingController_:SetSelectedState("normal")

				local var_189_24 = arg_186_1:GetWordFromCfg(910601045)
				local var_189_25 = arg_186_1:FormatText(var_189_24.content)

				arg_186_1.text_.text = var_189_25

				LuaForUtil.ClearLinePrefixSymbol(arg_186_1.text_)

				local var_189_26 = 21
				local var_189_27 = utf8.len(var_189_25)
				local var_189_28 = var_189_26 <= 0 and var_189_22 or var_189_22 * (var_189_27 / var_189_26)

				if var_189_28 > 0 and var_189_22 < var_189_28 then
					arg_186_1.talkMaxDuration = var_189_28

					if var_189_28 + var_189_21 > arg_186_1.duration_ then
						arg_186_1.duration_ = var_189_28 + var_189_21
					end
				end

				arg_186_1.text_.text = var_189_25
				arg_186_1.typewritter.percent = 0

				arg_186_1.typewritter:SetDirty()
				arg_186_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601045", "story_v_out_910601.awb") ~= 0 then
					local var_189_29 = manager.audio:GetVoiceLength("story_v_out_910601", "910601045", "story_v_out_910601.awb") / 1000

					if var_189_29 + var_189_21 > arg_186_1.duration_ then
						arg_186_1.duration_ = var_189_29 + var_189_21
					end

					if var_189_24.prefab_name ~= "" and arg_186_1.actors_[var_189_24.prefab_name] ~= nil then
						local var_189_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_186_1.actors_[var_189_24.prefab_name].transform, "story_v_out_910601", "910601045", "story_v_out_910601.awb")

						arg_186_1:RecordAudio("910601045", var_189_30)
						arg_186_1:RecordAudio("910601045", var_189_30)
					else
						arg_186_1:AudioAction("play", "voice", "story_v_out_910601", "910601045", "story_v_out_910601.awb")
					end

					arg_186_1:RecordHistoryTalkVoice("story_v_out_910601", "910601045", "story_v_out_910601.awb")
				end

				arg_186_1:RecordContent(arg_186_1.text_.text)
			end

			local var_189_31 = math.max(var_189_22, arg_186_1.talkMaxDuration)

			if var_189_21 <= arg_186_1.time_ and arg_186_1.time_ < var_189_21 + var_189_31 then
				arg_186_1.typewritter.percent = (arg_186_1.time_ - var_189_21) / var_189_31

				arg_186_1.typewritter:SetDirty()
			end

			if arg_186_1.time_ >= var_189_21 + var_189_31 and arg_186_1.time_ < var_189_21 + var_189_31 + arg_189_0 then
				arg_186_1.typewritter.percent = 1

				arg_186_1.typewritter:SetDirty()
				arg_186_1:ShowNextGo(true)
			end
		end
	end,
	Play910601046 = function(arg_190_0, arg_190_1)
		arg_190_1.time_ = 0
		arg_190_1.frameCnt_ = 0
		arg_190_1.state_ = "playing"
		arg_190_1.curTalkId_ = 910601046
		arg_190_1.duration_ = 5.3

		SetActive(arg_190_1.tipsGo_, false)

		function arg_190_1.onSingleLineFinish_()
			arg_190_1.onSingleLineUpdate_ = nil
			arg_190_1.onSingleLineFinish_ = nil
			arg_190_1.state_ = "waiting"
		end

		function arg_190_1.playNext_(arg_192_0)
			if arg_192_0 == 1 then
				arg_190_0:Play910601047(arg_190_1)
			end
		end

		function arg_190_1.onSingleLineUpdate_(arg_193_0)
			local var_193_0 = arg_190_1.actors_["1084ui_story"].transform
			local var_193_1 = 0

			if var_193_1 < arg_190_1.time_ and arg_190_1.time_ <= var_193_1 + arg_193_0 then
				arg_190_1.var_.moveOldPos1084ui_story = var_193_0.localPosition
			end

			local var_193_2 = 0.001

			if var_193_1 <= arg_190_1.time_ and arg_190_1.time_ < var_193_1 + var_193_2 then
				local var_193_3 = (arg_190_1.time_ - var_193_1) / var_193_2
				local var_193_4 = Vector3.New(-0.7, -0.97, -6)

				var_193_0.localPosition = Vector3.Lerp(arg_190_1.var_.moveOldPos1084ui_story, var_193_4, var_193_3)

				local var_193_5 = manager.ui.mainCamera.transform.position - var_193_0.position

				var_193_0.forward = Vector3.New(var_193_5.x, var_193_5.y, var_193_5.z)

				local var_193_6 = var_193_0.localEulerAngles

				var_193_6.z = 0
				var_193_6.x = 0
				var_193_0.localEulerAngles = var_193_6
			end

			if arg_190_1.time_ >= var_193_1 + var_193_2 and arg_190_1.time_ < var_193_1 + var_193_2 + arg_193_0 then
				var_193_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_193_7 = manager.ui.mainCamera.transform.position - var_193_0.position

				var_193_0.forward = Vector3.New(var_193_7.x, var_193_7.y, var_193_7.z)

				local var_193_8 = var_193_0.localEulerAngles

				var_193_8.z = 0
				var_193_8.x = 0
				var_193_0.localEulerAngles = var_193_8
			end

			local var_193_9 = arg_190_1.actors_["1084ui_story"]
			local var_193_10 = 0

			if var_193_10 < arg_190_1.time_ and arg_190_1.time_ <= var_193_10 + arg_193_0 and arg_190_1.var_.characterEffect1084ui_story == nil then
				arg_190_1.var_.characterEffect1084ui_story = var_193_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_193_11 = 0.200000002980232

			if var_193_10 <= arg_190_1.time_ and arg_190_1.time_ < var_193_10 + var_193_11 then
				local var_193_12 = (arg_190_1.time_ - var_193_10) / var_193_11

				if arg_190_1.var_.characterEffect1084ui_story then
					arg_190_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_190_1.time_ >= var_193_10 + var_193_11 and arg_190_1.time_ < var_193_10 + var_193_11 + arg_193_0 and arg_190_1.var_.characterEffect1084ui_story then
				arg_190_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_193_13 = 0

			if var_193_13 < arg_190_1.time_ and arg_190_1.time_ <= var_193_13 + arg_193_0 then
				arg_190_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_193_14 = 0

			if var_193_14 < arg_190_1.time_ and arg_190_1.time_ <= var_193_14 + arg_193_0 then
				arg_190_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_193_15 = 0
			local var_193_16 = 0.725

			if var_193_15 < arg_190_1.time_ and arg_190_1.time_ <= var_193_15 + arg_193_0 then
				arg_190_1.talkMaxDuration = 0
				arg_190_1.dialogCg_.alpha = 1

				arg_190_1.dialog_:SetActive(true)
				SetActive(arg_190_1.leftNameGo_, true)

				local var_193_17 = arg_190_1:FormatText(StoryNameCfg[6].name)

				arg_190_1.leftNameTxt_.text = var_193_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_190_1.leftNameTxt_.transform)

				arg_190_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_190_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_190_1:RecordName(arg_190_1.leftNameTxt_.text)
				SetActive(arg_190_1.iconTrs_.gameObject, false)
				arg_190_1.callingController_:SetSelectedState("normal")

				local var_193_18 = arg_190_1:GetWordFromCfg(910601046)
				local var_193_19 = arg_190_1:FormatText(var_193_18.content)

				arg_190_1.text_.text = var_193_19

				LuaForUtil.ClearLinePrefixSymbol(arg_190_1.text_)

				local var_193_20 = 29
				local var_193_21 = utf8.len(var_193_19)
				local var_193_22 = var_193_20 <= 0 and var_193_16 or var_193_16 * (var_193_21 / var_193_20)

				if var_193_22 > 0 and var_193_16 < var_193_22 then
					arg_190_1.talkMaxDuration = var_193_22

					if var_193_22 + var_193_15 > arg_190_1.duration_ then
						arg_190_1.duration_ = var_193_22 + var_193_15
					end
				end

				arg_190_1.text_.text = var_193_19
				arg_190_1.typewritter.percent = 0

				arg_190_1.typewritter:SetDirty()
				arg_190_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601046", "story_v_out_910601.awb") ~= 0 then
					local var_193_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601046", "story_v_out_910601.awb") / 1000

					if var_193_23 + var_193_15 > arg_190_1.duration_ then
						arg_190_1.duration_ = var_193_23 + var_193_15
					end

					if var_193_18.prefab_name ~= "" and arg_190_1.actors_[var_193_18.prefab_name] ~= nil then
						local var_193_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_190_1.actors_[var_193_18.prefab_name].transform, "story_v_out_910601", "910601046", "story_v_out_910601.awb")

						arg_190_1:RecordAudio("910601046", var_193_24)
						arg_190_1:RecordAudio("910601046", var_193_24)
					else
						arg_190_1:AudioAction("play", "voice", "story_v_out_910601", "910601046", "story_v_out_910601.awb")
					end

					arg_190_1:RecordHistoryTalkVoice("story_v_out_910601", "910601046", "story_v_out_910601.awb")
				end

				arg_190_1:RecordContent(arg_190_1.text_.text)
			end

			local var_193_25 = math.max(var_193_16, arg_190_1.talkMaxDuration)

			if var_193_15 <= arg_190_1.time_ and arg_190_1.time_ < var_193_15 + var_193_25 then
				arg_190_1.typewritter.percent = (arg_190_1.time_ - var_193_15) / var_193_25

				arg_190_1.typewritter:SetDirty()
			end

			if arg_190_1.time_ >= var_193_15 + var_193_25 and arg_190_1.time_ < var_193_15 + var_193_25 + arg_193_0 then
				arg_190_1.typewritter.percent = 1

				arg_190_1.typewritter:SetDirty()
				arg_190_1:ShowNextGo(true)
			end
		end
	end,
	Play910601047 = function(arg_194_0, arg_194_1)
		arg_194_1.time_ = 0
		arg_194_1.frameCnt_ = 0
		arg_194_1.state_ = "playing"
		arg_194_1.curTalkId_ = 910601047
		arg_194_1.duration_ = 5

		SetActive(arg_194_1.tipsGo_, false)

		function arg_194_1.onSingleLineFinish_()
			arg_194_1.onSingleLineUpdate_ = nil
			arg_194_1.onSingleLineFinish_ = nil
			arg_194_1.state_ = "waiting"
		end

		function arg_194_1.playNext_(arg_196_0)
			if arg_196_0 == 1 then
				arg_194_0:Play910601048(arg_194_1)
			end
		end

		function arg_194_1.onSingleLineUpdate_(arg_197_0)
			local var_197_0 = arg_194_1.actors_["1084ui_story"]
			local var_197_1 = 0

			if var_197_1 < arg_194_1.time_ and arg_194_1.time_ <= var_197_1 + arg_197_0 and arg_194_1.var_.characterEffect1084ui_story == nil then
				arg_194_1.var_.characterEffect1084ui_story = var_197_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_197_2 = 0.200000002980232

			if var_197_1 <= arg_194_1.time_ and arg_194_1.time_ < var_197_1 + var_197_2 then
				local var_197_3 = (arg_194_1.time_ - var_197_1) / var_197_2

				if arg_194_1.var_.characterEffect1084ui_story then
					local var_197_4 = Mathf.Lerp(0, 0.5, var_197_3)

					arg_194_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_194_1.var_.characterEffect1084ui_story.fillRatio = var_197_4
				end
			end

			if arg_194_1.time_ >= var_197_1 + var_197_2 and arg_194_1.time_ < var_197_1 + var_197_2 + arg_197_0 and arg_194_1.var_.characterEffect1084ui_story then
				local var_197_5 = 0.5

				arg_194_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_194_1.var_.characterEffect1084ui_story.fillRatio = var_197_5
			end

			local var_197_6 = 0
			local var_197_7 = 0.125

			if var_197_6 < arg_194_1.time_ and arg_194_1.time_ <= var_197_6 + arg_197_0 then
				arg_194_1.talkMaxDuration = 0
				arg_194_1.dialogCg_.alpha = 1

				arg_194_1.dialog_:SetActive(true)
				SetActive(arg_194_1.leftNameGo_, true)

				local var_197_8 = arg_194_1:FormatText(StoryNameCfg[7].name)

				arg_194_1.leftNameTxt_.text = var_197_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_194_1.leftNameTxt_.transform)

				arg_194_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_194_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_194_1:RecordName(arg_194_1.leftNameTxt_.text)
				SetActive(arg_194_1.iconTrs_.gameObject, false)
				arg_194_1.callingController_:SetSelectedState("normal")

				local var_197_9 = arg_194_1:GetWordFromCfg(910601047)
				local var_197_10 = arg_194_1:FormatText(var_197_9.content)

				arg_194_1.text_.text = var_197_10

				LuaForUtil.ClearLinePrefixSymbol(arg_194_1.text_)

				local var_197_11 = 5
				local var_197_12 = utf8.len(var_197_10)
				local var_197_13 = var_197_11 <= 0 and var_197_7 or var_197_7 * (var_197_12 / var_197_11)

				if var_197_13 > 0 and var_197_7 < var_197_13 then
					arg_194_1.talkMaxDuration = var_197_13

					if var_197_13 + var_197_6 > arg_194_1.duration_ then
						arg_194_1.duration_ = var_197_13 + var_197_6
					end
				end

				arg_194_1.text_.text = var_197_10
				arg_194_1.typewritter.percent = 0

				arg_194_1.typewritter:SetDirty()
				arg_194_1:ShowNextGo(false)
				arg_194_1:RecordContent(arg_194_1.text_.text)
			end

			local var_197_14 = math.max(var_197_7, arg_194_1.talkMaxDuration)

			if var_197_6 <= arg_194_1.time_ and arg_194_1.time_ < var_197_6 + var_197_14 then
				arg_194_1.typewritter.percent = (arg_194_1.time_ - var_197_6) / var_197_14

				arg_194_1.typewritter:SetDirty()
			end

			if arg_194_1.time_ >= var_197_6 + var_197_14 and arg_194_1.time_ < var_197_6 + var_197_14 + arg_197_0 then
				arg_194_1.typewritter.percent = 1

				arg_194_1.typewritter:SetDirty()
				arg_194_1:ShowNextGo(true)
			end
		end
	end,
	Play910601048 = function(arg_198_0, arg_198_1)
		arg_198_1.time_ = 0
		arg_198_1.frameCnt_ = 0
		arg_198_1.state_ = "playing"
		arg_198_1.curTalkId_ = 910601048
		arg_198_1.duration_ = 5.27

		SetActive(arg_198_1.tipsGo_, false)

		function arg_198_1.onSingleLineFinish_()
			arg_198_1.onSingleLineUpdate_ = nil
			arg_198_1.onSingleLineFinish_ = nil
			arg_198_1.state_ = "waiting"
		end

		function arg_198_1.playNext_(arg_200_0)
			if arg_200_0 == 1 then
				arg_198_0:Play910601049(arg_198_1)
			end
		end

		function arg_198_1.onSingleLineUpdate_(arg_201_0)
			local var_201_0 = arg_198_1.actors_["1084ui_story"]
			local var_201_1 = 0

			if var_201_1 < arg_198_1.time_ and arg_198_1.time_ <= var_201_1 + arg_201_0 and arg_198_1.var_.characterEffect1084ui_story == nil then
				arg_198_1.var_.characterEffect1084ui_story = var_201_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_201_2 = 0.200000002980232

			if var_201_1 <= arg_198_1.time_ and arg_198_1.time_ < var_201_1 + var_201_2 then
				local var_201_3 = (arg_198_1.time_ - var_201_1) / var_201_2

				if arg_198_1.var_.characterEffect1084ui_story then
					arg_198_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_198_1.time_ >= var_201_1 + var_201_2 and arg_198_1.time_ < var_201_1 + var_201_2 + arg_201_0 and arg_198_1.var_.characterEffect1084ui_story then
				arg_198_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_201_4 = 0

			if var_201_4 < arg_198_1.time_ and arg_198_1.time_ <= var_201_4 + arg_201_0 then
				arg_198_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_201_5 = 0
			local var_201_6 = 0.65

			if var_201_5 < arg_198_1.time_ and arg_198_1.time_ <= var_201_5 + arg_201_0 then
				arg_198_1.talkMaxDuration = 0
				arg_198_1.dialogCg_.alpha = 1

				arg_198_1.dialog_:SetActive(true)
				SetActive(arg_198_1.leftNameGo_, true)

				local var_201_7 = arg_198_1:FormatText(StoryNameCfg[6].name)

				arg_198_1.leftNameTxt_.text = var_201_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_198_1.leftNameTxt_.transform)

				arg_198_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_198_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_198_1:RecordName(arg_198_1.leftNameTxt_.text)
				SetActive(arg_198_1.iconTrs_.gameObject, false)
				arg_198_1.callingController_:SetSelectedState("normal")

				local var_201_8 = arg_198_1:GetWordFromCfg(910601048)
				local var_201_9 = arg_198_1:FormatText(var_201_8.content)

				arg_198_1.text_.text = var_201_9

				LuaForUtil.ClearLinePrefixSymbol(arg_198_1.text_)

				local var_201_10 = 26
				local var_201_11 = utf8.len(var_201_9)
				local var_201_12 = var_201_10 <= 0 and var_201_6 or var_201_6 * (var_201_11 / var_201_10)

				if var_201_12 > 0 and var_201_6 < var_201_12 then
					arg_198_1.talkMaxDuration = var_201_12

					if var_201_12 + var_201_5 > arg_198_1.duration_ then
						arg_198_1.duration_ = var_201_12 + var_201_5
					end
				end

				arg_198_1.text_.text = var_201_9
				arg_198_1.typewritter.percent = 0

				arg_198_1.typewritter:SetDirty()
				arg_198_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601048", "story_v_out_910601.awb") ~= 0 then
					local var_201_13 = manager.audio:GetVoiceLength("story_v_out_910601", "910601048", "story_v_out_910601.awb") / 1000

					if var_201_13 + var_201_5 > arg_198_1.duration_ then
						arg_198_1.duration_ = var_201_13 + var_201_5
					end

					if var_201_8.prefab_name ~= "" and arg_198_1.actors_[var_201_8.prefab_name] ~= nil then
						local var_201_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_198_1.actors_[var_201_8.prefab_name].transform, "story_v_out_910601", "910601048", "story_v_out_910601.awb")

						arg_198_1:RecordAudio("910601048", var_201_14)
						arg_198_1:RecordAudio("910601048", var_201_14)
					else
						arg_198_1:AudioAction("play", "voice", "story_v_out_910601", "910601048", "story_v_out_910601.awb")
					end

					arg_198_1:RecordHistoryTalkVoice("story_v_out_910601", "910601048", "story_v_out_910601.awb")
				end

				arg_198_1:RecordContent(arg_198_1.text_.text)
			end

			local var_201_15 = math.max(var_201_6, arg_198_1.talkMaxDuration)

			if var_201_5 <= arg_198_1.time_ and arg_198_1.time_ < var_201_5 + var_201_15 then
				arg_198_1.typewritter.percent = (arg_198_1.time_ - var_201_5) / var_201_15

				arg_198_1.typewritter:SetDirty()
			end

			if arg_198_1.time_ >= var_201_5 + var_201_15 and arg_198_1.time_ < var_201_5 + var_201_15 + arg_201_0 then
				arg_198_1.typewritter.percent = 1

				arg_198_1.typewritter:SetDirty()
				arg_198_1:ShowNextGo(true)
			end
		end
	end,
	Play910601049 = function(arg_202_0, arg_202_1)
		arg_202_1.time_ = 0
		arg_202_1.frameCnt_ = 0
		arg_202_1.state_ = "playing"
		arg_202_1.curTalkId_ = 910601049
		arg_202_1.duration_ = 4.23

		SetActive(arg_202_1.tipsGo_, false)

		function arg_202_1.onSingleLineFinish_()
			arg_202_1.onSingleLineUpdate_ = nil
			arg_202_1.onSingleLineFinish_ = nil
			arg_202_1.state_ = "waiting"
		end

		function arg_202_1.playNext_(arg_204_0)
			if arg_204_0 == 1 then
				arg_202_0:Play910601050(arg_202_1)
			end
		end

		function arg_202_1.onSingleLineUpdate_(arg_205_0)
			local var_205_0 = 0

			if var_205_0 < arg_202_1.time_ and arg_202_1.time_ <= var_205_0 + arg_205_0 then
				arg_202_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action426")
			end

			local var_205_1 = 0

			if var_205_1 < arg_202_1.time_ and arg_202_1.time_ <= var_205_1 + arg_205_0 then
				arg_202_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_205_2 = arg_202_1.actors_["1011ui_story"]
			local var_205_3 = 0

			if var_205_3 < arg_202_1.time_ and arg_202_1.time_ <= var_205_3 + arg_205_0 and arg_202_1.var_.characterEffect1011ui_story == nil then
				arg_202_1.var_.characterEffect1011ui_story = var_205_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_205_4 = 0.200000002980232

			if var_205_3 <= arg_202_1.time_ and arg_202_1.time_ < var_205_3 + var_205_4 then
				local var_205_5 = (arg_202_1.time_ - var_205_3) / var_205_4

				if arg_202_1.var_.characterEffect1011ui_story then
					arg_202_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_202_1.time_ >= var_205_3 + var_205_4 and arg_202_1.time_ < var_205_3 + var_205_4 + arg_205_0 and arg_202_1.var_.characterEffect1011ui_story then
				arg_202_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_205_6 = arg_202_1.actors_["1084ui_story"]
			local var_205_7 = 0

			if var_205_7 < arg_202_1.time_ and arg_202_1.time_ <= var_205_7 + arg_205_0 and arg_202_1.var_.characterEffect1084ui_story == nil then
				arg_202_1.var_.characterEffect1084ui_story = var_205_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_205_8 = 0.200000002980232

			if var_205_7 <= arg_202_1.time_ and arg_202_1.time_ < var_205_7 + var_205_8 then
				local var_205_9 = (arg_202_1.time_ - var_205_7) / var_205_8

				if arg_202_1.var_.characterEffect1084ui_story then
					local var_205_10 = Mathf.Lerp(0, 0.5, var_205_9)

					arg_202_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_202_1.var_.characterEffect1084ui_story.fillRatio = var_205_10
				end
			end

			if arg_202_1.time_ >= var_205_7 + var_205_8 and arg_202_1.time_ < var_205_7 + var_205_8 + arg_205_0 and arg_202_1.var_.characterEffect1084ui_story then
				local var_205_11 = 0.5

				arg_202_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_202_1.var_.characterEffect1084ui_story.fillRatio = var_205_11
			end

			local var_205_12 = 0
			local var_205_13 = 0.475

			if var_205_12 < arg_202_1.time_ and arg_202_1.time_ <= var_205_12 + arg_205_0 then
				arg_202_1.talkMaxDuration = 0
				arg_202_1.dialogCg_.alpha = 1

				arg_202_1.dialog_:SetActive(true)
				SetActive(arg_202_1.leftNameGo_, true)

				local var_205_14 = arg_202_1:FormatText(StoryNameCfg[37].name)

				arg_202_1.leftNameTxt_.text = var_205_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_202_1.leftNameTxt_.transform)

				arg_202_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_202_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_202_1:RecordName(arg_202_1.leftNameTxt_.text)
				SetActive(arg_202_1.iconTrs_.gameObject, false)
				arg_202_1.callingController_:SetSelectedState("normal")

				local var_205_15 = arg_202_1:GetWordFromCfg(910601049)
				local var_205_16 = arg_202_1:FormatText(var_205_15.content)

				arg_202_1.text_.text = var_205_16

				LuaForUtil.ClearLinePrefixSymbol(arg_202_1.text_)

				local var_205_17 = 19
				local var_205_18 = utf8.len(var_205_16)
				local var_205_19 = var_205_17 <= 0 and var_205_13 or var_205_13 * (var_205_18 / var_205_17)

				if var_205_19 > 0 and var_205_13 < var_205_19 then
					arg_202_1.talkMaxDuration = var_205_19

					if var_205_19 + var_205_12 > arg_202_1.duration_ then
						arg_202_1.duration_ = var_205_19 + var_205_12
					end
				end

				arg_202_1.text_.text = var_205_16
				arg_202_1.typewritter.percent = 0

				arg_202_1.typewritter:SetDirty()
				arg_202_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601049", "story_v_out_910601.awb") ~= 0 then
					local var_205_20 = manager.audio:GetVoiceLength("story_v_out_910601", "910601049", "story_v_out_910601.awb") / 1000

					if var_205_20 + var_205_12 > arg_202_1.duration_ then
						arg_202_1.duration_ = var_205_20 + var_205_12
					end

					if var_205_15.prefab_name ~= "" and arg_202_1.actors_[var_205_15.prefab_name] ~= nil then
						local var_205_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_202_1.actors_[var_205_15.prefab_name].transform, "story_v_out_910601", "910601049", "story_v_out_910601.awb")

						arg_202_1:RecordAudio("910601049", var_205_21)
						arg_202_1:RecordAudio("910601049", var_205_21)
					else
						arg_202_1:AudioAction("play", "voice", "story_v_out_910601", "910601049", "story_v_out_910601.awb")
					end

					arg_202_1:RecordHistoryTalkVoice("story_v_out_910601", "910601049", "story_v_out_910601.awb")
				end

				arg_202_1:RecordContent(arg_202_1.text_.text)
			end

			local var_205_22 = math.max(var_205_13, arg_202_1.talkMaxDuration)

			if var_205_12 <= arg_202_1.time_ and arg_202_1.time_ < var_205_12 + var_205_22 then
				arg_202_1.typewritter.percent = (arg_202_1.time_ - var_205_12) / var_205_22

				arg_202_1.typewritter:SetDirty()
			end

			if arg_202_1.time_ >= var_205_12 + var_205_22 and arg_202_1.time_ < var_205_12 + var_205_22 + arg_205_0 then
				arg_202_1.typewritter.percent = 1

				arg_202_1.typewritter:SetDirty()
				arg_202_1:ShowNextGo(true)
			end
		end
	end,
	Play910601050 = function(arg_206_0, arg_206_1)
		arg_206_1.time_ = 0
		arg_206_1.frameCnt_ = 0
		arg_206_1.state_ = "playing"
		arg_206_1.curTalkId_ = 910601050
		arg_206_1.duration_ = 6.23

		SetActive(arg_206_1.tipsGo_, false)

		function arg_206_1.onSingleLineFinish_()
			arg_206_1.onSingleLineUpdate_ = nil
			arg_206_1.onSingleLineFinish_ = nil
			arg_206_1.state_ = "waiting"
		end

		function arg_206_1.playNext_(arg_208_0)
			if arg_208_0 == 1 then
				arg_206_0:Play910601051(arg_206_1)
			end
		end

		function arg_206_1.onSingleLineUpdate_(arg_209_0)
			local var_209_0 = arg_206_1.actors_["1048ui_story"].transform
			local var_209_1 = 0

			if var_209_1 < arg_206_1.time_ and arg_206_1.time_ <= var_209_1 + arg_209_0 then
				arg_206_1.var_.moveOldPos1048ui_story = var_209_0.localPosition
			end

			local var_209_2 = 0.001

			if var_209_1 <= arg_206_1.time_ and arg_206_1.time_ < var_209_1 + var_209_2 then
				local var_209_3 = (arg_206_1.time_ - var_209_1) / var_209_2
				local var_209_4 = Vector3.New(0, -0.8, -6.2)

				var_209_0.localPosition = Vector3.Lerp(arg_206_1.var_.moveOldPos1048ui_story, var_209_4, var_209_3)

				local var_209_5 = manager.ui.mainCamera.transform.position - var_209_0.position

				var_209_0.forward = Vector3.New(var_209_5.x, var_209_5.y, var_209_5.z)

				local var_209_6 = var_209_0.localEulerAngles

				var_209_6.z = 0
				var_209_6.x = 0
				var_209_0.localEulerAngles = var_209_6
			end

			if arg_206_1.time_ >= var_209_1 + var_209_2 and arg_206_1.time_ < var_209_1 + var_209_2 + arg_209_0 then
				var_209_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_209_7 = manager.ui.mainCamera.transform.position - var_209_0.position

				var_209_0.forward = Vector3.New(var_209_7.x, var_209_7.y, var_209_7.z)

				local var_209_8 = var_209_0.localEulerAngles

				var_209_8.z = 0
				var_209_8.x = 0
				var_209_0.localEulerAngles = var_209_8
			end

			local var_209_9 = arg_206_1.actors_["1048ui_story"]
			local var_209_10 = 0

			if var_209_10 < arg_206_1.time_ and arg_206_1.time_ <= var_209_10 + arg_209_0 and arg_206_1.var_.characterEffect1048ui_story == nil then
				arg_206_1.var_.characterEffect1048ui_story = var_209_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_209_11 = 0.200000002980232

			if var_209_10 <= arg_206_1.time_ and arg_206_1.time_ < var_209_10 + var_209_11 then
				local var_209_12 = (arg_206_1.time_ - var_209_10) / var_209_11

				if arg_206_1.var_.characterEffect1048ui_story then
					arg_206_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_206_1.time_ >= var_209_10 + var_209_11 and arg_206_1.time_ < var_209_10 + var_209_11 + arg_209_0 and arg_206_1.var_.characterEffect1048ui_story then
				arg_206_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_209_13 = 0

			if var_209_13 < arg_206_1.time_ and arg_206_1.time_ <= var_209_13 + arg_209_0 then
				arg_206_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action7_1")
			end

			local var_209_14 = 0

			if var_209_14 < arg_206_1.time_ and arg_206_1.time_ <= var_209_14 + arg_209_0 then
				arg_206_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_209_15 = arg_206_1.actors_["1011ui_story"].transform
			local var_209_16 = 0

			if var_209_16 < arg_206_1.time_ and arg_206_1.time_ <= var_209_16 + arg_209_0 then
				arg_206_1.var_.moveOldPos1011ui_story = var_209_15.localPosition
			end

			local var_209_17 = 0.001

			if var_209_16 <= arg_206_1.time_ and arg_206_1.time_ < var_209_16 + var_209_17 then
				local var_209_18 = (arg_206_1.time_ - var_209_16) / var_209_17
				local var_209_19 = Vector3.New(0, 100, 0)

				var_209_15.localPosition = Vector3.Lerp(arg_206_1.var_.moveOldPos1011ui_story, var_209_19, var_209_18)

				local var_209_20 = manager.ui.mainCamera.transform.position - var_209_15.position

				var_209_15.forward = Vector3.New(var_209_20.x, var_209_20.y, var_209_20.z)

				local var_209_21 = var_209_15.localEulerAngles

				var_209_21.z = 0
				var_209_21.x = 0
				var_209_15.localEulerAngles = var_209_21
			end

			if arg_206_1.time_ >= var_209_16 + var_209_17 and arg_206_1.time_ < var_209_16 + var_209_17 + arg_209_0 then
				var_209_15.localPosition = Vector3.New(0, 100, 0)

				local var_209_22 = manager.ui.mainCamera.transform.position - var_209_15.position

				var_209_15.forward = Vector3.New(var_209_22.x, var_209_22.y, var_209_22.z)

				local var_209_23 = var_209_15.localEulerAngles

				var_209_23.z = 0
				var_209_23.x = 0
				var_209_15.localEulerAngles = var_209_23
			end

			local var_209_24 = arg_206_1.actors_["1011ui_story"]
			local var_209_25 = 0

			if var_209_25 < arg_206_1.time_ and arg_206_1.time_ <= var_209_25 + arg_209_0 and arg_206_1.var_.characterEffect1011ui_story == nil then
				arg_206_1.var_.characterEffect1011ui_story = var_209_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_209_26 = 0.200000002980232

			if var_209_25 <= arg_206_1.time_ and arg_206_1.time_ < var_209_25 + var_209_26 then
				local var_209_27 = (arg_206_1.time_ - var_209_25) / var_209_26

				if arg_206_1.var_.characterEffect1011ui_story then
					local var_209_28 = Mathf.Lerp(0, 0.5, var_209_27)

					arg_206_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_206_1.var_.characterEffect1011ui_story.fillRatio = var_209_28
				end
			end

			if arg_206_1.time_ >= var_209_25 + var_209_26 and arg_206_1.time_ < var_209_25 + var_209_26 + arg_209_0 and arg_206_1.var_.characterEffect1011ui_story then
				local var_209_29 = 0.5

				arg_206_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_206_1.var_.characterEffect1011ui_story.fillRatio = var_209_29
			end

			local var_209_30 = arg_206_1.actors_["1084ui_story"].transform
			local var_209_31 = 0

			if var_209_31 < arg_206_1.time_ and arg_206_1.time_ <= var_209_31 + arg_209_0 then
				arg_206_1.var_.moveOldPos1084ui_story = var_209_30.localPosition
			end

			local var_209_32 = 0.001

			if var_209_31 <= arg_206_1.time_ and arg_206_1.time_ < var_209_31 + var_209_32 then
				local var_209_33 = (arg_206_1.time_ - var_209_31) / var_209_32
				local var_209_34 = Vector3.New(0, 100, 0)

				var_209_30.localPosition = Vector3.Lerp(arg_206_1.var_.moveOldPos1084ui_story, var_209_34, var_209_33)

				local var_209_35 = manager.ui.mainCamera.transform.position - var_209_30.position

				var_209_30.forward = Vector3.New(var_209_35.x, var_209_35.y, var_209_35.z)

				local var_209_36 = var_209_30.localEulerAngles

				var_209_36.z = 0
				var_209_36.x = 0
				var_209_30.localEulerAngles = var_209_36
			end

			if arg_206_1.time_ >= var_209_31 + var_209_32 and arg_206_1.time_ < var_209_31 + var_209_32 + arg_209_0 then
				var_209_30.localPosition = Vector3.New(0, 100, 0)

				local var_209_37 = manager.ui.mainCamera.transform.position - var_209_30.position

				var_209_30.forward = Vector3.New(var_209_37.x, var_209_37.y, var_209_37.z)

				local var_209_38 = var_209_30.localEulerAngles

				var_209_38.z = 0
				var_209_38.x = 0
				var_209_30.localEulerAngles = var_209_38
			end

			local var_209_39 = arg_206_1.actors_["1084ui_story"]
			local var_209_40 = 0

			if var_209_40 < arg_206_1.time_ and arg_206_1.time_ <= var_209_40 + arg_209_0 and arg_206_1.var_.characterEffect1084ui_story == nil then
				arg_206_1.var_.characterEffect1084ui_story = var_209_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_209_41 = 0.200000002980232

			if var_209_40 <= arg_206_1.time_ and arg_206_1.time_ < var_209_40 + var_209_41 then
				local var_209_42 = (arg_206_1.time_ - var_209_40) / var_209_41

				if arg_206_1.var_.characterEffect1084ui_story then
					local var_209_43 = Mathf.Lerp(0, 0.5, var_209_42)

					arg_206_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_206_1.var_.characterEffect1084ui_story.fillRatio = var_209_43
				end
			end

			if arg_206_1.time_ >= var_209_40 + var_209_41 and arg_206_1.time_ < var_209_40 + var_209_41 + arg_209_0 and arg_206_1.var_.characterEffect1084ui_story then
				local var_209_44 = 0.5

				arg_206_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_206_1.var_.characterEffect1084ui_story.fillRatio = var_209_44
			end

			local var_209_45 = 0
			local var_209_46 = 0.55

			if var_209_45 < arg_206_1.time_ and arg_206_1.time_ <= var_209_45 + arg_209_0 then
				arg_206_1.talkMaxDuration = 0
				arg_206_1.dialogCg_.alpha = 1

				arg_206_1.dialog_:SetActive(true)
				SetActive(arg_206_1.leftNameGo_, true)

				local var_209_47 = arg_206_1:FormatText(StoryNameCfg[8].name)

				arg_206_1.leftNameTxt_.text = var_209_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_206_1.leftNameTxt_.transform)

				arg_206_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_206_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_206_1:RecordName(arg_206_1.leftNameTxt_.text)
				SetActive(arg_206_1.iconTrs_.gameObject, false)
				arg_206_1.callingController_:SetSelectedState("normal")

				local var_209_48 = arg_206_1:GetWordFromCfg(910601050)
				local var_209_49 = arg_206_1:FormatText(var_209_48.content)

				arg_206_1.text_.text = var_209_49

				LuaForUtil.ClearLinePrefixSymbol(arg_206_1.text_)

				local var_209_50 = 22
				local var_209_51 = utf8.len(var_209_49)
				local var_209_52 = var_209_50 <= 0 and var_209_46 or var_209_46 * (var_209_51 / var_209_50)

				if var_209_52 > 0 and var_209_46 < var_209_52 then
					arg_206_1.talkMaxDuration = var_209_52

					if var_209_52 + var_209_45 > arg_206_1.duration_ then
						arg_206_1.duration_ = var_209_52 + var_209_45
					end
				end

				arg_206_1.text_.text = var_209_49
				arg_206_1.typewritter.percent = 0

				arg_206_1.typewritter:SetDirty()
				arg_206_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601050", "story_v_out_910601.awb") ~= 0 then
					local var_209_53 = manager.audio:GetVoiceLength("story_v_out_910601", "910601050", "story_v_out_910601.awb") / 1000

					if var_209_53 + var_209_45 > arg_206_1.duration_ then
						arg_206_1.duration_ = var_209_53 + var_209_45
					end

					if var_209_48.prefab_name ~= "" and arg_206_1.actors_[var_209_48.prefab_name] ~= nil then
						local var_209_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_206_1.actors_[var_209_48.prefab_name].transform, "story_v_out_910601", "910601050", "story_v_out_910601.awb")

						arg_206_1:RecordAudio("910601050", var_209_54)
						arg_206_1:RecordAudio("910601050", var_209_54)
					else
						arg_206_1:AudioAction("play", "voice", "story_v_out_910601", "910601050", "story_v_out_910601.awb")
					end

					arg_206_1:RecordHistoryTalkVoice("story_v_out_910601", "910601050", "story_v_out_910601.awb")
				end

				arg_206_1:RecordContent(arg_206_1.text_.text)
			end

			local var_209_55 = math.max(var_209_46, arg_206_1.talkMaxDuration)

			if var_209_45 <= arg_206_1.time_ and arg_206_1.time_ < var_209_45 + var_209_55 then
				arg_206_1.typewritter.percent = (arg_206_1.time_ - var_209_45) / var_209_55

				arg_206_1.typewritter:SetDirty()
			end

			if arg_206_1.time_ >= var_209_45 + var_209_55 and arg_206_1.time_ < var_209_45 + var_209_55 + arg_209_0 then
				arg_206_1.typewritter.percent = 1

				arg_206_1.typewritter:SetDirty()
				arg_206_1:ShowNextGo(true)
			end
		end
	end,
	Play910601051 = function(arg_210_0, arg_210_1)
		arg_210_1.time_ = 0
		arg_210_1.frameCnt_ = 0
		arg_210_1.state_ = "playing"
		arg_210_1.curTalkId_ = 910601051
		arg_210_1.duration_ = 5

		SetActive(arg_210_1.tipsGo_, false)

		function arg_210_1.onSingleLineFinish_()
			arg_210_1.onSingleLineUpdate_ = nil
			arg_210_1.onSingleLineFinish_ = nil
			arg_210_1.state_ = "waiting"
		end

		function arg_210_1.playNext_(arg_212_0)
			if arg_212_0 == 1 then
				arg_210_0:Play910601052(arg_210_1)
			end
		end

		function arg_210_1.onSingleLineUpdate_(arg_213_0)
			local var_213_0 = arg_210_1.actors_["1048ui_story"]
			local var_213_1 = 0

			if var_213_1 < arg_210_1.time_ and arg_210_1.time_ <= var_213_1 + arg_213_0 and arg_210_1.var_.characterEffect1048ui_story == nil then
				arg_210_1.var_.characterEffect1048ui_story = var_213_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_213_2 = 0.200000002980232

			if var_213_1 <= arg_210_1.time_ and arg_210_1.time_ < var_213_1 + var_213_2 then
				local var_213_3 = (arg_210_1.time_ - var_213_1) / var_213_2

				if arg_210_1.var_.characterEffect1048ui_story then
					local var_213_4 = Mathf.Lerp(0, 0.5, var_213_3)

					arg_210_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_210_1.var_.characterEffect1048ui_story.fillRatio = var_213_4
				end
			end

			if arg_210_1.time_ >= var_213_1 + var_213_2 and arg_210_1.time_ < var_213_1 + var_213_2 + arg_213_0 and arg_210_1.var_.characterEffect1048ui_story then
				local var_213_5 = 0.5

				arg_210_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_210_1.var_.characterEffect1048ui_story.fillRatio = var_213_5
			end

			local var_213_6 = arg_210_1.actors_["1048ui_story"].transform
			local var_213_7 = 0

			if var_213_7 < arg_210_1.time_ and arg_210_1.time_ <= var_213_7 + arg_213_0 then
				arg_210_1.var_.moveOldPos1048ui_story = var_213_6.localPosition
			end

			local var_213_8 = 0.001

			if var_213_7 <= arg_210_1.time_ and arg_210_1.time_ < var_213_7 + var_213_8 then
				local var_213_9 = (arg_210_1.time_ - var_213_7) / var_213_8
				local var_213_10 = Vector3.New(0, 100, 0)

				var_213_6.localPosition = Vector3.Lerp(arg_210_1.var_.moveOldPos1048ui_story, var_213_10, var_213_9)

				local var_213_11 = manager.ui.mainCamera.transform.position - var_213_6.position

				var_213_6.forward = Vector3.New(var_213_11.x, var_213_11.y, var_213_11.z)

				local var_213_12 = var_213_6.localEulerAngles

				var_213_12.z = 0
				var_213_12.x = 0
				var_213_6.localEulerAngles = var_213_12
			end

			if arg_210_1.time_ >= var_213_7 + var_213_8 and arg_210_1.time_ < var_213_7 + var_213_8 + arg_213_0 then
				var_213_6.localPosition = Vector3.New(0, 100, 0)

				local var_213_13 = manager.ui.mainCamera.transform.position - var_213_6.position

				var_213_6.forward = Vector3.New(var_213_13.x, var_213_13.y, var_213_13.z)

				local var_213_14 = var_213_6.localEulerAngles

				var_213_14.z = 0
				var_213_14.x = 0
				var_213_6.localEulerAngles = var_213_14
			end

			local var_213_15 = 0
			local var_213_16 = 0.525

			if var_213_15 < arg_210_1.time_ and arg_210_1.time_ <= var_213_15 + arg_213_0 then
				arg_210_1.talkMaxDuration = 0
				arg_210_1.dialogCg_.alpha = 1

				arg_210_1.dialog_:SetActive(true)
				SetActive(arg_210_1.leftNameGo_, false)

				arg_210_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_210_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_210_1:RecordName(arg_210_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_210_1.iconTrs_.gameObject, false)
				arg_210_1.callingController_:SetSelectedState("normal")

				local var_213_17 = arg_210_1:GetWordFromCfg(910601051)
				local var_213_18 = arg_210_1:FormatText(var_213_17.content)

				arg_210_1.text_.text = var_213_18

				LuaForUtil.ClearLinePrefixSymbol(arg_210_1.text_)

				local var_213_19 = 21
				local var_213_20 = utf8.len(var_213_18)
				local var_213_21 = var_213_19 <= 0 and var_213_16 or var_213_16 * (var_213_20 / var_213_19)

				if var_213_21 > 0 and var_213_16 < var_213_21 then
					arg_210_1.talkMaxDuration = var_213_21

					if var_213_21 + var_213_15 > arg_210_1.duration_ then
						arg_210_1.duration_ = var_213_21 + var_213_15
					end
				end

				arg_210_1.text_.text = var_213_18
				arg_210_1.typewritter.percent = 0

				arg_210_1.typewritter:SetDirty()
				arg_210_1:ShowNextGo(false)
				arg_210_1:RecordContent(arg_210_1.text_.text)
			end

			local var_213_22 = math.max(var_213_16, arg_210_1.talkMaxDuration)

			if var_213_15 <= arg_210_1.time_ and arg_210_1.time_ < var_213_15 + var_213_22 then
				arg_210_1.typewritter.percent = (arg_210_1.time_ - var_213_15) / var_213_22

				arg_210_1.typewritter:SetDirty()
			end

			if arg_210_1.time_ >= var_213_15 + var_213_22 and arg_210_1.time_ < var_213_15 + var_213_22 + arg_213_0 then
				arg_210_1.typewritter.percent = 1

				arg_210_1.typewritter:SetDirty()
				arg_210_1:ShowNextGo(true)
			end
		end
	end,
	Play910601052 = function(arg_214_0, arg_214_1)
		arg_214_1.time_ = 0
		arg_214_1.frameCnt_ = 0
		arg_214_1.state_ = "playing"
		arg_214_1.curTalkId_ = 910601052
		arg_214_1.duration_ = 5

		SetActive(arg_214_1.tipsGo_, false)

		function arg_214_1.onSingleLineFinish_()
			arg_214_1.onSingleLineUpdate_ = nil
			arg_214_1.onSingleLineFinish_ = nil
			arg_214_1.state_ = "waiting"
		end

		function arg_214_1.playNext_(arg_216_0)
			if arg_216_0 == 1 then
				arg_214_0:Play910601053(arg_214_1)
			end
		end

		function arg_214_1.onSingleLineUpdate_(arg_217_0)
			local var_217_0 = 0
			local var_217_1 = 1

			if var_217_0 < arg_214_1.time_ and arg_214_1.time_ <= var_217_0 + arg_217_0 then
				arg_214_1.talkMaxDuration = 0
				arg_214_1.dialogCg_.alpha = 1

				arg_214_1.dialog_:SetActive(true)
				SetActive(arg_214_1.leftNameGo_, true)

				local var_217_2 = arg_214_1:FormatText(StoryNameCfg[7].name)

				arg_214_1.leftNameTxt_.text = var_217_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_214_1.leftNameTxt_.transform)

				arg_214_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_214_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_214_1:RecordName(arg_214_1.leftNameTxt_.text)
				SetActive(arg_214_1.iconTrs_.gameObject, false)
				arg_214_1.callingController_:SetSelectedState("normal")

				local var_217_3 = arg_214_1:GetWordFromCfg(910601052)
				local var_217_4 = arg_214_1:FormatText(var_217_3.content)

				arg_214_1.text_.text = var_217_4

				LuaForUtil.ClearLinePrefixSymbol(arg_214_1.text_)

				local var_217_5 = 40
				local var_217_6 = utf8.len(var_217_4)
				local var_217_7 = var_217_5 <= 0 and var_217_1 or var_217_1 * (var_217_6 / var_217_5)

				if var_217_7 > 0 and var_217_1 < var_217_7 then
					arg_214_1.talkMaxDuration = var_217_7

					if var_217_7 + var_217_0 > arg_214_1.duration_ then
						arg_214_1.duration_ = var_217_7 + var_217_0
					end
				end

				arg_214_1.text_.text = var_217_4
				arg_214_1.typewritter.percent = 0

				arg_214_1.typewritter:SetDirty()
				arg_214_1:ShowNextGo(false)
				arg_214_1:RecordContent(arg_214_1.text_.text)
			end

			local var_217_8 = math.max(var_217_1, arg_214_1.talkMaxDuration)

			if var_217_0 <= arg_214_1.time_ and arg_214_1.time_ < var_217_0 + var_217_8 then
				arg_214_1.typewritter.percent = (arg_214_1.time_ - var_217_0) / var_217_8

				arg_214_1.typewritter:SetDirty()
			end

			if arg_214_1.time_ >= var_217_0 + var_217_8 and arg_214_1.time_ < var_217_0 + var_217_8 + arg_217_0 then
				arg_214_1.typewritter.percent = 1

				arg_214_1.typewritter:SetDirty()
				arg_214_1:ShowNextGo(true)
			end
		end
	end,
	Play910601053 = function(arg_218_0, arg_218_1)
		arg_218_1.time_ = 0
		arg_218_1.frameCnt_ = 0
		arg_218_1.state_ = "playing"
		arg_218_1.curTalkId_ = 910601053
		arg_218_1.duration_ = 3.3

		SetActive(arg_218_1.tipsGo_, false)

		function arg_218_1.onSingleLineFinish_()
			arg_218_1.onSingleLineUpdate_ = nil
			arg_218_1.onSingleLineFinish_ = nil
			arg_218_1.state_ = "waiting"
		end

		function arg_218_1.playNext_(arg_220_0)
			if arg_220_0 == 1 then
				arg_218_0:Play910601054(arg_218_1)
			end
		end

		function arg_218_1.onSingleLineUpdate_(arg_221_0)
			local var_221_0 = arg_218_1.actors_["1028ui_story"].transform
			local var_221_1 = 0

			if var_221_1 < arg_218_1.time_ and arg_218_1.time_ <= var_221_1 + arg_221_0 then
				arg_218_1.var_.moveOldPos1028ui_story = var_221_0.localPosition
			end

			local var_221_2 = 0.001

			if var_221_1 <= arg_218_1.time_ and arg_218_1.time_ < var_221_1 + var_221_2 then
				local var_221_3 = (arg_218_1.time_ - var_221_1) / var_221_2
				local var_221_4 = Vector3.New(0, -0.9, -5.9)

				var_221_0.localPosition = Vector3.Lerp(arg_218_1.var_.moveOldPos1028ui_story, var_221_4, var_221_3)

				local var_221_5 = manager.ui.mainCamera.transform.position - var_221_0.position

				var_221_0.forward = Vector3.New(var_221_5.x, var_221_5.y, var_221_5.z)

				local var_221_6 = var_221_0.localEulerAngles

				var_221_6.z = 0
				var_221_6.x = 0
				var_221_0.localEulerAngles = var_221_6
			end

			if arg_218_1.time_ >= var_221_1 + var_221_2 and arg_218_1.time_ < var_221_1 + var_221_2 + arg_221_0 then
				var_221_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_221_7 = manager.ui.mainCamera.transform.position - var_221_0.position

				var_221_0.forward = Vector3.New(var_221_7.x, var_221_7.y, var_221_7.z)

				local var_221_8 = var_221_0.localEulerAngles

				var_221_8.z = 0
				var_221_8.x = 0
				var_221_0.localEulerAngles = var_221_8
			end

			local var_221_9 = arg_218_1.actors_["1028ui_story"]
			local var_221_10 = 0

			if var_221_10 < arg_218_1.time_ and arg_218_1.time_ <= var_221_10 + arg_221_0 and arg_218_1.var_.characterEffect1028ui_story == nil then
				arg_218_1.var_.characterEffect1028ui_story = var_221_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_221_11 = 0.2

			if var_221_10 <= arg_218_1.time_ and arg_218_1.time_ < var_221_10 + var_221_11 then
				local var_221_12 = (arg_218_1.time_ - var_221_10) / var_221_11

				if arg_218_1.var_.characterEffect1028ui_story then
					arg_218_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_218_1.time_ >= var_221_10 + var_221_11 and arg_218_1.time_ < var_221_10 + var_221_11 + arg_221_0 and arg_218_1.var_.characterEffect1028ui_story then
				arg_218_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_221_13 = 0

			if var_221_13 < arg_218_1.time_ and arg_218_1.time_ <= var_221_13 + arg_221_0 then
				arg_218_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_221_14 = 0

			if var_221_14 < arg_218_1.time_ and arg_218_1.time_ <= var_221_14 + arg_221_0 then
				arg_218_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_221_15 = 0
			local var_221_16 = 0.4

			if var_221_15 < arg_218_1.time_ and arg_218_1.time_ <= var_221_15 + arg_221_0 then
				arg_218_1.talkMaxDuration = 0
				arg_218_1.dialogCg_.alpha = 1

				arg_218_1.dialog_:SetActive(true)
				SetActive(arg_218_1.leftNameGo_, true)

				local var_221_17 = arg_218_1:FormatText(StoryNameCfg[327].name)

				arg_218_1.leftNameTxt_.text = var_221_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_218_1.leftNameTxt_.transform)

				arg_218_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_218_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_218_1:RecordName(arg_218_1.leftNameTxt_.text)
				SetActive(arg_218_1.iconTrs_.gameObject, false)
				arg_218_1.callingController_:SetSelectedState("normal")

				local var_221_18 = arg_218_1:GetWordFromCfg(910601053)
				local var_221_19 = arg_218_1:FormatText(var_221_18.content)

				arg_218_1.text_.text = var_221_19

				LuaForUtil.ClearLinePrefixSymbol(arg_218_1.text_)

				local var_221_20 = 16
				local var_221_21 = utf8.len(var_221_19)
				local var_221_22 = var_221_20 <= 0 and var_221_16 or var_221_16 * (var_221_21 / var_221_20)

				if var_221_22 > 0 and var_221_16 < var_221_22 then
					arg_218_1.talkMaxDuration = var_221_22

					if var_221_22 + var_221_15 > arg_218_1.duration_ then
						arg_218_1.duration_ = var_221_22 + var_221_15
					end
				end

				arg_218_1.text_.text = var_221_19
				arg_218_1.typewritter.percent = 0

				arg_218_1.typewritter:SetDirty()
				arg_218_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601053", "story_v_out_910601.awb") ~= 0 then
					local var_221_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601053", "story_v_out_910601.awb") / 1000

					if var_221_23 + var_221_15 > arg_218_1.duration_ then
						arg_218_1.duration_ = var_221_23 + var_221_15
					end

					if var_221_18.prefab_name ~= "" and arg_218_1.actors_[var_221_18.prefab_name] ~= nil then
						local var_221_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_218_1.actors_[var_221_18.prefab_name].transform, "story_v_out_910601", "910601053", "story_v_out_910601.awb")

						arg_218_1:RecordAudio("910601053", var_221_24)
						arg_218_1:RecordAudio("910601053", var_221_24)
					else
						arg_218_1:AudioAction("play", "voice", "story_v_out_910601", "910601053", "story_v_out_910601.awb")
					end

					arg_218_1:RecordHistoryTalkVoice("story_v_out_910601", "910601053", "story_v_out_910601.awb")
				end

				arg_218_1:RecordContent(arg_218_1.text_.text)
			end

			local var_221_25 = math.max(var_221_16, arg_218_1.talkMaxDuration)

			if var_221_15 <= arg_218_1.time_ and arg_218_1.time_ < var_221_15 + var_221_25 then
				arg_218_1.typewritter.percent = (arg_218_1.time_ - var_221_15) / var_221_25

				arg_218_1.typewritter:SetDirty()
			end

			if arg_218_1.time_ >= var_221_15 + var_221_25 and arg_218_1.time_ < var_221_15 + var_221_25 + arg_221_0 then
				arg_218_1.typewritter.percent = 1

				arg_218_1.typewritter:SetDirty()
				arg_218_1:ShowNextGo(true)
			end
		end
	end,
	Play910601054 = function(arg_222_0, arg_222_1)
		arg_222_1.time_ = 0
		arg_222_1.frameCnt_ = 0
		arg_222_1.state_ = "playing"
		arg_222_1.curTalkId_ = 910601054
		arg_222_1.duration_ = 4.67

		SetActive(arg_222_1.tipsGo_, false)

		function arg_222_1.onSingleLineFinish_()
			arg_222_1.onSingleLineUpdate_ = nil
			arg_222_1.onSingleLineFinish_ = nil
			arg_222_1.state_ = "waiting"
		end

		function arg_222_1.playNext_(arg_224_0)
			if arg_224_0 == 1 then
				arg_222_0:Play910601055(arg_222_1)
			end
		end

		function arg_222_1.onSingleLineUpdate_(arg_225_0)
			local var_225_0 = arg_222_1.actors_["1059ui_story"].transform
			local var_225_1 = 0

			if var_225_1 < arg_222_1.time_ and arg_222_1.time_ <= var_225_1 + arg_225_0 then
				arg_222_1.var_.moveOldPos1059ui_story = var_225_0.localPosition
			end

			local var_225_2 = 0.001

			if var_225_1 <= arg_222_1.time_ and arg_222_1.time_ < var_225_1 + var_225_2 then
				local var_225_3 = (arg_222_1.time_ - var_225_1) / var_225_2
				local var_225_4 = Vector3.New(0, -1.05, -6)

				var_225_0.localPosition = Vector3.Lerp(arg_222_1.var_.moveOldPos1059ui_story, var_225_4, var_225_3)

				local var_225_5 = manager.ui.mainCamera.transform.position - var_225_0.position

				var_225_0.forward = Vector3.New(var_225_5.x, var_225_5.y, var_225_5.z)

				local var_225_6 = var_225_0.localEulerAngles

				var_225_6.z = 0
				var_225_6.x = 0
				var_225_0.localEulerAngles = var_225_6
			end

			if arg_222_1.time_ >= var_225_1 + var_225_2 and arg_222_1.time_ < var_225_1 + var_225_2 + arg_225_0 then
				var_225_0.localPosition = Vector3.New(0, -1.05, -6)

				local var_225_7 = manager.ui.mainCamera.transform.position - var_225_0.position

				var_225_0.forward = Vector3.New(var_225_7.x, var_225_7.y, var_225_7.z)

				local var_225_8 = var_225_0.localEulerAngles

				var_225_8.z = 0
				var_225_8.x = 0
				var_225_0.localEulerAngles = var_225_8
			end

			local var_225_9 = arg_222_1.actors_["1059ui_story"]
			local var_225_10 = 0

			if var_225_10 < arg_222_1.time_ and arg_222_1.time_ <= var_225_10 + arg_225_0 and arg_222_1.var_.characterEffect1059ui_story == nil then
				arg_222_1.var_.characterEffect1059ui_story = var_225_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_225_11 = 0.200000002980232

			if var_225_10 <= arg_222_1.time_ and arg_222_1.time_ < var_225_10 + var_225_11 then
				local var_225_12 = (arg_222_1.time_ - var_225_10) / var_225_11

				if arg_222_1.var_.characterEffect1059ui_story then
					arg_222_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_222_1.time_ >= var_225_10 + var_225_11 and arg_222_1.time_ < var_225_10 + var_225_11 + arg_225_0 and arg_222_1.var_.characterEffect1059ui_story then
				arg_222_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_225_13 = 0

			if var_225_13 < arg_222_1.time_ and arg_222_1.time_ <= var_225_13 + arg_225_0 then
				arg_222_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_225_14 = 0

			if var_225_14 < arg_222_1.time_ and arg_222_1.time_ <= var_225_14 + arg_225_0 then
				arg_222_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_225_15 = arg_222_1.actors_["1028ui_story"].transform
			local var_225_16 = 0

			if var_225_16 < arg_222_1.time_ and arg_222_1.time_ <= var_225_16 + arg_225_0 then
				arg_222_1.var_.moveOldPos1028ui_story = var_225_15.localPosition
			end

			local var_225_17 = 0.001

			if var_225_16 <= arg_222_1.time_ and arg_222_1.time_ < var_225_16 + var_225_17 then
				local var_225_18 = (arg_222_1.time_ - var_225_16) / var_225_17
				local var_225_19 = Vector3.New(0, 100, 0)

				var_225_15.localPosition = Vector3.Lerp(arg_222_1.var_.moveOldPos1028ui_story, var_225_19, var_225_18)

				local var_225_20 = manager.ui.mainCamera.transform.position - var_225_15.position

				var_225_15.forward = Vector3.New(var_225_20.x, var_225_20.y, var_225_20.z)

				local var_225_21 = var_225_15.localEulerAngles

				var_225_21.z = 0
				var_225_21.x = 0
				var_225_15.localEulerAngles = var_225_21
			end

			if arg_222_1.time_ >= var_225_16 + var_225_17 and arg_222_1.time_ < var_225_16 + var_225_17 + arg_225_0 then
				var_225_15.localPosition = Vector3.New(0, 100, 0)

				local var_225_22 = manager.ui.mainCamera.transform.position - var_225_15.position

				var_225_15.forward = Vector3.New(var_225_22.x, var_225_22.y, var_225_22.z)

				local var_225_23 = var_225_15.localEulerAngles

				var_225_23.z = 0
				var_225_23.x = 0
				var_225_15.localEulerAngles = var_225_23
			end

			local var_225_24 = arg_222_1.actors_["1028ui_story"]
			local var_225_25 = 0

			if var_225_25 < arg_222_1.time_ and arg_222_1.time_ <= var_225_25 + arg_225_0 and arg_222_1.var_.characterEffect1028ui_story == nil then
				arg_222_1.var_.characterEffect1028ui_story = var_225_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_225_26 = 0.200000002980232

			if var_225_25 <= arg_222_1.time_ and arg_222_1.time_ < var_225_25 + var_225_26 then
				local var_225_27 = (arg_222_1.time_ - var_225_25) / var_225_26

				if arg_222_1.var_.characterEffect1028ui_story then
					local var_225_28 = Mathf.Lerp(0, 0.5, var_225_27)

					arg_222_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_222_1.var_.characterEffect1028ui_story.fillRatio = var_225_28
				end
			end

			if arg_222_1.time_ >= var_225_25 + var_225_26 and arg_222_1.time_ < var_225_25 + var_225_26 + arg_225_0 and arg_222_1.var_.characterEffect1028ui_story then
				local var_225_29 = 0.5

				arg_222_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_222_1.var_.characterEffect1028ui_story.fillRatio = var_225_29
			end

			local var_225_30 = arg_222_1.actors_["1048ui_story"].transform
			local var_225_31 = 0

			if var_225_31 < arg_222_1.time_ and arg_222_1.time_ <= var_225_31 + arg_225_0 then
				arg_222_1.var_.moveOldPos1048ui_story = var_225_30.localPosition
			end

			local var_225_32 = 0.001

			if var_225_31 <= arg_222_1.time_ and arg_222_1.time_ < var_225_31 + var_225_32 then
				local var_225_33 = (arg_222_1.time_ - var_225_31) / var_225_32
				local var_225_34 = Vector3.New(0, 100, 0)

				var_225_30.localPosition = Vector3.Lerp(arg_222_1.var_.moveOldPos1048ui_story, var_225_34, var_225_33)

				local var_225_35 = manager.ui.mainCamera.transform.position - var_225_30.position

				var_225_30.forward = Vector3.New(var_225_35.x, var_225_35.y, var_225_35.z)

				local var_225_36 = var_225_30.localEulerAngles

				var_225_36.z = 0
				var_225_36.x = 0
				var_225_30.localEulerAngles = var_225_36
			end

			if arg_222_1.time_ >= var_225_31 + var_225_32 and arg_222_1.time_ < var_225_31 + var_225_32 + arg_225_0 then
				var_225_30.localPosition = Vector3.New(0, 100, 0)

				local var_225_37 = manager.ui.mainCamera.transform.position - var_225_30.position

				var_225_30.forward = Vector3.New(var_225_37.x, var_225_37.y, var_225_37.z)

				local var_225_38 = var_225_30.localEulerAngles

				var_225_38.z = 0
				var_225_38.x = 0
				var_225_30.localEulerAngles = var_225_38
			end

			local var_225_39 = arg_222_1.actors_["1048ui_story"]
			local var_225_40 = 0

			if var_225_40 < arg_222_1.time_ and arg_222_1.time_ <= var_225_40 + arg_225_0 and arg_222_1.var_.characterEffect1048ui_story == nil then
				arg_222_1.var_.characterEffect1048ui_story = var_225_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_225_41 = 0.200000002980232

			if var_225_40 <= arg_222_1.time_ and arg_222_1.time_ < var_225_40 + var_225_41 then
				local var_225_42 = (arg_222_1.time_ - var_225_40) / var_225_41

				if arg_222_1.var_.characterEffect1048ui_story then
					local var_225_43 = Mathf.Lerp(0, 0.5, var_225_42)

					arg_222_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_222_1.var_.characterEffect1048ui_story.fillRatio = var_225_43
				end
			end

			if arg_222_1.time_ >= var_225_40 + var_225_41 and arg_222_1.time_ < var_225_40 + var_225_41 + arg_225_0 and arg_222_1.var_.characterEffect1048ui_story then
				local var_225_44 = 0.5

				arg_222_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_222_1.var_.characterEffect1048ui_story.fillRatio = var_225_44
			end

			local var_225_45 = 0
			local var_225_46 = 0.45

			if var_225_45 < arg_222_1.time_ and arg_222_1.time_ <= var_225_45 + arg_225_0 then
				arg_222_1.talkMaxDuration = 0
				arg_222_1.dialogCg_.alpha = 1

				arg_222_1.dialog_:SetActive(true)
				SetActive(arg_222_1.leftNameGo_, true)

				local var_225_47 = arg_222_1:FormatText(StoryNameCfg[28].name)

				arg_222_1.leftNameTxt_.text = var_225_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_222_1.leftNameTxt_.transform)

				arg_222_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_222_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_222_1:RecordName(arg_222_1.leftNameTxt_.text)
				SetActive(arg_222_1.iconTrs_.gameObject, false)
				arg_222_1.callingController_:SetSelectedState("normal")

				local var_225_48 = arg_222_1:GetWordFromCfg(910601054)
				local var_225_49 = arg_222_1:FormatText(var_225_48.content)

				arg_222_1.text_.text = var_225_49

				LuaForUtil.ClearLinePrefixSymbol(arg_222_1.text_)

				local var_225_50 = 18
				local var_225_51 = utf8.len(var_225_49)
				local var_225_52 = var_225_50 <= 0 and var_225_46 or var_225_46 * (var_225_51 / var_225_50)

				if var_225_52 > 0 and var_225_46 < var_225_52 then
					arg_222_1.talkMaxDuration = var_225_52

					if var_225_52 + var_225_45 > arg_222_1.duration_ then
						arg_222_1.duration_ = var_225_52 + var_225_45
					end
				end

				arg_222_1.text_.text = var_225_49
				arg_222_1.typewritter.percent = 0

				arg_222_1.typewritter:SetDirty()
				arg_222_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601054", "story_v_out_910601.awb") ~= 0 then
					local var_225_53 = manager.audio:GetVoiceLength("story_v_out_910601", "910601054", "story_v_out_910601.awb") / 1000

					if var_225_53 + var_225_45 > arg_222_1.duration_ then
						arg_222_1.duration_ = var_225_53 + var_225_45
					end

					if var_225_48.prefab_name ~= "" and arg_222_1.actors_[var_225_48.prefab_name] ~= nil then
						local var_225_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_222_1.actors_[var_225_48.prefab_name].transform, "story_v_out_910601", "910601054", "story_v_out_910601.awb")

						arg_222_1:RecordAudio("910601054", var_225_54)
						arg_222_1:RecordAudio("910601054", var_225_54)
					else
						arg_222_1:AudioAction("play", "voice", "story_v_out_910601", "910601054", "story_v_out_910601.awb")
					end

					arg_222_1:RecordHistoryTalkVoice("story_v_out_910601", "910601054", "story_v_out_910601.awb")
				end

				arg_222_1:RecordContent(arg_222_1.text_.text)
			end

			local var_225_55 = math.max(var_225_46, arg_222_1.talkMaxDuration)

			if var_225_45 <= arg_222_1.time_ and arg_222_1.time_ < var_225_45 + var_225_55 then
				arg_222_1.typewritter.percent = (arg_222_1.time_ - var_225_45) / var_225_55

				arg_222_1.typewritter:SetDirty()
			end

			if arg_222_1.time_ >= var_225_45 + var_225_55 and arg_222_1.time_ < var_225_45 + var_225_55 + arg_225_0 then
				arg_222_1.typewritter.percent = 1

				arg_222_1.typewritter:SetDirty()
				arg_222_1:ShowNextGo(true)
			end
		end
	end,
	Play910601055 = function(arg_226_0, arg_226_1)
		arg_226_1.time_ = 0
		arg_226_1.frameCnt_ = 0
		arg_226_1.state_ = "playing"
		arg_226_1.curTalkId_ = 910601055
		arg_226_1.duration_ = 5

		SetActive(arg_226_1.tipsGo_, false)

		function arg_226_1.onSingleLineFinish_()
			arg_226_1.onSingleLineUpdate_ = nil
			arg_226_1.onSingleLineFinish_ = nil
			arg_226_1.state_ = "waiting"
		end

		function arg_226_1.playNext_(arg_228_0)
			if arg_228_0 == 1 then
				arg_226_0:Play910601056(arg_226_1)
			end
		end

		function arg_226_1.onSingleLineUpdate_(arg_229_0)
			local var_229_0 = arg_226_1.actors_["1059ui_story"]
			local var_229_1 = 0

			if var_229_1 < arg_226_1.time_ and arg_226_1.time_ <= var_229_1 + arg_229_0 and arg_226_1.var_.characterEffect1059ui_story == nil then
				arg_226_1.var_.characterEffect1059ui_story = var_229_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_229_2 = 0.200000002980232

			if var_229_1 <= arg_226_1.time_ and arg_226_1.time_ < var_229_1 + var_229_2 then
				local var_229_3 = (arg_226_1.time_ - var_229_1) / var_229_2

				if arg_226_1.var_.characterEffect1059ui_story then
					local var_229_4 = Mathf.Lerp(0, 0.5, var_229_3)

					arg_226_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_226_1.var_.characterEffect1059ui_story.fillRatio = var_229_4
				end
			end

			if arg_226_1.time_ >= var_229_1 + var_229_2 and arg_226_1.time_ < var_229_1 + var_229_2 + arg_229_0 and arg_226_1.var_.characterEffect1059ui_story then
				local var_229_5 = 0.5

				arg_226_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_226_1.var_.characterEffect1059ui_story.fillRatio = var_229_5
			end

			local var_229_6 = 0
			local var_229_7 = 0.375

			if var_229_6 < arg_226_1.time_ and arg_226_1.time_ <= var_229_6 + arg_229_0 then
				arg_226_1.talkMaxDuration = 0
				arg_226_1.dialogCg_.alpha = 1

				arg_226_1.dialog_:SetActive(true)
				SetActive(arg_226_1.leftNameGo_, true)

				local var_229_8 = arg_226_1:FormatText(StoryNameCfg[7].name)

				arg_226_1.leftNameTxt_.text = var_229_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_226_1.leftNameTxt_.transform)

				arg_226_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_226_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_226_1:RecordName(arg_226_1.leftNameTxt_.text)
				SetActive(arg_226_1.iconTrs_.gameObject, false)
				arg_226_1.callingController_:SetSelectedState("normal")

				local var_229_9 = arg_226_1:GetWordFromCfg(910601055)
				local var_229_10 = arg_226_1:FormatText(var_229_9.content)

				arg_226_1.text_.text = var_229_10

				LuaForUtil.ClearLinePrefixSymbol(arg_226_1.text_)

				local var_229_11 = 15
				local var_229_12 = utf8.len(var_229_10)
				local var_229_13 = var_229_11 <= 0 and var_229_7 or var_229_7 * (var_229_12 / var_229_11)

				if var_229_13 > 0 and var_229_7 < var_229_13 then
					arg_226_1.talkMaxDuration = var_229_13

					if var_229_13 + var_229_6 > arg_226_1.duration_ then
						arg_226_1.duration_ = var_229_13 + var_229_6
					end
				end

				arg_226_1.text_.text = var_229_10
				arg_226_1.typewritter.percent = 0

				arg_226_1.typewritter:SetDirty()
				arg_226_1:ShowNextGo(false)
				arg_226_1:RecordContent(arg_226_1.text_.text)
			end

			local var_229_14 = math.max(var_229_7, arg_226_1.talkMaxDuration)

			if var_229_6 <= arg_226_1.time_ and arg_226_1.time_ < var_229_6 + var_229_14 then
				arg_226_1.typewritter.percent = (arg_226_1.time_ - var_229_6) / var_229_14

				arg_226_1.typewritter:SetDirty()
			end

			if arg_226_1.time_ >= var_229_6 + var_229_14 and arg_226_1.time_ < var_229_6 + var_229_14 + arg_229_0 then
				arg_226_1.typewritter.percent = 1

				arg_226_1.typewritter:SetDirty()
				arg_226_1:ShowNextGo(true)
			end
		end
	end,
	Play910601056 = function(arg_230_0, arg_230_1)
		arg_230_1.time_ = 0
		arg_230_1.frameCnt_ = 0
		arg_230_1.state_ = "playing"
		arg_230_1.curTalkId_ = 910601056
		arg_230_1.duration_ = 5

		SetActive(arg_230_1.tipsGo_, false)

		function arg_230_1.onSingleLineFinish_()
			arg_230_1.onSingleLineUpdate_ = nil
			arg_230_1.onSingleLineFinish_ = nil
			arg_230_1.state_ = "waiting"
		end

		function arg_230_1.playNext_(arg_232_0)
			if arg_232_0 == 1 then
				arg_230_0:Play910601057(arg_230_1)
			end
		end

		function arg_230_1.onSingleLineUpdate_(arg_233_0)
			local var_233_0 = arg_230_1.actors_["1059ui_story"].transform
			local var_233_1 = 0

			if var_233_1 < arg_230_1.time_ and arg_230_1.time_ <= var_233_1 + arg_233_0 then
				arg_230_1.var_.moveOldPos1059ui_story = var_233_0.localPosition
			end

			local var_233_2 = 0.001

			if var_233_1 <= arg_230_1.time_ and arg_230_1.time_ < var_233_1 + var_233_2 then
				local var_233_3 = (arg_230_1.time_ - var_233_1) / var_233_2
				local var_233_4 = Vector3.New(0, 100, 0)

				var_233_0.localPosition = Vector3.Lerp(arg_230_1.var_.moveOldPos1059ui_story, var_233_4, var_233_3)

				local var_233_5 = manager.ui.mainCamera.transform.position - var_233_0.position

				var_233_0.forward = Vector3.New(var_233_5.x, var_233_5.y, var_233_5.z)

				local var_233_6 = var_233_0.localEulerAngles

				var_233_6.z = 0
				var_233_6.x = 0
				var_233_0.localEulerAngles = var_233_6
			end

			if arg_230_1.time_ >= var_233_1 + var_233_2 and arg_230_1.time_ < var_233_1 + var_233_2 + arg_233_0 then
				var_233_0.localPosition = Vector3.New(0, 100, 0)

				local var_233_7 = manager.ui.mainCamera.transform.position - var_233_0.position

				var_233_0.forward = Vector3.New(var_233_7.x, var_233_7.y, var_233_7.z)

				local var_233_8 = var_233_0.localEulerAngles

				var_233_8.z = 0
				var_233_8.x = 0
				var_233_0.localEulerAngles = var_233_8
			end

			local var_233_9 = 0
			local var_233_10 = 1.075

			if var_233_9 < arg_230_1.time_ and arg_230_1.time_ <= var_233_9 + arg_233_0 then
				arg_230_1.talkMaxDuration = 0
				arg_230_1.dialogCg_.alpha = 1

				arg_230_1.dialog_:SetActive(true)
				SetActive(arg_230_1.leftNameGo_, true)

				local var_233_11 = arg_230_1:FormatText(StoryNameCfg[7].name)

				arg_230_1.leftNameTxt_.text = var_233_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_230_1.leftNameTxt_.transform)

				arg_230_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_230_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_230_1:RecordName(arg_230_1.leftNameTxt_.text)
				SetActive(arg_230_1.iconTrs_.gameObject, false)
				arg_230_1.callingController_:SetSelectedState("normal")

				local var_233_12 = arg_230_1:GetWordFromCfg(910601056)
				local var_233_13 = arg_230_1:FormatText(var_233_12.content)

				arg_230_1.text_.text = var_233_13

				LuaForUtil.ClearLinePrefixSymbol(arg_230_1.text_)

				local var_233_14 = 43
				local var_233_15 = utf8.len(var_233_13)
				local var_233_16 = var_233_14 <= 0 and var_233_10 or var_233_10 * (var_233_15 / var_233_14)

				if var_233_16 > 0 and var_233_10 < var_233_16 then
					arg_230_1.talkMaxDuration = var_233_16

					if var_233_16 + var_233_9 > arg_230_1.duration_ then
						arg_230_1.duration_ = var_233_16 + var_233_9
					end
				end

				arg_230_1.text_.text = var_233_13
				arg_230_1.typewritter.percent = 0

				arg_230_1.typewritter:SetDirty()
				arg_230_1:ShowNextGo(false)
				arg_230_1:RecordContent(arg_230_1.text_.text)
			end

			local var_233_17 = math.max(var_233_10, arg_230_1.talkMaxDuration)

			if var_233_9 <= arg_230_1.time_ and arg_230_1.time_ < var_233_9 + var_233_17 then
				arg_230_1.typewritter.percent = (arg_230_1.time_ - var_233_9) / var_233_17

				arg_230_1.typewritter:SetDirty()
			end

			if arg_230_1.time_ >= var_233_9 + var_233_17 and arg_230_1.time_ < var_233_9 + var_233_17 + arg_233_0 then
				arg_230_1.typewritter.percent = 1

				arg_230_1.typewritter:SetDirty()
				arg_230_1:ShowNextGo(true)
			end
		end
	end,
	Play910601057 = function(arg_234_0, arg_234_1)
		arg_234_1.time_ = 0
		arg_234_1.frameCnt_ = 0
		arg_234_1.state_ = "playing"
		arg_234_1.curTalkId_ = 910601057
		arg_234_1.duration_ = 5.73

		SetActive(arg_234_1.tipsGo_, false)

		function arg_234_1.onSingleLineFinish_()
			arg_234_1.onSingleLineUpdate_ = nil
			arg_234_1.onSingleLineFinish_ = nil
			arg_234_1.state_ = "waiting"
		end

		function arg_234_1.playNext_(arg_236_0)
			if arg_236_0 == 1 then
				arg_234_0:Play910601058(arg_234_1)
			end
		end

		function arg_234_1.onSingleLineUpdate_(arg_237_0)
			local var_237_0 = arg_234_1.actors_["1048ui_story"].transform
			local var_237_1 = 0

			if var_237_1 < arg_234_1.time_ and arg_234_1.time_ <= var_237_1 + arg_237_0 then
				arg_234_1.var_.moveOldPos1048ui_story = var_237_0.localPosition
			end

			local var_237_2 = 0.001

			if var_237_1 <= arg_234_1.time_ and arg_234_1.time_ < var_237_1 + var_237_2 then
				local var_237_3 = (arg_234_1.time_ - var_237_1) / var_237_2
				local var_237_4 = Vector3.New(0, -0.8, -6.2)

				var_237_0.localPosition = Vector3.Lerp(arg_234_1.var_.moveOldPos1048ui_story, var_237_4, var_237_3)

				local var_237_5 = manager.ui.mainCamera.transform.position - var_237_0.position

				var_237_0.forward = Vector3.New(var_237_5.x, var_237_5.y, var_237_5.z)

				local var_237_6 = var_237_0.localEulerAngles

				var_237_6.z = 0
				var_237_6.x = 0
				var_237_0.localEulerAngles = var_237_6
			end

			if arg_234_1.time_ >= var_237_1 + var_237_2 and arg_234_1.time_ < var_237_1 + var_237_2 + arg_237_0 then
				var_237_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_237_7 = manager.ui.mainCamera.transform.position - var_237_0.position

				var_237_0.forward = Vector3.New(var_237_7.x, var_237_7.y, var_237_7.z)

				local var_237_8 = var_237_0.localEulerAngles

				var_237_8.z = 0
				var_237_8.x = 0
				var_237_0.localEulerAngles = var_237_8
			end

			local var_237_9 = arg_234_1.actors_["1048ui_story"]
			local var_237_10 = 0

			if var_237_10 < arg_234_1.time_ and arg_234_1.time_ <= var_237_10 + arg_237_0 and arg_234_1.var_.characterEffect1048ui_story == nil then
				arg_234_1.var_.characterEffect1048ui_story = var_237_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_237_11 = 0.200000002980232

			if var_237_10 <= arg_234_1.time_ and arg_234_1.time_ < var_237_10 + var_237_11 then
				local var_237_12 = (arg_234_1.time_ - var_237_10) / var_237_11

				if arg_234_1.var_.characterEffect1048ui_story then
					arg_234_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_234_1.time_ >= var_237_10 + var_237_11 and arg_234_1.time_ < var_237_10 + var_237_11 + arg_237_0 and arg_234_1.var_.characterEffect1048ui_story then
				arg_234_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_237_13 = 0

			if var_237_13 < arg_234_1.time_ and arg_234_1.time_ <= var_237_13 + arg_237_0 then
				arg_234_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action5_1")
			end

			local var_237_14 = 0

			if var_237_14 < arg_234_1.time_ and arg_234_1.time_ <= var_237_14 + arg_237_0 then
				arg_234_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_237_15 = 0
			local var_237_16 = 0.6

			if var_237_15 < arg_234_1.time_ and arg_234_1.time_ <= var_237_15 + arg_237_0 then
				arg_234_1.talkMaxDuration = 0
				arg_234_1.dialogCg_.alpha = 1

				arg_234_1.dialog_:SetActive(true)
				SetActive(arg_234_1.leftNameGo_, true)

				local var_237_17 = arg_234_1:FormatText(StoryNameCfg[8].name)

				arg_234_1.leftNameTxt_.text = var_237_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_234_1.leftNameTxt_.transform)

				arg_234_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_234_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_234_1:RecordName(arg_234_1.leftNameTxt_.text)
				SetActive(arg_234_1.iconTrs_.gameObject, false)
				arg_234_1.callingController_:SetSelectedState("normal")

				local var_237_18 = arg_234_1:GetWordFromCfg(910601057)
				local var_237_19 = arg_234_1:FormatText(var_237_18.content)

				arg_234_1.text_.text = var_237_19

				LuaForUtil.ClearLinePrefixSymbol(arg_234_1.text_)

				local var_237_20 = 24
				local var_237_21 = utf8.len(var_237_19)
				local var_237_22 = var_237_20 <= 0 and var_237_16 or var_237_16 * (var_237_21 / var_237_20)

				if var_237_22 > 0 and var_237_16 < var_237_22 then
					arg_234_1.talkMaxDuration = var_237_22

					if var_237_22 + var_237_15 > arg_234_1.duration_ then
						arg_234_1.duration_ = var_237_22 + var_237_15
					end
				end

				arg_234_1.text_.text = var_237_19
				arg_234_1.typewritter.percent = 0

				arg_234_1.typewritter:SetDirty()
				arg_234_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601057", "story_v_out_910601.awb") ~= 0 then
					local var_237_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601057", "story_v_out_910601.awb") / 1000

					if var_237_23 + var_237_15 > arg_234_1.duration_ then
						arg_234_1.duration_ = var_237_23 + var_237_15
					end

					if var_237_18.prefab_name ~= "" and arg_234_1.actors_[var_237_18.prefab_name] ~= nil then
						local var_237_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_234_1.actors_[var_237_18.prefab_name].transform, "story_v_out_910601", "910601057", "story_v_out_910601.awb")

						arg_234_1:RecordAudio("910601057", var_237_24)
						arg_234_1:RecordAudio("910601057", var_237_24)
					else
						arg_234_1:AudioAction("play", "voice", "story_v_out_910601", "910601057", "story_v_out_910601.awb")
					end

					arg_234_1:RecordHistoryTalkVoice("story_v_out_910601", "910601057", "story_v_out_910601.awb")
				end

				arg_234_1:RecordContent(arg_234_1.text_.text)
			end

			local var_237_25 = math.max(var_237_16, arg_234_1.talkMaxDuration)

			if var_237_15 <= arg_234_1.time_ and arg_234_1.time_ < var_237_15 + var_237_25 then
				arg_234_1.typewritter.percent = (arg_234_1.time_ - var_237_15) / var_237_25

				arg_234_1.typewritter:SetDirty()
			end

			if arg_234_1.time_ >= var_237_15 + var_237_25 and arg_234_1.time_ < var_237_15 + var_237_25 + arg_237_0 then
				arg_234_1.typewritter.percent = 1

				arg_234_1.typewritter:SetDirty()
				arg_234_1:ShowNextGo(true)
			end
		end
	end,
	Play910601058 = function(arg_238_0, arg_238_1)
		arg_238_1.time_ = 0
		arg_238_1.frameCnt_ = 0
		arg_238_1.state_ = "playing"
		arg_238_1.curTalkId_ = 910601058
		arg_238_1.duration_ = 5

		SetActive(arg_238_1.tipsGo_, false)

		function arg_238_1.onSingleLineFinish_()
			arg_238_1.onSingleLineUpdate_ = nil
			arg_238_1.onSingleLineFinish_ = nil
			arg_238_1.state_ = "waiting"
		end

		function arg_238_1.playNext_(arg_240_0)
			if arg_240_0 == 1 then
				arg_238_0:Play910601059(arg_238_1)
			end
		end

		function arg_238_1.onSingleLineUpdate_(arg_241_0)
			local var_241_0 = arg_238_1.actors_["1048ui_story"]
			local var_241_1 = 0

			if var_241_1 < arg_238_1.time_ and arg_238_1.time_ <= var_241_1 + arg_241_0 and arg_238_1.var_.characterEffect1048ui_story == nil then
				arg_238_1.var_.characterEffect1048ui_story = var_241_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_241_2 = 0.200000002980232

			if var_241_1 <= arg_238_1.time_ and arg_238_1.time_ < var_241_1 + var_241_2 then
				local var_241_3 = (arg_238_1.time_ - var_241_1) / var_241_2

				if arg_238_1.var_.characterEffect1048ui_story then
					local var_241_4 = Mathf.Lerp(0, 0.5, var_241_3)

					arg_238_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_238_1.var_.characterEffect1048ui_story.fillRatio = var_241_4
				end
			end

			if arg_238_1.time_ >= var_241_1 + var_241_2 and arg_238_1.time_ < var_241_1 + var_241_2 + arg_241_0 and arg_238_1.var_.characterEffect1048ui_story then
				local var_241_5 = 0.5

				arg_238_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_238_1.var_.characterEffect1048ui_story.fillRatio = var_241_5
			end

			local var_241_6 = 0
			local var_241_7 = 0.4

			if var_241_6 < arg_238_1.time_ and arg_238_1.time_ <= var_241_6 + arg_241_0 then
				arg_238_1.talkMaxDuration = 0
				arg_238_1.dialogCg_.alpha = 1

				arg_238_1.dialog_:SetActive(true)
				SetActive(arg_238_1.leftNameGo_, false)

				arg_238_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_238_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_238_1:RecordName(arg_238_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_238_1.iconTrs_.gameObject, false)
				arg_238_1.callingController_:SetSelectedState("normal")

				local var_241_8 = arg_238_1:GetWordFromCfg(910601058)
				local var_241_9 = arg_238_1:FormatText(var_241_8.content)

				arg_238_1.text_.text = var_241_9

				LuaForUtil.ClearLinePrefixSymbol(arg_238_1.text_)

				local var_241_10 = 16
				local var_241_11 = utf8.len(var_241_9)
				local var_241_12 = var_241_10 <= 0 and var_241_7 or var_241_7 * (var_241_11 / var_241_10)

				if var_241_12 > 0 and var_241_7 < var_241_12 then
					arg_238_1.talkMaxDuration = var_241_12

					if var_241_12 + var_241_6 > arg_238_1.duration_ then
						arg_238_1.duration_ = var_241_12 + var_241_6
					end
				end

				arg_238_1.text_.text = var_241_9
				arg_238_1.typewritter.percent = 0

				arg_238_1.typewritter:SetDirty()
				arg_238_1:ShowNextGo(false)
				arg_238_1:RecordContent(arg_238_1.text_.text)
			end

			local var_241_13 = math.max(var_241_7, arg_238_1.talkMaxDuration)

			if var_241_6 <= arg_238_1.time_ and arg_238_1.time_ < var_241_6 + var_241_13 then
				arg_238_1.typewritter.percent = (arg_238_1.time_ - var_241_6) / var_241_13

				arg_238_1.typewritter:SetDirty()
			end

			if arg_238_1.time_ >= var_241_6 + var_241_13 and arg_238_1.time_ < var_241_6 + var_241_13 + arg_241_0 then
				arg_238_1.typewritter.percent = 1

				arg_238_1.typewritter:SetDirty()
				arg_238_1:ShowNextGo(true)
			end
		end
	end,
	Play910601059 = function(arg_242_0, arg_242_1)
		arg_242_1.time_ = 0
		arg_242_1.frameCnt_ = 0
		arg_242_1.state_ = "playing"
		arg_242_1.curTalkId_ = 910601059
		arg_242_1.duration_ = 5

		SetActive(arg_242_1.tipsGo_, false)

		function arg_242_1.onSingleLineFinish_()
			arg_242_1.onSingleLineUpdate_ = nil
			arg_242_1.onSingleLineFinish_ = nil
			arg_242_1.state_ = "waiting"
		end

		function arg_242_1.playNext_(arg_244_0)
			if arg_244_0 == 1 then
				arg_242_0:Play910601060(arg_242_1)
			end
		end

		function arg_242_1.onSingleLineUpdate_(arg_245_0)
			local var_245_0 = 0
			local var_245_1 = 0.275

			if var_245_0 < arg_242_1.time_ and arg_242_1.time_ <= var_245_0 + arg_245_0 then
				arg_242_1.talkMaxDuration = 0
				arg_242_1.dialogCg_.alpha = 1

				arg_242_1.dialog_:SetActive(true)
				SetActive(arg_242_1.leftNameGo_, true)

				local var_245_2 = arg_242_1:FormatText(StoryNameCfg[7].name)

				arg_242_1.leftNameTxt_.text = var_245_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_242_1.leftNameTxt_.transform)

				arg_242_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_242_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_242_1:RecordName(arg_242_1.leftNameTxt_.text)
				SetActive(arg_242_1.iconTrs_.gameObject, false)
				arg_242_1.callingController_:SetSelectedState("normal")

				local var_245_3 = arg_242_1:GetWordFromCfg(910601059)
				local var_245_4 = arg_242_1:FormatText(var_245_3.content)

				arg_242_1.text_.text = var_245_4

				LuaForUtil.ClearLinePrefixSymbol(arg_242_1.text_)

				local var_245_5 = 11
				local var_245_6 = utf8.len(var_245_4)
				local var_245_7 = var_245_5 <= 0 and var_245_1 or var_245_1 * (var_245_6 / var_245_5)

				if var_245_7 > 0 and var_245_1 < var_245_7 then
					arg_242_1.talkMaxDuration = var_245_7

					if var_245_7 + var_245_0 > arg_242_1.duration_ then
						arg_242_1.duration_ = var_245_7 + var_245_0
					end
				end

				arg_242_1.text_.text = var_245_4
				arg_242_1.typewritter.percent = 0

				arg_242_1.typewritter:SetDirty()
				arg_242_1:ShowNextGo(false)
				arg_242_1:RecordContent(arg_242_1.text_.text)
			end

			local var_245_8 = math.max(var_245_1, arg_242_1.talkMaxDuration)

			if var_245_0 <= arg_242_1.time_ and arg_242_1.time_ < var_245_0 + var_245_8 then
				arg_242_1.typewritter.percent = (arg_242_1.time_ - var_245_0) / var_245_8

				arg_242_1.typewritter:SetDirty()
			end

			if arg_242_1.time_ >= var_245_0 + var_245_8 and arg_242_1.time_ < var_245_0 + var_245_8 + arg_245_0 then
				arg_242_1.typewritter.percent = 1

				arg_242_1.typewritter:SetDirty()
				arg_242_1:ShowNextGo(true)
			end
		end
	end,
	Play910601060 = function(arg_246_0, arg_246_1)
		arg_246_1.time_ = 0
		arg_246_1.frameCnt_ = 0
		arg_246_1.state_ = "playing"
		arg_246_1.curTalkId_ = 910601060
		arg_246_1.duration_ = 7.73

		SetActive(arg_246_1.tipsGo_, false)

		function arg_246_1.onSingleLineFinish_()
			arg_246_1.onSingleLineUpdate_ = nil
			arg_246_1.onSingleLineFinish_ = nil
			arg_246_1.state_ = "waiting"
		end

		function arg_246_1.playNext_(arg_248_0)
			if arg_248_0 == 1 then
				arg_246_0:Play910601061(arg_246_1)
			end
		end

		function arg_246_1.onSingleLineUpdate_(arg_249_0)
			local var_249_0 = arg_246_1.actors_["1048ui_story"].transform
			local var_249_1 = 0

			if var_249_1 < arg_246_1.time_ and arg_246_1.time_ <= var_249_1 + arg_249_0 then
				arg_246_1.var_.moveOldPos1048ui_story = var_249_0.localPosition
			end

			local var_249_2 = 0.001

			if var_249_1 <= arg_246_1.time_ and arg_246_1.time_ < var_249_1 + var_249_2 then
				local var_249_3 = (arg_246_1.time_ - var_249_1) / var_249_2
				local var_249_4 = Vector3.New(0, -0.8, -6.2)

				var_249_0.localPosition = Vector3.Lerp(arg_246_1.var_.moveOldPos1048ui_story, var_249_4, var_249_3)

				local var_249_5 = manager.ui.mainCamera.transform.position - var_249_0.position

				var_249_0.forward = Vector3.New(var_249_5.x, var_249_5.y, var_249_5.z)

				local var_249_6 = var_249_0.localEulerAngles

				var_249_6.z = 0
				var_249_6.x = 0
				var_249_0.localEulerAngles = var_249_6
			end

			if arg_246_1.time_ >= var_249_1 + var_249_2 and arg_246_1.time_ < var_249_1 + var_249_2 + arg_249_0 then
				var_249_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_249_7 = manager.ui.mainCamera.transform.position - var_249_0.position

				var_249_0.forward = Vector3.New(var_249_7.x, var_249_7.y, var_249_7.z)

				local var_249_8 = var_249_0.localEulerAngles

				var_249_8.z = 0
				var_249_8.x = 0
				var_249_0.localEulerAngles = var_249_8
			end

			local var_249_9 = arg_246_1.actors_["1048ui_story"]
			local var_249_10 = 0

			if var_249_10 < arg_246_1.time_ and arg_246_1.time_ <= var_249_10 + arg_249_0 and arg_246_1.var_.characterEffect1048ui_story == nil then
				arg_246_1.var_.characterEffect1048ui_story = var_249_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_249_11 = 0.200000002980232

			if var_249_10 <= arg_246_1.time_ and arg_246_1.time_ < var_249_10 + var_249_11 then
				local var_249_12 = (arg_246_1.time_ - var_249_10) / var_249_11

				if arg_246_1.var_.characterEffect1048ui_story then
					arg_246_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_246_1.time_ >= var_249_10 + var_249_11 and arg_246_1.time_ < var_249_10 + var_249_11 + arg_249_0 and arg_246_1.var_.characterEffect1048ui_story then
				arg_246_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_249_13 = 0

			if var_249_13 < arg_246_1.time_ and arg_246_1.time_ <= var_249_13 + arg_249_0 then
				arg_246_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_249_14 = 0
			local var_249_15 = 0.95

			if var_249_14 < arg_246_1.time_ and arg_246_1.time_ <= var_249_14 + arg_249_0 then
				arg_246_1.talkMaxDuration = 0
				arg_246_1.dialogCg_.alpha = 1

				arg_246_1.dialog_:SetActive(true)
				SetActive(arg_246_1.leftNameGo_, true)

				local var_249_16 = arg_246_1:FormatText(StoryNameCfg[8].name)

				arg_246_1.leftNameTxt_.text = var_249_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_246_1.leftNameTxt_.transform)

				arg_246_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_246_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_246_1:RecordName(arg_246_1.leftNameTxt_.text)
				SetActive(arg_246_1.iconTrs_.gameObject, false)
				arg_246_1.callingController_:SetSelectedState("normal")

				local var_249_17 = arg_246_1:GetWordFromCfg(910601060)
				local var_249_18 = arg_246_1:FormatText(var_249_17.content)

				arg_246_1.text_.text = var_249_18

				LuaForUtil.ClearLinePrefixSymbol(arg_246_1.text_)

				local var_249_19 = 38
				local var_249_20 = utf8.len(var_249_18)
				local var_249_21 = var_249_19 <= 0 and var_249_15 or var_249_15 * (var_249_20 / var_249_19)

				if var_249_21 > 0 and var_249_15 < var_249_21 then
					arg_246_1.talkMaxDuration = var_249_21

					if var_249_21 + var_249_14 > arg_246_1.duration_ then
						arg_246_1.duration_ = var_249_21 + var_249_14
					end
				end

				arg_246_1.text_.text = var_249_18
				arg_246_1.typewritter.percent = 0

				arg_246_1.typewritter:SetDirty()
				arg_246_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601060", "story_v_out_910601.awb") ~= 0 then
					local var_249_22 = manager.audio:GetVoiceLength("story_v_out_910601", "910601060", "story_v_out_910601.awb") / 1000

					if var_249_22 + var_249_14 > arg_246_1.duration_ then
						arg_246_1.duration_ = var_249_22 + var_249_14
					end

					if var_249_17.prefab_name ~= "" and arg_246_1.actors_[var_249_17.prefab_name] ~= nil then
						local var_249_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_246_1.actors_[var_249_17.prefab_name].transform, "story_v_out_910601", "910601060", "story_v_out_910601.awb")

						arg_246_1:RecordAudio("910601060", var_249_23)
						arg_246_1:RecordAudio("910601060", var_249_23)
					else
						arg_246_1:AudioAction("play", "voice", "story_v_out_910601", "910601060", "story_v_out_910601.awb")
					end

					arg_246_1:RecordHistoryTalkVoice("story_v_out_910601", "910601060", "story_v_out_910601.awb")
				end

				arg_246_1:RecordContent(arg_246_1.text_.text)
			end

			local var_249_24 = math.max(var_249_15, arg_246_1.talkMaxDuration)

			if var_249_14 <= arg_246_1.time_ and arg_246_1.time_ < var_249_14 + var_249_24 then
				arg_246_1.typewritter.percent = (arg_246_1.time_ - var_249_14) / var_249_24

				arg_246_1.typewritter:SetDirty()
			end

			if arg_246_1.time_ >= var_249_14 + var_249_24 and arg_246_1.time_ < var_249_14 + var_249_24 + arg_249_0 then
				arg_246_1.typewritter.percent = 1

				arg_246_1.typewritter:SetDirty()
				arg_246_1:ShowNextGo(true)
			end
		end
	end,
	Play910601061 = function(arg_250_0, arg_250_1)
		arg_250_1.time_ = 0
		arg_250_1.frameCnt_ = 0
		arg_250_1.state_ = "playing"
		arg_250_1.curTalkId_ = 910601061
		arg_250_1.duration_ = 5

		SetActive(arg_250_1.tipsGo_, false)

		function arg_250_1.onSingleLineFinish_()
			arg_250_1.onSingleLineUpdate_ = nil
			arg_250_1.onSingleLineFinish_ = nil
			arg_250_1.state_ = "waiting"
		end

		function arg_250_1.playNext_(arg_252_0)
			if arg_252_0 == 1 then
				arg_250_0:Play910601062(arg_250_1)
			end
		end

		function arg_250_1.onSingleLineUpdate_(arg_253_0)
			local var_253_0 = arg_250_1.actors_["1048ui_story"]
			local var_253_1 = 0

			if var_253_1 < arg_250_1.time_ and arg_250_1.time_ <= var_253_1 + arg_253_0 and arg_250_1.var_.characterEffect1048ui_story == nil then
				arg_250_1.var_.characterEffect1048ui_story = var_253_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_253_2 = 0.200000002980232

			if var_253_1 <= arg_250_1.time_ and arg_250_1.time_ < var_253_1 + var_253_2 then
				local var_253_3 = (arg_250_1.time_ - var_253_1) / var_253_2

				if arg_250_1.var_.characterEffect1048ui_story then
					local var_253_4 = Mathf.Lerp(0, 0.5, var_253_3)

					arg_250_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_250_1.var_.characterEffect1048ui_story.fillRatio = var_253_4
				end
			end

			if arg_250_1.time_ >= var_253_1 + var_253_2 and arg_250_1.time_ < var_253_1 + var_253_2 + arg_253_0 and arg_250_1.var_.characterEffect1048ui_story then
				local var_253_5 = 0.5

				arg_250_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_250_1.var_.characterEffect1048ui_story.fillRatio = var_253_5
			end

			local var_253_6 = 0
			local var_253_7 = 0.55

			if var_253_6 < arg_250_1.time_ and arg_250_1.time_ <= var_253_6 + arg_253_0 then
				arg_250_1.talkMaxDuration = 0
				arg_250_1.dialogCg_.alpha = 1

				arg_250_1.dialog_:SetActive(true)
				SetActive(arg_250_1.leftNameGo_, false)

				arg_250_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_250_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_250_1:RecordName(arg_250_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_250_1.iconTrs_.gameObject, false)
				arg_250_1.callingController_:SetSelectedState("normal")

				local var_253_8 = arg_250_1:GetWordFromCfg(910601061)
				local var_253_9 = arg_250_1:FormatText(var_253_8.content)

				arg_250_1.text_.text = var_253_9

				LuaForUtil.ClearLinePrefixSymbol(arg_250_1.text_)

				local var_253_10 = 22
				local var_253_11 = utf8.len(var_253_9)
				local var_253_12 = var_253_10 <= 0 and var_253_7 or var_253_7 * (var_253_11 / var_253_10)

				if var_253_12 > 0 and var_253_7 < var_253_12 then
					arg_250_1.talkMaxDuration = var_253_12

					if var_253_12 + var_253_6 > arg_250_1.duration_ then
						arg_250_1.duration_ = var_253_12 + var_253_6
					end
				end

				arg_250_1.text_.text = var_253_9
				arg_250_1.typewritter.percent = 0

				arg_250_1.typewritter:SetDirty()
				arg_250_1:ShowNextGo(false)
				arg_250_1:RecordContent(arg_250_1.text_.text)
			end

			local var_253_13 = math.max(var_253_7, arg_250_1.talkMaxDuration)

			if var_253_6 <= arg_250_1.time_ and arg_250_1.time_ < var_253_6 + var_253_13 then
				arg_250_1.typewritter.percent = (arg_250_1.time_ - var_253_6) / var_253_13

				arg_250_1.typewritter:SetDirty()
			end

			if arg_250_1.time_ >= var_253_6 + var_253_13 and arg_250_1.time_ < var_253_6 + var_253_13 + arg_253_0 then
				arg_250_1.typewritter.percent = 1

				arg_250_1.typewritter:SetDirty()
				arg_250_1:ShowNextGo(true)
			end
		end
	end,
	Play910601062 = function(arg_254_0, arg_254_1)
		arg_254_1.time_ = 0
		arg_254_1.frameCnt_ = 0
		arg_254_1.state_ = "playing"
		arg_254_1.curTalkId_ = 910601062
		arg_254_1.duration_ = 2.47

		SetActive(arg_254_1.tipsGo_, false)

		function arg_254_1.onSingleLineFinish_()
			arg_254_1.onSingleLineUpdate_ = nil
			arg_254_1.onSingleLineFinish_ = nil
			arg_254_1.state_ = "waiting"
		end

		function arg_254_1.playNext_(arg_256_0)
			if arg_256_0 == 1 then
				arg_254_0:Play910601063(arg_254_1)
			end
		end

		function arg_254_1.onSingleLineUpdate_(arg_257_0)
			local var_257_0 = arg_254_1.actors_["1048ui_story"].transform
			local var_257_1 = 0

			if var_257_1 < arg_254_1.time_ and arg_254_1.time_ <= var_257_1 + arg_257_0 then
				arg_254_1.var_.moveOldPos1048ui_story = var_257_0.localPosition
			end

			local var_257_2 = 0.001

			if var_257_1 <= arg_254_1.time_ and arg_254_1.time_ < var_257_1 + var_257_2 then
				local var_257_3 = (arg_254_1.time_ - var_257_1) / var_257_2
				local var_257_4 = Vector3.New(0, -0.8, -6.2)

				var_257_0.localPosition = Vector3.Lerp(arg_254_1.var_.moveOldPos1048ui_story, var_257_4, var_257_3)

				local var_257_5 = manager.ui.mainCamera.transform.position - var_257_0.position

				var_257_0.forward = Vector3.New(var_257_5.x, var_257_5.y, var_257_5.z)

				local var_257_6 = var_257_0.localEulerAngles

				var_257_6.z = 0
				var_257_6.x = 0
				var_257_0.localEulerAngles = var_257_6
			end

			if arg_254_1.time_ >= var_257_1 + var_257_2 and arg_254_1.time_ < var_257_1 + var_257_2 + arg_257_0 then
				var_257_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_257_7 = manager.ui.mainCamera.transform.position - var_257_0.position

				var_257_0.forward = Vector3.New(var_257_7.x, var_257_7.y, var_257_7.z)

				local var_257_8 = var_257_0.localEulerAngles

				var_257_8.z = 0
				var_257_8.x = 0
				var_257_0.localEulerAngles = var_257_8
			end

			local var_257_9 = arg_254_1.actors_["1048ui_story"]
			local var_257_10 = 0

			if var_257_10 < arg_254_1.time_ and arg_254_1.time_ <= var_257_10 + arg_257_0 and arg_254_1.var_.characterEffect1048ui_story == nil then
				arg_254_1.var_.characterEffect1048ui_story = var_257_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_257_11 = 0.200000002980232

			if var_257_10 <= arg_254_1.time_ and arg_254_1.time_ < var_257_10 + var_257_11 then
				local var_257_12 = (arg_254_1.time_ - var_257_10) / var_257_11

				if arg_254_1.var_.characterEffect1048ui_story then
					arg_254_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_254_1.time_ >= var_257_10 + var_257_11 and arg_254_1.time_ < var_257_10 + var_257_11 + arg_257_0 and arg_254_1.var_.characterEffect1048ui_story then
				arg_254_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_257_13 = 0

			if var_257_13 < arg_254_1.time_ and arg_254_1.time_ <= var_257_13 + arg_257_0 then
				arg_254_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048actionlink/1048action453")
			end

			local var_257_14 = 0

			if var_257_14 < arg_254_1.time_ and arg_254_1.time_ <= var_257_14 + arg_257_0 then
				arg_254_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_257_15 = 0
			local var_257_16 = 0.275

			if var_257_15 < arg_254_1.time_ and arg_254_1.time_ <= var_257_15 + arg_257_0 then
				arg_254_1.talkMaxDuration = 0
				arg_254_1.dialogCg_.alpha = 1

				arg_254_1.dialog_:SetActive(true)
				SetActive(arg_254_1.leftNameGo_, true)

				local var_257_17 = arg_254_1:FormatText(StoryNameCfg[8].name)

				arg_254_1.leftNameTxt_.text = var_257_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_254_1.leftNameTxt_.transform)

				arg_254_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_254_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_254_1:RecordName(arg_254_1.leftNameTxt_.text)
				SetActive(arg_254_1.iconTrs_.gameObject, false)
				arg_254_1.callingController_:SetSelectedState("normal")

				local var_257_18 = arg_254_1:GetWordFromCfg(910601062)
				local var_257_19 = arg_254_1:FormatText(var_257_18.content)

				arg_254_1.text_.text = var_257_19

				LuaForUtil.ClearLinePrefixSymbol(arg_254_1.text_)

				local var_257_20 = 11
				local var_257_21 = utf8.len(var_257_19)
				local var_257_22 = var_257_20 <= 0 and var_257_16 or var_257_16 * (var_257_21 / var_257_20)

				if var_257_22 > 0 and var_257_16 < var_257_22 then
					arg_254_1.talkMaxDuration = var_257_22

					if var_257_22 + var_257_15 > arg_254_1.duration_ then
						arg_254_1.duration_ = var_257_22 + var_257_15
					end
				end

				arg_254_1.text_.text = var_257_19
				arg_254_1.typewritter.percent = 0

				arg_254_1.typewritter:SetDirty()
				arg_254_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601062", "story_v_out_910601.awb") ~= 0 then
					local var_257_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601062", "story_v_out_910601.awb") / 1000

					if var_257_23 + var_257_15 > arg_254_1.duration_ then
						arg_254_1.duration_ = var_257_23 + var_257_15
					end

					if var_257_18.prefab_name ~= "" and arg_254_1.actors_[var_257_18.prefab_name] ~= nil then
						local var_257_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_254_1.actors_[var_257_18.prefab_name].transform, "story_v_out_910601", "910601062", "story_v_out_910601.awb")

						arg_254_1:RecordAudio("910601062", var_257_24)
						arg_254_1:RecordAudio("910601062", var_257_24)
					else
						arg_254_1:AudioAction("play", "voice", "story_v_out_910601", "910601062", "story_v_out_910601.awb")
					end

					arg_254_1:RecordHistoryTalkVoice("story_v_out_910601", "910601062", "story_v_out_910601.awb")
				end

				arg_254_1:RecordContent(arg_254_1.text_.text)
			end

			local var_257_25 = math.max(var_257_16, arg_254_1.talkMaxDuration)

			if var_257_15 <= arg_254_1.time_ and arg_254_1.time_ < var_257_15 + var_257_25 then
				arg_254_1.typewritter.percent = (arg_254_1.time_ - var_257_15) / var_257_25

				arg_254_1.typewritter:SetDirty()
			end

			if arg_254_1.time_ >= var_257_15 + var_257_25 and arg_254_1.time_ < var_257_15 + var_257_25 + arg_257_0 then
				arg_254_1.typewritter.percent = 1

				arg_254_1.typewritter:SetDirty()
				arg_254_1:ShowNextGo(true)
			end
		end
	end,
	Play910601063 = function(arg_258_0, arg_258_1)
		arg_258_1.time_ = 0
		arg_258_1.frameCnt_ = 0
		arg_258_1.state_ = "playing"
		arg_258_1.curTalkId_ = 910601063
		arg_258_1.duration_ = 5

		SetActive(arg_258_1.tipsGo_, false)

		function arg_258_1.onSingleLineFinish_()
			arg_258_1.onSingleLineUpdate_ = nil
			arg_258_1.onSingleLineFinish_ = nil
			arg_258_1.state_ = "waiting"
		end

		function arg_258_1.playNext_(arg_260_0)
			if arg_260_0 == 1 then
				arg_258_0:Play910601064(arg_258_1)
			end
		end

		function arg_258_1.onSingleLineUpdate_(arg_261_0)
			local var_261_0 = arg_258_1.actors_["1048ui_story"]
			local var_261_1 = 0

			if var_261_1 < arg_258_1.time_ and arg_258_1.time_ <= var_261_1 + arg_261_0 and arg_258_1.var_.characterEffect1048ui_story == nil then
				arg_258_1.var_.characterEffect1048ui_story = var_261_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_261_2 = 0.200000002980232

			if var_261_1 <= arg_258_1.time_ and arg_258_1.time_ < var_261_1 + var_261_2 then
				local var_261_3 = (arg_258_1.time_ - var_261_1) / var_261_2

				if arg_258_1.var_.characterEffect1048ui_story then
					local var_261_4 = Mathf.Lerp(0, 0.5, var_261_3)

					arg_258_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_258_1.var_.characterEffect1048ui_story.fillRatio = var_261_4
				end
			end

			if arg_258_1.time_ >= var_261_1 + var_261_2 and arg_258_1.time_ < var_261_1 + var_261_2 + arg_261_0 and arg_258_1.var_.characterEffect1048ui_story then
				local var_261_5 = 0.5

				arg_258_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_258_1.var_.characterEffect1048ui_story.fillRatio = var_261_5
			end

			local var_261_6 = 0
			local var_261_7 = 0.05

			if var_261_6 < arg_258_1.time_ and arg_258_1.time_ <= var_261_6 + arg_261_0 then
				arg_258_1.talkMaxDuration = 0
				arg_258_1.dialogCg_.alpha = 1

				arg_258_1.dialog_:SetActive(true)
				SetActive(arg_258_1.leftNameGo_, true)

				local var_261_8 = arg_258_1:FormatText(StoryNameCfg[7].name)

				arg_258_1.leftNameTxt_.text = var_261_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_258_1.leftNameTxt_.transform)

				arg_258_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_258_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_258_1:RecordName(arg_258_1.leftNameTxt_.text)
				SetActive(arg_258_1.iconTrs_.gameObject, false)
				arg_258_1.callingController_:SetSelectedState("normal")

				local var_261_9 = arg_258_1:GetWordFromCfg(910601063)
				local var_261_10 = arg_258_1:FormatText(var_261_9.content)

				arg_258_1.text_.text = var_261_10

				LuaForUtil.ClearLinePrefixSymbol(arg_258_1.text_)

				local var_261_11 = 2
				local var_261_12 = utf8.len(var_261_10)
				local var_261_13 = var_261_11 <= 0 and var_261_7 or var_261_7 * (var_261_12 / var_261_11)

				if var_261_13 > 0 and var_261_7 < var_261_13 then
					arg_258_1.talkMaxDuration = var_261_13

					if var_261_13 + var_261_6 > arg_258_1.duration_ then
						arg_258_1.duration_ = var_261_13 + var_261_6
					end
				end

				arg_258_1.text_.text = var_261_10
				arg_258_1.typewritter.percent = 0

				arg_258_1.typewritter:SetDirty()
				arg_258_1:ShowNextGo(false)
				arg_258_1:RecordContent(arg_258_1.text_.text)
			end

			local var_261_14 = math.max(var_261_7, arg_258_1.talkMaxDuration)

			if var_261_6 <= arg_258_1.time_ and arg_258_1.time_ < var_261_6 + var_261_14 then
				arg_258_1.typewritter.percent = (arg_258_1.time_ - var_261_6) / var_261_14

				arg_258_1.typewritter:SetDirty()
			end

			if arg_258_1.time_ >= var_261_6 + var_261_14 and arg_258_1.time_ < var_261_6 + var_261_14 + arg_261_0 then
				arg_258_1.typewritter.percent = 1

				arg_258_1.typewritter:SetDirty()
				arg_258_1:ShowNextGo(true)
			end
		end
	end,
	Play910601064 = function(arg_262_0, arg_262_1)
		arg_262_1.time_ = 0
		arg_262_1.frameCnt_ = 0
		arg_262_1.state_ = "playing"
		arg_262_1.curTalkId_ = 910601064
		arg_262_1.duration_ = 5

		SetActive(arg_262_1.tipsGo_, false)

		function arg_262_1.onSingleLineFinish_()
			arg_262_1.onSingleLineUpdate_ = nil
			arg_262_1.onSingleLineFinish_ = nil
			arg_262_1.state_ = "waiting"
		end

		function arg_262_1.playNext_(arg_264_0)
			if arg_264_0 == 1 then
				arg_262_0:Play910601065(arg_262_1)
			end
		end

		function arg_262_1.onSingleLineUpdate_(arg_265_0)
			local var_265_0 = 0
			local var_265_1 = 0.4

			if var_265_0 < arg_262_1.time_ and arg_262_1.time_ <= var_265_0 + arg_265_0 then
				arg_262_1.talkMaxDuration = 0
				arg_262_1.dialogCg_.alpha = 1

				arg_262_1.dialog_:SetActive(true)
				SetActive(arg_262_1.leftNameGo_, true)

				local var_265_2 = arg_262_1:FormatText(StoryNameCfg[7].name)

				arg_262_1.leftNameTxt_.text = var_265_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_262_1.leftNameTxt_.transform)

				arg_262_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_262_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_262_1:RecordName(arg_262_1.leftNameTxt_.text)
				SetActive(arg_262_1.iconTrs_.gameObject, false)
				arg_262_1.callingController_:SetSelectedState("normal")

				local var_265_3 = arg_262_1:GetWordFromCfg(910601064)
				local var_265_4 = arg_262_1:FormatText(var_265_3.content)

				arg_262_1.text_.text = var_265_4

				LuaForUtil.ClearLinePrefixSymbol(arg_262_1.text_)

				local var_265_5 = 16
				local var_265_6 = utf8.len(var_265_4)
				local var_265_7 = var_265_5 <= 0 and var_265_1 or var_265_1 * (var_265_6 / var_265_5)

				if var_265_7 > 0 and var_265_1 < var_265_7 then
					arg_262_1.talkMaxDuration = var_265_7

					if var_265_7 + var_265_0 > arg_262_1.duration_ then
						arg_262_1.duration_ = var_265_7 + var_265_0
					end
				end

				arg_262_1.text_.text = var_265_4
				arg_262_1.typewritter.percent = 0

				arg_262_1.typewritter:SetDirty()
				arg_262_1:ShowNextGo(false)
				arg_262_1:RecordContent(arg_262_1.text_.text)
			end

			local var_265_8 = math.max(var_265_1, arg_262_1.talkMaxDuration)

			if var_265_0 <= arg_262_1.time_ and arg_262_1.time_ < var_265_0 + var_265_8 then
				arg_262_1.typewritter.percent = (arg_262_1.time_ - var_265_0) / var_265_8

				arg_262_1.typewritter:SetDirty()
			end

			if arg_262_1.time_ >= var_265_0 + var_265_8 and arg_262_1.time_ < var_265_0 + var_265_8 + arg_265_0 then
				arg_262_1.typewritter.percent = 1

				arg_262_1.typewritter:SetDirty()
				arg_262_1:ShowNextGo(true)
			end
		end
	end,
	Play910601065 = function(arg_266_0, arg_266_1)
		arg_266_1.time_ = 0
		arg_266_1.frameCnt_ = 0
		arg_266_1.state_ = "playing"
		arg_266_1.curTalkId_ = 910601065
		arg_266_1.duration_ = 5

		SetActive(arg_266_1.tipsGo_, false)

		function arg_266_1.onSingleLineFinish_()
			arg_266_1.onSingleLineUpdate_ = nil
			arg_266_1.onSingleLineFinish_ = nil
			arg_266_1.state_ = "waiting"
		end

		function arg_266_1.playNext_(arg_268_0)
			if arg_268_0 == 1 then
				arg_266_0:Play910601066(arg_266_1)
			end
		end

		function arg_266_1.onSingleLineUpdate_(arg_269_0)
			local var_269_0 = 0
			local var_269_1 = 0.725

			if var_269_0 < arg_266_1.time_ and arg_266_1.time_ <= var_269_0 + arg_269_0 then
				arg_266_1.talkMaxDuration = 0
				arg_266_1.dialogCg_.alpha = 1

				arg_266_1.dialog_:SetActive(true)
				SetActive(arg_266_1.leftNameGo_, false)

				arg_266_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_266_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_266_1:RecordName(arg_266_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_266_1.iconTrs_.gameObject, false)
				arg_266_1.callingController_:SetSelectedState("normal")

				local var_269_2 = arg_266_1:GetWordFromCfg(910601065)
				local var_269_3 = arg_266_1:FormatText(var_269_2.content)

				arg_266_1.text_.text = var_269_3

				LuaForUtil.ClearLinePrefixSymbol(arg_266_1.text_)

				local var_269_4 = 29
				local var_269_5 = utf8.len(var_269_3)
				local var_269_6 = var_269_4 <= 0 and var_269_1 or var_269_1 * (var_269_5 / var_269_4)

				if var_269_6 > 0 and var_269_1 < var_269_6 then
					arg_266_1.talkMaxDuration = var_269_6

					if var_269_6 + var_269_0 > arg_266_1.duration_ then
						arg_266_1.duration_ = var_269_6 + var_269_0
					end
				end

				arg_266_1.text_.text = var_269_3
				arg_266_1.typewritter.percent = 0

				arg_266_1.typewritter:SetDirty()
				arg_266_1:ShowNextGo(false)
				arg_266_1:RecordContent(arg_266_1.text_.text)
			end

			local var_269_7 = math.max(var_269_1, arg_266_1.talkMaxDuration)

			if var_269_0 <= arg_266_1.time_ and arg_266_1.time_ < var_269_0 + var_269_7 then
				arg_266_1.typewritter.percent = (arg_266_1.time_ - var_269_0) / var_269_7

				arg_266_1.typewritter:SetDirty()
			end

			if arg_266_1.time_ >= var_269_0 + var_269_7 and arg_266_1.time_ < var_269_0 + var_269_7 + arg_269_0 then
				arg_266_1.typewritter.percent = 1

				arg_266_1.typewritter:SetDirty()
				arg_266_1:ShowNextGo(true)
			end
		end
	end,
	Play910601066 = function(arg_270_0, arg_270_1)
		arg_270_1.time_ = 0
		arg_270_1.frameCnt_ = 0
		arg_270_1.state_ = "playing"
		arg_270_1.curTalkId_ = 910601066
		arg_270_1.duration_ = 6.8

		SetActive(arg_270_1.tipsGo_, false)

		function arg_270_1.onSingleLineFinish_()
			arg_270_1.onSingleLineUpdate_ = nil
			arg_270_1.onSingleLineFinish_ = nil
			arg_270_1.state_ = "waiting"
		end

		function arg_270_1.playNext_(arg_272_0)
			if arg_272_0 == 1 then
				arg_270_0:Play910601067(arg_270_1)
			end
		end

		function arg_270_1.onSingleLineUpdate_(arg_273_0)
			local var_273_0 = arg_270_1.actors_["1028ui_story"].transform
			local var_273_1 = 0

			if var_273_1 < arg_270_1.time_ and arg_270_1.time_ <= var_273_1 + arg_273_0 then
				arg_270_1.var_.moveOldPos1028ui_story = var_273_0.localPosition
			end

			local var_273_2 = 0.001

			if var_273_1 <= arg_270_1.time_ and arg_270_1.time_ < var_273_1 + var_273_2 then
				local var_273_3 = (arg_270_1.time_ - var_273_1) / var_273_2
				local var_273_4 = Vector3.New(0.7, -0.9, -5.9)

				var_273_0.localPosition = Vector3.Lerp(arg_270_1.var_.moveOldPos1028ui_story, var_273_4, var_273_3)

				local var_273_5 = manager.ui.mainCamera.transform.position - var_273_0.position

				var_273_0.forward = Vector3.New(var_273_5.x, var_273_5.y, var_273_5.z)

				local var_273_6 = var_273_0.localEulerAngles

				var_273_6.z = 0
				var_273_6.x = 0
				var_273_0.localEulerAngles = var_273_6
			end

			if arg_270_1.time_ >= var_273_1 + var_273_2 and arg_270_1.time_ < var_273_1 + var_273_2 + arg_273_0 then
				var_273_0.localPosition = Vector3.New(0.7, -0.9, -5.9)

				local var_273_7 = manager.ui.mainCamera.transform.position - var_273_0.position

				var_273_0.forward = Vector3.New(var_273_7.x, var_273_7.y, var_273_7.z)

				local var_273_8 = var_273_0.localEulerAngles

				var_273_8.z = 0
				var_273_8.x = 0
				var_273_0.localEulerAngles = var_273_8
			end

			local var_273_9 = arg_270_1.actors_["1028ui_story"]
			local var_273_10 = 0

			if var_273_10 < arg_270_1.time_ and arg_270_1.time_ <= var_273_10 + arg_273_0 and arg_270_1.var_.characterEffect1028ui_story == nil then
				arg_270_1.var_.characterEffect1028ui_story = var_273_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_273_11 = 0.200000002980232

			if var_273_10 <= arg_270_1.time_ and arg_270_1.time_ < var_273_10 + var_273_11 then
				local var_273_12 = (arg_270_1.time_ - var_273_10) / var_273_11

				if arg_270_1.var_.characterEffect1028ui_story then
					arg_270_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_270_1.time_ >= var_273_10 + var_273_11 and arg_270_1.time_ < var_273_10 + var_273_11 + arg_273_0 and arg_270_1.var_.characterEffect1028ui_story then
				arg_270_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_273_13 = 0

			if var_273_13 < arg_270_1.time_ and arg_270_1.time_ <= var_273_13 + arg_273_0 then
				arg_270_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action5_1")
			end

			local var_273_14 = 0

			if var_273_14 < arg_270_1.time_ and arg_270_1.time_ <= var_273_14 + arg_273_0 then
				arg_270_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_273_15 = arg_270_1.actors_["1048ui_story"].transform
			local var_273_16 = 0

			if var_273_16 < arg_270_1.time_ and arg_270_1.time_ <= var_273_16 + arg_273_0 then
				arg_270_1.var_.moveOldPos1048ui_story = var_273_15.localPosition
			end

			local var_273_17 = 0.001

			if var_273_16 <= arg_270_1.time_ and arg_270_1.time_ < var_273_16 + var_273_17 then
				local var_273_18 = (arg_270_1.time_ - var_273_16) / var_273_17
				local var_273_19 = Vector3.New(-0.7, -0.8, -6.2)

				var_273_15.localPosition = Vector3.Lerp(arg_270_1.var_.moveOldPos1048ui_story, var_273_19, var_273_18)

				local var_273_20 = manager.ui.mainCamera.transform.position - var_273_15.position

				var_273_15.forward = Vector3.New(var_273_20.x, var_273_20.y, var_273_20.z)

				local var_273_21 = var_273_15.localEulerAngles

				var_273_21.z = 0
				var_273_21.x = 0
				var_273_15.localEulerAngles = var_273_21
			end

			if arg_270_1.time_ >= var_273_16 + var_273_17 and arg_270_1.time_ < var_273_16 + var_273_17 + arg_273_0 then
				var_273_15.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_273_22 = manager.ui.mainCamera.transform.position - var_273_15.position

				var_273_15.forward = Vector3.New(var_273_22.x, var_273_22.y, var_273_22.z)

				local var_273_23 = var_273_15.localEulerAngles

				var_273_23.z = 0
				var_273_23.x = 0
				var_273_15.localEulerAngles = var_273_23
			end

			local var_273_24 = arg_270_1.actors_["1048ui_story"]
			local var_273_25 = 0

			if var_273_25 < arg_270_1.time_ and arg_270_1.time_ <= var_273_25 + arg_273_0 and arg_270_1.var_.characterEffect1048ui_story == nil then
				arg_270_1.var_.characterEffect1048ui_story = var_273_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_273_26 = 0.200000002980232

			if var_273_25 <= arg_270_1.time_ and arg_270_1.time_ < var_273_25 + var_273_26 then
				local var_273_27 = (arg_270_1.time_ - var_273_25) / var_273_26

				if arg_270_1.var_.characterEffect1048ui_story then
					local var_273_28 = Mathf.Lerp(0, 0.5, var_273_27)

					arg_270_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_270_1.var_.characterEffect1048ui_story.fillRatio = var_273_28
				end
			end

			if arg_270_1.time_ >= var_273_25 + var_273_26 and arg_270_1.time_ < var_273_25 + var_273_26 + arg_273_0 and arg_270_1.var_.characterEffect1048ui_story then
				local var_273_29 = 0.5

				arg_270_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_270_1.var_.characterEffect1048ui_story.fillRatio = var_273_29
			end

			local var_273_30 = 0

			if var_273_30 < arg_270_1.time_ and arg_270_1.time_ <= var_273_30 + arg_273_0 then
				arg_270_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_2")
			end

			local var_273_31 = 0
			local var_273_32 = 0.625

			if var_273_31 < arg_270_1.time_ and arg_270_1.time_ <= var_273_31 + arg_273_0 then
				arg_270_1.talkMaxDuration = 0
				arg_270_1.dialogCg_.alpha = 1

				arg_270_1.dialog_:SetActive(true)
				SetActive(arg_270_1.leftNameGo_, true)

				local var_273_33 = arg_270_1:FormatText(StoryNameCfg[327].name)

				arg_270_1.leftNameTxt_.text = var_273_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_270_1.leftNameTxt_.transform)

				arg_270_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_270_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_270_1:RecordName(arg_270_1.leftNameTxt_.text)
				SetActive(arg_270_1.iconTrs_.gameObject, false)
				arg_270_1.callingController_:SetSelectedState("normal")

				local var_273_34 = arg_270_1:GetWordFromCfg(910601066)
				local var_273_35 = arg_270_1:FormatText(var_273_34.content)

				arg_270_1.text_.text = var_273_35

				LuaForUtil.ClearLinePrefixSymbol(arg_270_1.text_)

				local var_273_36 = 25
				local var_273_37 = utf8.len(var_273_35)
				local var_273_38 = var_273_36 <= 0 and var_273_32 or var_273_32 * (var_273_37 / var_273_36)

				if var_273_38 > 0 and var_273_32 < var_273_38 then
					arg_270_1.talkMaxDuration = var_273_38

					if var_273_38 + var_273_31 > arg_270_1.duration_ then
						arg_270_1.duration_ = var_273_38 + var_273_31
					end
				end

				arg_270_1.text_.text = var_273_35
				arg_270_1.typewritter.percent = 0

				arg_270_1.typewritter:SetDirty()
				arg_270_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601066", "story_v_out_910601.awb") ~= 0 then
					local var_273_39 = manager.audio:GetVoiceLength("story_v_out_910601", "910601066", "story_v_out_910601.awb") / 1000

					if var_273_39 + var_273_31 > arg_270_1.duration_ then
						arg_270_1.duration_ = var_273_39 + var_273_31
					end

					if var_273_34.prefab_name ~= "" and arg_270_1.actors_[var_273_34.prefab_name] ~= nil then
						local var_273_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_270_1.actors_[var_273_34.prefab_name].transform, "story_v_out_910601", "910601066", "story_v_out_910601.awb")

						arg_270_1:RecordAudio("910601066", var_273_40)
						arg_270_1:RecordAudio("910601066", var_273_40)
					else
						arg_270_1:AudioAction("play", "voice", "story_v_out_910601", "910601066", "story_v_out_910601.awb")
					end

					arg_270_1:RecordHistoryTalkVoice("story_v_out_910601", "910601066", "story_v_out_910601.awb")
				end

				arg_270_1:RecordContent(arg_270_1.text_.text)
			end

			local var_273_41 = math.max(var_273_32, arg_270_1.talkMaxDuration)

			if var_273_31 <= arg_270_1.time_ and arg_270_1.time_ < var_273_31 + var_273_41 then
				arg_270_1.typewritter.percent = (arg_270_1.time_ - var_273_31) / var_273_41

				arg_270_1.typewritter:SetDirty()
			end

			if arg_270_1.time_ >= var_273_31 + var_273_41 and arg_270_1.time_ < var_273_31 + var_273_41 + arg_273_0 then
				arg_270_1.typewritter.percent = 1

				arg_270_1.typewritter:SetDirty()
				arg_270_1:ShowNextGo(true)
			end
		end
	end,
	Play910601067 = function(arg_274_0, arg_274_1)
		arg_274_1.time_ = 0
		arg_274_1.frameCnt_ = 0
		arg_274_1.state_ = "playing"
		arg_274_1.curTalkId_ = 910601067
		arg_274_1.duration_ = 5

		SetActive(arg_274_1.tipsGo_, false)

		function arg_274_1.onSingleLineFinish_()
			arg_274_1.onSingleLineUpdate_ = nil
			arg_274_1.onSingleLineFinish_ = nil
			arg_274_1.state_ = "waiting"
		end

		function arg_274_1.playNext_(arg_276_0)
			if arg_276_0 == 1 then
				arg_274_0:Play910601068(arg_274_1)
			end
		end

		function arg_274_1.onSingleLineUpdate_(arg_277_0)
			local var_277_0 = arg_274_1.actors_["1028ui_story"]
			local var_277_1 = 0

			if var_277_1 < arg_274_1.time_ and arg_274_1.time_ <= var_277_1 + arg_277_0 and arg_274_1.var_.characterEffect1028ui_story == nil then
				arg_274_1.var_.characterEffect1028ui_story = var_277_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_277_2 = 0.200000002980232

			if var_277_1 <= arg_274_1.time_ and arg_274_1.time_ < var_277_1 + var_277_2 then
				local var_277_3 = (arg_274_1.time_ - var_277_1) / var_277_2

				if arg_274_1.var_.characterEffect1028ui_story then
					local var_277_4 = Mathf.Lerp(0, 0.5, var_277_3)

					arg_274_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_274_1.var_.characterEffect1028ui_story.fillRatio = var_277_4
				end
			end

			if arg_274_1.time_ >= var_277_1 + var_277_2 and arg_274_1.time_ < var_277_1 + var_277_2 + arg_277_0 and arg_274_1.var_.characterEffect1028ui_story then
				local var_277_5 = 0.5

				arg_274_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_274_1.var_.characterEffect1028ui_story.fillRatio = var_277_5
			end

			local var_277_6 = 0
			local var_277_7 = 1.325

			if var_277_6 < arg_274_1.time_ and arg_274_1.time_ <= var_277_6 + arg_277_0 then
				arg_274_1.talkMaxDuration = 0
				arg_274_1.dialogCg_.alpha = 1

				arg_274_1.dialog_:SetActive(true)
				SetActive(arg_274_1.leftNameGo_, false)

				arg_274_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_274_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_274_1:RecordName(arg_274_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_274_1.iconTrs_.gameObject, false)
				arg_274_1.callingController_:SetSelectedState("normal")

				local var_277_8 = arg_274_1:GetWordFromCfg(910601067)
				local var_277_9 = arg_274_1:FormatText(var_277_8.content)

				arg_274_1.text_.text = var_277_9

				LuaForUtil.ClearLinePrefixSymbol(arg_274_1.text_)

				local var_277_10 = 53
				local var_277_11 = utf8.len(var_277_9)
				local var_277_12 = var_277_10 <= 0 and var_277_7 or var_277_7 * (var_277_11 / var_277_10)

				if var_277_12 > 0 and var_277_7 < var_277_12 then
					arg_274_1.talkMaxDuration = var_277_12

					if var_277_12 + var_277_6 > arg_274_1.duration_ then
						arg_274_1.duration_ = var_277_12 + var_277_6
					end
				end

				arg_274_1.text_.text = var_277_9
				arg_274_1.typewritter.percent = 0

				arg_274_1.typewritter:SetDirty()
				arg_274_1:ShowNextGo(false)
				arg_274_1:RecordContent(arg_274_1.text_.text)
			end

			local var_277_13 = math.max(var_277_7, arg_274_1.talkMaxDuration)

			if var_277_6 <= arg_274_1.time_ and arg_274_1.time_ < var_277_6 + var_277_13 then
				arg_274_1.typewritter.percent = (arg_274_1.time_ - var_277_6) / var_277_13

				arg_274_1.typewritter:SetDirty()
			end

			if arg_274_1.time_ >= var_277_6 + var_277_13 and arg_274_1.time_ < var_277_6 + var_277_13 + arg_277_0 then
				arg_274_1.typewritter.percent = 1

				arg_274_1.typewritter:SetDirty()
				arg_274_1:ShowNextGo(true)
			end
		end
	end,
	Play910601068 = function(arg_278_0, arg_278_1)
		arg_278_1.time_ = 0
		arg_278_1.frameCnt_ = 0
		arg_278_1.state_ = "playing"
		arg_278_1.curTalkId_ = 910601068
		arg_278_1.duration_ = 1

		SetActive(arg_278_1.tipsGo_, false)

		function arg_278_1.onSingleLineFinish_()
			arg_278_1.onSingleLineUpdate_ = nil
			arg_278_1.onSingleLineFinish_ = nil
			arg_278_1.state_ = "waiting"

			SetActive(arg_278_1.choicesGo_, true)

			for iter_279_0, iter_279_1 in ipairs(arg_278_1.choices_) do
				local var_279_0 = iter_279_0 <= 2

				SetActive(iter_279_1.go, var_279_0)
			end

			arg_278_1.choices_[1].txt.text = arg_278_1:FormatText(StoryChoiceCfg[692].name)
			arg_278_1.choices_[2].txt.text = arg_278_1:FormatText(StoryChoiceCfg[693].name)
		end

		function arg_278_1.playNext_(arg_280_0)
			if arg_280_0 == 1 then
				arg_278_0:Play910601069(arg_278_1)
			end

			if arg_280_0 == 2 then
				arg_278_0:Play910601072(arg_278_1)
			end
		end

		function arg_278_1.onSingleLineUpdate_(arg_281_0)
			local var_281_0 = 0

			if var_281_0 < arg_278_1.time_ and arg_278_1.time_ <= var_281_0 + arg_281_0 then
				arg_278_1.allBtn_.enabled = false
			end

			local var_281_1 = 0.5

			if arg_278_1.time_ >= var_281_0 + var_281_1 and arg_278_1.time_ < var_281_0 + var_281_1 + arg_281_0 then
				arg_278_1.allBtn_.enabled = true
			end

			local var_281_2 = arg_278_1.actors_["1028ui_story"].transform
			local var_281_3 = 0

			if var_281_3 < arg_278_1.time_ and arg_278_1.time_ <= var_281_3 + arg_281_0 then
				arg_278_1.var_.moveOldPos1028ui_story = var_281_2.localPosition
			end

			local var_281_4 = 0.001

			if var_281_3 <= arg_278_1.time_ and arg_278_1.time_ < var_281_3 + var_281_4 then
				local var_281_5 = (arg_278_1.time_ - var_281_3) / var_281_4
				local var_281_6 = Vector3.New(0, 100, 0)

				var_281_2.localPosition = Vector3.Lerp(arg_278_1.var_.moveOldPos1028ui_story, var_281_6, var_281_5)

				local var_281_7 = manager.ui.mainCamera.transform.position - var_281_2.position

				var_281_2.forward = Vector3.New(var_281_7.x, var_281_7.y, var_281_7.z)

				local var_281_8 = var_281_2.localEulerAngles

				var_281_8.z = 0
				var_281_8.x = 0
				var_281_2.localEulerAngles = var_281_8
			end

			if arg_278_1.time_ >= var_281_3 + var_281_4 and arg_278_1.time_ < var_281_3 + var_281_4 + arg_281_0 then
				var_281_2.localPosition = Vector3.New(0, 100, 0)

				local var_281_9 = manager.ui.mainCamera.transform.position - var_281_2.position

				var_281_2.forward = Vector3.New(var_281_9.x, var_281_9.y, var_281_9.z)

				local var_281_10 = var_281_2.localEulerAngles

				var_281_10.z = 0
				var_281_10.x = 0
				var_281_2.localEulerAngles = var_281_10
			end

			local var_281_11 = arg_278_1.actors_["1048ui_story"].transform
			local var_281_12 = 0

			if var_281_12 < arg_278_1.time_ and arg_278_1.time_ <= var_281_12 + arg_281_0 then
				arg_278_1.var_.moveOldPos1048ui_story = var_281_11.localPosition
			end

			local var_281_13 = 0.001

			if var_281_12 <= arg_278_1.time_ and arg_278_1.time_ < var_281_12 + var_281_13 then
				local var_281_14 = (arg_278_1.time_ - var_281_12) / var_281_13
				local var_281_15 = Vector3.New(0, 100, 0)

				var_281_11.localPosition = Vector3.Lerp(arg_278_1.var_.moveOldPos1048ui_story, var_281_15, var_281_14)

				local var_281_16 = manager.ui.mainCamera.transform.position - var_281_11.position

				var_281_11.forward = Vector3.New(var_281_16.x, var_281_16.y, var_281_16.z)

				local var_281_17 = var_281_11.localEulerAngles

				var_281_17.z = 0
				var_281_17.x = 0
				var_281_11.localEulerAngles = var_281_17
			end

			if arg_278_1.time_ >= var_281_12 + var_281_13 and arg_278_1.time_ < var_281_12 + var_281_13 + arg_281_0 then
				var_281_11.localPosition = Vector3.New(0, 100, 0)

				local var_281_18 = manager.ui.mainCamera.transform.position - var_281_11.position

				var_281_11.forward = Vector3.New(var_281_18.x, var_281_18.y, var_281_18.z)

				local var_281_19 = var_281_11.localEulerAngles

				var_281_19.z = 0
				var_281_19.x = 0
				var_281_11.localEulerAngles = var_281_19
			end
		end
	end,
	Play910601069 = function(arg_282_0, arg_282_1)
		arg_282_1.time_ = 0
		arg_282_1.frameCnt_ = 0
		arg_282_1.state_ = "playing"
		arg_282_1.curTalkId_ = 910601069
		arg_282_1.duration_ = 5

		SetActive(arg_282_1.tipsGo_, false)

		function arg_282_1.onSingleLineFinish_()
			arg_282_1.onSingleLineUpdate_ = nil
			arg_282_1.onSingleLineFinish_ = nil
			arg_282_1.state_ = "waiting"
		end

		function arg_282_1.playNext_(arg_284_0)
			if arg_284_0 == 1 then
				arg_282_0:Play910601070(arg_282_1)
			end
		end

		function arg_282_1.onSingleLineUpdate_(arg_285_0)
			local var_285_0 = 0
			local var_285_1 = 0.25

			if var_285_0 < arg_282_1.time_ and arg_282_1.time_ <= var_285_0 + arg_285_0 then
				arg_282_1.talkMaxDuration = 0
				arg_282_1.dialogCg_.alpha = 1

				arg_282_1.dialog_:SetActive(true)
				SetActive(arg_282_1.leftNameGo_, true)

				local var_285_2 = arg_282_1:FormatText(StoryNameCfg[7].name)

				arg_282_1.leftNameTxt_.text = var_285_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_282_1.leftNameTxt_.transform)

				arg_282_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_282_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_282_1:RecordName(arg_282_1.leftNameTxt_.text)
				SetActive(arg_282_1.iconTrs_.gameObject, false)
				arg_282_1.callingController_:SetSelectedState("normal")

				local var_285_3 = arg_282_1:GetWordFromCfg(910601069)
				local var_285_4 = arg_282_1:FormatText(var_285_3.content)

				arg_282_1.text_.text = var_285_4

				LuaForUtil.ClearLinePrefixSymbol(arg_282_1.text_)

				local var_285_5 = 10
				local var_285_6 = utf8.len(var_285_4)
				local var_285_7 = var_285_5 <= 0 and var_285_1 or var_285_1 * (var_285_6 / var_285_5)

				if var_285_7 > 0 and var_285_1 < var_285_7 then
					arg_282_1.talkMaxDuration = var_285_7

					if var_285_7 + var_285_0 > arg_282_1.duration_ then
						arg_282_1.duration_ = var_285_7 + var_285_0
					end
				end

				arg_282_1.text_.text = var_285_4
				arg_282_1.typewritter.percent = 0

				arg_282_1.typewritter:SetDirty()
				arg_282_1:ShowNextGo(false)
				arg_282_1:RecordContent(arg_282_1.text_.text)
			end

			local var_285_8 = math.max(var_285_1, arg_282_1.talkMaxDuration)

			if var_285_0 <= arg_282_1.time_ and arg_282_1.time_ < var_285_0 + var_285_8 then
				arg_282_1.typewritter.percent = (arg_282_1.time_ - var_285_0) / var_285_8

				arg_282_1.typewritter:SetDirty()
			end

			if arg_282_1.time_ >= var_285_0 + var_285_8 and arg_282_1.time_ < var_285_0 + var_285_8 + arg_285_0 then
				arg_282_1.typewritter.percent = 1

				arg_282_1.typewritter:SetDirty()
				arg_282_1:ShowNextGo(true)
			end
		end
	end,
	Play910601070 = function(arg_286_0, arg_286_1)
		arg_286_1.time_ = 0
		arg_286_1.frameCnt_ = 0
		arg_286_1.state_ = "playing"
		arg_286_1.curTalkId_ = 910601070
		arg_286_1.duration_ = 4.47

		SetActive(arg_286_1.tipsGo_, false)

		function arg_286_1.onSingleLineFinish_()
			arg_286_1.onSingleLineUpdate_ = nil
			arg_286_1.onSingleLineFinish_ = nil
			arg_286_1.state_ = "waiting"
		end

		function arg_286_1.playNext_(arg_288_0)
			if arg_288_0 == 1 then
				arg_286_0:Play910601071(arg_286_1)
			end
		end

		function arg_286_1.onSingleLineUpdate_(arg_289_0)
			local var_289_0 = arg_286_1.actors_["1048ui_story"].transform
			local var_289_1 = 0

			if var_289_1 < arg_286_1.time_ and arg_286_1.time_ <= var_289_1 + arg_289_0 then
				arg_286_1.var_.moveOldPos1048ui_story = var_289_0.localPosition
			end

			local var_289_2 = 0.001

			if var_289_1 <= arg_286_1.time_ and arg_286_1.time_ < var_289_1 + var_289_2 then
				local var_289_3 = (arg_286_1.time_ - var_289_1) / var_289_2
				local var_289_4 = Vector3.New(-0.7, -0.8, -6.2)

				var_289_0.localPosition = Vector3.Lerp(arg_286_1.var_.moveOldPos1048ui_story, var_289_4, var_289_3)

				local var_289_5 = manager.ui.mainCamera.transform.position - var_289_0.position

				var_289_0.forward = Vector3.New(var_289_5.x, var_289_5.y, var_289_5.z)

				local var_289_6 = var_289_0.localEulerAngles

				var_289_6.z = 0
				var_289_6.x = 0
				var_289_0.localEulerAngles = var_289_6
			end

			if arg_286_1.time_ >= var_289_1 + var_289_2 and arg_286_1.time_ < var_289_1 + var_289_2 + arg_289_0 then
				var_289_0.localPosition = Vector3.New(-0.7, -0.8, -6.2)

				local var_289_7 = manager.ui.mainCamera.transform.position - var_289_0.position

				var_289_0.forward = Vector3.New(var_289_7.x, var_289_7.y, var_289_7.z)

				local var_289_8 = var_289_0.localEulerAngles

				var_289_8.z = 0
				var_289_8.x = 0
				var_289_0.localEulerAngles = var_289_8
			end

			local var_289_9 = arg_286_1.actors_["1048ui_story"]
			local var_289_10 = 0

			if var_289_10 < arg_286_1.time_ and arg_286_1.time_ <= var_289_10 + arg_289_0 and arg_286_1.var_.characterEffect1048ui_story == nil then
				arg_286_1.var_.characterEffect1048ui_story = var_289_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_289_11 = 0.200000002980232

			if var_289_10 <= arg_286_1.time_ and arg_286_1.time_ < var_289_10 + var_289_11 then
				local var_289_12 = (arg_286_1.time_ - var_289_10) / var_289_11

				if arg_286_1.var_.characterEffect1048ui_story then
					arg_286_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_286_1.time_ >= var_289_10 + var_289_11 and arg_286_1.time_ < var_289_10 + var_289_11 + arg_289_0 and arg_286_1.var_.characterEffect1048ui_story then
				arg_286_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_289_13 = 0

			if var_289_13 < arg_286_1.time_ and arg_286_1.time_ <= var_289_13 + arg_289_0 then
				arg_286_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action4_1")
			end

			local var_289_14 = 0

			if var_289_14 < arg_286_1.time_ and arg_286_1.time_ <= var_289_14 + arg_289_0 then
				arg_286_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_289_15 = 0
			local var_289_16 = 0.45

			if var_289_15 < arg_286_1.time_ and arg_286_1.time_ <= var_289_15 + arg_289_0 then
				arg_286_1.talkMaxDuration = 0
				arg_286_1.dialogCg_.alpha = 1

				arg_286_1.dialog_:SetActive(true)
				SetActive(arg_286_1.leftNameGo_, true)

				local var_289_17 = arg_286_1:FormatText(StoryNameCfg[8].name)

				arg_286_1.leftNameTxt_.text = var_289_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_286_1.leftNameTxt_.transform)

				arg_286_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_286_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_286_1:RecordName(arg_286_1.leftNameTxt_.text)
				SetActive(arg_286_1.iconTrs_.gameObject, false)
				arg_286_1.callingController_:SetSelectedState("normal")

				local var_289_18 = arg_286_1:GetWordFromCfg(910601070)
				local var_289_19 = arg_286_1:FormatText(var_289_18.content)

				arg_286_1.text_.text = var_289_19

				LuaForUtil.ClearLinePrefixSymbol(arg_286_1.text_)

				local var_289_20 = 18
				local var_289_21 = utf8.len(var_289_19)
				local var_289_22 = var_289_20 <= 0 and var_289_16 or var_289_16 * (var_289_21 / var_289_20)

				if var_289_22 > 0 and var_289_16 < var_289_22 then
					arg_286_1.talkMaxDuration = var_289_22

					if var_289_22 + var_289_15 > arg_286_1.duration_ then
						arg_286_1.duration_ = var_289_22 + var_289_15
					end
				end

				arg_286_1.text_.text = var_289_19
				arg_286_1.typewritter.percent = 0

				arg_286_1.typewritter:SetDirty()
				arg_286_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601070", "story_v_out_910601.awb") ~= 0 then
					local var_289_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601070", "story_v_out_910601.awb") / 1000

					if var_289_23 + var_289_15 > arg_286_1.duration_ then
						arg_286_1.duration_ = var_289_23 + var_289_15
					end

					if var_289_18.prefab_name ~= "" and arg_286_1.actors_[var_289_18.prefab_name] ~= nil then
						local var_289_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_286_1.actors_[var_289_18.prefab_name].transform, "story_v_out_910601", "910601070", "story_v_out_910601.awb")

						arg_286_1:RecordAudio("910601070", var_289_24)
						arg_286_1:RecordAudio("910601070", var_289_24)
					else
						arg_286_1:AudioAction("play", "voice", "story_v_out_910601", "910601070", "story_v_out_910601.awb")
					end

					arg_286_1:RecordHistoryTalkVoice("story_v_out_910601", "910601070", "story_v_out_910601.awb")
				end

				arg_286_1:RecordContent(arg_286_1.text_.text)
			end

			local var_289_25 = math.max(var_289_16, arg_286_1.talkMaxDuration)

			if var_289_15 <= arg_286_1.time_ and arg_286_1.time_ < var_289_15 + var_289_25 then
				arg_286_1.typewritter.percent = (arg_286_1.time_ - var_289_15) / var_289_25

				arg_286_1.typewritter:SetDirty()
			end

			if arg_286_1.time_ >= var_289_15 + var_289_25 and arg_286_1.time_ < var_289_15 + var_289_25 + arg_289_0 then
				arg_286_1.typewritter.percent = 1

				arg_286_1.typewritter:SetDirty()
				arg_286_1:ShowNextGo(true)
			end
		end
	end,
	Play910601071 = function(arg_290_0, arg_290_1)
		arg_290_1.time_ = 0
		arg_290_1.frameCnt_ = 0
		arg_290_1.state_ = "playing"
		arg_290_1.curTalkId_ = 910601071
		arg_290_1.duration_ = 5

		SetActive(arg_290_1.tipsGo_, false)

		function arg_290_1.onSingleLineFinish_()
			arg_290_1.onSingleLineUpdate_ = nil
			arg_290_1.onSingleLineFinish_ = nil
			arg_290_1.state_ = "waiting"
		end

		function arg_290_1.playNext_(arg_292_0)
			if arg_292_0 == 1 then
				arg_290_0:Play910601075(arg_290_1)
			end
		end

		function arg_290_1.onSingleLineUpdate_(arg_293_0)
			local var_293_0 = arg_290_1.actors_["1048ui_story"]
			local var_293_1 = 0

			if var_293_1 < arg_290_1.time_ and arg_290_1.time_ <= var_293_1 + arg_293_0 and arg_290_1.var_.characterEffect1048ui_story == nil then
				arg_290_1.var_.characterEffect1048ui_story = var_293_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_293_2 = 0.200000002980232

			if var_293_1 <= arg_290_1.time_ and arg_290_1.time_ < var_293_1 + var_293_2 then
				local var_293_3 = (arg_290_1.time_ - var_293_1) / var_293_2

				if arg_290_1.var_.characterEffect1048ui_story then
					local var_293_4 = Mathf.Lerp(0, 0.5, var_293_3)

					arg_290_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_290_1.var_.characterEffect1048ui_story.fillRatio = var_293_4
				end
			end

			if arg_290_1.time_ >= var_293_1 + var_293_2 and arg_290_1.time_ < var_293_1 + var_293_2 + arg_293_0 and arg_290_1.var_.characterEffect1048ui_story then
				local var_293_5 = 0.5

				arg_290_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_290_1.var_.characterEffect1048ui_story.fillRatio = var_293_5
			end

			local var_293_6 = 0
			local var_293_7 = 0.5

			if var_293_6 < arg_290_1.time_ and arg_290_1.time_ <= var_293_6 + arg_293_0 then
				arg_290_1.talkMaxDuration = 0
				arg_290_1.dialogCg_.alpha = 1

				arg_290_1.dialog_:SetActive(true)
				SetActive(arg_290_1.leftNameGo_, true)

				local var_293_8 = arg_290_1:FormatText(StoryNameCfg[7].name)

				arg_290_1.leftNameTxt_.text = var_293_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_290_1.leftNameTxt_.transform)

				arg_290_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_290_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_290_1:RecordName(arg_290_1.leftNameTxt_.text)
				SetActive(arg_290_1.iconTrs_.gameObject, false)
				arg_290_1.callingController_:SetSelectedState("normal")

				local var_293_9 = arg_290_1:GetWordFromCfg(910601071)
				local var_293_10 = arg_290_1:FormatText(var_293_9.content)

				arg_290_1.text_.text = var_293_10

				LuaForUtil.ClearLinePrefixSymbol(arg_290_1.text_)

				local var_293_11 = 20
				local var_293_12 = utf8.len(var_293_10)
				local var_293_13 = var_293_11 <= 0 and var_293_7 or var_293_7 * (var_293_12 / var_293_11)

				if var_293_13 > 0 and var_293_7 < var_293_13 then
					arg_290_1.talkMaxDuration = var_293_13

					if var_293_13 + var_293_6 > arg_290_1.duration_ then
						arg_290_1.duration_ = var_293_13 + var_293_6
					end
				end

				arg_290_1.text_.text = var_293_10
				arg_290_1.typewritter.percent = 0

				arg_290_1.typewritter:SetDirty()
				arg_290_1:ShowNextGo(false)
				arg_290_1:RecordContent(arg_290_1.text_.text)
			end

			local var_293_14 = math.max(var_293_7, arg_290_1.talkMaxDuration)

			if var_293_6 <= arg_290_1.time_ and arg_290_1.time_ < var_293_6 + var_293_14 then
				arg_290_1.typewritter.percent = (arg_290_1.time_ - var_293_6) / var_293_14

				arg_290_1.typewritter:SetDirty()
			end

			if arg_290_1.time_ >= var_293_6 + var_293_14 and arg_290_1.time_ < var_293_6 + var_293_14 + arg_293_0 then
				arg_290_1.typewritter.percent = 1

				arg_290_1.typewritter:SetDirty()
				arg_290_1:ShowNextGo(true)
			end
		end
	end,
	Play910601075 = function(arg_294_0, arg_294_1)
		arg_294_1.time_ = 0
		arg_294_1.frameCnt_ = 0
		arg_294_1.state_ = "playing"
		arg_294_1.curTalkId_ = 910601075
		arg_294_1.duration_ = 2.33

		SetActive(arg_294_1.tipsGo_, false)

		function arg_294_1.onSingleLineFinish_()
			arg_294_1.onSingleLineUpdate_ = nil
			arg_294_1.onSingleLineFinish_ = nil
			arg_294_1.state_ = "waiting"
		end

		function arg_294_1.playNext_(arg_296_0)
			if arg_296_0 == 1 then
				arg_294_0:Play910601076(arg_294_1)
			end
		end

		function arg_294_1.onSingleLineUpdate_(arg_297_0)
			local var_297_0 = arg_294_1.actors_["1028ui_story"].transform
			local var_297_1 = 0

			if var_297_1 < arg_294_1.time_ and arg_294_1.time_ <= var_297_1 + arg_297_0 then
				arg_294_1.var_.moveOldPos1028ui_story = var_297_0.localPosition
			end

			local var_297_2 = 0.001

			if var_297_1 <= arg_294_1.time_ and arg_294_1.time_ < var_297_1 + var_297_2 then
				local var_297_3 = (arg_294_1.time_ - var_297_1) / var_297_2
				local var_297_4 = Vector3.New(0.7, -0.9, -5.9)

				var_297_0.localPosition = Vector3.Lerp(arg_294_1.var_.moveOldPos1028ui_story, var_297_4, var_297_3)

				local var_297_5 = manager.ui.mainCamera.transform.position - var_297_0.position

				var_297_0.forward = Vector3.New(var_297_5.x, var_297_5.y, var_297_5.z)

				local var_297_6 = var_297_0.localEulerAngles

				var_297_6.z = 0
				var_297_6.x = 0
				var_297_0.localEulerAngles = var_297_6
			end

			if arg_294_1.time_ >= var_297_1 + var_297_2 and arg_294_1.time_ < var_297_1 + var_297_2 + arg_297_0 then
				var_297_0.localPosition = Vector3.New(0.7, -0.9, -5.9)

				local var_297_7 = manager.ui.mainCamera.transform.position - var_297_0.position

				var_297_0.forward = Vector3.New(var_297_7.x, var_297_7.y, var_297_7.z)

				local var_297_8 = var_297_0.localEulerAngles

				var_297_8.z = 0
				var_297_8.x = 0
				var_297_0.localEulerAngles = var_297_8
			end

			local var_297_9 = arg_294_1.actors_["1028ui_story"]
			local var_297_10 = 0

			if var_297_10 < arg_294_1.time_ and arg_294_1.time_ <= var_297_10 + arg_297_0 and arg_294_1.var_.characterEffect1028ui_story == nil then
				arg_294_1.var_.characterEffect1028ui_story = var_297_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_297_11 = 0.200000002980232

			if var_297_10 <= arg_294_1.time_ and arg_294_1.time_ < var_297_10 + var_297_11 then
				local var_297_12 = (arg_294_1.time_ - var_297_10) / var_297_11

				if arg_294_1.var_.characterEffect1028ui_story then
					arg_294_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_294_1.time_ >= var_297_10 + var_297_11 and arg_294_1.time_ < var_297_10 + var_297_11 + arg_297_0 and arg_294_1.var_.characterEffect1028ui_story then
				arg_294_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_297_13 = 0

			if var_297_13 < arg_294_1.time_ and arg_294_1.time_ <= var_297_13 + arg_297_0 then
				arg_294_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_297_14 = 0

			if var_297_14 < arg_294_1.time_ and arg_294_1.time_ <= var_297_14 + arg_297_0 then
				arg_294_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_297_15 = 0
			local var_297_16 = 0.2

			if var_297_15 < arg_294_1.time_ and arg_294_1.time_ <= var_297_15 + arg_297_0 then
				arg_294_1.talkMaxDuration = 0
				arg_294_1.dialogCg_.alpha = 1

				arg_294_1.dialog_:SetActive(true)
				SetActive(arg_294_1.leftNameGo_, true)

				local var_297_17 = arg_294_1:FormatText(StoryNameCfg[327].name)

				arg_294_1.leftNameTxt_.text = var_297_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_294_1.leftNameTxt_.transform)

				arg_294_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_294_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_294_1:RecordName(arg_294_1.leftNameTxt_.text)
				SetActive(arg_294_1.iconTrs_.gameObject, false)
				arg_294_1.callingController_:SetSelectedState("normal")

				local var_297_18 = arg_294_1:GetWordFromCfg(910601075)
				local var_297_19 = arg_294_1:FormatText(var_297_18.content)

				arg_294_1.text_.text = var_297_19

				LuaForUtil.ClearLinePrefixSymbol(arg_294_1.text_)

				local var_297_20 = 8
				local var_297_21 = utf8.len(var_297_19)
				local var_297_22 = var_297_20 <= 0 and var_297_16 or var_297_16 * (var_297_21 / var_297_20)

				if var_297_22 > 0 and var_297_16 < var_297_22 then
					arg_294_1.talkMaxDuration = var_297_22

					if var_297_22 + var_297_15 > arg_294_1.duration_ then
						arg_294_1.duration_ = var_297_22 + var_297_15
					end
				end

				arg_294_1.text_.text = var_297_19
				arg_294_1.typewritter.percent = 0

				arg_294_1.typewritter:SetDirty()
				arg_294_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601075", "story_v_out_910601.awb") ~= 0 then
					local var_297_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601075", "story_v_out_910601.awb") / 1000

					if var_297_23 + var_297_15 > arg_294_1.duration_ then
						arg_294_1.duration_ = var_297_23 + var_297_15
					end

					if var_297_18.prefab_name ~= "" and arg_294_1.actors_[var_297_18.prefab_name] ~= nil then
						local var_297_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_294_1.actors_[var_297_18.prefab_name].transform, "story_v_out_910601", "910601075", "story_v_out_910601.awb")

						arg_294_1:RecordAudio("910601075", var_297_24)
						arg_294_1:RecordAudio("910601075", var_297_24)
					else
						arg_294_1:AudioAction("play", "voice", "story_v_out_910601", "910601075", "story_v_out_910601.awb")
					end

					arg_294_1:RecordHistoryTalkVoice("story_v_out_910601", "910601075", "story_v_out_910601.awb")
				end

				arg_294_1:RecordContent(arg_294_1.text_.text)
			end

			local var_297_25 = math.max(var_297_16, arg_294_1.talkMaxDuration)

			if var_297_15 <= arg_294_1.time_ and arg_294_1.time_ < var_297_15 + var_297_25 then
				arg_294_1.typewritter.percent = (arg_294_1.time_ - var_297_15) / var_297_25

				arg_294_1.typewritter:SetDirty()
			end

			if arg_294_1.time_ >= var_297_15 + var_297_25 and arg_294_1.time_ < var_297_15 + var_297_25 + arg_297_0 then
				arg_294_1.typewritter.percent = 1

				arg_294_1.typewritter:SetDirty()
				arg_294_1:ShowNextGo(true)
			end
		end
	end,
	Play910601076 = function(arg_298_0, arg_298_1)
		arg_298_1.time_ = 0
		arg_298_1.frameCnt_ = 0
		arg_298_1.state_ = "playing"
		arg_298_1.curTalkId_ = 910601076
		arg_298_1.duration_ = 5

		SetActive(arg_298_1.tipsGo_, false)

		function arg_298_1.onSingleLineFinish_()
			arg_298_1.onSingleLineUpdate_ = nil
			arg_298_1.onSingleLineFinish_ = nil
			arg_298_1.state_ = "waiting"
		end

		function arg_298_1.playNext_(arg_300_0)
			if arg_300_0 == 1 then
				arg_298_0:Play910601077(arg_298_1)
			end
		end

		function arg_298_1.onSingleLineUpdate_(arg_301_0)
			local var_301_0 = arg_298_1.actors_["1028ui_story"]
			local var_301_1 = 0

			if var_301_1 < arg_298_1.time_ and arg_298_1.time_ <= var_301_1 + arg_301_0 and arg_298_1.var_.characterEffect1028ui_story == nil then
				arg_298_1.var_.characterEffect1028ui_story = var_301_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_301_2 = 0.200000002980232

			if var_301_1 <= arg_298_1.time_ and arg_298_1.time_ < var_301_1 + var_301_2 then
				local var_301_3 = (arg_298_1.time_ - var_301_1) / var_301_2

				if arg_298_1.var_.characterEffect1028ui_story then
					local var_301_4 = Mathf.Lerp(0, 0.5, var_301_3)

					arg_298_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_298_1.var_.characterEffect1028ui_story.fillRatio = var_301_4
				end
			end

			if arg_298_1.time_ >= var_301_1 + var_301_2 and arg_298_1.time_ < var_301_1 + var_301_2 + arg_301_0 and arg_298_1.var_.characterEffect1028ui_story then
				local var_301_5 = 0.5

				arg_298_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_298_1.var_.characterEffect1028ui_story.fillRatio = var_301_5
			end

			local var_301_6 = arg_298_1.actors_["1048ui_story"].transform
			local var_301_7 = 0

			if var_301_7 < arg_298_1.time_ and arg_298_1.time_ <= var_301_7 + arg_301_0 then
				arg_298_1.var_.moveOldPos1048ui_story = var_301_6.localPosition
			end

			local var_301_8 = 0.001

			if var_301_7 <= arg_298_1.time_ and arg_298_1.time_ < var_301_7 + var_301_8 then
				local var_301_9 = (arg_298_1.time_ - var_301_7) / var_301_8
				local var_301_10 = Vector3.New(0, 100, 0)

				var_301_6.localPosition = Vector3.Lerp(arg_298_1.var_.moveOldPos1048ui_story, var_301_10, var_301_9)

				local var_301_11 = manager.ui.mainCamera.transform.position - var_301_6.position

				var_301_6.forward = Vector3.New(var_301_11.x, var_301_11.y, var_301_11.z)

				local var_301_12 = var_301_6.localEulerAngles

				var_301_12.z = 0
				var_301_12.x = 0
				var_301_6.localEulerAngles = var_301_12
			end

			if arg_298_1.time_ >= var_301_7 + var_301_8 and arg_298_1.time_ < var_301_7 + var_301_8 + arg_301_0 then
				var_301_6.localPosition = Vector3.New(0, 100, 0)

				local var_301_13 = manager.ui.mainCamera.transform.position - var_301_6.position

				var_301_6.forward = Vector3.New(var_301_13.x, var_301_13.y, var_301_13.z)

				local var_301_14 = var_301_6.localEulerAngles

				var_301_14.z = 0
				var_301_14.x = 0
				var_301_6.localEulerAngles = var_301_14
			end

			local var_301_15 = arg_298_1.actors_["1028ui_story"].transform
			local var_301_16 = 0

			if var_301_16 < arg_298_1.time_ and arg_298_1.time_ <= var_301_16 + arg_301_0 then
				arg_298_1.var_.moveOldPos1028ui_story = var_301_15.localPosition
			end

			local var_301_17 = 0.001

			if var_301_16 <= arg_298_1.time_ and arg_298_1.time_ < var_301_16 + var_301_17 then
				local var_301_18 = (arg_298_1.time_ - var_301_16) / var_301_17
				local var_301_19 = Vector3.New(0, 100, 0)

				var_301_15.localPosition = Vector3.Lerp(arg_298_1.var_.moveOldPos1028ui_story, var_301_19, var_301_18)

				local var_301_20 = manager.ui.mainCamera.transform.position - var_301_15.position

				var_301_15.forward = Vector3.New(var_301_20.x, var_301_20.y, var_301_20.z)

				local var_301_21 = var_301_15.localEulerAngles

				var_301_21.z = 0
				var_301_21.x = 0
				var_301_15.localEulerAngles = var_301_21
			end

			if arg_298_1.time_ >= var_301_16 + var_301_17 and arg_298_1.time_ < var_301_16 + var_301_17 + arg_301_0 then
				var_301_15.localPosition = Vector3.New(0, 100, 0)

				local var_301_22 = manager.ui.mainCamera.transform.position - var_301_15.position

				var_301_15.forward = Vector3.New(var_301_22.x, var_301_22.y, var_301_22.z)

				local var_301_23 = var_301_15.localEulerAngles

				var_301_23.z = 0
				var_301_23.x = 0
				var_301_15.localEulerAngles = var_301_23
			end

			local var_301_24 = 0
			local var_301_25 = 0.725

			if var_301_24 < arg_298_1.time_ and arg_298_1.time_ <= var_301_24 + arg_301_0 then
				arg_298_1.talkMaxDuration = 0
				arg_298_1.dialogCg_.alpha = 1

				arg_298_1.dialog_:SetActive(true)
				SetActive(arg_298_1.leftNameGo_, false)

				arg_298_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_298_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_298_1:RecordName(arg_298_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_298_1.iconTrs_.gameObject, false)
				arg_298_1.callingController_:SetSelectedState("normal")

				local var_301_26 = arg_298_1:GetWordFromCfg(910601076)
				local var_301_27 = arg_298_1:FormatText(var_301_26.content)

				arg_298_1.text_.text = var_301_27

				LuaForUtil.ClearLinePrefixSymbol(arg_298_1.text_)

				local var_301_28 = 29
				local var_301_29 = utf8.len(var_301_27)
				local var_301_30 = var_301_28 <= 0 and var_301_25 or var_301_25 * (var_301_29 / var_301_28)

				if var_301_30 > 0 and var_301_25 < var_301_30 then
					arg_298_1.talkMaxDuration = var_301_30

					if var_301_30 + var_301_24 > arg_298_1.duration_ then
						arg_298_1.duration_ = var_301_30 + var_301_24
					end
				end

				arg_298_1.text_.text = var_301_27
				arg_298_1.typewritter.percent = 0

				arg_298_1.typewritter:SetDirty()
				arg_298_1:ShowNextGo(false)
				arg_298_1:RecordContent(arg_298_1.text_.text)
			end

			local var_301_31 = math.max(var_301_25, arg_298_1.talkMaxDuration)

			if var_301_24 <= arg_298_1.time_ and arg_298_1.time_ < var_301_24 + var_301_31 then
				arg_298_1.typewritter.percent = (arg_298_1.time_ - var_301_24) / var_301_31

				arg_298_1.typewritter:SetDirty()
			end

			if arg_298_1.time_ >= var_301_24 + var_301_31 and arg_298_1.time_ < var_301_24 + var_301_31 + arg_301_0 then
				arg_298_1.typewritter.percent = 1

				arg_298_1.typewritter:SetDirty()
				arg_298_1:ShowNextGo(true)
			end
		end
	end,
	Play910601077 = function(arg_302_0, arg_302_1)
		arg_302_1.time_ = 0
		arg_302_1.frameCnt_ = 0
		arg_302_1.state_ = "playing"
		arg_302_1.curTalkId_ = 910601077
		arg_302_1.duration_ = 5

		SetActive(arg_302_1.tipsGo_, false)

		function arg_302_1.onSingleLineFinish_()
			arg_302_1.onSingleLineUpdate_ = nil
			arg_302_1.onSingleLineFinish_ = nil
			arg_302_1.state_ = "waiting"
		end

		function arg_302_1.playNext_(arg_304_0)
			if arg_304_0 == 1 then
				arg_302_0:Play910601078(arg_302_1)
			end
		end

		function arg_302_1.onSingleLineUpdate_(arg_305_0)
			local var_305_0 = 0
			local var_305_1 = 0.375

			if var_305_0 < arg_302_1.time_ and arg_302_1.time_ <= var_305_0 + arg_305_0 then
				arg_302_1.talkMaxDuration = 0
				arg_302_1.dialogCg_.alpha = 1

				arg_302_1.dialog_:SetActive(true)
				SetActive(arg_302_1.leftNameGo_, true)

				local var_305_2 = arg_302_1:FormatText(StoryNameCfg[7].name)

				arg_302_1.leftNameTxt_.text = var_305_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_302_1.leftNameTxt_.transform)

				arg_302_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_302_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_302_1:RecordName(arg_302_1.leftNameTxt_.text)
				SetActive(arg_302_1.iconTrs_.gameObject, false)
				arg_302_1.callingController_:SetSelectedState("normal")

				local var_305_3 = arg_302_1:GetWordFromCfg(910601077)
				local var_305_4 = arg_302_1:FormatText(var_305_3.content)

				arg_302_1.text_.text = var_305_4

				LuaForUtil.ClearLinePrefixSymbol(arg_302_1.text_)

				local var_305_5 = 15
				local var_305_6 = utf8.len(var_305_4)
				local var_305_7 = var_305_5 <= 0 and var_305_1 or var_305_1 * (var_305_6 / var_305_5)

				if var_305_7 > 0 and var_305_1 < var_305_7 then
					arg_302_1.talkMaxDuration = var_305_7

					if var_305_7 + var_305_0 > arg_302_1.duration_ then
						arg_302_1.duration_ = var_305_7 + var_305_0
					end
				end

				arg_302_1.text_.text = var_305_4
				arg_302_1.typewritter.percent = 0

				arg_302_1.typewritter:SetDirty()
				arg_302_1:ShowNextGo(false)
				arg_302_1:RecordContent(arg_302_1.text_.text)
			end

			local var_305_8 = math.max(var_305_1, arg_302_1.talkMaxDuration)

			if var_305_0 <= arg_302_1.time_ and arg_302_1.time_ < var_305_0 + var_305_8 then
				arg_302_1.typewritter.percent = (arg_302_1.time_ - var_305_0) / var_305_8

				arg_302_1.typewritter:SetDirty()
			end

			if arg_302_1.time_ >= var_305_0 + var_305_8 and arg_302_1.time_ < var_305_0 + var_305_8 + arg_305_0 then
				arg_302_1.typewritter.percent = 1

				arg_302_1.typewritter:SetDirty()
				arg_302_1:ShowNextGo(true)
			end
		end
	end,
	Play910601078 = function(arg_306_0, arg_306_1)
		arg_306_1.time_ = 0
		arg_306_1.frameCnt_ = 0
		arg_306_1.state_ = "playing"
		arg_306_1.curTalkId_ = 910601078
		arg_306_1.duration_ = 5

		SetActive(arg_306_1.tipsGo_, false)

		function arg_306_1.onSingleLineFinish_()
			arg_306_1.onSingleLineUpdate_ = nil
			arg_306_1.onSingleLineFinish_ = nil
			arg_306_1.state_ = "waiting"
		end

		function arg_306_1.playNext_(arg_308_0)
			if arg_308_0 == 1 then
				arg_306_0:Play910601079(arg_306_1)
			end
		end

		function arg_306_1.onSingleLineUpdate_(arg_309_0)
			local var_309_0 = 0
			local var_309_1 = 0.7

			if var_309_0 < arg_306_1.time_ and arg_306_1.time_ <= var_309_0 + arg_309_0 then
				arg_306_1.talkMaxDuration = 0
				arg_306_1.dialogCg_.alpha = 1

				arg_306_1.dialog_:SetActive(true)
				SetActive(arg_306_1.leftNameGo_, false)

				arg_306_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_306_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_306_1:RecordName(arg_306_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_306_1.iconTrs_.gameObject, false)
				arg_306_1.callingController_:SetSelectedState("normal")

				local var_309_2 = arg_306_1:GetWordFromCfg(910601078)
				local var_309_3 = arg_306_1:FormatText(var_309_2.content)

				arg_306_1.text_.text = var_309_3

				LuaForUtil.ClearLinePrefixSymbol(arg_306_1.text_)

				local var_309_4 = 28
				local var_309_5 = utf8.len(var_309_3)
				local var_309_6 = var_309_4 <= 0 and var_309_1 or var_309_1 * (var_309_5 / var_309_4)

				if var_309_6 > 0 and var_309_1 < var_309_6 then
					arg_306_1.talkMaxDuration = var_309_6

					if var_309_6 + var_309_0 > arg_306_1.duration_ then
						arg_306_1.duration_ = var_309_6 + var_309_0
					end
				end

				arg_306_1.text_.text = var_309_3
				arg_306_1.typewritter.percent = 0

				arg_306_1.typewritter:SetDirty()
				arg_306_1:ShowNextGo(false)
				arg_306_1:RecordContent(arg_306_1.text_.text)
			end

			local var_309_7 = math.max(var_309_1, arg_306_1.talkMaxDuration)

			if var_309_0 <= arg_306_1.time_ and arg_306_1.time_ < var_309_0 + var_309_7 then
				arg_306_1.typewritter.percent = (arg_306_1.time_ - var_309_0) / var_309_7

				arg_306_1.typewritter:SetDirty()
			end

			if arg_306_1.time_ >= var_309_0 + var_309_7 and arg_306_1.time_ < var_309_0 + var_309_7 + arg_309_0 then
				arg_306_1.typewritter.percent = 1

				arg_306_1.typewritter:SetDirty()
				arg_306_1:ShowNextGo(true)
			end
		end
	end,
	Play910601079 = function(arg_310_0, arg_310_1)
		arg_310_1.time_ = 0
		arg_310_1.frameCnt_ = 0
		arg_310_1.state_ = "playing"
		arg_310_1.curTalkId_ = 910601079
		arg_310_1.duration_ = 3.53

		SetActive(arg_310_1.tipsGo_, false)

		function arg_310_1.onSingleLineFinish_()
			arg_310_1.onSingleLineUpdate_ = nil
			arg_310_1.onSingleLineFinish_ = nil
			arg_310_1.state_ = "waiting"
		end

		function arg_310_1.playNext_(arg_312_0)
			if arg_312_0 == 1 then
				arg_310_0:Play910601080(arg_310_1)
			end
		end

		function arg_310_1.onSingleLineUpdate_(arg_313_0)
			local var_313_0 = arg_310_1.actors_["1084ui_story"].transform
			local var_313_1 = 0

			if var_313_1 < arg_310_1.time_ and arg_310_1.time_ <= var_313_1 + arg_313_0 then
				arg_310_1.var_.moveOldPos1084ui_story = var_313_0.localPosition
			end

			local var_313_2 = 0.001

			if var_313_1 <= arg_310_1.time_ and arg_310_1.time_ < var_313_1 + var_313_2 then
				local var_313_3 = (arg_310_1.time_ - var_313_1) / var_313_2
				local var_313_4 = Vector3.New(0, -0.97, -6)

				var_313_0.localPosition = Vector3.Lerp(arg_310_1.var_.moveOldPos1084ui_story, var_313_4, var_313_3)

				local var_313_5 = manager.ui.mainCamera.transform.position - var_313_0.position

				var_313_0.forward = Vector3.New(var_313_5.x, var_313_5.y, var_313_5.z)

				local var_313_6 = var_313_0.localEulerAngles

				var_313_6.z = 0
				var_313_6.x = 0
				var_313_0.localEulerAngles = var_313_6
			end

			if arg_310_1.time_ >= var_313_1 + var_313_2 and arg_310_1.time_ < var_313_1 + var_313_2 + arg_313_0 then
				var_313_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_313_7 = manager.ui.mainCamera.transform.position - var_313_0.position

				var_313_0.forward = Vector3.New(var_313_7.x, var_313_7.y, var_313_7.z)

				local var_313_8 = var_313_0.localEulerAngles

				var_313_8.z = 0
				var_313_8.x = 0
				var_313_0.localEulerAngles = var_313_8
			end

			local var_313_9 = arg_310_1.actors_["1084ui_story"]
			local var_313_10 = 0

			if var_313_10 < arg_310_1.time_ and arg_310_1.time_ <= var_313_10 + arg_313_0 and arg_310_1.var_.characterEffect1084ui_story == nil then
				arg_310_1.var_.characterEffect1084ui_story = var_313_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_313_11 = 0.200000002980232

			if var_313_10 <= arg_310_1.time_ and arg_310_1.time_ < var_313_10 + var_313_11 then
				local var_313_12 = (arg_310_1.time_ - var_313_10) / var_313_11

				if arg_310_1.var_.characterEffect1084ui_story then
					arg_310_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_310_1.time_ >= var_313_10 + var_313_11 and arg_310_1.time_ < var_313_10 + var_313_11 + arg_313_0 and arg_310_1.var_.characterEffect1084ui_story then
				arg_310_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_313_13 = 0

			if var_313_13 < arg_310_1.time_ and arg_310_1.time_ <= var_313_13 + arg_313_0 then
				arg_310_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_313_14 = 0

			if var_313_14 < arg_310_1.time_ and arg_310_1.time_ <= var_313_14 + arg_313_0 then
				arg_310_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_313_15 = arg_310_1.actors_["1028ui_story"].transform
			local var_313_16 = 0

			if var_313_16 < arg_310_1.time_ and arg_310_1.time_ <= var_313_16 + arg_313_0 then
				arg_310_1.var_.moveOldPos1028ui_story = var_313_15.localPosition
			end

			local var_313_17 = 0.001

			if var_313_16 <= arg_310_1.time_ and arg_310_1.time_ < var_313_16 + var_313_17 then
				local var_313_18 = (arg_310_1.time_ - var_313_16) / var_313_17
				local var_313_19 = Vector3.New(0, 100, 0)

				var_313_15.localPosition = Vector3.Lerp(arg_310_1.var_.moveOldPos1028ui_story, var_313_19, var_313_18)

				local var_313_20 = manager.ui.mainCamera.transform.position - var_313_15.position

				var_313_15.forward = Vector3.New(var_313_20.x, var_313_20.y, var_313_20.z)

				local var_313_21 = var_313_15.localEulerAngles

				var_313_21.z = 0
				var_313_21.x = 0
				var_313_15.localEulerAngles = var_313_21
			end

			if arg_310_1.time_ >= var_313_16 + var_313_17 and arg_310_1.time_ < var_313_16 + var_313_17 + arg_313_0 then
				var_313_15.localPosition = Vector3.New(0, 100, 0)

				local var_313_22 = manager.ui.mainCamera.transform.position - var_313_15.position

				var_313_15.forward = Vector3.New(var_313_22.x, var_313_22.y, var_313_22.z)

				local var_313_23 = var_313_15.localEulerAngles

				var_313_23.z = 0
				var_313_23.x = 0
				var_313_15.localEulerAngles = var_313_23
			end

			local var_313_24 = arg_310_1.actors_["1028ui_story"]
			local var_313_25 = 0

			if var_313_25 < arg_310_1.time_ and arg_310_1.time_ <= var_313_25 + arg_313_0 and arg_310_1.var_.characterEffect1028ui_story == nil then
				arg_310_1.var_.characterEffect1028ui_story = var_313_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_313_26 = 0.200000002980232

			if var_313_25 <= arg_310_1.time_ and arg_310_1.time_ < var_313_25 + var_313_26 then
				local var_313_27 = (arg_310_1.time_ - var_313_25) / var_313_26

				if arg_310_1.var_.characterEffect1028ui_story then
					local var_313_28 = Mathf.Lerp(0, 0.5, var_313_27)

					arg_310_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_310_1.var_.characterEffect1028ui_story.fillRatio = var_313_28
				end
			end

			if arg_310_1.time_ >= var_313_25 + var_313_26 and arg_310_1.time_ < var_313_25 + var_313_26 + arg_313_0 and arg_310_1.var_.characterEffect1028ui_story then
				local var_313_29 = 0.5

				arg_310_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_310_1.var_.characterEffect1028ui_story.fillRatio = var_313_29
			end

			local var_313_30 = arg_310_1.actors_["1048ui_story"].transform
			local var_313_31 = 0

			if var_313_31 < arg_310_1.time_ and arg_310_1.time_ <= var_313_31 + arg_313_0 then
				arg_310_1.var_.moveOldPos1048ui_story = var_313_30.localPosition
			end

			local var_313_32 = 0.001

			if var_313_31 <= arg_310_1.time_ and arg_310_1.time_ < var_313_31 + var_313_32 then
				local var_313_33 = (arg_310_1.time_ - var_313_31) / var_313_32
				local var_313_34 = Vector3.New(0, 100, 0)

				var_313_30.localPosition = Vector3.Lerp(arg_310_1.var_.moveOldPos1048ui_story, var_313_34, var_313_33)

				local var_313_35 = manager.ui.mainCamera.transform.position - var_313_30.position

				var_313_30.forward = Vector3.New(var_313_35.x, var_313_35.y, var_313_35.z)

				local var_313_36 = var_313_30.localEulerAngles

				var_313_36.z = 0
				var_313_36.x = 0
				var_313_30.localEulerAngles = var_313_36
			end

			if arg_310_1.time_ >= var_313_31 + var_313_32 and arg_310_1.time_ < var_313_31 + var_313_32 + arg_313_0 then
				var_313_30.localPosition = Vector3.New(0, 100, 0)

				local var_313_37 = manager.ui.mainCamera.transform.position - var_313_30.position

				var_313_30.forward = Vector3.New(var_313_37.x, var_313_37.y, var_313_37.z)

				local var_313_38 = var_313_30.localEulerAngles

				var_313_38.z = 0
				var_313_38.x = 0
				var_313_30.localEulerAngles = var_313_38
			end

			local var_313_39 = arg_310_1.actors_["1048ui_story"]
			local var_313_40 = 0

			if var_313_40 < arg_310_1.time_ and arg_310_1.time_ <= var_313_40 + arg_313_0 and arg_310_1.var_.characterEffect1048ui_story == nil then
				arg_310_1.var_.characterEffect1048ui_story = var_313_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_313_41 = 0.200000002980232

			if var_313_40 <= arg_310_1.time_ and arg_310_1.time_ < var_313_40 + var_313_41 then
				local var_313_42 = (arg_310_1.time_ - var_313_40) / var_313_41

				if arg_310_1.var_.characterEffect1048ui_story then
					local var_313_43 = Mathf.Lerp(0, 0.5, var_313_42)

					arg_310_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_310_1.var_.characterEffect1048ui_story.fillRatio = var_313_43
				end
			end

			if arg_310_1.time_ >= var_313_40 + var_313_41 and arg_310_1.time_ < var_313_40 + var_313_41 + arg_313_0 and arg_310_1.var_.characterEffect1048ui_story then
				local var_313_44 = 0.5

				arg_310_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_310_1.var_.characterEffect1048ui_story.fillRatio = var_313_44
			end

			local var_313_45 = 0
			local var_313_46 = 0.125

			if var_313_45 < arg_310_1.time_ and arg_310_1.time_ <= var_313_45 + arg_313_0 then
				arg_310_1.talkMaxDuration = 0
				arg_310_1.dialogCg_.alpha = 1

				arg_310_1.dialog_:SetActive(true)
				SetActive(arg_310_1.leftNameGo_, true)

				local var_313_47 = arg_310_1:FormatText(StoryNameCfg[6].name)

				arg_310_1.leftNameTxt_.text = var_313_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_310_1.leftNameTxt_.transform)

				arg_310_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_310_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_310_1:RecordName(arg_310_1.leftNameTxt_.text)
				SetActive(arg_310_1.iconTrs_.gameObject, false)
				arg_310_1.callingController_:SetSelectedState("normal")

				local var_313_48 = arg_310_1:GetWordFromCfg(910601079)
				local var_313_49 = arg_310_1:FormatText(var_313_48.content)

				arg_310_1.text_.text = var_313_49

				LuaForUtil.ClearLinePrefixSymbol(arg_310_1.text_)

				local var_313_50 = 5
				local var_313_51 = utf8.len(var_313_49)
				local var_313_52 = var_313_50 <= 0 and var_313_46 or var_313_46 * (var_313_51 / var_313_50)

				if var_313_52 > 0 and var_313_46 < var_313_52 then
					arg_310_1.talkMaxDuration = var_313_52

					if var_313_52 + var_313_45 > arg_310_1.duration_ then
						arg_310_1.duration_ = var_313_52 + var_313_45
					end
				end

				arg_310_1.text_.text = var_313_49
				arg_310_1.typewritter.percent = 0

				arg_310_1.typewritter:SetDirty()
				arg_310_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601079", "story_v_out_910601.awb") ~= 0 then
					local var_313_53 = manager.audio:GetVoiceLength("story_v_out_910601", "910601079", "story_v_out_910601.awb") / 1000

					if var_313_53 + var_313_45 > arg_310_1.duration_ then
						arg_310_1.duration_ = var_313_53 + var_313_45
					end

					if var_313_48.prefab_name ~= "" and arg_310_1.actors_[var_313_48.prefab_name] ~= nil then
						local var_313_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_310_1.actors_[var_313_48.prefab_name].transform, "story_v_out_910601", "910601079", "story_v_out_910601.awb")

						arg_310_1:RecordAudio("910601079", var_313_54)
						arg_310_1:RecordAudio("910601079", var_313_54)
					else
						arg_310_1:AudioAction("play", "voice", "story_v_out_910601", "910601079", "story_v_out_910601.awb")
					end

					arg_310_1:RecordHistoryTalkVoice("story_v_out_910601", "910601079", "story_v_out_910601.awb")
				end

				arg_310_1:RecordContent(arg_310_1.text_.text)
			end

			local var_313_55 = math.max(var_313_46, arg_310_1.talkMaxDuration)

			if var_313_45 <= arg_310_1.time_ and arg_310_1.time_ < var_313_45 + var_313_55 then
				arg_310_1.typewritter.percent = (arg_310_1.time_ - var_313_45) / var_313_55

				arg_310_1.typewritter:SetDirty()
			end

			if arg_310_1.time_ >= var_313_45 + var_313_55 and arg_310_1.time_ < var_313_45 + var_313_55 + arg_313_0 then
				arg_310_1.typewritter.percent = 1

				arg_310_1.typewritter:SetDirty()
				arg_310_1:ShowNextGo(true)
			end
		end
	end,
	Play910601080 = function(arg_314_0, arg_314_1)
		arg_314_1.time_ = 0
		arg_314_1.frameCnt_ = 0
		arg_314_1.state_ = "playing"
		arg_314_1.curTalkId_ = 910601080
		arg_314_1.duration_ = 9.13

		SetActive(arg_314_1.tipsGo_, false)

		function arg_314_1.onSingleLineFinish_()
			arg_314_1.onSingleLineUpdate_ = nil
			arg_314_1.onSingleLineFinish_ = nil
			arg_314_1.state_ = "waiting"
		end

		function arg_314_1.playNext_(arg_316_0)
			if arg_316_0 == 1 then
				arg_314_0:Play910601081(arg_314_1)
			end
		end

		function arg_314_1.onSingleLineUpdate_(arg_317_0)
			local var_317_0 = arg_314_1.actors_["1048ui_story"].transform
			local var_317_1 = 0

			if var_317_1 < arg_314_1.time_ and arg_314_1.time_ <= var_317_1 + arg_317_0 then
				arg_314_1.var_.moveOldPos1048ui_story = var_317_0.localPosition
			end

			local var_317_2 = 0.001

			if var_317_1 <= arg_314_1.time_ and arg_314_1.time_ < var_317_1 + var_317_2 then
				local var_317_3 = (arg_314_1.time_ - var_317_1) / var_317_2
				local var_317_4 = Vector3.New(0.7, -0.8, -6.2)

				var_317_0.localPosition = Vector3.Lerp(arg_314_1.var_.moveOldPos1048ui_story, var_317_4, var_317_3)

				local var_317_5 = manager.ui.mainCamera.transform.position - var_317_0.position

				var_317_0.forward = Vector3.New(var_317_5.x, var_317_5.y, var_317_5.z)

				local var_317_6 = var_317_0.localEulerAngles

				var_317_6.z = 0
				var_317_6.x = 0
				var_317_0.localEulerAngles = var_317_6
			end

			if arg_314_1.time_ >= var_317_1 + var_317_2 and arg_314_1.time_ < var_317_1 + var_317_2 + arg_317_0 then
				var_317_0.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_317_7 = manager.ui.mainCamera.transform.position - var_317_0.position

				var_317_0.forward = Vector3.New(var_317_7.x, var_317_7.y, var_317_7.z)

				local var_317_8 = var_317_0.localEulerAngles

				var_317_8.z = 0
				var_317_8.x = 0
				var_317_0.localEulerAngles = var_317_8
			end

			local var_317_9 = arg_314_1.actors_["1048ui_story"]
			local var_317_10 = 0

			if var_317_10 < arg_314_1.time_ and arg_314_1.time_ <= var_317_10 + arg_317_0 and arg_314_1.var_.characterEffect1048ui_story == nil then
				arg_314_1.var_.characterEffect1048ui_story = var_317_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_317_11 = 0.200000002980232

			if var_317_10 <= arg_314_1.time_ and arg_314_1.time_ < var_317_10 + var_317_11 then
				local var_317_12 = (arg_314_1.time_ - var_317_10) / var_317_11

				if arg_314_1.var_.characterEffect1048ui_story then
					arg_314_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_314_1.time_ >= var_317_10 + var_317_11 and arg_314_1.time_ < var_317_10 + var_317_11 + arg_317_0 and arg_314_1.var_.characterEffect1048ui_story then
				arg_314_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_317_13 = 0

			if var_317_13 < arg_314_1.time_ and arg_314_1.time_ <= var_317_13 + arg_317_0 then
				arg_314_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_317_14 = 0

			if var_317_14 < arg_314_1.time_ and arg_314_1.time_ <= var_317_14 + arg_317_0 then
				arg_314_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_317_15 = arg_314_1.actors_["1084ui_story"].transform
			local var_317_16 = 0

			if var_317_16 < arg_314_1.time_ and arg_314_1.time_ <= var_317_16 + arg_317_0 then
				arg_314_1.var_.moveOldPos1084ui_story = var_317_15.localPosition
			end

			local var_317_17 = 0.001

			if var_317_16 <= arg_314_1.time_ and arg_314_1.time_ < var_317_16 + var_317_17 then
				local var_317_18 = (arg_314_1.time_ - var_317_16) / var_317_17
				local var_317_19 = Vector3.New(-0.7, -0.97, -6)

				var_317_15.localPosition = Vector3.Lerp(arg_314_1.var_.moveOldPos1084ui_story, var_317_19, var_317_18)

				local var_317_20 = manager.ui.mainCamera.transform.position - var_317_15.position

				var_317_15.forward = Vector3.New(var_317_20.x, var_317_20.y, var_317_20.z)

				local var_317_21 = var_317_15.localEulerAngles

				var_317_21.z = 0
				var_317_21.x = 0
				var_317_15.localEulerAngles = var_317_21
			end

			if arg_314_1.time_ >= var_317_16 + var_317_17 and arg_314_1.time_ < var_317_16 + var_317_17 + arg_317_0 then
				var_317_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_317_22 = manager.ui.mainCamera.transform.position - var_317_15.position

				var_317_15.forward = Vector3.New(var_317_22.x, var_317_22.y, var_317_22.z)

				local var_317_23 = var_317_15.localEulerAngles

				var_317_23.z = 0
				var_317_23.x = 0
				var_317_15.localEulerAngles = var_317_23
			end

			local var_317_24 = arg_314_1.actors_["1084ui_story"]
			local var_317_25 = 0

			if var_317_25 < arg_314_1.time_ and arg_314_1.time_ <= var_317_25 + arg_317_0 and arg_314_1.var_.characterEffect1084ui_story == nil then
				arg_314_1.var_.characterEffect1084ui_story = var_317_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_317_26 = 0.200000002980232

			if var_317_25 <= arg_314_1.time_ and arg_314_1.time_ < var_317_25 + var_317_26 then
				local var_317_27 = (arg_314_1.time_ - var_317_25) / var_317_26

				if arg_314_1.var_.characterEffect1084ui_story then
					local var_317_28 = Mathf.Lerp(0, 0.5, var_317_27)

					arg_314_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_314_1.var_.characterEffect1084ui_story.fillRatio = var_317_28
				end
			end

			if arg_314_1.time_ >= var_317_25 + var_317_26 and arg_314_1.time_ < var_317_25 + var_317_26 + arg_317_0 and arg_314_1.var_.characterEffect1084ui_story then
				local var_317_29 = 0.5

				arg_314_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_314_1.var_.characterEffect1084ui_story.fillRatio = var_317_29
			end

			local var_317_30 = 0
			local var_317_31 = 0.9

			if var_317_30 < arg_314_1.time_ and arg_314_1.time_ <= var_317_30 + arg_317_0 then
				arg_314_1.talkMaxDuration = 0
				arg_314_1.dialogCg_.alpha = 1

				arg_314_1.dialog_:SetActive(true)
				SetActive(arg_314_1.leftNameGo_, true)

				local var_317_32 = arg_314_1:FormatText(StoryNameCfg[8].name)

				arg_314_1.leftNameTxt_.text = var_317_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_314_1.leftNameTxt_.transform)

				arg_314_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_314_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_314_1:RecordName(arg_314_1.leftNameTxt_.text)
				SetActive(arg_314_1.iconTrs_.gameObject, false)
				arg_314_1.callingController_:SetSelectedState("normal")

				local var_317_33 = arg_314_1:GetWordFromCfg(910601080)
				local var_317_34 = arg_314_1:FormatText(var_317_33.content)

				arg_314_1.text_.text = var_317_34

				LuaForUtil.ClearLinePrefixSymbol(arg_314_1.text_)

				local var_317_35 = 36
				local var_317_36 = utf8.len(var_317_34)
				local var_317_37 = var_317_35 <= 0 and var_317_31 or var_317_31 * (var_317_36 / var_317_35)

				if var_317_37 > 0 and var_317_31 < var_317_37 then
					arg_314_1.talkMaxDuration = var_317_37

					if var_317_37 + var_317_30 > arg_314_1.duration_ then
						arg_314_1.duration_ = var_317_37 + var_317_30
					end
				end

				arg_314_1.text_.text = var_317_34
				arg_314_1.typewritter.percent = 0

				arg_314_1.typewritter:SetDirty()
				arg_314_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601080", "story_v_out_910601.awb") ~= 0 then
					local var_317_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601080", "story_v_out_910601.awb") / 1000

					if var_317_38 + var_317_30 > arg_314_1.duration_ then
						arg_314_1.duration_ = var_317_38 + var_317_30
					end

					if var_317_33.prefab_name ~= "" and arg_314_1.actors_[var_317_33.prefab_name] ~= nil then
						local var_317_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_314_1.actors_[var_317_33.prefab_name].transform, "story_v_out_910601", "910601080", "story_v_out_910601.awb")

						arg_314_1:RecordAudio("910601080", var_317_39)
						arg_314_1:RecordAudio("910601080", var_317_39)
					else
						arg_314_1:AudioAction("play", "voice", "story_v_out_910601", "910601080", "story_v_out_910601.awb")
					end

					arg_314_1:RecordHistoryTalkVoice("story_v_out_910601", "910601080", "story_v_out_910601.awb")
				end

				arg_314_1:RecordContent(arg_314_1.text_.text)
			end

			local var_317_40 = math.max(var_317_31, arg_314_1.talkMaxDuration)

			if var_317_30 <= arg_314_1.time_ and arg_314_1.time_ < var_317_30 + var_317_40 then
				arg_314_1.typewritter.percent = (arg_314_1.time_ - var_317_30) / var_317_40

				arg_314_1.typewritter:SetDirty()
			end

			if arg_314_1.time_ >= var_317_30 + var_317_40 and arg_314_1.time_ < var_317_30 + var_317_40 + arg_317_0 then
				arg_314_1.typewritter.percent = 1

				arg_314_1.typewritter:SetDirty()
				arg_314_1:ShowNextGo(true)
			end
		end
	end,
	Play910601081 = function(arg_318_0, arg_318_1)
		arg_318_1.time_ = 0
		arg_318_1.frameCnt_ = 0
		arg_318_1.state_ = "playing"
		arg_318_1.curTalkId_ = 910601081
		arg_318_1.duration_ = 7.4

		SetActive(arg_318_1.tipsGo_, false)

		function arg_318_1.onSingleLineFinish_()
			arg_318_1.onSingleLineUpdate_ = nil
			arg_318_1.onSingleLineFinish_ = nil
			arg_318_1.state_ = "waiting"
		end

		function arg_318_1.playNext_(arg_320_0)
			if arg_320_0 == 1 then
				arg_318_0:Play910601082(arg_318_1)
			end
		end

		function arg_318_1.onSingleLineUpdate_(arg_321_0)
			local var_321_0 = arg_318_1.actors_["1011ui_story"].transform
			local var_321_1 = 0

			if var_321_1 < arg_318_1.time_ and arg_318_1.time_ <= var_321_1 + arg_321_0 then
				arg_318_1.var_.moveOldPos1011ui_story = var_321_0.localPosition
			end

			local var_321_2 = 0.001

			if var_321_1 <= arg_318_1.time_ and arg_318_1.time_ < var_321_1 + var_321_2 then
				local var_321_3 = (arg_318_1.time_ - var_321_1) / var_321_2
				local var_321_4 = Vector3.New(0, -0.71, -6)

				var_321_0.localPosition = Vector3.Lerp(arg_318_1.var_.moveOldPos1011ui_story, var_321_4, var_321_3)

				local var_321_5 = manager.ui.mainCamera.transform.position - var_321_0.position

				var_321_0.forward = Vector3.New(var_321_5.x, var_321_5.y, var_321_5.z)

				local var_321_6 = var_321_0.localEulerAngles

				var_321_6.z = 0
				var_321_6.x = 0
				var_321_0.localEulerAngles = var_321_6
			end

			if arg_318_1.time_ >= var_321_1 + var_321_2 and arg_318_1.time_ < var_321_1 + var_321_2 + arg_321_0 then
				var_321_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_321_7 = manager.ui.mainCamera.transform.position - var_321_0.position

				var_321_0.forward = Vector3.New(var_321_7.x, var_321_7.y, var_321_7.z)

				local var_321_8 = var_321_0.localEulerAngles

				var_321_8.z = 0
				var_321_8.x = 0
				var_321_0.localEulerAngles = var_321_8
			end

			local var_321_9 = arg_318_1.actors_["1011ui_story"]
			local var_321_10 = 0

			if var_321_10 < arg_318_1.time_ and arg_318_1.time_ <= var_321_10 + arg_321_0 and arg_318_1.var_.characterEffect1011ui_story == nil then
				arg_318_1.var_.characterEffect1011ui_story = var_321_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_321_11 = 0.200000002980232

			if var_321_10 <= arg_318_1.time_ and arg_318_1.time_ < var_321_10 + var_321_11 then
				local var_321_12 = (arg_318_1.time_ - var_321_10) / var_321_11

				if arg_318_1.var_.characterEffect1011ui_story then
					arg_318_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_318_1.time_ >= var_321_10 + var_321_11 and arg_318_1.time_ < var_321_10 + var_321_11 + arg_321_0 and arg_318_1.var_.characterEffect1011ui_story then
				arg_318_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_321_13 = 0

			if var_321_13 < arg_318_1.time_ and arg_318_1.time_ <= var_321_13 + arg_321_0 then
				arg_318_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_321_14 = 0

			if var_321_14 < arg_318_1.time_ and arg_318_1.time_ <= var_321_14 + arg_321_0 then
				arg_318_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_321_15 = arg_318_1.actors_["1048ui_story"].transform
			local var_321_16 = 0

			if var_321_16 < arg_318_1.time_ and arg_318_1.time_ <= var_321_16 + arg_321_0 then
				arg_318_1.var_.moveOldPos1048ui_story = var_321_15.localPosition
			end

			local var_321_17 = 0.001

			if var_321_16 <= arg_318_1.time_ and arg_318_1.time_ < var_321_16 + var_321_17 then
				local var_321_18 = (arg_318_1.time_ - var_321_16) / var_321_17
				local var_321_19 = Vector3.New(0, 100, 0)

				var_321_15.localPosition = Vector3.Lerp(arg_318_1.var_.moveOldPos1048ui_story, var_321_19, var_321_18)

				local var_321_20 = manager.ui.mainCamera.transform.position - var_321_15.position

				var_321_15.forward = Vector3.New(var_321_20.x, var_321_20.y, var_321_20.z)

				local var_321_21 = var_321_15.localEulerAngles

				var_321_21.z = 0
				var_321_21.x = 0
				var_321_15.localEulerAngles = var_321_21
			end

			if arg_318_1.time_ >= var_321_16 + var_321_17 and arg_318_1.time_ < var_321_16 + var_321_17 + arg_321_0 then
				var_321_15.localPosition = Vector3.New(0, 100, 0)

				local var_321_22 = manager.ui.mainCamera.transform.position - var_321_15.position

				var_321_15.forward = Vector3.New(var_321_22.x, var_321_22.y, var_321_22.z)

				local var_321_23 = var_321_15.localEulerAngles

				var_321_23.z = 0
				var_321_23.x = 0
				var_321_15.localEulerAngles = var_321_23
			end

			local var_321_24 = arg_318_1.actors_["1048ui_story"]
			local var_321_25 = 0

			if var_321_25 < arg_318_1.time_ and arg_318_1.time_ <= var_321_25 + arg_321_0 and arg_318_1.var_.characterEffect1048ui_story == nil then
				arg_318_1.var_.characterEffect1048ui_story = var_321_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_321_26 = 0.200000002980232

			if var_321_25 <= arg_318_1.time_ and arg_318_1.time_ < var_321_25 + var_321_26 then
				local var_321_27 = (arg_318_1.time_ - var_321_25) / var_321_26

				if arg_318_1.var_.characterEffect1048ui_story then
					local var_321_28 = Mathf.Lerp(0, 0.5, var_321_27)

					arg_318_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_318_1.var_.characterEffect1048ui_story.fillRatio = var_321_28
				end
			end

			if arg_318_1.time_ >= var_321_25 + var_321_26 and arg_318_1.time_ < var_321_25 + var_321_26 + arg_321_0 and arg_318_1.var_.characterEffect1048ui_story then
				local var_321_29 = 0.5

				arg_318_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_318_1.var_.characterEffect1048ui_story.fillRatio = var_321_29
			end

			local var_321_30 = arg_318_1.actors_["1084ui_story"].transform
			local var_321_31 = 0

			if var_321_31 < arg_318_1.time_ and arg_318_1.time_ <= var_321_31 + arg_321_0 then
				arg_318_1.var_.moveOldPos1084ui_story = var_321_30.localPosition
			end

			local var_321_32 = 0.001

			if var_321_31 <= arg_318_1.time_ and arg_318_1.time_ < var_321_31 + var_321_32 then
				local var_321_33 = (arg_318_1.time_ - var_321_31) / var_321_32
				local var_321_34 = Vector3.New(0, 100, 0)

				var_321_30.localPosition = Vector3.Lerp(arg_318_1.var_.moveOldPos1084ui_story, var_321_34, var_321_33)

				local var_321_35 = manager.ui.mainCamera.transform.position - var_321_30.position

				var_321_30.forward = Vector3.New(var_321_35.x, var_321_35.y, var_321_35.z)

				local var_321_36 = var_321_30.localEulerAngles

				var_321_36.z = 0
				var_321_36.x = 0
				var_321_30.localEulerAngles = var_321_36
			end

			if arg_318_1.time_ >= var_321_31 + var_321_32 and arg_318_1.time_ < var_321_31 + var_321_32 + arg_321_0 then
				var_321_30.localPosition = Vector3.New(0, 100, 0)

				local var_321_37 = manager.ui.mainCamera.transform.position - var_321_30.position

				var_321_30.forward = Vector3.New(var_321_37.x, var_321_37.y, var_321_37.z)

				local var_321_38 = var_321_30.localEulerAngles

				var_321_38.z = 0
				var_321_38.x = 0
				var_321_30.localEulerAngles = var_321_38
			end

			local var_321_39 = arg_318_1.actors_["1084ui_story"]
			local var_321_40 = 0

			if var_321_40 < arg_318_1.time_ and arg_318_1.time_ <= var_321_40 + arg_321_0 and arg_318_1.var_.characterEffect1084ui_story == nil then
				arg_318_1.var_.characterEffect1084ui_story = var_321_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_321_41 = 0.200000002980232

			if var_321_40 <= arg_318_1.time_ and arg_318_1.time_ < var_321_40 + var_321_41 then
				local var_321_42 = (arg_318_1.time_ - var_321_40) / var_321_41

				if arg_318_1.var_.characterEffect1084ui_story then
					local var_321_43 = Mathf.Lerp(0, 0.5, var_321_42)

					arg_318_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_318_1.var_.characterEffect1084ui_story.fillRatio = var_321_43
				end
			end

			if arg_318_1.time_ >= var_321_40 + var_321_41 and arg_318_1.time_ < var_321_40 + var_321_41 + arg_321_0 and arg_318_1.var_.characterEffect1084ui_story then
				local var_321_44 = 0.5

				arg_318_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_318_1.var_.characterEffect1084ui_story.fillRatio = var_321_44
			end

			local var_321_45 = 0
			local var_321_46 = 1

			if var_321_45 < arg_318_1.time_ and arg_318_1.time_ <= var_321_45 + arg_321_0 then
				arg_318_1.talkMaxDuration = 0
				arg_318_1.dialogCg_.alpha = 1

				arg_318_1.dialog_:SetActive(true)
				SetActive(arg_318_1.leftNameGo_, true)

				local var_321_47 = arg_318_1:FormatText(StoryNameCfg[37].name)

				arg_318_1.leftNameTxt_.text = var_321_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_318_1.leftNameTxt_.transform)

				arg_318_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_318_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_318_1:RecordName(arg_318_1.leftNameTxt_.text)
				SetActive(arg_318_1.iconTrs_.gameObject, false)
				arg_318_1.callingController_:SetSelectedState("normal")

				local var_321_48 = arg_318_1:GetWordFromCfg(910601081)
				local var_321_49 = arg_318_1:FormatText(var_321_48.content)

				arg_318_1.text_.text = var_321_49

				LuaForUtil.ClearLinePrefixSymbol(arg_318_1.text_)

				local var_321_50 = 40
				local var_321_51 = utf8.len(var_321_49)
				local var_321_52 = var_321_50 <= 0 and var_321_46 or var_321_46 * (var_321_51 / var_321_50)

				if var_321_52 > 0 and var_321_46 < var_321_52 then
					arg_318_1.talkMaxDuration = var_321_52

					if var_321_52 + var_321_45 > arg_318_1.duration_ then
						arg_318_1.duration_ = var_321_52 + var_321_45
					end
				end

				arg_318_1.text_.text = var_321_49
				arg_318_1.typewritter.percent = 0

				arg_318_1.typewritter:SetDirty()
				arg_318_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601081", "story_v_out_910601.awb") ~= 0 then
					local var_321_53 = manager.audio:GetVoiceLength("story_v_out_910601", "910601081", "story_v_out_910601.awb") / 1000

					if var_321_53 + var_321_45 > arg_318_1.duration_ then
						arg_318_1.duration_ = var_321_53 + var_321_45
					end

					if var_321_48.prefab_name ~= "" and arg_318_1.actors_[var_321_48.prefab_name] ~= nil then
						local var_321_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_318_1.actors_[var_321_48.prefab_name].transform, "story_v_out_910601", "910601081", "story_v_out_910601.awb")

						arg_318_1:RecordAudio("910601081", var_321_54)
						arg_318_1:RecordAudio("910601081", var_321_54)
					else
						arg_318_1:AudioAction("play", "voice", "story_v_out_910601", "910601081", "story_v_out_910601.awb")
					end

					arg_318_1:RecordHistoryTalkVoice("story_v_out_910601", "910601081", "story_v_out_910601.awb")
				end

				arg_318_1:RecordContent(arg_318_1.text_.text)
			end

			local var_321_55 = math.max(var_321_46, arg_318_1.talkMaxDuration)

			if var_321_45 <= arg_318_1.time_ and arg_318_1.time_ < var_321_45 + var_321_55 then
				arg_318_1.typewritter.percent = (arg_318_1.time_ - var_321_45) / var_321_55

				arg_318_1.typewritter:SetDirty()
			end

			if arg_318_1.time_ >= var_321_45 + var_321_55 and arg_318_1.time_ < var_321_45 + var_321_55 + arg_321_0 then
				arg_318_1.typewritter.percent = 1

				arg_318_1.typewritter:SetDirty()
				arg_318_1:ShowNextGo(true)
			end
		end
	end,
	Play910601082 = function(arg_322_0, arg_322_1)
		arg_322_1.time_ = 0
		arg_322_1.frameCnt_ = 0
		arg_322_1.state_ = "playing"
		arg_322_1.curTalkId_ = 910601082
		arg_322_1.duration_ = 10.7

		SetActive(arg_322_1.tipsGo_, false)

		function arg_322_1.onSingleLineFinish_()
			arg_322_1.onSingleLineUpdate_ = nil
			arg_322_1.onSingleLineFinish_ = nil
			arg_322_1.state_ = "waiting"
		end

		function arg_322_1.playNext_(arg_324_0)
			if arg_324_0 == 1 then
				arg_322_0:Play910601083(arg_322_1)
			end
		end

		function arg_322_1.onSingleLineUpdate_(arg_325_0)
			local var_325_0 = arg_322_1.actors_["1059ui_story"].transform
			local var_325_1 = 0

			if var_325_1 < arg_322_1.time_ and arg_322_1.time_ <= var_325_1 + arg_325_0 then
				arg_322_1.var_.moveOldPos1059ui_story = var_325_0.localPosition
			end

			local var_325_2 = 0.001

			if var_325_1 <= arg_322_1.time_ and arg_322_1.time_ < var_325_1 + var_325_2 then
				local var_325_3 = (arg_322_1.time_ - var_325_1) / var_325_2
				local var_325_4 = Vector3.New(0, -1.05, -6)

				var_325_0.localPosition = Vector3.Lerp(arg_322_1.var_.moveOldPos1059ui_story, var_325_4, var_325_3)

				local var_325_5 = manager.ui.mainCamera.transform.position - var_325_0.position

				var_325_0.forward = Vector3.New(var_325_5.x, var_325_5.y, var_325_5.z)

				local var_325_6 = var_325_0.localEulerAngles

				var_325_6.z = 0
				var_325_6.x = 0
				var_325_0.localEulerAngles = var_325_6
			end

			if arg_322_1.time_ >= var_325_1 + var_325_2 and arg_322_1.time_ < var_325_1 + var_325_2 + arg_325_0 then
				var_325_0.localPosition = Vector3.New(0, -1.05, -6)

				local var_325_7 = manager.ui.mainCamera.transform.position - var_325_0.position

				var_325_0.forward = Vector3.New(var_325_7.x, var_325_7.y, var_325_7.z)

				local var_325_8 = var_325_0.localEulerAngles

				var_325_8.z = 0
				var_325_8.x = 0
				var_325_0.localEulerAngles = var_325_8
			end

			local var_325_9 = arg_322_1.actors_["1059ui_story"]
			local var_325_10 = 0

			if var_325_10 < arg_322_1.time_ and arg_322_1.time_ <= var_325_10 + arg_325_0 and arg_322_1.var_.characterEffect1059ui_story == nil then
				arg_322_1.var_.characterEffect1059ui_story = var_325_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_325_11 = 0.200000002980232

			if var_325_10 <= arg_322_1.time_ and arg_322_1.time_ < var_325_10 + var_325_11 then
				local var_325_12 = (arg_322_1.time_ - var_325_10) / var_325_11

				if arg_322_1.var_.characterEffect1059ui_story then
					arg_322_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_322_1.time_ >= var_325_10 + var_325_11 and arg_322_1.time_ < var_325_10 + var_325_11 + arg_325_0 and arg_322_1.var_.characterEffect1059ui_story then
				arg_322_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_325_13 = 0

			if var_325_13 < arg_322_1.time_ and arg_322_1.time_ <= var_325_13 + arg_325_0 then
				arg_322_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action5_1")
			end

			local var_325_14 = 0

			if var_325_14 < arg_322_1.time_ and arg_322_1.time_ <= var_325_14 + arg_325_0 then
				arg_322_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_325_15 = arg_322_1.actors_["1011ui_story"].transform
			local var_325_16 = 0

			if var_325_16 < arg_322_1.time_ and arg_322_1.time_ <= var_325_16 + arg_325_0 then
				arg_322_1.var_.moveOldPos1011ui_story = var_325_15.localPosition
			end

			local var_325_17 = 0.001

			if var_325_16 <= arg_322_1.time_ and arg_322_1.time_ < var_325_16 + var_325_17 then
				local var_325_18 = (arg_322_1.time_ - var_325_16) / var_325_17
				local var_325_19 = Vector3.New(0, 100, 0)

				var_325_15.localPosition = Vector3.Lerp(arg_322_1.var_.moveOldPos1011ui_story, var_325_19, var_325_18)

				local var_325_20 = manager.ui.mainCamera.transform.position - var_325_15.position

				var_325_15.forward = Vector3.New(var_325_20.x, var_325_20.y, var_325_20.z)

				local var_325_21 = var_325_15.localEulerAngles

				var_325_21.z = 0
				var_325_21.x = 0
				var_325_15.localEulerAngles = var_325_21
			end

			if arg_322_1.time_ >= var_325_16 + var_325_17 and arg_322_1.time_ < var_325_16 + var_325_17 + arg_325_0 then
				var_325_15.localPosition = Vector3.New(0, 100, 0)

				local var_325_22 = manager.ui.mainCamera.transform.position - var_325_15.position

				var_325_15.forward = Vector3.New(var_325_22.x, var_325_22.y, var_325_22.z)

				local var_325_23 = var_325_15.localEulerAngles

				var_325_23.z = 0
				var_325_23.x = 0
				var_325_15.localEulerAngles = var_325_23
			end

			local var_325_24 = arg_322_1.actors_["1011ui_story"]
			local var_325_25 = 0

			if var_325_25 < arg_322_1.time_ and arg_322_1.time_ <= var_325_25 + arg_325_0 and arg_322_1.var_.characterEffect1011ui_story == nil then
				arg_322_1.var_.characterEffect1011ui_story = var_325_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_325_26 = 0.200000002980232

			if var_325_25 <= arg_322_1.time_ and arg_322_1.time_ < var_325_25 + var_325_26 then
				local var_325_27 = (arg_322_1.time_ - var_325_25) / var_325_26

				if arg_322_1.var_.characterEffect1011ui_story then
					local var_325_28 = Mathf.Lerp(0, 0.5, var_325_27)

					arg_322_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_322_1.var_.characterEffect1011ui_story.fillRatio = var_325_28
				end
			end

			if arg_322_1.time_ >= var_325_25 + var_325_26 and arg_322_1.time_ < var_325_25 + var_325_26 + arg_325_0 and arg_322_1.var_.characterEffect1011ui_story then
				local var_325_29 = 0.5

				arg_322_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_322_1.var_.characterEffect1011ui_story.fillRatio = var_325_29
			end

			local var_325_30 = 0
			local var_325_31 = 1.25

			if var_325_30 < arg_322_1.time_ and arg_322_1.time_ <= var_325_30 + arg_325_0 then
				arg_322_1.talkMaxDuration = 0
				arg_322_1.dialogCg_.alpha = 1

				arg_322_1.dialog_:SetActive(true)
				SetActive(arg_322_1.leftNameGo_, true)

				local var_325_32 = arg_322_1:FormatText(StoryNameCfg[28].name)

				arg_322_1.leftNameTxt_.text = var_325_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_322_1.leftNameTxt_.transform)

				arg_322_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_322_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_322_1:RecordName(arg_322_1.leftNameTxt_.text)
				SetActive(arg_322_1.iconTrs_.gameObject, false)
				arg_322_1.callingController_:SetSelectedState("normal")

				local var_325_33 = arg_322_1:GetWordFromCfg(910601082)
				local var_325_34 = arg_322_1:FormatText(var_325_33.content)

				arg_322_1.text_.text = var_325_34

				LuaForUtil.ClearLinePrefixSymbol(arg_322_1.text_)

				local var_325_35 = 50
				local var_325_36 = utf8.len(var_325_34)
				local var_325_37 = var_325_35 <= 0 and var_325_31 or var_325_31 * (var_325_36 / var_325_35)

				if var_325_37 > 0 and var_325_31 < var_325_37 then
					arg_322_1.talkMaxDuration = var_325_37

					if var_325_37 + var_325_30 > arg_322_1.duration_ then
						arg_322_1.duration_ = var_325_37 + var_325_30
					end
				end

				arg_322_1.text_.text = var_325_34
				arg_322_1.typewritter.percent = 0

				arg_322_1.typewritter:SetDirty()
				arg_322_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601082", "story_v_out_910601.awb") ~= 0 then
					local var_325_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601082", "story_v_out_910601.awb") / 1000

					if var_325_38 + var_325_30 > arg_322_1.duration_ then
						arg_322_1.duration_ = var_325_38 + var_325_30
					end

					if var_325_33.prefab_name ~= "" and arg_322_1.actors_[var_325_33.prefab_name] ~= nil then
						local var_325_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_322_1.actors_[var_325_33.prefab_name].transform, "story_v_out_910601", "910601082", "story_v_out_910601.awb")

						arg_322_1:RecordAudio("910601082", var_325_39)
						arg_322_1:RecordAudio("910601082", var_325_39)
					else
						arg_322_1:AudioAction("play", "voice", "story_v_out_910601", "910601082", "story_v_out_910601.awb")
					end

					arg_322_1:RecordHistoryTalkVoice("story_v_out_910601", "910601082", "story_v_out_910601.awb")
				end

				arg_322_1:RecordContent(arg_322_1.text_.text)
			end

			local var_325_40 = math.max(var_325_31, arg_322_1.talkMaxDuration)

			if var_325_30 <= arg_322_1.time_ and arg_322_1.time_ < var_325_30 + var_325_40 then
				arg_322_1.typewritter.percent = (arg_322_1.time_ - var_325_30) / var_325_40

				arg_322_1.typewritter:SetDirty()
			end

			if arg_322_1.time_ >= var_325_30 + var_325_40 and arg_322_1.time_ < var_325_30 + var_325_40 + arg_325_0 then
				arg_322_1.typewritter.percent = 1

				arg_322_1.typewritter:SetDirty()
				arg_322_1:ShowNextGo(true)
			end
		end
	end,
	Play910601083 = function(arg_326_0, arg_326_1)
		arg_326_1.time_ = 0
		arg_326_1.frameCnt_ = 0
		arg_326_1.state_ = "playing"
		arg_326_1.curTalkId_ = 910601083
		arg_326_1.duration_ = 5

		SetActive(arg_326_1.tipsGo_, false)

		function arg_326_1.onSingleLineFinish_()
			arg_326_1.onSingleLineUpdate_ = nil
			arg_326_1.onSingleLineFinish_ = nil
			arg_326_1.state_ = "waiting"
		end

		function arg_326_1.playNext_(arg_328_0)
			if arg_328_0 == 1 then
				arg_326_0:Play910601084(arg_326_1)
			end
		end

		function arg_326_1.onSingleLineUpdate_(arg_329_0)
			local var_329_0 = arg_326_1.actors_["1059ui_story"]
			local var_329_1 = 0

			if var_329_1 < arg_326_1.time_ and arg_326_1.time_ <= var_329_1 + arg_329_0 and arg_326_1.var_.characterEffect1059ui_story == nil then
				arg_326_1.var_.characterEffect1059ui_story = var_329_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_329_2 = 0.200000002980232

			if var_329_1 <= arg_326_1.time_ and arg_326_1.time_ < var_329_1 + var_329_2 then
				local var_329_3 = (arg_326_1.time_ - var_329_1) / var_329_2

				if arg_326_1.var_.characterEffect1059ui_story then
					local var_329_4 = Mathf.Lerp(0, 0.5, var_329_3)

					arg_326_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_326_1.var_.characterEffect1059ui_story.fillRatio = var_329_4
				end
			end

			if arg_326_1.time_ >= var_329_1 + var_329_2 and arg_326_1.time_ < var_329_1 + var_329_2 + arg_329_0 and arg_326_1.var_.characterEffect1059ui_story then
				local var_329_5 = 0.5

				arg_326_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_326_1.var_.characterEffect1059ui_story.fillRatio = var_329_5
			end

			local var_329_6 = 0
			local var_329_7 = 0.35

			if var_329_6 < arg_326_1.time_ and arg_326_1.time_ <= var_329_6 + arg_329_0 then
				arg_326_1.talkMaxDuration = 0
				arg_326_1.dialogCg_.alpha = 1

				arg_326_1.dialog_:SetActive(true)
				SetActive(arg_326_1.leftNameGo_, true)

				local var_329_8 = arg_326_1:FormatText(StoryNameCfg[7].name)

				arg_326_1.leftNameTxt_.text = var_329_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_326_1.leftNameTxt_.transform)

				arg_326_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_326_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_326_1:RecordName(arg_326_1.leftNameTxt_.text)
				SetActive(arg_326_1.iconTrs_.gameObject, false)
				arg_326_1.callingController_:SetSelectedState("normal")

				local var_329_9 = arg_326_1:GetWordFromCfg(910601083)
				local var_329_10 = arg_326_1:FormatText(var_329_9.content)

				arg_326_1.text_.text = var_329_10

				LuaForUtil.ClearLinePrefixSymbol(arg_326_1.text_)

				local var_329_11 = 14
				local var_329_12 = utf8.len(var_329_10)
				local var_329_13 = var_329_11 <= 0 and var_329_7 or var_329_7 * (var_329_12 / var_329_11)

				if var_329_13 > 0 and var_329_7 < var_329_13 then
					arg_326_1.talkMaxDuration = var_329_13

					if var_329_13 + var_329_6 > arg_326_1.duration_ then
						arg_326_1.duration_ = var_329_13 + var_329_6
					end
				end

				arg_326_1.text_.text = var_329_10
				arg_326_1.typewritter.percent = 0

				arg_326_1.typewritter:SetDirty()
				arg_326_1:ShowNextGo(false)
				arg_326_1:RecordContent(arg_326_1.text_.text)
			end

			local var_329_14 = math.max(var_329_7, arg_326_1.talkMaxDuration)

			if var_329_6 <= arg_326_1.time_ and arg_326_1.time_ < var_329_6 + var_329_14 then
				arg_326_1.typewritter.percent = (arg_326_1.time_ - var_329_6) / var_329_14

				arg_326_1.typewritter:SetDirty()
			end

			if arg_326_1.time_ >= var_329_6 + var_329_14 and arg_326_1.time_ < var_329_6 + var_329_14 + arg_329_0 then
				arg_326_1.typewritter.percent = 1

				arg_326_1.typewritter:SetDirty()
				arg_326_1:ShowNextGo(true)
			end
		end
	end,
	Play910601084 = function(arg_330_0, arg_330_1)
		arg_330_1.time_ = 0
		arg_330_1.frameCnt_ = 0
		arg_330_1.state_ = "playing"
		arg_330_1.curTalkId_ = 910601084
		arg_330_1.duration_ = 9.2

		SetActive(arg_330_1.tipsGo_, false)

		function arg_330_1.onSingleLineFinish_()
			arg_330_1.onSingleLineUpdate_ = nil
			arg_330_1.onSingleLineFinish_ = nil
			arg_330_1.state_ = "waiting"
		end

		function arg_330_1.playNext_(arg_332_0)
			if arg_332_0 == 1 then
				arg_330_0:Play910601085(arg_330_1)
			end
		end

		function arg_330_1.onSingleLineUpdate_(arg_333_0)
			local var_333_0 = arg_330_1.actors_["1084ui_story"].transform
			local var_333_1 = 0

			if var_333_1 < arg_330_1.time_ and arg_330_1.time_ <= var_333_1 + arg_333_0 then
				arg_330_1.var_.moveOldPos1084ui_story = var_333_0.localPosition
			end

			local var_333_2 = 0.001

			if var_333_1 <= arg_330_1.time_ and arg_330_1.time_ < var_333_1 + var_333_2 then
				local var_333_3 = (arg_330_1.time_ - var_333_1) / var_333_2
				local var_333_4 = Vector3.New(0, -0.97, -6)

				var_333_0.localPosition = Vector3.Lerp(arg_330_1.var_.moveOldPos1084ui_story, var_333_4, var_333_3)

				local var_333_5 = manager.ui.mainCamera.transform.position - var_333_0.position

				var_333_0.forward = Vector3.New(var_333_5.x, var_333_5.y, var_333_5.z)

				local var_333_6 = var_333_0.localEulerAngles

				var_333_6.z = 0
				var_333_6.x = 0
				var_333_0.localEulerAngles = var_333_6
			end

			if arg_330_1.time_ >= var_333_1 + var_333_2 and arg_330_1.time_ < var_333_1 + var_333_2 + arg_333_0 then
				var_333_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_333_7 = manager.ui.mainCamera.transform.position - var_333_0.position

				var_333_0.forward = Vector3.New(var_333_7.x, var_333_7.y, var_333_7.z)

				local var_333_8 = var_333_0.localEulerAngles

				var_333_8.z = 0
				var_333_8.x = 0
				var_333_0.localEulerAngles = var_333_8
			end

			local var_333_9 = arg_330_1.actors_["1084ui_story"]
			local var_333_10 = 0

			if var_333_10 < arg_330_1.time_ and arg_330_1.time_ <= var_333_10 + arg_333_0 and arg_330_1.var_.characterEffect1084ui_story == nil then
				arg_330_1.var_.characterEffect1084ui_story = var_333_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_333_11 = 0.200000002980232

			if var_333_10 <= arg_330_1.time_ and arg_330_1.time_ < var_333_10 + var_333_11 then
				local var_333_12 = (arg_330_1.time_ - var_333_10) / var_333_11

				if arg_330_1.var_.characterEffect1084ui_story then
					arg_330_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_330_1.time_ >= var_333_10 + var_333_11 and arg_330_1.time_ < var_333_10 + var_333_11 + arg_333_0 and arg_330_1.var_.characterEffect1084ui_story then
				arg_330_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_333_13 = 0

			if var_333_13 < arg_330_1.time_ and arg_330_1.time_ <= var_333_13 + arg_333_0 then
				arg_330_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_1")
			end

			local var_333_14 = 0

			if var_333_14 < arg_330_1.time_ and arg_330_1.time_ <= var_333_14 + arg_333_0 then
				arg_330_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_333_15 = arg_330_1.actors_["1059ui_story"].transform
			local var_333_16 = 0

			if var_333_16 < arg_330_1.time_ and arg_330_1.time_ <= var_333_16 + arg_333_0 then
				arg_330_1.var_.moveOldPos1059ui_story = var_333_15.localPosition
			end

			local var_333_17 = 0.001

			if var_333_16 <= arg_330_1.time_ and arg_330_1.time_ < var_333_16 + var_333_17 then
				local var_333_18 = (arg_330_1.time_ - var_333_16) / var_333_17
				local var_333_19 = Vector3.New(0, 100, 0)

				var_333_15.localPosition = Vector3.Lerp(arg_330_1.var_.moveOldPos1059ui_story, var_333_19, var_333_18)

				local var_333_20 = manager.ui.mainCamera.transform.position - var_333_15.position

				var_333_15.forward = Vector3.New(var_333_20.x, var_333_20.y, var_333_20.z)

				local var_333_21 = var_333_15.localEulerAngles

				var_333_21.z = 0
				var_333_21.x = 0
				var_333_15.localEulerAngles = var_333_21
			end

			if arg_330_1.time_ >= var_333_16 + var_333_17 and arg_330_1.time_ < var_333_16 + var_333_17 + arg_333_0 then
				var_333_15.localPosition = Vector3.New(0, 100, 0)

				local var_333_22 = manager.ui.mainCamera.transform.position - var_333_15.position

				var_333_15.forward = Vector3.New(var_333_22.x, var_333_22.y, var_333_22.z)

				local var_333_23 = var_333_15.localEulerAngles

				var_333_23.z = 0
				var_333_23.x = 0
				var_333_15.localEulerAngles = var_333_23
			end

			local var_333_24 = arg_330_1.actors_["1059ui_story"]
			local var_333_25 = 0

			if var_333_25 < arg_330_1.time_ and arg_330_1.time_ <= var_333_25 + arg_333_0 and arg_330_1.var_.characterEffect1059ui_story == nil then
				arg_330_1.var_.characterEffect1059ui_story = var_333_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_333_26 = 0.200000002980232

			if var_333_25 <= arg_330_1.time_ and arg_330_1.time_ < var_333_25 + var_333_26 then
				local var_333_27 = (arg_330_1.time_ - var_333_25) / var_333_26

				if arg_330_1.var_.characterEffect1059ui_story then
					local var_333_28 = Mathf.Lerp(0, 0.5, var_333_27)

					arg_330_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_330_1.var_.characterEffect1059ui_story.fillRatio = var_333_28
				end
			end

			if arg_330_1.time_ >= var_333_25 + var_333_26 and arg_330_1.time_ < var_333_25 + var_333_26 + arg_333_0 and arg_330_1.var_.characterEffect1059ui_story then
				local var_333_29 = 0.5

				arg_330_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_330_1.var_.characterEffect1059ui_story.fillRatio = var_333_29
			end

			local var_333_30 = 0
			local var_333_31 = 1.175

			if var_333_30 < arg_330_1.time_ and arg_330_1.time_ <= var_333_30 + arg_333_0 then
				arg_330_1.talkMaxDuration = 0
				arg_330_1.dialogCg_.alpha = 1

				arg_330_1.dialog_:SetActive(true)
				SetActive(arg_330_1.leftNameGo_, true)

				local var_333_32 = arg_330_1:FormatText(StoryNameCfg[6].name)

				arg_330_1.leftNameTxt_.text = var_333_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_330_1.leftNameTxt_.transform)

				arg_330_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_330_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_330_1:RecordName(arg_330_1.leftNameTxt_.text)
				SetActive(arg_330_1.iconTrs_.gameObject, false)
				arg_330_1.callingController_:SetSelectedState("normal")

				local var_333_33 = arg_330_1:GetWordFromCfg(910601084)
				local var_333_34 = arg_330_1:FormatText(var_333_33.content)

				arg_330_1.text_.text = var_333_34

				LuaForUtil.ClearLinePrefixSymbol(arg_330_1.text_)

				local var_333_35 = 47
				local var_333_36 = utf8.len(var_333_34)
				local var_333_37 = var_333_35 <= 0 and var_333_31 or var_333_31 * (var_333_36 / var_333_35)

				if var_333_37 > 0 and var_333_31 < var_333_37 then
					arg_330_1.talkMaxDuration = var_333_37

					if var_333_37 + var_333_30 > arg_330_1.duration_ then
						arg_330_1.duration_ = var_333_37 + var_333_30
					end
				end

				arg_330_1.text_.text = var_333_34
				arg_330_1.typewritter.percent = 0

				arg_330_1.typewritter:SetDirty()
				arg_330_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601084", "story_v_out_910601.awb") ~= 0 then
					local var_333_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601084", "story_v_out_910601.awb") / 1000

					if var_333_38 + var_333_30 > arg_330_1.duration_ then
						arg_330_1.duration_ = var_333_38 + var_333_30
					end

					if var_333_33.prefab_name ~= "" and arg_330_1.actors_[var_333_33.prefab_name] ~= nil then
						local var_333_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_330_1.actors_[var_333_33.prefab_name].transform, "story_v_out_910601", "910601084", "story_v_out_910601.awb")

						arg_330_1:RecordAudio("910601084", var_333_39)
						arg_330_1:RecordAudio("910601084", var_333_39)
					else
						arg_330_1:AudioAction("play", "voice", "story_v_out_910601", "910601084", "story_v_out_910601.awb")
					end

					arg_330_1:RecordHistoryTalkVoice("story_v_out_910601", "910601084", "story_v_out_910601.awb")
				end

				arg_330_1:RecordContent(arg_330_1.text_.text)
			end

			local var_333_40 = math.max(var_333_31, arg_330_1.talkMaxDuration)

			if var_333_30 <= arg_330_1.time_ and arg_330_1.time_ < var_333_30 + var_333_40 then
				arg_330_1.typewritter.percent = (arg_330_1.time_ - var_333_30) / var_333_40

				arg_330_1.typewritter:SetDirty()
			end

			if arg_330_1.time_ >= var_333_30 + var_333_40 and arg_330_1.time_ < var_333_30 + var_333_40 + arg_333_0 then
				arg_330_1.typewritter.percent = 1

				arg_330_1.typewritter:SetDirty()
				arg_330_1:ShowNextGo(true)
			end
		end
	end,
	Play910601085 = function(arg_334_0, arg_334_1)
		arg_334_1.time_ = 0
		arg_334_1.frameCnt_ = 0
		arg_334_1.state_ = "playing"
		arg_334_1.curTalkId_ = 910601085
		arg_334_1.duration_ = 5

		SetActive(arg_334_1.tipsGo_, false)

		function arg_334_1.onSingleLineFinish_()
			arg_334_1.onSingleLineUpdate_ = nil
			arg_334_1.onSingleLineFinish_ = nil
			arg_334_1.state_ = "waiting"
		end

		function arg_334_1.playNext_(arg_336_0)
			if arg_336_0 == 1 then
				arg_334_0:Play910601086(arg_334_1)
			end
		end

		function arg_334_1.onSingleLineUpdate_(arg_337_0)
			local var_337_0 = arg_334_1.actors_["1084ui_story"]
			local var_337_1 = 0

			if var_337_1 < arg_334_1.time_ and arg_334_1.time_ <= var_337_1 + arg_337_0 and arg_334_1.var_.characterEffect1084ui_story == nil then
				arg_334_1.var_.characterEffect1084ui_story = var_337_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_337_2 = 0.200000002980232

			if var_337_1 <= arg_334_1.time_ and arg_334_1.time_ < var_337_1 + var_337_2 then
				local var_337_3 = (arg_334_1.time_ - var_337_1) / var_337_2

				if arg_334_1.var_.characterEffect1084ui_story then
					local var_337_4 = Mathf.Lerp(0, 0.5, var_337_3)

					arg_334_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_334_1.var_.characterEffect1084ui_story.fillRatio = var_337_4
				end
			end

			if arg_334_1.time_ >= var_337_1 + var_337_2 and arg_334_1.time_ < var_337_1 + var_337_2 + arg_337_0 and arg_334_1.var_.characterEffect1084ui_story then
				local var_337_5 = 0.5

				arg_334_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_334_1.var_.characterEffect1084ui_story.fillRatio = var_337_5
			end

			local var_337_6 = 0
			local var_337_7 = 0.675

			if var_337_6 < arg_334_1.time_ and arg_334_1.time_ <= var_337_6 + arg_337_0 then
				arg_334_1.talkMaxDuration = 0
				arg_334_1.dialogCg_.alpha = 1

				arg_334_1.dialog_:SetActive(true)
				SetActive(arg_334_1.leftNameGo_, true)

				local var_337_8 = arg_334_1:FormatText(StoryNameCfg[7].name)

				arg_334_1.leftNameTxt_.text = var_337_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_334_1.leftNameTxt_.transform)

				arg_334_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_334_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_334_1:RecordName(arg_334_1.leftNameTxt_.text)
				SetActive(arg_334_1.iconTrs_.gameObject, false)
				arg_334_1.callingController_:SetSelectedState("normal")

				local var_337_9 = arg_334_1:GetWordFromCfg(910601085)
				local var_337_10 = arg_334_1:FormatText(var_337_9.content)

				arg_334_1.text_.text = var_337_10

				LuaForUtil.ClearLinePrefixSymbol(arg_334_1.text_)

				local var_337_11 = 25
				local var_337_12 = utf8.len(var_337_10)
				local var_337_13 = var_337_11 <= 0 and var_337_7 or var_337_7 * (var_337_12 / var_337_11)

				if var_337_13 > 0 and var_337_7 < var_337_13 then
					arg_334_1.talkMaxDuration = var_337_13

					if var_337_13 + var_337_6 > arg_334_1.duration_ then
						arg_334_1.duration_ = var_337_13 + var_337_6
					end
				end

				arg_334_1.text_.text = var_337_10
				arg_334_1.typewritter.percent = 0

				arg_334_1.typewritter:SetDirty()
				arg_334_1:ShowNextGo(false)
				arg_334_1:RecordContent(arg_334_1.text_.text)
			end

			local var_337_14 = math.max(var_337_7, arg_334_1.talkMaxDuration)

			if var_337_6 <= arg_334_1.time_ and arg_334_1.time_ < var_337_6 + var_337_14 then
				arg_334_1.typewritter.percent = (arg_334_1.time_ - var_337_6) / var_337_14

				arg_334_1.typewritter:SetDirty()
			end

			if arg_334_1.time_ >= var_337_6 + var_337_14 and arg_334_1.time_ < var_337_6 + var_337_14 + arg_337_0 then
				arg_334_1.typewritter.percent = 1

				arg_334_1.typewritter:SetDirty()
				arg_334_1:ShowNextGo(true)
			end
		end
	end,
	Play910601086 = function(arg_338_0, arg_338_1)
		arg_338_1.time_ = 0
		arg_338_1.frameCnt_ = 0
		arg_338_1.state_ = "playing"
		arg_338_1.curTalkId_ = 910601086
		arg_338_1.duration_ = 2

		SetActive(arg_338_1.tipsGo_, false)

		function arg_338_1.onSingleLineFinish_()
			arg_338_1.onSingleLineUpdate_ = nil
			arg_338_1.onSingleLineFinish_ = nil
			arg_338_1.state_ = "waiting"
		end

		function arg_338_1.playNext_(arg_340_0)
			if arg_340_0 == 1 then
				arg_338_0:Play910601087(arg_338_1)
			end
		end

		function arg_338_1.onSingleLineUpdate_(arg_341_0)
			local var_341_0 = "1184ui_story"

			if arg_338_1.actors_[var_341_0] == nil then
				local var_341_1 = Object.Instantiate(Asset.Load("Char/" .. var_341_0), arg_338_1.stage_.transform)

				var_341_1.name = var_341_0
				var_341_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_338_1.actors_[var_341_0] = var_341_1

				local var_341_2 = var_341_1:GetComponentInChildren(typeof(CharacterEffect))

				var_341_2.enabled = true

				local var_341_3 = GameObjectTools.GetOrAddComponent(var_341_1, typeof(DynamicBoneHelper))

				if var_341_3 then
					var_341_3:EnableDynamicBone(false)
				end

				arg_338_1:ShowWeapon(var_341_2.transform, false)

				arg_338_1.var_[var_341_0 .. "Animator"] = var_341_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_338_1.var_[var_341_0 .. "Animator"].applyRootMotion = true
				arg_338_1.var_[var_341_0 .. "LipSync"] = var_341_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_341_4 = arg_338_1.actors_["1184ui_story"].transform
			local var_341_5 = 0

			if var_341_5 < arg_338_1.time_ and arg_338_1.time_ <= var_341_5 + arg_341_0 then
				arg_338_1.var_.moveOldPos1184ui_story = var_341_4.localPosition
			end

			local var_341_6 = 0.001

			if var_341_5 <= arg_338_1.time_ and arg_338_1.time_ < var_341_5 + var_341_6 then
				local var_341_7 = (arg_338_1.time_ - var_341_5) / var_341_6
				local var_341_8 = Vector3.New(0, -0.97, -6)

				var_341_4.localPosition = Vector3.Lerp(arg_338_1.var_.moveOldPos1184ui_story, var_341_8, var_341_7)

				local var_341_9 = manager.ui.mainCamera.transform.position - var_341_4.position

				var_341_4.forward = Vector3.New(var_341_9.x, var_341_9.y, var_341_9.z)

				local var_341_10 = var_341_4.localEulerAngles

				var_341_10.z = 0
				var_341_10.x = 0
				var_341_4.localEulerAngles = var_341_10
			end

			if arg_338_1.time_ >= var_341_5 + var_341_6 and arg_338_1.time_ < var_341_5 + var_341_6 + arg_341_0 then
				var_341_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_341_11 = manager.ui.mainCamera.transform.position - var_341_4.position

				var_341_4.forward = Vector3.New(var_341_11.x, var_341_11.y, var_341_11.z)

				local var_341_12 = var_341_4.localEulerAngles

				var_341_12.z = 0
				var_341_12.x = 0
				var_341_4.localEulerAngles = var_341_12
			end

			local var_341_13 = arg_338_1.actors_["1084ui_story"]
			local var_341_14 = 0

			if var_341_14 < arg_338_1.time_ and arg_338_1.time_ <= var_341_14 + arg_341_0 and arg_338_1.var_.characterEffect1084ui_story == nil then
				arg_338_1.var_.characterEffect1084ui_story = var_341_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_341_15 = 0.200000002980232

			if var_341_14 <= arg_338_1.time_ and arg_338_1.time_ < var_341_14 + var_341_15 then
				local var_341_16 = (arg_338_1.time_ - var_341_14) / var_341_15

				if arg_338_1.var_.characterEffect1084ui_story then
					arg_338_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_338_1.time_ >= var_341_14 + var_341_15 and arg_338_1.time_ < var_341_14 + var_341_15 + arg_341_0 and arg_338_1.var_.characterEffect1084ui_story then
				arg_338_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_341_17 = 0

			if var_341_17 < arg_338_1.time_ and arg_338_1.time_ <= var_341_17 + arg_341_0 then
				arg_338_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action4212")
			end

			local var_341_18 = 0

			if var_341_18 < arg_338_1.time_ and arg_338_1.time_ <= var_341_18 + arg_341_0 then
				arg_338_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_341_19 = arg_338_1.actors_["1084ui_story"].transform
			local var_341_20 = 0

			if var_341_20 < arg_338_1.time_ and arg_338_1.time_ <= var_341_20 + arg_341_0 then
				arg_338_1.var_.moveOldPos1084ui_story = var_341_19.localPosition
			end

			local var_341_21 = 0.001

			if var_341_20 <= arg_338_1.time_ and arg_338_1.time_ < var_341_20 + var_341_21 then
				local var_341_22 = (arg_338_1.time_ - var_341_20) / var_341_21
				local var_341_23 = Vector3.New(0, 100, 0)

				var_341_19.localPosition = Vector3.Lerp(arg_338_1.var_.moveOldPos1084ui_story, var_341_23, var_341_22)

				local var_341_24 = manager.ui.mainCamera.transform.position - var_341_19.position

				var_341_19.forward = Vector3.New(var_341_24.x, var_341_24.y, var_341_24.z)

				local var_341_25 = var_341_19.localEulerAngles

				var_341_25.z = 0
				var_341_25.x = 0
				var_341_19.localEulerAngles = var_341_25
			end

			if arg_338_1.time_ >= var_341_20 + var_341_21 and arg_338_1.time_ < var_341_20 + var_341_21 + arg_341_0 then
				var_341_19.localPosition = Vector3.New(0, 100, 0)

				local var_341_26 = manager.ui.mainCamera.transform.position - var_341_19.position

				var_341_19.forward = Vector3.New(var_341_26.x, var_341_26.y, var_341_26.z)

				local var_341_27 = var_341_19.localEulerAngles

				var_341_27.z = 0
				var_341_27.x = 0
				var_341_19.localEulerAngles = var_341_27
			end

			local var_341_28 = 0
			local var_341_29 = 0.1

			if var_341_28 < arg_338_1.time_ and arg_338_1.time_ <= var_341_28 + arg_341_0 then
				arg_338_1.talkMaxDuration = 0
				arg_338_1.dialogCg_.alpha = 1

				arg_338_1.dialog_:SetActive(true)
				SetActive(arg_338_1.leftNameGo_, true)

				local var_341_30 = arg_338_1:FormatText(StoryNameCfg[6].name)

				arg_338_1.leftNameTxt_.text = var_341_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_338_1.leftNameTxt_.transform)

				arg_338_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_338_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_338_1:RecordName(arg_338_1.leftNameTxt_.text)
				SetActive(arg_338_1.iconTrs_.gameObject, false)
				arg_338_1.callingController_:SetSelectedState("normal")

				local var_341_31 = arg_338_1:GetWordFromCfg(910601086)
				local var_341_32 = arg_338_1:FormatText(var_341_31.content)

				arg_338_1.text_.text = var_341_32

				LuaForUtil.ClearLinePrefixSymbol(arg_338_1.text_)

				local var_341_33 = 4
				local var_341_34 = utf8.len(var_341_32)
				local var_341_35 = var_341_33 <= 0 and var_341_29 or var_341_29 * (var_341_34 / var_341_33)

				if var_341_35 > 0 and var_341_29 < var_341_35 then
					arg_338_1.talkMaxDuration = var_341_35

					if var_341_35 + var_341_28 > arg_338_1.duration_ then
						arg_338_1.duration_ = var_341_35 + var_341_28
					end
				end

				arg_338_1.text_.text = var_341_32
				arg_338_1.typewritter.percent = 0

				arg_338_1.typewritter:SetDirty()
				arg_338_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601086", "story_v_out_910601.awb") ~= 0 then
					local var_341_36 = manager.audio:GetVoiceLength("story_v_out_910601", "910601086", "story_v_out_910601.awb") / 1000

					if var_341_36 + var_341_28 > arg_338_1.duration_ then
						arg_338_1.duration_ = var_341_36 + var_341_28
					end

					if var_341_31.prefab_name ~= "" and arg_338_1.actors_[var_341_31.prefab_name] ~= nil then
						local var_341_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_338_1.actors_[var_341_31.prefab_name].transform, "story_v_out_910601", "910601086", "story_v_out_910601.awb")

						arg_338_1:RecordAudio("910601086", var_341_37)
						arg_338_1:RecordAudio("910601086", var_341_37)
					else
						arg_338_1:AudioAction("play", "voice", "story_v_out_910601", "910601086", "story_v_out_910601.awb")
					end

					arg_338_1:RecordHistoryTalkVoice("story_v_out_910601", "910601086", "story_v_out_910601.awb")
				end

				arg_338_1:RecordContent(arg_338_1.text_.text)
			end

			local var_341_38 = math.max(var_341_29, arg_338_1.talkMaxDuration)

			if var_341_28 <= arg_338_1.time_ and arg_338_1.time_ < var_341_28 + var_341_38 then
				arg_338_1.typewritter.percent = (arg_338_1.time_ - var_341_28) / var_341_38

				arg_338_1.typewritter:SetDirty()
			end

			if arg_338_1.time_ >= var_341_28 + var_341_38 and arg_338_1.time_ < var_341_28 + var_341_38 + arg_341_0 then
				arg_338_1.typewritter.percent = 1

				arg_338_1.typewritter:SetDirty()
				arg_338_1:ShowNextGo(true)
			end
		end
	end,
	Play910601087 = function(arg_342_0, arg_342_1)
		arg_342_1.time_ = 0
		arg_342_1.frameCnt_ = 0
		arg_342_1.state_ = "playing"
		arg_342_1.curTalkId_ = 910601087
		arg_342_1.duration_ = 5

		SetActive(arg_342_1.tipsGo_, false)

		function arg_342_1.onSingleLineFinish_()
			arg_342_1.onSingleLineUpdate_ = nil
			arg_342_1.onSingleLineFinish_ = nil
			arg_342_1.state_ = "waiting"
		end

		function arg_342_1.playNext_(arg_344_0)
			if arg_344_0 == 1 then
				arg_342_0:Play910601088(arg_342_1)
			end
		end

		function arg_342_1.onSingleLineUpdate_(arg_345_0)
			local var_345_0 = arg_342_1.actors_["1184ui_story"]
			local var_345_1 = 0

			if var_345_1 < arg_342_1.time_ and arg_342_1.time_ <= var_345_1 + arg_345_0 and arg_342_1.var_.characterEffect1184ui_story == nil then
				arg_342_1.var_.characterEffect1184ui_story = var_345_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_345_2 = 0.200000002980232

			if var_345_1 <= arg_342_1.time_ and arg_342_1.time_ < var_345_1 + var_345_2 then
				local var_345_3 = (arg_342_1.time_ - var_345_1) / var_345_2

				if arg_342_1.var_.characterEffect1184ui_story then
					local var_345_4 = Mathf.Lerp(0, 0.5, var_345_3)

					arg_342_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_342_1.var_.characterEffect1184ui_story.fillRatio = var_345_4
				end
			end

			if arg_342_1.time_ >= var_345_1 + var_345_2 and arg_342_1.time_ < var_345_1 + var_345_2 + arg_345_0 and arg_342_1.var_.characterEffect1184ui_story then
				local var_345_5 = 0.5

				arg_342_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_342_1.var_.characterEffect1184ui_story.fillRatio = var_345_5
			end

			local var_345_6 = arg_342_1.actors_["1184ui_story"].transform
			local var_345_7 = 0

			if var_345_7 < arg_342_1.time_ and arg_342_1.time_ <= var_345_7 + arg_345_0 then
				arg_342_1.var_.moveOldPos1184ui_story = var_345_6.localPosition
			end

			local var_345_8 = 0.001

			if var_345_7 <= arg_342_1.time_ and arg_342_1.time_ < var_345_7 + var_345_8 then
				local var_345_9 = (arg_342_1.time_ - var_345_7) / var_345_8
				local var_345_10 = Vector3.New(0, 100, 0)

				var_345_6.localPosition = Vector3.Lerp(arg_342_1.var_.moveOldPos1184ui_story, var_345_10, var_345_9)

				local var_345_11 = manager.ui.mainCamera.transform.position - var_345_6.position

				var_345_6.forward = Vector3.New(var_345_11.x, var_345_11.y, var_345_11.z)

				local var_345_12 = var_345_6.localEulerAngles

				var_345_12.z = 0
				var_345_12.x = 0
				var_345_6.localEulerAngles = var_345_12
			end

			if arg_342_1.time_ >= var_345_7 + var_345_8 and arg_342_1.time_ < var_345_7 + var_345_8 + arg_345_0 then
				var_345_6.localPosition = Vector3.New(0, 100, 0)

				local var_345_13 = manager.ui.mainCamera.transform.position - var_345_6.position

				var_345_6.forward = Vector3.New(var_345_13.x, var_345_13.y, var_345_13.z)

				local var_345_14 = var_345_6.localEulerAngles

				var_345_14.z = 0
				var_345_14.x = 0
				var_345_6.localEulerAngles = var_345_14
			end

			local var_345_15 = 0
			local var_345_16 = 0.375

			if var_345_15 < arg_342_1.time_ and arg_342_1.time_ <= var_345_15 + arg_345_0 then
				arg_342_1.talkMaxDuration = 0
				arg_342_1.dialogCg_.alpha = 1

				arg_342_1.dialog_:SetActive(true)
				SetActive(arg_342_1.leftNameGo_, true)

				local var_345_17 = arg_342_1:FormatText(StoryNameCfg[7].name)

				arg_342_1.leftNameTxt_.text = var_345_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_342_1.leftNameTxt_.transform)

				arg_342_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_342_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_342_1:RecordName(arg_342_1.leftNameTxt_.text)
				SetActive(arg_342_1.iconTrs_.gameObject, false)
				arg_342_1.callingController_:SetSelectedState("normal")

				local var_345_18 = arg_342_1:GetWordFromCfg(910601087)
				local var_345_19 = arg_342_1:FormatText(var_345_18.content)

				arg_342_1.text_.text = var_345_19

				LuaForUtil.ClearLinePrefixSymbol(arg_342_1.text_)

				local var_345_20 = 15
				local var_345_21 = utf8.len(var_345_19)
				local var_345_22 = var_345_20 <= 0 and var_345_16 or var_345_16 * (var_345_21 / var_345_20)

				if var_345_22 > 0 and var_345_16 < var_345_22 then
					arg_342_1.talkMaxDuration = var_345_22

					if var_345_22 + var_345_15 > arg_342_1.duration_ then
						arg_342_1.duration_ = var_345_22 + var_345_15
					end
				end

				arg_342_1.text_.text = var_345_19
				arg_342_1.typewritter.percent = 0

				arg_342_1.typewritter:SetDirty()
				arg_342_1:ShowNextGo(false)
				arg_342_1:RecordContent(arg_342_1.text_.text)
			end

			local var_345_23 = math.max(var_345_16, arg_342_1.talkMaxDuration)

			if var_345_15 <= arg_342_1.time_ and arg_342_1.time_ < var_345_15 + var_345_23 then
				arg_342_1.typewritter.percent = (arg_342_1.time_ - var_345_15) / var_345_23

				arg_342_1.typewritter:SetDirty()
			end

			if arg_342_1.time_ >= var_345_15 + var_345_23 and arg_342_1.time_ < var_345_15 + var_345_23 + arg_345_0 then
				arg_342_1.typewritter.percent = 1

				arg_342_1.typewritter:SetDirty()
				arg_342_1:ShowNextGo(true)
			end
		end
	end,
	Play910601088 = function(arg_346_0, arg_346_1)
		arg_346_1.time_ = 0
		arg_346_1.frameCnt_ = 0
		arg_346_1.state_ = "playing"
		arg_346_1.curTalkId_ = 910601088
		arg_346_1.duration_ = 2.9

		SetActive(arg_346_1.tipsGo_, false)

		function arg_346_1.onSingleLineFinish_()
			arg_346_1.onSingleLineUpdate_ = nil
			arg_346_1.onSingleLineFinish_ = nil
			arg_346_1.state_ = "waiting"
		end

		function arg_346_1.playNext_(arg_348_0)
			if arg_348_0 == 1 then
				arg_346_0:Play910601089(arg_346_1)
			end
		end

		function arg_346_1.onSingleLineUpdate_(arg_349_0)
			local var_349_0 = arg_346_1.actors_["1084ui_story"].transform
			local var_349_1 = 0

			if var_349_1 < arg_346_1.time_ and arg_346_1.time_ <= var_349_1 + arg_349_0 then
				arg_346_1.var_.moveOldPos1084ui_story = var_349_0.localPosition
			end

			local var_349_2 = 0.001

			if var_349_1 <= arg_346_1.time_ and arg_346_1.time_ < var_349_1 + var_349_2 then
				local var_349_3 = (arg_346_1.time_ - var_349_1) / var_349_2
				local var_349_4 = Vector3.New(0, -0.97, -6)

				var_349_0.localPosition = Vector3.Lerp(arg_346_1.var_.moveOldPos1084ui_story, var_349_4, var_349_3)

				local var_349_5 = manager.ui.mainCamera.transform.position - var_349_0.position

				var_349_0.forward = Vector3.New(var_349_5.x, var_349_5.y, var_349_5.z)

				local var_349_6 = var_349_0.localEulerAngles

				var_349_6.z = 0
				var_349_6.x = 0
				var_349_0.localEulerAngles = var_349_6
			end

			if arg_346_1.time_ >= var_349_1 + var_349_2 and arg_346_1.time_ < var_349_1 + var_349_2 + arg_349_0 then
				var_349_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_349_7 = manager.ui.mainCamera.transform.position - var_349_0.position

				var_349_0.forward = Vector3.New(var_349_7.x, var_349_7.y, var_349_7.z)

				local var_349_8 = var_349_0.localEulerAngles

				var_349_8.z = 0
				var_349_8.x = 0
				var_349_0.localEulerAngles = var_349_8
			end

			local var_349_9 = arg_346_1.actors_["1084ui_story"]
			local var_349_10 = 0

			if var_349_10 < arg_346_1.time_ and arg_346_1.time_ <= var_349_10 + arg_349_0 and arg_346_1.var_.characterEffect1084ui_story == nil then
				arg_346_1.var_.characterEffect1084ui_story = var_349_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_349_11 = 0.200000002980232

			if var_349_10 <= arg_346_1.time_ and arg_346_1.time_ < var_349_10 + var_349_11 then
				local var_349_12 = (arg_346_1.time_ - var_349_10) / var_349_11

				if arg_346_1.var_.characterEffect1084ui_story then
					arg_346_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_346_1.time_ >= var_349_10 + var_349_11 and arg_346_1.time_ < var_349_10 + var_349_11 + arg_349_0 and arg_346_1.var_.characterEffect1084ui_story then
				arg_346_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_349_13 = 0

			if var_349_13 < arg_346_1.time_ and arg_346_1.time_ <= var_349_13 + arg_349_0 then
				arg_346_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_2")
			end

			local var_349_14 = 0

			if var_349_14 < arg_346_1.time_ and arg_346_1.time_ <= var_349_14 + arg_349_0 then
				arg_346_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_349_15 = 0
			local var_349_16 = 0.375

			if var_349_15 < arg_346_1.time_ and arg_346_1.time_ <= var_349_15 + arg_349_0 then
				arg_346_1.talkMaxDuration = 0
				arg_346_1.dialogCg_.alpha = 1

				arg_346_1.dialog_:SetActive(true)
				SetActive(arg_346_1.leftNameGo_, true)

				local var_349_17 = arg_346_1:FormatText(StoryNameCfg[6].name)

				arg_346_1.leftNameTxt_.text = var_349_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_346_1.leftNameTxt_.transform)

				arg_346_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_346_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_346_1:RecordName(arg_346_1.leftNameTxt_.text)
				SetActive(arg_346_1.iconTrs_.gameObject, false)
				arg_346_1.callingController_:SetSelectedState("normal")

				local var_349_18 = arg_346_1:GetWordFromCfg(910601088)
				local var_349_19 = arg_346_1:FormatText(var_349_18.content)

				arg_346_1.text_.text = var_349_19

				LuaForUtil.ClearLinePrefixSymbol(arg_346_1.text_)

				local var_349_20 = 15
				local var_349_21 = utf8.len(var_349_19)
				local var_349_22 = var_349_20 <= 0 and var_349_16 or var_349_16 * (var_349_21 / var_349_20)

				if var_349_22 > 0 and var_349_16 < var_349_22 then
					arg_346_1.talkMaxDuration = var_349_22

					if var_349_22 + var_349_15 > arg_346_1.duration_ then
						arg_346_1.duration_ = var_349_22 + var_349_15
					end
				end

				arg_346_1.text_.text = var_349_19
				arg_346_1.typewritter.percent = 0

				arg_346_1.typewritter:SetDirty()
				arg_346_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601088", "story_v_out_910601.awb") ~= 0 then
					local var_349_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601088", "story_v_out_910601.awb") / 1000

					if var_349_23 + var_349_15 > arg_346_1.duration_ then
						arg_346_1.duration_ = var_349_23 + var_349_15
					end

					if var_349_18.prefab_name ~= "" and arg_346_1.actors_[var_349_18.prefab_name] ~= nil then
						local var_349_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_346_1.actors_[var_349_18.prefab_name].transform, "story_v_out_910601", "910601088", "story_v_out_910601.awb")

						arg_346_1:RecordAudio("910601088", var_349_24)
						arg_346_1:RecordAudio("910601088", var_349_24)
					else
						arg_346_1:AudioAction("play", "voice", "story_v_out_910601", "910601088", "story_v_out_910601.awb")
					end

					arg_346_1:RecordHistoryTalkVoice("story_v_out_910601", "910601088", "story_v_out_910601.awb")
				end

				arg_346_1:RecordContent(arg_346_1.text_.text)
			end

			local var_349_25 = math.max(var_349_16, arg_346_1.talkMaxDuration)

			if var_349_15 <= arg_346_1.time_ and arg_346_1.time_ < var_349_15 + var_349_25 then
				arg_346_1.typewritter.percent = (arg_346_1.time_ - var_349_15) / var_349_25

				arg_346_1.typewritter:SetDirty()
			end

			if arg_346_1.time_ >= var_349_15 + var_349_25 and arg_346_1.time_ < var_349_15 + var_349_25 + arg_349_0 then
				arg_346_1.typewritter.percent = 1

				arg_346_1.typewritter:SetDirty()
				arg_346_1:ShowNextGo(true)
			end
		end
	end,
	Play910601089 = function(arg_350_0, arg_350_1)
		arg_350_1.time_ = 0
		arg_350_1.frameCnt_ = 0
		arg_350_1.state_ = "playing"
		arg_350_1.curTalkId_ = 910601089
		arg_350_1.duration_ = 13.17

		SetActive(arg_350_1.tipsGo_, false)

		function arg_350_1.onSingleLineFinish_()
			arg_350_1.onSingleLineUpdate_ = nil
			arg_350_1.onSingleLineFinish_ = nil
			arg_350_1.state_ = "waiting"
		end

		function arg_350_1.playNext_(arg_352_0)
			if arg_352_0 == 1 then
				arg_350_0:Play910601090(arg_350_1)
			end
		end

		function arg_350_1.onSingleLineUpdate_(arg_353_0)
			local var_353_0 = arg_350_1.actors_["1084ui_story"].transform
			local var_353_1 = 0

			if var_353_1 < arg_350_1.time_ and arg_350_1.time_ <= var_353_1 + arg_353_0 then
				arg_350_1.var_.moveOldPos1084ui_story = var_353_0.localPosition
			end

			local var_353_2 = 0.001

			if var_353_1 <= arg_350_1.time_ and arg_350_1.time_ < var_353_1 + var_353_2 then
				local var_353_3 = (arg_350_1.time_ - var_353_1) / var_353_2
				local var_353_4 = Vector3.New(0, -0.97, -6)

				var_353_0.localPosition = Vector3.Lerp(arg_350_1.var_.moveOldPos1084ui_story, var_353_4, var_353_3)

				local var_353_5 = manager.ui.mainCamera.transform.position - var_353_0.position

				var_353_0.forward = Vector3.New(var_353_5.x, var_353_5.y, var_353_5.z)

				local var_353_6 = var_353_0.localEulerAngles

				var_353_6.z = 0
				var_353_6.x = 0
				var_353_0.localEulerAngles = var_353_6
			end

			if arg_350_1.time_ >= var_353_1 + var_353_2 and arg_350_1.time_ < var_353_1 + var_353_2 + arg_353_0 then
				var_353_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_353_7 = manager.ui.mainCamera.transform.position - var_353_0.position

				var_353_0.forward = Vector3.New(var_353_7.x, var_353_7.y, var_353_7.z)

				local var_353_8 = var_353_0.localEulerAngles

				var_353_8.z = 0
				var_353_8.x = 0
				var_353_0.localEulerAngles = var_353_8
			end

			local var_353_9 = arg_350_1.actors_["1084ui_story"]
			local var_353_10 = 0

			if var_353_10 < arg_350_1.time_ and arg_350_1.time_ <= var_353_10 + arg_353_0 and arg_350_1.var_.characterEffect1084ui_story == nil then
				arg_350_1.var_.characterEffect1084ui_story = var_353_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_353_11 = 0.200000002980232

			if var_353_10 <= arg_350_1.time_ and arg_350_1.time_ < var_353_10 + var_353_11 then
				local var_353_12 = (arg_350_1.time_ - var_353_10) / var_353_11

				if arg_350_1.var_.characterEffect1084ui_story then
					arg_350_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_350_1.time_ >= var_353_10 + var_353_11 and arg_350_1.time_ < var_353_10 + var_353_11 + arg_353_0 and arg_350_1.var_.characterEffect1084ui_story then
				arg_350_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_353_13 = 0

			if var_353_13 < arg_350_1.time_ and arg_350_1.time_ <= var_353_13 + arg_353_0 then
				arg_350_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_353_14 = 0

			if var_353_14 < arg_350_1.time_ and arg_350_1.time_ <= var_353_14 + arg_353_0 then
				arg_350_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_353_15 = 0
			local var_353_16 = 1.3

			if var_353_15 < arg_350_1.time_ and arg_350_1.time_ <= var_353_15 + arg_353_0 then
				arg_350_1.talkMaxDuration = 0
				arg_350_1.dialogCg_.alpha = 1

				arg_350_1.dialog_:SetActive(true)
				SetActive(arg_350_1.leftNameGo_, true)

				local var_353_17 = arg_350_1:FormatText(StoryNameCfg[6].name)

				arg_350_1.leftNameTxt_.text = var_353_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_350_1.leftNameTxt_.transform)

				arg_350_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_350_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_350_1:RecordName(arg_350_1.leftNameTxt_.text)
				SetActive(arg_350_1.iconTrs_.gameObject, false)
				arg_350_1.callingController_:SetSelectedState("normal")

				local var_353_18 = arg_350_1:GetWordFromCfg(910601089)
				local var_353_19 = arg_350_1:FormatText(var_353_18.content)

				arg_350_1.text_.text = var_353_19

				LuaForUtil.ClearLinePrefixSymbol(arg_350_1.text_)

				local var_353_20 = 52
				local var_353_21 = utf8.len(var_353_19)
				local var_353_22 = var_353_20 <= 0 and var_353_16 or var_353_16 * (var_353_21 / var_353_20)

				if var_353_22 > 0 and var_353_16 < var_353_22 then
					arg_350_1.talkMaxDuration = var_353_22

					if var_353_22 + var_353_15 > arg_350_1.duration_ then
						arg_350_1.duration_ = var_353_22 + var_353_15
					end
				end

				arg_350_1.text_.text = var_353_19
				arg_350_1.typewritter.percent = 0

				arg_350_1.typewritter:SetDirty()
				arg_350_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601089", "story_v_out_910601.awb") ~= 0 then
					local var_353_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601089", "story_v_out_910601.awb") / 1000

					if var_353_23 + var_353_15 > arg_350_1.duration_ then
						arg_350_1.duration_ = var_353_23 + var_353_15
					end

					if var_353_18.prefab_name ~= "" and arg_350_1.actors_[var_353_18.prefab_name] ~= nil then
						local var_353_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_350_1.actors_[var_353_18.prefab_name].transform, "story_v_out_910601", "910601089", "story_v_out_910601.awb")

						arg_350_1:RecordAudio("910601089", var_353_24)
						arg_350_1:RecordAudio("910601089", var_353_24)
					else
						arg_350_1:AudioAction("play", "voice", "story_v_out_910601", "910601089", "story_v_out_910601.awb")
					end

					arg_350_1:RecordHistoryTalkVoice("story_v_out_910601", "910601089", "story_v_out_910601.awb")
				end

				arg_350_1:RecordContent(arg_350_1.text_.text)
			end

			local var_353_25 = math.max(var_353_16, arg_350_1.talkMaxDuration)

			if var_353_15 <= arg_350_1.time_ and arg_350_1.time_ < var_353_15 + var_353_25 then
				arg_350_1.typewritter.percent = (arg_350_1.time_ - var_353_15) / var_353_25

				arg_350_1.typewritter:SetDirty()
			end

			if arg_350_1.time_ >= var_353_15 + var_353_25 and arg_350_1.time_ < var_353_15 + var_353_25 + arg_353_0 then
				arg_350_1.typewritter.percent = 1

				arg_350_1.typewritter:SetDirty()
				arg_350_1:ShowNextGo(true)
			end
		end
	end,
	Play910601090 = function(arg_354_0, arg_354_1)
		arg_354_1.time_ = 0
		arg_354_1.frameCnt_ = 0
		arg_354_1.state_ = "playing"
		arg_354_1.curTalkId_ = 910601090
		arg_354_1.duration_ = 5

		SetActive(arg_354_1.tipsGo_, false)

		function arg_354_1.onSingleLineFinish_()
			arg_354_1.onSingleLineUpdate_ = nil
			arg_354_1.onSingleLineFinish_ = nil
			arg_354_1.state_ = "waiting"
		end

		function arg_354_1.playNext_(arg_356_0)
			if arg_356_0 == 1 then
				arg_354_0:Play910601091(arg_354_1)
			end
		end

		function arg_354_1.onSingleLineUpdate_(arg_357_0)
			local var_357_0 = arg_354_1.actors_["1084ui_story"]
			local var_357_1 = 0

			if var_357_1 < arg_354_1.time_ and arg_354_1.time_ <= var_357_1 + arg_357_0 and arg_354_1.var_.characterEffect1084ui_story == nil then
				arg_354_1.var_.characterEffect1084ui_story = var_357_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_357_2 = 0.200000002980232

			if var_357_1 <= arg_354_1.time_ and arg_354_1.time_ < var_357_1 + var_357_2 then
				local var_357_3 = (arg_354_1.time_ - var_357_1) / var_357_2

				if arg_354_1.var_.characterEffect1084ui_story then
					local var_357_4 = Mathf.Lerp(0, 0.5, var_357_3)

					arg_354_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_354_1.var_.characterEffect1084ui_story.fillRatio = var_357_4
				end
			end

			if arg_354_1.time_ >= var_357_1 + var_357_2 and arg_354_1.time_ < var_357_1 + var_357_2 + arg_357_0 and arg_354_1.var_.characterEffect1084ui_story then
				local var_357_5 = 0.5

				arg_354_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_354_1.var_.characterEffect1084ui_story.fillRatio = var_357_5
			end

			local var_357_6 = 0
			local var_357_7 = 0.425

			if var_357_6 < arg_354_1.time_ and arg_354_1.time_ <= var_357_6 + arg_357_0 then
				arg_354_1.talkMaxDuration = 0
				arg_354_1.dialogCg_.alpha = 1

				arg_354_1.dialog_:SetActive(true)
				SetActive(arg_354_1.leftNameGo_, true)

				local var_357_8 = arg_354_1:FormatText(StoryNameCfg[7].name)

				arg_354_1.leftNameTxt_.text = var_357_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_354_1.leftNameTxt_.transform)

				arg_354_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_354_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_354_1:RecordName(arg_354_1.leftNameTxt_.text)
				SetActive(arg_354_1.iconTrs_.gameObject, false)
				arg_354_1.callingController_:SetSelectedState("normal")

				local var_357_9 = arg_354_1:GetWordFromCfg(910601090)
				local var_357_10 = arg_354_1:FormatText(var_357_9.content)

				arg_354_1.text_.text = var_357_10

				LuaForUtil.ClearLinePrefixSymbol(arg_354_1.text_)

				local var_357_11 = 17
				local var_357_12 = utf8.len(var_357_10)
				local var_357_13 = var_357_11 <= 0 and var_357_7 or var_357_7 * (var_357_12 / var_357_11)

				if var_357_13 > 0 and var_357_7 < var_357_13 then
					arg_354_1.talkMaxDuration = var_357_13

					if var_357_13 + var_357_6 > arg_354_1.duration_ then
						arg_354_1.duration_ = var_357_13 + var_357_6
					end
				end

				arg_354_1.text_.text = var_357_10
				arg_354_1.typewritter.percent = 0

				arg_354_1.typewritter:SetDirty()
				arg_354_1:ShowNextGo(false)
				arg_354_1:RecordContent(arg_354_1.text_.text)
			end

			local var_357_14 = math.max(var_357_7, arg_354_1.talkMaxDuration)

			if var_357_6 <= arg_354_1.time_ and arg_354_1.time_ < var_357_6 + var_357_14 then
				arg_354_1.typewritter.percent = (arg_354_1.time_ - var_357_6) / var_357_14

				arg_354_1.typewritter:SetDirty()
			end

			if arg_354_1.time_ >= var_357_6 + var_357_14 and arg_354_1.time_ < var_357_6 + var_357_14 + arg_357_0 then
				arg_354_1.typewritter.percent = 1

				arg_354_1.typewritter:SetDirty()
				arg_354_1:ShowNextGo(true)
			end
		end
	end,
	Play910601091 = function(arg_358_0, arg_358_1)
		arg_358_1.time_ = 0
		arg_358_1.frameCnt_ = 0
		arg_358_1.state_ = "playing"
		arg_358_1.curTalkId_ = 910601091
		arg_358_1.duration_ = 6.83

		SetActive(arg_358_1.tipsGo_, false)

		function arg_358_1.onSingleLineFinish_()
			arg_358_1.onSingleLineUpdate_ = nil
			arg_358_1.onSingleLineFinish_ = nil
			arg_358_1.state_ = "waiting"
		end

		function arg_358_1.playNext_(arg_360_0)
			if arg_360_0 == 1 then
				arg_358_0:Play910601092(arg_358_1)
			end
		end

		function arg_358_1.onSingleLineUpdate_(arg_361_0)
			local var_361_0 = arg_358_1.actors_["1084ui_story"]
			local var_361_1 = 0

			if var_361_1 < arg_358_1.time_ and arg_358_1.time_ <= var_361_1 + arg_361_0 and arg_358_1.var_.characterEffect1084ui_story == nil then
				arg_358_1.var_.characterEffect1084ui_story = var_361_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_361_2 = 0.200000002980232

			if var_361_1 <= arg_358_1.time_ and arg_358_1.time_ < var_361_1 + var_361_2 then
				local var_361_3 = (arg_358_1.time_ - var_361_1) / var_361_2

				if arg_358_1.var_.characterEffect1084ui_story then
					arg_358_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_358_1.time_ >= var_361_1 + var_361_2 and arg_358_1.time_ < var_361_1 + var_361_2 + arg_361_0 and arg_358_1.var_.characterEffect1084ui_story then
				arg_358_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_361_4 = 0
			local var_361_5 = 0.65

			if var_361_4 < arg_358_1.time_ and arg_358_1.time_ <= var_361_4 + arg_361_0 then
				arg_358_1.talkMaxDuration = 0
				arg_358_1.dialogCg_.alpha = 1

				arg_358_1.dialog_:SetActive(true)
				SetActive(arg_358_1.leftNameGo_, true)

				local var_361_6 = arg_358_1:FormatText(StoryNameCfg[6].name)

				arg_358_1.leftNameTxt_.text = var_361_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_358_1.leftNameTxt_.transform)

				arg_358_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_358_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_358_1:RecordName(arg_358_1.leftNameTxt_.text)
				SetActive(arg_358_1.iconTrs_.gameObject, false)
				arg_358_1.callingController_:SetSelectedState("normal")

				local var_361_7 = arg_358_1:GetWordFromCfg(910601091)
				local var_361_8 = arg_358_1:FormatText(var_361_7.content)

				arg_358_1.text_.text = var_361_8

				LuaForUtil.ClearLinePrefixSymbol(arg_358_1.text_)

				local var_361_9 = 26
				local var_361_10 = utf8.len(var_361_8)
				local var_361_11 = var_361_9 <= 0 and var_361_5 or var_361_5 * (var_361_10 / var_361_9)

				if var_361_11 > 0 and var_361_5 < var_361_11 then
					arg_358_1.talkMaxDuration = var_361_11

					if var_361_11 + var_361_4 > arg_358_1.duration_ then
						arg_358_1.duration_ = var_361_11 + var_361_4
					end
				end

				arg_358_1.text_.text = var_361_8
				arg_358_1.typewritter.percent = 0

				arg_358_1.typewritter:SetDirty()
				arg_358_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601091", "story_v_out_910601.awb") ~= 0 then
					local var_361_12 = manager.audio:GetVoiceLength("story_v_out_910601", "910601091", "story_v_out_910601.awb") / 1000

					if var_361_12 + var_361_4 > arg_358_1.duration_ then
						arg_358_1.duration_ = var_361_12 + var_361_4
					end

					if var_361_7.prefab_name ~= "" and arg_358_1.actors_[var_361_7.prefab_name] ~= nil then
						local var_361_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_358_1.actors_[var_361_7.prefab_name].transform, "story_v_out_910601", "910601091", "story_v_out_910601.awb")

						arg_358_1:RecordAudio("910601091", var_361_13)
						arg_358_1:RecordAudio("910601091", var_361_13)
					else
						arg_358_1:AudioAction("play", "voice", "story_v_out_910601", "910601091", "story_v_out_910601.awb")
					end

					arg_358_1:RecordHistoryTalkVoice("story_v_out_910601", "910601091", "story_v_out_910601.awb")
				end

				arg_358_1:RecordContent(arg_358_1.text_.text)
			end

			local var_361_14 = math.max(var_361_5, arg_358_1.talkMaxDuration)

			if var_361_4 <= arg_358_1.time_ and arg_358_1.time_ < var_361_4 + var_361_14 then
				arg_358_1.typewritter.percent = (arg_358_1.time_ - var_361_4) / var_361_14

				arg_358_1.typewritter:SetDirty()
			end

			if arg_358_1.time_ >= var_361_4 + var_361_14 and arg_358_1.time_ < var_361_4 + var_361_14 + arg_361_0 then
				arg_358_1.typewritter.percent = 1

				arg_358_1.typewritter:SetDirty()
				arg_358_1:ShowNextGo(true)
			end
		end
	end,
	Play910601092 = function(arg_362_0, arg_362_1)
		arg_362_1.time_ = 0
		arg_362_1.frameCnt_ = 0
		arg_362_1.state_ = "playing"
		arg_362_1.curTalkId_ = 910601092
		arg_362_1.duration_ = 5

		SetActive(arg_362_1.tipsGo_, false)

		function arg_362_1.onSingleLineFinish_()
			arg_362_1.onSingleLineUpdate_ = nil
			arg_362_1.onSingleLineFinish_ = nil
			arg_362_1.state_ = "waiting"
		end

		function arg_362_1.playNext_(arg_364_0)
			if arg_364_0 == 1 then
				arg_362_0:Play910601093(arg_362_1)
			end
		end

		function arg_362_1.onSingleLineUpdate_(arg_365_0)
			local var_365_0 = arg_362_1.actors_["1084ui_story"]
			local var_365_1 = 0

			if var_365_1 < arg_362_1.time_ and arg_362_1.time_ <= var_365_1 + arg_365_0 and arg_362_1.var_.characterEffect1084ui_story == nil then
				arg_362_1.var_.characterEffect1084ui_story = var_365_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_365_2 = 0.200000002980232

			if var_365_1 <= arg_362_1.time_ and arg_362_1.time_ < var_365_1 + var_365_2 then
				local var_365_3 = (arg_362_1.time_ - var_365_1) / var_365_2

				if arg_362_1.var_.characterEffect1084ui_story then
					local var_365_4 = Mathf.Lerp(0, 0.5, var_365_3)

					arg_362_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_362_1.var_.characterEffect1084ui_story.fillRatio = var_365_4
				end
			end

			if arg_362_1.time_ >= var_365_1 + var_365_2 and arg_362_1.time_ < var_365_1 + var_365_2 + arg_365_0 and arg_362_1.var_.characterEffect1084ui_story then
				local var_365_5 = 0.5

				arg_362_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_362_1.var_.characterEffect1084ui_story.fillRatio = var_365_5
			end

			local var_365_6 = 0
			local var_365_7 = 0.5

			if var_365_6 < arg_362_1.time_ and arg_362_1.time_ <= var_365_6 + arg_365_0 then
				arg_362_1.talkMaxDuration = 0
				arg_362_1.dialogCg_.alpha = 1

				arg_362_1.dialog_:SetActive(true)
				SetActive(arg_362_1.leftNameGo_, true)

				local var_365_8 = arg_362_1:FormatText(StoryNameCfg[7].name)

				arg_362_1.leftNameTxt_.text = var_365_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_362_1.leftNameTxt_.transform)

				arg_362_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_362_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_362_1:RecordName(arg_362_1.leftNameTxt_.text)
				SetActive(arg_362_1.iconTrs_.gameObject, false)
				arg_362_1.callingController_:SetSelectedState("normal")

				local var_365_9 = arg_362_1:GetWordFromCfg(910601092)
				local var_365_10 = arg_362_1:FormatText(var_365_9.content)

				arg_362_1.text_.text = var_365_10

				LuaForUtil.ClearLinePrefixSymbol(arg_362_1.text_)

				local var_365_11 = 20
				local var_365_12 = utf8.len(var_365_10)
				local var_365_13 = var_365_11 <= 0 and var_365_7 or var_365_7 * (var_365_12 / var_365_11)

				if var_365_13 > 0 and var_365_7 < var_365_13 then
					arg_362_1.talkMaxDuration = var_365_13

					if var_365_13 + var_365_6 > arg_362_1.duration_ then
						arg_362_1.duration_ = var_365_13 + var_365_6
					end
				end

				arg_362_1.text_.text = var_365_10
				arg_362_1.typewritter.percent = 0

				arg_362_1.typewritter:SetDirty()
				arg_362_1:ShowNextGo(false)
				arg_362_1:RecordContent(arg_362_1.text_.text)
			end

			local var_365_14 = math.max(var_365_7, arg_362_1.talkMaxDuration)

			if var_365_6 <= arg_362_1.time_ and arg_362_1.time_ < var_365_6 + var_365_14 then
				arg_362_1.typewritter.percent = (arg_362_1.time_ - var_365_6) / var_365_14

				arg_362_1.typewritter:SetDirty()
			end

			if arg_362_1.time_ >= var_365_6 + var_365_14 and arg_362_1.time_ < var_365_6 + var_365_14 + arg_365_0 then
				arg_362_1.typewritter.percent = 1

				arg_362_1.typewritter:SetDirty()
				arg_362_1:ShowNextGo(true)
			end
		end
	end,
	Play910601093 = function(arg_366_0, arg_366_1)
		arg_366_1.time_ = 0
		arg_366_1.frameCnt_ = 0
		arg_366_1.state_ = "playing"
		arg_366_1.curTalkId_ = 910601093
		arg_366_1.duration_ = 4.63

		SetActive(arg_366_1.tipsGo_, false)

		function arg_366_1.onSingleLineFinish_()
			arg_366_1.onSingleLineUpdate_ = nil
			arg_366_1.onSingleLineFinish_ = nil
			arg_366_1.state_ = "waiting"
		end

		function arg_366_1.playNext_(arg_368_0)
			if arg_368_0 == 1 then
				arg_366_0:Play910601094(arg_366_1)
			end
		end

		function arg_366_1.onSingleLineUpdate_(arg_369_0)
			local var_369_0 = arg_366_1.actors_["1084ui_story"]
			local var_369_1 = 0

			if var_369_1 < arg_366_1.time_ and arg_366_1.time_ <= var_369_1 + arg_369_0 and arg_366_1.var_.characterEffect1084ui_story == nil then
				arg_366_1.var_.characterEffect1084ui_story = var_369_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_369_2 = 0.200000002980232

			if var_369_1 <= arg_366_1.time_ and arg_366_1.time_ < var_369_1 + var_369_2 then
				local var_369_3 = (arg_366_1.time_ - var_369_1) / var_369_2

				if arg_366_1.var_.characterEffect1084ui_story then
					arg_366_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_366_1.time_ >= var_369_1 + var_369_2 and arg_366_1.time_ < var_369_1 + var_369_2 + arg_369_0 and arg_366_1.var_.characterEffect1084ui_story then
				arg_366_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_369_4 = 0

			if var_369_4 < arg_366_1.time_ and arg_366_1.time_ <= var_369_4 + arg_369_0 then
				arg_366_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action475")
			end

			local var_369_5 = 0

			if var_369_5 < arg_366_1.time_ and arg_366_1.time_ <= var_369_5 + arg_369_0 then
				arg_366_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_369_6 = 0
			local var_369_7 = 0.45

			if var_369_6 < arg_366_1.time_ and arg_366_1.time_ <= var_369_6 + arg_369_0 then
				arg_366_1.talkMaxDuration = 0
				arg_366_1.dialogCg_.alpha = 1

				arg_366_1.dialog_:SetActive(true)
				SetActive(arg_366_1.leftNameGo_, true)

				local var_369_8 = arg_366_1:FormatText(StoryNameCfg[6].name)

				arg_366_1.leftNameTxt_.text = var_369_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_366_1.leftNameTxt_.transform)

				arg_366_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_366_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_366_1:RecordName(arg_366_1.leftNameTxt_.text)
				SetActive(arg_366_1.iconTrs_.gameObject, false)
				arg_366_1.callingController_:SetSelectedState("normal")

				local var_369_9 = arg_366_1:GetWordFromCfg(910601093)
				local var_369_10 = arg_366_1:FormatText(var_369_9.content)

				arg_366_1.text_.text = var_369_10

				LuaForUtil.ClearLinePrefixSymbol(arg_366_1.text_)

				local var_369_11 = 18
				local var_369_12 = utf8.len(var_369_10)
				local var_369_13 = var_369_11 <= 0 and var_369_7 or var_369_7 * (var_369_12 / var_369_11)

				if var_369_13 > 0 and var_369_7 < var_369_13 then
					arg_366_1.talkMaxDuration = var_369_13

					if var_369_13 + var_369_6 > arg_366_1.duration_ then
						arg_366_1.duration_ = var_369_13 + var_369_6
					end
				end

				arg_366_1.text_.text = var_369_10
				arg_366_1.typewritter.percent = 0

				arg_366_1.typewritter:SetDirty()
				arg_366_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601093", "story_v_out_910601.awb") ~= 0 then
					local var_369_14 = manager.audio:GetVoiceLength("story_v_out_910601", "910601093", "story_v_out_910601.awb") / 1000

					if var_369_14 + var_369_6 > arg_366_1.duration_ then
						arg_366_1.duration_ = var_369_14 + var_369_6
					end

					if var_369_9.prefab_name ~= "" and arg_366_1.actors_[var_369_9.prefab_name] ~= nil then
						local var_369_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_366_1.actors_[var_369_9.prefab_name].transform, "story_v_out_910601", "910601093", "story_v_out_910601.awb")

						arg_366_1:RecordAudio("910601093", var_369_15)
						arg_366_1:RecordAudio("910601093", var_369_15)
					else
						arg_366_1:AudioAction("play", "voice", "story_v_out_910601", "910601093", "story_v_out_910601.awb")
					end

					arg_366_1:RecordHistoryTalkVoice("story_v_out_910601", "910601093", "story_v_out_910601.awb")
				end

				arg_366_1:RecordContent(arg_366_1.text_.text)
			end

			local var_369_16 = math.max(var_369_7, arg_366_1.talkMaxDuration)

			if var_369_6 <= arg_366_1.time_ and arg_366_1.time_ < var_369_6 + var_369_16 then
				arg_366_1.typewritter.percent = (arg_366_1.time_ - var_369_6) / var_369_16

				arg_366_1.typewritter:SetDirty()
			end

			if arg_366_1.time_ >= var_369_6 + var_369_16 and arg_366_1.time_ < var_369_6 + var_369_16 + arg_369_0 then
				arg_366_1.typewritter.percent = 1

				arg_366_1.typewritter:SetDirty()
				arg_366_1:ShowNextGo(true)
			end
		end
	end,
	Play910601094 = function(arg_370_0, arg_370_1)
		arg_370_1.time_ = 0
		arg_370_1.frameCnt_ = 0
		arg_370_1.state_ = "playing"
		arg_370_1.curTalkId_ = 910601094
		arg_370_1.duration_ = 5

		SetActive(arg_370_1.tipsGo_, false)

		function arg_370_1.onSingleLineFinish_()
			arg_370_1.onSingleLineUpdate_ = nil
			arg_370_1.onSingleLineFinish_ = nil
			arg_370_1.state_ = "waiting"
		end

		function arg_370_1.playNext_(arg_372_0)
			if arg_372_0 == 1 then
				arg_370_0:Play910601095(arg_370_1)
			end
		end

		function arg_370_1.onSingleLineUpdate_(arg_373_0)
			local var_373_0 = arg_370_1.actors_["1084ui_story"]
			local var_373_1 = 0

			if var_373_1 < arg_370_1.time_ and arg_370_1.time_ <= var_373_1 + arg_373_0 and arg_370_1.var_.characterEffect1084ui_story == nil then
				arg_370_1.var_.characterEffect1084ui_story = var_373_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_373_2 = 0.200000002980232

			if var_373_1 <= arg_370_1.time_ and arg_370_1.time_ < var_373_1 + var_373_2 then
				local var_373_3 = (arg_370_1.time_ - var_373_1) / var_373_2

				if arg_370_1.var_.characterEffect1084ui_story then
					local var_373_4 = Mathf.Lerp(0, 0.5, var_373_3)

					arg_370_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_370_1.var_.characterEffect1084ui_story.fillRatio = var_373_4
				end
			end

			if arg_370_1.time_ >= var_373_1 + var_373_2 and arg_370_1.time_ < var_373_1 + var_373_2 + arg_373_0 and arg_370_1.var_.characterEffect1084ui_story then
				local var_373_5 = 0.5

				arg_370_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_370_1.var_.characterEffect1084ui_story.fillRatio = var_373_5
			end

			local var_373_6 = 0

			if var_373_6 < arg_370_1.time_ and arg_370_1.time_ <= var_373_6 + arg_373_0 then
				arg_370_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_2")
			end

			local var_373_7 = 0
			local var_373_8 = 0.625

			if var_373_7 < arg_370_1.time_ and arg_370_1.time_ <= var_373_7 + arg_373_0 then
				arg_370_1.talkMaxDuration = 0
				arg_370_1.dialogCg_.alpha = 1

				arg_370_1.dialog_:SetActive(true)
				SetActive(arg_370_1.leftNameGo_, true)

				local var_373_9 = arg_370_1:FormatText(StoryNameCfg[7].name)

				arg_370_1.leftNameTxt_.text = var_373_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_370_1.leftNameTxt_.transform)

				arg_370_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_370_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_370_1:RecordName(arg_370_1.leftNameTxt_.text)
				SetActive(arg_370_1.iconTrs_.gameObject, false)
				arg_370_1.callingController_:SetSelectedState("normal")

				local var_373_10 = arg_370_1:GetWordFromCfg(910601094)
				local var_373_11 = arg_370_1:FormatText(var_373_10.content)

				arg_370_1.text_.text = var_373_11

				LuaForUtil.ClearLinePrefixSymbol(arg_370_1.text_)

				local var_373_12 = 25
				local var_373_13 = utf8.len(var_373_11)
				local var_373_14 = var_373_12 <= 0 and var_373_8 or var_373_8 * (var_373_13 / var_373_12)

				if var_373_14 > 0 and var_373_8 < var_373_14 then
					arg_370_1.talkMaxDuration = var_373_14

					if var_373_14 + var_373_7 > arg_370_1.duration_ then
						arg_370_1.duration_ = var_373_14 + var_373_7
					end
				end

				arg_370_1.text_.text = var_373_11
				arg_370_1.typewritter.percent = 0

				arg_370_1.typewritter:SetDirty()
				arg_370_1:ShowNextGo(false)
				arg_370_1:RecordContent(arg_370_1.text_.text)
			end

			local var_373_15 = math.max(var_373_8, arg_370_1.talkMaxDuration)

			if var_373_7 <= arg_370_1.time_ and arg_370_1.time_ < var_373_7 + var_373_15 then
				arg_370_1.typewritter.percent = (arg_370_1.time_ - var_373_7) / var_373_15

				arg_370_1.typewritter:SetDirty()
			end

			if arg_370_1.time_ >= var_373_7 + var_373_15 and arg_370_1.time_ < var_373_7 + var_373_15 + arg_373_0 then
				arg_370_1.typewritter.percent = 1

				arg_370_1.typewritter:SetDirty()
				arg_370_1:ShowNextGo(true)
			end
		end
	end,
	Play910601095 = function(arg_374_0, arg_374_1)
		arg_374_1.time_ = 0
		arg_374_1.frameCnt_ = 0
		arg_374_1.state_ = "playing"
		arg_374_1.curTalkId_ = 910601095
		arg_374_1.duration_ = 3.83

		SetActive(arg_374_1.tipsGo_, false)

		function arg_374_1.onSingleLineFinish_()
			arg_374_1.onSingleLineUpdate_ = nil
			arg_374_1.onSingleLineFinish_ = nil
			arg_374_1.state_ = "waiting"
		end

		function arg_374_1.playNext_(arg_376_0)
			if arg_376_0 == 1 then
				arg_374_0:Play910601096(arg_374_1)
			end
		end

		function arg_374_1.onSingleLineUpdate_(arg_377_0)
			local var_377_0 = arg_374_1.actors_["1011ui_story"].transform
			local var_377_1 = 0

			if var_377_1 < arg_374_1.time_ and arg_374_1.time_ <= var_377_1 + arg_377_0 then
				arg_374_1.var_.moveOldPos1011ui_story = var_377_0.localPosition
			end

			local var_377_2 = 0.001

			if var_377_1 <= arg_374_1.time_ and arg_374_1.time_ < var_377_1 + var_377_2 then
				local var_377_3 = (arg_374_1.time_ - var_377_1) / var_377_2
				local var_377_4 = Vector3.New(0.7, -0.71, -6)

				var_377_0.localPosition = Vector3.Lerp(arg_374_1.var_.moveOldPos1011ui_story, var_377_4, var_377_3)

				local var_377_5 = manager.ui.mainCamera.transform.position - var_377_0.position

				var_377_0.forward = Vector3.New(var_377_5.x, var_377_5.y, var_377_5.z)

				local var_377_6 = var_377_0.localEulerAngles

				var_377_6.z = 0
				var_377_6.x = 0
				var_377_0.localEulerAngles = var_377_6
			end

			if arg_374_1.time_ >= var_377_1 + var_377_2 and arg_374_1.time_ < var_377_1 + var_377_2 + arg_377_0 then
				var_377_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_377_7 = manager.ui.mainCamera.transform.position - var_377_0.position

				var_377_0.forward = Vector3.New(var_377_7.x, var_377_7.y, var_377_7.z)

				local var_377_8 = var_377_0.localEulerAngles

				var_377_8.z = 0
				var_377_8.x = 0
				var_377_0.localEulerAngles = var_377_8
			end

			local var_377_9 = arg_374_1.actors_["1011ui_story"]
			local var_377_10 = 0

			if var_377_10 < arg_374_1.time_ and arg_374_1.time_ <= var_377_10 + arg_377_0 and arg_374_1.var_.characterEffect1011ui_story == nil then
				arg_374_1.var_.characterEffect1011ui_story = var_377_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_377_11 = 0.200000002980232

			if var_377_10 <= arg_374_1.time_ and arg_374_1.time_ < var_377_10 + var_377_11 then
				local var_377_12 = (arg_374_1.time_ - var_377_10) / var_377_11

				if arg_374_1.var_.characterEffect1011ui_story then
					arg_374_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_374_1.time_ >= var_377_10 + var_377_11 and arg_374_1.time_ < var_377_10 + var_377_11 + arg_377_0 and arg_374_1.var_.characterEffect1011ui_story then
				arg_374_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_377_13 = 0

			if var_377_13 < arg_374_1.time_ and arg_374_1.time_ <= var_377_13 + arg_377_0 then
				arg_374_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_377_14 = 0

			if var_377_14 < arg_374_1.time_ and arg_374_1.time_ <= var_377_14 + arg_377_0 then
				arg_374_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_377_15 = arg_374_1.actors_["1084ui_story"].transform
			local var_377_16 = 0

			if var_377_16 < arg_374_1.time_ and arg_374_1.time_ <= var_377_16 + arg_377_0 then
				arg_374_1.var_.moveOldPos1084ui_story = var_377_15.localPosition
			end

			local var_377_17 = 0.001

			if var_377_16 <= arg_374_1.time_ and arg_374_1.time_ < var_377_16 + var_377_17 then
				local var_377_18 = (arg_374_1.time_ - var_377_16) / var_377_17
				local var_377_19 = Vector3.New(-0.7, -0.97, -6)

				var_377_15.localPosition = Vector3.Lerp(arg_374_1.var_.moveOldPos1084ui_story, var_377_19, var_377_18)

				local var_377_20 = manager.ui.mainCamera.transform.position - var_377_15.position

				var_377_15.forward = Vector3.New(var_377_20.x, var_377_20.y, var_377_20.z)

				local var_377_21 = var_377_15.localEulerAngles

				var_377_21.z = 0
				var_377_21.x = 0
				var_377_15.localEulerAngles = var_377_21
			end

			if arg_374_1.time_ >= var_377_16 + var_377_17 and arg_374_1.time_ < var_377_16 + var_377_17 + arg_377_0 then
				var_377_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_377_22 = manager.ui.mainCamera.transform.position - var_377_15.position

				var_377_15.forward = Vector3.New(var_377_22.x, var_377_22.y, var_377_22.z)

				local var_377_23 = var_377_15.localEulerAngles

				var_377_23.z = 0
				var_377_23.x = 0
				var_377_15.localEulerAngles = var_377_23
			end

			local var_377_24 = arg_374_1.actors_["1084ui_story"]
			local var_377_25 = 0

			if var_377_25 < arg_374_1.time_ and arg_374_1.time_ <= var_377_25 + arg_377_0 and arg_374_1.var_.characterEffect1084ui_story == nil then
				arg_374_1.var_.characterEffect1084ui_story = var_377_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_377_26 = 0.200000002980232

			if var_377_25 <= arg_374_1.time_ and arg_374_1.time_ < var_377_25 + var_377_26 then
				local var_377_27 = (arg_374_1.time_ - var_377_25) / var_377_26

				if arg_374_1.var_.characterEffect1084ui_story then
					local var_377_28 = Mathf.Lerp(0, 0.5, var_377_27)

					arg_374_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_374_1.var_.characterEffect1084ui_story.fillRatio = var_377_28
				end
			end

			if arg_374_1.time_ >= var_377_25 + var_377_26 and arg_374_1.time_ < var_377_25 + var_377_26 + arg_377_0 and arg_374_1.var_.characterEffect1084ui_story then
				local var_377_29 = 0.5

				arg_374_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_374_1.var_.characterEffect1084ui_story.fillRatio = var_377_29
			end

			local var_377_30 = 0
			local var_377_31 = 0.425

			if var_377_30 < arg_374_1.time_ and arg_374_1.time_ <= var_377_30 + arg_377_0 then
				arg_374_1.talkMaxDuration = 0
				arg_374_1.dialogCg_.alpha = 1

				arg_374_1.dialog_:SetActive(true)
				SetActive(arg_374_1.leftNameGo_, true)

				local var_377_32 = arg_374_1:FormatText(StoryNameCfg[37].name)

				arg_374_1.leftNameTxt_.text = var_377_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_374_1.leftNameTxt_.transform)

				arg_374_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_374_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_374_1:RecordName(arg_374_1.leftNameTxt_.text)
				SetActive(arg_374_1.iconTrs_.gameObject, false)
				arg_374_1.callingController_:SetSelectedState("normal")

				local var_377_33 = arg_374_1:GetWordFromCfg(910601095)
				local var_377_34 = arg_374_1:FormatText(var_377_33.content)

				arg_374_1.text_.text = var_377_34

				LuaForUtil.ClearLinePrefixSymbol(arg_374_1.text_)

				local var_377_35 = 17
				local var_377_36 = utf8.len(var_377_34)
				local var_377_37 = var_377_35 <= 0 and var_377_31 or var_377_31 * (var_377_36 / var_377_35)

				if var_377_37 > 0 and var_377_31 < var_377_37 then
					arg_374_1.talkMaxDuration = var_377_37

					if var_377_37 + var_377_30 > arg_374_1.duration_ then
						arg_374_1.duration_ = var_377_37 + var_377_30
					end
				end

				arg_374_1.text_.text = var_377_34
				arg_374_1.typewritter.percent = 0

				arg_374_1.typewritter:SetDirty()
				arg_374_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601095", "story_v_out_910601.awb") ~= 0 then
					local var_377_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601095", "story_v_out_910601.awb") / 1000

					if var_377_38 + var_377_30 > arg_374_1.duration_ then
						arg_374_1.duration_ = var_377_38 + var_377_30
					end

					if var_377_33.prefab_name ~= "" and arg_374_1.actors_[var_377_33.prefab_name] ~= nil then
						local var_377_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_374_1.actors_[var_377_33.prefab_name].transform, "story_v_out_910601", "910601095", "story_v_out_910601.awb")

						arg_374_1:RecordAudio("910601095", var_377_39)
						arg_374_1:RecordAudio("910601095", var_377_39)
					else
						arg_374_1:AudioAction("play", "voice", "story_v_out_910601", "910601095", "story_v_out_910601.awb")
					end

					arg_374_1:RecordHistoryTalkVoice("story_v_out_910601", "910601095", "story_v_out_910601.awb")
				end

				arg_374_1:RecordContent(arg_374_1.text_.text)
			end

			local var_377_40 = math.max(var_377_31, arg_374_1.talkMaxDuration)

			if var_377_30 <= arg_374_1.time_ and arg_374_1.time_ < var_377_30 + var_377_40 then
				arg_374_1.typewritter.percent = (arg_374_1.time_ - var_377_30) / var_377_40

				arg_374_1.typewritter:SetDirty()
			end

			if arg_374_1.time_ >= var_377_30 + var_377_40 and arg_374_1.time_ < var_377_30 + var_377_40 + arg_377_0 then
				arg_374_1.typewritter.percent = 1

				arg_374_1.typewritter:SetDirty()
				arg_374_1:ShowNextGo(true)
			end
		end
	end,
	Play910601096 = function(arg_378_0, arg_378_1)
		arg_378_1.time_ = 0
		arg_378_1.frameCnt_ = 0
		arg_378_1.state_ = "playing"
		arg_378_1.curTalkId_ = 910601096
		arg_378_1.duration_ = 4.3

		SetActive(arg_378_1.tipsGo_, false)

		function arg_378_1.onSingleLineFinish_()
			arg_378_1.onSingleLineUpdate_ = nil
			arg_378_1.onSingleLineFinish_ = nil
			arg_378_1.state_ = "waiting"
		end

		function arg_378_1.playNext_(arg_380_0)
			if arg_380_0 == 1 then
				arg_378_0:Play910601097(arg_378_1)
			end
		end

		function arg_378_1.onSingleLineUpdate_(arg_381_0)
			local var_381_0 = arg_378_1.actors_["1084ui_story"].transform
			local var_381_1 = 0

			if var_381_1 < arg_378_1.time_ and arg_378_1.time_ <= var_381_1 + arg_381_0 then
				arg_378_1.var_.moveOldPos1084ui_story = var_381_0.localPosition
			end

			local var_381_2 = 0.001

			if var_381_1 <= arg_378_1.time_ and arg_378_1.time_ < var_381_1 + var_381_2 then
				local var_381_3 = (arg_378_1.time_ - var_381_1) / var_381_2
				local var_381_4 = Vector3.New(-0.7, -0.97, -6)

				var_381_0.localPosition = Vector3.Lerp(arg_378_1.var_.moveOldPos1084ui_story, var_381_4, var_381_3)

				local var_381_5 = manager.ui.mainCamera.transform.position - var_381_0.position

				var_381_0.forward = Vector3.New(var_381_5.x, var_381_5.y, var_381_5.z)

				local var_381_6 = var_381_0.localEulerAngles

				var_381_6.z = 0
				var_381_6.x = 0
				var_381_0.localEulerAngles = var_381_6
			end

			if arg_378_1.time_ >= var_381_1 + var_381_2 and arg_378_1.time_ < var_381_1 + var_381_2 + arg_381_0 then
				var_381_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_381_7 = manager.ui.mainCamera.transform.position - var_381_0.position

				var_381_0.forward = Vector3.New(var_381_7.x, var_381_7.y, var_381_7.z)

				local var_381_8 = var_381_0.localEulerAngles

				var_381_8.z = 0
				var_381_8.x = 0
				var_381_0.localEulerAngles = var_381_8
			end

			local var_381_9 = arg_378_1.actors_["1084ui_story"]
			local var_381_10 = 0

			if var_381_10 < arg_378_1.time_ and arg_378_1.time_ <= var_381_10 + arg_381_0 and arg_378_1.var_.characterEffect1084ui_story == nil then
				arg_378_1.var_.characterEffect1084ui_story = var_381_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_381_11 = 0.200000002980232

			if var_381_10 <= arg_378_1.time_ and arg_378_1.time_ < var_381_10 + var_381_11 then
				local var_381_12 = (arg_378_1.time_ - var_381_10) / var_381_11

				if arg_378_1.var_.characterEffect1084ui_story then
					arg_378_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_378_1.time_ >= var_381_10 + var_381_11 and arg_378_1.time_ < var_381_10 + var_381_11 + arg_381_0 and arg_378_1.var_.characterEffect1084ui_story then
				arg_378_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_381_13 = 0

			if var_381_13 < arg_378_1.time_ and arg_378_1.time_ <= var_381_13 + arg_381_0 then
				arg_378_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_381_14 = 0

			if var_381_14 < arg_378_1.time_ and arg_378_1.time_ <= var_381_14 + arg_381_0 then
				arg_378_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_381_15 = arg_378_1.actors_["1011ui_story"]
			local var_381_16 = 0

			if var_381_16 < arg_378_1.time_ and arg_378_1.time_ <= var_381_16 + arg_381_0 and arg_378_1.var_.characterEffect1011ui_story == nil then
				arg_378_1.var_.characterEffect1011ui_story = var_381_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_381_17 = 0.200000002980232

			if var_381_16 <= arg_378_1.time_ and arg_378_1.time_ < var_381_16 + var_381_17 then
				local var_381_18 = (arg_378_1.time_ - var_381_16) / var_381_17

				if arg_378_1.var_.characterEffect1011ui_story then
					local var_381_19 = Mathf.Lerp(0, 0.5, var_381_18)

					arg_378_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_378_1.var_.characterEffect1011ui_story.fillRatio = var_381_19
				end
			end

			if arg_378_1.time_ >= var_381_16 + var_381_17 and arg_378_1.time_ < var_381_16 + var_381_17 + arg_381_0 and arg_378_1.var_.characterEffect1011ui_story then
				local var_381_20 = 0.5

				arg_378_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_378_1.var_.characterEffect1011ui_story.fillRatio = var_381_20
			end

			local var_381_21 = 0
			local var_381_22 = 0.475

			if var_381_21 < arg_378_1.time_ and arg_378_1.time_ <= var_381_21 + arg_381_0 then
				arg_378_1.talkMaxDuration = 0
				arg_378_1.dialogCg_.alpha = 1

				arg_378_1.dialog_:SetActive(true)
				SetActive(arg_378_1.leftNameGo_, true)

				local var_381_23 = arg_378_1:FormatText(StoryNameCfg[6].name)

				arg_378_1.leftNameTxt_.text = var_381_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_378_1.leftNameTxt_.transform)

				arg_378_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_378_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_378_1:RecordName(arg_378_1.leftNameTxt_.text)
				SetActive(arg_378_1.iconTrs_.gameObject, false)
				arg_378_1.callingController_:SetSelectedState("normal")

				local var_381_24 = arg_378_1:GetWordFromCfg(910601096)
				local var_381_25 = arg_378_1:FormatText(var_381_24.content)

				arg_378_1.text_.text = var_381_25

				LuaForUtil.ClearLinePrefixSymbol(arg_378_1.text_)

				local var_381_26 = 19
				local var_381_27 = utf8.len(var_381_25)
				local var_381_28 = var_381_26 <= 0 and var_381_22 or var_381_22 * (var_381_27 / var_381_26)

				if var_381_28 > 0 and var_381_22 < var_381_28 then
					arg_378_1.talkMaxDuration = var_381_28

					if var_381_28 + var_381_21 > arg_378_1.duration_ then
						arg_378_1.duration_ = var_381_28 + var_381_21
					end
				end

				arg_378_1.text_.text = var_381_25
				arg_378_1.typewritter.percent = 0

				arg_378_1.typewritter:SetDirty()
				arg_378_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601096", "story_v_out_910601.awb") ~= 0 then
					local var_381_29 = manager.audio:GetVoiceLength("story_v_out_910601", "910601096", "story_v_out_910601.awb") / 1000

					if var_381_29 + var_381_21 > arg_378_1.duration_ then
						arg_378_1.duration_ = var_381_29 + var_381_21
					end

					if var_381_24.prefab_name ~= "" and arg_378_1.actors_[var_381_24.prefab_name] ~= nil then
						local var_381_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_378_1.actors_[var_381_24.prefab_name].transform, "story_v_out_910601", "910601096", "story_v_out_910601.awb")

						arg_378_1:RecordAudio("910601096", var_381_30)
						arg_378_1:RecordAudio("910601096", var_381_30)
					else
						arg_378_1:AudioAction("play", "voice", "story_v_out_910601", "910601096", "story_v_out_910601.awb")
					end

					arg_378_1:RecordHistoryTalkVoice("story_v_out_910601", "910601096", "story_v_out_910601.awb")
				end

				arg_378_1:RecordContent(arg_378_1.text_.text)
			end

			local var_381_31 = math.max(var_381_22, arg_378_1.talkMaxDuration)

			if var_381_21 <= arg_378_1.time_ and arg_378_1.time_ < var_381_21 + var_381_31 then
				arg_378_1.typewritter.percent = (arg_378_1.time_ - var_381_21) / var_381_31

				arg_378_1.typewritter:SetDirty()
			end

			if arg_378_1.time_ >= var_381_21 + var_381_31 and arg_378_1.time_ < var_381_21 + var_381_31 + arg_381_0 then
				arg_378_1.typewritter.percent = 1

				arg_378_1.typewritter:SetDirty()
				arg_378_1:ShowNextGo(true)
			end
		end
	end,
	Play910601097 = function(arg_382_0, arg_382_1)
		arg_382_1.time_ = 0
		arg_382_1.frameCnt_ = 0
		arg_382_1.state_ = "playing"
		arg_382_1.curTalkId_ = 910601097
		arg_382_1.duration_ = 9

		SetActive(arg_382_1.tipsGo_, false)

		function arg_382_1.onSingleLineFinish_()
			arg_382_1.onSingleLineUpdate_ = nil
			arg_382_1.onSingleLineFinish_ = nil
			arg_382_1.state_ = "waiting"
		end

		function arg_382_1.playNext_(arg_384_0)
			if arg_384_0 == 1 then
				arg_382_0:Play910601098(arg_382_1)
			end
		end

		function arg_382_1.onSingleLineUpdate_(arg_385_0)
			local var_385_0 = 2

			if var_385_0 < arg_382_1.time_ and arg_382_1.time_ <= var_385_0 + arg_385_0 then
				local var_385_1 = manager.ui.mainCamera.transform.localPosition
				local var_385_2 = Vector3.New(0, 0, 10) + Vector3.New(var_385_1.x, var_385_1.y, 0)
				local var_385_3 = arg_382_1.bgs_.STwhite

				var_385_3.transform.localPosition = var_385_2
				var_385_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_385_4 = var_385_3:GetComponent("SpriteRenderer")

				if var_385_4 and var_385_4.sprite then
					local var_385_5 = (var_385_3.transform.localPosition - var_385_1).z
					local var_385_6 = manager.ui.mainCameraCom_
					local var_385_7 = 2 * var_385_5 * Mathf.Tan(var_385_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_385_8 = var_385_7 * var_385_6.aspect
					local var_385_9 = var_385_4.sprite.bounds.size.x
					local var_385_10 = var_385_4.sprite.bounds.size.y
					local var_385_11 = var_385_8 / var_385_9
					local var_385_12 = var_385_7 / var_385_10
					local var_385_13 = var_385_12 < var_385_11 and var_385_11 or var_385_12

					var_385_3.transform.localScale = Vector3.New(var_385_13, var_385_13, 0)
				end

				for iter_385_0, iter_385_1 in pairs(arg_382_1.bgs_) do
					if iter_385_0 ~= "STwhite" then
						iter_385_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_385_14 = 0

			if var_385_14 < arg_382_1.time_ and arg_382_1.time_ <= var_385_14 + arg_385_0 then
				arg_382_1.mask_.enabled = true
				arg_382_1.mask_.raycastTarget = true

				arg_382_1:SetGaussion(false)
			end

			local var_385_15 = 2

			if var_385_14 <= arg_382_1.time_ and arg_382_1.time_ < var_385_14 + var_385_15 then
				local var_385_16 = (arg_382_1.time_ - var_385_14) / var_385_15
				local var_385_17 = Color.New(0, 0, 0)

				var_385_17.a = Mathf.Lerp(0, 1, var_385_16)
				arg_382_1.mask_.color = var_385_17
			end

			if arg_382_1.time_ >= var_385_14 + var_385_15 and arg_382_1.time_ < var_385_14 + var_385_15 + arg_385_0 then
				local var_385_18 = Color.New(0, 0, 0)

				var_385_18.a = 1
				arg_382_1.mask_.color = var_385_18
			end

			local var_385_19 = 2

			if var_385_19 < arg_382_1.time_ and arg_382_1.time_ <= var_385_19 + arg_385_0 then
				arg_382_1.mask_.enabled = true
				arg_382_1.mask_.raycastTarget = true

				arg_382_1:SetGaussion(false)
			end

			local var_385_20 = 2

			if var_385_19 <= arg_382_1.time_ and arg_382_1.time_ < var_385_19 + var_385_20 then
				local var_385_21 = (arg_382_1.time_ - var_385_19) / var_385_20
				local var_385_22 = Color.New(0, 0, 0)

				var_385_22.a = Mathf.Lerp(1, 0, var_385_21)
				arg_382_1.mask_.color = var_385_22
			end

			if arg_382_1.time_ >= var_385_19 + var_385_20 and arg_382_1.time_ < var_385_19 + var_385_20 + arg_385_0 then
				local var_385_23 = Color.New(0, 0, 0)
				local var_385_24 = 0

				arg_382_1.mask_.enabled = false
				var_385_23.a = var_385_24
				arg_382_1.mask_.color = var_385_23
			end

			local var_385_25 = arg_382_1.actors_["1011ui_story"].transform
			local var_385_26 = 2

			if var_385_26 < arg_382_1.time_ and arg_382_1.time_ <= var_385_26 + arg_385_0 then
				arg_382_1.var_.moveOldPos1011ui_story = var_385_25.localPosition
			end

			local var_385_27 = 0.001

			if var_385_26 <= arg_382_1.time_ and arg_382_1.time_ < var_385_26 + var_385_27 then
				local var_385_28 = (arg_382_1.time_ - var_385_26) / var_385_27
				local var_385_29 = Vector3.New(0, 100, 0)

				var_385_25.localPosition = Vector3.Lerp(arg_382_1.var_.moveOldPos1011ui_story, var_385_29, var_385_28)

				local var_385_30 = manager.ui.mainCamera.transform.position - var_385_25.position

				var_385_25.forward = Vector3.New(var_385_30.x, var_385_30.y, var_385_30.z)

				local var_385_31 = var_385_25.localEulerAngles

				var_385_31.z = 0
				var_385_31.x = 0
				var_385_25.localEulerAngles = var_385_31
			end

			if arg_382_1.time_ >= var_385_26 + var_385_27 and arg_382_1.time_ < var_385_26 + var_385_27 + arg_385_0 then
				var_385_25.localPosition = Vector3.New(0, 100, 0)

				local var_385_32 = manager.ui.mainCamera.transform.position - var_385_25.position

				var_385_25.forward = Vector3.New(var_385_32.x, var_385_32.y, var_385_32.z)

				local var_385_33 = var_385_25.localEulerAngles

				var_385_33.z = 0
				var_385_33.x = 0
				var_385_25.localEulerAngles = var_385_33
			end

			local var_385_34 = arg_382_1.actors_["1011ui_story"]
			local var_385_35 = 2

			if var_385_35 < arg_382_1.time_ and arg_382_1.time_ <= var_385_35 + arg_385_0 and arg_382_1.var_.characterEffect1011ui_story == nil then
				arg_382_1.var_.characterEffect1011ui_story = var_385_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_385_36 = 0.200000002980232

			if var_385_35 <= arg_382_1.time_ and arg_382_1.time_ < var_385_35 + var_385_36 then
				local var_385_37 = (arg_382_1.time_ - var_385_35) / var_385_36

				if arg_382_1.var_.characterEffect1011ui_story then
					local var_385_38 = Mathf.Lerp(0, 0.5, var_385_37)

					arg_382_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_382_1.var_.characterEffect1011ui_story.fillRatio = var_385_38
				end
			end

			if arg_382_1.time_ >= var_385_35 + var_385_36 and arg_382_1.time_ < var_385_35 + var_385_36 + arg_385_0 and arg_382_1.var_.characterEffect1011ui_story then
				local var_385_39 = 0.5

				arg_382_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_382_1.var_.characterEffect1011ui_story.fillRatio = var_385_39
			end

			local var_385_40 = arg_382_1.actors_["1084ui_story"].transform
			local var_385_41 = 2

			if var_385_41 < arg_382_1.time_ and arg_382_1.time_ <= var_385_41 + arg_385_0 then
				arg_382_1.var_.moveOldPos1084ui_story = var_385_40.localPosition
			end

			local var_385_42 = 0.001

			if var_385_41 <= arg_382_1.time_ and arg_382_1.time_ < var_385_41 + var_385_42 then
				local var_385_43 = (arg_382_1.time_ - var_385_41) / var_385_42
				local var_385_44 = Vector3.New(0, 100, 0)

				var_385_40.localPosition = Vector3.Lerp(arg_382_1.var_.moveOldPos1084ui_story, var_385_44, var_385_43)

				local var_385_45 = manager.ui.mainCamera.transform.position - var_385_40.position

				var_385_40.forward = Vector3.New(var_385_45.x, var_385_45.y, var_385_45.z)

				local var_385_46 = var_385_40.localEulerAngles

				var_385_46.z = 0
				var_385_46.x = 0
				var_385_40.localEulerAngles = var_385_46
			end

			if arg_382_1.time_ >= var_385_41 + var_385_42 and arg_382_1.time_ < var_385_41 + var_385_42 + arg_385_0 then
				var_385_40.localPosition = Vector3.New(0, 100, 0)

				local var_385_47 = manager.ui.mainCamera.transform.position - var_385_40.position

				var_385_40.forward = Vector3.New(var_385_47.x, var_385_47.y, var_385_47.z)

				local var_385_48 = var_385_40.localEulerAngles

				var_385_48.z = 0
				var_385_48.x = 0
				var_385_40.localEulerAngles = var_385_48
			end

			local var_385_49 = arg_382_1.actors_["1084ui_story"]
			local var_385_50 = 2

			if var_385_50 < arg_382_1.time_ and arg_382_1.time_ <= var_385_50 + arg_385_0 and arg_382_1.var_.characterEffect1084ui_story == nil then
				arg_382_1.var_.characterEffect1084ui_story = var_385_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_385_51 = 0.200000002980232

			if var_385_50 <= arg_382_1.time_ and arg_382_1.time_ < var_385_50 + var_385_51 then
				local var_385_52 = (arg_382_1.time_ - var_385_50) / var_385_51

				if arg_382_1.var_.characterEffect1084ui_story then
					local var_385_53 = Mathf.Lerp(0, 0.5, var_385_52)

					arg_382_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_382_1.var_.characterEffect1084ui_story.fillRatio = var_385_53
				end
			end

			if arg_382_1.time_ >= var_385_50 + var_385_51 and arg_382_1.time_ < var_385_50 + var_385_51 + arg_385_0 and arg_382_1.var_.characterEffect1084ui_story then
				local var_385_54 = 0.5

				arg_382_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_382_1.var_.characterEffect1084ui_story.fillRatio = var_385_54
			end

			if arg_382_1.frameCnt_ <= 1 then
				arg_382_1.dialog_:SetActive(false)
			end

			local var_385_55 = 4
			local var_385_56 = 0.05

			if var_385_55 < arg_382_1.time_ and arg_382_1.time_ <= var_385_55 + arg_385_0 then
				arg_382_1.talkMaxDuration = 0

				arg_382_1.dialog_:SetActive(true)

				local var_385_57 = LeanTween.value(arg_382_1.dialog_, 0, 1, 0.3)

				var_385_57:setOnUpdate(LuaHelper.FloatAction(function(arg_386_0)
					arg_382_1.dialogCg_.alpha = arg_386_0
				end))
				var_385_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_382_1.dialog_)
					var_385_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_382_1.duration_ = arg_382_1.duration_ + 0.3

				SetActive(arg_382_1.leftNameGo_, false)

				arg_382_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_382_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_382_1:RecordName(arg_382_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_382_1.iconTrs_.gameObject, false)
				arg_382_1.callingController_:SetSelectedState("normal")

				local var_385_58 = arg_382_1:GetWordFromCfg(910601097)
				local var_385_59 = arg_382_1:FormatText(var_385_58.content)

				arg_382_1.text_.text = var_385_59

				LuaForUtil.ClearLinePrefixSymbol(arg_382_1.text_)

				local var_385_60 = 2
				local var_385_61 = utf8.len(var_385_59)
				local var_385_62 = var_385_60 <= 0 and var_385_56 or var_385_56 * (var_385_61 / var_385_60)

				if var_385_62 > 0 and var_385_56 < var_385_62 then
					arg_382_1.talkMaxDuration = var_385_62
					var_385_55 = var_385_55 + 0.3

					if var_385_62 + var_385_55 > arg_382_1.duration_ then
						arg_382_1.duration_ = var_385_62 + var_385_55
					end
				end

				arg_382_1.text_.text = var_385_59
				arg_382_1.typewritter.percent = 0

				arg_382_1.typewritter:SetDirty()
				arg_382_1:ShowNextGo(false)
				arg_382_1:RecordContent(arg_382_1.text_.text)
			end

			local var_385_63 = var_385_55 + 0.3
			local var_385_64 = math.max(var_385_56, arg_382_1.talkMaxDuration)

			if var_385_63 <= arg_382_1.time_ and arg_382_1.time_ < var_385_63 + var_385_64 then
				arg_382_1.typewritter.percent = (arg_382_1.time_ - var_385_63) / var_385_64

				arg_382_1.typewritter:SetDirty()
			end

			if arg_382_1.time_ >= var_385_63 + var_385_64 and arg_382_1.time_ < var_385_63 + var_385_64 + arg_385_0 then
				arg_382_1.typewritter.percent = 1

				arg_382_1.typewritter:SetDirty()
				arg_382_1:ShowNextGo(true)
			end
		end
	end,
	Play910601098 = function(arg_388_0, arg_388_1)
		arg_388_1.time_ = 0
		arg_388_1.frameCnt_ = 0
		arg_388_1.state_ = "playing"
		arg_388_1.curTalkId_ = 910601098
		arg_388_1.duration_ = 9

		SetActive(arg_388_1.tipsGo_, false)

		function arg_388_1.onSingleLineFinish_()
			arg_388_1.onSingleLineUpdate_ = nil
			arg_388_1.onSingleLineFinish_ = nil
			arg_388_1.state_ = "waiting"
		end

		function arg_388_1.playNext_(arg_390_0)
			if arg_390_0 == 1 then
				arg_388_0:Play910601099(arg_388_1)
			end
		end

		function arg_388_1.onSingleLineUpdate_(arg_391_0)
			local var_391_0 = "ST60"

			if arg_388_1.bgs_[var_391_0] == nil then
				local var_391_1 = Object.Instantiate(arg_388_1.paintGo_)

				var_391_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_391_0)
				var_391_1.name = var_391_0
				var_391_1.transform.parent = arg_388_1.stage_.transform
				var_391_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_388_1.bgs_[var_391_0] = var_391_1
			end

			local var_391_2 = 2

			if var_391_2 < arg_388_1.time_ and arg_388_1.time_ <= var_391_2 + arg_391_0 then
				local var_391_3 = manager.ui.mainCamera.transform.localPosition
				local var_391_4 = Vector3.New(0, 0, 10) + Vector3.New(var_391_3.x, var_391_3.y, 0)
				local var_391_5 = arg_388_1.bgs_.ST60

				var_391_5.transform.localPosition = var_391_4
				var_391_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_391_6 = var_391_5:GetComponent("SpriteRenderer")

				if var_391_6 and var_391_6.sprite then
					local var_391_7 = (var_391_5.transform.localPosition - var_391_3).z
					local var_391_8 = manager.ui.mainCameraCom_
					local var_391_9 = 2 * var_391_7 * Mathf.Tan(var_391_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_391_10 = var_391_9 * var_391_8.aspect
					local var_391_11 = var_391_6.sprite.bounds.size.x
					local var_391_12 = var_391_6.sprite.bounds.size.y
					local var_391_13 = var_391_10 / var_391_11
					local var_391_14 = var_391_9 / var_391_12
					local var_391_15 = var_391_14 < var_391_13 and var_391_13 or var_391_14

					var_391_5.transform.localScale = Vector3.New(var_391_15, var_391_15, 0)
				end

				for iter_391_0, iter_391_1 in pairs(arg_388_1.bgs_) do
					if iter_391_0 ~= "ST60" then
						iter_391_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_391_16 = 0

			if var_391_16 < arg_388_1.time_ and arg_388_1.time_ <= var_391_16 + arg_391_0 then
				arg_388_1.mask_.enabled = true
				arg_388_1.mask_.raycastTarget = true

				arg_388_1:SetGaussion(false)
			end

			local var_391_17 = 2

			if var_391_16 <= arg_388_1.time_ and arg_388_1.time_ < var_391_16 + var_391_17 then
				local var_391_18 = (arg_388_1.time_ - var_391_16) / var_391_17
				local var_391_19 = Color.New(0, 0, 0)

				var_391_19.a = Mathf.Lerp(0, 1, var_391_18)
				arg_388_1.mask_.color = var_391_19
			end

			if arg_388_1.time_ >= var_391_16 + var_391_17 and arg_388_1.time_ < var_391_16 + var_391_17 + arg_391_0 then
				local var_391_20 = Color.New(0, 0, 0)

				var_391_20.a = 1
				arg_388_1.mask_.color = var_391_20
			end

			local var_391_21 = 2

			if var_391_21 < arg_388_1.time_ and arg_388_1.time_ <= var_391_21 + arg_391_0 then
				arg_388_1.mask_.enabled = true
				arg_388_1.mask_.raycastTarget = true

				arg_388_1:SetGaussion(false)
			end

			local var_391_22 = 2

			if var_391_21 <= arg_388_1.time_ and arg_388_1.time_ < var_391_21 + var_391_22 then
				local var_391_23 = (arg_388_1.time_ - var_391_21) / var_391_22
				local var_391_24 = Color.New(0, 0, 0)

				var_391_24.a = Mathf.Lerp(1, 0, var_391_23)
				arg_388_1.mask_.color = var_391_24
			end

			if arg_388_1.time_ >= var_391_21 + var_391_22 and arg_388_1.time_ < var_391_21 + var_391_22 + arg_391_0 then
				local var_391_25 = Color.New(0, 0, 0)
				local var_391_26 = 0

				arg_388_1.mask_.enabled = false
				var_391_25.a = var_391_26
				arg_388_1.mask_.color = var_391_25
			end

			if arg_388_1.frameCnt_ <= 1 then
				arg_388_1.dialog_:SetActive(false)
			end

			local var_391_27 = 4
			local var_391_28 = 1.225

			if var_391_27 < arg_388_1.time_ and arg_388_1.time_ <= var_391_27 + arg_391_0 then
				arg_388_1.talkMaxDuration = 0

				arg_388_1.dialog_:SetActive(true)

				local var_391_29 = LeanTween.value(arg_388_1.dialog_, 0, 1, 0.3)

				var_391_29:setOnUpdate(LuaHelper.FloatAction(function(arg_392_0)
					arg_388_1.dialogCg_.alpha = arg_392_0
				end))
				var_391_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_388_1.dialog_)
					var_391_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_388_1.duration_ = arg_388_1.duration_ + 0.3

				SetActive(arg_388_1.leftNameGo_, false)

				arg_388_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_388_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_388_1:RecordName(arg_388_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_388_1.iconTrs_.gameObject, false)
				arg_388_1.callingController_:SetSelectedState("normal")

				local var_391_30 = arg_388_1:GetWordFromCfg(910601098)
				local var_391_31 = arg_388_1:FormatText(var_391_30.content)

				arg_388_1.text_.text = var_391_31

				LuaForUtil.ClearLinePrefixSymbol(arg_388_1.text_)

				local var_391_32 = 49
				local var_391_33 = utf8.len(var_391_31)
				local var_391_34 = var_391_32 <= 0 and var_391_28 or var_391_28 * (var_391_33 / var_391_32)

				if var_391_34 > 0 and var_391_28 < var_391_34 then
					arg_388_1.talkMaxDuration = var_391_34
					var_391_27 = var_391_27 + 0.3

					if var_391_34 + var_391_27 > arg_388_1.duration_ then
						arg_388_1.duration_ = var_391_34 + var_391_27
					end
				end

				arg_388_1.text_.text = var_391_31
				arg_388_1.typewritter.percent = 0

				arg_388_1.typewritter:SetDirty()
				arg_388_1:ShowNextGo(false)
				arg_388_1:RecordContent(arg_388_1.text_.text)
			end

			local var_391_35 = var_391_27 + 0.3
			local var_391_36 = math.max(var_391_28, arg_388_1.talkMaxDuration)

			if var_391_35 <= arg_388_1.time_ and arg_388_1.time_ < var_391_35 + var_391_36 then
				arg_388_1.typewritter.percent = (arg_388_1.time_ - var_391_35) / var_391_36

				arg_388_1.typewritter:SetDirty()
			end

			if arg_388_1.time_ >= var_391_35 + var_391_36 and arg_388_1.time_ < var_391_35 + var_391_36 + arg_391_0 then
				arg_388_1.typewritter.percent = 1

				arg_388_1.typewritter:SetDirty()
				arg_388_1:ShowNextGo(true)
			end
		end
	end,
	Play910601099 = function(arg_394_0, arg_394_1)
		arg_394_1.time_ = 0
		arg_394_1.frameCnt_ = 0
		arg_394_1.state_ = "playing"
		arg_394_1.curTalkId_ = 910601099
		arg_394_1.duration_ = 5

		SetActive(arg_394_1.tipsGo_, false)

		function arg_394_1.onSingleLineFinish_()
			arg_394_1.onSingleLineUpdate_ = nil
			arg_394_1.onSingleLineFinish_ = nil
			arg_394_1.state_ = "waiting"
		end

		function arg_394_1.playNext_(arg_396_0)
			if arg_396_0 == 1 then
				arg_394_0:Play910601100(arg_394_1)
			end
		end

		function arg_394_1.onSingleLineUpdate_(arg_397_0)
			local var_397_0 = 0
			local var_397_1 = 0.5

			if var_397_0 < arg_394_1.time_ and arg_394_1.time_ <= var_397_0 + arg_397_0 then
				arg_394_1.talkMaxDuration = 0
				arg_394_1.dialogCg_.alpha = 1

				arg_394_1.dialog_:SetActive(true)
				SetActive(arg_394_1.leftNameGo_, true)

				local var_397_2 = arg_394_1:FormatText(StoryNameCfg[7].name)

				arg_394_1.leftNameTxt_.text = var_397_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_394_1.leftNameTxt_.transform)

				arg_394_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_394_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_394_1:RecordName(arg_394_1.leftNameTxt_.text)
				SetActive(arg_394_1.iconTrs_.gameObject, false)
				arg_394_1.callingController_:SetSelectedState("normal")

				local var_397_3 = arg_394_1:GetWordFromCfg(910601099)
				local var_397_4 = arg_394_1:FormatText(var_397_3.content)

				arg_394_1.text_.text = var_397_4

				LuaForUtil.ClearLinePrefixSymbol(arg_394_1.text_)

				local var_397_5 = 20
				local var_397_6 = utf8.len(var_397_4)
				local var_397_7 = var_397_5 <= 0 and var_397_1 or var_397_1 * (var_397_6 / var_397_5)

				if var_397_7 > 0 and var_397_1 < var_397_7 then
					arg_394_1.talkMaxDuration = var_397_7

					if var_397_7 + var_397_0 > arg_394_1.duration_ then
						arg_394_1.duration_ = var_397_7 + var_397_0
					end
				end

				arg_394_1.text_.text = var_397_4
				arg_394_1.typewritter.percent = 0

				arg_394_1.typewritter:SetDirty()
				arg_394_1:ShowNextGo(false)
				arg_394_1:RecordContent(arg_394_1.text_.text)
			end

			local var_397_8 = math.max(var_397_1, arg_394_1.talkMaxDuration)

			if var_397_0 <= arg_394_1.time_ and arg_394_1.time_ < var_397_0 + var_397_8 then
				arg_394_1.typewritter.percent = (arg_394_1.time_ - var_397_0) / var_397_8

				arg_394_1.typewritter:SetDirty()
			end

			if arg_394_1.time_ >= var_397_0 + var_397_8 and arg_394_1.time_ < var_397_0 + var_397_8 + arg_397_0 then
				arg_394_1.typewritter.percent = 1

				arg_394_1.typewritter:SetDirty()
				arg_394_1:ShowNextGo(true)
			end
		end
	end,
	Play910601100 = function(arg_398_0, arg_398_1)
		arg_398_1.time_ = 0
		arg_398_1.frameCnt_ = 0
		arg_398_1.state_ = "playing"
		arg_398_1.curTalkId_ = 910601100
		arg_398_1.duration_ = 2

		SetActive(arg_398_1.tipsGo_, false)

		function arg_398_1.onSingleLineFinish_()
			arg_398_1.onSingleLineUpdate_ = nil
			arg_398_1.onSingleLineFinish_ = nil
			arg_398_1.state_ = "waiting"
		end

		function arg_398_1.playNext_(arg_400_0)
			if arg_400_0 == 1 then
				arg_398_0:Play910601101(arg_398_1)
			end
		end

		function arg_398_1.onSingleLineUpdate_(arg_401_0)
			local var_401_0 = 0

			if var_401_0 < arg_398_1.time_ and arg_398_1.time_ <= var_401_0 + arg_401_0 then
				arg_398_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action2_1")
			end

			local var_401_1 = 0

			if var_401_1 < arg_398_1.time_ and arg_398_1.time_ <= var_401_1 + arg_401_0 then
				arg_398_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_401_2 = arg_398_1.actors_["1084ui_story"]
			local var_401_3 = 0

			if var_401_3 < arg_398_1.time_ and arg_398_1.time_ <= var_401_3 + arg_401_0 and arg_398_1.var_.characterEffect1084ui_story == nil then
				arg_398_1.var_.characterEffect1084ui_story = var_401_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_401_4 = 0.200000002980232

			if var_401_3 <= arg_398_1.time_ and arg_398_1.time_ < var_401_3 + var_401_4 then
				local var_401_5 = (arg_398_1.time_ - var_401_3) / var_401_4

				if arg_398_1.var_.characterEffect1084ui_story then
					arg_398_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_398_1.time_ >= var_401_3 + var_401_4 and arg_398_1.time_ < var_401_3 + var_401_4 + arg_401_0 and arg_398_1.var_.characterEffect1084ui_story then
				arg_398_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_401_6 = arg_398_1.actors_["1084ui_story"].transform
			local var_401_7 = 0

			if var_401_7 < arg_398_1.time_ and arg_398_1.time_ <= var_401_7 + arg_401_0 then
				arg_398_1.var_.moveOldPos1084ui_story = var_401_6.localPosition
			end

			local var_401_8 = 0.001

			if var_401_7 <= arg_398_1.time_ and arg_398_1.time_ < var_401_7 + var_401_8 then
				local var_401_9 = (arg_398_1.time_ - var_401_7) / var_401_8
				local var_401_10 = Vector3.New(0, -0.97, -6)

				var_401_6.localPosition = Vector3.Lerp(arg_398_1.var_.moveOldPos1084ui_story, var_401_10, var_401_9)

				local var_401_11 = manager.ui.mainCamera.transform.position - var_401_6.position

				var_401_6.forward = Vector3.New(var_401_11.x, var_401_11.y, var_401_11.z)

				local var_401_12 = var_401_6.localEulerAngles

				var_401_12.z = 0
				var_401_12.x = 0
				var_401_6.localEulerAngles = var_401_12
			end

			if arg_398_1.time_ >= var_401_7 + var_401_8 and arg_398_1.time_ < var_401_7 + var_401_8 + arg_401_0 then
				var_401_6.localPosition = Vector3.New(0, -0.97, -6)

				local var_401_13 = manager.ui.mainCamera.transform.position - var_401_6.position

				var_401_6.forward = Vector3.New(var_401_13.x, var_401_13.y, var_401_13.z)

				local var_401_14 = var_401_6.localEulerAngles

				var_401_14.z = 0
				var_401_14.x = 0
				var_401_6.localEulerAngles = var_401_14
			end

			local var_401_15 = 0
			local var_401_16 = 0.2

			if var_401_15 < arg_398_1.time_ and arg_398_1.time_ <= var_401_15 + arg_401_0 then
				arg_398_1.talkMaxDuration = 0
				arg_398_1.dialogCg_.alpha = 1

				arg_398_1.dialog_:SetActive(true)
				SetActive(arg_398_1.leftNameGo_, true)

				local var_401_17 = arg_398_1:FormatText(StoryNameCfg[6].name)

				arg_398_1.leftNameTxt_.text = var_401_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_398_1.leftNameTxt_.transform)

				arg_398_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_398_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_398_1:RecordName(arg_398_1.leftNameTxt_.text)
				SetActive(arg_398_1.iconTrs_.gameObject, false)
				arg_398_1.callingController_:SetSelectedState("normal")

				local var_401_18 = arg_398_1:GetWordFromCfg(910601100)
				local var_401_19 = arg_398_1:FormatText(var_401_18.content)

				arg_398_1.text_.text = var_401_19

				LuaForUtil.ClearLinePrefixSymbol(arg_398_1.text_)

				local var_401_20 = 8
				local var_401_21 = utf8.len(var_401_19)
				local var_401_22 = var_401_20 <= 0 and var_401_16 or var_401_16 * (var_401_21 / var_401_20)

				if var_401_22 > 0 and var_401_16 < var_401_22 then
					arg_398_1.talkMaxDuration = var_401_22

					if var_401_22 + var_401_15 > arg_398_1.duration_ then
						arg_398_1.duration_ = var_401_22 + var_401_15
					end
				end

				arg_398_1.text_.text = var_401_19
				arg_398_1.typewritter.percent = 0

				arg_398_1.typewritter:SetDirty()
				arg_398_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601100", "story_v_out_910601.awb") ~= 0 then
					local var_401_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601100", "story_v_out_910601.awb") / 1000

					if var_401_23 + var_401_15 > arg_398_1.duration_ then
						arg_398_1.duration_ = var_401_23 + var_401_15
					end

					if var_401_18.prefab_name ~= "" and arg_398_1.actors_[var_401_18.prefab_name] ~= nil then
						local var_401_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_398_1.actors_[var_401_18.prefab_name].transform, "story_v_out_910601", "910601100", "story_v_out_910601.awb")

						arg_398_1:RecordAudio("910601100", var_401_24)
						arg_398_1:RecordAudio("910601100", var_401_24)
					else
						arg_398_1:AudioAction("play", "voice", "story_v_out_910601", "910601100", "story_v_out_910601.awb")
					end

					arg_398_1:RecordHistoryTalkVoice("story_v_out_910601", "910601100", "story_v_out_910601.awb")
				end

				arg_398_1:RecordContent(arg_398_1.text_.text)
			end

			local var_401_25 = math.max(var_401_16, arg_398_1.talkMaxDuration)

			if var_401_15 <= arg_398_1.time_ and arg_398_1.time_ < var_401_15 + var_401_25 then
				arg_398_1.typewritter.percent = (arg_398_1.time_ - var_401_15) / var_401_25

				arg_398_1.typewritter:SetDirty()
			end

			if arg_398_1.time_ >= var_401_15 + var_401_25 and arg_398_1.time_ < var_401_15 + var_401_25 + arg_401_0 then
				arg_398_1.typewritter.percent = 1

				arg_398_1.typewritter:SetDirty()
				arg_398_1:ShowNextGo(true)
			end
		end
	end,
	Play910601101 = function(arg_402_0, arg_402_1)
		arg_402_1.time_ = 0
		arg_402_1.frameCnt_ = 0
		arg_402_1.state_ = "playing"
		arg_402_1.curTalkId_ = 910601101
		arg_402_1.duration_ = 5

		SetActive(arg_402_1.tipsGo_, false)

		function arg_402_1.onSingleLineFinish_()
			arg_402_1.onSingleLineUpdate_ = nil
			arg_402_1.onSingleLineFinish_ = nil
			arg_402_1.state_ = "waiting"
		end

		function arg_402_1.playNext_(arg_404_0)
			if arg_404_0 == 1 then
				arg_402_0:Play910601102(arg_402_1)
			end
		end

		function arg_402_1.onSingleLineUpdate_(arg_405_0)
			local var_405_0 = arg_402_1.actors_["1084ui_story"]
			local var_405_1 = 0

			if var_405_1 < arg_402_1.time_ and arg_402_1.time_ <= var_405_1 + arg_405_0 and arg_402_1.var_.characterEffect1084ui_story == nil then
				arg_402_1.var_.characterEffect1084ui_story = var_405_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_405_2 = 0.200000002980232

			if var_405_1 <= arg_402_1.time_ and arg_402_1.time_ < var_405_1 + var_405_2 then
				local var_405_3 = (arg_402_1.time_ - var_405_1) / var_405_2

				if arg_402_1.var_.characterEffect1084ui_story then
					local var_405_4 = Mathf.Lerp(0, 0.5, var_405_3)

					arg_402_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_402_1.var_.characterEffect1084ui_story.fillRatio = var_405_4
				end
			end

			if arg_402_1.time_ >= var_405_1 + var_405_2 and arg_402_1.time_ < var_405_1 + var_405_2 + arg_405_0 and arg_402_1.var_.characterEffect1084ui_story then
				local var_405_5 = 0.5

				arg_402_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_402_1.var_.characterEffect1084ui_story.fillRatio = var_405_5
			end

			local var_405_6 = 0
			local var_405_7 = 0.575

			if var_405_6 < arg_402_1.time_ and arg_402_1.time_ <= var_405_6 + arg_405_0 then
				arg_402_1.talkMaxDuration = 0
				arg_402_1.dialogCg_.alpha = 1

				arg_402_1.dialog_:SetActive(true)
				SetActive(arg_402_1.leftNameGo_, true)

				local var_405_8 = arg_402_1:FormatText(StoryNameCfg[7].name)

				arg_402_1.leftNameTxt_.text = var_405_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_402_1.leftNameTxt_.transform)

				arg_402_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_402_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_402_1:RecordName(arg_402_1.leftNameTxt_.text)
				SetActive(arg_402_1.iconTrs_.gameObject, false)
				arg_402_1.callingController_:SetSelectedState("normal")

				local var_405_9 = arg_402_1:GetWordFromCfg(910601101)
				local var_405_10 = arg_402_1:FormatText(var_405_9.content)

				arg_402_1.text_.text = var_405_10

				LuaForUtil.ClearLinePrefixSymbol(arg_402_1.text_)

				local var_405_11 = 23
				local var_405_12 = utf8.len(var_405_10)
				local var_405_13 = var_405_11 <= 0 and var_405_7 or var_405_7 * (var_405_12 / var_405_11)

				if var_405_13 > 0 and var_405_7 < var_405_13 then
					arg_402_1.talkMaxDuration = var_405_13

					if var_405_13 + var_405_6 > arg_402_1.duration_ then
						arg_402_1.duration_ = var_405_13 + var_405_6
					end
				end

				arg_402_1.text_.text = var_405_10
				arg_402_1.typewritter.percent = 0

				arg_402_1.typewritter:SetDirty()
				arg_402_1:ShowNextGo(false)
				arg_402_1:RecordContent(arg_402_1.text_.text)
			end

			local var_405_14 = math.max(var_405_7, arg_402_1.talkMaxDuration)

			if var_405_6 <= arg_402_1.time_ and arg_402_1.time_ < var_405_6 + var_405_14 then
				arg_402_1.typewritter.percent = (arg_402_1.time_ - var_405_6) / var_405_14

				arg_402_1.typewritter:SetDirty()
			end

			if arg_402_1.time_ >= var_405_6 + var_405_14 and arg_402_1.time_ < var_405_6 + var_405_14 + arg_405_0 then
				arg_402_1.typewritter.percent = 1

				arg_402_1.typewritter:SetDirty()
				arg_402_1:ShowNextGo(true)
			end
		end
	end,
	Play910601102 = function(arg_406_0, arg_406_1)
		arg_406_1.time_ = 0
		arg_406_1.frameCnt_ = 0
		arg_406_1.state_ = "playing"
		arg_406_1.curTalkId_ = 910601102
		arg_406_1.duration_ = 7.77

		SetActive(arg_406_1.tipsGo_, false)

		function arg_406_1.onSingleLineFinish_()
			arg_406_1.onSingleLineUpdate_ = nil
			arg_406_1.onSingleLineFinish_ = nil
			arg_406_1.state_ = "waiting"
		end

		function arg_406_1.playNext_(arg_408_0)
			if arg_408_0 == 1 then
				arg_406_0:Play910601103(arg_406_1)
			end
		end

		function arg_406_1.onSingleLineUpdate_(arg_409_0)
			local var_409_0 = arg_406_1.actors_["1084ui_story"].transform
			local var_409_1 = 0

			if var_409_1 < arg_406_1.time_ and arg_406_1.time_ <= var_409_1 + arg_409_0 then
				arg_406_1.var_.moveOldPos1084ui_story = var_409_0.localPosition
			end

			local var_409_2 = 0.001

			if var_409_1 <= arg_406_1.time_ and arg_406_1.time_ < var_409_1 + var_409_2 then
				local var_409_3 = (arg_406_1.time_ - var_409_1) / var_409_2
				local var_409_4 = Vector3.New(0, 100, 0)

				var_409_0.localPosition = Vector3.Lerp(arg_406_1.var_.moveOldPos1084ui_story, var_409_4, var_409_3)

				local var_409_5 = manager.ui.mainCamera.transform.position - var_409_0.position

				var_409_0.forward = Vector3.New(var_409_5.x, var_409_5.y, var_409_5.z)

				local var_409_6 = var_409_0.localEulerAngles

				var_409_6.z = 0
				var_409_6.x = 0
				var_409_0.localEulerAngles = var_409_6
			end

			if arg_406_1.time_ >= var_409_1 + var_409_2 and arg_406_1.time_ < var_409_1 + var_409_2 + arg_409_0 then
				var_409_0.localPosition = Vector3.New(0, 100, 0)

				local var_409_7 = manager.ui.mainCamera.transform.position - var_409_0.position

				var_409_0.forward = Vector3.New(var_409_7.x, var_409_7.y, var_409_7.z)

				local var_409_8 = var_409_0.localEulerAngles

				var_409_8.z = 0
				var_409_8.x = 0
				var_409_0.localEulerAngles = var_409_8
			end

			local var_409_9 = "1027ui_story"

			if arg_406_1.actors_[var_409_9] == nil then
				local var_409_10 = Object.Instantiate(Asset.Load("Char/" .. var_409_9), arg_406_1.stage_.transform)

				var_409_10.name = var_409_9
				var_409_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_406_1.actors_[var_409_9] = var_409_10

				local var_409_11 = var_409_10:GetComponentInChildren(typeof(CharacterEffect))

				var_409_11.enabled = true

				local var_409_12 = GameObjectTools.GetOrAddComponent(var_409_10, typeof(DynamicBoneHelper))

				if var_409_12 then
					var_409_12:EnableDynamicBone(false)
				end

				arg_406_1:ShowWeapon(var_409_11.transform, false)

				arg_406_1.var_[var_409_9 .. "Animator"] = var_409_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_406_1.var_[var_409_9 .. "Animator"].applyRootMotion = true
				arg_406_1.var_[var_409_9 .. "LipSync"] = var_409_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_409_13 = arg_406_1.actors_["1027ui_story"]
			local var_409_14 = 0

			if var_409_14 < arg_406_1.time_ and arg_406_1.time_ <= var_409_14 + arg_409_0 and arg_406_1.var_.characterEffect1027ui_story == nil then
				arg_406_1.var_.characterEffect1027ui_story = var_409_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_409_15 = 0.200000002980232

			if var_409_14 <= arg_406_1.time_ and arg_406_1.time_ < var_409_14 + var_409_15 then
				local var_409_16 = (arg_406_1.time_ - var_409_14) / var_409_15

				if arg_406_1.var_.characterEffect1027ui_story then
					arg_406_1.var_.characterEffect1027ui_story.fillFlat = false
				end
			end

			if arg_406_1.time_ >= var_409_14 + var_409_15 and arg_406_1.time_ < var_409_14 + var_409_15 + arg_409_0 and arg_406_1.var_.characterEffect1027ui_story then
				arg_406_1.var_.characterEffect1027ui_story.fillFlat = false
			end

			local var_409_17 = "1080ui_story"

			if arg_406_1.actors_[var_409_17] == nil then
				local var_409_18 = Object.Instantiate(Asset.Load("Char/" .. var_409_17), arg_406_1.stage_.transform)

				var_409_18.name = var_409_17
				var_409_18.transform.localPosition = Vector3.New(0, 100, 0)
				arg_406_1.actors_[var_409_17] = var_409_18

				local var_409_19 = var_409_18:GetComponentInChildren(typeof(CharacterEffect))

				var_409_19.enabled = true

				local var_409_20 = GameObjectTools.GetOrAddComponent(var_409_18, typeof(DynamicBoneHelper))

				if var_409_20 then
					var_409_20:EnableDynamicBone(false)
				end

				arg_406_1:ShowWeapon(var_409_19.transform, false)

				arg_406_1.var_[var_409_17 .. "Animator"] = var_409_19.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_406_1.var_[var_409_17 .. "Animator"].applyRootMotion = true
				arg_406_1.var_[var_409_17 .. "LipSync"] = var_409_19.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_409_21 = 0

			if var_409_21 < arg_406_1.time_ and arg_406_1.time_ <= var_409_21 + arg_409_0 then
				arg_406_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/1080/1080action/1080action1_1")
			end

			local var_409_22 = 0

			if var_409_22 < arg_406_1.time_ and arg_406_1.time_ <= var_409_22 + arg_409_0 then
				arg_406_1:PlayTimeline("1080ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_409_23 = arg_406_1.actors_["1080ui_story"]
			local var_409_24 = 0

			if var_409_24 < arg_406_1.time_ and arg_406_1.time_ <= var_409_24 + arg_409_0 and arg_406_1.var_.characterEffect1080ui_story == nil then
				arg_406_1.var_.characterEffect1080ui_story = var_409_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_409_25 = 0.200000002980232

			if var_409_24 <= arg_406_1.time_ and arg_406_1.time_ < var_409_24 + var_409_25 then
				local var_409_26 = (arg_406_1.time_ - var_409_24) / var_409_25

				if arg_406_1.var_.characterEffect1080ui_story then
					local var_409_27 = Mathf.Lerp(0, 0.5, var_409_26)

					arg_406_1.var_.characterEffect1080ui_story.fillFlat = true
					arg_406_1.var_.characterEffect1080ui_story.fillRatio = var_409_27
				end
			end

			if arg_406_1.time_ >= var_409_24 + var_409_25 and arg_406_1.time_ < var_409_24 + var_409_25 + arg_409_0 and arg_406_1.var_.characterEffect1080ui_story then
				local var_409_28 = 0.5

				arg_406_1.var_.characterEffect1080ui_story.fillFlat = true
				arg_406_1.var_.characterEffect1080ui_story.fillRatio = var_409_28
			end

			local var_409_29 = 0

			if var_409_29 < arg_406_1.time_ and arg_406_1.time_ <= var_409_29 + arg_409_0 then
				arg_406_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/1048/1048action/1048action3_1")
			end

			local var_409_30 = 0

			if var_409_30 < arg_406_1.time_ and arg_406_1.time_ <= var_409_30 + arg_409_0 then
				arg_406_1:PlayTimeline("1027ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_409_31 = arg_406_1.actors_["1027ui_story"].transform
			local var_409_32 = 0

			if var_409_32 < arg_406_1.time_ and arg_406_1.time_ <= var_409_32 + arg_409_0 then
				arg_406_1.var_.moveOldPos1027ui_story = var_409_31.localPosition
			end

			local var_409_33 = 0.001

			if var_409_32 <= arg_406_1.time_ and arg_406_1.time_ < var_409_32 + var_409_33 then
				local var_409_34 = (arg_406_1.time_ - var_409_32) / var_409_33
				local var_409_35 = Vector3.New(0.7, -0.81, -5.8)

				var_409_31.localPosition = Vector3.Lerp(arg_406_1.var_.moveOldPos1027ui_story, var_409_35, var_409_34)

				local var_409_36 = manager.ui.mainCamera.transform.position - var_409_31.position

				var_409_31.forward = Vector3.New(var_409_36.x, var_409_36.y, var_409_36.z)

				local var_409_37 = var_409_31.localEulerAngles

				var_409_37.z = 0
				var_409_37.x = 0
				var_409_31.localEulerAngles = var_409_37
			end

			if arg_406_1.time_ >= var_409_32 + var_409_33 and arg_406_1.time_ < var_409_32 + var_409_33 + arg_409_0 then
				var_409_31.localPosition = Vector3.New(0.7, -0.81, -5.8)

				local var_409_38 = manager.ui.mainCamera.transform.position - var_409_31.position

				var_409_31.forward = Vector3.New(var_409_38.x, var_409_38.y, var_409_38.z)

				local var_409_39 = var_409_31.localEulerAngles

				var_409_39.z = 0
				var_409_39.x = 0
				var_409_31.localEulerAngles = var_409_39
			end

			local var_409_40 = arg_406_1.actors_["1080ui_story"].transform
			local var_409_41 = 0

			if var_409_41 < arg_406_1.time_ and arg_406_1.time_ <= var_409_41 + arg_409_0 then
				arg_406_1.var_.moveOldPos1080ui_story = var_409_40.localPosition

				local var_409_42 = "1080ui_story"

				arg_406_1:ShowWeapon(arg_406_1.var_[var_409_42 .. "Animator"].transform, false)
			end

			local var_409_43 = 0.001

			if var_409_41 <= arg_406_1.time_ and arg_406_1.time_ < var_409_41 + var_409_43 then
				local var_409_44 = (arg_406_1.time_ - var_409_41) / var_409_43
				local var_409_45 = Vector3.New(-0.7, -1.01, -6.05)

				var_409_40.localPosition = Vector3.Lerp(arg_406_1.var_.moveOldPos1080ui_story, var_409_45, var_409_44)

				local var_409_46 = manager.ui.mainCamera.transform.position - var_409_40.position

				var_409_40.forward = Vector3.New(var_409_46.x, var_409_46.y, var_409_46.z)

				local var_409_47 = var_409_40.localEulerAngles

				var_409_47.z = 0
				var_409_47.x = 0
				var_409_40.localEulerAngles = var_409_47
			end

			if arg_406_1.time_ >= var_409_41 + var_409_43 and arg_406_1.time_ < var_409_41 + var_409_43 + arg_409_0 then
				var_409_40.localPosition = Vector3.New(-0.7, -1.01, -6.05)

				local var_409_48 = manager.ui.mainCamera.transform.position - var_409_40.position

				var_409_40.forward = Vector3.New(var_409_48.x, var_409_48.y, var_409_48.z)

				local var_409_49 = var_409_40.localEulerAngles

				var_409_49.z = 0
				var_409_49.x = 0
				var_409_40.localEulerAngles = var_409_49
			end

			local var_409_50 = 0
			local var_409_51 = 0.825

			if var_409_50 < arg_406_1.time_ and arg_406_1.time_ <= var_409_50 + arg_409_0 then
				arg_406_1.talkMaxDuration = 0
				arg_406_1.dialogCg_.alpha = 1

				arg_406_1.dialog_:SetActive(true)
				SetActive(arg_406_1.leftNameGo_, true)

				local var_409_52 = arg_406_1:FormatText(StoryNameCfg[56].name)

				arg_406_1.leftNameTxt_.text = var_409_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_406_1.leftNameTxt_.transform)

				arg_406_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_406_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_406_1:RecordName(arg_406_1.leftNameTxt_.text)
				SetActive(arg_406_1.iconTrs_.gameObject, false)
				arg_406_1.callingController_:SetSelectedState("normal")

				local var_409_53 = arg_406_1:GetWordFromCfg(910601102)
				local var_409_54 = arg_406_1:FormatText(var_409_53.content)

				arg_406_1.text_.text = var_409_54

				LuaForUtil.ClearLinePrefixSymbol(arg_406_1.text_)

				local var_409_55 = 33
				local var_409_56 = utf8.len(var_409_54)
				local var_409_57 = var_409_55 <= 0 and var_409_51 or var_409_51 * (var_409_56 / var_409_55)

				if var_409_57 > 0 and var_409_51 < var_409_57 then
					arg_406_1.talkMaxDuration = var_409_57

					if var_409_57 + var_409_50 > arg_406_1.duration_ then
						arg_406_1.duration_ = var_409_57 + var_409_50
					end
				end

				arg_406_1.text_.text = var_409_54
				arg_406_1.typewritter.percent = 0

				arg_406_1.typewritter:SetDirty()
				arg_406_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601102", "story_v_out_910601.awb") ~= 0 then
					local var_409_58 = manager.audio:GetVoiceLength("story_v_out_910601", "910601102", "story_v_out_910601.awb") / 1000

					if var_409_58 + var_409_50 > arg_406_1.duration_ then
						arg_406_1.duration_ = var_409_58 + var_409_50
					end

					if var_409_53.prefab_name ~= "" and arg_406_1.actors_[var_409_53.prefab_name] ~= nil then
						local var_409_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_406_1.actors_[var_409_53.prefab_name].transform, "story_v_out_910601", "910601102", "story_v_out_910601.awb")

						arg_406_1:RecordAudio("910601102", var_409_59)
						arg_406_1:RecordAudio("910601102", var_409_59)
					else
						arg_406_1:AudioAction("play", "voice", "story_v_out_910601", "910601102", "story_v_out_910601.awb")
					end

					arg_406_1:RecordHistoryTalkVoice("story_v_out_910601", "910601102", "story_v_out_910601.awb")
				end

				arg_406_1:RecordContent(arg_406_1.text_.text)
			end

			local var_409_60 = math.max(var_409_51, arg_406_1.talkMaxDuration)

			if var_409_50 <= arg_406_1.time_ and arg_406_1.time_ < var_409_50 + var_409_60 then
				arg_406_1.typewritter.percent = (arg_406_1.time_ - var_409_50) / var_409_60

				arg_406_1.typewritter:SetDirty()
			end

			if arg_406_1.time_ >= var_409_50 + var_409_60 and arg_406_1.time_ < var_409_50 + var_409_60 + arg_409_0 then
				arg_406_1.typewritter.percent = 1

				arg_406_1.typewritter:SetDirty()
				arg_406_1:ShowNextGo(true)
			end
		end
	end,
	Play910601103 = function(arg_410_0, arg_410_1)
		arg_410_1.time_ = 0
		arg_410_1.frameCnt_ = 0
		arg_410_1.state_ = "playing"
		arg_410_1.curTalkId_ = 910601103
		arg_410_1.duration_ = 2.73

		SetActive(arg_410_1.tipsGo_, false)

		function arg_410_1.onSingleLineFinish_()
			arg_410_1.onSingleLineUpdate_ = nil
			arg_410_1.onSingleLineFinish_ = nil
			arg_410_1.state_ = "waiting"
		end

		function arg_410_1.playNext_(arg_412_0)
			if arg_412_0 == 1 then
				arg_410_0:Play910601104(arg_410_1)
			end
		end

		function arg_410_1.onSingleLineUpdate_(arg_413_0)
			local var_413_0 = arg_410_1.actors_["1080ui_story"]
			local var_413_1 = 0

			if var_413_1 < arg_410_1.time_ and arg_410_1.time_ <= var_413_1 + arg_413_0 and arg_410_1.var_.characterEffect1080ui_story == nil then
				arg_410_1.var_.characterEffect1080ui_story = var_413_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_413_2 = 0.200000002980232

			if var_413_1 <= arg_410_1.time_ and arg_410_1.time_ < var_413_1 + var_413_2 then
				local var_413_3 = (arg_410_1.time_ - var_413_1) / var_413_2

				if arg_410_1.var_.characterEffect1080ui_story then
					arg_410_1.var_.characterEffect1080ui_story.fillFlat = false
				end
			end

			if arg_410_1.time_ >= var_413_1 + var_413_2 and arg_410_1.time_ < var_413_1 + var_413_2 + arg_413_0 and arg_410_1.var_.characterEffect1080ui_story then
				arg_410_1.var_.characterEffect1080ui_story.fillFlat = false
			end

			local var_413_4 = arg_410_1.actors_["1027ui_story"]
			local var_413_5 = 0

			if var_413_5 < arg_410_1.time_ and arg_410_1.time_ <= var_413_5 + arg_413_0 and arg_410_1.var_.characterEffect1027ui_story == nil then
				arg_410_1.var_.characterEffect1027ui_story = var_413_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_413_6 = 0.200000002980232

			if var_413_5 <= arg_410_1.time_ and arg_410_1.time_ < var_413_5 + var_413_6 then
				local var_413_7 = (arg_410_1.time_ - var_413_5) / var_413_6

				if arg_410_1.var_.characterEffect1027ui_story then
					local var_413_8 = Mathf.Lerp(0, 0.5, var_413_7)

					arg_410_1.var_.characterEffect1027ui_story.fillFlat = true
					arg_410_1.var_.characterEffect1027ui_story.fillRatio = var_413_8
				end
			end

			if arg_410_1.time_ >= var_413_5 + var_413_6 and arg_410_1.time_ < var_413_5 + var_413_6 + arg_413_0 and arg_410_1.var_.characterEffect1027ui_story then
				local var_413_9 = 0.5

				arg_410_1.var_.characterEffect1027ui_story.fillFlat = true
				arg_410_1.var_.characterEffect1027ui_story.fillRatio = var_413_9
			end

			local var_413_10 = 0
			local var_413_11 = 0.275

			if var_413_10 < arg_410_1.time_ and arg_410_1.time_ <= var_413_10 + arg_413_0 then
				arg_410_1.talkMaxDuration = 0
				arg_410_1.dialogCg_.alpha = 1

				arg_410_1.dialog_:SetActive(true)
				SetActive(arg_410_1.leftNameGo_, true)

				local var_413_12 = arg_410_1:FormatText(StoryNameCfg[55].name)

				arg_410_1.leftNameTxt_.text = var_413_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_410_1.leftNameTxt_.transform)

				arg_410_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_410_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_410_1:RecordName(arg_410_1.leftNameTxt_.text)
				SetActive(arg_410_1.iconTrs_.gameObject, false)
				arg_410_1.callingController_:SetSelectedState("normal")

				local var_413_13 = arg_410_1:GetWordFromCfg(910601103)
				local var_413_14 = arg_410_1:FormatText(var_413_13.content)

				arg_410_1.text_.text = var_413_14

				LuaForUtil.ClearLinePrefixSymbol(arg_410_1.text_)

				local var_413_15 = 11
				local var_413_16 = utf8.len(var_413_14)
				local var_413_17 = var_413_15 <= 0 and var_413_11 or var_413_11 * (var_413_16 / var_413_15)

				if var_413_17 > 0 and var_413_11 < var_413_17 then
					arg_410_1.talkMaxDuration = var_413_17

					if var_413_17 + var_413_10 > arg_410_1.duration_ then
						arg_410_1.duration_ = var_413_17 + var_413_10
					end
				end

				arg_410_1.text_.text = var_413_14
				arg_410_1.typewritter.percent = 0

				arg_410_1.typewritter:SetDirty()
				arg_410_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601103", "story_v_out_910601.awb") ~= 0 then
					local var_413_18 = manager.audio:GetVoiceLength("story_v_out_910601", "910601103", "story_v_out_910601.awb") / 1000

					if var_413_18 + var_413_10 > arg_410_1.duration_ then
						arg_410_1.duration_ = var_413_18 + var_413_10
					end

					if var_413_13.prefab_name ~= "" and arg_410_1.actors_[var_413_13.prefab_name] ~= nil then
						local var_413_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_410_1.actors_[var_413_13.prefab_name].transform, "story_v_out_910601", "910601103", "story_v_out_910601.awb")

						arg_410_1:RecordAudio("910601103", var_413_19)
						arg_410_1:RecordAudio("910601103", var_413_19)
					else
						arg_410_1:AudioAction("play", "voice", "story_v_out_910601", "910601103", "story_v_out_910601.awb")
					end

					arg_410_1:RecordHistoryTalkVoice("story_v_out_910601", "910601103", "story_v_out_910601.awb")
				end

				arg_410_1:RecordContent(arg_410_1.text_.text)
			end

			local var_413_20 = math.max(var_413_11, arg_410_1.talkMaxDuration)

			if var_413_10 <= arg_410_1.time_ and arg_410_1.time_ < var_413_10 + var_413_20 then
				arg_410_1.typewritter.percent = (arg_410_1.time_ - var_413_10) / var_413_20

				arg_410_1.typewritter:SetDirty()
			end

			if arg_410_1.time_ >= var_413_10 + var_413_20 and arg_410_1.time_ < var_413_10 + var_413_20 + arg_413_0 then
				arg_410_1.typewritter.percent = 1

				arg_410_1.typewritter:SetDirty()
				arg_410_1:ShowNextGo(true)
			end
		end
	end,
	Play910601104 = function(arg_414_0, arg_414_1)
		arg_414_1.time_ = 0
		arg_414_1.frameCnt_ = 0
		arg_414_1.state_ = "playing"
		arg_414_1.curTalkId_ = 910601104
		arg_414_1.duration_ = 3.07

		SetActive(arg_414_1.tipsGo_, false)

		function arg_414_1.onSingleLineFinish_()
			arg_414_1.onSingleLineUpdate_ = nil
			arg_414_1.onSingleLineFinish_ = nil
			arg_414_1.state_ = "waiting"
		end

		function arg_414_1.playNext_(arg_416_0)
			if arg_416_0 == 1 then
				arg_414_0:Play910601105(arg_414_1)
			end
		end

		function arg_414_1.onSingleLineUpdate_(arg_417_0)
			local var_417_0 = arg_414_1.actors_["1027ui_story"].transform
			local var_417_1 = 0

			if var_417_1 < arg_414_1.time_ and arg_414_1.time_ <= var_417_1 + arg_417_0 then
				arg_414_1.var_.moveOldPos1027ui_story = var_417_0.localPosition
			end

			local var_417_2 = 0.001

			if var_417_1 <= arg_414_1.time_ and arg_414_1.time_ < var_417_1 + var_417_2 then
				local var_417_3 = (arg_414_1.time_ - var_417_1) / var_417_2
				local var_417_4 = Vector3.New(0, 100, 0)

				var_417_0.localPosition = Vector3.Lerp(arg_414_1.var_.moveOldPos1027ui_story, var_417_4, var_417_3)

				local var_417_5 = manager.ui.mainCamera.transform.position - var_417_0.position

				var_417_0.forward = Vector3.New(var_417_5.x, var_417_5.y, var_417_5.z)

				local var_417_6 = var_417_0.localEulerAngles

				var_417_6.z = 0
				var_417_6.x = 0
				var_417_0.localEulerAngles = var_417_6
			end

			if arg_414_1.time_ >= var_417_1 + var_417_2 and arg_414_1.time_ < var_417_1 + var_417_2 + arg_417_0 then
				var_417_0.localPosition = Vector3.New(0, 100, 0)

				local var_417_7 = manager.ui.mainCamera.transform.position - var_417_0.position

				var_417_0.forward = Vector3.New(var_417_7.x, var_417_7.y, var_417_7.z)

				local var_417_8 = var_417_0.localEulerAngles

				var_417_8.z = 0
				var_417_8.x = 0
				var_417_0.localEulerAngles = var_417_8
			end

			local var_417_9 = arg_414_1.actors_["1080ui_story"].transform
			local var_417_10 = 0

			if var_417_10 < arg_414_1.time_ and arg_414_1.time_ <= var_417_10 + arg_417_0 then
				arg_414_1.var_.moveOldPos1080ui_story = var_417_9.localPosition

				local var_417_11 = "1080ui_story"

				arg_414_1:ShowWeapon(arg_414_1.var_[var_417_11 .. "Animator"].transform, false)
			end

			local var_417_12 = 0.001

			if var_417_10 <= arg_414_1.time_ and arg_414_1.time_ < var_417_10 + var_417_12 then
				local var_417_13 = (arg_414_1.time_ - var_417_10) / var_417_12
				local var_417_14 = Vector3.New(0, 100, 0)

				var_417_9.localPosition = Vector3.Lerp(arg_414_1.var_.moveOldPos1080ui_story, var_417_14, var_417_13)

				local var_417_15 = manager.ui.mainCamera.transform.position - var_417_9.position

				var_417_9.forward = Vector3.New(var_417_15.x, var_417_15.y, var_417_15.z)

				local var_417_16 = var_417_9.localEulerAngles

				var_417_16.z = 0
				var_417_16.x = 0
				var_417_9.localEulerAngles = var_417_16
			end

			if arg_414_1.time_ >= var_417_10 + var_417_12 and arg_414_1.time_ < var_417_10 + var_417_12 + arg_417_0 then
				var_417_9.localPosition = Vector3.New(0, 100, 0)

				local var_417_17 = manager.ui.mainCamera.transform.position - var_417_9.position

				var_417_9.forward = Vector3.New(var_417_17.x, var_417_17.y, var_417_17.z)

				local var_417_18 = var_417_9.localEulerAngles

				var_417_18.z = 0
				var_417_18.x = 0
				var_417_9.localEulerAngles = var_417_18
			end

			local var_417_19 = arg_414_1.actors_["1059ui_story"].transform
			local var_417_20 = 0

			if var_417_20 < arg_414_1.time_ and arg_414_1.time_ <= var_417_20 + arg_417_0 then
				arg_414_1.var_.moveOldPos1059ui_story = var_417_19.localPosition
			end

			local var_417_21 = 0.001

			if var_417_20 <= arg_414_1.time_ and arg_414_1.time_ < var_417_20 + var_417_21 then
				local var_417_22 = (arg_414_1.time_ - var_417_20) / var_417_21
				local var_417_23 = Vector3.New(0, -1.05, -6)

				var_417_19.localPosition = Vector3.Lerp(arg_414_1.var_.moveOldPos1059ui_story, var_417_23, var_417_22)

				local var_417_24 = manager.ui.mainCamera.transform.position - var_417_19.position

				var_417_19.forward = Vector3.New(var_417_24.x, var_417_24.y, var_417_24.z)

				local var_417_25 = var_417_19.localEulerAngles

				var_417_25.z = 0
				var_417_25.x = 0
				var_417_19.localEulerAngles = var_417_25
			end

			if arg_414_1.time_ >= var_417_20 + var_417_21 and arg_414_1.time_ < var_417_20 + var_417_21 + arg_417_0 then
				var_417_19.localPosition = Vector3.New(0, -1.05, -6)

				local var_417_26 = manager.ui.mainCamera.transform.position - var_417_19.position

				var_417_19.forward = Vector3.New(var_417_26.x, var_417_26.y, var_417_26.z)

				local var_417_27 = var_417_19.localEulerAngles

				var_417_27.z = 0
				var_417_27.x = 0
				var_417_19.localEulerAngles = var_417_27
			end

			local var_417_28 = 0

			if var_417_28 < arg_414_1.time_ and arg_414_1.time_ <= var_417_28 + arg_417_0 then
				arg_414_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action1_1")
			end

			local var_417_29 = 0

			if var_417_29 < arg_414_1.time_ and arg_414_1.time_ <= var_417_29 + arg_417_0 then
				arg_414_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_417_30 = arg_414_1.actors_["1059ui_story"]
			local var_417_31 = 0

			if var_417_31 < arg_414_1.time_ and arg_414_1.time_ <= var_417_31 + arg_417_0 and arg_414_1.var_.characterEffect1059ui_story == nil then
				arg_414_1.var_.characterEffect1059ui_story = var_417_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_417_32 = 0.200000002980232

			if var_417_31 <= arg_414_1.time_ and arg_414_1.time_ < var_417_31 + var_417_32 then
				local var_417_33 = (arg_414_1.time_ - var_417_31) / var_417_32

				if arg_414_1.var_.characterEffect1059ui_story then
					arg_414_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_414_1.time_ >= var_417_31 + var_417_32 and arg_414_1.time_ < var_417_31 + var_417_32 + arg_417_0 and arg_414_1.var_.characterEffect1059ui_story then
				arg_414_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_417_34 = 0
			local var_417_35 = 0.425

			if var_417_34 < arg_414_1.time_ and arg_414_1.time_ <= var_417_34 + arg_417_0 then
				arg_414_1.talkMaxDuration = 0
				arg_414_1.dialogCg_.alpha = 1

				arg_414_1.dialog_:SetActive(true)
				SetActive(arg_414_1.leftNameGo_, true)

				local var_417_36 = arg_414_1:FormatText(StoryNameCfg[28].name)

				arg_414_1.leftNameTxt_.text = var_417_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_414_1.leftNameTxt_.transform)

				arg_414_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_414_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_414_1:RecordName(arg_414_1.leftNameTxt_.text)
				SetActive(arg_414_1.iconTrs_.gameObject, false)
				arg_414_1.callingController_:SetSelectedState("normal")

				local var_417_37 = arg_414_1:GetWordFromCfg(910601104)
				local var_417_38 = arg_414_1:FormatText(var_417_37.content)

				arg_414_1.text_.text = var_417_38

				LuaForUtil.ClearLinePrefixSymbol(arg_414_1.text_)

				local var_417_39 = 17
				local var_417_40 = utf8.len(var_417_38)
				local var_417_41 = var_417_39 <= 0 and var_417_35 or var_417_35 * (var_417_40 / var_417_39)

				if var_417_41 > 0 and var_417_35 < var_417_41 then
					arg_414_1.talkMaxDuration = var_417_41

					if var_417_41 + var_417_34 > arg_414_1.duration_ then
						arg_414_1.duration_ = var_417_41 + var_417_34
					end
				end

				arg_414_1.text_.text = var_417_38
				arg_414_1.typewritter.percent = 0

				arg_414_1.typewritter:SetDirty()
				arg_414_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601104", "story_v_out_910601.awb") ~= 0 then
					local var_417_42 = manager.audio:GetVoiceLength("story_v_out_910601", "910601104", "story_v_out_910601.awb") / 1000

					if var_417_42 + var_417_34 > arg_414_1.duration_ then
						arg_414_1.duration_ = var_417_42 + var_417_34
					end

					if var_417_37.prefab_name ~= "" and arg_414_1.actors_[var_417_37.prefab_name] ~= nil then
						local var_417_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_414_1.actors_[var_417_37.prefab_name].transform, "story_v_out_910601", "910601104", "story_v_out_910601.awb")

						arg_414_1:RecordAudio("910601104", var_417_43)
						arg_414_1:RecordAudio("910601104", var_417_43)
					else
						arg_414_1:AudioAction("play", "voice", "story_v_out_910601", "910601104", "story_v_out_910601.awb")
					end

					arg_414_1:RecordHistoryTalkVoice("story_v_out_910601", "910601104", "story_v_out_910601.awb")
				end

				arg_414_1:RecordContent(arg_414_1.text_.text)
			end

			local var_417_44 = math.max(var_417_35, arg_414_1.talkMaxDuration)

			if var_417_34 <= arg_414_1.time_ and arg_414_1.time_ < var_417_34 + var_417_44 then
				arg_414_1.typewritter.percent = (arg_414_1.time_ - var_417_34) / var_417_44

				arg_414_1.typewritter:SetDirty()
			end

			if arg_414_1.time_ >= var_417_34 + var_417_44 and arg_414_1.time_ < var_417_34 + var_417_44 + arg_417_0 then
				arg_414_1.typewritter.percent = 1

				arg_414_1.typewritter:SetDirty()
				arg_414_1:ShowNextGo(true)
			end
		end
	end,
	Play910601105 = function(arg_418_0, arg_418_1)
		arg_418_1.time_ = 0
		arg_418_1.frameCnt_ = 0
		arg_418_1.state_ = "playing"
		arg_418_1.curTalkId_ = 910601105
		arg_418_1.duration_ = 5

		SetActive(arg_418_1.tipsGo_, false)

		function arg_418_1.onSingleLineFinish_()
			arg_418_1.onSingleLineUpdate_ = nil
			arg_418_1.onSingleLineFinish_ = nil
			arg_418_1.state_ = "waiting"
		end

		function arg_418_1.playNext_(arg_420_0)
			if arg_420_0 == 1 then
				arg_418_0:Play910601106(arg_418_1)
			end
		end

		function arg_418_1.onSingleLineUpdate_(arg_421_0)
			local var_421_0 = arg_418_1.actors_["1059ui_story"]
			local var_421_1 = 0

			if var_421_1 < arg_418_1.time_ and arg_418_1.time_ <= var_421_1 + arg_421_0 and arg_418_1.var_.characterEffect1059ui_story == nil then
				arg_418_1.var_.characterEffect1059ui_story = var_421_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_421_2 = 0.200000002980232

			if var_421_1 <= arg_418_1.time_ and arg_418_1.time_ < var_421_1 + var_421_2 then
				local var_421_3 = (arg_418_1.time_ - var_421_1) / var_421_2

				if arg_418_1.var_.characterEffect1059ui_story then
					local var_421_4 = Mathf.Lerp(0, 0.5, var_421_3)

					arg_418_1.var_.characterEffect1059ui_story.fillFlat = true
					arg_418_1.var_.characterEffect1059ui_story.fillRatio = var_421_4
				end
			end

			if arg_418_1.time_ >= var_421_1 + var_421_2 and arg_418_1.time_ < var_421_1 + var_421_2 + arg_421_0 and arg_418_1.var_.characterEffect1059ui_story then
				local var_421_5 = 0.5

				arg_418_1.var_.characterEffect1059ui_story.fillFlat = true
				arg_418_1.var_.characterEffect1059ui_story.fillRatio = var_421_5
			end

			local var_421_6 = 0
			local var_421_7 = 0.35

			if var_421_6 < arg_418_1.time_ and arg_418_1.time_ <= var_421_6 + arg_421_0 then
				arg_418_1.talkMaxDuration = 0
				arg_418_1.dialogCg_.alpha = 1

				arg_418_1.dialog_:SetActive(true)
				SetActive(arg_418_1.leftNameGo_, true)

				local var_421_8 = arg_418_1:FormatText(StoryNameCfg[7].name)

				arg_418_1.leftNameTxt_.text = var_421_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_418_1.leftNameTxt_.transform)

				arg_418_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_418_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_418_1:RecordName(arg_418_1.leftNameTxt_.text)
				SetActive(arg_418_1.iconTrs_.gameObject, false)
				arg_418_1.callingController_:SetSelectedState("normal")

				local var_421_9 = arg_418_1:GetWordFromCfg(910601105)
				local var_421_10 = arg_418_1:FormatText(var_421_9.content)

				arg_418_1.text_.text = var_421_10

				LuaForUtil.ClearLinePrefixSymbol(arg_418_1.text_)

				local var_421_11 = 14
				local var_421_12 = utf8.len(var_421_10)
				local var_421_13 = var_421_11 <= 0 and var_421_7 or var_421_7 * (var_421_12 / var_421_11)

				if var_421_13 > 0 and var_421_7 < var_421_13 then
					arg_418_1.talkMaxDuration = var_421_13

					if var_421_13 + var_421_6 > arg_418_1.duration_ then
						arg_418_1.duration_ = var_421_13 + var_421_6
					end
				end

				arg_418_1.text_.text = var_421_10
				arg_418_1.typewritter.percent = 0

				arg_418_1.typewritter:SetDirty()
				arg_418_1:ShowNextGo(false)
				arg_418_1:RecordContent(arg_418_1.text_.text)
			end

			local var_421_14 = math.max(var_421_7, arg_418_1.talkMaxDuration)

			if var_421_6 <= arg_418_1.time_ and arg_418_1.time_ < var_421_6 + var_421_14 then
				arg_418_1.typewritter.percent = (arg_418_1.time_ - var_421_6) / var_421_14

				arg_418_1.typewritter:SetDirty()
			end

			if arg_418_1.time_ >= var_421_6 + var_421_14 and arg_418_1.time_ < var_421_6 + var_421_14 + arg_421_0 then
				arg_418_1.typewritter.percent = 1

				arg_418_1.typewritter:SetDirty()
				arg_418_1:ShowNextGo(true)
			end
		end
	end,
	Play910601106 = function(arg_422_0, arg_422_1)
		arg_422_1.time_ = 0
		arg_422_1.frameCnt_ = 0
		arg_422_1.state_ = "playing"
		arg_422_1.curTalkId_ = 910601106
		arg_422_1.duration_ = 7.87

		SetActive(arg_422_1.tipsGo_, false)

		function arg_422_1.onSingleLineFinish_()
			arg_422_1.onSingleLineUpdate_ = nil
			arg_422_1.onSingleLineFinish_ = nil
			arg_422_1.state_ = "waiting"
		end

		function arg_422_1.playNext_(arg_424_0)
			if arg_424_0 == 1 then
				arg_422_0:Play910601107(arg_422_1)
			end
		end

		function arg_422_1.onSingleLineUpdate_(arg_425_0)
			local var_425_0 = arg_422_1.actors_["1059ui_story"]
			local var_425_1 = 0

			if var_425_1 < arg_422_1.time_ and arg_422_1.time_ <= var_425_1 + arg_425_0 and arg_422_1.var_.characterEffect1059ui_story == nil then
				arg_422_1.var_.characterEffect1059ui_story = var_425_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_425_2 = 0.200000002980232

			if var_425_1 <= arg_422_1.time_ and arg_422_1.time_ < var_425_1 + var_425_2 then
				local var_425_3 = (arg_422_1.time_ - var_425_1) / var_425_2

				if arg_422_1.var_.characterEffect1059ui_story then
					arg_422_1.var_.characterEffect1059ui_story.fillFlat = false
				end
			end

			if arg_422_1.time_ >= var_425_1 + var_425_2 and arg_422_1.time_ < var_425_1 + var_425_2 + arg_425_0 and arg_422_1.var_.characterEffect1059ui_story then
				arg_422_1.var_.characterEffect1059ui_story.fillFlat = false
			end

			local var_425_4 = 0
			local var_425_5 = 0.775

			if var_425_4 < arg_422_1.time_ and arg_422_1.time_ <= var_425_4 + arg_425_0 then
				arg_422_1.talkMaxDuration = 0
				arg_422_1.dialogCg_.alpha = 1

				arg_422_1.dialog_:SetActive(true)
				SetActive(arg_422_1.leftNameGo_, true)

				local var_425_6 = arg_422_1:FormatText(StoryNameCfg[28].name)

				arg_422_1.leftNameTxt_.text = var_425_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_422_1.leftNameTxt_.transform)

				arg_422_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_422_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_422_1:RecordName(arg_422_1.leftNameTxt_.text)
				SetActive(arg_422_1.iconTrs_.gameObject, false)
				arg_422_1.callingController_:SetSelectedState("normal")

				local var_425_7 = arg_422_1:GetWordFromCfg(910601106)
				local var_425_8 = arg_422_1:FormatText(var_425_7.content)

				arg_422_1.text_.text = var_425_8

				LuaForUtil.ClearLinePrefixSymbol(arg_422_1.text_)

				local var_425_9 = 31
				local var_425_10 = utf8.len(var_425_8)
				local var_425_11 = var_425_9 <= 0 and var_425_5 or var_425_5 * (var_425_10 / var_425_9)

				if var_425_11 > 0 and var_425_5 < var_425_11 then
					arg_422_1.talkMaxDuration = var_425_11

					if var_425_11 + var_425_4 > arg_422_1.duration_ then
						arg_422_1.duration_ = var_425_11 + var_425_4
					end
				end

				arg_422_1.text_.text = var_425_8
				arg_422_1.typewritter.percent = 0

				arg_422_1.typewritter:SetDirty()
				arg_422_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601106", "story_v_out_910601.awb") ~= 0 then
					local var_425_12 = manager.audio:GetVoiceLength("story_v_out_910601", "910601106", "story_v_out_910601.awb") / 1000

					if var_425_12 + var_425_4 > arg_422_1.duration_ then
						arg_422_1.duration_ = var_425_12 + var_425_4
					end

					if var_425_7.prefab_name ~= "" and arg_422_1.actors_[var_425_7.prefab_name] ~= nil then
						local var_425_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_422_1.actors_[var_425_7.prefab_name].transform, "story_v_out_910601", "910601106", "story_v_out_910601.awb")

						arg_422_1:RecordAudio("910601106", var_425_13)
						arg_422_1:RecordAudio("910601106", var_425_13)
					else
						arg_422_1:AudioAction("play", "voice", "story_v_out_910601", "910601106", "story_v_out_910601.awb")
					end

					arg_422_1:RecordHistoryTalkVoice("story_v_out_910601", "910601106", "story_v_out_910601.awb")
				end

				arg_422_1:RecordContent(arg_422_1.text_.text)
			end

			local var_425_14 = math.max(var_425_5, arg_422_1.talkMaxDuration)

			if var_425_4 <= arg_422_1.time_ and arg_422_1.time_ < var_425_4 + var_425_14 then
				arg_422_1.typewritter.percent = (arg_422_1.time_ - var_425_4) / var_425_14

				arg_422_1.typewritter:SetDirty()
			end

			if arg_422_1.time_ >= var_425_4 + var_425_14 and arg_422_1.time_ < var_425_4 + var_425_14 + arg_425_0 then
				arg_422_1.typewritter.percent = 1

				arg_422_1.typewritter:SetDirty()
				arg_422_1:ShowNextGo(true)
			end
		end
	end,
	Play910601107 = function(arg_426_0, arg_426_1)
		arg_426_1.time_ = 0
		arg_426_1.frameCnt_ = 0
		arg_426_1.state_ = "playing"
		arg_426_1.curTalkId_ = 910601107
		arg_426_1.duration_ = 6.47

		SetActive(arg_426_1.tipsGo_, false)

		function arg_426_1.onSingleLineFinish_()
			arg_426_1.onSingleLineUpdate_ = nil
			arg_426_1.onSingleLineFinish_ = nil
			arg_426_1.state_ = "waiting"
		end

		function arg_426_1.playNext_(arg_428_0)
			if arg_428_0 == 1 then
				arg_426_0:Play910601108(arg_426_1)
			end
		end

		function arg_426_1.onSingleLineUpdate_(arg_429_0)
			local var_429_0 = 0

			if var_429_0 < arg_426_1.time_ and arg_426_1.time_ <= var_429_0 + arg_429_0 then
				arg_426_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/1059/1059action/1059action3_1")
			end

			local var_429_1 = 0

			if var_429_1 < arg_426_1.time_ and arg_426_1.time_ <= var_429_1 + arg_429_0 then
				arg_426_1:PlayTimeline("1059ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_429_2 = 0
			local var_429_3 = 0.8

			if var_429_2 < arg_426_1.time_ and arg_426_1.time_ <= var_429_2 + arg_429_0 then
				arg_426_1.talkMaxDuration = 0
				arg_426_1.dialogCg_.alpha = 1

				arg_426_1.dialog_:SetActive(true)
				SetActive(arg_426_1.leftNameGo_, true)

				local var_429_4 = arg_426_1:FormatText(StoryNameCfg[28].name)

				arg_426_1.leftNameTxt_.text = var_429_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_426_1.leftNameTxt_.transform)

				arg_426_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_426_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_426_1:RecordName(arg_426_1.leftNameTxt_.text)
				SetActive(arg_426_1.iconTrs_.gameObject, false)
				arg_426_1.callingController_:SetSelectedState("normal")

				local var_429_5 = arg_426_1:GetWordFromCfg(910601107)
				local var_429_6 = arg_426_1:FormatText(var_429_5.content)

				arg_426_1.text_.text = var_429_6

				LuaForUtil.ClearLinePrefixSymbol(arg_426_1.text_)

				local var_429_7 = 32
				local var_429_8 = utf8.len(var_429_6)
				local var_429_9 = var_429_7 <= 0 and var_429_3 or var_429_3 * (var_429_8 / var_429_7)

				if var_429_9 > 0 and var_429_3 < var_429_9 then
					arg_426_1.talkMaxDuration = var_429_9

					if var_429_9 + var_429_2 > arg_426_1.duration_ then
						arg_426_1.duration_ = var_429_9 + var_429_2
					end
				end

				arg_426_1.text_.text = var_429_6
				arg_426_1.typewritter.percent = 0

				arg_426_1.typewritter:SetDirty()
				arg_426_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601107", "story_v_out_910601.awb") ~= 0 then
					local var_429_10 = manager.audio:GetVoiceLength("story_v_out_910601", "910601107", "story_v_out_910601.awb") / 1000

					if var_429_10 + var_429_2 > arg_426_1.duration_ then
						arg_426_1.duration_ = var_429_10 + var_429_2
					end

					if var_429_5.prefab_name ~= "" and arg_426_1.actors_[var_429_5.prefab_name] ~= nil then
						local var_429_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_426_1.actors_[var_429_5.prefab_name].transform, "story_v_out_910601", "910601107", "story_v_out_910601.awb")

						arg_426_1:RecordAudio("910601107", var_429_11)
						arg_426_1:RecordAudio("910601107", var_429_11)
					else
						arg_426_1:AudioAction("play", "voice", "story_v_out_910601", "910601107", "story_v_out_910601.awb")
					end

					arg_426_1:RecordHistoryTalkVoice("story_v_out_910601", "910601107", "story_v_out_910601.awb")
				end

				arg_426_1:RecordContent(arg_426_1.text_.text)
			end

			local var_429_12 = math.max(var_429_3, arg_426_1.talkMaxDuration)

			if var_429_2 <= arg_426_1.time_ and arg_426_1.time_ < var_429_2 + var_429_12 then
				arg_426_1.typewritter.percent = (arg_426_1.time_ - var_429_2) / var_429_12

				arg_426_1.typewritter:SetDirty()
			end

			if arg_426_1.time_ >= var_429_2 + var_429_12 and arg_426_1.time_ < var_429_2 + var_429_12 + arg_429_0 then
				arg_426_1.typewritter.percent = 1

				arg_426_1.typewritter:SetDirty()
				arg_426_1:ShowNextGo(true)
			end
		end
	end,
	Play910601108 = function(arg_430_0, arg_430_1)
		arg_430_1.time_ = 0
		arg_430_1.frameCnt_ = 0
		arg_430_1.state_ = "playing"
		arg_430_1.curTalkId_ = 910601108
		arg_430_1.duration_ = 4.6

		SetActive(arg_430_1.tipsGo_, false)

		function arg_430_1.onSingleLineFinish_()
			arg_430_1.onSingleLineUpdate_ = nil
			arg_430_1.onSingleLineFinish_ = nil
			arg_430_1.state_ = "waiting"
		end

		function arg_430_1.playNext_(arg_432_0)
			if arg_432_0 == 1 then
				arg_430_0:Play910601109(arg_430_1)
			end
		end

		function arg_430_1.onSingleLineUpdate_(arg_433_0)
			local var_433_0 = arg_430_1.actors_["1059ui_story"].transform
			local var_433_1 = 0

			if var_433_1 < arg_430_1.time_ and arg_430_1.time_ <= var_433_1 + arg_433_0 then
				arg_430_1.var_.moveOldPos1059ui_story = var_433_0.localPosition
			end

			local var_433_2 = 0.001

			if var_433_1 <= arg_430_1.time_ and arg_430_1.time_ < var_433_1 + var_433_2 then
				local var_433_3 = (arg_430_1.time_ - var_433_1) / var_433_2
				local var_433_4 = Vector3.New(0, 100, 0)

				var_433_0.localPosition = Vector3.Lerp(arg_430_1.var_.moveOldPos1059ui_story, var_433_4, var_433_3)

				local var_433_5 = manager.ui.mainCamera.transform.position - var_433_0.position

				var_433_0.forward = Vector3.New(var_433_5.x, var_433_5.y, var_433_5.z)

				local var_433_6 = var_433_0.localEulerAngles

				var_433_6.z = 0
				var_433_6.x = 0
				var_433_0.localEulerAngles = var_433_6
			end

			if arg_430_1.time_ >= var_433_1 + var_433_2 and arg_430_1.time_ < var_433_1 + var_433_2 + arg_433_0 then
				var_433_0.localPosition = Vector3.New(0, 100, 0)

				local var_433_7 = manager.ui.mainCamera.transform.position - var_433_0.position

				var_433_0.forward = Vector3.New(var_433_7.x, var_433_7.y, var_433_7.z)

				local var_433_8 = var_433_0.localEulerAngles

				var_433_8.z = 0
				var_433_8.x = 0
				var_433_0.localEulerAngles = var_433_8
			end

			local var_433_9 = arg_430_1.actors_["1048ui_story"].transform
			local var_433_10 = 0

			if var_433_10 < arg_430_1.time_ and arg_430_1.time_ <= var_433_10 + arg_433_0 then
				arg_430_1.var_.moveOldPos1048ui_story = var_433_9.localPosition
			end

			local var_433_11 = 0.001

			if var_433_10 <= arg_430_1.time_ and arg_430_1.time_ < var_433_10 + var_433_11 then
				local var_433_12 = (arg_430_1.time_ - var_433_10) / var_433_11
				local var_433_13 = Vector3.New(0, -0.8, -6.2)

				var_433_9.localPosition = Vector3.Lerp(arg_430_1.var_.moveOldPos1048ui_story, var_433_13, var_433_12)

				local var_433_14 = manager.ui.mainCamera.transform.position - var_433_9.position

				var_433_9.forward = Vector3.New(var_433_14.x, var_433_14.y, var_433_14.z)

				local var_433_15 = var_433_9.localEulerAngles

				var_433_15.z = 0
				var_433_15.x = 0
				var_433_9.localEulerAngles = var_433_15
			end

			if arg_430_1.time_ >= var_433_10 + var_433_11 and arg_430_1.time_ < var_433_10 + var_433_11 + arg_433_0 then
				var_433_9.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_433_16 = manager.ui.mainCamera.transform.position - var_433_9.position

				var_433_9.forward = Vector3.New(var_433_16.x, var_433_16.y, var_433_16.z)

				local var_433_17 = var_433_9.localEulerAngles

				var_433_17.z = 0
				var_433_17.x = 0
				var_433_9.localEulerAngles = var_433_17
			end

			local var_433_18 = 0

			if var_433_18 < arg_430_1.time_ and arg_430_1.time_ <= var_433_18 + arg_433_0 then
				arg_430_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action5_1")
			end

			local var_433_19 = 0

			if var_433_19 < arg_430_1.time_ and arg_430_1.time_ <= var_433_19 + arg_433_0 then
				arg_430_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_433_20 = arg_430_1.actors_["1048ui_story"]
			local var_433_21 = 0

			if var_433_21 < arg_430_1.time_ and arg_430_1.time_ <= var_433_21 + arg_433_0 and arg_430_1.var_.characterEffect1048ui_story == nil then
				arg_430_1.var_.characterEffect1048ui_story = var_433_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_433_22 = 0.200000002980232

			if var_433_21 <= arg_430_1.time_ and arg_430_1.time_ < var_433_21 + var_433_22 then
				local var_433_23 = (arg_430_1.time_ - var_433_21) / var_433_22

				if arg_430_1.var_.characterEffect1048ui_story then
					arg_430_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_430_1.time_ >= var_433_21 + var_433_22 and arg_430_1.time_ < var_433_21 + var_433_22 + arg_433_0 and arg_430_1.var_.characterEffect1048ui_story then
				arg_430_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_433_24 = 0
			local var_433_25 = 0.45

			if var_433_24 < arg_430_1.time_ and arg_430_1.time_ <= var_433_24 + arg_433_0 then
				arg_430_1.talkMaxDuration = 0
				arg_430_1.dialogCg_.alpha = 1

				arg_430_1.dialog_:SetActive(true)
				SetActive(arg_430_1.leftNameGo_, true)

				local var_433_26 = arg_430_1:FormatText(StoryNameCfg[8].name)

				arg_430_1.leftNameTxt_.text = var_433_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_430_1.leftNameTxt_.transform)

				arg_430_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_430_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_430_1:RecordName(arg_430_1.leftNameTxt_.text)
				SetActive(arg_430_1.iconTrs_.gameObject, false)
				arg_430_1.callingController_:SetSelectedState("normal")

				local var_433_27 = arg_430_1:GetWordFromCfg(910601108)
				local var_433_28 = arg_430_1:FormatText(var_433_27.content)

				arg_430_1.text_.text = var_433_28

				LuaForUtil.ClearLinePrefixSymbol(arg_430_1.text_)

				local var_433_29 = 18
				local var_433_30 = utf8.len(var_433_28)
				local var_433_31 = var_433_29 <= 0 and var_433_25 or var_433_25 * (var_433_30 / var_433_29)

				if var_433_31 > 0 and var_433_25 < var_433_31 then
					arg_430_1.talkMaxDuration = var_433_31

					if var_433_31 + var_433_24 > arg_430_1.duration_ then
						arg_430_1.duration_ = var_433_31 + var_433_24
					end
				end

				arg_430_1.text_.text = var_433_28
				arg_430_1.typewritter.percent = 0

				arg_430_1.typewritter:SetDirty()
				arg_430_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601108", "story_v_out_910601.awb") ~= 0 then
					local var_433_32 = manager.audio:GetVoiceLength("story_v_out_910601", "910601108", "story_v_out_910601.awb") / 1000

					if var_433_32 + var_433_24 > arg_430_1.duration_ then
						arg_430_1.duration_ = var_433_32 + var_433_24
					end

					if var_433_27.prefab_name ~= "" and arg_430_1.actors_[var_433_27.prefab_name] ~= nil then
						local var_433_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_430_1.actors_[var_433_27.prefab_name].transform, "story_v_out_910601", "910601108", "story_v_out_910601.awb")

						arg_430_1:RecordAudio("910601108", var_433_33)
						arg_430_1:RecordAudio("910601108", var_433_33)
					else
						arg_430_1:AudioAction("play", "voice", "story_v_out_910601", "910601108", "story_v_out_910601.awb")
					end

					arg_430_1:RecordHistoryTalkVoice("story_v_out_910601", "910601108", "story_v_out_910601.awb")
				end

				arg_430_1:RecordContent(arg_430_1.text_.text)
			end

			local var_433_34 = math.max(var_433_25, arg_430_1.talkMaxDuration)

			if var_433_24 <= arg_430_1.time_ and arg_430_1.time_ < var_433_24 + var_433_34 then
				arg_430_1.typewritter.percent = (arg_430_1.time_ - var_433_24) / var_433_34

				arg_430_1.typewritter:SetDirty()
			end

			if arg_430_1.time_ >= var_433_24 + var_433_34 and arg_430_1.time_ < var_433_24 + var_433_34 + arg_433_0 then
				arg_430_1.typewritter.percent = 1

				arg_430_1.typewritter:SetDirty()
				arg_430_1:ShowNextGo(true)
			end
		end
	end,
	Play910601109 = function(arg_434_0, arg_434_1)
		arg_434_1.time_ = 0
		arg_434_1.frameCnt_ = 0
		arg_434_1.state_ = "playing"
		arg_434_1.curTalkId_ = 910601109
		arg_434_1.duration_ = 2.67

		SetActive(arg_434_1.tipsGo_, false)

		function arg_434_1.onSingleLineFinish_()
			arg_434_1.onSingleLineUpdate_ = nil
			arg_434_1.onSingleLineFinish_ = nil
			arg_434_1.state_ = "waiting"
		end

		function arg_434_1.playNext_(arg_436_0)
			if arg_436_0 == 1 then
				arg_434_0:Play910601110(arg_434_1)
			end
		end

		function arg_434_1.onSingleLineUpdate_(arg_437_0)
			local var_437_0 = arg_434_1.actors_["1048ui_story"].transform
			local var_437_1 = 0

			if var_437_1 < arg_434_1.time_ and arg_434_1.time_ <= var_437_1 + arg_437_0 then
				arg_434_1.var_.moveOldPos1048ui_story = var_437_0.localPosition
			end

			local var_437_2 = 0.001

			if var_437_1 <= arg_434_1.time_ and arg_434_1.time_ < var_437_1 + var_437_2 then
				local var_437_3 = (arg_434_1.time_ - var_437_1) / var_437_2
				local var_437_4 = Vector3.New(0, 100, 0)

				var_437_0.localPosition = Vector3.Lerp(arg_434_1.var_.moveOldPos1048ui_story, var_437_4, var_437_3)

				local var_437_5 = manager.ui.mainCamera.transform.position - var_437_0.position

				var_437_0.forward = Vector3.New(var_437_5.x, var_437_5.y, var_437_5.z)

				local var_437_6 = var_437_0.localEulerAngles

				var_437_6.z = 0
				var_437_6.x = 0
				var_437_0.localEulerAngles = var_437_6
			end

			if arg_434_1.time_ >= var_437_1 + var_437_2 and arg_434_1.time_ < var_437_1 + var_437_2 + arg_437_0 then
				var_437_0.localPosition = Vector3.New(0, 100, 0)

				local var_437_7 = manager.ui.mainCamera.transform.position - var_437_0.position

				var_437_0.forward = Vector3.New(var_437_7.x, var_437_7.y, var_437_7.z)

				local var_437_8 = var_437_0.localEulerAngles

				var_437_8.z = 0
				var_437_8.x = 0
				var_437_0.localEulerAngles = var_437_8
			end

			local var_437_9 = arg_434_1.actors_["1084ui_story"].transform
			local var_437_10 = 0

			if var_437_10 < arg_434_1.time_ and arg_434_1.time_ <= var_437_10 + arg_437_0 then
				arg_434_1.var_.moveOldPos1084ui_story = var_437_9.localPosition
			end

			local var_437_11 = 0.001

			if var_437_10 <= arg_434_1.time_ and arg_434_1.time_ < var_437_10 + var_437_11 then
				local var_437_12 = (arg_434_1.time_ - var_437_10) / var_437_11
				local var_437_13 = Vector3.New(0, -0.97, -6)

				var_437_9.localPosition = Vector3.Lerp(arg_434_1.var_.moveOldPos1084ui_story, var_437_13, var_437_12)

				local var_437_14 = manager.ui.mainCamera.transform.position - var_437_9.position

				var_437_9.forward = Vector3.New(var_437_14.x, var_437_14.y, var_437_14.z)

				local var_437_15 = var_437_9.localEulerAngles

				var_437_15.z = 0
				var_437_15.x = 0
				var_437_9.localEulerAngles = var_437_15
			end

			if arg_434_1.time_ >= var_437_10 + var_437_11 and arg_434_1.time_ < var_437_10 + var_437_11 + arg_437_0 then
				var_437_9.localPosition = Vector3.New(0, -0.97, -6)

				local var_437_16 = manager.ui.mainCamera.transform.position - var_437_9.position

				var_437_9.forward = Vector3.New(var_437_16.x, var_437_16.y, var_437_16.z)

				local var_437_17 = var_437_9.localEulerAngles

				var_437_17.z = 0
				var_437_17.x = 0
				var_437_9.localEulerAngles = var_437_17
			end

			local var_437_18 = 0

			if var_437_18 < arg_434_1.time_ and arg_434_1.time_ <= var_437_18 + arg_437_0 then
				arg_434_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_437_19 = 0

			if var_437_19 < arg_434_1.time_ and arg_434_1.time_ <= var_437_19 + arg_437_0 then
				arg_434_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_437_20 = arg_434_1.actors_["1084ui_story"]
			local var_437_21 = 0

			if var_437_21 < arg_434_1.time_ and arg_434_1.time_ <= var_437_21 + arg_437_0 and arg_434_1.var_.characterEffect1084ui_story == nil then
				arg_434_1.var_.characterEffect1084ui_story = var_437_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_437_22 = 0.200000002980232

			if var_437_21 <= arg_434_1.time_ and arg_434_1.time_ < var_437_21 + var_437_22 then
				local var_437_23 = (arg_434_1.time_ - var_437_21) / var_437_22

				if arg_434_1.var_.characterEffect1084ui_story then
					arg_434_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_434_1.time_ >= var_437_21 + var_437_22 and arg_434_1.time_ < var_437_21 + var_437_22 + arg_437_0 and arg_434_1.var_.characterEffect1084ui_story then
				arg_434_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_437_24 = 0
			local var_437_25 = 0.633333333333333

			if var_437_24 < arg_434_1.time_ and arg_434_1.time_ <= var_437_24 + arg_437_0 then
				local var_437_26 = "play"
				local var_437_27 = "music"

				arg_434_1:AudioAction(var_437_26, var_437_27, "ui_battle", "ui_battle_stopbgm", "")

				local var_437_28 = ""
				local var_437_29 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_437_29 ~= "" then
					if arg_434_1.bgmTxt_.text ~= var_437_29 and arg_434_1.bgmTxt_.text ~= "" then
						if arg_434_1.bgmTxt2_.text ~= "" then
							arg_434_1.bgmTxt_.text = arg_434_1.bgmTxt2_.text
						end

						arg_434_1.bgmTxt2_.text = var_437_29

						arg_434_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_434_1.bgmTxt_.text = var_437_29
					end

					if arg_434_1.bgmTimer then
						arg_434_1.bgmTimer:Stop()

						arg_434_1.bgmTimer = nil
					end

					if arg_434_1.settingData.show_music_name == 1 then
						arg_434_1.musicController:SetSelectedState("show")
						arg_434_1.musicAnimator_:Play("open", 0, 0)

						if arg_434_1.settingData.music_time ~= 0 then
							arg_434_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_434_1.settingData.music_time), function()
								if arg_434_1 == nil or isNil(arg_434_1.bgmTxt_) then
									return
								end

								arg_434_1.musicController:SetSelectedState("hide")
								arg_434_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_437_30 = 0
			local var_437_31 = 0.175

			if var_437_30 < arg_434_1.time_ and arg_434_1.time_ <= var_437_30 + arg_437_0 then
				arg_434_1.talkMaxDuration = 0
				arg_434_1.dialogCg_.alpha = 1

				arg_434_1.dialog_:SetActive(true)
				SetActive(arg_434_1.leftNameGo_, true)

				local var_437_32 = arg_434_1:FormatText(StoryNameCfg[6].name)

				arg_434_1.leftNameTxt_.text = var_437_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_434_1.leftNameTxt_.transform)

				arg_434_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_434_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_434_1:RecordName(arg_434_1.leftNameTxt_.text)
				SetActive(arg_434_1.iconTrs_.gameObject, false)
				arg_434_1.callingController_:SetSelectedState("normal")

				local var_437_33 = arg_434_1:GetWordFromCfg(910601109)
				local var_437_34 = arg_434_1:FormatText(var_437_33.content)

				arg_434_1.text_.text = var_437_34

				LuaForUtil.ClearLinePrefixSymbol(arg_434_1.text_)

				local var_437_35 = 7
				local var_437_36 = utf8.len(var_437_34)
				local var_437_37 = var_437_35 <= 0 and var_437_31 or var_437_31 * (var_437_36 / var_437_35)

				if var_437_37 > 0 and var_437_31 < var_437_37 then
					arg_434_1.talkMaxDuration = var_437_37

					if var_437_37 + var_437_30 > arg_434_1.duration_ then
						arg_434_1.duration_ = var_437_37 + var_437_30
					end
				end

				arg_434_1.text_.text = var_437_34
				arg_434_1.typewritter.percent = 0

				arg_434_1.typewritter:SetDirty()
				arg_434_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601109", "story_v_out_910601.awb") ~= 0 then
					local var_437_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601109", "story_v_out_910601.awb") / 1000

					if var_437_38 + var_437_30 > arg_434_1.duration_ then
						arg_434_1.duration_ = var_437_38 + var_437_30
					end

					if var_437_33.prefab_name ~= "" and arg_434_1.actors_[var_437_33.prefab_name] ~= nil then
						local var_437_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_434_1.actors_[var_437_33.prefab_name].transform, "story_v_out_910601", "910601109", "story_v_out_910601.awb")

						arg_434_1:RecordAudio("910601109", var_437_39)
						arg_434_1:RecordAudio("910601109", var_437_39)
					else
						arg_434_1:AudioAction("play", "voice", "story_v_out_910601", "910601109", "story_v_out_910601.awb")
					end

					arg_434_1:RecordHistoryTalkVoice("story_v_out_910601", "910601109", "story_v_out_910601.awb")
				end

				arg_434_1:RecordContent(arg_434_1.text_.text)
			end

			local var_437_40 = math.max(var_437_31, arg_434_1.talkMaxDuration)

			if var_437_30 <= arg_434_1.time_ and arg_434_1.time_ < var_437_30 + var_437_40 then
				arg_434_1.typewritter.percent = (arg_434_1.time_ - var_437_30) / var_437_40

				arg_434_1.typewritter:SetDirty()
			end

			if arg_434_1.time_ >= var_437_30 + var_437_40 and arg_434_1.time_ < var_437_30 + var_437_40 + arg_437_0 then
				arg_434_1.typewritter.percent = 1

				arg_434_1.typewritter:SetDirty()
				arg_434_1:ShowNextGo(true)
			end
		end
	end,
	Play910601110 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 910601110
		arg_439_1.duration_ = 2

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play910601111(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1084ui_story"].transform
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 then
				arg_439_1.var_.moveOldPos1084ui_story = var_442_0.localPosition
			end

			local var_442_2 = 0.001

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2
				local var_442_4 = Vector3.New(0, 100, 0)

				var_442_0.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos1084ui_story, var_442_4, var_442_3)

				local var_442_5 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_5.x, var_442_5.y, var_442_5.z)

				local var_442_6 = var_442_0.localEulerAngles

				var_442_6.z = 0
				var_442_6.x = 0
				var_442_0.localEulerAngles = var_442_6
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 then
				var_442_0.localPosition = Vector3.New(0, 100, 0)

				local var_442_7 = manager.ui.mainCamera.transform.position - var_442_0.position

				var_442_0.forward = Vector3.New(var_442_7.x, var_442_7.y, var_442_7.z)

				local var_442_8 = var_442_0.localEulerAngles

				var_442_8.z = 0
				var_442_8.x = 0
				var_442_0.localEulerAngles = var_442_8
			end

			local var_442_9 = arg_439_1.actors_["1011ui_story"].transform
			local var_442_10 = 0

			if var_442_10 < arg_439_1.time_ and arg_439_1.time_ <= var_442_10 + arg_442_0 then
				arg_439_1.var_.moveOldPos1011ui_story = var_442_9.localPosition
			end

			local var_442_11 = 0.001

			if var_442_10 <= arg_439_1.time_ and arg_439_1.time_ < var_442_10 + var_442_11 then
				local var_442_12 = (arg_439_1.time_ - var_442_10) / var_442_11
				local var_442_13 = Vector3.New(0, -0.71, -6)

				var_442_9.localPosition = Vector3.Lerp(arg_439_1.var_.moveOldPos1011ui_story, var_442_13, var_442_12)

				local var_442_14 = manager.ui.mainCamera.transform.position - var_442_9.position

				var_442_9.forward = Vector3.New(var_442_14.x, var_442_14.y, var_442_14.z)

				local var_442_15 = var_442_9.localEulerAngles

				var_442_15.z = 0
				var_442_15.x = 0
				var_442_9.localEulerAngles = var_442_15
			end

			if arg_439_1.time_ >= var_442_10 + var_442_11 and arg_439_1.time_ < var_442_10 + var_442_11 + arg_442_0 then
				var_442_9.localPosition = Vector3.New(0, -0.71, -6)

				local var_442_16 = manager.ui.mainCamera.transform.position - var_442_9.position

				var_442_9.forward = Vector3.New(var_442_16.x, var_442_16.y, var_442_16.z)

				local var_442_17 = var_442_9.localEulerAngles

				var_442_17.z = 0
				var_442_17.x = 0
				var_442_9.localEulerAngles = var_442_17
			end

			local var_442_18 = arg_439_1.actors_["1011ui_story"]
			local var_442_19 = 0

			if var_442_19 < arg_439_1.time_ and arg_439_1.time_ <= var_442_19 + arg_442_0 and arg_439_1.var_.characterEffect1011ui_story == nil then
				arg_439_1.var_.characterEffect1011ui_story = var_442_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_20 = 0.200000002980232

			if var_442_19 <= arg_439_1.time_ and arg_439_1.time_ < var_442_19 + var_442_20 then
				local var_442_21 = (arg_439_1.time_ - var_442_19) / var_442_20

				if arg_439_1.var_.characterEffect1011ui_story then
					arg_439_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_439_1.time_ >= var_442_19 + var_442_20 and arg_439_1.time_ < var_442_19 + var_442_20 + arg_442_0 and arg_439_1.var_.characterEffect1011ui_story then
				arg_439_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_442_22 = 0

			if var_442_22 < arg_439_1.time_ and arg_439_1.time_ <= var_442_22 + arg_442_0 then
				arg_439_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_442_23 = 0

			if var_442_23 < arg_439_1.time_ and arg_439_1.time_ <= var_442_23 + arg_442_0 then
				arg_439_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_442_24 = 0
			local var_442_25 = 0.225

			if var_442_24 < arg_439_1.time_ and arg_439_1.time_ <= var_442_24 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_26 = arg_439_1:FormatText(StoryNameCfg[37].name)

				arg_439_1.leftNameTxt_.text = var_442_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_27 = arg_439_1:GetWordFromCfg(910601110)
				local var_442_28 = arg_439_1:FormatText(var_442_27.content)

				arg_439_1.text_.text = var_442_28

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_29 = 9
				local var_442_30 = utf8.len(var_442_28)
				local var_442_31 = var_442_29 <= 0 and var_442_25 or var_442_25 * (var_442_30 / var_442_29)

				if var_442_31 > 0 and var_442_25 < var_442_31 then
					arg_439_1.talkMaxDuration = var_442_31

					if var_442_31 + var_442_24 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_31 + var_442_24
					end
				end

				arg_439_1.text_.text = var_442_28
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601110", "story_v_out_910601.awb") ~= 0 then
					local var_442_32 = manager.audio:GetVoiceLength("story_v_out_910601", "910601110", "story_v_out_910601.awb") / 1000

					if var_442_32 + var_442_24 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_32 + var_442_24
					end

					if var_442_27.prefab_name ~= "" and arg_439_1.actors_[var_442_27.prefab_name] ~= nil then
						local var_442_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_27.prefab_name].transform, "story_v_out_910601", "910601110", "story_v_out_910601.awb")

						arg_439_1:RecordAudio("910601110", var_442_33)
						arg_439_1:RecordAudio("910601110", var_442_33)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_910601", "910601110", "story_v_out_910601.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_910601", "910601110", "story_v_out_910601.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_34 = math.max(var_442_25, arg_439_1.talkMaxDuration)

			if var_442_24 <= arg_439_1.time_ and arg_439_1.time_ < var_442_24 + var_442_34 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_24) / var_442_34

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_24 + var_442_34 and arg_439_1.time_ < var_442_24 + var_442_34 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play910601111 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 910601111
		arg_443_1.duration_ = 1.8

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play910601112(arg_443_1)
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
				local var_446_4 = Vector3.New(0, 100, 0)

				var_446_0.localPosition = Vector3.Lerp(arg_443_1.var_.moveOldPos1011ui_story, var_446_4, var_446_3)

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
			local var_446_10 = 0.375

			if var_446_9 < arg_443_1.time_ and arg_443_1.time_ <= var_446_9 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_11 = arg_443_1:FormatText(StoryNameCfg[330].name)

				arg_443_1.leftNameTxt_.text = var_446_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_12 = arg_443_1:GetWordFromCfg(910601111)
				local var_446_13 = arg_443_1:FormatText(var_446_12.content)

				arg_443_1.text_.text = var_446_13

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_14 = 15
				local var_446_15 = utf8.len(var_446_13)
				local var_446_16 = var_446_14 <= 0 and var_446_10 or var_446_10 * (var_446_15 / var_446_14)

				if var_446_16 > 0 and var_446_10 < var_446_16 then
					arg_443_1.talkMaxDuration = var_446_16

					if var_446_16 + var_446_9 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_16 + var_446_9
					end
				end

				arg_443_1.text_.text = var_446_13
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601111", "story_v_out_910601.awb") ~= 0 then
					local var_446_17 = manager.audio:GetVoiceLength("story_v_out_910601", "910601111", "story_v_out_910601.awb") / 1000

					if var_446_17 + var_446_9 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_17 + var_446_9
					end

					if var_446_12.prefab_name ~= "" and arg_443_1.actors_[var_446_12.prefab_name] ~= nil then
						local var_446_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_12.prefab_name].transform, "story_v_out_910601", "910601111", "story_v_out_910601.awb")

						arg_443_1:RecordAudio("910601111", var_446_18)
						arg_443_1:RecordAudio("910601111", var_446_18)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_910601", "910601111", "story_v_out_910601.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_910601", "910601111", "story_v_out_910601.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_19 = math.max(var_446_10, arg_443_1.talkMaxDuration)

			if var_446_9 <= arg_443_1.time_ and arg_443_1.time_ < var_446_9 + var_446_19 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_9) / var_446_19

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_9 + var_446_19 and arg_443_1.time_ < var_446_9 + var_446_19 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play910601112 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 910601112
		arg_447_1.duration_ = 1

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play910601121(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			return
		end
	end,
	Play910601121 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 910601121
		arg_451_1.duration_ = 9

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play910601122(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = 2

			if var_454_0 < arg_451_1.time_ and arg_451_1.time_ <= var_454_0 + arg_454_0 then
				local var_454_1 = manager.ui.mainCamera.transform.localPosition
				local var_454_2 = Vector3.New(0, 0, 10) + Vector3.New(var_454_1.x, var_454_1.y, 0)
				local var_454_3 = arg_451_1.bgs_.ST60

				var_454_3.transform.localPosition = var_454_2
				var_454_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_454_4 = var_454_3:GetComponent("SpriteRenderer")

				if var_454_4 and var_454_4.sprite then
					local var_454_5 = (var_454_3.transform.localPosition - var_454_1).z
					local var_454_6 = manager.ui.mainCameraCom_
					local var_454_7 = 2 * var_454_5 * Mathf.Tan(var_454_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_454_8 = var_454_7 * var_454_6.aspect
					local var_454_9 = var_454_4.sprite.bounds.size.x
					local var_454_10 = var_454_4.sprite.bounds.size.y
					local var_454_11 = var_454_8 / var_454_9
					local var_454_12 = var_454_7 / var_454_10
					local var_454_13 = var_454_12 < var_454_11 and var_454_11 or var_454_12

					var_454_3.transform.localScale = Vector3.New(var_454_13, var_454_13, 0)
				end

				for iter_454_0, iter_454_1 in pairs(arg_451_1.bgs_) do
					if iter_454_0 ~= "ST60" then
						iter_454_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_454_14 = 0

			if var_454_14 < arg_451_1.time_ and arg_451_1.time_ <= var_454_14 + arg_454_0 then
				arg_451_1.mask_.enabled = true
				arg_451_1.mask_.raycastTarget = true

				arg_451_1:SetGaussion(false)
			end

			local var_454_15 = 2

			if var_454_14 <= arg_451_1.time_ and arg_451_1.time_ < var_454_14 + var_454_15 then
				local var_454_16 = (arg_451_1.time_ - var_454_14) / var_454_15
				local var_454_17 = Color.New(1, 1, 1)

				var_454_17.a = Mathf.Lerp(0, 1, var_454_16)
				arg_451_1.mask_.color = var_454_17
			end

			if arg_451_1.time_ >= var_454_14 + var_454_15 and arg_451_1.time_ < var_454_14 + var_454_15 + arg_454_0 then
				local var_454_18 = Color.New(1, 1, 1)

				var_454_18.a = 1
				arg_451_1.mask_.color = var_454_18
			end

			local var_454_19 = 2

			if var_454_19 < arg_451_1.time_ and arg_451_1.time_ <= var_454_19 + arg_454_0 then
				arg_451_1.mask_.enabled = true
				arg_451_1.mask_.raycastTarget = true

				arg_451_1:SetGaussion(false)
			end

			local var_454_20 = 2

			if var_454_19 <= arg_451_1.time_ and arg_451_1.time_ < var_454_19 + var_454_20 then
				local var_454_21 = (arg_451_1.time_ - var_454_19) / var_454_20
				local var_454_22 = Color.New(1, 1, 1)

				var_454_22.a = Mathf.Lerp(1, 0, var_454_21)
				arg_451_1.mask_.color = var_454_22
			end

			if arg_451_1.time_ >= var_454_19 + var_454_20 and arg_451_1.time_ < var_454_19 + var_454_20 + arg_454_0 then
				local var_454_23 = Color.New(1, 1, 1)
				local var_454_24 = 0

				arg_451_1.mask_.enabled = false
				var_454_23.a = var_454_24
				arg_451_1.mask_.color = var_454_23
			end

			local var_454_25 = 2

			if var_454_25 < arg_451_1.time_ and arg_451_1.time_ <= var_454_25 + arg_454_0 then
				SetActive(arg_451_1.dialog_, true)
				SetActive(arg_451_1.allBtn_.gameObject, true)
				arg_451_1.hideBtnsController_:SetSelectedIndex(0)
				manager.video:Dispose()
			end

			local var_454_26 = 2

			if var_454_25 <= arg_451_1.time_ and arg_451_1.time_ < var_454_25 + var_454_26 then
				-- block empty
			end

			if arg_451_1.time_ >= var_454_25 + var_454_26 and arg_451_1.time_ < var_454_25 + var_454_26 + arg_454_0 then
				arg_451_1.marker = ""
			end

			if arg_451_1.frameCnt_ <= 1 then
				arg_451_1.dialog_:SetActive(false)
			end

			local var_454_27 = 4
			local var_454_28 = 0.075

			if var_454_27 < arg_451_1.time_ and arg_451_1.time_ <= var_454_27 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0

				arg_451_1.dialog_:SetActive(true)

				local var_454_29 = LeanTween.value(arg_451_1.dialog_, 0, 1, 0.3)

				var_454_29:setOnUpdate(LuaHelper.FloatAction(function(arg_455_0)
					arg_451_1.dialogCg_.alpha = arg_455_0
				end))
				var_454_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_451_1.dialog_)
					var_454_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_451_1.duration_ = arg_451_1.duration_ + 0.3

				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_30 = arg_451_1:FormatText(StoryNameCfg[7].name)

				arg_451_1.leftNameTxt_.text = var_454_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_31 = arg_451_1:GetWordFromCfg(910601121)
				local var_454_32 = arg_451_1:FormatText(var_454_31.content)

				arg_451_1.text_.text = var_454_32

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_33 = 3
				local var_454_34 = utf8.len(var_454_32)
				local var_454_35 = var_454_33 <= 0 and var_454_28 or var_454_28 * (var_454_34 / var_454_33)

				if var_454_35 > 0 and var_454_28 < var_454_35 then
					arg_451_1.talkMaxDuration = var_454_35
					var_454_27 = var_454_27 + 0.3

					if var_454_35 + var_454_27 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_35 + var_454_27
					end
				end

				arg_451_1.text_.text = var_454_32
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_36 = var_454_27 + 0.3
			local var_454_37 = math.max(var_454_28, arg_451_1.talkMaxDuration)

			if var_454_36 <= arg_451_1.time_ and arg_451_1.time_ < var_454_36 + var_454_37 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_36) / var_454_37

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_36 + var_454_37 and arg_451_1.time_ < var_454_36 + var_454_37 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play910601122 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 910601122
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play910601123(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = 0
			local var_460_1 = 0.325

			if var_460_0 < arg_457_1.time_ and arg_457_1.time_ <= var_460_0 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_2 = arg_457_1:FormatText(StoryNameCfg[7].name)

				arg_457_1.leftNameTxt_.text = var_460_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_3 = arg_457_1:GetWordFromCfg(910601122)
				local var_460_4 = arg_457_1:FormatText(var_460_3.content)

				arg_457_1.text_.text = var_460_4

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_5 = 13
				local var_460_6 = utf8.len(var_460_4)
				local var_460_7 = var_460_5 <= 0 and var_460_1 or var_460_1 * (var_460_6 / var_460_5)

				if var_460_7 > 0 and var_460_1 < var_460_7 then
					arg_457_1.talkMaxDuration = var_460_7

					if var_460_7 + var_460_0 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_7 + var_460_0
					end
				end

				arg_457_1.text_.text = var_460_4
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_8 = math.max(var_460_1, arg_457_1.talkMaxDuration)

			if var_460_0 <= arg_457_1.time_ and arg_457_1.time_ < var_460_0 + var_460_8 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_0) / var_460_8

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_0 + var_460_8 and arg_457_1.time_ < var_460_0 + var_460_8 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play910601123 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 910601123
		arg_461_1.duration_ = 5

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play910601124(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = 0
			local var_464_1 = 0.75

			if var_464_0 < arg_461_1.time_ and arg_461_1.time_ <= var_464_0 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, false)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_2 = arg_461_1:GetWordFromCfg(910601123)
				local var_464_3 = arg_461_1:FormatText(var_464_2.content)

				arg_461_1.text_.text = var_464_3

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_4 = 30
				local var_464_5 = utf8.len(var_464_3)
				local var_464_6 = var_464_4 <= 0 and var_464_1 or var_464_1 * (var_464_5 / var_464_4)

				if var_464_6 > 0 and var_464_1 < var_464_6 then
					arg_461_1.talkMaxDuration = var_464_6

					if var_464_6 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_6 + var_464_0
					end
				end

				arg_461_1.text_.text = var_464_3
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)
				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_7 = math.max(var_464_1, arg_461_1.talkMaxDuration)

			if var_464_0 <= arg_461_1.time_ and arg_461_1.time_ < var_464_0 + var_464_7 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_0) / var_464_7

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_0 + var_464_7 and arg_461_1.time_ < var_464_0 + var_464_7 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play910601124 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 910601124
		arg_465_1.duration_ = 5

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play910601125(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = 0
			local var_468_1 = 0.7

			if var_468_0 < arg_465_1.time_ and arg_465_1.time_ <= var_468_0 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_2 = arg_465_1:FormatText(StoryNameCfg[7].name)

				arg_465_1.leftNameTxt_.text = var_468_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_3 = arg_465_1:GetWordFromCfg(910601124)
				local var_468_4 = arg_465_1:FormatText(var_468_3.content)

				arg_465_1.text_.text = var_468_4

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_5 = 28
				local var_468_6 = utf8.len(var_468_4)
				local var_468_7 = var_468_5 <= 0 and var_468_1 or var_468_1 * (var_468_6 / var_468_5)

				if var_468_7 > 0 and var_468_1 < var_468_7 then
					arg_465_1.talkMaxDuration = var_468_7

					if var_468_7 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_7 + var_468_0
					end
				end

				arg_465_1.text_.text = var_468_4
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)
				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_8 = math.max(var_468_1, arg_465_1.talkMaxDuration)

			if var_468_0 <= arg_465_1.time_ and arg_465_1.time_ < var_468_0 + var_468_8 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_0) / var_468_8

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_0 + var_468_8 and arg_465_1.time_ < var_468_0 + var_468_8 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play910601125 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 910601125
		arg_469_1.duration_ = 5

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play910601126(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = 0
			local var_472_1 = 0.633333333333333

			if var_472_0 < arg_469_1.time_ and arg_469_1.time_ <= var_472_0 + arg_472_0 then
				local var_472_2 = "play"
				local var_472_3 = "music"

				arg_469_1:AudioAction(var_472_2, var_472_3, "ui_battle", "ui_battle_stopbgm", "")

				local var_472_4 = ""
				local var_472_5 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_472_5 ~= "" then
					if arg_469_1.bgmTxt_.text ~= var_472_5 and arg_469_1.bgmTxt_.text ~= "" then
						if arg_469_1.bgmTxt2_.text ~= "" then
							arg_469_1.bgmTxt_.text = arg_469_1.bgmTxt2_.text
						end

						arg_469_1.bgmTxt2_.text = var_472_5

						arg_469_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_469_1.bgmTxt_.text = var_472_5
					end

					if arg_469_1.bgmTimer then
						arg_469_1.bgmTimer:Stop()

						arg_469_1.bgmTimer = nil
					end

					if arg_469_1.settingData.show_music_name == 1 then
						arg_469_1.musicController:SetSelectedState("show")
						arg_469_1.musicAnimator_:Play("open", 0, 0)

						if arg_469_1.settingData.music_time ~= 0 then
							arg_469_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_469_1.settingData.music_time), function()
								if arg_469_1 == nil or isNil(arg_469_1.bgmTxt_) then
									return
								end

								arg_469_1.musicController:SetSelectedState("hide")
								arg_469_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_472_6 = 0.8
			local var_472_7 = 1

			if var_472_6 < arg_469_1.time_ and arg_469_1.time_ <= var_472_6 + arg_472_0 then
				local var_472_8 = "play"
				local var_472_9 = "music"

				arg_469_1:AudioAction(var_472_8, var_472_9, "bgm_side_daily07", "bgm_side_daily07", "bgm_side_daily07.awb")

				local var_472_10 = ""
				local var_472_11 = manager.audio:GetAudioName("bgm_side_daily07", "bgm_side_daily07")

				if var_472_11 ~= "" then
					if arg_469_1.bgmTxt_.text ~= var_472_11 and arg_469_1.bgmTxt_.text ~= "" then
						if arg_469_1.bgmTxt2_.text ~= "" then
							arg_469_1.bgmTxt_.text = arg_469_1.bgmTxt2_.text
						end

						arg_469_1.bgmTxt2_.text = var_472_11

						arg_469_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_469_1.bgmTxt_.text = var_472_11
					end

					if arg_469_1.bgmTimer then
						arg_469_1.bgmTimer:Stop()

						arg_469_1.bgmTimer = nil
					end

					if arg_469_1.settingData.show_music_name == 1 then
						arg_469_1.musicController:SetSelectedState("show")
						arg_469_1.musicAnimator_:Play("open", 0, 0)

						if arg_469_1.settingData.music_time ~= 0 then
							arg_469_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_469_1.settingData.music_time), function()
								if arg_469_1 == nil or isNil(arg_469_1.bgmTxt_) then
									return
								end

								arg_469_1.musicController:SetSelectedState("hide")
								arg_469_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_472_12 = 0
			local var_472_13 = 0.625

			if var_472_12 < arg_469_1.time_ and arg_469_1.time_ <= var_472_12 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_14 = arg_469_1:FormatText(StoryNameCfg[7].name)

				arg_469_1.leftNameTxt_.text = var_472_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, false)
				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_15 = arg_469_1:GetWordFromCfg(910601125)
				local var_472_16 = arg_469_1:FormatText(var_472_15.content)

				arg_469_1.text_.text = var_472_16

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_17 = 25
				local var_472_18 = utf8.len(var_472_16)
				local var_472_19 = var_472_17 <= 0 and var_472_13 or var_472_13 * (var_472_18 / var_472_17)

				if var_472_19 > 0 and var_472_13 < var_472_19 then
					arg_469_1.talkMaxDuration = var_472_19

					if var_472_19 + var_472_12 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_19 + var_472_12
					end
				end

				arg_469_1.text_.text = var_472_16
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)
				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_20 = math.max(var_472_13, arg_469_1.talkMaxDuration)

			if var_472_12 <= arg_469_1.time_ and arg_469_1.time_ < var_472_12 + var_472_20 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_12) / var_472_20

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_12 + var_472_20 and arg_469_1.time_ < var_472_12 + var_472_20 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play910601126 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 910601126
		arg_475_1.duration_ = 4

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play910601127(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["1011ui_story"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos1011ui_story = var_478_0.localPosition
			end

			local var_478_2 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2
				local var_478_4 = Vector3.New(0, -0.71, -6)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos1011ui_story, var_478_4, var_478_3)

				local var_478_5 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_5.x, var_478_5.y, var_478_5.z)

				local var_478_6 = var_478_0.localEulerAngles

				var_478_6.z = 0
				var_478_6.x = 0
				var_478_0.localEulerAngles = var_478_6
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_478_7 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_7.x, var_478_7.y, var_478_7.z)

				local var_478_8 = var_478_0.localEulerAngles

				var_478_8.z = 0
				var_478_8.x = 0
				var_478_0.localEulerAngles = var_478_8
			end

			local var_478_9 = arg_475_1.actors_["1011ui_story"]
			local var_478_10 = 0

			if var_478_10 < arg_475_1.time_ and arg_475_1.time_ <= var_478_10 + arg_478_0 and arg_475_1.var_.characterEffect1011ui_story == nil then
				arg_475_1.var_.characterEffect1011ui_story = var_478_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_11 = 0.200000002980232

			if var_478_10 <= arg_475_1.time_ and arg_475_1.time_ < var_478_10 + var_478_11 then
				local var_478_12 = (arg_475_1.time_ - var_478_10) / var_478_11

				if arg_475_1.var_.characterEffect1011ui_story then
					arg_475_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_475_1.time_ >= var_478_10 + var_478_11 and arg_475_1.time_ < var_478_10 + var_478_11 + arg_478_0 and arg_475_1.var_.characterEffect1011ui_story then
				arg_475_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_478_13 = 0

			if var_478_13 < arg_475_1.time_ and arg_475_1.time_ <= var_478_13 + arg_478_0 then
				arg_475_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_478_14 = 0

			if var_478_14 < arg_475_1.time_ and arg_475_1.time_ <= var_478_14 + arg_478_0 then
				arg_475_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_478_15 = 0
			local var_478_16 = 0.325

			if var_478_15 < arg_475_1.time_ and arg_475_1.time_ <= var_478_15 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_17 = arg_475_1:FormatText(StoryNameCfg[37].name)

				arg_475_1.leftNameTxt_.text = var_478_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_18 = arg_475_1:GetWordFromCfg(910601126)
				local var_478_19 = arg_475_1:FormatText(var_478_18.content)

				arg_475_1.text_.text = var_478_19

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_20 = 13
				local var_478_21 = utf8.len(var_478_19)
				local var_478_22 = var_478_20 <= 0 and var_478_16 or var_478_16 * (var_478_21 / var_478_20)

				if var_478_22 > 0 and var_478_16 < var_478_22 then
					arg_475_1.talkMaxDuration = var_478_22

					if var_478_22 + var_478_15 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_22 + var_478_15
					end
				end

				arg_475_1.text_.text = var_478_19
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601126", "story_v_out_910601.awb") ~= 0 then
					local var_478_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601126", "story_v_out_910601.awb") / 1000

					if var_478_23 + var_478_15 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_23 + var_478_15
					end

					if var_478_18.prefab_name ~= "" and arg_475_1.actors_[var_478_18.prefab_name] ~= nil then
						local var_478_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_18.prefab_name].transform, "story_v_out_910601", "910601126", "story_v_out_910601.awb")

						arg_475_1:RecordAudio("910601126", var_478_24)
						arg_475_1:RecordAudio("910601126", var_478_24)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_910601", "910601126", "story_v_out_910601.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_910601", "910601126", "story_v_out_910601.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_25 = math.max(var_478_16, arg_475_1.talkMaxDuration)

			if var_478_15 <= arg_475_1.time_ and arg_475_1.time_ < var_478_15 + var_478_25 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_15) / var_478_25

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_15 + var_478_25 and arg_475_1.time_ < var_478_15 + var_478_25 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play910601127 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 910601127
		arg_479_1.duration_ = 2.5

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play910601128(arg_479_1)
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
				local var_482_4 = Vector3.New(0, 100, 0)

				var_482_0.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos1011ui_story, var_482_4, var_482_3)

				local var_482_5 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_5.x, var_482_5.y, var_482_5.z)

				local var_482_6 = var_482_0.localEulerAngles

				var_482_6.z = 0
				var_482_6.x = 0
				var_482_0.localEulerAngles = var_482_6
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 then
				var_482_0.localPosition = Vector3.New(0, 100, 0)

				local var_482_7 = manager.ui.mainCamera.transform.position - var_482_0.position

				var_482_0.forward = Vector3.New(var_482_7.x, var_482_7.y, var_482_7.z)

				local var_482_8 = var_482_0.localEulerAngles

				var_482_8.z = 0
				var_482_8.x = 0
				var_482_0.localEulerAngles = var_482_8
			end

			local var_482_9 = arg_479_1.actors_["1084ui_story"].transform
			local var_482_10 = 0

			if var_482_10 < arg_479_1.time_ and arg_479_1.time_ <= var_482_10 + arg_482_0 then
				arg_479_1.var_.moveOldPos1084ui_story = var_482_9.localPosition
			end

			local var_482_11 = 0.001

			if var_482_10 <= arg_479_1.time_ and arg_479_1.time_ < var_482_10 + var_482_11 then
				local var_482_12 = (arg_479_1.time_ - var_482_10) / var_482_11
				local var_482_13 = Vector3.New(0, -0.97, -6)

				var_482_9.localPosition = Vector3.Lerp(arg_479_1.var_.moveOldPos1084ui_story, var_482_13, var_482_12)

				local var_482_14 = manager.ui.mainCamera.transform.position - var_482_9.position

				var_482_9.forward = Vector3.New(var_482_14.x, var_482_14.y, var_482_14.z)

				local var_482_15 = var_482_9.localEulerAngles

				var_482_15.z = 0
				var_482_15.x = 0
				var_482_9.localEulerAngles = var_482_15
			end

			if arg_479_1.time_ >= var_482_10 + var_482_11 and arg_479_1.time_ < var_482_10 + var_482_11 + arg_482_0 then
				var_482_9.localPosition = Vector3.New(0, -0.97, -6)

				local var_482_16 = manager.ui.mainCamera.transform.position - var_482_9.position

				var_482_9.forward = Vector3.New(var_482_16.x, var_482_16.y, var_482_16.z)

				local var_482_17 = var_482_9.localEulerAngles

				var_482_17.z = 0
				var_482_17.x = 0
				var_482_9.localEulerAngles = var_482_17
			end

			local var_482_18 = 0

			if var_482_18 < arg_479_1.time_ and arg_479_1.time_ <= var_482_18 + arg_482_0 then
				arg_479_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_482_19 = 0

			if var_482_19 < arg_479_1.time_ and arg_479_1.time_ <= var_482_19 + arg_482_0 then
				arg_479_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_482_20 = arg_479_1.actors_["1084ui_story"]
			local var_482_21 = 0

			if var_482_21 < arg_479_1.time_ and arg_479_1.time_ <= var_482_21 + arg_482_0 and arg_479_1.var_.characterEffect1084ui_story == nil then
				arg_479_1.var_.characterEffect1084ui_story = var_482_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_22 = 0.200000002980232

			if var_482_21 <= arg_479_1.time_ and arg_479_1.time_ < var_482_21 + var_482_22 then
				local var_482_23 = (arg_479_1.time_ - var_482_21) / var_482_22

				if arg_479_1.var_.characterEffect1084ui_story then
					arg_479_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_479_1.time_ >= var_482_21 + var_482_22 and arg_479_1.time_ < var_482_21 + var_482_22 + arg_482_0 and arg_479_1.var_.characterEffect1084ui_story then
				arg_479_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_482_24 = 0
			local var_482_25 = 0.35

			if var_482_24 < arg_479_1.time_ and arg_479_1.time_ <= var_482_24 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_26 = arg_479_1:FormatText(StoryNameCfg[6].name)

				arg_479_1.leftNameTxt_.text = var_482_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_27 = arg_479_1:GetWordFromCfg(910601127)
				local var_482_28 = arg_479_1:FormatText(var_482_27.content)

				arg_479_1.text_.text = var_482_28

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_29 = 14
				local var_482_30 = utf8.len(var_482_28)
				local var_482_31 = var_482_29 <= 0 and var_482_25 or var_482_25 * (var_482_30 / var_482_29)

				if var_482_31 > 0 and var_482_25 < var_482_31 then
					arg_479_1.talkMaxDuration = var_482_31

					if var_482_31 + var_482_24 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_31 + var_482_24
					end
				end

				arg_479_1.text_.text = var_482_28
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601127", "story_v_out_910601.awb") ~= 0 then
					local var_482_32 = manager.audio:GetVoiceLength("story_v_out_910601", "910601127", "story_v_out_910601.awb") / 1000

					if var_482_32 + var_482_24 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_32 + var_482_24
					end

					if var_482_27.prefab_name ~= "" and arg_479_1.actors_[var_482_27.prefab_name] ~= nil then
						local var_482_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_27.prefab_name].transform, "story_v_out_910601", "910601127", "story_v_out_910601.awb")

						arg_479_1:RecordAudio("910601127", var_482_33)
						arg_479_1:RecordAudio("910601127", var_482_33)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_910601", "910601127", "story_v_out_910601.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_910601", "910601127", "story_v_out_910601.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_34 = math.max(var_482_25, arg_479_1.talkMaxDuration)

			if var_482_24 <= arg_479_1.time_ and arg_479_1.time_ < var_482_24 + var_482_34 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_24) / var_482_34

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_24 + var_482_34 and arg_479_1.time_ < var_482_24 + var_482_34 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play910601128 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 910601128
		arg_483_1.duration_ = 4

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play910601129(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["1084ui_story"]
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 and arg_483_1.var_.characterEffect1084ui_story == nil then
				arg_483_1.var_.characterEffect1084ui_story = var_486_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_2 = 0.200000002980232

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2

				if arg_483_1.var_.characterEffect1084ui_story then
					arg_483_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 and arg_483_1.var_.characterEffect1084ui_story then
				arg_483_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_486_4 = 0

			if var_486_4 < arg_483_1.time_ and arg_483_1.time_ <= var_486_4 + arg_486_0 then
				arg_483_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_486_5 = 0

			if var_486_5 < arg_483_1.time_ and arg_483_1.time_ <= var_486_5 + arg_486_0 then
				arg_483_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_486_6 = 0
			local var_486_7 = 0.525

			if var_486_6 < arg_483_1.time_ and arg_483_1.time_ <= var_486_6 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_8 = arg_483_1:FormatText(StoryNameCfg[6].name)

				arg_483_1.leftNameTxt_.text = var_486_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_9 = arg_483_1:GetWordFromCfg(910601128)
				local var_486_10 = arg_483_1:FormatText(var_486_9.content)

				arg_483_1.text_.text = var_486_10

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_11 = 21
				local var_486_12 = utf8.len(var_486_10)
				local var_486_13 = var_486_11 <= 0 and var_486_7 or var_486_7 * (var_486_12 / var_486_11)

				if var_486_13 > 0 and var_486_7 < var_486_13 then
					arg_483_1.talkMaxDuration = var_486_13

					if var_486_13 + var_486_6 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_13 + var_486_6
					end
				end

				arg_483_1.text_.text = var_486_10
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601128", "story_v_out_910601.awb") ~= 0 then
					local var_486_14 = manager.audio:GetVoiceLength("story_v_out_910601", "910601128", "story_v_out_910601.awb") / 1000

					if var_486_14 + var_486_6 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_14 + var_486_6
					end

					if var_486_9.prefab_name ~= "" and arg_483_1.actors_[var_486_9.prefab_name] ~= nil then
						local var_486_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_483_1.actors_[var_486_9.prefab_name].transform, "story_v_out_910601", "910601128", "story_v_out_910601.awb")

						arg_483_1:RecordAudio("910601128", var_486_15)
						arg_483_1:RecordAudio("910601128", var_486_15)
					else
						arg_483_1:AudioAction("play", "voice", "story_v_out_910601", "910601128", "story_v_out_910601.awb")
					end

					arg_483_1:RecordHistoryTalkVoice("story_v_out_910601", "910601128", "story_v_out_910601.awb")
				end

				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_16 = math.max(var_486_7, arg_483_1.talkMaxDuration)

			if var_486_6 <= arg_483_1.time_ and arg_483_1.time_ < var_486_6 + var_486_16 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_6) / var_486_16

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_6 + var_486_16 and arg_483_1.time_ < var_486_6 + var_486_16 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play910601129 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 910601129
		arg_487_1.duration_ = 5

		SetActive(arg_487_1.tipsGo_, false)

		function arg_487_1.onSingleLineFinish_()
			arg_487_1.onSingleLineUpdate_ = nil
			arg_487_1.onSingleLineFinish_ = nil
			arg_487_1.state_ = "waiting"
		end

		function arg_487_1.playNext_(arg_489_0)
			if arg_489_0 == 1 then
				arg_487_0:Play910601130(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["1084ui_story"]
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 and arg_487_1.var_.characterEffect1084ui_story == nil then
				arg_487_1.var_.characterEffect1084ui_story = var_490_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_2 = 0.200000002980232

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2

				if arg_487_1.var_.characterEffect1084ui_story then
					local var_490_4 = Mathf.Lerp(0, 0.5, var_490_3)

					arg_487_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_487_1.var_.characterEffect1084ui_story.fillRatio = var_490_4
				end
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 and arg_487_1.var_.characterEffect1084ui_story then
				local var_490_5 = 0.5

				arg_487_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_487_1.var_.characterEffect1084ui_story.fillRatio = var_490_5
			end

			local var_490_6 = 0
			local var_490_7 = 1.3

			if var_490_6 < arg_487_1.time_ and arg_487_1.time_ <= var_490_6 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, false)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_8 = arg_487_1:GetWordFromCfg(910601129)
				local var_490_9 = arg_487_1:FormatText(var_490_8.content)

				arg_487_1.text_.text = var_490_9

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_10 = 52
				local var_490_11 = utf8.len(var_490_9)
				local var_490_12 = var_490_10 <= 0 and var_490_7 or var_490_7 * (var_490_11 / var_490_10)

				if var_490_12 > 0 and var_490_7 < var_490_12 then
					arg_487_1.talkMaxDuration = var_490_12

					if var_490_12 + var_490_6 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_12 + var_490_6
					end
				end

				arg_487_1.text_.text = var_490_9
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)
				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_13 = math.max(var_490_7, arg_487_1.talkMaxDuration)

			if var_490_6 <= arg_487_1.time_ and arg_487_1.time_ < var_490_6 + var_490_13 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_6) / var_490_13

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_6 + var_490_13 and arg_487_1.time_ < var_490_6 + var_490_13 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play910601130 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 910601130
		arg_491_1.duration_ = 5

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play910601131(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1084ui_story"].transform
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 then
				arg_491_1.var_.moveOldPos1084ui_story = var_494_0.localPosition
			end

			local var_494_2 = 0.001

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2
				local var_494_4 = Vector3.New(0, -0.97, -6)

				var_494_0.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPos1084ui_story, var_494_4, var_494_3)

				local var_494_5 = manager.ui.mainCamera.transform.position - var_494_0.position

				var_494_0.forward = Vector3.New(var_494_5.x, var_494_5.y, var_494_5.z)

				local var_494_6 = var_494_0.localEulerAngles

				var_494_6.z = 0
				var_494_6.x = 0
				var_494_0.localEulerAngles = var_494_6
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 then
				var_494_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_494_7 = manager.ui.mainCamera.transform.position - var_494_0.position

				var_494_0.forward = Vector3.New(var_494_7.x, var_494_7.y, var_494_7.z)

				local var_494_8 = var_494_0.localEulerAngles

				var_494_8.z = 0
				var_494_8.x = 0
				var_494_0.localEulerAngles = var_494_8
			end

			local var_494_9 = arg_491_1.actors_["1084ui_story"]
			local var_494_10 = 0

			if var_494_10 < arg_491_1.time_ and arg_491_1.time_ <= var_494_10 + arg_494_0 and arg_491_1.var_.characterEffect1084ui_story == nil then
				arg_491_1.var_.characterEffect1084ui_story = var_494_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_11 = 0.200000002980232

			if var_494_10 <= arg_491_1.time_ and arg_491_1.time_ < var_494_10 + var_494_11 then
				local var_494_12 = (arg_491_1.time_ - var_494_10) / var_494_11

				if arg_491_1.var_.characterEffect1084ui_story then
					local var_494_13 = Mathf.Lerp(0, 0.5, var_494_12)

					arg_491_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_491_1.var_.characterEffect1084ui_story.fillRatio = var_494_13
				end
			end

			if arg_491_1.time_ >= var_494_10 + var_494_11 and arg_491_1.time_ < var_494_10 + var_494_11 + arg_494_0 and arg_491_1.var_.characterEffect1084ui_story then
				local var_494_14 = 0.5

				arg_491_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_491_1.var_.characterEffect1084ui_story.fillRatio = var_494_14
			end

			local var_494_15 = 0
			local var_494_16 = 0.75

			if var_494_15 < arg_491_1.time_ and arg_491_1.time_ <= var_494_15 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_17 = arg_491_1:FormatText(StoryNameCfg[7].name)

				arg_491_1.leftNameTxt_.text = var_494_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_18 = arg_491_1:GetWordFromCfg(910601130)
				local var_494_19 = arg_491_1:FormatText(var_494_18.content)

				arg_491_1.text_.text = var_494_19

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_20 = 30
				local var_494_21 = utf8.len(var_494_19)
				local var_494_22 = var_494_20 <= 0 and var_494_16 or var_494_16 * (var_494_21 / var_494_20)

				if var_494_22 > 0 and var_494_16 < var_494_22 then
					arg_491_1.talkMaxDuration = var_494_22

					if var_494_22 + var_494_15 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_22 + var_494_15
					end
				end

				arg_491_1.text_.text = var_494_19
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)
				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_23 = math.max(var_494_16, arg_491_1.talkMaxDuration)

			if var_494_15 <= arg_491_1.time_ and arg_491_1.time_ < var_494_15 + var_494_23 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_15) / var_494_23

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_15 + var_494_23 and arg_491_1.time_ < var_494_15 + var_494_23 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play910601131 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 910601131
		arg_495_1.duration_ = 7.83

		SetActive(arg_495_1.tipsGo_, false)

		function arg_495_1.onSingleLineFinish_()
			arg_495_1.onSingleLineUpdate_ = nil
			arg_495_1.onSingleLineFinish_ = nil
			arg_495_1.state_ = "waiting"
		end

		function arg_495_1.playNext_(arg_497_0)
			if arg_497_0 == 1 then
				arg_495_0:Play910601132(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = 0

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_498_1 = arg_495_1.actors_["1084ui_story"]
			local var_498_2 = 0

			if var_498_2 < arg_495_1.time_ and arg_495_1.time_ <= var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1084ui_story == nil then
				arg_495_1.var_.characterEffect1084ui_story = var_498_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_3 = 0.200000002980232

			if var_498_2 <= arg_495_1.time_ and arg_495_1.time_ < var_498_2 + var_498_3 then
				local var_498_4 = (arg_495_1.time_ - var_498_2) / var_498_3

				if arg_495_1.var_.characterEffect1084ui_story then
					arg_495_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_495_1.time_ >= var_498_2 + var_498_3 and arg_495_1.time_ < var_498_2 + var_498_3 + arg_498_0 and arg_495_1.var_.characterEffect1084ui_story then
				arg_495_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_498_5 = 0
			local var_498_6 = 0.95

			if var_498_5 < arg_495_1.time_ and arg_495_1.time_ <= var_498_5 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_7 = arg_495_1:FormatText(StoryNameCfg[6].name)

				arg_495_1.leftNameTxt_.text = var_498_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_8 = arg_495_1:GetWordFromCfg(910601131)
				local var_498_9 = arg_495_1:FormatText(var_498_8.content)

				arg_495_1.text_.text = var_498_9

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_10 = 38
				local var_498_11 = utf8.len(var_498_9)
				local var_498_12 = var_498_10 <= 0 and var_498_6 or var_498_6 * (var_498_11 / var_498_10)

				if var_498_12 > 0 and var_498_6 < var_498_12 then
					arg_495_1.talkMaxDuration = var_498_12

					if var_498_12 + var_498_5 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_12 + var_498_5
					end
				end

				arg_495_1.text_.text = var_498_9
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601131", "story_v_out_910601.awb") ~= 0 then
					local var_498_13 = manager.audio:GetVoiceLength("story_v_out_910601", "910601131", "story_v_out_910601.awb") / 1000

					if var_498_13 + var_498_5 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_13 + var_498_5
					end

					if var_498_8.prefab_name ~= "" and arg_495_1.actors_[var_498_8.prefab_name] ~= nil then
						local var_498_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_8.prefab_name].transform, "story_v_out_910601", "910601131", "story_v_out_910601.awb")

						arg_495_1:RecordAudio("910601131", var_498_14)
						arg_495_1:RecordAudio("910601131", var_498_14)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_910601", "910601131", "story_v_out_910601.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_910601", "910601131", "story_v_out_910601.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_15 = math.max(var_498_6, arg_495_1.talkMaxDuration)

			if var_498_5 <= arg_495_1.time_ and arg_495_1.time_ < var_498_5 + var_498_15 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_5) / var_498_15

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_5 + var_498_15 and arg_495_1.time_ < var_498_5 + var_498_15 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play910601132 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 910601132
		arg_499_1.duration_ = 2.03

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play910601133(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1084ui_story"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 and arg_499_1.var_.characterEffect1084ui_story == nil then
				arg_499_1.var_.characterEffect1084ui_story = var_502_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_2 = 0.200000002980232

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2

				if arg_499_1.var_.characterEffect1084ui_story then
					arg_499_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 and arg_499_1.var_.characterEffect1084ui_story then
				arg_499_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_502_4 = 0
			local var_502_5 = 0.175

			if var_502_4 < arg_499_1.time_ and arg_499_1.time_ <= var_502_4 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_6 = arg_499_1:FormatText(StoryNameCfg[6].name)

				arg_499_1.leftNameTxt_.text = var_502_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_7 = arg_499_1:GetWordFromCfg(910601132)
				local var_502_8 = arg_499_1:FormatText(var_502_7.content)

				arg_499_1.text_.text = var_502_8

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_9 = 7
				local var_502_10 = utf8.len(var_502_8)
				local var_502_11 = var_502_9 <= 0 and var_502_5 or var_502_5 * (var_502_10 / var_502_9)

				if var_502_11 > 0 and var_502_5 < var_502_11 then
					arg_499_1.talkMaxDuration = var_502_11

					if var_502_11 + var_502_4 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_11 + var_502_4
					end
				end

				arg_499_1.text_.text = var_502_8
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601132", "story_v_out_910601.awb") ~= 0 then
					local var_502_12 = manager.audio:GetVoiceLength("story_v_out_910601", "910601132", "story_v_out_910601.awb") / 1000

					if var_502_12 + var_502_4 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_12 + var_502_4
					end

					if var_502_7.prefab_name ~= "" and arg_499_1.actors_[var_502_7.prefab_name] ~= nil then
						local var_502_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_7.prefab_name].transform, "story_v_out_910601", "910601132", "story_v_out_910601.awb")

						arg_499_1:RecordAudio("910601132", var_502_13)
						arg_499_1:RecordAudio("910601132", var_502_13)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_out_910601", "910601132", "story_v_out_910601.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_out_910601", "910601132", "story_v_out_910601.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_14 = math.max(var_502_5, arg_499_1.talkMaxDuration)

			if var_502_4 <= arg_499_1.time_ and arg_499_1.time_ < var_502_4 + var_502_14 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_4) / var_502_14

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_4 + var_502_14 and arg_499_1.time_ < var_502_4 + var_502_14 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play910601133 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 910601133
		arg_503_1.duration_ = 5

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play910601134(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["1084ui_story"]
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 and arg_503_1.var_.characterEffect1084ui_story == nil then
				arg_503_1.var_.characterEffect1084ui_story = var_506_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_2 = 0.200000002980232

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2

				if arg_503_1.var_.characterEffect1084ui_story then
					local var_506_4 = Mathf.Lerp(0, 0.5, var_506_3)

					arg_503_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_503_1.var_.characterEffect1084ui_story.fillRatio = var_506_4
				end
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 and arg_503_1.var_.characterEffect1084ui_story then
				local var_506_5 = 0.5

				arg_503_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_503_1.var_.characterEffect1084ui_story.fillRatio = var_506_5
			end

			local var_506_6 = 0
			local var_506_7 = 0.775

			if var_506_6 < arg_503_1.time_ and arg_503_1.time_ <= var_506_6 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, false)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_8 = arg_503_1:GetWordFromCfg(910601133)
				local var_506_9 = arg_503_1:FormatText(var_506_8.content)

				arg_503_1.text_.text = var_506_9

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_10 = 31
				local var_506_11 = utf8.len(var_506_9)
				local var_506_12 = var_506_10 <= 0 and var_506_7 or var_506_7 * (var_506_11 / var_506_10)

				if var_506_12 > 0 and var_506_7 < var_506_12 then
					arg_503_1.talkMaxDuration = var_506_12

					if var_506_12 + var_506_6 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_12 + var_506_6
					end
				end

				arg_503_1.text_.text = var_506_9
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)
				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_13 = math.max(var_506_7, arg_503_1.talkMaxDuration)

			if var_506_6 <= arg_503_1.time_ and arg_503_1.time_ < var_506_6 + var_506_13 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_6) / var_506_13

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_6 + var_506_13 and arg_503_1.time_ < var_506_6 + var_506_13 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play910601134 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 910601134
		arg_507_1.duration_ = 6.23

		SetActive(arg_507_1.tipsGo_, false)

		function arg_507_1.onSingleLineFinish_()
			arg_507_1.onSingleLineUpdate_ = nil
			arg_507_1.onSingleLineFinish_ = nil
			arg_507_1.state_ = "waiting"
		end

		function arg_507_1.playNext_(arg_509_0)
			if arg_509_0 == 1 then
				arg_507_0:Play910601135(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1048ui_story"].transform
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 then
				arg_507_1.var_.moveOldPos1048ui_story = var_510_0.localPosition
			end

			local var_510_2 = 0.001

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_2 then
				local var_510_3 = (arg_507_1.time_ - var_510_1) / var_510_2
				local var_510_4 = Vector3.New(0, -0.8, -6.2)

				var_510_0.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos1048ui_story, var_510_4, var_510_3)

				local var_510_5 = manager.ui.mainCamera.transform.position - var_510_0.position

				var_510_0.forward = Vector3.New(var_510_5.x, var_510_5.y, var_510_5.z)

				local var_510_6 = var_510_0.localEulerAngles

				var_510_6.z = 0
				var_510_6.x = 0
				var_510_0.localEulerAngles = var_510_6
			end

			if arg_507_1.time_ >= var_510_1 + var_510_2 and arg_507_1.time_ < var_510_1 + var_510_2 + arg_510_0 then
				var_510_0.localPosition = Vector3.New(0, -0.8, -6.2)

				local var_510_7 = manager.ui.mainCamera.transform.position - var_510_0.position

				var_510_0.forward = Vector3.New(var_510_7.x, var_510_7.y, var_510_7.z)

				local var_510_8 = var_510_0.localEulerAngles

				var_510_8.z = 0
				var_510_8.x = 0
				var_510_0.localEulerAngles = var_510_8
			end

			local var_510_9 = arg_507_1.actors_["1048ui_story"]
			local var_510_10 = 0

			if var_510_10 < arg_507_1.time_ and arg_507_1.time_ <= var_510_10 + arg_510_0 and arg_507_1.var_.characterEffect1048ui_story == nil then
				arg_507_1.var_.characterEffect1048ui_story = var_510_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_11 = 0.200000002980232

			if var_510_10 <= arg_507_1.time_ and arg_507_1.time_ < var_510_10 + var_510_11 then
				local var_510_12 = (arg_507_1.time_ - var_510_10) / var_510_11

				if arg_507_1.var_.characterEffect1048ui_story then
					arg_507_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_507_1.time_ >= var_510_10 + var_510_11 and arg_507_1.time_ < var_510_10 + var_510_11 + arg_510_0 and arg_507_1.var_.characterEffect1048ui_story then
				arg_507_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_510_13 = 0

			if var_510_13 < arg_507_1.time_ and arg_507_1.time_ <= var_510_13 + arg_510_0 then
				arg_507_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action5_1")
			end

			local var_510_14 = 0

			if var_510_14 < arg_507_1.time_ and arg_507_1.time_ <= var_510_14 + arg_510_0 then
				arg_507_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_510_15 = arg_507_1.actors_["1084ui_story"].transform
			local var_510_16 = 0

			if var_510_16 < arg_507_1.time_ and arg_507_1.time_ <= var_510_16 + arg_510_0 then
				arg_507_1.var_.moveOldPos1084ui_story = var_510_15.localPosition
			end

			local var_510_17 = 0.001

			if var_510_16 <= arg_507_1.time_ and arg_507_1.time_ < var_510_16 + var_510_17 then
				local var_510_18 = (arg_507_1.time_ - var_510_16) / var_510_17
				local var_510_19 = Vector3.New(0, 100, 0)

				var_510_15.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos1084ui_story, var_510_19, var_510_18)

				local var_510_20 = manager.ui.mainCamera.transform.position - var_510_15.position

				var_510_15.forward = Vector3.New(var_510_20.x, var_510_20.y, var_510_20.z)

				local var_510_21 = var_510_15.localEulerAngles

				var_510_21.z = 0
				var_510_21.x = 0
				var_510_15.localEulerAngles = var_510_21
			end

			if arg_507_1.time_ >= var_510_16 + var_510_17 and arg_507_1.time_ < var_510_16 + var_510_17 + arg_510_0 then
				var_510_15.localPosition = Vector3.New(0, 100, 0)

				local var_510_22 = manager.ui.mainCamera.transform.position - var_510_15.position

				var_510_15.forward = Vector3.New(var_510_22.x, var_510_22.y, var_510_22.z)

				local var_510_23 = var_510_15.localEulerAngles

				var_510_23.z = 0
				var_510_23.x = 0
				var_510_15.localEulerAngles = var_510_23
			end

			local var_510_24 = arg_507_1.actors_["1084ui_story"]
			local var_510_25 = 0

			if var_510_25 < arg_507_1.time_ and arg_507_1.time_ <= var_510_25 + arg_510_0 and arg_507_1.var_.characterEffect1084ui_story == nil then
				arg_507_1.var_.characterEffect1084ui_story = var_510_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_510_26 = 0.200000002980232

			if var_510_25 <= arg_507_1.time_ and arg_507_1.time_ < var_510_25 + var_510_26 then
				local var_510_27 = (arg_507_1.time_ - var_510_25) / var_510_26

				if arg_507_1.var_.characterEffect1084ui_story then
					local var_510_28 = Mathf.Lerp(0, 0.5, var_510_27)

					arg_507_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_507_1.var_.characterEffect1084ui_story.fillRatio = var_510_28
				end
			end

			if arg_507_1.time_ >= var_510_25 + var_510_26 and arg_507_1.time_ < var_510_25 + var_510_26 + arg_510_0 and arg_507_1.var_.characterEffect1084ui_story then
				local var_510_29 = 0.5

				arg_507_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_507_1.var_.characterEffect1084ui_story.fillRatio = var_510_29
			end

			local var_510_30 = 0
			local var_510_31 = 0.8

			if var_510_30 < arg_507_1.time_ and arg_507_1.time_ <= var_510_30 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_32 = arg_507_1:FormatText(StoryNameCfg[8].name)

				arg_507_1.leftNameTxt_.text = var_510_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_33 = arg_507_1:GetWordFromCfg(910601134)
				local var_510_34 = arg_507_1:FormatText(var_510_33.content)

				arg_507_1.text_.text = var_510_34

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_35 = 32
				local var_510_36 = utf8.len(var_510_34)
				local var_510_37 = var_510_35 <= 0 and var_510_31 or var_510_31 * (var_510_36 / var_510_35)

				if var_510_37 > 0 and var_510_31 < var_510_37 then
					arg_507_1.talkMaxDuration = var_510_37

					if var_510_37 + var_510_30 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_37 + var_510_30
					end
				end

				arg_507_1.text_.text = var_510_34
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601134", "story_v_out_910601.awb") ~= 0 then
					local var_510_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601134", "story_v_out_910601.awb") / 1000

					if var_510_38 + var_510_30 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_38 + var_510_30
					end

					if var_510_33.prefab_name ~= "" and arg_507_1.actors_[var_510_33.prefab_name] ~= nil then
						local var_510_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_33.prefab_name].transform, "story_v_out_910601", "910601134", "story_v_out_910601.awb")

						arg_507_1:RecordAudio("910601134", var_510_39)
						arg_507_1:RecordAudio("910601134", var_510_39)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_910601", "910601134", "story_v_out_910601.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_910601", "910601134", "story_v_out_910601.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_40 = math.max(var_510_31, arg_507_1.talkMaxDuration)

			if var_510_30 <= arg_507_1.time_ and arg_507_1.time_ < var_510_30 + var_510_40 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_30) / var_510_40

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_30 + var_510_40 and arg_507_1.time_ < var_510_30 + var_510_40 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play910601135 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 910601135
		arg_511_1.duration_ = 5

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play910601136(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1048ui_story"]
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 and arg_511_1.var_.characterEffect1048ui_story == nil then
				arg_511_1.var_.characterEffect1048ui_story = var_514_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_514_2 = 0.200000002980232

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_2 then
				local var_514_3 = (arg_511_1.time_ - var_514_1) / var_514_2

				if arg_511_1.var_.characterEffect1048ui_story then
					local var_514_4 = Mathf.Lerp(0, 0.5, var_514_3)

					arg_511_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_511_1.var_.characterEffect1048ui_story.fillRatio = var_514_4
				end
			end

			if arg_511_1.time_ >= var_514_1 + var_514_2 and arg_511_1.time_ < var_514_1 + var_514_2 + arg_514_0 and arg_511_1.var_.characterEffect1048ui_story then
				local var_514_5 = 0.5

				arg_511_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_511_1.var_.characterEffect1048ui_story.fillRatio = var_514_5
			end

			local var_514_6 = 0
			local var_514_7 = 0.15

			if var_514_6 < arg_511_1.time_ and arg_511_1.time_ <= var_514_6 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_8 = arg_511_1:FormatText(StoryNameCfg[7].name)

				arg_511_1.leftNameTxt_.text = var_514_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_9 = arg_511_1:GetWordFromCfg(910601135)
				local var_514_10 = arg_511_1:FormatText(var_514_9.content)

				arg_511_1.text_.text = var_514_10

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_11 = 6
				local var_514_12 = utf8.len(var_514_10)
				local var_514_13 = var_514_11 <= 0 and var_514_7 or var_514_7 * (var_514_12 / var_514_11)

				if var_514_13 > 0 and var_514_7 < var_514_13 then
					arg_511_1.talkMaxDuration = var_514_13

					if var_514_13 + var_514_6 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_13 + var_514_6
					end
				end

				arg_511_1.text_.text = var_514_10
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)
				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_14 = math.max(var_514_7, arg_511_1.talkMaxDuration)

			if var_514_6 <= arg_511_1.time_ and arg_511_1.time_ < var_514_6 + var_514_14 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_6) / var_514_14

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_6 + var_514_14 and arg_511_1.time_ < var_514_6 + var_514_14 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play910601136 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 910601136
		arg_515_1.duration_ = 5

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play910601137(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["1048ui_story"].transform
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 then
				arg_515_1.var_.moveOldPos1048ui_story = var_518_0.localPosition
			end

			local var_518_2 = 0.001

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2
				local var_518_4 = Vector3.New(0, 100, 0)

				var_518_0.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos1048ui_story, var_518_4, var_518_3)

				local var_518_5 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_5.x, var_518_5.y, var_518_5.z)

				local var_518_6 = var_518_0.localEulerAngles

				var_518_6.z = 0
				var_518_6.x = 0
				var_518_0.localEulerAngles = var_518_6
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 then
				var_518_0.localPosition = Vector3.New(0, 100, 0)

				local var_518_7 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_7.x, var_518_7.y, var_518_7.z)

				local var_518_8 = var_518_0.localEulerAngles

				var_518_8.z = 0
				var_518_8.x = 0
				var_518_0.localEulerAngles = var_518_8
			end

			local var_518_9 = 0
			local var_518_10 = 0.125

			if var_518_9 < arg_515_1.time_ and arg_515_1.time_ <= var_518_9 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, false)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_11 = arg_515_1:GetWordFromCfg(910601136)
				local var_518_12 = arg_515_1:FormatText(var_518_11.content)

				arg_515_1.text_.text = var_518_12

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_13 = 5
				local var_518_14 = utf8.len(var_518_12)
				local var_518_15 = var_518_13 <= 0 and var_518_10 or var_518_10 * (var_518_14 / var_518_13)

				if var_518_15 > 0 and var_518_10 < var_518_15 then
					arg_515_1.talkMaxDuration = var_518_15

					if var_518_15 + var_518_9 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_15 + var_518_9
					end
				end

				arg_515_1.text_.text = var_518_12
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)
				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_16 = math.max(var_518_10, arg_515_1.talkMaxDuration)

			if var_518_9 <= arg_515_1.time_ and arg_515_1.time_ < var_518_9 + var_518_16 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_9) / var_518_16

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_9 + var_518_16 and arg_515_1.time_ < var_518_9 + var_518_16 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play910601137 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 910601137
		arg_519_1.duration_ = 6.67

		SetActive(arg_519_1.tipsGo_, false)

		function arg_519_1.onSingleLineFinish_()
			arg_519_1.onSingleLineUpdate_ = nil
			arg_519_1.onSingleLineFinish_ = nil
			arg_519_1.state_ = "waiting"
		end

		function arg_519_1.playNext_(arg_521_0)
			if arg_521_0 == 1 then
				arg_519_0:Play910601138(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["1084ui_story"].transform
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 then
				arg_519_1.var_.moveOldPos1084ui_story = var_522_0.localPosition
			end

			local var_522_2 = 0.001

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_2 then
				local var_522_3 = (arg_519_1.time_ - var_522_1) / var_522_2
				local var_522_4 = Vector3.New(0, -0.97, -6)

				var_522_0.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos1084ui_story, var_522_4, var_522_3)

				local var_522_5 = manager.ui.mainCamera.transform.position - var_522_0.position

				var_522_0.forward = Vector3.New(var_522_5.x, var_522_5.y, var_522_5.z)

				local var_522_6 = var_522_0.localEulerAngles

				var_522_6.z = 0
				var_522_6.x = 0
				var_522_0.localEulerAngles = var_522_6
			end

			if arg_519_1.time_ >= var_522_1 + var_522_2 and arg_519_1.time_ < var_522_1 + var_522_2 + arg_522_0 then
				var_522_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_522_7 = manager.ui.mainCamera.transform.position - var_522_0.position

				var_522_0.forward = Vector3.New(var_522_7.x, var_522_7.y, var_522_7.z)

				local var_522_8 = var_522_0.localEulerAngles

				var_522_8.z = 0
				var_522_8.x = 0
				var_522_0.localEulerAngles = var_522_8
			end

			local var_522_9 = arg_519_1.actors_["1084ui_story"]
			local var_522_10 = 0

			if var_522_10 < arg_519_1.time_ and arg_519_1.time_ <= var_522_10 + arg_522_0 and arg_519_1.var_.characterEffect1084ui_story == nil then
				arg_519_1.var_.characterEffect1084ui_story = var_522_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_522_11 = 0.200000002980232

			if var_522_10 <= arg_519_1.time_ and arg_519_1.time_ < var_522_10 + var_522_11 then
				local var_522_12 = (arg_519_1.time_ - var_522_10) / var_522_11

				if arg_519_1.var_.characterEffect1084ui_story then
					arg_519_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_519_1.time_ >= var_522_10 + var_522_11 and arg_519_1.time_ < var_522_10 + var_522_11 + arg_522_0 and arg_519_1.var_.characterEffect1084ui_story then
				arg_519_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_522_13 = 0

			if var_522_13 < arg_519_1.time_ and arg_519_1.time_ <= var_522_13 + arg_522_0 then
				arg_519_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_522_14 = 0

			if var_522_14 < arg_519_1.time_ and arg_519_1.time_ <= var_522_14 + arg_522_0 then
				arg_519_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_522_15 = 0
			local var_522_16 = 0.7

			if var_522_15 < arg_519_1.time_ and arg_519_1.time_ <= var_522_15 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_17 = arg_519_1:FormatText(StoryNameCfg[6].name)

				arg_519_1.leftNameTxt_.text = var_522_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_18 = arg_519_1:GetWordFromCfg(910601137)
				local var_522_19 = arg_519_1:FormatText(var_522_18.content)

				arg_519_1.text_.text = var_522_19

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_20 = 28
				local var_522_21 = utf8.len(var_522_19)
				local var_522_22 = var_522_20 <= 0 and var_522_16 or var_522_16 * (var_522_21 / var_522_20)

				if var_522_22 > 0 and var_522_16 < var_522_22 then
					arg_519_1.talkMaxDuration = var_522_22

					if var_522_22 + var_522_15 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_22 + var_522_15
					end
				end

				arg_519_1.text_.text = var_522_19
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601137", "story_v_out_910601.awb") ~= 0 then
					local var_522_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601137", "story_v_out_910601.awb") / 1000

					if var_522_23 + var_522_15 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_23 + var_522_15
					end

					if var_522_18.prefab_name ~= "" and arg_519_1.actors_[var_522_18.prefab_name] ~= nil then
						local var_522_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_18.prefab_name].transform, "story_v_out_910601", "910601137", "story_v_out_910601.awb")

						arg_519_1:RecordAudio("910601137", var_522_24)
						arg_519_1:RecordAudio("910601137", var_522_24)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_910601", "910601137", "story_v_out_910601.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_910601", "910601137", "story_v_out_910601.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_25 = math.max(var_522_16, arg_519_1.talkMaxDuration)

			if var_522_15 <= arg_519_1.time_ and arg_519_1.time_ < var_522_15 + var_522_25 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_15) / var_522_25

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_15 + var_522_25 and arg_519_1.time_ < var_522_15 + var_522_25 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play910601138 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 910601138
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play910601139(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["1084ui_story"]
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 and arg_523_1.var_.characterEffect1084ui_story == nil then
				arg_523_1.var_.characterEffect1084ui_story = var_526_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_526_2 = 0.200000002980232

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2

				if arg_523_1.var_.characterEffect1084ui_story then
					local var_526_4 = Mathf.Lerp(0, 0.5, var_526_3)

					arg_523_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_523_1.var_.characterEffect1084ui_story.fillRatio = var_526_4
				end
			end

			if arg_523_1.time_ >= var_526_1 + var_526_2 and arg_523_1.time_ < var_526_1 + var_526_2 + arg_526_0 and arg_523_1.var_.characterEffect1084ui_story then
				local var_526_5 = 0.5

				arg_523_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_523_1.var_.characterEffect1084ui_story.fillRatio = var_526_5
			end

			local var_526_6 = 0
			local var_526_7 = 0.35

			if var_526_6 < arg_523_1.time_ and arg_523_1.time_ <= var_526_6 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, true)

				local var_526_8 = arg_523_1:FormatText(StoryNameCfg[7].name)

				arg_523_1.leftNameTxt_.text = var_526_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_523_1.leftNameTxt_.transform)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1.leftNameTxt_.text)
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_9 = arg_523_1:GetWordFromCfg(910601138)
				local var_526_10 = arg_523_1:FormatText(var_526_9.content)

				arg_523_1.text_.text = var_526_10

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_11 = 14
				local var_526_12 = utf8.len(var_526_10)
				local var_526_13 = var_526_11 <= 0 and var_526_7 or var_526_7 * (var_526_12 / var_526_11)

				if var_526_13 > 0 and var_526_7 < var_526_13 then
					arg_523_1.talkMaxDuration = var_526_13

					if var_526_13 + var_526_6 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_13 + var_526_6
					end
				end

				arg_523_1.text_.text = var_526_10
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_14 = math.max(var_526_7, arg_523_1.talkMaxDuration)

			if var_526_6 <= arg_523_1.time_ and arg_523_1.time_ < var_526_6 + var_526_14 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_6) / var_526_14

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_6 + var_526_14 and arg_523_1.time_ < var_526_6 + var_526_14 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play910601139 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 910601139
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play910601140(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = arg_527_1.actors_["1084ui_story"]
			local var_530_1 = 0

			if var_530_1 < arg_527_1.time_ and arg_527_1.time_ <= var_530_1 + arg_530_0 and arg_527_1.var_.characterEffect1084ui_story == nil then
				arg_527_1.var_.characterEffect1084ui_story = var_530_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_530_2 = 0.200000002980232

			if var_530_1 <= arg_527_1.time_ and arg_527_1.time_ < var_530_1 + var_530_2 then
				local var_530_3 = (arg_527_1.time_ - var_530_1) / var_530_2

				if arg_527_1.var_.characterEffect1084ui_story then
					local var_530_4 = Mathf.Lerp(0, 0.5, var_530_3)

					arg_527_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_527_1.var_.characterEffect1084ui_story.fillRatio = var_530_4
				end
			end

			if arg_527_1.time_ >= var_530_1 + var_530_2 and arg_527_1.time_ < var_530_1 + var_530_2 + arg_530_0 and arg_527_1.var_.characterEffect1084ui_story then
				local var_530_5 = 0.5

				arg_527_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_527_1.var_.characterEffect1084ui_story.fillRatio = var_530_5
			end

			local var_530_6 = 0
			local var_530_7 = 0.575

			if var_530_6 < arg_527_1.time_ and arg_527_1.time_ <= var_530_6 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_8 = arg_527_1:FormatText(StoryNameCfg[7].name)

				arg_527_1.leftNameTxt_.text = var_530_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_9 = arg_527_1:GetWordFromCfg(910601139)
				local var_530_10 = arg_527_1:FormatText(var_530_9.content)

				arg_527_1.text_.text = var_530_10

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_11 = 21
				local var_530_12 = utf8.len(var_530_10)
				local var_530_13 = var_530_11 <= 0 and var_530_7 or var_530_7 * (var_530_12 / var_530_11)

				if var_530_13 > 0 and var_530_7 < var_530_13 then
					arg_527_1.talkMaxDuration = var_530_13

					if var_530_13 + var_530_6 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_13 + var_530_6
					end
				end

				arg_527_1.text_.text = var_530_10
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)
				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_14 = math.max(var_530_7, arg_527_1.talkMaxDuration)

			if var_530_6 <= arg_527_1.time_ and arg_527_1.time_ < var_530_6 + var_530_14 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_6) / var_530_14

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_6 + var_530_14 and arg_527_1.time_ < var_530_6 + var_530_14 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play910601140 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 910601140
		arg_531_1.duration_ = 5

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play910601141(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = 0
			local var_534_1 = 0.35

			if var_534_0 < arg_531_1.time_ and arg_531_1.time_ <= var_534_0 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_2 = arg_531_1:FormatText(StoryNameCfg[7].name)

				arg_531_1.leftNameTxt_.text = var_534_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_3 = arg_531_1:GetWordFromCfg(910601140)
				local var_534_4 = arg_531_1:FormatText(var_534_3.content)

				arg_531_1.text_.text = var_534_4

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_5 = 14
				local var_534_6 = utf8.len(var_534_4)
				local var_534_7 = var_534_5 <= 0 and var_534_1 or var_534_1 * (var_534_6 / var_534_5)

				if var_534_7 > 0 and var_534_1 < var_534_7 then
					arg_531_1.talkMaxDuration = var_534_7

					if var_534_7 + var_534_0 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_7 + var_534_0
					end
				end

				arg_531_1.text_.text = var_534_4
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)
				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_8 = math.max(var_534_1, arg_531_1.talkMaxDuration)

			if var_534_0 <= arg_531_1.time_ and arg_531_1.time_ < var_534_0 + var_534_8 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_0) / var_534_8

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_0 + var_534_8 and arg_531_1.time_ < var_534_0 + var_534_8 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play910601141 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 910601141
		arg_535_1.duration_ = 2

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play910601142(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1084ui_story"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 and arg_535_1.var_.characterEffect1084ui_story == nil then
				arg_535_1.var_.characterEffect1084ui_story = var_538_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_2 = 0.200000002980232

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

			if var_538_6 < arg_535_1.time_ and arg_535_1.time_ <= var_538_6 + arg_538_0 then
				arg_535_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_538_7 = 0
			local var_538_8 = 0.05

			if var_538_7 < arg_535_1.time_ and arg_535_1.time_ <= var_538_7 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_9 = arg_535_1:FormatText(StoryNameCfg[6].name)

				arg_535_1.leftNameTxt_.text = var_538_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_10 = arg_535_1:GetWordFromCfg(910601141)
				local var_538_11 = arg_535_1:FormatText(var_538_10.content)

				arg_535_1.text_.text = var_538_11

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_12 = 2
				local var_538_13 = utf8.len(var_538_11)
				local var_538_14 = var_538_12 <= 0 and var_538_8 or var_538_8 * (var_538_13 / var_538_12)

				if var_538_14 > 0 and var_538_8 < var_538_14 then
					arg_535_1.talkMaxDuration = var_538_14

					if var_538_14 + var_538_7 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_14 + var_538_7
					end
				end

				arg_535_1.text_.text = var_538_11
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601141", "story_v_out_910601.awb") ~= 0 then
					local var_538_15 = manager.audio:GetVoiceLength("story_v_out_910601", "910601141", "story_v_out_910601.awb") / 1000

					if var_538_15 + var_538_7 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_15 + var_538_7
					end

					if var_538_10.prefab_name ~= "" and arg_535_1.actors_[var_538_10.prefab_name] ~= nil then
						local var_538_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_10.prefab_name].transform, "story_v_out_910601", "910601141", "story_v_out_910601.awb")

						arg_535_1:RecordAudio("910601141", var_538_16)
						arg_535_1:RecordAudio("910601141", var_538_16)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_out_910601", "910601141", "story_v_out_910601.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_out_910601", "910601141", "story_v_out_910601.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_17 = math.max(var_538_8, arg_535_1.talkMaxDuration)

			if var_538_7 <= arg_535_1.time_ and arg_535_1.time_ < var_538_7 + var_538_17 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_7) / var_538_17

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_7 + var_538_17 and arg_535_1.time_ < var_538_7 + var_538_17 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play910601142 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 910601142
		arg_539_1.duration_ = 5

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play910601143(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["1084ui_story"].transform
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 then
				arg_539_1.var_.moveOldPos1084ui_story = var_542_0.localPosition
			end

			local var_542_2 = 0.001

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2
				local var_542_4 = Vector3.New(0, 100, 0)

				var_542_0.localPosition = Vector3.Lerp(arg_539_1.var_.moveOldPos1084ui_story, var_542_4, var_542_3)

				local var_542_5 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_5.x, var_542_5.y, var_542_5.z)

				local var_542_6 = var_542_0.localEulerAngles

				var_542_6.z = 0
				var_542_6.x = 0
				var_542_0.localEulerAngles = var_542_6
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 then
				var_542_0.localPosition = Vector3.New(0, 100, 0)

				local var_542_7 = manager.ui.mainCamera.transform.position - var_542_0.position

				var_542_0.forward = Vector3.New(var_542_7.x, var_542_7.y, var_542_7.z)

				local var_542_8 = var_542_0.localEulerAngles

				var_542_8.z = 0
				var_542_8.x = 0
				var_542_0.localEulerAngles = var_542_8
			end

			local var_542_9 = 0
			local var_542_10 = 1.35

			if var_542_9 < arg_539_1.time_ and arg_539_1.time_ <= var_542_9 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, false)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_11 = arg_539_1:GetWordFromCfg(910601142)
				local var_542_12 = arg_539_1:FormatText(var_542_11.content)

				arg_539_1.text_.text = var_542_12

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_13 = 54
				local var_542_14 = utf8.len(var_542_12)
				local var_542_15 = var_542_13 <= 0 and var_542_10 or var_542_10 * (var_542_14 / var_542_13)

				if var_542_15 > 0 and var_542_10 < var_542_15 then
					arg_539_1.talkMaxDuration = var_542_15

					if var_542_15 + var_542_9 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_15 + var_542_9
					end
				end

				arg_539_1.text_.text = var_542_12
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)
				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_16 = math.max(var_542_10, arg_539_1.talkMaxDuration)

			if var_542_9 <= arg_539_1.time_ and arg_539_1.time_ < var_542_9 + var_542_16 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_9) / var_542_16

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_9 + var_542_16 and arg_539_1.time_ < var_542_9 + var_542_16 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play910601143 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 910601143
		arg_543_1.duration_ = 4.83

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play910601144(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["1084ui_story"].transform
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 then
				arg_543_1.var_.moveOldPos1084ui_story = var_546_0.localPosition
			end

			local var_546_2 = 0.001

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_2 then
				local var_546_3 = (arg_543_1.time_ - var_546_1) / var_546_2
				local var_546_4 = Vector3.New(0, -0.97, -6)

				var_546_0.localPosition = Vector3.Lerp(arg_543_1.var_.moveOldPos1084ui_story, var_546_4, var_546_3)

				local var_546_5 = manager.ui.mainCamera.transform.position - var_546_0.position

				var_546_0.forward = Vector3.New(var_546_5.x, var_546_5.y, var_546_5.z)

				local var_546_6 = var_546_0.localEulerAngles

				var_546_6.z = 0
				var_546_6.x = 0
				var_546_0.localEulerAngles = var_546_6
			end

			if arg_543_1.time_ >= var_546_1 + var_546_2 and arg_543_1.time_ < var_546_1 + var_546_2 + arg_546_0 then
				var_546_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_546_7 = manager.ui.mainCamera.transform.position - var_546_0.position

				var_546_0.forward = Vector3.New(var_546_7.x, var_546_7.y, var_546_7.z)

				local var_546_8 = var_546_0.localEulerAngles

				var_546_8.z = 0
				var_546_8.x = 0
				var_546_0.localEulerAngles = var_546_8
			end

			local var_546_9 = 0

			if var_546_9 < arg_543_1.time_ and arg_543_1.time_ <= var_546_9 + arg_546_0 then
				arg_543_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_546_10 = 0

			if var_546_10 < arg_543_1.time_ and arg_543_1.time_ <= var_546_10 + arg_546_0 then
				arg_543_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_546_11 = arg_543_1.actors_["1084ui_story"]
			local var_546_12 = 0

			if var_546_12 < arg_543_1.time_ and arg_543_1.time_ <= var_546_12 + arg_546_0 and arg_543_1.var_.characterEffect1084ui_story == nil then
				arg_543_1.var_.characterEffect1084ui_story = var_546_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_546_13 = 0.200000002980232

			if var_546_12 <= arg_543_1.time_ and arg_543_1.time_ < var_546_12 + var_546_13 then
				local var_546_14 = (arg_543_1.time_ - var_546_12) / var_546_13

				if arg_543_1.var_.characterEffect1084ui_story then
					arg_543_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_543_1.time_ >= var_546_12 + var_546_13 and arg_543_1.time_ < var_546_12 + var_546_13 + arg_546_0 and arg_543_1.var_.characterEffect1084ui_story then
				arg_543_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_546_15 = 0
			local var_546_16 = 0.5

			if var_546_15 < arg_543_1.time_ and arg_543_1.time_ <= var_546_15 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_17 = arg_543_1:FormatText(StoryNameCfg[6].name)

				arg_543_1.leftNameTxt_.text = var_546_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_18 = arg_543_1:GetWordFromCfg(910601143)
				local var_546_19 = arg_543_1:FormatText(var_546_18.content)

				arg_543_1.text_.text = var_546_19

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_20 = 20
				local var_546_21 = utf8.len(var_546_19)
				local var_546_22 = var_546_20 <= 0 and var_546_16 or var_546_16 * (var_546_21 / var_546_20)

				if var_546_22 > 0 and var_546_16 < var_546_22 then
					arg_543_1.talkMaxDuration = var_546_22

					if var_546_22 + var_546_15 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_22 + var_546_15
					end
				end

				arg_543_1.text_.text = var_546_19
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601143", "story_v_out_910601.awb") ~= 0 then
					local var_546_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601143", "story_v_out_910601.awb") / 1000

					if var_546_23 + var_546_15 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_23 + var_546_15
					end

					if var_546_18.prefab_name ~= "" and arg_543_1.actors_[var_546_18.prefab_name] ~= nil then
						local var_546_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_543_1.actors_[var_546_18.prefab_name].transform, "story_v_out_910601", "910601143", "story_v_out_910601.awb")

						arg_543_1:RecordAudio("910601143", var_546_24)
						arg_543_1:RecordAudio("910601143", var_546_24)
					else
						arg_543_1:AudioAction("play", "voice", "story_v_out_910601", "910601143", "story_v_out_910601.awb")
					end

					arg_543_1:RecordHistoryTalkVoice("story_v_out_910601", "910601143", "story_v_out_910601.awb")
				end

				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_25 = math.max(var_546_16, arg_543_1.talkMaxDuration)

			if var_546_15 <= arg_543_1.time_ and arg_543_1.time_ < var_546_15 + var_546_25 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_15) / var_546_25

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_15 + var_546_25 and arg_543_1.time_ < var_546_15 + var_546_25 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play910601144 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 910601144
		arg_547_1.duration_ = 5

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play910601145(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = arg_547_1.actors_["1084ui_story"]
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 and arg_547_1.var_.characterEffect1084ui_story == nil then
				arg_547_1.var_.characterEffect1084ui_story = var_550_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_550_2 = 0.200000002980232

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_2 then
				local var_550_3 = (arg_547_1.time_ - var_550_1) / var_550_2

				if arg_547_1.var_.characterEffect1084ui_story then
					local var_550_4 = Mathf.Lerp(0, 0.5, var_550_3)

					arg_547_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_547_1.var_.characterEffect1084ui_story.fillRatio = var_550_4
				end
			end

			if arg_547_1.time_ >= var_550_1 + var_550_2 and arg_547_1.time_ < var_550_1 + var_550_2 + arg_550_0 and arg_547_1.var_.characterEffect1084ui_story then
				local var_550_5 = 0.5

				arg_547_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_547_1.var_.characterEffect1084ui_story.fillRatio = var_550_5
			end

			local var_550_6 = 0
			local var_550_7 = 0.175

			if var_550_6 < arg_547_1.time_ and arg_547_1.time_ <= var_550_6 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_8 = arg_547_1:FormatText(StoryNameCfg[7].name)

				arg_547_1.leftNameTxt_.text = var_550_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_9 = arg_547_1:GetWordFromCfg(910601144)
				local var_550_10 = arg_547_1:FormatText(var_550_9.content)

				arg_547_1.text_.text = var_550_10

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_11 = 7
				local var_550_12 = utf8.len(var_550_10)
				local var_550_13 = var_550_11 <= 0 and var_550_7 or var_550_7 * (var_550_12 / var_550_11)

				if var_550_13 > 0 and var_550_7 < var_550_13 then
					arg_547_1.talkMaxDuration = var_550_13

					if var_550_13 + var_550_6 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_13 + var_550_6
					end
				end

				arg_547_1.text_.text = var_550_10
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)
				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_14 = math.max(var_550_7, arg_547_1.talkMaxDuration)

			if var_550_6 <= arg_547_1.time_ and arg_547_1.time_ < var_550_6 + var_550_14 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_6) / var_550_14

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_6 + var_550_14 and arg_547_1.time_ < var_550_6 + var_550_14 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play910601145 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 910601145
		arg_551_1.duration_ = 3.1

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play910601146(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["1011ui_story"].transform
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 then
				arg_551_1.var_.moveOldPos1011ui_story = var_554_0.localPosition
			end

			local var_554_2 = 0.001

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2
				local var_554_4 = Vector3.New(0.7, -0.71, -6)

				var_554_0.localPosition = Vector3.Lerp(arg_551_1.var_.moveOldPos1011ui_story, var_554_4, var_554_3)

				local var_554_5 = manager.ui.mainCamera.transform.position - var_554_0.position

				var_554_0.forward = Vector3.New(var_554_5.x, var_554_5.y, var_554_5.z)

				local var_554_6 = var_554_0.localEulerAngles

				var_554_6.z = 0
				var_554_6.x = 0
				var_554_0.localEulerAngles = var_554_6
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 then
				var_554_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_554_7 = manager.ui.mainCamera.transform.position - var_554_0.position

				var_554_0.forward = Vector3.New(var_554_7.x, var_554_7.y, var_554_7.z)

				local var_554_8 = var_554_0.localEulerAngles

				var_554_8.z = 0
				var_554_8.x = 0
				var_554_0.localEulerAngles = var_554_8
			end

			local var_554_9 = arg_551_1.actors_["1011ui_story"]
			local var_554_10 = 0

			if var_554_10 < arg_551_1.time_ and arg_551_1.time_ <= var_554_10 + arg_554_0 and arg_551_1.var_.characterEffect1011ui_story == nil then
				arg_551_1.var_.characterEffect1011ui_story = var_554_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_11 = 0.200000002980232

			if var_554_10 <= arg_551_1.time_ and arg_551_1.time_ < var_554_10 + var_554_11 then
				local var_554_12 = (arg_551_1.time_ - var_554_10) / var_554_11

				if arg_551_1.var_.characterEffect1011ui_story then
					arg_551_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_551_1.time_ >= var_554_10 + var_554_11 and arg_551_1.time_ < var_554_10 + var_554_11 + arg_554_0 and arg_551_1.var_.characterEffect1011ui_story then
				arg_551_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_554_13 = 0

			if var_554_13 < arg_551_1.time_ and arg_551_1.time_ <= var_554_13 + arg_554_0 then
				arg_551_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_1")
			end

			local var_554_14 = 0

			if var_554_14 < arg_551_1.time_ and arg_551_1.time_ <= var_554_14 + arg_554_0 then
				arg_551_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_554_15 = arg_551_1.actors_["1084ui_story"].transform
			local var_554_16 = 0

			if var_554_16 < arg_551_1.time_ and arg_551_1.time_ <= var_554_16 + arg_554_0 then
				arg_551_1.var_.moveOldPos1084ui_story = var_554_15.localPosition
			end

			local var_554_17 = 0.001

			if var_554_16 <= arg_551_1.time_ and arg_551_1.time_ < var_554_16 + var_554_17 then
				local var_554_18 = (arg_551_1.time_ - var_554_16) / var_554_17
				local var_554_19 = Vector3.New(-0.7, -0.97, -6)

				var_554_15.localPosition = Vector3.Lerp(arg_551_1.var_.moveOldPos1084ui_story, var_554_19, var_554_18)

				local var_554_20 = manager.ui.mainCamera.transform.position - var_554_15.position

				var_554_15.forward = Vector3.New(var_554_20.x, var_554_20.y, var_554_20.z)

				local var_554_21 = var_554_15.localEulerAngles

				var_554_21.z = 0
				var_554_21.x = 0
				var_554_15.localEulerAngles = var_554_21
			end

			if arg_551_1.time_ >= var_554_16 + var_554_17 and arg_551_1.time_ < var_554_16 + var_554_17 + arg_554_0 then
				var_554_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_554_22 = manager.ui.mainCamera.transform.position - var_554_15.position

				var_554_15.forward = Vector3.New(var_554_22.x, var_554_22.y, var_554_22.z)

				local var_554_23 = var_554_15.localEulerAngles

				var_554_23.z = 0
				var_554_23.x = 0
				var_554_15.localEulerAngles = var_554_23
			end

			local var_554_24 = arg_551_1.actors_["1084ui_story"]
			local var_554_25 = 0

			if var_554_25 < arg_551_1.time_ and arg_551_1.time_ <= var_554_25 + arg_554_0 and arg_551_1.var_.characterEffect1084ui_story == nil then
				arg_551_1.var_.characterEffect1084ui_story = var_554_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_26 = 0.200000002980232

			if var_554_25 <= arg_551_1.time_ and arg_551_1.time_ < var_554_25 + var_554_26 then
				local var_554_27 = (arg_551_1.time_ - var_554_25) / var_554_26

				if arg_551_1.var_.characterEffect1084ui_story then
					local var_554_28 = Mathf.Lerp(0, 0.5, var_554_27)

					arg_551_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_551_1.var_.characterEffect1084ui_story.fillRatio = var_554_28
				end
			end

			if arg_551_1.time_ >= var_554_25 + var_554_26 and arg_551_1.time_ < var_554_25 + var_554_26 + arg_554_0 and arg_551_1.var_.characterEffect1084ui_story then
				local var_554_29 = 0.5

				arg_551_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_551_1.var_.characterEffect1084ui_story.fillRatio = var_554_29
			end

			local var_554_30 = 0
			local var_554_31 = 0.3

			if var_554_30 < arg_551_1.time_ and arg_551_1.time_ <= var_554_30 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_32 = arg_551_1:FormatText(StoryNameCfg[37].name)

				arg_551_1.leftNameTxt_.text = var_554_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_33 = arg_551_1:GetWordFromCfg(910601145)
				local var_554_34 = arg_551_1:FormatText(var_554_33.content)

				arg_551_1.text_.text = var_554_34

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_35 = 12
				local var_554_36 = utf8.len(var_554_34)
				local var_554_37 = var_554_35 <= 0 and var_554_31 or var_554_31 * (var_554_36 / var_554_35)

				if var_554_37 > 0 and var_554_31 < var_554_37 then
					arg_551_1.talkMaxDuration = var_554_37

					if var_554_37 + var_554_30 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_37 + var_554_30
					end
				end

				arg_551_1.text_.text = var_554_34
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601145", "story_v_out_910601.awb") ~= 0 then
					local var_554_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601145", "story_v_out_910601.awb") / 1000

					if var_554_38 + var_554_30 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_38 + var_554_30
					end

					if var_554_33.prefab_name ~= "" and arg_551_1.actors_[var_554_33.prefab_name] ~= nil then
						local var_554_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_33.prefab_name].transform, "story_v_out_910601", "910601145", "story_v_out_910601.awb")

						arg_551_1:RecordAudio("910601145", var_554_39)
						arg_551_1:RecordAudio("910601145", var_554_39)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_out_910601", "910601145", "story_v_out_910601.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_out_910601", "910601145", "story_v_out_910601.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_40 = math.max(var_554_31, arg_551_1.talkMaxDuration)

			if var_554_30 <= arg_551_1.time_ and arg_551_1.time_ < var_554_30 + var_554_40 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_30) / var_554_40

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_30 + var_554_40 and arg_551_1.time_ < var_554_30 + var_554_40 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play910601146 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 910601146
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play910601147(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = arg_555_1.actors_["1011ui_story"]
			local var_558_1 = 0

			if var_558_1 < arg_555_1.time_ and arg_555_1.time_ <= var_558_1 + arg_558_0 and arg_555_1.var_.characterEffect1011ui_story == nil then
				arg_555_1.var_.characterEffect1011ui_story = var_558_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_558_2 = 0.200000002980232

			if var_558_1 <= arg_555_1.time_ and arg_555_1.time_ < var_558_1 + var_558_2 then
				local var_558_3 = (arg_555_1.time_ - var_558_1) / var_558_2

				if arg_555_1.var_.characterEffect1011ui_story then
					local var_558_4 = Mathf.Lerp(0, 0.5, var_558_3)

					arg_555_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_555_1.var_.characterEffect1011ui_story.fillRatio = var_558_4
				end
			end

			if arg_555_1.time_ >= var_558_1 + var_558_2 and arg_555_1.time_ < var_558_1 + var_558_2 + arg_558_0 and arg_555_1.var_.characterEffect1011ui_story then
				local var_558_5 = 0.5

				arg_555_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_555_1.var_.characterEffect1011ui_story.fillRatio = var_558_5
			end

			local var_558_6 = arg_555_1.actors_["1084ui_story"].transform
			local var_558_7 = 0

			if var_558_7 < arg_555_1.time_ and arg_555_1.time_ <= var_558_7 + arg_558_0 then
				arg_555_1.var_.moveOldPos1084ui_story = var_558_6.localPosition
			end

			local var_558_8 = 0.001

			if var_558_7 <= arg_555_1.time_ and arg_555_1.time_ < var_558_7 + var_558_8 then
				local var_558_9 = (arg_555_1.time_ - var_558_7) / var_558_8
				local var_558_10 = Vector3.New(0, 100, 0)

				var_558_6.localPosition = Vector3.Lerp(arg_555_1.var_.moveOldPos1084ui_story, var_558_10, var_558_9)

				local var_558_11 = manager.ui.mainCamera.transform.position - var_558_6.position

				var_558_6.forward = Vector3.New(var_558_11.x, var_558_11.y, var_558_11.z)

				local var_558_12 = var_558_6.localEulerAngles

				var_558_12.z = 0
				var_558_12.x = 0
				var_558_6.localEulerAngles = var_558_12
			end

			if arg_555_1.time_ >= var_558_7 + var_558_8 and arg_555_1.time_ < var_558_7 + var_558_8 + arg_558_0 then
				var_558_6.localPosition = Vector3.New(0, 100, 0)

				local var_558_13 = manager.ui.mainCamera.transform.position - var_558_6.position

				var_558_6.forward = Vector3.New(var_558_13.x, var_558_13.y, var_558_13.z)

				local var_558_14 = var_558_6.localEulerAngles

				var_558_14.z = 0
				var_558_14.x = 0
				var_558_6.localEulerAngles = var_558_14
			end

			local var_558_15 = arg_555_1.actors_["1011ui_story"].transform
			local var_558_16 = 0

			if var_558_16 < arg_555_1.time_ and arg_555_1.time_ <= var_558_16 + arg_558_0 then
				arg_555_1.var_.moveOldPos1011ui_story = var_558_15.localPosition
			end

			local var_558_17 = 0.001

			if var_558_16 <= arg_555_1.time_ and arg_555_1.time_ < var_558_16 + var_558_17 then
				local var_558_18 = (arg_555_1.time_ - var_558_16) / var_558_17
				local var_558_19 = Vector3.New(0, 100, 0)

				var_558_15.localPosition = Vector3.Lerp(arg_555_1.var_.moveOldPos1011ui_story, var_558_19, var_558_18)

				local var_558_20 = manager.ui.mainCamera.transform.position - var_558_15.position

				var_558_15.forward = Vector3.New(var_558_20.x, var_558_20.y, var_558_20.z)

				local var_558_21 = var_558_15.localEulerAngles

				var_558_21.z = 0
				var_558_21.x = 0
				var_558_15.localEulerAngles = var_558_21
			end

			if arg_555_1.time_ >= var_558_16 + var_558_17 and arg_555_1.time_ < var_558_16 + var_558_17 + arg_558_0 then
				var_558_15.localPosition = Vector3.New(0, 100, 0)

				local var_558_22 = manager.ui.mainCamera.transform.position - var_558_15.position

				var_558_15.forward = Vector3.New(var_558_22.x, var_558_22.y, var_558_22.z)

				local var_558_23 = var_558_15.localEulerAngles

				var_558_23.z = 0
				var_558_23.x = 0
				var_558_15.localEulerAngles = var_558_23
			end

			local var_558_24 = 0
			local var_558_25 = 0.9

			if var_558_24 < arg_555_1.time_ and arg_555_1.time_ <= var_558_24 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, false)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_26 = arg_555_1:GetWordFromCfg(910601146)
				local var_558_27 = arg_555_1:FormatText(var_558_26.content)

				arg_555_1.text_.text = var_558_27

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_28 = 36
				local var_558_29 = utf8.len(var_558_27)
				local var_558_30 = var_558_28 <= 0 and var_558_25 or var_558_25 * (var_558_29 / var_558_28)

				if var_558_30 > 0 and var_558_25 < var_558_30 then
					arg_555_1.talkMaxDuration = var_558_30

					if var_558_30 + var_558_24 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_30 + var_558_24
					end
				end

				arg_555_1.text_.text = var_558_27
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_31 = math.max(var_558_25, arg_555_1.talkMaxDuration)

			if var_558_24 <= arg_555_1.time_ and arg_555_1.time_ < var_558_24 + var_558_31 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_24) / var_558_31

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_24 + var_558_31 and arg_555_1.time_ < var_558_24 + var_558_31 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play910601147 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 910601147
		arg_559_1.duration_ = 14.17

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play910601148(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = arg_559_1.actors_["1011ui_story"].transform
			local var_562_1 = 0

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 then
				arg_559_1.var_.moveOldPos1011ui_story = var_562_0.localPosition
			end

			local var_562_2 = 0.001

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_2 then
				local var_562_3 = (arg_559_1.time_ - var_562_1) / var_562_2
				local var_562_4 = Vector3.New(0, -0.71, -6)

				var_562_0.localPosition = Vector3.Lerp(arg_559_1.var_.moveOldPos1011ui_story, var_562_4, var_562_3)

				local var_562_5 = manager.ui.mainCamera.transform.position - var_562_0.position

				var_562_0.forward = Vector3.New(var_562_5.x, var_562_5.y, var_562_5.z)

				local var_562_6 = var_562_0.localEulerAngles

				var_562_6.z = 0
				var_562_6.x = 0
				var_562_0.localEulerAngles = var_562_6
			end

			if arg_559_1.time_ >= var_562_1 + var_562_2 and arg_559_1.time_ < var_562_1 + var_562_2 + arg_562_0 then
				var_562_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_562_7 = manager.ui.mainCamera.transform.position - var_562_0.position

				var_562_0.forward = Vector3.New(var_562_7.x, var_562_7.y, var_562_7.z)

				local var_562_8 = var_562_0.localEulerAngles

				var_562_8.z = 0
				var_562_8.x = 0
				var_562_0.localEulerAngles = var_562_8
			end

			local var_562_9 = arg_559_1.actors_["1011ui_story"]
			local var_562_10 = 0

			if var_562_10 < arg_559_1.time_ and arg_559_1.time_ <= var_562_10 + arg_562_0 and arg_559_1.var_.characterEffect1011ui_story == nil then
				arg_559_1.var_.characterEffect1011ui_story = var_562_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_562_11 = 0.200000002980232

			if var_562_10 <= arg_559_1.time_ and arg_559_1.time_ < var_562_10 + var_562_11 then
				local var_562_12 = (arg_559_1.time_ - var_562_10) / var_562_11

				if arg_559_1.var_.characterEffect1011ui_story then
					arg_559_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_559_1.time_ >= var_562_10 + var_562_11 and arg_559_1.time_ < var_562_10 + var_562_11 + arg_562_0 and arg_559_1.var_.characterEffect1011ui_story then
				arg_559_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_562_13 = 0

			if var_562_13 < arg_559_1.time_ and arg_559_1.time_ <= var_562_13 + arg_562_0 then
				arg_559_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_562_14 = 0

			if var_562_14 < arg_559_1.time_ and arg_559_1.time_ <= var_562_14 + arg_562_0 then
				arg_559_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_562_15 = 0
			local var_562_16 = 1.525

			if var_562_15 < arg_559_1.time_ and arg_559_1.time_ <= var_562_15 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_17 = arg_559_1:FormatText(StoryNameCfg[37].name)

				arg_559_1.leftNameTxt_.text = var_562_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_18 = arg_559_1:GetWordFromCfg(910601147)
				local var_562_19 = arg_559_1:FormatText(var_562_18.content)

				arg_559_1.text_.text = var_562_19

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_20 = 61
				local var_562_21 = utf8.len(var_562_19)
				local var_562_22 = var_562_20 <= 0 and var_562_16 or var_562_16 * (var_562_21 / var_562_20)

				if var_562_22 > 0 and var_562_16 < var_562_22 then
					arg_559_1.talkMaxDuration = var_562_22

					if var_562_22 + var_562_15 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_22 + var_562_15
					end
				end

				arg_559_1.text_.text = var_562_19
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601147", "story_v_out_910601.awb") ~= 0 then
					local var_562_23 = manager.audio:GetVoiceLength("story_v_out_910601", "910601147", "story_v_out_910601.awb") / 1000

					if var_562_23 + var_562_15 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_23 + var_562_15
					end

					if var_562_18.prefab_name ~= "" and arg_559_1.actors_[var_562_18.prefab_name] ~= nil then
						local var_562_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_18.prefab_name].transform, "story_v_out_910601", "910601147", "story_v_out_910601.awb")

						arg_559_1:RecordAudio("910601147", var_562_24)
						arg_559_1:RecordAudio("910601147", var_562_24)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_out_910601", "910601147", "story_v_out_910601.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_out_910601", "910601147", "story_v_out_910601.awb")
				end

				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_25 = math.max(var_562_16, arg_559_1.talkMaxDuration)

			if var_562_15 <= arg_559_1.time_ and arg_559_1.time_ < var_562_15 + var_562_25 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_15) / var_562_25

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_15 + var_562_25 and arg_559_1.time_ < var_562_15 + var_562_25 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play910601148 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 910601148
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play910601149(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = arg_563_1.actors_["1011ui_story"]
			local var_566_1 = 0

			if var_566_1 < arg_563_1.time_ and arg_563_1.time_ <= var_566_1 + arg_566_0 and arg_563_1.var_.characterEffect1011ui_story == nil then
				arg_563_1.var_.characterEffect1011ui_story = var_566_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_566_2 = 0.200000002980232

			if var_566_1 <= arg_563_1.time_ and arg_563_1.time_ < var_566_1 + var_566_2 then
				local var_566_3 = (arg_563_1.time_ - var_566_1) / var_566_2

				if arg_563_1.var_.characterEffect1011ui_story then
					local var_566_4 = Mathf.Lerp(0, 0.5, var_566_3)

					arg_563_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_563_1.var_.characterEffect1011ui_story.fillRatio = var_566_4
				end
			end

			if arg_563_1.time_ >= var_566_1 + var_566_2 and arg_563_1.time_ < var_566_1 + var_566_2 + arg_566_0 and arg_563_1.var_.characterEffect1011ui_story then
				local var_566_5 = 0.5

				arg_563_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_563_1.var_.characterEffect1011ui_story.fillRatio = var_566_5
			end

			local var_566_6 = 0
			local var_566_7 = 0.3

			if var_566_6 < arg_563_1.time_ and arg_563_1.time_ <= var_566_6 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_8 = arg_563_1:FormatText(StoryNameCfg[7].name)

				arg_563_1.leftNameTxt_.text = var_566_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_9 = arg_563_1:GetWordFromCfg(910601148)
				local var_566_10 = arg_563_1:FormatText(var_566_9.content)

				arg_563_1.text_.text = var_566_10

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_11 = 12
				local var_566_12 = utf8.len(var_566_10)
				local var_566_13 = var_566_11 <= 0 and var_566_7 or var_566_7 * (var_566_12 / var_566_11)

				if var_566_13 > 0 and var_566_7 < var_566_13 then
					arg_563_1.talkMaxDuration = var_566_13

					if var_566_13 + var_566_6 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_13 + var_566_6
					end
				end

				arg_563_1.text_.text = var_566_10
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_14 = math.max(var_566_7, arg_563_1.talkMaxDuration)

			if var_566_6 <= arg_563_1.time_ and arg_563_1.time_ < var_566_6 + var_566_14 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_6) / var_566_14

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_6 + var_566_14 and arg_563_1.time_ < var_566_6 + var_566_14 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play910601149 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 910601149
		arg_567_1.duration_ = 5

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play910601150(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = arg_567_1.actors_["1011ui_story"].transform
			local var_570_1 = 0

			if var_570_1 < arg_567_1.time_ and arg_567_1.time_ <= var_570_1 + arg_570_0 then
				arg_567_1.var_.moveOldPos1011ui_story = var_570_0.localPosition
			end

			local var_570_2 = 0.001

			if var_570_1 <= arg_567_1.time_ and arg_567_1.time_ < var_570_1 + var_570_2 then
				local var_570_3 = (arg_567_1.time_ - var_570_1) / var_570_2
				local var_570_4 = Vector3.New(0, 100, 0)

				var_570_0.localPosition = Vector3.Lerp(arg_567_1.var_.moveOldPos1011ui_story, var_570_4, var_570_3)

				local var_570_5 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_5.x, var_570_5.y, var_570_5.z)

				local var_570_6 = var_570_0.localEulerAngles

				var_570_6.z = 0
				var_570_6.x = 0
				var_570_0.localEulerAngles = var_570_6
			end

			if arg_567_1.time_ >= var_570_1 + var_570_2 and arg_567_1.time_ < var_570_1 + var_570_2 + arg_570_0 then
				var_570_0.localPosition = Vector3.New(0, 100, 0)

				local var_570_7 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_7.x, var_570_7.y, var_570_7.z)

				local var_570_8 = var_570_0.localEulerAngles

				var_570_8.z = 0
				var_570_8.x = 0
				var_570_0.localEulerAngles = var_570_8
			end

			local var_570_9 = 0
			local var_570_10 = 0.525

			if var_570_9 < arg_567_1.time_ and arg_567_1.time_ <= var_570_9 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, false)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_11 = arg_567_1:GetWordFromCfg(910601149)
				local var_570_12 = arg_567_1:FormatText(var_570_11.content)

				arg_567_1.text_.text = var_570_12

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_13 = 21
				local var_570_14 = utf8.len(var_570_12)
				local var_570_15 = var_570_13 <= 0 and var_570_10 or var_570_10 * (var_570_14 / var_570_13)

				if var_570_15 > 0 and var_570_10 < var_570_15 then
					arg_567_1.talkMaxDuration = var_570_15

					if var_570_15 + var_570_9 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_15 + var_570_9
					end
				end

				arg_567_1.text_.text = var_570_12
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)
				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_16 = math.max(var_570_10, arg_567_1.talkMaxDuration)

			if var_570_9 <= arg_567_1.time_ and arg_567_1.time_ < var_570_9 + var_570_16 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_9) / var_570_16

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_9 + var_570_16 and arg_567_1.time_ < var_570_9 + var_570_16 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play910601150 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 910601150
		arg_571_1.duration_ = 6.73

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play910601151(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["1028ui_story"].transform
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 then
				arg_571_1.var_.moveOldPos1028ui_story = var_574_0.localPosition
			end

			local var_574_2 = 0.001

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2
				local var_574_4 = Vector3.New(0, -0.9, -5.9)

				var_574_0.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1028ui_story, var_574_4, var_574_3)

				local var_574_5 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_5.x, var_574_5.y, var_574_5.z)

				local var_574_6 = var_574_0.localEulerAngles

				var_574_6.z = 0
				var_574_6.x = 0
				var_574_0.localEulerAngles = var_574_6
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 then
				var_574_0.localPosition = Vector3.New(0, -0.9, -5.9)

				local var_574_7 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_7.x, var_574_7.y, var_574_7.z)

				local var_574_8 = var_574_0.localEulerAngles

				var_574_8.z = 0
				var_574_8.x = 0
				var_574_0.localEulerAngles = var_574_8
			end

			local var_574_9 = arg_571_1.actors_["1028ui_story"]
			local var_574_10 = 0

			if var_574_10 < arg_571_1.time_ and arg_571_1.time_ <= var_574_10 + arg_574_0 and arg_571_1.var_.characterEffect1028ui_story == nil then
				arg_571_1.var_.characterEffect1028ui_story = var_574_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_11 = 0.200000002980232

			if var_574_10 <= arg_571_1.time_ and arg_571_1.time_ < var_574_10 + var_574_11 then
				local var_574_12 = (arg_571_1.time_ - var_574_10) / var_574_11

				if arg_571_1.var_.characterEffect1028ui_story then
					arg_571_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_571_1.time_ >= var_574_10 + var_574_11 and arg_571_1.time_ < var_574_10 + var_574_11 + arg_574_0 and arg_571_1.var_.characterEffect1028ui_story then
				arg_571_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_574_13 = 0

			if var_574_13 < arg_571_1.time_ and arg_571_1.time_ <= var_574_13 + arg_574_0 then
				arg_571_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action3_1")
			end

			local var_574_14 = 0

			if var_574_14 < arg_571_1.time_ and arg_571_1.time_ <= var_574_14 + arg_574_0 then
				arg_571_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_574_15 = arg_571_1.actors_["1084ui_story"].transform
			local var_574_16 = 0

			if var_574_16 < arg_571_1.time_ and arg_571_1.time_ <= var_574_16 + arg_574_0 then
				arg_571_1.var_.moveOldPos1084ui_story = var_574_15.localPosition
			end

			local var_574_17 = 0.001

			if var_574_16 <= arg_571_1.time_ and arg_571_1.time_ < var_574_16 + var_574_17 then
				local var_574_18 = (arg_571_1.time_ - var_574_16) / var_574_17
				local var_574_19 = Vector3.New(0, 100, 0)

				var_574_15.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1084ui_story, var_574_19, var_574_18)

				local var_574_20 = manager.ui.mainCamera.transform.position - var_574_15.position

				var_574_15.forward = Vector3.New(var_574_20.x, var_574_20.y, var_574_20.z)

				local var_574_21 = var_574_15.localEulerAngles

				var_574_21.z = 0
				var_574_21.x = 0
				var_574_15.localEulerAngles = var_574_21
			end

			if arg_571_1.time_ >= var_574_16 + var_574_17 and arg_571_1.time_ < var_574_16 + var_574_17 + arg_574_0 then
				var_574_15.localPosition = Vector3.New(0, 100, 0)

				local var_574_22 = manager.ui.mainCamera.transform.position - var_574_15.position

				var_574_15.forward = Vector3.New(var_574_22.x, var_574_22.y, var_574_22.z)

				local var_574_23 = var_574_15.localEulerAngles

				var_574_23.z = 0
				var_574_23.x = 0
				var_574_15.localEulerAngles = var_574_23
			end

			local var_574_24 = arg_571_1.actors_["1084ui_story"]
			local var_574_25 = 0

			if var_574_25 < arg_571_1.time_ and arg_571_1.time_ <= var_574_25 + arg_574_0 and arg_571_1.var_.characterEffect1084ui_story == nil then
				arg_571_1.var_.characterEffect1084ui_story = var_574_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_26 = 0.200000002980232

			if var_574_25 <= arg_571_1.time_ and arg_571_1.time_ < var_574_25 + var_574_26 then
				local var_574_27 = (arg_571_1.time_ - var_574_25) / var_574_26

				if arg_571_1.var_.characterEffect1084ui_story then
					local var_574_28 = Mathf.Lerp(0, 0.5, var_574_27)

					arg_571_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_571_1.var_.characterEffect1084ui_story.fillRatio = var_574_28
				end
			end

			if arg_571_1.time_ >= var_574_25 + var_574_26 and arg_571_1.time_ < var_574_25 + var_574_26 + arg_574_0 and arg_571_1.var_.characterEffect1084ui_story then
				local var_574_29 = 0.5

				arg_571_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_571_1.var_.characterEffect1084ui_story.fillRatio = var_574_29
			end

			local var_574_30 = 0
			local var_574_31 = 0.6

			if var_574_30 < arg_571_1.time_ and arg_571_1.time_ <= var_574_30 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, true)

				local var_574_32 = arg_571_1:FormatText(StoryNameCfg[327].name)

				arg_571_1.leftNameTxt_.text = var_574_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_571_1.leftNameTxt_.transform)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1.leftNameTxt_.text)
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_33 = arg_571_1:GetWordFromCfg(910601150)
				local var_574_34 = arg_571_1:FormatText(var_574_33.content)

				arg_571_1.text_.text = var_574_34

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_35 = 24
				local var_574_36 = utf8.len(var_574_34)
				local var_574_37 = var_574_35 <= 0 and var_574_31 or var_574_31 * (var_574_36 / var_574_35)

				if var_574_37 > 0 and var_574_31 < var_574_37 then
					arg_571_1.talkMaxDuration = var_574_37

					if var_574_37 + var_574_30 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_37 + var_574_30
					end
				end

				arg_571_1.text_.text = var_574_34
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601150", "story_v_out_910601.awb") ~= 0 then
					local var_574_38 = manager.audio:GetVoiceLength("story_v_out_910601", "910601150", "story_v_out_910601.awb") / 1000

					if var_574_38 + var_574_30 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_38 + var_574_30
					end

					if var_574_33.prefab_name ~= "" and arg_571_1.actors_[var_574_33.prefab_name] ~= nil then
						local var_574_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_571_1.actors_[var_574_33.prefab_name].transform, "story_v_out_910601", "910601150", "story_v_out_910601.awb")

						arg_571_1:RecordAudio("910601150", var_574_39)
						arg_571_1:RecordAudio("910601150", var_574_39)
					else
						arg_571_1:AudioAction("play", "voice", "story_v_out_910601", "910601150", "story_v_out_910601.awb")
					end

					arg_571_1:RecordHistoryTalkVoice("story_v_out_910601", "910601150", "story_v_out_910601.awb")
				end

				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_40 = math.max(var_574_31, arg_571_1.talkMaxDuration)

			if var_574_30 <= arg_571_1.time_ and arg_571_1.time_ < var_574_30 + var_574_40 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_30) / var_574_40

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_30 + var_574_40 and arg_571_1.time_ < var_574_30 + var_574_40 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play910601151 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 910601151
		arg_575_1.duration_ = 5

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play910601152(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = arg_575_1.actors_["1028ui_story"]
			local var_578_1 = 0

			if var_578_1 < arg_575_1.time_ and arg_575_1.time_ <= var_578_1 + arg_578_0 and arg_575_1.var_.characterEffect1028ui_story == nil then
				arg_575_1.var_.characterEffect1028ui_story = var_578_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_578_2 = 0.200000002980232

			if var_578_1 <= arg_575_1.time_ and arg_575_1.time_ < var_578_1 + var_578_2 then
				local var_578_3 = (arg_575_1.time_ - var_578_1) / var_578_2

				if arg_575_1.var_.characterEffect1028ui_story then
					local var_578_4 = Mathf.Lerp(0, 0.5, var_578_3)

					arg_575_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_575_1.var_.characterEffect1028ui_story.fillRatio = var_578_4
				end
			end

			if arg_575_1.time_ >= var_578_1 + var_578_2 and arg_575_1.time_ < var_578_1 + var_578_2 + arg_578_0 and arg_575_1.var_.characterEffect1028ui_story then
				local var_578_5 = 0.5

				arg_575_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_575_1.var_.characterEffect1028ui_story.fillRatio = var_578_5
			end

			local var_578_6 = 0
			local var_578_7 = 0.55

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

				local var_578_9 = arg_575_1:GetWordFromCfg(910601151)
				local var_578_10 = arg_575_1:FormatText(var_578_9.content)

				arg_575_1.text_.text = var_578_10

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_11 = 22
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
	Play910601152 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 910601152
		arg_579_1.duration_ = 6.4

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play910601153(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = arg_579_1.actors_["1028ui_story"]
			local var_582_1 = 0

			if var_582_1 < arg_579_1.time_ and arg_579_1.time_ <= var_582_1 + arg_582_0 and arg_579_1.var_.characterEffect1028ui_story == nil then
				arg_579_1.var_.characterEffect1028ui_story = var_582_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_2 = 0.200000002980232

			if var_582_1 <= arg_579_1.time_ and arg_579_1.time_ < var_582_1 + var_582_2 then
				local var_582_3 = (arg_579_1.time_ - var_582_1) / var_582_2

				if arg_579_1.var_.characterEffect1028ui_story then
					arg_579_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_579_1.time_ >= var_582_1 + var_582_2 and arg_579_1.time_ < var_582_1 + var_582_2 + arg_582_0 and arg_579_1.var_.characterEffect1028ui_story then
				arg_579_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_582_4 = 0

			if var_582_4 < arg_579_1.time_ and arg_579_1.time_ <= var_582_4 + arg_582_0 then
				arg_579_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028actionlink/1028action434")
			end

			local var_582_5 = 0

			if var_582_5 < arg_579_1.time_ and arg_579_1.time_ <= var_582_5 + arg_582_0 then
				arg_579_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_582_6 = 0
			local var_582_7 = 0.8

			if var_582_6 < arg_579_1.time_ and arg_579_1.time_ <= var_582_6 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_8 = arg_579_1:FormatText(StoryNameCfg[327].name)

				arg_579_1.leftNameTxt_.text = var_582_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_9 = arg_579_1:GetWordFromCfg(910601152)
				local var_582_10 = arg_579_1:FormatText(var_582_9.content)

				arg_579_1.text_.text = var_582_10

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_11 = 32
				local var_582_12 = utf8.len(var_582_10)
				local var_582_13 = var_582_11 <= 0 and var_582_7 or var_582_7 * (var_582_12 / var_582_11)

				if var_582_13 > 0 and var_582_7 < var_582_13 then
					arg_579_1.talkMaxDuration = var_582_13

					if var_582_13 + var_582_6 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_13 + var_582_6
					end
				end

				arg_579_1.text_.text = var_582_10
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601152", "story_v_out_910601.awb") ~= 0 then
					local var_582_14 = manager.audio:GetVoiceLength("story_v_out_910601", "910601152", "story_v_out_910601.awb") / 1000

					if var_582_14 + var_582_6 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_14 + var_582_6
					end

					if var_582_9.prefab_name ~= "" and arg_579_1.actors_[var_582_9.prefab_name] ~= nil then
						local var_582_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_579_1.actors_[var_582_9.prefab_name].transform, "story_v_out_910601", "910601152", "story_v_out_910601.awb")

						arg_579_1:RecordAudio("910601152", var_582_15)
						arg_579_1:RecordAudio("910601152", var_582_15)
					else
						arg_579_1:AudioAction("play", "voice", "story_v_out_910601", "910601152", "story_v_out_910601.awb")
					end

					arg_579_1:RecordHistoryTalkVoice("story_v_out_910601", "910601152", "story_v_out_910601.awb")
				end

				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_16 = math.max(var_582_7, arg_579_1.talkMaxDuration)

			if var_582_6 <= arg_579_1.time_ and arg_579_1.time_ < var_582_6 + var_582_16 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_6) / var_582_16

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_6 + var_582_16 and arg_579_1.time_ < var_582_6 + var_582_16 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play910601153 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 910601153
		arg_583_1.duration_ = 8.83

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play910601154(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1048ui_story"].transform
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 then
				arg_583_1.var_.moveOldPos1048ui_story = var_586_0.localPosition
			end

			local var_586_2 = 0.001

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2
				local var_586_4 = Vector3.New(0.7, -0.8, -6.2)

				var_586_0.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos1048ui_story, var_586_4, var_586_3)

				local var_586_5 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_5.x, var_586_5.y, var_586_5.z)

				local var_586_6 = var_586_0.localEulerAngles

				var_586_6.z = 0
				var_586_6.x = 0
				var_586_0.localEulerAngles = var_586_6
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 then
				var_586_0.localPosition = Vector3.New(0.7, -0.8, -6.2)

				local var_586_7 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_7.x, var_586_7.y, var_586_7.z)

				local var_586_8 = var_586_0.localEulerAngles

				var_586_8.z = 0
				var_586_8.x = 0
				var_586_0.localEulerAngles = var_586_8
			end

			local var_586_9 = arg_583_1.actors_["1048ui_story"]
			local var_586_10 = 0

			if var_586_10 < arg_583_1.time_ and arg_583_1.time_ <= var_586_10 + arg_586_0 and arg_583_1.var_.characterEffect1048ui_story == nil then
				arg_583_1.var_.characterEffect1048ui_story = var_586_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_11 = 0.200000002980232

			if var_586_10 <= arg_583_1.time_ and arg_583_1.time_ < var_586_10 + var_586_11 then
				local var_586_12 = (arg_583_1.time_ - var_586_10) / var_586_11

				if arg_583_1.var_.characterEffect1048ui_story then
					arg_583_1.var_.characterEffect1048ui_story.fillFlat = false
				end
			end

			if arg_583_1.time_ >= var_586_10 + var_586_11 and arg_583_1.time_ < var_586_10 + var_586_11 + arg_586_0 and arg_583_1.var_.characterEffect1048ui_story then
				arg_583_1.var_.characterEffect1048ui_story.fillFlat = false
			end

			local var_586_13 = 0

			if var_586_13 < arg_583_1.time_ and arg_583_1.time_ <= var_586_13 + arg_586_0 then
				arg_583_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/1048/1048action/1048action6_1")
			end

			local var_586_14 = 0

			if var_586_14 < arg_583_1.time_ and arg_583_1.time_ <= var_586_14 + arg_586_0 then
				arg_583_1:PlayTimeline("1048ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_586_15 = arg_583_1.actors_["1028ui_story"].transform
			local var_586_16 = 0

			if var_586_16 < arg_583_1.time_ and arg_583_1.time_ <= var_586_16 + arg_586_0 then
				arg_583_1.var_.moveOldPos1028ui_story = var_586_15.localPosition
			end

			local var_586_17 = 0.001

			if var_586_16 <= arg_583_1.time_ and arg_583_1.time_ < var_586_16 + var_586_17 then
				local var_586_18 = (arg_583_1.time_ - var_586_16) / var_586_17
				local var_586_19 = Vector3.New(-0.7, -0.9, -5.9)

				var_586_15.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos1028ui_story, var_586_19, var_586_18)

				local var_586_20 = manager.ui.mainCamera.transform.position - var_586_15.position

				var_586_15.forward = Vector3.New(var_586_20.x, var_586_20.y, var_586_20.z)

				local var_586_21 = var_586_15.localEulerAngles

				var_586_21.z = 0
				var_586_21.x = 0
				var_586_15.localEulerAngles = var_586_21
			end

			if arg_583_1.time_ >= var_586_16 + var_586_17 and arg_583_1.time_ < var_586_16 + var_586_17 + arg_586_0 then
				var_586_15.localPosition = Vector3.New(-0.7, -0.9, -5.9)

				local var_586_22 = manager.ui.mainCamera.transform.position - var_586_15.position

				var_586_15.forward = Vector3.New(var_586_22.x, var_586_22.y, var_586_22.z)

				local var_586_23 = var_586_15.localEulerAngles

				var_586_23.z = 0
				var_586_23.x = 0
				var_586_15.localEulerAngles = var_586_23
			end

			local var_586_24 = arg_583_1.actors_["1028ui_story"]
			local var_586_25 = 0

			if var_586_25 < arg_583_1.time_ and arg_583_1.time_ <= var_586_25 + arg_586_0 and arg_583_1.var_.characterEffect1028ui_story == nil then
				arg_583_1.var_.characterEffect1028ui_story = var_586_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_26 = 0.200000002980232

			if var_586_25 <= arg_583_1.time_ and arg_583_1.time_ < var_586_25 + var_586_26 then
				local var_586_27 = (arg_583_1.time_ - var_586_25) / var_586_26

				if arg_583_1.var_.characterEffect1028ui_story then
					local var_586_28 = Mathf.Lerp(0, 0.5, var_586_27)

					arg_583_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_583_1.var_.characterEffect1028ui_story.fillRatio = var_586_28
				end
			end

			if arg_583_1.time_ >= var_586_25 + var_586_26 and arg_583_1.time_ < var_586_25 + var_586_26 + arg_586_0 and arg_583_1.var_.characterEffect1028ui_story then
				local var_586_29 = 0.5

				arg_583_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_583_1.var_.characterEffect1028ui_story.fillRatio = var_586_29
			end

			local var_586_30 = 0

			if var_586_30 < arg_583_1.time_ and arg_583_1.time_ <= var_586_30 + arg_586_0 then
				arg_583_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action4_2")
			end

			local var_586_31 = 0
			local var_586_32 = 0.95

			if var_586_31 < arg_583_1.time_ and arg_583_1.time_ <= var_586_31 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, true)

				local var_586_33 = arg_583_1:FormatText(StoryNameCfg[8].name)

				arg_583_1.leftNameTxt_.text = var_586_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_583_1.leftNameTxt_.transform)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1.leftNameTxt_.text)
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_34 = arg_583_1:GetWordFromCfg(910601153)
				local var_586_35 = arg_583_1:FormatText(var_586_34.content)

				arg_583_1.text_.text = var_586_35

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_36 = 38
				local var_586_37 = utf8.len(var_586_35)
				local var_586_38 = var_586_36 <= 0 and var_586_32 or var_586_32 * (var_586_37 / var_586_36)

				if var_586_38 > 0 and var_586_32 < var_586_38 then
					arg_583_1.talkMaxDuration = var_586_38

					if var_586_38 + var_586_31 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_38 + var_586_31
					end
				end

				arg_583_1.text_.text = var_586_35
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601153", "story_v_out_910601.awb") ~= 0 then
					local var_586_39 = manager.audio:GetVoiceLength("story_v_out_910601", "910601153", "story_v_out_910601.awb") / 1000

					if var_586_39 + var_586_31 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_39 + var_586_31
					end

					if var_586_34.prefab_name ~= "" and arg_583_1.actors_[var_586_34.prefab_name] ~= nil then
						local var_586_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_583_1.actors_[var_586_34.prefab_name].transform, "story_v_out_910601", "910601153", "story_v_out_910601.awb")

						arg_583_1:RecordAudio("910601153", var_586_40)
						arg_583_1:RecordAudio("910601153", var_586_40)
					else
						arg_583_1:AudioAction("play", "voice", "story_v_out_910601", "910601153", "story_v_out_910601.awb")
					end

					arg_583_1:RecordHistoryTalkVoice("story_v_out_910601", "910601153", "story_v_out_910601.awb")
				end

				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_41 = math.max(var_586_32, arg_583_1.talkMaxDuration)

			if var_586_31 <= arg_583_1.time_ and arg_583_1.time_ < var_586_31 + var_586_41 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_31) / var_586_41

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_31 + var_586_41 and arg_583_1.time_ < var_586_31 + var_586_41 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play910601154 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 910601154
		arg_587_1.duration_ = 5

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play910601155(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = arg_587_1.actors_["1048ui_story"]
			local var_590_1 = 0

			if var_590_1 < arg_587_1.time_ and arg_587_1.time_ <= var_590_1 + arg_590_0 and arg_587_1.var_.characterEffect1048ui_story == nil then
				arg_587_1.var_.characterEffect1048ui_story = var_590_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_590_2 = 0.200000002980232

			if var_590_1 <= arg_587_1.time_ and arg_587_1.time_ < var_590_1 + var_590_2 then
				local var_590_3 = (arg_587_1.time_ - var_590_1) / var_590_2

				if arg_587_1.var_.characterEffect1048ui_story then
					local var_590_4 = Mathf.Lerp(0, 0.5, var_590_3)

					arg_587_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_587_1.var_.characterEffect1048ui_story.fillRatio = var_590_4
				end
			end

			if arg_587_1.time_ >= var_590_1 + var_590_2 and arg_587_1.time_ < var_590_1 + var_590_2 + arg_590_0 and arg_587_1.var_.characterEffect1048ui_story then
				local var_590_5 = 0.5

				arg_587_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_587_1.var_.characterEffect1048ui_story.fillRatio = var_590_5
			end

			local var_590_6 = 0
			local var_590_7 = 0.525

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

				local var_590_9 = arg_587_1:GetWordFromCfg(910601154)
				local var_590_10 = arg_587_1:FormatText(var_590_9.content)

				arg_587_1.text_.text = var_590_10

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_11 = 21
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
	Play910601155 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 910601155
		arg_591_1.duration_ = 8.98

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play910601156(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = "XH0201"

			if arg_591_1.bgs_[var_594_0] == nil then
				local var_594_1 = Object.Instantiate(arg_591_1.paintGo_)

				var_594_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_594_0)
				var_594_1.name = var_594_0
				var_594_1.transform.parent = arg_591_1.stage_.transform
				var_594_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_591_1.bgs_[var_594_0] = var_594_1
			end

			local var_594_2 = 2

			if var_594_2 < arg_591_1.time_ and arg_591_1.time_ <= var_594_2 + arg_594_0 then
				local var_594_3 = manager.ui.mainCamera.transform.localPosition
				local var_594_4 = Vector3.New(0, 0, 10) + Vector3.New(var_594_3.x, var_594_3.y, 0)
				local var_594_5 = arg_591_1.bgs_.XH0201

				var_594_5.transform.localPosition = var_594_4
				var_594_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_594_6 = var_594_5:GetComponent("SpriteRenderer")

				if var_594_6 and var_594_6.sprite then
					local var_594_7 = (var_594_5.transform.localPosition - var_594_3).z
					local var_594_8 = manager.ui.mainCameraCom_
					local var_594_9 = 2 * var_594_7 * Mathf.Tan(var_594_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_594_10 = var_594_9 * var_594_8.aspect
					local var_594_11 = var_594_6.sprite.bounds.size.x
					local var_594_12 = var_594_6.sprite.bounds.size.y
					local var_594_13 = var_594_10 / var_594_11
					local var_594_14 = var_594_9 / var_594_12
					local var_594_15 = var_594_14 < var_594_13 and var_594_13 or var_594_14

					var_594_5.transform.localScale = Vector3.New(var_594_15, var_594_15, 0)
				end

				for iter_594_0, iter_594_1 in pairs(arg_591_1.bgs_) do
					if iter_594_0 ~= "XH0201" then
						iter_594_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_594_16 = 0

			if var_594_16 < arg_591_1.time_ and arg_591_1.time_ <= var_594_16 + arg_594_0 then
				arg_591_1.mask_.enabled = true
				arg_591_1.mask_.raycastTarget = true

				arg_591_1:SetGaussion(false)
			end

			local var_594_17 = 2

			if var_594_16 <= arg_591_1.time_ and arg_591_1.time_ < var_594_16 + var_594_17 then
				local var_594_18 = (arg_591_1.time_ - var_594_16) / var_594_17
				local var_594_19 = Color.New(1, 0.9764151, 0.9764151)

				var_594_19.a = Mathf.Lerp(0, 1, var_594_18)
				arg_591_1.mask_.color = var_594_19
			end

			if arg_591_1.time_ >= var_594_16 + var_594_17 and arg_591_1.time_ < var_594_16 + var_594_17 + arg_594_0 then
				local var_594_20 = Color.New(1, 0.9764151, 0.9764151)

				var_594_20.a = 1
				arg_591_1.mask_.color = var_594_20
			end

			local var_594_21 = 2

			if var_594_21 < arg_591_1.time_ and arg_591_1.time_ <= var_594_21 + arg_594_0 then
				arg_591_1.mask_.enabled = true
				arg_591_1.mask_.raycastTarget = true

				arg_591_1:SetGaussion(false)
			end

			local var_594_22 = 2

			if var_594_21 <= arg_591_1.time_ and arg_591_1.time_ < var_594_21 + var_594_22 then
				local var_594_23 = (arg_591_1.time_ - var_594_21) / var_594_22
				local var_594_24 = Color.New(1, 0.9764151, 0.9764151)

				var_594_24.a = Mathf.Lerp(1, 0, var_594_23)
				arg_591_1.mask_.color = var_594_24
			end

			if arg_591_1.time_ >= var_594_21 + var_594_22 and arg_591_1.time_ < var_594_21 + var_594_22 + arg_594_0 then
				local var_594_25 = Color.New(1, 0.9764151, 0.9764151)
				local var_594_26 = 0

				arg_591_1.mask_.enabled = false
				var_594_25.a = var_594_26
				arg_591_1.mask_.color = var_594_25
			end

			local var_594_27 = arg_591_1.actors_["1048ui_story"].transform
			local var_594_28 = 0

			if var_594_28 < arg_591_1.time_ and arg_591_1.time_ <= var_594_28 + arg_594_0 then
				arg_591_1.var_.moveOldPos1048ui_story = var_594_27.localPosition
			end

			local var_594_29 = 0.001

			if var_594_28 <= arg_591_1.time_ and arg_591_1.time_ < var_594_28 + var_594_29 then
				local var_594_30 = (arg_591_1.time_ - var_594_28) / var_594_29
				local var_594_31 = Vector3.New(0, 100, 0)

				var_594_27.localPosition = Vector3.Lerp(arg_591_1.var_.moveOldPos1048ui_story, var_594_31, var_594_30)

				local var_594_32 = manager.ui.mainCamera.transform.position - var_594_27.position

				var_594_27.forward = Vector3.New(var_594_32.x, var_594_32.y, var_594_32.z)

				local var_594_33 = var_594_27.localEulerAngles

				var_594_33.z = 0
				var_594_33.x = 0
				var_594_27.localEulerAngles = var_594_33
			end

			if arg_591_1.time_ >= var_594_28 + var_594_29 and arg_591_1.time_ < var_594_28 + var_594_29 + arg_594_0 then
				var_594_27.localPosition = Vector3.New(0, 100, 0)

				local var_594_34 = manager.ui.mainCamera.transform.position - var_594_27.position

				var_594_27.forward = Vector3.New(var_594_34.x, var_594_34.y, var_594_34.z)

				local var_594_35 = var_594_27.localEulerAngles

				var_594_35.z = 0
				var_594_35.x = 0
				var_594_27.localEulerAngles = var_594_35
			end

			local var_594_36 = arg_591_1.actors_["1048ui_story"]
			local var_594_37 = 0

			if var_594_37 < arg_591_1.time_ and arg_591_1.time_ <= var_594_37 + arg_594_0 and arg_591_1.var_.characterEffect1048ui_story == nil then
				arg_591_1.var_.characterEffect1048ui_story = var_594_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_38 = 0.034000001847744

			if var_594_37 <= arg_591_1.time_ and arg_591_1.time_ < var_594_37 + var_594_38 then
				local var_594_39 = (arg_591_1.time_ - var_594_37) / var_594_38

				if arg_591_1.var_.characterEffect1048ui_story then
					local var_594_40 = Mathf.Lerp(0, 0.5, var_594_39)

					arg_591_1.var_.characterEffect1048ui_story.fillFlat = true
					arg_591_1.var_.characterEffect1048ui_story.fillRatio = var_594_40
				end
			end

			if arg_591_1.time_ >= var_594_37 + var_594_38 and arg_591_1.time_ < var_594_37 + var_594_38 + arg_594_0 and arg_591_1.var_.characterEffect1048ui_story then
				local var_594_41 = 0.5

				arg_591_1.var_.characterEffect1048ui_story.fillFlat = true
				arg_591_1.var_.characterEffect1048ui_story.fillRatio = var_594_41
			end

			local var_594_42 = arg_591_1.actors_["1028ui_story"].transform
			local var_594_43 = 0

			if var_594_43 < arg_591_1.time_ and arg_591_1.time_ <= var_594_43 + arg_594_0 then
				arg_591_1.var_.moveOldPos1028ui_story = var_594_42.localPosition
			end

			local var_594_44 = 0.001

			if var_594_43 <= arg_591_1.time_ and arg_591_1.time_ < var_594_43 + var_594_44 then
				local var_594_45 = (arg_591_1.time_ - var_594_43) / var_594_44
				local var_594_46 = Vector3.New(0, 100, 0)

				var_594_42.localPosition = Vector3.Lerp(arg_591_1.var_.moveOldPos1028ui_story, var_594_46, var_594_45)

				local var_594_47 = manager.ui.mainCamera.transform.position - var_594_42.position

				var_594_42.forward = Vector3.New(var_594_47.x, var_594_47.y, var_594_47.z)

				local var_594_48 = var_594_42.localEulerAngles

				var_594_48.z = 0
				var_594_48.x = 0
				var_594_42.localEulerAngles = var_594_48
			end

			if arg_591_1.time_ >= var_594_43 + var_594_44 and arg_591_1.time_ < var_594_43 + var_594_44 + arg_594_0 then
				var_594_42.localPosition = Vector3.New(0, 100, 0)

				local var_594_49 = manager.ui.mainCamera.transform.position - var_594_42.position

				var_594_42.forward = Vector3.New(var_594_49.x, var_594_49.y, var_594_49.z)

				local var_594_50 = var_594_42.localEulerAngles

				var_594_50.z = 0
				var_594_50.x = 0
				var_594_42.localEulerAngles = var_594_50
			end

			local var_594_51 = arg_591_1.actors_["1028ui_story"]
			local var_594_52 = 0

			if var_594_52 < arg_591_1.time_ and arg_591_1.time_ <= var_594_52 + arg_594_0 and arg_591_1.var_.characterEffect1028ui_story == nil then
				arg_591_1.var_.characterEffect1028ui_story = var_594_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_594_53 = 0.034000001847744

			if var_594_52 <= arg_591_1.time_ and arg_591_1.time_ < var_594_52 + var_594_53 then
				local var_594_54 = (arg_591_1.time_ - var_594_52) / var_594_53

				if arg_591_1.var_.characterEffect1028ui_story then
					local var_594_55 = Mathf.Lerp(0, 0.5, var_594_54)

					arg_591_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_591_1.var_.characterEffect1028ui_story.fillRatio = var_594_55
				end
			end

			if arg_591_1.time_ >= var_594_52 + var_594_53 and arg_591_1.time_ < var_594_52 + var_594_53 + arg_594_0 and arg_591_1.var_.characterEffect1028ui_story then
				local var_594_56 = 0.5

				arg_591_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_591_1.var_.characterEffect1028ui_story.fillRatio = var_594_56
			end

			if arg_591_1.frameCnt_ <= 1 then
				arg_591_1.dialog_:SetActive(false)
			end

			local var_594_57 = 3.975
			local var_594_58 = 1.025

			if var_594_57 < arg_591_1.time_ and arg_591_1.time_ <= var_594_57 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0

				arg_591_1.dialog_:SetActive(true)

				local var_594_59 = LeanTween.value(arg_591_1.dialog_, 0, 1, 0.3)

				var_594_59:setOnUpdate(LuaHelper.FloatAction(function(arg_595_0)
					arg_591_1.dialogCg_.alpha = arg_595_0
				end))
				var_594_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_591_1.dialog_)
					var_594_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_591_1.duration_ = arg_591_1.duration_ + 0.3

				SetActive(arg_591_1.leftNameGo_, false)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_60 = arg_591_1:GetWordFromCfg(910601155)
				local var_594_61 = arg_591_1:FormatText(var_594_60.content)

				arg_591_1.text_.text = var_594_61

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_62 = 41
				local var_594_63 = utf8.len(var_594_61)
				local var_594_64 = var_594_62 <= 0 and var_594_58 or var_594_58 * (var_594_63 / var_594_62)

				if var_594_64 > 0 and var_594_58 < var_594_64 then
					arg_591_1.talkMaxDuration = var_594_64
					var_594_57 = var_594_57 + 0.3

					if var_594_64 + var_594_57 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_64 + var_594_57
					end
				end

				arg_591_1.text_.text = var_594_61
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)
				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_65 = var_594_57 + 0.3
			local var_594_66 = math.max(var_594_58, arg_591_1.talkMaxDuration)

			if var_594_65 <= arg_591_1.time_ and arg_591_1.time_ < var_594_65 + var_594_66 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_65) / var_594_66

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_65 + var_594_66 and arg_591_1.time_ < var_594_65 + var_594_66 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play910601156 = function(arg_597_0, arg_597_1)
		arg_597_1.time_ = 0
		arg_597_1.frameCnt_ = 0
		arg_597_1.state_ = "playing"
		arg_597_1.curTalkId_ = 910601156
		arg_597_1.duration_ = 8.98

		SetActive(arg_597_1.tipsGo_, false)

		function arg_597_1.onSingleLineFinish_()
			arg_597_1.onSingleLineUpdate_ = nil
			arg_597_1.onSingleLineFinish_ = nil
			arg_597_1.state_ = "waiting"
		end

		function arg_597_1.playNext_(arg_599_0)
			if arg_599_0 == 1 then
				arg_597_0:Play910601157(arg_597_1)
			end
		end

		function arg_597_1.onSingleLineUpdate_(arg_600_0)
			local var_600_0 = "R1102"

			if arg_597_1.bgs_[var_600_0] == nil then
				local var_600_1 = Object.Instantiate(arg_597_1.paintGo_)

				var_600_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_600_0)
				var_600_1.name = var_600_0
				var_600_1.transform.parent = arg_597_1.stage_.transform
				var_600_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_597_1.bgs_[var_600_0] = var_600_1
			end

			local var_600_2 = 2

			if var_600_2 < arg_597_1.time_ and arg_597_1.time_ <= var_600_2 + arg_600_0 then
				local var_600_3 = manager.ui.mainCamera.transform.localPosition
				local var_600_4 = Vector3.New(0, 0, 10) + Vector3.New(var_600_3.x, var_600_3.y, 0)
				local var_600_5 = arg_597_1.bgs_.R1102

				var_600_5.transform.localPosition = var_600_4
				var_600_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_600_6 = var_600_5:GetComponent("SpriteRenderer")

				if var_600_6 and var_600_6.sprite then
					local var_600_7 = (var_600_5.transform.localPosition - var_600_3).z
					local var_600_8 = manager.ui.mainCameraCom_
					local var_600_9 = 2 * var_600_7 * Mathf.Tan(var_600_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_600_10 = var_600_9 * var_600_8.aspect
					local var_600_11 = var_600_6.sprite.bounds.size.x
					local var_600_12 = var_600_6.sprite.bounds.size.y
					local var_600_13 = var_600_10 / var_600_11
					local var_600_14 = var_600_9 / var_600_12
					local var_600_15 = var_600_14 < var_600_13 and var_600_13 or var_600_14

					var_600_5.transform.localScale = Vector3.New(var_600_15, var_600_15, 0)
				end

				for iter_600_0, iter_600_1 in pairs(arg_597_1.bgs_) do
					if iter_600_0 ~= "R1102" then
						iter_600_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_600_16 = 0

			if var_600_16 < arg_597_1.time_ and arg_597_1.time_ <= var_600_16 + arg_600_0 then
				arg_597_1.mask_.enabled = true
				arg_597_1.mask_.raycastTarget = true

				arg_597_1:SetGaussion(false)
			end

			local var_600_17 = 2

			if var_600_16 <= arg_597_1.time_ and arg_597_1.time_ < var_600_16 + var_600_17 then
				local var_600_18 = (arg_597_1.time_ - var_600_16) / var_600_17
				local var_600_19 = Color.New(1, 0.9764151, 0.9764151)

				var_600_19.a = Mathf.Lerp(0, 1, var_600_18)
				arg_597_1.mask_.color = var_600_19
			end

			if arg_597_1.time_ >= var_600_16 + var_600_17 and arg_597_1.time_ < var_600_16 + var_600_17 + arg_600_0 then
				local var_600_20 = Color.New(1, 0.9764151, 0.9764151)

				var_600_20.a = 1
				arg_597_1.mask_.color = var_600_20
			end

			local var_600_21 = 2

			if var_600_21 < arg_597_1.time_ and arg_597_1.time_ <= var_600_21 + arg_600_0 then
				arg_597_1.mask_.enabled = true
				arg_597_1.mask_.raycastTarget = true

				arg_597_1:SetGaussion(false)
			end

			local var_600_22 = 2

			if var_600_21 <= arg_597_1.time_ and arg_597_1.time_ < var_600_21 + var_600_22 then
				local var_600_23 = (arg_597_1.time_ - var_600_21) / var_600_22
				local var_600_24 = Color.New(1, 0.9764151, 0.9764151)

				var_600_24.a = Mathf.Lerp(1, 0, var_600_23)
				arg_597_1.mask_.color = var_600_24
			end

			if arg_597_1.time_ >= var_600_21 + var_600_22 and arg_597_1.time_ < var_600_21 + var_600_22 + arg_600_0 then
				local var_600_25 = Color.New(1, 0.9764151, 0.9764151)
				local var_600_26 = 0

				arg_597_1.mask_.enabled = false
				var_600_25.a = var_600_26
				arg_597_1.mask_.color = var_600_25
			end

			if arg_597_1.frameCnt_ <= 1 then
				arg_597_1.dialog_:SetActive(false)
			end

			local var_600_27 = 3.975
			local var_600_28 = 0.725

			if var_600_27 < arg_597_1.time_ and arg_597_1.time_ <= var_600_27 + arg_600_0 then
				arg_597_1.talkMaxDuration = 0

				arg_597_1.dialog_:SetActive(true)

				local var_600_29 = LeanTween.value(arg_597_1.dialog_, 0, 1, 0.3)

				var_600_29:setOnUpdate(LuaHelper.FloatAction(function(arg_601_0)
					arg_597_1.dialogCg_.alpha = arg_601_0
				end))
				var_600_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_597_1.dialog_)
					var_600_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_597_1.duration_ = arg_597_1.duration_ + 0.3

				SetActive(arg_597_1.leftNameGo_, false)

				arg_597_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_597_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_597_1:RecordName(arg_597_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_597_1.iconTrs_.gameObject, false)
				arg_597_1.callingController_:SetSelectedState("normal")

				local var_600_30 = arg_597_1:GetWordFromCfg(910601156)
				local var_600_31 = arg_597_1:FormatText(var_600_30.content)

				arg_597_1.text_.text = var_600_31

				LuaForUtil.ClearLinePrefixSymbol(arg_597_1.text_)

				local var_600_32 = 29
				local var_600_33 = utf8.len(var_600_31)
				local var_600_34 = var_600_32 <= 0 and var_600_28 or var_600_28 * (var_600_33 / var_600_32)

				if var_600_34 > 0 and var_600_28 < var_600_34 then
					arg_597_1.talkMaxDuration = var_600_34
					var_600_27 = var_600_27 + 0.3

					if var_600_34 + var_600_27 > arg_597_1.duration_ then
						arg_597_1.duration_ = var_600_34 + var_600_27
					end
				end

				arg_597_1.text_.text = var_600_31
				arg_597_1.typewritter.percent = 0

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(false)
				arg_597_1:RecordContent(arg_597_1.text_.text)
			end

			local var_600_35 = var_600_27 + 0.3
			local var_600_36 = math.max(var_600_28, arg_597_1.talkMaxDuration)

			if var_600_35 <= arg_597_1.time_ and arg_597_1.time_ < var_600_35 + var_600_36 then
				arg_597_1.typewritter.percent = (arg_597_1.time_ - var_600_35) / var_600_36

				arg_597_1.typewritter:SetDirty()
			end

			if arg_597_1.time_ >= var_600_35 + var_600_36 and arg_597_1.time_ < var_600_35 + var_600_36 + arg_600_0 then
				arg_597_1.typewritter.percent = 1

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(true)
			end
		end
	end,
	Play910601157 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 910601157
		arg_603_1.duration_ = 9

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play910601158(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 0

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				arg_603_1.mask_.enabled = true
				arg_603_1.mask_.raycastTarget = true

				arg_603_1:SetGaussion(false)
			end

			local var_606_1 = 2

			if var_606_0 <= arg_603_1.time_ and arg_603_1.time_ < var_606_0 + var_606_1 then
				local var_606_2 = (arg_603_1.time_ - var_606_0) / var_606_1
				local var_606_3 = Color.New(1, 0.9764151, 0.9764151)

				var_606_3.a = Mathf.Lerp(0, 1, var_606_2)
				arg_603_1.mask_.color = var_606_3
			end

			if arg_603_1.time_ >= var_606_0 + var_606_1 and arg_603_1.time_ < var_606_0 + var_606_1 + arg_606_0 then
				local var_606_4 = Color.New(1, 0.9764151, 0.9764151)

				var_606_4.a = 1
				arg_603_1.mask_.color = var_606_4
			end

			local var_606_5 = 2

			if var_606_5 < arg_603_1.time_ and arg_603_1.time_ <= var_606_5 + arg_606_0 then
				arg_603_1.mask_.enabled = true
				arg_603_1.mask_.raycastTarget = true

				arg_603_1:SetGaussion(false)
			end

			local var_606_6 = 2

			if var_606_5 <= arg_603_1.time_ and arg_603_1.time_ < var_606_5 + var_606_6 then
				local var_606_7 = (arg_603_1.time_ - var_606_5) / var_606_6
				local var_606_8 = Color.New(1, 0.9764151, 0.9764151)

				var_606_8.a = Mathf.Lerp(1, 0, var_606_7)
				arg_603_1.mask_.color = var_606_8
			end

			if arg_603_1.time_ >= var_606_5 + var_606_6 and arg_603_1.time_ < var_606_5 + var_606_6 + arg_606_0 then
				local var_606_9 = Color.New(1, 0.9764151, 0.9764151)
				local var_606_10 = 0

				arg_603_1.mask_.enabled = false
				var_606_9.a = var_606_10
				arg_603_1.mask_.color = var_606_9
			end

			local var_606_11 = "R2802"

			if arg_603_1.bgs_[var_606_11] == nil then
				local var_606_12 = Object.Instantiate(arg_603_1.paintGo_)

				var_606_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_606_11)
				var_606_12.name = var_606_11
				var_606_12.transform.parent = arg_603_1.stage_.transform
				var_606_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_603_1.bgs_[var_606_11] = var_606_12
			end

			local var_606_13 = 2

			if var_606_13 < arg_603_1.time_ and arg_603_1.time_ <= var_606_13 + arg_606_0 then
				local var_606_14 = manager.ui.mainCamera.transform.localPosition
				local var_606_15 = Vector3.New(0, 0, 10) + Vector3.New(var_606_14.x, var_606_14.y, 0)
				local var_606_16 = arg_603_1.bgs_.R2802

				var_606_16.transform.localPosition = var_606_15
				var_606_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_606_17 = var_606_16:GetComponent("SpriteRenderer")

				if var_606_17 and var_606_17.sprite then
					local var_606_18 = (var_606_16.transform.localPosition - var_606_14).z
					local var_606_19 = manager.ui.mainCameraCom_
					local var_606_20 = 2 * var_606_18 * Mathf.Tan(var_606_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_606_21 = var_606_20 * var_606_19.aspect
					local var_606_22 = var_606_17.sprite.bounds.size.x
					local var_606_23 = var_606_17.sprite.bounds.size.y
					local var_606_24 = var_606_21 / var_606_22
					local var_606_25 = var_606_20 / var_606_23
					local var_606_26 = var_606_25 < var_606_24 and var_606_24 or var_606_25

					var_606_16.transform.localScale = Vector3.New(var_606_26, var_606_26, 0)
				end

				for iter_606_0, iter_606_1 in pairs(arg_603_1.bgs_) do
					if iter_606_0 ~= "R2802" then
						iter_606_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_603_1.frameCnt_ <= 1 then
				arg_603_1.dialog_:SetActive(false)
			end

			local var_606_27 = 4
			local var_606_28 = 0.8

			if var_606_27 < arg_603_1.time_ and arg_603_1.time_ <= var_606_27 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0

				arg_603_1.dialog_:SetActive(true)

				local var_606_29 = LeanTween.value(arg_603_1.dialog_, 0, 1, 0.3)

				var_606_29:setOnUpdate(LuaHelper.FloatAction(function(arg_607_0)
					arg_603_1.dialogCg_.alpha = arg_607_0
				end))
				var_606_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_603_1.dialog_)
					var_606_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_603_1.duration_ = arg_603_1.duration_ + 0.3

				SetActive(arg_603_1.leftNameGo_, false)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_30 = arg_603_1:GetWordFromCfg(910601157)
				local var_606_31 = arg_603_1:FormatText(var_606_30.content)

				arg_603_1.text_.text = var_606_31

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_32 = 32
				local var_606_33 = utf8.len(var_606_31)
				local var_606_34 = var_606_32 <= 0 and var_606_28 or var_606_28 * (var_606_33 / var_606_32)

				if var_606_34 > 0 and var_606_28 < var_606_34 then
					arg_603_1.talkMaxDuration = var_606_34
					var_606_27 = var_606_27 + 0.3

					if var_606_34 + var_606_27 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_34 + var_606_27
					end
				end

				arg_603_1.text_.text = var_606_31
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_35 = var_606_27 + 0.3
			local var_606_36 = math.max(var_606_28, arg_603_1.talkMaxDuration)

			if var_606_35 <= arg_603_1.time_ and arg_603_1.time_ < var_606_35 + var_606_36 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_35) / var_606_36

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_35 + var_606_36 and arg_603_1.time_ < var_606_35 + var_606_36 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play910601158 = function(arg_609_0, arg_609_1)
		arg_609_1.time_ = 0
		arg_609_1.frameCnt_ = 0
		arg_609_1.state_ = "playing"
		arg_609_1.curTalkId_ = 910601158
		arg_609_1.duration_ = 8.98

		SetActive(arg_609_1.tipsGo_, false)

		function arg_609_1.onSingleLineFinish_()
			arg_609_1.onSingleLineUpdate_ = nil
			arg_609_1.onSingleLineFinish_ = nil
			arg_609_1.state_ = "waiting"
		end

		function arg_609_1.playNext_(arg_611_0)
			if arg_611_0 == 1 then
				arg_609_0:Play910601159(arg_609_1)
			end
		end

		function arg_609_1.onSingleLineUpdate_(arg_612_0)
			local var_612_0 = 0

			if var_612_0 < arg_609_1.time_ and arg_609_1.time_ <= var_612_0 + arg_612_0 then
				arg_609_1.mask_.enabled = true
				arg_609_1.mask_.raycastTarget = true

				arg_609_1:SetGaussion(false)
			end

			local var_612_1 = 2

			if var_612_0 <= arg_609_1.time_ and arg_609_1.time_ < var_612_0 + var_612_1 then
				local var_612_2 = (arg_609_1.time_ - var_612_0) / var_612_1
				local var_612_3 = Color.New(1, 0.9764151, 0.9764151)

				var_612_3.a = Mathf.Lerp(0, 1, var_612_2)
				arg_609_1.mask_.color = var_612_3
			end

			if arg_609_1.time_ >= var_612_0 + var_612_1 and arg_609_1.time_ < var_612_0 + var_612_1 + arg_612_0 then
				local var_612_4 = Color.New(1, 0.9764151, 0.9764151)

				var_612_4.a = 1
				arg_609_1.mask_.color = var_612_4
			end

			local var_612_5 = 2

			if var_612_5 < arg_609_1.time_ and arg_609_1.time_ <= var_612_5 + arg_612_0 then
				arg_609_1.mask_.enabled = true
				arg_609_1.mask_.raycastTarget = true

				arg_609_1:SetGaussion(false)
			end

			local var_612_6 = 2

			if var_612_5 <= arg_609_1.time_ and arg_609_1.time_ < var_612_5 + var_612_6 then
				local var_612_7 = (arg_609_1.time_ - var_612_5) / var_612_6
				local var_612_8 = Color.New(1, 0.9764151, 0.9764151)

				var_612_8.a = Mathf.Lerp(1, 0, var_612_7)
				arg_609_1.mask_.color = var_612_8
			end

			if arg_609_1.time_ >= var_612_5 + var_612_6 and arg_609_1.time_ < var_612_5 + var_612_6 + arg_612_0 then
				local var_612_9 = Color.New(1, 0.9764151, 0.9764151)
				local var_612_10 = 0

				arg_609_1.mask_.enabled = false
				var_612_9.a = var_612_10
				arg_609_1.mask_.color = var_612_9
			end

			local var_612_11 = "R4802"

			if arg_609_1.bgs_[var_612_11] == nil then
				local var_612_12 = Object.Instantiate(arg_609_1.paintGo_)

				var_612_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_612_11)
				var_612_12.name = var_612_11
				var_612_12.transform.parent = arg_609_1.stage_.transform
				var_612_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_609_1.bgs_[var_612_11] = var_612_12
			end

			local var_612_13 = 2

			if var_612_13 < arg_609_1.time_ and arg_609_1.time_ <= var_612_13 + arg_612_0 then
				local var_612_14 = manager.ui.mainCamera.transform.localPosition
				local var_612_15 = Vector3.New(0, 0, 10) + Vector3.New(var_612_14.x, var_612_14.y, 0)
				local var_612_16 = arg_609_1.bgs_.R4802

				var_612_16.transform.localPosition = var_612_15
				var_612_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_612_17 = var_612_16:GetComponent("SpriteRenderer")

				if var_612_17 and var_612_17.sprite then
					local var_612_18 = (var_612_16.transform.localPosition - var_612_14).z
					local var_612_19 = manager.ui.mainCameraCom_
					local var_612_20 = 2 * var_612_18 * Mathf.Tan(var_612_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_612_21 = var_612_20 * var_612_19.aspect
					local var_612_22 = var_612_17.sprite.bounds.size.x
					local var_612_23 = var_612_17.sprite.bounds.size.y
					local var_612_24 = var_612_21 / var_612_22
					local var_612_25 = var_612_20 / var_612_23
					local var_612_26 = var_612_25 < var_612_24 and var_612_24 or var_612_25

					var_612_16.transform.localScale = Vector3.New(var_612_26, var_612_26, 0)
				end

				for iter_612_0, iter_612_1 in pairs(arg_609_1.bgs_) do
					if iter_612_0 ~= "R4802" then
						iter_612_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_609_1.frameCnt_ <= 1 then
				arg_609_1.dialog_:SetActive(false)
			end

			local var_612_27 = 3.975
			local var_612_28 = 0.35

			if var_612_27 < arg_609_1.time_ and arg_609_1.time_ <= var_612_27 + arg_612_0 then
				arg_609_1.talkMaxDuration = 0

				arg_609_1.dialog_:SetActive(true)

				local var_612_29 = LeanTween.value(arg_609_1.dialog_, 0, 1, 0.3)

				var_612_29:setOnUpdate(LuaHelper.FloatAction(function(arg_613_0)
					arg_609_1.dialogCg_.alpha = arg_613_0
				end))
				var_612_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_609_1.dialog_)
					var_612_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_609_1.duration_ = arg_609_1.duration_ + 0.3

				SetActive(arg_609_1.leftNameGo_, false)

				arg_609_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_609_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_609_1:RecordName(arg_609_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_609_1.iconTrs_.gameObject, false)
				arg_609_1.callingController_:SetSelectedState("normal")

				local var_612_30 = arg_609_1:GetWordFromCfg(910601158)
				local var_612_31 = arg_609_1:FormatText(var_612_30.content)

				arg_609_1.text_.text = var_612_31

				LuaForUtil.ClearLinePrefixSymbol(arg_609_1.text_)

				local var_612_32 = 14
				local var_612_33 = utf8.len(var_612_31)
				local var_612_34 = var_612_32 <= 0 and var_612_28 or var_612_28 * (var_612_33 / var_612_32)

				if var_612_34 > 0 and var_612_28 < var_612_34 then
					arg_609_1.talkMaxDuration = var_612_34
					var_612_27 = var_612_27 + 0.3

					if var_612_34 + var_612_27 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_34 + var_612_27
					end
				end

				arg_609_1.text_.text = var_612_31
				arg_609_1.typewritter.percent = 0

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(false)
				arg_609_1:RecordContent(arg_609_1.text_.text)
			end

			local var_612_35 = var_612_27 + 0.3
			local var_612_36 = math.max(var_612_28, arg_609_1.talkMaxDuration)

			if var_612_35 <= arg_609_1.time_ and arg_609_1.time_ < var_612_35 + var_612_36 then
				arg_609_1.typewritter.percent = (arg_609_1.time_ - var_612_35) / var_612_36

				arg_609_1.typewritter:SetDirty()
			end

			if arg_609_1.time_ >= var_612_35 + var_612_36 and arg_609_1.time_ < var_612_35 + var_612_36 + arg_612_0 then
				arg_609_1.typewritter.percent = 1

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(true)
			end
		end
	end,
	Play910601159 = function(arg_615_0, arg_615_1)
		arg_615_1.time_ = 0
		arg_615_1.frameCnt_ = 0
		arg_615_1.state_ = "playing"
		arg_615_1.curTalkId_ = 910601159
		arg_615_1.duration_ = 5

		SetActive(arg_615_1.tipsGo_, false)

		function arg_615_1.onSingleLineFinish_()
			arg_615_1.onSingleLineUpdate_ = nil
			arg_615_1.onSingleLineFinish_ = nil
			arg_615_1.state_ = "waiting"
		end

		function arg_615_1.playNext_(arg_617_0)
			if arg_617_0 == 1 then
				arg_615_0:Play910601160(arg_615_1)
			end
		end

		function arg_615_1.onSingleLineUpdate_(arg_618_0)
			local var_618_0 = 0
			local var_618_1 = 0.75

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

				SetActive(arg_615_1.leftNameGo_, false)

				arg_615_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_615_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_615_1:RecordName(arg_615_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_615_1.iconTrs_.gameObject, false)
				arg_615_1.callingController_:SetSelectedState("normal")

				local var_618_3 = arg_615_1:GetWordFromCfg(910601159)
				local var_618_4 = arg_615_1:FormatText(var_618_3.content)

				arg_615_1.text_.text = var_618_4

				LuaForUtil.ClearLinePrefixSymbol(arg_615_1.text_)

				local var_618_5 = 30
				local var_618_6 = utf8.len(var_618_4)
				local var_618_7 = var_618_5 <= 0 and var_618_1 or var_618_1 * (var_618_6 / var_618_5)

				if var_618_7 > 0 and var_618_1 < var_618_7 then
					arg_615_1.talkMaxDuration = var_618_7
					var_618_0 = var_618_0 + 0.3

					if var_618_7 + var_618_0 > arg_615_1.duration_ then
						arg_615_1.duration_ = var_618_7 + var_618_0
					end
				end

				arg_615_1.text_.text = var_618_4
				arg_615_1.typewritter.percent = 0

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(false)
				arg_615_1:RecordContent(arg_615_1.text_.text)
			end

			local var_618_8 = var_618_0 + 0.3
			local var_618_9 = math.max(var_618_1, arg_615_1.talkMaxDuration)

			if var_618_8 <= arg_615_1.time_ and arg_615_1.time_ < var_618_8 + var_618_9 then
				arg_615_1.typewritter.percent = (arg_615_1.time_ - var_618_8) / var_618_9

				arg_615_1.typewritter:SetDirty()
			end

			if arg_615_1.time_ >= var_618_8 + var_618_9 and arg_615_1.time_ < var_618_8 + var_618_9 + arg_618_0 then
				arg_615_1.typewritter.percent = 1

				arg_615_1.typewritter:SetDirty()
				arg_615_1:ShowNextGo(true)
			end
		end
	end,
	Play910601160 = function(arg_621_0, arg_621_1)
		arg_621_1.time_ = 0
		arg_621_1.frameCnt_ = 0
		arg_621_1.state_ = "playing"
		arg_621_1.curTalkId_ = 910601160
		arg_621_1.duration_ = 9

		SetActive(arg_621_1.tipsGo_, false)

		function arg_621_1.onSingleLineFinish_()
			arg_621_1.onSingleLineUpdate_ = nil
			arg_621_1.onSingleLineFinish_ = nil
			arg_621_1.state_ = "waiting"
		end

		function arg_621_1.playNext_(arg_623_0)
			if arg_623_0 == 1 then
				arg_621_0:Play910601161(arg_621_1)
			end
		end

		function arg_621_1.onSingleLineUpdate_(arg_624_0)
			local var_624_0 = 0

			if var_624_0 < arg_621_1.time_ and arg_621_1.time_ <= var_624_0 + arg_624_0 then
				arg_621_1.mask_.enabled = true
				arg_621_1.mask_.raycastTarget = true

				arg_621_1:SetGaussion(false)
			end

			local var_624_1 = 2

			if var_624_0 <= arg_621_1.time_ and arg_621_1.time_ < var_624_0 + var_624_1 then
				local var_624_2 = (arg_621_1.time_ - var_624_0) / var_624_1
				local var_624_3 = Color.New(0, 0, 0)

				var_624_3.a = Mathf.Lerp(0, 1, var_624_2)
				arg_621_1.mask_.color = var_624_3
			end

			if arg_621_1.time_ >= var_624_0 + var_624_1 and arg_621_1.time_ < var_624_0 + var_624_1 + arg_624_0 then
				local var_624_4 = Color.New(0, 0, 0)

				var_624_4.a = 1
				arg_621_1.mask_.color = var_624_4
			end

			local var_624_5 = 2

			if var_624_5 < arg_621_1.time_ and arg_621_1.time_ <= var_624_5 + arg_624_0 then
				arg_621_1.mask_.enabled = true
				arg_621_1.mask_.raycastTarget = true

				arg_621_1:SetGaussion(false)
			end

			local var_624_6 = 2

			if var_624_5 <= arg_621_1.time_ and arg_621_1.time_ < var_624_5 + var_624_6 then
				local var_624_7 = (arg_621_1.time_ - var_624_5) / var_624_6
				local var_624_8 = Color.New(0, 0, 0)

				var_624_8.a = Mathf.Lerp(1, 0, var_624_7)
				arg_621_1.mask_.color = var_624_8
			end

			if arg_621_1.time_ >= var_624_5 + var_624_6 and arg_621_1.time_ < var_624_5 + var_624_6 + arg_624_0 then
				local var_624_9 = Color.New(0, 0, 0)
				local var_624_10 = 0

				arg_621_1.mask_.enabled = false
				var_624_9.a = var_624_10
				arg_621_1.mask_.color = var_624_9
			end

			local var_624_11 = 2

			if var_624_11 < arg_621_1.time_ and arg_621_1.time_ <= var_624_11 + arg_624_0 then
				local var_624_12 = manager.ui.mainCamera.transform.localPosition
				local var_624_13 = Vector3.New(0, 0, 10) + Vector3.New(var_624_12.x, var_624_12.y, 0)
				local var_624_14 = arg_621_1.bgs_.ST60

				var_624_14.transform.localPosition = var_624_13
				var_624_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_624_15 = var_624_14:GetComponent("SpriteRenderer")

				if var_624_15 and var_624_15.sprite then
					local var_624_16 = (var_624_14.transform.localPosition - var_624_12).z
					local var_624_17 = manager.ui.mainCameraCom_
					local var_624_18 = 2 * var_624_16 * Mathf.Tan(var_624_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_624_19 = var_624_18 * var_624_17.aspect
					local var_624_20 = var_624_15.sprite.bounds.size.x
					local var_624_21 = var_624_15.sprite.bounds.size.y
					local var_624_22 = var_624_19 / var_624_20
					local var_624_23 = var_624_18 / var_624_21
					local var_624_24 = var_624_23 < var_624_22 and var_624_22 or var_624_23

					var_624_14.transform.localScale = Vector3.New(var_624_24, var_624_24, 0)
				end

				for iter_624_0, iter_624_1 in pairs(arg_621_1.bgs_) do
					if iter_624_0 ~= "ST60" then
						iter_624_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_621_1.frameCnt_ <= 1 then
				arg_621_1.dialog_:SetActive(false)
			end

			local var_624_25 = 4
			local var_624_26 = 0.125

			if var_624_25 < arg_621_1.time_ and arg_621_1.time_ <= var_624_25 + arg_624_0 then
				arg_621_1.talkMaxDuration = 0

				arg_621_1.dialog_:SetActive(true)

				local var_624_27 = LeanTween.value(arg_621_1.dialog_, 0, 1, 0.3)

				var_624_27:setOnUpdate(LuaHelper.FloatAction(function(arg_625_0)
					arg_621_1.dialogCg_.alpha = arg_625_0
				end))
				var_624_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_621_1.dialog_)
					var_624_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_621_1.duration_ = arg_621_1.duration_ + 0.3

				SetActive(arg_621_1.leftNameGo_, true)

				local var_624_28 = arg_621_1:FormatText(StoryNameCfg[7].name)

				arg_621_1.leftNameTxt_.text = var_624_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_621_1.leftNameTxt_.transform)

				arg_621_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_621_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_621_1:RecordName(arg_621_1.leftNameTxt_.text)
				SetActive(arg_621_1.iconTrs_.gameObject, false)
				arg_621_1.callingController_:SetSelectedState("normal")

				local var_624_29 = arg_621_1:GetWordFromCfg(910601160)
				local var_624_30 = arg_621_1:FormatText(var_624_29.content)

				arg_621_1.text_.text = var_624_30

				LuaForUtil.ClearLinePrefixSymbol(arg_621_1.text_)

				local var_624_31 = 5
				local var_624_32 = utf8.len(var_624_30)
				local var_624_33 = var_624_31 <= 0 and var_624_26 or var_624_26 * (var_624_32 / var_624_31)

				if var_624_33 > 0 and var_624_26 < var_624_33 then
					arg_621_1.talkMaxDuration = var_624_33
					var_624_25 = var_624_25 + 0.3

					if var_624_33 + var_624_25 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_33 + var_624_25
					end
				end

				arg_621_1.text_.text = var_624_30
				arg_621_1.typewritter.percent = 0

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(false)
				arg_621_1:RecordContent(arg_621_1.text_.text)
			end

			local var_624_34 = var_624_25 + 0.3
			local var_624_35 = math.max(var_624_26, arg_621_1.talkMaxDuration)

			if var_624_34 <= arg_621_1.time_ and arg_621_1.time_ < var_624_34 + var_624_35 then
				arg_621_1.typewritter.percent = (arg_621_1.time_ - var_624_34) / var_624_35

				arg_621_1.typewritter:SetDirty()
			end

			if arg_621_1.time_ >= var_624_34 + var_624_35 and arg_621_1.time_ < var_624_34 + var_624_35 + arg_624_0 then
				arg_621_1.typewritter.percent = 1

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(true)
			end
		end
	end,
	Play910601161 = function(arg_627_0, arg_627_1)
		arg_627_1.time_ = 0
		arg_627_1.frameCnt_ = 0
		arg_627_1.state_ = "playing"
		arg_627_1.curTalkId_ = 910601161
		arg_627_1.duration_ = 4

		SetActive(arg_627_1.tipsGo_, false)

		function arg_627_1.onSingleLineFinish_()
			arg_627_1.onSingleLineUpdate_ = nil
			arg_627_1.onSingleLineFinish_ = nil
			arg_627_1.state_ = "waiting"
			arg_627_1.auto_ = false
		end

		function arg_627_1.playNext_(arg_629_0)
			arg_627_1.onStoryFinished_()
		end

		function arg_627_1.onSingleLineUpdate_(arg_630_0)
			local var_630_0 = arg_627_1.actors_["1011ui_story"].transform
			local var_630_1 = 2

			if var_630_1 < arg_627_1.time_ and arg_627_1.time_ <= var_630_1 + arg_630_0 then
				arg_627_1.var_.moveOldPos1011ui_story = var_630_0.localPosition
			end

			local var_630_2 = 0.001

			if var_630_1 <= arg_627_1.time_ and arg_627_1.time_ < var_630_1 + var_630_2 then
				local var_630_3 = (arg_627_1.time_ - var_630_1) / var_630_2
				local var_630_4 = Vector3.New(0.7, -0.71, -6)

				var_630_0.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos1011ui_story, var_630_4, var_630_3)

				local var_630_5 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_5.x, var_630_5.y, var_630_5.z)

				local var_630_6 = var_630_0.localEulerAngles

				var_630_6.z = 0
				var_630_6.x = 0
				var_630_0.localEulerAngles = var_630_6
			end

			if arg_627_1.time_ >= var_630_1 + var_630_2 and arg_627_1.time_ < var_630_1 + var_630_2 + arg_630_0 then
				var_630_0.localPosition = Vector3.New(0.7, -0.71, -6)

				local var_630_7 = manager.ui.mainCamera.transform.position - var_630_0.position

				var_630_0.forward = Vector3.New(var_630_7.x, var_630_7.y, var_630_7.z)

				local var_630_8 = var_630_0.localEulerAngles

				var_630_8.z = 0
				var_630_8.x = 0
				var_630_0.localEulerAngles = var_630_8
			end

			local var_630_9 = arg_627_1.actors_["1011ui_story"]
			local var_630_10 = 2

			if var_630_10 < arg_627_1.time_ and arg_627_1.time_ <= var_630_10 + arg_630_0 and arg_627_1.var_.characterEffect1011ui_story == nil then
				arg_627_1.var_.characterEffect1011ui_story = var_630_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_11 = 0.200000002980232

			if var_630_10 <= arg_627_1.time_ and arg_627_1.time_ < var_630_10 + var_630_11 then
				local var_630_12 = (arg_627_1.time_ - var_630_10) / var_630_11

				if arg_627_1.var_.characterEffect1011ui_story then
					arg_627_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_627_1.time_ >= var_630_10 + var_630_11 and arg_627_1.time_ < var_630_10 + var_630_11 + arg_630_0 and arg_627_1.var_.characterEffect1011ui_story then
				arg_627_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_630_13 = 2

			if var_630_13 < arg_627_1.time_ and arg_627_1.time_ <= var_630_13 + arg_630_0 then
				arg_627_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_1")
			end

			local var_630_14 = 2

			if var_630_14 < arg_627_1.time_ and arg_627_1.time_ <= var_630_14 + arg_630_0 then
				arg_627_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_630_15 = arg_627_1.actors_["1084ui_story"].transform
			local var_630_16 = 2

			if var_630_16 < arg_627_1.time_ and arg_627_1.time_ <= var_630_16 + arg_630_0 then
				arg_627_1.var_.moveOldPos1084ui_story = var_630_15.localPosition
			end

			local var_630_17 = 0.001

			if var_630_16 <= arg_627_1.time_ and arg_627_1.time_ < var_630_16 + var_630_17 then
				local var_630_18 = (arg_627_1.time_ - var_630_16) / var_630_17
				local var_630_19 = Vector3.New(0, -0.97, -6)

				var_630_15.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos1084ui_story, var_630_19, var_630_18)

				local var_630_20 = manager.ui.mainCamera.transform.position - var_630_15.position

				var_630_15.forward = Vector3.New(var_630_20.x, var_630_20.y, var_630_20.z)

				local var_630_21 = var_630_15.localEulerAngles

				var_630_21.z = 0
				var_630_21.x = 0
				var_630_15.localEulerAngles = var_630_21
			end

			if arg_627_1.time_ >= var_630_16 + var_630_17 and arg_627_1.time_ < var_630_16 + var_630_17 + arg_630_0 then
				var_630_15.localPosition = Vector3.New(0, -0.97, -6)

				local var_630_22 = manager.ui.mainCamera.transform.position - var_630_15.position

				var_630_15.forward = Vector3.New(var_630_22.x, var_630_22.y, var_630_22.z)

				local var_630_23 = var_630_15.localEulerAngles

				var_630_23.z = 0
				var_630_23.x = 0
				var_630_15.localEulerAngles = var_630_23
			end

			local var_630_24 = arg_627_1.actors_["1084ui_story"].transform
			local var_630_25 = 2

			if var_630_25 < arg_627_1.time_ and arg_627_1.time_ <= var_630_25 + arg_630_0 then
				arg_627_1.var_.moveOldPos1084ui_story = var_630_24.localPosition
			end

			local var_630_26 = 0.001

			if var_630_25 <= arg_627_1.time_ and arg_627_1.time_ < var_630_25 + var_630_26 then
				local var_630_27 = (arg_627_1.time_ - var_630_25) / var_630_26
				local var_630_28 = Vector3.New(0, -0.97, -6)

				var_630_24.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos1084ui_story, var_630_28, var_630_27)

				local var_630_29 = manager.ui.mainCamera.transform.position - var_630_24.position

				var_630_24.forward = Vector3.New(var_630_29.x, var_630_29.y, var_630_29.z)

				local var_630_30 = var_630_24.localEulerAngles

				var_630_30.z = 0
				var_630_30.x = 0
				var_630_24.localEulerAngles = var_630_30
			end

			if arg_627_1.time_ >= var_630_25 + var_630_26 and arg_627_1.time_ < var_630_25 + var_630_26 + arg_630_0 then
				var_630_24.localPosition = Vector3.New(0, -0.97, -6)

				local var_630_31 = manager.ui.mainCamera.transform.position - var_630_24.position

				var_630_24.forward = Vector3.New(var_630_31.x, var_630_31.y, var_630_31.z)

				local var_630_32 = var_630_24.localEulerAngles

				var_630_32.z = 0
				var_630_32.x = 0
				var_630_24.localEulerAngles = var_630_32
			end

			local var_630_33 = 2

			if var_630_33 < arg_627_1.time_ and arg_627_1.time_ <= var_630_33 + arg_630_0 then
				arg_627_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_630_34 = 2

			if var_630_34 < arg_627_1.time_ and arg_627_1.time_ <= var_630_34 + arg_630_0 then
				arg_627_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_630_35 = arg_627_1.actors_["1084ui_story"]
			local var_630_36 = 2

			if var_630_36 < arg_627_1.time_ and arg_627_1.time_ <= var_630_36 + arg_630_0 and arg_627_1.var_.characterEffect1084ui_story == nil then
				arg_627_1.var_.characterEffect1084ui_story = var_630_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_37 = 0.200000002980232

			if var_630_36 <= arg_627_1.time_ and arg_627_1.time_ < var_630_36 + var_630_37 then
				local var_630_38 = (arg_627_1.time_ - var_630_36) / var_630_37

				if arg_627_1.var_.characterEffect1084ui_story then
					arg_627_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_627_1.time_ >= var_630_36 + var_630_37 and arg_627_1.time_ < var_630_36 + var_630_37 + arg_630_0 and arg_627_1.var_.characterEffect1084ui_story then
				arg_627_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_630_39 = arg_627_1.actors_["1028ui_story"].transform
			local var_630_40 = 2

			if var_630_40 < arg_627_1.time_ and arg_627_1.time_ <= var_630_40 + arg_630_0 then
				arg_627_1.var_.moveOldPos1028ui_story = var_630_39.localPosition
			end

			local var_630_41 = 0.001

			if var_630_40 <= arg_627_1.time_ and arg_627_1.time_ < var_630_40 + var_630_41 then
				local var_630_42 = (arg_627_1.time_ - var_630_40) / var_630_41
				local var_630_43 = Vector3.New(-0.7, -0.9, -5.9)

				var_630_39.localPosition = Vector3.Lerp(arg_627_1.var_.moveOldPos1028ui_story, var_630_43, var_630_42)

				local var_630_44 = manager.ui.mainCamera.transform.position - var_630_39.position

				var_630_39.forward = Vector3.New(var_630_44.x, var_630_44.y, var_630_44.z)

				local var_630_45 = var_630_39.localEulerAngles

				var_630_45.z = 0
				var_630_45.x = 0
				var_630_39.localEulerAngles = var_630_45
			end

			if arg_627_1.time_ >= var_630_40 + var_630_41 and arg_627_1.time_ < var_630_40 + var_630_41 + arg_630_0 then
				var_630_39.localPosition = Vector3.New(-0.7, -0.9, -5.9)

				local var_630_46 = manager.ui.mainCamera.transform.position - var_630_39.position

				var_630_39.forward = Vector3.New(var_630_46.x, var_630_46.y, var_630_46.z)

				local var_630_47 = var_630_39.localEulerAngles

				var_630_47.z = 0
				var_630_47.x = 0
				var_630_39.localEulerAngles = var_630_47
			end

			local var_630_48 = arg_627_1.actors_["1028ui_story"]
			local var_630_49 = 2

			if var_630_49 < arg_627_1.time_ and arg_627_1.time_ <= var_630_49 + arg_630_0 and arg_627_1.var_.characterEffect1028ui_story == nil then
				arg_627_1.var_.characterEffect1028ui_story = var_630_48:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_630_50 = 0.200000002980232

			if var_630_49 <= arg_627_1.time_ and arg_627_1.time_ < var_630_49 + var_630_50 then
				local var_630_51 = (arg_627_1.time_ - var_630_49) / var_630_50

				if arg_627_1.var_.characterEffect1028ui_story then
					arg_627_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_627_1.time_ >= var_630_49 + var_630_50 and arg_627_1.time_ < var_630_49 + var_630_50 + arg_630_0 and arg_627_1.var_.characterEffect1028ui_story then
				arg_627_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_630_52 = 2

			if var_630_52 < arg_627_1.time_ and arg_627_1.time_ <= var_630_52 + arg_630_0 then
				arg_627_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action6_1")
			end

			local var_630_53 = 2

			if var_630_53 < arg_627_1.time_ and arg_627_1.time_ <= var_630_53 + arg_630_0 then
				arg_627_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_630_54 = 2

			if var_630_54 < arg_627_1.time_ and arg_627_1.time_ <= var_630_54 + arg_630_0 then
				arg_627_1.mask_.enabled = true
				arg_627_1.mask_.raycastTarget = true

				arg_627_1:SetGaussion(false)
			end

			local var_630_55 = 0.034000001847744

			if var_630_54 <= arg_627_1.time_ and arg_627_1.time_ < var_630_54 + var_630_55 then
				local var_630_56 = (arg_627_1.time_ - var_630_54) / var_630_55
				local var_630_57 = Color.New(1, 1, 1)

				var_630_57.a = Mathf.Lerp(1, 0, var_630_56)
				arg_627_1.mask_.color = var_630_57
			end

			if arg_627_1.time_ >= var_630_54 + var_630_55 and arg_627_1.time_ < var_630_54 + var_630_55 + arg_630_0 then
				local var_630_58 = Color.New(1, 1, 1)
				local var_630_59 = 0

				arg_627_1.mask_.enabled = false
				var_630_58.a = var_630_59
				arg_627_1.mask_.color = var_630_58
			end

			local var_630_60 = 0

			if var_630_60 < arg_627_1.time_ and arg_627_1.time_ <= var_630_60 + arg_630_0 then
				arg_627_1.mask_.enabled = true
				arg_627_1.mask_.raycastTarget = true

				arg_627_1:SetGaussion(false)
			end

			local var_630_61 = 1

			if var_630_60 <= arg_627_1.time_ and arg_627_1.time_ < var_630_60 + var_630_61 then
				local var_630_62 = (arg_627_1.time_ - var_630_60) / var_630_61
				local var_630_63 = Color.New(1, 1, 1)

				var_630_63.a = Mathf.Lerp(0, 1, var_630_62)
				arg_627_1.mask_.color = var_630_63
			end

			if arg_627_1.time_ >= var_630_60 + var_630_61 and arg_627_1.time_ < var_630_60 + var_630_61 + arg_630_0 then
				local var_630_64 = Color.New(1, 1, 1)

				var_630_64.a = 1
				arg_627_1.mask_.color = var_630_64
			end

			local var_630_65 = 1

			if var_630_65 < arg_627_1.time_ and arg_627_1.time_ <= var_630_65 + arg_630_0 then
				arg_627_1.mask_.enabled = true
				arg_627_1.mask_.raycastTarget = true

				arg_627_1:SetGaussion(false)
			end

			local var_630_66 = 1.20000000298023

			if var_630_65 <= arg_627_1.time_ and arg_627_1.time_ < var_630_65 + var_630_66 then
				local var_630_67 = (arg_627_1.time_ - var_630_65) / var_630_66
				local var_630_68 = Color.New(1, 1, 1)

				var_630_68.a = Mathf.Lerp(1, 0, var_630_67)
				arg_627_1.mask_.color = var_630_68
			end

			if arg_627_1.time_ >= var_630_65 + var_630_66 and arg_627_1.time_ < var_630_65 + var_630_66 + arg_630_0 then
				local var_630_69 = Color.New(1, 1, 1)
				local var_630_70 = 0

				arg_627_1.mask_.enabled = false
				var_630_69.a = var_630_70
				arg_627_1.mask_.color = var_630_69
			end

			local var_630_71 = 1

			if var_630_71 < arg_627_1.time_ and arg_627_1.time_ <= var_630_71 + arg_630_0 then
				local var_630_72 = manager.ui.mainCamera.transform.localPosition
				local var_630_73 = Vector3.New(0, 0, 10) + Vector3.New(var_630_72.x, var_630_72.y, 0)
				local var_630_74 = arg_627_1.bgs_.ST60

				var_630_74.transform.localPosition = var_630_73
				var_630_74.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_630_75 = var_630_74:GetComponent("SpriteRenderer")

				if var_630_75 and var_630_75.sprite then
					local var_630_76 = (var_630_74.transform.localPosition - var_630_72).z
					local var_630_77 = manager.ui.mainCameraCom_
					local var_630_78 = 2 * var_630_76 * Mathf.Tan(var_630_77.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_630_79 = var_630_78 * var_630_77.aspect
					local var_630_80 = var_630_75.sprite.bounds.size.x
					local var_630_81 = var_630_75.sprite.bounds.size.y
					local var_630_82 = var_630_79 / var_630_80
					local var_630_83 = var_630_78 / var_630_81
					local var_630_84 = var_630_83 < var_630_82 and var_630_82 or var_630_83

					var_630_74.transform.localScale = Vector3.New(var_630_84, var_630_84, 0)
				end

				for iter_630_0, iter_630_1 in pairs(arg_627_1.bgs_) do
					if iter_630_0 ~= "ST60" then
						iter_630_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_627_1.frameCnt_ <= 1 then
				arg_627_1.dialog_:SetActive(false)
			end

			local var_630_85 = 2
			local var_630_86 = 0.6

			if var_630_85 < arg_627_1.time_ and arg_627_1.time_ <= var_630_85 + arg_630_0 then
				arg_627_1.talkMaxDuration = 0

				arg_627_1.dialog_:SetActive(true)

				local var_630_87 = LeanTween.value(arg_627_1.dialog_, 0, 1, 0.3)

				var_630_87:setOnUpdate(LuaHelper.FloatAction(function(arg_631_0)
					arg_627_1.dialogCg_.alpha = arg_631_0
				end))
				var_630_87:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_627_1.dialog_)
					var_630_87:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_627_1.duration_ = arg_627_1.duration_ + 0.3

				SetActive(arg_627_1.leftNameGo_, true)

				local var_630_88 = arg_627_1:FormatText(StoryNameCfg[330].name)

				arg_627_1.leftNameTxt_.text = var_630_88

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_627_1.leftNameTxt_.transform)

				arg_627_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_627_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_627_1:RecordName(arg_627_1.leftNameTxt_.text)
				SetActive(arg_627_1.iconTrs_.gameObject, false)
				arg_627_1.callingController_:SetSelectedState("normal")

				local var_630_89 = arg_627_1:GetWordFromCfg(910601161)
				local var_630_90 = arg_627_1:FormatText(var_630_89.content)

				arg_627_1.text_.text = var_630_90

				LuaForUtil.ClearLinePrefixSymbol(arg_627_1.text_)

				local var_630_91 = 5
				local var_630_92 = utf8.len(var_630_90)
				local var_630_93 = var_630_91 <= 0 and var_630_86 or var_630_86 * (var_630_92 / var_630_91)

				if var_630_93 > 0 and var_630_86 < var_630_93 then
					arg_627_1.talkMaxDuration = var_630_93
					var_630_85 = var_630_85 + 0.3

					if var_630_93 + var_630_85 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_93 + var_630_85
					end
				end

				arg_627_1.text_.text = var_630_90
				arg_627_1.typewritter.percent = 0

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601161", "story_v_out_910601.awb") ~= 0 then
					local var_630_94 = manager.audio:GetVoiceLength("story_v_out_910601", "910601161", "story_v_out_910601.awb") / 1000

					if var_630_94 + var_630_85 > arg_627_1.duration_ then
						arg_627_1.duration_ = var_630_94 + var_630_85
					end

					if var_630_89.prefab_name ~= "" and arg_627_1.actors_[var_630_89.prefab_name] ~= nil then
						local var_630_95 = LuaForUtil.PlayVoiceWithCriLipsync(arg_627_1.actors_[var_630_89.prefab_name].transform, "story_v_out_910601", "910601161", "story_v_out_910601.awb")

						arg_627_1:RecordAudio("910601161", var_630_95)
						arg_627_1:RecordAudio("910601161", var_630_95)
					else
						arg_627_1:AudioAction("play", "voice", "story_v_out_910601", "910601161", "story_v_out_910601.awb")
					end

					arg_627_1:RecordHistoryTalkVoice("story_v_out_910601", "910601161", "story_v_out_910601.awb")
				end

				arg_627_1:RecordContent(arg_627_1.text_.text)
			end

			local var_630_96 = var_630_85 + 0.3
			local var_630_97 = math.max(var_630_86, arg_627_1.talkMaxDuration)

			if var_630_96 <= arg_627_1.time_ and arg_627_1.time_ < var_630_96 + var_630_97 then
				arg_627_1.typewritter.percent = (arg_627_1.time_ - var_630_96) / var_630_97

				arg_627_1.typewritter:SetDirty()
			end

			if arg_627_1.time_ >= var_630_96 + var_630_97 and arg_627_1.time_ < var_630_96 + var_630_97 + arg_630_0 then
				arg_627_1.typewritter.percent = 1

				arg_627_1.typewritter:SetDirty()
				arg_627_1:ShowNextGo(true)
			end
		end
	end,
	Play910601072 = function(arg_633_0, arg_633_1)
		arg_633_1.time_ = 0
		arg_633_1.frameCnt_ = 0
		arg_633_1.state_ = "playing"
		arg_633_1.curTalkId_ = 910601072
		arg_633_1.duration_ = 2

		SetActive(arg_633_1.tipsGo_, false)

		function arg_633_1.onSingleLineFinish_()
			arg_633_1.onSingleLineUpdate_ = nil
			arg_633_1.onSingleLineFinish_ = nil
			arg_633_1.state_ = "waiting"
		end

		function arg_633_1.playNext_(arg_635_0)
			if arg_635_0 == 1 then
				arg_633_0:Play910601073(arg_633_1)
			end
		end

		function arg_633_1.onSingleLineUpdate_(arg_636_0)
			local var_636_0 = arg_633_1.actors_["1028ui_story"].transform
			local var_636_1 = 0

			if var_636_1 < arg_633_1.time_ and arg_633_1.time_ <= var_636_1 + arg_636_0 then
				arg_633_1.var_.moveOldPos1028ui_story = var_636_0.localPosition
			end

			local var_636_2 = 0.001

			if var_636_1 <= arg_633_1.time_ and arg_633_1.time_ < var_636_1 + var_636_2 then
				local var_636_3 = (arg_633_1.time_ - var_636_1) / var_636_2
				local var_636_4 = Vector3.New(0.7, -0.9, -5.9)

				var_636_0.localPosition = Vector3.Lerp(arg_633_1.var_.moveOldPos1028ui_story, var_636_4, var_636_3)

				local var_636_5 = manager.ui.mainCamera.transform.position - var_636_0.position

				var_636_0.forward = Vector3.New(var_636_5.x, var_636_5.y, var_636_5.z)

				local var_636_6 = var_636_0.localEulerAngles

				var_636_6.z = 0
				var_636_6.x = 0
				var_636_0.localEulerAngles = var_636_6
			end

			if arg_633_1.time_ >= var_636_1 + var_636_2 and arg_633_1.time_ < var_636_1 + var_636_2 + arg_636_0 then
				var_636_0.localPosition = Vector3.New(0.7, -0.9, -5.9)

				local var_636_7 = manager.ui.mainCamera.transform.position - var_636_0.position

				var_636_0.forward = Vector3.New(var_636_7.x, var_636_7.y, var_636_7.z)

				local var_636_8 = var_636_0.localEulerAngles

				var_636_8.z = 0
				var_636_8.x = 0
				var_636_0.localEulerAngles = var_636_8
			end

			local var_636_9 = arg_633_1.actors_["1028ui_story"]
			local var_636_10 = 0

			if var_636_10 < arg_633_1.time_ and arg_633_1.time_ <= var_636_10 + arg_636_0 and arg_633_1.var_.characterEffect1028ui_story == nil then
				arg_633_1.var_.characterEffect1028ui_story = var_636_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_636_11 = 0.200000002980232

			if var_636_10 <= arg_633_1.time_ and arg_633_1.time_ < var_636_10 + var_636_11 then
				local var_636_12 = (arg_633_1.time_ - var_636_10) / var_636_11

				if arg_633_1.var_.characterEffect1028ui_story then
					arg_633_1.var_.characterEffect1028ui_story.fillFlat = false
				end
			end

			if arg_633_1.time_ >= var_636_10 + var_636_11 and arg_633_1.time_ < var_636_10 + var_636_11 + arg_636_0 and arg_633_1.var_.characterEffect1028ui_story then
				arg_633_1.var_.characterEffect1028ui_story.fillFlat = false
			end

			local var_636_13 = "1028ui_story"

			if arg_633_1.actors_[var_636_13] == nil then
				local var_636_14 = Object.Instantiate(Asset.Load("Char/" .. var_636_13), arg_633_1.stage_.transform)

				var_636_14.name = var_636_13
				var_636_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_633_1.actors_[var_636_13] = var_636_14

				local var_636_15 = var_636_14:GetComponentInChildren(typeof(CharacterEffect))

				var_636_15.enabled = true

				local var_636_16 = GameObjectTools.GetOrAddComponent(var_636_14, typeof(DynamicBoneHelper))

				if var_636_16 then
					var_636_16:EnableDynamicBone(false)
				end

				arg_633_1:ShowWeapon(var_636_15.transform, false)

				arg_633_1.var_[var_636_13 .. "Animator"] = var_636_15.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_633_1.var_[var_636_13 .. "Animator"].applyRootMotion = true
				arg_633_1.var_[var_636_13 .. "LipSync"] = var_636_15.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_636_17 = 0

			if var_636_17 < arg_633_1.time_ and arg_633_1.time_ <= var_636_17 + arg_636_0 then
				arg_633_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/1028/1028action/1028action1_1")
			end

			local var_636_18 = "1028ui_story"

			if arg_633_1.actors_[var_636_18] == nil then
				local var_636_19 = Object.Instantiate(Asset.Load("Char/" .. var_636_18), arg_633_1.stage_.transform)

				var_636_19.name = var_636_18
				var_636_19.transform.localPosition = Vector3.New(0, 100, 0)
				arg_633_1.actors_[var_636_18] = var_636_19

				local var_636_20 = var_636_19:GetComponentInChildren(typeof(CharacterEffect))

				var_636_20.enabled = true

				local var_636_21 = GameObjectTools.GetOrAddComponent(var_636_19, typeof(DynamicBoneHelper))

				if var_636_21 then
					var_636_21:EnableDynamicBone(false)
				end

				arg_633_1:ShowWeapon(var_636_20.transform, false)

				arg_633_1.var_[var_636_18 .. "Animator"] = var_636_20.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_633_1.var_[var_636_18 .. "Animator"].applyRootMotion = true
				arg_633_1.var_[var_636_18 .. "LipSync"] = var_636_20.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_636_22 = 0

			if var_636_22 < arg_633_1.time_ and arg_633_1.time_ <= var_636_22 + arg_636_0 then
				arg_633_1:PlayTimeline("1028ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_636_23 = 0
			local var_636_24 = 0.125

			if var_636_23 < arg_633_1.time_ and arg_633_1.time_ <= var_636_23 + arg_636_0 then
				arg_633_1.talkMaxDuration = 0
				arg_633_1.dialogCg_.alpha = 1

				arg_633_1.dialog_:SetActive(true)
				SetActive(arg_633_1.leftNameGo_, true)

				local var_636_25 = arg_633_1:FormatText(StoryNameCfg[327].name)

				arg_633_1.leftNameTxt_.text = var_636_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_633_1.leftNameTxt_.transform)

				arg_633_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_633_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_633_1:RecordName(arg_633_1.leftNameTxt_.text)
				SetActive(arg_633_1.iconTrs_.gameObject, false)
				arg_633_1.callingController_:SetSelectedState("normal")

				local var_636_26 = arg_633_1:GetWordFromCfg(910601072)
				local var_636_27 = arg_633_1:FormatText(var_636_26.content)

				arg_633_1.text_.text = var_636_27

				LuaForUtil.ClearLinePrefixSymbol(arg_633_1.text_)

				local var_636_28 = 5
				local var_636_29 = utf8.len(var_636_27)
				local var_636_30 = var_636_28 <= 0 and var_636_24 or var_636_24 * (var_636_29 / var_636_28)

				if var_636_30 > 0 and var_636_24 < var_636_30 then
					arg_633_1.talkMaxDuration = var_636_30

					if var_636_30 + var_636_23 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_30 + var_636_23
					end
				end

				arg_633_1.text_.text = var_636_27
				arg_633_1.typewritter.percent = 0

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_910601", "910601072", "story_v_out_910601.awb") ~= 0 then
					local var_636_31 = manager.audio:GetVoiceLength("story_v_out_910601", "910601072", "story_v_out_910601.awb") / 1000

					if var_636_31 + var_636_23 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_31 + var_636_23
					end

					if var_636_26.prefab_name ~= "" and arg_633_1.actors_[var_636_26.prefab_name] ~= nil then
						local var_636_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_633_1.actors_[var_636_26.prefab_name].transform, "story_v_out_910601", "910601072", "story_v_out_910601.awb")

						arg_633_1:RecordAudio("910601072", var_636_32)
						arg_633_1:RecordAudio("910601072", var_636_32)
					else
						arg_633_1:AudioAction("play", "voice", "story_v_out_910601", "910601072", "story_v_out_910601.awb")
					end

					arg_633_1:RecordHistoryTalkVoice("story_v_out_910601", "910601072", "story_v_out_910601.awb")
				end

				arg_633_1:RecordContent(arg_633_1.text_.text)
			end

			local var_636_33 = math.max(var_636_24, arg_633_1.talkMaxDuration)

			if var_636_23 <= arg_633_1.time_ and arg_633_1.time_ < var_636_23 + var_636_33 then
				arg_633_1.typewritter.percent = (arg_633_1.time_ - var_636_23) / var_636_33

				arg_633_1.typewritter:SetDirty()
			end

			if arg_633_1.time_ >= var_636_23 + var_636_33 and arg_633_1.time_ < var_636_23 + var_636_33 + arg_636_0 then
				arg_633_1.typewritter.percent = 1

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(true)
			end
		end
	end,
	Play910601073 = function(arg_637_0, arg_637_1)
		arg_637_1.time_ = 0
		arg_637_1.frameCnt_ = 0
		arg_637_1.state_ = "playing"
		arg_637_1.curTalkId_ = 910601073
		arg_637_1.duration_ = 5

		SetActive(arg_637_1.tipsGo_, false)

		function arg_637_1.onSingleLineFinish_()
			arg_637_1.onSingleLineUpdate_ = nil
			arg_637_1.onSingleLineFinish_ = nil
			arg_637_1.state_ = "waiting"
		end

		function arg_637_1.playNext_(arg_639_0)
			if arg_639_0 == 1 then
				arg_637_0:Play910601074(arg_637_1)
			end
		end

		function arg_637_1.onSingleLineUpdate_(arg_640_0)
			local var_640_0 = arg_637_1.actors_["1028ui_story"]
			local var_640_1 = 0

			if var_640_1 < arg_637_1.time_ and arg_637_1.time_ <= var_640_1 + arg_640_0 and arg_637_1.var_.characterEffect1028ui_story == nil then
				arg_637_1.var_.characterEffect1028ui_story = var_640_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_640_2 = 0.200000002980232

			if var_640_1 <= arg_637_1.time_ and arg_637_1.time_ < var_640_1 + var_640_2 then
				local var_640_3 = (arg_637_1.time_ - var_640_1) / var_640_2

				if arg_637_1.var_.characterEffect1028ui_story then
					local var_640_4 = Mathf.Lerp(0, 0.5, var_640_3)

					arg_637_1.var_.characterEffect1028ui_story.fillFlat = true
					arg_637_1.var_.characterEffect1028ui_story.fillRatio = var_640_4
				end
			end

			if arg_637_1.time_ >= var_640_1 + var_640_2 and arg_637_1.time_ < var_640_1 + var_640_2 + arg_640_0 and arg_637_1.var_.characterEffect1028ui_story then
				local var_640_5 = 0.5

				arg_637_1.var_.characterEffect1028ui_story.fillFlat = true
				arg_637_1.var_.characterEffect1028ui_story.fillRatio = var_640_5
			end

			local var_640_6 = 0
			local var_640_7 = 1.125

			if var_640_6 < arg_637_1.time_ and arg_637_1.time_ <= var_640_6 + arg_640_0 then
				arg_637_1.talkMaxDuration = 0
				arg_637_1.dialogCg_.alpha = 1

				arg_637_1.dialog_:SetActive(true)
				SetActive(arg_637_1.leftNameGo_, false)

				arg_637_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_637_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_637_1:RecordName(arg_637_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_637_1.iconTrs_.gameObject, false)
				arg_637_1.callingController_:SetSelectedState("normal")

				local var_640_8 = arg_637_1:GetWordFromCfg(910601073)
				local var_640_9 = arg_637_1:FormatText(var_640_8.content)

				arg_637_1.text_.text = var_640_9

				LuaForUtil.ClearLinePrefixSymbol(arg_637_1.text_)

				local var_640_10 = 45
				local var_640_11 = utf8.len(var_640_9)
				local var_640_12 = var_640_10 <= 0 and var_640_7 or var_640_7 * (var_640_11 / var_640_10)

				if var_640_12 > 0 and var_640_7 < var_640_12 then
					arg_637_1.talkMaxDuration = var_640_12

					if var_640_12 + var_640_6 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_12 + var_640_6
					end
				end

				arg_637_1.text_.text = var_640_9
				arg_637_1.typewritter.percent = 0

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(false)
				arg_637_1:RecordContent(arg_637_1.text_.text)
			end

			local var_640_13 = math.max(var_640_7, arg_637_1.talkMaxDuration)

			if var_640_6 <= arg_637_1.time_ and arg_637_1.time_ < var_640_6 + var_640_13 then
				arg_637_1.typewritter.percent = (arg_637_1.time_ - var_640_6) / var_640_13

				arg_637_1.typewritter:SetDirty()
			end

			if arg_637_1.time_ >= var_640_6 + var_640_13 and arg_637_1.time_ < var_640_6 + var_640_13 + arg_640_0 then
				arg_637_1.typewritter.percent = 1

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(true)
			end
		end
	end,
	Play910601074 = function(arg_641_0, arg_641_1)
		arg_641_1.time_ = 0
		arg_641_1.frameCnt_ = 0
		arg_641_1.state_ = "playing"
		arg_641_1.curTalkId_ = 910601074
		arg_641_1.duration_ = 5

		SetActive(arg_641_1.tipsGo_, false)

		function arg_641_1.onSingleLineFinish_()
			arg_641_1.onSingleLineUpdate_ = nil
			arg_641_1.onSingleLineFinish_ = nil
			arg_641_1.state_ = "waiting"
		end

		function arg_641_1.playNext_(arg_643_0)
			if arg_643_0 == 1 then
				arg_641_0:Play910601075(arg_641_1)
			end
		end

		function arg_641_1.onSingleLineUpdate_(arg_644_0)
			local var_644_0 = 0
			local var_644_1 = 0.575

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

				local var_644_3 = arg_641_1:GetWordFromCfg(910601074)
				local var_644_4 = arg_641_1:FormatText(var_644_3.content)

				arg_641_1.text_.text = var_644_4

				LuaForUtil.ClearLinePrefixSymbol(arg_641_1.text_)

				local var_644_5 = 23
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST60",
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0201",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R1102",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R2802",
		"Assets/UIResources/UI_AB/TextureConfig/Background/R4802"
	},
	voices = {
		"story_v_out_910601.awb"
	}
}
