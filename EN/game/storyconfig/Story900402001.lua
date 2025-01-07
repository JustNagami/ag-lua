﻿local var_0_0 = {
	Play900402003 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 900402003
		arg_1_1.duration_ = 1.03

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play900402004(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "Volume"

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
				local var_4_5 = arg_1_1.bgs_.Volume

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
					if iter_4_0 ~= "Volume" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			ComponentBinder.GetInstance():BindCfgUI(arg_1_0, arg_1_1.narrativeGo_)

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				SetActive(arg_1_1.hideBtn_, false)
				SetActive(arg_1_1.narrativeGo_, true)
				SetActive(arg_1_1.lastBtn_.gameObject, false)
				SetActive(arg_1_1.bgmBtn_.gameObject, false)

				local var_4_17 = arg_1_0.narr_chapter_text
				local var_4_18 = arg_1_0.narr_time_text
				local var_4_19 = arg_1_1:GetWordFromCfg(900402001)

				var_4_17.text = arg_1_1:FormatText(var_4_19.content)

				local var_4_20 = arg_1_1:GetWordFromCfg(900402002)

				var_4_18.text = arg_1_1:FormatText(var_4_20.content)
				arg_1_1.narrativeListGo_.movementType = ScrollRect.MovementType.Clamped

				local var_4_21 = arg_1_1.narrativeListGo_:GetComponent(typeof(Image))

				if var_4_21 then
					var_4_21.raycastTarget = false
				end

				SetActive(arg_1_1.narrativeContinueBtn_.gameObject, false)
			end

			local var_4_22 = 0.0334

			if var_4_16 <= arg_1_1.time_ and arg_1_1.time_ < var_4_16 + var_4_22 and arg_1_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_1_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_1_1.time_ >= var_4_16 + var_4_22 and arg_1_1.time_ < var_4_16 + var_4_22 + arg_4_0 then
				-- block empty
			end

			ComponentBinder.GetInstance():BindCfgUI(arg_1_0, arg_1_1.narrativeGo_)

			local var_4_23 = 0.0334

			if var_4_23 < arg_1_1.time_ and arg_1_1.time_ <= var_4_23 + arg_4_0 then
				local var_4_24 = Object.Instantiate(arg_1_1.narrativeItemGo_)
				local var_4_25 = var_4_24:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_1_0, var_4_24)

				arg_1_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033_split_6")

				local var_4_26 = arg_1_1:GetWordFromCfg(900402003)
				local var_4_27 = arg_1_1:FormatText(var_4_26.content)

				arg_1_0.narr_item_content.text = var_4_27

				var_4_24.transform:SetParent(arg_1_1.narrativeItemGo_.transform.parent)

				var_4_24.transform.localPosition = Vector3(0, 0, 0)
				var_4_24.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_4_24, true)
			end

			local var_4_28 = 1

			if var_4_23 <= arg_1_1.time_ and arg_1_1.time_ < var_4_23 + var_4_28 and arg_1_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_1_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_1_1.time_ >= var_4_23 + var_4_28 and arg_1_1.time_ < var_4_23 + var_4_28 + arg_4_0 then
				-- block empty
			end

			local var_4_29 = 0
			local var_4_30 = 0.333333333333333

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				local var_4_31 = "play"
				local var_4_32 = "music"

				arg_1_1:AudioAction(var_4_31, var_4_32, "ui_battle", "ui_battle_stopbgm", "")

				local var_4_33 = ""
				local var_4_34 = manager.audio:GetAudioName("ui_battle", "ui_battle_stopbgm")

				if var_4_34 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_34 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_34

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_34
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

			local var_4_35 = 0.8
			local var_4_36 = 0.2334

			if var_4_35 < arg_1_1.time_ and arg_1_1.time_ <= var_4_35 + arg_4_0 then
				local var_4_37 = "play"
				local var_4_38 = "music"

				arg_1_1:AudioAction(var_4_37, var_4_38, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")

				local var_4_39 = ""
				local var_4_40 = manager.audio:GetAudioName("bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle")

				if var_4_40 ~= "" then
					if arg_1_1.bgmTxt_.text ~= var_4_40 and arg_1_1.bgmTxt_.text ~= "" then
						if arg_1_1.bgmTxt2_.text ~= "" then
							arg_1_1.bgmTxt_.text = arg_1_1.bgmTxt2_.text
						end

						arg_1_1.bgmTxt2_.text = var_4_40

						arg_1_1.musicChangeAnimator_:Play("music_change", 0, 0)
					else
						arg_1_1.bgmTxt_.text = var_4_40
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
		end
	end,
	Play900402004 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 900402004
		arg_7_1.duration_ = 1

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play900402005(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_7_0, arg_7_1.narrativeGo_)

			local var_10_0 = 0

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				local var_10_1 = Object.Instantiate(arg_7_1.narrativeItemGo_)
				local var_10_2 = var_10_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_7_0, var_10_1)

				arg_7_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3021")

				local var_10_3 = arg_7_1:GetWordFromCfg(900402004)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_0.narr_item_content.text = var_10_4

				var_10_1.transform:SetParent(arg_7_1.narrativeItemGo_.transform.parent)

				var_10_1.transform.localPosition = Vector3(0, 0, 0)
				var_10_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_10_1, true)
			end

			local var_10_5 = 1

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_5 and arg_7_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_7_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_7_1.time_ >= var_10_0 + var_10_5 and arg_7_1.time_ < var_10_0 + var_10_5 + arg_10_0 then
				-- block empty
			end
		end
	end,
	Play900402005 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 900402005
		arg_11_1.duration_ = 1

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play900402006(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_11_0, arg_11_1.narrativeGo_)

			local var_14_0 = 0

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				local var_14_1 = Object.Instantiate(arg_11_1.narrativeItemGo_)
				local var_14_2 = var_14_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_11_0, var_14_1)

				arg_11_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033_split_6")

				local var_14_3 = arg_11_1:GetWordFromCfg(900402005)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_0.narr_item_content.text = var_14_4

				var_14_1.transform:SetParent(arg_11_1.narrativeItemGo_.transform.parent)

				var_14_1.transform.localPosition = Vector3(0, 0, 0)
				var_14_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_14_1, true)
			end

			local var_14_5 = 1

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_5 and arg_11_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_11_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_11_1.time_ >= var_14_0 + var_14_5 and arg_11_1.time_ < var_14_0 + var_14_5 + arg_14_0 then
				-- block empty
			end
		end
	end,
	Play900402006 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 900402006
		arg_15_1.duration_ = 1

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play900402007(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_15_0, arg_15_1.narrativeGo_)

			local var_18_0 = 0

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				local var_18_1 = Object.Instantiate(arg_15_1.narrativeItemGo_)
				local var_18_2 = var_18_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_15_0, var_18_1)

				arg_15_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10022_split_3")

				local var_18_3 = arg_15_1:GetWordFromCfg(900402006)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_0.narr_item_content.text = var_18_4

				var_18_1.transform:SetParent(arg_15_1.narrativeItemGo_.transform.parent)

				var_18_1.transform.localPosition = Vector3(0, 0, 0)
				var_18_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_18_1, true)
			end

			local var_18_5 = 1

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_5 and arg_15_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_15_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_15_1.time_ >= var_18_0 + var_18_5 and arg_15_1.time_ < var_18_0 + var_18_5 + arg_18_0 then
				-- block empty
			end
		end
	end,
	Play900402007 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 900402007
		arg_19_1.duration_ = 1

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play900402008(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_19_0, arg_19_1.narrativeGo_)

			local var_22_0 = 0

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				local var_22_1 = Object.Instantiate(arg_19_1.narrativeItemGo_)
				local var_22_2 = var_22_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_19_0, var_22_1)

				arg_19_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1119_1_split_6")

				local var_22_3 = arg_19_1:GetWordFromCfg(900402007)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_0.narr_item_content.text = var_22_4

				var_22_1.transform:SetParent(arg_19_1.narrativeItemGo_.transform.parent)

				var_22_1.transform.localPosition = Vector3(0, 0, 0)
				var_22_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_22_1, true)
			end

			local var_22_5 = 1

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_5 and arg_19_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_19_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_19_1.time_ >= var_22_0 + var_22_5 and arg_19_1.time_ < var_22_0 + var_22_5 + arg_22_0 then
				-- block empty
			end
		end
	end,
	Play900402008 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 900402008
		arg_23_1.duration_ = 1

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play900402009(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_23_0, arg_23_1.narrativeGo_)

			local var_26_0 = 0

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				local var_26_1 = Object.Instantiate(arg_23_1.narrativeItemGo_)
				local var_26_2 = var_26_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_23_0, var_26_1)

				arg_23_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_9")

				local var_26_3 = arg_23_1:GetWordFromCfg(900402008)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_0.narr_item_content.text = var_26_4

				var_26_1.transform:SetParent(arg_23_1.narrativeItemGo_.transform.parent)

				var_26_1.transform.localPosition = Vector3(0, 0, 0)
				var_26_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_26_1, true)
			end

			local var_26_5 = 1

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_5 and arg_23_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_23_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_23_1.time_ >= var_26_0 + var_26_5 and arg_23_1.time_ < var_26_0 + var_26_5 + arg_26_0 then
				-- block empty
			end
		end
	end,
	Play900402009 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 900402009
		arg_27_1.duration_ = 1

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play900402010(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_27_0, arg_27_1.narrativeGo_)

			local var_30_0 = 0

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				local var_30_1 = Object.Instantiate(arg_27_1.narrativeItemGo_)
				local var_30_2 = var_30_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_27_0, var_30_1)

				arg_27_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_3021")

				local var_30_3 = arg_27_1:GetWordFromCfg(900402009)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_0.narr_item_content.text = var_30_4

				var_30_1.transform:SetParent(arg_27_1.narrativeItemGo_.transform.parent)

				var_30_1.transform.localPosition = Vector3(0, 0, 0)
				var_30_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_30_1, true)
			end

			local var_30_5 = 1

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_5 and arg_27_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_27_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_27_1.time_ >= var_30_0 + var_30_5 and arg_27_1.time_ < var_30_0 + var_30_5 + arg_30_0 then
				-- block empty
			end
		end
	end,
	Play900402010 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 900402010
		arg_31_1.duration_ = 1

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play900402011(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_31_0, arg_31_1.narrativeGo_)

			local var_34_0 = 0

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				local var_34_1 = Object.Instantiate(arg_31_1.narrativeItemGo_)
				local var_34_2 = var_34_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_31_0, var_34_1)

				arg_31_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1119_1_split_1")

				local var_34_3 = arg_31_1:GetWordFromCfg(900402010)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_0.narr_item_content.text = var_34_4

				var_34_1.transform:SetParent(arg_31_1.narrativeItemGo_.transform.parent)

				var_34_1.transform.localPosition = Vector3(0, 0, 0)
				var_34_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_34_1, true)
			end

			local var_34_5 = 1

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_5 and arg_31_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_31_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_31_1.time_ >= var_34_0 + var_34_5 and arg_31_1.time_ < var_34_0 + var_34_5 + arg_34_0 then
				-- block empty
			end
		end
	end,
	Play900402011 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 900402011
		arg_35_1.duration_ = 1

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play900402012(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_35_0, arg_35_1.narrativeGo_)

			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				local var_38_1 = Object.Instantiate(arg_35_1.narrativeItemGo_)
				local var_38_2 = var_38_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_35_0, var_38_1)

				arg_35_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033_split_1")

				local var_38_3 = arg_35_1:GetWordFromCfg(900402011)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_0.narr_item_content.text = var_38_4

				var_38_1.transform:SetParent(arg_35_1.narrativeItemGo_.transform.parent)

				var_38_1.transform.localPosition = Vector3(0, 0, 0)
				var_38_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_38_1, true)
			end

			local var_38_5 = 1

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_5 and arg_35_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_35_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_35_1.time_ >= var_38_0 + var_38_5 and arg_35_1.time_ < var_38_0 + var_38_5 + arg_38_0 then
				-- block empty
			end
		end
	end,
	Play900402012 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 900402012
		arg_39_1.duration_ = 1

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play900402013(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_39_0, arg_39_1.narrativeGo_)

			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				local var_42_1 = Object.Instantiate(arg_39_1.narrativeItemGo_)
				local var_42_2 = var_42_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_39_0, var_42_1)

				arg_39_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_7")

				local var_42_3 = arg_39_1:GetWordFromCfg(900402012)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_0.narr_item_content.text = var_42_4

				var_42_1.transform:SetParent(arg_39_1.narrativeItemGo_.transform.parent)

				var_42_1.transform.localPosition = Vector3(0, 0, 0)
				var_42_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_42_1, true)
			end

			local var_42_5 = 1

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_5 and arg_39_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_39_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_39_1.time_ >= var_42_0 + var_42_5 and arg_39_1.time_ < var_42_0 + var_42_5 + arg_42_0 then
				-- block empty
			end
		end
	end,
	Play900402013 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 900402013
		arg_43_1.duration_ = 1

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play900402014(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_43_0, arg_43_1.narrativeGo_)

			local var_46_0 = 0

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				local var_46_1 = Object.Instantiate(arg_43_1.narrativeItemGo_)
				local var_46_2 = var_46_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_43_0, var_46_1)

				arg_43_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1033_split_5")

				local var_46_3 = arg_43_1:GetWordFromCfg(900402013)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_0.narr_item_content.text = var_46_4

				var_46_1.transform:SetParent(arg_43_1.narrativeItemGo_.transform.parent)

				var_46_1.transform.localPosition = Vector3(0, 0, 0)
				var_46_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_46_1, true)
			end

			local var_46_5 = 1

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_5 and arg_43_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_43_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_43_1.time_ >= var_46_0 + var_46_5 and arg_43_1.time_ < var_46_0 + var_46_5 + arg_46_0 then
				-- block empty
			end
		end
	end,
	Play900402014 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 900402014
		arg_47_1.duration_ = 1

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play900402015(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_47_0, arg_47_1.narrativeGo_)

			local var_50_0 = 0

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				local var_50_1 = Object.Instantiate(arg_47_1.narrativeItemGo_)
				local var_50_2 = var_50_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_47_0, var_50_1)

				arg_47_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_9")

				local var_50_3 = arg_47_1:GetWordFromCfg(900402014)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_0.narr_item_content.text = var_50_4

				var_50_1.transform:SetParent(arg_47_1.narrativeItemGo_.transform.parent)

				var_50_1.transform.localPosition = Vector3(0, 0, 0)
				var_50_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_50_1, true)
			end

			local var_50_5 = 1

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_5 and arg_47_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_47_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_47_1.time_ >= var_50_0 + var_50_5 and arg_47_1.time_ < var_50_0 + var_50_5 + arg_50_0 then
				-- block empty
			end
		end
	end,
	Play900402015 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 900402015
		arg_51_1.duration_ = 1

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play900402016(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_51_0, arg_51_1.narrativeGo_)

			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				local var_54_1 = Object.Instantiate(arg_51_1.narrativeItemGo_)
				local var_54_2 = var_54_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_51_0, var_54_1)

				arg_51_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10026_split_1")

				local var_54_3 = arg_51_1:GetWordFromCfg(900402015)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_0.narr_item_content.text = var_54_4

				var_54_1.transform:SetParent(arg_51_1.narrativeItemGo_.transform.parent)

				var_54_1.transform.localPosition = Vector3(0, 0, 0)
				var_54_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_54_1, true)
			end

			local var_54_5 = 1

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_5 and arg_51_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_51_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_51_1.time_ >= var_54_0 + var_54_5 and arg_51_1.time_ < var_54_0 + var_54_5 + arg_54_0 then
				-- block empty
			end
		end
	end,
	Play900402016 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 900402016
		arg_55_1.duration_ = 1

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play900402017(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_55_0, arg_55_1.narrativeGo_)

			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				local var_58_1 = Object.Instantiate(arg_55_1.narrativeItemGo_)
				local var_58_2 = var_58_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_55_0, var_58_1)

				arg_55_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10026_split_1")

				local var_58_3 = arg_55_1:GetWordFromCfg(900402016)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_0.narr_item_content.text = var_58_4

				var_58_1.transform:SetParent(arg_55_1.narrativeItemGo_.transform.parent)

				var_58_1.transform.localPosition = Vector3(0, 0, 0)
				var_58_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_58_1, true)
			end

			local var_58_5 = 1

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_5 and arg_55_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_55_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_55_1.time_ >= var_58_0 + var_58_5 and arg_55_1.time_ < var_58_0 + var_58_5 + arg_58_0 then
				-- block empty
			end
		end
	end,
	Play900402017 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 900402017
		arg_59_1.duration_ = 1

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play900402018(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_59_0, arg_59_1.narrativeGo_)

			local var_62_0 = 0

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				local var_62_1 = Object.Instantiate(arg_59_1.narrativeItemGo_)
				local var_62_2 = var_62_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_59_0, var_62_1)

				arg_59_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_1")

				local var_62_3 = arg_59_1:GetWordFromCfg(900402017)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_0.narr_item_content.text = var_62_4

				var_62_1.transform:SetParent(arg_59_1.narrativeItemGo_.transform.parent)

				var_62_1.transform.localPosition = Vector3(0, 0, 0)
				var_62_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_62_1, true)
			end

			local var_62_5 = 1

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_5 and arg_59_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_59_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_59_1.time_ >= var_62_0 + var_62_5 and arg_59_1.time_ < var_62_0 + var_62_5 + arg_62_0 then
				-- block empty
			end
		end
	end,
	Play900402018 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 900402018
		arg_63_1.duration_ = 1

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play900402019(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_63_0, arg_63_1.narrativeGo_)

			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				local var_66_1 = Object.Instantiate(arg_63_1.narrativeItemGo_)
				local var_66_2 = var_66_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_63_0, var_66_1)

				arg_63_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10026_split_1")

				local var_66_3 = arg_63_1:GetWordFromCfg(900402018)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_0.narr_item_content.text = var_66_4

				var_66_1.transform:SetParent(arg_63_1.narrativeItemGo_.transform.parent)

				var_66_1.transform.localPosition = Vector3(0, 0, 0)
				var_66_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_66_1, true)
			end

			local var_66_5 = 1

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_5 and arg_63_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_63_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_63_1.time_ >= var_66_0 + var_66_5 and arg_63_1.time_ < var_66_0 + var_66_5 + arg_66_0 then
				-- block empty
			end
		end
	end,
	Play900402019 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 900402019
		arg_67_1.duration_ = 1

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play900402020(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_67_0, arg_67_1.narrativeGo_)

			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				local var_70_1 = Object.Instantiate(arg_67_1.narrativeItemGo_)
				local var_70_2 = var_70_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_67_0, var_70_1)

				arg_67_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_1")

				local var_70_3 = arg_67_1:GetWordFromCfg(900402019)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_0.narr_item_content.text = var_70_4

				var_70_1.transform:SetParent(arg_67_1.narrativeItemGo_.transform.parent)

				var_70_1.transform.localPosition = Vector3(0, 0, 0)
				var_70_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_70_1, true)
			end

			local var_70_5 = 1

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_5 and arg_67_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_67_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_67_1.time_ >= var_70_0 + var_70_5 and arg_67_1.time_ < var_70_0 + var_70_5 + arg_70_0 then
				-- block empty
			end
		end
	end,
	Play900402020 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 900402020
		arg_71_1.duration_ = 1

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play900402021(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_71_0, arg_71_1.narrativeGo_)

			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				local var_74_1 = Object.Instantiate(arg_71_1.narrativeItemGo_)
				local var_74_2 = var_74_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_71_0, var_74_1)

				arg_71_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10026_split_1")

				local var_74_3 = arg_71_1:GetWordFromCfg(900402020)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_0.narr_item_content.text = var_74_4

				var_74_1.transform:SetParent(arg_71_1.narrativeItemGo_.transform.parent)

				var_74_1.transform.localPosition = Vector3(0, 0, 0)
				var_74_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_74_1, true)
			end

			local var_74_5 = 1

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_5 and arg_71_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_71_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_71_1.time_ >= var_74_0 + var_74_5 and arg_71_1.time_ < var_74_0 + var_74_5 + arg_74_0 then
				-- block empty
			end
		end
	end,
	Play900402021 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 900402021
		arg_75_1.duration_ = 1.03

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
			arg_75_1.auto_ = false
		end

		function arg_75_1.playNext_(arg_77_0)
			arg_75_1.onStoryFinished_()
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			ComponentBinder.GetInstance():BindCfgUI(arg_75_0, arg_75_1.narrativeGo_)

			local var_78_0 = 0

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				local var_78_1 = Object.Instantiate(arg_75_1.narrativeItemGo_)
				local var_78_2 = var_78_1:GetComponent("ComponentCfger")

				ComponentBinder.GetInstance():BindCfgUI(arg_75_0, var_78_1)

				arg_75_0.narr_item_head.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1119_1_split_6")

				local var_78_3 = arg_75_1:GetWordFromCfg(900402021)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_0.narr_item_content.text = var_78_4

				var_78_1.transform:SetParent(arg_75_1.narrativeItemGo_.transform.parent)

				var_78_1.transform.localPosition = Vector3(0, 0, 0)
				var_78_1.transform.localScale = Vector3(1, 1, 1)

				SetActive(var_78_1, true)
			end

			local var_78_5 = 1

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_5 and arg_75_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_75_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_75_1.time_ >= var_78_0 + var_78_5 and arg_75_1.time_ < var_78_0 + var_78_5 + arg_78_0 then
				-- block empty
			end

			ComponentBinder.GetInstance():BindCfgUI(arg_75_0, arg_75_1.narrativeGo_)

			local var_78_6 = 1

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				-- block empty
			end

			local var_78_7 = 0.0334

			if var_78_6 <= arg_75_1.time_ and arg_75_1.time_ < var_78_6 + var_78_7 and arg_75_1.narrativeListGo_.verticalNormalizedPosition >= 0.001 then
				arg_75_1.narrativeListGo_.verticalNormalizedPosition = 0
			end

			if arg_75_1.time_ >= var_78_6 + var_78_7 and arg_75_1.time_ < var_78_6 + var_78_7 + arg_78_0 then
				arg_75_1.narrativeListGo_.movementType = ScrollRect.MovementType.Elastic

				local var_78_8 = arg_75_1.narrativeListGo_:GetComponent(typeof(Image))

				if var_78_8 then
					var_78_8.raycastTarget = true
				end

				SetActive(arg_75_1.narrativeContinueBtn_.gameObject, true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/Volume"
	},
	voices = {}
}

var_0_0.narrativeChapter = 900402001
var_0_0.narrativeTime = 900402002
var_0_0.narrativeData = {
	{
		"story_1033_split_6",
		900402003
	},
	{
		"story_3021",
		900402004
	},
	{
		"story_1033_split_6",
		900402005
	},
	{
		"story_10022_split_3",
		900402006
	},
	{
		"story_1119_1_split_6",
		900402007
	},
	{
		"story_1038_split_9",
		900402008
	},
	{
		"story_3021",
		900402009
	},
	{
		"story_1119_1_split_1",
		900402010
	},
	{
		"story_1033_split_1",
		900402011
	},
	{
		"story_1038_split_7",
		900402012
	},
	{
		"story_1033_split_5",
		900402013
	},
	{
		"story_1038_split_9",
		900402014
	},
	{
		"story_10026_split_1",
		900402015
	},
	{
		"story_10026_split_1",
		900402016
	},
	{
		"story_1038_split_1",
		900402017
	},
	{
		"story_10026_split_1",
		900402018
	},
	{
		"story_1038_split_1",
		900402019
	},
	{
		"story_10026_split_1",
		900402020
	},
	{
		"story_1119_1_split_6",
		900402021
	}
}

return var_0_0
