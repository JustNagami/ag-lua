return {
	Play319351001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319351001
		arg_1_1.duration_ = 4.899333333332

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319351002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = 1.36666666666667

			if var_4_0 < arg_1_1.time_ and arg_1_1.time_ <= var_4_0 + arg_4_0 then
				local var_4_1 = arg_1_1.fswbg_.transform:Find("textbox/adapt/content") or arg_1_1.fswbg_.transform:Find("textbox/content")
				local var_4_2 = var_4_1:GetComponent("Text")
				local var_4_3 = var_4_1:GetComponent("RectTransform")

				var_4_2.alignment = UnityEngine.TextAnchor.LowerCenter
				var_4_3.offsetMin = Vector2.New(0, 0)
				var_4_3.offsetMax = Vector2.New(0, 0)
			end

			local var_4_4 = 1.36666666666667

			if var_4_4 < arg_1_1.time_ and arg_1_1.time_ <= var_4_4 + arg_4_0 then
				arg_1_1.fswbg_:SetActive(true)
				arg_1_1.dialog_:SetActive(false)

				arg_1_1.fswtw_.percent = 0

				local var_4_5 = arg_1_1:GetWordFromCfg(319351001)
				local var_4_6 = arg_1_1:FormatText(var_4_5.content)

				arg_1_1.fswt_.text = var_4_6

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.fswt_)

				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()

				arg_1_1.typewritterCharCountI18N = 0

				SetActive(arg_1_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_1_1:ShowNextGo(false)
			end

			local var_4_7 = 1.73333333333333

			if var_4_7 < arg_1_1.time_ and arg_1_1.time_ <= var_4_7 + arg_4_0 then
				arg_1_1.var_.oldValueTypewriter = arg_1_1.fswtw_.percent

				arg_1_1:ShowNextGo(false)
			end

			local var_4_8 = 6
			local var_4_9 = 0.4
			local var_4_10 = arg_1_1:GetWordFromCfg(319351001)
			local var_4_11 = arg_1_1:FormatText(var_4_10.content)
			local var_4_12, var_4_13 = arg_1_1:GetPercentByPara(var_4_11, 1)

			if var_4_7 < arg_1_1.time_ and arg_1_1.time_ <= var_4_7 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				local var_4_14 = var_4_8 <= 0 and var_4_9 or var_4_9 * ((var_4_13 - arg_1_1.typewritterCharCountI18N) / var_4_8)

				if var_4_14 > 0 and var_4_9 < var_4_14 then
					arg_1_1.talkMaxDuration = var_4_14

					if var_4_14 + var_4_7 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_14 + var_4_7
					end
				end
			end

			local var_4_15 = 0.4
			local var_4_16 = math.max(var_4_15, arg_1_1.talkMaxDuration)

			if var_4_7 <= arg_1_1.time_ and arg_1_1.time_ < var_4_7 + var_4_16 then
				local var_4_17 = (arg_1_1.time_ - var_4_7) / var_4_16

				arg_1_1.fswtw_.percent = Mathf.Lerp(arg_1_1.var_.oldValueTypewriter, var_4_12, var_4_17)
				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()
			end

			if arg_1_1.time_ >= var_4_7 + var_4_16 and arg_1_1.time_ < var_4_7 + var_4_16 + arg_4_0 then
				arg_1_1.fswtw_.percent = var_4_12

				arg_1_1.fswtw_:SetDirty()
				arg_1_1:ShowNextGo(true)

				arg_1_1.typewritterCharCountI18N = var_4_13
			end

			local var_4_18 = 1.36666666666667

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				arg_1_1.cswbg_:SetActive(true)

				local var_4_19 = arg_1_1.cswt_:GetComponent("RectTransform")

				arg_1_1.cswt_.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_4_19.offsetMin = Vector2.New(410, 330)
				var_4_19.offsetMax = Vector2.New(-400, -175)

				local var_4_20 = arg_1_1:GetWordFromCfg(419013)
				local var_4_21 = arg_1_1:FormatText(var_4_20.content)

				arg_1_1.cswt_.text = var_4_21

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.cswt_)

				arg_1_1.cswt_.fontSize = 180
				arg_1_1.cswt_:GetComponent("Text").color = Color(1, 1, 1)
				arg_1_1.cswt_.font = Asset.Load("Fonts/SourceHanSans")
			end

			local var_4_22 = "STblack"

			if arg_1_1.bgs_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(arg_1_1.paintGo_)

				var_4_23:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_4_22)
				var_4_23.name = var_4_22
				var_4_23.transform.parent = arg_1_1.stage_.transform
				var_4_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_1_1.bgs_[var_4_22] = var_4_23
			end

			local var_4_24 = 0

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_25 = manager.ui.mainCamera.transform.localPosition
				local var_4_26 = Vector3.New(0, 0, 10) + Vector3.New(var_4_25.x, var_4_25.y, 0)
				local var_4_27 = arg_1_1.bgs_.STblack

				var_4_27.transform.localPosition = var_4_26
				var_4_27.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_4_28 = var_4_27:GetComponent("SpriteRenderer")

				if var_4_28 and var_4_28.sprite then
					local var_4_29 = (var_4_27.transform.localPosition - var_4_25).z
					local var_4_30 = manager.ui.mainCameraCom_
					local var_4_31 = 2 * var_4_29 * Mathf.Tan(var_4_30.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_4_32 = var_4_31 * var_4_30.aspect
					local var_4_33 = var_4_28.sprite.bounds.size.x
					local var_4_34 = var_4_28.sprite.bounds.size.y
					local var_4_35 = var_4_32 / var_4_33
					local var_4_36 = var_4_31 / var_4_34
					local var_4_37 = var_4_36 < var_4_35 and var_4_35 or var_4_36

					var_4_27.transform.localScale = Vector3.New(var_4_37, var_4_37, 0)
				end

				for iter_4_0, iter_4_1 in pairs(arg_1_1.bgs_) do
					if iter_4_0 ~= "STblack" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_38 = 0

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_39 = 2

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_39 then
				local var_4_40 = (arg_1_1.time_ - var_4_38) / var_4_39
				local var_4_41 = Color.New(0, 0, 0)

				var_4_41.a = Mathf.Lerp(1, 0, var_4_40)
				arg_1_1.mask_.color = var_4_41
			end

			if arg_1_1.time_ >= var_4_38 + var_4_39 and arg_1_1.time_ < var_4_38 + var_4_39 + arg_4_0 then
				local var_4_42 = Color.New(0, 0, 0)
				local var_4_43 = 0

				arg_1_1.mask_.enabled = false
				var_4_42.a = var_4_43
				arg_1_1.mask_.color = var_4_42
			end

			local var_4_44 = 1.73333333333333
			local var_4_45 = 3.166
			local var_4_46 = manager.audio:GetVoiceLength("story_v_out_319351", "319351001", "story_v_out_319351.awb") / 1000

			if var_4_46 > 0 and var_4_45 < var_4_46 and var_4_46 + var_4_44 > arg_1_1.duration_ then
				local var_4_47 = var_4_46

				arg_1_1.duration_ = var_4_46 + var_4_44
			end

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				local var_4_48 = "play"
				local var_4_49 = "voice"

				arg_1_1:AudioAction(var_4_48, var_4_49, "story_v_out_319351", "319351001", "story_v_out_319351.awb")
			end

			local var_4_50 = 0
			local var_4_51 = 0.9

			if var_4_50 < arg_1_1.time_ and arg_1_1.time_ <= var_4_50 + arg_4_0 then
				local var_4_52 = "play"
				local var_4_53 = "music"

				arg_1_1:AudioAction(var_4_52, var_4_53, "ui_battle", "ui_battle_stopbgm", "")
			end
		end
	end,
	Play319351002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 319351002
		arg_5_1.duration_ = 6.63333333333333

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play319351003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = "I11o"

			if arg_5_1.bgs_[var_8_0] == nil then
				local var_8_1 = Object.Instantiate(arg_5_1.paintGo_)

				var_8_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_8_0)
				var_8_1.name = var_8_0
				var_8_1.transform.parent = arg_5_1.stage_.transform
				var_8_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_5_1.bgs_[var_8_0] = var_8_1
			end

			local var_8_2 = 0

			if var_8_2 < arg_5_1.time_ and arg_5_1.time_ <= var_8_2 + arg_8_0 then
				local var_8_3 = manager.ui.mainCamera.transform.localPosition
				local var_8_4 = Vector3.New(0, 0, 10) + Vector3.New(var_8_3.x, var_8_3.y, 0)
				local var_8_5 = arg_5_1.bgs_.I11o

				var_8_5.transform.localPosition = var_8_4
				var_8_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_8_6 = var_8_5:GetComponent("SpriteRenderer")

				if var_8_6 and var_8_6.sprite then
					local var_8_7 = (var_8_5.transform.localPosition - var_8_3).z
					local var_8_8 = manager.ui.mainCameraCom_
					local var_8_9 = 2 * var_8_7 * Mathf.Tan(var_8_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_8_10 = var_8_9 * var_8_8.aspect
					local var_8_11 = var_8_6.sprite.bounds.size.x
					local var_8_12 = var_8_6.sprite.bounds.size.y
					local var_8_13 = var_8_10 / var_8_11
					local var_8_14 = var_8_9 / var_8_12
					local var_8_15 = var_8_14 < var_8_13 and var_8_13 or var_8_14

					var_8_5.transform.localScale = Vector3.New(var_8_15, var_8_15, 0)
				end

				for iter_8_0, iter_8_1 in pairs(arg_5_1.bgs_) do
					if iter_8_0 ~= "I11o" then
						iter_8_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_8_16 = 0

			if var_8_16 < arg_5_1.time_ and arg_5_1.time_ <= var_8_16 + arg_8_0 then
				arg_5_1.mask_.enabled = true
				arg_5_1.mask_.raycastTarget = true

				arg_5_1:SetGaussion(false)
			end

			local var_8_17 = 2

			if var_8_16 <= arg_5_1.time_ and arg_5_1.time_ < var_8_16 + var_8_17 then
				local var_8_18 = (arg_5_1.time_ - var_8_16) / var_8_17
				local var_8_19 = Color.New(0, 0, 0)

				var_8_19.a = Mathf.Lerp(1, 0, var_8_18)
				arg_5_1.mask_.color = var_8_19
			end

			if arg_5_1.time_ >= var_8_16 + var_8_17 and arg_5_1.time_ < var_8_16 + var_8_17 + arg_8_0 then
				local var_8_20 = Color.New(0, 0, 0)
				local var_8_21 = 0

				arg_5_1.mask_.enabled = false
				var_8_20.a = var_8_21
				arg_5_1.mask_.color = var_8_20
			end

			local var_8_22 = 0

			if var_8_22 < arg_5_1.time_ and arg_5_1.time_ <= var_8_22 + arg_8_0 then
				arg_5_1.fswbg_:SetActive(false)
				arg_5_1.dialog_:SetActive(false)
				arg_5_1:ShowNextGo(false)
			end

			local var_8_23 = 0.366666666666666

			if var_8_23 < arg_5_1.time_ and arg_5_1.time_ <= var_8_23 + arg_8_0 then
				arg_5_1.fswbg_:SetActive(false)
				arg_5_1.dialog_:SetActive(false)
				arg_5_1:ShowNextGo(false)
			end

			local var_8_24 = 0

			if var_8_24 < arg_5_1.time_ and arg_5_1.time_ <= var_8_24 + arg_8_0 then
				arg_5_1.cswbg_:SetActive(false)
			end

			if arg_5_1.frameCnt_ <= 1 then
				arg_5_1.dialog_:SetActive(false)
			end

			local var_8_25 = 1.63333333333333
			local var_8_26 = 1.025

			if var_8_25 < arg_5_1.time_ and arg_5_1.time_ <= var_8_25 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0

				arg_5_1.dialog_:SetActive(true)

				local var_8_27 = LeanTween.value(arg_5_1.dialog_, 0, 1, 0.3)

				var_8_27:setOnUpdate(LuaHelper.FloatAction(function(arg_9_0)
					arg_5_1.dialogCg_.alpha = arg_9_0
				end))
				var_8_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_5_1.dialog_)
					var_8_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_5_1.duration_ = arg_5_1.duration_ + 0.3

				SetActive(arg_5_1.leftNameGo_, false)

				arg_5_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_5_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_5_1:RecordName(arg_5_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_5_1.iconTrs_.gameObject, false)
				arg_5_1.callingController_:SetSelectedState("normal")

				local var_8_28 = arg_5_1:GetWordFromCfg(319351002)
				local var_8_29 = arg_5_1:FormatText(var_8_28.content)

				arg_5_1.text_.text = var_8_29

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.text_)

				local var_8_30 = 41
				local var_8_31 = utf8.len(var_8_29)
				local var_8_32 = var_8_30 <= 0 and var_8_26 or var_8_26 * (var_8_31 / var_8_30)

				if var_8_32 > 0 and var_8_26 < var_8_32 then
					arg_5_1.talkMaxDuration = var_8_32
					var_8_25 = var_8_25 + 0.3

					if var_8_32 + var_8_25 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_32 + var_8_25
					end
				end

				arg_5_1.text_.text = var_8_29
				arg_5_1.typewritter.percent = 0

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(false)
				arg_5_1:RecordContent(arg_5_1.text_.text)
			end

			local var_8_33 = var_8_25 + 0.3
			local var_8_34 = math.max(var_8_26, arg_5_1.talkMaxDuration)

			if var_8_33 <= arg_5_1.time_ and arg_5_1.time_ < var_8_33 + var_8_34 then
				arg_5_1.typewritter.percent = (arg_5_1.time_ - var_8_33) / var_8_34

				arg_5_1.typewritter:SetDirty()
			end

			if arg_5_1.time_ >= var_8_33 + var_8_34 and arg_5_1.time_ < var_8_33 + var_8_34 + arg_8_0 then
				arg_5_1.typewritter.percent = 1

				arg_5_1.typewritter:SetDirty()
				arg_5_1:ShowNextGo(true)
			end
		end
	end,
	Play319351003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319351003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play319351004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.8

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_2 = arg_11_1:GetWordFromCfg(319351003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 32
				local var_14_5 = utf8.len(var_14_3)
				local var_14_6 = var_14_4 <= 0 and var_14_1 or var_14_1 * (var_14_5 / var_14_4)

				if var_14_6 > 0 and var_14_1 < var_14_6 then
					arg_11_1.talkMaxDuration = var_14_6

					if var_14_6 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_6 + var_14_0
					end
				end

				arg_11_1.text_.text = var_14_3
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_7 = math.max(var_14_1, arg_11_1.talkMaxDuration)

			if var_14_0 <= arg_11_1.time_ and arg_11_1.time_ < var_14_0 + var_14_7 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_0) / var_14_7

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_0 + var_14_7 and arg_11_1.time_ < var_14_0 + var_14_7 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play319351004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319351004
		arg_15_1.duration_ = 7.533

		local var_15_0 = {
			zh = 3.166,
			ja = 7.533
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
				arg_15_0:Play319351005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "1084ui_story"

			if arg_15_1.actors_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(Asset.Load("Char/" .. var_18_0), arg_15_1.stage_.transform)

				var_18_1.name = var_18_0
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.actors_[var_18_0] = var_18_1

				local var_18_2 = var_18_1:GetComponentInChildren(typeof(CharacterEffect))

				var_18_2.enabled = true

				local var_18_3 = GameObjectTools.GetOrAddComponent(var_18_1, typeof(DynamicBoneHelper))

				if var_18_3 then
					var_18_3:EnableDynamicBone(false)
				end

				arg_15_1:ShowWeapon(var_18_2.transform, false)

				arg_15_1.var_[var_18_0 .. "Animator"] = var_18_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_15_1.var_[var_18_0 .. "Animator"].applyRootMotion = true
				arg_15_1.var_[var_18_0 .. "LipSync"] = var_18_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_18_4 = arg_15_1.actors_["1084ui_story"].transform
			local var_18_5 = 0

			if var_18_5 < arg_15_1.time_ and arg_15_1.time_ <= var_18_5 + arg_18_0 then
				arg_15_1.var_.moveOldPos1084ui_story = var_18_4.localPosition

				local var_18_6 = "1084ui_story"

				arg_15_1:ShowWeapon(arg_15_1.var_[var_18_6 .. "Animator"].transform, false)
			end

			local var_18_7 = 0.001

			if var_18_5 <= arg_15_1.time_ and arg_15_1.time_ < var_18_5 + var_18_7 then
				local var_18_8 = (arg_15_1.time_ - var_18_5) / var_18_7
				local var_18_9 = Vector3.New(0, -0.97, -6)

				var_18_4.localPosition = Vector3.Lerp(arg_15_1.var_.moveOldPos1084ui_story, var_18_9, var_18_8)

				local var_18_10 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_10.x, var_18_10.y, var_18_10.z)

				local var_18_11 = var_18_4.localEulerAngles

				var_18_11.z = 0
				var_18_11.x = 0
				var_18_4.localEulerAngles = var_18_11
			end

			if arg_15_1.time_ >= var_18_5 + var_18_7 and arg_15_1.time_ < var_18_5 + var_18_7 + arg_18_0 then
				var_18_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_18_12 = manager.ui.mainCamera.transform.position - var_18_4.position

				var_18_4.forward = Vector3.New(var_18_12.x, var_18_12.y, var_18_12.z)

				local var_18_13 = var_18_4.localEulerAngles

				var_18_13.z = 0
				var_18_13.x = 0
				var_18_4.localEulerAngles = var_18_13
			end

			local var_18_14 = arg_15_1.actors_["1084ui_story"]
			local var_18_15 = 0

			if var_18_15 < arg_15_1.time_ and arg_15_1.time_ <= var_18_15 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story == nil then
				arg_15_1.var_.characterEffect1084ui_story = var_18_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_18_16 = 0.200000002980232

			if var_18_15 <= arg_15_1.time_ and arg_15_1.time_ < var_18_15 + var_18_16 then
				local var_18_17 = (arg_15_1.time_ - var_18_15) / var_18_16

				if arg_15_1.var_.characterEffect1084ui_story then
					arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_15_1.time_ >= var_18_15 + var_18_16 and arg_15_1.time_ < var_18_15 + var_18_16 + arg_18_0 and arg_15_1.var_.characterEffect1084ui_story then
				arg_15_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_18_18 = 0

			if var_18_18 < arg_15_1.time_ and arg_15_1.time_ <= var_18_18 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_18_19 = 0

			if var_18_19 < arg_15_1.time_ and arg_15_1.time_ <= var_18_19 + arg_18_0 then
				arg_15_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_18_20 = 0
			local var_18_21 = 0.4

			if var_18_20 < arg_15_1.time_ and arg_15_1.time_ <= var_18_20 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_22 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_23 = arg_15_1:GetWordFromCfg(319351004)
				local var_18_24 = arg_15_1:FormatText(var_18_23.content)

				arg_15_1.text_.text = var_18_24

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_25 = 16
				local var_18_26 = utf8.len(var_18_24)
				local var_18_27 = var_18_25 <= 0 and var_18_21 or var_18_21 * (var_18_26 / var_18_25)

				if var_18_27 > 0 and var_18_21 < var_18_27 then
					arg_15_1.talkMaxDuration = var_18_27

					if var_18_27 + var_18_20 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_27 + var_18_20
					end
				end

				arg_15_1.text_.text = var_18_24
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351004", "story_v_out_319351.awb") ~= 0 then
					local var_18_28 = manager.audio:GetVoiceLength("story_v_out_319351", "319351004", "story_v_out_319351.awb") / 1000

					if var_18_28 + var_18_20 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_28 + var_18_20
					end

					if var_18_23.prefab_name ~= "" and arg_15_1.actors_[var_18_23.prefab_name] ~= nil then
						local var_18_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_23.prefab_name].transform, "story_v_out_319351", "319351004", "story_v_out_319351.awb")

						arg_15_1:RecordAudio("319351004", var_18_29)
						arg_15_1:RecordAudio("319351004", var_18_29)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319351", "319351004", "story_v_out_319351.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319351", "319351004", "story_v_out_319351.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_30 = math.max(var_18_21, arg_15_1.talkMaxDuration)

			if var_18_20 <= arg_15_1.time_ and arg_15_1.time_ < var_18_20 + var_18_30 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_20) / var_18_30

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_20 + var_18_30 and arg_15_1.time_ < var_18_20 + var_18_30 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play319351005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319351005
		arg_19_1.duration_ = 4.633

		local var_19_0 = {
			zh = 3.066,
			ja = 4.633
		}
		local var_19_1 = manager.audio:GetLocalizationFlag()

		if var_19_0[var_19_1] ~= nil then
			arg_19_1.duration_ = var_19_0[var_19_1]
		end

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play319351006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "10058ui_story"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(Asset.Load("Char/" .. var_22_0), arg_19_1.stage_.transform)

				var_22_1.name = var_22_0
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_0] = var_22_1

				local var_22_2 = var_22_1:GetComponentInChildren(typeof(CharacterEffect))

				var_22_2.enabled = true

				local var_22_3 = GameObjectTools.GetOrAddComponent(var_22_1, typeof(DynamicBoneHelper))

				if var_22_3 then
					var_22_3:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_2.transform, false)

				arg_19_1.var_[var_22_0 .. "Animator"] = var_22_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_0 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_0 .. "LipSync"] = var_22_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_4 = arg_19_1.actors_["10058ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos10058ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0.7, -0.98, -6.1)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos10058ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = arg_19_1.actors_["10058ui_story"]
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 and arg_19_1.var_.characterEffect10058ui_story == nil then
				arg_19_1.var_.characterEffect10058ui_story = var_22_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_15 = 0.200000002980232

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15

				if arg_19_1.var_.characterEffect10058ui_story then
					arg_19_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 and arg_19_1.var_.characterEffect10058ui_story then
				arg_19_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_22_17 = arg_19_1.actors_["1084ui_story"].transform
			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1.var_.moveOldPos1084ui_story = var_22_17.localPosition
			end

			local var_22_19 = 0.001

			if var_22_18 <= arg_19_1.time_ and arg_19_1.time_ < var_22_18 + var_22_19 then
				local var_22_20 = (arg_19_1.time_ - var_22_18) / var_22_19
				local var_22_21 = Vector3.New(-0.7, -0.97, -6)

				var_22_17.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1084ui_story, var_22_21, var_22_20)

				local var_22_22 = manager.ui.mainCamera.transform.position - var_22_17.position

				var_22_17.forward = Vector3.New(var_22_22.x, var_22_22.y, var_22_22.z)

				local var_22_23 = var_22_17.localEulerAngles

				var_22_23.z = 0
				var_22_23.x = 0
				var_22_17.localEulerAngles = var_22_23
			end

			if arg_19_1.time_ >= var_22_18 + var_22_19 and arg_19_1.time_ < var_22_18 + var_22_19 + arg_22_0 then
				var_22_17.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_22_24 = manager.ui.mainCamera.transform.position - var_22_17.position

				var_22_17.forward = Vector3.New(var_22_24.x, var_22_24.y, var_22_24.z)

				local var_22_25 = var_22_17.localEulerAngles

				var_22_25.z = 0
				var_22_25.x = 0
				var_22_17.localEulerAngles = var_22_25
			end

			local var_22_26 = arg_19_1.actors_["1084ui_story"]
			local var_22_27 = 0

			if var_22_27 < arg_19_1.time_ and arg_19_1.time_ <= var_22_27 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story == nil then
				arg_19_1.var_.characterEffect1084ui_story = var_22_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_28 = 0.200000002980232

			if var_22_27 <= arg_19_1.time_ and arg_19_1.time_ < var_22_27 + var_22_28 then
				local var_22_29 = (arg_19_1.time_ - var_22_27) / var_22_28

				if arg_19_1.var_.characterEffect1084ui_story then
					local var_22_30 = Mathf.Lerp(0, 0.5, var_22_29)

					arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_30
				end
			end

			if arg_19_1.time_ >= var_22_27 + var_22_28 and arg_19_1.time_ < var_22_27 + var_22_28 + arg_22_0 and arg_19_1.var_.characterEffect1084ui_story then
				local var_22_31 = 0.5

				arg_19_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_19_1.var_.characterEffect1084ui_story.fillRatio = var_22_31
			end

			local var_22_32 = 0

			if var_22_32 < arg_19_1.time_ and arg_19_1.time_ <= var_22_32 + arg_22_0 then
				arg_19_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_22_33 = 0
			local var_22_34 = 0.3

			if var_22_33 < arg_19_1.time_ and arg_19_1.time_ <= var_22_33 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_35 = arg_19_1:FormatText(StoryNameCfg[471].name)

				arg_19_1.leftNameTxt_.text = var_22_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_36 = arg_19_1:GetWordFromCfg(319351005)
				local var_22_37 = arg_19_1:FormatText(var_22_36.content)

				arg_19_1.text_.text = var_22_37

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_38 = 12
				local var_22_39 = utf8.len(var_22_37)
				local var_22_40 = var_22_38 <= 0 and var_22_34 or var_22_34 * (var_22_39 / var_22_38)

				if var_22_40 > 0 and var_22_34 < var_22_40 then
					arg_19_1.talkMaxDuration = var_22_40

					if var_22_40 + var_22_33 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_40 + var_22_33
					end
				end

				arg_19_1.text_.text = var_22_37
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351005", "story_v_out_319351.awb") ~= 0 then
					local var_22_41 = manager.audio:GetVoiceLength("story_v_out_319351", "319351005", "story_v_out_319351.awb") / 1000

					if var_22_41 + var_22_33 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_41 + var_22_33
					end

					if var_22_36.prefab_name ~= "" and arg_19_1.actors_[var_22_36.prefab_name] ~= nil then
						local var_22_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_36.prefab_name].transform, "story_v_out_319351", "319351005", "story_v_out_319351.awb")

						arg_19_1:RecordAudio("319351005", var_22_42)
						arg_19_1:RecordAudio("319351005", var_22_42)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319351", "319351005", "story_v_out_319351.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319351", "319351005", "story_v_out_319351.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_43 = math.max(var_22_34, arg_19_1.talkMaxDuration)

			if var_22_33 <= arg_19_1.time_ and arg_19_1.time_ < var_22_33 + var_22_43 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_33) / var_22_43

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_33 + var_22_43 and arg_19_1.time_ < var_22_33 + var_22_43 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319351006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319351006
		arg_23_1.duration_ = 5.366

		local var_23_0 = {
			zh = 3.866,
			ja = 5.366
		}
		local var_23_1 = manager.audio:GetLocalizationFlag()

		if var_23_0[var_23_1] ~= nil then
			arg_23_1.duration_ = var_23_0[var_23_1]
		end

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play319351007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_1")
			end

			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_26_2 = 0
			local var_26_3 = 0.45

			if var_26_2 < arg_23_1.time_ and arg_23_1.time_ <= var_26_2 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_4 = arg_23_1:FormatText(StoryNameCfg[471].name)

				arg_23_1.leftNameTxt_.text = var_26_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_5 = arg_23_1:GetWordFromCfg(319351006)
				local var_26_6 = arg_23_1:FormatText(var_26_5.content)

				arg_23_1.text_.text = var_26_6

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_7 = 18
				local var_26_8 = utf8.len(var_26_6)
				local var_26_9 = var_26_7 <= 0 and var_26_3 or var_26_3 * (var_26_8 / var_26_7)

				if var_26_9 > 0 and var_26_3 < var_26_9 then
					arg_23_1.talkMaxDuration = var_26_9

					if var_26_9 + var_26_2 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_9 + var_26_2
					end
				end

				arg_23_1.text_.text = var_26_6
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351006", "story_v_out_319351.awb") ~= 0 then
					local var_26_10 = manager.audio:GetVoiceLength("story_v_out_319351", "319351006", "story_v_out_319351.awb") / 1000

					if var_26_10 + var_26_2 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_10 + var_26_2
					end

					if var_26_5.prefab_name ~= "" and arg_23_1.actors_[var_26_5.prefab_name] ~= nil then
						local var_26_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_5.prefab_name].transform, "story_v_out_319351", "319351006", "story_v_out_319351.awb")

						arg_23_1:RecordAudio("319351006", var_26_11)
						arg_23_1:RecordAudio("319351006", var_26_11)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319351", "319351006", "story_v_out_319351.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319351", "319351006", "story_v_out_319351.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_12 = math.max(var_26_3, arg_23_1.talkMaxDuration)

			if var_26_2 <= arg_23_1.time_ and arg_23_1.time_ < var_26_2 + var_26_12 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_2) / var_26_12

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_2 + var_26_12 and arg_23_1.time_ < var_26_2 + var_26_12 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319351007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319351007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play319351008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10058ui_story"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.characterEffect10058ui_story == nil then
				arg_27_1.var_.characterEffect10058ui_story = var_30_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_2 = 0.200000002980232

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.characterEffect10058ui_story then
					local var_30_4 = Mathf.Lerp(0, 0.5, var_30_3)

					arg_27_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_27_1.var_.characterEffect10058ui_story.fillRatio = var_30_4
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.characterEffect10058ui_story then
				local var_30_5 = 0.5

				arg_27_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_27_1.var_.characterEffect10058ui_story.fillRatio = var_30_5
			end

			local var_30_6 = 0
			local var_30_7 = 0.75

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_8 = arg_27_1:GetWordFromCfg(319351007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 30
				local var_30_11 = utf8.len(var_30_9)
				local var_30_12 = var_30_10 <= 0 and var_30_7 or var_30_7 * (var_30_11 / var_30_10)

				if var_30_12 > 0 and var_30_7 < var_30_12 then
					arg_27_1.talkMaxDuration = var_30_12

					if var_30_12 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_9
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_13 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_13 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_13

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_13 and arg_27_1.time_ < var_30_6 + var_30_13 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319351008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319351008
		arg_31_1.duration_ = 8.8

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play319351009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = "ST74"

			if arg_31_1.bgs_[var_34_0] == nil then
				local var_34_1 = Object.Instantiate(arg_31_1.paintGo_)

				var_34_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_34_0)
				var_34_1.name = var_34_0
				var_34_1.transform.parent = arg_31_1.stage_.transform
				var_34_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_31_1.bgs_[var_34_0] = var_34_1
			end

			local var_34_2 = 2

			if var_34_2 < arg_31_1.time_ and arg_31_1.time_ <= var_34_2 + arg_34_0 then
				local var_34_3 = manager.ui.mainCamera.transform.localPosition
				local var_34_4 = Vector3.New(0, 0, 10) + Vector3.New(var_34_3.x, var_34_3.y, 0)
				local var_34_5 = arg_31_1.bgs_.ST74

				var_34_5.transform.localPosition = var_34_4
				var_34_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_6 = var_34_5:GetComponent("SpriteRenderer")

				if var_34_6 and var_34_6.sprite then
					local var_34_7 = (var_34_5.transform.localPosition - var_34_3).z
					local var_34_8 = manager.ui.mainCameraCom_
					local var_34_9 = 2 * var_34_7 * Mathf.Tan(var_34_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_10 = var_34_9 * var_34_8.aspect
					local var_34_11 = var_34_6.sprite.bounds.size.x
					local var_34_12 = var_34_6.sprite.bounds.size.y
					local var_34_13 = var_34_10 / var_34_11
					local var_34_14 = var_34_9 / var_34_12
					local var_34_15 = var_34_14 < var_34_13 and var_34_13 or var_34_14

					var_34_5.transform.localScale = Vector3.New(var_34_15, var_34_15, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "ST74" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_16 = 0

			if var_34_16 < arg_31_1.time_ and arg_31_1.time_ <= var_34_16 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_17 = 2

			if var_34_16 <= arg_31_1.time_ and arg_31_1.time_ < var_34_16 + var_34_17 then
				local var_34_18 = (arg_31_1.time_ - var_34_16) / var_34_17
				local var_34_19 = Color.New(0, 0, 0)

				var_34_19.a = Mathf.Lerp(0, 1, var_34_18)
				arg_31_1.mask_.color = var_34_19
			end

			if arg_31_1.time_ >= var_34_16 + var_34_17 and arg_31_1.time_ < var_34_16 + var_34_17 + arg_34_0 then
				local var_34_20 = Color.New(0, 0, 0)

				var_34_20.a = 1
				arg_31_1.mask_.color = var_34_20
			end

			local var_34_21 = 2

			if var_34_21 < arg_31_1.time_ and arg_31_1.time_ <= var_34_21 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_22 = 2

			if var_34_21 <= arg_31_1.time_ and arg_31_1.time_ < var_34_21 + var_34_22 then
				local var_34_23 = (arg_31_1.time_ - var_34_21) / var_34_22
				local var_34_24 = Color.New(0, 0, 0)

				var_34_24.a = Mathf.Lerp(1, 0, var_34_23)
				arg_31_1.mask_.color = var_34_24
			end

			if arg_31_1.time_ >= var_34_21 + var_34_22 and arg_31_1.time_ < var_34_21 + var_34_22 + arg_34_0 then
				local var_34_25 = Color.New(0, 0, 0)
				local var_34_26 = 0

				arg_31_1.mask_.enabled = false
				var_34_25.a = var_34_26
				arg_31_1.mask_.color = var_34_25
			end

			local var_34_27 = 0.1
			local var_34_28 = 1

			if var_34_27 < arg_31_1.time_ and arg_31_1.time_ <= var_34_27 + arg_34_0 then
				local var_34_29 = "play"
				local var_34_30 = "music"

				arg_31_1:AudioAction(var_34_29, var_34_30, "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon", "bgm_activity_3_0_story_moon.awb")
			end

			local var_34_31 = 0
			local var_34_32 = 0.0666666666666667

			if var_34_31 < arg_31_1.time_ and arg_31_1.time_ <= var_34_31 + arg_34_0 then
				local var_34_33 = "play"
				local var_34_34 = "music"

				arg_31_1:AudioAction(var_34_33, var_34_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_34_35 = arg_31_1.actors_["10058ui_story"].transform
			local var_34_36 = 2

			if var_34_36 < arg_31_1.time_ and arg_31_1.time_ <= var_34_36 + arg_34_0 then
				arg_31_1.var_.moveOldPos10058ui_story = var_34_35.localPosition
			end

			local var_34_37 = 0.001

			if var_34_36 <= arg_31_1.time_ and arg_31_1.time_ < var_34_36 + var_34_37 then
				local var_34_38 = (arg_31_1.time_ - var_34_36) / var_34_37
				local var_34_39 = Vector3.New(0, 100, 0)

				var_34_35.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos10058ui_story, var_34_39, var_34_38)

				local var_34_40 = manager.ui.mainCamera.transform.position - var_34_35.position

				var_34_35.forward = Vector3.New(var_34_40.x, var_34_40.y, var_34_40.z)

				local var_34_41 = var_34_35.localEulerAngles

				var_34_41.z = 0
				var_34_41.x = 0
				var_34_35.localEulerAngles = var_34_41
			end

			if arg_31_1.time_ >= var_34_36 + var_34_37 and arg_31_1.time_ < var_34_36 + var_34_37 + arg_34_0 then
				var_34_35.localPosition = Vector3.New(0, 100, 0)

				local var_34_42 = manager.ui.mainCamera.transform.position - var_34_35.position

				var_34_35.forward = Vector3.New(var_34_42.x, var_34_42.y, var_34_42.z)

				local var_34_43 = var_34_35.localEulerAngles

				var_34_43.z = 0
				var_34_43.x = 0
				var_34_35.localEulerAngles = var_34_43
			end

			local var_34_44 = arg_31_1.actors_["1084ui_story"].transform
			local var_34_45 = 2

			if var_34_45 < arg_31_1.time_ and arg_31_1.time_ <= var_34_45 + arg_34_0 then
				arg_31_1.var_.moveOldPos1084ui_story = var_34_44.localPosition
			end

			local var_34_46 = 0.001

			if var_34_45 <= arg_31_1.time_ and arg_31_1.time_ < var_34_45 + var_34_46 then
				local var_34_47 = (arg_31_1.time_ - var_34_45) / var_34_46
				local var_34_48 = Vector3.New(0, 100, 0)

				var_34_44.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1084ui_story, var_34_48, var_34_47)

				local var_34_49 = manager.ui.mainCamera.transform.position - var_34_44.position

				var_34_44.forward = Vector3.New(var_34_49.x, var_34_49.y, var_34_49.z)

				local var_34_50 = var_34_44.localEulerAngles

				var_34_50.z = 0
				var_34_50.x = 0
				var_34_44.localEulerAngles = var_34_50
			end

			if arg_31_1.time_ >= var_34_45 + var_34_46 and arg_31_1.time_ < var_34_45 + var_34_46 + arg_34_0 then
				var_34_44.localPosition = Vector3.New(0, 100, 0)

				local var_34_51 = manager.ui.mainCamera.transform.position - var_34_44.position

				var_34_44.forward = Vector3.New(var_34_51.x, var_34_51.y, var_34_51.z)

				local var_34_52 = var_34_44.localEulerAngles

				var_34_52.z = 0
				var_34_52.x = 0
				var_34_44.localEulerAngles = var_34_52
			end

			if arg_31_1.frameCnt_ <= 1 then
				arg_31_1.dialog_:SetActive(false)
			end

			local var_34_53 = 3.8
			local var_34_54 = 1.625

			if var_34_53 < arg_31_1.time_ and arg_31_1.time_ <= var_34_53 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_55 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_55:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_56 = arg_31_1:GetWordFromCfg(319351008)
				local var_34_57 = arg_31_1:FormatText(var_34_56.content)

				arg_31_1.text_.text = var_34_57

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_58 = 65
				local var_34_59 = utf8.len(var_34_57)
				local var_34_60 = var_34_58 <= 0 and var_34_54 or var_34_54 * (var_34_59 / var_34_58)

				if var_34_60 > 0 and var_34_54 < var_34_60 then
					arg_31_1.talkMaxDuration = var_34_60
					var_34_53 = var_34_53 + 0.3

					if var_34_60 + var_34_53 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_60 + var_34_53
					end
				end

				arg_31_1.text_.text = var_34_57
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_61 = var_34_53 + 0.3
			local var_34_62 = math.max(var_34_54, arg_31_1.talkMaxDuration)

			if var_34_61 <= arg_31_1.time_ and arg_31_1.time_ < var_34_61 + var_34_62 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_61) / var_34_62

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_61 + var_34_62 and arg_31_1.time_ < var_34_61 + var_34_62 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play319351009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 319351009
		arg_37_1.duration_ = 5

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play319351010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 1.25

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_2 = arg_37_1:GetWordFromCfg(319351009)
				local var_40_3 = arg_37_1:FormatText(var_40_2.content)

				arg_37_1.text_.text = var_40_3

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_4 = 50
				local var_40_5 = utf8.len(var_40_3)
				local var_40_6 = var_40_4 <= 0 and var_40_1 or var_40_1 * (var_40_5 / var_40_4)

				if var_40_6 > 0 and var_40_1 < var_40_6 then
					arg_37_1.talkMaxDuration = var_40_6

					if var_40_6 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_6 + var_40_0
					end
				end

				arg_37_1.text_.text = var_40_3
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_7 = math.max(var_40_1, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_7 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_0) / var_40_7

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_7 and arg_37_1.time_ < var_40_0 + var_40_7 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play319351010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 319351010
		arg_41_1.duration_ = 5.666

		local var_41_0 = {
			zh = 3.433,
			ja = 5.666
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
				arg_41_0:Play319351011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1084ui_story"].transform
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 then
				arg_41_1.var_.moveOldPos1084ui_story = var_44_0.localPosition

				local var_44_2 = "1084ui_story"

				arg_41_1:ShowWeapon(arg_41_1.var_[var_44_2 .. "Animator"].transform, false)
			end

			local var_44_3 = 0.001

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_3 then
				local var_44_4 = (arg_41_1.time_ - var_44_1) / var_44_3
				local var_44_5 = Vector3.New(0, -0.97, -6)

				var_44_0.localPosition = Vector3.Lerp(arg_41_1.var_.moveOldPos1084ui_story, var_44_5, var_44_4)

				local var_44_6 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_6.x, var_44_6.y, var_44_6.z)

				local var_44_7 = var_44_0.localEulerAngles

				var_44_7.z = 0
				var_44_7.x = 0
				var_44_0.localEulerAngles = var_44_7
			end

			if arg_41_1.time_ >= var_44_1 + var_44_3 and arg_41_1.time_ < var_44_1 + var_44_3 + arg_44_0 then
				var_44_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_44_8 = manager.ui.mainCamera.transform.position - var_44_0.position

				var_44_0.forward = Vector3.New(var_44_8.x, var_44_8.y, var_44_8.z)

				local var_44_9 = var_44_0.localEulerAngles

				var_44_9.z = 0
				var_44_9.x = 0
				var_44_0.localEulerAngles = var_44_9
			end

			local var_44_10 = arg_41_1.actors_["1084ui_story"]
			local var_44_11 = 0

			if var_44_11 < arg_41_1.time_ and arg_41_1.time_ <= var_44_11 + arg_44_0 and arg_41_1.var_.characterEffect1084ui_story == nil then
				arg_41_1.var_.characterEffect1084ui_story = var_44_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_44_12 = 0.200000002980232

			if var_44_11 <= arg_41_1.time_ and arg_41_1.time_ < var_44_11 + var_44_12 then
				local var_44_13 = (arg_41_1.time_ - var_44_11) / var_44_12

				if arg_41_1.var_.characterEffect1084ui_story then
					arg_41_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_41_1.time_ >= var_44_11 + var_44_12 and arg_41_1.time_ < var_44_11 + var_44_12 + arg_44_0 and arg_41_1.var_.characterEffect1084ui_story then
				arg_41_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_44_14 = 0

			if var_44_14 < arg_41_1.time_ and arg_41_1.time_ <= var_44_14 + arg_44_0 then
				arg_41_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_44_15 = 0

			if var_44_15 < arg_41_1.time_ and arg_41_1.time_ <= var_44_15 + arg_44_0 then
				arg_41_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_44_16 = 0
			local var_44_17 = 0.375

			if var_44_16 < arg_41_1.time_ and arg_41_1.time_ <= var_44_16 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_18 = arg_41_1:FormatText(StoryNameCfg[6].name)

				arg_41_1.leftNameTxt_.text = var_44_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_19 = arg_41_1:GetWordFromCfg(319351010)
				local var_44_20 = arg_41_1:FormatText(var_44_19.content)

				arg_41_1.text_.text = var_44_20

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_21 = 15
				local var_44_22 = utf8.len(var_44_20)
				local var_44_23 = var_44_21 <= 0 and var_44_17 or var_44_17 * (var_44_22 / var_44_21)

				if var_44_23 > 0 and var_44_17 < var_44_23 then
					arg_41_1.talkMaxDuration = var_44_23

					if var_44_23 + var_44_16 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_23 + var_44_16
					end
				end

				arg_41_1.text_.text = var_44_20
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351010", "story_v_out_319351.awb") ~= 0 then
					local var_44_24 = manager.audio:GetVoiceLength("story_v_out_319351", "319351010", "story_v_out_319351.awb") / 1000

					if var_44_24 + var_44_16 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_24 + var_44_16
					end

					if var_44_19.prefab_name ~= "" and arg_41_1.actors_[var_44_19.prefab_name] ~= nil then
						local var_44_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_19.prefab_name].transform, "story_v_out_319351", "319351010", "story_v_out_319351.awb")

						arg_41_1:RecordAudio("319351010", var_44_25)
						arg_41_1:RecordAudio("319351010", var_44_25)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_319351", "319351010", "story_v_out_319351.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_319351", "319351010", "story_v_out_319351.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_26 = math.max(var_44_17, arg_41_1.talkMaxDuration)

			if var_44_16 <= arg_41_1.time_ and arg_41_1.time_ < var_44_16 + var_44_26 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_16) / var_44_26

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_16 + var_44_26 and arg_41_1.time_ < var_44_16 + var_44_26 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play319351011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 319351011
		arg_45_1.duration_ = 6.8

		local var_45_0 = {
			zh = 6.266,
			ja = 6.8
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
				arg_45_0:Play319351012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["10058ui_story"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.characterEffect10058ui_story == nil then
				arg_45_1.var_.characterEffect10058ui_story = var_48_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_2 = 0.200000002980232

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.characterEffect10058ui_story then
					arg_45_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.characterEffect10058ui_story then
				arg_45_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_48_4 = arg_45_1.actors_["1084ui_story"]
			local var_48_5 = 0

			if var_48_5 < arg_45_1.time_ and arg_45_1.time_ <= var_48_5 + arg_48_0 and arg_45_1.var_.characterEffect1084ui_story == nil then
				arg_45_1.var_.characterEffect1084ui_story = var_48_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_48_6 = 0.200000002980232

			if var_48_5 <= arg_45_1.time_ and arg_45_1.time_ < var_48_5 + var_48_6 then
				local var_48_7 = (arg_45_1.time_ - var_48_5) / var_48_6

				if arg_45_1.var_.characterEffect1084ui_story then
					local var_48_8 = Mathf.Lerp(0, 0.5, var_48_7)

					arg_45_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_45_1.var_.characterEffect1084ui_story.fillRatio = var_48_8
				end
			end

			if arg_45_1.time_ >= var_48_5 + var_48_6 and arg_45_1.time_ < var_48_5 + var_48_6 + arg_48_0 and arg_45_1.var_.characterEffect1084ui_story then
				local var_48_9 = 0.5

				arg_45_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_45_1.var_.characterEffect1084ui_story.fillRatio = var_48_9
			end

			local var_48_10 = arg_45_1.actors_["10058ui_story"].transform
			local var_48_11 = 0

			if var_48_11 < arg_45_1.time_ and arg_45_1.time_ <= var_48_11 + arg_48_0 then
				arg_45_1.var_.moveOldPos10058ui_story = var_48_10.localPosition
			end

			local var_48_12 = 0.001

			if var_48_11 <= arg_45_1.time_ and arg_45_1.time_ < var_48_11 + var_48_12 then
				local var_48_13 = (arg_45_1.time_ - var_48_11) / var_48_12
				local var_48_14 = Vector3.New(0.7, -0.98, -6.1)

				var_48_10.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos10058ui_story, var_48_14, var_48_13)

				local var_48_15 = manager.ui.mainCamera.transform.position - var_48_10.position

				var_48_10.forward = Vector3.New(var_48_15.x, var_48_15.y, var_48_15.z)

				local var_48_16 = var_48_10.localEulerAngles

				var_48_16.z = 0
				var_48_16.x = 0
				var_48_10.localEulerAngles = var_48_16
			end

			if arg_45_1.time_ >= var_48_11 + var_48_12 and arg_45_1.time_ < var_48_11 + var_48_12 + arg_48_0 then
				var_48_10.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_48_17 = manager.ui.mainCamera.transform.position - var_48_10.position

				var_48_10.forward = Vector3.New(var_48_17.x, var_48_17.y, var_48_17.z)

				local var_48_18 = var_48_10.localEulerAngles

				var_48_18.z = 0
				var_48_18.x = 0
				var_48_10.localEulerAngles = var_48_18
			end

			local var_48_19 = arg_45_1.actors_["1084ui_story"].transform
			local var_48_20 = 0

			if var_48_20 < arg_45_1.time_ and arg_45_1.time_ <= var_48_20 + arg_48_0 then
				arg_45_1.var_.moveOldPos1084ui_story = var_48_19.localPosition
			end

			local var_48_21 = 0.001

			if var_48_20 <= arg_45_1.time_ and arg_45_1.time_ < var_48_20 + var_48_21 then
				local var_48_22 = (arg_45_1.time_ - var_48_20) / var_48_21
				local var_48_23 = Vector3.New(-0.7, -0.97, -6)

				var_48_19.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPos1084ui_story, var_48_23, var_48_22)

				local var_48_24 = manager.ui.mainCamera.transform.position - var_48_19.position

				var_48_19.forward = Vector3.New(var_48_24.x, var_48_24.y, var_48_24.z)

				local var_48_25 = var_48_19.localEulerAngles

				var_48_25.z = 0
				var_48_25.x = 0
				var_48_19.localEulerAngles = var_48_25
			end

			if arg_45_1.time_ >= var_48_20 + var_48_21 and arg_45_1.time_ < var_48_20 + var_48_21 + arg_48_0 then
				var_48_19.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_48_26 = manager.ui.mainCamera.transform.position - var_48_19.position

				var_48_19.forward = Vector3.New(var_48_26.x, var_48_26.y, var_48_26.z)

				local var_48_27 = var_48_19.localEulerAngles

				var_48_27.z = 0
				var_48_27.x = 0
				var_48_19.localEulerAngles = var_48_27
			end

			local var_48_28 = 0

			if var_48_28 < arg_45_1.time_ and arg_45_1.time_ <= var_48_28 + arg_48_0 then
				arg_45_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_48_29 = 0
			local var_48_30 = 0.85

			if var_48_29 < arg_45_1.time_ and arg_45_1.time_ <= var_48_29 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_31 = arg_45_1:FormatText(StoryNameCfg[471].name)

				arg_45_1.leftNameTxt_.text = var_48_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_32 = arg_45_1:GetWordFromCfg(319351011)
				local var_48_33 = arg_45_1:FormatText(var_48_32.content)

				arg_45_1.text_.text = var_48_33

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_34 = 34
				local var_48_35 = utf8.len(var_48_33)
				local var_48_36 = var_48_34 <= 0 and var_48_30 or var_48_30 * (var_48_35 / var_48_34)

				if var_48_36 > 0 and var_48_30 < var_48_36 then
					arg_45_1.talkMaxDuration = var_48_36

					if var_48_36 + var_48_29 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_36 + var_48_29
					end
				end

				arg_45_1.text_.text = var_48_33
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351011", "story_v_out_319351.awb") ~= 0 then
					local var_48_37 = manager.audio:GetVoiceLength("story_v_out_319351", "319351011", "story_v_out_319351.awb") / 1000

					if var_48_37 + var_48_29 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_37 + var_48_29
					end

					if var_48_32.prefab_name ~= "" and arg_45_1.actors_[var_48_32.prefab_name] ~= nil then
						local var_48_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_32.prefab_name].transform, "story_v_out_319351", "319351011", "story_v_out_319351.awb")

						arg_45_1:RecordAudio("319351011", var_48_38)
						arg_45_1:RecordAudio("319351011", var_48_38)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_319351", "319351011", "story_v_out_319351.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_319351", "319351011", "story_v_out_319351.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_39 = math.max(var_48_30, arg_45_1.talkMaxDuration)

			if var_48_29 <= arg_45_1.time_ and arg_45_1.time_ < var_48_29 + var_48_39 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_29) / var_48_39

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_29 + var_48_39 and arg_45_1.time_ < var_48_29 + var_48_39 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play319351012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 319351012
		arg_49_1.duration_ = 8

		local var_49_0 = {
			zh = 6,
			ja = 8
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
				arg_49_0:Play319351013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["10058ui_story"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.characterEffect10058ui_story == nil then
				arg_49_1.var_.characterEffect10058ui_story = var_52_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_2 = 0.200000002980232

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.characterEffect10058ui_story then
					local var_52_4 = Mathf.Lerp(0, 0.5, var_52_3)

					arg_49_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_49_1.var_.characterEffect10058ui_story.fillRatio = var_52_4
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.characterEffect10058ui_story then
				local var_52_5 = 0.5

				arg_49_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_49_1.var_.characterEffect10058ui_story.fillRatio = var_52_5
			end

			local var_52_6 = arg_49_1.actors_["1084ui_story"]
			local var_52_7 = 0

			if var_52_7 < arg_49_1.time_ and arg_49_1.time_ <= var_52_7 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story == nil then
				arg_49_1.var_.characterEffect1084ui_story = var_52_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_8 = 0.200000002980232

			if var_52_7 <= arg_49_1.time_ and arg_49_1.time_ < var_52_7 + var_52_8 then
				local var_52_9 = (arg_49_1.time_ - var_52_7) / var_52_8

				if arg_49_1.var_.characterEffect1084ui_story then
					arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_7 + var_52_8 and arg_49_1.time_ < var_52_7 + var_52_8 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story then
				arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_52_10 = 0

			if var_52_10 < arg_49_1.time_ and arg_49_1.time_ <= var_52_10 + arg_52_0 then
				arg_49_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_52_11 = 0
			local var_52_12 = 0.6

			if var_52_11 < arg_49_1.time_ and arg_49_1.time_ <= var_52_11 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_13 = arg_49_1:FormatText(StoryNameCfg[6].name)

				arg_49_1.leftNameTxt_.text = var_52_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_14 = arg_49_1:GetWordFromCfg(319351012)
				local var_52_15 = arg_49_1:FormatText(var_52_14.content)

				arg_49_1.text_.text = var_52_15

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_16 = 24
				local var_52_17 = utf8.len(var_52_15)
				local var_52_18 = var_52_16 <= 0 and var_52_12 or var_52_12 * (var_52_17 / var_52_16)

				if var_52_18 > 0 and var_52_12 < var_52_18 then
					arg_49_1.talkMaxDuration = var_52_18

					if var_52_18 + var_52_11 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_18 + var_52_11
					end
				end

				arg_49_1.text_.text = var_52_15
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351012", "story_v_out_319351.awb") ~= 0 then
					local var_52_19 = manager.audio:GetVoiceLength("story_v_out_319351", "319351012", "story_v_out_319351.awb") / 1000

					if var_52_19 + var_52_11 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_19 + var_52_11
					end

					if var_52_14.prefab_name ~= "" and arg_49_1.actors_[var_52_14.prefab_name] ~= nil then
						local var_52_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_14.prefab_name].transform, "story_v_out_319351", "319351012", "story_v_out_319351.awb")

						arg_49_1:RecordAudio("319351012", var_52_20)
						arg_49_1:RecordAudio("319351012", var_52_20)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_319351", "319351012", "story_v_out_319351.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_319351", "319351012", "story_v_out_319351.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_21 = math.max(var_52_12, arg_49_1.talkMaxDuration)

			if var_52_11 <= arg_49_1.time_ and arg_49_1.time_ < var_52_11 + var_52_21 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_11) / var_52_21

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_11 + var_52_21 and arg_49_1.time_ < var_52_11 + var_52_21 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play319351013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 319351013
		arg_53_1.duration_ = 13.166

		local var_53_0 = {
			zh = 5.733,
			ja = 13.166
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
				arg_53_0:Play319351014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["10058ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect10058ui_story == nil then
				arg_53_1.var_.characterEffect10058ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.200000002980232

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect10058ui_story then
					arg_53_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect10058ui_story then
				arg_53_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_56_4 = arg_53_1.actors_["1084ui_story"]
			local var_56_5 = 0

			if var_56_5 < arg_53_1.time_ and arg_53_1.time_ <= var_56_5 + arg_56_0 and arg_53_1.var_.characterEffect1084ui_story == nil then
				arg_53_1.var_.characterEffect1084ui_story = var_56_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_6 = 0.200000002980232

			if var_56_5 <= arg_53_1.time_ and arg_53_1.time_ < var_56_5 + var_56_6 then
				local var_56_7 = (arg_53_1.time_ - var_56_5) / var_56_6

				if arg_53_1.var_.characterEffect1084ui_story then
					local var_56_8 = Mathf.Lerp(0, 0.5, var_56_7)

					arg_53_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1084ui_story.fillRatio = var_56_8
				end
			end

			if arg_53_1.time_ >= var_56_5 + var_56_6 and arg_53_1.time_ < var_56_5 + var_56_6 + arg_56_0 and arg_53_1.var_.characterEffect1084ui_story then
				local var_56_9 = 0.5

				arg_53_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1084ui_story.fillRatio = var_56_9
			end

			local var_56_10 = 0

			if var_56_10 < arg_53_1.time_ and arg_53_1.time_ <= var_56_10 + arg_56_0 then
				arg_53_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_56_11 = 0

			if var_56_11 < arg_53_1.time_ and arg_53_1.time_ <= var_56_11 + arg_56_0 then
				arg_53_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_56_12 = 0
			local var_56_13 = 0.675

			if var_56_12 < arg_53_1.time_ and arg_53_1.time_ <= var_56_12 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_14 = arg_53_1:FormatText(StoryNameCfg[471].name)

				arg_53_1.leftNameTxt_.text = var_56_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_15 = arg_53_1:GetWordFromCfg(319351013)
				local var_56_16 = arg_53_1:FormatText(var_56_15.content)

				arg_53_1.text_.text = var_56_16

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_17 = 27
				local var_56_18 = utf8.len(var_56_16)
				local var_56_19 = var_56_17 <= 0 and var_56_13 or var_56_13 * (var_56_18 / var_56_17)

				if var_56_19 > 0 and var_56_13 < var_56_19 then
					arg_53_1.talkMaxDuration = var_56_19

					if var_56_19 + var_56_12 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_19 + var_56_12
					end
				end

				arg_53_1.text_.text = var_56_16
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351013", "story_v_out_319351.awb") ~= 0 then
					local var_56_20 = manager.audio:GetVoiceLength("story_v_out_319351", "319351013", "story_v_out_319351.awb") / 1000

					if var_56_20 + var_56_12 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_20 + var_56_12
					end

					if var_56_15.prefab_name ~= "" and arg_53_1.actors_[var_56_15.prefab_name] ~= nil then
						local var_56_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_15.prefab_name].transform, "story_v_out_319351", "319351013", "story_v_out_319351.awb")

						arg_53_1:RecordAudio("319351013", var_56_21)
						arg_53_1:RecordAudio("319351013", var_56_21)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_319351", "319351013", "story_v_out_319351.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_319351", "319351013", "story_v_out_319351.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_22 = math.max(var_56_13, arg_53_1.talkMaxDuration)

			if var_56_12 <= arg_53_1.time_ and arg_53_1.time_ < var_56_12 + var_56_22 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_12) / var_56_22

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_12 + var_56_22 and arg_53_1.time_ < var_56_12 + var_56_22 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play319351014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 319351014
		arg_57_1.duration_ = 15.033

		local var_57_0 = {
			zh = 6.333,
			ja = 15.033
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
				arg_57_0:Play319351015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["10058ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos10058ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(0.7, -0.98, -6.1)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos10058ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = arg_57_1.actors_["10058ui_story"]
			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 and arg_57_1.var_.characterEffect10058ui_story == nil then
				arg_57_1.var_.characterEffect10058ui_story = var_60_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_11 = 0.200000002980232

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_11 then
				local var_60_12 = (arg_57_1.time_ - var_60_10) / var_60_11

				if arg_57_1.var_.characterEffect10058ui_story then
					arg_57_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_10 + var_60_11 and arg_57_1.time_ < var_60_10 + var_60_11 + arg_60_0 and arg_57_1.var_.characterEffect10058ui_story then
				arg_57_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_60_13 = 0
			local var_60_14 = 0.7

			if var_60_13 < arg_57_1.time_ and arg_57_1.time_ <= var_60_13 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_15 = arg_57_1:FormatText(StoryNameCfg[471].name)

				arg_57_1.leftNameTxt_.text = var_60_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_16 = arg_57_1:GetWordFromCfg(319351014)
				local var_60_17 = arg_57_1:FormatText(var_60_16.content)

				arg_57_1.text_.text = var_60_17

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_18 = 28
				local var_60_19 = utf8.len(var_60_17)
				local var_60_20 = var_60_18 <= 0 and var_60_14 or var_60_14 * (var_60_19 / var_60_18)

				if var_60_20 > 0 and var_60_14 < var_60_20 then
					arg_57_1.talkMaxDuration = var_60_20

					if var_60_20 + var_60_13 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_20 + var_60_13
					end
				end

				arg_57_1.text_.text = var_60_17
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351014", "story_v_out_319351.awb") ~= 0 then
					local var_60_21 = manager.audio:GetVoiceLength("story_v_out_319351", "319351014", "story_v_out_319351.awb") / 1000

					if var_60_21 + var_60_13 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_21 + var_60_13
					end

					if var_60_16.prefab_name ~= "" and arg_57_1.actors_[var_60_16.prefab_name] ~= nil then
						local var_60_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_16.prefab_name].transform, "story_v_out_319351", "319351014", "story_v_out_319351.awb")

						arg_57_1:RecordAudio("319351014", var_60_22)
						arg_57_1:RecordAudio("319351014", var_60_22)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_319351", "319351014", "story_v_out_319351.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_319351", "319351014", "story_v_out_319351.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_23 = math.max(var_60_14, arg_57_1.talkMaxDuration)

			if var_60_13 <= arg_57_1.time_ and arg_57_1.time_ < var_60_13 + var_60_23 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_13) / var_60_23

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_13 + var_60_23 and arg_57_1.time_ < var_60_13 + var_60_23 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play319351015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 319351015
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play319351016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["10058ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect10058ui_story == nil then
				arg_61_1.var_.characterEffect10058ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.200000002980232

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect10058ui_story then
					local var_64_4 = Mathf.Lerp(0, 0.5, var_64_3)

					arg_61_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_61_1.var_.characterEffect10058ui_story.fillRatio = var_64_4
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect10058ui_story then
				local var_64_5 = 0.5

				arg_61_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_61_1.var_.characterEffect10058ui_story.fillRatio = var_64_5
			end

			local var_64_6 = 0
			local var_64_7 = 1

			if var_64_6 < arg_61_1.time_ and arg_61_1.time_ <= var_64_6 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, false)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_8 = arg_61_1:GetWordFromCfg(319351015)
				local var_64_9 = arg_61_1:FormatText(var_64_8.content)

				arg_61_1.text_.text = var_64_9

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_10 = 40
				local var_64_11 = utf8.len(var_64_9)
				local var_64_12 = var_64_10 <= 0 and var_64_7 or var_64_7 * (var_64_11 / var_64_10)

				if var_64_12 > 0 and var_64_7 < var_64_12 then
					arg_61_1.talkMaxDuration = var_64_12

					if var_64_12 + var_64_6 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_12 + var_64_6
					end
				end

				arg_61_1.text_.text = var_64_9
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_13 = math.max(var_64_7, arg_61_1.talkMaxDuration)

			if var_64_6 <= arg_61_1.time_ and arg_61_1.time_ < var_64_6 + var_64_13 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_6) / var_64_13

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_6 + var_64_13 and arg_61_1.time_ < var_64_6 + var_64_13 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play319351016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319351016
		arg_65_1.duration_ = 5.63333333333333

		local var_65_0 = {
			zh = 5.39933333333333,
			ja = 5.63333333333333
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
				arg_65_0:Play319351017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = arg_65_1.actors_["10058ui_story"]
			local var_68_1 = 0

			if var_68_1 < arg_65_1.time_ and arg_65_1.time_ <= var_68_1 + arg_68_0 and arg_65_1.var_.characterEffect10058ui_story == nil then
				arg_65_1.var_.characterEffect10058ui_story = var_68_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_68_2 = 0.200000002980232

			if var_68_1 <= arg_65_1.time_ and arg_65_1.time_ < var_68_1 + var_68_2 then
				local var_68_3 = (arg_65_1.time_ - var_68_1) / var_68_2

				if arg_65_1.var_.characterEffect10058ui_story then
					arg_65_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_65_1.time_ >= var_68_1 + var_68_2 and arg_65_1.time_ < var_68_1 + var_68_2 + arg_68_0 and arg_65_1.var_.characterEffect10058ui_story then
				arg_65_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_68_4 = 1.36666666666667

			if var_68_4 < arg_65_1.time_ and arg_65_1.time_ <= var_68_4 + arg_68_0 then
				local var_68_5 = manager.ui.mainCamera.transform.localPosition
				local var_68_6 = Vector3.New(0, 0, 10) + Vector3.New(var_68_5.x, var_68_5.y, 0)
				local var_68_7 = arg_65_1.bgs_.STblack

				var_68_7.transform.localPosition = var_68_6
				var_68_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_68_8 = var_68_7:GetComponent("SpriteRenderer")

				if var_68_8 and var_68_8.sprite then
					local var_68_9 = (var_68_7.transform.localPosition - var_68_5).z
					local var_68_10 = manager.ui.mainCameraCom_
					local var_68_11 = 2 * var_68_9 * Mathf.Tan(var_68_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_68_12 = var_68_11 * var_68_10.aspect
					local var_68_13 = var_68_8.sprite.bounds.size.x
					local var_68_14 = var_68_8.sprite.bounds.size.y
					local var_68_15 = var_68_12 / var_68_13
					local var_68_16 = var_68_11 / var_68_14
					local var_68_17 = var_68_16 < var_68_15 and var_68_15 or var_68_16

					var_68_7.transform.localScale = Vector3.New(var_68_17, var_68_17, 0)
				end

				for iter_68_0, iter_68_1 in pairs(arg_65_1.bgs_) do
					if iter_68_0 ~= "STblack" then
						iter_68_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_68_18 = 0

			if var_68_18 < arg_65_1.time_ and arg_65_1.time_ <= var_68_18 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_19 = 1.36666666666667

			if var_68_18 <= arg_65_1.time_ and arg_65_1.time_ < var_68_18 + var_68_19 then
				local var_68_20 = (arg_65_1.time_ - var_68_18) / var_68_19
				local var_68_21 = Color.New(0, 0, 0)

				var_68_21.a = Mathf.Lerp(0, 1, var_68_20)
				arg_65_1.mask_.color = var_68_21
			end

			if arg_65_1.time_ >= var_68_18 + var_68_19 and arg_65_1.time_ < var_68_18 + var_68_19 + arg_68_0 then
				local var_68_22 = Color.New(0, 0, 0)

				var_68_22.a = 1
				arg_65_1.mask_.color = var_68_22
			end

			local var_68_23 = 1.36666666666667

			if var_68_23 < arg_65_1.time_ and arg_65_1.time_ <= var_68_23 + arg_68_0 then
				arg_65_1.mask_.enabled = true
				arg_65_1.mask_.raycastTarget = true

				arg_65_1:SetGaussion(false)
			end

			local var_68_24 = 2

			if var_68_23 <= arg_65_1.time_ and arg_65_1.time_ < var_68_23 + var_68_24 then
				local var_68_25 = (arg_65_1.time_ - var_68_23) / var_68_24
				local var_68_26 = Color.New(0, 0, 0)

				var_68_26.a = Mathf.Lerp(1, 0, var_68_25)
				arg_65_1.mask_.color = var_68_26
			end

			if arg_65_1.time_ >= var_68_23 + var_68_24 and arg_65_1.time_ < var_68_23 + var_68_24 + arg_68_0 then
				local var_68_27 = Color.New(0, 0, 0)
				local var_68_28 = 0

				arg_65_1.mask_.enabled = false
				var_68_27.a = var_68_28
				arg_65_1.mask_.color = var_68_27
			end

			local var_68_29 = arg_65_1.actors_["10058ui_story"].transform
			local var_68_30 = 1.36666666666667

			if var_68_30 < arg_65_1.time_ and arg_65_1.time_ <= var_68_30 + arg_68_0 then
				arg_65_1.var_.moveOldPos10058ui_story = var_68_29.localPosition
			end

			local var_68_31 = 0.001

			if var_68_30 <= arg_65_1.time_ and arg_65_1.time_ < var_68_30 + var_68_31 then
				local var_68_32 = (arg_65_1.time_ - var_68_30) / var_68_31
				local var_68_33 = Vector3.New(0, 100, 0)

				var_68_29.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos10058ui_story, var_68_33, var_68_32)

				local var_68_34 = manager.ui.mainCamera.transform.position - var_68_29.position

				var_68_29.forward = Vector3.New(var_68_34.x, var_68_34.y, var_68_34.z)

				local var_68_35 = var_68_29.localEulerAngles

				var_68_35.z = 0
				var_68_35.x = 0
				var_68_29.localEulerAngles = var_68_35
			end

			if arg_65_1.time_ >= var_68_30 + var_68_31 and arg_65_1.time_ < var_68_30 + var_68_31 + arg_68_0 then
				var_68_29.localPosition = Vector3.New(0, 100, 0)

				local var_68_36 = manager.ui.mainCamera.transform.position - var_68_29.position

				var_68_29.forward = Vector3.New(var_68_36.x, var_68_36.y, var_68_36.z)

				local var_68_37 = var_68_29.localEulerAngles

				var_68_37.z = 0
				var_68_37.x = 0
				var_68_29.localEulerAngles = var_68_37
			end

			local var_68_38 = arg_65_1.actors_["1084ui_story"].transform
			local var_68_39 = 1.36666666666667

			if var_68_39 < arg_65_1.time_ and arg_65_1.time_ <= var_68_39 + arg_68_0 then
				arg_65_1.var_.moveOldPos1084ui_story = var_68_38.localPosition
			end

			local var_68_40 = 0.001

			if var_68_39 <= arg_65_1.time_ and arg_65_1.time_ < var_68_39 + var_68_40 then
				local var_68_41 = (arg_65_1.time_ - var_68_39) / var_68_40
				local var_68_42 = Vector3.New(0, 100, 0)

				var_68_38.localPosition = Vector3.Lerp(arg_65_1.var_.moveOldPos1084ui_story, var_68_42, var_68_41)

				local var_68_43 = manager.ui.mainCamera.transform.position - var_68_38.position

				var_68_38.forward = Vector3.New(var_68_43.x, var_68_43.y, var_68_43.z)

				local var_68_44 = var_68_38.localEulerAngles

				var_68_44.z = 0
				var_68_44.x = 0
				var_68_38.localEulerAngles = var_68_44
			end

			if arg_65_1.time_ >= var_68_39 + var_68_40 and arg_65_1.time_ < var_68_39 + var_68_40 + arg_68_0 then
				var_68_38.localPosition = Vector3.New(0, 100, 0)

				local var_68_45 = manager.ui.mainCamera.transform.position - var_68_38.position

				var_68_38.forward = Vector3.New(var_68_45.x, var_68_45.y, var_68_45.z)

				local var_68_46 = var_68_38.localEulerAngles

				var_68_46.z = 0
				var_68_46.x = 0
				var_68_38.localEulerAngles = var_68_46
			end

			if arg_65_1.frameCnt_ <= 1 then
				arg_65_1.dialog_:SetActive(false)
			end

			local var_68_47 = 2.43333333333333
			local var_68_48 = 0.25

			if var_68_47 < arg_65_1.time_ and arg_65_1.time_ <= var_68_47 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0

				arg_65_1.dialog_:SetActive(true)

				local var_68_49 = LeanTween.value(arg_65_1.dialog_, 0, 1, 0.3)

				var_68_49:setOnUpdate(LuaHelper.FloatAction(function(arg_69_0)
					arg_65_1.dialogCg_.alpha = arg_69_0
				end))
				var_68_49:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_65_1.dialog_)
					var_68_49:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_65_1.duration_ = arg_65_1.duration_ + 0.3

				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_50 = arg_65_1:FormatText(StoryNameCfg[471].name)

				arg_65_1.leftNameTxt_.text = var_68_50

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, true)
				arg_65_1.iconController_:SetSelectedState("hero")

				arg_65_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10058")

				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_51 = arg_65_1:GetWordFromCfg(319351016)
				local var_68_52 = arg_65_1:FormatText(var_68_51.content)

				arg_65_1.text_.text = var_68_52

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_53 = 10
				local var_68_54 = utf8.len(var_68_52)
				local var_68_55 = var_68_53 <= 0 and var_68_48 or var_68_48 * (var_68_54 / var_68_53)

				if var_68_55 > 0 and var_68_48 < var_68_55 then
					arg_65_1.talkMaxDuration = var_68_55
					var_68_47 = var_68_47 + 0.3

					if var_68_55 + var_68_47 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_55 + var_68_47
					end
				end

				arg_65_1.text_.text = var_68_52
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351016", "story_v_out_319351.awb") ~= 0 then
					local var_68_56 = manager.audio:GetVoiceLength("story_v_out_319351", "319351016", "story_v_out_319351.awb") / 1000

					if var_68_56 + var_68_47 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_56 + var_68_47
					end

					if var_68_51.prefab_name ~= "" and arg_65_1.actors_[var_68_51.prefab_name] ~= nil then
						local var_68_57 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_51.prefab_name].transform, "story_v_out_319351", "319351016", "story_v_out_319351.awb")

						arg_65_1:RecordAudio("319351016", var_68_57)
						arg_65_1:RecordAudio("319351016", var_68_57)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_319351", "319351016", "story_v_out_319351.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_319351", "319351016", "story_v_out_319351.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_58 = var_68_47 + 0.3
			local var_68_59 = math.max(var_68_48, arg_65_1.talkMaxDuration)

			if var_68_58 <= arg_65_1.time_ and arg_65_1.time_ < var_68_58 + var_68_59 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_58) / var_68_59

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_58 + var_68_59 and arg_65_1.time_ < var_68_58 + var_68_59 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play319351017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 319351017
		arg_71_1.duration_ = 11.1

		local var_71_0 = {
			zh = 8,
			ja = 11.1
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
				arg_71_0:Play319351018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.6

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[696].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, true)
				arg_71_1.iconController_:SetSelectedState("hero")

				arg_71_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(319351017)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351017", "story_v_out_319351.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_319351", "319351017", "story_v_out_319351.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_319351", "319351017", "story_v_out_319351.awb")

						arg_71_1:RecordAudio("319351017", var_74_9)
						arg_71_1:RecordAudio("319351017", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_319351", "319351017", "story_v_out_319351.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_319351", "319351017", "story_v_out_319351.awb")
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
	Play319351018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 319351018
		arg_75_1.duration_ = 3.133

		local var_75_0 = {
			zh = 3.033,
			ja = 3.133
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
				arg_75_0:Play319351019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10058ui_story"]
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 and arg_75_1.var_.characterEffect10058ui_story == nil then
				arg_75_1.var_.characterEffect10058ui_story = var_78_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_2 = 0.200000002980232

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2

				if arg_75_1.var_.characterEffect10058ui_story then
					arg_75_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 and arg_75_1.var_.characterEffect10058ui_story then
				arg_75_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_78_4 = arg_75_1.actors_["1084ui_story"]
			local var_78_5 = 0

			if var_78_5 < arg_75_1.time_ and arg_75_1.time_ <= var_78_5 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story == nil then
				arg_75_1.var_.characterEffect1084ui_story = var_78_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_78_6 = 0.200000002980232

			if var_78_5 <= arg_75_1.time_ and arg_75_1.time_ < var_78_5 + var_78_6 then
				local var_78_7 = (arg_75_1.time_ - var_78_5) / var_78_6

				if arg_75_1.var_.characterEffect1084ui_story then
					local var_78_8 = Mathf.Lerp(0, 0.5, var_78_7)

					arg_75_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_75_1.var_.characterEffect1084ui_story.fillRatio = var_78_8
				end
			end

			if arg_75_1.time_ >= var_78_5 + var_78_6 and arg_75_1.time_ < var_78_5 + var_78_6 + arg_78_0 and arg_75_1.var_.characterEffect1084ui_story then
				local var_78_9 = 0.5

				arg_75_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_75_1.var_.characterEffect1084ui_story.fillRatio = var_78_9
			end

			local var_78_10 = 0
			local var_78_11 = 0.25

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_12 = arg_75_1:FormatText(StoryNameCfg[471].name)

				arg_75_1.leftNameTxt_.text = var_78_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, true)
				arg_75_1.iconController_:SetSelectedState("hero")

				arg_75_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10058")

				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_13 = arg_75_1:GetWordFromCfg(319351018)
				local var_78_14 = arg_75_1:FormatText(var_78_13.content)

				arg_75_1.text_.text = var_78_14

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_15 = 10
				local var_78_16 = utf8.len(var_78_14)
				local var_78_17 = var_78_15 <= 0 and var_78_11 or var_78_11 * (var_78_16 / var_78_15)

				if var_78_17 > 0 and var_78_11 < var_78_17 then
					arg_75_1.talkMaxDuration = var_78_17

					if var_78_17 + var_78_10 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_17 + var_78_10
					end
				end

				arg_75_1.text_.text = var_78_14
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351018", "story_v_out_319351.awb") ~= 0 then
					local var_78_18 = manager.audio:GetVoiceLength("story_v_out_319351", "319351018", "story_v_out_319351.awb") / 1000

					if var_78_18 + var_78_10 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_18 + var_78_10
					end

					if var_78_13.prefab_name ~= "" and arg_75_1.actors_[var_78_13.prefab_name] ~= nil then
						local var_78_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_13.prefab_name].transform, "story_v_out_319351", "319351018", "story_v_out_319351.awb")

						arg_75_1:RecordAudio("319351018", var_78_19)
						arg_75_1:RecordAudio("319351018", var_78_19)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_319351", "319351018", "story_v_out_319351.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_319351", "319351018", "story_v_out_319351.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_20 = math.max(var_78_11, arg_75_1.talkMaxDuration)

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_20 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_10) / var_78_20

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_10 + var_78_20 and arg_75_1.time_ < var_78_10 + var_78_20 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play319351019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319351019
		arg_79_1.duration_ = 9.233

		local var_79_0 = {
			zh = 6.1,
			ja = 9.233
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
				arg_79_0:Play319351020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.575

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_2 = arg_79_1:FormatText(StoryNameCfg[471].name)

				arg_79_1.leftNameTxt_.text = var_82_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, true)
				arg_79_1.iconController_:SetSelectedState("hero")

				arg_79_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10058")

				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_3 = arg_79_1:GetWordFromCfg(319351019)
				local var_82_4 = arg_79_1:FormatText(var_82_3.content)

				arg_79_1.text_.text = var_82_4

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351019", "story_v_out_319351.awb") ~= 0 then
					local var_82_8 = manager.audio:GetVoiceLength("story_v_out_319351", "319351019", "story_v_out_319351.awb") / 1000

					if var_82_8 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_8 + var_82_0
					end

					if var_82_3.prefab_name ~= "" and arg_79_1.actors_[var_82_3.prefab_name] ~= nil then
						local var_82_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_3.prefab_name].transform, "story_v_out_319351", "319351019", "story_v_out_319351.awb")

						arg_79_1:RecordAudio("319351019", var_82_9)
						arg_79_1:RecordAudio("319351019", var_82_9)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_319351", "319351019", "story_v_out_319351.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_319351", "319351019", "story_v_out_319351.awb")
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
	Play319351020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319351020
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play319351021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 1

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				local var_86_2 = "stop"
				local var_86_3 = "effect"

				arg_83_1:AudioAction(var_86_2, var_86_3, "se_story_130", "se_story_130_didi", "")
			end

			local var_86_4 = arg_83_1.actors_["10058ui_story"]
			local var_86_5 = 0

			if var_86_5 < arg_83_1.time_ and arg_83_1.time_ <= var_86_5 + arg_86_0 and arg_83_1.var_.characterEffect10058ui_story == nil then
				arg_83_1.var_.characterEffect10058ui_story = var_86_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_6 = 0.200000002980232

			if var_86_5 <= arg_83_1.time_ and arg_83_1.time_ < var_86_5 + var_86_6 then
				local var_86_7 = (arg_83_1.time_ - var_86_5) / var_86_6

				if arg_83_1.var_.characterEffect10058ui_story then
					local var_86_8 = Mathf.Lerp(0, 0.5, var_86_7)

					arg_83_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_83_1.var_.characterEffect10058ui_story.fillRatio = var_86_8
				end
			end

			if arg_83_1.time_ >= var_86_5 + var_86_6 and arg_83_1.time_ < var_86_5 + var_86_6 + arg_86_0 and arg_83_1.var_.characterEffect10058ui_story then
				local var_86_9 = 0.5

				arg_83_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_83_1.var_.characterEffect10058ui_story.fillRatio = var_86_9
			end

			local var_86_10 = 0
			local var_86_11 = 0.875

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_12 = arg_83_1:GetWordFromCfg(319351020)
				local var_86_13 = arg_83_1:FormatText(var_86_12.content)

				arg_83_1.text_.text = var_86_13

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_14 = 35
				local var_86_15 = utf8.len(var_86_13)
				local var_86_16 = var_86_14 <= 0 and var_86_11 or var_86_11 * (var_86_15 / var_86_14)

				if var_86_16 > 0 and var_86_11 < var_86_16 then
					arg_83_1.talkMaxDuration = var_86_16

					if var_86_16 + var_86_10 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_16 + var_86_10
					end
				end

				arg_83_1.text_.text = var_86_13
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_17 = math.max(var_86_11, arg_83_1.talkMaxDuration)

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_17 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_10) / var_86_17

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_10 + var_86_17 and arg_83_1.time_ < var_86_10 + var_86_17 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play319351021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319351021
		arg_87_1.duration_ = 13.1666666666667

		local var_87_0 = {
			zh = 10.4666666666667,
			ja = 13.1666666666667
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
				arg_87_0:Play319351022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10058ui_story"]
			local var_90_1 = 3

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect10058ui_story == nil then
				arg_87_1.var_.characterEffect10058ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect10058ui_story then
					arg_87_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect10058ui_story then
				arg_87_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_90_4 = 3

			if var_90_4 < arg_87_1.time_ and arg_87_1.time_ <= var_90_4 + arg_90_0 then
				arg_87_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_5 = 3

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 then
				arg_87_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_90_6 = arg_87_1.actors_["10058ui_story"].transform
			local var_90_7 = 3

			if var_90_7 < arg_87_1.time_ and arg_87_1.time_ <= var_90_7 + arg_90_0 then
				arg_87_1.var_.moveOldPos10058ui_story = var_90_6.localPosition
			end

			local var_90_8 = 0.001

			if var_90_7 <= arg_87_1.time_ and arg_87_1.time_ < var_90_7 + var_90_8 then
				local var_90_9 = (arg_87_1.time_ - var_90_7) / var_90_8
				local var_90_10 = Vector3.New(0, -0.98, -6.1)

				var_90_6.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10058ui_story, var_90_10, var_90_9)

				local var_90_11 = manager.ui.mainCamera.transform.position - var_90_6.position

				var_90_6.forward = Vector3.New(var_90_11.x, var_90_11.y, var_90_11.z)

				local var_90_12 = var_90_6.localEulerAngles

				var_90_12.z = 0
				var_90_12.x = 0
				var_90_6.localEulerAngles = var_90_12
			end

			if arg_87_1.time_ >= var_90_7 + var_90_8 and arg_87_1.time_ < var_90_7 + var_90_8 + arg_90_0 then
				var_90_6.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_90_13 = manager.ui.mainCamera.transform.position - var_90_6.position

				var_90_6.forward = Vector3.New(var_90_13.x, var_90_13.y, var_90_13.z)

				local var_90_14 = var_90_6.localEulerAngles

				var_90_14.z = 0
				var_90_14.x = 0
				var_90_6.localEulerAngles = var_90_14
			end

			local var_90_15 = 1

			if var_90_15 < arg_87_1.time_ and arg_87_1.time_ <= var_90_15 + arg_90_0 then
				local var_90_16 = manager.ui.mainCamera.transform.localPosition
				local var_90_17 = Vector3.New(0, 0, 10) + Vector3.New(var_90_16.x, var_90_16.y, 0)
				local var_90_18 = arg_87_1.bgs_.ST74

				var_90_18.transform.localPosition = var_90_17
				var_90_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_90_19 = var_90_18:GetComponent("SpriteRenderer")

				if var_90_19 and var_90_19.sprite then
					local var_90_20 = (var_90_18.transform.localPosition - var_90_16).z
					local var_90_21 = manager.ui.mainCameraCom_
					local var_90_22 = 2 * var_90_20 * Mathf.Tan(var_90_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_90_23 = var_90_22 * var_90_21.aspect
					local var_90_24 = var_90_19.sprite.bounds.size.x
					local var_90_25 = var_90_19.sprite.bounds.size.y
					local var_90_26 = var_90_23 / var_90_24
					local var_90_27 = var_90_22 / var_90_25
					local var_90_28 = var_90_27 < var_90_26 and var_90_26 or var_90_27

					var_90_18.transform.localScale = Vector3.New(var_90_28, var_90_28, 0)
				end

				for iter_90_0, iter_90_1 in pairs(arg_87_1.bgs_) do
					if iter_90_0 ~= "ST74" then
						iter_90_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_90_29 = 0

			if var_90_29 < arg_87_1.time_ and arg_87_1.time_ <= var_90_29 + arg_90_0 then
				arg_87_1.mask_.enabled = true
				arg_87_1.mask_.raycastTarget = true

				arg_87_1:SetGaussion(false)
			end

			local var_90_30 = 1

			if var_90_29 <= arg_87_1.time_ and arg_87_1.time_ < var_90_29 + var_90_30 then
				local var_90_31 = (arg_87_1.time_ - var_90_29) / var_90_30
				local var_90_32 = Color.New(0, 0, 0)

				var_90_32.a = Mathf.Lerp(0, 1, var_90_31)
				arg_87_1.mask_.color = var_90_32
			end

			if arg_87_1.time_ >= var_90_29 + var_90_30 and arg_87_1.time_ < var_90_29 + var_90_30 + arg_90_0 then
				local var_90_33 = Color.New(0, 0, 0)

				var_90_33.a = 1
				arg_87_1.mask_.color = var_90_33
			end

			local var_90_34 = 1

			if var_90_34 < arg_87_1.time_ and arg_87_1.time_ <= var_90_34 + arg_90_0 then
				arg_87_1.mask_.enabled = true
				arg_87_1.mask_.raycastTarget = true

				arg_87_1:SetGaussion(false)
			end

			local var_90_35 = 2

			if var_90_34 <= arg_87_1.time_ and arg_87_1.time_ < var_90_34 + var_90_35 then
				local var_90_36 = (arg_87_1.time_ - var_90_34) / var_90_35
				local var_90_37 = Color.New(0, 0, 0)

				var_90_37.a = Mathf.Lerp(1, 0, var_90_36)
				arg_87_1.mask_.color = var_90_37
			end

			if arg_87_1.time_ >= var_90_34 + var_90_35 and arg_87_1.time_ < var_90_34 + var_90_35 + arg_90_0 then
				local var_90_38 = Color.New(0, 0, 0)
				local var_90_39 = 0

				arg_87_1.mask_.enabled = false
				var_90_38.a = var_90_39
				arg_87_1.mask_.color = var_90_38
			end

			local var_90_40 = 2.66666666666667
			local var_90_41 = 0.925

			if var_90_40 < arg_87_1.time_ and arg_87_1.time_ <= var_90_40 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_42 = arg_87_1:FormatText(StoryNameCfg[471].name)

				arg_87_1.leftNameTxt_.text = var_90_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_43 = arg_87_1:GetWordFromCfg(319351021)
				local var_90_44 = arg_87_1:FormatText(var_90_43.content)

				arg_87_1.text_.text = var_90_44

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_45 = 37
				local var_90_46 = utf8.len(var_90_44)
				local var_90_47 = var_90_45 <= 0 and var_90_41 or var_90_41 * (var_90_46 / var_90_45)

				if var_90_47 > 0 and var_90_41 < var_90_47 then
					arg_87_1.talkMaxDuration = var_90_47

					if var_90_47 + var_90_40 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_47 + var_90_40
					end
				end

				arg_87_1.text_.text = var_90_44
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351021", "story_v_out_319351.awb") ~= 0 then
					local var_90_48 = manager.audio:GetVoiceLength("story_v_out_319351", "319351021", "story_v_out_319351.awb") / 1000

					if var_90_48 + var_90_40 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_48 + var_90_40
					end

					if var_90_43.prefab_name ~= "" and arg_87_1.actors_[var_90_43.prefab_name] ~= nil then
						local var_90_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_43.prefab_name].transform, "story_v_out_319351", "319351021", "story_v_out_319351.awb")

						arg_87_1:RecordAudio("319351021", var_90_49)
						arg_87_1:RecordAudio("319351021", var_90_49)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319351", "319351021", "story_v_out_319351.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319351", "319351021", "story_v_out_319351.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_50 = math.max(var_90_41, arg_87_1.talkMaxDuration)

			if var_90_40 <= arg_87_1.time_ and arg_87_1.time_ < var_90_40 + var_90_50 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_40) / var_90_50

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_40 + var_90_50 and arg_87_1.time_ < var_90_40 + var_90_50 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319351022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319351022
		arg_91_1.duration_ = 13.8

		local var_91_0 = {
			zh = 11.1,
			ja = 13.8
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
				arg_91_0:Play319351023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 1.3

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[471].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(319351022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351022", "story_v_out_319351.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_319351", "319351022", "story_v_out_319351.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_319351", "319351022", "story_v_out_319351.awb")

						arg_91_1:RecordAudio("319351022", var_94_9)
						arg_91_1:RecordAudio("319351022", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319351", "319351022", "story_v_out_319351.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319351", "319351022", "story_v_out_319351.awb")
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
	Play319351023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319351023
		arg_95_1.duration_ = 9.466

		local var_95_0 = {
			zh = 2.433,
			ja = 9.466
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
				arg_95_0:Play319351024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10058ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect10058ui_story == nil then
				arg_95_1.var_.characterEffect10058ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect10058ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10058ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect10058ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10058ui_story.fillRatio = var_98_5
			end

			local var_98_6 = arg_95_1.actors_["1084ui_story"].transform
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 then
				arg_95_1.var_.moveOldPos1084ui_story = var_98_6.localPosition

				local var_98_8 = "1084ui_story"

				arg_95_1:ShowWeapon(arg_95_1.var_[var_98_8 .. "Animator"].transform, false)
			end

			local var_98_9 = 0.001

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_9 then
				local var_98_10 = (arg_95_1.time_ - var_98_7) / var_98_9
				local var_98_11 = Vector3.New(-0.7, -0.97, -6)

				var_98_6.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1084ui_story, var_98_11, var_98_10)

				local var_98_12 = manager.ui.mainCamera.transform.position - var_98_6.position

				var_98_6.forward = Vector3.New(var_98_12.x, var_98_12.y, var_98_12.z)

				local var_98_13 = var_98_6.localEulerAngles

				var_98_13.z = 0
				var_98_13.x = 0
				var_98_6.localEulerAngles = var_98_13
			end

			if arg_95_1.time_ >= var_98_7 + var_98_9 and arg_95_1.time_ < var_98_7 + var_98_9 + arg_98_0 then
				var_98_6.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_98_14 = manager.ui.mainCamera.transform.position - var_98_6.position

				var_98_6.forward = Vector3.New(var_98_14.x, var_98_14.y, var_98_14.z)

				local var_98_15 = var_98_6.localEulerAngles

				var_98_15.z = 0
				var_98_15.x = 0
				var_98_6.localEulerAngles = var_98_15
			end

			local var_98_16 = arg_95_1.actors_["1084ui_story"]
			local var_98_17 = 0

			if var_98_17 < arg_95_1.time_ and arg_95_1.time_ <= var_98_17 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story == nil then
				arg_95_1.var_.characterEffect1084ui_story = var_98_16:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_18 = 0.200000002980232

			if var_98_17 <= arg_95_1.time_ and arg_95_1.time_ < var_98_17 + var_98_18 then
				local var_98_19 = (arg_95_1.time_ - var_98_17) / var_98_18

				if arg_95_1.var_.characterEffect1084ui_story then
					arg_95_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_17 + var_98_18 and arg_95_1.time_ < var_98_17 + var_98_18 + arg_98_0 and arg_95_1.var_.characterEffect1084ui_story then
				arg_95_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_98_20 = 0

			if var_98_20 < arg_95_1.time_ and arg_95_1.time_ <= var_98_20 + arg_98_0 then
				arg_95_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_98_21 = 0

			if var_98_21 < arg_95_1.time_ and arg_95_1.time_ <= var_98_21 + arg_98_0 then
				arg_95_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_98_22 = arg_95_1.actors_["10058ui_story"].transform
			local var_98_23 = 0

			if var_98_23 < arg_95_1.time_ and arg_95_1.time_ <= var_98_23 + arg_98_0 then
				arg_95_1.var_.moveOldPos10058ui_story = var_98_22.localPosition
			end

			local var_98_24 = 0.001

			if var_98_23 <= arg_95_1.time_ and arg_95_1.time_ < var_98_23 + var_98_24 then
				local var_98_25 = (arg_95_1.time_ - var_98_23) / var_98_24
				local var_98_26 = Vector3.New(0.7, -0.98, -6.1)

				var_98_22.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10058ui_story, var_98_26, var_98_25)

				local var_98_27 = manager.ui.mainCamera.transform.position - var_98_22.position

				var_98_22.forward = Vector3.New(var_98_27.x, var_98_27.y, var_98_27.z)

				local var_98_28 = var_98_22.localEulerAngles

				var_98_28.z = 0
				var_98_28.x = 0
				var_98_22.localEulerAngles = var_98_28
			end

			if arg_95_1.time_ >= var_98_23 + var_98_24 and arg_95_1.time_ < var_98_23 + var_98_24 + arg_98_0 then
				var_98_22.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_98_29 = manager.ui.mainCamera.transform.position - var_98_22.position

				var_98_22.forward = Vector3.New(var_98_29.x, var_98_29.y, var_98_29.z)

				local var_98_30 = var_98_22.localEulerAngles

				var_98_30.z = 0
				var_98_30.x = 0
				var_98_22.localEulerAngles = var_98_30
			end

			local var_98_31 = 0
			local var_98_32 = 0.225

			if var_98_31 < arg_95_1.time_ and arg_95_1.time_ <= var_98_31 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_33 = arg_95_1:FormatText(StoryNameCfg[6].name)

				arg_95_1.leftNameTxt_.text = var_98_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_34 = arg_95_1:GetWordFromCfg(319351023)
				local var_98_35 = arg_95_1:FormatText(var_98_34.content)

				arg_95_1.text_.text = var_98_35

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_36 = 9
				local var_98_37 = utf8.len(var_98_35)
				local var_98_38 = var_98_36 <= 0 and var_98_32 or var_98_32 * (var_98_37 / var_98_36)

				if var_98_38 > 0 and var_98_32 < var_98_38 then
					arg_95_1.talkMaxDuration = var_98_38

					if var_98_38 + var_98_31 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_38 + var_98_31
					end
				end

				arg_95_1.text_.text = var_98_35
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351023", "story_v_out_319351.awb") ~= 0 then
					local var_98_39 = manager.audio:GetVoiceLength("story_v_out_319351", "319351023", "story_v_out_319351.awb") / 1000

					if var_98_39 + var_98_31 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_39 + var_98_31
					end

					if var_98_34.prefab_name ~= "" and arg_95_1.actors_[var_98_34.prefab_name] ~= nil then
						local var_98_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_34.prefab_name].transform, "story_v_out_319351", "319351023", "story_v_out_319351.awb")

						arg_95_1:RecordAudio("319351023", var_98_40)
						arg_95_1:RecordAudio("319351023", var_98_40)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_319351", "319351023", "story_v_out_319351.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_319351", "319351023", "story_v_out_319351.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_41 = math.max(var_98_32, arg_95_1.talkMaxDuration)

			if var_98_31 <= arg_95_1.time_ and arg_95_1.time_ < var_98_31 + var_98_41 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_31) / var_98_41

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_31 + var_98_41 and arg_95_1.time_ < var_98_31 + var_98_41 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319351024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319351024
		arg_99_1.duration_ = 11.733

		local var_99_0 = {
			zh = 8.766,
			ja = 11.733
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
				arg_99_0:Play319351025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10058ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect10058ui_story == nil then
				arg_99_1.var_.characterEffect10058ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect10058ui_story then
					arg_99_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect10058ui_story then
				arg_99_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_102_4 = arg_99_1.actors_["1084ui_story"]
			local var_102_5 = 0

			if var_102_5 < arg_99_1.time_ and arg_99_1.time_ <= var_102_5 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story == nil then
				arg_99_1.var_.characterEffect1084ui_story = var_102_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_6 = 0.200000002980232

			if var_102_5 <= arg_99_1.time_ and arg_99_1.time_ < var_102_5 + var_102_6 then
				local var_102_7 = (arg_99_1.time_ - var_102_5) / var_102_6

				if arg_99_1.var_.characterEffect1084ui_story then
					local var_102_8 = Mathf.Lerp(0, 0.5, var_102_7)

					arg_99_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1084ui_story.fillRatio = var_102_8
				end
			end

			if arg_99_1.time_ >= var_102_5 + var_102_6 and arg_99_1.time_ < var_102_5 + var_102_6 + arg_102_0 and arg_99_1.var_.characterEffect1084ui_story then
				local var_102_9 = 0.5

				arg_99_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1084ui_story.fillRatio = var_102_9
			end

			local var_102_10 = 0

			if var_102_10 < arg_99_1.time_ and arg_99_1.time_ <= var_102_10 + arg_102_0 then
				arg_99_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_102_11 = 0

			if var_102_11 < arg_99_1.time_ and arg_99_1.time_ <= var_102_11 + arg_102_0 then
				arg_99_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_1")
			end

			local var_102_12 = 0
			local var_102_13 = 0.825

			if var_102_12 < arg_99_1.time_ and arg_99_1.time_ <= var_102_12 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_14 = arg_99_1:FormatText(StoryNameCfg[471].name)

				arg_99_1.leftNameTxt_.text = var_102_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_15 = arg_99_1:GetWordFromCfg(319351024)
				local var_102_16 = arg_99_1:FormatText(var_102_15.content)

				arg_99_1.text_.text = var_102_16

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_17 = 33
				local var_102_18 = utf8.len(var_102_16)
				local var_102_19 = var_102_17 <= 0 and var_102_13 or var_102_13 * (var_102_18 / var_102_17)

				if var_102_19 > 0 and var_102_13 < var_102_19 then
					arg_99_1.talkMaxDuration = var_102_19

					if var_102_19 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_19 + var_102_12
					end
				end

				arg_99_1.text_.text = var_102_16
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351024", "story_v_out_319351.awb") ~= 0 then
					local var_102_20 = manager.audio:GetVoiceLength("story_v_out_319351", "319351024", "story_v_out_319351.awb") / 1000

					if var_102_20 + var_102_12 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_20 + var_102_12
					end

					if var_102_15.prefab_name ~= "" and arg_99_1.actors_[var_102_15.prefab_name] ~= nil then
						local var_102_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_15.prefab_name].transform, "story_v_out_319351", "319351024", "story_v_out_319351.awb")

						arg_99_1:RecordAudio("319351024", var_102_21)
						arg_99_1:RecordAudio("319351024", var_102_21)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_319351", "319351024", "story_v_out_319351.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_319351", "319351024", "story_v_out_319351.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_22 = math.max(var_102_13, arg_99_1.talkMaxDuration)

			if var_102_12 <= arg_99_1.time_ and arg_99_1.time_ < var_102_12 + var_102_22 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_12) / var_102_22

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_12 + var_102_22 and arg_99_1.time_ < var_102_12 + var_102_22 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play319351025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319351025
		arg_103_1.duration_ = 7.066

		local var_103_0 = {
			zh = 7,
			ja = 7.066
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
				arg_103_0:Play319351026(arg_103_1)
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

			local var_106_13 = arg_103_1.actors_["10058ui_story"]
			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 and arg_103_1.var_.characterEffect10058ui_story == nil then
				arg_103_1.var_.characterEffect10058ui_story = var_106_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_15 = 0.200000002980232

			if var_106_14 <= arg_103_1.time_ and arg_103_1.time_ < var_106_14 + var_106_15 then
				local var_106_16 = (arg_103_1.time_ - var_106_14) / var_106_15

				if arg_103_1.var_.characterEffect10058ui_story then
					local var_106_17 = Mathf.Lerp(0, 0.5, var_106_16)

					arg_103_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_103_1.var_.characterEffect10058ui_story.fillRatio = var_106_17
				end
			end

			if arg_103_1.time_ >= var_106_14 + var_106_15 and arg_103_1.time_ < var_106_14 + var_106_15 + arg_106_0 and arg_103_1.var_.characterEffect10058ui_story then
				local var_106_18 = 0.5

				arg_103_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_103_1.var_.characterEffect10058ui_story.fillRatio = var_106_18
			end

			local var_106_19 = 0

			if var_106_19 < arg_103_1.time_ and arg_103_1.time_ <= var_106_19 + arg_106_0 then
				arg_103_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action437")
			end

			local var_106_20 = 0

			if var_106_20 < arg_103_1.time_ and arg_103_1.time_ <= var_106_20 + arg_106_0 then
				arg_103_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_106_21 = 0
			local var_106_22 = 0.6

			if var_106_21 < arg_103_1.time_ and arg_103_1.time_ <= var_106_21 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_23 = arg_103_1:FormatText(StoryNameCfg[6].name)

				arg_103_1.leftNameTxt_.text = var_106_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_24 = arg_103_1:GetWordFromCfg(319351025)
				local var_106_25 = arg_103_1:FormatText(var_106_24.content)

				arg_103_1.text_.text = var_106_25

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_26 = 24
				local var_106_27 = utf8.len(var_106_25)
				local var_106_28 = var_106_26 <= 0 and var_106_22 or var_106_22 * (var_106_27 / var_106_26)

				if var_106_28 > 0 and var_106_22 < var_106_28 then
					arg_103_1.talkMaxDuration = var_106_28

					if var_106_28 + var_106_21 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_28 + var_106_21
					end
				end

				arg_103_1.text_.text = var_106_25
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351025", "story_v_out_319351.awb") ~= 0 then
					local var_106_29 = manager.audio:GetVoiceLength("story_v_out_319351", "319351025", "story_v_out_319351.awb") / 1000

					if var_106_29 + var_106_21 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_29 + var_106_21
					end

					if var_106_24.prefab_name ~= "" and arg_103_1.actors_[var_106_24.prefab_name] ~= nil then
						local var_106_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_24.prefab_name].transform, "story_v_out_319351", "319351025", "story_v_out_319351.awb")

						arg_103_1:RecordAudio("319351025", var_106_30)
						arg_103_1:RecordAudio("319351025", var_106_30)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_319351", "319351025", "story_v_out_319351.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_319351", "319351025", "story_v_out_319351.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_31 = math.max(var_106_22, arg_103_1.talkMaxDuration)

			if var_106_21 <= arg_103_1.time_ and arg_103_1.time_ < var_106_21 + var_106_31 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_21) / var_106_31

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_21 + var_106_31 and arg_103_1.time_ < var_106_21 + var_106_31 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play319351026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319351026
		arg_107_1.duration_ = 5.3

		local var_107_0 = {
			zh = 5.3,
			ja = 5.2
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
				arg_107_0:Play319351027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.725

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[6].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(319351026)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351026", "story_v_out_319351.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_319351", "319351026", "story_v_out_319351.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_319351", "319351026", "story_v_out_319351.awb")

						arg_107_1:RecordAudio("319351026", var_110_9)
						arg_107_1:RecordAudio("319351026", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_319351", "319351026", "story_v_out_319351.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_319351", "319351026", "story_v_out_319351.awb")
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
	Play319351027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 319351027
		arg_111_1.duration_ = 5.933

		local var_111_0 = {
			zh = 1.999999999999,
			ja = 5.933
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
				arg_111_0:Play319351028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10058ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect10058ui_story == nil then
				arg_111_1.var_.characterEffect10058ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect10058ui_story then
					arg_111_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect10058ui_story then
				arg_111_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_114_4 = arg_111_1.actors_["1084ui_story"]
			local var_114_5 = 0

			if var_114_5 < arg_111_1.time_ and arg_111_1.time_ <= var_114_5 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story == nil then
				arg_111_1.var_.characterEffect1084ui_story = var_114_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_6 = 0.200000002980232

			if var_114_5 <= arg_111_1.time_ and arg_111_1.time_ < var_114_5 + var_114_6 then
				local var_114_7 = (arg_111_1.time_ - var_114_5) / var_114_6

				if arg_111_1.var_.characterEffect1084ui_story then
					local var_114_8 = Mathf.Lerp(0, 0.5, var_114_7)

					arg_111_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1084ui_story.fillRatio = var_114_8
				end
			end

			if arg_111_1.time_ >= var_114_5 + var_114_6 and arg_111_1.time_ < var_114_5 + var_114_6 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story then
				local var_114_9 = 0.5

				arg_111_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1084ui_story.fillRatio = var_114_9
			end

			local var_114_10 = 0

			if var_114_10 < arg_111_1.time_ and arg_111_1.time_ <= var_114_10 + arg_114_0 then
				arg_111_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_2")
			end

			local var_114_11 = 0

			if var_114_11 < arg_111_1.time_ and arg_111_1.time_ <= var_114_11 + arg_114_0 then
				arg_111_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_114_12 = 0
			local var_114_13 = 0.075

			if var_114_12 < arg_111_1.time_ and arg_111_1.time_ <= var_114_12 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_14 = arg_111_1:FormatText(StoryNameCfg[471].name)

				arg_111_1.leftNameTxt_.text = var_114_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_15 = arg_111_1:GetWordFromCfg(319351027)
				local var_114_16 = arg_111_1:FormatText(var_114_15.content)

				arg_111_1.text_.text = var_114_16

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_17 = 3
				local var_114_18 = utf8.len(var_114_16)
				local var_114_19 = var_114_17 <= 0 and var_114_13 or var_114_13 * (var_114_18 / var_114_17)

				if var_114_19 > 0 and var_114_13 < var_114_19 then
					arg_111_1.talkMaxDuration = var_114_19

					if var_114_19 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_19 + var_114_12
					end
				end

				arg_111_1.text_.text = var_114_16
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351027", "story_v_out_319351.awb") ~= 0 then
					local var_114_20 = manager.audio:GetVoiceLength("story_v_out_319351", "319351027", "story_v_out_319351.awb") / 1000

					if var_114_20 + var_114_12 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_20 + var_114_12
					end

					if var_114_15.prefab_name ~= "" and arg_111_1.actors_[var_114_15.prefab_name] ~= nil then
						local var_114_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_15.prefab_name].transform, "story_v_out_319351", "319351027", "story_v_out_319351.awb")

						arg_111_1:RecordAudio("319351027", var_114_21)
						arg_111_1:RecordAudio("319351027", var_114_21)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_319351", "319351027", "story_v_out_319351.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_319351", "319351027", "story_v_out_319351.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_22 = math.max(var_114_13, arg_111_1.talkMaxDuration)

			if var_114_12 <= arg_111_1.time_ and arg_111_1.time_ < var_114_12 + var_114_22 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_12) / var_114_22

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_12 + var_114_22 and arg_111_1.time_ < var_114_12 + var_114_22 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play319351028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 319351028
		arg_115_1.duration_ = 1.999999999999

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play319351029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10058ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect10058ui_story == nil then
				arg_115_1.var_.characterEffect10058ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.200000002980232

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect10058ui_story then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_115_1.var_.characterEffect10058ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect10058ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_115_1.var_.characterEffect10058ui_story.fillRatio = var_118_5
			end

			local var_118_6 = arg_115_1.actors_["1084ui_story"]
			local var_118_7 = 0

			if var_118_7 < arg_115_1.time_ and arg_115_1.time_ <= var_118_7 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story == nil then
				arg_115_1.var_.characterEffect1084ui_story = var_118_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_8 = 0.200000002980232

			if var_118_7 <= arg_115_1.time_ and arg_115_1.time_ < var_118_7 + var_118_8 then
				local var_118_9 = (arg_115_1.time_ - var_118_7) / var_118_8

				if arg_115_1.var_.characterEffect1084ui_story then
					arg_115_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_7 + var_118_8 and arg_115_1.time_ < var_118_7 + var_118_8 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story then
				arg_115_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 then
				arg_115_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_118_11 = 0

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_118_12 = 0
			local var_118_13 = 0.075

			if var_118_12 < arg_115_1.time_ and arg_115_1.time_ <= var_118_12 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_14 = arg_115_1:FormatText(StoryNameCfg[6].name)

				arg_115_1.leftNameTxt_.text = var_118_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_15 = arg_115_1:GetWordFromCfg(319351028)
				local var_118_16 = arg_115_1:FormatText(var_118_15.content)

				arg_115_1.text_.text = var_118_16

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_17 = 3
				local var_118_18 = utf8.len(var_118_16)
				local var_118_19 = var_118_17 <= 0 and var_118_13 or var_118_13 * (var_118_18 / var_118_17)

				if var_118_19 > 0 and var_118_13 < var_118_19 then
					arg_115_1.talkMaxDuration = var_118_19

					if var_118_19 + var_118_12 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_19 + var_118_12
					end
				end

				arg_115_1.text_.text = var_118_16
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351028", "story_v_out_319351.awb") ~= 0 then
					local var_118_20 = manager.audio:GetVoiceLength("story_v_out_319351", "319351028", "story_v_out_319351.awb") / 1000

					if var_118_20 + var_118_12 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_20 + var_118_12
					end

					if var_118_15.prefab_name ~= "" and arg_115_1.actors_[var_118_15.prefab_name] ~= nil then
						local var_118_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_15.prefab_name].transform, "story_v_out_319351", "319351028", "story_v_out_319351.awb")

						arg_115_1:RecordAudio("319351028", var_118_21)
						arg_115_1:RecordAudio("319351028", var_118_21)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_319351", "319351028", "story_v_out_319351.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_319351", "319351028", "story_v_out_319351.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_22 = math.max(var_118_13, arg_115_1.talkMaxDuration)

			if var_118_12 <= arg_115_1.time_ and arg_115_1.time_ < var_118_12 + var_118_22 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_12) / var_118_22

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_12 + var_118_22 and arg_115_1.time_ < var_118_12 + var_118_22 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play319351029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 319351029
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play319351030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10058ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos10058ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, 100, 0)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10058ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, 100, 0)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["10058ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect10058ui_story == nil then
				arg_119_1.var_.characterEffect10058ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect10058ui_story then
					local var_122_13 = Mathf.Lerp(0, 0.5, var_122_12)

					arg_119_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_119_1.var_.characterEffect10058ui_story.fillRatio = var_122_13
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect10058ui_story then
				local var_122_14 = 0.5

				arg_119_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_119_1.var_.characterEffect10058ui_story.fillRatio = var_122_14
			end

			local var_122_15 = arg_119_1.actors_["1084ui_story"].transform
			local var_122_16 = 0

			if var_122_16 < arg_119_1.time_ and arg_119_1.time_ <= var_122_16 + arg_122_0 then
				arg_119_1.var_.moveOldPos1084ui_story = var_122_15.localPosition
			end

			local var_122_17 = 0.001

			if var_122_16 <= arg_119_1.time_ and arg_119_1.time_ < var_122_16 + var_122_17 then
				local var_122_18 = (arg_119_1.time_ - var_122_16) / var_122_17
				local var_122_19 = Vector3.New(0, 100, 0)

				var_122_15.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1084ui_story, var_122_19, var_122_18)

				local var_122_20 = manager.ui.mainCamera.transform.position - var_122_15.position

				var_122_15.forward = Vector3.New(var_122_20.x, var_122_20.y, var_122_20.z)

				local var_122_21 = var_122_15.localEulerAngles

				var_122_21.z = 0
				var_122_21.x = 0
				var_122_15.localEulerAngles = var_122_21
			end

			if arg_119_1.time_ >= var_122_16 + var_122_17 and arg_119_1.time_ < var_122_16 + var_122_17 + arg_122_0 then
				var_122_15.localPosition = Vector3.New(0, 100, 0)

				local var_122_22 = manager.ui.mainCamera.transform.position - var_122_15.position

				var_122_15.forward = Vector3.New(var_122_22.x, var_122_22.y, var_122_22.z)

				local var_122_23 = var_122_15.localEulerAngles

				var_122_23.z = 0
				var_122_23.x = 0
				var_122_15.localEulerAngles = var_122_23
			end

			local var_122_24 = arg_119_1.actors_["1084ui_story"]
			local var_122_25 = 0

			if var_122_25 < arg_119_1.time_ and arg_119_1.time_ <= var_122_25 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story == nil then
				arg_119_1.var_.characterEffect1084ui_story = var_122_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_26 = 0.200000002980232

			if var_122_25 <= arg_119_1.time_ and arg_119_1.time_ < var_122_25 + var_122_26 then
				local var_122_27 = (arg_119_1.time_ - var_122_25) / var_122_26

				if arg_119_1.var_.characterEffect1084ui_story then
					local var_122_28 = Mathf.Lerp(0, 0.5, var_122_27)

					arg_119_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1084ui_story.fillRatio = var_122_28
				end
			end

			if arg_119_1.time_ >= var_122_25 + var_122_26 and arg_119_1.time_ < var_122_25 + var_122_26 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story then
				local var_122_29 = 0.5

				arg_119_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1084ui_story.fillRatio = var_122_29
			end

			local var_122_30 = 0
			local var_122_31 = 1.15

			if var_122_30 < arg_119_1.time_ and arg_119_1.time_ <= var_122_30 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_32 = arg_119_1:GetWordFromCfg(319351029)
				local var_122_33 = arg_119_1:FormatText(var_122_32.content)

				arg_119_1.text_.text = var_122_33

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_34 = 46
				local var_122_35 = utf8.len(var_122_33)
				local var_122_36 = var_122_34 <= 0 and var_122_31 or var_122_31 * (var_122_35 / var_122_34)

				if var_122_36 > 0 and var_122_31 < var_122_36 then
					arg_119_1.talkMaxDuration = var_122_36

					if var_122_36 + var_122_30 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_36 + var_122_30
					end
				end

				arg_119_1.text_.text = var_122_33
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_37 = math.max(var_122_31, arg_119_1.talkMaxDuration)

			if var_122_30 <= arg_119_1.time_ and arg_119_1.time_ < var_122_30 + var_122_37 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_30) / var_122_37

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_30 + var_122_37 and arg_119_1.time_ < var_122_30 + var_122_37 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play319351030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 319351030
		arg_123_1.duration_ = 9.43266666666667

		local var_123_0 = {
			zh = 8.99966666666667,
			ja = 9.43266666666667
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
				arg_123_0:Play319351031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = "1095ui_story"

			if arg_123_1.actors_[var_126_0] == nil then
				local var_126_1 = Object.Instantiate(Asset.Load("Char/" .. var_126_0), arg_123_1.stage_.transform)

				var_126_1.name = var_126_0
				var_126_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_123_1.actors_[var_126_0] = var_126_1

				local var_126_2 = var_126_1:GetComponentInChildren(typeof(CharacterEffect))

				var_126_2.enabled = true

				local var_126_3 = GameObjectTools.GetOrAddComponent(var_126_1, typeof(DynamicBoneHelper))

				if var_126_3 then
					var_126_3:EnableDynamicBone(false)
				end

				arg_123_1:ShowWeapon(var_126_2.transform, false)

				arg_123_1.var_[var_126_0 .. "Animator"] = var_126_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_123_1.var_[var_126_0 .. "Animator"].applyRootMotion = true
				arg_123_1.var_[var_126_0 .. "LipSync"] = var_126_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_126_4 = arg_123_1.actors_["1095ui_story"].transform
			local var_126_5 = 2.36666666666667

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 then
				arg_123_1.var_.moveOldPos1095ui_story = var_126_4.localPosition
			end

			local var_126_6 = 0.001

			if var_126_5 <= arg_123_1.time_ and arg_123_1.time_ < var_126_5 + var_126_6 then
				local var_126_7 = (arg_123_1.time_ - var_126_5) / var_126_6
				local var_126_8 = Vector3.New(0, -0.98, -6.1)

				var_126_4.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1095ui_story, var_126_8, var_126_7)

				local var_126_9 = manager.ui.mainCamera.transform.position - var_126_4.position

				var_126_4.forward = Vector3.New(var_126_9.x, var_126_9.y, var_126_9.z)

				local var_126_10 = var_126_4.localEulerAngles

				var_126_10.z = 0
				var_126_10.x = 0
				var_126_4.localEulerAngles = var_126_10
			end

			if arg_123_1.time_ >= var_126_5 + var_126_6 and arg_123_1.time_ < var_126_5 + var_126_6 + arg_126_0 then
				var_126_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_126_11 = manager.ui.mainCamera.transform.position - var_126_4.position

				var_126_4.forward = Vector3.New(var_126_11.x, var_126_11.y, var_126_11.z)

				local var_126_12 = var_126_4.localEulerAngles

				var_126_12.z = 0
				var_126_12.x = 0
				var_126_4.localEulerAngles = var_126_12
			end

			local var_126_13 = arg_123_1.actors_["1095ui_story"]
			local var_126_14 = 2.36666666666667

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 and arg_123_1.var_.characterEffect1095ui_story == nil then
				arg_123_1.var_.characterEffect1095ui_story = var_126_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_15 = 0.200000002980232

			if var_126_14 <= arg_123_1.time_ and arg_123_1.time_ < var_126_14 + var_126_15 then
				local var_126_16 = (arg_123_1.time_ - var_126_14) / var_126_15

				if arg_123_1.var_.characterEffect1095ui_story then
					arg_123_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_14 + var_126_15 and arg_123_1.time_ < var_126_14 + var_126_15 + arg_126_0 and arg_123_1.var_.characterEffect1095ui_story then
				arg_123_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_126_17 = 2.36666666666667

			if var_126_17 < arg_123_1.time_ and arg_123_1.time_ <= var_126_17 + arg_126_0 then
				arg_123_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_126_18 = 2.36666666666667

			if var_126_18 < arg_123_1.time_ and arg_123_1.time_ <= var_126_18 + arg_126_0 then
				arg_123_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_126_19 = 1.4

			if var_126_19 < arg_123_1.time_ and arg_123_1.time_ <= var_126_19 + arg_126_0 then
				local var_126_20 = manager.ui.mainCamera.transform.localPosition
				local var_126_21 = Vector3.New(0, 0, 10) + Vector3.New(var_126_20.x, var_126_20.y, 0)
				local var_126_22 = arg_123_1.bgs_.ST74

				var_126_22.transform.localPosition = var_126_21
				var_126_22.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_126_23 = var_126_22:GetComponent("SpriteRenderer")

				if var_126_23 and var_126_23.sprite then
					local var_126_24 = (var_126_22.transform.localPosition - var_126_20).z
					local var_126_25 = manager.ui.mainCameraCom_
					local var_126_26 = 2 * var_126_24 * Mathf.Tan(var_126_25.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_126_27 = var_126_26 * var_126_25.aspect
					local var_126_28 = var_126_23.sprite.bounds.size.x
					local var_126_29 = var_126_23.sprite.bounds.size.y
					local var_126_30 = var_126_27 / var_126_28
					local var_126_31 = var_126_26 / var_126_29
					local var_126_32 = var_126_31 < var_126_30 and var_126_30 or var_126_31

					var_126_22.transform.localScale = Vector3.New(var_126_32, var_126_32, 0)
				end

				for iter_126_0, iter_126_1 in pairs(arg_123_1.bgs_) do
					if iter_126_0 ~= "ST74" then
						iter_126_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_126_33 = 0

			if var_126_33 < arg_123_1.time_ and arg_123_1.time_ <= var_126_33 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_34 = 1.4

			if var_126_33 <= arg_123_1.time_ and arg_123_1.time_ < var_126_33 + var_126_34 then
				local var_126_35 = (arg_123_1.time_ - var_126_33) / var_126_34
				local var_126_36 = Color.New(0, 0, 0)

				var_126_36.a = Mathf.Lerp(0, 1, var_126_35)
				arg_123_1.mask_.color = var_126_36
			end

			if arg_123_1.time_ >= var_126_33 + var_126_34 and arg_123_1.time_ < var_126_33 + var_126_34 + arg_126_0 then
				local var_126_37 = Color.New(0, 0, 0)

				var_126_37.a = 1
				arg_123_1.mask_.color = var_126_37
			end

			local var_126_38 = 1.4

			if var_126_38 < arg_123_1.time_ and arg_123_1.time_ <= var_126_38 + arg_126_0 then
				arg_123_1.mask_.enabled = true
				arg_123_1.mask_.raycastTarget = true

				arg_123_1:SetGaussion(false)
			end

			local var_126_39 = 1.00066666851441

			if var_126_38 <= arg_123_1.time_ and arg_123_1.time_ < var_126_38 + var_126_39 then
				local var_126_40 = (arg_123_1.time_ - var_126_38) / var_126_39
				local var_126_41 = Color.New(0, 0, 0)

				var_126_41.a = Mathf.Lerp(1, 0, var_126_40)
				arg_123_1.mask_.color = var_126_41
			end

			if arg_123_1.time_ >= var_126_38 + var_126_39 and arg_123_1.time_ < var_126_38 + var_126_39 + arg_126_0 then
				local var_126_42 = Color.New(0, 0, 0)
				local var_126_43 = 0

				arg_123_1.mask_.enabled = false
				var_126_42.a = var_126_43
				arg_123_1.mask_.color = var_126_42
			end

			if arg_123_1.frameCnt_ <= 1 then
				arg_123_1.dialog_:SetActive(false)
			end

			local var_126_44 = 2.36666666666667
			local var_126_45 = 0.75

			if var_126_44 < arg_123_1.time_ and arg_123_1.time_ <= var_126_44 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0

				arg_123_1.dialog_:SetActive(true)

				local var_126_46 = LeanTween.value(arg_123_1.dialog_, 0, 1, 0.3)

				var_126_46:setOnUpdate(LuaHelper.FloatAction(function(arg_127_0)
					arg_123_1.dialogCg_.alpha = arg_127_0
				end))
				var_126_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_123_1.dialog_)
					var_126_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_123_1.duration_ = arg_123_1.duration_ + 0.3

				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_47 = arg_123_1:FormatText(StoryNameCfg[471].name)

				arg_123_1.leftNameTxt_.text = var_126_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_48 = arg_123_1:GetWordFromCfg(319351030)
				local var_126_49 = arg_123_1:FormatText(var_126_48.content)

				arg_123_1.text_.text = var_126_49

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_50 = 30
				local var_126_51 = utf8.len(var_126_49)
				local var_126_52 = var_126_50 <= 0 and var_126_45 or var_126_45 * (var_126_51 / var_126_50)

				if var_126_52 > 0 and var_126_45 < var_126_52 then
					arg_123_1.talkMaxDuration = var_126_52
					var_126_44 = var_126_44 + 0.3

					if var_126_52 + var_126_44 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_52 + var_126_44
					end
				end

				arg_123_1.text_.text = var_126_49
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351030", "story_v_out_319351.awb") ~= 0 then
					local var_126_53 = manager.audio:GetVoiceLength("story_v_out_319351", "319351030", "story_v_out_319351.awb") / 1000

					if var_126_53 + var_126_44 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_53 + var_126_44
					end

					if var_126_48.prefab_name ~= "" and arg_123_1.actors_[var_126_48.prefab_name] ~= nil then
						local var_126_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_48.prefab_name].transform, "story_v_out_319351", "319351030", "story_v_out_319351.awb")

						arg_123_1:RecordAudio("319351030", var_126_54)
						arg_123_1:RecordAudio("319351030", var_126_54)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_319351", "319351030", "story_v_out_319351.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_319351", "319351030", "story_v_out_319351.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_55 = var_126_44 + 0.3
			local var_126_56 = math.max(var_126_45, arg_123_1.talkMaxDuration)

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
	Play319351031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319351031
		arg_129_1.duration_ = 4.5

		local var_129_0 = {
			zh = 4.5,
			ja = 4.4
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
				arg_129_0:Play319351032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1084ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1084ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(-0.7, -0.97, -6)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1084ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1084ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1084ui_story == nil then
				arg_129_1.var_.characterEffect1084ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1084ui_story then
					arg_129_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect1084ui_story then
				arg_129_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_132_14 = 0

			if var_132_14 < arg_129_1.time_ and arg_129_1.time_ <= var_132_14 + arg_132_0 then
				arg_129_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_132_15 = arg_129_1.actors_["1095ui_story"].transform
			local var_132_16 = 0

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 then
				arg_129_1.var_.moveOldPos1095ui_story = var_132_15.localPosition
			end

			local var_132_17 = 0.001

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_17 then
				local var_132_18 = (arg_129_1.time_ - var_132_16) / var_132_17
				local var_132_19 = Vector3.New(0.7, -0.98, -6.1)

				var_132_15.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1095ui_story, var_132_19, var_132_18)

				local var_132_20 = manager.ui.mainCamera.transform.position - var_132_15.position

				var_132_15.forward = Vector3.New(var_132_20.x, var_132_20.y, var_132_20.z)

				local var_132_21 = var_132_15.localEulerAngles

				var_132_21.z = 0
				var_132_21.x = 0
				var_132_15.localEulerAngles = var_132_21
			end

			if arg_129_1.time_ >= var_132_16 + var_132_17 and arg_129_1.time_ < var_132_16 + var_132_17 + arg_132_0 then
				var_132_15.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_132_22 = manager.ui.mainCamera.transform.position - var_132_15.position

				var_132_15.forward = Vector3.New(var_132_22.x, var_132_22.y, var_132_22.z)

				local var_132_23 = var_132_15.localEulerAngles

				var_132_23.z = 0
				var_132_23.x = 0
				var_132_15.localEulerAngles = var_132_23
			end

			local var_132_24 = arg_129_1.actors_["1095ui_story"]
			local var_132_25 = 0

			if var_132_25 < arg_129_1.time_ and arg_129_1.time_ <= var_132_25 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story == nil then
				arg_129_1.var_.characterEffect1095ui_story = var_132_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_26 = 0.200000002980232

			if var_132_25 <= arg_129_1.time_ and arg_129_1.time_ < var_132_25 + var_132_26 then
				local var_132_27 = (arg_129_1.time_ - var_132_25) / var_132_26

				if arg_129_1.var_.characterEffect1095ui_story then
					local var_132_28 = Mathf.Lerp(0, 0.5, var_132_27)

					arg_129_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1095ui_story.fillRatio = var_132_28
				end
			end

			if arg_129_1.time_ >= var_132_25 + var_132_26 and arg_129_1.time_ < var_132_25 + var_132_26 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story then
				local var_132_29 = 0.5

				arg_129_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1095ui_story.fillRatio = var_132_29
			end

			local var_132_30 = 0
			local var_132_31 = 0.3

			if var_132_30 < arg_129_1.time_ and arg_129_1.time_ <= var_132_30 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_32 = arg_129_1:FormatText(StoryNameCfg[6].name)

				arg_129_1.leftNameTxt_.text = var_132_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_33 = arg_129_1:GetWordFromCfg(319351031)
				local var_132_34 = arg_129_1:FormatText(var_132_33.content)

				arg_129_1.text_.text = var_132_34

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_35 = 12
				local var_132_36 = utf8.len(var_132_34)
				local var_132_37 = var_132_35 <= 0 and var_132_31 or var_132_31 * (var_132_36 / var_132_35)

				if var_132_37 > 0 and var_132_31 < var_132_37 then
					arg_129_1.talkMaxDuration = var_132_37

					if var_132_37 + var_132_30 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_37 + var_132_30
					end
				end

				arg_129_1.text_.text = var_132_34
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351031", "story_v_out_319351.awb") ~= 0 then
					local var_132_38 = manager.audio:GetVoiceLength("story_v_out_319351", "319351031", "story_v_out_319351.awb") / 1000

					if var_132_38 + var_132_30 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_38 + var_132_30
					end

					if var_132_33.prefab_name ~= "" and arg_129_1.actors_[var_132_33.prefab_name] ~= nil then
						local var_132_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_33.prefab_name].transform, "story_v_out_319351", "319351031", "story_v_out_319351.awb")

						arg_129_1:RecordAudio("319351031", var_132_39)
						arg_129_1:RecordAudio("319351031", var_132_39)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319351", "319351031", "story_v_out_319351.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319351", "319351031", "story_v_out_319351.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_40 = math.max(var_132_31, arg_129_1.talkMaxDuration)

			if var_132_30 <= arg_129_1.time_ and arg_129_1.time_ < var_132_30 + var_132_40 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_30) / var_132_40

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_30 + var_132_40 and arg_129_1.time_ < var_132_30 + var_132_40 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319351032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319351032
		arg_133_1.duration_ = 2.033

		local var_133_0 = {
			zh = 1.7,
			ja = 2.033
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
				arg_133_0:Play319351033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1084ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story == nil then
				arg_133_1.var_.characterEffect1084ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1084ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1084ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1084ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1084ui_story.fillRatio = var_136_5
			end

			local var_136_6 = arg_133_1.actors_["1095ui_story"]
			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 and arg_133_1.var_.characterEffect1095ui_story == nil then
				arg_133_1.var_.characterEffect1095ui_story = var_136_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_8 = 0.200000002980232

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_8 then
				local var_136_9 = (arg_133_1.time_ - var_136_7) / var_136_8

				if arg_133_1.var_.characterEffect1095ui_story then
					arg_133_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_7 + var_136_8 and arg_133_1.time_ < var_136_7 + var_136_8 + arg_136_0 and arg_133_1.var_.characterEffect1095ui_story then
				arg_133_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_136_10 = 0
			local var_136_11 = 0.125

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_12 = arg_133_1:FormatText(StoryNameCfg[471].name)

				arg_133_1.leftNameTxt_.text = var_136_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_13 = arg_133_1:GetWordFromCfg(319351032)
				local var_136_14 = arg_133_1:FormatText(var_136_13.content)

				arg_133_1.text_.text = var_136_14

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_15 = 5
				local var_136_16 = utf8.len(var_136_14)
				local var_136_17 = var_136_15 <= 0 and var_136_11 or var_136_11 * (var_136_16 / var_136_15)

				if var_136_17 > 0 and var_136_11 < var_136_17 then
					arg_133_1.talkMaxDuration = var_136_17

					if var_136_17 + var_136_10 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_17 + var_136_10
					end
				end

				arg_133_1.text_.text = var_136_14
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351032", "story_v_out_319351.awb") ~= 0 then
					local var_136_18 = manager.audio:GetVoiceLength("story_v_out_319351", "319351032", "story_v_out_319351.awb") / 1000

					if var_136_18 + var_136_10 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_18 + var_136_10
					end

					if var_136_13.prefab_name ~= "" and arg_133_1.actors_[var_136_13.prefab_name] ~= nil then
						local var_136_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_13.prefab_name].transform, "story_v_out_319351", "319351032", "story_v_out_319351.awb")

						arg_133_1:RecordAudio("319351032", var_136_19)
						arg_133_1:RecordAudio("319351032", var_136_19)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319351", "319351032", "story_v_out_319351.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319351", "319351032", "story_v_out_319351.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_20 = math.max(var_136_11, arg_133_1.talkMaxDuration)

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_20 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_10) / var_136_20

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_10 + var_136_20 and arg_133_1.time_ < var_136_10 + var_136_20 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play319351033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319351033
		arg_137_1.duration_ = 6.4

		local var_137_0 = {
			zh = 1.999999999999,
			ja = 6.4
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
				arg_137_0:Play319351034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1084ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story == nil then
				arg_137_1.var_.characterEffect1084ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect1084ui_story then
					arg_137_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect1084ui_story then
				arg_137_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_140_4 = 0

			if var_140_4 < arg_137_1.time_ and arg_137_1.time_ <= var_140_4 + arg_140_0 then
				arg_137_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action478")
			end

			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 then
				arg_137_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_6 = arg_137_1.actors_["1095ui_story"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 and arg_137_1.var_.characterEffect1095ui_story == nil then
				arg_137_1.var_.characterEffect1095ui_story = var_140_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_8 = 0.200000002980232

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8

				if arg_137_1.var_.characterEffect1095ui_story then
					local var_140_10 = Mathf.Lerp(0, 0.5, var_140_9)

					arg_137_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1095ui_story.fillRatio = var_140_10
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.characterEffect1095ui_story then
				local var_140_11 = 0.5

				arg_137_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1095ui_story.fillRatio = var_140_11
			end

			local var_140_12 = 0
			local var_140_13 = 0.2

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_14 = arg_137_1:FormatText(StoryNameCfg[6].name)

				arg_137_1.leftNameTxt_.text = var_140_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_15 = arg_137_1:GetWordFromCfg(319351033)
				local var_140_16 = arg_137_1:FormatText(var_140_15.content)

				arg_137_1.text_.text = var_140_16

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_17 = 8
				local var_140_18 = utf8.len(var_140_16)
				local var_140_19 = var_140_17 <= 0 and var_140_13 or var_140_13 * (var_140_18 / var_140_17)

				if var_140_19 > 0 and var_140_13 < var_140_19 then
					arg_137_1.talkMaxDuration = var_140_19

					if var_140_19 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_19 + var_140_12
					end
				end

				arg_137_1.text_.text = var_140_16
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351033", "story_v_out_319351.awb") ~= 0 then
					local var_140_20 = manager.audio:GetVoiceLength("story_v_out_319351", "319351033", "story_v_out_319351.awb") / 1000

					if var_140_20 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_20 + var_140_12
					end

					if var_140_15.prefab_name ~= "" and arg_137_1.actors_[var_140_15.prefab_name] ~= nil then
						local var_140_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_15.prefab_name].transform, "story_v_out_319351", "319351033", "story_v_out_319351.awb")

						arg_137_1:RecordAudio("319351033", var_140_21)
						arg_137_1:RecordAudio("319351033", var_140_21)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319351", "319351033", "story_v_out_319351.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319351", "319351033", "story_v_out_319351.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_22 = math.max(var_140_13, arg_137_1.talkMaxDuration)

			if var_140_12 <= arg_137_1.time_ and arg_137_1.time_ < var_140_12 + var_140_22 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_12) / var_140_22

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_12 + var_140_22 and arg_137_1.time_ < var_140_12 + var_140_22 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319351034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319351034
		arg_141_1.duration_ = 12.266

		local var_141_0 = {
			zh = 8.833,
			ja = 12.266
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
				arg_141_0:Play319351035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1084ui_story"]
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story == nil then
				arg_141_1.var_.characterEffect1084ui_story = var_144_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_2 = 0.200000002980232

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2

				if arg_141_1.var_.characterEffect1084ui_story then
					local var_144_4 = Mathf.Lerp(0, 0.5, var_144_3)

					arg_141_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1084ui_story.fillRatio = var_144_4
				end
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story then
				local var_144_5 = 0.5

				arg_141_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1084ui_story.fillRatio = var_144_5
			end

			local var_144_6 = arg_141_1.actors_["1095ui_story"]
			local var_144_7 = 0

			if var_144_7 < arg_141_1.time_ and arg_141_1.time_ <= var_144_7 + arg_144_0 and arg_141_1.var_.characterEffect1095ui_story == nil then
				arg_141_1.var_.characterEffect1095ui_story = var_144_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_8 = 0.200000002980232

			if var_144_7 <= arg_141_1.time_ and arg_141_1.time_ < var_144_7 + var_144_8 then
				local var_144_9 = (arg_141_1.time_ - var_144_7) / var_144_8

				if arg_141_1.var_.characterEffect1095ui_story then
					arg_141_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_7 + var_144_8 and arg_141_1.time_ < var_144_7 + var_144_8 + arg_144_0 and arg_141_1.var_.characterEffect1095ui_story then
				arg_141_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_144_10 = 0
			local var_144_11 = 1.125

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_12 = arg_141_1:FormatText(StoryNameCfg[471].name)

				arg_141_1.leftNameTxt_.text = var_144_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_13 = arg_141_1:GetWordFromCfg(319351034)
				local var_144_14 = arg_141_1:FormatText(var_144_13.content)

				arg_141_1.text_.text = var_144_14

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_15 = 45
				local var_144_16 = utf8.len(var_144_14)
				local var_144_17 = var_144_15 <= 0 and var_144_11 or var_144_11 * (var_144_16 / var_144_15)

				if var_144_17 > 0 and var_144_11 < var_144_17 then
					arg_141_1.talkMaxDuration = var_144_17

					if var_144_17 + var_144_10 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_17 + var_144_10
					end
				end

				arg_141_1.text_.text = var_144_14
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351034", "story_v_out_319351.awb") ~= 0 then
					local var_144_18 = manager.audio:GetVoiceLength("story_v_out_319351", "319351034", "story_v_out_319351.awb") / 1000

					if var_144_18 + var_144_10 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_18 + var_144_10
					end

					if var_144_13.prefab_name ~= "" and arg_141_1.actors_[var_144_13.prefab_name] ~= nil then
						local var_144_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_13.prefab_name].transform, "story_v_out_319351", "319351034", "story_v_out_319351.awb")

						arg_141_1:RecordAudio("319351034", var_144_19)
						arg_141_1:RecordAudio("319351034", var_144_19)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319351", "319351034", "story_v_out_319351.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319351", "319351034", "story_v_out_319351.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_20 = math.max(var_144_11, arg_141_1.talkMaxDuration)

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_20 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_10) / var_144_20

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_10 + var_144_20 and arg_141_1.time_ < var_144_10 + var_144_20 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319351035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319351035
		arg_145_1.duration_ = 14.2

		local var_145_0 = {
			zh = 4.666,
			ja = 14.2
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
				arg_145_0:Play319351036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_148_2 = 0
			local var_148_3 = 0.55

			if var_148_2 < arg_145_1.time_ and arg_145_1.time_ <= var_148_2 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_4 = arg_145_1:FormatText(StoryNameCfg[471].name)

				arg_145_1.leftNameTxt_.text = var_148_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_5 = arg_145_1:GetWordFromCfg(319351035)
				local var_148_6 = arg_145_1:FormatText(var_148_5.content)

				arg_145_1.text_.text = var_148_6

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_7 = 22
				local var_148_8 = utf8.len(var_148_6)
				local var_148_9 = var_148_7 <= 0 and var_148_3 or var_148_3 * (var_148_8 / var_148_7)

				if var_148_9 > 0 and var_148_3 < var_148_9 then
					arg_145_1.talkMaxDuration = var_148_9

					if var_148_9 + var_148_2 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_9 + var_148_2
					end
				end

				arg_145_1.text_.text = var_148_6
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351035", "story_v_out_319351.awb") ~= 0 then
					local var_148_10 = manager.audio:GetVoiceLength("story_v_out_319351", "319351035", "story_v_out_319351.awb") / 1000

					if var_148_10 + var_148_2 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_10 + var_148_2
					end

					if var_148_5.prefab_name ~= "" and arg_145_1.actors_[var_148_5.prefab_name] ~= nil then
						local var_148_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_5.prefab_name].transform, "story_v_out_319351", "319351035", "story_v_out_319351.awb")

						arg_145_1:RecordAudio("319351035", var_148_11)
						arg_145_1:RecordAudio("319351035", var_148_11)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_319351", "319351035", "story_v_out_319351.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_319351", "319351035", "story_v_out_319351.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_12 = math.max(var_148_3, arg_145_1.talkMaxDuration)

			if var_148_2 <= arg_145_1.time_ and arg_145_1.time_ < var_148_2 + var_148_12 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_2) / var_148_12

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_2 + var_148_12 and arg_145_1.time_ < var_148_2 + var_148_12 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play319351036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319351036
		arg_149_1.duration_ = 2.033

		local var_149_0 = {
			zh = 1.999999999999,
			ja = 2.033
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
				arg_149_0:Play319351037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1084ui_story"]
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story == nil then
				arg_149_1.var_.characterEffect1084ui_story = var_152_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_2 = 0.200000002980232

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2

				if arg_149_1.var_.characterEffect1084ui_story then
					arg_149_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story then
				arg_149_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_152_4 = arg_149_1.actors_["1095ui_story"]
			local var_152_5 = 0

			if var_152_5 < arg_149_1.time_ and arg_149_1.time_ <= var_152_5 + arg_152_0 and arg_149_1.var_.characterEffect1095ui_story == nil then
				arg_149_1.var_.characterEffect1095ui_story = var_152_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_6 = 0.200000002980232

			if var_152_5 <= arg_149_1.time_ and arg_149_1.time_ < var_152_5 + var_152_6 then
				local var_152_7 = (arg_149_1.time_ - var_152_5) / var_152_6

				if arg_149_1.var_.characterEffect1095ui_story then
					local var_152_8 = Mathf.Lerp(0, 0.5, var_152_7)

					arg_149_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1095ui_story.fillRatio = var_152_8
				end
			end

			if arg_149_1.time_ >= var_152_5 + var_152_6 and arg_149_1.time_ < var_152_5 + var_152_6 + arg_152_0 and arg_149_1.var_.characterEffect1095ui_story then
				local var_152_9 = 0.5

				arg_149_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1095ui_story.fillRatio = var_152_9
			end

			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 then
				arg_149_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_2")
			end

			local var_152_11 = 0

			if var_152_11 < arg_149_1.time_ and arg_149_1.time_ <= var_152_11 + arg_152_0 then
				arg_149_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_152_12 = 0
			local var_152_13 = 0.075

			if var_152_12 < arg_149_1.time_ and arg_149_1.time_ <= var_152_12 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_14 = arg_149_1:FormatText(StoryNameCfg[6].name)

				arg_149_1.leftNameTxt_.text = var_152_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_15 = arg_149_1:GetWordFromCfg(319351036)
				local var_152_16 = arg_149_1:FormatText(var_152_15.content)

				arg_149_1.text_.text = var_152_16

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_17 = 3
				local var_152_18 = utf8.len(var_152_16)
				local var_152_19 = var_152_17 <= 0 and var_152_13 or var_152_13 * (var_152_18 / var_152_17)

				if var_152_19 > 0 and var_152_13 < var_152_19 then
					arg_149_1.talkMaxDuration = var_152_19

					if var_152_19 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_19 + var_152_12
					end
				end

				arg_149_1.text_.text = var_152_16
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351036", "story_v_out_319351.awb") ~= 0 then
					local var_152_20 = manager.audio:GetVoiceLength("story_v_out_319351", "319351036", "story_v_out_319351.awb") / 1000

					if var_152_20 + var_152_12 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_20 + var_152_12
					end

					if var_152_15.prefab_name ~= "" and arg_149_1.actors_[var_152_15.prefab_name] ~= nil then
						local var_152_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_15.prefab_name].transform, "story_v_out_319351", "319351036", "story_v_out_319351.awb")

						arg_149_1:RecordAudio("319351036", var_152_21)
						arg_149_1:RecordAudio("319351036", var_152_21)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_319351", "319351036", "story_v_out_319351.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_319351", "319351036", "story_v_out_319351.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_22 = math.max(var_152_13, arg_149_1.talkMaxDuration)

			if var_152_12 <= arg_149_1.time_ and arg_149_1.time_ < var_152_12 + var_152_22 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_12) / var_152_22

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_12 + var_152_22 and arg_149_1.time_ < var_152_12 + var_152_22 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play319351037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319351037
		arg_153_1.duration_ = 5.9

		local var_153_0 = {
			zh = 5.9,
			ja = 5.666
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
				arg_153_0:Play319351038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1095ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1095ui_story == nil then
				arg_153_1.var_.characterEffect1095ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1095ui_story then
					arg_153_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1095ui_story then
				arg_153_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_156_4 = arg_153_1.actors_["1084ui_story"]
			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 and arg_153_1.var_.characterEffect1084ui_story == nil then
				arg_153_1.var_.characterEffect1084ui_story = var_156_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_6 = 0.200000002980232

			if var_156_5 <= arg_153_1.time_ and arg_153_1.time_ < var_156_5 + var_156_6 then
				local var_156_7 = (arg_153_1.time_ - var_156_5) / var_156_6

				if arg_153_1.var_.characterEffect1084ui_story then
					local var_156_8 = Mathf.Lerp(0, 0.5, var_156_7)

					arg_153_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1084ui_story.fillRatio = var_156_8
				end
			end

			if arg_153_1.time_ >= var_156_5 + var_156_6 and arg_153_1.time_ < var_156_5 + var_156_6 + arg_156_0 and arg_153_1.var_.characterEffect1084ui_story then
				local var_156_9 = 0.5

				arg_153_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1084ui_story.fillRatio = var_156_9
			end

			local var_156_10 = 0
			local var_156_11 = 0.65

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_12 = arg_153_1:FormatText(StoryNameCfg[471].name)

				arg_153_1.leftNameTxt_.text = var_156_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_13 = arg_153_1:GetWordFromCfg(319351037)
				local var_156_14 = arg_153_1:FormatText(var_156_13.content)

				arg_153_1.text_.text = var_156_14

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_15 = 26
				local var_156_16 = utf8.len(var_156_14)
				local var_156_17 = var_156_15 <= 0 and var_156_11 or var_156_11 * (var_156_16 / var_156_15)

				if var_156_17 > 0 and var_156_11 < var_156_17 then
					arg_153_1.talkMaxDuration = var_156_17

					if var_156_17 + var_156_10 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_17 + var_156_10
					end
				end

				arg_153_1.text_.text = var_156_14
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351037", "story_v_out_319351.awb") ~= 0 then
					local var_156_18 = manager.audio:GetVoiceLength("story_v_out_319351", "319351037", "story_v_out_319351.awb") / 1000

					if var_156_18 + var_156_10 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_18 + var_156_10
					end

					if var_156_13.prefab_name ~= "" and arg_153_1.actors_[var_156_13.prefab_name] ~= nil then
						local var_156_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_13.prefab_name].transform, "story_v_out_319351", "319351037", "story_v_out_319351.awb")

						arg_153_1:RecordAudio("319351037", var_156_19)
						arg_153_1:RecordAudio("319351037", var_156_19)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_319351", "319351037", "story_v_out_319351.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_319351", "319351037", "story_v_out_319351.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_20 = math.max(var_156_11, arg_153_1.talkMaxDuration)

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_20 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_10) / var_156_20

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_10 + var_156_20 and arg_153_1.time_ < var_156_10 + var_156_20 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319351038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319351038
		arg_157_1.duration_ = 4.4

		local var_157_0 = {
			zh = 3.933,
			ja = 4.4
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
				arg_157_0:Play319351039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 0.525

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_2 = arg_157_1:FormatText(StoryNameCfg[471].name)

				arg_157_1.leftNameTxt_.text = var_160_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_3 = arg_157_1:GetWordFromCfg(319351038)
				local var_160_4 = arg_157_1:FormatText(var_160_3.content)

				arg_157_1.text_.text = var_160_4

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351038", "story_v_out_319351.awb") ~= 0 then
					local var_160_8 = manager.audio:GetVoiceLength("story_v_out_319351", "319351038", "story_v_out_319351.awb") / 1000

					if var_160_8 + var_160_0 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_8 + var_160_0
					end

					if var_160_3.prefab_name ~= "" and arg_157_1.actors_[var_160_3.prefab_name] ~= nil then
						local var_160_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_3.prefab_name].transform, "story_v_out_319351", "319351038", "story_v_out_319351.awb")

						arg_157_1:RecordAudio("319351038", var_160_9)
						arg_157_1:RecordAudio("319351038", var_160_9)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_319351", "319351038", "story_v_out_319351.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_319351", "319351038", "story_v_out_319351.awb")
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
	Play319351039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319351039
		arg_161_1.duration_ = 7.63333333333333

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play319351040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 1.36666666666667

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				local var_164_1 = manager.ui.mainCamera.transform.localPosition
				local var_164_2 = Vector3.New(0, 0, 10) + Vector3.New(var_164_1.x, var_164_1.y, 0)
				local var_164_3 = arg_161_1.bgs_.STblack

				var_164_3.transform.localPosition = var_164_2
				var_164_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_164_4 = var_164_3:GetComponent("SpriteRenderer")

				if var_164_4 and var_164_4.sprite then
					local var_164_5 = (var_164_3.transform.localPosition - var_164_1).z
					local var_164_6 = manager.ui.mainCameraCom_
					local var_164_7 = 2 * var_164_5 * Mathf.Tan(var_164_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_164_8 = var_164_7 * var_164_6.aspect
					local var_164_9 = var_164_4.sprite.bounds.size.x
					local var_164_10 = var_164_4.sprite.bounds.size.y
					local var_164_11 = var_164_8 / var_164_9
					local var_164_12 = var_164_7 / var_164_10
					local var_164_13 = var_164_12 < var_164_11 and var_164_11 or var_164_12

					var_164_3.transform.localScale = Vector3.New(var_164_13, var_164_13, 0)
				end

				for iter_164_0, iter_164_1 in pairs(arg_161_1.bgs_) do
					if iter_164_0 ~= "STblack" then
						iter_164_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_15 = 1.36666666666667

			if var_164_14 <= arg_161_1.time_ and arg_161_1.time_ < var_164_14 + var_164_15 then
				local var_164_16 = (arg_161_1.time_ - var_164_14) / var_164_15
				local var_164_17 = Color.New(0, 0, 0)

				var_164_17.a = Mathf.Lerp(0, 1, var_164_16)
				arg_161_1.mask_.color = var_164_17
			end

			if arg_161_1.time_ >= var_164_14 + var_164_15 and arg_161_1.time_ < var_164_14 + var_164_15 + arg_164_0 then
				local var_164_18 = Color.New(0, 0, 0)

				var_164_18.a = 1
				arg_161_1.mask_.color = var_164_18
			end

			local var_164_19 = 1.36666666666667

			if var_164_19 < arg_161_1.time_ and arg_161_1.time_ <= var_164_19 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_20 = 1.26666666666667

			if var_164_19 <= arg_161_1.time_ and arg_161_1.time_ < var_164_19 + var_164_20 then
				local var_164_21 = (arg_161_1.time_ - var_164_19) / var_164_20
				local var_164_22 = Color.New(0, 0, 0)

				var_164_22.a = Mathf.Lerp(1, 0, var_164_21)
				arg_161_1.mask_.color = var_164_22
			end

			if arg_161_1.time_ >= var_164_19 + var_164_20 and arg_161_1.time_ < var_164_19 + var_164_20 + arg_164_0 then
				local var_164_23 = Color.New(0, 0, 0)
				local var_164_24 = 0

				arg_161_1.mask_.enabled = false
				var_164_23.a = var_164_24
				arg_161_1.mask_.color = var_164_23
			end

			local var_164_25 = arg_161_1.actors_["1095ui_story"].transform
			local var_164_26 = 1.36666666666667

			if var_164_26 < arg_161_1.time_ and arg_161_1.time_ <= var_164_26 + arg_164_0 then
				arg_161_1.var_.moveOldPos1095ui_story = var_164_25.localPosition
			end

			local var_164_27 = 0.001

			if var_164_26 <= arg_161_1.time_ and arg_161_1.time_ < var_164_26 + var_164_27 then
				local var_164_28 = (arg_161_1.time_ - var_164_26) / var_164_27
				local var_164_29 = Vector3.New(0, 100, 0)

				var_164_25.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1095ui_story, var_164_29, var_164_28)

				local var_164_30 = manager.ui.mainCamera.transform.position - var_164_25.position

				var_164_25.forward = Vector3.New(var_164_30.x, var_164_30.y, var_164_30.z)

				local var_164_31 = var_164_25.localEulerAngles

				var_164_31.z = 0
				var_164_31.x = 0
				var_164_25.localEulerAngles = var_164_31
			end

			if arg_161_1.time_ >= var_164_26 + var_164_27 and arg_161_1.time_ < var_164_26 + var_164_27 + arg_164_0 then
				var_164_25.localPosition = Vector3.New(0, 100, 0)

				local var_164_32 = manager.ui.mainCamera.transform.position - var_164_25.position

				var_164_25.forward = Vector3.New(var_164_32.x, var_164_32.y, var_164_32.z)

				local var_164_33 = var_164_25.localEulerAngles

				var_164_33.z = 0
				var_164_33.x = 0
				var_164_25.localEulerAngles = var_164_33
			end

			local var_164_34 = arg_161_1.actors_["1084ui_story"].transform
			local var_164_35 = 1.36666666666667

			if var_164_35 < arg_161_1.time_ and arg_161_1.time_ <= var_164_35 + arg_164_0 then
				arg_161_1.var_.moveOldPos1084ui_story = var_164_34.localPosition
			end

			local var_164_36 = 0.001

			if var_164_35 <= arg_161_1.time_ and arg_161_1.time_ < var_164_35 + var_164_36 then
				local var_164_37 = (arg_161_1.time_ - var_164_35) / var_164_36
				local var_164_38 = Vector3.New(0, 100, 0)

				var_164_34.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1084ui_story, var_164_38, var_164_37)

				local var_164_39 = manager.ui.mainCamera.transform.position - var_164_34.position

				var_164_34.forward = Vector3.New(var_164_39.x, var_164_39.y, var_164_39.z)

				local var_164_40 = var_164_34.localEulerAngles

				var_164_40.z = 0
				var_164_40.x = 0
				var_164_34.localEulerAngles = var_164_40
			end

			if arg_161_1.time_ >= var_164_35 + var_164_36 and arg_161_1.time_ < var_164_35 + var_164_36 + arg_164_0 then
				var_164_34.localPosition = Vector3.New(0, 100, 0)

				local var_164_41 = manager.ui.mainCamera.transform.position - var_164_34.position

				var_164_34.forward = Vector3.New(var_164_41.x, var_164_41.y, var_164_41.z)

				local var_164_42 = var_164_34.localEulerAngles

				var_164_42.z = 0
				var_164_42.x = 0
				var_164_34.localEulerAngles = var_164_42
			end

			if arg_161_1.frameCnt_ <= 1 then
				arg_161_1.dialog_:SetActive(false)
			end

			local var_164_43 = 2.63333333333333
			local var_164_44 = 1.3

			if var_164_43 < arg_161_1.time_ and arg_161_1.time_ <= var_164_43 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0

				arg_161_1.dialog_:SetActive(true)

				local var_164_45 = LeanTween.value(arg_161_1.dialog_, 0, 1, 0.3)

				var_164_45:setOnUpdate(LuaHelper.FloatAction(function(arg_165_0)
					arg_161_1.dialogCg_.alpha = arg_165_0
				end))
				var_164_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_161_1.dialog_)
					var_164_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_161_1.duration_ = arg_161_1.duration_ + 0.3

				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_46 = arg_161_1:GetWordFromCfg(319351039)
				local var_164_47 = arg_161_1:FormatText(var_164_46.content)

				arg_161_1.text_.text = var_164_47

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_48 = 52
				local var_164_49 = utf8.len(var_164_47)
				local var_164_50 = var_164_48 <= 0 and var_164_44 or var_164_44 * (var_164_49 / var_164_48)

				if var_164_50 > 0 and var_164_44 < var_164_50 then
					arg_161_1.talkMaxDuration = var_164_50
					var_164_43 = var_164_43 + 0.3

					if var_164_50 + var_164_43 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_50 + var_164_43
					end
				end

				arg_161_1.text_.text = var_164_47
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_51 = var_164_43 + 0.3
			local var_164_52 = math.max(var_164_44, arg_161_1.talkMaxDuration)

			if var_164_51 <= arg_161_1.time_ and arg_161_1.time_ < var_164_51 + var_164_52 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_51) / var_164_52

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_51 + var_164_52 and arg_161_1.time_ < var_164_51 + var_164_52 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319351040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319351040
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play319351041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 1.35

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_2 = arg_167_1:GetWordFromCfg(319351040)
				local var_170_3 = arg_167_1:FormatText(var_170_2.content)

				arg_167_1.text_.text = var_170_3

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_4 = 54
				local var_170_5 = utf8.len(var_170_3)
				local var_170_6 = var_170_4 <= 0 and var_170_1 or var_170_1 * (var_170_5 / var_170_4)

				if var_170_6 > 0 and var_170_1 < var_170_6 then
					arg_167_1.talkMaxDuration = var_170_6

					if var_170_6 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_6 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_3
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_7 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_7 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_7

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_7 and arg_167_1.time_ < var_170_0 + var_170_7 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319351041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319351041
		arg_171_1.duration_ = 6.83333333333333

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play319351042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.mask_.enabled = true
				arg_171_1.mask_.raycastTarget = true

				arg_171_1:SetGaussion(false)
			end

			local var_174_1 = 0.7

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_1 then
				local var_174_2 = (arg_171_1.time_ - var_174_0) / var_174_1
				local var_174_3 = Color.New(0.7924528, 0.4269517, 0.1084016)

				var_174_3.a = Mathf.Lerp(1, 0, var_174_2)
				arg_171_1.mask_.color = var_174_3
			end

			if arg_171_1.time_ >= var_174_0 + var_174_1 and arg_171_1.time_ < var_174_0 + var_174_1 + arg_174_0 then
				local var_174_4 = Color.New(0.7924528, 0.4269517, 0.1084016)
				local var_174_5 = 0

				arg_171_1.mask_.enabled = false
				var_174_4.a = var_174_5
				arg_171_1.mask_.color = var_174_4
			end

			local var_174_6 = 0.7

			if var_174_6 < arg_171_1.time_ and arg_171_1.time_ <= var_174_6 + arg_174_0 then
				arg_171_1.mask_.enabled = true
				arg_171_1.mask_.raycastTarget = true

				arg_171_1:SetGaussion(false)
			end

			local var_174_7 = 0.8

			if var_174_6 <= arg_171_1.time_ and arg_171_1.time_ < var_174_6 + var_174_7 then
				local var_174_8 = (arg_171_1.time_ - var_174_6) / var_174_7
				local var_174_9 = Color.New(0.7924528, 0.4269517, 0.1084016)

				var_174_9.a = Mathf.Lerp(1, 0, var_174_8)
				arg_171_1.mask_.color = var_174_9
			end

			if arg_171_1.time_ >= var_174_6 + var_174_7 and arg_171_1.time_ < var_174_6 + var_174_7 + arg_174_0 then
				local var_174_10 = Color.New(0.7924528, 0.4269517, 0.1084016)
				local var_174_11 = 0

				arg_171_1.mask_.enabled = false
				var_174_10.a = var_174_11
				arg_171_1.mask_.color = var_174_10
			end

			local var_174_12 = 1.83333333333333
			local var_174_13 = 0.975

			if var_174_12 < arg_171_1.time_ and arg_171_1.time_ <= var_174_12 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, false)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_14 = arg_171_1:GetWordFromCfg(319351041)
				local var_174_15 = arg_171_1:FormatText(var_174_14.content)

				arg_171_1.text_.text = var_174_15

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_16 = 39
				local var_174_17 = utf8.len(var_174_15)
				local var_174_18 = var_174_16 <= 0 and var_174_13 or var_174_13 * (var_174_17 / var_174_16)

				if var_174_18 > 0 and var_174_13 < var_174_18 then
					arg_171_1.talkMaxDuration = var_174_18

					if var_174_18 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_18 + var_174_12
					end
				end

				arg_171_1.text_.text = var_174_15
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_19 = math.max(var_174_13, arg_171_1.talkMaxDuration)

			if var_174_12 <= arg_171_1.time_ and arg_171_1.time_ < var_174_12 + var_174_19 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_12) / var_174_19

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_12 + var_174_19 and arg_171_1.time_ < var_174_12 + var_174_19 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play319351042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319351042
		arg_175_1.duration_ = 5.258

		local var_175_0 = {
			zh = 5.258,
			ja = 5.058
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
				arg_175_0:Play319351043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1084ui_story"]
			local var_178_1 = 3

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect1084ui_story == nil then
				arg_175_1.var_.characterEffect1084ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect1084ui_story then
					arg_175_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect1084ui_story then
				arg_175_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_178_4 = 1

			if var_178_4 < arg_175_1.time_ and arg_175_1.time_ <= var_178_4 + arg_178_0 then
				local var_178_5 = manager.ui.mainCamera.transform.localPosition
				local var_178_6 = Vector3.New(0, 0, 10) + Vector3.New(var_178_5.x, var_178_5.y, 0)
				local var_178_7 = arg_175_1.bgs_.ST74

				var_178_7.transform.localPosition = var_178_6
				var_178_7.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_178_8 = var_178_7:GetComponent("SpriteRenderer")

				if var_178_8 and var_178_8.sprite then
					local var_178_9 = (var_178_7.transform.localPosition - var_178_5).z
					local var_178_10 = manager.ui.mainCameraCom_
					local var_178_11 = 2 * var_178_9 * Mathf.Tan(var_178_10.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_178_12 = var_178_11 * var_178_10.aspect
					local var_178_13 = var_178_8.sprite.bounds.size.x
					local var_178_14 = var_178_8.sprite.bounds.size.y
					local var_178_15 = var_178_12 / var_178_13
					local var_178_16 = var_178_11 / var_178_14
					local var_178_17 = var_178_16 < var_178_15 and var_178_15 or var_178_16

					var_178_7.transform.localScale = Vector3.New(var_178_17, var_178_17, 0)
				end

				for iter_178_0, iter_178_1 in pairs(arg_175_1.bgs_) do
					if iter_178_0 ~= "ST74" then
						iter_178_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_178_18 = 0

			if var_178_18 < arg_175_1.time_ and arg_175_1.time_ <= var_178_18 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_19 = 1

			if var_178_18 <= arg_175_1.time_ and arg_175_1.time_ < var_178_18 + var_178_19 then
				local var_178_20 = (arg_175_1.time_ - var_178_18) / var_178_19
				local var_178_21 = Color.New(0, 0, 0)

				var_178_21.a = Mathf.Lerp(0, 1, var_178_20)
				arg_175_1.mask_.color = var_178_21
			end

			if arg_175_1.time_ >= var_178_18 + var_178_19 and arg_175_1.time_ < var_178_18 + var_178_19 + arg_178_0 then
				local var_178_22 = Color.New(0, 0, 0)

				var_178_22.a = 1
				arg_175_1.mask_.color = var_178_22
			end

			local var_178_23 = 1

			if var_178_23 < arg_175_1.time_ and arg_175_1.time_ <= var_178_23 + arg_178_0 then
				arg_175_1.mask_.enabled = true
				arg_175_1.mask_.raycastTarget = true

				arg_175_1:SetGaussion(false)
			end

			local var_178_24 = 2

			if var_178_23 <= arg_175_1.time_ and arg_175_1.time_ < var_178_23 + var_178_24 then
				local var_178_25 = (arg_175_1.time_ - var_178_23) / var_178_24
				local var_178_26 = Color.New(0, 0, 0)

				var_178_26.a = Mathf.Lerp(1, 0, var_178_25)
				arg_175_1.mask_.color = var_178_26
			end

			if arg_175_1.time_ >= var_178_23 + var_178_24 and arg_175_1.time_ < var_178_23 + var_178_24 + arg_178_0 then
				local var_178_27 = Color.New(0, 0, 0)
				local var_178_28 = 0

				arg_175_1.mask_.enabled = false
				var_178_27.a = var_178_28
				arg_175_1.mask_.color = var_178_27
			end

			local var_178_29 = arg_175_1.actors_["1084ui_story"].transform
			local var_178_30 = 3

			if var_178_30 < arg_175_1.time_ and arg_175_1.time_ <= var_178_30 + arg_178_0 then
				arg_175_1.var_.moveOldPos1084ui_story = var_178_29.localPosition
			end

			local var_178_31 = 0.001

			if var_178_30 <= arg_175_1.time_ and arg_175_1.time_ < var_178_30 + var_178_31 then
				local var_178_32 = (arg_175_1.time_ - var_178_30) / var_178_31
				local var_178_33 = Vector3.New(0, -0.97, -6)

				var_178_29.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1084ui_story, var_178_33, var_178_32)

				local var_178_34 = manager.ui.mainCamera.transform.position - var_178_29.position

				var_178_29.forward = Vector3.New(var_178_34.x, var_178_34.y, var_178_34.z)

				local var_178_35 = var_178_29.localEulerAngles

				var_178_35.z = 0
				var_178_35.x = 0
				var_178_29.localEulerAngles = var_178_35
			end

			if arg_175_1.time_ >= var_178_30 + var_178_31 and arg_175_1.time_ < var_178_30 + var_178_31 + arg_178_0 then
				var_178_29.localPosition = Vector3.New(0, -0.97, -6)

				local var_178_36 = manager.ui.mainCamera.transform.position - var_178_29.position

				var_178_29.forward = Vector3.New(var_178_36.x, var_178_36.y, var_178_36.z)

				local var_178_37 = var_178_29.localEulerAngles

				var_178_37.z = 0
				var_178_37.x = 0
				var_178_29.localEulerAngles = var_178_37
			end

			local var_178_38 = 2.825
			local var_178_39 = 0.175

			if var_178_38 < arg_175_1.time_ and arg_175_1.time_ <= var_178_38 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_40 = arg_175_1:FormatText(StoryNameCfg[6].name)

				arg_175_1.leftNameTxt_.text = var_178_40

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_41 = arg_175_1:GetWordFromCfg(319351042)
				local var_178_42 = arg_175_1:FormatText(var_178_41.content)

				arg_175_1.text_.text = var_178_42

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_43 = 7
				local var_178_44 = utf8.len(var_178_42)
				local var_178_45 = var_178_43 <= 0 and var_178_39 or var_178_39 * (var_178_44 / var_178_43)

				if var_178_45 > 0 and var_178_39 < var_178_45 then
					arg_175_1.talkMaxDuration = var_178_45

					if var_178_45 + var_178_38 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_45 + var_178_38
					end
				end

				arg_175_1.text_.text = var_178_42
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351042", "story_v_out_319351.awb") ~= 0 then
					local var_178_46 = manager.audio:GetVoiceLength("story_v_out_319351", "319351042", "story_v_out_319351.awb") / 1000

					if var_178_46 + var_178_38 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_46 + var_178_38
					end

					if var_178_41.prefab_name ~= "" and arg_175_1.actors_[var_178_41.prefab_name] ~= nil then
						local var_178_47 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_41.prefab_name].transform, "story_v_out_319351", "319351042", "story_v_out_319351.awb")

						arg_175_1:RecordAudio("319351042", var_178_47)
						arg_175_1:RecordAudio("319351042", var_178_47)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_319351", "319351042", "story_v_out_319351.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_319351", "319351042", "story_v_out_319351.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_48 = math.max(var_178_39, arg_175_1.talkMaxDuration)

			if var_178_38 <= arg_175_1.time_ and arg_175_1.time_ < var_178_38 + var_178_48 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_38) / var_178_48

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_38 + var_178_48 and arg_175_1.time_ < var_178_38 + var_178_48 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play319351043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319351043
		arg_179_1.duration_ = 3.833

		local var_179_0 = {
			zh = 3.833,
			ja = 3.666
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
				arg_179_0:Play319351044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1084ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1084ui_story == nil then
				arg_179_1.var_.characterEffect1084ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1084ui_story then
					local var_182_4 = Mathf.Lerp(0, 0.5, var_182_3)

					arg_179_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1084ui_story.fillRatio = var_182_4
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1084ui_story then
				local var_182_5 = 0.5

				arg_179_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1084ui_story.fillRatio = var_182_5
			end

			local var_182_6 = arg_179_1.actors_["1095ui_story"]
			local var_182_7 = 0

			if var_182_7 < arg_179_1.time_ and arg_179_1.time_ <= var_182_7 + arg_182_0 and arg_179_1.var_.characterEffect1095ui_story == nil then
				arg_179_1.var_.characterEffect1095ui_story = var_182_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_8 = 0.200000002980232

			if var_182_7 <= arg_179_1.time_ and arg_179_1.time_ < var_182_7 + var_182_8 then
				local var_182_9 = (arg_179_1.time_ - var_182_7) / var_182_8

				if arg_179_1.var_.characterEffect1095ui_story then
					arg_179_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_7 + var_182_8 and arg_179_1.time_ < var_182_7 + var_182_8 + arg_182_0 and arg_179_1.var_.characterEffect1095ui_story then
				arg_179_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_182_11 = 0

			if var_182_11 < arg_179_1.time_ and arg_179_1.time_ <= var_182_11 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_182_12 = arg_179_1.actors_["1095ui_story"].transform
			local var_182_13 = 0

			if var_182_13 < arg_179_1.time_ and arg_179_1.time_ <= var_182_13 + arg_182_0 then
				arg_179_1.var_.moveOldPos1095ui_story = var_182_12.localPosition
			end

			local var_182_14 = 0.001

			if var_182_13 <= arg_179_1.time_ and arg_179_1.time_ < var_182_13 + var_182_14 then
				local var_182_15 = (arg_179_1.time_ - var_182_13) / var_182_14
				local var_182_16 = Vector3.New(0.7, -0.98, -6.1)

				var_182_12.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1095ui_story, var_182_16, var_182_15)

				local var_182_17 = manager.ui.mainCamera.transform.position - var_182_12.position

				var_182_12.forward = Vector3.New(var_182_17.x, var_182_17.y, var_182_17.z)

				local var_182_18 = var_182_12.localEulerAngles

				var_182_18.z = 0
				var_182_18.x = 0
				var_182_12.localEulerAngles = var_182_18
			end

			if arg_179_1.time_ >= var_182_13 + var_182_14 and arg_179_1.time_ < var_182_13 + var_182_14 + arg_182_0 then
				var_182_12.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_182_19 = manager.ui.mainCamera.transform.position - var_182_12.position

				var_182_12.forward = Vector3.New(var_182_19.x, var_182_19.y, var_182_19.z)

				local var_182_20 = var_182_12.localEulerAngles

				var_182_20.z = 0
				var_182_20.x = 0
				var_182_12.localEulerAngles = var_182_20
			end

			local var_182_21 = arg_179_1.actors_["1084ui_story"].transform
			local var_182_22 = 0

			if var_182_22 < arg_179_1.time_ and arg_179_1.time_ <= var_182_22 + arg_182_0 then
				arg_179_1.var_.moveOldPos1084ui_story = var_182_21.localPosition
			end

			local var_182_23 = 0.001

			if var_182_22 <= arg_179_1.time_ and arg_179_1.time_ < var_182_22 + var_182_23 then
				local var_182_24 = (arg_179_1.time_ - var_182_22) / var_182_23
				local var_182_25 = Vector3.New(-0.7, -0.97, -6)

				var_182_21.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1084ui_story, var_182_25, var_182_24)

				local var_182_26 = manager.ui.mainCamera.transform.position - var_182_21.position

				var_182_21.forward = Vector3.New(var_182_26.x, var_182_26.y, var_182_26.z)

				local var_182_27 = var_182_21.localEulerAngles

				var_182_27.z = 0
				var_182_27.x = 0
				var_182_21.localEulerAngles = var_182_27
			end

			if arg_179_1.time_ >= var_182_22 + var_182_23 and arg_179_1.time_ < var_182_22 + var_182_23 + arg_182_0 then
				var_182_21.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_182_28 = manager.ui.mainCamera.transform.position - var_182_21.position

				var_182_21.forward = Vector3.New(var_182_28.x, var_182_28.y, var_182_28.z)

				local var_182_29 = var_182_21.localEulerAngles

				var_182_29.z = 0
				var_182_29.x = 0
				var_182_21.localEulerAngles = var_182_29
			end

			local var_182_30 = 0
			local var_182_31 = 0.35

			if var_182_30 < arg_179_1.time_ and arg_179_1.time_ <= var_182_30 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_32 = arg_179_1:FormatText(StoryNameCfg[471].name)

				arg_179_1.leftNameTxt_.text = var_182_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_33 = arg_179_1:GetWordFromCfg(319351043)
				local var_182_34 = arg_179_1:FormatText(var_182_33.content)

				arg_179_1.text_.text = var_182_34

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_35 = 14
				local var_182_36 = utf8.len(var_182_34)
				local var_182_37 = var_182_35 <= 0 and var_182_31 or var_182_31 * (var_182_36 / var_182_35)

				if var_182_37 > 0 and var_182_31 < var_182_37 then
					arg_179_1.talkMaxDuration = var_182_37

					if var_182_37 + var_182_30 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_37 + var_182_30
					end
				end

				arg_179_1.text_.text = var_182_34
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319351", "319351043", "story_v_out_319351.awb") ~= 0 then
					local var_182_38 = manager.audio:GetVoiceLength("story_v_out_319351", "319351043", "story_v_out_319351.awb") / 1000

					if var_182_38 + var_182_30 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_38 + var_182_30
					end

					if var_182_33.prefab_name ~= "" and arg_179_1.actors_[var_182_33.prefab_name] ~= nil then
						local var_182_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_33.prefab_name].transform, "story_v_out_319351", "319351043", "story_v_out_319351.awb")

						arg_179_1:RecordAudio("319351043", var_182_39)
						arg_179_1:RecordAudio("319351043", var_182_39)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_319351", "319351043", "story_v_out_319351.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_319351", "319351043", "story_v_out_319351.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_40 = math.max(var_182_31, arg_179_1.talkMaxDuration)

			if var_182_30 <= arg_179_1.time_ and arg_179_1.time_ < var_182_30 + var_182_40 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_30) / var_182_40

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_30 + var_182_40 and arg_179_1.time_ < var_182_30 + var_182_40 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319351044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 319351044
		arg_183_1.duration_ = 9

		SetActive(arg_183_1.tipsGo_, false)

		function arg_183_1.onSingleLineFinish_()
			arg_183_1.onSingleLineUpdate_ = nil
			arg_183_1.onSingleLineFinish_ = nil
			arg_183_1.state_ = "waiting"
		end

		function arg_183_1.playNext_(arg_185_0)
			if arg_185_0 == 1 then
				arg_183_0:Play319351045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = "STwhite"

			if arg_183_1.bgs_[var_186_0] == nil then
				local var_186_1 = Object.Instantiate(arg_183_1.paintGo_)

				var_186_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_186_0)
				var_186_1.name = var_186_0
				var_186_1.transform.parent = arg_183_1.stage_.transform
				var_186_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_183_1.bgs_[var_186_0] = var_186_1
			end

			local var_186_2 = 2

			if var_186_2 < arg_183_1.time_ and arg_183_1.time_ <= var_186_2 + arg_186_0 then
				local var_186_3 = manager.ui.mainCamera.transform.localPosition
				local var_186_4 = Vector3.New(0, 0, 10) + Vector3.New(var_186_3.x, var_186_3.y, 0)
				local var_186_5 = arg_183_1.bgs_.STwhite

				var_186_5.transform.localPosition = var_186_4
				var_186_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_186_6 = var_186_5:GetComponent("SpriteRenderer")

				if var_186_6 and var_186_6.sprite then
					local var_186_7 = (var_186_5.transform.localPosition - var_186_3).z
					local var_186_8 = manager.ui.mainCameraCom_
					local var_186_9 = 2 * var_186_7 * Mathf.Tan(var_186_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_186_10 = var_186_9 * var_186_8.aspect
					local var_186_11 = var_186_6.sprite.bounds.size.x
					local var_186_12 = var_186_6.sprite.bounds.size.y
					local var_186_13 = var_186_10 / var_186_11
					local var_186_14 = var_186_9 / var_186_12
					local var_186_15 = var_186_14 < var_186_13 and var_186_13 or var_186_14

					var_186_5.transform.localScale = Vector3.New(var_186_15, var_186_15, 0)
				end

				for iter_186_0, iter_186_1 in pairs(arg_183_1.bgs_) do
					if iter_186_0 ~= "STwhite" then
						iter_186_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_186_16 = 0

			if var_186_16 < arg_183_1.time_ and arg_183_1.time_ <= var_186_16 + arg_186_0 then
				arg_183_1.mask_.enabled = true
				arg_183_1.mask_.raycastTarget = true

				arg_183_1:SetGaussion(false)
			end

			local var_186_17 = 2

			if var_186_16 <= arg_183_1.time_ and arg_183_1.time_ < var_186_16 + var_186_17 then
				local var_186_18 = (arg_183_1.time_ - var_186_16) / var_186_17
				local var_186_19 = Color.New(0, 0, 0)

				var_186_19.a = Mathf.Lerp(0, 1, var_186_18)
				arg_183_1.mask_.color = var_186_19
			end

			if arg_183_1.time_ >= var_186_16 + var_186_17 and arg_183_1.time_ < var_186_16 + var_186_17 + arg_186_0 then
				local var_186_20 = Color.New(0, 0, 0)

				var_186_20.a = 1
				arg_183_1.mask_.color = var_186_20
			end

			local var_186_21 = 2

			if var_186_21 < arg_183_1.time_ and arg_183_1.time_ <= var_186_21 + arg_186_0 then
				arg_183_1.mask_.enabled = true
				arg_183_1.mask_.raycastTarget = true

				arg_183_1:SetGaussion(false)
			end

			local var_186_22 = 2

			if var_186_21 <= arg_183_1.time_ and arg_183_1.time_ < var_186_21 + var_186_22 then
				local var_186_23 = (arg_183_1.time_ - var_186_21) / var_186_22
				local var_186_24 = Color.New(0, 0, 0)

				var_186_24.a = Mathf.Lerp(1, 0, var_186_23)
				arg_183_1.mask_.color = var_186_24
			end

			if arg_183_1.time_ >= var_186_21 + var_186_22 and arg_183_1.time_ < var_186_21 + var_186_22 + arg_186_0 then
				local var_186_25 = Color.New(0, 0, 0)
				local var_186_26 = 0

				arg_183_1.mask_.enabled = false
				var_186_25.a = var_186_26
				arg_183_1.mask_.color = var_186_25
			end

			local var_186_27 = arg_183_1.actors_["1095ui_story"].transform
			local var_186_28 = 2

			if var_186_28 < arg_183_1.time_ and arg_183_1.time_ <= var_186_28 + arg_186_0 then
				arg_183_1.var_.moveOldPos1095ui_story = var_186_27.localPosition
			end

			local var_186_29 = 0.001

			if var_186_28 <= arg_183_1.time_ and arg_183_1.time_ < var_186_28 + var_186_29 then
				local var_186_30 = (arg_183_1.time_ - var_186_28) / var_186_29
				local var_186_31 = Vector3.New(0, 100, 0)

				var_186_27.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1095ui_story, var_186_31, var_186_30)

				local var_186_32 = manager.ui.mainCamera.transform.position - var_186_27.position

				var_186_27.forward = Vector3.New(var_186_32.x, var_186_32.y, var_186_32.z)

				local var_186_33 = var_186_27.localEulerAngles

				var_186_33.z = 0
				var_186_33.x = 0
				var_186_27.localEulerAngles = var_186_33
			end

			if arg_183_1.time_ >= var_186_28 + var_186_29 and arg_183_1.time_ < var_186_28 + var_186_29 + arg_186_0 then
				var_186_27.localPosition = Vector3.New(0, 100, 0)

				local var_186_34 = manager.ui.mainCamera.transform.position - var_186_27.position

				var_186_27.forward = Vector3.New(var_186_34.x, var_186_34.y, var_186_34.z)

				local var_186_35 = var_186_27.localEulerAngles

				var_186_35.z = 0
				var_186_35.x = 0
				var_186_27.localEulerAngles = var_186_35
			end

			local var_186_36 = arg_183_1.actors_["1095ui_story"]
			local var_186_37 = 2

			if var_186_37 < arg_183_1.time_ and arg_183_1.time_ <= var_186_37 + arg_186_0 and arg_183_1.var_.characterEffect1095ui_story == nil then
				arg_183_1.var_.characterEffect1095ui_story = var_186_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_38 = 0.200000002980232

			if var_186_37 <= arg_183_1.time_ and arg_183_1.time_ < var_186_37 + var_186_38 then
				local var_186_39 = (arg_183_1.time_ - var_186_37) / var_186_38

				if arg_183_1.var_.characterEffect1095ui_story then
					local var_186_40 = Mathf.Lerp(0, 0.5, var_186_39)

					arg_183_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1095ui_story.fillRatio = var_186_40
				end
			end

			if arg_183_1.time_ >= var_186_37 + var_186_38 and arg_183_1.time_ < var_186_37 + var_186_38 + arg_186_0 and arg_183_1.var_.characterEffect1095ui_story then
				local var_186_41 = 0.5

				arg_183_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1095ui_story.fillRatio = var_186_41
			end

			local var_186_42 = arg_183_1.actors_["1084ui_story"]
			local var_186_43 = 2

			if var_186_43 < arg_183_1.time_ and arg_183_1.time_ <= var_186_43 + arg_186_0 and arg_183_1.var_.characterEffect1084ui_story == nil then
				arg_183_1.var_.characterEffect1084ui_story = var_186_42:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_44 = 0.200000002980232

			if var_186_43 <= arg_183_1.time_ and arg_183_1.time_ < var_186_43 + var_186_44 then
				local var_186_45 = (arg_183_1.time_ - var_186_43) / var_186_44

				if arg_183_1.var_.characterEffect1084ui_story then
					local var_186_46 = Mathf.Lerp(0, 0.5, var_186_45)

					arg_183_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1084ui_story.fillRatio = var_186_46
				end
			end

			if arg_183_1.time_ >= var_186_43 + var_186_44 and arg_183_1.time_ < var_186_43 + var_186_44 + arg_186_0 and arg_183_1.var_.characterEffect1084ui_story then
				local var_186_47 = 0.5

				arg_183_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1084ui_story.fillRatio = var_186_47
			end

			local var_186_48 = arg_183_1.actors_["1084ui_story"].transform
			local var_186_49 = 2

			if var_186_49 < arg_183_1.time_ and arg_183_1.time_ <= var_186_49 + arg_186_0 then
				arg_183_1.var_.moveOldPos1084ui_story = var_186_48.localPosition
			end

			local var_186_50 = 0.001

			if var_186_49 <= arg_183_1.time_ and arg_183_1.time_ < var_186_49 + var_186_50 then
				local var_186_51 = (arg_183_1.time_ - var_186_49) / var_186_50
				local var_186_52 = Vector3.New(0, 100, 0)

				var_186_48.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1084ui_story, var_186_52, var_186_51)

				local var_186_53 = manager.ui.mainCamera.transform.position - var_186_48.position

				var_186_48.forward = Vector3.New(var_186_53.x, var_186_53.y, var_186_53.z)

				local var_186_54 = var_186_48.localEulerAngles

				var_186_54.z = 0
				var_186_54.x = 0
				var_186_48.localEulerAngles = var_186_54
			end

			if arg_183_1.time_ >= var_186_49 + var_186_50 and arg_183_1.time_ < var_186_49 + var_186_50 + arg_186_0 then
				var_186_48.localPosition = Vector3.New(0, 100, 0)

				local var_186_55 = manager.ui.mainCamera.transform.position - var_186_48.position

				var_186_48.forward = Vector3.New(var_186_55.x, var_186_55.y, var_186_55.z)

				local var_186_56 = var_186_48.localEulerAngles

				var_186_56.z = 0
				var_186_56.x = 0
				var_186_48.localEulerAngles = var_186_56
			end

			local var_186_57 = 0
			local var_186_58 = 0.9

			if var_186_57 < arg_183_1.time_ and arg_183_1.time_ <= var_186_57 + arg_186_0 then
				local var_186_59 = "play"
				local var_186_60 = "music"

				arg_183_1:AudioAction(var_186_59, var_186_60, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_183_1.frameCnt_ <= 1 then
				arg_183_1.dialog_:SetActive(false)
			end

			local var_186_61 = 4
			local var_186_62 = 0.35

			if var_186_61 < arg_183_1.time_ and arg_183_1.time_ <= var_186_61 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0

				arg_183_1.dialog_:SetActive(true)

				local var_186_63 = LeanTween.value(arg_183_1.dialog_, 0, 1, 0.3)

				var_186_63:setOnUpdate(LuaHelper.FloatAction(function(arg_187_0)
					arg_183_1.dialogCg_.alpha = arg_187_0
				end))
				var_186_63:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_183_1.dialog_)
					var_186_63:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_183_1.duration_ = arg_183_1.duration_ + 0.3

				SetActive(arg_183_1.leftNameGo_, false)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_64 = arg_183_1:GetWordFromCfg(319351044)
				local var_186_65 = arg_183_1:FormatText(var_186_64.content)

				arg_183_1.text_.text = var_186_65

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_66 = 14
				local var_186_67 = utf8.len(var_186_65)
				local var_186_68 = var_186_66 <= 0 and var_186_62 or var_186_62 * (var_186_67 / var_186_66)

				if var_186_68 > 0 and var_186_62 < var_186_68 then
					arg_183_1.talkMaxDuration = var_186_68
					var_186_61 = var_186_61 + 0.3

					if var_186_68 + var_186_61 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_68 + var_186_61
					end
				end

				arg_183_1.text_.text = var_186_65
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)
				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_69 = var_186_61 + 0.3
			local var_186_70 = math.max(var_186_62, arg_183_1.talkMaxDuration)

			if var_186_69 <= arg_183_1.time_ and arg_183_1.time_ < var_186_69 + var_186_70 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_69) / var_186_70

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_69 + var_186_70 and arg_183_1.time_ < var_186_69 + var_186_70 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play319351045 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 319351045
		arg_189_1.duration_ = 7.3921013015788

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play319351046(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = "I11q"

			if arg_189_1.bgs_[var_192_0] == nil then
				local var_192_1 = Object.Instantiate(arg_189_1.paintGo_)

				var_192_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_192_0)
				var_192_1.name = var_192_0
				var_192_1.transform.parent = arg_189_1.stage_.transform
				var_192_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_189_1.bgs_[var_192_0] = var_192_1
			end

			local var_192_2 = 0

			if var_192_2 < arg_189_1.time_ and arg_189_1.time_ <= var_192_2 + arg_192_0 then
				local var_192_3 = manager.ui.mainCamera.transform.localPosition
				local var_192_4 = Vector3.New(0, 0, 10) + Vector3.New(var_192_3.x, var_192_3.y, 0)
				local var_192_5 = arg_189_1.bgs_.I11q

				var_192_5.transform.localPosition = var_192_4
				var_192_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_192_6 = var_192_5:GetComponent("SpriteRenderer")

				if var_192_6 and var_192_6.sprite then
					local var_192_7 = (var_192_5.transform.localPosition - var_192_3).z
					local var_192_8 = manager.ui.mainCameraCom_
					local var_192_9 = 2 * var_192_7 * Mathf.Tan(var_192_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_192_10 = var_192_9 * var_192_8.aspect
					local var_192_11 = var_192_6.sprite.bounds.size.x
					local var_192_12 = var_192_6.sprite.bounds.size.y
					local var_192_13 = var_192_10 / var_192_11
					local var_192_14 = var_192_9 / var_192_12
					local var_192_15 = var_192_14 < var_192_13 and var_192_13 or var_192_14

					var_192_5.transform.localScale = Vector3.New(var_192_15, var_192_15, 0)
				end

				for iter_192_0, iter_192_1 in pairs(arg_189_1.bgs_) do
					if iter_192_0 ~= "I11q" then
						iter_192_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_192_16 = 0

			if var_192_16 < arg_189_1.time_ and arg_189_1.time_ <= var_192_16 + arg_192_0 then
				arg_189_1.mask_.enabled = true
				arg_189_1.mask_.raycastTarget = true

				arg_189_1:SetGaussion(false)
			end

			local var_192_17 = 2.3921013015788

			if var_192_16 <= arg_189_1.time_ and arg_189_1.time_ < var_192_16 + var_192_17 then
				local var_192_18 = (arg_189_1.time_ - var_192_16) / var_192_17
				local var_192_19 = Color.New(1, 1, 1)

				var_192_19.a = Mathf.Lerp(1, 0, var_192_18)
				arg_189_1.mask_.color = var_192_19
			end

			if arg_189_1.time_ >= var_192_16 + var_192_17 and arg_189_1.time_ < var_192_16 + var_192_17 + arg_192_0 then
				local var_192_20 = Color.New(1, 1, 1)
				local var_192_21 = 0

				arg_189_1.mask_.enabled = false
				var_192_20.a = var_192_21
				arg_189_1.mask_.color = var_192_20
			end

			if arg_189_1.frameCnt_ <= 1 then
				arg_189_1.dialog_:SetActive(false)
			end

			local var_192_22 = 2.3921013015788
			local var_192_23 = 0.825

			if var_192_22 < arg_189_1.time_ and arg_189_1.time_ <= var_192_22 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0

				arg_189_1.dialog_:SetActive(true)

				local var_192_24 = LeanTween.value(arg_189_1.dialog_, 0, 1, 0.3)

				var_192_24:setOnUpdate(LuaHelper.FloatAction(function(arg_193_0)
					arg_189_1.dialogCg_.alpha = arg_193_0
				end))
				var_192_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_189_1.dialog_)
					var_192_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_189_1.duration_ = arg_189_1.duration_ + 0.3

				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_25 = arg_189_1:GetWordFromCfg(319351045)
				local var_192_26 = arg_189_1:FormatText(var_192_25.content)

				arg_189_1.text_.text = var_192_26

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_27 = 33
				local var_192_28 = utf8.len(var_192_26)
				local var_192_29 = var_192_27 <= 0 and var_192_23 or var_192_23 * (var_192_28 / var_192_27)

				if var_192_29 > 0 and var_192_23 < var_192_29 then
					arg_189_1.talkMaxDuration = var_192_29
					var_192_22 = var_192_22 + 0.3

					if var_192_29 + var_192_22 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_29 + var_192_22
					end
				end

				arg_189_1.text_.text = var_192_26
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_30 = var_192_22 + 0.3
			local var_192_31 = math.max(var_192_23, arg_189_1.talkMaxDuration)

			if var_192_30 <= arg_189_1.time_ and arg_189_1.time_ < var_192_30 + var_192_31 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_30) / var_192_31

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_30 + var_192_31 and arg_189_1.time_ < var_192_30 + var_192_31 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play319351046 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 319351046
		arg_195_1.duration_ = 5

		SetActive(arg_195_1.tipsGo_, false)

		function arg_195_1.onSingleLineFinish_()
			arg_195_1.onSingleLineUpdate_ = nil
			arg_195_1.onSingleLineFinish_ = nil
			arg_195_1.state_ = "waiting"
		end

		function arg_195_1.playNext_(arg_197_0)
			if arg_197_0 == 1 then
				arg_195_0:Play319351047(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0
			local var_198_1 = 0.725

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, false)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_2 = arg_195_1:GetWordFromCfg(319351046)
				local var_198_3 = arg_195_1:FormatText(var_198_2.content)

				arg_195_1.text_.text = var_198_3

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_4 = 29
				local var_198_5 = utf8.len(var_198_3)
				local var_198_6 = var_198_4 <= 0 and var_198_1 or var_198_1 * (var_198_5 / var_198_4)

				if var_198_6 > 0 and var_198_1 < var_198_6 then
					arg_195_1.talkMaxDuration = var_198_6

					if var_198_6 + var_198_0 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_6 + var_198_0
					end
				end

				arg_195_1.text_.text = var_198_3
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)
				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_7 = math.max(var_198_1, arg_195_1.talkMaxDuration)

			if var_198_0 <= arg_195_1.time_ and arg_195_1.time_ < var_198_0 + var_198_7 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_0) / var_198_7

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_0 + var_198_7 and arg_195_1.time_ < var_198_0 + var_198_7 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play319351047 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319351047
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
			arg_199_1.auto_ = false
		end

		function arg_199_1.playNext_(arg_201_0)
			arg_199_1.onStoryFinished_()
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 0.5

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_2 = arg_199_1:GetWordFromCfg(319351047)
				local var_202_3 = arg_199_1:FormatText(var_202_2.content)

				arg_199_1.text_.text = var_202_3

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_4 = 20
				local var_202_5 = utf8.len(var_202_3)
				local var_202_6 = var_202_4 <= 0 and var_202_1 or var_202_1 * (var_202_5 / var_202_4)

				if var_202_6 > 0 and var_202_1 < var_202_6 then
					arg_199_1.talkMaxDuration = var_202_6

					if var_202_6 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_6 + var_202_0
					end
				end

				arg_199_1.text_.text = var_202_3
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_7 = math.max(var_202_1, arg_199_1.talkMaxDuration)

			if var_202_0 <= arg_199_1.time_ and arg_199_1.time_ < var_202_0 + var_202_7 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_0) / var_202_7

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_0 + var_202_7 and arg_199_1.time_ < var_202_0 + var_202_7 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11o",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STwhite",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I11q"
	},
	voices = {
		"story_v_out_319351.awb"
	}
}
