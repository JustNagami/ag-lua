return {
	Play110141001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 110141001
		arg_1_1.duration_ = 6.5

		local var_1_0 = {
			ja = 5.7,
			ko = 6.5,
			zh = 5.4,
			en = 3.766
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
				arg_1_0:Play110141002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 0
			local var_4_1 = 0.6

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_2 = "play"
				local var_4_3 = "music"

				arg_1_1:AudioAction(var_4_2, var_4_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_4 = 0.738461699336767
			local var_4_5 = 1

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				local var_4_6 = "play"
				local var_4_7 = "music"

				arg_1_1:AudioAction(var_4_6, var_4_7, "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui.awb")
			end

			local var_4_8 = 0
			local var_4_9 = 0.575

			if var_4_8 < arg_1_1.time_ and arg_1_1.time_ <= var_4_8 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_10 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_10:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_10:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_10:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_11 = arg_1_1:FormatText(StoryNameCfg[37].name)

				arg_1_1.leftNameTxt_.text = var_4_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_12 = arg_1_1:GetWordFromCfg(110141001)
				local var_4_13 = arg_1_1:FormatText(var_4_12.content)

				arg_1_1.text_.text = var_4_13

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_14 = 22
				local var_4_15 = utf8.len(var_4_13)
				local var_4_16 = var_4_14 <= 0 and var_4_9 or var_4_9 * (var_4_15 / var_4_14)

				if var_4_16 > 0 and var_4_9 < var_4_16 then
					arg_1_1.talkMaxDuration = var_4_16
					var_4_8 = var_4_8 + 0.3

					if var_4_16 + var_4_8 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_16 + var_4_8
					end
				end

				arg_1_1.text_.text = var_4_13
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141001", "story_v_out_110141.awb") ~= 0 then
					local var_4_17 = manager.audio:GetVoiceLength("story_v_out_110141", "110141001", "story_v_out_110141.awb") / 1000

					if var_4_17 + var_4_8 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_17 + var_4_8
					end

					if var_4_12.prefab_name ~= "" and arg_1_1.actors_[var_4_12.prefab_name] ~= nil then
						local var_4_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_12.prefab_name].transform, "story_v_out_110141", "110141001", "story_v_out_110141.awb")

						arg_1_1:RecordAudio("110141001", var_4_18)
						arg_1_1:RecordAudio("110141001", var_4_18)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_110141", "110141001", "story_v_out_110141.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_110141", "110141001", "story_v_out_110141.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_19 = var_4_8 + 0.3
			local var_4_20 = math.max(var_4_9, arg_1_1.talkMaxDuration)

			if var_4_19 <= arg_1_1.time_ and arg_1_1.time_ < var_4_19 + var_4_20 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_19) / var_4_20

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_19 + var_4_20 and arg_1_1.time_ < var_4_19 + var_4_20 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play110141002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 110141002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play110141003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.95

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[7].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(110141002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 38
				local var_10_6 = utf8.len(var_10_4)
				local var_10_7 = var_10_5 <= 0 and var_10_1 or var_10_1 * (var_10_6 / var_10_5)

				if var_10_7 > 0 and var_10_1 < var_10_7 then
					arg_7_1.talkMaxDuration = var_10_7

					if var_10_7 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_7 + var_10_0
					end
				end

				arg_7_1.text_.text = var_10_4
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_8 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_8 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_8

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_8 and arg_7_1.time_ < var_10_0 + var_10_8 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play110141003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 110141003
		arg_11_1.duration_ = 7.333

		local var_11_0 = {
			ja = 3.466,
			ko = 6.7,
			zh = 7.333,
			en = 7.3
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
				arg_11_0:Play110141004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = "OS0102a"

			if arg_11_1.bgs_[var_14_0] == nil then
				local var_14_1 = Object.Instantiate(arg_11_1.paintGo_)

				var_14_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_14_0)
				var_14_1.name = var_14_0
				var_14_1.transform.parent = arg_11_1.stage_.transform
				var_14_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_11_1.bgs_[var_14_0] = var_14_1
			end

			local var_14_2 = 0

			if var_14_2 < arg_11_1.time_ and arg_11_1.time_ <= var_14_2 + arg_14_0 then
				local var_14_3 = manager.ui.mainCamera.transform.localPosition
				local var_14_4 = Vector3.New(0, 0, 10) + Vector3.New(var_14_3.x, var_14_3.y, 0)
				local var_14_5 = arg_11_1.bgs_.OS0102a

				var_14_5.transform.localPosition = var_14_4
				var_14_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_14_6 = var_14_5:GetComponent("SpriteRenderer")

				if var_14_6 and var_14_6.sprite then
					local var_14_7 = (var_14_5.transform.localPosition - var_14_3).z
					local var_14_8 = manager.ui.mainCameraCom_
					local var_14_9 = 2 * var_14_7 * Mathf.Tan(var_14_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_14_10 = var_14_9 * var_14_8.aspect
					local var_14_11 = var_14_6.sprite.bounds.size.x
					local var_14_12 = var_14_6.sprite.bounds.size.y
					local var_14_13 = var_14_10 / var_14_11
					local var_14_14 = var_14_9 / var_14_12
					local var_14_15 = var_14_14 < var_14_13 and var_14_13 or var_14_14

					var_14_5.transform.localScale = Vector3.New(var_14_15, var_14_15, 0)
				end

				for iter_14_0, iter_14_1 in pairs(arg_11_1.bgs_) do
					if iter_14_0 ~= "OS0102a" then
						iter_14_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_14_16 = arg_11_1.bgs_.OS0102a
			local var_14_17 = 0

			if var_14_17 < arg_11_1.time_ and arg_11_1.time_ <= var_14_17 + arg_14_0 then
				local var_14_18 = var_14_16:GetComponent("SpriteRenderer")

				if var_14_18 then
					var_14_18.material = arg_11_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_14_19 = var_14_18.material
					local var_14_20 = var_14_19:GetColor("_Color")

					arg_11_1.var_.alphaOldValueOS0102a = var_14_20.a
					arg_11_1.var_.alphaMatValueOS0102a = var_14_19
				end

				arg_11_1.var_.alphaOldValueOS0102a = 0
			end

			local var_14_21 = 1.5

			if var_14_17 <= arg_11_1.time_ and arg_11_1.time_ < var_14_17 + var_14_21 then
				local var_14_22 = (arg_11_1.time_ - var_14_17) / var_14_21
				local var_14_23 = Mathf.Lerp(arg_11_1.var_.alphaOldValueOS0102a, 1, var_14_22)

				if arg_11_1.var_.alphaMatValueOS0102a then
					local var_14_24 = arg_11_1.var_.alphaMatValueOS0102a
					local var_14_25 = var_14_24:GetColor("_Color")

					var_14_25.a = var_14_23

					var_14_24:SetColor("_Color", var_14_25)
				end
			end

			if arg_11_1.time_ >= var_14_17 + var_14_21 and arg_11_1.time_ < var_14_17 + var_14_21 + arg_14_0 and arg_11_1.var_.alphaMatValueOS0102a then
				local var_14_26 = arg_11_1.var_.alphaMatValueOS0102a
				local var_14_27 = var_14_26:GetColor("_Color")

				var_14_27.a = 1

				var_14_26:SetColor("_Color", var_14_27)
			end

			local var_14_28 = 0

			if var_14_28 < arg_11_1.time_ and arg_11_1.time_ <= var_14_28 + arg_14_0 then
				arg_11_1.allBtn_.enabled = false
			end

			local var_14_29 = 2

			if arg_11_1.time_ >= var_14_28 + var_14_29 and arg_11_1.time_ < var_14_28 + var_14_29 + arg_14_0 then
				arg_11_1.allBtn_.enabled = true
			end

			if arg_11_1.frameCnt_ <= 1 then
				arg_11_1.dialog_:SetActive(false)
			end

			local var_14_30 = 2
			local var_14_31 = 0.35

			if var_14_30 < arg_11_1.time_ and arg_11_1.time_ <= var_14_30 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0

				arg_11_1.dialog_:SetActive(true)

				local var_14_32 = LeanTween.value(arg_11_1.dialog_, 0, 1, 0.3)

				var_14_32:setOnUpdate(LuaHelper.FloatAction(function(arg_15_0)
					arg_11_1.dialogCg_.alpha = arg_15_0
				end))
				var_14_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_11_1.dialog_)
					var_14_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_11_1.duration_ = arg_11_1.duration_ + 0.3

				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_33 = arg_11_1:FormatText(StoryNameCfg[37].name)

				arg_11_1.leftNameTxt_.text = var_14_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_34 = arg_11_1:GetWordFromCfg(110141003)
				local var_14_35 = arg_11_1:FormatText(var_14_34.content)

				arg_11_1.text_.text = var_14_35

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_36 = 14
				local var_14_37 = utf8.len(var_14_35)
				local var_14_38 = var_14_36 <= 0 and var_14_31 or var_14_31 * (var_14_37 / var_14_36)

				if var_14_38 > 0 and var_14_31 < var_14_38 then
					arg_11_1.talkMaxDuration = var_14_38
					var_14_30 = var_14_30 + 0.3

					if var_14_38 + var_14_30 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_38 + var_14_30
					end
				end

				arg_11_1.text_.text = var_14_35
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141003", "story_v_out_110141.awb") ~= 0 then
					local var_14_39 = manager.audio:GetVoiceLength("story_v_out_110141", "110141003", "story_v_out_110141.awb") / 1000

					if var_14_39 + var_14_30 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_39 + var_14_30
					end

					if var_14_34.prefab_name ~= "" and arg_11_1.actors_[var_14_34.prefab_name] ~= nil then
						local var_14_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_34.prefab_name].transform, "story_v_out_110141", "110141003", "story_v_out_110141.awb")

						arg_11_1:RecordAudio("110141003", var_14_40)
						arg_11_1:RecordAudio("110141003", var_14_40)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_110141", "110141003", "story_v_out_110141.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_110141", "110141003", "story_v_out_110141.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_41 = var_14_30 + 0.3
			local var_14_42 = math.max(var_14_31, arg_11_1.talkMaxDuration)

			if var_14_41 <= arg_11_1.time_ and arg_11_1.time_ < var_14_41 + var_14_42 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_41) / var_14_42

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_41 + var_14_42 and arg_11_1.time_ < var_14_41 + var_14_42 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play110141004 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 110141004
		arg_17_1.duration_ = 6.6

		local var_17_0 = {
			ja = 6.6,
			ko = 4.433,
			zh = 3.133,
			en = 2.133
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
				arg_17_0:Play110141005(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = 0
			local var_20_1 = 0.325

			if var_20_0 < arg_17_1.time_ and arg_17_1.time_ <= var_20_0 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0
				arg_17_1.dialogCg_.alpha = 1

				arg_17_1.dialog_:SetActive(true)
				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_2 = arg_17_1:FormatText(StoryNameCfg[37].name)

				arg_17_1.leftNameTxt_.text = var_20_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_3 = arg_17_1:GetWordFromCfg(110141004)
				local var_20_4 = arg_17_1:FormatText(var_20_3.content)

				arg_17_1.text_.text = var_20_4

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141004", "story_v_out_110141.awb") ~= 0 then
					local var_20_8 = manager.audio:GetVoiceLength("story_v_out_110141", "110141004", "story_v_out_110141.awb") / 1000

					if var_20_8 + var_20_0 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_8 + var_20_0
					end

					if var_20_3.prefab_name ~= "" and arg_17_1.actors_[var_20_3.prefab_name] ~= nil then
						local var_20_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_17_1.actors_[var_20_3.prefab_name].transform, "story_v_out_110141", "110141004", "story_v_out_110141.awb")

						arg_17_1:RecordAudio("110141004", var_20_9)
						arg_17_1:RecordAudio("110141004", var_20_9)
					else
						arg_17_1:AudioAction("play", "voice", "story_v_out_110141", "110141004", "story_v_out_110141.awb")
					end

					arg_17_1:RecordHistoryTalkVoice("story_v_out_110141", "110141004", "story_v_out_110141.awb")
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
	Play110141005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 110141005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play110141006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = manager.ui.mainCamera.transform
			local var_24_1 = 0

			if var_24_1 < arg_21_1.time_ and arg_21_1.time_ <= var_24_1 + arg_24_0 then
				arg_21_1.var_.shakeOldPos = var_24_0.localPosition
			end

			local var_24_2 = 0.6

			if var_24_1 <= arg_21_1.time_ and arg_21_1.time_ < var_24_1 + var_24_2 then
				local var_24_3 = (arg_21_1.time_ - var_24_1) / 0.066
				local var_24_4, var_24_5 = math.modf(var_24_3)

				var_24_0.localPosition = Vector3.New(var_24_5 * 0.13, var_24_5 * 0.13, var_24_5 * 0.13) + arg_21_1.var_.shakeOldPos
			end

			if arg_21_1.time_ >= var_24_1 + var_24_2 and arg_21_1.time_ < var_24_1 + var_24_2 + arg_24_0 then
				var_24_0.localPosition = arg_21_1.var_.shakeOldPos
			end

			local var_24_6 = 0
			local var_24_7 = 0.2

			if var_24_6 < arg_21_1.time_ and arg_21_1.time_ <= var_24_6 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, false)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_8 = arg_21_1:GetWordFromCfg(110141005)
				local var_24_9 = arg_21_1:FormatText(var_24_8.content)

				arg_21_1.text_.text = var_24_9

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_10 = 8
				local var_24_11 = utf8.len(var_24_9)
				local var_24_12 = var_24_10 <= 0 and var_24_7 or var_24_7 * (var_24_11 / var_24_10)

				if var_24_12 > 0 and var_24_7 < var_24_12 then
					arg_21_1.talkMaxDuration = var_24_12

					if var_24_12 + var_24_6 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_12 + var_24_6
					end
				end

				arg_21_1.text_.text = var_24_9
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)
				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_13 = math.max(var_24_7, arg_21_1.talkMaxDuration)

			if var_24_6 <= arg_21_1.time_ and arg_21_1.time_ < var_24_6 + var_24_13 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_6) / var_24_13

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_6 + var_24_13 and arg_21_1.time_ < var_24_6 + var_24_13 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play110141006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 110141006
		arg_25_1.duration_ = 8.108

		local var_25_0 = {
			ja = 7.308,
			ko = 7.841,
			zh = 8.108,
			en = 7.141
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
				arg_25_0:Play110141007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = "OS0102b"

			if arg_25_1.bgs_[var_28_0] == nil then
				local var_28_1 = Object.Instantiate(arg_25_1.paintGo_)

				var_28_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_28_0)
				var_28_1.name = var_28_0
				var_28_1.transform.parent = arg_25_1.stage_.transform
				var_28_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_25_1.bgs_[var_28_0] = var_28_1
			end

			local var_28_2 = arg_25_1.bgs_.OS0102b
			local var_28_3 = 1.5

			if var_28_3 < arg_25_1.time_ and arg_25_1.time_ <= var_28_3 + arg_28_0 then
				local var_28_4 = var_28_2:GetComponent("SpriteRenderer")

				if var_28_4 then
					var_28_4.material = arg_25_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_28_5 = var_28_4.material
					local var_28_6 = var_28_5:GetColor("_Color")

					arg_25_1.var_.alphaOldValueOS0102b = var_28_6.a
					arg_25_1.var_.alphaMatValueOS0102b = var_28_5
				end

				arg_25_1.var_.alphaOldValueOS0102b = 0
			end

			local var_28_7 = 1.5

			if var_28_3 <= arg_25_1.time_ and arg_25_1.time_ < var_28_3 + var_28_7 then
				local var_28_8 = (arg_25_1.time_ - var_28_3) / var_28_7
				local var_28_9 = Mathf.Lerp(arg_25_1.var_.alphaOldValueOS0102b, 1, var_28_8)

				if arg_25_1.var_.alphaMatValueOS0102b then
					local var_28_10 = arg_25_1.var_.alphaMatValueOS0102b
					local var_28_11 = var_28_10:GetColor("_Color")

					var_28_11.a = var_28_9

					var_28_10:SetColor("_Color", var_28_11)
				end
			end

			if arg_25_1.time_ >= var_28_3 + var_28_7 and arg_25_1.time_ < var_28_3 + var_28_7 + arg_28_0 and arg_25_1.var_.alphaMatValueOS0102b then
				local var_28_12 = arg_25_1.var_.alphaMatValueOS0102b
				local var_28_13 = var_28_12:GetColor("_Color")

				var_28_13.a = 1

				var_28_12:SetColor("_Color", var_28_13)
			end

			local var_28_14 = arg_25_1.bgs_.OS0102a
			local var_28_15 = 0

			if var_28_15 < arg_25_1.time_ and arg_25_1.time_ <= var_28_15 + arg_28_0 then
				local var_28_16 = var_28_14:GetComponent("SpriteRenderer")

				if var_28_16 then
					var_28_16.material = arg_25_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_28_17 = var_28_16.material
					local var_28_18 = var_28_17:GetColor("_Color")

					arg_25_1.var_.alphaOldValueOS0102a = var_28_18.a
					arg_25_1.var_.alphaMatValueOS0102a = var_28_17
				end

				arg_25_1.var_.alphaOldValueOS0102a = 1
			end

			local var_28_19 = 1.5

			if var_28_15 <= arg_25_1.time_ and arg_25_1.time_ < var_28_15 + var_28_19 then
				local var_28_20 = (arg_25_1.time_ - var_28_15) / var_28_19
				local var_28_21 = Mathf.Lerp(arg_25_1.var_.alphaOldValueOS0102a, 0, var_28_20)

				if arg_25_1.var_.alphaMatValueOS0102a then
					local var_28_22 = arg_25_1.var_.alphaMatValueOS0102a
					local var_28_23 = var_28_22:GetColor("_Color")

					var_28_23.a = var_28_21

					var_28_22:SetColor("_Color", var_28_23)
				end
			end

			if arg_25_1.time_ >= var_28_15 + var_28_19 and arg_25_1.time_ < var_28_15 + var_28_19 + arg_28_0 and arg_25_1.var_.alphaMatValueOS0102a then
				local var_28_24 = arg_25_1.var_.alphaMatValueOS0102a
				local var_28_25 = var_28_24:GetColor("_Color")

				var_28_25.a = 0

				var_28_24:SetColor("_Color", var_28_25)
			end

			local var_28_26 = 1.5

			if var_28_26 < arg_25_1.time_ and arg_25_1.time_ <= var_28_26 + arg_28_0 then
				local var_28_27 = manager.ui.mainCamera.transform.localPosition
				local var_28_28 = Vector3.New(0, 0, 10) + Vector3.New(var_28_27.x, var_28_27.y, 0)
				local var_28_29 = arg_25_1.bgs_.OS0102b

				var_28_29.transform.localPosition = var_28_28
				var_28_29.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_28_30 = var_28_29:GetComponent("SpriteRenderer")

				if var_28_30 and var_28_30.sprite then
					local var_28_31 = (var_28_29.transform.localPosition - var_28_27).z
					local var_28_32 = manager.ui.mainCameraCom_
					local var_28_33 = 2 * var_28_31 * Mathf.Tan(var_28_32.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_28_34 = var_28_33 * var_28_32.aspect
					local var_28_35 = var_28_30.sprite.bounds.size.x
					local var_28_36 = var_28_30.sprite.bounds.size.y
					local var_28_37 = var_28_34 / var_28_35
					local var_28_38 = var_28_33 / var_28_36
					local var_28_39 = var_28_38 < var_28_37 and var_28_37 or var_28_38

					var_28_29.transform.localScale = Vector3.New(var_28_39, var_28_39, 0)
				end

				for iter_28_0, iter_28_1 in pairs(arg_25_1.bgs_) do
					if iter_28_0 ~= "OS0102b" then
						iter_28_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_28_40 = 0

			if var_28_40 < arg_25_1.time_ and arg_25_1.time_ <= var_28_40 + arg_28_0 then
				arg_25_1.allBtn_.enabled = false
			end

			local var_28_41 = 2.375

			if arg_25_1.time_ >= var_28_40 + var_28_41 and arg_25_1.time_ < var_28_40 + var_28_41 + arg_28_0 then
				arg_25_1.allBtn_.enabled = true
			end

			if arg_25_1.frameCnt_ <= 1 then
				arg_25_1.dialog_:SetActive(false)
			end

			local var_28_42 = 2.375
			local var_28_43 = 0.625

			if var_28_42 < arg_25_1.time_ and arg_25_1.time_ <= var_28_42 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0

				arg_25_1.dialog_:SetActive(true)

				local var_28_44 = LeanTween.value(arg_25_1.dialog_, 0, 1, 0.3)

				var_28_44:setOnUpdate(LuaHelper.FloatAction(function(arg_29_0)
					arg_25_1.dialogCg_.alpha = arg_29_0
				end))
				var_28_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_25_1.dialog_)
					var_28_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_25_1.duration_ = arg_25_1.duration_ + 0.3

				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_45 = arg_25_1:FormatText(StoryNameCfg[37].name)

				arg_25_1.leftNameTxt_.text = var_28_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_46 = arg_25_1:GetWordFromCfg(110141006)
				local var_28_47 = arg_25_1:FormatText(var_28_46.content)

				arg_25_1.text_.text = var_28_47

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_48 = 25
				local var_28_49 = utf8.len(var_28_47)
				local var_28_50 = var_28_48 <= 0 and var_28_43 or var_28_43 * (var_28_49 / var_28_48)

				if var_28_50 > 0 and var_28_43 < var_28_50 then
					arg_25_1.talkMaxDuration = var_28_50
					var_28_42 = var_28_42 + 0.3

					if var_28_50 + var_28_42 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_50 + var_28_42
					end
				end

				arg_25_1.text_.text = var_28_47
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141006", "story_v_out_110141.awb") ~= 0 then
					local var_28_51 = manager.audio:GetVoiceLength("story_v_out_110141", "110141006", "story_v_out_110141.awb") / 1000

					if var_28_51 + var_28_42 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_51 + var_28_42
					end

					if var_28_46.prefab_name ~= "" and arg_25_1.actors_[var_28_46.prefab_name] ~= nil then
						local var_28_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_46.prefab_name].transform, "story_v_out_110141", "110141006", "story_v_out_110141.awb")

						arg_25_1:RecordAudio("110141006", var_28_52)
						arg_25_1:RecordAudio("110141006", var_28_52)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_110141", "110141006", "story_v_out_110141.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_110141", "110141006", "story_v_out_110141.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_53 = var_28_42 + 0.3
			local var_28_54 = math.max(var_28_43, arg_25_1.talkMaxDuration)

			if var_28_53 <= arg_25_1.time_ and arg_25_1.time_ < var_28_53 + var_28_54 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_53) / var_28_54

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_53 + var_28_54 and arg_25_1.time_ < var_28_53 + var_28_54 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play110141007 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 110141007
		arg_31_1.duration_ = 4.833

		local var_31_0 = {
			ja = 3.5,
			ko = 4.433,
			zh = 4.833,
			en = 3.566
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
				arg_31_0:Play110141008(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.45

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[37].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(110141007)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 18
				local var_34_6 = utf8.len(var_34_4)
				local var_34_7 = var_34_5 <= 0 and var_34_1 or var_34_1 * (var_34_6 / var_34_5)

				if var_34_7 > 0 and var_34_1 < var_34_7 then
					arg_31_1.talkMaxDuration = var_34_7

					if var_34_7 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_7 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_4
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141007", "story_v_out_110141.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_110141", "110141007", "story_v_out_110141.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_110141", "110141007", "story_v_out_110141.awb")

						arg_31_1:RecordAudio("110141007", var_34_9)
						arg_31_1:RecordAudio("110141007", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_110141", "110141007", "story_v_out_110141.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_110141", "110141007", "story_v_out_110141.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_10 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_10 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_10

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_10 and arg_31_1.time_ < var_34_0 + var_34_10 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play110141008 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 110141008
		arg_35_1.duration_ = 4.166

		local var_35_0 = {
			ja = 3.033,
			ko = 4.166,
			zh = 3.5,
			en = 4
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
				arg_35_0:Play110141009(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.mask_.enabled = true
				arg_35_1.mask_.raycastTarget = false

				arg_35_1:SetGaussion(false)
			end

			local var_38_1 = 1.5

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_1 then
				local var_38_2 = (arg_35_1.time_ - var_38_0) / var_38_1
				local var_38_3 = Color.New(1, 1, 1)

				var_38_3.a = Mathf.Lerp(1, 0, var_38_2)
				arg_35_1.mask_.color = var_38_3
			end

			if arg_35_1.time_ >= var_38_0 + var_38_1 and arg_35_1.time_ < var_38_0 + var_38_1 + arg_38_0 then
				local var_38_4 = Color.New(1, 1, 1)
				local var_38_5 = 0

				arg_35_1.mask_.enabled = false
				var_38_4.a = var_38_5
				arg_35_1.mask_.color = var_38_4
			end

			local var_38_6 = manager.ui.mainCamera.transform
			local var_38_7 = 1.2

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				arg_35_1.var_.shakeOldPos = var_38_6.localPosition
			end

			local var_38_8 = 0.6

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / 0.066
				local var_38_10, var_38_11 = math.modf(var_38_9)

				var_38_6.localPosition = Vector3.New(var_38_11 * 0.13, var_38_11 * 0.13, var_38_11 * 0.13) + arg_35_1.var_.shakeOldPos
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 then
				var_38_6.localPosition = arg_35_1.var_.shakeOldPos
			end

			local var_38_12 = arg_35_1.bgs_.OS0102b
			local var_38_13 = 0

			if var_38_13 < arg_35_1.time_ and arg_35_1.time_ <= var_38_13 + arg_38_0 then
				local var_38_14 = var_38_12:GetComponent("SpriteRenderer")

				if var_38_14 then
					var_38_14.material = arg_35_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_38_15 = var_38_14.material
					local var_38_16 = var_38_15:GetColor("_Color")

					arg_35_1.var_.alphaOldValueOS0102b = var_38_16.a
					arg_35_1.var_.alphaMatValueOS0102b = var_38_15
				end

				arg_35_1.var_.alphaOldValueOS0102b = 1
			end

			local var_38_17 = 0.0166666666666667

			if var_38_13 <= arg_35_1.time_ and arg_35_1.time_ < var_38_13 + var_38_17 then
				local var_38_18 = (arg_35_1.time_ - var_38_13) / var_38_17
				local var_38_19 = Mathf.Lerp(arg_35_1.var_.alphaOldValueOS0102b, 0, var_38_18)

				if arg_35_1.var_.alphaMatValueOS0102b then
					local var_38_20 = arg_35_1.var_.alphaMatValueOS0102b
					local var_38_21 = var_38_20:GetColor("_Color")

					var_38_21.a = var_38_19

					var_38_20:SetColor("_Color", var_38_21)
				end
			end

			if arg_35_1.time_ >= var_38_13 + var_38_17 and arg_35_1.time_ < var_38_13 + var_38_17 + arg_38_0 and arg_35_1.var_.alphaMatValueOS0102b then
				local var_38_22 = arg_35_1.var_.alphaMatValueOS0102b
				local var_38_23 = var_38_22:GetColor("_Color")

				var_38_23.a = 0

				var_38_22:SetColor("_Color", var_38_23)
			end

			local var_38_24 = 0

			if var_38_24 < arg_35_1.time_ and arg_35_1.time_ <= var_38_24 + arg_38_0 then
				arg_35_1.allBtn_.enabled = false
			end

			local var_38_25 = 1.2

			if arg_35_1.time_ >= var_38_24 + var_38_25 and arg_35_1.time_ < var_38_24 + var_38_25 + arg_38_0 then
				arg_35_1.allBtn_.enabled = true
			end

			if arg_35_1.frameCnt_ <= 1 then
				arg_35_1.dialog_:SetActive(false)
			end

			local var_38_26 = 1.2
			local var_38_27 = 0.3

			if var_38_26 < arg_35_1.time_ and arg_35_1.time_ <= var_38_26 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0

				arg_35_1.dialog_:SetActive(true)

				local var_38_28 = LeanTween.value(arg_35_1.dialog_, 0, 1, 0.3)

				var_38_28:setOnUpdate(LuaHelper.FloatAction(function(arg_39_0)
					arg_35_1.dialogCg_.alpha = arg_39_0
				end))
				var_38_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_35_1.dialog_)
					var_38_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_35_1.duration_ = arg_35_1.duration_ + 0.3

				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_29 = arg_35_1:FormatText(StoryNameCfg[37].name)

				arg_35_1.leftNameTxt_.text = var_38_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_30 = arg_35_1:GetWordFromCfg(110141008)
				local var_38_31 = arg_35_1:FormatText(var_38_30.content)

				arg_35_1.text_.text = var_38_31

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_32 = 12
				local var_38_33 = utf8.len(var_38_31)
				local var_38_34 = var_38_32 <= 0 and var_38_27 or var_38_27 * (var_38_33 / var_38_32)

				if var_38_34 > 0 and var_38_27 < var_38_34 then
					arg_35_1.talkMaxDuration = var_38_34
					var_38_26 = var_38_26 + 0.3

					if var_38_34 + var_38_26 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_34 + var_38_26
					end
				end

				arg_35_1.text_.text = var_38_31
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141008", "story_v_out_110141.awb") ~= 0 then
					local var_38_35 = manager.audio:GetVoiceLength("story_v_out_110141", "110141008", "story_v_out_110141.awb") / 1000

					if var_38_35 + var_38_26 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_35 + var_38_26
					end

					if var_38_30.prefab_name ~= "" and arg_35_1.actors_[var_38_30.prefab_name] ~= nil then
						local var_38_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_30.prefab_name].transform, "story_v_out_110141", "110141008", "story_v_out_110141.awb")

						arg_35_1:RecordAudio("110141008", var_38_36)
						arg_35_1:RecordAudio("110141008", var_38_36)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_110141", "110141008", "story_v_out_110141.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_110141", "110141008", "story_v_out_110141.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_37 = var_38_26 + 0.3
			local var_38_38 = math.max(var_38_27, arg_35_1.talkMaxDuration)

			if var_38_37 <= arg_35_1.time_ and arg_35_1.time_ < var_38_37 + var_38_38 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_37) / var_38_38

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_37 + var_38_38 and arg_35_1.time_ < var_38_37 + var_38_38 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play110141009 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 110141009
		arg_41_1.duration_ = 5

		SetActive(arg_41_1.tipsGo_, false)

		function arg_41_1.onSingleLineFinish_()
			arg_41_1.onSingleLineUpdate_ = nil
			arg_41_1.onSingleLineFinish_ = nil
			arg_41_1.state_ = "waiting"
		end

		function arg_41_1.playNext_(arg_43_0)
			if arg_43_0 == 1 then
				arg_41_0:Play110141010(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.95

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, false)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_2 = arg_41_1:GetWordFromCfg(110141009)
				local var_44_3 = arg_41_1:FormatText(var_44_2.content)

				arg_41_1.text_.text = var_44_3

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_4 = 38
				local var_44_5 = utf8.len(var_44_3)
				local var_44_6 = var_44_4 <= 0 and var_44_1 or var_44_1 * (var_44_5 / var_44_4)

				if var_44_6 > 0 and var_44_1 < var_44_6 then
					arg_41_1.talkMaxDuration = var_44_6

					if var_44_6 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_6 + var_44_0
					end
				end

				arg_41_1.text_.text = var_44_3
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)
				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_7 = math.max(var_44_1, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_7 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_0) / var_44_7

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_7 and arg_41_1.time_ < var_44_0 + var_44_7 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play110141010 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 110141010
		arg_45_1.duration_ = 9.033

		local var_45_0 = {
			ja = 7.433,
			ko = 9.033,
			zh = 7.233,
			en = 7.233
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
				arg_45_0:Play110141011(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = "1011ui_story"

			if arg_45_1.actors_[var_48_0] == nil then
				local var_48_1 = Object.Instantiate(Asset.Load("Char/" .. var_48_0), arg_45_1.stage_.transform)

				var_48_1.name = var_48_0
				var_48_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_45_1.actors_[var_48_0] = var_48_1

				local var_48_2 = var_48_1:GetComponentInChildren(typeof(CharacterEffect))

				var_48_2.enabled = true

				local var_48_3 = GameObjectTools.GetOrAddComponent(var_48_1, typeof(DynamicBoneHelper))

				if var_48_3 then
					var_48_3:EnableDynamicBone(false)
				end

				arg_45_1:ShowWeapon(var_48_2.transform, false)

				arg_45_1.var_[var_48_0 .. "Animator"] = var_48_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_45_1.var_[var_48_0 .. "Animator"].applyRootMotion = true
				arg_45_1.var_[var_48_0 .. "LipSync"] = var_48_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_48_4 = arg_45_1.actors_["1011ui_story"].transform
			local var_48_5 = 1.8

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 then
				arg_45_1.var_.moveOldPos1011ui_story = var_48_4.localPosition
			end

			local var_48_6 = 0.001

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / var_48_6
				local var_48_8 = Vector3.New(0, -0.71, -6)

				var_48_4.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1011ui_story, var_48_8, var_48_7)

				local var_48_9 = manager.ui.mainCamera.transform.position - var_48_4.position

				var_48_4.forward = Vector3.New(var_48_9.x, var_48_9.y, var_48_9.z)

				local var_48_10 = var_48_4.localEulerAngles

				var_48_10.z = 0
				var_48_10.x = 0
				var_48_4.localEulerAngles = var_48_10
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 then
				var_48_4.localPosition = Vector3.New(0, -0.71, -6)

				local var_48_11 = manager.ui.mainCamera.transform.position - var_48_4.position

				var_48_4.forward = Vector3.New(var_48_11.x, var_48_11.y, var_48_11.z)

				local var_48_12 = var_48_4.localEulerAngles

				var_48_12.z = 0
				var_48_12.x = 0
				var_48_4.localEulerAngles = var_48_12
			end

			local var_48_13 = "ST19"

			if arg_45_1.bgs_[var_48_13] == nil then
				local var_48_14 = Object.Instantiate(arg_45_1.paintGo_)

				var_48_14:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_48_13)
				var_48_14.name = var_48_13
				var_48_14.transform.parent = arg_45_1.stage_.transform
				var_48_14.transform.localPosition = Vector3.New(0, 100, 0)
				arg_45_1.bgs_[var_48_13] = var_48_14
			end

			local var_48_15 = arg_45_1.bgs_.ST19
			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 then
				local var_48_17 = var_48_15:GetComponent("SpriteRenderer")

				if var_48_17 then
					var_48_17.material = arg_45_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_48_18 = var_48_17.material
					local var_48_19 = var_48_18:GetColor("_Color")

					arg_45_1.var_.alphaOldValueST19 = var_48_19.a
					arg_45_1.var_.alphaMatValueST19 = var_48_18
				end

				arg_45_1.var_.alphaOldValueST19 = 0
			end

			local var_48_20 = 1.5

			if var_48_16 <= arg_45_1.time_ and arg_45_1.time_ < var_48_16 + var_48_20 then
				local var_48_21 = (arg_45_1.time_ - var_48_16) / var_48_20
				local var_48_22 = Mathf.Lerp(arg_45_1.var_.alphaOldValueST19, 1, var_48_21)

				if arg_45_1.var_.alphaMatValueST19 then
					local var_48_23 = arg_45_1.var_.alphaMatValueST19
					local var_48_24 = var_48_23:GetColor("_Color")

					var_48_24.a = var_48_22

					var_48_23:SetColor("_Color", var_48_24)
				end
			end

			if arg_45_1.time_ >= var_48_16 + var_48_20 and arg_45_1.time_ < var_48_16 + var_48_20 + arg_48_0 and arg_45_1.var_.alphaMatValueST19 then
				local var_48_25 = arg_45_1.var_.alphaMatValueST19
				local var_48_26 = var_48_25:GetColor("_Color")

				var_48_26.a = 1

				var_48_25:SetColor("_Color", var_48_26)
			end

			local var_48_27 = 0

			if var_48_27 < arg_45_1.time_ and arg_45_1.time_ <= var_48_27 + arg_48_0 then
				local var_48_28 = manager.ui.mainCamera.transform.localPosition
				local var_48_29 = Vector3.New(0, 0, 10) + Vector3.New(var_48_28.x, var_48_28.y, 0)
				local var_48_30 = arg_45_1.bgs_.ST19

				var_48_30.transform.localPosition = var_48_29
				var_48_30.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_48_31 = var_48_30:GetComponent("SpriteRenderer")

				if var_48_31 and var_48_31.sprite then
					local var_48_32 = (var_48_30.transform.localPosition - var_48_28).z
					local var_48_33 = manager.ui.mainCameraCom_
					local var_48_34 = 2 * var_48_32 * Mathf.Tan(var_48_33.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_48_35 = var_48_34 * var_48_33.aspect
					local var_48_36 = var_48_31.sprite.bounds.size.x
					local var_48_37 = var_48_31.sprite.bounds.size.y
					local var_48_38 = var_48_35 / var_48_36
					local var_48_39 = var_48_34 / var_48_37
					local var_48_40 = var_48_39 < var_48_38 and var_48_38 or var_48_39

					var_48_30.transform.localScale = Vector3.New(var_48_40, var_48_40, 0)
				end

				for iter_48_0, iter_48_1 in pairs(arg_45_1.bgs_) do
					if iter_48_0 ~= "ST19" then
						iter_48_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_48_41 = arg_45_1.actors_["1011ui_story"]
			local var_48_42 = 1.8

			if var_48_42 < arg_45_1.time_ and arg_45_1.time_ <= var_48_42 + arg_48_0 and arg_45_1.var_.characterEffect1011ui_story == nil then
				arg_45_1.var_.characterEffect1011ui_story = var_48_41:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_43 = 0.2

			if var_48_42 <= arg_45_1.time_ and arg_45_1.time_ < var_48_42 + var_48_43 then
				local var_48_44 = (arg_45_1.time_ - var_48_42) / var_48_43

				if arg_45_1.var_.characterEffect1011ui_story then
					arg_45_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_42 + var_48_43 and arg_45_1.time_ < var_48_42 + var_48_43 + arg_48_0 and arg_45_1.var_.characterEffect1011ui_story then
				arg_45_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_48_45 = 1.8

			if var_48_45 < arg_45_1.time_ and arg_45_1.time_ <= var_48_45 + arg_48_0 then
				arg_45_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action9_2")
			end

			local var_48_46 = 1.8

			if var_48_46 < arg_45_1.time_ and arg_45_1.time_ <= var_48_46 + arg_48_0 then
				arg_45_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_47 = 2
			local var_48_48 = 1

			if var_48_47 < arg_45_1.time_ and arg_45_1.time_ <= var_48_47 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_49 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_49:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_50 = arg_45_1:FormatText(StoryNameCfg[37].name)

				arg_45_1.leftNameTxt_.text = var_48_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_51 = arg_45_1:GetWordFromCfg(110141010)
				local var_48_52 = arg_45_1:FormatText(var_48_51.content)

				arg_45_1.text_.text = var_48_52

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_53 = 20
				local var_48_54 = utf8.len(var_48_52)
				local var_48_55 = var_48_53 <= 0 and var_48_48 or var_48_48 * (var_48_54 / var_48_53)

				if var_48_55 > 0 and var_48_48 < var_48_55 then
					arg_45_1.talkMaxDuration = var_48_55
					var_48_47 = var_48_47 + 0.3

					if var_48_55 + var_48_47 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_55 + var_48_47
					end
				end

				arg_45_1.text_.text = var_48_52
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141010", "story_v_out_110141.awb") ~= 0 then
					local var_48_56 = manager.audio:GetVoiceLength("story_v_out_110141", "110141010", "story_v_out_110141.awb") / 1000

					if var_48_56 + var_48_47 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_56 + var_48_47
					end

					if var_48_51.prefab_name ~= "" and arg_45_1.actors_[var_48_51.prefab_name] ~= nil then
						local var_48_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_51.prefab_name].transform, "story_v_out_110141", "110141010", "story_v_out_110141.awb")

						arg_45_1:RecordAudio("110141010", var_48_57)
						arg_45_1:RecordAudio("110141010", var_48_57)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_110141", "110141010", "story_v_out_110141.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_110141", "110141010", "story_v_out_110141.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_58 = var_48_47 + 0.3
			local var_48_59 = math.max(var_48_48, arg_45_1.talkMaxDuration)

			if var_48_58 <= arg_45_1.time_ and arg_45_1.time_ < var_48_58 + var_48_59 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_58) / var_48_59

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_58 + var_48_59 and arg_45_1.time_ < var_48_58 + var_48_59 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play110141011 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 110141011
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play110141012(arg_51_1)
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
				local var_54_4 = Vector3.New(0, 100, 0)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1011ui_story, var_54_4, var_54_3)

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
			local var_54_10 = 0.65

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

				local var_54_11 = arg_51_1:GetWordFromCfg(110141011)
				local var_54_12 = arg_51_1:FormatText(var_54_11.content)

				arg_51_1.text_.text = var_54_12

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_13 = 26
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
	Play110141012 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 110141012
		arg_55_1.duration_ = 6.5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play110141013(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = true

				arg_55_1:SetGaussion(false)
			end

			local var_58_1 = 1.5

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_1 then
				local var_58_2 = (arg_55_1.time_ - var_58_0) / var_58_1
				local var_58_3 = Color.New(1, 1, 1)

				var_58_3.a = Mathf.Lerp(0, 1, var_58_2)
				arg_55_1.mask_.color = var_58_3
			end

			if arg_55_1.time_ >= var_58_0 + var_58_1 and arg_55_1.time_ < var_58_0 + var_58_1 + arg_58_0 then
				local var_58_4 = Color.New(1, 1, 1)

				var_58_4.a = 1
				arg_55_1.mask_.color = var_58_4
			end

			local var_58_5 = 1.5

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1.mask_.enabled = true
				arg_55_1.mask_.raycastTarget = false

				arg_55_1:SetGaussion(false)
			end

			local var_58_6 = 0.0166666666666667

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_6 then
				local var_58_7 = (arg_55_1.time_ - var_58_5) / var_58_6
				local var_58_8 = Color.New(1, 1, 1)

				var_58_8.a = Mathf.Lerp(1, 0, var_58_7)
				arg_55_1.mask_.color = var_58_8
			end

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 then
				local var_58_9 = Color.New(1, 1, 1)
				local var_58_10 = 0

				arg_55_1.mask_.enabled = false
				var_58_9.a = var_58_10
				arg_55_1.mask_.color = var_58_9
			end

			local var_58_11 = "STwhite"

			if arg_55_1.bgs_[var_58_11] == nil then
				local var_58_12 = Object.Instantiate(arg_55_1.paintGo_)

				var_58_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_58_11)
				var_58_12.name = var_58_11
				var_58_12.transform.parent = arg_55_1.stage_.transform
				var_58_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_55_1.bgs_[var_58_11] = var_58_12
			end

			local var_58_13 = arg_55_1.bgs_.STwhite.transform
			local var_58_14 = 1.466

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1.var_.moveOldPosSTwhite = var_58_13.localPosition
				var_58_13.localScale = Vector3.New(10, 10, 10)
			end

			local var_58_15 = 0.001

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_15 then
				local var_58_16 = (arg_55_1.time_ - var_58_14) / var_58_15
				local var_58_17 = Vector3.New(0, 0, 0)

				var_58_13.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosSTwhite, var_58_17, var_58_16)
			end

			if arg_55_1.time_ >= var_58_14 + var_58_15 and arg_55_1.time_ < var_58_14 + var_58_15 + arg_58_0 then
				var_58_13.localPosition = Vector3.New(0, 0, 0)
			end

			local var_58_18 = arg_55_1.bgs_.ST19
			local var_58_19 = 0

			if var_58_19 < arg_55_1.time_ and arg_55_1.time_ <= var_58_19 + arg_58_0 then
				local var_58_20 = var_58_18:GetComponent("SpriteRenderer")

				if var_58_20 then
					var_58_20.material = arg_55_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_58_21 = var_58_20.material
					local var_58_22 = var_58_21:GetColor("_Color")

					arg_55_1.var_.alphaOldValueST19 = var_58_22.a
					arg_55_1.var_.alphaMatValueST19 = var_58_21
				end

				arg_55_1.var_.alphaOldValueST19 = 1
			end

			local var_58_23 = 0.0166666666666667

			if var_58_19 <= arg_55_1.time_ and arg_55_1.time_ < var_58_19 + var_58_23 then
				local var_58_24 = (arg_55_1.time_ - var_58_19) / var_58_23
				local var_58_25 = Mathf.Lerp(arg_55_1.var_.alphaOldValueST19, 0, var_58_24)

				if arg_55_1.var_.alphaMatValueST19 then
					local var_58_26 = arg_55_1.var_.alphaMatValueST19
					local var_58_27 = var_58_26:GetColor("_Color")

					var_58_27.a = var_58_25

					var_58_26:SetColor("_Color", var_58_27)
				end
			end

			if arg_55_1.time_ >= var_58_19 + var_58_23 and arg_55_1.time_ < var_58_19 + var_58_23 + arg_58_0 and arg_55_1.var_.alphaMatValueST19 then
				local var_58_28 = arg_55_1.var_.alphaMatValueST19
				local var_58_29 = var_58_28:GetColor("_Color")

				var_58_29.a = 0

				var_58_28:SetColor("_Color", var_58_29)
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_30 = 1.5
			local var_58_31 = 0.65

			if var_58_30 < arg_55_1.time_ and arg_55_1.time_ <= var_58_30 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_32 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_32:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_33 = arg_55_1:GetWordFromCfg(110141012)
				local var_58_34 = arg_55_1:FormatText(var_58_33.content)

				arg_55_1.text_.text = var_58_34

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_35 = 26
				local var_58_36 = utf8.len(var_58_34)
				local var_58_37 = var_58_35 <= 0 and var_58_31 or var_58_31 * (var_58_36 / var_58_35)

				if var_58_37 > 0 and var_58_31 < var_58_37 then
					arg_55_1.talkMaxDuration = var_58_37
					var_58_30 = var_58_30 + 0.3

					if var_58_37 + var_58_30 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_37 + var_58_30
					end
				end

				arg_55_1.text_.text = var_58_34
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_38 = var_58_30 + 0.3
			local var_58_39 = math.max(var_58_31, arg_55_1.talkMaxDuration)

			if var_58_38 <= arg_55_1.time_ and arg_55_1.time_ < var_58_38 + var_58_39 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_38) / var_58_39

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_38 + var_58_39 and arg_55_1.time_ < var_58_38 + var_58_39 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play110141013 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 110141013
		arg_61_1.duration_ = 3.433

		local var_61_0 = {
			ja = 2.866,
			ko = 1.166,
			zh = 3.433,
			en = 1.3
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
				arg_61_0:Play110141014(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0
			local var_64_1 = 0.125

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_2 = arg_61_1:FormatText(StoryNameCfg[37].name)

				arg_61_1.leftNameTxt_.text = var_64_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, true)
				arg_61_1.iconController_:SetSelectedState("hero")

				arg_61_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_3 = arg_61_1:GetWordFromCfg(110141013)
				local var_64_4 = arg_61_1:FormatText(var_64_3.content)

				arg_61_1.text_.text = var_64_4

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_5 = 5
				local var_64_6 = utf8.len(var_64_4)
				local var_64_7 = var_64_5 <= 0 and var_64_1 or var_64_1 * (var_64_6 / var_64_5)

				if var_64_7 > 0 and var_64_1 < var_64_7 then
					arg_61_1.talkMaxDuration = var_64_7

					if var_64_7 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_7 + var_64_0
					end
				end

				arg_61_1.text_.text = var_64_4
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141013", "story_v_out_110141.awb") ~= 0 then
					local var_64_8 = manager.audio:GetVoiceLength("story_v_out_110141", "110141013", "story_v_out_110141.awb") / 1000

					if var_64_8 + var_64_0 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_8 + var_64_0
					end

					if var_64_3.prefab_name ~= "" and arg_61_1.actors_[var_64_3.prefab_name] ~= nil then
						local var_64_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_3.prefab_name].transform, "story_v_out_110141", "110141013", "story_v_out_110141.awb")

						arg_61_1:RecordAudio("110141013", var_64_9)
						arg_61_1:RecordAudio("110141013", var_64_9)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_110141", "110141013", "story_v_out_110141.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_110141", "110141013", "story_v_out_110141.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_10 = math.max(var_64_1, arg_61_1.talkMaxDuration)

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_10 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_0) / var_64_10

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_0 + var_64_10 and arg_61_1.time_ < var_64_0 + var_64_10 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play110141014 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 110141014
		arg_65_1.duration_ = 7.533

		local var_65_0 = {
			ja = 7.533,
			ko = 4.466,
			zh = 4.933,
			en = 4.833
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
				arg_65_0:Play110141015(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = false

				arg_65_1:SetGaussion(false)
			end

			local var_68_1 = 1.5

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_1 then
				local var_68_2 = (arg_65_1.time_ - var_68_0) / var_68_1
				local var_68_3 = Color.New(1, 1, 1)

				var_68_3.a = Mathf.Lerp(1, 0, var_68_2)
				arg_65_1.mask_.color = var_68_3
			end

			if arg_65_1.time_ >= var_68_0 + var_68_1 and arg_65_1.time_ < var_68_0 + var_68_1 + arg_68_0 then
				local var_68_4 = Color.New(1, 1, 1)
				local var_68_5 = 0

				arg_65_1.mask_.enabled = false
				var_68_4.a = var_68_5
				arg_65_1.mask_.color = var_68_4
			end

			local var_68_6 = 0

			if var_68_6 < arg_65_1.time_ and arg_65_1.time_ <= var_68_6 + arg_68_0 then
				arg_65_1.allBtn_.enabled = false
			end

			local var_68_7 = 2

			if arg_65_1.time_ >= var_68_6 + var_68_7 and arg_65_1.time_ < var_68_6 + var_68_7 + arg_68_0 then
				arg_65_1.allBtn_.enabled = true
			end

			local var_68_8 = arg_65_1.actors_["1011ui_story"].transform
			local var_68_9 = 1.8

			if var_68_9 < arg_65_1.time_ and arg_65_1.time_ <= var_68_9 + arg_68_0 then
				arg_65_1.var_.moveOldPos1011ui_story = var_68_8.localPosition
			end

			local var_68_10 = 0.001

			if var_68_9 <= arg_65_1.time_ and arg_65_1.time_ < var_68_9 + var_68_10 then
				local var_68_11 = (arg_65_1.time_ - var_68_9) / var_68_10
				local var_68_12 = Vector3.New(0, -0.71, -6)

				var_68_8.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1011ui_story, var_68_12, var_68_11)

				local var_68_13 = manager.ui.mainCamera.transform.position - var_68_8.position

				var_68_8.forward = Vector3.New(var_68_13.x, var_68_13.y, var_68_13.z)

				local var_68_14 = var_68_8.localEulerAngles

				var_68_14.z = 0
				var_68_14.x = 0
				var_68_8.localEulerAngles = var_68_14
			end

			if arg_65_1.time_ >= var_68_9 + var_68_10 and arg_65_1.time_ < var_68_9 + var_68_10 + arg_68_0 then
				var_68_8.localPosition = Vector3.New(0, -0.71, -6)

				local var_68_15 = manager.ui.mainCamera.transform.position - var_68_8.position

				var_68_8.forward = Vector3.New(var_68_15.x, var_68_15.y, var_68_15.z)

				local var_68_16 = var_68_8.localEulerAngles

				var_68_16.z = 0
				var_68_16.x = 0
				var_68_8.localEulerAngles = var_68_16
			end

			local var_68_17 = 1.8

			if var_68_17 < arg_65_1.time_ and arg_65_1.time_ <= var_68_17 + arg_68_0 then
				arg_65_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_68_18 = 1.8

			if var_68_18 < arg_65_1.time_ and arg_65_1.time_ <= var_68_18 + arg_68_0 then
				arg_65_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_68_19 = arg_65_1.actors_["1011ui_story"]
			local var_68_20 = 1.8

			if var_68_20 < arg_65_1.time_ and arg_65_1.time_ <= var_68_20 + arg_68_0 and arg_65_1.var_.characterEffect1011ui_story == nil then
				arg_65_1.var_.characterEffect1011ui_story = var_68_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_21 = 0.2

			if var_68_20 <= arg_65_1.time_ and arg_65_1.time_ < var_68_20 + var_68_21 then
				local var_68_22 = (arg_65_1.time_ - var_68_20) / var_68_21

				if arg_65_1.var_.characterEffect1011ui_story then
					arg_65_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_20 + var_68_21 and arg_65_1.time_ < var_68_20 + var_68_21 + arg_68_0 and arg_65_1.var_.characterEffect1011ui_story then
				arg_65_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_68_23 = arg_65_1.bgs_.ST19
			local var_68_24 = 0

			if var_68_24 < arg_65_1.time_ and arg_65_1.time_ <= var_68_24 + arg_68_0 then
				local var_68_25 = var_68_23:GetComponent("SpriteRenderer")

				if var_68_25 then
					var_68_25.material = arg_65_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_68_26 = var_68_25.material
					local var_68_27 = var_68_26:GetColor("_Color")

					arg_65_1.var_.alphaOldValueST19 = var_68_27.a
					arg_65_1.var_.alphaMatValueST19 = var_68_26
				end

				arg_65_1.var_.alphaOldValueST19 = 0
			end

			local var_68_28 = 0.0166666666666667

			if var_68_24 <= arg_65_1.time_ and arg_65_1.time_ < var_68_24 + var_68_28 then
				local var_68_29 = (arg_65_1.time_ - var_68_24) / var_68_28
				local var_68_30 = Mathf.Lerp(arg_65_1.var_.alphaOldValueST19, 1, var_68_29)

				if arg_65_1.var_.alphaMatValueST19 then
					local var_68_31 = arg_65_1.var_.alphaMatValueST19
					local var_68_32 = var_68_31:GetColor("_Color")

					var_68_32.a = var_68_30

					var_68_31:SetColor("_Color", var_68_32)
				end
			end

			if arg_65_1.time_ >= var_68_24 + var_68_28 and arg_65_1.time_ < var_68_24 + var_68_28 + arg_68_0 and arg_65_1.var_.alphaMatValueST19 then
				local var_68_33 = arg_65_1.var_.alphaMatValueST19
				local var_68_34 = var_68_33:GetColor("_Color")

				var_68_34.a = 1

				var_68_33:SetColor("_Color", var_68_34)
			end

			if arg_65_1.frameCnt_ <= 1 then
				arg_65_1.dialog_:SetActive(false)
			end

			local var_68_35 = 2
			local var_68_36 = 0.225

			if var_68_35 < arg_65_1.time_ and arg_65_1.time_ <= var_68_35 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0

				arg_65_1.dialog_:SetActive(true)

				local var_68_37 = LeanTween.value(arg_65_1.dialog_, 0, 1, 0.3)

				var_68_37:setOnUpdate(LuaHelper.FloatAction(function(arg_69_0)
					arg_65_1.dialogCg_.alpha = arg_69_0
				end))
				var_68_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_65_1.dialog_)
					var_68_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_65_1.duration_ = arg_65_1.duration_ + 0.3

				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_38 = arg_65_1:FormatText(StoryNameCfg[37].name)

				arg_65_1.leftNameTxt_.text = var_68_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_39 = arg_65_1:GetWordFromCfg(110141014)
				local var_68_40 = arg_65_1:FormatText(var_68_39.content)

				arg_65_1.text_.text = var_68_40

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_41 = 9
				local var_68_42 = utf8.len(var_68_40)
				local var_68_43 = var_68_41 <= 0 and var_68_36 or var_68_36 * (var_68_42 / var_68_41)

				if var_68_43 > 0 and var_68_36 < var_68_43 then
					arg_65_1.talkMaxDuration = var_68_43
					var_68_35 = var_68_35 + 0.3

					if var_68_43 + var_68_35 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_43 + var_68_35
					end
				end

				arg_65_1.text_.text = var_68_40
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141014", "story_v_out_110141.awb") ~= 0 then
					local var_68_44 = manager.audio:GetVoiceLength("story_v_out_110141", "110141014", "story_v_out_110141.awb") / 1000

					if var_68_44 + var_68_35 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_44 + var_68_35
					end

					if var_68_39.prefab_name ~= "" and arg_65_1.actors_[var_68_39.prefab_name] ~= nil then
						local var_68_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_39.prefab_name].transform, "story_v_out_110141", "110141014", "story_v_out_110141.awb")

						arg_65_1:RecordAudio("110141014", var_68_45)
						arg_65_1:RecordAudio("110141014", var_68_45)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_110141", "110141014", "story_v_out_110141.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_110141", "110141014", "story_v_out_110141.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_46 = var_68_35 + 0.3
			local var_68_47 = math.max(var_68_36, arg_65_1.talkMaxDuration)

			if var_68_46 <= arg_65_1.time_ and arg_65_1.time_ < var_68_46 + var_68_47 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_46) / var_68_47

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_46 + var_68_47 and arg_65_1.time_ < var_68_46 + var_68_47 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play110141015 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 110141015
		arg_71_1.duration_ = 10.3

		local var_71_0 = {
			ja = 10.3,
			ko = 6.933,
			zh = 8.233,
			en = 5.566
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
				arg_71_0:Play110141016(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_74_1 = 0
			local var_74_2 = 0.825

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_3 = arg_71_1:FormatText(StoryNameCfg[37].name)

				arg_71_1.leftNameTxt_.text = var_74_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_4 = arg_71_1:GetWordFromCfg(110141015)
				local var_74_5 = arg_71_1:FormatText(var_74_4.content)

				arg_71_1.text_.text = var_74_5

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_6 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141015", "story_v_out_110141.awb") ~= 0 then
					local var_74_9 = manager.audio:GetVoiceLength("story_v_out_110141", "110141015", "story_v_out_110141.awb") / 1000

					if var_74_9 + var_74_1 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_9 + var_74_1
					end

					if var_74_4.prefab_name ~= "" and arg_71_1.actors_[var_74_4.prefab_name] ~= nil then
						local var_74_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_4.prefab_name].transform, "story_v_out_110141", "110141015", "story_v_out_110141.awb")

						arg_71_1:RecordAudio("110141015", var_74_10)
						arg_71_1:RecordAudio("110141015", var_74_10)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_110141", "110141015", "story_v_out_110141.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_110141", "110141015", "story_v_out_110141.awb")
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
	Play110141016 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 110141016
		arg_75_1.duration_ = 11.033

		local var_75_0 = {
			ja = 11.033,
			ko = 6.766,
			zh = 7.833,
			en = 5.933
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
				arg_75_0:Play110141017(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_78_1 = 0
			local var_78_2 = 0.8

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_3 = arg_75_1:FormatText(StoryNameCfg[37].name)

				arg_75_1.leftNameTxt_.text = var_78_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_4 = arg_75_1:GetWordFromCfg(110141016)
				local var_78_5 = arg_75_1:FormatText(var_78_4.content)

				arg_75_1.text_.text = var_78_5

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_6 = 32
				local var_78_7 = utf8.len(var_78_5)
				local var_78_8 = var_78_6 <= 0 and var_78_2 or var_78_2 * (var_78_7 / var_78_6)

				if var_78_8 > 0 and var_78_2 < var_78_8 then
					arg_75_1.talkMaxDuration = var_78_8

					if var_78_8 + var_78_1 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_8 + var_78_1
					end
				end

				arg_75_1.text_.text = var_78_5
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141016", "story_v_out_110141.awb") ~= 0 then
					local var_78_9 = manager.audio:GetVoiceLength("story_v_out_110141", "110141016", "story_v_out_110141.awb") / 1000

					if var_78_9 + var_78_1 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_9 + var_78_1
					end

					if var_78_4.prefab_name ~= "" and arg_75_1.actors_[var_78_4.prefab_name] ~= nil then
						local var_78_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_4.prefab_name].transform, "story_v_out_110141", "110141016", "story_v_out_110141.awb")

						arg_75_1:RecordAudio("110141016", var_78_10)
						arg_75_1:RecordAudio("110141016", var_78_10)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_110141", "110141016", "story_v_out_110141.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_110141", "110141016", "story_v_out_110141.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_11 = math.max(var_78_2, arg_75_1.talkMaxDuration)

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_11 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_1) / var_78_11

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_1 + var_78_11 and arg_75_1.time_ < var_78_1 + var_78_11 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play110141017 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 110141017
		arg_79_1.duration_ = 7.8

		local var_79_0 = {
			ja = 7.8,
			ko = 3.7,
			zh = 4.266,
			en = 4.1
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
				arg_79_0:Play110141018(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_82_1 = 0
			local var_82_2 = 0.425

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_3 = arg_79_1:FormatText(StoryNameCfg[37].name)

				arg_79_1.leftNameTxt_.text = var_82_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_4 = arg_79_1:GetWordFromCfg(110141017)
				local var_82_5 = arg_79_1:FormatText(var_82_4.content)

				arg_79_1.text_.text = var_82_5

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_6 = 17
				local var_82_7 = utf8.len(var_82_5)
				local var_82_8 = var_82_6 <= 0 and var_82_2 or var_82_2 * (var_82_7 / var_82_6)

				if var_82_8 > 0 and var_82_2 < var_82_8 then
					arg_79_1.talkMaxDuration = var_82_8

					if var_82_8 + var_82_1 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_1
					end
				end

				arg_79_1.text_.text = var_82_5
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141017", "story_v_out_110141.awb") ~= 0 then
					local var_82_9 = manager.audio:GetVoiceLength("story_v_out_110141", "110141017", "story_v_out_110141.awb") / 1000

					if var_82_9 + var_82_1 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_9 + var_82_1
					end

					if var_82_4.prefab_name ~= "" and arg_79_1.actors_[var_82_4.prefab_name] ~= nil then
						local var_82_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_4.prefab_name].transform, "story_v_out_110141", "110141017", "story_v_out_110141.awb")

						arg_79_1:RecordAudio("110141017", var_82_10)
						arg_79_1:RecordAudio("110141017", var_82_10)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_110141", "110141017", "story_v_out_110141.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_110141", "110141017", "story_v_out_110141.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_11 = math.max(var_82_2, arg_79_1.talkMaxDuration)

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_11 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_1) / var_82_11

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_1 + var_82_11 and arg_79_1.time_ < var_82_1 + var_82_11 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play110141018 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 110141018
		arg_83_1.duration_ = 6.366

		local var_83_0 = {
			ja = 6.366,
			ko = 2.333,
			zh = 2.8,
			en = 2.466
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
			arg_83_1.auto_ = false
		end

		function arg_83_1.playNext_(arg_85_0)
			arg_83_1.onStoryFinished_()
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_86_1 = 0
			local var_86_2 = 0.2

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_3 = arg_83_1:FormatText(StoryNameCfg[37].name)

				arg_83_1.leftNameTxt_.text = var_86_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_4 = arg_83_1:GetWordFromCfg(110141018)
				local var_86_5 = arg_83_1:FormatText(var_86_4.content)

				arg_83_1.text_.text = var_86_5

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_6 = 8
				local var_86_7 = utf8.len(var_86_5)
				local var_86_8 = var_86_6 <= 0 and var_86_2 or var_86_2 * (var_86_7 / var_86_6)

				if var_86_8 > 0 and var_86_2 < var_86_8 then
					arg_83_1.talkMaxDuration = var_86_8

					if var_86_8 + var_86_1 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_1
					end
				end

				arg_83_1.text_.text = var_86_5
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110141", "110141018", "story_v_out_110141.awb") ~= 0 then
					local var_86_9 = manager.audio:GetVoiceLength("story_v_out_110141", "110141018", "story_v_out_110141.awb") / 1000

					if var_86_9 + var_86_1 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_9 + var_86_1
					end

					if var_86_4.prefab_name ~= "" and arg_83_1.actors_[var_86_4.prefab_name] ~= nil then
						local var_86_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_4.prefab_name].transform, "story_v_out_110141", "110141018", "story_v_out_110141.awb")

						arg_83_1:RecordAudio("110141018", var_86_10)
						arg_83_1:RecordAudio("110141018", var_86_10)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_110141", "110141018", "story_v_out_110141.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_110141", "110141018", "story_v_out_110141.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_11 = math.max(var_86_2, arg_83_1.talkMaxDuration)

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_11 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_1) / var_86_11

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_1 + var_86_11 and arg_83_1.time_ < var_86_1 + var_86_11 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/OS0102a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OS0102b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST19"
	},
	voices = {
		"story_v_out_110141.awb"
	}
}
