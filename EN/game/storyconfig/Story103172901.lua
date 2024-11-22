return {
	Play317291001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 317291001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play317291002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K11f"

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
				local var_4_5 = arg_1_1.bgs_.K11f

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
					if iter_4_0 ~= "K11f" then
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
			end

			local var_4_26 = 0.733333333333333
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden", "bgm_activity_2_6_story_karasugo_garden.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.75

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_32 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_32:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_33 = arg_1_1:GetWordFromCfg(317291001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 30
				local var_4_36 = utf8.len(var_4_34)
				local var_4_37 = var_4_35 <= 0 and var_4_31 or var_4_31 * (var_4_36 / var_4_35)

				if var_4_37 > 0 and var_4_31 < var_4_37 then
					arg_1_1.talkMaxDuration = var_4_37
					var_4_30 = var_4_30 + 0.3

					if var_4_37 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_37 + var_4_30
					end
				end

				arg_1_1.text_.text = var_4_34
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_38 = var_4_30 + 0.3
			local var_4_39 = math.max(var_4_31, arg_1_1.talkMaxDuration)

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_38) / var_4_39

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play317291002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 317291002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play317291003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.975

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_2 = arg_7_1:GetWordFromCfg(317291002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 39
				local var_10_5 = utf8.len(var_10_3)
				local var_10_6 = var_10_4 <= 0 and var_10_1 or var_10_1 * (var_10_5 / var_10_4)

				if var_10_6 > 0 and var_10_1 < var_10_6 then
					arg_7_1.talkMaxDuration = var_10_6

					if var_10_6 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_6 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_3
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_7 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_7 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_7

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_7 and arg_7_1.time_ < var_10_0 + var_10_7 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play317291003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 317291003
		arg_11_1.duration_ = 7.1

		local var_11_0 = {
			zh = 7.1,
			ja = 5.766
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
				arg_11_0:Play317291004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.45

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[572].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(317291003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 18
				local var_14_6 = utf8.len(var_14_4)
				local var_14_7 = var_14_5 <= 0 and var_14_1 or var_14_1 * (var_14_6 / var_14_5)

				if var_14_7 > 0 and var_14_1 < var_14_7 then
					arg_11_1.talkMaxDuration = var_14_7

					if var_14_7 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_7 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_4
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291003", "story_v_out_317291.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_317291", "317291003", "story_v_out_317291.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_317291", "317291003", "story_v_out_317291.awb")

						arg_11_1:RecordAudio("317291003", var_14_9)
						arg_11_1:RecordAudio("317291003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_317291", "317291003", "story_v_out_317291.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_317291", "317291003", "story_v_out_317291.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_10 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_10 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_10

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_10 and arg_11_1.time_ < var_14_0 + var_14_10 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play317291004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 317291004
		arg_15_1.duration_ = 8.133

		local var_15_0 = {
			zh = 6.9,
			ja = 8.133
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
				arg_15_0:Play317291005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "STblack"

			if arg_15_1.bgs_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(arg_15_1.paintGo_)

				var_18_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_18_0)
				var_18_1.name = var_18_0
				var_18_1.transform.parent = arg_15_1.stage_.transform
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.bgs_[var_18_0] = var_18_1
			end

			local var_18_2 = 2

			if var_18_2 < arg_15_1.time_ and arg_15_1.time_ <= var_18_2 + arg_18_0 then
				local var_18_3 = manager.ui.mainCamera.transform.localPosition
				local var_18_4 = Vector3.New(0, 0, 10) + Vector3.New(var_18_3.x, var_18_3.y, 0)
				local var_18_5 = arg_15_1.bgs_.STblack

				var_18_5.transform.localPosition = var_18_4
				var_18_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_18_6 = var_18_5:GetComponent("SpriteRenderer")

				if var_18_6 and var_18_6.sprite then
					local var_18_7 = (var_18_5.transform.localPosition - var_18_3).z
					local var_18_8 = manager.ui.mainCameraCom_
					local var_18_9 = 2 * var_18_7 * Mathf.Tan(var_18_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_18_10 = var_18_9 * var_18_8.aspect
					local var_18_11 = var_18_6.sprite.bounds.size.x
					local var_18_12 = var_18_6.sprite.bounds.size.y
					local var_18_13 = var_18_10 / var_18_11
					local var_18_14 = var_18_9 / var_18_12
					local var_18_15 = var_18_14 < var_18_13 and var_18_13 or var_18_14

					var_18_5.transform.localScale = Vector3.New(var_18_15, var_18_15, 0)
				end

				for iter_18_0, iter_18_1 in pairs(arg_15_1.bgs_) do
					if iter_18_0 ~= "STblack" then
						iter_18_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				arg_15_1.mask_.enabled = true
				arg_15_1.mask_.raycastTarget = true

				arg_15_1:SetGaussion(false)
			end

			local var_18_17 = 2

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17
				local var_18_19 = Color.New(0, 0, 0)

				var_18_19.a = Mathf.Lerp(0, 1, var_18_18)
				arg_15_1.mask_.color = var_18_19
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 then
				local var_18_20 = Color.New(0, 0, 0)

				var_18_20.a = 1
				arg_15_1.mask_.color = var_18_20
			end

			local var_18_21 = 2

			if var_18_21 < arg_15_1.time_ and arg_15_1.time_ <= var_18_21 + arg_18_0 then
				arg_15_1.mask_.enabled = true
				arg_15_1.mask_.raycastTarget = true

				arg_15_1:SetGaussion(false)
			end

			local var_18_22 = 2

			if var_18_21 <= arg_15_1.time_ and arg_15_1.time_ < var_18_21 + var_18_22 then
				local var_18_23 = (arg_15_1.time_ - var_18_21) / var_18_22
				local var_18_24 = Color.New(0, 0, 0)

				var_18_24.a = Mathf.Lerp(1, 0, var_18_23)
				arg_15_1.mask_.color = var_18_24
			end

			if arg_15_1.time_ >= var_18_21 + var_18_22 and arg_15_1.time_ < var_18_21 + var_18_22 + arg_18_0 then
				local var_18_25 = Color.New(0, 0, 0)
				local var_18_26 = 0

				arg_15_1.mask_.enabled = false
				var_18_25.a = var_18_26
				arg_15_1.mask_.color = var_18_25
			end

			if arg_15_1.frameCnt_ <= 1 then
				arg_15_1.dialog_:SetActive(false)
			end

			local var_18_27 = 4
			local var_18_28 = 0.2

			if var_18_27 < arg_15_1.time_ and arg_15_1.time_ <= var_18_27 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0

				arg_15_1.dialog_:SetActive(true)

				local var_18_29 = LeanTween.value(arg_15_1.dialog_, 0, 1, 0.3)

				var_18_29:setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
					arg_15_1.dialogCg_.alpha = arg_19_0
				end))
				var_18_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_15_1.dialog_)
					var_18_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_15_1.duration_ = arg_15_1.duration_ + 0.3

				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_30 = arg_15_1:FormatText(StoryNameCfg[570].name)

				arg_15_1.leftNameTxt_.text = var_18_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_31 = arg_15_1:GetWordFromCfg(317291004)
				local var_18_32 = arg_15_1:FormatText(var_18_31.content)

				arg_15_1.text_.text = var_18_32

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_33 = 8
				local var_18_34 = utf8.len(var_18_32)
				local var_18_35 = var_18_33 <= 0 and var_18_28 or var_18_28 * (var_18_34 / var_18_33)

				if var_18_35 > 0 and var_18_28 < var_18_35 then
					arg_15_1.talkMaxDuration = var_18_35
					var_18_27 = var_18_27 + 0.3

					if var_18_35 + var_18_27 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_35 + var_18_27
					end
				end

				arg_15_1.text_.text = var_18_32
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291004", "story_v_out_317291.awb") ~= 0 then
					local var_18_36 = manager.audio:GetVoiceLength("story_v_out_317291", "317291004", "story_v_out_317291.awb") / 1000

					if var_18_36 + var_18_27 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_36 + var_18_27
					end

					if var_18_31.prefab_name ~= "" and arg_15_1.actors_[var_18_31.prefab_name] ~= nil then
						local var_18_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_31.prefab_name].transform, "story_v_out_317291", "317291004", "story_v_out_317291.awb")

						arg_15_1:RecordAudio("317291004", var_18_37)
						arg_15_1:RecordAudio("317291004", var_18_37)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_317291", "317291004", "story_v_out_317291.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_317291", "317291004", "story_v_out_317291.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_38 = var_18_27 + 0.3
			local var_18_39 = math.max(var_18_28, arg_15_1.talkMaxDuration)

			if var_18_38 <= arg_15_1.time_ and arg_15_1.time_ < var_18_38 + var_18_39 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_38) / var_18_39

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_38 + var_18_39 and arg_15_1.time_ < var_18_38 + var_18_39 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play317291005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 317291005
		arg_21_1.duration_ = 10

		local var_21_0 = {
			zh = 9.533,
			ja = 10
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
				arg_21_0:Play317291006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0

			if var_24_0 < arg_21_1.time_ and arg_21_1.time_ <= var_24_0 + arg_24_0 then
				local var_24_1 = manager.ui.mainCamera.transform.localPosition
				local var_24_2 = Vector3.New(0, 0, 10) + Vector3.New(var_24_1.x, var_24_1.y, 0)
				local var_24_3 = arg_21_1.bgs_.K11f

				var_24_3.transform.localPosition = var_24_2
				var_24_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_24_4 = var_24_3:GetComponent("SpriteRenderer")

				if var_24_4 and var_24_4.sprite then
					local var_24_5 = (var_24_3.transform.localPosition - var_24_1).z
					local var_24_6 = manager.ui.mainCameraCom_
					local var_24_7 = 2 * var_24_5 * Mathf.Tan(var_24_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_24_8 = var_24_7 * var_24_6.aspect
					local var_24_9 = var_24_4.sprite.bounds.size.x
					local var_24_10 = var_24_4.sprite.bounds.size.y
					local var_24_11 = var_24_8 / var_24_9
					local var_24_12 = var_24_7 / var_24_10
					local var_24_13 = var_24_12 < var_24_11 and var_24_11 or var_24_12

					var_24_3.transform.localScale = Vector3.New(var_24_13, var_24_13, 0)
				end

				for iter_24_0, iter_24_1 in pairs(arg_21_1.bgs_) do
					if iter_24_0 ~= "K11f" then
						iter_24_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_24_14 = 0

			if var_24_14 < arg_21_1.time_ and arg_21_1.time_ <= var_24_14 + arg_24_0 then
				arg_21_1.mask_.enabled = true
				arg_21_1.mask_.raycastTarget = true

				arg_21_1:SetGaussion(false)
			end

			local var_24_15 = 2

			if var_24_14 <= arg_21_1.time_ and arg_21_1.time_ < var_24_14 + var_24_15 then
				local var_24_16 = (arg_21_1.time_ - var_24_14) / var_24_15
				local var_24_17 = Color.New(0, 0, 0)

				var_24_17.a = Mathf.Lerp(1, 0, var_24_16)
				arg_21_1.mask_.color = var_24_17
			end

			if arg_21_1.time_ >= var_24_14 + var_24_15 and arg_21_1.time_ < var_24_14 + var_24_15 + arg_24_0 then
				local var_24_18 = Color.New(0, 0, 0)
				local var_24_19 = 0

				arg_21_1.mask_.enabled = false
				var_24_18.a = var_24_19
				arg_21_1.mask_.color = var_24_18
			end

			if arg_21_1.frameCnt_ <= 1 then
				arg_21_1.dialog_:SetActive(false)
			end

			local var_24_20 = 2
			local var_24_21 = 0.475

			if var_24_20 < arg_21_1.time_ and arg_21_1.time_ <= var_24_20 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0

				arg_21_1.dialog_:SetActive(true)

				local var_24_22 = LeanTween.value(arg_21_1.dialog_, 0, 1, 0.3)

				var_24_22:setOnUpdate(LuaHelper.FloatAction(function(arg_25_0)
					arg_21_1.dialogCg_.alpha = arg_25_0
				end))
				var_24_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_21_1.dialog_)
					var_24_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_21_1.duration_ = arg_21_1.duration_ + 0.3

				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_23 = arg_21_1:FormatText(StoryNameCfg[572].name)

				arg_21_1.leftNameTxt_.text = var_24_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, true)
				arg_21_1.iconController_:SetSelectedState("hero")

				arg_21_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_24 = arg_21_1:GetWordFromCfg(317291005)
				local var_24_25 = arg_21_1:FormatText(var_24_24.content)

				arg_21_1.text_.text = var_24_25

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_26 = 19
				local var_24_27 = utf8.len(var_24_25)
				local var_24_28 = var_24_26 <= 0 and var_24_21 or var_24_21 * (var_24_27 / var_24_26)

				if var_24_28 > 0 and var_24_21 < var_24_28 then
					arg_21_1.talkMaxDuration = var_24_28
					var_24_20 = var_24_20 + 0.3

					if var_24_28 + var_24_20 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_28 + var_24_20
					end
				end

				arg_21_1.text_.text = var_24_25
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291005", "story_v_out_317291.awb") ~= 0 then
					local var_24_29 = manager.audio:GetVoiceLength("story_v_out_317291", "317291005", "story_v_out_317291.awb") / 1000

					if var_24_29 + var_24_20 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_29 + var_24_20
					end

					if var_24_24.prefab_name ~= "" and arg_21_1.actors_[var_24_24.prefab_name] ~= nil then
						local var_24_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_24.prefab_name].transform, "story_v_out_317291", "317291005", "story_v_out_317291.awb")

						arg_21_1:RecordAudio("317291005", var_24_30)
						arg_21_1:RecordAudio("317291005", var_24_30)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_317291", "317291005", "story_v_out_317291.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_317291", "317291005", "story_v_out_317291.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_31 = var_24_20 + 0.3
			local var_24_32 = math.max(var_24_21, arg_21_1.talkMaxDuration)

			if var_24_31 <= arg_21_1.time_ and arg_21_1.time_ < var_24_31 + var_24_32 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_31) / var_24_32

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_31 + var_24_32 and arg_21_1.time_ < var_24_31 + var_24_32 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play317291006 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 317291006
		arg_27_1.duration_ = 9.5

		local var_27_0 = {
			zh = 7.2,
			ja = 9.5
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
				arg_27_0:Play317291007(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 2

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				local var_30_1 = manager.ui.mainCamera.transform.localPosition
				local var_30_2 = Vector3.New(0, 0, 10) + Vector3.New(var_30_1.x, var_30_1.y, 0)
				local var_30_3 = arg_27_1.bgs_.STblack

				var_30_3.transform.localPosition = var_30_2
				var_30_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_30_4 = var_30_3:GetComponent("SpriteRenderer")

				if var_30_4 and var_30_4.sprite then
					local var_30_5 = (var_30_3.transform.localPosition - var_30_1).z
					local var_30_6 = manager.ui.mainCameraCom_
					local var_30_7 = 2 * var_30_5 * Mathf.Tan(var_30_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_30_8 = var_30_7 * var_30_6.aspect
					local var_30_9 = var_30_4.sprite.bounds.size.x
					local var_30_10 = var_30_4.sprite.bounds.size.y
					local var_30_11 = var_30_8 / var_30_9
					local var_30_12 = var_30_7 / var_30_10
					local var_30_13 = var_30_12 < var_30_11 and var_30_11 or var_30_12

					var_30_3.transform.localScale = Vector3.New(var_30_13, var_30_13, 0)
				end

				for iter_30_0, iter_30_1 in pairs(arg_27_1.bgs_) do
					if iter_30_0 ~= "STblack" then
						iter_30_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 then
				arg_27_1.mask_.enabled = true
				arg_27_1.mask_.raycastTarget = true

				arg_27_1:SetGaussion(false)
			end

			local var_30_15 = 2

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15
				local var_30_17 = Color.New(0, 0, 0)

				var_30_17.a = Mathf.Lerp(0, 1, var_30_16)
				arg_27_1.mask_.color = var_30_17
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 then
				local var_30_18 = Color.New(0, 0, 0)

				var_30_18.a = 1
				arg_27_1.mask_.color = var_30_18
			end

			local var_30_19 = 2

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.mask_.enabled = true
				arg_27_1.mask_.raycastTarget = true

				arg_27_1:SetGaussion(false)
			end

			local var_30_20 = 2

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_20 then
				local var_30_21 = (arg_27_1.time_ - var_30_19) / var_30_20
				local var_30_22 = Color.New(0, 0, 0)

				var_30_22.a = Mathf.Lerp(1, 0, var_30_21)
				arg_27_1.mask_.color = var_30_22
			end

			if arg_27_1.time_ >= var_30_19 + var_30_20 and arg_27_1.time_ < var_30_19 + var_30_20 + arg_30_0 then
				local var_30_23 = Color.New(0, 0, 0)
				local var_30_24 = 0

				arg_27_1.mask_.enabled = false
				var_30_23.a = var_30_24
				arg_27_1.mask_.color = var_30_23
			end

			if arg_27_1.frameCnt_ <= 1 then
				arg_27_1.dialog_:SetActive(false)
			end

			local var_30_25 = 4
			local var_30_26 = 0.25

			if var_30_25 < arg_27_1.time_ and arg_27_1.time_ <= var_30_25 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0

				arg_27_1.dialog_:SetActive(true)

				local var_30_27 = LeanTween.value(arg_27_1.dialog_, 0, 1, 0.3)

				var_30_27:setOnUpdate(LuaHelper.FloatAction(function(arg_31_0)
					arg_27_1.dialogCg_.alpha = arg_31_0
				end))
				var_30_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_27_1.dialog_)
					var_30_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_27_1.duration_ = arg_27_1.duration_ + 0.3

				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_28 = arg_27_1:FormatText(StoryNameCfg[570].name)

				arg_27_1.leftNameTxt_.text = var_30_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_29 = arg_27_1:GetWordFromCfg(317291006)
				local var_30_30 = arg_27_1:FormatText(var_30_29.content)

				arg_27_1.text_.text = var_30_30

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_31 = 10
				local var_30_32 = utf8.len(var_30_30)
				local var_30_33 = var_30_31 <= 0 and var_30_26 or var_30_26 * (var_30_32 / var_30_31)

				if var_30_33 > 0 and var_30_26 < var_30_33 then
					arg_27_1.talkMaxDuration = var_30_33
					var_30_25 = var_30_25 + 0.3

					if var_30_33 + var_30_25 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_33 + var_30_25
					end
				end

				arg_27_1.text_.text = var_30_30
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291006", "story_v_out_317291.awb") ~= 0 then
					local var_30_34 = manager.audio:GetVoiceLength("story_v_out_317291", "317291006", "story_v_out_317291.awb") / 1000

					if var_30_34 + var_30_25 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_34 + var_30_25
					end

					if var_30_29.prefab_name ~= "" and arg_27_1.actors_[var_30_29.prefab_name] ~= nil then
						local var_30_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_29.prefab_name].transform, "story_v_out_317291", "317291006", "story_v_out_317291.awb")

						arg_27_1:RecordAudio("317291006", var_30_35)
						arg_27_1:RecordAudio("317291006", var_30_35)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_317291", "317291006", "story_v_out_317291.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_317291", "317291006", "story_v_out_317291.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_36 = var_30_25 + 0.3
			local var_30_37 = math.max(var_30_26, arg_27_1.talkMaxDuration)

			if var_30_36 <= arg_27_1.time_ and arg_27_1.time_ < var_30_36 + var_30_37 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_36) / var_30_37

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_36 + var_30_37 and arg_27_1.time_ < var_30_36 + var_30_37 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play317291007 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 317291007
		arg_33_1.duration_ = 11.666

		local var_33_0 = {
			zh = 11.666,
			ja = 9.866
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
				arg_33_0:Play317291008(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				local var_36_1 = manager.ui.mainCamera.transform.localPosition
				local var_36_2 = Vector3.New(0, 0, 10) + Vector3.New(var_36_1.x, var_36_1.y, 0)
				local var_36_3 = arg_33_1.bgs_.K11f

				var_36_3.transform.localPosition = var_36_2
				var_36_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_36_4 = var_36_3:GetComponent("SpriteRenderer")

				if var_36_4 and var_36_4.sprite then
					local var_36_5 = (var_36_3.transform.localPosition - var_36_1).z
					local var_36_6 = manager.ui.mainCameraCom_
					local var_36_7 = 2 * var_36_5 * Mathf.Tan(var_36_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_36_8 = var_36_7 * var_36_6.aspect
					local var_36_9 = var_36_4.sprite.bounds.size.x
					local var_36_10 = var_36_4.sprite.bounds.size.y
					local var_36_11 = var_36_8 / var_36_9
					local var_36_12 = var_36_7 / var_36_10
					local var_36_13 = var_36_12 < var_36_11 and var_36_11 or var_36_12

					var_36_3.transform.localScale = Vector3.New(var_36_13, var_36_13, 0)
				end

				for iter_36_0, iter_36_1 in pairs(arg_33_1.bgs_) do
					if iter_36_0 ~= "K11f" then
						iter_36_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_36_14 = 0

			if var_36_14 < arg_33_1.time_ and arg_33_1.time_ <= var_36_14 + arg_36_0 then
				arg_33_1.mask_.enabled = true
				arg_33_1.mask_.raycastTarget = true

				arg_33_1:SetGaussion(false)
			end

			local var_36_15 = 2

			if var_36_14 <= arg_33_1.time_ and arg_33_1.time_ < var_36_14 + var_36_15 then
				local var_36_16 = (arg_33_1.time_ - var_36_14) / var_36_15
				local var_36_17 = Color.New(0, 0, 0)

				var_36_17.a = Mathf.Lerp(1, 0, var_36_16)
				arg_33_1.mask_.color = var_36_17
			end

			if arg_33_1.time_ >= var_36_14 + var_36_15 and arg_33_1.time_ < var_36_14 + var_36_15 + arg_36_0 then
				local var_36_18 = Color.New(0, 0, 0)
				local var_36_19 = 0

				arg_33_1.mask_.enabled = false
				var_36_18.a = var_36_19
				arg_33_1.mask_.color = var_36_18
			end

			if arg_33_1.frameCnt_ <= 1 then
				arg_33_1.dialog_:SetActive(false)
			end

			local var_36_20 = 2
			local var_36_21 = 0.475

			if var_36_20 < arg_33_1.time_ and arg_33_1.time_ <= var_36_20 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0

				arg_33_1.dialog_:SetActive(true)

				local var_36_22 = LeanTween.value(arg_33_1.dialog_, 0, 1, 0.3)

				var_36_22:setOnUpdate(LuaHelper.FloatAction(function(arg_37_0)
					arg_33_1.dialogCg_.alpha = arg_37_0
				end))
				var_36_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_33_1.dialog_)
					var_36_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_33_1.duration_ = arg_33_1.duration_ + 0.3

				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_23 = arg_33_1:FormatText(StoryNameCfg[572].name)

				arg_33_1.leftNameTxt_.text = var_36_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, true)
				arg_33_1.iconController_:SetSelectedState("hero")

				arg_33_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_24 = arg_33_1:GetWordFromCfg(317291007)
				local var_36_25 = arg_33_1:FormatText(var_36_24.content)

				arg_33_1.text_.text = var_36_25

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_26 = 19
				local var_36_27 = utf8.len(var_36_25)
				local var_36_28 = var_36_26 <= 0 and var_36_21 or var_36_21 * (var_36_27 / var_36_26)

				if var_36_28 > 0 and var_36_21 < var_36_28 then
					arg_33_1.talkMaxDuration = var_36_28
					var_36_20 = var_36_20 + 0.3

					if var_36_28 + var_36_20 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_28 + var_36_20
					end
				end

				arg_33_1.text_.text = var_36_25
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291007", "story_v_out_317291.awb") ~= 0 then
					local var_36_29 = manager.audio:GetVoiceLength("story_v_out_317291", "317291007", "story_v_out_317291.awb") / 1000

					if var_36_29 + var_36_20 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_29 + var_36_20
					end

					if var_36_24.prefab_name ~= "" and arg_33_1.actors_[var_36_24.prefab_name] ~= nil then
						local var_36_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_24.prefab_name].transform, "story_v_out_317291", "317291007", "story_v_out_317291.awb")

						arg_33_1:RecordAudio("317291007", var_36_30)
						arg_33_1:RecordAudio("317291007", var_36_30)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_317291", "317291007", "story_v_out_317291.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_317291", "317291007", "story_v_out_317291.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_31 = var_36_20 + 0.3
			local var_36_32 = math.max(var_36_21, arg_33_1.talkMaxDuration)

			if var_36_31 <= arg_33_1.time_ and arg_33_1.time_ < var_36_31 + var_36_32 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_31) / var_36_32

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_31 + var_36_32 and arg_33_1.time_ < var_36_31 + var_36_32 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play317291008 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 317291008
		arg_39_1.duration_ = 8.76599999999999

		local var_39_0 = {
			zh = 6.333,
			ja = 8.76599999999999
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
				arg_39_0:Play317291009(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 2

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				local var_42_1 = manager.ui.mainCamera.transform.localPosition
				local var_42_2 = Vector3.New(0, 0, 10) + Vector3.New(var_42_1.x, var_42_1.y, 0)
				local var_42_3 = arg_39_1.bgs_.STblack

				var_42_3.transform.localPosition = var_42_2
				var_42_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_42_4 = var_42_3:GetComponent("SpriteRenderer")

				if var_42_4 and var_42_4.sprite then
					local var_42_5 = (var_42_3.transform.localPosition - var_42_1).z
					local var_42_6 = manager.ui.mainCameraCom_
					local var_42_7 = 2 * var_42_5 * Mathf.Tan(var_42_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_42_8 = var_42_7 * var_42_6.aspect
					local var_42_9 = var_42_4.sprite.bounds.size.x
					local var_42_10 = var_42_4.sprite.bounds.size.y
					local var_42_11 = var_42_8 / var_42_9
					local var_42_12 = var_42_7 / var_42_10
					local var_42_13 = var_42_12 < var_42_11 and var_42_11 or var_42_12

					var_42_3.transform.localScale = Vector3.New(var_42_13, var_42_13, 0)
				end

				for iter_42_0, iter_42_1 in pairs(arg_39_1.bgs_) do
					if iter_42_0 ~= "STblack" then
						iter_42_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_42_14 = 0

			if var_42_14 < arg_39_1.time_ and arg_39_1.time_ <= var_42_14 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = true

				arg_39_1:SetGaussion(false)
			end

			local var_42_15 = 2

			if var_42_14 <= arg_39_1.time_ and arg_39_1.time_ < var_42_14 + var_42_15 then
				local var_42_16 = (arg_39_1.time_ - var_42_14) / var_42_15
				local var_42_17 = Color.New(0, 0, 0)

				var_42_17.a = Mathf.Lerp(0, 1, var_42_16)
				arg_39_1.mask_.color = var_42_17
			end

			if arg_39_1.time_ >= var_42_14 + var_42_15 and arg_39_1.time_ < var_42_14 + var_42_15 + arg_42_0 then
				local var_42_18 = Color.New(0, 0, 0)

				var_42_18.a = 1
				arg_39_1.mask_.color = var_42_18
			end

			local var_42_19 = 2

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1.mask_.enabled = true
				arg_39_1.mask_.raycastTarget = true

				arg_39_1:SetGaussion(false)
			end

			local var_42_20 = 2

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_20 then
				local var_42_21 = (arg_39_1.time_ - var_42_19) / var_42_20
				local var_42_22 = Color.New(0, 0, 0)

				var_42_22.a = Mathf.Lerp(1, 0, var_42_21)
				arg_39_1.mask_.color = var_42_22
			end

			if arg_39_1.time_ >= var_42_19 + var_42_20 and arg_39_1.time_ < var_42_19 + var_42_20 + arg_42_0 then
				local var_42_23 = Color.New(0, 0, 0)
				local var_42_24 = 0

				arg_39_1.mask_.enabled = false
				var_42_23.a = var_42_24
				arg_39_1.mask_.color = var_42_23
			end

			if arg_39_1.frameCnt_ <= 1 then
				arg_39_1.dialog_:SetActive(false)
			end

			local var_42_25 = 4
			local var_42_26 = 0.2

			if var_42_25 < arg_39_1.time_ and arg_39_1.time_ <= var_42_25 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				arg_39_1.dialog_:SetActive(true)

				local var_42_27 = LeanTween.value(arg_39_1.dialog_, 0, 1, 0.3)

				var_42_27:setOnUpdate(LuaHelper.FloatAction(function(arg_43_0)
					arg_39_1.dialogCg_.alpha = arg_43_0
				end))
				var_42_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_39_1.dialog_)
					var_42_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_39_1.duration_ = arg_39_1.duration_ + 0.3

				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_28 = arg_39_1:FormatText(StoryNameCfg[570].name)

				arg_39_1.leftNameTxt_.text = var_42_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_29 = arg_39_1:GetWordFromCfg(317291008)
				local var_42_30 = arg_39_1:FormatText(var_42_29.content)

				arg_39_1.text_.text = var_42_30

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_31 = 8
				local var_42_32 = utf8.len(var_42_30)
				local var_42_33 = var_42_31 <= 0 and var_42_26 or var_42_26 * (var_42_32 / var_42_31)

				if var_42_33 > 0 and var_42_26 < var_42_33 then
					arg_39_1.talkMaxDuration = var_42_33
					var_42_25 = var_42_25 + 0.3

					if var_42_33 + var_42_25 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_33 + var_42_25
					end
				end

				arg_39_1.text_.text = var_42_30
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291008", "story_v_out_317291.awb") ~= 0 then
					local var_42_34 = manager.audio:GetVoiceLength("story_v_out_317291", "317291008", "story_v_out_317291.awb") / 1000

					if var_42_34 + var_42_25 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_34 + var_42_25
					end

					if var_42_29.prefab_name ~= "" and arg_39_1.actors_[var_42_29.prefab_name] ~= nil then
						local var_42_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_29.prefab_name].transform, "story_v_out_317291", "317291008", "story_v_out_317291.awb")

						arg_39_1:RecordAudio("317291008", var_42_35)
						arg_39_1:RecordAudio("317291008", var_42_35)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_317291", "317291008", "story_v_out_317291.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_317291", "317291008", "story_v_out_317291.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_36 = var_42_25 + 0.3
			local var_42_37 = math.max(var_42_26, arg_39_1.talkMaxDuration)

			if var_42_36 <= arg_39_1.time_ and arg_39_1.time_ < var_42_36 + var_42_37 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_36) / var_42_37

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_36 + var_42_37 and arg_39_1.time_ < var_42_36 + var_42_37 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play317291009 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 317291009
		arg_45_1.duration_ = 5.766

		local var_45_0 = {
			zh = 5.766,
			ja = 2.666
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
				arg_45_0:Play317291010(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				local var_48_1 = manager.ui.mainCamera.transform.localPosition
				local var_48_2 = Vector3.New(0, 0, 10) + Vector3.New(var_48_1.x, var_48_1.y, 0)
				local var_48_3 = arg_45_1.bgs_.K11f

				var_48_3.transform.localPosition = var_48_2
				var_48_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_48_4 = var_48_3:GetComponent("SpriteRenderer")

				if var_48_4 and var_48_4.sprite then
					local var_48_5 = (var_48_3.transform.localPosition - var_48_1).z
					local var_48_6 = manager.ui.mainCameraCom_
					local var_48_7 = 2 * var_48_5 * Mathf.Tan(var_48_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_48_8 = var_48_7 * var_48_6.aspect
					local var_48_9 = var_48_4.sprite.bounds.size.x
					local var_48_10 = var_48_4.sprite.bounds.size.y
					local var_48_11 = var_48_8 / var_48_9
					local var_48_12 = var_48_7 / var_48_10
					local var_48_13 = var_48_12 < var_48_11 and var_48_11 or var_48_12

					var_48_3.transform.localScale = Vector3.New(var_48_13, var_48_13, 0)
				end

				for iter_48_0, iter_48_1 in pairs(arg_45_1.bgs_) do
					if iter_48_0 ~= "K11f" then
						iter_48_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_48_14 = 0

			if var_48_14 < arg_45_1.time_ and arg_45_1.time_ <= var_48_14 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_15 = 2

			if var_48_14 <= arg_45_1.time_ and arg_45_1.time_ < var_48_14 + var_48_15 then
				local var_48_16 = (arg_45_1.time_ - var_48_14) / var_48_15
				local var_48_17 = Color.New(0, 0, 0)

				var_48_17.a = Mathf.Lerp(1, 0, var_48_16)
				arg_45_1.mask_.color = var_48_17
			end

			if arg_45_1.time_ >= var_48_14 + var_48_15 and arg_45_1.time_ < var_48_14 + var_48_15 + arg_48_0 then
				local var_48_18 = Color.New(0, 0, 0)
				local var_48_19 = 0

				arg_45_1.mask_.enabled = false
				var_48_18.a = var_48_19
				arg_45_1.mask_.color = var_48_18
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_20 = 2
			local var_48_21 = 0.075

			if var_48_20 < arg_45_1.time_ and arg_45_1.time_ <= var_48_20 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_22 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_22:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_23 = arg_45_1:FormatText(StoryNameCfg[572].name)

				arg_45_1.leftNameTxt_.text = var_48_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, true)
				arg_45_1.iconController_:SetSelectedState("hero")

				arg_45_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_24 = arg_45_1:GetWordFromCfg(317291009)
				local var_48_25 = arg_45_1:FormatText(var_48_24.content)

				arg_45_1.text_.text = var_48_25

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_26 = 3
				local var_48_27 = utf8.len(var_48_25)
				local var_48_28 = var_48_26 <= 0 and var_48_21 or var_48_21 * (var_48_27 / var_48_26)

				if var_48_28 > 0 and var_48_21 < var_48_28 then
					arg_45_1.talkMaxDuration = var_48_28
					var_48_20 = var_48_20 + 0.3

					if var_48_28 + var_48_20 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_28 + var_48_20
					end
				end

				arg_45_1.text_.text = var_48_25
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291009", "story_v_out_317291.awb") ~= 0 then
					local var_48_29 = manager.audio:GetVoiceLength("story_v_out_317291", "317291009", "story_v_out_317291.awb") / 1000

					if var_48_29 + var_48_20 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_29 + var_48_20
					end

					if var_48_24.prefab_name ~= "" and arg_45_1.actors_[var_48_24.prefab_name] ~= nil then
						local var_48_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_24.prefab_name].transform, "story_v_out_317291", "317291009", "story_v_out_317291.awb")

						arg_45_1:RecordAudio("317291009", var_48_30)
						arg_45_1:RecordAudio("317291009", var_48_30)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_317291", "317291009", "story_v_out_317291.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_317291", "317291009", "story_v_out_317291.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_31 = var_48_20 + 0.3
			local var_48_32 = math.max(var_48_21, arg_45_1.talkMaxDuration)

			if var_48_31 <= arg_45_1.time_ and arg_45_1.time_ < var_48_31 + var_48_32 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_31) / var_48_32

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_31 + var_48_32 and arg_45_1.time_ < var_48_31 + var_48_32 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play317291010 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 317291010
		arg_51_1.duration_ = 10.233

		local var_51_0 = {
			zh = 5.6,
			ja = 10.233
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
				arg_51_0:Play317291011(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 2

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				local var_54_1 = manager.ui.mainCamera.transform.localPosition
				local var_54_2 = Vector3.New(0, 0, 10) + Vector3.New(var_54_1.x, var_54_1.y, 0)
				local var_54_3 = arg_51_1.bgs_.STblack

				var_54_3.transform.localPosition = var_54_2
				var_54_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_54_4 = var_54_3:GetComponent("SpriteRenderer")

				if var_54_4 and var_54_4.sprite then
					local var_54_5 = (var_54_3.transform.localPosition - var_54_1).z
					local var_54_6 = manager.ui.mainCameraCom_
					local var_54_7 = 2 * var_54_5 * Mathf.Tan(var_54_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_54_8 = var_54_7 * var_54_6.aspect
					local var_54_9 = var_54_4.sprite.bounds.size.x
					local var_54_10 = var_54_4.sprite.bounds.size.y
					local var_54_11 = var_54_8 / var_54_9
					local var_54_12 = var_54_7 / var_54_10
					local var_54_13 = var_54_12 < var_54_11 and var_54_11 or var_54_12

					var_54_3.transform.localScale = Vector3.New(var_54_13, var_54_13, 0)
				end

				for iter_54_0, iter_54_1 in pairs(arg_51_1.bgs_) do
					if iter_54_0 ~= "STblack" then
						iter_54_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_54_14 = 0

			if var_54_14 < arg_51_1.time_ and arg_51_1.time_ <= var_54_14 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_15 = 2

			if var_54_14 <= arg_51_1.time_ and arg_51_1.time_ < var_54_14 + var_54_15 then
				local var_54_16 = (arg_51_1.time_ - var_54_14) / var_54_15
				local var_54_17 = Color.New(0, 0, 0)

				var_54_17.a = Mathf.Lerp(0, 1, var_54_16)
				arg_51_1.mask_.color = var_54_17
			end

			if arg_51_1.time_ >= var_54_14 + var_54_15 and arg_51_1.time_ < var_54_14 + var_54_15 + arg_54_0 then
				local var_54_18 = Color.New(0, 0, 0)

				var_54_18.a = 1
				arg_51_1.mask_.color = var_54_18
			end

			local var_54_19 = 2

			if var_54_19 < arg_51_1.time_ and arg_51_1.time_ <= var_54_19 + arg_54_0 then
				arg_51_1.mask_.enabled = true
				arg_51_1.mask_.raycastTarget = true

				arg_51_1:SetGaussion(false)
			end

			local var_54_20 = 2

			if var_54_19 <= arg_51_1.time_ and arg_51_1.time_ < var_54_19 + var_54_20 then
				local var_54_21 = (arg_51_1.time_ - var_54_19) / var_54_20
				local var_54_22 = Color.New(0, 0, 0)

				var_54_22.a = Mathf.Lerp(1, 0, var_54_21)
				arg_51_1.mask_.color = var_54_22
			end

			if arg_51_1.time_ >= var_54_19 + var_54_20 and arg_51_1.time_ < var_54_19 + var_54_20 + arg_54_0 then
				local var_54_23 = Color.New(0, 0, 0)
				local var_54_24 = 0

				arg_51_1.mask_.enabled = false
				var_54_23.a = var_54_24
				arg_51_1.mask_.color = var_54_23
			end

			if arg_51_1.frameCnt_ <= 1 then
				arg_51_1.dialog_:SetActive(false)
			end

			local var_54_25 = 4
			local var_54_26 = 0.1

			if var_54_25 < arg_51_1.time_ and arg_51_1.time_ <= var_54_25 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0

				arg_51_1.dialog_:SetActive(true)

				local var_54_27 = LeanTween.value(arg_51_1.dialog_, 0, 1, 0.3)

				var_54_27:setOnUpdate(LuaHelper.FloatAction(function(arg_55_0)
					arg_51_1.dialogCg_.alpha = arg_55_0
				end))
				var_54_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_51_1.dialog_)
					var_54_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_51_1.duration_ = arg_51_1.duration_ + 0.3

				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_28 = arg_51_1:FormatText(StoryNameCfg[570].name)

				arg_51_1.leftNameTxt_.text = var_54_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_29 = arg_51_1:GetWordFromCfg(317291010)
				local var_54_30 = arg_51_1:FormatText(var_54_29.content)

				arg_51_1.text_.text = var_54_30

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_31 = 4
				local var_54_32 = utf8.len(var_54_30)
				local var_54_33 = var_54_31 <= 0 and var_54_26 or var_54_26 * (var_54_32 / var_54_31)

				if var_54_33 > 0 and var_54_26 < var_54_33 then
					arg_51_1.talkMaxDuration = var_54_33
					var_54_25 = var_54_25 + 0.3

					if var_54_33 + var_54_25 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_33 + var_54_25
					end
				end

				arg_51_1.text_.text = var_54_30
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291010", "story_v_out_317291.awb") ~= 0 then
					local var_54_34 = manager.audio:GetVoiceLength("story_v_out_317291", "317291010", "story_v_out_317291.awb") / 1000

					if var_54_34 + var_54_25 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_34 + var_54_25
					end

					if var_54_29.prefab_name ~= "" and arg_51_1.actors_[var_54_29.prefab_name] ~= nil then
						local var_54_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_29.prefab_name].transform, "story_v_out_317291", "317291010", "story_v_out_317291.awb")

						arg_51_1:RecordAudio("317291010", var_54_35)
						arg_51_1:RecordAudio("317291010", var_54_35)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_317291", "317291010", "story_v_out_317291.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_317291", "317291010", "story_v_out_317291.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_36 = var_54_25 + 0.3
			local var_54_37 = math.max(var_54_26, arg_51_1.talkMaxDuration)

			if var_54_36 <= arg_51_1.time_ and arg_51_1.time_ < var_54_36 + var_54_37 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_36) / var_54_37

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_36 + var_54_37 and arg_51_1.time_ < var_54_36 + var_54_37 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play317291011 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 317291011
		arg_57_1.duration_ = 4.4

		local var_57_0 = {
			zh = 4.4,
			ja = 3.533
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
				arg_57_0:Play317291012(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				local var_60_1 = manager.ui.mainCamera.transform.localPosition
				local var_60_2 = Vector3.New(0, 0, 10) + Vector3.New(var_60_1.x, var_60_1.y, 0)
				local var_60_3 = arg_57_1.bgs_.K11f

				var_60_3.transform.localPosition = var_60_2
				var_60_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_60_4 = var_60_3:GetComponent("SpriteRenderer")

				if var_60_4 and var_60_4.sprite then
					local var_60_5 = (var_60_3.transform.localPosition - var_60_1).z
					local var_60_6 = manager.ui.mainCameraCom_
					local var_60_7 = 2 * var_60_5 * Mathf.Tan(var_60_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_60_8 = var_60_7 * var_60_6.aspect
					local var_60_9 = var_60_4.sprite.bounds.size.x
					local var_60_10 = var_60_4.sprite.bounds.size.y
					local var_60_11 = var_60_8 / var_60_9
					local var_60_12 = var_60_7 / var_60_10
					local var_60_13 = var_60_12 < var_60_11 and var_60_11 or var_60_12

					var_60_3.transform.localScale = Vector3.New(var_60_13, var_60_13, 0)
				end

				for iter_60_0, iter_60_1 in pairs(arg_57_1.bgs_) do
					if iter_60_0 ~= "K11f" then
						iter_60_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_60_14 = 0

			if var_60_14 < arg_57_1.time_ and arg_57_1.time_ <= var_60_14 + arg_60_0 then
				arg_57_1.mask_.enabled = true
				arg_57_1.mask_.raycastTarget = true

				arg_57_1:SetGaussion(false)
			end

			local var_60_15 = 2

			if var_60_14 <= arg_57_1.time_ and arg_57_1.time_ < var_60_14 + var_60_15 then
				local var_60_16 = (arg_57_1.time_ - var_60_14) / var_60_15
				local var_60_17 = Color.New(0, 0, 0)

				var_60_17.a = Mathf.Lerp(1, 0, var_60_16)
				arg_57_1.mask_.color = var_60_17
			end

			if arg_57_1.time_ >= var_60_14 + var_60_15 and arg_57_1.time_ < var_60_14 + var_60_15 + arg_60_0 then
				local var_60_18 = Color.New(0, 0, 0)
				local var_60_19 = 0

				arg_57_1.mask_.enabled = false
				var_60_18.a = var_60_19
				arg_57_1.mask_.color = var_60_18
			end

			if arg_57_1.frameCnt_ <= 1 then
				arg_57_1.dialog_:SetActive(false)
			end

			local var_60_20 = 2
			local var_60_21 = 0.075

			if var_60_20 < arg_57_1.time_ and arg_57_1.time_ <= var_60_20 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0

				arg_57_1.dialog_:SetActive(true)

				local var_60_22 = LeanTween.value(arg_57_1.dialog_, 0, 1, 0.3)

				var_60_22:setOnUpdate(LuaHelper.FloatAction(function(arg_61_0)
					arg_57_1.dialogCg_.alpha = arg_61_0
				end))
				var_60_22:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_57_1.dialog_)
					var_60_22:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_57_1.duration_ = arg_57_1.duration_ + 0.3

				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_23 = arg_57_1:FormatText(StoryNameCfg[572].name)

				arg_57_1.leftNameTxt_.text = var_60_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, true)
				arg_57_1.iconController_:SetSelectedState("hero")

				arg_57_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2079")

				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_24 = arg_57_1:GetWordFromCfg(317291011)
				local var_60_25 = arg_57_1:FormatText(var_60_24.content)

				arg_57_1.text_.text = var_60_25

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_26 = 3
				local var_60_27 = utf8.len(var_60_25)
				local var_60_28 = var_60_26 <= 0 and var_60_21 or var_60_21 * (var_60_27 / var_60_26)

				if var_60_28 > 0 and var_60_21 < var_60_28 then
					arg_57_1.talkMaxDuration = var_60_28
					var_60_20 = var_60_20 + 0.3

					if var_60_28 + var_60_20 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_28 + var_60_20
					end
				end

				arg_57_1.text_.text = var_60_25
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291011", "story_v_out_317291.awb") ~= 0 then
					local var_60_29 = manager.audio:GetVoiceLength("story_v_out_317291", "317291011", "story_v_out_317291.awb") / 1000

					if var_60_29 + var_60_20 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_29 + var_60_20
					end

					if var_60_24.prefab_name ~= "" and arg_57_1.actors_[var_60_24.prefab_name] ~= nil then
						local var_60_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_24.prefab_name].transform, "story_v_out_317291", "317291011", "story_v_out_317291.awb")

						arg_57_1:RecordAudio("317291011", var_60_30)
						arg_57_1:RecordAudio("317291011", var_60_30)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_317291", "317291011", "story_v_out_317291.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_317291", "317291011", "story_v_out_317291.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_31 = var_60_20 + 0.3
			local var_60_32 = math.max(var_60_21, arg_57_1.talkMaxDuration)

			if var_60_31 <= arg_57_1.time_ and arg_57_1.time_ < var_60_31 + var_60_32 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_31) / var_60_32

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_31 + var_60_32 and arg_57_1.time_ < var_60_31 + var_60_32 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play317291012 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 317291012
		arg_63_1.duration_ = 5.266

		local var_63_0 = {
			zh = 2.233,
			ja = 5.266
		}
		local var_63_1 = manager.audio:GetLocalizationFlag()

		if var_63_0[var_63_1] ~= nil then
			arg_63_1.duration_ = var_63_0[var_63_1]
		end

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play317291013(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.175

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[570].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(317291012)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 7
				local var_66_6 = utf8.len(var_66_4)
				local var_66_7 = var_66_5 <= 0 and var_66_1 or var_66_1 * (var_66_6 / var_66_5)

				if var_66_7 > 0 and var_66_1 < var_66_7 then
					arg_63_1.talkMaxDuration = var_66_7

					if var_66_7 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_7 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_4
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291012", "story_v_out_317291.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_317291", "317291012", "story_v_out_317291.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_317291", "317291012", "story_v_out_317291.awb")

						arg_63_1:RecordAudio("317291012", var_66_9)
						arg_63_1:RecordAudio("317291012", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_317291", "317291012", "story_v_out_317291.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_317291", "317291012", "story_v_out_317291.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_10 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_10 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_10

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_10 and arg_63_1.time_ < var_66_0 + var_66_10 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play317291013 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 317291013
		arg_67_1.duration_ = 5

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play317291014(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 1.575

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

				local var_70_2 = arg_67_1:GetWordFromCfg(317291013)
				local var_70_3 = arg_67_1:FormatText(var_70_2.content)

				arg_67_1.text_.text = var_70_3

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_4 = 63
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
	Play317291014 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 317291014
		arg_71_1.duration_ = 15.8

		local var_71_0 = {
			zh = 12.2,
			ja = 15.8
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
				arg_71_0:Play317291015(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.975

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[570].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(317291014)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 39
				local var_74_6 = utf8.len(var_74_4)
				local var_74_7 = var_74_5 <= 0 and var_74_1 or var_74_1 * (var_74_6 / var_74_5)

				if var_74_7 > 0 and var_74_1 < var_74_7 then
					arg_71_1.talkMaxDuration = var_74_7

					if var_74_7 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_7 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_4
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291014", "story_v_out_317291.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_317291", "317291014", "story_v_out_317291.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_317291", "317291014", "story_v_out_317291.awb")

						arg_71_1:RecordAudio("317291014", var_74_9)
						arg_71_1:RecordAudio("317291014", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_317291", "317291014", "story_v_out_317291.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_317291", "317291014", "story_v_out_317291.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_10 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_10 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_10

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_10 and arg_71_1.time_ < var_74_0 + var_74_10 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play317291015 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 317291015
		arg_75_1.duration_ = 10.833

		local var_75_0 = {
			zh = 10.833,
			ja = 9.266
		}
		local var_75_1 = manager.audio:GetLocalizationFlag()

		if var_75_0[var_75_1] ~= nil then
			arg_75_1.duration_ = var_75_0[var_75_1]
		end

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play317291016(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.775

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[570].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, true)
				arg_75_1.iconController_:SetSelectedState("hero")

				arg_75_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(317291015)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 31
				local var_78_6 = utf8.len(var_78_4)
				local var_78_7 = var_78_5 <= 0 and var_78_1 or var_78_1 * (var_78_6 / var_78_5)

				if var_78_7 > 0 and var_78_1 < var_78_7 then
					arg_75_1.talkMaxDuration = var_78_7

					if var_78_7 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_7 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_4
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291015", "story_v_out_317291.awb") ~= 0 then
					local var_78_8 = manager.audio:GetVoiceLength("story_v_out_317291", "317291015", "story_v_out_317291.awb") / 1000

					if var_78_8 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_0
					end

					if var_78_3.prefab_name ~= "" and arg_75_1.actors_[var_78_3.prefab_name] ~= nil then
						local var_78_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_3.prefab_name].transform, "story_v_out_317291", "317291015", "story_v_out_317291.awb")

						arg_75_1:RecordAudio("317291015", var_78_9)
						arg_75_1:RecordAudio("317291015", var_78_9)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_317291", "317291015", "story_v_out_317291.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_317291", "317291015", "story_v_out_317291.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_10 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_10 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_10

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_10 and arg_75_1.time_ < var_78_0 + var_78_10 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play317291016 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 317291016
		arg_79_1.duration_ = 13.1

		local var_79_0 = {
			zh = 10.933,
			ja = 13.1
		}
		local var_79_1 = manager.audio:GetLocalizationFlag()

		if var_79_0[var_79_1] ~= nil then
			arg_79_1.duration_ = var_79_0[var_79_1]
		end

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play317291017(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.75

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[570].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, true)
				arg_79_1.iconController_:SetSelectedState("hero")

				arg_79_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(317291016)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291016", "story_v_out_317291.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_317291", "317291016", "story_v_out_317291.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_317291", "317291016", "story_v_out_317291.awb")

						arg_79_1:RecordAudio("317291016", var_82_9)
						arg_79_1:RecordAudio("317291016", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_317291", "317291016", "story_v_out_317291.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_317291", "317291016", "story_v_out_317291.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_10 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_10 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_10

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_10 and arg_79_1.time_ < var_82_0 + var_82_10 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play317291017 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 317291017
		arg_83_1.duration_ = 15.4

		local var_83_0 = {
			zh = 11.166,
			ja = 15.4
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
				arg_83_0:Play317291018(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.775

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[570].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(317291017)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 31
				local var_86_6 = utf8.len(var_86_4)
				local var_86_7 = var_86_5 <= 0 and var_86_1 or var_86_1 * (var_86_6 / var_86_5)

				if var_86_7 > 0 and var_86_1 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_4
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291017", "story_v_out_317291.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_317291", "317291017", "story_v_out_317291.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_317291", "317291017", "story_v_out_317291.awb")

						arg_83_1:RecordAudio("317291017", var_86_9)
						arg_83_1:RecordAudio("317291017", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_317291", "317291017", "story_v_out_317291.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_317291", "317291017", "story_v_out_317291.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_10 and arg_83_1.time_ < var_86_0 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play317291018 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 317291018
		arg_87_1.duration_ = 5.3

		local var_87_0 = {
			zh = 5.3,
			ja = 4.466
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
				arg_87_0:Play317291019(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.25

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[570].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, true)
				arg_87_1.iconController_:SetSelectedState("hero")

				arg_87_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2094")

				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(317291018)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291018", "story_v_out_317291.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_317291", "317291018", "story_v_out_317291.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_317291", "317291018", "story_v_out_317291.awb")

						arg_87_1:RecordAudio("317291018", var_90_9)
						arg_87_1:RecordAudio("317291018", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_317291", "317291018", "story_v_out_317291.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_317291", "317291018", "story_v_out_317291.awb")
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
	Play317291019 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 317291019
		arg_91_1.duration_ = 9

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play317291020(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 2

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				local var_94_1 = manager.ui.mainCamera.transform.localPosition
				local var_94_2 = Vector3.New(0, 0, 10) + Vector3.New(var_94_1.x, var_94_1.y, 0)
				local var_94_3 = arg_91_1.bgs_.STblack

				var_94_3.transform.localPosition = var_94_2
				var_94_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_94_4 = var_94_3:GetComponent("SpriteRenderer")

				if var_94_4 and var_94_4.sprite then
					local var_94_5 = (var_94_3.transform.localPosition - var_94_1).z
					local var_94_6 = manager.ui.mainCameraCom_
					local var_94_7 = 2 * var_94_5 * Mathf.Tan(var_94_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_94_8 = var_94_7 * var_94_6.aspect
					local var_94_9 = var_94_4.sprite.bounds.size.x
					local var_94_10 = var_94_4.sprite.bounds.size.y
					local var_94_11 = var_94_8 / var_94_9
					local var_94_12 = var_94_7 / var_94_10
					local var_94_13 = var_94_12 < var_94_11 and var_94_11 or var_94_12

					var_94_3.transform.localScale = Vector3.New(var_94_13, var_94_13, 0)
				end

				for iter_94_0, iter_94_1 in pairs(arg_91_1.bgs_) do
					if iter_94_0 ~= "STblack" then
						iter_94_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1.mask_.enabled = true
				arg_91_1.mask_.raycastTarget = true

				arg_91_1:SetGaussion(false)
			end

			local var_94_15 = 2

			if var_94_14 <= arg_91_1.time_ and arg_91_1.time_ < var_94_14 + var_94_15 then
				local var_94_16 = (arg_91_1.time_ - var_94_14) / var_94_15
				local var_94_17 = Color.New(0, 0, 0)

				var_94_17.a = Mathf.Lerp(0, 1, var_94_16)
				arg_91_1.mask_.color = var_94_17
			end

			if arg_91_1.time_ >= var_94_14 + var_94_15 and arg_91_1.time_ < var_94_14 + var_94_15 + arg_94_0 then
				local var_94_18 = Color.New(0, 0, 0)

				var_94_18.a = 1
				arg_91_1.mask_.color = var_94_18
			end

			local var_94_19 = 2

			if var_94_19 < arg_91_1.time_ and arg_91_1.time_ <= var_94_19 + arg_94_0 then
				arg_91_1.mask_.enabled = true
				arg_91_1.mask_.raycastTarget = true

				arg_91_1:SetGaussion(false)
			end

			local var_94_20 = 2

			if var_94_19 <= arg_91_1.time_ and arg_91_1.time_ < var_94_19 + var_94_20 then
				local var_94_21 = (arg_91_1.time_ - var_94_19) / var_94_20
				local var_94_22 = Color.New(0, 0, 0)

				var_94_22.a = Mathf.Lerp(1, 0, var_94_21)
				arg_91_1.mask_.color = var_94_22
			end

			if arg_91_1.time_ >= var_94_19 + var_94_20 and arg_91_1.time_ < var_94_19 + var_94_20 + arg_94_0 then
				local var_94_23 = Color.New(0, 0, 0)
				local var_94_24 = 0

				arg_91_1.mask_.enabled = false
				var_94_23.a = var_94_24
				arg_91_1.mask_.color = var_94_23
			end

			if arg_91_1.frameCnt_ <= 1 then
				arg_91_1.dialog_:SetActive(false)
			end

			local var_94_25 = 4
			local var_94_26 = 0.775

			if var_94_25 < arg_91_1.time_ and arg_91_1.time_ <= var_94_25 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0

				arg_91_1.dialog_:SetActive(true)

				local var_94_27 = LeanTween.value(arg_91_1.dialog_, 0, 1, 0.3)

				var_94_27:setOnUpdate(LuaHelper.FloatAction(function(arg_95_0)
					arg_91_1.dialogCg_.alpha = arg_95_0
				end))
				var_94_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_91_1.dialog_)
					var_94_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_91_1.duration_ = arg_91_1.duration_ + 0.3

				SetActive(arg_91_1.leftNameGo_, false)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_28 = arg_91_1:GetWordFromCfg(317291019)
				local var_94_29 = arg_91_1:FormatText(var_94_28.content)

				arg_91_1.text_.text = var_94_29

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_30 = 31
				local var_94_31 = utf8.len(var_94_29)
				local var_94_32 = var_94_30 <= 0 and var_94_26 or var_94_26 * (var_94_31 / var_94_30)

				if var_94_32 > 0 and var_94_26 < var_94_32 then
					arg_91_1.talkMaxDuration = var_94_32
					var_94_25 = var_94_25 + 0.3

					if var_94_32 + var_94_25 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_32 + var_94_25
					end
				end

				arg_91_1.text_.text = var_94_29
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_33 = var_94_25 + 0.3
			local var_94_34 = math.max(var_94_26, arg_91_1.talkMaxDuration)

			if var_94_33 <= arg_91_1.time_ and arg_91_1.time_ < var_94_33 + var_94_34 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_33) / var_94_34

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_33 + var_94_34 and arg_91_1.time_ < var_94_33 + var_94_34 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play317291020 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 317291020
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play317291021(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.6

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				local var_100_2 = "play"
				local var_100_3 = "effect"

				arg_97_1:AudioAction(var_100_2, var_100_3, "se_story_126_01", "se_story_126_01_noise", "")
			end

			local var_100_4 = 0
			local var_100_5 = 0.1

			if var_100_4 < arg_97_1.time_ and arg_97_1.time_ <= var_100_4 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_6 = arg_97_1:FormatText(StoryNameCfg[68].name)

				arg_97_1.leftNameTxt_.text = var_100_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, true)
				arg_97_1.iconController_:SetSelectedState("hero")

				arg_97_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2096")

				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_7 = arg_97_1:GetWordFromCfg(317291020)
				local var_100_8 = arg_97_1:FormatText(var_100_7.content)

				arg_97_1.text_.text = var_100_8

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_9 = 4
				local var_100_10 = utf8.len(var_100_8)
				local var_100_11 = var_100_9 <= 0 and var_100_5 or var_100_5 * (var_100_10 / var_100_9)

				if var_100_11 > 0 and var_100_5 < var_100_11 then
					arg_97_1.talkMaxDuration = var_100_11

					if var_100_11 + var_100_4 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_11 + var_100_4
					end
				end

				arg_97_1.text_.text = var_100_8
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_12 = math.max(var_100_5, arg_97_1.talkMaxDuration)

			if var_100_4 <= arg_97_1.time_ and arg_97_1.time_ < var_100_4 + var_100_12 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_4) / var_100_12

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_4 + var_100_12 and arg_97_1.time_ < var_100_4 + var_100_12 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play317291021 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 317291021
		arg_101_1.duration_ = 4.833

		local var_101_0 = {
			zh = 3.866,
			ja = 4.833
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
				arg_101_0:Play317291022(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 0.55

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[73].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, true)
				arg_101_1.iconController_:SetSelectedState("hero")

				arg_101_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1093")

				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(317291021)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 22
				local var_104_6 = utf8.len(var_104_4)
				local var_104_7 = var_104_5 <= 0 and var_104_1 or var_104_1 * (var_104_6 / var_104_5)

				if var_104_7 > 0 and var_104_1 < var_104_7 then
					arg_101_1.talkMaxDuration = var_104_7

					if var_104_7 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_7 + var_104_0
					end
				end

				arg_101_1.text_.text = var_104_4
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291021", "story_v_out_317291.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_out_317291", "317291021", "story_v_out_317291.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_out_317291", "317291021", "story_v_out_317291.awb")

						arg_101_1:RecordAudio("317291021", var_104_9)
						arg_101_1:RecordAudio("317291021", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_317291", "317291021", "story_v_out_317291.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_317291", "317291021", "story_v_out_317291.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_10 = math.max(var_104_1, arg_101_1.talkMaxDuration)

			if var_104_0 <= arg_101_1.time_ and arg_101_1.time_ < var_104_0 + var_104_10 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_0) / var_104_10

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_0 + var_104_10 and arg_101_1.time_ < var_104_0 + var_104_10 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play317291022 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 317291022
		arg_105_1.duration_ = 4.7

		local var_105_0 = {
			zh = 4.7,
			ja = 4.4
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
			arg_105_1.auto_ = false
		end

		function arg_105_1.playNext_(arg_107_0)
			arg_105_1.onStoryFinished_()
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.625

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[84].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, true)
				arg_105_1.iconController_:SetSelectedState("hero")

				arg_105_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1199")

				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(317291022)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 25
				local var_108_6 = utf8.len(var_108_4)
				local var_108_7 = var_108_5 <= 0 and var_108_1 or var_108_1 * (var_108_6 / var_108_5)

				if var_108_7 > 0 and var_108_1 < var_108_7 then
					arg_105_1.talkMaxDuration = var_108_7

					if var_108_7 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_7 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_4
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_317291", "317291022", "story_v_out_317291.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_317291", "317291022", "story_v_out_317291.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_317291", "317291022", "story_v_out_317291.awb")

						arg_105_1:RecordAudio("317291022", var_108_9)
						arg_105_1:RecordAudio("317291022", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_317291", "317291022", "story_v_out_317291.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_317291", "317291022", "story_v_out_317291.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_10 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_10 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_10

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_10 and arg_105_1.time_ < var_108_0 + var_108_10 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K11f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack"
	},
	voices = {
		"story_v_out_317291.awb"
	}
}
