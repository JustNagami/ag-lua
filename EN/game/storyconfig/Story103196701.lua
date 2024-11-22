return {
	Play319671001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319671001
		arg_1_1.duration_ = 3.766

		local var_1_0 = {
			zh = 2.866,
			ja = 3.766
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
				arg_1_0:Play319671002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "STblack"

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
				local var_4_5 = arg_1_1.bgs_.STblack

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
					if iter_4_0 ~= "STblack" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

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

			local var_4_19 = 1

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
			local var_4_25 = 0.2

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_26 = "play"
				local var_4_27 = "music"

				arg_1_1:AudioAction(var_4_26, var_4_27, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_28 = 0.233333333333333
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock", "bgm_activity_3_0_story_northblock.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_32 = 1
			local var_4_33 = 0.175

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_34 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_34:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_35 = arg_1_1:FormatText(StoryNameCfg[694].name)

				arg_1_1.leftNameTxt_.text = var_4_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_36 = arg_1_1:GetWordFromCfg(319671001)
				local var_4_37 = arg_1_1:FormatText(var_4_36.content)

				arg_1_1.text_.text = var_4_37

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_38 = 7
				local var_4_39 = utf8.len(var_4_37)
				local var_4_40 = var_4_38 <= 0 and var_4_33 or var_4_33 * (var_4_39 / var_4_38)

				if var_4_40 > 0 and var_4_33 < var_4_40 then
					arg_1_1.talkMaxDuration = var_4_40
					var_4_32 = var_4_32 + 0.3

					if var_4_40 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_40 + var_4_32
					end
				end

				arg_1_1.text_.text = var_4_37
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671001", "story_v_out_319671.awb") ~= 0 then
					local var_4_41 = manager.audio:GetVoiceLength("story_v_out_319671", "319671001", "story_v_out_319671.awb") / 1000

					if var_4_41 + var_4_32 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_41 + var_4_32
					end

					if var_4_36.prefab_name ~= "" and arg_1_1.actors_[var_4_36.prefab_name] ~= nil then
						local var_4_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_36.prefab_name].transform, "story_v_out_319671", "319671001", "story_v_out_319671.awb")

						arg_1_1:RecordAudio("319671001", var_4_42)
						arg_1_1:RecordAudio("319671001", var_4_42)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319671", "319671001", "story_v_out_319671.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319671", "319671001", "story_v_out_319671.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_43 = var_4_32 + 0.3
			local var_4_44 = math.max(var_4_33, arg_1_1.talkMaxDuration)

			if var_4_43 <= arg_1_1.time_ and arg_1_1.time_ < var_4_43 + var_4_44 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_43) / var_4_44

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_43 + var_4_44 and arg_1_1.time_ < var_4_43 + var_4_44 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319671002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319671002
		arg_7_1.duration_ = 1.633

		local var_7_0 = {
			zh = 1.633,
			ja = 1.433
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
				arg_7_0:Play319671003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.175

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(319671002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671002", "story_v_out_319671.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_319671", "319671002", "story_v_out_319671.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_319671", "319671002", "story_v_out_319671.awb")

						arg_7_1:RecordAudio("319671002", var_10_9)
						arg_7_1:RecordAudio("319671002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319671", "319671002", "story_v_out_319671.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319671", "319671002", "story_v_out_319671.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_10 = math.max(var_10_1, arg_7_1.talkMaxDuration)

			if var_10_0 <= arg_7_1.time_ and arg_7_1.time_ < var_10_0 + var_10_10 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_0) / var_10_10

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_0 + var_10_10 and arg_7_1.time_ < var_10_0 + var_10_10 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319671003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319671003
		arg_11_1.duration_ = 2.033

		local var_11_0 = {
			zh = 1.1,
			ja = 2.033
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
				arg_11_0:Play319671004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.075

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[694].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(319671003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671003", "story_v_out_319671.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_319671", "319671003", "story_v_out_319671.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_319671", "319671003", "story_v_out_319671.awb")

						arg_11_1:RecordAudio("319671003", var_14_9)
						arg_11_1:RecordAudio("319671003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319671", "319671003", "story_v_out_319671.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319671", "319671003", "story_v_out_319671.awb")
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
	Play319671004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319671004
		arg_15_1.duration_ = 7

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play319671005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "I12g"

			if arg_15_1.bgs_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(arg_15_1.paintGo_)

				var_18_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_18_0)
				var_18_1.name = var_18_0
				var_18_1.transform.parent = arg_15_1.stage_.transform
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.bgs_[var_18_0] = var_18_1
			end

			local var_18_2 = 0

			if var_18_2 < arg_15_1.time_ and arg_15_1.time_ <= var_18_2 + arg_18_0 then
				local var_18_3 = manager.ui.mainCamera.transform.localPosition
				local var_18_4 = Vector3.New(0, 0, 10) + Vector3.New(var_18_3.x, var_18_3.y, 0)
				local var_18_5 = arg_15_1.bgs_.I12g

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
					if iter_18_0 ~= "I12g" then
						iter_18_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				arg_15_1.allBtn_.enabled = false
			end

			local var_18_17 = 0.3

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 then
				arg_15_1.allBtn_.enabled = true
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1.mask_.enabled = true
				arg_15_1.mask_.raycastTarget = true

				arg_15_1:SetGaussion(false)
			end

			local var_18_19 = 2

			if var_18_18 <= arg_15_1.time_ and arg_15_1.time_ < var_18_18 + var_18_19 then
				local var_18_20 = (arg_15_1.time_ - var_18_18) / var_18_19
				local var_18_21 = Color.New(0, 0, 0)

				var_18_21.a = Mathf.Lerp(1, 0, var_18_20)
				arg_15_1.mask_.color = var_18_21
			end

			if arg_15_1.time_ >= var_18_18 + var_18_19 and arg_15_1.time_ < var_18_18 + var_18_19 + arg_18_0 then
				local var_18_22 = Color.New(0, 0, 0)
				local var_18_23 = 0

				arg_15_1.mask_.enabled = false
				var_18_22.a = var_18_23
				arg_15_1.mask_.color = var_18_22
			end

			if arg_15_1.frameCnt_ <= 1 then
				arg_15_1.dialog_:SetActive(false)
			end

			local var_18_24 = 2
			local var_18_25 = 1.125

			if var_18_24 < arg_15_1.time_ and arg_15_1.time_ <= var_18_24 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0

				arg_15_1.dialog_:SetActive(true)

				local var_18_26 = LeanTween.value(arg_15_1.dialog_, 0, 1, 0.3)

				var_18_26:setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
					arg_15_1.dialogCg_.alpha = arg_19_0
				end))
				var_18_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_15_1.dialog_)
					var_18_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_15_1.duration_ = arg_15_1.duration_ + 0.3

				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_27 = arg_15_1:GetWordFromCfg(319671004)
				local var_18_28 = arg_15_1:FormatText(var_18_27.content)

				arg_15_1.text_.text = var_18_28

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_29 = 45
				local var_18_30 = utf8.len(var_18_28)
				local var_18_31 = var_18_29 <= 0 and var_18_25 or var_18_25 * (var_18_30 / var_18_29)

				if var_18_31 > 0 and var_18_25 < var_18_31 then
					arg_15_1.talkMaxDuration = var_18_31
					var_18_24 = var_18_24 + 0.3

					if var_18_31 + var_18_24 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_31 + var_18_24
					end
				end

				arg_15_1.text_.text = var_18_28
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_32 = var_18_24 + 0.3
			local var_18_33 = math.max(var_18_25, arg_15_1.talkMaxDuration)

			if var_18_32 <= arg_15_1.time_ and arg_15_1.time_ < var_18_32 + var_18_33 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_32) / var_18_33

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_32 + var_18_33 and arg_15_1.time_ < var_18_32 + var_18_33 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319671005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 319671005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play319671006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 0.725

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

				local var_24_2 = arg_21_1:GetWordFromCfg(319671005)
				local var_24_3 = arg_21_1:FormatText(var_24_2.content)

				arg_21_1.text_.text = var_24_3

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_4 = 29
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
	Play319671006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 319671006
		arg_25_1.duration_ = 4.533

		local var_25_0 = {
			zh = 1.233,
			ja = 4.533
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
				arg_25_0:Play319671007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 0.15

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_2 = arg_25_1:FormatText(StoryNameCfg[694].name)

				arg_25_1.leftNameTxt_.text = var_28_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, true)
				arg_25_1.iconController_:SetSelectedState("hero")

				arg_25_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_3 = arg_25_1:GetWordFromCfg(319671006)
				local var_28_4 = arg_25_1:FormatText(var_28_3.content)

				arg_25_1.text_.text = var_28_4

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671006", "story_v_out_319671.awb") ~= 0 then
					local var_28_8 = manager.audio:GetVoiceLength("story_v_out_319671", "319671006", "story_v_out_319671.awb") / 1000

					if var_28_8 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_8 + var_28_0
					end

					if var_28_3.prefab_name ~= "" and arg_25_1.actors_[var_28_3.prefab_name] ~= nil then
						local var_28_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_3.prefab_name].transform, "story_v_out_319671", "319671006", "story_v_out_319671.awb")

						arg_25_1:RecordAudio("319671006", var_28_9)
						arg_25_1:RecordAudio("319671006", var_28_9)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_319671", "319671006", "story_v_out_319671.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_319671", "319671006", "story_v_out_319671.awb")
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
	Play319671007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 319671007
		arg_29_1.duration_ = 3.733

		local var_29_0 = {
			zh = 1.999999999999,
			ja = 3.733
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
				arg_29_0:Play319671008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = "1084ui_story"

			if arg_29_1.actors_[var_32_0] == nil then
				local var_32_1 = Object.Instantiate(Asset.Load("Char/" .. var_32_0), arg_29_1.stage_.transform)

				var_32_1.name = var_32_0
				var_32_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.actors_[var_32_0] = var_32_1

				local var_32_2 = var_32_1:GetComponentInChildren(typeof(CharacterEffect))

				var_32_2.enabled = true

				local var_32_3 = GameObjectTools.GetOrAddComponent(var_32_1, typeof(DynamicBoneHelper))

				if var_32_3 then
					var_32_3:EnableDynamicBone(false)
				end

				arg_29_1:ShowWeapon(var_32_2.transform, false)

				arg_29_1.var_[var_32_0 .. "Animator"] = var_32_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_29_1.var_[var_32_0 .. "Animator"].applyRootMotion = true
				arg_29_1.var_[var_32_0 .. "LipSync"] = var_32_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_32_4 = arg_29_1.actors_["1084ui_story"].transform
			local var_32_5 = 0

			if var_32_5 < arg_29_1.time_ and arg_29_1.time_ <= var_32_5 + arg_32_0 then
				arg_29_1.var_.moveOldPos1084ui_story = var_32_4.localPosition

				local var_32_6 = "1084ui_story"

				arg_29_1:ShowWeapon(arg_29_1.var_[var_32_6 .. "Animator"].transform, false)
			end

			local var_32_7 = 0.001

			if var_32_5 <= arg_29_1.time_ and arg_29_1.time_ < var_32_5 + var_32_7 then
				local var_32_8 = (arg_29_1.time_ - var_32_5) / var_32_7
				local var_32_9 = Vector3.New(0, -0.97, -6)

				var_32_4.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPos1084ui_story, var_32_9, var_32_8)

				local var_32_10 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_10.x, var_32_10.y, var_32_10.z)

				local var_32_11 = var_32_4.localEulerAngles

				var_32_11.z = 0
				var_32_11.x = 0
				var_32_4.localEulerAngles = var_32_11
			end

			if arg_29_1.time_ >= var_32_5 + var_32_7 and arg_29_1.time_ < var_32_5 + var_32_7 + arg_32_0 then
				var_32_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_32_12 = manager.ui.mainCamera.transform.position - var_32_4.position

				var_32_4.forward = Vector3.New(var_32_12.x, var_32_12.y, var_32_12.z)

				local var_32_13 = var_32_4.localEulerAngles

				var_32_13.z = 0
				var_32_13.x = 0
				var_32_4.localEulerAngles = var_32_13
			end

			local var_32_14 = arg_29_1.actors_["1084ui_story"]
			local var_32_15 = 0

			if var_32_15 < arg_29_1.time_ and arg_29_1.time_ <= var_32_15 + arg_32_0 and arg_29_1.var_.characterEffect1084ui_story == nil then
				arg_29_1.var_.characterEffect1084ui_story = var_32_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_32_16 = 0.200000002980232

			if var_32_15 <= arg_29_1.time_ and arg_29_1.time_ < var_32_15 + var_32_16 then
				local var_32_17 = (arg_29_1.time_ - var_32_15) / var_32_16

				if arg_29_1.var_.characterEffect1084ui_story then
					arg_29_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_29_1.time_ >= var_32_15 + var_32_16 and arg_29_1.time_ < var_32_15 + var_32_16 + arg_32_0 and arg_29_1.var_.characterEffect1084ui_story then
				arg_29_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_32_18 = 0

			if var_32_18 < arg_29_1.time_ and arg_29_1.time_ <= var_32_18 + arg_32_0 then
				arg_29_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_32_19 = 0

			if var_32_19 < arg_29_1.time_ and arg_29_1.time_ <= var_32_19 + arg_32_0 then
				arg_29_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_32_20 = 0
			local var_32_21 = 0.125

			if var_32_20 < arg_29_1.time_ and arg_29_1.time_ <= var_32_20 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_22 = arg_29_1:FormatText(StoryNameCfg[6].name)

				arg_29_1.leftNameTxt_.text = var_32_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_23 = arg_29_1:GetWordFromCfg(319671007)
				local var_32_24 = arg_29_1:FormatText(var_32_23.content)

				arg_29_1.text_.text = var_32_24

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_25 = 5
				local var_32_26 = utf8.len(var_32_24)
				local var_32_27 = var_32_25 <= 0 and var_32_21 or var_32_21 * (var_32_26 / var_32_25)

				if var_32_27 > 0 and var_32_21 < var_32_27 then
					arg_29_1.talkMaxDuration = var_32_27

					if var_32_27 + var_32_20 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_27 + var_32_20
					end
				end

				arg_29_1.text_.text = var_32_24
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671007", "story_v_out_319671.awb") ~= 0 then
					local var_32_28 = manager.audio:GetVoiceLength("story_v_out_319671", "319671007", "story_v_out_319671.awb") / 1000

					if var_32_28 + var_32_20 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_28 + var_32_20
					end

					if var_32_23.prefab_name ~= "" and arg_29_1.actors_[var_32_23.prefab_name] ~= nil then
						local var_32_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_23.prefab_name].transform, "story_v_out_319671", "319671007", "story_v_out_319671.awb")

						arg_29_1:RecordAudio("319671007", var_32_29)
						arg_29_1:RecordAudio("319671007", var_32_29)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_319671", "319671007", "story_v_out_319671.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_319671", "319671007", "story_v_out_319671.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_30 = math.max(var_32_21, arg_29_1.talkMaxDuration)

			if var_32_20 <= arg_29_1.time_ and arg_29_1.time_ < var_32_20 + var_32_30 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_20) / var_32_30

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_20 + var_32_30 and arg_29_1.time_ < var_32_20 + var_32_30 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play319671008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 319671008
		arg_33_1.duration_ = 5.7

		local var_33_0 = {
			zh = 3.466,
			ja = 5.7
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
				arg_33_0:Play319671009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1084ui_story"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.characterEffect1084ui_story == nil then
				arg_33_1.var_.characterEffect1084ui_story = var_36_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_36_2 = 0.200000002980232

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.characterEffect1084ui_story then
					local var_36_4 = Mathf.Lerp(0, 0.5, var_36_3)

					arg_33_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_33_1.var_.characterEffect1084ui_story.fillRatio = var_36_4
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.characterEffect1084ui_story then
				local var_36_5 = 0.5

				arg_33_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_33_1.var_.characterEffect1084ui_story.fillRatio = var_36_5
			end

			local var_36_6 = 0
			local var_36_7 = 0.4

			if var_36_6 < arg_33_1.time_ and arg_33_1.time_ <= var_36_6 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_8 = arg_33_1:FormatText(StoryNameCfg[694].name)

				arg_33_1.leftNameTxt_.text = var_36_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, true)
				arg_33_1.iconController_:SetSelectedState("hero")

				arg_33_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_9 = arg_33_1:GetWordFromCfg(319671008)
				local var_36_10 = arg_33_1:FormatText(var_36_9.content)

				arg_33_1.text_.text = var_36_10

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_11 = 16
				local var_36_12 = utf8.len(var_36_10)
				local var_36_13 = var_36_11 <= 0 and var_36_7 or var_36_7 * (var_36_12 / var_36_11)

				if var_36_13 > 0 and var_36_7 < var_36_13 then
					arg_33_1.talkMaxDuration = var_36_13

					if var_36_13 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_13 + var_36_6
					end
				end

				arg_33_1.text_.text = var_36_10
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671008", "story_v_out_319671.awb") ~= 0 then
					local var_36_14 = manager.audio:GetVoiceLength("story_v_out_319671", "319671008", "story_v_out_319671.awb") / 1000

					if var_36_14 + var_36_6 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_14 + var_36_6
					end

					if var_36_9.prefab_name ~= "" and arg_33_1.actors_[var_36_9.prefab_name] ~= nil then
						local var_36_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_9.prefab_name].transform, "story_v_out_319671", "319671008", "story_v_out_319671.awb")

						arg_33_1:RecordAudio("319671008", var_36_15)
						arg_33_1:RecordAudio("319671008", var_36_15)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_319671", "319671008", "story_v_out_319671.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_319671", "319671008", "story_v_out_319671.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_16 = math.max(var_36_7, arg_33_1.talkMaxDuration)

			if var_36_6 <= arg_33_1.time_ and arg_33_1.time_ < var_36_6 + var_36_16 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_6) / var_36_16

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_6 + var_36_16 and arg_33_1.time_ < var_36_6 + var_36_16 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play319671009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 319671009
		arg_37_1.duration_ = 9.066

		local var_37_0 = {
			zh = 6.366,
			ja = 9.066
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
				arg_37_0:Play319671010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = "1095ui_story"

			if arg_37_1.actors_[var_40_0] == nil then
				local var_40_1 = Object.Instantiate(Asset.Load("Char/" .. var_40_0), arg_37_1.stage_.transform)

				var_40_1.name = var_40_0
				var_40_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_37_1.actors_[var_40_0] = var_40_1

				local var_40_2 = var_40_1:GetComponentInChildren(typeof(CharacterEffect))

				var_40_2.enabled = true

				local var_40_3 = GameObjectTools.GetOrAddComponent(var_40_1, typeof(DynamicBoneHelper))

				if var_40_3 then
					var_40_3:EnableDynamicBone(false)
				end

				arg_37_1:ShowWeapon(var_40_2.transform, false)

				arg_37_1.var_[var_40_0 .. "Animator"] = var_40_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_37_1.var_[var_40_0 .. "Animator"].applyRootMotion = true
				arg_37_1.var_[var_40_0 .. "LipSync"] = var_40_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_40_4 = arg_37_1.actors_["1095ui_story"].transform
			local var_40_5 = 0

			if var_40_5 < arg_37_1.time_ and arg_37_1.time_ <= var_40_5 + arg_40_0 then
				arg_37_1.var_.moveOldPos1095ui_story = var_40_4.localPosition
			end

			local var_40_6 = 0.001

			if var_40_5 <= arg_37_1.time_ and arg_37_1.time_ < var_40_5 + var_40_6 then
				local var_40_7 = (arg_37_1.time_ - var_40_5) / var_40_6
				local var_40_8 = Vector3.New(0, -0.98, -6.1)

				var_40_4.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1095ui_story, var_40_8, var_40_7)

				local var_40_9 = manager.ui.mainCamera.transform.position - var_40_4.position

				var_40_4.forward = Vector3.New(var_40_9.x, var_40_9.y, var_40_9.z)

				local var_40_10 = var_40_4.localEulerAngles

				var_40_10.z = 0
				var_40_10.x = 0
				var_40_4.localEulerAngles = var_40_10
			end

			if arg_37_1.time_ >= var_40_5 + var_40_6 and arg_37_1.time_ < var_40_5 + var_40_6 + arg_40_0 then
				var_40_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_40_11 = manager.ui.mainCamera.transform.position - var_40_4.position

				var_40_4.forward = Vector3.New(var_40_11.x, var_40_11.y, var_40_11.z)

				local var_40_12 = var_40_4.localEulerAngles

				var_40_12.z = 0
				var_40_12.x = 0
				var_40_4.localEulerAngles = var_40_12
			end

			local var_40_13 = arg_37_1.actors_["1095ui_story"]
			local var_40_14 = 0

			if var_40_14 < arg_37_1.time_ and arg_37_1.time_ <= var_40_14 + arg_40_0 and arg_37_1.var_.characterEffect1095ui_story == nil then
				arg_37_1.var_.characterEffect1095ui_story = var_40_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_15 = 0.200000002980232

			if var_40_14 <= arg_37_1.time_ and arg_37_1.time_ < var_40_14 + var_40_15 then
				local var_40_16 = (arg_37_1.time_ - var_40_14) / var_40_15

				if arg_37_1.var_.characterEffect1095ui_story then
					arg_37_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_37_1.time_ >= var_40_14 + var_40_15 and arg_37_1.time_ < var_40_14 + var_40_15 + arg_40_0 and arg_37_1.var_.characterEffect1095ui_story then
				arg_37_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_40_17 = 0

			if var_40_17 < arg_37_1.time_ and arg_37_1.time_ <= var_40_17 + arg_40_0 then
				arg_37_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_40_18 = 0

			if var_40_18 < arg_37_1.time_ and arg_37_1.time_ <= var_40_18 + arg_40_0 then
				arg_37_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_40_19 = arg_37_1.actors_["1084ui_story"].transform
			local var_40_20 = 0

			if var_40_20 < arg_37_1.time_ and arg_37_1.time_ <= var_40_20 + arg_40_0 then
				arg_37_1.var_.moveOldPos1084ui_story = var_40_19.localPosition
			end

			local var_40_21 = 0.001

			if var_40_20 <= arg_37_1.time_ and arg_37_1.time_ < var_40_20 + var_40_21 then
				local var_40_22 = (arg_37_1.time_ - var_40_20) / var_40_21
				local var_40_23 = Vector3.New(0, 100, 0)

				var_40_19.localPosition = Vector3.Lerp(arg_37_1.var_.moveOldPos1084ui_story, var_40_23, var_40_22)

				local var_40_24 = manager.ui.mainCamera.transform.position - var_40_19.position

				var_40_19.forward = Vector3.New(var_40_24.x, var_40_24.y, var_40_24.z)

				local var_40_25 = var_40_19.localEulerAngles

				var_40_25.z = 0
				var_40_25.x = 0
				var_40_19.localEulerAngles = var_40_25
			end

			if arg_37_1.time_ >= var_40_20 + var_40_21 and arg_37_1.time_ < var_40_20 + var_40_21 + arg_40_0 then
				var_40_19.localPosition = Vector3.New(0, 100, 0)

				local var_40_26 = manager.ui.mainCamera.transform.position - var_40_19.position

				var_40_19.forward = Vector3.New(var_40_26.x, var_40_26.y, var_40_26.z)

				local var_40_27 = var_40_19.localEulerAngles

				var_40_27.z = 0
				var_40_27.x = 0
				var_40_19.localEulerAngles = var_40_27
			end

			local var_40_28 = arg_37_1.actors_["1084ui_story"]
			local var_40_29 = 0

			if var_40_29 < arg_37_1.time_ and arg_37_1.time_ <= var_40_29 + arg_40_0 and arg_37_1.var_.characterEffect1084ui_story == nil then
				arg_37_1.var_.characterEffect1084ui_story = var_40_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_40_30 = 0.200000002980232

			if var_40_29 <= arg_37_1.time_ and arg_37_1.time_ < var_40_29 + var_40_30 then
				local var_40_31 = (arg_37_1.time_ - var_40_29) / var_40_30

				if arg_37_1.var_.characterEffect1084ui_story then
					local var_40_32 = Mathf.Lerp(0, 0.5, var_40_31)

					arg_37_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_37_1.var_.characterEffect1084ui_story.fillRatio = var_40_32
				end
			end

			if arg_37_1.time_ >= var_40_29 + var_40_30 and arg_37_1.time_ < var_40_29 + var_40_30 + arg_40_0 and arg_37_1.var_.characterEffect1084ui_story then
				local var_40_33 = 0.5

				arg_37_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_37_1.var_.characterEffect1084ui_story.fillRatio = var_40_33
			end

			local var_40_34 = 0
			local var_40_35 = 0.75

			if var_40_34 < arg_37_1.time_ and arg_37_1.time_ <= var_40_34 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_36 = arg_37_1:FormatText(StoryNameCfg[471].name)

				arg_37_1.leftNameTxt_.text = var_40_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_37 = arg_37_1:GetWordFromCfg(319671009)
				local var_40_38 = arg_37_1:FormatText(var_40_37.content)

				arg_37_1.text_.text = var_40_38

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_39 = 30
				local var_40_40 = utf8.len(var_40_38)
				local var_40_41 = var_40_39 <= 0 and var_40_35 or var_40_35 * (var_40_40 / var_40_39)

				if var_40_41 > 0 and var_40_35 < var_40_41 then
					arg_37_1.talkMaxDuration = var_40_41

					if var_40_41 + var_40_34 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_41 + var_40_34
					end
				end

				arg_37_1.text_.text = var_40_38
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671009", "story_v_out_319671.awb") ~= 0 then
					local var_40_42 = manager.audio:GetVoiceLength("story_v_out_319671", "319671009", "story_v_out_319671.awb") / 1000

					if var_40_42 + var_40_34 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_42 + var_40_34
					end

					if var_40_37.prefab_name ~= "" and arg_37_1.actors_[var_40_37.prefab_name] ~= nil then
						local var_40_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_37.prefab_name].transform, "story_v_out_319671", "319671009", "story_v_out_319671.awb")

						arg_37_1:RecordAudio("319671009", var_40_43)
						arg_37_1:RecordAudio("319671009", var_40_43)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_319671", "319671009", "story_v_out_319671.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_319671", "319671009", "story_v_out_319671.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_44 = math.max(var_40_35, arg_37_1.talkMaxDuration)

			if var_40_34 <= arg_37_1.time_ and arg_37_1.time_ < var_40_34 + var_40_44 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_34) / var_40_44

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_34 + var_40_44 and arg_37_1.time_ < var_40_34 + var_40_44 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play319671010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 319671010
		arg_41_1.duration_ = 2

		local var_41_0 = {
			zh = 2,
			ja = 0.999999999999
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
				arg_41_0:Play319671011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1095ui_story"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.characterEffect1095ui_story == nil then
				arg_41_1.var_.characterEffect1095ui_story = var_44_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_2 = 0.200000002980232

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.characterEffect1095ui_story then
					local var_44_4 = Mathf.Lerp(0, 0.5, var_44_3)

					arg_41_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_41_1.var_.characterEffect1095ui_story.fillRatio = var_44_4
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.characterEffect1095ui_story then
				local var_44_5 = 0.5

				arg_41_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_41_1.var_.characterEffect1095ui_story.fillRatio = var_44_5
			end

			local var_44_6 = 0
			local var_44_7 = 0.175

			if var_44_6 < arg_41_1.time_ and arg_41_1.time_ <= var_44_6 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_8 = arg_41_1:FormatText(StoryNameCfg[694].name)

				arg_41_1.leftNameTxt_.text = var_44_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, true)
				arg_41_1.iconController_:SetSelectedState("hero")

				arg_41_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10091")

				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_9 = arg_41_1:GetWordFromCfg(319671010)
				local var_44_10 = arg_41_1:FormatText(var_44_9.content)

				arg_41_1.text_.text = var_44_10

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_11 = 7
				local var_44_12 = utf8.len(var_44_10)
				local var_44_13 = var_44_11 <= 0 and var_44_7 or var_44_7 * (var_44_12 / var_44_11)

				if var_44_13 > 0 and var_44_7 < var_44_13 then
					arg_41_1.talkMaxDuration = var_44_13

					if var_44_13 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_13 + var_44_6
					end
				end

				arg_41_1.text_.text = var_44_10
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671010", "story_v_out_319671.awb") ~= 0 then
					local var_44_14 = manager.audio:GetVoiceLength("story_v_out_319671", "319671010", "story_v_out_319671.awb") / 1000

					if var_44_14 + var_44_6 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_14 + var_44_6
					end

					if var_44_9.prefab_name ~= "" and arg_41_1.actors_[var_44_9.prefab_name] ~= nil then
						local var_44_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_9.prefab_name].transform, "story_v_out_319671", "319671010", "story_v_out_319671.awb")

						arg_41_1:RecordAudio("319671010", var_44_15)
						arg_41_1:RecordAudio("319671010", var_44_15)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_319671", "319671010", "story_v_out_319671.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_319671", "319671010", "story_v_out_319671.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_16 = math.max(var_44_7, arg_41_1.talkMaxDuration)

			if var_44_6 <= arg_41_1.time_ and arg_41_1.time_ < var_44_6 + var_44_16 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_6) / var_44_16

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_6 + var_44_16 and arg_41_1.time_ < var_44_6 + var_44_16 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play319671011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 319671011
		arg_45_1.duration_ = 5

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play319671012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1095ui_story"].transform
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 then
				arg_45_1.var_.moveOldPos1095ui_story = var_48_0.localPosition
			end

			local var_48_2 = 0.001

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2
				local var_48_4 = Vector3.New(0, 100, 0)

				var_48_0.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1095ui_story, var_48_4, var_48_3)

				local var_48_5 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_5.x, var_48_5.y, var_48_5.z)

				local var_48_6 = var_48_0.localEulerAngles

				var_48_6.z = 0
				var_48_6.x = 0
				var_48_0.localEulerAngles = var_48_6
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 then
				var_48_0.localPosition = Vector3.New(0, 100, 0)

				local var_48_7 = manager.ui.mainCamera.transform.position - var_48_0.position

				var_48_0.forward = Vector3.New(var_48_7.x, var_48_7.y, var_48_7.z)

				local var_48_8 = var_48_0.localEulerAngles

				var_48_8.z = 0
				var_48_8.x = 0
				var_48_0.localEulerAngles = var_48_8
			end

			local var_48_9 = 0
			local var_48_10 = 1.175

			if var_48_9 < arg_45_1.time_ and arg_45_1.time_ <= var_48_9 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_11 = arg_45_1:GetWordFromCfg(319671011)
				local var_48_12 = arg_45_1:FormatText(var_48_11.content)

				arg_45_1.text_.text = var_48_12

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_13 = 47
				local var_48_14 = utf8.len(var_48_12)
				local var_48_15 = var_48_13 <= 0 and var_48_10 or var_48_10 * (var_48_14 / var_48_13)

				if var_48_15 > 0 and var_48_10 < var_48_15 then
					arg_45_1.talkMaxDuration = var_48_15

					if var_48_15 + var_48_9 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_15 + var_48_9
					end
				end

				arg_45_1.text_.text = var_48_12
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_16 = math.max(var_48_10, arg_45_1.talkMaxDuration)

			if var_48_9 <= arg_45_1.time_ and arg_45_1.time_ < var_48_9 + var_48_16 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_9) / var_48_16

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_9 + var_48_16 and arg_45_1.time_ < var_48_9 + var_48_16 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play319671012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 319671012
		arg_49_1.duration_ = 8.86666666666667

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play319671013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = "D10"

			if arg_49_1.bgs_[var_52_0] == nil then
				local var_52_1 = Object.Instantiate(arg_49_1.paintGo_)

				var_52_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_52_0)
				var_52_1.name = var_52_0
				var_52_1.transform.parent = arg_49_1.stage_.transform
				var_52_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.bgs_[var_52_0] = var_52_1
			end

			local var_52_2 = 2

			if var_52_2 < arg_49_1.time_ and arg_49_1.time_ <= var_52_2 + arg_52_0 then
				local var_52_3 = manager.ui.mainCamera.transform.localPosition
				local var_52_4 = Vector3.New(0, 0, 10) + Vector3.New(var_52_3.x, var_52_3.y, 0)
				local var_52_5 = arg_49_1.bgs_.D10

				var_52_5.transform.localPosition = var_52_4
				var_52_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_52_6 = var_52_5:GetComponent("SpriteRenderer")

				if var_52_6 and var_52_6.sprite then
					local var_52_7 = (var_52_5.transform.localPosition - var_52_3).z
					local var_52_8 = manager.ui.mainCameraCom_
					local var_52_9 = 2 * var_52_7 * Mathf.Tan(var_52_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_52_10 = var_52_9 * var_52_8.aspect
					local var_52_11 = var_52_6.sprite.bounds.size.x
					local var_52_12 = var_52_6.sprite.bounds.size.y
					local var_52_13 = var_52_10 / var_52_11
					local var_52_14 = var_52_9 / var_52_12
					local var_52_15 = var_52_14 < var_52_13 and var_52_13 or var_52_14

					var_52_5.transform.localScale = Vector3.New(var_52_15, var_52_15, 0)
				end

				for iter_52_0, iter_52_1 in pairs(arg_49_1.bgs_) do
					if iter_52_0 ~= "D10" then
						iter_52_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_52_16 = 0

			if var_52_16 < arg_49_1.time_ and arg_49_1.time_ <= var_52_16 + arg_52_0 then
				arg_49_1.allBtn_.enabled = false
			end

			local var_52_17 = 0.3

			if arg_49_1.time_ >= var_52_16 + var_52_17 and arg_49_1.time_ < var_52_16 + var_52_17 + arg_52_0 then
				arg_49_1.allBtn_.enabled = true
			end

			local var_52_18 = 0

			if var_52_18 < arg_49_1.time_ and arg_49_1.time_ <= var_52_18 + arg_52_0 then
				arg_49_1.mask_.enabled = true
				arg_49_1.mask_.raycastTarget = true

				arg_49_1:SetGaussion(false)
			end

			local var_52_19 = 2

			if var_52_18 <= arg_49_1.time_ and arg_49_1.time_ < var_52_18 + var_52_19 then
				local var_52_20 = (arg_49_1.time_ - var_52_18) / var_52_19
				local var_52_21 = Color.New(0, 0, 0)

				var_52_21.a = Mathf.Lerp(0, 1, var_52_20)
				arg_49_1.mask_.color = var_52_21
			end

			if arg_49_1.time_ >= var_52_18 + var_52_19 and arg_49_1.time_ < var_52_18 + var_52_19 + arg_52_0 then
				local var_52_22 = Color.New(0, 0, 0)

				var_52_22.a = 1
				arg_49_1.mask_.color = var_52_22
			end

			local var_52_23 = 2

			if var_52_23 < arg_49_1.time_ and arg_49_1.time_ <= var_52_23 + arg_52_0 then
				arg_49_1.mask_.enabled = true
				arg_49_1.mask_.raycastTarget = true

				arg_49_1:SetGaussion(false)
			end

			local var_52_24 = 2

			if var_52_23 <= arg_49_1.time_ and arg_49_1.time_ < var_52_23 + var_52_24 then
				local var_52_25 = (arg_49_1.time_ - var_52_23) / var_52_24
				local var_52_26 = Color.New(0, 0, 0)

				var_52_26.a = Mathf.Lerp(1, 0, var_52_25)
				arg_49_1.mask_.color = var_52_26
			end

			if arg_49_1.time_ >= var_52_23 + var_52_24 and arg_49_1.time_ < var_52_23 + var_52_24 + arg_52_0 then
				local var_52_27 = Color.New(0, 0, 0)
				local var_52_28 = 0

				arg_49_1.mask_.enabled = false
				var_52_27.a = var_52_28
				arg_49_1.mask_.color = var_52_27
			end

			if arg_49_1.frameCnt_ <= 1 then
				arg_49_1.dialog_:SetActive(false)
			end

			local var_52_29 = 3.86666666666667
			local var_52_30 = 0.975

			if var_52_29 < arg_49_1.time_ and arg_49_1.time_ <= var_52_29 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_31 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_31:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_32 = arg_49_1:GetWordFromCfg(319671012)
				local var_52_33 = arg_49_1:FormatText(var_52_32.content)

				arg_49_1.text_.text = var_52_33

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_34 = 39
				local var_52_35 = utf8.len(var_52_33)
				local var_52_36 = var_52_34 <= 0 and var_52_30 or var_52_30 * (var_52_35 / var_52_34)

				if var_52_36 > 0 and var_52_30 < var_52_36 then
					arg_49_1.talkMaxDuration = var_52_36
					var_52_29 = var_52_29 + 0.3

					if var_52_36 + var_52_29 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_36 + var_52_29
					end
				end

				arg_49_1.text_.text = var_52_33
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_37 = var_52_29 + 0.3
			local var_52_38 = math.max(var_52_30, arg_49_1.talkMaxDuration)

			if var_52_37 <= arg_49_1.time_ and arg_49_1.time_ < var_52_37 + var_52_38 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_37) / var_52_38

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_37 + var_52_38 and arg_49_1.time_ < var_52_37 + var_52_38 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play319671013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319671013
		arg_55_1.duration_ = 5.566

		local var_55_0 = {
			zh = 4.766,
			ja = 5.566
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
				arg_55_0:Play319671014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1084ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1084ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, -0.97, -6)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1084ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1084ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1084ui_story == nil then
				arg_55_1.var_.characterEffect1084ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1084ui_story then
					arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1084ui_story then
				arg_55_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_58_14 = 0

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_58_15 = 0
			local var_58_16 = 0.625

			if var_58_15 < arg_55_1.time_ and arg_55_1.time_ <= var_58_15 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_17 = arg_55_1:FormatText(StoryNameCfg[6].name)

				arg_55_1.leftNameTxt_.text = var_58_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_18 = arg_55_1:GetWordFromCfg(319671013)
				local var_58_19 = arg_55_1:FormatText(var_58_18.content)

				arg_55_1.text_.text = var_58_19

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_20 = 25
				local var_58_21 = utf8.len(var_58_19)
				local var_58_22 = var_58_20 <= 0 and var_58_16 or var_58_16 * (var_58_21 / var_58_20)

				if var_58_22 > 0 and var_58_16 < var_58_22 then
					arg_55_1.talkMaxDuration = var_58_22

					if var_58_22 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_22 + var_58_15
					end
				end

				arg_55_1.text_.text = var_58_19
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671013", "story_v_out_319671.awb") ~= 0 then
					local var_58_23 = manager.audio:GetVoiceLength("story_v_out_319671", "319671013", "story_v_out_319671.awb") / 1000

					if var_58_23 + var_58_15 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_23 + var_58_15
					end

					if var_58_18.prefab_name ~= "" and arg_55_1.actors_[var_58_18.prefab_name] ~= nil then
						local var_58_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_18.prefab_name].transform, "story_v_out_319671", "319671013", "story_v_out_319671.awb")

						arg_55_1:RecordAudio("319671013", var_58_24)
						arg_55_1:RecordAudio("319671013", var_58_24)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_319671", "319671013", "story_v_out_319671.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_319671", "319671013", "story_v_out_319671.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_25 = math.max(var_58_16, arg_55_1.talkMaxDuration)

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_25 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_15) / var_58_25

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_15 + var_58_25 and arg_55_1.time_ < var_58_15 + var_58_25 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play319671014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319671014
		arg_59_1.duration_ = 3.433

		local var_59_0 = {
			zh = 3.433,
			ja = 2.633
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
				arg_59_0:Play319671015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1084ui_story"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story == nil then
				arg_59_1.var_.characterEffect1084ui_story = var_62_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_2 = 0.200000002980232

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_2 then
				local var_62_3 = (arg_59_1.time_ - var_62_1) / var_62_2

				if arg_59_1.var_.characterEffect1084ui_story then
					local var_62_4 = Mathf.Lerp(0, 0.5, var_62_3)

					arg_59_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1084ui_story.fillRatio = var_62_4
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_2 and arg_59_1.time_ < var_62_1 + var_62_2 + arg_62_0 and arg_59_1.var_.characterEffect1084ui_story then
				local var_62_5 = 0.5

				arg_59_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1084ui_story.fillRatio = var_62_5
			end

			local var_62_6 = arg_59_1.actors_["1095ui_story"].transform
			local var_62_7 = 0

			if var_62_7 < arg_59_1.time_ and arg_59_1.time_ <= var_62_7 + arg_62_0 then
				arg_59_1.var_.moveOldPos1095ui_story = var_62_6.localPosition
			end

			local var_62_8 = 0.001

			if var_62_7 <= arg_59_1.time_ and arg_59_1.time_ < var_62_7 + var_62_8 then
				local var_62_9 = (arg_59_1.time_ - var_62_7) / var_62_8
				local var_62_10 = Vector3.New(0.7, -0.98, -6.1)

				var_62_6.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1095ui_story, var_62_10, var_62_9)

				local var_62_11 = manager.ui.mainCamera.transform.position - var_62_6.position

				var_62_6.forward = Vector3.New(var_62_11.x, var_62_11.y, var_62_11.z)

				local var_62_12 = var_62_6.localEulerAngles

				var_62_12.z = 0
				var_62_12.x = 0
				var_62_6.localEulerAngles = var_62_12
			end

			if arg_59_1.time_ >= var_62_7 + var_62_8 and arg_59_1.time_ < var_62_7 + var_62_8 + arg_62_0 then
				var_62_6.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_62_13 = manager.ui.mainCamera.transform.position - var_62_6.position

				var_62_6.forward = Vector3.New(var_62_13.x, var_62_13.y, var_62_13.z)

				local var_62_14 = var_62_6.localEulerAngles

				var_62_14.z = 0
				var_62_14.x = 0
				var_62_6.localEulerAngles = var_62_14
			end

			local var_62_15 = arg_59_1.actors_["1084ui_story"].transform
			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 then
				arg_59_1.var_.moveOldPos1084ui_story = var_62_15.localPosition
			end

			local var_62_17 = 0.001

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_17 then
				local var_62_18 = (arg_59_1.time_ - var_62_16) / var_62_17
				local var_62_19 = Vector3.New(-0.7, -0.97, -6)

				var_62_15.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1084ui_story, var_62_19, var_62_18)

				local var_62_20 = manager.ui.mainCamera.transform.position - var_62_15.position

				var_62_15.forward = Vector3.New(var_62_20.x, var_62_20.y, var_62_20.z)

				local var_62_21 = var_62_15.localEulerAngles

				var_62_21.z = 0
				var_62_21.x = 0
				var_62_15.localEulerAngles = var_62_21
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 then
				var_62_15.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_62_22 = manager.ui.mainCamera.transform.position - var_62_15.position

				var_62_15.forward = Vector3.New(var_62_22.x, var_62_22.y, var_62_22.z)

				local var_62_23 = var_62_15.localEulerAngles

				var_62_23.z = 0
				var_62_23.x = 0
				var_62_15.localEulerAngles = var_62_23
			end

			local var_62_24 = arg_59_1.actors_["1095ui_story"]
			local var_62_25 = 0

			if var_62_25 < arg_59_1.time_ and arg_59_1.time_ <= var_62_25 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story == nil then
				arg_59_1.var_.characterEffect1095ui_story = var_62_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_26 = 0.200000002980232

			if var_62_25 <= arg_59_1.time_ and arg_59_1.time_ < var_62_25 + var_62_26 then
				local var_62_27 = (arg_59_1.time_ - var_62_25) / var_62_26

				if arg_59_1.var_.characterEffect1095ui_story then
					arg_59_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_25 + var_62_26 and arg_59_1.time_ < var_62_25 + var_62_26 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story then
				arg_59_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_62_28 = 0

			if var_62_28 < arg_59_1.time_ and arg_59_1.time_ <= var_62_28 + arg_62_0 then
				arg_59_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_62_29 = 0

			if var_62_29 < arg_59_1.time_ and arg_59_1.time_ <= var_62_29 + arg_62_0 then
				arg_59_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_62_30 = 0
			local var_62_31 = 0.425

			if var_62_30 < arg_59_1.time_ and arg_59_1.time_ <= var_62_30 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_32 = arg_59_1:FormatText(StoryNameCfg[471].name)

				arg_59_1.leftNameTxt_.text = var_62_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_33 = arg_59_1:GetWordFromCfg(319671014)
				local var_62_34 = arg_59_1:FormatText(var_62_33.content)

				arg_59_1.text_.text = var_62_34

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_35 = 17
				local var_62_36 = utf8.len(var_62_34)
				local var_62_37 = var_62_35 <= 0 and var_62_31 or var_62_31 * (var_62_36 / var_62_35)

				if var_62_37 > 0 and var_62_31 < var_62_37 then
					arg_59_1.talkMaxDuration = var_62_37

					if var_62_37 + var_62_30 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_37 + var_62_30
					end
				end

				arg_59_1.text_.text = var_62_34
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671014", "story_v_out_319671.awb") ~= 0 then
					local var_62_38 = manager.audio:GetVoiceLength("story_v_out_319671", "319671014", "story_v_out_319671.awb") / 1000

					if var_62_38 + var_62_30 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_38 + var_62_30
					end

					if var_62_33.prefab_name ~= "" and arg_59_1.actors_[var_62_33.prefab_name] ~= nil then
						local var_62_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_33.prefab_name].transform, "story_v_out_319671", "319671014", "story_v_out_319671.awb")

						arg_59_1:RecordAudio("319671014", var_62_39)
						arg_59_1:RecordAudio("319671014", var_62_39)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_319671", "319671014", "story_v_out_319671.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_319671", "319671014", "story_v_out_319671.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_40 = math.max(var_62_31, arg_59_1.talkMaxDuration)

			if var_62_30 <= arg_59_1.time_ and arg_59_1.time_ < var_62_30 + var_62_40 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_30) / var_62_40

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_30 + var_62_40 and arg_59_1.time_ < var_62_30 + var_62_40 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319671015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319671015
		arg_63_1.duration_ = 8.333

		local var_63_0 = {
			zh = 4.8,
			ja = 8.333
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
				arg_63_0:Play319671016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1084ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.200000002980232

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1084ui_story then
					arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story then
				arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_66_4 = arg_63_1.actors_["1095ui_story"]
			local var_66_5 = 0

			if var_66_5 < arg_63_1.time_ and arg_63_1.time_ <= var_66_5 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story == nil then
				arg_63_1.var_.characterEffect1095ui_story = var_66_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_6 = 0.200000002980232

			if var_66_5 <= arg_63_1.time_ and arg_63_1.time_ < var_66_5 + var_66_6 then
				local var_66_7 = (arg_63_1.time_ - var_66_5) / var_66_6

				if arg_63_1.var_.characterEffect1095ui_story then
					local var_66_8 = Mathf.Lerp(0, 0.5, var_66_7)

					arg_63_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1095ui_story.fillRatio = var_66_8
				end
			end

			if arg_63_1.time_ >= var_66_5 + var_66_6 and arg_63_1.time_ < var_66_5 + var_66_6 + arg_66_0 and arg_63_1.var_.characterEffect1095ui_story then
				local var_66_9 = 0.5

				arg_63_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1095ui_story.fillRatio = var_66_9
			end

			local var_66_10 = 0
			local var_66_11 = 0.5

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_12 = arg_63_1:FormatText(StoryNameCfg[6].name)

				arg_63_1.leftNameTxt_.text = var_66_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_13 = arg_63_1:GetWordFromCfg(319671015)
				local var_66_14 = arg_63_1:FormatText(var_66_13.content)

				arg_63_1.text_.text = var_66_14

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_15 = 20
				local var_66_16 = utf8.len(var_66_14)
				local var_66_17 = var_66_15 <= 0 and var_66_11 or var_66_11 * (var_66_16 / var_66_15)

				if var_66_17 > 0 and var_66_11 < var_66_17 then
					arg_63_1.talkMaxDuration = var_66_17

					if var_66_17 + var_66_10 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_17 + var_66_10
					end
				end

				arg_63_1.text_.text = var_66_14
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671015", "story_v_out_319671.awb") ~= 0 then
					local var_66_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671015", "story_v_out_319671.awb") / 1000

					if var_66_18 + var_66_10 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_18 + var_66_10
					end

					if var_66_13.prefab_name ~= "" and arg_63_1.actors_[var_66_13.prefab_name] ~= nil then
						local var_66_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_13.prefab_name].transform, "story_v_out_319671", "319671015", "story_v_out_319671.awb")

						arg_63_1:RecordAudio("319671015", var_66_19)
						arg_63_1:RecordAudio("319671015", var_66_19)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_319671", "319671015", "story_v_out_319671.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_319671", "319671015", "story_v_out_319671.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_20 = math.max(var_66_11, arg_63_1.talkMaxDuration)

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_20 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_10) / var_66_20

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_10 + var_66_20 and arg_63_1.time_ < var_66_10 + var_66_20 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play319671016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 319671016
		arg_67_1.duration_ = 4.9

		local var_67_0 = {
			zh = 4.333,
			ja = 4.9
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
				arg_67_0:Play319671017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_70_1 = 0
			local var_70_2 = 0.55

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_3 = arg_67_1:FormatText(StoryNameCfg[6].name)

				arg_67_1.leftNameTxt_.text = var_70_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_4 = arg_67_1:GetWordFromCfg(319671016)
				local var_70_5 = arg_67_1:FormatText(var_70_4.content)

				arg_67_1.text_.text = var_70_5

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_6 = 22
				local var_70_7 = utf8.len(var_70_5)
				local var_70_8 = var_70_6 <= 0 and var_70_2 or var_70_2 * (var_70_7 / var_70_6)

				if var_70_8 > 0 and var_70_2 < var_70_8 then
					arg_67_1.talkMaxDuration = var_70_8

					if var_70_8 + var_70_1 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_1
					end
				end

				arg_67_1.text_.text = var_70_5
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671016", "story_v_out_319671.awb") ~= 0 then
					local var_70_9 = manager.audio:GetVoiceLength("story_v_out_319671", "319671016", "story_v_out_319671.awb") / 1000

					if var_70_9 + var_70_1 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_9 + var_70_1
					end

					if var_70_4.prefab_name ~= "" and arg_67_1.actors_[var_70_4.prefab_name] ~= nil then
						local var_70_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_4.prefab_name].transform, "story_v_out_319671", "319671016", "story_v_out_319671.awb")

						arg_67_1:RecordAudio("319671016", var_70_10)
						arg_67_1:RecordAudio("319671016", var_70_10)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_319671", "319671016", "story_v_out_319671.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_319671", "319671016", "story_v_out_319671.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_11 = math.max(var_70_2, arg_67_1.talkMaxDuration)

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_11 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_1) / var_70_11

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_1 + var_70_11 and arg_67_1.time_ < var_70_1 + var_70_11 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play319671017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319671017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play319671018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["1084ui_story"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story == nil then
				arg_71_1.var_.characterEffect1084ui_story = var_74_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_2 = 0.200000002980232

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.characterEffect1084ui_story then
					local var_74_4 = Mathf.Lerp(0, 0.5, var_74_3)

					arg_71_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_71_1.var_.characterEffect1084ui_story.fillRatio = var_74_4
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1084ui_story then
				local var_74_5 = 0.5

				arg_71_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_71_1.var_.characterEffect1084ui_story.fillRatio = var_74_5
			end

			local var_74_6 = 0
			local var_74_7 = 0.775

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_8 = arg_71_1:GetWordFromCfg(319671017)
				local var_74_9 = arg_71_1:FormatText(var_74_8.content)

				arg_71_1.text_.text = var_74_9

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_10 = 31
				local var_74_11 = utf8.len(var_74_9)
				local var_74_12 = var_74_10 <= 0 and var_74_7 or var_74_7 * (var_74_11 / var_74_10)

				if var_74_12 > 0 and var_74_7 < var_74_12 then
					arg_71_1.talkMaxDuration = var_74_12

					if var_74_12 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_9
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_13 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_13 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_13

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_13 and arg_71_1.time_ < var_74_6 + var_74_13 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play319671018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319671018
		arg_75_1.duration_ = 4.9

		local var_75_0 = {
			zh = 3.466,
			ja = 4.9
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
				arg_75_0:Play319671019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1095ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect1095ui_story == nil then
				arg_75_1.var_.characterEffect1095ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect1095ui_story then
					arg_75_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect1095ui_story then
				arg_75_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_78_4 = 0

			if var_78_4 < arg_75_1.time_ and arg_75_1.time_ <= var_78_4 + arg_78_0 then
				arg_75_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 then
				arg_75_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_78_6 = 0
			local var_78_7 = 0.425

			if var_78_6 < arg_75_1.time_ and arg_75_1.time_ <= var_78_6 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_8 = arg_75_1:FormatText(StoryNameCfg[471].name)

				arg_75_1.leftNameTxt_.text = var_78_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_9 = arg_75_1:GetWordFromCfg(319671018)
				local var_78_10 = arg_75_1:FormatText(var_78_9.content)

				arg_75_1.text_.text = var_78_10

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_11 = 17
				local var_78_12 = utf8.len(var_78_10)
				local var_78_13 = var_78_11 <= 0 and var_78_7 or var_78_7 * (var_78_12 / var_78_11)

				if var_78_13 > 0 and var_78_7 < var_78_13 then
					arg_75_1.talkMaxDuration = var_78_13

					if var_78_13 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_13 + var_78_6
					end
				end

				arg_75_1.text_.text = var_78_10
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671018", "story_v_out_319671.awb") ~= 0 then
					local var_78_14 = manager.audio:GetVoiceLength("story_v_out_319671", "319671018", "story_v_out_319671.awb") / 1000

					if var_78_14 + var_78_6 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_14 + var_78_6
					end

					if var_78_9.prefab_name ~= "" and arg_75_1.actors_[var_78_9.prefab_name] ~= nil then
						local var_78_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_9.prefab_name].transform, "story_v_out_319671", "319671018", "story_v_out_319671.awb")

						arg_75_1:RecordAudio("319671018", var_78_15)
						arg_75_1:RecordAudio("319671018", var_78_15)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319671", "319671018", "story_v_out_319671.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319671", "319671018", "story_v_out_319671.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_16 = math.max(var_78_7, arg_75_1.talkMaxDuration)

			if var_78_6 <= arg_75_1.time_ and arg_75_1.time_ < var_78_6 + var_78_16 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_6) / var_78_16

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_6 + var_78_16 and arg_75_1.time_ < var_78_6 + var_78_16 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play319671019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319671019
		arg_79_1.duration_ = 5.333

		local var_79_0 = {
			zh = 4.833,
			ja = 5.333
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
				arg_79_0:Play319671020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1095ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1095ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0.7, -0.98, -6.1)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1095ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["1095ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect1095ui_story == nil then
				arg_79_1.var_.characterEffect1095ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect1095ui_story then
					arg_79_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect1095ui_story then
				arg_79_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_14 = 0
			local var_82_15 = 0.625

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_16 = arg_79_1:FormatText(StoryNameCfg[471].name)

				arg_79_1.leftNameTxt_.text = var_82_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_17 = arg_79_1:GetWordFromCfg(319671019)
				local var_82_18 = arg_79_1:FormatText(var_82_17.content)

				arg_79_1.text_.text = var_82_18

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_19 = 25
				local var_82_20 = utf8.len(var_82_18)
				local var_82_21 = var_82_19 <= 0 and var_82_15 or var_82_15 * (var_82_20 / var_82_19)

				if var_82_21 > 0 and var_82_15 < var_82_21 then
					arg_79_1.talkMaxDuration = var_82_21

					if var_82_21 + var_82_14 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_21 + var_82_14
					end
				end

				arg_79_1.text_.text = var_82_18
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671019", "story_v_out_319671.awb") ~= 0 then
					local var_82_22 = manager.audio:GetVoiceLength("story_v_out_319671", "319671019", "story_v_out_319671.awb") / 1000

					if var_82_22 + var_82_14 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_22 + var_82_14
					end

					if var_82_17.prefab_name ~= "" and arg_79_1.actors_[var_82_17.prefab_name] ~= nil then
						local var_82_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_17.prefab_name].transform, "story_v_out_319671", "319671019", "story_v_out_319671.awb")

						arg_79_1:RecordAudio("319671019", var_82_23)
						arg_79_1:RecordAudio("319671019", var_82_23)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_319671", "319671019", "story_v_out_319671.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_319671", "319671019", "story_v_out_319671.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_24 = math.max(var_82_15, arg_79_1.talkMaxDuration)

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_24 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_14) / var_82_24

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_14 + var_82_24 and arg_79_1.time_ < var_82_14 + var_82_24 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play319671020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319671020
		arg_83_1.duration_ = 6.033

		local var_83_0 = {
			zh = 2.166,
			ja = 6.033
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
				arg_83_0:Play319671021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1095ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1095ui_story == nil then
				arg_83_1.var_.characterEffect1095ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1095ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1095ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1095ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1095ui_story.fillRatio = var_86_5
			end

			local var_86_6 = arg_83_1.actors_["1084ui_story"]
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story == nil then
				arg_83_1.var_.characterEffect1084ui_story = var_86_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_8 = 0.200000002980232

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8

				if arg_83_1.var_.characterEffect1084ui_story then
					arg_83_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story then
				arg_83_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_86_10 = 0
			local var_86_11 = 0.3

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_12 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_13 = arg_83_1:GetWordFromCfg(319671020)
				local var_86_14 = arg_83_1:FormatText(var_86_13.content)

				arg_83_1.text_.text = var_86_14

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_15 = 12
				local var_86_16 = utf8.len(var_86_14)
				local var_86_17 = var_86_15 <= 0 and var_86_11 or var_86_11 * (var_86_16 / var_86_15)

				if var_86_17 > 0 and var_86_11 < var_86_17 then
					arg_83_1.talkMaxDuration = var_86_17

					if var_86_17 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_17 + var_86_10
					end
				end

				arg_83_1.text_.text = var_86_14
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671020", "story_v_out_319671.awb") ~= 0 then
					local var_86_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671020", "story_v_out_319671.awb") / 1000

					if var_86_18 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_18 + var_86_10
					end

					if var_86_13.prefab_name ~= "" and arg_83_1.actors_[var_86_13.prefab_name] ~= nil then
						local var_86_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_13.prefab_name].transform, "story_v_out_319671", "319671020", "story_v_out_319671.awb")

						arg_83_1:RecordAudio("319671020", var_86_19)
						arg_83_1:RecordAudio("319671020", var_86_19)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_319671", "319671020", "story_v_out_319671.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_319671", "319671020", "story_v_out_319671.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_20 = math.max(var_86_11, arg_83_1.talkMaxDuration)

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_20 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_10) / var_86_20

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_10 + var_86_20 and arg_83_1.time_ < var_86_10 + var_86_20 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play319671021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319671021
		arg_87_1.duration_ = 5.933

		local var_87_0 = {
			zh = 3.666,
			ja = 5.933
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
				arg_87_0:Play319671022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1084ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story == nil then
				arg_87_1.var_.characterEffect1084ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1084ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1084ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1084ui_story.fillRatio = var_90_5
			end

			local var_90_6 = arg_87_1.actors_["1095ui_story"]
			local var_90_7 = 0

			if var_90_7 < arg_87_1.time_ and arg_87_1.time_ <= var_90_7 + arg_90_0 and arg_87_1.var_.characterEffect1095ui_story == nil then
				arg_87_1.var_.characterEffect1095ui_story = var_90_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_8 = 0.200000002980232

			if var_90_7 <= arg_87_1.time_ and arg_87_1.time_ < var_90_7 + var_90_8 then
				local var_90_9 = (arg_87_1.time_ - var_90_7) / var_90_8

				if arg_87_1.var_.characterEffect1095ui_story then
					arg_87_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_7 + var_90_8 and arg_87_1.time_ < var_90_7 + var_90_8 + arg_90_0 and arg_87_1.var_.characterEffect1095ui_story then
				arg_87_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_90_10 = 0
			local var_90_11 = 0.375

			if var_90_10 < arg_87_1.time_ and arg_87_1.time_ <= var_90_10 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_12 = arg_87_1:FormatText(StoryNameCfg[471].name)

				arg_87_1.leftNameTxt_.text = var_90_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_13 = arg_87_1:GetWordFromCfg(319671021)
				local var_90_14 = arg_87_1:FormatText(var_90_13.content)

				arg_87_1.text_.text = var_90_14

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_15 = 15
				local var_90_16 = utf8.len(var_90_14)
				local var_90_17 = var_90_15 <= 0 and var_90_11 or var_90_11 * (var_90_16 / var_90_15)

				if var_90_17 > 0 and var_90_11 < var_90_17 then
					arg_87_1.talkMaxDuration = var_90_17

					if var_90_17 + var_90_10 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_17 + var_90_10
					end
				end

				arg_87_1.text_.text = var_90_14
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671021", "story_v_out_319671.awb") ~= 0 then
					local var_90_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671021", "story_v_out_319671.awb") / 1000

					if var_90_18 + var_90_10 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_18 + var_90_10
					end

					if var_90_13.prefab_name ~= "" and arg_87_1.actors_[var_90_13.prefab_name] ~= nil then
						local var_90_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_13.prefab_name].transform, "story_v_out_319671", "319671021", "story_v_out_319671.awb")

						arg_87_1:RecordAudio("319671021", var_90_19)
						arg_87_1:RecordAudio("319671021", var_90_19)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319671", "319671021", "story_v_out_319671.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319671", "319671021", "story_v_out_319671.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_20 = math.max(var_90_11, arg_87_1.talkMaxDuration)

			if var_90_10 <= arg_87_1.time_ and arg_87_1.time_ < var_90_10 + var_90_20 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_10) / var_90_20

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_10 + var_90_20 and arg_87_1.time_ < var_90_10 + var_90_20 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319671022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319671022
		arg_91_1.duration_ = 2.1

		local var_91_0 = {
			zh = 1.999999999999,
			ja = 2.1
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
				arg_91_0:Play319671023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1084ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1084ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(-0.7, -0.97, -6)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1084ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["1084ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story == nil then
				arg_91_1.var_.characterEffect1084ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect1084ui_story then
					arg_91_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story then
				arg_91_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_94_15 = arg_91_1.actors_["1095ui_story"]
			local var_94_16 = 0

			if var_94_16 < arg_91_1.time_ and arg_91_1.time_ <= var_94_16 + arg_94_0 and arg_91_1.var_.characterEffect1095ui_story == nil then
				arg_91_1.var_.characterEffect1095ui_story = var_94_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_17 = 0.200000002980232

			if var_94_16 <= arg_91_1.time_ and arg_91_1.time_ < var_94_16 + var_94_17 then
				local var_94_18 = (arg_91_1.time_ - var_94_16) / var_94_17

				if arg_91_1.var_.characterEffect1095ui_story then
					local var_94_19 = Mathf.Lerp(0, 0.5, var_94_18)

					arg_91_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_91_1.var_.characterEffect1095ui_story.fillRatio = var_94_19
				end
			end

			if arg_91_1.time_ >= var_94_16 + var_94_17 and arg_91_1.time_ < var_94_16 + var_94_17 + arg_94_0 and arg_91_1.var_.characterEffect1095ui_story then
				local var_94_20 = 0.5

				arg_91_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_91_1.var_.characterEffect1095ui_story.fillRatio = var_94_20
			end

			local var_94_21 = 0
			local var_94_22 = 0.15

			if var_94_21 < arg_91_1.time_ and arg_91_1.time_ <= var_94_21 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_23 = arg_91_1:FormatText(StoryNameCfg[6].name)

				arg_91_1.leftNameTxt_.text = var_94_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_24 = arg_91_1:GetWordFromCfg(319671022)
				local var_94_25 = arg_91_1:FormatText(var_94_24.content)

				arg_91_1.text_.text = var_94_25

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_26 = 6
				local var_94_27 = utf8.len(var_94_25)
				local var_94_28 = var_94_26 <= 0 and var_94_22 or var_94_22 * (var_94_27 / var_94_26)

				if var_94_28 > 0 and var_94_22 < var_94_28 then
					arg_91_1.talkMaxDuration = var_94_28

					if var_94_28 + var_94_21 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_28 + var_94_21
					end
				end

				arg_91_1.text_.text = var_94_25
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671022", "story_v_out_319671.awb") ~= 0 then
					local var_94_29 = manager.audio:GetVoiceLength("story_v_out_319671", "319671022", "story_v_out_319671.awb") / 1000

					if var_94_29 + var_94_21 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_29 + var_94_21
					end

					if var_94_24.prefab_name ~= "" and arg_91_1.actors_[var_94_24.prefab_name] ~= nil then
						local var_94_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_24.prefab_name].transform, "story_v_out_319671", "319671022", "story_v_out_319671.awb")

						arg_91_1:RecordAudio("319671022", var_94_30)
						arg_91_1:RecordAudio("319671022", var_94_30)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319671", "319671022", "story_v_out_319671.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319671", "319671022", "story_v_out_319671.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_31 = math.max(var_94_22, arg_91_1.talkMaxDuration)

			if var_94_21 <= arg_91_1.time_ and arg_91_1.time_ < var_94_21 + var_94_31 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_21) / var_94_31

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_21 + var_94_31 and arg_91_1.time_ < var_94_21 + var_94_31 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play319671023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319671023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play319671024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1084ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story == nil then
				arg_95_1.var_.characterEffect1084ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1084ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1084ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1084ui_story.fillRatio = var_98_5
			end

			local var_98_6 = arg_95_1.actors_["1095ui_story"].transform
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 then
				arg_95_1.var_.moveOldPos1095ui_story = var_98_6.localPosition
			end

			local var_98_8 = 0.001

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_8 then
				local var_98_9 = (arg_95_1.time_ - var_98_7) / var_98_8
				local var_98_10 = Vector3.New(0, 100, 0)

				var_98_6.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1095ui_story, var_98_10, var_98_9)

				local var_98_11 = manager.ui.mainCamera.transform.position - var_98_6.position

				var_98_6.forward = Vector3.New(var_98_11.x, var_98_11.y, var_98_11.z)

				local var_98_12 = var_98_6.localEulerAngles

				var_98_12.z = 0
				var_98_12.x = 0
				var_98_6.localEulerAngles = var_98_12
			end

			if arg_95_1.time_ >= var_98_7 + var_98_8 and arg_95_1.time_ < var_98_7 + var_98_8 + arg_98_0 then
				var_98_6.localPosition = Vector3.New(0, 100, 0)

				local var_98_13 = manager.ui.mainCamera.transform.position - var_98_6.position

				var_98_6.forward = Vector3.New(var_98_13.x, var_98_13.y, var_98_13.z)

				local var_98_14 = var_98_6.localEulerAngles

				var_98_14.z = 0
				var_98_14.x = 0
				var_98_6.localEulerAngles = var_98_14
			end

			local var_98_15 = arg_95_1.actors_["1084ui_story"].transform
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 then
				arg_95_1.var_.moveOldPos1084ui_story = var_98_15.localPosition
			end

			local var_98_17 = 0.001

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17
				local var_98_19 = Vector3.New(0, 100, 0)

				var_98_15.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1084ui_story, var_98_19, var_98_18)

				local var_98_20 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_20.x, var_98_20.y, var_98_20.z)

				local var_98_21 = var_98_15.localEulerAngles

				var_98_21.z = 0
				var_98_21.x = 0
				var_98_15.localEulerAngles = var_98_21
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 then
				var_98_15.localPosition = Vector3.New(0, 100, 0)

				local var_98_22 = manager.ui.mainCamera.transform.position - var_98_15.position

				var_98_15.forward = Vector3.New(var_98_22.x, var_98_22.y, var_98_22.z)

				local var_98_23 = var_98_15.localEulerAngles

				var_98_23.z = 0
				var_98_23.x = 0
				var_98_15.localEulerAngles = var_98_23
			end

			local var_98_24 = 0
			local var_98_25 = 0.9

			if var_98_24 < arg_95_1.time_ and arg_95_1.time_ <= var_98_24 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_26 = arg_95_1:GetWordFromCfg(319671023)
				local var_98_27 = arg_95_1:FormatText(var_98_26.content)

				arg_95_1.text_.text = var_98_27

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_28 = 36
				local var_98_29 = utf8.len(var_98_27)
				local var_98_30 = var_98_28 <= 0 and var_98_25 or var_98_25 * (var_98_29 / var_98_28)

				if var_98_30 > 0 and var_98_25 < var_98_30 then
					arg_95_1.talkMaxDuration = var_98_30

					if var_98_30 + var_98_24 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_30 + var_98_24
					end
				end

				arg_95_1.text_.text = var_98_27
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_31 = math.max(var_98_25, arg_95_1.talkMaxDuration)

			if var_98_24 <= arg_95_1.time_ and arg_95_1.time_ < var_98_24 + var_98_31 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_24) / var_98_31

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_24 + var_98_31 and arg_95_1.time_ < var_98_24 + var_98_31 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319671024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319671024
		arg_99_1.duration_ = 7.4

		local var_99_0 = {
			zh = 4.7,
			ja = 7.4
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
				arg_99_0:Play319671025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1084ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story == nil then
				arg_99_1.var_.characterEffect1084ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1084ui_story then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1084ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1084ui_story.fillRatio = var_102_5
			end

			local var_102_6 = arg_99_1.actors_["1095ui_story"]
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 and arg_99_1.var_.characterEffect1095ui_story == nil then
				arg_99_1.var_.characterEffect1095ui_story = var_102_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_8 = 0.200000002980232

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8

				if arg_99_1.var_.characterEffect1095ui_story then
					arg_99_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 and arg_99_1.var_.characterEffect1095ui_story then
				arg_99_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_102_10 = arg_99_1.actors_["1095ui_story"].transform
			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1.var_.moveOldPos1095ui_story = var_102_10.localPosition
			end

			local var_102_12 = 0.001

			if var_102_11 <= arg_99_1.time_ and arg_99_1.time_ < var_102_11 + var_102_12 then
				local var_102_13 = (arg_99_1.time_ - var_102_11) / var_102_12
				local var_102_14 = Vector3.New(0, -0.98, -6.1)

				var_102_10.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1095ui_story, var_102_14, var_102_13)

				local var_102_15 = manager.ui.mainCamera.transform.position - var_102_10.position

				var_102_10.forward = Vector3.New(var_102_15.x, var_102_15.y, var_102_15.z)

				local var_102_16 = var_102_10.localEulerAngles

				var_102_16.z = 0
				var_102_16.x = 0
				var_102_10.localEulerAngles = var_102_16
			end

			if arg_99_1.time_ >= var_102_11 + var_102_12 and arg_99_1.time_ < var_102_11 + var_102_12 + arg_102_0 then
				var_102_10.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_102_17 = manager.ui.mainCamera.transform.position - var_102_10.position

				var_102_10.forward = Vector3.New(var_102_17.x, var_102_17.y, var_102_17.z)

				local var_102_18 = var_102_10.localEulerAngles

				var_102_18.z = 0
				var_102_18.x = 0
				var_102_10.localEulerAngles = var_102_18
			end

			local var_102_19 = 0
			local var_102_20 = 0.6

			if var_102_19 < arg_99_1.time_ and arg_99_1.time_ <= var_102_19 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_21 = arg_99_1:FormatText(StoryNameCfg[471].name)

				arg_99_1.leftNameTxt_.text = var_102_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_22 = arg_99_1:GetWordFromCfg(319671024)
				local var_102_23 = arg_99_1:FormatText(var_102_22.content)

				arg_99_1.text_.text = var_102_23

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_24 = 24
				local var_102_25 = utf8.len(var_102_23)
				local var_102_26 = var_102_24 <= 0 and var_102_20 or var_102_20 * (var_102_25 / var_102_24)

				if var_102_26 > 0 and var_102_20 < var_102_26 then
					arg_99_1.talkMaxDuration = var_102_26

					if var_102_26 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_26 + var_102_19
					end
				end

				arg_99_1.text_.text = var_102_23
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671024", "story_v_out_319671.awb") ~= 0 then
					local var_102_27 = manager.audio:GetVoiceLength("story_v_out_319671", "319671024", "story_v_out_319671.awb") / 1000

					if var_102_27 + var_102_19 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_27 + var_102_19
					end

					if var_102_22.prefab_name ~= "" and arg_99_1.actors_[var_102_22.prefab_name] ~= nil then
						local var_102_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_22.prefab_name].transform, "story_v_out_319671", "319671024", "story_v_out_319671.awb")

						arg_99_1:RecordAudio("319671024", var_102_28)
						arg_99_1:RecordAudio("319671024", var_102_28)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_319671", "319671024", "story_v_out_319671.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_319671", "319671024", "story_v_out_319671.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_29 = math.max(var_102_20, arg_99_1.talkMaxDuration)

			if var_102_19 <= arg_99_1.time_ and arg_99_1.time_ < var_102_19 + var_102_29 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_19) / var_102_29

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_19 + var_102_29 and arg_99_1.time_ < var_102_19 + var_102_29 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play319671025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319671025
		arg_103_1.duration_ = 10.3

		local var_103_0 = {
			zh = 6.9,
			ja = 10.3
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
				arg_103_0:Play319671026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1084ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos1084ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(-0.7, -0.97, -6)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1084ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["1084ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story == nil then
				arg_103_1.var_.characterEffect1084ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect1084ui_story then
					arg_103_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect1084ui_story then
				arg_103_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_106_15 = arg_103_1.actors_["1095ui_story"].transform
			local var_106_16 = 0

			if var_106_16 < arg_103_1.time_ and arg_103_1.time_ <= var_106_16 + arg_106_0 then
				arg_103_1.var_.moveOldPos1095ui_story = var_106_15.localPosition
			end

			local var_106_17 = 0.001

			if var_106_16 <= arg_103_1.time_ and arg_103_1.time_ < var_106_16 + var_106_17 then
				local var_106_18 = (arg_103_1.time_ - var_106_16) / var_106_17
				local var_106_19 = Vector3.New(0.7, -0.98, -6.1)

				var_106_15.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos1095ui_story, var_106_19, var_106_18)

				local var_106_20 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_20.x, var_106_20.y, var_106_20.z)

				local var_106_21 = var_106_15.localEulerAngles

				var_106_21.z = 0
				var_106_21.x = 0
				var_106_15.localEulerAngles = var_106_21
			end

			if arg_103_1.time_ >= var_106_16 + var_106_17 and arg_103_1.time_ < var_106_16 + var_106_17 + arg_106_0 then
				var_106_15.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_106_22 = manager.ui.mainCamera.transform.position - var_106_15.position

				var_106_15.forward = Vector3.New(var_106_22.x, var_106_22.y, var_106_22.z)

				local var_106_23 = var_106_15.localEulerAngles

				var_106_23.z = 0
				var_106_23.x = 0
				var_106_15.localEulerAngles = var_106_23
			end

			local var_106_24 = arg_103_1.actors_["1095ui_story"]
			local var_106_25 = 0

			if var_106_25 < arg_103_1.time_ and arg_103_1.time_ <= var_106_25 + arg_106_0 and arg_103_1.var_.characterEffect1095ui_story == nil then
				arg_103_1.var_.characterEffect1095ui_story = var_106_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_26 = 0.200000002980232

			if var_106_25 <= arg_103_1.time_ and arg_103_1.time_ < var_106_25 + var_106_26 then
				local var_106_27 = (arg_103_1.time_ - var_106_25) / var_106_26

				if arg_103_1.var_.characterEffect1095ui_story then
					local var_106_28 = Mathf.Lerp(0, 0.5, var_106_27)

					arg_103_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1095ui_story.fillRatio = var_106_28
				end
			end

			if arg_103_1.time_ >= var_106_25 + var_106_26 and arg_103_1.time_ < var_106_25 + var_106_26 + arg_106_0 and arg_103_1.var_.characterEffect1095ui_story then
				local var_106_29 = 0.5

				arg_103_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1095ui_story.fillRatio = var_106_29
			end

			local var_106_30 = 0
			local var_106_31 = 0.85

			if var_106_30 < arg_103_1.time_ and arg_103_1.time_ <= var_106_30 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_32 = arg_103_1:FormatText(StoryNameCfg[6].name)

				arg_103_1.leftNameTxt_.text = var_106_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_33 = arg_103_1:GetWordFromCfg(319671025)
				local var_106_34 = arg_103_1:FormatText(var_106_33.content)

				arg_103_1.text_.text = var_106_34

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_35 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671025", "story_v_out_319671.awb") ~= 0 then
					local var_106_38 = manager.audio:GetVoiceLength("story_v_out_319671", "319671025", "story_v_out_319671.awb") / 1000

					if var_106_38 + var_106_30 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_38 + var_106_30
					end

					if var_106_33.prefab_name ~= "" and arg_103_1.actors_[var_106_33.prefab_name] ~= nil then
						local var_106_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_33.prefab_name].transform, "story_v_out_319671", "319671025", "story_v_out_319671.awb")

						arg_103_1:RecordAudio("319671025", var_106_39)
						arg_103_1:RecordAudio("319671025", var_106_39)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_319671", "319671025", "story_v_out_319671.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_319671", "319671025", "story_v_out_319671.awb")
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
	Play319671026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319671026
		arg_107_1.duration_ = 10.833

		local var_107_0 = {
			zh = 6.333,
			ja = 10.833
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
				arg_107_0:Play319671027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1095ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1095ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0.7, -0.98, -6.1)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1095ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["1095ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1095ui_story == nil then
				arg_107_1.var_.characterEffect1095ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect1095ui_story then
					arg_107_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect1095ui_story then
				arg_107_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_110_13 = 0

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				arg_107_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_15 = arg_107_1.actors_["1084ui_story"]
			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story == nil then
				arg_107_1.var_.characterEffect1084ui_story = var_110_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_17 = 0.200000002980232

			if var_110_16 <= arg_107_1.time_ and arg_107_1.time_ < var_110_16 + var_110_17 then
				local var_110_18 = (arg_107_1.time_ - var_110_16) / var_110_17

				if arg_107_1.var_.characterEffect1084ui_story then
					local var_110_19 = Mathf.Lerp(0, 0.5, var_110_18)

					arg_107_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_107_1.var_.characterEffect1084ui_story.fillRatio = var_110_19
				end
			end

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 and arg_107_1.var_.characterEffect1084ui_story then
				local var_110_20 = 0.5

				arg_107_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_107_1.var_.characterEffect1084ui_story.fillRatio = var_110_20
			end

			local var_110_21 = 0
			local var_110_22 = 0.55

			if var_110_21 < arg_107_1.time_ and arg_107_1.time_ <= var_110_21 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_23 = arg_107_1:FormatText(StoryNameCfg[471].name)

				arg_107_1.leftNameTxt_.text = var_110_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_24 = arg_107_1:GetWordFromCfg(319671026)
				local var_110_25 = arg_107_1:FormatText(var_110_24.content)

				arg_107_1.text_.text = var_110_25

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_26 = 22
				local var_110_27 = utf8.len(var_110_25)
				local var_110_28 = var_110_26 <= 0 and var_110_22 or var_110_22 * (var_110_27 / var_110_26)

				if var_110_28 > 0 and var_110_22 < var_110_28 then
					arg_107_1.talkMaxDuration = var_110_28

					if var_110_28 + var_110_21 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_28 + var_110_21
					end
				end

				arg_107_1.text_.text = var_110_25
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671026", "story_v_out_319671.awb") ~= 0 then
					local var_110_29 = manager.audio:GetVoiceLength("story_v_out_319671", "319671026", "story_v_out_319671.awb") / 1000

					if var_110_29 + var_110_21 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_29 + var_110_21
					end

					if var_110_24.prefab_name ~= "" and arg_107_1.actors_[var_110_24.prefab_name] ~= nil then
						local var_110_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_24.prefab_name].transform, "story_v_out_319671", "319671026", "story_v_out_319671.awb")

						arg_107_1:RecordAudio("319671026", var_110_30)
						arg_107_1:RecordAudio("319671026", var_110_30)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_319671", "319671026", "story_v_out_319671.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_319671", "319671026", "story_v_out_319671.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_31 = math.max(var_110_22, arg_107_1.talkMaxDuration)

			if var_110_21 <= arg_107_1.time_ and arg_107_1.time_ < var_110_21 + var_110_31 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_21) / var_110_31

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_21 + var_110_31 and arg_107_1.time_ < var_110_21 + var_110_31 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play319671027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 319671027
		arg_111_1.duration_ = 2.3

		local var_111_0 = {
			zh = 2.3,
			ja = 2
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
				arg_111_0:Play319671028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1095ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1095ui_story == nil then
				arg_111_1.var_.characterEffect1095ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1095ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1095ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1095ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1095ui_story.fillRatio = var_114_5
			end

			local var_114_6 = arg_111_1.actors_["1084ui_story"]
			local var_114_7 = 0

			if var_114_7 < arg_111_1.time_ and arg_111_1.time_ <= var_114_7 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story == nil then
				arg_111_1.var_.characterEffect1084ui_story = var_114_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_8 = 0.200000002980232

			if var_114_7 <= arg_111_1.time_ and arg_111_1.time_ < var_114_7 + var_114_8 then
				local var_114_9 = (arg_111_1.time_ - var_114_7) / var_114_8

				if arg_111_1.var_.characterEffect1084ui_story then
					arg_111_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_7 + var_114_8 and arg_111_1.time_ < var_114_7 + var_114_8 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story then
				arg_111_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_114_10 = 0
			local var_114_11 = 0.125

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_12 = arg_111_1:FormatText(StoryNameCfg[6].name)

				arg_111_1.leftNameTxt_.text = var_114_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_13 = arg_111_1:GetWordFromCfg(319671027)
				local var_114_14 = arg_111_1:FormatText(var_114_13.content)

				arg_111_1.text_.text = var_114_14

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_15 = 5
				local var_114_16 = utf8.len(var_114_14)
				local var_114_17 = var_114_15 <= 0 and var_114_11 or var_114_11 * (var_114_16 / var_114_15)

				if var_114_17 > 0 and var_114_11 < var_114_17 then
					arg_111_1.talkMaxDuration = var_114_17

					if var_114_17 + var_114_10 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_17 + var_114_10
					end
				end

				arg_111_1.text_.text = var_114_14
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671027", "story_v_out_319671.awb") ~= 0 then
					local var_114_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671027", "story_v_out_319671.awb") / 1000

					if var_114_18 + var_114_10 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_18 + var_114_10
					end

					if var_114_13.prefab_name ~= "" and arg_111_1.actors_[var_114_13.prefab_name] ~= nil then
						local var_114_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_13.prefab_name].transform, "story_v_out_319671", "319671027", "story_v_out_319671.awb")

						arg_111_1:RecordAudio("319671027", var_114_19)
						arg_111_1:RecordAudio("319671027", var_114_19)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_319671", "319671027", "story_v_out_319671.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_319671", "319671027", "story_v_out_319671.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_20 = math.max(var_114_11, arg_111_1.talkMaxDuration)

			if var_114_10 <= arg_111_1.time_ and arg_111_1.time_ < var_114_10 + var_114_20 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_10) / var_114_20

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_10 + var_114_20 and arg_111_1.time_ < var_114_10 + var_114_20 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play319671028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 319671028
		arg_115_1.duration_ = 3.133

		local var_115_0 = {
			zh = 1.999999999999,
			ja = 3.133
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
				arg_115_0:Play319671029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1095ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1095ui_story == nil then
				arg_115_1.var_.characterEffect1095ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.200000002980232

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1095ui_story then
					arg_115_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1095ui_story then
				arg_115_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_118_4 = arg_115_1.actors_["1084ui_story"]
			local var_118_5 = 0

			if var_118_5 < arg_115_1.time_ and arg_115_1.time_ <= var_118_5 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story == nil then
				arg_115_1.var_.characterEffect1084ui_story = var_118_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_6 = 0.200000002980232

			if var_118_5 <= arg_115_1.time_ and arg_115_1.time_ < var_118_5 + var_118_6 then
				local var_118_7 = (arg_115_1.time_ - var_118_5) / var_118_6

				if arg_115_1.var_.characterEffect1084ui_story then
					local var_118_8 = Mathf.Lerp(0, 0.5, var_118_7)

					arg_115_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1084ui_story.fillRatio = var_118_8
				end
			end

			if arg_115_1.time_ >= var_118_5 + var_118_6 and arg_115_1.time_ < var_118_5 + var_118_6 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story then
				local var_118_9 = 0.5

				arg_115_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1084ui_story.fillRatio = var_118_9
			end

			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 then
				arg_115_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_118_11 = 0
			local var_118_12 = 0.25

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_13 = arg_115_1:FormatText(StoryNameCfg[471].name)

				arg_115_1.leftNameTxt_.text = var_118_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_14 = arg_115_1:GetWordFromCfg(319671028)
				local var_118_15 = arg_115_1:FormatText(var_118_14.content)

				arg_115_1.text_.text = var_118_15

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_16 = 10
				local var_118_17 = utf8.len(var_118_15)
				local var_118_18 = var_118_16 <= 0 and var_118_12 or var_118_12 * (var_118_17 / var_118_16)

				if var_118_18 > 0 and var_118_12 < var_118_18 then
					arg_115_1.talkMaxDuration = var_118_18

					if var_118_18 + var_118_11 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_18 + var_118_11
					end
				end

				arg_115_1.text_.text = var_118_15
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671028", "story_v_out_319671.awb") ~= 0 then
					local var_118_19 = manager.audio:GetVoiceLength("story_v_out_319671", "319671028", "story_v_out_319671.awb") / 1000

					if var_118_19 + var_118_11 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_19 + var_118_11
					end

					if var_118_14.prefab_name ~= "" and arg_115_1.actors_[var_118_14.prefab_name] ~= nil then
						local var_118_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_14.prefab_name].transform, "story_v_out_319671", "319671028", "story_v_out_319671.awb")

						arg_115_1:RecordAudio("319671028", var_118_20)
						arg_115_1:RecordAudio("319671028", var_118_20)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_319671", "319671028", "story_v_out_319671.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_319671", "319671028", "story_v_out_319671.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_21 = math.max(var_118_12, arg_115_1.talkMaxDuration)

			if var_118_11 <= arg_115_1.time_ and arg_115_1.time_ < var_118_11 + var_118_21 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_11) / var_118_21

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_11 + var_118_21 and arg_115_1.time_ < var_118_11 + var_118_21 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play319671029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319671029
		arg_119_1.duration_ = 1.999999999999

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play319671030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_122_1 = 0
			local var_122_2 = 0.075

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_3 = arg_119_1:FormatText(StoryNameCfg[471].name)

				arg_119_1.leftNameTxt_.text = var_122_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_4 = arg_119_1:GetWordFromCfg(319671029)
				local var_122_5 = arg_119_1:FormatText(var_122_4.content)

				arg_119_1.text_.text = var_122_5

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_6 = 3
				local var_122_7 = utf8.len(var_122_5)
				local var_122_8 = var_122_6 <= 0 and var_122_2 or var_122_2 * (var_122_7 / var_122_6)

				if var_122_8 > 0 and var_122_2 < var_122_8 then
					arg_119_1.talkMaxDuration = var_122_8

					if var_122_8 + var_122_1 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_1
					end
				end

				arg_119_1.text_.text = var_122_5
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671029", "story_v_out_319671.awb") ~= 0 then
					local var_122_9 = manager.audio:GetVoiceLength("story_v_out_319671", "319671029", "story_v_out_319671.awb") / 1000

					if var_122_9 + var_122_1 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_9 + var_122_1
					end

					if var_122_4.prefab_name ~= "" and arg_119_1.actors_[var_122_4.prefab_name] ~= nil then
						local var_122_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_4.prefab_name].transform, "story_v_out_319671", "319671029", "story_v_out_319671.awb")

						arg_119_1:RecordAudio("319671029", var_122_10)
						arg_119_1:RecordAudio("319671029", var_122_10)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_319671", "319671029", "story_v_out_319671.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_319671", "319671029", "story_v_out_319671.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_11 = math.max(var_122_2, arg_119_1.talkMaxDuration)

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_11 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_1) / var_122_11

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_1 + var_122_11 and arg_119_1.time_ < var_122_1 + var_122_11 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play319671030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319671030
		arg_123_1.duration_ = 8.86666666666667

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play319671031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = "D11"

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
				local var_126_5 = arg_123_1.bgs_.D11

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
					if iter_126_0 ~= "D11" then
						iter_126_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_126_16 = 0

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

			local var_126_29 = arg_123_1.actors_["1084ui_story"].transform
			local var_126_30 = 2

			if var_126_30 < arg_123_1.time_ and arg_123_1.time_ <= var_126_30 + arg_126_0 then
				arg_123_1.var_.moveOldPos1084ui_story = var_126_29.localPosition
			end

			local var_126_31 = 0.001

			if var_126_30 <= arg_123_1.time_ and arg_123_1.time_ < var_126_30 + var_126_31 then
				local var_126_32 = (arg_123_1.time_ - var_126_30) / var_126_31
				local var_126_33 = Vector3.New(0, 100, 0)

				var_126_29.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1084ui_story, var_126_33, var_126_32)

				local var_126_34 = manager.ui.mainCamera.transform.position - var_126_29.position

				var_126_29.forward = Vector3.New(var_126_34.x, var_126_34.y, var_126_34.z)

				local var_126_35 = var_126_29.localEulerAngles

				var_126_35.z = 0
				var_126_35.x = 0
				var_126_29.localEulerAngles = var_126_35
			end

			if arg_123_1.time_ >= var_126_30 + var_126_31 and arg_123_1.time_ < var_126_30 + var_126_31 + arg_126_0 then
				var_126_29.localPosition = Vector3.New(0, 100, 0)

				local var_126_36 = manager.ui.mainCamera.transform.position - var_126_29.position

				var_126_29.forward = Vector3.New(var_126_36.x, var_126_36.y, var_126_36.z)

				local var_126_37 = var_126_29.localEulerAngles

				var_126_37.z = 0
				var_126_37.x = 0
				var_126_29.localEulerAngles = var_126_37
			end

			local var_126_38 = arg_123_1.actors_["1095ui_story"].transform
			local var_126_39 = 2

			if var_126_39 < arg_123_1.time_ and arg_123_1.time_ <= var_126_39 + arg_126_0 then
				arg_123_1.var_.moveOldPos1095ui_story = var_126_38.localPosition
			end

			local var_126_40 = 0.001

			if var_126_39 <= arg_123_1.time_ and arg_123_1.time_ < var_126_39 + var_126_40 then
				local var_126_41 = (arg_123_1.time_ - var_126_39) / var_126_40
				local var_126_42 = Vector3.New(0, 100, 0)

				var_126_38.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1095ui_story, var_126_42, var_126_41)

				local var_126_43 = manager.ui.mainCamera.transform.position - var_126_38.position

				var_126_38.forward = Vector3.New(var_126_43.x, var_126_43.y, var_126_43.z)

				local var_126_44 = var_126_38.localEulerAngles

				var_126_44.z = 0
				var_126_44.x = 0
				var_126_38.localEulerAngles = var_126_44
			end

			if arg_123_1.time_ >= var_126_39 + var_126_40 and arg_123_1.time_ < var_126_39 + var_126_40 + arg_126_0 then
				var_126_38.localPosition = Vector3.New(0, 100, 0)

				local var_126_45 = manager.ui.mainCamera.transform.position - var_126_38.position

				var_126_38.forward = Vector3.New(var_126_45.x, var_126_45.y, var_126_45.z)

				local var_126_46 = var_126_38.localEulerAngles

				var_126_46.z = 0
				var_126_46.x = 0
				var_126_38.localEulerAngles = var_126_46
			end

			if arg_123_1.frameCnt_ <= 1 then
				arg_123_1.dialog_:SetActive(false)
			end

			local var_126_47 = 3.86666666666667
			local var_126_48 = 0.95

			if var_126_47 < arg_123_1.time_ and arg_123_1.time_ <= var_126_47 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				arg_123_1.dialog_:SetActive(true)

				local var_126_49 = LeanTween.value(arg_123_1.dialog_, 0, 1, 0.3)

				var_126_49:setOnUpdate(LuaHelper.FloatAction(function(arg_127_0)
					arg_123_1.dialogCg_.alpha = arg_127_0
				end))
				var_126_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_123_1.dialog_)
					var_126_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_123_1.duration_ = arg_123_1.duration_ + 0.3

				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_50 = arg_123_1:GetWordFromCfg(319671030)
				local var_126_51 = arg_123_1:FormatText(var_126_50.content)

				arg_123_1.text_.text = var_126_51

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_52 = 38
				local var_126_53 = utf8.len(var_126_51)
				local var_126_54 = var_126_52 <= 0 and var_126_48 or var_126_48 * (var_126_53 / var_126_52)

				if var_126_54 > 0 and var_126_48 < var_126_54 then
					arg_123_1.talkMaxDuration = var_126_54
					var_126_47 = var_126_47 + 0.3

					if var_126_54 + var_126_47 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_54 + var_126_47
					end
				end

				arg_123_1.text_.text = var_126_51
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_55 = var_126_47 + 0.3
			local var_126_56 = math.max(var_126_48, arg_123_1.talkMaxDuration)

			if var_126_55 <= arg_123_1.time_ and arg_123_1.time_ < var_126_55 + var_126_56 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_55) / var_126_56

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_55 + var_126_56 and arg_123_1.time_ < var_126_55 + var_126_56 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play319671031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319671031
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play319671032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.95

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

				local var_132_2 = arg_129_1:GetWordFromCfg(319671031)
				local var_132_3 = arg_129_1:FormatText(var_132_2.content)

				arg_129_1.text_.text = var_132_3

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_4 = 38
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
	Play319671032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319671032
		arg_133_1.duration_ = 8.9

		local var_133_0 = {
			zh = 3.966,
			ja = 8.9
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
				arg_133_0:Play319671033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 0.5

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[660].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, true)
				arg_133_1.iconController_:SetSelectedState("hero")

				arg_133_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(319671032)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671032", "story_v_out_319671.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_319671", "319671032", "story_v_out_319671.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_319671", "319671032", "story_v_out_319671.awb")

						arg_133_1:RecordAudio("319671032", var_136_9)
						arg_133_1:RecordAudio("319671032", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319671", "319671032", "story_v_out_319671.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319671", "319671032", "story_v_out_319671.awb")
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
	Play319671033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319671033
		arg_137_1.duration_ = 4.433

		local var_137_0 = {
			zh = 1.999999999999,
			ja = 4.433
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
				arg_137_0:Play319671034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1095ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1095ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(0, -0.98, -6.1)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1095ui_story, var_140_4, var_140_3)

				local var_140_5 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_5.x, var_140_5.y, var_140_5.z)

				local var_140_6 = var_140_0.localEulerAngles

				var_140_6.z = 0
				var_140_6.x = 0
				var_140_0.localEulerAngles = var_140_6
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_140_7 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_7.x, var_140_7.y, var_140_7.z)

				local var_140_8 = var_140_0.localEulerAngles

				var_140_8.z = 0
				var_140_8.x = 0
				var_140_0.localEulerAngles = var_140_8
			end

			local var_140_9 = arg_137_1.actors_["1095ui_story"]
			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 and arg_137_1.var_.characterEffect1095ui_story == nil then
				arg_137_1.var_.characterEffect1095ui_story = var_140_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_11 = 0.200000002980232

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11

				if arg_137_1.var_.characterEffect1095ui_story then
					arg_137_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 and arg_137_1.var_.characterEffect1095ui_story then
				arg_137_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_140_13 = 0

			if var_140_13 < arg_137_1.time_ and arg_137_1.time_ <= var_140_13 + arg_140_0 then
				arg_137_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_14 = 0
			local var_140_15 = 0.15

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_16 = arg_137_1:FormatText(StoryNameCfg[471].name)

				arg_137_1.leftNameTxt_.text = var_140_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_17 = arg_137_1:GetWordFromCfg(319671033)
				local var_140_18 = arg_137_1:FormatText(var_140_17.content)

				arg_137_1.text_.text = var_140_18

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_19 = 6
				local var_140_20 = utf8.len(var_140_18)
				local var_140_21 = var_140_19 <= 0 and var_140_15 or var_140_15 * (var_140_20 / var_140_19)

				if var_140_21 > 0 and var_140_15 < var_140_21 then
					arg_137_1.talkMaxDuration = var_140_21

					if var_140_21 + var_140_14 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_21 + var_140_14
					end
				end

				arg_137_1.text_.text = var_140_18
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671033", "story_v_out_319671.awb") ~= 0 then
					local var_140_22 = manager.audio:GetVoiceLength("story_v_out_319671", "319671033", "story_v_out_319671.awb") / 1000

					if var_140_22 + var_140_14 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_22 + var_140_14
					end

					if var_140_17.prefab_name ~= "" and arg_137_1.actors_[var_140_17.prefab_name] ~= nil then
						local var_140_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_17.prefab_name].transform, "story_v_out_319671", "319671033", "story_v_out_319671.awb")

						arg_137_1:RecordAudio("319671033", var_140_23)
						arg_137_1:RecordAudio("319671033", var_140_23)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319671", "319671033", "story_v_out_319671.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319671", "319671033", "story_v_out_319671.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_24 = math.max(var_140_15, arg_137_1.talkMaxDuration)

			if var_140_14 <= arg_137_1.time_ and arg_137_1.time_ < var_140_14 + var_140_24 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_14) / var_140_24

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_14 + var_140_24 and arg_137_1.time_ < var_140_14 + var_140_24 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319671034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319671034
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play319671035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1095ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1095ui_story == nil then
				arg_141_1.var_.characterEffect1095ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1095ui_story then
					local var_144_4 = Mathf.Lerp(0, 0.5, var_144_3)

					arg_141_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1095ui_story.fillRatio = var_144_4
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1095ui_story then
				local var_144_5 = 0.5

				arg_141_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1095ui_story.fillRatio = var_144_5
			end

			local var_144_6 = arg_141_1.actors_["1095ui_story"].transform
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 then
				arg_141_1.var_.moveOldPos1095ui_story = var_144_6.localPosition
			end

			local var_144_8 = 0.001

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_8 then
				local var_144_9 = (arg_141_1.time_ - var_144_7) / var_144_8
				local var_144_10 = Vector3.New(0, 100, 0)

				var_144_6.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1095ui_story, var_144_10, var_144_9)

				local var_144_11 = manager.ui.mainCamera.transform.position - var_144_6.position

				var_144_6.forward = Vector3.New(var_144_11.x, var_144_11.y, var_144_11.z)

				local var_144_12 = var_144_6.localEulerAngles

				var_144_12.z = 0
				var_144_12.x = 0
				var_144_6.localEulerAngles = var_144_12
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 then
				var_144_6.localPosition = Vector3.New(0, 100, 0)

				local var_144_13 = manager.ui.mainCamera.transform.position - var_144_6.position

				var_144_6.forward = Vector3.New(var_144_13.x, var_144_13.y, var_144_13.z)

				local var_144_14 = var_144_6.localEulerAngles

				var_144_14.z = 0
				var_144_14.x = 0
				var_144_6.localEulerAngles = var_144_14
			end

			local var_144_15 = 0
			local var_144_16 = 0.775

			if var_144_15 < arg_141_1.time_ and arg_141_1.time_ <= var_144_15 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_17 = arg_141_1:GetWordFromCfg(319671034)
				local var_144_18 = arg_141_1:FormatText(var_144_17.content)

				arg_141_1.text_.text = var_144_18

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_19 = 31
				local var_144_20 = utf8.len(var_144_18)
				local var_144_21 = var_144_19 <= 0 and var_144_16 or var_144_16 * (var_144_20 / var_144_19)

				if var_144_21 > 0 and var_144_16 < var_144_21 then
					arg_141_1.talkMaxDuration = var_144_21

					if var_144_21 + var_144_15 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_21 + var_144_15
					end
				end

				arg_141_1.text_.text = var_144_18
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_22 = math.max(var_144_16, arg_141_1.talkMaxDuration)

			if var_144_15 <= arg_141_1.time_ and arg_141_1.time_ < var_144_15 + var_144_22 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_15) / var_144_22

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_15 + var_144_22 and arg_141_1.time_ < var_144_15 + var_144_22 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319671035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319671035
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play319671036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.875

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_2 = arg_145_1:GetWordFromCfg(319671035)
				local var_148_3 = arg_145_1:FormatText(var_148_2.content)

				arg_145_1.text_.text = var_148_3

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_4 = 35
				local var_148_5 = utf8.len(var_148_3)
				local var_148_6 = var_148_4 <= 0 and var_148_1 or var_148_1 * (var_148_5 / var_148_4)

				if var_148_6 > 0 and var_148_1 < var_148_6 then
					arg_145_1.talkMaxDuration = var_148_6

					if var_148_6 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_6 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_3
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_7 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_7 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_7

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_7 and arg_145_1.time_ < var_148_0 + var_148_7 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play319671036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319671036
		arg_149_1.duration_ = 4.541

		local var_149_0 = {
			zh = 3.975,
			ja = 4.541
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
				arg_149_0:Play319671037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = "ST69"

			if arg_149_1.bgs_[var_152_0] == nil then
				local var_152_1 = Object.Instantiate(arg_149_1.paintGo_)

				var_152_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_152_0)
				var_152_1.name = var_152_0
				var_152_1.transform.parent = arg_149_1.stage_.transform
				var_152_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_149_1.bgs_[var_152_0] = var_152_1
			end

			local var_152_2 = 1

			if var_152_2 < arg_149_1.time_ and arg_149_1.time_ <= var_152_2 + arg_152_0 then
				local var_152_3 = manager.ui.mainCamera.transform.localPosition
				local var_152_4 = Vector3.New(0, 0, 10) + Vector3.New(var_152_3.x, var_152_3.y, 0)
				local var_152_5 = arg_149_1.bgs_.ST69

				var_152_5.transform.localPosition = var_152_4
				var_152_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_152_6 = var_152_5:GetComponent("SpriteRenderer")

				if var_152_6 and var_152_6.sprite then
					local var_152_7 = (var_152_5.transform.localPosition - var_152_3).z
					local var_152_8 = manager.ui.mainCameraCom_
					local var_152_9 = 2 * var_152_7 * Mathf.Tan(var_152_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_152_10 = var_152_9 * var_152_8.aspect
					local var_152_11 = var_152_6.sprite.bounds.size.x
					local var_152_12 = var_152_6.sprite.bounds.size.y
					local var_152_13 = var_152_10 / var_152_11
					local var_152_14 = var_152_9 / var_152_12
					local var_152_15 = var_152_14 < var_152_13 and var_152_13 or var_152_14

					var_152_5.transform.localScale = Vector3.New(var_152_15, var_152_15, 0)
				end

				for iter_152_0, iter_152_1 in pairs(arg_149_1.bgs_) do
					if iter_152_0 ~= "ST69" then
						iter_152_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_152_16 = 0

			if var_152_16 < arg_149_1.time_ and arg_149_1.time_ <= var_152_16 + arg_152_0 then
				arg_149_1.allBtn_.enabled = false
			end

			local var_152_17 = 0.3

			if arg_149_1.time_ >= var_152_16 + var_152_17 and arg_149_1.time_ < var_152_16 + var_152_17 + arg_152_0 then
				arg_149_1.allBtn_.enabled = true
			end

			local var_152_18 = 0

			if var_152_18 < arg_149_1.time_ and arg_149_1.time_ <= var_152_18 + arg_152_0 then
				arg_149_1.mask_.enabled = true
				arg_149_1.mask_.raycastTarget = true

				arg_149_1:SetGaussion(false)
			end

			local var_152_19 = 1

			if var_152_18 <= arg_149_1.time_ and arg_149_1.time_ < var_152_18 + var_152_19 then
				local var_152_20 = (arg_149_1.time_ - var_152_18) / var_152_19
				local var_152_21 = Color.New(0, 0, 0)

				var_152_21.a = Mathf.Lerp(0, 1, var_152_20)
				arg_149_1.mask_.color = var_152_21
			end

			if arg_149_1.time_ >= var_152_18 + var_152_19 and arg_149_1.time_ < var_152_18 + var_152_19 + arg_152_0 then
				local var_152_22 = Color.New(0, 0, 0)

				var_152_22.a = 1
				arg_149_1.mask_.color = var_152_22
			end

			local var_152_23 = 1

			if var_152_23 < arg_149_1.time_ and arg_149_1.time_ <= var_152_23 + arg_152_0 then
				arg_149_1.mask_.enabled = true
				arg_149_1.mask_.raycastTarget = true

				arg_149_1:SetGaussion(false)
			end

			local var_152_24 = 2

			if var_152_23 <= arg_149_1.time_ and arg_149_1.time_ < var_152_23 + var_152_24 then
				local var_152_25 = (arg_149_1.time_ - var_152_23) / var_152_24
				local var_152_26 = Color.New(0, 0, 0)

				var_152_26.a = Mathf.Lerp(1, 0, var_152_25)
				arg_149_1.mask_.color = var_152_26
			end

			if arg_149_1.time_ >= var_152_23 + var_152_24 and arg_149_1.time_ < var_152_23 + var_152_24 + arg_152_0 then
				local var_152_27 = Color.New(0, 0, 0)
				local var_152_28 = 0

				arg_149_1.mask_.enabled = false
				var_152_27.a = var_152_28
				arg_149_1.mask_.color = var_152_27
			end

			local var_152_29 = arg_149_1.actors_["1095ui_story"].transform
			local var_152_30 = 1

			if var_152_30 < arg_149_1.time_ and arg_149_1.time_ <= var_152_30 + arg_152_0 then
				arg_149_1.var_.moveOldPos1095ui_story = var_152_29.localPosition
			end

			local var_152_31 = 0.001

			if var_152_30 <= arg_149_1.time_ and arg_149_1.time_ < var_152_30 + var_152_31 then
				local var_152_32 = (arg_149_1.time_ - var_152_30) / var_152_31
				local var_152_33 = Vector3.New(0, 100, 0)

				var_152_29.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1095ui_story, var_152_33, var_152_32)

				local var_152_34 = manager.ui.mainCamera.transform.position - var_152_29.position

				var_152_29.forward = Vector3.New(var_152_34.x, var_152_34.y, var_152_34.z)

				local var_152_35 = var_152_29.localEulerAngles

				var_152_35.z = 0
				var_152_35.x = 0
				var_152_29.localEulerAngles = var_152_35
			end

			if arg_149_1.time_ >= var_152_30 + var_152_31 and arg_149_1.time_ < var_152_30 + var_152_31 + arg_152_0 then
				var_152_29.localPosition = Vector3.New(0, 100, 0)

				local var_152_36 = manager.ui.mainCamera.transform.position - var_152_29.position

				var_152_29.forward = Vector3.New(var_152_36.x, var_152_36.y, var_152_36.z)

				local var_152_37 = var_152_29.localEulerAngles

				var_152_37.z = 0
				var_152_37.x = 0
				var_152_29.localEulerAngles = var_152_37
			end

			local var_152_38 = arg_149_1.actors_["1095ui_story"]
			local var_152_39 = 1

			if var_152_39 < arg_149_1.time_ and arg_149_1.time_ <= var_152_39 + arg_152_0 and arg_149_1.var_.characterEffect1095ui_story == nil then
				arg_149_1.var_.characterEffect1095ui_story = var_152_38:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_40 = 0.200000002980232

			if var_152_39 <= arg_149_1.time_ and arg_149_1.time_ < var_152_39 + var_152_40 then
				local var_152_41 = (arg_149_1.time_ - var_152_39) / var_152_40

				if arg_149_1.var_.characterEffect1095ui_story then
					local var_152_42 = Mathf.Lerp(0, 0.5, var_152_41)

					arg_149_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1095ui_story.fillRatio = var_152_42
				end
			end

			if arg_149_1.time_ >= var_152_39 + var_152_40 and arg_149_1.time_ < var_152_39 + var_152_40 + arg_152_0 and arg_149_1.var_.characterEffect1095ui_story then
				local var_152_43 = 0.5

				arg_149_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1095ui_story.fillRatio = var_152_43
			end

			local var_152_44 = arg_149_1.actors_["1084ui_story"].transform
			local var_152_45 = 1

			if var_152_45 < arg_149_1.time_ and arg_149_1.time_ <= var_152_45 + arg_152_0 then
				arg_149_1.var_.moveOldPos1084ui_story = var_152_44.localPosition
			end

			local var_152_46 = 0.001

			if var_152_45 <= arg_149_1.time_ and arg_149_1.time_ < var_152_45 + var_152_46 then
				local var_152_47 = (arg_149_1.time_ - var_152_45) / var_152_46
				local var_152_48 = Vector3.New(0, 100, 0)

				var_152_44.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1084ui_story, var_152_48, var_152_47)

				local var_152_49 = manager.ui.mainCamera.transform.position - var_152_44.position

				var_152_44.forward = Vector3.New(var_152_49.x, var_152_49.y, var_152_49.z)

				local var_152_50 = var_152_44.localEulerAngles

				var_152_50.z = 0
				var_152_50.x = 0
				var_152_44.localEulerAngles = var_152_50
			end

			if arg_149_1.time_ >= var_152_45 + var_152_46 and arg_149_1.time_ < var_152_45 + var_152_46 + arg_152_0 then
				var_152_44.localPosition = Vector3.New(0, 100, 0)

				local var_152_51 = manager.ui.mainCamera.transform.position - var_152_44.position

				var_152_44.forward = Vector3.New(var_152_51.x, var_152_51.y, var_152_51.z)

				local var_152_52 = var_152_44.localEulerAngles

				var_152_52.z = 0
				var_152_52.x = 0
				var_152_44.localEulerAngles = var_152_52
			end

			local var_152_53 = arg_149_1.actors_["1084ui_story"]
			local var_152_54 = 1

			if var_152_54 < arg_149_1.time_ and arg_149_1.time_ <= var_152_54 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story == nil then
				arg_149_1.var_.characterEffect1084ui_story = var_152_53:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_55 = 0.200000002980232

			if var_152_54 <= arg_149_1.time_ and arg_149_1.time_ < var_152_54 + var_152_55 then
				local var_152_56 = (arg_149_1.time_ - var_152_54) / var_152_55

				if arg_149_1.var_.characterEffect1084ui_story then
					local var_152_57 = Mathf.Lerp(0, 0.5, var_152_56)

					arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_57
				end
			end

			if arg_149_1.time_ >= var_152_54 + var_152_55 and arg_149_1.time_ < var_152_54 + var_152_55 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story then
				local var_152_58 = 0.5

				arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_58
			end

			if arg_149_1.frameCnt_ <= 1 then
				arg_149_1.dialog_:SetActive(false)
			end

			local var_152_59 = 2.875
			local var_152_60 = 0.125

			if var_152_59 < arg_149_1.time_ and arg_149_1.time_ <= var_152_59 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0

				arg_149_1.dialog_:SetActive(true)

				local var_152_61 = LeanTween.value(arg_149_1.dialog_, 0, 1, 0.3)

				var_152_61:setOnUpdate(LuaHelper.FloatAction(function(arg_153_0)
					arg_149_1.dialogCg_.alpha = arg_153_0
				end))
				var_152_61:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_149_1.dialog_)
					var_152_61:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_149_1.duration_ = arg_149_1.duration_ + 0.3

				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_62 = arg_149_1:FormatText(StoryNameCfg[660].name)

				arg_149_1.leftNameTxt_.text = var_152_62

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_63 = arg_149_1:GetWordFromCfg(319671036)
				local var_152_64 = arg_149_1:FormatText(var_152_63.content)

				arg_149_1.text_.text = var_152_64

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_65 = 5
				local var_152_66 = utf8.len(var_152_64)
				local var_152_67 = var_152_65 <= 0 and var_152_60 or var_152_60 * (var_152_66 / var_152_65)

				if var_152_67 > 0 and var_152_60 < var_152_67 then
					arg_149_1.talkMaxDuration = var_152_67
					var_152_59 = var_152_59 + 0.3

					if var_152_67 + var_152_59 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_67 + var_152_59
					end
				end

				arg_149_1.text_.text = var_152_64
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671036", "story_v_out_319671.awb") ~= 0 then
					local var_152_68 = manager.audio:GetVoiceLength("story_v_out_319671", "319671036", "story_v_out_319671.awb") / 1000

					if var_152_68 + var_152_59 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_68 + var_152_59
					end

					if var_152_63.prefab_name ~= "" and arg_149_1.actors_[var_152_63.prefab_name] ~= nil then
						local var_152_69 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_63.prefab_name].transform, "story_v_out_319671", "319671036", "story_v_out_319671.awb")

						arg_149_1:RecordAudio("319671036", var_152_69)
						arg_149_1:RecordAudio("319671036", var_152_69)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_319671", "319671036", "story_v_out_319671.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_319671", "319671036", "story_v_out_319671.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_70 = var_152_59 + 0.3
			local var_152_71 = math.max(var_152_60, arg_149_1.talkMaxDuration)

			if var_152_70 <= arg_149_1.time_ and arg_149_1.time_ < var_152_70 + var_152_71 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_70) / var_152_71

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_70 + var_152_71 and arg_149_1.time_ < var_152_70 + var_152_71 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play319671037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 319671037
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play319671038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.75

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, false)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_2 = arg_155_1:GetWordFromCfg(319671037)
				local var_158_3 = arg_155_1:FormatText(var_158_2.content)

				arg_155_1.text_.text = var_158_3

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_4 = 30
				local var_158_5 = utf8.len(var_158_3)
				local var_158_6 = var_158_4 <= 0 and var_158_1 or var_158_1 * (var_158_5 / var_158_4)

				if var_158_6 > 0 and var_158_1 < var_158_6 then
					arg_155_1.talkMaxDuration = var_158_6

					if var_158_6 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_6 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_3
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_7 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_7 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_7

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_7 and arg_155_1.time_ < var_158_0 + var_158_7 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play319671038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 319671038
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play319671039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.925

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, false)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_2 = arg_159_1:GetWordFromCfg(319671038)
				local var_162_3 = arg_159_1:FormatText(var_162_2.content)

				arg_159_1.text_.text = var_162_3

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_4 = 37
				local var_162_5 = utf8.len(var_162_3)
				local var_162_6 = var_162_4 <= 0 and var_162_1 or var_162_1 * (var_162_5 / var_162_4)

				if var_162_6 > 0 and var_162_1 < var_162_6 then
					arg_159_1.talkMaxDuration = var_162_6

					if var_162_6 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_6 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_3
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)
				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_7 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_7 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_7

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_7 and arg_159_1.time_ < var_162_0 + var_162_7 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play319671039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 319671039
		arg_163_1.duration_ = 6.1

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play319671040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.2

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				local var_166_2 = "play"
				local var_166_3 = "music"

				arg_163_1:AudioAction(var_166_2, var_166_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_166_4 = manager.ui.mainCamera.transform
			local var_166_5 = 0

			if var_166_5 < arg_163_1.time_ and arg_163_1.time_ <= var_166_5 + arg_166_0 then
				local var_166_6 = arg_163_1.var_.effect119

				if not var_166_6 then
					var_166_6 = Object.Instantiate(Asset.Load("Effect/Scene/fx_uistory_error"))
					var_166_6.name = "119"
					arg_163_1.var_.effect119 = var_166_6
				end

				local var_166_7 = var_166_4:Find("")

				if var_166_7 then
					var_166_6.transform.parent = var_166_7
				else
					var_166_6.transform.parent = var_166_4
				end

				var_166_6.transform.localPosition = Vector3.New(0, 0, 0)
				var_166_6.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			if arg_163_1.frameCnt_ <= 1 then
				arg_163_1.dialog_:SetActive(false)
			end

			local var_166_8 = 1.1
			local var_166_9 = 1.425

			if var_166_8 < arg_163_1.time_ and arg_163_1.time_ <= var_166_8 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0

				arg_163_1.dialog_:SetActive(true)

				local var_166_10 = LeanTween.value(arg_163_1.dialog_, 0, 1, 0.3)

				var_166_10:setOnUpdate(LuaHelper.FloatAction(function(arg_167_0)
					arg_163_1.dialogCg_.alpha = arg_167_0
				end))
				var_166_10:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_163_1.dialog_)
					var_166_10:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_163_1.duration_ = arg_163_1.duration_ + 0.3

				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_11 = arg_163_1:GetWordFromCfg(319671039)
				local var_166_12 = arg_163_1:FormatText(var_166_11.content)

				arg_163_1.text_.text = var_166_12

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_13 = 57
				local var_166_14 = utf8.len(var_166_12)
				local var_166_15 = var_166_13 <= 0 and var_166_9 or var_166_9 * (var_166_14 / var_166_13)

				if var_166_15 > 0 and var_166_9 < var_166_15 then
					arg_163_1.talkMaxDuration = var_166_15
					var_166_8 = var_166_8 + 0.3

					if var_166_15 + var_166_8 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_15 + var_166_8
					end
				end

				arg_163_1.text_.text = var_166_12
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_16 = var_166_8 + 0.3
			local var_166_17 = math.max(var_166_9, arg_163_1.talkMaxDuration)

			if var_166_16 <= arg_163_1.time_ and arg_163_1.time_ < var_166_16 + var_166_17 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_16) / var_166_17

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_16 + var_166_17 and arg_163_1.time_ < var_166_16 + var_166_17 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play319671040 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 319671040
		arg_169_1.duration_ = 3

		local var_169_0 = {
			zh = 2.3,
			ja = 3
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
				arg_169_0:Play319671041(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = "10014ui_story"

			if arg_169_1.actors_[var_172_0] == nil then
				local var_172_1 = Object.Instantiate(Asset.Load("Char/" .. var_172_0), arg_169_1.stage_.transform)

				var_172_1.name = var_172_0
				var_172_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_169_1.actors_[var_172_0] = var_172_1

				local var_172_2 = var_172_1:GetComponentInChildren(typeof(CharacterEffect))

				var_172_2.enabled = true

				local var_172_3 = GameObjectTools.GetOrAddComponent(var_172_1, typeof(DynamicBoneHelper))

				if var_172_3 then
					var_172_3:EnableDynamicBone(false)
				end

				arg_169_1:ShowWeapon(var_172_2.transform, false)

				arg_169_1.var_[var_172_0 .. "Animator"] = var_172_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_169_1.var_[var_172_0 .. "Animator"].applyRootMotion = true
				arg_169_1.var_[var_172_0 .. "LipSync"] = var_172_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_172_4 = arg_169_1.actors_["10014ui_story"].transform
			local var_172_5 = 0

			if var_172_5 < arg_169_1.time_ and arg_169_1.time_ <= var_172_5 + arg_172_0 then
				arg_169_1.var_.moveOldPos10014ui_story = var_172_4.localPosition
			end

			local var_172_6 = 0.001

			if var_172_5 <= arg_169_1.time_ and arg_169_1.time_ < var_172_5 + var_172_6 then
				local var_172_7 = (arg_169_1.time_ - var_172_5) / var_172_6
				local var_172_8 = Vector3.New(0, -1.06, -6.2)

				var_172_4.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos10014ui_story, var_172_8, var_172_7)

				local var_172_9 = manager.ui.mainCamera.transform.position - var_172_4.position

				var_172_4.forward = Vector3.New(var_172_9.x, var_172_9.y, var_172_9.z)

				local var_172_10 = var_172_4.localEulerAngles

				var_172_10.z = 0
				var_172_10.x = 0
				var_172_4.localEulerAngles = var_172_10
			end

			if arg_169_1.time_ >= var_172_5 + var_172_6 and arg_169_1.time_ < var_172_5 + var_172_6 + arg_172_0 then
				var_172_4.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_172_11 = manager.ui.mainCamera.transform.position - var_172_4.position

				var_172_4.forward = Vector3.New(var_172_11.x, var_172_11.y, var_172_11.z)

				local var_172_12 = var_172_4.localEulerAngles

				var_172_12.z = 0
				var_172_12.x = 0
				var_172_4.localEulerAngles = var_172_12
			end

			local var_172_13 = arg_169_1.actors_["10014ui_story"]
			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 and arg_169_1.var_.characterEffect10014ui_story == nil then
				arg_169_1.var_.characterEffect10014ui_story = var_172_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_15 = 0.200000002980232

			if var_172_14 <= arg_169_1.time_ and arg_169_1.time_ < var_172_14 + var_172_15 then
				local var_172_16 = (arg_169_1.time_ - var_172_14) / var_172_15

				if arg_169_1.var_.characterEffect10014ui_story then
					arg_169_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_14 + var_172_15 and arg_169_1.time_ < var_172_14 + var_172_15 + arg_172_0 and arg_169_1.var_.characterEffect10014ui_story then
				arg_169_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_172_17 = 0

			if var_172_17 < arg_169_1.time_ and arg_169_1.time_ <= var_172_17 + arg_172_0 then
				arg_169_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_172_18 = 0

			if var_172_18 < arg_169_1.time_ and arg_169_1.time_ <= var_172_18 + arg_172_0 then
				arg_169_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_172_19 = 0
			local var_172_20 = 0.2

			if var_172_19 < arg_169_1.time_ and arg_169_1.time_ <= var_172_19 + arg_172_0 then
				local var_172_21 = "play"
				local var_172_22 = "music"

				arg_169_1:AudioAction(var_172_21, var_172_22, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_172_23 = 0.233333333333333
			local var_172_24 = 1

			if var_172_23 < arg_169_1.time_ and arg_169_1.time_ <= var_172_23 + arg_172_0 then
				local var_172_25 = "play"
				local var_172_26 = "music"

				arg_169_1:AudioAction(var_172_25, var_172_26, "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue", "bgm_activity_3_0_story_intense_argue.awb")
			end

			local var_172_27 = manager.ui.mainCamera.transform
			local var_172_28 = 0

			if var_172_28 < arg_169_1.time_ and arg_169_1.time_ <= var_172_28 + arg_172_0 then
				local var_172_29 = arg_169_1.var_.effect119

				if var_172_29 then
					Object.Destroy(var_172_29)

					arg_169_1.var_.effect119 = nil
				end
			end

			local var_172_30 = arg_169_1.actors_["10014ui_story"]
			local var_172_31 = 0

			if var_172_31 < arg_169_1.time_ and arg_169_1.time_ <= var_172_31 + arg_172_0 then
				if arg_169_1.var_.characterEffect10014ui_story == nil then
					arg_169_1.var_.characterEffect10014ui_story = var_172_30:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_172_32 = arg_169_1.var_.characterEffect10014ui_story

				var_172_32.imageEffect:turnOff()

				var_172_32.interferenceEffect.enabled = true
				var_172_32.interferenceEffect.noise = 0.001
				var_172_32.interferenceEffect.simTimeScale = 1
				var_172_32.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_172_33 = arg_169_1.actors_["10014ui_story"]
			local var_172_34 = 0
			local var_172_35 = 2

			if var_172_34 < arg_169_1.time_ and arg_169_1.time_ <= var_172_34 + arg_172_0 then
				if arg_169_1.var_.characterEffect10014ui_story == nil then
					arg_169_1.var_.characterEffect10014ui_story = var_172_33:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_169_1.var_.characterEffect10014ui_story.imageEffect:turnOn(false)
			end

			local var_172_36 = 0
			local var_172_37 = 0.225

			if var_172_36 < arg_169_1.time_ and arg_169_1.time_ <= var_172_36 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_38 = arg_169_1:FormatText(StoryNameCfg[264].name)

				arg_169_1.leftNameTxt_.text = var_172_38

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_39 = arg_169_1:GetWordFromCfg(319671040)
				local var_172_40 = arg_169_1:FormatText(var_172_39.content)

				arg_169_1.text_.text = var_172_40

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_41 = 9
				local var_172_42 = utf8.len(var_172_40)
				local var_172_43 = var_172_41 <= 0 and var_172_37 or var_172_37 * (var_172_42 / var_172_41)

				if var_172_43 > 0 and var_172_37 < var_172_43 then
					arg_169_1.talkMaxDuration = var_172_43

					if var_172_43 + var_172_36 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_43 + var_172_36
					end
				end

				arg_169_1.text_.text = var_172_40
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671040", "story_v_out_319671.awb") ~= 0 then
					local var_172_44 = manager.audio:GetVoiceLength("story_v_out_319671", "319671040", "story_v_out_319671.awb") / 1000

					if var_172_44 + var_172_36 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_44 + var_172_36
					end

					if var_172_39.prefab_name ~= "" and arg_169_1.actors_[var_172_39.prefab_name] ~= nil then
						local var_172_45 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_39.prefab_name].transform, "story_v_out_319671", "319671040", "story_v_out_319671.awb")

						arg_169_1:RecordAudio("319671040", var_172_45)
						arg_169_1:RecordAudio("319671040", var_172_45)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_319671", "319671040", "story_v_out_319671.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_319671", "319671040", "story_v_out_319671.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_46 = math.max(var_172_37, arg_169_1.talkMaxDuration)

			if var_172_36 <= arg_169_1.time_ and arg_169_1.time_ < var_172_36 + var_172_46 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_36) / var_172_46

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_36 + var_172_46 and arg_169_1.time_ < var_172_36 + var_172_46 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play319671041 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 319671041
		arg_173_1.duration_ = 4.9

		local var_173_0 = {
			zh = 3.066,
			ja = 4.9
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
				arg_173_0:Play319671042(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1084ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1084ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(0.7, -0.97, -6)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1084ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = arg_173_1.actors_["1084ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1084ui_story == nil then
				arg_173_1.var_.characterEffect1084ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.200000002980232

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1084ui_story then
					arg_173_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1084ui_story then
				arg_173_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_176_13 = 0

			if var_176_13 < arg_173_1.time_ and arg_173_1.time_ <= var_176_13 + arg_176_0 then
				arg_173_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_176_15 = arg_173_1.actors_["10014ui_story"].transform
			local var_176_16 = 0

			if var_176_16 < arg_173_1.time_ and arg_173_1.time_ <= var_176_16 + arg_176_0 then
				arg_173_1.var_.moveOldPos10014ui_story = var_176_15.localPosition
			end

			local var_176_17 = 0.001

			if var_176_16 <= arg_173_1.time_ and arg_173_1.time_ < var_176_16 + var_176_17 then
				local var_176_18 = (arg_173_1.time_ - var_176_16) / var_176_17
				local var_176_19 = Vector3.New(-0.7, -1.06, -6.2)

				var_176_15.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos10014ui_story, var_176_19, var_176_18)

				local var_176_20 = manager.ui.mainCamera.transform.position - var_176_15.position

				var_176_15.forward = Vector3.New(var_176_20.x, var_176_20.y, var_176_20.z)

				local var_176_21 = var_176_15.localEulerAngles

				var_176_21.z = 0
				var_176_21.x = 0
				var_176_15.localEulerAngles = var_176_21
			end

			if arg_173_1.time_ >= var_176_16 + var_176_17 and arg_173_1.time_ < var_176_16 + var_176_17 + arg_176_0 then
				var_176_15.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_176_22 = manager.ui.mainCamera.transform.position - var_176_15.position

				var_176_15.forward = Vector3.New(var_176_22.x, var_176_22.y, var_176_22.z)

				local var_176_23 = var_176_15.localEulerAngles

				var_176_23.z = 0
				var_176_23.x = 0
				var_176_15.localEulerAngles = var_176_23
			end

			local var_176_24 = arg_173_1.actors_["10014ui_story"]
			local var_176_25 = 0

			if var_176_25 < arg_173_1.time_ and arg_173_1.time_ <= var_176_25 + arg_176_0 and arg_173_1.var_.characterEffect10014ui_story == nil then
				arg_173_1.var_.characterEffect10014ui_story = var_176_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_26 = 0.200000002980232

			if var_176_25 <= arg_173_1.time_ and arg_173_1.time_ < var_176_25 + var_176_26 then
				local var_176_27 = (arg_173_1.time_ - var_176_25) / var_176_26

				if arg_173_1.var_.characterEffect10014ui_story then
					local var_176_28 = Mathf.Lerp(0, 0.5, var_176_27)

					arg_173_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_173_1.var_.characterEffect10014ui_story.fillRatio = var_176_28
				end
			end

			if arg_173_1.time_ >= var_176_25 + var_176_26 and arg_173_1.time_ < var_176_25 + var_176_26 + arg_176_0 and arg_173_1.var_.characterEffect10014ui_story then
				local var_176_29 = 0.5

				arg_173_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_173_1.var_.characterEffect10014ui_story.fillRatio = var_176_29
			end

			local var_176_30 = 0
			local var_176_31 = 0.25

			if var_176_30 < arg_173_1.time_ and arg_173_1.time_ <= var_176_30 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_32 = arg_173_1:FormatText(StoryNameCfg[6].name)

				arg_173_1.leftNameTxt_.text = var_176_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_33 = arg_173_1:GetWordFromCfg(319671041)
				local var_176_34 = arg_173_1:FormatText(var_176_33.content)

				arg_173_1.text_.text = var_176_34

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_35 = 10
				local var_176_36 = utf8.len(var_176_34)
				local var_176_37 = var_176_35 <= 0 and var_176_31 or var_176_31 * (var_176_36 / var_176_35)

				if var_176_37 > 0 and var_176_31 < var_176_37 then
					arg_173_1.talkMaxDuration = var_176_37

					if var_176_37 + var_176_30 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_37 + var_176_30
					end
				end

				arg_173_1.text_.text = var_176_34
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671041", "story_v_out_319671.awb") ~= 0 then
					local var_176_38 = manager.audio:GetVoiceLength("story_v_out_319671", "319671041", "story_v_out_319671.awb") / 1000

					if var_176_38 + var_176_30 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_38 + var_176_30
					end

					if var_176_33.prefab_name ~= "" and arg_173_1.actors_[var_176_33.prefab_name] ~= nil then
						local var_176_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_33.prefab_name].transform, "story_v_out_319671", "319671041", "story_v_out_319671.awb")

						arg_173_1:RecordAudio("319671041", var_176_39)
						arg_173_1:RecordAudio("319671041", var_176_39)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_319671", "319671041", "story_v_out_319671.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_319671", "319671041", "story_v_out_319671.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_40 = math.max(var_176_31, arg_173_1.talkMaxDuration)

			if var_176_30 <= arg_173_1.time_ and arg_173_1.time_ < var_176_30 + var_176_40 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_30) / var_176_40

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_30 + var_176_40 and arg_173_1.time_ < var_176_30 + var_176_40 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play319671042 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 319671042
		arg_177_1.duration_ = 13.566

		local var_177_0 = {
			zh = 9.166,
			ja = 13.566
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
				arg_177_0:Play319671043(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1084ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1084ui_story == nil then
				arg_177_1.var_.characterEffect1084ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.200000002980232

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1084ui_story then
					local var_180_4 = Mathf.Lerp(0, 0.5, var_180_3)

					arg_177_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1084ui_story.fillRatio = var_180_4
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1084ui_story then
				local var_180_5 = 0.5

				arg_177_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1084ui_story.fillRatio = var_180_5
			end

			local var_180_6 = 0

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 then
				arg_177_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action1_1")
			end

			local var_180_7 = 0

			if var_180_7 < arg_177_1.time_ and arg_177_1.time_ <= var_180_7 + arg_180_0 then
				arg_177_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_180_8 = arg_177_1.actors_["10014ui_story"]
			local var_180_9 = 0

			if var_180_9 < arg_177_1.time_ and arg_177_1.time_ <= var_180_9 + arg_180_0 and arg_177_1.var_.characterEffect10014ui_story == nil then
				arg_177_1.var_.characterEffect10014ui_story = var_180_8:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_10 = 0.200000002980232

			if var_180_9 <= arg_177_1.time_ and arg_177_1.time_ < var_180_9 + var_180_10 then
				local var_180_11 = (arg_177_1.time_ - var_180_9) / var_180_10

				if arg_177_1.var_.characterEffect10014ui_story then
					arg_177_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_9 + var_180_10 and arg_177_1.time_ < var_180_9 + var_180_10 + arg_180_0 and arg_177_1.var_.characterEffect10014ui_story then
				arg_177_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_180_12 = 0
			local var_180_13 = 1.025

			if var_180_12 < arg_177_1.time_ and arg_177_1.time_ <= var_180_12 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_14 = arg_177_1:FormatText(StoryNameCfg[264].name)

				arg_177_1.leftNameTxt_.text = var_180_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_15 = arg_177_1:GetWordFromCfg(319671042)
				local var_180_16 = arg_177_1:FormatText(var_180_15.content)

				arg_177_1.text_.text = var_180_16

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_17 = 41
				local var_180_18 = utf8.len(var_180_16)
				local var_180_19 = var_180_17 <= 0 and var_180_13 or var_180_13 * (var_180_18 / var_180_17)

				if var_180_19 > 0 and var_180_13 < var_180_19 then
					arg_177_1.talkMaxDuration = var_180_19

					if var_180_19 + var_180_12 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_12
					end
				end

				arg_177_1.text_.text = var_180_16
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671042", "story_v_out_319671.awb") ~= 0 then
					local var_180_20 = manager.audio:GetVoiceLength("story_v_out_319671", "319671042", "story_v_out_319671.awb") / 1000

					if var_180_20 + var_180_12 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_20 + var_180_12
					end

					if var_180_15.prefab_name ~= "" and arg_177_1.actors_[var_180_15.prefab_name] ~= nil then
						local var_180_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_15.prefab_name].transform, "story_v_out_319671", "319671042", "story_v_out_319671.awb")

						arg_177_1:RecordAudio("319671042", var_180_21)
						arg_177_1:RecordAudio("319671042", var_180_21)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_319671", "319671042", "story_v_out_319671.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_319671", "319671042", "story_v_out_319671.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_22 = math.max(var_180_13, arg_177_1.talkMaxDuration)

			if var_180_12 <= arg_177_1.time_ and arg_177_1.time_ < var_180_12 + var_180_22 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_12) / var_180_22

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_12 + var_180_22 and arg_177_1.time_ < var_180_12 + var_180_22 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play319671043 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 319671043
		arg_181_1.duration_ = 9.2

		local var_181_0 = {
			zh = 4.433,
			ja = 9.2
		}
		local var_181_1 = manager.audio:GetLocalizationFlag()

		if var_181_0[var_181_1] ~= nil then
			arg_181_1.duration_ = var_181_0[var_181_1]
		end

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play319671044(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["10014ui_story"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos10014ui_story = var_184_0.localPosition
			end

			local var_184_2 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2
				local var_184_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos10014ui_story, var_184_4, var_184_3)

				local var_184_5 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_5.x, var_184_5.y, var_184_5.z)

				local var_184_6 = var_184_0.localEulerAngles

				var_184_6.z = 0
				var_184_6.x = 0
				var_184_0.localEulerAngles = var_184_6
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_184_7 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_7.x, var_184_7.y, var_184_7.z)

				local var_184_8 = var_184_0.localEulerAngles

				var_184_8.z = 0
				var_184_8.x = 0
				var_184_0.localEulerAngles = var_184_8
			end

			local var_184_9 = 0

			if var_184_9 < arg_181_1.time_ and arg_181_1.time_ <= var_184_9 + arg_184_0 then
				arg_181_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action4_1")
			end

			local var_184_10 = 0

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 then
				arg_181_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_184_11 = 0
			local var_184_12 = 0.475

			if var_184_11 < arg_181_1.time_ and arg_181_1.time_ <= var_184_11 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_13 = arg_181_1:FormatText(StoryNameCfg[264].name)

				arg_181_1.leftNameTxt_.text = var_184_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_14 = arg_181_1:GetWordFromCfg(319671043)
				local var_184_15 = arg_181_1:FormatText(var_184_14.content)

				arg_181_1.text_.text = var_184_15

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_16 = 19
				local var_184_17 = utf8.len(var_184_15)
				local var_184_18 = var_184_16 <= 0 and var_184_12 or var_184_12 * (var_184_17 / var_184_16)

				if var_184_18 > 0 and var_184_12 < var_184_18 then
					arg_181_1.talkMaxDuration = var_184_18

					if var_184_18 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_18 + var_184_11
					end
				end

				arg_181_1.text_.text = var_184_15
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671043", "story_v_out_319671.awb") ~= 0 then
					local var_184_19 = manager.audio:GetVoiceLength("story_v_out_319671", "319671043", "story_v_out_319671.awb") / 1000

					if var_184_19 + var_184_11 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_19 + var_184_11
					end

					if var_184_14.prefab_name ~= "" and arg_181_1.actors_[var_184_14.prefab_name] ~= nil then
						local var_184_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_14.prefab_name].transform, "story_v_out_319671", "319671043", "story_v_out_319671.awb")

						arg_181_1:RecordAudio("319671043", var_184_20)
						arg_181_1:RecordAudio("319671043", var_184_20)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_319671", "319671043", "story_v_out_319671.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_319671", "319671043", "story_v_out_319671.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_21 = math.max(var_184_12, arg_181_1.talkMaxDuration)

			if var_184_11 <= arg_181_1.time_ and arg_181_1.time_ < var_184_11 + var_184_21 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_11) / var_184_21

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_11 + var_184_21 and arg_181_1.time_ < var_184_11 + var_184_21 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play319671044 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 319671044
		arg_185_1.duration_ = 5.6

		local var_185_0 = {
			zh = 4.8,
			ja = 5.6
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
				arg_185_0:Play319671045(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1084ui_story"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos1084ui_story = var_188_0.localPosition
			end

			local var_188_2 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2
				local var_188_4 = Vector3.New(0.7, -0.97, -6)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1084ui_story, var_188_4, var_188_3)

				local var_188_5 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_5.x, var_188_5.y, var_188_5.z)

				local var_188_6 = var_188_0.localEulerAngles

				var_188_6.z = 0
				var_188_6.x = 0
				var_188_0.localEulerAngles = var_188_6
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_188_7 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_7.x, var_188_7.y, var_188_7.z)

				local var_188_8 = var_188_0.localEulerAngles

				var_188_8.z = 0
				var_188_8.x = 0
				var_188_0.localEulerAngles = var_188_8
			end

			local var_188_9 = arg_185_1.actors_["1084ui_story"]
			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect1084ui_story == nil then
				arg_185_1.var_.characterEffect1084ui_story = var_188_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_11 = 0.200000002980232

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_10) / var_188_11

				if arg_185_1.var_.characterEffect1084ui_story then
					arg_185_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_10 + var_188_11 and arg_185_1.time_ < var_188_10 + var_188_11 + arg_188_0 and arg_185_1.var_.characterEffect1084ui_story then
				arg_185_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_188_13 = 0

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_188_14 = arg_185_1.actors_["10014ui_story"]
			local var_188_15 = 0

			if var_188_15 < arg_185_1.time_ and arg_185_1.time_ <= var_188_15 + arg_188_0 and arg_185_1.var_.characterEffect10014ui_story == nil then
				arg_185_1.var_.characterEffect10014ui_story = var_188_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_16 = 0.200000002980232

			if var_188_15 <= arg_185_1.time_ and arg_185_1.time_ < var_188_15 + var_188_16 then
				local var_188_17 = (arg_185_1.time_ - var_188_15) / var_188_16

				if arg_185_1.var_.characterEffect10014ui_story then
					local var_188_18 = Mathf.Lerp(0, 0.5, var_188_17)

					arg_185_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_185_1.var_.characterEffect10014ui_story.fillRatio = var_188_18
				end
			end

			if arg_185_1.time_ >= var_188_15 + var_188_16 and arg_185_1.time_ < var_188_15 + var_188_16 + arg_188_0 and arg_185_1.var_.characterEffect10014ui_story then
				local var_188_19 = 0.5

				arg_185_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_185_1.var_.characterEffect10014ui_story.fillRatio = var_188_19
			end

			local var_188_20 = 0
			local var_188_21 = 0.6

			if var_188_20 < arg_185_1.time_ and arg_185_1.time_ <= var_188_20 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_22 = arg_185_1:FormatText(StoryNameCfg[6].name)

				arg_185_1.leftNameTxt_.text = var_188_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_23 = arg_185_1:GetWordFromCfg(319671044)
				local var_188_24 = arg_185_1:FormatText(var_188_23.content)

				arg_185_1.text_.text = var_188_24

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_25 = 24
				local var_188_26 = utf8.len(var_188_24)
				local var_188_27 = var_188_25 <= 0 and var_188_21 or var_188_21 * (var_188_26 / var_188_25)

				if var_188_27 > 0 and var_188_21 < var_188_27 then
					arg_185_1.talkMaxDuration = var_188_27

					if var_188_27 + var_188_20 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_27 + var_188_20
					end
				end

				arg_185_1.text_.text = var_188_24
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671044", "story_v_out_319671.awb") ~= 0 then
					local var_188_28 = manager.audio:GetVoiceLength("story_v_out_319671", "319671044", "story_v_out_319671.awb") / 1000

					if var_188_28 + var_188_20 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_28 + var_188_20
					end

					if var_188_23.prefab_name ~= "" and arg_185_1.actors_[var_188_23.prefab_name] ~= nil then
						local var_188_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_23.prefab_name].transform, "story_v_out_319671", "319671044", "story_v_out_319671.awb")

						arg_185_1:RecordAudio("319671044", var_188_29)
						arg_185_1:RecordAudio("319671044", var_188_29)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_319671", "319671044", "story_v_out_319671.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_319671", "319671044", "story_v_out_319671.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_30 = math.max(var_188_21, arg_185_1.talkMaxDuration)

			if var_188_20 <= arg_185_1.time_ and arg_185_1.time_ < var_188_20 + var_188_30 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_20) / var_188_30

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_20 + var_188_30 and arg_185_1.time_ < var_188_20 + var_188_30 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play319671045 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319671045
		arg_189_1.duration_ = 8.733

		local var_189_0 = {
			zh = 8.733,
			ja = 7.433
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
				arg_189_0:Play319671046(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1084ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect1084ui_story == nil then
				arg_189_1.var_.characterEffect1084ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.200000002980232

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect1084ui_story then
					local var_192_4 = Mathf.Lerp(0, 0.5, var_192_3)

					arg_189_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_189_1.var_.characterEffect1084ui_story.fillRatio = var_192_4
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect1084ui_story then
				local var_192_5 = 0.5

				arg_189_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_189_1.var_.characterEffect1084ui_story.fillRatio = var_192_5
			end

			local var_192_6 = arg_189_1.actors_["10014ui_story"]
			local var_192_7 = 0

			if var_192_7 < arg_189_1.time_ and arg_189_1.time_ <= var_192_7 + arg_192_0 and arg_189_1.var_.characterEffect10014ui_story == nil then
				arg_189_1.var_.characterEffect10014ui_story = var_192_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_8 = 0.200000002980232

			if var_192_7 <= arg_189_1.time_ and arg_189_1.time_ < var_192_7 + var_192_8 then
				local var_192_9 = (arg_189_1.time_ - var_192_7) / var_192_8

				if arg_189_1.var_.characterEffect10014ui_story then
					arg_189_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_7 + var_192_8 and arg_189_1.time_ < var_192_7 + var_192_8 + arg_192_0 and arg_189_1.var_.characterEffect10014ui_story then
				arg_189_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_192_10 = 0
			local var_192_11 = 1.025

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_12 = arg_189_1:FormatText(StoryNameCfg[264].name)

				arg_189_1.leftNameTxt_.text = var_192_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_13 = arg_189_1:GetWordFromCfg(319671045)
				local var_192_14 = arg_189_1:FormatText(var_192_13.content)

				arg_189_1.text_.text = var_192_14

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_15 = 41
				local var_192_16 = utf8.len(var_192_14)
				local var_192_17 = var_192_15 <= 0 and var_192_11 or var_192_11 * (var_192_16 / var_192_15)

				if var_192_17 > 0 and var_192_11 < var_192_17 then
					arg_189_1.talkMaxDuration = var_192_17

					if var_192_17 + var_192_10 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_17 + var_192_10
					end
				end

				arg_189_1.text_.text = var_192_14
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671045", "story_v_out_319671.awb") ~= 0 then
					local var_192_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671045", "story_v_out_319671.awb") / 1000

					if var_192_18 + var_192_10 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_18 + var_192_10
					end

					if var_192_13.prefab_name ~= "" and arg_189_1.actors_[var_192_13.prefab_name] ~= nil then
						local var_192_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_13.prefab_name].transform, "story_v_out_319671", "319671045", "story_v_out_319671.awb")

						arg_189_1:RecordAudio("319671045", var_192_19)
						arg_189_1:RecordAudio("319671045", var_192_19)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_319671", "319671045", "story_v_out_319671.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_319671", "319671045", "story_v_out_319671.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_20 = math.max(var_192_11, arg_189_1.talkMaxDuration)

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_20 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_10) / var_192_20

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_10 + var_192_20 and arg_189_1.time_ < var_192_10 + var_192_20 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play319671046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 319671046
		arg_193_1.duration_ = 6.333

		local var_193_0 = {
			zh = 5.033,
			ja = 6.333
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
				arg_193_0:Play319671047(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_196_2 = arg_193_1.actors_["1084ui_story"]
			local var_196_3 = 0

			if var_196_3 < arg_193_1.time_ and arg_193_1.time_ <= var_196_3 + arg_196_0 and arg_193_1.var_.characterEffect1084ui_story == nil then
				arg_193_1.var_.characterEffect1084ui_story = var_196_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_4 = 0.200000002980232

			if var_196_3 <= arg_193_1.time_ and arg_193_1.time_ < var_196_3 + var_196_4 then
				local var_196_5 = (arg_193_1.time_ - var_196_3) / var_196_4

				if arg_193_1.var_.characterEffect1084ui_story then
					arg_193_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_3 + var_196_4 and arg_193_1.time_ < var_196_3 + var_196_4 + arg_196_0 and arg_193_1.var_.characterEffect1084ui_story then
				arg_193_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_196_6 = arg_193_1.actors_["10014ui_story"]
			local var_196_7 = 0

			if var_196_7 < arg_193_1.time_ and arg_193_1.time_ <= var_196_7 + arg_196_0 and arg_193_1.var_.characterEffect10014ui_story == nil then
				arg_193_1.var_.characterEffect10014ui_story = var_196_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_8 = 0.200000002980232

			if var_196_7 <= arg_193_1.time_ and arg_193_1.time_ < var_196_7 + var_196_8 then
				local var_196_9 = (arg_193_1.time_ - var_196_7) / var_196_8

				if arg_193_1.var_.characterEffect10014ui_story then
					local var_196_10 = Mathf.Lerp(0, 0.5, var_196_9)

					arg_193_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_193_1.var_.characterEffect10014ui_story.fillRatio = var_196_10
				end
			end

			if arg_193_1.time_ >= var_196_7 + var_196_8 and arg_193_1.time_ < var_196_7 + var_196_8 + arg_196_0 and arg_193_1.var_.characterEffect10014ui_story then
				local var_196_11 = 0.5

				arg_193_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_193_1.var_.characterEffect10014ui_story.fillRatio = var_196_11
			end

			local var_196_12 = 0
			local var_196_13 = 0.525

			if var_196_12 < arg_193_1.time_ and arg_193_1.time_ <= var_196_12 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_14 = arg_193_1:FormatText(StoryNameCfg[6].name)

				arg_193_1.leftNameTxt_.text = var_196_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_15 = arg_193_1:GetWordFromCfg(319671046)
				local var_196_16 = arg_193_1:FormatText(var_196_15.content)

				arg_193_1.text_.text = var_196_16

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_17 = 21
				local var_196_18 = utf8.len(var_196_16)
				local var_196_19 = var_196_17 <= 0 and var_196_13 or var_196_13 * (var_196_18 / var_196_17)

				if var_196_19 > 0 and var_196_13 < var_196_19 then
					arg_193_1.talkMaxDuration = var_196_19

					if var_196_19 + var_196_12 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_19 + var_196_12
					end
				end

				arg_193_1.text_.text = var_196_16
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671046", "story_v_out_319671.awb") ~= 0 then
					local var_196_20 = manager.audio:GetVoiceLength("story_v_out_319671", "319671046", "story_v_out_319671.awb") / 1000

					if var_196_20 + var_196_12 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_20 + var_196_12
					end

					if var_196_15.prefab_name ~= "" and arg_193_1.actors_[var_196_15.prefab_name] ~= nil then
						local var_196_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_15.prefab_name].transform, "story_v_out_319671", "319671046", "story_v_out_319671.awb")

						arg_193_1:RecordAudio("319671046", var_196_21)
						arg_193_1:RecordAudio("319671046", var_196_21)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_319671", "319671046", "story_v_out_319671.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_319671", "319671046", "story_v_out_319671.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_22 = math.max(var_196_13, arg_193_1.talkMaxDuration)

			if var_196_12 <= arg_193_1.time_ and arg_193_1.time_ < var_196_12 + var_196_22 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_12) / var_196_22

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_12 + var_196_22 and arg_193_1.time_ < var_196_12 + var_196_22 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play319671047 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 319671047
		arg_197_1.duration_ = 1.8

		local var_197_0 = {
			zh = 1.8,
			ja = 0.999999999999
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
				arg_197_0:Play319671048(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["10014ui_story"].transform
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 then
				arg_197_1.var_.moveOldPos10014ui_story = var_200_0.localPosition
			end

			local var_200_2 = 0.001

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2
				local var_200_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_200_0.localPosition = Vector3.Lerp(arg_197_1.var_.moveOldPos10014ui_story, var_200_4, var_200_3)

				local var_200_5 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_5.x, var_200_5.y, var_200_5.z)

				local var_200_6 = var_200_0.localEulerAngles

				var_200_6.z = 0
				var_200_6.x = 0
				var_200_0.localEulerAngles = var_200_6
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 then
				var_200_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_200_7 = manager.ui.mainCamera.transform.position - var_200_0.position

				var_200_0.forward = Vector3.New(var_200_7.x, var_200_7.y, var_200_7.z)

				local var_200_8 = var_200_0.localEulerAngles

				var_200_8.z = 0
				var_200_8.x = 0
				var_200_0.localEulerAngles = var_200_8
			end

			local var_200_9 = arg_197_1.actors_["1084ui_story"]
			local var_200_10 = 0

			if var_200_10 < arg_197_1.time_ and arg_197_1.time_ <= var_200_10 + arg_200_0 and arg_197_1.var_.characterEffect1084ui_story == nil then
				arg_197_1.var_.characterEffect1084ui_story = var_200_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_11 = 0.200000002980232

			if var_200_10 <= arg_197_1.time_ and arg_197_1.time_ < var_200_10 + var_200_11 then
				local var_200_12 = (arg_197_1.time_ - var_200_10) / var_200_11

				if arg_197_1.var_.characterEffect1084ui_story then
					local var_200_13 = Mathf.Lerp(0, 0.5, var_200_12)

					arg_197_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1084ui_story.fillRatio = var_200_13
				end
			end

			if arg_197_1.time_ >= var_200_10 + var_200_11 and arg_197_1.time_ < var_200_10 + var_200_11 + arg_200_0 and arg_197_1.var_.characterEffect1084ui_story then
				local var_200_14 = 0.5

				arg_197_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1084ui_story.fillRatio = var_200_14
			end

			local var_200_15 = arg_197_1.actors_["10014ui_story"]
			local var_200_16 = 0

			if var_200_16 < arg_197_1.time_ and arg_197_1.time_ <= var_200_16 + arg_200_0 and arg_197_1.var_.characterEffect10014ui_story == nil then
				arg_197_1.var_.characterEffect10014ui_story = var_200_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_17 = 0.200000002980232

			if var_200_16 <= arg_197_1.time_ and arg_197_1.time_ < var_200_16 + var_200_17 then
				local var_200_18 = (arg_197_1.time_ - var_200_16) / var_200_17

				if arg_197_1.var_.characterEffect10014ui_story then
					arg_197_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_16 + var_200_17 and arg_197_1.time_ < var_200_16 + var_200_17 + arg_200_0 and arg_197_1.var_.characterEffect10014ui_story then
				arg_197_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_200_19 = 0
			local var_200_20 = 0.075

			if var_200_19 < arg_197_1.time_ and arg_197_1.time_ <= var_200_19 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_21 = arg_197_1:FormatText(StoryNameCfg[264].name)

				arg_197_1.leftNameTxt_.text = var_200_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_22 = arg_197_1:GetWordFromCfg(319671047)
				local var_200_23 = arg_197_1:FormatText(var_200_22.content)

				arg_197_1.text_.text = var_200_23

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_24 = 3
				local var_200_25 = utf8.len(var_200_23)
				local var_200_26 = var_200_24 <= 0 and var_200_20 or var_200_20 * (var_200_25 / var_200_24)

				if var_200_26 > 0 and var_200_20 < var_200_26 then
					arg_197_1.talkMaxDuration = var_200_26

					if var_200_26 + var_200_19 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_26 + var_200_19
					end
				end

				arg_197_1.text_.text = var_200_23
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671047", "story_v_out_319671.awb") ~= 0 then
					local var_200_27 = manager.audio:GetVoiceLength("story_v_out_319671", "319671047", "story_v_out_319671.awb") / 1000

					if var_200_27 + var_200_19 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_27 + var_200_19
					end

					if var_200_22.prefab_name ~= "" and arg_197_1.actors_[var_200_22.prefab_name] ~= nil then
						local var_200_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_22.prefab_name].transform, "story_v_out_319671", "319671047", "story_v_out_319671.awb")

						arg_197_1:RecordAudio("319671047", var_200_28)
						arg_197_1:RecordAudio("319671047", var_200_28)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_319671", "319671047", "story_v_out_319671.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_319671", "319671047", "story_v_out_319671.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_29 = math.max(var_200_20, arg_197_1.talkMaxDuration)

			if var_200_19 <= arg_197_1.time_ and arg_197_1.time_ < var_200_19 + var_200_29 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_19) / var_200_29

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_19 + var_200_29 and arg_197_1.time_ < var_200_19 + var_200_29 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play319671048 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 319671048
		arg_201_1.duration_ = 7.833

		local var_201_0 = {
			zh = 6.533,
			ja = 7.833
		}
		local var_201_1 = manager.audio:GetLocalizationFlag()

		if var_201_0[var_201_1] ~= nil then
			arg_201_1.duration_ = var_201_0[var_201_1]
		end

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play319671049(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1084ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1084ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0.7, -0.97, -6)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1084ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["1084ui_story"]
			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect1084ui_story == nil then
				arg_201_1.var_.characterEffect1084ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.200000002980232

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect1084ui_story then
					arg_201_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and arg_201_1.var_.characterEffect1084ui_story then
				arg_201_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_204_13 = 0

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 then
				arg_201_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_204_15 = arg_201_1.actors_["10014ui_story"]
			local var_204_16 = 0

			if var_204_16 < arg_201_1.time_ and arg_201_1.time_ <= var_204_16 + arg_204_0 and arg_201_1.var_.characterEffect10014ui_story == nil then
				arg_201_1.var_.characterEffect10014ui_story = var_204_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_17 = 0.200000002980232

			if var_204_16 <= arg_201_1.time_ and arg_201_1.time_ < var_204_16 + var_204_17 then
				local var_204_18 = (arg_201_1.time_ - var_204_16) / var_204_17

				if arg_201_1.var_.characterEffect10014ui_story then
					local var_204_19 = Mathf.Lerp(0, 0.5, var_204_18)

					arg_201_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_201_1.var_.characterEffect10014ui_story.fillRatio = var_204_19
				end
			end

			if arg_201_1.time_ >= var_204_16 + var_204_17 and arg_201_1.time_ < var_204_16 + var_204_17 + arg_204_0 and arg_201_1.var_.characterEffect10014ui_story then
				local var_204_20 = 0.5

				arg_201_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_201_1.var_.characterEffect10014ui_story.fillRatio = var_204_20
			end

			local var_204_21 = 0
			local var_204_22 = 1.1

			if var_204_21 < arg_201_1.time_ and arg_201_1.time_ <= var_204_21 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_23 = arg_201_1:FormatText(StoryNameCfg[6].name)

				arg_201_1.leftNameTxt_.text = var_204_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_24 = arg_201_1:GetWordFromCfg(319671048)
				local var_204_25 = arg_201_1:FormatText(var_204_24.content)

				arg_201_1.text_.text = var_204_25

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_26 = 44
				local var_204_27 = utf8.len(var_204_25)
				local var_204_28 = var_204_26 <= 0 and var_204_22 or var_204_22 * (var_204_27 / var_204_26)

				if var_204_28 > 0 and var_204_22 < var_204_28 then
					arg_201_1.talkMaxDuration = var_204_28

					if var_204_28 + var_204_21 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_28 + var_204_21
					end
				end

				arg_201_1.text_.text = var_204_25
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671048", "story_v_out_319671.awb") ~= 0 then
					local var_204_29 = manager.audio:GetVoiceLength("story_v_out_319671", "319671048", "story_v_out_319671.awb") / 1000

					if var_204_29 + var_204_21 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_29 + var_204_21
					end

					if var_204_24.prefab_name ~= "" and arg_201_1.actors_[var_204_24.prefab_name] ~= nil then
						local var_204_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_24.prefab_name].transform, "story_v_out_319671", "319671048", "story_v_out_319671.awb")

						arg_201_1:RecordAudio("319671048", var_204_30)
						arg_201_1:RecordAudio("319671048", var_204_30)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_319671", "319671048", "story_v_out_319671.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_319671", "319671048", "story_v_out_319671.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_31 = math.max(var_204_22, arg_201_1.talkMaxDuration)

			if var_204_21 <= arg_201_1.time_ and arg_201_1.time_ < var_204_21 + var_204_31 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_21) / var_204_31

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_21 + var_204_31 and arg_201_1.time_ < var_204_21 + var_204_31 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play319671049 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 319671049
		arg_205_1.duration_ = 5.266

		local var_205_0 = {
			zh = 3.8,
			ja = 5.266
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
				arg_205_0:Play319671050(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1084ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.characterEffect1084ui_story == nil then
				arg_205_1.var_.characterEffect1084ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.200000002980232

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect1084ui_story then
					local var_208_4 = Mathf.Lerp(0, 0.5, var_208_3)

					arg_205_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1084ui_story.fillRatio = var_208_4
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect1084ui_story then
				local var_208_5 = 0.5

				arg_205_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1084ui_story.fillRatio = var_208_5
			end

			local var_208_6 = arg_205_1.actors_["10014ui_story"]
			local var_208_7 = 0

			if var_208_7 < arg_205_1.time_ and arg_205_1.time_ <= var_208_7 + arg_208_0 and arg_205_1.var_.characterEffect10014ui_story == nil then
				arg_205_1.var_.characterEffect10014ui_story = var_208_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_8 = 0.200000002980232

			if var_208_7 <= arg_205_1.time_ and arg_205_1.time_ < var_208_7 + var_208_8 then
				local var_208_9 = (arg_205_1.time_ - var_208_7) / var_208_8

				if arg_205_1.var_.characterEffect10014ui_story then
					arg_205_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_7 + var_208_8 and arg_205_1.time_ < var_208_7 + var_208_8 + arg_208_0 and arg_205_1.var_.characterEffect10014ui_story then
				arg_205_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_208_10 = 0
			local var_208_11 = 0.475

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_12 = arg_205_1:FormatText(StoryNameCfg[264].name)

				arg_205_1.leftNameTxt_.text = var_208_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_13 = arg_205_1:GetWordFromCfg(319671049)
				local var_208_14 = arg_205_1:FormatText(var_208_13.content)

				arg_205_1.text_.text = var_208_14

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_15 = 19
				local var_208_16 = utf8.len(var_208_14)
				local var_208_17 = var_208_15 <= 0 and var_208_11 or var_208_11 * (var_208_16 / var_208_15)

				if var_208_17 > 0 and var_208_11 < var_208_17 then
					arg_205_1.talkMaxDuration = var_208_17

					if var_208_17 + var_208_10 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_17 + var_208_10
					end
				end

				arg_205_1.text_.text = var_208_14
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671049", "story_v_out_319671.awb") ~= 0 then
					local var_208_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671049", "story_v_out_319671.awb") / 1000

					if var_208_18 + var_208_10 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_18 + var_208_10
					end

					if var_208_13.prefab_name ~= "" and arg_205_1.actors_[var_208_13.prefab_name] ~= nil then
						local var_208_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_13.prefab_name].transform, "story_v_out_319671", "319671049", "story_v_out_319671.awb")

						arg_205_1:RecordAudio("319671049", var_208_19)
						arg_205_1:RecordAudio("319671049", var_208_19)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_319671", "319671049", "story_v_out_319671.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_319671", "319671049", "story_v_out_319671.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_20 = math.max(var_208_11, arg_205_1.talkMaxDuration)

			if var_208_10 <= arg_205_1.time_ and arg_205_1.time_ < var_208_10 + var_208_20 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_10) / var_208_20

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_10 + var_208_20 and arg_205_1.time_ < var_208_10 + var_208_20 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play319671050 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 319671050
		arg_209_1.duration_ = 8.533

		local var_209_0 = {
			zh = 3.966,
			ja = 8.533
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
				arg_209_0:Play319671051(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action4_2")
			end

			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_212_2 = 0
			local var_212_3 = 0.5

			if var_212_2 < arg_209_1.time_ and arg_209_1.time_ <= var_212_2 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_4 = arg_209_1:FormatText(StoryNameCfg[264].name)

				arg_209_1.leftNameTxt_.text = var_212_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_5 = arg_209_1:GetWordFromCfg(319671050)
				local var_212_6 = arg_209_1:FormatText(var_212_5.content)

				arg_209_1.text_.text = var_212_6

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_7 = 20
				local var_212_8 = utf8.len(var_212_6)
				local var_212_9 = var_212_7 <= 0 and var_212_3 or var_212_3 * (var_212_8 / var_212_7)

				if var_212_9 > 0 and var_212_3 < var_212_9 then
					arg_209_1.talkMaxDuration = var_212_9

					if var_212_9 + var_212_2 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_9 + var_212_2
					end
				end

				arg_209_1.text_.text = var_212_6
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671050", "story_v_out_319671.awb") ~= 0 then
					local var_212_10 = manager.audio:GetVoiceLength("story_v_out_319671", "319671050", "story_v_out_319671.awb") / 1000

					if var_212_10 + var_212_2 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_10 + var_212_2
					end

					if var_212_5.prefab_name ~= "" and arg_209_1.actors_[var_212_5.prefab_name] ~= nil then
						local var_212_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_5.prefab_name].transform, "story_v_out_319671", "319671050", "story_v_out_319671.awb")

						arg_209_1:RecordAudio("319671050", var_212_11)
						arg_209_1:RecordAudio("319671050", var_212_11)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_319671", "319671050", "story_v_out_319671.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_319671", "319671050", "story_v_out_319671.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_12 = math.max(var_212_3, arg_209_1.talkMaxDuration)

			if var_212_2 <= arg_209_1.time_ and arg_209_1.time_ < var_212_2 + var_212_12 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_2) / var_212_12

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_2 + var_212_12 and arg_209_1.time_ < var_212_2 + var_212_12 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play319671051 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 319671051
		arg_213_1.duration_ = 4

		local var_213_0 = {
			zh = 2.3,
			ja = 4
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
				arg_213_0:Play319671052(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["10014ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect10014ui_story == nil then
				arg_213_1.var_.characterEffect10014ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.200000002980232

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect10014ui_story then
					local var_216_4 = Mathf.Lerp(0, 0.5, var_216_3)

					arg_213_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_213_1.var_.characterEffect10014ui_story.fillRatio = var_216_4
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect10014ui_story then
				local var_216_5 = 0.5

				arg_213_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_213_1.var_.characterEffect10014ui_story.fillRatio = var_216_5
			end

			local var_216_6 = arg_213_1.actors_["1084ui_story"]
			local var_216_7 = 0

			if var_216_7 < arg_213_1.time_ and arg_213_1.time_ <= var_216_7 + arg_216_0 and arg_213_1.var_.characterEffect1084ui_story == nil then
				arg_213_1.var_.characterEffect1084ui_story = var_216_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_8 = 0.200000002980232

			if var_216_7 <= arg_213_1.time_ and arg_213_1.time_ < var_216_7 + var_216_8 then
				local var_216_9 = (arg_213_1.time_ - var_216_7) / var_216_8

				if arg_213_1.var_.characterEffect1084ui_story then
					arg_213_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_7 + var_216_8 and arg_213_1.time_ < var_216_7 + var_216_8 + arg_216_0 and arg_213_1.var_.characterEffect1084ui_story then
				arg_213_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_216_10 = 0
			local var_216_11 = 0.175

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_12 = arg_213_1:FormatText(StoryNameCfg[6].name)

				arg_213_1.leftNameTxt_.text = var_216_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_13 = arg_213_1:GetWordFromCfg(319671051)
				local var_216_14 = arg_213_1:FormatText(var_216_13.content)

				arg_213_1.text_.text = var_216_14

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_15 = 7
				local var_216_16 = utf8.len(var_216_14)
				local var_216_17 = var_216_15 <= 0 and var_216_11 or var_216_11 * (var_216_16 / var_216_15)

				if var_216_17 > 0 and var_216_11 < var_216_17 then
					arg_213_1.talkMaxDuration = var_216_17

					if var_216_17 + var_216_10 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_17 + var_216_10
					end
				end

				arg_213_1.text_.text = var_216_14
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671051", "story_v_out_319671.awb") ~= 0 then
					local var_216_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671051", "story_v_out_319671.awb") / 1000

					if var_216_18 + var_216_10 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_18 + var_216_10
					end

					if var_216_13.prefab_name ~= "" and arg_213_1.actors_[var_216_13.prefab_name] ~= nil then
						local var_216_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_13.prefab_name].transform, "story_v_out_319671", "319671051", "story_v_out_319671.awb")

						arg_213_1:RecordAudio("319671051", var_216_19)
						arg_213_1:RecordAudio("319671051", var_216_19)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_319671", "319671051", "story_v_out_319671.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_319671", "319671051", "story_v_out_319671.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_20 = math.max(var_216_11, arg_213_1.talkMaxDuration)

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_20 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_10) / var_216_20

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_10 + var_216_20 and arg_213_1.time_ < var_216_10 + var_216_20 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play319671052 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 319671052
		arg_217_1.duration_ = 3.266

		local var_217_0 = {
			zh = 1.999999999999,
			ja = 3.266
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
				arg_217_0:Play319671053(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["10014ui_story"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos10014ui_story = var_220_0.localPosition
			end

			local var_220_2 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2
				local var_220_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos10014ui_story, var_220_4, var_220_3)

				local var_220_5 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_5.x, var_220_5.y, var_220_5.z)

				local var_220_6 = var_220_0.localEulerAngles

				var_220_6.z = 0
				var_220_6.x = 0
				var_220_0.localEulerAngles = var_220_6
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_220_7 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_7.x, var_220_7.y, var_220_7.z)

				local var_220_8 = var_220_0.localEulerAngles

				var_220_8.z = 0
				var_220_8.x = 0
				var_220_0.localEulerAngles = var_220_8
			end

			local var_220_9 = 0

			if var_220_9 < arg_217_1.time_ and arg_217_1.time_ <= var_220_9 + arg_220_0 then
				arg_217_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_1")
			end

			local var_220_10 = 0

			if var_220_10 < arg_217_1.time_ and arg_217_1.time_ <= var_220_10 + arg_220_0 then
				arg_217_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_220_11 = arg_217_1.actors_["1084ui_story"]
			local var_220_12 = 0

			if var_220_12 < arg_217_1.time_ and arg_217_1.time_ <= var_220_12 + arg_220_0 and arg_217_1.var_.characterEffect1084ui_story == nil then
				arg_217_1.var_.characterEffect1084ui_story = var_220_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_13 = 0.200000002980232

			if var_220_12 <= arg_217_1.time_ and arg_217_1.time_ < var_220_12 + var_220_13 then
				local var_220_14 = (arg_217_1.time_ - var_220_12) / var_220_13

				if arg_217_1.var_.characterEffect1084ui_story then
					local var_220_15 = Mathf.Lerp(0, 0.5, var_220_14)

					arg_217_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1084ui_story.fillRatio = var_220_15
				end
			end

			if arg_217_1.time_ >= var_220_12 + var_220_13 and arg_217_1.time_ < var_220_12 + var_220_13 + arg_220_0 and arg_217_1.var_.characterEffect1084ui_story then
				local var_220_16 = 0.5

				arg_217_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1084ui_story.fillRatio = var_220_16
			end

			local var_220_17 = arg_217_1.actors_["10014ui_story"]
			local var_220_18 = 0

			if var_220_18 < arg_217_1.time_ and arg_217_1.time_ <= var_220_18 + arg_220_0 and arg_217_1.var_.characterEffect10014ui_story == nil then
				arg_217_1.var_.characterEffect10014ui_story = var_220_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_19 = 0.200000002980232

			if var_220_18 <= arg_217_1.time_ and arg_217_1.time_ < var_220_18 + var_220_19 then
				local var_220_20 = (arg_217_1.time_ - var_220_18) / var_220_19

				if arg_217_1.var_.characterEffect10014ui_story then
					arg_217_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_18 + var_220_19 and arg_217_1.time_ < var_220_18 + var_220_19 + arg_220_0 and arg_217_1.var_.characterEffect10014ui_story then
				arg_217_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_220_21 = 0
			local var_220_22 = 0.525

			if var_220_21 < arg_217_1.time_ and arg_217_1.time_ <= var_220_21 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_23 = arg_217_1:FormatText(StoryNameCfg[264].name)

				arg_217_1.leftNameTxt_.text = var_220_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_24 = arg_217_1:GetWordFromCfg(319671052)
				local var_220_25 = arg_217_1:FormatText(var_220_24.content)

				arg_217_1.text_.text = var_220_25

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_26 = 21
				local var_220_27 = utf8.len(var_220_25)
				local var_220_28 = var_220_26 <= 0 and var_220_22 or var_220_22 * (var_220_27 / var_220_26)

				if var_220_28 > 0 and var_220_22 < var_220_28 then
					arg_217_1.talkMaxDuration = var_220_28

					if var_220_28 + var_220_21 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_28 + var_220_21
					end
				end

				arg_217_1.text_.text = var_220_25
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671052", "story_v_out_319671.awb") ~= 0 then
					local var_220_29 = manager.audio:GetVoiceLength("story_v_out_319671", "319671052", "story_v_out_319671.awb") / 1000

					if var_220_29 + var_220_21 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_29 + var_220_21
					end

					if var_220_24.prefab_name ~= "" and arg_217_1.actors_[var_220_24.prefab_name] ~= nil then
						local var_220_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_24.prefab_name].transform, "story_v_out_319671", "319671052", "story_v_out_319671.awb")

						arg_217_1:RecordAudio("319671052", var_220_30)
						arg_217_1:RecordAudio("319671052", var_220_30)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_319671", "319671052", "story_v_out_319671.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_319671", "319671052", "story_v_out_319671.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_31 = math.max(var_220_22, arg_217_1.talkMaxDuration)

			if var_220_21 <= arg_217_1.time_ and arg_217_1.time_ < var_220_21 + var_220_31 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_21) / var_220_31

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_21 + var_220_31 and arg_217_1.time_ < var_220_21 + var_220_31 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play319671053 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 319671053
		arg_221_1.duration_ = 5.533

		local var_221_0 = {
			zh = 5.533,
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
				arg_221_0:Play319671054(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1084ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos1084ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(0.7, -0.97, -6)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1084ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = arg_221_1.actors_["1084ui_story"]
			local var_224_10 = 0

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 and arg_221_1.var_.characterEffect1084ui_story == nil then
				arg_221_1.var_.characterEffect1084ui_story = var_224_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_11 = 0.200000002980232

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_10) / var_224_11

				if arg_221_1.var_.characterEffect1084ui_story then
					arg_221_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_10 + var_224_11 and arg_221_1.time_ < var_224_10 + var_224_11 + arg_224_0 and arg_221_1.var_.characterEffect1084ui_story then
				arg_221_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_224_13 = 0

			if var_224_13 < arg_221_1.time_ and arg_221_1.time_ <= var_224_13 + arg_224_0 then
				arg_221_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_224_14 = 0

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 then
				arg_221_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_224_15 = arg_221_1.actors_["10014ui_story"]
			local var_224_16 = 0

			if var_224_16 < arg_221_1.time_ and arg_221_1.time_ <= var_224_16 + arg_224_0 and arg_221_1.var_.characterEffect10014ui_story == nil then
				arg_221_1.var_.characterEffect10014ui_story = var_224_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_17 = 0.200000002980232

			if var_224_16 <= arg_221_1.time_ and arg_221_1.time_ < var_224_16 + var_224_17 then
				local var_224_18 = (arg_221_1.time_ - var_224_16) / var_224_17

				if arg_221_1.var_.characterEffect10014ui_story then
					local var_224_19 = Mathf.Lerp(0, 0.5, var_224_18)

					arg_221_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_221_1.var_.characterEffect10014ui_story.fillRatio = var_224_19
				end
			end

			if arg_221_1.time_ >= var_224_16 + var_224_17 and arg_221_1.time_ < var_224_16 + var_224_17 + arg_224_0 and arg_221_1.var_.characterEffect10014ui_story then
				local var_224_20 = 0.5

				arg_221_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_221_1.var_.characterEffect10014ui_story.fillRatio = var_224_20
			end

			local var_224_21 = 0
			local var_224_22 = 0.775

			if var_224_21 < arg_221_1.time_ and arg_221_1.time_ <= var_224_21 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_23 = arg_221_1:FormatText(StoryNameCfg[6].name)

				arg_221_1.leftNameTxt_.text = var_224_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_24 = arg_221_1:GetWordFromCfg(319671053)
				local var_224_25 = arg_221_1:FormatText(var_224_24.content)

				arg_221_1.text_.text = var_224_25

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_26 = 31
				local var_224_27 = utf8.len(var_224_25)
				local var_224_28 = var_224_26 <= 0 and var_224_22 or var_224_22 * (var_224_27 / var_224_26)

				if var_224_28 > 0 and var_224_22 < var_224_28 then
					arg_221_1.talkMaxDuration = var_224_28

					if var_224_28 + var_224_21 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_28 + var_224_21
					end
				end

				arg_221_1.text_.text = var_224_25
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671053", "story_v_out_319671.awb") ~= 0 then
					local var_224_29 = manager.audio:GetVoiceLength("story_v_out_319671", "319671053", "story_v_out_319671.awb") / 1000

					if var_224_29 + var_224_21 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_29 + var_224_21
					end

					if var_224_24.prefab_name ~= "" and arg_221_1.actors_[var_224_24.prefab_name] ~= nil then
						local var_224_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_24.prefab_name].transform, "story_v_out_319671", "319671053", "story_v_out_319671.awb")

						arg_221_1:RecordAudio("319671053", var_224_30)
						arg_221_1:RecordAudio("319671053", var_224_30)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_319671", "319671053", "story_v_out_319671.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_319671", "319671053", "story_v_out_319671.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_31 = math.max(var_224_22, arg_221_1.talkMaxDuration)

			if var_224_21 <= arg_221_1.time_ and arg_221_1.time_ < var_224_21 + var_224_31 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_21) / var_224_31

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_21 + var_224_31 and arg_221_1.time_ < var_224_21 + var_224_31 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play319671054 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 319671054
		arg_225_1.duration_ = 5.5

		local var_225_0 = {
			zh = 4.733,
			ja = 5.5
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
				arg_225_0:Play319671055(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1084ui_story"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.characterEffect1084ui_story == nil then
				arg_225_1.var_.characterEffect1084ui_story = var_228_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_2 = 0.200000002980232

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.characterEffect1084ui_story then
					local var_228_4 = Mathf.Lerp(0, 0.5, var_228_3)

					arg_225_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1084ui_story.fillRatio = var_228_4
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.characterEffect1084ui_story then
				local var_228_5 = 0.5

				arg_225_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1084ui_story.fillRatio = var_228_5
			end

			local var_228_6 = arg_225_1.actors_["10014ui_story"]
			local var_228_7 = 0

			if var_228_7 < arg_225_1.time_ and arg_225_1.time_ <= var_228_7 + arg_228_0 and arg_225_1.var_.characterEffect10014ui_story == nil then
				arg_225_1.var_.characterEffect10014ui_story = var_228_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_8 = 0.200000002980232

			if var_228_7 <= arg_225_1.time_ and arg_225_1.time_ < var_228_7 + var_228_8 then
				local var_228_9 = (arg_225_1.time_ - var_228_7) / var_228_8

				if arg_225_1.var_.characterEffect10014ui_story then
					arg_225_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_7 + var_228_8 and arg_225_1.time_ < var_228_7 + var_228_8 + arg_228_0 and arg_225_1.var_.characterEffect10014ui_story then
				arg_225_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_228_10 = 0
			local var_228_11 = 0.5

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_12 = arg_225_1:FormatText(StoryNameCfg[264].name)

				arg_225_1.leftNameTxt_.text = var_228_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_13 = arg_225_1:GetWordFromCfg(319671054)
				local var_228_14 = arg_225_1:FormatText(var_228_13.content)

				arg_225_1.text_.text = var_228_14

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_15 = 20
				local var_228_16 = utf8.len(var_228_14)
				local var_228_17 = var_228_15 <= 0 and var_228_11 or var_228_11 * (var_228_16 / var_228_15)

				if var_228_17 > 0 and var_228_11 < var_228_17 then
					arg_225_1.talkMaxDuration = var_228_17

					if var_228_17 + var_228_10 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_17 + var_228_10
					end
				end

				arg_225_1.text_.text = var_228_14
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671054", "story_v_out_319671.awb") ~= 0 then
					local var_228_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671054", "story_v_out_319671.awb") / 1000

					if var_228_18 + var_228_10 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_18 + var_228_10
					end

					if var_228_13.prefab_name ~= "" and arg_225_1.actors_[var_228_13.prefab_name] ~= nil then
						local var_228_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_13.prefab_name].transform, "story_v_out_319671", "319671054", "story_v_out_319671.awb")

						arg_225_1:RecordAudio("319671054", var_228_19)
						arg_225_1:RecordAudio("319671054", var_228_19)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_319671", "319671054", "story_v_out_319671.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_319671", "319671054", "story_v_out_319671.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_20 = math.max(var_228_11, arg_225_1.talkMaxDuration)

			if var_228_10 <= arg_225_1.time_ and arg_225_1.time_ < var_228_10 + var_228_20 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_10) / var_228_20

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_10 + var_228_20 and arg_225_1.time_ < var_228_10 + var_228_20 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play319671055 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 319671055
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play319671056(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10014ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.characterEffect10014ui_story == nil then
				arg_229_1.var_.characterEffect10014ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.200000002980232

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect10014ui_story then
					local var_232_4 = Mathf.Lerp(0, 0.5, var_232_3)

					arg_229_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_229_1.var_.characterEffect10014ui_story.fillRatio = var_232_4
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect10014ui_story then
				local var_232_5 = 0.5

				arg_229_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_229_1.var_.characterEffect10014ui_story.fillRatio = var_232_5
			end

			local var_232_6 = 0
			local var_232_7 = 0.825

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, false)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_8 = arg_229_1:GetWordFromCfg(319671055)
				local var_232_9 = arg_229_1:FormatText(var_232_8.content)

				arg_229_1.text_.text = var_232_9

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_10 = 32
				local var_232_11 = utf8.len(var_232_9)
				local var_232_12 = var_232_10 <= 0 and var_232_7 or var_232_7 * (var_232_11 / var_232_10)

				if var_232_12 > 0 and var_232_7 < var_232_12 then
					arg_229_1.talkMaxDuration = var_232_12

					if var_232_12 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_12 + var_232_6
					end
				end

				arg_229_1.text_.text = var_232_9
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_13 = math.max(var_232_7, arg_229_1.talkMaxDuration)

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_13 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_6) / var_232_13

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_6 + var_232_13 and arg_229_1.time_ < var_232_6 + var_232_13 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play319671056 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 319671056
		arg_233_1.duration_ = 14.3

		local var_233_0 = {
			zh = 12.2,
			ja = 14.3
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
				arg_233_0:Play319671057(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10014ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.characterEffect10014ui_story == nil then
				arg_233_1.var_.characterEffect10014ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.200000002980232

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect10014ui_story then
					arg_233_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect10014ui_story then
				arg_233_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_236_4 = 0

			if var_236_4 < arg_233_1.time_ and arg_233_1.time_ <= var_236_4 + arg_236_0 then
				arg_233_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action2_2")
			end

			local var_236_5 = 0

			if var_236_5 < arg_233_1.time_ and arg_233_1.time_ <= var_236_5 + arg_236_0 then
				arg_233_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_236_6 = 0
			local var_236_7 = 1.45

			if var_236_6 < arg_233_1.time_ and arg_233_1.time_ <= var_236_6 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_8 = arg_233_1:FormatText(StoryNameCfg[264].name)

				arg_233_1.leftNameTxt_.text = var_236_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_9 = arg_233_1:GetWordFromCfg(319671056)
				local var_236_10 = arg_233_1:FormatText(var_236_9.content)

				arg_233_1.text_.text = var_236_10

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_11 = 58
				local var_236_12 = utf8.len(var_236_10)
				local var_236_13 = var_236_11 <= 0 and var_236_7 or var_236_7 * (var_236_12 / var_236_11)

				if var_236_13 > 0 and var_236_7 < var_236_13 then
					arg_233_1.talkMaxDuration = var_236_13

					if var_236_13 + var_236_6 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_13 + var_236_6
					end
				end

				arg_233_1.text_.text = var_236_10
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671056", "story_v_out_319671.awb") ~= 0 then
					local var_236_14 = manager.audio:GetVoiceLength("story_v_out_319671", "319671056", "story_v_out_319671.awb") / 1000

					if var_236_14 + var_236_6 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_14 + var_236_6
					end

					if var_236_9.prefab_name ~= "" and arg_233_1.actors_[var_236_9.prefab_name] ~= nil then
						local var_236_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_9.prefab_name].transform, "story_v_out_319671", "319671056", "story_v_out_319671.awb")

						arg_233_1:RecordAudio("319671056", var_236_15)
						arg_233_1:RecordAudio("319671056", var_236_15)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_319671", "319671056", "story_v_out_319671.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_319671", "319671056", "story_v_out_319671.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_16 = math.max(var_236_7, arg_233_1.talkMaxDuration)

			if var_236_6 <= arg_233_1.time_ and arg_233_1.time_ < var_236_6 + var_236_16 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_6) / var_236_16

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_6 + var_236_16 and arg_233_1.time_ < var_236_6 + var_236_16 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play319671057 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 319671057
		arg_237_1.duration_ = 3.5

		local var_237_0 = {
			zh = 3.5,
			ja = 1.999999999999
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
				arg_237_0:Play319671058(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10014ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect10014ui_story == nil then
				arg_237_1.var_.characterEffect10014ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.200000002980232

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect10014ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_237_1.var_.characterEffect10014ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect10014ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_237_1.var_.characterEffect10014ui_story.fillRatio = var_240_5
			end

			local var_240_6 = arg_237_1.actors_["1084ui_story"]
			local var_240_7 = 0

			if var_240_7 < arg_237_1.time_ and arg_237_1.time_ <= var_240_7 + arg_240_0 and arg_237_1.var_.characterEffect1084ui_story == nil then
				arg_237_1.var_.characterEffect1084ui_story = var_240_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_8 = 0.200000002980232

			if var_240_7 <= arg_237_1.time_ and arg_237_1.time_ < var_240_7 + var_240_8 then
				local var_240_9 = (arg_237_1.time_ - var_240_7) / var_240_8

				if arg_237_1.var_.characterEffect1084ui_story then
					arg_237_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_7 + var_240_8 and arg_237_1.time_ < var_240_7 + var_240_8 + arg_240_0 and arg_237_1.var_.characterEffect1084ui_story then
				arg_237_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_240_10 = 0

			if var_240_10 < arg_237_1.time_ and arg_237_1.time_ <= var_240_10 + arg_240_0 then
				arg_237_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_240_11 = 0

			if var_240_11 < arg_237_1.time_ and arg_237_1.time_ <= var_240_11 + arg_240_0 then
				arg_237_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_240_12 = 0
			local var_240_13 = 0.4

			if var_240_12 < arg_237_1.time_ and arg_237_1.time_ <= var_240_12 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_14 = arg_237_1:FormatText(StoryNameCfg[6].name)

				arg_237_1.leftNameTxt_.text = var_240_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_15 = arg_237_1:GetWordFromCfg(319671057)
				local var_240_16 = arg_237_1:FormatText(var_240_15.content)

				arg_237_1.text_.text = var_240_16

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_17 = 16
				local var_240_18 = utf8.len(var_240_16)
				local var_240_19 = var_240_17 <= 0 and var_240_13 or var_240_13 * (var_240_18 / var_240_17)

				if var_240_19 > 0 and var_240_13 < var_240_19 then
					arg_237_1.talkMaxDuration = var_240_19

					if var_240_19 + var_240_12 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_19 + var_240_12
					end
				end

				arg_237_1.text_.text = var_240_16
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671057", "story_v_out_319671.awb") ~= 0 then
					local var_240_20 = manager.audio:GetVoiceLength("story_v_out_319671", "319671057", "story_v_out_319671.awb") / 1000

					if var_240_20 + var_240_12 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_20 + var_240_12
					end

					if var_240_15.prefab_name ~= "" and arg_237_1.actors_[var_240_15.prefab_name] ~= nil then
						local var_240_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_15.prefab_name].transform, "story_v_out_319671", "319671057", "story_v_out_319671.awb")

						arg_237_1:RecordAudio("319671057", var_240_21)
						arg_237_1:RecordAudio("319671057", var_240_21)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_319671", "319671057", "story_v_out_319671.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_319671", "319671057", "story_v_out_319671.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_22 = math.max(var_240_13, arg_237_1.talkMaxDuration)

			if var_240_12 <= arg_237_1.time_ and arg_237_1.time_ < var_240_12 + var_240_22 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_12) / var_240_22

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_12 + var_240_22 and arg_237_1.time_ < var_240_12 + var_240_22 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play319671058 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 319671058
		arg_241_1.duration_ = 5.333

		local var_241_0 = {
			zh = 5.333,
			ja = 2.466
		}
		local var_241_1 = manager.audio:GetLocalizationFlag()

		if var_241_0[var_241_1] ~= nil then
			arg_241_1.duration_ = var_241_0[var_241_1]
		end

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play319671059(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1084ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect1084ui_story == nil then
				arg_241_1.var_.characterEffect1084ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.200000002980232

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect1084ui_story then
					local var_244_4 = Mathf.Lerp(0, 0.5, var_244_3)

					arg_241_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1084ui_story.fillRatio = var_244_4
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1084ui_story then
				local var_244_5 = 0.5

				arg_241_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1084ui_story.fillRatio = var_244_5
			end

			local var_244_6 = arg_241_1.actors_["10014ui_story"]
			local var_244_7 = 0

			if var_244_7 < arg_241_1.time_ and arg_241_1.time_ <= var_244_7 + arg_244_0 and arg_241_1.var_.characterEffect10014ui_story == nil then
				arg_241_1.var_.characterEffect10014ui_story = var_244_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_8 = 0.200000002980232

			if var_244_7 <= arg_241_1.time_ and arg_241_1.time_ < var_244_7 + var_244_8 then
				local var_244_9 = (arg_241_1.time_ - var_244_7) / var_244_8

				if arg_241_1.var_.characterEffect10014ui_story then
					arg_241_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_7 + var_244_8 and arg_241_1.time_ < var_244_7 + var_244_8 + arg_244_0 and arg_241_1.var_.characterEffect10014ui_story then
				arg_241_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_244_10 = 0
			local var_244_11 = 0.5

			if var_244_10 < arg_241_1.time_ and arg_241_1.time_ <= var_244_10 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_12 = arg_241_1:FormatText(StoryNameCfg[264].name)

				arg_241_1.leftNameTxt_.text = var_244_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_13 = arg_241_1:GetWordFromCfg(319671058)
				local var_244_14 = arg_241_1:FormatText(var_244_13.content)

				arg_241_1.text_.text = var_244_14

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_15 = 20
				local var_244_16 = utf8.len(var_244_14)
				local var_244_17 = var_244_15 <= 0 and var_244_11 or var_244_11 * (var_244_16 / var_244_15)

				if var_244_17 > 0 and var_244_11 < var_244_17 then
					arg_241_1.talkMaxDuration = var_244_17

					if var_244_17 + var_244_10 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_17 + var_244_10
					end
				end

				arg_241_1.text_.text = var_244_14
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671058", "story_v_out_319671.awb") ~= 0 then
					local var_244_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671058", "story_v_out_319671.awb") / 1000

					if var_244_18 + var_244_10 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_18 + var_244_10
					end

					if var_244_13.prefab_name ~= "" and arg_241_1.actors_[var_244_13.prefab_name] ~= nil then
						local var_244_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_13.prefab_name].transform, "story_v_out_319671", "319671058", "story_v_out_319671.awb")

						arg_241_1:RecordAudio("319671058", var_244_19)
						arg_241_1:RecordAudio("319671058", var_244_19)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_319671", "319671058", "story_v_out_319671.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_319671", "319671058", "story_v_out_319671.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_20 = math.max(var_244_11, arg_241_1.talkMaxDuration)

			if var_244_10 <= arg_241_1.time_ and arg_241_1.time_ < var_244_10 + var_244_20 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_10) / var_244_20

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_10 + var_244_20 and arg_241_1.time_ < var_244_10 + var_244_20 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play319671059 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 319671059
		arg_245_1.duration_ = 16.266

		local var_245_0 = {
			zh = 12.066,
			ja = 16.266
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
				arg_245_0:Play319671060(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10014ui_story"].transform
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.var_.moveOldPos10014ui_story = var_248_0.localPosition
			end

			local var_248_2 = 0.001

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2
				local var_248_4 = Vector3.New(-0.7, -1.06, -6.2)

				var_248_0.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos10014ui_story, var_248_4, var_248_3)

				local var_248_5 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_5.x, var_248_5.y, var_248_5.z)

				local var_248_6 = var_248_0.localEulerAngles

				var_248_6.z = 0
				var_248_6.x = 0
				var_248_0.localEulerAngles = var_248_6
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 then
				var_248_0.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_248_7 = manager.ui.mainCamera.transform.position - var_248_0.position

				var_248_0.forward = Vector3.New(var_248_7.x, var_248_7.y, var_248_7.z)

				local var_248_8 = var_248_0.localEulerAngles

				var_248_8.z = 0
				var_248_8.x = 0
				var_248_0.localEulerAngles = var_248_8
			end

			local var_248_9 = arg_245_1.actors_["10014ui_story"]
			local var_248_10 = 0

			if var_248_10 < arg_245_1.time_ and arg_245_1.time_ <= var_248_10 + arg_248_0 and arg_245_1.var_.characterEffect10014ui_story == nil then
				arg_245_1.var_.characterEffect10014ui_story = var_248_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_11 = 0.200000002980232

			if var_248_10 <= arg_245_1.time_ and arg_245_1.time_ < var_248_10 + var_248_11 then
				local var_248_12 = (arg_245_1.time_ - var_248_10) / var_248_11

				if arg_245_1.var_.characterEffect10014ui_story then
					arg_245_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_10 + var_248_11 and arg_245_1.time_ < var_248_10 + var_248_11 + arg_248_0 and arg_245_1.var_.characterEffect10014ui_story then
				arg_245_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_248_13 = 0

			if var_248_13 < arg_245_1.time_ and arg_245_1.time_ <= var_248_13 + arg_248_0 then
				arg_245_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_1")
			end

			local var_248_14 = 0

			if var_248_14 < arg_245_1.time_ and arg_245_1.time_ <= var_248_14 + arg_248_0 then
				arg_245_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_248_15 = 0
			local var_248_16 = 1.275

			if var_248_15 < arg_245_1.time_ and arg_245_1.time_ <= var_248_15 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_17 = arg_245_1:FormatText(StoryNameCfg[264].name)

				arg_245_1.leftNameTxt_.text = var_248_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_18 = arg_245_1:GetWordFromCfg(319671059)
				local var_248_19 = arg_245_1:FormatText(var_248_18.content)

				arg_245_1.text_.text = var_248_19

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_20 = 51
				local var_248_21 = utf8.len(var_248_19)
				local var_248_22 = var_248_20 <= 0 and var_248_16 or var_248_16 * (var_248_21 / var_248_20)

				if var_248_22 > 0 and var_248_16 < var_248_22 then
					arg_245_1.talkMaxDuration = var_248_22

					if var_248_22 + var_248_15 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_22 + var_248_15
					end
				end

				arg_245_1.text_.text = var_248_19
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671059", "story_v_out_319671.awb") ~= 0 then
					local var_248_23 = manager.audio:GetVoiceLength("story_v_out_319671", "319671059", "story_v_out_319671.awb") / 1000

					if var_248_23 + var_248_15 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_23 + var_248_15
					end

					if var_248_18.prefab_name ~= "" and arg_245_1.actors_[var_248_18.prefab_name] ~= nil then
						local var_248_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_18.prefab_name].transform, "story_v_out_319671", "319671059", "story_v_out_319671.awb")

						arg_245_1:RecordAudio("319671059", var_248_24)
						arg_245_1:RecordAudio("319671059", var_248_24)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_319671", "319671059", "story_v_out_319671.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_319671", "319671059", "story_v_out_319671.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_25 = math.max(var_248_16, arg_245_1.talkMaxDuration)

			if var_248_15 <= arg_245_1.time_ and arg_245_1.time_ < var_248_15 + var_248_25 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_15) / var_248_25

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_15 + var_248_25 and arg_245_1.time_ < var_248_15 + var_248_25 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play319671060 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 319671060
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play319671061(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["10014ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect10014ui_story == nil then
				arg_249_1.var_.characterEffect10014ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.200000002980232

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect10014ui_story then
					local var_252_4 = Mathf.Lerp(0, 0.5, var_252_3)

					arg_249_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_249_1.var_.characterEffect10014ui_story.fillRatio = var_252_4
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect10014ui_story then
				local var_252_5 = 0.5

				arg_249_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_249_1.var_.characterEffect10014ui_story.fillRatio = var_252_5
			end

			local var_252_6 = 0

			if var_252_6 < arg_249_1.time_ and arg_249_1.time_ <= var_252_6 + arg_252_0 then
				arg_249_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_252_7 = 0

			if var_252_7 < arg_249_1.time_ and arg_249_1.time_ <= var_252_7 + arg_252_0 then
				arg_249_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_252_8 = 0
			local var_252_9 = 0.925

			if var_252_8 < arg_249_1.time_ and arg_249_1.time_ <= var_252_8 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, false)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_10 = arg_249_1:GetWordFromCfg(319671060)
				local var_252_11 = arg_249_1:FormatText(var_252_10.content)

				arg_249_1.text_.text = var_252_11

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_12 = 37
				local var_252_13 = utf8.len(var_252_11)
				local var_252_14 = var_252_12 <= 0 and var_252_9 or var_252_9 * (var_252_13 / var_252_12)

				if var_252_14 > 0 and var_252_9 < var_252_14 then
					arg_249_1.talkMaxDuration = var_252_14

					if var_252_14 + var_252_8 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_14 + var_252_8
					end
				end

				arg_249_1.text_.text = var_252_11
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_15 = math.max(var_252_9, arg_249_1.talkMaxDuration)

			if var_252_8 <= arg_249_1.time_ and arg_249_1.time_ < var_252_8 + var_252_15 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_8) / var_252_15

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_8 + var_252_15 and arg_249_1.time_ < var_252_8 + var_252_15 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play319671061 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 319671061
		arg_253_1.duration_ = 3.233

		local var_253_0 = {
			zh = 3.233,
			ja = 2.9
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
				arg_253_0:Play319671062(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1084ui_story"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1084ui_story = var_256_0.localPosition
			end

			local var_256_2 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2
				local var_256_4 = Vector3.New(0.7, -0.97, -6)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1084ui_story, var_256_4, var_256_3)

				local var_256_5 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_5.x, var_256_5.y, var_256_5.z)

				local var_256_6 = var_256_0.localEulerAngles

				var_256_6.z = 0
				var_256_6.x = 0
				var_256_0.localEulerAngles = var_256_6
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_256_7 = manager.ui.mainCamera.transform.position - var_256_0.position

				var_256_0.forward = Vector3.New(var_256_7.x, var_256_7.y, var_256_7.z)

				local var_256_8 = var_256_0.localEulerAngles

				var_256_8.z = 0
				var_256_8.x = 0
				var_256_0.localEulerAngles = var_256_8
			end

			local var_256_9 = arg_253_1.actors_["1084ui_story"]
			local var_256_10 = 0

			if var_256_10 < arg_253_1.time_ and arg_253_1.time_ <= var_256_10 + arg_256_0 and arg_253_1.var_.characterEffect1084ui_story == nil then
				arg_253_1.var_.characterEffect1084ui_story = var_256_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_11 = 0.200000002980232

			if var_256_10 <= arg_253_1.time_ and arg_253_1.time_ < var_256_10 + var_256_11 then
				local var_256_12 = (arg_253_1.time_ - var_256_10) / var_256_11

				if arg_253_1.var_.characterEffect1084ui_story then
					arg_253_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_10 + var_256_11 and arg_253_1.time_ < var_256_10 + var_256_11 + arg_256_0 and arg_253_1.var_.characterEffect1084ui_story then
				arg_253_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_256_13 = 0
			local var_256_14 = 0.3

			if var_256_13 < arg_253_1.time_ and arg_253_1.time_ <= var_256_13 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_15 = arg_253_1:FormatText(StoryNameCfg[6].name)

				arg_253_1.leftNameTxt_.text = var_256_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_16 = arg_253_1:GetWordFromCfg(319671061)
				local var_256_17 = arg_253_1:FormatText(var_256_16.content)

				arg_253_1.text_.text = var_256_17

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_18 = 12
				local var_256_19 = utf8.len(var_256_17)
				local var_256_20 = var_256_18 <= 0 and var_256_14 or var_256_14 * (var_256_19 / var_256_18)

				if var_256_20 > 0 and var_256_14 < var_256_20 then
					arg_253_1.talkMaxDuration = var_256_20

					if var_256_20 + var_256_13 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_20 + var_256_13
					end
				end

				arg_253_1.text_.text = var_256_17
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671061", "story_v_out_319671.awb") ~= 0 then
					local var_256_21 = manager.audio:GetVoiceLength("story_v_out_319671", "319671061", "story_v_out_319671.awb") / 1000

					if var_256_21 + var_256_13 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_21 + var_256_13
					end

					if var_256_16.prefab_name ~= "" and arg_253_1.actors_[var_256_16.prefab_name] ~= nil then
						local var_256_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_16.prefab_name].transform, "story_v_out_319671", "319671061", "story_v_out_319671.awb")

						arg_253_1:RecordAudio("319671061", var_256_22)
						arg_253_1:RecordAudio("319671061", var_256_22)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_319671", "319671061", "story_v_out_319671.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_319671", "319671061", "story_v_out_319671.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_23 = math.max(var_256_14, arg_253_1.talkMaxDuration)

			if var_256_13 <= arg_253_1.time_ and arg_253_1.time_ < var_256_13 + var_256_23 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_13) / var_256_23

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_13 + var_256_23 and arg_253_1.time_ < var_256_13 + var_256_23 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play319671062 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 319671062
		arg_257_1.duration_ = 6

		local var_257_0 = {
			zh = 5.9,
			ja = 6
		}
		local var_257_1 = manager.audio:GetLocalizationFlag()

		if var_257_0[var_257_1] ~= nil then
			arg_257_1.duration_ = var_257_0[var_257_1]
		end

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play319671063(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1084ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect1084ui_story == nil then
				arg_257_1.var_.characterEffect1084ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.200000002980232

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect1084ui_story then
					local var_260_4 = Mathf.Lerp(0, 0.5, var_260_3)

					arg_257_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_257_1.var_.characterEffect1084ui_story.fillRatio = var_260_4
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect1084ui_story then
				local var_260_5 = 0.5

				arg_257_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_257_1.var_.characterEffect1084ui_story.fillRatio = var_260_5
			end

			local var_260_6 = arg_257_1.actors_["10014ui_story"]
			local var_260_7 = 0

			if var_260_7 < arg_257_1.time_ and arg_257_1.time_ <= var_260_7 + arg_260_0 and arg_257_1.var_.characterEffect10014ui_story == nil then
				arg_257_1.var_.characterEffect10014ui_story = var_260_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_8 = 0.200000002980232

			if var_260_7 <= arg_257_1.time_ and arg_257_1.time_ < var_260_7 + var_260_8 then
				local var_260_9 = (arg_257_1.time_ - var_260_7) / var_260_8

				if arg_257_1.var_.characterEffect10014ui_story then
					arg_257_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_257_1.time_ >= var_260_7 + var_260_8 and arg_257_1.time_ < var_260_7 + var_260_8 + arg_260_0 and arg_257_1.var_.characterEffect10014ui_story then
				arg_257_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_260_10 = 0
			local var_260_11 = 0.675

			if var_260_10 < arg_257_1.time_ and arg_257_1.time_ <= var_260_10 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_12 = arg_257_1:FormatText(StoryNameCfg[264].name)

				arg_257_1.leftNameTxt_.text = var_260_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_13 = arg_257_1:GetWordFromCfg(319671062)
				local var_260_14 = arg_257_1:FormatText(var_260_13.content)

				arg_257_1.text_.text = var_260_14

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_15 = 27
				local var_260_16 = utf8.len(var_260_14)
				local var_260_17 = var_260_15 <= 0 and var_260_11 or var_260_11 * (var_260_16 / var_260_15)

				if var_260_17 > 0 and var_260_11 < var_260_17 then
					arg_257_1.talkMaxDuration = var_260_17

					if var_260_17 + var_260_10 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_17 + var_260_10
					end
				end

				arg_257_1.text_.text = var_260_14
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671062", "story_v_out_319671.awb") ~= 0 then
					local var_260_18 = manager.audio:GetVoiceLength("story_v_out_319671", "319671062", "story_v_out_319671.awb") / 1000

					if var_260_18 + var_260_10 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_18 + var_260_10
					end

					if var_260_13.prefab_name ~= "" and arg_257_1.actors_[var_260_13.prefab_name] ~= nil then
						local var_260_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_13.prefab_name].transform, "story_v_out_319671", "319671062", "story_v_out_319671.awb")

						arg_257_1:RecordAudio("319671062", var_260_19)
						arg_257_1:RecordAudio("319671062", var_260_19)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_319671", "319671062", "story_v_out_319671.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_319671", "319671062", "story_v_out_319671.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_20 = math.max(var_260_11, arg_257_1.talkMaxDuration)

			if var_260_10 <= arg_257_1.time_ and arg_257_1.time_ < var_260_10 + var_260_20 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_10) / var_260_20

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_10 + var_260_20 and arg_257_1.time_ < var_260_10 + var_260_20 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play319671063 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 319671063
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play319671064(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["10014ui_story"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 and arg_261_1.var_.characterEffect10014ui_story == nil then
				arg_261_1.var_.characterEffect10014ui_story = var_264_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_2 = 0.200000002980232

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2

				if arg_261_1.var_.characterEffect10014ui_story then
					local var_264_4 = Mathf.Lerp(0, 0.5, var_264_3)

					arg_261_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_261_1.var_.characterEffect10014ui_story.fillRatio = var_264_4
				end
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 and arg_261_1.var_.characterEffect10014ui_story then
				local var_264_5 = 0.5

				arg_261_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_261_1.var_.characterEffect10014ui_story.fillRatio = var_264_5
			end

			local var_264_6 = 0

			if var_264_6 < arg_261_1.time_ and arg_261_1.time_ <= var_264_6 + arg_264_0 then
				arg_261_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_264_7 = 0
			local var_264_8 = 1.45

			if var_264_7 < arg_261_1.time_ and arg_261_1.time_ <= var_264_7 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, false)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_9 = arg_261_1:GetWordFromCfg(319671063)
				local var_264_10 = arg_261_1:FormatText(var_264_9.content)

				arg_261_1.text_.text = var_264_10

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_11 = 58
				local var_264_12 = utf8.len(var_264_10)
				local var_264_13 = var_264_11 <= 0 and var_264_8 or var_264_8 * (var_264_12 / var_264_11)

				if var_264_13 > 0 and var_264_8 < var_264_13 then
					arg_261_1.talkMaxDuration = var_264_13

					if var_264_13 + var_264_7 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_13 + var_264_7
					end
				end

				arg_261_1.text_.text = var_264_10
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_14 = math.max(var_264_8, arg_261_1.talkMaxDuration)

			if var_264_7 <= arg_261_1.time_ and arg_261_1.time_ < var_264_7 + var_264_14 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_7) / var_264_14

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_7 + var_264_14 and arg_261_1.time_ < var_264_7 + var_264_14 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play319671064 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 319671064
		arg_265_1.duration_ = 5.932666666666

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play319671065(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				local var_268_1 = arg_265_1.fswbg_.transform:Find("textbox/adapt/content") or arg_265_1.fswbg_.transform:Find("textbox/content")
				local var_268_2 = var_268_1:GetComponent("Text")
				local var_268_3 = var_268_1:GetComponent("RectTransform")

				var_268_2.alignment = UnityEngine.TextAnchor.LowerCenter
				var_268_3.offsetMin = Vector2.New(0, 0)
				var_268_3.offsetMax = Vector2.New(0, 0)
			end

			local var_268_4 = 0

			if var_268_4 < arg_265_1.time_ and arg_265_1.time_ <= var_268_4 + arg_268_0 then
				arg_265_1.fswbg_:SetActive(true)
				arg_265_1.dialog_:SetActive(false)

				arg_265_1.fswtw_.percent = 0

				local var_268_5 = arg_265_1:GetWordFromCfg(319671064)
				local var_268_6 = arg_265_1:FormatText(var_268_5.content)

				arg_265_1.fswt_.text = var_268_6

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.fswt_)

				arg_265_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_265_1.fswtw_:SetDirty()

				arg_265_1.typewritterCharCountI18N = 0

				SetActive(arg_265_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_265_1:ShowNextGo(false)
			end

			local var_268_7 = 0.566666666666668

			if var_268_7 < arg_265_1.time_ and arg_265_1.time_ <= var_268_7 + arg_268_0 then
				arg_265_1.var_.oldValueTypewriter = arg_265_1.fswtw_.percent

				arg_265_1:ShowNextGo(false)
			end

			local var_268_8 = 24
			local var_268_9 = 1.6
			local var_268_10 = arg_265_1:GetWordFromCfg(319671064)
			local var_268_11 = arg_265_1:FormatText(var_268_10.content)
			local var_268_12, var_268_13 = arg_265_1:GetPercentByPara(var_268_11, 1)

			if var_268_7 < arg_265_1.time_ and arg_265_1.time_ <= var_268_7 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0

				local var_268_14 = var_268_8 <= 0 and var_268_9 or var_268_9 * ((var_268_13 - arg_265_1.typewritterCharCountI18N) / var_268_8)

				if var_268_14 > 0 and var_268_9 < var_268_14 then
					arg_265_1.talkMaxDuration = var_268_14

					if var_268_14 + var_268_7 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_14 + var_268_7
					end
				end
			end

			local var_268_15 = 1.6
			local var_268_16 = math.max(var_268_15, arg_265_1.talkMaxDuration)

			if var_268_7 <= arg_265_1.time_ and arg_265_1.time_ < var_268_7 + var_268_16 then
				local var_268_17 = (arg_265_1.time_ - var_268_7) / var_268_16

				arg_265_1.fswtw_.percent = Mathf.Lerp(arg_265_1.var_.oldValueTypewriter, var_268_12, var_268_17)
				arg_265_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_265_1.fswtw_:SetDirty()
			end

			if arg_265_1.time_ >= var_268_7 + var_268_16 and arg_265_1.time_ < var_268_7 + var_268_16 + arg_268_0 then
				arg_265_1.fswtw_.percent = var_268_12

				arg_265_1.fswtw_:SetDirty()
				arg_265_1:ShowNextGo(true)

				arg_265_1.typewritterCharCountI18N = var_268_13
			end

			local var_268_18 = 0

			if var_268_18 < arg_265_1.time_ and arg_265_1.time_ <= var_268_18 + arg_268_0 then
				arg_265_1.cswbg_:SetActive(true)

				local var_268_19 = arg_265_1.cswt_:GetComponent("RectTransform")

				arg_265_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_268_19.offsetMin = Vector2.New(410, 330)
				var_268_19.offsetMax = Vector2.New(-400, -175)

				local var_268_20 = arg_265_1:GetWordFromCfg(419038)
				local var_268_21 = arg_265_1:FormatText(var_268_20.content)

				arg_265_1.cswt_.text = var_268_21

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.cswt_)

				arg_265_1.cswt_.fontSize = 180
				arg_265_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_265_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_268_22 = 0

			if var_268_22 < arg_265_1.time_ and arg_265_1.time_ <= var_268_22 + arg_268_0 then
				local var_268_23 = manager.ui.mainCamera.transform.localPosition
				local var_268_24 = Vector3.New(0, 0, 10) + Vector3.New(var_268_23.x, var_268_23.y, 0)
				local var_268_25 = arg_265_1.bgs_.STblack

				var_268_25.transform.localPosition = var_268_24
				var_268_25.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_268_26 = var_268_25:GetComponent("SpriteRenderer")

				if var_268_26 and var_268_26.sprite then
					local var_268_27 = (var_268_25.transform.localPosition - var_268_23).z
					local var_268_28 = manager.ui.mainCameraCom_
					local var_268_29 = 2 * var_268_27 * Mathf.Tan(var_268_28.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_268_30 = var_268_29 * var_268_28.aspect
					local var_268_31 = var_268_26.sprite.bounds.size.x
					local var_268_32 = var_268_26.sprite.bounds.size.y
					local var_268_33 = var_268_30 / var_268_31
					local var_268_34 = var_268_29 / var_268_32
					local var_268_35 = var_268_34 < var_268_33 and var_268_33 or var_268_34

					var_268_25.transform.localScale = Vector3.New(var_268_35, var_268_35, 0)
				end

				for iter_268_0, iter_268_1 in pairs(arg_265_1.bgs_) do
					if iter_268_0 ~= "STblack" then
						iter_268_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_268_36 = 0

			if var_268_36 < arg_265_1.time_ and arg_265_1.time_ <= var_268_36 + arg_268_0 then
				arg_265_1.mask_.enabled = true
				arg_265_1.mask_.raycastTarget = true

				arg_265_1:SetGaussion(false)
			end

			local var_268_37 = 1.2

			if var_268_36 <= arg_265_1.time_ and arg_265_1.time_ < var_268_36 + var_268_37 then
				local var_268_38 = (arg_265_1.time_ - var_268_36) / var_268_37
				local var_268_39 = Color.New(0, 0, 0)

				var_268_39.a = Mathf.Lerp(1, 0, var_268_38)
				arg_265_1.mask_.color = var_268_39
			end

			if arg_265_1.time_ >= var_268_36 + var_268_37 and arg_265_1.time_ < var_268_36 + var_268_37 + arg_268_0 then
				local var_268_40 = Color.New(0, 0, 0)
				local var_268_41 = 0

				arg_265_1.mask_.enabled = false
				var_268_40.a = var_268_41
				arg_265_1.mask_.color = var_268_40
			end

			local var_268_42 = arg_265_1.actors_["10014ui_story"].transform
			local var_268_43 = 0

			if var_268_43 < arg_265_1.time_ and arg_265_1.time_ <= var_268_43 + arg_268_0 then
				arg_265_1.var_.moveOldPos10014ui_story = var_268_42.localPosition
			end

			local var_268_44 = 0.001

			if var_268_43 <= arg_265_1.time_ and arg_265_1.time_ < var_268_43 + var_268_44 then
				local var_268_45 = (arg_265_1.time_ - var_268_43) / var_268_44
				local var_268_46 = Vector3.New(0, 100, 0)

				var_268_42.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos10014ui_story, var_268_46, var_268_45)

				local var_268_47 = manager.ui.mainCamera.transform.position - var_268_42.position

				var_268_42.forward = Vector3.New(var_268_47.x, var_268_47.y, var_268_47.z)

				local var_268_48 = var_268_42.localEulerAngles

				var_268_48.z = 0
				var_268_48.x = 0
				var_268_42.localEulerAngles = var_268_48
			end

			if arg_265_1.time_ >= var_268_43 + var_268_44 and arg_265_1.time_ < var_268_43 + var_268_44 + arg_268_0 then
				var_268_42.localPosition = Vector3.New(0, 100, 0)

				local var_268_49 = manager.ui.mainCamera.transform.position - var_268_42.position

				var_268_42.forward = Vector3.New(var_268_49.x, var_268_49.y, var_268_49.z)

				local var_268_50 = var_268_42.localEulerAngles

				var_268_50.z = 0
				var_268_50.x = 0
				var_268_42.localEulerAngles = var_268_50
			end

			local var_268_51 = arg_265_1.actors_["1084ui_story"].transform
			local var_268_52 = 0

			if var_268_52 < arg_265_1.time_ and arg_265_1.time_ <= var_268_52 + arg_268_0 then
				arg_265_1.var_.moveOldPos1084ui_story = var_268_51.localPosition
			end

			local var_268_53 = 0.001

			if var_268_52 <= arg_265_1.time_ and arg_265_1.time_ < var_268_52 + var_268_53 then
				local var_268_54 = (arg_265_1.time_ - var_268_52) / var_268_53
				local var_268_55 = Vector3.New(0, 100, 0)

				var_268_51.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos1084ui_story, var_268_55, var_268_54)

				local var_268_56 = manager.ui.mainCamera.transform.position - var_268_51.position

				var_268_51.forward = Vector3.New(var_268_56.x, var_268_56.y, var_268_56.z)

				local var_268_57 = var_268_51.localEulerAngles

				var_268_57.z = 0
				var_268_57.x = 0
				var_268_51.localEulerAngles = var_268_57
			end

			if arg_265_1.time_ >= var_268_52 + var_268_53 and arg_265_1.time_ < var_268_52 + var_268_53 + arg_268_0 then
				var_268_51.localPosition = Vector3.New(0, 100, 0)

				local var_268_58 = manager.ui.mainCamera.transform.position - var_268_51.position

				var_268_51.forward = Vector3.New(var_268_58.x, var_268_58.y, var_268_58.z)

				local var_268_59 = var_268_51.localEulerAngles

				var_268_59.z = 0
				var_268_59.x = 0
				var_268_51.localEulerAngles = var_268_59
			end

			local var_268_60 = arg_265_1.actors_["10014ui_story"]
			local var_268_61 = 0

			if var_268_61 < arg_265_1.time_ and arg_265_1.time_ <= var_268_61 + arg_268_0 then
				if arg_265_1.var_.characterEffect10014ui_story == nil then
					arg_265_1.var_.characterEffect10014ui_story = var_268_60:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_268_62 = arg_265_1.var_.characterEffect10014ui_story

				var_268_62.imageEffect:turnOff()

				var_268_62.interferenceEffect.enabled = false
				var_268_62.interferenceEffect.noise = 0.001
				var_268_62.interferenceEffect.simTimeScale = 1
				var_268_62.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_268_63 = arg_265_1.actors_["10014ui_story"]
			local var_268_64 = 0
			local var_268_65 = 0.266666666666667

			if var_268_64 < arg_265_1.time_ and arg_265_1.time_ <= var_268_64 + arg_268_0 then
				if arg_265_1.var_.characterEffect10014ui_story == nil then
					arg_265_1.var_.characterEffect10014ui_story = var_268_63:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_265_1.var_.characterEffect10014ui_story.imageEffect:turnOff()
			end

			local var_268_66 = 0.566666666666667
			local var_268_67 = 5.366
			local var_268_68 = manager.audio:GetVoiceLength("story_v_out_319671", "319671064", "story_v_out_319671.awb") / 1000

			if var_268_68 > 0 and var_268_67 < var_268_68 and var_268_68 + var_268_66 > arg_265_1.duration_ then
				local var_268_69 = var_268_68

				arg_265_1.duration_ = var_268_68 + var_268_66
			end

			if var_268_66 < arg_265_1.time_ and arg_265_1.time_ <= var_268_66 + arg_268_0 then
				local var_268_70 = "play"
				local var_268_71 = "voice"

				arg_265_1:AudioAction(var_268_70, var_268_71, "story_v_out_319671", "319671064", "story_v_out_319671.awb")
			end
		end
	end,
	Play319671065 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 319671065
		arg_269_1.duration_ = 3.232999999999

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play319671066(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.fswbg_:SetActive(true)
				arg_269_1.dialog_:SetActive(false)

				arg_269_1.fswtw_.percent = 0

				local var_272_1 = arg_269_1:GetWordFromCfg(319671065)
				local var_272_2 = arg_269_1:FormatText(var_272_1.content)

				arg_269_1.fswt_.text = var_272_2

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.fswt_)

				arg_269_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_269_1.fswtw_:SetDirty()

				arg_269_1.typewritterCharCountI18N = 0

				SetActive(arg_269_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_269_1:ShowNextGo(false)
			end

			local var_272_3 = 0.366666666666667

			if var_272_3 < arg_269_1.time_ and arg_269_1.time_ <= var_272_3 + arg_272_0 then
				arg_269_1.var_.oldValueTypewriter = arg_269_1.fswtw_.percent

				arg_269_1:ShowNextGo(false)
			end

			local var_272_4 = 14
			local var_272_5 = 0.933333333333333
			local var_272_6 = arg_269_1:GetWordFromCfg(319671065)
			local var_272_7 = arg_269_1:FormatText(var_272_6.content)
			local var_272_8, var_272_9 = arg_269_1:GetPercentByPara(var_272_7, 1)

			if var_272_3 < arg_269_1.time_ and arg_269_1.time_ <= var_272_3 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0

				local var_272_10 = var_272_4 <= 0 and var_272_5 or var_272_5 * ((var_272_9 - arg_269_1.typewritterCharCountI18N) / var_272_4)

				if var_272_10 > 0 and var_272_5 < var_272_10 then
					arg_269_1.talkMaxDuration = var_272_10

					if var_272_10 + var_272_3 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_10 + var_272_3
					end
				end
			end

			local var_272_11 = 0.933333333333333
			local var_272_12 = math.max(var_272_11, arg_269_1.talkMaxDuration)

			if var_272_3 <= arg_269_1.time_ and arg_269_1.time_ < var_272_3 + var_272_12 then
				local var_272_13 = (arg_269_1.time_ - var_272_3) / var_272_12

				arg_269_1.fswtw_.percent = Mathf.Lerp(arg_269_1.var_.oldValueTypewriter, var_272_8, var_272_13)
				arg_269_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_269_1.fswtw_:SetDirty()
			end

			if arg_269_1.time_ >= var_272_3 + var_272_12 and arg_269_1.time_ < var_272_3 + var_272_12 + arg_272_0 then
				arg_269_1.fswtw_.percent = var_272_8

				arg_269_1.fswtw_:SetDirty()
				arg_269_1:ShowNextGo(true)

				arg_269_1.typewritterCharCountI18N = var_272_9
			end

			local var_272_14 = 0.3
			local var_272_15 = 2.933
			local var_272_16 = manager.audio:GetVoiceLength("story_v_out_319671", "319671065", "story_v_out_319671.awb") / 1000

			if var_272_16 > 0 and var_272_15 < var_272_16 and var_272_16 + var_272_14 > arg_269_1.duration_ then
				local var_272_17 = var_272_16

				arg_269_1.duration_ = var_272_16 + var_272_14
			end

			if var_272_14 < arg_269_1.time_ and arg_269_1.time_ <= var_272_14 + arg_272_0 then
				local var_272_18 = "play"
				local var_272_19 = "voice"

				arg_269_1:AudioAction(var_272_18, var_272_19, "story_v_out_319671", "319671065", "story_v_out_319671.awb")
			end
		end
	end,
	Play319671066 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 319671066
		arg_273_1.duration_ = 4.699666666666

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play319671067(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.fswbg_:SetActive(true)
				arg_273_1.dialog_:SetActive(false)

				arg_273_1.fswtw_.percent = 0

				local var_276_1 = arg_273_1:GetWordFromCfg(319671066)
				local var_276_2 = arg_273_1:FormatText(var_276_1.content)

				arg_273_1.fswt_.text = var_276_2

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.fswt_)

				arg_273_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_273_1.fswtw_:SetDirty()

				arg_273_1.typewritterCharCountI18N = 0

				SetActive(arg_273_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_273_1:ShowNextGo(false)
			end

			local var_276_3 = 0.266666666666667

			if var_276_3 < arg_273_1.time_ and arg_273_1.time_ <= var_276_3 + arg_276_0 then
				arg_273_1.var_.oldValueTypewriter = arg_273_1.fswtw_.percent

				arg_273_1:ShowNextGo(false)
			end

			local var_276_4 = 19
			local var_276_5 = 1.26666666666667
			local var_276_6 = arg_273_1:GetWordFromCfg(319671066)
			local var_276_7 = arg_273_1:FormatText(var_276_6.content)
			local var_276_8, var_276_9 = arg_273_1:GetPercentByPara(var_276_7, 1)

			if var_276_3 < arg_273_1.time_ and arg_273_1.time_ <= var_276_3 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0

				local var_276_10 = var_276_4 <= 0 and var_276_5 or var_276_5 * ((var_276_9 - arg_273_1.typewritterCharCountI18N) / var_276_4)

				if var_276_10 > 0 and var_276_5 < var_276_10 then
					arg_273_1.talkMaxDuration = var_276_10

					if var_276_10 + var_276_3 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_10 + var_276_3
					end
				end
			end

			local var_276_11 = 1.26666666666667
			local var_276_12 = math.max(var_276_11, arg_273_1.talkMaxDuration)

			if var_276_3 <= arg_273_1.time_ and arg_273_1.time_ < var_276_3 + var_276_12 then
				local var_276_13 = (arg_273_1.time_ - var_276_3) / var_276_12

				arg_273_1.fswtw_.percent = Mathf.Lerp(arg_273_1.var_.oldValueTypewriter, var_276_8, var_276_13)
				arg_273_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_273_1.fswtw_:SetDirty()
			end

			if arg_273_1.time_ >= var_276_3 + var_276_12 and arg_273_1.time_ < var_276_3 + var_276_12 + arg_276_0 then
				arg_273_1.fswtw_.percent = var_276_8

				arg_273_1.fswtw_:SetDirty()
				arg_273_1:ShowNextGo(true)

				arg_273_1.typewritterCharCountI18N = var_276_9
			end

			local var_276_14 = 0.266666666666667
			local var_276_15 = 4.433
			local var_276_16 = manager.audio:GetVoiceLength("story_v_out_319671", "319671066", "story_v_out_319671.awb") / 1000

			if var_276_16 > 0 and var_276_15 < var_276_16 and var_276_16 + var_276_14 > arg_273_1.duration_ then
				local var_276_17 = var_276_16

				arg_273_1.duration_ = var_276_16 + var_276_14
			end

			if var_276_14 < arg_273_1.time_ and arg_273_1.time_ <= var_276_14 + arg_276_0 then
				local var_276_18 = "play"
				local var_276_19 = "voice"

				arg_273_1:AudioAction(var_276_18, var_276_19, "story_v_out_319671", "319671066", "story_v_out_319671.awb")
			end
		end
	end,
	Play319671067 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 319671067
		arg_277_1.duration_ = 8.26666666851441

		local var_277_0 = {
			zh = 8.26666666851441,
			ja = 7.23366666851441
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
				arg_277_0:Play319671068(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				local var_280_1 = manager.ui.mainCamera.transform.localPosition
				local var_280_2 = Vector3.New(0, 0, 10) + Vector3.New(var_280_1.x, var_280_1.y, 0)
				local var_280_3 = arg_277_1.bgs_.ST69

				var_280_3.transform.localPosition = var_280_2
				var_280_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_280_4 = var_280_3:GetComponent("SpriteRenderer")

				if var_280_4 and var_280_4.sprite then
					local var_280_5 = (var_280_3.transform.localPosition - var_280_1).z
					local var_280_6 = manager.ui.mainCameraCom_
					local var_280_7 = 2 * var_280_5 * Mathf.Tan(var_280_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_280_8 = var_280_7 * var_280_6.aspect
					local var_280_9 = var_280_4.sprite.bounds.size.x
					local var_280_10 = var_280_4.sprite.bounds.size.y
					local var_280_11 = var_280_8 / var_280_9
					local var_280_12 = var_280_7 / var_280_10
					local var_280_13 = var_280_12 < var_280_11 and var_280_11 or var_280_12

					var_280_3.transform.localScale = Vector3.New(var_280_13, var_280_13, 0)
				end

				for iter_280_0, iter_280_1 in pairs(arg_277_1.bgs_) do
					if iter_280_0 ~= "ST69" then
						iter_280_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_280_14 = arg_277_1.actors_["10014ui_story"].transform
			local var_280_15 = 0

			if var_280_15 < arg_277_1.time_ and arg_277_1.time_ <= var_280_15 + arg_280_0 then
				arg_277_1.var_.moveOldPos10014ui_story = var_280_14.localPosition
			end

			local var_280_16 = 0.001

			if var_280_15 <= arg_277_1.time_ and arg_277_1.time_ < var_280_15 + var_280_16 then
				local var_280_17 = (arg_277_1.time_ - var_280_15) / var_280_16
				local var_280_18 = Vector3.New(0, -1.06, -6.2)

				var_280_14.localPosition = Vector3.Lerp(arg_277_1.var_.moveOldPos10014ui_story, var_280_18, var_280_17)

				local var_280_19 = manager.ui.mainCamera.transform.position - var_280_14.position

				var_280_14.forward = Vector3.New(var_280_19.x, var_280_19.y, var_280_19.z)

				local var_280_20 = var_280_14.localEulerAngles

				var_280_20.z = 0
				var_280_20.x = 0
				var_280_14.localEulerAngles = var_280_20
			end

			if arg_277_1.time_ >= var_280_15 + var_280_16 and arg_277_1.time_ < var_280_15 + var_280_16 + arg_280_0 then
				var_280_14.localPosition = Vector3.New(0, -1.06, -6.2)

				local var_280_21 = manager.ui.mainCamera.transform.position - var_280_14.position

				var_280_14.forward = Vector3.New(var_280_21.x, var_280_21.y, var_280_21.z)

				local var_280_22 = var_280_14.localEulerAngles

				var_280_22.z = 0
				var_280_22.x = 0
				var_280_14.localEulerAngles = var_280_22
			end

			local var_280_23 = 0

			if var_280_23 < arg_277_1.time_ and arg_277_1.time_ <= var_280_23 + arg_280_0 then
				arg_277_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_280_24 = 0

			if var_280_24 < arg_277_1.time_ and arg_277_1.time_ <= var_280_24 + arg_280_0 then
				arg_277_1.fswbg_:SetActive(false)
				arg_277_1.dialog_:SetActive(false)
				arg_277_1:ShowNextGo(false)
			end

			local var_280_25 = 0.0333333333333334

			if var_280_25 < arg_277_1.time_ and arg_277_1.time_ <= var_280_25 + arg_280_0 then
				arg_277_1.fswbg_:SetActive(false)
				arg_277_1.dialog_:SetActive(false)
				arg_277_1:ShowNextGo(false)
			end

			local var_280_26 = 0

			if var_280_26 < arg_277_1.time_ and arg_277_1.time_ <= var_280_26 + arg_280_0 then
				arg_277_1.cswbg_:SetActive(false)
			end

			local var_280_27 = arg_277_1.actors_["10014ui_story"]
			local var_280_28 = 0.0340000018477441

			if var_280_28 < arg_277_1.time_ and arg_277_1.time_ <= var_280_28 + arg_280_0 and arg_277_1.var_.characterEffect10014ui_story == nil then
				arg_277_1.var_.characterEffect10014ui_story = var_280_27:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_29 = 0.2

			if var_280_28 <= arg_277_1.time_ and arg_277_1.time_ < var_280_28 + var_280_29 then
				local var_280_30 = (arg_277_1.time_ - var_280_28) / var_280_29

				if arg_277_1.var_.characterEffect10014ui_story then
					arg_277_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_28 + var_280_29 and arg_277_1.time_ < var_280_28 + var_280_29 + arg_280_0 and arg_277_1.var_.characterEffect10014ui_story then
				arg_277_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_280_31 = arg_277_1.actors_["10014ui_story"]
			local var_280_32 = 0.0340000018477441

			if var_280_32 < arg_277_1.time_ and arg_277_1.time_ <= var_280_32 + arg_280_0 then
				if arg_277_1.var_.characterEffect10014ui_story == nil then
					arg_277_1.var_.characterEffect10014ui_story = var_280_31:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_280_33 = arg_277_1.var_.characterEffect10014ui_story

				var_280_33.imageEffect:turnOff()

				var_280_33.interferenceEffect.enabled = true
				var_280_33.interferenceEffect.noise = 0.001
				var_280_33.interferenceEffect.simTimeScale = 1
				var_280_33.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_280_34 = arg_277_1.actors_["10014ui_story"]
			local var_280_35 = 0.0340000018477441
			local var_280_36 = 0.266666666666667

			if var_280_35 < arg_277_1.time_ and arg_277_1.time_ <= var_280_35 + arg_280_0 then
				if arg_277_1.var_.characterEffect10014ui_story == nil then
					arg_277_1.var_.characterEffect10014ui_story = var_280_34:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_277_1.var_.characterEffect10014ui_story.imageEffect:turnOn(false)
			end

			if arg_277_1.frameCnt_ <= 1 then
				arg_277_1.dialog_:SetActive(false)
			end

			local var_280_37 = 0.300666668514411
			local var_280_38 = 0.925

			if var_280_37 < arg_277_1.time_ and arg_277_1.time_ <= var_280_37 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0

				arg_277_1.dialog_:SetActive(true)

				local var_280_39 = LeanTween.value(arg_277_1.dialog_, 0, 1, 0.3)

				var_280_39:setOnUpdate(LuaHelper.FloatAction(function(arg_281_0)
					arg_277_1.dialogCg_.alpha = arg_281_0
				end))
				var_280_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_277_1.dialog_)
					var_280_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_277_1.duration_ = arg_277_1.duration_ + 0.3

				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_40 = arg_277_1:FormatText(StoryNameCfg[264].name)

				arg_277_1.leftNameTxt_.text = var_280_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_41 = arg_277_1:GetWordFromCfg(319671067)
				local var_280_42 = arg_277_1:FormatText(var_280_41.content)

				arg_277_1.text_.text = var_280_42

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_43 = 37
				local var_280_44 = utf8.len(var_280_42)
				local var_280_45 = var_280_43 <= 0 and var_280_38 or var_280_38 * (var_280_44 / var_280_43)

				if var_280_45 > 0 and var_280_38 < var_280_45 then
					arg_277_1.talkMaxDuration = var_280_45
					var_280_37 = var_280_37 + 0.3

					if var_280_45 + var_280_37 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_45 + var_280_37
					end
				end

				arg_277_1.text_.text = var_280_42
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671067", "story_v_out_319671.awb") ~= 0 then
					local var_280_46 = manager.audio:GetVoiceLength("story_v_out_319671", "319671067", "story_v_out_319671.awb") / 1000

					if var_280_46 + var_280_37 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_46 + var_280_37
					end

					if var_280_41.prefab_name ~= "" and arg_277_1.actors_[var_280_41.prefab_name] ~= nil then
						local var_280_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_41.prefab_name].transform, "story_v_out_319671", "319671067", "story_v_out_319671.awb")

						arg_277_1:RecordAudio("319671067", var_280_47)
						arg_277_1:RecordAudio("319671067", var_280_47)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_319671", "319671067", "story_v_out_319671.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_319671", "319671067", "story_v_out_319671.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_48 = var_280_37 + 0.3
			local var_280_49 = math.max(var_280_38, arg_277_1.talkMaxDuration)

			if var_280_48 <= arg_277_1.time_ and arg_277_1.time_ < var_280_48 + var_280_49 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_48) / var_280_49

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_48 + var_280_49 and arg_277_1.time_ < var_280_48 + var_280_49 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play319671068 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 319671068
		arg_283_1.duration_ = 5.933

		local var_283_0 = {
			zh = 3.333,
			ja = 5.933
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
				arg_283_0:Play319671069(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["10014ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect10014ui_story == nil then
				arg_283_1.var_.characterEffect10014ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.200000002980232

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect10014ui_story then
					local var_286_4 = Mathf.Lerp(0, 0.5, var_286_3)

					arg_283_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_283_1.var_.characterEffect10014ui_story.fillRatio = var_286_4
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect10014ui_story then
				local var_286_5 = 0.5

				arg_283_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_283_1.var_.characterEffect10014ui_story.fillRatio = var_286_5
			end

			local var_286_6 = arg_283_1.actors_["1084ui_story"]
			local var_286_7 = 0

			if var_286_7 < arg_283_1.time_ and arg_283_1.time_ <= var_286_7 + arg_286_0 and arg_283_1.var_.characterEffect1084ui_story == nil then
				arg_283_1.var_.characterEffect1084ui_story = var_286_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_8 = 0.200000002980232

			if var_286_7 <= arg_283_1.time_ and arg_283_1.time_ < var_286_7 + var_286_8 then
				local var_286_9 = (arg_283_1.time_ - var_286_7) / var_286_8

				if arg_283_1.var_.characterEffect1084ui_story then
					arg_283_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_7 + var_286_8 and arg_283_1.time_ < var_286_7 + var_286_8 + arg_286_0 and arg_283_1.var_.characterEffect1084ui_story then
				arg_283_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_286_10 = arg_283_1.actors_["1084ui_story"].transform
			local var_286_11 = 0

			if var_286_11 < arg_283_1.time_ and arg_283_1.time_ <= var_286_11 + arg_286_0 then
				arg_283_1.var_.moveOldPos1084ui_story = var_286_10.localPosition
			end

			local var_286_12 = 0.001

			if var_286_11 <= arg_283_1.time_ and arg_283_1.time_ < var_286_11 + var_286_12 then
				local var_286_13 = (arg_283_1.time_ - var_286_11) / var_286_12
				local var_286_14 = Vector3.New(0.7, -0.97, -6)

				var_286_10.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1084ui_story, var_286_14, var_286_13)

				local var_286_15 = manager.ui.mainCamera.transform.position - var_286_10.position

				var_286_10.forward = Vector3.New(var_286_15.x, var_286_15.y, var_286_15.z)

				local var_286_16 = var_286_10.localEulerAngles

				var_286_16.z = 0
				var_286_16.x = 0
				var_286_10.localEulerAngles = var_286_16
			end

			if arg_283_1.time_ >= var_286_11 + var_286_12 and arg_283_1.time_ < var_286_11 + var_286_12 + arg_286_0 then
				var_286_10.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_286_17 = manager.ui.mainCamera.transform.position - var_286_10.position

				var_286_10.forward = Vector3.New(var_286_17.x, var_286_17.y, var_286_17.z)

				local var_286_18 = var_286_10.localEulerAngles

				var_286_18.z = 0
				var_286_18.x = 0
				var_286_10.localEulerAngles = var_286_18
			end

			local var_286_19 = arg_283_1.actors_["10014ui_story"].transform
			local var_286_20 = 0

			if var_286_20 < arg_283_1.time_ and arg_283_1.time_ <= var_286_20 + arg_286_0 then
				arg_283_1.var_.moveOldPos10014ui_story = var_286_19.localPosition
			end

			local var_286_21 = 0.001

			if var_286_20 <= arg_283_1.time_ and arg_283_1.time_ < var_286_20 + var_286_21 then
				local var_286_22 = (arg_283_1.time_ - var_286_20) / var_286_21
				local var_286_23 = Vector3.New(-0.7, -1.06, -6.2)

				var_286_19.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos10014ui_story, var_286_23, var_286_22)

				local var_286_24 = manager.ui.mainCamera.transform.position - var_286_19.position

				var_286_19.forward = Vector3.New(var_286_24.x, var_286_24.y, var_286_24.z)

				local var_286_25 = var_286_19.localEulerAngles

				var_286_25.z = 0
				var_286_25.x = 0
				var_286_19.localEulerAngles = var_286_25
			end

			if arg_283_1.time_ >= var_286_20 + var_286_21 and arg_283_1.time_ < var_286_20 + var_286_21 + arg_286_0 then
				var_286_19.localPosition = Vector3.New(-0.7, -1.06, -6.2)

				local var_286_26 = manager.ui.mainCamera.transform.position - var_286_19.position

				var_286_19.forward = Vector3.New(var_286_26.x, var_286_26.y, var_286_26.z)

				local var_286_27 = var_286_19.localEulerAngles

				var_286_27.z = 0
				var_286_27.x = 0
				var_286_19.localEulerAngles = var_286_27
			end

			local var_286_28 = 0
			local var_286_29 = 0.425

			if var_286_28 < arg_283_1.time_ and arg_283_1.time_ <= var_286_28 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_30 = arg_283_1:FormatText(StoryNameCfg[6].name)

				arg_283_1.leftNameTxt_.text = var_286_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_31 = arg_283_1:GetWordFromCfg(319671068)
				local var_286_32 = arg_283_1:FormatText(var_286_31.content)

				arg_283_1.text_.text = var_286_32

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_33 = 17
				local var_286_34 = utf8.len(var_286_32)
				local var_286_35 = var_286_33 <= 0 and var_286_29 or var_286_29 * (var_286_34 / var_286_33)

				if var_286_35 > 0 and var_286_29 < var_286_35 then
					arg_283_1.talkMaxDuration = var_286_35

					if var_286_35 + var_286_28 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_35 + var_286_28
					end
				end

				arg_283_1.text_.text = var_286_32
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671068", "story_v_out_319671.awb") ~= 0 then
					local var_286_36 = manager.audio:GetVoiceLength("story_v_out_319671", "319671068", "story_v_out_319671.awb") / 1000

					if var_286_36 + var_286_28 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_36 + var_286_28
					end

					if var_286_31.prefab_name ~= "" and arg_283_1.actors_[var_286_31.prefab_name] ~= nil then
						local var_286_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_31.prefab_name].transform, "story_v_out_319671", "319671068", "story_v_out_319671.awb")

						arg_283_1:RecordAudio("319671068", var_286_37)
						arg_283_1:RecordAudio("319671068", var_286_37)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_319671", "319671068", "story_v_out_319671.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_319671", "319671068", "story_v_out_319671.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_38 = math.max(var_286_29, arg_283_1.talkMaxDuration)

			if var_286_28 <= arg_283_1.time_ and arg_283_1.time_ < var_286_28 + var_286_38 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_28) / var_286_38

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_28 + var_286_38 and arg_283_1.time_ < var_286_28 + var_286_38 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play319671069 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 319671069
		arg_287_1.duration_ = 14.166

		local var_287_0 = {
			zh = 8,
			ja = 14.166
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
				arg_287_0:Play319671070(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_290_2 = 0
			local var_290_3 = 1.075

			if var_290_2 < arg_287_1.time_ and arg_287_1.time_ <= var_290_2 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_4 = arg_287_1:FormatText(StoryNameCfg[6].name)

				arg_287_1.leftNameTxt_.text = var_290_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_5 = arg_287_1:GetWordFromCfg(319671069)
				local var_290_6 = arg_287_1:FormatText(var_290_5.content)

				arg_287_1.text_.text = var_290_6

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_7 = 43
				local var_290_8 = utf8.len(var_290_6)
				local var_290_9 = var_290_7 <= 0 and var_290_3 or var_290_3 * (var_290_8 / var_290_7)

				if var_290_9 > 0 and var_290_3 < var_290_9 then
					arg_287_1.talkMaxDuration = var_290_9

					if var_290_9 + var_290_2 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_9 + var_290_2
					end
				end

				arg_287_1.text_.text = var_290_6
				arg_287_1.typewritter.percent = 0

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671069", "story_v_out_319671.awb") ~= 0 then
					local var_290_10 = manager.audio:GetVoiceLength("story_v_out_319671", "319671069", "story_v_out_319671.awb") / 1000

					if var_290_10 + var_290_2 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_10 + var_290_2
					end

					if var_290_5.prefab_name ~= "" and arg_287_1.actors_[var_290_5.prefab_name] ~= nil then
						local var_290_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_5.prefab_name].transform, "story_v_out_319671", "319671069", "story_v_out_319671.awb")

						arg_287_1:RecordAudio("319671069", var_290_11)
						arg_287_1:RecordAudio("319671069", var_290_11)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_319671", "319671069", "story_v_out_319671.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_319671", "319671069", "story_v_out_319671.awb")
				end

				arg_287_1:RecordContent(arg_287_1.text_.text)
			end

			local var_290_12 = math.max(var_290_3, arg_287_1.talkMaxDuration)

			if var_290_2 <= arg_287_1.time_ and arg_287_1.time_ < var_290_2 + var_290_12 then
				arg_287_1.typewritter.percent = (arg_287_1.time_ - var_290_2) / var_290_12

				arg_287_1.typewritter:SetDirty()
			end

			if arg_287_1.time_ >= var_290_2 + var_290_12 and arg_287_1.time_ < var_290_2 + var_290_12 + arg_290_0 then
				arg_287_1.typewritter.percent = 1

				arg_287_1.typewritter:SetDirty()
				arg_287_1:ShowNextGo(true)
			end
		end
	end,
	Play319671070 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 319671070
		arg_291_1.duration_ = 9.4

		local var_291_0 = {
			zh = 6.833,
			ja = 9.4
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
				arg_291_0:Play319671071(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1084ui_story"]
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 and arg_291_1.var_.characterEffect1084ui_story == nil then
				arg_291_1.var_.characterEffect1084ui_story = var_294_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_2 = 0.200000002980232

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2

				if arg_291_1.var_.characterEffect1084ui_story then
					local var_294_4 = Mathf.Lerp(0, 0.5, var_294_3)

					arg_291_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1084ui_story.fillRatio = var_294_4
				end
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 and arg_291_1.var_.characterEffect1084ui_story then
				local var_294_5 = 0.5

				arg_291_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1084ui_story.fillRatio = var_294_5
			end

			local var_294_6 = arg_291_1.actors_["10014ui_story"]
			local var_294_7 = 0

			if var_294_7 < arg_291_1.time_ and arg_291_1.time_ <= var_294_7 + arg_294_0 and arg_291_1.var_.characterEffect10014ui_story == nil then
				arg_291_1.var_.characterEffect10014ui_story = var_294_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_8 = 0.200000002980232

			if var_294_7 <= arg_291_1.time_ and arg_291_1.time_ < var_294_7 + var_294_8 then
				local var_294_9 = (arg_291_1.time_ - var_294_7) / var_294_8

				if arg_291_1.var_.characterEffect10014ui_story then
					arg_291_1.var_.characterEffect10014ui_story.fillFlat = false
				end
			end

			if arg_291_1.time_ >= var_294_7 + var_294_8 and arg_291_1.time_ < var_294_7 + var_294_8 + arg_294_0 and arg_291_1.var_.characterEffect10014ui_story then
				arg_291_1.var_.characterEffect10014ui_story.fillFlat = false
			end

			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 then
				arg_291_1:PlayTimeline("10014ui_story", "StoryTimeline/CharAction/story10014/story10014action/10014action3_2")
			end

			local var_294_11 = 0
			local var_294_12 = 0.675

			if var_294_11 < arg_291_1.time_ and arg_291_1.time_ <= var_294_11 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_13 = arg_291_1:FormatText(StoryNameCfg[264].name)

				arg_291_1.leftNameTxt_.text = var_294_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_14 = arg_291_1:GetWordFromCfg(319671070)
				local var_294_15 = arg_291_1:FormatText(var_294_14.content)

				arg_291_1.text_.text = var_294_15

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_16 = 27
				local var_294_17 = utf8.len(var_294_15)
				local var_294_18 = var_294_16 <= 0 and var_294_12 or var_294_12 * (var_294_17 / var_294_16)

				if var_294_18 > 0 and var_294_12 < var_294_18 then
					arg_291_1.talkMaxDuration = var_294_18

					if var_294_18 + var_294_11 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_18 + var_294_11
					end
				end

				arg_291_1.text_.text = var_294_15
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671070", "story_v_out_319671.awb") ~= 0 then
					local var_294_19 = manager.audio:GetVoiceLength("story_v_out_319671", "319671070", "story_v_out_319671.awb") / 1000

					if var_294_19 + var_294_11 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_19 + var_294_11
					end

					if var_294_14.prefab_name ~= "" and arg_291_1.actors_[var_294_14.prefab_name] ~= nil then
						local var_294_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_14.prefab_name].transform, "story_v_out_319671", "319671070", "story_v_out_319671.awb")

						arg_291_1:RecordAudio("319671070", var_294_20)
						arg_291_1:RecordAudio("319671070", var_294_20)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_319671", "319671070", "story_v_out_319671.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_319671", "319671070", "story_v_out_319671.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_21 = math.max(var_294_12, arg_291_1.talkMaxDuration)

			if var_294_11 <= arg_291_1.time_ and arg_291_1.time_ < var_294_11 + var_294_21 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_11) / var_294_21

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_11 + var_294_21 and arg_291_1.time_ < var_294_11 + var_294_21 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play319671071 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 319671071
		arg_295_1.duration_ = 2.7

		local var_295_0 = {
			zh = 2.1,
			ja = 2.7
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
				arg_295_0:Play319671072(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1084ui_story"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos1084ui_story = var_298_0.localPosition
			end

			local var_298_2 = 0.001

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2
				local var_298_4 = Vector3.New(0.7, -0.97, -6)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1084ui_story, var_298_4, var_298_3)

				local var_298_5 = manager.ui.mainCamera.transform.position - var_298_0.position

				var_298_0.forward = Vector3.New(var_298_5.x, var_298_5.y, var_298_5.z)

				local var_298_6 = var_298_0.localEulerAngles

				var_298_6.z = 0
				var_298_6.x = 0
				var_298_0.localEulerAngles = var_298_6
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_298_7 = manager.ui.mainCamera.transform.position - var_298_0.position

				var_298_0.forward = Vector3.New(var_298_7.x, var_298_7.y, var_298_7.z)

				local var_298_8 = var_298_0.localEulerAngles

				var_298_8.z = 0
				var_298_8.x = 0
				var_298_0.localEulerAngles = var_298_8
			end

			local var_298_9 = arg_295_1.actors_["1084ui_story"]
			local var_298_10 = 0

			if var_298_10 < arg_295_1.time_ and arg_295_1.time_ <= var_298_10 + arg_298_0 and arg_295_1.var_.characterEffect1084ui_story == nil then
				arg_295_1.var_.characterEffect1084ui_story = var_298_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_11 = 0.200000002980232

			if var_298_10 <= arg_295_1.time_ and arg_295_1.time_ < var_298_10 + var_298_11 then
				local var_298_12 = (arg_295_1.time_ - var_298_10) / var_298_11

				if arg_295_1.var_.characterEffect1084ui_story then
					arg_295_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_10 + var_298_11 and arg_295_1.time_ < var_298_10 + var_298_11 + arg_298_0 and arg_295_1.var_.characterEffect1084ui_story then
				arg_295_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_298_13 = 0

			if var_298_13 < arg_295_1.time_ and arg_295_1.time_ <= var_298_13 + arg_298_0 then
				arg_295_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_2")
			end

			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 then
				arg_295_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_298_15 = arg_295_1.actors_["10014ui_story"]
			local var_298_16 = 0

			if var_298_16 < arg_295_1.time_ and arg_295_1.time_ <= var_298_16 + arg_298_0 and arg_295_1.var_.characterEffect10014ui_story == nil then
				arg_295_1.var_.characterEffect10014ui_story = var_298_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_17 = 0.200000002980232

			if var_298_16 <= arg_295_1.time_ and arg_295_1.time_ < var_298_16 + var_298_17 then
				local var_298_18 = (arg_295_1.time_ - var_298_16) / var_298_17

				if arg_295_1.var_.characterEffect10014ui_story then
					local var_298_19 = Mathf.Lerp(0, 0.5, var_298_18)

					arg_295_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_295_1.var_.characterEffect10014ui_story.fillRatio = var_298_19
				end
			end

			if arg_295_1.time_ >= var_298_16 + var_298_17 and arg_295_1.time_ < var_298_16 + var_298_17 + arg_298_0 and arg_295_1.var_.characterEffect10014ui_story then
				local var_298_20 = 0.5

				arg_295_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_295_1.var_.characterEffect10014ui_story.fillRatio = var_298_20
			end

			local var_298_21 = 0
			local var_298_22 = 0.2

			if var_298_21 < arg_295_1.time_ and arg_295_1.time_ <= var_298_21 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_23 = arg_295_1:FormatText(StoryNameCfg[6].name)

				arg_295_1.leftNameTxt_.text = var_298_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_24 = arg_295_1:GetWordFromCfg(319671071)
				local var_298_25 = arg_295_1:FormatText(var_298_24.content)

				arg_295_1.text_.text = var_298_25

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_26 = 8
				local var_298_27 = utf8.len(var_298_25)
				local var_298_28 = var_298_26 <= 0 and var_298_22 or var_298_22 * (var_298_27 / var_298_26)

				if var_298_28 > 0 and var_298_22 < var_298_28 then
					arg_295_1.talkMaxDuration = var_298_28

					if var_298_28 + var_298_21 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_28 + var_298_21
					end
				end

				arg_295_1.text_.text = var_298_25
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671071", "story_v_out_319671.awb") ~= 0 then
					local var_298_29 = manager.audio:GetVoiceLength("story_v_out_319671", "319671071", "story_v_out_319671.awb") / 1000

					if var_298_29 + var_298_21 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_29 + var_298_21
					end

					if var_298_24.prefab_name ~= "" and arg_295_1.actors_[var_298_24.prefab_name] ~= nil then
						local var_298_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_24.prefab_name].transform, "story_v_out_319671", "319671071", "story_v_out_319671.awb")

						arg_295_1:RecordAudio("319671071", var_298_30)
						arg_295_1:RecordAudio("319671071", var_298_30)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_319671", "319671071", "story_v_out_319671.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_319671", "319671071", "story_v_out_319671.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_31 = math.max(var_298_22, arg_295_1.talkMaxDuration)

			if var_298_21 <= arg_295_1.time_ and arg_295_1.time_ < var_298_21 + var_298_31 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_21) / var_298_31

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_21 + var_298_31 and arg_295_1.time_ < var_298_21 + var_298_31 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play319671072 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 319671072
		arg_299_1.duration_ = 2.6

		local var_299_0 = {
			zh = 2.3,
			ja = 2.6
		}
		local var_299_1 = manager.audio:GetLocalizationFlag()

		if var_299_0[var_299_1] ~= nil then
			arg_299_1.duration_ = var_299_0[var_299_1]
		end

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play319671073(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1084ui_story"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.characterEffect1084ui_story == nil then
				arg_299_1.var_.characterEffect1084ui_story = var_302_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_2 = 0.200000002980232

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.characterEffect1084ui_story then
					local var_302_4 = Mathf.Lerp(0, 0.5, var_302_3)

					arg_299_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_299_1.var_.characterEffect1084ui_story.fillRatio = var_302_4
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect1084ui_story then
				local var_302_5 = 0.5

				arg_299_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_299_1.var_.characterEffect1084ui_story.fillRatio = var_302_5
			end

			local var_302_6 = 0
			local var_302_7 = 0.175

			if var_302_6 < arg_299_1.time_ and arg_299_1.time_ <= var_302_6 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_8 = arg_299_1:FormatText(StoryNameCfg[36].name)

				arg_299_1.leftNameTxt_.text = var_302_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_9 = arg_299_1:GetWordFromCfg(319671072)
				local var_302_10 = arg_299_1:FormatText(var_302_9.content)

				arg_299_1.text_.text = var_302_10

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_11 = 7
				local var_302_12 = utf8.len(var_302_10)
				local var_302_13 = var_302_11 <= 0 and var_302_7 or var_302_7 * (var_302_12 / var_302_11)

				if var_302_13 > 0 and var_302_7 < var_302_13 then
					arg_299_1.talkMaxDuration = var_302_13

					if var_302_13 + var_302_6 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_13 + var_302_6
					end
				end

				arg_299_1.text_.text = var_302_10
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671072", "story_v_out_319671.awb") ~= 0 then
					local var_302_14 = manager.audio:GetVoiceLength("story_v_out_319671", "319671072", "story_v_out_319671.awb") / 1000

					if var_302_14 + var_302_6 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_14 + var_302_6
					end

					if var_302_9.prefab_name ~= "" and arg_299_1.actors_[var_302_9.prefab_name] ~= nil then
						local var_302_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_9.prefab_name].transform, "story_v_out_319671", "319671072", "story_v_out_319671.awb")

						arg_299_1:RecordAudio("319671072", var_302_15)
						arg_299_1:RecordAudio("319671072", var_302_15)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_319671", "319671072", "story_v_out_319671.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_319671", "319671072", "story_v_out_319671.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_16 = math.max(var_302_7, arg_299_1.talkMaxDuration)

			if var_302_6 <= arg_299_1.time_ and arg_299_1.time_ < var_302_6 + var_302_16 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_6) / var_302_16

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_6 + var_302_16 and arg_299_1.time_ < var_302_6 + var_302_16 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play319671073 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 319671073
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play319671074(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["10014ui_story"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos10014ui_story = var_306_0.localPosition
			end

			local var_306_2 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2
				local var_306_4 = Vector3.New(0, 100, 0)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos10014ui_story, var_306_4, var_306_3)

				local var_306_5 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_5.x, var_306_5.y, var_306_5.z)

				local var_306_6 = var_306_0.localEulerAngles

				var_306_6.z = 0
				var_306_6.x = 0
				var_306_0.localEulerAngles = var_306_6
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(0, 100, 0)

				local var_306_7 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_7.x, var_306_7.y, var_306_7.z)

				local var_306_8 = var_306_0.localEulerAngles

				var_306_8.z = 0
				var_306_8.x = 0
				var_306_0.localEulerAngles = var_306_8
			end

			local var_306_9 = arg_303_1.actors_["10014ui_story"]
			local var_306_10 = 0

			if var_306_10 < arg_303_1.time_ and arg_303_1.time_ <= var_306_10 + arg_306_0 and arg_303_1.var_.characterEffect10014ui_story == nil then
				arg_303_1.var_.characterEffect10014ui_story = var_306_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_11 = 0.200000002980232

			if var_306_10 <= arg_303_1.time_ and arg_303_1.time_ < var_306_10 + var_306_11 then
				local var_306_12 = (arg_303_1.time_ - var_306_10) / var_306_11

				if arg_303_1.var_.characterEffect10014ui_story then
					local var_306_13 = Mathf.Lerp(0, 0.5, var_306_12)

					arg_303_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_303_1.var_.characterEffect10014ui_story.fillRatio = var_306_13
				end
			end

			if arg_303_1.time_ >= var_306_10 + var_306_11 and arg_303_1.time_ < var_306_10 + var_306_11 + arg_306_0 and arg_303_1.var_.characterEffect10014ui_story then
				local var_306_14 = 0.5

				arg_303_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_303_1.var_.characterEffect10014ui_story.fillRatio = var_306_14
			end

			local var_306_15 = arg_303_1.actors_["1084ui_story"].transform
			local var_306_16 = 0

			if var_306_16 < arg_303_1.time_ and arg_303_1.time_ <= var_306_16 + arg_306_0 then
				arg_303_1.var_.moveOldPos1084ui_story = var_306_15.localPosition
			end

			local var_306_17 = 0.001

			if var_306_16 <= arg_303_1.time_ and arg_303_1.time_ < var_306_16 + var_306_17 then
				local var_306_18 = (arg_303_1.time_ - var_306_16) / var_306_17
				local var_306_19 = Vector3.New(0, 100, 0)

				var_306_15.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1084ui_story, var_306_19, var_306_18)

				local var_306_20 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_20.x, var_306_20.y, var_306_20.z)

				local var_306_21 = var_306_15.localEulerAngles

				var_306_21.z = 0
				var_306_21.x = 0
				var_306_15.localEulerAngles = var_306_21
			end

			if arg_303_1.time_ >= var_306_16 + var_306_17 and arg_303_1.time_ < var_306_16 + var_306_17 + arg_306_0 then
				var_306_15.localPosition = Vector3.New(0, 100, 0)

				local var_306_22 = manager.ui.mainCamera.transform.position - var_306_15.position

				var_306_15.forward = Vector3.New(var_306_22.x, var_306_22.y, var_306_22.z)

				local var_306_23 = var_306_15.localEulerAngles

				var_306_23.z = 0
				var_306_23.x = 0
				var_306_15.localEulerAngles = var_306_23
			end

			local var_306_24 = arg_303_1.actors_["1084ui_story"]
			local var_306_25 = 0

			if var_306_25 < arg_303_1.time_ and arg_303_1.time_ <= var_306_25 + arg_306_0 and arg_303_1.var_.characterEffect1084ui_story == nil then
				arg_303_1.var_.characterEffect1084ui_story = var_306_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_26 = 0.200000002980232

			if var_306_25 <= arg_303_1.time_ and arg_303_1.time_ < var_306_25 + var_306_26 then
				local var_306_27 = (arg_303_1.time_ - var_306_25) / var_306_26

				if arg_303_1.var_.characterEffect1084ui_story then
					local var_306_28 = Mathf.Lerp(0, 0.5, var_306_27)

					arg_303_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1084ui_story.fillRatio = var_306_28
				end
			end

			if arg_303_1.time_ >= var_306_25 + var_306_26 and arg_303_1.time_ < var_306_25 + var_306_26 + arg_306_0 and arg_303_1.var_.characterEffect1084ui_story then
				local var_306_29 = 0.5

				arg_303_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1084ui_story.fillRatio = var_306_29
			end

			local var_306_30 = arg_303_1.actors_["10014ui_story"]
			local var_306_31 = 0

			if var_306_31 < arg_303_1.time_ and arg_303_1.time_ <= var_306_31 + arg_306_0 then
				if arg_303_1.var_.characterEffect10014ui_story == nil then
					arg_303_1.var_.characterEffect10014ui_story = var_306_30:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_306_32 = arg_303_1.var_.characterEffect10014ui_story

				var_306_32.imageEffect:turnOff()

				var_306_32.interferenceEffect.enabled = false
				var_306_32.interferenceEffect.noise = 0.001
				var_306_32.interferenceEffect.simTimeScale = 1
				var_306_32.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_306_33 = arg_303_1.actors_["10014ui_story"]
			local var_306_34 = 0
			local var_306_35 = 0.266666666666667

			if var_306_34 < arg_303_1.time_ and arg_303_1.time_ <= var_306_34 + arg_306_0 then
				if arg_303_1.var_.characterEffect10014ui_story == nil then
					arg_303_1.var_.characterEffect10014ui_story = var_306_33:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_303_1.var_.characterEffect10014ui_story.imageEffect:turnOff()
			end

			local var_306_36 = 0
			local var_306_37 = 0.65

			if var_306_36 < arg_303_1.time_ and arg_303_1.time_ <= var_306_36 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, false)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_38 = arg_303_1:GetWordFromCfg(319671073)
				local var_306_39 = arg_303_1:FormatText(var_306_38.content)

				arg_303_1.text_.text = var_306_39

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_40 = 26
				local var_306_41 = utf8.len(var_306_39)
				local var_306_42 = var_306_40 <= 0 and var_306_37 or var_306_37 * (var_306_41 / var_306_40)

				if var_306_42 > 0 and var_306_37 < var_306_42 then
					arg_303_1.talkMaxDuration = var_306_42

					if var_306_42 + var_306_36 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_42 + var_306_36
					end
				end

				arg_303_1.text_.text = var_306_39
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_43 = math.max(var_306_37, arg_303_1.talkMaxDuration)

			if var_306_36 <= arg_303_1.time_ and arg_303_1.time_ < var_306_36 + var_306_43 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_36) / var_306_43

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_36 + var_306_43 and arg_303_1.time_ < var_306_36 + var_306_43 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play319671074 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 319671074
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play319671075(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["10014ui_story"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos10014ui_story = var_310_0.localPosition
			end

			local var_310_2 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2
				local var_310_4 = Vector3.New(0, 100, 0)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos10014ui_story, var_310_4, var_310_3)

				local var_310_5 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_5.x, var_310_5.y, var_310_5.z)

				local var_310_6 = var_310_0.localEulerAngles

				var_310_6.z = 0
				var_310_6.x = 0
				var_310_0.localEulerAngles = var_310_6
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, 100, 0)

				local var_310_7 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_7.x, var_310_7.y, var_310_7.z)

				local var_310_8 = var_310_0.localEulerAngles

				var_310_8.z = 0
				var_310_8.x = 0
				var_310_0.localEulerAngles = var_310_8
			end

			local var_310_9 = arg_307_1.actors_["10014ui_story"]
			local var_310_10 = 0

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 and arg_307_1.var_.characterEffect10014ui_story == nil then
				arg_307_1.var_.characterEffect10014ui_story = var_310_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_11 = 0.200000002980232

			if var_310_10 <= arg_307_1.time_ and arg_307_1.time_ < var_310_10 + var_310_11 then
				local var_310_12 = (arg_307_1.time_ - var_310_10) / var_310_11

				if arg_307_1.var_.characterEffect10014ui_story then
					local var_310_13 = Mathf.Lerp(0, 0.5, var_310_12)

					arg_307_1.var_.characterEffect10014ui_story.fillFlat = true
					arg_307_1.var_.characterEffect10014ui_story.fillRatio = var_310_13
				end
			end

			if arg_307_1.time_ >= var_310_10 + var_310_11 and arg_307_1.time_ < var_310_10 + var_310_11 + arg_310_0 and arg_307_1.var_.characterEffect10014ui_story then
				local var_310_14 = 0.5

				arg_307_1.var_.characterEffect10014ui_story.fillFlat = true
				arg_307_1.var_.characterEffect10014ui_story.fillRatio = var_310_14
			end

			local var_310_15 = arg_307_1.actors_["1084ui_story"].transform
			local var_310_16 = 0

			if var_310_16 < arg_307_1.time_ and arg_307_1.time_ <= var_310_16 + arg_310_0 then
				arg_307_1.var_.moveOldPos1084ui_story = var_310_15.localPosition
			end

			local var_310_17 = 0.001

			if var_310_16 <= arg_307_1.time_ and arg_307_1.time_ < var_310_16 + var_310_17 then
				local var_310_18 = (arg_307_1.time_ - var_310_16) / var_310_17
				local var_310_19 = Vector3.New(0, 100, 0)

				var_310_15.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1084ui_story, var_310_19, var_310_18)

				local var_310_20 = manager.ui.mainCamera.transform.position - var_310_15.position

				var_310_15.forward = Vector3.New(var_310_20.x, var_310_20.y, var_310_20.z)

				local var_310_21 = var_310_15.localEulerAngles

				var_310_21.z = 0
				var_310_21.x = 0
				var_310_15.localEulerAngles = var_310_21
			end

			if arg_307_1.time_ >= var_310_16 + var_310_17 and arg_307_1.time_ < var_310_16 + var_310_17 + arg_310_0 then
				var_310_15.localPosition = Vector3.New(0, 100, 0)

				local var_310_22 = manager.ui.mainCamera.transform.position - var_310_15.position

				var_310_15.forward = Vector3.New(var_310_22.x, var_310_22.y, var_310_22.z)

				local var_310_23 = var_310_15.localEulerAngles

				var_310_23.z = 0
				var_310_23.x = 0
				var_310_15.localEulerAngles = var_310_23
			end

			local var_310_24 = arg_307_1.actors_["1084ui_story"]
			local var_310_25 = 0

			if var_310_25 < arg_307_1.time_ and arg_307_1.time_ <= var_310_25 + arg_310_0 and arg_307_1.var_.characterEffect1084ui_story == nil then
				arg_307_1.var_.characterEffect1084ui_story = var_310_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_26 = 0.200000002980232

			if var_310_25 <= arg_307_1.time_ and arg_307_1.time_ < var_310_25 + var_310_26 then
				local var_310_27 = (arg_307_1.time_ - var_310_25) / var_310_26

				if arg_307_1.var_.characterEffect1084ui_story then
					local var_310_28 = Mathf.Lerp(0, 0.5, var_310_27)

					arg_307_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1084ui_story.fillRatio = var_310_28
				end
			end

			if arg_307_1.time_ >= var_310_25 + var_310_26 and arg_307_1.time_ < var_310_25 + var_310_26 + arg_310_0 and arg_307_1.var_.characterEffect1084ui_story then
				local var_310_29 = 0.5

				arg_307_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1084ui_story.fillRatio = var_310_29
			end

			local var_310_30 = 0
			local var_310_31 = 1.025

			if var_310_30 < arg_307_1.time_ and arg_307_1.time_ <= var_310_30 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_32 = arg_307_1:GetWordFromCfg(319671074)
				local var_310_33 = arg_307_1:FormatText(var_310_32.content)

				arg_307_1.text_.text = var_310_33

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_34 = 41
				local var_310_35 = utf8.len(var_310_33)
				local var_310_36 = var_310_34 <= 0 and var_310_31 or var_310_31 * (var_310_35 / var_310_34)

				if var_310_36 > 0 and var_310_31 < var_310_36 then
					arg_307_1.talkMaxDuration = var_310_36

					if var_310_36 + var_310_30 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_36 + var_310_30
					end
				end

				arg_307_1.text_.text = var_310_33
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_37 = math.max(var_310_31, arg_307_1.talkMaxDuration)

			if var_310_30 <= arg_307_1.time_ and arg_307_1.time_ < var_310_30 + var_310_37 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_30) / var_310_37

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_30 + var_310_37 and arg_307_1.time_ < var_310_30 + var_310_37 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play319671075 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 319671075
		arg_311_1.duration_ = 5.8

		local var_311_0 = {
			zh = 4.966,
			ja = 5.8
		}
		local var_311_1 = manager.audio:GetLocalizationFlag()

		if var_311_0[var_311_1] ~= nil then
			arg_311_1.duration_ = var_311_0[var_311_1]
		end

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
			arg_311_1.auto_ = false
		end

		function arg_311_1.playNext_(arg_313_0)
			arg_311_1.onStoryFinished_()
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = "4040ui_story"

			if arg_311_1.actors_[var_314_0] == nil then
				local var_314_1 = Object.Instantiate(Asset.Load("Char/" .. var_314_0), arg_311_1.stage_.transform)

				var_314_1.name = var_314_0
				var_314_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_311_1.actors_[var_314_0] = var_314_1

				local var_314_2 = var_314_1:GetComponentInChildren(typeof(CharacterEffect))

				var_314_2.enabled = true

				local var_314_3 = GameObjectTools.GetOrAddComponent(var_314_1, typeof(DynamicBoneHelper))

				if var_314_3 then
					var_314_3:EnableDynamicBone(false)
				end

				arg_311_1:ShowWeapon(var_314_2.transform, false)

				arg_311_1.var_[var_314_0 .. "Animator"] = var_314_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_311_1.var_[var_314_0 .. "Animator"].applyRootMotion = true
				arg_311_1.var_[var_314_0 .. "LipSync"] = var_314_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_314_4 = arg_311_1.actors_["4040ui_story"].transform
			local var_314_5 = 0

			if var_314_5 < arg_311_1.time_ and arg_311_1.time_ <= var_314_5 + arg_314_0 then
				arg_311_1.var_.moveOldPos4040ui_story = var_314_4.localPosition
			end

			local var_314_6 = 0.001

			if var_314_5 <= arg_311_1.time_ and arg_311_1.time_ < var_314_5 + var_314_6 then
				local var_314_7 = (arg_311_1.time_ - var_314_5) / var_314_6
				local var_314_8 = Vector3.New(0, -1.55, -5.5)

				var_314_4.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos4040ui_story, var_314_8, var_314_7)

				local var_314_9 = manager.ui.mainCamera.transform.position - var_314_4.position

				var_314_4.forward = Vector3.New(var_314_9.x, var_314_9.y, var_314_9.z)

				local var_314_10 = var_314_4.localEulerAngles

				var_314_10.z = 0
				var_314_10.x = 0
				var_314_4.localEulerAngles = var_314_10
			end

			if arg_311_1.time_ >= var_314_5 + var_314_6 and arg_311_1.time_ < var_314_5 + var_314_6 + arg_314_0 then
				var_314_4.localPosition = Vector3.New(0, -1.55, -5.5)

				local var_314_11 = manager.ui.mainCamera.transform.position - var_314_4.position

				var_314_4.forward = Vector3.New(var_314_11.x, var_314_11.y, var_314_11.z)

				local var_314_12 = var_314_4.localEulerAngles

				var_314_12.z = 0
				var_314_12.x = 0
				var_314_4.localEulerAngles = var_314_12
			end

			local var_314_13 = arg_311_1.actors_["4040ui_story"]
			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 and arg_311_1.var_.characterEffect4040ui_story == nil then
				arg_311_1.var_.characterEffect4040ui_story = var_314_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_15 = 0.200000002980232

			if var_314_14 <= arg_311_1.time_ and arg_311_1.time_ < var_314_14 + var_314_15 then
				local var_314_16 = (arg_311_1.time_ - var_314_14) / var_314_15

				if arg_311_1.var_.characterEffect4040ui_story then
					arg_311_1.var_.characterEffect4040ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_14 + var_314_15 and arg_311_1.time_ < var_314_14 + var_314_15 + arg_314_0 and arg_311_1.var_.characterEffect4040ui_story then
				arg_311_1.var_.characterEffect4040ui_story.fillFlat = false
			end

			local var_314_17 = 0

			if var_314_17 < arg_311_1.time_ and arg_311_1.time_ <= var_314_17 + arg_314_0 then
				arg_311_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/story4040/story4040action/4040action3_1")
			end

			local var_314_18 = 0

			if var_314_18 < arg_311_1.time_ and arg_311_1.time_ <= var_314_18 + arg_314_0 then
				arg_311_1:PlayTimeline("4040ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_314_19 = 0
			local var_314_20 = 0.525

			if var_314_19 < arg_311_1.time_ and arg_311_1.time_ <= var_314_19 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_21 = arg_311_1:FormatText(StoryNameCfg[668].name)

				arg_311_1.leftNameTxt_.text = var_314_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_22 = arg_311_1:GetWordFromCfg(319671075)
				local var_314_23 = arg_311_1:FormatText(var_314_22.content)

				arg_311_1.text_.text = var_314_23

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_24 = 21
				local var_314_25 = utf8.len(var_314_23)
				local var_314_26 = var_314_24 <= 0 and var_314_20 or var_314_20 * (var_314_25 / var_314_24)

				if var_314_26 > 0 and var_314_20 < var_314_26 then
					arg_311_1.talkMaxDuration = var_314_26

					if var_314_26 + var_314_19 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_26 + var_314_19
					end
				end

				arg_311_1.text_.text = var_314_23
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319671", "319671075", "story_v_out_319671.awb") ~= 0 then
					local var_314_27 = manager.audio:GetVoiceLength("story_v_out_319671", "319671075", "story_v_out_319671.awb") / 1000

					if var_314_27 + var_314_19 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_27 + var_314_19
					end

					if var_314_22.prefab_name ~= "" and arg_311_1.actors_[var_314_22.prefab_name] ~= nil then
						local var_314_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_22.prefab_name].transform, "story_v_out_319671", "319671075", "story_v_out_319671.awb")

						arg_311_1:RecordAudio("319671075", var_314_28)
						arg_311_1:RecordAudio("319671075", var_314_28)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_319671", "319671075", "story_v_out_319671.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_319671", "319671075", "story_v_out_319671.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_29 = math.max(var_314_20, arg_311_1.talkMaxDuration)

			if var_314_19 <= arg_311_1.time_ and arg_311_1.time_ < var_314_19 + var_314_29 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_19) / var_314_29

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_19 + var_314_29 and arg_311_1.time_ < var_314_19 + var_314_29 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I12g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D10",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D11",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST69"
	},
	voices = {
		"story_v_out_319671.awb"
	}
}
