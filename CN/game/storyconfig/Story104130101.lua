﻿return {
	Play413011001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 413011001
		arg_1_1.duration_ = 7.57

		local var_1_0 = {
			zh = 6.5,
			ja = 7.566
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
				arg_1_0:Play413011002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F08l"

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
				local var_4_5 = arg_1_1.bgs_.F08l

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
					if iter_4_0 ~= "F08l" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 2

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_17 = 0.3

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_19 = 2

			if var_4_18 <= arg_1_1.time_ and arg_1_1.time_ < var_4_18 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_18) / var_4_19
				local var_4_21 = Color.New(0, 0, 0)

				var_4_21.a = Mathf.Lerp(1, 0, var_4_20)
				arg_1_1.mask_.color = var_4_21
			end

			if arg_1_1.time_ >= var_4_18 + var_4_19 and arg_1_1.time_ < var_4_18 + var_4_19 + arg_4_0 then
				local var_4_22 = Color.New(0, 0, 0)
				local var_4_23 = 0

				arg_1_1.mask_.enabled = false
				var_4_22.a = var_4_23
				arg_1_1.mask_.color = var_4_22
			end

			local var_4_24 = 0
			local var_4_25 = 0.266666666666667

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_26 = "play"
				local var_4_27 = "music"

				arg_1_1:AudioAction(var_4_26, var_4_27, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_28 = ""
				local var_4_29 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_29 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_29 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_29

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_29
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

			local var_4_30 = 0.366666666666667
			local var_4_31 = 0.833333333333333

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_3_4_story_crete", "bgm_activity_3_4_story_crete", "bgm_activity_3_4_story_crete.awb")

				local var_4_34 = ""
				local var_4_35 = manager.audio:GetAudioName("bgm_activity_3_4_story_crete", "bgm_activity_3_4_story_crete")

				if var_4_35 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_35 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_35

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_35
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

			local var_4_36 = 0.366666666666667
			local var_4_37 = 1

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				local var_4_38 = "play"
				local var_4_39 = "effect"

				arg_1_1:AudioAction(var_4_38, var_4_39, "se_story_134_01", "se_story_134_01_crowd02", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_40 = 2
			local var_4_41 = 0.475

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_42 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_42:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_43 = arg_1_1:FormatText(StoryNameCfg[992].name)

				arg_1_1.leftNameTxt_.text = var_4_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_1_1.callingController_:SetSelectedState("normal")

				arg_1_1.keyicon_.color = Color.New(1, 1, 1)
				arg_1_1.icon_.color = Color.New(1, 1, 1)

				local var_4_44 = arg_1_1:GetWordFromCfg(413011001)
				local var_4_45 = arg_1_1:FormatText(var_4_44.content)

				arg_1_1.text_.text = var_4_45

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_46 = 19
				local var_4_47 = utf8.len(var_4_45)
				local var_4_48 = var_4_46 <= 0 and var_4_41 or var_4_41 * (var_4_47 / var_4_46)

				if var_4_48 > 0 and var_4_41 < var_4_48 then
					arg_1_1.talkMaxDuration = var_4_48
					var_4_40 = var_4_40 + 0.3

					if var_4_48 + var_4_40 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_48 + var_4_40
					end
				end

				arg_1_1.text_.text = var_4_45
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011001", "story_v_out_413011.awb") ~= 0 then
					local var_4_49 = manager.audio:GetVoiceLength("story_v_out_413011", "413011001", "story_v_out_413011.awb") / 1000

					if var_4_49 + var_4_40 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_49 + var_4_40
					end

					if var_4_44.prefab_name ~= "" and arg_1_1.actors_[var_4_44.prefab_name] ~= nil then
						local var_4_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_44.prefab_name].transform, "story_v_out_413011", "413011001", "story_v_out_413011.awb")

						arg_1_1:RecordAudio("413011001", var_4_50)
						arg_1_1:RecordAudio("413011001", var_4_50)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_413011", "413011001", "story_v_out_413011.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_413011", "413011001", "story_v_out_413011.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_51 = var_4_40 + 0.3
			local var_4_52 = math.max(var_4_41, arg_1_1.talkMaxDuration)

			if var_4_51 <= arg_1_1.time_ and arg_1_1.time_ < var_4_51 + var_4_52 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_51) / var_4_52

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_51 + var_4_52 and arg_1_1.time_ < var_4_51 + var_4_52 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play413011002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 413011002
		arg_9_1.duration_ = 2.77

		local var_9_0 = {
			zh = 2.766,
			ja = 1.999999999999
		}
		local var_9_1 = manager.audio:GetLocalizationFlag()

		if var_9_0[var_9_1] ~= nil then
			arg_9_1.duration_ = var_9_0[var_9_1]
		end

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play413011003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = "10094"

			if arg_9_1.actors_[var_12_0] == nil then
				local var_12_1 = Asset.Load("Widget/System/Story/StoryExpression/" .. "10094")

				if not isNil(var_12_1) then
					local var_12_2 = Object.Instantiate(var_12_1, arg_9_1.canvasGo_.transform)

					var_12_2.transform:SetSiblingIndex(1)

					var_12_2.name = var_12_0
					var_12_2.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_9_1.actors_[var_12_0] = var_12_2

					local var_12_3 = var_12_2:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_9_1.isInRecall_ then
						for iter_12_0, iter_12_1 in ipairs(var_12_3) do
							iter_12_1.color = arg_9_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_12_4 = arg_9_1.actors_["10094"].transform
			local var_12_5 = 0

			if var_12_5 < arg_9_1.time_ and arg_9_1.time_ <= var_12_5 + arg_12_0 then
				arg_9_1.var_.moveOldPos10094 = var_12_4.localPosition
				var_12_4.localScale = Vector3.New(1, 1, 1)

				arg_9_1:CheckSpriteTmpPos("10094", 3)

				local var_12_6 = var_12_4.childCount

				for iter_12_2 = 0, var_12_6 - 1 do
					local var_12_7 = var_12_4:GetChild(iter_12_2)

					if var_12_7.name == "" or not string.find(var_12_7.name, "split") then
						var_12_7.gameObject:SetActive(true)
					else
						var_12_7.gameObject:SetActive(false)
					end
				end
			end

			local var_12_8 = 0.001

			if var_12_5 <= arg_9_1.time_ and arg_9_1.time_ < var_12_5 + var_12_8 then
				local var_12_9 = (arg_9_1.time_ - var_12_5) / var_12_8
				local var_12_10 = Vector3.New(0, -340, -414)

				var_12_4.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos10094, var_12_10, var_12_9)
			end

			if arg_9_1.time_ >= var_12_5 + var_12_8 and arg_9_1.time_ < var_12_5 + var_12_8 + arg_12_0 then
				var_12_4.localPosition = Vector3.New(0, -340, -414)
			end

			local var_12_11 = arg_9_1.actors_["10094"]
			local var_12_12 = 0

			if var_12_12 < arg_9_1.time_ and arg_9_1.time_ <= var_12_12 + arg_12_0 and not isNil(var_12_11) and arg_9_1.var_.actorSpriteComps10094 == nil then
				arg_9_1.var_.actorSpriteComps10094 = var_12_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_12_13 = 2

			if var_12_12 <= arg_9_1.time_ and arg_9_1.time_ < var_12_12 + var_12_13 and not isNil(var_12_11) then
				local var_12_14 = (arg_9_1.time_ - var_12_12) / var_12_13

				if arg_9_1.var_.actorSpriteComps10094 then
					for iter_12_3, iter_12_4 in pairs(arg_9_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_12_4 then
							if arg_9_1.isInRecall_ then
								local var_12_15 = Mathf.Lerp(iter_12_4.color.r, arg_9_1.hightColor1.r, var_12_14)
								local var_12_16 = Mathf.Lerp(iter_12_4.color.g, arg_9_1.hightColor1.g, var_12_14)
								local var_12_17 = Mathf.Lerp(iter_12_4.color.b, arg_9_1.hightColor1.b, var_12_14)

								iter_12_4.color = Color.New(var_12_15, var_12_16, var_12_17)
							else
								local var_12_18 = Mathf.Lerp(iter_12_4.color.r, 1, var_12_14)

								iter_12_4.color = Color.New(var_12_18, var_12_18, var_12_18)
							end
						end
					end
				end
			end

			if arg_9_1.time_ >= var_12_12 + var_12_13 and arg_9_1.time_ < var_12_12 + var_12_13 + arg_12_0 and not isNil(var_12_11) and arg_9_1.var_.actorSpriteComps10094 then
				for iter_12_5, iter_12_6 in pairs(arg_9_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_12_6 then
						if arg_9_1.isInRecall_ then
							iter_12_6.color = arg_9_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_12_6.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_9_1.var_.actorSpriteComps10094 = nil
			end

			local var_12_19 = arg_9_1.actors_["10094"]
			local var_12_20 = 0

			if var_12_20 < arg_9_1.time_ and arg_9_1.time_ <= var_12_20 + arg_12_0 then
				local var_12_21 = var_12_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_12_21 then
					arg_9_1.var_.alphaOldValue10094 = var_12_21.alpha
					arg_9_1.var_.characterEffect10094 = var_12_21
				end

				arg_9_1.var_.alphaOldValue10094 = 0
			end

			local var_12_22 = 0.2

			if var_12_20 <= arg_9_1.time_ and arg_9_1.time_ < var_12_20 + var_12_22 then
				local var_12_23 = (arg_9_1.time_ - var_12_20) / var_12_22
				local var_12_24 = Mathf.Lerp(arg_9_1.var_.alphaOldValue10094, 1, var_12_23)

				if arg_9_1.var_.characterEffect10094 then
					arg_9_1.var_.characterEffect10094.alpha = var_12_24
				end
			end

			if arg_9_1.time_ >= var_12_20 + var_12_22 and arg_9_1.time_ < var_12_20 + var_12_22 + arg_12_0 and arg_9_1.var_.characterEffect10094 then
				arg_9_1.var_.characterEffect10094.alpha = 1
			end

			local var_12_25 = 0
			local var_12_26 = 0.05

			if var_12_25 < arg_9_1.time_ and arg_9_1.time_ <= var_12_25 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_27 = arg_9_1:FormatText(StoryNameCfg[259].name)

				arg_9_1.leftNameTxt_.text = var_12_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_28 = arg_9_1:GetWordFromCfg(413011002)
				local var_12_29 = arg_9_1:FormatText(var_12_28.content)

				arg_9_1.text_.text = var_12_29

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_30 = 2
				local var_12_31 = utf8.len(var_12_29)
				local var_12_32 = var_12_30 <= 0 and var_12_26 or var_12_26 * (var_12_31 / var_12_30)

				if var_12_32 > 0 and var_12_26 < var_12_32 then
					arg_9_1.talkMaxDuration = var_12_32

					if var_12_32 + var_12_25 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_32 + var_12_25
					end
				end

				arg_9_1.text_.text = var_12_29
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011002", "story_v_out_413011.awb") ~= 0 then
					local var_12_33 = manager.audio:GetVoiceLength("story_v_out_413011", "413011002", "story_v_out_413011.awb") / 1000

					if var_12_33 + var_12_25 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_33 + var_12_25
					end

					if var_12_28.prefab_name ~= "" and arg_9_1.actors_[var_12_28.prefab_name] ~= nil then
						local var_12_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_28.prefab_name].transform, "story_v_out_413011", "413011002", "story_v_out_413011.awb")

						arg_9_1:RecordAudio("413011002", var_12_34)
						arg_9_1:RecordAudio("413011002", var_12_34)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_413011", "413011002", "story_v_out_413011.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_413011", "413011002", "story_v_out_413011.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_35 = math.max(var_12_26, arg_9_1.talkMaxDuration)

			if var_12_25 <= arg_9_1.time_ and arg_9_1.time_ < var_12_25 + var_12_35 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_25) / var_12_35

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_25 + var_12_35 and arg_9_1.time_ < var_12_25 + var_12_35 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play413011003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 413011003
		arg_13_1.duration_ = 5

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play413011004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["10094"].transform
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 then
				arg_13_1.var_.moveOldPos10094 = var_16_0.localPosition
				var_16_0.localScale = Vector3.New(1, 1, 1)

				arg_13_1:CheckSpriteTmpPos("10094", 3)

				local var_16_2 = var_16_0.childCount

				for iter_16_0 = 0, var_16_2 - 1 do
					local var_16_3 = var_16_0:GetChild(iter_16_0)

					if var_16_3.name == "" or not string.find(var_16_3.name, "split") then
						var_16_3.gameObject:SetActive(true)
					else
						var_16_3.gameObject:SetActive(false)
					end
				end
			end

			local var_16_4 = 0.001

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_4 then
				local var_16_5 = (arg_13_1.time_ - var_16_1) / var_16_4
				local var_16_6 = Vector3.New(0, -340, -414)

				var_16_0.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos10094, var_16_6, var_16_5)
			end

			if arg_13_1.time_ >= var_16_1 + var_16_4 and arg_13_1.time_ < var_16_1 + var_16_4 + arg_16_0 then
				var_16_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_16_7 = arg_13_1.actors_["10094"]
			local var_16_8 = 0

			if var_16_8 < arg_13_1.time_ and arg_13_1.time_ <= var_16_8 + arg_16_0 and not isNil(var_16_7) and arg_13_1.var_.actorSpriteComps10094 == nil then
				arg_13_1.var_.actorSpriteComps10094 = var_16_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_16_9 = 2

			if var_16_8 <= arg_13_1.time_ and arg_13_1.time_ < var_16_8 + var_16_9 and not isNil(var_16_7) then
				local var_16_10 = (arg_13_1.time_ - var_16_8) / var_16_9

				if arg_13_1.var_.actorSpriteComps10094 then
					for iter_16_1, iter_16_2 in pairs(arg_13_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_16_2 then
							if arg_13_1.isInRecall_ then
								local var_16_11 = Mathf.Lerp(iter_16_2.color.r, arg_13_1.hightColor2.r, var_16_10)
								local var_16_12 = Mathf.Lerp(iter_16_2.color.g, arg_13_1.hightColor2.g, var_16_10)
								local var_16_13 = Mathf.Lerp(iter_16_2.color.b, arg_13_1.hightColor2.b, var_16_10)

								iter_16_2.color = Color.New(var_16_11, var_16_12, var_16_13)
							else
								local var_16_14 = Mathf.Lerp(iter_16_2.color.r, 0.5, var_16_10)

								iter_16_2.color = Color.New(var_16_14, var_16_14, var_16_14)
							end
						end
					end
				end
			end

			if arg_13_1.time_ >= var_16_8 + var_16_9 and arg_13_1.time_ < var_16_8 + var_16_9 + arg_16_0 and not isNil(var_16_7) and arg_13_1.var_.actorSpriteComps10094 then
				for iter_16_3, iter_16_4 in pairs(arg_13_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_16_4 then
						if arg_13_1.isInRecall_ then
							iter_16_4.color = arg_13_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_16_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_13_1.var_.actorSpriteComps10094 = nil
			end

			local var_16_15 = 0
			local var_16_16 = 1.725

			if var_16_15 < arg_13_1.time_ and arg_13_1.time_ <= var_16_15 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, false)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_17 = arg_13_1:GetWordFromCfg(413011003)
				local var_16_18 = arg_13_1:FormatText(var_16_17.content)

				arg_13_1.text_.text = var_16_18

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_19 = 69
				local var_16_20 = utf8.len(var_16_18)
				local var_16_21 = var_16_19 <= 0 and var_16_16 or var_16_16 * (var_16_20 / var_16_19)

				if var_16_21 > 0 and var_16_16 < var_16_21 then
					arg_13_1.talkMaxDuration = var_16_21

					if var_16_21 + var_16_15 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_21 + var_16_15
					end
				end

				arg_13_1.text_.text = var_16_18
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)
				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_22 = math.max(var_16_16, arg_13_1.talkMaxDuration)

			if var_16_15 <= arg_13_1.time_ and arg_13_1.time_ < var_16_15 + var_16_22 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_15) / var_16_22

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_15 + var_16_22 and arg_13_1.time_ < var_16_15 + var_16_22 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play413011004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 413011004
		arg_17_1.duration_ = 14.77

		local var_17_0 = {
			zh = 5.533,
			ja = 14.766
		}
		local var_17_1 = manager.audio:GetLocalizationFlag()

		if var_17_0[var_17_1] ~= nil then
			arg_17_1.duration_ = var_17_0[var_17_1]
		end

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play413011005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.7

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_2 = arg_17_1:FormatText(StoryNameCfg[992].name)

				arg_17_1.leftNameTxt_.text = var_20_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, true)
				arg_17_1.iconController_:SetSelectedState("hero")

				arg_17_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_17_1.callingController_:SetSelectedState("normal")

				arg_17_1.keyicon_.color = Color.New(1, 1, 1)
				arg_17_1.icon_.color = Color.New(1, 1, 1)

				local var_20_3 = arg_17_1:GetWordFromCfg(413011004)
				local var_20_4 = arg_17_1:FormatText(var_20_3.content)

				arg_17_1.text_.text = var_20_4

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_5 = 28
				local var_20_6 = utf8.len(var_20_4)
				local var_20_7 = var_20_5 <= 0 and var_20_1 or var_20_1 * (var_20_6 / var_20_5)

				if var_20_7 > 0 and var_20_1 < var_20_7 then
					arg_17_1.talkMaxDuration = var_20_7

					if var_20_7 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_7 + var_20_0
					end
				end

				arg_17_1.text_.text = var_20_4
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011004", "story_v_out_413011.awb") ~= 0 then
					local var_20_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011004", "story_v_out_413011.awb") / 1000

					if var_20_8 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_8 + var_20_0
					end

					if var_20_3.prefab_name ~= "" and arg_17_1.actors_[var_20_3.prefab_name] ~= nil then
						local var_20_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_3.prefab_name].transform, "story_v_out_413011", "413011004", "story_v_out_413011.awb")

						arg_17_1:RecordAudio("413011004", var_20_9)
						arg_17_1:RecordAudio("413011004", var_20_9)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_413011", "413011004", "story_v_out_413011.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_413011", "413011004", "story_v_out_413011.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_10 = math.max(var_20_1, arg_17_1.talkMaxDuration)

			if var_20_0 <= arg_17_1.time_ and arg_17_1.time_ < var_20_0 + var_20_10 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_0) / var_20_10

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_0 + var_20_10 and arg_17_1.time_ < var_20_0 + var_20_10 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play413011005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 413011005
		arg_21_1.duration_ = 4.23

		local var_21_0 = {
			zh = 4.233,
			ja = 3.4
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play413011006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.375

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_2 = arg_21_1:FormatText(StoryNameCfg[993].name)

				arg_21_1.leftNameTxt_.text = var_24_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, true)
				arg_21_1.iconController_:SetSelectedState("hero")

				arg_21_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_21_1.callingController_:SetSelectedState("normal")

				arg_21_1.keyicon_.color = Color.New(1, 1, 1)
				arg_21_1.icon_.color = Color.New(1, 1, 1)

				local var_24_3 = arg_21_1:GetWordFromCfg(413011005)
				local var_24_4 = arg_21_1:FormatText(var_24_3.content)

				arg_21_1.text_.text = var_24_4

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_5 = 15
				local var_24_6 = utf8.len(var_24_4)
				local var_24_7 = var_24_5 <= 0 and var_24_1 or var_24_1 * (var_24_6 / var_24_5)

				if var_24_7 > 0 and var_24_1 < var_24_7 then
					arg_21_1.talkMaxDuration = var_24_7

					if var_24_7 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_7 + var_24_0
					end
				end

				arg_21_1.text_.text = var_24_4
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011005", "story_v_out_413011.awb") ~= 0 then
					local var_24_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011005", "story_v_out_413011.awb") / 1000

					if var_24_8 + var_24_0 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_8 + var_24_0
					end

					if var_24_3.prefab_name ~= "" and arg_21_1.actors_[var_24_3.prefab_name] ~= nil then
						local var_24_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_3.prefab_name].transform, "story_v_out_413011", "413011005", "story_v_out_413011.awb")

						arg_21_1:RecordAudio("413011005", var_24_9)
						arg_21_1:RecordAudio("413011005", var_24_9)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_413011", "413011005", "story_v_out_413011.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_413011", "413011005", "story_v_out_413011.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_10 = math.max(var_24_1, arg_21_1.talkMaxDuration)

			if var_24_0 <= arg_21_1.time_ and arg_21_1.time_ < var_24_0 + var_24_10 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_0) / var_24_10

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_0 + var_24_10 and arg_21_1.time_ < var_24_0 + var_24_10 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play413011006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 413011006
		arg_25_1.duration_ = 7.6

		local var_25_0 = {
			zh = 5.466,
			ja = 7.6
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
				arg_25_0:Play413011007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 0.65

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_2 = arg_25_1:FormatText(StoryNameCfg[993].name)

				arg_25_1.leftNameTxt_.text = var_28_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, true)
				arg_25_1.iconController_:SetSelectedState("hero")

				arg_25_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenmb")

				arg_25_1.callingController_:SetSelectedState("normal")

				arg_25_1.keyicon_.color = Color.New(1, 1, 1)
				arg_25_1.icon_.color = Color.New(1, 1, 1)

				local var_28_3 = arg_25_1:GetWordFromCfg(413011006)
				local var_28_4 = arg_25_1:FormatText(var_28_3.content)

				arg_25_1.text_.text = var_28_4

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_5 = 26
				local var_28_6 = utf8.len(var_28_4)
				local var_28_7 = var_28_5 <= 0 and var_28_1 or var_28_1 * (var_28_6 / var_28_5)

				if var_28_7 > 0 and var_28_1 < var_28_7 then
					arg_25_1.talkMaxDuration = var_28_7

					if var_28_7 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_7 + var_28_0
					end
				end

				arg_25_1.text_.text = var_28_4
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011006", "story_v_out_413011.awb") ~= 0 then
					local var_28_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011006", "story_v_out_413011.awb") / 1000

					if var_28_8 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_8 + var_28_0
					end

					if var_28_3.prefab_name ~= "" and arg_25_1.actors_[var_28_3.prefab_name] ~= nil then
						local var_28_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_3.prefab_name].transform, "story_v_out_413011", "413011006", "story_v_out_413011.awb")

						arg_25_1:RecordAudio("413011006", var_28_9)
						arg_25_1:RecordAudio("413011006", var_28_9)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_413011", "413011006", "story_v_out_413011.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_413011", "413011006", "story_v_out_413011.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_10 = math.max(var_28_1, arg_25_1.talkMaxDuration)

			if var_28_0 <= arg_25_1.time_ and arg_25_1.time_ < var_28_0 + var_28_10 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_0) / var_28_10

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_0 + var_28_10 and arg_25_1.time_ < var_28_0 + var_28_10 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play413011007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 413011007
		arg_29_1.duration_ = 7.53

		local var_29_0 = {
			zh = 5.2,
			ja = 7.533
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play413011008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 0.725

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_2 = arg_29_1:FormatText(StoryNameCfg[994].name)

				arg_29_1.leftNameTxt_.text = var_32_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, true)
				arg_29_1.iconController_:SetSelectedState("hero")

				arg_29_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_29_1.callingController_:SetSelectedState("normal")

				arg_29_1.keyicon_.color = Color.New(1, 1, 1)
				arg_29_1.icon_.color = Color.New(1, 1, 1)

				local var_32_3 = arg_29_1:GetWordFromCfg(413011007)
				local var_32_4 = arg_29_1:FormatText(var_32_3.content)

				arg_29_1.text_.text = var_32_4

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_5 = 29
				local var_32_6 = utf8.len(var_32_4)
				local var_32_7 = var_32_5 <= 0 and var_32_1 or var_32_1 * (var_32_6 / var_32_5)

				if var_32_7 > 0 and var_32_1 < var_32_7 then
					arg_29_1.talkMaxDuration = var_32_7

					if var_32_7 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_7 + var_32_0
					end
				end

				arg_29_1.text_.text = var_32_4
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011007", "story_v_out_413011.awb") ~= 0 then
					local var_32_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011007", "story_v_out_413011.awb") / 1000

					if var_32_8 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_8 + var_32_0
					end

					if var_32_3.prefab_name ~= "" and arg_29_1.actors_[var_32_3.prefab_name] ~= nil then
						local var_32_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_3.prefab_name].transform, "story_v_out_413011", "413011007", "story_v_out_413011.awb")

						arg_29_1:RecordAudio("413011007", var_32_9)
						arg_29_1:RecordAudio("413011007", var_32_9)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_413011", "413011007", "story_v_out_413011.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_413011", "413011007", "story_v_out_413011.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_10 = math.max(var_32_1, arg_29_1.talkMaxDuration)

			if var_32_0 <= arg_29_1.time_ and arg_29_1.time_ < var_32_0 + var_32_10 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_0) / var_32_10

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_0 + var_32_10 and arg_29_1.time_ < var_32_0 + var_32_10 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play413011008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 413011008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play413011009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 1.325

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, false)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_2 = arg_33_1:GetWordFromCfg(413011008)
				local var_36_3 = arg_33_1:FormatText(var_36_2.content)

				arg_33_1.text_.text = var_36_3

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_4 = 53
				local var_36_5 = utf8.len(var_36_3)
				local var_36_6 = var_36_4 <= 0 and var_36_1 or var_36_1 * (var_36_5 / var_36_4)

				if var_36_6 > 0 and var_36_1 < var_36_6 then
					arg_33_1.talkMaxDuration = var_36_6

					if var_36_6 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_6 + var_36_0
					end
				end

				arg_33_1.text_.text = var_36_3
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_7 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_7 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_7

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_7 and arg_33_1.time_ < var_36_0 + var_36_7 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play413011009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 413011009
		arg_37_1.duration_ = 3.53

		local var_37_0 = {
			zh = 1.999999999999,
			ja = 3.533
		}
		local var_37_1 = manager.audio:GetLocalizationFlag()

		if var_37_0[var_37_1] ~= nil then
			arg_37_1.duration_ = var_37_0[var_37_1]
		end

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play413011010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["10094"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos10094 = var_40_0.localPosition
				var_40_0.localScale = Vector3.New(1, 1, 1)

				arg_37_1:CheckSpriteTmpPos("10094", 3)

				local var_40_2 = var_40_0.childCount

				for iter_40_0 = 0, var_40_2 - 1 do
					local var_40_3 = var_40_0:GetChild(iter_40_0)

					if var_40_3.name == "" or not string.find(var_40_3.name, "split") then
						var_40_3.gameObject:SetActive(true)
					else
						var_40_3.gameObject:SetActive(false)
					end
				end
			end

			local var_40_4 = 0.001

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_4 then
				local var_40_5 = (arg_37_1.time_ - var_40_1) / var_40_4
				local var_40_6 = Vector3.New(0, -340, -414)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos10094, var_40_6, var_40_5)
			end

			if arg_37_1.time_ >= var_40_1 + var_40_4 and arg_37_1.time_ < var_40_1 + var_40_4 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_40_7 = arg_37_1.actors_["10094"]
			local var_40_8 = 0

			if var_40_8 < arg_37_1.time_ and arg_37_1.time_ <= var_40_8 + arg_40_0 and not isNil(var_40_7) and arg_37_1.var_.actorSpriteComps10094 == nil then
				arg_37_1.var_.actorSpriteComps10094 = var_40_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_9 = 2

			if var_40_8 <= arg_37_1.time_ and arg_37_1.time_ < var_40_8 + var_40_9 and not isNil(var_40_7) then
				local var_40_10 = (arg_37_1.time_ - var_40_8) / var_40_9

				if arg_37_1.var_.actorSpriteComps10094 then
					for iter_40_1, iter_40_2 in pairs(arg_37_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_40_2 then
							if arg_37_1.isInRecall_ then
								local var_40_11 = Mathf.Lerp(iter_40_2.color.r, arg_37_1.hightColor1.r, var_40_10)
								local var_40_12 = Mathf.Lerp(iter_40_2.color.g, arg_37_1.hightColor1.g, var_40_10)
								local var_40_13 = Mathf.Lerp(iter_40_2.color.b, arg_37_1.hightColor1.b, var_40_10)

								iter_40_2.color = Color.New(var_40_11, var_40_12, var_40_13)
							else
								local var_40_14 = Mathf.Lerp(iter_40_2.color.r, 1, var_40_10)

								iter_40_2.color = Color.New(var_40_14, var_40_14, var_40_14)
							end
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_8 + var_40_9 and arg_37_1.time_ < var_40_8 + var_40_9 + arg_40_0 and not isNil(var_40_7) and arg_37_1.var_.actorSpriteComps10094 then
				for iter_40_3, iter_40_4 in pairs(arg_37_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_40_4 then
						if arg_37_1.isInRecall_ then
							iter_40_4.color = arg_37_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_40_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_37_1.var_.actorSpriteComps10094 = nil
			end

			local var_40_15 = 0
			local var_40_16 = 0.2

			if var_40_15 < arg_37_1.time_ and arg_37_1.time_ <= var_40_15 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_17 = arg_37_1:FormatText(StoryNameCfg[259].name)

				arg_37_1.leftNameTxt_.text = var_40_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_18 = arg_37_1:GetWordFromCfg(413011009)
				local var_40_19 = arg_37_1:FormatText(var_40_18.content)

				arg_37_1.text_.text = var_40_19

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_20 = 8
				local var_40_21 = utf8.len(var_40_19)
				local var_40_22 = var_40_20 <= 0 and var_40_16 or var_40_16 * (var_40_21 / var_40_20)

				if var_40_22 > 0 and var_40_16 < var_40_22 then
					arg_37_1.talkMaxDuration = var_40_22

					if var_40_22 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_22 + var_40_15
					end
				end

				arg_37_1.text_.text = var_40_19
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011009", "story_v_out_413011.awb") ~= 0 then
					local var_40_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011009", "story_v_out_413011.awb") / 1000

					if var_40_23 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_23 + var_40_15
					end

					if var_40_18.prefab_name ~= "" and arg_37_1.actors_[var_40_18.prefab_name] ~= nil then
						local var_40_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_18.prefab_name].transform, "story_v_out_413011", "413011009", "story_v_out_413011.awb")

						arg_37_1:RecordAudio("413011009", var_40_24)
						arg_37_1:RecordAudio("413011009", var_40_24)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_413011", "413011009", "story_v_out_413011.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_413011", "413011009", "story_v_out_413011.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_25 = math.max(var_40_16, arg_37_1.talkMaxDuration)

			if var_40_15 <= arg_37_1.time_ and arg_37_1.time_ < var_40_15 + var_40_25 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_15) / var_40_25

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_15 + var_40_25 and arg_37_1.time_ < var_40_15 + var_40_25 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play413011010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 413011010
		arg_41_1.duration_ = 5.6

		local var_41_0 = {
			zh = 5.6,
			ja = 4.5
		}
		local var_41_1 = manager.audio:GetLocalizationFlag()

		if var_41_0[var_41_1] ~= nil then
			arg_41_1.duration_ = var_41_0[var_41_1]
		end

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play413011011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["10094"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos10094 = var_44_0.localPosition
				var_44_0.localScale = Vector3.New(1, 1, 1)

				arg_41_1:CheckSpriteTmpPos("10094", 3)

				local var_44_2 = var_44_0.childCount

				for iter_44_0 = 0, var_44_2 - 1 do
					local var_44_3 = var_44_0:GetChild(iter_44_0)

					if var_44_3.name == "" or not string.find(var_44_3.name, "split") then
						var_44_3.gameObject:SetActive(true)
					else
						var_44_3.gameObject:SetActive(false)
					end
				end
			end

			local var_44_4 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_4 then
				local var_44_5 = (arg_41_1.time_ - var_44_1) / var_44_4
				local var_44_6 = Vector3.New(0, -340, -414)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos10094, var_44_6, var_44_5)
			end

			if arg_41_1.time_ >= var_44_1 + var_44_4 and arg_41_1.time_ < var_44_1 + var_44_4 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_44_7 = arg_41_1.actors_["10094"]
			local var_44_8 = 0

			if var_44_8 < arg_41_1.time_ and arg_41_1.time_ <= var_44_8 + arg_44_0 and not isNil(var_44_7) and arg_41_1.var_.actorSpriteComps10094 == nil then
				arg_41_1.var_.actorSpriteComps10094 = var_44_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_9 = 2

			if var_44_8 <= arg_41_1.time_ and arg_41_1.time_ < var_44_8 + var_44_9 and not isNil(var_44_7) then
				local var_44_10 = (arg_41_1.time_ - var_44_8) / var_44_9

				if arg_41_1.var_.actorSpriteComps10094 then
					for iter_44_1, iter_44_2 in pairs(arg_41_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_44_2 then
							if arg_41_1.isInRecall_ then
								local var_44_11 = Mathf.Lerp(iter_44_2.color.r, arg_41_1.hightColor2.r, var_44_10)
								local var_44_12 = Mathf.Lerp(iter_44_2.color.g, arg_41_1.hightColor2.g, var_44_10)
								local var_44_13 = Mathf.Lerp(iter_44_2.color.b, arg_41_1.hightColor2.b, var_44_10)

								iter_44_2.color = Color.New(var_44_11, var_44_12, var_44_13)
							else
								local var_44_14 = Mathf.Lerp(iter_44_2.color.r, 0.5, var_44_10)

								iter_44_2.color = Color.New(var_44_14, var_44_14, var_44_14)
							end
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_8 + var_44_9 and arg_41_1.time_ < var_44_8 + var_44_9 + arg_44_0 and not isNil(var_44_7) and arg_41_1.var_.actorSpriteComps10094 then
				for iter_44_3, iter_44_4 in pairs(arg_41_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_44_4 then
						if arg_41_1.isInRecall_ then
							iter_44_4.color = arg_41_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_44_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_41_1.var_.actorSpriteComps10094 = nil
			end

			local var_44_15 = 0
			local var_44_16 = 0.675

			if var_44_15 < arg_41_1.time_ and arg_41_1.time_ <= var_44_15 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_17 = arg_41_1:FormatText(StoryNameCfg[992].name)

				arg_41_1.leftNameTxt_.text = var_44_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, true)
				arg_41_1.iconController_:SetSelectedState("hero")

				arg_41_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_41_1.callingController_:SetSelectedState("normal")

				arg_41_1.keyicon_.color = Color.New(1, 1, 1)
				arg_41_1.icon_.color = Color.New(1, 1, 1)

				local var_44_18 = arg_41_1:GetWordFromCfg(413011010)
				local var_44_19 = arg_41_1:FormatText(var_44_18.content)

				arg_41_1.text_.text = var_44_19

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_20 = 27
				local var_44_21 = utf8.len(var_44_19)
				local var_44_22 = var_44_20 <= 0 and var_44_16 or var_44_16 * (var_44_21 / var_44_20)

				if var_44_22 > 0 and var_44_16 < var_44_22 then
					arg_41_1.talkMaxDuration = var_44_22

					if var_44_22 + var_44_15 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_22 + var_44_15
					end
				end

				arg_41_1.text_.text = var_44_19
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011010", "story_v_out_413011.awb") ~= 0 then
					local var_44_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011010", "story_v_out_413011.awb") / 1000

					if var_44_23 + var_44_15 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_23 + var_44_15
					end

					if var_44_18.prefab_name ~= "" and arg_41_1.actors_[var_44_18.prefab_name] ~= nil then
						local var_44_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_18.prefab_name].transform, "story_v_out_413011", "413011010", "story_v_out_413011.awb")

						arg_41_1:RecordAudio("413011010", var_44_24)
						arg_41_1:RecordAudio("413011010", var_44_24)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_413011", "413011010", "story_v_out_413011.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_413011", "413011010", "story_v_out_413011.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_25 = math.max(var_44_16, arg_41_1.talkMaxDuration)

			if var_44_15 <= arg_41_1.time_ and arg_41_1.time_ < var_44_15 + var_44_25 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_15) / var_44_25

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_15 + var_44_25 and arg_41_1.time_ < var_44_15 + var_44_25 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play413011011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 413011011
		arg_45_1.duration_ = 12.47

		local var_45_0 = {
			zh = 7.6,
			ja = 12.466
		}
		local var_45_1 = manager.audio:GetLocalizationFlag()

		if var_45_0[var_45_1] ~= nil then
			arg_45_1.duration_ = var_45_0[var_45_1]
		end

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play413011012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10094"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos10094 = var_48_0.localPosition
				var_48_0.localScale = Vector3.New(1, 1, 1)

				arg_45_1:CheckSpriteTmpPos("10094", 3)

				local var_48_2 = var_48_0.childCount

				for iter_48_0 = 0, var_48_2 - 1 do
					local var_48_3 = var_48_0:GetChild(iter_48_0)

					if var_48_3.name == "" or not string.find(var_48_3.name, "split") then
						var_48_3.gameObject:SetActive(true)
					else
						var_48_3.gameObject:SetActive(false)
					end
				end
			end

			local var_48_4 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_4 then
				local var_48_5 = (arg_45_1.time_ - var_48_1) / var_48_4
				local var_48_6 = Vector3.New(0, -340, -414)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10094, var_48_6, var_48_5)
			end

			if arg_45_1.time_ >= var_48_1 + var_48_4 and arg_45_1.time_ < var_48_1 + var_48_4 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_48_7 = arg_45_1.actors_["10094"]
			local var_48_8 = 0

			if var_48_8 < arg_45_1.time_ and arg_45_1.time_ <= var_48_8 + arg_48_0 and not isNil(var_48_7) and arg_45_1.var_.actorSpriteComps10094 == nil then
				arg_45_1.var_.actorSpriteComps10094 = var_48_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_9 = 2

			if var_48_8 <= arg_45_1.time_ and arg_45_1.time_ < var_48_8 + var_48_9 and not isNil(var_48_7) then
				local var_48_10 = (arg_45_1.time_ - var_48_8) / var_48_9

				if arg_45_1.var_.actorSpriteComps10094 then
					for iter_48_1, iter_48_2 in pairs(arg_45_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_48_2 then
							if arg_45_1.isInRecall_ then
								local var_48_11 = Mathf.Lerp(iter_48_2.color.r, arg_45_1.hightColor1.r, var_48_10)
								local var_48_12 = Mathf.Lerp(iter_48_2.color.g, arg_45_1.hightColor1.g, var_48_10)
								local var_48_13 = Mathf.Lerp(iter_48_2.color.b, arg_45_1.hightColor1.b, var_48_10)

								iter_48_2.color = Color.New(var_48_11, var_48_12, var_48_13)
							else
								local var_48_14 = Mathf.Lerp(iter_48_2.color.r, 1, var_48_10)

								iter_48_2.color = Color.New(var_48_14, var_48_14, var_48_14)
							end
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_8 + var_48_9 and arg_45_1.time_ < var_48_8 + var_48_9 + arg_48_0 and not isNil(var_48_7) and arg_45_1.var_.actorSpriteComps10094 then
				for iter_48_3, iter_48_4 in pairs(arg_45_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_48_4 then
						if arg_45_1.isInRecall_ then
							iter_48_4.color = arg_45_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_48_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_45_1.var_.actorSpriteComps10094 = nil
			end

			local var_48_15 = 0
			local var_48_16 = 0.825

			if var_48_15 < arg_45_1.time_ and arg_45_1.time_ <= var_48_15 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_17 = arg_45_1:FormatText(StoryNameCfg[259].name)

				arg_45_1.leftNameTxt_.text = var_48_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_18 = arg_45_1:GetWordFromCfg(413011011)
				local var_48_19 = arg_45_1:FormatText(var_48_18.content)

				arg_45_1.text_.text = var_48_19

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_20 = 33
				local var_48_21 = utf8.len(var_48_19)
				local var_48_22 = var_48_20 <= 0 and var_48_16 or var_48_16 * (var_48_21 / var_48_20)

				if var_48_22 > 0 and var_48_16 < var_48_22 then
					arg_45_1.talkMaxDuration = var_48_22

					if var_48_22 + var_48_15 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_22 + var_48_15
					end
				end

				arg_45_1.text_.text = var_48_19
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011011", "story_v_out_413011.awb") ~= 0 then
					local var_48_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011011", "story_v_out_413011.awb") / 1000

					if var_48_23 + var_48_15 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_23 + var_48_15
					end

					if var_48_18.prefab_name ~= "" and arg_45_1.actors_[var_48_18.prefab_name] ~= nil then
						local var_48_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_18.prefab_name].transform, "story_v_out_413011", "413011011", "story_v_out_413011.awb")

						arg_45_1:RecordAudio("413011011", var_48_24)
						arg_45_1:RecordAudio("413011011", var_48_24)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_413011", "413011011", "story_v_out_413011.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_413011", "413011011", "story_v_out_413011.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_25 = math.max(var_48_16, arg_45_1.talkMaxDuration)

			if var_48_15 <= arg_45_1.time_ and arg_45_1.time_ < var_48_15 + var_48_25 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_15) / var_48_25

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_15 + var_48_25 and arg_45_1.time_ < var_48_15 + var_48_25 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play413011012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 413011012
		arg_49_1.duration_ = 6.27

		local var_49_0 = {
			zh = 6.2,
			ja = 6.266
		}
		local var_49_1 = manager.audio:GetLocalizationFlag()

		if var_49_0[var_49_1] ~= nil then
			arg_49_1.duration_ = var_49_0[var_49_1]
		end

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play413011013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["10094"].transform
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 then
				arg_49_1.var_.moveOldPos10094 = var_52_0.localPosition
				var_52_0.localScale = Vector3.New(1, 1, 1)

				arg_49_1:CheckSpriteTmpPos("10094", 3)

				local var_52_2 = var_52_0.childCount

				for iter_52_0 = 0, var_52_2 - 1 do
					local var_52_3 = var_52_0:GetChild(iter_52_0)

					if var_52_3.name == "" or not string.find(var_52_3.name, "split") then
						var_52_3.gameObject:SetActive(true)
					else
						var_52_3.gameObject:SetActive(false)
					end
				end
			end

			local var_52_4 = 0.001

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_4 then
				local var_52_5 = (arg_49_1.time_ - var_52_1) / var_52_4
				local var_52_6 = Vector3.New(0, -340, -414)

				var_52_0.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos10094, var_52_6, var_52_5)
			end

			if arg_49_1.time_ >= var_52_1 + var_52_4 and arg_49_1.time_ < var_52_1 + var_52_4 + arg_52_0 then
				var_52_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_52_7 = arg_49_1.actors_["10094"]
			local var_52_8 = 0

			if var_52_8 < arg_49_1.time_ and arg_49_1.time_ <= var_52_8 + arg_52_0 and not isNil(var_52_7) and arg_49_1.var_.actorSpriteComps10094 == nil then
				arg_49_1.var_.actorSpriteComps10094 = var_52_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_9 = 2

			if var_52_8 <= arg_49_1.time_ and arg_49_1.time_ < var_52_8 + var_52_9 and not isNil(var_52_7) then
				local var_52_10 = (arg_49_1.time_ - var_52_8) / var_52_9

				if arg_49_1.var_.actorSpriteComps10094 then
					for iter_52_1, iter_52_2 in pairs(arg_49_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_52_2 then
							if arg_49_1.isInRecall_ then
								local var_52_11 = Mathf.Lerp(iter_52_2.color.r, arg_49_1.hightColor2.r, var_52_10)
								local var_52_12 = Mathf.Lerp(iter_52_2.color.g, arg_49_1.hightColor2.g, var_52_10)
								local var_52_13 = Mathf.Lerp(iter_52_2.color.b, arg_49_1.hightColor2.b, var_52_10)

								iter_52_2.color = Color.New(var_52_11, var_52_12, var_52_13)
							else
								local var_52_14 = Mathf.Lerp(iter_52_2.color.r, 0.5, var_52_10)

								iter_52_2.color = Color.New(var_52_14, var_52_14, var_52_14)
							end
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_8 + var_52_9 and arg_49_1.time_ < var_52_8 + var_52_9 + arg_52_0 and not isNil(var_52_7) and arg_49_1.var_.actorSpriteComps10094 then
				for iter_52_3, iter_52_4 in pairs(arg_49_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_52_4 then
						if arg_49_1.isInRecall_ then
							iter_52_4.color = arg_49_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_52_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_49_1.var_.actorSpriteComps10094 = nil
			end

			local var_52_15 = 0
			local var_52_16 = 0.9

			if var_52_15 < arg_49_1.time_ and arg_49_1.time_ <= var_52_15 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_17 = arg_49_1:FormatText(StoryNameCfg[992].name)

				arg_49_1.leftNameTxt_.text = var_52_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, true)
				arg_49_1.iconController_:SetSelectedState("hero")

				arg_49_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_49_1.callingController_:SetSelectedState("normal")

				arg_49_1.keyicon_.color = Color.New(1, 1, 1)
				arg_49_1.icon_.color = Color.New(1, 1, 1)

				local var_52_18 = arg_49_1:GetWordFromCfg(413011012)
				local var_52_19 = arg_49_1:FormatText(var_52_18.content)

				arg_49_1.text_.text = var_52_19

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_20 = 36
				local var_52_21 = utf8.len(var_52_19)
				local var_52_22 = var_52_20 <= 0 and var_52_16 or var_52_16 * (var_52_21 / var_52_20)

				if var_52_22 > 0 and var_52_16 < var_52_22 then
					arg_49_1.talkMaxDuration = var_52_22

					if var_52_22 + var_52_15 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_22 + var_52_15
					end
				end

				arg_49_1.text_.text = var_52_19
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011012", "story_v_out_413011.awb") ~= 0 then
					local var_52_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011012", "story_v_out_413011.awb") / 1000

					if var_52_23 + var_52_15 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_23 + var_52_15
					end

					if var_52_18.prefab_name ~= "" and arg_49_1.actors_[var_52_18.prefab_name] ~= nil then
						local var_52_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_18.prefab_name].transform, "story_v_out_413011", "413011012", "story_v_out_413011.awb")

						arg_49_1:RecordAudio("413011012", var_52_24)
						arg_49_1:RecordAudio("413011012", var_52_24)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_413011", "413011012", "story_v_out_413011.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_413011", "413011012", "story_v_out_413011.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_25 = math.max(var_52_16, arg_49_1.talkMaxDuration)

			if var_52_15 <= arg_49_1.time_ and arg_49_1.time_ < var_52_15 + var_52_25 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_15) / var_52_25

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_15 + var_52_25 and arg_49_1.time_ < var_52_15 + var_52_25 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play413011013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 413011013
		arg_53_1.duration_ = 12.33

		local var_53_0 = {
			zh = 7.733,
			ja = 12.333
		}
		local var_53_1 = manager.audio:GetLocalizationFlag()

		if var_53_0[var_53_1] ~= nil then
			arg_53_1.duration_ = var_53_0[var_53_1]
		end

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play413011014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 1.025

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_2 = arg_53_1:FormatText(StoryNameCfg[992].name)

				arg_53_1.leftNameTxt_.text = var_56_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, true)
				arg_53_1.iconController_:SetSelectedState("hero")

				arg_53_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_53_1.callingController_:SetSelectedState("normal")

				arg_53_1.keyicon_.color = Color.New(1, 1, 1)
				arg_53_1.icon_.color = Color.New(1, 1, 1)

				local var_56_3 = arg_53_1:GetWordFromCfg(413011013)
				local var_56_4 = arg_53_1:FormatText(var_56_3.content)

				arg_53_1.text_.text = var_56_4

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_5 = 41
				local var_56_6 = utf8.len(var_56_4)
				local var_56_7 = var_56_5 <= 0 and var_56_1 or var_56_1 * (var_56_6 / var_56_5)

				if var_56_7 > 0 and var_56_1 < var_56_7 then
					arg_53_1.talkMaxDuration = var_56_7

					if var_56_7 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_7 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_4
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011013", "story_v_out_413011.awb") ~= 0 then
					local var_56_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011013", "story_v_out_413011.awb") / 1000

					if var_56_8 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_8 + var_56_0
					end

					if var_56_3.prefab_name ~= "" and arg_53_1.actors_[var_56_3.prefab_name] ~= nil then
						local var_56_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_3.prefab_name].transform, "story_v_out_413011", "413011013", "story_v_out_413011.awb")

						arg_53_1:RecordAudio("413011013", var_56_9)
						arg_53_1:RecordAudio("413011013", var_56_9)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_413011", "413011013", "story_v_out_413011.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_413011", "413011013", "story_v_out_413011.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_10 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_10 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_10

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_10 and arg_53_1.time_ < var_56_0 + var_56_10 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play413011014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 413011014
		arg_57_1.duration_ = 4.57

		local var_57_0 = {
			zh = 2.166,
			ja = 4.566
		}
		local var_57_1 = manager.audio:GetLocalizationFlag()

		if var_57_0[var_57_1] ~= nil then
			arg_57_1.duration_ = var_57_0[var_57_1]
		end

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play413011015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10094"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos10094 = var_60_0.localPosition
				var_60_0.localScale = Vector3.New(1, 1, 1)

				arg_57_1:CheckSpriteTmpPos("10094", 3)

				local var_60_2 = var_60_0.childCount

				for iter_60_0 = 0, var_60_2 - 1 do
					local var_60_3 = var_60_0:GetChild(iter_60_0)

					if var_60_3.name == "" or not string.find(var_60_3.name, "split") then
						var_60_3.gameObject:SetActive(true)
					else
						var_60_3.gameObject:SetActive(false)
					end
				end
			end

			local var_60_4 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_4 then
				local var_60_5 = (arg_57_1.time_ - var_60_1) / var_60_4
				local var_60_6 = Vector3.New(0, -340, -414)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10094, var_60_6, var_60_5)
			end

			if arg_57_1.time_ >= var_60_1 + var_60_4 and arg_57_1.time_ < var_60_1 + var_60_4 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_60_7 = arg_57_1.actors_["10094"]
			local var_60_8 = 0

			if var_60_8 < arg_57_1.time_ and arg_57_1.time_ <= var_60_8 + arg_60_0 and not isNil(var_60_7) and arg_57_1.var_.actorSpriteComps10094 == nil then
				arg_57_1.var_.actorSpriteComps10094 = var_60_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_60_9 = 2

			if var_60_8 <= arg_57_1.time_ and arg_57_1.time_ < var_60_8 + var_60_9 and not isNil(var_60_7) then
				local var_60_10 = (arg_57_1.time_ - var_60_8) / var_60_9

				if arg_57_1.var_.actorSpriteComps10094 then
					for iter_60_1, iter_60_2 in pairs(arg_57_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_60_2 then
							if arg_57_1.isInRecall_ then
								local var_60_11 = Mathf.Lerp(iter_60_2.color.r, arg_57_1.hightColor1.r, var_60_10)
								local var_60_12 = Mathf.Lerp(iter_60_2.color.g, arg_57_1.hightColor1.g, var_60_10)
								local var_60_13 = Mathf.Lerp(iter_60_2.color.b, arg_57_1.hightColor1.b, var_60_10)

								iter_60_2.color = Color.New(var_60_11, var_60_12, var_60_13)
							else
								local var_60_14 = Mathf.Lerp(iter_60_2.color.r, 1, var_60_10)

								iter_60_2.color = Color.New(var_60_14, var_60_14, var_60_14)
							end
						end
					end
				end
			end

			if arg_57_1.time_ >= var_60_8 + var_60_9 and arg_57_1.time_ < var_60_8 + var_60_9 + arg_60_0 and not isNil(var_60_7) and arg_57_1.var_.actorSpriteComps10094 then
				for iter_60_3, iter_60_4 in pairs(arg_57_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_60_4 then
						if arg_57_1.isInRecall_ then
							iter_60_4.color = arg_57_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_60_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_57_1.var_.actorSpriteComps10094 = nil
			end

			local var_60_15 = 0
			local var_60_16 = 0.3

			if var_60_15 < arg_57_1.time_ and arg_57_1.time_ <= var_60_15 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_17 = arg_57_1:FormatText(StoryNameCfg[259].name)

				arg_57_1.leftNameTxt_.text = var_60_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_18 = arg_57_1:GetWordFromCfg(413011014)
				local var_60_19 = arg_57_1:FormatText(var_60_18.content)

				arg_57_1.text_.text = var_60_19

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_20 = 12
				local var_60_21 = utf8.len(var_60_19)
				local var_60_22 = var_60_20 <= 0 and var_60_16 or var_60_16 * (var_60_21 / var_60_20)

				if var_60_22 > 0 and var_60_16 < var_60_22 then
					arg_57_1.talkMaxDuration = var_60_22

					if var_60_22 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_22 + var_60_15
					end
				end

				arg_57_1.text_.text = var_60_19
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011014", "story_v_out_413011.awb") ~= 0 then
					local var_60_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011014", "story_v_out_413011.awb") / 1000

					if var_60_23 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_23 + var_60_15
					end

					if var_60_18.prefab_name ~= "" and arg_57_1.actors_[var_60_18.prefab_name] ~= nil then
						local var_60_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_18.prefab_name].transform, "story_v_out_413011", "413011014", "story_v_out_413011.awb")

						arg_57_1:RecordAudio("413011014", var_60_24)
						arg_57_1:RecordAudio("413011014", var_60_24)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_413011", "413011014", "story_v_out_413011.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_413011", "413011014", "story_v_out_413011.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_25 = math.max(var_60_16, arg_57_1.talkMaxDuration)

			if var_60_15 <= arg_57_1.time_ and arg_57_1.time_ < var_60_15 + var_60_25 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_15) / var_60_25

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_15 + var_60_25 and arg_57_1.time_ < var_60_15 + var_60_25 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play413011015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 413011015
		arg_61_1.duration_ = 3.87

		local var_61_0 = {
			zh = 3.866,
			ja = 3.266
		}
		local var_61_1 = manager.audio:GetLocalizationFlag()

		if var_61_0[var_61_1] ~= nil then
			arg_61_1.duration_ = var_61_0[var_61_1]
		end

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play413011016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["10094"].transform
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 then
				arg_61_1.var_.moveOldPos10094 = var_64_0.localPosition
				var_64_0.localScale = Vector3.New(1, 1, 1)

				arg_61_1:CheckSpriteTmpPos("10094", 3)

				local var_64_2 = var_64_0.childCount

				for iter_64_0 = 0, var_64_2 - 1 do
					local var_64_3 = var_64_0:GetChild(iter_64_0)

					if var_64_3.name == "" or not string.find(var_64_3.name, "split") then
						var_64_3.gameObject:SetActive(true)
					else
						var_64_3.gameObject:SetActive(false)
					end
				end
			end

			local var_64_4 = 0.001

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_4 then
				local var_64_5 = (arg_61_1.time_ - var_64_1) / var_64_4
				local var_64_6 = Vector3.New(0, -340, -414)

				var_64_0.localPosition = Vector3.Lerp(arg_61_1.var_.moveOldPos10094, var_64_6, var_64_5)
			end

			if arg_61_1.time_ >= var_64_1 + var_64_4 and arg_61_1.time_ < var_64_1 + var_64_4 + arg_64_0 then
				var_64_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_64_7 = arg_61_1.actors_["10094"]
			local var_64_8 = 0

			if var_64_8 < arg_61_1.time_ and arg_61_1.time_ <= var_64_8 + arg_64_0 and not isNil(var_64_7) and arg_61_1.var_.actorSpriteComps10094 == nil then
				arg_61_1.var_.actorSpriteComps10094 = var_64_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_9 = 2

			if var_64_8 <= arg_61_1.time_ and arg_61_1.time_ < var_64_8 + var_64_9 and not isNil(var_64_7) then
				local var_64_10 = (arg_61_1.time_ - var_64_8) / var_64_9

				if arg_61_1.var_.actorSpriteComps10094 then
					for iter_64_1, iter_64_2 in pairs(arg_61_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_64_2 then
							if arg_61_1.isInRecall_ then
								local var_64_11 = Mathf.Lerp(iter_64_2.color.r, arg_61_1.hightColor2.r, var_64_10)
								local var_64_12 = Mathf.Lerp(iter_64_2.color.g, arg_61_1.hightColor2.g, var_64_10)
								local var_64_13 = Mathf.Lerp(iter_64_2.color.b, arg_61_1.hightColor2.b, var_64_10)

								iter_64_2.color = Color.New(var_64_11, var_64_12, var_64_13)
							else
								local var_64_14 = Mathf.Lerp(iter_64_2.color.r, 0.5, var_64_10)

								iter_64_2.color = Color.New(var_64_14, var_64_14, var_64_14)
							end
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_8 + var_64_9 and arg_61_1.time_ < var_64_8 + var_64_9 + arg_64_0 and not isNil(var_64_7) and arg_61_1.var_.actorSpriteComps10094 then
				for iter_64_3, iter_64_4 in pairs(arg_61_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_64_4 then
						if arg_61_1.isInRecall_ then
							iter_64_4.color = arg_61_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_64_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_61_1.var_.actorSpriteComps10094 = nil
			end

			local var_64_15 = 0
			local var_64_16 = 0.325

			if var_64_15 < arg_61_1.time_ and arg_61_1.time_ <= var_64_15 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_17 = arg_61_1:FormatText(StoryNameCfg[992].name)

				arg_61_1.leftNameTxt_.text = var_64_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_61_1.callingController_:SetSelectedState("normal")

				arg_61_1.keyicon_.color = Color.New(1, 1, 1)
				arg_61_1.icon_.color = Color.New(1, 1, 1)

				local var_64_18 = arg_61_1:GetWordFromCfg(413011015)
				local var_64_19 = arg_61_1:FormatText(var_64_18.content)

				arg_61_1.text_.text = var_64_19

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_20 = 13
				local var_64_21 = utf8.len(var_64_19)
				local var_64_22 = var_64_20 <= 0 and var_64_16 or var_64_16 * (var_64_21 / var_64_20)

				if var_64_22 > 0 and var_64_16 < var_64_22 then
					arg_61_1.talkMaxDuration = var_64_22

					if var_64_22 + var_64_15 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_22 + var_64_15
					end
				end

				arg_61_1.text_.text = var_64_19
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011015", "story_v_out_413011.awb") ~= 0 then
					local var_64_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011015", "story_v_out_413011.awb") / 1000

					if var_64_23 + var_64_15 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_23 + var_64_15
					end

					if var_64_18.prefab_name ~= "" and arg_61_1.actors_[var_64_18.prefab_name] ~= nil then
						local var_64_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_18.prefab_name].transform, "story_v_out_413011", "413011015", "story_v_out_413011.awb")

						arg_61_1:RecordAudio("413011015", var_64_24)
						arg_61_1:RecordAudio("413011015", var_64_24)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_413011", "413011015", "story_v_out_413011.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_413011", "413011015", "story_v_out_413011.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_25 = math.max(var_64_16, arg_61_1.talkMaxDuration)

			if var_64_15 <= arg_61_1.time_ and arg_61_1.time_ < var_64_15 + var_64_25 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_15) / var_64_25

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_15 + var_64_25 and arg_61_1.time_ < var_64_15 + var_64_25 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play413011016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 413011016
		arg_65_1.duration_ = 13.7

		local var_65_0 = {
			zh = 9.166,
			ja = 13.7
		}
		local var_65_1 = manager.audio:GetLocalizationFlag()

		if var_65_0[var_65_1] ~= nil then
			arg_65_1.duration_ = var_65_0[var_65_1]
		end

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play413011017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10094"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and not isNil(var_68_0) and arg_65_1.var_.actorSpriteComps10094 == nil then
				arg_65_1.var_.actorSpriteComps10094 = var_68_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_2 = 2

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 and not isNil(var_68_0) then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.actorSpriteComps10094 then
					for iter_68_0, iter_68_1 in pairs(arg_65_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_68_1 then
							if arg_65_1.isInRecall_ then
								local var_68_4 = Mathf.Lerp(iter_68_1.color.r, arg_65_1.hightColor1.r, var_68_3)
								local var_68_5 = Mathf.Lerp(iter_68_1.color.g, arg_65_1.hightColor1.g, var_68_3)
								local var_68_6 = Mathf.Lerp(iter_68_1.color.b, arg_65_1.hightColor1.b, var_68_3)

								iter_68_1.color = Color.New(var_68_4, var_68_5, var_68_6)
							else
								local var_68_7 = Mathf.Lerp(iter_68_1.color.r, 1, var_68_3)

								iter_68_1.color = Color.New(var_68_7, var_68_7, var_68_7)
							end
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and not isNil(var_68_0) and arg_65_1.var_.actorSpriteComps10094 then
				for iter_68_2, iter_68_3 in pairs(arg_65_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_68_3 then
						if arg_65_1.isInRecall_ then
							iter_68_3.color = arg_65_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_68_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_65_1.var_.actorSpriteComps10094 = nil
			end

			local var_68_8 = 0
			local var_68_9 = 0.925

			if var_68_8 < arg_65_1.time_ and arg_65_1.time_ <= var_68_8 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_10 = arg_65_1:FormatText(StoryNameCfg[259].name)

				arg_65_1.leftNameTxt_.text = var_68_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_11 = arg_65_1:GetWordFromCfg(413011016)
				local var_68_12 = arg_65_1:FormatText(var_68_11.content)

				arg_65_1.text_.text = var_68_12

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_13 = 37
				local var_68_14 = utf8.len(var_68_12)
				local var_68_15 = var_68_13 <= 0 and var_68_9 or var_68_9 * (var_68_14 / var_68_13)

				if var_68_15 > 0 and var_68_9 < var_68_15 then
					arg_65_1.talkMaxDuration = var_68_15

					if var_68_15 + var_68_8 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_15 + var_68_8
					end
				end

				arg_65_1.text_.text = var_68_12
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011016", "story_v_out_413011.awb") ~= 0 then
					local var_68_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011016", "story_v_out_413011.awb") / 1000

					if var_68_16 + var_68_8 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_16 + var_68_8
					end

					if var_68_11.prefab_name ~= "" and arg_65_1.actors_[var_68_11.prefab_name] ~= nil then
						local var_68_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_11.prefab_name].transform, "story_v_out_413011", "413011016", "story_v_out_413011.awb")

						arg_65_1:RecordAudio("413011016", var_68_17)
						arg_65_1:RecordAudio("413011016", var_68_17)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_413011", "413011016", "story_v_out_413011.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_413011", "413011016", "story_v_out_413011.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_18 = math.max(var_68_9, arg_65_1.talkMaxDuration)

			if var_68_8 <= arg_65_1.time_ and arg_65_1.time_ < var_68_8 + var_68_18 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_8) / var_68_18

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_8 + var_68_18 and arg_65_1.time_ < var_68_8 + var_68_18 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play413011017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 413011017
		arg_69_1.duration_ = 8.5

		local var_69_0 = {
			zh = 7.2,
			ja = 8.5
		}
		local var_69_1 = manager.audio:GetLocalizationFlag()

		if var_69_0[var_69_1] ~= nil then
			arg_69_1.duration_ = var_69_0[var_69_1]
		end

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play413011018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["10094"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and not isNil(var_72_0) and arg_69_1.var_.actorSpriteComps10094 == nil then
				arg_69_1.var_.actorSpriteComps10094 = var_72_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_2 = 2

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 and not isNil(var_72_0) then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.actorSpriteComps10094 then
					for iter_72_0, iter_72_1 in pairs(arg_69_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_72_1 then
							if arg_69_1.isInRecall_ then
								local var_72_4 = Mathf.Lerp(iter_72_1.color.r, arg_69_1.hightColor2.r, var_72_3)
								local var_72_5 = Mathf.Lerp(iter_72_1.color.g, arg_69_1.hightColor2.g, var_72_3)
								local var_72_6 = Mathf.Lerp(iter_72_1.color.b, arg_69_1.hightColor2.b, var_72_3)

								iter_72_1.color = Color.New(var_72_4, var_72_5, var_72_6)
							else
								local var_72_7 = Mathf.Lerp(iter_72_1.color.r, 0.5, var_72_3)

								iter_72_1.color = Color.New(var_72_7, var_72_7, var_72_7)
							end
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and not isNil(var_72_0) and arg_69_1.var_.actorSpriteComps10094 then
				for iter_72_2, iter_72_3 in pairs(arg_69_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_72_3 then
						if arg_69_1.isInRecall_ then
							iter_72_3.color = arg_69_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_72_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_69_1.var_.actorSpriteComps10094 = nil
			end

			local var_72_8 = 0
			local var_72_9 = 0.95

			if var_72_8 < arg_69_1.time_ and arg_69_1.time_ <= var_72_8 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_10 = arg_69_1:FormatText(StoryNameCfg[992].name)

				arg_69_1.leftNameTxt_.text = var_72_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_69_1.callingController_:SetSelectedState("normal")

				arg_69_1.keyicon_.color = Color.New(1, 1, 1)
				arg_69_1.icon_.color = Color.New(1, 1, 1)

				local var_72_11 = arg_69_1:GetWordFromCfg(413011017)
				local var_72_12 = arg_69_1:FormatText(var_72_11.content)

				arg_69_1.text_.text = var_72_12

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_13 = 38
				local var_72_14 = utf8.len(var_72_12)
				local var_72_15 = var_72_13 <= 0 and var_72_9 or var_72_9 * (var_72_14 / var_72_13)

				if var_72_15 > 0 and var_72_9 < var_72_15 then
					arg_69_1.talkMaxDuration = var_72_15

					if var_72_15 + var_72_8 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_15 + var_72_8
					end
				end

				arg_69_1.text_.text = var_72_12
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011017", "story_v_out_413011.awb") ~= 0 then
					local var_72_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011017", "story_v_out_413011.awb") / 1000

					if var_72_16 + var_72_8 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_16 + var_72_8
					end

					if var_72_11.prefab_name ~= "" and arg_69_1.actors_[var_72_11.prefab_name] ~= nil then
						local var_72_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_11.prefab_name].transform, "story_v_out_413011", "413011017", "story_v_out_413011.awb")

						arg_69_1:RecordAudio("413011017", var_72_17)
						arg_69_1:RecordAudio("413011017", var_72_17)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_413011", "413011017", "story_v_out_413011.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_413011", "413011017", "story_v_out_413011.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_18 = math.max(var_72_9, arg_69_1.talkMaxDuration)

			if var_72_8 <= arg_69_1.time_ and arg_69_1.time_ < var_72_8 + var_72_18 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_8) / var_72_18

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_8 + var_72_18 and arg_69_1.time_ < var_72_8 + var_72_18 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play413011018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 413011018
		arg_73_1.duration_ = 9

		local var_73_0 = {
			zh = 6.7,
			ja = 9
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
				arg_73_0:Play413011019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.725

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[992].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, true)
				arg_73_1.iconController_:SetSelectedState("hero")

				arg_73_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_73_1.callingController_:SetSelectedState("normal")

				arg_73_1.keyicon_.color = Color.New(1, 1, 1)
				arg_73_1.icon_.color = Color.New(1, 1, 1)

				local var_76_3 = arg_73_1:GetWordFromCfg(413011018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011018", "story_v_out_413011.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011018", "story_v_out_413011.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_out_413011", "413011018", "story_v_out_413011.awb")

						arg_73_1:RecordAudio("413011018", var_76_9)
						arg_73_1:RecordAudio("413011018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_413011", "413011018", "story_v_out_413011.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_413011", "413011018", "story_v_out_413011.awb")
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
	Play413011019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 413011019
		arg_77_1.duration_ = 2.8

		local var_77_0 = {
			zh = 2.8,
			ja = 2.1
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
				arg_77_0:Play413011020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10094"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos10094 = var_80_0.localPosition
				var_80_0.localScale = Vector3.New(1, 1, 1)

				arg_77_1:CheckSpriteTmpPos("10094", 3)

				local var_80_2 = var_80_0.childCount

				for iter_80_0 = 0, var_80_2 - 1 do
					local var_80_3 = var_80_0:GetChild(iter_80_0)

					if var_80_3.name == "" or not string.find(var_80_3.name, "split") then
						var_80_3.gameObject:SetActive(true)
					else
						var_80_3.gameObject:SetActive(false)
					end
				end
			end

			local var_80_4 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_4 then
				local var_80_5 = (arg_77_1.time_ - var_80_1) / var_80_4
				local var_80_6 = Vector3.New(0, -340, -414)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos10094, var_80_6, var_80_5)
			end

			if arg_77_1.time_ >= var_80_1 + var_80_4 and arg_77_1.time_ < var_80_1 + var_80_4 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_80_7 = arg_77_1.actors_["10094"]
			local var_80_8 = 0

			if var_80_8 < arg_77_1.time_ and arg_77_1.time_ <= var_80_8 + arg_80_0 and not isNil(var_80_7) and arg_77_1.var_.actorSpriteComps10094 == nil then
				arg_77_1.var_.actorSpriteComps10094 = var_80_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_9 = 2

			if var_80_8 <= arg_77_1.time_ and arg_77_1.time_ < var_80_8 + var_80_9 and not isNil(var_80_7) then
				local var_80_10 = (arg_77_1.time_ - var_80_8) / var_80_9

				if arg_77_1.var_.actorSpriteComps10094 then
					for iter_80_1, iter_80_2 in pairs(arg_77_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_80_2 then
							if arg_77_1.isInRecall_ then
								local var_80_11 = Mathf.Lerp(iter_80_2.color.r, arg_77_1.hightColor1.r, var_80_10)
								local var_80_12 = Mathf.Lerp(iter_80_2.color.g, arg_77_1.hightColor1.g, var_80_10)
								local var_80_13 = Mathf.Lerp(iter_80_2.color.b, arg_77_1.hightColor1.b, var_80_10)

								iter_80_2.color = Color.New(var_80_11, var_80_12, var_80_13)
							else
								local var_80_14 = Mathf.Lerp(iter_80_2.color.r, 1, var_80_10)

								iter_80_2.color = Color.New(var_80_14, var_80_14, var_80_14)
							end
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_8 + var_80_9 and arg_77_1.time_ < var_80_8 + var_80_9 + arg_80_0 and not isNil(var_80_7) and arg_77_1.var_.actorSpriteComps10094 then
				for iter_80_3, iter_80_4 in pairs(arg_77_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_80_4 then
						if arg_77_1.isInRecall_ then
							iter_80_4.color = arg_77_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_80_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_77_1.var_.actorSpriteComps10094 = nil
			end

			local var_80_15 = 0
			local var_80_16 = 0.25

			if var_80_15 < arg_77_1.time_ and arg_77_1.time_ <= var_80_15 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_17 = arg_77_1:FormatText(StoryNameCfg[259].name)

				arg_77_1.leftNameTxt_.text = var_80_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_18 = arg_77_1:GetWordFromCfg(413011019)
				local var_80_19 = arg_77_1:FormatText(var_80_18.content)

				arg_77_1.text_.text = var_80_19

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_20 = 10
				local var_80_21 = utf8.len(var_80_19)
				local var_80_22 = var_80_20 <= 0 and var_80_16 or var_80_16 * (var_80_21 / var_80_20)

				if var_80_22 > 0 and var_80_16 < var_80_22 then
					arg_77_1.talkMaxDuration = var_80_22

					if var_80_22 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_22 + var_80_15
					end
				end

				arg_77_1.text_.text = var_80_19
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011019", "story_v_out_413011.awb") ~= 0 then
					local var_80_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011019", "story_v_out_413011.awb") / 1000

					if var_80_23 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_23 + var_80_15
					end

					if var_80_18.prefab_name ~= "" and arg_77_1.actors_[var_80_18.prefab_name] ~= nil then
						local var_80_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_18.prefab_name].transform, "story_v_out_413011", "413011019", "story_v_out_413011.awb")

						arg_77_1:RecordAudio("413011019", var_80_24)
						arg_77_1:RecordAudio("413011019", var_80_24)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_413011", "413011019", "story_v_out_413011.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_413011", "413011019", "story_v_out_413011.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_25 = math.max(var_80_16, arg_77_1.talkMaxDuration)

			if var_80_15 <= arg_77_1.time_ and arg_77_1.time_ < var_80_15 + var_80_25 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_15) / var_80_25

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_15 + var_80_25 and arg_77_1.time_ < var_80_15 + var_80_25 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play413011020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 413011020
		arg_81_1.duration_ = 8.13

		local var_81_0 = {
			zh = 4.9,
			ja = 8.133
		}
		local var_81_1 = manager.audio:GetLocalizationFlag()

		if var_81_0[var_81_1] ~= nil then
			arg_81_1.duration_ = var_81_0[var_81_1]
		end

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play413011021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10094"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos10094 = var_84_0.localPosition
				var_84_0.localScale = Vector3.New(1, 1, 1)

				arg_81_1:CheckSpriteTmpPos("10094", 3)

				local var_84_2 = var_84_0.childCount

				for iter_84_0 = 0, var_84_2 - 1 do
					local var_84_3 = var_84_0:GetChild(iter_84_0)

					if var_84_3.name == "" or not string.find(var_84_3.name, "split") then
						var_84_3.gameObject:SetActive(true)
					else
						var_84_3.gameObject:SetActive(false)
					end
				end
			end

			local var_84_4 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_4 then
				local var_84_5 = (arg_81_1.time_ - var_84_1) / var_84_4
				local var_84_6 = Vector3.New(0, -340, -414)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos10094, var_84_6, var_84_5)
			end

			if arg_81_1.time_ >= var_84_1 + var_84_4 and arg_81_1.time_ < var_84_1 + var_84_4 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_84_7 = arg_81_1.actors_["10094"]
			local var_84_8 = 0

			if var_84_8 < arg_81_1.time_ and arg_81_1.time_ <= var_84_8 + arg_84_0 and not isNil(var_84_7) and arg_81_1.var_.actorSpriteComps10094 == nil then
				arg_81_1.var_.actorSpriteComps10094 = var_84_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_9 = 2

			if var_84_8 <= arg_81_1.time_ and arg_81_1.time_ < var_84_8 + var_84_9 and not isNil(var_84_7) then
				local var_84_10 = (arg_81_1.time_ - var_84_8) / var_84_9

				if arg_81_1.var_.actorSpriteComps10094 then
					for iter_84_1, iter_84_2 in pairs(arg_81_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_84_2 then
							if arg_81_1.isInRecall_ then
								local var_84_11 = Mathf.Lerp(iter_84_2.color.r, arg_81_1.hightColor2.r, var_84_10)
								local var_84_12 = Mathf.Lerp(iter_84_2.color.g, arg_81_1.hightColor2.g, var_84_10)
								local var_84_13 = Mathf.Lerp(iter_84_2.color.b, arg_81_1.hightColor2.b, var_84_10)

								iter_84_2.color = Color.New(var_84_11, var_84_12, var_84_13)
							else
								local var_84_14 = Mathf.Lerp(iter_84_2.color.r, 0.5, var_84_10)

								iter_84_2.color = Color.New(var_84_14, var_84_14, var_84_14)
							end
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_8 + var_84_9 and arg_81_1.time_ < var_84_8 + var_84_9 + arg_84_0 and not isNil(var_84_7) and arg_81_1.var_.actorSpriteComps10094 then
				for iter_84_3, iter_84_4 in pairs(arg_81_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_84_4 then
						if arg_81_1.isInRecall_ then
							iter_84_4.color = arg_81_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_84_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_81_1.var_.actorSpriteComps10094 = nil
			end

			local var_84_15 = 0
			local var_84_16 = 0.75

			if var_84_15 < arg_81_1.time_ and arg_81_1.time_ <= var_84_15 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_17 = arg_81_1:FormatText(StoryNameCfg[992].name)

				arg_81_1.leftNameTxt_.text = var_84_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, true)
				arg_81_1.iconController_:SetSelectedState("hero")

				arg_81_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_81_1.callingController_:SetSelectedState("normal")

				arg_81_1.keyicon_.color = Color.New(1, 1, 1)
				arg_81_1.icon_.color = Color.New(1, 1, 1)

				local var_84_18 = arg_81_1:GetWordFromCfg(413011020)
				local var_84_19 = arg_81_1:FormatText(var_84_18.content)

				arg_81_1.text_.text = var_84_19

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_20 = 30
				local var_84_21 = utf8.len(var_84_19)
				local var_84_22 = var_84_20 <= 0 and var_84_16 or var_84_16 * (var_84_21 / var_84_20)

				if var_84_22 > 0 and var_84_16 < var_84_22 then
					arg_81_1.talkMaxDuration = var_84_22

					if var_84_22 + var_84_15 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_22 + var_84_15
					end
				end

				arg_81_1.text_.text = var_84_19
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011020", "story_v_out_413011.awb") ~= 0 then
					local var_84_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011020", "story_v_out_413011.awb") / 1000

					if var_84_23 + var_84_15 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_23 + var_84_15
					end

					if var_84_18.prefab_name ~= "" and arg_81_1.actors_[var_84_18.prefab_name] ~= nil then
						local var_84_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_18.prefab_name].transform, "story_v_out_413011", "413011020", "story_v_out_413011.awb")

						arg_81_1:RecordAudio("413011020", var_84_24)
						arg_81_1:RecordAudio("413011020", var_84_24)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_413011", "413011020", "story_v_out_413011.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_413011", "413011020", "story_v_out_413011.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_25 = math.max(var_84_16, arg_81_1.talkMaxDuration)

			if var_84_15 <= arg_81_1.time_ and arg_81_1.time_ < var_84_15 + var_84_25 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_15) / var_84_25

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_15 + var_84_25 and arg_81_1.time_ < var_84_15 + var_84_25 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play413011021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 413011021
		arg_85_1.duration_ = 7.73

		local var_85_0 = {
			zh = 7.733,
			ja = 7.133
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
				arg_85_0:Play413011022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 2

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				local var_88_1 = manager.ui.mainCamera.transform.localPosition
				local var_88_2 = Vector3.New(0, 0, 10) + Vector3.New(var_88_1.x, var_88_1.y, 0)
				local var_88_3 = arg_85_1.bgs_.F08l

				var_88_3.transform.localPosition = var_88_2
				var_88_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_88_4 = var_88_3:GetComponent("SpriteRenderer")

				if var_88_4 and var_88_4.sprite then
					local var_88_5 = (var_88_3.transform.localPosition - var_88_1).z
					local var_88_6 = manager.ui.mainCameraCom_
					local var_88_7 = 2 * var_88_5 * Mathf.Tan(var_88_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_88_8 = var_88_7 * var_88_6.aspect
					local var_88_9 = var_88_4.sprite.bounds.size.x
					local var_88_10 = var_88_4.sprite.bounds.size.y
					local var_88_11 = var_88_8 / var_88_9
					local var_88_12 = var_88_7 / var_88_10
					local var_88_13 = var_88_12 < var_88_11 and var_88_11 or var_88_12

					var_88_3.transform.localScale = Vector3.New(var_88_13, var_88_13, 0)
				end

				for iter_88_0, iter_88_1 in pairs(arg_85_1.bgs_) do
					if iter_88_0 ~= "F08l" then
						iter_88_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_88_14 = 4

			if var_88_14 < arg_85_1.time_ and arg_85_1.time_ <= var_88_14 + arg_88_0 then
				arg_85_1.allBtn_.enabled = false
			end

			local var_88_15 = 0.3

			if arg_85_1.time_ >= var_88_14 + var_88_15 and arg_85_1.time_ < var_88_14 + var_88_15 + arg_88_0 then
				arg_85_1.allBtn_.enabled = true
			end

			local var_88_16 = 0

			if var_88_16 < arg_85_1.time_ and arg_85_1.time_ <= var_88_16 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_17 = 2

			if var_88_16 <= arg_85_1.time_ and arg_85_1.time_ < var_88_16 + var_88_17 then
				local var_88_18 = (arg_85_1.time_ - var_88_16) / var_88_17
				local var_88_19 = Color.New(0, 0, 0)

				var_88_19.a = Mathf.Lerp(0, 1, var_88_18)
				arg_85_1.mask_.color = var_88_19
			end

			if arg_85_1.time_ >= var_88_16 + var_88_17 and arg_85_1.time_ < var_88_16 + var_88_17 + arg_88_0 then
				local var_88_20 = Color.New(0, 0, 0)

				var_88_20.a = 1
				arg_85_1.mask_.color = var_88_20
			end

			local var_88_21 = 2

			if var_88_21 < arg_85_1.time_ and arg_85_1.time_ <= var_88_21 + arg_88_0 then
				arg_85_1.mask_.enabled = true
				arg_85_1.mask_.raycastTarget = true

				arg_85_1:SetGaussion(false)
			end

			local var_88_22 = 2

			if var_88_21 <= arg_85_1.time_ and arg_85_1.time_ < var_88_21 + var_88_22 then
				local var_88_23 = (arg_85_1.time_ - var_88_21) / var_88_22
				local var_88_24 = Color.New(0, 0, 0)

				var_88_24.a = Mathf.Lerp(1, 0, var_88_23)
				arg_85_1.mask_.color = var_88_24
			end

			if arg_85_1.time_ >= var_88_21 + var_88_22 and arg_85_1.time_ < var_88_21 + var_88_22 + arg_88_0 then
				local var_88_25 = Color.New(0, 0, 0)
				local var_88_26 = 0

				arg_85_1.mask_.enabled = false
				var_88_25.a = var_88_26
				arg_85_1.mask_.color = var_88_25
			end

			local var_88_27 = arg_85_1.actors_["10094"].transform
			local var_88_28 = 1.966

			if var_88_28 < arg_85_1.time_ and arg_85_1.time_ <= var_88_28 + arg_88_0 then
				arg_85_1.var_.moveOldPos10094 = var_88_27.localPosition
				var_88_27.localScale = Vector3.New(1, 1, 1)

				arg_85_1:CheckSpriteTmpPos("10094", 0)

				local var_88_29 = var_88_27.childCount

				for iter_88_2 = 0, var_88_29 - 1 do
					local var_88_30 = var_88_27:GetChild(iter_88_2)

					if var_88_30.name == "" or not string.find(var_88_30.name, "split") then
						var_88_30.gameObject:SetActive(true)
					else
						var_88_30.gameObject:SetActive(false)
					end
				end
			end

			local var_88_31 = 0.001

			if var_88_28 <= arg_85_1.time_ and arg_85_1.time_ < var_88_28 + var_88_31 then
				local var_88_32 = (arg_85_1.time_ - var_88_28) / var_88_31
				local var_88_33 = Vector3.New(-5000, -340, -414)

				var_88_27.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10094, var_88_33, var_88_32)
			end

			if arg_85_1.time_ >= var_88_28 + var_88_31 and arg_85_1.time_ < var_88_28 + var_88_31 + arg_88_0 then
				var_88_27.localPosition = Vector3.New(-5000, -340, -414)
			end

			local var_88_34 = arg_85_1.actors_["10094"]
			local var_88_35 = 1.966

			if var_88_35 < arg_85_1.time_ and arg_85_1.time_ <= var_88_35 + arg_88_0 and not isNil(var_88_34) and arg_85_1.var_.actorSpriteComps10094 == nil then
				arg_85_1.var_.actorSpriteComps10094 = var_88_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_36 = 0.034

			if var_88_35 <= arg_85_1.time_ and arg_85_1.time_ < var_88_35 + var_88_36 and not isNil(var_88_34) then
				local var_88_37 = (arg_85_1.time_ - var_88_35) / var_88_36

				if arg_85_1.var_.actorSpriteComps10094 then
					for iter_88_3, iter_88_4 in pairs(arg_85_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_88_4 then
							if arg_85_1.isInRecall_ then
								local var_88_38 = Mathf.Lerp(iter_88_4.color.r, arg_85_1.hightColor2.r, var_88_37)
								local var_88_39 = Mathf.Lerp(iter_88_4.color.g, arg_85_1.hightColor2.g, var_88_37)
								local var_88_40 = Mathf.Lerp(iter_88_4.color.b, arg_85_1.hightColor2.b, var_88_37)

								iter_88_4.color = Color.New(var_88_38, var_88_39, var_88_40)
							else
								local var_88_41 = Mathf.Lerp(iter_88_4.color.r, 0.5, var_88_37)

								iter_88_4.color = Color.New(var_88_41, var_88_41, var_88_41)
							end
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_35 + var_88_36 and arg_85_1.time_ < var_88_35 + var_88_36 + arg_88_0 and not isNil(var_88_34) and arg_85_1.var_.actorSpriteComps10094 then
				for iter_88_5, iter_88_6 in pairs(arg_85_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_88_6 then
						if arg_85_1.isInRecall_ then
							iter_88_6.color = arg_85_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_88_6.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_85_1.var_.actorSpriteComps10094 = nil
			end

			if arg_85_1.frameCnt_ <= 1 then
				arg_85_1.dialog_:SetActive(false)
			end

			local var_88_42 = 4
			local var_88_43 = 0.525

			if var_88_42 < arg_85_1.time_ and arg_85_1.time_ <= var_88_42 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0

				arg_85_1.dialog_:SetActive(true)

				local var_88_44 = LeanTween.value(arg_85_1.dialog_, 0, 1, 0.3)

				var_88_44:setOnUpdate(LuaHelper.FloatAction(function(arg_89_0)
					arg_85_1.dialogCg_.alpha = arg_89_0
				end))
				var_88_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_85_1.dialog_)
					var_88_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_85_1.duration_ = arg_85_1.duration_ + 0.3

				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_45 = arg_85_1:FormatText(StoryNameCfg[994].name)

				arg_85_1.leftNameTxt_.text = var_88_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, true)
				arg_85_1.iconController_:SetSelectedState("hero")

				arg_85_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_85_1.callingController_:SetSelectedState("normal")

				arg_85_1.keyicon_.color = Color.New(1, 1, 1)
				arg_85_1.icon_.color = Color.New(1, 1, 1)

				local var_88_46 = arg_85_1:GetWordFromCfg(413011021)
				local var_88_47 = arg_85_1:FormatText(var_88_46.content)

				arg_85_1.text_.text = var_88_47

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_48 = 21
				local var_88_49 = utf8.len(var_88_47)
				local var_88_50 = var_88_48 <= 0 and var_88_43 or var_88_43 * (var_88_49 / var_88_48)

				if var_88_50 > 0 and var_88_43 < var_88_50 then
					arg_85_1.talkMaxDuration = var_88_50
					var_88_42 = var_88_42 + 0.3

					if var_88_50 + var_88_42 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_50 + var_88_42
					end
				end

				arg_85_1.text_.text = var_88_47
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011021", "story_v_out_413011.awb") ~= 0 then
					local var_88_51 = manager.audio:GetVoiceLength("story_v_out_413011", "413011021", "story_v_out_413011.awb") / 1000

					if var_88_51 + var_88_42 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_51 + var_88_42
					end

					if var_88_46.prefab_name ~= "" and arg_85_1.actors_[var_88_46.prefab_name] ~= nil then
						local var_88_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_46.prefab_name].transform, "story_v_out_413011", "413011021", "story_v_out_413011.awb")

						arg_85_1:RecordAudio("413011021", var_88_52)
						arg_85_1:RecordAudio("413011021", var_88_52)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_413011", "413011021", "story_v_out_413011.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_413011", "413011021", "story_v_out_413011.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_53 = var_88_42 + 0.3
			local var_88_54 = math.max(var_88_43, arg_85_1.talkMaxDuration)

			if var_88_53 <= arg_85_1.time_ and arg_85_1.time_ < var_88_53 + var_88_54 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_53) / var_88_54

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_53 + var_88_54 and arg_85_1.time_ < var_88_53 + var_88_54 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play413011022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 413011022
		arg_91_1.duration_ = 5.63

		local var_91_0 = {
			zh = 2.933,
			ja = 5.633
		}
		local var_91_1 = manager.audio:GetLocalizationFlag()

		if var_91_0[var_91_1] ~= nil then
			arg_91_1.duration_ = var_91_0[var_91_1]
		end

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play413011023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.375

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[992].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_91_1.callingController_:SetSelectedState("normal")

				arg_91_1.keyicon_.color = Color.New(1, 1, 1)
				arg_91_1.icon_.color = Color.New(1, 1, 1)

				local var_94_3 = arg_91_1:GetWordFromCfg(413011022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 15
				local var_94_6 = utf8.len(var_94_4)
				local var_94_7 = var_94_5 <= 0 and var_94_1 or var_94_1 * (var_94_6 / var_94_5)

				if var_94_7 > 0 and var_94_1 < var_94_7 then
					arg_91_1.talkMaxDuration = var_94_7

					if var_94_7 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_7 + var_94_0
					end
				end

				arg_91_1.text_.text = var_94_4
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011022", "story_v_out_413011.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011022", "story_v_out_413011.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_413011", "413011022", "story_v_out_413011.awb")

						arg_91_1:RecordAudio("413011022", var_94_9)
						arg_91_1:RecordAudio("413011022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_413011", "413011022", "story_v_out_413011.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_413011", "413011022", "story_v_out_413011.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_10 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_10 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_10

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_10 and arg_91_1.time_ < var_94_0 + var_94_10 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play413011023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 413011023
		arg_95_1.duration_ = 8.17

		local var_95_0 = {
			zh = 5.9,
			ja = 8.166
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
				arg_95_0:Play413011024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.8

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[995].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, true)
				arg_95_1.iconController_:SetSelectedState("hero")

				arg_95_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10096")

				arg_95_1.callingController_:SetSelectedState("normal")

				arg_95_1.keyicon_.color = Color.New(1, 1, 1)
				arg_95_1.icon_.color = Color.New(1, 1, 1)

				local var_98_3 = arg_95_1:GetWordFromCfg(413011023)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 32
				local var_98_6 = utf8.len(var_98_4)
				local var_98_7 = var_98_5 <= 0 and var_98_1 or var_98_1 * (var_98_6 / var_98_5)

				if var_98_7 > 0 and var_98_1 < var_98_7 then
					arg_95_1.talkMaxDuration = var_98_7

					if var_98_7 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_7 + var_98_0
					end
				end

				arg_95_1.text_.text = var_98_4
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011023", "story_v_out_413011.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011023", "story_v_out_413011.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_413011", "413011023", "story_v_out_413011.awb")

						arg_95_1:RecordAudio("413011023", var_98_9)
						arg_95_1:RecordAudio("413011023", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_413011", "413011023", "story_v_out_413011.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_413011", "413011023", "story_v_out_413011.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_10 = math.max(var_98_1, arg_95_1.talkMaxDuration)

			if var_98_0 <= arg_95_1.time_ and arg_95_1.time_ < var_98_0 + var_98_10 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_0) / var_98_10

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_0 + var_98_10 and arg_95_1.time_ < var_98_0 + var_98_10 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play413011024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 413011024
		arg_99_1.duration_ = 8.47

		local var_99_0 = {
			zh = 5.966,
			ja = 8.466
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
				arg_99_0:Play413011025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.625

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[995].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10096")

				arg_99_1.callingController_:SetSelectedState("normal")

				arg_99_1.keyicon_.color = Color.New(1, 1, 1)
				arg_99_1.icon_.color = Color.New(1, 1, 1)

				local var_102_3 = arg_99_1:GetWordFromCfg(413011024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 25
				local var_102_6 = utf8.len(var_102_4)
				local var_102_7 = var_102_5 <= 0 and var_102_1 or var_102_1 * (var_102_6 / var_102_5)

				if var_102_7 > 0 and var_102_1 < var_102_7 then
					arg_99_1.talkMaxDuration = var_102_7

					if var_102_7 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_7 + var_102_0
					end
				end

				arg_99_1.text_.text = var_102_4
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011024", "story_v_out_413011.awb") ~= 0 then
					local var_102_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011024", "story_v_out_413011.awb") / 1000

					if var_102_8 + var_102_0 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_8 + var_102_0
					end

					if var_102_3.prefab_name ~= "" and arg_99_1.actors_[var_102_3.prefab_name] ~= nil then
						local var_102_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_3.prefab_name].transform, "story_v_out_413011", "413011024", "story_v_out_413011.awb")

						arg_99_1:RecordAudio("413011024", var_102_9)
						arg_99_1:RecordAudio("413011024", var_102_9)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_413011", "413011024", "story_v_out_413011.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_413011", "413011024", "story_v_out_413011.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_10 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_10 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_10

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_10 and arg_99_1.time_ < var_102_0 + var_102_10 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play413011025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 413011025
		arg_103_1.duration_ = 5.87

		local var_103_0 = {
			zh = 3.266,
			ja = 5.866
		}
		local var_103_1 = manager.audio:GetLocalizationFlag()

		if var_103_0[var_103_1] ~= nil then
			arg_103_1.duration_ = var_103_0[var_103_1]
		end

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play413011026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.425

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[994].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, true)
				arg_103_1.iconController_:SetSelectedState("hero")

				arg_103_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_103_1.callingController_:SetSelectedState("normal")

				arg_103_1.keyicon_.color = Color.New(1, 1, 1)
				arg_103_1.icon_.color = Color.New(1, 1, 1)

				local var_106_3 = arg_103_1:GetWordFromCfg(413011025)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 17
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011025", "story_v_out_413011.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011025", "story_v_out_413011.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_413011", "413011025", "story_v_out_413011.awb")

						arg_103_1:RecordAudio("413011025", var_106_9)
						arg_103_1:RecordAudio("413011025", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_413011", "413011025", "story_v_out_413011.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_413011", "413011025", "story_v_out_413011.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play413011026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 413011026
		arg_107_1.duration_ = 7

		local var_107_0 = {
			zh = 2.633,
			ja = 7
		}
		local var_107_1 = manager.audio:GetLocalizationFlag()

		if var_107_0[var_107_1] ~= nil then
			arg_107_1.duration_ = var_107_0[var_107_1]
		end

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play413011027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.325

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[994].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, true)
				arg_107_1.iconController_:SetSelectedState("hero")

				arg_107_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_107_1.callingController_:SetSelectedState("normal")

				arg_107_1.keyicon_.color = Color.New(1, 1, 1)
				arg_107_1.icon_.color = Color.New(1, 1, 1)

				local var_110_3 = arg_107_1:GetWordFromCfg(413011026)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 13
				local var_110_6 = utf8.len(var_110_4)
				local var_110_7 = var_110_5 <= 0 and var_110_1 or var_110_1 * (var_110_6 / var_110_5)

				if var_110_7 > 0 and var_110_1 < var_110_7 then
					arg_107_1.talkMaxDuration = var_110_7

					if var_110_7 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_7 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_4
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011026", "story_v_out_413011.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011026", "story_v_out_413011.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_413011", "413011026", "story_v_out_413011.awb")

						arg_107_1:RecordAudio("413011026", var_110_9)
						arg_107_1:RecordAudio("413011026", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_413011", "413011026", "story_v_out_413011.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_413011", "413011026", "story_v_out_413011.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_10 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_10 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_10

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_10 and arg_107_1.time_ < var_110_0 + var_110_10 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play413011027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 413011027
		arg_111_1.duration_ = 2.47

		local var_111_0 = {
			zh = 2.466,
			ja = 2.166
		}
		local var_111_1 = manager.audio:GetLocalizationFlag()

		if var_111_0[var_111_1] ~= nil then
			arg_111_1.duration_ = var_111_0[var_111_1]
		end

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play413011028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10094"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos10094 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("10094", 3)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(0, -340, -414)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos10094, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_114_7 = arg_111_1.actors_["10094"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and not isNil(var_114_7) and arg_111_1.var_.actorSpriteComps10094 == nil then
				arg_111_1.var_.actorSpriteComps10094 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 2

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 and not isNil(var_114_7) then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps10094 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_114_2 then
							if arg_111_1.isInRecall_ then
								local var_114_11 = Mathf.Lerp(iter_114_2.color.r, arg_111_1.hightColor1.r, var_114_10)
								local var_114_12 = Mathf.Lerp(iter_114_2.color.g, arg_111_1.hightColor1.g, var_114_10)
								local var_114_13 = Mathf.Lerp(iter_114_2.color.b, arg_111_1.hightColor1.b, var_114_10)

								iter_114_2.color = Color.New(var_114_11, var_114_12, var_114_13)
							else
								local var_114_14 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

								iter_114_2.color = Color.New(var_114_14, var_114_14, var_114_14)
							end
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and not isNil(var_114_7) and arg_111_1.var_.actorSpriteComps10094 then
				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_114_4 then
						if arg_111_1.isInRecall_ then
							iter_114_4.color = arg_111_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_114_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_111_1.var_.actorSpriteComps10094 = nil
			end

			local var_114_15 = 0.034
			local var_114_16 = 1

			if var_114_15 < arg_111_1.time_ and arg_111_1.time_ <= var_114_15 + arg_114_0 then
				local var_114_17 = "stop"
				local var_114_18 = "effect"

				arg_111_1:AudioAction(var_114_17, var_114_18, "se_story_side_1096", "se_story_1096_crowd_loop", "")
			end

			local var_114_19 = 0
			local var_114_20 = 0.275

			if var_114_19 < arg_111_1.time_ and arg_111_1.time_ <= var_114_19 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_21 = arg_111_1:FormatText(StoryNameCfg[259].name)

				arg_111_1.leftNameTxt_.text = var_114_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_22 = arg_111_1:GetWordFromCfg(413011027)
				local var_114_23 = arg_111_1:FormatText(var_114_22.content)

				arg_111_1.text_.text = var_114_23

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_24 = 11
				local var_114_25 = utf8.len(var_114_23)
				local var_114_26 = var_114_24 <= 0 and var_114_20 or var_114_20 * (var_114_25 / var_114_24)

				if var_114_26 > 0 and var_114_20 < var_114_26 then
					arg_111_1.talkMaxDuration = var_114_26

					if var_114_26 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_26 + var_114_19
					end
				end

				arg_111_1.text_.text = var_114_23
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011027", "story_v_out_413011.awb") ~= 0 then
					local var_114_27 = manager.audio:GetVoiceLength("story_v_out_413011", "413011027", "story_v_out_413011.awb") / 1000

					if var_114_27 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_27 + var_114_19
					end

					if var_114_22.prefab_name ~= "" and arg_111_1.actors_[var_114_22.prefab_name] ~= nil then
						local var_114_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_22.prefab_name].transform, "story_v_out_413011", "413011027", "story_v_out_413011.awb")

						arg_111_1:RecordAudio("413011027", var_114_28)
						arg_111_1:RecordAudio("413011027", var_114_28)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_413011", "413011027", "story_v_out_413011.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_413011", "413011027", "story_v_out_413011.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_29 = math.max(var_114_20, arg_111_1.talkMaxDuration)

			if var_114_19 <= arg_111_1.time_ and arg_111_1.time_ < var_114_19 + var_114_29 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_19) / var_114_29

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_19 + var_114_29 and arg_111_1.time_ < var_114_19 + var_114_29 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play413011028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 413011028
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play413011029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10094"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos10094 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("10094", 3)

				local var_118_2 = var_118_0.childCount

				for iter_118_0 = 0, var_118_2 - 1 do
					local var_118_3 = var_118_0:GetChild(iter_118_0)

					if var_118_3.name == "" or not string.find(var_118_3.name, "split") then
						var_118_3.gameObject:SetActive(true)
					else
						var_118_3.gameObject:SetActive(false)
					end
				end
			end

			local var_118_4 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_4 then
				local var_118_5 = (arg_115_1.time_ - var_118_1) / var_118_4
				local var_118_6 = Vector3.New(0, -340, -414)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos10094, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_118_7 = arg_115_1.actors_["10094"]
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 and not isNil(var_118_7) and arg_115_1.var_.actorSpriteComps10094 == nil then
				arg_115_1.var_.actorSpriteComps10094 = var_118_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_9 = 2

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_9 and not isNil(var_118_7) then
				local var_118_10 = (arg_115_1.time_ - var_118_8) / var_118_9

				if arg_115_1.var_.actorSpriteComps10094 then
					for iter_118_1, iter_118_2 in pairs(arg_115_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_118_2 then
							if arg_115_1.isInRecall_ then
								local var_118_11 = Mathf.Lerp(iter_118_2.color.r, arg_115_1.hightColor2.r, var_118_10)
								local var_118_12 = Mathf.Lerp(iter_118_2.color.g, arg_115_1.hightColor2.g, var_118_10)
								local var_118_13 = Mathf.Lerp(iter_118_2.color.b, arg_115_1.hightColor2.b, var_118_10)

								iter_118_2.color = Color.New(var_118_11, var_118_12, var_118_13)
							else
								local var_118_14 = Mathf.Lerp(iter_118_2.color.r, 0.5, var_118_10)

								iter_118_2.color = Color.New(var_118_14, var_118_14, var_118_14)
							end
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_8 + var_118_9 and arg_115_1.time_ < var_118_8 + var_118_9 + arg_118_0 and not isNil(var_118_7) and arg_115_1.var_.actorSpriteComps10094 then
				for iter_118_3, iter_118_4 in pairs(arg_115_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_118_4 then
						if arg_115_1.isInRecall_ then
							iter_118_4.color = arg_115_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_118_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_115_1.var_.actorSpriteComps10094 = nil
			end

			local var_118_15 = 0
			local var_118_16 = 0.266666666666667

			if var_118_15 < arg_115_1.time_ and arg_115_1.time_ <= var_118_15 + arg_118_0 then
				local var_118_17 = "stop"
				local var_118_18 = "effect"

				arg_115_1:AudioAction(var_118_17, var_118_18, "se_story_side_1096", "se_story_1096_crowd_loop", "")
			end

			local var_118_19 = 0
			local var_118_20 = 1.15

			if var_118_19 < arg_115_1.time_ and arg_115_1.time_ <= var_118_19 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_21 = arg_115_1:GetWordFromCfg(413011028)
				local var_118_22 = arg_115_1:FormatText(var_118_21.content)

				arg_115_1.text_.text = var_118_22

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_23 = 46
				local var_118_24 = utf8.len(var_118_22)
				local var_118_25 = var_118_23 <= 0 and var_118_20 or var_118_20 * (var_118_24 / var_118_23)

				if var_118_25 > 0 and var_118_20 < var_118_25 then
					arg_115_1.talkMaxDuration = var_118_25

					if var_118_25 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_25 + var_118_19
					end
				end

				arg_115_1.text_.text = var_118_22
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_26 = math.max(var_118_20, arg_115_1.talkMaxDuration)

			if var_118_19 <= arg_115_1.time_ and arg_115_1.time_ < var_118_19 + var_118_26 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_19) / var_118_26

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_19 + var_118_26 and arg_115_1.time_ < var_118_19 + var_118_26 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play413011029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 413011029
		arg_119_1.duration_ = 3.67

		local var_119_0 = {
			zh = 2.466,
			ja = 3.666
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
				arg_119_0:Play413011030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10094"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos10094 = var_122_0.localPosition
				var_122_0.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("10094", 3)

				local var_122_2 = var_122_0.childCount

				for iter_122_0 = 0, var_122_2 - 1 do
					local var_122_3 = var_122_0:GetChild(iter_122_0)

					if var_122_3.name == "split_3" or not string.find(var_122_3.name, "split") then
						var_122_3.gameObject:SetActive(true)
					else
						var_122_3.gameObject:SetActive(false)
					end
				end
			end

			local var_122_4 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_4 then
				local var_122_5 = (arg_119_1.time_ - var_122_1) / var_122_4
				local var_122_6 = Vector3.New(0, -340, -414)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10094, var_122_6, var_122_5)
			end

			if arg_119_1.time_ >= var_122_1 + var_122_4 and arg_119_1.time_ < var_122_1 + var_122_4 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_122_7 = arg_119_1.actors_["10094"]
			local var_122_8 = 0

			if var_122_8 < arg_119_1.time_ and arg_119_1.time_ <= var_122_8 + arg_122_0 and not isNil(var_122_7) and arg_119_1.var_.actorSpriteComps10094 == nil then
				arg_119_1.var_.actorSpriteComps10094 = var_122_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_9 = 2

			if var_122_8 <= arg_119_1.time_ and arg_119_1.time_ < var_122_8 + var_122_9 and not isNil(var_122_7) then
				local var_122_10 = (arg_119_1.time_ - var_122_8) / var_122_9

				if arg_119_1.var_.actorSpriteComps10094 then
					for iter_122_1, iter_122_2 in pairs(arg_119_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_122_2 then
							if arg_119_1.isInRecall_ then
								local var_122_11 = Mathf.Lerp(iter_122_2.color.r, arg_119_1.hightColor1.r, var_122_10)
								local var_122_12 = Mathf.Lerp(iter_122_2.color.g, arg_119_1.hightColor1.g, var_122_10)
								local var_122_13 = Mathf.Lerp(iter_122_2.color.b, arg_119_1.hightColor1.b, var_122_10)

								iter_122_2.color = Color.New(var_122_11, var_122_12, var_122_13)
							else
								local var_122_14 = Mathf.Lerp(iter_122_2.color.r, 1, var_122_10)

								iter_122_2.color = Color.New(var_122_14, var_122_14, var_122_14)
							end
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_8 + var_122_9 and arg_119_1.time_ < var_122_8 + var_122_9 + arg_122_0 and not isNil(var_122_7) and arg_119_1.var_.actorSpriteComps10094 then
				for iter_122_3, iter_122_4 in pairs(arg_119_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_122_4 then
						if arg_119_1.isInRecall_ then
							iter_122_4.color = arg_119_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_122_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_119_1.var_.actorSpriteComps10094 = nil
			end

			local var_122_15 = 0
			local var_122_16 = 0.275

			if var_122_15 < arg_119_1.time_ and arg_119_1.time_ <= var_122_15 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_17 = arg_119_1:FormatText(StoryNameCfg[259].name)

				arg_119_1.leftNameTxt_.text = var_122_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_18 = arg_119_1:GetWordFromCfg(413011029)
				local var_122_19 = arg_119_1:FormatText(var_122_18.content)

				arg_119_1.text_.text = var_122_19

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_20 = 11
				local var_122_21 = utf8.len(var_122_19)
				local var_122_22 = var_122_20 <= 0 and var_122_16 or var_122_16 * (var_122_21 / var_122_20)

				if var_122_22 > 0 and var_122_16 < var_122_22 then
					arg_119_1.talkMaxDuration = var_122_22

					if var_122_22 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_22 + var_122_15
					end
				end

				arg_119_1.text_.text = var_122_19
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011029", "story_v_out_413011.awb") ~= 0 then
					local var_122_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011029", "story_v_out_413011.awb") / 1000

					if var_122_23 + var_122_15 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_23 + var_122_15
					end

					if var_122_18.prefab_name ~= "" and arg_119_1.actors_[var_122_18.prefab_name] ~= nil then
						local var_122_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_18.prefab_name].transform, "story_v_out_413011", "413011029", "story_v_out_413011.awb")

						arg_119_1:RecordAudio("413011029", var_122_24)
						arg_119_1:RecordAudio("413011029", var_122_24)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_413011", "413011029", "story_v_out_413011.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_413011", "413011029", "story_v_out_413011.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_25 = math.max(var_122_16, arg_119_1.talkMaxDuration)

			if var_122_15 <= arg_119_1.time_ and arg_119_1.time_ < var_122_15 + var_122_25 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_15) / var_122_25

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_15 + var_122_25 and arg_119_1.time_ < var_122_15 + var_122_25 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play413011030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 413011030
		arg_123_1.duration_ = 13.37

		local var_123_0 = {
			zh = 10.6,
			ja = 13.366
		}
		local var_123_1 = manager.audio:GetLocalizationFlag()

		if var_123_0[var_123_1] ~= nil then
			arg_123_1.duration_ = var_123_0[var_123_1]
		end

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play413011031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = "ST21"

			if arg_123_1.bgs_[var_126_0] == nil then
				local var_126_1 = Object.Instantiate(arg_123_1.paintGo_)

				var_126_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_126_0)
				var_126_1.name = var_126_0
				var_126_1.transform.parent = arg_123_1.stage_.transform
				var_126_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.bgs_[var_126_0] = var_126_1
			end

			local var_126_2 = 2

			if var_126_2 < arg_123_1.time_ and arg_123_1.time_ <= var_126_2 + arg_126_0 then
				local var_126_3 = manager.ui.mainCamera.transform.localPosition
				local var_126_4 = Vector3.New(0, 0, 10) + Vector3.New(var_126_3.x, var_126_3.y, 0)
				local var_126_5 = arg_123_1.bgs_.ST21

				var_126_5.transform.localPosition = var_126_4
				var_126_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_126_6 = var_126_5:GetComponent("SpriteRenderer")

				if var_126_6 and var_126_6.sprite then
					local var_126_7 = (var_126_5.transform.localPosition - var_126_3).z
					local var_126_8 = manager.ui.mainCameraCom_
					local var_126_9 = 2 * var_126_7 * Mathf.Tan(var_126_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_126_10 = var_126_9 * var_126_8.aspect
					local var_126_11 = var_126_6.sprite.bounds.size.x
					local var_126_12 = var_126_6.sprite.bounds.size.y
					local var_126_13 = var_126_10 / var_126_11
					local var_126_14 = var_126_9 / var_126_12
					local var_126_15 = var_126_14 < var_126_13 and var_126_13 or var_126_14

					var_126_5.transform.localScale = Vector3.New(var_126_15, var_126_15, 0)
				end

				for iter_126_0, iter_126_1 in pairs(arg_123_1.bgs_) do
					if iter_126_0 ~= "ST21" then
						iter_126_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_126_16 = 3.999999999999

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 then
				arg_123_1.allBtn_.enabled = false
			end

			local var_126_17 = 0.3

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 then
				arg_123_1.allBtn_.enabled = true
			end

			local var_126_18 = 0

			if var_126_18 < arg_123_1.time_ and arg_123_1.time_ <= var_126_18 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_19 = 2

			if var_126_18 <= arg_123_1.time_ and arg_123_1.time_ < var_126_18 + var_126_19 then
				local var_126_20 = (arg_123_1.time_ - var_126_18) / var_126_19
				local var_126_21 = Color.New(0, 0, 0)

				var_126_21.a = Mathf.Lerp(0, 1, var_126_20)
				arg_123_1.mask_.color = var_126_21
			end

			if arg_123_1.time_ >= var_126_18 + var_126_19 and arg_123_1.time_ < var_126_18 + var_126_19 + arg_126_0 then
				local var_126_22 = Color.New(0, 0, 0)

				var_126_22.a = 1
				arg_123_1.mask_.color = var_126_22
			end

			local var_126_23 = 2

			if var_126_23 < arg_123_1.time_ and arg_123_1.time_ <= var_126_23 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_24 = 2

			if var_126_23 <= arg_123_1.time_ and arg_123_1.time_ < var_126_23 + var_126_24 then
				local var_126_25 = (arg_123_1.time_ - var_126_23) / var_126_24
				local var_126_26 = Color.New(0, 0, 0)

				var_126_26.a = Mathf.Lerp(1, 0, var_126_25)
				arg_123_1.mask_.color = var_126_26
			end

			if arg_123_1.time_ >= var_126_23 + var_126_24 and arg_123_1.time_ < var_126_23 + var_126_24 + arg_126_0 then
				local var_126_27 = Color.New(0, 0, 0)
				local var_126_28 = 0

				arg_123_1.mask_.enabled = false
				var_126_27.a = var_126_28
				arg_123_1.mask_.color = var_126_27
			end

			local var_126_29 = arg_123_1.actors_["10094"].transform
			local var_126_30 = 1.966

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.var_.moveOldPos10094 = var_126_29.localPosition
				var_126_29.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("10094", 7)

				local var_126_31 = var_126_29.childCount

				for iter_126_2 = 0, var_126_31 - 1 do
					local var_126_32 = var_126_29:GetChild(iter_126_2)

					if var_126_32.name == "" or not string.find(var_126_32.name, "split") then
						var_126_32.gameObject:SetActive(true)
					else
						var_126_32.gameObject:SetActive(false)
					end
				end
			end

			local var_126_33 = 0.001

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_33 then
				local var_126_34 = (arg_123_1.time_ - var_126_30) / var_126_33
				local var_126_35 = Vector3.New(0, -2000, 0)

				var_126_29.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10094, var_126_35, var_126_34)
			end

			if arg_123_1.time_ >= var_126_30 + var_126_33 and arg_123_1.time_ < var_126_30 + var_126_33 + arg_126_0 then
				var_126_29.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_126_36 = 2

			arg_123_1.isInRecall_ = true

			if var_126_36 < arg_123_1.time_ and arg_123_1.time_ <= var_126_36 + arg_126_0 then
				arg_123_1.screenFilterGo_:SetActive(true)

				arg_123_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
				arg_123_1.hightColor1 = Color.New(0.82, 0.77, 0.62)
				arg_123_1.hightColor2 = Color.New(0.46, 0.43, 0.35)

				for iter_126_3, iter_126_4 in pairs(arg_123_1.actors_) do
					local var_126_37 = iter_126_4:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_126_5, iter_126_6 in ipairs(var_126_37) do
						if iter_126_6.color.r > 0.51 then
							iter_126_6.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_126_6.color = Color.New(0.46, 0.43, 0.35)
						end
					end
				end
			end

			local var_126_38 = 0.0333333333333332

			if var_126_36 <= arg_123_1.time_ and arg_123_1.time_ < var_126_36 + var_126_38 then
				local var_126_39 = (arg_123_1.time_ - var_126_36) / var_126_38

				arg_123_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_126_39)
			end

			if arg_123_1.time_ >= var_126_36 + var_126_38 and arg_123_1.time_ < var_126_36 + var_126_38 + arg_126_0 then
				arg_123_1.screenFilterEffect_.weight = 1
			end

			if arg_123_1.frameCnt_ <= 1 then
				arg_123_1.dialog_:SetActive(false)
			end

			local var_126_40 = 4
			local var_126_41 = 0.7

			if var_126_40 < arg_123_1.time_ and arg_123_1.time_ <= var_126_40 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				arg_123_1.dialog_:SetActive(true)

				local var_126_42 = LeanTween.value(arg_123_1.dialog_, 0, 1, 0.3)

				var_126_42:setOnUpdate(LuaHelper.FloatAction(function(arg_127_0)
					arg_123_1.dialogCg_.alpha = arg_127_0
				end))
				var_126_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_123_1.dialog_)
					var_126_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_123_1.duration_ = arg_123_1.duration_ + 0.3

				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_43 = arg_123_1:FormatText(StoryNameCfg[205].name)

				arg_123_1.leftNameTxt_.text = var_126_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, true)
				arg_123_1.iconController_:SetSelectedState("hero")

				arg_123_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_123_1.callingController_:SetSelectedState("normal")

				arg_123_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_123_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_126_44 = arg_123_1:GetWordFromCfg(413011030)
				local var_126_45 = arg_123_1:FormatText(var_126_44.content)

				arg_123_1.text_.text = var_126_45

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_46 = 28
				local var_126_47 = utf8.len(var_126_45)
				local var_126_48 = var_126_46 <= 0 and var_126_41 or var_126_41 * (var_126_47 / var_126_46)

				if var_126_48 > 0 and var_126_41 < var_126_48 then
					arg_123_1.talkMaxDuration = var_126_48
					var_126_40 = var_126_40 + 0.3

					if var_126_48 + var_126_40 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_48 + var_126_40
					end
				end

				arg_123_1.text_.text = var_126_45
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011030", "story_v_out_413011.awb") ~= 0 then
					local var_126_49 = manager.audio:GetVoiceLength("story_v_out_413011", "413011030", "story_v_out_413011.awb") / 1000

					if var_126_49 + var_126_40 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_49 + var_126_40
					end

					if var_126_44.prefab_name ~= "" and arg_123_1.actors_[var_126_44.prefab_name] ~= nil then
						local var_126_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_44.prefab_name].transform, "story_v_out_413011", "413011030", "story_v_out_413011.awb")

						arg_123_1:RecordAudio("413011030", var_126_50)
						arg_123_1:RecordAudio("413011030", var_126_50)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_413011", "413011030", "story_v_out_413011.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_413011", "413011030", "story_v_out_413011.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_51 = var_126_40 + 0.3
			local var_126_52 = math.max(var_126_41, arg_123_1.talkMaxDuration)

			if var_126_51 <= arg_123_1.time_ and arg_123_1.time_ < var_126_51 + var_126_52 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_51) / var_126_52

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_51 + var_126_52 and arg_123_1.time_ < var_126_51 + var_126_52 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play413011031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 413011031
		arg_129_1.duration_ = 4.3

		local var_129_0 = {
			zh = 1.666,
			ja = 4.3
		}
		local var_129_1 = manager.audio:GetLocalizationFlag()

		if var_129_0[var_129_1] ~= nil then
			arg_129_1.duration_ = var_129_0[var_129_1]
		end

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play413011032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10094"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos10094 = var_132_0.localPosition
				var_132_0.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("10094", 3)

				local var_132_2 = var_132_0.childCount

				for iter_132_0 = 0, var_132_2 - 1 do
					local var_132_3 = var_132_0:GetChild(iter_132_0)

					if var_132_3.name == "" or not string.find(var_132_3.name, "split") then
						var_132_3.gameObject:SetActive(true)
					else
						var_132_3.gameObject:SetActive(false)
					end
				end
			end

			local var_132_4 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_4 then
				local var_132_5 = (arg_129_1.time_ - var_132_1) / var_132_4
				local var_132_6 = Vector3.New(0, -340, -414)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10094, var_132_6, var_132_5)
			end

			if arg_129_1.time_ >= var_132_1 + var_132_4 and arg_129_1.time_ < var_132_1 + var_132_4 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_132_7 = arg_129_1.actors_["10094"]
			local var_132_8 = 0

			if var_132_8 < arg_129_1.time_ and arg_129_1.time_ <= var_132_8 + arg_132_0 and not isNil(var_132_7) and arg_129_1.var_.actorSpriteComps10094 == nil then
				arg_129_1.var_.actorSpriteComps10094 = var_132_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_9 = 0.2

			if var_132_8 <= arg_129_1.time_ and arg_129_1.time_ < var_132_8 + var_132_9 and not isNil(var_132_7) then
				local var_132_10 = (arg_129_1.time_ - var_132_8) / var_132_9

				if arg_129_1.var_.actorSpriteComps10094 then
					for iter_132_1, iter_132_2 in pairs(arg_129_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_132_2 then
							if arg_129_1.isInRecall_ then
								local var_132_11 = Mathf.Lerp(iter_132_2.color.r, arg_129_1.hightColor1.r, var_132_10)
								local var_132_12 = Mathf.Lerp(iter_132_2.color.g, arg_129_1.hightColor1.g, var_132_10)
								local var_132_13 = Mathf.Lerp(iter_132_2.color.b, arg_129_1.hightColor1.b, var_132_10)

								iter_132_2.color = Color.New(var_132_11, var_132_12, var_132_13)
							else
								local var_132_14 = Mathf.Lerp(iter_132_2.color.r, 1, var_132_10)

								iter_132_2.color = Color.New(var_132_14, var_132_14, var_132_14)
							end
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_8 + var_132_9 and arg_129_1.time_ < var_132_8 + var_132_9 + arg_132_0 and not isNil(var_132_7) and arg_129_1.var_.actorSpriteComps10094 then
				for iter_132_3, iter_132_4 in pairs(arg_129_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_132_4 then
						if arg_129_1.isInRecall_ then
							iter_132_4.color = arg_129_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_132_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_129_1.var_.actorSpriteComps10094 = nil
			end

			local var_132_15 = arg_129_1.actors_["10094"]
			local var_132_16 = 0

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 then
				local var_132_17 = var_132_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_132_17 then
					arg_129_1.var_.alphaOldValue10094 = var_132_17.alpha
					arg_129_1.var_.characterEffect10094 = var_132_17
				end

				arg_129_1.var_.alphaOldValue10094 = 0
			end

			local var_132_18 = 0.2

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_18 then
				local var_132_19 = (arg_129_1.time_ - var_132_16) / var_132_18
				local var_132_20 = Mathf.Lerp(arg_129_1.var_.alphaOldValue10094, 1, var_132_19)

				if arg_129_1.var_.characterEffect10094 then
					arg_129_1.var_.characterEffect10094.alpha = var_132_20
				end
			end

			if arg_129_1.time_ >= var_132_16 + var_132_18 and arg_129_1.time_ < var_132_16 + var_132_18 + arg_132_0 and arg_129_1.var_.characterEffect10094 then
				arg_129_1.var_.characterEffect10094.alpha = 1
			end

			local var_132_21 = 0
			local var_132_22 = 0.175

			if var_132_21 < arg_129_1.time_ and arg_129_1.time_ <= var_132_21 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_23 = arg_129_1:FormatText(StoryNameCfg[259].name)

				arg_129_1.leftNameTxt_.text = var_132_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_24 = arg_129_1:GetWordFromCfg(413011031)
				local var_132_25 = arg_129_1:FormatText(var_132_24.content)

				arg_129_1.text_.text = var_132_25

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_26 = 7
				local var_132_27 = utf8.len(var_132_25)
				local var_132_28 = var_132_26 <= 0 and var_132_22 or var_132_22 * (var_132_27 / var_132_26)

				if var_132_28 > 0 and var_132_22 < var_132_28 then
					arg_129_1.talkMaxDuration = var_132_28

					if var_132_28 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_28 + var_132_21
					end
				end

				arg_129_1.text_.text = var_132_25
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011031", "story_v_out_413011.awb") ~= 0 then
					local var_132_29 = manager.audio:GetVoiceLength("story_v_out_413011", "413011031", "story_v_out_413011.awb") / 1000

					if var_132_29 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_29 + var_132_21
					end

					if var_132_24.prefab_name ~= "" and arg_129_1.actors_[var_132_24.prefab_name] ~= nil then
						local var_132_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_24.prefab_name].transform, "story_v_out_413011", "413011031", "story_v_out_413011.awb")

						arg_129_1:RecordAudio("413011031", var_132_30)
						arg_129_1:RecordAudio("413011031", var_132_30)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_413011", "413011031", "story_v_out_413011.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_413011", "413011031", "story_v_out_413011.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_31 = math.max(var_132_22, arg_129_1.talkMaxDuration)

			if var_132_21 <= arg_129_1.time_ and arg_129_1.time_ < var_132_21 + var_132_31 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_21) / var_132_31

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_21 + var_132_31 and arg_129_1.time_ < var_132_21 + var_132_31 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play413011032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 413011032
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play413011033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10094"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and not isNil(var_136_0) and arg_133_1.var_.actorSpriteComps10094 == nil then
				arg_133_1.var_.actorSpriteComps10094 = var_136_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_136_2 = 2

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 and not isNil(var_136_0) then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.actorSpriteComps10094 then
					for iter_136_0, iter_136_1 in pairs(arg_133_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_136_1 then
							if arg_133_1.isInRecall_ then
								local var_136_4 = Mathf.Lerp(iter_136_1.color.r, arg_133_1.hightColor2.r, var_136_3)
								local var_136_5 = Mathf.Lerp(iter_136_1.color.g, arg_133_1.hightColor2.g, var_136_3)
								local var_136_6 = Mathf.Lerp(iter_136_1.color.b, arg_133_1.hightColor2.b, var_136_3)

								iter_136_1.color = Color.New(var_136_4, var_136_5, var_136_6)
							else
								local var_136_7 = Mathf.Lerp(iter_136_1.color.r, 0.5, var_136_3)

								iter_136_1.color = Color.New(var_136_7, var_136_7, var_136_7)
							end
						end
					end
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and not isNil(var_136_0) and arg_133_1.var_.actorSpriteComps10094 then
				for iter_136_2, iter_136_3 in pairs(arg_133_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_136_3 then
						if arg_133_1.isInRecall_ then
							iter_136_3.color = arg_133_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_136_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_133_1.var_.actorSpriteComps10094 = nil
			end

			local var_136_8 = 0
			local var_136_9 = 0.975

			if var_136_8 < arg_133_1.time_ and arg_133_1.time_ <= var_136_8 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_10 = arg_133_1:GetWordFromCfg(413011032)
				local var_136_11 = arg_133_1:FormatText(var_136_10.content)

				arg_133_1.text_.text = var_136_11

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_12 = 39
				local var_136_13 = utf8.len(var_136_11)
				local var_136_14 = var_136_12 <= 0 and var_136_9 or var_136_9 * (var_136_13 / var_136_12)

				if var_136_14 > 0 and var_136_9 < var_136_14 then
					arg_133_1.talkMaxDuration = var_136_14

					if var_136_14 + var_136_8 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_14 + var_136_8
					end
				end

				arg_133_1.text_.text = var_136_11
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_15 = math.max(var_136_9, arg_133_1.talkMaxDuration)

			if var_136_8 <= arg_133_1.time_ and arg_133_1.time_ < var_136_8 + var_136_15 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_8) / var_136_15

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_8 + var_136_15 and arg_133_1.time_ < var_136_8 + var_136_15 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play413011033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 413011033
		arg_137_1.duration_ = 12.27

		local var_137_0 = {
			zh = 8,
			ja = 12.266
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
				arg_137_0:Play413011034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10094"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and not isNil(var_140_0) and arg_137_1.var_.actorSpriteComps10094 == nil then
				arg_137_1.var_.actorSpriteComps10094 = var_140_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_140_2 = 0.2

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 and not isNil(var_140_0) then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.actorSpriteComps10094 then
					for iter_140_0, iter_140_1 in pairs(arg_137_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_140_1 then
							if arg_137_1.isInRecall_ then
								local var_140_4 = Mathf.Lerp(iter_140_1.color.r, arg_137_1.hightColor2.r, var_140_3)
								local var_140_5 = Mathf.Lerp(iter_140_1.color.g, arg_137_1.hightColor2.g, var_140_3)
								local var_140_6 = Mathf.Lerp(iter_140_1.color.b, arg_137_1.hightColor2.b, var_140_3)

								iter_140_1.color = Color.New(var_140_4, var_140_5, var_140_6)
							else
								local var_140_7 = Mathf.Lerp(iter_140_1.color.r, 0.5, var_140_3)

								iter_140_1.color = Color.New(var_140_7, var_140_7, var_140_7)
							end
						end
					end
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and not isNil(var_140_0) and arg_137_1.var_.actorSpriteComps10094 then
				for iter_140_2, iter_140_3 in pairs(arg_137_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_140_3 then
						if arg_137_1.isInRecall_ then
							iter_140_3.color = arg_137_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_140_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_137_1.var_.actorSpriteComps10094 = nil
			end

			local var_140_8 = 0
			local var_140_9 = 0.725

			if var_140_8 < arg_137_1.time_ and arg_137_1.time_ <= var_140_8 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_10 = arg_137_1:FormatText(StoryNameCfg[205].name)

				arg_137_1.leftNameTxt_.text = var_140_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, true)
				arg_137_1.iconController_:SetSelectedState("hero")

				arg_137_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_137_1.callingController_:SetSelectedState("normal")

				arg_137_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_137_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_140_11 = arg_137_1:GetWordFromCfg(413011033)
				local var_140_12 = arg_137_1:FormatText(var_140_11.content)

				arg_137_1.text_.text = var_140_12

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_13 = 29
				local var_140_14 = utf8.len(var_140_12)
				local var_140_15 = var_140_13 <= 0 and var_140_9 or var_140_9 * (var_140_14 / var_140_13)

				if var_140_15 > 0 and var_140_9 < var_140_15 then
					arg_137_1.talkMaxDuration = var_140_15

					if var_140_15 + var_140_8 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_15 + var_140_8
					end
				end

				arg_137_1.text_.text = var_140_12
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011033", "story_v_out_413011.awb") ~= 0 then
					local var_140_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011033", "story_v_out_413011.awb") / 1000

					if var_140_16 + var_140_8 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_16 + var_140_8
					end

					if var_140_11.prefab_name ~= "" and arg_137_1.actors_[var_140_11.prefab_name] ~= nil then
						local var_140_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_11.prefab_name].transform, "story_v_out_413011", "413011033", "story_v_out_413011.awb")

						arg_137_1:RecordAudio("413011033", var_140_17)
						arg_137_1:RecordAudio("413011033", var_140_17)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_413011", "413011033", "story_v_out_413011.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_413011", "413011033", "story_v_out_413011.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_18 = math.max(var_140_9, arg_137_1.talkMaxDuration)

			if var_140_8 <= arg_137_1.time_ and arg_137_1.time_ < var_140_8 + var_140_18 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_8) / var_140_18

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_8 + var_140_18 and arg_137_1.time_ < var_140_8 + var_140_18 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play413011034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 413011034
		arg_141_1.duration_ = 4

		local var_141_0 = {
			zh = 4,
			ja = 3.366
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
				arg_141_0:Play413011035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10094"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and not isNil(var_144_0) and arg_141_1.var_.actorSpriteComps10094 == nil then
				arg_141_1.var_.actorSpriteComps10094 = var_144_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_2 = 2

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 and not isNil(var_144_0) then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.actorSpriteComps10094 then
					for iter_144_0, iter_144_1 in pairs(arg_141_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_144_1 then
							if arg_141_1.isInRecall_ then
								local var_144_4 = Mathf.Lerp(iter_144_1.color.r, arg_141_1.hightColor1.r, var_144_3)
								local var_144_5 = Mathf.Lerp(iter_144_1.color.g, arg_141_1.hightColor1.g, var_144_3)
								local var_144_6 = Mathf.Lerp(iter_144_1.color.b, arg_141_1.hightColor1.b, var_144_3)

								iter_144_1.color = Color.New(var_144_4, var_144_5, var_144_6)
							else
								local var_144_7 = Mathf.Lerp(iter_144_1.color.r, 1, var_144_3)

								iter_144_1.color = Color.New(var_144_7, var_144_7, var_144_7)
							end
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and not isNil(var_144_0) and arg_141_1.var_.actorSpriteComps10094 then
				for iter_144_2, iter_144_3 in pairs(arg_141_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_144_3 then
						if arg_141_1.isInRecall_ then
							iter_144_3.color = arg_141_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_144_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_141_1.var_.actorSpriteComps10094 = nil
			end

			local var_144_8 = 0
			local var_144_9 = 0.5

			if var_144_8 < arg_141_1.time_ and arg_141_1.time_ <= var_144_8 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_10 = arg_141_1:FormatText(StoryNameCfg[259].name)

				arg_141_1.leftNameTxt_.text = var_144_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_11 = arg_141_1:GetWordFromCfg(413011034)
				local var_144_12 = arg_141_1:FormatText(var_144_11.content)

				arg_141_1.text_.text = var_144_12

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_13 = 20
				local var_144_14 = utf8.len(var_144_12)
				local var_144_15 = var_144_13 <= 0 and var_144_9 or var_144_9 * (var_144_14 / var_144_13)

				if var_144_15 > 0 and var_144_9 < var_144_15 then
					arg_141_1.talkMaxDuration = var_144_15

					if var_144_15 + var_144_8 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_15 + var_144_8
					end
				end

				arg_141_1.text_.text = var_144_12
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011034", "story_v_out_413011.awb") ~= 0 then
					local var_144_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011034", "story_v_out_413011.awb") / 1000

					if var_144_16 + var_144_8 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_16 + var_144_8
					end

					if var_144_11.prefab_name ~= "" and arg_141_1.actors_[var_144_11.prefab_name] ~= nil then
						local var_144_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_11.prefab_name].transform, "story_v_out_413011", "413011034", "story_v_out_413011.awb")

						arg_141_1:RecordAudio("413011034", var_144_17)
						arg_141_1:RecordAudio("413011034", var_144_17)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_413011", "413011034", "story_v_out_413011.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_413011", "413011034", "story_v_out_413011.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_18 = math.max(var_144_9, arg_141_1.talkMaxDuration)

			if var_144_8 <= arg_141_1.time_ and arg_141_1.time_ < var_144_8 + var_144_18 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_8) / var_144_18

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_8 + var_144_18 and arg_141_1.time_ < var_144_8 + var_144_18 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play413011035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 413011035
		arg_145_1.duration_ = 7.33

		local var_145_0 = {
			zh = 6,
			ja = 7.333
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
				arg_145_0:Play413011036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["10094"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and not isNil(var_148_0) and arg_145_1.var_.actorSpriteComps10094 == nil then
				arg_145_1.var_.actorSpriteComps10094 = var_148_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_2 = 2

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 and not isNil(var_148_0) then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.actorSpriteComps10094 then
					for iter_148_0, iter_148_1 in pairs(arg_145_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_148_1 then
							if arg_145_1.isInRecall_ then
								local var_148_4 = Mathf.Lerp(iter_148_1.color.r, arg_145_1.hightColor2.r, var_148_3)
								local var_148_5 = Mathf.Lerp(iter_148_1.color.g, arg_145_1.hightColor2.g, var_148_3)
								local var_148_6 = Mathf.Lerp(iter_148_1.color.b, arg_145_1.hightColor2.b, var_148_3)

								iter_148_1.color = Color.New(var_148_4, var_148_5, var_148_6)
							else
								local var_148_7 = Mathf.Lerp(iter_148_1.color.r, 0.5, var_148_3)

								iter_148_1.color = Color.New(var_148_7, var_148_7, var_148_7)
							end
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and not isNil(var_148_0) and arg_145_1.var_.actorSpriteComps10094 then
				for iter_148_2, iter_148_3 in pairs(arg_145_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_148_3 then
						if arg_145_1.isInRecall_ then
							iter_148_3.color = arg_145_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_148_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_145_1.var_.actorSpriteComps10094 = nil
			end

			local var_148_8 = 0
			local var_148_9 = 0.65

			if var_148_8 < arg_145_1.time_ and arg_145_1.time_ <= var_148_8 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_10 = arg_145_1:FormatText(StoryNameCfg[205].name)

				arg_145_1.leftNameTxt_.text = var_148_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, true)
				arg_145_1.iconController_:SetSelectedState("hero")

				arg_145_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_145_1.callingController_:SetSelectedState("normal")

				arg_145_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_145_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_148_11 = arg_145_1:GetWordFromCfg(413011035)
				local var_148_12 = arg_145_1:FormatText(var_148_11.content)

				arg_145_1.text_.text = var_148_12

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_13 = 24
				local var_148_14 = utf8.len(var_148_12)
				local var_148_15 = var_148_13 <= 0 and var_148_9 or var_148_9 * (var_148_14 / var_148_13)

				if var_148_15 > 0 and var_148_9 < var_148_15 then
					arg_145_1.talkMaxDuration = var_148_15

					if var_148_15 + var_148_8 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_15 + var_148_8
					end
				end

				arg_145_1.text_.text = var_148_12
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011035", "story_v_out_413011.awb") ~= 0 then
					local var_148_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011035", "story_v_out_413011.awb") / 1000

					if var_148_16 + var_148_8 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_16 + var_148_8
					end

					if var_148_11.prefab_name ~= "" and arg_145_1.actors_[var_148_11.prefab_name] ~= nil then
						local var_148_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_11.prefab_name].transform, "story_v_out_413011", "413011035", "story_v_out_413011.awb")

						arg_145_1:RecordAudio("413011035", var_148_17)
						arg_145_1:RecordAudio("413011035", var_148_17)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_413011", "413011035", "story_v_out_413011.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_413011", "413011035", "story_v_out_413011.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_18 = math.max(var_148_9, arg_145_1.talkMaxDuration)

			if var_148_8 <= arg_145_1.time_ and arg_145_1.time_ < var_148_8 + var_148_18 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_8) / var_148_18

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_8 + var_148_18 and arg_145_1.time_ < var_148_8 + var_148_18 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play413011036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 413011036
		arg_149_1.duration_ = 9.53

		local var_149_0 = {
			zh = 5.2,
			ja = 9.533
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
				arg_149_0:Play413011037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10094"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos10094 = var_152_0.localPosition
				var_152_0.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("10094", 3)

				local var_152_2 = var_152_0.childCount

				for iter_152_0 = 0, var_152_2 - 1 do
					local var_152_3 = var_152_0:GetChild(iter_152_0)

					if var_152_3.name == "" or not string.find(var_152_3.name, "split") then
						var_152_3.gameObject:SetActive(true)
					else
						var_152_3.gameObject:SetActive(false)
					end
				end
			end

			local var_152_4 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_4 then
				local var_152_5 = (arg_149_1.time_ - var_152_1) / var_152_4
				local var_152_6 = Vector3.New(0, -340, -414)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos10094, var_152_6, var_152_5)
			end

			if arg_149_1.time_ >= var_152_1 + var_152_4 and arg_149_1.time_ < var_152_1 + var_152_4 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_152_7 = arg_149_1.actors_["10094"]
			local var_152_8 = 0

			if var_152_8 < arg_149_1.time_ and arg_149_1.time_ <= var_152_8 + arg_152_0 and not isNil(var_152_7) and arg_149_1.var_.actorSpriteComps10094 == nil then
				arg_149_1.var_.actorSpriteComps10094 = var_152_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_152_9 = 2

			if var_152_8 <= arg_149_1.time_ and arg_149_1.time_ < var_152_8 + var_152_9 and not isNil(var_152_7) then
				local var_152_10 = (arg_149_1.time_ - var_152_8) / var_152_9

				if arg_149_1.var_.actorSpriteComps10094 then
					for iter_152_1, iter_152_2 in pairs(arg_149_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_152_2 then
							if arg_149_1.isInRecall_ then
								local var_152_11 = Mathf.Lerp(iter_152_2.color.r, arg_149_1.hightColor1.r, var_152_10)
								local var_152_12 = Mathf.Lerp(iter_152_2.color.g, arg_149_1.hightColor1.g, var_152_10)
								local var_152_13 = Mathf.Lerp(iter_152_2.color.b, arg_149_1.hightColor1.b, var_152_10)

								iter_152_2.color = Color.New(var_152_11, var_152_12, var_152_13)
							else
								local var_152_14 = Mathf.Lerp(iter_152_2.color.r, 1, var_152_10)

								iter_152_2.color = Color.New(var_152_14, var_152_14, var_152_14)
							end
						end
					end
				end
			end

			if arg_149_1.time_ >= var_152_8 + var_152_9 and arg_149_1.time_ < var_152_8 + var_152_9 + arg_152_0 and not isNil(var_152_7) and arg_149_1.var_.actorSpriteComps10094 then
				for iter_152_3, iter_152_4 in pairs(arg_149_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_152_4 then
						if arg_149_1.isInRecall_ then
							iter_152_4.color = arg_149_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_152_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_149_1.var_.actorSpriteComps10094 = nil
			end

			local var_152_15 = 0
			local var_152_16 = 0.55

			if var_152_15 < arg_149_1.time_ and arg_149_1.time_ <= var_152_15 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_17 = arg_149_1:FormatText(StoryNameCfg[259].name)

				arg_149_1.leftNameTxt_.text = var_152_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_18 = arg_149_1:GetWordFromCfg(413011036)
				local var_152_19 = arg_149_1:FormatText(var_152_18.content)

				arg_149_1.text_.text = var_152_19

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_20 = 22
				local var_152_21 = utf8.len(var_152_19)
				local var_152_22 = var_152_20 <= 0 and var_152_16 or var_152_16 * (var_152_21 / var_152_20)

				if var_152_22 > 0 and var_152_16 < var_152_22 then
					arg_149_1.talkMaxDuration = var_152_22

					if var_152_22 + var_152_15 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_22 + var_152_15
					end
				end

				arg_149_1.text_.text = var_152_19
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011036", "story_v_out_413011.awb") ~= 0 then
					local var_152_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011036", "story_v_out_413011.awb") / 1000

					if var_152_23 + var_152_15 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_23 + var_152_15
					end

					if var_152_18.prefab_name ~= "" and arg_149_1.actors_[var_152_18.prefab_name] ~= nil then
						local var_152_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_18.prefab_name].transform, "story_v_out_413011", "413011036", "story_v_out_413011.awb")

						arg_149_1:RecordAudio("413011036", var_152_24)
						arg_149_1:RecordAudio("413011036", var_152_24)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_413011", "413011036", "story_v_out_413011.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_413011", "413011036", "story_v_out_413011.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_25 = math.max(var_152_16, arg_149_1.talkMaxDuration)

			if var_152_15 <= arg_149_1.time_ and arg_149_1.time_ < var_152_15 + var_152_25 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_15) / var_152_25

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_15 + var_152_25 and arg_149_1.time_ < var_152_15 + var_152_25 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play413011037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 413011037
		arg_153_1.duration_ = 10.73

		local var_153_0 = {
			zh = 9.2,
			ja = 10.733
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
				arg_153_0:Play413011038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10094"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and not isNil(var_156_0) and arg_153_1.var_.actorSpriteComps10094 == nil then
				arg_153_1.var_.actorSpriteComps10094 = var_156_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_156_2 = 2

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 and not isNil(var_156_0) then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.actorSpriteComps10094 then
					for iter_156_0, iter_156_1 in pairs(arg_153_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_156_1 then
							if arg_153_1.isInRecall_ then
								local var_156_4 = Mathf.Lerp(iter_156_1.color.r, arg_153_1.hightColor2.r, var_156_3)
								local var_156_5 = Mathf.Lerp(iter_156_1.color.g, arg_153_1.hightColor2.g, var_156_3)
								local var_156_6 = Mathf.Lerp(iter_156_1.color.b, arg_153_1.hightColor2.b, var_156_3)

								iter_156_1.color = Color.New(var_156_4, var_156_5, var_156_6)
							else
								local var_156_7 = Mathf.Lerp(iter_156_1.color.r, 0.5, var_156_3)

								iter_156_1.color = Color.New(var_156_7, var_156_7, var_156_7)
							end
						end
					end
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and not isNil(var_156_0) and arg_153_1.var_.actorSpriteComps10094 then
				for iter_156_2, iter_156_3 in pairs(arg_153_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_156_3 then
						if arg_153_1.isInRecall_ then
							iter_156_3.color = arg_153_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_156_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_153_1.var_.actorSpriteComps10094 = nil
			end

			local var_156_8 = 0
			local var_156_9 = 0.95

			if var_156_8 < arg_153_1.time_ and arg_153_1.time_ <= var_156_8 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_10 = arg_153_1:FormatText(StoryNameCfg[205].name)

				arg_153_1.leftNameTxt_.text = var_156_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, true)
				arg_153_1.iconController_:SetSelectedState("hero")

				arg_153_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_153_1.callingController_:SetSelectedState("normal")

				arg_153_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_153_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_156_11 = arg_153_1:GetWordFromCfg(413011037)
				local var_156_12 = arg_153_1:FormatText(var_156_11.content)

				arg_153_1.text_.text = var_156_12

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_13 = 38
				local var_156_14 = utf8.len(var_156_12)
				local var_156_15 = var_156_13 <= 0 and var_156_9 or var_156_9 * (var_156_14 / var_156_13)

				if var_156_15 > 0 and var_156_9 < var_156_15 then
					arg_153_1.talkMaxDuration = var_156_15

					if var_156_15 + var_156_8 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_15 + var_156_8
					end
				end

				arg_153_1.text_.text = var_156_12
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011037", "story_v_out_413011.awb") ~= 0 then
					local var_156_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011037", "story_v_out_413011.awb") / 1000

					if var_156_16 + var_156_8 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_16 + var_156_8
					end

					if var_156_11.prefab_name ~= "" and arg_153_1.actors_[var_156_11.prefab_name] ~= nil then
						local var_156_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_11.prefab_name].transform, "story_v_out_413011", "413011037", "story_v_out_413011.awb")

						arg_153_1:RecordAudio("413011037", var_156_17)
						arg_153_1:RecordAudio("413011037", var_156_17)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_413011", "413011037", "story_v_out_413011.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_413011", "413011037", "story_v_out_413011.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_18 = math.max(var_156_9, arg_153_1.talkMaxDuration)

			if var_156_8 <= arg_153_1.time_ and arg_153_1.time_ < var_156_8 + var_156_18 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_8) / var_156_18

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_8 + var_156_18 and arg_153_1.time_ < var_156_8 + var_156_18 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play413011038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 413011038
		arg_157_1.duration_ = 2

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play413011039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10094"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and not isNil(var_160_0) and arg_157_1.var_.actorSpriteComps10094 == nil then
				arg_157_1.var_.actorSpriteComps10094 = var_160_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_2 = 2

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 and not isNil(var_160_0) then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.actorSpriteComps10094 then
					for iter_160_0, iter_160_1 in pairs(arg_157_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_160_1 then
							if arg_157_1.isInRecall_ then
								local var_160_4 = Mathf.Lerp(iter_160_1.color.r, arg_157_1.hightColor1.r, var_160_3)
								local var_160_5 = Mathf.Lerp(iter_160_1.color.g, arg_157_1.hightColor1.g, var_160_3)
								local var_160_6 = Mathf.Lerp(iter_160_1.color.b, arg_157_1.hightColor1.b, var_160_3)

								iter_160_1.color = Color.New(var_160_4, var_160_5, var_160_6)
							else
								local var_160_7 = Mathf.Lerp(iter_160_1.color.r, 1, var_160_3)

								iter_160_1.color = Color.New(var_160_7, var_160_7, var_160_7)
							end
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and not isNil(var_160_0) and arg_157_1.var_.actorSpriteComps10094 then
				for iter_160_2, iter_160_3 in pairs(arg_157_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_160_3 then
						if arg_157_1.isInRecall_ then
							iter_160_3.color = arg_157_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_160_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_157_1.var_.actorSpriteComps10094 = nil
			end

			local var_160_8 = 0
			local var_160_9 = 0.175

			if var_160_8 < arg_157_1.time_ and arg_157_1.time_ <= var_160_8 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_10 = arg_157_1:FormatText(StoryNameCfg[259].name)

				arg_157_1.leftNameTxt_.text = var_160_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_11 = arg_157_1:GetWordFromCfg(413011038)
				local var_160_12 = arg_157_1:FormatText(var_160_11.content)

				arg_157_1.text_.text = var_160_12

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_13 = 7
				local var_160_14 = utf8.len(var_160_12)
				local var_160_15 = var_160_13 <= 0 and var_160_9 or var_160_9 * (var_160_14 / var_160_13)

				if var_160_15 > 0 and var_160_9 < var_160_15 then
					arg_157_1.talkMaxDuration = var_160_15

					if var_160_15 + var_160_8 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_15 + var_160_8
					end
				end

				arg_157_1.text_.text = var_160_12
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011038", "story_v_out_413011.awb") ~= 0 then
					local var_160_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011038", "story_v_out_413011.awb") / 1000

					if var_160_16 + var_160_8 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_16 + var_160_8
					end

					if var_160_11.prefab_name ~= "" and arg_157_1.actors_[var_160_11.prefab_name] ~= nil then
						local var_160_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_11.prefab_name].transform, "story_v_out_413011", "413011038", "story_v_out_413011.awb")

						arg_157_1:RecordAudio("413011038", var_160_17)
						arg_157_1:RecordAudio("413011038", var_160_17)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_413011", "413011038", "story_v_out_413011.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_413011", "413011038", "story_v_out_413011.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_18 = math.max(var_160_9, arg_157_1.talkMaxDuration)

			if var_160_8 <= arg_157_1.time_ and arg_157_1.time_ < var_160_8 + var_160_18 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_8) / var_160_18

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_8 + var_160_18 and arg_157_1.time_ < var_160_8 + var_160_18 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play413011039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 413011039
		arg_161_1.duration_ = 6.83

		local var_161_0 = {
			zh = 4.266,
			ja = 6.833
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
				arg_161_0:Play413011040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10094"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and not isNil(var_164_0) and arg_161_1.var_.actorSpriteComps10094 == nil then
				arg_161_1.var_.actorSpriteComps10094 = var_164_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_2 = 2

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 and not isNil(var_164_0) then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.actorSpriteComps10094 then
					for iter_164_0, iter_164_1 in pairs(arg_161_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_164_1 then
							if arg_161_1.isInRecall_ then
								local var_164_4 = Mathf.Lerp(iter_164_1.color.r, arg_161_1.hightColor2.r, var_164_3)
								local var_164_5 = Mathf.Lerp(iter_164_1.color.g, arg_161_1.hightColor2.g, var_164_3)
								local var_164_6 = Mathf.Lerp(iter_164_1.color.b, arg_161_1.hightColor2.b, var_164_3)

								iter_164_1.color = Color.New(var_164_4, var_164_5, var_164_6)
							else
								local var_164_7 = Mathf.Lerp(iter_164_1.color.r, 0.5, var_164_3)

								iter_164_1.color = Color.New(var_164_7, var_164_7, var_164_7)
							end
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and not isNil(var_164_0) and arg_161_1.var_.actorSpriteComps10094 then
				for iter_164_2, iter_164_3 in pairs(arg_161_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_164_3 then
						if arg_161_1.isInRecall_ then
							iter_164_3.color = arg_161_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_164_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_161_1.var_.actorSpriteComps10094 = nil
			end

			local var_164_8 = 0
			local var_164_9 = 0.45

			if var_164_8 < arg_161_1.time_ and arg_161_1.time_ <= var_164_8 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_10 = arg_161_1:FormatText(StoryNameCfg[205].name)

				arg_161_1.leftNameTxt_.text = var_164_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, true)
				arg_161_1.iconController_:SetSelectedState("hero")

				arg_161_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_161_1.callingController_:SetSelectedState("normal")

				arg_161_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_161_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_164_11 = arg_161_1:GetWordFromCfg(413011039)
				local var_164_12 = arg_161_1:FormatText(var_164_11.content)

				arg_161_1.text_.text = var_164_12

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_13 = 18
				local var_164_14 = utf8.len(var_164_12)
				local var_164_15 = var_164_13 <= 0 and var_164_9 or var_164_9 * (var_164_14 / var_164_13)

				if var_164_15 > 0 and var_164_9 < var_164_15 then
					arg_161_1.talkMaxDuration = var_164_15

					if var_164_15 + var_164_8 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_15 + var_164_8
					end
				end

				arg_161_1.text_.text = var_164_12
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011039", "story_v_out_413011.awb") ~= 0 then
					local var_164_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011039", "story_v_out_413011.awb") / 1000

					if var_164_16 + var_164_8 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_16 + var_164_8
					end

					if var_164_11.prefab_name ~= "" and arg_161_1.actors_[var_164_11.prefab_name] ~= nil then
						local var_164_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_11.prefab_name].transform, "story_v_out_413011", "413011039", "story_v_out_413011.awb")

						arg_161_1:RecordAudio("413011039", var_164_17)
						arg_161_1:RecordAudio("413011039", var_164_17)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_413011", "413011039", "story_v_out_413011.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_413011", "413011039", "story_v_out_413011.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_18 = math.max(var_164_9, arg_161_1.talkMaxDuration)

			if var_164_8 <= arg_161_1.time_ and arg_161_1.time_ < var_164_8 + var_164_18 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_8) / var_164_18

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_8 + var_164_18 and arg_161_1.time_ < var_164_8 + var_164_18 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play413011040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 413011040
		arg_165_1.duration_ = 16.9

		local var_165_0 = {
			zh = 9.2,
			ja = 16.9
		}
		local var_165_1 = manager.audio:GetLocalizationFlag()

		if var_165_0[var_165_1] ~= nil then
			arg_165_1.duration_ = var_165_0[var_165_1]
		end

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play413011041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 1.15

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[205].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, true)
				arg_165_1.iconController_:SetSelectedState("hero")

				arg_165_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_165_1.callingController_:SetSelectedState("normal")

				arg_165_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_165_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_168_3 = arg_165_1:GetWordFromCfg(413011040)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 46
				local var_168_6 = utf8.len(var_168_4)
				local var_168_7 = var_168_5 <= 0 and var_168_1 or var_168_1 * (var_168_6 / var_168_5)

				if var_168_7 > 0 and var_168_1 < var_168_7 then
					arg_165_1.talkMaxDuration = var_168_7

					if var_168_7 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_7 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_4
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011040", "story_v_out_413011.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011040", "story_v_out_413011.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_out_413011", "413011040", "story_v_out_413011.awb")

						arg_165_1:RecordAudio("413011040", var_168_9)
						arg_165_1:RecordAudio("413011040", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_413011", "413011040", "story_v_out_413011.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_413011", "413011040", "story_v_out_413011.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_10 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_10 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_10

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_10 and arg_165_1.time_ < var_168_0 + var_168_10 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play413011041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 413011041
		arg_169_1.duration_ = 4.83

		local var_169_0 = {
			zh = 2.7,
			ja = 4.833
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
				arg_169_0:Play413011042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10094"]
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 and not isNil(var_172_0) and arg_169_1.var_.actorSpriteComps10094 == nil then
				arg_169_1.var_.actorSpriteComps10094 = var_172_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_172_2 = 2

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 and not isNil(var_172_0) then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2

				if arg_169_1.var_.actorSpriteComps10094 then
					for iter_172_0, iter_172_1 in pairs(arg_169_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_172_1 then
							if arg_169_1.isInRecall_ then
								local var_172_4 = Mathf.Lerp(iter_172_1.color.r, arg_169_1.hightColor1.r, var_172_3)
								local var_172_5 = Mathf.Lerp(iter_172_1.color.g, arg_169_1.hightColor1.g, var_172_3)
								local var_172_6 = Mathf.Lerp(iter_172_1.color.b, arg_169_1.hightColor1.b, var_172_3)

								iter_172_1.color = Color.New(var_172_4, var_172_5, var_172_6)
							else
								local var_172_7 = Mathf.Lerp(iter_172_1.color.r, 1, var_172_3)

								iter_172_1.color = Color.New(var_172_7, var_172_7, var_172_7)
							end
						end
					end
				end
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 and not isNil(var_172_0) and arg_169_1.var_.actorSpriteComps10094 then
				for iter_172_2, iter_172_3 in pairs(arg_169_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_172_3 then
						if arg_169_1.isInRecall_ then
							iter_172_3.color = arg_169_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_172_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_169_1.var_.actorSpriteComps10094 = nil
			end

			local var_172_8 = 0
			local var_172_9 = 0.375

			if var_172_8 < arg_169_1.time_ and arg_169_1.time_ <= var_172_8 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_10 = arg_169_1:FormatText(StoryNameCfg[259].name)

				arg_169_1.leftNameTxt_.text = var_172_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_11 = arg_169_1:GetWordFromCfg(413011041)
				local var_172_12 = arg_169_1:FormatText(var_172_11.content)

				arg_169_1.text_.text = var_172_12

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_13 = 15
				local var_172_14 = utf8.len(var_172_12)
				local var_172_15 = var_172_13 <= 0 and var_172_9 or var_172_9 * (var_172_14 / var_172_13)

				if var_172_15 > 0 and var_172_9 < var_172_15 then
					arg_169_1.talkMaxDuration = var_172_15

					if var_172_15 + var_172_8 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_15 + var_172_8
					end
				end

				arg_169_1.text_.text = var_172_12
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011041", "story_v_out_413011.awb") ~= 0 then
					local var_172_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011041", "story_v_out_413011.awb") / 1000

					if var_172_16 + var_172_8 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_16 + var_172_8
					end

					if var_172_11.prefab_name ~= "" and arg_169_1.actors_[var_172_11.prefab_name] ~= nil then
						local var_172_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_11.prefab_name].transform, "story_v_out_413011", "413011041", "story_v_out_413011.awb")

						arg_169_1:RecordAudio("413011041", var_172_17)
						arg_169_1:RecordAudio("413011041", var_172_17)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_413011", "413011041", "story_v_out_413011.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_413011", "413011041", "story_v_out_413011.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_18 = math.max(var_172_9, arg_169_1.talkMaxDuration)

			if var_172_8 <= arg_169_1.time_ and arg_169_1.time_ < var_172_8 + var_172_18 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_8) / var_172_18

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_8 + var_172_18 and arg_169_1.time_ < var_172_8 + var_172_18 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play413011042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 413011042
		arg_173_1.duration_ = 7.7

		local var_173_0 = {
			zh = 4.433,
			ja = 7.7
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
				arg_173_0:Play413011043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["10094"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and not isNil(var_176_0) and arg_173_1.var_.actorSpriteComps10094 == nil then
				arg_173_1.var_.actorSpriteComps10094 = var_176_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_2 = 2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 and not isNil(var_176_0) then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.actorSpriteComps10094 then
					for iter_176_0, iter_176_1 in pairs(arg_173_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_176_1 then
							if arg_173_1.isInRecall_ then
								local var_176_4 = Mathf.Lerp(iter_176_1.color.r, arg_173_1.hightColor2.r, var_176_3)
								local var_176_5 = Mathf.Lerp(iter_176_1.color.g, arg_173_1.hightColor2.g, var_176_3)
								local var_176_6 = Mathf.Lerp(iter_176_1.color.b, arg_173_1.hightColor2.b, var_176_3)

								iter_176_1.color = Color.New(var_176_4, var_176_5, var_176_6)
							else
								local var_176_7 = Mathf.Lerp(iter_176_1.color.r, 0.5, var_176_3)

								iter_176_1.color = Color.New(var_176_7, var_176_7, var_176_7)
							end
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and not isNil(var_176_0) and arg_173_1.var_.actorSpriteComps10094 then
				for iter_176_2, iter_176_3 in pairs(arg_173_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_176_3 then
						if arg_173_1.isInRecall_ then
							iter_176_3.color = arg_173_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_176_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_173_1.var_.actorSpriteComps10094 = nil
			end

			local var_176_8 = 0
			local var_176_9 = 0.45

			if var_176_8 < arg_173_1.time_ and arg_173_1.time_ <= var_176_8 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_10 = arg_173_1:FormatText(StoryNameCfg[205].name)

				arg_173_1.leftNameTxt_.text = var_176_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, true)
				arg_173_1.iconController_:SetSelectedState("hero")

				arg_173_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_173_1.callingController_:SetSelectedState("normal")

				arg_173_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_173_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_176_11 = arg_173_1:GetWordFromCfg(413011042)
				local var_176_12 = arg_173_1:FormatText(var_176_11.content)

				arg_173_1.text_.text = var_176_12

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_13 = 18
				local var_176_14 = utf8.len(var_176_12)
				local var_176_15 = var_176_13 <= 0 and var_176_9 or var_176_9 * (var_176_14 / var_176_13)

				if var_176_15 > 0 and var_176_9 < var_176_15 then
					arg_173_1.talkMaxDuration = var_176_15

					if var_176_15 + var_176_8 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_15 + var_176_8
					end
				end

				arg_173_1.text_.text = var_176_12
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011042", "story_v_out_413011.awb") ~= 0 then
					local var_176_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011042", "story_v_out_413011.awb") / 1000

					if var_176_16 + var_176_8 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_16 + var_176_8
					end

					if var_176_11.prefab_name ~= "" and arg_173_1.actors_[var_176_11.prefab_name] ~= nil then
						local var_176_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_11.prefab_name].transform, "story_v_out_413011", "413011042", "story_v_out_413011.awb")

						arg_173_1:RecordAudio("413011042", var_176_17)
						arg_173_1:RecordAudio("413011042", var_176_17)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_413011", "413011042", "story_v_out_413011.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_413011", "413011042", "story_v_out_413011.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_18 = math.max(var_176_9, arg_173_1.talkMaxDuration)

			if var_176_8 <= arg_173_1.time_ and arg_173_1.time_ < var_176_8 + var_176_18 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_8) / var_176_18

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_8 + var_176_18 and arg_173_1.time_ < var_176_8 + var_176_18 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play413011043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 413011043
		arg_177_1.duration_ = 2.57

		local var_177_0 = {
			zh = 1.999999999999,
			ja = 2.566
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
				arg_177_0:Play413011044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["10094"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and not isNil(var_180_0) and arg_177_1.var_.actorSpriteComps10094 == nil then
				arg_177_1.var_.actorSpriteComps10094 = var_180_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_2 = 2

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 and not isNil(var_180_0) then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.actorSpriteComps10094 then
					for iter_180_0, iter_180_1 in pairs(arg_177_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_180_1 then
							if arg_177_1.isInRecall_ then
								local var_180_4 = Mathf.Lerp(iter_180_1.color.r, arg_177_1.hightColor1.r, var_180_3)
								local var_180_5 = Mathf.Lerp(iter_180_1.color.g, arg_177_1.hightColor1.g, var_180_3)
								local var_180_6 = Mathf.Lerp(iter_180_1.color.b, arg_177_1.hightColor1.b, var_180_3)

								iter_180_1.color = Color.New(var_180_4, var_180_5, var_180_6)
							else
								local var_180_7 = Mathf.Lerp(iter_180_1.color.r, 1, var_180_3)

								iter_180_1.color = Color.New(var_180_7, var_180_7, var_180_7)
							end
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and not isNil(var_180_0) and arg_177_1.var_.actorSpriteComps10094 then
				for iter_180_2, iter_180_3 in pairs(arg_177_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_180_3 then
						if arg_177_1.isInRecall_ then
							iter_180_3.color = arg_177_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_180_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_177_1.var_.actorSpriteComps10094 = nil
			end

			local var_180_8 = 0
			local var_180_9 = 0.2

			if var_180_8 < arg_177_1.time_ and arg_177_1.time_ <= var_180_8 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_10 = arg_177_1:FormatText(StoryNameCfg[259].name)

				arg_177_1.leftNameTxt_.text = var_180_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_11 = arg_177_1:GetWordFromCfg(413011043)
				local var_180_12 = arg_177_1:FormatText(var_180_11.content)

				arg_177_1.text_.text = var_180_12

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_13 = 8
				local var_180_14 = utf8.len(var_180_12)
				local var_180_15 = var_180_13 <= 0 and var_180_9 or var_180_9 * (var_180_14 / var_180_13)

				if var_180_15 > 0 and var_180_9 < var_180_15 then
					arg_177_1.talkMaxDuration = var_180_15

					if var_180_15 + var_180_8 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_15 + var_180_8
					end
				end

				arg_177_1.text_.text = var_180_12
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011043", "story_v_out_413011.awb") ~= 0 then
					local var_180_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011043", "story_v_out_413011.awb") / 1000

					if var_180_16 + var_180_8 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_16 + var_180_8
					end

					if var_180_11.prefab_name ~= "" and arg_177_1.actors_[var_180_11.prefab_name] ~= nil then
						local var_180_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_11.prefab_name].transform, "story_v_out_413011", "413011043", "story_v_out_413011.awb")

						arg_177_1:RecordAudio("413011043", var_180_17)
						arg_177_1:RecordAudio("413011043", var_180_17)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_413011", "413011043", "story_v_out_413011.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_413011", "413011043", "story_v_out_413011.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_18 = math.max(var_180_9, arg_177_1.talkMaxDuration)

			if var_180_8 <= arg_177_1.time_ and arg_177_1.time_ < var_180_8 + var_180_18 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_8) / var_180_18

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_8 + var_180_18 and arg_177_1.time_ < var_180_8 + var_180_18 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play413011044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 413011044
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play413011045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["10094"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and not isNil(var_184_0) and arg_181_1.var_.actorSpriteComps10094 == nil then
				arg_181_1.var_.actorSpriteComps10094 = var_184_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_2 = 2

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 and not isNil(var_184_0) then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.actorSpriteComps10094 then
					for iter_184_0, iter_184_1 in pairs(arg_181_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_184_1 then
							if arg_181_1.isInRecall_ then
								local var_184_4 = Mathf.Lerp(iter_184_1.color.r, arg_181_1.hightColor2.r, var_184_3)
								local var_184_5 = Mathf.Lerp(iter_184_1.color.g, arg_181_1.hightColor2.g, var_184_3)
								local var_184_6 = Mathf.Lerp(iter_184_1.color.b, arg_181_1.hightColor2.b, var_184_3)

								iter_184_1.color = Color.New(var_184_4, var_184_5, var_184_6)
							else
								local var_184_7 = Mathf.Lerp(iter_184_1.color.r, 0.5, var_184_3)

								iter_184_1.color = Color.New(var_184_7, var_184_7, var_184_7)
							end
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and not isNil(var_184_0) and arg_181_1.var_.actorSpriteComps10094 then
				for iter_184_2, iter_184_3 in pairs(arg_181_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_184_3 then
						if arg_181_1.isInRecall_ then
							iter_184_3.color = arg_181_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_184_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_181_1.var_.actorSpriteComps10094 = nil
			end

			local var_184_8 = 0
			local var_184_9 = 0.825

			if var_184_8 < arg_181_1.time_ and arg_181_1.time_ <= var_184_8 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, false)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_10 = arg_181_1:GetWordFromCfg(413011044)
				local var_184_11 = arg_181_1:FormatText(var_184_10.content)

				arg_181_1.text_.text = var_184_11

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_12 = 33
				local var_184_13 = utf8.len(var_184_11)
				local var_184_14 = var_184_12 <= 0 and var_184_9 or var_184_9 * (var_184_13 / var_184_12)

				if var_184_14 > 0 and var_184_9 < var_184_14 then
					arg_181_1.talkMaxDuration = var_184_14

					if var_184_14 + var_184_8 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_14 + var_184_8
					end
				end

				arg_181_1.text_.text = var_184_11
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_15 = math.max(var_184_9, arg_181_1.talkMaxDuration)

			if var_184_8 <= arg_181_1.time_ and arg_181_1.time_ < var_184_8 + var_184_15 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_8) / var_184_15

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_8 + var_184_15 and arg_181_1.time_ < var_184_8 + var_184_15 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play413011045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 413011045
		arg_185_1.duration_ = 13.73

		local var_185_0 = {
			zh = 8.833,
			ja = 13.733
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
				arg_185_0:Play413011046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.925

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_2 = arg_185_1:FormatText(StoryNameCfg[205].name)

				arg_185_1.leftNameTxt_.text = var_188_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, true)
				arg_185_1.iconController_:SetSelectedState("hero")

				arg_185_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_185_1.callingController_:SetSelectedState("normal")

				arg_185_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_185_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_188_3 = arg_185_1:GetWordFromCfg(413011045)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 37
				local var_188_6 = utf8.len(var_188_4)
				local var_188_7 = var_188_5 <= 0 and var_188_1 or var_188_1 * (var_188_6 / var_188_5)

				if var_188_7 > 0 and var_188_1 < var_188_7 then
					arg_185_1.talkMaxDuration = var_188_7

					if var_188_7 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_7 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_4
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011045", "story_v_out_413011.awb") ~= 0 then
					local var_188_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011045", "story_v_out_413011.awb") / 1000

					if var_188_8 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_8 + var_188_0
					end

					if var_188_3.prefab_name ~= "" and arg_185_1.actors_[var_188_3.prefab_name] ~= nil then
						local var_188_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_3.prefab_name].transform, "story_v_out_413011", "413011045", "story_v_out_413011.awb")

						arg_185_1:RecordAudio("413011045", var_188_9)
						arg_185_1:RecordAudio("413011045", var_188_9)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_413011", "413011045", "story_v_out_413011.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_413011", "413011045", "story_v_out_413011.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_10 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_10 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_10

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_10 and arg_185_1.time_ < var_188_0 + var_188_10 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play413011046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 413011046
		arg_189_1.duration_ = 3.83

		local var_189_0 = {
			zh = 3.133,
			ja = 3.833
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
				arg_189_0:Play413011047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["10094"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and not isNil(var_192_0) and arg_189_1.var_.actorSpriteComps10094 == nil then
				arg_189_1.var_.actorSpriteComps10094 = var_192_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_192_2 = 2

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 and not isNil(var_192_0) then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.actorSpriteComps10094 then
					for iter_192_0, iter_192_1 in pairs(arg_189_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_192_1 then
							if arg_189_1.isInRecall_ then
								local var_192_4 = Mathf.Lerp(iter_192_1.color.r, arg_189_1.hightColor1.r, var_192_3)
								local var_192_5 = Mathf.Lerp(iter_192_1.color.g, arg_189_1.hightColor1.g, var_192_3)
								local var_192_6 = Mathf.Lerp(iter_192_1.color.b, arg_189_1.hightColor1.b, var_192_3)

								iter_192_1.color = Color.New(var_192_4, var_192_5, var_192_6)
							else
								local var_192_7 = Mathf.Lerp(iter_192_1.color.r, 1, var_192_3)

								iter_192_1.color = Color.New(var_192_7, var_192_7, var_192_7)
							end
						end
					end
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and not isNil(var_192_0) and arg_189_1.var_.actorSpriteComps10094 then
				for iter_192_2, iter_192_3 in pairs(arg_189_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_192_3 then
						if arg_189_1.isInRecall_ then
							iter_192_3.color = arg_189_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_192_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_189_1.var_.actorSpriteComps10094 = nil
			end

			local var_192_8 = arg_189_1.actors_["10094"].transform
			local var_192_9 = 0

			if var_192_9 < arg_189_1.time_ and arg_189_1.time_ <= var_192_9 + arg_192_0 then
				arg_189_1.var_.moveOldPos10094 = var_192_8.localPosition
				var_192_8.localScale = Vector3.New(1, 1, 1)

				arg_189_1:CheckSpriteTmpPos("10094", 3)

				local var_192_10 = var_192_8.childCount

				for iter_192_4 = 0, var_192_10 - 1 do
					local var_192_11 = var_192_8:GetChild(iter_192_4)

					if var_192_11.name == "split_5" or not string.find(var_192_11.name, "split") then
						var_192_11.gameObject:SetActive(true)
					else
						var_192_11.gameObject:SetActive(false)
					end
				end
			end

			local var_192_12 = 0.001

			if var_192_9 <= arg_189_1.time_ and arg_189_1.time_ < var_192_9 + var_192_12 then
				local var_192_13 = (arg_189_1.time_ - var_192_9) / var_192_12
				local var_192_14 = Vector3.New(0, -340, -414)

				var_192_8.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos10094, var_192_14, var_192_13)
			end

			if arg_189_1.time_ >= var_192_9 + var_192_12 and arg_189_1.time_ < var_192_9 + var_192_12 + arg_192_0 then
				var_192_8.localPosition = Vector3.New(0, -340, -414)
			end

			local var_192_15 = 0
			local var_192_16 = 0.375

			if var_192_15 < arg_189_1.time_ and arg_189_1.time_ <= var_192_15 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_17 = arg_189_1:FormatText(StoryNameCfg[259].name)

				arg_189_1.leftNameTxt_.text = var_192_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_18 = arg_189_1:GetWordFromCfg(413011046)
				local var_192_19 = arg_189_1:FormatText(var_192_18.content)

				arg_189_1.text_.text = var_192_19

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_20 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011046", "story_v_out_413011.awb") ~= 0 then
					local var_192_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011046", "story_v_out_413011.awb") / 1000

					if var_192_23 + var_192_15 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_23 + var_192_15
					end

					if var_192_18.prefab_name ~= "" and arg_189_1.actors_[var_192_18.prefab_name] ~= nil then
						local var_192_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_18.prefab_name].transform, "story_v_out_413011", "413011046", "story_v_out_413011.awb")

						arg_189_1:RecordAudio("413011046", var_192_24)
						arg_189_1:RecordAudio("413011046", var_192_24)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_413011", "413011046", "story_v_out_413011.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_413011", "413011046", "story_v_out_413011.awb")
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
	Play413011047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 413011047
		arg_193_1.duration_ = 5.83

		local var_193_0 = {
			zh = 2.7,
			ja = 5.833
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
				arg_193_0:Play413011048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10094"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and not isNil(var_196_0) and arg_193_1.var_.actorSpriteComps10094 == nil then
				arg_193_1.var_.actorSpriteComps10094 = var_196_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_196_2 = 2

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 and not isNil(var_196_0) then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.actorSpriteComps10094 then
					for iter_196_0, iter_196_1 in pairs(arg_193_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_196_1 then
							if arg_193_1.isInRecall_ then
								local var_196_4 = Mathf.Lerp(iter_196_1.color.r, arg_193_1.hightColor2.r, var_196_3)
								local var_196_5 = Mathf.Lerp(iter_196_1.color.g, arg_193_1.hightColor2.g, var_196_3)
								local var_196_6 = Mathf.Lerp(iter_196_1.color.b, arg_193_1.hightColor2.b, var_196_3)

								iter_196_1.color = Color.New(var_196_4, var_196_5, var_196_6)
							else
								local var_196_7 = Mathf.Lerp(iter_196_1.color.r, 0.5, var_196_3)

								iter_196_1.color = Color.New(var_196_7, var_196_7, var_196_7)
							end
						end
					end
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and not isNil(var_196_0) and arg_193_1.var_.actorSpriteComps10094 then
				for iter_196_2, iter_196_3 in pairs(arg_193_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_196_3 then
						if arg_193_1.isInRecall_ then
							iter_196_3.color = arg_193_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_196_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_193_1.var_.actorSpriteComps10094 = nil
			end

			local var_196_8 = 0
			local var_196_9 = 0.325

			if var_196_8 < arg_193_1.time_ and arg_193_1.time_ <= var_196_8 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_10 = arg_193_1:FormatText(StoryNameCfg[205].name)

				arg_193_1.leftNameTxt_.text = var_196_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, true)
				arg_193_1.iconController_:SetSelectedState("hero")

				arg_193_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_193_1.callingController_:SetSelectedState("normal")

				arg_193_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_193_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_196_11 = arg_193_1:GetWordFromCfg(413011047)
				local var_196_12 = arg_193_1:FormatText(var_196_11.content)

				arg_193_1.text_.text = var_196_12

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_13 = 13
				local var_196_14 = utf8.len(var_196_12)
				local var_196_15 = var_196_13 <= 0 and var_196_9 or var_196_9 * (var_196_14 / var_196_13)

				if var_196_15 > 0 and var_196_9 < var_196_15 then
					arg_193_1.talkMaxDuration = var_196_15

					if var_196_15 + var_196_8 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_15 + var_196_8
					end
				end

				arg_193_1.text_.text = var_196_12
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011047", "story_v_out_413011.awb") ~= 0 then
					local var_196_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011047", "story_v_out_413011.awb") / 1000

					if var_196_16 + var_196_8 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_16 + var_196_8
					end

					if var_196_11.prefab_name ~= "" and arg_193_1.actors_[var_196_11.prefab_name] ~= nil then
						local var_196_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_11.prefab_name].transform, "story_v_out_413011", "413011047", "story_v_out_413011.awb")

						arg_193_1:RecordAudio("413011047", var_196_17)
						arg_193_1:RecordAudio("413011047", var_196_17)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_413011", "413011047", "story_v_out_413011.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_413011", "413011047", "story_v_out_413011.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_18 = math.max(var_196_9, arg_193_1.talkMaxDuration)

			if var_196_8 <= arg_193_1.time_ and arg_193_1.time_ < var_196_8 + var_196_18 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_8) / var_196_18

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_8 + var_196_18 and arg_193_1.time_ < var_196_8 + var_196_18 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play413011048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 413011048
		arg_197_1.duration_ = 9.93

		local var_197_0 = {
			zh = 6.733,
			ja = 9.933
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
				arg_197_0:Play413011049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.85

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[205].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, true)
				arg_197_1.iconController_:SetSelectedState("hero")

				arg_197_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_197_1.callingController_:SetSelectedState("normal")

				arg_197_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_197_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_200_3 = arg_197_1:GetWordFromCfg(413011048)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 34
				local var_200_6 = utf8.len(var_200_4)
				local var_200_7 = var_200_5 <= 0 and var_200_1 or var_200_1 * (var_200_6 / var_200_5)

				if var_200_7 > 0 and var_200_1 < var_200_7 then
					arg_197_1.talkMaxDuration = var_200_7

					if var_200_7 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_7 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_4
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011048", "story_v_out_413011.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011048", "story_v_out_413011.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_out_413011", "413011048", "story_v_out_413011.awb")

						arg_197_1:RecordAudio("413011048", var_200_9)
						arg_197_1:RecordAudio("413011048", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_413011", "413011048", "story_v_out_413011.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_413011", "413011048", "story_v_out_413011.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_10 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_10 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_10

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_10 and arg_197_1.time_ < var_200_0 + var_200_10 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play413011049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 413011049
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play413011050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = "1042"

			if arg_201_1.actors_[var_204_0] == nil then
				local var_204_1 = Asset.Load("Widget/System/Story/StoryExpression/" .. "1042")

				if not isNil(var_204_1) then
					local var_204_2 = Object.Instantiate(var_204_1, arg_201_1.canvasGo_.transform)

					var_204_2.transform:SetSiblingIndex(1)

					var_204_2.name = var_204_0
					var_204_2.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_201_1.actors_[var_204_0] = var_204_2

					local var_204_3 = var_204_2:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_201_1.isInRecall_ then
						for iter_204_0, iter_204_1 in ipairs(var_204_3) do
							iter_204_1.color = arg_201_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_204_4 = arg_201_1.actors_["1042"]
			local var_204_5 = 0

			if var_204_5 < arg_201_1.time_ and arg_201_1.time_ <= var_204_5 + arg_204_0 and not isNil(var_204_4) and arg_201_1.var_.actorSpriteComps1042 == nil then
				arg_201_1.var_.actorSpriteComps1042 = var_204_4:GetComponentsInChildren(typeof(Image), true)
			end

			local var_204_6 = 2

			if var_204_5 <= arg_201_1.time_ and arg_201_1.time_ < var_204_5 + var_204_6 and not isNil(var_204_4) then
				local var_204_7 = (arg_201_1.time_ - var_204_5) / var_204_6

				if arg_201_1.var_.actorSpriteComps1042 then
					for iter_204_2, iter_204_3 in pairs(arg_201_1.var_.actorSpriteComps1042:ToTable()) do
						if iter_204_3 then
							if arg_201_1.isInRecall_ then
								local var_204_8 = Mathf.Lerp(iter_204_3.color.r, arg_201_1.hightColor2.r, var_204_7)
								local var_204_9 = Mathf.Lerp(iter_204_3.color.g, arg_201_1.hightColor2.g, var_204_7)
								local var_204_10 = Mathf.Lerp(iter_204_3.color.b, arg_201_1.hightColor2.b, var_204_7)

								iter_204_3.color = Color.New(var_204_8, var_204_9, var_204_10)
							else
								local var_204_11 = Mathf.Lerp(iter_204_3.color.r, 0.5, var_204_7)

								iter_204_3.color = Color.New(var_204_11, var_204_11, var_204_11)
							end
						end
					end
				end
			end

			if arg_201_1.time_ >= var_204_5 + var_204_6 and arg_201_1.time_ < var_204_5 + var_204_6 + arg_204_0 and not isNil(var_204_4) and arg_201_1.var_.actorSpriteComps1042 then
				for iter_204_4, iter_204_5 in pairs(arg_201_1.var_.actorSpriteComps1042:ToTable()) do
					if iter_204_5 then
						if arg_201_1.isInRecall_ then
							iter_204_5.color = arg_201_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_204_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_201_1.var_.actorSpriteComps1042 = nil
			end

			local var_204_12 = arg_201_1.actors_["10094"].transform
			local var_204_13 = 0

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1.var_.moveOldPos10094 = var_204_12.localPosition
				var_204_12.localScale = Vector3.New(1, 1, 1)

				arg_201_1:CheckSpriteTmpPos("10094", 7)

				local var_204_14 = var_204_12.childCount

				for iter_204_6 = 0, var_204_14 - 1 do
					local var_204_15 = var_204_12:GetChild(iter_204_6)

					if var_204_15.name == "split_5" or not string.find(var_204_15.name, "split") then
						var_204_15.gameObject:SetActive(true)
					else
						var_204_15.gameObject:SetActive(false)
					end
				end
			end

			local var_204_16 = 0.001

			if var_204_13 <= arg_201_1.time_ and arg_201_1.time_ < var_204_13 + var_204_16 then
				local var_204_17 = (arg_201_1.time_ - var_204_13) / var_204_16
				local var_204_18 = Vector3.New(0, -2000, 0)

				var_204_12.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10094, var_204_18, var_204_17)
			end

			if arg_201_1.time_ >= var_204_13 + var_204_16 and arg_201_1.time_ < var_204_13 + var_204_16 + arg_204_0 then
				var_204_12.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_204_19 = arg_201_1.actors_["10094"]
			local var_204_20 = 0

			if var_204_20 < arg_201_1.time_ and arg_201_1.time_ <= var_204_20 + arg_204_0 then
				local var_204_21 = var_204_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_204_21 then
					arg_201_1.var_.alphaOldValue10094 = var_204_21.alpha
					arg_201_1.var_.characterEffect10094 = var_204_21
				end

				arg_201_1.var_.alphaOldValue10094 = 1
			end

			local var_204_22 = 0.5

			if var_204_20 <= arg_201_1.time_ and arg_201_1.time_ < var_204_20 + var_204_22 then
				local var_204_23 = (arg_201_1.time_ - var_204_20) / var_204_22
				local var_204_24 = Mathf.Lerp(arg_201_1.var_.alphaOldValue10094, 0, var_204_23)

				if arg_201_1.var_.characterEffect10094 then
					arg_201_1.var_.characterEffect10094.alpha = var_204_24
				end
			end

			if arg_201_1.time_ >= var_204_20 + var_204_22 and arg_201_1.time_ < var_204_20 + var_204_22 + arg_204_0 and arg_201_1.var_.characterEffect10094 then
				arg_201_1.var_.characterEffect10094.alpha = 0
			end

			local var_204_25 = 0
			local var_204_26 = 0.925

			if var_204_25 < arg_201_1.time_ and arg_201_1.time_ <= var_204_25 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_27 = arg_201_1:GetWordFromCfg(413011049)
				local var_204_28 = arg_201_1:FormatText(var_204_27.content)

				arg_201_1.text_.text = var_204_28

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_29 = 37
				local var_204_30 = utf8.len(var_204_28)
				local var_204_31 = var_204_29 <= 0 and var_204_26 or var_204_26 * (var_204_30 / var_204_29)

				if var_204_31 > 0 and var_204_26 < var_204_31 then
					arg_201_1.talkMaxDuration = var_204_31

					if var_204_31 + var_204_25 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_31 + var_204_25
					end
				end

				arg_201_1.text_.text = var_204_28
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_32 = math.max(var_204_26, arg_201_1.talkMaxDuration)

			if var_204_25 <= arg_201_1.time_ and arg_201_1.time_ < var_204_25 + var_204_32 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_25) / var_204_32

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_25 + var_204_32 and arg_201_1.time_ < var_204_25 + var_204_32 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play413011050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 413011050
		arg_205_1.duration_ = 5.13

		local var_205_0 = {
			zh = 2.333,
			ja = 5.133
		}
		local var_205_1 = manager.audio:GetLocalizationFlag()

		if var_205_0[var_205_1] ~= nil then
			arg_205_1.duration_ = var_205_0[var_205_1]
		end

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play413011051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10094"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and not isNil(var_208_0) and arg_205_1.var_.actorSpriteComps10094 == nil then
				arg_205_1.var_.actorSpriteComps10094 = var_208_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_2 = 2

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 and not isNil(var_208_0) then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.actorSpriteComps10094 then
					for iter_208_0, iter_208_1 in pairs(arg_205_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_208_1 then
							if arg_205_1.isInRecall_ then
								local var_208_4 = Mathf.Lerp(iter_208_1.color.r, arg_205_1.hightColor1.r, var_208_3)
								local var_208_5 = Mathf.Lerp(iter_208_1.color.g, arg_205_1.hightColor1.g, var_208_3)
								local var_208_6 = Mathf.Lerp(iter_208_1.color.b, arg_205_1.hightColor1.b, var_208_3)

								iter_208_1.color = Color.New(var_208_4, var_208_5, var_208_6)
							else
								local var_208_7 = Mathf.Lerp(iter_208_1.color.r, 1, var_208_3)

								iter_208_1.color = Color.New(var_208_7, var_208_7, var_208_7)
							end
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and not isNil(var_208_0) and arg_205_1.var_.actorSpriteComps10094 then
				for iter_208_2, iter_208_3 in pairs(arg_205_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_208_3 then
						if arg_205_1.isInRecall_ then
							iter_208_3.color = arg_205_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_208_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_205_1.var_.actorSpriteComps10094 = nil
			end

			local var_208_8 = arg_205_1.actors_["10094"]
			local var_208_9 = 0

			if var_208_9 < arg_205_1.time_ and arg_205_1.time_ <= var_208_9 + arg_208_0 then
				local var_208_10 = var_208_8:GetComponentInChildren(typeof(CanvasGroup))

				if var_208_10 then
					arg_205_1.var_.alphaOldValue10094 = var_208_10.alpha
					arg_205_1.var_.characterEffect10094 = var_208_10
				end

				arg_205_1.var_.alphaOldValue10094 = 0
			end

			local var_208_11 = 0.5

			if var_208_9 <= arg_205_1.time_ and arg_205_1.time_ < var_208_9 + var_208_11 then
				local var_208_12 = (arg_205_1.time_ - var_208_9) / var_208_11
				local var_208_13 = Mathf.Lerp(arg_205_1.var_.alphaOldValue10094, 1, var_208_12)

				if arg_205_1.var_.characterEffect10094 then
					arg_205_1.var_.characterEffect10094.alpha = var_208_13
				end
			end

			if arg_205_1.time_ >= var_208_9 + var_208_11 and arg_205_1.time_ < var_208_9 + var_208_11 + arg_208_0 and arg_205_1.var_.characterEffect10094 then
				arg_205_1.var_.characterEffect10094.alpha = 1
			end

			local var_208_14 = arg_205_1.actors_["10094"].transform
			local var_208_15 = 0

			if var_208_15 < arg_205_1.time_ and arg_205_1.time_ <= var_208_15 + arg_208_0 then
				arg_205_1.var_.moveOldPos10094 = var_208_14.localPosition
				var_208_14.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("10094", 3)

				local var_208_16 = var_208_14.childCount

				for iter_208_4 = 0, var_208_16 - 1 do
					local var_208_17 = var_208_14:GetChild(iter_208_4)

					if var_208_17.name == "split_1" or not string.find(var_208_17.name, "split") then
						var_208_17.gameObject:SetActive(true)
					else
						var_208_17.gameObject:SetActive(false)
					end
				end
			end

			local var_208_18 = 0.001

			if var_208_15 <= arg_205_1.time_ and arg_205_1.time_ < var_208_15 + var_208_18 then
				local var_208_19 = (arg_205_1.time_ - var_208_15) / var_208_18
				local var_208_20 = Vector3.New(0, -340, -414)

				var_208_14.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10094, var_208_20, var_208_19)
			end

			if arg_205_1.time_ >= var_208_15 + var_208_18 and arg_205_1.time_ < var_208_15 + var_208_18 + arg_208_0 then
				var_208_14.localPosition = Vector3.New(0, -340, -414)
			end

			local var_208_21 = 0
			local var_208_22 = 0.275

			if var_208_21 < arg_205_1.time_ and arg_205_1.time_ <= var_208_21 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_23 = arg_205_1:FormatText(StoryNameCfg[259].name)

				arg_205_1.leftNameTxt_.text = var_208_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_24 = arg_205_1:GetWordFromCfg(413011050)
				local var_208_25 = arg_205_1:FormatText(var_208_24.content)

				arg_205_1.text_.text = var_208_25

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_26 = 11
				local var_208_27 = utf8.len(var_208_25)
				local var_208_28 = var_208_26 <= 0 and var_208_22 or var_208_22 * (var_208_27 / var_208_26)

				if var_208_28 > 0 and var_208_22 < var_208_28 then
					arg_205_1.talkMaxDuration = var_208_28

					if var_208_28 + var_208_21 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_28 + var_208_21
					end
				end

				arg_205_1.text_.text = var_208_25
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011050", "story_v_out_413011.awb") ~= 0 then
					local var_208_29 = manager.audio:GetVoiceLength("story_v_out_413011", "413011050", "story_v_out_413011.awb") / 1000

					if var_208_29 + var_208_21 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_29 + var_208_21
					end

					if var_208_24.prefab_name ~= "" and arg_205_1.actors_[var_208_24.prefab_name] ~= nil then
						local var_208_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_24.prefab_name].transform, "story_v_out_413011", "413011050", "story_v_out_413011.awb")

						arg_205_1:RecordAudio("413011050", var_208_30)
						arg_205_1:RecordAudio("413011050", var_208_30)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_413011", "413011050", "story_v_out_413011.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_413011", "413011050", "story_v_out_413011.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_31 = math.max(var_208_22, arg_205_1.talkMaxDuration)

			if var_208_21 <= arg_205_1.time_ and arg_205_1.time_ < var_208_21 + var_208_31 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_21) / var_208_31

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_21 + var_208_31 and arg_205_1.time_ < var_208_21 + var_208_31 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play413011051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 413011051
		arg_209_1.duration_ = 6.83

		local var_209_0 = {
			zh = 3.566,
			ja = 6.833
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
				arg_209_0:Play413011052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["10094"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and not isNil(var_212_0) and arg_209_1.var_.actorSpriteComps10094 == nil then
				arg_209_1.var_.actorSpriteComps10094 = var_212_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_2 = 2

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 and not isNil(var_212_0) then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.actorSpriteComps10094 then
					for iter_212_0, iter_212_1 in pairs(arg_209_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_212_1 then
							if arg_209_1.isInRecall_ then
								local var_212_4 = Mathf.Lerp(iter_212_1.color.r, arg_209_1.hightColor2.r, var_212_3)
								local var_212_5 = Mathf.Lerp(iter_212_1.color.g, arg_209_1.hightColor2.g, var_212_3)
								local var_212_6 = Mathf.Lerp(iter_212_1.color.b, arg_209_1.hightColor2.b, var_212_3)

								iter_212_1.color = Color.New(var_212_4, var_212_5, var_212_6)
							else
								local var_212_7 = Mathf.Lerp(iter_212_1.color.r, 0.5, var_212_3)

								iter_212_1.color = Color.New(var_212_7, var_212_7, var_212_7)
							end
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and not isNil(var_212_0) and arg_209_1.var_.actorSpriteComps10094 then
				for iter_212_2, iter_212_3 in pairs(arg_209_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_212_3 then
						if arg_209_1.isInRecall_ then
							iter_212_3.color = arg_209_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_212_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_209_1.var_.actorSpriteComps10094 = nil
			end

			local var_212_8 = 0
			local var_212_9 = 0.45

			if var_212_8 < arg_209_1.time_ and arg_209_1.time_ <= var_212_8 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_10 = arg_209_1:FormatText(StoryNameCfg[205].name)

				arg_209_1.leftNameTxt_.text = var_212_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, true)
				arg_209_1.iconController_:SetSelectedState("hero")

				arg_209_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_209_1.callingController_:SetSelectedState("normal")

				arg_209_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_209_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_212_11 = arg_209_1:GetWordFromCfg(413011051)
				local var_212_12 = arg_209_1:FormatText(var_212_11.content)

				arg_209_1.text_.text = var_212_12

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_13 = 18
				local var_212_14 = utf8.len(var_212_12)
				local var_212_15 = var_212_13 <= 0 and var_212_9 or var_212_9 * (var_212_14 / var_212_13)

				if var_212_15 > 0 and var_212_9 < var_212_15 then
					arg_209_1.talkMaxDuration = var_212_15

					if var_212_15 + var_212_8 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_15 + var_212_8
					end
				end

				arg_209_1.text_.text = var_212_12
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011051", "story_v_out_413011.awb") ~= 0 then
					local var_212_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011051", "story_v_out_413011.awb") / 1000

					if var_212_16 + var_212_8 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_16 + var_212_8
					end

					if var_212_11.prefab_name ~= "" and arg_209_1.actors_[var_212_11.prefab_name] ~= nil then
						local var_212_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_11.prefab_name].transform, "story_v_out_413011", "413011051", "story_v_out_413011.awb")

						arg_209_1:RecordAudio("413011051", var_212_17)
						arg_209_1:RecordAudio("413011051", var_212_17)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_413011", "413011051", "story_v_out_413011.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_413011", "413011051", "story_v_out_413011.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_18 = math.max(var_212_9, arg_209_1.talkMaxDuration)

			if var_212_8 <= arg_209_1.time_ and arg_209_1.time_ < var_212_8 + var_212_18 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_8) / var_212_18

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_8 + var_212_18 and arg_209_1.time_ < var_212_8 + var_212_18 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play413011052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 413011052
		arg_213_1.duration_ = 6.77

		local var_213_0 = {
			zh = 4.8,
			ja = 6.766
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
				arg_213_0:Play413011053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1042"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and not isNil(var_216_0) and arg_213_1.var_.actorSpriteComps1042 == nil then
				arg_213_1.var_.actorSpriteComps1042 = var_216_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_216_2 = 2

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 and not isNil(var_216_0) then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.actorSpriteComps1042 then
					for iter_216_0, iter_216_1 in pairs(arg_213_1.var_.actorSpriteComps1042:ToTable()) do
						if iter_216_1 then
							if arg_213_1.isInRecall_ then
								local var_216_4 = Mathf.Lerp(iter_216_1.color.r, arg_213_1.hightColor2.r, var_216_3)
								local var_216_5 = Mathf.Lerp(iter_216_1.color.g, arg_213_1.hightColor2.g, var_216_3)
								local var_216_6 = Mathf.Lerp(iter_216_1.color.b, arg_213_1.hightColor2.b, var_216_3)

								iter_216_1.color = Color.New(var_216_4, var_216_5, var_216_6)
							else
								local var_216_7 = Mathf.Lerp(iter_216_1.color.r, 0.5, var_216_3)

								iter_216_1.color = Color.New(var_216_7, var_216_7, var_216_7)
							end
						end
					end
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and not isNil(var_216_0) and arg_213_1.var_.actorSpriteComps1042 then
				for iter_216_2, iter_216_3 in pairs(arg_213_1.var_.actorSpriteComps1042:ToTable()) do
					if iter_216_3 then
						if arg_213_1.isInRecall_ then
							iter_216_3.color = arg_213_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_216_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_213_1.var_.actorSpriteComps1042 = nil
			end

			local var_216_8 = arg_213_1.actors_["10094"]
			local var_216_9 = 0

			if var_216_9 < arg_213_1.time_ and arg_213_1.time_ <= var_216_9 + arg_216_0 and not isNil(var_216_8) and arg_213_1.var_.actorSpriteComps10094 == nil then
				arg_213_1.var_.actorSpriteComps10094 = var_216_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_216_10 = 0.2

			if var_216_9 <= arg_213_1.time_ and arg_213_1.time_ < var_216_9 + var_216_10 and not isNil(var_216_8) then
				local var_216_11 = (arg_213_1.time_ - var_216_9) / var_216_10

				if arg_213_1.var_.actorSpriteComps10094 then
					for iter_216_4, iter_216_5 in pairs(arg_213_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_216_5 then
							if arg_213_1.isInRecall_ then
								local var_216_12 = Mathf.Lerp(iter_216_5.color.r, arg_213_1.hightColor1.r, var_216_11)
								local var_216_13 = Mathf.Lerp(iter_216_5.color.g, arg_213_1.hightColor1.g, var_216_11)
								local var_216_14 = Mathf.Lerp(iter_216_5.color.b, arg_213_1.hightColor1.b, var_216_11)

								iter_216_5.color = Color.New(var_216_12, var_216_13, var_216_14)
							else
								local var_216_15 = Mathf.Lerp(iter_216_5.color.r, 1, var_216_11)

								iter_216_5.color = Color.New(var_216_15, var_216_15, var_216_15)
							end
						end
					end
				end
			end

			if arg_213_1.time_ >= var_216_9 + var_216_10 and arg_213_1.time_ < var_216_9 + var_216_10 + arg_216_0 and not isNil(var_216_8) and arg_213_1.var_.actorSpriteComps10094 then
				for iter_216_6, iter_216_7 in pairs(arg_213_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_216_7 then
						if arg_213_1.isInRecall_ then
							iter_216_7.color = arg_213_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_216_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_213_1.var_.actorSpriteComps10094 = nil
			end

			local var_216_16 = 0
			local var_216_17 = 0.425

			if var_216_16 < arg_213_1.time_ and arg_213_1.time_ <= var_216_16 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_18 = arg_213_1:FormatText(StoryNameCfg[259].name)

				arg_213_1.leftNameTxt_.text = var_216_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_19 = arg_213_1:GetWordFromCfg(413011052)
				local var_216_20 = arg_213_1:FormatText(var_216_19.content)

				arg_213_1.text_.text = var_216_20

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_21 = 17
				local var_216_22 = utf8.len(var_216_20)
				local var_216_23 = var_216_21 <= 0 and var_216_17 or var_216_17 * (var_216_22 / var_216_21)

				if var_216_23 > 0 and var_216_17 < var_216_23 then
					arg_213_1.talkMaxDuration = var_216_23

					if var_216_23 + var_216_16 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_23 + var_216_16
					end
				end

				arg_213_1.text_.text = var_216_20
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011052", "story_v_out_413011.awb") ~= 0 then
					local var_216_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011052", "story_v_out_413011.awb") / 1000

					if var_216_24 + var_216_16 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_24 + var_216_16
					end

					if var_216_19.prefab_name ~= "" and arg_213_1.actors_[var_216_19.prefab_name] ~= nil then
						local var_216_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_19.prefab_name].transform, "story_v_out_413011", "413011052", "story_v_out_413011.awb")

						arg_213_1:RecordAudio("413011052", var_216_25)
						arg_213_1:RecordAudio("413011052", var_216_25)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_413011", "413011052", "story_v_out_413011.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_413011", "413011052", "story_v_out_413011.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_26 = math.max(var_216_17, arg_213_1.talkMaxDuration)

			if var_216_16 <= arg_213_1.time_ and arg_213_1.time_ < var_216_16 + var_216_26 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_16) / var_216_26

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_16 + var_216_26 and arg_213_1.time_ < var_216_16 + var_216_26 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play413011053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 413011053
		arg_217_1.duration_ = 11.67

		local var_217_0 = {
			zh = 8.233,
			ja = 11.666
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
				arg_217_0:Play413011054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["10094"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and not isNil(var_220_0) and arg_217_1.var_.actorSpriteComps10094 == nil then
				arg_217_1.var_.actorSpriteComps10094 = var_220_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_220_2 = 2

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 and not isNil(var_220_0) then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.actorSpriteComps10094 then
					for iter_220_0, iter_220_1 in pairs(arg_217_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_220_1 then
							if arg_217_1.isInRecall_ then
								local var_220_4 = Mathf.Lerp(iter_220_1.color.r, arg_217_1.hightColor2.r, var_220_3)
								local var_220_5 = Mathf.Lerp(iter_220_1.color.g, arg_217_1.hightColor2.g, var_220_3)
								local var_220_6 = Mathf.Lerp(iter_220_1.color.b, arg_217_1.hightColor2.b, var_220_3)

								iter_220_1.color = Color.New(var_220_4, var_220_5, var_220_6)
							else
								local var_220_7 = Mathf.Lerp(iter_220_1.color.r, 0.5, var_220_3)

								iter_220_1.color = Color.New(var_220_7, var_220_7, var_220_7)
							end
						end
					end
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and not isNil(var_220_0) and arg_217_1.var_.actorSpriteComps10094 then
				for iter_220_2, iter_220_3 in pairs(arg_217_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_220_3 then
						if arg_217_1.isInRecall_ then
							iter_220_3.color = arg_217_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_220_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_217_1.var_.actorSpriteComps10094 = nil
			end

			local var_220_8 = 0
			local var_220_9 = 0.925

			if var_220_8 < arg_217_1.time_ and arg_217_1.time_ <= var_220_8 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_10 = arg_217_1:FormatText(StoryNameCfg[205].name)

				arg_217_1.leftNameTxt_.text = var_220_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, true)
				arg_217_1.iconController_:SetSelectedState("hero")

				arg_217_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_217_1.callingController_:SetSelectedState("normal")

				arg_217_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_217_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_220_11 = arg_217_1:GetWordFromCfg(413011053)
				local var_220_12 = arg_217_1:FormatText(var_220_11.content)

				arg_217_1.text_.text = var_220_12

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_13 = 37
				local var_220_14 = utf8.len(var_220_12)
				local var_220_15 = var_220_13 <= 0 and var_220_9 or var_220_9 * (var_220_14 / var_220_13)

				if var_220_15 > 0 and var_220_9 < var_220_15 then
					arg_217_1.talkMaxDuration = var_220_15

					if var_220_15 + var_220_8 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_15 + var_220_8
					end
				end

				arg_217_1.text_.text = var_220_12
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011053", "story_v_out_413011.awb") ~= 0 then
					local var_220_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011053", "story_v_out_413011.awb") / 1000

					if var_220_16 + var_220_8 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_16 + var_220_8
					end

					if var_220_11.prefab_name ~= "" and arg_217_1.actors_[var_220_11.prefab_name] ~= nil then
						local var_220_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_11.prefab_name].transform, "story_v_out_413011", "413011053", "story_v_out_413011.awb")

						arg_217_1:RecordAudio("413011053", var_220_17)
						arg_217_1:RecordAudio("413011053", var_220_17)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_413011", "413011053", "story_v_out_413011.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_413011", "413011053", "story_v_out_413011.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_18 = math.max(var_220_9, arg_217_1.talkMaxDuration)

			if var_220_8 <= arg_217_1.time_ and arg_217_1.time_ < var_220_8 + var_220_18 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_8) / var_220_18

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_8 + var_220_18 and arg_217_1.time_ < var_220_8 + var_220_18 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play413011054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 413011054
		arg_221_1.duration_ = 2.63

		local var_221_0 = {
			zh = 1.866,
			ja = 2.633
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
				arg_221_0:Play413011055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 0.175

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_2 = arg_221_1:FormatText(StoryNameCfg[205].name)

				arg_221_1.leftNameTxt_.text = var_224_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, true)
				arg_221_1.iconController_:SetSelectedState("hero")

				arg_221_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1042")

				arg_221_1.callingController_:SetSelectedState("normal")

				arg_221_1.keyicon_.color = Color.New(0.82, 0.77, 0.62)
				arg_221_1.icon_.color = Color.New(0.82, 0.77, 0.62)

				local var_224_3 = arg_221_1:GetWordFromCfg(413011054)
				local var_224_4 = arg_221_1:FormatText(var_224_3.content)

				arg_221_1.text_.text = var_224_4

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_5 = 7
				local var_224_6 = utf8.len(var_224_4)
				local var_224_7 = var_224_5 <= 0 and var_224_1 or var_224_1 * (var_224_6 / var_224_5)

				if var_224_7 > 0 and var_224_1 < var_224_7 then
					arg_221_1.talkMaxDuration = var_224_7

					if var_224_7 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_7 + var_224_0
					end
				end

				arg_221_1.text_.text = var_224_4
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011054", "story_v_out_413011.awb") ~= 0 then
					local var_224_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011054", "story_v_out_413011.awb") / 1000

					if var_224_8 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_8 + var_224_0
					end

					if var_224_3.prefab_name ~= "" and arg_221_1.actors_[var_224_3.prefab_name] ~= nil then
						local var_224_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_3.prefab_name].transform, "story_v_out_413011", "413011054", "story_v_out_413011.awb")

						arg_221_1:RecordAudio("413011054", var_224_9)
						arg_221_1:RecordAudio("413011054", var_224_9)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_413011", "413011054", "story_v_out_413011.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_413011", "413011054", "story_v_out_413011.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_10 = math.max(var_224_1, arg_221_1.talkMaxDuration)

			if var_224_0 <= arg_221_1.time_ and arg_221_1.time_ < var_224_0 + var_224_10 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_0) / var_224_10

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_0 + var_224_10 and arg_221_1.time_ < var_224_0 + var_224_10 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play413011055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 413011055
		arg_225_1.duration_ = 9

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play413011056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 2

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				local var_228_1 = manager.ui.mainCamera.transform.localPosition
				local var_228_2 = Vector3.New(0, 0, 10) + Vector3.New(var_228_1.x, var_228_1.y, 0)
				local var_228_3 = arg_225_1.bgs_.F08l

				var_228_3.transform.localPosition = var_228_2
				var_228_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_228_4 = var_228_3:GetComponent("SpriteRenderer")

				if var_228_4 and var_228_4.sprite then
					local var_228_5 = (var_228_3.transform.localPosition - var_228_1).z
					local var_228_6 = manager.ui.mainCameraCom_
					local var_228_7 = 2 * var_228_5 * Mathf.Tan(var_228_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_228_8 = var_228_7 * var_228_6.aspect
					local var_228_9 = var_228_4.sprite.bounds.size.x
					local var_228_10 = var_228_4.sprite.bounds.size.y
					local var_228_11 = var_228_8 / var_228_9
					local var_228_12 = var_228_7 / var_228_10
					local var_228_13 = var_228_12 < var_228_11 and var_228_11 or var_228_12

					var_228_3.transform.localScale = Vector3.New(var_228_13, var_228_13, 0)
				end

				for iter_228_0, iter_228_1 in pairs(arg_225_1.bgs_) do
					if iter_228_0 ~= "F08l" then
						iter_228_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_228_14 = 3.999999999999

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 then
				arg_225_1.allBtn_.enabled = false
			end

			local var_228_15 = 0.3

			if arg_225_1.time_ >= var_228_14 + var_228_15 and arg_225_1.time_ < var_228_14 + var_228_15 + arg_228_0 then
				arg_225_1.allBtn_.enabled = true
			end

			local var_228_16 = 0

			if var_228_16 < arg_225_1.time_ and arg_225_1.time_ <= var_228_16 + arg_228_0 then
				arg_225_1.mask_.enabled = true
				arg_225_1.mask_.raycastTarget = true

				arg_225_1:SetGaussion(false)
			end

			local var_228_17 = 2

			if var_228_16 <= arg_225_1.time_ and arg_225_1.time_ < var_228_16 + var_228_17 then
				local var_228_18 = (arg_225_1.time_ - var_228_16) / var_228_17
				local var_228_19 = Color.New(0, 0, 0)

				var_228_19.a = Mathf.Lerp(0, 1, var_228_18)
				arg_225_1.mask_.color = var_228_19
			end

			if arg_225_1.time_ >= var_228_16 + var_228_17 and arg_225_1.time_ < var_228_16 + var_228_17 + arg_228_0 then
				local var_228_20 = Color.New(0, 0, 0)

				var_228_20.a = 1
				arg_225_1.mask_.color = var_228_20
			end

			local var_228_21 = 2

			if var_228_21 < arg_225_1.time_ and arg_225_1.time_ <= var_228_21 + arg_228_0 then
				arg_225_1.mask_.enabled = true
				arg_225_1.mask_.raycastTarget = true

				arg_225_1:SetGaussion(false)
			end

			local var_228_22 = 2

			if var_228_21 <= arg_225_1.time_ and arg_225_1.time_ < var_228_21 + var_228_22 then
				local var_228_23 = (arg_225_1.time_ - var_228_21) / var_228_22
				local var_228_24 = Color.New(0, 0, 0)

				var_228_24.a = Mathf.Lerp(1, 0, var_228_23)
				arg_225_1.mask_.color = var_228_24
			end

			if arg_225_1.time_ >= var_228_21 + var_228_22 and arg_225_1.time_ < var_228_21 + var_228_22 + arg_228_0 then
				local var_228_25 = Color.New(0, 0, 0)
				local var_228_26 = 0

				arg_225_1.mask_.enabled = false
				var_228_25.a = var_228_26
				arg_225_1.mask_.color = var_228_25
			end

			local var_228_27 = arg_225_1.actors_["10094"].transform
			local var_228_28 = 1.966

			if var_228_28 < arg_225_1.time_ and arg_225_1.time_ <= var_228_28 + arg_228_0 then
				arg_225_1.var_.moveOldPos10094 = var_228_27.localPosition
				var_228_27.localScale = Vector3.New(1, 1, 1)

				arg_225_1:CheckSpriteTmpPos("10094", 0)

				local var_228_29 = var_228_27.childCount

				for iter_228_2 = 0, var_228_29 - 1 do
					local var_228_30 = var_228_27:GetChild(iter_228_2)

					if var_228_30.name == "" or not string.find(var_228_30.name, "split") then
						var_228_30.gameObject:SetActive(true)
					else
						var_228_30.gameObject:SetActive(false)
					end
				end
			end

			local var_228_31 = 0.001

			if var_228_28 <= arg_225_1.time_ and arg_225_1.time_ < var_228_28 + var_228_31 then
				local var_228_32 = (arg_225_1.time_ - var_228_28) / var_228_31
				local var_228_33 = Vector3.New(-5000, -340, -414)

				var_228_27.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos10094, var_228_33, var_228_32)
			end

			if arg_225_1.time_ >= var_228_28 + var_228_31 and arg_225_1.time_ < var_228_28 + var_228_31 + arg_228_0 then
				var_228_27.localPosition = Vector3.New(-5000, -340, -414)
			end

			local var_228_34 = 2

			arg_225_1.isInRecall_ = false

			if var_228_34 < arg_225_1.time_ and arg_225_1.time_ <= var_228_34 + arg_228_0 then
				arg_225_1.screenFilterGo_:SetActive(false)

				for iter_228_3, iter_228_4 in pairs(arg_225_1.actors_) do
					local var_228_35 = iter_228_4:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_228_5, iter_228_6 in ipairs(var_228_35) do
						if iter_228_6.color.r > 0.51 then
							iter_228_6.color = Color.New(1, 1, 1)
						else
							iter_228_6.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end
			end

			local var_228_36 = 0.0333333333333332

			if var_228_34 <= arg_225_1.time_ and arg_225_1.time_ < var_228_34 + var_228_36 then
				local var_228_37 = (arg_225_1.time_ - var_228_34) / var_228_36

				arg_225_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_228_37)
			end

			if arg_225_1.time_ >= var_228_34 + var_228_36 and arg_225_1.time_ < var_228_34 + var_228_36 + arg_228_0 then
				arg_225_1.screenFilterEffect_.weight = 0
			end

			if arg_225_1.frameCnt_ <= 1 then
				arg_225_1.dialog_:SetActive(false)
			end

			local var_228_38 = 3.999999999999
			local var_228_39 = 1.375

			if var_228_38 < arg_225_1.time_ and arg_225_1.time_ <= var_228_38 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0

				arg_225_1.dialog_:SetActive(true)

				local var_228_40 = LeanTween.value(arg_225_1.dialog_, 0, 1, 0.3)

				var_228_40:setOnUpdate(LuaHelper.FloatAction(function(arg_229_0)
					arg_225_1.dialogCg_.alpha = arg_229_0
				end))
				var_228_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_225_1.dialog_)
					var_228_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_225_1.duration_ = arg_225_1.duration_ + 0.3

				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_41 = arg_225_1:GetWordFromCfg(413011055)
				local var_228_42 = arg_225_1:FormatText(var_228_41.content)

				arg_225_1.text_.text = var_228_42

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_43 = 55
				local var_228_44 = utf8.len(var_228_42)
				local var_228_45 = var_228_43 <= 0 and var_228_39 or var_228_39 * (var_228_44 / var_228_43)

				if var_228_45 > 0 and var_228_39 < var_228_45 then
					arg_225_1.talkMaxDuration = var_228_45
					var_228_38 = var_228_38 + 0.3

					if var_228_45 + var_228_38 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_45 + var_228_38
					end
				end

				arg_225_1.text_.text = var_228_42
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_46 = var_228_38 + 0.3
			local var_228_47 = math.max(var_228_39, arg_225_1.talkMaxDuration)

			if var_228_46 <= arg_225_1.time_ and arg_225_1.time_ < var_228_46 + var_228_47 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_46) / var_228_47

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_46 + var_228_47 and arg_225_1.time_ < var_228_46 + var_228_47 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play413011056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 413011056
		arg_231_1.duration_ = 8.17

		local var_231_0 = {
			zh = 6.5,
			ja = 8.166
		}
		local var_231_1 = manager.audio:GetLocalizationFlag()

		if var_231_0[var_231_1] ~= nil then
			arg_231_1.duration_ = var_231_0[var_231_1]
		end

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play413011057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.925

			if var_234_0 < arg_231_1.time_ and arg_231_1.time_ <= var_234_0 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_2 = arg_231_1:FormatText(StoryNameCfg[994].name)

				arg_231_1.leftNameTxt_.text = var_234_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, true)
				arg_231_1.iconController_:SetSelectedState("hero")

				arg_231_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_231_1.callingController_:SetSelectedState("normal")

				arg_231_1.keyicon_.color = Color.New(1, 1, 1)
				arg_231_1.icon_.color = Color.New(1, 1, 1)

				local var_234_3 = arg_231_1:GetWordFromCfg(413011056)
				local var_234_4 = arg_231_1:FormatText(var_234_3.content)

				arg_231_1.text_.text = var_234_4

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_5 = 37
				local var_234_6 = utf8.len(var_234_4)
				local var_234_7 = var_234_5 <= 0 and var_234_1 or var_234_1 * (var_234_6 / var_234_5)

				if var_234_7 > 0 and var_234_1 < var_234_7 then
					arg_231_1.talkMaxDuration = var_234_7

					if var_234_7 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_7 + var_234_0
					end
				end

				arg_231_1.text_.text = var_234_4
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011056", "story_v_out_413011.awb") ~= 0 then
					local var_234_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011056", "story_v_out_413011.awb") / 1000

					if var_234_8 + var_234_0 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_8 + var_234_0
					end

					if var_234_3.prefab_name ~= "" and arg_231_1.actors_[var_234_3.prefab_name] ~= nil then
						local var_234_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_3.prefab_name].transform, "story_v_out_413011", "413011056", "story_v_out_413011.awb")

						arg_231_1:RecordAudio("413011056", var_234_9)
						arg_231_1:RecordAudio("413011056", var_234_9)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_413011", "413011056", "story_v_out_413011.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_413011", "413011056", "story_v_out_413011.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_10 = math.max(var_234_1, arg_231_1.talkMaxDuration)

			if var_234_0 <= arg_231_1.time_ and arg_231_1.time_ < var_234_0 + var_234_10 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_0) / var_234_10

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_0 + var_234_10 and arg_231_1.time_ < var_234_0 + var_234_10 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play413011057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 413011057
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play413011058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.925

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_2 = arg_235_1:GetWordFromCfg(413011057)
				local var_238_3 = arg_235_1:FormatText(var_238_2.content)

				arg_235_1.text_.text = var_238_3

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_4 = 37
				local var_238_5 = utf8.len(var_238_3)
				local var_238_6 = var_238_4 <= 0 and var_238_1 or var_238_1 * (var_238_5 / var_238_4)

				if var_238_6 > 0 and var_238_1 < var_238_6 then
					arg_235_1.talkMaxDuration = var_238_6

					if var_238_6 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_6 + var_238_0
					end
				end

				arg_235_1.text_.text = var_238_3
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_7 = math.max(var_238_1, arg_235_1.talkMaxDuration)

			if var_238_0 <= arg_235_1.time_ and arg_235_1.time_ < var_238_0 + var_238_7 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_0) / var_238_7

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_0 + var_238_7 and arg_235_1.time_ < var_238_0 + var_238_7 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play413011058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 413011058
		arg_239_1.duration_ = 2

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play413011059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10094"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos10094 = var_242_0.localPosition
				var_242_0.localScale = Vector3.New(1, 1, 1)

				arg_239_1:CheckSpriteTmpPos("10094", 3)

				local var_242_2 = var_242_0.childCount

				for iter_242_0 = 0, var_242_2 - 1 do
					local var_242_3 = var_242_0:GetChild(iter_242_0)

					if var_242_3.name == "" or not string.find(var_242_3.name, "split") then
						var_242_3.gameObject:SetActive(true)
					else
						var_242_3.gameObject:SetActive(false)
					end
				end
			end

			local var_242_4 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_4 then
				local var_242_5 = (arg_239_1.time_ - var_242_1) / var_242_4
				local var_242_6 = Vector3.New(0, -340, -414)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos10094, var_242_6, var_242_5)
			end

			if arg_239_1.time_ >= var_242_1 + var_242_4 and arg_239_1.time_ < var_242_1 + var_242_4 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, -340, -414)
			end

			local var_242_7 = arg_239_1.actors_["10094"]
			local var_242_8 = 0

			if var_242_8 < arg_239_1.time_ and arg_239_1.time_ <= var_242_8 + arg_242_0 and not isNil(var_242_7) and arg_239_1.var_.actorSpriteComps10094 == nil then
				arg_239_1.var_.actorSpriteComps10094 = var_242_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_9 = 2

			if var_242_8 <= arg_239_1.time_ and arg_239_1.time_ < var_242_8 + var_242_9 and not isNil(var_242_7) then
				local var_242_10 = (arg_239_1.time_ - var_242_8) / var_242_9

				if arg_239_1.var_.actorSpriteComps10094 then
					for iter_242_1, iter_242_2 in pairs(arg_239_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_242_2 then
							if arg_239_1.isInRecall_ then
								local var_242_11 = Mathf.Lerp(iter_242_2.color.r, arg_239_1.hightColor1.r, var_242_10)
								local var_242_12 = Mathf.Lerp(iter_242_2.color.g, arg_239_1.hightColor1.g, var_242_10)
								local var_242_13 = Mathf.Lerp(iter_242_2.color.b, arg_239_1.hightColor1.b, var_242_10)

								iter_242_2.color = Color.New(var_242_11, var_242_12, var_242_13)
							else
								local var_242_14 = Mathf.Lerp(iter_242_2.color.r, 1, var_242_10)

								iter_242_2.color = Color.New(var_242_14, var_242_14, var_242_14)
							end
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_8 + var_242_9 and arg_239_1.time_ < var_242_8 + var_242_9 + arg_242_0 and not isNil(var_242_7) and arg_239_1.var_.actorSpriteComps10094 then
				for iter_242_3, iter_242_4 in pairs(arg_239_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_242_4 then
						if arg_239_1.isInRecall_ then
							iter_242_4.color = arg_239_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_242_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_239_1.var_.actorSpriteComps10094 = nil
			end

			local var_242_15 = arg_239_1.actors_["10094"]
			local var_242_16 = 0

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 then
				local var_242_17 = var_242_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_242_17 then
					arg_239_1.var_.alphaOldValue10094 = var_242_17.alpha
					arg_239_1.var_.characterEffect10094 = var_242_17
				end

				arg_239_1.var_.alphaOldValue10094 = 0
			end

			local var_242_18 = 0.2

			if var_242_16 <= arg_239_1.time_ and arg_239_1.time_ < var_242_16 + var_242_18 then
				local var_242_19 = (arg_239_1.time_ - var_242_16) / var_242_18
				local var_242_20 = Mathf.Lerp(arg_239_1.var_.alphaOldValue10094, 1, var_242_19)

				if arg_239_1.var_.characterEffect10094 then
					arg_239_1.var_.characterEffect10094.alpha = var_242_20
				end
			end

			if arg_239_1.time_ >= var_242_16 + var_242_18 and arg_239_1.time_ < var_242_16 + var_242_18 + arg_242_0 and arg_239_1.var_.characterEffect10094 then
				arg_239_1.var_.characterEffect10094.alpha = 1
			end

			local var_242_21 = 0
			local var_242_22 = 0.075

			if var_242_21 < arg_239_1.time_ and arg_239_1.time_ <= var_242_21 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_23 = arg_239_1:FormatText(StoryNameCfg[259].name)

				arg_239_1.leftNameTxt_.text = var_242_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_24 = arg_239_1:GetWordFromCfg(413011058)
				local var_242_25 = arg_239_1:FormatText(var_242_24.content)

				arg_239_1.text_.text = var_242_25

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_26 = 3
				local var_242_27 = utf8.len(var_242_25)
				local var_242_28 = var_242_26 <= 0 and var_242_22 or var_242_22 * (var_242_27 / var_242_26)

				if var_242_28 > 0 and var_242_22 < var_242_28 then
					arg_239_1.talkMaxDuration = var_242_28

					if var_242_28 + var_242_21 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_28 + var_242_21
					end
				end

				arg_239_1.text_.text = var_242_25
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011058", "story_v_out_413011.awb") ~= 0 then
					local var_242_29 = manager.audio:GetVoiceLength("story_v_out_413011", "413011058", "story_v_out_413011.awb") / 1000

					if var_242_29 + var_242_21 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_29 + var_242_21
					end

					if var_242_24.prefab_name ~= "" and arg_239_1.actors_[var_242_24.prefab_name] ~= nil then
						local var_242_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_24.prefab_name].transform, "story_v_out_413011", "413011058", "story_v_out_413011.awb")

						arg_239_1:RecordAudio("413011058", var_242_30)
						arg_239_1:RecordAudio("413011058", var_242_30)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_413011", "413011058", "story_v_out_413011.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_413011", "413011058", "story_v_out_413011.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_31 = math.max(var_242_22, arg_239_1.talkMaxDuration)

			if var_242_21 <= arg_239_1.time_ and arg_239_1.time_ < var_242_21 + var_242_31 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_21) / var_242_31

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_21 + var_242_31 and arg_239_1.time_ < var_242_21 + var_242_31 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play413011059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 413011059
		arg_243_1.duration_ = 6.17

		local var_243_0 = {
			zh = 3.866,
			ja = 6.166
		}
		local var_243_1 = manager.audio:GetLocalizationFlag()

		if var_243_0[var_243_1] ~= nil then
			arg_243_1.duration_ = var_243_0[var_243_1]
		end

		SetActive(arg_243_1.tipsGo_, false)

		function arg_243_1.onSingleLineFinish_()
			arg_243_1.onSingleLineUpdate_ = nil
			arg_243_1.onSingleLineFinish_ = nil
			arg_243_1.state_ = "waiting"
		end

		function arg_243_1.playNext_(arg_245_0)
			if arg_245_0 == 1 then
				arg_243_0:Play413011060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["10094"]
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 and not isNil(var_246_0) and arg_243_1.var_.actorSpriteComps10094 == nil then
				arg_243_1.var_.actorSpriteComps10094 = var_246_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_246_2 = 2

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 and not isNil(var_246_0) then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2

				if arg_243_1.var_.actorSpriteComps10094 then
					for iter_246_0, iter_246_1 in pairs(arg_243_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_246_1 then
							if arg_243_1.isInRecall_ then
								local var_246_4 = Mathf.Lerp(iter_246_1.color.r, arg_243_1.hightColor2.r, var_246_3)
								local var_246_5 = Mathf.Lerp(iter_246_1.color.g, arg_243_1.hightColor2.g, var_246_3)
								local var_246_6 = Mathf.Lerp(iter_246_1.color.b, arg_243_1.hightColor2.b, var_246_3)

								iter_246_1.color = Color.New(var_246_4, var_246_5, var_246_6)
							else
								local var_246_7 = Mathf.Lerp(iter_246_1.color.r, 0.5, var_246_3)

								iter_246_1.color = Color.New(var_246_7, var_246_7, var_246_7)
							end
						end
					end
				end
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 and not isNil(var_246_0) and arg_243_1.var_.actorSpriteComps10094 then
				for iter_246_2, iter_246_3 in pairs(arg_243_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_246_3 then
						if arg_243_1.isInRecall_ then
							iter_246_3.color = arg_243_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_246_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_243_1.var_.actorSpriteComps10094 = nil
			end

			local var_246_8 = "10022"

			if arg_243_1.actors_[var_246_8] == nil then
				local var_246_9 = Asset.Load("Widget/System/Story/StoryExpression/" .. "10022")

				if not isNil(var_246_9) then
					local var_246_10 = Object.Instantiate(var_246_9, arg_243_1.canvasGo_.transform)

					var_246_10.transform:SetSiblingIndex(1)

					var_246_10.name = var_246_8
					var_246_10.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_243_1.actors_[var_246_8] = var_246_10

					local var_246_11 = var_246_10:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_243_1.isInRecall_ then
						for iter_246_4, iter_246_5 in ipairs(var_246_11) do
							iter_246_5.color = arg_243_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_246_12 = arg_243_1.actors_["10022"].transform
			local var_246_13 = 0

			if var_246_13 < arg_243_1.time_ and arg_243_1.time_ <= var_246_13 + arg_246_0 then
				arg_243_1.var_.moveOldPos10022 = var_246_12.localPosition
				var_246_12.localScale = Vector3.New(1, 1, 1)

				arg_243_1:CheckSpriteTmpPos("10022", 4)

				local var_246_14 = var_246_12.childCount

				for iter_246_6 = 0, var_246_14 - 1 do
					local var_246_15 = var_246_12:GetChild(iter_246_6)

					if var_246_15.name == "split_8" or not string.find(var_246_15.name, "split") then
						var_246_15.gameObject:SetActive(true)
					else
						var_246_15.gameObject:SetActive(false)
					end
				end
			end

			local var_246_16 = 0.001

			if var_246_13 <= arg_243_1.time_ and arg_243_1.time_ < var_246_13 + var_246_16 then
				local var_246_17 = (arg_243_1.time_ - var_246_13) / var_246_16
				local var_246_18 = Vector3.New(390, -315, -320)

				var_246_12.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos10022, var_246_18, var_246_17)
			end

			if arg_243_1.time_ >= var_246_13 + var_246_16 and arg_243_1.time_ < var_246_13 + var_246_16 + arg_246_0 then
				var_246_12.localPosition = Vector3.New(390, -315, -320)
			end

			local var_246_19 = arg_243_1.actors_["10094"].transform
			local var_246_20 = 0

			if var_246_20 < arg_243_1.time_ and arg_243_1.time_ <= var_246_20 + arg_246_0 then
				arg_243_1.var_.moveOldPos10094 = var_246_19.localPosition
				var_246_19.localScale = Vector3.New(1, 1, 1)

				arg_243_1:CheckSpriteTmpPos("10094", 2)

				local var_246_21 = var_246_19.childCount

				for iter_246_7 = 0, var_246_21 - 1 do
					local var_246_22 = var_246_19:GetChild(iter_246_7)

					if var_246_22.name == "" or not string.find(var_246_22.name, "split") then
						var_246_22.gameObject:SetActive(true)
					else
						var_246_22.gameObject:SetActive(false)
					end
				end
			end

			local var_246_23 = 0.001

			if var_246_20 <= arg_243_1.time_ and arg_243_1.time_ < var_246_20 + var_246_23 then
				local var_246_24 = (arg_243_1.time_ - var_246_20) / var_246_23
				local var_246_25 = Vector3.New(-390, -340, -414)

				var_246_19.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos10094, var_246_25, var_246_24)
			end

			if arg_243_1.time_ >= var_246_20 + var_246_23 and arg_243_1.time_ < var_246_20 + var_246_23 + arg_246_0 then
				var_246_19.localPosition = Vector3.New(-390, -340, -414)
			end

			local var_246_26 = arg_243_1.actors_["10022"]
			local var_246_27 = 0

			if var_246_27 < arg_243_1.time_ and arg_243_1.time_ <= var_246_27 + arg_246_0 then
				local var_246_28 = var_246_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_246_28 then
					arg_243_1.var_.alphaOldValue10022 = var_246_28.alpha
					arg_243_1.var_.characterEffect10022 = var_246_28
				end
			end

			local var_246_29 = 0.5

			if var_246_27 <= arg_243_1.time_ and arg_243_1.time_ < var_246_27 + var_246_29 then
				local var_246_30 = (arg_243_1.time_ - var_246_27) / var_246_29
				local var_246_31 = Mathf.Lerp(arg_243_1.var_.alphaOldValue10022, 0.6, var_246_30)

				if arg_243_1.var_.characterEffect10022 then
					arg_243_1.var_.characterEffect10022.alpha = var_246_31
				end
			end

			if arg_243_1.time_ >= var_246_27 + var_246_29 and arg_243_1.time_ < var_246_27 + var_246_29 + arg_246_0 and arg_243_1.var_.characterEffect10022 then
				arg_243_1.var_.characterEffect10022.alpha = 0.6
			end

			local var_246_32 = arg_243_1.actors_["10022"]
			local var_246_33 = 0

			if var_246_33 < arg_243_1.time_ and arg_243_1.time_ <= var_246_33 + arg_246_0 then
				arg_243_1:SetSpriteNiuquEffect("10022", true)
			end

			local var_246_34 = 0
			local var_246_35 = 0.525

			if var_246_34 < arg_243_1.time_ and arg_243_1.time_ <= var_246_34 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_36 = arg_243_1:FormatText(StoryNameCfg[614].name)

				arg_243_1.leftNameTxt_.text = var_246_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_37 = arg_243_1:GetWordFromCfg(413011059)
				local var_246_38 = arg_243_1:FormatText(var_246_37.content)

				arg_243_1.text_.text = var_246_38

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_39 = 21
				local var_246_40 = utf8.len(var_246_38)
				local var_246_41 = var_246_39 <= 0 and var_246_35 or var_246_35 * (var_246_40 / var_246_39)

				if var_246_41 > 0 and var_246_35 < var_246_41 then
					arg_243_1.talkMaxDuration = var_246_41

					if var_246_41 + var_246_34 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_41 + var_246_34
					end
				end

				arg_243_1.text_.text = var_246_38
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011059", "story_v_out_413011.awb") ~= 0 then
					local var_246_42 = manager.audio:GetVoiceLength("story_v_out_413011", "413011059", "story_v_out_413011.awb") / 1000

					if var_246_42 + var_246_34 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_42 + var_246_34
					end

					if var_246_37.prefab_name ~= "" and arg_243_1.actors_[var_246_37.prefab_name] ~= nil then
						local var_246_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_37.prefab_name].transform, "story_v_out_413011", "413011059", "story_v_out_413011.awb")

						arg_243_1:RecordAudio("413011059", var_246_43)
						arg_243_1:RecordAudio("413011059", var_246_43)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_413011", "413011059", "story_v_out_413011.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_413011", "413011059", "story_v_out_413011.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_44 = math.max(var_246_35, arg_243_1.talkMaxDuration)

			if var_246_34 <= arg_243_1.time_ and arg_243_1.time_ < var_246_34 + var_246_44 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_34) / var_246_44

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_34 + var_246_44 and arg_243_1.time_ < var_246_34 + var_246_44 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play413011060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 413011060
		arg_247_1.duration_ = 6.07

		local var_247_0 = {
			zh = 4.966,
			ja = 6.066
		}
		local var_247_1 = manager.audio:GetLocalizationFlag()

		if var_247_0[var_247_1] ~= nil then
			arg_247_1.duration_ = var_247_0[var_247_1]
		end

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play413011061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10094"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and not isNil(var_250_0) and arg_247_1.var_.actorSpriteComps10094 == nil then
				arg_247_1.var_.actorSpriteComps10094 = var_250_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_2 = 2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 and not isNil(var_250_0) then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.actorSpriteComps10094 then
					for iter_250_0, iter_250_1 in pairs(arg_247_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_250_1 then
							if arg_247_1.isInRecall_ then
								local var_250_4 = Mathf.Lerp(iter_250_1.color.r, arg_247_1.hightColor1.r, var_250_3)
								local var_250_5 = Mathf.Lerp(iter_250_1.color.g, arg_247_1.hightColor1.g, var_250_3)
								local var_250_6 = Mathf.Lerp(iter_250_1.color.b, arg_247_1.hightColor1.b, var_250_3)

								iter_250_1.color = Color.New(var_250_4, var_250_5, var_250_6)
							else
								local var_250_7 = Mathf.Lerp(iter_250_1.color.r, 1, var_250_3)

								iter_250_1.color = Color.New(var_250_7, var_250_7, var_250_7)
							end
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and not isNil(var_250_0) and arg_247_1.var_.actorSpriteComps10094 then
				for iter_250_2, iter_250_3 in pairs(arg_247_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_250_3 then
						if arg_247_1.isInRecall_ then
							iter_250_3.color = arg_247_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_250_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_247_1.var_.actorSpriteComps10094 = nil
			end

			local var_250_8 = 0
			local var_250_9 = 0.55

			if var_250_8 < arg_247_1.time_ and arg_247_1.time_ <= var_250_8 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_10 = arg_247_1:FormatText(StoryNameCfg[259].name)

				arg_247_1.leftNameTxt_.text = var_250_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_11 = arg_247_1:GetWordFromCfg(413011060)
				local var_250_12 = arg_247_1:FormatText(var_250_11.content)

				arg_247_1.text_.text = var_250_12

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_13 = 22
				local var_250_14 = utf8.len(var_250_12)
				local var_250_15 = var_250_13 <= 0 and var_250_9 or var_250_9 * (var_250_14 / var_250_13)

				if var_250_15 > 0 and var_250_9 < var_250_15 then
					arg_247_1.talkMaxDuration = var_250_15

					if var_250_15 + var_250_8 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_15 + var_250_8
					end
				end

				arg_247_1.text_.text = var_250_12
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011060", "story_v_out_413011.awb") ~= 0 then
					local var_250_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011060", "story_v_out_413011.awb") / 1000

					if var_250_16 + var_250_8 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_16 + var_250_8
					end

					if var_250_11.prefab_name ~= "" and arg_247_1.actors_[var_250_11.prefab_name] ~= nil then
						local var_250_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_11.prefab_name].transform, "story_v_out_413011", "413011060", "story_v_out_413011.awb")

						arg_247_1:RecordAudio("413011060", var_250_17)
						arg_247_1:RecordAudio("413011060", var_250_17)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_413011", "413011060", "story_v_out_413011.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_413011", "413011060", "story_v_out_413011.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_18 = math.max(var_250_9, arg_247_1.talkMaxDuration)

			if var_250_8 <= arg_247_1.time_ and arg_247_1.time_ < var_250_8 + var_250_18 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_8) / var_250_18

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_8 + var_250_18 and arg_247_1.time_ < var_250_8 + var_250_18 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play413011061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 413011061
		arg_251_1.duration_ = 5.83

		local var_251_0 = {
			zh = 3.8,
			ja = 5.833
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
				arg_251_0:Play413011062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10094"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and not isNil(var_254_0) and arg_251_1.var_.actorSpriteComps10094 == nil then
				arg_251_1.var_.actorSpriteComps10094 = var_254_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_2 = 2

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 and not isNil(var_254_0) then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.actorSpriteComps10094 then
					for iter_254_0, iter_254_1 in pairs(arg_251_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_254_1 then
							if arg_251_1.isInRecall_ then
								local var_254_4 = Mathf.Lerp(iter_254_1.color.r, arg_251_1.hightColor2.r, var_254_3)
								local var_254_5 = Mathf.Lerp(iter_254_1.color.g, arg_251_1.hightColor2.g, var_254_3)
								local var_254_6 = Mathf.Lerp(iter_254_1.color.b, arg_251_1.hightColor2.b, var_254_3)

								iter_254_1.color = Color.New(var_254_4, var_254_5, var_254_6)
							else
								local var_254_7 = Mathf.Lerp(iter_254_1.color.r, 0.5, var_254_3)

								iter_254_1.color = Color.New(var_254_7, var_254_7, var_254_7)
							end
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and not isNil(var_254_0) and arg_251_1.var_.actorSpriteComps10094 then
				for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_254_3 then
						if arg_251_1.isInRecall_ then
							iter_254_3.color = arg_251_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_254_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_251_1.var_.actorSpriteComps10094 = nil
			end

			local var_254_8 = arg_251_1.actors_["10022"].transform
			local var_254_9 = 0

			if var_254_9 < arg_251_1.time_ and arg_251_1.time_ <= var_254_9 + arg_254_0 then
				arg_251_1.var_.moveOldPos10022 = var_254_8.localPosition
				var_254_8.localScale = Vector3.New(1, 1, 1)

				arg_251_1:CheckSpriteTmpPos("10022", 4)

				local var_254_10 = var_254_8.childCount

				for iter_254_4 = 0, var_254_10 - 1 do
					local var_254_11 = var_254_8:GetChild(iter_254_4)

					if var_254_11.name == "split_1" or not string.find(var_254_11.name, "split") then
						var_254_11.gameObject:SetActive(true)
					else
						var_254_11.gameObject:SetActive(false)
					end
				end
			end

			local var_254_12 = 0.001

			if var_254_9 <= arg_251_1.time_ and arg_251_1.time_ < var_254_9 + var_254_12 then
				local var_254_13 = (arg_251_1.time_ - var_254_9) / var_254_12
				local var_254_14 = Vector3.New(390, -315, -320)

				var_254_8.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos10022, var_254_14, var_254_13)
			end

			if arg_251_1.time_ >= var_254_9 + var_254_12 and arg_251_1.time_ < var_254_9 + var_254_12 + arg_254_0 then
				var_254_8.localPosition = Vector3.New(390, -315, -320)
			end

			local var_254_15 = 0
			local var_254_16 = 0.525

			if var_254_15 < arg_251_1.time_ and arg_251_1.time_ <= var_254_15 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_17 = arg_251_1:FormatText(StoryNameCfg[614].name)

				arg_251_1.leftNameTxt_.text = var_254_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_18 = arg_251_1:GetWordFromCfg(413011061)
				local var_254_19 = arg_251_1:FormatText(var_254_18.content)

				arg_251_1.text_.text = var_254_19

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_20 = 21
				local var_254_21 = utf8.len(var_254_19)
				local var_254_22 = var_254_20 <= 0 and var_254_16 or var_254_16 * (var_254_21 / var_254_20)

				if var_254_22 > 0 and var_254_16 < var_254_22 then
					arg_251_1.talkMaxDuration = var_254_22

					if var_254_22 + var_254_15 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_22 + var_254_15
					end
				end

				arg_251_1.text_.text = var_254_19
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011061", "story_v_out_413011.awb") ~= 0 then
					local var_254_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011061", "story_v_out_413011.awb") / 1000

					if var_254_23 + var_254_15 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_23 + var_254_15
					end

					if var_254_18.prefab_name ~= "" and arg_251_1.actors_[var_254_18.prefab_name] ~= nil then
						local var_254_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_18.prefab_name].transform, "story_v_out_413011", "413011061", "story_v_out_413011.awb")

						arg_251_1:RecordAudio("413011061", var_254_24)
						arg_251_1:RecordAudio("413011061", var_254_24)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_413011", "413011061", "story_v_out_413011.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_413011", "413011061", "story_v_out_413011.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_25 = math.max(var_254_16, arg_251_1.talkMaxDuration)

			if var_254_15 <= arg_251_1.time_ and arg_251_1.time_ < var_254_15 + var_254_25 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_15) / var_254_25

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_15 + var_254_25 and arg_251_1.time_ < var_254_15 + var_254_25 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play413011062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 413011062
		arg_255_1.duration_ = 3.67

		local var_255_0 = {
			zh = 1.999999999999,
			ja = 3.666
		}
		local var_255_1 = manager.audio:GetLocalizationFlag()

		if var_255_0[var_255_1] ~= nil then
			arg_255_1.duration_ = var_255_0[var_255_1]
		end

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play413011063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["10094"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and not isNil(var_258_0) and arg_255_1.var_.actorSpriteComps10094 == nil then
				arg_255_1.var_.actorSpriteComps10094 = var_258_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_2 = 2

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 and not isNil(var_258_0) then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.actorSpriteComps10094 then
					for iter_258_0, iter_258_1 in pairs(arg_255_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_258_1 then
							if arg_255_1.isInRecall_ then
								local var_258_4 = Mathf.Lerp(iter_258_1.color.r, arg_255_1.hightColor1.r, var_258_3)
								local var_258_5 = Mathf.Lerp(iter_258_1.color.g, arg_255_1.hightColor1.g, var_258_3)
								local var_258_6 = Mathf.Lerp(iter_258_1.color.b, arg_255_1.hightColor1.b, var_258_3)

								iter_258_1.color = Color.New(var_258_4, var_258_5, var_258_6)
							else
								local var_258_7 = Mathf.Lerp(iter_258_1.color.r, 1, var_258_3)

								iter_258_1.color = Color.New(var_258_7, var_258_7, var_258_7)
							end
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and not isNil(var_258_0) and arg_255_1.var_.actorSpriteComps10094 then
				for iter_258_2, iter_258_3 in pairs(arg_255_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_258_3 then
						if arg_255_1.isInRecall_ then
							iter_258_3.color = arg_255_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_258_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_255_1.var_.actorSpriteComps10094 = nil
			end

			local var_258_8 = 0
			local var_258_9 = 0.175

			if var_258_8 < arg_255_1.time_ and arg_255_1.time_ <= var_258_8 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_10 = arg_255_1:FormatText(StoryNameCfg[259].name)

				arg_255_1.leftNameTxt_.text = var_258_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_11 = arg_255_1:GetWordFromCfg(413011062)
				local var_258_12 = arg_255_1:FormatText(var_258_11.content)

				arg_255_1.text_.text = var_258_12

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_13 = 7
				local var_258_14 = utf8.len(var_258_12)
				local var_258_15 = var_258_13 <= 0 and var_258_9 or var_258_9 * (var_258_14 / var_258_13)

				if var_258_15 > 0 and var_258_9 < var_258_15 then
					arg_255_1.talkMaxDuration = var_258_15

					if var_258_15 + var_258_8 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_15 + var_258_8
					end
				end

				arg_255_1.text_.text = var_258_12
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011062", "story_v_out_413011.awb") ~= 0 then
					local var_258_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011062", "story_v_out_413011.awb") / 1000

					if var_258_16 + var_258_8 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_16 + var_258_8
					end

					if var_258_11.prefab_name ~= "" and arg_255_1.actors_[var_258_11.prefab_name] ~= nil then
						local var_258_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_11.prefab_name].transform, "story_v_out_413011", "413011062", "story_v_out_413011.awb")

						arg_255_1:RecordAudio("413011062", var_258_17)
						arg_255_1:RecordAudio("413011062", var_258_17)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_413011", "413011062", "story_v_out_413011.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_413011", "413011062", "story_v_out_413011.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_18 = math.max(var_258_9, arg_255_1.talkMaxDuration)

			if var_258_8 <= arg_255_1.time_ and arg_255_1.time_ < var_258_8 + var_258_18 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_8) / var_258_18

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_8 + var_258_18 and arg_255_1.time_ < var_258_8 + var_258_18 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play413011063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 413011063
		arg_259_1.duration_ = 6.83

		local var_259_0 = {
			zh = 6.766,
			ja = 6.833
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
				arg_259_0:Play413011064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10094"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and not isNil(var_262_0) and arg_259_1.var_.actorSpriteComps10094 == nil then
				arg_259_1.var_.actorSpriteComps10094 = var_262_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_2 = 0.2

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 and not isNil(var_262_0) then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.actorSpriteComps10094 then
					for iter_262_0, iter_262_1 in pairs(arg_259_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_262_1 then
							if arg_259_1.isInRecall_ then
								local var_262_4 = Mathf.Lerp(iter_262_1.color.r, arg_259_1.hightColor2.r, var_262_3)
								local var_262_5 = Mathf.Lerp(iter_262_1.color.g, arg_259_1.hightColor2.g, var_262_3)
								local var_262_6 = Mathf.Lerp(iter_262_1.color.b, arg_259_1.hightColor2.b, var_262_3)

								iter_262_1.color = Color.New(var_262_4, var_262_5, var_262_6)
							else
								local var_262_7 = Mathf.Lerp(iter_262_1.color.r, 0.5, var_262_3)

								iter_262_1.color = Color.New(var_262_7, var_262_7, var_262_7)
							end
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and not isNil(var_262_0) and arg_259_1.var_.actorSpriteComps10094 then
				for iter_262_2, iter_262_3 in pairs(arg_259_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_262_3 then
						if arg_259_1.isInRecall_ then
							iter_262_3.color = arg_259_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_262_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_259_1.var_.actorSpriteComps10094 = nil
			end

			local var_262_8 = arg_259_1.actors_["10022"].transform
			local var_262_9 = 0

			if var_262_9 < arg_259_1.time_ and arg_259_1.time_ <= var_262_9 + arg_262_0 then
				arg_259_1.var_.moveOldPos10022 = var_262_8.localPosition
				var_262_8.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("10022", 4)

				local var_262_10 = var_262_8.childCount

				for iter_262_4 = 0, var_262_10 - 1 do
					local var_262_11 = var_262_8:GetChild(iter_262_4)

					if var_262_11.name == "split_8" or not string.find(var_262_11.name, "split") then
						var_262_11.gameObject:SetActive(true)
					else
						var_262_11.gameObject:SetActive(false)
					end
				end
			end

			local var_262_12 = 0.001

			if var_262_9 <= arg_259_1.time_ and arg_259_1.time_ < var_262_9 + var_262_12 then
				local var_262_13 = (arg_259_1.time_ - var_262_9) / var_262_12
				local var_262_14 = Vector3.New(390, -315, -320)

				var_262_8.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10022, var_262_14, var_262_13)
			end

			if arg_259_1.time_ >= var_262_9 + var_262_12 and arg_259_1.time_ < var_262_9 + var_262_12 + arg_262_0 then
				var_262_8.localPosition = Vector3.New(390, -315, -320)
			end

			local var_262_15 = 0
			local var_262_16 = 0.8

			if var_262_15 < arg_259_1.time_ and arg_259_1.time_ <= var_262_15 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_17 = arg_259_1:FormatText(StoryNameCfg[614].name)

				arg_259_1.leftNameTxt_.text = var_262_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_18 = arg_259_1:GetWordFromCfg(413011063)
				local var_262_19 = arg_259_1:FormatText(var_262_18.content)

				arg_259_1.text_.text = var_262_19

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_20 = 32
				local var_262_21 = utf8.len(var_262_19)
				local var_262_22 = var_262_20 <= 0 and var_262_16 or var_262_16 * (var_262_21 / var_262_20)

				if var_262_22 > 0 and var_262_16 < var_262_22 then
					arg_259_1.talkMaxDuration = var_262_22

					if var_262_22 + var_262_15 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_22 + var_262_15
					end
				end

				arg_259_1.text_.text = var_262_19
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011063", "story_v_out_413011.awb") ~= 0 then
					local var_262_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011063", "story_v_out_413011.awb") / 1000

					if var_262_23 + var_262_15 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_23 + var_262_15
					end

					if var_262_18.prefab_name ~= "" and arg_259_1.actors_[var_262_18.prefab_name] ~= nil then
						local var_262_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_18.prefab_name].transform, "story_v_out_413011", "413011063", "story_v_out_413011.awb")

						arg_259_1:RecordAudio("413011063", var_262_24)
						arg_259_1:RecordAudio("413011063", var_262_24)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_413011", "413011063", "story_v_out_413011.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_413011", "413011063", "story_v_out_413011.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_25 = math.max(var_262_16, arg_259_1.talkMaxDuration)

			if var_262_15 <= arg_259_1.time_ and arg_259_1.time_ < var_262_15 + var_262_25 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_15) / var_262_25

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_15 + var_262_25 and arg_259_1.time_ < var_262_15 + var_262_25 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play413011064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 413011064
		arg_263_1.duration_ = 9

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play413011065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = "F10f"

			if arg_263_1.bgs_[var_266_0] == nil then
				local var_266_1 = Object.Instantiate(arg_263_1.paintGo_)

				var_266_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_266_0)
				var_266_1.name = var_266_0
				var_266_1.transform.parent = arg_263_1.stage_.transform
				var_266_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_263_1.bgs_[var_266_0] = var_266_1
			end

			local var_266_2 = 2

			if var_266_2 < arg_263_1.time_ and arg_263_1.time_ <= var_266_2 + arg_266_0 then
				local var_266_3 = manager.ui.mainCamera.transform.localPosition
				local var_266_4 = Vector3.New(0, 0, 10) + Vector3.New(var_266_3.x, var_266_3.y, 0)
				local var_266_5 = arg_263_1.bgs_.F10f

				var_266_5.transform.localPosition = var_266_4
				var_266_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_266_6 = var_266_5:GetComponent("SpriteRenderer")

				if var_266_6 and var_266_6.sprite then
					local var_266_7 = (var_266_5.transform.localPosition - var_266_3).z
					local var_266_8 = manager.ui.mainCameraCom_
					local var_266_9 = 2 * var_266_7 * Mathf.Tan(var_266_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_266_10 = var_266_9 * var_266_8.aspect
					local var_266_11 = var_266_6.sprite.bounds.size.x
					local var_266_12 = var_266_6.sprite.bounds.size.y
					local var_266_13 = var_266_10 / var_266_11
					local var_266_14 = var_266_9 / var_266_12
					local var_266_15 = var_266_14 < var_266_13 and var_266_13 or var_266_14

					var_266_5.transform.localScale = Vector3.New(var_266_15, var_266_15, 0)
				end

				for iter_266_0, iter_266_1 in pairs(arg_263_1.bgs_) do
					if iter_266_0 ~= "F10f" then
						iter_266_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_266_16 = 3.999999999999

			if var_266_16 < arg_263_1.time_ and arg_263_1.time_ <= var_266_16 + arg_266_0 then
				arg_263_1.allBtn_.enabled = false
			end

			local var_266_17 = 0.3

			if arg_263_1.time_ >= var_266_16 + var_266_17 and arg_263_1.time_ < var_266_16 + var_266_17 + arg_266_0 then
				arg_263_1.allBtn_.enabled = true
			end

			local var_266_18 = 0

			if var_266_18 < arg_263_1.time_ and arg_263_1.time_ <= var_266_18 + arg_266_0 then
				arg_263_1.mask_.enabled = true
				arg_263_1.mask_.raycastTarget = true

				arg_263_1:SetGaussion(false)
			end

			local var_266_19 = 2

			if var_266_18 <= arg_263_1.time_ and arg_263_1.time_ < var_266_18 + var_266_19 then
				local var_266_20 = (arg_263_1.time_ - var_266_18) / var_266_19
				local var_266_21 = Color.New(0, 0, 0)

				var_266_21.a = Mathf.Lerp(0, 1, var_266_20)
				arg_263_1.mask_.color = var_266_21
			end

			if arg_263_1.time_ >= var_266_18 + var_266_19 and arg_263_1.time_ < var_266_18 + var_266_19 + arg_266_0 then
				local var_266_22 = Color.New(0, 0, 0)

				var_266_22.a = 1
				arg_263_1.mask_.color = var_266_22
			end

			local var_266_23 = 2

			if var_266_23 < arg_263_1.time_ and arg_263_1.time_ <= var_266_23 + arg_266_0 then
				arg_263_1.mask_.enabled = true
				arg_263_1.mask_.raycastTarget = true

				arg_263_1:SetGaussion(false)
			end

			local var_266_24 = 2

			if var_266_23 <= arg_263_1.time_ and arg_263_1.time_ < var_266_23 + var_266_24 then
				local var_266_25 = (arg_263_1.time_ - var_266_23) / var_266_24
				local var_266_26 = Color.New(0, 0, 0)

				var_266_26.a = Mathf.Lerp(1, 0, var_266_25)
				arg_263_1.mask_.color = var_266_26
			end

			if arg_263_1.time_ >= var_266_23 + var_266_24 and arg_263_1.time_ < var_266_23 + var_266_24 + arg_266_0 then
				local var_266_27 = Color.New(0, 0, 0)
				local var_266_28 = 0

				arg_263_1.mask_.enabled = false
				var_266_27.a = var_266_28
				arg_263_1.mask_.color = var_266_27
			end

			local var_266_29 = arg_263_1.actors_["10094"].transform
			local var_266_30 = 1.966

			if var_266_30 < arg_263_1.time_ and arg_263_1.time_ <= var_266_30 + arg_266_0 then
				arg_263_1.var_.moveOldPos10094 = var_266_29.localPosition
				var_266_29.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("10094", 0)

				local var_266_31 = var_266_29.childCount

				for iter_266_2 = 0, var_266_31 - 1 do
					local var_266_32 = var_266_29:GetChild(iter_266_2)

					if var_266_32.name == "" or not string.find(var_266_32.name, "split") then
						var_266_32.gameObject:SetActive(true)
					else
						var_266_32.gameObject:SetActive(false)
					end
				end
			end

			local var_266_33 = 0.001

			if var_266_30 <= arg_263_1.time_ and arg_263_1.time_ < var_266_30 + var_266_33 then
				local var_266_34 = (arg_263_1.time_ - var_266_30) / var_266_33
				local var_266_35 = Vector3.New(-5000, -340, -414)

				var_266_29.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos10094, var_266_35, var_266_34)
			end

			if arg_263_1.time_ >= var_266_30 + var_266_33 and arg_263_1.time_ < var_266_30 + var_266_33 + arg_266_0 then
				var_266_29.localPosition = Vector3.New(-5000, -340, -414)
			end

			local var_266_36 = arg_263_1.actors_["10022"].transform
			local var_266_37 = 1.966

			if var_266_37 < arg_263_1.time_ and arg_263_1.time_ <= var_266_37 + arg_266_0 then
				arg_263_1.var_.moveOldPos10022 = var_266_36.localPosition
				var_266_36.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("10022", 0)

				local var_266_38 = var_266_36.childCount

				for iter_266_3 = 0, var_266_38 - 1 do
					local var_266_39 = var_266_36:GetChild(iter_266_3)

					if var_266_39.name == "" or not string.find(var_266_39.name, "split") then
						var_266_39.gameObject:SetActive(true)
					else
						var_266_39.gameObject:SetActive(false)
					end
				end
			end

			local var_266_40 = 0.001

			if var_266_37 <= arg_263_1.time_ and arg_263_1.time_ < var_266_37 + var_266_40 then
				local var_266_41 = (arg_263_1.time_ - var_266_37) / var_266_40
				local var_266_42 = Vector3.New(-5000, -315, -320)

				var_266_36.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos10022, var_266_42, var_266_41)
			end

			if arg_263_1.time_ >= var_266_37 + var_266_40 and arg_263_1.time_ < var_266_37 + var_266_40 + arg_266_0 then
				var_266_36.localPosition = Vector3.New(-5000, -315, -320)
			end

			local var_266_43 = arg_263_1.actors_["10094"]
			local var_266_44 = 1.966

			if var_266_44 < arg_263_1.time_ and arg_263_1.time_ <= var_266_44 + arg_266_0 and not isNil(var_266_43) and arg_263_1.var_.actorSpriteComps10094 == nil then
				arg_263_1.var_.actorSpriteComps10094 = var_266_43:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_45 = 0.0166666666666667

			if var_266_44 <= arg_263_1.time_ and arg_263_1.time_ < var_266_44 + var_266_45 and not isNil(var_266_43) then
				local var_266_46 = (arg_263_1.time_ - var_266_44) / var_266_45

				if arg_263_1.var_.actorSpriteComps10094 then
					for iter_266_4, iter_266_5 in pairs(arg_263_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_266_5 then
							if arg_263_1.isInRecall_ then
								local var_266_47 = Mathf.Lerp(iter_266_5.color.r, arg_263_1.hightColor2.r, var_266_46)
								local var_266_48 = Mathf.Lerp(iter_266_5.color.g, arg_263_1.hightColor2.g, var_266_46)
								local var_266_49 = Mathf.Lerp(iter_266_5.color.b, arg_263_1.hightColor2.b, var_266_46)

								iter_266_5.color = Color.New(var_266_47, var_266_48, var_266_49)
							else
								local var_266_50 = Mathf.Lerp(iter_266_5.color.r, 0.5, var_266_46)

								iter_266_5.color = Color.New(var_266_50, var_266_50, var_266_50)
							end
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_44 + var_266_45 and arg_263_1.time_ < var_266_44 + var_266_45 + arg_266_0 and not isNil(var_266_43) and arg_263_1.var_.actorSpriteComps10094 then
				for iter_266_6, iter_266_7 in pairs(arg_263_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_266_7 then
						if arg_263_1.isInRecall_ then
							iter_266_7.color = arg_263_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_266_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_263_1.var_.actorSpriteComps10094 = nil
			end

			local var_266_51 = arg_263_1.actors_["10022"]
			local var_266_52 = 1.966

			if var_266_52 < arg_263_1.time_ and arg_263_1.time_ <= var_266_52 + arg_266_0 and not isNil(var_266_51) and arg_263_1.var_.actorSpriteComps10022 == nil then
				arg_263_1.var_.actorSpriteComps10022 = var_266_51:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_53 = 0.0166666666666667

			if var_266_52 <= arg_263_1.time_ and arg_263_1.time_ < var_266_52 + var_266_53 and not isNil(var_266_51) then
				local var_266_54 = (arg_263_1.time_ - var_266_52) / var_266_53

				if arg_263_1.var_.actorSpriteComps10022 then
					for iter_266_8, iter_266_9 in pairs(arg_263_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_266_9 then
							if arg_263_1.isInRecall_ then
								local var_266_55 = Mathf.Lerp(iter_266_9.color.r, arg_263_1.hightColor2.r, var_266_54)
								local var_266_56 = Mathf.Lerp(iter_266_9.color.g, arg_263_1.hightColor2.g, var_266_54)
								local var_266_57 = Mathf.Lerp(iter_266_9.color.b, arg_263_1.hightColor2.b, var_266_54)

								iter_266_9.color = Color.New(var_266_55, var_266_56, var_266_57)
							else
								local var_266_58 = Mathf.Lerp(iter_266_9.color.r, 0.5, var_266_54)

								iter_266_9.color = Color.New(var_266_58, var_266_58, var_266_58)
							end
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_52 + var_266_53 and arg_263_1.time_ < var_266_52 + var_266_53 + arg_266_0 and not isNil(var_266_51) and arg_263_1.var_.actorSpriteComps10022 then
				for iter_266_10, iter_266_11 in pairs(arg_263_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_266_11 then
						if arg_263_1.isInRecall_ then
							iter_266_11.color = arg_263_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_266_11.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_263_1.var_.actorSpriteComps10022 = nil
			end

			local var_266_59 = 0
			local var_266_60 = 1.966

			if var_266_59 < arg_263_1.time_ and arg_263_1.time_ <= var_266_59 + arg_266_0 then
				local var_266_61 = "play"
				local var_266_62 = "music"

				arg_263_1:AudioAction(var_266_61, var_266_62, "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor.awb")

				local var_266_63 = ""
				local var_266_64 = manager.audio:GetAudioName("bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor")

				if var_266_64 ~= "" then
					if arg_263_1.bgmTxt_.text ~= var_266_64 and arg_263_1.bgmTxt_.text ~= "" then
						if arg_263_1.bgmTxt2_.text ~= "" then
							arg_263_1.bgmTxt_.text = arg_263_1.bgmTxt2_.text
						end

						arg_263_1.bgmTxt2_.text = var_266_64

						arg_263_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_263_1.bgmTxt_.text = var_266_64
					end

					if arg_263_1.bgmTimer then
						arg_263_1.bgmTimer:Stop()

						arg_263_1.bgmTimer = nil
					end

					if arg_263_1.settingData.show_music_name == 1 then
						arg_263_1.musicController:SetSelectedState("show")
						arg_263_1.musicAnimator_:Play("open", 0, 0)

						if arg_263_1.settingData.music_time ~= 0 then
							arg_263_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_263_1.settingData.music_time), function()
								if arg_263_1 == nil or isNil(arg_263_1.bgmTxt_) then
									return
								end

								arg_263_1.musicController:SetSelectedState("hide")
								arg_263_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_266_65 = arg_263_1.actors_["10022"]
			local var_266_66 = 1.966

			if var_266_66 < arg_263_1.time_ and arg_263_1.time_ <= var_266_66 + arg_266_0 then
				arg_263_1:SetSpriteNiuquEffect("10022", false)
			end

			if arg_263_1.frameCnt_ <= 1 then
				arg_263_1.dialog_:SetActive(false)
			end

			local var_266_67 = 3.999999999999
			local var_266_68 = 0.75

			if var_266_67 < arg_263_1.time_ and arg_263_1.time_ <= var_266_67 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0

				arg_263_1.dialog_:SetActive(true)

				local var_266_69 = LeanTween.value(arg_263_1.dialog_, 0, 1, 0.3)

				var_266_69:setOnUpdate(LuaHelper.FloatAction(function(arg_268_0)
					arg_263_1.dialogCg_.alpha = arg_268_0
				end))
				var_266_69:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_263_1.dialog_)
					var_266_69:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_263_1.duration_ = arg_263_1.duration_ + 0.3

				SetActive(arg_263_1.leftNameGo_, false)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_70 = arg_263_1:GetWordFromCfg(413011064)
				local var_266_71 = arg_263_1:FormatText(var_266_70.content)

				arg_263_1.text_.text = var_266_71

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_72 = 30
				local var_266_73 = utf8.len(var_266_71)
				local var_266_74 = var_266_72 <= 0 and var_266_68 or var_266_68 * (var_266_73 / var_266_72)

				if var_266_74 > 0 and var_266_68 < var_266_74 then
					arg_263_1.talkMaxDuration = var_266_74
					var_266_67 = var_266_67 + 0.3

					if var_266_74 + var_266_67 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_74 + var_266_67
					end
				end

				arg_263_1.text_.text = var_266_71
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)
				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_75 = var_266_67 + 0.3
			local var_266_76 = math.max(var_266_68, arg_263_1.talkMaxDuration)

			if var_266_75 <= arg_263_1.time_ and arg_263_1.time_ < var_266_75 + var_266_76 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_75) / var_266_76

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_75 + var_266_76 and arg_263_1.time_ < var_266_75 + var_266_76 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play413011065 = function(arg_270_0, arg_270_1)
		arg_270_1.time_ = 0
		arg_270_1.frameCnt_ = 0
		arg_270_1.state_ = "playing"
		arg_270_1.curTalkId_ = 413011065
		arg_270_1.duration_ = 2

		SetActive(arg_270_1.tipsGo_, false)

		function arg_270_1.onSingleLineFinish_()
			arg_270_1.onSingleLineUpdate_ = nil
			arg_270_1.onSingleLineFinish_ = nil
			arg_270_1.state_ = "waiting"
		end

		function arg_270_1.playNext_(arg_272_0)
			if arg_272_0 == 1 then
				arg_270_0:Play413011066(arg_270_1)
			end
		end

		function arg_270_1.onSingleLineUpdate_(arg_273_0)
			local var_273_0 = "10093"

			if arg_270_1.actors_[var_273_0] == nil then
				local var_273_1 = Asset.Load("Widget/System/Story/StoryExpression/" .. "10093")

				if not isNil(var_273_1) then
					local var_273_2 = Object.Instantiate(var_273_1, arg_270_1.canvasGo_.transform)

					var_273_2.transform:SetSiblingIndex(1)

					var_273_2.name = var_273_0
					var_273_2.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_270_1.actors_[var_273_0] = var_273_2

					local var_273_3 = var_273_2:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_270_1.isInRecall_ then
						for iter_273_0, iter_273_1 in ipairs(var_273_3) do
							iter_273_1.color = arg_270_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_273_4 = arg_270_1.actors_["10093"].transform
			local var_273_5 = 0

			if var_273_5 < arg_270_1.time_ and arg_270_1.time_ <= var_273_5 + arg_273_0 then
				arg_270_1.var_.moveOldPos10093 = var_273_4.localPosition
				var_273_4.localScale = Vector3.New(1, 1, 1)

				arg_270_1:CheckSpriteTmpPos("10093", 3)

				local var_273_6 = var_273_4.childCount

				for iter_273_2 = 0, var_273_6 - 1 do
					local var_273_7 = var_273_4:GetChild(iter_273_2)

					if var_273_7.name == "split_3" or not string.find(var_273_7.name, "split") then
						var_273_7.gameObject:SetActive(true)
					else
						var_273_7.gameObject:SetActive(false)
					end
				end
			end

			local var_273_8 = 0.001

			if var_273_5 <= arg_270_1.time_ and arg_270_1.time_ < var_273_5 + var_273_8 then
				local var_273_9 = (arg_270_1.time_ - var_273_5) / var_273_8
				local var_273_10 = Vector3.New(0, -345, -245)

				var_273_4.localPosition = Vector3.Lerp(arg_270_1.var_.moveOldPos10093, var_273_10, var_273_9)
			end

			if arg_270_1.time_ >= var_273_5 + var_273_8 and arg_270_1.time_ < var_273_5 + var_273_8 + arg_273_0 then
				var_273_4.localPosition = Vector3.New(0, -345, -245)
			end

			local var_273_11 = arg_270_1.actors_["10093"]
			local var_273_12 = 0

			if var_273_12 < arg_270_1.time_ and arg_270_1.time_ <= var_273_12 + arg_273_0 and not isNil(var_273_11) and arg_270_1.var_.actorSpriteComps10093 == nil then
				arg_270_1.var_.actorSpriteComps10093 = var_273_11:GetComponentsInChildren(typeof(Image), true)
			end

			local var_273_13 = 2

			if var_273_12 <= arg_270_1.time_ and arg_270_1.time_ < var_273_12 + var_273_13 and not isNil(var_273_11) then
				local var_273_14 = (arg_270_1.time_ - var_273_12) / var_273_13

				if arg_270_1.var_.actorSpriteComps10093 then
					for iter_273_3, iter_273_4 in pairs(arg_270_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_273_4 then
							if arg_270_1.isInRecall_ then
								local var_273_15 = Mathf.Lerp(iter_273_4.color.r, arg_270_1.hightColor1.r, var_273_14)
								local var_273_16 = Mathf.Lerp(iter_273_4.color.g, arg_270_1.hightColor1.g, var_273_14)
								local var_273_17 = Mathf.Lerp(iter_273_4.color.b, arg_270_1.hightColor1.b, var_273_14)

								iter_273_4.color = Color.New(var_273_15, var_273_16, var_273_17)
							else
								local var_273_18 = Mathf.Lerp(iter_273_4.color.r, 1, var_273_14)

								iter_273_4.color = Color.New(var_273_18, var_273_18, var_273_18)
							end
						end
					end
				end
			end

			if arg_270_1.time_ >= var_273_12 + var_273_13 and arg_270_1.time_ < var_273_12 + var_273_13 + arg_273_0 and not isNil(var_273_11) and arg_270_1.var_.actorSpriteComps10093 then
				for iter_273_5, iter_273_6 in pairs(arg_270_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_273_6 then
						if arg_270_1.isInRecall_ then
							iter_273_6.color = arg_270_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_273_6.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_270_1.var_.actorSpriteComps10093 = nil
			end

			local var_273_19 = arg_270_1.actors_["10093"]
			local var_273_20 = 0

			if var_273_20 < arg_270_1.time_ and arg_270_1.time_ <= var_273_20 + arg_273_0 then
				local var_273_21 = var_273_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_273_21 then
					arg_270_1.var_.alphaOldValue10093 = var_273_21.alpha
					arg_270_1.var_.characterEffect10093 = var_273_21
				end

				arg_270_1.var_.alphaOldValue10093 = 0
			end

			local var_273_22 = 0.3

			if var_273_20 <= arg_270_1.time_ and arg_270_1.time_ < var_273_20 + var_273_22 then
				local var_273_23 = (arg_270_1.time_ - var_273_20) / var_273_22
				local var_273_24 = Mathf.Lerp(arg_270_1.var_.alphaOldValue10093, 1, var_273_23)

				if arg_270_1.var_.characterEffect10093 then
					arg_270_1.var_.characterEffect10093.alpha = var_273_24
				end
			end

			if arg_270_1.time_ >= var_273_20 + var_273_22 and arg_270_1.time_ < var_273_20 + var_273_22 + arg_273_0 and arg_270_1.var_.characterEffect10093 then
				arg_270_1.var_.characterEffect10093.alpha = 1
			end

			local var_273_25 = manager.ui.mainCamera.transform
			local var_273_26 = 0

			if var_273_26 < arg_270_1.time_ and arg_270_1.time_ <= var_273_26 + arg_273_0 then
				arg_270_1.var_.shakeOldPos = var_273_25.localPosition
			end

			local var_273_27 = 0.6

			if var_273_26 <= arg_270_1.time_ and arg_270_1.time_ < var_273_26 + var_273_27 then
				local var_273_28 = (arg_270_1.time_ - var_273_26) / 0.066
				local var_273_29, var_273_30 = math.modf(var_273_28)

				var_273_25.localPosition = Vector3.New(var_273_30 * 0.13, var_273_30 * 0.13, var_273_30 * 0.13) + arg_270_1.var_.shakeOldPos
			end

			if arg_270_1.time_ >= var_273_26 + var_273_27 and arg_270_1.time_ < var_273_26 + var_273_27 + arg_273_0 then
				var_273_25.localPosition = arg_270_1.var_.shakeOldPos
			end

			local var_273_31 = 0

			if var_273_31 < arg_270_1.time_ and arg_270_1.time_ <= var_273_31 + arg_273_0 then
				arg_270_1.allBtn_.enabled = false
			end

			local var_273_32 = 0.6

			if arg_270_1.time_ >= var_273_31 + var_273_32 and arg_270_1.time_ < var_273_31 + var_273_32 + arg_273_0 then
				arg_270_1.allBtn_.enabled = true
			end

			local var_273_33 = 0
			local var_273_34 = 0.1

			if var_273_33 < arg_270_1.time_ and arg_270_1.time_ <= var_273_33 + arg_273_0 then
				arg_270_1.talkMaxDuration = 0
				arg_270_1.dialogCg_.alpha = 1

				arg_270_1.dialog_:SetActive(true)
				SetActive(arg_270_1.leftNameGo_, true)

				local var_273_35 = arg_270_1:FormatText(StoryNameCfg[28].name)

				arg_270_1.leftNameTxt_.text = var_273_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_270_1.leftNameTxt_.transform)

				arg_270_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_270_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_270_1:RecordName(arg_270_1.leftNameTxt_.text)
				SetActive(arg_270_1.iconTrs_.gameObject, false)
				arg_270_1.callingController_:SetSelectedState("normal")

				local var_273_36 = arg_270_1:GetWordFromCfg(413011065)
				local var_273_37 = arg_270_1:FormatText(var_273_36.content)

				arg_270_1.text_.text = var_273_37

				LuaForUtil.ClearLinePrefixSymbol(arg_270_1.text_)

				local var_273_38 = 4
				local var_273_39 = utf8.len(var_273_37)
				local var_273_40 = var_273_38 <= 0 and var_273_34 or var_273_34 * (var_273_39 / var_273_38)

				if var_273_40 > 0 and var_273_34 < var_273_40 then
					arg_270_1.talkMaxDuration = var_273_40

					if var_273_40 + var_273_33 > arg_270_1.duration_ then
						arg_270_1.duration_ = var_273_40 + var_273_33
					end
				end

				arg_270_1.text_.text = var_273_37
				arg_270_1.typewritter.percent = 0

				arg_270_1.typewritter:SetDirty()
				arg_270_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011065", "story_v_out_413011.awb") ~= 0 then
					local var_273_41 = manager.audio:GetVoiceLength("story_v_out_413011", "413011065", "story_v_out_413011.awb") / 1000

					if var_273_41 + var_273_33 > arg_270_1.duration_ then
						arg_270_1.duration_ = var_273_41 + var_273_33
					end

					if var_273_36.prefab_name ~= "" and arg_270_1.actors_[var_273_36.prefab_name] ~= nil then
						local var_273_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_270_1.actors_[var_273_36.prefab_name].transform, "story_v_out_413011", "413011065", "story_v_out_413011.awb")

						arg_270_1:RecordAudio("413011065", var_273_42)
						arg_270_1:RecordAudio("413011065", var_273_42)
					else
						arg_270_1:AudioAction("play", "voice", "story_v_out_413011", "413011065", "story_v_out_413011.awb")
					end

					arg_270_1:RecordHistoryTalkVoice("story_v_out_413011", "413011065", "story_v_out_413011.awb")
				end

				arg_270_1:RecordContent(arg_270_1.text_.text)
			end

			local var_273_43 = math.max(var_273_34, arg_270_1.talkMaxDuration)

			if var_273_33 <= arg_270_1.time_ and arg_270_1.time_ < var_273_33 + var_273_43 then
				arg_270_1.typewritter.percent = (arg_270_1.time_ - var_273_33) / var_273_43

				arg_270_1.typewritter:SetDirty()
			end

			if arg_270_1.time_ >= var_273_33 + var_273_43 and arg_270_1.time_ < var_273_33 + var_273_43 + arg_273_0 then
				arg_270_1.typewritter.percent = 1

				arg_270_1.typewritter:SetDirty()
				arg_270_1:ShowNextGo(true)
			end
		end
	end,
	Play413011066 = function(arg_274_0, arg_274_1)
		arg_274_1.time_ = 0
		arg_274_1.frameCnt_ = 0
		arg_274_1.state_ = "playing"
		arg_274_1.curTalkId_ = 413011066
		arg_274_1.duration_ = 2

		SetActive(arg_274_1.tipsGo_, false)

		function arg_274_1.onSingleLineFinish_()
			arg_274_1.onSingleLineUpdate_ = nil
			arg_274_1.onSingleLineFinish_ = nil
			arg_274_1.state_ = "waiting"
		end

		function arg_274_1.playNext_(arg_276_0)
			if arg_276_0 == 1 then
				arg_274_0:Play413011067(arg_274_1)
			end
		end

		function arg_274_1.onSingleLineUpdate_(arg_277_0)
			local var_277_0 = arg_274_1.actors_["10093"].transform
			local var_277_1 = 0

			if var_277_1 < arg_274_1.time_ and arg_274_1.time_ <= var_277_1 + arg_277_0 then
				arg_274_1.var_.moveOldPos10093 = var_277_0.localPosition
				var_277_0.localScale = Vector3.New(1, 1, 1)

				arg_274_1:CheckSpriteTmpPos("10093", 7)

				local var_277_2 = var_277_0.childCount

				for iter_277_0 = 0, var_277_2 - 1 do
					local var_277_3 = var_277_0:GetChild(iter_277_0)

					if var_277_3.name == "" or not string.find(var_277_3.name, "split") then
						var_277_3.gameObject:SetActive(true)
					else
						var_277_3.gameObject:SetActive(false)
					end
				end
			end

			local var_277_4 = 0.001

			if var_277_1 <= arg_274_1.time_ and arg_274_1.time_ < var_277_1 + var_277_4 then
				local var_277_5 = (arg_274_1.time_ - var_277_1) / var_277_4
				local var_277_6 = Vector3.New(0, -2000, 0)

				var_277_0.localPosition = Vector3.Lerp(arg_274_1.var_.moveOldPos10093, var_277_6, var_277_5)
			end

			if arg_274_1.time_ >= var_277_1 + var_277_4 and arg_274_1.time_ < var_277_1 + var_277_4 + arg_277_0 then
				var_277_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_277_7 = 1.63333333333333
			local var_277_8 = 0.366666666666667

			if var_277_7 < arg_274_1.time_ and arg_274_1.time_ <= var_277_7 + arg_277_0 then
				local var_277_9 = "play"
				local var_277_10 = "effect"

				arg_274_1:AudioAction(var_277_9, var_277_10, "c_10079", "c_10079_bullet_7", "")
			end

			local var_277_11 = 0
			local var_277_12 = 0.2

			if var_277_11 < arg_274_1.time_ and arg_274_1.time_ <= var_277_11 + arg_277_0 then
				arg_274_1.talkMaxDuration = 0
				arg_274_1.dialogCg_.alpha = 1

				arg_274_1.dialog_:SetActive(true)
				SetActive(arg_274_1.leftNameGo_, true)

				local var_277_13 = arg_274_1:FormatText(StoryNameCfg[996].name)

				arg_274_1.leftNameTxt_.text = var_277_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_274_1.leftNameTxt_.transform)

				arg_274_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_274_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_274_1:RecordName(arg_274_1.leftNameTxt_.text)
				SetActive(arg_274_1.iconTrs_.gameObject, true)
				arg_274_1.iconController_:SetSelectedState("hero")

				arg_274_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10092_split_1")

				arg_274_1.callingController_:SetSelectedState("normal")

				arg_274_1.keyicon_.color = Color.New(1, 1, 1)
				arg_274_1.icon_.color = Color.New(1, 1, 1)

				local var_277_14 = arg_274_1:GetWordFromCfg(413011066)
				local var_277_15 = arg_274_1:FormatText(var_277_14.content)

				arg_274_1.text_.text = var_277_15

				LuaForUtil.ClearLinePrefixSymbol(arg_274_1.text_)

				local var_277_16 = 8
				local var_277_17 = utf8.len(var_277_15)
				local var_277_18 = var_277_16 <= 0 and var_277_12 or var_277_12 * (var_277_17 / var_277_16)

				if var_277_18 > 0 and var_277_12 < var_277_18 then
					arg_274_1.talkMaxDuration = var_277_18

					if var_277_18 + var_277_11 > arg_274_1.duration_ then
						arg_274_1.duration_ = var_277_18 + var_277_11
					end
				end

				arg_274_1.text_.text = var_277_15
				arg_274_1.typewritter.percent = 0

				arg_274_1.typewritter:SetDirty()
				arg_274_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011066", "story_v_out_413011.awb") ~= 0 then
					local var_277_19 = manager.audio:GetVoiceLength("story_v_out_413011", "413011066", "story_v_out_413011.awb") / 1000

					if var_277_19 + var_277_11 > arg_274_1.duration_ then
						arg_274_1.duration_ = var_277_19 + var_277_11
					end

					if var_277_14.prefab_name ~= "" and arg_274_1.actors_[var_277_14.prefab_name] ~= nil then
						local var_277_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_274_1.actors_[var_277_14.prefab_name].transform, "story_v_out_413011", "413011066", "story_v_out_413011.awb")

						arg_274_1:RecordAudio("413011066", var_277_20)
						arg_274_1:RecordAudio("413011066", var_277_20)
					else
						arg_274_1:AudioAction("play", "voice", "story_v_out_413011", "413011066", "story_v_out_413011.awb")
					end

					arg_274_1:RecordHistoryTalkVoice("story_v_out_413011", "413011066", "story_v_out_413011.awb")
				end

				arg_274_1:RecordContent(arg_274_1.text_.text)
			end

			local var_277_21 = math.max(var_277_12, arg_274_1.talkMaxDuration)

			if var_277_11 <= arg_274_1.time_ and arg_274_1.time_ < var_277_11 + var_277_21 then
				arg_274_1.typewritter.percent = (arg_274_1.time_ - var_277_11) / var_277_21

				arg_274_1.typewritter:SetDirty()
			end

			if arg_274_1.time_ >= var_277_11 + var_277_21 and arg_274_1.time_ < var_277_11 + var_277_21 + arg_277_0 then
				arg_274_1.typewritter.percent = 1

				arg_274_1.typewritter:SetDirty()
				arg_274_1:ShowNextGo(true)
			end
		end
	end,
	Play413011067 = function(arg_278_0, arg_278_1)
		arg_278_1.time_ = 0
		arg_278_1.frameCnt_ = 0
		arg_278_1.state_ = "playing"
		arg_278_1.curTalkId_ = 413011067
		arg_278_1.duration_ = 6

		SetActive(arg_278_1.tipsGo_, false)

		function arg_278_1.onSingleLineFinish_()
			arg_278_1.onSingleLineUpdate_ = nil
			arg_278_1.onSingleLineFinish_ = nil
			arg_278_1.state_ = "waiting"
		end

		function arg_278_1.playNext_(arg_280_0)
			if arg_280_0 == 1 then
				arg_278_0:Play413011068(arg_278_1)
			end
		end

		function arg_278_1.onSingleLineUpdate_(arg_281_0)
			local var_281_0 = "10092"

			if arg_278_1.actors_[var_281_0] == nil then
				local var_281_1 = Asset.Load("Widget/System/Story/StoryExpression/" .. "10092")

				if not isNil(var_281_1) then
					local var_281_2 = Object.Instantiate(var_281_1, arg_278_1.canvasGo_.transform)

					var_281_2.transform:SetSiblingIndex(1)

					var_281_2.name = var_281_0
					var_281_2.transform.localPosition = Vector3.New(0, 100000, 0)
					arg_278_1.actors_[var_281_0] = var_281_2

					local var_281_3 = var_281_2:GetComponentsInChildren(typeof(Image), true):ToTable()

					if arg_278_1.isInRecall_ then
						for iter_281_0, iter_281_1 in ipairs(var_281_3) do
							iter_281_1.color = arg_278_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						end
					end
				end
			end

			local var_281_4 = arg_278_1.actors_["10092"]
			local var_281_5 = 0

			if var_281_5 < arg_278_1.time_ and arg_278_1.time_ <= var_281_5 + arg_281_0 and not isNil(var_281_4) and arg_278_1.var_.actorSpriteComps10092 == nil then
				arg_278_1.var_.actorSpriteComps10092 = var_281_4:GetComponentsInChildren(typeof(Image), true)
			end

			local var_281_6 = 2

			if var_281_5 <= arg_278_1.time_ and arg_278_1.time_ < var_281_5 + var_281_6 and not isNil(var_281_4) then
				local var_281_7 = (arg_278_1.time_ - var_281_5) / var_281_6

				if arg_278_1.var_.actorSpriteComps10092 then
					for iter_281_2, iter_281_3 in pairs(arg_278_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_281_3 then
							if arg_278_1.isInRecall_ then
								local var_281_8 = Mathf.Lerp(iter_281_3.color.r, arg_278_1.hightColor2.r, var_281_7)
								local var_281_9 = Mathf.Lerp(iter_281_3.color.g, arg_278_1.hightColor2.g, var_281_7)
								local var_281_10 = Mathf.Lerp(iter_281_3.color.b, arg_278_1.hightColor2.b, var_281_7)

								iter_281_3.color = Color.New(var_281_8, var_281_9, var_281_10)
							else
								local var_281_11 = Mathf.Lerp(iter_281_3.color.r, 0.5, var_281_7)

								iter_281_3.color = Color.New(var_281_11, var_281_11, var_281_11)
							end
						end
					end
				end
			end

			if arg_278_1.time_ >= var_281_5 + var_281_6 and arg_278_1.time_ < var_281_5 + var_281_6 + arg_281_0 and not isNil(var_281_4) and arg_278_1.var_.actorSpriteComps10092 then
				for iter_281_4, iter_281_5 in pairs(arg_278_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_281_5 then
						if arg_278_1.isInRecall_ then
							iter_281_5.color = arg_278_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_281_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_278_1.var_.actorSpriteComps10092 = nil
			end

			local var_281_12 = manager.ui.mainCamera.transform
			local var_281_13 = 0

			if var_281_13 < arg_278_1.time_ and arg_278_1.time_ <= var_281_13 + arg_281_0 then
				arg_278_1.var_.shakeOldPos = var_281_12.localPosition
			end

			local var_281_14 = 0.6

			if var_281_13 <= arg_278_1.time_ and arg_278_1.time_ < var_281_13 + var_281_14 then
				local var_281_15 = (arg_278_1.time_ - var_281_13) / 0.066
				local var_281_16, var_281_17 = math.modf(var_281_15)

				var_281_12.localPosition = Vector3.New(var_281_17 * 0.13, var_281_17 * 0.13, var_281_17 * 0.13) + arg_278_1.var_.shakeOldPos
			end

			if arg_278_1.time_ >= var_281_13 + var_281_14 and arg_278_1.time_ < var_281_13 + var_281_14 + arg_281_0 then
				var_281_12.localPosition = arg_278_1.var_.shakeOldPos
			end

			local var_281_18 = manager.ui.mainCamera.transform
			local var_281_19 = 0

			if var_281_19 < arg_278_1.time_ and arg_278_1.time_ <= var_281_19 + arg_281_0 then
				local var_281_20 = arg_278_1.var_.effectjiaofeng1

				if not var_281_20 then
					var_281_20 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_02"))
					var_281_20.name = "jiaofeng1"
					arg_278_1.var_.effectjiaofeng1 = var_281_20
				end

				local var_281_21 = var_281_18:Find("")

				if var_281_21 then
					var_281_20.transform.parent = var_281_21
				else
					var_281_20.transform.parent = var_281_18
				end

				var_281_20.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_281_20.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_281_22 = manager.ui.mainCamera.transform
			local var_281_23 = 1

			if var_281_23 < arg_278_1.time_ and arg_278_1.time_ <= var_281_23 + arg_281_0 then
				local var_281_24 = arg_278_1.var_.effectjiaofeng1

				if var_281_24 then
					Object.Destroy(var_281_24)

					arg_278_1.var_.effectjiaofeng1 = nil
				end
			end

			local var_281_25 = 0.466666666666667
			local var_281_26 = 1

			if var_281_25 < arg_278_1.time_ and arg_278_1.time_ <= var_281_25 + arg_281_0 then
				local var_281_27 = "play"
				local var_281_28 = "effect"

				arg_278_1:AudioAction(var_281_27, var_281_28, "se_story_1210", "se_story_1210_weaponfall", "")
			end

			if arg_278_1.frameCnt_ <= 1 then
				arg_278_1.dialog_:SetActive(false)
			end

			local var_281_29 = 1
			local var_281_30 = 0.8

			if var_281_29 < arg_278_1.time_ and arg_278_1.time_ <= var_281_29 + arg_281_0 then
				arg_278_1.talkMaxDuration = 0

				arg_278_1.dialog_:SetActive(true)

				local var_281_31 = LeanTween.value(arg_278_1.dialog_, 0, 1, 0.3)

				var_281_31:setOnUpdate(LuaHelper.FloatAction(function(arg_282_0)
					arg_278_1.dialogCg_.alpha = arg_282_0
				end))
				var_281_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_278_1.dialog_)
					var_281_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_278_1.duration_ = arg_278_1.duration_ + 0.3

				SetActive(arg_278_1.leftNameGo_, false)

				arg_278_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_278_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_278_1:RecordName(arg_278_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_278_1.iconTrs_.gameObject, false)
				arg_278_1.callingController_:SetSelectedState("normal")

				local var_281_32 = arg_278_1:GetWordFromCfg(413011067)
				local var_281_33 = arg_278_1:FormatText(var_281_32.content)

				arg_278_1.text_.text = var_281_33

				LuaForUtil.ClearLinePrefixSymbol(arg_278_1.text_)

				local var_281_34 = 32
				local var_281_35 = utf8.len(var_281_33)
				local var_281_36 = var_281_34 <= 0 and var_281_30 or var_281_30 * (var_281_35 / var_281_34)

				if var_281_36 > 0 and var_281_30 < var_281_36 then
					arg_278_1.talkMaxDuration = var_281_36
					var_281_29 = var_281_29 + 0.3

					if var_281_36 + var_281_29 > arg_278_1.duration_ then
						arg_278_1.duration_ = var_281_36 + var_281_29
					end
				end

				arg_278_1.text_.text = var_281_33
				arg_278_1.typewritter.percent = 0

				arg_278_1.typewritter:SetDirty()
				arg_278_1:ShowNextGo(false)
				arg_278_1:RecordContent(arg_278_1.text_.text)
			end

			local var_281_37 = var_281_29 + 0.3
			local var_281_38 = math.max(var_281_30, arg_278_1.talkMaxDuration)

			if var_281_37 <= arg_278_1.time_ and arg_278_1.time_ < var_281_37 + var_281_38 then
				arg_278_1.typewritter.percent = (arg_278_1.time_ - var_281_37) / var_281_38

				arg_278_1.typewritter:SetDirty()
			end

			if arg_278_1.time_ >= var_281_37 + var_281_38 and arg_278_1.time_ < var_281_37 + var_281_38 + arg_281_0 then
				arg_278_1.typewritter.percent = 1

				arg_278_1.typewritter:SetDirty()
				arg_278_1:ShowNextGo(true)
			end
		end
	end,
	Play413011068 = function(arg_284_0, arg_284_1)
		arg_284_1.time_ = 0
		arg_284_1.frameCnt_ = 0
		arg_284_1.state_ = "playing"
		arg_284_1.curTalkId_ = 413011068
		arg_284_1.duration_ = 5

		SetActive(arg_284_1.tipsGo_, false)

		function arg_284_1.onSingleLineFinish_()
			arg_284_1.onSingleLineUpdate_ = nil
			arg_284_1.onSingleLineFinish_ = nil
			arg_284_1.state_ = "waiting"
		end

		function arg_284_1.playNext_(arg_286_0)
			if arg_286_0 == 1 then
				arg_284_0:Play413011069(arg_284_1)
			end
		end

		function arg_284_1.onSingleLineUpdate_(arg_287_0)
			local var_287_0 = 0
			local var_287_1 = 1

			if var_287_0 < arg_284_1.time_ and arg_284_1.time_ <= var_287_0 + arg_287_0 then
				local var_287_2 = "play"
				local var_287_3 = "effect"

				arg_284_1:AudioAction(var_287_2, var_287_3, "se_story_side_1070", "se_story_1070_hit02", "")
			end

			local var_287_4 = 0.542
			local var_287_5 = 0.458

			if var_287_4 < arg_284_1.time_ and arg_284_1.time_ <= var_287_4 + arg_287_0 then
				local var_287_6 = "play"
				local var_287_7 = "effect"

				arg_284_1:AudioAction(var_287_6, var_287_7, "se_story_120_04", "se_story_120_04_punch_hit", "")
			end

			local var_287_8 = manager.ui.mainCamera.transform
			local var_287_9 = 0.0979541018605232

			if var_287_9 < arg_284_1.time_ and arg_284_1.time_ <= var_287_9 + arg_287_0 then
				arg_284_1.var_.shakeOldPos = var_287_8.localPosition
			end

			local var_287_10 = 0.5

			if var_287_9 <= arg_284_1.time_ and arg_284_1.time_ < var_287_9 + var_287_10 then
				local var_287_11 = (arg_284_1.time_ - var_287_9) / 0.066
				local var_287_12, var_287_13 = math.modf(var_287_11)

				var_287_8.localPosition = Vector3.New(var_287_13 * 0.13, var_287_13 * 0.13, var_287_13 * 0.13) + arg_284_1.var_.shakeOldPos
			end

			if arg_284_1.time_ >= var_287_9 + var_287_10 and arg_284_1.time_ < var_287_9 + var_287_10 + arg_287_0 then
				var_287_8.localPosition = arg_284_1.var_.shakeOldPos
			end

			local var_287_14 = 0

			if var_287_14 < arg_284_1.time_ and arg_284_1.time_ <= var_287_14 + arg_287_0 then
				arg_284_1.allBtn_.enabled = false
			end

			local var_287_15 = 0.597954101860523

			if arg_284_1.time_ >= var_287_14 + var_287_15 and arg_284_1.time_ < var_287_14 + var_287_15 + arg_287_0 then
				arg_284_1.allBtn_.enabled = true
			end

			local var_287_16 = 0
			local var_287_17 = 1

			if var_287_16 < arg_284_1.time_ and arg_284_1.time_ <= var_287_16 + arg_287_0 then
				arg_284_1.talkMaxDuration = 0
				arg_284_1.dialogCg_.alpha = 1

				arg_284_1.dialog_:SetActive(true)
				SetActive(arg_284_1.leftNameGo_, false)

				arg_284_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_284_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_284_1:RecordName(arg_284_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_284_1.iconTrs_.gameObject, false)
				arg_284_1.callingController_:SetSelectedState("normal")

				local var_287_18 = arg_284_1:GetWordFromCfg(413011068)
				local var_287_19 = arg_284_1:FormatText(var_287_18.content)

				arg_284_1.text_.text = var_287_19

				LuaForUtil.ClearLinePrefixSymbol(arg_284_1.text_)

				local var_287_20 = 40
				local var_287_21 = utf8.len(var_287_19)
				local var_287_22 = var_287_20 <= 0 and var_287_17 or var_287_17 * (var_287_21 / var_287_20)

				if var_287_22 > 0 and var_287_17 < var_287_22 then
					arg_284_1.talkMaxDuration = var_287_22

					if var_287_22 + var_287_16 > arg_284_1.duration_ then
						arg_284_1.duration_ = var_287_22 + var_287_16
					end
				end

				arg_284_1.text_.text = var_287_19
				arg_284_1.typewritter.percent = 0

				arg_284_1.typewritter:SetDirty()
				arg_284_1:ShowNextGo(false)
				arg_284_1:RecordContent(arg_284_1.text_.text)
			end

			local var_287_23 = math.max(var_287_17, arg_284_1.talkMaxDuration)

			if var_287_16 <= arg_284_1.time_ and arg_284_1.time_ < var_287_16 + var_287_23 then
				arg_284_1.typewritter.percent = (arg_284_1.time_ - var_287_16) / var_287_23

				arg_284_1.typewritter:SetDirty()
			end

			if arg_284_1.time_ >= var_287_16 + var_287_23 and arg_284_1.time_ < var_287_16 + var_287_23 + arg_287_0 then
				arg_284_1.typewritter.percent = 1

				arg_284_1.typewritter:SetDirty()
				arg_284_1:ShowNextGo(true)
			end
		end
	end,
	Play413011069 = function(arg_288_0, arg_288_1)
		arg_288_1.time_ = 0
		arg_288_1.frameCnt_ = 0
		arg_288_1.state_ = "playing"
		arg_288_1.curTalkId_ = 413011069
		arg_288_1.duration_ = 2.07

		local var_288_0 = {
			zh = 2.066,
			ja = 1.999999999999
		}
		local var_288_1 = manager.audio:GetLocalizationFlag()

		if var_288_0[var_288_1] ~= nil then
			arg_288_1.duration_ = var_288_0[var_288_1]
		end

		SetActive(arg_288_1.tipsGo_, false)

		function arg_288_1.onSingleLineFinish_()
			arg_288_1.onSingleLineUpdate_ = nil
			arg_288_1.onSingleLineFinish_ = nil
			arg_288_1.state_ = "waiting"
		end

		function arg_288_1.playNext_(arg_290_0)
			if arg_290_0 == 1 then
				arg_288_0:Play413011070(arg_288_1)
			end
		end

		function arg_288_1.onSingleLineUpdate_(arg_291_0)
			local var_291_0 = arg_288_1.actors_["10092"].transform
			local var_291_1 = 0

			if var_291_1 < arg_288_1.time_ and arg_288_1.time_ <= var_291_1 + arg_291_0 then
				arg_288_1.var_.moveOldPos10092 = var_291_0.localPosition
				var_291_0.localScale = Vector3.New(1, 1, 1)

				arg_288_1:CheckSpriteTmpPos("10092", 2)

				local var_291_2 = var_291_0.childCount

				for iter_291_0 = 0, var_291_2 - 1 do
					local var_291_3 = var_291_0:GetChild(iter_291_0)

					if var_291_3.name == "" or not string.find(var_291_3.name, "split") then
						var_291_3.gameObject:SetActive(true)
					else
						var_291_3.gameObject:SetActive(false)
					end
				end
			end

			local var_291_4 = 0.001

			if var_291_1 <= arg_288_1.time_ and arg_288_1.time_ < var_291_1 + var_291_4 then
				local var_291_5 = (arg_288_1.time_ - var_291_1) / var_291_4
				local var_291_6 = Vector3.New(-389.49, -300, -295)

				var_291_0.localPosition = Vector3.Lerp(arg_288_1.var_.moveOldPos10092, var_291_6, var_291_5)
			end

			if arg_288_1.time_ >= var_291_1 + var_291_4 and arg_288_1.time_ < var_291_1 + var_291_4 + arg_291_0 then
				var_291_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_291_7 = arg_288_1.actors_["10092"]
			local var_291_8 = 0

			if var_291_8 < arg_288_1.time_ and arg_288_1.time_ <= var_291_8 + arg_291_0 and not isNil(var_291_7) and arg_288_1.var_.actorSpriteComps10092 == nil then
				arg_288_1.var_.actorSpriteComps10092 = var_291_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_291_9 = 2

			if var_291_8 <= arg_288_1.time_ and arg_288_1.time_ < var_291_8 + var_291_9 and not isNil(var_291_7) then
				local var_291_10 = (arg_288_1.time_ - var_291_8) / var_291_9

				if arg_288_1.var_.actorSpriteComps10092 then
					for iter_291_1, iter_291_2 in pairs(arg_288_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_291_2 then
							if arg_288_1.isInRecall_ then
								local var_291_11 = Mathf.Lerp(iter_291_2.color.r, arg_288_1.hightColor1.r, var_291_10)
								local var_291_12 = Mathf.Lerp(iter_291_2.color.g, arg_288_1.hightColor1.g, var_291_10)
								local var_291_13 = Mathf.Lerp(iter_291_2.color.b, arg_288_1.hightColor1.b, var_291_10)

								iter_291_2.color = Color.New(var_291_11, var_291_12, var_291_13)
							else
								local var_291_14 = Mathf.Lerp(iter_291_2.color.r, 1, var_291_10)

								iter_291_2.color = Color.New(var_291_14, var_291_14, var_291_14)
							end
						end
					end
				end
			end

			if arg_288_1.time_ >= var_291_8 + var_291_9 and arg_288_1.time_ < var_291_8 + var_291_9 + arg_291_0 and not isNil(var_291_7) and arg_288_1.var_.actorSpriteComps10092 then
				for iter_291_3, iter_291_4 in pairs(arg_288_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_291_4 then
						if arg_288_1.isInRecall_ then
							iter_291_4.color = arg_288_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_291_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_288_1.var_.actorSpriteComps10092 = nil
			end

			local var_291_15 = arg_288_1.actors_["10092"]
			local var_291_16 = 0

			if var_291_16 < arg_288_1.time_ and arg_288_1.time_ <= var_291_16 + arg_291_0 then
				local var_291_17 = var_291_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_291_17 then
					arg_288_1.var_.alphaOldValue10092 = var_291_17.alpha
					arg_288_1.var_.characterEffect10092 = var_291_17
				end

				arg_288_1.var_.alphaOldValue10092 = 0
			end

			local var_291_18 = 0.3

			if var_291_16 <= arg_288_1.time_ and arg_288_1.time_ < var_291_16 + var_291_18 then
				local var_291_19 = (arg_288_1.time_ - var_291_16) / var_291_18
				local var_291_20 = Mathf.Lerp(arg_288_1.var_.alphaOldValue10092, 1, var_291_19)

				if arg_288_1.var_.characterEffect10092 then
					arg_288_1.var_.characterEffect10092.alpha = var_291_20
				end
			end

			if arg_288_1.time_ >= var_291_16 + var_291_18 and arg_288_1.time_ < var_291_16 + var_291_18 + arg_291_0 and arg_288_1.var_.characterEffect10092 then
				arg_288_1.var_.characterEffect10092.alpha = 1
			end

			local var_291_21 = 0
			local var_291_22 = 0.225

			if var_291_21 < arg_288_1.time_ and arg_288_1.time_ <= var_291_21 + arg_291_0 then
				arg_288_1.talkMaxDuration = 0
				arg_288_1.dialogCg_.alpha = 1

				arg_288_1.dialog_:SetActive(true)
				SetActive(arg_288_1.leftNameGo_, true)

				local var_291_23 = arg_288_1:FormatText(StoryNameCfg[996].name)

				arg_288_1.leftNameTxt_.text = var_291_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_288_1.leftNameTxt_.transform)

				arg_288_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_288_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_288_1:RecordName(arg_288_1.leftNameTxt_.text)
				SetActive(arg_288_1.iconTrs_.gameObject, false)
				arg_288_1.callingController_:SetSelectedState("normal")

				local var_291_24 = arg_288_1:GetWordFromCfg(413011069)
				local var_291_25 = arg_288_1:FormatText(var_291_24.content)

				arg_288_1.text_.text = var_291_25

				LuaForUtil.ClearLinePrefixSymbol(arg_288_1.text_)

				local var_291_26 = 9
				local var_291_27 = utf8.len(var_291_25)
				local var_291_28 = var_291_26 <= 0 and var_291_22 or var_291_22 * (var_291_27 / var_291_26)

				if var_291_28 > 0 and var_291_22 < var_291_28 then
					arg_288_1.talkMaxDuration = var_291_28

					if var_291_28 + var_291_21 > arg_288_1.duration_ then
						arg_288_1.duration_ = var_291_28 + var_291_21
					end
				end

				arg_288_1.text_.text = var_291_25
				arg_288_1.typewritter.percent = 0

				arg_288_1.typewritter:SetDirty()
				arg_288_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011069", "story_v_out_413011.awb") ~= 0 then
					local var_291_29 = manager.audio:GetVoiceLength("story_v_out_413011", "413011069", "story_v_out_413011.awb") / 1000

					if var_291_29 + var_291_21 > arg_288_1.duration_ then
						arg_288_1.duration_ = var_291_29 + var_291_21
					end

					if var_291_24.prefab_name ~= "" and arg_288_1.actors_[var_291_24.prefab_name] ~= nil then
						local var_291_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_288_1.actors_[var_291_24.prefab_name].transform, "story_v_out_413011", "413011069", "story_v_out_413011.awb")

						arg_288_1:RecordAudio("413011069", var_291_30)
						arg_288_1:RecordAudio("413011069", var_291_30)
					else
						arg_288_1:AudioAction("play", "voice", "story_v_out_413011", "413011069", "story_v_out_413011.awb")
					end

					arg_288_1:RecordHistoryTalkVoice("story_v_out_413011", "413011069", "story_v_out_413011.awb")
				end

				arg_288_1:RecordContent(arg_288_1.text_.text)
			end

			local var_291_31 = math.max(var_291_22, arg_288_1.talkMaxDuration)

			if var_291_21 <= arg_288_1.time_ and arg_288_1.time_ < var_291_21 + var_291_31 then
				arg_288_1.typewritter.percent = (arg_288_1.time_ - var_291_21) / var_291_31

				arg_288_1.typewritter:SetDirty()
			end

			if arg_288_1.time_ >= var_291_21 + var_291_31 and arg_288_1.time_ < var_291_21 + var_291_31 + arg_291_0 then
				arg_288_1.typewritter.percent = 1

				arg_288_1.typewritter:SetDirty()
				arg_288_1:ShowNextGo(true)
			end
		end
	end,
	Play413011070 = function(arg_292_0, arg_292_1)
		arg_292_1.time_ = 0
		arg_292_1.frameCnt_ = 0
		arg_292_1.state_ = "playing"
		arg_292_1.curTalkId_ = 413011070
		arg_292_1.duration_ = 5.8

		local var_292_0 = {
			zh = 4.633,
			ja = 5.8
		}
		local var_292_1 = manager.audio:GetLocalizationFlag()

		if var_292_0[var_292_1] ~= nil then
			arg_292_1.duration_ = var_292_0[var_292_1]
		end

		SetActive(arg_292_1.tipsGo_, false)

		function arg_292_1.onSingleLineFinish_()
			arg_292_1.onSingleLineUpdate_ = nil
			arg_292_1.onSingleLineFinish_ = nil
			arg_292_1.state_ = "waiting"
		end

		function arg_292_1.playNext_(arg_294_0)
			if arg_294_0 == 1 then
				arg_292_0:Play413011071(arg_292_1)
			end
		end

		function arg_292_1.onSingleLineUpdate_(arg_295_0)
			local var_295_0 = arg_292_1.actors_["10093"].transform
			local var_295_1 = 0

			if var_295_1 < arg_292_1.time_ and arg_292_1.time_ <= var_295_1 + arg_295_0 then
				arg_292_1.var_.moveOldPos10093 = var_295_0.localPosition
				var_295_0.localScale = Vector3.New(1, 1, 1)

				arg_292_1:CheckSpriteTmpPos("10093", 4)

				local var_295_2 = var_295_0.childCount

				for iter_295_0 = 0, var_295_2 - 1 do
					local var_295_3 = var_295_0:GetChild(iter_295_0)

					if var_295_3.name == "split_4" or not string.find(var_295_3.name, "split") then
						var_295_3.gameObject:SetActive(true)
					else
						var_295_3.gameObject:SetActive(false)
					end
				end
			end

			local var_295_4 = 0.001

			if var_295_1 <= arg_292_1.time_ and arg_292_1.time_ < var_295_1 + var_295_4 then
				local var_295_5 = (arg_292_1.time_ - var_295_1) / var_295_4
				local var_295_6 = Vector3.New(390, -345, -245)

				var_295_0.localPosition = Vector3.Lerp(arg_292_1.var_.moveOldPos10093, var_295_6, var_295_5)
			end

			if arg_292_1.time_ >= var_295_1 + var_295_4 and arg_292_1.time_ < var_295_1 + var_295_4 + arg_295_0 then
				var_295_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_295_7 = arg_292_1.actors_["10093"]
			local var_295_8 = 0

			if var_295_8 < arg_292_1.time_ and arg_292_1.time_ <= var_295_8 + arg_295_0 and not isNil(var_295_7) and arg_292_1.var_.actorSpriteComps10093 == nil then
				arg_292_1.var_.actorSpriteComps10093 = var_295_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_295_9 = 2

			if var_295_8 <= arg_292_1.time_ and arg_292_1.time_ < var_295_8 + var_295_9 and not isNil(var_295_7) then
				local var_295_10 = (arg_292_1.time_ - var_295_8) / var_295_9

				if arg_292_1.var_.actorSpriteComps10093 then
					for iter_295_1, iter_295_2 in pairs(arg_292_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_295_2 then
							if arg_292_1.isInRecall_ then
								local var_295_11 = Mathf.Lerp(iter_295_2.color.r, arg_292_1.hightColor1.r, var_295_10)
								local var_295_12 = Mathf.Lerp(iter_295_2.color.g, arg_292_1.hightColor1.g, var_295_10)
								local var_295_13 = Mathf.Lerp(iter_295_2.color.b, arg_292_1.hightColor1.b, var_295_10)

								iter_295_2.color = Color.New(var_295_11, var_295_12, var_295_13)
							else
								local var_295_14 = Mathf.Lerp(iter_295_2.color.r, 1, var_295_10)

								iter_295_2.color = Color.New(var_295_14, var_295_14, var_295_14)
							end
						end
					end
				end
			end

			if arg_292_1.time_ >= var_295_8 + var_295_9 and arg_292_1.time_ < var_295_8 + var_295_9 + arg_295_0 and not isNil(var_295_7) and arg_292_1.var_.actorSpriteComps10093 then
				for iter_295_3, iter_295_4 in pairs(arg_292_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_295_4 then
						if arg_292_1.isInRecall_ then
							iter_295_4.color = arg_292_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_295_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_292_1.var_.actorSpriteComps10093 = nil
			end

			local var_295_15 = arg_292_1.actors_["10092"]
			local var_295_16 = 0

			if var_295_16 < arg_292_1.time_ and arg_292_1.time_ <= var_295_16 + arg_295_0 and not isNil(var_295_15) and arg_292_1.var_.actorSpriteComps10092 == nil then
				arg_292_1.var_.actorSpriteComps10092 = var_295_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_295_17 = 2

			if var_295_16 <= arg_292_1.time_ and arg_292_1.time_ < var_295_16 + var_295_17 and not isNil(var_295_15) then
				local var_295_18 = (arg_292_1.time_ - var_295_16) / var_295_17

				if arg_292_1.var_.actorSpriteComps10092 then
					for iter_295_5, iter_295_6 in pairs(arg_292_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_295_6 then
							if arg_292_1.isInRecall_ then
								local var_295_19 = Mathf.Lerp(iter_295_6.color.r, arg_292_1.hightColor2.r, var_295_18)
								local var_295_20 = Mathf.Lerp(iter_295_6.color.g, arg_292_1.hightColor2.g, var_295_18)
								local var_295_21 = Mathf.Lerp(iter_295_6.color.b, arg_292_1.hightColor2.b, var_295_18)

								iter_295_6.color = Color.New(var_295_19, var_295_20, var_295_21)
							else
								local var_295_22 = Mathf.Lerp(iter_295_6.color.r, 0.5, var_295_18)

								iter_295_6.color = Color.New(var_295_22, var_295_22, var_295_22)
							end
						end
					end
				end
			end

			if arg_292_1.time_ >= var_295_16 + var_295_17 and arg_292_1.time_ < var_295_16 + var_295_17 + arg_295_0 and not isNil(var_295_15) and arg_292_1.var_.actorSpriteComps10092 then
				for iter_295_7, iter_295_8 in pairs(arg_292_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_295_8 then
						if arg_292_1.isInRecall_ then
							iter_295_8.color = arg_292_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_295_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_292_1.var_.actorSpriteComps10092 = nil
			end

			local var_295_23 = arg_292_1.actors_["10093"]
			local var_295_24 = 0

			if var_295_24 < arg_292_1.time_ and arg_292_1.time_ <= var_295_24 + arg_295_0 then
				local var_295_25 = var_295_23:GetComponentInChildren(typeof(CanvasGroup))

				if var_295_25 then
					arg_292_1.var_.alphaOldValue10093 = var_295_25.alpha
					arg_292_1.var_.characterEffect10093 = var_295_25
				end

				arg_292_1.var_.alphaOldValue10093 = 0
			end

			local var_295_26 = 0.3

			if var_295_24 <= arg_292_1.time_ and arg_292_1.time_ < var_295_24 + var_295_26 then
				local var_295_27 = (arg_292_1.time_ - var_295_24) / var_295_26
				local var_295_28 = Mathf.Lerp(arg_292_1.var_.alphaOldValue10093, 1, var_295_27)

				if arg_292_1.var_.characterEffect10093 then
					arg_292_1.var_.characterEffect10093.alpha = var_295_28
				end
			end

			if arg_292_1.time_ >= var_295_24 + var_295_26 and arg_292_1.time_ < var_295_24 + var_295_26 + arg_295_0 and arg_292_1.var_.characterEffect10093 then
				arg_292_1.var_.characterEffect10093.alpha = 1
			end

			local var_295_29 = 0
			local var_295_30 = 0.425

			if var_295_29 < arg_292_1.time_ and arg_292_1.time_ <= var_295_29 + arg_295_0 then
				arg_292_1.talkMaxDuration = 0
				arg_292_1.dialogCg_.alpha = 1

				arg_292_1.dialog_:SetActive(true)
				SetActive(arg_292_1.leftNameGo_, true)

				local var_295_31 = arg_292_1:FormatText(StoryNameCfg[28].name)

				arg_292_1.leftNameTxt_.text = var_295_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_292_1.leftNameTxt_.transform)

				arg_292_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_292_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_292_1:RecordName(arg_292_1.leftNameTxt_.text)
				SetActive(arg_292_1.iconTrs_.gameObject, false)
				arg_292_1.callingController_:SetSelectedState("normal")

				local var_295_32 = arg_292_1:GetWordFromCfg(413011070)
				local var_295_33 = arg_292_1:FormatText(var_295_32.content)

				arg_292_1.text_.text = var_295_33

				LuaForUtil.ClearLinePrefixSymbol(arg_292_1.text_)

				local var_295_34 = 17
				local var_295_35 = utf8.len(var_295_33)
				local var_295_36 = var_295_34 <= 0 and var_295_30 or var_295_30 * (var_295_35 / var_295_34)

				if var_295_36 > 0 and var_295_30 < var_295_36 then
					arg_292_1.talkMaxDuration = var_295_36

					if var_295_36 + var_295_29 > arg_292_1.duration_ then
						arg_292_1.duration_ = var_295_36 + var_295_29
					end
				end

				arg_292_1.text_.text = var_295_33
				arg_292_1.typewritter.percent = 0

				arg_292_1.typewritter:SetDirty()
				arg_292_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011070", "story_v_out_413011.awb") ~= 0 then
					local var_295_37 = manager.audio:GetVoiceLength("story_v_out_413011", "413011070", "story_v_out_413011.awb") / 1000

					if var_295_37 + var_295_29 > arg_292_1.duration_ then
						arg_292_1.duration_ = var_295_37 + var_295_29
					end

					if var_295_32.prefab_name ~= "" and arg_292_1.actors_[var_295_32.prefab_name] ~= nil then
						local var_295_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_292_1.actors_[var_295_32.prefab_name].transform, "story_v_out_413011", "413011070", "story_v_out_413011.awb")

						arg_292_1:RecordAudio("413011070", var_295_38)
						arg_292_1:RecordAudio("413011070", var_295_38)
					else
						arg_292_1:AudioAction("play", "voice", "story_v_out_413011", "413011070", "story_v_out_413011.awb")
					end

					arg_292_1:RecordHistoryTalkVoice("story_v_out_413011", "413011070", "story_v_out_413011.awb")
				end

				arg_292_1:RecordContent(arg_292_1.text_.text)
			end

			local var_295_39 = math.max(var_295_30, arg_292_1.talkMaxDuration)

			if var_295_29 <= arg_292_1.time_ and arg_292_1.time_ < var_295_29 + var_295_39 then
				arg_292_1.typewritter.percent = (arg_292_1.time_ - var_295_29) / var_295_39

				arg_292_1.typewritter:SetDirty()
			end

			if arg_292_1.time_ >= var_295_29 + var_295_39 and arg_292_1.time_ < var_295_29 + var_295_39 + arg_295_0 then
				arg_292_1.typewritter.percent = 1

				arg_292_1.typewritter:SetDirty()
				arg_292_1:ShowNextGo(true)
			end
		end
	end,
	Play413011071 = function(arg_296_0, arg_296_1)
		arg_296_1.time_ = 0
		arg_296_1.frameCnt_ = 0
		arg_296_1.state_ = "playing"
		arg_296_1.curTalkId_ = 413011071
		arg_296_1.duration_ = 11.37

		local var_296_0 = {
			zh = 5.833,
			ja = 11.366
		}
		local var_296_1 = manager.audio:GetLocalizationFlag()

		if var_296_0[var_296_1] ~= nil then
			arg_296_1.duration_ = var_296_0[var_296_1]
		end

		SetActive(arg_296_1.tipsGo_, false)

		function arg_296_1.onSingleLineFinish_()
			arg_296_1.onSingleLineUpdate_ = nil
			arg_296_1.onSingleLineFinish_ = nil
			arg_296_1.state_ = "waiting"
		end

		function arg_296_1.playNext_(arg_298_0)
			if arg_298_0 == 1 then
				arg_296_0:Play413011072(arg_296_1)
			end
		end

		function arg_296_1.onSingleLineUpdate_(arg_299_0)
			local var_299_0 = arg_296_1.actors_["10093"]
			local var_299_1 = 0

			if var_299_1 < arg_296_1.time_ and arg_296_1.time_ <= var_299_1 + arg_299_0 and not isNil(var_299_0) and arg_296_1.var_.actorSpriteComps10093 == nil then
				arg_296_1.var_.actorSpriteComps10093 = var_299_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_299_2 = 2

			if var_299_1 <= arg_296_1.time_ and arg_296_1.time_ < var_299_1 + var_299_2 and not isNil(var_299_0) then
				local var_299_3 = (arg_296_1.time_ - var_299_1) / var_299_2

				if arg_296_1.var_.actorSpriteComps10093 then
					for iter_299_0, iter_299_1 in pairs(arg_296_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_299_1 then
							if arg_296_1.isInRecall_ then
								local var_299_4 = Mathf.Lerp(iter_299_1.color.r, arg_296_1.hightColor2.r, var_299_3)
								local var_299_5 = Mathf.Lerp(iter_299_1.color.g, arg_296_1.hightColor2.g, var_299_3)
								local var_299_6 = Mathf.Lerp(iter_299_1.color.b, arg_296_1.hightColor2.b, var_299_3)

								iter_299_1.color = Color.New(var_299_4, var_299_5, var_299_6)
							else
								local var_299_7 = Mathf.Lerp(iter_299_1.color.r, 0.5, var_299_3)

								iter_299_1.color = Color.New(var_299_7, var_299_7, var_299_7)
							end
						end
					end
				end
			end

			if arg_296_1.time_ >= var_299_1 + var_299_2 and arg_296_1.time_ < var_299_1 + var_299_2 + arg_299_0 and not isNil(var_299_0) and arg_296_1.var_.actorSpriteComps10093 then
				for iter_299_2, iter_299_3 in pairs(arg_296_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_299_3 then
						if arg_296_1.isInRecall_ then
							iter_299_3.color = arg_296_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_299_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_296_1.var_.actorSpriteComps10093 = nil
			end

			local var_299_8 = arg_296_1.actors_["10092"]
			local var_299_9 = 0

			if var_299_9 < arg_296_1.time_ and arg_296_1.time_ <= var_299_9 + arg_299_0 and not isNil(var_299_8) and arg_296_1.var_.actorSpriteComps10092 == nil then
				arg_296_1.var_.actorSpriteComps10092 = var_299_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_299_10 = 2

			if var_299_9 <= arg_296_1.time_ and arg_296_1.time_ < var_299_9 + var_299_10 and not isNil(var_299_8) then
				local var_299_11 = (arg_296_1.time_ - var_299_9) / var_299_10

				if arg_296_1.var_.actorSpriteComps10092 then
					for iter_299_4, iter_299_5 in pairs(arg_296_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_299_5 then
							if arg_296_1.isInRecall_ then
								local var_299_12 = Mathf.Lerp(iter_299_5.color.r, arg_296_1.hightColor1.r, var_299_11)
								local var_299_13 = Mathf.Lerp(iter_299_5.color.g, arg_296_1.hightColor1.g, var_299_11)
								local var_299_14 = Mathf.Lerp(iter_299_5.color.b, arg_296_1.hightColor1.b, var_299_11)

								iter_299_5.color = Color.New(var_299_12, var_299_13, var_299_14)
							else
								local var_299_15 = Mathf.Lerp(iter_299_5.color.r, 1, var_299_11)

								iter_299_5.color = Color.New(var_299_15, var_299_15, var_299_15)
							end
						end
					end
				end
			end

			if arg_296_1.time_ >= var_299_9 + var_299_10 and arg_296_1.time_ < var_299_9 + var_299_10 + arg_299_0 and not isNil(var_299_8) and arg_296_1.var_.actorSpriteComps10092 then
				for iter_299_6, iter_299_7 in pairs(arg_296_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_299_7 then
						if arg_296_1.isInRecall_ then
							iter_299_7.color = arg_296_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_299_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_296_1.var_.actorSpriteComps10092 = nil
			end

			local var_299_16 = 0
			local var_299_17 = 0.65

			if var_299_16 < arg_296_1.time_ and arg_296_1.time_ <= var_299_16 + arg_299_0 then
				arg_296_1.talkMaxDuration = 0
				arg_296_1.dialogCg_.alpha = 1

				arg_296_1.dialog_:SetActive(true)
				SetActive(arg_296_1.leftNameGo_, true)

				local var_299_18 = arg_296_1:FormatText(StoryNameCfg[996].name)

				arg_296_1.leftNameTxt_.text = var_299_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_296_1.leftNameTxt_.transform)

				arg_296_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_296_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_296_1:RecordName(arg_296_1.leftNameTxt_.text)
				SetActive(arg_296_1.iconTrs_.gameObject, false)
				arg_296_1.callingController_:SetSelectedState("normal")

				local var_299_19 = arg_296_1:GetWordFromCfg(413011071)
				local var_299_20 = arg_296_1:FormatText(var_299_19.content)

				arg_296_1.text_.text = var_299_20

				LuaForUtil.ClearLinePrefixSymbol(arg_296_1.text_)

				local var_299_21 = 26
				local var_299_22 = utf8.len(var_299_20)
				local var_299_23 = var_299_21 <= 0 and var_299_17 or var_299_17 * (var_299_22 / var_299_21)

				if var_299_23 > 0 and var_299_17 < var_299_23 then
					arg_296_1.talkMaxDuration = var_299_23

					if var_299_23 + var_299_16 > arg_296_1.duration_ then
						arg_296_1.duration_ = var_299_23 + var_299_16
					end
				end

				arg_296_1.text_.text = var_299_20
				arg_296_1.typewritter.percent = 0

				arg_296_1.typewritter:SetDirty()
				arg_296_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011071", "story_v_out_413011.awb") ~= 0 then
					local var_299_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011071", "story_v_out_413011.awb") / 1000

					if var_299_24 + var_299_16 > arg_296_1.duration_ then
						arg_296_1.duration_ = var_299_24 + var_299_16
					end

					if var_299_19.prefab_name ~= "" and arg_296_1.actors_[var_299_19.prefab_name] ~= nil then
						local var_299_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_296_1.actors_[var_299_19.prefab_name].transform, "story_v_out_413011", "413011071", "story_v_out_413011.awb")

						arg_296_1:RecordAudio("413011071", var_299_25)
						arg_296_1:RecordAudio("413011071", var_299_25)
					else
						arg_296_1:AudioAction("play", "voice", "story_v_out_413011", "413011071", "story_v_out_413011.awb")
					end

					arg_296_1:RecordHistoryTalkVoice("story_v_out_413011", "413011071", "story_v_out_413011.awb")
				end

				arg_296_1:RecordContent(arg_296_1.text_.text)
			end

			local var_299_26 = math.max(var_299_17, arg_296_1.talkMaxDuration)

			if var_299_16 <= arg_296_1.time_ and arg_296_1.time_ < var_299_16 + var_299_26 then
				arg_296_1.typewritter.percent = (arg_296_1.time_ - var_299_16) / var_299_26

				arg_296_1.typewritter:SetDirty()
			end

			if arg_296_1.time_ >= var_299_16 + var_299_26 and arg_296_1.time_ < var_299_16 + var_299_26 + arg_299_0 then
				arg_296_1.typewritter.percent = 1

				arg_296_1.typewritter:SetDirty()
				arg_296_1:ShowNextGo(true)
			end
		end
	end,
	Play413011072 = function(arg_300_0, arg_300_1)
		arg_300_1.time_ = 0
		arg_300_1.frameCnt_ = 0
		arg_300_1.state_ = "playing"
		arg_300_1.curTalkId_ = 413011072
		arg_300_1.duration_ = 9.97

		local var_300_0 = {
			zh = 6.766,
			ja = 9.966
		}
		local var_300_1 = manager.audio:GetLocalizationFlag()

		if var_300_0[var_300_1] ~= nil then
			arg_300_1.duration_ = var_300_0[var_300_1]
		end

		SetActive(arg_300_1.tipsGo_, false)

		function arg_300_1.onSingleLineFinish_()
			arg_300_1.onSingleLineUpdate_ = nil
			arg_300_1.onSingleLineFinish_ = nil
			arg_300_1.state_ = "waiting"
		end

		function arg_300_1.playNext_(arg_302_0)
			if arg_302_0 == 1 then
				arg_300_0:Play413011073(arg_300_1)
			end
		end

		function arg_300_1.onSingleLineUpdate_(arg_303_0)
			local var_303_0 = arg_300_1.actors_["10092"].transform
			local var_303_1 = 0

			if var_303_1 < arg_300_1.time_ and arg_300_1.time_ <= var_303_1 + arg_303_0 then
				arg_300_1.var_.moveOldPos10092 = var_303_0.localPosition
				var_303_0.localScale = Vector3.New(1, 1, 1)

				arg_300_1:CheckSpriteTmpPos("10092", 2)

				local var_303_2 = var_303_0.childCount

				for iter_303_0 = 0, var_303_2 - 1 do
					local var_303_3 = var_303_0:GetChild(iter_303_0)

					if var_303_3.name == "split_2" or not string.find(var_303_3.name, "split") then
						var_303_3.gameObject:SetActive(true)
					else
						var_303_3.gameObject:SetActive(false)
					end
				end
			end

			local var_303_4 = 0.001

			if var_303_1 <= arg_300_1.time_ and arg_300_1.time_ < var_303_1 + var_303_4 then
				local var_303_5 = (arg_300_1.time_ - var_303_1) / var_303_4
				local var_303_6 = Vector3.New(-389.49, -300, -295)

				var_303_0.localPosition = Vector3.Lerp(arg_300_1.var_.moveOldPos10092, var_303_6, var_303_5)
			end

			if arg_300_1.time_ >= var_303_1 + var_303_4 and arg_300_1.time_ < var_303_1 + var_303_4 + arg_303_0 then
				var_303_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_303_7 = 0
			local var_303_8 = 0.725

			if var_303_7 < arg_300_1.time_ and arg_300_1.time_ <= var_303_7 + arg_303_0 then
				arg_300_1.talkMaxDuration = 0
				arg_300_1.dialogCg_.alpha = 1

				arg_300_1.dialog_:SetActive(true)
				SetActive(arg_300_1.leftNameGo_, true)

				local var_303_9 = arg_300_1:FormatText(StoryNameCfg[996].name)

				arg_300_1.leftNameTxt_.text = var_303_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_300_1.leftNameTxt_.transform)

				arg_300_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_300_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_300_1:RecordName(arg_300_1.leftNameTxt_.text)
				SetActive(arg_300_1.iconTrs_.gameObject, false)
				arg_300_1.callingController_:SetSelectedState("normal")

				local var_303_10 = arg_300_1:GetWordFromCfg(413011072)
				local var_303_11 = arg_300_1:FormatText(var_303_10.content)

				arg_300_1.text_.text = var_303_11

				LuaForUtil.ClearLinePrefixSymbol(arg_300_1.text_)

				local var_303_12 = 29
				local var_303_13 = utf8.len(var_303_11)
				local var_303_14 = var_303_12 <= 0 and var_303_8 or var_303_8 * (var_303_13 / var_303_12)

				if var_303_14 > 0 and var_303_8 < var_303_14 then
					arg_300_1.talkMaxDuration = var_303_14

					if var_303_14 + var_303_7 > arg_300_1.duration_ then
						arg_300_1.duration_ = var_303_14 + var_303_7
					end
				end

				arg_300_1.text_.text = var_303_11
				arg_300_1.typewritter.percent = 0

				arg_300_1.typewritter:SetDirty()
				arg_300_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011072", "story_v_out_413011.awb") ~= 0 then
					local var_303_15 = manager.audio:GetVoiceLength("story_v_out_413011", "413011072", "story_v_out_413011.awb") / 1000

					if var_303_15 + var_303_7 > arg_300_1.duration_ then
						arg_300_1.duration_ = var_303_15 + var_303_7
					end

					if var_303_10.prefab_name ~= "" and arg_300_1.actors_[var_303_10.prefab_name] ~= nil then
						local var_303_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_300_1.actors_[var_303_10.prefab_name].transform, "story_v_out_413011", "413011072", "story_v_out_413011.awb")

						arg_300_1:RecordAudio("413011072", var_303_16)
						arg_300_1:RecordAudio("413011072", var_303_16)
					else
						arg_300_1:AudioAction("play", "voice", "story_v_out_413011", "413011072", "story_v_out_413011.awb")
					end

					arg_300_1:RecordHistoryTalkVoice("story_v_out_413011", "413011072", "story_v_out_413011.awb")
				end

				arg_300_1:RecordContent(arg_300_1.text_.text)
			end

			local var_303_17 = math.max(var_303_8, arg_300_1.talkMaxDuration)

			if var_303_7 <= arg_300_1.time_ and arg_300_1.time_ < var_303_7 + var_303_17 then
				arg_300_1.typewritter.percent = (arg_300_1.time_ - var_303_7) / var_303_17

				arg_300_1.typewritter:SetDirty()
			end

			if arg_300_1.time_ >= var_303_7 + var_303_17 and arg_300_1.time_ < var_303_7 + var_303_17 + arg_303_0 then
				arg_300_1.typewritter.percent = 1

				arg_300_1.typewritter:SetDirty()
				arg_300_1:ShowNextGo(true)
			end
		end
	end,
	Play413011073 = function(arg_304_0, arg_304_1)
		arg_304_1.time_ = 0
		arg_304_1.frameCnt_ = 0
		arg_304_1.state_ = "playing"
		arg_304_1.curTalkId_ = 413011073
		arg_304_1.duration_ = 6.4

		local var_304_0 = {
			zh = 4.8,
			ja = 6.4
		}
		local var_304_1 = manager.audio:GetLocalizationFlag()

		if var_304_0[var_304_1] ~= nil then
			arg_304_1.duration_ = var_304_0[var_304_1]
		end

		SetActive(arg_304_1.tipsGo_, false)

		function arg_304_1.onSingleLineFinish_()
			arg_304_1.onSingleLineUpdate_ = nil
			arg_304_1.onSingleLineFinish_ = nil
			arg_304_1.state_ = "waiting"
		end

		function arg_304_1.playNext_(arg_306_0)
			if arg_306_0 == 1 then
				arg_304_0:Play413011074(arg_304_1)
			end
		end

		function arg_304_1.onSingleLineUpdate_(arg_307_0)
			local var_307_0 = arg_304_1.actors_["10093"]
			local var_307_1 = 0

			if var_307_1 < arg_304_1.time_ and arg_304_1.time_ <= var_307_1 + arg_307_0 and not isNil(var_307_0) and arg_304_1.var_.actorSpriteComps10093 == nil then
				arg_304_1.var_.actorSpriteComps10093 = var_307_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_307_2 = 2

			if var_307_1 <= arg_304_1.time_ and arg_304_1.time_ < var_307_1 + var_307_2 and not isNil(var_307_0) then
				local var_307_3 = (arg_304_1.time_ - var_307_1) / var_307_2

				if arg_304_1.var_.actorSpriteComps10093 then
					for iter_307_0, iter_307_1 in pairs(arg_304_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_307_1 then
							if arg_304_1.isInRecall_ then
								local var_307_4 = Mathf.Lerp(iter_307_1.color.r, arg_304_1.hightColor1.r, var_307_3)
								local var_307_5 = Mathf.Lerp(iter_307_1.color.g, arg_304_1.hightColor1.g, var_307_3)
								local var_307_6 = Mathf.Lerp(iter_307_1.color.b, arg_304_1.hightColor1.b, var_307_3)

								iter_307_1.color = Color.New(var_307_4, var_307_5, var_307_6)
							else
								local var_307_7 = Mathf.Lerp(iter_307_1.color.r, 1, var_307_3)

								iter_307_1.color = Color.New(var_307_7, var_307_7, var_307_7)
							end
						end
					end
				end
			end

			if arg_304_1.time_ >= var_307_1 + var_307_2 and arg_304_1.time_ < var_307_1 + var_307_2 + arg_307_0 and not isNil(var_307_0) and arg_304_1.var_.actorSpriteComps10093 then
				for iter_307_2, iter_307_3 in pairs(arg_304_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_307_3 then
						if arg_304_1.isInRecall_ then
							iter_307_3.color = arg_304_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_307_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_304_1.var_.actorSpriteComps10093 = nil
			end

			local var_307_8 = arg_304_1.actors_["10092"]
			local var_307_9 = 0

			if var_307_9 < arg_304_1.time_ and arg_304_1.time_ <= var_307_9 + arg_307_0 and not isNil(var_307_8) and arg_304_1.var_.actorSpriteComps10092 == nil then
				arg_304_1.var_.actorSpriteComps10092 = var_307_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_307_10 = 2

			if var_307_9 <= arg_304_1.time_ and arg_304_1.time_ < var_307_9 + var_307_10 and not isNil(var_307_8) then
				local var_307_11 = (arg_304_1.time_ - var_307_9) / var_307_10

				if arg_304_1.var_.actorSpriteComps10092 then
					for iter_307_4, iter_307_5 in pairs(arg_304_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_307_5 then
							if arg_304_1.isInRecall_ then
								local var_307_12 = Mathf.Lerp(iter_307_5.color.r, arg_304_1.hightColor2.r, var_307_11)
								local var_307_13 = Mathf.Lerp(iter_307_5.color.g, arg_304_1.hightColor2.g, var_307_11)
								local var_307_14 = Mathf.Lerp(iter_307_5.color.b, arg_304_1.hightColor2.b, var_307_11)

								iter_307_5.color = Color.New(var_307_12, var_307_13, var_307_14)
							else
								local var_307_15 = Mathf.Lerp(iter_307_5.color.r, 0.5, var_307_11)

								iter_307_5.color = Color.New(var_307_15, var_307_15, var_307_15)
							end
						end
					end
				end
			end

			if arg_304_1.time_ >= var_307_9 + var_307_10 and arg_304_1.time_ < var_307_9 + var_307_10 + arg_307_0 and not isNil(var_307_8) and arg_304_1.var_.actorSpriteComps10092 then
				for iter_307_6, iter_307_7 in pairs(arg_304_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_307_7 then
						if arg_304_1.isInRecall_ then
							iter_307_7.color = arg_304_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_307_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_304_1.var_.actorSpriteComps10092 = nil
			end

			local var_307_16 = 0
			local var_307_17 = 0.575

			if var_307_16 < arg_304_1.time_ and arg_304_1.time_ <= var_307_16 + arg_307_0 then
				arg_304_1.talkMaxDuration = 0
				arg_304_1.dialogCg_.alpha = 1

				arg_304_1.dialog_:SetActive(true)
				SetActive(arg_304_1.leftNameGo_, true)

				local var_307_18 = arg_304_1:FormatText(StoryNameCfg[28].name)

				arg_304_1.leftNameTxt_.text = var_307_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_304_1.leftNameTxt_.transform)

				arg_304_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_304_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_304_1:RecordName(arg_304_1.leftNameTxt_.text)
				SetActive(arg_304_1.iconTrs_.gameObject, false)
				arg_304_1.callingController_:SetSelectedState("normal")

				local var_307_19 = arg_304_1:GetWordFromCfg(413011073)
				local var_307_20 = arg_304_1:FormatText(var_307_19.content)

				arg_304_1.text_.text = var_307_20

				LuaForUtil.ClearLinePrefixSymbol(arg_304_1.text_)

				local var_307_21 = 23
				local var_307_22 = utf8.len(var_307_20)
				local var_307_23 = var_307_21 <= 0 and var_307_17 or var_307_17 * (var_307_22 / var_307_21)

				if var_307_23 > 0 and var_307_17 < var_307_23 then
					arg_304_1.talkMaxDuration = var_307_23

					if var_307_23 + var_307_16 > arg_304_1.duration_ then
						arg_304_1.duration_ = var_307_23 + var_307_16
					end
				end

				arg_304_1.text_.text = var_307_20
				arg_304_1.typewritter.percent = 0

				arg_304_1.typewritter:SetDirty()
				arg_304_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011073", "story_v_out_413011.awb") ~= 0 then
					local var_307_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011073", "story_v_out_413011.awb") / 1000

					if var_307_24 + var_307_16 > arg_304_1.duration_ then
						arg_304_1.duration_ = var_307_24 + var_307_16
					end

					if var_307_19.prefab_name ~= "" and arg_304_1.actors_[var_307_19.prefab_name] ~= nil then
						local var_307_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_304_1.actors_[var_307_19.prefab_name].transform, "story_v_out_413011", "413011073", "story_v_out_413011.awb")

						arg_304_1:RecordAudio("413011073", var_307_25)
						arg_304_1:RecordAudio("413011073", var_307_25)
					else
						arg_304_1:AudioAction("play", "voice", "story_v_out_413011", "413011073", "story_v_out_413011.awb")
					end

					arg_304_1:RecordHistoryTalkVoice("story_v_out_413011", "413011073", "story_v_out_413011.awb")
				end

				arg_304_1:RecordContent(arg_304_1.text_.text)
			end

			local var_307_26 = math.max(var_307_17, arg_304_1.talkMaxDuration)

			if var_307_16 <= arg_304_1.time_ and arg_304_1.time_ < var_307_16 + var_307_26 then
				arg_304_1.typewritter.percent = (arg_304_1.time_ - var_307_16) / var_307_26

				arg_304_1.typewritter:SetDirty()
			end

			if arg_304_1.time_ >= var_307_16 + var_307_26 and arg_304_1.time_ < var_307_16 + var_307_26 + arg_307_0 then
				arg_304_1.typewritter.percent = 1

				arg_304_1.typewritter:SetDirty()
				arg_304_1:ShowNextGo(true)
			end
		end
	end,
	Play413011074 = function(arg_308_0, arg_308_1)
		arg_308_1.time_ = 0
		arg_308_1.frameCnt_ = 0
		arg_308_1.state_ = "playing"
		arg_308_1.curTalkId_ = 413011074
		arg_308_1.duration_ = 10.5

		local var_308_0 = {
			zh = 5.7,
			ja = 10.5
		}
		local var_308_1 = manager.audio:GetLocalizationFlag()

		if var_308_0[var_308_1] ~= nil then
			arg_308_1.duration_ = var_308_0[var_308_1]
		end

		SetActive(arg_308_1.tipsGo_, false)

		function arg_308_1.onSingleLineFinish_()
			arg_308_1.onSingleLineUpdate_ = nil
			arg_308_1.onSingleLineFinish_ = nil
			arg_308_1.state_ = "waiting"
		end

		function arg_308_1.playNext_(arg_310_0)
			if arg_310_0 == 1 then
				arg_308_0:Play413011075(arg_308_1)
			end
		end

		function arg_308_1.onSingleLineUpdate_(arg_311_0)
			local var_311_0 = arg_308_1.actors_["10093"]
			local var_311_1 = 0

			if var_311_1 < arg_308_1.time_ and arg_308_1.time_ <= var_311_1 + arg_311_0 and not isNil(var_311_0) and arg_308_1.var_.actorSpriteComps10093 == nil then
				arg_308_1.var_.actorSpriteComps10093 = var_311_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_311_2 = 2

			if var_311_1 <= arg_308_1.time_ and arg_308_1.time_ < var_311_1 + var_311_2 and not isNil(var_311_0) then
				local var_311_3 = (arg_308_1.time_ - var_311_1) / var_311_2

				if arg_308_1.var_.actorSpriteComps10093 then
					for iter_311_0, iter_311_1 in pairs(arg_308_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_311_1 then
							if arg_308_1.isInRecall_ then
								local var_311_4 = Mathf.Lerp(iter_311_1.color.r, arg_308_1.hightColor2.r, var_311_3)
								local var_311_5 = Mathf.Lerp(iter_311_1.color.g, arg_308_1.hightColor2.g, var_311_3)
								local var_311_6 = Mathf.Lerp(iter_311_1.color.b, arg_308_1.hightColor2.b, var_311_3)

								iter_311_1.color = Color.New(var_311_4, var_311_5, var_311_6)
							else
								local var_311_7 = Mathf.Lerp(iter_311_1.color.r, 0.5, var_311_3)

								iter_311_1.color = Color.New(var_311_7, var_311_7, var_311_7)
							end
						end
					end
				end
			end

			if arg_308_1.time_ >= var_311_1 + var_311_2 and arg_308_1.time_ < var_311_1 + var_311_2 + arg_311_0 and not isNil(var_311_0) and arg_308_1.var_.actorSpriteComps10093 then
				for iter_311_2, iter_311_3 in pairs(arg_308_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_311_3 then
						if arg_308_1.isInRecall_ then
							iter_311_3.color = arg_308_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_311_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_308_1.var_.actorSpriteComps10093 = nil
			end

			local var_311_8 = arg_308_1.actors_["10092"]
			local var_311_9 = 0

			if var_311_9 < arg_308_1.time_ and arg_308_1.time_ <= var_311_9 + arg_311_0 and not isNil(var_311_8) and arg_308_1.var_.actorSpriteComps10092 == nil then
				arg_308_1.var_.actorSpriteComps10092 = var_311_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_311_10 = 2

			if var_311_9 <= arg_308_1.time_ and arg_308_1.time_ < var_311_9 + var_311_10 and not isNil(var_311_8) then
				local var_311_11 = (arg_308_1.time_ - var_311_9) / var_311_10

				if arg_308_1.var_.actorSpriteComps10092 then
					for iter_311_4, iter_311_5 in pairs(arg_308_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_311_5 then
							if arg_308_1.isInRecall_ then
								local var_311_12 = Mathf.Lerp(iter_311_5.color.r, arg_308_1.hightColor1.r, var_311_11)
								local var_311_13 = Mathf.Lerp(iter_311_5.color.g, arg_308_1.hightColor1.g, var_311_11)
								local var_311_14 = Mathf.Lerp(iter_311_5.color.b, arg_308_1.hightColor1.b, var_311_11)

								iter_311_5.color = Color.New(var_311_12, var_311_13, var_311_14)
							else
								local var_311_15 = Mathf.Lerp(iter_311_5.color.r, 1, var_311_11)

								iter_311_5.color = Color.New(var_311_15, var_311_15, var_311_15)
							end
						end
					end
				end
			end

			if arg_308_1.time_ >= var_311_9 + var_311_10 and arg_308_1.time_ < var_311_9 + var_311_10 + arg_311_0 and not isNil(var_311_8) and arg_308_1.var_.actorSpriteComps10092 then
				for iter_311_6, iter_311_7 in pairs(arg_308_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_311_7 then
						if arg_308_1.isInRecall_ then
							iter_311_7.color = arg_308_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_311_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_308_1.var_.actorSpriteComps10092 = nil
			end

			local var_311_16 = arg_308_1.actors_["10092"].transform
			local var_311_17 = 0

			if var_311_17 < arg_308_1.time_ and arg_308_1.time_ <= var_311_17 + arg_311_0 then
				arg_308_1.var_.moveOldPos10092 = var_311_16.localPosition
				var_311_16.localScale = Vector3.New(1, 1, 1)

				arg_308_1:CheckSpriteTmpPos("10092", 2)

				local var_311_18 = var_311_16.childCount

				for iter_311_8 = 0, var_311_18 - 1 do
					local var_311_19 = var_311_16:GetChild(iter_311_8)

					if var_311_19.name == "split_1_1" or not string.find(var_311_19.name, "split") then
						var_311_19.gameObject:SetActive(true)
					else
						var_311_19.gameObject:SetActive(false)
					end
				end
			end

			local var_311_20 = 0.001

			if var_311_17 <= arg_308_1.time_ and arg_308_1.time_ < var_311_17 + var_311_20 then
				local var_311_21 = (arg_308_1.time_ - var_311_17) / var_311_20
				local var_311_22 = Vector3.New(-389.49, -300, -295)

				var_311_16.localPosition = Vector3.Lerp(arg_308_1.var_.moveOldPos10092, var_311_22, var_311_21)
			end

			if arg_308_1.time_ >= var_311_17 + var_311_20 and arg_308_1.time_ < var_311_17 + var_311_20 + arg_311_0 then
				var_311_16.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_311_23 = 0
			local var_311_24 = 0.675

			if var_311_23 < arg_308_1.time_ and arg_308_1.time_ <= var_311_23 + arg_311_0 then
				arg_308_1.talkMaxDuration = 0
				arg_308_1.dialogCg_.alpha = 1

				arg_308_1.dialog_:SetActive(true)
				SetActive(arg_308_1.leftNameGo_, true)

				local var_311_25 = arg_308_1:FormatText(StoryNameCfg[996].name)

				arg_308_1.leftNameTxt_.text = var_311_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_308_1.leftNameTxt_.transform)

				arg_308_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_308_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_308_1:RecordName(arg_308_1.leftNameTxt_.text)
				SetActive(arg_308_1.iconTrs_.gameObject, false)
				arg_308_1.callingController_:SetSelectedState("normal")

				local var_311_26 = arg_308_1:GetWordFromCfg(413011074)
				local var_311_27 = arg_308_1:FormatText(var_311_26.content)

				arg_308_1.text_.text = var_311_27

				LuaForUtil.ClearLinePrefixSymbol(arg_308_1.text_)

				local var_311_28 = 27
				local var_311_29 = utf8.len(var_311_27)
				local var_311_30 = var_311_28 <= 0 and var_311_24 or var_311_24 * (var_311_29 / var_311_28)

				if var_311_30 > 0 and var_311_24 < var_311_30 then
					arg_308_1.talkMaxDuration = var_311_30

					if var_311_30 + var_311_23 > arg_308_1.duration_ then
						arg_308_1.duration_ = var_311_30 + var_311_23
					end
				end

				arg_308_1.text_.text = var_311_27
				arg_308_1.typewritter.percent = 0

				arg_308_1.typewritter:SetDirty()
				arg_308_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011074", "story_v_out_413011.awb") ~= 0 then
					local var_311_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011074", "story_v_out_413011.awb") / 1000

					if var_311_31 + var_311_23 > arg_308_1.duration_ then
						arg_308_1.duration_ = var_311_31 + var_311_23
					end

					if var_311_26.prefab_name ~= "" and arg_308_1.actors_[var_311_26.prefab_name] ~= nil then
						local var_311_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_308_1.actors_[var_311_26.prefab_name].transform, "story_v_out_413011", "413011074", "story_v_out_413011.awb")

						arg_308_1:RecordAudio("413011074", var_311_32)
						arg_308_1:RecordAudio("413011074", var_311_32)
					else
						arg_308_1:AudioAction("play", "voice", "story_v_out_413011", "413011074", "story_v_out_413011.awb")
					end

					arg_308_1:RecordHistoryTalkVoice("story_v_out_413011", "413011074", "story_v_out_413011.awb")
				end

				arg_308_1:RecordContent(arg_308_1.text_.text)
			end

			local var_311_33 = math.max(var_311_24, arg_308_1.talkMaxDuration)

			if var_311_23 <= arg_308_1.time_ and arg_308_1.time_ < var_311_23 + var_311_33 then
				arg_308_1.typewritter.percent = (arg_308_1.time_ - var_311_23) / var_311_33

				arg_308_1.typewritter:SetDirty()
			end

			if arg_308_1.time_ >= var_311_23 + var_311_33 and arg_308_1.time_ < var_311_23 + var_311_33 + arg_311_0 then
				arg_308_1.typewritter.percent = 1

				arg_308_1.typewritter:SetDirty()
				arg_308_1:ShowNextGo(true)
			end
		end
	end,
	Play413011075 = function(arg_312_0, arg_312_1)
		arg_312_1.time_ = 0
		arg_312_1.frameCnt_ = 0
		arg_312_1.state_ = "playing"
		arg_312_1.curTalkId_ = 413011075
		arg_312_1.duration_ = 4.5

		local var_312_0 = {
			zh = 1.999999999999,
			ja = 4.5
		}
		local var_312_1 = manager.audio:GetLocalizationFlag()

		if var_312_0[var_312_1] ~= nil then
			arg_312_1.duration_ = var_312_0[var_312_1]
		end

		SetActive(arg_312_1.tipsGo_, false)

		function arg_312_1.onSingleLineFinish_()
			arg_312_1.onSingleLineUpdate_ = nil
			arg_312_1.onSingleLineFinish_ = nil
			arg_312_1.state_ = "waiting"
		end

		function arg_312_1.playNext_(arg_314_0)
			if arg_314_0 == 1 then
				arg_312_0:Play413011076(arg_312_1)
			end
		end

		function arg_312_1.onSingleLineUpdate_(arg_315_0)
			local var_315_0 = arg_312_1.actors_["10093"].transform
			local var_315_1 = 0

			if var_315_1 < arg_312_1.time_ and arg_312_1.time_ <= var_315_1 + arg_315_0 then
				arg_312_1.var_.moveOldPos10093 = var_315_0.localPosition
				var_315_0.localScale = Vector3.New(1, 1, 1)

				arg_312_1:CheckSpriteTmpPos("10093", 4)

				local var_315_2 = var_315_0.childCount

				for iter_315_0 = 0, var_315_2 - 1 do
					local var_315_3 = var_315_0:GetChild(iter_315_0)

					if var_315_3.name == "" or not string.find(var_315_3.name, "split") then
						var_315_3.gameObject:SetActive(true)
					else
						var_315_3.gameObject:SetActive(false)
					end
				end
			end

			local var_315_4 = 0.001

			if var_315_1 <= arg_312_1.time_ and arg_312_1.time_ < var_315_1 + var_315_4 then
				local var_315_5 = (arg_312_1.time_ - var_315_1) / var_315_4
				local var_315_6 = Vector3.New(390, -345, -245)

				var_315_0.localPosition = Vector3.Lerp(arg_312_1.var_.moveOldPos10093, var_315_6, var_315_5)
			end

			if arg_312_1.time_ >= var_315_1 + var_315_4 and arg_312_1.time_ < var_315_1 + var_315_4 + arg_315_0 then
				var_315_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_315_7 = arg_312_1.actors_["10093"]
			local var_315_8 = 0

			if var_315_8 < arg_312_1.time_ and arg_312_1.time_ <= var_315_8 + arg_315_0 and not isNil(var_315_7) and arg_312_1.var_.actorSpriteComps10093 == nil then
				arg_312_1.var_.actorSpriteComps10093 = var_315_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_315_9 = 2

			if var_315_8 <= arg_312_1.time_ and arg_312_1.time_ < var_315_8 + var_315_9 and not isNil(var_315_7) then
				local var_315_10 = (arg_312_1.time_ - var_315_8) / var_315_9

				if arg_312_1.var_.actorSpriteComps10093 then
					for iter_315_1, iter_315_2 in pairs(arg_312_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_315_2 then
							if arg_312_1.isInRecall_ then
								local var_315_11 = Mathf.Lerp(iter_315_2.color.r, arg_312_1.hightColor1.r, var_315_10)
								local var_315_12 = Mathf.Lerp(iter_315_2.color.g, arg_312_1.hightColor1.g, var_315_10)
								local var_315_13 = Mathf.Lerp(iter_315_2.color.b, arg_312_1.hightColor1.b, var_315_10)

								iter_315_2.color = Color.New(var_315_11, var_315_12, var_315_13)
							else
								local var_315_14 = Mathf.Lerp(iter_315_2.color.r, 1, var_315_10)

								iter_315_2.color = Color.New(var_315_14, var_315_14, var_315_14)
							end
						end
					end
				end
			end

			if arg_312_1.time_ >= var_315_8 + var_315_9 and arg_312_1.time_ < var_315_8 + var_315_9 + arg_315_0 and not isNil(var_315_7) and arg_312_1.var_.actorSpriteComps10093 then
				for iter_315_3, iter_315_4 in pairs(arg_312_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_315_4 then
						if arg_312_1.isInRecall_ then
							iter_315_4.color = arg_312_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_315_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_312_1.var_.actorSpriteComps10093 = nil
			end

			local var_315_15 = arg_312_1.actors_["10092"]
			local var_315_16 = 0

			if var_315_16 < arg_312_1.time_ and arg_312_1.time_ <= var_315_16 + arg_315_0 and not isNil(var_315_15) and arg_312_1.var_.actorSpriteComps10092 == nil then
				arg_312_1.var_.actorSpriteComps10092 = var_315_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_315_17 = 2

			if var_315_16 <= arg_312_1.time_ and arg_312_1.time_ < var_315_16 + var_315_17 and not isNil(var_315_15) then
				local var_315_18 = (arg_312_1.time_ - var_315_16) / var_315_17

				if arg_312_1.var_.actorSpriteComps10092 then
					for iter_315_5, iter_315_6 in pairs(arg_312_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_315_6 then
							if arg_312_1.isInRecall_ then
								local var_315_19 = Mathf.Lerp(iter_315_6.color.r, arg_312_1.hightColor2.r, var_315_18)
								local var_315_20 = Mathf.Lerp(iter_315_6.color.g, arg_312_1.hightColor2.g, var_315_18)
								local var_315_21 = Mathf.Lerp(iter_315_6.color.b, arg_312_1.hightColor2.b, var_315_18)

								iter_315_6.color = Color.New(var_315_19, var_315_20, var_315_21)
							else
								local var_315_22 = Mathf.Lerp(iter_315_6.color.r, 0.5, var_315_18)

								iter_315_6.color = Color.New(var_315_22, var_315_22, var_315_22)
							end
						end
					end
				end
			end

			if arg_312_1.time_ >= var_315_16 + var_315_17 and arg_312_1.time_ < var_315_16 + var_315_17 + arg_315_0 and not isNil(var_315_15) and arg_312_1.var_.actorSpriteComps10092 then
				for iter_315_7, iter_315_8 in pairs(arg_312_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_315_8 then
						if arg_312_1.isInRecall_ then
							iter_315_8.color = arg_312_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_315_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_312_1.var_.actorSpriteComps10092 = nil
			end

			local var_315_23 = 0
			local var_315_24 = 0.275

			if var_315_23 < arg_312_1.time_ and arg_312_1.time_ <= var_315_23 + arg_315_0 then
				arg_312_1.talkMaxDuration = 0
				arg_312_1.dialogCg_.alpha = 1

				arg_312_1.dialog_:SetActive(true)
				SetActive(arg_312_1.leftNameGo_, true)

				local var_315_25 = arg_312_1:FormatText(StoryNameCfg[28].name)

				arg_312_1.leftNameTxt_.text = var_315_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_312_1.leftNameTxt_.transform)

				arg_312_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_312_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_312_1:RecordName(arg_312_1.leftNameTxt_.text)
				SetActive(arg_312_1.iconTrs_.gameObject, false)
				arg_312_1.callingController_:SetSelectedState("normal")

				local var_315_26 = arg_312_1:GetWordFromCfg(413011075)
				local var_315_27 = arg_312_1:FormatText(var_315_26.content)

				arg_312_1.text_.text = var_315_27

				LuaForUtil.ClearLinePrefixSymbol(arg_312_1.text_)

				local var_315_28 = 11
				local var_315_29 = utf8.len(var_315_27)
				local var_315_30 = var_315_28 <= 0 and var_315_24 or var_315_24 * (var_315_29 / var_315_28)

				if var_315_30 > 0 and var_315_24 < var_315_30 then
					arg_312_1.talkMaxDuration = var_315_30

					if var_315_30 + var_315_23 > arg_312_1.duration_ then
						arg_312_1.duration_ = var_315_30 + var_315_23
					end
				end

				arg_312_1.text_.text = var_315_27
				arg_312_1.typewritter.percent = 0

				arg_312_1.typewritter:SetDirty()
				arg_312_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011075", "story_v_out_413011.awb") ~= 0 then
					local var_315_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011075", "story_v_out_413011.awb") / 1000

					if var_315_31 + var_315_23 > arg_312_1.duration_ then
						arg_312_1.duration_ = var_315_31 + var_315_23
					end

					if var_315_26.prefab_name ~= "" and arg_312_1.actors_[var_315_26.prefab_name] ~= nil then
						local var_315_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_312_1.actors_[var_315_26.prefab_name].transform, "story_v_out_413011", "413011075", "story_v_out_413011.awb")

						arg_312_1:RecordAudio("413011075", var_315_32)
						arg_312_1:RecordAudio("413011075", var_315_32)
					else
						arg_312_1:AudioAction("play", "voice", "story_v_out_413011", "413011075", "story_v_out_413011.awb")
					end

					arg_312_1:RecordHistoryTalkVoice("story_v_out_413011", "413011075", "story_v_out_413011.awb")
				end

				arg_312_1:RecordContent(arg_312_1.text_.text)
			end

			local var_315_33 = math.max(var_315_24, arg_312_1.talkMaxDuration)

			if var_315_23 <= arg_312_1.time_ and arg_312_1.time_ < var_315_23 + var_315_33 then
				arg_312_1.typewritter.percent = (arg_312_1.time_ - var_315_23) / var_315_33

				arg_312_1.typewritter:SetDirty()
			end

			if arg_312_1.time_ >= var_315_23 + var_315_33 and arg_312_1.time_ < var_315_23 + var_315_33 + arg_315_0 then
				arg_312_1.typewritter.percent = 1

				arg_312_1.typewritter:SetDirty()
				arg_312_1:ShowNextGo(true)
			end
		end
	end,
	Play413011076 = function(arg_316_0, arg_316_1)
		arg_316_1.time_ = 0
		arg_316_1.frameCnt_ = 0
		arg_316_1.state_ = "playing"
		arg_316_1.curTalkId_ = 413011076
		arg_316_1.duration_ = 3.6

		local var_316_0 = {
			zh = 2.433,
			ja = 3.6
		}
		local var_316_1 = manager.audio:GetLocalizationFlag()

		if var_316_0[var_316_1] ~= nil then
			arg_316_1.duration_ = var_316_0[var_316_1]
		end

		SetActive(arg_316_1.tipsGo_, false)

		function arg_316_1.onSingleLineFinish_()
			arg_316_1.onSingleLineUpdate_ = nil
			arg_316_1.onSingleLineFinish_ = nil
			arg_316_1.state_ = "waiting"
		end

		function arg_316_1.playNext_(arg_318_0)
			if arg_318_0 == 1 then
				arg_316_0:Play413011077(arg_316_1)
			end
		end

		function arg_316_1.onSingleLineUpdate_(arg_319_0)
			local var_319_0 = arg_316_1.actors_["10093"]
			local var_319_1 = 0

			if var_319_1 < arg_316_1.time_ and arg_316_1.time_ <= var_319_1 + arg_319_0 and not isNil(var_319_0) and arg_316_1.var_.actorSpriteComps10093 == nil then
				arg_316_1.var_.actorSpriteComps10093 = var_319_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_319_2 = 2

			if var_319_1 <= arg_316_1.time_ and arg_316_1.time_ < var_319_1 + var_319_2 and not isNil(var_319_0) then
				local var_319_3 = (arg_316_1.time_ - var_319_1) / var_319_2

				if arg_316_1.var_.actorSpriteComps10093 then
					for iter_319_0, iter_319_1 in pairs(arg_316_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_319_1 then
							if arg_316_1.isInRecall_ then
								local var_319_4 = Mathf.Lerp(iter_319_1.color.r, arg_316_1.hightColor2.r, var_319_3)
								local var_319_5 = Mathf.Lerp(iter_319_1.color.g, arg_316_1.hightColor2.g, var_319_3)
								local var_319_6 = Mathf.Lerp(iter_319_1.color.b, arg_316_1.hightColor2.b, var_319_3)

								iter_319_1.color = Color.New(var_319_4, var_319_5, var_319_6)
							else
								local var_319_7 = Mathf.Lerp(iter_319_1.color.r, 0.5, var_319_3)

								iter_319_1.color = Color.New(var_319_7, var_319_7, var_319_7)
							end
						end
					end
				end
			end

			if arg_316_1.time_ >= var_319_1 + var_319_2 and arg_316_1.time_ < var_319_1 + var_319_2 + arg_319_0 and not isNil(var_319_0) and arg_316_1.var_.actorSpriteComps10093 then
				for iter_319_2, iter_319_3 in pairs(arg_316_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_319_3 then
						if arg_316_1.isInRecall_ then
							iter_319_3.color = arg_316_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_319_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_316_1.var_.actorSpriteComps10093 = nil
			end

			local var_319_8 = arg_316_1.actors_["10092"]
			local var_319_9 = 0

			if var_319_9 < arg_316_1.time_ and arg_316_1.time_ <= var_319_9 + arg_319_0 and not isNil(var_319_8) and arg_316_1.var_.actorSpriteComps10092 == nil then
				arg_316_1.var_.actorSpriteComps10092 = var_319_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_319_10 = 2

			if var_319_9 <= arg_316_1.time_ and arg_316_1.time_ < var_319_9 + var_319_10 and not isNil(var_319_8) then
				local var_319_11 = (arg_316_1.time_ - var_319_9) / var_319_10

				if arg_316_1.var_.actorSpriteComps10092 then
					for iter_319_4, iter_319_5 in pairs(arg_316_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_319_5 then
							if arg_316_1.isInRecall_ then
								local var_319_12 = Mathf.Lerp(iter_319_5.color.r, arg_316_1.hightColor1.r, var_319_11)
								local var_319_13 = Mathf.Lerp(iter_319_5.color.g, arg_316_1.hightColor1.g, var_319_11)
								local var_319_14 = Mathf.Lerp(iter_319_5.color.b, arg_316_1.hightColor1.b, var_319_11)

								iter_319_5.color = Color.New(var_319_12, var_319_13, var_319_14)
							else
								local var_319_15 = Mathf.Lerp(iter_319_5.color.r, 1, var_319_11)

								iter_319_5.color = Color.New(var_319_15, var_319_15, var_319_15)
							end
						end
					end
				end
			end

			if arg_316_1.time_ >= var_319_9 + var_319_10 and arg_316_1.time_ < var_319_9 + var_319_10 + arg_319_0 and not isNil(var_319_8) and arg_316_1.var_.actorSpriteComps10092 then
				for iter_319_6, iter_319_7 in pairs(arg_316_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_319_7 then
						if arg_316_1.isInRecall_ then
							iter_319_7.color = arg_316_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_319_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_316_1.var_.actorSpriteComps10092 = nil
			end

			local var_319_16 = 0
			local var_319_17 = 0.225

			if var_319_16 < arg_316_1.time_ and arg_316_1.time_ <= var_319_16 + arg_319_0 then
				arg_316_1.talkMaxDuration = 0
				arg_316_1.dialogCg_.alpha = 1

				arg_316_1.dialog_:SetActive(true)
				SetActive(arg_316_1.leftNameGo_, true)

				local var_319_18 = arg_316_1:FormatText(StoryNameCfg[996].name)

				arg_316_1.leftNameTxt_.text = var_319_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_316_1.leftNameTxt_.transform)

				arg_316_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_316_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_316_1:RecordName(arg_316_1.leftNameTxt_.text)
				SetActive(arg_316_1.iconTrs_.gameObject, false)
				arg_316_1.callingController_:SetSelectedState("normal")

				local var_319_19 = arg_316_1:GetWordFromCfg(413011076)
				local var_319_20 = arg_316_1:FormatText(var_319_19.content)

				arg_316_1.text_.text = var_319_20

				LuaForUtil.ClearLinePrefixSymbol(arg_316_1.text_)

				local var_319_21 = 9
				local var_319_22 = utf8.len(var_319_20)
				local var_319_23 = var_319_21 <= 0 and var_319_17 or var_319_17 * (var_319_22 / var_319_21)

				if var_319_23 > 0 and var_319_17 < var_319_23 then
					arg_316_1.talkMaxDuration = var_319_23

					if var_319_23 + var_319_16 > arg_316_1.duration_ then
						arg_316_1.duration_ = var_319_23 + var_319_16
					end
				end

				arg_316_1.text_.text = var_319_20
				arg_316_1.typewritter.percent = 0

				arg_316_1.typewritter:SetDirty()
				arg_316_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011076", "story_v_out_413011.awb") ~= 0 then
					local var_319_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011076", "story_v_out_413011.awb") / 1000

					if var_319_24 + var_319_16 > arg_316_1.duration_ then
						arg_316_1.duration_ = var_319_24 + var_319_16
					end

					if var_319_19.prefab_name ~= "" and arg_316_1.actors_[var_319_19.prefab_name] ~= nil then
						local var_319_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_316_1.actors_[var_319_19.prefab_name].transform, "story_v_out_413011", "413011076", "story_v_out_413011.awb")

						arg_316_1:RecordAudio("413011076", var_319_25)
						arg_316_1:RecordAudio("413011076", var_319_25)
					else
						arg_316_1:AudioAction("play", "voice", "story_v_out_413011", "413011076", "story_v_out_413011.awb")
					end

					arg_316_1:RecordHistoryTalkVoice("story_v_out_413011", "413011076", "story_v_out_413011.awb")
				end

				arg_316_1:RecordContent(arg_316_1.text_.text)
			end

			local var_319_26 = math.max(var_319_17, arg_316_1.talkMaxDuration)

			if var_319_16 <= arg_316_1.time_ and arg_316_1.time_ < var_319_16 + var_319_26 then
				arg_316_1.typewritter.percent = (arg_316_1.time_ - var_319_16) / var_319_26

				arg_316_1.typewritter:SetDirty()
			end

			if arg_316_1.time_ >= var_319_16 + var_319_26 and arg_316_1.time_ < var_319_16 + var_319_26 + arg_319_0 then
				arg_316_1.typewritter.percent = 1

				arg_316_1.typewritter:SetDirty()
				arg_316_1:ShowNextGo(true)
			end
		end
	end,
	Play413011077 = function(arg_320_0, arg_320_1)
		arg_320_1.time_ = 0
		arg_320_1.frameCnt_ = 0
		arg_320_1.state_ = "playing"
		arg_320_1.curTalkId_ = 413011077
		arg_320_1.duration_ = 10.5

		local var_320_0 = {
			zh = 8.566,
			ja = 10.5
		}
		local var_320_1 = manager.audio:GetLocalizationFlag()

		if var_320_0[var_320_1] ~= nil then
			arg_320_1.duration_ = var_320_0[var_320_1]
		end

		SetActive(arg_320_1.tipsGo_, false)

		function arg_320_1.onSingleLineFinish_()
			arg_320_1.onSingleLineUpdate_ = nil
			arg_320_1.onSingleLineFinish_ = nil
			arg_320_1.state_ = "waiting"
		end

		function arg_320_1.playNext_(arg_322_0)
			if arg_322_0 == 1 then
				arg_320_0:Play413011078(arg_320_1)
			end
		end

		function arg_320_1.onSingleLineUpdate_(arg_323_0)
			local var_323_0 = 0
			local var_323_1 = 1.1

			if var_323_0 < arg_320_1.time_ and arg_320_1.time_ <= var_323_0 + arg_323_0 then
				arg_320_1.talkMaxDuration = 0
				arg_320_1.dialogCg_.alpha = 1

				arg_320_1.dialog_:SetActive(true)
				SetActive(arg_320_1.leftNameGo_, true)

				local var_323_2 = arg_320_1:FormatText(StoryNameCfg[996].name)

				arg_320_1.leftNameTxt_.text = var_323_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_320_1.leftNameTxt_.transform)

				arg_320_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_320_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_320_1:RecordName(arg_320_1.leftNameTxt_.text)
				SetActive(arg_320_1.iconTrs_.gameObject, false)
				arg_320_1.callingController_:SetSelectedState("normal")

				local var_323_3 = arg_320_1:GetWordFromCfg(413011077)
				local var_323_4 = arg_320_1:FormatText(var_323_3.content)

				arg_320_1.text_.text = var_323_4

				LuaForUtil.ClearLinePrefixSymbol(arg_320_1.text_)

				local var_323_5 = 44
				local var_323_6 = utf8.len(var_323_4)
				local var_323_7 = var_323_5 <= 0 and var_323_1 or var_323_1 * (var_323_6 / var_323_5)

				if var_323_7 > 0 and var_323_1 < var_323_7 then
					arg_320_1.talkMaxDuration = var_323_7

					if var_323_7 + var_323_0 > arg_320_1.duration_ then
						arg_320_1.duration_ = var_323_7 + var_323_0
					end
				end

				arg_320_1.text_.text = var_323_4
				arg_320_1.typewritter.percent = 0

				arg_320_1.typewritter:SetDirty()
				arg_320_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011077", "story_v_out_413011.awb") ~= 0 then
					local var_323_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011077", "story_v_out_413011.awb") / 1000

					if var_323_8 + var_323_0 > arg_320_1.duration_ then
						arg_320_1.duration_ = var_323_8 + var_323_0
					end

					if var_323_3.prefab_name ~= "" and arg_320_1.actors_[var_323_3.prefab_name] ~= nil then
						local var_323_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_320_1.actors_[var_323_3.prefab_name].transform, "story_v_out_413011", "413011077", "story_v_out_413011.awb")

						arg_320_1:RecordAudio("413011077", var_323_9)
						arg_320_1:RecordAudio("413011077", var_323_9)
					else
						arg_320_1:AudioAction("play", "voice", "story_v_out_413011", "413011077", "story_v_out_413011.awb")
					end

					arg_320_1:RecordHistoryTalkVoice("story_v_out_413011", "413011077", "story_v_out_413011.awb")
				end

				arg_320_1:RecordContent(arg_320_1.text_.text)
			end

			local var_323_10 = math.max(var_323_1, arg_320_1.talkMaxDuration)

			if var_323_0 <= arg_320_1.time_ and arg_320_1.time_ < var_323_0 + var_323_10 then
				arg_320_1.typewritter.percent = (arg_320_1.time_ - var_323_0) / var_323_10

				arg_320_1.typewritter:SetDirty()
			end

			if arg_320_1.time_ >= var_323_0 + var_323_10 and arg_320_1.time_ < var_323_0 + var_323_10 + arg_323_0 then
				arg_320_1.typewritter.percent = 1

				arg_320_1.typewritter:SetDirty()
				arg_320_1:ShowNextGo(true)
			end
		end
	end,
	Play413011078 = function(arg_324_0, arg_324_1)
		arg_324_1.time_ = 0
		arg_324_1.frameCnt_ = 0
		arg_324_1.state_ = "playing"
		arg_324_1.curTalkId_ = 413011078
		arg_324_1.duration_ = 12.2

		local var_324_0 = {
			zh = 6.9,
			ja = 12.2
		}
		local var_324_1 = manager.audio:GetLocalizationFlag()

		if var_324_0[var_324_1] ~= nil then
			arg_324_1.duration_ = var_324_0[var_324_1]
		end

		SetActive(arg_324_1.tipsGo_, false)

		function arg_324_1.onSingleLineFinish_()
			arg_324_1.onSingleLineUpdate_ = nil
			arg_324_1.onSingleLineFinish_ = nil
			arg_324_1.state_ = "waiting"
		end

		function arg_324_1.playNext_(arg_326_0)
			if arg_326_0 == 1 then
				arg_324_0:Play413011079(arg_324_1)
			end
		end

		function arg_324_1.onSingleLineUpdate_(arg_327_0)
			local var_327_0 = 0
			local var_327_1 = 0.95

			if var_327_0 < arg_324_1.time_ and arg_324_1.time_ <= var_327_0 + arg_327_0 then
				arg_324_1.talkMaxDuration = 0
				arg_324_1.dialogCg_.alpha = 1

				arg_324_1.dialog_:SetActive(true)
				SetActive(arg_324_1.leftNameGo_, true)

				local var_327_2 = arg_324_1:FormatText(StoryNameCfg[996].name)

				arg_324_1.leftNameTxt_.text = var_327_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_324_1.leftNameTxt_.transform)

				arg_324_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_324_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_324_1:RecordName(arg_324_1.leftNameTxt_.text)
				SetActive(arg_324_1.iconTrs_.gameObject, false)
				arg_324_1.callingController_:SetSelectedState("normal")

				local var_327_3 = arg_324_1:GetWordFromCfg(413011078)
				local var_327_4 = arg_324_1:FormatText(var_327_3.content)

				arg_324_1.text_.text = var_327_4

				LuaForUtil.ClearLinePrefixSymbol(arg_324_1.text_)

				local var_327_5 = 38
				local var_327_6 = utf8.len(var_327_4)
				local var_327_7 = var_327_5 <= 0 and var_327_1 or var_327_1 * (var_327_6 / var_327_5)

				if var_327_7 > 0 and var_327_1 < var_327_7 then
					arg_324_1.talkMaxDuration = var_327_7

					if var_327_7 + var_327_0 > arg_324_1.duration_ then
						arg_324_1.duration_ = var_327_7 + var_327_0
					end
				end

				arg_324_1.text_.text = var_327_4
				arg_324_1.typewritter.percent = 0

				arg_324_1.typewritter:SetDirty()
				arg_324_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011078", "story_v_out_413011.awb") ~= 0 then
					local var_327_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011078", "story_v_out_413011.awb") / 1000

					if var_327_8 + var_327_0 > arg_324_1.duration_ then
						arg_324_1.duration_ = var_327_8 + var_327_0
					end

					if var_327_3.prefab_name ~= "" and arg_324_1.actors_[var_327_3.prefab_name] ~= nil then
						local var_327_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_324_1.actors_[var_327_3.prefab_name].transform, "story_v_out_413011", "413011078", "story_v_out_413011.awb")

						arg_324_1:RecordAudio("413011078", var_327_9)
						arg_324_1:RecordAudio("413011078", var_327_9)
					else
						arg_324_1:AudioAction("play", "voice", "story_v_out_413011", "413011078", "story_v_out_413011.awb")
					end

					arg_324_1:RecordHistoryTalkVoice("story_v_out_413011", "413011078", "story_v_out_413011.awb")
				end

				arg_324_1:RecordContent(arg_324_1.text_.text)
			end

			local var_327_10 = math.max(var_327_1, arg_324_1.talkMaxDuration)

			if var_327_0 <= arg_324_1.time_ and arg_324_1.time_ < var_327_0 + var_327_10 then
				arg_324_1.typewritter.percent = (arg_324_1.time_ - var_327_0) / var_327_10

				arg_324_1.typewritter:SetDirty()
			end

			if arg_324_1.time_ >= var_327_0 + var_327_10 and arg_324_1.time_ < var_327_0 + var_327_10 + arg_327_0 then
				arg_324_1.typewritter.percent = 1

				arg_324_1.typewritter:SetDirty()
				arg_324_1:ShowNextGo(true)
			end
		end
	end,
	Play413011079 = function(arg_328_0, arg_328_1)
		arg_328_1.time_ = 0
		arg_328_1.frameCnt_ = 0
		arg_328_1.state_ = "playing"
		arg_328_1.curTalkId_ = 413011079
		arg_328_1.duration_ = 9.23

		local var_328_0 = {
			zh = 4.5,
			ja = 9.233
		}
		local var_328_1 = manager.audio:GetLocalizationFlag()

		if var_328_0[var_328_1] ~= nil then
			arg_328_1.duration_ = var_328_0[var_328_1]
		end

		SetActive(arg_328_1.tipsGo_, false)

		function arg_328_1.onSingleLineFinish_()
			arg_328_1.onSingleLineUpdate_ = nil
			arg_328_1.onSingleLineFinish_ = nil
			arg_328_1.state_ = "waiting"
		end

		function arg_328_1.playNext_(arg_330_0)
			if arg_330_0 == 1 then
				arg_328_0:Play413011080(arg_328_1)
			end
		end

		function arg_328_1.onSingleLineUpdate_(arg_331_0)
			local var_331_0 = 0
			local var_331_1 = 0.55

			if var_331_0 < arg_328_1.time_ and arg_328_1.time_ <= var_331_0 + arg_331_0 then
				arg_328_1.talkMaxDuration = 0
				arg_328_1.dialogCg_.alpha = 1

				arg_328_1.dialog_:SetActive(true)
				SetActive(arg_328_1.leftNameGo_, true)

				local var_331_2 = arg_328_1:FormatText(StoryNameCfg[996].name)

				arg_328_1.leftNameTxt_.text = var_331_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_328_1.leftNameTxt_.transform)

				arg_328_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_328_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_328_1:RecordName(arg_328_1.leftNameTxt_.text)
				SetActive(arg_328_1.iconTrs_.gameObject, false)
				arg_328_1.callingController_:SetSelectedState("normal")

				local var_331_3 = arg_328_1:GetWordFromCfg(413011079)
				local var_331_4 = arg_328_1:FormatText(var_331_3.content)

				arg_328_1.text_.text = var_331_4

				LuaForUtil.ClearLinePrefixSymbol(arg_328_1.text_)

				local var_331_5 = 22
				local var_331_6 = utf8.len(var_331_4)
				local var_331_7 = var_331_5 <= 0 and var_331_1 or var_331_1 * (var_331_6 / var_331_5)

				if var_331_7 > 0 and var_331_1 < var_331_7 then
					arg_328_1.talkMaxDuration = var_331_7

					if var_331_7 + var_331_0 > arg_328_1.duration_ then
						arg_328_1.duration_ = var_331_7 + var_331_0
					end
				end

				arg_328_1.text_.text = var_331_4
				arg_328_1.typewritter.percent = 0

				arg_328_1.typewritter:SetDirty()
				arg_328_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011079", "story_v_out_413011.awb") ~= 0 then
					local var_331_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011079", "story_v_out_413011.awb") / 1000

					if var_331_8 + var_331_0 > arg_328_1.duration_ then
						arg_328_1.duration_ = var_331_8 + var_331_0
					end

					if var_331_3.prefab_name ~= "" and arg_328_1.actors_[var_331_3.prefab_name] ~= nil then
						local var_331_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_328_1.actors_[var_331_3.prefab_name].transform, "story_v_out_413011", "413011079", "story_v_out_413011.awb")

						arg_328_1:RecordAudio("413011079", var_331_9)
						arg_328_1:RecordAudio("413011079", var_331_9)
					else
						arg_328_1:AudioAction("play", "voice", "story_v_out_413011", "413011079", "story_v_out_413011.awb")
					end

					arg_328_1:RecordHistoryTalkVoice("story_v_out_413011", "413011079", "story_v_out_413011.awb")
				end

				arg_328_1:RecordContent(arg_328_1.text_.text)
			end

			local var_331_10 = math.max(var_331_1, arg_328_1.talkMaxDuration)

			if var_331_0 <= arg_328_1.time_ and arg_328_1.time_ < var_331_0 + var_331_10 then
				arg_328_1.typewritter.percent = (arg_328_1.time_ - var_331_0) / var_331_10

				arg_328_1.typewritter:SetDirty()
			end

			if arg_328_1.time_ >= var_331_0 + var_331_10 and arg_328_1.time_ < var_331_0 + var_331_10 + arg_331_0 then
				arg_328_1.typewritter.percent = 1

				arg_328_1.typewritter:SetDirty()
				arg_328_1:ShowNextGo(true)
			end
		end
	end,
	Play413011080 = function(arg_332_0, arg_332_1)
		arg_332_1.time_ = 0
		arg_332_1.frameCnt_ = 0
		arg_332_1.state_ = "playing"
		arg_332_1.curTalkId_ = 413011080
		arg_332_1.duration_ = 8.2

		local var_332_0 = {
			zh = 7.1,
			ja = 8.2
		}
		local var_332_1 = manager.audio:GetLocalizationFlag()

		if var_332_0[var_332_1] ~= nil then
			arg_332_1.duration_ = var_332_0[var_332_1]
		end

		SetActive(arg_332_1.tipsGo_, false)

		function arg_332_1.onSingleLineFinish_()
			arg_332_1.onSingleLineUpdate_ = nil
			arg_332_1.onSingleLineFinish_ = nil
			arg_332_1.state_ = "waiting"
		end

		function arg_332_1.playNext_(arg_334_0)
			if arg_334_0 == 1 then
				arg_332_0:Play413011081(arg_332_1)
			end
		end

		function arg_332_1.onSingleLineUpdate_(arg_335_0)
			local var_335_0 = arg_332_1.actors_["10092"].transform
			local var_335_1 = 0

			if var_335_1 < arg_332_1.time_ and arg_332_1.time_ <= var_335_1 + arg_335_0 then
				arg_332_1.var_.moveOldPos10092 = var_335_0.localPosition
				var_335_0.localScale = Vector3.New(1, 1, 1)

				arg_332_1:CheckSpriteTmpPos("10092", 2)

				local var_335_2 = var_335_0.childCount

				for iter_335_0 = 0, var_335_2 - 1 do
					local var_335_3 = var_335_0:GetChild(iter_335_0)

					if var_335_3.name == "split_6" or not string.find(var_335_3.name, "split") then
						var_335_3.gameObject:SetActive(true)
					else
						var_335_3.gameObject:SetActive(false)
					end
				end
			end

			local var_335_4 = 0.001

			if var_335_1 <= arg_332_1.time_ and arg_332_1.time_ < var_335_1 + var_335_4 then
				local var_335_5 = (arg_332_1.time_ - var_335_1) / var_335_4
				local var_335_6 = Vector3.New(-389.49, -300, -295)

				var_335_0.localPosition = Vector3.Lerp(arg_332_1.var_.moveOldPos10092, var_335_6, var_335_5)
			end

			if arg_332_1.time_ >= var_335_1 + var_335_4 and arg_332_1.time_ < var_335_1 + var_335_4 + arg_335_0 then
				var_335_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_335_7 = 0
			local var_335_8 = 0.575

			if var_335_7 < arg_332_1.time_ and arg_332_1.time_ <= var_335_7 + arg_335_0 then
				arg_332_1.talkMaxDuration = 0
				arg_332_1.dialogCg_.alpha = 1

				arg_332_1.dialog_:SetActive(true)
				SetActive(arg_332_1.leftNameGo_, true)

				local var_335_9 = arg_332_1:FormatText(StoryNameCfg[996].name)

				arg_332_1.leftNameTxt_.text = var_335_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_332_1.leftNameTxt_.transform)

				arg_332_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_332_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_332_1:RecordName(arg_332_1.leftNameTxt_.text)
				SetActive(arg_332_1.iconTrs_.gameObject, false)
				arg_332_1.callingController_:SetSelectedState("normal")

				local var_335_10 = arg_332_1:GetWordFromCfg(413011080)
				local var_335_11 = arg_332_1:FormatText(var_335_10.content)

				arg_332_1.text_.text = var_335_11

				LuaForUtil.ClearLinePrefixSymbol(arg_332_1.text_)

				local var_335_12 = 23
				local var_335_13 = utf8.len(var_335_11)
				local var_335_14 = var_335_12 <= 0 and var_335_8 or var_335_8 * (var_335_13 / var_335_12)

				if var_335_14 > 0 and var_335_8 < var_335_14 then
					arg_332_1.talkMaxDuration = var_335_14

					if var_335_14 + var_335_7 > arg_332_1.duration_ then
						arg_332_1.duration_ = var_335_14 + var_335_7
					end
				end

				arg_332_1.text_.text = var_335_11
				arg_332_1.typewritter.percent = 0

				arg_332_1.typewritter:SetDirty()
				arg_332_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011080", "story_v_out_413011.awb") ~= 0 then
					local var_335_15 = manager.audio:GetVoiceLength("story_v_out_413011", "413011080", "story_v_out_413011.awb") / 1000

					if var_335_15 + var_335_7 > arg_332_1.duration_ then
						arg_332_1.duration_ = var_335_15 + var_335_7
					end

					if var_335_10.prefab_name ~= "" and arg_332_1.actors_[var_335_10.prefab_name] ~= nil then
						local var_335_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_332_1.actors_[var_335_10.prefab_name].transform, "story_v_out_413011", "413011080", "story_v_out_413011.awb")

						arg_332_1:RecordAudio("413011080", var_335_16)
						arg_332_1:RecordAudio("413011080", var_335_16)
					else
						arg_332_1:AudioAction("play", "voice", "story_v_out_413011", "413011080", "story_v_out_413011.awb")
					end

					arg_332_1:RecordHistoryTalkVoice("story_v_out_413011", "413011080", "story_v_out_413011.awb")
				end

				arg_332_1:RecordContent(arg_332_1.text_.text)
			end

			local var_335_17 = math.max(var_335_8, arg_332_1.talkMaxDuration)

			if var_335_7 <= arg_332_1.time_ and arg_332_1.time_ < var_335_7 + var_335_17 then
				arg_332_1.typewritter.percent = (arg_332_1.time_ - var_335_7) / var_335_17

				arg_332_1.typewritter:SetDirty()
			end

			if arg_332_1.time_ >= var_335_7 + var_335_17 and arg_332_1.time_ < var_335_7 + var_335_17 + arg_335_0 then
				arg_332_1.typewritter.percent = 1

				arg_332_1.typewritter:SetDirty()
				arg_332_1:ShowNextGo(true)
			end
		end
	end,
	Play413011081 = function(arg_336_0, arg_336_1)
		arg_336_1.time_ = 0
		arg_336_1.frameCnt_ = 0
		arg_336_1.state_ = "playing"
		arg_336_1.curTalkId_ = 413011081
		arg_336_1.duration_ = 3.43

		local var_336_0 = {
			zh = 1.999999999999,
			ja = 3.433
		}
		local var_336_1 = manager.audio:GetLocalizationFlag()

		if var_336_0[var_336_1] ~= nil then
			arg_336_1.duration_ = var_336_0[var_336_1]
		end

		SetActive(arg_336_1.tipsGo_, false)

		function arg_336_1.onSingleLineFinish_()
			arg_336_1.onSingleLineUpdate_ = nil
			arg_336_1.onSingleLineFinish_ = nil
			arg_336_1.state_ = "waiting"
		end

		function arg_336_1.playNext_(arg_338_0)
			if arg_338_0 == 1 then
				arg_336_0:Play413011082(arg_336_1)
			end
		end

		function arg_336_1.onSingleLineUpdate_(arg_339_0)
			local var_339_0 = arg_336_1.actors_["10093"].transform
			local var_339_1 = 0

			if var_339_1 < arg_336_1.time_ and arg_336_1.time_ <= var_339_1 + arg_339_0 then
				arg_336_1.var_.moveOldPos10093 = var_339_0.localPosition
				var_339_0.localScale = Vector3.New(1, 1, 1)

				arg_336_1:CheckSpriteTmpPos("10093", 4)

				local var_339_2 = var_339_0.childCount

				for iter_339_0 = 0, var_339_2 - 1 do
					local var_339_3 = var_339_0:GetChild(iter_339_0)

					if var_339_3.name == "split_7" or not string.find(var_339_3.name, "split") then
						var_339_3.gameObject:SetActive(true)
					else
						var_339_3.gameObject:SetActive(false)
					end
				end
			end

			local var_339_4 = 0.001

			if var_339_1 <= arg_336_1.time_ and arg_336_1.time_ < var_339_1 + var_339_4 then
				local var_339_5 = (arg_336_1.time_ - var_339_1) / var_339_4
				local var_339_6 = Vector3.New(390, -345, -245)

				var_339_0.localPosition = Vector3.Lerp(arg_336_1.var_.moveOldPos10093, var_339_6, var_339_5)
			end

			if arg_336_1.time_ >= var_339_1 + var_339_4 and arg_336_1.time_ < var_339_1 + var_339_4 + arg_339_0 then
				var_339_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_339_7 = arg_336_1.actors_["10093"]
			local var_339_8 = 0

			if var_339_8 < arg_336_1.time_ and arg_336_1.time_ <= var_339_8 + arg_339_0 and not isNil(var_339_7) and arg_336_1.var_.actorSpriteComps10093 == nil then
				arg_336_1.var_.actorSpriteComps10093 = var_339_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_339_9 = 2

			if var_339_8 <= arg_336_1.time_ and arg_336_1.time_ < var_339_8 + var_339_9 and not isNil(var_339_7) then
				local var_339_10 = (arg_336_1.time_ - var_339_8) / var_339_9

				if arg_336_1.var_.actorSpriteComps10093 then
					for iter_339_1, iter_339_2 in pairs(arg_336_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_339_2 then
							if arg_336_1.isInRecall_ then
								local var_339_11 = Mathf.Lerp(iter_339_2.color.r, arg_336_1.hightColor1.r, var_339_10)
								local var_339_12 = Mathf.Lerp(iter_339_2.color.g, arg_336_1.hightColor1.g, var_339_10)
								local var_339_13 = Mathf.Lerp(iter_339_2.color.b, arg_336_1.hightColor1.b, var_339_10)

								iter_339_2.color = Color.New(var_339_11, var_339_12, var_339_13)
							else
								local var_339_14 = Mathf.Lerp(iter_339_2.color.r, 1, var_339_10)

								iter_339_2.color = Color.New(var_339_14, var_339_14, var_339_14)
							end
						end
					end
				end
			end

			if arg_336_1.time_ >= var_339_8 + var_339_9 and arg_336_1.time_ < var_339_8 + var_339_9 + arg_339_0 and not isNil(var_339_7) and arg_336_1.var_.actorSpriteComps10093 then
				for iter_339_3, iter_339_4 in pairs(arg_336_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_339_4 then
						if arg_336_1.isInRecall_ then
							iter_339_4.color = arg_336_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_339_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_336_1.var_.actorSpriteComps10093 = nil
			end

			local var_339_15 = arg_336_1.actors_["10092"]
			local var_339_16 = 0

			if var_339_16 < arg_336_1.time_ and arg_336_1.time_ <= var_339_16 + arg_339_0 and not isNil(var_339_15) and arg_336_1.var_.actorSpriteComps10092 == nil then
				arg_336_1.var_.actorSpriteComps10092 = var_339_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_339_17 = 2

			if var_339_16 <= arg_336_1.time_ and arg_336_1.time_ < var_339_16 + var_339_17 and not isNil(var_339_15) then
				local var_339_18 = (arg_336_1.time_ - var_339_16) / var_339_17

				if arg_336_1.var_.actorSpriteComps10092 then
					for iter_339_5, iter_339_6 in pairs(arg_336_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_339_6 then
							if arg_336_1.isInRecall_ then
								local var_339_19 = Mathf.Lerp(iter_339_6.color.r, arg_336_1.hightColor2.r, var_339_18)
								local var_339_20 = Mathf.Lerp(iter_339_6.color.g, arg_336_1.hightColor2.g, var_339_18)
								local var_339_21 = Mathf.Lerp(iter_339_6.color.b, arg_336_1.hightColor2.b, var_339_18)

								iter_339_6.color = Color.New(var_339_19, var_339_20, var_339_21)
							else
								local var_339_22 = Mathf.Lerp(iter_339_6.color.r, 0.5, var_339_18)

								iter_339_6.color = Color.New(var_339_22, var_339_22, var_339_22)
							end
						end
					end
				end
			end

			if arg_336_1.time_ >= var_339_16 + var_339_17 and arg_336_1.time_ < var_339_16 + var_339_17 + arg_339_0 and not isNil(var_339_15) and arg_336_1.var_.actorSpriteComps10092 then
				for iter_339_7, iter_339_8 in pairs(arg_336_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_339_8 then
						if arg_336_1.isInRecall_ then
							iter_339_8.color = arg_336_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_339_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_336_1.var_.actorSpriteComps10092 = nil
			end

			local var_339_23 = 0
			local var_339_24 = 0.175

			if var_339_23 < arg_336_1.time_ and arg_336_1.time_ <= var_339_23 + arg_339_0 then
				arg_336_1.talkMaxDuration = 0
				arg_336_1.dialogCg_.alpha = 1

				arg_336_1.dialog_:SetActive(true)
				SetActive(arg_336_1.leftNameGo_, true)

				local var_339_25 = arg_336_1:FormatText(StoryNameCfg[28].name)

				arg_336_1.leftNameTxt_.text = var_339_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_336_1.leftNameTxt_.transform)

				arg_336_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_336_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_336_1:RecordName(arg_336_1.leftNameTxt_.text)
				SetActive(arg_336_1.iconTrs_.gameObject, false)
				arg_336_1.callingController_:SetSelectedState("normal")

				local var_339_26 = arg_336_1:GetWordFromCfg(413011081)
				local var_339_27 = arg_336_1:FormatText(var_339_26.content)

				arg_336_1.text_.text = var_339_27

				LuaForUtil.ClearLinePrefixSymbol(arg_336_1.text_)

				local var_339_28 = 7
				local var_339_29 = utf8.len(var_339_27)
				local var_339_30 = var_339_28 <= 0 and var_339_24 or var_339_24 * (var_339_29 / var_339_28)

				if var_339_30 > 0 and var_339_24 < var_339_30 then
					arg_336_1.talkMaxDuration = var_339_30

					if var_339_30 + var_339_23 > arg_336_1.duration_ then
						arg_336_1.duration_ = var_339_30 + var_339_23
					end
				end

				arg_336_1.text_.text = var_339_27
				arg_336_1.typewritter.percent = 0

				arg_336_1.typewritter:SetDirty()
				arg_336_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011081", "story_v_out_413011.awb") ~= 0 then
					local var_339_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011081", "story_v_out_413011.awb") / 1000

					if var_339_31 + var_339_23 > arg_336_1.duration_ then
						arg_336_1.duration_ = var_339_31 + var_339_23
					end

					if var_339_26.prefab_name ~= "" and arg_336_1.actors_[var_339_26.prefab_name] ~= nil then
						local var_339_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_336_1.actors_[var_339_26.prefab_name].transform, "story_v_out_413011", "413011081", "story_v_out_413011.awb")

						arg_336_1:RecordAudio("413011081", var_339_32)
						arg_336_1:RecordAudio("413011081", var_339_32)
					else
						arg_336_1:AudioAction("play", "voice", "story_v_out_413011", "413011081", "story_v_out_413011.awb")
					end

					arg_336_1:RecordHistoryTalkVoice("story_v_out_413011", "413011081", "story_v_out_413011.awb")
				end

				arg_336_1:RecordContent(arg_336_1.text_.text)
			end

			local var_339_33 = math.max(var_339_24, arg_336_1.talkMaxDuration)

			if var_339_23 <= arg_336_1.time_ and arg_336_1.time_ < var_339_23 + var_339_33 then
				arg_336_1.typewritter.percent = (arg_336_1.time_ - var_339_23) / var_339_33

				arg_336_1.typewritter:SetDirty()
			end

			if arg_336_1.time_ >= var_339_23 + var_339_33 and arg_336_1.time_ < var_339_23 + var_339_33 + arg_339_0 then
				arg_336_1.typewritter.percent = 1

				arg_336_1.typewritter:SetDirty()
				arg_336_1:ShowNextGo(true)
			end
		end
	end,
	Play413011082 = function(arg_340_0, arg_340_1)
		arg_340_1.time_ = 0
		arg_340_1.frameCnt_ = 0
		arg_340_1.state_ = "playing"
		arg_340_1.curTalkId_ = 413011082
		arg_340_1.duration_ = 5.3

		local var_340_0 = {
			zh = 4.066,
			ja = 5.3
		}
		local var_340_1 = manager.audio:GetLocalizationFlag()

		if var_340_0[var_340_1] ~= nil then
			arg_340_1.duration_ = var_340_0[var_340_1]
		end

		SetActive(arg_340_1.tipsGo_, false)

		function arg_340_1.onSingleLineFinish_()
			arg_340_1.onSingleLineUpdate_ = nil
			arg_340_1.onSingleLineFinish_ = nil
			arg_340_1.state_ = "waiting"
		end

		function arg_340_1.playNext_(arg_342_0)
			if arg_342_0 == 1 then
				arg_340_0:Play413011083(arg_340_1)
			end
		end

		function arg_340_1.onSingleLineUpdate_(arg_343_0)
			local var_343_0 = arg_340_1.actors_["10093"]
			local var_343_1 = 0

			if var_343_1 < arg_340_1.time_ and arg_340_1.time_ <= var_343_1 + arg_343_0 and not isNil(var_343_0) and arg_340_1.var_.actorSpriteComps10093 == nil then
				arg_340_1.var_.actorSpriteComps10093 = var_343_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_343_2 = 2

			if var_343_1 <= arg_340_1.time_ and arg_340_1.time_ < var_343_1 + var_343_2 and not isNil(var_343_0) then
				local var_343_3 = (arg_340_1.time_ - var_343_1) / var_343_2

				if arg_340_1.var_.actorSpriteComps10093 then
					for iter_343_0, iter_343_1 in pairs(arg_340_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_343_1 then
							if arg_340_1.isInRecall_ then
								local var_343_4 = Mathf.Lerp(iter_343_1.color.r, arg_340_1.hightColor2.r, var_343_3)
								local var_343_5 = Mathf.Lerp(iter_343_1.color.g, arg_340_1.hightColor2.g, var_343_3)
								local var_343_6 = Mathf.Lerp(iter_343_1.color.b, arg_340_1.hightColor2.b, var_343_3)

								iter_343_1.color = Color.New(var_343_4, var_343_5, var_343_6)
							else
								local var_343_7 = Mathf.Lerp(iter_343_1.color.r, 0.5, var_343_3)

								iter_343_1.color = Color.New(var_343_7, var_343_7, var_343_7)
							end
						end
					end
				end
			end

			if arg_340_1.time_ >= var_343_1 + var_343_2 and arg_340_1.time_ < var_343_1 + var_343_2 + arg_343_0 and not isNil(var_343_0) and arg_340_1.var_.actorSpriteComps10093 then
				for iter_343_2, iter_343_3 in pairs(arg_340_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_343_3 then
						if arg_340_1.isInRecall_ then
							iter_343_3.color = arg_340_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_343_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_340_1.var_.actorSpriteComps10093 = nil
			end

			local var_343_8 = arg_340_1.actors_["10092"]
			local var_343_9 = 0

			if var_343_9 < arg_340_1.time_ and arg_340_1.time_ <= var_343_9 + arg_343_0 and not isNil(var_343_8) and arg_340_1.var_.actorSpriteComps10092 == nil then
				arg_340_1.var_.actorSpriteComps10092 = var_343_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_343_10 = 2

			if var_343_9 <= arg_340_1.time_ and arg_340_1.time_ < var_343_9 + var_343_10 and not isNil(var_343_8) then
				local var_343_11 = (arg_340_1.time_ - var_343_9) / var_343_10

				if arg_340_1.var_.actorSpriteComps10092 then
					for iter_343_4, iter_343_5 in pairs(arg_340_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_343_5 then
							if arg_340_1.isInRecall_ then
								local var_343_12 = Mathf.Lerp(iter_343_5.color.r, arg_340_1.hightColor1.r, var_343_11)
								local var_343_13 = Mathf.Lerp(iter_343_5.color.g, arg_340_1.hightColor1.g, var_343_11)
								local var_343_14 = Mathf.Lerp(iter_343_5.color.b, arg_340_1.hightColor1.b, var_343_11)

								iter_343_5.color = Color.New(var_343_12, var_343_13, var_343_14)
							else
								local var_343_15 = Mathf.Lerp(iter_343_5.color.r, 1, var_343_11)

								iter_343_5.color = Color.New(var_343_15, var_343_15, var_343_15)
							end
						end
					end
				end
			end

			if arg_340_1.time_ >= var_343_9 + var_343_10 and arg_340_1.time_ < var_343_9 + var_343_10 + arg_343_0 and not isNil(var_343_8) and arg_340_1.var_.actorSpriteComps10092 then
				for iter_343_6, iter_343_7 in pairs(arg_340_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_343_7 then
						if arg_340_1.isInRecall_ then
							iter_343_7.color = arg_340_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_343_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_340_1.var_.actorSpriteComps10092 = nil
			end

			local var_343_16 = 0
			local var_343_17 = 0.475

			if var_343_16 < arg_340_1.time_ and arg_340_1.time_ <= var_343_16 + arg_343_0 then
				arg_340_1.talkMaxDuration = 0
				arg_340_1.dialogCg_.alpha = 1

				arg_340_1.dialog_:SetActive(true)
				SetActive(arg_340_1.leftNameGo_, true)

				local var_343_18 = arg_340_1:FormatText(StoryNameCfg[996].name)

				arg_340_1.leftNameTxt_.text = var_343_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_340_1.leftNameTxt_.transform)

				arg_340_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_340_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_340_1:RecordName(arg_340_1.leftNameTxt_.text)
				SetActive(arg_340_1.iconTrs_.gameObject, false)
				arg_340_1.callingController_:SetSelectedState("normal")

				local var_343_19 = arg_340_1:GetWordFromCfg(413011082)
				local var_343_20 = arg_340_1:FormatText(var_343_19.content)

				arg_340_1.text_.text = var_343_20

				LuaForUtil.ClearLinePrefixSymbol(arg_340_1.text_)

				local var_343_21 = 19
				local var_343_22 = utf8.len(var_343_20)
				local var_343_23 = var_343_21 <= 0 and var_343_17 or var_343_17 * (var_343_22 / var_343_21)

				if var_343_23 > 0 and var_343_17 < var_343_23 then
					arg_340_1.talkMaxDuration = var_343_23

					if var_343_23 + var_343_16 > arg_340_1.duration_ then
						arg_340_1.duration_ = var_343_23 + var_343_16
					end
				end

				arg_340_1.text_.text = var_343_20
				arg_340_1.typewritter.percent = 0

				arg_340_1.typewritter:SetDirty()
				arg_340_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011082", "story_v_out_413011.awb") ~= 0 then
					local var_343_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011082", "story_v_out_413011.awb") / 1000

					if var_343_24 + var_343_16 > arg_340_1.duration_ then
						arg_340_1.duration_ = var_343_24 + var_343_16
					end

					if var_343_19.prefab_name ~= "" and arg_340_1.actors_[var_343_19.prefab_name] ~= nil then
						local var_343_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_340_1.actors_[var_343_19.prefab_name].transform, "story_v_out_413011", "413011082", "story_v_out_413011.awb")

						arg_340_1:RecordAudio("413011082", var_343_25)
						arg_340_1:RecordAudio("413011082", var_343_25)
					else
						arg_340_1:AudioAction("play", "voice", "story_v_out_413011", "413011082", "story_v_out_413011.awb")
					end

					arg_340_1:RecordHistoryTalkVoice("story_v_out_413011", "413011082", "story_v_out_413011.awb")
				end

				arg_340_1:RecordContent(arg_340_1.text_.text)
			end

			local var_343_26 = math.max(var_343_17, arg_340_1.talkMaxDuration)

			if var_343_16 <= arg_340_1.time_ and arg_340_1.time_ < var_343_16 + var_343_26 then
				arg_340_1.typewritter.percent = (arg_340_1.time_ - var_343_16) / var_343_26

				arg_340_1.typewritter:SetDirty()
			end

			if arg_340_1.time_ >= var_343_16 + var_343_26 and arg_340_1.time_ < var_343_16 + var_343_26 + arg_343_0 then
				arg_340_1.typewritter.percent = 1

				arg_340_1.typewritter:SetDirty()
				arg_340_1:ShowNextGo(true)
			end
		end
	end,
	Play413011083 = function(arg_344_0, arg_344_1)
		arg_344_1.time_ = 0
		arg_344_1.frameCnt_ = 0
		arg_344_1.state_ = "playing"
		arg_344_1.curTalkId_ = 413011083
		arg_344_1.duration_ = 7.37

		local var_344_0 = {
			zh = 4.6,
			ja = 7.366
		}
		local var_344_1 = manager.audio:GetLocalizationFlag()

		if var_344_0[var_344_1] ~= nil then
			arg_344_1.duration_ = var_344_0[var_344_1]
		end

		SetActive(arg_344_1.tipsGo_, false)

		function arg_344_1.onSingleLineFinish_()
			arg_344_1.onSingleLineUpdate_ = nil
			arg_344_1.onSingleLineFinish_ = nil
			arg_344_1.state_ = "waiting"
		end

		function arg_344_1.playNext_(arg_346_0)
			if arg_346_0 == 1 then
				arg_344_0:Play413011084(arg_344_1)
			end
		end

		function arg_344_1.onSingleLineUpdate_(arg_347_0)
			local var_347_0 = arg_344_1.actors_["10093"]
			local var_347_1 = 0

			if var_347_1 < arg_344_1.time_ and arg_344_1.time_ <= var_347_1 + arg_347_0 and not isNil(var_347_0) and arg_344_1.var_.actorSpriteComps10093 == nil then
				arg_344_1.var_.actorSpriteComps10093 = var_347_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_347_2 = 2

			if var_347_1 <= arg_344_1.time_ and arg_344_1.time_ < var_347_1 + var_347_2 and not isNil(var_347_0) then
				local var_347_3 = (arg_344_1.time_ - var_347_1) / var_347_2

				if arg_344_1.var_.actorSpriteComps10093 then
					for iter_347_0, iter_347_1 in pairs(arg_344_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_347_1 then
							if arg_344_1.isInRecall_ then
								local var_347_4 = Mathf.Lerp(iter_347_1.color.r, arg_344_1.hightColor1.r, var_347_3)
								local var_347_5 = Mathf.Lerp(iter_347_1.color.g, arg_344_1.hightColor1.g, var_347_3)
								local var_347_6 = Mathf.Lerp(iter_347_1.color.b, arg_344_1.hightColor1.b, var_347_3)

								iter_347_1.color = Color.New(var_347_4, var_347_5, var_347_6)
							else
								local var_347_7 = Mathf.Lerp(iter_347_1.color.r, 1, var_347_3)

								iter_347_1.color = Color.New(var_347_7, var_347_7, var_347_7)
							end
						end
					end
				end
			end

			if arg_344_1.time_ >= var_347_1 + var_347_2 and arg_344_1.time_ < var_347_1 + var_347_2 + arg_347_0 and not isNil(var_347_0) and arg_344_1.var_.actorSpriteComps10093 then
				for iter_347_2, iter_347_3 in pairs(arg_344_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_347_3 then
						if arg_344_1.isInRecall_ then
							iter_347_3.color = arg_344_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_347_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_344_1.var_.actorSpriteComps10093 = nil
			end

			local var_347_8 = arg_344_1.actors_["10092"]
			local var_347_9 = 0

			if var_347_9 < arg_344_1.time_ and arg_344_1.time_ <= var_347_9 + arg_347_0 and not isNil(var_347_8) and arg_344_1.var_.actorSpriteComps10092 == nil then
				arg_344_1.var_.actorSpriteComps10092 = var_347_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_347_10 = 2

			if var_347_9 <= arg_344_1.time_ and arg_344_1.time_ < var_347_9 + var_347_10 and not isNil(var_347_8) then
				local var_347_11 = (arg_344_1.time_ - var_347_9) / var_347_10

				if arg_344_1.var_.actorSpriteComps10092 then
					for iter_347_4, iter_347_5 in pairs(arg_344_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_347_5 then
							if arg_344_1.isInRecall_ then
								local var_347_12 = Mathf.Lerp(iter_347_5.color.r, arg_344_1.hightColor2.r, var_347_11)
								local var_347_13 = Mathf.Lerp(iter_347_5.color.g, arg_344_1.hightColor2.g, var_347_11)
								local var_347_14 = Mathf.Lerp(iter_347_5.color.b, arg_344_1.hightColor2.b, var_347_11)

								iter_347_5.color = Color.New(var_347_12, var_347_13, var_347_14)
							else
								local var_347_15 = Mathf.Lerp(iter_347_5.color.r, 0.5, var_347_11)

								iter_347_5.color = Color.New(var_347_15, var_347_15, var_347_15)
							end
						end
					end
				end
			end

			if arg_344_1.time_ >= var_347_9 + var_347_10 and arg_344_1.time_ < var_347_9 + var_347_10 + arg_347_0 and not isNil(var_347_8) and arg_344_1.var_.actorSpriteComps10092 then
				for iter_347_6, iter_347_7 in pairs(arg_344_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_347_7 then
						if arg_344_1.isInRecall_ then
							iter_347_7.color = arg_344_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_347_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_344_1.var_.actorSpriteComps10092 = nil
			end

			local var_347_16 = 0
			local var_347_17 = 0.675

			if var_347_16 < arg_344_1.time_ and arg_344_1.time_ <= var_347_16 + arg_347_0 then
				arg_344_1.talkMaxDuration = 0
				arg_344_1.dialogCg_.alpha = 1

				arg_344_1.dialog_:SetActive(true)
				SetActive(arg_344_1.leftNameGo_, true)

				local var_347_18 = arg_344_1:FormatText(StoryNameCfg[28].name)

				arg_344_1.leftNameTxt_.text = var_347_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_344_1.leftNameTxt_.transform)

				arg_344_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_344_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_344_1:RecordName(arg_344_1.leftNameTxt_.text)
				SetActive(arg_344_1.iconTrs_.gameObject, false)
				arg_344_1.callingController_:SetSelectedState("normal")

				local var_347_19 = arg_344_1:GetWordFromCfg(413011083)
				local var_347_20 = arg_344_1:FormatText(var_347_19.content)

				arg_344_1.text_.text = var_347_20

				LuaForUtil.ClearLinePrefixSymbol(arg_344_1.text_)

				local var_347_21 = 27
				local var_347_22 = utf8.len(var_347_20)
				local var_347_23 = var_347_21 <= 0 and var_347_17 or var_347_17 * (var_347_22 / var_347_21)

				if var_347_23 > 0 and var_347_17 < var_347_23 then
					arg_344_1.talkMaxDuration = var_347_23

					if var_347_23 + var_347_16 > arg_344_1.duration_ then
						arg_344_1.duration_ = var_347_23 + var_347_16
					end
				end

				arg_344_1.text_.text = var_347_20
				arg_344_1.typewritter.percent = 0

				arg_344_1.typewritter:SetDirty()
				arg_344_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011083", "story_v_out_413011.awb") ~= 0 then
					local var_347_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011083", "story_v_out_413011.awb") / 1000

					if var_347_24 + var_347_16 > arg_344_1.duration_ then
						arg_344_1.duration_ = var_347_24 + var_347_16
					end

					if var_347_19.prefab_name ~= "" and arg_344_1.actors_[var_347_19.prefab_name] ~= nil then
						local var_347_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_344_1.actors_[var_347_19.prefab_name].transform, "story_v_out_413011", "413011083", "story_v_out_413011.awb")

						arg_344_1:RecordAudio("413011083", var_347_25)
						arg_344_1:RecordAudio("413011083", var_347_25)
					else
						arg_344_1:AudioAction("play", "voice", "story_v_out_413011", "413011083", "story_v_out_413011.awb")
					end

					arg_344_1:RecordHistoryTalkVoice("story_v_out_413011", "413011083", "story_v_out_413011.awb")
				end

				arg_344_1:RecordContent(arg_344_1.text_.text)
			end

			local var_347_26 = math.max(var_347_17, arg_344_1.talkMaxDuration)

			if var_347_16 <= arg_344_1.time_ and arg_344_1.time_ < var_347_16 + var_347_26 then
				arg_344_1.typewritter.percent = (arg_344_1.time_ - var_347_16) / var_347_26

				arg_344_1.typewritter:SetDirty()
			end

			if arg_344_1.time_ >= var_347_16 + var_347_26 and arg_344_1.time_ < var_347_16 + var_347_26 + arg_347_0 then
				arg_344_1.typewritter.percent = 1

				arg_344_1.typewritter:SetDirty()
				arg_344_1:ShowNextGo(true)
			end
		end
	end,
	Play413011084 = function(arg_348_0, arg_348_1)
		arg_348_1.time_ = 0
		arg_348_1.frameCnt_ = 0
		arg_348_1.state_ = "playing"
		arg_348_1.curTalkId_ = 413011084
		arg_348_1.duration_ = 9.23

		local var_348_0 = {
			zh = 5.1,
			ja = 9.233
		}
		local var_348_1 = manager.audio:GetLocalizationFlag()

		if var_348_0[var_348_1] ~= nil then
			arg_348_1.duration_ = var_348_0[var_348_1]
		end

		SetActive(arg_348_1.tipsGo_, false)

		function arg_348_1.onSingleLineFinish_()
			arg_348_1.onSingleLineUpdate_ = nil
			arg_348_1.onSingleLineFinish_ = nil
			arg_348_1.state_ = "waiting"
		end

		function arg_348_1.playNext_(arg_350_0)
			if arg_350_0 == 1 then
				arg_348_0:Play413011085(arg_348_1)
			end
		end

		function arg_348_1.onSingleLineUpdate_(arg_351_0)
			local var_351_0 = arg_348_1.actors_["10093"]
			local var_351_1 = 0

			if var_351_1 < arg_348_1.time_ and arg_348_1.time_ <= var_351_1 + arg_351_0 and not isNil(var_351_0) and arg_348_1.var_.actorSpriteComps10093 == nil then
				arg_348_1.var_.actorSpriteComps10093 = var_351_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_351_2 = 2

			if var_351_1 <= arg_348_1.time_ and arg_348_1.time_ < var_351_1 + var_351_2 and not isNil(var_351_0) then
				local var_351_3 = (arg_348_1.time_ - var_351_1) / var_351_2

				if arg_348_1.var_.actorSpriteComps10093 then
					for iter_351_0, iter_351_1 in pairs(arg_348_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_351_1 then
							if arg_348_1.isInRecall_ then
								local var_351_4 = Mathf.Lerp(iter_351_1.color.r, arg_348_1.hightColor2.r, var_351_3)
								local var_351_5 = Mathf.Lerp(iter_351_1.color.g, arg_348_1.hightColor2.g, var_351_3)
								local var_351_6 = Mathf.Lerp(iter_351_1.color.b, arg_348_1.hightColor2.b, var_351_3)

								iter_351_1.color = Color.New(var_351_4, var_351_5, var_351_6)
							else
								local var_351_7 = Mathf.Lerp(iter_351_1.color.r, 0.5, var_351_3)

								iter_351_1.color = Color.New(var_351_7, var_351_7, var_351_7)
							end
						end
					end
				end
			end

			if arg_348_1.time_ >= var_351_1 + var_351_2 and arg_348_1.time_ < var_351_1 + var_351_2 + arg_351_0 and not isNil(var_351_0) and arg_348_1.var_.actorSpriteComps10093 then
				for iter_351_2, iter_351_3 in pairs(arg_348_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_351_3 then
						if arg_348_1.isInRecall_ then
							iter_351_3.color = arg_348_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_351_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_348_1.var_.actorSpriteComps10093 = nil
			end

			local var_351_8 = arg_348_1.actors_["10092"]
			local var_351_9 = 0

			if var_351_9 < arg_348_1.time_ and arg_348_1.time_ <= var_351_9 + arg_351_0 and not isNil(var_351_8) and arg_348_1.var_.actorSpriteComps10092 == nil then
				arg_348_1.var_.actorSpriteComps10092 = var_351_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_351_10 = 2

			if var_351_9 <= arg_348_1.time_ and arg_348_1.time_ < var_351_9 + var_351_10 and not isNil(var_351_8) then
				local var_351_11 = (arg_348_1.time_ - var_351_9) / var_351_10

				if arg_348_1.var_.actorSpriteComps10092 then
					for iter_351_4, iter_351_5 in pairs(arg_348_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_351_5 then
							if arg_348_1.isInRecall_ then
								local var_351_12 = Mathf.Lerp(iter_351_5.color.r, arg_348_1.hightColor1.r, var_351_11)
								local var_351_13 = Mathf.Lerp(iter_351_5.color.g, arg_348_1.hightColor1.g, var_351_11)
								local var_351_14 = Mathf.Lerp(iter_351_5.color.b, arg_348_1.hightColor1.b, var_351_11)

								iter_351_5.color = Color.New(var_351_12, var_351_13, var_351_14)
							else
								local var_351_15 = Mathf.Lerp(iter_351_5.color.r, 1, var_351_11)

								iter_351_5.color = Color.New(var_351_15, var_351_15, var_351_15)
							end
						end
					end
				end
			end

			if arg_348_1.time_ >= var_351_9 + var_351_10 and arg_348_1.time_ < var_351_9 + var_351_10 + arg_351_0 and not isNil(var_351_8) and arg_348_1.var_.actorSpriteComps10092 then
				for iter_351_6, iter_351_7 in pairs(arg_348_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_351_7 then
						if arg_348_1.isInRecall_ then
							iter_351_7.color = arg_348_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_351_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_348_1.var_.actorSpriteComps10092 = nil
			end

			local var_351_16 = arg_348_1.actors_["10092"].transform
			local var_351_17 = 0

			if var_351_17 < arg_348_1.time_ and arg_348_1.time_ <= var_351_17 + arg_351_0 then
				arg_348_1.var_.moveOldPos10092 = var_351_16.localPosition
				var_351_16.localScale = Vector3.New(1, 1, 1)

				arg_348_1:CheckSpriteTmpPos("10092", 2)

				local var_351_18 = var_351_16.childCount

				for iter_351_8 = 0, var_351_18 - 1 do
					local var_351_19 = var_351_16:GetChild(iter_351_8)

					if var_351_19.name == "split_6" or not string.find(var_351_19.name, "split") then
						var_351_19.gameObject:SetActive(true)
					else
						var_351_19.gameObject:SetActive(false)
					end
				end
			end

			local var_351_20 = 0.001

			if var_351_17 <= arg_348_1.time_ and arg_348_1.time_ < var_351_17 + var_351_20 then
				local var_351_21 = (arg_348_1.time_ - var_351_17) / var_351_20
				local var_351_22 = Vector3.New(-389.49, -300, -295)

				var_351_16.localPosition = Vector3.Lerp(arg_348_1.var_.moveOldPos10092, var_351_22, var_351_21)
			end

			if arg_348_1.time_ >= var_351_17 + var_351_20 and arg_348_1.time_ < var_351_17 + var_351_20 + arg_351_0 then
				var_351_16.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_351_23 = 0
			local var_351_24 = 0.65

			if var_351_23 < arg_348_1.time_ and arg_348_1.time_ <= var_351_23 + arg_351_0 then
				arg_348_1.talkMaxDuration = 0
				arg_348_1.dialogCg_.alpha = 1

				arg_348_1.dialog_:SetActive(true)
				SetActive(arg_348_1.leftNameGo_, true)

				local var_351_25 = arg_348_1:FormatText(StoryNameCfg[996].name)

				arg_348_1.leftNameTxt_.text = var_351_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_348_1.leftNameTxt_.transform)

				arg_348_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_348_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_348_1:RecordName(arg_348_1.leftNameTxt_.text)
				SetActive(arg_348_1.iconTrs_.gameObject, false)
				arg_348_1.callingController_:SetSelectedState("normal")

				local var_351_26 = arg_348_1:GetWordFromCfg(413011084)
				local var_351_27 = arg_348_1:FormatText(var_351_26.content)

				arg_348_1.text_.text = var_351_27

				LuaForUtil.ClearLinePrefixSymbol(arg_348_1.text_)

				local var_351_28 = 26
				local var_351_29 = utf8.len(var_351_27)
				local var_351_30 = var_351_28 <= 0 and var_351_24 or var_351_24 * (var_351_29 / var_351_28)

				if var_351_30 > 0 and var_351_24 < var_351_30 then
					arg_348_1.talkMaxDuration = var_351_30

					if var_351_30 + var_351_23 > arg_348_1.duration_ then
						arg_348_1.duration_ = var_351_30 + var_351_23
					end
				end

				arg_348_1.text_.text = var_351_27
				arg_348_1.typewritter.percent = 0

				arg_348_1.typewritter:SetDirty()
				arg_348_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011084", "story_v_out_413011.awb") ~= 0 then
					local var_351_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011084", "story_v_out_413011.awb") / 1000

					if var_351_31 + var_351_23 > arg_348_1.duration_ then
						arg_348_1.duration_ = var_351_31 + var_351_23
					end

					if var_351_26.prefab_name ~= "" and arg_348_1.actors_[var_351_26.prefab_name] ~= nil then
						local var_351_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_348_1.actors_[var_351_26.prefab_name].transform, "story_v_out_413011", "413011084", "story_v_out_413011.awb")

						arg_348_1:RecordAudio("413011084", var_351_32)
						arg_348_1:RecordAudio("413011084", var_351_32)
					else
						arg_348_1:AudioAction("play", "voice", "story_v_out_413011", "413011084", "story_v_out_413011.awb")
					end

					arg_348_1:RecordHistoryTalkVoice("story_v_out_413011", "413011084", "story_v_out_413011.awb")
				end

				arg_348_1:RecordContent(arg_348_1.text_.text)
			end

			local var_351_33 = math.max(var_351_24, arg_348_1.talkMaxDuration)

			if var_351_23 <= arg_348_1.time_ and arg_348_1.time_ < var_351_23 + var_351_33 then
				arg_348_1.typewritter.percent = (arg_348_1.time_ - var_351_23) / var_351_33

				arg_348_1.typewritter:SetDirty()
			end

			if arg_348_1.time_ >= var_351_23 + var_351_33 and arg_348_1.time_ < var_351_23 + var_351_33 + arg_351_0 then
				arg_348_1.typewritter.percent = 1

				arg_348_1.typewritter:SetDirty()
				arg_348_1:ShowNextGo(true)
			end
		end
	end,
	Play413011085 = function(arg_352_0, arg_352_1)
		arg_352_1.time_ = 0
		arg_352_1.frameCnt_ = 0
		arg_352_1.state_ = "playing"
		arg_352_1.curTalkId_ = 413011085
		arg_352_1.duration_ = 3.03

		local var_352_0 = {
			zh = 1.999999999999,
			ja = 3.033
		}
		local var_352_1 = manager.audio:GetLocalizationFlag()

		if var_352_0[var_352_1] ~= nil then
			arg_352_1.duration_ = var_352_0[var_352_1]
		end

		SetActive(arg_352_1.tipsGo_, false)

		function arg_352_1.onSingleLineFinish_()
			arg_352_1.onSingleLineUpdate_ = nil
			arg_352_1.onSingleLineFinish_ = nil
			arg_352_1.state_ = "waiting"
		end

		function arg_352_1.playNext_(arg_354_0)
			if arg_354_0 == 1 then
				arg_352_0:Play413011086(arg_352_1)
			end
		end

		function arg_352_1.onSingleLineUpdate_(arg_355_0)
			local var_355_0 = arg_352_1.actors_["10093"]
			local var_355_1 = 0

			if var_355_1 < arg_352_1.time_ and arg_352_1.time_ <= var_355_1 + arg_355_0 and not isNil(var_355_0) and arg_352_1.var_.actorSpriteComps10093 == nil then
				arg_352_1.var_.actorSpriteComps10093 = var_355_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_355_2 = 2

			if var_355_1 <= arg_352_1.time_ and arg_352_1.time_ < var_355_1 + var_355_2 and not isNil(var_355_0) then
				local var_355_3 = (arg_352_1.time_ - var_355_1) / var_355_2

				if arg_352_1.var_.actorSpriteComps10093 then
					for iter_355_0, iter_355_1 in pairs(arg_352_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_355_1 then
							if arg_352_1.isInRecall_ then
								local var_355_4 = Mathf.Lerp(iter_355_1.color.r, arg_352_1.hightColor1.r, var_355_3)
								local var_355_5 = Mathf.Lerp(iter_355_1.color.g, arg_352_1.hightColor1.g, var_355_3)
								local var_355_6 = Mathf.Lerp(iter_355_1.color.b, arg_352_1.hightColor1.b, var_355_3)

								iter_355_1.color = Color.New(var_355_4, var_355_5, var_355_6)
							else
								local var_355_7 = Mathf.Lerp(iter_355_1.color.r, 1, var_355_3)

								iter_355_1.color = Color.New(var_355_7, var_355_7, var_355_7)
							end
						end
					end
				end
			end

			if arg_352_1.time_ >= var_355_1 + var_355_2 and arg_352_1.time_ < var_355_1 + var_355_2 + arg_355_0 and not isNil(var_355_0) and arg_352_1.var_.actorSpriteComps10093 then
				for iter_355_2, iter_355_3 in pairs(arg_352_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_355_3 then
						if arg_352_1.isInRecall_ then
							iter_355_3.color = arg_352_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_355_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_352_1.var_.actorSpriteComps10093 = nil
			end

			local var_355_8 = arg_352_1.actors_["10092"]
			local var_355_9 = 0

			if var_355_9 < arg_352_1.time_ and arg_352_1.time_ <= var_355_9 + arg_355_0 and not isNil(var_355_8) and arg_352_1.var_.actorSpriteComps10092 == nil then
				arg_352_1.var_.actorSpriteComps10092 = var_355_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_355_10 = 2

			if var_355_9 <= arg_352_1.time_ and arg_352_1.time_ < var_355_9 + var_355_10 and not isNil(var_355_8) then
				local var_355_11 = (arg_352_1.time_ - var_355_9) / var_355_10

				if arg_352_1.var_.actorSpriteComps10092 then
					for iter_355_4, iter_355_5 in pairs(arg_352_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_355_5 then
							if arg_352_1.isInRecall_ then
								local var_355_12 = Mathf.Lerp(iter_355_5.color.r, arg_352_1.hightColor2.r, var_355_11)
								local var_355_13 = Mathf.Lerp(iter_355_5.color.g, arg_352_1.hightColor2.g, var_355_11)
								local var_355_14 = Mathf.Lerp(iter_355_5.color.b, arg_352_1.hightColor2.b, var_355_11)

								iter_355_5.color = Color.New(var_355_12, var_355_13, var_355_14)
							else
								local var_355_15 = Mathf.Lerp(iter_355_5.color.r, 0.5, var_355_11)

								iter_355_5.color = Color.New(var_355_15, var_355_15, var_355_15)
							end
						end
					end
				end
			end

			if arg_352_1.time_ >= var_355_9 + var_355_10 and arg_352_1.time_ < var_355_9 + var_355_10 + arg_355_0 and not isNil(var_355_8) and arg_352_1.var_.actorSpriteComps10092 then
				for iter_355_6, iter_355_7 in pairs(arg_352_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_355_7 then
						if arg_352_1.isInRecall_ then
							iter_355_7.color = arg_352_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_355_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_352_1.var_.actorSpriteComps10092 = nil
			end

			local var_355_16 = 0
			local var_355_17 = 0.125

			if var_355_16 < arg_352_1.time_ and arg_352_1.time_ <= var_355_16 + arg_355_0 then
				arg_352_1.talkMaxDuration = 0
				arg_352_1.dialogCg_.alpha = 1

				arg_352_1.dialog_:SetActive(true)
				SetActive(arg_352_1.leftNameGo_, true)

				local var_355_18 = arg_352_1:FormatText(StoryNameCfg[28].name)

				arg_352_1.leftNameTxt_.text = var_355_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_352_1.leftNameTxt_.transform)

				arg_352_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_352_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_352_1:RecordName(arg_352_1.leftNameTxt_.text)
				SetActive(arg_352_1.iconTrs_.gameObject, false)
				arg_352_1.callingController_:SetSelectedState("normal")

				local var_355_19 = arg_352_1:GetWordFromCfg(413011085)
				local var_355_20 = arg_352_1:FormatText(var_355_19.content)

				arg_352_1.text_.text = var_355_20

				LuaForUtil.ClearLinePrefixSymbol(arg_352_1.text_)

				local var_355_21 = 5
				local var_355_22 = utf8.len(var_355_20)
				local var_355_23 = var_355_21 <= 0 and var_355_17 or var_355_17 * (var_355_22 / var_355_21)

				if var_355_23 > 0 and var_355_17 < var_355_23 then
					arg_352_1.talkMaxDuration = var_355_23

					if var_355_23 + var_355_16 > arg_352_1.duration_ then
						arg_352_1.duration_ = var_355_23 + var_355_16
					end
				end

				arg_352_1.text_.text = var_355_20
				arg_352_1.typewritter.percent = 0

				arg_352_1.typewritter:SetDirty()
				arg_352_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011085", "story_v_out_413011.awb") ~= 0 then
					local var_355_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011085", "story_v_out_413011.awb") / 1000

					if var_355_24 + var_355_16 > arg_352_1.duration_ then
						arg_352_1.duration_ = var_355_24 + var_355_16
					end

					if var_355_19.prefab_name ~= "" and arg_352_1.actors_[var_355_19.prefab_name] ~= nil then
						local var_355_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_352_1.actors_[var_355_19.prefab_name].transform, "story_v_out_413011", "413011085", "story_v_out_413011.awb")

						arg_352_1:RecordAudio("413011085", var_355_25)
						arg_352_1:RecordAudio("413011085", var_355_25)
					else
						arg_352_1:AudioAction("play", "voice", "story_v_out_413011", "413011085", "story_v_out_413011.awb")
					end

					arg_352_1:RecordHistoryTalkVoice("story_v_out_413011", "413011085", "story_v_out_413011.awb")
				end

				arg_352_1:RecordContent(arg_352_1.text_.text)
			end

			local var_355_26 = math.max(var_355_17, arg_352_1.talkMaxDuration)

			if var_355_16 <= arg_352_1.time_ and arg_352_1.time_ < var_355_16 + var_355_26 then
				arg_352_1.typewritter.percent = (arg_352_1.time_ - var_355_16) / var_355_26

				arg_352_1.typewritter:SetDirty()
			end

			if arg_352_1.time_ >= var_355_16 + var_355_26 and arg_352_1.time_ < var_355_16 + var_355_26 + arg_355_0 then
				arg_352_1.typewritter.percent = 1

				arg_352_1.typewritter:SetDirty()
				arg_352_1:ShowNextGo(true)
			end
		end
	end,
	Play413011086 = function(arg_356_0, arg_356_1)
		arg_356_1.time_ = 0
		arg_356_1.frameCnt_ = 0
		arg_356_1.state_ = "playing"
		arg_356_1.curTalkId_ = 413011086
		arg_356_1.duration_ = 4

		local var_356_0 = {
			zh = 4,
			ja = 3.766
		}
		local var_356_1 = manager.audio:GetLocalizationFlag()

		if var_356_0[var_356_1] ~= nil then
			arg_356_1.duration_ = var_356_0[var_356_1]
		end

		SetActive(arg_356_1.tipsGo_, false)

		function arg_356_1.onSingleLineFinish_()
			arg_356_1.onSingleLineUpdate_ = nil
			arg_356_1.onSingleLineFinish_ = nil
			arg_356_1.state_ = "waiting"
		end

		function arg_356_1.playNext_(arg_358_0)
			if arg_358_0 == 1 then
				arg_356_0:Play413011087(arg_356_1)
			end
		end

		function arg_356_1.onSingleLineUpdate_(arg_359_0)
			local var_359_0 = arg_356_1.actors_["10092"].transform
			local var_359_1 = 0

			if var_359_1 < arg_356_1.time_ and arg_356_1.time_ <= var_359_1 + arg_359_0 then
				arg_356_1.var_.moveOldPos10092 = var_359_0.localPosition
				var_359_0.localScale = Vector3.New(1, 1, 1)

				arg_356_1:CheckSpriteTmpPos("10092", 2)

				local var_359_2 = var_359_0.childCount

				for iter_359_0 = 0, var_359_2 - 1 do
					local var_359_3 = var_359_0:GetChild(iter_359_0)

					if var_359_3.name == "split_2" or not string.find(var_359_3.name, "split") then
						var_359_3.gameObject:SetActive(true)
					else
						var_359_3.gameObject:SetActive(false)
					end
				end
			end

			local var_359_4 = 0.001

			if var_359_1 <= arg_356_1.time_ and arg_356_1.time_ < var_359_1 + var_359_4 then
				local var_359_5 = (arg_356_1.time_ - var_359_1) / var_359_4
				local var_359_6 = Vector3.New(-389.49, -300, -295)

				var_359_0.localPosition = Vector3.Lerp(arg_356_1.var_.moveOldPos10092, var_359_6, var_359_5)
			end

			if arg_356_1.time_ >= var_359_1 + var_359_4 and arg_356_1.time_ < var_359_1 + var_359_4 + arg_359_0 then
				var_359_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_359_7 = arg_356_1.actors_["10093"]
			local var_359_8 = 0

			if var_359_8 < arg_356_1.time_ and arg_356_1.time_ <= var_359_8 + arg_359_0 and not isNil(var_359_7) and arg_356_1.var_.actorSpriteComps10093 == nil then
				arg_356_1.var_.actorSpriteComps10093 = var_359_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_359_9 = 2

			if var_359_8 <= arg_356_1.time_ and arg_356_1.time_ < var_359_8 + var_359_9 and not isNil(var_359_7) then
				local var_359_10 = (arg_356_1.time_ - var_359_8) / var_359_9

				if arg_356_1.var_.actorSpriteComps10093 then
					for iter_359_1, iter_359_2 in pairs(arg_356_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_359_2 then
							if arg_356_1.isInRecall_ then
								local var_359_11 = Mathf.Lerp(iter_359_2.color.r, arg_356_1.hightColor2.r, var_359_10)
								local var_359_12 = Mathf.Lerp(iter_359_2.color.g, arg_356_1.hightColor2.g, var_359_10)
								local var_359_13 = Mathf.Lerp(iter_359_2.color.b, arg_356_1.hightColor2.b, var_359_10)

								iter_359_2.color = Color.New(var_359_11, var_359_12, var_359_13)
							else
								local var_359_14 = Mathf.Lerp(iter_359_2.color.r, 0.5, var_359_10)

								iter_359_2.color = Color.New(var_359_14, var_359_14, var_359_14)
							end
						end
					end
				end
			end

			if arg_356_1.time_ >= var_359_8 + var_359_9 and arg_356_1.time_ < var_359_8 + var_359_9 + arg_359_0 and not isNil(var_359_7) and arg_356_1.var_.actorSpriteComps10093 then
				for iter_359_3, iter_359_4 in pairs(arg_356_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_359_4 then
						if arg_356_1.isInRecall_ then
							iter_359_4.color = arg_356_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_359_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_356_1.var_.actorSpriteComps10093 = nil
			end

			local var_359_15 = arg_356_1.actors_["10092"]
			local var_359_16 = 0

			if var_359_16 < arg_356_1.time_ and arg_356_1.time_ <= var_359_16 + arg_359_0 and not isNil(var_359_15) and arg_356_1.var_.actorSpriteComps10092 == nil then
				arg_356_1.var_.actorSpriteComps10092 = var_359_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_359_17 = 2

			if var_359_16 <= arg_356_1.time_ and arg_356_1.time_ < var_359_16 + var_359_17 and not isNil(var_359_15) then
				local var_359_18 = (arg_356_1.time_ - var_359_16) / var_359_17

				if arg_356_1.var_.actorSpriteComps10092 then
					for iter_359_5, iter_359_6 in pairs(arg_356_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_359_6 then
							if arg_356_1.isInRecall_ then
								local var_359_19 = Mathf.Lerp(iter_359_6.color.r, arg_356_1.hightColor1.r, var_359_18)
								local var_359_20 = Mathf.Lerp(iter_359_6.color.g, arg_356_1.hightColor1.g, var_359_18)
								local var_359_21 = Mathf.Lerp(iter_359_6.color.b, arg_356_1.hightColor1.b, var_359_18)

								iter_359_6.color = Color.New(var_359_19, var_359_20, var_359_21)
							else
								local var_359_22 = Mathf.Lerp(iter_359_6.color.r, 1, var_359_18)

								iter_359_6.color = Color.New(var_359_22, var_359_22, var_359_22)
							end
						end
					end
				end
			end

			if arg_356_1.time_ >= var_359_16 + var_359_17 and arg_356_1.time_ < var_359_16 + var_359_17 + arg_359_0 and not isNil(var_359_15) and arg_356_1.var_.actorSpriteComps10092 then
				for iter_359_7, iter_359_8 in pairs(arg_356_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_359_8 then
						if arg_356_1.isInRecall_ then
							iter_359_8.color = arg_356_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_359_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_356_1.var_.actorSpriteComps10092 = nil
			end

			local var_359_23 = 0
			local var_359_24 = 0.425

			if var_359_23 < arg_356_1.time_ and arg_356_1.time_ <= var_359_23 + arg_359_0 then
				arg_356_1.talkMaxDuration = 0
				arg_356_1.dialogCg_.alpha = 1

				arg_356_1.dialog_:SetActive(true)
				SetActive(arg_356_1.leftNameGo_, true)

				local var_359_25 = arg_356_1:FormatText(StoryNameCfg[996].name)

				arg_356_1.leftNameTxt_.text = var_359_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_356_1.leftNameTxt_.transform)

				arg_356_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_356_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_356_1:RecordName(arg_356_1.leftNameTxt_.text)
				SetActive(arg_356_1.iconTrs_.gameObject, false)
				arg_356_1.callingController_:SetSelectedState("normal")

				local var_359_26 = arg_356_1:GetWordFromCfg(413011086)
				local var_359_27 = arg_356_1:FormatText(var_359_26.content)

				arg_356_1.text_.text = var_359_27

				LuaForUtil.ClearLinePrefixSymbol(arg_356_1.text_)

				local var_359_28 = 17
				local var_359_29 = utf8.len(var_359_27)
				local var_359_30 = var_359_28 <= 0 and var_359_24 or var_359_24 * (var_359_29 / var_359_28)

				if var_359_30 > 0 and var_359_24 < var_359_30 then
					arg_356_1.talkMaxDuration = var_359_30

					if var_359_30 + var_359_23 > arg_356_1.duration_ then
						arg_356_1.duration_ = var_359_30 + var_359_23
					end
				end

				arg_356_1.text_.text = var_359_27
				arg_356_1.typewritter.percent = 0

				arg_356_1.typewritter:SetDirty()
				arg_356_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011086", "story_v_out_413011.awb") ~= 0 then
					local var_359_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011086", "story_v_out_413011.awb") / 1000

					if var_359_31 + var_359_23 > arg_356_1.duration_ then
						arg_356_1.duration_ = var_359_31 + var_359_23
					end

					if var_359_26.prefab_name ~= "" and arg_356_1.actors_[var_359_26.prefab_name] ~= nil then
						local var_359_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_356_1.actors_[var_359_26.prefab_name].transform, "story_v_out_413011", "413011086", "story_v_out_413011.awb")

						arg_356_1:RecordAudio("413011086", var_359_32)
						arg_356_1:RecordAudio("413011086", var_359_32)
					else
						arg_356_1:AudioAction("play", "voice", "story_v_out_413011", "413011086", "story_v_out_413011.awb")
					end

					arg_356_1:RecordHistoryTalkVoice("story_v_out_413011", "413011086", "story_v_out_413011.awb")
				end

				arg_356_1:RecordContent(arg_356_1.text_.text)
			end

			local var_359_33 = math.max(var_359_24, arg_356_1.talkMaxDuration)

			if var_359_23 <= arg_356_1.time_ and arg_356_1.time_ < var_359_23 + var_359_33 then
				arg_356_1.typewritter.percent = (arg_356_1.time_ - var_359_23) / var_359_33

				arg_356_1.typewritter:SetDirty()
			end

			if arg_356_1.time_ >= var_359_23 + var_359_33 and arg_356_1.time_ < var_359_23 + var_359_33 + arg_359_0 then
				arg_356_1.typewritter.percent = 1

				arg_356_1.typewritter:SetDirty()
				arg_356_1:ShowNextGo(true)
			end
		end
	end,
	Play413011087 = function(arg_360_0, arg_360_1)
		arg_360_1.time_ = 0
		arg_360_1.frameCnt_ = 0
		arg_360_1.state_ = "playing"
		arg_360_1.curTalkId_ = 413011087
		arg_360_1.duration_ = 5.6

		local var_360_0 = {
			zh = 5.6,
			ja = 3.866
		}
		local var_360_1 = manager.audio:GetLocalizationFlag()

		if var_360_0[var_360_1] ~= nil then
			arg_360_1.duration_ = var_360_0[var_360_1]
		end

		SetActive(arg_360_1.tipsGo_, false)

		function arg_360_1.onSingleLineFinish_()
			arg_360_1.onSingleLineUpdate_ = nil
			arg_360_1.onSingleLineFinish_ = nil
			arg_360_1.state_ = "waiting"
		end

		function arg_360_1.playNext_(arg_362_0)
			if arg_362_0 == 1 then
				arg_360_0:Play413011088(arg_360_1)
			end
		end

		function arg_360_1.onSingleLineUpdate_(arg_363_0)
			local var_363_0 = 0
			local var_363_1 = 0.825

			if var_363_0 < arg_360_1.time_ and arg_360_1.time_ <= var_363_0 + arg_363_0 then
				arg_360_1.talkMaxDuration = 0
				arg_360_1.dialogCg_.alpha = 1

				arg_360_1.dialog_:SetActive(true)
				SetActive(arg_360_1.leftNameGo_, true)

				local var_363_2 = arg_360_1:FormatText(StoryNameCfg[996].name)

				arg_360_1.leftNameTxt_.text = var_363_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_360_1.leftNameTxt_.transform)

				arg_360_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_360_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_360_1:RecordName(arg_360_1.leftNameTxt_.text)
				SetActive(arg_360_1.iconTrs_.gameObject, false)
				arg_360_1.callingController_:SetSelectedState("normal")

				local var_363_3 = arg_360_1:GetWordFromCfg(413011087)
				local var_363_4 = arg_360_1:FormatText(var_363_3.content)

				arg_360_1.text_.text = var_363_4

				LuaForUtil.ClearLinePrefixSymbol(arg_360_1.text_)

				local var_363_5 = 33
				local var_363_6 = utf8.len(var_363_4)
				local var_363_7 = var_363_5 <= 0 and var_363_1 or var_363_1 * (var_363_6 / var_363_5)

				if var_363_7 > 0 and var_363_1 < var_363_7 then
					arg_360_1.talkMaxDuration = var_363_7

					if var_363_7 + var_363_0 > arg_360_1.duration_ then
						arg_360_1.duration_ = var_363_7 + var_363_0
					end
				end

				arg_360_1.text_.text = var_363_4
				arg_360_1.typewritter.percent = 0

				arg_360_1.typewritter:SetDirty()
				arg_360_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011087", "story_v_out_413011.awb") ~= 0 then
					local var_363_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011087", "story_v_out_413011.awb") / 1000

					if var_363_8 + var_363_0 > arg_360_1.duration_ then
						arg_360_1.duration_ = var_363_8 + var_363_0
					end

					if var_363_3.prefab_name ~= "" and arg_360_1.actors_[var_363_3.prefab_name] ~= nil then
						local var_363_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_360_1.actors_[var_363_3.prefab_name].transform, "story_v_out_413011", "413011087", "story_v_out_413011.awb")

						arg_360_1:RecordAudio("413011087", var_363_9)
						arg_360_1:RecordAudio("413011087", var_363_9)
					else
						arg_360_1:AudioAction("play", "voice", "story_v_out_413011", "413011087", "story_v_out_413011.awb")
					end

					arg_360_1:RecordHistoryTalkVoice("story_v_out_413011", "413011087", "story_v_out_413011.awb")
				end

				arg_360_1:RecordContent(arg_360_1.text_.text)
			end

			local var_363_10 = math.max(var_363_1, arg_360_1.talkMaxDuration)

			if var_363_0 <= arg_360_1.time_ and arg_360_1.time_ < var_363_0 + var_363_10 then
				arg_360_1.typewritter.percent = (arg_360_1.time_ - var_363_0) / var_363_10

				arg_360_1.typewritter:SetDirty()
			end

			if arg_360_1.time_ >= var_363_0 + var_363_10 and arg_360_1.time_ < var_363_0 + var_363_10 + arg_363_0 then
				arg_360_1.typewritter.percent = 1

				arg_360_1.typewritter:SetDirty()
				arg_360_1:ShowNextGo(true)
			end
		end
	end,
	Play413011088 = function(arg_364_0, arg_364_1)
		arg_364_1.time_ = 0
		arg_364_1.frameCnt_ = 0
		arg_364_1.state_ = "playing"
		arg_364_1.curTalkId_ = 413011088
		arg_364_1.duration_ = 2.5

		local var_364_0 = {
			zh = 2.5,
			ja = 1.999999999999
		}
		local var_364_1 = manager.audio:GetLocalizationFlag()

		if var_364_0[var_364_1] ~= nil then
			arg_364_1.duration_ = var_364_0[var_364_1]
		end

		SetActive(arg_364_1.tipsGo_, false)

		function arg_364_1.onSingleLineFinish_()
			arg_364_1.onSingleLineUpdate_ = nil
			arg_364_1.onSingleLineFinish_ = nil
			arg_364_1.state_ = "waiting"
		end

		function arg_364_1.playNext_(arg_366_0)
			if arg_366_0 == 1 then
				arg_364_0:Play413011089(arg_364_1)
			end
		end

		function arg_364_1.onSingleLineUpdate_(arg_367_0)
			local var_367_0 = arg_364_1.actors_["10093"].transform
			local var_367_1 = 0

			if var_367_1 < arg_364_1.time_ and arg_364_1.time_ <= var_367_1 + arg_367_0 then
				arg_364_1.var_.moveOldPos10093 = var_367_0.localPosition
				var_367_0.localScale = Vector3.New(1, 1, 1)

				arg_364_1:CheckSpriteTmpPos("10093", 4)

				local var_367_2 = var_367_0.childCount

				for iter_367_0 = 0, var_367_2 - 1 do
					local var_367_3 = var_367_0:GetChild(iter_367_0)

					if var_367_3.name == "split_1" or not string.find(var_367_3.name, "split") then
						var_367_3.gameObject:SetActive(true)
					else
						var_367_3.gameObject:SetActive(false)
					end
				end
			end

			local var_367_4 = 0.001

			if var_367_1 <= arg_364_1.time_ and arg_364_1.time_ < var_367_1 + var_367_4 then
				local var_367_5 = (arg_364_1.time_ - var_367_1) / var_367_4
				local var_367_6 = Vector3.New(390, -345, -245)

				var_367_0.localPosition = Vector3.Lerp(arg_364_1.var_.moveOldPos10093, var_367_6, var_367_5)
			end

			if arg_364_1.time_ >= var_367_1 + var_367_4 and arg_364_1.time_ < var_367_1 + var_367_4 + arg_367_0 then
				var_367_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_367_7 = arg_364_1.actors_["10093"]
			local var_367_8 = 0

			if var_367_8 < arg_364_1.time_ and arg_364_1.time_ <= var_367_8 + arg_367_0 and not isNil(var_367_7) and arg_364_1.var_.actorSpriteComps10093 == nil then
				arg_364_1.var_.actorSpriteComps10093 = var_367_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_367_9 = 2

			if var_367_8 <= arg_364_1.time_ and arg_364_1.time_ < var_367_8 + var_367_9 and not isNil(var_367_7) then
				local var_367_10 = (arg_364_1.time_ - var_367_8) / var_367_9

				if arg_364_1.var_.actorSpriteComps10093 then
					for iter_367_1, iter_367_2 in pairs(arg_364_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_367_2 then
							if arg_364_1.isInRecall_ then
								local var_367_11 = Mathf.Lerp(iter_367_2.color.r, arg_364_1.hightColor1.r, var_367_10)
								local var_367_12 = Mathf.Lerp(iter_367_2.color.g, arg_364_1.hightColor1.g, var_367_10)
								local var_367_13 = Mathf.Lerp(iter_367_2.color.b, arg_364_1.hightColor1.b, var_367_10)

								iter_367_2.color = Color.New(var_367_11, var_367_12, var_367_13)
							else
								local var_367_14 = Mathf.Lerp(iter_367_2.color.r, 1, var_367_10)

								iter_367_2.color = Color.New(var_367_14, var_367_14, var_367_14)
							end
						end
					end
				end
			end

			if arg_364_1.time_ >= var_367_8 + var_367_9 and arg_364_1.time_ < var_367_8 + var_367_9 + arg_367_0 and not isNil(var_367_7) and arg_364_1.var_.actorSpriteComps10093 then
				for iter_367_3, iter_367_4 in pairs(arg_364_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_367_4 then
						if arg_364_1.isInRecall_ then
							iter_367_4.color = arg_364_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_367_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_364_1.var_.actorSpriteComps10093 = nil
			end

			local var_367_15 = arg_364_1.actors_["10092"]
			local var_367_16 = 0

			if var_367_16 < arg_364_1.time_ and arg_364_1.time_ <= var_367_16 + arg_367_0 and not isNil(var_367_15) and arg_364_1.var_.actorSpriteComps10092 == nil then
				arg_364_1.var_.actorSpriteComps10092 = var_367_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_367_17 = 2

			if var_367_16 <= arg_364_1.time_ and arg_364_1.time_ < var_367_16 + var_367_17 and not isNil(var_367_15) then
				local var_367_18 = (arg_364_1.time_ - var_367_16) / var_367_17

				if arg_364_1.var_.actorSpriteComps10092 then
					for iter_367_5, iter_367_6 in pairs(arg_364_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_367_6 then
							if arg_364_1.isInRecall_ then
								local var_367_19 = Mathf.Lerp(iter_367_6.color.r, arg_364_1.hightColor2.r, var_367_18)
								local var_367_20 = Mathf.Lerp(iter_367_6.color.g, arg_364_1.hightColor2.g, var_367_18)
								local var_367_21 = Mathf.Lerp(iter_367_6.color.b, arg_364_1.hightColor2.b, var_367_18)

								iter_367_6.color = Color.New(var_367_19, var_367_20, var_367_21)
							else
								local var_367_22 = Mathf.Lerp(iter_367_6.color.r, 0.5, var_367_18)

								iter_367_6.color = Color.New(var_367_22, var_367_22, var_367_22)
							end
						end
					end
				end
			end

			if arg_364_1.time_ >= var_367_16 + var_367_17 and arg_364_1.time_ < var_367_16 + var_367_17 + arg_367_0 and not isNil(var_367_15) and arg_364_1.var_.actorSpriteComps10092 then
				for iter_367_7, iter_367_8 in pairs(arg_364_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_367_8 then
						if arg_364_1.isInRecall_ then
							iter_367_8.color = arg_364_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_367_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_364_1.var_.actorSpriteComps10092 = nil
			end

			local var_367_23 = 0
			local var_367_24 = 0.2

			if var_367_23 < arg_364_1.time_ and arg_364_1.time_ <= var_367_23 + arg_367_0 then
				arg_364_1.talkMaxDuration = 0
				arg_364_1.dialogCg_.alpha = 1

				arg_364_1.dialog_:SetActive(true)
				SetActive(arg_364_1.leftNameGo_, true)

				local var_367_25 = arg_364_1:FormatText(StoryNameCfg[28].name)

				arg_364_1.leftNameTxt_.text = var_367_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_364_1.leftNameTxt_.transform)

				arg_364_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_364_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_364_1:RecordName(arg_364_1.leftNameTxt_.text)
				SetActive(arg_364_1.iconTrs_.gameObject, false)
				arg_364_1.callingController_:SetSelectedState("normal")

				local var_367_26 = arg_364_1:GetWordFromCfg(413011088)
				local var_367_27 = arg_364_1:FormatText(var_367_26.content)

				arg_364_1.text_.text = var_367_27

				LuaForUtil.ClearLinePrefixSymbol(arg_364_1.text_)

				local var_367_28 = 8
				local var_367_29 = utf8.len(var_367_27)
				local var_367_30 = var_367_28 <= 0 and var_367_24 or var_367_24 * (var_367_29 / var_367_28)

				if var_367_30 > 0 and var_367_24 < var_367_30 then
					arg_364_1.talkMaxDuration = var_367_30

					if var_367_30 + var_367_23 > arg_364_1.duration_ then
						arg_364_1.duration_ = var_367_30 + var_367_23
					end
				end

				arg_364_1.text_.text = var_367_27
				arg_364_1.typewritter.percent = 0

				arg_364_1.typewritter:SetDirty()
				arg_364_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011088", "story_v_out_413011.awb") ~= 0 then
					local var_367_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011088", "story_v_out_413011.awb") / 1000

					if var_367_31 + var_367_23 > arg_364_1.duration_ then
						arg_364_1.duration_ = var_367_31 + var_367_23
					end

					if var_367_26.prefab_name ~= "" and arg_364_1.actors_[var_367_26.prefab_name] ~= nil then
						local var_367_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_364_1.actors_[var_367_26.prefab_name].transform, "story_v_out_413011", "413011088", "story_v_out_413011.awb")

						arg_364_1:RecordAudio("413011088", var_367_32)
						arg_364_1:RecordAudio("413011088", var_367_32)
					else
						arg_364_1:AudioAction("play", "voice", "story_v_out_413011", "413011088", "story_v_out_413011.awb")
					end

					arg_364_1:RecordHistoryTalkVoice("story_v_out_413011", "413011088", "story_v_out_413011.awb")
				end

				arg_364_1:RecordContent(arg_364_1.text_.text)
			end

			local var_367_33 = math.max(var_367_24, arg_364_1.talkMaxDuration)

			if var_367_23 <= arg_364_1.time_ and arg_364_1.time_ < var_367_23 + var_367_33 then
				arg_364_1.typewritter.percent = (arg_364_1.time_ - var_367_23) / var_367_33

				arg_364_1.typewritter:SetDirty()
			end

			if arg_364_1.time_ >= var_367_23 + var_367_33 and arg_364_1.time_ < var_367_23 + var_367_33 + arg_367_0 then
				arg_364_1.typewritter.percent = 1

				arg_364_1.typewritter:SetDirty()
				arg_364_1:ShowNextGo(true)
			end
		end
	end,
	Play413011089 = function(arg_368_0, arg_368_1)
		arg_368_1.time_ = 0
		arg_368_1.frameCnt_ = 0
		arg_368_1.state_ = "playing"
		arg_368_1.curTalkId_ = 413011089
		arg_368_1.duration_ = 2

		SetActive(arg_368_1.tipsGo_, false)

		function arg_368_1.onSingleLineFinish_()
			arg_368_1.onSingleLineUpdate_ = nil
			arg_368_1.onSingleLineFinish_ = nil
			arg_368_1.state_ = "waiting"
		end

		function arg_368_1.playNext_(arg_370_0)
			if arg_370_0 == 1 then
				arg_368_0:Play413011090(arg_368_1)
			end
		end

		function arg_368_1.onSingleLineUpdate_(arg_371_0)
			local var_371_0 = arg_368_1.actors_["10092"].transform
			local var_371_1 = 0

			if var_371_1 < arg_368_1.time_ and arg_368_1.time_ <= var_371_1 + arg_371_0 then
				arg_368_1.var_.moveOldPos10092 = var_371_0.localPosition
				var_371_0.localScale = Vector3.New(1, 1, 1)

				arg_368_1:CheckSpriteTmpPos("10092", 2)

				local var_371_2 = var_371_0.childCount

				for iter_371_0 = 0, var_371_2 - 1 do
					local var_371_3 = var_371_0:GetChild(iter_371_0)

					if var_371_3.name == "" or not string.find(var_371_3.name, "split") then
						var_371_3.gameObject:SetActive(true)
					else
						var_371_3.gameObject:SetActive(false)
					end
				end
			end

			local var_371_4 = 0.001

			if var_371_1 <= arg_368_1.time_ and arg_368_1.time_ < var_371_1 + var_371_4 then
				local var_371_5 = (arg_368_1.time_ - var_371_1) / var_371_4
				local var_371_6 = Vector3.New(-389.49, -300, -295)

				var_371_0.localPosition = Vector3.Lerp(arg_368_1.var_.moveOldPos10092, var_371_6, var_371_5)
			end

			if arg_368_1.time_ >= var_371_1 + var_371_4 and arg_368_1.time_ < var_371_1 + var_371_4 + arg_371_0 then
				var_371_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_371_7 = arg_368_1.actors_["10093"]
			local var_371_8 = 0

			if var_371_8 < arg_368_1.time_ and arg_368_1.time_ <= var_371_8 + arg_371_0 and not isNil(var_371_7) and arg_368_1.var_.actorSpriteComps10093 == nil then
				arg_368_1.var_.actorSpriteComps10093 = var_371_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_371_9 = 2

			if var_371_8 <= arg_368_1.time_ and arg_368_1.time_ < var_371_8 + var_371_9 and not isNil(var_371_7) then
				local var_371_10 = (arg_368_1.time_ - var_371_8) / var_371_9

				if arg_368_1.var_.actorSpriteComps10093 then
					for iter_371_1, iter_371_2 in pairs(arg_368_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_371_2 then
							if arg_368_1.isInRecall_ then
								local var_371_11 = Mathf.Lerp(iter_371_2.color.r, arg_368_1.hightColor2.r, var_371_10)
								local var_371_12 = Mathf.Lerp(iter_371_2.color.g, arg_368_1.hightColor2.g, var_371_10)
								local var_371_13 = Mathf.Lerp(iter_371_2.color.b, arg_368_1.hightColor2.b, var_371_10)

								iter_371_2.color = Color.New(var_371_11, var_371_12, var_371_13)
							else
								local var_371_14 = Mathf.Lerp(iter_371_2.color.r, 0.5, var_371_10)

								iter_371_2.color = Color.New(var_371_14, var_371_14, var_371_14)
							end
						end
					end
				end
			end

			if arg_368_1.time_ >= var_371_8 + var_371_9 and arg_368_1.time_ < var_371_8 + var_371_9 + arg_371_0 and not isNil(var_371_7) and arg_368_1.var_.actorSpriteComps10093 then
				for iter_371_3, iter_371_4 in pairs(arg_368_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_371_4 then
						if arg_368_1.isInRecall_ then
							iter_371_4.color = arg_368_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_371_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_368_1.var_.actorSpriteComps10093 = nil
			end

			local var_371_15 = arg_368_1.actors_["10092"]
			local var_371_16 = 0

			if var_371_16 < arg_368_1.time_ and arg_368_1.time_ <= var_371_16 + arg_371_0 and not isNil(var_371_15) and arg_368_1.var_.actorSpriteComps10092 == nil then
				arg_368_1.var_.actorSpriteComps10092 = var_371_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_371_17 = 2

			if var_371_16 <= arg_368_1.time_ and arg_368_1.time_ < var_371_16 + var_371_17 and not isNil(var_371_15) then
				local var_371_18 = (arg_368_1.time_ - var_371_16) / var_371_17

				if arg_368_1.var_.actorSpriteComps10092 then
					for iter_371_5, iter_371_6 in pairs(arg_368_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_371_6 then
							if arg_368_1.isInRecall_ then
								local var_371_19 = Mathf.Lerp(iter_371_6.color.r, arg_368_1.hightColor1.r, var_371_18)
								local var_371_20 = Mathf.Lerp(iter_371_6.color.g, arg_368_1.hightColor1.g, var_371_18)
								local var_371_21 = Mathf.Lerp(iter_371_6.color.b, arg_368_1.hightColor1.b, var_371_18)

								iter_371_6.color = Color.New(var_371_19, var_371_20, var_371_21)
							else
								local var_371_22 = Mathf.Lerp(iter_371_6.color.r, 1, var_371_18)

								iter_371_6.color = Color.New(var_371_22, var_371_22, var_371_22)
							end
						end
					end
				end
			end

			if arg_368_1.time_ >= var_371_16 + var_371_17 and arg_368_1.time_ < var_371_16 + var_371_17 + arg_371_0 and not isNil(var_371_15) and arg_368_1.var_.actorSpriteComps10092 then
				for iter_371_7, iter_371_8 in pairs(arg_368_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_371_8 then
						if arg_368_1.isInRecall_ then
							iter_371_8.color = arg_368_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_371_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_368_1.var_.actorSpriteComps10092 = nil
			end

			local var_371_23 = 0
			local var_371_24 = 0.15

			if var_371_23 < arg_368_1.time_ and arg_368_1.time_ <= var_371_23 + arg_371_0 then
				arg_368_1.talkMaxDuration = 0
				arg_368_1.dialogCg_.alpha = 1

				arg_368_1.dialog_:SetActive(true)
				SetActive(arg_368_1.leftNameGo_, true)

				local var_371_25 = arg_368_1:FormatText(StoryNameCfg[996].name)

				arg_368_1.leftNameTxt_.text = var_371_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_368_1.leftNameTxt_.transform)

				arg_368_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_368_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_368_1:RecordName(arg_368_1.leftNameTxt_.text)
				SetActive(arg_368_1.iconTrs_.gameObject, false)
				arg_368_1.callingController_:SetSelectedState("normal")

				local var_371_26 = arg_368_1:GetWordFromCfg(413011089)
				local var_371_27 = arg_368_1:FormatText(var_371_26.content)

				arg_368_1.text_.text = var_371_27

				LuaForUtil.ClearLinePrefixSymbol(arg_368_1.text_)

				local var_371_28 = 6
				local var_371_29 = utf8.len(var_371_27)
				local var_371_30 = var_371_28 <= 0 and var_371_24 or var_371_24 * (var_371_29 / var_371_28)

				if var_371_30 > 0 and var_371_24 < var_371_30 then
					arg_368_1.talkMaxDuration = var_371_30

					if var_371_30 + var_371_23 > arg_368_1.duration_ then
						arg_368_1.duration_ = var_371_30 + var_371_23
					end
				end

				arg_368_1.text_.text = var_371_27
				arg_368_1.typewritter.percent = 0

				arg_368_1.typewritter:SetDirty()
				arg_368_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011089", "story_v_out_413011.awb") ~= 0 then
					local var_371_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011089", "story_v_out_413011.awb") / 1000

					if var_371_31 + var_371_23 > arg_368_1.duration_ then
						arg_368_1.duration_ = var_371_31 + var_371_23
					end

					if var_371_26.prefab_name ~= "" and arg_368_1.actors_[var_371_26.prefab_name] ~= nil then
						local var_371_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_368_1.actors_[var_371_26.prefab_name].transform, "story_v_out_413011", "413011089", "story_v_out_413011.awb")

						arg_368_1:RecordAudio("413011089", var_371_32)
						arg_368_1:RecordAudio("413011089", var_371_32)
					else
						arg_368_1:AudioAction("play", "voice", "story_v_out_413011", "413011089", "story_v_out_413011.awb")
					end

					arg_368_1:RecordHistoryTalkVoice("story_v_out_413011", "413011089", "story_v_out_413011.awb")
				end

				arg_368_1:RecordContent(arg_368_1.text_.text)
			end

			local var_371_33 = math.max(var_371_24, arg_368_1.talkMaxDuration)

			if var_371_23 <= arg_368_1.time_ and arg_368_1.time_ < var_371_23 + var_371_33 then
				arg_368_1.typewritter.percent = (arg_368_1.time_ - var_371_23) / var_371_33

				arg_368_1.typewritter:SetDirty()
			end

			if arg_368_1.time_ >= var_371_23 + var_371_33 and arg_368_1.time_ < var_371_23 + var_371_33 + arg_371_0 then
				arg_368_1.typewritter.percent = 1

				arg_368_1.typewritter:SetDirty()
				arg_368_1:ShowNextGo(true)
			end
		end
	end,
	Play413011090 = function(arg_372_0, arg_372_1)
		arg_372_1.time_ = 0
		arg_372_1.frameCnt_ = 0
		arg_372_1.state_ = "playing"
		arg_372_1.curTalkId_ = 413011090
		arg_372_1.duration_ = 2

		SetActive(arg_372_1.tipsGo_, false)

		function arg_372_1.onSingleLineFinish_()
			arg_372_1.onSingleLineUpdate_ = nil
			arg_372_1.onSingleLineFinish_ = nil
			arg_372_1.state_ = "waiting"
		end

		function arg_372_1.playNext_(arg_374_0)
			if arg_374_0 == 1 then
				arg_372_0:Play413011091(arg_372_1)
			end
		end

		function arg_372_1.onSingleLineUpdate_(arg_375_0)
			local var_375_0 = arg_372_1.actors_["10093"]
			local var_375_1 = 0

			if var_375_1 < arg_372_1.time_ and arg_372_1.time_ <= var_375_1 + arg_375_0 and not isNil(var_375_0) and arg_372_1.var_.actorSpriteComps10093 == nil then
				arg_372_1.var_.actorSpriteComps10093 = var_375_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_375_2 = 2

			if var_375_1 <= arg_372_1.time_ and arg_372_1.time_ < var_375_1 + var_375_2 and not isNil(var_375_0) then
				local var_375_3 = (arg_372_1.time_ - var_375_1) / var_375_2

				if arg_372_1.var_.actorSpriteComps10093 then
					for iter_375_0, iter_375_1 in pairs(arg_372_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_375_1 then
							if arg_372_1.isInRecall_ then
								local var_375_4 = Mathf.Lerp(iter_375_1.color.r, arg_372_1.hightColor1.r, var_375_3)
								local var_375_5 = Mathf.Lerp(iter_375_1.color.g, arg_372_1.hightColor1.g, var_375_3)
								local var_375_6 = Mathf.Lerp(iter_375_1.color.b, arg_372_1.hightColor1.b, var_375_3)

								iter_375_1.color = Color.New(var_375_4, var_375_5, var_375_6)
							else
								local var_375_7 = Mathf.Lerp(iter_375_1.color.r, 1, var_375_3)

								iter_375_1.color = Color.New(var_375_7, var_375_7, var_375_7)
							end
						end
					end
				end
			end

			if arg_372_1.time_ >= var_375_1 + var_375_2 and arg_372_1.time_ < var_375_1 + var_375_2 + arg_375_0 and not isNil(var_375_0) and arg_372_1.var_.actorSpriteComps10093 then
				for iter_375_2, iter_375_3 in pairs(arg_372_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_375_3 then
						if arg_372_1.isInRecall_ then
							iter_375_3.color = arg_372_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_375_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_372_1.var_.actorSpriteComps10093 = nil
			end

			local var_375_8 = arg_372_1.actors_["10092"]
			local var_375_9 = 0

			if var_375_9 < arg_372_1.time_ and arg_372_1.time_ <= var_375_9 + arg_375_0 and not isNil(var_375_8) and arg_372_1.var_.actorSpriteComps10092 == nil then
				arg_372_1.var_.actorSpriteComps10092 = var_375_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_375_10 = 2

			if var_375_9 <= arg_372_1.time_ and arg_372_1.time_ < var_375_9 + var_375_10 and not isNil(var_375_8) then
				local var_375_11 = (arg_372_1.time_ - var_375_9) / var_375_10

				if arg_372_1.var_.actorSpriteComps10092 then
					for iter_375_4, iter_375_5 in pairs(arg_372_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_375_5 then
							if arg_372_1.isInRecall_ then
								local var_375_12 = Mathf.Lerp(iter_375_5.color.r, arg_372_1.hightColor2.r, var_375_11)
								local var_375_13 = Mathf.Lerp(iter_375_5.color.g, arg_372_1.hightColor2.g, var_375_11)
								local var_375_14 = Mathf.Lerp(iter_375_5.color.b, arg_372_1.hightColor2.b, var_375_11)

								iter_375_5.color = Color.New(var_375_12, var_375_13, var_375_14)
							else
								local var_375_15 = Mathf.Lerp(iter_375_5.color.r, 0.5, var_375_11)

								iter_375_5.color = Color.New(var_375_15, var_375_15, var_375_15)
							end
						end
					end
				end
			end

			if arg_372_1.time_ >= var_375_9 + var_375_10 and arg_372_1.time_ < var_375_9 + var_375_10 + arg_375_0 and not isNil(var_375_8) and arg_372_1.var_.actorSpriteComps10092 then
				for iter_375_6, iter_375_7 in pairs(arg_372_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_375_7 then
						if arg_372_1.isInRecall_ then
							iter_375_7.color = arg_372_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_375_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_372_1.var_.actorSpriteComps10092 = nil
			end

			local var_375_16 = 0
			local var_375_17 = 0.1

			if var_375_16 < arg_372_1.time_ and arg_372_1.time_ <= var_375_16 + arg_375_0 then
				arg_372_1.talkMaxDuration = 0
				arg_372_1.dialogCg_.alpha = 1

				arg_372_1.dialog_:SetActive(true)
				SetActive(arg_372_1.leftNameGo_, true)

				local var_375_18 = arg_372_1:FormatText(StoryNameCfg[28].name)

				arg_372_1.leftNameTxt_.text = var_375_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_372_1.leftNameTxt_.transform)

				arg_372_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_372_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_372_1:RecordName(arg_372_1.leftNameTxt_.text)
				SetActive(arg_372_1.iconTrs_.gameObject, false)
				arg_372_1.callingController_:SetSelectedState("normal")

				local var_375_19 = arg_372_1:GetWordFromCfg(413011090)
				local var_375_20 = arg_372_1:FormatText(var_375_19.content)

				arg_372_1.text_.text = var_375_20

				LuaForUtil.ClearLinePrefixSymbol(arg_372_1.text_)

				local var_375_21 = 4
				local var_375_22 = utf8.len(var_375_20)
				local var_375_23 = var_375_21 <= 0 and var_375_17 or var_375_17 * (var_375_22 / var_375_21)

				if var_375_23 > 0 and var_375_17 < var_375_23 then
					arg_372_1.talkMaxDuration = var_375_23

					if var_375_23 + var_375_16 > arg_372_1.duration_ then
						arg_372_1.duration_ = var_375_23 + var_375_16
					end
				end

				arg_372_1.text_.text = var_375_20
				arg_372_1.typewritter.percent = 0

				arg_372_1.typewritter:SetDirty()
				arg_372_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011090", "story_v_out_413011.awb") ~= 0 then
					local var_375_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011090", "story_v_out_413011.awb") / 1000

					if var_375_24 + var_375_16 > arg_372_1.duration_ then
						arg_372_1.duration_ = var_375_24 + var_375_16
					end

					if var_375_19.prefab_name ~= "" and arg_372_1.actors_[var_375_19.prefab_name] ~= nil then
						local var_375_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_372_1.actors_[var_375_19.prefab_name].transform, "story_v_out_413011", "413011090", "story_v_out_413011.awb")

						arg_372_1:RecordAudio("413011090", var_375_25)
						arg_372_1:RecordAudio("413011090", var_375_25)
					else
						arg_372_1:AudioAction("play", "voice", "story_v_out_413011", "413011090", "story_v_out_413011.awb")
					end

					arg_372_1:RecordHistoryTalkVoice("story_v_out_413011", "413011090", "story_v_out_413011.awb")
				end

				arg_372_1:RecordContent(arg_372_1.text_.text)
			end

			local var_375_26 = math.max(var_375_17, arg_372_1.talkMaxDuration)

			if var_375_16 <= arg_372_1.time_ and arg_372_1.time_ < var_375_16 + var_375_26 then
				arg_372_1.typewritter.percent = (arg_372_1.time_ - var_375_16) / var_375_26

				arg_372_1.typewritter:SetDirty()
			end

			if arg_372_1.time_ >= var_375_16 + var_375_26 and arg_372_1.time_ < var_375_16 + var_375_26 + arg_375_0 then
				arg_372_1.typewritter.percent = 1

				arg_372_1.typewritter:SetDirty()
				arg_372_1:ShowNextGo(true)
			end
		end
	end,
	Play413011091 = function(arg_376_0, arg_376_1)
		arg_376_1.time_ = 0
		arg_376_1.frameCnt_ = 0
		arg_376_1.state_ = "playing"
		arg_376_1.curTalkId_ = 413011091
		arg_376_1.duration_ = 8.07

		local var_376_0 = {
			zh = 5.566,
			ja = 8.066
		}
		local var_376_1 = manager.audio:GetLocalizationFlag()

		if var_376_0[var_376_1] ~= nil then
			arg_376_1.duration_ = var_376_0[var_376_1]
		end

		SetActive(arg_376_1.tipsGo_, false)

		function arg_376_1.onSingleLineFinish_()
			arg_376_1.onSingleLineUpdate_ = nil
			arg_376_1.onSingleLineFinish_ = nil
			arg_376_1.state_ = "waiting"
		end

		function arg_376_1.playNext_(arg_378_0)
			if arg_378_0 == 1 then
				arg_376_0:Play413011092(arg_376_1)
			end
		end

		function arg_376_1.onSingleLineUpdate_(arg_379_0)
			local var_379_0 = arg_376_1.actors_["10093"]
			local var_379_1 = 0

			if var_379_1 < arg_376_1.time_ and arg_376_1.time_ <= var_379_1 + arg_379_0 and not isNil(var_379_0) and arg_376_1.var_.actorSpriteComps10093 == nil then
				arg_376_1.var_.actorSpriteComps10093 = var_379_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_379_2 = 2

			if var_379_1 <= arg_376_1.time_ and arg_376_1.time_ < var_379_1 + var_379_2 and not isNil(var_379_0) then
				local var_379_3 = (arg_376_1.time_ - var_379_1) / var_379_2

				if arg_376_1.var_.actorSpriteComps10093 then
					for iter_379_0, iter_379_1 in pairs(arg_376_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_379_1 then
							if arg_376_1.isInRecall_ then
								local var_379_4 = Mathf.Lerp(iter_379_1.color.r, arg_376_1.hightColor2.r, var_379_3)
								local var_379_5 = Mathf.Lerp(iter_379_1.color.g, arg_376_1.hightColor2.g, var_379_3)
								local var_379_6 = Mathf.Lerp(iter_379_1.color.b, arg_376_1.hightColor2.b, var_379_3)

								iter_379_1.color = Color.New(var_379_4, var_379_5, var_379_6)
							else
								local var_379_7 = Mathf.Lerp(iter_379_1.color.r, 0.5, var_379_3)

								iter_379_1.color = Color.New(var_379_7, var_379_7, var_379_7)
							end
						end
					end
				end
			end

			if arg_376_1.time_ >= var_379_1 + var_379_2 and arg_376_1.time_ < var_379_1 + var_379_2 + arg_379_0 and not isNil(var_379_0) and arg_376_1.var_.actorSpriteComps10093 then
				for iter_379_2, iter_379_3 in pairs(arg_376_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_379_3 then
						if arg_376_1.isInRecall_ then
							iter_379_3.color = arg_376_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_379_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_376_1.var_.actorSpriteComps10093 = nil
			end

			local var_379_8 = arg_376_1.actors_["10092"]
			local var_379_9 = 0

			if var_379_9 < arg_376_1.time_ and arg_376_1.time_ <= var_379_9 + arg_379_0 and not isNil(var_379_8) and arg_376_1.var_.actorSpriteComps10092 == nil then
				arg_376_1.var_.actorSpriteComps10092 = var_379_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_379_10 = 2

			if var_379_9 <= arg_376_1.time_ and arg_376_1.time_ < var_379_9 + var_379_10 and not isNil(var_379_8) then
				local var_379_11 = (arg_376_1.time_ - var_379_9) / var_379_10

				if arg_376_1.var_.actorSpriteComps10092 then
					for iter_379_4, iter_379_5 in pairs(arg_376_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_379_5 then
							if arg_376_1.isInRecall_ then
								local var_379_12 = Mathf.Lerp(iter_379_5.color.r, arg_376_1.hightColor1.r, var_379_11)
								local var_379_13 = Mathf.Lerp(iter_379_5.color.g, arg_376_1.hightColor1.g, var_379_11)
								local var_379_14 = Mathf.Lerp(iter_379_5.color.b, arg_376_1.hightColor1.b, var_379_11)

								iter_379_5.color = Color.New(var_379_12, var_379_13, var_379_14)
							else
								local var_379_15 = Mathf.Lerp(iter_379_5.color.r, 1, var_379_11)

								iter_379_5.color = Color.New(var_379_15, var_379_15, var_379_15)
							end
						end
					end
				end
			end

			if arg_376_1.time_ >= var_379_9 + var_379_10 and arg_376_1.time_ < var_379_9 + var_379_10 + arg_379_0 and not isNil(var_379_8) and arg_376_1.var_.actorSpriteComps10092 then
				for iter_379_6, iter_379_7 in pairs(arg_376_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_379_7 then
						if arg_376_1.isInRecall_ then
							iter_379_7.color = arg_376_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_379_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_376_1.var_.actorSpriteComps10092 = nil
			end

			local var_379_16 = 0
			local var_379_17 = 0.775

			if var_379_16 < arg_376_1.time_ and arg_376_1.time_ <= var_379_16 + arg_379_0 then
				arg_376_1.talkMaxDuration = 0
				arg_376_1.dialogCg_.alpha = 1

				arg_376_1.dialog_:SetActive(true)
				SetActive(arg_376_1.leftNameGo_, true)

				local var_379_18 = arg_376_1:FormatText(StoryNameCfg[996].name)

				arg_376_1.leftNameTxt_.text = var_379_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_376_1.leftNameTxt_.transform)

				arg_376_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_376_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_376_1:RecordName(arg_376_1.leftNameTxt_.text)
				SetActive(arg_376_1.iconTrs_.gameObject, false)
				arg_376_1.callingController_:SetSelectedState("normal")

				local var_379_19 = arg_376_1:GetWordFromCfg(413011091)
				local var_379_20 = arg_376_1:FormatText(var_379_19.content)

				arg_376_1.text_.text = var_379_20

				LuaForUtil.ClearLinePrefixSymbol(arg_376_1.text_)

				local var_379_21 = 31
				local var_379_22 = utf8.len(var_379_20)
				local var_379_23 = var_379_21 <= 0 and var_379_17 or var_379_17 * (var_379_22 / var_379_21)

				if var_379_23 > 0 and var_379_17 < var_379_23 then
					arg_376_1.talkMaxDuration = var_379_23

					if var_379_23 + var_379_16 > arg_376_1.duration_ then
						arg_376_1.duration_ = var_379_23 + var_379_16
					end
				end

				arg_376_1.text_.text = var_379_20
				arg_376_1.typewritter.percent = 0

				arg_376_1.typewritter:SetDirty()
				arg_376_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011091", "story_v_out_413011.awb") ~= 0 then
					local var_379_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011091", "story_v_out_413011.awb") / 1000

					if var_379_24 + var_379_16 > arg_376_1.duration_ then
						arg_376_1.duration_ = var_379_24 + var_379_16
					end

					if var_379_19.prefab_name ~= "" and arg_376_1.actors_[var_379_19.prefab_name] ~= nil then
						local var_379_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_376_1.actors_[var_379_19.prefab_name].transform, "story_v_out_413011", "413011091", "story_v_out_413011.awb")

						arg_376_1:RecordAudio("413011091", var_379_25)
						arg_376_1:RecordAudio("413011091", var_379_25)
					else
						arg_376_1:AudioAction("play", "voice", "story_v_out_413011", "413011091", "story_v_out_413011.awb")
					end

					arg_376_1:RecordHistoryTalkVoice("story_v_out_413011", "413011091", "story_v_out_413011.awb")
				end

				arg_376_1:RecordContent(arg_376_1.text_.text)
			end

			local var_379_26 = math.max(var_379_17, arg_376_1.talkMaxDuration)

			if var_379_16 <= arg_376_1.time_ and arg_376_1.time_ < var_379_16 + var_379_26 then
				arg_376_1.typewritter.percent = (arg_376_1.time_ - var_379_16) / var_379_26

				arg_376_1.typewritter:SetDirty()
			end

			if arg_376_1.time_ >= var_379_16 + var_379_26 and arg_376_1.time_ < var_379_16 + var_379_26 + arg_379_0 then
				arg_376_1.typewritter.percent = 1

				arg_376_1.typewritter:SetDirty()
				arg_376_1:ShowNextGo(true)
			end
		end
	end,
	Play413011092 = function(arg_380_0, arg_380_1)
		arg_380_1.time_ = 0
		arg_380_1.frameCnt_ = 0
		arg_380_1.state_ = "playing"
		arg_380_1.curTalkId_ = 413011092
		arg_380_1.duration_ = 12.07

		local var_380_0 = {
			zh = 6.9,
			ja = 12.066
		}
		local var_380_1 = manager.audio:GetLocalizationFlag()

		if var_380_0[var_380_1] ~= nil then
			arg_380_1.duration_ = var_380_0[var_380_1]
		end

		SetActive(arg_380_1.tipsGo_, false)

		function arg_380_1.onSingleLineFinish_()
			arg_380_1.onSingleLineUpdate_ = nil
			arg_380_1.onSingleLineFinish_ = nil
			arg_380_1.state_ = "waiting"
		end

		function arg_380_1.playNext_(arg_382_0)
			if arg_382_0 == 1 then
				arg_380_0:Play413011093(arg_380_1)
			end
		end

		function arg_380_1.onSingleLineUpdate_(arg_383_0)
			local var_383_0 = 0
			local var_383_1 = 0.775

			if var_383_0 < arg_380_1.time_ and arg_380_1.time_ <= var_383_0 + arg_383_0 then
				arg_380_1.talkMaxDuration = 0
				arg_380_1.dialogCg_.alpha = 1

				arg_380_1.dialog_:SetActive(true)
				SetActive(arg_380_1.leftNameGo_, true)

				local var_383_2 = arg_380_1:FormatText(StoryNameCfg[996].name)

				arg_380_1.leftNameTxt_.text = var_383_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_380_1.leftNameTxt_.transform)

				arg_380_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_380_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_380_1:RecordName(arg_380_1.leftNameTxt_.text)
				SetActive(arg_380_1.iconTrs_.gameObject, false)
				arg_380_1.callingController_:SetSelectedState("normal")

				local var_383_3 = arg_380_1:GetWordFromCfg(413011092)
				local var_383_4 = arg_380_1:FormatText(var_383_3.content)

				arg_380_1.text_.text = var_383_4

				LuaForUtil.ClearLinePrefixSymbol(arg_380_1.text_)

				local var_383_5 = 31
				local var_383_6 = utf8.len(var_383_4)
				local var_383_7 = var_383_5 <= 0 and var_383_1 or var_383_1 * (var_383_6 / var_383_5)

				if var_383_7 > 0 and var_383_1 < var_383_7 then
					arg_380_1.talkMaxDuration = var_383_7

					if var_383_7 + var_383_0 > arg_380_1.duration_ then
						arg_380_1.duration_ = var_383_7 + var_383_0
					end
				end

				arg_380_1.text_.text = var_383_4
				arg_380_1.typewritter.percent = 0

				arg_380_1.typewritter:SetDirty()
				arg_380_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011092", "story_v_out_413011.awb") ~= 0 then
					local var_383_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011092", "story_v_out_413011.awb") / 1000

					if var_383_8 + var_383_0 > arg_380_1.duration_ then
						arg_380_1.duration_ = var_383_8 + var_383_0
					end

					if var_383_3.prefab_name ~= "" and arg_380_1.actors_[var_383_3.prefab_name] ~= nil then
						local var_383_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_380_1.actors_[var_383_3.prefab_name].transform, "story_v_out_413011", "413011092", "story_v_out_413011.awb")

						arg_380_1:RecordAudio("413011092", var_383_9)
						arg_380_1:RecordAudio("413011092", var_383_9)
					else
						arg_380_1:AudioAction("play", "voice", "story_v_out_413011", "413011092", "story_v_out_413011.awb")
					end

					arg_380_1:RecordHistoryTalkVoice("story_v_out_413011", "413011092", "story_v_out_413011.awb")
				end

				arg_380_1:RecordContent(arg_380_1.text_.text)
			end

			local var_383_10 = math.max(var_383_1, arg_380_1.talkMaxDuration)

			if var_383_0 <= arg_380_1.time_ and arg_380_1.time_ < var_383_0 + var_383_10 then
				arg_380_1.typewritter.percent = (arg_380_1.time_ - var_383_0) / var_383_10

				arg_380_1.typewritter:SetDirty()
			end

			if arg_380_1.time_ >= var_383_0 + var_383_10 and arg_380_1.time_ < var_383_0 + var_383_10 + arg_383_0 then
				arg_380_1.typewritter.percent = 1

				arg_380_1.typewritter:SetDirty()
				arg_380_1:ShowNextGo(true)
			end
		end
	end,
	Play413011093 = function(arg_384_0, arg_384_1)
		arg_384_1.time_ = 0
		arg_384_1.frameCnt_ = 0
		arg_384_1.state_ = "playing"
		arg_384_1.curTalkId_ = 413011093
		arg_384_1.duration_ = 10

		local var_384_0 = {
			zh = 5.6,
			ja = 10
		}
		local var_384_1 = manager.audio:GetLocalizationFlag()

		if var_384_0[var_384_1] ~= nil then
			arg_384_1.duration_ = var_384_0[var_384_1]
		end

		SetActive(arg_384_1.tipsGo_, false)

		function arg_384_1.onSingleLineFinish_()
			arg_384_1.onSingleLineUpdate_ = nil
			arg_384_1.onSingleLineFinish_ = nil
			arg_384_1.state_ = "waiting"
		end

		function arg_384_1.playNext_(arg_386_0)
			if arg_386_0 == 1 then
				arg_384_0:Play413011094(arg_384_1)
			end
		end

		function arg_384_1.onSingleLineUpdate_(arg_387_0)
			local var_387_0 = 0
			local var_387_1 = 0.65

			if var_387_0 < arg_384_1.time_ and arg_384_1.time_ <= var_387_0 + arg_387_0 then
				arg_384_1.talkMaxDuration = 0
				arg_384_1.dialogCg_.alpha = 1

				arg_384_1.dialog_:SetActive(true)
				SetActive(arg_384_1.leftNameGo_, true)

				local var_387_2 = arg_384_1:FormatText(StoryNameCfg[996].name)

				arg_384_1.leftNameTxt_.text = var_387_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_384_1.leftNameTxt_.transform)

				arg_384_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_384_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_384_1:RecordName(arg_384_1.leftNameTxt_.text)
				SetActive(arg_384_1.iconTrs_.gameObject, false)
				arg_384_1.callingController_:SetSelectedState("normal")

				local var_387_3 = arg_384_1:GetWordFromCfg(413011093)
				local var_387_4 = arg_384_1:FormatText(var_387_3.content)

				arg_384_1.text_.text = var_387_4

				LuaForUtil.ClearLinePrefixSymbol(arg_384_1.text_)

				local var_387_5 = 26
				local var_387_6 = utf8.len(var_387_4)
				local var_387_7 = var_387_5 <= 0 and var_387_1 or var_387_1 * (var_387_6 / var_387_5)

				if var_387_7 > 0 and var_387_1 < var_387_7 then
					arg_384_1.talkMaxDuration = var_387_7

					if var_387_7 + var_387_0 > arg_384_1.duration_ then
						arg_384_1.duration_ = var_387_7 + var_387_0
					end
				end

				arg_384_1.text_.text = var_387_4
				arg_384_1.typewritter.percent = 0

				arg_384_1.typewritter:SetDirty()
				arg_384_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011093", "story_v_out_413011.awb") ~= 0 then
					local var_387_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011093", "story_v_out_413011.awb") / 1000

					if var_387_8 + var_387_0 > arg_384_1.duration_ then
						arg_384_1.duration_ = var_387_8 + var_387_0
					end

					if var_387_3.prefab_name ~= "" and arg_384_1.actors_[var_387_3.prefab_name] ~= nil then
						local var_387_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_384_1.actors_[var_387_3.prefab_name].transform, "story_v_out_413011", "413011093", "story_v_out_413011.awb")

						arg_384_1:RecordAudio("413011093", var_387_9)
						arg_384_1:RecordAudio("413011093", var_387_9)
					else
						arg_384_1:AudioAction("play", "voice", "story_v_out_413011", "413011093", "story_v_out_413011.awb")
					end

					arg_384_1:RecordHistoryTalkVoice("story_v_out_413011", "413011093", "story_v_out_413011.awb")
				end

				arg_384_1:RecordContent(arg_384_1.text_.text)
			end

			local var_387_10 = math.max(var_387_1, arg_384_1.talkMaxDuration)

			if var_387_0 <= arg_384_1.time_ and arg_384_1.time_ < var_387_0 + var_387_10 then
				arg_384_1.typewritter.percent = (arg_384_1.time_ - var_387_0) / var_387_10

				arg_384_1.typewritter:SetDirty()
			end

			if arg_384_1.time_ >= var_387_0 + var_387_10 and arg_384_1.time_ < var_387_0 + var_387_10 + arg_387_0 then
				arg_384_1.typewritter.percent = 1

				arg_384_1.typewritter:SetDirty()
				arg_384_1:ShowNextGo(true)
			end
		end
	end,
	Play413011094 = function(arg_388_0, arg_388_1)
		arg_388_1.time_ = 0
		arg_388_1.frameCnt_ = 0
		arg_388_1.state_ = "playing"
		arg_388_1.curTalkId_ = 413011094
		arg_388_1.duration_ = 3.1

		local var_388_0 = {
			zh = 1.999999999999,
			ja = 3.1
		}
		local var_388_1 = manager.audio:GetLocalizationFlag()

		if var_388_0[var_388_1] ~= nil then
			arg_388_1.duration_ = var_388_0[var_388_1]
		end

		SetActive(arg_388_1.tipsGo_, false)

		function arg_388_1.onSingleLineFinish_()
			arg_388_1.onSingleLineUpdate_ = nil
			arg_388_1.onSingleLineFinish_ = nil
			arg_388_1.state_ = "waiting"
		end

		function arg_388_1.playNext_(arg_390_0)
			if arg_390_0 == 1 then
				arg_388_0:Play413011095(arg_388_1)
			end
		end

		function arg_388_1.onSingleLineUpdate_(arg_391_0)
			local var_391_0 = arg_388_1.actors_["10093"].transform
			local var_391_1 = 0

			if var_391_1 < arg_388_1.time_ and arg_388_1.time_ <= var_391_1 + arg_391_0 then
				arg_388_1.var_.moveOldPos10093 = var_391_0.localPosition
				var_391_0.localScale = Vector3.New(1, 1, 1)

				arg_388_1:CheckSpriteTmpPos("10093", 4)

				local var_391_2 = var_391_0.childCount

				for iter_391_0 = 0, var_391_2 - 1 do
					local var_391_3 = var_391_0:GetChild(iter_391_0)

					if var_391_3.name == "" or not string.find(var_391_3.name, "split") then
						var_391_3.gameObject:SetActive(true)
					else
						var_391_3.gameObject:SetActive(false)
					end
				end
			end

			local var_391_4 = 0.001

			if var_391_1 <= arg_388_1.time_ and arg_388_1.time_ < var_391_1 + var_391_4 then
				local var_391_5 = (arg_388_1.time_ - var_391_1) / var_391_4
				local var_391_6 = Vector3.New(390, -345, -245)

				var_391_0.localPosition = Vector3.Lerp(arg_388_1.var_.moveOldPos10093, var_391_6, var_391_5)
			end

			if arg_388_1.time_ >= var_391_1 + var_391_4 and arg_388_1.time_ < var_391_1 + var_391_4 + arg_391_0 then
				var_391_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_391_7 = arg_388_1.actors_["10093"]
			local var_391_8 = 0

			if var_391_8 < arg_388_1.time_ and arg_388_1.time_ <= var_391_8 + arg_391_0 and not isNil(var_391_7) and arg_388_1.var_.actorSpriteComps10093 == nil then
				arg_388_1.var_.actorSpriteComps10093 = var_391_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_391_9 = 2

			if var_391_8 <= arg_388_1.time_ and arg_388_1.time_ < var_391_8 + var_391_9 and not isNil(var_391_7) then
				local var_391_10 = (arg_388_1.time_ - var_391_8) / var_391_9

				if arg_388_1.var_.actorSpriteComps10093 then
					for iter_391_1, iter_391_2 in pairs(arg_388_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_391_2 then
							if arg_388_1.isInRecall_ then
								local var_391_11 = Mathf.Lerp(iter_391_2.color.r, arg_388_1.hightColor1.r, var_391_10)
								local var_391_12 = Mathf.Lerp(iter_391_2.color.g, arg_388_1.hightColor1.g, var_391_10)
								local var_391_13 = Mathf.Lerp(iter_391_2.color.b, arg_388_1.hightColor1.b, var_391_10)

								iter_391_2.color = Color.New(var_391_11, var_391_12, var_391_13)
							else
								local var_391_14 = Mathf.Lerp(iter_391_2.color.r, 1, var_391_10)

								iter_391_2.color = Color.New(var_391_14, var_391_14, var_391_14)
							end
						end
					end
				end
			end

			if arg_388_1.time_ >= var_391_8 + var_391_9 and arg_388_1.time_ < var_391_8 + var_391_9 + arg_391_0 and not isNil(var_391_7) and arg_388_1.var_.actorSpriteComps10093 then
				for iter_391_3, iter_391_4 in pairs(arg_388_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_391_4 then
						if arg_388_1.isInRecall_ then
							iter_391_4.color = arg_388_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_391_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_388_1.var_.actorSpriteComps10093 = nil
			end

			local var_391_15 = arg_388_1.actors_["10092"]
			local var_391_16 = 0

			if var_391_16 < arg_388_1.time_ and arg_388_1.time_ <= var_391_16 + arg_391_0 and not isNil(var_391_15) and arg_388_1.var_.actorSpriteComps10092 == nil then
				arg_388_1.var_.actorSpriteComps10092 = var_391_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_391_17 = 2

			if var_391_16 <= arg_388_1.time_ and arg_388_1.time_ < var_391_16 + var_391_17 and not isNil(var_391_15) then
				local var_391_18 = (arg_388_1.time_ - var_391_16) / var_391_17

				if arg_388_1.var_.actorSpriteComps10092 then
					for iter_391_5, iter_391_6 in pairs(arg_388_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_391_6 then
							if arg_388_1.isInRecall_ then
								local var_391_19 = Mathf.Lerp(iter_391_6.color.r, arg_388_1.hightColor2.r, var_391_18)
								local var_391_20 = Mathf.Lerp(iter_391_6.color.g, arg_388_1.hightColor2.g, var_391_18)
								local var_391_21 = Mathf.Lerp(iter_391_6.color.b, arg_388_1.hightColor2.b, var_391_18)

								iter_391_6.color = Color.New(var_391_19, var_391_20, var_391_21)
							else
								local var_391_22 = Mathf.Lerp(iter_391_6.color.r, 0.5, var_391_18)

								iter_391_6.color = Color.New(var_391_22, var_391_22, var_391_22)
							end
						end
					end
				end
			end

			if arg_388_1.time_ >= var_391_16 + var_391_17 and arg_388_1.time_ < var_391_16 + var_391_17 + arg_391_0 and not isNil(var_391_15) and arg_388_1.var_.actorSpriteComps10092 then
				for iter_391_7, iter_391_8 in pairs(arg_388_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_391_8 then
						if arg_388_1.isInRecall_ then
							iter_391_8.color = arg_388_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_391_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_388_1.var_.actorSpriteComps10092 = nil
			end

			local var_391_23 = 0
			local var_391_24 = 0.225

			if var_391_23 < arg_388_1.time_ and arg_388_1.time_ <= var_391_23 + arg_391_0 then
				arg_388_1.talkMaxDuration = 0
				arg_388_1.dialogCg_.alpha = 1

				arg_388_1.dialog_:SetActive(true)
				SetActive(arg_388_1.leftNameGo_, true)

				local var_391_25 = arg_388_1:FormatText(StoryNameCfg[28].name)

				arg_388_1.leftNameTxt_.text = var_391_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_388_1.leftNameTxt_.transform)

				arg_388_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_388_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_388_1:RecordName(arg_388_1.leftNameTxt_.text)
				SetActive(arg_388_1.iconTrs_.gameObject, false)
				arg_388_1.callingController_:SetSelectedState("normal")

				local var_391_26 = arg_388_1:GetWordFromCfg(413011094)
				local var_391_27 = arg_388_1:FormatText(var_391_26.content)

				arg_388_1.text_.text = var_391_27

				LuaForUtil.ClearLinePrefixSymbol(arg_388_1.text_)

				local var_391_28 = 9
				local var_391_29 = utf8.len(var_391_27)
				local var_391_30 = var_391_28 <= 0 and var_391_24 or var_391_24 * (var_391_29 / var_391_28)

				if var_391_30 > 0 and var_391_24 < var_391_30 then
					arg_388_1.talkMaxDuration = var_391_30

					if var_391_30 + var_391_23 > arg_388_1.duration_ then
						arg_388_1.duration_ = var_391_30 + var_391_23
					end
				end

				arg_388_1.text_.text = var_391_27
				arg_388_1.typewritter.percent = 0

				arg_388_1.typewritter:SetDirty()
				arg_388_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011094", "story_v_out_413011.awb") ~= 0 then
					local var_391_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011094", "story_v_out_413011.awb") / 1000

					if var_391_31 + var_391_23 > arg_388_1.duration_ then
						arg_388_1.duration_ = var_391_31 + var_391_23
					end

					if var_391_26.prefab_name ~= "" and arg_388_1.actors_[var_391_26.prefab_name] ~= nil then
						local var_391_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_388_1.actors_[var_391_26.prefab_name].transform, "story_v_out_413011", "413011094", "story_v_out_413011.awb")

						arg_388_1:RecordAudio("413011094", var_391_32)
						arg_388_1:RecordAudio("413011094", var_391_32)
					else
						arg_388_1:AudioAction("play", "voice", "story_v_out_413011", "413011094", "story_v_out_413011.awb")
					end

					arg_388_1:RecordHistoryTalkVoice("story_v_out_413011", "413011094", "story_v_out_413011.awb")
				end

				arg_388_1:RecordContent(arg_388_1.text_.text)
			end

			local var_391_33 = math.max(var_391_24, arg_388_1.talkMaxDuration)

			if var_391_23 <= arg_388_1.time_ and arg_388_1.time_ < var_391_23 + var_391_33 then
				arg_388_1.typewritter.percent = (arg_388_1.time_ - var_391_23) / var_391_33

				arg_388_1.typewritter:SetDirty()
			end

			if arg_388_1.time_ >= var_391_23 + var_391_33 and arg_388_1.time_ < var_391_23 + var_391_33 + arg_391_0 then
				arg_388_1.typewritter.percent = 1

				arg_388_1.typewritter:SetDirty()
				arg_388_1:ShowNextGo(true)
			end
		end
	end,
	Play413011095 = function(arg_392_0, arg_392_1)
		arg_392_1.time_ = 0
		arg_392_1.frameCnt_ = 0
		arg_392_1.state_ = "playing"
		arg_392_1.curTalkId_ = 413011095
		arg_392_1.duration_ = 8.07

		local var_392_0 = {
			zh = 5.8,
			ja = 8.066
		}
		local var_392_1 = manager.audio:GetLocalizationFlag()

		if var_392_0[var_392_1] ~= nil then
			arg_392_1.duration_ = var_392_0[var_392_1]
		end

		SetActive(arg_392_1.tipsGo_, false)

		function arg_392_1.onSingleLineFinish_()
			arg_392_1.onSingleLineUpdate_ = nil
			arg_392_1.onSingleLineFinish_ = nil
			arg_392_1.state_ = "waiting"
		end

		function arg_392_1.playNext_(arg_394_0)
			if arg_394_0 == 1 then
				arg_392_0:Play413011096(arg_392_1)
			end
		end

		function arg_392_1.onSingleLineUpdate_(arg_395_0)
			local var_395_0 = arg_392_1.actors_["10093"]
			local var_395_1 = 0

			if var_395_1 < arg_392_1.time_ and arg_392_1.time_ <= var_395_1 + arg_395_0 and not isNil(var_395_0) and arg_392_1.var_.actorSpriteComps10093 == nil then
				arg_392_1.var_.actorSpriteComps10093 = var_395_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_395_2 = 2

			if var_395_1 <= arg_392_1.time_ and arg_392_1.time_ < var_395_1 + var_395_2 and not isNil(var_395_0) then
				local var_395_3 = (arg_392_1.time_ - var_395_1) / var_395_2

				if arg_392_1.var_.actorSpriteComps10093 then
					for iter_395_0, iter_395_1 in pairs(arg_392_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_395_1 then
							if arg_392_1.isInRecall_ then
								local var_395_4 = Mathf.Lerp(iter_395_1.color.r, arg_392_1.hightColor2.r, var_395_3)
								local var_395_5 = Mathf.Lerp(iter_395_1.color.g, arg_392_1.hightColor2.g, var_395_3)
								local var_395_6 = Mathf.Lerp(iter_395_1.color.b, arg_392_1.hightColor2.b, var_395_3)

								iter_395_1.color = Color.New(var_395_4, var_395_5, var_395_6)
							else
								local var_395_7 = Mathf.Lerp(iter_395_1.color.r, 0.5, var_395_3)

								iter_395_1.color = Color.New(var_395_7, var_395_7, var_395_7)
							end
						end
					end
				end
			end

			if arg_392_1.time_ >= var_395_1 + var_395_2 and arg_392_1.time_ < var_395_1 + var_395_2 + arg_395_0 and not isNil(var_395_0) and arg_392_1.var_.actorSpriteComps10093 then
				for iter_395_2, iter_395_3 in pairs(arg_392_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_395_3 then
						if arg_392_1.isInRecall_ then
							iter_395_3.color = arg_392_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_395_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_392_1.var_.actorSpriteComps10093 = nil
			end

			local var_395_8 = arg_392_1.actors_["10092"]
			local var_395_9 = 0

			if var_395_9 < arg_392_1.time_ and arg_392_1.time_ <= var_395_9 + arg_395_0 and not isNil(var_395_8) and arg_392_1.var_.actorSpriteComps10092 == nil then
				arg_392_1.var_.actorSpriteComps10092 = var_395_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_395_10 = 2

			if var_395_9 <= arg_392_1.time_ and arg_392_1.time_ < var_395_9 + var_395_10 and not isNil(var_395_8) then
				local var_395_11 = (arg_392_1.time_ - var_395_9) / var_395_10

				if arg_392_1.var_.actorSpriteComps10092 then
					for iter_395_4, iter_395_5 in pairs(arg_392_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_395_5 then
							if arg_392_1.isInRecall_ then
								local var_395_12 = Mathf.Lerp(iter_395_5.color.r, arg_392_1.hightColor1.r, var_395_11)
								local var_395_13 = Mathf.Lerp(iter_395_5.color.g, arg_392_1.hightColor1.g, var_395_11)
								local var_395_14 = Mathf.Lerp(iter_395_5.color.b, arg_392_1.hightColor1.b, var_395_11)

								iter_395_5.color = Color.New(var_395_12, var_395_13, var_395_14)
							else
								local var_395_15 = Mathf.Lerp(iter_395_5.color.r, 1, var_395_11)

								iter_395_5.color = Color.New(var_395_15, var_395_15, var_395_15)
							end
						end
					end
				end
			end

			if arg_392_1.time_ >= var_395_9 + var_395_10 and arg_392_1.time_ < var_395_9 + var_395_10 + arg_395_0 and not isNil(var_395_8) and arg_392_1.var_.actorSpriteComps10092 then
				for iter_395_6, iter_395_7 in pairs(arg_392_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_395_7 then
						if arg_392_1.isInRecall_ then
							iter_395_7.color = arg_392_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_395_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_392_1.var_.actorSpriteComps10092 = nil
			end

			local var_395_16 = arg_392_1.actors_["10092"].transform
			local var_395_17 = 0

			if var_395_17 < arg_392_1.time_ and arg_392_1.time_ <= var_395_17 + arg_395_0 then
				arg_392_1.var_.moveOldPos10092 = var_395_16.localPosition
				var_395_16.localScale = Vector3.New(1, 1, 1)

				arg_392_1:CheckSpriteTmpPos("10092", 2)

				local var_395_18 = var_395_16.childCount

				for iter_395_8 = 0, var_395_18 - 1 do
					local var_395_19 = var_395_16:GetChild(iter_395_8)

					if var_395_19.name == "split_6" or not string.find(var_395_19.name, "split") then
						var_395_19.gameObject:SetActive(true)
					else
						var_395_19.gameObject:SetActive(false)
					end
				end
			end

			local var_395_20 = 0.001

			if var_395_17 <= arg_392_1.time_ and arg_392_1.time_ < var_395_17 + var_395_20 then
				local var_395_21 = (arg_392_1.time_ - var_395_17) / var_395_20
				local var_395_22 = Vector3.New(-389.49, -300, -295)

				var_395_16.localPosition = Vector3.Lerp(arg_392_1.var_.moveOldPos10092, var_395_22, var_395_21)
			end

			if arg_392_1.time_ >= var_395_17 + var_395_20 and arg_392_1.time_ < var_395_17 + var_395_20 + arg_395_0 then
				var_395_16.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_395_23 = 0
			local var_395_24 = 0.725

			if var_395_23 < arg_392_1.time_ and arg_392_1.time_ <= var_395_23 + arg_395_0 then
				arg_392_1.talkMaxDuration = 0
				arg_392_1.dialogCg_.alpha = 1

				arg_392_1.dialog_:SetActive(true)
				SetActive(arg_392_1.leftNameGo_, true)

				local var_395_25 = arg_392_1:FormatText(StoryNameCfg[996].name)

				arg_392_1.leftNameTxt_.text = var_395_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_392_1.leftNameTxt_.transform)

				arg_392_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_392_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_392_1:RecordName(arg_392_1.leftNameTxt_.text)
				SetActive(arg_392_1.iconTrs_.gameObject, false)
				arg_392_1.callingController_:SetSelectedState("normal")

				local var_395_26 = arg_392_1:GetWordFromCfg(413011095)
				local var_395_27 = arg_392_1:FormatText(var_395_26.content)

				arg_392_1.text_.text = var_395_27

				LuaForUtil.ClearLinePrefixSymbol(arg_392_1.text_)

				local var_395_28 = 29
				local var_395_29 = utf8.len(var_395_27)
				local var_395_30 = var_395_28 <= 0 and var_395_24 or var_395_24 * (var_395_29 / var_395_28)

				if var_395_30 > 0 and var_395_24 < var_395_30 then
					arg_392_1.talkMaxDuration = var_395_30

					if var_395_30 + var_395_23 > arg_392_1.duration_ then
						arg_392_1.duration_ = var_395_30 + var_395_23
					end
				end

				arg_392_1.text_.text = var_395_27
				arg_392_1.typewritter.percent = 0

				arg_392_1.typewritter:SetDirty()
				arg_392_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011095", "story_v_out_413011.awb") ~= 0 then
					local var_395_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011095", "story_v_out_413011.awb") / 1000

					if var_395_31 + var_395_23 > arg_392_1.duration_ then
						arg_392_1.duration_ = var_395_31 + var_395_23
					end

					if var_395_26.prefab_name ~= "" and arg_392_1.actors_[var_395_26.prefab_name] ~= nil then
						local var_395_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_392_1.actors_[var_395_26.prefab_name].transform, "story_v_out_413011", "413011095", "story_v_out_413011.awb")

						arg_392_1:RecordAudio("413011095", var_395_32)
						arg_392_1:RecordAudio("413011095", var_395_32)
					else
						arg_392_1:AudioAction("play", "voice", "story_v_out_413011", "413011095", "story_v_out_413011.awb")
					end

					arg_392_1:RecordHistoryTalkVoice("story_v_out_413011", "413011095", "story_v_out_413011.awb")
				end

				arg_392_1:RecordContent(arg_392_1.text_.text)
			end

			local var_395_33 = math.max(var_395_24, arg_392_1.talkMaxDuration)

			if var_395_23 <= arg_392_1.time_ and arg_392_1.time_ < var_395_23 + var_395_33 then
				arg_392_1.typewritter.percent = (arg_392_1.time_ - var_395_23) / var_395_33

				arg_392_1.typewritter:SetDirty()
			end

			if arg_392_1.time_ >= var_395_23 + var_395_33 and arg_392_1.time_ < var_395_23 + var_395_33 + arg_395_0 then
				arg_392_1.typewritter.percent = 1

				arg_392_1.typewritter:SetDirty()
				arg_392_1:ShowNextGo(true)
			end
		end
	end,
	Play413011096 = function(arg_396_0, arg_396_1)
		arg_396_1.time_ = 0
		arg_396_1.frameCnt_ = 0
		arg_396_1.state_ = "playing"
		arg_396_1.curTalkId_ = 413011096
		arg_396_1.duration_ = 4

		local var_396_0 = {
			zh = 2.8,
			ja = 4
		}
		local var_396_1 = manager.audio:GetLocalizationFlag()

		if var_396_0[var_396_1] ~= nil then
			arg_396_1.duration_ = var_396_0[var_396_1]
		end

		SetActive(arg_396_1.tipsGo_, false)

		function arg_396_1.onSingleLineFinish_()
			arg_396_1.onSingleLineUpdate_ = nil
			arg_396_1.onSingleLineFinish_ = nil
			arg_396_1.state_ = "waiting"
		end

		function arg_396_1.playNext_(arg_398_0)
			if arg_398_0 == 1 then
				arg_396_0:Play413011097(arg_396_1)
			end
		end

		function arg_396_1.onSingleLineUpdate_(arg_399_0)
			local var_399_0 = 0
			local var_399_1 = 0.35

			if var_399_0 < arg_396_1.time_ and arg_396_1.time_ <= var_399_0 + arg_399_0 then
				arg_396_1.talkMaxDuration = 0
				arg_396_1.dialogCg_.alpha = 1

				arg_396_1.dialog_:SetActive(true)
				SetActive(arg_396_1.leftNameGo_, true)

				local var_399_2 = arg_396_1:FormatText(StoryNameCfg[996].name)

				arg_396_1.leftNameTxt_.text = var_399_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_396_1.leftNameTxt_.transform)

				arg_396_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_396_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_396_1:RecordName(arg_396_1.leftNameTxt_.text)
				SetActive(arg_396_1.iconTrs_.gameObject, false)
				arg_396_1.callingController_:SetSelectedState("normal")

				local var_399_3 = arg_396_1:GetWordFromCfg(413011096)
				local var_399_4 = arg_396_1:FormatText(var_399_3.content)

				arg_396_1.text_.text = var_399_4

				LuaForUtil.ClearLinePrefixSymbol(arg_396_1.text_)

				local var_399_5 = 14
				local var_399_6 = utf8.len(var_399_4)
				local var_399_7 = var_399_5 <= 0 and var_399_1 or var_399_1 * (var_399_6 / var_399_5)

				if var_399_7 > 0 and var_399_1 < var_399_7 then
					arg_396_1.talkMaxDuration = var_399_7

					if var_399_7 + var_399_0 > arg_396_1.duration_ then
						arg_396_1.duration_ = var_399_7 + var_399_0
					end
				end

				arg_396_1.text_.text = var_399_4
				arg_396_1.typewritter.percent = 0

				arg_396_1.typewritter:SetDirty()
				arg_396_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011096", "story_v_out_413011.awb") ~= 0 then
					local var_399_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011096", "story_v_out_413011.awb") / 1000

					if var_399_8 + var_399_0 > arg_396_1.duration_ then
						arg_396_1.duration_ = var_399_8 + var_399_0
					end

					if var_399_3.prefab_name ~= "" and arg_396_1.actors_[var_399_3.prefab_name] ~= nil then
						local var_399_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_396_1.actors_[var_399_3.prefab_name].transform, "story_v_out_413011", "413011096", "story_v_out_413011.awb")

						arg_396_1:RecordAudio("413011096", var_399_9)
						arg_396_1:RecordAudio("413011096", var_399_9)
					else
						arg_396_1:AudioAction("play", "voice", "story_v_out_413011", "413011096", "story_v_out_413011.awb")
					end

					arg_396_1:RecordHistoryTalkVoice("story_v_out_413011", "413011096", "story_v_out_413011.awb")
				end

				arg_396_1:RecordContent(arg_396_1.text_.text)
			end

			local var_399_10 = math.max(var_399_1, arg_396_1.talkMaxDuration)

			if var_399_0 <= arg_396_1.time_ and arg_396_1.time_ < var_399_0 + var_399_10 then
				arg_396_1.typewritter.percent = (arg_396_1.time_ - var_399_0) / var_399_10

				arg_396_1.typewritter:SetDirty()
			end

			if arg_396_1.time_ >= var_399_0 + var_399_10 and arg_396_1.time_ < var_399_0 + var_399_10 + arg_399_0 then
				arg_396_1.typewritter.percent = 1

				arg_396_1.typewritter:SetDirty()
				arg_396_1:ShowNextGo(true)
			end
		end
	end,
	Play413011097 = function(arg_400_0, arg_400_1)
		arg_400_1.time_ = 0
		arg_400_1.frameCnt_ = 0
		arg_400_1.state_ = "playing"
		arg_400_1.curTalkId_ = 413011097
		arg_400_1.duration_ = 7.13

		local var_400_0 = {
			zh = 4.033,
			ja = 7.133
		}
		local var_400_1 = manager.audio:GetLocalizationFlag()

		if var_400_0[var_400_1] ~= nil then
			arg_400_1.duration_ = var_400_0[var_400_1]
		end

		SetActive(arg_400_1.tipsGo_, false)

		function arg_400_1.onSingleLineFinish_()
			arg_400_1.onSingleLineUpdate_ = nil
			arg_400_1.onSingleLineFinish_ = nil
			arg_400_1.state_ = "waiting"
		end

		function arg_400_1.playNext_(arg_402_0)
			if arg_402_0 == 1 then
				arg_400_0:Play413011098(arg_400_1)
			end
		end

		function arg_400_1.onSingleLineUpdate_(arg_403_0)
			local var_403_0 = arg_400_1.actors_["10093"]
			local var_403_1 = 0

			if var_403_1 < arg_400_1.time_ and arg_400_1.time_ <= var_403_1 + arg_403_0 and not isNil(var_403_0) and arg_400_1.var_.actorSpriteComps10093 == nil then
				arg_400_1.var_.actorSpriteComps10093 = var_403_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_403_2 = 2

			if var_403_1 <= arg_400_1.time_ and arg_400_1.time_ < var_403_1 + var_403_2 and not isNil(var_403_0) then
				local var_403_3 = (arg_400_1.time_ - var_403_1) / var_403_2

				if arg_400_1.var_.actorSpriteComps10093 then
					for iter_403_0, iter_403_1 in pairs(arg_400_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_403_1 then
							if arg_400_1.isInRecall_ then
								local var_403_4 = Mathf.Lerp(iter_403_1.color.r, arg_400_1.hightColor1.r, var_403_3)
								local var_403_5 = Mathf.Lerp(iter_403_1.color.g, arg_400_1.hightColor1.g, var_403_3)
								local var_403_6 = Mathf.Lerp(iter_403_1.color.b, arg_400_1.hightColor1.b, var_403_3)

								iter_403_1.color = Color.New(var_403_4, var_403_5, var_403_6)
							else
								local var_403_7 = Mathf.Lerp(iter_403_1.color.r, 1, var_403_3)

								iter_403_1.color = Color.New(var_403_7, var_403_7, var_403_7)
							end
						end
					end
				end
			end

			if arg_400_1.time_ >= var_403_1 + var_403_2 and arg_400_1.time_ < var_403_1 + var_403_2 + arg_403_0 and not isNil(var_403_0) and arg_400_1.var_.actorSpriteComps10093 then
				for iter_403_2, iter_403_3 in pairs(arg_400_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_403_3 then
						if arg_400_1.isInRecall_ then
							iter_403_3.color = arg_400_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_403_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_400_1.var_.actorSpriteComps10093 = nil
			end

			local var_403_8 = arg_400_1.actors_["10092"]
			local var_403_9 = 0

			if var_403_9 < arg_400_1.time_ and arg_400_1.time_ <= var_403_9 + arg_403_0 and not isNil(var_403_8) and arg_400_1.var_.actorSpriteComps10092 == nil then
				arg_400_1.var_.actorSpriteComps10092 = var_403_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_403_10 = 2

			if var_403_9 <= arg_400_1.time_ and arg_400_1.time_ < var_403_9 + var_403_10 and not isNil(var_403_8) then
				local var_403_11 = (arg_400_1.time_ - var_403_9) / var_403_10

				if arg_400_1.var_.actorSpriteComps10092 then
					for iter_403_4, iter_403_5 in pairs(arg_400_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_403_5 then
							if arg_400_1.isInRecall_ then
								local var_403_12 = Mathf.Lerp(iter_403_5.color.r, arg_400_1.hightColor2.r, var_403_11)
								local var_403_13 = Mathf.Lerp(iter_403_5.color.g, arg_400_1.hightColor2.g, var_403_11)
								local var_403_14 = Mathf.Lerp(iter_403_5.color.b, arg_400_1.hightColor2.b, var_403_11)

								iter_403_5.color = Color.New(var_403_12, var_403_13, var_403_14)
							else
								local var_403_15 = Mathf.Lerp(iter_403_5.color.r, 0.5, var_403_11)

								iter_403_5.color = Color.New(var_403_15, var_403_15, var_403_15)
							end
						end
					end
				end
			end

			if arg_400_1.time_ >= var_403_9 + var_403_10 and arg_400_1.time_ < var_403_9 + var_403_10 + arg_403_0 and not isNil(var_403_8) and arg_400_1.var_.actorSpriteComps10092 then
				for iter_403_6, iter_403_7 in pairs(arg_400_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_403_7 then
						if arg_400_1.isInRecall_ then
							iter_403_7.color = arg_400_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_403_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_400_1.var_.actorSpriteComps10092 = nil
			end

			local var_403_16 = 0
			local var_403_17 = 0.35

			if var_403_16 < arg_400_1.time_ and arg_400_1.time_ <= var_403_16 + arg_403_0 then
				arg_400_1.talkMaxDuration = 0
				arg_400_1.dialogCg_.alpha = 1

				arg_400_1.dialog_:SetActive(true)
				SetActive(arg_400_1.leftNameGo_, true)

				local var_403_18 = arg_400_1:FormatText(StoryNameCfg[28].name)

				arg_400_1.leftNameTxt_.text = var_403_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_400_1.leftNameTxt_.transform)

				arg_400_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_400_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_400_1:RecordName(arg_400_1.leftNameTxt_.text)
				SetActive(arg_400_1.iconTrs_.gameObject, false)
				arg_400_1.callingController_:SetSelectedState("normal")

				local var_403_19 = arg_400_1:GetWordFromCfg(413011097)
				local var_403_20 = arg_400_1:FormatText(var_403_19.content)

				arg_400_1.text_.text = var_403_20

				LuaForUtil.ClearLinePrefixSymbol(arg_400_1.text_)

				local var_403_21 = 14
				local var_403_22 = utf8.len(var_403_20)
				local var_403_23 = var_403_21 <= 0 and var_403_17 or var_403_17 * (var_403_22 / var_403_21)

				if var_403_23 > 0 and var_403_17 < var_403_23 then
					arg_400_1.talkMaxDuration = var_403_23

					if var_403_23 + var_403_16 > arg_400_1.duration_ then
						arg_400_1.duration_ = var_403_23 + var_403_16
					end
				end

				arg_400_1.text_.text = var_403_20
				arg_400_1.typewritter.percent = 0

				arg_400_1.typewritter:SetDirty()
				arg_400_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011097", "story_v_out_413011.awb") ~= 0 then
					local var_403_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011097", "story_v_out_413011.awb") / 1000

					if var_403_24 + var_403_16 > arg_400_1.duration_ then
						arg_400_1.duration_ = var_403_24 + var_403_16
					end

					if var_403_19.prefab_name ~= "" and arg_400_1.actors_[var_403_19.prefab_name] ~= nil then
						local var_403_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_400_1.actors_[var_403_19.prefab_name].transform, "story_v_out_413011", "413011097", "story_v_out_413011.awb")

						arg_400_1:RecordAudio("413011097", var_403_25)
						arg_400_1:RecordAudio("413011097", var_403_25)
					else
						arg_400_1:AudioAction("play", "voice", "story_v_out_413011", "413011097", "story_v_out_413011.awb")
					end

					arg_400_1:RecordHistoryTalkVoice("story_v_out_413011", "413011097", "story_v_out_413011.awb")
				end

				arg_400_1:RecordContent(arg_400_1.text_.text)
			end

			local var_403_26 = math.max(var_403_17, arg_400_1.talkMaxDuration)

			if var_403_16 <= arg_400_1.time_ and arg_400_1.time_ < var_403_16 + var_403_26 then
				arg_400_1.typewritter.percent = (arg_400_1.time_ - var_403_16) / var_403_26

				arg_400_1.typewritter:SetDirty()
			end

			if arg_400_1.time_ >= var_403_16 + var_403_26 and arg_400_1.time_ < var_403_16 + var_403_26 + arg_403_0 then
				arg_400_1.typewritter.percent = 1

				arg_400_1.typewritter:SetDirty()
				arg_400_1:ShowNextGo(true)
			end
		end
	end,
	Play413011098 = function(arg_404_0, arg_404_1)
		arg_404_1.time_ = 0
		arg_404_1.frameCnt_ = 0
		arg_404_1.state_ = "playing"
		arg_404_1.curTalkId_ = 413011098
		arg_404_1.duration_ = 5

		SetActive(arg_404_1.tipsGo_, false)

		function arg_404_1.onSingleLineFinish_()
			arg_404_1.onSingleLineUpdate_ = nil
			arg_404_1.onSingleLineFinish_ = nil
			arg_404_1.state_ = "waiting"
		end

		function arg_404_1.playNext_(arg_406_0)
			if arg_406_0 == 1 then
				arg_404_0:Play413011099(arg_404_1)
			end
		end

		function arg_404_1.onSingleLineUpdate_(arg_407_0)
			local var_407_0 = arg_404_1.actors_["10092"].transform
			local var_407_1 = 0

			if var_407_1 < arg_404_1.time_ and arg_404_1.time_ <= var_407_1 + arg_407_0 then
				arg_404_1.var_.moveOldPos10092 = var_407_0.localPosition
				var_407_0.localScale = Vector3.New(1, 1, 1)

				arg_404_1:CheckSpriteTmpPos("10092", 0)

				local var_407_2 = var_407_0.childCount

				for iter_407_0 = 0, var_407_2 - 1 do
					local var_407_3 = var_407_0:GetChild(iter_407_0)

					if var_407_3.name == "" or not string.find(var_407_3.name, "split") then
						var_407_3.gameObject:SetActive(true)
					else
						var_407_3.gameObject:SetActive(false)
					end
				end
			end

			local var_407_4 = 0.001

			if var_407_1 <= arg_404_1.time_ and arg_404_1.time_ < var_407_1 + var_407_4 then
				local var_407_5 = (arg_404_1.time_ - var_407_1) / var_407_4
				local var_407_6 = Vector3.New(0, -5000, 0)

				var_407_0.localPosition = Vector3.Lerp(arg_404_1.var_.moveOldPos10092, var_407_6, var_407_5)
			end

			if arg_404_1.time_ >= var_407_1 + var_407_4 and arg_404_1.time_ < var_407_1 + var_407_4 + arg_407_0 then
				var_407_0.localPosition = Vector3.New(0, -5000, 0)
			end

			local var_407_7 = arg_404_1.actors_["10093"].transform
			local var_407_8 = 0

			if var_407_8 < arg_404_1.time_ and arg_404_1.time_ <= var_407_8 + arg_407_0 then
				arg_404_1.var_.moveOldPos10093 = var_407_7.localPosition
				var_407_7.localScale = Vector3.New(1, 1, 1)

				arg_404_1:CheckSpriteTmpPos("10093", 0)

				local var_407_9 = var_407_7.childCount

				for iter_407_1 = 0, var_407_9 - 1 do
					local var_407_10 = var_407_7:GetChild(iter_407_1)

					if var_407_10.name == "" or not string.find(var_407_10.name, "split") then
						var_407_10.gameObject:SetActive(true)
					else
						var_407_10.gameObject:SetActive(false)
					end
				end
			end

			local var_407_11 = 0.001

			if var_407_8 <= arg_404_1.time_ and arg_404_1.time_ < var_407_8 + var_407_11 then
				local var_407_12 = (arg_404_1.time_ - var_407_8) / var_407_11
				local var_407_13 = Vector3.New(-1500, -350, -180)

				var_407_7.localPosition = Vector3.Lerp(arg_404_1.var_.moveOldPos10093, var_407_13, var_407_12)
			end

			if arg_404_1.time_ >= var_407_8 + var_407_11 and arg_404_1.time_ < var_407_8 + var_407_11 + arg_407_0 then
				var_407_7.localPosition = Vector3.New(-1500, -350, -180)
			end

			local var_407_14 = arg_404_1.actors_["10092"]
			local var_407_15 = 0

			if var_407_15 < arg_404_1.time_ and arg_404_1.time_ <= var_407_15 + arg_407_0 and not isNil(var_407_14) and arg_404_1.var_.actorSpriteComps10092 == nil then
				arg_404_1.var_.actorSpriteComps10092 = var_407_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_407_16 = 2

			if var_407_15 <= arg_404_1.time_ and arg_404_1.time_ < var_407_15 + var_407_16 and not isNil(var_407_14) then
				local var_407_17 = (arg_404_1.time_ - var_407_15) / var_407_16

				if arg_404_1.var_.actorSpriteComps10092 then
					for iter_407_2, iter_407_3 in pairs(arg_404_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_407_3 then
							if arg_404_1.isInRecall_ then
								local var_407_18 = Mathf.Lerp(iter_407_3.color.r, arg_404_1.hightColor2.r, var_407_17)
								local var_407_19 = Mathf.Lerp(iter_407_3.color.g, arg_404_1.hightColor2.g, var_407_17)
								local var_407_20 = Mathf.Lerp(iter_407_3.color.b, arg_404_1.hightColor2.b, var_407_17)

								iter_407_3.color = Color.New(var_407_18, var_407_19, var_407_20)
							else
								local var_407_21 = Mathf.Lerp(iter_407_3.color.r, 0.5, var_407_17)

								iter_407_3.color = Color.New(var_407_21, var_407_21, var_407_21)
							end
						end
					end
				end
			end

			if arg_404_1.time_ >= var_407_15 + var_407_16 and arg_404_1.time_ < var_407_15 + var_407_16 + arg_407_0 and not isNil(var_407_14) and arg_404_1.var_.actorSpriteComps10092 then
				for iter_407_4, iter_407_5 in pairs(arg_404_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_407_5 then
						if arg_404_1.isInRecall_ then
							iter_407_5.color = arg_404_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_407_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_404_1.var_.actorSpriteComps10092 = nil
			end

			local var_407_22 = arg_404_1.actors_["10093"]
			local var_407_23 = 0

			if var_407_23 < arg_404_1.time_ and arg_404_1.time_ <= var_407_23 + arg_407_0 and not isNil(var_407_22) and arg_404_1.var_.actorSpriteComps10093 == nil then
				arg_404_1.var_.actorSpriteComps10093 = var_407_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_407_24 = 2

			if var_407_23 <= arg_404_1.time_ and arg_404_1.time_ < var_407_23 + var_407_24 and not isNil(var_407_22) then
				local var_407_25 = (arg_404_1.time_ - var_407_23) / var_407_24

				if arg_404_1.var_.actorSpriteComps10093 then
					for iter_407_6, iter_407_7 in pairs(arg_404_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_407_7 then
							if arg_404_1.isInRecall_ then
								local var_407_26 = Mathf.Lerp(iter_407_7.color.r, arg_404_1.hightColor2.r, var_407_25)
								local var_407_27 = Mathf.Lerp(iter_407_7.color.g, arg_404_1.hightColor2.g, var_407_25)
								local var_407_28 = Mathf.Lerp(iter_407_7.color.b, arg_404_1.hightColor2.b, var_407_25)

								iter_407_7.color = Color.New(var_407_26, var_407_27, var_407_28)
							else
								local var_407_29 = Mathf.Lerp(iter_407_7.color.r, 0.5, var_407_25)

								iter_407_7.color = Color.New(var_407_29, var_407_29, var_407_29)
							end
						end
					end
				end
			end

			if arg_404_1.time_ >= var_407_23 + var_407_24 and arg_404_1.time_ < var_407_23 + var_407_24 + arg_407_0 and not isNil(var_407_22) and arg_404_1.var_.actorSpriteComps10093 then
				for iter_407_8, iter_407_9 in pairs(arg_404_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_407_9 then
						if arg_404_1.isInRecall_ then
							iter_407_9.color = arg_404_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_407_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_404_1.var_.actorSpriteComps10093 = nil
			end

			local var_407_30 = 0
			local var_407_31 = 1

			if var_407_30 < arg_404_1.time_ and arg_404_1.time_ <= var_407_30 + arg_407_0 then
				arg_404_1.talkMaxDuration = 0
				arg_404_1.dialogCg_.alpha = 1

				arg_404_1.dialog_:SetActive(true)
				SetActive(arg_404_1.leftNameGo_, false)

				arg_404_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_404_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_404_1:RecordName(arg_404_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_404_1.iconTrs_.gameObject, false)
				arg_404_1.callingController_:SetSelectedState("normal")

				local var_407_32 = arg_404_1:GetWordFromCfg(413011098)
				local var_407_33 = arg_404_1:FormatText(var_407_32.content)

				arg_404_1.text_.text = var_407_33

				LuaForUtil.ClearLinePrefixSymbol(arg_404_1.text_)

				local var_407_34 = 40
				local var_407_35 = utf8.len(var_407_33)
				local var_407_36 = var_407_34 <= 0 and var_407_31 or var_407_31 * (var_407_35 / var_407_34)

				if var_407_36 > 0 and var_407_31 < var_407_36 then
					arg_404_1.talkMaxDuration = var_407_36

					if var_407_36 + var_407_30 > arg_404_1.duration_ then
						arg_404_1.duration_ = var_407_36 + var_407_30
					end
				end

				arg_404_1.text_.text = var_407_33
				arg_404_1.typewritter.percent = 0

				arg_404_1.typewritter:SetDirty()
				arg_404_1:ShowNextGo(false)
				arg_404_1:RecordContent(arg_404_1.text_.text)
			end

			local var_407_37 = math.max(var_407_31, arg_404_1.talkMaxDuration)

			if var_407_30 <= arg_404_1.time_ and arg_404_1.time_ < var_407_30 + var_407_37 then
				arg_404_1.typewritter.percent = (arg_404_1.time_ - var_407_30) / var_407_37

				arg_404_1.typewritter:SetDirty()
			end

			if arg_404_1.time_ >= var_407_30 + var_407_37 and arg_404_1.time_ < var_407_30 + var_407_37 + arg_407_0 then
				arg_404_1.typewritter.percent = 1

				arg_404_1.typewritter:SetDirty()
				arg_404_1:ShowNextGo(true)
			end
		end
	end,
	Play413011099 = function(arg_408_0, arg_408_1)
		arg_408_1.time_ = 0
		arg_408_1.frameCnt_ = 0
		arg_408_1.state_ = "playing"
		arg_408_1.curTalkId_ = 413011099
		arg_408_1.duration_ = 17.13

		local var_408_0 = {
			zh = 9.8,
			ja = 17.133
		}
		local var_408_1 = manager.audio:GetLocalizationFlag()

		if var_408_0[var_408_1] ~= nil then
			arg_408_1.duration_ = var_408_0[var_408_1]
		end

		SetActive(arg_408_1.tipsGo_, false)

		function arg_408_1.onSingleLineFinish_()
			arg_408_1.onSingleLineUpdate_ = nil
			arg_408_1.onSingleLineFinish_ = nil
			arg_408_1.state_ = "waiting"
		end

		function arg_408_1.playNext_(arg_410_0)
			if arg_410_0 == 1 then
				arg_408_0:Play413011100(arg_408_1)
			end
		end

		function arg_408_1.onSingleLineUpdate_(arg_411_0)
			local var_411_0 = arg_408_1.actors_["10092"].transform
			local var_411_1 = 0

			if var_411_1 < arg_408_1.time_ and arg_408_1.time_ <= var_411_1 + arg_411_0 then
				arg_408_1.var_.moveOldPos10092 = var_411_0.localPosition
				var_411_0.localScale = Vector3.New(1, 1, 1)

				arg_408_1:CheckSpriteTmpPos("10092", 2)

				local var_411_2 = var_411_0.childCount

				for iter_411_0 = 0, var_411_2 - 1 do
					local var_411_3 = var_411_0:GetChild(iter_411_0)

					if var_411_3.name == "split_2" or not string.find(var_411_3.name, "split") then
						var_411_3.gameObject:SetActive(true)
					else
						var_411_3.gameObject:SetActive(false)
					end
				end
			end

			local var_411_4 = 0.001

			if var_411_1 <= arg_408_1.time_ and arg_408_1.time_ < var_411_1 + var_411_4 then
				local var_411_5 = (arg_408_1.time_ - var_411_1) / var_411_4
				local var_411_6 = Vector3.New(-389.49, -300, -295)

				var_411_0.localPosition = Vector3.Lerp(arg_408_1.var_.moveOldPos10092, var_411_6, var_411_5)
			end

			if arg_408_1.time_ >= var_411_1 + var_411_4 and arg_408_1.time_ < var_411_1 + var_411_4 + arg_411_0 then
				var_411_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_411_7 = arg_408_1.actors_["10092"]
			local var_411_8 = 0

			if var_411_8 < arg_408_1.time_ and arg_408_1.time_ <= var_411_8 + arg_411_0 and not isNil(var_411_7) and arg_408_1.var_.actorSpriteComps10092 == nil then
				arg_408_1.var_.actorSpriteComps10092 = var_411_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_411_9 = 2

			if var_411_8 <= arg_408_1.time_ and arg_408_1.time_ < var_411_8 + var_411_9 and not isNil(var_411_7) then
				local var_411_10 = (arg_408_1.time_ - var_411_8) / var_411_9

				if arg_408_1.var_.actorSpriteComps10092 then
					for iter_411_1, iter_411_2 in pairs(arg_408_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_411_2 then
							if arg_408_1.isInRecall_ then
								local var_411_11 = Mathf.Lerp(iter_411_2.color.r, arg_408_1.hightColor1.r, var_411_10)
								local var_411_12 = Mathf.Lerp(iter_411_2.color.g, arg_408_1.hightColor1.g, var_411_10)
								local var_411_13 = Mathf.Lerp(iter_411_2.color.b, arg_408_1.hightColor1.b, var_411_10)

								iter_411_2.color = Color.New(var_411_11, var_411_12, var_411_13)
							else
								local var_411_14 = Mathf.Lerp(iter_411_2.color.r, 1, var_411_10)

								iter_411_2.color = Color.New(var_411_14, var_411_14, var_411_14)
							end
						end
					end
				end
			end

			if arg_408_1.time_ >= var_411_8 + var_411_9 and arg_408_1.time_ < var_411_8 + var_411_9 + arg_411_0 and not isNil(var_411_7) and arg_408_1.var_.actorSpriteComps10092 then
				for iter_411_3, iter_411_4 in pairs(arg_408_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_411_4 then
						if arg_408_1.isInRecall_ then
							iter_411_4.color = arg_408_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_411_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_408_1.var_.actorSpriteComps10092 = nil
			end

			local var_411_15 = 0
			local var_411_16 = 1.075

			if var_411_15 < arg_408_1.time_ and arg_408_1.time_ <= var_411_15 + arg_411_0 then
				arg_408_1.talkMaxDuration = 0
				arg_408_1.dialogCg_.alpha = 1

				arg_408_1.dialog_:SetActive(true)
				SetActive(arg_408_1.leftNameGo_, true)

				local var_411_17 = arg_408_1:FormatText(StoryNameCfg[996].name)

				arg_408_1.leftNameTxt_.text = var_411_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_408_1.leftNameTxt_.transform)

				arg_408_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_408_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_408_1:RecordName(arg_408_1.leftNameTxt_.text)
				SetActive(arg_408_1.iconTrs_.gameObject, false)
				arg_408_1.callingController_:SetSelectedState("normal")

				local var_411_18 = arg_408_1:GetWordFromCfg(413011099)
				local var_411_19 = arg_408_1:FormatText(var_411_18.content)

				arg_408_1.text_.text = var_411_19

				LuaForUtil.ClearLinePrefixSymbol(arg_408_1.text_)

				local var_411_20 = 43
				local var_411_21 = utf8.len(var_411_19)
				local var_411_22 = var_411_20 <= 0 and var_411_16 or var_411_16 * (var_411_21 / var_411_20)

				if var_411_22 > 0 and var_411_16 < var_411_22 then
					arg_408_1.talkMaxDuration = var_411_22

					if var_411_22 + var_411_15 > arg_408_1.duration_ then
						arg_408_1.duration_ = var_411_22 + var_411_15
					end
				end

				arg_408_1.text_.text = var_411_19
				arg_408_1.typewritter.percent = 0

				arg_408_1.typewritter:SetDirty()
				arg_408_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011099", "story_v_out_413011.awb") ~= 0 then
					local var_411_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011099", "story_v_out_413011.awb") / 1000

					if var_411_23 + var_411_15 > arg_408_1.duration_ then
						arg_408_1.duration_ = var_411_23 + var_411_15
					end

					if var_411_18.prefab_name ~= "" and arg_408_1.actors_[var_411_18.prefab_name] ~= nil then
						local var_411_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_408_1.actors_[var_411_18.prefab_name].transform, "story_v_out_413011", "413011099", "story_v_out_413011.awb")

						arg_408_1:RecordAudio("413011099", var_411_24)
						arg_408_1:RecordAudio("413011099", var_411_24)
					else
						arg_408_1:AudioAction("play", "voice", "story_v_out_413011", "413011099", "story_v_out_413011.awb")
					end

					arg_408_1:RecordHistoryTalkVoice("story_v_out_413011", "413011099", "story_v_out_413011.awb")
				end

				arg_408_1:RecordContent(arg_408_1.text_.text)
			end

			local var_411_25 = math.max(var_411_16, arg_408_1.talkMaxDuration)

			if var_411_15 <= arg_408_1.time_ and arg_408_1.time_ < var_411_15 + var_411_25 then
				arg_408_1.typewritter.percent = (arg_408_1.time_ - var_411_15) / var_411_25

				arg_408_1.typewritter:SetDirty()
			end

			if arg_408_1.time_ >= var_411_15 + var_411_25 and arg_408_1.time_ < var_411_15 + var_411_25 + arg_411_0 then
				arg_408_1.typewritter.percent = 1

				arg_408_1.typewritter:SetDirty()
				arg_408_1:ShowNextGo(true)
			end
		end
	end,
	Play413011100 = function(arg_412_0, arg_412_1)
		arg_412_1.time_ = 0
		arg_412_1.frameCnt_ = 0
		arg_412_1.state_ = "playing"
		arg_412_1.curTalkId_ = 413011100
		arg_412_1.duration_ = 8.43

		local var_412_0 = {
			zh = 5.2,
			ja = 8.433
		}
		local var_412_1 = manager.audio:GetLocalizationFlag()

		if var_412_0[var_412_1] ~= nil then
			arg_412_1.duration_ = var_412_0[var_412_1]
		end

		SetActive(arg_412_1.tipsGo_, false)

		function arg_412_1.onSingleLineFinish_()
			arg_412_1.onSingleLineUpdate_ = nil
			arg_412_1.onSingleLineFinish_ = nil
			arg_412_1.state_ = "waiting"
		end

		function arg_412_1.playNext_(arg_414_0)
			if arg_414_0 == 1 then
				arg_412_0:Play413011101(arg_412_1)
			end
		end

		function arg_412_1.onSingleLineUpdate_(arg_415_0)
			local var_415_0 = arg_412_1.actors_["10093"].transform
			local var_415_1 = 0

			if var_415_1 < arg_412_1.time_ and arg_412_1.time_ <= var_415_1 + arg_415_0 then
				arg_412_1.var_.moveOldPos10093 = var_415_0.localPosition
				var_415_0.localScale = Vector3.New(1, 1, 1)

				arg_412_1:CheckSpriteTmpPos("10093", 4)

				local var_415_2 = var_415_0.childCount

				for iter_415_0 = 0, var_415_2 - 1 do
					local var_415_3 = var_415_0:GetChild(iter_415_0)

					if var_415_3.name == "" or not string.find(var_415_3.name, "split") then
						var_415_3.gameObject:SetActive(true)
					else
						var_415_3.gameObject:SetActive(false)
					end
				end
			end

			local var_415_4 = 0.001

			if var_415_1 <= arg_412_1.time_ and arg_412_1.time_ < var_415_1 + var_415_4 then
				local var_415_5 = (arg_412_1.time_ - var_415_1) / var_415_4
				local var_415_6 = Vector3.New(390, -345, -245)

				var_415_0.localPosition = Vector3.Lerp(arg_412_1.var_.moveOldPos10093, var_415_6, var_415_5)
			end

			if arg_412_1.time_ >= var_415_1 + var_415_4 and arg_412_1.time_ < var_415_1 + var_415_4 + arg_415_0 then
				var_415_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_415_7 = arg_412_1.actors_["10093"]
			local var_415_8 = 0

			if var_415_8 < arg_412_1.time_ and arg_412_1.time_ <= var_415_8 + arg_415_0 and not isNil(var_415_7) and arg_412_1.var_.actorSpriteComps10093 == nil then
				arg_412_1.var_.actorSpriteComps10093 = var_415_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_415_9 = 2

			if var_415_8 <= arg_412_1.time_ and arg_412_1.time_ < var_415_8 + var_415_9 and not isNil(var_415_7) then
				local var_415_10 = (arg_412_1.time_ - var_415_8) / var_415_9

				if arg_412_1.var_.actorSpriteComps10093 then
					for iter_415_1, iter_415_2 in pairs(arg_412_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_415_2 then
							if arg_412_1.isInRecall_ then
								local var_415_11 = Mathf.Lerp(iter_415_2.color.r, arg_412_1.hightColor1.r, var_415_10)
								local var_415_12 = Mathf.Lerp(iter_415_2.color.g, arg_412_1.hightColor1.g, var_415_10)
								local var_415_13 = Mathf.Lerp(iter_415_2.color.b, arg_412_1.hightColor1.b, var_415_10)

								iter_415_2.color = Color.New(var_415_11, var_415_12, var_415_13)
							else
								local var_415_14 = Mathf.Lerp(iter_415_2.color.r, 1, var_415_10)

								iter_415_2.color = Color.New(var_415_14, var_415_14, var_415_14)
							end
						end
					end
				end
			end

			if arg_412_1.time_ >= var_415_8 + var_415_9 and arg_412_1.time_ < var_415_8 + var_415_9 + arg_415_0 and not isNil(var_415_7) and arg_412_1.var_.actorSpriteComps10093 then
				for iter_415_3, iter_415_4 in pairs(arg_412_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_415_4 then
						if arg_412_1.isInRecall_ then
							iter_415_4.color = arg_412_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_415_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_412_1.var_.actorSpriteComps10093 = nil
			end

			local var_415_15 = arg_412_1.actors_["10092"]
			local var_415_16 = 0

			if var_415_16 < arg_412_1.time_ and arg_412_1.time_ <= var_415_16 + arg_415_0 and not isNil(var_415_15) and arg_412_1.var_.actorSpriteComps10092 == nil then
				arg_412_1.var_.actorSpriteComps10092 = var_415_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_415_17 = 2

			if var_415_16 <= arg_412_1.time_ and arg_412_1.time_ < var_415_16 + var_415_17 and not isNil(var_415_15) then
				local var_415_18 = (arg_412_1.time_ - var_415_16) / var_415_17

				if arg_412_1.var_.actorSpriteComps10092 then
					for iter_415_5, iter_415_6 in pairs(arg_412_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_415_6 then
							if arg_412_1.isInRecall_ then
								local var_415_19 = Mathf.Lerp(iter_415_6.color.r, arg_412_1.hightColor2.r, var_415_18)
								local var_415_20 = Mathf.Lerp(iter_415_6.color.g, arg_412_1.hightColor2.g, var_415_18)
								local var_415_21 = Mathf.Lerp(iter_415_6.color.b, arg_412_1.hightColor2.b, var_415_18)

								iter_415_6.color = Color.New(var_415_19, var_415_20, var_415_21)
							else
								local var_415_22 = Mathf.Lerp(iter_415_6.color.r, 0.5, var_415_18)

								iter_415_6.color = Color.New(var_415_22, var_415_22, var_415_22)
							end
						end
					end
				end
			end

			if arg_412_1.time_ >= var_415_16 + var_415_17 and arg_412_1.time_ < var_415_16 + var_415_17 + arg_415_0 and not isNil(var_415_15) and arg_412_1.var_.actorSpriteComps10092 then
				for iter_415_7, iter_415_8 in pairs(arg_412_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_415_8 then
						if arg_412_1.isInRecall_ then
							iter_415_8.color = arg_412_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_415_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_412_1.var_.actorSpriteComps10092 = nil
			end

			local var_415_23 = 0
			local var_415_24 = 0.75

			if var_415_23 < arg_412_1.time_ and arg_412_1.time_ <= var_415_23 + arg_415_0 then
				arg_412_1.talkMaxDuration = 0
				arg_412_1.dialogCg_.alpha = 1

				arg_412_1.dialog_:SetActive(true)
				SetActive(arg_412_1.leftNameGo_, true)

				local var_415_25 = arg_412_1:FormatText(StoryNameCfg[28].name)

				arg_412_1.leftNameTxt_.text = var_415_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_412_1.leftNameTxt_.transform)

				arg_412_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_412_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_412_1:RecordName(arg_412_1.leftNameTxt_.text)
				SetActive(arg_412_1.iconTrs_.gameObject, false)
				arg_412_1.callingController_:SetSelectedState("normal")

				local var_415_26 = arg_412_1:GetWordFromCfg(413011100)
				local var_415_27 = arg_412_1:FormatText(var_415_26.content)

				arg_412_1.text_.text = var_415_27

				LuaForUtil.ClearLinePrefixSymbol(arg_412_1.text_)

				local var_415_28 = 30
				local var_415_29 = utf8.len(var_415_27)
				local var_415_30 = var_415_28 <= 0 and var_415_24 or var_415_24 * (var_415_29 / var_415_28)

				if var_415_30 > 0 and var_415_24 < var_415_30 then
					arg_412_1.talkMaxDuration = var_415_30

					if var_415_30 + var_415_23 > arg_412_1.duration_ then
						arg_412_1.duration_ = var_415_30 + var_415_23
					end
				end

				arg_412_1.text_.text = var_415_27
				arg_412_1.typewritter.percent = 0

				arg_412_1.typewritter:SetDirty()
				arg_412_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011100", "story_v_out_413011.awb") ~= 0 then
					local var_415_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011100", "story_v_out_413011.awb") / 1000

					if var_415_31 + var_415_23 > arg_412_1.duration_ then
						arg_412_1.duration_ = var_415_31 + var_415_23
					end

					if var_415_26.prefab_name ~= "" and arg_412_1.actors_[var_415_26.prefab_name] ~= nil then
						local var_415_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_412_1.actors_[var_415_26.prefab_name].transform, "story_v_out_413011", "413011100", "story_v_out_413011.awb")

						arg_412_1:RecordAudio("413011100", var_415_32)
						arg_412_1:RecordAudio("413011100", var_415_32)
					else
						arg_412_1:AudioAction("play", "voice", "story_v_out_413011", "413011100", "story_v_out_413011.awb")
					end

					arg_412_1:RecordHistoryTalkVoice("story_v_out_413011", "413011100", "story_v_out_413011.awb")
				end

				arg_412_1:RecordContent(arg_412_1.text_.text)
			end

			local var_415_33 = math.max(var_415_24, arg_412_1.talkMaxDuration)

			if var_415_23 <= arg_412_1.time_ and arg_412_1.time_ < var_415_23 + var_415_33 then
				arg_412_1.typewritter.percent = (arg_412_1.time_ - var_415_23) / var_415_33

				arg_412_1.typewritter:SetDirty()
			end

			if arg_412_1.time_ >= var_415_23 + var_415_33 and arg_412_1.time_ < var_415_23 + var_415_33 + arg_415_0 then
				arg_412_1.typewritter.percent = 1

				arg_412_1.typewritter:SetDirty()
				arg_412_1:ShowNextGo(true)
			end
		end
	end,
	Play413011101 = function(arg_416_0, arg_416_1)
		arg_416_1.time_ = 0
		arg_416_1.frameCnt_ = 0
		arg_416_1.state_ = "playing"
		arg_416_1.curTalkId_ = 413011101
		arg_416_1.duration_ = 9.7

		local var_416_0 = {
			zh = 7.366,
			ja = 9.7
		}
		local var_416_1 = manager.audio:GetLocalizationFlag()

		if var_416_0[var_416_1] ~= nil then
			arg_416_1.duration_ = var_416_0[var_416_1]
		end

		SetActive(arg_416_1.tipsGo_, false)

		function arg_416_1.onSingleLineFinish_()
			arg_416_1.onSingleLineUpdate_ = nil
			arg_416_1.onSingleLineFinish_ = nil
			arg_416_1.state_ = "waiting"
		end

		function arg_416_1.playNext_(arg_418_0)
			if arg_418_0 == 1 then
				arg_416_0:Play413011102(arg_416_1)
			end
		end

		function arg_416_1.onSingleLineUpdate_(arg_419_0)
			local var_419_0 = arg_416_1.actors_["10093"]
			local var_419_1 = 0

			if var_419_1 < arg_416_1.time_ and arg_416_1.time_ <= var_419_1 + arg_419_0 and not isNil(var_419_0) and arg_416_1.var_.actorSpriteComps10093 == nil then
				arg_416_1.var_.actorSpriteComps10093 = var_419_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_419_2 = 2

			if var_419_1 <= arg_416_1.time_ and arg_416_1.time_ < var_419_1 + var_419_2 and not isNil(var_419_0) then
				local var_419_3 = (arg_416_1.time_ - var_419_1) / var_419_2

				if arg_416_1.var_.actorSpriteComps10093 then
					for iter_419_0, iter_419_1 in pairs(arg_416_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_419_1 then
							if arg_416_1.isInRecall_ then
								local var_419_4 = Mathf.Lerp(iter_419_1.color.r, arg_416_1.hightColor2.r, var_419_3)
								local var_419_5 = Mathf.Lerp(iter_419_1.color.g, arg_416_1.hightColor2.g, var_419_3)
								local var_419_6 = Mathf.Lerp(iter_419_1.color.b, arg_416_1.hightColor2.b, var_419_3)

								iter_419_1.color = Color.New(var_419_4, var_419_5, var_419_6)
							else
								local var_419_7 = Mathf.Lerp(iter_419_1.color.r, 0.5, var_419_3)

								iter_419_1.color = Color.New(var_419_7, var_419_7, var_419_7)
							end
						end
					end
				end
			end

			if arg_416_1.time_ >= var_419_1 + var_419_2 and arg_416_1.time_ < var_419_1 + var_419_2 + arg_419_0 and not isNil(var_419_0) and arg_416_1.var_.actorSpriteComps10093 then
				for iter_419_2, iter_419_3 in pairs(arg_416_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_419_3 then
						if arg_416_1.isInRecall_ then
							iter_419_3.color = arg_416_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_419_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_416_1.var_.actorSpriteComps10093 = nil
			end

			local var_419_8 = arg_416_1.actors_["10092"]
			local var_419_9 = 0

			if var_419_9 < arg_416_1.time_ and arg_416_1.time_ <= var_419_9 + arg_419_0 and not isNil(var_419_8) and arg_416_1.var_.actorSpriteComps10092 == nil then
				arg_416_1.var_.actorSpriteComps10092 = var_419_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_419_10 = 2

			if var_419_9 <= arg_416_1.time_ and arg_416_1.time_ < var_419_9 + var_419_10 and not isNil(var_419_8) then
				local var_419_11 = (arg_416_1.time_ - var_419_9) / var_419_10

				if arg_416_1.var_.actorSpriteComps10092 then
					for iter_419_4, iter_419_5 in pairs(arg_416_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_419_5 then
							if arg_416_1.isInRecall_ then
								local var_419_12 = Mathf.Lerp(iter_419_5.color.r, arg_416_1.hightColor1.r, var_419_11)
								local var_419_13 = Mathf.Lerp(iter_419_5.color.g, arg_416_1.hightColor1.g, var_419_11)
								local var_419_14 = Mathf.Lerp(iter_419_5.color.b, arg_416_1.hightColor1.b, var_419_11)

								iter_419_5.color = Color.New(var_419_12, var_419_13, var_419_14)
							else
								local var_419_15 = Mathf.Lerp(iter_419_5.color.r, 1, var_419_11)

								iter_419_5.color = Color.New(var_419_15, var_419_15, var_419_15)
							end
						end
					end
				end
			end

			if arg_416_1.time_ >= var_419_9 + var_419_10 and arg_416_1.time_ < var_419_9 + var_419_10 + arg_419_0 and not isNil(var_419_8) and arg_416_1.var_.actorSpriteComps10092 then
				for iter_419_6, iter_419_7 in pairs(arg_416_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_419_7 then
						if arg_416_1.isInRecall_ then
							iter_419_7.color = arg_416_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_419_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_416_1.var_.actorSpriteComps10092 = nil
			end

			local var_419_16 = arg_416_1.actors_["10092"].transform
			local var_419_17 = 0

			if var_419_17 < arg_416_1.time_ and arg_416_1.time_ <= var_419_17 + arg_419_0 then
				arg_416_1.var_.moveOldPos10092 = var_419_16.localPosition
				var_419_16.localScale = Vector3.New(1, 1, 1)

				arg_416_1:CheckSpriteTmpPos("10092", 2)

				local var_419_18 = var_419_16.childCount

				for iter_419_8 = 0, var_419_18 - 1 do
					local var_419_19 = var_419_16:GetChild(iter_419_8)

					if var_419_19.name == "split_6" or not string.find(var_419_19.name, "split") then
						var_419_19.gameObject:SetActive(true)
					else
						var_419_19.gameObject:SetActive(false)
					end
				end
			end

			local var_419_20 = 0.001

			if var_419_17 <= arg_416_1.time_ and arg_416_1.time_ < var_419_17 + var_419_20 then
				local var_419_21 = (arg_416_1.time_ - var_419_17) / var_419_20
				local var_419_22 = Vector3.New(-389.49, -300, -295)

				var_419_16.localPosition = Vector3.Lerp(arg_416_1.var_.moveOldPos10092, var_419_22, var_419_21)
			end

			if arg_416_1.time_ >= var_419_17 + var_419_20 and arg_416_1.time_ < var_419_17 + var_419_20 + arg_419_0 then
				var_419_16.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_419_23 = 0
			local var_419_24 = 0.825

			if var_419_23 < arg_416_1.time_ and arg_416_1.time_ <= var_419_23 + arg_419_0 then
				arg_416_1.talkMaxDuration = 0
				arg_416_1.dialogCg_.alpha = 1

				arg_416_1.dialog_:SetActive(true)
				SetActive(arg_416_1.leftNameGo_, true)

				local var_419_25 = arg_416_1:FormatText(StoryNameCfg[996].name)

				arg_416_1.leftNameTxt_.text = var_419_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_416_1.leftNameTxt_.transform)

				arg_416_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_416_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_416_1:RecordName(arg_416_1.leftNameTxt_.text)
				SetActive(arg_416_1.iconTrs_.gameObject, false)
				arg_416_1.callingController_:SetSelectedState("normal")

				local var_419_26 = arg_416_1:GetWordFromCfg(413011101)
				local var_419_27 = arg_416_1:FormatText(var_419_26.content)

				arg_416_1.text_.text = var_419_27

				LuaForUtil.ClearLinePrefixSymbol(arg_416_1.text_)

				local var_419_28 = 33
				local var_419_29 = utf8.len(var_419_27)
				local var_419_30 = var_419_28 <= 0 and var_419_24 or var_419_24 * (var_419_29 / var_419_28)

				if var_419_30 > 0 and var_419_24 < var_419_30 then
					arg_416_1.talkMaxDuration = var_419_30

					if var_419_30 + var_419_23 > arg_416_1.duration_ then
						arg_416_1.duration_ = var_419_30 + var_419_23
					end
				end

				arg_416_1.text_.text = var_419_27
				arg_416_1.typewritter.percent = 0

				arg_416_1.typewritter:SetDirty()
				arg_416_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011101", "story_v_out_413011.awb") ~= 0 then
					local var_419_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011101", "story_v_out_413011.awb") / 1000

					if var_419_31 + var_419_23 > arg_416_1.duration_ then
						arg_416_1.duration_ = var_419_31 + var_419_23
					end

					if var_419_26.prefab_name ~= "" and arg_416_1.actors_[var_419_26.prefab_name] ~= nil then
						local var_419_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_416_1.actors_[var_419_26.prefab_name].transform, "story_v_out_413011", "413011101", "story_v_out_413011.awb")

						arg_416_1:RecordAudio("413011101", var_419_32)
						arg_416_1:RecordAudio("413011101", var_419_32)
					else
						arg_416_1:AudioAction("play", "voice", "story_v_out_413011", "413011101", "story_v_out_413011.awb")
					end

					arg_416_1:RecordHistoryTalkVoice("story_v_out_413011", "413011101", "story_v_out_413011.awb")
				end

				arg_416_1:RecordContent(arg_416_1.text_.text)
			end

			local var_419_33 = math.max(var_419_24, arg_416_1.talkMaxDuration)

			if var_419_23 <= arg_416_1.time_ and arg_416_1.time_ < var_419_23 + var_419_33 then
				arg_416_1.typewritter.percent = (arg_416_1.time_ - var_419_23) / var_419_33

				arg_416_1.typewritter:SetDirty()
			end

			if arg_416_1.time_ >= var_419_23 + var_419_33 and arg_416_1.time_ < var_419_23 + var_419_33 + arg_419_0 then
				arg_416_1.typewritter.percent = 1

				arg_416_1.typewritter:SetDirty()
				arg_416_1:ShowNextGo(true)
			end
		end
	end,
	Play413011102 = function(arg_420_0, arg_420_1)
		arg_420_1.time_ = 0
		arg_420_1.frameCnt_ = 0
		arg_420_1.state_ = "playing"
		arg_420_1.curTalkId_ = 413011102
		arg_420_1.duration_ = 10.37

		local var_420_0 = {
			zh = 9.4,
			ja = 10.366
		}
		local var_420_1 = manager.audio:GetLocalizationFlag()

		if var_420_0[var_420_1] ~= nil then
			arg_420_1.duration_ = var_420_0[var_420_1]
		end

		SetActive(arg_420_1.tipsGo_, false)

		function arg_420_1.onSingleLineFinish_()
			arg_420_1.onSingleLineUpdate_ = nil
			arg_420_1.onSingleLineFinish_ = nil
			arg_420_1.state_ = "waiting"
		end

		function arg_420_1.playNext_(arg_422_0)
			if arg_422_0 == 1 then
				arg_420_0:Play413011103(arg_420_1)
			end
		end

		function arg_420_1.onSingleLineUpdate_(arg_423_0)
			local var_423_0 = 0
			local var_423_1 = 1.025

			if var_423_0 < arg_420_1.time_ and arg_420_1.time_ <= var_423_0 + arg_423_0 then
				arg_420_1.talkMaxDuration = 0
				arg_420_1.dialogCg_.alpha = 1

				arg_420_1.dialog_:SetActive(true)
				SetActive(arg_420_1.leftNameGo_, true)

				local var_423_2 = arg_420_1:FormatText(StoryNameCfg[996].name)

				arg_420_1.leftNameTxt_.text = var_423_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_420_1.leftNameTxt_.transform)

				arg_420_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_420_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_420_1:RecordName(arg_420_1.leftNameTxt_.text)
				SetActive(arg_420_1.iconTrs_.gameObject, false)
				arg_420_1.callingController_:SetSelectedState("normal")

				local var_423_3 = arg_420_1:GetWordFromCfg(413011102)
				local var_423_4 = arg_420_1:FormatText(var_423_3.content)

				arg_420_1.text_.text = var_423_4

				LuaForUtil.ClearLinePrefixSymbol(arg_420_1.text_)

				local var_423_5 = 41
				local var_423_6 = utf8.len(var_423_4)
				local var_423_7 = var_423_5 <= 0 and var_423_1 or var_423_1 * (var_423_6 / var_423_5)

				if var_423_7 > 0 and var_423_1 < var_423_7 then
					arg_420_1.talkMaxDuration = var_423_7

					if var_423_7 + var_423_0 > arg_420_1.duration_ then
						arg_420_1.duration_ = var_423_7 + var_423_0
					end
				end

				arg_420_1.text_.text = var_423_4
				arg_420_1.typewritter.percent = 0

				arg_420_1.typewritter:SetDirty()
				arg_420_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011102", "story_v_out_413011.awb") ~= 0 then
					local var_423_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011102", "story_v_out_413011.awb") / 1000

					if var_423_8 + var_423_0 > arg_420_1.duration_ then
						arg_420_1.duration_ = var_423_8 + var_423_0
					end

					if var_423_3.prefab_name ~= "" and arg_420_1.actors_[var_423_3.prefab_name] ~= nil then
						local var_423_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_420_1.actors_[var_423_3.prefab_name].transform, "story_v_out_413011", "413011102", "story_v_out_413011.awb")

						arg_420_1:RecordAudio("413011102", var_423_9)
						arg_420_1:RecordAudio("413011102", var_423_9)
					else
						arg_420_1:AudioAction("play", "voice", "story_v_out_413011", "413011102", "story_v_out_413011.awb")
					end

					arg_420_1:RecordHistoryTalkVoice("story_v_out_413011", "413011102", "story_v_out_413011.awb")
				end

				arg_420_1:RecordContent(arg_420_1.text_.text)
			end

			local var_423_10 = math.max(var_423_1, arg_420_1.talkMaxDuration)

			if var_423_0 <= arg_420_1.time_ and arg_420_1.time_ < var_423_0 + var_423_10 then
				arg_420_1.typewritter.percent = (arg_420_1.time_ - var_423_0) / var_423_10

				arg_420_1.typewritter:SetDirty()
			end

			if arg_420_1.time_ >= var_423_0 + var_423_10 and arg_420_1.time_ < var_423_0 + var_423_10 + arg_423_0 then
				arg_420_1.typewritter.percent = 1

				arg_420_1.typewritter:SetDirty()
				arg_420_1:ShowNextGo(true)
			end
		end
	end,
	Play413011103 = function(arg_424_0, arg_424_1)
		arg_424_1.time_ = 0
		arg_424_1.frameCnt_ = 0
		arg_424_1.state_ = "playing"
		arg_424_1.curTalkId_ = 413011103
		arg_424_1.duration_ = 7.6

		local var_424_0 = {
			zh = 6.333,
			ja = 7.6
		}
		local var_424_1 = manager.audio:GetLocalizationFlag()

		if var_424_0[var_424_1] ~= nil then
			arg_424_1.duration_ = var_424_0[var_424_1]
		end

		SetActive(arg_424_1.tipsGo_, false)

		function arg_424_1.onSingleLineFinish_()
			arg_424_1.onSingleLineUpdate_ = nil
			arg_424_1.onSingleLineFinish_ = nil
			arg_424_1.state_ = "waiting"
		end

		function arg_424_1.playNext_(arg_426_0)
			if arg_426_0 == 1 then
				arg_424_0:Play413011104(arg_424_1)
			end
		end

		function arg_424_1.onSingleLineUpdate_(arg_427_0)
			local var_427_0 = arg_424_1.actors_["10093"].transform
			local var_427_1 = 0

			if var_427_1 < arg_424_1.time_ and arg_424_1.time_ <= var_427_1 + arg_427_0 then
				arg_424_1.var_.moveOldPos10093 = var_427_0.localPosition
				var_427_0.localScale = Vector3.New(1, 1, 1)

				arg_424_1:CheckSpriteTmpPos("10093", 4)

				local var_427_2 = var_427_0.childCount

				for iter_427_0 = 0, var_427_2 - 1 do
					local var_427_3 = var_427_0:GetChild(iter_427_0)

					if var_427_3.name == "split_4" or not string.find(var_427_3.name, "split") then
						var_427_3.gameObject:SetActive(true)
					else
						var_427_3.gameObject:SetActive(false)
					end
				end
			end

			local var_427_4 = 0.001

			if var_427_1 <= arg_424_1.time_ and arg_424_1.time_ < var_427_1 + var_427_4 then
				local var_427_5 = (arg_424_1.time_ - var_427_1) / var_427_4
				local var_427_6 = Vector3.New(390, -345, -245)

				var_427_0.localPosition = Vector3.Lerp(arg_424_1.var_.moveOldPos10093, var_427_6, var_427_5)
			end

			if arg_424_1.time_ >= var_427_1 + var_427_4 and arg_424_1.time_ < var_427_1 + var_427_4 + arg_427_0 then
				var_427_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_427_7 = arg_424_1.actors_["10093"]
			local var_427_8 = 0

			if var_427_8 < arg_424_1.time_ and arg_424_1.time_ <= var_427_8 + arg_427_0 and not isNil(var_427_7) and arg_424_1.var_.actorSpriteComps10093 == nil then
				arg_424_1.var_.actorSpriteComps10093 = var_427_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_427_9 = 2

			if var_427_8 <= arg_424_1.time_ and arg_424_1.time_ < var_427_8 + var_427_9 and not isNil(var_427_7) then
				local var_427_10 = (arg_424_1.time_ - var_427_8) / var_427_9

				if arg_424_1.var_.actorSpriteComps10093 then
					for iter_427_1, iter_427_2 in pairs(arg_424_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_427_2 then
							if arg_424_1.isInRecall_ then
								local var_427_11 = Mathf.Lerp(iter_427_2.color.r, arg_424_1.hightColor1.r, var_427_10)
								local var_427_12 = Mathf.Lerp(iter_427_2.color.g, arg_424_1.hightColor1.g, var_427_10)
								local var_427_13 = Mathf.Lerp(iter_427_2.color.b, arg_424_1.hightColor1.b, var_427_10)

								iter_427_2.color = Color.New(var_427_11, var_427_12, var_427_13)
							else
								local var_427_14 = Mathf.Lerp(iter_427_2.color.r, 1, var_427_10)

								iter_427_2.color = Color.New(var_427_14, var_427_14, var_427_14)
							end
						end
					end
				end
			end

			if arg_424_1.time_ >= var_427_8 + var_427_9 and arg_424_1.time_ < var_427_8 + var_427_9 + arg_427_0 and not isNil(var_427_7) and arg_424_1.var_.actorSpriteComps10093 then
				for iter_427_3, iter_427_4 in pairs(arg_424_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_427_4 then
						if arg_424_1.isInRecall_ then
							iter_427_4.color = arg_424_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_427_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_424_1.var_.actorSpriteComps10093 = nil
			end

			local var_427_15 = arg_424_1.actors_["10092"]
			local var_427_16 = 0

			if var_427_16 < arg_424_1.time_ and arg_424_1.time_ <= var_427_16 + arg_427_0 and not isNil(var_427_15) and arg_424_1.var_.actorSpriteComps10092 == nil then
				arg_424_1.var_.actorSpriteComps10092 = var_427_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_427_17 = 2

			if var_427_16 <= arg_424_1.time_ and arg_424_1.time_ < var_427_16 + var_427_17 and not isNil(var_427_15) then
				local var_427_18 = (arg_424_1.time_ - var_427_16) / var_427_17

				if arg_424_1.var_.actorSpriteComps10092 then
					for iter_427_5, iter_427_6 in pairs(arg_424_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_427_6 then
							if arg_424_1.isInRecall_ then
								local var_427_19 = Mathf.Lerp(iter_427_6.color.r, arg_424_1.hightColor2.r, var_427_18)
								local var_427_20 = Mathf.Lerp(iter_427_6.color.g, arg_424_1.hightColor2.g, var_427_18)
								local var_427_21 = Mathf.Lerp(iter_427_6.color.b, arg_424_1.hightColor2.b, var_427_18)

								iter_427_6.color = Color.New(var_427_19, var_427_20, var_427_21)
							else
								local var_427_22 = Mathf.Lerp(iter_427_6.color.r, 0.5, var_427_18)

								iter_427_6.color = Color.New(var_427_22, var_427_22, var_427_22)
							end
						end
					end
				end
			end

			if arg_424_1.time_ >= var_427_16 + var_427_17 and arg_424_1.time_ < var_427_16 + var_427_17 + arg_427_0 and not isNil(var_427_15) and arg_424_1.var_.actorSpriteComps10092 then
				for iter_427_7, iter_427_8 in pairs(arg_424_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_427_8 then
						if arg_424_1.isInRecall_ then
							iter_427_8.color = arg_424_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_427_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_424_1.var_.actorSpriteComps10092 = nil
			end

			local var_427_23 = 0
			local var_427_24 = 0.625

			if var_427_23 < arg_424_1.time_ and arg_424_1.time_ <= var_427_23 + arg_427_0 then
				arg_424_1.talkMaxDuration = 0
				arg_424_1.dialogCg_.alpha = 1

				arg_424_1.dialog_:SetActive(true)
				SetActive(arg_424_1.leftNameGo_, true)

				local var_427_25 = arg_424_1:FormatText(StoryNameCfg[28].name)

				arg_424_1.leftNameTxt_.text = var_427_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_424_1.leftNameTxt_.transform)

				arg_424_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_424_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_424_1:RecordName(arg_424_1.leftNameTxt_.text)
				SetActive(arg_424_1.iconTrs_.gameObject, false)
				arg_424_1.callingController_:SetSelectedState("normal")

				local var_427_26 = arg_424_1:GetWordFromCfg(413011103)
				local var_427_27 = arg_424_1:FormatText(var_427_26.content)

				arg_424_1.text_.text = var_427_27

				LuaForUtil.ClearLinePrefixSymbol(arg_424_1.text_)

				local var_427_28 = 25
				local var_427_29 = utf8.len(var_427_27)
				local var_427_30 = var_427_28 <= 0 and var_427_24 or var_427_24 * (var_427_29 / var_427_28)

				if var_427_30 > 0 and var_427_24 < var_427_30 then
					arg_424_1.talkMaxDuration = var_427_30

					if var_427_30 + var_427_23 > arg_424_1.duration_ then
						arg_424_1.duration_ = var_427_30 + var_427_23
					end
				end

				arg_424_1.text_.text = var_427_27
				arg_424_1.typewritter.percent = 0

				arg_424_1.typewritter:SetDirty()
				arg_424_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011103", "story_v_out_413011.awb") ~= 0 then
					local var_427_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011103", "story_v_out_413011.awb") / 1000

					if var_427_31 + var_427_23 > arg_424_1.duration_ then
						arg_424_1.duration_ = var_427_31 + var_427_23
					end

					if var_427_26.prefab_name ~= "" and arg_424_1.actors_[var_427_26.prefab_name] ~= nil then
						local var_427_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_424_1.actors_[var_427_26.prefab_name].transform, "story_v_out_413011", "413011103", "story_v_out_413011.awb")

						arg_424_1:RecordAudio("413011103", var_427_32)
						arg_424_1:RecordAudio("413011103", var_427_32)
					else
						arg_424_1:AudioAction("play", "voice", "story_v_out_413011", "413011103", "story_v_out_413011.awb")
					end

					arg_424_1:RecordHistoryTalkVoice("story_v_out_413011", "413011103", "story_v_out_413011.awb")
				end

				arg_424_1:RecordContent(arg_424_1.text_.text)
			end

			local var_427_33 = math.max(var_427_24, arg_424_1.talkMaxDuration)

			if var_427_23 <= arg_424_1.time_ and arg_424_1.time_ < var_427_23 + var_427_33 then
				arg_424_1.typewritter.percent = (arg_424_1.time_ - var_427_23) / var_427_33

				arg_424_1.typewritter:SetDirty()
			end

			if arg_424_1.time_ >= var_427_23 + var_427_33 and arg_424_1.time_ < var_427_23 + var_427_33 + arg_427_0 then
				arg_424_1.typewritter.percent = 1

				arg_424_1.typewritter:SetDirty()
				arg_424_1:ShowNextGo(true)
			end
		end
	end,
	Play413011104 = function(arg_428_0, arg_428_1)
		arg_428_1.time_ = 0
		arg_428_1.frameCnt_ = 0
		arg_428_1.state_ = "playing"
		arg_428_1.curTalkId_ = 413011104
		arg_428_1.duration_ = 9.7

		local var_428_0 = {
			zh = 5,
			ja = 9.7
		}
		local var_428_1 = manager.audio:GetLocalizationFlag()

		if var_428_0[var_428_1] ~= nil then
			arg_428_1.duration_ = var_428_0[var_428_1]
		end

		SetActive(arg_428_1.tipsGo_, false)

		function arg_428_1.onSingleLineFinish_()
			arg_428_1.onSingleLineUpdate_ = nil
			arg_428_1.onSingleLineFinish_ = nil
			arg_428_1.state_ = "waiting"
		end

		function arg_428_1.playNext_(arg_430_0)
			if arg_430_0 == 1 then
				arg_428_0:Play413011105(arg_428_1)
			end
		end

		function arg_428_1.onSingleLineUpdate_(arg_431_0)
			local var_431_0 = arg_428_1.actors_["10093"]
			local var_431_1 = 0

			if var_431_1 < arg_428_1.time_ and arg_428_1.time_ <= var_431_1 + arg_431_0 and not isNil(var_431_0) and arg_428_1.var_.actorSpriteComps10093 == nil then
				arg_428_1.var_.actorSpriteComps10093 = var_431_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_431_2 = 2

			if var_431_1 <= arg_428_1.time_ and arg_428_1.time_ < var_431_1 + var_431_2 and not isNil(var_431_0) then
				local var_431_3 = (arg_428_1.time_ - var_431_1) / var_431_2

				if arg_428_1.var_.actorSpriteComps10093 then
					for iter_431_0, iter_431_1 in pairs(arg_428_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_431_1 then
							if arg_428_1.isInRecall_ then
								local var_431_4 = Mathf.Lerp(iter_431_1.color.r, arg_428_1.hightColor2.r, var_431_3)
								local var_431_5 = Mathf.Lerp(iter_431_1.color.g, arg_428_1.hightColor2.g, var_431_3)
								local var_431_6 = Mathf.Lerp(iter_431_1.color.b, arg_428_1.hightColor2.b, var_431_3)

								iter_431_1.color = Color.New(var_431_4, var_431_5, var_431_6)
							else
								local var_431_7 = Mathf.Lerp(iter_431_1.color.r, 0.5, var_431_3)

								iter_431_1.color = Color.New(var_431_7, var_431_7, var_431_7)
							end
						end
					end
				end
			end

			if arg_428_1.time_ >= var_431_1 + var_431_2 and arg_428_1.time_ < var_431_1 + var_431_2 + arg_431_0 and not isNil(var_431_0) and arg_428_1.var_.actorSpriteComps10093 then
				for iter_431_2, iter_431_3 in pairs(arg_428_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_431_3 then
						if arg_428_1.isInRecall_ then
							iter_431_3.color = arg_428_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_431_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_428_1.var_.actorSpriteComps10093 = nil
			end

			local var_431_8 = arg_428_1.actors_["10092"]
			local var_431_9 = 0

			if var_431_9 < arg_428_1.time_ and arg_428_1.time_ <= var_431_9 + arg_431_0 and not isNil(var_431_8) and arg_428_1.var_.actorSpriteComps10092 == nil then
				arg_428_1.var_.actorSpriteComps10092 = var_431_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_431_10 = 2

			if var_431_9 <= arg_428_1.time_ and arg_428_1.time_ < var_431_9 + var_431_10 and not isNil(var_431_8) then
				local var_431_11 = (arg_428_1.time_ - var_431_9) / var_431_10

				if arg_428_1.var_.actorSpriteComps10092 then
					for iter_431_4, iter_431_5 in pairs(arg_428_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_431_5 then
							if arg_428_1.isInRecall_ then
								local var_431_12 = Mathf.Lerp(iter_431_5.color.r, arg_428_1.hightColor1.r, var_431_11)
								local var_431_13 = Mathf.Lerp(iter_431_5.color.g, arg_428_1.hightColor1.g, var_431_11)
								local var_431_14 = Mathf.Lerp(iter_431_5.color.b, arg_428_1.hightColor1.b, var_431_11)

								iter_431_5.color = Color.New(var_431_12, var_431_13, var_431_14)
							else
								local var_431_15 = Mathf.Lerp(iter_431_5.color.r, 1, var_431_11)

								iter_431_5.color = Color.New(var_431_15, var_431_15, var_431_15)
							end
						end
					end
				end
			end

			if arg_428_1.time_ >= var_431_9 + var_431_10 and arg_428_1.time_ < var_431_9 + var_431_10 + arg_431_0 and not isNil(var_431_8) and arg_428_1.var_.actorSpriteComps10092 then
				for iter_431_6, iter_431_7 in pairs(arg_428_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_431_7 then
						if arg_428_1.isInRecall_ then
							iter_431_7.color = arg_428_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_431_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_428_1.var_.actorSpriteComps10092 = nil
			end

			local var_431_16 = 0
			local var_431_17 = 0.475

			if var_431_16 < arg_428_1.time_ and arg_428_1.time_ <= var_431_16 + arg_431_0 then
				arg_428_1.talkMaxDuration = 0
				arg_428_1.dialogCg_.alpha = 1

				arg_428_1.dialog_:SetActive(true)
				SetActive(arg_428_1.leftNameGo_, true)

				local var_431_18 = arg_428_1:FormatText(StoryNameCfg[996].name)

				arg_428_1.leftNameTxt_.text = var_431_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_428_1.leftNameTxt_.transform)

				arg_428_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_428_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_428_1:RecordName(arg_428_1.leftNameTxt_.text)
				SetActive(arg_428_1.iconTrs_.gameObject, false)
				arg_428_1.callingController_:SetSelectedState("normal")

				local var_431_19 = arg_428_1:GetWordFromCfg(413011104)
				local var_431_20 = arg_428_1:FormatText(var_431_19.content)

				arg_428_1.text_.text = var_431_20

				LuaForUtil.ClearLinePrefixSymbol(arg_428_1.text_)

				local var_431_21 = 19
				local var_431_22 = utf8.len(var_431_20)
				local var_431_23 = var_431_21 <= 0 and var_431_17 or var_431_17 * (var_431_22 / var_431_21)

				if var_431_23 > 0 and var_431_17 < var_431_23 then
					arg_428_1.talkMaxDuration = var_431_23

					if var_431_23 + var_431_16 > arg_428_1.duration_ then
						arg_428_1.duration_ = var_431_23 + var_431_16
					end
				end

				arg_428_1.text_.text = var_431_20
				arg_428_1.typewritter.percent = 0

				arg_428_1.typewritter:SetDirty()
				arg_428_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011104", "story_v_out_413011.awb") ~= 0 then
					local var_431_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011104", "story_v_out_413011.awb") / 1000

					if var_431_24 + var_431_16 > arg_428_1.duration_ then
						arg_428_1.duration_ = var_431_24 + var_431_16
					end

					if var_431_19.prefab_name ~= "" and arg_428_1.actors_[var_431_19.prefab_name] ~= nil then
						local var_431_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_428_1.actors_[var_431_19.prefab_name].transform, "story_v_out_413011", "413011104", "story_v_out_413011.awb")

						arg_428_1:RecordAudio("413011104", var_431_25)
						arg_428_1:RecordAudio("413011104", var_431_25)
					else
						arg_428_1:AudioAction("play", "voice", "story_v_out_413011", "413011104", "story_v_out_413011.awb")
					end

					arg_428_1:RecordHistoryTalkVoice("story_v_out_413011", "413011104", "story_v_out_413011.awb")
				end

				arg_428_1:RecordContent(arg_428_1.text_.text)
			end

			local var_431_26 = math.max(var_431_17, arg_428_1.talkMaxDuration)

			if var_431_16 <= arg_428_1.time_ and arg_428_1.time_ < var_431_16 + var_431_26 then
				arg_428_1.typewritter.percent = (arg_428_1.time_ - var_431_16) / var_431_26

				arg_428_1.typewritter:SetDirty()
			end

			if arg_428_1.time_ >= var_431_16 + var_431_26 and arg_428_1.time_ < var_431_16 + var_431_26 + arg_431_0 then
				arg_428_1.typewritter.percent = 1

				arg_428_1.typewritter:SetDirty()
				arg_428_1:ShowNextGo(true)
			end
		end
	end,
	Play413011105 = function(arg_432_0, arg_432_1)
		arg_432_1.time_ = 0
		arg_432_1.frameCnt_ = 0
		arg_432_1.state_ = "playing"
		arg_432_1.curTalkId_ = 413011105
		arg_432_1.duration_ = 2

		SetActive(arg_432_1.tipsGo_, false)

		function arg_432_1.onSingleLineFinish_()
			arg_432_1.onSingleLineUpdate_ = nil
			arg_432_1.onSingleLineFinish_ = nil
			arg_432_1.state_ = "waiting"
		end

		function arg_432_1.playNext_(arg_434_0)
			if arg_434_0 == 1 then
				arg_432_0:Play413011106(arg_432_1)
			end
		end

		function arg_432_1.onSingleLineUpdate_(arg_435_0)
			local var_435_0 = arg_432_1.actors_["10093"].transform
			local var_435_1 = 0

			if var_435_1 < arg_432_1.time_ and arg_432_1.time_ <= var_435_1 + arg_435_0 then
				arg_432_1.var_.moveOldPos10093 = var_435_0.localPosition
				var_435_0.localScale = Vector3.New(1, 1, 1)

				arg_432_1:CheckSpriteTmpPos("10093", 4)

				local var_435_2 = var_435_0.childCount

				for iter_435_0 = 0, var_435_2 - 1 do
					local var_435_3 = var_435_0:GetChild(iter_435_0)

					if var_435_3.name == "split_6" or not string.find(var_435_3.name, "split") then
						var_435_3.gameObject:SetActive(true)
					else
						var_435_3.gameObject:SetActive(false)
					end
				end
			end

			local var_435_4 = 0.001

			if var_435_1 <= arg_432_1.time_ and arg_432_1.time_ < var_435_1 + var_435_4 then
				local var_435_5 = (arg_432_1.time_ - var_435_1) / var_435_4
				local var_435_6 = Vector3.New(390, -345, -245)

				var_435_0.localPosition = Vector3.Lerp(arg_432_1.var_.moveOldPos10093, var_435_6, var_435_5)
			end

			if arg_432_1.time_ >= var_435_1 + var_435_4 and arg_432_1.time_ < var_435_1 + var_435_4 + arg_435_0 then
				var_435_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_435_7 = arg_432_1.actors_["10093"]
			local var_435_8 = 0

			if var_435_8 < arg_432_1.time_ and arg_432_1.time_ <= var_435_8 + arg_435_0 and not isNil(var_435_7) and arg_432_1.var_.actorSpriteComps10093 == nil then
				arg_432_1.var_.actorSpriteComps10093 = var_435_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_435_9 = 2

			if var_435_8 <= arg_432_1.time_ and arg_432_1.time_ < var_435_8 + var_435_9 and not isNil(var_435_7) then
				local var_435_10 = (arg_432_1.time_ - var_435_8) / var_435_9

				if arg_432_1.var_.actorSpriteComps10093 then
					for iter_435_1, iter_435_2 in pairs(arg_432_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_435_2 then
							if arg_432_1.isInRecall_ then
								local var_435_11 = Mathf.Lerp(iter_435_2.color.r, arg_432_1.hightColor1.r, var_435_10)
								local var_435_12 = Mathf.Lerp(iter_435_2.color.g, arg_432_1.hightColor1.g, var_435_10)
								local var_435_13 = Mathf.Lerp(iter_435_2.color.b, arg_432_1.hightColor1.b, var_435_10)

								iter_435_2.color = Color.New(var_435_11, var_435_12, var_435_13)
							else
								local var_435_14 = Mathf.Lerp(iter_435_2.color.r, 1, var_435_10)

								iter_435_2.color = Color.New(var_435_14, var_435_14, var_435_14)
							end
						end
					end
				end
			end

			if arg_432_1.time_ >= var_435_8 + var_435_9 and arg_432_1.time_ < var_435_8 + var_435_9 + arg_435_0 and not isNil(var_435_7) and arg_432_1.var_.actorSpriteComps10093 then
				for iter_435_3, iter_435_4 in pairs(arg_432_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_435_4 then
						if arg_432_1.isInRecall_ then
							iter_435_4.color = arg_432_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_435_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_432_1.var_.actorSpriteComps10093 = nil
			end

			local var_435_15 = arg_432_1.actors_["10092"]
			local var_435_16 = 0

			if var_435_16 < arg_432_1.time_ and arg_432_1.time_ <= var_435_16 + arg_435_0 and not isNil(var_435_15) and arg_432_1.var_.actorSpriteComps10092 == nil then
				arg_432_1.var_.actorSpriteComps10092 = var_435_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_435_17 = 2

			if var_435_16 <= arg_432_1.time_ and arg_432_1.time_ < var_435_16 + var_435_17 and not isNil(var_435_15) then
				local var_435_18 = (arg_432_1.time_ - var_435_16) / var_435_17

				if arg_432_1.var_.actorSpriteComps10092 then
					for iter_435_5, iter_435_6 in pairs(arg_432_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_435_6 then
							if arg_432_1.isInRecall_ then
								local var_435_19 = Mathf.Lerp(iter_435_6.color.r, arg_432_1.hightColor2.r, var_435_18)
								local var_435_20 = Mathf.Lerp(iter_435_6.color.g, arg_432_1.hightColor2.g, var_435_18)
								local var_435_21 = Mathf.Lerp(iter_435_6.color.b, arg_432_1.hightColor2.b, var_435_18)

								iter_435_6.color = Color.New(var_435_19, var_435_20, var_435_21)
							else
								local var_435_22 = Mathf.Lerp(iter_435_6.color.r, 0.5, var_435_18)

								iter_435_6.color = Color.New(var_435_22, var_435_22, var_435_22)
							end
						end
					end
				end
			end

			if arg_432_1.time_ >= var_435_16 + var_435_17 and arg_432_1.time_ < var_435_16 + var_435_17 + arg_435_0 and not isNil(var_435_15) and arg_432_1.var_.actorSpriteComps10092 then
				for iter_435_7, iter_435_8 in pairs(arg_432_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_435_8 then
						if arg_432_1.isInRecall_ then
							iter_435_8.color = arg_432_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_435_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_432_1.var_.actorSpriteComps10092 = nil
			end

			local var_435_23 = 0
			local var_435_24 = 0.1

			if var_435_23 < arg_432_1.time_ and arg_432_1.time_ <= var_435_23 + arg_435_0 then
				arg_432_1.talkMaxDuration = 0
				arg_432_1.dialogCg_.alpha = 1

				arg_432_1.dialog_:SetActive(true)
				SetActive(arg_432_1.leftNameGo_, true)

				local var_435_25 = arg_432_1:FormatText(StoryNameCfg[28].name)

				arg_432_1.leftNameTxt_.text = var_435_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_432_1.leftNameTxt_.transform)

				arg_432_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_432_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_432_1:RecordName(arg_432_1.leftNameTxt_.text)
				SetActive(arg_432_1.iconTrs_.gameObject, false)
				arg_432_1.callingController_:SetSelectedState("normal")

				local var_435_26 = arg_432_1:GetWordFromCfg(413011105)
				local var_435_27 = arg_432_1:FormatText(var_435_26.content)

				arg_432_1.text_.text = var_435_27

				LuaForUtil.ClearLinePrefixSymbol(arg_432_1.text_)

				local var_435_28 = 4
				local var_435_29 = utf8.len(var_435_27)
				local var_435_30 = var_435_28 <= 0 and var_435_24 or var_435_24 * (var_435_29 / var_435_28)

				if var_435_30 > 0 and var_435_24 < var_435_30 then
					arg_432_1.talkMaxDuration = var_435_30

					if var_435_30 + var_435_23 > arg_432_1.duration_ then
						arg_432_1.duration_ = var_435_30 + var_435_23
					end
				end

				arg_432_1.text_.text = var_435_27
				arg_432_1.typewritter.percent = 0

				arg_432_1.typewritter:SetDirty()
				arg_432_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011105", "story_v_out_413011.awb") ~= 0 then
					local var_435_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011105", "story_v_out_413011.awb") / 1000

					if var_435_31 + var_435_23 > arg_432_1.duration_ then
						arg_432_1.duration_ = var_435_31 + var_435_23
					end

					if var_435_26.prefab_name ~= "" and arg_432_1.actors_[var_435_26.prefab_name] ~= nil then
						local var_435_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_432_1.actors_[var_435_26.prefab_name].transform, "story_v_out_413011", "413011105", "story_v_out_413011.awb")

						arg_432_1:RecordAudio("413011105", var_435_32)
						arg_432_1:RecordAudio("413011105", var_435_32)
					else
						arg_432_1:AudioAction("play", "voice", "story_v_out_413011", "413011105", "story_v_out_413011.awb")
					end

					arg_432_1:RecordHistoryTalkVoice("story_v_out_413011", "413011105", "story_v_out_413011.awb")
				end

				arg_432_1:RecordContent(arg_432_1.text_.text)
			end

			local var_435_33 = math.max(var_435_24, arg_432_1.talkMaxDuration)

			if var_435_23 <= arg_432_1.time_ and arg_432_1.time_ < var_435_23 + var_435_33 then
				arg_432_1.typewritter.percent = (arg_432_1.time_ - var_435_23) / var_435_33

				arg_432_1.typewritter:SetDirty()
			end

			if arg_432_1.time_ >= var_435_23 + var_435_33 and arg_432_1.time_ < var_435_23 + var_435_33 + arg_435_0 then
				arg_432_1.typewritter.percent = 1

				arg_432_1.typewritter:SetDirty()
				arg_432_1:ShowNextGo(true)
			end
		end
	end,
	Play413011106 = function(arg_436_0, arg_436_1)
		arg_436_1.time_ = 0
		arg_436_1.frameCnt_ = 0
		arg_436_1.state_ = "playing"
		arg_436_1.curTalkId_ = 413011106
		arg_436_1.duration_ = 13.37

		local var_436_0 = {
			zh = 8.966,
			ja = 13.366
		}
		local var_436_1 = manager.audio:GetLocalizationFlag()

		if var_436_0[var_436_1] ~= nil then
			arg_436_1.duration_ = var_436_0[var_436_1]
		end

		SetActive(arg_436_1.tipsGo_, false)

		function arg_436_1.onSingleLineFinish_()
			arg_436_1.onSingleLineUpdate_ = nil
			arg_436_1.onSingleLineFinish_ = nil
			arg_436_1.state_ = "waiting"
		end

		function arg_436_1.playNext_(arg_438_0)
			if arg_438_0 == 1 then
				arg_436_0:Play413011107(arg_436_1)
			end
		end

		function arg_436_1.onSingleLineUpdate_(arg_439_0)
			local var_439_0 = arg_436_1.actors_["10092"].transform
			local var_439_1 = 0

			if var_439_1 < arg_436_1.time_ and arg_436_1.time_ <= var_439_1 + arg_439_0 then
				arg_436_1.var_.moveOldPos10092 = var_439_0.localPosition
				var_439_0.localScale = Vector3.New(1, 1, 1)

				arg_436_1:CheckSpriteTmpPos("10092", 2)

				local var_439_2 = var_439_0.childCount

				for iter_439_0 = 0, var_439_2 - 1 do
					local var_439_3 = var_439_0:GetChild(iter_439_0)

					if var_439_3.name == "split_1_1" or not string.find(var_439_3.name, "split") then
						var_439_3.gameObject:SetActive(true)
					else
						var_439_3.gameObject:SetActive(false)
					end
				end
			end

			local var_439_4 = 0.001

			if var_439_1 <= arg_436_1.time_ and arg_436_1.time_ < var_439_1 + var_439_4 then
				local var_439_5 = (arg_436_1.time_ - var_439_1) / var_439_4
				local var_439_6 = Vector3.New(-389.49, -300, -295)

				var_439_0.localPosition = Vector3.Lerp(arg_436_1.var_.moveOldPos10092, var_439_6, var_439_5)
			end

			if arg_436_1.time_ >= var_439_1 + var_439_4 and arg_436_1.time_ < var_439_1 + var_439_4 + arg_439_0 then
				var_439_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_439_7 = arg_436_1.actors_["10093"]
			local var_439_8 = 0

			if var_439_8 < arg_436_1.time_ and arg_436_1.time_ <= var_439_8 + arg_439_0 and not isNil(var_439_7) and arg_436_1.var_.actorSpriteComps10093 == nil then
				arg_436_1.var_.actorSpriteComps10093 = var_439_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_439_9 = 2

			if var_439_8 <= arg_436_1.time_ and arg_436_1.time_ < var_439_8 + var_439_9 and not isNil(var_439_7) then
				local var_439_10 = (arg_436_1.time_ - var_439_8) / var_439_9

				if arg_436_1.var_.actorSpriteComps10093 then
					for iter_439_1, iter_439_2 in pairs(arg_436_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_439_2 then
							if arg_436_1.isInRecall_ then
								local var_439_11 = Mathf.Lerp(iter_439_2.color.r, arg_436_1.hightColor2.r, var_439_10)
								local var_439_12 = Mathf.Lerp(iter_439_2.color.g, arg_436_1.hightColor2.g, var_439_10)
								local var_439_13 = Mathf.Lerp(iter_439_2.color.b, arg_436_1.hightColor2.b, var_439_10)

								iter_439_2.color = Color.New(var_439_11, var_439_12, var_439_13)
							else
								local var_439_14 = Mathf.Lerp(iter_439_2.color.r, 0.5, var_439_10)

								iter_439_2.color = Color.New(var_439_14, var_439_14, var_439_14)
							end
						end
					end
				end
			end

			if arg_436_1.time_ >= var_439_8 + var_439_9 and arg_436_1.time_ < var_439_8 + var_439_9 + arg_439_0 and not isNil(var_439_7) and arg_436_1.var_.actorSpriteComps10093 then
				for iter_439_3, iter_439_4 in pairs(arg_436_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_439_4 then
						if arg_436_1.isInRecall_ then
							iter_439_4.color = arg_436_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_439_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_436_1.var_.actorSpriteComps10093 = nil
			end

			local var_439_15 = arg_436_1.actors_["10092"]
			local var_439_16 = 0

			if var_439_16 < arg_436_1.time_ and arg_436_1.time_ <= var_439_16 + arg_439_0 and not isNil(var_439_15) and arg_436_1.var_.actorSpriteComps10092 == nil then
				arg_436_1.var_.actorSpriteComps10092 = var_439_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_439_17 = 2

			if var_439_16 <= arg_436_1.time_ and arg_436_1.time_ < var_439_16 + var_439_17 and not isNil(var_439_15) then
				local var_439_18 = (arg_436_1.time_ - var_439_16) / var_439_17

				if arg_436_1.var_.actorSpriteComps10092 then
					for iter_439_5, iter_439_6 in pairs(arg_436_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_439_6 then
							if arg_436_1.isInRecall_ then
								local var_439_19 = Mathf.Lerp(iter_439_6.color.r, arg_436_1.hightColor1.r, var_439_18)
								local var_439_20 = Mathf.Lerp(iter_439_6.color.g, arg_436_1.hightColor1.g, var_439_18)
								local var_439_21 = Mathf.Lerp(iter_439_6.color.b, arg_436_1.hightColor1.b, var_439_18)

								iter_439_6.color = Color.New(var_439_19, var_439_20, var_439_21)
							else
								local var_439_22 = Mathf.Lerp(iter_439_6.color.r, 1, var_439_18)

								iter_439_6.color = Color.New(var_439_22, var_439_22, var_439_22)
							end
						end
					end
				end
			end

			if arg_436_1.time_ >= var_439_16 + var_439_17 and arg_436_1.time_ < var_439_16 + var_439_17 + arg_439_0 and not isNil(var_439_15) and arg_436_1.var_.actorSpriteComps10092 then
				for iter_439_7, iter_439_8 in pairs(arg_436_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_439_8 then
						if arg_436_1.isInRecall_ then
							iter_439_8.color = arg_436_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_439_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_436_1.var_.actorSpriteComps10092 = nil
			end

			local var_439_23 = 0
			local var_439_24 = 1.05

			if var_439_23 < arg_436_1.time_ and arg_436_1.time_ <= var_439_23 + arg_439_0 then
				arg_436_1.talkMaxDuration = 0
				arg_436_1.dialogCg_.alpha = 1

				arg_436_1.dialog_:SetActive(true)
				SetActive(arg_436_1.leftNameGo_, true)

				local var_439_25 = arg_436_1:FormatText(StoryNameCfg[996].name)

				arg_436_1.leftNameTxt_.text = var_439_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_436_1.leftNameTxt_.transform)

				arg_436_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_436_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_436_1:RecordName(arg_436_1.leftNameTxt_.text)
				SetActive(arg_436_1.iconTrs_.gameObject, false)
				arg_436_1.callingController_:SetSelectedState("normal")

				local var_439_26 = arg_436_1:GetWordFromCfg(413011106)
				local var_439_27 = arg_436_1:FormatText(var_439_26.content)

				arg_436_1.text_.text = var_439_27

				LuaForUtil.ClearLinePrefixSymbol(arg_436_1.text_)

				local var_439_28 = 42
				local var_439_29 = utf8.len(var_439_27)
				local var_439_30 = var_439_28 <= 0 and var_439_24 or var_439_24 * (var_439_29 / var_439_28)

				if var_439_30 > 0 and var_439_24 < var_439_30 then
					arg_436_1.talkMaxDuration = var_439_30

					if var_439_30 + var_439_23 > arg_436_1.duration_ then
						arg_436_1.duration_ = var_439_30 + var_439_23
					end
				end

				arg_436_1.text_.text = var_439_27
				arg_436_1.typewritter.percent = 0

				arg_436_1.typewritter:SetDirty()
				arg_436_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011106", "story_v_out_413011.awb") ~= 0 then
					local var_439_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011106", "story_v_out_413011.awb") / 1000

					if var_439_31 + var_439_23 > arg_436_1.duration_ then
						arg_436_1.duration_ = var_439_31 + var_439_23
					end

					if var_439_26.prefab_name ~= "" and arg_436_1.actors_[var_439_26.prefab_name] ~= nil then
						local var_439_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_436_1.actors_[var_439_26.prefab_name].transform, "story_v_out_413011", "413011106", "story_v_out_413011.awb")

						arg_436_1:RecordAudio("413011106", var_439_32)
						arg_436_1:RecordAudio("413011106", var_439_32)
					else
						arg_436_1:AudioAction("play", "voice", "story_v_out_413011", "413011106", "story_v_out_413011.awb")
					end

					arg_436_1:RecordHistoryTalkVoice("story_v_out_413011", "413011106", "story_v_out_413011.awb")
				end

				arg_436_1:RecordContent(arg_436_1.text_.text)
			end

			local var_439_33 = math.max(var_439_24, arg_436_1.talkMaxDuration)

			if var_439_23 <= arg_436_1.time_ and arg_436_1.time_ < var_439_23 + var_439_33 then
				arg_436_1.typewritter.percent = (arg_436_1.time_ - var_439_23) / var_439_33

				arg_436_1.typewritter:SetDirty()
			end

			if arg_436_1.time_ >= var_439_23 + var_439_33 and arg_436_1.time_ < var_439_23 + var_439_33 + arg_439_0 then
				arg_436_1.typewritter.percent = 1

				arg_436_1.typewritter:SetDirty()
				arg_436_1:ShowNextGo(true)
			end
		end
	end,
	Play413011107 = function(arg_440_0, arg_440_1)
		arg_440_1.time_ = 0
		arg_440_1.frameCnt_ = 0
		arg_440_1.state_ = "playing"
		arg_440_1.curTalkId_ = 413011107
		arg_440_1.duration_ = 10.37

		local var_440_0 = {
			zh = 7.066,
			ja = 10.366
		}
		local var_440_1 = manager.audio:GetLocalizationFlag()

		if var_440_0[var_440_1] ~= nil then
			arg_440_1.duration_ = var_440_0[var_440_1]
		end

		SetActive(arg_440_1.tipsGo_, false)

		function arg_440_1.onSingleLineFinish_()
			arg_440_1.onSingleLineUpdate_ = nil
			arg_440_1.onSingleLineFinish_ = nil
			arg_440_1.state_ = "waiting"
		end

		function arg_440_1.playNext_(arg_442_0)
			if arg_442_0 == 1 then
				arg_440_0:Play413011108(arg_440_1)
			end
		end

		function arg_440_1.onSingleLineUpdate_(arg_443_0)
			local var_443_0 = 0
			local var_443_1 = 0.65

			if var_443_0 < arg_440_1.time_ and arg_440_1.time_ <= var_443_0 + arg_443_0 then
				arg_440_1.talkMaxDuration = 0
				arg_440_1.dialogCg_.alpha = 1

				arg_440_1.dialog_:SetActive(true)
				SetActive(arg_440_1.leftNameGo_, true)

				local var_443_2 = arg_440_1:FormatText(StoryNameCfg[996].name)

				arg_440_1.leftNameTxt_.text = var_443_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_440_1.leftNameTxt_.transform)

				arg_440_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_440_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_440_1:RecordName(arg_440_1.leftNameTxt_.text)
				SetActive(arg_440_1.iconTrs_.gameObject, false)
				arg_440_1.callingController_:SetSelectedState("normal")

				local var_443_3 = arg_440_1:GetWordFromCfg(413011107)
				local var_443_4 = arg_440_1:FormatText(var_443_3.content)

				arg_440_1.text_.text = var_443_4

				LuaForUtil.ClearLinePrefixSymbol(arg_440_1.text_)

				local var_443_5 = 26
				local var_443_6 = utf8.len(var_443_4)
				local var_443_7 = var_443_5 <= 0 and var_443_1 or var_443_1 * (var_443_6 / var_443_5)

				if var_443_7 > 0 and var_443_1 < var_443_7 then
					arg_440_1.talkMaxDuration = var_443_7

					if var_443_7 + var_443_0 > arg_440_1.duration_ then
						arg_440_1.duration_ = var_443_7 + var_443_0
					end
				end

				arg_440_1.text_.text = var_443_4
				arg_440_1.typewritter.percent = 0

				arg_440_1.typewritter:SetDirty()
				arg_440_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011107", "story_v_out_413011.awb") ~= 0 then
					local var_443_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011107", "story_v_out_413011.awb") / 1000

					if var_443_8 + var_443_0 > arg_440_1.duration_ then
						arg_440_1.duration_ = var_443_8 + var_443_0
					end

					if var_443_3.prefab_name ~= "" and arg_440_1.actors_[var_443_3.prefab_name] ~= nil then
						local var_443_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_440_1.actors_[var_443_3.prefab_name].transform, "story_v_out_413011", "413011107", "story_v_out_413011.awb")

						arg_440_1:RecordAudio("413011107", var_443_9)
						arg_440_1:RecordAudio("413011107", var_443_9)
					else
						arg_440_1:AudioAction("play", "voice", "story_v_out_413011", "413011107", "story_v_out_413011.awb")
					end

					arg_440_1:RecordHistoryTalkVoice("story_v_out_413011", "413011107", "story_v_out_413011.awb")
				end

				arg_440_1:RecordContent(arg_440_1.text_.text)
			end

			local var_443_10 = math.max(var_443_1, arg_440_1.talkMaxDuration)

			if var_443_0 <= arg_440_1.time_ and arg_440_1.time_ < var_443_0 + var_443_10 then
				arg_440_1.typewritter.percent = (arg_440_1.time_ - var_443_0) / var_443_10

				arg_440_1.typewritter:SetDirty()
			end

			if arg_440_1.time_ >= var_443_0 + var_443_10 and arg_440_1.time_ < var_443_0 + var_443_10 + arg_443_0 then
				arg_440_1.typewritter.percent = 1

				arg_440_1.typewritter:SetDirty()
				arg_440_1:ShowNextGo(true)
			end
		end
	end,
	Play413011108 = function(arg_444_0, arg_444_1)
		arg_444_1.time_ = 0
		arg_444_1.frameCnt_ = 0
		arg_444_1.state_ = "playing"
		arg_444_1.curTalkId_ = 413011108
		arg_444_1.duration_ = 6.27

		local var_444_0 = {
			zh = 3.2,
			ja = 6.266
		}
		local var_444_1 = manager.audio:GetLocalizationFlag()

		if var_444_0[var_444_1] ~= nil then
			arg_444_1.duration_ = var_444_0[var_444_1]
		end

		SetActive(arg_444_1.tipsGo_, false)

		function arg_444_1.onSingleLineFinish_()
			arg_444_1.onSingleLineUpdate_ = nil
			arg_444_1.onSingleLineFinish_ = nil
			arg_444_1.state_ = "waiting"
		end

		function arg_444_1.playNext_(arg_446_0)
			if arg_446_0 == 1 then
				arg_444_0:Play413011109(arg_444_1)
			end
		end

		function arg_444_1.onSingleLineUpdate_(arg_447_0)
			local var_447_0 = arg_444_1.actors_["10093"].transform
			local var_447_1 = 0

			if var_447_1 < arg_444_1.time_ and arg_444_1.time_ <= var_447_1 + arg_447_0 then
				arg_444_1.var_.moveOldPos10093 = var_447_0.localPosition
				var_447_0.localScale = Vector3.New(1, 1, 1)

				arg_444_1:CheckSpriteTmpPos("10093", 4)

				local var_447_2 = var_447_0.childCount

				for iter_447_0 = 0, var_447_2 - 1 do
					local var_447_3 = var_447_0:GetChild(iter_447_0)

					if var_447_3.name == "split_4" or not string.find(var_447_3.name, "split") then
						var_447_3.gameObject:SetActive(true)
					else
						var_447_3.gameObject:SetActive(false)
					end
				end
			end

			local var_447_4 = 0.001

			if var_447_1 <= arg_444_1.time_ and arg_444_1.time_ < var_447_1 + var_447_4 then
				local var_447_5 = (arg_444_1.time_ - var_447_1) / var_447_4
				local var_447_6 = Vector3.New(390, -345, -245)

				var_447_0.localPosition = Vector3.Lerp(arg_444_1.var_.moveOldPos10093, var_447_6, var_447_5)
			end

			if arg_444_1.time_ >= var_447_1 + var_447_4 and arg_444_1.time_ < var_447_1 + var_447_4 + arg_447_0 then
				var_447_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_447_7 = arg_444_1.actors_["10093"]
			local var_447_8 = 0

			if var_447_8 < arg_444_1.time_ and arg_444_1.time_ <= var_447_8 + arg_447_0 and not isNil(var_447_7) and arg_444_1.var_.actorSpriteComps10093 == nil then
				arg_444_1.var_.actorSpriteComps10093 = var_447_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_447_9 = 2

			if var_447_8 <= arg_444_1.time_ and arg_444_1.time_ < var_447_8 + var_447_9 and not isNil(var_447_7) then
				local var_447_10 = (arg_444_1.time_ - var_447_8) / var_447_9

				if arg_444_1.var_.actorSpriteComps10093 then
					for iter_447_1, iter_447_2 in pairs(arg_444_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_447_2 then
							if arg_444_1.isInRecall_ then
								local var_447_11 = Mathf.Lerp(iter_447_2.color.r, arg_444_1.hightColor1.r, var_447_10)
								local var_447_12 = Mathf.Lerp(iter_447_2.color.g, arg_444_1.hightColor1.g, var_447_10)
								local var_447_13 = Mathf.Lerp(iter_447_2.color.b, arg_444_1.hightColor1.b, var_447_10)

								iter_447_2.color = Color.New(var_447_11, var_447_12, var_447_13)
							else
								local var_447_14 = Mathf.Lerp(iter_447_2.color.r, 1, var_447_10)

								iter_447_2.color = Color.New(var_447_14, var_447_14, var_447_14)
							end
						end
					end
				end
			end

			if arg_444_1.time_ >= var_447_8 + var_447_9 and arg_444_1.time_ < var_447_8 + var_447_9 + arg_447_0 and not isNil(var_447_7) and arg_444_1.var_.actorSpriteComps10093 then
				for iter_447_3, iter_447_4 in pairs(arg_444_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_447_4 then
						if arg_444_1.isInRecall_ then
							iter_447_4.color = arg_444_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_447_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_444_1.var_.actorSpriteComps10093 = nil
			end

			local var_447_15 = arg_444_1.actors_["10092"]
			local var_447_16 = 0

			if var_447_16 < arg_444_1.time_ and arg_444_1.time_ <= var_447_16 + arg_447_0 and not isNil(var_447_15) and arg_444_1.var_.actorSpriteComps10092 == nil then
				arg_444_1.var_.actorSpriteComps10092 = var_447_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_447_17 = 2

			if var_447_16 <= arg_444_1.time_ and arg_444_1.time_ < var_447_16 + var_447_17 and not isNil(var_447_15) then
				local var_447_18 = (arg_444_1.time_ - var_447_16) / var_447_17

				if arg_444_1.var_.actorSpriteComps10092 then
					for iter_447_5, iter_447_6 in pairs(arg_444_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_447_6 then
							if arg_444_1.isInRecall_ then
								local var_447_19 = Mathf.Lerp(iter_447_6.color.r, arg_444_1.hightColor2.r, var_447_18)
								local var_447_20 = Mathf.Lerp(iter_447_6.color.g, arg_444_1.hightColor2.g, var_447_18)
								local var_447_21 = Mathf.Lerp(iter_447_6.color.b, arg_444_1.hightColor2.b, var_447_18)

								iter_447_6.color = Color.New(var_447_19, var_447_20, var_447_21)
							else
								local var_447_22 = Mathf.Lerp(iter_447_6.color.r, 0.5, var_447_18)

								iter_447_6.color = Color.New(var_447_22, var_447_22, var_447_22)
							end
						end
					end
				end
			end

			if arg_444_1.time_ >= var_447_16 + var_447_17 and arg_444_1.time_ < var_447_16 + var_447_17 + arg_447_0 and not isNil(var_447_15) and arg_444_1.var_.actorSpriteComps10092 then
				for iter_447_7, iter_447_8 in pairs(arg_444_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_447_8 then
						if arg_444_1.isInRecall_ then
							iter_447_8.color = arg_444_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_447_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_444_1.var_.actorSpriteComps10092 = nil
			end

			local var_447_23 = 0
			local var_447_24 = 0.375

			if var_447_23 < arg_444_1.time_ and arg_444_1.time_ <= var_447_23 + arg_447_0 then
				arg_444_1.talkMaxDuration = 0
				arg_444_1.dialogCg_.alpha = 1

				arg_444_1.dialog_:SetActive(true)
				SetActive(arg_444_1.leftNameGo_, true)

				local var_447_25 = arg_444_1:FormatText(StoryNameCfg[28].name)

				arg_444_1.leftNameTxt_.text = var_447_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_444_1.leftNameTxt_.transform)

				arg_444_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_444_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_444_1:RecordName(arg_444_1.leftNameTxt_.text)
				SetActive(arg_444_1.iconTrs_.gameObject, false)
				arg_444_1.callingController_:SetSelectedState("normal")

				local var_447_26 = arg_444_1:GetWordFromCfg(413011108)
				local var_447_27 = arg_444_1:FormatText(var_447_26.content)

				arg_444_1.text_.text = var_447_27

				LuaForUtil.ClearLinePrefixSymbol(arg_444_1.text_)

				local var_447_28 = 15
				local var_447_29 = utf8.len(var_447_27)
				local var_447_30 = var_447_28 <= 0 and var_447_24 or var_447_24 * (var_447_29 / var_447_28)

				if var_447_30 > 0 and var_447_24 < var_447_30 then
					arg_444_1.talkMaxDuration = var_447_30

					if var_447_30 + var_447_23 > arg_444_1.duration_ then
						arg_444_1.duration_ = var_447_30 + var_447_23
					end
				end

				arg_444_1.text_.text = var_447_27
				arg_444_1.typewritter.percent = 0

				arg_444_1.typewritter:SetDirty()
				arg_444_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011108", "story_v_out_413011.awb") ~= 0 then
					local var_447_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011108", "story_v_out_413011.awb") / 1000

					if var_447_31 + var_447_23 > arg_444_1.duration_ then
						arg_444_1.duration_ = var_447_31 + var_447_23
					end

					if var_447_26.prefab_name ~= "" and arg_444_1.actors_[var_447_26.prefab_name] ~= nil then
						local var_447_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_444_1.actors_[var_447_26.prefab_name].transform, "story_v_out_413011", "413011108", "story_v_out_413011.awb")

						arg_444_1:RecordAudio("413011108", var_447_32)
						arg_444_1:RecordAudio("413011108", var_447_32)
					else
						arg_444_1:AudioAction("play", "voice", "story_v_out_413011", "413011108", "story_v_out_413011.awb")
					end

					arg_444_1:RecordHistoryTalkVoice("story_v_out_413011", "413011108", "story_v_out_413011.awb")
				end

				arg_444_1:RecordContent(arg_444_1.text_.text)
			end

			local var_447_33 = math.max(var_447_24, arg_444_1.talkMaxDuration)

			if var_447_23 <= arg_444_1.time_ and arg_444_1.time_ < var_447_23 + var_447_33 then
				arg_444_1.typewritter.percent = (arg_444_1.time_ - var_447_23) / var_447_33

				arg_444_1.typewritter:SetDirty()
			end

			if arg_444_1.time_ >= var_447_23 + var_447_33 and arg_444_1.time_ < var_447_23 + var_447_33 + arg_447_0 then
				arg_444_1.typewritter.percent = 1

				arg_444_1.typewritter:SetDirty()
				arg_444_1:ShowNextGo(true)
			end
		end
	end,
	Play413011109 = function(arg_448_0, arg_448_1)
		arg_448_1.time_ = 0
		arg_448_1.frameCnt_ = 0
		arg_448_1.state_ = "playing"
		arg_448_1.curTalkId_ = 413011109
		arg_448_1.duration_ = 12.73

		local var_448_0 = {
			zh = 8.066,
			ja = 12.733
		}
		local var_448_1 = manager.audio:GetLocalizationFlag()

		if var_448_0[var_448_1] ~= nil then
			arg_448_1.duration_ = var_448_0[var_448_1]
		end

		SetActive(arg_448_1.tipsGo_, false)

		function arg_448_1.onSingleLineFinish_()
			arg_448_1.onSingleLineUpdate_ = nil
			arg_448_1.onSingleLineFinish_ = nil
			arg_448_1.state_ = "waiting"
		end

		function arg_448_1.playNext_(arg_450_0)
			if arg_450_0 == 1 then
				arg_448_0:Play413011110(arg_448_1)
			end
		end

		function arg_448_1.onSingleLineUpdate_(arg_451_0)
			local var_451_0 = arg_448_1.actors_["10092"].transform
			local var_451_1 = 0

			if var_451_1 < arg_448_1.time_ and arg_448_1.time_ <= var_451_1 + arg_451_0 then
				arg_448_1.var_.moveOldPos10092 = var_451_0.localPosition
				var_451_0.localScale = Vector3.New(1, 1, 1)

				arg_448_1:CheckSpriteTmpPos("10092", 2)

				local var_451_2 = var_451_0.childCount

				for iter_451_0 = 0, var_451_2 - 1 do
					local var_451_3 = var_451_0:GetChild(iter_451_0)

					if var_451_3.name == "split_2" or not string.find(var_451_3.name, "split") then
						var_451_3.gameObject:SetActive(true)
					else
						var_451_3.gameObject:SetActive(false)
					end
				end
			end

			local var_451_4 = 0.001

			if var_451_1 <= arg_448_1.time_ and arg_448_1.time_ < var_451_1 + var_451_4 then
				local var_451_5 = (arg_448_1.time_ - var_451_1) / var_451_4
				local var_451_6 = Vector3.New(-389.49, -300, -295)

				var_451_0.localPosition = Vector3.Lerp(arg_448_1.var_.moveOldPos10092, var_451_6, var_451_5)
			end

			if arg_448_1.time_ >= var_451_1 + var_451_4 and arg_448_1.time_ < var_451_1 + var_451_4 + arg_451_0 then
				var_451_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_451_7 = arg_448_1.actors_["10093"]
			local var_451_8 = 0

			if var_451_8 < arg_448_1.time_ and arg_448_1.time_ <= var_451_8 + arg_451_0 and not isNil(var_451_7) and arg_448_1.var_.actorSpriteComps10093 == nil then
				arg_448_1.var_.actorSpriteComps10093 = var_451_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_451_9 = 2

			if var_451_8 <= arg_448_1.time_ and arg_448_1.time_ < var_451_8 + var_451_9 and not isNil(var_451_7) then
				local var_451_10 = (arg_448_1.time_ - var_451_8) / var_451_9

				if arg_448_1.var_.actorSpriteComps10093 then
					for iter_451_1, iter_451_2 in pairs(arg_448_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_451_2 then
							if arg_448_1.isInRecall_ then
								local var_451_11 = Mathf.Lerp(iter_451_2.color.r, arg_448_1.hightColor2.r, var_451_10)
								local var_451_12 = Mathf.Lerp(iter_451_2.color.g, arg_448_1.hightColor2.g, var_451_10)
								local var_451_13 = Mathf.Lerp(iter_451_2.color.b, arg_448_1.hightColor2.b, var_451_10)

								iter_451_2.color = Color.New(var_451_11, var_451_12, var_451_13)
							else
								local var_451_14 = Mathf.Lerp(iter_451_2.color.r, 0.5, var_451_10)

								iter_451_2.color = Color.New(var_451_14, var_451_14, var_451_14)
							end
						end
					end
				end
			end

			if arg_448_1.time_ >= var_451_8 + var_451_9 and arg_448_1.time_ < var_451_8 + var_451_9 + arg_451_0 and not isNil(var_451_7) and arg_448_1.var_.actorSpriteComps10093 then
				for iter_451_3, iter_451_4 in pairs(arg_448_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_451_4 then
						if arg_448_1.isInRecall_ then
							iter_451_4.color = arg_448_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_451_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_448_1.var_.actorSpriteComps10093 = nil
			end

			local var_451_15 = arg_448_1.actors_["10092"]
			local var_451_16 = 0

			if var_451_16 < arg_448_1.time_ and arg_448_1.time_ <= var_451_16 + arg_451_0 and not isNil(var_451_15) and arg_448_1.var_.actorSpriteComps10092 == nil then
				arg_448_1.var_.actorSpriteComps10092 = var_451_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_451_17 = 2

			if var_451_16 <= arg_448_1.time_ and arg_448_1.time_ < var_451_16 + var_451_17 and not isNil(var_451_15) then
				local var_451_18 = (arg_448_1.time_ - var_451_16) / var_451_17

				if arg_448_1.var_.actorSpriteComps10092 then
					for iter_451_5, iter_451_6 in pairs(arg_448_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_451_6 then
							if arg_448_1.isInRecall_ then
								local var_451_19 = Mathf.Lerp(iter_451_6.color.r, arg_448_1.hightColor1.r, var_451_18)
								local var_451_20 = Mathf.Lerp(iter_451_6.color.g, arg_448_1.hightColor1.g, var_451_18)
								local var_451_21 = Mathf.Lerp(iter_451_6.color.b, arg_448_1.hightColor1.b, var_451_18)

								iter_451_6.color = Color.New(var_451_19, var_451_20, var_451_21)
							else
								local var_451_22 = Mathf.Lerp(iter_451_6.color.r, 1, var_451_18)

								iter_451_6.color = Color.New(var_451_22, var_451_22, var_451_22)
							end
						end
					end
				end
			end

			if arg_448_1.time_ >= var_451_16 + var_451_17 and arg_448_1.time_ < var_451_16 + var_451_17 + arg_451_0 and not isNil(var_451_15) and arg_448_1.var_.actorSpriteComps10092 then
				for iter_451_7, iter_451_8 in pairs(arg_448_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_451_8 then
						if arg_448_1.isInRecall_ then
							iter_451_8.color = arg_448_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_451_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_448_1.var_.actorSpriteComps10092 = nil
			end

			local var_451_23 = 0
			local var_451_24 = 0.85

			if var_451_23 < arg_448_1.time_ and arg_448_1.time_ <= var_451_23 + arg_451_0 then
				arg_448_1.talkMaxDuration = 0
				arg_448_1.dialogCg_.alpha = 1

				arg_448_1.dialog_:SetActive(true)
				SetActive(arg_448_1.leftNameGo_, true)

				local var_451_25 = arg_448_1:FormatText(StoryNameCfg[996].name)

				arg_448_1.leftNameTxt_.text = var_451_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_448_1.leftNameTxt_.transform)

				arg_448_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_448_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_448_1:RecordName(arg_448_1.leftNameTxt_.text)
				SetActive(arg_448_1.iconTrs_.gameObject, false)
				arg_448_1.callingController_:SetSelectedState("normal")

				local var_451_26 = arg_448_1:GetWordFromCfg(413011109)
				local var_451_27 = arg_448_1:FormatText(var_451_26.content)

				arg_448_1.text_.text = var_451_27

				LuaForUtil.ClearLinePrefixSymbol(arg_448_1.text_)

				local var_451_28 = 34
				local var_451_29 = utf8.len(var_451_27)
				local var_451_30 = var_451_28 <= 0 and var_451_24 or var_451_24 * (var_451_29 / var_451_28)

				if var_451_30 > 0 and var_451_24 < var_451_30 then
					arg_448_1.talkMaxDuration = var_451_30

					if var_451_30 + var_451_23 > arg_448_1.duration_ then
						arg_448_1.duration_ = var_451_30 + var_451_23
					end
				end

				arg_448_1.text_.text = var_451_27
				arg_448_1.typewritter.percent = 0

				arg_448_1.typewritter:SetDirty()
				arg_448_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011109", "story_v_out_413011.awb") ~= 0 then
					local var_451_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011109", "story_v_out_413011.awb") / 1000

					if var_451_31 + var_451_23 > arg_448_1.duration_ then
						arg_448_1.duration_ = var_451_31 + var_451_23
					end

					if var_451_26.prefab_name ~= "" and arg_448_1.actors_[var_451_26.prefab_name] ~= nil then
						local var_451_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_448_1.actors_[var_451_26.prefab_name].transform, "story_v_out_413011", "413011109", "story_v_out_413011.awb")

						arg_448_1:RecordAudio("413011109", var_451_32)
						arg_448_1:RecordAudio("413011109", var_451_32)
					else
						arg_448_1:AudioAction("play", "voice", "story_v_out_413011", "413011109", "story_v_out_413011.awb")
					end

					arg_448_1:RecordHistoryTalkVoice("story_v_out_413011", "413011109", "story_v_out_413011.awb")
				end

				arg_448_1:RecordContent(arg_448_1.text_.text)
			end

			local var_451_33 = math.max(var_451_24, arg_448_1.talkMaxDuration)

			if var_451_23 <= arg_448_1.time_ and arg_448_1.time_ < var_451_23 + var_451_33 then
				arg_448_1.typewritter.percent = (arg_448_1.time_ - var_451_23) / var_451_33

				arg_448_1.typewritter:SetDirty()
			end

			if arg_448_1.time_ >= var_451_23 + var_451_33 and arg_448_1.time_ < var_451_23 + var_451_33 + arg_451_0 then
				arg_448_1.typewritter.percent = 1

				arg_448_1.typewritter:SetDirty()
				arg_448_1:ShowNextGo(true)
			end
		end
	end,
	Play413011110 = function(arg_452_0, arg_452_1)
		arg_452_1.time_ = 0
		arg_452_1.frameCnt_ = 0
		arg_452_1.state_ = "playing"
		arg_452_1.curTalkId_ = 413011110
		arg_452_1.duration_ = 5

		SetActive(arg_452_1.tipsGo_, false)

		function arg_452_1.onSingleLineFinish_()
			arg_452_1.onSingleLineUpdate_ = nil
			arg_452_1.onSingleLineFinish_ = nil
			arg_452_1.state_ = "waiting"
		end

		function arg_452_1.playNext_(arg_454_0)
			if arg_454_0 == 1 then
				arg_452_0:Play413011111(arg_452_1)
			end
		end

		function arg_452_1.onSingleLineUpdate_(arg_455_0)
			local var_455_0 = arg_452_1.actors_["10092"]
			local var_455_1 = 0

			if var_455_1 < arg_452_1.time_ and arg_452_1.time_ <= var_455_1 + arg_455_0 and not isNil(var_455_0) and arg_452_1.var_.actorSpriteComps10092 == nil then
				arg_452_1.var_.actorSpriteComps10092 = var_455_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_455_2 = 2

			if var_455_1 <= arg_452_1.time_ and arg_452_1.time_ < var_455_1 + var_455_2 and not isNil(var_455_0) then
				local var_455_3 = (arg_452_1.time_ - var_455_1) / var_455_2

				if arg_452_1.var_.actorSpriteComps10092 then
					for iter_455_0, iter_455_1 in pairs(arg_452_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_455_1 then
							if arg_452_1.isInRecall_ then
								local var_455_4 = Mathf.Lerp(iter_455_1.color.r, arg_452_1.hightColor2.r, var_455_3)
								local var_455_5 = Mathf.Lerp(iter_455_1.color.g, arg_452_1.hightColor2.g, var_455_3)
								local var_455_6 = Mathf.Lerp(iter_455_1.color.b, arg_452_1.hightColor2.b, var_455_3)

								iter_455_1.color = Color.New(var_455_4, var_455_5, var_455_6)
							else
								local var_455_7 = Mathf.Lerp(iter_455_1.color.r, 0.5, var_455_3)

								iter_455_1.color = Color.New(var_455_7, var_455_7, var_455_7)
							end
						end
					end
				end
			end

			if arg_452_1.time_ >= var_455_1 + var_455_2 and arg_452_1.time_ < var_455_1 + var_455_2 + arg_455_0 and not isNil(var_455_0) and arg_452_1.var_.actorSpriteComps10092 then
				for iter_455_2, iter_455_3 in pairs(arg_452_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_455_3 then
						if arg_452_1.isInRecall_ then
							iter_455_3.color = arg_452_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_455_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_452_1.var_.actorSpriteComps10092 = nil
			end

			local var_455_8 = 0
			local var_455_9 = 0.725

			if var_455_8 < arg_452_1.time_ and arg_452_1.time_ <= var_455_8 + arg_455_0 then
				arg_452_1.talkMaxDuration = 0
				arg_452_1.dialogCg_.alpha = 1

				arg_452_1.dialog_:SetActive(true)
				SetActive(arg_452_1.leftNameGo_, false)

				arg_452_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_452_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_452_1:RecordName(arg_452_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_452_1.iconTrs_.gameObject, false)
				arg_452_1.callingController_:SetSelectedState("normal")

				local var_455_10 = arg_452_1:GetWordFromCfg(413011110)
				local var_455_11 = arg_452_1:FormatText(var_455_10.content)

				arg_452_1.text_.text = var_455_11

				LuaForUtil.ClearLinePrefixSymbol(arg_452_1.text_)

				local var_455_12 = 29
				local var_455_13 = utf8.len(var_455_11)
				local var_455_14 = var_455_12 <= 0 and var_455_9 or var_455_9 * (var_455_13 / var_455_12)

				if var_455_14 > 0 and var_455_9 < var_455_14 then
					arg_452_1.talkMaxDuration = var_455_14

					if var_455_14 + var_455_8 > arg_452_1.duration_ then
						arg_452_1.duration_ = var_455_14 + var_455_8
					end
				end

				arg_452_1.text_.text = var_455_11
				arg_452_1.typewritter.percent = 0

				arg_452_1.typewritter:SetDirty()
				arg_452_1:ShowNextGo(false)
				arg_452_1:RecordContent(arg_452_1.text_.text)
			end

			local var_455_15 = math.max(var_455_9, arg_452_1.talkMaxDuration)

			if var_455_8 <= arg_452_1.time_ and arg_452_1.time_ < var_455_8 + var_455_15 then
				arg_452_1.typewritter.percent = (arg_452_1.time_ - var_455_8) / var_455_15

				arg_452_1.typewritter:SetDirty()
			end

			if arg_452_1.time_ >= var_455_8 + var_455_15 and arg_452_1.time_ < var_455_8 + var_455_15 + arg_455_0 then
				arg_452_1.typewritter.percent = 1

				arg_452_1.typewritter:SetDirty()
				arg_452_1:ShowNextGo(true)
			end
		end
	end,
	Play413011111 = function(arg_456_0, arg_456_1)
		arg_456_1.time_ = 0
		arg_456_1.frameCnt_ = 0
		arg_456_1.state_ = "playing"
		arg_456_1.curTalkId_ = 413011111
		arg_456_1.duration_ = 7.73

		local var_456_0 = {
			zh = 7.2,
			ja = 7.733
		}
		local var_456_1 = manager.audio:GetLocalizationFlag()

		if var_456_0[var_456_1] ~= nil then
			arg_456_1.duration_ = var_456_0[var_456_1]
		end

		SetActive(arg_456_1.tipsGo_, false)

		function arg_456_1.onSingleLineFinish_()
			arg_456_1.onSingleLineUpdate_ = nil
			arg_456_1.onSingleLineFinish_ = nil
			arg_456_1.state_ = "waiting"
		end

		function arg_456_1.playNext_(arg_458_0)
			if arg_458_0 == 1 then
				arg_456_0:Play413011112(arg_456_1)
			end
		end

		function arg_456_1.onSingleLineUpdate_(arg_459_0)
			local var_459_0 = arg_456_1.actors_["10092"]
			local var_459_1 = 0

			if var_459_1 < arg_456_1.time_ and arg_456_1.time_ <= var_459_1 + arg_459_0 and not isNil(var_459_0) and arg_456_1.var_.actorSpriteComps10092 == nil then
				arg_456_1.var_.actorSpriteComps10092 = var_459_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_459_2 = 2

			if var_459_1 <= arg_456_1.time_ and arg_456_1.time_ < var_459_1 + var_459_2 and not isNil(var_459_0) then
				local var_459_3 = (arg_456_1.time_ - var_459_1) / var_459_2

				if arg_456_1.var_.actorSpriteComps10092 then
					for iter_459_0, iter_459_1 in pairs(arg_456_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_459_1 then
							if arg_456_1.isInRecall_ then
								local var_459_4 = Mathf.Lerp(iter_459_1.color.r, arg_456_1.hightColor1.r, var_459_3)
								local var_459_5 = Mathf.Lerp(iter_459_1.color.g, arg_456_1.hightColor1.g, var_459_3)
								local var_459_6 = Mathf.Lerp(iter_459_1.color.b, arg_456_1.hightColor1.b, var_459_3)

								iter_459_1.color = Color.New(var_459_4, var_459_5, var_459_6)
							else
								local var_459_7 = Mathf.Lerp(iter_459_1.color.r, 1, var_459_3)

								iter_459_1.color = Color.New(var_459_7, var_459_7, var_459_7)
							end
						end
					end
				end
			end

			if arg_456_1.time_ >= var_459_1 + var_459_2 and arg_456_1.time_ < var_459_1 + var_459_2 + arg_459_0 and not isNil(var_459_0) and arg_456_1.var_.actorSpriteComps10092 then
				for iter_459_2, iter_459_3 in pairs(arg_456_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_459_3 then
						if arg_456_1.isInRecall_ then
							iter_459_3.color = arg_456_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_459_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_456_1.var_.actorSpriteComps10092 = nil
			end

			local var_459_8 = arg_456_1.actors_["10092"].transform
			local var_459_9 = 0

			if var_459_9 < arg_456_1.time_ and arg_456_1.time_ <= var_459_9 + arg_459_0 then
				arg_456_1.var_.moveOldPos10092 = var_459_8.localPosition
				var_459_8.localScale = Vector3.New(1, 1, 1)

				arg_456_1:CheckSpriteTmpPos("10092", 2)

				local var_459_10 = var_459_8.childCount

				for iter_459_4 = 0, var_459_10 - 1 do
					local var_459_11 = var_459_8:GetChild(iter_459_4)

					if var_459_11.name == "split_1_1" or not string.find(var_459_11.name, "split") then
						var_459_11.gameObject:SetActive(true)
					else
						var_459_11.gameObject:SetActive(false)
					end
				end
			end

			local var_459_12 = 0.001

			if var_459_9 <= arg_456_1.time_ and arg_456_1.time_ < var_459_9 + var_459_12 then
				local var_459_13 = (arg_456_1.time_ - var_459_9) / var_459_12
				local var_459_14 = Vector3.New(-389.49, -300, -295)

				var_459_8.localPosition = Vector3.Lerp(arg_456_1.var_.moveOldPos10092, var_459_14, var_459_13)
			end

			if arg_456_1.time_ >= var_459_9 + var_459_12 and arg_456_1.time_ < var_459_9 + var_459_12 + arg_459_0 then
				var_459_8.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_459_15 = 0
			local var_459_16 = 0.7

			if var_459_15 < arg_456_1.time_ and arg_456_1.time_ <= var_459_15 + arg_459_0 then
				arg_456_1.talkMaxDuration = 0
				arg_456_1.dialogCg_.alpha = 1

				arg_456_1.dialog_:SetActive(true)
				SetActive(arg_456_1.leftNameGo_, true)

				local var_459_17 = arg_456_1:FormatText(StoryNameCfg[996].name)

				arg_456_1.leftNameTxt_.text = var_459_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_456_1.leftNameTxt_.transform)

				arg_456_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_456_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_456_1:RecordName(arg_456_1.leftNameTxt_.text)
				SetActive(arg_456_1.iconTrs_.gameObject, false)
				arg_456_1.callingController_:SetSelectedState("normal")

				local var_459_18 = arg_456_1:GetWordFromCfg(413011111)
				local var_459_19 = arg_456_1:FormatText(var_459_18.content)

				arg_456_1.text_.text = var_459_19

				LuaForUtil.ClearLinePrefixSymbol(arg_456_1.text_)

				local var_459_20 = 28
				local var_459_21 = utf8.len(var_459_19)
				local var_459_22 = var_459_20 <= 0 and var_459_16 or var_459_16 * (var_459_21 / var_459_20)

				if var_459_22 > 0 and var_459_16 < var_459_22 then
					arg_456_1.talkMaxDuration = var_459_22

					if var_459_22 + var_459_15 > arg_456_1.duration_ then
						arg_456_1.duration_ = var_459_22 + var_459_15
					end
				end

				arg_456_1.text_.text = var_459_19
				arg_456_1.typewritter.percent = 0

				arg_456_1.typewritter:SetDirty()
				arg_456_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011111", "story_v_out_413011.awb") ~= 0 then
					local var_459_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011111", "story_v_out_413011.awb") / 1000

					if var_459_23 + var_459_15 > arg_456_1.duration_ then
						arg_456_1.duration_ = var_459_23 + var_459_15
					end

					if var_459_18.prefab_name ~= "" and arg_456_1.actors_[var_459_18.prefab_name] ~= nil then
						local var_459_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_456_1.actors_[var_459_18.prefab_name].transform, "story_v_out_413011", "413011111", "story_v_out_413011.awb")

						arg_456_1:RecordAudio("413011111", var_459_24)
						arg_456_1:RecordAudio("413011111", var_459_24)
					else
						arg_456_1:AudioAction("play", "voice", "story_v_out_413011", "413011111", "story_v_out_413011.awb")
					end

					arg_456_1:RecordHistoryTalkVoice("story_v_out_413011", "413011111", "story_v_out_413011.awb")
				end

				arg_456_1:RecordContent(arg_456_1.text_.text)
			end

			local var_459_25 = math.max(var_459_16, arg_456_1.talkMaxDuration)

			if var_459_15 <= arg_456_1.time_ and arg_456_1.time_ < var_459_15 + var_459_25 then
				arg_456_1.typewritter.percent = (arg_456_1.time_ - var_459_15) / var_459_25

				arg_456_1.typewritter:SetDirty()
			end

			if arg_456_1.time_ >= var_459_15 + var_459_25 and arg_456_1.time_ < var_459_15 + var_459_25 + arg_459_0 then
				arg_456_1.typewritter.percent = 1

				arg_456_1.typewritter:SetDirty()
				arg_456_1:ShowNextGo(true)
			end
		end
	end,
	Play413011112 = function(arg_460_0, arg_460_1)
		arg_460_1.time_ = 0
		arg_460_1.frameCnt_ = 0
		arg_460_1.state_ = "playing"
		arg_460_1.curTalkId_ = 413011112
		arg_460_1.duration_ = 2.33

		local var_460_0 = {
			zh = 1.999999999999,
			ja = 2.333
		}
		local var_460_1 = manager.audio:GetLocalizationFlag()

		if var_460_0[var_460_1] ~= nil then
			arg_460_1.duration_ = var_460_0[var_460_1]
		end

		SetActive(arg_460_1.tipsGo_, false)

		function arg_460_1.onSingleLineFinish_()
			arg_460_1.onSingleLineUpdate_ = nil
			arg_460_1.onSingleLineFinish_ = nil
			arg_460_1.state_ = "waiting"
		end

		function arg_460_1.playNext_(arg_462_0)
			if arg_462_0 == 1 then
				arg_460_0:Play413011113(arg_460_1)
			end
		end

		function arg_460_1.onSingleLineUpdate_(arg_463_0)
			local var_463_0 = arg_460_1.actors_["10093"].transform
			local var_463_1 = 0

			if var_463_1 < arg_460_1.time_ and arg_460_1.time_ <= var_463_1 + arg_463_0 then
				arg_460_1.var_.moveOldPos10093 = var_463_0.localPosition
				var_463_0.localScale = Vector3.New(1, 1, 1)

				arg_460_1:CheckSpriteTmpPos("10093", 4)

				local var_463_2 = var_463_0.childCount

				for iter_463_0 = 0, var_463_2 - 1 do
					local var_463_3 = var_463_0:GetChild(iter_463_0)

					if var_463_3.name == "" or not string.find(var_463_3.name, "split") then
						var_463_3.gameObject:SetActive(true)
					else
						var_463_3.gameObject:SetActive(false)
					end
				end
			end

			local var_463_4 = 0.001

			if var_463_1 <= arg_460_1.time_ and arg_460_1.time_ < var_463_1 + var_463_4 then
				local var_463_5 = (arg_460_1.time_ - var_463_1) / var_463_4
				local var_463_6 = Vector3.New(390, -345, -245)

				var_463_0.localPosition = Vector3.Lerp(arg_460_1.var_.moveOldPos10093, var_463_6, var_463_5)
			end

			if arg_460_1.time_ >= var_463_1 + var_463_4 and arg_460_1.time_ < var_463_1 + var_463_4 + arg_463_0 then
				var_463_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_463_7 = arg_460_1.actors_["10093"]
			local var_463_8 = 0

			if var_463_8 < arg_460_1.time_ and arg_460_1.time_ <= var_463_8 + arg_463_0 and not isNil(var_463_7) and arg_460_1.var_.actorSpriteComps10093 == nil then
				arg_460_1.var_.actorSpriteComps10093 = var_463_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_463_9 = 2

			if var_463_8 <= arg_460_1.time_ and arg_460_1.time_ < var_463_8 + var_463_9 and not isNil(var_463_7) then
				local var_463_10 = (arg_460_1.time_ - var_463_8) / var_463_9

				if arg_460_1.var_.actorSpriteComps10093 then
					for iter_463_1, iter_463_2 in pairs(arg_460_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_463_2 then
							if arg_460_1.isInRecall_ then
								local var_463_11 = Mathf.Lerp(iter_463_2.color.r, arg_460_1.hightColor1.r, var_463_10)
								local var_463_12 = Mathf.Lerp(iter_463_2.color.g, arg_460_1.hightColor1.g, var_463_10)
								local var_463_13 = Mathf.Lerp(iter_463_2.color.b, arg_460_1.hightColor1.b, var_463_10)

								iter_463_2.color = Color.New(var_463_11, var_463_12, var_463_13)
							else
								local var_463_14 = Mathf.Lerp(iter_463_2.color.r, 1, var_463_10)

								iter_463_2.color = Color.New(var_463_14, var_463_14, var_463_14)
							end
						end
					end
				end
			end

			if arg_460_1.time_ >= var_463_8 + var_463_9 and arg_460_1.time_ < var_463_8 + var_463_9 + arg_463_0 and not isNil(var_463_7) and arg_460_1.var_.actorSpriteComps10093 then
				for iter_463_3, iter_463_4 in pairs(arg_460_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_463_4 then
						if arg_460_1.isInRecall_ then
							iter_463_4.color = arg_460_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_463_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_460_1.var_.actorSpriteComps10093 = nil
			end

			local var_463_15 = arg_460_1.actors_["10092"]
			local var_463_16 = 0

			if var_463_16 < arg_460_1.time_ and arg_460_1.time_ <= var_463_16 + arg_463_0 and not isNil(var_463_15) and arg_460_1.var_.actorSpriteComps10092 == nil then
				arg_460_1.var_.actorSpriteComps10092 = var_463_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_463_17 = 2

			if var_463_16 <= arg_460_1.time_ and arg_460_1.time_ < var_463_16 + var_463_17 and not isNil(var_463_15) then
				local var_463_18 = (arg_460_1.time_ - var_463_16) / var_463_17

				if arg_460_1.var_.actorSpriteComps10092 then
					for iter_463_5, iter_463_6 in pairs(arg_460_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_463_6 then
							if arg_460_1.isInRecall_ then
								local var_463_19 = Mathf.Lerp(iter_463_6.color.r, arg_460_1.hightColor2.r, var_463_18)
								local var_463_20 = Mathf.Lerp(iter_463_6.color.g, arg_460_1.hightColor2.g, var_463_18)
								local var_463_21 = Mathf.Lerp(iter_463_6.color.b, arg_460_1.hightColor2.b, var_463_18)

								iter_463_6.color = Color.New(var_463_19, var_463_20, var_463_21)
							else
								local var_463_22 = Mathf.Lerp(iter_463_6.color.r, 0.5, var_463_18)

								iter_463_6.color = Color.New(var_463_22, var_463_22, var_463_22)
							end
						end
					end
				end
			end

			if arg_460_1.time_ >= var_463_16 + var_463_17 and arg_460_1.time_ < var_463_16 + var_463_17 + arg_463_0 and not isNil(var_463_15) and arg_460_1.var_.actorSpriteComps10092 then
				for iter_463_7, iter_463_8 in pairs(arg_460_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_463_8 then
						if arg_460_1.isInRecall_ then
							iter_463_8.color = arg_460_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_463_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_460_1.var_.actorSpriteComps10092 = nil
			end

			local var_463_23 = 0
			local var_463_24 = 0.1

			if var_463_23 < arg_460_1.time_ and arg_460_1.time_ <= var_463_23 + arg_463_0 then
				arg_460_1.talkMaxDuration = 0
				arg_460_1.dialogCg_.alpha = 1

				arg_460_1.dialog_:SetActive(true)
				SetActive(arg_460_1.leftNameGo_, true)

				local var_463_25 = arg_460_1:FormatText(StoryNameCfg[28].name)

				arg_460_1.leftNameTxt_.text = var_463_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_460_1.leftNameTxt_.transform)

				arg_460_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_460_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_460_1:RecordName(arg_460_1.leftNameTxt_.text)
				SetActive(arg_460_1.iconTrs_.gameObject, false)
				arg_460_1.callingController_:SetSelectedState("normal")

				local var_463_26 = arg_460_1:GetWordFromCfg(413011112)
				local var_463_27 = arg_460_1:FormatText(var_463_26.content)

				arg_460_1.text_.text = var_463_27

				LuaForUtil.ClearLinePrefixSymbol(arg_460_1.text_)

				local var_463_28 = 4
				local var_463_29 = utf8.len(var_463_27)
				local var_463_30 = var_463_28 <= 0 and var_463_24 or var_463_24 * (var_463_29 / var_463_28)

				if var_463_30 > 0 and var_463_24 < var_463_30 then
					arg_460_1.talkMaxDuration = var_463_30

					if var_463_30 + var_463_23 > arg_460_1.duration_ then
						arg_460_1.duration_ = var_463_30 + var_463_23
					end
				end

				arg_460_1.text_.text = var_463_27
				arg_460_1.typewritter.percent = 0

				arg_460_1.typewritter:SetDirty()
				arg_460_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011112", "story_v_out_413011.awb") ~= 0 then
					local var_463_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011112", "story_v_out_413011.awb") / 1000

					if var_463_31 + var_463_23 > arg_460_1.duration_ then
						arg_460_1.duration_ = var_463_31 + var_463_23
					end

					if var_463_26.prefab_name ~= "" and arg_460_1.actors_[var_463_26.prefab_name] ~= nil then
						local var_463_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_460_1.actors_[var_463_26.prefab_name].transform, "story_v_out_413011", "413011112", "story_v_out_413011.awb")

						arg_460_1:RecordAudio("413011112", var_463_32)
						arg_460_1:RecordAudio("413011112", var_463_32)
					else
						arg_460_1:AudioAction("play", "voice", "story_v_out_413011", "413011112", "story_v_out_413011.awb")
					end

					arg_460_1:RecordHistoryTalkVoice("story_v_out_413011", "413011112", "story_v_out_413011.awb")
				end

				arg_460_1:RecordContent(arg_460_1.text_.text)
			end

			local var_463_33 = math.max(var_463_24, arg_460_1.talkMaxDuration)

			if var_463_23 <= arg_460_1.time_ and arg_460_1.time_ < var_463_23 + var_463_33 then
				arg_460_1.typewritter.percent = (arg_460_1.time_ - var_463_23) / var_463_33

				arg_460_1.typewritter:SetDirty()
			end

			if arg_460_1.time_ >= var_463_23 + var_463_33 and arg_460_1.time_ < var_463_23 + var_463_33 + arg_463_0 then
				arg_460_1.typewritter.percent = 1

				arg_460_1.typewritter:SetDirty()
				arg_460_1:ShowNextGo(true)
			end
		end
	end,
	Play413011113 = function(arg_464_0, arg_464_1)
		arg_464_1.time_ = 0
		arg_464_1.frameCnt_ = 0
		arg_464_1.state_ = "playing"
		arg_464_1.curTalkId_ = 413011113
		arg_464_1.duration_ = 12.77

		local var_464_0 = {
			zh = 7,
			ja = 12.766
		}
		local var_464_1 = manager.audio:GetLocalizationFlag()

		if var_464_0[var_464_1] ~= nil then
			arg_464_1.duration_ = var_464_0[var_464_1]
		end

		SetActive(arg_464_1.tipsGo_, false)

		function arg_464_1.onSingleLineFinish_()
			arg_464_1.onSingleLineUpdate_ = nil
			arg_464_1.onSingleLineFinish_ = nil
			arg_464_1.state_ = "waiting"
		end

		function arg_464_1.playNext_(arg_466_0)
			if arg_466_0 == 1 then
				arg_464_0:Play413011114(arg_464_1)
			end
		end

		function arg_464_1.onSingleLineUpdate_(arg_467_0)
			local var_467_0 = arg_464_1.actors_["10093"]
			local var_467_1 = 0

			if var_467_1 < arg_464_1.time_ and arg_464_1.time_ <= var_467_1 + arg_467_0 and not isNil(var_467_0) and arg_464_1.var_.actorSpriteComps10093 == nil then
				arg_464_1.var_.actorSpriteComps10093 = var_467_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_467_2 = 2

			if var_467_1 <= arg_464_1.time_ and arg_464_1.time_ < var_467_1 + var_467_2 and not isNil(var_467_0) then
				local var_467_3 = (arg_464_1.time_ - var_467_1) / var_467_2

				if arg_464_1.var_.actorSpriteComps10093 then
					for iter_467_0, iter_467_1 in pairs(arg_464_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_467_1 then
							if arg_464_1.isInRecall_ then
								local var_467_4 = Mathf.Lerp(iter_467_1.color.r, arg_464_1.hightColor2.r, var_467_3)
								local var_467_5 = Mathf.Lerp(iter_467_1.color.g, arg_464_1.hightColor2.g, var_467_3)
								local var_467_6 = Mathf.Lerp(iter_467_1.color.b, arg_464_1.hightColor2.b, var_467_3)

								iter_467_1.color = Color.New(var_467_4, var_467_5, var_467_6)
							else
								local var_467_7 = Mathf.Lerp(iter_467_1.color.r, 0.5, var_467_3)

								iter_467_1.color = Color.New(var_467_7, var_467_7, var_467_7)
							end
						end
					end
				end
			end

			if arg_464_1.time_ >= var_467_1 + var_467_2 and arg_464_1.time_ < var_467_1 + var_467_2 + arg_467_0 and not isNil(var_467_0) and arg_464_1.var_.actorSpriteComps10093 then
				for iter_467_2, iter_467_3 in pairs(arg_464_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_467_3 then
						if arg_464_1.isInRecall_ then
							iter_467_3.color = arg_464_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_467_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_464_1.var_.actorSpriteComps10093 = nil
			end

			local var_467_8 = arg_464_1.actors_["10092"]
			local var_467_9 = 0

			if var_467_9 < arg_464_1.time_ and arg_464_1.time_ <= var_467_9 + arg_467_0 and not isNil(var_467_8) and arg_464_1.var_.actorSpriteComps10092 == nil then
				arg_464_1.var_.actorSpriteComps10092 = var_467_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_467_10 = 2

			if var_467_9 <= arg_464_1.time_ and arg_464_1.time_ < var_467_9 + var_467_10 and not isNil(var_467_8) then
				local var_467_11 = (arg_464_1.time_ - var_467_9) / var_467_10

				if arg_464_1.var_.actorSpriteComps10092 then
					for iter_467_4, iter_467_5 in pairs(arg_464_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_467_5 then
							if arg_464_1.isInRecall_ then
								local var_467_12 = Mathf.Lerp(iter_467_5.color.r, arg_464_1.hightColor1.r, var_467_11)
								local var_467_13 = Mathf.Lerp(iter_467_5.color.g, arg_464_1.hightColor1.g, var_467_11)
								local var_467_14 = Mathf.Lerp(iter_467_5.color.b, arg_464_1.hightColor1.b, var_467_11)

								iter_467_5.color = Color.New(var_467_12, var_467_13, var_467_14)
							else
								local var_467_15 = Mathf.Lerp(iter_467_5.color.r, 1, var_467_11)

								iter_467_5.color = Color.New(var_467_15, var_467_15, var_467_15)
							end
						end
					end
				end
			end

			if arg_464_1.time_ >= var_467_9 + var_467_10 and arg_464_1.time_ < var_467_9 + var_467_10 + arg_467_0 and not isNil(var_467_8) and arg_464_1.var_.actorSpriteComps10092 then
				for iter_467_6, iter_467_7 in pairs(arg_464_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_467_7 then
						if arg_464_1.isInRecall_ then
							iter_467_7.color = arg_464_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_467_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_464_1.var_.actorSpriteComps10092 = nil
			end

			local var_467_16 = 0
			local var_467_17 = 0.9

			if var_467_16 < arg_464_1.time_ and arg_464_1.time_ <= var_467_16 + arg_467_0 then
				arg_464_1.talkMaxDuration = 0
				arg_464_1.dialogCg_.alpha = 1

				arg_464_1.dialog_:SetActive(true)
				SetActive(arg_464_1.leftNameGo_, true)

				local var_467_18 = arg_464_1:FormatText(StoryNameCfg[996].name)

				arg_464_1.leftNameTxt_.text = var_467_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_464_1.leftNameTxt_.transform)

				arg_464_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_464_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_464_1:RecordName(arg_464_1.leftNameTxt_.text)
				SetActive(arg_464_1.iconTrs_.gameObject, false)
				arg_464_1.callingController_:SetSelectedState("normal")

				local var_467_19 = arg_464_1:GetWordFromCfg(413011113)
				local var_467_20 = arg_464_1:FormatText(var_467_19.content)

				arg_464_1.text_.text = var_467_20

				LuaForUtil.ClearLinePrefixSymbol(arg_464_1.text_)

				local var_467_21 = 36
				local var_467_22 = utf8.len(var_467_20)
				local var_467_23 = var_467_21 <= 0 and var_467_17 or var_467_17 * (var_467_22 / var_467_21)

				if var_467_23 > 0 and var_467_17 < var_467_23 then
					arg_464_1.talkMaxDuration = var_467_23

					if var_467_23 + var_467_16 > arg_464_1.duration_ then
						arg_464_1.duration_ = var_467_23 + var_467_16
					end
				end

				arg_464_1.text_.text = var_467_20
				arg_464_1.typewritter.percent = 0

				arg_464_1.typewritter:SetDirty()
				arg_464_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011113", "story_v_out_413011.awb") ~= 0 then
					local var_467_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011113", "story_v_out_413011.awb") / 1000

					if var_467_24 + var_467_16 > arg_464_1.duration_ then
						arg_464_1.duration_ = var_467_24 + var_467_16
					end

					if var_467_19.prefab_name ~= "" and arg_464_1.actors_[var_467_19.prefab_name] ~= nil then
						local var_467_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_464_1.actors_[var_467_19.prefab_name].transform, "story_v_out_413011", "413011113", "story_v_out_413011.awb")

						arg_464_1:RecordAudio("413011113", var_467_25)
						arg_464_1:RecordAudio("413011113", var_467_25)
					else
						arg_464_1:AudioAction("play", "voice", "story_v_out_413011", "413011113", "story_v_out_413011.awb")
					end

					arg_464_1:RecordHistoryTalkVoice("story_v_out_413011", "413011113", "story_v_out_413011.awb")
				end

				arg_464_1:RecordContent(arg_464_1.text_.text)
			end

			local var_467_26 = math.max(var_467_17, arg_464_1.talkMaxDuration)

			if var_467_16 <= arg_464_1.time_ and arg_464_1.time_ < var_467_16 + var_467_26 then
				arg_464_1.typewritter.percent = (arg_464_1.time_ - var_467_16) / var_467_26

				arg_464_1.typewritter:SetDirty()
			end

			if arg_464_1.time_ >= var_467_16 + var_467_26 and arg_464_1.time_ < var_467_16 + var_467_26 + arg_467_0 then
				arg_464_1.typewritter.percent = 1

				arg_464_1.typewritter:SetDirty()
				arg_464_1:ShowNextGo(true)
			end
		end
	end,
	Play413011114 = function(arg_468_0, arg_468_1)
		arg_468_1.time_ = 0
		arg_468_1.frameCnt_ = 0
		arg_468_1.state_ = "playing"
		arg_468_1.curTalkId_ = 413011114
		arg_468_1.duration_ = 4.43

		local var_468_0 = {
			zh = 4.433,
			ja = 2.133
		}
		local var_468_1 = manager.audio:GetLocalizationFlag()

		if var_468_0[var_468_1] ~= nil then
			arg_468_1.duration_ = var_468_0[var_468_1]
		end

		SetActive(arg_468_1.tipsGo_, false)

		function arg_468_1.onSingleLineFinish_()
			arg_468_1.onSingleLineUpdate_ = nil
			arg_468_1.onSingleLineFinish_ = nil
			arg_468_1.state_ = "waiting"
		end

		function arg_468_1.playNext_(arg_470_0)
			if arg_470_0 == 1 then
				arg_468_0:Play413011115(arg_468_1)
			end
		end

		function arg_468_1.onSingleLineUpdate_(arg_471_0)
			local var_471_0 = arg_468_1.actors_["10093"]
			local var_471_1 = 0

			if var_471_1 < arg_468_1.time_ and arg_468_1.time_ <= var_471_1 + arg_471_0 and not isNil(var_471_0) and arg_468_1.var_.actorSpriteComps10093 == nil then
				arg_468_1.var_.actorSpriteComps10093 = var_471_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_471_2 = 2

			if var_471_1 <= arg_468_1.time_ and arg_468_1.time_ < var_471_1 + var_471_2 and not isNil(var_471_0) then
				local var_471_3 = (arg_468_1.time_ - var_471_1) / var_471_2

				if arg_468_1.var_.actorSpriteComps10093 then
					for iter_471_0, iter_471_1 in pairs(arg_468_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_471_1 then
							if arg_468_1.isInRecall_ then
								local var_471_4 = Mathf.Lerp(iter_471_1.color.r, arg_468_1.hightColor1.r, var_471_3)
								local var_471_5 = Mathf.Lerp(iter_471_1.color.g, arg_468_1.hightColor1.g, var_471_3)
								local var_471_6 = Mathf.Lerp(iter_471_1.color.b, arg_468_1.hightColor1.b, var_471_3)

								iter_471_1.color = Color.New(var_471_4, var_471_5, var_471_6)
							else
								local var_471_7 = Mathf.Lerp(iter_471_1.color.r, 1, var_471_3)

								iter_471_1.color = Color.New(var_471_7, var_471_7, var_471_7)
							end
						end
					end
				end
			end

			if arg_468_1.time_ >= var_471_1 + var_471_2 and arg_468_1.time_ < var_471_1 + var_471_2 + arg_471_0 and not isNil(var_471_0) and arg_468_1.var_.actorSpriteComps10093 then
				for iter_471_2, iter_471_3 in pairs(arg_468_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_471_3 then
						if arg_468_1.isInRecall_ then
							iter_471_3.color = arg_468_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_471_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_468_1.var_.actorSpriteComps10093 = nil
			end

			local var_471_8 = arg_468_1.actors_["10092"]
			local var_471_9 = 0

			if var_471_9 < arg_468_1.time_ and arg_468_1.time_ <= var_471_9 + arg_471_0 and not isNil(var_471_8) and arg_468_1.var_.actorSpriteComps10092 == nil then
				arg_468_1.var_.actorSpriteComps10092 = var_471_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_471_10 = 2

			if var_471_9 <= arg_468_1.time_ and arg_468_1.time_ < var_471_9 + var_471_10 and not isNil(var_471_8) then
				local var_471_11 = (arg_468_1.time_ - var_471_9) / var_471_10

				if arg_468_1.var_.actorSpriteComps10092 then
					for iter_471_4, iter_471_5 in pairs(arg_468_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_471_5 then
							if arg_468_1.isInRecall_ then
								local var_471_12 = Mathf.Lerp(iter_471_5.color.r, arg_468_1.hightColor2.r, var_471_11)
								local var_471_13 = Mathf.Lerp(iter_471_5.color.g, arg_468_1.hightColor2.g, var_471_11)
								local var_471_14 = Mathf.Lerp(iter_471_5.color.b, arg_468_1.hightColor2.b, var_471_11)

								iter_471_5.color = Color.New(var_471_12, var_471_13, var_471_14)
							else
								local var_471_15 = Mathf.Lerp(iter_471_5.color.r, 0.5, var_471_11)

								iter_471_5.color = Color.New(var_471_15, var_471_15, var_471_15)
							end
						end
					end
				end
			end

			if arg_468_1.time_ >= var_471_9 + var_471_10 and arg_468_1.time_ < var_471_9 + var_471_10 + arg_471_0 and not isNil(var_471_8) and arg_468_1.var_.actorSpriteComps10092 then
				for iter_471_6, iter_471_7 in pairs(arg_468_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_471_7 then
						if arg_468_1.isInRecall_ then
							iter_471_7.color = arg_468_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_471_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_468_1.var_.actorSpriteComps10092 = nil
			end

			local var_471_16 = 0
			local var_471_17 = 0.525

			if var_471_16 < arg_468_1.time_ and arg_468_1.time_ <= var_471_16 + arg_471_0 then
				arg_468_1.talkMaxDuration = 0
				arg_468_1.dialogCg_.alpha = 1

				arg_468_1.dialog_:SetActive(true)
				SetActive(arg_468_1.leftNameGo_, true)

				local var_471_18 = arg_468_1:FormatText(StoryNameCfg[28].name)

				arg_468_1.leftNameTxt_.text = var_471_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_468_1.leftNameTxt_.transform)

				arg_468_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_468_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_468_1:RecordName(arg_468_1.leftNameTxt_.text)
				SetActive(arg_468_1.iconTrs_.gameObject, false)
				arg_468_1.callingController_:SetSelectedState("normal")

				local var_471_19 = arg_468_1:GetWordFromCfg(413011114)
				local var_471_20 = arg_468_1:FormatText(var_471_19.content)

				arg_468_1.text_.text = var_471_20

				LuaForUtil.ClearLinePrefixSymbol(arg_468_1.text_)

				local var_471_21 = 21
				local var_471_22 = utf8.len(var_471_20)
				local var_471_23 = var_471_21 <= 0 and var_471_17 or var_471_17 * (var_471_22 / var_471_21)

				if var_471_23 > 0 and var_471_17 < var_471_23 then
					arg_468_1.talkMaxDuration = var_471_23

					if var_471_23 + var_471_16 > arg_468_1.duration_ then
						arg_468_1.duration_ = var_471_23 + var_471_16
					end
				end

				arg_468_1.text_.text = var_471_20
				arg_468_1.typewritter.percent = 0

				arg_468_1.typewritter:SetDirty()
				arg_468_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011114", "story_v_out_413011.awb") ~= 0 then
					local var_471_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011114", "story_v_out_413011.awb") / 1000

					if var_471_24 + var_471_16 > arg_468_1.duration_ then
						arg_468_1.duration_ = var_471_24 + var_471_16
					end

					if var_471_19.prefab_name ~= "" and arg_468_1.actors_[var_471_19.prefab_name] ~= nil then
						local var_471_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_468_1.actors_[var_471_19.prefab_name].transform, "story_v_out_413011", "413011114", "story_v_out_413011.awb")

						arg_468_1:RecordAudio("413011114", var_471_25)
						arg_468_1:RecordAudio("413011114", var_471_25)
					else
						arg_468_1:AudioAction("play", "voice", "story_v_out_413011", "413011114", "story_v_out_413011.awb")
					end

					arg_468_1:RecordHistoryTalkVoice("story_v_out_413011", "413011114", "story_v_out_413011.awb")
				end

				arg_468_1:RecordContent(arg_468_1.text_.text)
			end

			local var_471_26 = math.max(var_471_17, arg_468_1.talkMaxDuration)

			if var_471_16 <= arg_468_1.time_ and arg_468_1.time_ < var_471_16 + var_471_26 then
				arg_468_1.typewritter.percent = (arg_468_1.time_ - var_471_16) / var_471_26

				arg_468_1.typewritter:SetDirty()
			end

			if arg_468_1.time_ >= var_471_16 + var_471_26 and arg_468_1.time_ < var_471_16 + var_471_26 + arg_471_0 then
				arg_468_1.typewritter.percent = 1

				arg_468_1.typewritter:SetDirty()
				arg_468_1:ShowNextGo(true)
			end
		end
	end,
	Play413011115 = function(arg_472_0, arg_472_1)
		arg_472_1.time_ = 0
		arg_472_1.frameCnt_ = 0
		arg_472_1.state_ = "playing"
		arg_472_1.curTalkId_ = 413011115
		arg_472_1.duration_ = 11.6

		local var_472_0 = {
			zh = 6.9,
			ja = 11.6
		}
		local var_472_1 = manager.audio:GetLocalizationFlag()

		if var_472_0[var_472_1] ~= nil then
			arg_472_1.duration_ = var_472_0[var_472_1]
		end

		SetActive(arg_472_1.tipsGo_, false)

		function arg_472_1.onSingleLineFinish_()
			arg_472_1.onSingleLineUpdate_ = nil
			arg_472_1.onSingleLineFinish_ = nil
			arg_472_1.state_ = "waiting"
		end

		function arg_472_1.playNext_(arg_474_0)
			if arg_474_0 == 1 then
				arg_472_0:Play413011116(arg_472_1)
			end
		end

		function arg_472_1.onSingleLineUpdate_(arg_475_0)
			local var_475_0 = 0
			local var_475_1 = 0.95

			if var_475_0 < arg_472_1.time_ and arg_472_1.time_ <= var_475_0 + arg_475_0 then
				arg_472_1.talkMaxDuration = 0
				arg_472_1.dialogCg_.alpha = 1

				arg_472_1.dialog_:SetActive(true)
				SetActive(arg_472_1.leftNameGo_, true)

				local var_475_2 = arg_472_1:FormatText(StoryNameCfg[28].name)

				arg_472_1.leftNameTxt_.text = var_475_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_472_1.leftNameTxt_.transform)

				arg_472_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_472_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_472_1:RecordName(arg_472_1.leftNameTxt_.text)
				SetActive(arg_472_1.iconTrs_.gameObject, false)
				arg_472_1.callingController_:SetSelectedState("normal")

				local var_475_3 = arg_472_1:GetWordFromCfg(413011115)
				local var_475_4 = arg_472_1:FormatText(var_475_3.content)

				arg_472_1.text_.text = var_475_4

				LuaForUtil.ClearLinePrefixSymbol(arg_472_1.text_)

				local var_475_5 = 38
				local var_475_6 = utf8.len(var_475_4)
				local var_475_7 = var_475_5 <= 0 and var_475_1 or var_475_1 * (var_475_6 / var_475_5)

				if var_475_7 > 0 and var_475_1 < var_475_7 then
					arg_472_1.talkMaxDuration = var_475_7

					if var_475_7 + var_475_0 > arg_472_1.duration_ then
						arg_472_1.duration_ = var_475_7 + var_475_0
					end
				end

				arg_472_1.text_.text = var_475_4
				arg_472_1.typewritter.percent = 0

				arg_472_1.typewritter:SetDirty()
				arg_472_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011115", "story_v_out_413011.awb") ~= 0 then
					local var_475_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011115", "story_v_out_413011.awb") / 1000

					if var_475_8 + var_475_0 > arg_472_1.duration_ then
						arg_472_1.duration_ = var_475_8 + var_475_0
					end

					if var_475_3.prefab_name ~= "" and arg_472_1.actors_[var_475_3.prefab_name] ~= nil then
						local var_475_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_472_1.actors_[var_475_3.prefab_name].transform, "story_v_out_413011", "413011115", "story_v_out_413011.awb")

						arg_472_1:RecordAudio("413011115", var_475_9)
						arg_472_1:RecordAudio("413011115", var_475_9)
					else
						arg_472_1:AudioAction("play", "voice", "story_v_out_413011", "413011115", "story_v_out_413011.awb")
					end

					arg_472_1:RecordHistoryTalkVoice("story_v_out_413011", "413011115", "story_v_out_413011.awb")
				end

				arg_472_1:RecordContent(arg_472_1.text_.text)
			end

			local var_475_10 = math.max(var_475_1, arg_472_1.talkMaxDuration)

			if var_475_0 <= arg_472_1.time_ and arg_472_1.time_ < var_475_0 + var_475_10 then
				arg_472_1.typewritter.percent = (arg_472_1.time_ - var_475_0) / var_475_10

				arg_472_1.typewritter:SetDirty()
			end

			if arg_472_1.time_ >= var_475_0 + var_475_10 and arg_472_1.time_ < var_475_0 + var_475_10 + arg_475_0 then
				arg_472_1.typewritter.percent = 1

				arg_472_1.typewritter:SetDirty()
				arg_472_1:ShowNextGo(true)
			end
		end
	end,
	Play413011116 = function(arg_476_0, arg_476_1)
		arg_476_1.time_ = 0
		arg_476_1.frameCnt_ = 0
		arg_476_1.state_ = "playing"
		arg_476_1.curTalkId_ = 413011116
		arg_476_1.duration_ = 3.73

		local var_476_0 = {
			zh = 1.999999999999,
			ja = 3.733
		}
		local var_476_1 = manager.audio:GetLocalizationFlag()

		if var_476_0[var_476_1] ~= nil then
			arg_476_1.duration_ = var_476_0[var_476_1]
		end

		SetActive(arg_476_1.tipsGo_, false)

		function arg_476_1.onSingleLineFinish_()
			arg_476_1.onSingleLineUpdate_ = nil
			arg_476_1.onSingleLineFinish_ = nil
			arg_476_1.state_ = "waiting"
		end

		function arg_476_1.playNext_(arg_478_0)
			if arg_478_0 == 1 then
				arg_476_0:Play413011117(arg_476_1)
			end
		end

		function arg_476_1.onSingleLineUpdate_(arg_479_0)
			local var_479_0 = arg_476_1.actors_["10092"].transform
			local var_479_1 = 0

			if var_479_1 < arg_476_1.time_ and arg_476_1.time_ <= var_479_1 + arg_479_0 then
				arg_476_1.var_.moveOldPos10092 = var_479_0.localPosition
				var_479_0.localScale = Vector3.New(1, 1, 1)

				arg_476_1:CheckSpriteTmpPos("10092", 2)

				local var_479_2 = var_479_0.childCount

				for iter_479_0 = 0, var_479_2 - 1 do
					local var_479_3 = var_479_0:GetChild(iter_479_0)

					if var_479_3.name == "split_5" or not string.find(var_479_3.name, "split") then
						var_479_3.gameObject:SetActive(true)
					else
						var_479_3.gameObject:SetActive(false)
					end
				end
			end

			local var_479_4 = 0.001

			if var_479_1 <= arg_476_1.time_ and arg_476_1.time_ < var_479_1 + var_479_4 then
				local var_479_5 = (arg_476_1.time_ - var_479_1) / var_479_4
				local var_479_6 = Vector3.New(-389.49, -300, -295)

				var_479_0.localPosition = Vector3.Lerp(arg_476_1.var_.moveOldPos10092, var_479_6, var_479_5)
			end

			if arg_476_1.time_ >= var_479_1 + var_479_4 and arg_476_1.time_ < var_479_1 + var_479_4 + arg_479_0 then
				var_479_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_479_7 = arg_476_1.actors_["10093"]
			local var_479_8 = 0

			if var_479_8 < arg_476_1.time_ and arg_476_1.time_ <= var_479_8 + arg_479_0 and not isNil(var_479_7) and arg_476_1.var_.actorSpriteComps10093 == nil then
				arg_476_1.var_.actorSpriteComps10093 = var_479_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_479_9 = 2

			if var_479_8 <= arg_476_1.time_ and arg_476_1.time_ < var_479_8 + var_479_9 and not isNil(var_479_7) then
				local var_479_10 = (arg_476_1.time_ - var_479_8) / var_479_9

				if arg_476_1.var_.actorSpriteComps10093 then
					for iter_479_1, iter_479_2 in pairs(arg_476_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_479_2 then
							if arg_476_1.isInRecall_ then
								local var_479_11 = Mathf.Lerp(iter_479_2.color.r, arg_476_1.hightColor2.r, var_479_10)
								local var_479_12 = Mathf.Lerp(iter_479_2.color.g, arg_476_1.hightColor2.g, var_479_10)
								local var_479_13 = Mathf.Lerp(iter_479_2.color.b, arg_476_1.hightColor2.b, var_479_10)

								iter_479_2.color = Color.New(var_479_11, var_479_12, var_479_13)
							else
								local var_479_14 = Mathf.Lerp(iter_479_2.color.r, 0.5, var_479_10)

								iter_479_2.color = Color.New(var_479_14, var_479_14, var_479_14)
							end
						end
					end
				end
			end

			if arg_476_1.time_ >= var_479_8 + var_479_9 and arg_476_1.time_ < var_479_8 + var_479_9 + arg_479_0 and not isNil(var_479_7) and arg_476_1.var_.actorSpriteComps10093 then
				for iter_479_3, iter_479_4 in pairs(arg_476_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_479_4 then
						if arg_476_1.isInRecall_ then
							iter_479_4.color = arg_476_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_479_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_476_1.var_.actorSpriteComps10093 = nil
			end

			local var_479_15 = arg_476_1.actors_["10092"]
			local var_479_16 = 0

			if var_479_16 < arg_476_1.time_ and arg_476_1.time_ <= var_479_16 + arg_479_0 and not isNil(var_479_15) and arg_476_1.var_.actorSpriteComps10092 == nil then
				arg_476_1.var_.actorSpriteComps10092 = var_479_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_479_17 = 2

			if var_479_16 <= arg_476_1.time_ and arg_476_1.time_ < var_479_16 + var_479_17 and not isNil(var_479_15) then
				local var_479_18 = (arg_476_1.time_ - var_479_16) / var_479_17

				if arg_476_1.var_.actorSpriteComps10092 then
					for iter_479_5, iter_479_6 in pairs(arg_476_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_479_6 then
							if arg_476_1.isInRecall_ then
								local var_479_19 = Mathf.Lerp(iter_479_6.color.r, arg_476_1.hightColor1.r, var_479_18)
								local var_479_20 = Mathf.Lerp(iter_479_6.color.g, arg_476_1.hightColor1.g, var_479_18)
								local var_479_21 = Mathf.Lerp(iter_479_6.color.b, arg_476_1.hightColor1.b, var_479_18)

								iter_479_6.color = Color.New(var_479_19, var_479_20, var_479_21)
							else
								local var_479_22 = Mathf.Lerp(iter_479_6.color.r, 1, var_479_18)

								iter_479_6.color = Color.New(var_479_22, var_479_22, var_479_22)
							end
						end
					end
				end
			end

			if arg_476_1.time_ >= var_479_16 + var_479_17 and arg_476_1.time_ < var_479_16 + var_479_17 + arg_479_0 and not isNil(var_479_15) and arg_476_1.var_.actorSpriteComps10092 then
				for iter_479_7, iter_479_8 in pairs(arg_476_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_479_8 then
						if arg_476_1.isInRecall_ then
							iter_479_8.color = arg_476_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_479_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_476_1.var_.actorSpriteComps10092 = nil
			end

			local var_479_23 = 0
			local var_479_24 = 0.15

			if var_479_23 < arg_476_1.time_ and arg_476_1.time_ <= var_479_23 + arg_479_0 then
				arg_476_1.talkMaxDuration = 0
				arg_476_1.dialogCg_.alpha = 1

				arg_476_1.dialog_:SetActive(true)
				SetActive(arg_476_1.leftNameGo_, true)

				local var_479_25 = arg_476_1:FormatText(StoryNameCfg[996].name)

				arg_476_1.leftNameTxt_.text = var_479_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_476_1.leftNameTxt_.transform)

				arg_476_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_476_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_476_1:RecordName(arg_476_1.leftNameTxt_.text)
				SetActive(arg_476_1.iconTrs_.gameObject, false)
				arg_476_1.callingController_:SetSelectedState("normal")

				local var_479_26 = arg_476_1:GetWordFromCfg(413011116)
				local var_479_27 = arg_476_1:FormatText(var_479_26.content)

				arg_476_1.text_.text = var_479_27

				LuaForUtil.ClearLinePrefixSymbol(arg_476_1.text_)

				local var_479_28 = 6
				local var_479_29 = utf8.len(var_479_27)
				local var_479_30 = var_479_28 <= 0 and var_479_24 or var_479_24 * (var_479_29 / var_479_28)

				if var_479_30 > 0 and var_479_24 < var_479_30 then
					arg_476_1.talkMaxDuration = var_479_30

					if var_479_30 + var_479_23 > arg_476_1.duration_ then
						arg_476_1.duration_ = var_479_30 + var_479_23
					end
				end

				arg_476_1.text_.text = var_479_27
				arg_476_1.typewritter.percent = 0

				arg_476_1.typewritter:SetDirty()
				arg_476_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011116", "story_v_out_413011.awb") ~= 0 then
					local var_479_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011116", "story_v_out_413011.awb") / 1000

					if var_479_31 + var_479_23 > arg_476_1.duration_ then
						arg_476_1.duration_ = var_479_31 + var_479_23
					end

					if var_479_26.prefab_name ~= "" and arg_476_1.actors_[var_479_26.prefab_name] ~= nil then
						local var_479_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_476_1.actors_[var_479_26.prefab_name].transform, "story_v_out_413011", "413011116", "story_v_out_413011.awb")

						arg_476_1:RecordAudio("413011116", var_479_32)
						arg_476_1:RecordAudio("413011116", var_479_32)
					else
						arg_476_1:AudioAction("play", "voice", "story_v_out_413011", "413011116", "story_v_out_413011.awb")
					end

					arg_476_1:RecordHistoryTalkVoice("story_v_out_413011", "413011116", "story_v_out_413011.awb")
				end

				arg_476_1:RecordContent(arg_476_1.text_.text)
			end

			local var_479_33 = math.max(var_479_24, arg_476_1.talkMaxDuration)

			if var_479_23 <= arg_476_1.time_ and arg_476_1.time_ < var_479_23 + var_479_33 then
				arg_476_1.typewritter.percent = (arg_476_1.time_ - var_479_23) / var_479_33

				arg_476_1.typewritter:SetDirty()
			end

			if arg_476_1.time_ >= var_479_23 + var_479_33 and arg_476_1.time_ < var_479_23 + var_479_33 + arg_479_0 then
				arg_476_1.typewritter.percent = 1

				arg_476_1.typewritter:SetDirty()
				arg_476_1:ShowNextGo(true)
			end
		end
	end,
	Play413011117 = function(arg_480_0, arg_480_1)
		arg_480_1.time_ = 0
		arg_480_1.frameCnt_ = 0
		arg_480_1.state_ = "playing"
		arg_480_1.curTalkId_ = 413011117
		arg_480_1.duration_ = 2

		SetActive(arg_480_1.tipsGo_, false)

		function arg_480_1.onSingleLineFinish_()
			arg_480_1.onSingleLineUpdate_ = nil
			arg_480_1.onSingleLineFinish_ = nil
			arg_480_1.state_ = "waiting"
		end

		function arg_480_1.playNext_(arg_482_0)
			if arg_482_0 == 1 then
				arg_480_0:Play413011118(arg_480_1)
			end
		end

		function arg_480_1.onSingleLineUpdate_(arg_483_0)
			local var_483_0 = arg_480_1.actors_["10093"]
			local var_483_1 = 0

			if var_483_1 < arg_480_1.time_ and arg_480_1.time_ <= var_483_1 + arg_483_0 and not isNil(var_483_0) and arg_480_1.var_.actorSpriteComps10093 == nil then
				arg_480_1.var_.actorSpriteComps10093 = var_483_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_483_2 = 2

			if var_483_1 <= arg_480_1.time_ and arg_480_1.time_ < var_483_1 + var_483_2 and not isNil(var_483_0) then
				local var_483_3 = (arg_480_1.time_ - var_483_1) / var_483_2

				if arg_480_1.var_.actorSpriteComps10093 then
					for iter_483_0, iter_483_1 in pairs(arg_480_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_483_1 then
							if arg_480_1.isInRecall_ then
								local var_483_4 = Mathf.Lerp(iter_483_1.color.r, arg_480_1.hightColor1.r, var_483_3)
								local var_483_5 = Mathf.Lerp(iter_483_1.color.g, arg_480_1.hightColor1.g, var_483_3)
								local var_483_6 = Mathf.Lerp(iter_483_1.color.b, arg_480_1.hightColor1.b, var_483_3)

								iter_483_1.color = Color.New(var_483_4, var_483_5, var_483_6)
							else
								local var_483_7 = Mathf.Lerp(iter_483_1.color.r, 1, var_483_3)

								iter_483_1.color = Color.New(var_483_7, var_483_7, var_483_7)
							end
						end
					end
				end
			end

			if arg_480_1.time_ >= var_483_1 + var_483_2 and arg_480_1.time_ < var_483_1 + var_483_2 + arg_483_0 and not isNil(var_483_0) and arg_480_1.var_.actorSpriteComps10093 then
				for iter_483_2, iter_483_3 in pairs(arg_480_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_483_3 then
						if arg_480_1.isInRecall_ then
							iter_483_3.color = arg_480_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_483_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_480_1.var_.actorSpriteComps10093 = nil
			end

			local var_483_8 = arg_480_1.actors_["10092"]
			local var_483_9 = 0

			if var_483_9 < arg_480_1.time_ and arg_480_1.time_ <= var_483_9 + arg_483_0 and not isNil(var_483_8) and arg_480_1.var_.actorSpriteComps10092 == nil then
				arg_480_1.var_.actorSpriteComps10092 = var_483_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_483_10 = 2

			if var_483_9 <= arg_480_1.time_ and arg_480_1.time_ < var_483_9 + var_483_10 and not isNil(var_483_8) then
				local var_483_11 = (arg_480_1.time_ - var_483_9) / var_483_10

				if arg_480_1.var_.actorSpriteComps10092 then
					for iter_483_4, iter_483_5 in pairs(arg_480_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_483_5 then
							if arg_480_1.isInRecall_ then
								local var_483_12 = Mathf.Lerp(iter_483_5.color.r, arg_480_1.hightColor2.r, var_483_11)
								local var_483_13 = Mathf.Lerp(iter_483_5.color.g, arg_480_1.hightColor2.g, var_483_11)
								local var_483_14 = Mathf.Lerp(iter_483_5.color.b, arg_480_1.hightColor2.b, var_483_11)

								iter_483_5.color = Color.New(var_483_12, var_483_13, var_483_14)
							else
								local var_483_15 = Mathf.Lerp(iter_483_5.color.r, 0.5, var_483_11)

								iter_483_5.color = Color.New(var_483_15, var_483_15, var_483_15)
							end
						end
					end
				end
			end

			if arg_480_1.time_ >= var_483_9 + var_483_10 and arg_480_1.time_ < var_483_9 + var_483_10 + arg_483_0 and not isNil(var_483_8) and arg_480_1.var_.actorSpriteComps10092 then
				for iter_483_6, iter_483_7 in pairs(arg_480_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_483_7 then
						if arg_480_1.isInRecall_ then
							iter_483_7.color = arg_480_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_483_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_480_1.var_.actorSpriteComps10092 = nil
			end

			local var_483_16 = 0
			local var_483_17 = 0.05

			if var_483_16 < arg_480_1.time_ and arg_480_1.time_ <= var_483_16 + arg_483_0 then
				arg_480_1.talkMaxDuration = 0
				arg_480_1.dialogCg_.alpha = 1

				arg_480_1.dialog_:SetActive(true)
				SetActive(arg_480_1.leftNameGo_, true)

				local var_483_18 = arg_480_1:FormatText(StoryNameCfg[28].name)

				arg_480_1.leftNameTxt_.text = var_483_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_480_1.leftNameTxt_.transform)

				arg_480_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_480_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_480_1:RecordName(arg_480_1.leftNameTxt_.text)
				SetActive(arg_480_1.iconTrs_.gameObject, false)
				arg_480_1.callingController_:SetSelectedState("normal")

				local var_483_19 = arg_480_1:GetWordFromCfg(413011117)
				local var_483_20 = arg_480_1:FormatText(var_483_19.content)

				arg_480_1.text_.text = var_483_20

				LuaForUtil.ClearLinePrefixSymbol(arg_480_1.text_)

				local var_483_21 = 2
				local var_483_22 = utf8.len(var_483_20)
				local var_483_23 = var_483_21 <= 0 and var_483_17 or var_483_17 * (var_483_22 / var_483_21)

				if var_483_23 > 0 and var_483_17 < var_483_23 then
					arg_480_1.talkMaxDuration = var_483_23

					if var_483_23 + var_483_16 > arg_480_1.duration_ then
						arg_480_1.duration_ = var_483_23 + var_483_16
					end
				end

				arg_480_1.text_.text = var_483_20
				arg_480_1.typewritter.percent = 0

				arg_480_1.typewritter:SetDirty()
				arg_480_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011117", "story_v_out_413011.awb") ~= 0 then
					local var_483_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011117", "story_v_out_413011.awb") / 1000

					if var_483_24 + var_483_16 > arg_480_1.duration_ then
						arg_480_1.duration_ = var_483_24 + var_483_16
					end

					if var_483_19.prefab_name ~= "" and arg_480_1.actors_[var_483_19.prefab_name] ~= nil then
						local var_483_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_480_1.actors_[var_483_19.prefab_name].transform, "story_v_out_413011", "413011117", "story_v_out_413011.awb")

						arg_480_1:RecordAudio("413011117", var_483_25)
						arg_480_1:RecordAudio("413011117", var_483_25)
					else
						arg_480_1:AudioAction("play", "voice", "story_v_out_413011", "413011117", "story_v_out_413011.awb")
					end

					arg_480_1:RecordHistoryTalkVoice("story_v_out_413011", "413011117", "story_v_out_413011.awb")
				end

				arg_480_1:RecordContent(arg_480_1.text_.text)
			end

			local var_483_26 = math.max(var_483_17, arg_480_1.talkMaxDuration)

			if var_483_16 <= arg_480_1.time_ and arg_480_1.time_ < var_483_16 + var_483_26 then
				arg_480_1.typewritter.percent = (arg_480_1.time_ - var_483_16) / var_483_26

				arg_480_1.typewritter:SetDirty()
			end

			if arg_480_1.time_ >= var_483_16 + var_483_26 and arg_480_1.time_ < var_483_16 + var_483_26 + arg_483_0 then
				arg_480_1.typewritter.percent = 1

				arg_480_1.typewritter:SetDirty()
				arg_480_1:ShowNextGo(true)
			end
		end
	end,
	Play413011118 = function(arg_484_0, arg_484_1)
		arg_484_1.time_ = 0
		arg_484_1.frameCnt_ = 0
		arg_484_1.state_ = "playing"
		arg_484_1.curTalkId_ = 413011118
		arg_484_1.duration_ = 2.9

		local var_484_0 = {
			zh = 2.866,
			ja = 2.9
		}
		local var_484_1 = manager.audio:GetLocalizationFlag()

		if var_484_0[var_484_1] ~= nil then
			arg_484_1.duration_ = var_484_0[var_484_1]
		end

		SetActive(arg_484_1.tipsGo_, false)

		function arg_484_1.onSingleLineFinish_()
			arg_484_1.onSingleLineUpdate_ = nil
			arg_484_1.onSingleLineFinish_ = nil
			arg_484_1.state_ = "waiting"
		end

		function arg_484_1.playNext_(arg_486_0)
			if arg_486_0 == 1 then
				arg_484_0:Play413011119(arg_484_1)
			end
		end

		function arg_484_1.onSingleLineUpdate_(arg_487_0)
			local var_487_0 = arg_484_1.actors_["10093"]
			local var_487_1 = 0

			if var_487_1 < arg_484_1.time_ and arg_484_1.time_ <= var_487_1 + arg_487_0 and not isNil(var_487_0) and arg_484_1.var_.actorSpriteComps10093 == nil then
				arg_484_1.var_.actorSpriteComps10093 = var_487_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_487_2 = 2

			if var_487_1 <= arg_484_1.time_ and arg_484_1.time_ < var_487_1 + var_487_2 and not isNil(var_487_0) then
				local var_487_3 = (arg_484_1.time_ - var_487_1) / var_487_2

				if arg_484_1.var_.actorSpriteComps10093 then
					for iter_487_0, iter_487_1 in pairs(arg_484_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_487_1 then
							if arg_484_1.isInRecall_ then
								local var_487_4 = Mathf.Lerp(iter_487_1.color.r, arg_484_1.hightColor2.r, var_487_3)
								local var_487_5 = Mathf.Lerp(iter_487_1.color.g, arg_484_1.hightColor2.g, var_487_3)
								local var_487_6 = Mathf.Lerp(iter_487_1.color.b, arg_484_1.hightColor2.b, var_487_3)

								iter_487_1.color = Color.New(var_487_4, var_487_5, var_487_6)
							else
								local var_487_7 = Mathf.Lerp(iter_487_1.color.r, 0.5, var_487_3)

								iter_487_1.color = Color.New(var_487_7, var_487_7, var_487_7)
							end
						end
					end
				end
			end

			if arg_484_1.time_ >= var_487_1 + var_487_2 and arg_484_1.time_ < var_487_1 + var_487_2 + arg_487_0 and not isNil(var_487_0) and arg_484_1.var_.actorSpriteComps10093 then
				for iter_487_2, iter_487_3 in pairs(arg_484_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_487_3 then
						if arg_484_1.isInRecall_ then
							iter_487_3.color = arg_484_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_487_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_484_1.var_.actorSpriteComps10093 = nil
			end

			local var_487_8 = arg_484_1.actors_["10092"]
			local var_487_9 = 0

			if var_487_9 < arg_484_1.time_ and arg_484_1.time_ <= var_487_9 + arg_487_0 and not isNil(var_487_8) and arg_484_1.var_.actorSpriteComps10092 == nil then
				arg_484_1.var_.actorSpriteComps10092 = var_487_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_487_10 = 2

			if var_487_9 <= arg_484_1.time_ and arg_484_1.time_ < var_487_9 + var_487_10 and not isNil(var_487_8) then
				local var_487_11 = (arg_484_1.time_ - var_487_9) / var_487_10

				if arg_484_1.var_.actorSpriteComps10092 then
					for iter_487_4, iter_487_5 in pairs(arg_484_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_487_5 then
							if arg_484_1.isInRecall_ then
								local var_487_12 = Mathf.Lerp(iter_487_5.color.r, arg_484_1.hightColor1.r, var_487_11)
								local var_487_13 = Mathf.Lerp(iter_487_5.color.g, arg_484_1.hightColor1.g, var_487_11)
								local var_487_14 = Mathf.Lerp(iter_487_5.color.b, arg_484_1.hightColor1.b, var_487_11)

								iter_487_5.color = Color.New(var_487_12, var_487_13, var_487_14)
							else
								local var_487_15 = Mathf.Lerp(iter_487_5.color.r, 1, var_487_11)

								iter_487_5.color = Color.New(var_487_15, var_487_15, var_487_15)
							end
						end
					end
				end
			end

			if arg_484_1.time_ >= var_487_9 + var_487_10 and arg_484_1.time_ < var_487_9 + var_487_10 + arg_487_0 and not isNil(var_487_8) and arg_484_1.var_.actorSpriteComps10092 then
				for iter_487_6, iter_487_7 in pairs(arg_484_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_487_7 then
						if arg_484_1.isInRecall_ then
							iter_487_7.color = arg_484_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_487_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_484_1.var_.actorSpriteComps10092 = nil
			end

			local var_487_16 = 0
			local var_487_17 = 0.3

			if var_487_16 < arg_484_1.time_ and arg_484_1.time_ <= var_487_16 + arg_487_0 then
				arg_484_1.talkMaxDuration = 0
				arg_484_1.dialogCg_.alpha = 1

				arg_484_1.dialog_:SetActive(true)
				SetActive(arg_484_1.leftNameGo_, true)

				local var_487_18 = arg_484_1:FormatText(StoryNameCfg[996].name)

				arg_484_1.leftNameTxt_.text = var_487_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_484_1.leftNameTxt_.transform)

				arg_484_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_484_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_484_1:RecordName(arg_484_1.leftNameTxt_.text)
				SetActive(arg_484_1.iconTrs_.gameObject, false)
				arg_484_1.callingController_:SetSelectedState("normal")

				local var_487_19 = arg_484_1:GetWordFromCfg(413011118)
				local var_487_20 = arg_484_1:FormatText(var_487_19.content)

				arg_484_1.text_.text = var_487_20

				LuaForUtil.ClearLinePrefixSymbol(arg_484_1.text_)

				local var_487_21 = 12
				local var_487_22 = utf8.len(var_487_20)
				local var_487_23 = var_487_21 <= 0 and var_487_17 or var_487_17 * (var_487_22 / var_487_21)

				if var_487_23 > 0 and var_487_17 < var_487_23 then
					arg_484_1.talkMaxDuration = var_487_23

					if var_487_23 + var_487_16 > arg_484_1.duration_ then
						arg_484_1.duration_ = var_487_23 + var_487_16
					end
				end

				arg_484_1.text_.text = var_487_20
				arg_484_1.typewritter.percent = 0

				arg_484_1.typewritter:SetDirty()
				arg_484_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011118", "story_v_out_413011.awb") ~= 0 then
					local var_487_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011118", "story_v_out_413011.awb") / 1000

					if var_487_24 + var_487_16 > arg_484_1.duration_ then
						arg_484_1.duration_ = var_487_24 + var_487_16
					end

					if var_487_19.prefab_name ~= "" and arg_484_1.actors_[var_487_19.prefab_name] ~= nil then
						local var_487_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_484_1.actors_[var_487_19.prefab_name].transform, "story_v_out_413011", "413011118", "story_v_out_413011.awb")

						arg_484_1:RecordAudio("413011118", var_487_25)
						arg_484_1:RecordAudio("413011118", var_487_25)
					else
						arg_484_1:AudioAction("play", "voice", "story_v_out_413011", "413011118", "story_v_out_413011.awb")
					end

					arg_484_1:RecordHistoryTalkVoice("story_v_out_413011", "413011118", "story_v_out_413011.awb")
				end

				arg_484_1:RecordContent(arg_484_1.text_.text)
			end

			local var_487_26 = math.max(var_487_17, arg_484_1.talkMaxDuration)

			if var_487_16 <= arg_484_1.time_ and arg_484_1.time_ < var_487_16 + var_487_26 then
				arg_484_1.typewritter.percent = (arg_484_1.time_ - var_487_16) / var_487_26

				arg_484_1.typewritter:SetDirty()
			end

			if arg_484_1.time_ >= var_487_16 + var_487_26 and arg_484_1.time_ < var_487_16 + var_487_26 + arg_487_0 then
				arg_484_1.typewritter.percent = 1

				arg_484_1.typewritter:SetDirty()
				arg_484_1:ShowNextGo(true)
			end
		end
	end,
	Play413011119 = function(arg_488_0, arg_488_1)
		arg_488_1.time_ = 0
		arg_488_1.frameCnt_ = 0
		arg_488_1.state_ = "playing"
		arg_488_1.curTalkId_ = 413011119
		arg_488_1.duration_ = 3.6

		local var_488_0 = {
			zh = 2.766,
			ja = 3.6
		}
		local var_488_1 = manager.audio:GetLocalizationFlag()

		if var_488_0[var_488_1] ~= nil then
			arg_488_1.duration_ = var_488_0[var_488_1]
		end

		SetActive(arg_488_1.tipsGo_, false)

		function arg_488_1.onSingleLineFinish_()
			arg_488_1.onSingleLineUpdate_ = nil
			arg_488_1.onSingleLineFinish_ = nil
			arg_488_1.state_ = "waiting"
		end

		function arg_488_1.playNext_(arg_490_0)
			if arg_490_0 == 1 then
				arg_488_0:Play413011120(arg_488_1)
			end
		end

		function arg_488_1.onSingleLineUpdate_(arg_491_0)
			local var_491_0 = arg_488_1.actors_["10093"]
			local var_491_1 = 0

			if var_491_1 < arg_488_1.time_ and arg_488_1.time_ <= var_491_1 + arg_491_0 and not isNil(var_491_0) and arg_488_1.var_.actorSpriteComps10093 == nil then
				arg_488_1.var_.actorSpriteComps10093 = var_491_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_491_2 = 2

			if var_491_1 <= arg_488_1.time_ and arg_488_1.time_ < var_491_1 + var_491_2 and not isNil(var_491_0) then
				local var_491_3 = (arg_488_1.time_ - var_491_1) / var_491_2

				if arg_488_1.var_.actorSpriteComps10093 then
					for iter_491_0, iter_491_1 in pairs(arg_488_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_491_1 then
							if arg_488_1.isInRecall_ then
								local var_491_4 = Mathf.Lerp(iter_491_1.color.r, arg_488_1.hightColor1.r, var_491_3)
								local var_491_5 = Mathf.Lerp(iter_491_1.color.g, arg_488_1.hightColor1.g, var_491_3)
								local var_491_6 = Mathf.Lerp(iter_491_1.color.b, arg_488_1.hightColor1.b, var_491_3)

								iter_491_1.color = Color.New(var_491_4, var_491_5, var_491_6)
							else
								local var_491_7 = Mathf.Lerp(iter_491_1.color.r, 1, var_491_3)

								iter_491_1.color = Color.New(var_491_7, var_491_7, var_491_7)
							end
						end
					end
				end
			end

			if arg_488_1.time_ >= var_491_1 + var_491_2 and arg_488_1.time_ < var_491_1 + var_491_2 + arg_491_0 and not isNil(var_491_0) and arg_488_1.var_.actorSpriteComps10093 then
				for iter_491_2, iter_491_3 in pairs(arg_488_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_491_3 then
						if arg_488_1.isInRecall_ then
							iter_491_3.color = arg_488_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_491_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_488_1.var_.actorSpriteComps10093 = nil
			end

			local var_491_8 = arg_488_1.actors_["10092"]
			local var_491_9 = 0

			if var_491_9 < arg_488_1.time_ and arg_488_1.time_ <= var_491_9 + arg_491_0 and not isNil(var_491_8) and arg_488_1.var_.actorSpriteComps10092 == nil then
				arg_488_1.var_.actorSpriteComps10092 = var_491_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_491_10 = 2

			if var_491_9 <= arg_488_1.time_ and arg_488_1.time_ < var_491_9 + var_491_10 and not isNil(var_491_8) then
				local var_491_11 = (arg_488_1.time_ - var_491_9) / var_491_10

				if arg_488_1.var_.actorSpriteComps10092 then
					for iter_491_4, iter_491_5 in pairs(arg_488_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_491_5 then
							if arg_488_1.isInRecall_ then
								local var_491_12 = Mathf.Lerp(iter_491_5.color.r, arg_488_1.hightColor2.r, var_491_11)
								local var_491_13 = Mathf.Lerp(iter_491_5.color.g, arg_488_1.hightColor2.g, var_491_11)
								local var_491_14 = Mathf.Lerp(iter_491_5.color.b, arg_488_1.hightColor2.b, var_491_11)

								iter_491_5.color = Color.New(var_491_12, var_491_13, var_491_14)
							else
								local var_491_15 = Mathf.Lerp(iter_491_5.color.r, 0.5, var_491_11)

								iter_491_5.color = Color.New(var_491_15, var_491_15, var_491_15)
							end
						end
					end
				end
			end

			if arg_488_1.time_ >= var_491_9 + var_491_10 and arg_488_1.time_ < var_491_9 + var_491_10 + arg_491_0 and not isNil(var_491_8) and arg_488_1.var_.actorSpriteComps10092 then
				for iter_491_6, iter_491_7 in pairs(arg_488_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_491_7 then
						if arg_488_1.isInRecall_ then
							iter_491_7.color = arg_488_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_491_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_488_1.var_.actorSpriteComps10092 = nil
			end

			local var_491_16 = 0
			local var_491_17 = 0.175

			if var_491_16 < arg_488_1.time_ and arg_488_1.time_ <= var_491_16 + arg_491_0 then
				arg_488_1.talkMaxDuration = 0
				arg_488_1.dialogCg_.alpha = 1

				arg_488_1.dialog_:SetActive(true)
				SetActive(arg_488_1.leftNameGo_, true)

				local var_491_18 = arg_488_1:FormatText(StoryNameCfg[28].name)

				arg_488_1.leftNameTxt_.text = var_491_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_488_1.leftNameTxt_.transform)

				arg_488_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_488_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_488_1:RecordName(arg_488_1.leftNameTxt_.text)
				SetActive(arg_488_1.iconTrs_.gameObject, false)
				arg_488_1.callingController_:SetSelectedState("normal")

				local var_491_19 = arg_488_1:GetWordFromCfg(413011119)
				local var_491_20 = arg_488_1:FormatText(var_491_19.content)

				arg_488_1.text_.text = var_491_20

				LuaForUtil.ClearLinePrefixSymbol(arg_488_1.text_)

				local var_491_21 = 7
				local var_491_22 = utf8.len(var_491_20)
				local var_491_23 = var_491_21 <= 0 and var_491_17 or var_491_17 * (var_491_22 / var_491_21)

				if var_491_23 > 0 and var_491_17 < var_491_23 then
					arg_488_1.talkMaxDuration = var_491_23

					if var_491_23 + var_491_16 > arg_488_1.duration_ then
						arg_488_1.duration_ = var_491_23 + var_491_16
					end
				end

				arg_488_1.text_.text = var_491_20
				arg_488_1.typewritter.percent = 0

				arg_488_1.typewritter:SetDirty()
				arg_488_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011119", "story_v_out_413011.awb") ~= 0 then
					local var_491_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011119", "story_v_out_413011.awb") / 1000

					if var_491_24 + var_491_16 > arg_488_1.duration_ then
						arg_488_1.duration_ = var_491_24 + var_491_16
					end

					if var_491_19.prefab_name ~= "" and arg_488_1.actors_[var_491_19.prefab_name] ~= nil then
						local var_491_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_488_1.actors_[var_491_19.prefab_name].transform, "story_v_out_413011", "413011119", "story_v_out_413011.awb")

						arg_488_1:RecordAudio("413011119", var_491_25)
						arg_488_1:RecordAudio("413011119", var_491_25)
					else
						arg_488_1:AudioAction("play", "voice", "story_v_out_413011", "413011119", "story_v_out_413011.awb")
					end

					arg_488_1:RecordHistoryTalkVoice("story_v_out_413011", "413011119", "story_v_out_413011.awb")
				end

				arg_488_1:RecordContent(arg_488_1.text_.text)
			end

			local var_491_26 = math.max(var_491_17, arg_488_1.talkMaxDuration)

			if var_491_16 <= arg_488_1.time_ and arg_488_1.time_ < var_491_16 + var_491_26 then
				arg_488_1.typewritter.percent = (arg_488_1.time_ - var_491_16) / var_491_26

				arg_488_1.typewritter:SetDirty()
			end

			if arg_488_1.time_ >= var_491_16 + var_491_26 and arg_488_1.time_ < var_491_16 + var_491_26 + arg_491_0 then
				arg_488_1.typewritter.percent = 1

				arg_488_1.typewritter:SetDirty()
				arg_488_1:ShowNextGo(true)
			end
		end
	end,
	Play413011120 = function(arg_492_0, arg_492_1)
		arg_492_1.time_ = 0
		arg_492_1.frameCnt_ = 0
		arg_492_1.state_ = "playing"
		arg_492_1.curTalkId_ = 413011120
		arg_492_1.duration_ = 5.03

		local var_492_0 = {
			zh = 4.533,
			ja = 5.033
		}
		local var_492_1 = manager.audio:GetLocalizationFlag()

		if var_492_0[var_492_1] ~= nil then
			arg_492_1.duration_ = var_492_0[var_492_1]
		end

		SetActive(arg_492_1.tipsGo_, false)

		function arg_492_1.onSingleLineFinish_()
			arg_492_1.onSingleLineUpdate_ = nil
			arg_492_1.onSingleLineFinish_ = nil
			arg_492_1.state_ = "waiting"
		end

		function arg_492_1.playNext_(arg_494_0)
			if arg_494_0 == 1 then
				arg_492_0:Play413011121(arg_492_1)
			end
		end

		function arg_492_1.onSingleLineUpdate_(arg_495_0)
			local var_495_0 = arg_492_1.actors_["10092"].transform
			local var_495_1 = 0

			if var_495_1 < arg_492_1.time_ and arg_492_1.time_ <= var_495_1 + arg_495_0 then
				arg_492_1.var_.moveOldPos10092 = var_495_0.localPosition
				var_495_0.localScale = Vector3.New(1, 1, 1)

				arg_492_1:CheckSpriteTmpPos("10092", 2)

				local var_495_2 = var_495_0.childCount

				for iter_495_0 = 0, var_495_2 - 1 do
					local var_495_3 = var_495_0:GetChild(iter_495_0)

					if var_495_3.name == "" or not string.find(var_495_3.name, "split") then
						var_495_3.gameObject:SetActive(true)
					else
						var_495_3.gameObject:SetActive(false)
					end
				end
			end

			local var_495_4 = 0.001

			if var_495_1 <= arg_492_1.time_ and arg_492_1.time_ < var_495_1 + var_495_4 then
				local var_495_5 = (arg_492_1.time_ - var_495_1) / var_495_4
				local var_495_6 = Vector3.New(-389.49, -300, -295)

				var_495_0.localPosition = Vector3.Lerp(arg_492_1.var_.moveOldPos10092, var_495_6, var_495_5)
			end

			if arg_492_1.time_ >= var_495_1 + var_495_4 and arg_492_1.time_ < var_495_1 + var_495_4 + arg_495_0 then
				var_495_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_495_7 = arg_492_1.actors_["10093"]
			local var_495_8 = 0

			if var_495_8 < arg_492_1.time_ and arg_492_1.time_ <= var_495_8 + arg_495_0 and not isNil(var_495_7) and arg_492_1.var_.actorSpriteComps10093 == nil then
				arg_492_1.var_.actorSpriteComps10093 = var_495_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_495_9 = 2

			if var_495_8 <= arg_492_1.time_ and arg_492_1.time_ < var_495_8 + var_495_9 and not isNil(var_495_7) then
				local var_495_10 = (arg_492_1.time_ - var_495_8) / var_495_9

				if arg_492_1.var_.actorSpriteComps10093 then
					for iter_495_1, iter_495_2 in pairs(arg_492_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_495_2 then
							if arg_492_1.isInRecall_ then
								local var_495_11 = Mathf.Lerp(iter_495_2.color.r, arg_492_1.hightColor2.r, var_495_10)
								local var_495_12 = Mathf.Lerp(iter_495_2.color.g, arg_492_1.hightColor2.g, var_495_10)
								local var_495_13 = Mathf.Lerp(iter_495_2.color.b, arg_492_1.hightColor2.b, var_495_10)

								iter_495_2.color = Color.New(var_495_11, var_495_12, var_495_13)
							else
								local var_495_14 = Mathf.Lerp(iter_495_2.color.r, 0.5, var_495_10)

								iter_495_2.color = Color.New(var_495_14, var_495_14, var_495_14)
							end
						end
					end
				end
			end

			if arg_492_1.time_ >= var_495_8 + var_495_9 and arg_492_1.time_ < var_495_8 + var_495_9 + arg_495_0 and not isNil(var_495_7) and arg_492_1.var_.actorSpriteComps10093 then
				for iter_495_3, iter_495_4 in pairs(arg_492_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_495_4 then
						if arg_492_1.isInRecall_ then
							iter_495_4.color = arg_492_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_495_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_492_1.var_.actorSpriteComps10093 = nil
			end

			local var_495_15 = arg_492_1.actors_["10092"]
			local var_495_16 = 0

			if var_495_16 < arg_492_1.time_ and arg_492_1.time_ <= var_495_16 + arg_495_0 and not isNil(var_495_15) and arg_492_1.var_.actorSpriteComps10092 == nil then
				arg_492_1.var_.actorSpriteComps10092 = var_495_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_495_17 = 2

			if var_495_16 <= arg_492_1.time_ and arg_492_1.time_ < var_495_16 + var_495_17 and not isNil(var_495_15) then
				local var_495_18 = (arg_492_1.time_ - var_495_16) / var_495_17

				if arg_492_1.var_.actorSpriteComps10092 then
					for iter_495_5, iter_495_6 in pairs(arg_492_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_495_6 then
							if arg_492_1.isInRecall_ then
								local var_495_19 = Mathf.Lerp(iter_495_6.color.r, arg_492_1.hightColor1.r, var_495_18)
								local var_495_20 = Mathf.Lerp(iter_495_6.color.g, arg_492_1.hightColor1.g, var_495_18)
								local var_495_21 = Mathf.Lerp(iter_495_6.color.b, arg_492_1.hightColor1.b, var_495_18)

								iter_495_6.color = Color.New(var_495_19, var_495_20, var_495_21)
							else
								local var_495_22 = Mathf.Lerp(iter_495_6.color.r, 1, var_495_18)

								iter_495_6.color = Color.New(var_495_22, var_495_22, var_495_22)
							end
						end
					end
				end
			end

			if arg_492_1.time_ >= var_495_16 + var_495_17 and arg_492_1.time_ < var_495_16 + var_495_17 + arg_495_0 and not isNil(var_495_15) and arg_492_1.var_.actorSpriteComps10092 then
				for iter_495_7, iter_495_8 in pairs(arg_492_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_495_8 then
						if arg_492_1.isInRecall_ then
							iter_495_8.color = arg_492_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_495_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_492_1.var_.actorSpriteComps10092 = nil
			end

			local var_495_23 = 0
			local var_495_24 = 0.5

			if var_495_23 < arg_492_1.time_ and arg_492_1.time_ <= var_495_23 + arg_495_0 then
				arg_492_1.talkMaxDuration = 0
				arg_492_1.dialogCg_.alpha = 1

				arg_492_1.dialog_:SetActive(true)
				SetActive(arg_492_1.leftNameGo_, true)

				local var_495_25 = arg_492_1:FormatText(StoryNameCfg[996].name)

				arg_492_1.leftNameTxt_.text = var_495_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_492_1.leftNameTxt_.transform)

				arg_492_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_492_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_492_1:RecordName(arg_492_1.leftNameTxt_.text)
				SetActive(arg_492_1.iconTrs_.gameObject, false)
				arg_492_1.callingController_:SetSelectedState("normal")

				local var_495_26 = arg_492_1:GetWordFromCfg(413011120)
				local var_495_27 = arg_492_1:FormatText(var_495_26.content)

				arg_492_1.text_.text = var_495_27

				LuaForUtil.ClearLinePrefixSymbol(arg_492_1.text_)

				local var_495_28 = 20
				local var_495_29 = utf8.len(var_495_27)
				local var_495_30 = var_495_28 <= 0 and var_495_24 or var_495_24 * (var_495_29 / var_495_28)

				if var_495_30 > 0 and var_495_24 < var_495_30 then
					arg_492_1.talkMaxDuration = var_495_30

					if var_495_30 + var_495_23 > arg_492_1.duration_ then
						arg_492_1.duration_ = var_495_30 + var_495_23
					end
				end

				arg_492_1.text_.text = var_495_27
				arg_492_1.typewritter.percent = 0

				arg_492_1.typewritter:SetDirty()
				arg_492_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011120", "story_v_out_413011.awb") ~= 0 then
					local var_495_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011120", "story_v_out_413011.awb") / 1000

					if var_495_31 + var_495_23 > arg_492_1.duration_ then
						arg_492_1.duration_ = var_495_31 + var_495_23
					end

					if var_495_26.prefab_name ~= "" and arg_492_1.actors_[var_495_26.prefab_name] ~= nil then
						local var_495_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_492_1.actors_[var_495_26.prefab_name].transform, "story_v_out_413011", "413011120", "story_v_out_413011.awb")

						arg_492_1:RecordAudio("413011120", var_495_32)
						arg_492_1:RecordAudio("413011120", var_495_32)
					else
						arg_492_1:AudioAction("play", "voice", "story_v_out_413011", "413011120", "story_v_out_413011.awb")
					end

					arg_492_1:RecordHistoryTalkVoice("story_v_out_413011", "413011120", "story_v_out_413011.awb")
				end

				arg_492_1:RecordContent(arg_492_1.text_.text)
			end

			local var_495_33 = math.max(var_495_24, arg_492_1.talkMaxDuration)

			if var_495_23 <= arg_492_1.time_ and arg_492_1.time_ < var_495_23 + var_495_33 then
				arg_492_1.typewritter.percent = (arg_492_1.time_ - var_495_23) / var_495_33

				arg_492_1.typewritter:SetDirty()
			end

			if arg_492_1.time_ >= var_495_23 + var_495_33 and arg_492_1.time_ < var_495_23 + var_495_33 + arg_495_0 then
				arg_492_1.typewritter.percent = 1

				arg_492_1.typewritter:SetDirty()
				arg_492_1:ShowNextGo(true)
			end
		end
	end,
	Play413011121 = function(arg_496_0, arg_496_1)
		arg_496_1.time_ = 0
		arg_496_1.frameCnt_ = 0
		arg_496_1.state_ = "playing"
		arg_496_1.curTalkId_ = 413011121
		arg_496_1.duration_ = 10.17

		local var_496_0 = {
			zh = 5.433,
			ja = 10.166
		}
		local var_496_1 = manager.audio:GetLocalizationFlag()

		if var_496_0[var_496_1] ~= nil then
			arg_496_1.duration_ = var_496_0[var_496_1]
		end

		SetActive(arg_496_1.tipsGo_, false)

		function arg_496_1.onSingleLineFinish_()
			arg_496_1.onSingleLineUpdate_ = nil
			arg_496_1.onSingleLineFinish_ = nil
			arg_496_1.state_ = "waiting"
		end

		function arg_496_1.playNext_(arg_498_0)
			if arg_498_0 == 1 then
				arg_496_0:Play413011122(arg_496_1)
			end
		end

		function arg_496_1.onSingleLineUpdate_(arg_499_0)
			local var_499_0 = 0
			local var_499_1 = 0.625

			if var_499_0 < arg_496_1.time_ and arg_496_1.time_ <= var_499_0 + arg_499_0 then
				arg_496_1.talkMaxDuration = 0
				arg_496_1.dialogCg_.alpha = 1

				arg_496_1.dialog_:SetActive(true)
				SetActive(arg_496_1.leftNameGo_, true)

				local var_499_2 = arg_496_1:FormatText(StoryNameCfg[996].name)

				arg_496_1.leftNameTxt_.text = var_499_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_496_1.leftNameTxt_.transform)

				arg_496_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_496_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_496_1:RecordName(arg_496_1.leftNameTxt_.text)
				SetActive(arg_496_1.iconTrs_.gameObject, false)
				arg_496_1.callingController_:SetSelectedState("normal")

				local var_499_3 = arg_496_1:GetWordFromCfg(413011121)
				local var_499_4 = arg_496_1:FormatText(var_499_3.content)

				arg_496_1.text_.text = var_499_4

				LuaForUtil.ClearLinePrefixSymbol(arg_496_1.text_)

				local var_499_5 = 25
				local var_499_6 = utf8.len(var_499_4)
				local var_499_7 = var_499_5 <= 0 and var_499_1 or var_499_1 * (var_499_6 / var_499_5)

				if var_499_7 > 0 and var_499_1 < var_499_7 then
					arg_496_1.talkMaxDuration = var_499_7

					if var_499_7 + var_499_0 > arg_496_1.duration_ then
						arg_496_1.duration_ = var_499_7 + var_499_0
					end
				end

				arg_496_1.text_.text = var_499_4
				arg_496_1.typewritter.percent = 0

				arg_496_1.typewritter:SetDirty()
				arg_496_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011121", "story_v_out_413011.awb") ~= 0 then
					local var_499_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011121", "story_v_out_413011.awb") / 1000

					if var_499_8 + var_499_0 > arg_496_1.duration_ then
						arg_496_1.duration_ = var_499_8 + var_499_0
					end

					if var_499_3.prefab_name ~= "" and arg_496_1.actors_[var_499_3.prefab_name] ~= nil then
						local var_499_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_496_1.actors_[var_499_3.prefab_name].transform, "story_v_out_413011", "413011121", "story_v_out_413011.awb")

						arg_496_1:RecordAudio("413011121", var_499_9)
						arg_496_1:RecordAudio("413011121", var_499_9)
					else
						arg_496_1:AudioAction("play", "voice", "story_v_out_413011", "413011121", "story_v_out_413011.awb")
					end

					arg_496_1:RecordHistoryTalkVoice("story_v_out_413011", "413011121", "story_v_out_413011.awb")
				end

				arg_496_1:RecordContent(arg_496_1.text_.text)
			end

			local var_499_10 = math.max(var_499_1, arg_496_1.talkMaxDuration)

			if var_499_0 <= arg_496_1.time_ and arg_496_1.time_ < var_499_0 + var_499_10 then
				arg_496_1.typewritter.percent = (arg_496_1.time_ - var_499_0) / var_499_10

				arg_496_1.typewritter:SetDirty()
			end

			if arg_496_1.time_ >= var_499_0 + var_499_10 and arg_496_1.time_ < var_499_0 + var_499_10 + arg_499_0 then
				arg_496_1.typewritter.percent = 1

				arg_496_1.typewritter:SetDirty()
				arg_496_1:ShowNextGo(true)
			end
		end
	end,
	Play413011122 = function(arg_500_0, arg_500_1)
		arg_500_1.time_ = 0
		arg_500_1.frameCnt_ = 0
		arg_500_1.state_ = "playing"
		arg_500_1.curTalkId_ = 413011122
		arg_500_1.duration_ = 5.87

		local var_500_0 = {
			zh = 5.866,
			ja = 3.066
		}
		local var_500_1 = manager.audio:GetLocalizationFlag()

		if var_500_0[var_500_1] ~= nil then
			arg_500_1.duration_ = var_500_0[var_500_1]
		end

		SetActive(arg_500_1.tipsGo_, false)

		function arg_500_1.onSingleLineFinish_()
			arg_500_1.onSingleLineUpdate_ = nil
			arg_500_1.onSingleLineFinish_ = nil
			arg_500_1.state_ = "waiting"
		end

		function arg_500_1.playNext_(arg_502_0)
			if arg_502_0 == 1 then
				arg_500_0:Play413011123(arg_500_1)
			end
		end

		function arg_500_1.onSingleLineUpdate_(arg_503_0)
			local var_503_0 = arg_500_1.actors_["10093"].transform
			local var_503_1 = 0

			if var_503_1 < arg_500_1.time_ and arg_500_1.time_ <= var_503_1 + arg_503_0 then
				arg_500_1.var_.moveOldPos10093 = var_503_0.localPosition
				var_503_0.localScale = Vector3.New(1, 1, 1)

				arg_500_1:CheckSpriteTmpPos("10093", 4)

				local var_503_2 = var_503_0.childCount

				for iter_503_0 = 0, var_503_2 - 1 do
					local var_503_3 = var_503_0:GetChild(iter_503_0)

					if var_503_3.name == "split_4" or not string.find(var_503_3.name, "split") then
						var_503_3.gameObject:SetActive(true)
					else
						var_503_3.gameObject:SetActive(false)
					end
				end
			end

			local var_503_4 = 0.001

			if var_503_1 <= arg_500_1.time_ and arg_500_1.time_ < var_503_1 + var_503_4 then
				local var_503_5 = (arg_500_1.time_ - var_503_1) / var_503_4
				local var_503_6 = Vector3.New(390, -345, -245)

				var_503_0.localPosition = Vector3.Lerp(arg_500_1.var_.moveOldPos10093, var_503_6, var_503_5)
			end

			if arg_500_1.time_ >= var_503_1 + var_503_4 and arg_500_1.time_ < var_503_1 + var_503_4 + arg_503_0 then
				var_503_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_503_7 = arg_500_1.actors_["10093"]
			local var_503_8 = 0

			if var_503_8 < arg_500_1.time_ and arg_500_1.time_ <= var_503_8 + arg_503_0 and not isNil(var_503_7) and arg_500_1.var_.actorSpriteComps10093 == nil then
				arg_500_1.var_.actorSpriteComps10093 = var_503_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_503_9 = 2

			if var_503_8 <= arg_500_1.time_ and arg_500_1.time_ < var_503_8 + var_503_9 and not isNil(var_503_7) then
				local var_503_10 = (arg_500_1.time_ - var_503_8) / var_503_9

				if arg_500_1.var_.actorSpriteComps10093 then
					for iter_503_1, iter_503_2 in pairs(arg_500_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_503_2 then
							if arg_500_1.isInRecall_ then
								local var_503_11 = Mathf.Lerp(iter_503_2.color.r, arg_500_1.hightColor1.r, var_503_10)
								local var_503_12 = Mathf.Lerp(iter_503_2.color.g, arg_500_1.hightColor1.g, var_503_10)
								local var_503_13 = Mathf.Lerp(iter_503_2.color.b, arg_500_1.hightColor1.b, var_503_10)

								iter_503_2.color = Color.New(var_503_11, var_503_12, var_503_13)
							else
								local var_503_14 = Mathf.Lerp(iter_503_2.color.r, 1, var_503_10)

								iter_503_2.color = Color.New(var_503_14, var_503_14, var_503_14)
							end
						end
					end
				end
			end

			if arg_500_1.time_ >= var_503_8 + var_503_9 and arg_500_1.time_ < var_503_8 + var_503_9 + arg_503_0 and not isNil(var_503_7) and arg_500_1.var_.actorSpriteComps10093 then
				for iter_503_3, iter_503_4 in pairs(arg_500_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_503_4 then
						if arg_500_1.isInRecall_ then
							iter_503_4.color = arg_500_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_503_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_500_1.var_.actorSpriteComps10093 = nil
			end

			local var_503_15 = arg_500_1.actors_["10092"]
			local var_503_16 = 0

			if var_503_16 < arg_500_1.time_ and arg_500_1.time_ <= var_503_16 + arg_503_0 and not isNil(var_503_15) and arg_500_1.var_.actorSpriteComps10092 == nil then
				arg_500_1.var_.actorSpriteComps10092 = var_503_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_503_17 = 2

			if var_503_16 <= arg_500_1.time_ and arg_500_1.time_ < var_503_16 + var_503_17 and not isNil(var_503_15) then
				local var_503_18 = (arg_500_1.time_ - var_503_16) / var_503_17

				if arg_500_1.var_.actorSpriteComps10092 then
					for iter_503_5, iter_503_6 in pairs(arg_500_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_503_6 then
							if arg_500_1.isInRecall_ then
								local var_503_19 = Mathf.Lerp(iter_503_6.color.r, arg_500_1.hightColor2.r, var_503_18)
								local var_503_20 = Mathf.Lerp(iter_503_6.color.g, arg_500_1.hightColor2.g, var_503_18)
								local var_503_21 = Mathf.Lerp(iter_503_6.color.b, arg_500_1.hightColor2.b, var_503_18)

								iter_503_6.color = Color.New(var_503_19, var_503_20, var_503_21)
							else
								local var_503_22 = Mathf.Lerp(iter_503_6.color.r, 0.5, var_503_18)

								iter_503_6.color = Color.New(var_503_22, var_503_22, var_503_22)
							end
						end
					end
				end
			end

			if arg_500_1.time_ >= var_503_16 + var_503_17 and arg_500_1.time_ < var_503_16 + var_503_17 + arg_503_0 and not isNil(var_503_15) and arg_500_1.var_.actorSpriteComps10092 then
				for iter_503_7, iter_503_8 in pairs(arg_500_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_503_8 then
						if arg_500_1.isInRecall_ then
							iter_503_8.color = arg_500_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_503_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_500_1.var_.actorSpriteComps10092 = nil
			end

			local var_503_23 = 0
			local var_503_24 = 0.8

			if var_503_23 < arg_500_1.time_ and arg_500_1.time_ <= var_503_23 + arg_503_0 then
				arg_500_1.talkMaxDuration = 0
				arg_500_1.dialogCg_.alpha = 1

				arg_500_1.dialog_:SetActive(true)
				SetActive(arg_500_1.leftNameGo_, true)

				local var_503_25 = arg_500_1:FormatText(StoryNameCfg[28].name)

				arg_500_1.leftNameTxt_.text = var_503_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_500_1.leftNameTxt_.transform)

				arg_500_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_500_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_500_1:RecordName(arg_500_1.leftNameTxt_.text)
				SetActive(arg_500_1.iconTrs_.gameObject, false)
				arg_500_1.callingController_:SetSelectedState("normal")

				local var_503_26 = arg_500_1:GetWordFromCfg(413011122)
				local var_503_27 = arg_500_1:FormatText(var_503_26.content)

				arg_500_1.text_.text = var_503_27

				LuaForUtil.ClearLinePrefixSymbol(arg_500_1.text_)

				local var_503_28 = 32
				local var_503_29 = utf8.len(var_503_27)
				local var_503_30 = var_503_28 <= 0 and var_503_24 or var_503_24 * (var_503_29 / var_503_28)

				if var_503_30 > 0 and var_503_24 < var_503_30 then
					arg_500_1.talkMaxDuration = var_503_30

					if var_503_30 + var_503_23 > arg_500_1.duration_ then
						arg_500_1.duration_ = var_503_30 + var_503_23
					end
				end

				arg_500_1.text_.text = var_503_27
				arg_500_1.typewritter.percent = 0

				arg_500_1.typewritter:SetDirty()
				arg_500_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011122", "story_v_out_413011.awb") ~= 0 then
					local var_503_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011122", "story_v_out_413011.awb") / 1000

					if var_503_31 + var_503_23 > arg_500_1.duration_ then
						arg_500_1.duration_ = var_503_31 + var_503_23
					end

					if var_503_26.prefab_name ~= "" and arg_500_1.actors_[var_503_26.prefab_name] ~= nil then
						local var_503_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_500_1.actors_[var_503_26.prefab_name].transform, "story_v_out_413011", "413011122", "story_v_out_413011.awb")

						arg_500_1:RecordAudio("413011122", var_503_32)
						arg_500_1:RecordAudio("413011122", var_503_32)
					else
						arg_500_1:AudioAction("play", "voice", "story_v_out_413011", "413011122", "story_v_out_413011.awb")
					end

					arg_500_1:RecordHistoryTalkVoice("story_v_out_413011", "413011122", "story_v_out_413011.awb")
				end

				arg_500_1:RecordContent(arg_500_1.text_.text)
			end

			local var_503_33 = math.max(var_503_24, arg_500_1.talkMaxDuration)

			if var_503_23 <= arg_500_1.time_ and arg_500_1.time_ < var_503_23 + var_503_33 then
				arg_500_1.typewritter.percent = (arg_500_1.time_ - var_503_23) / var_503_33

				arg_500_1.typewritter:SetDirty()
			end

			if arg_500_1.time_ >= var_503_23 + var_503_33 and arg_500_1.time_ < var_503_23 + var_503_33 + arg_503_0 then
				arg_500_1.typewritter.percent = 1

				arg_500_1.typewritter:SetDirty()
				arg_500_1:ShowNextGo(true)
			end
		end
	end,
	Play413011123 = function(arg_504_0, arg_504_1)
		arg_504_1.time_ = 0
		arg_504_1.frameCnt_ = 0
		arg_504_1.state_ = "playing"
		arg_504_1.curTalkId_ = 413011123
		arg_504_1.duration_ = 11.23

		local var_504_0 = {
			zh = 7.766,
			ja = 11.233
		}
		local var_504_1 = manager.audio:GetLocalizationFlag()

		if var_504_0[var_504_1] ~= nil then
			arg_504_1.duration_ = var_504_0[var_504_1]
		end

		SetActive(arg_504_1.tipsGo_, false)

		function arg_504_1.onSingleLineFinish_()
			arg_504_1.onSingleLineUpdate_ = nil
			arg_504_1.onSingleLineFinish_ = nil
			arg_504_1.state_ = "waiting"
		end

		function arg_504_1.playNext_(arg_506_0)
			if arg_506_0 == 1 then
				arg_504_0:Play413011124(arg_504_1)
			end
		end

		function arg_504_1.onSingleLineUpdate_(arg_507_0)
			local var_507_0 = arg_504_1.actors_["10093"]
			local var_507_1 = 0

			if var_507_1 < arg_504_1.time_ and arg_504_1.time_ <= var_507_1 + arg_507_0 and not isNil(var_507_0) and arg_504_1.var_.actorSpriteComps10093 == nil then
				arg_504_1.var_.actorSpriteComps10093 = var_507_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_507_2 = 2

			if var_507_1 <= arg_504_1.time_ and arg_504_1.time_ < var_507_1 + var_507_2 and not isNil(var_507_0) then
				local var_507_3 = (arg_504_1.time_ - var_507_1) / var_507_2

				if arg_504_1.var_.actorSpriteComps10093 then
					for iter_507_0, iter_507_1 in pairs(arg_504_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_507_1 then
							if arg_504_1.isInRecall_ then
								local var_507_4 = Mathf.Lerp(iter_507_1.color.r, arg_504_1.hightColor2.r, var_507_3)
								local var_507_5 = Mathf.Lerp(iter_507_1.color.g, arg_504_1.hightColor2.g, var_507_3)
								local var_507_6 = Mathf.Lerp(iter_507_1.color.b, arg_504_1.hightColor2.b, var_507_3)

								iter_507_1.color = Color.New(var_507_4, var_507_5, var_507_6)
							else
								local var_507_7 = Mathf.Lerp(iter_507_1.color.r, 0.5, var_507_3)

								iter_507_1.color = Color.New(var_507_7, var_507_7, var_507_7)
							end
						end
					end
				end
			end

			if arg_504_1.time_ >= var_507_1 + var_507_2 and arg_504_1.time_ < var_507_1 + var_507_2 + arg_507_0 and not isNil(var_507_0) and arg_504_1.var_.actorSpriteComps10093 then
				for iter_507_2, iter_507_3 in pairs(arg_504_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_507_3 then
						if arg_504_1.isInRecall_ then
							iter_507_3.color = arg_504_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_507_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_504_1.var_.actorSpriteComps10093 = nil
			end

			local var_507_8 = arg_504_1.actors_["10092"]
			local var_507_9 = 0

			if var_507_9 < arg_504_1.time_ and arg_504_1.time_ <= var_507_9 + arg_507_0 and not isNil(var_507_8) and arg_504_1.var_.actorSpriteComps10092 == nil then
				arg_504_1.var_.actorSpriteComps10092 = var_507_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_507_10 = 2

			if var_507_9 <= arg_504_1.time_ and arg_504_1.time_ < var_507_9 + var_507_10 and not isNil(var_507_8) then
				local var_507_11 = (arg_504_1.time_ - var_507_9) / var_507_10

				if arg_504_1.var_.actorSpriteComps10092 then
					for iter_507_4, iter_507_5 in pairs(arg_504_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_507_5 then
							if arg_504_1.isInRecall_ then
								local var_507_12 = Mathf.Lerp(iter_507_5.color.r, arg_504_1.hightColor1.r, var_507_11)
								local var_507_13 = Mathf.Lerp(iter_507_5.color.g, arg_504_1.hightColor1.g, var_507_11)
								local var_507_14 = Mathf.Lerp(iter_507_5.color.b, arg_504_1.hightColor1.b, var_507_11)

								iter_507_5.color = Color.New(var_507_12, var_507_13, var_507_14)
							else
								local var_507_15 = Mathf.Lerp(iter_507_5.color.r, 1, var_507_11)

								iter_507_5.color = Color.New(var_507_15, var_507_15, var_507_15)
							end
						end
					end
				end
			end

			if arg_504_1.time_ >= var_507_9 + var_507_10 and arg_504_1.time_ < var_507_9 + var_507_10 + arg_507_0 and not isNil(var_507_8) and arg_504_1.var_.actorSpriteComps10092 then
				for iter_507_6, iter_507_7 in pairs(arg_504_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_507_7 then
						if arg_504_1.isInRecall_ then
							iter_507_7.color = arg_504_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_507_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_504_1.var_.actorSpriteComps10092 = nil
			end

			local var_507_16 = 0
			local var_507_17 = 0.975

			if var_507_16 < arg_504_1.time_ and arg_504_1.time_ <= var_507_16 + arg_507_0 then
				arg_504_1.talkMaxDuration = 0
				arg_504_1.dialogCg_.alpha = 1

				arg_504_1.dialog_:SetActive(true)
				SetActive(arg_504_1.leftNameGo_, true)

				local var_507_18 = arg_504_1:FormatText(StoryNameCfg[996].name)

				arg_504_1.leftNameTxt_.text = var_507_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_504_1.leftNameTxt_.transform)

				arg_504_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_504_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_504_1:RecordName(arg_504_1.leftNameTxt_.text)
				SetActive(arg_504_1.iconTrs_.gameObject, false)
				arg_504_1.callingController_:SetSelectedState("normal")

				local var_507_19 = arg_504_1:GetWordFromCfg(413011123)
				local var_507_20 = arg_504_1:FormatText(var_507_19.content)

				arg_504_1.text_.text = var_507_20

				LuaForUtil.ClearLinePrefixSymbol(arg_504_1.text_)

				local var_507_21 = 39
				local var_507_22 = utf8.len(var_507_20)
				local var_507_23 = var_507_21 <= 0 and var_507_17 or var_507_17 * (var_507_22 / var_507_21)

				if var_507_23 > 0 and var_507_17 < var_507_23 then
					arg_504_1.talkMaxDuration = var_507_23

					if var_507_23 + var_507_16 > arg_504_1.duration_ then
						arg_504_1.duration_ = var_507_23 + var_507_16
					end
				end

				arg_504_1.text_.text = var_507_20
				arg_504_1.typewritter.percent = 0

				arg_504_1.typewritter:SetDirty()
				arg_504_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011123", "story_v_out_413011.awb") ~= 0 then
					local var_507_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011123", "story_v_out_413011.awb") / 1000

					if var_507_24 + var_507_16 > arg_504_1.duration_ then
						arg_504_1.duration_ = var_507_24 + var_507_16
					end

					if var_507_19.prefab_name ~= "" and arg_504_1.actors_[var_507_19.prefab_name] ~= nil then
						local var_507_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_504_1.actors_[var_507_19.prefab_name].transform, "story_v_out_413011", "413011123", "story_v_out_413011.awb")

						arg_504_1:RecordAudio("413011123", var_507_25)
						arg_504_1:RecordAudio("413011123", var_507_25)
					else
						arg_504_1:AudioAction("play", "voice", "story_v_out_413011", "413011123", "story_v_out_413011.awb")
					end

					arg_504_1:RecordHistoryTalkVoice("story_v_out_413011", "413011123", "story_v_out_413011.awb")
				end

				arg_504_1:RecordContent(arg_504_1.text_.text)
			end

			local var_507_26 = math.max(var_507_17, arg_504_1.talkMaxDuration)

			if var_507_16 <= arg_504_1.time_ and arg_504_1.time_ < var_507_16 + var_507_26 then
				arg_504_1.typewritter.percent = (arg_504_1.time_ - var_507_16) / var_507_26

				arg_504_1.typewritter:SetDirty()
			end

			if arg_504_1.time_ >= var_507_16 + var_507_26 and arg_504_1.time_ < var_507_16 + var_507_26 + arg_507_0 then
				arg_504_1.typewritter.percent = 1

				arg_504_1.typewritter:SetDirty()
				arg_504_1:ShowNextGo(true)
			end
		end
	end,
	Play413011124 = function(arg_508_0, arg_508_1)
		arg_508_1.time_ = 0
		arg_508_1.frameCnt_ = 0
		arg_508_1.state_ = "playing"
		arg_508_1.curTalkId_ = 413011124
		arg_508_1.duration_ = 2

		SetActive(arg_508_1.tipsGo_, false)

		function arg_508_1.onSingleLineFinish_()
			arg_508_1.onSingleLineUpdate_ = nil
			arg_508_1.onSingleLineFinish_ = nil
			arg_508_1.state_ = "waiting"
		end

		function arg_508_1.playNext_(arg_510_0)
			if arg_510_0 == 1 then
				arg_508_0:Play413011125(arg_508_1)
			end
		end

		function arg_508_1.onSingleLineUpdate_(arg_511_0)
			local var_511_0 = arg_508_1.actors_["10093"]
			local var_511_1 = 0

			if var_511_1 < arg_508_1.time_ and arg_508_1.time_ <= var_511_1 + arg_511_0 and not isNil(var_511_0) and arg_508_1.var_.actorSpriteComps10093 == nil then
				arg_508_1.var_.actorSpriteComps10093 = var_511_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_511_2 = 2

			if var_511_1 <= arg_508_1.time_ and arg_508_1.time_ < var_511_1 + var_511_2 and not isNil(var_511_0) then
				local var_511_3 = (arg_508_1.time_ - var_511_1) / var_511_2

				if arg_508_1.var_.actorSpriteComps10093 then
					for iter_511_0, iter_511_1 in pairs(arg_508_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_511_1 then
							if arg_508_1.isInRecall_ then
								local var_511_4 = Mathf.Lerp(iter_511_1.color.r, arg_508_1.hightColor1.r, var_511_3)
								local var_511_5 = Mathf.Lerp(iter_511_1.color.g, arg_508_1.hightColor1.g, var_511_3)
								local var_511_6 = Mathf.Lerp(iter_511_1.color.b, arg_508_1.hightColor1.b, var_511_3)

								iter_511_1.color = Color.New(var_511_4, var_511_5, var_511_6)
							else
								local var_511_7 = Mathf.Lerp(iter_511_1.color.r, 1, var_511_3)

								iter_511_1.color = Color.New(var_511_7, var_511_7, var_511_7)
							end
						end
					end
				end
			end

			if arg_508_1.time_ >= var_511_1 + var_511_2 and arg_508_1.time_ < var_511_1 + var_511_2 + arg_511_0 and not isNil(var_511_0) and arg_508_1.var_.actorSpriteComps10093 then
				for iter_511_2, iter_511_3 in pairs(arg_508_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_511_3 then
						if arg_508_1.isInRecall_ then
							iter_511_3.color = arg_508_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_511_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_508_1.var_.actorSpriteComps10093 = nil
			end

			local var_511_8 = arg_508_1.actors_["10092"]
			local var_511_9 = 0

			if var_511_9 < arg_508_1.time_ and arg_508_1.time_ <= var_511_9 + arg_511_0 and not isNil(var_511_8) and arg_508_1.var_.actorSpriteComps10092 == nil then
				arg_508_1.var_.actorSpriteComps10092 = var_511_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_511_10 = 2

			if var_511_9 <= arg_508_1.time_ and arg_508_1.time_ < var_511_9 + var_511_10 and not isNil(var_511_8) then
				local var_511_11 = (arg_508_1.time_ - var_511_9) / var_511_10

				if arg_508_1.var_.actorSpriteComps10092 then
					for iter_511_4, iter_511_5 in pairs(arg_508_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_511_5 then
							if arg_508_1.isInRecall_ then
								local var_511_12 = Mathf.Lerp(iter_511_5.color.r, arg_508_1.hightColor2.r, var_511_11)
								local var_511_13 = Mathf.Lerp(iter_511_5.color.g, arg_508_1.hightColor2.g, var_511_11)
								local var_511_14 = Mathf.Lerp(iter_511_5.color.b, arg_508_1.hightColor2.b, var_511_11)

								iter_511_5.color = Color.New(var_511_12, var_511_13, var_511_14)
							else
								local var_511_15 = Mathf.Lerp(iter_511_5.color.r, 0.5, var_511_11)

								iter_511_5.color = Color.New(var_511_15, var_511_15, var_511_15)
							end
						end
					end
				end
			end

			if arg_508_1.time_ >= var_511_9 + var_511_10 and arg_508_1.time_ < var_511_9 + var_511_10 + arg_511_0 and not isNil(var_511_8) and arg_508_1.var_.actorSpriteComps10092 then
				for iter_511_6, iter_511_7 in pairs(arg_508_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_511_7 then
						if arg_508_1.isInRecall_ then
							iter_511_7.color = arg_508_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_511_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_508_1.var_.actorSpriteComps10092 = nil
			end

			local var_511_16 = 0
			local var_511_17 = 0.2

			if var_511_16 < arg_508_1.time_ and arg_508_1.time_ <= var_511_16 + arg_511_0 then
				arg_508_1.talkMaxDuration = 0
				arg_508_1.dialogCg_.alpha = 1

				arg_508_1.dialog_:SetActive(true)
				SetActive(arg_508_1.leftNameGo_, true)

				local var_511_18 = arg_508_1:FormatText(StoryNameCfg[28].name)

				arg_508_1.leftNameTxt_.text = var_511_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_508_1.leftNameTxt_.transform)

				arg_508_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_508_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_508_1:RecordName(arg_508_1.leftNameTxt_.text)
				SetActive(arg_508_1.iconTrs_.gameObject, false)
				arg_508_1.callingController_:SetSelectedState("normal")

				local var_511_19 = arg_508_1:GetWordFromCfg(413011124)
				local var_511_20 = arg_508_1:FormatText(var_511_19.content)

				arg_508_1.text_.text = var_511_20

				LuaForUtil.ClearLinePrefixSymbol(arg_508_1.text_)

				local var_511_21 = 8
				local var_511_22 = utf8.len(var_511_20)
				local var_511_23 = var_511_21 <= 0 and var_511_17 or var_511_17 * (var_511_22 / var_511_21)

				if var_511_23 > 0 and var_511_17 < var_511_23 then
					arg_508_1.talkMaxDuration = var_511_23

					if var_511_23 + var_511_16 > arg_508_1.duration_ then
						arg_508_1.duration_ = var_511_23 + var_511_16
					end
				end

				arg_508_1.text_.text = var_511_20
				arg_508_1.typewritter.percent = 0

				arg_508_1.typewritter:SetDirty()
				arg_508_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011124", "story_v_out_413011.awb") ~= 0 then
					local var_511_24 = manager.audio:GetVoiceLength("story_v_out_413011", "413011124", "story_v_out_413011.awb") / 1000

					if var_511_24 + var_511_16 > arg_508_1.duration_ then
						arg_508_1.duration_ = var_511_24 + var_511_16
					end

					if var_511_19.prefab_name ~= "" and arg_508_1.actors_[var_511_19.prefab_name] ~= nil then
						local var_511_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_508_1.actors_[var_511_19.prefab_name].transform, "story_v_out_413011", "413011124", "story_v_out_413011.awb")

						arg_508_1:RecordAudio("413011124", var_511_25)
						arg_508_1:RecordAudio("413011124", var_511_25)
					else
						arg_508_1:AudioAction("play", "voice", "story_v_out_413011", "413011124", "story_v_out_413011.awb")
					end

					arg_508_1:RecordHistoryTalkVoice("story_v_out_413011", "413011124", "story_v_out_413011.awb")
				end

				arg_508_1:RecordContent(arg_508_1.text_.text)
			end

			local var_511_26 = math.max(var_511_17, arg_508_1.talkMaxDuration)

			if var_511_16 <= arg_508_1.time_ and arg_508_1.time_ < var_511_16 + var_511_26 then
				arg_508_1.typewritter.percent = (arg_508_1.time_ - var_511_16) / var_511_26

				arg_508_1.typewritter:SetDirty()
			end

			if arg_508_1.time_ >= var_511_16 + var_511_26 and arg_508_1.time_ < var_511_16 + var_511_26 + arg_511_0 then
				arg_508_1.typewritter.percent = 1

				arg_508_1.typewritter:SetDirty()
				arg_508_1:ShowNextGo(true)
			end
		end
	end,
	Play413011125 = function(arg_512_0, arg_512_1)
		arg_512_1.time_ = 0
		arg_512_1.frameCnt_ = 0
		arg_512_1.state_ = "playing"
		arg_512_1.curTalkId_ = 413011125
		arg_512_1.duration_ = 8.03

		local var_512_0 = {
			zh = 8.033,
			ja = 5.766
		}
		local var_512_1 = manager.audio:GetLocalizationFlag()

		if var_512_0[var_512_1] ~= nil then
			arg_512_1.duration_ = var_512_0[var_512_1]
		end

		SetActive(arg_512_1.tipsGo_, false)

		function arg_512_1.onSingleLineFinish_()
			arg_512_1.onSingleLineUpdate_ = nil
			arg_512_1.onSingleLineFinish_ = nil
			arg_512_1.state_ = "waiting"
		end

		function arg_512_1.playNext_(arg_514_0)
			if arg_514_0 == 1 then
				arg_512_0:Play413011126(arg_512_1)
			end
		end

		function arg_512_1.onSingleLineUpdate_(arg_515_0)
			local var_515_0 = arg_512_1.actors_["10092"].transform
			local var_515_1 = 0

			if var_515_1 < arg_512_1.time_ and arg_512_1.time_ <= var_515_1 + arg_515_0 then
				arg_512_1.var_.moveOldPos10092 = var_515_0.localPosition
				var_515_0.localScale = Vector3.New(1, 1, 1)

				arg_512_1:CheckSpriteTmpPos("10092", 2)

				local var_515_2 = var_515_0.childCount

				for iter_515_0 = 0, var_515_2 - 1 do
					local var_515_3 = var_515_0:GetChild(iter_515_0)

					if var_515_3.name == "split_2" or not string.find(var_515_3.name, "split") then
						var_515_3.gameObject:SetActive(true)
					else
						var_515_3.gameObject:SetActive(false)
					end
				end
			end

			local var_515_4 = 0.001

			if var_515_1 <= arg_512_1.time_ and arg_512_1.time_ < var_515_1 + var_515_4 then
				local var_515_5 = (arg_512_1.time_ - var_515_1) / var_515_4
				local var_515_6 = Vector3.New(-389.49, -300, -295)

				var_515_0.localPosition = Vector3.Lerp(arg_512_1.var_.moveOldPos10092, var_515_6, var_515_5)
			end

			if arg_512_1.time_ >= var_515_1 + var_515_4 and arg_512_1.time_ < var_515_1 + var_515_4 + arg_515_0 then
				var_515_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_515_7 = arg_512_1.actors_["10093"]
			local var_515_8 = 0

			if var_515_8 < arg_512_1.time_ and arg_512_1.time_ <= var_515_8 + arg_515_0 and not isNil(var_515_7) and arg_512_1.var_.actorSpriteComps10093 == nil then
				arg_512_1.var_.actorSpriteComps10093 = var_515_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_515_9 = 2

			if var_515_8 <= arg_512_1.time_ and arg_512_1.time_ < var_515_8 + var_515_9 and not isNil(var_515_7) then
				local var_515_10 = (arg_512_1.time_ - var_515_8) / var_515_9

				if arg_512_1.var_.actorSpriteComps10093 then
					for iter_515_1, iter_515_2 in pairs(arg_512_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_515_2 then
							if arg_512_1.isInRecall_ then
								local var_515_11 = Mathf.Lerp(iter_515_2.color.r, arg_512_1.hightColor2.r, var_515_10)
								local var_515_12 = Mathf.Lerp(iter_515_2.color.g, arg_512_1.hightColor2.g, var_515_10)
								local var_515_13 = Mathf.Lerp(iter_515_2.color.b, arg_512_1.hightColor2.b, var_515_10)

								iter_515_2.color = Color.New(var_515_11, var_515_12, var_515_13)
							else
								local var_515_14 = Mathf.Lerp(iter_515_2.color.r, 0.5, var_515_10)

								iter_515_2.color = Color.New(var_515_14, var_515_14, var_515_14)
							end
						end
					end
				end
			end

			if arg_512_1.time_ >= var_515_8 + var_515_9 and arg_512_1.time_ < var_515_8 + var_515_9 + arg_515_0 and not isNil(var_515_7) and arg_512_1.var_.actorSpriteComps10093 then
				for iter_515_3, iter_515_4 in pairs(arg_512_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_515_4 then
						if arg_512_1.isInRecall_ then
							iter_515_4.color = arg_512_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_515_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_512_1.var_.actorSpriteComps10093 = nil
			end

			local var_515_15 = arg_512_1.actors_["10092"]
			local var_515_16 = 0

			if var_515_16 < arg_512_1.time_ and arg_512_1.time_ <= var_515_16 + arg_515_0 and not isNil(var_515_15) and arg_512_1.var_.actorSpriteComps10092 == nil then
				arg_512_1.var_.actorSpriteComps10092 = var_515_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_515_17 = 2

			if var_515_16 <= arg_512_1.time_ and arg_512_1.time_ < var_515_16 + var_515_17 and not isNil(var_515_15) then
				local var_515_18 = (arg_512_1.time_ - var_515_16) / var_515_17

				if arg_512_1.var_.actorSpriteComps10092 then
					for iter_515_5, iter_515_6 in pairs(arg_512_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_515_6 then
							if arg_512_1.isInRecall_ then
								local var_515_19 = Mathf.Lerp(iter_515_6.color.r, arg_512_1.hightColor1.r, var_515_18)
								local var_515_20 = Mathf.Lerp(iter_515_6.color.g, arg_512_1.hightColor1.g, var_515_18)
								local var_515_21 = Mathf.Lerp(iter_515_6.color.b, arg_512_1.hightColor1.b, var_515_18)

								iter_515_6.color = Color.New(var_515_19, var_515_20, var_515_21)
							else
								local var_515_22 = Mathf.Lerp(iter_515_6.color.r, 1, var_515_18)

								iter_515_6.color = Color.New(var_515_22, var_515_22, var_515_22)
							end
						end
					end
				end
			end

			if arg_512_1.time_ >= var_515_16 + var_515_17 and arg_512_1.time_ < var_515_16 + var_515_17 + arg_515_0 and not isNil(var_515_15) and arg_512_1.var_.actorSpriteComps10092 then
				for iter_515_7, iter_515_8 in pairs(arg_512_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_515_8 then
						if arg_512_1.isInRecall_ then
							iter_515_8.color = arg_512_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_515_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_512_1.var_.actorSpriteComps10092 = nil
			end

			local var_515_23 = 0
			local var_515_24 = 0.725

			if var_515_23 < arg_512_1.time_ and arg_512_1.time_ <= var_515_23 + arg_515_0 then
				arg_512_1.talkMaxDuration = 0
				arg_512_1.dialogCg_.alpha = 1

				arg_512_1.dialog_:SetActive(true)
				SetActive(arg_512_1.leftNameGo_, true)

				local var_515_25 = arg_512_1:FormatText(StoryNameCfg[996].name)

				arg_512_1.leftNameTxt_.text = var_515_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_512_1.leftNameTxt_.transform)

				arg_512_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_512_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_512_1:RecordName(arg_512_1.leftNameTxt_.text)
				SetActive(arg_512_1.iconTrs_.gameObject, false)
				arg_512_1.callingController_:SetSelectedState("normal")

				local var_515_26 = arg_512_1:GetWordFromCfg(413011125)
				local var_515_27 = arg_512_1:FormatText(var_515_26.content)

				arg_512_1.text_.text = var_515_27

				LuaForUtil.ClearLinePrefixSymbol(arg_512_1.text_)

				local var_515_28 = 29
				local var_515_29 = utf8.len(var_515_27)
				local var_515_30 = var_515_28 <= 0 and var_515_24 or var_515_24 * (var_515_29 / var_515_28)

				if var_515_30 > 0 and var_515_24 < var_515_30 then
					arg_512_1.talkMaxDuration = var_515_30

					if var_515_30 + var_515_23 > arg_512_1.duration_ then
						arg_512_1.duration_ = var_515_30 + var_515_23
					end
				end

				arg_512_1.text_.text = var_515_27
				arg_512_1.typewritter.percent = 0

				arg_512_1.typewritter:SetDirty()
				arg_512_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011125", "story_v_out_413011.awb") ~= 0 then
					local var_515_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011125", "story_v_out_413011.awb") / 1000

					if var_515_31 + var_515_23 > arg_512_1.duration_ then
						arg_512_1.duration_ = var_515_31 + var_515_23
					end

					if var_515_26.prefab_name ~= "" and arg_512_1.actors_[var_515_26.prefab_name] ~= nil then
						local var_515_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_512_1.actors_[var_515_26.prefab_name].transform, "story_v_out_413011", "413011125", "story_v_out_413011.awb")

						arg_512_1:RecordAudio("413011125", var_515_32)
						arg_512_1:RecordAudio("413011125", var_515_32)
					else
						arg_512_1:AudioAction("play", "voice", "story_v_out_413011", "413011125", "story_v_out_413011.awb")
					end

					arg_512_1:RecordHistoryTalkVoice("story_v_out_413011", "413011125", "story_v_out_413011.awb")
				end

				arg_512_1:RecordContent(arg_512_1.text_.text)
			end

			local var_515_33 = math.max(var_515_24, arg_512_1.talkMaxDuration)

			if var_515_23 <= arg_512_1.time_ and arg_512_1.time_ < var_515_23 + var_515_33 then
				arg_512_1.typewritter.percent = (arg_512_1.time_ - var_515_23) / var_515_33

				arg_512_1.typewritter:SetDirty()
			end

			if arg_512_1.time_ >= var_515_23 + var_515_33 and arg_512_1.time_ < var_515_23 + var_515_33 + arg_515_0 then
				arg_512_1.typewritter.percent = 1

				arg_512_1.typewritter:SetDirty()
				arg_512_1:ShowNextGo(true)
			end
		end
	end,
	Play413011126 = function(arg_516_0, arg_516_1)
		arg_516_1.time_ = 0
		arg_516_1.frameCnt_ = 0
		arg_516_1.state_ = "playing"
		arg_516_1.curTalkId_ = 413011126
		arg_516_1.duration_ = 2

		SetActive(arg_516_1.tipsGo_, false)

		function arg_516_1.onSingleLineFinish_()
			arg_516_1.onSingleLineUpdate_ = nil
			arg_516_1.onSingleLineFinish_ = nil
			arg_516_1.state_ = "waiting"
		end

		function arg_516_1.playNext_(arg_518_0)
			if arg_518_0 == 1 then
				arg_516_0:Play413011127(arg_516_1)
			end
		end

		function arg_516_1.onSingleLineUpdate_(arg_519_0)
			local var_519_0 = arg_516_1.actors_["10093"].transform
			local var_519_1 = 0

			if var_519_1 < arg_516_1.time_ and arg_516_1.time_ <= var_519_1 + arg_519_0 then
				arg_516_1.var_.moveOldPos10093 = var_519_0.localPosition
				var_519_0.localScale = Vector3.New(1, 1, 1)

				arg_516_1:CheckSpriteTmpPos("10093", 4)

				local var_519_2 = var_519_0.childCount

				for iter_519_0 = 0, var_519_2 - 1 do
					local var_519_3 = var_519_0:GetChild(iter_519_0)

					if var_519_3.name == "split_5" or not string.find(var_519_3.name, "split") then
						var_519_3.gameObject:SetActive(true)
					else
						var_519_3.gameObject:SetActive(false)
					end
				end
			end

			local var_519_4 = 0.001

			if var_519_1 <= arg_516_1.time_ and arg_516_1.time_ < var_519_1 + var_519_4 then
				local var_519_5 = (arg_516_1.time_ - var_519_1) / var_519_4
				local var_519_6 = Vector3.New(390, -345, -245)

				var_519_0.localPosition = Vector3.Lerp(arg_516_1.var_.moveOldPos10093, var_519_6, var_519_5)
			end

			if arg_516_1.time_ >= var_519_1 + var_519_4 and arg_516_1.time_ < var_519_1 + var_519_4 + arg_519_0 then
				var_519_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_519_7 = arg_516_1.actors_["10093"]
			local var_519_8 = 0

			if var_519_8 < arg_516_1.time_ and arg_516_1.time_ <= var_519_8 + arg_519_0 and not isNil(var_519_7) and arg_516_1.var_.actorSpriteComps10093 == nil then
				arg_516_1.var_.actorSpriteComps10093 = var_519_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_519_9 = 2

			if var_519_8 <= arg_516_1.time_ and arg_516_1.time_ < var_519_8 + var_519_9 and not isNil(var_519_7) then
				local var_519_10 = (arg_516_1.time_ - var_519_8) / var_519_9

				if arg_516_1.var_.actorSpriteComps10093 then
					for iter_519_1, iter_519_2 in pairs(arg_516_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_519_2 then
							if arg_516_1.isInRecall_ then
								local var_519_11 = Mathf.Lerp(iter_519_2.color.r, arg_516_1.hightColor1.r, var_519_10)
								local var_519_12 = Mathf.Lerp(iter_519_2.color.g, arg_516_1.hightColor1.g, var_519_10)
								local var_519_13 = Mathf.Lerp(iter_519_2.color.b, arg_516_1.hightColor1.b, var_519_10)

								iter_519_2.color = Color.New(var_519_11, var_519_12, var_519_13)
							else
								local var_519_14 = Mathf.Lerp(iter_519_2.color.r, 1, var_519_10)

								iter_519_2.color = Color.New(var_519_14, var_519_14, var_519_14)
							end
						end
					end
				end
			end

			if arg_516_1.time_ >= var_519_8 + var_519_9 and arg_516_1.time_ < var_519_8 + var_519_9 + arg_519_0 and not isNil(var_519_7) and arg_516_1.var_.actorSpriteComps10093 then
				for iter_519_3, iter_519_4 in pairs(arg_516_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_519_4 then
						if arg_516_1.isInRecall_ then
							iter_519_4.color = arg_516_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_519_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_516_1.var_.actorSpriteComps10093 = nil
			end

			local var_519_15 = arg_516_1.actors_["10092"]
			local var_519_16 = 0

			if var_519_16 < arg_516_1.time_ and arg_516_1.time_ <= var_519_16 + arg_519_0 and not isNil(var_519_15) and arg_516_1.var_.actorSpriteComps10092 == nil then
				arg_516_1.var_.actorSpriteComps10092 = var_519_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_519_17 = 2

			if var_519_16 <= arg_516_1.time_ and arg_516_1.time_ < var_519_16 + var_519_17 and not isNil(var_519_15) then
				local var_519_18 = (arg_516_1.time_ - var_519_16) / var_519_17

				if arg_516_1.var_.actorSpriteComps10092 then
					for iter_519_5, iter_519_6 in pairs(arg_516_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_519_6 then
							if arg_516_1.isInRecall_ then
								local var_519_19 = Mathf.Lerp(iter_519_6.color.r, arg_516_1.hightColor2.r, var_519_18)
								local var_519_20 = Mathf.Lerp(iter_519_6.color.g, arg_516_1.hightColor2.g, var_519_18)
								local var_519_21 = Mathf.Lerp(iter_519_6.color.b, arg_516_1.hightColor2.b, var_519_18)

								iter_519_6.color = Color.New(var_519_19, var_519_20, var_519_21)
							else
								local var_519_22 = Mathf.Lerp(iter_519_6.color.r, 0.5, var_519_18)

								iter_519_6.color = Color.New(var_519_22, var_519_22, var_519_22)
							end
						end
					end
				end
			end

			if arg_516_1.time_ >= var_519_16 + var_519_17 and arg_516_1.time_ < var_519_16 + var_519_17 + arg_519_0 and not isNil(var_519_15) and arg_516_1.var_.actorSpriteComps10092 then
				for iter_519_7, iter_519_8 in pairs(arg_516_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_519_8 then
						if arg_516_1.isInRecall_ then
							iter_519_8.color = arg_516_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_519_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_516_1.var_.actorSpriteComps10092 = nil
			end

			local var_519_23 = 0
			local var_519_24 = 0.075

			if var_519_23 < arg_516_1.time_ and arg_516_1.time_ <= var_519_23 + arg_519_0 then
				arg_516_1.talkMaxDuration = 0
				arg_516_1.dialogCg_.alpha = 1

				arg_516_1.dialog_:SetActive(true)
				SetActive(arg_516_1.leftNameGo_, true)

				local var_519_25 = arg_516_1:FormatText(StoryNameCfg[28].name)

				arg_516_1.leftNameTxt_.text = var_519_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_516_1.leftNameTxt_.transform)

				arg_516_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_516_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_516_1:RecordName(arg_516_1.leftNameTxt_.text)
				SetActive(arg_516_1.iconTrs_.gameObject, false)
				arg_516_1.callingController_:SetSelectedState("normal")

				local var_519_26 = arg_516_1:GetWordFromCfg(413011126)
				local var_519_27 = arg_516_1:FormatText(var_519_26.content)

				arg_516_1.text_.text = var_519_27

				LuaForUtil.ClearLinePrefixSymbol(arg_516_1.text_)

				local var_519_28 = 3
				local var_519_29 = utf8.len(var_519_27)
				local var_519_30 = var_519_28 <= 0 and var_519_24 or var_519_24 * (var_519_29 / var_519_28)

				if var_519_30 > 0 and var_519_24 < var_519_30 then
					arg_516_1.talkMaxDuration = var_519_30

					if var_519_30 + var_519_23 > arg_516_1.duration_ then
						arg_516_1.duration_ = var_519_30 + var_519_23
					end
				end

				arg_516_1.text_.text = var_519_27
				arg_516_1.typewritter.percent = 0

				arg_516_1.typewritter:SetDirty()
				arg_516_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011126", "story_v_out_413011.awb") ~= 0 then
					local var_519_31 = manager.audio:GetVoiceLength("story_v_out_413011", "413011126", "story_v_out_413011.awb") / 1000

					if var_519_31 + var_519_23 > arg_516_1.duration_ then
						arg_516_1.duration_ = var_519_31 + var_519_23
					end

					if var_519_26.prefab_name ~= "" and arg_516_1.actors_[var_519_26.prefab_name] ~= nil then
						local var_519_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_516_1.actors_[var_519_26.prefab_name].transform, "story_v_out_413011", "413011126", "story_v_out_413011.awb")

						arg_516_1:RecordAudio("413011126", var_519_32)
						arg_516_1:RecordAudio("413011126", var_519_32)
					else
						arg_516_1:AudioAction("play", "voice", "story_v_out_413011", "413011126", "story_v_out_413011.awb")
					end

					arg_516_1:RecordHistoryTalkVoice("story_v_out_413011", "413011126", "story_v_out_413011.awb")
				end

				arg_516_1:RecordContent(arg_516_1.text_.text)
			end

			local var_519_33 = math.max(var_519_24, arg_516_1.talkMaxDuration)

			if var_519_23 <= arg_516_1.time_ and arg_516_1.time_ < var_519_23 + var_519_33 then
				arg_516_1.typewritter.percent = (arg_516_1.time_ - var_519_23) / var_519_33

				arg_516_1.typewritter:SetDirty()
			end

			if arg_516_1.time_ >= var_519_23 + var_519_33 and arg_516_1.time_ < var_519_23 + var_519_33 + arg_519_0 then
				arg_516_1.typewritter.percent = 1

				arg_516_1.typewritter:SetDirty()
				arg_516_1:ShowNextGo(true)
			end
		end
	end,
	Play413011127 = function(arg_520_0, arg_520_1)
		arg_520_1.time_ = 0
		arg_520_1.frameCnt_ = 0
		arg_520_1.state_ = "playing"
		arg_520_1.curTalkId_ = 413011127
		arg_520_1.duration_ = 5

		SetActive(arg_520_1.tipsGo_, false)

		function arg_520_1.onSingleLineFinish_()
			arg_520_1.onSingleLineUpdate_ = nil
			arg_520_1.onSingleLineFinish_ = nil
			arg_520_1.state_ = "waiting"
		end

		function arg_520_1.playNext_(arg_522_0)
			if arg_522_0 == 1 then
				arg_520_0:Play413011128(arg_520_1)
			end
		end

		function arg_520_1.onSingleLineUpdate_(arg_523_0)
			local var_523_0 = arg_520_1.actors_["10092"].transform
			local var_523_1 = 0

			if var_523_1 < arg_520_1.time_ and arg_520_1.time_ <= var_523_1 + arg_523_0 then
				arg_520_1.var_.moveOldPos10092 = var_523_0.localPosition
				var_523_0.localScale = Vector3.New(1, 1, 1)

				arg_520_1:CheckSpriteTmpPos("10092", 0)

				local var_523_2 = var_523_0.childCount

				for iter_523_0 = 0, var_523_2 - 1 do
					local var_523_3 = var_523_0:GetChild(iter_523_0)

					if var_523_3.name == "" or not string.find(var_523_3.name, "split") then
						var_523_3.gameObject:SetActive(true)
					else
						var_523_3.gameObject:SetActive(false)
					end
				end
			end

			local var_523_4 = 0.001

			if var_523_1 <= arg_520_1.time_ and arg_520_1.time_ < var_523_1 + var_523_4 then
				local var_523_5 = (arg_520_1.time_ - var_523_1) / var_523_4
				local var_523_6 = Vector3.New(0, -5000, 0)

				var_523_0.localPosition = Vector3.Lerp(arg_520_1.var_.moveOldPos10092, var_523_6, var_523_5)
			end

			if arg_520_1.time_ >= var_523_1 + var_523_4 and arg_520_1.time_ < var_523_1 + var_523_4 + arg_523_0 then
				var_523_0.localPosition = Vector3.New(0, -5000, 0)
			end

			local var_523_7 = arg_520_1.actors_["10093"].transform
			local var_523_8 = 0

			if var_523_8 < arg_520_1.time_ and arg_520_1.time_ <= var_523_8 + arg_523_0 then
				arg_520_1.var_.moveOldPos10093 = var_523_7.localPosition
				var_523_7.localScale = Vector3.New(1, 1, 1)

				arg_520_1:CheckSpriteTmpPos("10093", 0)

				local var_523_9 = var_523_7.childCount

				for iter_523_1 = 0, var_523_9 - 1 do
					local var_523_10 = var_523_7:GetChild(iter_523_1)

					if var_523_10.name == "" or not string.find(var_523_10.name, "split") then
						var_523_10.gameObject:SetActive(true)
					else
						var_523_10.gameObject:SetActive(false)
					end
				end
			end

			local var_523_11 = 0.001

			if var_523_8 <= arg_520_1.time_ and arg_520_1.time_ < var_523_8 + var_523_11 then
				local var_523_12 = (arg_520_1.time_ - var_523_8) / var_523_11
				local var_523_13 = Vector3.New(-1500, -350, -180)

				var_523_7.localPosition = Vector3.Lerp(arg_520_1.var_.moveOldPos10093, var_523_13, var_523_12)
			end

			if arg_520_1.time_ >= var_523_8 + var_523_11 and arg_520_1.time_ < var_523_8 + var_523_11 + arg_523_0 then
				var_523_7.localPosition = Vector3.New(-1500, -350, -180)
			end

			local var_523_14 = arg_520_1.actors_["10092"]
			local var_523_15 = 0

			if var_523_15 < arg_520_1.time_ and arg_520_1.time_ <= var_523_15 + arg_523_0 and not isNil(var_523_14) and arg_520_1.var_.actorSpriteComps10092 == nil then
				arg_520_1.var_.actorSpriteComps10092 = var_523_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_523_16 = 2

			if var_523_15 <= arg_520_1.time_ and arg_520_1.time_ < var_523_15 + var_523_16 and not isNil(var_523_14) then
				local var_523_17 = (arg_520_1.time_ - var_523_15) / var_523_16

				if arg_520_1.var_.actorSpriteComps10092 then
					for iter_523_2, iter_523_3 in pairs(arg_520_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_523_3 then
							if arg_520_1.isInRecall_ then
								local var_523_18 = Mathf.Lerp(iter_523_3.color.r, arg_520_1.hightColor2.r, var_523_17)
								local var_523_19 = Mathf.Lerp(iter_523_3.color.g, arg_520_1.hightColor2.g, var_523_17)
								local var_523_20 = Mathf.Lerp(iter_523_3.color.b, arg_520_1.hightColor2.b, var_523_17)

								iter_523_3.color = Color.New(var_523_18, var_523_19, var_523_20)
							else
								local var_523_21 = Mathf.Lerp(iter_523_3.color.r, 0.5, var_523_17)

								iter_523_3.color = Color.New(var_523_21, var_523_21, var_523_21)
							end
						end
					end
				end
			end

			if arg_520_1.time_ >= var_523_15 + var_523_16 and arg_520_1.time_ < var_523_15 + var_523_16 + arg_523_0 and not isNil(var_523_14) and arg_520_1.var_.actorSpriteComps10092 then
				for iter_523_4, iter_523_5 in pairs(arg_520_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_523_5 then
						if arg_520_1.isInRecall_ then
							iter_523_5.color = arg_520_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_523_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_520_1.var_.actorSpriteComps10092 = nil
			end

			local var_523_22 = arg_520_1.actors_["10093"]
			local var_523_23 = 0

			if var_523_23 < arg_520_1.time_ and arg_520_1.time_ <= var_523_23 + arg_523_0 and not isNil(var_523_22) and arg_520_1.var_.actorSpriteComps10093 == nil then
				arg_520_1.var_.actorSpriteComps10093 = var_523_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_523_24 = 2

			if var_523_23 <= arg_520_1.time_ and arg_520_1.time_ < var_523_23 + var_523_24 and not isNil(var_523_22) then
				local var_523_25 = (arg_520_1.time_ - var_523_23) / var_523_24

				if arg_520_1.var_.actorSpriteComps10093 then
					for iter_523_6, iter_523_7 in pairs(arg_520_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_523_7 then
							if arg_520_1.isInRecall_ then
								local var_523_26 = Mathf.Lerp(iter_523_7.color.r, arg_520_1.hightColor2.r, var_523_25)
								local var_523_27 = Mathf.Lerp(iter_523_7.color.g, arg_520_1.hightColor2.g, var_523_25)
								local var_523_28 = Mathf.Lerp(iter_523_7.color.b, arg_520_1.hightColor2.b, var_523_25)

								iter_523_7.color = Color.New(var_523_26, var_523_27, var_523_28)
							else
								local var_523_29 = Mathf.Lerp(iter_523_7.color.r, 0.5, var_523_25)

								iter_523_7.color = Color.New(var_523_29, var_523_29, var_523_29)
							end
						end
					end
				end
			end

			if arg_520_1.time_ >= var_523_23 + var_523_24 and arg_520_1.time_ < var_523_23 + var_523_24 + arg_523_0 and not isNil(var_523_22) and arg_520_1.var_.actorSpriteComps10093 then
				for iter_523_8, iter_523_9 in pairs(arg_520_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_523_9 then
						if arg_520_1.isInRecall_ then
							iter_523_9.color = arg_520_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_523_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_520_1.var_.actorSpriteComps10093 = nil
			end

			local var_523_30 = 0
			local var_523_31 = 1.4

			if var_523_30 < arg_520_1.time_ and arg_520_1.time_ <= var_523_30 + arg_523_0 then
				arg_520_1.talkMaxDuration = 0
				arg_520_1.dialogCg_.alpha = 1

				arg_520_1.dialog_:SetActive(true)
				SetActive(arg_520_1.leftNameGo_, false)

				arg_520_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_520_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_520_1:RecordName(arg_520_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_520_1.iconTrs_.gameObject, false)
				arg_520_1.callingController_:SetSelectedState("normal")

				local var_523_32 = arg_520_1:GetWordFromCfg(413011127)
				local var_523_33 = arg_520_1:FormatText(var_523_32.content)

				arg_520_1.text_.text = var_523_33

				LuaForUtil.ClearLinePrefixSymbol(arg_520_1.text_)

				local var_523_34 = 56
				local var_523_35 = utf8.len(var_523_33)
				local var_523_36 = var_523_34 <= 0 and var_523_31 or var_523_31 * (var_523_35 / var_523_34)

				if var_523_36 > 0 and var_523_31 < var_523_36 then
					arg_520_1.talkMaxDuration = var_523_36

					if var_523_36 + var_523_30 > arg_520_1.duration_ then
						arg_520_1.duration_ = var_523_36 + var_523_30
					end
				end

				arg_520_1.text_.text = var_523_33
				arg_520_1.typewritter.percent = 0

				arg_520_1.typewritter:SetDirty()
				arg_520_1:ShowNextGo(false)
				arg_520_1:RecordContent(arg_520_1.text_.text)
			end

			local var_523_37 = math.max(var_523_31, arg_520_1.talkMaxDuration)

			if var_523_30 <= arg_520_1.time_ and arg_520_1.time_ < var_523_30 + var_523_37 then
				arg_520_1.typewritter.percent = (arg_520_1.time_ - var_523_30) / var_523_37

				arg_520_1.typewritter:SetDirty()
			end

			if arg_520_1.time_ >= var_523_30 + var_523_37 and arg_520_1.time_ < var_523_30 + var_523_37 + arg_523_0 then
				arg_520_1.typewritter.percent = 1

				arg_520_1.typewritter:SetDirty()
				arg_520_1:ShowNextGo(true)
			end
		end
	end,
	Play413011128 = function(arg_524_0, arg_524_1)
		arg_524_1.time_ = 0
		arg_524_1.frameCnt_ = 0
		arg_524_1.state_ = "playing"
		arg_524_1.curTalkId_ = 413011128
		arg_524_1.duration_ = 6

		SetActive(arg_524_1.tipsGo_, false)

		function arg_524_1.onSingleLineFinish_()
			arg_524_1.onSingleLineUpdate_ = nil
			arg_524_1.onSingleLineFinish_ = nil
			arg_524_1.state_ = "waiting"
		end

		function arg_524_1.playNext_(arg_526_0)
			if arg_526_0 == 1 then
				arg_524_0:Play413011129(arg_524_1)
			end
		end

		function arg_524_1.onSingleLineUpdate_(arg_527_0)
			local var_527_0 = manager.ui.mainCamera.transform
			local var_527_1 = 0

			if var_527_1 < arg_524_1.time_ and arg_524_1.time_ <= var_527_1 + arg_527_0 then
				arg_524_1.var_.shakeOldPos = var_527_0.localPosition
			end

			local var_527_2 = 0.6

			if var_527_1 <= arg_524_1.time_ and arg_524_1.time_ < var_527_1 + var_527_2 then
				local var_527_3 = (arg_524_1.time_ - var_527_1) / 0.066
				local var_527_4, var_527_5 = math.modf(var_527_3)

				var_527_0.localPosition = Vector3.New(var_527_5 * 0.13, var_527_5 * 0.13, var_527_5 * 0.13) + arg_524_1.var_.shakeOldPos
			end

			if arg_524_1.time_ >= var_527_1 + var_527_2 and arg_524_1.time_ < var_527_1 + var_527_2 + arg_527_0 then
				var_527_0.localPosition = arg_524_1.var_.shakeOldPos
			end

			local var_527_6 = 0

			if var_527_6 < arg_524_1.time_ and arg_524_1.time_ <= var_527_6 + arg_527_0 then
				arg_524_1.allBtn_.enabled = false
			end

			local var_527_7 = 0.6

			if arg_524_1.time_ >= var_527_6 + var_527_7 and arg_524_1.time_ < var_527_6 + var_527_7 + arg_527_0 then
				arg_524_1.allBtn_.enabled = true
			end

			local var_527_8 = 0.0666666666666667
			local var_527_9 = 1

			if var_527_8 < arg_524_1.time_ and arg_524_1.time_ <= var_527_8 + arg_527_0 then
				local var_527_10 = "play"
				local var_527_11 = "effect"

				arg_524_1:AudioAction(var_527_10, var_527_11, "se_story_120_04", "se_story_120_04_porcelain_break", "")
			end

			if arg_524_1.frameCnt_ <= 1 then
				arg_524_1.dialog_:SetActive(false)
			end

			local var_527_12 = 1
			local var_527_13 = 1.55

			if var_527_12 < arg_524_1.time_ and arg_524_1.time_ <= var_527_12 + arg_527_0 then
				arg_524_1.talkMaxDuration = 0

				arg_524_1.dialog_:SetActive(true)

				local var_527_14 = LeanTween.value(arg_524_1.dialog_, 0, 1, 0.3)

				var_527_14:setOnUpdate(LuaHelper.FloatAction(function(arg_528_0)
					arg_524_1.dialogCg_.alpha = arg_528_0
				end))
				var_527_14:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_524_1.dialog_)
					var_527_14:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_524_1.duration_ = arg_524_1.duration_ + 0.3

				SetActive(arg_524_1.leftNameGo_, false)

				arg_524_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_524_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_524_1:RecordName(arg_524_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_524_1.iconTrs_.gameObject, false)
				arg_524_1.callingController_:SetSelectedState("normal")

				local var_527_15 = arg_524_1:GetWordFromCfg(413011128)
				local var_527_16 = arg_524_1:FormatText(var_527_15.content)

				arg_524_1.text_.text = var_527_16

				LuaForUtil.ClearLinePrefixSymbol(arg_524_1.text_)

				local var_527_17 = 62
				local var_527_18 = utf8.len(var_527_16)
				local var_527_19 = var_527_17 <= 0 and var_527_13 or var_527_13 * (var_527_18 / var_527_17)

				if var_527_19 > 0 and var_527_13 < var_527_19 then
					arg_524_1.talkMaxDuration = var_527_19
					var_527_12 = var_527_12 + 0.3

					if var_527_19 + var_527_12 > arg_524_1.duration_ then
						arg_524_1.duration_ = var_527_19 + var_527_12
					end
				end

				arg_524_1.text_.text = var_527_16
				arg_524_1.typewritter.percent = 0

				arg_524_1.typewritter:SetDirty()
				arg_524_1:ShowNextGo(false)
				arg_524_1:RecordContent(arg_524_1.text_.text)
			end

			local var_527_20 = var_527_12 + 0.3
			local var_527_21 = math.max(var_527_13, arg_524_1.talkMaxDuration)

			if var_527_20 <= arg_524_1.time_ and arg_524_1.time_ < var_527_20 + var_527_21 then
				arg_524_1.typewritter.percent = (arg_524_1.time_ - var_527_20) / var_527_21

				arg_524_1.typewritter:SetDirty()
			end

			if arg_524_1.time_ >= var_527_20 + var_527_21 and arg_524_1.time_ < var_527_20 + var_527_21 + arg_527_0 then
				arg_524_1.typewritter.percent = 1

				arg_524_1.typewritter:SetDirty()
				arg_524_1:ShowNextGo(true)
			end
		end
	end,
	Play413011129 = function(arg_530_0, arg_530_1)
		arg_530_1.time_ = 0
		arg_530_1.frameCnt_ = 0
		arg_530_1.state_ = "playing"
		arg_530_1.curTalkId_ = 413011129
		arg_530_1.duration_ = 9.73

		local var_530_0 = {
			zh = 6.233,
			ja = 9.733
		}
		local var_530_1 = manager.audio:GetLocalizationFlag()

		if var_530_0[var_530_1] ~= nil then
			arg_530_1.duration_ = var_530_0[var_530_1]
		end

		SetActive(arg_530_1.tipsGo_, false)

		function arg_530_1.onSingleLineFinish_()
			arg_530_1.onSingleLineUpdate_ = nil
			arg_530_1.onSingleLineFinish_ = nil
			arg_530_1.state_ = "waiting"
		end

		function arg_530_1.playNext_(arg_532_0)
			if arg_532_0 == 1 then
				arg_530_0:Play413011130(arg_530_1)
			end
		end

		function arg_530_1.onSingleLineUpdate_(arg_533_0)
			local var_533_0 = arg_530_1.actors_["10092"].transform
			local var_533_1 = 0

			if var_533_1 < arg_530_1.time_ and arg_530_1.time_ <= var_533_1 + arg_533_0 then
				arg_530_1.var_.moveOldPos10092 = var_533_0.localPosition
				var_533_0.localScale = Vector3.New(1, 1, 1)

				arg_530_1:CheckSpriteTmpPos("10092", 3)

				local var_533_2 = var_533_0.childCount

				for iter_533_0 = 0, var_533_2 - 1 do
					local var_533_3 = var_533_0:GetChild(iter_533_0)

					if var_533_3.name == "split_2" or not string.find(var_533_3.name, "split") then
						var_533_3.gameObject:SetActive(true)
					else
						var_533_3.gameObject:SetActive(false)
					end
				end
			end

			local var_533_4 = 0.001

			if var_533_1 <= arg_530_1.time_ and arg_530_1.time_ < var_533_1 + var_533_4 then
				local var_533_5 = (arg_530_1.time_ - var_533_1) / var_533_4
				local var_533_6 = Vector3.New(0, -300, -295)

				var_533_0.localPosition = Vector3.Lerp(arg_530_1.var_.moveOldPos10092, var_533_6, var_533_5)
			end

			if arg_530_1.time_ >= var_533_1 + var_533_4 and arg_530_1.time_ < var_533_1 + var_533_4 + arg_533_0 then
				var_533_0.localPosition = Vector3.New(0, -300, -295)
			end

			local var_533_7 = arg_530_1.actors_["10092"]
			local var_533_8 = 0

			if var_533_8 < arg_530_1.time_ and arg_530_1.time_ <= var_533_8 + arg_533_0 and not isNil(var_533_7) and arg_530_1.var_.actorSpriteComps10092 == nil then
				arg_530_1.var_.actorSpriteComps10092 = var_533_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_533_9 = 2

			if var_533_8 <= arg_530_1.time_ and arg_530_1.time_ < var_533_8 + var_533_9 and not isNil(var_533_7) then
				local var_533_10 = (arg_530_1.time_ - var_533_8) / var_533_9

				if arg_530_1.var_.actorSpriteComps10092 then
					for iter_533_1, iter_533_2 in pairs(arg_530_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_533_2 then
							if arg_530_1.isInRecall_ then
								local var_533_11 = Mathf.Lerp(iter_533_2.color.r, arg_530_1.hightColor1.r, var_533_10)
								local var_533_12 = Mathf.Lerp(iter_533_2.color.g, arg_530_1.hightColor1.g, var_533_10)
								local var_533_13 = Mathf.Lerp(iter_533_2.color.b, arg_530_1.hightColor1.b, var_533_10)

								iter_533_2.color = Color.New(var_533_11, var_533_12, var_533_13)
							else
								local var_533_14 = Mathf.Lerp(iter_533_2.color.r, 1, var_533_10)

								iter_533_2.color = Color.New(var_533_14, var_533_14, var_533_14)
							end
						end
					end
				end
			end

			if arg_530_1.time_ >= var_533_8 + var_533_9 and arg_530_1.time_ < var_533_8 + var_533_9 + arg_533_0 and not isNil(var_533_7) and arg_530_1.var_.actorSpriteComps10092 then
				for iter_533_3, iter_533_4 in pairs(arg_530_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_533_4 then
						if arg_530_1.isInRecall_ then
							iter_533_4.color = arg_530_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_533_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_530_1.var_.actorSpriteComps10092 = nil
			end

			local var_533_15 = 0
			local var_533_16 = 0.55

			if var_533_15 < arg_530_1.time_ and arg_530_1.time_ <= var_533_15 + arg_533_0 then
				arg_530_1.talkMaxDuration = 0
				arg_530_1.dialogCg_.alpha = 1

				arg_530_1.dialog_:SetActive(true)
				SetActive(arg_530_1.leftNameGo_, true)

				local var_533_17 = arg_530_1:FormatText(StoryNameCfg[996].name)

				arg_530_1.leftNameTxt_.text = var_533_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_530_1.leftNameTxt_.transform)

				arg_530_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_530_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_530_1:RecordName(arg_530_1.leftNameTxt_.text)
				SetActive(arg_530_1.iconTrs_.gameObject, false)
				arg_530_1.callingController_:SetSelectedState("normal")

				local var_533_18 = arg_530_1:GetWordFromCfg(413011129)
				local var_533_19 = arg_530_1:FormatText(var_533_18.content)

				arg_530_1.text_.text = var_533_19

				LuaForUtil.ClearLinePrefixSymbol(arg_530_1.text_)

				local var_533_20 = 22
				local var_533_21 = utf8.len(var_533_19)
				local var_533_22 = var_533_20 <= 0 and var_533_16 or var_533_16 * (var_533_21 / var_533_20)

				if var_533_22 > 0 and var_533_16 < var_533_22 then
					arg_530_1.talkMaxDuration = var_533_22

					if var_533_22 + var_533_15 > arg_530_1.duration_ then
						arg_530_1.duration_ = var_533_22 + var_533_15
					end
				end

				arg_530_1.text_.text = var_533_19
				arg_530_1.typewritter.percent = 0

				arg_530_1.typewritter:SetDirty()
				arg_530_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011129", "story_v_out_413011.awb") ~= 0 then
					local var_533_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011129", "story_v_out_413011.awb") / 1000

					if var_533_23 + var_533_15 > arg_530_1.duration_ then
						arg_530_1.duration_ = var_533_23 + var_533_15
					end

					if var_533_18.prefab_name ~= "" and arg_530_1.actors_[var_533_18.prefab_name] ~= nil then
						local var_533_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_530_1.actors_[var_533_18.prefab_name].transform, "story_v_out_413011", "413011129", "story_v_out_413011.awb")

						arg_530_1:RecordAudio("413011129", var_533_24)
						arg_530_1:RecordAudio("413011129", var_533_24)
					else
						arg_530_1:AudioAction("play", "voice", "story_v_out_413011", "413011129", "story_v_out_413011.awb")
					end

					arg_530_1:RecordHistoryTalkVoice("story_v_out_413011", "413011129", "story_v_out_413011.awb")
				end

				arg_530_1:RecordContent(arg_530_1.text_.text)
			end

			local var_533_25 = math.max(var_533_16, arg_530_1.talkMaxDuration)

			if var_533_15 <= arg_530_1.time_ and arg_530_1.time_ < var_533_15 + var_533_25 then
				arg_530_1.typewritter.percent = (arg_530_1.time_ - var_533_15) / var_533_25

				arg_530_1.typewritter:SetDirty()
			end

			if arg_530_1.time_ >= var_533_15 + var_533_25 and arg_530_1.time_ < var_533_15 + var_533_25 + arg_533_0 then
				arg_530_1.typewritter.percent = 1

				arg_530_1.typewritter:SetDirty()
				arg_530_1:ShowNextGo(true)
			end
		end
	end,
	Play413011130 = function(arg_534_0, arg_534_1)
		arg_534_1.time_ = 0
		arg_534_1.frameCnt_ = 0
		arg_534_1.state_ = "playing"
		arg_534_1.curTalkId_ = 413011130
		arg_534_1.duration_ = 4.33

		local var_534_0 = {
			zh = 4.1,
			ja = 4.333
		}
		local var_534_1 = manager.audio:GetLocalizationFlag()

		if var_534_0[var_534_1] ~= nil then
			arg_534_1.duration_ = var_534_0[var_534_1]
		end

		SetActive(arg_534_1.tipsGo_, false)

		function arg_534_1.onSingleLineFinish_()
			arg_534_1.onSingleLineUpdate_ = nil
			arg_534_1.onSingleLineFinish_ = nil
			arg_534_1.state_ = "waiting"
		end

		function arg_534_1.playNext_(arg_536_0)
			if arg_536_0 == 1 then
				arg_534_0:Play413011131(arg_534_1)
			end
		end

		function arg_534_1.onSingleLineUpdate_(arg_537_0)
			local var_537_0 = arg_534_1.actors_["10092"].transform
			local var_537_1 = 0

			if var_537_1 < arg_534_1.time_ and arg_534_1.time_ <= var_537_1 + arg_537_0 then
				arg_534_1.var_.moveOldPos10092 = var_537_0.localPosition
				var_537_0.localScale = Vector3.New(1, 1, 1)

				arg_534_1:CheckSpriteTmpPos("10092", 3)

				local var_537_2 = var_537_0.childCount

				for iter_537_0 = 0, var_537_2 - 1 do
					local var_537_3 = var_537_0:GetChild(iter_537_0)

					if var_537_3.name == "split_6" or not string.find(var_537_3.name, "split") then
						var_537_3.gameObject:SetActive(true)
					else
						var_537_3.gameObject:SetActive(false)
					end
				end
			end

			local var_537_4 = 0.001

			if var_537_1 <= arg_534_1.time_ and arg_534_1.time_ < var_537_1 + var_537_4 then
				local var_537_5 = (arg_534_1.time_ - var_537_1) / var_537_4
				local var_537_6 = Vector3.New(0, -300, -295)

				var_537_0.localPosition = Vector3.Lerp(arg_534_1.var_.moveOldPos10092, var_537_6, var_537_5)
			end

			if arg_534_1.time_ >= var_537_1 + var_537_4 and arg_534_1.time_ < var_537_1 + var_537_4 + arg_537_0 then
				var_537_0.localPosition = Vector3.New(0, -300, -295)
			end

			local var_537_7 = arg_534_1.actors_["10092"]
			local var_537_8 = 0

			if var_537_8 < arg_534_1.time_ and arg_534_1.time_ <= var_537_8 + arg_537_0 and not isNil(var_537_7) and arg_534_1.var_.actorSpriteComps10092 == nil then
				arg_534_1.var_.actorSpriteComps10092 = var_537_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_537_9 = 2

			if var_537_8 <= arg_534_1.time_ and arg_534_1.time_ < var_537_8 + var_537_9 and not isNil(var_537_7) then
				local var_537_10 = (arg_534_1.time_ - var_537_8) / var_537_9

				if arg_534_1.var_.actorSpriteComps10092 then
					for iter_537_1, iter_537_2 in pairs(arg_534_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_537_2 then
							if arg_534_1.isInRecall_ then
								local var_537_11 = Mathf.Lerp(iter_537_2.color.r, arg_534_1.hightColor1.r, var_537_10)
								local var_537_12 = Mathf.Lerp(iter_537_2.color.g, arg_534_1.hightColor1.g, var_537_10)
								local var_537_13 = Mathf.Lerp(iter_537_2.color.b, arg_534_1.hightColor1.b, var_537_10)

								iter_537_2.color = Color.New(var_537_11, var_537_12, var_537_13)
							else
								local var_537_14 = Mathf.Lerp(iter_537_2.color.r, 1, var_537_10)

								iter_537_2.color = Color.New(var_537_14, var_537_14, var_537_14)
							end
						end
					end
				end
			end

			if arg_534_1.time_ >= var_537_8 + var_537_9 and arg_534_1.time_ < var_537_8 + var_537_9 + arg_537_0 and not isNil(var_537_7) and arg_534_1.var_.actorSpriteComps10092 then
				for iter_537_3, iter_537_4 in pairs(arg_534_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_537_4 then
						if arg_534_1.isInRecall_ then
							iter_537_4.color = arg_534_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_537_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_534_1.var_.actorSpriteComps10092 = nil
			end

			local var_537_15 = 0
			local var_537_16 = 0.5

			if var_537_15 < arg_534_1.time_ and arg_534_1.time_ <= var_537_15 + arg_537_0 then
				arg_534_1.talkMaxDuration = 0
				arg_534_1.dialogCg_.alpha = 1

				arg_534_1.dialog_:SetActive(true)
				SetActive(arg_534_1.leftNameGo_, true)

				local var_537_17 = arg_534_1:FormatText(StoryNameCfg[996].name)

				arg_534_1.leftNameTxt_.text = var_537_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_534_1.leftNameTxt_.transform)

				arg_534_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_534_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_534_1:RecordName(arg_534_1.leftNameTxt_.text)
				SetActive(arg_534_1.iconTrs_.gameObject, false)
				arg_534_1.callingController_:SetSelectedState("normal")

				local var_537_18 = arg_534_1:GetWordFromCfg(413011130)
				local var_537_19 = arg_534_1:FormatText(var_537_18.content)

				arg_534_1.text_.text = var_537_19

				LuaForUtil.ClearLinePrefixSymbol(arg_534_1.text_)

				local var_537_20 = 20
				local var_537_21 = utf8.len(var_537_19)
				local var_537_22 = var_537_20 <= 0 and var_537_16 or var_537_16 * (var_537_21 / var_537_20)

				if var_537_22 > 0 and var_537_16 < var_537_22 then
					arg_534_1.talkMaxDuration = var_537_22

					if var_537_22 + var_537_15 > arg_534_1.duration_ then
						arg_534_1.duration_ = var_537_22 + var_537_15
					end
				end

				arg_534_1.text_.text = var_537_19
				arg_534_1.typewritter.percent = 0

				arg_534_1.typewritter:SetDirty()
				arg_534_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011130", "story_v_out_413011.awb") ~= 0 then
					local var_537_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011130", "story_v_out_413011.awb") / 1000

					if var_537_23 + var_537_15 > arg_534_1.duration_ then
						arg_534_1.duration_ = var_537_23 + var_537_15
					end

					if var_537_18.prefab_name ~= "" and arg_534_1.actors_[var_537_18.prefab_name] ~= nil then
						local var_537_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_534_1.actors_[var_537_18.prefab_name].transform, "story_v_out_413011", "413011130", "story_v_out_413011.awb")

						arg_534_1:RecordAudio("413011130", var_537_24)
						arg_534_1:RecordAudio("413011130", var_537_24)
					else
						arg_534_1:AudioAction("play", "voice", "story_v_out_413011", "413011130", "story_v_out_413011.awb")
					end

					arg_534_1:RecordHistoryTalkVoice("story_v_out_413011", "413011130", "story_v_out_413011.awb")
				end

				arg_534_1:RecordContent(arg_534_1.text_.text)
			end

			local var_537_25 = math.max(var_537_16, arg_534_1.talkMaxDuration)

			if var_537_15 <= arg_534_1.time_ and arg_534_1.time_ < var_537_15 + var_537_25 then
				arg_534_1.typewritter.percent = (arg_534_1.time_ - var_537_15) / var_537_25

				arg_534_1.typewritter:SetDirty()
			end

			if arg_534_1.time_ >= var_537_15 + var_537_25 and arg_534_1.time_ < var_537_15 + var_537_25 + arg_537_0 then
				arg_534_1.typewritter.percent = 1

				arg_534_1.typewritter:SetDirty()
				arg_534_1:ShowNextGo(true)
			end
		end
	end,
	Play413011131 = function(arg_538_0, arg_538_1)
		arg_538_1.time_ = 0
		arg_538_1.frameCnt_ = 0
		arg_538_1.state_ = "playing"
		arg_538_1.curTalkId_ = 413011131
		arg_538_1.duration_ = 5

		SetActive(arg_538_1.tipsGo_, false)

		function arg_538_1.onSingleLineFinish_()
			arg_538_1.onSingleLineUpdate_ = nil
			arg_538_1.onSingleLineFinish_ = nil
			arg_538_1.state_ = "waiting"
		end

		function arg_538_1.playNext_(arg_540_0)
			if arg_540_0 == 1 then
				arg_538_0:Play413011132(arg_538_1)
			end
		end

		function arg_538_1.onSingleLineUpdate_(arg_541_0)
			local var_541_0 = arg_538_1.actors_["10092"].transform
			local var_541_1 = 0

			if var_541_1 < arg_538_1.time_ and arg_538_1.time_ <= var_541_1 + arg_541_0 then
				arg_538_1.var_.moveOldPos10092 = var_541_0.localPosition
				var_541_0.localScale = Vector3.New(1, 1, 1)

				arg_538_1:CheckSpriteTmpPos("10092", 0)

				local var_541_2 = var_541_0.childCount

				for iter_541_0 = 0, var_541_2 - 1 do
					local var_541_3 = var_541_0:GetChild(iter_541_0)

					if var_541_3.name == "" or not string.find(var_541_3.name, "split") then
						var_541_3.gameObject:SetActive(true)
					else
						var_541_3.gameObject:SetActive(false)
					end
				end
			end

			local var_541_4 = 0.001

			if var_541_1 <= arg_538_1.time_ and arg_538_1.time_ < var_541_1 + var_541_4 then
				local var_541_5 = (arg_538_1.time_ - var_541_1) / var_541_4
				local var_541_6 = Vector3.New(0, -5000, 0)

				var_541_0.localPosition = Vector3.Lerp(arg_538_1.var_.moveOldPos10092, var_541_6, var_541_5)
			end

			if arg_538_1.time_ >= var_541_1 + var_541_4 and arg_538_1.time_ < var_541_1 + var_541_4 + arg_541_0 then
				var_541_0.localPosition = Vector3.New(0, -5000, 0)
			end

			local var_541_7 = arg_538_1.actors_["10092"]
			local var_541_8 = 0

			if var_541_8 < arg_538_1.time_ and arg_538_1.time_ <= var_541_8 + arg_541_0 and not isNil(var_541_7) and arg_538_1.var_.actorSpriteComps10092 == nil then
				arg_538_1.var_.actorSpriteComps10092 = var_541_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_541_9 = 2

			if var_541_8 <= arg_538_1.time_ and arg_538_1.time_ < var_541_8 + var_541_9 and not isNil(var_541_7) then
				local var_541_10 = (arg_538_1.time_ - var_541_8) / var_541_9

				if arg_538_1.var_.actorSpriteComps10092 then
					for iter_541_1, iter_541_2 in pairs(arg_538_1.var_.actorSpriteComps10092:ToTable()) do
						if iter_541_2 then
							if arg_538_1.isInRecall_ then
								local var_541_11 = Mathf.Lerp(iter_541_2.color.r, arg_538_1.hightColor2.r, var_541_10)
								local var_541_12 = Mathf.Lerp(iter_541_2.color.g, arg_538_1.hightColor2.g, var_541_10)
								local var_541_13 = Mathf.Lerp(iter_541_2.color.b, arg_538_1.hightColor2.b, var_541_10)

								iter_541_2.color = Color.New(var_541_11, var_541_12, var_541_13)
							else
								local var_541_14 = Mathf.Lerp(iter_541_2.color.r, 0.5, var_541_10)

								iter_541_2.color = Color.New(var_541_14, var_541_14, var_541_14)
							end
						end
					end
				end
			end

			if arg_538_1.time_ >= var_541_8 + var_541_9 and arg_538_1.time_ < var_541_8 + var_541_9 + arg_541_0 and not isNil(var_541_7) and arg_538_1.var_.actorSpriteComps10092 then
				for iter_541_3, iter_541_4 in pairs(arg_538_1.var_.actorSpriteComps10092:ToTable()) do
					if iter_541_4 then
						if arg_538_1.isInRecall_ then
							iter_541_4.color = arg_538_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_541_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_538_1.var_.actorSpriteComps10092 = nil
			end

			local var_541_15 = 0
			local var_541_16 = 1.05

			if var_541_15 < arg_538_1.time_ and arg_538_1.time_ <= var_541_15 + arg_541_0 then
				arg_538_1.talkMaxDuration = 0
				arg_538_1.dialogCg_.alpha = 1

				arg_538_1.dialog_:SetActive(true)
				SetActive(arg_538_1.leftNameGo_, false)

				arg_538_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_538_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_538_1:RecordName(arg_538_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_538_1.iconTrs_.gameObject, false)
				arg_538_1.callingController_:SetSelectedState("normal")

				local var_541_17 = arg_538_1:GetWordFromCfg(413011131)
				local var_541_18 = arg_538_1:FormatText(var_541_17.content)

				arg_538_1.text_.text = var_541_18

				LuaForUtil.ClearLinePrefixSymbol(arg_538_1.text_)

				local var_541_19 = 42
				local var_541_20 = utf8.len(var_541_18)
				local var_541_21 = var_541_19 <= 0 and var_541_16 or var_541_16 * (var_541_20 / var_541_19)

				if var_541_21 > 0 and var_541_16 < var_541_21 then
					arg_538_1.talkMaxDuration = var_541_21

					if var_541_21 + var_541_15 > arg_538_1.duration_ then
						arg_538_1.duration_ = var_541_21 + var_541_15
					end
				end

				arg_538_1.text_.text = var_541_18
				arg_538_1.typewritter.percent = 0

				arg_538_1.typewritter:SetDirty()
				arg_538_1:ShowNextGo(false)
				arg_538_1:RecordContent(arg_538_1.text_.text)
			end

			local var_541_22 = math.max(var_541_16, arg_538_1.talkMaxDuration)

			if var_541_15 <= arg_538_1.time_ and arg_538_1.time_ < var_541_15 + var_541_22 then
				arg_538_1.typewritter.percent = (arg_538_1.time_ - var_541_15) / var_541_22

				arg_538_1.typewritter:SetDirty()
			end

			if arg_538_1.time_ >= var_541_15 + var_541_22 and arg_538_1.time_ < var_541_15 + var_541_22 + arg_541_0 then
				arg_538_1.typewritter.percent = 1

				arg_538_1.typewritter:SetDirty()
				arg_538_1:ShowNextGo(true)
			end
		end
	end,
	Play413011132 = function(arg_542_0, arg_542_1)
		arg_542_1.time_ = 0
		arg_542_1.frameCnt_ = 0
		arg_542_1.state_ = "playing"
		arg_542_1.curTalkId_ = 413011132
		arg_542_1.duration_ = 5

		SetActive(arg_542_1.tipsGo_, false)

		function arg_542_1.onSingleLineFinish_()
			arg_542_1.onSingleLineUpdate_ = nil
			arg_542_1.onSingleLineFinish_ = nil
			arg_542_1.state_ = "waiting"
		end

		function arg_542_1.playNext_(arg_544_0)
			if arg_544_0 == 1 then
				arg_542_0:Play413011133(arg_542_1)
			end
		end

		function arg_542_1.onSingleLineUpdate_(arg_545_0)
			local var_545_0 = 0
			local var_545_1 = 0.9

			if var_545_0 < arg_542_1.time_ and arg_542_1.time_ <= var_545_0 + arg_545_0 then
				arg_542_1.talkMaxDuration = 0
				arg_542_1.dialogCg_.alpha = 1

				arg_542_1.dialog_:SetActive(true)
				SetActive(arg_542_1.leftNameGo_, false)

				arg_542_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_542_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_542_1:RecordName(arg_542_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_542_1.iconTrs_.gameObject, false)
				arg_542_1.callingController_:SetSelectedState("normal")

				local var_545_2 = arg_542_1:GetWordFromCfg(413011132)
				local var_545_3 = arg_542_1:FormatText(var_545_2.content)

				arg_542_1.text_.text = var_545_3

				LuaForUtil.ClearLinePrefixSymbol(arg_542_1.text_)

				local var_545_4 = 36
				local var_545_5 = utf8.len(var_545_3)
				local var_545_6 = var_545_4 <= 0 and var_545_1 or var_545_1 * (var_545_5 / var_545_4)

				if var_545_6 > 0 and var_545_1 < var_545_6 then
					arg_542_1.talkMaxDuration = var_545_6

					if var_545_6 + var_545_0 > arg_542_1.duration_ then
						arg_542_1.duration_ = var_545_6 + var_545_0
					end
				end

				arg_542_1.text_.text = var_545_3
				arg_542_1.typewritter.percent = 0

				arg_542_1.typewritter:SetDirty()
				arg_542_1:ShowNextGo(false)
				arg_542_1:RecordContent(arg_542_1.text_.text)
			end

			local var_545_7 = math.max(var_545_1, arg_542_1.talkMaxDuration)

			if var_545_0 <= arg_542_1.time_ and arg_542_1.time_ < var_545_0 + var_545_7 then
				arg_542_1.typewritter.percent = (arg_542_1.time_ - var_545_0) / var_545_7

				arg_542_1.typewritter:SetDirty()
			end

			if arg_542_1.time_ >= var_545_0 + var_545_7 and arg_542_1.time_ < var_545_0 + var_545_7 + arg_545_0 then
				arg_542_1.typewritter.percent = 1

				arg_542_1.typewritter:SetDirty()
				arg_542_1:ShowNextGo(true)
			end
		end
	end,
	Play413011133 = function(arg_546_0, arg_546_1)
		arg_546_1.time_ = 0
		arg_546_1.frameCnt_ = 0
		arg_546_1.state_ = "playing"
		arg_546_1.curTalkId_ = 413011133
		arg_546_1.duration_ = 12.77

		local var_546_0 = {
			zh = 8.932999999999,
			ja = 12.765999999999
		}
		local var_546_1 = manager.audio:GetLocalizationFlag()

		if var_546_0[var_546_1] ~= nil then
			arg_546_1.duration_ = var_546_0[var_546_1]
		end

		SetActive(arg_546_1.tipsGo_, false)

		function arg_546_1.onSingleLineFinish_()
			arg_546_1.onSingleLineUpdate_ = nil
			arg_546_1.onSingleLineFinish_ = nil
			arg_546_1.state_ = "waiting"
		end

		function arg_546_1.playNext_(arg_548_0)
			if arg_548_0 == 1 then
				arg_546_0:Play413011134(arg_546_1)
			end
		end

		function arg_546_1.onSingleLineUpdate_(arg_549_0)
			local var_549_0 = 2

			if var_549_0 < arg_546_1.time_ and arg_546_1.time_ <= var_549_0 + arg_549_0 then
				local var_549_1 = manager.ui.mainCamera.transform.localPosition
				local var_549_2 = Vector3.New(0, 0, 10) + Vector3.New(var_549_1.x, var_549_1.y, 0)
				local var_549_3 = arg_546_1.bgs_.F10f

				var_549_3.transform.localPosition = var_549_2
				var_549_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_549_4 = var_549_3:GetComponent("SpriteRenderer")

				if var_549_4 and var_549_4.sprite then
					local var_549_5 = (var_549_3.transform.localPosition - var_549_1).z
					local var_549_6 = manager.ui.mainCameraCom_
					local var_549_7 = 2 * var_549_5 * Mathf.Tan(var_549_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_549_8 = var_549_7 * var_549_6.aspect
					local var_549_9 = var_549_4.sprite.bounds.size.x
					local var_549_10 = var_549_4.sprite.bounds.size.y
					local var_549_11 = var_549_8 / var_549_9
					local var_549_12 = var_549_7 / var_549_10
					local var_549_13 = var_549_12 < var_549_11 and var_549_11 or var_549_12

					var_549_3.transform.localScale = Vector3.New(var_549_13, var_549_13, 0)
				end

				for iter_549_0, iter_549_1 in pairs(arg_546_1.bgs_) do
					if iter_549_0 ~= "F10f" then
						iter_549_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_549_14 = 3.999999999999

			if var_549_14 < arg_546_1.time_ and arg_546_1.time_ <= var_549_14 + arg_549_0 then
				arg_546_1.allBtn_.enabled = false
			end

			local var_549_15 = 0.3

			if arg_546_1.time_ >= var_549_14 + var_549_15 and arg_546_1.time_ < var_549_14 + var_549_15 + arg_549_0 then
				arg_546_1.allBtn_.enabled = true
			end

			local var_549_16 = 0

			if var_549_16 < arg_546_1.time_ and arg_546_1.time_ <= var_549_16 + arg_549_0 then
				arg_546_1.mask_.enabled = true
				arg_546_1.mask_.raycastTarget = true

				arg_546_1:SetGaussion(false)
			end

			local var_549_17 = 2

			if var_549_16 <= arg_546_1.time_ and arg_546_1.time_ < var_549_16 + var_549_17 then
				local var_549_18 = (arg_546_1.time_ - var_549_16) / var_549_17
				local var_549_19 = Color.New(0, 0, 0)

				var_549_19.a = Mathf.Lerp(0, 1, var_549_18)
				arg_546_1.mask_.color = var_549_19
			end

			if arg_546_1.time_ >= var_549_16 + var_549_17 and arg_546_1.time_ < var_549_16 + var_549_17 + arg_549_0 then
				local var_549_20 = Color.New(0, 0, 0)

				var_549_20.a = 1
				arg_546_1.mask_.color = var_549_20
			end

			local var_549_21 = 2

			if var_549_21 < arg_546_1.time_ and arg_546_1.time_ <= var_549_21 + arg_549_0 then
				arg_546_1.mask_.enabled = true
				arg_546_1.mask_.raycastTarget = true

				arg_546_1:SetGaussion(false)
			end

			local var_549_22 = 2

			if var_549_21 <= arg_546_1.time_ and arg_546_1.time_ < var_549_21 + var_549_22 then
				local var_549_23 = (arg_546_1.time_ - var_549_21) / var_549_22
				local var_549_24 = Color.New(0, 0, 0)

				var_549_24.a = Mathf.Lerp(1, 0, var_549_23)
				arg_546_1.mask_.color = var_549_24
			end

			if arg_546_1.time_ >= var_549_21 + var_549_22 and arg_546_1.time_ < var_549_21 + var_549_22 + arg_549_0 then
				local var_549_25 = Color.New(0, 0, 0)
				local var_549_26 = 0

				arg_546_1.mask_.enabled = false
				var_549_25.a = var_549_26
				arg_546_1.mask_.color = var_549_25
			end

			local var_549_27 = arg_546_1.actors_["10022"].transform
			local var_549_28 = 3.8

			if var_549_28 < arg_546_1.time_ and arg_546_1.time_ <= var_549_28 + arg_549_0 then
				arg_546_1.var_.moveOldPos10022 = var_549_27.localPosition
				var_549_27.localScale = Vector3.New(1, 1, 1)

				arg_546_1:CheckSpriteTmpPos("10022", 3)

				local var_549_29 = var_549_27.childCount

				for iter_549_2 = 0, var_549_29 - 1 do
					local var_549_30 = var_549_27:GetChild(iter_549_2)

					if var_549_30.name == "split_8" or not string.find(var_549_30.name, "split") then
						var_549_30.gameObject:SetActive(true)
					else
						var_549_30.gameObject:SetActive(false)
					end
				end
			end

			local var_549_31 = 0.001

			if var_549_28 <= arg_546_1.time_ and arg_546_1.time_ < var_549_28 + var_549_31 then
				local var_549_32 = (arg_546_1.time_ - var_549_28) / var_549_31
				local var_549_33 = Vector3.New(0, -315, -320)

				var_549_27.localPosition = Vector3.Lerp(arg_546_1.var_.moveOldPos10022, var_549_33, var_549_32)
			end

			if arg_546_1.time_ >= var_549_28 + var_549_31 and arg_546_1.time_ < var_549_28 + var_549_31 + arg_549_0 then
				var_549_27.localPosition = Vector3.New(0, -315, -320)
			end

			local var_549_34 = arg_546_1.actors_["10022"]
			local var_549_35 = 3.8

			if var_549_35 < arg_546_1.time_ and arg_546_1.time_ <= var_549_35 + arg_549_0 and not isNil(var_549_34) and arg_546_1.var_.actorSpriteComps10022 == nil then
				arg_546_1.var_.actorSpriteComps10022 = var_549_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_549_36 = 0.2

			if var_549_35 <= arg_546_1.time_ and arg_546_1.time_ < var_549_35 + var_549_36 and not isNil(var_549_34) then
				local var_549_37 = (arg_546_1.time_ - var_549_35) / var_549_36

				if arg_546_1.var_.actorSpriteComps10022 then
					for iter_549_3, iter_549_4 in pairs(arg_546_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_549_4 then
							if arg_546_1.isInRecall_ then
								local var_549_38 = Mathf.Lerp(iter_549_4.color.r, arg_546_1.hightColor1.r, var_549_37)
								local var_549_39 = Mathf.Lerp(iter_549_4.color.g, arg_546_1.hightColor1.g, var_549_37)
								local var_549_40 = Mathf.Lerp(iter_549_4.color.b, arg_546_1.hightColor1.b, var_549_37)

								iter_549_4.color = Color.New(var_549_38, var_549_39, var_549_40)
							else
								local var_549_41 = Mathf.Lerp(iter_549_4.color.r, 1, var_549_37)

								iter_549_4.color = Color.New(var_549_41, var_549_41, var_549_41)
							end
						end
					end
				end
			end

			if arg_546_1.time_ >= var_549_35 + var_549_36 and arg_546_1.time_ < var_549_35 + var_549_36 + arg_549_0 and not isNil(var_549_34) and arg_546_1.var_.actorSpriteComps10022 then
				for iter_549_5, iter_549_6 in pairs(arg_546_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_549_6 then
						if arg_546_1.isInRecall_ then
							iter_549_6.color = arg_546_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_549_6.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_546_1.var_.actorSpriteComps10022 = nil
			end

			local var_549_42 = arg_546_1.actors_["10022"]
			local var_549_43 = 3.799999999999

			if var_549_43 < arg_546_1.time_ and arg_546_1.time_ <= var_549_43 + arg_549_0 then
				local var_549_44 = var_549_42:GetComponentInChildren(typeof(CanvasGroup))

				if var_549_44 then
					arg_546_1.var_.alphaOldValue10022 = var_549_44.alpha
					arg_546_1.var_.characterEffect10022 = var_549_44
				end

				arg_546_1.var_.alphaOldValue10022 = 0
			end

			local var_549_45 = 0.2

			if var_549_43 <= arg_546_1.time_ and arg_546_1.time_ < var_549_43 + var_549_45 then
				local var_549_46 = (arg_546_1.time_ - var_549_43) / var_549_45
				local var_549_47 = Mathf.Lerp(arg_546_1.var_.alphaOldValue10022, 1, var_549_46)

				if arg_546_1.var_.characterEffect10022 then
					arg_546_1.var_.characterEffect10022.alpha = var_549_47
				end
			end

			if arg_546_1.time_ >= var_549_43 + var_549_45 and arg_546_1.time_ < var_549_43 + var_549_45 + arg_549_0 and arg_546_1.var_.characterEffect10022 then
				arg_546_1.var_.characterEffect10022.alpha = 1
			end

			if arg_546_1.frameCnt_ <= 1 then
				arg_546_1.dialog_:SetActive(false)
			end

			local var_549_48 = 3.999999999999
			local var_549_49 = 0.675

			if var_549_48 < arg_546_1.time_ and arg_546_1.time_ <= var_549_48 + arg_549_0 then
				arg_546_1.talkMaxDuration = 0

				arg_546_1.dialog_:SetActive(true)

				local var_549_50 = LeanTween.value(arg_546_1.dialog_, 0, 1, 0.3)

				var_549_50:setOnUpdate(LuaHelper.FloatAction(function(arg_550_0)
					arg_546_1.dialogCg_.alpha = arg_550_0
				end))
				var_549_50:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_546_1.dialog_)
					var_549_50:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_546_1.duration_ = arg_546_1.duration_ + 0.3

				SetActive(arg_546_1.leftNameGo_, true)

				local var_549_51 = arg_546_1:FormatText(StoryNameCfg[614].name)

				arg_546_1.leftNameTxt_.text = var_549_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_546_1.leftNameTxt_.transform)

				arg_546_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_546_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_546_1:RecordName(arg_546_1.leftNameTxt_.text)
				SetActive(arg_546_1.iconTrs_.gameObject, false)
				arg_546_1.callingController_:SetSelectedState("normal")

				local var_549_52 = arg_546_1:GetWordFromCfg(413011133)
				local var_549_53 = arg_546_1:FormatText(var_549_52.content)

				arg_546_1.text_.text = var_549_53

				LuaForUtil.ClearLinePrefixSymbol(arg_546_1.text_)

				local var_549_54 = 27
				local var_549_55 = utf8.len(var_549_53)
				local var_549_56 = var_549_54 <= 0 and var_549_49 or var_549_49 * (var_549_55 / var_549_54)

				if var_549_56 > 0 and var_549_49 < var_549_56 then
					arg_546_1.talkMaxDuration = var_549_56
					var_549_48 = var_549_48 + 0.3

					if var_549_56 + var_549_48 > arg_546_1.duration_ then
						arg_546_1.duration_ = var_549_56 + var_549_48
					end
				end

				arg_546_1.text_.text = var_549_53
				arg_546_1.typewritter.percent = 0

				arg_546_1.typewritter:SetDirty()
				arg_546_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011133", "story_v_out_413011.awb") ~= 0 then
					local var_549_57 = manager.audio:GetVoiceLength("story_v_out_413011", "413011133", "story_v_out_413011.awb") / 1000

					if var_549_57 + var_549_48 > arg_546_1.duration_ then
						arg_546_1.duration_ = var_549_57 + var_549_48
					end

					if var_549_52.prefab_name ~= "" and arg_546_1.actors_[var_549_52.prefab_name] ~= nil then
						local var_549_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_546_1.actors_[var_549_52.prefab_name].transform, "story_v_out_413011", "413011133", "story_v_out_413011.awb")

						arg_546_1:RecordAudio("413011133", var_549_58)
						arg_546_1:RecordAudio("413011133", var_549_58)
					else
						arg_546_1:AudioAction("play", "voice", "story_v_out_413011", "413011133", "story_v_out_413011.awb")
					end

					arg_546_1:RecordHistoryTalkVoice("story_v_out_413011", "413011133", "story_v_out_413011.awb")
				end

				arg_546_1:RecordContent(arg_546_1.text_.text)
			end

			local var_549_59 = var_549_48 + 0.3
			local var_549_60 = math.max(var_549_49, arg_546_1.talkMaxDuration)

			if var_549_59 <= arg_546_1.time_ and arg_546_1.time_ < var_549_59 + var_549_60 then
				arg_546_1.typewritter.percent = (arg_546_1.time_ - var_549_59) / var_549_60

				arg_546_1.typewritter:SetDirty()
			end

			if arg_546_1.time_ >= var_549_59 + var_549_60 and arg_546_1.time_ < var_549_59 + var_549_60 + arg_549_0 then
				arg_546_1.typewritter.percent = 1

				arg_546_1.typewritter:SetDirty()
				arg_546_1:ShowNextGo(true)
			end
		end
	end,
	Play413011134 = function(arg_552_0, arg_552_1)
		arg_552_1.time_ = 0
		arg_552_1.frameCnt_ = 0
		arg_552_1.state_ = "playing"
		arg_552_1.curTalkId_ = 413011134
		arg_552_1.duration_ = 8.4

		local var_552_0 = {
			zh = 4.033,
			ja = 8.4
		}
		local var_552_1 = manager.audio:GetLocalizationFlag()

		if var_552_0[var_552_1] ~= nil then
			arg_552_1.duration_ = var_552_0[var_552_1]
		end

		SetActive(arg_552_1.tipsGo_, false)

		function arg_552_1.onSingleLineFinish_()
			arg_552_1.onSingleLineUpdate_ = nil
			arg_552_1.onSingleLineFinish_ = nil
			arg_552_1.state_ = "waiting"
		end

		function arg_552_1.playNext_(arg_554_0)
			if arg_554_0 == 1 then
				arg_552_0:Play413011135(arg_552_1)
			end
		end

		function arg_552_1.onSingleLineUpdate_(arg_555_0)
			local var_555_0 = 0
			local var_555_1 = 0.5

			if var_555_0 < arg_552_1.time_ and arg_552_1.time_ <= var_555_0 + arg_555_0 then
				arg_552_1.talkMaxDuration = 0
				arg_552_1.dialogCg_.alpha = 1

				arg_552_1.dialog_:SetActive(true)
				SetActive(arg_552_1.leftNameGo_, true)

				local var_555_2 = arg_552_1:FormatText(StoryNameCfg[614].name)

				arg_552_1.leftNameTxt_.text = var_555_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_552_1.leftNameTxt_.transform)

				arg_552_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_552_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_552_1:RecordName(arg_552_1.leftNameTxt_.text)
				SetActive(arg_552_1.iconTrs_.gameObject, false)
				arg_552_1.callingController_:SetSelectedState("normal")

				local var_555_3 = arg_552_1:GetWordFromCfg(413011134)
				local var_555_4 = arg_552_1:FormatText(var_555_3.content)

				arg_552_1.text_.text = var_555_4

				LuaForUtil.ClearLinePrefixSymbol(arg_552_1.text_)

				local var_555_5 = 20
				local var_555_6 = utf8.len(var_555_4)
				local var_555_7 = var_555_5 <= 0 and var_555_1 or var_555_1 * (var_555_6 / var_555_5)

				if var_555_7 > 0 and var_555_1 < var_555_7 then
					arg_552_1.talkMaxDuration = var_555_7

					if var_555_7 + var_555_0 > arg_552_1.duration_ then
						arg_552_1.duration_ = var_555_7 + var_555_0
					end
				end

				arg_552_1.text_.text = var_555_4
				arg_552_1.typewritter.percent = 0

				arg_552_1.typewritter:SetDirty()
				arg_552_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011134", "story_v_out_413011.awb") ~= 0 then
					local var_555_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011134", "story_v_out_413011.awb") / 1000

					if var_555_8 + var_555_0 > arg_552_1.duration_ then
						arg_552_1.duration_ = var_555_8 + var_555_0
					end

					if var_555_3.prefab_name ~= "" and arg_552_1.actors_[var_555_3.prefab_name] ~= nil then
						local var_555_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_552_1.actors_[var_555_3.prefab_name].transform, "story_v_out_413011", "413011134", "story_v_out_413011.awb")

						arg_552_1:RecordAudio("413011134", var_555_9)
						arg_552_1:RecordAudio("413011134", var_555_9)
					else
						arg_552_1:AudioAction("play", "voice", "story_v_out_413011", "413011134", "story_v_out_413011.awb")
					end

					arg_552_1:RecordHistoryTalkVoice("story_v_out_413011", "413011134", "story_v_out_413011.awb")
				end

				arg_552_1:RecordContent(arg_552_1.text_.text)
			end

			local var_555_10 = math.max(var_555_1, arg_552_1.talkMaxDuration)

			if var_555_0 <= arg_552_1.time_ and arg_552_1.time_ < var_555_0 + var_555_10 then
				arg_552_1.typewritter.percent = (arg_552_1.time_ - var_555_0) / var_555_10

				arg_552_1.typewritter:SetDirty()
			end

			if arg_552_1.time_ >= var_555_0 + var_555_10 and arg_552_1.time_ < var_555_0 + var_555_10 + arg_555_0 then
				arg_552_1.typewritter.percent = 1

				arg_552_1.typewritter:SetDirty()
				arg_552_1:ShowNextGo(true)
			end
		end
	end,
	Play413011135 = function(arg_556_0, arg_556_1)
		arg_556_1.time_ = 0
		arg_556_1.frameCnt_ = 0
		arg_556_1.state_ = "playing"
		arg_556_1.curTalkId_ = 413011135
		arg_556_1.duration_ = 3.93

		local var_556_0 = {
			zh = 1.9,
			ja = 3.933
		}
		local var_556_1 = manager.audio:GetLocalizationFlag()

		if var_556_0[var_556_1] ~= nil then
			arg_556_1.duration_ = var_556_0[var_556_1]
		end

		SetActive(arg_556_1.tipsGo_, false)

		function arg_556_1.onSingleLineFinish_()
			arg_556_1.onSingleLineUpdate_ = nil
			arg_556_1.onSingleLineFinish_ = nil
			arg_556_1.state_ = "waiting"
		end

		function arg_556_1.playNext_(arg_558_0)
			if arg_558_0 == 1 then
				arg_556_0:Play413011136(arg_556_1)
			end
		end

		function arg_556_1.onSingleLineUpdate_(arg_559_0)
			local var_559_0 = arg_556_1.actors_["10022"]
			local var_559_1 = 0

			if var_559_1 < arg_556_1.time_ and arg_556_1.time_ <= var_559_1 + arg_559_0 and not isNil(var_559_0) and arg_556_1.var_.actorSpriteComps10022 == nil then
				arg_556_1.var_.actorSpriteComps10022 = var_559_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_559_2 = 0.2

			if var_559_1 <= arg_556_1.time_ and arg_556_1.time_ < var_559_1 + var_559_2 and not isNil(var_559_0) then
				local var_559_3 = (arg_556_1.time_ - var_559_1) / var_559_2

				if arg_556_1.var_.actorSpriteComps10022 then
					for iter_559_0, iter_559_1 in pairs(arg_556_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_559_1 then
							if arg_556_1.isInRecall_ then
								local var_559_4 = Mathf.Lerp(iter_559_1.color.r, arg_556_1.hightColor2.r, var_559_3)
								local var_559_5 = Mathf.Lerp(iter_559_1.color.g, arg_556_1.hightColor2.g, var_559_3)
								local var_559_6 = Mathf.Lerp(iter_559_1.color.b, arg_556_1.hightColor2.b, var_559_3)

								iter_559_1.color = Color.New(var_559_4, var_559_5, var_559_6)
							else
								local var_559_7 = Mathf.Lerp(iter_559_1.color.r, 0.5, var_559_3)

								iter_559_1.color = Color.New(var_559_7, var_559_7, var_559_7)
							end
						end
					end
				end
			end

			if arg_556_1.time_ >= var_559_1 + var_559_2 and arg_556_1.time_ < var_559_1 + var_559_2 + arg_559_0 and not isNil(var_559_0) and arg_556_1.var_.actorSpriteComps10022 then
				for iter_559_2, iter_559_3 in pairs(arg_556_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_559_3 then
						if arg_556_1.isInRecall_ then
							iter_559_3.color = arg_556_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_559_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_556_1.var_.actorSpriteComps10022 = nil
			end

			local var_559_8 = arg_556_1.actors_["10094"]
			local var_559_9 = 0

			if var_559_9 < arg_556_1.time_ and arg_556_1.time_ <= var_559_9 + arg_559_0 then
				arg_556_1:SetSpriteNiuquEffect("10094", true)
			end

			local var_559_10 = arg_556_1.actors_["10094"].transform
			local var_559_11 = 0

			if var_559_11 < arg_556_1.time_ and arg_556_1.time_ <= var_559_11 + arg_559_0 then
				arg_556_1.var_.moveOldPos10094 = var_559_10.localPosition
				var_559_10.localScale = Vector3.New(1, 1, 1)

				arg_556_1:CheckSpriteTmpPos("10094", 4)

				local var_559_12 = var_559_10.childCount

				for iter_559_4 = 0, var_559_12 - 1 do
					local var_559_13 = var_559_10:GetChild(iter_559_4)

					if var_559_13.name == "split_1" or not string.find(var_559_13.name, "split") then
						var_559_13.gameObject:SetActive(true)
					else
						var_559_13.gameObject:SetActive(false)
					end
				end
			end

			local var_559_14 = 0.001

			if var_559_11 <= arg_556_1.time_ and arg_556_1.time_ < var_559_11 + var_559_14 then
				local var_559_15 = (arg_556_1.time_ - var_559_11) / var_559_14
				local var_559_16 = Vector3.New(390, -340, -414)

				var_559_10.localPosition = Vector3.Lerp(arg_556_1.var_.moveOldPos10094, var_559_16, var_559_15)
			end

			if arg_556_1.time_ >= var_559_11 + var_559_14 and arg_556_1.time_ < var_559_11 + var_559_14 + arg_559_0 then
				var_559_10.localPosition = Vector3.New(390, -340, -414)
			end

			local var_559_17 = arg_556_1.actors_["10094"]
			local var_559_18 = 0

			if var_559_18 < arg_556_1.time_ and arg_556_1.time_ <= var_559_18 + arg_559_0 then
				local var_559_19 = var_559_17:GetComponentInChildren(typeof(CanvasGroup))

				if var_559_19 then
					arg_556_1.var_.alphaOldValue10094 = var_559_19.alpha
					arg_556_1.var_.characterEffect10094 = var_559_19
				end
			end

			local var_559_20 = 0.5

			if var_559_18 <= arg_556_1.time_ and arg_556_1.time_ < var_559_18 + var_559_20 then
				local var_559_21 = (arg_556_1.time_ - var_559_18) / var_559_20
				local var_559_22 = Mathf.Lerp(arg_556_1.var_.alphaOldValue10094, 0.6, var_559_21)

				if arg_556_1.var_.characterEffect10094 then
					arg_556_1.var_.characterEffect10094.alpha = var_559_22
				end
			end

			if arg_556_1.time_ >= var_559_18 + var_559_20 and arg_556_1.time_ < var_559_18 + var_559_20 + arg_559_0 and arg_556_1.var_.characterEffect10094 then
				arg_556_1.var_.characterEffect10094.alpha = 0.6
			end

			local var_559_23 = arg_556_1.actors_["10022"].transform
			local var_559_24 = 0

			if var_559_24 < arg_556_1.time_ and arg_556_1.time_ <= var_559_24 + arg_559_0 then
				arg_556_1.var_.moveOldPos10022 = var_559_23.localPosition
				var_559_23.localScale = Vector3.New(1, 1, 1)

				arg_556_1:CheckSpriteTmpPos("10022", 2)

				local var_559_25 = var_559_23.childCount

				for iter_559_5 = 0, var_559_25 - 1 do
					local var_559_26 = var_559_23:GetChild(iter_559_5)

					if var_559_26.name == "split_1" or not string.find(var_559_26.name, "split") then
						var_559_26.gameObject:SetActive(true)
					else
						var_559_26.gameObject:SetActive(false)
					end
				end
			end

			local var_559_27 = 0.001

			if var_559_24 <= arg_556_1.time_ and arg_556_1.time_ < var_559_24 + var_559_27 then
				local var_559_28 = (arg_556_1.time_ - var_559_24) / var_559_27
				local var_559_29 = Vector3.New(-390, -315, -320)

				var_559_23.localPosition = Vector3.Lerp(arg_556_1.var_.moveOldPos10022, var_559_29, var_559_28)
			end

			if arg_556_1.time_ >= var_559_24 + var_559_27 and arg_556_1.time_ < var_559_24 + var_559_27 + arg_559_0 then
				var_559_23.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_559_30 = 0
			local var_559_31 = 0.25

			if var_559_30 < arg_556_1.time_ and arg_556_1.time_ <= var_559_30 + arg_559_0 then
				arg_556_1.talkMaxDuration = 0
				arg_556_1.dialogCg_.alpha = 1

				arg_556_1.dialog_:SetActive(true)
				SetActive(arg_556_1.leftNameGo_, true)

				local var_559_32 = arg_556_1:FormatText(StoryNameCfg[259].name)

				arg_556_1.leftNameTxt_.text = var_559_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_556_1.leftNameTxt_.transform)

				arg_556_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_556_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_556_1:RecordName(arg_556_1.leftNameTxt_.text)
				SetActive(arg_556_1.iconTrs_.gameObject, false)
				arg_556_1.callingController_:SetSelectedState("normal")

				local var_559_33 = arg_556_1:GetWordFromCfg(413011135)
				local var_559_34 = arg_556_1:FormatText(var_559_33.content)

				arg_556_1.text_.text = var_559_34

				LuaForUtil.ClearLinePrefixSymbol(arg_556_1.text_)

				local var_559_35 = 10
				local var_559_36 = utf8.len(var_559_34)
				local var_559_37 = var_559_35 <= 0 and var_559_31 or var_559_31 * (var_559_36 / var_559_35)

				if var_559_37 > 0 and var_559_31 < var_559_37 then
					arg_556_1.talkMaxDuration = var_559_37

					if var_559_37 + var_559_30 > arg_556_1.duration_ then
						arg_556_1.duration_ = var_559_37 + var_559_30
					end
				end

				arg_556_1.text_.text = var_559_34
				arg_556_1.typewritter.percent = 0

				arg_556_1.typewritter:SetDirty()
				arg_556_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011135", "story_v_out_413011.awb") ~= 0 then
					local var_559_38 = manager.audio:GetVoiceLength("story_v_out_413011", "413011135", "story_v_out_413011.awb") / 1000

					if var_559_38 + var_559_30 > arg_556_1.duration_ then
						arg_556_1.duration_ = var_559_38 + var_559_30
					end

					if var_559_33.prefab_name ~= "" and arg_556_1.actors_[var_559_33.prefab_name] ~= nil then
						local var_559_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_556_1.actors_[var_559_33.prefab_name].transform, "story_v_out_413011", "413011135", "story_v_out_413011.awb")

						arg_556_1:RecordAudio("413011135", var_559_39)
						arg_556_1:RecordAudio("413011135", var_559_39)
					else
						arg_556_1:AudioAction("play", "voice", "story_v_out_413011", "413011135", "story_v_out_413011.awb")
					end

					arg_556_1:RecordHistoryTalkVoice("story_v_out_413011", "413011135", "story_v_out_413011.awb")
				end

				arg_556_1:RecordContent(arg_556_1.text_.text)
			end

			local var_559_40 = math.max(var_559_31, arg_556_1.talkMaxDuration)

			if var_559_30 <= arg_556_1.time_ and arg_556_1.time_ < var_559_30 + var_559_40 then
				arg_556_1.typewritter.percent = (arg_556_1.time_ - var_559_30) / var_559_40

				arg_556_1.typewritter:SetDirty()
			end

			if arg_556_1.time_ >= var_559_30 + var_559_40 and arg_556_1.time_ < var_559_30 + var_559_40 + arg_559_0 then
				arg_556_1.typewritter.percent = 1

				arg_556_1.typewritter:SetDirty()
				arg_556_1:ShowNextGo(true)
			end
		end
	end,
	Play413011136 = function(arg_560_0, arg_560_1)
		arg_560_1.time_ = 0
		arg_560_1.frameCnt_ = 0
		arg_560_1.state_ = "playing"
		arg_560_1.curTalkId_ = 413011136
		arg_560_1.duration_ = 4.77

		local var_560_0 = {
			zh = 2.966,
			ja = 4.766
		}
		local var_560_1 = manager.audio:GetLocalizationFlag()

		if var_560_0[var_560_1] ~= nil then
			arg_560_1.duration_ = var_560_0[var_560_1]
		end

		SetActive(arg_560_1.tipsGo_, false)

		function arg_560_1.onSingleLineFinish_()
			arg_560_1.onSingleLineUpdate_ = nil
			arg_560_1.onSingleLineFinish_ = nil
			arg_560_1.state_ = "waiting"
		end

		function arg_560_1.playNext_(arg_562_0)
			if arg_562_0 == 1 then
				arg_560_0:Play413011137(arg_560_1)
			end
		end

		function arg_560_1.onSingleLineUpdate_(arg_563_0)
			local var_563_0 = arg_560_1.actors_["10022"]
			local var_563_1 = 0

			if var_563_1 < arg_560_1.time_ and arg_560_1.time_ <= var_563_1 + arg_563_0 and not isNil(var_563_0) and arg_560_1.var_.actorSpriteComps10022 == nil then
				arg_560_1.var_.actorSpriteComps10022 = var_563_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_563_2 = 2

			if var_563_1 <= arg_560_1.time_ and arg_560_1.time_ < var_563_1 + var_563_2 and not isNil(var_563_0) then
				local var_563_3 = (arg_560_1.time_ - var_563_1) / var_563_2

				if arg_560_1.var_.actorSpriteComps10022 then
					for iter_563_0, iter_563_1 in pairs(arg_560_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_563_1 then
							if arg_560_1.isInRecall_ then
								local var_563_4 = Mathf.Lerp(iter_563_1.color.r, arg_560_1.hightColor1.r, var_563_3)
								local var_563_5 = Mathf.Lerp(iter_563_1.color.g, arg_560_1.hightColor1.g, var_563_3)
								local var_563_6 = Mathf.Lerp(iter_563_1.color.b, arg_560_1.hightColor1.b, var_563_3)

								iter_563_1.color = Color.New(var_563_4, var_563_5, var_563_6)
							else
								local var_563_7 = Mathf.Lerp(iter_563_1.color.r, 1, var_563_3)

								iter_563_1.color = Color.New(var_563_7, var_563_7, var_563_7)
							end
						end
					end
				end
			end

			if arg_560_1.time_ >= var_563_1 + var_563_2 and arg_560_1.time_ < var_563_1 + var_563_2 + arg_563_0 and not isNil(var_563_0) and arg_560_1.var_.actorSpriteComps10022 then
				for iter_563_2, iter_563_3 in pairs(arg_560_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_563_3 then
						if arg_560_1.isInRecall_ then
							iter_563_3.color = arg_560_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_563_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_560_1.var_.actorSpriteComps10022 = nil
			end

			local var_563_8 = 0
			local var_563_9 = 0.4

			if var_563_8 < arg_560_1.time_ and arg_560_1.time_ <= var_563_8 + arg_563_0 then
				arg_560_1.talkMaxDuration = 0
				arg_560_1.dialogCg_.alpha = 1

				arg_560_1.dialog_:SetActive(true)
				SetActive(arg_560_1.leftNameGo_, true)

				local var_563_10 = arg_560_1:FormatText(StoryNameCfg[614].name)

				arg_560_1.leftNameTxt_.text = var_563_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_560_1.leftNameTxt_.transform)

				arg_560_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_560_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_560_1:RecordName(arg_560_1.leftNameTxt_.text)
				SetActive(arg_560_1.iconTrs_.gameObject, false)
				arg_560_1.callingController_:SetSelectedState("normal")

				local var_563_11 = arg_560_1:GetWordFromCfg(413011136)
				local var_563_12 = arg_560_1:FormatText(var_563_11.content)

				arg_560_1.text_.text = var_563_12

				LuaForUtil.ClearLinePrefixSymbol(arg_560_1.text_)

				local var_563_13 = 16
				local var_563_14 = utf8.len(var_563_12)
				local var_563_15 = var_563_13 <= 0 and var_563_9 or var_563_9 * (var_563_14 / var_563_13)

				if var_563_15 > 0 and var_563_9 < var_563_15 then
					arg_560_1.talkMaxDuration = var_563_15

					if var_563_15 + var_563_8 > arg_560_1.duration_ then
						arg_560_1.duration_ = var_563_15 + var_563_8
					end
				end

				arg_560_1.text_.text = var_563_12
				arg_560_1.typewritter.percent = 0

				arg_560_1.typewritter:SetDirty()
				arg_560_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011136", "story_v_out_413011.awb") ~= 0 then
					local var_563_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011136", "story_v_out_413011.awb") / 1000

					if var_563_16 + var_563_8 > arg_560_1.duration_ then
						arg_560_1.duration_ = var_563_16 + var_563_8
					end

					if var_563_11.prefab_name ~= "" and arg_560_1.actors_[var_563_11.prefab_name] ~= nil then
						local var_563_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_560_1.actors_[var_563_11.prefab_name].transform, "story_v_out_413011", "413011136", "story_v_out_413011.awb")

						arg_560_1:RecordAudio("413011136", var_563_17)
						arg_560_1:RecordAudio("413011136", var_563_17)
					else
						arg_560_1:AudioAction("play", "voice", "story_v_out_413011", "413011136", "story_v_out_413011.awb")
					end

					arg_560_1:RecordHistoryTalkVoice("story_v_out_413011", "413011136", "story_v_out_413011.awb")
				end

				arg_560_1:RecordContent(arg_560_1.text_.text)
			end

			local var_563_18 = math.max(var_563_9, arg_560_1.talkMaxDuration)

			if var_563_8 <= arg_560_1.time_ and arg_560_1.time_ < var_563_8 + var_563_18 then
				arg_560_1.typewritter.percent = (arg_560_1.time_ - var_563_8) / var_563_18

				arg_560_1.typewritter:SetDirty()
			end

			if arg_560_1.time_ >= var_563_8 + var_563_18 and arg_560_1.time_ < var_563_8 + var_563_18 + arg_563_0 then
				arg_560_1.typewritter.percent = 1

				arg_560_1.typewritter:SetDirty()
				arg_560_1:ShowNextGo(true)
			end
		end
	end,
	Play413011137 = function(arg_564_0, arg_564_1)
		arg_564_1.time_ = 0
		arg_564_1.frameCnt_ = 0
		arg_564_1.state_ = "playing"
		arg_564_1.curTalkId_ = 413011137
		arg_564_1.duration_ = 7.5

		local var_564_0 = {
			zh = 4.1,
			ja = 7.5
		}
		local var_564_1 = manager.audio:GetLocalizationFlag()

		if var_564_0[var_564_1] ~= nil then
			arg_564_1.duration_ = var_564_0[var_564_1]
		end

		SetActive(arg_564_1.tipsGo_, false)

		function arg_564_1.onSingleLineFinish_()
			arg_564_1.onSingleLineUpdate_ = nil
			arg_564_1.onSingleLineFinish_ = nil
			arg_564_1.state_ = "waiting"
		end

		function arg_564_1.playNext_(arg_566_0)
			if arg_566_0 == 1 then
				arg_564_0:Play413011138(arg_564_1)
			end
		end

		function arg_564_1.onSingleLineUpdate_(arg_567_0)
			local var_567_0 = arg_564_1.actors_["10022"]
			local var_567_1 = 0

			if var_567_1 < arg_564_1.time_ and arg_564_1.time_ <= var_567_1 + arg_567_0 and not isNil(var_567_0) and arg_564_1.var_.actorSpriteComps10022 == nil then
				arg_564_1.var_.actorSpriteComps10022 = var_567_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_567_2 = 2

			if var_567_1 <= arg_564_1.time_ and arg_564_1.time_ < var_567_1 + var_567_2 and not isNil(var_567_0) then
				local var_567_3 = (arg_564_1.time_ - var_567_1) / var_567_2

				if arg_564_1.var_.actorSpriteComps10022 then
					for iter_567_0, iter_567_1 in pairs(arg_564_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_567_1 then
							if arg_564_1.isInRecall_ then
								local var_567_4 = Mathf.Lerp(iter_567_1.color.r, arg_564_1.hightColor2.r, var_567_3)
								local var_567_5 = Mathf.Lerp(iter_567_1.color.g, arg_564_1.hightColor2.g, var_567_3)
								local var_567_6 = Mathf.Lerp(iter_567_1.color.b, arg_564_1.hightColor2.b, var_567_3)

								iter_567_1.color = Color.New(var_567_4, var_567_5, var_567_6)
							else
								local var_567_7 = Mathf.Lerp(iter_567_1.color.r, 0.5, var_567_3)

								iter_567_1.color = Color.New(var_567_7, var_567_7, var_567_7)
							end
						end
					end
				end
			end

			if arg_564_1.time_ >= var_567_1 + var_567_2 and arg_564_1.time_ < var_567_1 + var_567_2 + arg_567_0 and not isNil(var_567_0) and arg_564_1.var_.actorSpriteComps10022 then
				for iter_567_2, iter_567_3 in pairs(arg_564_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_567_3 then
						if arg_564_1.isInRecall_ then
							iter_567_3.color = arg_564_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_567_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_564_1.var_.actorSpriteComps10022 = nil
			end

			local var_567_8 = 0
			local var_567_9 = 0.425

			if var_567_8 < arg_564_1.time_ and arg_564_1.time_ <= var_567_8 + arg_567_0 then
				arg_564_1.talkMaxDuration = 0
				arg_564_1.dialogCg_.alpha = 1

				arg_564_1.dialog_:SetActive(true)
				SetActive(arg_564_1.leftNameGo_, true)

				local var_567_10 = arg_564_1:FormatText(StoryNameCfg[259].name)

				arg_564_1.leftNameTxt_.text = var_567_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_564_1.leftNameTxt_.transform)

				arg_564_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_564_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_564_1:RecordName(arg_564_1.leftNameTxt_.text)
				SetActive(arg_564_1.iconTrs_.gameObject, false)
				arg_564_1.callingController_:SetSelectedState("normal")

				local var_567_11 = arg_564_1:GetWordFromCfg(413011137)
				local var_567_12 = arg_564_1:FormatText(var_567_11.content)

				arg_564_1.text_.text = var_567_12

				LuaForUtil.ClearLinePrefixSymbol(arg_564_1.text_)

				local var_567_13 = 17
				local var_567_14 = utf8.len(var_567_12)
				local var_567_15 = var_567_13 <= 0 and var_567_9 or var_567_9 * (var_567_14 / var_567_13)

				if var_567_15 > 0 and var_567_9 < var_567_15 then
					arg_564_1.talkMaxDuration = var_567_15

					if var_567_15 + var_567_8 > arg_564_1.duration_ then
						arg_564_1.duration_ = var_567_15 + var_567_8
					end
				end

				arg_564_1.text_.text = var_567_12
				arg_564_1.typewritter.percent = 0

				arg_564_1.typewritter:SetDirty()
				arg_564_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011137", "story_v_out_413011.awb") ~= 0 then
					local var_567_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011137", "story_v_out_413011.awb") / 1000

					if var_567_16 + var_567_8 > arg_564_1.duration_ then
						arg_564_1.duration_ = var_567_16 + var_567_8
					end

					if var_567_11.prefab_name ~= "" and arg_564_1.actors_[var_567_11.prefab_name] ~= nil then
						local var_567_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_564_1.actors_[var_567_11.prefab_name].transform, "story_v_out_413011", "413011137", "story_v_out_413011.awb")

						arg_564_1:RecordAudio("413011137", var_567_17)
						arg_564_1:RecordAudio("413011137", var_567_17)
					else
						arg_564_1:AudioAction("play", "voice", "story_v_out_413011", "413011137", "story_v_out_413011.awb")
					end

					arg_564_1:RecordHistoryTalkVoice("story_v_out_413011", "413011137", "story_v_out_413011.awb")
				end

				arg_564_1:RecordContent(arg_564_1.text_.text)
			end

			local var_567_18 = math.max(var_567_9, arg_564_1.talkMaxDuration)

			if var_567_8 <= arg_564_1.time_ and arg_564_1.time_ < var_567_8 + var_567_18 then
				arg_564_1.typewritter.percent = (arg_564_1.time_ - var_567_8) / var_567_18

				arg_564_1.typewritter:SetDirty()
			end

			if arg_564_1.time_ >= var_567_8 + var_567_18 and arg_564_1.time_ < var_567_8 + var_567_18 + arg_567_0 then
				arg_564_1.typewritter.percent = 1

				arg_564_1.typewritter:SetDirty()
				arg_564_1:ShowNextGo(true)
			end
		end
	end,
	Play413011138 = function(arg_568_0, arg_568_1)
		arg_568_1.time_ = 0
		arg_568_1.frameCnt_ = 0
		arg_568_1.state_ = "playing"
		arg_568_1.curTalkId_ = 413011138
		arg_568_1.duration_ = 4.8

		local var_568_0 = {
			zh = 2.666,
			ja = 4.8
		}
		local var_568_1 = manager.audio:GetLocalizationFlag()

		if var_568_0[var_568_1] ~= nil then
			arg_568_1.duration_ = var_568_0[var_568_1]
		end

		SetActive(arg_568_1.tipsGo_, false)

		function arg_568_1.onSingleLineFinish_()
			arg_568_1.onSingleLineUpdate_ = nil
			arg_568_1.onSingleLineFinish_ = nil
			arg_568_1.state_ = "waiting"
		end

		function arg_568_1.playNext_(arg_570_0)
			if arg_570_0 == 1 then
				arg_568_0:Play413011139(arg_568_1)
			end
		end

		function arg_568_1.onSingleLineUpdate_(arg_571_0)
			local var_571_0 = arg_568_1.actors_["10022"]
			local var_571_1 = 0

			if var_571_1 < arg_568_1.time_ and arg_568_1.time_ <= var_571_1 + arg_571_0 and not isNil(var_571_0) and arg_568_1.var_.actorSpriteComps10022 == nil then
				arg_568_1.var_.actorSpriteComps10022 = var_571_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_571_2 = 2

			if var_571_1 <= arg_568_1.time_ and arg_568_1.time_ < var_571_1 + var_571_2 and not isNil(var_571_0) then
				local var_571_3 = (arg_568_1.time_ - var_571_1) / var_571_2

				if arg_568_1.var_.actorSpriteComps10022 then
					for iter_571_0, iter_571_1 in pairs(arg_568_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_571_1 then
							if arg_568_1.isInRecall_ then
								local var_571_4 = Mathf.Lerp(iter_571_1.color.r, arg_568_1.hightColor1.r, var_571_3)
								local var_571_5 = Mathf.Lerp(iter_571_1.color.g, arg_568_1.hightColor1.g, var_571_3)
								local var_571_6 = Mathf.Lerp(iter_571_1.color.b, arg_568_1.hightColor1.b, var_571_3)

								iter_571_1.color = Color.New(var_571_4, var_571_5, var_571_6)
							else
								local var_571_7 = Mathf.Lerp(iter_571_1.color.r, 1, var_571_3)

								iter_571_1.color = Color.New(var_571_7, var_571_7, var_571_7)
							end
						end
					end
				end
			end

			if arg_568_1.time_ >= var_571_1 + var_571_2 and arg_568_1.time_ < var_571_1 + var_571_2 + arg_571_0 and not isNil(var_571_0) and arg_568_1.var_.actorSpriteComps10022 then
				for iter_571_2, iter_571_3 in pairs(arg_568_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_571_3 then
						if arg_568_1.isInRecall_ then
							iter_571_3.color = arg_568_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_571_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_568_1.var_.actorSpriteComps10022 = nil
			end

			local var_571_8 = 0
			local var_571_9 = 0.325

			if var_571_8 < arg_568_1.time_ and arg_568_1.time_ <= var_571_8 + arg_571_0 then
				arg_568_1.talkMaxDuration = 0
				arg_568_1.dialogCg_.alpha = 1

				arg_568_1.dialog_:SetActive(true)
				SetActive(arg_568_1.leftNameGo_, true)

				local var_571_10 = arg_568_1:FormatText(StoryNameCfg[614].name)

				arg_568_1.leftNameTxt_.text = var_571_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_568_1.leftNameTxt_.transform)

				arg_568_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_568_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_568_1:RecordName(arg_568_1.leftNameTxt_.text)
				SetActive(arg_568_1.iconTrs_.gameObject, false)
				arg_568_1.callingController_:SetSelectedState("normal")

				local var_571_11 = arg_568_1:GetWordFromCfg(413011138)
				local var_571_12 = arg_568_1:FormatText(var_571_11.content)

				arg_568_1.text_.text = var_571_12

				LuaForUtil.ClearLinePrefixSymbol(arg_568_1.text_)

				local var_571_13 = 13
				local var_571_14 = utf8.len(var_571_12)
				local var_571_15 = var_571_13 <= 0 and var_571_9 or var_571_9 * (var_571_14 / var_571_13)

				if var_571_15 > 0 and var_571_9 < var_571_15 then
					arg_568_1.talkMaxDuration = var_571_15

					if var_571_15 + var_571_8 > arg_568_1.duration_ then
						arg_568_1.duration_ = var_571_15 + var_571_8
					end
				end

				arg_568_1.text_.text = var_571_12
				arg_568_1.typewritter.percent = 0

				arg_568_1.typewritter:SetDirty()
				arg_568_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011138", "story_v_out_413011.awb") ~= 0 then
					local var_571_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011138", "story_v_out_413011.awb") / 1000

					if var_571_16 + var_571_8 > arg_568_1.duration_ then
						arg_568_1.duration_ = var_571_16 + var_571_8
					end

					if var_571_11.prefab_name ~= "" and arg_568_1.actors_[var_571_11.prefab_name] ~= nil then
						local var_571_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_568_1.actors_[var_571_11.prefab_name].transform, "story_v_out_413011", "413011138", "story_v_out_413011.awb")

						arg_568_1:RecordAudio("413011138", var_571_17)
						arg_568_1:RecordAudio("413011138", var_571_17)
					else
						arg_568_1:AudioAction("play", "voice", "story_v_out_413011", "413011138", "story_v_out_413011.awb")
					end

					arg_568_1:RecordHistoryTalkVoice("story_v_out_413011", "413011138", "story_v_out_413011.awb")
				end

				arg_568_1:RecordContent(arg_568_1.text_.text)
			end

			local var_571_18 = math.max(var_571_9, arg_568_1.talkMaxDuration)

			if var_571_8 <= arg_568_1.time_ and arg_568_1.time_ < var_571_8 + var_571_18 then
				arg_568_1.typewritter.percent = (arg_568_1.time_ - var_571_8) / var_571_18

				arg_568_1.typewritter:SetDirty()
			end

			if arg_568_1.time_ >= var_571_8 + var_571_18 and arg_568_1.time_ < var_571_8 + var_571_18 + arg_571_0 then
				arg_568_1.typewritter.percent = 1

				arg_568_1.typewritter:SetDirty()
				arg_568_1:ShowNextGo(true)
			end
		end
	end,
	Play413011139 = function(arg_572_0, arg_572_1)
		arg_572_1.time_ = 0
		arg_572_1.frameCnt_ = 0
		arg_572_1.state_ = "playing"
		arg_572_1.curTalkId_ = 413011139
		arg_572_1.duration_ = 9.87

		local var_572_0 = {
			zh = 6.666,
			ja = 9.866
		}
		local var_572_1 = manager.audio:GetLocalizationFlag()

		if var_572_0[var_572_1] ~= nil then
			arg_572_1.duration_ = var_572_0[var_572_1]
		end

		SetActive(arg_572_1.tipsGo_, false)

		function arg_572_1.onSingleLineFinish_()
			arg_572_1.onSingleLineUpdate_ = nil
			arg_572_1.onSingleLineFinish_ = nil
			arg_572_1.state_ = "waiting"
		end

		function arg_572_1.playNext_(arg_574_0)
			if arg_574_0 == 1 then
				arg_572_0:Play413011140(arg_572_1)
			end
		end

		function arg_572_1.onSingleLineUpdate_(arg_575_0)
			local var_575_0 = arg_572_1.actors_["10022"]
			local var_575_1 = 0

			if var_575_1 < arg_572_1.time_ and arg_572_1.time_ <= var_575_1 + arg_575_0 and not isNil(var_575_0) and arg_572_1.var_.actorSpriteComps10022 == nil then
				arg_572_1.var_.actorSpriteComps10022 = var_575_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_575_2 = 2

			if var_575_1 <= arg_572_1.time_ and arg_572_1.time_ < var_575_1 + var_575_2 and not isNil(var_575_0) then
				local var_575_3 = (arg_572_1.time_ - var_575_1) / var_575_2

				if arg_572_1.var_.actorSpriteComps10022 then
					for iter_575_0, iter_575_1 in pairs(arg_572_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_575_1 then
							if arg_572_1.isInRecall_ then
								local var_575_4 = Mathf.Lerp(iter_575_1.color.r, arg_572_1.hightColor2.r, var_575_3)
								local var_575_5 = Mathf.Lerp(iter_575_1.color.g, arg_572_1.hightColor2.g, var_575_3)
								local var_575_6 = Mathf.Lerp(iter_575_1.color.b, arg_572_1.hightColor2.b, var_575_3)

								iter_575_1.color = Color.New(var_575_4, var_575_5, var_575_6)
							else
								local var_575_7 = Mathf.Lerp(iter_575_1.color.r, 0.5, var_575_3)

								iter_575_1.color = Color.New(var_575_7, var_575_7, var_575_7)
							end
						end
					end
				end
			end

			if arg_572_1.time_ >= var_575_1 + var_575_2 and arg_572_1.time_ < var_575_1 + var_575_2 + arg_575_0 and not isNil(var_575_0) and arg_572_1.var_.actorSpriteComps10022 then
				for iter_575_2, iter_575_3 in pairs(arg_572_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_575_3 then
						if arg_572_1.isInRecall_ then
							iter_575_3.color = arg_572_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_575_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_572_1.var_.actorSpriteComps10022 = nil
			end

			local var_575_8 = arg_572_1.actors_["10094"].transform
			local var_575_9 = 0

			if var_575_9 < arg_572_1.time_ and arg_572_1.time_ <= var_575_9 + arg_575_0 then
				arg_572_1.var_.moveOldPos10094 = var_575_8.localPosition
				var_575_8.localScale = Vector3.New(1, 1, 1)

				arg_572_1:CheckSpriteTmpPos("10094", 4)

				local var_575_10 = var_575_8.childCount

				for iter_575_4 = 0, var_575_10 - 1 do
					local var_575_11 = var_575_8:GetChild(iter_575_4)

					if var_575_11.name == "split_2" or not string.find(var_575_11.name, "split") then
						var_575_11.gameObject:SetActive(true)
					else
						var_575_11.gameObject:SetActive(false)
					end
				end
			end

			local var_575_12 = 0.001

			if var_575_9 <= arg_572_1.time_ and arg_572_1.time_ < var_575_9 + var_575_12 then
				local var_575_13 = (arg_572_1.time_ - var_575_9) / var_575_12
				local var_575_14 = Vector3.New(390, -340, -414)

				var_575_8.localPosition = Vector3.Lerp(arg_572_1.var_.moveOldPos10094, var_575_14, var_575_13)
			end

			if arg_572_1.time_ >= var_575_9 + var_575_12 and arg_572_1.time_ < var_575_9 + var_575_12 + arg_575_0 then
				var_575_8.localPosition = Vector3.New(390, -340, -414)
			end

			local var_575_15 = 0
			local var_575_16 = 0.775

			if var_575_15 < arg_572_1.time_ and arg_572_1.time_ <= var_575_15 + arg_575_0 then
				arg_572_1.talkMaxDuration = 0
				arg_572_1.dialogCg_.alpha = 1

				arg_572_1.dialog_:SetActive(true)
				SetActive(arg_572_1.leftNameGo_, true)

				local var_575_17 = arg_572_1:FormatText(StoryNameCfg[259].name)

				arg_572_1.leftNameTxt_.text = var_575_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_572_1.leftNameTxt_.transform)

				arg_572_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_572_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_572_1:RecordName(arg_572_1.leftNameTxt_.text)
				SetActive(arg_572_1.iconTrs_.gameObject, false)
				arg_572_1.callingController_:SetSelectedState("normal")

				local var_575_18 = arg_572_1:GetWordFromCfg(413011139)
				local var_575_19 = arg_572_1:FormatText(var_575_18.content)

				arg_572_1.text_.text = var_575_19

				LuaForUtil.ClearLinePrefixSymbol(arg_572_1.text_)

				local var_575_20 = 31
				local var_575_21 = utf8.len(var_575_19)
				local var_575_22 = var_575_20 <= 0 and var_575_16 or var_575_16 * (var_575_21 / var_575_20)

				if var_575_22 > 0 and var_575_16 < var_575_22 then
					arg_572_1.talkMaxDuration = var_575_22

					if var_575_22 + var_575_15 > arg_572_1.duration_ then
						arg_572_1.duration_ = var_575_22 + var_575_15
					end
				end

				arg_572_1.text_.text = var_575_19
				arg_572_1.typewritter.percent = 0

				arg_572_1.typewritter:SetDirty()
				arg_572_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011139", "story_v_out_413011.awb") ~= 0 then
					local var_575_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011139", "story_v_out_413011.awb") / 1000

					if var_575_23 + var_575_15 > arg_572_1.duration_ then
						arg_572_1.duration_ = var_575_23 + var_575_15
					end

					if var_575_18.prefab_name ~= "" and arg_572_1.actors_[var_575_18.prefab_name] ~= nil then
						local var_575_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_572_1.actors_[var_575_18.prefab_name].transform, "story_v_out_413011", "413011139", "story_v_out_413011.awb")

						arg_572_1:RecordAudio("413011139", var_575_24)
						arg_572_1:RecordAudio("413011139", var_575_24)
					else
						arg_572_1:AudioAction("play", "voice", "story_v_out_413011", "413011139", "story_v_out_413011.awb")
					end

					arg_572_1:RecordHistoryTalkVoice("story_v_out_413011", "413011139", "story_v_out_413011.awb")
				end

				arg_572_1:RecordContent(arg_572_1.text_.text)
			end

			local var_575_25 = math.max(var_575_16, arg_572_1.talkMaxDuration)

			if var_575_15 <= arg_572_1.time_ and arg_572_1.time_ < var_575_15 + var_575_25 then
				arg_572_1.typewritter.percent = (arg_572_1.time_ - var_575_15) / var_575_25

				arg_572_1.typewritter:SetDirty()
			end

			if arg_572_1.time_ >= var_575_15 + var_575_25 and arg_572_1.time_ < var_575_15 + var_575_25 + arg_575_0 then
				arg_572_1.typewritter.percent = 1

				arg_572_1.typewritter:SetDirty()
				arg_572_1:ShowNextGo(true)
			end
		end
	end,
	Play413011140 = function(arg_576_0, arg_576_1)
		arg_576_1.time_ = 0
		arg_576_1.frameCnt_ = 0
		arg_576_1.state_ = "playing"
		arg_576_1.curTalkId_ = 413011140
		arg_576_1.duration_ = 9.3

		local var_576_0 = {
			zh = 9.3,
			ja = 7.133
		}
		local var_576_1 = manager.audio:GetLocalizationFlag()

		if var_576_0[var_576_1] ~= nil then
			arg_576_1.duration_ = var_576_0[var_576_1]
		end

		SetActive(arg_576_1.tipsGo_, false)

		function arg_576_1.onSingleLineFinish_()
			arg_576_1.onSingleLineUpdate_ = nil
			arg_576_1.onSingleLineFinish_ = nil
			arg_576_1.state_ = "waiting"
		end

		function arg_576_1.playNext_(arg_578_0)
			if arg_578_0 == 1 then
				arg_576_0:Play413011141(arg_576_1)
			end
		end

		function arg_576_1.onSingleLineUpdate_(arg_579_0)
			local var_579_0 = arg_576_1.actors_["10022"]
			local var_579_1 = 0

			if var_579_1 < arg_576_1.time_ and arg_576_1.time_ <= var_579_1 + arg_579_0 and not isNil(var_579_0) and arg_576_1.var_.actorSpriteComps10022 == nil then
				arg_576_1.var_.actorSpriteComps10022 = var_579_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_579_2 = 2

			if var_579_1 <= arg_576_1.time_ and arg_576_1.time_ < var_579_1 + var_579_2 and not isNil(var_579_0) then
				local var_579_3 = (arg_576_1.time_ - var_579_1) / var_579_2

				if arg_576_1.var_.actorSpriteComps10022 then
					for iter_579_0, iter_579_1 in pairs(arg_576_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_579_1 then
							if arg_576_1.isInRecall_ then
								local var_579_4 = Mathf.Lerp(iter_579_1.color.r, arg_576_1.hightColor1.r, var_579_3)
								local var_579_5 = Mathf.Lerp(iter_579_1.color.g, arg_576_1.hightColor1.g, var_579_3)
								local var_579_6 = Mathf.Lerp(iter_579_1.color.b, arg_576_1.hightColor1.b, var_579_3)

								iter_579_1.color = Color.New(var_579_4, var_579_5, var_579_6)
							else
								local var_579_7 = Mathf.Lerp(iter_579_1.color.r, 1, var_579_3)

								iter_579_1.color = Color.New(var_579_7, var_579_7, var_579_7)
							end
						end
					end
				end
			end

			if arg_576_1.time_ >= var_579_1 + var_579_2 and arg_576_1.time_ < var_579_1 + var_579_2 + arg_579_0 and not isNil(var_579_0) and arg_576_1.var_.actorSpriteComps10022 then
				for iter_579_2, iter_579_3 in pairs(arg_576_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_579_3 then
						if arg_576_1.isInRecall_ then
							iter_579_3.color = arg_576_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_579_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_576_1.var_.actorSpriteComps10022 = nil
			end

			local var_579_8 = 0
			local var_579_9 = 1.075

			if var_579_8 < arg_576_1.time_ and arg_576_1.time_ <= var_579_8 + arg_579_0 then
				arg_576_1.talkMaxDuration = 0
				arg_576_1.dialogCg_.alpha = 1

				arg_576_1.dialog_:SetActive(true)
				SetActive(arg_576_1.leftNameGo_, true)

				local var_579_10 = arg_576_1:FormatText(StoryNameCfg[614].name)

				arg_576_1.leftNameTxt_.text = var_579_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_576_1.leftNameTxt_.transform)

				arg_576_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_576_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_576_1:RecordName(arg_576_1.leftNameTxt_.text)
				SetActive(arg_576_1.iconTrs_.gameObject, false)
				arg_576_1.callingController_:SetSelectedState("normal")

				local var_579_11 = arg_576_1:GetWordFromCfg(413011140)
				local var_579_12 = arg_576_1:FormatText(var_579_11.content)

				arg_576_1.text_.text = var_579_12

				LuaForUtil.ClearLinePrefixSymbol(arg_576_1.text_)

				local var_579_13 = 43
				local var_579_14 = utf8.len(var_579_12)
				local var_579_15 = var_579_13 <= 0 and var_579_9 or var_579_9 * (var_579_14 / var_579_13)

				if var_579_15 > 0 and var_579_9 < var_579_15 then
					arg_576_1.talkMaxDuration = var_579_15

					if var_579_15 + var_579_8 > arg_576_1.duration_ then
						arg_576_1.duration_ = var_579_15 + var_579_8
					end
				end

				arg_576_1.text_.text = var_579_12
				arg_576_1.typewritter.percent = 0

				arg_576_1.typewritter:SetDirty()
				arg_576_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011140", "story_v_out_413011.awb") ~= 0 then
					local var_579_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011140", "story_v_out_413011.awb") / 1000

					if var_579_16 + var_579_8 > arg_576_1.duration_ then
						arg_576_1.duration_ = var_579_16 + var_579_8
					end

					if var_579_11.prefab_name ~= "" and arg_576_1.actors_[var_579_11.prefab_name] ~= nil then
						local var_579_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_576_1.actors_[var_579_11.prefab_name].transform, "story_v_out_413011", "413011140", "story_v_out_413011.awb")

						arg_576_1:RecordAudio("413011140", var_579_17)
						arg_576_1:RecordAudio("413011140", var_579_17)
					else
						arg_576_1:AudioAction("play", "voice", "story_v_out_413011", "413011140", "story_v_out_413011.awb")
					end

					arg_576_1:RecordHistoryTalkVoice("story_v_out_413011", "413011140", "story_v_out_413011.awb")
				end

				arg_576_1:RecordContent(arg_576_1.text_.text)
			end

			local var_579_18 = math.max(var_579_9, arg_576_1.talkMaxDuration)

			if var_579_8 <= arg_576_1.time_ and arg_576_1.time_ < var_579_8 + var_579_18 then
				arg_576_1.typewritter.percent = (arg_576_1.time_ - var_579_8) / var_579_18

				arg_576_1.typewritter:SetDirty()
			end

			if arg_576_1.time_ >= var_579_8 + var_579_18 and arg_576_1.time_ < var_579_8 + var_579_18 + arg_579_0 then
				arg_576_1.typewritter.percent = 1

				arg_576_1.typewritter:SetDirty()
				arg_576_1:ShowNextGo(true)
			end
		end
	end,
	Play413011141 = function(arg_580_0, arg_580_1)
		arg_580_1.time_ = 0
		arg_580_1.frameCnt_ = 0
		arg_580_1.state_ = "playing"
		arg_580_1.curTalkId_ = 413011141
		arg_580_1.duration_ = 12.2

		local var_580_0 = {
			zh = 3.633,
			ja = 12.2
		}
		local var_580_1 = manager.audio:GetLocalizationFlag()

		if var_580_0[var_580_1] ~= nil then
			arg_580_1.duration_ = var_580_0[var_580_1]
		end

		SetActive(arg_580_1.tipsGo_, false)

		function arg_580_1.onSingleLineFinish_()
			arg_580_1.onSingleLineUpdate_ = nil
			arg_580_1.onSingleLineFinish_ = nil
			arg_580_1.state_ = "waiting"
		end

		function arg_580_1.playNext_(arg_582_0)
			if arg_582_0 == 1 then
				arg_580_0:Play413011142(arg_580_1)
			end
		end

		function arg_580_1.onSingleLineUpdate_(arg_583_0)
			local var_583_0 = arg_580_1.actors_["10022"]
			local var_583_1 = 0

			if var_583_1 < arg_580_1.time_ and arg_580_1.time_ <= var_583_1 + arg_583_0 and not isNil(var_583_0) and arg_580_1.var_.actorSpriteComps10022 == nil then
				arg_580_1.var_.actorSpriteComps10022 = var_583_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_583_2 = 2

			if var_583_1 <= arg_580_1.time_ and arg_580_1.time_ < var_583_1 + var_583_2 and not isNil(var_583_0) then
				local var_583_3 = (arg_580_1.time_ - var_583_1) / var_583_2

				if arg_580_1.var_.actorSpriteComps10022 then
					for iter_583_0, iter_583_1 in pairs(arg_580_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_583_1 then
							if arg_580_1.isInRecall_ then
								local var_583_4 = Mathf.Lerp(iter_583_1.color.r, arg_580_1.hightColor2.r, var_583_3)
								local var_583_5 = Mathf.Lerp(iter_583_1.color.g, arg_580_1.hightColor2.g, var_583_3)
								local var_583_6 = Mathf.Lerp(iter_583_1.color.b, arg_580_1.hightColor2.b, var_583_3)

								iter_583_1.color = Color.New(var_583_4, var_583_5, var_583_6)
							else
								local var_583_7 = Mathf.Lerp(iter_583_1.color.r, 0.5, var_583_3)

								iter_583_1.color = Color.New(var_583_7, var_583_7, var_583_7)
							end
						end
					end
				end
			end

			if arg_580_1.time_ >= var_583_1 + var_583_2 and arg_580_1.time_ < var_583_1 + var_583_2 + arg_583_0 and not isNil(var_583_0) and arg_580_1.var_.actorSpriteComps10022 then
				for iter_583_2, iter_583_3 in pairs(arg_580_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_583_3 then
						if arg_580_1.isInRecall_ then
							iter_583_3.color = arg_580_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_583_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_580_1.var_.actorSpriteComps10022 = nil
			end

			local var_583_8 = 0
			local var_583_9 = 0.4

			if var_583_8 < arg_580_1.time_ and arg_580_1.time_ <= var_583_8 + arg_583_0 then
				arg_580_1.talkMaxDuration = 0
				arg_580_1.dialogCg_.alpha = 1

				arg_580_1.dialog_:SetActive(true)
				SetActive(arg_580_1.leftNameGo_, true)

				local var_583_10 = arg_580_1:FormatText(StoryNameCfg[259].name)

				arg_580_1.leftNameTxt_.text = var_583_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_580_1.leftNameTxt_.transform)

				arg_580_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_580_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_580_1:RecordName(arg_580_1.leftNameTxt_.text)
				SetActive(arg_580_1.iconTrs_.gameObject, false)
				arg_580_1.callingController_:SetSelectedState("normal")

				local var_583_11 = arg_580_1:GetWordFromCfg(413011141)
				local var_583_12 = arg_580_1:FormatText(var_583_11.content)

				arg_580_1.text_.text = var_583_12

				LuaForUtil.ClearLinePrefixSymbol(arg_580_1.text_)

				local var_583_13 = 16
				local var_583_14 = utf8.len(var_583_12)
				local var_583_15 = var_583_13 <= 0 and var_583_9 or var_583_9 * (var_583_14 / var_583_13)

				if var_583_15 > 0 and var_583_9 < var_583_15 then
					arg_580_1.talkMaxDuration = var_583_15

					if var_583_15 + var_583_8 > arg_580_1.duration_ then
						arg_580_1.duration_ = var_583_15 + var_583_8
					end
				end

				arg_580_1.text_.text = var_583_12
				arg_580_1.typewritter.percent = 0

				arg_580_1.typewritter:SetDirty()
				arg_580_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011141", "story_v_out_413011.awb") ~= 0 then
					local var_583_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011141", "story_v_out_413011.awb") / 1000

					if var_583_16 + var_583_8 > arg_580_1.duration_ then
						arg_580_1.duration_ = var_583_16 + var_583_8
					end

					if var_583_11.prefab_name ~= "" and arg_580_1.actors_[var_583_11.prefab_name] ~= nil then
						local var_583_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_580_1.actors_[var_583_11.prefab_name].transform, "story_v_out_413011", "413011141", "story_v_out_413011.awb")

						arg_580_1:RecordAudio("413011141", var_583_17)
						arg_580_1:RecordAudio("413011141", var_583_17)
					else
						arg_580_1:AudioAction("play", "voice", "story_v_out_413011", "413011141", "story_v_out_413011.awb")
					end

					arg_580_1:RecordHistoryTalkVoice("story_v_out_413011", "413011141", "story_v_out_413011.awb")
				end

				arg_580_1:RecordContent(arg_580_1.text_.text)
			end

			local var_583_18 = math.max(var_583_9, arg_580_1.talkMaxDuration)

			if var_583_8 <= arg_580_1.time_ and arg_580_1.time_ < var_583_8 + var_583_18 then
				arg_580_1.typewritter.percent = (arg_580_1.time_ - var_583_8) / var_583_18

				arg_580_1.typewritter:SetDirty()
			end

			if arg_580_1.time_ >= var_583_8 + var_583_18 and arg_580_1.time_ < var_583_8 + var_583_18 + arg_583_0 then
				arg_580_1.typewritter.percent = 1

				arg_580_1.typewritter:SetDirty()
				arg_580_1:ShowNextGo(true)
			end
		end
	end,
	Play413011142 = function(arg_584_0, arg_584_1)
		arg_584_1.time_ = 0
		arg_584_1.frameCnt_ = 0
		arg_584_1.state_ = "playing"
		arg_584_1.curTalkId_ = 413011142
		arg_584_1.duration_ = 4.1

		local var_584_0 = {
			zh = 2.5,
			ja = 4.1
		}
		local var_584_1 = manager.audio:GetLocalizationFlag()

		if var_584_0[var_584_1] ~= nil then
			arg_584_1.duration_ = var_584_0[var_584_1]
		end

		SetActive(arg_584_1.tipsGo_, false)

		function arg_584_1.onSingleLineFinish_()
			arg_584_1.onSingleLineUpdate_ = nil
			arg_584_1.onSingleLineFinish_ = nil
			arg_584_1.state_ = "waiting"
		end

		function arg_584_1.playNext_(arg_586_0)
			if arg_586_0 == 1 then
				arg_584_0:Play413011143(arg_584_1)
			end
		end

		function arg_584_1.onSingleLineUpdate_(arg_587_0)
			local var_587_0 = arg_584_1.actors_["10022"]
			local var_587_1 = 0

			if var_587_1 < arg_584_1.time_ and arg_584_1.time_ <= var_587_1 + arg_587_0 and not isNil(var_587_0) and arg_584_1.var_.actorSpriteComps10022 == nil then
				arg_584_1.var_.actorSpriteComps10022 = var_587_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_587_2 = 2

			if var_587_1 <= arg_584_1.time_ and arg_584_1.time_ < var_587_1 + var_587_2 and not isNil(var_587_0) then
				local var_587_3 = (arg_584_1.time_ - var_587_1) / var_587_2

				if arg_584_1.var_.actorSpriteComps10022 then
					for iter_587_0, iter_587_1 in pairs(arg_584_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_587_1 then
							if arg_584_1.isInRecall_ then
								local var_587_4 = Mathf.Lerp(iter_587_1.color.r, arg_584_1.hightColor1.r, var_587_3)
								local var_587_5 = Mathf.Lerp(iter_587_1.color.g, arg_584_1.hightColor1.g, var_587_3)
								local var_587_6 = Mathf.Lerp(iter_587_1.color.b, arg_584_1.hightColor1.b, var_587_3)

								iter_587_1.color = Color.New(var_587_4, var_587_5, var_587_6)
							else
								local var_587_7 = Mathf.Lerp(iter_587_1.color.r, 1, var_587_3)

								iter_587_1.color = Color.New(var_587_7, var_587_7, var_587_7)
							end
						end
					end
				end
			end

			if arg_584_1.time_ >= var_587_1 + var_587_2 and arg_584_1.time_ < var_587_1 + var_587_2 + arg_587_0 and not isNil(var_587_0) and arg_584_1.var_.actorSpriteComps10022 then
				for iter_587_2, iter_587_3 in pairs(arg_584_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_587_3 then
						if arg_584_1.isInRecall_ then
							iter_587_3.color = arg_584_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_587_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_584_1.var_.actorSpriteComps10022 = nil
			end

			local var_587_8 = arg_584_1.actors_["10022"].transform
			local var_587_9 = 0

			if var_587_9 < arg_584_1.time_ and arg_584_1.time_ <= var_587_9 + arg_587_0 then
				arg_584_1.var_.moveOldPos10022 = var_587_8.localPosition
				var_587_8.localScale = Vector3.New(1, 1, 1)

				arg_584_1:CheckSpriteTmpPos("10022", 2)

				local var_587_10 = var_587_8.childCount

				for iter_587_4 = 0, var_587_10 - 1 do
					local var_587_11 = var_587_8:GetChild(iter_587_4)

					if var_587_11.name == "split_3" or not string.find(var_587_11.name, "split") then
						var_587_11.gameObject:SetActive(true)
					else
						var_587_11.gameObject:SetActive(false)
					end
				end
			end

			local var_587_12 = 0.001

			if var_587_9 <= arg_584_1.time_ and arg_584_1.time_ < var_587_9 + var_587_12 then
				local var_587_13 = (arg_584_1.time_ - var_587_9) / var_587_12
				local var_587_14 = Vector3.New(-390, -315, -320)

				var_587_8.localPosition = Vector3.Lerp(arg_584_1.var_.moveOldPos10022, var_587_14, var_587_13)
			end

			if arg_584_1.time_ >= var_587_9 + var_587_12 and arg_584_1.time_ < var_587_9 + var_587_12 + arg_587_0 then
				var_587_8.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_587_15 = 0
			local var_587_16 = 0.275

			if var_587_15 < arg_584_1.time_ and arg_584_1.time_ <= var_587_15 + arg_587_0 then
				arg_584_1.talkMaxDuration = 0
				arg_584_1.dialogCg_.alpha = 1

				arg_584_1.dialog_:SetActive(true)
				SetActive(arg_584_1.leftNameGo_, true)

				local var_587_17 = arg_584_1:FormatText(StoryNameCfg[614].name)

				arg_584_1.leftNameTxt_.text = var_587_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_584_1.leftNameTxt_.transform)

				arg_584_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_584_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_584_1:RecordName(arg_584_1.leftNameTxt_.text)
				SetActive(arg_584_1.iconTrs_.gameObject, false)
				arg_584_1.callingController_:SetSelectedState("normal")

				local var_587_18 = arg_584_1:GetWordFromCfg(413011142)
				local var_587_19 = arg_584_1:FormatText(var_587_18.content)

				arg_584_1.text_.text = var_587_19

				LuaForUtil.ClearLinePrefixSymbol(arg_584_1.text_)

				local var_587_20 = 11
				local var_587_21 = utf8.len(var_587_19)
				local var_587_22 = var_587_20 <= 0 and var_587_16 or var_587_16 * (var_587_21 / var_587_20)

				if var_587_22 > 0 and var_587_16 < var_587_22 then
					arg_584_1.talkMaxDuration = var_587_22

					if var_587_22 + var_587_15 > arg_584_1.duration_ then
						arg_584_1.duration_ = var_587_22 + var_587_15
					end
				end

				arg_584_1.text_.text = var_587_19
				arg_584_1.typewritter.percent = 0

				arg_584_1.typewritter:SetDirty()
				arg_584_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011142", "story_v_out_413011.awb") ~= 0 then
					local var_587_23 = manager.audio:GetVoiceLength("story_v_out_413011", "413011142", "story_v_out_413011.awb") / 1000

					if var_587_23 + var_587_15 > arg_584_1.duration_ then
						arg_584_1.duration_ = var_587_23 + var_587_15
					end

					if var_587_18.prefab_name ~= "" and arg_584_1.actors_[var_587_18.prefab_name] ~= nil then
						local var_587_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_584_1.actors_[var_587_18.prefab_name].transform, "story_v_out_413011", "413011142", "story_v_out_413011.awb")

						arg_584_1:RecordAudio("413011142", var_587_24)
						arg_584_1:RecordAudio("413011142", var_587_24)
					else
						arg_584_1:AudioAction("play", "voice", "story_v_out_413011", "413011142", "story_v_out_413011.awb")
					end

					arg_584_1:RecordHistoryTalkVoice("story_v_out_413011", "413011142", "story_v_out_413011.awb")
				end

				arg_584_1:RecordContent(arg_584_1.text_.text)
			end

			local var_587_25 = math.max(var_587_16, arg_584_1.talkMaxDuration)

			if var_587_15 <= arg_584_1.time_ and arg_584_1.time_ < var_587_15 + var_587_25 then
				arg_584_1.typewritter.percent = (arg_584_1.time_ - var_587_15) / var_587_25

				arg_584_1.typewritter:SetDirty()
			end

			if arg_584_1.time_ >= var_587_15 + var_587_25 and arg_584_1.time_ < var_587_15 + var_587_25 + arg_587_0 then
				arg_584_1.typewritter.percent = 1

				arg_584_1.typewritter:SetDirty()
				arg_584_1:ShowNextGo(true)
			end
		end
	end,
	Play413011143 = function(arg_588_0, arg_588_1)
		arg_588_1.time_ = 0
		arg_588_1.frameCnt_ = 0
		arg_588_1.state_ = "playing"
		arg_588_1.curTalkId_ = 413011143
		arg_588_1.duration_ = 7.1

		local var_588_0 = {
			zh = 4,
			ja = 7.1
		}
		local var_588_1 = manager.audio:GetLocalizationFlag()

		if var_588_0[var_588_1] ~= nil then
			arg_588_1.duration_ = var_588_0[var_588_1]
		end

		SetActive(arg_588_1.tipsGo_, false)

		function arg_588_1.onSingleLineFinish_()
			arg_588_1.onSingleLineUpdate_ = nil
			arg_588_1.onSingleLineFinish_ = nil
			arg_588_1.state_ = "waiting"
		end

		function arg_588_1.playNext_(arg_590_0)
			if arg_590_0 == 1 then
				arg_588_0:Play413011144(arg_588_1)
			end
		end

		function arg_588_1.onSingleLineUpdate_(arg_591_0)
			local var_591_0 = arg_588_1.actors_["10022"]
			local var_591_1 = 0

			if var_591_1 < arg_588_1.time_ and arg_588_1.time_ <= var_591_1 + arg_591_0 and not isNil(var_591_0) and arg_588_1.var_.actorSpriteComps10022 == nil then
				arg_588_1.var_.actorSpriteComps10022 = var_591_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_591_2 = 2

			if var_591_1 <= arg_588_1.time_ and arg_588_1.time_ < var_591_1 + var_591_2 and not isNil(var_591_0) then
				local var_591_3 = (arg_588_1.time_ - var_591_1) / var_591_2

				if arg_588_1.var_.actorSpriteComps10022 then
					for iter_591_0, iter_591_1 in pairs(arg_588_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_591_1 then
							if arg_588_1.isInRecall_ then
								local var_591_4 = Mathf.Lerp(iter_591_1.color.r, arg_588_1.hightColor2.r, var_591_3)
								local var_591_5 = Mathf.Lerp(iter_591_1.color.g, arg_588_1.hightColor2.g, var_591_3)
								local var_591_6 = Mathf.Lerp(iter_591_1.color.b, arg_588_1.hightColor2.b, var_591_3)

								iter_591_1.color = Color.New(var_591_4, var_591_5, var_591_6)
							else
								local var_591_7 = Mathf.Lerp(iter_591_1.color.r, 0.5, var_591_3)

								iter_591_1.color = Color.New(var_591_7, var_591_7, var_591_7)
							end
						end
					end
				end
			end

			if arg_588_1.time_ >= var_591_1 + var_591_2 and arg_588_1.time_ < var_591_1 + var_591_2 + arg_591_0 and not isNil(var_591_0) and arg_588_1.var_.actorSpriteComps10022 then
				for iter_591_2, iter_591_3 in pairs(arg_588_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_591_3 then
						if arg_588_1.isInRecall_ then
							iter_591_3.color = arg_588_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_591_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_588_1.var_.actorSpriteComps10022 = nil
			end

			local var_591_8 = 0
			local var_591_9 = 0.375

			if var_591_8 < arg_588_1.time_ and arg_588_1.time_ <= var_591_8 + arg_591_0 then
				arg_588_1.talkMaxDuration = 0
				arg_588_1.dialogCg_.alpha = 1

				arg_588_1.dialog_:SetActive(true)
				SetActive(arg_588_1.leftNameGo_, true)

				local var_591_10 = arg_588_1:FormatText(StoryNameCfg[259].name)

				arg_588_1.leftNameTxt_.text = var_591_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_588_1.leftNameTxt_.transform)

				arg_588_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_588_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_588_1:RecordName(arg_588_1.leftNameTxt_.text)
				SetActive(arg_588_1.iconTrs_.gameObject, false)
				arg_588_1.callingController_:SetSelectedState("normal")

				local var_591_11 = arg_588_1:GetWordFromCfg(413011143)
				local var_591_12 = arg_588_1:FormatText(var_591_11.content)

				arg_588_1.text_.text = var_591_12

				LuaForUtil.ClearLinePrefixSymbol(arg_588_1.text_)

				local var_591_13 = 15
				local var_591_14 = utf8.len(var_591_12)
				local var_591_15 = var_591_13 <= 0 and var_591_9 or var_591_9 * (var_591_14 / var_591_13)

				if var_591_15 > 0 and var_591_9 < var_591_15 then
					arg_588_1.talkMaxDuration = var_591_15

					if var_591_15 + var_591_8 > arg_588_1.duration_ then
						arg_588_1.duration_ = var_591_15 + var_591_8
					end
				end

				arg_588_1.text_.text = var_591_12
				arg_588_1.typewritter.percent = 0

				arg_588_1.typewritter:SetDirty()
				arg_588_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011143", "story_v_out_413011.awb") ~= 0 then
					local var_591_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011143", "story_v_out_413011.awb") / 1000

					if var_591_16 + var_591_8 > arg_588_1.duration_ then
						arg_588_1.duration_ = var_591_16 + var_591_8
					end

					if var_591_11.prefab_name ~= "" and arg_588_1.actors_[var_591_11.prefab_name] ~= nil then
						local var_591_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_588_1.actors_[var_591_11.prefab_name].transform, "story_v_out_413011", "413011143", "story_v_out_413011.awb")

						arg_588_1:RecordAudio("413011143", var_591_17)
						arg_588_1:RecordAudio("413011143", var_591_17)
					else
						arg_588_1:AudioAction("play", "voice", "story_v_out_413011", "413011143", "story_v_out_413011.awb")
					end

					arg_588_1:RecordHistoryTalkVoice("story_v_out_413011", "413011143", "story_v_out_413011.awb")
				end

				arg_588_1:RecordContent(arg_588_1.text_.text)
			end

			local var_591_18 = math.max(var_591_9, arg_588_1.talkMaxDuration)

			if var_591_8 <= arg_588_1.time_ and arg_588_1.time_ < var_591_8 + var_591_18 then
				arg_588_1.typewritter.percent = (arg_588_1.time_ - var_591_8) / var_591_18

				arg_588_1.typewritter:SetDirty()
			end

			if arg_588_1.time_ >= var_591_8 + var_591_18 and arg_588_1.time_ < var_591_8 + var_591_18 + arg_591_0 then
				arg_588_1.typewritter.percent = 1

				arg_588_1.typewritter:SetDirty()
				arg_588_1:ShowNextGo(true)
			end
		end
	end,
	Play413011144 = function(arg_592_0, arg_592_1)
		arg_592_1.time_ = 0
		arg_592_1.frameCnt_ = 0
		arg_592_1.state_ = "playing"
		arg_592_1.curTalkId_ = 413011144
		arg_592_1.duration_ = 7.17

		local var_592_0 = {
			zh = 3.433,
			ja = 7.166
		}
		local var_592_1 = manager.audio:GetLocalizationFlag()

		if var_592_0[var_592_1] ~= nil then
			arg_592_1.duration_ = var_592_0[var_592_1]
		end

		SetActive(arg_592_1.tipsGo_, false)

		function arg_592_1.onSingleLineFinish_()
			arg_592_1.onSingleLineUpdate_ = nil
			arg_592_1.onSingleLineFinish_ = nil
			arg_592_1.state_ = "waiting"
		end

		function arg_592_1.playNext_(arg_594_0)
			if arg_594_0 == 1 then
				arg_592_0:Play413011145(arg_592_1)
			end
		end

		function arg_592_1.onSingleLineUpdate_(arg_595_0)
			local var_595_0 = 0
			local var_595_1 = 0.35

			if var_595_0 < arg_592_1.time_ and arg_592_1.time_ <= var_595_0 + arg_595_0 then
				arg_592_1.talkMaxDuration = 0
				arg_592_1.dialogCg_.alpha = 1

				arg_592_1.dialog_:SetActive(true)
				SetActive(arg_592_1.leftNameGo_, true)

				local var_595_2 = arg_592_1:FormatText(StoryNameCfg[259].name)

				arg_592_1.leftNameTxt_.text = var_595_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_592_1.leftNameTxt_.transform)

				arg_592_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_592_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_592_1:RecordName(arg_592_1.leftNameTxt_.text)
				SetActive(arg_592_1.iconTrs_.gameObject, false)
				arg_592_1.callingController_:SetSelectedState("normal")

				local var_595_3 = arg_592_1:GetWordFromCfg(413011144)
				local var_595_4 = arg_592_1:FormatText(var_595_3.content)

				arg_592_1.text_.text = var_595_4

				LuaForUtil.ClearLinePrefixSymbol(arg_592_1.text_)

				local var_595_5 = 14
				local var_595_6 = utf8.len(var_595_4)
				local var_595_7 = var_595_5 <= 0 and var_595_1 or var_595_1 * (var_595_6 / var_595_5)

				if var_595_7 > 0 and var_595_1 < var_595_7 then
					arg_592_1.talkMaxDuration = var_595_7

					if var_595_7 + var_595_0 > arg_592_1.duration_ then
						arg_592_1.duration_ = var_595_7 + var_595_0
					end
				end

				arg_592_1.text_.text = var_595_4
				arg_592_1.typewritter.percent = 0

				arg_592_1.typewritter:SetDirty()
				arg_592_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011144", "story_v_out_413011.awb") ~= 0 then
					local var_595_8 = manager.audio:GetVoiceLength("story_v_out_413011", "413011144", "story_v_out_413011.awb") / 1000

					if var_595_8 + var_595_0 > arg_592_1.duration_ then
						arg_592_1.duration_ = var_595_8 + var_595_0
					end

					if var_595_3.prefab_name ~= "" and arg_592_1.actors_[var_595_3.prefab_name] ~= nil then
						local var_595_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_592_1.actors_[var_595_3.prefab_name].transform, "story_v_out_413011", "413011144", "story_v_out_413011.awb")

						arg_592_1:RecordAudio("413011144", var_595_9)
						arg_592_1:RecordAudio("413011144", var_595_9)
					else
						arg_592_1:AudioAction("play", "voice", "story_v_out_413011", "413011144", "story_v_out_413011.awb")
					end

					arg_592_1:RecordHistoryTalkVoice("story_v_out_413011", "413011144", "story_v_out_413011.awb")
				end

				arg_592_1:RecordContent(arg_592_1.text_.text)
			end

			local var_595_10 = math.max(var_595_1, arg_592_1.talkMaxDuration)

			if var_595_0 <= arg_592_1.time_ and arg_592_1.time_ < var_595_0 + var_595_10 then
				arg_592_1.typewritter.percent = (arg_592_1.time_ - var_595_0) / var_595_10

				arg_592_1.typewritter:SetDirty()
			end

			if arg_592_1.time_ >= var_595_0 + var_595_10 and arg_592_1.time_ < var_595_0 + var_595_10 + arg_595_0 then
				arg_592_1.typewritter.percent = 1

				arg_592_1.typewritter:SetDirty()
				arg_592_1:ShowNextGo(true)
			end
		end
	end,
	Play413011145 = function(arg_596_0, arg_596_1)
		arg_596_1.time_ = 0
		arg_596_1.frameCnt_ = 0
		arg_596_1.state_ = "playing"
		arg_596_1.curTalkId_ = 413011145
		arg_596_1.duration_ = 3.81

		local var_596_0 = {
			zh = 3.775,
			ja = 3.808
		}
		local var_596_1 = manager.audio:GetLocalizationFlag()

		if var_596_0[var_596_1] ~= nil then
			arg_596_1.duration_ = var_596_0[var_596_1]
		end

		SetActive(arg_596_1.tipsGo_, false)

		function arg_596_1.onSingleLineFinish_()
			arg_596_1.onSingleLineUpdate_ = nil
			arg_596_1.onSingleLineFinish_ = nil
			arg_596_1.state_ = "waiting"
		end

		function arg_596_1.playNext_(arg_598_0)
			if arg_598_0 == 1 then
				arg_596_0:Play413011146(arg_596_1)
			end
		end

		function arg_596_1.onSingleLineUpdate_(arg_599_0)
			local var_599_0 = 0
			local var_599_1 = 0.266666666666667

			if var_599_0 < arg_596_1.time_ and arg_596_1.time_ <= var_599_0 + arg_599_0 then
				local var_599_2 = "play"
				local var_599_3 = "music"

				arg_596_1:AudioAction(var_599_2, var_599_3, "ui_battle", "ui_battle_stopbgm", "")

				local var_599_4 = ""
				local var_599_5 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_599_5 ~= "" then
					if arg_596_1.bgmTxt_.text ~= var_599_5 and arg_596_1.bgmTxt_.text ~= "" then
						if arg_596_1.bgmTxt2_.text ~= "" then
							arg_596_1.bgmTxt_.text = arg_596_1.bgmTxt2_.text
						end

						arg_596_1.bgmTxt2_.text = var_599_5

						arg_596_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_596_1.bgmTxt_.text = var_599_5
					end

					if arg_596_1.bgmTimer then
						arg_596_1.bgmTimer:Stop()

						arg_596_1.bgmTimer = nil
					end

					if arg_596_1.settingData.show_music_name == 1 then
						arg_596_1.musicController:SetSelectedState("show")
						arg_596_1.musicAnimator_:Play("open", 0, 0)

						if arg_596_1.settingData.music_time ~= 0 then
							arg_596_1.bgmTimer = TimeTools.StartAfterSeconds(tonumber(arg_596_1.settingData.music_time), function()
								if arg_596_1 == nil or isNil(arg_596_1.bgmTxt_) then
									return
								end

								arg_596_1.musicController:SetSelectedState("hide")
								arg_596_1.musicAnimator_:Play("back", 0, 0)
							end, {})
						end
					end
				end
			end

			local var_599_6 = arg_596_1.actors_["10022"].transform
			local var_599_7 = 0

			if var_599_7 < arg_596_1.time_ and arg_596_1.time_ <= var_599_7 + arg_599_0 then
				arg_596_1.var_.moveOldPos10022 = var_599_6.localPosition
				var_599_6.localScale = Vector3.New(1, 1, 1)

				arg_596_1:CheckSpriteTmpPos("10022", 3)

				local var_599_8 = var_599_6.childCount

				for iter_599_0 = 0, var_599_8 - 1 do
					local var_599_9 = var_599_6:GetChild(iter_599_0)

					if var_599_9.name == "split_1" or not string.find(var_599_9.name, "split") then
						var_599_9.gameObject:SetActive(true)
					else
						var_599_9.gameObject:SetActive(false)
					end
				end
			end

			local var_599_10 = 0.001

			if var_599_7 <= arg_596_1.time_ and arg_596_1.time_ < var_599_7 + var_599_10 then
				local var_599_11 = (arg_596_1.time_ - var_599_7) / var_599_10
				local var_599_12 = Vector3.New(0, -315, -320)

				var_599_6.localPosition = Vector3.Lerp(arg_596_1.var_.moveOldPos10022, var_599_12, var_599_11)
			end

			if arg_596_1.time_ >= var_599_7 + var_599_10 and arg_596_1.time_ < var_599_7 + var_599_10 + arg_599_0 then
				var_599_6.localPosition = Vector3.New(0, -315, -320)
			end

			local var_599_13 = arg_596_1.actors_["10094"].transform
			local var_599_14 = 0

			if var_599_14 < arg_596_1.time_ and arg_596_1.time_ <= var_599_14 + arg_599_0 then
				arg_596_1.var_.moveOldPos10094 = var_599_13.localPosition
				var_599_13.localScale = Vector3.New(1, 1, 1)

				arg_596_1:CheckSpriteTmpPos("10094", 7)

				local var_599_15 = var_599_13.childCount

				for iter_599_1 = 0, var_599_15 - 1 do
					local var_599_16 = var_599_13:GetChild(iter_599_1)

					if var_599_16.name == "split_1" or not string.find(var_599_16.name, "split") then
						var_599_16.gameObject:SetActive(true)
					else
						var_599_16.gameObject:SetActive(false)
					end
				end
			end

			local var_599_17 = 0.001

			if var_599_14 <= arg_596_1.time_ and arg_596_1.time_ < var_599_14 + var_599_17 then
				local var_599_18 = (arg_596_1.time_ - var_599_14) / var_599_17
				local var_599_19 = Vector3.New(0, -2000, 0)

				var_599_13.localPosition = Vector3.Lerp(arg_596_1.var_.moveOldPos10094, var_599_19, var_599_18)
			end

			if arg_596_1.time_ >= var_599_14 + var_599_17 and arg_596_1.time_ < var_599_14 + var_599_17 + arg_599_0 then
				var_599_13.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_599_20 = arg_596_1.actors_["10094"]
			local var_599_21 = 0

			if var_599_21 < arg_596_1.time_ and arg_596_1.time_ <= var_599_21 + arg_599_0 then
				local var_599_22 = var_599_20:GetComponentInChildren(typeof(CanvasGroup))

				if var_599_22 then
					arg_596_1.var_.alphaOldValue10094 = var_599_22.alpha
					arg_596_1.var_.characterEffect10094 = var_599_22
				end

				arg_596_1.var_.alphaOldValue10094 = 0
			end

			local var_599_23 = 1

			if var_599_21 <= arg_596_1.time_ and arg_596_1.time_ < var_599_21 + var_599_23 then
				local var_599_24 = (arg_596_1.time_ - var_599_21) / var_599_23
				local var_599_25 = Mathf.Lerp(arg_596_1.var_.alphaOldValue10094, 1, var_599_24)

				if arg_596_1.var_.characterEffect10094 then
					arg_596_1.var_.characterEffect10094.alpha = var_599_25
				end
			end

			if arg_596_1.time_ >= var_599_21 + var_599_23 and arg_596_1.time_ < var_599_21 + var_599_23 + arg_599_0 and arg_596_1.var_.characterEffect10094 then
				arg_596_1.var_.characterEffect10094.alpha = 1
			end

			local var_599_26 = arg_596_1.actors_["10094"]
			local var_599_27 = 0

			if var_599_27 < arg_596_1.time_ and arg_596_1.time_ <= var_599_27 + arg_599_0 then
				arg_596_1:SetSpriteNiuquEffect("10094", false)
			end

			if arg_596_1.frameCnt_ <= 1 then
				arg_596_1.dialog_:SetActive(false)
			end

			local var_599_28 = 0.775
			local var_599_29 = 0.225

			if var_599_28 < arg_596_1.time_ and arg_596_1.time_ <= var_599_28 + arg_599_0 then
				arg_596_1.talkMaxDuration = 0

				arg_596_1.dialog_:SetActive(true)

				local var_599_30 = LeanTween.value(arg_596_1.dialog_, 0, 1, 0.3)

				var_599_30:setOnUpdate(LuaHelper.FloatAction(function(arg_601_0)
					arg_596_1.dialogCg_.alpha = arg_601_0
				end))
				var_599_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_596_1.dialog_)
					var_599_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_596_1.duration_ = arg_596_1.duration_ + 0.3

				SetActive(arg_596_1.leftNameGo_, true)

				local var_599_31 = arg_596_1:FormatText(StoryNameCfg[997].name)

				arg_596_1.leftNameTxt_.text = var_599_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_596_1.leftNameTxt_.transform)

				arg_596_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_596_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_596_1:RecordName(arg_596_1.leftNameTxt_.text)
				SetActive(arg_596_1.iconTrs_.gameObject, true)
				arg_596_1.iconController_:SetSelectedState("hero")

				arg_596_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_596_1.callingController_:SetSelectedState("calling")

				arg_596_1.keyicon_.color = Color.New(1, 1, 1)
				arg_596_1.icon_.color = Color.New(1, 1, 1)

				local var_599_32 = arg_596_1:GetWordFromCfg(413011145)
				local var_599_33 = arg_596_1:FormatText(var_599_32.content)

				arg_596_1.text_.text = var_599_33

				LuaForUtil.ClearLinePrefixSymbol(arg_596_1.text_)

				local var_599_34 = 9
				local var_599_35 = utf8.len(var_599_33)
				local var_599_36 = var_599_34 <= 0 and var_599_29 or var_599_29 * (var_599_35 / var_599_34)

				if var_599_36 > 0 and var_599_29 < var_599_36 then
					arg_596_1.talkMaxDuration = var_599_36
					var_599_28 = var_599_28 + 0.3

					if var_599_36 + var_599_28 > arg_596_1.duration_ then
						arg_596_1.duration_ = var_599_36 + var_599_28
					end
				end

				arg_596_1.text_.text = var_599_33
				arg_596_1.typewritter.percent = 0

				arg_596_1.typewritter:SetDirty()
				arg_596_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011145", "story_v_out_413011.awb") ~= 0 then
					local var_599_37 = manager.audio:GetVoiceLength("story_v_out_413011", "413011145", "story_v_out_413011.awb") / 1000

					if var_599_37 + var_599_28 > arg_596_1.duration_ then
						arg_596_1.duration_ = var_599_37 + var_599_28
					end

					if var_599_32.prefab_name ~= "" and arg_596_1.actors_[var_599_32.prefab_name] ~= nil then
						local var_599_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_596_1.actors_[var_599_32.prefab_name].transform, "story_v_out_413011", "413011145", "story_v_out_413011.awb")

						arg_596_1:RecordAudio("413011145", var_599_38)
						arg_596_1:RecordAudio("413011145", var_599_38)
					else
						arg_596_1:AudioAction("play", "voice", "story_v_out_413011", "413011145", "story_v_out_413011.awb")
					end

					arg_596_1:RecordHistoryTalkVoice("story_v_out_413011", "413011145", "story_v_out_413011.awb")
				end

				arg_596_1:RecordContent(arg_596_1.text_.text)
			end

			local var_599_39 = var_599_28 + 0.3
			local var_599_40 = math.max(var_599_29, arg_596_1.talkMaxDuration)

			if var_599_39 <= arg_596_1.time_ and arg_596_1.time_ < var_599_39 + var_599_40 then
				arg_596_1.typewritter.percent = (arg_596_1.time_ - var_599_39) / var_599_40

				arg_596_1.typewritter:SetDirty()
			end

			if arg_596_1.time_ >= var_599_39 + var_599_40 and arg_596_1.time_ < var_599_39 + var_599_40 + arg_599_0 then
				arg_596_1.typewritter.percent = 1

				arg_596_1.typewritter:SetDirty()
				arg_596_1:ShowNextGo(true)
			end
		end
	end,
	Play413011146 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 413011146
		arg_603_1.duration_ = 2

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play413011147(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = arg_603_1.actors_["10022"]
			local var_606_1 = 0

			if var_606_1 < arg_603_1.time_ and arg_603_1.time_ <= var_606_1 + arg_606_0 and not isNil(var_606_0) and arg_603_1.var_.actorSpriteComps10022 == nil then
				arg_603_1.var_.actorSpriteComps10022 = var_606_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_606_2 = 2

			if var_606_1 <= arg_603_1.time_ and arg_603_1.time_ < var_606_1 + var_606_2 and not isNil(var_606_0) then
				local var_606_3 = (arg_603_1.time_ - var_606_1) / var_606_2

				if arg_603_1.var_.actorSpriteComps10022 then
					for iter_606_0, iter_606_1 in pairs(arg_603_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_606_1 then
							if arg_603_1.isInRecall_ then
								local var_606_4 = Mathf.Lerp(iter_606_1.color.r, arg_603_1.hightColor1.r, var_606_3)
								local var_606_5 = Mathf.Lerp(iter_606_1.color.g, arg_603_1.hightColor1.g, var_606_3)
								local var_606_6 = Mathf.Lerp(iter_606_1.color.b, arg_603_1.hightColor1.b, var_606_3)

								iter_606_1.color = Color.New(var_606_4, var_606_5, var_606_6)
							else
								local var_606_7 = Mathf.Lerp(iter_606_1.color.r, 1, var_606_3)

								iter_606_1.color = Color.New(var_606_7, var_606_7, var_606_7)
							end
						end
					end
				end
			end

			if arg_603_1.time_ >= var_606_1 + var_606_2 and arg_603_1.time_ < var_606_1 + var_606_2 + arg_606_0 and not isNil(var_606_0) and arg_603_1.var_.actorSpriteComps10022 then
				for iter_606_2, iter_606_3 in pairs(arg_603_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_606_3 then
						if arg_603_1.isInRecall_ then
							iter_606_3.color = arg_603_1.hightColor1 or Color.New(0.82, 0.77, 0.62)
						else
							iter_606_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_603_1.var_.actorSpriteComps10022 = nil
			end

			local var_606_8 = 0
			local var_606_9 = 0.125

			if var_606_8 < arg_603_1.time_ and arg_603_1.time_ <= var_606_8 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0
				arg_603_1.dialogCg_.alpha = 1

				arg_603_1.dialog_:SetActive(true)
				SetActive(arg_603_1.leftNameGo_, true)

				local var_606_10 = arg_603_1:FormatText(StoryNameCfg[614].name)

				arg_603_1.leftNameTxt_.text = var_606_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_603_1.leftNameTxt_.transform)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1.leftNameTxt_.text)
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_11 = arg_603_1:GetWordFromCfg(413011146)
				local var_606_12 = arg_603_1:FormatText(var_606_11.content)

				arg_603_1.text_.text = var_606_12

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_13 = 5
				local var_606_14 = utf8.len(var_606_12)
				local var_606_15 = var_606_13 <= 0 and var_606_9 or var_606_9 * (var_606_14 / var_606_13)

				if var_606_15 > 0 and var_606_9 < var_606_15 then
					arg_603_1.talkMaxDuration = var_606_15

					if var_606_15 + var_606_8 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_15 + var_606_8
					end
				end

				arg_603_1.text_.text = var_606_12
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011146", "story_v_out_413011.awb") ~= 0 then
					local var_606_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011146", "story_v_out_413011.awb") / 1000

					if var_606_16 + var_606_8 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_16 + var_606_8
					end

					if var_606_11.prefab_name ~= "" and arg_603_1.actors_[var_606_11.prefab_name] ~= nil then
						local var_606_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_603_1.actors_[var_606_11.prefab_name].transform, "story_v_out_413011", "413011146", "story_v_out_413011.awb")

						arg_603_1:RecordAudio("413011146", var_606_17)
						arg_603_1:RecordAudio("413011146", var_606_17)
					else
						arg_603_1:AudioAction("play", "voice", "story_v_out_413011", "413011146", "story_v_out_413011.awb")
					end

					arg_603_1:RecordHistoryTalkVoice("story_v_out_413011", "413011146", "story_v_out_413011.awb")
				end

				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_18 = math.max(var_606_9, arg_603_1.talkMaxDuration)

			if var_606_8 <= arg_603_1.time_ and arg_603_1.time_ < var_606_8 + var_606_18 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_8) / var_606_18

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_8 + var_606_18 and arg_603_1.time_ < var_606_8 + var_606_18 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play413011147 = function(arg_607_0, arg_607_1)
		arg_607_1.time_ = 0
		arg_607_1.frameCnt_ = 0
		arg_607_1.state_ = "playing"
		arg_607_1.curTalkId_ = 413011147
		arg_607_1.duration_ = 4.6

		local var_607_0 = {
			zh = 3,
			ja = 4.6
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
				arg_607_0:Play413011148(arg_607_1)
			end
		end

		function arg_607_1.onSingleLineUpdate_(arg_610_0)
			local var_610_0 = arg_607_1.actors_["10022"]
			local var_610_1 = 0

			if var_610_1 < arg_607_1.time_ and arg_607_1.time_ <= var_610_1 + arg_610_0 and not isNil(var_610_0) and arg_607_1.var_.actorSpriteComps10022 == nil then
				arg_607_1.var_.actorSpriteComps10022 = var_610_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_610_2 = 2

			if var_610_1 <= arg_607_1.time_ and arg_607_1.time_ < var_610_1 + var_610_2 and not isNil(var_610_0) then
				local var_610_3 = (arg_607_1.time_ - var_610_1) / var_610_2

				if arg_607_1.var_.actorSpriteComps10022 then
					for iter_610_0, iter_610_1 in pairs(arg_607_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_610_1 then
							if arg_607_1.isInRecall_ then
								local var_610_4 = Mathf.Lerp(iter_610_1.color.r, arg_607_1.hightColor2.r, var_610_3)
								local var_610_5 = Mathf.Lerp(iter_610_1.color.g, arg_607_1.hightColor2.g, var_610_3)
								local var_610_6 = Mathf.Lerp(iter_610_1.color.b, arg_607_1.hightColor2.b, var_610_3)

								iter_610_1.color = Color.New(var_610_4, var_610_5, var_610_6)
							else
								local var_610_7 = Mathf.Lerp(iter_610_1.color.r, 0.5, var_610_3)

								iter_610_1.color = Color.New(var_610_7, var_610_7, var_610_7)
							end
						end
					end
				end
			end

			if arg_607_1.time_ >= var_610_1 + var_610_2 and arg_607_1.time_ < var_610_1 + var_610_2 + arg_610_0 and not isNil(var_610_0) and arg_607_1.var_.actorSpriteComps10022 then
				for iter_610_2, iter_610_3 in pairs(arg_607_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_610_3 then
						if arg_607_1.isInRecall_ then
							iter_610_3.color = arg_607_1.hightColor2 or Color.New(0.46, 0.43, 0.35)
						else
							iter_610_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_607_1.var_.actorSpriteComps10022 = nil
			end

			local var_610_8 = 0
			local var_610_9 = 0.2

			if var_610_8 < arg_607_1.time_ and arg_607_1.time_ <= var_610_8 + arg_610_0 then
				arg_607_1.talkMaxDuration = 0
				arg_607_1.dialogCg_.alpha = 1

				arg_607_1.dialog_:SetActive(true)
				SetActive(arg_607_1.leftNameGo_, true)

				local var_610_10 = arg_607_1:FormatText(StoryNameCfg[997].name)

				arg_607_1.leftNameTxt_.text = var_610_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_607_1.leftNameTxt_.transform)

				arg_607_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_607_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_607_1:RecordName(arg_607_1.leftNameTxt_.text)
				SetActive(arg_607_1.iconTrs_.gameObject, true)
				arg_607_1.iconController_:SetSelectedState("hero")

				arg_607_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_607_1.callingController_:SetSelectedState("calling")

				arg_607_1.keyicon_.color = Color.New(1, 1, 1)
				arg_607_1.icon_.color = Color.New(1, 1, 1)

				local var_610_11 = arg_607_1:GetWordFromCfg(413011147)
				local var_610_12 = arg_607_1:FormatText(var_610_11.content)

				arg_607_1.text_.text = var_610_12

				LuaForUtil.ClearLinePrefixSymbol(arg_607_1.text_)

				local var_610_13 = 8
				local var_610_14 = utf8.len(var_610_12)
				local var_610_15 = var_610_13 <= 0 and var_610_9 or var_610_9 * (var_610_14 / var_610_13)

				if var_610_15 > 0 and var_610_9 < var_610_15 then
					arg_607_1.talkMaxDuration = var_610_15

					if var_610_15 + var_610_8 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_15 + var_610_8
					end
				end

				arg_607_1.text_.text = var_610_12
				arg_607_1.typewritter.percent = 0

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011147", "story_v_out_413011.awb") ~= 0 then
					local var_610_16 = manager.audio:GetVoiceLength("story_v_out_413011", "413011147", "story_v_out_413011.awb") / 1000

					if var_610_16 + var_610_8 > arg_607_1.duration_ then
						arg_607_1.duration_ = var_610_16 + var_610_8
					end

					if var_610_11.prefab_name ~= "" and arg_607_1.actors_[var_610_11.prefab_name] ~= nil then
						local var_610_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_607_1.actors_[var_610_11.prefab_name].transform, "story_v_out_413011", "413011147", "story_v_out_413011.awb")

						arg_607_1:RecordAudio("413011147", var_610_17)
						arg_607_1:RecordAudio("413011147", var_610_17)
					else
						arg_607_1:AudioAction("play", "voice", "story_v_out_413011", "413011147", "story_v_out_413011.awb")
					end

					arg_607_1:RecordHistoryTalkVoice("story_v_out_413011", "413011147", "story_v_out_413011.awb")
				end

				arg_607_1:RecordContent(arg_607_1.text_.text)
			end

			local var_610_18 = math.max(var_610_9, arg_607_1.talkMaxDuration)

			if var_610_8 <= arg_607_1.time_ and arg_607_1.time_ < var_610_8 + var_610_18 then
				arg_607_1.typewritter.percent = (arg_607_1.time_ - var_610_8) / var_610_18

				arg_607_1.typewritter:SetDirty()
			end

			if arg_607_1.time_ >= var_610_8 + var_610_18 and arg_607_1.time_ < var_610_8 + var_610_18 + arg_610_0 then
				arg_607_1.typewritter.percent = 1

				arg_607_1.typewritter:SetDirty()
				arg_607_1:ShowNextGo(true)
			end
		end
	end,
	Play413011148 = function(arg_611_0, arg_611_1)
		arg_611_1.time_ = 0
		arg_611_1.frameCnt_ = 0
		arg_611_1.state_ = "playing"
		arg_611_1.curTalkId_ = 413011148
		arg_611_1.duration_ = 5.83

		SetActive(arg_611_1.tipsGo_, false)

		function arg_611_1.onSingleLineFinish_()
			arg_611_1.onSingleLineUpdate_ = nil
			arg_611_1.onSingleLineFinish_ = nil
			arg_611_1.state_ = "waiting"
		end

		function arg_611_1.playNext_(arg_613_0)
			if arg_613_0 == 1 then
				arg_611_0:Play413011149(arg_611_1)
			end
		end

		function arg_611_1.onSingleLineUpdate_(arg_614_0)
			local var_614_0 = arg_611_1.actors_["10022"].transform
			local var_614_1 = 0

			if var_614_1 < arg_611_1.time_ and arg_611_1.time_ <= var_614_1 + arg_614_0 then
				arg_611_1.var_.moveOldPos10022 = var_614_0.localPosition
				var_614_0.localScale = Vector3.New(1, 1, 1)

				arg_611_1:CheckSpriteTmpPos("10022", 7)

				local var_614_2 = var_614_0.childCount

				for iter_614_0 = 0, var_614_2 - 1 do
					local var_614_3 = var_614_0:GetChild(iter_614_0)

					if var_614_3.name == "" or not string.find(var_614_3.name, "split") then
						var_614_3.gameObject:SetActive(true)
					else
						var_614_3.gameObject:SetActive(false)
					end
				end
			end

			local var_614_4 = 0.001

			if var_614_1 <= arg_611_1.time_ and arg_611_1.time_ < var_614_1 + var_614_4 then
				local var_614_5 = (arg_611_1.time_ - var_614_1) / var_614_4
				local var_614_6 = Vector3.New(0, -2000, 0)

				var_614_0.localPosition = Vector3.Lerp(arg_611_1.var_.moveOldPos10022, var_614_6, var_614_5)
			end

			if arg_611_1.time_ >= var_614_1 + var_614_4 and arg_611_1.time_ < var_614_1 + var_614_4 + arg_614_0 then
				var_614_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_614_7 = manager.ui.mainCamera.transform
			local var_614_8 = 0

			if var_614_8 < arg_611_1.time_ and arg_611_1.time_ <= var_614_8 + arg_614_0 then
				local var_614_9 = arg_611_1.var_.effectzasheng1

				if not var_614_9 then
					var_614_9 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_614_9.name = "zasheng1"
					arg_611_1.var_.effectzasheng1 = var_614_9
				end

				local var_614_10 = var_614_7:Find("")

				if var_614_10 then
					var_614_9.transform.parent = var_614_10
				else
					var_614_9.transform.parent = var_614_7
				end

				var_614_9.transform.localPosition = Vector3.New(0, 0, 0)
				var_614_9.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_614_11 = manager.ui.mainCamera.transform
			local var_614_12 = 1

			if var_614_12 < arg_611_1.time_ and arg_611_1.time_ <= var_614_12 + arg_614_0 then
				local var_614_13 = arg_611_1.var_.effectzasheng1

				if var_614_13 then
					Object.Destroy(var_614_13)

					arg_611_1.var_.effectzasheng1 = nil
				end
			end

			local var_614_14 = 0
			local var_614_15 = 1

			if var_614_14 < arg_611_1.time_ and arg_611_1.time_ <= var_614_14 + arg_614_0 then
				local var_614_16 = "play"
				local var_614_17 = "effect"

				arg_611_1:AudioAction(var_614_16, var_614_17, "se_story_130", "se_story_130_noise", "")
			end

			if arg_611_1.frameCnt_ <= 1 then
				arg_611_1.dialog_:SetActive(false)
			end

			local var_614_18 = 0.833333333333333
			local var_614_19 = 1.75

			if var_614_18 < arg_611_1.time_ and arg_611_1.time_ <= var_614_18 + arg_614_0 then
				arg_611_1.talkMaxDuration = 0

				arg_611_1.dialog_:SetActive(true)

				local var_614_20 = LeanTween.value(arg_611_1.dialog_, 0, 1, 0.3)

				var_614_20:setOnUpdate(LuaHelper.FloatAction(function(arg_615_0)
					arg_611_1.dialogCg_.alpha = arg_615_0
				end))
				var_614_20:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_611_1.dialog_)
					var_614_20:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_611_1.duration_ = arg_611_1.duration_ + 0.3

				SetActive(arg_611_1.leftNameGo_, false)

				arg_611_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_611_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_611_1:RecordName(arg_611_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_611_1.iconTrs_.gameObject, false)
				arg_611_1.callingController_:SetSelectedState("normal")

				local var_614_21 = arg_611_1:GetWordFromCfg(413011148)
				local var_614_22 = arg_611_1:FormatText(var_614_21.content)

				arg_611_1.text_.text = var_614_22

				LuaForUtil.ClearLinePrefixSymbol(arg_611_1.text_)

				local var_614_23 = 70
				local var_614_24 = utf8.len(var_614_22)
				local var_614_25 = var_614_23 <= 0 and var_614_19 or var_614_19 * (var_614_24 / var_614_23)

				if var_614_25 > 0 and var_614_19 < var_614_25 then
					arg_611_1.talkMaxDuration = var_614_25
					var_614_18 = var_614_18 + 0.3

					if var_614_25 + var_614_18 > arg_611_1.duration_ then
						arg_611_1.duration_ = var_614_25 + var_614_18
					end
				end

				arg_611_1.text_.text = var_614_22
				arg_611_1.typewritter.percent = 0

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(false)
				arg_611_1:RecordContent(arg_611_1.text_.text)
			end

			local var_614_26 = var_614_18 + 0.3
			local var_614_27 = math.max(var_614_19, arg_611_1.talkMaxDuration)

			if var_614_26 <= arg_611_1.time_ and arg_611_1.time_ < var_614_26 + var_614_27 then
				arg_611_1.typewritter.percent = (arg_611_1.time_ - var_614_26) / var_614_27

				arg_611_1.typewritter:SetDirty()
			end

			if arg_611_1.time_ >= var_614_26 + var_614_27 and arg_611_1.time_ < var_614_26 + var_614_27 + arg_614_0 then
				arg_611_1.typewritter.percent = 1

				arg_611_1.typewritter:SetDirty()
				arg_611_1:ShowNextGo(true)
			end
		end
	end,
	Play413011149 = function(arg_617_0, arg_617_1)
		arg_617_1.time_ = 0
		arg_617_1.frameCnt_ = 0
		arg_617_1.state_ = "playing"
		arg_617_1.curTalkId_ = 413011149
		arg_617_1.duration_ = 5

		SetActive(arg_617_1.tipsGo_, false)

		function arg_617_1.onSingleLineFinish_()
			arg_617_1.onSingleLineUpdate_ = nil
			arg_617_1.onSingleLineFinish_ = nil
			arg_617_1.state_ = "waiting"
		end

		function arg_617_1.playNext_(arg_619_0)
			if arg_619_0 == 1 then
				arg_617_0:Play413011150(arg_617_1)
			end
		end

		function arg_617_1.onSingleLineUpdate_(arg_620_0)
			local var_620_0 = 0.666666666666667
			local var_620_1 = 0.858333333333333

			if var_620_0 < arg_617_1.time_ and arg_617_1.time_ <= var_620_0 + arg_620_0 then
				local var_620_2 = "play"
				local var_620_3 = "effect"

				arg_617_1:AudioAction(var_620_2, var_620_3, "se_story_side_1028", "se_story_1028_warning", "")
			end

			local var_620_4 = 0
			local var_620_5 = 1.525

			if var_620_4 < arg_617_1.time_ and arg_617_1.time_ <= var_620_4 + arg_620_0 then
				arg_617_1.talkMaxDuration = 0
				arg_617_1.dialogCg_.alpha = 1

				arg_617_1.dialog_:SetActive(true)
				SetActive(arg_617_1.leftNameGo_, false)

				arg_617_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_617_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_617_1:RecordName(arg_617_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_617_1.iconTrs_.gameObject, false)
				arg_617_1.callingController_:SetSelectedState("normal")

				local var_620_6 = arg_617_1:GetWordFromCfg(413011149)
				local var_620_7 = arg_617_1:FormatText(var_620_6.content)

				arg_617_1.text_.text = var_620_7

				LuaForUtil.ClearLinePrefixSymbol(arg_617_1.text_)

				local var_620_8 = 61
				local var_620_9 = utf8.len(var_620_7)
				local var_620_10 = var_620_8 <= 0 and var_620_5 or var_620_5 * (var_620_9 / var_620_8)

				if var_620_10 > 0 and var_620_5 < var_620_10 then
					arg_617_1.talkMaxDuration = var_620_10

					if var_620_10 + var_620_4 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_10 + var_620_4
					end
				end

				arg_617_1.text_.text = var_620_7
				arg_617_1.typewritter.percent = 0

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(false)
				arg_617_1:RecordContent(arg_617_1.text_.text)
			end

			local var_620_11 = math.max(var_620_5, arg_617_1.talkMaxDuration)

			if var_620_4 <= arg_617_1.time_ and arg_617_1.time_ < var_620_4 + var_620_11 then
				arg_617_1.typewritter.percent = (arg_617_1.time_ - var_620_4) / var_620_11

				arg_617_1.typewritter:SetDirty()
			end

			if arg_617_1.time_ >= var_620_4 + var_620_11 and arg_617_1.time_ < var_620_4 + var_620_11 + arg_620_0 then
				arg_617_1.typewritter.percent = 1

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(true)
			end
		end
	end,
	Play413011150 = function(arg_621_0, arg_621_1)
		arg_621_1.time_ = 0
		arg_621_1.frameCnt_ = 0
		arg_621_1.state_ = "playing"
		arg_621_1.curTalkId_ = 413011150
		arg_621_1.duration_ = 2.5

		local var_621_0 = {
			zh = 0.999999999999,
			ja = 2.5
		}
		local var_621_1 = manager.audio:GetLocalizationFlag()

		if var_621_0[var_621_1] ~= nil then
			arg_621_1.duration_ = var_621_0[var_621_1]
		end

		SetActive(arg_621_1.tipsGo_, false)

		function arg_621_1.onSingleLineFinish_()
			arg_621_1.onSingleLineUpdate_ = nil
			arg_621_1.onSingleLineFinish_ = nil
			arg_621_1.state_ = "waiting"
			arg_621_1.auto_ = false
		end

		function arg_621_1.playNext_(arg_623_0)
			arg_621_1.onStoryFinished_()
		end

		function arg_621_1.onSingleLineUpdate_(arg_624_0)
			local var_624_0 = manager.ui.mainCamera.transform
			local var_624_1 = 0

			if var_624_1 < arg_621_1.time_ and arg_621_1.time_ <= var_624_1 + arg_624_0 then
				arg_621_1.var_.shakeOldPos = var_624_0.localPosition
			end

			local var_624_2 = 1

			if var_624_1 <= arg_621_1.time_ and arg_621_1.time_ < var_624_1 + var_624_2 then
				local var_624_3 = (arg_621_1.time_ - var_624_1) / 0.066
				local var_624_4, var_624_5 = math.modf(var_624_3)

				var_624_0.localPosition = Vector3.New(var_624_5 * 0.13, var_624_5 * 0.13, var_624_5 * 0.13) + arg_621_1.var_.shakeOldPos
			end

			if arg_621_1.time_ >= var_624_1 + var_624_2 and arg_621_1.time_ < var_624_1 + var_624_2 + arg_624_0 then
				var_624_0.localPosition = arg_621_1.var_.shakeOldPos
			end

			local var_624_6 = 0

			if var_624_6 < arg_621_1.time_ and arg_621_1.time_ <= var_624_6 + arg_624_0 then
				arg_621_1.allBtn_.enabled = false
			end

			local var_624_7 = 1

			if arg_621_1.time_ >= var_624_6 + var_624_7 and arg_621_1.time_ < var_624_6 + var_624_7 + arg_624_0 then
				arg_621_1.allBtn_.enabled = true
			end

			local var_624_8 = 0
			local var_624_9 = 1

			if var_624_8 < arg_621_1.time_ and arg_621_1.time_ <= var_624_8 + arg_624_0 then
				local var_624_10 = "play"
				local var_624_11 = "effect"

				arg_621_1:AudioAction(var_624_10, var_624_11, "se_story_1211", "se_story_1211_explosionfar", "")
			end

			local var_624_12 = 0
			local var_624_13 = 0.075

			if var_624_12 < arg_621_1.time_ and arg_621_1.time_ <= var_624_12 + arg_624_0 then
				arg_621_1.talkMaxDuration = 0
				arg_621_1.dialogCg_.alpha = 1

				arg_621_1.dialog_:SetActive(true)
				SetActive(arg_621_1.leftNameGo_, true)

				local var_624_14 = arg_621_1:FormatText(StoryNameCfg[998].name)

				arg_621_1.leftNameTxt_.text = var_624_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_621_1.leftNameTxt_.transform)

				arg_621_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_621_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_621_1:RecordName(arg_621_1.leftNameTxt_.text)
				SetActive(arg_621_1.iconTrs_.gameObject, true)
				arg_621_1.iconController_:SetSelectedState("hero")

				arg_621_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightwoman1")

				arg_621_1.callingController_:SetSelectedState("normal")

				arg_621_1.keyicon_.color = Color.New(1, 1, 1)
				arg_621_1.icon_.color = Color.New(1, 1, 1)

				local var_624_15 = arg_621_1:GetWordFromCfg(413011150)
				local var_624_16 = arg_621_1:FormatText(var_624_15.content)

				arg_621_1.text_.text = var_624_16

				LuaForUtil.ClearLinePrefixSymbol(arg_621_1.text_)

				local var_624_17 = 3
				local var_624_18 = utf8.len(var_624_16)
				local var_624_19 = var_624_17 <= 0 and var_624_13 or var_624_13 * (var_624_18 / var_624_17)

				if var_624_19 > 0 and var_624_13 < var_624_19 then
					arg_621_1.talkMaxDuration = var_624_19

					if var_624_19 + var_624_12 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_19 + var_624_12
					end
				end

				arg_621_1.text_.text = var_624_16
				arg_621_1.typewritter.percent = 0

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413011", "413011150", "story_v_out_413011.awb") ~= 0 then
					local var_624_20 = manager.audio:GetVoiceLength("story_v_out_413011", "413011150", "story_v_out_413011.awb") / 1000

					if var_624_20 + var_624_12 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_20 + var_624_12
					end

					if var_624_15.prefab_name ~= "" and arg_621_1.actors_[var_624_15.prefab_name] ~= nil then
						local var_624_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_621_1.actors_[var_624_15.prefab_name].transform, "story_v_out_413011", "413011150", "story_v_out_413011.awb")

						arg_621_1:RecordAudio("413011150", var_624_21)
						arg_621_1:RecordAudio("413011150", var_624_21)
					else
						arg_621_1:AudioAction("play", "voice", "story_v_out_413011", "413011150", "story_v_out_413011.awb")
					end

					arg_621_1:RecordHistoryTalkVoice("story_v_out_413011", "413011150", "story_v_out_413011.awb")
				end

				arg_621_1:RecordContent(arg_621_1.text_.text)
			end

			local var_624_22 = math.max(var_624_13, arg_621_1.talkMaxDuration)

			if var_624_12 <= arg_621_1.time_ and arg_621_1.time_ < var_624_12 + var_624_22 then
				arg_621_1.typewritter.percent = (arg_621_1.time_ - var_624_12) / var_624_22

				arg_621_1.typewritter:SetDirty()
			end

			if arg_621_1.time_ >= var_624_12 + var_624_22 and arg_621_1.time_ < var_624_12 + var_624_22 + arg_624_0 then
				arg_621_1.typewritter.percent = 1

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F08l",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST21",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F10f"
	},
	voices = {
		"story_v_out_413011.awb"
	}
}
