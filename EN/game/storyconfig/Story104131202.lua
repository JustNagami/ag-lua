﻿return {
	Play413122001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 413122001
		arg_1_1.duration_ = 7.83

		local var_1_0 = {
			zh = 6.333,
			ja = 7.833
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
				arg_1_0:Play413122002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST0603a"

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
				local var_4_5 = arg_1_1.bgs_.ST0603a

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
					if iter_4_0 ~= "ST0603a" then
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

			local var_4_24 = "10092_1"

			if arg_1_1.actors_[var_4_24] == nil then
				local var_4_25 = Object.Instantiate(Asset.Load("Widget/System/Story/StoryExpression/" .. var_4_24), arg_1_1.canvasGo_.transform)

				var_4_25.transform:SetSiblingIndex(1)

				var_4_25.name = var_4_24
				var_4_25.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_24] = var_4_25

				local var_4_26 = var_4_25:GetComponentsInChildren(typeof(Image), true):ToTable()

				if arg_1_1.isInRecall_ then
					for iter_4_2, iter_4_3 in ipairs(var_4_26) do
						iter_4_3.color = Color.New(0.82, 0.77, 0.62)
					end
				end
			end

			local var_4_27 = arg_1_1.actors_["10092_1"].transform
			local var_4_28 = 1.8

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.var_.moveOldPos10092_1 = var_4_27.localPosition
				var_4_27.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10092_1", 2)

				local var_4_29 = var_4_27.childCount

				for iter_4_4 = 0, var_4_29 - 1 do
					local var_4_30 = var_4_27:GetChild(iter_4_4)

					if var_4_30.name == "" or not string.find(var_4_30.name, "split") then
						var_4_30.gameObject:SetActive(true)
					else
						var_4_30.gameObject:SetActive(false)
					end
				end
			end

			local var_4_31 = 0.001

			if var_4_28 <= arg_1_1.time_ and arg_1_1.time_ < var_4_28 + var_4_31 then
				local var_4_32 = (arg_1_1.time_ - var_4_28) / var_4_31
				local var_4_33 = Vector3.New(-389.49, -300, -295)

				var_4_27.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10092_1, var_4_33, var_4_32)
			end

			if arg_1_1.time_ >= var_4_28 + var_4_31 and arg_1_1.time_ < var_4_28 + var_4_31 + arg_4_0 then
				var_4_27.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_4_34 = arg_1_1.actors_["10092_1"]
			local var_4_35 = 1.8

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 and arg_1_1.var_.actorSpriteComps10092_1 == nil then
				arg_1_1.var_.actorSpriteComps10092_1 = var_4_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_36 = 2

			if var_4_35 <= arg_1_1.time_ and arg_1_1.time_ < var_4_35 + var_4_36 then
				local var_4_37 = (arg_1_1.time_ - var_4_35) / var_4_36

				if arg_1_1.var_.actorSpriteComps10092_1 then
					for iter_4_5, iter_4_6 in pairs(arg_1_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_4_6 then
							if arg_1_1.isInRecall_ then
								local var_4_38 = Mathf.Lerp(iter_4_6.color.r, 0.82, var_4_37)
								local var_4_39 = Mathf.Lerp(iter_4_6.color.g, 0.77, var_4_37)
								local var_4_40 = Mathf.Lerp(iter_4_6.color.b, 0.62, var_4_37)

								iter_4_6.color = Color.New(var_4_38, var_4_39, var_4_40)
							else
								local var_4_41 = Mathf.Lerp(iter_4_6.color.r, 1, var_4_37)

								iter_4_6.color = Color.New(var_4_41, var_4_41, var_4_41)
							end
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_35 + var_4_36 and arg_1_1.time_ < var_4_35 + var_4_36 + arg_4_0 and arg_1_1.var_.actorSpriteComps10092_1 then
				for iter_4_7, iter_4_8 in pairs(arg_1_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_4_8 then
						if arg_1_1.isInRecall_ then
							iter_4_8.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_4_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_1_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_4_42 = arg_1_1.actors_["10092_1"]
			local var_4_43 = 1.8

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_44 = var_4_42:GetComponentInChildren(typeof(CanvasGroup))

				if var_4_44 then
					arg_1_1.var_.alphaOldValue10092_1 = var_4_44.alpha
					arg_1_1.var_.characterEffect10092_1 = var_4_44
				end

				arg_1_1.var_.alphaOldValue10092_1 = 0
			end

			local var_4_45 = 0.2

			if var_4_43 <= arg_1_1.time_ and arg_1_1.time_ < var_4_43 + var_4_45 then
				local var_4_46 = (arg_1_1.time_ - var_4_43) / var_4_45
				local var_4_47 = Mathf.Lerp(arg_1_1.var_.alphaOldValue10092_1, 1, var_4_46)

				if arg_1_1.var_.characterEffect10092_1 then
					arg_1_1.var_.characterEffect10092_1.alpha = var_4_47
				end
			end

			if arg_1_1.time_ >= var_4_43 + var_4_45 and arg_1_1.time_ < var_4_43 + var_4_45 + arg_4_0 and arg_1_1.var_.characterEffect10092_1 then
				arg_1_1.var_.characterEffect10092_1.alpha = 1
			end

			local var_4_48 = 0
			local var_4_49 = 0.433333333333333

			if var_4_48 < arg_1_1.time_ and arg_1_1.time_ <= var_4_48 + arg_4_0 then
				local var_4_50 = "play"
				local var_4_51 = "music"

				arg_1_1:AudioAction(var_4_50, var_4_51, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_52 = ""
				local var_4_53 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_53 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_53 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_53

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_53
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

			local var_4_54 = 1.26666666666667
			local var_4_55 = 1

			if var_4_54 < arg_1_1.time_ and arg_1_1.time_ <= var_4_54 + arg_4_0 then
				local var_4_56 = "play"
				local var_4_57 = "music"

				arg_1_1:AudioAction(var_4_56, var_4_57, "bgm_activity_3_0_story_intense_piano", "bgm_activity_3_0_story_intense_piano", "bgm_activity_3_0_story_intense_piano.awb")

				local var_4_58 = ""
				local var_4_59 = manager.audio:GetAudioName("bgm_activity_3_0_story_intense_piano", "bgm_activity_3_0_story_intense_piano")

				if var_4_59 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_59 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_59

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_59
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

			local var_4_60 = 0

			arg_1_1.isInRecall_ = false

			if var_4_60 < arg_1_1.time_ and arg_1_1.time_ <= var_4_60 + arg_4_0 then
				arg_1_1.screenFilterGo_:SetActive(false)

				for iter_4_9, iter_4_10 in pairs(arg_1_1.actors_) do
					local var_4_61 = iter_4_10:GetComponentsInChildren(typeof(Image), true):ToTable()

					for iter_4_11, iter_4_12 in ipairs(var_4_61) do
						if iter_4_12.color.r > 0.51 then
							iter_4_12.color = Color.New(1, 1, 1)
						else
							iter_4_12.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end
			end

			local var_4_62 = 0.2

			if var_4_60 <= arg_1_1.time_ and arg_1_1.time_ < var_4_60 + var_4_62 then
				local var_4_63 = (arg_1_1.time_ - var_4_60) / var_4_62

				arg_1_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_4_63)
			end

			if arg_1_1.time_ >= var_4_60 + var_4_62 and arg_1_1.time_ < var_4_60 + var_4_62 + arg_4_0 then
				arg_1_1.screenFilterEffect_.weight = 0
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_64 = 2.2
			local var_4_65 = 0.35

			if var_4_64 < arg_1_1.time_ and arg_1_1.time_ <= var_4_64 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_66 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_66:setOnUpdate(LuaHelper.FloatAction(function(arg_7_0)
					arg_1_1.dialogCg_.alpha = arg_7_0
				end))
				var_4_66:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_66:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_67 = arg_1_1:FormatText(StoryNameCfg[996].name)

				arg_1_1.leftNameTxt_.text = var_4_67

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_68 = arg_1_1:GetWordFromCfg(413122001)
				local var_4_69 = arg_1_1:FormatText(var_4_68.content)

				arg_1_1.text_.text = var_4_69

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_70 = 14
				local var_4_71 = utf8.len(var_4_69)
				local var_4_72 = var_4_70 <= 0 and var_4_65 or var_4_65 * (var_4_71 / var_4_70)

				if var_4_72 > 0 and var_4_65 < var_4_72 then
					arg_1_1.talkMaxDuration = var_4_72
					var_4_64 = var_4_64 + 0.3

					if var_4_72 + var_4_64 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_72 + var_4_64
					end
				end

				arg_1_1.text_.text = var_4_69
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122001", "story_v_out_413122.awb") ~= 0 then
					local var_4_73 = manager.audio:GetVoiceLength("story_v_out_413122", "413122001", "story_v_out_413122.awb") / 1000

					if var_4_73 + var_4_64 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_73 + var_4_64
					end

					if var_4_68.prefab_name ~= "" and arg_1_1.actors_[var_4_68.prefab_name] ~= nil then
						local var_4_74 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_68.prefab_name].transform, "story_v_out_413122", "413122001", "story_v_out_413122.awb")

						arg_1_1:RecordAudio("413122001", var_4_74)
						arg_1_1:RecordAudio("413122001", var_4_74)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_413122", "413122001", "story_v_out_413122.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_413122", "413122001", "story_v_out_413122.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_75 = var_4_64 + 0.3
			local var_4_76 = math.max(var_4_65, arg_1_1.talkMaxDuration)

			if var_4_75 <= arg_1_1.time_ and arg_1_1.time_ < var_4_75 + var_4_76 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_75) / var_4_76

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_75 + var_4_76 and arg_1_1.time_ < var_4_75 + var_4_76 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play413122002 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 413122002
		arg_9_1.duration_ = 5.73

		local var_9_0 = {
			zh = 3.366,
			ja = 5.733
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
				arg_9_0:Play413122003(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = "10093"

			if arg_9_1.actors_[var_12_0] == nil then
				local var_12_1 = Object.Instantiate(Asset.Load("Widget/System/Story/StoryExpression/" .. var_12_0), arg_9_1.canvasGo_.transform)

				var_12_1.transform:SetSiblingIndex(1)

				var_12_1.name = var_12_0
				var_12_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_9_1.actors_[var_12_0] = var_12_1

				local var_12_2 = var_12_1:GetComponentsInChildren(typeof(Image), true):ToTable()

				if arg_9_1.isInRecall_ then
					for iter_12_0, iter_12_1 in ipairs(var_12_2) do
						iter_12_1.color = Color.New(0.82, 0.77, 0.62)
					end
				end
			end

			local var_12_3 = arg_9_1.actors_["10093"].transform
			local var_12_4 = 0

			if var_12_4 < arg_9_1.time_ and arg_9_1.time_ <= var_12_4 + arg_12_0 then
				arg_9_1.var_.moveOldPos10093 = var_12_3.localPosition
				var_12_3.localScale = Vector3.New(1, 1, 1)

				arg_9_1:CheckSpriteTmpPos("10093", 4)

				local var_12_5 = var_12_3.childCount

				for iter_12_2 = 0, var_12_5 - 1 do
					local var_12_6 = var_12_3:GetChild(iter_12_2)

					if var_12_6.name == "split_4" or not string.find(var_12_6.name, "split") then
						var_12_6.gameObject:SetActive(true)
					else
						var_12_6.gameObject:SetActive(false)
					end
				end
			end

			local var_12_7 = 0.001

			if var_12_4 <= arg_9_1.time_ and arg_9_1.time_ < var_12_4 + var_12_7 then
				local var_12_8 = (arg_9_1.time_ - var_12_4) / var_12_7
				local var_12_9 = Vector3.New(390, -345, -245)

				var_12_3.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos10093, var_12_9, var_12_8)
			end

			if arg_9_1.time_ >= var_12_4 + var_12_7 and arg_9_1.time_ < var_12_4 + var_12_7 + arg_12_0 then
				var_12_3.localPosition = Vector3.New(390, -345, -245)
			end

			local var_12_10 = arg_9_1.actors_["10092_1"].transform
			local var_12_11 = 0

			if var_12_11 < arg_9_1.time_ and arg_9_1.time_ <= var_12_11 + arg_12_0 then
				arg_9_1.var_.moveOldPos10092_1 = var_12_10.localPosition
				var_12_10.localScale = Vector3.New(1, 1, 1)

				arg_9_1:CheckSpriteTmpPos("10092_1", 2)

				local var_12_12 = var_12_10.childCount

				for iter_12_3 = 0, var_12_12 - 1 do
					local var_12_13 = var_12_10:GetChild(iter_12_3)

					if var_12_13.name == "" or not string.find(var_12_13.name, "split") then
						var_12_13.gameObject:SetActive(true)
					else
						var_12_13.gameObject:SetActive(false)
					end
				end
			end

			local var_12_14 = 0.001

			if var_12_11 <= arg_9_1.time_ and arg_9_1.time_ < var_12_11 + var_12_14 then
				local var_12_15 = (arg_9_1.time_ - var_12_11) / var_12_14
				local var_12_16 = Vector3.New(-389.49, -300, -295)

				var_12_10.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos10092_1, var_12_16, var_12_15)
			end

			if arg_9_1.time_ >= var_12_11 + var_12_14 and arg_9_1.time_ < var_12_11 + var_12_14 + arg_12_0 then
				var_12_10.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_12_17 = arg_9_1.actors_["10093"]
			local var_12_18 = 0

			if var_12_18 < arg_9_1.time_ and arg_9_1.time_ <= var_12_18 + arg_12_0 and arg_9_1.var_.actorSpriteComps10093 == nil then
				arg_9_1.var_.actorSpriteComps10093 = var_12_17:GetComponentsInChildren(typeof(Image), true)
			end

			local var_12_19 = 2

			if var_12_18 <= arg_9_1.time_ and arg_9_1.time_ < var_12_18 + var_12_19 then
				local var_12_20 = (arg_9_1.time_ - var_12_18) / var_12_19

				if arg_9_1.var_.actorSpriteComps10093 then
					for iter_12_4, iter_12_5 in pairs(arg_9_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_12_5 then
							if arg_9_1.isInRecall_ then
								local var_12_21 = Mathf.Lerp(iter_12_5.color.r, 0.82, var_12_20)
								local var_12_22 = Mathf.Lerp(iter_12_5.color.g, 0.77, var_12_20)
								local var_12_23 = Mathf.Lerp(iter_12_5.color.b, 0.62, var_12_20)

								iter_12_5.color = Color.New(var_12_21, var_12_22, var_12_23)
							else
								local var_12_24 = Mathf.Lerp(iter_12_5.color.r, 1, var_12_20)

								iter_12_5.color = Color.New(var_12_24, var_12_24, var_12_24)
							end
						end
					end
				end
			end

			if arg_9_1.time_ >= var_12_18 + var_12_19 and arg_9_1.time_ < var_12_18 + var_12_19 + arg_12_0 and arg_9_1.var_.actorSpriteComps10093 then
				for iter_12_6, iter_12_7 in pairs(arg_9_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_12_7 then
						if arg_9_1.isInRecall_ then
							iter_12_7.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_12_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_9_1.var_.actorSpriteComps10093 = nil
			end

			local var_12_25 = arg_9_1.actors_["10092_1"]
			local var_12_26 = 0

			if var_12_26 < arg_9_1.time_ and arg_9_1.time_ <= var_12_26 + arg_12_0 and arg_9_1.var_.actorSpriteComps10092_1 == nil then
				arg_9_1.var_.actorSpriteComps10092_1 = var_12_25:GetComponentsInChildren(typeof(Image), true)
			end

			local var_12_27 = 2

			if var_12_26 <= arg_9_1.time_ and arg_9_1.time_ < var_12_26 + var_12_27 then
				local var_12_28 = (arg_9_1.time_ - var_12_26) / var_12_27

				if arg_9_1.var_.actorSpriteComps10092_1 then
					for iter_12_8, iter_12_9 in pairs(arg_9_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_12_9 then
							if arg_9_1.isInRecall_ then
								local var_12_29 = Mathf.Lerp(iter_12_9.color.r, 0.46, var_12_28)
								local var_12_30 = Mathf.Lerp(iter_12_9.color.g, 0.43, var_12_28)
								local var_12_31 = Mathf.Lerp(iter_12_9.color.b, 0.35, var_12_28)

								iter_12_9.color = Color.New(var_12_29, var_12_30, var_12_31)
							else
								local var_12_32 = Mathf.Lerp(iter_12_9.color.r, 0.5, var_12_28)

								iter_12_9.color = Color.New(var_12_32, var_12_32, var_12_32)
							end
						end
					end
				end
			end

			if arg_9_1.time_ >= var_12_26 + var_12_27 and arg_9_1.time_ < var_12_26 + var_12_27 + arg_12_0 and arg_9_1.var_.actorSpriteComps10092_1 then
				for iter_12_10, iter_12_11 in pairs(arg_9_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_12_11 then
						if arg_9_1.isInRecall_ then
							iter_12_11.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_12_11.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_9_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_12_33 = 0
			local var_12_34 = 0.475

			if var_12_33 < arg_9_1.time_ and arg_9_1.time_ <= var_12_33 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0
				arg_9_1.dialogCg_.alpha = 1

				arg_9_1.dialog_:SetActive(true)
				SetActive(arg_9_1.leftNameGo_, true)

				local var_12_35 = arg_9_1:FormatText(StoryNameCfg[28].name)

				arg_9_1.leftNameTxt_.text = var_12_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_9_1.leftNameTxt_.transform)

				arg_9_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_9_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_9_1:RecordName(arg_9_1.leftNameTxt_.text)
				SetActive(arg_9_1.iconTrs_.gameObject, false)
				arg_9_1.callingController_:SetSelectedState("normal")

				local var_12_36 = arg_9_1:GetWordFromCfg(413122002)
				local var_12_37 = arg_9_1:FormatText(var_12_36.content)

				arg_9_1.text_.text = var_12_37

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.text_)

				local var_12_38 = 19
				local var_12_39 = utf8.len(var_12_37)
				local var_12_40 = var_12_38 <= 0 and var_12_34 or var_12_34 * (var_12_39 / var_12_38)

				if var_12_40 > 0 and var_12_34 < var_12_40 then
					arg_9_1.talkMaxDuration = var_12_40

					if var_12_40 + var_12_33 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_40 + var_12_33
					end
				end

				arg_9_1.text_.text = var_12_37
				arg_9_1.typewritter.percent = 0

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122002", "story_v_out_413122.awb") ~= 0 then
					local var_12_41 = manager.audio:GetVoiceLength("story_v_out_413122", "413122002", "story_v_out_413122.awb") / 1000

					if var_12_41 + var_12_33 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_41 + var_12_33
					end

					if var_12_36.prefab_name ~= "" and arg_9_1.actors_[var_12_36.prefab_name] ~= nil then
						local var_12_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_9_1.actors_[var_12_36.prefab_name].transform, "story_v_out_413122", "413122002", "story_v_out_413122.awb")

						arg_9_1:RecordAudio("413122002", var_12_42)
						arg_9_1:RecordAudio("413122002", var_12_42)
					else
						arg_9_1:AudioAction("play", "voice", "story_v_out_413122", "413122002", "story_v_out_413122.awb")
					end

					arg_9_1:RecordHistoryTalkVoice("story_v_out_413122", "413122002", "story_v_out_413122.awb")
				end

				arg_9_1:RecordContent(arg_9_1.text_.text)
			end

			local var_12_43 = math.max(var_12_34, arg_9_1.talkMaxDuration)

			if var_12_33 <= arg_9_1.time_ and arg_9_1.time_ < var_12_33 + var_12_43 then
				arg_9_1.typewritter.percent = (arg_9_1.time_ - var_12_33) / var_12_43

				arg_9_1.typewritter:SetDirty()
			end

			if arg_9_1.time_ >= var_12_33 + var_12_43 and arg_9_1.time_ < var_12_33 + var_12_43 + arg_12_0 then
				arg_9_1.typewritter.percent = 1

				arg_9_1.typewritter:SetDirty()
				arg_9_1:ShowNextGo(true)
			end
		end
	end,
	Play413122003 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 413122003
		arg_13_1.duration_ = 9

		local var_13_0 = {
			zh = 9,
			ja = 7.3
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
				arg_13_0:Play413122004(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = arg_13_1.actors_["10092_1"]
			local var_16_1 = 0

			if var_16_1 < arg_13_1.time_ and arg_13_1.time_ <= var_16_1 + arg_16_0 and arg_13_1.var_.actorSpriteComps10092_1 == nil then
				arg_13_1.var_.actorSpriteComps10092_1 = var_16_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_16_2 = 2

			if var_16_1 <= arg_13_1.time_ and arg_13_1.time_ < var_16_1 + var_16_2 then
				local var_16_3 = (arg_13_1.time_ - var_16_1) / var_16_2

				if arg_13_1.var_.actorSpriteComps10092_1 then
					for iter_16_0, iter_16_1 in pairs(arg_13_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_16_1 then
							if arg_13_1.isInRecall_ then
								local var_16_4 = Mathf.Lerp(iter_16_1.color.r, 0.82, var_16_3)
								local var_16_5 = Mathf.Lerp(iter_16_1.color.g, 0.77, var_16_3)
								local var_16_6 = Mathf.Lerp(iter_16_1.color.b, 0.62, var_16_3)

								iter_16_1.color = Color.New(var_16_4, var_16_5, var_16_6)
							else
								local var_16_7 = Mathf.Lerp(iter_16_1.color.r, 1, var_16_3)

								iter_16_1.color = Color.New(var_16_7, var_16_7, var_16_7)
							end
						end
					end
				end
			end

			if arg_13_1.time_ >= var_16_1 + var_16_2 and arg_13_1.time_ < var_16_1 + var_16_2 + arg_16_0 and arg_13_1.var_.actorSpriteComps10092_1 then
				for iter_16_2, iter_16_3 in pairs(arg_13_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_16_3 then
						if arg_13_1.isInRecall_ then
							iter_16_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_16_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_13_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_16_8 = arg_13_1.actors_["10093"]
			local var_16_9 = 0

			if var_16_9 < arg_13_1.time_ and arg_13_1.time_ <= var_16_9 + arg_16_0 and arg_13_1.var_.actorSpriteComps10093 == nil then
				arg_13_1.var_.actorSpriteComps10093 = var_16_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_16_10 = 2

			if var_16_9 <= arg_13_1.time_ and arg_13_1.time_ < var_16_9 + var_16_10 then
				local var_16_11 = (arg_13_1.time_ - var_16_9) / var_16_10

				if arg_13_1.var_.actorSpriteComps10093 then
					for iter_16_4, iter_16_5 in pairs(arg_13_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_16_5 then
							if arg_13_1.isInRecall_ then
								local var_16_12 = Mathf.Lerp(iter_16_5.color.r, 0.46, var_16_11)
								local var_16_13 = Mathf.Lerp(iter_16_5.color.g, 0.43, var_16_11)
								local var_16_14 = Mathf.Lerp(iter_16_5.color.b, 0.35, var_16_11)

								iter_16_5.color = Color.New(var_16_12, var_16_13, var_16_14)
							else
								local var_16_15 = Mathf.Lerp(iter_16_5.color.r, 0.5, var_16_11)

								iter_16_5.color = Color.New(var_16_15, var_16_15, var_16_15)
							end
						end
					end
				end
			end

			if arg_13_1.time_ >= var_16_9 + var_16_10 and arg_13_1.time_ < var_16_9 + var_16_10 + arg_16_0 and arg_13_1.var_.actorSpriteComps10093 then
				for iter_16_6, iter_16_7 in pairs(arg_13_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_16_7 then
						if arg_13_1.isInRecall_ then
							iter_16_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_16_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_13_1.var_.actorSpriteComps10093 = nil
			end

			local var_16_16 = 0
			local var_16_17 = 1.025

			if var_16_16 < arg_13_1.time_ and arg_13_1.time_ <= var_16_16 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0
				arg_13_1.dialogCg_.alpha = 1

				arg_13_1.dialog_:SetActive(true)
				SetActive(arg_13_1.leftNameGo_, true)

				local var_16_18 = arg_13_1:FormatText(StoryNameCfg[996].name)

				arg_13_1.leftNameTxt_.text = var_16_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_13_1.leftNameTxt_.transform)

				arg_13_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_13_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_13_1:RecordName(arg_13_1.leftNameTxt_.text)
				SetActive(arg_13_1.iconTrs_.gameObject, false)
				arg_13_1.callingController_:SetSelectedState("normal")

				local var_16_19 = arg_13_1:GetWordFromCfg(413122003)
				local var_16_20 = arg_13_1:FormatText(var_16_19.content)

				arg_13_1.text_.text = var_16_20

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.text_)

				local var_16_21 = 41
				local var_16_22 = utf8.len(var_16_20)
				local var_16_23 = var_16_21 <= 0 and var_16_17 or var_16_17 * (var_16_22 / var_16_21)

				if var_16_23 > 0 and var_16_17 < var_16_23 then
					arg_13_1.talkMaxDuration = var_16_23

					if var_16_23 + var_16_16 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_23 + var_16_16
					end
				end

				arg_13_1.text_.text = var_16_20
				arg_13_1.typewritter.percent = 0

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122003", "story_v_out_413122.awb") ~= 0 then
					local var_16_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122003", "story_v_out_413122.awb") / 1000

					if var_16_24 + var_16_16 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_24 + var_16_16
					end

					if var_16_19.prefab_name ~= "" and arg_13_1.actors_[var_16_19.prefab_name] ~= nil then
						local var_16_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_13_1.actors_[var_16_19.prefab_name].transform, "story_v_out_413122", "413122003", "story_v_out_413122.awb")

						arg_13_1:RecordAudio("413122003", var_16_25)
						arg_13_1:RecordAudio("413122003", var_16_25)
					else
						arg_13_1:AudioAction("play", "voice", "story_v_out_413122", "413122003", "story_v_out_413122.awb")
					end

					arg_13_1:RecordHistoryTalkVoice("story_v_out_413122", "413122003", "story_v_out_413122.awb")
				end

				arg_13_1:RecordContent(arg_13_1.text_.text)
			end

			local var_16_26 = math.max(var_16_17, arg_13_1.talkMaxDuration)

			if var_16_16 <= arg_13_1.time_ and arg_13_1.time_ < var_16_16 + var_16_26 then
				arg_13_1.typewritter.percent = (arg_13_1.time_ - var_16_16) / var_16_26

				arg_13_1.typewritter:SetDirty()
			end

			if arg_13_1.time_ >= var_16_16 + var_16_26 and arg_13_1.time_ < var_16_16 + var_16_26 + arg_16_0 then
				arg_13_1.typewritter.percent = 1

				arg_13_1.typewritter:SetDirty()
				arg_13_1:ShowNextGo(true)
			end
		end
	end,
	Play413122004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 413122004
		arg_17_1.duration_ = 5

		local var_17_0 = {
			zh = 5,
			ja = 4.366
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
				arg_17_0:Play413122005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = arg_17_1.actors_["10093"].transform
			local var_20_1 = 0

			if var_20_1 < arg_17_1.time_ and arg_17_1.time_ <= var_20_1 + arg_20_0 then
				arg_17_1.var_.moveOldPos10093 = var_20_0.localPosition
				var_20_0.localScale = Vector3.New(1, 1, 1)

				arg_17_1:CheckSpriteTmpPos("10093", 4)

				local var_20_2 = var_20_0.childCount

				for iter_20_0 = 0, var_20_2 - 1 do
					local var_20_3 = var_20_0:GetChild(iter_20_0)

					if var_20_3.name == "split_3" or not string.find(var_20_3.name, "split") then
						var_20_3.gameObject:SetActive(true)
					else
						var_20_3.gameObject:SetActive(false)
					end
				end
			end

			local var_20_4 = 0.001

			if var_20_1 <= arg_17_1.time_ and arg_17_1.time_ < var_20_1 + var_20_4 then
				local var_20_5 = (arg_17_1.time_ - var_20_1) / var_20_4
				local var_20_6 = Vector3.New(390, -345, -245)

				var_20_0.localPosition = Vector3.Lerp(arg_17_1.var_.moveOldPos10093, var_20_6, var_20_5)
			end

			if arg_17_1.time_ >= var_20_1 + var_20_4 and arg_17_1.time_ < var_20_1 + var_20_4 + arg_20_0 then
				var_20_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_20_7 = arg_17_1.actors_["10093"]
			local var_20_8 = 0

			if var_20_8 < arg_17_1.time_ and arg_17_1.time_ <= var_20_8 + arg_20_0 and arg_17_1.var_.actorSpriteComps10093 == nil then
				arg_17_1.var_.actorSpriteComps10093 = var_20_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_20_9 = 2

			if var_20_8 <= arg_17_1.time_ and arg_17_1.time_ < var_20_8 + var_20_9 then
				local var_20_10 = (arg_17_1.time_ - var_20_8) / var_20_9

				if arg_17_1.var_.actorSpriteComps10093 then
					for iter_20_1, iter_20_2 in pairs(arg_17_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_20_2 then
							if arg_17_1.isInRecall_ then
								local var_20_11 = Mathf.Lerp(iter_20_2.color.r, 0.82, var_20_10)
								local var_20_12 = Mathf.Lerp(iter_20_2.color.g, 0.77, var_20_10)
								local var_20_13 = Mathf.Lerp(iter_20_2.color.b, 0.62, var_20_10)

								iter_20_2.color = Color.New(var_20_11, var_20_12, var_20_13)
							else
								local var_20_14 = Mathf.Lerp(iter_20_2.color.r, 1, var_20_10)

								iter_20_2.color = Color.New(var_20_14, var_20_14, var_20_14)
							end
						end
					end
				end
			end

			if arg_17_1.time_ >= var_20_8 + var_20_9 and arg_17_1.time_ < var_20_8 + var_20_9 + arg_20_0 and arg_17_1.var_.actorSpriteComps10093 then
				for iter_20_3, iter_20_4 in pairs(arg_17_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_20_4 then
						if arg_17_1.isInRecall_ then
							iter_20_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_20_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_17_1.var_.actorSpriteComps10093 = nil
			end

			local var_20_15 = arg_17_1.actors_["10092_1"]
			local var_20_16 = 0

			if var_20_16 < arg_17_1.time_ and arg_17_1.time_ <= var_20_16 + arg_20_0 and arg_17_1.var_.actorSpriteComps10092_1 == nil then
				arg_17_1.var_.actorSpriteComps10092_1 = var_20_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_20_17 = 2

			if var_20_16 <= arg_17_1.time_ and arg_17_1.time_ < var_20_16 + var_20_17 then
				local var_20_18 = (arg_17_1.time_ - var_20_16) / var_20_17

				if arg_17_1.var_.actorSpriteComps10092_1 then
					for iter_20_5, iter_20_6 in pairs(arg_17_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_20_6 then
							if arg_17_1.isInRecall_ then
								local var_20_19 = Mathf.Lerp(iter_20_6.color.r, 0.46, var_20_18)
								local var_20_20 = Mathf.Lerp(iter_20_6.color.g, 0.43, var_20_18)
								local var_20_21 = Mathf.Lerp(iter_20_6.color.b, 0.35, var_20_18)

								iter_20_6.color = Color.New(var_20_19, var_20_20, var_20_21)
							else
								local var_20_22 = Mathf.Lerp(iter_20_6.color.r, 0.5, var_20_18)

								iter_20_6.color = Color.New(var_20_22, var_20_22, var_20_22)
							end
						end
					end
				end
			end

			if arg_17_1.time_ >= var_20_16 + var_20_17 and arg_17_1.time_ < var_20_16 + var_20_17 + arg_20_0 and arg_17_1.var_.actorSpriteComps10092_1 then
				for iter_20_7, iter_20_8 in pairs(arg_17_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_20_8 then
						if arg_17_1.isInRecall_ then
							iter_20_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_20_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_17_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_20_23 = 0
			local var_20_24 = 0.775

			if var_20_23 < arg_17_1.time_ and arg_17_1.time_ <= var_20_23 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_25 = arg_17_1:FormatText(StoryNameCfg[28].name)

				arg_17_1.leftNameTxt_.text = var_20_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_26 = arg_17_1:GetWordFromCfg(413122004)
				local var_20_27 = arg_17_1:FormatText(var_20_26.content)

				arg_17_1.text_.text = var_20_27

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_28 = 31
				local var_20_29 = utf8.len(var_20_27)
				local var_20_30 = var_20_28 <= 0 and var_20_24 or var_20_24 * (var_20_29 / var_20_28)

				if var_20_30 > 0 and var_20_24 < var_20_30 then
					arg_17_1.talkMaxDuration = var_20_30

					if var_20_30 + var_20_23 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_30 + var_20_23
					end
				end

				arg_17_1.text_.text = var_20_27
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122004", "story_v_out_413122.awb") ~= 0 then
					local var_20_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122004", "story_v_out_413122.awb") / 1000

					if var_20_31 + var_20_23 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_31 + var_20_23
					end

					if var_20_26.prefab_name ~= "" and arg_17_1.actors_[var_20_26.prefab_name] ~= nil then
						local var_20_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_26.prefab_name].transform, "story_v_out_413122", "413122004", "story_v_out_413122.awb")

						arg_17_1:RecordAudio("413122004", var_20_32)
						arg_17_1:RecordAudio("413122004", var_20_32)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_413122", "413122004", "story_v_out_413122.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_413122", "413122004", "story_v_out_413122.awb")
				end

				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_33 = math.max(var_20_24, arg_17_1.talkMaxDuration)

			if var_20_23 <= arg_17_1.time_ and arg_17_1.time_ < var_20_23 + var_20_33 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_23) / var_20_33

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_23 + var_20_33 and arg_17_1.time_ < var_20_23 + var_20_33 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play413122005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 413122005
		arg_21_1.duration_ = 6.57

		local var_21_0 = {
			zh = 6.566,
			ja = 5.2
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
				arg_21_0:Play413122006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = arg_21_1.actors_["10092_1"].transform
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 then
				arg_21_1.var_.moveOldPos10092_1 = var_24_0.localPosition
				var_24_0.localScale = Vector3.New(1, 1, 1)

				arg_21_1:CheckSpriteTmpPos("10092_1", 2)

				local var_24_2 = var_24_0.childCount

				for iter_24_0 = 0, var_24_2 - 1 do
					local var_24_3 = var_24_0:GetChild(iter_24_0)

					if var_24_3.name == "split_1_1" or not string.find(var_24_3.name, "split") then
						var_24_3.gameObject:SetActive(true)
					else
						var_24_3.gameObject:SetActive(false)
					end
				end
			end

			local var_24_4 = 0.001

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_4 then
				local var_24_5 = (arg_21_1.time_ - var_24_1) / var_24_4
				local var_24_6 = Vector3.New(-389.49, -300, -295)

				var_24_0.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos10092_1, var_24_6, var_24_5)
			end

			if arg_21_1.time_ >= var_24_1 + var_24_4 and arg_21_1.time_ < var_24_1 + var_24_4 + arg_24_0 then
				var_24_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_24_7 = arg_21_1.actors_["10092_1"]
			local var_24_8 = 0

			if var_24_8 < arg_21_1.time_ and arg_21_1.time_ <= var_24_8 + arg_24_0 and arg_21_1.var_.actorSpriteComps10092_1 == nil then
				arg_21_1.var_.actorSpriteComps10092_1 = var_24_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_24_9 = 2

			if var_24_8 <= arg_21_1.time_ and arg_21_1.time_ < var_24_8 + var_24_9 then
				local var_24_10 = (arg_21_1.time_ - var_24_8) / var_24_9

				if arg_21_1.var_.actorSpriteComps10092_1 then
					for iter_24_1, iter_24_2 in pairs(arg_21_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_24_2 then
							if arg_21_1.isInRecall_ then
								local var_24_11 = Mathf.Lerp(iter_24_2.color.r, 0.82, var_24_10)
								local var_24_12 = Mathf.Lerp(iter_24_2.color.g, 0.77, var_24_10)
								local var_24_13 = Mathf.Lerp(iter_24_2.color.b, 0.62, var_24_10)

								iter_24_2.color = Color.New(var_24_11, var_24_12, var_24_13)
							else
								local var_24_14 = Mathf.Lerp(iter_24_2.color.r, 1, var_24_10)

								iter_24_2.color = Color.New(var_24_14, var_24_14, var_24_14)
							end
						end
					end
				end
			end

			if arg_21_1.time_ >= var_24_8 + var_24_9 and arg_21_1.time_ < var_24_8 + var_24_9 + arg_24_0 and arg_21_1.var_.actorSpriteComps10092_1 then
				for iter_24_3, iter_24_4 in pairs(arg_21_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_24_4 then
						if arg_21_1.isInRecall_ then
							iter_24_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_24_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_21_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_24_15 = arg_21_1.actors_["10093"]
			local var_24_16 = 0

			if var_24_16 < arg_21_1.time_ and arg_21_1.time_ <= var_24_16 + arg_24_0 and arg_21_1.var_.actorSpriteComps10093 == nil then
				arg_21_1.var_.actorSpriteComps10093 = var_24_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_24_17 = 2

			if var_24_16 <= arg_21_1.time_ and arg_21_1.time_ < var_24_16 + var_24_17 then
				local var_24_18 = (arg_21_1.time_ - var_24_16) / var_24_17

				if arg_21_1.var_.actorSpriteComps10093 then
					for iter_24_5, iter_24_6 in pairs(arg_21_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_24_6 then
							if arg_21_1.isInRecall_ then
								local var_24_19 = Mathf.Lerp(iter_24_6.color.r, 0.46, var_24_18)
								local var_24_20 = Mathf.Lerp(iter_24_6.color.g, 0.43, var_24_18)
								local var_24_21 = Mathf.Lerp(iter_24_6.color.b, 0.35, var_24_18)

								iter_24_6.color = Color.New(var_24_19, var_24_20, var_24_21)
							else
								local var_24_22 = Mathf.Lerp(iter_24_6.color.r, 0.5, var_24_18)

								iter_24_6.color = Color.New(var_24_22, var_24_22, var_24_22)
							end
						end
					end
				end
			end

			if arg_21_1.time_ >= var_24_16 + var_24_17 and arg_21_1.time_ < var_24_16 + var_24_17 + arg_24_0 and arg_21_1.var_.actorSpriteComps10093 then
				for iter_24_7, iter_24_8 in pairs(arg_21_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_24_8 then
						if arg_21_1.isInRecall_ then
							iter_24_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_24_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_21_1.var_.actorSpriteComps10093 = nil
			end

			local var_24_23 = 0
			local var_24_24 = 0.875

			if var_24_23 < arg_21_1.time_ and arg_21_1.time_ <= var_24_23 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_25 = arg_21_1:FormatText(StoryNameCfg[996].name)

				arg_21_1.leftNameTxt_.text = var_24_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_26 = arg_21_1:GetWordFromCfg(413122005)
				local var_24_27 = arg_21_1:FormatText(var_24_26.content)

				arg_21_1.text_.text = var_24_27

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_28 = 35
				local var_24_29 = utf8.len(var_24_27)
				local var_24_30 = var_24_28 <= 0 and var_24_24 or var_24_24 * (var_24_29 / var_24_28)

				if var_24_30 > 0 and var_24_24 < var_24_30 then
					arg_21_1.talkMaxDuration = var_24_30

					if var_24_30 + var_24_23 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_30 + var_24_23
					end
				end

				arg_21_1.text_.text = var_24_27
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122005", "story_v_out_413122.awb") ~= 0 then
					local var_24_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122005", "story_v_out_413122.awb") / 1000

					if var_24_31 + var_24_23 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_31 + var_24_23
					end

					if var_24_26.prefab_name ~= "" and arg_21_1.actors_[var_24_26.prefab_name] ~= nil then
						local var_24_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_26.prefab_name].transform, "story_v_out_413122", "413122005", "story_v_out_413122.awb")

						arg_21_1:RecordAudio("413122005", var_24_32)
						arg_21_1:RecordAudio("413122005", var_24_32)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_413122", "413122005", "story_v_out_413122.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_413122", "413122005", "story_v_out_413122.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_33 = math.max(var_24_24, arg_21_1.talkMaxDuration)

			if var_24_23 <= arg_21_1.time_ and arg_21_1.time_ < var_24_23 + var_24_33 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_23) / var_24_33

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_23 + var_24_33 and arg_21_1.time_ < var_24_23 + var_24_33 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play413122006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 413122006
		arg_25_1.duration_ = 9.27

		local var_25_0 = {
			zh = 6.766,
			ja = 9.266
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
				arg_25_0:Play413122007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = arg_25_1.actors_["10093"]
			local var_28_1 = 0

			if var_28_1 < arg_25_1.time_ and arg_25_1.time_ <= var_28_1 + arg_28_0 and arg_25_1.var_.actorSpriteComps10093 == nil then
				arg_25_1.var_.actorSpriteComps10093 = var_28_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_2 = 2

			if var_28_1 <= arg_25_1.time_ and arg_25_1.time_ < var_28_1 + var_28_2 then
				local var_28_3 = (arg_25_1.time_ - var_28_1) / var_28_2

				if arg_25_1.var_.actorSpriteComps10093 then
					for iter_28_0, iter_28_1 in pairs(arg_25_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_28_1 then
							if arg_25_1.isInRecall_ then
								local var_28_4 = Mathf.Lerp(iter_28_1.color.r, 0.82, var_28_3)
								local var_28_5 = Mathf.Lerp(iter_28_1.color.g, 0.77, var_28_3)
								local var_28_6 = Mathf.Lerp(iter_28_1.color.b, 0.62, var_28_3)

								iter_28_1.color = Color.New(var_28_4, var_28_5, var_28_6)
							else
								local var_28_7 = Mathf.Lerp(iter_28_1.color.r, 1, var_28_3)

								iter_28_1.color = Color.New(var_28_7, var_28_7, var_28_7)
							end
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_1 + var_28_2 and arg_25_1.time_ < var_28_1 + var_28_2 + arg_28_0 and arg_25_1.var_.actorSpriteComps10093 then
				for iter_28_2, iter_28_3 in pairs(arg_25_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_28_3 then
						if arg_25_1.isInRecall_ then
							iter_28_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_28_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_25_1.var_.actorSpriteComps10093 = nil
			end

			local var_28_8 = arg_25_1.actors_["10092_1"]
			local var_28_9 = 0

			if var_28_9 < arg_25_1.time_ and arg_25_1.time_ <= var_28_9 + arg_28_0 and arg_25_1.var_.actorSpriteComps10092_1 == nil then
				arg_25_1.var_.actorSpriteComps10092_1 = var_28_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_10 = 2

			if var_28_9 <= arg_25_1.time_ and arg_25_1.time_ < var_28_9 + var_28_10 then
				local var_28_11 = (arg_25_1.time_ - var_28_9) / var_28_10

				if arg_25_1.var_.actorSpriteComps10092_1 then
					for iter_28_4, iter_28_5 in pairs(arg_25_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_28_5 then
							if arg_25_1.isInRecall_ then
								local var_28_12 = Mathf.Lerp(iter_28_5.color.r, 0.46, var_28_11)
								local var_28_13 = Mathf.Lerp(iter_28_5.color.g, 0.43, var_28_11)
								local var_28_14 = Mathf.Lerp(iter_28_5.color.b, 0.35, var_28_11)

								iter_28_5.color = Color.New(var_28_12, var_28_13, var_28_14)
							else
								local var_28_15 = Mathf.Lerp(iter_28_5.color.r, 0.5, var_28_11)

								iter_28_5.color = Color.New(var_28_15, var_28_15, var_28_15)
							end
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_9 + var_28_10 and arg_25_1.time_ < var_28_9 + var_28_10 + arg_28_0 and arg_25_1.var_.actorSpriteComps10092_1 then
				for iter_28_6, iter_28_7 in pairs(arg_25_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_28_7 then
						if arg_25_1.isInRecall_ then
							iter_28_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_28_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_25_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_28_16 = 0
			local var_28_17 = 1.025

			if var_28_16 < arg_25_1.time_ and arg_25_1.time_ <= var_28_16 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_18 = arg_25_1:FormatText(StoryNameCfg[28].name)

				arg_25_1.leftNameTxt_.text = var_28_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_19 = arg_25_1:GetWordFromCfg(413122006)
				local var_28_20 = arg_25_1:FormatText(var_28_19.content)

				arg_25_1.text_.text = var_28_20

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_21 = 41
				local var_28_22 = utf8.len(var_28_20)
				local var_28_23 = var_28_21 <= 0 and var_28_17 or var_28_17 * (var_28_22 / var_28_21)

				if var_28_23 > 0 and var_28_17 < var_28_23 then
					arg_25_1.talkMaxDuration = var_28_23

					if var_28_23 + var_28_16 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_23 + var_28_16
					end
				end

				arg_25_1.text_.text = var_28_20
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122006", "story_v_out_413122.awb") ~= 0 then
					local var_28_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122006", "story_v_out_413122.awb") / 1000

					if var_28_24 + var_28_16 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_24 + var_28_16
					end

					if var_28_19.prefab_name ~= "" and arg_25_1.actors_[var_28_19.prefab_name] ~= nil then
						local var_28_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_19.prefab_name].transform, "story_v_out_413122", "413122006", "story_v_out_413122.awb")

						arg_25_1:RecordAudio("413122006", var_28_25)
						arg_25_1:RecordAudio("413122006", var_28_25)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_413122", "413122006", "story_v_out_413122.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_413122", "413122006", "story_v_out_413122.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_26 = math.max(var_28_17, arg_25_1.talkMaxDuration)

			if var_28_16 <= arg_25_1.time_ and arg_25_1.time_ < var_28_16 + var_28_26 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_16) / var_28_26

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_16 + var_28_26 and arg_25_1.time_ < var_28_16 + var_28_26 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play413122007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 413122007
		arg_29_1.duration_ = 8.97

		local var_29_0 = {
			zh = 7.233,
			ja = 8.966
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
				arg_29_0:Play413122008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["10092_1"].transform
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				arg_29_1.var_.moveOldPos10092_1 = var_32_0.localPosition
				var_32_0.localScale = Vector3.New(1, 1, 1)

				arg_29_1:CheckSpriteTmpPos("10092_1", 2)

				local var_32_2 = var_32_0.childCount

				for iter_32_0 = 0, var_32_2 - 1 do
					local var_32_3 = var_32_0:GetChild(iter_32_0)

					if var_32_3.name == "split_1_1" or not string.find(var_32_3.name, "split") then
						var_32_3.gameObject:SetActive(true)
					else
						var_32_3.gameObject:SetActive(false)
					end
				end
			end

			local var_32_4 = 0.001

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_4 then
				local var_32_5 = (arg_29_1.time_ - var_32_1) / var_32_4
				local var_32_6 = Vector3.New(-389.49, -300, -295)

				var_32_0.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos10092_1, var_32_6, var_32_5)
			end

			if arg_29_1.time_ >= var_32_1 + var_32_4 and arg_29_1.time_ < var_32_1 + var_32_4 + arg_32_0 then
				var_32_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_32_7 = arg_29_1.actors_["10092_1"]
			local var_32_8 = 0

			if var_32_8 < arg_29_1.time_ and arg_29_1.time_ <= var_32_8 + arg_32_0 and arg_29_1.var_.actorSpriteComps10092_1 == nil then
				arg_29_1.var_.actorSpriteComps10092_1 = var_32_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_9 = 2

			if var_32_8 <= arg_29_1.time_ and arg_29_1.time_ < var_32_8 + var_32_9 then
				local var_32_10 = (arg_29_1.time_ - var_32_8) / var_32_9

				if arg_29_1.var_.actorSpriteComps10092_1 then
					for iter_32_1, iter_32_2 in pairs(arg_29_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_32_2 then
							if arg_29_1.isInRecall_ then
								local var_32_11 = Mathf.Lerp(iter_32_2.color.r, 0.82, var_32_10)
								local var_32_12 = Mathf.Lerp(iter_32_2.color.g, 0.77, var_32_10)
								local var_32_13 = Mathf.Lerp(iter_32_2.color.b, 0.62, var_32_10)

								iter_32_2.color = Color.New(var_32_11, var_32_12, var_32_13)
							else
								local var_32_14 = Mathf.Lerp(iter_32_2.color.r, 1, var_32_10)

								iter_32_2.color = Color.New(var_32_14, var_32_14, var_32_14)
							end
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_8 + var_32_9 and arg_29_1.time_ < var_32_8 + var_32_9 + arg_32_0 and arg_29_1.var_.actorSpriteComps10092_1 then
				for iter_32_3, iter_32_4 in pairs(arg_29_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_32_4 then
						if arg_29_1.isInRecall_ then
							iter_32_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_32_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_29_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_32_15 = arg_29_1.actors_["10093"]
			local var_32_16 = 0

			if var_32_16 < arg_29_1.time_ and arg_29_1.time_ <= var_32_16 + arg_32_0 and arg_29_1.var_.actorSpriteComps10093 == nil then
				arg_29_1.var_.actorSpriteComps10093 = var_32_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_17 = 2

			if var_32_16 <= arg_29_1.time_ and arg_29_1.time_ < var_32_16 + var_32_17 then
				local var_32_18 = (arg_29_1.time_ - var_32_16) / var_32_17

				if arg_29_1.var_.actorSpriteComps10093 then
					for iter_32_5, iter_32_6 in pairs(arg_29_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_32_6 then
							if arg_29_1.isInRecall_ then
								local var_32_19 = Mathf.Lerp(iter_32_6.color.r, 0.46, var_32_18)
								local var_32_20 = Mathf.Lerp(iter_32_6.color.g, 0.43, var_32_18)
								local var_32_21 = Mathf.Lerp(iter_32_6.color.b, 0.35, var_32_18)

								iter_32_6.color = Color.New(var_32_19, var_32_20, var_32_21)
							else
								local var_32_22 = Mathf.Lerp(iter_32_6.color.r, 0.5, var_32_18)

								iter_32_6.color = Color.New(var_32_22, var_32_22, var_32_22)
							end
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_16 + var_32_17 and arg_29_1.time_ < var_32_16 + var_32_17 + arg_32_0 and arg_29_1.var_.actorSpriteComps10093 then
				for iter_32_7, iter_32_8 in pairs(arg_29_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_32_8 then
						if arg_29_1.isInRecall_ then
							iter_32_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_32_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_29_1.var_.actorSpriteComps10093 = nil
			end

			local var_32_23 = 0
			local var_32_24 = 0.925

			if var_32_23 < arg_29_1.time_ and arg_29_1.time_ <= var_32_23 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_25 = arg_29_1:FormatText(StoryNameCfg[996].name)

				arg_29_1.leftNameTxt_.text = var_32_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_26 = arg_29_1:GetWordFromCfg(413122007)
				local var_32_27 = arg_29_1:FormatText(var_32_26.content)

				arg_29_1.text_.text = var_32_27

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_28 = 37
				local var_32_29 = utf8.len(var_32_27)
				local var_32_30 = var_32_28 <= 0 and var_32_24 or var_32_24 * (var_32_29 / var_32_28)

				if var_32_30 > 0 and var_32_24 < var_32_30 then
					arg_29_1.talkMaxDuration = var_32_30

					if var_32_30 + var_32_23 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_30 + var_32_23
					end
				end

				arg_29_1.text_.text = var_32_27
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122007", "story_v_out_413122.awb") ~= 0 then
					local var_32_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122007", "story_v_out_413122.awb") / 1000

					if var_32_31 + var_32_23 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_31 + var_32_23
					end

					if var_32_26.prefab_name ~= "" and arg_29_1.actors_[var_32_26.prefab_name] ~= nil then
						local var_32_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_26.prefab_name].transform, "story_v_out_413122", "413122007", "story_v_out_413122.awb")

						arg_29_1:RecordAudio("413122007", var_32_32)
						arg_29_1:RecordAudio("413122007", var_32_32)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_413122", "413122007", "story_v_out_413122.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_413122", "413122007", "story_v_out_413122.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_33 = math.max(var_32_24, arg_29_1.talkMaxDuration)

			if var_32_23 <= arg_29_1.time_ and arg_29_1.time_ < var_32_23 + var_32_33 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_23) / var_32_33

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_23 + var_32_33 and arg_29_1.time_ < var_32_23 + var_32_33 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play413122008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 413122008
		arg_33_1.duration_ = 7.07

		local var_33_0 = {
			zh = 4.366,
			ja = 7.066
		}
		local var_33_1 = manager.audio:GetLocalizationFlag()

		if var_33_0[var_33_1] ~= nil then
			arg_33_1.duration_ = var_33_0[var_33_1]
		end

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play413122009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 0.65

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[996].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(413122008)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 26
				local var_36_6 = utf8.len(var_36_4)
				local var_36_7 = var_36_5 <= 0 and var_36_1 or var_36_1 * (var_36_6 / var_36_5)

				if var_36_7 > 0 and var_36_1 < var_36_7 then
					arg_33_1.talkMaxDuration = var_36_7

					if var_36_7 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_7 + var_36_0
					end
				end

				arg_33_1.text_.text = var_36_4
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122008", "story_v_out_413122.awb") ~= 0 then
					local var_36_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122008", "story_v_out_413122.awb") / 1000

					if var_36_8 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_8 + var_36_0
					end

					if var_36_3.prefab_name ~= "" and arg_33_1.actors_[var_36_3.prefab_name] ~= nil then
						local var_36_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_3.prefab_name].transform, "story_v_out_413122", "413122008", "story_v_out_413122.awb")

						arg_33_1:RecordAudio("413122008", var_36_9)
						arg_33_1:RecordAudio("413122008", var_36_9)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_413122", "413122008", "story_v_out_413122.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_413122", "413122008", "story_v_out_413122.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_10 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_10 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_10

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_10 and arg_33_1.time_ < var_36_0 + var_36_10 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play413122009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 413122009
		arg_37_1.duration_ = 3.2

		local var_37_0 = {
			zh = 2.966,
			ja = 3.2
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
				arg_37_0:Play413122010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["10092_1"].transform
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 then
				arg_37_1.var_.moveOldPos10092_1 = var_40_0.localPosition
				var_40_0.localScale = Vector3.New(1, 1, 1)

				arg_37_1:CheckSpriteTmpPos("10092_1", 2)

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
				local var_40_6 = Vector3.New(-389.49, -300, -295)

				var_40_0.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos10092_1, var_40_6, var_40_5)
			end

			if arg_37_1.time_ >= var_40_1 + var_40_4 and arg_37_1.time_ < var_40_1 + var_40_4 + arg_40_0 then
				var_40_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_40_7 = arg_37_1.actors_["10092_1"]
			local var_40_8 = 0

			if var_40_8 < arg_37_1.time_ and arg_37_1.time_ <= var_40_8 + arg_40_0 and arg_37_1.var_.actorSpriteComps10092_1 == nil then
				arg_37_1.var_.actorSpriteComps10092_1 = var_40_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_9 = 2

			if var_40_8 <= arg_37_1.time_ and arg_37_1.time_ < var_40_8 + var_40_9 then
				local var_40_10 = (arg_37_1.time_ - var_40_8) / var_40_9

				if arg_37_1.var_.actorSpriteComps10092_1 then
					for iter_40_1, iter_40_2 in pairs(arg_37_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_40_2 then
							if arg_37_1.isInRecall_ then
								local var_40_11 = Mathf.Lerp(iter_40_2.color.r, 0.82, var_40_10)
								local var_40_12 = Mathf.Lerp(iter_40_2.color.g, 0.77, var_40_10)
								local var_40_13 = Mathf.Lerp(iter_40_2.color.b, 0.62, var_40_10)

								iter_40_2.color = Color.New(var_40_11, var_40_12, var_40_13)
							else
								local var_40_14 = Mathf.Lerp(iter_40_2.color.r, 1, var_40_10)

								iter_40_2.color = Color.New(var_40_14, var_40_14, var_40_14)
							end
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_8 + var_40_9 and arg_37_1.time_ < var_40_8 + var_40_9 + arg_40_0 and arg_37_1.var_.actorSpriteComps10092_1 then
				for iter_40_3, iter_40_4 in pairs(arg_37_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_40_4 then
						if arg_37_1.isInRecall_ then
							iter_40_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_40_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_37_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_40_15 = 0
			local var_40_16 = 0.425

			if var_40_15 < arg_37_1.time_ and arg_37_1.time_ <= var_40_15 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_17 = arg_37_1:FormatText(StoryNameCfg[996].name)

				arg_37_1.leftNameTxt_.text = var_40_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_18 = arg_37_1:GetWordFromCfg(413122009)
				local var_40_19 = arg_37_1:FormatText(var_40_18.content)

				arg_37_1.text_.text = var_40_19

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_20 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122009", "story_v_out_413122.awb") ~= 0 then
					local var_40_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122009", "story_v_out_413122.awb") / 1000

					if var_40_23 + var_40_15 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_23 + var_40_15
					end

					if var_40_18.prefab_name ~= "" and arg_37_1.actors_[var_40_18.prefab_name] ~= nil then
						local var_40_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_18.prefab_name].transform, "story_v_out_413122", "413122009", "story_v_out_413122.awb")

						arg_37_1:RecordAudio("413122009", var_40_24)
						arg_37_1:RecordAudio("413122009", var_40_24)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_413122", "413122009", "story_v_out_413122.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_413122", "413122009", "story_v_out_413122.awb")
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
	Play413122010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 413122010
		arg_41_1.duration_ = 6.6

		local var_41_0 = {
			zh = 4.9,
			ja = 6.6
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
				arg_41_0:Play413122011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = "10022"

			if arg_41_1.actors_[var_44_0] == nil then
				local var_44_1 = Object.Instantiate(Asset.Load("Widget/System/Story/StoryExpression/" .. var_44_0), arg_41_1.canvasGo_.transform)

				var_44_1.transform:SetSiblingIndex(1)

				var_44_1.name = var_44_0
				var_44_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_41_1.actors_[var_44_0] = var_44_1

				local var_44_2 = var_44_1:GetComponentsInChildren(typeof(Image), true):ToTable()

				if arg_41_1.isInRecall_ then
					for iter_44_0, iter_44_1 in ipairs(var_44_2) do
						iter_44_1.color = Color.New(0.82, 0.77, 0.62)
					end
				end
			end

			local var_44_3 = arg_41_1.actors_["10022"].transform
			local var_44_4 = 0

			if var_44_4 < arg_41_1.time_ and arg_41_1.time_ <= var_44_4 + arg_44_0 then
				arg_41_1.var_.moveOldPos10022 = var_44_3.localPosition
				var_44_3.localScale = Vector3.New(1, 1, 1)

				arg_41_1:CheckSpriteTmpPos("10022", 4)

				local var_44_5 = var_44_3.childCount

				for iter_44_2 = 0, var_44_5 - 1 do
					local var_44_6 = var_44_3:GetChild(iter_44_2)

					if var_44_6.name == "split_6" or not string.find(var_44_6.name, "split") then
						var_44_6.gameObject:SetActive(true)
					else
						var_44_6.gameObject:SetActive(false)
					end
				end
			end

			local var_44_7 = 0.001

			if var_44_4 <= arg_41_1.time_ and arg_41_1.time_ < var_44_4 + var_44_7 then
				local var_44_8 = (arg_41_1.time_ - var_44_4) / var_44_7
				local var_44_9 = Vector3.New(390, -315, -320)

				var_44_3.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos10022, var_44_9, var_44_8)
			end

			if arg_41_1.time_ >= var_44_4 + var_44_7 and arg_41_1.time_ < var_44_4 + var_44_7 + arg_44_0 then
				var_44_3.localPosition = Vector3.New(390, -315, -320)
			end

			local var_44_10 = arg_41_1.actors_["10092_1"].transform
			local var_44_11 = 0

			if var_44_11 < arg_41_1.time_ and arg_41_1.time_ <= var_44_11 + arg_44_0 then
				arg_41_1.var_.moveOldPos10092_1 = var_44_10.localPosition
				var_44_10.localScale = Vector3.New(1, 1, 1)

				arg_41_1:CheckSpriteTmpPos("10092_1", 2)

				local var_44_12 = var_44_10.childCount

				for iter_44_3 = 0, var_44_12 - 1 do
					local var_44_13 = var_44_10:GetChild(iter_44_3)

					if var_44_13.name == "" or not string.find(var_44_13.name, "split") then
						var_44_13.gameObject:SetActive(true)
					else
						var_44_13.gameObject:SetActive(false)
					end
				end
			end

			local var_44_14 = 0.001

			if var_44_11 <= arg_41_1.time_ and arg_41_1.time_ < var_44_11 + var_44_14 then
				local var_44_15 = (arg_41_1.time_ - var_44_11) / var_44_14
				local var_44_16 = Vector3.New(-389.49, -300, -295)

				var_44_10.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos10092_1, var_44_16, var_44_15)
			end

			if arg_41_1.time_ >= var_44_11 + var_44_14 and arg_41_1.time_ < var_44_11 + var_44_14 + arg_44_0 then
				var_44_10.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_44_17 = arg_41_1.actors_["10022"]
			local var_44_18 = 0

			if var_44_18 < arg_41_1.time_ and arg_41_1.time_ <= var_44_18 + arg_44_0 and arg_41_1.var_.actorSpriteComps10022 == nil then
				arg_41_1.var_.actorSpriteComps10022 = var_44_17:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_19 = 2

			if var_44_18 <= arg_41_1.time_ and arg_41_1.time_ < var_44_18 + var_44_19 then
				local var_44_20 = (arg_41_1.time_ - var_44_18) / var_44_19

				if arg_41_1.var_.actorSpriteComps10022 then
					for iter_44_4, iter_44_5 in pairs(arg_41_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_44_5 then
							if arg_41_1.isInRecall_ then
								local var_44_21 = Mathf.Lerp(iter_44_5.color.r, 0.82, var_44_20)
								local var_44_22 = Mathf.Lerp(iter_44_5.color.g, 0.77, var_44_20)
								local var_44_23 = Mathf.Lerp(iter_44_5.color.b, 0.62, var_44_20)

								iter_44_5.color = Color.New(var_44_21, var_44_22, var_44_23)
							else
								local var_44_24 = Mathf.Lerp(iter_44_5.color.r, 1, var_44_20)

								iter_44_5.color = Color.New(var_44_24, var_44_24, var_44_24)
							end
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_18 + var_44_19 and arg_41_1.time_ < var_44_18 + var_44_19 + arg_44_0 and arg_41_1.var_.actorSpriteComps10022 then
				for iter_44_6, iter_44_7 in pairs(arg_41_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_44_7 then
						if arg_41_1.isInRecall_ then
							iter_44_7.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_44_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_41_1.var_.actorSpriteComps10022 = nil
			end

			local var_44_25 = arg_41_1.actors_["10092_1"]
			local var_44_26 = 0

			if var_44_26 < arg_41_1.time_ and arg_41_1.time_ <= var_44_26 + arg_44_0 and arg_41_1.var_.actorSpriteComps10092_1 == nil then
				arg_41_1.var_.actorSpriteComps10092_1 = var_44_25:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_27 = 2

			if var_44_26 <= arg_41_1.time_ and arg_41_1.time_ < var_44_26 + var_44_27 then
				local var_44_28 = (arg_41_1.time_ - var_44_26) / var_44_27

				if arg_41_1.var_.actorSpriteComps10092_1 then
					for iter_44_8, iter_44_9 in pairs(arg_41_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_44_9 then
							if arg_41_1.isInRecall_ then
								local var_44_29 = Mathf.Lerp(iter_44_9.color.r, 0.46, var_44_28)
								local var_44_30 = Mathf.Lerp(iter_44_9.color.g, 0.43, var_44_28)
								local var_44_31 = Mathf.Lerp(iter_44_9.color.b, 0.35, var_44_28)

								iter_44_9.color = Color.New(var_44_29, var_44_30, var_44_31)
							else
								local var_44_32 = Mathf.Lerp(iter_44_9.color.r, 0.5, var_44_28)

								iter_44_9.color = Color.New(var_44_32, var_44_32, var_44_32)
							end
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_26 + var_44_27 and arg_41_1.time_ < var_44_26 + var_44_27 + arg_44_0 and arg_41_1.var_.actorSpriteComps10092_1 then
				for iter_44_10, iter_44_11 in pairs(arg_41_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_44_11 then
						if arg_41_1.isInRecall_ then
							iter_44_11.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_44_11.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_41_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_44_33 = 0
			local var_44_34 = 0.65

			if var_44_33 < arg_41_1.time_ and arg_41_1.time_ <= var_44_33 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_35 = arg_41_1:FormatText(StoryNameCfg[614].name)

				arg_41_1.leftNameTxt_.text = var_44_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_36 = arg_41_1:GetWordFromCfg(413122010)
				local var_44_37 = arg_41_1:FormatText(var_44_36.content)

				arg_41_1.text_.text = var_44_37

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_38 = 26
				local var_44_39 = utf8.len(var_44_37)
				local var_44_40 = var_44_38 <= 0 and var_44_34 or var_44_34 * (var_44_39 / var_44_38)

				if var_44_40 > 0 and var_44_34 < var_44_40 then
					arg_41_1.talkMaxDuration = var_44_40

					if var_44_40 + var_44_33 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_40 + var_44_33
					end
				end

				arg_41_1.text_.text = var_44_37
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122010", "story_v_out_413122.awb") ~= 0 then
					local var_44_41 = manager.audio:GetVoiceLength("story_v_out_413122", "413122010", "story_v_out_413122.awb") / 1000

					if var_44_41 + var_44_33 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_41 + var_44_33
					end

					if var_44_36.prefab_name ~= "" and arg_41_1.actors_[var_44_36.prefab_name] ~= nil then
						local var_44_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_36.prefab_name].transform, "story_v_out_413122", "413122010", "story_v_out_413122.awb")

						arg_41_1:RecordAudio("413122010", var_44_42)
						arg_41_1:RecordAudio("413122010", var_44_42)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_413122", "413122010", "story_v_out_413122.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_413122", "413122010", "story_v_out_413122.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_43 = math.max(var_44_34, arg_41_1.talkMaxDuration)

			if var_44_33 <= arg_41_1.time_ and arg_41_1.time_ < var_44_33 + var_44_43 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_33) / var_44_43

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_33 + var_44_43 and arg_41_1.time_ < var_44_33 + var_44_43 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play413122011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 413122011
		arg_45_1.duration_ = 6.57

		local var_45_0 = {
			zh = 2.7,
			ja = 6.566
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
				arg_45_0:Play413122012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10092_1"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos10092_1 = var_48_0.localPosition
				var_48_0.localScale = Vector3.New(1, 1, 1)

				arg_45_1:CheckSpriteTmpPos("10092_1", 2)

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
				local var_48_6 = Vector3.New(-389.49, -300, -295)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10092_1, var_48_6, var_48_5)
			end

			if arg_45_1.time_ >= var_48_1 + var_48_4 and arg_45_1.time_ < var_48_1 + var_48_4 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_48_7 = arg_45_1.actors_["10092_1"]
			local var_48_8 = 0

			if var_48_8 < arg_45_1.time_ and arg_45_1.time_ <= var_48_8 + arg_48_0 and arg_45_1.var_.actorSpriteComps10092_1 == nil then
				arg_45_1.var_.actorSpriteComps10092_1 = var_48_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_9 = 2

			if var_48_8 <= arg_45_1.time_ and arg_45_1.time_ < var_48_8 + var_48_9 then
				local var_48_10 = (arg_45_1.time_ - var_48_8) / var_48_9

				if arg_45_1.var_.actorSpriteComps10092_1 then
					for iter_48_1, iter_48_2 in pairs(arg_45_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_48_2 then
							if arg_45_1.isInRecall_ then
								local var_48_11 = Mathf.Lerp(iter_48_2.color.r, 0.82, var_48_10)
								local var_48_12 = Mathf.Lerp(iter_48_2.color.g, 0.77, var_48_10)
								local var_48_13 = Mathf.Lerp(iter_48_2.color.b, 0.62, var_48_10)

								iter_48_2.color = Color.New(var_48_11, var_48_12, var_48_13)
							else
								local var_48_14 = Mathf.Lerp(iter_48_2.color.r, 1, var_48_10)

								iter_48_2.color = Color.New(var_48_14, var_48_14, var_48_14)
							end
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_8 + var_48_9 and arg_45_1.time_ < var_48_8 + var_48_9 + arg_48_0 and arg_45_1.var_.actorSpriteComps10092_1 then
				for iter_48_3, iter_48_4 in pairs(arg_45_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_48_4 then
						if arg_45_1.isInRecall_ then
							iter_48_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_48_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_45_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_48_15 = arg_45_1.actors_["10022"]
			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 and arg_45_1.var_.actorSpriteComps10022 == nil then
				arg_45_1.var_.actorSpriteComps10022 = var_48_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_17 = 2

			if var_48_16 <= arg_45_1.time_ and arg_45_1.time_ < var_48_16 + var_48_17 then
				local var_48_18 = (arg_45_1.time_ - var_48_16) / var_48_17

				if arg_45_1.var_.actorSpriteComps10022 then
					for iter_48_5, iter_48_6 in pairs(arg_45_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_48_6 then
							if arg_45_1.isInRecall_ then
								local var_48_19 = Mathf.Lerp(iter_48_6.color.r, 0.46, var_48_18)
								local var_48_20 = Mathf.Lerp(iter_48_6.color.g, 0.43, var_48_18)
								local var_48_21 = Mathf.Lerp(iter_48_6.color.b, 0.35, var_48_18)

								iter_48_6.color = Color.New(var_48_19, var_48_20, var_48_21)
							else
								local var_48_22 = Mathf.Lerp(iter_48_6.color.r, 0.5, var_48_18)

								iter_48_6.color = Color.New(var_48_22, var_48_22, var_48_22)
							end
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_16 + var_48_17 and arg_45_1.time_ < var_48_16 + var_48_17 + arg_48_0 and arg_45_1.var_.actorSpriteComps10022 then
				for iter_48_7, iter_48_8 in pairs(arg_45_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_48_8 then
						if arg_45_1.isInRecall_ then
							iter_48_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_48_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_45_1.var_.actorSpriteComps10022 = nil
			end

			local var_48_23 = 0
			local var_48_24 = 0.3

			if var_48_23 < arg_45_1.time_ and arg_45_1.time_ <= var_48_23 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_25 = arg_45_1:FormatText(StoryNameCfg[996].name)

				arg_45_1.leftNameTxt_.text = var_48_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_26 = arg_45_1:GetWordFromCfg(413122011)
				local var_48_27 = arg_45_1:FormatText(var_48_26.content)

				arg_45_1.text_.text = var_48_27

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_28 = 12
				local var_48_29 = utf8.len(var_48_27)
				local var_48_30 = var_48_28 <= 0 and var_48_24 or var_48_24 * (var_48_29 / var_48_28)

				if var_48_30 > 0 and var_48_24 < var_48_30 then
					arg_45_1.talkMaxDuration = var_48_30

					if var_48_30 + var_48_23 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_30 + var_48_23
					end
				end

				arg_45_1.text_.text = var_48_27
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122011", "story_v_out_413122.awb") ~= 0 then
					local var_48_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122011", "story_v_out_413122.awb") / 1000

					if var_48_31 + var_48_23 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_31 + var_48_23
					end

					if var_48_26.prefab_name ~= "" and arg_45_1.actors_[var_48_26.prefab_name] ~= nil then
						local var_48_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_26.prefab_name].transform, "story_v_out_413122", "413122011", "story_v_out_413122.awb")

						arg_45_1:RecordAudio("413122011", var_48_32)
						arg_45_1:RecordAudio("413122011", var_48_32)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_413122", "413122011", "story_v_out_413122.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_413122", "413122011", "story_v_out_413122.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_33 = math.max(var_48_24, arg_45_1.talkMaxDuration)

			if var_48_23 <= arg_45_1.time_ and arg_45_1.time_ < var_48_23 + var_48_33 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_23) / var_48_33

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_23 + var_48_33 and arg_45_1.time_ < var_48_23 + var_48_33 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play413122012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 413122012
		arg_49_1.duration_ = 4.6

		local var_49_0 = {
			zh = 4.6,
			ja = 3.1
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
				arg_49_0:Play413122013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["10022"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.actorSpriteComps10022 == nil then
				arg_49_1.var_.actorSpriteComps10022 = var_52_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_2 = 2

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.actorSpriteComps10022 then
					for iter_52_0, iter_52_1 in pairs(arg_49_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_52_1 then
							if arg_49_1.isInRecall_ then
								local var_52_4 = Mathf.Lerp(iter_52_1.color.r, 0.82, var_52_3)
								local var_52_5 = Mathf.Lerp(iter_52_1.color.g, 0.77, var_52_3)
								local var_52_6 = Mathf.Lerp(iter_52_1.color.b, 0.62, var_52_3)

								iter_52_1.color = Color.New(var_52_4, var_52_5, var_52_6)
							else
								local var_52_7 = Mathf.Lerp(iter_52_1.color.r, 1, var_52_3)

								iter_52_1.color = Color.New(var_52_7, var_52_7, var_52_7)
							end
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.actorSpriteComps10022 then
				for iter_52_2, iter_52_3 in pairs(arg_49_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_52_3 then
						if arg_49_1.isInRecall_ then
							iter_52_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_52_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_49_1.var_.actorSpriteComps10022 = nil
			end

			local var_52_8 = arg_49_1.actors_["10092_1"]
			local var_52_9 = 0

			if var_52_9 < arg_49_1.time_ and arg_49_1.time_ <= var_52_9 + arg_52_0 and arg_49_1.var_.actorSpriteComps10092_1 == nil then
				arg_49_1.var_.actorSpriteComps10092_1 = var_52_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_10 = 2

			if var_52_9 <= arg_49_1.time_ and arg_49_1.time_ < var_52_9 + var_52_10 then
				local var_52_11 = (arg_49_1.time_ - var_52_9) / var_52_10

				if arg_49_1.var_.actorSpriteComps10092_1 then
					for iter_52_4, iter_52_5 in pairs(arg_49_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_52_5 then
							if arg_49_1.isInRecall_ then
								local var_52_12 = Mathf.Lerp(iter_52_5.color.r, 0.46, var_52_11)
								local var_52_13 = Mathf.Lerp(iter_52_5.color.g, 0.43, var_52_11)
								local var_52_14 = Mathf.Lerp(iter_52_5.color.b, 0.35, var_52_11)

								iter_52_5.color = Color.New(var_52_12, var_52_13, var_52_14)
							else
								local var_52_15 = Mathf.Lerp(iter_52_5.color.r, 0.5, var_52_11)

								iter_52_5.color = Color.New(var_52_15, var_52_15, var_52_15)
							end
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_9 + var_52_10 and arg_49_1.time_ < var_52_9 + var_52_10 + arg_52_0 and arg_49_1.var_.actorSpriteComps10092_1 then
				for iter_52_6, iter_52_7 in pairs(arg_49_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_52_7 then
						if arg_49_1.isInRecall_ then
							iter_52_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_52_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_49_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_52_16 = 0
			local var_52_17 = 0.6

			if var_52_16 < arg_49_1.time_ and arg_49_1.time_ <= var_52_16 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_18 = arg_49_1:FormatText(StoryNameCfg[614].name)

				arg_49_1.leftNameTxt_.text = var_52_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_19 = arg_49_1:GetWordFromCfg(413122012)
				local var_52_20 = arg_49_1:FormatText(var_52_19.content)

				arg_49_1.text_.text = var_52_20

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_21 = 24
				local var_52_22 = utf8.len(var_52_20)
				local var_52_23 = var_52_21 <= 0 and var_52_17 or var_52_17 * (var_52_22 / var_52_21)

				if var_52_23 > 0 and var_52_17 < var_52_23 then
					arg_49_1.talkMaxDuration = var_52_23

					if var_52_23 + var_52_16 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_23 + var_52_16
					end
				end

				arg_49_1.text_.text = var_52_20
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122012", "story_v_out_413122.awb") ~= 0 then
					local var_52_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122012", "story_v_out_413122.awb") / 1000

					if var_52_24 + var_52_16 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_24 + var_52_16
					end

					if var_52_19.prefab_name ~= "" and arg_49_1.actors_[var_52_19.prefab_name] ~= nil then
						local var_52_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_19.prefab_name].transform, "story_v_out_413122", "413122012", "story_v_out_413122.awb")

						arg_49_1:RecordAudio("413122012", var_52_25)
						arg_49_1:RecordAudio("413122012", var_52_25)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_413122", "413122012", "story_v_out_413122.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_413122", "413122012", "story_v_out_413122.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_26 = math.max(var_52_17, arg_49_1.talkMaxDuration)

			if var_52_16 <= arg_49_1.time_ and arg_49_1.time_ < var_52_16 + var_52_26 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_16) / var_52_26

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_16 + var_52_26 and arg_49_1.time_ < var_52_16 + var_52_26 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play413122013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 413122013
		arg_53_1.duration_ = 7.4

		local var_53_0 = {
			zh = 7.4,
			ja = 6.933
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
				arg_53_0:Play413122014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["10092_1"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.actorSpriteComps10092_1 == nil then
				arg_53_1.var_.actorSpriteComps10092_1 = var_56_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_56_2 = 2

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.actorSpriteComps10092_1 then
					for iter_56_0, iter_56_1 in pairs(arg_53_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_56_1 then
							if arg_53_1.isInRecall_ then
								local var_56_4 = Mathf.Lerp(iter_56_1.color.r, 0.82, var_56_3)
								local var_56_5 = Mathf.Lerp(iter_56_1.color.g, 0.77, var_56_3)
								local var_56_6 = Mathf.Lerp(iter_56_1.color.b, 0.62, var_56_3)

								iter_56_1.color = Color.New(var_56_4, var_56_5, var_56_6)
							else
								local var_56_7 = Mathf.Lerp(iter_56_1.color.r, 1, var_56_3)

								iter_56_1.color = Color.New(var_56_7, var_56_7, var_56_7)
							end
						end
					end
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.actorSpriteComps10092_1 then
				for iter_56_2, iter_56_3 in pairs(arg_53_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_56_3 then
						if arg_53_1.isInRecall_ then
							iter_56_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_56_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_53_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_56_8 = arg_53_1.actors_["10022"]
			local var_56_9 = 0

			if var_56_9 < arg_53_1.time_ and arg_53_1.time_ <= var_56_9 + arg_56_0 and arg_53_1.var_.actorSpriteComps10022 == nil then
				arg_53_1.var_.actorSpriteComps10022 = var_56_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_56_10 = 2

			if var_56_9 <= arg_53_1.time_ and arg_53_1.time_ < var_56_9 + var_56_10 then
				local var_56_11 = (arg_53_1.time_ - var_56_9) / var_56_10

				if arg_53_1.var_.actorSpriteComps10022 then
					for iter_56_4, iter_56_5 in pairs(arg_53_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_56_5 then
							if arg_53_1.isInRecall_ then
								local var_56_12 = Mathf.Lerp(iter_56_5.color.r, 0.46, var_56_11)
								local var_56_13 = Mathf.Lerp(iter_56_5.color.g, 0.43, var_56_11)
								local var_56_14 = Mathf.Lerp(iter_56_5.color.b, 0.35, var_56_11)

								iter_56_5.color = Color.New(var_56_12, var_56_13, var_56_14)
							else
								local var_56_15 = Mathf.Lerp(iter_56_5.color.r, 0.5, var_56_11)

								iter_56_5.color = Color.New(var_56_15, var_56_15, var_56_15)
							end
						end
					end
				end
			end

			if arg_53_1.time_ >= var_56_9 + var_56_10 and arg_53_1.time_ < var_56_9 + var_56_10 + arg_56_0 and arg_53_1.var_.actorSpriteComps10022 then
				for iter_56_6, iter_56_7 in pairs(arg_53_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_56_7 then
						if arg_53_1.isInRecall_ then
							iter_56_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_56_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_53_1.var_.actorSpriteComps10022 = nil
			end

			local var_56_16 = 0
			local var_56_17 = 0.925

			if var_56_16 < arg_53_1.time_ and arg_53_1.time_ <= var_56_16 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_18 = arg_53_1:FormatText(StoryNameCfg[996].name)

				arg_53_1.leftNameTxt_.text = var_56_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_19 = arg_53_1:GetWordFromCfg(413122013)
				local var_56_20 = arg_53_1:FormatText(var_56_19.content)

				arg_53_1.text_.text = var_56_20

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_21 = 37
				local var_56_22 = utf8.len(var_56_20)
				local var_56_23 = var_56_21 <= 0 and var_56_17 or var_56_17 * (var_56_22 / var_56_21)

				if var_56_23 > 0 and var_56_17 < var_56_23 then
					arg_53_1.talkMaxDuration = var_56_23

					if var_56_23 + var_56_16 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_23 + var_56_16
					end
				end

				arg_53_1.text_.text = var_56_20
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122013", "story_v_out_413122.awb") ~= 0 then
					local var_56_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122013", "story_v_out_413122.awb") / 1000

					if var_56_24 + var_56_16 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_24 + var_56_16
					end

					if var_56_19.prefab_name ~= "" and arg_53_1.actors_[var_56_19.prefab_name] ~= nil then
						local var_56_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_19.prefab_name].transform, "story_v_out_413122", "413122013", "story_v_out_413122.awb")

						arg_53_1:RecordAudio("413122013", var_56_25)
						arg_53_1:RecordAudio("413122013", var_56_25)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_413122", "413122013", "story_v_out_413122.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_413122", "413122013", "story_v_out_413122.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_26 = math.max(var_56_17, arg_53_1.talkMaxDuration)

			if var_56_16 <= arg_53_1.time_ and arg_53_1.time_ < var_56_16 + var_56_26 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_16) / var_56_26

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_16 + var_56_26 and arg_53_1.time_ < var_56_16 + var_56_26 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play413122014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 413122014
		arg_57_1.duration_ = 5.73

		local var_57_0 = {
			zh = 3.366,
			ja = 5.733
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
				arg_57_0:Play413122015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10092_1"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos10092_1 = var_60_0.localPosition
				var_60_0.localScale = Vector3.New(1, 1, 1)

				arg_57_1:CheckSpriteTmpPos("10092_1", 2)

				local var_60_2 = var_60_0.childCount

				for iter_60_0 = 0, var_60_2 - 1 do
					local var_60_3 = var_60_0:GetChild(iter_60_0)

					if var_60_3.name == "split_8" or not string.find(var_60_3.name, "split") then
						var_60_3.gameObject:SetActive(true)
					else
						var_60_3.gameObject:SetActive(false)
					end
				end
			end

			local var_60_4 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_4 then
				local var_60_5 = (arg_57_1.time_ - var_60_1) / var_60_4
				local var_60_6 = Vector3.New(-389.49, -300, -295)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10092_1, var_60_6, var_60_5)
			end

			if arg_57_1.time_ >= var_60_1 + var_60_4 and arg_57_1.time_ < var_60_1 + var_60_4 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_60_7 = arg_57_1.actors_["10092_1"]
			local var_60_8 = 0

			if var_60_8 < arg_57_1.time_ and arg_57_1.time_ <= var_60_8 + arg_60_0 and arg_57_1.var_.actorSpriteComps10092_1 == nil then
				arg_57_1.var_.actorSpriteComps10092_1 = var_60_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_60_9 = 2

			if var_60_8 <= arg_57_1.time_ and arg_57_1.time_ < var_60_8 + var_60_9 then
				local var_60_10 = (arg_57_1.time_ - var_60_8) / var_60_9

				if arg_57_1.var_.actorSpriteComps10092_1 then
					for iter_60_1, iter_60_2 in pairs(arg_57_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_60_2 then
							if arg_57_1.isInRecall_ then
								local var_60_11 = Mathf.Lerp(iter_60_2.color.r, 0.82, var_60_10)
								local var_60_12 = Mathf.Lerp(iter_60_2.color.g, 0.77, var_60_10)
								local var_60_13 = Mathf.Lerp(iter_60_2.color.b, 0.62, var_60_10)

								iter_60_2.color = Color.New(var_60_11, var_60_12, var_60_13)
							else
								local var_60_14 = Mathf.Lerp(iter_60_2.color.r, 1, var_60_10)

								iter_60_2.color = Color.New(var_60_14, var_60_14, var_60_14)
							end
						end
					end
				end
			end

			if arg_57_1.time_ >= var_60_8 + var_60_9 and arg_57_1.time_ < var_60_8 + var_60_9 + arg_60_0 and arg_57_1.var_.actorSpriteComps10092_1 then
				for iter_60_3, iter_60_4 in pairs(arg_57_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_60_4 then
						if arg_57_1.isInRecall_ then
							iter_60_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_60_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_57_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_60_15 = 0
			local var_60_16 = 0.6

			if var_60_15 < arg_57_1.time_ and arg_57_1.time_ <= var_60_15 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_17 = arg_57_1:FormatText(StoryNameCfg[996].name)

				arg_57_1.leftNameTxt_.text = var_60_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_18 = arg_57_1:GetWordFromCfg(413122014)
				local var_60_19 = arg_57_1:FormatText(var_60_18.content)

				arg_57_1.text_.text = var_60_19

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_20 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122014", "story_v_out_413122.awb") ~= 0 then
					local var_60_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122014", "story_v_out_413122.awb") / 1000

					if var_60_23 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_23 + var_60_15
					end

					if var_60_18.prefab_name ~= "" and arg_57_1.actors_[var_60_18.prefab_name] ~= nil then
						local var_60_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_18.prefab_name].transform, "story_v_out_413122", "413122014", "story_v_out_413122.awb")

						arg_57_1:RecordAudio("413122014", var_60_24)
						arg_57_1:RecordAudio("413122014", var_60_24)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_413122", "413122014", "story_v_out_413122.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_413122", "413122014", "story_v_out_413122.awb")
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
	Play413122015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 413122015
		arg_61_1.duration_ = 10.53

		local var_61_0 = {
			zh = 8.433,
			ja = 10.533
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
				arg_61_0:Play413122016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["10022"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.actorSpriteComps10022 == nil then
				arg_61_1.var_.actorSpriteComps10022 = var_64_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_2 = 2

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.actorSpriteComps10022 then
					for iter_64_0, iter_64_1 in pairs(arg_61_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_64_1 then
							if arg_61_1.isInRecall_ then
								local var_64_4 = Mathf.Lerp(iter_64_1.color.r, 0.82, var_64_3)
								local var_64_5 = Mathf.Lerp(iter_64_1.color.g, 0.77, var_64_3)
								local var_64_6 = Mathf.Lerp(iter_64_1.color.b, 0.62, var_64_3)

								iter_64_1.color = Color.New(var_64_4, var_64_5, var_64_6)
							else
								local var_64_7 = Mathf.Lerp(iter_64_1.color.r, 1, var_64_3)

								iter_64_1.color = Color.New(var_64_7, var_64_7, var_64_7)
							end
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.actorSpriteComps10022 then
				for iter_64_2, iter_64_3 in pairs(arg_61_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_64_3 then
						if arg_61_1.isInRecall_ then
							iter_64_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_64_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_61_1.var_.actorSpriteComps10022 = nil
			end

			local var_64_8 = arg_61_1.actors_["10092_1"]
			local var_64_9 = 0

			if var_64_9 < arg_61_1.time_ and arg_61_1.time_ <= var_64_9 + arg_64_0 and arg_61_1.var_.actorSpriteComps10092_1 == nil then
				arg_61_1.var_.actorSpriteComps10092_1 = var_64_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_10 = 2

			if var_64_9 <= arg_61_1.time_ and arg_61_1.time_ < var_64_9 + var_64_10 then
				local var_64_11 = (arg_61_1.time_ - var_64_9) / var_64_10

				if arg_61_1.var_.actorSpriteComps10092_1 then
					for iter_64_4, iter_64_5 in pairs(arg_61_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_64_5 then
							if arg_61_1.isInRecall_ then
								local var_64_12 = Mathf.Lerp(iter_64_5.color.r, 0.46, var_64_11)
								local var_64_13 = Mathf.Lerp(iter_64_5.color.g, 0.43, var_64_11)
								local var_64_14 = Mathf.Lerp(iter_64_5.color.b, 0.35, var_64_11)

								iter_64_5.color = Color.New(var_64_12, var_64_13, var_64_14)
							else
								local var_64_15 = Mathf.Lerp(iter_64_5.color.r, 0.5, var_64_11)

								iter_64_5.color = Color.New(var_64_15, var_64_15, var_64_15)
							end
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_9 + var_64_10 and arg_61_1.time_ < var_64_9 + var_64_10 + arg_64_0 and arg_61_1.var_.actorSpriteComps10092_1 then
				for iter_64_6, iter_64_7 in pairs(arg_61_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_64_7 then
						if arg_61_1.isInRecall_ then
							iter_64_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_64_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_61_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_64_16 = 0
			local var_64_17 = 1.15

			if var_64_16 < arg_61_1.time_ and arg_61_1.time_ <= var_64_16 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_18 = arg_61_1:FormatText(StoryNameCfg[614].name)

				arg_61_1.leftNameTxt_.text = var_64_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_19 = arg_61_1:GetWordFromCfg(413122015)
				local var_64_20 = arg_61_1:FormatText(var_64_19.content)

				arg_61_1.text_.text = var_64_20

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_21 = 46
				local var_64_22 = utf8.len(var_64_20)
				local var_64_23 = var_64_21 <= 0 and var_64_17 or var_64_17 * (var_64_22 / var_64_21)

				if var_64_23 > 0 and var_64_17 < var_64_23 then
					arg_61_1.talkMaxDuration = var_64_23

					if var_64_23 + var_64_16 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_23 + var_64_16
					end
				end

				arg_61_1.text_.text = var_64_20
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122015", "story_v_out_413122.awb") ~= 0 then
					local var_64_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122015", "story_v_out_413122.awb") / 1000

					if var_64_24 + var_64_16 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_24 + var_64_16
					end

					if var_64_19.prefab_name ~= "" and arg_61_1.actors_[var_64_19.prefab_name] ~= nil then
						local var_64_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_19.prefab_name].transform, "story_v_out_413122", "413122015", "story_v_out_413122.awb")

						arg_61_1:RecordAudio("413122015", var_64_25)
						arg_61_1:RecordAudio("413122015", var_64_25)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_413122", "413122015", "story_v_out_413122.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_413122", "413122015", "story_v_out_413122.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_26 = math.max(var_64_17, arg_61_1.talkMaxDuration)

			if var_64_16 <= arg_61_1.time_ and arg_61_1.time_ < var_64_16 + var_64_26 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_16) / var_64_26

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_16 + var_64_26 and arg_61_1.time_ < var_64_16 + var_64_26 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play413122016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 413122016
		arg_65_1.duration_ = 10.73

		local var_65_0 = {
			zh = 7,
			ja = 10.733
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
				arg_65_0:Play413122017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10022"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.actorSpriteComps10022 == nil then
				arg_65_1.var_.actorSpriteComps10022 = var_68_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_68_2 = 2

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.actorSpriteComps10022 then
					for iter_68_0, iter_68_1 in pairs(arg_65_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_68_1 then
							if arg_65_1.isInRecall_ then
								local var_68_4 = Mathf.Lerp(iter_68_1.color.r, 0.82, var_68_3)
								local var_68_5 = Mathf.Lerp(iter_68_1.color.g, 0.77, var_68_3)
								local var_68_6 = Mathf.Lerp(iter_68_1.color.b, 0.62, var_68_3)

								iter_68_1.color = Color.New(var_68_4, var_68_5, var_68_6)
							else
								local var_68_7 = Mathf.Lerp(iter_68_1.color.r, 1, var_68_3)

								iter_68_1.color = Color.New(var_68_7, var_68_7, var_68_7)
							end
						end
					end
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.actorSpriteComps10022 then
				for iter_68_2, iter_68_3 in pairs(arg_65_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_68_3 then
						if arg_65_1.isInRecall_ then
							iter_68_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_68_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_65_1.var_.actorSpriteComps10022 = nil
			end

			local var_68_8 = 0
			local var_68_9 = 0.975

			if var_68_8 < arg_65_1.time_ and arg_65_1.time_ <= var_68_8 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_10 = arg_65_1:FormatText(StoryNameCfg[614].name)

				arg_65_1.leftNameTxt_.text = var_68_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_11 = arg_65_1:GetWordFromCfg(413122016)
				local var_68_12 = arg_65_1:FormatText(var_68_11.content)

				arg_65_1.text_.text = var_68_12

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_13 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122016", "story_v_out_413122.awb") ~= 0 then
					local var_68_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122016", "story_v_out_413122.awb") / 1000

					if var_68_16 + var_68_8 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_16 + var_68_8
					end

					if var_68_11.prefab_name ~= "" and arg_65_1.actors_[var_68_11.prefab_name] ~= nil then
						local var_68_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_11.prefab_name].transform, "story_v_out_413122", "413122016", "story_v_out_413122.awb")

						arg_65_1:RecordAudio("413122016", var_68_17)
						arg_65_1:RecordAudio("413122016", var_68_17)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_413122", "413122016", "story_v_out_413122.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_413122", "413122016", "story_v_out_413122.awb")
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
	Play413122017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 413122017
		arg_69_1.duration_ = 5.4

		local var_69_0 = {
			zh = 5.4,
			ja = 4.033
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
				arg_69_0:Play413122018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["10092_1"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos10092_1 = var_72_0.localPosition
				var_72_0.localScale = Vector3.New(1, 1, 1)

				arg_69_1:CheckSpriteTmpPos("10092_1", 2)

				local var_72_2 = var_72_0.childCount

				for iter_72_0 = 0, var_72_2 - 1 do
					local var_72_3 = var_72_0:GetChild(iter_72_0)

					if var_72_3.name == "split_8" or not string.find(var_72_3.name, "split") then
						var_72_3.gameObject:SetActive(true)
					else
						var_72_3.gameObject:SetActive(false)
					end
				end
			end

			local var_72_4 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_4 then
				local var_72_5 = (arg_69_1.time_ - var_72_1) / var_72_4
				local var_72_6 = Vector3.New(-389.49, -300, -295)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos10092_1, var_72_6, var_72_5)
			end

			if arg_69_1.time_ >= var_72_1 + var_72_4 and arg_69_1.time_ < var_72_1 + var_72_4 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_72_7 = arg_69_1.actors_["10092_1"]
			local var_72_8 = 0

			if var_72_8 < arg_69_1.time_ and arg_69_1.time_ <= var_72_8 + arg_72_0 and arg_69_1.var_.actorSpriteComps10092_1 == nil then
				arg_69_1.var_.actorSpriteComps10092_1 = var_72_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_9 = 2

			if var_72_8 <= arg_69_1.time_ and arg_69_1.time_ < var_72_8 + var_72_9 then
				local var_72_10 = (arg_69_1.time_ - var_72_8) / var_72_9

				if arg_69_1.var_.actorSpriteComps10092_1 then
					for iter_72_1, iter_72_2 in pairs(arg_69_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_72_2 then
							if arg_69_1.isInRecall_ then
								local var_72_11 = Mathf.Lerp(iter_72_2.color.r, 0.82, var_72_10)
								local var_72_12 = Mathf.Lerp(iter_72_2.color.g, 0.77, var_72_10)
								local var_72_13 = Mathf.Lerp(iter_72_2.color.b, 0.62, var_72_10)

								iter_72_2.color = Color.New(var_72_11, var_72_12, var_72_13)
							else
								local var_72_14 = Mathf.Lerp(iter_72_2.color.r, 1, var_72_10)

								iter_72_2.color = Color.New(var_72_14, var_72_14, var_72_14)
							end
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_8 + var_72_9 and arg_69_1.time_ < var_72_8 + var_72_9 + arg_72_0 and arg_69_1.var_.actorSpriteComps10092_1 then
				for iter_72_3, iter_72_4 in pairs(arg_69_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_72_4 then
						if arg_69_1.isInRecall_ then
							iter_72_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_72_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_69_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_72_15 = arg_69_1.actors_["10022"]
			local var_72_16 = 0

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 and arg_69_1.var_.actorSpriteComps10022 == nil then
				arg_69_1.var_.actorSpriteComps10022 = var_72_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_17 = 2

			if var_72_16 <= arg_69_1.time_ and arg_69_1.time_ < var_72_16 + var_72_17 then
				local var_72_18 = (arg_69_1.time_ - var_72_16) / var_72_17

				if arg_69_1.var_.actorSpriteComps10022 then
					for iter_72_5, iter_72_6 in pairs(arg_69_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_72_6 then
							if arg_69_1.isInRecall_ then
								local var_72_19 = Mathf.Lerp(iter_72_6.color.r, 0.46, var_72_18)
								local var_72_20 = Mathf.Lerp(iter_72_6.color.g, 0.43, var_72_18)
								local var_72_21 = Mathf.Lerp(iter_72_6.color.b, 0.35, var_72_18)

								iter_72_6.color = Color.New(var_72_19, var_72_20, var_72_21)
							else
								local var_72_22 = Mathf.Lerp(iter_72_6.color.r, 0.5, var_72_18)

								iter_72_6.color = Color.New(var_72_22, var_72_22, var_72_22)
							end
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_16 + var_72_17 and arg_69_1.time_ < var_72_16 + var_72_17 + arg_72_0 and arg_69_1.var_.actorSpriteComps10022 then
				for iter_72_7, iter_72_8 in pairs(arg_69_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_72_8 then
						if arg_69_1.isInRecall_ then
							iter_72_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_72_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_69_1.var_.actorSpriteComps10022 = nil
			end

			local var_72_23 = 0
			local var_72_24 = 0.675

			if var_72_23 < arg_69_1.time_ and arg_69_1.time_ <= var_72_23 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_25 = arg_69_1:FormatText(StoryNameCfg[996].name)

				arg_69_1.leftNameTxt_.text = var_72_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_26 = arg_69_1:GetWordFromCfg(413122017)
				local var_72_27 = arg_69_1:FormatText(var_72_26.content)

				arg_69_1.text_.text = var_72_27

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_28 = 27
				local var_72_29 = utf8.len(var_72_27)
				local var_72_30 = var_72_28 <= 0 and var_72_24 or var_72_24 * (var_72_29 / var_72_28)

				if var_72_30 > 0 and var_72_24 < var_72_30 then
					arg_69_1.talkMaxDuration = var_72_30

					if var_72_30 + var_72_23 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_30 + var_72_23
					end
				end

				arg_69_1.text_.text = var_72_27
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122017", "story_v_out_413122.awb") ~= 0 then
					local var_72_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122017", "story_v_out_413122.awb") / 1000

					if var_72_31 + var_72_23 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_31 + var_72_23
					end

					if var_72_26.prefab_name ~= "" and arg_69_1.actors_[var_72_26.prefab_name] ~= nil then
						local var_72_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_26.prefab_name].transform, "story_v_out_413122", "413122017", "story_v_out_413122.awb")

						arg_69_1:RecordAudio("413122017", var_72_32)
						arg_69_1:RecordAudio("413122017", var_72_32)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_413122", "413122017", "story_v_out_413122.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_413122", "413122017", "story_v_out_413122.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_33 = math.max(var_72_24, arg_69_1.talkMaxDuration)

			if var_72_23 <= arg_69_1.time_ and arg_69_1.time_ < var_72_23 + var_72_33 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_23) / var_72_33

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_23 + var_72_33 and arg_69_1.time_ < var_72_23 + var_72_33 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play413122018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 413122018
		arg_73_1.duration_ = 4.5

		local var_73_0 = {
			zh = 3.466,
			ja = 4.5
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
				arg_73_0:Play413122019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["10092_1"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.actorSpriteComps10092_1 == nil then
				arg_73_1.var_.actorSpriteComps10092_1 = var_76_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_2 = 2

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.actorSpriteComps10092_1 then
					for iter_76_0, iter_76_1 in pairs(arg_73_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_76_1 then
							if arg_73_1.isInRecall_ then
								local var_76_4 = Mathf.Lerp(iter_76_1.color.r, 0.82, var_76_3)
								local var_76_5 = Mathf.Lerp(iter_76_1.color.g, 0.77, var_76_3)
								local var_76_6 = Mathf.Lerp(iter_76_1.color.b, 0.62, var_76_3)

								iter_76_1.color = Color.New(var_76_4, var_76_5, var_76_6)
							else
								local var_76_7 = Mathf.Lerp(iter_76_1.color.r, 1, var_76_3)

								iter_76_1.color = Color.New(var_76_7, var_76_7, var_76_7)
							end
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.actorSpriteComps10092_1 then
				for iter_76_2, iter_76_3 in pairs(arg_73_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_76_3 then
						if arg_73_1.isInRecall_ then
							iter_76_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_76_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_73_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_76_8 = 0
			local var_76_9 = 0.475

			if var_76_8 < arg_73_1.time_ and arg_73_1.time_ <= var_76_8 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_10 = arg_73_1:FormatText(StoryNameCfg[996].name)

				arg_73_1.leftNameTxt_.text = var_76_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_11 = arg_73_1:GetWordFromCfg(413122018)
				local var_76_12 = arg_73_1:FormatText(var_76_11.content)

				arg_73_1.text_.text = var_76_12

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_13 = 19
				local var_76_14 = utf8.len(var_76_12)
				local var_76_15 = var_76_13 <= 0 and var_76_9 or var_76_9 * (var_76_14 / var_76_13)

				if var_76_15 > 0 and var_76_9 < var_76_15 then
					arg_73_1.talkMaxDuration = var_76_15

					if var_76_15 + var_76_8 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_15 + var_76_8
					end
				end

				arg_73_1.text_.text = var_76_12
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122018", "story_v_out_413122.awb") ~= 0 then
					local var_76_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122018", "story_v_out_413122.awb") / 1000

					if var_76_16 + var_76_8 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_16 + var_76_8
					end

					if var_76_11.prefab_name ~= "" and arg_73_1.actors_[var_76_11.prefab_name] ~= nil then
						local var_76_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_11.prefab_name].transform, "story_v_out_413122", "413122018", "story_v_out_413122.awb")

						arg_73_1:RecordAudio("413122018", var_76_17)
						arg_73_1:RecordAudio("413122018", var_76_17)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_413122", "413122018", "story_v_out_413122.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_413122", "413122018", "story_v_out_413122.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_18 = math.max(var_76_9, arg_73_1.talkMaxDuration)

			if var_76_8 <= arg_73_1.time_ and arg_73_1.time_ < var_76_8 + var_76_18 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_8) / var_76_18

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_8 + var_76_18 and arg_73_1.time_ < var_76_8 + var_76_18 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play413122019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 413122019
		arg_77_1.duration_ = 5.4

		local var_77_0 = {
			zh = 4.766,
			ja = 5.4
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
				arg_77_0:Play413122020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10022"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.actorSpriteComps10022 == nil then
				arg_77_1.var_.actorSpriteComps10022 = var_80_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_2 = 2

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.actorSpriteComps10022 then
					for iter_80_0, iter_80_1 in pairs(arg_77_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_80_1 then
							if arg_77_1.isInRecall_ then
								local var_80_4 = Mathf.Lerp(iter_80_1.color.r, 0.82, var_80_3)
								local var_80_5 = Mathf.Lerp(iter_80_1.color.g, 0.77, var_80_3)
								local var_80_6 = Mathf.Lerp(iter_80_1.color.b, 0.62, var_80_3)

								iter_80_1.color = Color.New(var_80_4, var_80_5, var_80_6)
							else
								local var_80_7 = Mathf.Lerp(iter_80_1.color.r, 1, var_80_3)

								iter_80_1.color = Color.New(var_80_7, var_80_7, var_80_7)
							end
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.actorSpriteComps10022 then
				for iter_80_2, iter_80_3 in pairs(arg_77_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_80_3 then
						if arg_77_1.isInRecall_ then
							iter_80_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_80_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_77_1.var_.actorSpriteComps10022 = nil
			end

			local var_80_8 = arg_77_1.actors_["10092_1"]
			local var_80_9 = 0

			if var_80_9 < arg_77_1.time_ and arg_77_1.time_ <= var_80_9 + arg_80_0 and arg_77_1.var_.actorSpriteComps10092_1 == nil then
				arg_77_1.var_.actorSpriteComps10092_1 = var_80_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_10 = 2

			if var_80_9 <= arg_77_1.time_ and arg_77_1.time_ < var_80_9 + var_80_10 then
				local var_80_11 = (arg_77_1.time_ - var_80_9) / var_80_10

				if arg_77_1.var_.actorSpriteComps10092_1 then
					for iter_80_4, iter_80_5 in pairs(arg_77_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_80_5 then
							if arg_77_1.isInRecall_ then
								local var_80_12 = Mathf.Lerp(iter_80_5.color.r, 0.46, var_80_11)
								local var_80_13 = Mathf.Lerp(iter_80_5.color.g, 0.43, var_80_11)
								local var_80_14 = Mathf.Lerp(iter_80_5.color.b, 0.35, var_80_11)

								iter_80_5.color = Color.New(var_80_12, var_80_13, var_80_14)
							else
								local var_80_15 = Mathf.Lerp(iter_80_5.color.r, 0.5, var_80_11)

								iter_80_5.color = Color.New(var_80_15, var_80_15, var_80_15)
							end
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_9 + var_80_10 and arg_77_1.time_ < var_80_9 + var_80_10 + arg_80_0 and arg_77_1.var_.actorSpriteComps10092_1 then
				for iter_80_6, iter_80_7 in pairs(arg_77_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_80_7 then
						if arg_77_1.isInRecall_ then
							iter_80_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_80_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_77_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_80_16 = 0
			local var_80_17 = 0.65

			if var_80_16 < arg_77_1.time_ and arg_77_1.time_ <= var_80_16 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_18 = arg_77_1:FormatText(StoryNameCfg[614].name)

				arg_77_1.leftNameTxt_.text = var_80_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_19 = arg_77_1:GetWordFromCfg(413122019)
				local var_80_20 = arg_77_1:FormatText(var_80_19.content)

				arg_77_1.text_.text = var_80_20

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_21 = 26
				local var_80_22 = utf8.len(var_80_20)
				local var_80_23 = var_80_21 <= 0 and var_80_17 or var_80_17 * (var_80_22 / var_80_21)

				if var_80_23 > 0 and var_80_17 < var_80_23 then
					arg_77_1.talkMaxDuration = var_80_23

					if var_80_23 + var_80_16 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_23 + var_80_16
					end
				end

				arg_77_1.text_.text = var_80_20
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122019", "story_v_out_413122.awb") ~= 0 then
					local var_80_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122019", "story_v_out_413122.awb") / 1000

					if var_80_24 + var_80_16 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_24 + var_80_16
					end

					if var_80_19.prefab_name ~= "" and arg_77_1.actors_[var_80_19.prefab_name] ~= nil then
						local var_80_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_19.prefab_name].transform, "story_v_out_413122", "413122019", "story_v_out_413122.awb")

						arg_77_1:RecordAudio("413122019", var_80_25)
						arg_77_1:RecordAudio("413122019", var_80_25)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_413122", "413122019", "story_v_out_413122.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_413122", "413122019", "story_v_out_413122.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_26 = math.max(var_80_17, arg_77_1.talkMaxDuration)

			if var_80_16 <= arg_77_1.time_ and arg_77_1.time_ < var_80_16 + var_80_26 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_16) / var_80_26

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_16 + var_80_26 and arg_77_1.time_ < var_80_16 + var_80_26 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play413122020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 413122020
		arg_81_1.duration_ = 8.8

		local var_81_0 = {
			zh = 6.566,
			ja = 8.8
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
				arg_81_0:Play413122021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10092_1"].transform
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1.var_.moveOldPos10092_1 = var_84_0.localPosition
				var_84_0.localScale = Vector3.New(1, 1, 1)

				arg_81_1:CheckSpriteTmpPos("10092_1", 2)

				local var_84_2 = var_84_0.childCount

				for iter_84_0 = 0, var_84_2 - 1 do
					local var_84_3 = var_84_0:GetChild(iter_84_0)

					if var_84_3.name == "split_2" or not string.find(var_84_3.name, "split") then
						var_84_3.gameObject:SetActive(true)
					else
						var_84_3.gameObject:SetActive(false)
					end
				end
			end

			local var_84_4 = 0.001

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_4 then
				local var_84_5 = (arg_81_1.time_ - var_84_1) / var_84_4
				local var_84_6 = Vector3.New(-389.49, -300, -295)

				var_84_0.localPosition = Vector3.Lerp(arg_81_1.var_.moveOldPos10092_1, var_84_6, var_84_5)
			end

			if arg_81_1.time_ >= var_84_1 + var_84_4 and arg_81_1.time_ < var_84_1 + var_84_4 + arg_84_0 then
				var_84_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_84_7 = arg_81_1.actors_["10092_1"]
			local var_84_8 = 0

			if var_84_8 < arg_81_1.time_ and arg_81_1.time_ <= var_84_8 + arg_84_0 and arg_81_1.var_.actorSpriteComps10092_1 == nil then
				arg_81_1.var_.actorSpriteComps10092_1 = var_84_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_9 = 2

			if var_84_8 <= arg_81_1.time_ and arg_81_1.time_ < var_84_8 + var_84_9 then
				local var_84_10 = (arg_81_1.time_ - var_84_8) / var_84_9

				if arg_81_1.var_.actorSpriteComps10092_1 then
					for iter_84_1, iter_84_2 in pairs(arg_81_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_84_2 then
							if arg_81_1.isInRecall_ then
								local var_84_11 = Mathf.Lerp(iter_84_2.color.r, 0.82, var_84_10)
								local var_84_12 = Mathf.Lerp(iter_84_2.color.g, 0.77, var_84_10)
								local var_84_13 = Mathf.Lerp(iter_84_2.color.b, 0.62, var_84_10)

								iter_84_2.color = Color.New(var_84_11, var_84_12, var_84_13)
							else
								local var_84_14 = Mathf.Lerp(iter_84_2.color.r, 1, var_84_10)

								iter_84_2.color = Color.New(var_84_14, var_84_14, var_84_14)
							end
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_8 + var_84_9 and arg_81_1.time_ < var_84_8 + var_84_9 + arg_84_0 and arg_81_1.var_.actorSpriteComps10092_1 then
				for iter_84_3, iter_84_4 in pairs(arg_81_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_84_4 then
						if arg_81_1.isInRecall_ then
							iter_84_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_84_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_81_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_84_15 = arg_81_1.actors_["10022"]
			local var_84_16 = 0

			if var_84_16 < arg_81_1.time_ and arg_81_1.time_ <= var_84_16 + arg_84_0 and arg_81_1.var_.actorSpriteComps10022 == nil then
				arg_81_1.var_.actorSpriteComps10022 = var_84_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_17 = 2

			if var_84_16 <= arg_81_1.time_ and arg_81_1.time_ < var_84_16 + var_84_17 then
				local var_84_18 = (arg_81_1.time_ - var_84_16) / var_84_17

				if arg_81_1.var_.actorSpriteComps10022 then
					for iter_84_5, iter_84_6 in pairs(arg_81_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_84_6 then
							if arg_81_1.isInRecall_ then
								local var_84_19 = Mathf.Lerp(iter_84_6.color.r, 0.46, var_84_18)
								local var_84_20 = Mathf.Lerp(iter_84_6.color.g, 0.43, var_84_18)
								local var_84_21 = Mathf.Lerp(iter_84_6.color.b, 0.35, var_84_18)

								iter_84_6.color = Color.New(var_84_19, var_84_20, var_84_21)
							else
								local var_84_22 = Mathf.Lerp(iter_84_6.color.r, 0.5, var_84_18)

								iter_84_6.color = Color.New(var_84_22, var_84_22, var_84_22)
							end
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_16 + var_84_17 and arg_81_1.time_ < var_84_16 + var_84_17 + arg_84_0 and arg_81_1.var_.actorSpriteComps10022 then
				for iter_84_7, iter_84_8 in pairs(arg_81_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_84_8 then
						if arg_81_1.isInRecall_ then
							iter_84_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_84_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_81_1.var_.actorSpriteComps10022 = nil
			end

			local var_84_23 = 0
			local var_84_24 = 0.875

			if var_84_23 < arg_81_1.time_ and arg_81_1.time_ <= var_84_23 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_25 = arg_81_1:FormatText(StoryNameCfg[996].name)

				arg_81_1.leftNameTxt_.text = var_84_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_26 = arg_81_1:GetWordFromCfg(413122020)
				local var_84_27 = arg_81_1:FormatText(var_84_26.content)

				arg_81_1.text_.text = var_84_27

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_28 = 35
				local var_84_29 = utf8.len(var_84_27)
				local var_84_30 = var_84_28 <= 0 and var_84_24 or var_84_24 * (var_84_29 / var_84_28)

				if var_84_30 > 0 and var_84_24 < var_84_30 then
					arg_81_1.talkMaxDuration = var_84_30

					if var_84_30 + var_84_23 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_30 + var_84_23
					end
				end

				arg_81_1.text_.text = var_84_27
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122020", "story_v_out_413122.awb") ~= 0 then
					local var_84_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122020", "story_v_out_413122.awb") / 1000

					if var_84_31 + var_84_23 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_31 + var_84_23
					end

					if var_84_26.prefab_name ~= "" and arg_81_1.actors_[var_84_26.prefab_name] ~= nil then
						local var_84_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_26.prefab_name].transform, "story_v_out_413122", "413122020", "story_v_out_413122.awb")

						arg_81_1:RecordAudio("413122020", var_84_32)
						arg_81_1:RecordAudio("413122020", var_84_32)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_413122", "413122020", "story_v_out_413122.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_413122", "413122020", "story_v_out_413122.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_33 = math.max(var_84_24, arg_81_1.talkMaxDuration)

			if var_84_23 <= arg_81_1.time_ and arg_81_1.time_ < var_84_23 + var_84_33 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_23) / var_84_33

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_23 + var_84_33 and arg_81_1.time_ < var_84_23 + var_84_33 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play413122021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 413122021
		arg_85_1.duration_ = 7.33

		local var_85_0 = {
			zh = 5.166,
			ja = 7.333
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
				arg_85_0:Play413122022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10092_1"].transform
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.var_.moveOldPos10092_1 = var_88_0.localPosition
				var_88_0.localScale = Vector3.New(1, 1, 1)

				arg_85_1:CheckSpriteTmpPos("10092_1", 2)

				local var_88_2 = var_88_0.childCount

				for iter_88_0 = 0, var_88_2 - 1 do
					local var_88_3 = var_88_0:GetChild(iter_88_0)

					if var_88_3.name == "split_1_1" or not string.find(var_88_3.name, "split") then
						var_88_3.gameObject:SetActive(true)
					else
						var_88_3.gameObject:SetActive(false)
					end
				end
			end

			local var_88_4 = 0.001

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_4 then
				local var_88_5 = (arg_85_1.time_ - var_88_1) / var_88_4
				local var_88_6 = Vector3.New(-389.49, -300, -295)

				var_88_0.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10092_1, var_88_6, var_88_5)
			end

			if arg_85_1.time_ >= var_88_1 + var_88_4 and arg_85_1.time_ < var_88_1 + var_88_4 + arg_88_0 then
				var_88_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_88_7 = 0
			local var_88_8 = 0.675

			if var_88_7 < arg_85_1.time_ and arg_85_1.time_ <= var_88_7 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_9 = arg_85_1:FormatText(StoryNameCfg[996].name)

				arg_85_1.leftNameTxt_.text = var_88_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_10 = arg_85_1:GetWordFromCfg(413122021)
				local var_88_11 = arg_85_1:FormatText(var_88_10.content)

				arg_85_1.text_.text = var_88_11

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_12 = 27
				local var_88_13 = utf8.len(var_88_11)
				local var_88_14 = var_88_12 <= 0 and var_88_8 or var_88_8 * (var_88_13 / var_88_12)

				if var_88_14 > 0 and var_88_8 < var_88_14 then
					arg_85_1.talkMaxDuration = var_88_14

					if var_88_14 + var_88_7 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_14 + var_88_7
					end
				end

				arg_85_1.text_.text = var_88_11
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122021", "story_v_out_413122.awb") ~= 0 then
					local var_88_15 = manager.audio:GetVoiceLength("story_v_out_413122", "413122021", "story_v_out_413122.awb") / 1000

					if var_88_15 + var_88_7 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_15 + var_88_7
					end

					if var_88_10.prefab_name ~= "" and arg_85_1.actors_[var_88_10.prefab_name] ~= nil then
						local var_88_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_10.prefab_name].transform, "story_v_out_413122", "413122021", "story_v_out_413122.awb")

						arg_85_1:RecordAudio("413122021", var_88_16)
						arg_85_1:RecordAudio("413122021", var_88_16)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_413122", "413122021", "story_v_out_413122.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_413122", "413122021", "story_v_out_413122.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_17 = math.max(var_88_8, arg_85_1.talkMaxDuration)

			if var_88_7 <= arg_85_1.time_ and arg_85_1.time_ < var_88_7 + var_88_17 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_7) / var_88_17

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_7 + var_88_17 and arg_85_1.time_ < var_88_7 + var_88_17 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play413122022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 413122022
		arg_89_1.duration_ = 5.77

		local var_89_0 = {
			zh = 4.366,
			ja = 5.766
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
				arg_89_0:Play413122023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.525

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[996].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(413122022)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 21
				local var_92_6 = utf8.len(var_92_4)
				local var_92_7 = var_92_5 <= 0 and var_92_1 or var_92_1 * (var_92_6 / var_92_5)

				if var_92_7 > 0 and var_92_1 < var_92_7 then
					arg_89_1.talkMaxDuration = var_92_7

					if var_92_7 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_7 + var_92_0
					end
				end

				arg_89_1.text_.text = var_92_4
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122022", "story_v_out_413122.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122022", "story_v_out_413122.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_out_413122", "413122022", "story_v_out_413122.awb")

						arg_89_1:RecordAudio("413122022", var_92_9)
						arg_89_1:RecordAudio("413122022", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_413122", "413122022", "story_v_out_413122.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_413122", "413122022", "story_v_out_413122.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_10 = math.max(var_92_1, arg_89_1.talkMaxDuration)

			if var_92_0 <= arg_89_1.time_ and arg_89_1.time_ < var_92_0 + var_92_10 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_0) / var_92_10

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_0 + var_92_10 and arg_89_1.time_ < var_92_0 + var_92_10 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play413122023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 413122023
		arg_93_1.duration_ = 7

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play413122024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["10092_1"].transform
			local var_96_1 = 1

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.var_.moveOldPos10092_1 = var_96_0.localPosition
				var_96_0.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("10092_1", 6)

				local var_96_2 = var_96_0.childCount

				for iter_96_0 = 0, var_96_2 - 1 do
					local var_96_3 = var_96_0:GetChild(iter_96_0)

					if var_96_3.name == "" or not string.find(var_96_3.name, "split") then
						var_96_3.gameObject:SetActive(true)
					else
						var_96_3.gameObject:SetActive(false)
					end
				end
			end

			local var_96_4 = 0.001

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_4 then
				local var_96_5 = (arg_93_1.time_ - var_96_1) / var_96_4
				local var_96_6 = Vector3.New(1500, -300, -295)

				var_96_0.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10092_1, var_96_6, var_96_5)
			end

			if arg_93_1.time_ >= var_96_1 + var_96_4 and arg_93_1.time_ < var_96_1 + var_96_4 + arg_96_0 then
				var_96_0.localPosition = Vector3.New(1500, -300, -295)
			end

			local var_96_7 = arg_93_1.actors_["10022"].transform
			local var_96_8 = 1

			if var_96_8 < arg_93_1.time_ and arg_93_1.time_ <= var_96_8 + arg_96_0 then
				arg_93_1.var_.moveOldPos10022 = var_96_7.localPosition
				var_96_7.localScale = Vector3.New(1, 1, 1)

				arg_93_1:CheckSpriteTmpPos("10022", 6)

				local var_96_9 = var_96_7.childCount

				for iter_96_1 = 0, var_96_9 - 1 do
					local var_96_10 = var_96_7:GetChild(iter_96_1)

					if var_96_10.name == "" or not string.find(var_96_10.name, "split") then
						var_96_10.gameObject:SetActive(true)
					else
						var_96_10.gameObject:SetActive(false)
					end
				end
			end

			local var_96_11 = 0.001

			if var_96_8 <= arg_93_1.time_ and arg_93_1.time_ < var_96_8 + var_96_11 then
				local var_96_12 = (arg_93_1.time_ - var_96_8) / var_96_11
				local var_96_13 = Vector3.New(1500, -315, -320)

				var_96_7.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10022, var_96_13, var_96_12)
			end

			if arg_93_1.time_ >= var_96_8 + var_96_11 and arg_93_1.time_ < var_96_8 + var_96_11 + arg_96_0 then
				var_96_7.localPosition = Vector3.New(1500, -315, -320)
			end

			local var_96_14 = 1

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 then
				local var_96_15 = manager.ui.mainCamera.transform.localPosition
				local var_96_16 = Vector3.New(0, 0, 10) + Vector3.New(var_96_15.x, var_96_15.y, 0)
				local var_96_17 = arg_93_1.bgs_.ST0603a

				var_96_17.transform.localPosition = var_96_16
				var_96_17.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_96_18 = var_96_17:GetComponent("SpriteRenderer")

				if var_96_18 and var_96_18.sprite then
					local var_96_19 = (var_96_17.transform.localPosition - var_96_15).z
					local var_96_20 = manager.ui.mainCameraCom_
					local var_96_21 = 2 * var_96_19 * Mathf.Tan(var_96_20.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_96_22 = var_96_21 * var_96_20.aspect
					local var_96_23 = var_96_18.sprite.bounds.size.x
					local var_96_24 = var_96_18.sprite.bounds.size.y
					local var_96_25 = var_96_22 / var_96_23
					local var_96_26 = var_96_21 / var_96_24
					local var_96_27 = var_96_26 < var_96_25 and var_96_25 or var_96_26

					var_96_17.transform.localScale = Vector3.New(var_96_27, var_96_27, 0)
				end

				for iter_96_2, iter_96_3 in pairs(arg_93_1.bgs_) do
					if iter_96_2 ~= "ST0603a" then
						iter_96_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_96_28 = 0

			if var_96_28 < arg_93_1.time_ and arg_93_1.time_ <= var_96_28 + arg_96_0 then
				arg_93_1.mask_.enabled = true
				arg_93_1.mask_.raycastTarget = true

				arg_93_1:SetGaussion(false)
			end

			local var_96_29 = 1

			if var_96_28 <= arg_93_1.time_ and arg_93_1.time_ < var_96_28 + var_96_29 then
				local var_96_30 = (arg_93_1.time_ - var_96_28) / var_96_29
				local var_96_31 = Color.New(0, 0, 0)

				var_96_31.a = Mathf.Lerp(0, 1, var_96_30)
				arg_93_1.mask_.color = var_96_31
			end

			if arg_93_1.time_ >= var_96_28 + var_96_29 and arg_93_1.time_ < var_96_28 + var_96_29 + arg_96_0 then
				local var_96_32 = Color.New(0, 0, 0)

				var_96_32.a = 1
				arg_93_1.mask_.color = var_96_32
			end

			local var_96_33 = 1

			if var_96_33 < arg_93_1.time_ and arg_93_1.time_ <= var_96_33 + arg_96_0 then
				arg_93_1.mask_.enabled = true
				arg_93_1.mask_.raycastTarget = true

				arg_93_1:SetGaussion(false)
			end

			local var_96_34 = 1

			if var_96_33 <= arg_93_1.time_ and arg_93_1.time_ < var_96_33 + var_96_34 then
				local var_96_35 = (arg_93_1.time_ - var_96_33) / var_96_34
				local var_96_36 = Color.New(0, 0, 0)

				var_96_36.a = Mathf.Lerp(1, 0, var_96_35)
				arg_93_1.mask_.color = var_96_36
			end

			if arg_93_1.time_ >= var_96_33 + var_96_34 and arg_93_1.time_ < var_96_33 + var_96_34 + arg_96_0 then
				local var_96_37 = Color.New(0, 0, 0)
				local var_96_38 = 0

				arg_93_1.mask_.enabled = false
				var_96_37.a = var_96_38
				arg_93_1.mask_.color = var_96_37
			end

			if arg_93_1.frameCnt_ <= 1 then
				arg_93_1.dialog_:SetActive(false)
			end

			local var_96_39 = 2
			local var_96_40 = 1.45

			if var_96_39 < arg_93_1.time_ and arg_93_1.time_ <= var_96_39 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0

				arg_93_1.dialog_:SetActive(true)

				local var_96_41 = LeanTween.value(arg_93_1.dialog_, 0, 1, 0.3)

				var_96_41:setOnUpdate(LuaHelper.FloatAction(function(arg_97_0)
					arg_93_1.dialogCg_.alpha = arg_97_0
				end))
				var_96_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_93_1.dialog_)
					var_96_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_93_1.duration_ = arg_93_1.duration_ + 0.3

				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_42 = arg_93_1:GetWordFromCfg(413122023)
				local var_96_43 = arg_93_1:FormatText(var_96_42.content)

				arg_93_1.text_.text = var_96_43

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_44 = 58
				local var_96_45 = utf8.len(var_96_43)
				local var_96_46 = var_96_44 <= 0 and var_96_40 or var_96_40 * (var_96_45 / var_96_44)

				if var_96_46 > 0 and var_96_40 < var_96_46 then
					arg_93_1.talkMaxDuration = var_96_46
					var_96_39 = var_96_39 + 0.3

					if var_96_46 + var_96_39 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_46 + var_96_39
					end
				end

				arg_93_1.text_.text = var_96_43
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_47 = var_96_39 + 0.3
			local var_96_48 = math.max(var_96_40, arg_93_1.talkMaxDuration)

			if var_96_47 <= arg_93_1.time_ and arg_93_1.time_ < var_96_47 + var_96_48 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_47) / var_96_48

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_47 + var_96_48 and arg_93_1.time_ < var_96_47 + var_96_48 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play413122024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 413122024
		arg_99_1.duration_ = 5.53

		local var_99_0 = {
			zh = 3.166,
			ja = 5.533
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
				arg_99_0:Play413122025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10092_1"].transform
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 then
				arg_99_1.var_.moveOldPos10092_1 = var_102_0.localPosition
				var_102_0.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("10092_1", 2)

				local var_102_2 = var_102_0.childCount

				for iter_102_0 = 0, var_102_2 - 1 do
					local var_102_3 = var_102_0:GetChild(iter_102_0)

					if var_102_3.name == "" or not string.find(var_102_3.name, "split") then
						var_102_3.gameObject:SetActive(true)
					else
						var_102_3.gameObject:SetActive(false)
					end
				end
			end

			local var_102_4 = 0.001

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_4 then
				local var_102_5 = (arg_99_1.time_ - var_102_1) / var_102_4
				local var_102_6 = Vector3.New(-389.49, -300, -295)

				var_102_0.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10092_1, var_102_6, var_102_5)
			end

			if arg_99_1.time_ >= var_102_1 + var_102_4 and arg_99_1.time_ < var_102_1 + var_102_4 + arg_102_0 then
				var_102_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_102_7 = arg_99_1.actors_["10022"].transform
			local var_102_8 = 0

			if var_102_8 < arg_99_1.time_ and arg_99_1.time_ <= var_102_8 + arg_102_0 then
				arg_99_1.var_.moveOldPos10022 = var_102_7.localPosition
				var_102_7.localScale = Vector3.New(1, 1, 1)

				arg_99_1:CheckSpriteTmpPos("10022", 7)

				local var_102_9 = var_102_7.childCount

				for iter_102_1 = 0, var_102_9 - 1 do
					local var_102_10 = var_102_7:GetChild(iter_102_1)

					if var_102_10.name == "" or not string.find(var_102_10.name, "split") then
						var_102_10.gameObject:SetActive(true)
					else
						var_102_10.gameObject:SetActive(false)
					end
				end
			end

			local var_102_11 = 0.001

			if var_102_8 <= arg_99_1.time_ and arg_99_1.time_ < var_102_8 + var_102_11 then
				local var_102_12 = (arg_99_1.time_ - var_102_8) / var_102_11
				local var_102_13 = Vector3.New(0, -2000, 0)

				var_102_7.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos10022, var_102_13, var_102_12)
			end

			if arg_99_1.time_ >= var_102_8 + var_102_11 and arg_99_1.time_ < var_102_8 + var_102_11 + arg_102_0 then
				var_102_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_102_14 = arg_99_1.actors_["10092_1"]
			local var_102_15 = 0

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 and arg_99_1.var_.actorSpriteComps10092_1 == nil then
				arg_99_1.var_.actorSpriteComps10092_1 = var_102_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_16 = 2

			if var_102_15 <= arg_99_1.time_ and arg_99_1.time_ < var_102_15 + var_102_16 then
				local var_102_17 = (arg_99_1.time_ - var_102_15) / var_102_16

				if arg_99_1.var_.actorSpriteComps10092_1 then
					for iter_102_2, iter_102_3 in pairs(arg_99_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_102_3 then
							if arg_99_1.isInRecall_ then
								local var_102_18 = Mathf.Lerp(iter_102_3.color.r, 0.82, var_102_17)
								local var_102_19 = Mathf.Lerp(iter_102_3.color.g, 0.77, var_102_17)
								local var_102_20 = Mathf.Lerp(iter_102_3.color.b, 0.62, var_102_17)

								iter_102_3.color = Color.New(var_102_18, var_102_19, var_102_20)
							else
								local var_102_21 = Mathf.Lerp(iter_102_3.color.r, 1, var_102_17)

								iter_102_3.color = Color.New(var_102_21, var_102_21, var_102_21)
							end
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_15 + var_102_16 and arg_99_1.time_ < var_102_15 + var_102_16 + arg_102_0 and arg_99_1.var_.actorSpriteComps10092_1 then
				for iter_102_4, iter_102_5 in pairs(arg_99_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_102_5 then
						if arg_99_1.isInRecall_ then
							iter_102_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_102_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_99_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_102_22 = arg_99_1.actors_["10022"]
			local var_102_23 = 0

			if var_102_23 < arg_99_1.time_ and arg_99_1.time_ <= var_102_23 + arg_102_0 and arg_99_1.var_.actorSpriteComps10022 == nil then
				arg_99_1.var_.actorSpriteComps10022 = var_102_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_24 = 2

			if var_102_23 <= arg_99_1.time_ and arg_99_1.time_ < var_102_23 + var_102_24 then
				local var_102_25 = (arg_99_1.time_ - var_102_23) / var_102_24

				if arg_99_1.var_.actorSpriteComps10022 then
					for iter_102_6, iter_102_7 in pairs(arg_99_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_102_7 then
							if arg_99_1.isInRecall_ then
								local var_102_26 = Mathf.Lerp(iter_102_7.color.r, 0.46, var_102_25)
								local var_102_27 = Mathf.Lerp(iter_102_7.color.g, 0.43, var_102_25)
								local var_102_28 = Mathf.Lerp(iter_102_7.color.b, 0.35, var_102_25)

								iter_102_7.color = Color.New(var_102_26, var_102_27, var_102_28)
							else
								local var_102_29 = Mathf.Lerp(iter_102_7.color.r, 0.5, var_102_25)

								iter_102_7.color = Color.New(var_102_29, var_102_29, var_102_29)
							end
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_23 + var_102_24 and arg_99_1.time_ < var_102_23 + var_102_24 + arg_102_0 and arg_99_1.var_.actorSpriteComps10022 then
				for iter_102_8, iter_102_9 in pairs(arg_99_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_102_9 then
						if arg_99_1.isInRecall_ then
							iter_102_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_102_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_99_1.var_.actorSpriteComps10022 = nil
			end

			local var_102_30 = 0
			local var_102_31 = 0.325

			if var_102_30 < arg_99_1.time_ and arg_99_1.time_ <= var_102_30 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_32 = arg_99_1:FormatText(StoryNameCfg[996].name)

				arg_99_1.leftNameTxt_.text = var_102_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_33 = arg_99_1:GetWordFromCfg(413122024)
				local var_102_34 = arg_99_1:FormatText(var_102_33.content)

				arg_99_1.text_.text = var_102_34

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_35 = 13
				local var_102_36 = utf8.len(var_102_34)
				local var_102_37 = var_102_35 <= 0 and var_102_31 or var_102_31 * (var_102_36 / var_102_35)

				if var_102_37 > 0 and var_102_31 < var_102_37 then
					arg_99_1.talkMaxDuration = var_102_37

					if var_102_37 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_37 + var_102_30
					end
				end

				arg_99_1.text_.text = var_102_34
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122024", "story_v_out_413122.awb") ~= 0 then
					local var_102_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122024", "story_v_out_413122.awb") / 1000

					if var_102_38 + var_102_30 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_38 + var_102_30
					end

					if var_102_33.prefab_name ~= "" and arg_99_1.actors_[var_102_33.prefab_name] ~= nil then
						local var_102_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_33.prefab_name].transform, "story_v_out_413122", "413122024", "story_v_out_413122.awb")

						arg_99_1:RecordAudio("413122024", var_102_39)
						arg_99_1:RecordAudio("413122024", var_102_39)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_413122", "413122024", "story_v_out_413122.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_413122", "413122024", "story_v_out_413122.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_40 = math.max(var_102_31, arg_99_1.talkMaxDuration)

			if var_102_30 <= arg_99_1.time_ and arg_99_1.time_ < var_102_30 + var_102_40 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_30) / var_102_40

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_30 + var_102_40 and arg_99_1.time_ < var_102_30 + var_102_40 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play413122025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 413122025
		arg_103_1.duration_ = 4.7

		local var_103_0 = {
			zh = 3.2,
			ja = 4.7
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
				arg_103_0:Play413122026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10022"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10022 = var_106_0.localPosition
				var_106_0.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("10022", 4)

				local var_106_2 = var_106_0.childCount

				for iter_106_0 = 0, var_106_2 - 1 do
					local var_106_3 = var_106_0:GetChild(iter_106_0)

					if var_106_3.name == "" or not string.find(var_106_3.name, "split") then
						var_106_3.gameObject:SetActive(true)
					else
						var_106_3.gameObject:SetActive(false)
					end
				end
			end

			local var_106_4 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_4 then
				local var_106_5 = (arg_103_1.time_ - var_106_1) / var_106_4
				local var_106_6 = Vector3.New(390, -315, -320)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10022, var_106_6, var_106_5)
			end

			if arg_103_1.time_ >= var_106_1 + var_106_4 and arg_103_1.time_ < var_106_1 + var_106_4 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(390, -315, -320)
			end

			local var_106_7 = arg_103_1.actors_["10092_1"].transform
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 then
				arg_103_1.var_.moveOldPos10092_1 = var_106_7.localPosition
				var_106_7.localScale = Vector3.New(1, 1, 1)

				arg_103_1:CheckSpriteTmpPos("10092_1", 2)

				local var_106_9 = var_106_7.childCount

				for iter_106_1 = 0, var_106_9 - 1 do
					local var_106_10 = var_106_7:GetChild(iter_106_1)

					if var_106_10.name == "" or not string.find(var_106_10.name, "split") then
						var_106_10.gameObject:SetActive(true)
					else
						var_106_10.gameObject:SetActive(false)
					end
				end
			end

			local var_106_11 = 0.001

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_8) / var_106_11
				local var_106_13 = Vector3.New(-389.49, -300, -295)

				var_106_7.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10092_1, var_106_13, var_106_12)
			end

			if arg_103_1.time_ >= var_106_8 + var_106_11 and arg_103_1.time_ < var_106_8 + var_106_11 + arg_106_0 then
				var_106_7.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_106_14 = arg_103_1.actors_["10022"]
			local var_106_15 = 0

			if var_106_15 < arg_103_1.time_ and arg_103_1.time_ <= var_106_15 + arg_106_0 and arg_103_1.var_.actorSpriteComps10022 == nil then
				arg_103_1.var_.actorSpriteComps10022 = var_106_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_16 = 2

			if var_106_15 <= arg_103_1.time_ and arg_103_1.time_ < var_106_15 + var_106_16 then
				local var_106_17 = (arg_103_1.time_ - var_106_15) / var_106_16

				if arg_103_1.var_.actorSpriteComps10022 then
					for iter_106_2, iter_106_3 in pairs(arg_103_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_106_3 then
							if arg_103_1.isInRecall_ then
								local var_106_18 = Mathf.Lerp(iter_106_3.color.r, 0.82, var_106_17)
								local var_106_19 = Mathf.Lerp(iter_106_3.color.g, 0.77, var_106_17)
								local var_106_20 = Mathf.Lerp(iter_106_3.color.b, 0.62, var_106_17)

								iter_106_3.color = Color.New(var_106_18, var_106_19, var_106_20)
							else
								local var_106_21 = Mathf.Lerp(iter_106_3.color.r, 1, var_106_17)

								iter_106_3.color = Color.New(var_106_21, var_106_21, var_106_21)
							end
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_15 + var_106_16 and arg_103_1.time_ < var_106_15 + var_106_16 + arg_106_0 and arg_103_1.var_.actorSpriteComps10022 then
				for iter_106_4, iter_106_5 in pairs(arg_103_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_106_5 then
						if arg_103_1.isInRecall_ then
							iter_106_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_106_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_103_1.var_.actorSpriteComps10022 = nil
			end

			local var_106_22 = arg_103_1.actors_["10092_1"]
			local var_106_23 = 0

			if var_106_23 < arg_103_1.time_ and arg_103_1.time_ <= var_106_23 + arg_106_0 and arg_103_1.var_.actorSpriteComps10092_1 == nil then
				arg_103_1.var_.actorSpriteComps10092_1 = var_106_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_24 = 2

			if var_106_23 <= arg_103_1.time_ and arg_103_1.time_ < var_106_23 + var_106_24 then
				local var_106_25 = (arg_103_1.time_ - var_106_23) / var_106_24

				if arg_103_1.var_.actorSpriteComps10092_1 then
					for iter_106_6, iter_106_7 in pairs(arg_103_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_106_7 then
							if arg_103_1.isInRecall_ then
								local var_106_26 = Mathf.Lerp(iter_106_7.color.r, 0.46, var_106_25)
								local var_106_27 = Mathf.Lerp(iter_106_7.color.g, 0.43, var_106_25)
								local var_106_28 = Mathf.Lerp(iter_106_7.color.b, 0.35, var_106_25)

								iter_106_7.color = Color.New(var_106_26, var_106_27, var_106_28)
							else
								local var_106_29 = Mathf.Lerp(iter_106_7.color.r, 0.5, var_106_25)

								iter_106_7.color = Color.New(var_106_29, var_106_29, var_106_29)
							end
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_23 + var_106_24 and arg_103_1.time_ < var_106_23 + var_106_24 + arg_106_0 and arg_103_1.var_.actorSpriteComps10092_1 then
				for iter_106_8, iter_106_9 in pairs(arg_103_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_106_9 then
						if arg_103_1.isInRecall_ then
							iter_106_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_106_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_103_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_106_30 = 0
			local var_106_31 = 0.375

			if var_106_30 < arg_103_1.time_ and arg_103_1.time_ <= var_106_30 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_32 = arg_103_1:FormatText(StoryNameCfg[614].name)

				arg_103_1.leftNameTxt_.text = var_106_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_33 = arg_103_1:GetWordFromCfg(413122025)
				local var_106_34 = arg_103_1:FormatText(var_106_33.content)

				arg_103_1.text_.text = var_106_34

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_35 = 15
				local var_106_36 = utf8.len(var_106_34)
				local var_106_37 = var_106_35 <= 0 and var_106_31 or var_106_31 * (var_106_36 / var_106_35)

				if var_106_37 > 0 and var_106_31 < var_106_37 then
					arg_103_1.talkMaxDuration = var_106_37

					if var_106_37 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_37 + var_106_30
					end
				end

				arg_103_1.text_.text = var_106_34
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122025", "story_v_out_413122.awb") ~= 0 then
					local var_106_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122025", "story_v_out_413122.awb") / 1000

					if var_106_38 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_38 + var_106_30
					end

					if var_106_33.prefab_name ~= "" and arg_103_1.actors_[var_106_33.prefab_name] ~= nil then
						local var_106_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_33.prefab_name].transform, "story_v_out_413122", "413122025", "story_v_out_413122.awb")

						arg_103_1:RecordAudio("413122025", var_106_39)
						arg_103_1:RecordAudio("413122025", var_106_39)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_413122", "413122025", "story_v_out_413122.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_413122", "413122025", "story_v_out_413122.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_40 = math.max(var_106_31, arg_103_1.talkMaxDuration)

			if var_106_30 <= arg_103_1.time_ and arg_103_1.time_ < var_106_30 + var_106_40 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_30) / var_106_40

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_30 + var_106_40 and arg_103_1.time_ < var_106_30 + var_106_40 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play413122026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 413122026
		arg_107_1.duration_ = 5.3

		local var_107_0 = {
			zh = 5.3,
			ja = 2.866
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
				arg_107_0:Play413122027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["10092_1"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos10092_1 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("10092_1", 2)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "split_2" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(-389.49, -300, -295)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10092_1, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_110_7 = arg_107_1.actors_["10022"].transform
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 then
				arg_107_1.var_.moveOldPos10022 = var_110_7.localPosition
				var_110_7.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("10022", 4)

				local var_110_9 = var_110_7.childCount

				for iter_110_1 = 0, var_110_9 - 1 do
					local var_110_10 = var_110_7:GetChild(iter_110_1)

					if var_110_10.name == "" or not string.find(var_110_10.name, "split") then
						var_110_10.gameObject:SetActive(true)
					else
						var_110_10.gameObject:SetActive(false)
					end
				end
			end

			local var_110_11 = 0.001

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_8) / var_110_11
				local var_110_13 = Vector3.New(390, -315, -320)

				var_110_7.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10022, var_110_13, var_110_12)
			end

			if arg_107_1.time_ >= var_110_8 + var_110_11 and arg_107_1.time_ < var_110_8 + var_110_11 + arg_110_0 then
				var_110_7.localPosition = Vector3.New(390, -315, -320)
			end

			local var_110_14 = arg_107_1.actors_["10022"]
			local var_110_15 = 0

			if var_110_15 < arg_107_1.time_ and arg_107_1.time_ <= var_110_15 + arg_110_0 and arg_107_1.var_.actorSpriteComps10022 == nil then
				arg_107_1.var_.actorSpriteComps10022 = var_110_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_16 = 2

			if var_110_15 <= arg_107_1.time_ and arg_107_1.time_ < var_110_15 + var_110_16 then
				local var_110_17 = (arg_107_1.time_ - var_110_15) / var_110_16

				if arg_107_1.var_.actorSpriteComps10022 then
					for iter_110_2, iter_110_3 in pairs(arg_107_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_110_3 then
							if arg_107_1.isInRecall_ then
								local var_110_18 = Mathf.Lerp(iter_110_3.color.r, 0.46, var_110_17)
								local var_110_19 = Mathf.Lerp(iter_110_3.color.g, 0.43, var_110_17)
								local var_110_20 = Mathf.Lerp(iter_110_3.color.b, 0.35, var_110_17)

								iter_110_3.color = Color.New(var_110_18, var_110_19, var_110_20)
							else
								local var_110_21 = Mathf.Lerp(iter_110_3.color.r, 0.5, var_110_17)

								iter_110_3.color = Color.New(var_110_21, var_110_21, var_110_21)
							end
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_15 + var_110_16 and arg_107_1.time_ < var_110_15 + var_110_16 + arg_110_0 and arg_107_1.var_.actorSpriteComps10022 then
				for iter_110_4, iter_110_5 in pairs(arg_107_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_110_5 then
						if arg_107_1.isInRecall_ then
							iter_110_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_110_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_107_1.var_.actorSpriteComps10022 = nil
			end

			local var_110_22 = arg_107_1.actors_["10092_1"]
			local var_110_23 = 0

			if var_110_23 < arg_107_1.time_ and arg_107_1.time_ <= var_110_23 + arg_110_0 and arg_107_1.var_.actorSpriteComps10092_1 == nil then
				arg_107_1.var_.actorSpriteComps10092_1 = var_110_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_24 = 2

			if var_110_23 <= arg_107_1.time_ and arg_107_1.time_ < var_110_23 + var_110_24 then
				local var_110_25 = (arg_107_1.time_ - var_110_23) / var_110_24

				if arg_107_1.var_.actorSpriteComps10092_1 then
					for iter_110_6, iter_110_7 in pairs(arg_107_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_110_7 then
							if arg_107_1.isInRecall_ then
								local var_110_26 = Mathf.Lerp(iter_110_7.color.r, 0.82, var_110_25)
								local var_110_27 = Mathf.Lerp(iter_110_7.color.g, 0.77, var_110_25)
								local var_110_28 = Mathf.Lerp(iter_110_7.color.b, 0.62, var_110_25)

								iter_110_7.color = Color.New(var_110_26, var_110_27, var_110_28)
							else
								local var_110_29 = Mathf.Lerp(iter_110_7.color.r, 1, var_110_25)

								iter_110_7.color = Color.New(var_110_29, var_110_29, var_110_29)
							end
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_23 + var_110_24 and arg_107_1.time_ < var_110_23 + var_110_24 + arg_110_0 and arg_107_1.var_.actorSpriteComps10092_1 then
				for iter_110_8, iter_110_9 in pairs(arg_107_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_110_9 then
						if arg_107_1.isInRecall_ then
							iter_110_9.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_110_9.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_107_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_110_30 = 0
			local var_110_31 = 0.7

			if var_110_30 < arg_107_1.time_ and arg_107_1.time_ <= var_110_30 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_32 = arg_107_1:FormatText(StoryNameCfg[996].name)

				arg_107_1.leftNameTxt_.text = var_110_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_33 = arg_107_1:GetWordFromCfg(413122026)
				local var_110_34 = arg_107_1:FormatText(var_110_33.content)

				arg_107_1.text_.text = var_110_34

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_35 = 28
				local var_110_36 = utf8.len(var_110_34)
				local var_110_37 = var_110_35 <= 0 and var_110_31 or var_110_31 * (var_110_36 / var_110_35)

				if var_110_37 > 0 and var_110_31 < var_110_37 then
					arg_107_1.talkMaxDuration = var_110_37

					if var_110_37 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_37 + var_110_30
					end
				end

				arg_107_1.text_.text = var_110_34
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122026", "story_v_out_413122.awb") ~= 0 then
					local var_110_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122026", "story_v_out_413122.awb") / 1000

					if var_110_38 + var_110_30 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_38 + var_110_30
					end

					if var_110_33.prefab_name ~= "" and arg_107_1.actors_[var_110_33.prefab_name] ~= nil then
						local var_110_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_33.prefab_name].transform, "story_v_out_413122", "413122026", "story_v_out_413122.awb")

						arg_107_1:RecordAudio("413122026", var_110_39)
						arg_107_1:RecordAudio("413122026", var_110_39)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_413122", "413122026", "story_v_out_413122.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_413122", "413122026", "story_v_out_413122.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_40 = math.max(var_110_31, arg_107_1.talkMaxDuration)

			if var_110_30 <= arg_107_1.time_ and arg_107_1.time_ < var_110_30 + var_110_40 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_30) / var_110_40

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_30 + var_110_40 and arg_107_1.time_ < var_110_30 + var_110_40 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play413122027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 413122027
		arg_111_1.duration_ = 5.47

		local var_111_0 = {
			zh = 3.933,
			ja = 5.466
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
				arg_111_0:Play413122028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10022"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos10022 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("10022", 4)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "split_6" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(390, -315, -320)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos10022, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(390, -315, -320)
			end

			local var_114_7 = arg_111_1.actors_["10022"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps10022 == nil then
				arg_111_1.var_.actorSpriteComps10022 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 2

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps10022 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_114_2 then
							if arg_111_1.isInRecall_ then
								local var_114_11 = Mathf.Lerp(iter_114_2.color.r, 0.82, var_114_10)
								local var_114_12 = Mathf.Lerp(iter_114_2.color.g, 0.77, var_114_10)
								local var_114_13 = Mathf.Lerp(iter_114_2.color.b, 0.62, var_114_10)

								iter_114_2.color = Color.New(var_114_11, var_114_12, var_114_13)
							else
								local var_114_14 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

								iter_114_2.color = Color.New(var_114_14, var_114_14, var_114_14)
							end
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and arg_111_1.var_.actorSpriteComps10022 then
				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_114_4 then
						if arg_111_1.isInRecall_ then
							iter_114_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_114_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_111_1.var_.actorSpriteComps10022 = nil
			end

			local var_114_15 = arg_111_1.actors_["10092_1"]
			local var_114_16 = 0

			if var_114_16 < arg_111_1.time_ and arg_111_1.time_ <= var_114_16 + arg_114_0 and arg_111_1.var_.actorSpriteComps10092_1 == nil then
				arg_111_1.var_.actorSpriteComps10092_1 = var_114_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_17 = 2

			if var_114_16 <= arg_111_1.time_ and arg_111_1.time_ < var_114_16 + var_114_17 then
				local var_114_18 = (arg_111_1.time_ - var_114_16) / var_114_17

				if arg_111_1.var_.actorSpriteComps10092_1 then
					for iter_114_5, iter_114_6 in pairs(arg_111_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_114_6 then
							if arg_111_1.isInRecall_ then
								local var_114_19 = Mathf.Lerp(iter_114_6.color.r, 0.46, var_114_18)
								local var_114_20 = Mathf.Lerp(iter_114_6.color.g, 0.43, var_114_18)
								local var_114_21 = Mathf.Lerp(iter_114_6.color.b, 0.35, var_114_18)

								iter_114_6.color = Color.New(var_114_19, var_114_20, var_114_21)
							else
								local var_114_22 = Mathf.Lerp(iter_114_6.color.r, 0.5, var_114_18)

								iter_114_6.color = Color.New(var_114_22, var_114_22, var_114_22)
							end
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_16 + var_114_17 and arg_111_1.time_ < var_114_16 + var_114_17 + arg_114_0 and arg_111_1.var_.actorSpriteComps10092_1 then
				for iter_114_7, iter_114_8 in pairs(arg_111_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_114_8 then
						if arg_111_1.isInRecall_ then
							iter_114_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_114_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_111_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_114_23 = 0
			local var_114_24 = 0.5

			if var_114_23 < arg_111_1.time_ and arg_111_1.time_ <= var_114_23 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_25 = arg_111_1:FormatText(StoryNameCfg[614].name)

				arg_111_1.leftNameTxt_.text = var_114_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_26 = arg_111_1:GetWordFromCfg(413122027)
				local var_114_27 = arg_111_1:FormatText(var_114_26.content)

				arg_111_1.text_.text = var_114_27

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_28 = 20
				local var_114_29 = utf8.len(var_114_27)
				local var_114_30 = var_114_28 <= 0 and var_114_24 or var_114_24 * (var_114_29 / var_114_28)

				if var_114_30 > 0 and var_114_24 < var_114_30 then
					arg_111_1.talkMaxDuration = var_114_30

					if var_114_30 + var_114_23 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_30 + var_114_23
					end
				end

				arg_111_1.text_.text = var_114_27
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122027", "story_v_out_413122.awb") ~= 0 then
					local var_114_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122027", "story_v_out_413122.awb") / 1000

					if var_114_31 + var_114_23 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_31 + var_114_23
					end

					if var_114_26.prefab_name ~= "" and arg_111_1.actors_[var_114_26.prefab_name] ~= nil then
						local var_114_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_26.prefab_name].transform, "story_v_out_413122", "413122027", "story_v_out_413122.awb")

						arg_111_1:RecordAudio("413122027", var_114_32)
						arg_111_1:RecordAudio("413122027", var_114_32)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_413122", "413122027", "story_v_out_413122.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_413122", "413122027", "story_v_out_413122.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_33 = math.max(var_114_24, arg_111_1.talkMaxDuration)

			if var_114_23 <= arg_111_1.time_ and arg_111_1.time_ < var_114_23 + var_114_33 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_23) / var_114_33

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_23 + var_114_33 and arg_111_1.time_ < var_114_23 + var_114_33 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play413122028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 413122028
		arg_115_1.duration_ = 12.1

		local var_115_0 = {
			zh = 10.7,
			ja = 12.1
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
				arg_115_0:Play413122029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10092_1"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos10092_1 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("10092_1", 2)

				local var_118_2 = var_118_0.childCount

				for iter_118_0 = 0, var_118_2 - 1 do
					local var_118_3 = var_118_0:GetChild(iter_118_0)

					if var_118_3.name == "split_1_1" or not string.find(var_118_3.name, "split") then
						var_118_3.gameObject:SetActive(true)
					else
						var_118_3.gameObject:SetActive(false)
					end
				end
			end

			local var_118_4 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_4 then
				local var_118_5 = (arg_115_1.time_ - var_118_1) / var_118_4
				local var_118_6 = Vector3.New(-389.49, -300, -295)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos10092_1, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_118_7 = arg_115_1.actors_["10092_1"]
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 and arg_115_1.var_.actorSpriteComps10092_1 == nil then
				arg_115_1.var_.actorSpriteComps10092_1 = var_118_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_9 = 2

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_8) / var_118_9

				if arg_115_1.var_.actorSpriteComps10092_1 then
					for iter_118_1, iter_118_2 in pairs(arg_115_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_118_2 then
							if arg_115_1.isInRecall_ then
								local var_118_11 = Mathf.Lerp(iter_118_2.color.r, 0.82, var_118_10)
								local var_118_12 = Mathf.Lerp(iter_118_2.color.g, 0.77, var_118_10)
								local var_118_13 = Mathf.Lerp(iter_118_2.color.b, 0.62, var_118_10)

								iter_118_2.color = Color.New(var_118_11, var_118_12, var_118_13)
							else
								local var_118_14 = Mathf.Lerp(iter_118_2.color.r, 1, var_118_10)

								iter_118_2.color = Color.New(var_118_14, var_118_14, var_118_14)
							end
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_8 + var_118_9 and arg_115_1.time_ < var_118_8 + var_118_9 + arg_118_0 and arg_115_1.var_.actorSpriteComps10092_1 then
				for iter_118_3, iter_118_4 in pairs(arg_115_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_118_4 then
						if arg_115_1.isInRecall_ then
							iter_118_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_118_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_115_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_118_15 = arg_115_1.actors_["10022"]
			local var_118_16 = 0

			if var_118_16 < arg_115_1.time_ and arg_115_1.time_ <= var_118_16 + arg_118_0 and arg_115_1.var_.actorSpriteComps10022 == nil then
				arg_115_1.var_.actorSpriteComps10022 = var_118_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_17 = 2

			if var_118_16 <= arg_115_1.time_ and arg_115_1.time_ < var_118_16 + var_118_17 then
				local var_118_18 = (arg_115_1.time_ - var_118_16) / var_118_17

				if arg_115_1.var_.actorSpriteComps10022 then
					for iter_118_5, iter_118_6 in pairs(arg_115_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_118_6 then
							if arg_115_1.isInRecall_ then
								local var_118_19 = Mathf.Lerp(iter_118_6.color.r, 0.46, var_118_18)
								local var_118_20 = Mathf.Lerp(iter_118_6.color.g, 0.43, var_118_18)
								local var_118_21 = Mathf.Lerp(iter_118_6.color.b, 0.35, var_118_18)

								iter_118_6.color = Color.New(var_118_19, var_118_20, var_118_21)
							else
								local var_118_22 = Mathf.Lerp(iter_118_6.color.r, 0.5, var_118_18)

								iter_118_6.color = Color.New(var_118_22, var_118_22, var_118_22)
							end
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_16 + var_118_17 and arg_115_1.time_ < var_118_16 + var_118_17 + arg_118_0 and arg_115_1.var_.actorSpriteComps10022 then
				for iter_118_7, iter_118_8 in pairs(arg_115_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_118_8 then
						if arg_115_1.isInRecall_ then
							iter_118_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_118_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_115_1.var_.actorSpriteComps10022 = nil
			end

			local var_118_23 = 0
			local var_118_24 = 1.3

			if var_118_23 < arg_115_1.time_ and arg_115_1.time_ <= var_118_23 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_25 = arg_115_1:FormatText(StoryNameCfg[996].name)

				arg_115_1.leftNameTxt_.text = var_118_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_26 = arg_115_1:GetWordFromCfg(413122028)
				local var_118_27 = arg_115_1:FormatText(var_118_26.content)

				arg_115_1.text_.text = var_118_27

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_28 = 52
				local var_118_29 = utf8.len(var_118_27)
				local var_118_30 = var_118_28 <= 0 and var_118_24 or var_118_24 * (var_118_29 / var_118_28)

				if var_118_30 > 0 and var_118_24 < var_118_30 then
					arg_115_1.talkMaxDuration = var_118_30

					if var_118_30 + var_118_23 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_30 + var_118_23
					end
				end

				arg_115_1.text_.text = var_118_27
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122028", "story_v_out_413122.awb") ~= 0 then
					local var_118_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122028", "story_v_out_413122.awb") / 1000

					if var_118_31 + var_118_23 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_31 + var_118_23
					end

					if var_118_26.prefab_name ~= "" and arg_115_1.actors_[var_118_26.prefab_name] ~= nil then
						local var_118_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_26.prefab_name].transform, "story_v_out_413122", "413122028", "story_v_out_413122.awb")

						arg_115_1:RecordAudio("413122028", var_118_32)
						arg_115_1:RecordAudio("413122028", var_118_32)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_413122", "413122028", "story_v_out_413122.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_413122", "413122028", "story_v_out_413122.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_33 = math.max(var_118_24, arg_115_1.talkMaxDuration)

			if var_118_23 <= arg_115_1.time_ and arg_115_1.time_ < var_118_23 + var_118_33 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_23) / var_118_33

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_23 + var_118_33 and arg_115_1.time_ < var_118_23 + var_118_33 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play413122029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 413122029
		arg_119_1.duration_ = 5.53

		local var_119_0 = {
			zh = 3.866,
			ja = 5.533
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
				arg_119_0:Play413122030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10022"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.actorSpriteComps10022 == nil then
				arg_119_1.var_.actorSpriteComps10022 = var_122_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_2 = 2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.actorSpriteComps10022 then
					for iter_122_0, iter_122_1 in pairs(arg_119_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_122_1 then
							if arg_119_1.isInRecall_ then
								local var_122_4 = Mathf.Lerp(iter_122_1.color.r, 0.82, var_122_3)
								local var_122_5 = Mathf.Lerp(iter_122_1.color.g, 0.77, var_122_3)
								local var_122_6 = Mathf.Lerp(iter_122_1.color.b, 0.62, var_122_3)

								iter_122_1.color = Color.New(var_122_4, var_122_5, var_122_6)
							else
								local var_122_7 = Mathf.Lerp(iter_122_1.color.r, 1, var_122_3)

								iter_122_1.color = Color.New(var_122_7, var_122_7, var_122_7)
							end
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.actorSpriteComps10022 then
				for iter_122_2, iter_122_3 in pairs(arg_119_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_122_3 then
						if arg_119_1.isInRecall_ then
							iter_122_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_122_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_119_1.var_.actorSpriteComps10022 = nil
			end

			local var_122_8 = arg_119_1.actors_["10092_1"]
			local var_122_9 = 0

			if var_122_9 < arg_119_1.time_ and arg_119_1.time_ <= var_122_9 + arg_122_0 and arg_119_1.var_.actorSpriteComps10092_1 == nil then
				arg_119_1.var_.actorSpriteComps10092_1 = var_122_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_10 = 2

			if var_122_9 <= arg_119_1.time_ and arg_119_1.time_ < var_122_9 + var_122_10 then
				local var_122_11 = (arg_119_1.time_ - var_122_9) / var_122_10

				if arg_119_1.var_.actorSpriteComps10092_1 then
					for iter_122_4, iter_122_5 in pairs(arg_119_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_122_5 then
							if arg_119_1.isInRecall_ then
								local var_122_12 = Mathf.Lerp(iter_122_5.color.r, 0.46, var_122_11)
								local var_122_13 = Mathf.Lerp(iter_122_5.color.g, 0.43, var_122_11)
								local var_122_14 = Mathf.Lerp(iter_122_5.color.b, 0.35, var_122_11)

								iter_122_5.color = Color.New(var_122_12, var_122_13, var_122_14)
							else
								local var_122_15 = Mathf.Lerp(iter_122_5.color.r, 0.5, var_122_11)

								iter_122_5.color = Color.New(var_122_15, var_122_15, var_122_15)
							end
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_9 + var_122_10 and arg_119_1.time_ < var_122_9 + var_122_10 + arg_122_0 and arg_119_1.var_.actorSpriteComps10092_1 then
				for iter_122_6, iter_122_7 in pairs(arg_119_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_122_7 then
						if arg_119_1.isInRecall_ then
							iter_122_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_122_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_119_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_122_16 = 0
			local var_122_17 = 0.475

			if var_122_16 < arg_119_1.time_ and arg_119_1.time_ <= var_122_16 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_18 = arg_119_1:FormatText(StoryNameCfg[614].name)

				arg_119_1.leftNameTxt_.text = var_122_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_19 = arg_119_1:GetWordFromCfg(413122029)
				local var_122_20 = arg_119_1:FormatText(var_122_19.content)

				arg_119_1.text_.text = var_122_20

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_21 = 19
				local var_122_22 = utf8.len(var_122_20)
				local var_122_23 = var_122_21 <= 0 and var_122_17 or var_122_17 * (var_122_22 / var_122_21)

				if var_122_23 > 0 and var_122_17 < var_122_23 then
					arg_119_1.talkMaxDuration = var_122_23

					if var_122_23 + var_122_16 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_23 + var_122_16
					end
				end

				arg_119_1.text_.text = var_122_20
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122029", "story_v_out_413122.awb") ~= 0 then
					local var_122_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122029", "story_v_out_413122.awb") / 1000

					if var_122_24 + var_122_16 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_24 + var_122_16
					end

					if var_122_19.prefab_name ~= "" and arg_119_1.actors_[var_122_19.prefab_name] ~= nil then
						local var_122_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_19.prefab_name].transform, "story_v_out_413122", "413122029", "story_v_out_413122.awb")

						arg_119_1:RecordAudio("413122029", var_122_25)
						arg_119_1:RecordAudio("413122029", var_122_25)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_413122", "413122029", "story_v_out_413122.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_413122", "413122029", "story_v_out_413122.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_26 = math.max(var_122_17, arg_119_1.talkMaxDuration)

			if var_122_16 <= arg_119_1.time_ and arg_119_1.time_ < var_122_16 + var_122_26 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_16) / var_122_26

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_16 + var_122_26 and arg_119_1.time_ < var_122_16 + var_122_26 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play413122030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 413122030
		arg_123_1.duration_ = 9.27

		local var_123_0 = {
			zh = 7.466,
			ja = 9.266
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
				arg_123_0:Play413122031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["10092_1"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos10092_1 = var_126_0.localPosition
				var_126_0.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("10092_1", 2)

				local var_126_2 = var_126_0.childCount

				for iter_126_0 = 0, var_126_2 - 1 do
					local var_126_3 = var_126_0:GetChild(iter_126_0)

					if var_126_3.name == "split_1_1" or not string.find(var_126_3.name, "split") then
						var_126_3.gameObject:SetActive(true)
					else
						var_126_3.gameObject:SetActive(false)
					end
				end
			end

			local var_126_4 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_4 then
				local var_126_5 = (arg_123_1.time_ - var_126_1) / var_126_4
				local var_126_6 = Vector3.New(-389.49, -300, -295)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos10092_1, var_126_6, var_126_5)
			end

			if arg_123_1.time_ >= var_126_1 + var_126_4 and arg_123_1.time_ < var_126_1 + var_126_4 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_126_7 = arg_123_1.actors_["10092_1"]
			local var_126_8 = 0

			if var_126_8 < arg_123_1.time_ and arg_123_1.time_ <= var_126_8 + arg_126_0 and arg_123_1.var_.actorSpriteComps10092_1 == nil then
				arg_123_1.var_.actorSpriteComps10092_1 = var_126_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_9 = 2

			if var_126_8 <= arg_123_1.time_ and arg_123_1.time_ < var_126_8 + var_126_9 then
				local var_126_10 = (arg_123_1.time_ - var_126_8) / var_126_9

				if arg_123_1.var_.actorSpriteComps10092_1 then
					for iter_126_1, iter_126_2 in pairs(arg_123_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_126_2 then
							if arg_123_1.isInRecall_ then
								local var_126_11 = Mathf.Lerp(iter_126_2.color.r, 0.82, var_126_10)
								local var_126_12 = Mathf.Lerp(iter_126_2.color.g, 0.77, var_126_10)
								local var_126_13 = Mathf.Lerp(iter_126_2.color.b, 0.62, var_126_10)

								iter_126_2.color = Color.New(var_126_11, var_126_12, var_126_13)
							else
								local var_126_14 = Mathf.Lerp(iter_126_2.color.r, 1, var_126_10)

								iter_126_2.color = Color.New(var_126_14, var_126_14, var_126_14)
							end
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_8 + var_126_9 and arg_123_1.time_ < var_126_8 + var_126_9 + arg_126_0 and arg_123_1.var_.actorSpriteComps10092_1 then
				for iter_126_3, iter_126_4 in pairs(arg_123_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_126_4 then
						if arg_123_1.isInRecall_ then
							iter_126_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_126_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_123_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_126_15 = arg_123_1.actors_["10022"]
			local var_126_16 = 0

			if var_126_16 < arg_123_1.time_ and arg_123_1.time_ <= var_126_16 + arg_126_0 and arg_123_1.var_.actorSpriteComps10022 == nil then
				arg_123_1.var_.actorSpriteComps10022 = var_126_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_17 = 2

			if var_126_16 <= arg_123_1.time_ and arg_123_1.time_ < var_126_16 + var_126_17 then
				local var_126_18 = (arg_123_1.time_ - var_126_16) / var_126_17

				if arg_123_1.var_.actorSpriteComps10022 then
					for iter_126_5, iter_126_6 in pairs(arg_123_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_126_6 then
							if arg_123_1.isInRecall_ then
								local var_126_19 = Mathf.Lerp(iter_126_6.color.r, 0.46, var_126_18)
								local var_126_20 = Mathf.Lerp(iter_126_6.color.g, 0.43, var_126_18)
								local var_126_21 = Mathf.Lerp(iter_126_6.color.b, 0.35, var_126_18)

								iter_126_6.color = Color.New(var_126_19, var_126_20, var_126_21)
							else
								local var_126_22 = Mathf.Lerp(iter_126_6.color.r, 0.5, var_126_18)

								iter_126_6.color = Color.New(var_126_22, var_126_22, var_126_22)
							end
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_16 + var_126_17 and arg_123_1.time_ < var_126_16 + var_126_17 + arg_126_0 and arg_123_1.var_.actorSpriteComps10022 then
				for iter_126_7, iter_126_8 in pairs(arg_123_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_126_8 then
						if arg_123_1.isInRecall_ then
							iter_126_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_126_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_123_1.var_.actorSpriteComps10022 = nil
			end

			local var_126_23 = 0
			local var_126_24 = 0.95

			if var_126_23 < arg_123_1.time_ and arg_123_1.time_ <= var_126_23 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_25 = arg_123_1:FormatText(StoryNameCfg[996].name)

				arg_123_1.leftNameTxt_.text = var_126_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_26 = arg_123_1:GetWordFromCfg(413122030)
				local var_126_27 = arg_123_1:FormatText(var_126_26.content)

				arg_123_1.text_.text = var_126_27

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_28 = 38
				local var_126_29 = utf8.len(var_126_27)
				local var_126_30 = var_126_28 <= 0 and var_126_24 or var_126_24 * (var_126_29 / var_126_28)

				if var_126_30 > 0 and var_126_24 < var_126_30 then
					arg_123_1.talkMaxDuration = var_126_30

					if var_126_30 + var_126_23 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_30 + var_126_23
					end
				end

				arg_123_1.text_.text = var_126_27
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122030", "story_v_out_413122.awb") ~= 0 then
					local var_126_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122030", "story_v_out_413122.awb") / 1000

					if var_126_31 + var_126_23 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_31 + var_126_23
					end

					if var_126_26.prefab_name ~= "" and arg_123_1.actors_[var_126_26.prefab_name] ~= nil then
						local var_126_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_26.prefab_name].transform, "story_v_out_413122", "413122030", "story_v_out_413122.awb")

						arg_123_1:RecordAudio("413122030", var_126_32)
						arg_123_1:RecordAudio("413122030", var_126_32)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_413122", "413122030", "story_v_out_413122.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_413122", "413122030", "story_v_out_413122.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_33 = math.max(var_126_24, arg_123_1.talkMaxDuration)

			if var_126_23 <= arg_123_1.time_ and arg_123_1.time_ < var_126_23 + var_126_33 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_23) / var_126_33

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_23 + var_126_33 and arg_123_1.time_ < var_126_23 + var_126_33 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play413122031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 413122031
		arg_127_1.duration_ = 5.4

		local var_127_0 = {
			zh = 3.366,
			ja = 5.4
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
				arg_127_0:Play413122032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10092_1"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos10092_1 = var_130_0.localPosition
				var_130_0.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("10092_1", 2)

				local var_130_2 = var_130_0.childCount

				for iter_130_0 = 0, var_130_2 - 1 do
					local var_130_3 = var_130_0:GetChild(iter_130_0)

					if var_130_3.name == "" or not string.find(var_130_3.name, "split") then
						var_130_3.gameObject:SetActive(true)
					else
						var_130_3.gameObject:SetActive(false)
					end
				end
			end

			local var_130_4 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_4 then
				local var_130_5 = (arg_127_1.time_ - var_130_1) / var_130_4
				local var_130_6 = Vector3.New(-389.49, -300, -295)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10092_1, var_130_6, var_130_5)
			end

			if arg_127_1.time_ >= var_130_1 + var_130_4 and arg_127_1.time_ < var_130_1 + var_130_4 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_130_7 = arg_127_1.actors_["10092_1"]
			local var_130_8 = 0

			if var_130_8 < arg_127_1.time_ and arg_127_1.time_ <= var_130_8 + arg_130_0 and arg_127_1.var_.actorSpriteComps10092_1 == nil then
				arg_127_1.var_.actorSpriteComps10092_1 = var_130_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_9 = 2

			if var_130_8 <= arg_127_1.time_ and arg_127_1.time_ < var_130_8 + var_130_9 then
				local var_130_10 = (arg_127_1.time_ - var_130_8) / var_130_9

				if arg_127_1.var_.actorSpriteComps10092_1 then
					for iter_130_1, iter_130_2 in pairs(arg_127_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_130_2 then
							if arg_127_1.isInRecall_ then
								local var_130_11 = Mathf.Lerp(iter_130_2.color.r, 0.46, var_130_10)
								local var_130_12 = Mathf.Lerp(iter_130_2.color.g, 0.43, var_130_10)
								local var_130_13 = Mathf.Lerp(iter_130_2.color.b, 0.35, var_130_10)

								iter_130_2.color = Color.New(var_130_11, var_130_12, var_130_13)
							else
								local var_130_14 = Mathf.Lerp(iter_130_2.color.r, 0.5, var_130_10)

								iter_130_2.color = Color.New(var_130_14, var_130_14, var_130_14)
							end
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_8 + var_130_9 and arg_127_1.time_ < var_130_8 + var_130_9 + arg_130_0 and arg_127_1.var_.actorSpriteComps10092_1 then
				for iter_130_3, iter_130_4 in pairs(arg_127_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_130_4 then
						if arg_127_1.isInRecall_ then
							iter_130_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_130_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_127_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_130_15 = 0
			local var_130_16 = 0.35

			if var_130_15 < arg_127_1.time_ and arg_127_1.time_ <= var_130_15 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_17 = arg_127_1:FormatText(StoryNameCfg[28].name)

				arg_127_1.leftNameTxt_.text = var_130_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10093_split_5")

				arg_127_1.callingController_:SetSelectedState("normal")

				arg_127_1.keyicon_.color = Color.New(1, 1, 1)
				arg_127_1.icon_.color = Color.New(1, 1, 1)

				local var_130_18 = arg_127_1:GetWordFromCfg(413122031)
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122031", "story_v_out_413122.awb") ~= 0 then
					local var_130_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122031", "story_v_out_413122.awb") / 1000

					if var_130_23 + var_130_15 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_23 + var_130_15
					end

					if var_130_18.prefab_name ~= "" and arg_127_1.actors_[var_130_18.prefab_name] ~= nil then
						local var_130_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_18.prefab_name].transform, "story_v_out_413122", "413122031", "story_v_out_413122.awb")

						arg_127_1:RecordAudio("413122031", var_130_24)
						arg_127_1:RecordAudio("413122031", var_130_24)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_413122", "413122031", "story_v_out_413122.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_413122", "413122031", "story_v_out_413122.awb")
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
	Play413122032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 413122032
		arg_131_1.duration_ = 5.8

		local var_131_0 = {
			zh = 3.033,
			ja = 5.8
		}
		local var_131_1 = manager.audio:GetLocalizationFlag()

		if var_131_0[var_131_1] ~= nil then
			arg_131_1.duration_ = var_131_0[var_131_1]
		end

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play413122033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10022"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10022 = var_134_0.localPosition
				var_134_0.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("10022", 4)

				local var_134_2 = var_134_0.childCount

				for iter_134_0 = 0, var_134_2 - 1 do
					local var_134_3 = var_134_0:GetChild(iter_134_0)

					if var_134_3.name == "split_8" or not string.find(var_134_3.name, "split") then
						var_134_3.gameObject:SetActive(true)
					else
						var_134_3.gameObject:SetActive(false)
					end
				end
			end

			local var_134_4 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_4 then
				local var_134_5 = (arg_131_1.time_ - var_134_1) / var_134_4
				local var_134_6 = Vector3.New(390, -315, -320)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10022, var_134_6, var_134_5)
			end

			if arg_131_1.time_ >= var_134_1 + var_134_4 and arg_131_1.time_ < var_134_1 + var_134_4 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(390, -315, -320)
			end

			local var_134_7 = arg_131_1.actors_["10022"]
			local var_134_8 = 0

			if var_134_8 < arg_131_1.time_ and arg_131_1.time_ <= var_134_8 + arg_134_0 and arg_131_1.var_.actorSpriteComps10022 == nil then
				arg_131_1.var_.actorSpriteComps10022 = var_134_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_9 = 2

			if var_134_8 <= arg_131_1.time_ and arg_131_1.time_ < var_134_8 + var_134_9 then
				local var_134_10 = (arg_131_1.time_ - var_134_8) / var_134_9

				if arg_131_1.var_.actorSpriteComps10022 then
					for iter_134_1, iter_134_2 in pairs(arg_131_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_134_2 then
							if arg_131_1.isInRecall_ then
								local var_134_11 = Mathf.Lerp(iter_134_2.color.r, 0.82, var_134_10)
								local var_134_12 = Mathf.Lerp(iter_134_2.color.g, 0.77, var_134_10)
								local var_134_13 = Mathf.Lerp(iter_134_2.color.b, 0.62, var_134_10)

								iter_134_2.color = Color.New(var_134_11, var_134_12, var_134_13)
							else
								local var_134_14 = Mathf.Lerp(iter_134_2.color.r, 1, var_134_10)

								iter_134_2.color = Color.New(var_134_14, var_134_14, var_134_14)
							end
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_8 + var_134_9 and arg_131_1.time_ < var_134_8 + var_134_9 + arg_134_0 and arg_131_1.var_.actorSpriteComps10022 then
				for iter_134_3, iter_134_4 in pairs(arg_131_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_134_4 then
						if arg_131_1.isInRecall_ then
							iter_134_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_134_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_131_1.var_.actorSpriteComps10022 = nil
			end

			local var_134_15 = 0
			local var_134_16 = 0.325

			if var_134_15 < arg_131_1.time_ and arg_131_1.time_ <= var_134_15 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_17 = arg_131_1:FormatText(StoryNameCfg[614].name)

				arg_131_1.leftNameTxt_.text = var_134_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_18 = arg_131_1:GetWordFromCfg(413122032)
				local var_134_19 = arg_131_1:FormatText(var_134_18.content)

				arg_131_1.text_.text = var_134_19

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_20 = 13
				local var_134_21 = utf8.len(var_134_19)
				local var_134_22 = var_134_20 <= 0 and var_134_16 or var_134_16 * (var_134_21 / var_134_20)

				if var_134_22 > 0 and var_134_16 < var_134_22 then
					arg_131_1.talkMaxDuration = var_134_22

					if var_134_22 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_22 + var_134_15
					end
				end

				arg_131_1.text_.text = var_134_19
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122032", "story_v_out_413122.awb") ~= 0 then
					local var_134_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122032", "story_v_out_413122.awb") / 1000

					if var_134_23 + var_134_15 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_23 + var_134_15
					end

					if var_134_18.prefab_name ~= "" and arg_131_1.actors_[var_134_18.prefab_name] ~= nil then
						local var_134_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_18.prefab_name].transform, "story_v_out_413122", "413122032", "story_v_out_413122.awb")

						arg_131_1:RecordAudio("413122032", var_134_24)
						arg_131_1:RecordAudio("413122032", var_134_24)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_413122", "413122032", "story_v_out_413122.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_413122", "413122032", "story_v_out_413122.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_25 = math.max(var_134_16, arg_131_1.talkMaxDuration)

			if var_134_15 <= arg_131_1.time_ and arg_131_1.time_ < var_134_15 + var_134_25 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_15) / var_134_25

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_15 + var_134_25 and arg_131_1.time_ < var_134_15 + var_134_25 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play413122033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 413122033
		arg_135_1.duration_ = 11.23

		local var_135_0 = {
			zh = 7.2,
			ja = 11.233
		}
		local var_135_1 = manager.audio:GetLocalizationFlag()

		if var_135_0[var_135_1] ~= nil then
			arg_135_1.duration_ = var_135_0[var_135_1]
		end

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play413122034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10092_1"].transform
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 then
				arg_135_1.var_.moveOldPos10092_1 = var_138_0.localPosition
				var_138_0.localScale = Vector3.New(1, 1, 1)

				arg_135_1:CheckSpriteTmpPos("10092_1", 2)

				local var_138_2 = var_138_0.childCount

				for iter_138_0 = 0, var_138_2 - 1 do
					local var_138_3 = var_138_0:GetChild(iter_138_0)

					if var_138_3.name == "split_1_1" or not string.find(var_138_3.name, "split") then
						var_138_3.gameObject:SetActive(true)
					else
						var_138_3.gameObject:SetActive(false)
					end
				end
			end

			local var_138_4 = 0.001

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_4 then
				local var_138_5 = (arg_135_1.time_ - var_138_1) / var_138_4
				local var_138_6 = Vector3.New(-389.49, -300, -295)

				var_138_0.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos10092_1, var_138_6, var_138_5)
			end

			if arg_135_1.time_ >= var_138_1 + var_138_4 and arg_135_1.time_ < var_138_1 + var_138_4 + arg_138_0 then
				var_138_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_138_7 = arg_135_1.actors_["10092_1"]
			local var_138_8 = 0

			if var_138_8 < arg_135_1.time_ and arg_135_1.time_ <= var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps10092_1 == nil then
				arg_135_1.var_.actorSpriteComps10092_1 = var_138_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_9 = 2

			if var_138_8 <= arg_135_1.time_ and arg_135_1.time_ < var_138_8 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_8) / var_138_9

				if arg_135_1.var_.actorSpriteComps10092_1 then
					for iter_138_1, iter_138_2 in pairs(arg_135_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_138_2 then
							if arg_135_1.isInRecall_ then
								local var_138_11 = Mathf.Lerp(iter_138_2.color.r, 0.82, var_138_10)
								local var_138_12 = Mathf.Lerp(iter_138_2.color.g, 0.77, var_138_10)
								local var_138_13 = Mathf.Lerp(iter_138_2.color.b, 0.62, var_138_10)

								iter_138_2.color = Color.New(var_138_11, var_138_12, var_138_13)
							else
								local var_138_14 = Mathf.Lerp(iter_138_2.color.r, 1, var_138_10)

								iter_138_2.color = Color.New(var_138_14, var_138_14, var_138_14)
							end
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_8 + var_138_9 and arg_135_1.time_ < var_138_8 + var_138_9 + arg_138_0 and arg_135_1.var_.actorSpriteComps10092_1 then
				for iter_138_3, iter_138_4 in pairs(arg_135_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_138_4 then
						if arg_135_1.isInRecall_ then
							iter_138_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_138_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_135_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_138_15 = arg_135_1.actors_["10022"]
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 and arg_135_1.var_.actorSpriteComps10022 == nil then
				arg_135_1.var_.actorSpriteComps10022 = var_138_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_17 = 2

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17

				if arg_135_1.var_.actorSpriteComps10022 then
					for iter_138_5, iter_138_6 in pairs(arg_135_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_138_6 then
							if arg_135_1.isInRecall_ then
								local var_138_19 = Mathf.Lerp(iter_138_6.color.r, 0.46, var_138_18)
								local var_138_20 = Mathf.Lerp(iter_138_6.color.g, 0.43, var_138_18)
								local var_138_21 = Mathf.Lerp(iter_138_6.color.b, 0.35, var_138_18)

								iter_138_6.color = Color.New(var_138_19, var_138_20, var_138_21)
							else
								local var_138_22 = Mathf.Lerp(iter_138_6.color.r, 0.5, var_138_18)

								iter_138_6.color = Color.New(var_138_22, var_138_22, var_138_22)
							end
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 and arg_135_1.var_.actorSpriteComps10022 then
				for iter_138_7, iter_138_8 in pairs(arg_135_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_138_8 then
						if arg_135_1.isInRecall_ then
							iter_138_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_138_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_135_1.var_.actorSpriteComps10022 = nil
			end

			local var_138_23 = 0
			local var_138_24 = 1.05

			if var_138_23 < arg_135_1.time_ and arg_135_1.time_ <= var_138_23 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_25 = arg_135_1:FormatText(StoryNameCfg[996].name)

				arg_135_1.leftNameTxt_.text = var_138_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_26 = arg_135_1:GetWordFromCfg(413122033)
				local var_138_27 = arg_135_1:FormatText(var_138_26.content)

				arg_135_1.text_.text = var_138_27

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_28 = 42
				local var_138_29 = utf8.len(var_138_27)
				local var_138_30 = var_138_28 <= 0 and var_138_24 or var_138_24 * (var_138_29 / var_138_28)

				if var_138_30 > 0 and var_138_24 < var_138_30 then
					arg_135_1.talkMaxDuration = var_138_30

					if var_138_30 + var_138_23 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_30 + var_138_23
					end
				end

				arg_135_1.text_.text = var_138_27
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122033", "story_v_out_413122.awb") ~= 0 then
					local var_138_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122033", "story_v_out_413122.awb") / 1000

					if var_138_31 + var_138_23 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_31 + var_138_23
					end

					if var_138_26.prefab_name ~= "" and arg_135_1.actors_[var_138_26.prefab_name] ~= nil then
						local var_138_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_26.prefab_name].transform, "story_v_out_413122", "413122033", "story_v_out_413122.awb")

						arg_135_1:RecordAudio("413122033", var_138_32)
						arg_135_1:RecordAudio("413122033", var_138_32)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_413122", "413122033", "story_v_out_413122.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_413122", "413122033", "story_v_out_413122.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_33 = math.max(var_138_24, arg_135_1.talkMaxDuration)

			if var_138_23 <= arg_135_1.time_ and arg_135_1.time_ < var_138_23 + var_138_33 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_23) / var_138_33

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_23 + var_138_33 and arg_135_1.time_ < var_138_23 + var_138_33 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play413122034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 413122034
		arg_139_1.duration_ = 3.83

		local var_139_0 = {
			zh = 1.999999999999,
			ja = 3.833
		}
		local var_139_1 = manager.audio:GetLocalizationFlag()

		if var_139_0[var_139_1] ~= nil then
			arg_139_1.duration_ = var_139_0[var_139_1]
		end

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play413122035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["10093"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos10093 = var_142_0.localPosition
				var_142_0.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("10093", 4)

				local var_142_2 = var_142_0.childCount

				for iter_142_0 = 0, var_142_2 - 1 do
					local var_142_3 = var_142_0:GetChild(iter_142_0)

					if var_142_3.name == "split_6" or not string.find(var_142_3.name, "split") then
						var_142_3.gameObject:SetActive(true)
					else
						var_142_3.gameObject:SetActive(false)
					end
				end
			end

			local var_142_4 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_4 then
				local var_142_5 = (arg_139_1.time_ - var_142_1) / var_142_4
				local var_142_6 = Vector3.New(390, -345, -245)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10093, var_142_6, var_142_5)
			end

			if arg_139_1.time_ >= var_142_1 + var_142_4 and arg_139_1.time_ < var_142_1 + var_142_4 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_142_7 = arg_139_1.actors_["10022"].transform
			local var_142_8 = 0

			if var_142_8 < arg_139_1.time_ and arg_139_1.time_ <= var_142_8 + arg_142_0 then
				arg_139_1.var_.moveOldPos10022 = var_142_7.localPosition
				var_142_7.localScale = Vector3.New(1, 1, 1)

				arg_139_1:CheckSpriteTmpPos("10022", 7)

				local var_142_9 = var_142_7.childCount

				for iter_142_1 = 0, var_142_9 - 1 do
					local var_142_10 = var_142_7:GetChild(iter_142_1)

					if var_142_10.name == "" or not string.find(var_142_10.name, "split") then
						var_142_10.gameObject:SetActive(true)
					else
						var_142_10.gameObject:SetActive(false)
					end
				end
			end

			local var_142_11 = 0.001

			if var_142_8 <= arg_139_1.time_ and arg_139_1.time_ < var_142_8 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_8) / var_142_11
				local var_142_13 = Vector3.New(0, -2000, 0)

				var_142_7.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos10022, var_142_13, var_142_12)
			end

			if arg_139_1.time_ >= var_142_8 + var_142_11 and arg_139_1.time_ < var_142_8 + var_142_11 + arg_142_0 then
				var_142_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_142_14 = arg_139_1.actors_["10093"]
			local var_142_15 = 0

			if var_142_15 < arg_139_1.time_ and arg_139_1.time_ <= var_142_15 + arg_142_0 and arg_139_1.var_.actorSpriteComps10093 == nil then
				arg_139_1.var_.actorSpriteComps10093 = var_142_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_16 = 2

			if var_142_15 <= arg_139_1.time_ and arg_139_1.time_ < var_142_15 + var_142_16 then
				local var_142_17 = (arg_139_1.time_ - var_142_15) / var_142_16

				if arg_139_1.var_.actorSpriteComps10093 then
					for iter_142_2, iter_142_3 in pairs(arg_139_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_142_3 then
							if arg_139_1.isInRecall_ then
								local var_142_18 = Mathf.Lerp(iter_142_3.color.r, 0.82, var_142_17)
								local var_142_19 = Mathf.Lerp(iter_142_3.color.g, 0.77, var_142_17)
								local var_142_20 = Mathf.Lerp(iter_142_3.color.b, 0.62, var_142_17)

								iter_142_3.color = Color.New(var_142_18, var_142_19, var_142_20)
							else
								local var_142_21 = Mathf.Lerp(iter_142_3.color.r, 1, var_142_17)

								iter_142_3.color = Color.New(var_142_21, var_142_21, var_142_21)
							end
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_15 + var_142_16 and arg_139_1.time_ < var_142_15 + var_142_16 + arg_142_0 and arg_139_1.var_.actorSpriteComps10093 then
				for iter_142_4, iter_142_5 in pairs(arg_139_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_142_5 then
						if arg_139_1.isInRecall_ then
							iter_142_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_142_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_139_1.var_.actorSpriteComps10093 = nil
			end

			local var_142_22 = arg_139_1.actors_["10092_1"]
			local var_142_23 = 0

			if var_142_23 < arg_139_1.time_ and arg_139_1.time_ <= var_142_23 + arg_142_0 and arg_139_1.var_.actorSpriteComps10092_1 == nil then
				arg_139_1.var_.actorSpriteComps10092_1 = var_142_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_142_24 = 2

			if var_142_23 <= arg_139_1.time_ and arg_139_1.time_ < var_142_23 + var_142_24 then
				local var_142_25 = (arg_139_1.time_ - var_142_23) / var_142_24

				if arg_139_1.var_.actorSpriteComps10092_1 then
					for iter_142_6, iter_142_7 in pairs(arg_139_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_142_7 then
							if arg_139_1.isInRecall_ then
								local var_142_26 = Mathf.Lerp(iter_142_7.color.r, 0.46, var_142_25)
								local var_142_27 = Mathf.Lerp(iter_142_7.color.g, 0.43, var_142_25)
								local var_142_28 = Mathf.Lerp(iter_142_7.color.b, 0.35, var_142_25)

								iter_142_7.color = Color.New(var_142_26, var_142_27, var_142_28)
							else
								local var_142_29 = Mathf.Lerp(iter_142_7.color.r, 0.5, var_142_25)

								iter_142_7.color = Color.New(var_142_29, var_142_29, var_142_29)
							end
						end
					end
				end
			end

			if arg_139_1.time_ >= var_142_23 + var_142_24 and arg_139_1.time_ < var_142_23 + var_142_24 + arg_142_0 and arg_139_1.var_.actorSpriteComps10092_1 then
				for iter_142_8, iter_142_9 in pairs(arg_139_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_142_9 then
						if arg_139_1.isInRecall_ then
							iter_142_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_142_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_139_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_142_30 = 0
			local var_142_31 = 0.35

			if var_142_30 < arg_139_1.time_ and arg_139_1.time_ <= var_142_30 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_32 = arg_139_1:FormatText(StoryNameCfg[28].name)

				arg_139_1.leftNameTxt_.text = var_142_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_33 = arg_139_1:GetWordFromCfg(413122034)
				local var_142_34 = arg_139_1:FormatText(var_142_33.content)

				arg_139_1.text_.text = var_142_34

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_35 = 14
				local var_142_36 = utf8.len(var_142_34)
				local var_142_37 = var_142_35 <= 0 and var_142_31 or var_142_31 * (var_142_36 / var_142_35)

				if var_142_37 > 0 and var_142_31 < var_142_37 then
					arg_139_1.talkMaxDuration = var_142_37

					if var_142_37 + var_142_30 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_37 + var_142_30
					end
				end

				arg_139_1.text_.text = var_142_34
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122034", "story_v_out_413122.awb") ~= 0 then
					local var_142_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122034", "story_v_out_413122.awb") / 1000

					if var_142_38 + var_142_30 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_38 + var_142_30
					end

					if var_142_33.prefab_name ~= "" and arg_139_1.actors_[var_142_33.prefab_name] ~= nil then
						local var_142_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_33.prefab_name].transform, "story_v_out_413122", "413122034", "story_v_out_413122.awb")

						arg_139_1:RecordAudio("413122034", var_142_39)
						arg_139_1:RecordAudio("413122034", var_142_39)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_413122", "413122034", "story_v_out_413122.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_413122", "413122034", "story_v_out_413122.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_40 = math.max(var_142_31, arg_139_1.talkMaxDuration)

			if var_142_30 <= arg_139_1.time_ and arg_139_1.time_ < var_142_30 + var_142_40 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_30) / var_142_40

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_30 + var_142_40 and arg_139_1.time_ < var_142_30 + var_142_40 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play413122035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 413122035
		arg_143_1.duration_ = 7.53

		local var_143_0 = {
			zh = 6.2,
			ja = 7.533
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
				arg_143_0:Play413122036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["10093"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos10093 = var_146_0.localPosition
				var_146_0.localScale = Vector3.New(1, 1, 1)

				arg_143_1:CheckSpriteTmpPos("10093", 4)

				local var_146_2 = var_146_0.childCount

				for iter_146_0 = 0, var_146_2 - 1 do
					local var_146_3 = var_146_0:GetChild(iter_146_0)

					if var_146_3.name == "split_4" or not string.find(var_146_3.name, "split") then
						var_146_3.gameObject:SetActive(true)
					else
						var_146_3.gameObject:SetActive(false)
					end
				end
			end

			local var_146_4 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_4 then
				local var_146_5 = (arg_143_1.time_ - var_146_1) / var_146_4
				local var_146_6 = Vector3.New(390, -345, -245)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos10093, var_146_6, var_146_5)
			end

			if arg_143_1.time_ >= var_146_1 + var_146_4 and arg_143_1.time_ < var_146_1 + var_146_4 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_146_7 = arg_143_1.actors_["10093"]
			local var_146_8 = 0

			if var_146_8 < arg_143_1.time_ and arg_143_1.time_ <= var_146_8 + arg_146_0 and arg_143_1.var_.actorSpriteComps10093 == nil then
				arg_143_1.var_.actorSpriteComps10093 = var_146_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_146_9 = 2

			if var_146_8 <= arg_143_1.time_ and arg_143_1.time_ < var_146_8 + var_146_9 then
				local var_146_10 = (arg_143_1.time_ - var_146_8) / var_146_9

				if arg_143_1.var_.actorSpriteComps10093 then
					for iter_146_1, iter_146_2 in pairs(arg_143_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_146_2 then
							if arg_143_1.isInRecall_ then
								local var_146_11 = Mathf.Lerp(iter_146_2.color.r, 0.82, var_146_10)
								local var_146_12 = Mathf.Lerp(iter_146_2.color.g, 0.77, var_146_10)
								local var_146_13 = Mathf.Lerp(iter_146_2.color.b, 0.62, var_146_10)

								iter_146_2.color = Color.New(var_146_11, var_146_12, var_146_13)
							else
								local var_146_14 = Mathf.Lerp(iter_146_2.color.r, 1, var_146_10)

								iter_146_2.color = Color.New(var_146_14, var_146_14, var_146_14)
							end
						end
					end
				end
			end

			if arg_143_1.time_ >= var_146_8 + var_146_9 and arg_143_1.time_ < var_146_8 + var_146_9 + arg_146_0 and arg_143_1.var_.actorSpriteComps10093 then
				for iter_146_3, iter_146_4 in pairs(arg_143_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_146_4 then
						if arg_143_1.isInRecall_ then
							iter_146_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_146_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_143_1.var_.actorSpriteComps10093 = nil
			end

			local var_146_15 = 0
			local var_146_16 = 0.725

			if var_146_15 < arg_143_1.time_ and arg_143_1.time_ <= var_146_15 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_17 = arg_143_1:FormatText(StoryNameCfg[28].name)

				arg_143_1.leftNameTxt_.text = var_146_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_18 = arg_143_1:GetWordFromCfg(413122035)
				local var_146_19 = arg_143_1:FormatText(var_146_18.content)

				arg_143_1.text_.text = var_146_19

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_20 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122035", "story_v_out_413122.awb") ~= 0 then
					local var_146_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122035", "story_v_out_413122.awb") / 1000

					if var_146_23 + var_146_15 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_23 + var_146_15
					end

					if var_146_18.prefab_name ~= "" and arg_143_1.actors_[var_146_18.prefab_name] ~= nil then
						local var_146_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_18.prefab_name].transform, "story_v_out_413122", "413122035", "story_v_out_413122.awb")

						arg_143_1:RecordAudio("413122035", var_146_24)
						arg_143_1:RecordAudio("413122035", var_146_24)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_413122", "413122035", "story_v_out_413122.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_413122", "413122035", "story_v_out_413122.awb")
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
	Play413122036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 413122036
		arg_147_1.duration_ = 10.7

		local var_147_0 = {
			zh = 5.866,
			ja = 10.7
		}
		local var_147_1 = manager.audio:GetLocalizationFlag()

		if var_147_0[var_147_1] ~= nil then
			arg_147_1.duration_ = var_147_0[var_147_1]
		end

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play413122037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10092_1"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos10092_1 = var_150_0.localPosition
				var_150_0.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("10092_1", 2)

				local var_150_2 = var_150_0.childCount

				for iter_150_0 = 0, var_150_2 - 1 do
					local var_150_3 = var_150_0:GetChild(iter_150_0)

					if var_150_3.name == "split_1_1" or not string.find(var_150_3.name, "split") then
						var_150_3.gameObject:SetActive(true)
					else
						var_150_3.gameObject:SetActive(false)
					end
				end
			end

			local var_150_4 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_4 then
				local var_150_5 = (arg_147_1.time_ - var_150_1) / var_150_4
				local var_150_6 = Vector3.New(-389.49, -300, -295)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10092_1, var_150_6, var_150_5)
			end

			if arg_147_1.time_ >= var_150_1 + var_150_4 and arg_147_1.time_ < var_150_1 + var_150_4 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_150_7 = arg_147_1.actors_["10092_1"]
			local var_150_8 = 0

			if var_150_8 < arg_147_1.time_ and arg_147_1.time_ <= var_150_8 + arg_150_0 and arg_147_1.var_.actorSpriteComps10092_1 == nil then
				arg_147_1.var_.actorSpriteComps10092_1 = var_150_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_9 = 2

			if var_150_8 <= arg_147_1.time_ and arg_147_1.time_ < var_150_8 + var_150_9 then
				local var_150_10 = (arg_147_1.time_ - var_150_8) / var_150_9

				if arg_147_1.var_.actorSpriteComps10092_1 then
					for iter_150_1, iter_150_2 in pairs(arg_147_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_150_2 then
							if arg_147_1.isInRecall_ then
								local var_150_11 = Mathf.Lerp(iter_150_2.color.r, 0.82, var_150_10)
								local var_150_12 = Mathf.Lerp(iter_150_2.color.g, 0.77, var_150_10)
								local var_150_13 = Mathf.Lerp(iter_150_2.color.b, 0.62, var_150_10)

								iter_150_2.color = Color.New(var_150_11, var_150_12, var_150_13)
							else
								local var_150_14 = Mathf.Lerp(iter_150_2.color.r, 1, var_150_10)

								iter_150_2.color = Color.New(var_150_14, var_150_14, var_150_14)
							end
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_8 + var_150_9 and arg_147_1.time_ < var_150_8 + var_150_9 + arg_150_0 and arg_147_1.var_.actorSpriteComps10092_1 then
				for iter_150_3, iter_150_4 in pairs(arg_147_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_150_4 then
						if arg_147_1.isInRecall_ then
							iter_150_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_150_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_147_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_150_15 = arg_147_1.actors_["10093"]
			local var_150_16 = 0

			if var_150_16 < arg_147_1.time_ and arg_147_1.time_ <= var_150_16 + arg_150_0 and arg_147_1.var_.actorSpriteComps10093 == nil then
				arg_147_1.var_.actorSpriteComps10093 = var_150_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_17 = 2

			if var_150_16 <= arg_147_1.time_ and arg_147_1.time_ < var_150_16 + var_150_17 then
				local var_150_18 = (arg_147_1.time_ - var_150_16) / var_150_17

				if arg_147_1.var_.actorSpriteComps10093 then
					for iter_150_5, iter_150_6 in pairs(arg_147_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_150_6 then
							if arg_147_1.isInRecall_ then
								local var_150_19 = Mathf.Lerp(iter_150_6.color.r, 0.46, var_150_18)
								local var_150_20 = Mathf.Lerp(iter_150_6.color.g, 0.43, var_150_18)
								local var_150_21 = Mathf.Lerp(iter_150_6.color.b, 0.35, var_150_18)

								iter_150_6.color = Color.New(var_150_19, var_150_20, var_150_21)
							else
								local var_150_22 = Mathf.Lerp(iter_150_6.color.r, 0.5, var_150_18)

								iter_150_6.color = Color.New(var_150_22, var_150_22, var_150_22)
							end
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_16 + var_150_17 and arg_147_1.time_ < var_150_16 + var_150_17 + arg_150_0 and arg_147_1.var_.actorSpriteComps10093 then
				for iter_150_7, iter_150_8 in pairs(arg_147_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_150_8 then
						if arg_147_1.isInRecall_ then
							iter_150_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_150_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_147_1.var_.actorSpriteComps10093 = nil
			end

			local var_150_23 = 0
			local var_150_24 = 0.575

			if var_150_23 < arg_147_1.time_ and arg_147_1.time_ <= var_150_23 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_25 = arg_147_1:FormatText(StoryNameCfg[996].name)

				arg_147_1.leftNameTxt_.text = var_150_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_26 = arg_147_1:GetWordFromCfg(413122036)
				local var_150_27 = arg_147_1:FormatText(var_150_26.content)

				arg_147_1.text_.text = var_150_27

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_28 = 23
				local var_150_29 = utf8.len(var_150_27)
				local var_150_30 = var_150_28 <= 0 and var_150_24 or var_150_24 * (var_150_29 / var_150_28)

				if var_150_30 > 0 and var_150_24 < var_150_30 then
					arg_147_1.talkMaxDuration = var_150_30

					if var_150_30 + var_150_23 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_30 + var_150_23
					end
				end

				arg_147_1.text_.text = var_150_27
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122036", "story_v_out_413122.awb") ~= 0 then
					local var_150_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122036", "story_v_out_413122.awb") / 1000

					if var_150_31 + var_150_23 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_31 + var_150_23
					end

					if var_150_26.prefab_name ~= "" and arg_147_1.actors_[var_150_26.prefab_name] ~= nil then
						local var_150_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_26.prefab_name].transform, "story_v_out_413122", "413122036", "story_v_out_413122.awb")

						arg_147_1:RecordAudio("413122036", var_150_32)
						arg_147_1:RecordAudio("413122036", var_150_32)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_413122", "413122036", "story_v_out_413122.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_413122", "413122036", "story_v_out_413122.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_33 = math.max(var_150_24, arg_147_1.talkMaxDuration)

			if var_150_23 <= arg_147_1.time_ and arg_147_1.time_ < var_150_23 + var_150_33 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_23) / var_150_33

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_23 + var_150_33 and arg_147_1.time_ < var_150_23 + var_150_33 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play413122037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 413122037
		arg_151_1.duration_ = 4.27

		local var_151_0 = {
			zh = 2,
			ja = 4.266
		}
		local var_151_1 = manager.audio:GetLocalizationFlag()

		if var_151_0[var_151_1] ~= nil then
			arg_151_1.duration_ = var_151_0[var_151_1]
		end

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play413122038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["10093"]
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 and arg_151_1.var_.actorSpriteComps10093 == nil then
				arg_151_1.var_.actorSpriteComps10093 = var_154_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_2 = 2

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2

				if arg_151_1.var_.actorSpriteComps10093 then
					for iter_154_0, iter_154_1 in pairs(arg_151_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_154_1 then
							if arg_151_1.isInRecall_ then
								local var_154_4 = Mathf.Lerp(iter_154_1.color.r, 0.82, var_154_3)
								local var_154_5 = Mathf.Lerp(iter_154_1.color.g, 0.77, var_154_3)
								local var_154_6 = Mathf.Lerp(iter_154_1.color.b, 0.62, var_154_3)

								iter_154_1.color = Color.New(var_154_4, var_154_5, var_154_6)
							else
								local var_154_7 = Mathf.Lerp(iter_154_1.color.r, 1, var_154_3)

								iter_154_1.color = Color.New(var_154_7, var_154_7, var_154_7)
							end
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 and arg_151_1.var_.actorSpriteComps10093 then
				for iter_154_2, iter_154_3 in pairs(arg_151_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_154_3 then
						if arg_151_1.isInRecall_ then
							iter_154_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_154_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_151_1.var_.actorSpriteComps10093 = nil
			end

			local var_154_8 = arg_151_1.actors_["10092_1"]
			local var_154_9 = 0

			if var_154_9 < arg_151_1.time_ and arg_151_1.time_ <= var_154_9 + arg_154_0 and arg_151_1.var_.actorSpriteComps10092_1 == nil then
				arg_151_1.var_.actorSpriteComps10092_1 = var_154_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_10 = 2

			if var_154_9 <= arg_151_1.time_ and arg_151_1.time_ < var_154_9 + var_154_10 then
				local var_154_11 = (arg_151_1.time_ - var_154_9) / var_154_10

				if arg_151_1.var_.actorSpriteComps10092_1 then
					for iter_154_4, iter_154_5 in pairs(arg_151_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_154_5 then
							if arg_151_1.isInRecall_ then
								local var_154_12 = Mathf.Lerp(iter_154_5.color.r, 0.46, var_154_11)
								local var_154_13 = Mathf.Lerp(iter_154_5.color.g, 0.43, var_154_11)
								local var_154_14 = Mathf.Lerp(iter_154_5.color.b, 0.35, var_154_11)

								iter_154_5.color = Color.New(var_154_12, var_154_13, var_154_14)
							else
								local var_154_15 = Mathf.Lerp(iter_154_5.color.r, 0.5, var_154_11)

								iter_154_5.color = Color.New(var_154_15, var_154_15, var_154_15)
							end
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_9 + var_154_10 and arg_151_1.time_ < var_154_9 + var_154_10 + arg_154_0 and arg_151_1.var_.actorSpriteComps10092_1 then
				for iter_154_6, iter_154_7 in pairs(arg_151_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_154_7 then
						if arg_151_1.isInRecall_ then
							iter_154_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_154_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_151_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_154_16 = 0
			local var_154_17 = 0.15

			if var_154_16 < arg_151_1.time_ and arg_151_1.time_ <= var_154_16 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_18 = arg_151_1:FormatText(StoryNameCfg[28].name)

				arg_151_1.leftNameTxt_.text = var_154_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_19 = arg_151_1:GetWordFromCfg(413122037)
				local var_154_20 = arg_151_1:FormatText(var_154_19.content)

				arg_151_1.text_.text = var_154_20

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_21 = 6
				local var_154_22 = utf8.len(var_154_20)
				local var_154_23 = var_154_21 <= 0 and var_154_17 or var_154_17 * (var_154_22 / var_154_21)

				if var_154_23 > 0 and var_154_17 < var_154_23 then
					arg_151_1.talkMaxDuration = var_154_23

					if var_154_23 + var_154_16 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_23 + var_154_16
					end
				end

				arg_151_1.text_.text = var_154_20
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122037", "story_v_out_413122.awb") ~= 0 then
					local var_154_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122037", "story_v_out_413122.awb") / 1000

					if var_154_24 + var_154_16 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_24 + var_154_16
					end

					if var_154_19.prefab_name ~= "" and arg_151_1.actors_[var_154_19.prefab_name] ~= nil then
						local var_154_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_19.prefab_name].transform, "story_v_out_413122", "413122037", "story_v_out_413122.awb")

						arg_151_1:RecordAudio("413122037", var_154_25)
						arg_151_1:RecordAudio("413122037", var_154_25)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_413122", "413122037", "story_v_out_413122.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_413122", "413122037", "story_v_out_413122.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_26 = math.max(var_154_17, arg_151_1.talkMaxDuration)

			if var_154_16 <= arg_151_1.time_ and arg_151_1.time_ < var_154_16 + var_154_26 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_16) / var_154_26

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_16 + var_154_26 and arg_151_1.time_ < var_154_16 + var_154_26 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play413122038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 413122038
		arg_155_1.duration_ = 12.07

		local var_155_0 = {
			zh = 5.533,
			ja = 12.066
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
				arg_155_0:Play413122039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10092_1"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos10092_1 = var_158_0.localPosition
				var_158_0.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("10092_1", 2)

				local var_158_2 = var_158_0.childCount

				for iter_158_0 = 0, var_158_2 - 1 do
					local var_158_3 = var_158_0:GetChild(iter_158_0)

					if var_158_3.name == "split_2" or not string.find(var_158_3.name, "split") then
						var_158_3.gameObject:SetActive(true)
					else
						var_158_3.gameObject:SetActive(false)
					end
				end
			end

			local var_158_4 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_4 then
				local var_158_5 = (arg_155_1.time_ - var_158_1) / var_158_4
				local var_158_6 = Vector3.New(-389.49, -300, -295)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10092_1, var_158_6, var_158_5)
			end

			if arg_155_1.time_ >= var_158_1 + var_158_4 and arg_155_1.time_ < var_158_1 + var_158_4 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_158_7 = arg_155_1.actors_["10092_1"]
			local var_158_8 = 0

			if var_158_8 < arg_155_1.time_ and arg_155_1.time_ <= var_158_8 + arg_158_0 and arg_155_1.var_.actorSpriteComps10092_1 == nil then
				arg_155_1.var_.actorSpriteComps10092_1 = var_158_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_9 = 2

			if var_158_8 <= arg_155_1.time_ and arg_155_1.time_ < var_158_8 + var_158_9 then
				local var_158_10 = (arg_155_1.time_ - var_158_8) / var_158_9

				if arg_155_1.var_.actorSpriteComps10092_1 then
					for iter_158_1, iter_158_2 in pairs(arg_155_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_158_2 then
							if arg_155_1.isInRecall_ then
								local var_158_11 = Mathf.Lerp(iter_158_2.color.r, 0.82, var_158_10)
								local var_158_12 = Mathf.Lerp(iter_158_2.color.g, 0.77, var_158_10)
								local var_158_13 = Mathf.Lerp(iter_158_2.color.b, 0.62, var_158_10)

								iter_158_2.color = Color.New(var_158_11, var_158_12, var_158_13)
							else
								local var_158_14 = Mathf.Lerp(iter_158_2.color.r, 1, var_158_10)

								iter_158_2.color = Color.New(var_158_14, var_158_14, var_158_14)
							end
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_8 + var_158_9 and arg_155_1.time_ < var_158_8 + var_158_9 + arg_158_0 and arg_155_1.var_.actorSpriteComps10092_1 then
				for iter_158_3, iter_158_4 in pairs(arg_155_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_158_4 then
						if arg_155_1.isInRecall_ then
							iter_158_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_158_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_155_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_158_15 = arg_155_1.actors_["10093"]
			local var_158_16 = 0

			if var_158_16 < arg_155_1.time_ and arg_155_1.time_ <= var_158_16 + arg_158_0 and arg_155_1.var_.actorSpriteComps10093 == nil then
				arg_155_1.var_.actorSpriteComps10093 = var_158_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_17 = 2

			if var_158_16 <= arg_155_1.time_ and arg_155_1.time_ < var_158_16 + var_158_17 then
				local var_158_18 = (arg_155_1.time_ - var_158_16) / var_158_17

				if arg_155_1.var_.actorSpriteComps10093 then
					for iter_158_5, iter_158_6 in pairs(arg_155_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_158_6 then
							if arg_155_1.isInRecall_ then
								local var_158_19 = Mathf.Lerp(iter_158_6.color.r, 0.46, var_158_18)
								local var_158_20 = Mathf.Lerp(iter_158_6.color.g, 0.43, var_158_18)
								local var_158_21 = Mathf.Lerp(iter_158_6.color.b, 0.35, var_158_18)

								iter_158_6.color = Color.New(var_158_19, var_158_20, var_158_21)
							else
								local var_158_22 = Mathf.Lerp(iter_158_6.color.r, 0.5, var_158_18)

								iter_158_6.color = Color.New(var_158_22, var_158_22, var_158_22)
							end
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_16 + var_158_17 and arg_155_1.time_ < var_158_16 + var_158_17 + arg_158_0 and arg_155_1.var_.actorSpriteComps10093 then
				for iter_158_7, iter_158_8 in pairs(arg_155_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_158_8 then
						if arg_155_1.isInRecall_ then
							iter_158_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_158_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_155_1.var_.actorSpriteComps10093 = nil
			end

			local var_158_23 = 0
			local var_158_24 = 0.625

			if var_158_23 < arg_155_1.time_ and arg_155_1.time_ <= var_158_23 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_25 = arg_155_1:FormatText(StoryNameCfg[996].name)

				arg_155_1.leftNameTxt_.text = var_158_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_26 = arg_155_1:GetWordFromCfg(413122038)
				local var_158_27 = arg_155_1:FormatText(var_158_26.content)

				arg_155_1.text_.text = var_158_27

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_28 = 25
				local var_158_29 = utf8.len(var_158_27)
				local var_158_30 = var_158_28 <= 0 and var_158_24 or var_158_24 * (var_158_29 / var_158_28)

				if var_158_30 > 0 and var_158_24 < var_158_30 then
					arg_155_1.talkMaxDuration = var_158_30

					if var_158_30 + var_158_23 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_30 + var_158_23
					end
				end

				arg_155_1.text_.text = var_158_27
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122038", "story_v_out_413122.awb") ~= 0 then
					local var_158_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122038", "story_v_out_413122.awb") / 1000

					if var_158_31 + var_158_23 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_31 + var_158_23
					end

					if var_158_26.prefab_name ~= "" and arg_155_1.actors_[var_158_26.prefab_name] ~= nil then
						local var_158_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_26.prefab_name].transform, "story_v_out_413122", "413122038", "story_v_out_413122.awb")

						arg_155_1:RecordAudio("413122038", var_158_32)
						arg_155_1:RecordAudio("413122038", var_158_32)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_413122", "413122038", "story_v_out_413122.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_413122", "413122038", "story_v_out_413122.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_33 = math.max(var_158_24, arg_155_1.talkMaxDuration)

			if var_158_23 <= arg_155_1.time_ and arg_155_1.time_ < var_158_23 + var_158_33 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_23) / var_158_33

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_23 + var_158_33 and arg_155_1.time_ < var_158_23 + var_158_33 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play413122039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 413122039
		arg_159_1.duration_ = 7.87

		local var_159_0 = {
			zh = 4.566,
			ja = 7.866
		}
		local var_159_1 = manager.audio:GetLocalizationFlag()

		if var_159_0[var_159_1] ~= nil then
			arg_159_1.duration_ = var_159_0[var_159_1]
		end

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play413122040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10092_1"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.actorSpriteComps10092_1 == nil then
				arg_159_1.var_.actorSpriteComps10092_1 = var_162_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_2 = 2

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.actorSpriteComps10092_1 then
					for iter_162_0, iter_162_1 in pairs(arg_159_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_162_1 then
							if arg_159_1.isInRecall_ then
								local var_162_4 = Mathf.Lerp(iter_162_1.color.r, 0.82, var_162_3)
								local var_162_5 = Mathf.Lerp(iter_162_1.color.g, 0.77, var_162_3)
								local var_162_6 = Mathf.Lerp(iter_162_1.color.b, 0.62, var_162_3)

								iter_162_1.color = Color.New(var_162_4, var_162_5, var_162_6)
							else
								local var_162_7 = Mathf.Lerp(iter_162_1.color.r, 1, var_162_3)

								iter_162_1.color = Color.New(var_162_7, var_162_7, var_162_7)
							end
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.actorSpriteComps10092_1 then
				for iter_162_2, iter_162_3 in pairs(arg_159_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_162_3 then
						if arg_159_1.isInRecall_ then
							iter_162_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_162_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_159_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_162_8 = 0
			local var_162_9 = 0.65

			if var_162_8 < arg_159_1.time_ and arg_159_1.time_ <= var_162_8 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_10 = arg_159_1:FormatText(StoryNameCfg[996].name)

				arg_159_1.leftNameTxt_.text = var_162_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_11 = arg_159_1:GetWordFromCfg(413122039)
				local var_162_12 = arg_159_1:FormatText(var_162_11.content)

				arg_159_1.text_.text = var_162_12

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_13 = 26
				local var_162_14 = utf8.len(var_162_12)
				local var_162_15 = var_162_13 <= 0 and var_162_9 or var_162_9 * (var_162_14 / var_162_13)

				if var_162_15 > 0 and var_162_9 < var_162_15 then
					arg_159_1.talkMaxDuration = var_162_15

					if var_162_15 + var_162_8 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_15 + var_162_8
					end
				end

				arg_159_1.text_.text = var_162_12
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122039", "story_v_out_413122.awb") ~= 0 then
					local var_162_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122039", "story_v_out_413122.awb") / 1000

					if var_162_16 + var_162_8 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_16 + var_162_8
					end

					if var_162_11.prefab_name ~= "" and arg_159_1.actors_[var_162_11.prefab_name] ~= nil then
						local var_162_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_11.prefab_name].transform, "story_v_out_413122", "413122039", "story_v_out_413122.awb")

						arg_159_1:RecordAudio("413122039", var_162_17)
						arg_159_1:RecordAudio("413122039", var_162_17)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_413122", "413122039", "story_v_out_413122.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_413122", "413122039", "story_v_out_413122.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_18 = math.max(var_162_9, arg_159_1.talkMaxDuration)

			if var_162_8 <= arg_159_1.time_ and arg_159_1.time_ < var_162_8 + var_162_18 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_8) / var_162_18

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_8 + var_162_18 and arg_159_1.time_ < var_162_8 + var_162_18 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play413122040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 413122040
		arg_163_1.duration_ = 7.77

		local var_163_0 = {
			zh = 4.333,
			ja = 7.766
		}
		local var_163_1 = manager.audio:GetLocalizationFlag()

		if var_163_0[var_163_1] ~= nil then
			arg_163_1.duration_ = var_163_0[var_163_1]
		end

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play413122041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10093"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos10093 = var_166_0.localPosition
				var_166_0.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("10093", 4)

				local var_166_2 = var_166_0.childCount

				for iter_166_0 = 0, var_166_2 - 1 do
					local var_166_3 = var_166_0:GetChild(iter_166_0)

					if var_166_3.name == "split_6" or not string.find(var_166_3.name, "split") then
						var_166_3.gameObject:SetActive(true)
					else
						var_166_3.gameObject:SetActive(false)
					end
				end
			end

			local var_166_4 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_4 then
				local var_166_5 = (arg_163_1.time_ - var_166_1) / var_166_4
				local var_166_6 = Vector3.New(390, -345, -245)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10093, var_166_6, var_166_5)
			end

			if arg_163_1.time_ >= var_166_1 + var_166_4 and arg_163_1.time_ < var_166_1 + var_166_4 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_166_7 = arg_163_1.actors_["10092_1"].transform
			local var_166_8 = 0

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 then
				arg_163_1.var_.moveOldPos10092_1 = var_166_7.localPosition
				var_166_7.localScale = Vector3.New(1, 1, 1)

				arg_163_1:CheckSpriteTmpPos("10092_1", 2)

				local var_166_9 = var_166_7.childCount

				for iter_166_1 = 0, var_166_9 - 1 do
					local var_166_10 = var_166_7:GetChild(iter_166_1)

					if var_166_10.name == "" or not string.find(var_166_10.name, "split") then
						var_166_10.gameObject:SetActive(true)
					else
						var_166_10.gameObject:SetActive(false)
					end
				end
			end

			local var_166_11 = 0.001

			if var_166_8 <= arg_163_1.time_ and arg_163_1.time_ < var_166_8 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_8) / var_166_11
				local var_166_13 = Vector3.New(-389.49, -300, -295)

				var_166_7.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos10092_1, var_166_13, var_166_12)
			end

			if arg_163_1.time_ >= var_166_8 + var_166_11 and arg_163_1.time_ < var_166_8 + var_166_11 + arg_166_0 then
				var_166_7.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_166_14 = arg_163_1.actors_["10093"]
			local var_166_15 = 0

			if var_166_15 < arg_163_1.time_ and arg_163_1.time_ <= var_166_15 + arg_166_0 and arg_163_1.var_.actorSpriteComps10093 == nil then
				arg_163_1.var_.actorSpriteComps10093 = var_166_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_16 = 2

			if var_166_15 <= arg_163_1.time_ and arg_163_1.time_ < var_166_15 + var_166_16 then
				local var_166_17 = (arg_163_1.time_ - var_166_15) / var_166_16

				if arg_163_1.var_.actorSpriteComps10093 then
					for iter_166_2, iter_166_3 in pairs(arg_163_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_166_3 then
							if arg_163_1.isInRecall_ then
								local var_166_18 = Mathf.Lerp(iter_166_3.color.r, 0.82, var_166_17)
								local var_166_19 = Mathf.Lerp(iter_166_3.color.g, 0.77, var_166_17)
								local var_166_20 = Mathf.Lerp(iter_166_3.color.b, 0.62, var_166_17)

								iter_166_3.color = Color.New(var_166_18, var_166_19, var_166_20)
							else
								local var_166_21 = Mathf.Lerp(iter_166_3.color.r, 1, var_166_17)

								iter_166_3.color = Color.New(var_166_21, var_166_21, var_166_21)
							end
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_15 + var_166_16 and arg_163_1.time_ < var_166_15 + var_166_16 + arg_166_0 and arg_163_1.var_.actorSpriteComps10093 then
				for iter_166_4, iter_166_5 in pairs(arg_163_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_166_5 then
						if arg_163_1.isInRecall_ then
							iter_166_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_166_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_163_1.var_.actorSpriteComps10093 = nil
			end

			local var_166_22 = arg_163_1.actors_["10092_1"]
			local var_166_23 = 0

			if var_166_23 < arg_163_1.time_ and arg_163_1.time_ <= var_166_23 + arg_166_0 and arg_163_1.var_.actorSpriteComps10092_1 == nil then
				arg_163_1.var_.actorSpriteComps10092_1 = var_166_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_24 = 2

			if var_166_23 <= arg_163_1.time_ and arg_163_1.time_ < var_166_23 + var_166_24 then
				local var_166_25 = (arg_163_1.time_ - var_166_23) / var_166_24

				if arg_163_1.var_.actorSpriteComps10092_1 then
					for iter_166_6, iter_166_7 in pairs(arg_163_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_166_7 then
							if arg_163_1.isInRecall_ then
								local var_166_26 = Mathf.Lerp(iter_166_7.color.r, 0.46, var_166_25)
								local var_166_27 = Mathf.Lerp(iter_166_7.color.g, 0.43, var_166_25)
								local var_166_28 = Mathf.Lerp(iter_166_7.color.b, 0.35, var_166_25)

								iter_166_7.color = Color.New(var_166_26, var_166_27, var_166_28)
							else
								local var_166_29 = Mathf.Lerp(iter_166_7.color.r, 0.5, var_166_25)

								iter_166_7.color = Color.New(var_166_29, var_166_29, var_166_29)
							end
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_23 + var_166_24 and arg_163_1.time_ < var_166_23 + var_166_24 + arg_166_0 and arg_163_1.var_.actorSpriteComps10092_1 then
				for iter_166_8, iter_166_9 in pairs(arg_163_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_166_9 then
						if arg_163_1.isInRecall_ then
							iter_166_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_166_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_163_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_166_30 = 0
			local var_166_31 = 0.5

			if var_166_30 < arg_163_1.time_ and arg_163_1.time_ <= var_166_30 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_32 = arg_163_1:FormatText(StoryNameCfg[28].name)

				arg_163_1.leftNameTxt_.text = var_166_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_33 = arg_163_1:GetWordFromCfg(413122040)
				local var_166_34 = arg_163_1:FormatText(var_166_33.content)

				arg_163_1.text_.text = var_166_34

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_35 = 20
				local var_166_36 = utf8.len(var_166_34)
				local var_166_37 = var_166_35 <= 0 and var_166_31 or var_166_31 * (var_166_36 / var_166_35)

				if var_166_37 > 0 and var_166_31 < var_166_37 then
					arg_163_1.talkMaxDuration = var_166_37

					if var_166_37 + var_166_30 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_37 + var_166_30
					end
				end

				arg_163_1.text_.text = var_166_34
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122040", "story_v_out_413122.awb") ~= 0 then
					local var_166_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122040", "story_v_out_413122.awb") / 1000

					if var_166_38 + var_166_30 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_38 + var_166_30
					end

					if var_166_33.prefab_name ~= "" and arg_163_1.actors_[var_166_33.prefab_name] ~= nil then
						local var_166_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_33.prefab_name].transform, "story_v_out_413122", "413122040", "story_v_out_413122.awb")

						arg_163_1:RecordAudio("413122040", var_166_39)
						arg_163_1:RecordAudio("413122040", var_166_39)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_413122", "413122040", "story_v_out_413122.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_413122", "413122040", "story_v_out_413122.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_40 = math.max(var_166_31, arg_163_1.talkMaxDuration)

			if var_166_30 <= arg_163_1.time_ and arg_163_1.time_ < var_166_30 + var_166_40 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_30) / var_166_40

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_30 + var_166_40 and arg_163_1.time_ < var_166_30 + var_166_40 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play413122041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 413122041
		arg_167_1.duration_ = 5

		local var_167_0 = {
			zh = 3.2,
			ja = 5
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
				arg_167_0:Play413122042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10092_1"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos10092_1 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("10092_1", 2)

				local var_170_2 = var_170_0.childCount

				for iter_170_0 = 0, var_170_2 - 1 do
					local var_170_3 = var_170_0:GetChild(iter_170_0)

					if var_170_3.name == "split_2" or not string.find(var_170_3.name, "split") then
						var_170_3.gameObject:SetActive(true)
					else
						var_170_3.gameObject:SetActive(false)
					end
				end
			end

			local var_170_4 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_4 then
				local var_170_5 = (arg_167_1.time_ - var_170_1) / var_170_4
				local var_170_6 = Vector3.New(-389.49, -300, -295)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos10092_1, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_170_7 = arg_167_1.actors_["10093"].transform
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 then
				arg_167_1.var_.moveOldPos10093 = var_170_7.localPosition
				var_170_7.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("10093", 4)

				local var_170_9 = var_170_7.childCount

				for iter_170_1 = 0, var_170_9 - 1 do
					local var_170_10 = var_170_7:GetChild(iter_170_1)

					if var_170_10.name == "" or not string.find(var_170_10.name, "split") then
						var_170_10.gameObject:SetActive(true)
					else
						var_170_10.gameObject:SetActive(false)
					end
				end
			end

			local var_170_11 = 0.001

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_8) / var_170_11
				local var_170_13 = Vector3.New(390, -345, -245)

				var_170_7.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos10093, var_170_13, var_170_12)
			end

			if arg_167_1.time_ >= var_170_8 + var_170_11 and arg_167_1.time_ < var_170_8 + var_170_11 + arg_170_0 then
				var_170_7.localPosition = Vector3.New(390, -345, -245)
			end

			local var_170_14 = arg_167_1.actors_["10092_1"]
			local var_170_15 = 0

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 and arg_167_1.var_.actorSpriteComps10092_1 == nil then
				arg_167_1.var_.actorSpriteComps10092_1 = var_170_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_16 = 2

			if var_170_15 <= arg_167_1.time_ and arg_167_1.time_ < var_170_15 + var_170_16 then
				local var_170_17 = (arg_167_1.time_ - var_170_15) / var_170_16

				if arg_167_1.var_.actorSpriteComps10092_1 then
					for iter_170_2, iter_170_3 in pairs(arg_167_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_170_3 then
							if arg_167_1.isInRecall_ then
								local var_170_18 = Mathf.Lerp(iter_170_3.color.r, 0.82, var_170_17)
								local var_170_19 = Mathf.Lerp(iter_170_3.color.g, 0.77, var_170_17)
								local var_170_20 = Mathf.Lerp(iter_170_3.color.b, 0.62, var_170_17)

								iter_170_3.color = Color.New(var_170_18, var_170_19, var_170_20)
							else
								local var_170_21 = Mathf.Lerp(iter_170_3.color.r, 1, var_170_17)

								iter_170_3.color = Color.New(var_170_21, var_170_21, var_170_21)
							end
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_15 + var_170_16 and arg_167_1.time_ < var_170_15 + var_170_16 + arg_170_0 and arg_167_1.var_.actorSpriteComps10092_1 then
				for iter_170_4, iter_170_5 in pairs(arg_167_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_170_5 then
						if arg_167_1.isInRecall_ then
							iter_170_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_170_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_167_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_170_22 = arg_167_1.actors_["10093"]
			local var_170_23 = 0

			if var_170_23 < arg_167_1.time_ and arg_167_1.time_ <= var_170_23 + arg_170_0 and arg_167_1.var_.actorSpriteComps10093 == nil then
				arg_167_1.var_.actorSpriteComps10093 = var_170_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_24 = 2

			if var_170_23 <= arg_167_1.time_ and arg_167_1.time_ < var_170_23 + var_170_24 then
				local var_170_25 = (arg_167_1.time_ - var_170_23) / var_170_24

				if arg_167_1.var_.actorSpriteComps10093 then
					for iter_170_6, iter_170_7 in pairs(arg_167_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_170_7 then
							if arg_167_1.isInRecall_ then
								local var_170_26 = Mathf.Lerp(iter_170_7.color.r, 0.46, var_170_25)
								local var_170_27 = Mathf.Lerp(iter_170_7.color.g, 0.43, var_170_25)
								local var_170_28 = Mathf.Lerp(iter_170_7.color.b, 0.35, var_170_25)

								iter_170_7.color = Color.New(var_170_26, var_170_27, var_170_28)
							else
								local var_170_29 = Mathf.Lerp(iter_170_7.color.r, 0.5, var_170_25)

								iter_170_7.color = Color.New(var_170_29, var_170_29, var_170_29)
							end
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_23 + var_170_24 and arg_167_1.time_ < var_170_23 + var_170_24 + arg_170_0 and arg_167_1.var_.actorSpriteComps10093 then
				for iter_170_8, iter_170_9 in pairs(arg_167_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_170_9 then
						if arg_167_1.isInRecall_ then
							iter_170_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_170_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_167_1.var_.actorSpriteComps10093 = nil
			end

			local var_170_30 = 0
			local var_170_31 = 0.3

			if var_170_30 < arg_167_1.time_ and arg_167_1.time_ <= var_170_30 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_32 = arg_167_1:FormatText(StoryNameCfg[996].name)

				arg_167_1.leftNameTxt_.text = var_170_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_33 = arg_167_1:GetWordFromCfg(413122041)
				local var_170_34 = arg_167_1:FormatText(var_170_33.content)

				arg_167_1.text_.text = var_170_34

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_35 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122041", "story_v_out_413122.awb") ~= 0 then
					local var_170_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122041", "story_v_out_413122.awb") / 1000

					if var_170_38 + var_170_30 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_38 + var_170_30
					end

					if var_170_33.prefab_name ~= "" and arg_167_1.actors_[var_170_33.prefab_name] ~= nil then
						local var_170_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_33.prefab_name].transform, "story_v_out_413122", "413122041", "story_v_out_413122.awb")

						arg_167_1:RecordAudio("413122041", var_170_39)
						arg_167_1:RecordAudio("413122041", var_170_39)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_413122", "413122041", "story_v_out_413122.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_413122", "413122041", "story_v_out_413122.awb")
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
	Play413122042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 413122042
		arg_171_1.duration_ = 11.6

		local var_171_0 = {
			zh = 7.7,
			ja = 11.6
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
				arg_171_0:Play413122043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["10092_1"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.actorSpriteComps10092_1 == nil then
				arg_171_1.var_.actorSpriteComps10092_1 = var_174_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_2 = 2

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.actorSpriteComps10092_1 then
					for iter_174_0, iter_174_1 in pairs(arg_171_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_174_1 then
							if arg_171_1.isInRecall_ then
								local var_174_4 = Mathf.Lerp(iter_174_1.color.r, 0.82, var_174_3)
								local var_174_5 = Mathf.Lerp(iter_174_1.color.g, 0.77, var_174_3)
								local var_174_6 = Mathf.Lerp(iter_174_1.color.b, 0.62, var_174_3)

								iter_174_1.color = Color.New(var_174_4, var_174_5, var_174_6)
							else
								local var_174_7 = Mathf.Lerp(iter_174_1.color.r, 1, var_174_3)

								iter_174_1.color = Color.New(var_174_7, var_174_7, var_174_7)
							end
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.actorSpriteComps10092_1 then
				for iter_174_2, iter_174_3 in pairs(arg_171_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_174_3 then
						if arg_171_1.isInRecall_ then
							iter_174_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_174_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_171_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_174_8 = 0
			local var_174_9 = 1

			if var_174_8 < arg_171_1.time_ and arg_171_1.time_ <= var_174_8 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_10 = arg_171_1:FormatText(StoryNameCfg[996].name)

				arg_171_1.leftNameTxt_.text = var_174_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_11 = arg_171_1:GetWordFromCfg(413122042)
				local var_174_12 = arg_171_1:FormatText(var_174_11.content)

				arg_171_1.text_.text = var_174_12

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_13 = 40
				local var_174_14 = utf8.len(var_174_12)
				local var_174_15 = var_174_13 <= 0 and var_174_9 or var_174_9 * (var_174_14 / var_174_13)

				if var_174_15 > 0 and var_174_9 < var_174_15 then
					arg_171_1.talkMaxDuration = var_174_15

					if var_174_15 + var_174_8 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_15 + var_174_8
					end
				end

				arg_171_1.text_.text = var_174_12
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122042", "story_v_out_413122.awb") ~= 0 then
					local var_174_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122042", "story_v_out_413122.awb") / 1000

					if var_174_16 + var_174_8 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_16 + var_174_8
					end

					if var_174_11.prefab_name ~= "" and arg_171_1.actors_[var_174_11.prefab_name] ~= nil then
						local var_174_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_11.prefab_name].transform, "story_v_out_413122", "413122042", "story_v_out_413122.awb")

						arg_171_1:RecordAudio("413122042", var_174_17)
						arg_171_1:RecordAudio("413122042", var_174_17)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_413122", "413122042", "story_v_out_413122.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_413122", "413122042", "story_v_out_413122.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_18 = math.max(var_174_9, arg_171_1.talkMaxDuration)

			if var_174_8 <= arg_171_1.time_ and arg_171_1.time_ < var_174_8 + var_174_18 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_8) / var_174_18

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_8 + var_174_18 and arg_171_1.time_ < var_174_8 + var_174_18 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play413122043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 413122043
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play413122044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10092_1"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos10092_1 = var_178_0.localPosition
				var_178_0.localScale = Vector3.New(1, 1, 1)

				arg_175_1:CheckSpriteTmpPos("10092_1", 6)

				local var_178_2 = var_178_0.childCount

				for iter_178_0 = 0, var_178_2 - 1 do
					local var_178_3 = var_178_0:GetChild(iter_178_0)

					if var_178_3.name == "" or not string.find(var_178_3.name, "split") then
						var_178_3.gameObject:SetActive(true)
					else
						var_178_3.gameObject:SetActive(false)
					end
				end
			end

			local var_178_4 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_4 then
				local var_178_5 = (arg_175_1.time_ - var_178_1) / var_178_4
				local var_178_6 = Vector3.New(1500, -300, -295)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10092_1, var_178_6, var_178_5)
			end

			if arg_175_1.time_ >= var_178_1 + var_178_4 and arg_175_1.time_ < var_178_1 + var_178_4 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(1500, -300, -295)
			end

			local var_178_7 = arg_175_1.actors_["10093"].transform
			local var_178_8 = 0

			if var_178_8 < arg_175_1.time_ and arg_175_1.time_ <= var_178_8 + arg_178_0 then
				arg_175_1.var_.moveOldPos10093 = var_178_7.localPosition
				var_178_7.localScale = Vector3.New(1, 1, 1)

				arg_175_1:CheckSpriteTmpPos("10093", 6)

				local var_178_9 = var_178_7.childCount

				for iter_178_1 = 0, var_178_9 - 1 do
					local var_178_10 = var_178_7:GetChild(iter_178_1)

					if var_178_10.name == "" or not string.find(var_178_10.name, "split") then
						var_178_10.gameObject:SetActive(true)
					else
						var_178_10.gameObject:SetActive(false)
					end
				end
			end

			local var_178_11 = 0.001

			if var_178_8 <= arg_175_1.time_ and arg_175_1.time_ < var_178_8 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_8) / var_178_11
				local var_178_13 = Vector3.New(1500, -345, -245)

				var_178_7.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10093, var_178_13, var_178_12)
			end

			if arg_175_1.time_ >= var_178_8 + var_178_11 and arg_175_1.time_ < var_178_8 + var_178_11 + arg_178_0 then
				var_178_7.localPosition = Vector3.New(1500, -345, -245)
			end

			local var_178_14 = arg_175_1.actors_["10092_1"]
			local var_178_15 = 0

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 and arg_175_1.var_.actorSpriteComps10092_1 == nil then
				arg_175_1.var_.actorSpriteComps10092_1 = var_178_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_16 = 2

			if var_178_15 <= arg_175_1.time_ and arg_175_1.time_ < var_178_15 + var_178_16 then
				local var_178_17 = (arg_175_1.time_ - var_178_15) / var_178_16

				if arg_175_1.var_.actorSpriteComps10092_1 then
					for iter_178_2, iter_178_3 in pairs(arg_175_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_178_3 then
							if arg_175_1.isInRecall_ then
								local var_178_18 = Mathf.Lerp(iter_178_3.color.r, 0.46, var_178_17)
								local var_178_19 = Mathf.Lerp(iter_178_3.color.g, 0.43, var_178_17)
								local var_178_20 = Mathf.Lerp(iter_178_3.color.b, 0.35, var_178_17)

								iter_178_3.color = Color.New(var_178_18, var_178_19, var_178_20)
							else
								local var_178_21 = Mathf.Lerp(iter_178_3.color.r, 0.5, var_178_17)

								iter_178_3.color = Color.New(var_178_21, var_178_21, var_178_21)
							end
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_15 + var_178_16 and arg_175_1.time_ < var_178_15 + var_178_16 + arg_178_0 and arg_175_1.var_.actorSpriteComps10092_1 then
				for iter_178_4, iter_178_5 in pairs(arg_175_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_178_5 then
						if arg_175_1.isInRecall_ then
							iter_178_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_178_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_175_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_178_22 = arg_175_1.actors_["10093"]
			local var_178_23 = 0

			if var_178_23 < arg_175_1.time_ and arg_175_1.time_ <= var_178_23 + arg_178_0 and arg_175_1.var_.actorSpriteComps10093 == nil then
				arg_175_1.var_.actorSpriteComps10093 = var_178_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_24 = 2

			if var_178_23 <= arg_175_1.time_ and arg_175_1.time_ < var_178_23 + var_178_24 then
				local var_178_25 = (arg_175_1.time_ - var_178_23) / var_178_24

				if arg_175_1.var_.actorSpriteComps10093 then
					for iter_178_6, iter_178_7 in pairs(arg_175_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_178_7 then
							if arg_175_1.isInRecall_ then
								local var_178_26 = Mathf.Lerp(iter_178_7.color.r, 0.46, var_178_25)
								local var_178_27 = Mathf.Lerp(iter_178_7.color.g, 0.43, var_178_25)
								local var_178_28 = Mathf.Lerp(iter_178_7.color.b, 0.35, var_178_25)

								iter_178_7.color = Color.New(var_178_26, var_178_27, var_178_28)
							else
								local var_178_29 = Mathf.Lerp(iter_178_7.color.r, 0.5, var_178_25)

								iter_178_7.color = Color.New(var_178_29, var_178_29, var_178_29)
							end
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_23 + var_178_24 and arg_175_1.time_ < var_178_23 + var_178_24 + arg_178_0 and arg_175_1.var_.actorSpriteComps10093 then
				for iter_178_8, iter_178_9 in pairs(arg_175_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_178_9 then
						if arg_175_1.isInRecall_ then
							iter_178_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_178_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_175_1.var_.actorSpriteComps10093 = nil
			end

			local var_178_30 = 0
			local var_178_31 = 1.025

			if var_178_30 < arg_175_1.time_ and arg_175_1.time_ <= var_178_30 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_32 = arg_175_1:GetWordFromCfg(413122043)
				local var_178_33 = arg_175_1:FormatText(var_178_32.content)

				arg_175_1.text_.text = var_178_33

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_34 = 41
				local var_178_35 = utf8.len(var_178_33)
				local var_178_36 = var_178_34 <= 0 and var_178_31 or var_178_31 * (var_178_35 / var_178_34)

				if var_178_36 > 0 and var_178_31 < var_178_36 then
					arg_175_1.talkMaxDuration = var_178_36

					if var_178_36 + var_178_30 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_36 + var_178_30
					end
				end

				arg_175_1.text_.text = var_178_33
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_37 = math.max(var_178_31, arg_175_1.talkMaxDuration)

			if var_178_30 <= arg_175_1.time_ and arg_175_1.time_ < var_178_30 + var_178_37 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_30) / var_178_37

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_30 + var_178_37 and arg_175_1.time_ < var_178_30 + var_178_37 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play413122044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 413122044
		arg_179_1.duration_ = 6.6

		local var_179_0 = {
			zh = 6.6,
			ja = 5.9
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
				arg_179_0:Play413122045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10022"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos10022 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10022", 3)

				local var_182_2 = var_182_0.childCount

				for iter_182_0 = 0, var_182_2 - 1 do
					local var_182_3 = var_182_0:GetChild(iter_182_0)

					if var_182_3.name == "split_6" or not string.find(var_182_3.name, "split") then
						var_182_3.gameObject:SetActive(true)
					else
						var_182_3.gameObject:SetActive(false)
					end
				end
			end

			local var_182_4 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_4 then
				local var_182_5 = (arg_179_1.time_ - var_182_1) / var_182_4
				local var_182_6 = Vector3.New(0, -315, -320)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10022, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(0, -315, -320)
			end

			local var_182_7 = arg_179_1.actors_["10022"]
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 and arg_179_1.var_.actorSpriteComps10022 == nil then
				arg_179_1.var_.actorSpriteComps10022 = var_182_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_9 = 2

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_8) / var_182_9

				if arg_179_1.var_.actorSpriteComps10022 then
					for iter_182_1, iter_182_2 in pairs(arg_179_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_182_2 then
							if arg_179_1.isInRecall_ then
								local var_182_11 = Mathf.Lerp(iter_182_2.color.r, 0.82, var_182_10)
								local var_182_12 = Mathf.Lerp(iter_182_2.color.g, 0.77, var_182_10)
								local var_182_13 = Mathf.Lerp(iter_182_2.color.b, 0.62, var_182_10)

								iter_182_2.color = Color.New(var_182_11, var_182_12, var_182_13)
							else
								local var_182_14 = Mathf.Lerp(iter_182_2.color.r, 1, var_182_10)

								iter_182_2.color = Color.New(var_182_14, var_182_14, var_182_14)
							end
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_8 + var_182_9 and arg_179_1.time_ < var_182_8 + var_182_9 + arg_182_0 and arg_179_1.var_.actorSpriteComps10022 then
				for iter_182_3, iter_182_4 in pairs(arg_179_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_182_4 then
						if arg_179_1.isInRecall_ then
							iter_182_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_182_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_179_1.var_.actorSpriteComps10022 = nil
			end

			local var_182_15 = 0
			local var_182_16 = 0.65

			if var_182_15 < arg_179_1.time_ and arg_179_1.time_ <= var_182_15 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_17 = arg_179_1:FormatText(StoryNameCfg[614].name)

				arg_179_1.leftNameTxt_.text = var_182_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_18 = arg_179_1:GetWordFromCfg(413122044)
				local var_182_19 = arg_179_1:FormatText(var_182_18.content)

				arg_179_1.text_.text = var_182_19

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_20 = 26
				local var_182_21 = utf8.len(var_182_19)
				local var_182_22 = var_182_20 <= 0 and var_182_16 or var_182_16 * (var_182_21 / var_182_20)

				if var_182_22 > 0 and var_182_16 < var_182_22 then
					arg_179_1.talkMaxDuration = var_182_22

					if var_182_22 + var_182_15 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_22 + var_182_15
					end
				end

				arg_179_1.text_.text = var_182_19
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122044", "story_v_out_413122.awb") ~= 0 then
					local var_182_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122044", "story_v_out_413122.awb") / 1000

					if var_182_23 + var_182_15 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_23 + var_182_15
					end

					if var_182_18.prefab_name ~= "" and arg_179_1.actors_[var_182_18.prefab_name] ~= nil then
						local var_182_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_18.prefab_name].transform, "story_v_out_413122", "413122044", "story_v_out_413122.awb")

						arg_179_1:RecordAudio("413122044", var_182_24)
						arg_179_1:RecordAudio("413122044", var_182_24)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_413122", "413122044", "story_v_out_413122.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_413122", "413122044", "story_v_out_413122.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_25 = math.max(var_182_16, arg_179_1.talkMaxDuration)

			if var_182_15 <= arg_179_1.time_ and arg_179_1.time_ < var_182_15 + var_182_25 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_15) / var_182_25

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_15 + var_182_25 and arg_179_1.time_ < var_182_15 + var_182_25 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play413122045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 413122045
		arg_183_1.duration_ = 4.77

		local var_183_0 = {
			zh = 3.866,
			ja = 4.766
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
				arg_183_0:Play413122046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10022"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10022 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("10022", 2)

				local var_186_2 = var_186_0.childCount

				for iter_186_0 = 0, var_186_2 - 1 do
					local var_186_3 = var_186_0:GetChild(iter_186_0)

					if var_186_3.name == "" or not string.find(var_186_3.name, "split") then
						var_186_3.gameObject:SetActive(true)
					else
						var_186_3.gameObject:SetActive(false)
					end
				end
			end

			local var_186_4 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_4 then
				local var_186_5 = (arg_183_1.time_ - var_186_1) / var_186_4
				local var_186_6 = Vector3.New(-390, -315, -320)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10022, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_186_7 = "10094"

			if arg_183_1.actors_[var_186_7] == nil then
				local var_186_8 = Object.Instantiate(Asset.Load("Widget/System/Story/StoryExpression/" .. var_186_7), arg_183_1.canvasGo_.transform)

				var_186_8.transform:SetSiblingIndex(1)

				var_186_8.name = var_186_7
				var_186_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_183_1.actors_[var_186_7] = var_186_8

				local var_186_9 = var_186_8:GetComponentsInChildren(typeof(Image), true):ToTable()

				if arg_183_1.isInRecall_ then
					for iter_186_1, iter_186_2 in ipairs(var_186_9) do
						iter_186_2.color = Color.New(0.82, 0.77, 0.62)
					end
				end
			end

			local var_186_10 = arg_183_1.actors_["10094"].transform
			local var_186_11 = 0

			if var_186_11 < arg_183_1.time_ and arg_183_1.time_ <= var_186_11 + arg_186_0 then
				arg_183_1.var_.moveOldPos10094 = var_186_10.localPosition
				var_186_10.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("10094", 4)

				local var_186_12 = var_186_10.childCount

				for iter_186_3 = 0, var_186_12 - 1 do
					local var_186_13 = var_186_10:GetChild(iter_186_3)

					if var_186_13.name == "split_1" or not string.find(var_186_13.name, "split") then
						var_186_13.gameObject:SetActive(true)
					else
						var_186_13.gameObject:SetActive(false)
					end
				end
			end

			local var_186_14 = 0.001

			if var_186_11 <= arg_183_1.time_ and arg_183_1.time_ < var_186_11 + var_186_14 then
				local var_186_15 = (arg_183_1.time_ - var_186_11) / var_186_14
				local var_186_16 = Vector3.New(390, -340, -414)

				var_186_10.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10094, var_186_16, var_186_15)
			end

			if arg_183_1.time_ >= var_186_11 + var_186_14 and arg_183_1.time_ < var_186_11 + var_186_14 + arg_186_0 then
				var_186_10.localPosition = Vector3.New(390, -340, -414)
			end

			local var_186_17 = arg_183_1.actors_["10022"]
			local var_186_18 = 0

			if var_186_18 < arg_183_1.time_ and arg_183_1.time_ <= var_186_18 + arg_186_0 and arg_183_1.var_.actorSpriteComps10022 == nil then
				arg_183_1.var_.actorSpriteComps10022 = var_186_17:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_19 = 2

			if var_186_18 <= arg_183_1.time_ and arg_183_1.time_ < var_186_18 + var_186_19 then
				local var_186_20 = (arg_183_1.time_ - var_186_18) / var_186_19

				if arg_183_1.var_.actorSpriteComps10022 then
					for iter_186_4, iter_186_5 in pairs(arg_183_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_186_5 then
							if arg_183_1.isInRecall_ then
								local var_186_21 = Mathf.Lerp(iter_186_5.color.r, 0.46, var_186_20)
								local var_186_22 = Mathf.Lerp(iter_186_5.color.g, 0.43, var_186_20)
								local var_186_23 = Mathf.Lerp(iter_186_5.color.b, 0.35, var_186_20)

								iter_186_5.color = Color.New(var_186_21, var_186_22, var_186_23)
							else
								local var_186_24 = Mathf.Lerp(iter_186_5.color.r, 0.5, var_186_20)

								iter_186_5.color = Color.New(var_186_24, var_186_24, var_186_24)
							end
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_18 + var_186_19 and arg_183_1.time_ < var_186_18 + var_186_19 + arg_186_0 and arg_183_1.var_.actorSpriteComps10022 then
				for iter_186_6, iter_186_7 in pairs(arg_183_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_186_7 then
						if arg_183_1.isInRecall_ then
							iter_186_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_186_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_183_1.var_.actorSpriteComps10022 = nil
			end

			local var_186_25 = arg_183_1.actors_["10094"]
			local var_186_26 = 0

			if var_186_26 < arg_183_1.time_ and arg_183_1.time_ <= var_186_26 + arg_186_0 and arg_183_1.var_.actorSpriteComps10094 == nil then
				arg_183_1.var_.actorSpriteComps10094 = var_186_25:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_27 = 2

			if var_186_26 <= arg_183_1.time_ and arg_183_1.time_ < var_186_26 + var_186_27 then
				local var_186_28 = (arg_183_1.time_ - var_186_26) / var_186_27

				if arg_183_1.var_.actorSpriteComps10094 then
					for iter_186_8, iter_186_9 in pairs(arg_183_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_186_9 then
							if arg_183_1.isInRecall_ then
								local var_186_29 = Mathf.Lerp(iter_186_9.color.r, 0.82, var_186_28)
								local var_186_30 = Mathf.Lerp(iter_186_9.color.g, 0.77, var_186_28)
								local var_186_31 = Mathf.Lerp(iter_186_9.color.b, 0.62, var_186_28)

								iter_186_9.color = Color.New(var_186_29, var_186_30, var_186_31)
							else
								local var_186_32 = Mathf.Lerp(iter_186_9.color.r, 1, var_186_28)

								iter_186_9.color = Color.New(var_186_32, var_186_32, var_186_32)
							end
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_26 + var_186_27 and arg_183_1.time_ < var_186_26 + var_186_27 + arg_186_0 and arg_183_1.var_.actorSpriteComps10094 then
				for iter_186_10, iter_186_11 in pairs(arg_183_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_186_11 then
						if arg_183_1.isInRecall_ then
							iter_186_11.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_186_11.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_183_1.var_.actorSpriteComps10094 = nil
			end

			local var_186_33 = 0
			local var_186_34 = 0.5

			if var_186_33 < arg_183_1.time_ and arg_183_1.time_ <= var_186_33 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_35 = arg_183_1:FormatText(StoryNameCfg[259].name)

				arg_183_1.leftNameTxt_.text = var_186_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_36 = arg_183_1:GetWordFromCfg(413122045)
				local var_186_37 = arg_183_1:FormatText(var_186_36.content)

				arg_183_1.text_.text = var_186_37

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_38 = 20
				local var_186_39 = utf8.len(var_186_37)
				local var_186_40 = var_186_38 <= 0 and var_186_34 or var_186_34 * (var_186_39 / var_186_38)

				if var_186_40 > 0 and var_186_34 < var_186_40 then
					arg_183_1.talkMaxDuration = var_186_40

					if var_186_40 + var_186_33 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_40 + var_186_33
					end
				end

				arg_183_1.text_.text = var_186_37
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122045", "story_v_out_413122.awb") ~= 0 then
					local var_186_41 = manager.audio:GetVoiceLength("story_v_out_413122", "413122045", "story_v_out_413122.awb") / 1000

					if var_186_41 + var_186_33 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_41 + var_186_33
					end

					if var_186_36.prefab_name ~= "" and arg_183_1.actors_[var_186_36.prefab_name] ~= nil then
						local var_186_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_36.prefab_name].transform, "story_v_out_413122", "413122045", "story_v_out_413122.awb")

						arg_183_1:RecordAudio("413122045", var_186_42)
						arg_183_1:RecordAudio("413122045", var_186_42)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_413122", "413122045", "story_v_out_413122.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_413122", "413122045", "story_v_out_413122.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_43 = math.max(var_186_34, arg_183_1.talkMaxDuration)

			if var_186_33 <= arg_183_1.time_ and arg_183_1.time_ < var_186_33 + var_186_43 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_33) / var_186_43

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_33 + var_186_43 and arg_183_1.time_ < var_186_33 + var_186_43 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play413122046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 413122046
		arg_187_1.duration_ = 2

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play413122047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10022"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10022 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10022", 2)

				local var_190_2 = var_190_0.childCount

				for iter_190_0 = 0, var_190_2 - 1 do
					local var_190_3 = var_190_0:GetChild(iter_190_0)

					if var_190_3.name == "split_8" or not string.find(var_190_3.name, "split") then
						var_190_3.gameObject:SetActive(true)
					else
						var_190_3.gameObject:SetActive(false)
					end
				end
			end

			local var_190_4 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_4 then
				local var_190_5 = (arg_187_1.time_ - var_190_1) / var_190_4
				local var_190_6 = Vector3.New(-390, -315, -320)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10022, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_190_7 = arg_187_1.actors_["10094"].transform
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 then
				arg_187_1.var_.moveOldPos10094 = var_190_7.localPosition
				var_190_7.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10094", 4)

				local var_190_9 = var_190_7.childCount

				for iter_190_1 = 0, var_190_9 - 1 do
					local var_190_10 = var_190_7:GetChild(iter_190_1)

					if var_190_10.name == "split_1" or not string.find(var_190_10.name, "split") then
						var_190_10.gameObject:SetActive(true)
					else
						var_190_10.gameObject:SetActive(false)
					end
				end
			end

			local var_190_11 = 0.001

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_8) / var_190_11
				local var_190_13 = Vector3.New(390, -340, -414)

				var_190_7.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10094, var_190_13, var_190_12)
			end

			if arg_187_1.time_ >= var_190_8 + var_190_11 and arg_187_1.time_ < var_190_8 + var_190_11 + arg_190_0 then
				var_190_7.localPosition = Vector3.New(390, -340, -414)
			end

			local var_190_14 = arg_187_1.actors_["10022"]
			local var_190_15 = 0

			if var_190_15 < arg_187_1.time_ and arg_187_1.time_ <= var_190_15 + arg_190_0 and arg_187_1.var_.actorSpriteComps10022 == nil then
				arg_187_1.var_.actorSpriteComps10022 = var_190_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_16 = 2

			if var_190_15 <= arg_187_1.time_ and arg_187_1.time_ < var_190_15 + var_190_16 then
				local var_190_17 = (arg_187_1.time_ - var_190_15) / var_190_16

				if arg_187_1.var_.actorSpriteComps10022 then
					for iter_190_2, iter_190_3 in pairs(arg_187_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_190_3 then
							if arg_187_1.isInRecall_ then
								local var_190_18 = Mathf.Lerp(iter_190_3.color.r, 0.82, var_190_17)
								local var_190_19 = Mathf.Lerp(iter_190_3.color.g, 0.77, var_190_17)
								local var_190_20 = Mathf.Lerp(iter_190_3.color.b, 0.62, var_190_17)

								iter_190_3.color = Color.New(var_190_18, var_190_19, var_190_20)
							else
								local var_190_21 = Mathf.Lerp(iter_190_3.color.r, 1, var_190_17)

								iter_190_3.color = Color.New(var_190_21, var_190_21, var_190_21)
							end
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_15 + var_190_16 and arg_187_1.time_ < var_190_15 + var_190_16 + arg_190_0 and arg_187_1.var_.actorSpriteComps10022 then
				for iter_190_4, iter_190_5 in pairs(arg_187_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_190_5 then
						if arg_187_1.isInRecall_ then
							iter_190_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_190_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_187_1.var_.actorSpriteComps10022 = nil
			end

			local var_190_22 = arg_187_1.actors_["10094"]
			local var_190_23 = 0

			if var_190_23 < arg_187_1.time_ and arg_187_1.time_ <= var_190_23 + arg_190_0 and arg_187_1.var_.actorSpriteComps10094 == nil then
				arg_187_1.var_.actorSpriteComps10094 = var_190_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_24 = 2

			if var_190_23 <= arg_187_1.time_ and arg_187_1.time_ < var_190_23 + var_190_24 then
				local var_190_25 = (arg_187_1.time_ - var_190_23) / var_190_24

				if arg_187_1.var_.actorSpriteComps10094 then
					for iter_190_6, iter_190_7 in pairs(arg_187_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_190_7 then
							if arg_187_1.isInRecall_ then
								local var_190_26 = Mathf.Lerp(iter_190_7.color.r, 0.46, var_190_25)
								local var_190_27 = Mathf.Lerp(iter_190_7.color.g, 0.43, var_190_25)
								local var_190_28 = Mathf.Lerp(iter_190_7.color.b, 0.35, var_190_25)

								iter_190_7.color = Color.New(var_190_26, var_190_27, var_190_28)
							else
								local var_190_29 = Mathf.Lerp(iter_190_7.color.r, 0.5, var_190_25)

								iter_190_7.color = Color.New(var_190_29, var_190_29, var_190_29)
							end
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_23 + var_190_24 and arg_187_1.time_ < var_190_23 + var_190_24 + arg_190_0 and arg_187_1.var_.actorSpriteComps10094 then
				for iter_190_8, iter_190_9 in pairs(arg_187_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_190_9 then
						if arg_187_1.isInRecall_ then
							iter_190_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_190_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_187_1.var_.actorSpriteComps10094 = nil
			end

			local var_190_30 = 0
			local var_190_31 = 0.075

			if var_190_30 < arg_187_1.time_ and arg_187_1.time_ <= var_190_30 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_32 = arg_187_1:FormatText(StoryNameCfg[614].name)

				arg_187_1.leftNameTxt_.text = var_190_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_33 = arg_187_1:GetWordFromCfg(413122046)
				local var_190_34 = arg_187_1:FormatText(var_190_33.content)

				arg_187_1.text_.text = var_190_34

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_35 = 3
				local var_190_36 = utf8.len(var_190_34)
				local var_190_37 = var_190_35 <= 0 and var_190_31 or var_190_31 * (var_190_36 / var_190_35)

				if var_190_37 > 0 and var_190_31 < var_190_37 then
					arg_187_1.talkMaxDuration = var_190_37

					if var_190_37 + var_190_30 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_37 + var_190_30
					end
				end

				arg_187_1.text_.text = var_190_34
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122046", "story_v_out_413122.awb") ~= 0 then
					local var_190_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122046", "story_v_out_413122.awb") / 1000

					if var_190_38 + var_190_30 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_38 + var_190_30
					end

					if var_190_33.prefab_name ~= "" and arg_187_1.actors_[var_190_33.prefab_name] ~= nil then
						local var_190_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_33.prefab_name].transform, "story_v_out_413122", "413122046", "story_v_out_413122.awb")

						arg_187_1:RecordAudio("413122046", var_190_39)
						arg_187_1:RecordAudio("413122046", var_190_39)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_413122", "413122046", "story_v_out_413122.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_413122", "413122046", "story_v_out_413122.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_40 = math.max(var_190_31, arg_187_1.talkMaxDuration)

			if var_190_30 <= arg_187_1.time_ and arg_187_1.time_ < var_190_30 + var_190_40 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_30) / var_190_40

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_30 + var_190_40 and arg_187_1.time_ < var_190_30 + var_190_40 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play413122047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 413122047
		arg_191_1.duration_ = 11.8

		local var_191_0 = {
			zh = 7.733,
			ja = 11.8
		}
		local var_191_1 = manager.audio:GetLocalizationFlag()

		if var_191_0[var_191_1] ~= nil then
			arg_191_1.duration_ = var_191_0[var_191_1]
		end

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play413122048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10022"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.actorSpriteComps10022 == nil then
				arg_191_1.var_.actorSpriteComps10022 = var_194_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_2 = 2

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.actorSpriteComps10022 then
					for iter_194_0, iter_194_1 in pairs(arg_191_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_194_1 then
							if arg_191_1.isInRecall_ then
								local var_194_4 = Mathf.Lerp(iter_194_1.color.r, 0.46, var_194_3)
								local var_194_5 = Mathf.Lerp(iter_194_1.color.g, 0.43, var_194_3)
								local var_194_6 = Mathf.Lerp(iter_194_1.color.b, 0.35, var_194_3)

								iter_194_1.color = Color.New(var_194_4, var_194_5, var_194_6)
							else
								local var_194_7 = Mathf.Lerp(iter_194_1.color.r, 0.5, var_194_3)

								iter_194_1.color = Color.New(var_194_7, var_194_7, var_194_7)
							end
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.actorSpriteComps10022 then
				for iter_194_2, iter_194_3 in pairs(arg_191_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_194_3 then
						if arg_191_1.isInRecall_ then
							iter_194_3.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_194_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_191_1.var_.actorSpriteComps10022 = nil
			end

			local var_194_8 = arg_191_1.actors_["10094"]
			local var_194_9 = 0

			if var_194_9 < arg_191_1.time_ and arg_191_1.time_ <= var_194_9 + arg_194_0 and arg_191_1.var_.actorSpriteComps10094 == nil then
				arg_191_1.var_.actorSpriteComps10094 = var_194_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_10 = 2

			if var_194_9 <= arg_191_1.time_ and arg_191_1.time_ < var_194_9 + var_194_10 then
				local var_194_11 = (arg_191_1.time_ - var_194_9) / var_194_10

				if arg_191_1.var_.actorSpriteComps10094 then
					for iter_194_4, iter_194_5 in pairs(arg_191_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_194_5 then
							if arg_191_1.isInRecall_ then
								local var_194_12 = Mathf.Lerp(iter_194_5.color.r, 0.82, var_194_11)
								local var_194_13 = Mathf.Lerp(iter_194_5.color.g, 0.77, var_194_11)
								local var_194_14 = Mathf.Lerp(iter_194_5.color.b, 0.62, var_194_11)

								iter_194_5.color = Color.New(var_194_12, var_194_13, var_194_14)
							else
								local var_194_15 = Mathf.Lerp(iter_194_5.color.r, 1, var_194_11)

								iter_194_5.color = Color.New(var_194_15, var_194_15, var_194_15)
							end
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_9 + var_194_10 and arg_191_1.time_ < var_194_9 + var_194_10 + arg_194_0 and arg_191_1.var_.actorSpriteComps10094 then
				for iter_194_6, iter_194_7 in pairs(arg_191_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_194_7 then
						if arg_191_1.isInRecall_ then
							iter_194_7.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_194_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_191_1.var_.actorSpriteComps10094 = nil
			end

			local var_194_16 = 0
			local var_194_17 = 0.825

			if var_194_16 < arg_191_1.time_ and arg_191_1.time_ <= var_194_16 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_18 = arg_191_1:FormatText(StoryNameCfg[259].name)

				arg_191_1.leftNameTxt_.text = var_194_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_19 = arg_191_1:GetWordFromCfg(413122047)
				local var_194_20 = arg_191_1:FormatText(var_194_19.content)

				arg_191_1.text_.text = var_194_20

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_21 = 33
				local var_194_22 = utf8.len(var_194_20)
				local var_194_23 = var_194_21 <= 0 and var_194_17 or var_194_17 * (var_194_22 / var_194_21)

				if var_194_23 > 0 and var_194_17 < var_194_23 then
					arg_191_1.talkMaxDuration = var_194_23

					if var_194_23 + var_194_16 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_23 + var_194_16
					end
				end

				arg_191_1.text_.text = var_194_20
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122047", "story_v_out_413122.awb") ~= 0 then
					local var_194_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122047", "story_v_out_413122.awb") / 1000

					if var_194_24 + var_194_16 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_24 + var_194_16
					end

					if var_194_19.prefab_name ~= "" and arg_191_1.actors_[var_194_19.prefab_name] ~= nil then
						local var_194_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_19.prefab_name].transform, "story_v_out_413122", "413122047", "story_v_out_413122.awb")

						arg_191_1:RecordAudio("413122047", var_194_25)
						arg_191_1:RecordAudio("413122047", var_194_25)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_413122", "413122047", "story_v_out_413122.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_413122", "413122047", "story_v_out_413122.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_26 = math.max(var_194_17, arg_191_1.talkMaxDuration)

			if var_194_16 <= arg_191_1.time_ and arg_191_1.time_ < var_194_16 + var_194_26 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_16) / var_194_26

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_16 + var_194_26 and arg_191_1.time_ < var_194_16 + var_194_26 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play413122048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 413122048
		arg_195_1.duration_ = 9.23

		local var_195_0 = {
			zh = 5.7,
			ja = 9.233
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
				arg_195_0:Play413122049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10022"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.actorSpriteComps10022 == nil then
				arg_195_1.var_.actorSpriteComps10022 = var_198_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_2 = 2

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.actorSpriteComps10022 then
					for iter_198_0, iter_198_1 in pairs(arg_195_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_198_1 then
							if arg_195_1.isInRecall_ then
								local var_198_4 = Mathf.Lerp(iter_198_1.color.r, 0.82, var_198_3)
								local var_198_5 = Mathf.Lerp(iter_198_1.color.g, 0.77, var_198_3)
								local var_198_6 = Mathf.Lerp(iter_198_1.color.b, 0.62, var_198_3)

								iter_198_1.color = Color.New(var_198_4, var_198_5, var_198_6)
							else
								local var_198_7 = Mathf.Lerp(iter_198_1.color.r, 1, var_198_3)

								iter_198_1.color = Color.New(var_198_7, var_198_7, var_198_7)
							end
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.actorSpriteComps10022 then
				for iter_198_2, iter_198_3 in pairs(arg_195_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_198_3 then
						if arg_195_1.isInRecall_ then
							iter_198_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_198_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_195_1.var_.actorSpriteComps10022 = nil
			end

			local var_198_8 = arg_195_1.actors_["10094"]
			local var_198_9 = 0

			if var_198_9 < arg_195_1.time_ and arg_195_1.time_ <= var_198_9 + arg_198_0 and arg_195_1.var_.actorSpriteComps10094 == nil then
				arg_195_1.var_.actorSpriteComps10094 = var_198_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_10 = 2

			if var_198_9 <= arg_195_1.time_ and arg_195_1.time_ < var_198_9 + var_198_10 then
				local var_198_11 = (arg_195_1.time_ - var_198_9) / var_198_10

				if arg_195_1.var_.actorSpriteComps10094 then
					for iter_198_4, iter_198_5 in pairs(arg_195_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_198_5 then
							if arg_195_1.isInRecall_ then
								local var_198_12 = Mathf.Lerp(iter_198_5.color.r, 0.46, var_198_11)
								local var_198_13 = Mathf.Lerp(iter_198_5.color.g, 0.43, var_198_11)
								local var_198_14 = Mathf.Lerp(iter_198_5.color.b, 0.35, var_198_11)

								iter_198_5.color = Color.New(var_198_12, var_198_13, var_198_14)
							else
								local var_198_15 = Mathf.Lerp(iter_198_5.color.r, 0.5, var_198_11)

								iter_198_5.color = Color.New(var_198_15, var_198_15, var_198_15)
							end
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_9 + var_198_10 and arg_195_1.time_ < var_198_9 + var_198_10 + arg_198_0 and arg_195_1.var_.actorSpriteComps10094 then
				for iter_198_6, iter_198_7 in pairs(arg_195_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_198_7 then
						if arg_195_1.isInRecall_ then
							iter_198_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_198_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_195_1.var_.actorSpriteComps10094 = nil
			end

			local var_198_16 = 0
			local var_198_17 = 0.75

			if var_198_16 < arg_195_1.time_ and arg_195_1.time_ <= var_198_16 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_18 = arg_195_1:FormatText(StoryNameCfg[614].name)

				arg_195_1.leftNameTxt_.text = var_198_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_19 = arg_195_1:GetWordFromCfg(413122048)
				local var_198_20 = arg_195_1:FormatText(var_198_19.content)

				arg_195_1.text_.text = var_198_20

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_21 = 30
				local var_198_22 = utf8.len(var_198_20)
				local var_198_23 = var_198_21 <= 0 and var_198_17 or var_198_17 * (var_198_22 / var_198_21)

				if var_198_23 > 0 and var_198_17 < var_198_23 then
					arg_195_1.talkMaxDuration = var_198_23

					if var_198_23 + var_198_16 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_23 + var_198_16
					end
				end

				arg_195_1.text_.text = var_198_20
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122048", "story_v_out_413122.awb") ~= 0 then
					local var_198_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122048", "story_v_out_413122.awb") / 1000

					if var_198_24 + var_198_16 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_24 + var_198_16
					end

					if var_198_19.prefab_name ~= "" and arg_195_1.actors_[var_198_19.prefab_name] ~= nil then
						local var_198_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_19.prefab_name].transform, "story_v_out_413122", "413122048", "story_v_out_413122.awb")

						arg_195_1:RecordAudio("413122048", var_198_25)
						arg_195_1:RecordAudio("413122048", var_198_25)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_413122", "413122048", "story_v_out_413122.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_413122", "413122048", "story_v_out_413122.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_26 = math.max(var_198_17, arg_195_1.talkMaxDuration)

			if var_198_16 <= arg_195_1.time_ and arg_195_1.time_ < var_198_16 + var_198_26 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_16) / var_198_26

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_16 + var_198_26 and arg_195_1.time_ < var_198_16 + var_198_26 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play413122049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 413122049
		arg_199_1.duration_ = 7.5

		local var_199_0 = {
			zh = 6.1,
			ja = 7.5
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
				arg_199_0:Play413122050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10022"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.actorSpriteComps10022 == nil then
				arg_199_1.var_.actorSpriteComps10022 = var_202_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_2 = 2

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.actorSpriteComps10022 then
					for iter_202_0, iter_202_1 in pairs(arg_199_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_202_1 then
							if arg_199_1.isInRecall_ then
								local var_202_4 = Mathf.Lerp(iter_202_1.color.r, 0.46, var_202_3)
								local var_202_5 = Mathf.Lerp(iter_202_1.color.g, 0.43, var_202_3)
								local var_202_6 = Mathf.Lerp(iter_202_1.color.b, 0.35, var_202_3)

								iter_202_1.color = Color.New(var_202_4, var_202_5, var_202_6)
							else
								local var_202_7 = Mathf.Lerp(iter_202_1.color.r, 0.5, var_202_3)

								iter_202_1.color = Color.New(var_202_7, var_202_7, var_202_7)
							end
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.actorSpriteComps10022 then
				for iter_202_2, iter_202_3 in pairs(arg_199_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_202_3 then
						if arg_199_1.isInRecall_ then
							iter_202_3.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_202_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_199_1.var_.actorSpriteComps10022 = nil
			end

			local var_202_8 = arg_199_1.actors_["10094"]
			local var_202_9 = 0

			if var_202_9 < arg_199_1.time_ and arg_199_1.time_ <= var_202_9 + arg_202_0 and arg_199_1.var_.actorSpriteComps10094 == nil then
				arg_199_1.var_.actorSpriteComps10094 = var_202_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_10 = 2

			if var_202_9 <= arg_199_1.time_ and arg_199_1.time_ < var_202_9 + var_202_10 then
				local var_202_11 = (arg_199_1.time_ - var_202_9) / var_202_10

				if arg_199_1.var_.actorSpriteComps10094 then
					for iter_202_4, iter_202_5 in pairs(arg_199_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_202_5 then
							if arg_199_1.isInRecall_ then
								local var_202_12 = Mathf.Lerp(iter_202_5.color.r, 0.82, var_202_11)
								local var_202_13 = Mathf.Lerp(iter_202_5.color.g, 0.77, var_202_11)
								local var_202_14 = Mathf.Lerp(iter_202_5.color.b, 0.62, var_202_11)

								iter_202_5.color = Color.New(var_202_12, var_202_13, var_202_14)
							else
								local var_202_15 = Mathf.Lerp(iter_202_5.color.r, 1, var_202_11)

								iter_202_5.color = Color.New(var_202_15, var_202_15, var_202_15)
							end
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_9 + var_202_10 and arg_199_1.time_ < var_202_9 + var_202_10 + arg_202_0 and arg_199_1.var_.actorSpriteComps10094 then
				for iter_202_6, iter_202_7 in pairs(arg_199_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_202_7 then
						if arg_199_1.isInRecall_ then
							iter_202_7.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_202_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_199_1.var_.actorSpriteComps10094 = nil
			end

			local var_202_16 = 0
			local var_202_17 = 0.675

			if var_202_16 < arg_199_1.time_ and arg_199_1.time_ <= var_202_16 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_18 = arg_199_1:FormatText(StoryNameCfg[259].name)

				arg_199_1.leftNameTxt_.text = var_202_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_19 = arg_199_1:GetWordFromCfg(413122049)
				local var_202_20 = arg_199_1:FormatText(var_202_19.content)

				arg_199_1.text_.text = var_202_20

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_21 = 27
				local var_202_22 = utf8.len(var_202_20)
				local var_202_23 = var_202_21 <= 0 and var_202_17 or var_202_17 * (var_202_22 / var_202_21)

				if var_202_23 > 0 and var_202_17 < var_202_23 then
					arg_199_1.talkMaxDuration = var_202_23

					if var_202_23 + var_202_16 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_23 + var_202_16
					end
				end

				arg_199_1.text_.text = var_202_20
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122049", "story_v_out_413122.awb") ~= 0 then
					local var_202_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122049", "story_v_out_413122.awb") / 1000

					if var_202_24 + var_202_16 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_24 + var_202_16
					end

					if var_202_19.prefab_name ~= "" and arg_199_1.actors_[var_202_19.prefab_name] ~= nil then
						local var_202_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_19.prefab_name].transform, "story_v_out_413122", "413122049", "story_v_out_413122.awb")

						arg_199_1:RecordAudio("413122049", var_202_25)
						arg_199_1:RecordAudio("413122049", var_202_25)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_413122", "413122049", "story_v_out_413122.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_413122", "413122049", "story_v_out_413122.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_26 = math.max(var_202_17, arg_199_1.talkMaxDuration)

			if var_202_16 <= arg_199_1.time_ and arg_199_1.time_ < var_202_16 + var_202_26 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_16) / var_202_26

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_16 + var_202_26 and arg_199_1.time_ < var_202_16 + var_202_26 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play413122050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 413122050
		arg_203_1.duration_ = 5.93

		local var_203_0 = {
			zh = 4.833,
			ja = 5.933
		}
		local var_203_1 = manager.audio:GetLocalizationFlag()

		if var_203_0[var_203_1] ~= nil then
			arg_203_1.duration_ = var_203_0[var_203_1]
		end

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play413122051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10022"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.actorSpriteComps10022 == nil then
				arg_203_1.var_.actorSpriteComps10022 = var_206_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_2 = 2

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.actorSpriteComps10022 then
					for iter_206_0, iter_206_1 in pairs(arg_203_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_206_1 then
							if arg_203_1.isInRecall_ then
								local var_206_4 = Mathf.Lerp(iter_206_1.color.r, 0.82, var_206_3)
								local var_206_5 = Mathf.Lerp(iter_206_1.color.g, 0.77, var_206_3)
								local var_206_6 = Mathf.Lerp(iter_206_1.color.b, 0.62, var_206_3)

								iter_206_1.color = Color.New(var_206_4, var_206_5, var_206_6)
							else
								local var_206_7 = Mathf.Lerp(iter_206_1.color.r, 1, var_206_3)

								iter_206_1.color = Color.New(var_206_7, var_206_7, var_206_7)
							end
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.actorSpriteComps10022 then
				for iter_206_2, iter_206_3 in pairs(arg_203_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_206_3 then
						if arg_203_1.isInRecall_ then
							iter_206_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_206_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_203_1.var_.actorSpriteComps10022 = nil
			end

			local var_206_8 = arg_203_1.actors_["10094"]
			local var_206_9 = 0

			if var_206_9 < arg_203_1.time_ and arg_203_1.time_ <= var_206_9 + arg_206_0 and arg_203_1.var_.actorSpriteComps10094 == nil then
				arg_203_1.var_.actorSpriteComps10094 = var_206_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_10 = 2

			if var_206_9 <= arg_203_1.time_ and arg_203_1.time_ < var_206_9 + var_206_10 then
				local var_206_11 = (arg_203_1.time_ - var_206_9) / var_206_10

				if arg_203_1.var_.actorSpriteComps10094 then
					for iter_206_4, iter_206_5 in pairs(arg_203_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_206_5 then
							if arg_203_1.isInRecall_ then
								local var_206_12 = Mathf.Lerp(iter_206_5.color.r, 0.46, var_206_11)
								local var_206_13 = Mathf.Lerp(iter_206_5.color.g, 0.43, var_206_11)
								local var_206_14 = Mathf.Lerp(iter_206_5.color.b, 0.35, var_206_11)

								iter_206_5.color = Color.New(var_206_12, var_206_13, var_206_14)
							else
								local var_206_15 = Mathf.Lerp(iter_206_5.color.r, 0.5, var_206_11)

								iter_206_5.color = Color.New(var_206_15, var_206_15, var_206_15)
							end
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_9 + var_206_10 and arg_203_1.time_ < var_206_9 + var_206_10 + arg_206_0 and arg_203_1.var_.actorSpriteComps10094 then
				for iter_206_6, iter_206_7 in pairs(arg_203_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_206_7 then
						if arg_203_1.isInRecall_ then
							iter_206_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_206_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_203_1.var_.actorSpriteComps10094 = nil
			end

			local var_206_16 = 0
			local var_206_17 = 0.675

			if var_206_16 < arg_203_1.time_ and arg_203_1.time_ <= var_206_16 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_18 = arg_203_1:FormatText(StoryNameCfg[614].name)

				arg_203_1.leftNameTxt_.text = var_206_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_19 = arg_203_1:GetWordFromCfg(413122050)
				local var_206_20 = arg_203_1:FormatText(var_206_19.content)

				arg_203_1.text_.text = var_206_20

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_21 = 27
				local var_206_22 = utf8.len(var_206_20)
				local var_206_23 = var_206_21 <= 0 and var_206_17 or var_206_17 * (var_206_22 / var_206_21)

				if var_206_23 > 0 and var_206_17 < var_206_23 then
					arg_203_1.talkMaxDuration = var_206_23

					if var_206_23 + var_206_16 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_23 + var_206_16
					end
				end

				arg_203_1.text_.text = var_206_20
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122050", "story_v_out_413122.awb") ~= 0 then
					local var_206_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122050", "story_v_out_413122.awb") / 1000

					if var_206_24 + var_206_16 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_24 + var_206_16
					end

					if var_206_19.prefab_name ~= "" and arg_203_1.actors_[var_206_19.prefab_name] ~= nil then
						local var_206_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_19.prefab_name].transform, "story_v_out_413122", "413122050", "story_v_out_413122.awb")

						arg_203_1:RecordAudio("413122050", var_206_25)
						arg_203_1:RecordAudio("413122050", var_206_25)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_413122", "413122050", "story_v_out_413122.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_413122", "413122050", "story_v_out_413122.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_26 = math.max(var_206_17, arg_203_1.talkMaxDuration)

			if var_206_16 <= arg_203_1.time_ and arg_203_1.time_ < var_206_16 + var_206_26 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_16) / var_206_26

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_16 + var_206_26 and arg_203_1.time_ < var_206_16 + var_206_26 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play413122051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 413122051
		arg_207_1.duration_ = 11.63

		local var_207_0 = {
			zh = 9.066,
			ja = 11.633
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
				arg_207_0:Play413122052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["10022"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.actorSpriteComps10022 == nil then
				arg_207_1.var_.actorSpriteComps10022 = var_210_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_2 = 2

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.actorSpriteComps10022 then
					for iter_210_0, iter_210_1 in pairs(arg_207_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_210_1 then
							if arg_207_1.isInRecall_ then
								local var_210_4 = Mathf.Lerp(iter_210_1.color.r, 0.46, var_210_3)
								local var_210_5 = Mathf.Lerp(iter_210_1.color.g, 0.43, var_210_3)
								local var_210_6 = Mathf.Lerp(iter_210_1.color.b, 0.35, var_210_3)

								iter_210_1.color = Color.New(var_210_4, var_210_5, var_210_6)
							else
								local var_210_7 = Mathf.Lerp(iter_210_1.color.r, 0.5, var_210_3)

								iter_210_1.color = Color.New(var_210_7, var_210_7, var_210_7)
							end
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.actorSpriteComps10022 then
				for iter_210_2, iter_210_3 in pairs(arg_207_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_210_3 then
						if arg_207_1.isInRecall_ then
							iter_210_3.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_210_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_207_1.var_.actorSpriteComps10022 = nil
			end

			local var_210_8 = arg_207_1.actors_["10094"]
			local var_210_9 = 0

			if var_210_9 < arg_207_1.time_ and arg_207_1.time_ <= var_210_9 + arg_210_0 and arg_207_1.var_.actorSpriteComps10094 == nil then
				arg_207_1.var_.actorSpriteComps10094 = var_210_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_10 = 2

			if var_210_9 <= arg_207_1.time_ and arg_207_1.time_ < var_210_9 + var_210_10 then
				local var_210_11 = (arg_207_1.time_ - var_210_9) / var_210_10

				if arg_207_1.var_.actorSpriteComps10094 then
					for iter_210_4, iter_210_5 in pairs(arg_207_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_210_5 then
							if arg_207_1.isInRecall_ then
								local var_210_12 = Mathf.Lerp(iter_210_5.color.r, 0.82, var_210_11)
								local var_210_13 = Mathf.Lerp(iter_210_5.color.g, 0.77, var_210_11)
								local var_210_14 = Mathf.Lerp(iter_210_5.color.b, 0.62, var_210_11)

								iter_210_5.color = Color.New(var_210_12, var_210_13, var_210_14)
							else
								local var_210_15 = Mathf.Lerp(iter_210_5.color.r, 1, var_210_11)

								iter_210_5.color = Color.New(var_210_15, var_210_15, var_210_15)
							end
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_9 + var_210_10 and arg_207_1.time_ < var_210_9 + var_210_10 + arg_210_0 and arg_207_1.var_.actorSpriteComps10094 then
				for iter_210_6, iter_210_7 in pairs(arg_207_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_210_7 then
						if arg_207_1.isInRecall_ then
							iter_210_7.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_210_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_207_1.var_.actorSpriteComps10094 = nil
			end

			local var_210_16 = 0
			local var_210_17 = 1

			if var_210_16 < arg_207_1.time_ and arg_207_1.time_ <= var_210_16 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_18 = arg_207_1:FormatText(StoryNameCfg[259].name)

				arg_207_1.leftNameTxt_.text = var_210_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_19 = arg_207_1:GetWordFromCfg(413122051)
				local var_210_20 = arg_207_1:FormatText(var_210_19.content)

				arg_207_1.text_.text = var_210_20

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_21 = 40
				local var_210_22 = utf8.len(var_210_20)
				local var_210_23 = var_210_21 <= 0 and var_210_17 or var_210_17 * (var_210_22 / var_210_21)

				if var_210_23 > 0 and var_210_17 < var_210_23 then
					arg_207_1.talkMaxDuration = var_210_23

					if var_210_23 + var_210_16 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_23 + var_210_16
					end
				end

				arg_207_1.text_.text = var_210_20
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122051", "story_v_out_413122.awb") ~= 0 then
					local var_210_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122051", "story_v_out_413122.awb") / 1000

					if var_210_24 + var_210_16 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_24 + var_210_16
					end

					if var_210_19.prefab_name ~= "" and arg_207_1.actors_[var_210_19.prefab_name] ~= nil then
						local var_210_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_19.prefab_name].transform, "story_v_out_413122", "413122051", "story_v_out_413122.awb")

						arg_207_1:RecordAudio("413122051", var_210_25)
						arg_207_1:RecordAudio("413122051", var_210_25)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_413122", "413122051", "story_v_out_413122.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_413122", "413122051", "story_v_out_413122.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_26 = math.max(var_210_17, arg_207_1.talkMaxDuration)

			if var_210_16 <= arg_207_1.time_ and arg_207_1.time_ < var_210_16 + var_210_26 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_16) / var_210_26

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_16 + var_210_26 and arg_207_1.time_ < var_210_16 + var_210_26 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play413122052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 413122052
		arg_211_1.duration_ = 6.07

		local var_211_0 = {
			zh = 5.833,
			ja = 6.066
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
				arg_211_0:Play413122053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10022"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.actorSpriteComps10022 == nil then
				arg_211_1.var_.actorSpriteComps10022 = var_214_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_2 = 2

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.actorSpriteComps10022 then
					for iter_214_0, iter_214_1 in pairs(arg_211_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_214_1 then
							if arg_211_1.isInRecall_ then
								local var_214_4 = Mathf.Lerp(iter_214_1.color.r, 0.82, var_214_3)
								local var_214_5 = Mathf.Lerp(iter_214_1.color.g, 0.77, var_214_3)
								local var_214_6 = Mathf.Lerp(iter_214_1.color.b, 0.62, var_214_3)

								iter_214_1.color = Color.New(var_214_4, var_214_5, var_214_6)
							else
								local var_214_7 = Mathf.Lerp(iter_214_1.color.r, 1, var_214_3)

								iter_214_1.color = Color.New(var_214_7, var_214_7, var_214_7)
							end
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.actorSpriteComps10022 then
				for iter_214_2, iter_214_3 in pairs(arg_211_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_214_3 then
						if arg_211_1.isInRecall_ then
							iter_214_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_214_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_211_1.var_.actorSpriteComps10022 = nil
			end

			local var_214_8 = arg_211_1.actors_["10094"]
			local var_214_9 = 0

			if var_214_9 < arg_211_1.time_ and arg_211_1.time_ <= var_214_9 + arg_214_0 and arg_211_1.var_.actorSpriteComps10094 == nil then
				arg_211_1.var_.actorSpriteComps10094 = var_214_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_214_10 = 2

			if var_214_9 <= arg_211_1.time_ and arg_211_1.time_ < var_214_9 + var_214_10 then
				local var_214_11 = (arg_211_1.time_ - var_214_9) / var_214_10

				if arg_211_1.var_.actorSpriteComps10094 then
					for iter_214_4, iter_214_5 in pairs(arg_211_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_214_5 then
							if arg_211_1.isInRecall_ then
								local var_214_12 = Mathf.Lerp(iter_214_5.color.r, 0.46, var_214_11)
								local var_214_13 = Mathf.Lerp(iter_214_5.color.g, 0.43, var_214_11)
								local var_214_14 = Mathf.Lerp(iter_214_5.color.b, 0.35, var_214_11)

								iter_214_5.color = Color.New(var_214_12, var_214_13, var_214_14)
							else
								local var_214_15 = Mathf.Lerp(iter_214_5.color.r, 0.5, var_214_11)

								iter_214_5.color = Color.New(var_214_15, var_214_15, var_214_15)
							end
						end
					end
				end
			end

			if arg_211_1.time_ >= var_214_9 + var_214_10 and arg_211_1.time_ < var_214_9 + var_214_10 + arg_214_0 and arg_211_1.var_.actorSpriteComps10094 then
				for iter_214_6, iter_214_7 in pairs(arg_211_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_214_7 then
						if arg_211_1.isInRecall_ then
							iter_214_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_214_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_211_1.var_.actorSpriteComps10094 = nil
			end

			local var_214_16 = 0
			local var_214_17 = 0.625

			if var_214_16 < arg_211_1.time_ and arg_211_1.time_ <= var_214_16 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_18 = arg_211_1:FormatText(StoryNameCfg[614].name)

				arg_211_1.leftNameTxt_.text = var_214_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_19 = arg_211_1:GetWordFromCfg(413122052)
				local var_214_20 = arg_211_1:FormatText(var_214_19.content)

				arg_211_1.text_.text = var_214_20

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_21 = 25
				local var_214_22 = utf8.len(var_214_20)
				local var_214_23 = var_214_21 <= 0 and var_214_17 or var_214_17 * (var_214_22 / var_214_21)

				if var_214_23 > 0 and var_214_17 < var_214_23 then
					arg_211_1.talkMaxDuration = var_214_23

					if var_214_23 + var_214_16 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_23 + var_214_16
					end
				end

				arg_211_1.text_.text = var_214_20
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122052", "story_v_out_413122.awb") ~= 0 then
					local var_214_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122052", "story_v_out_413122.awb") / 1000

					if var_214_24 + var_214_16 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_24 + var_214_16
					end

					if var_214_19.prefab_name ~= "" and arg_211_1.actors_[var_214_19.prefab_name] ~= nil then
						local var_214_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_19.prefab_name].transform, "story_v_out_413122", "413122052", "story_v_out_413122.awb")

						arg_211_1:RecordAudio("413122052", var_214_25)
						arg_211_1:RecordAudio("413122052", var_214_25)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_413122", "413122052", "story_v_out_413122.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_413122", "413122052", "story_v_out_413122.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_26 = math.max(var_214_17, arg_211_1.talkMaxDuration)

			if var_214_16 <= arg_211_1.time_ and arg_211_1.time_ < var_214_16 + var_214_26 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_16) / var_214_26

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_16 + var_214_26 and arg_211_1.time_ < var_214_16 + var_214_26 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play413122053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 413122053
		arg_215_1.duration_ = 5.47

		local var_215_0 = {
			zh = 3.7,
			ja = 5.466
		}
		local var_215_1 = manager.audio:GetLocalizationFlag()

		if var_215_0[var_215_1] ~= nil then
			arg_215_1.duration_ = var_215_0[var_215_1]
		end

		SetActive(arg_215_1.tipsGo_, false)

		function arg_215_1.onSingleLineFinish_()
			arg_215_1.onSingleLineUpdate_ = nil
			arg_215_1.onSingleLineFinish_ = nil
			arg_215_1.state_ = "waiting"
		end

		function arg_215_1.playNext_(arg_217_0)
			if arg_217_0 == 1 then
				arg_215_0:Play413122054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10022"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.actorSpriteComps10022 == nil then
				arg_215_1.var_.actorSpriteComps10022 = var_218_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_2 = 2

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.actorSpriteComps10022 then
					for iter_218_0, iter_218_1 in pairs(arg_215_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_218_1 then
							if arg_215_1.isInRecall_ then
								local var_218_4 = Mathf.Lerp(iter_218_1.color.r, 0.46, var_218_3)
								local var_218_5 = Mathf.Lerp(iter_218_1.color.g, 0.43, var_218_3)
								local var_218_6 = Mathf.Lerp(iter_218_1.color.b, 0.35, var_218_3)

								iter_218_1.color = Color.New(var_218_4, var_218_5, var_218_6)
							else
								local var_218_7 = Mathf.Lerp(iter_218_1.color.r, 0.5, var_218_3)

								iter_218_1.color = Color.New(var_218_7, var_218_7, var_218_7)
							end
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.actorSpriteComps10022 then
				for iter_218_2, iter_218_3 in pairs(arg_215_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_218_3 then
						if arg_215_1.isInRecall_ then
							iter_218_3.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_218_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_215_1.var_.actorSpriteComps10022 = nil
			end

			local var_218_8 = arg_215_1.actors_["10094"]
			local var_218_9 = 0

			if var_218_9 < arg_215_1.time_ and arg_215_1.time_ <= var_218_9 + arg_218_0 and arg_215_1.var_.actorSpriteComps10094 == nil then
				arg_215_1.var_.actorSpriteComps10094 = var_218_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_218_10 = 2

			if var_218_9 <= arg_215_1.time_ and arg_215_1.time_ < var_218_9 + var_218_10 then
				local var_218_11 = (arg_215_1.time_ - var_218_9) / var_218_10

				if arg_215_1.var_.actorSpriteComps10094 then
					for iter_218_4, iter_218_5 in pairs(arg_215_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_218_5 then
							if arg_215_1.isInRecall_ then
								local var_218_12 = Mathf.Lerp(iter_218_5.color.r, 0.82, var_218_11)
								local var_218_13 = Mathf.Lerp(iter_218_5.color.g, 0.77, var_218_11)
								local var_218_14 = Mathf.Lerp(iter_218_5.color.b, 0.62, var_218_11)

								iter_218_5.color = Color.New(var_218_12, var_218_13, var_218_14)
							else
								local var_218_15 = Mathf.Lerp(iter_218_5.color.r, 1, var_218_11)

								iter_218_5.color = Color.New(var_218_15, var_218_15, var_218_15)
							end
						end
					end
				end
			end

			if arg_215_1.time_ >= var_218_9 + var_218_10 and arg_215_1.time_ < var_218_9 + var_218_10 + arg_218_0 and arg_215_1.var_.actorSpriteComps10094 then
				for iter_218_6, iter_218_7 in pairs(arg_215_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_218_7 then
						if arg_215_1.isInRecall_ then
							iter_218_7.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_218_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_215_1.var_.actorSpriteComps10094 = nil
			end

			local var_218_16 = 0
			local var_218_17 = 0.4

			if var_218_16 < arg_215_1.time_ and arg_215_1.time_ <= var_218_16 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_18 = arg_215_1:FormatText(StoryNameCfg[259].name)

				arg_215_1.leftNameTxt_.text = var_218_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_19 = arg_215_1:GetWordFromCfg(413122053)
				local var_218_20 = arg_215_1:FormatText(var_218_19.content)

				arg_215_1.text_.text = var_218_20

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_21 = 16
				local var_218_22 = utf8.len(var_218_20)
				local var_218_23 = var_218_21 <= 0 and var_218_17 or var_218_17 * (var_218_22 / var_218_21)

				if var_218_23 > 0 and var_218_17 < var_218_23 then
					arg_215_1.talkMaxDuration = var_218_23

					if var_218_23 + var_218_16 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_23 + var_218_16
					end
				end

				arg_215_1.text_.text = var_218_20
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122053", "story_v_out_413122.awb") ~= 0 then
					local var_218_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122053", "story_v_out_413122.awb") / 1000

					if var_218_24 + var_218_16 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_24 + var_218_16
					end

					if var_218_19.prefab_name ~= "" and arg_215_1.actors_[var_218_19.prefab_name] ~= nil then
						local var_218_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_19.prefab_name].transform, "story_v_out_413122", "413122053", "story_v_out_413122.awb")

						arg_215_1:RecordAudio("413122053", var_218_25)
						arg_215_1:RecordAudio("413122053", var_218_25)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_413122", "413122053", "story_v_out_413122.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_413122", "413122053", "story_v_out_413122.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_26 = math.max(var_218_17, arg_215_1.talkMaxDuration)

			if var_218_16 <= arg_215_1.time_ and arg_215_1.time_ < var_218_16 + var_218_26 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_16) / var_218_26

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_16 + var_218_26 and arg_215_1.time_ < var_218_16 + var_218_26 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play413122054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 413122054
		arg_219_1.duration_ = 5

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play413122055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["10022"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos10022 = var_222_0.localPosition
				var_222_0.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("10022", 7)

				local var_222_2 = var_222_0.childCount

				for iter_222_0 = 0, var_222_2 - 1 do
					local var_222_3 = var_222_0:GetChild(iter_222_0)

					if var_222_3.name == "split_4" or not string.find(var_222_3.name, "split") then
						var_222_3.gameObject:SetActive(true)
					else
						var_222_3.gameObject:SetActive(false)
					end
				end
			end

			local var_222_4 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_4 then
				local var_222_5 = (arg_219_1.time_ - var_222_1) / var_222_4
				local var_222_6 = Vector3.New(0, -2000, 0)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10022, var_222_6, var_222_5)
			end

			if arg_219_1.time_ >= var_222_1 + var_222_4 and arg_219_1.time_ < var_222_1 + var_222_4 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_222_7 = arg_219_1.actors_["10094"].transform
			local var_222_8 = 0

			if var_222_8 < arg_219_1.time_ and arg_219_1.time_ <= var_222_8 + arg_222_0 then
				arg_219_1.var_.moveOldPos10094 = var_222_7.localPosition
				var_222_7.localScale = Vector3.New(1, 1, 1)

				arg_219_1:CheckSpriteTmpPos("10094", 7)

				local var_222_9 = var_222_7.childCount

				for iter_222_1 = 0, var_222_9 - 1 do
					local var_222_10 = var_222_7:GetChild(iter_222_1)

					if var_222_10.name == "" or not string.find(var_222_10.name, "split") then
						var_222_10.gameObject:SetActive(true)
					else
						var_222_10.gameObject:SetActive(false)
					end
				end
			end

			local var_222_11 = 0.001

			if var_222_8 <= arg_219_1.time_ and arg_219_1.time_ < var_222_8 + var_222_11 then
				local var_222_12 = (arg_219_1.time_ - var_222_8) / var_222_11
				local var_222_13 = Vector3.New(0, -2000, 0)

				var_222_7.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos10094, var_222_13, var_222_12)
			end

			if arg_219_1.time_ >= var_222_8 + var_222_11 and arg_219_1.time_ < var_222_8 + var_222_11 + arg_222_0 then
				var_222_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_222_14 = 0
			local var_222_15 = 1.4

			if var_222_14 < arg_219_1.time_ and arg_219_1.time_ <= var_222_14 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, false)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_16 = arg_219_1:GetWordFromCfg(413122054)
				local var_222_17 = arg_219_1:FormatText(var_222_16.content)

				arg_219_1.text_.text = var_222_17

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_18 = 56
				local var_222_19 = utf8.len(var_222_17)
				local var_222_20 = var_222_18 <= 0 and var_222_15 or var_222_15 * (var_222_19 / var_222_18)

				if var_222_20 > 0 and var_222_15 < var_222_20 then
					arg_219_1.talkMaxDuration = var_222_20

					if var_222_20 + var_222_14 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_14
					end
				end

				arg_219_1.text_.text = var_222_17
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)
				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_21 = math.max(var_222_15, arg_219_1.talkMaxDuration)

			if var_222_14 <= arg_219_1.time_ and arg_219_1.time_ < var_222_14 + var_222_21 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_14) / var_222_21

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_14 + var_222_21 and arg_219_1.time_ < var_222_14 + var_222_21 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play413122055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 413122055
		arg_223_1.duration_ = 6.7

		local var_223_0 = {
			zh = 6.7,
			ja = 5.366
		}
		local var_223_1 = manager.audio:GetLocalizationFlag()

		if var_223_0[var_223_1] ~= nil then
			arg_223_1.duration_ = var_223_0[var_223_1]
		end

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play413122056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10022"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos10022 = var_226_0.localPosition
				var_226_0.localScale = Vector3.New(1, 1, 1)

				arg_223_1:CheckSpriteTmpPos("10022", 3)

				local var_226_2 = var_226_0.childCount

				for iter_226_0 = 0, var_226_2 - 1 do
					local var_226_3 = var_226_0:GetChild(iter_226_0)

					if var_226_3.name == "" or not string.find(var_226_3.name, "split") then
						var_226_3.gameObject:SetActive(true)
					else
						var_226_3.gameObject:SetActive(false)
					end
				end
			end

			local var_226_4 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_4 then
				local var_226_5 = (arg_223_1.time_ - var_226_1) / var_226_4
				local var_226_6 = Vector3.New(0, -315, -320)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10022, var_226_6, var_226_5)
			end

			if arg_223_1.time_ >= var_226_1 + var_226_4 and arg_223_1.time_ < var_226_1 + var_226_4 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0, -315, -320)
			end

			local var_226_7 = arg_223_1.actors_["10022"]
			local var_226_8 = 0

			if var_226_8 < arg_223_1.time_ and arg_223_1.time_ <= var_226_8 + arg_226_0 and arg_223_1.var_.actorSpriteComps10022 == nil then
				arg_223_1.var_.actorSpriteComps10022 = var_226_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_226_9 = 2

			if var_226_8 <= arg_223_1.time_ and arg_223_1.time_ < var_226_8 + var_226_9 then
				local var_226_10 = (arg_223_1.time_ - var_226_8) / var_226_9

				if arg_223_1.var_.actorSpriteComps10022 then
					for iter_226_1, iter_226_2 in pairs(arg_223_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_226_2 then
							if arg_223_1.isInRecall_ then
								local var_226_11 = Mathf.Lerp(iter_226_2.color.r, 0.82, var_226_10)
								local var_226_12 = Mathf.Lerp(iter_226_2.color.g, 0.77, var_226_10)
								local var_226_13 = Mathf.Lerp(iter_226_2.color.b, 0.62, var_226_10)

								iter_226_2.color = Color.New(var_226_11, var_226_12, var_226_13)
							else
								local var_226_14 = Mathf.Lerp(iter_226_2.color.r, 1, var_226_10)

								iter_226_2.color = Color.New(var_226_14, var_226_14, var_226_14)
							end
						end
					end
				end
			end

			if arg_223_1.time_ >= var_226_8 + var_226_9 and arg_223_1.time_ < var_226_8 + var_226_9 + arg_226_0 and arg_223_1.var_.actorSpriteComps10022 then
				for iter_226_3, iter_226_4 in pairs(arg_223_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_226_4 then
						if arg_223_1.isInRecall_ then
							iter_226_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_226_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_223_1.var_.actorSpriteComps10022 = nil
			end

			local var_226_15 = 0
			local var_226_16 = 0.8

			if var_226_15 < arg_223_1.time_ and arg_223_1.time_ <= var_226_15 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_17 = arg_223_1:FormatText(StoryNameCfg[614].name)

				arg_223_1.leftNameTxt_.text = var_226_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_18 = arg_223_1:GetWordFromCfg(413122055)
				local var_226_19 = arg_223_1:FormatText(var_226_18.content)

				arg_223_1.text_.text = var_226_19

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_20 = 32
				local var_226_21 = utf8.len(var_226_19)
				local var_226_22 = var_226_20 <= 0 and var_226_16 or var_226_16 * (var_226_21 / var_226_20)

				if var_226_22 > 0 and var_226_16 < var_226_22 then
					arg_223_1.talkMaxDuration = var_226_22

					if var_226_22 + var_226_15 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_22 + var_226_15
					end
				end

				arg_223_1.text_.text = var_226_19
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122055", "story_v_out_413122.awb") ~= 0 then
					local var_226_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122055", "story_v_out_413122.awb") / 1000

					if var_226_23 + var_226_15 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_23 + var_226_15
					end

					if var_226_18.prefab_name ~= "" and arg_223_1.actors_[var_226_18.prefab_name] ~= nil then
						local var_226_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_18.prefab_name].transform, "story_v_out_413122", "413122055", "story_v_out_413122.awb")

						arg_223_1:RecordAudio("413122055", var_226_24)
						arg_223_1:RecordAudio("413122055", var_226_24)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_413122", "413122055", "story_v_out_413122.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_413122", "413122055", "story_v_out_413122.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_25 = math.max(var_226_16, arg_223_1.talkMaxDuration)

			if var_226_15 <= arg_223_1.time_ and arg_223_1.time_ < var_226_15 + var_226_25 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_15) / var_226_25

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_15 + var_226_25 and arg_223_1.time_ < var_226_15 + var_226_25 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play413122056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 413122056
		arg_227_1.duration_ = 10.67

		local var_227_0 = {
			zh = 6.8,
			ja = 10.666
		}
		local var_227_1 = manager.audio:GetLocalizationFlag()

		if var_227_0[var_227_1] ~= nil then
			arg_227_1.duration_ = var_227_0[var_227_1]
		end

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play413122057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 0.875

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_2 = arg_227_1:FormatText(StoryNameCfg[614].name)

				arg_227_1.leftNameTxt_.text = var_230_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_3 = arg_227_1:GetWordFromCfg(413122056)
				local var_230_4 = arg_227_1:FormatText(var_230_3.content)

				arg_227_1.text_.text = var_230_4

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_5 = 35
				local var_230_6 = utf8.len(var_230_4)
				local var_230_7 = var_230_5 <= 0 and var_230_1 or var_230_1 * (var_230_6 / var_230_5)

				if var_230_7 > 0 and var_230_1 < var_230_7 then
					arg_227_1.talkMaxDuration = var_230_7

					if var_230_7 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_7 + var_230_0
					end
				end

				arg_227_1.text_.text = var_230_4
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122056", "story_v_out_413122.awb") ~= 0 then
					local var_230_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122056", "story_v_out_413122.awb") / 1000

					if var_230_8 + var_230_0 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_8 + var_230_0
					end

					if var_230_3.prefab_name ~= "" and arg_227_1.actors_[var_230_3.prefab_name] ~= nil then
						local var_230_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_3.prefab_name].transform, "story_v_out_413122", "413122056", "story_v_out_413122.awb")

						arg_227_1:RecordAudio("413122056", var_230_9)
						arg_227_1:RecordAudio("413122056", var_230_9)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_413122", "413122056", "story_v_out_413122.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_413122", "413122056", "story_v_out_413122.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_10 = math.max(var_230_1, arg_227_1.talkMaxDuration)

			if var_230_0 <= arg_227_1.time_ and arg_227_1.time_ < var_230_0 + var_230_10 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_0) / var_230_10

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_0 + var_230_10 and arg_227_1.time_ < var_230_0 + var_230_10 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play413122057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 413122057
		arg_231_1.duration_ = 8.47

		local var_231_0 = {
			zh = 6.766,
			ja = 8.466
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
				arg_231_0:Play413122058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["10022"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.actorSpriteComps10022 == nil then
				arg_231_1.var_.actorSpriteComps10022 = var_234_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_234_2 = 2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.actorSpriteComps10022 then
					for iter_234_0, iter_234_1 in pairs(arg_231_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_234_1 then
							if arg_231_1.isInRecall_ then
								local var_234_4 = Mathf.Lerp(iter_234_1.color.r, 0.82, var_234_3)
								local var_234_5 = Mathf.Lerp(iter_234_1.color.g, 0.77, var_234_3)
								local var_234_6 = Mathf.Lerp(iter_234_1.color.b, 0.62, var_234_3)

								iter_234_1.color = Color.New(var_234_4, var_234_5, var_234_6)
							else
								local var_234_7 = Mathf.Lerp(iter_234_1.color.r, 1, var_234_3)

								iter_234_1.color = Color.New(var_234_7, var_234_7, var_234_7)
							end
						end
					end
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.actorSpriteComps10022 then
				for iter_234_2, iter_234_3 in pairs(arg_231_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_234_3 then
						if arg_231_1.isInRecall_ then
							iter_234_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_234_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_231_1.var_.actorSpriteComps10022 = nil
			end

			local var_234_8 = arg_231_1.actors_["10022"].transform
			local var_234_9 = 0

			if var_234_9 < arg_231_1.time_ and arg_231_1.time_ <= var_234_9 + arg_234_0 then
				arg_231_1.var_.moveOldPos10022 = var_234_8.localPosition
				var_234_8.localScale = Vector3.New(1, 1, 1)

				arg_231_1:CheckSpriteTmpPos("10022", 3)

				local var_234_10 = var_234_8.childCount

				for iter_234_4 = 0, var_234_10 - 1 do
					local var_234_11 = var_234_8:GetChild(iter_234_4)

					if var_234_11.name == "split_3" or not string.find(var_234_11.name, "split") then
						var_234_11.gameObject:SetActive(true)
					else
						var_234_11.gameObject:SetActive(false)
					end
				end
			end

			local var_234_12 = 0.001

			if var_234_9 <= arg_231_1.time_ and arg_231_1.time_ < var_234_9 + var_234_12 then
				local var_234_13 = (arg_231_1.time_ - var_234_9) / var_234_12
				local var_234_14 = Vector3.New(0, -315, -320)

				var_234_8.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos10022, var_234_14, var_234_13)
			end

			if arg_231_1.time_ >= var_234_9 + var_234_12 and arg_231_1.time_ < var_234_9 + var_234_12 + arg_234_0 then
				var_234_8.localPosition = Vector3.New(0, -315, -320)
			end

			local var_234_15 = 0
			local var_234_16 = 0.725

			if var_234_15 < arg_231_1.time_ and arg_231_1.time_ <= var_234_15 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_17 = arg_231_1:FormatText(StoryNameCfg[614].name)

				arg_231_1.leftNameTxt_.text = var_234_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_18 = arg_231_1:GetWordFromCfg(413122057)
				local var_234_19 = arg_231_1:FormatText(var_234_18.content)

				arg_231_1.text_.text = var_234_19

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_20 = 29
				local var_234_21 = utf8.len(var_234_19)
				local var_234_22 = var_234_20 <= 0 and var_234_16 or var_234_16 * (var_234_21 / var_234_20)

				if var_234_22 > 0 and var_234_16 < var_234_22 then
					arg_231_1.talkMaxDuration = var_234_22

					if var_234_22 + var_234_15 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_22 + var_234_15
					end
				end

				arg_231_1.text_.text = var_234_19
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122057", "story_v_out_413122.awb") ~= 0 then
					local var_234_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122057", "story_v_out_413122.awb") / 1000

					if var_234_23 + var_234_15 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_23 + var_234_15
					end

					if var_234_18.prefab_name ~= "" and arg_231_1.actors_[var_234_18.prefab_name] ~= nil then
						local var_234_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_18.prefab_name].transform, "story_v_out_413122", "413122057", "story_v_out_413122.awb")

						arg_231_1:RecordAudio("413122057", var_234_24)
						arg_231_1:RecordAudio("413122057", var_234_24)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_413122", "413122057", "story_v_out_413122.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_413122", "413122057", "story_v_out_413122.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_25 = math.max(var_234_16, arg_231_1.talkMaxDuration)

			if var_234_15 <= arg_231_1.time_ and arg_231_1.time_ < var_234_15 + var_234_25 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_15) / var_234_25

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_15 + var_234_25 and arg_231_1.time_ < var_234_15 + var_234_25 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play413122058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 413122058
		arg_235_1.duration_ = 9.63

		local var_235_0 = {
			zh = 8.166,
			ja = 9.633
		}
		local var_235_1 = manager.audio:GetLocalizationFlag()

		if var_235_0[var_235_1] ~= nil then
			arg_235_1.duration_ = var_235_0[var_235_1]
		end

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play413122059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["10022"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos10022 = var_238_0.localPosition
				var_238_0.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("10022", 2)

				local var_238_2 = var_238_0.childCount

				for iter_238_0 = 0, var_238_2 - 1 do
					local var_238_3 = var_238_0:GetChild(iter_238_0)

					if var_238_3.name == "split_3" or not string.find(var_238_3.name, "split") then
						var_238_3.gameObject:SetActive(true)
					else
						var_238_3.gameObject:SetActive(false)
					end
				end
			end

			local var_238_4 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_4 then
				local var_238_5 = (arg_235_1.time_ - var_238_1) / var_238_4
				local var_238_6 = Vector3.New(-390, -315, -320)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10022, var_238_6, var_238_5)
			end

			if arg_235_1.time_ >= var_238_1 + var_238_4 and arg_235_1.time_ < var_238_1 + var_238_4 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_238_7 = arg_235_1.actors_["10094"].transform
			local var_238_8 = 0

			if var_238_8 < arg_235_1.time_ and arg_235_1.time_ <= var_238_8 + arg_238_0 then
				arg_235_1.var_.moveOldPos10094 = var_238_7.localPosition
				var_238_7.localScale = Vector3.New(1, 1, 1)

				arg_235_1:CheckSpriteTmpPos("10094", 4)

				local var_238_9 = var_238_7.childCount

				for iter_238_1 = 0, var_238_9 - 1 do
					local var_238_10 = var_238_7:GetChild(iter_238_1)

					if var_238_10.name == "" or not string.find(var_238_10.name, "split") then
						var_238_10.gameObject:SetActive(true)
					else
						var_238_10.gameObject:SetActive(false)
					end
				end
			end

			local var_238_11 = 0.001

			if var_238_8 <= arg_235_1.time_ and arg_235_1.time_ < var_238_8 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_8) / var_238_11
				local var_238_13 = Vector3.New(390, -340, -414)

				var_238_7.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos10094, var_238_13, var_238_12)
			end

			if arg_235_1.time_ >= var_238_8 + var_238_11 and arg_235_1.time_ < var_238_8 + var_238_11 + arg_238_0 then
				var_238_7.localPosition = Vector3.New(390, -340, -414)
			end

			local var_238_14 = arg_235_1.actors_["10022"]
			local var_238_15 = 0

			if var_238_15 < arg_235_1.time_ and arg_235_1.time_ <= var_238_15 + arg_238_0 and arg_235_1.var_.actorSpriteComps10022 == nil then
				arg_235_1.var_.actorSpriteComps10022 = var_238_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_16 = 2

			if var_238_15 <= arg_235_1.time_ and arg_235_1.time_ < var_238_15 + var_238_16 then
				local var_238_17 = (arg_235_1.time_ - var_238_15) / var_238_16

				if arg_235_1.var_.actorSpriteComps10022 then
					for iter_238_2, iter_238_3 in pairs(arg_235_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_238_3 then
							if arg_235_1.isInRecall_ then
								local var_238_18 = Mathf.Lerp(iter_238_3.color.r, 0.46, var_238_17)
								local var_238_19 = Mathf.Lerp(iter_238_3.color.g, 0.43, var_238_17)
								local var_238_20 = Mathf.Lerp(iter_238_3.color.b, 0.35, var_238_17)

								iter_238_3.color = Color.New(var_238_18, var_238_19, var_238_20)
							else
								local var_238_21 = Mathf.Lerp(iter_238_3.color.r, 0.5, var_238_17)

								iter_238_3.color = Color.New(var_238_21, var_238_21, var_238_21)
							end
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_15 + var_238_16 and arg_235_1.time_ < var_238_15 + var_238_16 + arg_238_0 and arg_235_1.var_.actorSpriteComps10022 then
				for iter_238_4, iter_238_5 in pairs(arg_235_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_238_5 then
						if arg_235_1.isInRecall_ then
							iter_238_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_238_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_235_1.var_.actorSpriteComps10022 = nil
			end

			local var_238_22 = arg_235_1.actors_["10094"]
			local var_238_23 = 0

			if var_238_23 < arg_235_1.time_ and arg_235_1.time_ <= var_238_23 + arg_238_0 and arg_235_1.var_.actorSpriteComps10094 == nil then
				arg_235_1.var_.actorSpriteComps10094 = var_238_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_238_24 = 2

			if var_238_23 <= arg_235_1.time_ and arg_235_1.time_ < var_238_23 + var_238_24 then
				local var_238_25 = (arg_235_1.time_ - var_238_23) / var_238_24

				if arg_235_1.var_.actorSpriteComps10094 then
					for iter_238_6, iter_238_7 in pairs(arg_235_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_238_7 then
							if arg_235_1.isInRecall_ then
								local var_238_26 = Mathf.Lerp(iter_238_7.color.r, 0.82, var_238_25)
								local var_238_27 = Mathf.Lerp(iter_238_7.color.g, 0.77, var_238_25)
								local var_238_28 = Mathf.Lerp(iter_238_7.color.b, 0.62, var_238_25)

								iter_238_7.color = Color.New(var_238_26, var_238_27, var_238_28)
							else
								local var_238_29 = Mathf.Lerp(iter_238_7.color.r, 1, var_238_25)

								iter_238_7.color = Color.New(var_238_29, var_238_29, var_238_29)
							end
						end
					end
				end
			end

			if arg_235_1.time_ >= var_238_23 + var_238_24 and arg_235_1.time_ < var_238_23 + var_238_24 + arg_238_0 and arg_235_1.var_.actorSpriteComps10094 then
				for iter_238_8, iter_238_9 in pairs(arg_235_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_238_9 then
						if arg_235_1.isInRecall_ then
							iter_238_9.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_238_9.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_235_1.var_.actorSpriteComps10094 = nil
			end

			local var_238_30 = 0
			local var_238_31 = 1.025

			if var_238_30 < arg_235_1.time_ and arg_235_1.time_ <= var_238_30 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_32 = arg_235_1:FormatText(StoryNameCfg[259].name)

				arg_235_1.leftNameTxt_.text = var_238_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_33 = arg_235_1:GetWordFromCfg(413122058)
				local var_238_34 = arg_235_1:FormatText(var_238_33.content)

				arg_235_1.text_.text = var_238_34

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_35 = 41
				local var_238_36 = utf8.len(var_238_34)
				local var_238_37 = var_238_35 <= 0 and var_238_31 or var_238_31 * (var_238_36 / var_238_35)

				if var_238_37 > 0 and var_238_31 < var_238_37 then
					arg_235_1.talkMaxDuration = var_238_37

					if var_238_37 + var_238_30 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_37 + var_238_30
					end
				end

				arg_235_1.text_.text = var_238_34
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122058", "story_v_out_413122.awb") ~= 0 then
					local var_238_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122058", "story_v_out_413122.awb") / 1000

					if var_238_38 + var_238_30 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_38 + var_238_30
					end

					if var_238_33.prefab_name ~= "" and arg_235_1.actors_[var_238_33.prefab_name] ~= nil then
						local var_238_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_33.prefab_name].transform, "story_v_out_413122", "413122058", "story_v_out_413122.awb")

						arg_235_1:RecordAudio("413122058", var_238_39)
						arg_235_1:RecordAudio("413122058", var_238_39)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_413122", "413122058", "story_v_out_413122.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_413122", "413122058", "story_v_out_413122.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_40 = math.max(var_238_31, arg_235_1.talkMaxDuration)

			if var_238_30 <= arg_235_1.time_ and arg_235_1.time_ < var_238_30 + var_238_40 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_30) / var_238_40

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_30 + var_238_40 and arg_235_1.time_ < var_238_30 + var_238_40 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play413122059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 413122059
		arg_239_1.duration_ = 7.23

		local var_239_0 = {
			zh = 4.166,
			ja = 7.233
		}
		local var_239_1 = manager.audio:GetLocalizationFlag()

		if var_239_0[var_239_1] ~= nil then
			arg_239_1.duration_ = var_239_0[var_239_1]
		end

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play413122060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["10022"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.actorSpriteComps10022 == nil then
				arg_239_1.var_.actorSpriteComps10022 = var_242_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_2 = 2

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.actorSpriteComps10022 then
					for iter_242_0, iter_242_1 in pairs(arg_239_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_242_1 then
							if arg_239_1.isInRecall_ then
								local var_242_4 = Mathf.Lerp(iter_242_1.color.r, 0.82, var_242_3)
								local var_242_5 = Mathf.Lerp(iter_242_1.color.g, 0.77, var_242_3)
								local var_242_6 = Mathf.Lerp(iter_242_1.color.b, 0.62, var_242_3)

								iter_242_1.color = Color.New(var_242_4, var_242_5, var_242_6)
							else
								local var_242_7 = Mathf.Lerp(iter_242_1.color.r, 1, var_242_3)

								iter_242_1.color = Color.New(var_242_7, var_242_7, var_242_7)
							end
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.actorSpriteComps10022 then
				for iter_242_2, iter_242_3 in pairs(arg_239_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_242_3 then
						if arg_239_1.isInRecall_ then
							iter_242_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_242_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_239_1.var_.actorSpriteComps10022 = nil
			end

			local var_242_8 = arg_239_1.actors_["10094"]
			local var_242_9 = 0

			if var_242_9 < arg_239_1.time_ and arg_239_1.time_ <= var_242_9 + arg_242_0 and arg_239_1.var_.actorSpriteComps10094 == nil then
				arg_239_1.var_.actorSpriteComps10094 = var_242_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_242_10 = 2

			if var_242_9 <= arg_239_1.time_ and arg_239_1.time_ < var_242_9 + var_242_10 then
				local var_242_11 = (arg_239_1.time_ - var_242_9) / var_242_10

				if arg_239_1.var_.actorSpriteComps10094 then
					for iter_242_4, iter_242_5 in pairs(arg_239_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_242_5 then
							if arg_239_1.isInRecall_ then
								local var_242_12 = Mathf.Lerp(iter_242_5.color.r, 0.46, var_242_11)
								local var_242_13 = Mathf.Lerp(iter_242_5.color.g, 0.43, var_242_11)
								local var_242_14 = Mathf.Lerp(iter_242_5.color.b, 0.35, var_242_11)

								iter_242_5.color = Color.New(var_242_12, var_242_13, var_242_14)
							else
								local var_242_15 = Mathf.Lerp(iter_242_5.color.r, 0.5, var_242_11)

								iter_242_5.color = Color.New(var_242_15, var_242_15, var_242_15)
							end
						end
					end
				end
			end

			if arg_239_1.time_ >= var_242_9 + var_242_10 and arg_239_1.time_ < var_242_9 + var_242_10 + arg_242_0 and arg_239_1.var_.actorSpriteComps10094 then
				for iter_242_6, iter_242_7 in pairs(arg_239_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_242_7 then
						if arg_239_1.isInRecall_ then
							iter_242_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_242_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_239_1.var_.actorSpriteComps10094 = nil
			end

			local var_242_16 = 0
			local var_242_17 = 0.525

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_18 = arg_239_1:FormatText(StoryNameCfg[614].name)

				arg_239_1.leftNameTxt_.text = var_242_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_19 = arg_239_1:GetWordFromCfg(413122059)
				local var_242_20 = arg_239_1:FormatText(var_242_19.content)

				arg_239_1.text_.text = var_242_20

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_21 = 21
				local var_242_22 = utf8.len(var_242_20)
				local var_242_23 = var_242_21 <= 0 and var_242_17 or var_242_17 * (var_242_22 / var_242_21)

				if var_242_23 > 0 and var_242_17 < var_242_23 then
					arg_239_1.talkMaxDuration = var_242_23

					if var_242_23 + var_242_16 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_23 + var_242_16
					end
				end

				arg_239_1.text_.text = var_242_20
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122059", "story_v_out_413122.awb") ~= 0 then
					local var_242_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122059", "story_v_out_413122.awb") / 1000

					if var_242_24 + var_242_16 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_24 + var_242_16
					end

					if var_242_19.prefab_name ~= "" and arg_239_1.actors_[var_242_19.prefab_name] ~= nil then
						local var_242_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_19.prefab_name].transform, "story_v_out_413122", "413122059", "story_v_out_413122.awb")

						arg_239_1:RecordAudio("413122059", var_242_25)
						arg_239_1:RecordAudio("413122059", var_242_25)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_413122", "413122059", "story_v_out_413122.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_413122", "413122059", "story_v_out_413122.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_26 = math.max(var_242_17, arg_239_1.talkMaxDuration)

			if var_242_16 <= arg_239_1.time_ and arg_239_1.time_ < var_242_16 + var_242_26 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_16) / var_242_26

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_16 + var_242_26 and arg_239_1.time_ < var_242_16 + var_242_26 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play413122060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 413122060
		arg_243_1.duration_ = 11.67

		local var_243_0 = {
			zh = 7.733,
			ja = 11.666
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
				arg_243_0:Play413122061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.975

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[614].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(413122060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 39
				local var_246_6 = utf8.len(var_246_4)
				local var_246_7 = var_246_5 <= 0 and var_246_1 or var_246_1 * (var_246_6 / var_246_5)

				if var_246_7 > 0 and var_246_1 < var_246_7 then
					arg_243_1.talkMaxDuration = var_246_7

					if var_246_7 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_7 + var_246_0
					end
				end

				arg_243_1.text_.text = var_246_4
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122060", "story_v_out_413122.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122060", "story_v_out_413122.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_413122", "413122060", "story_v_out_413122.awb")

						arg_243_1:RecordAudio("413122060", var_246_9)
						arg_243_1:RecordAudio("413122060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_413122", "413122060", "story_v_out_413122.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_413122", "413122060", "story_v_out_413122.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_10 = math.max(var_246_1, arg_243_1.talkMaxDuration)

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_10 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_0) / var_246_10

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_0 + var_246_10 and arg_243_1.time_ < var_246_0 + var_246_10 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play413122061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 413122061
		arg_247_1.duration_ = 6.03

		local var_247_0 = {
			zh = 6.033,
			ja = 5.9
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
				arg_247_0:Play413122062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["10022"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.actorSpriteComps10022 == nil then
				arg_247_1.var_.actorSpriteComps10022 = var_250_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_250_2 = 2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.actorSpriteComps10022 then
					for iter_250_0, iter_250_1 in pairs(arg_247_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_250_1 then
							if arg_247_1.isInRecall_ then
								local var_250_4 = Mathf.Lerp(iter_250_1.color.r, 0.82, var_250_3)
								local var_250_5 = Mathf.Lerp(iter_250_1.color.g, 0.77, var_250_3)
								local var_250_6 = Mathf.Lerp(iter_250_1.color.b, 0.62, var_250_3)

								iter_250_1.color = Color.New(var_250_4, var_250_5, var_250_6)
							else
								local var_250_7 = Mathf.Lerp(iter_250_1.color.r, 1, var_250_3)

								iter_250_1.color = Color.New(var_250_7, var_250_7, var_250_7)
							end
						end
					end
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.actorSpriteComps10022 then
				for iter_250_2, iter_250_3 in pairs(arg_247_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_250_3 then
						if arg_247_1.isInRecall_ then
							iter_250_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_250_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_247_1.var_.actorSpriteComps10022 = nil
			end

			local var_250_8 = 0
			local var_250_9 = 0.675

			if var_250_8 < arg_247_1.time_ and arg_247_1.time_ <= var_250_8 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_10 = arg_247_1:FormatText(StoryNameCfg[614].name)

				arg_247_1.leftNameTxt_.text = var_250_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_11 = arg_247_1:GetWordFromCfg(413122061)
				local var_250_12 = arg_247_1:FormatText(var_250_11.content)

				arg_247_1.text_.text = var_250_12

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_13 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122061", "story_v_out_413122.awb") ~= 0 then
					local var_250_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122061", "story_v_out_413122.awb") / 1000

					if var_250_16 + var_250_8 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_16 + var_250_8
					end

					if var_250_11.prefab_name ~= "" and arg_247_1.actors_[var_250_11.prefab_name] ~= nil then
						local var_250_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_11.prefab_name].transform, "story_v_out_413122", "413122061", "story_v_out_413122.awb")

						arg_247_1:RecordAudio("413122061", var_250_17)
						arg_247_1:RecordAudio("413122061", var_250_17)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_413122", "413122061", "story_v_out_413122.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_413122", "413122061", "story_v_out_413122.awb")
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
	Play413122062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 413122062
		arg_251_1.duration_ = 10.03

		local var_251_0 = {
			zh = 6.166,
			ja = 10.033
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
				arg_251_0:Play413122063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["10022"]
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 and arg_251_1.var_.actorSpriteComps10022 == nil then
				arg_251_1.var_.actorSpriteComps10022 = var_254_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_2 = 2

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2

				if arg_251_1.var_.actorSpriteComps10022 then
					for iter_254_0, iter_254_1 in pairs(arg_251_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_254_1 then
							if arg_251_1.isInRecall_ then
								local var_254_4 = Mathf.Lerp(iter_254_1.color.r, 0.46, var_254_3)
								local var_254_5 = Mathf.Lerp(iter_254_1.color.g, 0.43, var_254_3)
								local var_254_6 = Mathf.Lerp(iter_254_1.color.b, 0.35, var_254_3)

								iter_254_1.color = Color.New(var_254_4, var_254_5, var_254_6)
							else
								local var_254_7 = Mathf.Lerp(iter_254_1.color.r, 0.5, var_254_3)

								iter_254_1.color = Color.New(var_254_7, var_254_7, var_254_7)
							end
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 and arg_251_1.var_.actorSpriteComps10022 then
				for iter_254_2, iter_254_3 in pairs(arg_251_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_254_3 then
						if arg_251_1.isInRecall_ then
							iter_254_3.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_254_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_251_1.var_.actorSpriteComps10022 = nil
			end

			local var_254_8 = arg_251_1.actors_["10094"]
			local var_254_9 = 0

			if var_254_9 < arg_251_1.time_ and arg_251_1.time_ <= var_254_9 + arg_254_0 and arg_251_1.var_.actorSpriteComps10094 == nil then
				arg_251_1.var_.actorSpriteComps10094 = var_254_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_254_10 = 2

			if var_254_9 <= arg_251_1.time_ and arg_251_1.time_ < var_254_9 + var_254_10 then
				local var_254_11 = (arg_251_1.time_ - var_254_9) / var_254_10

				if arg_251_1.var_.actorSpriteComps10094 then
					for iter_254_4, iter_254_5 in pairs(arg_251_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_254_5 then
							if arg_251_1.isInRecall_ then
								local var_254_12 = Mathf.Lerp(iter_254_5.color.r, 0.82, var_254_11)
								local var_254_13 = Mathf.Lerp(iter_254_5.color.g, 0.77, var_254_11)
								local var_254_14 = Mathf.Lerp(iter_254_5.color.b, 0.62, var_254_11)

								iter_254_5.color = Color.New(var_254_12, var_254_13, var_254_14)
							else
								local var_254_15 = Mathf.Lerp(iter_254_5.color.r, 1, var_254_11)

								iter_254_5.color = Color.New(var_254_15, var_254_15, var_254_15)
							end
						end
					end
				end
			end

			if arg_251_1.time_ >= var_254_9 + var_254_10 and arg_251_1.time_ < var_254_9 + var_254_10 + arg_254_0 and arg_251_1.var_.actorSpriteComps10094 then
				for iter_254_6, iter_254_7 in pairs(arg_251_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_254_7 then
						if arg_251_1.isInRecall_ then
							iter_254_7.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_254_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_251_1.var_.actorSpriteComps10094 = nil
			end

			local var_254_16 = 0
			local var_254_17 = 0.65

			if var_254_16 < arg_251_1.time_ and arg_251_1.time_ <= var_254_16 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_18 = arg_251_1:FormatText(StoryNameCfg[259].name)

				arg_251_1.leftNameTxt_.text = var_254_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_19 = arg_251_1:GetWordFromCfg(413122062)
				local var_254_20 = arg_251_1:FormatText(var_254_19.content)

				arg_251_1.text_.text = var_254_20

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_21 = 26
				local var_254_22 = utf8.len(var_254_20)
				local var_254_23 = var_254_21 <= 0 and var_254_17 or var_254_17 * (var_254_22 / var_254_21)

				if var_254_23 > 0 and var_254_17 < var_254_23 then
					arg_251_1.talkMaxDuration = var_254_23

					if var_254_23 + var_254_16 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_23 + var_254_16
					end
				end

				arg_251_1.text_.text = var_254_20
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122062", "story_v_out_413122.awb") ~= 0 then
					local var_254_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122062", "story_v_out_413122.awb") / 1000

					if var_254_24 + var_254_16 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_24 + var_254_16
					end

					if var_254_19.prefab_name ~= "" and arg_251_1.actors_[var_254_19.prefab_name] ~= nil then
						local var_254_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_19.prefab_name].transform, "story_v_out_413122", "413122062", "story_v_out_413122.awb")

						arg_251_1:RecordAudio("413122062", var_254_25)
						arg_251_1:RecordAudio("413122062", var_254_25)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_413122", "413122062", "story_v_out_413122.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_413122", "413122062", "story_v_out_413122.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_26 = math.max(var_254_17, arg_251_1.talkMaxDuration)

			if var_254_16 <= arg_251_1.time_ and arg_251_1.time_ < var_254_16 + var_254_26 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_16) / var_254_26

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_16 + var_254_26 and arg_251_1.time_ < var_254_16 + var_254_26 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play413122063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 413122063
		arg_255_1.duration_ = 13.03

		local var_255_0 = {
			zh = 8.266,
			ja = 13.033
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
				arg_255_0:Play413122064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.95

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[259].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(413122063)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122063", "story_v_out_413122.awb") ~= 0 then
					local var_258_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122063", "story_v_out_413122.awb") / 1000

					if var_258_8 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_8 + var_258_0
					end

					if var_258_3.prefab_name ~= "" and arg_255_1.actors_[var_258_3.prefab_name] ~= nil then
						local var_258_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_3.prefab_name].transform, "story_v_out_413122", "413122063", "story_v_out_413122.awb")

						arg_255_1:RecordAudio("413122063", var_258_9)
						arg_255_1:RecordAudio("413122063", var_258_9)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_413122", "413122063", "story_v_out_413122.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_413122", "413122063", "story_v_out_413122.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_10 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_10 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_10

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_10 and arg_255_1.time_ < var_258_0 + var_258_10 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play413122064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 413122064
		arg_259_1.duration_ = 9.03

		local var_259_0 = {
			zh = 4.7,
			ja = 9.033
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
				arg_259_0:Play413122065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.55

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[259].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(413122064)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122064", "story_v_out_413122.awb") ~= 0 then
					local var_262_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122064", "story_v_out_413122.awb") / 1000

					if var_262_8 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_8 + var_262_0
					end

					if var_262_3.prefab_name ~= "" and arg_259_1.actors_[var_262_3.prefab_name] ~= nil then
						local var_262_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_3.prefab_name].transform, "story_v_out_413122", "413122064", "story_v_out_413122.awb")

						arg_259_1:RecordAudio("413122064", var_262_9)
						arg_259_1:RecordAudio("413122064", var_262_9)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_413122", "413122064", "story_v_out_413122.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_413122", "413122064", "story_v_out_413122.awb")
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
	Play413122065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 413122065
		arg_263_1.duration_ = 9.33

		local var_263_0 = {
			zh = 8.666,
			ja = 9.333
		}
		local var_263_1 = manager.audio:GetLocalizationFlag()

		if var_263_0[var_263_1] ~= nil then
			arg_263_1.duration_ = var_263_0[var_263_1]
		end

		SetActive(arg_263_1.tipsGo_, false)

		function arg_263_1.onSingleLineFinish_()
			arg_263_1.onSingleLineUpdate_ = nil
			arg_263_1.onSingleLineFinish_ = nil
			arg_263_1.state_ = "waiting"
		end

		function arg_263_1.playNext_(arg_265_0)
			if arg_265_0 == 1 then
				arg_263_0:Play413122066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["10094"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos10094 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("10094", 4)

				local var_266_2 = var_266_0.childCount

				for iter_266_0 = 0, var_266_2 - 1 do
					local var_266_3 = var_266_0:GetChild(iter_266_0)

					if var_266_3.name == "" or not string.find(var_266_3.name, "split") then
						var_266_3.gameObject:SetActive(true)
					else
						var_266_3.gameObject:SetActive(false)
					end
				end
			end

			local var_266_4 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_1) / var_266_4
				local var_266_6 = Vector3.New(390, -340, -414)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos10094, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(390, -340, -414)
			end

			local var_266_7 = arg_263_1.actors_["10094"]
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps10094 == nil then
				arg_263_1.var_.actorSpriteComps10094 = var_266_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_9 = 2

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_9 then
				local var_266_10 = (arg_263_1.time_ - var_266_8) / var_266_9

				if arg_263_1.var_.actorSpriteComps10094 then
					for iter_266_1, iter_266_2 in pairs(arg_263_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_266_2 then
							if arg_263_1.isInRecall_ then
								local var_266_11 = Mathf.Lerp(iter_266_2.color.r, 0.82, var_266_10)
								local var_266_12 = Mathf.Lerp(iter_266_2.color.g, 0.77, var_266_10)
								local var_266_13 = Mathf.Lerp(iter_266_2.color.b, 0.62, var_266_10)

								iter_266_2.color = Color.New(var_266_11, var_266_12, var_266_13)
							else
								local var_266_14 = Mathf.Lerp(iter_266_2.color.r, 1, var_266_10)

								iter_266_2.color = Color.New(var_266_14, var_266_14, var_266_14)
							end
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_8 + var_266_9 and arg_263_1.time_ < var_266_8 + var_266_9 + arg_266_0 and arg_263_1.var_.actorSpriteComps10094 then
				for iter_266_3, iter_266_4 in pairs(arg_263_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_266_4 then
						if arg_263_1.isInRecall_ then
							iter_266_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_266_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_263_1.var_.actorSpriteComps10094 = nil
			end

			local var_266_15 = 0
			local var_266_16 = 0.775

			if var_266_15 < arg_263_1.time_ and arg_263_1.time_ <= var_266_15 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_17 = arg_263_1:FormatText(StoryNameCfg[259].name)

				arg_263_1.leftNameTxt_.text = var_266_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_18 = arg_263_1:GetWordFromCfg(413122065)
				local var_266_19 = arg_263_1:FormatText(var_266_18.content)

				arg_263_1.text_.text = var_266_19

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_20 = 31
				local var_266_21 = utf8.len(var_266_19)
				local var_266_22 = var_266_20 <= 0 and var_266_16 or var_266_16 * (var_266_21 / var_266_20)

				if var_266_22 > 0 and var_266_16 < var_266_22 then
					arg_263_1.talkMaxDuration = var_266_22

					if var_266_22 + var_266_15 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_22 + var_266_15
					end
				end

				arg_263_1.text_.text = var_266_19
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122065", "story_v_out_413122.awb") ~= 0 then
					local var_266_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122065", "story_v_out_413122.awb") / 1000

					if var_266_23 + var_266_15 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_23 + var_266_15
					end

					if var_266_18.prefab_name ~= "" and arg_263_1.actors_[var_266_18.prefab_name] ~= nil then
						local var_266_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_18.prefab_name].transform, "story_v_out_413122", "413122065", "story_v_out_413122.awb")

						arg_263_1:RecordAudio("413122065", var_266_24)
						arg_263_1:RecordAudio("413122065", var_266_24)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_413122", "413122065", "story_v_out_413122.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_413122", "413122065", "story_v_out_413122.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_25 = math.max(var_266_16, arg_263_1.talkMaxDuration)

			if var_266_15 <= arg_263_1.time_ and arg_263_1.time_ < var_266_15 + var_266_25 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_15) / var_266_25

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_15 + var_266_25 and arg_263_1.time_ < var_266_15 + var_266_25 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play413122066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 413122066
		arg_267_1.duration_ = 7.1

		local var_267_0 = {
			zh = 3.6,
			ja = 7.1
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
				arg_267_0:Play413122067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["10022"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.actorSpriteComps10022 == nil then
				arg_267_1.var_.actorSpriteComps10022 = var_270_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_2 = 2

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.actorSpriteComps10022 then
					for iter_270_0, iter_270_1 in pairs(arg_267_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_270_1 then
							if arg_267_1.isInRecall_ then
								local var_270_4 = Mathf.Lerp(iter_270_1.color.r, 0.82, var_270_3)
								local var_270_5 = Mathf.Lerp(iter_270_1.color.g, 0.77, var_270_3)
								local var_270_6 = Mathf.Lerp(iter_270_1.color.b, 0.62, var_270_3)

								iter_270_1.color = Color.New(var_270_4, var_270_5, var_270_6)
							else
								local var_270_7 = Mathf.Lerp(iter_270_1.color.r, 1, var_270_3)

								iter_270_1.color = Color.New(var_270_7, var_270_7, var_270_7)
							end
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.actorSpriteComps10022 then
				for iter_270_2, iter_270_3 in pairs(arg_267_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_270_3 then
						if arg_267_1.isInRecall_ then
							iter_270_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_270_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_267_1.var_.actorSpriteComps10022 = nil
			end

			local var_270_8 = arg_267_1.actors_["10094"]
			local var_270_9 = 0

			if var_270_9 < arg_267_1.time_ and arg_267_1.time_ <= var_270_9 + arg_270_0 and arg_267_1.var_.actorSpriteComps10094 == nil then
				arg_267_1.var_.actorSpriteComps10094 = var_270_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_10 = 2

			if var_270_9 <= arg_267_1.time_ and arg_267_1.time_ < var_270_9 + var_270_10 then
				local var_270_11 = (arg_267_1.time_ - var_270_9) / var_270_10

				if arg_267_1.var_.actorSpriteComps10094 then
					for iter_270_4, iter_270_5 in pairs(arg_267_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_270_5 then
							if arg_267_1.isInRecall_ then
								local var_270_12 = Mathf.Lerp(iter_270_5.color.r, 0.46, var_270_11)
								local var_270_13 = Mathf.Lerp(iter_270_5.color.g, 0.43, var_270_11)
								local var_270_14 = Mathf.Lerp(iter_270_5.color.b, 0.35, var_270_11)

								iter_270_5.color = Color.New(var_270_12, var_270_13, var_270_14)
							else
								local var_270_15 = Mathf.Lerp(iter_270_5.color.r, 0.5, var_270_11)

								iter_270_5.color = Color.New(var_270_15, var_270_15, var_270_15)
							end
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_9 + var_270_10 and arg_267_1.time_ < var_270_9 + var_270_10 + arg_270_0 and arg_267_1.var_.actorSpriteComps10094 then
				for iter_270_6, iter_270_7 in pairs(arg_267_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_270_7 then
						if arg_267_1.isInRecall_ then
							iter_270_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_270_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_267_1.var_.actorSpriteComps10094 = nil
			end

			local var_270_16 = 0
			local var_270_17 = 0.45

			if var_270_16 < arg_267_1.time_ and arg_267_1.time_ <= var_270_16 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_18 = arg_267_1:FormatText(StoryNameCfg[614].name)

				arg_267_1.leftNameTxt_.text = var_270_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_19 = arg_267_1:GetWordFromCfg(413122066)
				local var_270_20 = arg_267_1:FormatText(var_270_19.content)

				arg_267_1.text_.text = var_270_20

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_21 = 18
				local var_270_22 = utf8.len(var_270_20)
				local var_270_23 = var_270_21 <= 0 and var_270_17 or var_270_17 * (var_270_22 / var_270_21)

				if var_270_23 > 0 and var_270_17 < var_270_23 then
					arg_267_1.talkMaxDuration = var_270_23

					if var_270_23 + var_270_16 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_23 + var_270_16
					end
				end

				arg_267_1.text_.text = var_270_20
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122066", "story_v_out_413122.awb") ~= 0 then
					local var_270_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122066", "story_v_out_413122.awb") / 1000

					if var_270_24 + var_270_16 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_24 + var_270_16
					end

					if var_270_19.prefab_name ~= "" and arg_267_1.actors_[var_270_19.prefab_name] ~= nil then
						local var_270_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_19.prefab_name].transform, "story_v_out_413122", "413122066", "story_v_out_413122.awb")

						arg_267_1:RecordAudio("413122066", var_270_25)
						arg_267_1:RecordAudio("413122066", var_270_25)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_413122", "413122066", "story_v_out_413122.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_413122", "413122066", "story_v_out_413122.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_26 = math.max(var_270_17, arg_267_1.talkMaxDuration)

			if var_270_16 <= arg_267_1.time_ and arg_267_1.time_ < var_270_16 + var_270_26 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_16) / var_270_26

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_16 + var_270_26 and arg_267_1.time_ < var_270_16 + var_270_26 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play413122067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 413122067
		arg_271_1.duration_ = 6

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play413122068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 0.725

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_2 = arg_271_1:FormatText(StoryNameCfg[614].name)

				arg_271_1.leftNameTxt_.text = var_274_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_3 = arg_271_1:GetWordFromCfg(413122067)
				local var_274_4 = arg_271_1:FormatText(var_274_3.content)

				arg_271_1.text_.text = var_274_4

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_5 = 29
				local var_274_6 = utf8.len(var_274_4)
				local var_274_7 = var_274_5 <= 0 and var_274_1 or var_274_1 * (var_274_6 / var_274_5)

				if var_274_7 > 0 and var_274_1 < var_274_7 then
					arg_271_1.talkMaxDuration = var_274_7

					if var_274_7 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_7 + var_274_0
					end
				end

				arg_271_1.text_.text = var_274_4
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122067", "story_v_out_413122.awb") ~= 0 then
					local var_274_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122067", "story_v_out_413122.awb") / 1000

					if var_274_8 + var_274_0 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_8 + var_274_0
					end

					if var_274_3.prefab_name ~= "" and arg_271_1.actors_[var_274_3.prefab_name] ~= nil then
						local var_274_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_3.prefab_name].transform, "story_v_out_413122", "413122067", "story_v_out_413122.awb")

						arg_271_1:RecordAudio("413122067", var_274_9)
						arg_271_1:RecordAudio("413122067", var_274_9)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_413122", "413122067", "story_v_out_413122.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_413122", "413122067", "story_v_out_413122.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_10 = math.max(var_274_1, arg_271_1.talkMaxDuration)

			if var_274_0 <= arg_271_1.time_ and arg_271_1.time_ < var_274_0 + var_274_10 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_0) / var_274_10

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_0 + var_274_10 and arg_271_1.time_ < var_274_0 + var_274_10 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play413122068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 413122068
		arg_275_1.duration_ = 15.27

		local var_275_0 = {
			zh = 10.166,
			ja = 15.266
		}
		local var_275_1 = manager.audio:GetLocalizationFlag()

		if var_275_0[var_275_1] ~= nil then
			arg_275_1.duration_ = var_275_0[var_275_1]
		end

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play413122069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["10022"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos10022 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("10022", 2)

				local var_278_2 = var_278_0.childCount

				for iter_278_0 = 0, var_278_2 - 1 do
					local var_278_3 = var_278_0:GetChild(iter_278_0)

					if var_278_3.name == "split_3" or not string.find(var_278_3.name, "split") then
						var_278_3.gameObject:SetActive(true)
					else
						var_278_3.gameObject:SetActive(false)
					end
				end
			end

			local var_278_4 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_1) / var_278_4
				local var_278_6 = Vector3.New(-390, -315, -320)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos10022, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_278_7 = arg_275_1.actors_["10022"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps10022 == nil then
				arg_275_1.var_.actorSpriteComps10022 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 2

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps10022 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_278_2 then
							if arg_275_1.isInRecall_ then
								local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 0.82, var_278_10)
								local var_278_12 = Mathf.Lerp(iter_278_2.color.g, 0.77, var_278_10)
								local var_278_13 = Mathf.Lerp(iter_278_2.color.b, 0.62, var_278_10)

								iter_278_2.color = Color.New(var_278_11, var_278_12, var_278_13)
							else
								local var_278_14 = Mathf.Lerp(iter_278_2.color.r, 1, var_278_10)

								iter_278_2.color = Color.New(var_278_14, var_278_14, var_278_14)
							end
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps10022 then
				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_278_4 then
						if arg_275_1.isInRecall_ then
							iter_278_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_278_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_275_1.var_.actorSpriteComps10022 = nil
			end

			local var_278_15 = 0
			local var_278_16 = 1.225

			if var_278_15 < arg_275_1.time_ and arg_275_1.time_ <= var_278_15 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_17 = arg_275_1:FormatText(StoryNameCfg[614].name)

				arg_275_1.leftNameTxt_.text = var_278_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_18 = arg_275_1:GetWordFromCfg(413122068)
				local var_278_19 = arg_275_1:FormatText(var_278_18.content)

				arg_275_1.text_.text = var_278_19

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_20 = 49
				local var_278_21 = utf8.len(var_278_19)
				local var_278_22 = var_278_20 <= 0 and var_278_16 or var_278_16 * (var_278_21 / var_278_20)

				if var_278_22 > 0 and var_278_16 < var_278_22 then
					arg_275_1.talkMaxDuration = var_278_22

					if var_278_22 + var_278_15 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_22 + var_278_15
					end
				end

				arg_275_1.text_.text = var_278_19
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122068", "story_v_out_413122.awb") ~= 0 then
					local var_278_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122068", "story_v_out_413122.awb") / 1000

					if var_278_23 + var_278_15 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_23 + var_278_15
					end

					if var_278_18.prefab_name ~= "" and arg_275_1.actors_[var_278_18.prefab_name] ~= nil then
						local var_278_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_18.prefab_name].transform, "story_v_out_413122", "413122068", "story_v_out_413122.awb")

						arg_275_1:RecordAudio("413122068", var_278_24)
						arg_275_1:RecordAudio("413122068", var_278_24)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_413122", "413122068", "story_v_out_413122.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_413122", "413122068", "story_v_out_413122.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_25 = math.max(var_278_16, arg_275_1.talkMaxDuration)

			if var_278_15 <= arg_275_1.time_ and arg_275_1.time_ < var_278_15 + var_278_25 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_15) / var_278_25

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_15 + var_278_25 and arg_275_1.time_ < var_278_15 + var_278_25 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play413122069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 413122069
		arg_279_1.duration_ = 7.5

		local var_279_0 = {
			zh = 6.733,
			ja = 7.5
		}
		local var_279_1 = manager.audio:GetLocalizationFlag()

		if var_279_0[var_279_1] ~= nil then
			arg_279_1.duration_ = var_279_0[var_279_1]
		end

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play413122070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["10094"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos10094 = var_282_0.localPosition
				var_282_0.localScale = Vector3.New(1, 1, 1)

				arg_279_1:CheckSpriteTmpPos("10094", 4)

				local var_282_2 = var_282_0.childCount

				for iter_282_0 = 0, var_282_2 - 1 do
					local var_282_3 = var_282_0:GetChild(iter_282_0)

					if var_282_3.name == "" or not string.find(var_282_3.name, "split") then
						var_282_3.gameObject:SetActive(true)
					else
						var_282_3.gameObject:SetActive(false)
					end
				end
			end

			local var_282_4 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_4 then
				local var_282_5 = (arg_279_1.time_ - var_282_1) / var_282_4
				local var_282_6 = Vector3.New(390, -340, -414)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos10094, var_282_6, var_282_5)
			end

			if arg_279_1.time_ >= var_282_1 + var_282_4 and arg_279_1.time_ < var_282_1 + var_282_4 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(390, -340, -414)
			end

			local var_282_7 = arg_279_1.actors_["10022"]
			local var_282_8 = 0

			if var_282_8 < arg_279_1.time_ and arg_279_1.time_ <= var_282_8 + arg_282_0 and arg_279_1.var_.actorSpriteComps10022 == nil then
				arg_279_1.var_.actorSpriteComps10022 = var_282_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_9 = 2

			if var_282_8 <= arg_279_1.time_ and arg_279_1.time_ < var_282_8 + var_282_9 then
				local var_282_10 = (arg_279_1.time_ - var_282_8) / var_282_9

				if arg_279_1.var_.actorSpriteComps10022 then
					for iter_282_1, iter_282_2 in pairs(arg_279_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_282_2 then
							if arg_279_1.isInRecall_ then
								local var_282_11 = Mathf.Lerp(iter_282_2.color.r, 0.46, var_282_10)
								local var_282_12 = Mathf.Lerp(iter_282_2.color.g, 0.43, var_282_10)
								local var_282_13 = Mathf.Lerp(iter_282_2.color.b, 0.35, var_282_10)

								iter_282_2.color = Color.New(var_282_11, var_282_12, var_282_13)
							else
								local var_282_14 = Mathf.Lerp(iter_282_2.color.r, 0.5, var_282_10)

								iter_282_2.color = Color.New(var_282_14, var_282_14, var_282_14)
							end
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_8 + var_282_9 and arg_279_1.time_ < var_282_8 + var_282_9 + arg_282_0 and arg_279_1.var_.actorSpriteComps10022 then
				for iter_282_3, iter_282_4 in pairs(arg_279_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_282_4 then
						if arg_279_1.isInRecall_ then
							iter_282_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_282_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_279_1.var_.actorSpriteComps10022 = nil
			end

			local var_282_15 = arg_279_1.actors_["10094"]
			local var_282_16 = 0

			if var_282_16 < arg_279_1.time_ and arg_279_1.time_ <= var_282_16 + arg_282_0 and arg_279_1.var_.actorSpriteComps10094 == nil then
				arg_279_1.var_.actorSpriteComps10094 = var_282_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_17 = 2

			if var_282_16 <= arg_279_1.time_ and arg_279_1.time_ < var_282_16 + var_282_17 then
				local var_282_18 = (arg_279_1.time_ - var_282_16) / var_282_17

				if arg_279_1.var_.actorSpriteComps10094 then
					for iter_282_5, iter_282_6 in pairs(arg_279_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_282_6 then
							if arg_279_1.isInRecall_ then
								local var_282_19 = Mathf.Lerp(iter_282_6.color.r, 0.82, var_282_18)
								local var_282_20 = Mathf.Lerp(iter_282_6.color.g, 0.77, var_282_18)
								local var_282_21 = Mathf.Lerp(iter_282_6.color.b, 0.62, var_282_18)

								iter_282_6.color = Color.New(var_282_19, var_282_20, var_282_21)
							else
								local var_282_22 = Mathf.Lerp(iter_282_6.color.r, 1, var_282_18)

								iter_282_6.color = Color.New(var_282_22, var_282_22, var_282_22)
							end
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_16 + var_282_17 and arg_279_1.time_ < var_282_16 + var_282_17 + arg_282_0 and arg_279_1.var_.actorSpriteComps10094 then
				for iter_282_7, iter_282_8 in pairs(arg_279_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_282_8 then
						if arg_279_1.isInRecall_ then
							iter_282_8.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_282_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_279_1.var_.actorSpriteComps10094 = nil
			end

			local var_282_23 = 0
			local var_282_24 = 0.7

			if var_282_23 < arg_279_1.time_ and arg_279_1.time_ <= var_282_23 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_25 = arg_279_1:FormatText(StoryNameCfg[259].name)

				arg_279_1.leftNameTxt_.text = var_282_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_26 = arg_279_1:GetWordFromCfg(413122069)
				local var_282_27 = arg_279_1:FormatText(var_282_26.content)

				arg_279_1.text_.text = var_282_27

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_28 = 28
				local var_282_29 = utf8.len(var_282_27)
				local var_282_30 = var_282_28 <= 0 and var_282_24 or var_282_24 * (var_282_29 / var_282_28)

				if var_282_30 > 0 and var_282_24 < var_282_30 then
					arg_279_1.talkMaxDuration = var_282_30

					if var_282_30 + var_282_23 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_30 + var_282_23
					end
				end

				arg_279_1.text_.text = var_282_27
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122069", "story_v_out_413122.awb") ~= 0 then
					local var_282_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122069", "story_v_out_413122.awb") / 1000

					if var_282_31 + var_282_23 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_31 + var_282_23
					end

					if var_282_26.prefab_name ~= "" and arg_279_1.actors_[var_282_26.prefab_name] ~= nil then
						local var_282_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_26.prefab_name].transform, "story_v_out_413122", "413122069", "story_v_out_413122.awb")

						arg_279_1:RecordAudio("413122069", var_282_32)
						arg_279_1:RecordAudio("413122069", var_282_32)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_413122", "413122069", "story_v_out_413122.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_413122", "413122069", "story_v_out_413122.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_33 = math.max(var_282_24, arg_279_1.talkMaxDuration)

			if var_282_23 <= arg_279_1.time_ and arg_279_1.time_ < var_282_23 + var_282_33 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_23) / var_282_33

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_23 + var_282_33 and arg_279_1.time_ < var_282_23 + var_282_33 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play413122070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 413122070
		arg_283_1.duration_ = 12.7

		local var_283_0 = {
			zh = 8.466,
			ja = 12.7
		}
		local var_283_1 = manager.audio:GetLocalizationFlag()

		if var_283_0[var_283_1] ~= nil then
			arg_283_1.duration_ = var_283_0[var_283_1]
		end

		SetActive(arg_283_1.tipsGo_, false)

		function arg_283_1.onSingleLineFinish_()
			arg_283_1.onSingleLineUpdate_ = nil
			arg_283_1.onSingleLineFinish_ = nil
			arg_283_1.state_ = "waiting"
		end

		function arg_283_1.playNext_(arg_285_0)
			if arg_285_0 == 1 then
				arg_283_0:Play413122071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["10022"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.actorSpriteComps10022 == nil then
				arg_283_1.var_.actorSpriteComps10022 = var_286_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_2 = 2

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.actorSpriteComps10022 then
					for iter_286_0, iter_286_1 in pairs(arg_283_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_286_1 then
							if arg_283_1.isInRecall_ then
								local var_286_4 = Mathf.Lerp(iter_286_1.color.r, 0.82, var_286_3)
								local var_286_5 = Mathf.Lerp(iter_286_1.color.g, 0.77, var_286_3)
								local var_286_6 = Mathf.Lerp(iter_286_1.color.b, 0.62, var_286_3)

								iter_286_1.color = Color.New(var_286_4, var_286_5, var_286_6)
							else
								local var_286_7 = Mathf.Lerp(iter_286_1.color.r, 1, var_286_3)

								iter_286_1.color = Color.New(var_286_7, var_286_7, var_286_7)
							end
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.actorSpriteComps10022 then
				for iter_286_2, iter_286_3 in pairs(arg_283_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_286_3 then
						if arg_283_1.isInRecall_ then
							iter_286_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_286_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_283_1.var_.actorSpriteComps10022 = nil
			end

			local var_286_8 = arg_283_1.actors_["10094"]
			local var_286_9 = 0

			if var_286_9 < arg_283_1.time_ and arg_283_1.time_ <= var_286_9 + arg_286_0 and arg_283_1.var_.actorSpriteComps10094 == nil then
				arg_283_1.var_.actorSpriteComps10094 = var_286_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_10 = 2

			if var_286_9 <= arg_283_1.time_ and arg_283_1.time_ < var_286_9 + var_286_10 then
				local var_286_11 = (arg_283_1.time_ - var_286_9) / var_286_10

				if arg_283_1.var_.actorSpriteComps10094 then
					for iter_286_4, iter_286_5 in pairs(arg_283_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_286_5 then
							if arg_283_1.isInRecall_ then
								local var_286_12 = Mathf.Lerp(iter_286_5.color.r, 0.46, var_286_11)
								local var_286_13 = Mathf.Lerp(iter_286_5.color.g, 0.43, var_286_11)
								local var_286_14 = Mathf.Lerp(iter_286_5.color.b, 0.35, var_286_11)

								iter_286_5.color = Color.New(var_286_12, var_286_13, var_286_14)
							else
								local var_286_15 = Mathf.Lerp(iter_286_5.color.r, 0.5, var_286_11)

								iter_286_5.color = Color.New(var_286_15, var_286_15, var_286_15)
							end
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_9 + var_286_10 and arg_283_1.time_ < var_286_9 + var_286_10 + arg_286_0 and arg_283_1.var_.actorSpriteComps10094 then
				for iter_286_6, iter_286_7 in pairs(arg_283_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_286_7 then
						if arg_283_1.isInRecall_ then
							iter_286_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_286_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_283_1.var_.actorSpriteComps10094 = nil
			end

			local var_286_16 = 0
			local var_286_17 = 1

			if var_286_16 < arg_283_1.time_ and arg_283_1.time_ <= var_286_16 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_18 = arg_283_1:FormatText(StoryNameCfg[614].name)

				arg_283_1.leftNameTxt_.text = var_286_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_19 = arg_283_1:GetWordFromCfg(413122070)
				local var_286_20 = arg_283_1:FormatText(var_286_19.content)

				arg_283_1.text_.text = var_286_20

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_21 = 40
				local var_286_22 = utf8.len(var_286_20)
				local var_286_23 = var_286_21 <= 0 and var_286_17 or var_286_17 * (var_286_22 / var_286_21)

				if var_286_23 > 0 and var_286_17 < var_286_23 then
					arg_283_1.talkMaxDuration = var_286_23

					if var_286_23 + var_286_16 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_23 + var_286_16
					end
				end

				arg_283_1.text_.text = var_286_20
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122070", "story_v_out_413122.awb") ~= 0 then
					local var_286_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122070", "story_v_out_413122.awb") / 1000

					if var_286_24 + var_286_16 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_24 + var_286_16
					end

					if var_286_19.prefab_name ~= "" and arg_283_1.actors_[var_286_19.prefab_name] ~= nil then
						local var_286_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_19.prefab_name].transform, "story_v_out_413122", "413122070", "story_v_out_413122.awb")

						arg_283_1:RecordAudio("413122070", var_286_25)
						arg_283_1:RecordAudio("413122070", var_286_25)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_413122", "413122070", "story_v_out_413122.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_413122", "413122070", "story_v_out_413122.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_26 = math.max(var_286_17, arg_283_1.talkMaxDuration)

			if var_286_16 <= arg_283_1.time_ and arg_283_1.time_ < var_286_16 + var_286_26 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_16) / var_286_26

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_16 + var_286_26 and arg_283_1.time_ < var_286_16 + var_286_26 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play413122071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 413122071
		arg_287_1.duration_ = 10.47

		local var_287_0 = {
			zh = 10.466,
			ja = 9.866
		}
		local var_287_1 = manager.audio:GetLocalizationFlag()

		if var_287_0[var_287_1] ~= nil then
			arg_287_1.duration_ = var_287_0[var_287_1]
		end

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play413122072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 1.1

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_2 = arg_287_1:FormatText(StoryNameCfg[614].name)

				arg_287_1.leftNameTxt_.text = var_290_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_3 = arg_287_1:GetWordFromCfg(413122071)
				local var_290_4 = arg_287_1:FormatText(var_290_3.content)

				arg_287_1.text_.text = var_290_4

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_5 = 44
				local var_290_6 = utf8.len(var_290_4)
				local var_290_7 = var_290_5 <= 0 and var_290_1 or var_290_1 * (var_290_6 / var_290_5)

				if var_290_7 > 0 and var_290_1 < var_290_7 then
					arg_287_1.talkMaxDuration = var_290_7

					if var_290_7 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_7 + var_290_0
					end
				end

				arg_287_1.text_.text = var_290_4
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122071", "story_v_out_413122.awb") ~= 0 then
					local var_290_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122071", "story_v_out_413122.awb") / 1000

					if var_290_8 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_8 + var_290_0
					end

					if var_290_3.prefab_name ~= "" and arg_287_1.actors_[var_290_3.prefab_name] ~= nil then
						local var_290_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_3.prefab_name].transform, "story_v_out_413122", "413122071", "story_v_out_413122.awb")

						arg_287_1:RecordAudio("413122071", var_290_9)
						arg_287_1:RecordAudio("413122071", var_290_9)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_413122", "413122071", "story_v_out_413122.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_413122", "413122071", "story_v_out_413122.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_10 = math.max(var_290_1, arg_287_1.talkMaxDuration)

			if var_290_0 <= arg_287_1.time_ and arg_287_1.time_ < var_290_0 + var_290_10 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_0) / var_290_10

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_0 + var_290_10 and arg_287_1.time_ < var_290_0 + var_290_10 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play413122072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 413122072
		arg_291_1.duration_ = 12.2

		local var_291_0 = {
			zh = 7.633,
			ja = 12.2
		}
		local var_291_1 = manager.audio:GetLocalizationFlag()

		if var_291_0[var_291_1] ~= nil then
			arg_291_1.duration_ = var_291_0[var_291_1]
		end

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play413122073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["10022"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 and arg_291_1.var_.actorSpriteComps10022 == nil then
				arg_291_1.var_.actorSpriteComps10022 = var_294_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_2 = 2

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2

				if arg_291_1.var_.actorSpriteComps10022 then
					for iter_294_0, iter_294_1 in pairs(arg_291_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_294_1 then
							if arg_291_1.isInRecall_ then
								local var_294_4 = Mathf.Lerp(iter_294_1.color.r, 0.46, var_294_3)
								local var_294_5 = Mathf.Lerp(iter_294_1.color.g, 0.43, var_294_3)
								local var_294_6 = Mathf.Lerp(iter_294_1.color.b, 0.35, var_294_3)

								iter_294_1.color = Color.New(var_294_4, var_294_5, var_294_6)
							else
								local var_294_7 = Mathf.Lerp(iter_294_1.color.r, 0.5, var_294_3)

								iter_294_1.color = Color.New(var_294_7, var_294_7, var_294_7)
							end
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 and arg_291_1.var_.actorSpriteComps10022 then
				for iter_294_2, iter_294_3 in pairs(arg_291_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_294_3 then
						if arg_291_1.isInRecall_ then
							iter_294_3.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_294_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_291_1.var_.actorSpriteComps10022 = nil
			end

			local var_294_8 = arg_291_1.actors_["10094"]
			local var_294_9 = 0

			if var_294_9 < arg_291_1.time_ and arg_291_1.time_ <= var_294_9 + arg_294_0 and arg_291_1.var_.actorSpriteComps10094 == nil then
				arg_291_1.var_.actorSpriteComps10094 = var_294_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_10 = 2

			if var_294_9 <= arg_291_1.time_ and arg_291_1.time_ < var_294_9 + var_294_10 then
				local var_294_11 = (arg_291_1.time_ - var_294_9) / var_294_10

				if arg_291_1.var_.actorSpriteComps10094 then
					for iter_294_4, iter_294_5 in pairs(arg_291_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_294_5 then
							if arg_291_1.isInRecall_ then
								local var_294_12 = Mathf.Lerp(iter_294_5.color.r, 0.82, var_294_11)
								local var_294_13 = Mathf.Lerp(iter_294_5.color.g, 0.77, var_294_11)
								local var_294_14 = Mathf.Lerp(iter_294_5.color.b, 0.62, var_294_11)

								iter_294_5.color = Color.New(var_294_12, var_294_13, var_294_14)
							else
								local var_294_15 = Mathf.Lerp(iter_294_5.color.r, 1, var_294_11)

								iter_294_5.color = Color.New(var_294_15, var_294_15, var_294_15)
							end
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_9 + var_294_10 and arg_291_1.time_ < var_294_9 + var_294_10 + arg_294_0 and arg_291_1.var_.actorSpriteComps10094 then
				for iter_294_6, iter_294_7 in pairs(arg_291_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_294_7 then
						if arg_291_1.isInRecall_ then
							iter_294_7.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_294_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_291_1.var_.actorSpriteComps10094 = nil
			end

			local var_294_16 = arg_291_1.actors_["10094"].transform
			local var_294_17 = 0

			if var_294_17 < arg_291_1.time_ and arg_291_1.time_ <= var_294_17 + arg_294_0 then
				arg_291_1.var_.moveOldPos10094 = var_294_16.localPosition
				var_294_16.localScale = Vector3.New(1, 1, 1)

				arg_291_1:CheckSpriteTmpPos("10094", 4)

				local var_294_18 = var_294_16.childCount

				for iter_294_8 = 0, var_294_18 - 1 do
					local var_294_19 = var_294_16:GetChild(iter_294_8)

					if var_294_19.name == "split_1" or not string.find(var_294_19.name, "split") then
						var_294_19.gameObject:SetActive(true)
					else
						var_294_19.gameObject:SetActive(false)
					end
				end
			end

			local var_294_20 = 0.1

			if var_294_17 <= arg_291_1.time_ and arg_291_1.time_ < var_294_17 + var_294_20 then
				local var_294_21 = (arg_291_1.time_ - var_294_17) / var_294_20
				local var_294_22 = Vector3.New(390, -340, -414)

				var_294_16.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos10094, var_294_22, var_294_21)
			end

			if arg_291_1.time_ >= var_294_17 + var_294_20 and arg_291_1.time_ < var_294_17 + var_294_20 + arg_294_0 then
				var_294_16.localPosition = Vector3.New(390, -340, -414)
			end

			local var_294_23 = 0
			local var_294_24 = 0.8

			if var_294_23 < arg_291_1.time_ and arg_291_1.time_ <= var_294_23 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_25 = arg_291_1:FormatText(StoryNameCfg[259].name)

				arg_291_1.leftNameTxt_.text = var_294_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_26 = arg_291_1:GetWordFromCfg(413122072)
				local var_294_27 = arg_291_1:FormatText(var_294_26.content)

				arg_291_1.text_.text = var_294_27

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_28 = 32
				local var_294_29 = utf8.len(var_294_27)
				local var_294_30 = var_294_28 <= 0 and var_294_24 or var_294_24 * (var_294_29 / var_294_28)

				if var_294_30 > 0 and var_294_24 < var_294_30 then
					arg_291_1.talkMaxDuration = var_294_30

					if var_294_30 + var_294_23 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_30 + var_294_23
					end
				end

				arg_291_1.text_.text = var_294_27
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122072", "story_v_out_413122.awb") ~= 0 then
					local var_294_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122072", "story_v_out_413122.awb") / 1000

					if var_294_31 + var_294_23 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_31 + var_294_23
					end

					if var_294_26.prefab_name ~= "" and arg_291_1.actors_[var_294_26.prefab_name] ~= nil then
						local var_294_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_26.prefab_name].transform, "story_v_out_413122", "413122072", "story_v_out_413122.awb")

						arg_291_1:RecordAudio("413122072", var_294_32)
						arg_291_1:RecordAudio("413122072", var_294_32)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_413122", "413122072", "story_v_out_413122.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_413122", "413122072", "story_v_out_413122.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_33 = math.max(var_294_24, arg_291_1.talkMaxDuration)

			if var_294_23 <= arg_291_1.time_ and arg_291_1.time_ < var_294_23 + var_294_33 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_23) / var_294_33

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_23 + var_294_33 and arg_291_1.time_ < var_294_23 + var_294_33 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play413122073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 413122073
		arg_295_1.duration_ = 12.47

		local var_295_0 = {
			zh = 9.066,
			ja = 12.466
		}
		local var_295_1 = manager.audio:GetLocalizationFlag()

		if var_295_0[var_295_1] ~= nil then
			arg_295_1.duration_ = var_295_0[var_295_1]
		end

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play413122074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["10022"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.actorSpriteComps10022 == nil then
				arg_295_1.var_.actorSpriteComps10022 = var_298_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_2 = 2

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.actorSpriteComps10022 then
					for iter_298_0, iter_298_1 in pairs(arg_295_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_298_1 then
							if arg_295_1.isInRecall_ then
								local var_298_4 = Mathf.Lerp(iter_298_1.color.r, 0.82, var_298_3)
								local var_298_5 = Mathf.Lerp(iter_298_1.color.g, 0.77, var_298_3)
								local var_298_6 = Mathf.Lerp(iter_298_1.color.b, 0.62, var_298_3)

								iter_298_1.color = Color.New(var_298_4, var_298_5, var_298_6)
							else
								local var_298_7 = Mathf.Lerp(iter_298_1.color.r, 1, var_298_3)

								iter_298_1.color = Color.New(var_298_7, var_298_7, var_298_7)
							end
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.actorSpriteComps10022 then
				for iter_298_2, iter_298_3 in pairs(arg_295_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_298_3 then
						if arg_295_1.isInRecall_ then
							iter_298_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_298_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_295_1.var_.actorSpriteComps10022 = nil
			end

			local var_298_8 = arg_295_1.actors_["10094"]
			local var_298_9 = 0

			if var_298_9 < arg_295_1.time_ and arg_295_1.time_ <= var_298_9 + arg_298_0 and arg_295_1.var_.actorSpriteComps10094 == nil then
				arg_295_1.var_.actorSpriteComps10094 = var_298_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_10 = 2

			if var_298_9 <= arg_295_1.time_ and arg_295_1.time_ < var_298_9 + var_298_10 then
				local var_298_11 = (arg_295_1.time_ - var_298_9) / var_298_10

				if arg_295_1.var_.actorSpriteComps10094 then
					for iter_298_4, iter_298_5 in pairs(arg_295_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_298_5 then
							if arg_295_1.isInRecall_ then
								local var_298_12 = Mathf.Lerp(iter_298_5.color.r, 0.46, var_298_11)
								local var_298_13 = Mathf.Lerp(iter_298_5.color.g, 0.43, var_298_11)
								local var_298_14 = Mathf.Lerp(iter_298_5.color.b, 0.35, var_298_11)

								iter_298_5.color = Color.New(var_298_12, var_298_13, var_298_14)
							else
								local var_298_15 = Mathf.Lerp(iter_298_5.color.r, 0.5, var_298_11)

								iter_298_5.color = Color.New(var_298_15, var_298_15, var_298_15)
							end
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_9 + var_298_10 and arg_295_1.time_ < var_298_9 + var_298_10 + arg_298_0 and arg_295_1.var_.actorSpriteComps10094 then
				for iter_298_6, iter_298_7 in pairs(arg_295_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_298_7 then
						if arg_295_1.isInRecall_ then
							iter_298_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_298_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_295_1.var_.actorSpriteComps10094 = nil
			end

			local var_298_16 = arg_295_1.actors_["10022"].transform
			local var_298_17 = 0

			if var_298_17 < arg_295_1.time_ and arg_295_1.time_ <= var_298_17 + arg_298_0 then
				arg_295_1.var_.moveOldPos10022 = var_298_16.localPosition
				var_298_16.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("10022", 2)

				local var_298_18 = var_298_16.childCount

				for iter_298_8 = 0, var_298_18 - 1 do
					local var_298_19 = var_298_16:GetChild(iter_298_8)

					if var_298_19.name == "split_4" or not string.find(var_298_19.name, "split") then
						var_298_19.gameObject:SetActive(true)
					else
						var_298_19.gameObject:SetActive(false)
					end
				end
			end

			local var_298_20 = 0.001

			if var_298_17 <= arg_295_1.time_ and arg_295_1.time_ < var_298_17 + var_298_20 then
				local var_298_21 = (arg_295_1.time_ - var_298_17) / var_298_20
				local var_298_22 = Vector3.New(-390, -315, -320)

				var_298_16.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos10022, var_298_22, var_298_21)
			end

			if arg_295_1.time_ >= var_298_17 + var_298_20 and arg_295_1.time_ < var_298_17 + var_298_20 + arg_298_0 then
				var_298_16.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_298_23 = 0
			local var_298_24 = 0.775

			if var_298_23 < arg_295_1.time_ and arg_295_1.time_ <= var_298_23 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_25 = arg_295_1:FormatText(StoryNameCfg[614].name)

				arg_295_1.leftNameTxt_.text = var_298_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_26 = arg_295_1:GetWordFromCfg(413122073)
				local var_298_27 = arg_295_1:FormatText(var_298_26.content)

				arg_295_1.text_.text = var_298_27

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_28 = 31
				local var_298_29 = utf8.len(var_298_27)
				local var_298_30 = var_298_28 <= 0 and var_298_24 or var_298_24 * (var_298_29 / var_298_28)

				if var_298_30 > 0 and var_298_24 < var_298_30 then
					arg_295_1.talkMaxDuration = var_298_30

					if var_298_30 + var_298_23 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_30 + var_298_23
					end
				end

				arg_295_1.text_.text = var_298_27
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122073", "story_v_out_413122.awb") ~= 0 then
					local var_298_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122073", "story_v_out_413122.awb") / 1000

					if var_298_31 + var_298_23 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_31 + var_298_23
					end

					if var_298_26.prefab_name ~= "" and arg_295_1.actors_[var_298_26.prefab_name] ~= nil then
						local var_298_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_26.prefab_name].transform, "story_v_out_413122", "413122073", "story_v_out_413122.awb")

						arg_295_1:RecordAudio("413122073", var_298_32)
						arg_295_1:RecordAudio("413122073", var_298_32)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_413122", "413122073", "story_v_out_413122.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_413122", "413122073", "story_v_out_413122.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_33 = math.max(var_298_24, arg_295_1.talkMaxDuration)

			if var_298_23 <= arg_295_1.time_ and arg_295_1.time_ < var_298_23 + var_298_33 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_23) / var_298_33

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_23 + var_298_33 and arg_295_1.time_ < var_298_23 + var_298_33 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play413122074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 413122074
		arg_299_1.duration_ = 5.37

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play413122075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["10022"].transform
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.var_.moveOldPos10022 = var_302_0.localPosition
				var_302_0.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("10022", 2)

				local var_302_2 = var_302_0.childCount

				for iter_302_0 = 0, var_302_2 - 1 do
					local var_302_3 = var_302_0:GetChild(iter_302_0)

					if var_302_3.name == "" or not string.find(var_302_3.name, "split") then
						var_302_3.gameObject:SetActive(true)
					else
						var_302_3.gameObject:SetActive(false)
					end
				end
			end

			local var_302_4 = 0.001

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_4 then
				local var_302_5 = (arg_299_1.time_ - var_302_1) / var_302_4
				local var_302_6 = Vector3.New(-390, -315, -320)

				var_302_0.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos10022, var_302_6, var_302_5)
			end

			if arg_299_1.time_ >= var_302_1 + var_302_4 and arg_299_1.time_ < var_302_1 + var_302_4 + arg_302_0 then
				var_302_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_302_7 = arg_299_1.actors_["10022"]
			local var_302_8 = 0

			if var_302_8 < arg_299_1.time_ and arg_299_1.time_ <= var_302_8 + arg_302_0 and arg_299_1.var_.actorSpriteComps10022 == nil then
				arg_299_1.var_.actorSpriteComps10022 = var_302_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_9 = 2

			if var_302_8 <= arg_299_1.time_ and arg_299_1.time_ < var_302_8 + var_302_9 then
				local var_302_10 = (arg_299_1.time_ - var_302_8) / var_302_9

				if arg_299_1.var_.actorSpriteComps10022 then
					for iter_302_1, iter_302_2 in pairs(arg_299_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_302_2 then
							if arg_299_1.isInRecall_ then
								local var_302_11 = Mathf.Lerp(iter_302_2.color.r, 0.46, var_302_10)
								local var_302_12 = Mathf.Lerp(iter_302_2.color.g, 0.43, var_302_10)
								local var_302_13 = Mathf.Lerp(iter_302_2.color.b, 0.35, var_302_10)

								iter_302_2.color = Color.New(var_302_11, var_302_12, var_302_13)
							else
								local var_302_14 = Mathf.Lerp(iter_302_2.color.r, 0.5, var_302_10)

								iter_302_2.color = Color.New(var_302_14, var_302_14, var_302_14)
							end
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_8 + var_302_9 and arg_299_1.time_ < var_302_8 + var_302_9 + arg_302_0 and arg_299_1.var_.actorSpriteComps10022 then
				for iter_302_3, iter_302_4 in pairs(arg_299_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_302_4 then
						if arg_299_1.isInRecall_ then
							iter_302_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_302_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_299_1.var_.actorSpriteComps10022 = nil
			end

			local var_302_15 = arg_299_1.actors_["10022"].transform
			local var_302_16 = 0

			if var_302_16 < arg_299_1.time_ and arg_299_1.time_ <= var_302_16 + arg_302_0 then
				arg_299_1.var_.moveOldPos10022 = var_302_15.localPosition
				var_302_15.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("10022", 7)

				local var_302_17 = var_302_15.childCount

				for iter_302_5 = 0, var_302_17 - 1 do
					local var_302_18 = var_302_15:GetChild(iter_302_5)

					if var_302_18.name == "split_3" or not string.find(var_302_18.name, "split") then
						var_302_18.gameObject:SetActive(true)
					else
						var_302_18.gameObject:SetActive(false)
					end
				end
			end

			local var_302_19 = 0.001

			if var_302_16 <= arg_299_1.time_ and arg_299_1.time_ < var_302_16 + var_302_19 then
				local var_302_20 = (arg_299_1.time_ - var_302_16) / var_302_19
				local var_302_21 = Vector3.New(0, -2000, 0)

				var_302_15.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos10022, var_302_21, var_302_20)
			end

			if arg_299_1.time_ >= var_302_16 + var_302_19 and arg_299_1.time_ < var_302_16 + var_302_19 + arg_302_0 then
				var_302_15.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_302_22 = arg_299_1.actors_["10094"].transform
			local var_302_23 = 0

			if var_302_23 < arg_299_1.time_ and arg_299_1.time_ <= var_302_23 + arg_302_0 then
				arg_299_1.var_.moveOldPos10094 = var_302_22.localPosition
				var_302_22.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("10094", 7)

				local var_302_24 = var_302_22.childCount

				for iter_302_6 = 0, var_302_24 - 1 do
					local var_302_25 = var_302_22:GetChild(iter_302_6)

					if var_302_25.name == "" or not string.find(var_302_25.name, "split") then
						var_302_25.gameObject:SetActive(true)
					else
						var_302_25.gameObject:SetActive(false)
					end
				end
			end

			local var_302_26 = 0.001

			if var_302_23 <= arg_299_1.time_ and arg_299_1.time_ < var_302_23 + var_302_26 then
				local var_302_27 = (arg_299_1.time_ - var_302_23) / var_302_26
				local var_302_28 = Vector3.New(0, -2000, 0)

				var_302_22.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos10094, var_302_28, var_302_27)
			end

			if arg_299_1.time_ >= var_302_23 + var_302_26 and arg_299_1.time_ < var_302_23 + var_302_26 + arg_302_0 then
				var_302_22.localPosition = Vector3.New(0, -2000, 0)
			end

			if arg_299_1.frameCnt_ <= 1 then
				arg_299_1.dialog_:SetActive(false)
			end

			local var_302_29 = 0.366666666666667
			local var_302_30 = 1.075

			if var_302_29 < arg_299_1.time_ and arg_299_1.time_ <= var_302_29 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0

				arg_299_1.dialog_:SetActive(true)

				local var_302_31 = LeanTween.value(arg_299_1.dialog_, 0, 1, 0.3)

				var_302_31:setOnUpdate(LuaHelper.FloatAction(function(arg_303_0)
					arg_299_1.dialogCg_.alpha = arg_303_0
				end))
				var_302_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_299_1.dialog_)
					var_302_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_299_1.duration_ = arg_299_1.duration_ + 0.3

				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_32 = arg_299_1:GetWordFromCfg(413122074)
				local var_302_33 = arg_299_1:FormatText(var_302_32.content)

				arg_299_1.text_.text = var_302_33

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_34 = 43
				local var_302_35 = utf8.len(var_302_33)
				local var_302_36 = var_302_34 <= 0 and var_302_30 or var_302_30 * (var_302_35 / var_302_34)

				if var_302_36 > 0 and var_302_30 < var_302_36 then
					arg_299_1.talkMaxDuration = var_302_36
					var_302_29 = var_302_29 + 0.3

					if var_302_36 + var_302_29 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_36 + var_302_29
					end
				end

				arg_299_1.text_.text = var_302_33
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_37 = var_302_29 + 0.3
			local var_302_38 = math.max(var_302_30, arg_299_1.talkMaxDuration)

			if var_302_37 <= arg_299_1.time_ and arg_299_1.time_ < var_302_37 + var_302_38 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_37) / var_302_38

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_37 + var_302_38 and arg_299_1.time_ < var_302_37 + var_302_38 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play413122075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 413122075
		arg_305_1.duration_ = 3.6

		local var_305_0 = {
			zh = 3.233,
			ja = 3.6
		}
		local var_305_1 = manager.audio:GetLocalizationFlag()

		if var_305_0[var_305_1] ~= nil then
			arg_305_1.duration_ = var_305_0[var_305_1]
		end

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play413122076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["10094"].transform
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 then
				arg_305_1.var_.moveOldPos10094 = var_308_0.localPosition
				var_308_0.localScale = Vector3.New(1, 1, 1)

				arg_305_1:CheckSpriteTmpPos("10094", 4)

				local var_308_2 = var_308_0.childCount

				for iter_308_0 = 0, var_308_2 - 1 do
					local var_308_3 = var_308_0:GetChild(iter_308_0)

					if var_308_3.name == "" or not string.find(var_308_3.name, "split") then
						var_308_3.gameObject:SetActive(true)
					else
						var_308_3.gameObject:SetActive(false)
					end
				end
			end

			local var_308_4 = 0.001

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_4 then
				local var_308_5 = (arg_305_1.time_ - var_308_1) / var_308_4
				local var_308_6 = Vector3.New(390, -340, -414)

				var_308_0.localPosition = Vector3.Lerp(arg_305_1.var_.moveOldPos10094, var_308_6, var_308_5)
			end

			if arg_305_1.time_ >= var_308_1 + var_308_4 and arg_305_1.time_ < var_308_1 + var_308_4 + arg_308_0 then
				var_308_0.localPosition = Vector3.New(390, -340, -414)
			end

			local var_308_7 = arg_305_1.actors_["10094"]
			local var_308_8 = 0

			if var_308_8 < arg_305_1.time_ and arg_305_1.time_ <= var_308_8 + arg_308_0 and arg_305_1.var_.actorSpriteComps10094 == nil then
				arg_305_1.var_.actorSpriteComps10094 = var_308_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_308_9 = 2

			if var_308_8 <= arg_305_1.time_ and arg_305_1.time_ < var_308_8 + var_308_9 then
				local var_308_10 = (arg_305_1.time_ - var_308_8) / var_308_9

				if arg_305_1.var_.actorSpriteComps10094 then
					for iter_308_1, iter_308_2 in pairs(arg_305_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_308_2 then
							if arg_305_1.isInRecall_ then
								local var_308_11 = Mathf.Lerp(iter_308_2.color.r, 0.82, var_308_10)
								local var_308_12 = Mathf.Lerp(iter_308_2.color.g, 0.77, var_308_10)
								local var_308_13 = Mathf.Lerp(iter_308_2.color.b, 0.62, var_308_10)

								iter_308_2.color = Color.New(var_308_11, var_308_12, var_308_13)
							else
								local var_308_14 = Mathf.Lerp(iter_308_2.color.r, 1, var_308_10)

								iter_308_2.color = Color.New(var_308_14, var_308_14, var_308_14)
							end
						end
					end
				end
			end

			if arg_305_1.time_ >= var_308_8 + var_308_9 and arg_305_1.time_ < var_308_8 + var_308_9 + arg_308_0 and arg_305_1.var_.actorSpriteComps10094 then
				for iter_308_3, iter_308_4 in pairs(arg_305_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_308_4 then
						if arg_305_1.isInRecall_ then
							iter_308_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_308_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_305_1.var_.actorSpriteComps10094 = nil
			end

			local var_308_15 = 0
			local var_308_16 = 0.35

			if var_308_15 < arg_305_1.time_ and arg_305_1.time_ <= var_308_15 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_17 = arg_305_1:FormatText(StoryNameCfg[259].name)

				arg_305_1.leftNameTxt_.text = var_308_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_18 = arg_305_1:GetWordFromCfg(413122075)
				local var_308_19 = arg_305_1:FormatText(var_308_18.content)

				arg_305_1.text_.text = var_308_19

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_20 = 14
				local var_308_21 = utf8.len(var_308_19)
				local var_308_22 = var_308_20 <= 0 and var_308_16 or var_308_16 * (var_308_21 / var_308_20)

				if var_308_22 > 0 and var_308_16 < var_308_22 then
					arg_305_1.talkMaxDuration = var_308_22

					if var_308_22 + var_308_15 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_22 + var_308_15
					end
				end

				arg_305_1.text_.text = var_308_19
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122075", "story_v_out_413122.awb") ~= 0 then
					local var_308_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122075", "story_v_out_413122.awb") / 1000

					if var_308_23 + var_308_15 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_23 + var_308_15
					end

					if var_308_18.prefab_name ~= "" and arg_305_1.actors_[var_308_18.prefab_name] ~= nil then
						local var_308_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_18.prefab_name].transform, "story_v_out_413122", "413122075", "story_v_out_413122.awb")

						arg_305_1:RecordAudio("413122075", var_308_24)
						arg_305_1:RecordAudio("413122075", var_308_24)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_413122", "413122075", "story_v_out_413122.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_413122", "413122075", "story_v_out_413122.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_25 = math.max(var_308_16, arg_305_1.talkMaxDuration)

			if var_308_15 <= arg_305_1.time_ and arg_305_1.time_ < var_308_15 + var_308_25 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_15) / var_308_25

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_15 + var_308_25 and arg_305_1.time_ < var_308_15 + var_308_25 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play413122076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 413122076
		arg_309_1.duration_ = 5.53

		local var_309_0 = {
			zh = 4.766,
			ja = 5.533
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
				arg_309_0:Play413122077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["10022"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos10022 = var_312_0.localPosition
				var_312_0.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("10022", 2)

				local var_312_2 = var_312_0.childCount

				for iter_312_0 = 0, var_312_2 - 1 do
					local var_312_3 = var_312_0:GetChild(iter_312_0)

					if var_312_3.name == "split_8" or not string.find(var_312_3.name, "split") then
						var_312_3.gameObject:SetActive(true)
					else
						var_312_3.gameObject:SetActive(false)
					end
				end
			end

			local var_312_4 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_4 then
				local var_312_5 = (arg_309_1.time_ - var_312_1) / var_312_4
				local var_312_6 = Vector3.New(-390, -315, -320)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10022, var_312_6, var_312_5)
			end

			if arg_309_1.time_ >= var_312_1 + var_312_4 and arg_309_1.time_ < var_312_1 + var_312_4 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_312_7 = arg_309_1.actors_["10094"].transform
			local var_312_8 = 0

			if var_312_8 < arg_309_1.time_ and arg_309_1.time_ <= var_312_8 + arg_312_0 then
				arg_309_1.var_.moveOldPos10094 = var_312_7.localPosition
				var_312_7.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("10094", 4)

				local var_312_9 = var_312_7.childCount

				for iter_312_1 = 0, var_312_9 - 1 do
					local var_312_10 = var_312_7:GetChild(iter_312_1)

					if var_312_10.name == "" or not string.find(var_312_10.name, "split") then
						var_312_10.gameObject:SetActive(true)
					else
						var_312_10.gameObject:SetActive(false)
					end
				end
			end

			local var_312_11 = 0.001

			if var_312_8 <= arg_309_1.time_ and arg_309_1.time_ < var_312_8 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_8) / var_312_11
				local var_312_13 = Vector3.New(390, -340, -414)

				var_312_7.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10094, var_312_13, var_312_12)
			end

			if arg_309_1.time_ >= var_312_8 + var_312_11 and arg_309_1.time_ < var_312_8 + var_312_11 + arg_312_0 then
				var_312_7.localPosition = Vector3.New(390, -340, -414)
			end

			local var_312_14 = arg_309_1.actors_["10022"]
			local var_312_15 = 0

			if var_312_15 < arg_309_1.time_ and arg_309_1.time_ <= var_312_15 + arg_312_0 and arg_309_1.var_.actorSpriteComps10022 == nil then
				arg_309_1.var_.actorSpriteComps10022 = var_312_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_16 = 2

			if var_312_15 <= arg_309_1.time_ and arg_309_1.time_ < var_312_15 + var_312_16 then
				local var_312_17 = (arg_309_1.time_ - var_312_15) / var_312_16

				if arg_309_1.var_.actorSpriteComps10022 then
					for iter_312_2, iter_312_3 in pairs(arg_309_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_312_3 then
							if arg_309_1.isInRecall_ then
								local var_312_18 = Mathf.Lerp(iter_312_3.color.r, 0.82, var_312_17)
								local var_312_19 = Mathf.Lerp(iter_312_3.color.g, 0.77, var_312_17)
								local var_312_20 = Mathf.Lerp(iter_312_3.color.b, 0.62, var_312_17)

								iter_312_3.color = Color.New(var_312_18, var_312_19, var_312_20)
							else
								local var_312_21 = Mathf.Lerp(iter_312_3.color.r, 1, var_312_17)

								iter_312_3.color = Color.New(var_312_21, var_312_21, var_312_21)
							end
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_15 + var_312_16 and arg_309_1.time_ < var_312_15 + var_312_16 + arg_312_0 and arg_309_1.var_.actorSpriteComps10022 then
				for iter_312_4, iter_312_5 in pairs(arg_309_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_312_5 then
						if arg_309_1.isInRecall_ then
							iter_312_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_312_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_309_1.var_.actorSpriteComps10022 = nil
			end

			local var_312_22 = arg_309_1.actors_["10094"]
			local var_312_23 = 0

			if var_312_23 < arg_309_1.time_ and arg_309_1.time_ <= var_312_23 + arg_312_0 and arg_309_1.var_.actorSpriteComps10094 == nil then
				arg_309_1.var_.actorSpriteComps10094 = var_312_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_24 = 2

			if var_312_23 <= arg_309_1.time_ and arg_309_1.time_ < var_312_23 + var_312_24 then
				local var_312_25 = (arg_309_1.time_ - var_312_23) / var_312_24

				if arg_309_1.var_.actorSpriteComps10094 then
					for iter_312_6, iter_312_7 in pairs(arg_309_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_312_7 then
							if arg_309_1.isInRecall_ then
								local var_312_26 = Mathf.Lerp(iter_312_7.color.r, 0.46, var_312_25)
								local var_312_27 = Mathf.Lerp(iter_312_7.color.g, 0.43, var_312_25)
								local var_312_28 = Mathf.Lerp(iter_312_7.color.b, 0.35, var_312_25)

								iter_312_7.color = Color.New(var_312_26, var_312_27, var_312_28)
							else
								local var_312_29 = Mathf.Lerp(iter_312_7.color.r, 0.5, var_312_25)

								iter_312_7.color = Color.New(var_312_29, var_312_29, var_312_29)
							end
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_23 + var_312_24 and arg_309_1.time_ < var_312_23 + var_312_24 + arg_312_0 and arg_309_1.var_.actorSpriteComps10094 then
				for iter_312_8, iter_312_9 in pairs(arg_309_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_312_9 then
						if arg_309_1.isInRecall_ then
							iter_312_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_312_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_309_1.var_.actorSpriteComps10094 = nil
			end

			local var_312_30 = 0
			local var_312_31 = 0.6

			if var_312_30 < arg_309_1.time_ and arg_309_1.time_ <= var_312_30 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_32 = arg_309_1:FormatText(StoryNameCfg[614].name)

				arg_309_1.leftNameTxt_.text = var_312_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_33 = arg_309_1:GetWordFromCfg(413122076)
				local var_312_34 = arg_309_1:FormatText(var_312_33.content)

				arg_309_1.text_.text = var_312_34

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_35 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122076", "story_v_out_413122.awb") ~= 0 then
					local var_312_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122076", "story_v_out_413122.awb") / 1000

					if var_312_38 + var_312_30 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_38 + var_312_30
					end

					if var_312_33.prefab_name ~= "" and arg_309_1.actors_[var_312_33.prefab_name] ~= nil then
						local var_312_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_33.prefab_name].transform, "story_v_out_413122", "413122076", "story_v_out_413122.awb")

						arg_309_1:RecordAudio("413122076", var_312_39)
						arg_309_1:RecordAudio("413122076", var_312_39)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_413122", "413122076", "story_v_out_413122.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_413122", "413122076", "story_v_out_413122.awb")
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
	Play413122077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 413122077
		arg_313_1.duration_ = 12.2

		local var_313_0 = {
			zh = 9.533,
			ja = 12.2
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
				arg_313_0:Play413122078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["10022"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.actorSpriteComps10022 == nil then
				arg_313_1.var_.actorSpriteComps10022 = var_316_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_2 = 2

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.actorSpriteComps10022 then
					for iter_316_0, iter_316_1 in pairs(arg_313_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_316_1 then
							if arg_313_1.isInRecall_ then
								local var_316_4 = Mathf.Lerp(iter_316_1.color.r, 0.82, var_316_3)
								local var_316_5 = Mathf.Lerp(iter_316_1.color.g, 0.77, var_316_3)
								local var_316_6 = Mathf.Lerp(iter_316_1.color.b, 0.62, var_316_3)

								iter_316_1.color = Color.New(var_316_4, var_316_5, var_316_6)
							else
								local var_316_7 = Mathf.Lerp(iter_316_1.color.r, 1, var_316_3)

								iter_316_1.color = Color.New(var_316_7, var_316_7, var_316_7)
							end
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.actorSpriteComps10022 then
				for iter_316_2, iter_316_3 in pairs(arg_313_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_316_3 then
						if arg_313_1.isInRecall_ then
							iter_316_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_316_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_313_1.var_.actorSpriteComps10022 = nil
			end

			local var_316_8 = 0
			local var_316_9 = 1.05

			if var_316_8 < arg_313_1.time_ and arg_313_1.time_ <= var_316_8 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_10 = arg_313_1:FormatText(StoryNameCfg[614].name)

				arg_313_1.leftNameTxt_.text = var_316_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_11 = arg_313_1:GetWordFromCfg(413122077)
				local var_316_12 = arg_313_1:FormatText(var_316_11.content)

				arg_313_1.text_.text = var_316_12

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_13 = 42
				local var_316_14 = utf8.len(var_316_12)
				local var_316_15 = var_316_13 <= 0 and var_316_9 or var_316_9 * (var_316_14 / var_316_13)

				if var_316_15 > 0 and var_316_9 < var_316_15 then
					arg_313_1.talkMaxDuration = var_316_15

					if var_316_15 + var_316_8 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_15 + var_316_8
					end
				end

				arg_313_1.text_.text = var_316_12
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122077", "story_v_out_413122.awb") ~= 0 then
					local var_316_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122077", "story_v_out_413122.awb") / 1000

					if var_316_16 + var_316_8 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_16 + var_316_8
					end

					if var_316_11.prefab_name ~= "" and arg_313_1.actors_[var_316_11.prefab_name] ~= nil then
						local var_316_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_11.prefab_name].transform, "story_v_out_413122", "413122077", "story_v_out_413122.awb")

						arg_313_1:RecordAudio("413122077", var_316_17)
						arg_313_1:RecordAudio("413122077", var_316_17)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_413122", "413122077", "story_v_out_413122.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_413122", "413122077", "story_v_out_413122.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_18 = math.max(var_316_9, arg_313_1.talkMaxDuration)

			if var_316_8 <= arg_313_1.time_ and arg_313_1.time_ < var_316_8 + var_316_18 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_8) / var_316_18

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_8 + var_316_18 and arg_313_1.time_ < var_316_8 + var_316_18 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play413122078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 413122078
		arg_317_1.duration_ = 4.07

		local var_317_0 = {
			zh = 4.066,
			ja = 3.533
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
				arg_317_0:Play413122079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10092_1"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos10092_1 = var_320_0.localPosition
				var_320_0.localScale = Vector3.New(1, 1, 1)

				arg_317_1:CheckSpriteTmpPos("10092_1", 4)

				local var_320_2 = var_320_0.childCount

				for iter_320_0 = 0, var_320_2 - 1 do
					local var_320_3 = var_320_0:GetChild(iter_320_0)

					if var_320_3.name == "" or not string.find(var_320_3.name, "split") then
						var_320_3.gameObject:SetActive(true)
					else
						var_320_3.gameObject:SetActive(false)
					end
				end
			end

			local var_320_4 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_4 then
				local var_320_5 = (arg_317_1.time_ - var_320_1) / var_320_4
				local var_320_6 = Vector3.New(390, -300, -295)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos10092_1, var_320_6, var_320_5)
			end

			if arg_317_1.time_ >= var_320_1 + var_320_4 and arg_317_1.time_ < var_320_1 + var_320_4 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_320_7 = arg_317_1.actors_["10022"].transform
			local var_320_8 = 0

			if var_320_8 < arg_317_1.time_ and arg_317_1.time_ <= var_320_8 + arg_320_0 then
				arg_317_1.var_.moveOldPos10022 = var_320_7.localPosition
				var_320_7.localScale = Vector3.New(1, 1, 1)

				arg_317_1:CheckSpriteTmpPos("10022", 2)

				local var_320_9 = var_320_7.childCount

				for iter_320_1 = 0, var_320_9 - 1 do
					local var_320_10 = var_320_7:GetChild(iter_320_1)

					if var_320_10.name == "" or not string.find(var_320_10.name, "split") then
						var_320_10.gameObject:SetActive(true)
					else
						var_320_10.gameObject:SetActive(false)
					end
				end
			end

			local var_320_11 = 0.001

			if var_320_8 <= arg_317_1.time_ and arg_317_1.time_ < var_320_8 + var_320_11 then
				local var_320_12 = (arg_317_1.time_ - var_320_8) / var_320_11
				local var_320_13 = Vector3.New(-390, -315, -320)

				var_320_7.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos10022, var_320_13, var_320_12)
			end

			if arg_317_1.time_ >= var_320_8 + var_320_11 and arg_317_1.time_ < var_320_8 + var_320_11 + arg_320_0 then
				var_320_7.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_320_14 = arg_317_1.actors_["10092_1"]
			local var_320_15 = 0

			if var_320_15 < arg_317_1.time_ and arg_317_1.time_ <= var_320_15 + arg_320_0 and arg_317_1.var_.actorSpriteComps10092_1 == nil then
				arg_317_1.var_.actorSpriteComps10092_1 = var_320_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_320_16 = 2

			if var_320_15 <= arg_317_1.time_ and arg_317_1.time_ < var_320_15 + var_320_16 then
				local var_320_17 = (arg_317_1.time_ - var_320_15) / var_320_16

				if arg_317_1.var_.actorSpriteComps10092_1 then
					for iter_320_2, iter_320_3 in pairs(arg_317_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_320_3 then
							if arg_317_1.isInRecall_ then
								local var_320_18 = Mathf.Lerp(iter_320_3.color.r, 0.82, var_320_17)
								local var_320_19 = Mathf.Lerp(iter_320_3.color.g, 0.77, var_320_17)
								local var_320_20 = Mathf.Lerp(iter_320_3.color.b, 0.62, var_320_17)

								iter_320_3.color = Color.New(var_320_18, var_320_19, var_320_20)
							else
								local var_320_21 = Mathf.Lerp(iter_320_3.color.r, 1, var_320_17)

								iter_320_3.color = Color.New(var_320_21, var_320_21, var_320_21)
							end
						end
					end
				end
			end

			if arg_317_1.time_ >= var_320_15 + var_320_16 and arg_317_1.time_ < var_320_15 + var_320_16 + arg_320_0 and arg_317_1.var_.actorSpriteComps10092_1 then
				for iter_320_4, iter_320_5 in pairs(arg_317_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_320_5 then
						if arg_317_1.isInRecall_ then
							iter_320_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_320_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_317_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_320_22 = arg_317_1.actors_["10022"]
			local var_320_23 = 0

			if var_320_23 < arg_317_1.time_ and arg_317_1.time_ <= var_320_23 + arg_320_0 and arg_317_1.var_.actorSpriteComps10022 == nil then
				arg_317_1.var_.actorSpriteComps10022 = var_320_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_320_24 = 2

			if var_320_23 <= arg_317_1.time_ and arg_317_1.time_ < var_320_23 + var_320_24 then
				local var_320_25 = (arg_317_1.time_ - var_320_23) / var_320_24

				if arg_317_1.var_.actorSpriteComps10022 then
					for iter_320_6, iter_320_7 in pairs(arg_317_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_320_7 then
							if arg_317_1.isInRecall_ then
								local var_320_26 = Mathf.Lerp(iter_320_7.color.r, 0.46, var_320_25)
								local var_320_27 = Mathf.Lerp(iter_320_7.color.g, 0.43, var_320_25)
								local var_320_28 = Mathf.Lerp(iter_320_7.color.b, 0.35, var_320_25)

								iter_320_7.color = Color.New(var_320_26, var_320_27, var_320_28)
							else
								local var_320_29 = Mathf.Lerp(iter_320_7.color.r, 0.5, var_320_25)

								iter_320_7.color = Color.New(var_320_29, var_320_29, var_320_29)
							end
						end
					end
				end
			end

			if arg_317_1.time_ >= var_320_23 + var_320_24 and arg_317_1.time_ < var_320_23 + var_320_24 + arg_320_0 and arg_317_1.var_.actorSpriteComps10022 then
				for iter_320_8, iter_320_9 in pairs(arg_317_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_320_9 then
						if arg_317_1.isInRecall_ then
							iter_320_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_320_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_317_1.var_.actorSpriteComps10022 = nil
			end

			local var_320_30 = 0
			local var_320_31 = 0.6

			if var_320_30 < arg_317_1.time_ and arg_317_1.time_ <= var_320_30 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_32 = arg_317_1:FormatText(StoryNameCfg[996].name)

				arg_317_1.leftNameTxt_.text = var_320_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_33 = arg_317_1:GetWordFromCfg(413122078)
				local var_320_34 = arg_317_1:FormatText(var_320_33.content)

				arg_317_1.text_.text = var_320_34

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_35 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122078", "story_v_out_413122.awb") ~= 0 then
					local var_320_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122078", "story_v_out_413122.awb") / 1000

					if var_320_38 + var_320_30 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_38 + var_320_30
					end

					if var_320_33.prefab_name ~= "" and arg_317_1.actors_[var_320_33.prefab_name] ~= nil then
						local var_320_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_33.prefab_name].transform, "story_v_out_413122", "413122078", "story_v_out_413122.awb")

						arg_317_1:RecordAudio("413122078", var_320_39)
						arg_317_1:RecordAudio("413122078", var_320_39)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_413122", "413122078", "story_v_out_413122.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_413122", "413122078", "story_v_out_413122.awb")
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
	Play413122079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 413122079
		arg_321_1.duration_ = 8.57

		local var_321_0 = {
			zh = 8.533,
			ja = 8.566
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
				arg_321_0:Play413122080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["10022"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.actorSpriteComps10022 == nil then
				arg_321_1.var_.actorSpriteComps10022 = var_324_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_324_2 = 2

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.actorSpriteComps10022 then
					for iter_324_0, iter_324_1 in pairs(arg_321_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_324_1 then
							if arg_321_1.isInRecall_ then
								local var_324_4 = Mathf.Lerp(iter_324_1.color.r, 0.82, var_324_3)
								local var_324_5 = Mathf.Lerp(iter_324_1.color.g, 0.77, var_324_3)
								local var_324_6 = Mathf.Lerp(iter_324_1.color.b, 0.62, var_324_3)

								iter_324_1.color = Color.New(var_324_4, var_324_5, var_324_6)
							else
								local var_324_7 = Mathf.Lerp(iter_324_1.color.r, 1, var_324_3)

								iter_324_1.color = Color.New(var_324_7, var_324_7, var_324_7)
							end
						end
					end
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.actorSpriteComps10022 then
				for iter_324_2, iter_324_3 in pairs(arg_321_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_324_3 then
						if arg_321_1.isInRecall_ then
							iter_324_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_324_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_321_1.var_.actorSpriteComps10022 = nil
			end

			local var_324_8 = arg_321_1.actors_["10092_1"]
			local var_324_9 = 0

			if var_324_9 < arg_321_1.time_ and arg_321_1.time_ <= var_324_9 + arg_324_0 and arg_321_1.var_.actorSpriteComps10092_1 == nil then
				arg_321_1.var_.actorSpriteComps10092_1 = var_324_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_324_10 = 2

			if var_324_9 <= arg_321_1.time_ and arg_321_1.time_ < var_324_9 + var_324_10 then
				local var_324_11 = (arg_321_1.time_ - var_324_9) / var_324_10

				if arg_321_1.var_.actorSpriteComps10092_1 then
					for iter_324_4, iter_324_5 in pairs(arg_321_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_324_5 then
							if arg_321_1.isInRecall_ then
								local var_324_12 = Mathf.Lerp(iter_324_5.color.r, 0.46, var_324_11)
								local var_324_13 = Mathf.Lerp(iter_324_5.color.g, 0.43, var_324_11)
								local var_324_14 = Mathf.Lerp(iter_324_5.color.b, 0.35, var_324_11)

								iter_324_5.color = Color.New(var_324_12, var_324_13, var_324_14)
							else
								local var_324_15 = Mathf.Lerp(iter_324_5.color.r, 0.5, var_324_11)

								iter_324_5.color = Color.New(var_324_15, var_324_15, var_324_15)
							end
						end
					end
				end
			end

			if arg_321_1.time_ >= var_324_9 + var_324_10 and arg_321_1.time_ < var_324_9 + var_324_10 + arg_324_0 and arg_321_1.var_.actorSpriteComps10092_1 then
				for iter_324_6, iter_324_7 in pairs(arg_321_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_324_7 then
						if arg_321_1.isInRecall_ then
							iter_324_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_324_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_321_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_324_16 = 0
			local var_324_17 = 1.125

			if var_324_16 < arg_321_1.time_ and arg_321_1.time_ <= var_324_16 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_18 = arg_321_1:FormatText(StoryNameCfg[614].name)

				arg_321_1.leftNameTxt_.text = var_324_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_19 = arg_321_1:GetWordFromCfg(413122079)
				local var_324_20 = arg_321_1:FormatText(var_324_19.content)

				arg_321_1.text_.text = var_324_20

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_21 = 45
				local var_324_22 = utf8.len(var_324_20)
				local var_324_23 = var_324_21 <= 0 and var_324_17 or var_324_17 * (var_324_22 / var_324_21)

				if var_324_23 > 0 and var_324_17 < var_324_23 then
					arg_321_1.talkMaxDuration = var_324_23

					if var_324_23 + var_324_16 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_23 + var_324_16
					end
				end

				arg_321_1.text_.text = var_324_20
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122079", "story_v_out_413122.awb") ~= 0 then
					local var_324_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122079", "story_v_out_413122.awb") / 1000

					if var_324_24 + var_324_16 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_24 + var_324_16
					end

					if var_324_19.prefab_name ~= "" and arg_321_1.actors_[var_324_19.prefab_name] ~= nil then
						local var_324_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_19.prefab_name].transform, "story_v_out_413122", "413122079", "story_v_out_413122.awb")

						arg_321_1:RecordAudio("413122079", var_324_25)
						arg_321_1:RecordAudio("413122079", var_324_25)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_413122", "413122079", "story_v_out_413122.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_413122", "413122079", "story_v_out_413122.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_26 = math.max(var_324_17, arg_321_1.talkMaxDuration)

			if var_324_16 <= arg_321_1.time_ and arg_321_1.time_ < var_324_16 + var_324_26 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_16) / var_324_26

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_16 + var_324_26 and arg_321_1.time_ < var_324_16 + var_324_26 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play413122080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 413122080
		arg_325_1.duration_ = 6.7

		local var_325_0 = {
			zh = 4.233,
			ja = 6.7
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
				arg_325_0:Play413122081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["10092_1"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.actorSpriteComps10092_1 == nil then
				arg_325_1.var_.actorSpriteComps10092_1 = var_328_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_328_2 = 2

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.actorSpriteComps10092_1 then
					for iter_328_0, iter_328_1 in pairs(arg_325_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_328_1 then
							if arg_325_1.isInRecall_ then
								local var_328_4 = Mathf.Lerp(iter_328_1.color.r, 0.82, var_328_3)
								local var_328_5 = Mathf.Lerp(iter_328_1.color.g, 0.77, var_328_3)
								local var_328_6 = Mathf.Lerp(iter_328_1.color.b, 0.62, var_328_3)

								iter_328_1.color = Color.New(var_328_4, var_328_5, var_328_6)
							else
								local var_328_7 = Mathf.Lerp(iter_328_1.color.r, 1, var_328_3)

								iter_328_1.color = Color.New(var_328_7, var_328_7, var_328_7)
							end
						end
					end
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.actorSpriteComps10092_1 then
				for iter_328_2, iter_328_3 in pairs(arg_325_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_328_3 then
						if arg_325_1.isInRecall_ then
							iter_328_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_328_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_325_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_328_8 = arg_325_1.actors_["10022"]
			local var_328_9 = 0

			if var_328_9 < arg_325_1.time_ and arg_325_1.time_ <= var_328_9 + arg_328_0 and arg_325_1.var_.actorSpriteComps10022 == nil then
				arg_325_1.var_.actorSpriteComps10022 = var_328_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_328_10 = 2

			if var_328_9 <= arg_325_1.time_ and arg_325_1.time_ < var_328_9 + var_328_10 then
				local var_328_11 = (arg_325_1.time_ - var_328_9) / var_328_10

				if arg_325_1.var_.actorSpriteComps10022 then
					for iter_328_4, iter_328_5 in pairs(arg_325_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_328_5 then
							if arg_325_1.isInRecall_ then
								local var_328_12 = Mathf.Lerp(iter_328_5.color.r, 0.46, var_328_11)
								local var_328_13 = Mathf.Lerp(iter_328_5.color.g, 0.43, var_328_11)
								local var_328_14 = Mathf.Lerp(iter_328_5.color.b, 0.35, var_328_11)

								iter_328_5.color = Color.New(var_328_12, var_328_13, var_328_14)
							else
								local var_328_15 = Mathf.Lerp(iter_328_5.color.r, 0.5, var_328_11)

								iter_328_5.color = Color.New(var_328_15, var_328_15, var_328_15)
							end
						end
					end
				end
			end

			if arg_325_1.time_ >= var_328_9 + var_328_10 and arg_325_1.time_ < var_328_9 + var_328_10 + arg_328_0 and arg_325_1.var_.actorSpriteComps10022 then
				for iter_328_6, iter_328_7 in pairs(arg_325_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_328_7 then
						if arg_325_1.isInRecall_ then
							iter_328_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_328_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_325_1.var_.actorSpriteComps10022 = nil
			end

			local var_328_16 = 0
			local var_328_17 = 0.4

			if var_328_16 < arg_325_1.time_ and arg_325_1.time_ <= var_328_16 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_18 = arg_325_1:FormatText(StoryNameCfg[996].name)

				arg_325_1.leftNameTxt_.text = var_328_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_19 = arg_325_1:GetWordFromCfg(413122080)
				local var_328_20 = arg_325_1:FormatText(var_328_19.content)

				arg_325_1.text_.text = var_328_20

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_21 = 16
				local var_328_22 = utf8.len(var_328_20)
				local var_328_23 = var_328_21 <= 0 and var_328_17 or var_328_17 * (var_328_22 / var_328_21)

				if var_328_23 > 0 and var_328_17 < var_328_23 then
					arg_325_1.talkMaxDuration = var_328_23

					if var_328_23 + var_328_16 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_23 + var_328_16
					end
				end

				arg_325_1.text_.text = var_328_20
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122080", "story_v_out_413122.awb") ~= 0 then
					local var_328_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122080", "story_v_out_413122.awb") / 1000

					if var_328_24 + var_328_16 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_24 + var_328_16
					end

					if var_328_19.prefab_name ~= "" and arg_325_1.actors_[var_328_19.prefab_name] ~= nil then
						local var_328_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_19.prefab_name].transform, "story_v_out_413122", "413122080", "story_v_out_413122.awb")

						arg_325_1:RecordAudio("413122080", var_328_25)
						arg_325_1:RecordAudio("413122080", var_328_25)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_413122", "413122080", "story_v_out_413122.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_413122", "413122080", "story_v_out_413122.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_26 = math.max(var_328_17, arg_325_1.talkMaxDuration)

			if var_328_16 <= arg_325_1.time_ and arg_325_1.time_ < var_328_16 + var_328_26 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_16) / var_328_26

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_16 + var_328_26 and arg_325_1.time_ < var_328_16 + var_328_26 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play413122081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 413122081
		arg_329_1.duration_ = 7.6

		local var_329_0 = {
			zh = 7.6,
			ja = 7.333
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
				arg_329_0:Play413122082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["10022"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos10022 = var_332_0.localPosition
				var_332_0.localScale = Vector3.New(1, 1, 1)

				arg_329_1:CheckSpriteTmpPos("10022", 2)

				local var_332_2 = var_332_0.childCount

				for iter_332_0 = 0, var_332_2 - 1 do
					local var_332_3 = var_332_0:GetChild(iter_332_0)

					if var_332_3.name == "split_6" or not string.find(var_332_3.name, "split") then
						var_332_3.gameObject:SetActive(true)
					else
						var_332_3.gameObject:SetActive(false)
					end
				end
			end

			local var_332_4 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_4 then
				local var_332_5 = (arg_329_1.time_ - var_332_1) / var_332_4
				local var_332_6 = Vector3.New(-390, -315, -320)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos10022, var_332_6, var_332_5)
			end

			if arg_329_1.time_ >= var_332_1 + var_332_4 and arg_329_1.time_ < var_332_1 + var_332_4 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_332_7 = arg_329_1.actors_["10022"]
			local var_332_8 = 0

			if var_332_8 < arg_329_1.time_ and arg_329_1.time_ <= var_332_8 + arg_332_0 and arg_329_1.var_.actorSpriteComps10022 == nil then
				arg_329_1.var_.actorSpriteComps10022 = var_332_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_332_9 = 2

			if var_332_8 <= arg_329_1.time_ and arg_329_1.time_ < var_332_8 + var_332_9 then
				local var_332_10 = (arg_329_1.time_ - var_332_8) / var_332_9

				if arg_329_1.var_.actorSpriteComps10022 then
					for iter_332_1, iter_332_2 in pairs(arg_329_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_332_2 then
							if arg_329_1.isInRecall_ then
								local var_332_11 = Mathf.Lerp(iter_332_2.color.r, 0.82, var_332_10)
								local var_332_12 = Mathf.Lerp(iter_332_2.color.g, 0.77, var_332_10)
								local var_332_13 = Mathf.Lerp(iter_332_2.color.b, 0.62, var_332_10)

								iter_332_2.color = Color.New(var_332_11, var_332_12, var_332_13)
							else
								local var_332_14 = Mathf.Lerp(iter_332_2.color.r, 1, var_332_10)

								iter_332_2.color = Color.New(var_332_14, var_332_14, var_332_14)
							end
						end
					end
				end
			end

			if arg_329_1.time_ >= var_332_8 + var_332_9 and arg_329_1.time_ < var_332_8 + var_332_9 + arg_332_0 and arg_329_1.var_.actorSpriteComps10022 then
				for iter_332_3, iter_332_4 in pairs(arg_329_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_332_4 then
						if arg_329_1.isInRecall_ then
							iter_332_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_332_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_329_1.var_.actorSpriteComps10022 = nil
			end

			local var_332_15 = arg_329_1.actors_["10092_1"]
			local var_332_16 = 0

			if var_332_16 < arg_329_1.time_ and arg_329_1.time_ <= var_332_16 + arg_332_0 and arg_329_1.var_.actorSpriteComps10092_1 == nil then
				arg_329_1.var_.actorSpriteComps10092_1 = var_332_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_332_17 = 2

			if var_332_16 <= arg_329_1.time_ and arg_329_1.time_ < var_332_16 + var_332_17 then
				local var_332_18 = (arg_329_1.time_ - var_332_16) / var_332_17

				if arg_329_1.var_.actorSpriteComps10092_1 then
					for iter_332_5, iter_332_6 in pairs(arg_329_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_332_6 then
							if arg_329_1.isInRecall_ then
								local var_332_19 = Mathf.Lerp(iter_332_6.color.r, 0.46, var_332_18)
								local var_332_20 = Mathf.Lerp(iter_332_6.color.g, 0.43, var_332_18)
								local var_332_21 = Mathf.Lerp(iter_332_6.color.b, 0.35, var_332_18)

								iter_332_6.color = Color.New(var_332_19, var_332_20, var_332_21)
							else
								local var_332_22 = Mathf.Lerp(iter_332_6.color.r, 0.5, var_332_18)

								iter_332_6.color = Color.New(var_332_22, var_332_22, var_332_22)
							end
						end
					end
				end
			end

			if arg_329_1.time_ >= var_332_16 + var_332_17 and arg_329_1.time_ < var_332_16 + var_332_17 + arg_332_0 and arg_329_1.var_.actorSpriteComps10092_1 then
				for iter_332_7, iter_332_8 in pairs(arg_329_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_332_8 then
						if arg_329_1.isInRecall_ then
							iter_332_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_332_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_329_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_332_23 = 0
			local var_332_24 = 0.825

			if var_332_23 < arg_329_1.time_ and arg_329_1.time_ <= var_332_23 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_25 = arg_329_1:FormatText(StoryNameCfg[614].name)

				arg_329_1.leftNameTxt_.text = var_332_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_26 = arg_329_1:GetWordFromCfg(413122081)
				local var_332_27 = arg_329_1:FormatText(var_332_26.content)

				arg_329_1.text_.text = var_332_27

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_28 = 33
				local var_332_29 = utf8.len(var_332_27)
				local var_332_30 = var_332_28 <= 0 and var_332_24 or var_332_24 * (var_332_29 / var_332_28)

				if var_332_30 > 0 and var_332_24 < var_332_30 then
					arg_329_1.talkMaxDuration = var_332_30

					if var_332_30 + var_332_23 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_30 + var_332_23
					end
				end

				arg_329_1.text_.text = var_332_27
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122081", "story_v_out_413122.awb") ~= 0 then
					local var_332_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122081", "story_v_out_413122.awb") / 1000

					if var_332_31 + var_332_23 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_31 + var_332_23
					end

					if var_332_26.prefab_name ~= "" and arg_329_1.actors_[var_332_26.prefab_name] ~= nil then
						local var_332_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_26.prefab_name].transform, "story_v_out_413122", "413122081", "story_v_out_413122.awb")

						arg_329_1:RecordAudio("413122081", var_332_32)
						arg_329_1:RecordAudio("413122081", var_332_32)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_413122", "413122081", "story_v_out_413122.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_413122", "413122081", "story_v_out_413122.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_33 = math.max(var_332_24, arg_329_1.talkMaxDuration)

			if var_332_23 <= arg_329_1.time_ and arg_329_1.time_ < var_332_23 + var_332_33 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_23) / var_332_33

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_23 + var_332_33 and arg_329_1.time_ < var_332_23 + var_332_33 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play413122082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 413122082
		arg_333_1.duration_ = 7.17

		local var_333_0 = {
			zh = 5.2,
			ja = 7.166
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
				arg_333_0:Play413122083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["10022"]
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 and arg_333_1.var_.actorSpriteComps10022 == nil then
				arg_333_1.var_.actorSpriteComps10022 = var_336_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_336_2 = 2

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2

				if arg_333_1.var_.actorSpriteComps10022 then
					for iter_336_0, iter_336_1 in pairs(arg_333_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_336_1 then
							if arg_333_1.isInRecall_ then
								local var_336_4 = Mathf.Lerp(iter_336_1.color.r, 0.82, var_336_3)
								local var_336_5 = Mathf.Lerp(iter_336_1.color.g, 0.77, var_336_3)
								local var_336_6 = Mathf.Lerp(iter_336_1.color.b, 0.62, var_336_3)

								iter_336_1.color = Color.New(var_336_4, var_336_5, var_336_6)
							else
								local var_336_7 = Mathf.Lerp(iter_336_1.color.r, 1, var_336_3)

								iter_336_1.color = Color.New(var_336_7, var_336_7, var_336_7)
							end
						end
					end
				end
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 and arg_333_1.var_.actorSpriteComps10022 then
				for iter_336_2, iter_336_3 in pairs(arg_333_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_336_3 then
						if arg_333_1.isInRecall_ then
							iter_336_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_336_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_333_1.var_.actorSpriteComps10022 = nil
			end

			local var_336_8 = 0
			local var_336_9 = 0.6

			if var_336_8 < arg_333_1.time_ and arg_333_1.time_ <= var_336_8 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_10 = arg_333_1:FormatText(StoryNameCfg[614].name)

				arg_333_1.leftNameTxt_.text = var_336_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_11 = arg_333_1:GetWordFromCfg(413122082)
				local var_336_12 = arg_333_1:FormatText(var_336_11.content)

				arg_333_1.text_.text = var_336_12

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_13 = 24
				local var_336_14 = utf8.len(var_336_12)
				local var_336_15 = var_336_13 <= 0 and var_336_9 or var_336_9 * (var_336_14 / var_336_13)

				if var_336_15 > 0 and var_336_9 < var_336_15 then
					arg_333_1.talkMaxDuration = var_336_15

					if var_336_15 + var_336_8 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_15 + var_336_8
					end
				end

				arg_333_1.text_.text = var_336_12
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122082", "story_v_out_413122.awb") ~= 0 then
					local var_336_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122082", "story_v_out_413122.awb") / 1000

					if var_336_16 + var_336_8 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_16 + var_336_8
					end

					if var_336_11.prefab_name ~= "" and arg_333_1.actors_[var_336_11.prefab_name] ~= nil then
						local var_336_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_11.prefab_name].transform, "story_v_out_413122", "413122082", "story_v_out_413122.awb")

						arg_333_1:RecordAudio("413122082", var_336_17)
						arg_333_1:RecordAudio("413122082", var_336_17)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_413122", "413122082", "story_v_out_413122.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_413122", "413122082", "story_v_out_413122.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_18 = math.max(var_336_9, arg_333_1.talkMaxDuration)

			if var_336_8 <= arg_333_1.time_ and arg_333_1.time_ < var_336_8 + var_336_18 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_8) / var_336_18

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_8 + var_336_18 and arg_333_1.time_ < var_336_8 + var_336_18 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play413122083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 413122083
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play413122084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["10022"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos10022 = var_340_0.localPosition
				var_340_0.localScale = Vector3.New(1, 1, 1)

				arg_337_1:CheckSpriteTmpPos("10022", 7)

				local var_340_2 = var_340_0.childCount

				for iter_340_0 = 0, var_340_2 - 1 do
					local var_340_3 = var_340_0:GetChild(iter_340_0)

					if var_340_3.name == "" or not string.find(var_340_3.name, "split") then
						var_340_3.gameObject:SetActive(true)
					else
						var_340_3.gameObject:SetActive(false)
					end
				end
			end

			local var_340_4 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_4 then
				local var_340_5 = (arg_337_1.time_ - var_340_1) / var_340_4
				local var_340_6 = Vector3.New(0, -2000, 0)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos10022, var_340_6, var_340_5)
			end

			if arg_337_1.time_ >= var_340_1 + var_340_4 and arg_337_1.time_ < var_340_1 + var_340_4 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_340_7 = arg_337_1.actors_["10022"]
			local var_340_8 = 0

			if var_340_8 < arg_337_1.time_ and arg_337_1.time_ <= var_340_8 + arg_340_0 and arg_337_1.var_.actorSpriteComps10022 == nil then
				arg_337_1.var_.actorSpriteComps10022 = var_340_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_340_9 = 2

			if var_340_8 <= arg_337_1.time_ and arg_337_1.time_ < var_340_8 + var_340_9 then
				local var_340_10 = (arg_337_1.time_ - var_340_8) / var_340_9

				if arg_337_1.var_.actorSpriteComps10022 then
					for iter_340_1, iter_340_2 in pairs(arg_337_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_340_2 then
							if arg_337_1.isInRecall_ then
								local var_340_11 = Mathf.Lerp(iter_340_2.color.r, 0.46, var_340_10)
								local var_340_12 = Mathf.Lerp(iter_340_2.color.g, 0.43, var_340_10)
								local var_340_13 = Mathf.Lerp(iter_340_2.color.b, 0.35, var_340_10)

								iter_340_2.color = Color.New(var_340_11, var_340_12, var_340_13)
							else
								local var_340_14 = Mathf.Lerp(iter_340_2.color.r, 0.5, var_340_10)

								iter_340_2.color = Color.New(var_340_14, var_340_14, var_340_14)
							end
						end
					end
				end
			end

			if arg_337_1.time_ >= var_340_8 + var_340_9 and arg_337_1.time_ < var_340_8 + var_340_9 + arg_340_0 and arg_337_1.var_.actorSpriteComps10022 then
				for iter_340_3, iter_340_4 in pairs(arg_337_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_340_4 then
						if arg_337_1.isInRecall_ then
							iter_340_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_340_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_337_1.var_.actorSpriteComps10022 = nil
			end

			local var_340_15 = arg_337_1.actors_["10092_1"].transform
			local var_340_16 = 0

			if var_340_16 < arg_337_1.time_ and arg_337_1.time_ <= var_340_16 + arg_340_0 then
				arg_337_1.var_.moveOldPos10092_1 = var_340_15.localPosition
				var_340_15.localScale = Vector3.New(1, 1, 1)

				arg_337_1:CheckSpriteTmpPos("10092_1", 7)

				local var_340_17 = var_340_15.childCount

				for iter_340_5 = 0, var_340_17 - 1 do
					local var_340_18 = var_340_15:GetChild(iter_340_5)

					if var_340_18.name == "" or not string.find(var_340_18.name, "split") then
						var_340_18.gameObject:SetActive(true)
					else
						var_340_18.gameObject:SetActive(false)
					end
				end
			end

			local var_340_19 = 0.001

			if var_340_16 <= arg_337_1.time_ and arg_337_1.time_ < var_340_16 + var_340_19 then
				local var_340_20 = (arg_337_1.time_ - var_340_16) / var_340_19
				local var_340_21 = Vector3.New(0, -2000, 0)

				var_340_15.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos10092_1, var_340_21, var_340_20)
			end

			if arg_337_1.time_ >= var_340_16 + var_340_19 and arg_337_1.time_ < var_340_16 + var_340_19 + arg_340_0 then
				var_340_15.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_340_22 = 0
			local var_340_23 = 1.375

			if var_340_22 < arg_337_1.time_ and arg_337_1.time_ <= var_340_22 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, false)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_24 = arg_337_1:GetWordFromCfg(413122083)
				local var_340_25 = arg_337_1:FormatText(var_340_24.content)

				arg_337_1.text_.text = var_340_25

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_26 = 55
				local var_340_27 = utf8.len(var_340_25)
				local var_340_28 = var_340_26 <= 0 and var_340_23 or var_340_23 * (var_340_27 / var_340_26)

				if var_340_28 > 0 and var_340_23 < var_340_28 then
					arg_337_1.talkMaxDuration = var_340_28

					if var_340_28 + var_340_22 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_28 + var_340_22
					end
				end

				arg_337_1.text_.text = var_340_25
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_29 = math.max(var_340_23, arg_337_1.talkMaxDuration)

			if var_340_22 <= arg_337_1.time_ and arg_337_1.time_ < var_340_22 + var_340_29 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_22) / var_340_29

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_22 + var_340_29 and arg_337_1.time_ < var_340_22 + var_340_29 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play413122084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 413122084
		arg_341_1.duration_ = 5.1

		local var_341_0 = {
			zh = 3.066,
			ja = 5.1
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
				arg_341_0:Play413122085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["10092_1"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos10092_1 = var_344_0.localPosition
				var_344_0.localScale = Vector3.New(1, 1, 1)

				arg_341_1:CheckSpriteTmpPos("10092_1", 4)

				local var_344_2 = var_344_0.childCount

				for iter_344_0 = 0, var_344_2 - 1 do
					local var_344_3 = var_344_0:GetChild(iter_344_0)

					if var_344_3.name == "" or not string.find(var_344_3.name, "split") then
						var_344_3.gameObject:SetActive(true)
					else
						var_344_3.gameObject:SetActive(false)
					end
				end
			end

			local var_344_4 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_4 then
				local var_344_5 = (arg_341_1.time_ - var_344_1) / var_344_4
				local var_344_6 = Vector3.New(390, -300, -295)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos10092_1, var_344_6, var_344_5)
			end

			if arg_341_1.time_ >= var_344_1 + var_344_4 and arg_341_1.time_ < var_344_1 + var_344_4 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_344_7 = arg_341_1.actors_["10092_1"]
			local var_344_8 = 0

			if var_344_8 < arg_341_1.time_ and arg_341_1.time_ <= var_344_8 + arg_344_0 and arg_341_1.var_.actorSpriteComps10092_1 == nil then
				arg_341_1.var_.actorSpriteComps10092_1 = var_344_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_9 = 2

			if var_344_8 <= arg_341_1.time_ and arg_341_1.time_ < var_344_8 + var_344_9 then
				local var_344_10 = (arg_341_1.time_ - var_344_8) / var_344_9

				if arg_341_1.var_.actorSpriteComps10092_1 then
					for iter_344_1, iter_344_2 in pairs(arg_341_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_344_2 then
							if arg_341_1.isInRecall_ then
								local var_344_11 = Mathf.Lerp(iter_344_2.color.r, 0.82, var_344_10)
								local var_344_12 = Mathf.Lerp(iter_344_2.color.g, 0.77, var_344_10)
								local var_344_13 = Mathf.Lerp(iter_344_2.color.b, 0.62, var_344_10)

								iter_344_2.color = Color.New(var_344_11, var_344_12, var_344_13)
							else
								local var_344_14 = Mathf.Lerp(iter_344_2.color.r, 1, var_344_10)

								iter_344_2.color = Color.New(var_344_14, var_344_14, var_344_14)
							end
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_8 + var_344_9 and arg_341_1.time_ < var_344_8 + var_344_9 + arg_344_0 and arg_341_1.var_.actorSpriteComps10092_1 then
				for iter_344_3, iter_344_4 in pairs(arg_341_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_344_4 then
						if arg_341_1.isInRecall_ then
							iter_344_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_344_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_341_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_344_15 = 0
			local var_344_16 = 0.325

			if var_344_15 < arg_341_1.time_ and arg_341_1.time_ <= var_344_15 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_17 = arg_341_1:FormatText(StoryNameCfg[996].name)

				arg_341_1.leftNameTxt_.text = var_344_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_18 = arg_341_1:GetWordFromCfg(413122084)
				local var_344_19 = arg_341_1:FormatText(var_344_18.content)

				arg_341_1.text_.text = var_344_19

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_20 = 13
				local var_344_21 = utf8.len(var_344_19)
				local var_344_22 = var_344_20 <= 0 and var_344_16 or var_344_16 * (var_344_21 / var_344_20)

				if var_344_22 > 0 and var_344_16 < var_344_22 then
					arg_341_1.talkMaxDuration = var_344_22

					if var_344_22 + var_344_15 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_22 + var_344_15
					end
				end

				arg_341_1.text_.text = var_344_19
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122084", "story_v_out_413122.awb") ~= 0 then
					local var_344_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122084", "story_v_out_413122.awb") / 1000

					if var_344_23 + var_344_15 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_23 + var_344_15
					end

					if var_344_18.prefab_name ~= "" and arg_341_1.actors_[var_344_18.prefab_name] ~= nil then
						local var_344_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_18.prefab_name].transform, "story_v_out_413122", "413122084", "story_v_out_413122.awb")

						arg_341_1:RecordAudio("413122084", var_344_24)
						arg_341_1:RecordAudio("413122084", var_344_24)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_413122", "413122084", "story_v_out_413122.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_413122", "413122084", "story_v_out_413122.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_25 = math.max(var_344_16, arg_341_1.talkMaxDuration)

			if var_344_15 <= arg_341_1.time_ and arg_341_1.time_ < var_344_15 + var_344_25 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_15) / var_344_25

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_15 + var_344_25 and arg_341_1.time_ < var_344_15 + var_344_25 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play413122085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 413122085
		arg_345_1.duration_ = 8.37

		local var_345_0 = {
			zh = 8.366,
			ja = 6.466
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
				arg_345_0:Play413122086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["10022"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos10022 = var_348_0.localPosition
				var_348_0.localScale = Vector3.New(1, 1, 1)

				arg_345_1:CheckSpriteTmpPos("10022", 2)

				local var_348_2 = var_348_0.childCount

				for iter_348_0 = 0, var_348_2 - 1 do
					local var_348_3 = var_348_0:GetChild(iter_348_0)

					if var_348_3.name == "split_6" or not string.find(var_348_3.name, "split") then
						var_348_3.gameObject:SetActive(true)
					else
						var_348_3.gameObject:SetActive(false)
					end
				end
			end

			local var_348_4 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_4 then
				local var_348_5 = (arg_345_1.time_ - var_348_1) / var_348_4
				local var_348_6 = Vector3.New(-390, -315, -320)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos10022, var_348_6, var_348_5)
			end

			if arg_345_1.time_ >= var_348_1 + var_348_4 and arg_345_1.time_ < var_348_1 + var_348_4 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_348_7 = arg_345_1.actors_["10092_1"].transform
			local var_348_8 = 0

			if var_348_8 < arg_345_1.time_ and arg_345_1.time_ <= var_348_8 + arg_348_0 then
				arg_345_1.var_.moveOldPos10092_1 = var_348_7.localPosition
				var_348_7.localScale = Vector3.New(1, 1, 1)

				arg_345_1:CheckSpriteTmpPos("10092_1", 4)

				local var_348_9 = var_348_7.childCount

				for iter_348_1 = 0, var_348_9 - 1 do
					local var_348_10 = var_348_7:GetChild(iter_348_1)

					if var_348_10.name == "" or not string.find(var_348_10.name, "split") then
						var_348_10.gameObject:SetActive(true)
					else
						var_348_10.gameObject:SetActive(false)
					end
				end
			end

			local var_348_11 = 0.001

			if var_348_8 <= arg_345_1.time_ and arg_345_1.time_ < var_348_8 + var_348_11 then
				local var_348_12 = (arg_345_1.time_ - var_348_8) / var_348_11
				local var_348_13 = Vector3.New(390, -300, -295)

				var_348_7.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos10092_1, var_348_13, var_348_12)
			end

			if arg_345_1.time_ >= var_348_8 + var_348_11 and arg_345_1.time_ < var_348_8 + var_348_11 + arg_348_0 then
				var_348_7.localPosition = Vector3.New(390, -300, -295)
			end

			local var_348_14 = arg_345_1.actors_["10022"]
			local var_348_15 = 0

			if var_348_15 < arg_345_1.time_ and arg_345_1.time_ <= var_348_15 + arg_348_0 and arg_345_1.var_.actorSpriteComps10022 == nil then
				arg_345_1.var_.actorSpriteComps10022 = var_348_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_16 = 2

			if var_348_15 <= arg_345_1.time_ and arg_345_1.time_ < var_348_15 + var_348_16 then
				local var_348_17 = (arg_345_1.time_ - var_348_15) / var_348_16

				if arg_345_1.var_.actorSpriteComps10022 then
					for iter_348_2, iter_348_3 in pairs(arg_345_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_348_3 then
							if arg_345_1.isInRecall_ then
								local var_348_18 = Mathf.Lerp(iter_348_3.color.r, 0.82, var_348_17)
								local var_348_19 = Mathf.Lerp(iter_348_3.color.g, 0.77, var_348_17)
								local var_348_20 = Mathf.Lerp(iter_348_3.color.b, 0.62, var_348_17)

								iter_348_3.color = Color.New(var_348_18, var_348_19, var_348_20)
							else
								local var_348_21 = Mathf.Lerp(iter_348_3.color.r, 1, var_348_17)

								iter_348_3.color = Color.New(var_348_21, var_348_21, var_348_21)
							end
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_15 + var_348_16 and arg_345_1.time_ < var_348_15 + var_348_16 + arg_348_0 and arg_345_1.var_.actorSpriteComps10022 then
				for iter_348_4, iter_348_5 in pairs(arg_345_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_348_5 then
						if arg_345_1.isInRecall_ then
							iter_348_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_348_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_345_1.var_.actorSpriteComps10022 = nil
			end

			local var_348_22 = arg_345_1.actors_["10092_1"]
			local var_348_23 = 0

			if var_348_23 < arg_345_1.time_ and arg_345_1.time_ <= var_348_23 + arg_348_0 and arg_345_1.var_.actorSpriteComps10092_1 == nil then
				arg_345_1.var_.actorSpriteComps10092_1 = var_348_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_24 = 2

			if var_348_23 <= arg_345_1.time_ and arg_345_1.time_ < var_348_23 + var_348_24 then
				local var_348_25 = (arg_345_1.time_ - var_348_23) / var_348_24

				if arg_345_1.var_.actorSpriteComps10092_1 then
					for iter_348_6, iter_348_7 in pairs(arg_345_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_348_7 then
							if arg_345_1.isInRecall_ then
								local var_348_26 = Mathf.Lerp(iter_348_7.color.r, 0.46, var_348_25)
								local var_348_27 = Mathf.Lerp(iter_348_7.color.g, 0.43, var_348_25)
								local var_348_28 = Mathf.Lerp(iter_348_7.color.b, 0.35, var_348_25)

								iter_348_7.color = Color.New(var_348_26, var_348_27, var_348_28)
							else
								local var_348_29 = Mathf.Lerp(iter_348_7.color.r, 0.5, var_348_25)

								iter_348_7.color = Color.New(var_348_29, var_348_29, var_348_29)
							end
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_23 + var_348_24 and arg_345_1.time_ < var_348_23 + var_348_24 + arg_348_0 and arg_345_1.var_.actorSpriteComps10092_1 then
				for iter_348_8, iter_348_9 in pairs(arg_345_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_348_9 then
						if arg_345_1.isInRecall_ then
							iter_348_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_348_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_345_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_348_30 = arg_345_1.actors_["10092_1"].transform
			local var_348_31 = 0

			if var_348_31 < arg_345_1.time_ and arg_345_1.time_ <= var_348_31 + arg_348_0 then
				arg_345_1.var_.moveOldPos10092_1 = var_348_30.localPosition
				var_348_30.localScale = Vector3.New(1, 1, 1)

				arg_345_1:CheckSpriteTmpPos("10092_1", 4)

				local var_348_32 = var_348_30.childCount

				for iter_348_10 = 0, var_348_32 - 1 do
					local var_348_33 = var_348_30:GetChild(iter_348_10)

					if var_348_33.name == "" or not string.find(var_348_33.name, "split") then
						var_348_33.gameObject:SetActive(true)
					else
						var_348_33.gameObject:SetActive(false)
					end
				end
			end

			local var_348_34 = 0.001

			if var_348_31 <= arg_345_1.time_ and arg_345_1.time_ < var_348_31 + var_348_34 then
				local var_348_35 = (arg_345_1.time_ - var_348_31) / var_348_34
				local var_348_36 = Vector3.New(390, -300, -295)

				var_348_30.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos10092_1, var_348_36, var_348_35)
			end

			if arg_345_1.time_ >= var_348_31 + var_348_34 and arg_345_1.time_ < var_348_31 + var_348_34 + arg_348_0 then
				var_348_30.localPosition = Vector3.New(390, -300, -295)
			end

			local var_348_37 = 0
			local var_348_38 = 1.075

			if var_348_37 < arg_345_1.time_ and arg_345_1.time_ <= var_348_37 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_39 = arg_345_1:FormatText(StoryNameCfg[614].name)

				arg_345_1.leftNameTxt_.text = var_348_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_40 = arg_345_1:GetWordFromCfg(413122085)
				local var_348_41 = arg_345_1:FormatText(var_348_40.content)

				arg_345_1.text_.text = var_348_41

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_42 = 43
				local var_348_43 = utf8.len(var_348_41)
				local var_348_44 = var_348_42 <= 0 and var_348_38 or var_348_38 * (var_348_43 / var_348_42)

				if var_348_44 > 0 and var_348_38 < var_348_44 then
					arg_345_1.talkMaxDuration = var_348_44

					if var_348_44 + var_348_37 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_44 + var_348_37
					end
				end

				arg_345_1.text_.text = var_348_41
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122085", "story_v_out_413122.awb") ~= 0 then
					local var_348_45 = manager.audio:GetVoiceLength("story_v_out_413122", "413122085", "story_v_out_413122.awb") / 1000

					if var_348_45 + var_348_37 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_45 + var_348_37
					end

					if var_348_40.prefab_name ~= "" and arg_345_1.actors_[var_348_40.prefab_name] ~= nil then
						local var_348_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_40.prefab_name].transform, "story_v_out_413122", "413122085", "story_v_out_413122.awb")

						arg_345_1:RecordAudio("413122085", var_348_46)
						arg_345_1:RecordAudio("413122085", var_348_46)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_413122", "413122085", "story_v_out_413122.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_413122", "413122085", "story_v_out_413122.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_47 = math.max(var_348_38, arg_345_1.talkMaxDuration)

			if var_348_37 <= arg_345_1.time_ and arg_345_1.time_ < var_348_37 + var_348_47 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_37) / var_348_47

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_37 + var_348_47 and arg_345_1.time_ < var_348_37 + var_348_47 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play413122086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 413122086
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play413122087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["10092_1"].transform
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos10092_1 = var_352_0.localPosition
				var_352_0.localScale = Vector3.New(1, 1, 1)

				arg_349_1:CheckSpriteTmpPos("10092_1", 7)

				local var_352_2 = var_352_0.childCount

				for iter_352_0 = 0, var_352_2 - 1 do
					local var_352_3 = var_352_0:GetChild(iter_352_0)

					if var_352_3.name == "" or not string.find(var_352_3.name, "split") then
						var_352_3.gameObject:SetActive(true)
					else
						var_352_3.gameObject:SetActive(false)
					end
				end
			end

			local var_352_4 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_4 then
				local var_352_5 = (arg_349_1.time_ - var_352_1) / var_352_4
				local var_352_6 = Vector3.New(0, -2000, 0)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos10092_1, var_352_6, var_352_5)
			end

			if arg_349_1.time_ >= var_352_1 + var_352_4 and arg_349_1.time_ < var_352_1 + var_352_4 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_352_7 = arg_349_1.actors_["10022"].transform
			local var_352_8 = 0

			if var_352_8 < arg_349_1.time_ and arg_349_1.time_ <= var_352_8 + arg_352_0 then
				arg_349_1.var_.moveOldPos10022 = var_352_7.localPosition
				var_352_7.localScale = Vector3.New(1, 1, 1)

				arg_349_1:CheckSpriteTmpPos("10022", 7)

				local var_352_9 = var_352_7.childCount

				for iter_352_1 = 0, var_352_9 - 1 do
					local var_352_10 = var_352_7:GetChild(iter_352_1)

					if var_352_10.name == "split_3" or not string.find(var_352_10.name, "split") then
						var_352_10.gameObject:SetActive(true)
					else
						var_352_10.gameObject:SetActive(false)
					end
				end
			end

			local var_352_11 = 0.001

			if var_352_8 <= arg_349_1.time_ and arg_349_1.time_ < var_352_8 + var_352_11 then
				local var_352_12 = (arg_349_1.time_ - var_352_8) / var_352_11
				local var_352_13 = Vector3.New(0, -2000, 0)

				var_352_7.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos10022, var_352_13, var_352_12)
			end

			if arg_349_1.time_ >= var_352_8 + var_352_11 and arg_349_1.time_ < var_352_8 + var_352_11 + arg_352_0 then
				var_352_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_352_14 = 0
			local var_352_15 = 0.975

			if var_352_14 < arg_349_1.time_ and arg_349_1.time_ <= var_352_14 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, false)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_16 = arg_349_1:GetWordFromCfg(413122086)
				local var_352_17 = arg_349_1:FormatText(var_352_16.content)

				arg_349_1.text_.text = var_352_17

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_18 = 39
				local var_352_19 = utf8.len(var_352_17)
				local var_352_20 = var_352_18 <= 0 and var_352_15 or var_352_15 * (var_352_19 / var_352_18)

				if var_352_20 > 0 and var_352_15 < var_352_20 then
					arg_349_1.talkMaxDuration = var_352_20

					if var_352_20 + var_352_14 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_20 + var_352_14
					end
				end

				arg_349_1.text_.text = var_352_17
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_21 = math.max(var_352_15, arg_349_1.talkMaxDuration)

			if var_352_14 <= arg_349_1.time_ and arg_349_1.time_ < var_352_14 + var_352_21 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_14) / var_352_21

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_14 + var_352_21 and arg_349_1.time_ < var_352_14 + var_352_21 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play413122087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 413122087
		arg_353_1.duration_ = 6.93

		local var_353_0 = {
			zh = 5.366,
			ja = 6.933
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
				arg_353_0:Play413122088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["10092_1"].transform
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.var_.moveOldPos10092_1 = var_356_0.localPosition
				var_356_0.localScale = Vector3.New(1, 1, 1)

				arg_353_1:CheckSpriteTmpPos("10092_1", 2)

				local var_356_2 = var_356_0.childCount

				for iter_356_0 = 0, var_356_2 - 1 do
					local var_356_3 = var_356_0:GetChild(iter_356_0)

					if var_356_3.name == "split_1_1" or not string.find(var_356_3.name, "split") then
						var_356_3.gameObject:SetActive(true)
					else
						var_356_3.gameObject:SetActive(false)
					end
				end
			end

			local var_356_4 = 0.001

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_4 then
				local var_356_5 = (arg_353_1.time_ - var_356_1) / var_356_4
				local var_356_6 = Vector3.New(-389.49, -300, -295)

				var_356_0.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos10092_1, var_356_6, var_356_5)
			end

			if arg_353_1.time_ >= var_356_1 + var_356_4 and arg_353_1.time_ < var_356_1 + var_356_4 + arg_356_0 then
				var_356_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_356_7 = arg_353_1.actors_["10092_1"]
			local var_356_8 = 0

			if var_356_8 < arg_353_1.time_ and arg_353_1.time_ <= var_356_8 + arg_356_0 and arg_353_1.var_.actorSpriteComps10092_1 == nil then
				arg_353_1.var_.actorSpriteComps10092_1 = var_356_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_356_9 = 2

			if var_356_8 <= arg_353_1.time_ and arg_353_1.time_ < var_356_8 + var_356_9 then
				local var_356_10 = (arg_353_1.time_ - var_356_8) / var_356_9

				if arg_353_1.var_.actorSpriteComps10092_1 then
					for iter_356_1, iter_356_2 in pairs(arg_353_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_356_2 then
							if arg_353_1.isInRecall_ then
								local var_356_11 = Mathf.Lerp(iter_356_2.color.r, 0.82, var_356_10)
								local var_356_12 = Mathf.Lerp(iter_356_2.color.g, 0.77, var_356_10)
								local var_356_13 = Mathf.Lerp(iter_356_2.color.b, 0.62, var_356_10)

								iter_356_2.color = Color.New(var_356_11, var_356_12, var_356_13)
							else
								local var_356_14 = Mathf.Lerp(iter_356_2.color.r, 1, var_356_10)

								iter_356_2.color = Color.New(var_356_14, var_356_14, var_356_14)
							end
						end
					end
				end
			end

			if arg_353_1.time_ >= var_356_8 + var_356_9 and arg_353_1.time_ < var_356_8 + var_356_9 + arg_356_0 and arg_353_1.var_.actorSpriteComps10092_1 then
				for iter_356_3, iter_356_4 in pairs(arg_353_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_356_4 then
						if arg_353_1.isInRecall_ then
							iter_356_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_356_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_353_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_356_15 = 0
			local var_356_16 = 0.55

			if var_356_15 < arg_353_1.time_ and arg_353_1.time_ <= var_356_15 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_17 = arg_353_1:FormatText(StoryNameCfg[996].name)

				arg_353_1.leftNameTxt_.text = var_356_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_18 = arg_353_1:GetWordFromCfg(413122087)
				local var_356_19 = arg_353_1:FormatText(var_356_18.content)

				arg_353_1.text_.text = var_356_19

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_20 = 22
				local var_356_21 = utf8.len(var_356_19)
				local var_356_22 = var_356_20 <= 0 and var_356_16 or var_356_16 * (var_356_21 / var_356_20)

				if var_356_22 > 0 and var_356_16 < var_356_22 then
					arg_353_1.talkMaxDuration = var_356_22

					if var_356_22 + var_356_15 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_22 + var_356_15
					end
				end

				arg_353_1.text_.text = var_356_19
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122087", "story_v_out_413122.awb") ~= 0 then
					local var_356_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122087", "story_v_out_413122.awb") / 1000

					if var_356_23 + var_356_15 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_23 + var_356_15
					end

					if var_356_18.prefab_name ~= "" and arg_353_1.actors_[var_356_18.prefab_name] ~= nil then
						local var_356_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_18.prefab_name].transform, "story_v_out_413122", "413122087", "story_v_out_413122.awb")

						arg_353_1:RecordAudio("413122087", var_356_24)
						arg_353_1:RecordAudio("413122087", var_356_24)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_413122", "413122087", "story_v_out_413122.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_413122", "413122087", "story_v_out_413122.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_25 = math.max(var_356_16, arg_353_1.talkMaxDuration)

			if var_356_15 <= arg_353_1.time_ and arg_353_1.time_ < var_356_15 + var_356_25 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_15) / var_356_25

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_15 + var_356_25 and arg_353_1.time_ < var_356_15 + var_356_25 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play413122088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 413122088
		arg_357_1.duration_ = 3.7

		local var_357_0 = {
			zh = 3.366,
			ja = 3.7
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
				arg_357_0:Play413122089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["10092_1"].transform
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				arg_357_1.var_.moveOldPos10092_1 = var_360_0.localPosition
				var_360_0.localScale = Vector3.New(1, 1, 1)

				arg_357_1:CheckSpriteTmpPos("10092_1", 2)

				local var_360_2 = var_360_0.childCount

				for iter_360_0 = 0, var_360_2 - 1 do
					local var_360_3 = var_360_0:GetChild(iter_360_0)

					if var_360_3.name == "" or not string.find(var_360_3.name, "split") then
						var_360_3.gameObject:SetActive(true)
					else
						var_360_3.gameObject:SetActive(false)
					end
				end
			end

			local var_360_4 = 0.001

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_4 then
				local var_360_5 = (arg_357_1.time_ - var_360_1) / var_360_4
				local var_360_6 = Vector3.New(-389.49, -300, -295)

				var_360_0.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos10092_1, var_360_6, var_360_5)
			end

			if arg_357_1.time_ >= var_360_1 + var_360_4 and arg_357_1.time_ < var_360_1 + var_360_4 + arg_360_0 then
				var_360_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_360_7 = arg_357_1.actors_["10092_1"]
			local var_360_8 = 0

			if var_360_8 < arg_357_1.time_ and arg_357_1.time_ <= var_360_8 + arg_360_0 and arg_357_1.var_.actorSpriteComps10092_1 == nil then
				arg_357_1.var_.actorSpriteComps10092_1 = var_360_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_360_9 = 2

			if var_360_8 <= arg_357_1.time_ and arg_357_1.time_ < var_360_8 + var_360_9 then
				local var_360_10 = (arg_357_1.time_ - var_360_8) / var_360_9

				if arg_357_1.var_.actorSpriteComps10092_1 then
					for iter_360_1, iter_360_2 in pairs(arg_357_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_360_2 then
							if arg_357_1.isInRecall_ then
								local var_360_11 = Mathf.Lerp(iter_360_2.color.r, 0.46, var_360_10)
								local var_360_12 = Mathf.Lerp(iter_360_2.color.g, 0.43, var_360_10)
								local var_360_13 = Mathf.Lerp(iter_360_2.color.b, 0.35, var_360_10)

								iter_360_2.color = Color.New(var_360_11, var_360_12, var_360_13)
							else
								local var_360_14 = Mathf.Lerp(iter_360_2.color.r, 0.5, var_360_10)

								iter_360_2.color = Color.New(var_360_14, var_360_14, var_360_14)
							end
						end
					end
				end
			end

			if arg_357_1.time_ >= var_360_8 + var_360_9 and arg_357_1.time_ < var_360_8 + var_360_9 + arg_360_0 and arg_357_1.var_.actorSpriteComps10092_1 then
				for iter_360_3, iter_360_4 in pairs(arg_357_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_360_4 then
						if arg_357_1.isInRecall_ then
							iter_360_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_360_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_357_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_360_15 = arg_357_1.actors_["10094"]
			local var_360_16 = 0

			if var_360_16 < arg_357_1.time_ and arg_357_1.time_ <= var_360_16 + arg_360_0 and arg_357_1.var_.actorSpriteComps10094 == nil then
				arg_357_1.var_.actorSpriteComps10094 = var_360_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_360_17 = 2

			if var_360_16 <= arg_357_1.time_ and arg_357_1.time_ < var_360_16 + var_360_17 then
				local var_360_18 = (arg_357_1.time_ - var_360_16) / var_360_17

				if arg_357_1.var_.actorSpriteComps10094 then
					for iter_360_5, iter_360_6 in pairs(arg_357_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_360_6 then
							if arg_357_1.isInRecall_ then
								local var_360_19 = Mathf.Lerp(iter_360_6.color.r, 0.82, var_360_18)
								local var_360_20 = Mathf.Lerp(iter_360_6.color.g, 0.77, var_360_18)
								local var_360_21 = Mathf.Lerp(iter_360_6.color.b, 0.62, var_360_18)

								iter_360_6.color = Color.New(var_360_19, var_360_20, var_360_21)
							else
								local var_360_22 = Mathf.Lerp(iter_360_6.color.r, 1, var_360_18)

								iter_360_6.color = Color.New(var_360_22, var_360_22, var_360_22)
							end
						end
					end
				end
			end

			if arg_357_1.time_ >= var_360_16 + var_360_17 and arg_357_1.time_ < var_360_16 + var_360_17 + arg_360_0 and arg_357_1.var_.actorSpriteComps10094 then
				for iter_360_7, iter_360_8 in pairs(arg_357_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_360_8 then
						if arg_357_1.isInRecall_ then
							iter_360_8.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_360_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_357_1.var_.actorSpriteComps10094 = nil
			end

			local var_360_23 = arg_357_1.actors_["10094"].transform
			local var_360_24 = 0

			if var_360_24 < arg_357_1.time_ and arg_357_1.time_ <= var_360_24 + arg_360_0 then
				arg_357_1.var_.moveOldPos10094 = var_360_23.localPosition
				var_360_23.localScale = Vector3.New(1, 1, 1)

				arg_357_1:CheckSpriteTmpPos("10094", 4)

				local var_360_25 = var_360_23.childCount

				for iter_360_9 = 0, var_360_25 - 1 do
					local var_360_26 = var_360_23:GetChild(iter_360_9)

					if var_360_26.name == "" or not string.find(var_360_26.name, "split") then
						var_360_26.gameObject:SetActive(true)
					else
						var_360_26.gameObject:SetActive(false)
					end
				end
			end

			local var_360_27 = 0.001

			if var_360_24 <= arg_357_1.time_ and arg_357_1.time_ < var_360_24 + var_360_27 then
				local var_360_28 = (arg_357_1.time_ - var_360_24) / var_360_27
				local var_360_29 = Vector3.New(390, -340, -414)

				var_360_23.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos10094, var_360_29, var_360_28)
			end

			if arg_357_1.time_ >= var_360_24 + var_360_27 and arg_357_1.time_ < var_360_24 + var_360_27 + arg_360_0 then
				var_360_23.localPosition = Vector3.New(390, -340, -414)
			end

			local var_360_30 = 0
			local var_360_31 = 0.45

			if var_360_30 < arg_357_1.time_ and arg_357_1.time_ <= var_360_30 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_32 = arg_357_1:FormatText(StoryNameCfg[259].name)

				arg_357_1.leftNameTxt_.text = var_360_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_33 = arg_357_1:GetWordFromCfg(413122088)
				local var_360_34 = arg_357_1:FormatText(var_360_33.content)

				arg_357_1.text_.text = var_360_34

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_35 = 18
				local var_360_36 = utf8.len(var_360_34)
				local var_360_37 = var_360_35 <= 0 and var_360_31 or var_360_31 * (var_360_36 / var_360_35)

				if var_360_37 > 0 and var_360_31 < var_360_37 then
					arg_357_1.talkMaxDuration = var_360_37

					if var_360_37 + var_360_30 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_37 + var_360_30
					end
				end

				arg_357_1.text_.text = var_360_34
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122088", "story_v_out_413122.awb") ~= 0 then
					local var_360_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122088", "story_v_out_413122.awb") / 1000

					if var_360_38 + var_360_30 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_38 + var_360_30
					end

					if var_360_33.prefab_name ~= "" and arg_357_1.actors_[var_360_33.prefab_name] ~= nil then
						local var_360_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_33.prefab_name].transform, "story_v_out_413122", "413122088", "story_v_out_413122.awb")

						arg_357_1:RecordAudio("413122088", var_360_39)
						arg_357_1:RecordAudio("413122088", var_360_39)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_413122", "413122088", "story_v_out_413122.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_413122", "413122088", "story_v_out_413122.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_40 = math.max(var_360_31, arg_357_1.talkMaxDuration)

			if var_360_30 <= arg_357_1.time_ and arg_357_1.time_ < var_360_30 + var_360_40 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_30) / var_360_40

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_30 + var_360_40 and arg_357_1.time_ < var_360_30 + var_360_40 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play413122089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 413122089
		arg_361_1.duration_ = 2.87

		local var_361_0 = {
			zh = 2.866,
			ja = 2.533
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
				arg_361_0:Play413122090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["10093"].transform
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 then
				arg_361_1.var_.moveOldPos10093 = var_364_0.localPosition
				var_364_0.localScale = Vector3.New(1, 1, 1)

				arg_361_1:CheckSpriteTmpPos("10093", 4)

				local var_364_2 = var_364_0.childCount

				for iter_364_0 = 0, var_364_2 - 1 do
					local var_364_3 = var_364_0:GetChild(iter_364_0)

					if var_364_3.name == "" or not string.find(var_364_3.name, "split") then
						var_364_3.gameObject:SetActive(true)
					else
						var_364_3.gameObject:SetActive(false)
					end
				end
			end

			local var_364_4 = 0.001

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_4 then
				local var_364_5 = (arg_361_1.time_ - var_364_1) / var_364_4
				local var_364_6 = Vector3.New(390, -345, -245)

				var_364_0.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos10093, var_364_6, var_364_5)
			end

			if arg_361_1.time_ >= var_364_1 + var_364_4 and arg_361_1.time_ < var_364_1 + var_364_4 + arg_364_0 then
				var_364_0.localPosition = Vector3.New(390, -345, -245)
			end

			local var_364_7 = arg_361_1.actors_["10092_1"].transform
			local var_364_8 = 0

			if var_364_8 < arg_361_1.time_ and arg_361_1.time_ <= var_364_8 + arg_364_0 then
				arg_361_1.var_.moveOldPos10092_1 = var_364_7.localPosition
				var_364_7.localScale = Vector3.New(1, 1, 1)

				arg_361_1:CheckSpriteTmpPos("10092_1", 7)

				local var_364_9 = var_364_7.childCount

				for iter_364_1 = 0, var_364_9 - 1 do
					local var_364_10 = var_364_7:GetChild(iter_364_1)

					if var_364_10.name == "" or not string.find(var_364_10.name, "split") then
						var_364_10.gameObject:SetActive(true)
					else
						var_364_10.gameObject:SetActive(false)
					end
				end
			end

			local var_364_11 = 0.001

			if var_364_8 <= arg_361_1.time_ and arg_361_1.time_ < var_364_8 + var_364_11 then
				local var_364_12 = (arg_361_1.time_ - var_364_8) / var_364_11
				local var_364_13 = Vector3.New(0, -2000, 0)

				var_364_7.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos10092_1, var_364_13, var_364_12)
			end

			if arg_361_1.time_ >= var_364_8 + var_364_11 and arg_361_1.time_ < var_364_8 + var_364_11 + arg_364_0 then
				var_364_7.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_364_14 = arg_361_1.actors_["10093"]
			local var_364_15 = 0

			if var_364_15 < arg_361_1.time_ and arg_361_1.time_ <= var_364_15 + arg_364_0 and arg_361_1.var_.actorSpriteComps10093 == nil then
				arg_361_1.var_.actorSpriteComps10093 = var_364_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_364_16 = 2

			if var_364_15 <= arg_361_1.time_ and arg_361_1.time_ < var_364_15 + var_364_16 then
				local var_364_17 = (arg_361_1.time_ - var_364_15) / var_364_16

				if arg_361_1.var_.actorSpriteComps10093 then
					for iter_364_2, iter_364_3 in pairs(arg_361_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_364_3 then
							if arg_361_1.isInRecall_ then
								local var_364_18 = Mathf.Lerp(iter_364_3.color.r, 0.82, var_364_17)
								local var_364_19 = Mathf.Lerp(iter_364_3.color.g, 0.77, var_364_17)
								local var_364_20 = Mathf.Lerp(iter_364_3.color.b, 0.62, var_364_17)

								iter_364_3.color = Color.New(var_364_18, var_364_19, var_364_20)
							else
								local var_364_21 = Mathf.Lerp(iter_364_3.color.r, 1, var_364_17)

								iter_364_3.color = Color.New(var_364_21, var_364_21, var_364_21)
							end
						end
					end
				end
			end

			if arg_361_1.time_ >= var_364_15 + var_364_16 and arg_361_1.time_ < var_364_15 + var_364_16 + arg_364_0 and arg_361_1.var_.actorSpriteComps10093 then
				for iter_364_4, iter_364_5 in pairs(arg_361_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_364_5 then
						if arg_361_1.isInRecall_ then
							iter_364_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_364_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_361_1.var_.actorSpriteComps10093 = nil
			end

			local var_364_22 = arg_361_1.actors_["10093"].transform
			local var_364_23 = 0

			if var_364_23 < arg_361_1.time_ and arg_361_1.time_ <= var_364_23 + arg_364_0 then
				arg_361_1.var_.moveOldPos10093 = var_364_22.localPosition
				var_364_22.localScale = Vector3.New(1, 1, 1)

				arg_361_1:CheckSpriteTmpPos("10093", 3)

				local var_364_24 = var_364_22.childCount

				for iter_364_6 = 0, var_364_24 - 1 do
					local var_364_25 = var_364_22:GetChild(iter_364_6)

					if var_364_25.name == "split_4" or not string.find(var_364_25.name, "split") then
						var_364_25.gameObject:SetActive(true)
					else
						var_364_25.gameObject:SetActive(false)
					end
				end
			end

			local var_364_26 = 0.001

			if var_364_23 <= arg_361_1.time_ and arg_361_1.time_ < var_364_23 + var_364_26 then
				local var_364_27 = (arg_361_1.time_ - var_364_23) / var_364_26
				local var_364_28 = Vector3.New(0, -345, -245)

				var_364_22.localPosition = Vector3.Lerp(arg_361_1.var_.moveOldPos10093, var_364_28, var_364_27)
			end

			if arg_361_1.time_ >= var_364_23 + var_364_26 and arg_361_1.time_ < var_364_23 + var_364_26 + arg_364_0 then
				var_364_22.localPosition = Vector3.New(0, -345, -245)
			end

			local var_364_29 = 0
			local var_364_30 = 0.35

			if var_364_29 < arg_361_1.time_ and arg_361_1.time_ <= var_364_29 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_31 = arg_361_1:FormatText(StoryNameCfg[28].name)

				arg_361_1.leftNameTxt_.text = var_364_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_32 = arg_361_1:GetWordFromCfg(413122089)
				local var_364_33 = arg_361_1:FormatText(var_364_32.content)

				arg_361_1.text_.text = var_364_33

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_34 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122089", "story_v_out_413122.awb") ~= 0 then
					local var_364_37 = manager.audio:GetVoiceLength("story_v_out_413122", "413122089", "story_v_out_413122.awb") / 1000

					if var_364_37 + var_364_29 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_37 + var_364_29
					end

					if var_364_32.prefab_name ~= "" and arg_361_1.actors_[var_364_32.prefab_name] ~= nil then
						local var_364_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_32.prefab_name].transform, "story_v_out_413122", "413122089", "story_v_out_413122.awb")

						arg_361_1:RecordAudio("413122089", var_364_38)
						arg_361_1:RecordAudio("413122089", var_364_38)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_413122", "413122089", "story_v_out_413122.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_413122", "413122089", "story_v_out_413122.awb")
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
	Play413122090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 413122090
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play413122091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["10093"].transform
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 then
				arg_365_1.var_.moveOldPos10093 = var_368_0.localPosition
				var_368_0.localScale = Vector3.New(1, 1, 1)

				arg_365_1:CheckSpriteTmpPos("10093", 6)

				local var_368_2 = var_368_0.childCount

				for iter_368_0 = 0, var_368_2 - 1 do
					local var_368_3 = var_368_0:GetChild(iter_368_0)

					if var_368_3.name == "" or not string.find(var_368_3.name, "split") then
						var_368_3.gameObject:SetActive(true)
					else
						var_368_3.gameObject:SetActive(false)
					end
				end
			end

			local var_368_4 = 0.001

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_4 then
				local var_368_5 = (arg_365_1.time_ - var_368_1) / var_368_4
				local var_368_6 = Vector3.New(1500, -345, -245)

				var_368_0.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos10093, var_368_6, var_368_5)
			end

			if arg_365_1.time_ >= var_368_1 + var_368_4 and arg_365_1.time_ < var_368_1 + var_368_4 + arg_368_0 then
				var_368_0.localPosition = Vector3.New(1500, -345, -245)
			end

			local var_368_7 = arg_365_1.actors_["10092_1"].transform
			local var_368_8 = 0

			if var_368_8 < arg_365_1.time_ and arg_365_1.time_ <= var_368_8 + arg_368_0 then
				arg_365_1.var_.moveOldPos10092_1 = var_368_7.localPosition
				var_368_7.localScale = Vector3.New(1, 1, 1)

				arg_365_1:CheckSpriteTmpPos("10092_1", 6)

				local var_368_9 = var_368_7.childCount

				for iter_368_1 = 0, var_368_9 - 1 do
					local var_368_10 = var_368_7:GetChild(iter_368_1)

					if var_368_10.name == "" or not string.find(var_368_10.name, "split") then
						var_368_10.gameObject:SetActive(true)
					else
						var_368_10.gameObject:SetActive(false)
					end
				end
			end

			local var_368_11 = 0.001

			if var_368_8 <= arg_365_1.time_ and arg_365_1.time_ < var_368_8 + var_368_11 then
				local var_368_12 = (arg_365_1.time_ - var_368_8) / var_368_11
				local var_368_13 = Vector3.New(1500, -300, -295)

				var_368_7.localPosition = Vector3.Lerp(arg_365_1.var_.moveOldPos10092_1, var_368_13, var_368_12)
			end

			if arg_365_1.time_ >= var_368_8 + var_368_11 and arg_365_1.time_ < var_368_8 + var_368_11 + arg_368_0 then
				var_368_7.localPosition = Vector3.New(1500, -300, -295)
			end

			local var_368_14 = arg_365_1.actors_["10093"]
			local var_368_15 = 0

			if var_368_15 < arg_365_1.time_ and arg_365_1.time_ <= var_368_15 + arg_368_0 and arg_365_1.var_.actorSpriteComps10093 == nil then
				arg_365_1.var_.actorSpriteComps10093 = var_368_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_368_16 = 2

			if var_368_15 <= arg_365_1.time_ and arg_365_1.time_ < var_368_15 + var_368_16 then
				local var_368_17 = (arg_365_1.time_ - var_368_15) / var_368_16

				if arg_365_1.var_.actorSpriteComps10093 then
					for iter_368_2, iter_368_3 in pairs(arg_365_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_368_3 then
							if arg_365_1.isInRecall_ then
								local var_368_18 = Mathf.Lerp(iter_368_3.color.r, 0.46, var_368_17)
								local var_368_19 = Mathf.Lerp(iter_368_3.color.g, 0.43, var_368_17)
								local var_368_20 = Mathf.Lerp(iter_368_3.color.b, 0.35, var_368_17)

								iter_368_3.color = Color.New(var_368_18, var_368_19, var_368_20)
							else
								local var_368_21 = Mathf.Lerp(iter_368_3.color.r, 0.5, var_368_17)

								iter_368_3.color = Color.New(var_368_21, var_368_21, var_368_21)
							end
						end
					end
				end
			end

			if arg_365_1.time_ >= var_368_15 + var_368_16 and arg_365_1.time_ < var_368_15 + var_368_16 + arg_368_0 and arg_365_1.var_.actorSpriteComps10093 then
				for iter_368_4, iter_368_5 in pairs(arg_365_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_368_5 then
						if arg_365_1.isInRecall_ then
							iter_368_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_368_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_365_1.var_.actorSpriteComps10093 = nil
			end

			local var_368_22 = arg_365_1.actors_["10092_1"]
			local var_368_23 = 0

			if var_368_23 < arg_365_1.time_ and arg_365_1.time_ <= var_368_23 + arg_368_0 and arg_365_1.var_.actorSpriteComps10092_1 == nil then
				arg_365_1.var_.actorSpriteComps10092_1 = var_368_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_368_24 = 2

			if var_368_23 <= arg_365_1.time_ and arg_365_1.time_ < var_368_23 + var_368_24 then
				local var_368_25 = (arg_365_1.time_ - var_368_23) / var_368_24

				if arg_365_1.var_.actorSpriteComps10092_1 then
					for iter_368_6, iter_368_7 in pairs(arg_365_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_368_7 then
							if arg_365_1.isInRecall_ then
								local var_368_26 = Mathf.Lerp(iter_368_7.color.r, 0.46, var_368_25)
								local var_368_27 = Mathf.Lerp(iter_368_7.color.g, 0.43, var_368_25)
								local var_368_28 = Mathf.Lerp(iter_368_7.color.b, 0.35, var_368_25)

								iter_368_7.color = Color.New(var_368_26, var_368_27, var_368_28)
							else
								local var_368_29 = Mathf.Lerp(iter_368_7.color.r, 0.5, var_368_25)

								iter_368_7.color = Color.New(var_368_29, var_368_29, var_368_29)
							end
						end
					end
				end
			end

			if arg_365_1.time_ >= var_368_23 + var_368_24 and arg_365_1.time_ < var_368_23 + var_368_24 + arg_368_0 and arg_365_1.var_.actorSpriteComps10092_1 then
				for iter_368_8, iter_368_9 in pairs(arg_365_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_368_9 then
						if arg_365_1.isInRecall_ then
							iter_368_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_368_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_365_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_368_30 = 0
			local var_368_31 = 1.1

			if var_368_30 < arg_365_1.time_ and arg_365_1.time_ <= var_368_30 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, false)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_32 = arg_365_1:GetWordFromCfg(413122090)
				local var_368_33 = arg_365_1:FormatText(var_368_32.content)

				arg_365_1.text_.text = var_368_33

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_34 = 44
				local var_368_35 = utf8.len(var_368_33)
				local var_368_36 = var_368_34 <= 0 and var_368_31 or var_368_31 * (var_368_35 / var_368_34)

				if var_368_36 > 0 and var_368_31 < var_368_36 then
					arg_365_1.talkMaxDuration = var_368_36

					if var_368_36 + var_368_30 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_36 + var_368_30
					end
				end

				arg_365_1.text_.text = var_368_33
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)
				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_37 = math.max(var_368_31, arg_365_1.talkMaxDuration)

			if var_368_30 <= arg_365_1.time_ and arg_365_1.time_ < var_368_30 + var_368_37 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_30) / var_368_37

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_30 + var_368_37 and arg_365_1.time_ < var_368_30 + var_368_37 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play413122091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 413122091
		arg_369_1.duration_ = 6.4

		local var_369_0 = {
			zh = 5.266,
			ja = 6.4
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
				arg_369_0:Play413122092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["10022"].transform
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.var_.moveOldPos10022 = var_372_0.localPosition
				var_372_0.localScale = Vector3.New(1, 1, 1)

				arg_369_1:CheckSpriteTmpPos("10022", 3)

				local var_372_2 = var_372_0.childCount

				for iter_372_0 = 0, var_372_2 - 1 do
					local var_372_3 = var_372_0:GetChild(iter_372_0)

					if var_372_3.name == "split_6" or not string.find(var_372_3.name, "split") then
						var_372_3.gameObject:SetActive(true)
					else
						var_372_3.gameObject:SetActive(false)
					end
				end
			end

			local var_372_4 = 0.001

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_4 then
				local var_372_5 = (arg_369_1.time_ - var_372_1) / var_372_4
				local var_372_6 = Vector3.New(0, -315, -320)

				var_372_0.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos10022, var_372_6, var_372_5)
			end

			if arg_369_1.time_ >= var_372_1 + var_372_4 and arg_369_1.time_ < var_372_1 + var_372_4 + arg_372_0 then
				var_372_0.localPosition = Vector3.New(0, -315, -320)
			end

			local var_372_7 = arg_369_1.actors_["10022"]
			local var_372_8 = 0

			if var_372_8 < arg_369_1.time_ and arg_369_1.time_ <= var_372_8 + arg_372_0 and arg_369_1.var_.actorSpriteComps10022 == nil then
				arg_369_1.var_.actorSpriteComps10022 = var_372_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_372_9 = 2

			if var_372_8 <= arg_369_1.time_ and arg_369_1.time_ < var_372_8 + var_372_9 then
				local var_372_10 = (arg_369_1.time_ - var_372_8) / var_372_9

				if arg_369_1.var_.actorSpriteComps10022 then
					for iter_372_1, iter_372_2 in pairs(arg_369_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_372_2 then
							if arg_369_1.isInRecall_ then
								local var_372_11 = Mathf.Lerp(iter_372_2.color.r, 0.82, var_372_10)
								local var_372_12 = Mathf.Lerp(iter_372_2.color.g, 0.77, var_372_10)
								local var_372_13 = Mathf.Lerp(iter_372_2.color.b, 0.62, var_372_10)

								iter_372_2.color = Color.New(var_372_11, var_372_12, var_372_13)
							else
								local var_372_14 = Mathf.Lerp(iter_372_2.color.r, 1, var_372_10)

								iter_372_2.color = Color.New(var_372_14, var_372_14, var_372_14)
							end
						end
					end
				end
			end

			if arg_369_1.time_ >= var_372_8 + var_372_9 and arg_369_1.time_ < var_372_8 + var_372_9 + arg_372_0 and arg_369_1.var_.actorSpriteComps10022 then
				for iter_372_3, iter_372_4 in pairs(arg_369_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_372_4 then
						if arg_369_1.isInRecall_ then
							iter_372_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_372_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_369_1.var_.actorSpriteComps10022 = nil
			end

			local var_372_15 = 0
			local var_372_16 = 0.7

			if var_372_15 < arg_369_1.time_ and arg_369_1.time_ <= var_372_15 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_17 = arg_369_1:FormatText(StoryNameCfg[614].name)

				arg_369_1.leftNameTxt_.text = var_372_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_18 = arg_369_1:GetWordFromCfg(413122091)
				local var_372_19 = arg_369_1:FormatText(var_372_18.content)

				arg_369_1.text_.text = var_372_19

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_20 = 28
				local var_372_21 = utf8.len(var_372_19)
				local var_372_22 = var_372_20 <= 0 and var_372_16 or var_372_16 * (var_372_21 / var_372_20)

				if var_372_22 > 0 and var_372_16 < var_372_22 then
					arg_369_1.talkMaxDuration = var_372_22

					if var_372_22 + var_372_15 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_22 + var_372_15
					end
				end

				arg_369_1.text_.text = var_372_19
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122091", "story_v_out_413122.awb") ~= 0 then
					local var_372_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122091", "story_v_out_413122.awb") / 1000

					if var_372_23 + var_372_15 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_23 + var_372_15
					end

					if var_372_18.prefab_name ~= "" and arg_369_1.actors_[var_372_18.prefab_name] ~= nil then
						local var_372_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_18.prefab_name].transform, "story_v_out_413122", "413122091", "story_v_out_413122.awb")

						arg_369_1:RecordAudio("413122091", var_372_24)
						arg_369_1:RecordAudio("413122091", var_372_24)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_413122", "413122091", "story_v_out_413122.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_413122", "413122091", "story_v_out_413122.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_25 = math.max(var_372_16, arg_369_1.talkMaxDuration)

			if var_372_15 <= arg_369_1.time_ and arg_369_1.time_ < var_372_15 + var_372_25 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_15) / var_372_25

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_15 + var_372_25 and arg_369_1.time_ < var_372_15 + var_372_25 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play413122092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 413122092
		arg_373_1.duration_ = 8.83

		local var_373_0 = {
			zh = 8.833,
			ja = 7.133
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
				arg_373_0:Play413122093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["10022"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.actorSpriteComps10022 == nil then
				arg_373_1.var_.actorSpriteComps10022 = var_376_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_376_2 = 2

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.actorSpriteComps10022 then
					for iter_376_0, iter_376_1 in pairs(arg_373_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_376_1 then
							if arg_373_1.isInRecall_ then
								local var_376_4 = Mathf.Lerp(iter_376_1.color.r, 0.82, var_376_3)
								local var_376_5 = Mathf.Lerp(iter_376_1.color.g, 0.77, var_376_3)
								local var_376_6 = Mathf.Lerp(iter_376_1.color.b, 0.62, var_376_3)

								iter_376_1.color = Color.New(var_376_4, var_376_5, var_376_6)
							else
								local var_376_7 = Mathf.Lerp(iter_376_1.color.r, 1, var_376_3)

								iter_376_1.color = Color.New(var_376_7, var_376_7, var_376_7)
							end
						end
					end
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.actorSpriteComps10022 then
				for iter_376_2, iter_376_3 in pairs(arg_373_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_376_3 then
						if arg_373_1.isInRecall_ then
							iter_376_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_376_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_373_1.var_.actorSpriteComps10022 = nil
			end

			local var_376_8 = 0
			local var_376_9 = 1.025

			if var_376_8 < arg_373_1.time_ and arg_373_1.time_ <= var_376_8 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_10 = arg_373_1:FormatText(StoryNameCfg[614].name)

				arg_373_1.leftNameTxt_.text = var_376_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_11 = arg_373_1:GetWordFromCfg(413122092)
				local var_376_12 = arg_373_1:FormatText(var_376_11.content)

				arg_373_1.text_.text = var_376_12

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_13 = 41
				local var_376_14 = utf8.len(var_376_12)
				local var_376_15 = var_376_13 <= 0 and var_376_9 or var_376_9 * (var_376_14 / var_376_13)

				if var_376_15 > 0 and var_376_9 < var_376_15 then
					arg_373_1.talkMaxDuration = var_376_15

					if var_376_15 + var_376_8 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_15 + var_376_8
					end
				end

				arg_373_1.text_.text = var_376_12
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122092", "story_v_out_413122.awb") ~= 0 then
					local var_376_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122092", "story_v_out_413122.awb") / 1000

					if var_376_16 + var_376_8 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_16 + var_376_8
					end

					if var_376_11.prefab_name ~= "" and arg_373_1.actors_[var_376_11.prefab_name] ~= nil then
						local var_376_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_11.prefab_name].transform, "story_v_out_413122", "413122092", "story_v_out_413122.awb")

						arg_373_1:RecordAudio("413122092", var_376_17)
						arg_373_1:RecordAudio("413122092", var_376_17)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_413122", "413122092", "story_v_out_413122.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_413122", "413122092", "story_v_out_413122.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_18 = math.max(var_376_9, arg_373_1.talkMaxDuration)

			if var_376_8 <= arg_373_1.time_ and arg_373_1.time_ < var_376_8 + var_376_18 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_8) / var_376_18

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_8 + var_376_18 and arg_373_1.time_ < var_376_8 + var_376_18 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play413122093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 413122093
		arg_377_1.duration_ = 5.6

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play413122094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["10022"].transform
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1.var_.moveOldPos10022 = var_380_0.localPosition
				var_380_0.localScale = Vector3.New(1, 1, 1)

				arg_377_1:CheckSpriteTmpPos("10022", 2)

				local var_380_2 = var_380_0.childCount

				for iter_380_0 = 0, var_380_2 - 1 do
					local var_380_3 = var_380_0:GetChild(iter_380_0)

					if var_380_3.name == "split_6" or not string.find(var_380_3.name, "split") then
						var_380_3.gameObject:SetActive(true)
					else
						var_380_3.gameObject:SetActive(false)
					end
				end
			end

			local var_380_4 = 0.001

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_4 then
				local var_380_5 = (arg_377_1.time_ - var_380_1) / var_380_4
				local var_380_6 = Vector3.New(-390, -315, -320)

				var_380_0.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos10022, var_380_6, var_380_5)
			end

			if arg_377_1.time_ >= var_380_1 + var_380_4 and arg_377_1.time_ < var_380_1 + var_380_4 + arg_380_0 then
				var_380_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_380_7 = arg_377_1.actors_["10092_1"].transform
			local var_380_8 = 0

			if var_380_8 < arg_377_1.time_ and arg_377_1.time_ <= var_380_8 + arg_380_0 then
				arg_377_1.var_.moveOldPos10092_1 = var_380_7.localPosition
				var_380_7.localScale = Vector3.New(1, 1, 1)

				arg_377_1:CheckSpriteTmpPos("10092_1", 4)

				local var_380_9 = var_380_7.childCount

				for iter_380_1 = 0, var_380_9 - 1 do
					local var_380_10 = var_380_7:GetChild(iter_380_1)

					if var_380_10.name == "split_1_1" or not string.find(var_380_10.name, "split") then
						var_380_10.gameObject:SetActive(true)
					else
						var_380_10.gameObject:SetActive(false)
					end
				end
			end

			local var_380_11 = 0.001

			if var_380_8 <= arg_377_1.time_ and arg_377_1.time_ < var_380_8 + var_380_11 then
				local var_380_12 = (arg_377_1.time_ - var_380_8) / var_380_11
				local var_380_13 = Vector3.New(390, -300, -295)

				var_380_7.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos10092_1, var_380_13, var_380_12)
			end

			if arg_377_1.time_ >= var_380_8 + var_380_11 and arg_377_1.time_ < var_380_8 + var_380_11 + arg_380_0 then
				var_380_7.localPosition = Vector3.New(390, -300, -295)
			end

			local var_380_14 = arg_377_1.actors_["10022"]
			local var_380_15 = 0

			if var_380_15 < arg_377_1.time_ and arg_377_1.time_ <= var_380_15 + arg_380_0 and arg_377_1.var_.actorSpriteComps10022 == nil then
				arg_377_1.var_.actorSpriteComps10022 = var_380_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_380_16 = 2

			if var_380_15 <= arg_377_1.time_ and arg_377_1.time_ < var_380_15 + var_380_16 then
				local var_380_17 = (arg_377_1.time_ - var_380_15) / var_380_16

				if arg_377_1.var_.actorSpriteComps10022 then
					for iter_380_2, iter_380_3 in pairs(arg_377_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_380_3 then
							if arg_377_1.isInRecall_ then
								local var_380_18 = Mathf.Lerp(iter_380_3.color.r, 0.46, var_380_17)
								local var_380_19 = Mathf.Lerp(iter_380_3.color.g, 0.43, var_380_17)
								local var_380_20 = Mathf.Lerp(iter_380_3.color.b, 0.35, var_380_17)

								iter_380_3.color = Color.New(var_380_18, var_380_19, var_380_20)
							else
								local var_380_21 = Mathf.Lerp(iter_380_3.color.r, 0.5, var_380_17)

								iter_380_3.color = Color.New(var_380_21, var_380_21, var_380_21)
							end
						end
					end
				end
			end

			if arg_377_1.time_ >= var_380_15 + var_380_16 and arg_377_1.time_ < var_380_15 + var_380_16 + arg_380_0 and arg_377_1.var_.actorSpriteComps10022 then
				for iter_380_4, iter_380_5 in pairs(arg_377_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_380_5 then
						if arg_377_1.isInRecall_ then
							iter_380_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_380_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_377_1.var_.actorSpriteComps10022 = nil
			end

			local var_380_22 = arg_377_1.actors_["10092_1"]
			local var_380_23 = 0

			if var_380_23 < arg_377_1.time_ and arg_377_1.time_ <= var_380_23 + arg_380_0 and arg_377_1.var_.actorSpriteComps10092_1 == nil then
				arg_377_1.var_.actorSpriteComps10092_1 = var_380_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_380_24 = 2

			if var_380_23 <= arg_377_1.time_ and arg_377_1.time_ < var_380_23 + var_380_24 then
				local var_380_25 = (arg_377_1.time_ - var_380_23) / var_380_24

				if arg_377_1.var_.actorSpriteComps10092_1 then
					for iter_380_6, iter_380_7 in pairs(arg_377_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_380_7 then
							if arg_377_1.isInRecall_ then
								local var_380_26 = Mathf.Lerp(iter_380_7.color.r, 0.82, var_380_25)
								local var_380_27 = Mathf.Lerp(iter_380_7.color.g, 0.77, var_380_25)
								local var_380_28 = Mathf.Lerp(iter_380_7.color.b, 0.62, var_380_25)

								iter_380_7.color = Color.New(var_380_26, var_380_27, var_380_28)
							else
								local var_380_29 = Mathf.Lerp(iter_380_7.color.r, 1, var_380_25)

								iter_380_7.color = Color.New(var_380_29, var_380_29, var_380_29)
							end
						end
					end
				end
			end

			if arg_377_1.time_ >= var_380_23 + var_380_24 and arg_377_1.time_ < var_380_23 + var_380_24 + arg_380_0 and arg_377_1.var_.actorSpriteComps10092_1 then
				for iter_380_8, iter_380_9 in pairs(arg_377_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_380_9 then
						if arg_377_1.isInRecall_ then
							iter_380_9.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_380_9.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_377_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_380_30 = 0
			local var_380_31 = 0.725

			if var_380_30 < arg_377_1.time_ and arg_377_1.time_ <= var_380_30 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_32 = arg_377_1:FormatText(StoryNameCfg[996].name)

				arg_377_1.leftNameTxt_.text = var_380_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_33 = arg_377_1:GetWordFromCfg(413122093)
				local var_380_34 = arg_377_1:FormatText(var_380_33.content)

				arg_377_1.text_.text = var_380_34

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_35 = 29
				local var_380_36 = utf8.len(var_380_34)
				local var_380_37 = var_380_35 <= 0 and var_380_31 or var_380_31 * (var_380_36 / var_380_35)

				if var_380_37 > 0 and var_380_31 < var_380_37 then
					arg_377_1.talkMaxDuration = var_380_37

					if var_380_37 + var_380_30 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_37 + var_380_30
					end
				end

				arg_377_1.text_.text = var_380_34
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122093", "story_v_out_413122.awb") ~= 0 then
					local var_380_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122093", "story_v_out_413122.awb") / 1000

					if var_380_38 + var_380_30 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_38 + var_380_30
					end

					if var_380_33.prefab_name ~= "" and arg_377_1.actors_[var_380_33.prefab_name] ~= nil then
						local var_380_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_33.prefab_name].transform, "story_v_out_413122", "413122093", "story_v_out_413122.awb")

						arg_377_1:RecordAudio("413122093", var_380_39)
						arg_377_1:RecordAudio("413122093", var_380_39)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_413122", "413122093", "story_v_out_413122.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_413122", "413122093", "story_v_out_413122.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_40 = math.max(var_380_31, arg_377_1.talkMaxDuration)

			if var_380_30 <= arg_377_1.time_ and arg_377_1.time_ < var_380_30 + var_380_40 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_30) / var_380_40

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_30 + var_380_40 and arg_377_1.time_ < var_380_30 + var_380_40 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play413122094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 413122094
		arg_381_1.duration_ = 3.6

		local var_381_0 = {
			zh = 3.6,
			ja = 2.766
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
				arg_381_0:Play413122095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["10022"]
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 and arg_381_1.var_.actorSpriteComps10022 == nil then
				arg_381_1.var_.actorSpriteComps10022 = var_384_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_384_2 = 2

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2

				if arg_381_1.var_.actorSpriteComps10022 then
					for iter_384_0, iter_384_1 in pairs(arg_381_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_384_1 then
							if arg_381_1.isInRecall_ then
								local var_384_4 = Mathf.Lerp(iter_384_1.color.r, 0.82, var_384_3)
								local var_384_5 = Mathf.Lerp(iter_384_1.color.g, 0.77, var_384_3)
								local var_384_6 = Mathf.Lerp(iter_384_1.color.b, 0.62, var_384_3)

								iter_384_1.color = Color.New(var_384_4, var_384_5, var_384_6)
							else
								local var_384_7 = Mathf.Lerp(iter_384_1.color.r, 1, var_384_3)

								iter_384_1.color = Color.New(var_384_7, var_384_7, var_384_7)
							end
						end
					end
				end
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 and arg_381_1.var_.actorSpriteComps10022 then
				for iter_384_2, iter_384_3 in pairs(arg_381_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_384_3 then
						if arg_381_1.isInRecall_ then
							iter_384_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_384_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_381_1.var_.actorSpriteComps10022 = nil
			end

			local var_384_8 = arg_381_1.actors_["10092_1"]
			local var_384_9 = 0

			if var_384_9 < arg_381_1.time_ and arg_381_1.time_ <= var_384_9 + arg_384_0 and arg_381_1.var_.actorSpriteComps10092_1 == nil then
				arg_381_1.var_.actorSpriteComps10092_1 = var_384_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_384_10 = 2

			if var_384_9 <= arg_381_1.time_ and arg_381_1.time_ < var_384_9 + var_384_10 then
				local var_384_11 = (arg_381_1.time_ - var_384_9) / var_384_10

				if arg_381_1.var_.actorSpriteComps10092_1 then
					for iter_384_4, iter_384_5 in pairs(arg_381_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_384_5 then
							if arg_381_1.isInRecall_ then
								local var_384_12 = Mathf.Lerp(iter_384_5.color.r, 0.46, var_384_11)
								local var_384_13 = Mathf.Lerp(iter_384_5.color.g, 0.43, var_384_11)
								local var_384_14 = Mathf.Lerp(iter_384_5.color.b, 0.35, var_384_11)

								iter_384_5.color = Color.New(var_384_12, var_384_13, var_384_14)
							else
								local var_384_15 = Mathf.Lerp(iter_384_5.color.r, 0.5, var_384_11)

								iter_384_5.color = Color.New(var_384_15, var_384_15, var_384_15)
							end
						end
					end
				end
			end

			if arg_381_1.time_ >= var_384_9 + var_384_10 and arg_381_1.time_ < var_384_9 + var_384_10 + arg_384_0 and arg_381_1.var_.actorSpriteComps10092_1 then
				for iter_384_6, iter_384_7 in pairs(arg_381_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_384_7 then
						if arg_381_1.isInRecall_ then
							iter_384_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_384_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_381_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_384_16 = 0
			local var_384_17 = 0.425

			if var_384_16 < arg_381_1.time_ and arg_381_1.time_ <= var_384_16 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_18 = arg_381_1:FormatText(StoryNameCfg[614].name)

				arg_381_1.leftNameTxt_.text = var_384_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_19 = arg_381_1:GetWordFromCfg(413122094)
				local var_384_20 = arg_381_1:FormatText(var_384_19.content)

				arg_381_1.text_.text = var_384_20

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_21 = 17
				local var_384_22 = utf8.len(var_384_20)
				local var_384_23 = var_384_21 <= 0 and var_384_17 or var_384_17 * (var_384_22 / var_384_21)

				if var_384_23 > 0 and var_384_17 < var_384_23 then
					arg_381_1.talkMaxDuration = var_384_23

					if var_384_23 + var_384_16 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_23 + var_384_16
					end
				end

				arg_381_1.text_.text = var_384_20
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122094", "story_v_out_413122.awb") ~= 0 then
					local var_384_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122094", "story_v_out_413122.awb") / 1000

					if var_384_24 + var_384_16 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_24 + var_384_16
					end

					if var_384_19.prefab_name ~= "" and arg_381_1.actors_[var_384_19.prefab_name] ~= nil then
						local var_384_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_19.prefab_name].transform, "story_v_out_413122", "413122094", "story_v_out_413122.awb")

						arg_381_1:RecordAudio("413122094", var_384_25)
						arg_381_1:RecordAudio("413122094", var_384_25)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_413122", "413122094", "story_v_out_413122.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_413122", "413122094", "story_v_out_413122.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_26 = math.max(var_384_17, arg_381_1.talkMaxDuration)

			if var_384_16 <= arg_381_1.time_ and arg_381_1.time_ < var_384_16 + var_384_26 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_16) / var_384_26

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_16 + var_384_26 and arg_381_1.time_ < var_384_16 + var_384_26 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play413122095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 413122095
		arg_385_1.duration_ = 10.07

		local var_385_0 = {
			zh = 7.466,
			ja = 10.066
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
				arg_385_0:Play413122096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["10022"]
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 and arg_385_1.var_.actorSpriteComps10022 == nil then
				arg_385_1.var_.actorSpriteComps10022 = var_388_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_388_2 = 2

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2

				if arg_385_1.var_.actorSpriteComps10022 then
					for iter_388_0, iter_388_1 in pairs(arg_385_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_388_1 then
							if arg_385_1.isInRecall_ then
								local var_388_4 = Mathf.Lerp(iter_388_1.color.r, 0.82, var_388_3)
								local var_388_5 = Mathf.Lerp(iter_388_1.color.g, 0.77, var_388_3)
								local var_388_6 = Mathf.Lerp(iter_388_1.color.b, 0.62, var_388_3)

								iter_388_1.color = Color.New(var_388_4, var_388_5, var_388_6)
							else
								local var_388_7 = Mathf.Lerp(iter_388_1.color.r, 1, var_388_3)

								iter_388_1.color = Color.New(var_388_7, var_388_7, var_388_7)
							end
						end
					end
				end
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 and arg_385_1.var_.actorSpriteComps10022 then
				for iter_388_2, iter_388_3 in pairs(arg_385_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_388_3 then
						if arg_385_1.isInRecall_ then
							iter_388_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_388_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_385_1.var_.actorSpriteComps10022 = nil
			end

			local var_388_8 = 0
			local var_388_9 = 0.9

			if var_388_8 < arg_385_1.time_ and arg_385_1.time_ <= var_388_8 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_10 = arg_385_1:FormatText(StoryNameCfg[614].name)

				arg_385_1.leftNameTxt_.text = var_388_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_11 = arg_385_1:GetWordFromCfg(413122095)
				local var_388_12 = arg_385_1:FormatText(var_388_11.content)

				arg_385_1.text_.text = var_388_12

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_13 = 36
				local var_388_14 = utf8.len(var_388_12)
				local var_388_15 = var_388_13 <= 0 and var_388_9 or var_388_9 * (var_388_14 / var_388_13)

				if var_388_15 > 0 and var_388_9 < var_388_15 then
					arg_385_1.talkMaxDuration = var_388_15

					if var_388_15 + var_388_8 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_15 + var_388_8
					end
				end

				arg_385_1.text_.text = var_388_12
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122095", "story_v_out_413122.awb") ~= 0 then
					local var_388_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122095", "story_v_out_413122.awb") / 1000

					if var_388_16 + var_388_8 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_16 + var_388_8
					end

					if var_388_11.prefab_name ~= "" and arg_385_1.actors_[var_388_11.prefab_name] ~= nil then
						local var_388_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_11.prefab_name].transform, "story_v_out_413122", "413122095", "story_v_out_413122.awb")

						arg_385_1:RecordAudio("413122095", var_388_17)
						arg_385_1:RecordAudio("413122095", var_388_17)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_413122", "413122095", "story_v_out_413122.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_413122", "413122095", "story_v_out_413122.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_18 = math.max(var_388_9, arg_385_1.talkMaxDuration)

			if var_388_8 <= arg_385_1.time_ and arg_385_1.time_ < var_388_8 + var_388_18 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_8) / var_388_18

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_8 + var_388_18 and arg_385_1.time_ < var_388_8 + var_388_18 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play413122096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 413122096
		arg_389_1.duration_ = 8.6

		local var_389_0 = {
			zh = 5.1,
			ja = 8.6
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
				arg_389_0:Play413122097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["10022"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.actorSpriteComps10022 == nil then
				arg_389_1.var_.actorSpriteComps10022 = var_392_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_392_2 = 2

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.actorSpriteComps10022 then
					for iter_392_0, iter_392_1 in pairs(arg_389_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_392_1 then
							if arg_389_1.isInRecall_ then
								local var_392_4 = Mathf.Lerp(iter_392_1.color.r, 0.82, var_392_3)
								local var_392_5 = Mathf.Lerp(iter_392_1.color.g, 0.77, var_392_3)
								local var_392_6 = Mathf.Lerp(iter_392_1.color.b, 0.62, var_392_3)

								iter_392_1.color = Color.New(var_392_4, var_392_5, var_392_6)
							else
								local var_392_7 = Mathf.Lerp(iter_392_1.color.r, 1, var_392_3)

								iter_392_1.color = Color.New(var_392_7, var_392_7, var_392_7)
							end
						end
					end
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.actorSpriteComps10022 then
				for iter_392_2, iter_392_3 in pairs(arg_389_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_392_3 then
						if arg_389_1.isInRecall_ then
							iter_392_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_392_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_389_1.var_.actorSpriteComps10022 = nil
			end

			local var_392_8 = 0
			local var_392_9 = 0.65

			if var_392_8 < arg_389_1.time_ and arg_389_1.time_ <= var_392_8 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_10 = arg_389_1:FormatText(StoryNameCfg[614].name)

				arg_389_1.leftNameTxt_.text = var_392_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_11 = arg_389_1:GetWordFromCfg(413122096)
				local var_392_12 = arg_389_1:FormatText(var_392_11.content)

				arg_389_1.text_.text = var_392_12

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_13 = 26
				local var_392_14 = utf8.len(var_392_12)
				local var_392_15 = var_392_13 <= 0 and var_392_9 or var_392_9 * (var_392_14 / var_392_13)

				if var_392_15 > 0 and var_392_9 < var_392_15 then
					arg_389_1.talkMaxDuration = var_392_15

					if var_392_15 + var_392_8 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_15 + var_392_8
					end
				end

				arg_389_1.text_.text = var_392_12
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122096", "story_v_out_413122.awb") ~= 0 then
					local var_392_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122096", "story_v_out_413122.awb") / 1000

					if var_392_16 + var_392_8 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_16 + var_392_8
					end

					if var_392_11.prefab_name ~= "" and arg_389_1.actors_[var_392_11.prefab_name] ~= nil then
						local var_392_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_11.prefab_name].transform, "story_v_out_413122", "413122096", "story_v_out_413122.awb")

						arg_389_1:RecordAudio("413122096", var_392_17)
						arg_389_1:RecordAudio("413122096", var_392_17)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_413122", "413122096", "story_v_out_413122.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_413122", "413122096", "story_v_out_413122.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_18 = math.max(var_392_9, arg_389_1.talkMaxDuration)

			if var_392_8 <= arg_389_1.time_ and arg_389_1.time_ < var_392_8 + var_392_18 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_8) / var_392_18

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_8 + var_392_18 and arg_389_1.time_ < var_392_8 + var_392_18 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play413122097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 413122097
		arg_393_1.duration_ = 7.6

		local var_393_0 = {
			zh = 6.266,
			ja = 7.6
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
				arg_393_0:Play413122098(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["10092_1"].transform
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 then
				arg_393_1.var_.moveOldPos10092_1 = var_396_0.localPosition
				var_396_0.localScale = Vector3.New(1, 1, 1)

				arg_393_1:CheckSpriteTmpPos("10092_1", 4)

				local var_396_2 = var_396_0.childCount

				for iter_396_0 = 0, var_396_2 - 1 do
					local var_396_3 = var_396_0:GetChild(iter_396_0)

					if var_396_3.name == "split_8" or not string.find(var_396_3.name, "split") then
						var_396_3.gameObject:SetActive(true)
					else
						var_396_3.gameObject:SetActive(false)
					end
				end
			end

			local var_396_4 = 0.001

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_4 then
				local var_396_5 = (arg_393_1.time_ - var_396_1) / var_396_4
				local var_396_6 = Vector3.New(390, -300, -295)

				var_396_0.localPosition = Vector3.Lerp(arg_393_1.var_.moveOldPos10092_1, var_396_6, var_396_5)
			end

			if arg_393_1.time_ >= var_396_1 + var_396_4 and arg_393_1.time_ < var_396_1 + var_396_4 + arg_396_0 then
				var_396_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_396_7 = arg_393_1.actors_["10022"]
			local var_396_8 = 0

			if var_396_8 < arg_393_1.time_ and arg_393_1.time_ <= var_396_8 + arg_396_0 and arg_393_1.var_.actorSpriteComps10022 == nil then
				arg_393_1.var_.actorSpriteComps10022 = var_396_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_396_9 = 2

			if var_396_8 <= arg_393_1.time_ and arg_393_1.time_ < var_396_8 + var_396_9 then
				local var_396_10 = (arg_393_1.time_ - var_396_8) / var_396_9

				if arg_393_1.var_.actorSpriteComps10022 then
					for iter_396_1, iter_396_2 in pairs(arg_393_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_396_2 then
							if arg_393_1.isInRecall_ then
								local var_396_11 = Mathf.Lerp(iter_396_2.color.r, 0.46, var_396_10)
								local var_396_12 = Mathf.Lerp(iter_396_2.color.g, 0.43, var_396_10)
								local var_396_13 = Mathf.Lerp(iter_396_2.color.b, 0.35, var_396_10)

								iter_396_2.color = Color.New(var_396_11, var_396_12, var_396_13)
							else
								local var_396_14 = Mathf.Lerp(iter_396_2.color.r, 0.5, var_396_10)

								iter_396_2.color = Color.New(var_396_14, var_396_14, var_396_14)
							end
						end
					end
				end
			end

			if arg_393_1.time_ >= var_396_8 + var_396_9 and arg_393_1.time_ < var_396_8 + var_396_9 + arg_396_0 and arg_393_1.var_.actorSpriteComps10022 then
				for iter_396_3, iter_396_4 in pairs(arg_393_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_396_4 then
						if arg_393_1.isInRecall_ then
							iter_396_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_396_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_393_1.var_.actorSpriteComps10022 = nil
			end

			local var_396_15 = arg_393_1.actors_["10092_1"]
			local var_396_16 = 0

			if var_396_16 < arg_393_1.time_ and arg_393_1.time_ <= var_396_16 + arg_396_0 and arg_393_1.var_.actorSpriteComps10092_1 == nil then
				arg_393_1.var_.actorSpriteComps10092_1 = var_396_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_396_17 = 2

			if var_396_16 <= arg_393_1.time_ and arg_393_1.time_ < var_396_16 + var_396_17 then
				local var_396_18 = (arg_393_1.time_ - var_396_16) / var_396_17

				if arg_393_1.var_.actorSpriteComps10092_1 then
					for iter_396_5, iter_396_6 in pairs(arg_393_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_396_6 then
							if arg_393_1.isInRecall_ then
								local var_396_19 = Mathf.Lerp(iter_396_6.color.r, 0.82, var_396_18)
								local var_396_20 = Mathf.Lerp(iter_396_6.color.g, 0.77, var_396_18)
								local var_396_21 = Mathf.Lerp(iter_396_6.color.b, 0.62, var_396_18)

								iter_396_6.color = Color.New(var_396_19, var_396_20, var_396_21)
							else
								local var_396_22 = Mathf.Lerp(iter_396_6.color.r, 1, var_396_18)

								iter_396_6.color = Color.New(var_396_22, var_396_22, var_396_22)
							end
						end
					end
				end
			end

			if arg_393_1.time_ >= var_396_16 + var_396_17 and arg_393_1.time_ < var_396_16 + var_396_17 + arg_396_0 and arg_393_1.var_.actorSpriteComps10092_1 then
				for iter_396_7, iter_396_8 in pairs(arg_393_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_396_8 then
						if arg_393_1.isInRecall_ then
							iter_396_8.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_396_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_393_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_396_23 = 0
			local var_396_24 = 0.8

			if var_396_23 < arg_393_1.time_ and arg_393_1.time_ <= var_396_23 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_25 = arg_393_1:FormatText(StoryNameCfg[996].name)

				arg_393_1.leftNameTxt_.text = var_396_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_26 = arg_393_1:GetWordFromCfg(413122097)
				local var_396_27 = arg_393_1:FormatText(var_396_26.content)

				arg_393_1.text_.text = var_396_27

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_28 = 32
				local var_396_29 = utf8.len(var_396_27)
				local var_396_30 = var_396_28 <= 0 and var_396_24 or var_396_24 * (var_396_29 / var_396_28)

				if var_396_30 > 0 and var_396_24 < var_396_30 then
					arg_393_1.talkMaxDuration = var_396_30

					if var_396_30 + var_396_23 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_30 + var_396_23
					end
				end

				arg_393_1.text_.text = var_396_27
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122097", "story_v_out_413122.awb") ~= 0 then
					local var_396_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122097", "story_v_out_413122.awb") / 1000

					if var_396_31 + var_396_23 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_31 + var_396_23
					end

					if var_396_26.prefab_name ~= "" and arg_393_1.actors_[var_396_26.prefab_name] ~= nil then
						local var_396_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_26.prefab_name].transform, "story_v_out_413122", "413122097", "story_v_out_413122.awb")

						arg_393_1:RecordAudio("413122097", var_396_32)
						arg_393_1:RecordAudio("413122097", var_396_32)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_413122", "413122097", "story_v_out_413122.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_413122", "413122097", "story_v_out_413122.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_33 = math.max(var_396_24, arg_393_1.talkMaxDuration)

			if var_396_23 <= arg_393_1.time_ and arg_393_1.time_ < var_396_23 + var_396_33 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_23) / var_396_33

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_23 + var_396_33 and arg_393_1.time_ < var_396_23 + var_396_33 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play413122098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 413122098
		arg_397_1.duration_ = 7.23

		local var_397_0 = {
			zh = 5.8,
			ja = 7.233
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
				arg_397_0:Play413122099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["10022"].transform
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 then
				arg_397_1.var_.moveOldPos10022 = var_400_0.localPosition
				var_400_0.localScale = Vector3.New(1, 1, 1)

				arg_397_1:CheckSpriteTmpPos("10022", 2)

				local var_400_2 = var_400_0.childCount

				for iter_400_0 = 0, var_400_2 - 1 do
					local var_400_3 = var_400_0:GetChild(iter_400_0)

					if var_400_3.name == "split_6" or not string.find(var_400_3.name, "split") then
						var_400_3.gameObject:SetActive(true)
					else
						var_400_3.gameObject:SetActive(false)
					end
				end
			end

			local var_400_4 = 0.001

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_4 then
				local var_400_5 = (arg_397_1.time_ - var_400_1) / var_400_4
				local var_400_6 = Vector3.New(-390, -315, -320)

				var_400_0.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos10022, var_400_6, var_400_5)
			end

			if arg_397_1.time_ >= var_400_1 + var_400_4 and arg_397_1.time_ < var_400_1 + var_400_4 + arg_400_0 then
				var_400_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_400_7 = arg_397_1.actors_["10022"]
			local var_400_8 = 0

			if var_400_8 < arg_397_1.time_ and arg_397_1.time_ <= var_400_8 + arg_400_0 and arg_397_1.var_.actorSpriteComps10022 == nil then
				arg_397_1.var_.actorSpriteComps10022 = var_400_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_400_9 = 2

			if var_400_8 <= arg_397_1.time_ and arg_397_1.time_ < var_400_8 + var_400_9 then
				local var_400_10 = (arg_397_1.time_ - var_400_8) / var_400_9

				if arg_397_1.var_.actorSpriteComps10022 then
					for iter_400_1, iter_400_2 in pairs(arg_397_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_400_2 then
							if arg_397_1.isInRecall_ then
								local var_400_11 = Mathf.Lerp(iter_400_2.color.r, 0.82, var_400_10)
								local var_400_12 = Mathf.Lerp(iter_400_2.color.g, 0.77, var_400_10)
								local var_400_13 = Mathf.Lerp(iter_400_2.color.b, 0.62, var_400_10)

								iter_400_2.color = Color.New(var_400_11, var_400_12, var_400_13)
							else
								local var_400_14 = Mathf.Lerp(iter_400_2.color.r, 1, var_400_10)

								iter_400_2.color = Color.New(var_400_14, var_400_14, var_400_14)
							end
						end
					end
				end
			end

			if arg_397_1.time_ >= var_400_8 + var_400_9 and arg_397_1.time_ < var_400_8 + var_400_9 + arg_400_0 and arg_397_1.var_.actorSpriteComps10022 then
				for iter_400_3, iter_400_4 in pairs(arg_397_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_400_4 then
						if arg_397_1.isInRecall_ then
							iter_400_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_400_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_397_1.var_.actorSpriteComps10022 = nil
			end

			local var_400_15 = arg_397_1.actors_["10092_1"]
			local var_400_16 = 0

			if var_400_16 < arg_397_1.time_ and arg_397_1.time_ <= var_400_16 + arg_400_0 and arg_397_1.var_.actorSpriteComps10092_1 == nil then
				arg_397_1.var_.actorSpriteComps10092_1 = var_400_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_400_17 = 2

			if var_400_16 <= arg_397_1.time_ and arg_397_1.time_ < var_400_16 + var_400_17 then
				local var_400_18 = (arg_397_1.time_ - var_400_16) / var_400_17

				if arg_397_1.var_.actorSpriteComps10092_1 then
					for iter_400_5, iter_400_6 in pairs(arg_397_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_400_6 then
							if arg_397_1.isInRecall_ then
								local var_400_19 = Mathf.Lerp(iter_400_6.color.r, 0.46, var_400_18)
								local var_400_20 = Mathf.Lerp(iter_400_6.color.g, 0.43, var_400_18)
								local var_400_21 = Mathf.Lerp(iter_400_6.color.b, 0.35, var_400_18)

								iter_400_6.color = Color.New(var_400_19, var_400_20, var_400_21)
							else
								local var_400_22 = Mathf.Lerp(iter_400_6.color.r, 0.5, var_400_18)

								iter_400_6.color = Color.New(var_400_22, var_400_22, var_400_22)
							end
						end
					end
				end
			end

			if arg_397_1.time_ >= var_400_16 + var_400_17 and arg_397_1.time_ < var_400_16 + var_400_17 + arg_400_0 and arg_397_1.var_.actorSpriteComps10092_1 then
				for iter_400_7, iter_400_8 in pairs(arg_397_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_400_8 then
						if arg_397_1.isInRecall_ then
							iter_400_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_400_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_397_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_400_23 = 0
			local var_400_24 = 0.8

			if var_400_23 < arg_397_1.time_ and arg_397_1.time_ <= var_400_23 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_25 = arg_397_1:FormatText(StoryNameCfg[614].name)

				arg_397_1.leftNameTxt_.text = var_400_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_26 = arg_397_1:GetWordFromCfg(413122098)
				local var_400_27 = arg_397_1:FormatText(var_400_26.content)

				arg_397_1.text_.text = var_400_27

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_28 = 32
				local var_400_29 = utf8.len(var_400_27)
				local var_400_30 = var_400_28 <= 0 and var_400_24 or var_400_24 * (var_400_29 / var_400_28)

				if var_400_30 > 0 and var_400_24 < var_400_30 then
					arg_397_1.talkMaxDuration = var_400_30

					if var_400_30 + var_400_23 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_30 + var_400_23
					end
				end

				arg_397_1.text_.text = var_400_27
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122098", "story_v_out_413122.awb") ~= 0 then
					local var_400_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122098", "story_v_out_413122.awb") / 1000

					if var_400_31 + var_400_23 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_31 + var_400_23
					end

					if var_400_26.prefab_name ~= "" and arg_397_1.actors_[var_400_26.prefab_name] ~= nil then
						local var_400_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_26.prefab_name].transform, "story_v_out_413122", "413122098", "story_v_out_413122.awb")

						arg_397_1:RecordAudio("413122098", var_400_32)
						arg_397_1:RecordAudio("413122098", var_400_32)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_413122", "413122098", "story_v_out_413122.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_413122", "413122098", "story_v_out_413122.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_33 = math.max(var_400_24, arg_397_1.talkMaxDuration)

			if var_400_23 <= arg_397_1.time_ and arg_397_1.time_ < var_400_23 + var_400_33 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_23) / var_400_33

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_23 + var_400_33 and arg_397_1.time_ < var_400_23 + var_400_33 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play413122099 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 413122099
		arg_401_1.duration_ = 7.27

		local var_401_0 = {
			zh = 5.966,
			ja = 7.266
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
				arg_401_0:Play413122100(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["10022"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos10022 = var_404_0.localPosition
				var_404_0.localScale = Vector3.New(1, 1, 1)

				arg_401_1:CheckSpriteTmpPos("10022", 2)

				local var_404_2 = var_404_0.childCount

				for iter_404_0 = 0, var_404_2 - 1 do
					local var_404_3 = var_404_0:GetChild(iter_404_0)

					if var_404_3.name == "split_2" or not string.find(var_404_3.name, "split") then
						var_404_3.gameObject:SetActive(true)
					else
						var_404_3.gameObject:SetActive(false)
					end
				end
			end

			local var_404_4 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_4 then
				local var_404_5 = (arg_401_1.time_ - var_404_1) / var_404_4
				local var_404_6 = Vector3.New(-390, -315, -320)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos10022, var_404_6, var_404_5)
			end

			if arg_401_1.time_ >= var_404_1 + var_404_4 and arg_401_1.time_ < var_404_1 + var_404_4 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_404_7 = arg_401_1.actors_["10022"]
			local var_404_8 = 0

			if var_404_8 < arg_401_1.time_ and arg_401_1.time_ <= var_404_8 + arg_404_0 and arg_401_1.var_.actorSpriteComps10022 == nil then
				arg_401_1.var_.actorSpriteComps10022 = var_404_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_404_9 = 2

			if var_404_8 <= arg_401_1.time_ and arg_401_1.time_ < var_404_8 + var_404_9 then
				local var_404_10 = (arg_401_1.time_ - var_404_8) / var_404_9

				if arg_401_1.var_.actorSpriteComps10022 then
					for iter_404_1, iter_404_2 in pairs(arg_401_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_404_2 then
							if arg_401_1.isInRecall_ then
								local var_404_11 = Mathf.Lerp(iter_404_2.color.r, 0.82, var_404_10)
								local var_404_12 = Mathf.Lerp(iter_404_2.color.g, 0.77, var_404_10)
								local var_404_13 = Mathf.Lerp(iter_404_2.color.b, 0.62, var_404_10)

								iter_404_2.color = Color.New(var_404_11, var_404_12, var_404_13)
							else
								local var_404_14 = Mathf.Lerp(iter_404_2.color.r, 1, var_404_10)

								iter_404_2.color = Color.New(var_404_14, var_404_14, var_404_14)
							end
						end
					end
				end
			end

			if arg_401_1.time_ >= var_404_8 + var_404_9 and arg_401_1.time_ < var_404_8 + var_404_9 + arg_404_0 and arg_401_1.var_.actorSpriteComps10022 then
				for iter_404_3, iter_404_4 in pairs(arg_401_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_404_4 then
						if arg_401_1.isInRecall_ then
							iter_404_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_404_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_401_1.var_.actorSpriteComps10022 = nil
			end

			local var_404_15 = 0
			local var_404_16 = 0.9

			if var_404_15 < arg_401_1.time_ and arg_401_1.time_ <= var_404_15 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_17 = arg_401_1:FormatText(StoryNameCfg[614].name)

				arg_401_1.leftNameTxt_.text = var_404_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_18 = arg_401_1:GetWordFromCfg(413122099)
				local var_404_19 = arg_401_1:FormatText(var_404_18.content)

				arg_401_1.text_.text = var_404_19

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_20 = 36
				local var_404_21 = utf8.len(var_404_19)
				local var_404_22 = var_404_20 <= 0 and var_404_16 or var_404_16 * (var_404_21 / var_404_20)

				if var_404_22 > 0 and var_404_16 < var_404_22 then
					arg_401_1.talkMaxDuration = var_404_22

					if var_404_22 + var_404_15 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_22 + var_404_15
					end
				end

				arg_401_1.text_.text = var_404_19
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122099", "story_v_out_413122.awb") ~= 0 then
					local var_404_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122099", "story_v_out_413122.awb") / 1000

					if var_404_23 + var_404_15 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_23 + var_404_15
					end

					if var_404_18.prefab_name ~= "" and arg_401_1.actors_[var_404_18.prefab_name] ~= nil then
						local var_404_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_18.prefab_name].transform, "story_v_out_413122", "413122099", "story_v_out_413122.awb")

						arg_401_1:RecordAudio("413122099", var_404_24)
						arg_401_1:RecordAudio("413122099", var_404_24)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_413122", "413122099", "story_v_out_413122.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_413122", "413122099", "story_v_out_413122.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_25 = math.max(var_404_16, arg_401_1.talkMaxDuration)

			if var_404_15 <= arg_401_1.time_ and arg_401_1.time_ < var_404_15 + var_404_25 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_15) / var_404_25

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_15 + var_404_25 and arg_401_1.time_ < var_404_15 + var_404_25 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play413122100 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 413122100
		arg_405_1.duration_ = 15.93

		local var_405_0 = {
			zh = 5.5,
			ja = 15.933
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
				arg_405_0:Play413122101(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["10092_1"].transform
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1.var_.moveOldPos10092_1 = var_408_0.localPosition
				var_408_0.localScale = Vector3.New(1, 1, 1)

				arg_405_1:CheckSpriteTmpPos("10092_1", 4)

				local var_408_2 = var_408_0.childCount

				for iter_408_0 = 0, var_408_2 - 1 do
					local var_408_3 = var_408_0:GetChild(iter_408_0)

					if var_408_3.name == "split_8" or not string.find(var_408_3.name, "split") then
						var_408_3.gameObject:SetActive(true)
					else
						var_408_3.gameObject:SetActive(false)
					end
				end
			end

			local var_408_4 = 0.001

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_4 then
				local var_408_5 = (arg_405_1.time_ - var_408_1) / var_408_4
				local var_408_6 = Vector3.New(390, -300, -295)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos10092_1, var_408_6, var_408_5)
			end

			if arg_405_1.time_ >= var_408_1 + var_408_4 and arg_405_1.time_ < var_408_1 + var_408_4 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_408_7 = arg_405_1.actors_["10022"]
			local var_408_8 = 0

			if var_408_8 < arg_405_1.time_ and arg_405_1.time_ <= var_408_8 + arg_408_0 and arg_405_1.var_.actorSpriteComps10022 == nil then
				arg_405_1.var_.actorSpriteComps10022 = var_408_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_408_9 = 2

			if var_408_8 <= arg_405_1.time_ and arg_405_1.time_ < var_408_8 + var_408_9 then
				local var_408_10 = (arg_405_1.time_ - var_408_8) / var_408_9

				if arg_405_1.var_.actorSpriteComps10022 then
					for iter_408_1, iter_408_2 in pairs(arg_405_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_408_2 then
							if arg_405_1.isInRecall_ then
								local var_408_11 = Mathf.Lerp(iter_408_2.color.r, 0.46, var_408_10)
								local var_408_12 = Mathf.Lerp(iter_408_2.color.g, 0.43, var_408_10)
								local var_408_13 = Mathf.Lerp(iter_408_2.color.b, 0.35, var_408_10)

								iter_408_2.color = Color.New(var_408_11, var_408_12, var_408_13)
							else
								local var_408_14 = Mathf.Lerp(iter_408_2.color.r, 0.5, var_408_10)

								iter_408_2.color = Color.New(var_408_14, var_408_14, var_408_14)
							end
						end
					end
				end
			end

			if arg_405_1.time_ >= var_408_8 + var_408_9 and arg_405_1.time_ < var_408_8 + var_408_9 + arg_408_0 and arg_405_1.var_.actorSpriteComps10022 then
				for iter_408_3, iter_408_4 in pairs(arg_405_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_408_4 then
						if arg_405_1.isInRecall_ then
							iter_408_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_408_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_405_1.var_.actorSpriteComps10022 = nil
			end

			local var_408_15 = arg_405_1.actors_["10092_1"]
			local var_408_16 = 0

			if var_408_16 < arg_405_1.time_ and arg_405_1.time_ <= var_408_16 + arg_408_0 and arg_405_1.var_.actorSpriteComps10092_1 == nil then
				arg_405_1.var_.actorSpriteComps10092_1 = var_408_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_408_17 = 2

			if var_408_16 <= arg_405_1.time_ and arg_405_1.time_ < var_408_16 + var_408_17 then
				local var_408_18 = (arg_405_1.time_ - var_408_16) / var_408_17

				if arg_405_1.var_.actorSpriteComps10092_1 then
					for iter_408_5, iter_408_6 in pairs(arg_405_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_408_6 then
							if arg_405_1.isInRecall_ then
								local var_408_19 = Mathf.Lerp(iter_408_6.color.r, 0.82, var_408_18)
								local var_408_20 = Mathf.Lerp(iter_408_6.color.g, 0.77, var_408_18)
								local var_408_21 = Mathf.Lerp(iter_408_6.color.b, 0.62, var_408_18)

								iter_408_6.color = Color.New(var_408_19, var_408_20, var_408_21)
							else
								local var_408_22 = Mathf.Lerp(iter_408_6.color.r, 1, var_408_18)

								iter_408_6.color = Color.New(var_408_22, var_408_22, var_408_22)
							end
						end
					end
				end
			end

			if arg_405_1.time_ >= var_408_16 + var_408_17 and arg_405_1.time_ < var_408_16 + var_408_17 + arg_408_0 and arg_405_1.var_.actorSpriteComps10092_1 then
				for iter_408_7, iter_408_8 in pairs(arg_405_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_408_8 then
						if arg_405_1.isInRecall_ then
							iter_408_8.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_408_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_405_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_408_23 = 0
			local var_408_24 = 0.8

			if var_408_23 < arg_405_1.time_ and arg_405_1.time_ <= var_408_23 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_25 = arg_405_1:FormatText(StoryNameCfg[996].name)

				arg_405_1.leftNameTxt_.text = var_408_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_26 = arg_405_1:GetWordFromCfg(413122100)
				local var_408_27 = arg_405_1:FormatText(var_408_26.content)

				arg_405_1.text_.text = var_408_27

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_28 = 32
				local var_408_29 = utf8.len(var_408_27)
				local var_408_30 = var_408_28 <= 0 and var_408_24 or var_408_24 * (var_408_29 / var_408_28)

				if var_408_30 > 0 and var_408_24 < var_408_30 then
					arg_405_1.talkMaxDuration = var_408_30

					if var_408_30 + var_408_23 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_30 + var_408_23
					end
				end

				arg_405_1.text_.text = var_408_27
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122100", "story_v_out_413122.awb") ~= 0 then
					local var_408_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122100", "story_v_out_413122.awb") / 1000

					if var_408_31 + var_408_23 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_31 + var_408_23
					end

					if var_408_26.prefab_name ~= "" and arg_405_1.actors_[var_408_26.prefab_name] ~= nil then
						local var_408_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_26.prefab_name].transform, "story_v_out_413122", "413122100", "story_v_out_413122.awb")

						arg_405_1:RecordAudio("413122100", var_408_32)
						arg_405_1:RecordAudio("413122100", var_408_32)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_out_413122", "413122100", "story_v_out_413122.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_out_413122", "413122100", "story_v_out_413122.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_33 = math.max(var_408_24, arg_405_1.talkMaxDuration)

			if var_408_23 <= arg_405_1.time_ and arg_405_1.time_ < var_408_23 + var_408_33 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_23) / var_408_33

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_23 + var_408_33 and arg_405_1.time_ < var_408_23 + var_408_33 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play413122101 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 413122101
		arg_409_1.duration_ = 9.27

		local var_409_0 = {
			zh = 5.833,
			ja = 9.266
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
				arg_409_0:Play413122102(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["10092_1"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 and arg_409_1.var_.actorSpriteComps10092_1 == nil then
				arg_409_1.var_.actorSpriteComps10092_1 = var_412_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_412_2 = 2

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2

				if arg_409_1.var_.actorSpriteComps10092_1 then
					for iter_412_0, iter_412_1 in pairs(arg_409_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_412_1 then
							if arg_409_1.isInRecall_ then
								local var_412_4 = Mathf.Lerp(iter_412_1.color.r, 0.82, var_412_3)
								local var_412_5 = Mathf.Lerp(iter_412_1.color.g, 0.77, var_412_3)
								local var_412_6 = Mathf.Lerp(iter_412_1.color.b, 0.62, var_412_3)

								iter_412_1.color = Color.New(var_412_4, var_412_5, var_412_6)
							else
								local var_412_7 = Mathf.Lerp(iter_412_1.color.r, 1, var_412_3)

								iter_412_1.color = Color.New(var_412_7, var_412_7, var_412_7)
							end
						end
					end
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 and arg_409_1.var_.actorSpriteComps10092_1 then
				for iter_412_2, iter_412_3 in pairs(arg_409_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_412_3 then
						if arg_409_1.isInRecall_ then
							iter_412_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_412_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_409_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_412_8 = 0
			local var_412_9 = 0.875

			if var_412_8 < arg_409_1.time_ and arg_409_1.time_ <= var_412_8 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_10 = arg_409_1:FormatText(StoryNameCfg[996].name)

				arg_409_1.leftNameTxt_.text = var_412_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_11 = arg_409_1:GetWordFromCfg(413122101)
				local var_412_12 = arg_409_1:FormatText(var_412_11.content)

				arg_409_1.text_.text = var_412_12

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_13 = 35
				local var_412_14 = utf8.len(var_412_12)
				local var_412_15 = var_412_13 <= 0 and var_412_9 or var_412_9 * (var_412_14 / var_412_13)

				if var_412_15 > 0 and var_412_9 < var_412_15 then
					arg_409_1.talkMaxDuration = var_412_15

					if var_412_15 + var_412_8 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_15 + var_412_8
					end
				end

				arg_409_1.text_.text = var_412_12
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122101", "story_v_out_413122.awb") ~= 0 then
					local var_412_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122101", "story_v_out_413122.awb") / 1000

					if var_412_16 + var_412_8 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_16 + var_412_8
					end

					if var_412_11.prefab_name ~= "" and arg_409_1.actors_[var_412_11.prefab_name] ~= nil then
						local var_412_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_11.prefab_name].transform, "story_v_out_413122", "413122101", "story_v_out_413122.awb")

						arg_409_1:RecordAudio("413122101", var_412_17)
						arg_409_1:RecordAudio("413122101", var_412_17)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_413122", "413122101", "story_v_out_413122.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_413122", "413122101", "story_v_out_413122.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_18 = math.max(var_412_9, arg_409_1.talkMaxDuration)

			if var_412_8 <= arg_409_1.time_ and arg_409_1.time_ < var_412_8 + var_412_18 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_8) / var_412_18

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_8 + var_412_18 and arg_409_1.time_ < var_412_8 + var_412_18 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play413122102 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 413122102
		arg_413_1.duration_ = 15.13

		local var_413_0 = {
			zh = 7.033,
			ja = 15.133
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
				arg_413_0:Play413122103(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = 0
			local var_416_1 = 0.8

			if var_416_0 < arg_413_1.time_ and arg_413_1.time_ <= var_416_0 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_2 = arg_413_1:FormatText(StoryNameCfg[996].name)

				arg_413_1.leftNameTxt_.text = var_416_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_3 = arg_413_1:GetWordFromCfg(413122102)
				local var_416_4 = arg_413_1:FormatText(var_416_3.content)

				arg_413_1.text_.text = var_416_4

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_5 = 32
				local var_416_6 = utf8.len(var_416_4)
				local var_416_7 = var_416_5 <= 0 and var_416_1 or var_416_1 * (var_416_6 / var_416_5)

				if var_416_7 > 0 and var_416_1 < var_416_7 then
					arg_413_1.talkMaxDuration = var_416_7

					if var_416_7 + var_416_0 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_7 + var_416_0
					end
				end

				arg_413_1.text_.text = var_416_4
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122102", "story_v_out_413122.awb") ~= 0 then
					local var_416_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122102", "story_v_out_413122.awb") / 1000

					if var_416_8 + var_416_0 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_8 + var_416_0
					end

					if var_416_3.prefab_name ~= "" and arg_413_1.actors_[var_416_3.prefab_name] ~= nil then
						local var_416_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_3.prefab_name].transform, "story_v_out_413122", "413122102", "story_v_out_413122.awb")

						arg_413_1:RecordAudio("413122102", var_416_9)
						arg_413_1:RecordAudio("413122102", var_416_9)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_413122", "413122102", "story_v_out_413122.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_413122", "413122102", "story_v_out_413122.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_10 = math.max(var_416_1, arg_413_1.talkMaxDuration)

			if var_416_0 <= arg_413_1.time_ and arg_413_1.time_ < var_416_0 + var_416_10 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_0) / var_416_10

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_0 + var_416_10 and arg_413_1.time_ < var_416_0 + var_416_10 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play413122103 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 413122103
		arg_417_1.duration_ = 12.03

		local var_417_0 = {
			zh = 7.6,
			ja = 12.033
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
				arg_417_0:Play413122104(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["10092_1"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.actorSpriteComps10092_1 == nil then
				arg_417_1.var_.actorSpriteComps10092_1 = var_420_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_420_2 = 2

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.actorSpriteComps10092_1 then
					for iter_420_0, iter_420_1 in pairs(arg_417_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_420_1 then
							if arg_417_1.isInRecall_ then
								local var_420_4 = Mathf.Lerp(iter_420_1.color.r, 0.82, var_420_3)
								local var_420_5 = Mathf.Lerp(iter_420_1.color.g, 0.77, var_420_3)
								local var_420_6 = Mathf.Lerp(iter_420_1.color.b, 0.62, var_420_3)

								iter_420_1.color = Color.New(var_420_4, var_420_5, var_420_6)
							else
								local var_420_7 = Mathf.Lerp(iter_420_1.color.r, 1, var_420_3)

								iter_420_1.color = Color.New(var_420_7, var_420_7, var_420_7)
							end
						end
					end
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.actorSpriteComps10092_1 then
				for iter_420_2, iter_420_3 in pairs(arg_417_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_420_3 then
						if arg_417_1.isInRecall_ then
							iter_420_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_420_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_417_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_420_8 = 0
			local var_420_9 = 0.925

			if var_420_8 < arg_417_1.time_ and arg_417_1.time_ <= var_420_8 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_10 = arg_417_1:FormatText(StoryNameCfg[996].name)

				arg_417_1.leftNameTxt_.text = var_420_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_11 = arg_417_1:GetWordFromCfg(413122103)
				local var_420_12 = arg_417_1:FormatText(var_420_11.content)

				arg_417_1.text_.text = var_420_12

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_13 = 37
				local var_420_14 = utf8.len(var_420_12)
				local var_420_15 = var_420_13 <= 0 and var_420_9 or var_420_9 * (var_420_14 / var_420_13)

				if var_420_15 > 0 and var_420_9 < var_420_15 then
					arg_417_1.talkMaxDuration = var_420_15

					if var_420_15 + var_420_8 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_15 + var_420_8
					end
				end

				arg_417_1.text_.text = var_420_12
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122103", "story_v_out_413122.awb") ~= 0 then
					local var_420_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122103", "story_v_out_413122.awb") / 1000

					if var_420_16 + var_420_8 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_16 + var_420_8
					end

					if var_420_11.prefab_name ~= "" and arg_417_1.actors_[var_420_11.prefab_name] ~= nil then
						local var_420_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_11.prefab_name].transform, "story_v_out_413122", "413122103", "story_v_out_413122.awb")

						arg_417_1:RecordAudio("413122103", var_420_17)
						arg_417_1:RecordAudio("413122103", var_420_17)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_413122", "413122103", "story_v_out_413122.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_413122", "413122103", "story_v_out_413122.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_18 = math.max(var_420_9, arg_417_1.talkMaxDuration)

			if var_420_8 <= arg_417_1.time_ and arg_417_1.time_ < var_420_8 + var_420_18 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_8) / var_420_18

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_8 + var_420_18 and arg_417_1.time_ < var_420_8 + var_420_18 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play413122104 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 413122104
		arg_421_1.duration_ = 13.17

		local var_421_0 = {
			zh = 7,
			ja = 13.166
		}
		local var_421_1 = manager.audio:GetLocalizationFlag()

		if var_421_0[var_421_1] ~= nil then
			arg_421_1.duration_ = var_421_0[var_421_1]
		end

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play413122105(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["10022"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos10022 = var_424_0.localPosition
				var_424_0.localScale = Vector3.New(1, 1, 1)

				arg_421_1:CheckSpriteTmpPos("10022", 2)

				local var_424_2 = var_424_0.childCount

				for iter_424_0 = 0, var_424_2 - 1 do
					local var_424_3 = var_424_0:GetChild(iter_424_0)

					if var_424_3.name == "split_6" or not string.find(var_424_3.name, "split") then
						var_424_3.gameObject:SetActive(true)
					else
						var_424_3.gameObject:SetActive(false)
					end
				end
			end

			local var_424_4 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_4 then
				local var_424_5 = (arg_421_1.time_ - var_424_1) / var_424_4
				local var_424_6 = Vector3.New(-390, -315, -320)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos10022, var_424_6, var_424_5)
			end

			if arg_421_1.time_ >= var_424_1 + var_424_4 and arg_421_1.time_ < var_424_1 + var_424_4 + arg_424_0 then
				var_424_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_424_7 = arg_421_1.actors_["10022"]
			local var_424_8 = 0

			if var_424_8 < arg_421_1.time_ and arg_421_1.time_ <= var_424_8 + arg_424_0 and arg_421_1.var_.actorSpriteComps10022 == nil then
				arg_421_1.var_.actorSpriteComps10022 = var_424_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_424_9 = 2

			if var_424_8 <= arg_421_1.time_ and arg_421_1.time_ < var_424_8 + var_424_9 then
				local var_424_10 = (arg_421_1.time_ - var_424_8) / var_424_9

				if arg_421_1.var_.actorSpriteComps10022 then
					for iter_424_1, iter_424_2 in pairs(arg_421_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_424_2 then
							if arg_421_1.isInRecall_ then
								local var_424_11 = Mathf.Lerp(iter_424_2.color.r, 0.82, var_424_10)
								local var_424_12 = Mathf.Lerp(iter_424_2.color.g, 0.77, var_424_10)
								local var_424_13 = Mathf.Lerp(iter_424_2.color.b, 0.62, var_424_10)

								iter_424_2.color = Color.New(var_424_11, var_424_12, var_424_13)
							else
								local var_424_14 = Mathf.Lerp(iter_424_2.color.r, 1, var_424_10)

								iter_424_2.color = Color.New(var_424_14, var_424_14, var_424_14)
							end
						end
					end
				end
			end

			if arg_421_1.time_ >= var_424_8 + var_424_9 and arg_421_1.time_ < var_424_8 + var_424_9 + arg_424_0 and arg_421_1.var_.actorSpriteComps10022 then
				for iter_424_3, iter_424_4 in pairs(arg_421_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_424_4 then
						if arg_421_1.isInRecall_ then
							iter_424_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_424_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_421_1.var_.actorSpriteComps10022 = nil
			end

			local var_424_15 = arg_421_1.actors_["10092_1"]
			local var_424_16 = 0

			if var_424_16 < arg_421_1.time_ and arg_421_1.time_ <= var_424_16 + arg_424_0 and arg_421_1.var_.actorSpriteComps10092_1 == nil then
				arg_421_1.var_.actorSpriteComps10092_1 = var_424_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_424_17 = 2

			if var_424_16 <= arg_421_1.time_ and arg_421_1.time_ < var_424_16 + var_424_17 then
				local var_424_18 = (arg_421_1.time_ - var_424_16) / var_424_17

				if arg_421_1.var_.actorSpriteComps10092_1 then
					for iter_424_5, iter_424_6 in pairs(arg_421_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_424_6 then
							if arg_421_1.isInRecall_ then
								local var_424_19 = Mathf.Lerp(iter_424_6.color.r, 0.46, var_424_18)
								local var_424_20 = Mathf.Lerp(iter_424_6.color.g, 0.43, var_424_18)
								local var_424_21 = Mathf.Lerp(iter_424_6.color.b, 0.35, var_424_18)

								iter_424_6.color = Color.New(var_424_19, var_424_20, var_424_21)
							else
								local var_424_22 = Mathf.Lerp(iter_424_6.color.r, 0.5, var_424_18)

								iter_424_6.color = Color.New(var_424_22, var_424_22, var_424_22)
							end
						end
					end
				end
			end

			if arg_421_1.time_ >= var_424_16 + var_424_17 and arg_421_1.time_ < var_424_16 + var_424_17 + arg_424_0 and arg_421_1.var_.actorSpriteComps10092_1 then
				for iter_424_7, iter_424_8 in pairs(arg_421_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_424_8 then
						if arg_421_1.isInRecall_ then
							iter_424_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_424_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_421_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_424_23 = 0
			local var_424_24 = 0.925

			if var_424_23 < arg_421_1.time_ and arg_421_1.time_ <= var_424_23 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_25 = arg_421_1:FormatText(StoryNameCfg[614].name)

				arg_421_1.leftNameTxt_.text = var_424_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_26 = arg_421_1:GetWordFromCfg(413122104)
				local var_424_27 = arg_421_1:FormatText(var_424_26.content)

				arg_421_1.text_.text = var_424_27

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_28 = 37
				local var_424_29 = utf8.len(var_424_27)
				local var_424_30 = var_424_28 <= 0 and var_424_24 or var_424_24 * (var_424_29 / var_424_28)

				if var_424_30 > 0 and var_424_24 < var_424_30 then
					arg_421_1.talkMaxDuration = var_424_30

					if var_424_30 + var_424_23 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_30 + var_424_23
					end
				end

				arg_421_1.text_.text = var_424_27
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122104", "story_v_out_413122.awb") ~= 0 then
					local var_424_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122104", "story_v_out_413122.awb") / 1000

					if var_424_31 + var_424_23 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_31 + var_424_23
					end

					if var_424_26.prefab_name ~= "" and arg_421_1.actors_[var_424_26.prefab_name] ~= nil then
						local var_424_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_26.prefab_name].transform, "story_v_out_413122", "413122104", "story_v_out_413122.awb")

						arg_421_1:RecordAudio("413122104", var_424_32)
						arg_421_1:RecordAudio("413122104", var_424_32)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_413122", "413122104", "story_v_out_413122.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_413122", "413122104", "story_v_out_413122.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_33 = math.max(var_424_24, arg_421_1.talkMaxDuration)

			if var_424_23 <= arg_421_1.time_ and arg_421_1.time_ < var_424_23 + var_424_33 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_23) / var_424_33

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_23 + var_424_33 and arg_421_1.time_ < var_424_23 + var_424_33 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play413122105 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 413122105
		arg_425_1.duration_ = 12.93

		local var_425_0 = {
			zh = 7.666,
			ja = 12.933
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
				arg_425_0:Play413122106(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["10022"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.actorSpriteComps10022 == nil then
				arg_425_1.var_.actorSpriteComps10022 = var_428_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_428_2 = 2

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.actorSpriteComps10022 then
					for iter_428_0, iter_428_1 in pairs(arg_425_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_428_1 then
							if arg_425_1.isInRecall_ then
								local var_428_4 = Mathf.Lerp(iter_428_1.color.r, 0.46, var_428_3)
								local var_428_5 = Mathf.Lerp(iter_428_1.color.g, 0.43, var_428_3)
								local var_428_6 = Mathf.Lerp(iter_428_1.color.b, 0.35, var_428_3)

								iter_428_1.color = Color.New(var_428_4, var_428_5, var_428_6)
							else
								local var_428_7 = Mathf.Lerp(iter_428_1.color.r, 0.5, var_428_3)

								iter_428_1.color = Color.New(var_428_7, var_428_7, var_428_7)
							end
						end
					end
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.actorSpriteComps10022 then
				for iter_428_2, iter_428_3 in pairs(arg_425_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_428_3 then
						if arg_425_1.isInRecall_ then
							iter_428_3.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_428_3.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_425_1.var_.actorSpriteComps10022 = nil
			end

			local var_428_8 = arg_425_1.actors_["10092_1"]
			local var_428_9 = 0

			if var_428_9 < arg_425_1.time_ and arg_425_1.time_ <= var_428_9 + arg_428_0 and arg_425_1.var_.actorSpriteComps10092_1 == nil then
				arg_425_1.var_.actorSpriteComps10092_1 = var_428_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_428_10 = 2

			if var_428_9 <= arg_425_1.time_ and arg_425_1.time_ < var_428_9 + var_428_10 then
				local var_428_11 = (arg_425_1.time_ - var_428_9) / var_428_10

				if arg_425_1.var_.actorSpriteComps10092_1 then
					for iter_428_4, iter_428_5 in pairs(arg_425_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_428_5 then
							if arg_425_1.isInRecall_ then
								local var_428_12 = Mathf.Lerp(iter_428_5.color.r, 0.82, var_428_11)
								local var_428_13 = Mathf.Lerp(iter_428_5.color.g, 0.77, var_428_11)
								local var_428_14 = Mathf.Lerp(iter_428_5.color.b, 0.62, var_428_11)

								iter_428_5.color = Color.New(var_428_12, var_428_13, var_428_14)
							else
								local var_428_15 = Mathf.Lerp(iter_428_5.color.r, 1, var_428_11)

								iter_428_5.color = Color.New(var_428_15, var_428_15, var_428_15)
							end
						end
					end
				end
			end

			if arg_425_1.time_ >= var_428_9 + var_428_10 and arg_425_1.time_ < var_428_9 + var_428_10 + arg_428_0 and arg_425_1.var_.actorSpriteComps10092_1 then
				for iter_428_6, iter_428_7 in pairs(arg_425_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_428_7 then
						if arg_425_1.isInRecall_ then
							iter_428_7.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_428_7.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_425_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_428_16 = arg_425_1.actors_["10092_1"].transform
			local var_428_17 = 0

			if var_428_17 < arg_425_1.time_ and arg_425_1.time_ <= var_428_17 + arg_428_0 then
				arg_425_1.var_.moveOldPos10092_1 = var_428_16.localPosition
				var_428_16.localScale = Vector3.New(1, 1, 1)

				arg_425_1:CheckSpriteTmpPos("10092_1", 4)

				local var_428_18 = var_428_16.childCount

				for iter_428_8 = 0, var_428_18 - 1 do
					local var_428_19 = var_428_16:GetChild(iter_428_8)

					if var_428_19.name == "split_1_1" or not string.find(var_428_19.name, "split") then
						var_428_19.gameObject:SetActive(true)
					else
						var_428_19.gameObject:SetActive(false)
					end
				end
			end

			local var_428_20 = 0.001

			if var_428_17 <= arg_425_1.time_ and arg_425_1.time_ < var_428_17 + var_428_20 then
				local var_428_21 = (arg_425_1.time_ - var_428_17) / var_428_20
				local var_428_22 = Vector3.New(390, -300, -295)

				var_428_16.localPosition = Vector3.Lerp(arg_425_1.var_.moveOldPos10092_1, var_428_22, var_428_21)
			end

			if arg_425_1.time_ >= var_428_17 + var_428_20 and arg_425_1.time_ < var_428_17 + var_428_20 + arg_428_0 then
				var_428_16.localPosition = Vector3.New(390, -300, -295)
			end

			local var_428_23 = 0
			local var_428_24 = 1.15

			if var_428_23 < arg_425_1.time_ and arg_425_1.time_ <= var_428_23 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_25 = arg_425_1:FormatText(StoryNameCfg[996].name)

				arg_425_1.leftNameTxt_.text = var_428_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_26 = arg_425_1:GetWordFromCfg(413122105)
				local var_428_27 = arg_425_1:FormatText(var_428_26.content)

				arg_425_1.text_.text = var_428_27

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_28 = 46
				local var_428_29 = utf8.len(var_428_27)
				local var_428_30 = var_428_28 <= 0 and var_428_24 or var_428_24 * (var_428_29 / var_428_28)

				if var_428_30 > 0 and var_428_24 < var_428_30 then
					arg_425_1.talkMaxDuration = var_428_30

					if var_428_30 + var_428_23 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_30 + var_428_23
					end
				end

				arg_425_1.text_.text = var_428_27
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122105", "story_v_out_413122.awb") ~= 0 then
					local var_428_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122105", "story_v_out_413122.awb") / 1000

					if var_428_31 + var_428_23 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_31 + var_428_23
					end

					if var_428_26.prefab_name ~= "" and arg_425_1.actors_[var_428_26.prefab_name] ~= nil then
						local var_428_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_26.prefab_name].transform, "story_v_out_413122", "413122105", "story_v_out_413122.awb")

						arg_425_1:RecordAudio("413122105", var_428_32)
						arg_425_1:RecordAudio("413122105", var_428_32)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_413122", "413122105", "story_v_out_413122.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_413122", "413122105", "story_v_out_413122.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_33 = math.max(var_428_24, arg_425_1.talkMaxDuration)

			if var_428_23 <= arg_425_1.time_ and arg_425_1.time_ < var_428_23 + var_428_33 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_23) / var_428_33

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_23 + var_428_33 and arg_425_1.time_ < var_428_23 + var_428_33 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play413122106 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 413122106
		arg_429_1.duration_ = 3.37

		local var_429_0 = {
			zh = 2.733,
			ja = 3.366
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
				arg_429_0:Play413122107(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["10022"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.actorSpriteComps10022 == nil then
				arg_429_1.var_.actorSpriteComps10022 = var_432_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_432_2 = 2

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.actorSpriteComps10022 then
					for iter_432_0, iter_432_1 in pairs(arg_429_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_432_1 then
							if arg_429_1.isInRecall_ then
								local var_432_4 = Mathf.Lerp(iter_432_1.color.r, 0.82, var_432_3)
								local var_432_5 = Mathf.Lerp(iter_432_1.color.g, 0.77, var_432_3)
								local var_432_6 = Mathf.Lerp(iter_432_1.color.b, 0.62, var_432_3)

								iter_432_1.color = Color.New(var_432_4, var_432_5, var_432_6)
							else
								local var_432_7 = Mathf.Lerp(iter_432_1.color.r, 1, var_432_3)

								iter_432_1.color = Color.New(var_432_7, var_432_7, var_432_7)
							end
						end
					end
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.actorSpriteComps10022 then
				for iter_432_2, iter_432_3 in pairs(arg_429_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_432_3 then
						if arg_429_1.isInRecall_ then
							iter_432_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_432_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_429_1.var_.actorSpriteComps10022 = nil
			end

			local var_432_8 = arg_429_1.actors_["10092_1"]
			local var_432_9 = 0

			if var_432_9 < arg_429_1.time_ and arg_429_1.time_ <= var_432_9 + arg_432_0 and arg_429_1.var_.actorSpriteComps10092_1 == nil then
				arg_429_1.var_.actorSpriteComps10092_1 = var_432_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_432_10 = 2

			if var_432_9 <= arg_429_1.time_ and arg_429_1.time_ < var_432_9 + var_432_10 then
				local var_432_11 = (arg_429_1.time_ - var_432_9) / var_432_10

				if arg_429_1.var_.actorSpriteComps10092_1 then
					for iter_432_4, iter_432_5 in pairs(arg_429_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_432_5 then
							if arg_429_1.isInRecall_ then
								local var_432_12 = Mathf.Lerp(iter_432_5.color.r, 0.46, var_432_11)
								local var_432_13 = Mathf.Lerp(iter_432_5.color.g, 0.43, var_432_11)
								local var_432_14 = Mathf.Lerp(iter_432_5.color.b, 0.35, var_432_11)

								iter_432_5.color = Color.New(var_432_12, var_432_13, var_432_14)
							else
								local var_432_15 = Mathf.Lerp(iter_432_5.color.r, 0.5, var_432_11)

								iter_432_5.color = Color.New(var_432_15, var_432_15, var_432_15)
							end
						end
					end
				end
			end

			if arg_429_1.time_ >= var_432_9 + var_432_10 and arg_429_1.time_ < var_432_9 + var_432_10 + arg_432_0 and arg_429_1.var_.actorSpriteComps10092_1 then
				for iter_432_6, iter_432_7 in pairs(arg_429_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_432_7 then
						if arg_429_1.isInRecall_ then
							iter_432_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_432_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_429_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_432_16 = 0
			local var_432_17 = 0.375

			if var_432_16 < arg_429_1.time_ and arg_429_1.time_ <= var_432_16 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_18 = arg_429_1:FormatText(StoryNameCfg[614].name)

				arg_429_1.leftNameTxt_.text = var_432_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_19 = arg_429_1:GetWordFromCfg(413122106)
				local var_432_20 = arg_429_1:FormatText(var_432_19.content)

				arg_429_1.text_.text = var_432_20

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_21 = 15
				local var_432_22 = utf8.len(var_432_20)
				local var_432_23 = var_432_21 <= 0 and var_432_17 or var_432_17 * (var_432_22 / var_432_21)

				if var_432_23 > 0 and var_432_17 < var_432_23 then
					arg_429_1.talkMaxDuration = var_432_23

					if var_432_23 + var_432_16 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_23 + var_432_16
					end
				end

				arg_429_1.text_.text = var_432_20
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122106", "story_v_out_413122.awb") ~= 0 then
					local var_432_24 = manager.audio:GetVoiceLength("story_v_out_413122", "413122106", "story_v_out_413122.awb") / 1000

					if var_432_24 + var_432_16 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_24 + var_432_16
					end

					if var_432_19.prefab_name ~= "" and arg_429_1.actors_[var_432_19.prefab_name] ~= nil then
						local var_432_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_19.prefab_name].transform, "story_v_out_413122", "413122106", "story_v_out_413122.awb")

						arg_429_1:RecordAudio("413122106", var_432_25)
						arg_429_1:RecordAudio("413122106", var_432_25)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_413122", "413122106", "story_v_out_413122.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_413122", "413122106", "story_v_out_413122.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_26 = math.max(var_432_17, arg_429_1.talkMaxDuration)

			if var_432_16 <= arg_429_1.time_ and arg_429_1.time_ < var_432_16 + var_432_26 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_16) / var_432_26

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_16 + var_432_26 and arg_429_1.time_ < var_432_16 + var_432_26 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play413122107 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 413122107
		arg_433_1.duration_ = 15.1

		local var_433_0 = {
			zh = 10.7,
			ja = 15.1
		}
		local var_433_1 = manager.audio:GetLocalizationFlag()

		if var_433_0[var_433_1] ~= nil then
			arg_433_1.duration_ = var_433_0[var_433_1]
		end

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play413122108(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = arg_433_1.actors_["10022"].transform
			local var_436_1 = 0

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.var_.moveOldPos10022 = var_436_0.localPosition
				var_436_0.localScale = Vector3.New(1, 1, 1)

				arg_433_1:CheckSpriteTmpPos("10022", 2)

				local var_436_2 = var_436_0.childCount

				for iter_436_0 = 0, var_436_2 - 1 do
					local var_436_3 = var_436_0:GetChild(iter_436_0)

					if var_436_3.name == "" or not string.find(var_436_3.name, "split") then
						var_436_3.gameObject:SetActive(true)
					else
						var_436_3.gameObject:SetActive(false)
					end
				end
			end

			local var_436_4 = 0.001

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_4 then
				local var_436_5 = (arg_433_1.time_ - var_436_1) / var_436_4
				local var_436_6 = Vector3.New(-390, -315, -320)

				var_436_0.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos10022, var_436_6, var_436_5)
			end

			if arg_433_1.time_ >= var_436_1 + var_436_4 and arg_433_1.time_ < var_436_1 + var_436_4 + arg_436_0 then
				var_436_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_436_7 = arg_433_1.actors_["10092_1"].transform
			local var_436_8 = 0

			if var_436_8 < arg_433_1.time_ and arg_433_1.time_ <= var_436_8 + arg_436_0 then
				arg_433_1.var_.moveOldPos10092_1 = var_436_7.localPosition
				var_436_7.localScale = Vector3.New(1, 1, 1)

				arg_433_1:CheckSpriteTmpPos("10092_1", 4)

				local var_436_9 = var_436_7.childCount

				for iter_436_1 = 0, var_436_9 - 1 do
					local var_436_10 = var_436_7:GetChild(iter_436_1)

					if var_436_10.name == "split_1_1" or not string.find(var_436_10.name, "split") then
						var_436_10.gameObject:SetActive(true)
					else
						var_436_10.gameObject:SetActive(false)
					end
				end
			end

			local var_436_11 = 0.001

			if var_436_8 <= arg_433_1.time_ and arg_433_1.time_ < var_436_8 + var_436_11 then
				local var_436_12 = (arg_433_1.time_ - var_436_8) / var_436_11
				local var_436_13 = Vector3.New(390, -300, -295)

				var_436_7.localPosition = Vector3.Lerp(arg_433_1.var_.moveOldPos10092_1, var_436_13, var_436_12)
			end

			if arg_433_1.time_ >= var_436_8 + var_436_11 and arg_433_1.time_ < var_436_8 + var_436_11 + arg_436_0 then
				var_436_7.localPosition = Vector3.New(390, -300, -295)
			end

			local var_436_14 = arg_433_1.actors_["10022"]
			local var_436_15 = 0

			if var_436_15 < arg_433_1.time_ and arg_433_1.time_ <= var_436_15 + arg_436_0 and arg_433_1.var_.actorSpriteComps10022 == nil then
				arg_433_1.var_.actorSpriteComps10022 = var_436_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_436_16 = 2

			if var_436_15 <= arg_433_1.time_ and arg_433_1.time_ < var_436_15 + var_436_16 then
				local var_436_17 = (arg_433_1.time_ - var_436_15) / var_436_16

				if arg_433_1.var_.actorSpriteComps10022 then
					for iter_436_2, iter_436_3 in pairs(arg_433_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_436_3 then
							if arg_433_1.isInRecall_ then
								local var_436_18 = Mathf.Lerp(iter_436_3.color.r, 0.46, var_436_17)
								local var_436_19 = Mathf.Lerp(iter_436_3.color.g, 0.43, var_436_17)
								local var_436_20 = Mathf.Lerp(iter_436_3.color.b, 0.35, var_436_17)

								iter_436_3.color = Color.New(var_436_18, var_436_19, var_436_20)
							else
								local var_436_21 = Mathf.Lerp(iter_436_3.color.r, 0.5, var_436_17)

								iter_436_3.color = Color.New(var_436_21, var_436_21, var_436_21)
							end
						end
					end
				end
			end

			if arg_433_1.time_ >= var_436_15 + var_436_16 and arg_433_1.time_ < var_436_15 + var_436_16 + arg_436_0 and arg_433_1.var_.actorSpriteComps10022 then
				for iter_436_4, iter_436_5 in pairs(arg_433_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_436_5 then
						if arg_433_1.isInRecall_ then
							iter_436_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_436_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_433_1.var_.actorSpriteComps10022 = nil
			end

			local var_436_22 = arg_433_1.actors_["10092_1"]
			local var_436_23 = 0

			if var_436_23 < arg_433_1.time_ and arg_433_1.time_ <= var_436_23 + arg_436_0 and arg_433_1.var_.actorSpriteComps10092_1 == nil then
				arg_433_1.var_.actorSpriteComps10092_1 = var_436_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_436_24 = 2

			if var_436_23 <= arg_433_1.time_ and arg_433_1.time_ < var_436_23 + var_436_24 then
				local var_436_25 = (arg_433_1.time_ - var_436_23) / var_436_24

				if arg_433_1.var_.actorSpriteComps10092_1 then
					for iter_436_6, iter_436_7 in pairs(arg_433_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_436_7 then
							if arg_433_1.isInRecall_ then
								local var_436_26 = Mathf.Lerp(iter_436_7.color.r, 0.82, var_436_25)
								local var_436_27 = Mathf.Lerp(iter_436_7.color.g, 0.77, var_436_25)
								local var_436_28 = Mathf.Lerp(iter_436_7.color.b, 0.62, var_436_25)

								iter_436_7.color = Color.New(var_436_26, var_436_27, var_436_28)
							else
								local var_436_29 = Mathf.Lerp(iter_436_7.color.r, 1, var_436_25)

								iter_436_7.color = Color.New(var_436_29, var_436_29, var_436_29)
							end
						end
					end
				end
			end

			if arg_433_1.time_ >= var_436_23 + var_436_24 and arg_433_1.time_ < var_436_23 + var_436_24 + arg_436_0 and arg_433_1.var_.actorSpriteComps10092_1 then
				for iter_436_8, iter_436_9 in pairs(arg_433_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_436_9 then
						if arg_433_1.isInRecall_ then
							iter_436_9.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_436_9.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_433_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_436_30 = 0
			local var_436_31 = 1.225

			if var_436_30 < arg_433_1.time_ and arg_433_1.time_ <= var_436_30 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_32 = arg_433_1:FormatText(StoryNameCfg[996].name)

				arg_433_1.leftNameTxt_.text = var_436_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_33 = arg_433_1:GetWordFromCfg(413122107)
				local var_436_34 = arg_433_1:FormatText(var_436_33.content)

				arg_433_1.text_.text = var_436_34

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_35 = 49
				local var_436_36 = utf8.len(var_436_34)
				local var_436_37 = var_436_35 <= 0 and var_436_31 or var_436_31 * (var_436_36 / var_436_35)

				if var_436_37 > 0 and var_436_31 < var_436_37 then
					arg_433_1.talkMaxDuration = var_436_37

					if var_436_37 + var_436_30 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_37 + var_436_30
					end
				end

				arg_433_1.text_.text = var_436_34
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122107", "story_v_out_413122.awb") ~= 0 then
					local var_436_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122107", "story_v_out_413122.awb") / 1000

					if var_436_38 + var_436_30 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_38 + var_436_30
					end

					if var_436_33.prefab_name ~= "" and arg_433_1.actors_[var_436_33.prefab_name] ~= nil then
						local var_436_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_33.prefab_name].transform, "story_v_out_413122", "413122107", "story_v_out_413122.awb")

						arg_433_1:RecordAudio("413122107", var_436_39)
						arg_433_1:RecordAudio("413122107", var_436_39)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_413122", "413122107", "story_v_out_413122.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_413122", "413122107", "story_v_out_413122.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_40 = math.max(var_436_31, arg_433_1.talkMaxDuration)

			if var_436_30 <= arg_433_1.time_ and arg_433_1.time_ < var_436_30 + var_436_40 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_30) / var_436_40

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_30 + var_436_40 and arg_433_1.time_ < var_436_30 + var_436_40 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play413122108 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 413122108
		arg_437_1.duration_ = 2.7

		local var_437_0 = {
			zh = 1.999999999999,
			ja = 2.7
		}
		local var_437_1 = manager.audio:GetLocalizationFlag()

		if var_437_0[var_437_1] ~= nil then
			arg_437_1.duration_ = var_437_0[var_437_1]
		end

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play413122109(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["10022"]
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 and arg_437_1.var_.actorSpriteComps10022 == nil then
				arg_437_1.var_.actorSpriteComps10022 = var_440_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_440_2 = 2

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2

				if arg_437_1.var_.actorSpriteComps10022 then
					for iter_440_0, iter_440_1 in pairs(arg_437_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_440_1 then
							if arg_437_1.isInRecall_ then
								local var_440_4 = Mathf.Lerp(iter_440_1.color.r, 0.82, var_440_3)
								local var_440_5 = Mathf.Lerp(iter_440_1.color.g, 0.77, var_440_3)
								local var_440_6 = Mathf.Lerp(iter_440_1.color.b, 0.62, var_440_3)

								iter_440_1.color = Color.New(var_440_4, var_440_5, var_440_6)
							else
								local var_440_7 = Mathf.Lerp(iter_440_1.color.r, 1, var_440_3)

								iter_440_1.color = Color.New(var_440_7, var_440_7, var_440_7)
							end
						end
					end
				end
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 and arg_437_1.var_.actorSpriteComps10022 then
				for iter_440_2, iter_440_3 in pairs(arg_437_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_440_3 then
						if arg_437_1.isInRecall_ then
							iter_440_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_440_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_437_1.var_.actorSpriteComps10022 = nil
			end

			local var_440_8 = arg_437_1.actors_["10092_1"]
			local var_440_9 = 0

			if var_440_9 < arg_437_1.time_ and arg_437_1.time_ <= var_440_9 + arg_440_0 and arg_437_1.var_.actorSpriteComps10092_1 == nil then
				arg_437_1.var_.actorSpriteComps10092_1 = var_440_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_440_10 = 2

			if var_440_9 <= arg_437_1.time_ and arg_437_1.time_ < var_440_9 + var_440_10 then
				local var_440_11 = (arg_437_1.time_ - var_440_9) / var_440_10

				if arg_437_1.var_.actorSpriteComps10092_1 then
					for iter_440_4, iter_440_5 in pairs(arg_437_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_440_5 then
							if arg_437_1.isInRecall_ then
								local var_440_12 = Mathf.Lerp(iter_440_5.color.r, 0.46, var_440_11)
								local var_440_13 = Mathf.Lerp(iter_440_5.color.g, 0.43, var_440_11)
								local var_440_14 = Mathf.Lerp(iter_440_5.color.b, 0.35, var_440_11)

								iter_440_5.color = Color.New(var_440_12, var_440_13, var_440_14)
							else
								local var_440_15 = Mathf.Lerp(iter_440_5.color.r, 0.5, var_440_11)

								iter_440_5.color = Color.New(var_440_15, var_440_15, var_440_15)
							end
						end
					end
				end
			end

			if arg_437_1.time_ >= var_440_9 + var_440_10 and arg_437_1.time_ < var_440_9 + var_440_10 + arg_440_0 and arg_437_1.var_.actorSpriteComps10092_1 then
				for iter_440_6, iter_440_7 in pairs(arg_437_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_440_7 then
						if arg_437_1.isInRecall_ then
							iter_440_7.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_440_7.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_437_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_440_16 = arg_437_1.actors_["10022"].transform
			local var_440_17 = 0

			if var_440_17 < arg_437_1.time_ and arg_437_1.time_ <= var_440_17 + arg_440_0 then
				arg_437_1.var_.moveOldPos10022 = var_440_16.localPosition
				var_440_16.localScale = Vector3.New(1, 1, 1)

				arg_437_1:CheckSpriteTmpPos("10022", 2)

				local var_440_18 = var_440_16.childCount

				for iter_440_8 = 0, var_440_18 - 1 do
					local var_440_19 = var_440_16:GetChild(iter_440_8)

					if var_440_19.name == "split_6" or not string.find(var_440_19.name, "split") then
						var_440_19.gameObject:SetActive(true)
					else
						var_440_19.gameObject:SetActive(false)
					end
				end
			end

			local var_440_20 = 0.001

			if var_440_17 <= arg_437_1.time_ and arg_437_1.time_ < var_440_17 + var_440_20 then
				local var_440_21 = (arg_437_1.time_ - var_440_17) / var_440_20
				local var_440_22 = Vector3.New(-390, -315, -320)

				var_440_16.localPosition = Vector3.Lerp(arg_437_1.var_.moveOldPos10022, var_440_22, var_440_21)
			end

			if arg_437_1.time_ >= var_440_17 + var_440_20 and arg_437_1.time_ < var_440_17 + var_440_20 + arg_440_0 then
				var_440_16.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_440_23 = 0
			local var_440_24 = 0.2

			if var_440_23 < arg_437_1.time_ and arg_437_1.time_ <= var_440_23 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_25 = arg_437_1:FormatText(StoryNameCfg[614].name)

				arg_437_1.leftNameTxt_.text = var_440_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, false)
				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_26 = arg_437_1:GetWordFromCfg(413122108)
				local var_440_27 = arg_437_1:FormatText(var_440_26.content)

				arg_437_1.text_.text = var_440_27

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_28 = 8
				local var_440_29 = utf8.len(var_440_27)
				local var_440_30 = var_440_28 <= 0 and var_440_24 or var_440_24 * (var_440_29 / var_440_28)

				if var_440_30 > 0 and var_440_24 < var_440_30 then
					arg_437_1.talkMaxDuration = var_440_30

					if var_440_30 + var_440_23 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_30 + var_440_23
					end
				end

				arg_437_1.text_.text = var_440_27
				arg_437_1.typewritter.percent = 0

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122108", "story_v_out_413122.awb") ~= 0 then
					local var_440_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122108", "story_v_out_413122.awb") / 1000

					if var_440_31 + var_440_23 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_31 + var_440_23
					end

					if var_440_26.prefab_name ~= "" and arg_437_1.actors_[var_440_26.prefab_name] ~= nil then
						local var_440_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_26.prefab_name].transform, "story_v_out_413122", "413122108", "story_v_out_413122.awb")

						arg_437_1:RecordAudio("413122108", var_440_32)
						arg_437_1:RecordAudio("413122108", var_440_32)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_413122", "413122108", "story_v_out_413122.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_413122", "413122108", "story_v_out_413122.awb")
				end

				arg_437_1:RecordContent(arg_437_1.text_.text)
			end

			local var_440_33 = math.max(var_440_24, arg_437_1.talkMaxDuration)

			if var_440_23 <= arg_437_1.time_ and arg_437_1.time_ < var_440_23 + var_440_33 then
				arg_437_1.typewritter.percent = (arg_437_1.time_ - var_440_23) / var_440_33

				arg_437_1.typewritter:SetDirty()
			end

			if arg_437_1.time_ >= var_440_23 + var_440_33 and arg_437_1.time_ < var_440_23 + var_440_33 + arg_440_0 then
				arg_437_1.typewritter.percent = 1

				arg_437_1.typewritter:SetDirty()
				arg_437_1:ShowNextGo(true)
			end
		end
	end,
	Play413122109 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 413122109
		arg_441_1.duration_ = 14.37

		local var_441_0 = {
			zh = 11.766,
			ja = 14.366
		}
		local var_441_1 = manager.audio:GetLocalizationFlag()

		if var_441_0[var_441_1] ~= nil then
			arg_441_1.duration_ = var_441_0[var_441_1]
		end

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play413122110(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["10092_1"].transform
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 then
				arg_441_1.var_.moveOldPos10092_1 = var_444_0.localPosition
				var_444_0.localScale = Vector3.New(1, 1, 1)

				arg_441_1:CheckSpriteTmpPos("10092_1", 4)

				local var_444_2 = var_444_0.childCount

				for iter_444_0 = 0, var_444_2 - 1 do
					local var_444_3 = var_444_0:GetChild(iter_444_0)

					if var_444_3.name == "split_2" or not string.find(var_444_3.name, "split") then
						var_444_3.gameObject:SetActive(true)
					else
						var_444_3.gameObject:SetActive(false)
					end
				end
			end

			local var_444_4 = 0.001

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_4 then
				local var_444_5 = (arg_441_1.time_ - var_444_1) / var_444_4
				local var_444_6 = Vector3.New(390, -300, -295)

				var_444_0.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos10092_1, var_444_6, var_444_5)
			end

			if arg_441_1.time_ >= var_444_1 + var_444_4 and arg_441_1.time_ < var_444_1 + var_444_4 + arg_444_0 then
				var_444_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_444_7 = arg_441_1.actors_["10022"]
			local var_444_8 = 0

			if var_444_8 < arg_441_1.time_ and arg_441_1.time_ <= var_444_8 + arg_444_0 and arg_441_1.var_.actorSpriteComps10022 == nil then
				arg_441_1.var_.actorSpriteComps10022 = var_444_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_444_9 = 2

			if var_444_8 <= arg_441_1.time_ and arg_441_1.time_ < var_444_8 + var_444_9 then
				local var_444_10 = (arg_441_1.time_ - var_444_8) / var_444_9

				if arg_441_1.var_.actorSpriteComps10022 then
					for iter_444_1, iter_444_2 in pairs(arg_441_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_444_2 then
							if arg_441_1.isInRecall_ then
								local var_444_11 = Mathf.Lerp(iter_444_2.color.r, 0.46, var_444_10)
								local var_444_12 = Mathf.Lerp(iter_444_2.color.g, 0.43, var_444_10)
								local var_444_13 = Mathf.Lerp(iter_444_2.color.b, 0.35, var_444_10)

								iter_444_2.color = Color.New(var_444_11, var_444_12, var_444_13)
							else
								local var_444_14 = Mathf.Lerp(iter_444_2.color.r, 0.5, var_444_10)

								iter_444_2.color = Color.New(var_444_14, var_444_14, var_444_14)
							end
						end
					end
				end
			end

			if arg_441_1.time_ >= var_444_8 + var_444_9 and arg_441_1.time_ < var_444_8 + var_444_9 + arg_444_0 and arg_441_1.var_.actorSpriteComps10022 then
				for iter_444_3, iter_444_4 in pairs(arg_441_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_444_4 then
						if arg_441_1.isInRecall_ then
							iter_444_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_444_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_441_1.var_.actorSpriteComps10022 = nil
			end

			local var_444_15 = arg_441_1.actors_["10092_1"]
			local var_444_16 = 0

			if var_444_16 < arg_441_1.time_ and arg_441_1.time_ <= var_444_16 + arg_444_0 and arg_441_1.var_.actorSpriteComps10092_1 == nil then
				arg_441_1.var_.actorSpriteComps10092_1 = var_444_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_444_17 = 2

			if var_444_16 <= arg_441_1.time_ and arg_441_1.time_ < var_444_16 + var_444_17 then
				local var_444_18 = (arg_441_1.time_ - var_444_16) / var_444_17

				if arg_441_1.var_.actorSpriteComps10092_1 then
					for iter_444_5, iter_444_6 in pairs(arg_441_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_444_6 then
							if arg_441_1.isInRecall_ then
								local var_444_19 = Mathf.Lerp(iter_444_6.color.r, 0.82, var_444_18)
								local var_444_20 = Mathf.Lerp(iter_444_6.color.g, 0.77, var_444_18)
								local var_444_21 = Mathf.Lerp(iter_444_6.color.b, 0.62, var_444_18)

								iter_444_6.color = Color.New(var_444_19, var_444_20, var_444_21)
							else
								local var_444_22 = Mathf.Lerp(iter_444_6.color.r, 1, var_444_18)

								iter_444_6.color = Color.New(var_444_22, var_444_22, var_444_22)
							end
						end
					end
				end
			end

			if arg_441_1.time_ >= var_444_16 + var_444_17 and arg_441_1.time_ < var_444_16 + var_444_17 + arg_444_0 and arg_441_1.var_.actorSpriteComps10092_1 then
				for iter_444_7, iter_444_8 in pairs(arg_441_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_444_8 then
						if arg_441_1.isInRecall_ then
							iter_444_8.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_444_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_441_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_444_23 = 0
			local var_444_24 = 1.325

			if var_444_23 < arg_441_1.time_ and arg_441_1.time_ <= var_444_23 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_25 = arg_441_1:FormatText(StoryNameCfg[996].name)

				arg_441_1.leftNameTxt_.text = var_444_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_26 = arg_441_1:GetWordFromCfg(413122109)
				local var_444_27 = arg_441_1:FormatText(var_444_26.content)

				arg_441_1.text_.text = var_444_27

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_28 = 53
				local var_444_29 = utf8.len(var_444_27)
				local var_444_30 = var_444_28 <= 0 and var_444_24 or var_444_24 * (var_444_29 / var_444_28)

				if var_444_30 > 0 and var_444_24 < var_444_30 then
					arg_441_1.talkMaxDuration = var_444_30

					if var_444_30 + var_444_23 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_30 + var_444_23
					end
				end

				arg_441_1.text_.text = var_444_27
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122109", "story_v_out_413122.awb") ~= 0 then
					local var_444_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122109", "story_v_out_413122.awb") / 1000

					if var_444_31 + var_444_23 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_31 + var_444_23
					end

					if var_444_26.prefab_name ~= "" and arg_441_1.actors_[var_444_26.prefab_name] ~= nil then
						local var_444_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_26.prefab_name].transform, "story_v_out_413122", "413122109", "story_v_out_413122.awb")

						arg_441_1:RecordAudio("413122109", var_444_32)
						arg_441_1:RecordAudio("413122109", var_444_32)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_out_413122", "413122109", "story_v_out_413122.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_out_413122", "413122109", "story_v_out_413122.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_33 = math.max(var_444_24, arg_441_1.talkMaxDuration)

			if var_444_23 <= arg_441_1.time_ and arg_441_1.time_ < var_444_23 + var_444_33 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_23) / var_444_33

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_23 + var_444_33 and arg_441_1.time_ < var_444_23 + var_444_33 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play413122110 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 413122110
		arg_445_1.duration_ = 13.33

		local var_445_0 = {
			zh = 6.433,
			ja = 13.333
		}
		local var_445_1 = manager.audio:GetLocalizationFlag()

		if var_445_0[var_445_1] ~= nil then
			arg_445_1.duration_ = var_445_0[var_445_1]
		end

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play413122111(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["10092_1"].transform
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 then
				arg_445_1.var_.moveOldPos10092_1 = var_448_0.localPosition
				var_448_0.localScale = Vector3.New(1, 1, 1)

				arg_445_1:CheckSpriteTmpPos("10092_1", 4)

				local var_448_2 = var_448_0.childCount

				for iter_448_0 = 0, var_448_2 - 1 do
					local var_448_3 = var_448_0:GetChild(iter_448_0)

					if var_448_3.name == "split_1_1" or not string.find(var_448_3.name, "split") then
						var_448_3.gameObject:SetActive(true)
					else
						var_448_3.gameObject:SetActive(false)
					end
				end
			end

			local var_448_4 = 0.001

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_4 then
				local var_448_5 = (arg_445_1.time_ - var_448_1) / var_448_4
				local var_448_6 = Vector3.New(390, -300, -295)

				var_448_0.localPosition = Vector3.Lerp(arg_445_1.var_.moveOldPos10092_1, var_448_6, var_448_5)
			end

			if arg_445_1.time_ >= var_448_1 + var_448_4 and arg_445_1.time_ < var_448_1 + var_448_4 + arg_448_0 then
				var_448_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_448_7 = 0
			local var_448_8 = 1

			if var_448_7 < arg_445_1.time_ and arg_445_1.time_ <= var_448_7 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_9 = arg_445_1:FormatText(StoryNameCfg[996].name)

				arg_445_1.leftNameTxt_.text = var_448_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_10 = arg_445_1:GetWordFromCfg(413122110)
				local var_448_11 = arg_445_1:FormatText(var_448_10.content)

				arg_445_1.text_.text = var_448_11

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_12 = 40
				local var_448_13 = utf8.len(var_448_11)
				local var_448_14 = var_448_12 <= 0 and var_448_8 or var_448_8 * (var_448_13 / var_448_12)

				if var_448_14 > 0 and var_448_8 < var_448_14 then
					arg_445_1.talkMaxDuration = var_448_14

					if var_448_14 + var_448_7 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_14 + var_448_7
					end
				end

				arg_445_1.text_.text = var_448_11
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122110", "story_v_out_413122.awb") ~= 0 then
					local var_448_15 = manager.audio:GetVoiceLength("story_v_out_413122", "413122110", "story_v_out_413122.awb") / 1000

					if var_448_15 + var_448_7 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_15 + var_448_7
					end

					if var_448_10.prefab_name ~= "" and arg_445_1.actors_[var_448_10.prefab_name] ~= nil then
						local var_448_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_10.prefab_name].transform, "story_v_out_413122", "413122110", "story_v_out_413122.awb")

						arg_445_1:RecordAudio("413122110", var_448_16)
						arg_445_1:RecordAudio("413122110", var_448_16)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_413122", "413122110", "story_v_out_413122.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_413122", "413122110", "story_v_out_413122.awb")
				end

				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_17 = math.max(var_448_8, arg_445_1.talkMaxDuration)

			if var_448_7 <= arg_445_1.time_ and arg_445_1.time_ < var_448_7 + var_448_17 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_7) / var_448_17

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_7 + var_448_17 and arg_445_1.time_ < var_448_7 + var_448_17 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play413122111 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 413122111
		arg_449_1.duration_ = 11.63

		local var_449_0 = {
			zh = 9.433,
			ja = 11.633
		}
		local var_449_1 = manager.audio:GetLocalizationFlag()

		if var_449_0[var_449_1] ~= nil then
			arg_449_1.duration_ = var_449_0[var_449_1]
		end

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play413122112(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 0
			local var_452_1 = 1.175

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_2 = arg_449_1:FormatText(StoryNameCfg[996].name)

				arg_449_1.leftNameTxt_.text = var_452_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_3 = arg_449_1:GetWordFromCfg(413122111)
				local var_452_4 = arg_449_1:FormatText(var_452_3.content)

				arg_449_1.text_.text = var_452_4

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_5 = 47
				local var_452_6 = utf8.len(var_452_4)
				local var_452_7 = var_452_5 <= 0 and var_452_1 or var_452_1 * (var_452_6 / var_452_5)

				if var_452_7 > 0 and var_452_1 < var_452_7 then
					arg_449_1.talkMaxDuration = var_452_7

					if var_452_7 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_7 + var_452_0
					end
				end

				arg_449_1.text_.text = var_452_4
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122111", "story_v_out_413122.awb") ~= 0 then
					local var_452_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122111", "story_v_out_413122.awb") / 1000

					if var_452_8 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_8 + var_452_0
					end

					if var_452_3.prefab_name ~= "" and arg_449_1.actors_[var_452_3.prefab_name] ~= nil then
						local var_452_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_3.prefab_name].transform, "story_v_out_413122", "413122111", "story_v_out_413122.awb")

						arg_449_1:RecordAudio("413122111", var_452_9)
						arg_449_1:RecordAudio("413122111", var_452_9)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_413122", "413122111", "story_v_out_413122.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_413122", "413122111", "story_v_out_413122.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_10 = math.max(var_452_1, arg_449_1.talkMaxDuration)

			if var_452_0 <= arg_449_1.time_ and arg_449_1.time_ < var_452_0 + var_452_10 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_0) / var_452_10

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_0 + var_452_10 and arg_449_1.time_ < var_452_0 + var_452_10 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play413122112 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 413122112
		arg_453_1.duration_ = 14.63

		local var_453_0 = {
			zh = 6.166,
			ja = 14.633
		}
		local var_453_1 = manager.audio:GetLocalizationFlag()

		if var_453_0[var_453_1] ~= nil then
			arg_453_1.duration_ = var_453_0[var_453_1]
		end

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play413122113(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["10092_1"].transform
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 then
				arg_453_1.var_.moveOldPos10092_1 = var_456_0.localPosition
				var_456_0.localScale = Vector3.New(1, 1, 1)

				arg_453_1:CheckSpriteTmpPos("10092_1", 4)

				local var_456_2 = var_456_0.childCount

				for iter_456_0 = 0, var_456_2 - 1 do
					local var_456_3 = var_456_0:GetChild(iter_456_0)

					if var_456_3.name == "split_8" or not string.find(var_456_3.name, "split") then
						var_456_3.gameObject:SetActive(true)
					else
						var_456_3.gameObject:SetActive(false)
					end
				end
			end

			local var_456_4 = 0.001

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_4 then
				local var_456_5 = (arg_453_1.time_ - var_456_1) / var_456_4
				local var_456_6 = Vector3.New(390, -300, -295)

				var_456_0.localPosition = Vector3.Lerp(arg_453_1.var_.moveOldPos10092_1, var_456_6, var_456_5)
			end

			if arg_453_1.time_ >= var_456_1 + var_456_4 and arg_453_1.time_ < var_456_1 + var_456_4 + arg_456_0 then
				var_456_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_456_7 = arg_453_1.actors_["10092_1"]
			local var_456_8 = 0

			if var_456_8 < arg_453_1.time_ and arg_453_1.time_ <= var_456_8 + arg_456_0 and arg_453_1.var_.actorSpriteComps10092_1 == nil then
				arg_453_1.var_.actorSpriteComps10092_1 = var_456_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_456_9 = 2

			if var_456_8 <= arg_453_1.time_ and arg_453_1.time_ < var_456_8 + var_456_9 then
				local var_456_10 = (arg_453_1.time_ - var_456_8) / var_456_9

				if arg_453_1.var_.actorSpriteComps10092_1 then
					for iter_456_1, iter_456_2 in pairs(arg_453_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_456_2 then
							if arg_453_1.isInRecall_ then
								local var_456_11 = Mathf.Lerp(iter_456_2.color.r, 0.82, var_456_10)
								local var_456_12 = Mathf.Lerp(iter_456_2.color.g, 0.77, var_456_10)
								local var_456_13 = Mathf.Lerp(iter_456_2.color.b, 0.62, var_456_10)

								iter_456_2.color = Color.New(var_456_11, var_456_12, var_456_13)
							else
								local var_456_14 = Mathf.Lerp(iter_456_2.color.r, 1, var_456_10)

								iter_456_2.color = Color.New(var_456_14, var_456_14, var_456_14)
							end
						end
					end
				end
			end

			if arg_453_1.time_ >= var_456_8 + var_456_9 and arg_453_1.time_ < var_456_8 + var_456_9 + arg_456_0 and arg_453_1.var_.actorSpriteComps10092_1 then
				for iter_456_3, iter_456_4 in pairs(arg_453_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_456_4 then
						if arg_453_1.isInRecall_ then
							iter_456_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_456_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_453_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_456_15 = 0
			local var_456_16 = 0.65

			if var_456_15 < arg_453_1.time_ and arg_453_1.time_ <= var_456_15 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_17 = arg_453_1:FormatText(StoryNameCfg[996].name)

				arg_453_1.leftNameTxt_.text = var_456_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_18 = arg_453_1:GetWordFromCfg(413122112)
				local var_456_19 = arg_453_1:FormatText(var_456_18.content)

				arg_453_1.text_.text = var_456_19

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_20 = 26
				local var_456_21 = utf8.len(var_456_19)
				local var_456_22 = var_456_20 <= 0 and var_456_16 or var_456_16 * (var_456_21 / var_456_20)

				if var_456_22 > 0 and var_456_16 < var_456_22 then
					arg_453_1.talkMaxDuration = var_456_22

					if var_456_22 + var_456_15 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_22 + var_456_15
					end
				end

				arg_453_1.text_.text = var_456_19
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122112", "story_v_out_413122.awb") ~= 0 then
					local var_456_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122112", "story_v_out_413122.awb") / 1000

					if var_456_23 + var_456_15 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_23 + var_456_15
					end

					if var_456_18.prefab_name ~= "" and arg_453_1.actors_[var_456_18.prefab_name] ~= nil then
						local var_456_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_18.prefab_name].transform, "story_v_out_413122", "413122112", "story_v_out_413122.awb")

						arg_453_1:RecordAudio("413122112", var_456_24)
						arg_453_1:RecordAudio("413122112", var_456_24)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_out_413122", "413122112", "story_v_out_413122.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_out_413122", "413122112", "story_v_out_413122.awb")
				end

				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_25 = math.max(var_456_16, arg_453_1.talkMaxDuration)

			if var_456_15 <= arg_453_1.time_ and arg_453_1.time_ < var_456_15 + var_456_25 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_15) / var_456_25

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_15 + var_456_25 and arg_453_1.time_ < var_456_15 + var_456_25 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play413122113 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 413122113
		arg_457_1.duration_ = 11.8

		local var_457_0 = {
			zh = 10.2996666666667,
			ja = 11.7996666666667
		}
		local var_457_1 = manager.audio:GetLocalizationFlag()

		if var_457_0[var_457_1] ~= nil then
			arg_457_1.duration_ = var_457_0[var_457_1]
		end

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play413122114(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["10022"].transform
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 then
				arg_457_1.var_.moveOldPos10022 = var_460_0.localPosition
				var_460_0.localScale = Vector3.New(1, 1, 1)

				arg_457_1:CheckSpriteTmpPos("10022", 2)

				local var_460_2 = var_460_0.childCount

				for iter_460_0 = 0, var_460_2 - 1 do
					local var_460_3 = var_460_0:GetChild(iter_460_0)

					if var_460_3.name == "split_3" or not string.find(var_460_3.name, "split") then
						var_460_3.gameObject:SetActive(true)
					else
						var_460_3.gameObject:SetActive(false)
					end
				end
			end

			local var_460_4 = 0.001

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_4 then
				local var_460_5 = (arg_457_1.time_ - var_460_1) / var_460_4
				local var_460_6 = Vector3.New(-390, -315, -320)

				var_460_0.localPosition = Vector3.Lerp(arg_457_1.var_.moveOldPos10022, var_460_6, var_460_5)
			end

			if arg_457_1.time_ >= var_460_1 + var_460_4 and arg_457_1.time_ < var_460_1 + var_460_4 + arg_460_0 then
				var_460_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_460_7 = arg_457_1.actors_["10022"]
			local var_460_8 = 0

			if var_460_8 < arg_457_1.time_ and arg_457_1.time_ <= var_460_8 + arg_460_0 and arg_457_1.var_.actorSpriteComps10022 == nil then
				arg_457_1.var_.actorSpriteComps10022 = var_460_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_460_9 = 2

			if var_460_8 <= arg_457_1.time_ and arg_457_1.time_ < var_460_8 + var_460_9 then
				local var_460_10 = (arg_457_1.time_ - var_460_8) / var_460_9

				if arg_457_1.var_.actorSpriteComps10022 then
					for iter_460_1, iter_460_2 in pairs(arg_457_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_460_2 then
							if arg_457_1.isInRecall_ then
								local var_460_11 = Mathf.Lerp(iter_460_2.color.r, 0.82, var_460_10)
								local var_460_12 = Mathf.Lerp(iter_460_2.color.g, 0.77, var_460_10)
								local var_460_13 = Mathf.Lerp(iter_460_2.color.b, 0.62, var_460_10)

								iter_460_2.color = Color.New(var_460_11, var_460_12, var_460_13)
							else
								local var_460_14 = Mathf.Lerp(iter_460_2.color.r, 1, var_460_10)

								iter_460_2.color = Color.New(var_460_14, var_460_14, var_460_14)
							end
						end
					end
				end
			end

			if arg_457_1.time_ >= var_460_8 + var_460_9 and arg_457_1.time_ < var_460_8 + var_460_9 + arg_460_0 and arg_457_1.var_.actorSpriteComps10022 then
				for iter_460_3, iter_460_4 in pairs(arg_457_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_460_4 then
						if arg_457_1.isInRecall_ then
							iter_460_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_460_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_457_1.var_.actorSpriteComps10022 = nil
			end

			local var_460_15 = arg_457_1.actors_["10092_1"]
			local var_460_16 = 0

			if var_460_16 < arg_457_1.time_ and arg_457_1.time_ <= var_460_16 + arg_460_0 and arg_457_1.var_.actorSpriteComps10092_1 == nil then
				arg_457_1.var_.actorSpriteComps10092_1 = var_460_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_460_17 = 2

			if var_460_16 <= arg_457_1.time_ and arg_457_1.time_ < var_460_16 + var_460_17 then
				local var_460_18 = (arg_457_1.time_ - var_460_16) / var_460_17

				if arg_457_1.var_.actorSpriteComps10092_1 then
					for iter_460_5, iter_460_6 in pairs(arg_457_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_460_6 then
							if arg_457_1.isInRecall_ then
								local var_460_19 = Mathf.Lerp(iter_460_6.color.r, 0.46, var_460_18)
								local var_460_20 = Mathf.Lerp(iter_460_6.color.g, 0.43, var_460_18)
								local var_460_21 = Mathf.Lerp(iter_460_6.color.b, 0.35, var_460_18)

								iter_460_6.color = Color.New(var_460_19, var_460_20, var_460_21)
							else
								local var_460_22 = Mathf.Lerp(iter_460_6.color.r, 0.5, var_460_18)

								iter_460_6.color = Color.New(var_460_22, var_460_22, var_460_22)
							end
						end
					end
				end
			end

			if arg_457_1.time_ >= var_460_16 + var_460_17 and arg_457_1.time_ < var_460_16 + var_460_17 + arg_460_0 and arg_457_1.var_.actorSpriteComps10092_1 then
				for iter_460_7, iter_460_8 in pairs(arg_457_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_460_8 then
						if arg_457_1.isInRecall_ then
							iter_460_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_460_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_457_1.var_.actorSpriteComps10092_1 = nil
			end

			if arg_457_1.frameCnt_ <= 1 then
				arg_457_1.dialog_:SetActive(false)
			end

			local var_460_23 = 0.466666666666667
			local var_460_24 = 1.25

			if var_460_23 < arg_457_1.time_ and arg_457_1.time_ <= var_460_23 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0

				arg_457_1.dialog_:SetActive(true)

				local var_460_25 = LeanTween.value(arg_457_1.dialog_, 0, 1, 0.3)

				var_460_25:setOnUpdate(LuaHelper.FloatAction(function(arg_461_0)
					arg_457_1.dialogCg_.alpha = arg_461_0
				end))
				var_460_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_457_1.dialog_)
					var_460_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_457_1.duration_ = arg_457_1.duration_ + 0.3

				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_26 = arg_457_1:FormatText(StoryNameCfg[614].name)

				arg_457_1.leftNameTxt_.text = var_460_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_27 = arg_457_1:GetWordFromCfg(413122113)
				local var_460_28 = arg_457_1:FormatText(var_460_27.content)

				arg_457_1.text_.text = var_460_28

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_29 = 50
				local var_460_30 = utf8.len(var_460_28)
				local var_460_31 = var_460_29 <= 0 and var_460_24 or var_460_24 * (var_460_30 / var_460_29)

				if var_460_31 > 0 and var_460_24 < var_460_31 then
					arg_457_1.talkMaxDuration = var_460_31
					var_460_23 = var_460_23 + 0.3

					if var_460_31 + var_460_23 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_31 + var_460_23
					end
				end

				arg_457_1.text_.text = var_460_28
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122113", "story_v_out_413122.awb") ~= 0 then
					local var_460_32 = manager.audio:GetVoiceLength("story_v_out_413122", "413122113", "story_v_out_413122.awb") / 1000

					if var_460_32 + var_460_23 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_32 + var_460_23
					end

					if var_460_27.prefab_name ~= "" and arg_457_1.actors_[var_460_27.prefab_name] ~= nil then
						local var_460_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_27.prefab_name].transform, "story_v_out_413122", "413122113", "story_v_out_413122.awb")

						arg_457_1:RecordAudio("413122113", var_460_33)
						arg_457_1:RecordAudio("413122113", var_460_33)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_413122", "413122113", "story_v_out_413122.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_413122", "413122113", "story_v_out_413122.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_34 = var_460_23 + 0.3
			local var_460_35 = math.max(var_460_24, arg_457_1.talkMaxDuration)

			if var_460_34 <= arg_457_1.time_ and arg_457_1.time_ < var_460_34 + var_460_35 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_34) / var_460_35

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_34 + var_460_35 and arg_457_1.time_ < var_460_34 + var_460_35 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play413122114 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 413122114
		arg_463_1.duration_ = 7.37

		local var_463_0 = {
			zh = 4.1,
			ja = 7.366
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
				arg_463_0:Play413122115(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["10092_1"].transform
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				arg_463_1.var_.moveOldPos10092_1 = var_466_0.localPosition
				var_466_0.localScale = Vector3.New(1, 1, 1)

				arg_463_1:CheckSpriteTmpPos("10092_1", 4)

				local var_466_2 = var_466_0.childCount

				for iter_466_0 = 0, var_466_2 - 1 do
					local var_466_3 = var_466_0:GetChild(iter_466_0)

					if var_466_3.name == "split_2" or not string.find(var_466_3.name, "split") then
						var_466_3.gameObject:SetActive(true)
					else
						var_466_3.gameObject:SetActive(false)
					end
				end
			end

			local var_466_4 = 0.001

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_4 then
				local var_466_5 = (arg_463_1.time_ - var_466_1) / var_466_4
				local var_466_6 = Vector3.New(390, -300, -295)

				var_466_0.localPosition = Vector3.Lerp(arg_463_1.var_.moveOldPos10092_1, var_466_6, var_466_5)
			end

			if arg_463_1.time_ >= var_466_1 + var_466_4 and arg_463_1.time_ < var_466_1 + var_466_4 + arg_466_0 then
				var_466_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_466_7 = arg_463_1.actors_["10022"]
			local var_466_8 = 0

			if var_466_8 < arg_463_1.time_ and arg_463_1.time_ <= var_466_8 + arg_466_0 and arg_463_1.var_.actorSpriteComps10022 == nil then
				arg_463_1.var_.actorSpriteComps10022 = var_466_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_466_9 = 2

			if var_466_8 <= arg_463_1.time_ and arg_463_1.time_ < var_466_8 + var_466_9 then
				local var_466_10 = (arg_463_1.time_ - var_466_8) / var_466_9

				if arg_463_1.var_.actorSpriteComps10022 then
					for iter_466_1, iter_466_2 in pairs(arg_463_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_466_2 then
							if arg_463_1.isInRecall_ then
								local var_466_11 = Mathf.Lerp(iter_466_2.color.r, 0.46, var_466_10)
								local var_466_12 = Mathf.Lerp(iter_466_2.color.g, 0.43, var_466_10)
								local var_466_13 = Mathf.Lerp(iter_466_2.color.b, 0.35, var_466_10)

								iter_466_2.color = Color.New(var_466_11, var_466_12, var_466_13)
							else
								local var_466_14 = Mathf.Lerp(iter_466_2.color.r, 0.5, var_466_10)

								iter_466_2.color = Color.New(var_466_14, var_466_14, var_466_14)
							end
						end
					end
				end
			end

			if arg_463_1.time_ >= var_466_8 + var_466_9 and arg_463_1.time_ < var_466_8 + var_466_9 + arg_466_0 and arg_463_1.var_.actorSpriteComps10022 then
				for iter_466_3, iter_466_4 in pairs(arg_463_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_466_4 then
						if arg_463_1.isInRecall_ then
							iter_466_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_466_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_463_1.var_.actorSpriteComps10022 = nil
			end

			local var_466_15 = arg_463_1.actors_["10092_1"]
			local var_466_16 = 0

			if var_466_16 < arg_463_1.time_ and arg_463_1.time_ <= var_466_16 + arg_466_0 and arg_463_1.var_.actorSpriteComps10092_1 == nil then
				arg_463_1.var_.actorSpriteComps10092_1 = var_466_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_466_17 = 2

			if var_466_16 <= arg_463_1.time_ and arg_463_1.time_ < var_466_16 + var_466_17 then
				local var_466_18 = (arg_463_1.time_ - var_466_16) / var_466_17

				if arg_463_1.var_.actorSpriteComps10092_1 then
					for iter_466_5, iter_466_6 in pairs(arg_463_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_466_6 then
							if arg_463_1.isInRecall_ then
								local var_466_19 = Mathf.Lerp(iter_466_6.color.r, 0.82, var_466_18)
								local var_466_20 = Mathf.Lerp(iter_466_6.color.g, 0.77, var_466_18)
								local var_466_21 = Mathf.Lerp(iter_466_6.color.b, 0.62, var_466_18)

								iter_466_6.color = Color.New(var_466_19, var_466_20, var_466_21)
							else
								local var_466_22 = Mathf.Lerp(iter_466_6.color.r, 1, var_466_18)

								iter_466_6.color = Color.New(var_466_22, var_466_22, var_466_22)
							end
						end
					end
				end
			end

			if arg_463_1.time_ >= var_466_16 + var_466_17 and arg_463_1.time_ < var_466_16 + var_466_17 + arg_466_0 and arg_463_1.var_.actorSpriteComps10092_1 then
				for iter_466_7, iter_466_8 in pairs(arg_463_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_466_8 then
						if arg_463_1.isInRecall_ then
							iter_466_8.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_466_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_463_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_466_23 = 0
			local var_466_24 = 0.55

			if var_466_23 < arg_463_1.time_ and arg_463_1.time_ <= var_466_23 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_25 = arg_463_1:FormatText(StoryNameCfg[996].name)

				arg_463_1.leftNameTxt_.text = var_466_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_26 = arg_463_1:GetWordFromCfg(413122114)
				local var_466_27 = arg_463_1:FormatText(var_466_26.content)

				arg_463_1.text_.text = var_466_27

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_28 = 22
				local var_466_29 = utf8.len(var_466_27)
				local var_466_30 = var_466_28 <= 0 and var_466_24 or var_466_24 * (var_466_29 / var_466_28)

				if var_466_30 > 0 and var_466_24 < var_466_30 then
					arg_463_1.talkMaxDuration = var_466_30

					if var_466_30 + var_466_23 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_30 + var_466_23
					end
				end

				arg_463_1.text_.text = var_466_27
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122114", "story_v_out_413122.awb") ~= 0 then
					local var_466_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122114", "story_v_out_413122.awb") / 1000

					if var_466_31 + var_466_23 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_31 + var_466_23
					end

					if var_466_26.prefab_name ~= "" and arg_463_1.actors_[var_466_26.prefab_name] ~= nil then
						local var_466_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_26.prefab_name].transform, "story_v_out_413122", "413122114", "story_v_out_413122.awb")

						arg_463_1:RecordAudio("413122114", var_466_32)
						arg_463_1:RecordAudio("413122114", var_466_32)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_out_413122", "413122114", "story_v_out_413122.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_out_413122", "413122114", "story_v_out_413122.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_33 = math.max(var_466_24, arg_463_1.talkMaxDuration)

			if var_466_23 <= arg_463_1.time_ and arg_463_1.time_ < var_466_23 + var_466_33 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_23) / var_466_33

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_23 + var_466_33 and arg_463_1.time_ < var_466_23 + var_466_33 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play413122115 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 413122115
		arg_467_1.duration_ = 10.1

		local var_467_0 = {
			zh = 8.2,
			ja = 10.1
		}
		local var_467_1 = manager.audio:GetLocalizationFlag()

		if var_467_0[var_467_1] ~= nil then
			arg_467_1.duration_ = var_467_0[var_467_1]
		end

		SetActive(arg_467_1.tipsGo_, false)

		function arg_467_1.onSingleLineFinish_()
			arg_467_1.onSingleLineUpdate_ = nil
			arg_467_1.onSingleLineFinish_ = nil
			arg_467_1.state_ = "waiting"
		end

		function arg_467_1.playNext_(arg_469_0)
			if arg_469_0 == 1 then
				arg_467_0:Play413122116(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["10092_1"].transform
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 then
				arg_467_1.var_.moveOldPos10092_1 = var_470_0.localPosition
				var_470_0.localScale = Vector3.New(1, 1, 1)

				arg_467_1:CheckSpriteTmpPos("10092_1", 4)

				local var_470_2 = var_470_0.childCount

				for iter_470_0 = 0, var_470_2 - 1 do
					local var_470_3 = var_470_0:GetChild(iter_470_0)

					if var_470_3.name == "split_1_1" or not string.find(var_470_3.name, "split") then
						var_470_3.gameObject:SetActive(true)
					else
						var_470_3.gameObject:SetActive(false)
					end
				end
			end

			local var_470_4 = 0.001

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_4 then
				local var_470_5 = (arg_467_1.time_ - var_470_1) / var_470_4
				local var_470_6 = Vector3.New(390, -300, -295)

				var_470_0.localPosition = Vector3.Lerp(arg_467_1.var_.moveOldPos10092_1, var_470_6, var_470_5)
			end

			if arg_467_1.time_ >= var_470_1 + var_470_4 and arg_467_1.time_ < var_470_1 + var_470_4 + arg_470_0 then
				var_470_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_470_7 = arg_467_1.actors_["10022"]
			local var_470_8 = 0

			if var_470_8 < arg_467_1.time_ and arg_467_1.time_ <= var_470_8 + arg_470_0 and arg_467_1.var_.actorSpriteComps10022 == nil then
				arg_467_1.var_.actorSpriteComps10022 = var_470_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_470_9 = 2

			if var_470_8 <= arg_467_1.time_ and arg_467_1.time_ < var_470_8 + var_470_9 then
				local var_470_10 = (arg_467_1.time_ - var_470_8) / var_470_9

				if arg_467_1.var_.actorSpriteComps10022 then
					for iter_470_1, iter_470_2 in pairs(arg_467_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_470_2 then
							if arg_467_1.isInRecall_ then
								local var_470_11 = Mathf.Lerp(iter_470_2.color.r, 0.82, var_470_10)
								local var_470_12 = Mathf.Lerp(iter_470_2.color.g, 0.77, var_470_10)
								local var_470_13 = Mathf.Lerp(iter_470_2.color.b, 0.62, var_470_10)

								iter_470_2.color = Color.New(var_470_11, var_470_12, var_470_13)
							else
								local var_470_14 = Mathf.Lerp(iter_470_2.color.r, 1, var_470_10)

								iter_470_2.color = Color.New(var_470_14, var_470_14, var_470_14)
							end
						end
					end
				end
			end

			if arg_467_1.time_ >= var_470_8 + var_470_9 and arg_467_1.time_ < var_470_8 + var_470_9 + arg_470_0 and arg_467_1.var_.actorSpriteComps10022 then
				for iter_470_3, iter_470_4 in pairs(arg_467_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_470_4 then
						if arg_467_1.isInRecall_ then
							iter_470_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_470_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_467_1.var_.actorSpriteComps10022 = nil
			end

			local var_470_15 = arg_467_1.actors_["10092_1"]
			local var_470_16 = 0

			if var_470_16 < arg_467_1.time_ and arg_467_1.time_ <= var_470_16 + arg_470_0 and arg_467_1.var_.actorSpriteComps10092_1 == nil then
				arg_467_1.var_.actorSpriteComps10092_1 = var_470_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_470_17 = 2

			if var_470_16 <= arg_467_1.time_ and arg_467_1.time_ < var_470_16 + var_470_17 then
				local var_470_18 = (arg_467_1.time_ - var_470_16) / var_470_17

				if arg_467_1.var_.actorSpriteComps10092_1 then
					for iter_470_5, iter_470_6 in pairs(arg_467_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_470_6 then
							if arg_467_1.isInRecall_ then
								local var_470_19 = Mathf.Lerp(iter_470_6.color.r, 0.46, var_470_18)
								local var_470_20 = Mathf.Lerp(iter_470_6.color.g, 0.43, var_470_18)
								local var_470_21 = Mathf.Lerp(iter_470_6.color.b, 0.35, var_470_18)

								iter_470_6.color = Color.New(var_470_19, var_470_20, var_470_21)
							else
								local var_470_22 = Mathf.Lerp(iter_470_6.color.r, 0.5, var_470_18)

								iter_470_6.color = Color.New(var_470_22, var_470_22, var_470_22)
							end
						end
					end
				end
			end

			if arg_467_1.time_ >= var_470_16 + var_470_17 and arg_467_1.time_ < var_470_16 + var_470_17 + arg_470_0 and arg_467_1.var_.actorSpriteComps10092_1 then
				for iter_470_7, iter_470_8 in pairs(arg_467_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_470_8 then
						if arg_467_1.isInRecall_ then
							iter_470_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_470_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_467_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_470_23 = 0
			local var_470_24 = 0.975

			if var_470_23 < arg_467_1.time_ and arg_467_1.time_ <= var_470_23 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_25 = arg_467_1:FormatText(StoryNameCfg[614].name)

				arg_467_1.leftNameTxt_.text = var_470_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_26 = arg_467_1:GetWordFromCfg(413122115)
				local var_470_27 = arg_467_1:FormatText(var_470_26.content)

				arg_467_1.text_.text = var_470_27

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_28 = 39
				local var_470_29 = utf8.len(var_470_27)
				local var_470_30 = var_470_28 <= 0 and var_470_24 or var_470_24 * (var_470_29 / var_470_28)

				if var_470_30 > 0 and var_470_24 < var_470_30 then
					arg_467_1.talkMaxDuration = var_470_30

					if var_470_30 + var_470_23 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_30 + var_470_23
					end
				end

				arg_467_1.text_.text = var_470_27
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122115", "story_v_out_413122.awb") ~= 0 then
					local var_470_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122115", "story_v_out_413122.awb") / 1000

					if var_470_31 + var_470_23 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_31 + var_470_23
					end

					if var_470_26.prefab_name ~= "" and arg_467_1.actors_[var_470_26.prefab_name] ~= nil then
						local var_470_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_26.prefab_name].transform, "story_v_out_413122", "413122115", "story_v_out_413122.awb")

						arg_467_1:RecordAudio("413122115", var_470_32)
						arg_467_1:RecordAudio("413122115", var_470_32)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_out_413122", "413122115", "story_v_out_413122.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_out_413122", "413122115", "story_v_out_413122.awb")
				end

				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_33 = math.max(var_470_24, arg_467_1.talkMaxDuration)

			if var_470_23 <= arg_467_1.time_ and arg_467_1.time_ < var_470_23 + var_470_33 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_23) / var_470_33

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_23 + var_470_33 and arg_467_1.time_ < var_470_23 + var_470_33 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play413122116 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 413122116
		arg_471_1.duration_ = 2.93

		local var_471_0 = {
			zh = 2.033,
			ja = 2.933
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
				arg_471_0:Play413122117(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["10022"].transform
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 then
				arg_471_1.var_.moveOldPos10022 = var_474_0.localPosition
				var_474_0.localScale = Vector3.New(1, 1, 1)

				arg_471_1:CheckSpriteTmpPos("10022", 2)

				local var_474_2 = var_474_0.childCount

				for iter_474_0 = 0, var_474_2 - 1 do
					local var_474_3 = var_474_0:GetChild(iter_474_0)

					if var_474_3.name == "" or not string.find(var_474_3.name, "split") then
						var_474_3.gameObject:SetActive(true)
					else
						var_474_3.gameObject:SetActive(false)
					end
				end
			end

			local var_474_4 = 0.001

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_4 then
				local var_474_5 = (arg_471_1.time_ - var_474_1) / var_474_4
				local var_474_6 = Vector3.New(-390, -315, -320)

				var_474_0.localPosition = Vector3.Lerp(arg_471_1.var_.moveOldPos10022, var_474_6, var_474_5)
			end

			if arg_471_1.time_ >= var_474_1 + var_474_4 and arg_471_1.time_ < var_474_1 + var_474_4 + arg_474_0 then
				var_474_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_474_7 = arg_471_1.actors_["10022"]
			local var_474_8 = 0

			if var_474_8 < arg_471_1.time_ and arg_471_1.time_ <= var_474_8 + arg_474_0 and arg_471_1.var_.actorSpriteComps10022 == nil then
				arg_471_1.var_.actorSpriteComps10022 = var_474_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_474_9 = 2

			if var_474_8 <= arg_471_1.time_ and arg_471_1.time_ < var_474_8 + var_474_9 then
				local var_474_10 = (arg_471_1.time_ - var_474_8) / var_474_9

				if arg_471_1.var_.actorSpriteComps10022 then
					for iter_474_1, iter_474_2 in pairs(arg_471_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_474_2 then
							if arg_471_1.isInRecall_ then
								local var_474_11 = Mathf.Lerp(iter_474_2.color.r, 0.82, var_474_10)
								local var_474_12 = Mathf.Lerp(iter_474_2.color.g, 0.77, var_474_10)
								local var_474_13 = Mathf.Lerp(iter_474_2.color.b, 0.62, var_474_10)

								iter_474_2.color = Color.New(var_474_11, var_474_12, var_474_13)
							else
								local var_474_14 = Mathf.Lerp(iter_474_2.color.r, 1, var_474_10)

								iter_474_2.color = Color.New(var_474_14, var_474_14, var_474_14)
							end
						end
					end
				end
			end

			if arg_471_1.time_ >= var_474_8 + var_474_9 and arg_471_1.time_ < var_474_8 + var_474_9 + arg_474_0 and arg_471_1.var_.actorSpriteComps10022 then
				for iter_474_3, iter_474_4 in pairs(arg_471_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_474_4 then
						if arg_471_1.isInRecall_ then
							iter_474_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_474_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_471_1.var_.actorSpriteComps10022 = nil
			end

			local var_474_15 = 0
			local var_474_16 = 0.225

			if var_474_15 < arg_471_1.time_ and arg_471_1.time_ <= var_474_15 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_17 = arg_471_1:FormatText(StoryNameCfg[614].name)

				arg_471_1.leftNameTxt_.text = var_474_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_18 = arg_471_1:GetWordFromCfg(413122116)
				local var_474_19 = arg_471_1:FormatText(var_474_18.content)

				arg_471_1.text_.text = var_474_19

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_20 = 9
				local var_474_21 = utf8.len(var_474_19)
				local var_474_22 = var_474_20 <= 0 and var_474_16 or var_474_16 * (var_474_21 / var_474_20)

				if var_474_22 > 0 and var_474_16 < var_474_22 then
					arg_471_1.talkMaxDuration = var_474_22

					if var_474_22 + var_474_15 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_22 + var_474_15
					end
				end

				arg_471_1.text_.text = var_474_19
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122116", "story_v_out_413122.awb") ~= 0 then
					local var_474_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122116", "story_v_out_413122.awb") / 1000

					if var_474_23 + var_474_15 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_23 + var_474_15
					end

					if var_474_18.prefab_name ~= "" and arg_471_1.actors_[var_474_18.prefab_name] ~= nil then
						local var_474_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_18.prefab_name].transform, "story_v_out_413122", "413122116", "story_v_out_413122.awb")

						arg_471_1:RecordAudio("413122116", var_474_24)
						arg_471_1:RecordAudio("413122116", var_474_24)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_413122", "413122116", "story_v_out_413122.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_413122", "413122116", "story_v_out_413122.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_25 = math.max(var_474_16, arg_471_1.talkMaxDuration)

			if var_474_15 <= arg_471_1.time_ and arg_471_1.time_ < var_474_15 + var_474_25 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_15) / var_474_25

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_15 + var_474_25 and arg_471_1.time_ < var_474_15 + var_474_25 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play413122117 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 413122117
		arg_475_1.duration_ = 9.3

		local var_475_0 = {
			zh = 6.266,
			ja = 9.3
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
				arg_475_0:Play413122118(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["10022"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos10022 = var_478_0.localPosition
				var_478_0.localScale = Vector3.New(1, 1, 1)

				arg_475_1:CheckSpriteTmpPos("10022", 7)

				local var_478_2 = var_478_0.childCount

				for iter_478_0 = 0, var_478_2 - 1 do
					local var_478_3 = var_478_0:GetChild(iter_478_0)

					if var_478_3.name == "" or not string.find(var_478_3.name, "split") then
						var_478_3.gameObject:SetActive(true)
					else
						var_478_3.gameObject:SetActive(false)
					end
				end
			end

			local var_478_4 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_4 then
				local var_478_5 = (arg_475_1.time_ - var_478_1) / var_478_4
				local var_478_6 = Vector3.New(0, -2000, 0)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos10022, var_478_6, var_478_5)
			end

			if arg_475_1.time_ >= var_478_1 + var_478_4 and arg_475_1.time_ < var_478_1 + var_478_4 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_478_7 = arg_475_1.actors_["10094"].transform
			local var_478_8 = 0

			if var_478_8 < arg_475_1.time_ and arg_475_1.time_ <= var_478_8 + arg_478_0 then
				arg_475_1.var_.moveOldPos10094 = var_478_7.localPosition
				var_478_7.localScale = Vector3.New(1, 1, 1)

				arg_475_1:CheckSpriteTmpPos("10094", 3)

				local var_478_9 = var_478_7.childCount

				for iter_478_1 = 0, var_478_9 - 1 do
					local var_478_10 = var_478_7:GetChild(iter_478_1)

					if var_478_10.name == "" or not string.find(var_478_10.name, "split") then
						var_478_10.gameObject:SetActive(true)
					else
						var_478_10.gameObject:SetActive(false)
					end
				end
			end

			local var_478_11 = 0.001

			if var_478_8 <= arg_475_1.time_ and arg_475_1.time_ < var_478_8 + var_478_11 then
				local var_478_12 = (arg_475_1.time_ - var_478_8) / var_478_11
				local var_478_13 = Vector3.New(0, -340, -414)

				var_478_7.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos10094, var_478_13, var_478_12)
			end

			if arg_475_1.time_ >= var_478_8 + var_478_11 and arg_475_1.time_ < var_478_8 + var_478_11 + arg_478_0 then
				var_478_7.localPosition = Vector3.New(0, -340, -414)
			end

			local var_478_14 = arg_475_1.actors_["10022"]
			local var_478_15 = 0

			if var_478_15 < arg_475_1.time_ and arg_475_1.time_ <= var_478_15 + arg_478_0 and arg_475_1.var_.actorSpriteComps10022 == nil then
				arg_475_1.var_.actorSpriteComps10022 = var_478_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_478_16 = 2

			if var_478_15 <= arg_475_1.time_ and arg_475_1.time_ < var_478_15 + var_478_16 then
				local var_478_17 = (arg_475_1.time_ - var_478_15) / var_478_16

				if arg_475_1.var_.actorSpriteComps10022 then
					for iter_478_2, iter_478_3 in pairs(arg_475_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_478_3 then
							if arg_475_1.isInRecall_ then
								local var_478_18 = Mathf.Lerp(iter_478_3.color.r, 0.46, var_478_17)
								local var_478_19 = Mathf.Lerp(iter_478_3.color.g, 0.43, var_478_17)
								local var_478_20 = Mathf.Lerp(iter_478_3.color.b, 0.35, var_478_17)

								iter_478_3.color = Color.New(var_478_18, var_478_19, var_478_20)
							else
								local var_478_21 = Mathf.Lerp(iter_478_3.color.r, 0.5, var_478_17)

								iter_478_3.color = Color.New(var_478_21, var_478_21, var_478_21)
							end
						end
					end
				end
			end

			if arg_475_1.time_ >= var_478_15 + var_478_16 and arg_475_1.time_ < var_478_15 + var_478_16 + arg_478_0 and arg_475_1.var_.actorSpriteComps10022 then
				for iter_478_4, iter_478_5 in pairs(arg_475_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_478_5 then
						if arg_475_1.isInRecall_ then
							iter_478_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_478_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_475_1.var_.actorSpriteComps10022 = nil
			end

			local var_478_22 = arg_475_1.actors_["10094"]
			local var_478_23 = 0

			if var_478_23 < arg_475_1.time_ and arg_475_1.time_ <= var_478_23 + arg_478_0 and arg_475_1.var_.actorSpriteComps10094 == nil then
				arg_475_1.var_.actorSpriteComps10094 = var_478_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_478_24 = 2

			if var_478_23 <= arg_475_1.time_ and arg_475_1.time_ < var_478_23 + var_478_24 then
				local var_478_25 = (arg_475_1.time_ - var_478_23) / var_478_24

				if arg_475_1.var_.actorSpriteComps10094 then
					for iter_478_6, iter_478_7 in pairs(arg_475_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_478_7 then
							if arg_475_1.isInRecall_ then
								local var_478_26 = Mathf.Lerp(iter_478_7.color.r, 0.82, var_478_25)
								local var_478_27 = Mathf.Lerp(iter_478_7.color.g, 0.77, var_478_25)
								local var_478_28 = Mathf.Lerp(iter_478_7.color.b, 0.62, var_478_25)

								iter_478_7.color = Color.New(var_478_26, var_478_27, var_478_28)
							else
								local var_478_29 = Mathf.Lerp(iter_478_7.color.r, 1, var_478_25)

								iter_478_7.color = Color.New(var_478_29, var_478_29, var_478_29)
							end
						end
					end
				end
			end

			if arg_475_1.time_ >= var_478_23 + var_478_24 and arg_475_1.time_ < var_478_23 + var_478_24 + arg_478_0 and arg_475_1.var_.actorSpriteComps10094 then
				for iter_478_8, iter_478_9 in pairs(arg_475_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_478_9 then
						if arg_475_1.isInRecall_ then
							iter_478_9.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_478_9.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_475_1.var_.actorSpriteComps10094 = nil
			end

			local var_478_30 = arg_475_1.actors_["10092_1"].transform
			local var_478_31 = 0

			if var_478_31 < arg_475_1.time_ and arg_475_1.time_ <= var_478_31 + arg_478_0 then
				arg_475_1.var_.moveOldPos10092_1 = var_478_30.localPosition
				var_478_30.localScale = Vector3.New(1, 1, 1)

				arg_475_1:CheckSpriteTmpPos("10092_1", 7)

				local var_478_32 = var_478_30.childCount

				for iter_478_10 = 0, var_478_32 - 1 do
					local var_478_33 = var_478_30:GetChild(iter_478_10)

					if var_478_33.name == "" or not string.find(var_478_33.name, "split") then
						var_478_33.gameObject:SetActive(true)
					else
						var_478_33.gameObject:SetActive(false)
					end
				end
			end

			local var_478_34 = 0.001

			if var_478_31 <= arg_475_1.time_ and arg_475_1.time_ < var_478_31 + var_478_34 then
				local var_478_35 = (arg_475_1.time_ - var_478_31) / var_478_34
				local var_478_36 = Vector3.New(0, -2000, 0)

				var_478_30.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos10092_1, var_478_36, var_478_35)
			end

			if arg_475_1.time_ >= var_478_31 + var_478_34 and arg_475_1.time_ < var_478_31 + var_478_34 + arg_478_0 then
				var_478_30.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_478_37 = 0
			local var_478_38 = 0.725

			if var_478_37 < arg_475_1.time_ and arg_475_1.time_ <= var_478_37 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_39 = arg_475_1:FormatText(StoryNameCfg[259].name)

				arg_475_1.leftNameTxt_.text = var_478_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_40 = arg_475_1:GetWordFromCfg(413122117)
				local var_478_41 = arg_475_1:FormatText(var_478_40.content)

				arg_475_1.text_.text = var_478_41

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_42 = 29
				local var_478_43 = utf8.len(var_478_41)
				local var_478_44 = var_478_42 <= 0 and var_478_38 or var_478_38 * (var_478_43 / var_478_42)

				if var_478_44 > 0 and var_478_38 < var_478_44 then
					arg_475_1.talkMaxDuration = var_478_44

					if var_478_44 + var_478_37 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_44 + var_478_37
					end
				end

				arg_475_1.text_.text = var_478_41
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122117", "story_v_out_413122.awb") ~= 0 then
					local var_478_45 = manager.audio:GetVoiceLength("story_v_out_413122", "413122117", "story_v_out_413122.awb") / 1000

					if var_478_45 + var_478_37 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_45 + var_478_37
					end

					if var_478_40.prefab_name ~= "" and arg_475_1.actors_[var_478_40.prefab_name] ~= nil then
						local var_478_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_40.prefab_name].transform, "story_v_out_413122", "413122117", "story_v_out_413122.awb")

						arg_475_1:RecordAudio("413122117", var_478_46)
						arg_475_1:RecordAudio("413122117", var_478_46)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_413122", "413122117", "story_v_out_413122.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_413122", "413122117", "story_v_out_413122.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_47 = math.max(var_478_38, arg_475_1.talkMaxDuration)

			if var_478_37 <= arg_475_1.time_ and arg_475_1.time_ < var_478_37 + var_478_47 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_37) / var_478_47

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_37 + var_478_47 and arg_475_1.time_ < var_478_37 + var_478_47 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play413122118 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 413122118
		arg_479_1.duration_ = 14.3

		local var_479_0 = {
			zh = 14.3,
			ja = 13.5
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
				arg_479_0:Play413122119(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["10094"]
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 and arg_479_1.var_.actorSpriteComps10094 == nil then
				arg_479_1.var_.actorSpriteComps10094 = var_482_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_482_2 = 2

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2

				if arg_479_1.var_.actorSpriteComps10094 then
					for iter_482_0, iter_482_1 in pairs(arg_479_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_482_1 then
							if arg_479_1.isInRecall_ then
								local var_482_4 = Mathf.Lerp(iter_482_1.color.r, 0.82, var_482_3)
								local var_482_5 = Mathf.Lerp(iter_482_1.color.g, 0.77, var_482_3)
								local var_482_6 = Mathf.Lerp(iter_482_1.color.b, 0.62, var_482_3)

								iter_482_1.color = Color.New(var_482_4, var_482_5, var_482_6)
							else
								local var_482_7 = Mathf.Lerp(iter_482_1.color.r, 1, var_482_3)

								iter_482_1.color = Color.New(var_482_7, var_482_7, var_482_7)
							end
						end
					end
				end
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 and arg_479_1.var_.actorSpriteComps10094 then
				for iter_482_2, iter_482_3 in pairs(arg_479_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_482_3 then
						if arg_479_1.isInRecall_ then
							iter_482_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_482_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_479_1.var_.actorSpriteComps10094 = nil
			end

			local var_482_8 = 0
			local var_482_9 = 1.45

			if var_482_8 < arg_479_1.time_ and arg_479_1.time_ <= var_482_8 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_10 = arg_479_1:FormatText(StoryNameCfg[259].name)

				arg_479_1.leftNameTxt_.text = var_482_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_11 = arg_479_1:GetWordFromCfg(413122118)
				local var_482_12 = arg_479_1:FormatText(var_482_11.content)

				arg_479_1.text_.text = var_482_12

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_13 = 58
				local var_482_14 = utf8.len(var_482_12)
				local var_482_15 = var_482_13 <= 0 and var_482_9 or var_482_9 * (var_482_14 / var_482_13)

				if var_482_15 > 0 and var_482_9 < var_482_15 then
					arg_479_1.talkMaxDuration = var_482_15

					if var_482_15 + var_482_8 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_15 + var_482_8
					end
				end

				arg_479_1.text_.text = var_482_12
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122118", "story_v_out_413122.awb") ~= 0 then
					local var_482_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122118", "story_v_out_413122.awb") / 1000

					if var_482_16 + var_482_8 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_16 + var_482_8
					end

					if var_482_11.prefab_name ~= "" and arg_479_1.actors_[var_482_11.prefab_name] ~= nil then
						local var_482_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_11.prefab_name].transform, "story_v_out_413122", "413122118", "story_v_out_413122.awb")

						arg_479_1:RecordAudio("413122118", var_482_17)
						arg_479_1:RecordAudio("413122118", var_482_17)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_413122", "413122118", "story_v_out_413122.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_413122", "413122118", "story_v_out_413122.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_18 = math.max(var_482_9, arg_479_1.talkMaxDuration)

			if var_482_8 <= arg_479_1.time_ and arg_479_1.time_ < var_482_8 + var_482_18 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_8) / var_482_18

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_8 + var_482_18 and arg_479_1.time_ < var_482_8 + var_482_18 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play413122119 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 413122119
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play413122120(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["10094"].transform
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 then
				arg_483_1.var_.moveOldPos10094 = var_486_0.localPosition
				var_486_0.localScale = Vector3.New(1, 1, 1)

				arg_483_1:CheckSpriteTmpPos("10094", 7)

				local var_486_2 = var_486_0.childCount

				for iter_486_0 = 0, var_486_2 - 1 do
					local var_486_3 = var_486_0:GetChild(iter_486_0)

					if var_486_3.name == "" or not string.find(var_486_3.name, "split") then
						var_486_3.gameObject:SetActive(true)
					else
						var_486_3.gameObject:SetActive(false)
					end
				end
			end

			local var_486_4 = 0.001

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_4 then
				local var_486_5 = (arg_483_1.time_ - var_486_1) / var_486_4
				local var_486_6 = Vector3.New(0, -2000, 0)

				var_486_0.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos10094, var_486_6, var_486_5)
			end

			if arg_483_1.time_ >= var_486_1 + var_486_4 and arg_483_1.time_ < var_486_1 + var_486_4 + arg_486_0 then
				var_486_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_486_7 = arg_483_1.actors_["10022"].transform
			local var_486_8 = 0

			if var_486_8 < arg_483_1.time_ and arg_483_1.time_ <= var_486_8 + arg_486_0 then
				arg_483_1.var_.moveOldPos10022 = var_486_7.localPosition
				var_486_7.localScale = Vector3.New(1, 1, 1)

				arg_483_1:CheckSpriteTmpPos("10022", 6)

				local var_486_9 = var_486_7.childCount

				for iter_486_1 = 0, var_486_9 - 1 do
					local var_486_10 = var_486_7:GetChild(iter_486_1)

					if var_486_10.name == "" or not string.find(var_486_10.name, "split") then
						var_486_10.gameObject:SetActive(true)
					else
						var_486_10.gameObject:SetActive(false)
					end
				end
			end

			local var_486_11 = 0.001

			if var_486_8 <= arg_483_1.time_ and arg_483_1.time_ < var_486_8 + var_486_11 then
				local var_486_12 = (arg_483_1.time_ - var_486_8) / var_486_11
				local var_486_13 = Vector3.New(1500, -315, -320)

				var_486_7.localPosition = Vector3.Lerp(arg_483_1.var_.moveOldPos10022, var_486_13, var_486_12)
			end

			if arg_483_1.time_ >= var_486_8 + var_486_11 and arg_483_1.time_ < var_486_8 + var_486_11 + arg_486_0 then
				var_486_7.localPosition = Vector3.New(1500, -315, -320)
			end

			local var_486_14 = arg_483_1.actors_["10094"]
			local var_486_15 = 0

			if var_486_15 < arg_483_1.time_ and arg_483_1.time_ <= var_486_15 + arg_486_0 and arg_483_1.var_.actorSpriteComps10094 == nil then
				arg_483_1.var_.actorSpriteComps10094 = var_486_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_486_16 = 2

			if var_486_15 <= arg_483_1.time_ and arg_483_1.time_ < var_486_15 + var_486_16 then
				local var_486_17 = (arg_483_1.time_ - var_486_15) / var_486_16

				if arg_483_1.var_.actorSpriteComps10094 then
					for iter_486_2, iter_486_3 in pairs(arg_483_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_486_3 then
							if arg_483_1.isInRecall_ then
								local var_486_18 = Mathf.Lerp(iter_486_3.color.r, 0.46, var_486_17)
								local var_486_19 = Mathf.Lerp(iter_486_3.color.g, 0.43, var_486_17)
								local var_486_20 = Mathf.Lerp(iter_486_3.color.b, 0.35, var_486_17)

								iter_486_3.color = Color.New(var_486_18, var_486_19, var_486_20)
							else
								local var_486_21 = Mathf.Lerp(iter_486_3.color.r, 0.5, var_486_17)

								iter_486_3.color = Color.New(var_486_21, var_486_21, var_486_21)
							end
						end
					end
				end
			end

			if arg_483_1.time_ >= var_486_15 + var_486_16 and arg_483_1.time_ < var_486_15 + var_486_16 + arg_486_0 and arg_483_1.var_.actorSpriteComps10094 then
				for iter_486_4, iter_486_5 in pairs(arg_483_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_486_5 then
						if arg_483_1.isInRecall_ then
							iter_486_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_486_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_483_1.var_.actorSpriteComps10094 = nil
			end

			local var_486_22 = arg_483_1.actors_["10022"]
			local var_486_23 = 0

			if var_486_23 < arg_483_1.time_ and arg_483_1.time_ <= var_486_23 + arg_486_0 and arg_483_1.var_.actorSpriteComps10022 == nil then
				arg_483_1.var_.actorSpriteComps10022 = var_486_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_486_24 = 2

			if var_486_23 <= arg_483_1.time_ and arg_483_1.time_ < var_486_23 + var_486_24 then
				local var_486_25 = (arg_483_1.time_ - var_486_23) / var_486_24

				if arg_483_1.var_.actorSpriteComps10022 then
					for iter_486_6, iter_486_7 in pairs(arg_483_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_486_7 then
							if arg_483_1.isInRecall_ then
								local var_486_26 = Mathf.Lerp(iter_486_7.color.r, 0.46, var_486_25)
								local var_486_27 = Mathf.Lerp(iter_486_7.color.g, 0.43, var_486_25)
								local var_486_28 = Mathf.Lerp(iter_486_7.color.b, 0.35, var_486_25)

								iter_486_7.color = Color.New(var_486_26, var_486_27, var_486_28)
							else
								local var_486_29 = Mathf.Lerp(iter_486_7.color.r, 0.5, var_486_25)

								iter_486_7.color = Color.New(var_486_29, var_486_29, var_486_29)
							end
						end
					end
				end
			end

			if arg_483_1.time_ >= var_486_23 + var_486_24 and arg_483_1.time_ < var_486_23 + var_486_24 + arg_486_0 and arg_483_1.var_.actorSpriteComps10022 then
				for iter_486_8, iter_486_9 in pairs(arg_483_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_486_9 then
						if arg_483_1.isInRecall_ then
							iter_486_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_486_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_483_1.var_.actorSpriteComps10022 = nil
			end

			local var_486_30 = 0
			local var_486_31 = 0.725

			if var_486_30 < arg_483_1.time_ and arg_483_1.time_ <= var_486_30 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, false)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_32 = arg_483_1:GetWordFromCfg(413122119)
				local var_486_33 = arg_483_1:FormatText(var_486_32.content)

				arg_483_1.text_.text = var_486_33

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_34 = 29
				local var_486_35 = utf8.len(var_486_33)
				local var_486_36 = var_486_34 <= 0 and var_486_31 or var_486_31 * (var_486_35 / var_486_34)

				if var_486_36 > 0 and var_486_31 < var_486_36 then
					arg_483_1.talkMaxDuration = var_486_36

					if var_486_36 + var_486_30 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_36 + var_486_30
					end
				end

				arg_483_1.text_.text = var_486_33
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_37 = math.max(var_486_31, arg_483_1.talkMaxDuration)

			if var_486_30 <= arg_483_1.time_ and arg_483_1.time_ < var_486_30 + var_486_37 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_30) / var_486_37

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_30 + var_486_37 and arg_483_1.time_ < var_486_30 + var_486_37 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play413122120 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 413122120
		arg_487_1.duration_ = 3.67

		local var_487_0 = {
			zh = 2.7,
			ja = 3.666
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
				arg_487_0:Play413122121(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["10022"].transform
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 then
				arg_487_1.var_.moveOldPos10022 = var_490_0.localPosition
				var_490_0.localScale = Vector3.New(1, 1, 1)

				arg_487_1:CheckSpriteTmpPos("10022", 2)

				local var_490_2 = var_490_0.childCount

				for iter_490_0 = 0, var_490_2 - 1 do
					local var_490_3 = var_490_0:GetChild(iter_490_0)

					if var_490_3.name == "split_3" or not string.find(var_490_3.name, "split") then
						var_490_3.gameObject:SetActive(true)
					else
						var_490_3.gameObject:SetActive(false)
					end
				end
			end

			local var_490_4 = 0.001

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_4 then
				local var_490_5 = (arg_487_1.time_ - var_490_1) / var_490_4
				local var_490_6 = Vector3.New(-390, -315, -320)

				var_490_0.localPosition = Vector3.Lerp(arg_487_1.var_.moveOldPos10022, var_490_6, var_490_5)
			end

			if arg_487_1.time_ >= var_490_1 + var_490_4 and arg_487_1.time_ < var_490_1 + var_490_4 + arg_490_0 then
				var_490_0.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_490_7 = arg_487_1.actors_["10022"]
			local var_490_8 = 0

			if var_490_8 < arg_487_1.time_ and arg_487_1.time_ <= var_490_8 + arg_490_0 and arg_487_1.var_.actorSpriteComps10022 == nil then
				arg_487_1.var_.actorSpriteComps10022 = var_490_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_490_9 = 2

			if var_490_8 <= arg_487_1.time_ and arg_487_1.time_ < var_490_8 + var_490_9 then
				local var_490_10 = (arg_487_1.time_ - var_490_8) / var_490_9

				if arg_487_1.var_.actorSpriteComps10022 then
					for iter_490_1, iter_490_2 in pairs(arg_487_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_490_2 then
							if arg_487_1.isInRecall_ then
								local var_490_11 = Mathf.Lerp(iter_490_2.color.r, 0.82, var_490_10)
								local var_490_12 = Mathf.Lerp(iter_490_2.color.g, 0.77, var_490_10)
								local var_490_13 = Mathf.Lerp(iter_490_2.color.b, 0.62, var_490_10)

								iter_490_2.color = Color.New(var_490_11, var_490_12, var_490_13)
							else
								local var_490_14 = Mathf.Lerp(iter_490_2.color.r, 1, var_490_10)

								iter_490_2.color = Color.New(var_490_14, var_490_14, var_490_14)
							end
						end
					end
				end
			end

			if arg_487_1.time_ >= var_490_8 + var_490_9 and arg_487_1.time_ < var_490_8 + var_490_9 + arg_490_0 and arg_487_1.var_.actorSpriteComps10022 then
				for iter_490_3, iter_490_4 in pairs(arg_487_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_490_4 then
						if arg_487_1.isInRecall_ then
							iter_490_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_490_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_487_1.var_.actorSpriteComps10022 = nil
			end

			local var_490_15 = 0
			local var_490_16 = 0.35

			if var_490_15 < arg_487_1.time_ and arg_487_1.time_ <= var_490_15 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_17 = arg_487_1:FormatText(StoryNameCfg[614].name)

				arg_487_1.leftNameTxt_.text = var_490_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_18 = arg_487_1:GetWordFromCfg(413122120)
				local var_490_19 = arg_487_1:FormatText(var_490_18.content)

				arg_487_1.text_.text = var_490_19

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_20 = 14
				local var_490_21 = utf8.len(var_490_19)
				local var_490_22 = var_490_20 <= 0 and var_490_16 or var_490_16 * (var_490_21 / var_490_20)

				if var_490_22 > 0 and var_490_16 < var_490_22 then
					arg_487_1.talkMaxDuration = var_490_22

					if var_490_22 + var_490_15 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_22 + var_490_15
					end
				end

				arg_487_1.text_.text = var_490_19
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122120", "story_v_out_413122.awb") ~= 0 then
					local var_490_23 = manager.audio:GetVoiceLength("story_v_out_413122", "413122120", "story_v_out_413122.awb") / 1000

					if var_490_23 + var_490_15 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_23 + var_490_15
					end

					if var_490_18.prefab_name ~= "" and arg_487_1.actors_[var_490_18.prefab_name] ~= nil then
						local var_490_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_18.prefab_name].transform, "story_v_out_413122", "413122120", "story_v_out_413122.awb")

						arg_487_1:RecordAudio("413122120", var_490_24)
						arg_487_1:RecordAudio("413122120", var_490_24)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_out_413122", "413122120", "story_v_out_413122.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_out_413122", "413122120", "story_v_out_413122.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_25 = math.max(var_490_16, arg_487_1.talkMaxDuration)

			if var_490_15 <= arg_487_1.time_ and arg_487_1.time_ < var_490_15 + var_490_25 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_15) / var_490_25

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_15 + var_490_25 and arg_487_1.time_ < var_490_15 + var_490_25 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play413122121 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 413122121
		arg_491_1.duration_ = 5.7

		local var_491_0 = {
			zh = 5.533,
			ja = 5.7
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
				arg_491_0:Play413122122(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["10092_1"].transform
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 then
				arg_491_1.var_.moveOldPos10092_1 = var_494_0.localPosition
				var_494_0.localScale = Vector3.New(1, 1, 1)

				arg_491_1:CheckSpriteTmpPos("10092_1", 4)

				local var_494_2 = var_494_0.childCount

				for iter_494_0 = 0, var_494_2 - 1 do
					local var_494_3 = var_494_0:GetChild(iter_494_0)

					if var_494_3.name == "split_1_1" or not string.find(var_494_3.name, "split") then
						var_494_3.gameObject:SetActive(true)
					else
						var_494_3.gameObject:SetActive(false)
					end
				end
			end

			local var_494_4 = 0.001

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_4 then
				local var_494_5 = (arg_491_1.time_ - var_494_1) / var_494_4
				local var_494_6 = Vector3.New(390, -300, -295)

				var_494_0.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPos10092_1, var_494_6, var_494_5)
			end

			if arg_491_1.time_ >= var_494_1 + var_494_4 and arg_491_1.time_ < var_494_1 + var_494_4 + arg_494_0 then
				var_494_0.localPosition = Vector3.New(390, -300, -295)
			end

			local var_494_7 = arg_491_1.actors_["10022"].transform
			local var_494_8 = 0

			if var_494_8 < arg_491_1.time_ and arg_491_1.time_ <= var_494_8 + arg_494_0 then
				arg_491_1.var_.moveOldPos10022 = var_494_7.localPosition
				var_494_7.localScale = Vector3.New(1, 1, 1)

				arg_491_1:CheckSpriteTmpPos("10022", 2)

				local var_494_9 = var_494_7.childCount

				for iter_494_1 = 0, var_494_9 - 1 do
					local var_494_10 = var_494_7:GetChild(iter_494_1)

					if var_494_10.name == "split_3" or not string.find(var_494_10.name, "split") then
						var_494_10.gameObject:SetActive(true)
					else
						var_494_10.gameObject:SetActive(false)
					end
				end
			end

			local var_494_11 = 0.001

			if var_494_8 <= arg_491_1.time_ and arg_491_1.time_ < var_494_8 + var_494_11 then
				local var_494_12 = (arg_491_1.time_ - var_494_8) / var_494_11
				local var_494_13 = Vector3.New(-390, -315, -320)

				var_494_7.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPos10022, var_494_13, var_494_12)
			end

			if arg_491_1.time_ >= var_494_8 + var_494_11 and arg_491_1.time_ < var_494_8 + var_494_11 + arg_494_0 then
				var_494_7.localPosition = Vector3.New(-390, -315, -320)
			end

			local var_494_14 = arg_491_1.actors_["10092_1"]
			local var_494_15 = 0

			if var_494_15 < arg_491_1.time_ and arg_491_1.time_ <= var_494_15 + arg_494_0 and arg_491_1.var_.actorSpriteComps10092_1 == nil then
				arg_491_1.var_.actorSpriteComps10092_1 = var_494_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_494_16 = 2

			if var_494_15 <= arg_491_1.time_ and arg_491_1.time_ < var_494_15 + var_494_16 then
				local var_494_17 = (arg_491_1.time_ - var_494_15) / var_494_16

				if arg_491_1.var_.actorSpriteComps10092_1 then
					for iter_494_2, iter_494_3 in pairs(arg_491_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_494_3 then
							if arg_491_1.isInRecall_ then
								local var_494_18 = Mathf.Lerp(iter_494_3.color.r, 0.82, var_494_17)
								local var_494_19 = Mathf.Lerp(iter_494_3.color.g, 0.77, var_494_17)
								local var_494_20 = Mathf.Lerp(iter_494_3.color.b, 0.62, var_494_17)

								iter_494_3.color = Color.New(var_494_18, var_494_19, var_494_20)
							else
								local var_494_21 = Mathf.Lerp(iter_494_3.color.r, 1, var_494_17)

								iter_494_3.color = Color.New(var_494_21, var_494_21, var_494_21)
							end
						end
					end
				end
			end

			if arg_491_1.time_ >= var_494_15 + var_494_16 and arg_491_1.time_ < var_494_15 + var_494_16 + arg_494_0 and arg_491_1.var_.actorSpriteComps10092_1 then
				for iter_494_4, iter_494_5 in pairs(arg_491_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_494_5 then
						if arg_491_1.isInRecall_ then
							iter_494_5.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_494_5.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_491_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_494_22 = arg_491_1.actors_["10022"]
			local var_494_23 = 0

			if var_494_23 < arg_491_1.time_ and arg_491_1.time_ <= var_494_23 + arg_494_0 and arg_491_1.var_.actorSpriteComps10022 == nil then
				arg_491_1.var_.actorSpriteComps10022 = var_494_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_494_24 = 2

			if var_494_23 <= arg_491_1.time_ and arg_491_1.time_ < var_494_23 + var_494_24 then
				local var_494_25 = (arg_491_1.time_ - var_494_23) / var_494_24

				if arg_491_1.var_.actorSpriteComps10022 then
					for iter_494_6, iter_494_7 in pairs(arg_491_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_494_7 then
							if arg_491_1.isInRecall_ then
								local var_494_26 = Mathf.Lerp(iter_494_7.color.r, 0.46, var_494_25)
								local var_494_27 = Mathf.Lerp(iter_494_7.color.g, 0.43, var_494_25)
								local var_494_28 = Mathf.Lerp(iter_494_7.color.b, 0.35, var_494_25)

								iter_494_7.color = Color.New(var_494_26, var_494_27, var_494_28)
							else
								local var_494_29 = Mathf.Lerp(iter_494_7.color.r, 0.5, var_494_25)

								iter_494_7.color = Color.New(var_494_29, var_494_29, var_494_29)
							end
						end
					end
				end
			end

			if arg_491_1.time_ >= var_494_23 + var_494_24 and arg_491_1.time_ < var_494_23 + var_494_24 + arg_494_0 and arg_491_1.var_.actorSpriteComps10022 then
				for iter_494_8, iter_494_9 in pairs(arg_491_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_494_9 then
						if arg_491_1.isInRecall_ then
							iter_494_9.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_494_9.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_491_1.var_.actorSpriteComps10022 = nil
			end

			local var_494_30 = 0
			local var_494_31 = 0.7

			if var_494_30 < arg_491_1.time_ and arg_491_1.time_ <= var_494_30 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_32 = arg_491_1:FormatText(StoryNameCfg[996].name)

				arg_491_1.leftNameTxt_.text = var_494_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_33 = arg_491_1:GetWordFromCfg(413122121)
				local var_494_34 = arg_491_1:FormatText(var_494_33.content)

				arg_491_1.text_.text = var_494_34

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_35 = 28
				local var_494_36 = utf8.len(var_494_34)
				local var_494_37 = var_494_35 <= 0 and var_494_31 or var_494_31 * (var_494_36 / var_494_35)

				if var_494_37 > 0 and var_494_31 < var_494_37 then
					arg_491_1.talkMaxDuration = var_494_37

					if var_494_37 + var_494_30 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_37 + var_494_30
					end
				end

				arg_491_1.text_.text = var_494_34
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122121", "story_v_out_413122.awb") ~= 0 then
					local var_494_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122121", "story_v_out_413122.awb") / 1000

					if var_494_38 + var_494_30 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_38 + var_494_30
					end

					if var_494_33.prefab_name ~= "" and arg_491_1.actors_[var_494_33.prefab_name] ~= nil then
						local var_494_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_33.prefab_name].transform, "story_v_out_413122", "413122121", "story_v_out_413122.awb")

						arg_491_1:RecordAudio("413122121", var_494_39)
						arg_491_1:RecordAudio("413122121", var_494_39)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_413122", "413122121", "story_v_out_413122.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_413122", "413122121", "story_v_out_413122.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_40 = math.max(var_494_31, arg_491_1.talkMaxDuration)

			if var_494_30 <= arg_491_1.time_ and arg_491_1.time_ < var_494_30 + var_494_40 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_30) / var_494_40

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_30 + var_494_40 and arg_491_1.time_ < var_494_30 + var_494_40 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play413122122 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 413122122
		arg_495_1.duration_ = 9.67

		local var_495_0 = {
			zh = 6.7,
			ja = 9.666
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
				arg_495_0:Play413122123(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["10022"].transform
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 then
				arg_495_1.var_.moveOldPos10022 = var_498_0.localPosition
				var_498_0.localScale = Vector3.New(1, 1, 1)

				arg_495_1:CheckSpriteTmpPos("10022", 6)

				local var_498_2 = var_498_0.childCount

				for iter_498_0 = 0, var_498_2 - 1 do
					local var_498_3 = var_498_0:GetChild(iter_498_0)

					if var_498_3.name == "" or not string.find(var_498_3.name, "split") then
						var_498_3.gameObject:SetActive(true)
					else
						var_498_3.gameObject:SetActive(false)
					end
				end
			end

			local var_498_4 = 0.001

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_4 then
				local var_498_5 = (arg_495_1.time_ - var_498_1) / var_498_4
				local var_498_6 = Vector3.New(1500, -315, -320)

				var_498_0.localPosition = Vector3.Lerp(arg_495_1.var_.moveOldPos10022, var_498_6, var_498_5)
			end

			if arg_495_1.time_ >= var_498_1 + var_498_4 and arg_495_1.time_ < var_498_1 + var_498_4 + arg_498_0 then
				var_498_0.localPosition = Vector3.New(1500, -315, -320)
			end

			local var_498_7 = arg_495_1.actors_["10092_1"].transform
			local var_498_8 = 0

			if var_498_8 < arg_495_1.time_ and arg_495_1.time_ <= var_498_8 + arg_498_0 then
				arg_495_1.var_.moveOldPos10092_1 = var_498_7.localPosition
				var_498_7.localScale = Vector3.New(1, 1, 1)

				arg_495_1:CheckSpriteTmpPos("10092_1", 6)

				local var_498_9 = var_498_7.childCount

				for iter_498_1 = 0, var_498_9 - 1 do
					local var_498_10 = var_498_7:GetChild(iter_498_1)

					if var_498_10.name == "" or not string.find(var_498_10.name, "split") then
						var_498_10.gameObject:SetActive(true)
					else
						var_498_10.gameObject:SetActive(false)
					end
				end
			end

			local var_498_11 = 0.001

			if var_498_8 <= arg_495_1.time_ and arg_495_1.time_ < var_498_8 + var_498_11 then
				local var_498_12 = (arg_495_1.time_ - var_498_8) / var_498_11
				local var_498_13 = Vector3.New(1500, -300, -295)

				var_498_7.localPosition = Vector3.Lerp(arg_495_1.var_.moveOldPos10092_1, var_498_13, var_498_12)
			end

			if arg_495_1.time_ >= var_498_8 + var_498_11 and arg_495_1.time_ < var_498_8 + var_498_11 + arg_498_0 then
				var_498_7.localPosition = Vector3.New(1500, -300, -295)
			end

			local var_498_14 = arg_495_1.actors_["10094"].transform
			local var_498_15 = 0

			if var_498_15 < arg_495_1.time_ and arg_495_1.time_ <= var_498_15 + arg_498_0 then
				arg_495_1.var_.moveOldPos10094 = var_498_14.localPosition
				var_498_14.localScale = Vector3.New(1, 1, 1)

				arg_495_1:CheckSpriteTmpPos("10094", 3)

				local var_498_16 = var_498_14.childCount

				for iter_498_2 = 0, var_498_16 - 1 do
					local var_498_17 = var_498_14:GetChild(iter_498_2)

					if var_498_17.name == "" or not string.find(var_498_17.name, "split") then
						var_498_17.gameObject:SetActive(true)
					else
						var_498_17.gameObject:SetActive(false)
					end
				end
			end

			local var_498_18 = 0.001

			if var_498_15 <= arg_495_1.time_ and arg_495_1.time_ < var_498_15 + var_498_18 then
				local var_498_19 = (arg_495_1.time_ - var_498_15) / var_498_18
				local var_498_20 = Vector3.New(0, -340, -414)

				var_498_14.localPosition = Vector3.Lerp(arg_495_1.var_.moveOldPos10094, var_498_20, var_498_19)
			end

			if arg_495_1.time_ >= var_498_15 + var_498_18 and arg_495_1.time_ < var_498_15 + var_498_18 + arg_498_0 then
				var_498_14.localPosition = Vector3.New(0, -340, -414)
			end

			local var_498_21 = arg_495_1.actors_["10022"]
			local var_498_22 = 0

			if var_498_22 < arg_495_1.time_ and arg_495_1.time_ <= var_498_22 + arg_498_0 and arg_495_1.var_.actorSpriteComps10022 == nil then
				arg_495_1.var_.actorSpriteComps10022 = var_498_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_498_23 = 2

			if var_498_22 <= arg_495_1.time_ and arg_495_1.time_ < var_498_22 + var_498_23 then
				local var_498_24 = (arg_495_1.time_ - var_498_22) / var_498_23

				if arg_495_1.var_.actorSpriteComps10022 then
					for iter_498_3, iter_498_4 in pairs(arg_495_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_498_4 then
							if arg_495_1.isInRecall_ then
								local var_498_25 = Mathf.Lerp(iter_498_4.color.r, 0.46, var_498_24)
								local var_498_26 = Mathf.Lerp(iter_498_4.color.g, 0.43, var_498_24)
								local var_498_27 = Mathf.Lerp(iter_498_4.color.b, 0.35, var_498_24)

								iter_498_4.color = Color.New(var_498_25, var_498_26, var_498_27)
							else
								local var_498_28 = Mathf.Lerp(iter_498_4.color.r, 0.5, var_498_24)

								iter_498_4.color = Color.New(var_498_28, var_498_28, var_498_28)
							end
						end
					end
				end
			end

			if arg_495_1.time_ >= var_498_22 + var_498_23 and arg_495_1.time_ < var_498_22 + var_498_23 + arg_498_0 and arg_495_1.var_.actorSpriteComps10022 then
				for iter_498_5, iter_498_6 in pairs(arg_495_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_498_6 then
						if arg_495_1.isInRecall_ then
							iter_498_6.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_498_6.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_495_1.var_.actorSpriteComps10022 = nil
			end

			local var_498_29 = arg_495_1.actors_["10092_1"]
			local var_498_30 = 0

			if var_498_30 < arg_495_1.time_ and arg_495_1.time_ <= var_498_30 + arg_498_0 and arg_495_1.var_.actorSpriteComps10092_1 == nil then
				arg_495_1.var_.actorSpriteComps10092_1 = var_498_29:GetComponentsInChildren(typeof(Image), true)
			end

			local var_498_31 = 2

			if var_498_30 <= arg_495_1.time_ and arg_495_1.time_ < var_498_30 + var_498_31 then
				local var_498_32 = (arg_495_1.time_ - var_498_30) / var_498_31

				if arg_495_1.var_.actorSpriteComps10092_1 then
					for iter_498_7, iter_498_8 in pairs(arg_495_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_498_8 then
							if arg_495_1.isInRecall_ then
								local var_498_33 = Mathf.Lerp(iter_498_8.color.r, 0.46, var_498_32)
								local var_498_34 = Mathf.Lerp(iter_498_8.color.g, 0.43, var_498_32)
								local var_498_35 = Mathf.Lerp(iter_498_8.color.b, 0.35, var_498_32)

								iter_498_8.color = Color.New(var_498_33, var_498_34, var_498_35)
							else
								local var_498_36 = Mathf.Lerp(iter_498_8.color.r, 0.5, var_498_32)

								iter_498_8.color = Color.New(var_498_36, var_498_36, var_498_36)
							end
						end
					end
				end
			end

			if arg_495_1.time_ >= var_498_30 + var_498_31 and arg_495_1.time_ < var_498_30 + var_498_31 + arg_498_0 and arg_495_1.var_.actorSpriteComps10092_1 then
				for iter_498_9, iter_498_10 in pairs(arg_495_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_498_10 then
						if arg_495_1.isInRecall_ then
							iter_498_10.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_498_10.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_495_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_498_37 = arg_495_1.actors_["10094"]
			local var_498_38 = 0

			if var_498_38 < arg_495_1.time_ and arg_495_1.time_ <= var_498_38 + arg_498_0 and arg_495_1.var_.actorSpriteComps10094 == nil then
				arg_495_1.var_.actorSpriteComps10094 = var_498_37:GetComponentsInChildren(typeof(Image), true)
			end

			local var_498_39 = 2

			if var_498_38 <= arg_495_1.time_ and arg_495_1.time_ < var_498_38 + var_498_39 then
				local var_498_40 = (arg_495_1.time_ - var_498_38) / var_498_39

				if arg_495_1.var_.actorSpriteComps10094 then
					for iter_498_11, iter_498_12 in pairs(arg_495_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_498_12 then
							if arg_495_1.isInRecall_ then
								local var_498_41 = Mathf.Lerp(iter_498_12.color.r, 0.82, var_498_40)
								local var_498_42 = Mathf.Lerp(iter_498_12.color.g, 0.77, var_498_40)
								local var_498_43 = Mathf.Lerp(iter_498_12.color.b, 0.62, var_498_40)

								iter_498_12.color = Color.New(var_498_41, var_498_42, var_498_43)
							else
								local var_498_44 = Mathf.Lerp(iter_498_12.color.r, 1, var_498_40)

								iter_498_12.color = Color.New(var_498_44, var_498_44, var_498_44)
							end
						end
					end
				end
			end

			if arg_495_1.time_ >= var_498_38 + var_498_39 and arg_495_1.time_ < var_498_38 + var_498_39 + arg_498_0 and arg_495_1.var_.actorSpriteComps10094 then
				for iter_498_13, iter_498_14 in pairs(arg_495_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_498_14 then
						if arg_495_1.isInRecall_ then
							iter_498_14.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_498_14.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_495_1.var_.actorSpriteComps10094 = nil
			end

			local var_498_45 = 0
			local var_498_46 = 0.875

			if var_498_45 < arg_495_1.time_ and arg_495_1.time_ <= var_498_45 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_47 = arg_495_1:FormatText(StoryNameCfg[259].name)

				arg_495_1.leftNameTxt_.text = var_498_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_48 = arg_495_1:GetWordFromCfg(413122122)
				local var_498_49 = arg_495_1:FormatText(var_498_48.content)

				arg_495_1.text_.text = var_498_49

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_50 = 35
				local var_498_51 = utf8.len(var_498_49)
				local var_498_52 = var_498_50 <= 0 and var_498_46 or var_498_46 * (var_498_51 / var_498_50)

				if var_498_52 > 0 and var_498_46 < var_498_52 then
					arg_495_1.talkMaxDuration = var_498_52

					if var_498_52 + var_498_45 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_52 + var_498_45
					end
				end

				arg_495_1.text_.text = var_498_49
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122122", "story_v_out_413122.awb") ~= 0 then
					local var_498_53 = manager.audio:GetVoiceLength("story_v_out_413122", "413122122", "story_v_out_413122.awb") / 1000

					if var_498_53 + var_498_45 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_53 + var_498_45
					end

					if var_498_48.prefab_name ~= "" and arg_495_1.actors_[var_498_48.prefab_name] ~= nil then
						local var_498_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_48.prefab_name].transform, "story_v_out_413122", "413122122", "story_v_out_413122.awb")

						arg_495_1:RecordAudio("413122122", var_498_54)
						arg_495_1:RecordAudio("413122122", var_498_54)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_413122", "413122122", "story_v_out_413122.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_413122", "413122122", "story_v_out_413122.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_55 = math.max(var_498_46, arg_495_1.talkMaxDuration)

			if var_498_45 <= arg_495_1.time_ and arg_495_1.time_ < var_498_45 + var_498_55 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_45) / var_498_55

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_45 + var_498_55 and arg_495_1.time_ < var_498_45 + var_498_55 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play413122123 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 413122123
		arg_499_1.duration_ = 11.7

		local var_499_0 = {
			zh = 7.633,
			ja = 11.7
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
				arg_499_0:Play413122124(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["10094"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 and arg_499_1.var_.actorSpriteComps10094 == nil then
				arg_499_1.var_.actorSpriteComps10094 = var_502_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_502_2 = 2

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2

				if arg_499_1.var_.actorSpriteComps10094 then
					for iter_502_0, iter_502_1 in pairs(arg_499_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_502_1 then
							if arg_499_1.isInRecall_ then
								local var_502_4 = Mathf.Lerp(iter_502_1.color.r, 0.82, var_502_3)
								local var_502_5 = Mathf.Lerp(iter_502_1.color.g, 0.77, var_502_3)
								local var_502_6 = Mathf.Lerp(iter_502_1.color.b, 0.62, var_502_3)

								iter_502_1.color = Color.New(var_502_4, var_502_5, var_502_6)
							else
								local var_502_7 = Mathf.Lerp(iter_502_1.color.r, 1, var_502_3)

								iter_502_1.color = Color.New(var_502_7, var_502_7, var_502_7)
							end
						end
					end
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 and arg_499_1.var_.actorSpriteComps10094 then
				for iter_502_2, iter_502_3 in pairs(arg_499_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_502_3 then
						if arg_499_1.isInRecall_ then
							iter_502_3.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_502_3.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_499_1.var_.actorSpriteComps10094 = nil
			end

			local var_502_8 = 0
			local var_502_9 = 0.825

			if var_502_8 < arg_499_1.time_ and arg_499_1.time_ <= var_502_8 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_10 = arg_499_1:FormatText(StoryNameCfg[259].name)

				arg_499_1.leftNameTxt_.text = var_502_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_11 = arg_499_1:GetWordFromCfg(413122123)
				local var_502_12 = arg_499_1:FormatText(var_502_11.content)

				arg_499_1.text_.text = var_502_12

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_13 = 33
				local var_502_14 = utf8.len(var_502_12)
				local var_502_15 = var_502_13 <= 0 and var_502_9 or var_502_9 * (var_502_14 / var_502_13)

				if var_502_15 > 0 and var_502_9 < var_502_15 then
					arg_499_1.talkMaxDuration = var_502_15

					if var_502_15 + var_502_8 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_15 + var_502_8
					end
				end

				arg_499_1.text_.text = var_502_12
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122123", "story_v_out_413122.awb") ~= 0 then
					local var_502_16 = manager.audio:GetVoiceLength("story_v_out_413122", "413122123", "story_v_out_413122.awb") / 1000

					if var_502_16 + var_502_8 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_16 + var_502_8
					end

					if var_502_11.prefab_name ~= "" and arg_499_1.actors_[var_502_11.prefab_name] ~= nil then
						local var_502_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_11.prefab_name].transform, "story_v_out_413122", "413122123", "story_v_out_413122.awb")

						arg_499_1:RecordAudio("413122123", var_502_17)
						arg_499_1:RecordAudio("413122123", var_502_17)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_out_413122", "413122123", "story_v_out_413122.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_out_413122", "413122123", "story_v_out_413122.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_18 = math.max(var_502_9, arg_499_1.talkMaxDuration)

			if var_502_8 <= arg_499_1.time_ and arg_499_1.time_ < var_502_8 + var_502_18 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_8) / var_502_18

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_8 + var_502_18 and arg_499_1.time_ < var_502_8 + var_502_18 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play413122124 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 413122124
		arg_503_1.duration_ = 2.7

		local var_503_0 = {
			zh = 2.3,
			ja = 2.7
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
				arg_503_0:Play413122125(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["10094"].transform
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 then
				arg_503_1.var_.moveOldPos10094 = var_506_0.localPosition
				var_506_0.localScale = Vector3.New(1, 1, 1)

				arg_503_1:CheckSpriteTmpPos("10094", 6)

				local var_506_2 = var_506_0.childCount

				for iter_506_0 = 0, var_506_2 - 1 do
					local var_506_3 = var_506_0:GetChild(iter_506_0)

					if var_506_3.name == "" or not string.find(var_506_3.name, "split") then
						var_506_3.gameObject:SetActive(true)
					else
						var_506_3.gameObject:SetActive(false)
					end
				end
			end

			local var_506_4 = 0.001

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_4 then
				local var_506_5 = (arg_503_1.time_ - var_506_1) / var_506_4
				local var_506_6 = Vector3.New(1500, -340, -414)

				var_506_0.localPosition = Vector3.Lerp(arg_503_1.var_.moveOldPos10094, var_506_6, var_506_5)
			end

			if arg_503_1.time_ >= var_506_1 + var_506_4 and arg_503_1.time_ < var_506_1 + var_506_4 + arg_506_0 then
				var_506_0.localPosition = Vector3.New(1500, -340, -414)
			end

			local var_506_7 = arg_503_1.actors_["10092_1"].transform
			local var_506_8 = 0

			if var_506_8 < arg_503_1.time_ and arg_503_1.time_ <= var_506_8 + arg_506_0 then
				arg_503_1.var_.moveOldPos10092_1 = var_506_7.localPosition
				var_506_7.localScale = Vector3.New(1, 1, 1)

				arg_503_1:CheckSpriteTmpPos("10092_1", 2)

				local var_506_9 = var_506_7.childCount

				for iter_506_1 = 0, var_506_9 - 1 do
					local var_506_10 = var_506_7:GetChild(iter_506_1)

					if var_506_10.name == "split_1_1" or not string.find(var_506_10.name, "split") then
						var_506_10.gameObject:SetActive(true)
					else
						var_506_10.gameObject:SetActive(false)
					end
				end
			end

			local var_506_11 = 0.001

			if var_506_8 <= arg_503_1.time_ and arg_503_1.time_ < var_506_8 + var_506_11 then
				local var_506_12 = (arg_503_1.time_ - var_506_8) / var_506_11
				local var_506_13 = Vector3.New(-389.49, -300, -295)

				var_506_7.localPosition = Vector3.Lerp(arg_503_1.var_.moveOldPos10092_1, var_506_13, var_506_12)
			end

			if arg_503_1.time_ >= var_506_8 + var_506_11 and arg_503_1.time_ < var_506_8 + var_506_11 + arg_506_0 then
				var_506_7.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_506_14 = arg_503_1.actors_["10094"]
			local var_506_15 = 0

			if var_506_15 < arg_503_1.time_ and arg_503_1.time_ <= var_506_15 + arg_506_0 and arg_503_1.var_.actorSpriteComps10094 == nil then
				arg_503_1.var_.actorSpriteComps10094 = var_506_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_506_16 = 2

			if var_506_15 <= arg_503_1.time_ and arg_503_1.time_ < var_506_15 + var_506_16 then
				local var_506_17 = (arg_503_1.time_ - var_506_15) / var_506_16

				if arg_503_1.var_.actorSpriteComps10094 then
					for iter_506_2, iter_506_3 in pairs(arg_503_1.var_.actorSpriteComps10094:ToTable()) do
						if iter_506_3 then
							if arg_503_1.isInRecall_ then
								local var_506_18 = Mathf.Lerp(iter_506_3.color.r, 0.46, var_506_17)
								local var_506_19 = Mathf.Lerp(iter_506_3.color.g, 0.43, var_506_17)
								local var_506_20 = Mathf.Lerp(iter_506_3.color.b, 0.35, var_506_17)

								iter_506_3.color = Color.New(var_506_18, var_506_19, var_506_20)
							else
								local var_506_21 = Mathf.Lerp(iter_506_3.color.r, 0.5, var_506_17)

								iter_506_3.color = Color.New(var_506_21, var_506_21, var_506_21)
							end
						end
					end
				end
			end

			if arg_503_1.time_ >= var_506_15 + var_506_16 and arg_503_1.time_ < var_506_15 + var_506_16 + arg_506_0 and arg_503_1.var_.actorSpriteComps10094 then
				for iter_506_4, iter_506_5 in pairs(arg_503_1.var_.actorSpriteComps10094:ToTable()) do
					if iter_506_5 then
						if arg_503_1.isInRecall_ then
							iter_506_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_506_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_503_1.var_.actorSpriteComps10094 = nil
			end

			local var_506_22 = arg_503_1.actors_["10092_1"]
			local var_506_23 = 0

			if var_506_23 < arg_503_1.time_ and arg_503_1.time_ <= var_506_23 + arg_506_0 and arg_503_1.var_.actorSpriteComps10092_1 == nil then
				arg_503_1.var_.actorSpriteComps10092_1 = var_506_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_506_24 = 2

			if var_506_23 <= arg_503_1.time_ and arg_503_1.time_ < var_506_23 + var_506_24 then
				local var_506_25 = (arg_503_1.time_ - var_506_23) / var_506_24

				if arg_503_1.var_.actorSpriteComps10092_1 then
					for iter_506_6, iter_506_7 in pairs(arg_503_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_506_7 then
							if arg_503_1.isInRecall_ then
								local var_506_26 = Mathf.Lerp(iter_506_7.color.r, 0.82, var_506_25)
								local var_506_27 = Mathf.Lerp(iter_506_7.color.g, 0.77, var_506_25)
								local var_506_28 = Mathf.Lerp(iter_506_7.color.b, 0.62, var_506_25)

								iter_506_7.color = Color.New(var_506_26, var_506_27, var_506_28)
							else
								local var_506_29 = Mathf.Lerp(iter_506_7.color.r, 1, var_506_25)

								iter_506_7.color = Color.New(var_506_29, var_506_29, var_506_29)
							end
						end
					end
				end
			end

			if arg_503_1.time_ >= var_506_23 + var_506_24 and arg_503_1.time_ < var_506_23 + var_506_24 + arg_506_0 and arg_503_1.var_.actorSpriteComps10092_1 then
				for iter_506_8, iter_506_9 in pairs(arg_503_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_506_9 then
						if arg_503_1.isInRecall_ then
							iter_506_9.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_506_9.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_503_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_506_30 = 0
			local var_506_31 = 0.3

			if var_506_30 < arg_503_1.time_ and arg_503_1.time_ <= var_506_30 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_32 = arg_503_1:FormatText(StoryNameCfg[996].name)

				arg_503_1.leftNameTxt_.text = var_506_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_33 = arg_503_1:GetWordFromCfg(413122124)
				local var_506_34 = arg_503_1:FormatText(var_506_33.content)

				arg_503_1.text_.text = var_506_34

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_35 = 12
				local var_506_36 = utf8.len(var_506_34)
				local var_506_37 = var_506_35 <= 0 and var_506_31 or var_506_31 * (var_506_36 / var_506_35)

				if var_506_37 > 0 and var_506_31 < var_506_37 then
					arg_503_1.talkMaxDuration = var_506_37

					if var_506_37 + var_506_30 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_37 + var_506_30
					end
				end

				arg_503_1.text_.text = var_506_34
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122124", "story_v_out_413122.awb") ~= 0 then
					local var_506_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122124", "story_v_out_413122.awb") / 1000

					if var_506_38 + var_506_30 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_38 + var_506_30
					end

					if var_506_33.prefab_name ~= "" and arg_503_1.actors_[var_506_33.prefab_name] ~= nil then
						local var_506_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_33.prefab_name].transform, "story_v_out_413122", "413122124", "story_v_out_413122.awb")

						arg_503_1:RecordAudio("413122124", var_506_39)
						arg_503_1:RecordAudio("413122124", var_506_39)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_out_413122", "413122124", "story_v_out_413122.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_out_413122", "413122124", "story_v_out_413122.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_40 = math.max(var_506_31, arg_503_1.talkMaxDuration)

			if var_506_30 <= arg_503_1.time_ and arg_503_1.time_ < var_506_30 + var_506_40 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_30) / var_506_40

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_30 + var_506_40 and arg_503_1.time_ < var_506_30 + var_506_40 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play413122125 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 413122125
		arg_507_1.duration_ = 10.8

		local var_507_0 = {
			zh = 9.266,
			ja = 10.8
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
				arg_507_0:Play413122126(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["10022"].transform
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 then
				arg_507_1.var_.moveOldPos10022 = var_510_0.localPosition
				var_510_0.localScale = Vector3.New(1, 1, 1)

				arg_507_1:CheckSpriteTmpPos("10022", 4)

				local var_510_2 = var_510_0.childCount

				for iter_510_0 = 0, var_510_2 - 1 do
					local var_510_3 = var_510_0:GetChild(iter_510_0)

					if var_510_3.name == "" or not string.find(var_510_3.name, "split") then
						var_510_3.gameObject:SetActive(true)
					else
						var_510_3.gameObject:SetActive(false)
					end
				end
			end

			local var_510_4 = 0.001

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_4 then
				local var_510_5 = (arg_507_1.time_ - var_510_1) / var_510_4
				local var_510_6 = Vector3.New(390, -315, -320)

				var_510_0.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos10022, var_510_6, var_510_5)
			end

			if arg_507_1.time_ >= var_510_1 + var_510_4 and arg_507_1.time_ < var_510_1 + var_510_4 + arg_510_0 then
				var_510_0.localPosition = Vector3.New(390, -315, -320)
			end

			local var_510_7 = arg_507_1.actors_["10092_1"]
			local var_510_8 = 0

			if var_510_8 < arg_507_1.time_ and arg_507_1.time_ <= var_510_8 + arg_510_0 and arg_507_1.var_.actorSpriteComps10092_1 == nil then
				arg_507_1.var_.actorSpriteComps10092_1 = var_510_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_510_9 = 2

			if var_510_8 <= arg_507_1.time_ and arg_507_1.time_ < var_510_8 + var_510_9 then
				local var_510_10 = (arg_507_1.time_ - var_510_8) / var_510_9

				if arg_507_1.var_.actorSpriteComps10092_1 then
					for iter_510_1, iter_510_2 in pairs(arg_507_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_510_2 then
							if arg_507_1.isInRecall_ then
								local var_510_11 = Mathf.Lerp(iter_510_2.color.r, 0.46, var_510_10)
								local var_510_12 = Mathf.Lerp(iter_510_2.color.g, 0.43, var_510_10)
								local var_510_13 = Mathf.Lerp(iter_510_2.color.b, 0.35, var_510_10)

								iter_510_2.color = Color.New(var_510_11, var_510_12, var_510_13)
							else
								local var_510_14 = Mathf.Lerp(iter_510_2.color.r, 0.5, var_510_10)

								iter_510_2.color = Color.New(var_510_14, var_510_14, var_510_14)
							end
						end
					end
				end
			end

			if arg_507_1.time_ >= var_510_8 + var_510_9 and arg_507_1.time_ < var_510_8 + var_510_9 + arg_510_0 and arg_507_1.var_.actorSpriteComps10092_1 then
				for iter_510_3, iter_510_4 in pairs(arg_507_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_510_4 then
						if arg_507_1.isInRecall_ then
							iter_510_4.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_510_4.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_507_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_510_15 = arg_507_1.actors_["10022"]
			local var_510_16 = 0

			if var_510_16 < arg_507_1.time_ and arg_507_1.time_ <= var_510_16 + arg_510_0 and arg_507_1.var_.actorSpriteComps10022 == nil then
				arg_507_1.var_.actorSpriteComps10022 = var_510_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_510_17 = 2

			if var_510_16 <= arg_507_1.time_ and arg_507_1.time_ < var_510_16 + var_510_17 then
				local var_510_18 = (arg_507_1.time_ - var_510_16) / var_510_17

				if arg_507_1.var_.actorSpriteComps10022 then
					for iter_510_5, iter_510_6 in pairs(arg_507_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_510_6 then
							if arg_507_1.isInRecall_ then
								local var_510_19 = Mathf.Lerp(iter_510_6.color.r, 0.82, var_510_18)
								local var_510_20 = Mathf.Lerp(iter_510_6.color.g, 0.77, var_510_18)
								local var_510_21 = Mathf.Lerp(iter_510_6.color.b, 0.62, var_510_18)

								iter_510_6.color = Color.New(var_510_19, var_510_20, var_510_21)
							else
								local var_510_22 = Mathf.Lerp(iter_510_6.color.r, 1, var_510_18)

								iter_510_6.color = Color.New(var_510_22, var_510_22, var_510_22)
							end
						end
					end
				end
			end

			if arg_507_1.time_ >= var_510_16 + var_510_17 and arg_507_1.time_ < var_510_16 + var_510_17 + arg_510_0 and arg_507_1.var_.actorSpriteComps10022 then
				for iter_510_7, iter_510_8 in pairs(arg_507_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_510_8 then
						if arg_507_1.isInRecall_ then
							iter_510_8.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_510_8.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_507_1.var_.actorSpriteComps10022 = nil
			end

			local var_510_23 = 0
			local var_510_24 = 1.15

			if var_510_23 < arg_507_1.time_ and arg_507_1.time_ <= var_510_23 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_25 = arg_507_1:FormatText(StoryNameCfg[614].name)

				arg_507_1.leftNameTxt_.text = var_510_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_26 = arg_507_1:GetWordFromCfg(413122125)
				local var_510_27 = arg_507_1:FormatText(var_510_26.content)

				arg_507_1.text_.text = var_510_27

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_28 = 44
				local var_510_29 = utf8.len(var_510_27)
				local var_510_30 = var_510_28 <= 0 and var_510_24 or var_510_24 * (var_510_29 / var_510_28)

				if var_510_30 > 0 and var_510_24 < var_510_30 then
					arg_507_1.talkMaxDuration = var_510_30

					if var_510_30 + var_510_23 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_30 + var_510_23
					end
				end

				arg_507_1.text_.text = var_510_27
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122125", "story_v_out_413122.awb") ~= 0 then
					local var_510_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122125", "story_v_out_413122.awb") / 1000

					if var_510_31 + var_510_23 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_31 + var_510_23
					end

					if var_510_26.prefab_name ~= "" and arg_507_1.actors_[var_510_26.prefab_name] ~= nil then
						local var_510_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_26.prefab_name].transform, "story_v_out_413122", "413122125", "story_v_out_413122.awb")

						arg_507_1:RecordAudio("413122125", var_510_32)
						arg_507_1:RecordAudio("413122125", var_510_32)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_413122", "413122125", "story_v_out_413122.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_413122", "413122125", "story_v_out_413122.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_33 = math.max(var_510_24, arg_507_1.talkMaxDuration)

			if var_510_23 <= arg_507_1.time_ and arg_507_1.time_ < var_510_23 + var_510_33 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_23) / var_510_33

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_23 + var_510_33 and arg_507_1.time_ < var_510_23 + var_510_33 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play413122126 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 413122126
		arg_511_1.duration_ = 3.37

		local var_511_0 = {
			zh = 2.333,
			ja = 3.366
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
				arg_511_0:Play413122127(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["10092_1"].transform
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				arg_511_1.var_.moveOldPos10092_1 = var_514_0.localPosition
				var_514_0.localScale = Vector3.New(1, 1, 1)

				arg_511_1:CheckSpriteTmpPos("10092_1", 2)

				local var_514_2 = var_514_0.childCount

				for iter_514_0 = 0, var_514_2 - 1 do
					local var_514_3 = var_514_0:GetChild(iter_514_0)

					if var_514_3.name == "split_1_1" or not string.find(var_514_3.name, "split") then
						var_514_3.gameObject:SetActive(true)
					else
						var_514_3.gameObject:SetActive(false)
					end
				end
			end

			local var_514_4 = 0.001

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_4 then
				local var_514_5 = (arg_511_1.time_ - var_514_1) / var_514_4
				local var_514_6 = Vector3.New(-389.49, -300, -295)

				var_514_0.localPosition = Vector3.Lerp(arg_511_1.var_.moveOldPos10092_1, var_514_6, var_514_5)
			end

			if arg_511_1.time_ >= var_514_1 + var_514_4 and arg_511_1.time_ < var_514_1 + var_514_4 + arg_514_0 then
				var_514_0.localPosition = Vector3.New(-389.49, -300, -295)
			end

			local var_514_7 = arg_511_1.actors_["10092_1"]
			local var_514_8 = 0

			if var_514_8 < arg_511_1.time_ and arg_511_1.time_ <= var_514_8 + arg_514_0 and arg_511_1.var_.actorSpriteComps10092_1 == nil then
				arg_511_1.var_.actorSpriteComps10092_1 = var_514_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_514_9 = 2

			if var_514_8 <= arg_511_1.time_ and arg_511_1.time_ < var_514_8 + var_514_9 then
				local var_514_10 = (arg_511_1.time_ - var_514_8) / var_514_9

				if arg_511_1.var_.actorSpriteComps10092_1 then
					for iter_514_1, iter_514_2 in pairs(arg_511_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_514_2 then
							if arg_511_1.isInRecall_ then
								local var_514_11 = Mathf.Lerp(iter_514_2.color.r, 0.82, var_514_10)
								local var_514_12 = Mathf.Lerp(iter_514_2.color.g, 0.77, var_514_10)
								local var_514_13 = Mathf.Lerp(iter_514_2.color.b, 0.62, var_514_10)

								iter_514_2.color = Color.New(var_514_11, var_514_12, var_514_13)
							else
								local var_514_14 = Mathf.Lerp(iter_514_2.color.r, 1, var_514_10)

								iter_514_2.color = Color.New(var_514_14, var_514_14, var_514_14)
							end
						end
					end
				end
			end

			if arg_511_1.time_ >= var_514_8 + var_514_9 and arg_511_1.time_ < var_514_8 + var_514_9 + arg_514_0 and arg_511_1.var_.actorSpriteComps10092_1 then
				for iter_514_3, iter_514_4 in pairs(arg_511_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_514_4 then
						if arg_511_1.isInRecall_ then
							iter_514_4.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_514_4.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_511_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_514_15 = arg_511_1.actors_["10022"]
			local var_514_16 = 0

			if var_514_16 < arg_511_1.time_ and arg_511_1.time_ <= var_514_16 + arg_514_0 and arg_511_1.var_.actorSpriteComps10022 == nil then
				arg_511_1.var_.actorSpriteComps10022 = var_514_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_514_17 = 2

			if var_514_16 <= arg_511_1.time_ and arg_511_1.time_ < var_514_16 + var_514_17 then
				local var_514_18 = (arg_511_1.time_ - var_514_16) / var_514_17

				if arg_511_1.var_.actorSpriteComps10022 then
					for iter_514_5, iter_514_6 in pairs(arg_511_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_514_6 then
							if arg_511_1.isInRecall_ then
								local var_514_19 = Mathf.Lerp(iter_514_6.color.r, 0.46, var_514_18)
								local var_514_20 = Mathf.Lerp(iter_514_6.color.g, 0.43, var_514_18)
								local var_514_21 = Mathf.Lerp(iter_514_6.color.b, 0.35, var_514_18)

								iter_514_6.color = Color.New(var_514_19, var_514_20, var_514_21)
							else
								local var_514_22 = Mathf.Lerp(iter_514_6.color.r, 0.5, var_514_18)

								iter_514_6.color = Color.New(var_514_22, var_514_22, var_514_22)
							end
						end
					end
				end
			end

			if arg_511_1.time_ >= var_514_16 + var_514_17 and arg_511_1.time_ < var_514_16 + var_514_17 + arg_514_0 and arg_511_1.var_.actorSpriteComps10022 then
				for iter_514_7, iter_514_8 in pairs(arg_511_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_514_8 then
						if arg_511_1.isInRecall_ then
							iter_514_8.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_514_8.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_511_1.var_.actorSpriteComps10022 = nil
			end

			local var_514_23 = 0
			local var_514_24 = 0.25

			if var_514_23 < arg_511_1.time_ and arg_511_1.time_ <= var_514_23 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_25 = arg_511_1:FormatText(StoryNameCfg[996].name)

				arg_511_1.leftNameTxt_.text = var_514_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_26 = arg_511_1:GetWordFromCfg(413122126)
				local var_514_27 = arg_511_1:FormatText(var_514_26.content)

				arg_511_1.text_.text = var_514_27

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_28 = 10
				local var_514_29 = utf8.len(var_514_27)
				local var_514_30 = var_514_28 <= 0 and var_514_24 or var_514_24 * (var_514_29 / var_514_28)

				if var_514_30 > 0 and var_514_24 < var_514_30 then
					arg_511_1.talkMaxDuration = var_514_30

					if var_514_30 + var_514_23 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_30 + var_514_23
					end
				end

				arg_511_1.text_.text = var_514_27
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122126", "story_v_out_413122.awb") ~= 0 then
					local var_514_31 = manager.audio:GetVoiceLength("story_v_out_413122", "413122126", "story_v_out_413122.awb") / 1000

					if var_514_31 + var_514_23 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_31 + var_514_23
					end

					if var_514_26.prefab_name ~= "" and arg_511_1.actors_[var_514_26.prefab_name] ~= nil then
						local var_514_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_26.prefab_name].transform, "story_v_out_413122", "413122126", "story_v_out_413122.awb")

						arg_511_1:RecordAudio("413122126", var_514_32)
						arg_511_1:RecordAudio("413122126", var_514_32)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_413122", "413122126", "story_v_out_413122.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_413122", "413122126", "story_v_out_413122.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_33 = math.max(var_514_24, arg_511_1.talkMaxDuration)

			if var_514_23 <= arg_511_1.time_ and arg_511_1.time_ < var_514_23 + var_514_33 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_23) / var_514_33

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_23 + var_514_33 and arg_511_1.time_ < var_514_23 + var_514_33 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play413122127 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 413122127
		arg_515_1.duration_ = 2.53

		local var_515_0 = {
			zh = 2.266,
			ja = 2.533
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
				arg_515_0:Play413122128(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["10022"].transform
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 then
				arg_515_1.var_.moveOldPos10022 = var_518_0.localPosition
				var_518_0.localScale = Vector3.New(1, 1, 1)

				arg_515_1:CheckSpriteTmpPos("10022", 6)

				local var_518_2 = var_518_0.childCount

				for iter_518_0 = 0, var_518_2 - 1 do
					local var_518_3 = var_518_0:GetChild(iter_518_0)

					if var_518_3.name == "" or not string.find(var_518_3.name, "split") then
						var_518_3.gameObject:SetActive(true)
					else
						var_518_3.gameObject:SetActive(false)
					end
				end
			end

			local var_518_4 = 0.001

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_4 then
				local var_518_5 = (arg_515_1.time_ - var_518_1) / var_518_4
				local var_518_6 = Vector3.New(1500, -315, -320)

				var_518_0.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos10022, var_518_6, var_518_5)
			end

			if arg_515_1.time_ >= var_518_1 + var_518_4 and arg_515_1.time_ < var_518_1 + var_518_4 + arg_518_0 then
				var_518_0.localPosition = Vector3.New(1500, -315, -320)
			end

			local var_518_7 = arg_515_1.actors_["10093"].transform
			local var_518_8 = 0

			if var_518_8 < arg_515_1.time_ and arg_515_1.time_ <= var_518_8 + arg_518_0 then
				arg_515_1.var_.moveOldPos10093 = var_518_7.localPosition
				var_518_7.localScale = Vector3.New(1, 1, 1)

				arg_515_1:CheckSpriteTmpPos("10093", 4)

				local var_518_9 = var_518_7.childCount

				for iter_518_1 = 0, var_518_9 - 1 do
					local var_518_10 = var_518_7:GetChild(iter_518_1)

					if var_518_10.name == "split_4" or not string.find(var_518_10.name, "split") then
						var_518_10.gameObject:SetActive(true)
					else
						var_518_10.gameObject:SetActive(false)
					end
				end
			end

			local var_518_11 = 0.001

			if var_518_8 <= arg_515_1.time_ and arg_515_1.time_ < var_518_8 + var_518_11 then
				local var_518_12 = (arg_515_1.time_ - var_518_8) / var_518_11
				local var_518_13 = Vector3.New(390, -345, -245)

				var_518_7.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos10093, var_518_13, var_518_12)
			end

			if arg_515_1.time_ >= var_518_8 + var_518_11 and arg_515_1.time_ < var_518_8 + var_518_11 + arg_518_0 then
				var_518_7.localPosition = Vector3.New(390, -345, -245)
			end

			local var_518_14 = arg_515_1.actors_["10092_1"]
			local var_518_15 = 0

			if var_518_15 < arg_515_1.time_ and arg_515_1.time_ <= var_518_15 + arg_518_0 and arg_515_1.var_.actorSpriteComps10092_1 == nil then
				arg_515_1.var_.actorSpriteComps10092_1 = var_518_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_518_16 = 2

			if var_518_15 <= arg_515_1.time_ and arg_515_1.time_ < var_518_15 + var_518_16 then
				local var_518_17 = (arg_515_1.time_ - var_518_15) / var_518_16

				if arg_515_1.var_.actorSpriteComps10092_1 then
					for iter_518_2, iter_518_3 in pairs(arg_515_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_518_3 then
							if arg_515_1.isInRecall_ then
								local var_518_18 = Mathf.Lerp(iter_518_3.color.r, 0.46, var_518_17)
								local var_518_19 = Mathf.Lerp(iter_518_3.color.g, 0.43, var_518_17)
								local var_518_20 = Mathf.Lerp(iter_518_3.color.b, 0.35, var_518_17)

								iter_518_3.color = Color.New(var_518_18, var_518_19, var_518_20)
							else
								local var_518_21 = Mathf.Lerp(iter_518_3.color.r, 0.5, var_518_17)

								iter_518_3.color = Color.New(var_518_21, var_518_21, var_518_21)
							end
						end
					end
				end
			end

			if arg_515_1.time_ >= var_518_15 + var_518_16 and arg_515_1.time_ < var_518_15 + var_518_16 + arg_518_0 and arg_515_1.var_.actorSpriteComps10092_1 then
				for iter_518_4, iter_518_5 in pairs(arg_515_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_518_5 then
						if arg_515_1.isInRecall_ then
							iter_518_5.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_518_5.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_515_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_518_22 = arg_515_1.actors_["10093"]
			local var_518_23 = 0

			if var_518_23 < arg_515_1.time_ and arg_515_1.time_ <= var_518_23 + arg_518_0 and arg_515_1.var_.actorSpriteComps10093 == nil then
				arg_515_1.var_.actorSpriteComps10093 = var_518_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_518_24 = 2

			if var_518_23 <= arg_515_1.time_ and arg_515_1.time_ < var_518_23 + var_518_24 then
				local var_518_25 = (arg_515_1.time_ - var_518_23) / var_518_24

				if arg_515_1.var_.actorSpriteComps10093 then
					for iter_518_6, iter_518_7 in pairs(arg_515_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_518_7 then
							if arg_515_1.isInRecall_ then
								local var_518_26 = Mathf.Lerp(iter_518_7.color.r, 0.82, var_518_25)
								local var_518_27 = Mathf.Lerp(iter_518_7.color.g, 0.77, var_518_25)
								local var_518_28 = Mathf.Lerp(iter_518_7.color.b, 0.62, var_518_25)

								iter_518_7.color = Color.New(var_518_26, var_518_27, var_518_28)
							else
								local var_518_29 = Mathf.Lerp(iter_518_7.color.r, 1, var_518_25)

								iter_518_7.color = Color.New(var_518_29, var_518_29, var_518_29)
							end
						end
					end
				end
			end

			if arg_515_1.time_ >= var_518_23 + var_518_24 and arg_515_1.time_ < var_518_23 + var_518_24 + arg_518_0 and arg_515_1.var_.actorSpriteComps10093 then
				for iter_518_8, iter_518_9 in pairs(arg_515_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_518_9 then
						if arg_515_1.isInRecall_ then
							iter_518_9.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_518_9.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_515_1.var_.actorSpriteComps10093 = nil
			end

			local var_518_30 = 0
			local var_518_31 = 0.3

			if var_518_30 < arg_515_1.time_ and arg_515_1.time_ <= var_518_30 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_32 = arg_515_1:FormatText(StoryNameCfg[28].name)

				arg_515_1.leftNameTxt_.text = var_518_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_33 = arg_515_1:GetWordFromCfg(413122127)
				local var_518_34 = arg_515_1:FormatText(var_518_33.content)

				arg_515_1.text_.text = var_518_34

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_35 = 12
				local var_518_36 = utf8.len(var_518_34)
				local var_518_37 = var_518_35 <= 0 and var_518_31 or var_518_31 * (var_518_36 / var_518_35)

				if var_518_37 > 0 and var_518_31 < var_518_37 then
					arg_515_1.talkMaxDuration = var_518_37

					if var_518_37 + var_518_30 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_37 + var_518_30
					end
				end

				arg_515_1.text_.text = var_518_34
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122127", "story_v_out_413122.awb") ~= 0 then
					local var_518_38 = manager.audio:GetVoiceLength("story_v_out_413122", "413122127", "story_v_out_413122.awb") / 1000

					if var_518_38 + var_518_30 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_38 + var_518_30
					end

					if var_518_33.prefab_name ~= "" and arg_515_1.actors_[var_518_33.prefab_name] ~= nil then
						local var_518_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_33.prefab_name].transform, "story_v_out_413122", "413122127", "story_v_out_413122.awb")

						arg_515_1:RecordAudio("413122127", var_518_39)
						arg_515_1:RecordAudio("413122127", var_518_39)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_413122", "413122127", "story_v_out_413122.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_413122", "413122127", "story_v_out_413122.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_40 = math.max(var_518_31, arg_515_1.talkMaxDuration)

			if var_518_30 <= arg_515_1.time_ and arg_515_1.time_ < var_518_30 + var_518_40 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_30) / var_518_40

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_30 + var_518_40 and arg_515_1.time_ < var_518_30 + var_518_40 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play413122128 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 413122128
		arg_519_1.duration_ = 9.17

		local var_519_0 = {
			zh = 7.533,
			ja = 9.166
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
				arg_519_0:Play413122129(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["10022"].transform
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 then
				arg_519_1.var_.moveOldPos10022 = var_522_0.localPosition
				var_522_0.localScale = Vector3.New(1, 1, 1)

				arg_519_1:CheckSpriteTmpPos("10022", 3)

				local var_522_2 = var_522_0.childCount

				for iter_522_0 = 0, var_522_2 - 1 do
					local var_522_3 = var_522_0:GetChild(iter_522_0)

					if var_522_3.name == "split_8" or not string.find(var_522_3.name, "split") then
						var_522_3.gameObject:SetActive(true)
					else
						var_522_3.gameObject:SetActive(false)
					end
				end
			end

			local var_522_4 = 0.001

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_4 then
				local var_522_5 = (arg_519_1.time_ - var_522_1) / var_522_4
				local var_522_6 = Vector3.New(0, -315, -320)

				var_522_0.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos10022, var_522_6, var_522_5)
			end

			if arg_519_1.time_ >= var_522_1 + var_522_4 and arg_519_1.time_ < var_522_1 + var_522_4 + arg_522_0 then
				var_522_0.localPosition = Vector3.New(0, -315, -320)
			end

			local var_522_7 = arg_519_1.actors_["10093"].transform
			local var_522_8 = 0

			if var_522_8 < arg_519_1.time_ and arg_519_1.time_ <= var_522_8 + arg_522_0 then
				arg_519_1.var_.moveOldPos10093 = var_522_7.localPosition
				var_522_7.localScale = Vector3.New(1, 1, 1)

				arg_519_1:CheckSpriteTmpPos("10093", 6)

				local var_522_9 = var_522_7.childCount

				for iter_522_1 = 0, var_522_9 - 1 do
					local var_522_10 = var_522_7:GetChild(iter_522_1)

					if var_522_10.name == "" or not string.find(var_522_10.name, "split") then
						var_522_10.gameObject:SetActive(true)
					else
						var_522_10.gameObject:SetActive(false)
					end
				end
			end

			local var_522_11 = 0.001

			if var_522_8 <= arg_519_1.time_ and arg_519_1.time_ < var_522_8 + var_522_11 then
				local var_522_12 = (arg_519_1.time_ - var_522_8) / var_522_11
				local var_522_13 = Vector3.New(1500, -345, -245)

				var_522_7.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos10093, var_522_13, var_522_12)
			end

			if arg_519_1.time_ >= var_522_8 + var_522_11 and arg_519_1.time_ < var_522_8 + var_522_11 + arg_522_0 then
				var_522_7.localPosition = Vector3.New(1500, -345, -245)
			end

			local var_522_14 = arg_519_1.actors_["10092_1"].transform
			local var_522_15 = 0

			if var_522_15 < arg_519_1.time_ and arg_519_1.time_ <= var_522_15 + arg_522_0 then
				arg_519_1.var_.moveOldPos10092_1 = var_522_14.localPosition
				var_522_14.localScale = Vector3.New(1, 1, 1)

				arg_519_1:CheckSpriteTmpPos("10092_1", 6)

				local var_522_16 = var_522_14.childCount

				for iter_522_2 = 0, var_522_16 - 1 do
					local var_522_17 = var_522_14:GetChild(iter_522_2)

					if var_522_17.name == "" or not string.find(var_522_17.name, "split") then
						var_522_17.gameObject:SetActive(true)
					else
						var_522_17.gameObject:SetActive(false)
					end
				end
			end

			local var_522_18 = 0.001

			if var_522_15 <= arg_519_1.time_ and arg_519_1.time_ < var_522_15 + var_522_18 then
				local var_522_19 = (arg_519_1.time_ - var_522_15) / var_522_18
				local var_522_20 = Vector3.New(1500, -300, -295)

				var_522_14.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos10092_1, var_522_20, var_522_19)
			end

			if arg_519_1.time_ >= var_522_15 + var_522_18 and arg_519_1.time_ < var_522_15 + var_522_18 + arg_522_0 then
				var_522_14.localPosition = Vector3.New(1500, -300, -295)
			end

			local var_522_21 = arg_519_1.actors_["10022"]
			local var_522_22 = 0

			if var_522_22 < arg_519_1.time_ and arg_519_1.time_ <= var_522_22 + arg_522_0 and arg_519_1.var_.actorSpriteComps10022 == nil then
				arg_519_1.var_.actorSpriteComps10022 = var_522_21:GetComponentsInChildren(typeof(Image), true)
			end

			local var_522_23 = 2

			if var_522_22 <= arg_519_1.time_ and arg_519_1.time_ < var_522_22 + var_522_23 then
				local var_522_24 = (arg_519_1.time_ - var_522_22) / var_522_23

				if arg_519_1.var_.actorSpriteComps10022 then
					for iter_522_3, iter_522_4 in pairs(arg_519_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_522_4 then
							if arg_519_1.isInRecall_ then
								local var_522_25 = Mathf.Lerp(iter_522_4.color.r, 0.82, var_522_24)
								local var_522_26 = Mathf.Lerp(iter_522_4.color.g, 0.77, var_522_24)
								local var_522_27 = Mathf.Lerp(iter_522_4.color.b, 0.62, var_522_24)

								iter_522_4.color = Color.New(var_522_25, var_522_26, var_522_27)
							else
								local var_522_28 = Mathf.Lerp(iter_522_4.color.r, 1, var_522_24)

								iter_522_4.color = Color.New(var_522_28, var_522_28, var_522_28)
							end
						end
					end
				end
			end

			if arg_519_1.time_ >= var_522_22 + var_522_23 and arg_519_1.time_ < var_522_22 + var_522_23 + arg_522_0 and arg_519_1.var_.actorSpriteComps10022 then
				for iter_522_5, iter_522_6 in pairs(arg_519_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_522_6 then
						if arg_519_1.isInRecall_ then
							iter_522_6.color = Color.New(0.82, 0.77, 0.62)
						else
							iter_522_6.color = Color.New(1, 1, 1)
						end
					end
				end

				arg_519_1.var_.actorSpriteComps10022 = nil
			end

			local var_522_29 = arg_519_1.actors_["10093"]
			local var_522_30 = 0

			if var_522_30 < arg_519_1.time_ and arg_519_1.time_ <= var_522_30 + arg_522_0 and arg_519_1.var_.actorSpriteComps10093 == nil then
				arg_519_1.var_.actorSpriteComps10093 = var_522_29:GetComponentsInChildren(typeof(Image), true)
			end

			local var_522_31 = 2

			if var_522_30 <= arg_519_1.time_ and arg_519_1.time_ < var_522_30 + var_522_31 then
				local var_522_32 = (arg_519_1.time_ - var_522_30) / var_522_31

				if arg_519_1.var_.actorSpriteComps10093 then
					for iter_522_7, iter_522_8 in pairs(arg_519_1.var_.actorSpriteComps10093:ToTable()) do
						if iter_522_8 then
							if arg_519_1.isInRecall_ then
								local var_522_33 = Mathf.Lerp(iter_522_8.color.r, 0.46, var_522_32)
								local var_522_34 = Mathf.Lerp(iter_522_8.color.g, 0.43, var_522_32)
								local var_522_35 = Mathf.Lerp(iter_522_8.color.b, 0.35, var_522_32)

								iter_522_8.color = Color.New(var_522_33, var_522_34, var_522_35)
							else
								local var_522_36 = Mathf.Lerp(iter_522_8.color.r, 0.5, var_522_32)

								iter_522_8.color = Color.New(var_522_36, var_522_36, var_522_36)
							end
						end
					end
				end
			end

			if arg_519_1.time_ >= var_522_30 + var_522_31 and arg_519_1.time_ < var_522_30 + var_522_31 + arg_522_0 and arg_519_1.var_.actorSpriteComps10093 then
				for iter_522_9, iter_522_10 in pairs(arg_519_1.var_.actorSpriteComps10093:ToTable()) do
					if iter_522_10 then
						if arg_519_1.isInRecall_ then
							iter_522_10.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_522_10.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_519_1.var_.actorSpriteComps10093 = nil
			end

			local var_522_37 = arg_519_1.actors_["10092_1"]
			local var_522_38 = 0

			if var_522_38 < arg_519_1.time_ and arg_519_1.time_ <= var_522_38 + arg_522_0 and arg_519_1.var_.actorSpriteComps10092_1 == nil then
				arg_519_1.var_.actorSpriteComps10092_1 = var_522_37:GetComponentsInChildren(typeof(Image), true)
			end

			local var_522_39 = 2

			if var_522_38 <= arg_519_1.time_ and arg_519_1.time_ < var_522_38 + var_522_39 then
				local var_522_40 = (arg_519_1.time_ - var_522_38) / var_522_39

				if arg_519_1.var_.actorSpriteComps10092_1 then
					for iter_522_11, iter_522_12 in pairs(arg_519_1.var_.actorSpriteComps10092_1:ToTable()) do
						if iter_522_12 then
							if arg_519_1.isInRecall_ then
								local var_522_41 = Mathf.Lerp(iter_522_12.color.r, 0.46, var_522_40)
								local var_522_42 = Mathf.Lerp(iter_522_12.color.g, 0.43, var_522_40)
								local var_522_43 = Mathf.Lerp(iter_522_12.color.b, 0.35, var_522_40)

								iter_522_12.color = Color.New(var_522_41, var_522_42, var_522_43)
							else
								local var_522_44 = Mathf.Lerp(iter_522_12.color.r, 0.5, var_522_40)

								iter_522_12.color = Color.New(var_522_44, var_522_44, var_522_44)
							end
						end
					end
				end
			end

			if arg_519_1.time_ >= var_522_38 + var_522_39 and arg_519_1.time_ < var_522_38 + var_522_39 + arg_522_0 and arg_519_1.var_.actorSpriteComps10092_1 then
				for iter_522_13, iter_522_14 in pairs(arg_519_1.var_.actorSpriteComps10092_1:ToTable()) do
					if iter_522_14 then
						if arg_519_1.isInRecall_ then
							iter_522_14.color = Color.New(0.46, 0.43, 0.35)
						else
							iter_522_14.color = Color.New(0.5, 0.5, 0.5)
						end
					end
				end

				arg_519_1.var_.actorSpriteComps10092_1 = nil
			end

			local var_522_45 = 0
			local var_522_46 = 0.975

			if var_522_45 < arg_519_1.time_ and arg_519_1.time_ <= var_522_45 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_47 = arg_519_1:FormatText(StoryNameCfg[614].name)

				arg_519_1.leftNameTxt_.text = var_522_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_48 = arg_519_1:GetWordFromCfg(413122128)
				local var_522_49 = arg_519_1:FormatText(var_522_48.content)

				arg_519_1.text_.text = var_522_49

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_50 = 39
				local var_522_51 = utf8.len(var_522_49)
				local var_522_52 = var_522_50 <= 0 and var_522_46 or var_522_46 * (var_522_51 / var_522_50)

				if var_522_52 > 0 and var_522_46 < var_522_52 then
					arg_519_1.talkMaxDuration = var_522_52

					if var_522_52 + var_522_45 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_52 + var_522_45
					end
				end

				arg_519_1.text_.text = var_522_49
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122128", "story_v_out_413122.awb") ~= 0 then
					local var_522_53 = manager.audio:GetVoiceLength("story_v_out_413122", "413122128", "story_v_out_413122.awb") / 1000

					if var_522_53 + var_522_45 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_53 + var_522_45
					end

					if var_522_48.prefab_name ~= "" and arg_519_1.actors_[var_522_48.prefab_name] ~= nil then
						local var_522_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_48.prefab_name].transform, "story_v_out_413122", "413122128", "story_v_out_413122.awb")

						arg_519_1:RecordAudio("413122128", var_522_54)
						arg_519_1:RecordAudio("413122128", var_522_54)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_413122", "413122128", "story_v_out_413122.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_413122", "413122128", "story_v_out_413122.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_55 = math.max(var_522_46, arg_519_1.talkMaxDuration)

			if var_522_45 <= arg_519_1.time_ and arg_519_1.time_ < var_522_45 + var_522_55 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_45) / var_522_55

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_45 + var_522_55 and arg_519_1.time_ < var_522_45 + var_522_55 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play413122129 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 413122129
		arg_523_1.duration_ = 5.33

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play413122130(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["10022"].transform
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 then
				arg_523_1.var_.moveOldPos10022 = var_526_0.localPosition
				var_526_0.localScale = Vector3.New(1, 1, 1)

				arg_523_1:CheckSpriteTmpPos("10022", 7)

				local var_526_2 = var_526_0.childCount

				for iter_526_0 = 0, var_526_2 - 1 do
					local var_526_3 = var_526_0:GetChild(iter_526_0)

					if var_526_3.name == "split_3" or not string.find(var_526_3.name, "split") then
						var_526_3.gameObject:SetActive(true)
					else
						var_526_3.gameObject:SetActive(false)
					end
				end
			end

			local var_526_4 = 0.001

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_4 then
				local var_526_5 = (arg_523_1.time_ - var_526_1) / var_526_4
				local var_526_6 = Vector3.New(0, -2000, 0)

				var_526_0.localPosition = Vector3.Lerp(arg_523_1.var_.moveOldPos10022, var_526_6, var_526_5)
			end

			if arg_523_1.time_ >= var_526_1 + var_526_4 and arg_523_1.time_ < var_526_1 + var_526_4 + arg_526_0 then
				var_526_0.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_526_7 = 0

			if var_526_7 < arg_523_1.time_ and arg_523_1.time_ <= var_526_7 + arg_526_0 then
				arg_523_1.allBtn_.enabled = false
			end

			local var_526_8 = 0.333333333333333

			if arg_523_1.time_ >= var_526_7 + var_526_8 and arg_523_1.time_ < var_526_7 + var_526_8 + arg_526_0 then
				arg_523_1.allBtn_.enabled = true
			end

			if arg_523_1.frameCnt_ <= 1 then
				arg_523_1.dialog_:SetActive(false)
			end

			local var_526_9 = 0.333333333333333
			local var_526_10 = 0.825

			if var_526_9 < arg_523_1.time_ and arg_523_1.time_ <= var_526_9 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0

				arg_523_1.dialog_:SetActive(true)

				local var_526_11 = LeanTween.value(arg_523_1.dialog_, 0, 1, 0.3)

				var_526_11:setOnUpdate(LuaHelper.FloatAction(function(arg_527_0)
					arg_523_1.dialogCg_.alpha = arg_527_0
				end))
				var_526_11:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_523_1.dialog_)
					var_526_11:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_523_1.duration_ = arg_523_1.duration_ + 0.3

				SetActive(arg_523_1.leftNameGo_, false)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_12 = arg_523_1:GetWordFromCfg(413122129)
				local var_526_13 = arg_523_1:FormatText(var_526_12.content)

				arg_523_1.text_.text = var_526_13

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_14 = 33
				local var_526_15 = utf8.len(var_526_13)
				local var_526_16 = var_526_14 <= 0 and var_526_10 or var_526_10 * (var_526_15 / var_526_14)

				if var_526_16 > 0 and var_526_10 < var_526_16 then
					arg_523_1.talkMaxDuration = var_526_16
					var_526_9 = var_526_9 + 0.3

					if var_526_16 + var_526_9 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_16 + var_526_9
					end
				end

				arg_523_1.text_.text = var_526_13
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_17 = var_526_9 + 0.3
			local var_526_18 = math.max(var_526_10, arg_523_1.talkMaxDuration)

			if var_526_17 <= arg_523_1.time_ and arg_523_1.time_ < var_526_17 + var_526_18 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_17) / var_526_18

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_17 + var_526_18 and arg_523_1.time_ < var_526_17 + var_526_18 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play413122130 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 413122130
		arg_529_1.duration_ = 6.33

		local var_529_0 = {
			zh = 3.466,
			ja = 6.333
		}
		local var_529_1 = manager.audio:GetLocalizationFlag()

		if var_529_0[var_529_1] ~= nil then
			arg_529_1.duration_ = var_529_0[var_529_1]
		end

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
			arg_529_1.auto_ = false
		end

		function arg_529_1.playNext_(arg_531_0)
			arg_529_1.onStoryFinished_()
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = 0
			local var_532_1 = 0.475

			if var_532_0 < arg_529_1.time_ and arg_529_1.time_ <= var_532_0 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0
				arg_529_1.dialogCg_.alpha = 1

				arg_529_1.dialog_:SetActive(true)
				SetActive(arg_529_1.leftNameGo_, true)

				local var_532_2 = arg_529_1:FormatText(StoryNameCfg[992].name)

				arg_529_1.leftNameTxt_.text = var_532_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_529_1.leftNameTxt_.transform)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1.leftNameTxt_.text)
				SetActive(arg_529_1.iconTrs_.gameObject, true)
				arg_529_1.iconController_:SetSelectedState("hero")

				arg_529_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_knightman1")

				arg_529_1.callingController_:SetSelectedState("calling")

				arg_529_1.keyicon_.color = Color.New(1, 1, 1)
				arg_529_1.icon_.color = Color.New(1, 1, 1)

				local var_532_3 = arg_529_1:GetWordFromCfg(413122130)
				local var_532_4 = arg_529_1:FormatText(var_532_3.content)

				arg_529_1.text_.text = var_532_4

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_5 = 19
				local var_532_6 = utf8.len(var_532_4)
				local var_532_7 = var_532_5 <= 0 and var_532_1 or var_532_1 * (var_532_6 / var_532_5)

				if var_532_7 > 0 and var_532_1 < var_532_7 then
					arg_529_1.talkMaxDuration = var_532_7

					if var_532_7 + var_532_0 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_7 + var_532_0
					end
				end

				arg_529_1.text_.text = var_532_4
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_413122", "413122130", "story_v_out_413122.awb") ~= 0 then
					local var_532_8 = manager.audio:GetVoiceLength("story_v_out_413122", "413122130", "story_v_out_413122.awb") / 1000

					if var_532_8 + var_532_0 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_8 + var_532_0
					end

					if var_532_3.prefab_name ~= "" and arg_529_1.actors_[var_532_3.prefab_name] ~= nil then
						local var_532_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_529_1.actors_[var_532_3.prefab_name].transform, "story_v_out_413122", "413122130", "story_v_out_413122.awb")

						arg_529_1:RecordAudio("413122130", var_532_9)
						arg_529_1:RecordAudio("413122130", var_532_9)
					else
						arg_529_1:AudioAction("play", "voice", "story_v_out_413122", "413122130", "story_v_out_413122.awb")
					end

					arg_529_1:RecordHistoryTalkVoice("story_v_out_413122", "413122130", "story_v_out_413122.awb")
				end

				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_10 = math.max(var_532_1, arg_529_1.talkMaxDuration)

			if var_532_0 <= arg_529_1.time_ and arg_529_1.time_ < var_532_0 + var_532_10 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_0) / var_532_10

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_0 + var_532_10 and arg_529_1.time_ < var_532_0 + var_532_10 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST0603a"
	},
	voices = {
		"story_v_out_413122.awb"
	}
}
