return {
	Play103701001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 103701001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play103701002(arg_1_1)
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

			local var_4_16 = arg_1_1.bgs_.B13
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB13 = var_4_20.a
					arg_1_1.var_.alphaMatValueB13 = var_4_19
				end

				arg_1_1.var_.alphaOldValueB13 = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB13, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueB13 then
					local var_4_24 = arg_1_1.var_.alphaMatValueB13
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueB13 then
				local var_4_26 = arg_1_1.var_.alphaMatValueB13
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = 0
			local var_4_29 = 1

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				local var_4_30 = "play"
				local var_4_31 = "music"

				arg_1_1:AudioAction(var_4_30, var_4_31, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_32 = 1.5
			local var_4_33 = 0.725

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				local var_4_34 = "play"
				local var_4_35 = "music"

				arg_1_1:AudioAction(var_4_34, var_4_35, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_36 = 2
			local var_4_37 = 0.225

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_38 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_38:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_39 = arg_1_1:GetWordFromCfg(103701001)
				local var_4_40 = arg_1_1:FormatText(var_4_39.content)

				arg_1_1.text_.text = var_4_40

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_41 = 9
				local var_4_42 = utf8.len(var_4_40)
				local var_4_43 = var_4_41 <= 0 and var_4_37 or var_4_37 * (var_4_42 / var_4_41)

				if var_4_43 > 0 and var_4_37 < var_4_43 then
					arg_1_1.talkMaxDuration = var_4_43
					var_4_36 = var_4_36 + 0.3

					if var_4_43 + var_4_36 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_43 + var_4_36
					end
				end

				arg_1_1.text_.text = var_4_40
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_44 = var_4_36 + 0.3
			local var_4_45 = math.max(var_4_37, arg_1_1.talkMaxDuration)

			if var_4_44 <= arg_1_1.time_ and arg_1_1.time_ < var_4_44 + var_4_45 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_44) / var_4_45

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_44 + var_4_45 and arg_1_1.time_ < var_4_44 + var_4_45 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play103701002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 103701002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play103701003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.375

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

				local var_10_2 = arg_7_1:GetWordFromCfg(103701002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 55
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
	Play103701003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 103701003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play103701004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.2

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

				local var_14_2 = arg_11_1:GetWordFromCfg(103701003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 48
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
	Play103701004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 103701004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play103701005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.825

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_2 = arg_15_1:GetWordFromCfg(103701004)
				local var_18_3 = arg_15_1:FormatText(var_18_2.content)

				arg_15_1.text_.text = var_18_3

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_4 = 33
				local var_18_5 = utf8.len(var_18_3)
				local var_18_6 = var_18_4 <= 0 and var_18_1 or var_18_1 * (var_18_5 / var_18_4)

				if var_18_6 > 0 and var_18_1 < var_18_6 then
					arg_15_1.talkMaxDuration = var_18_6

					if var_18_6 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_6 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_3
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_7 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_7 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_7

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_7 and arg_15_1.time_ < var_18_0 + var_18_7 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play103701005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 103701005
		arg_19_1.duration_ = 8

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play103701006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "S0903"

			if arg_19_1.bgs_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(arg_19_1.paintGo_)

				var_22_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_0)
				var_22_1.name = var_22_0
				var_22_1.transform.parent = arg_19_1.stage_.transform
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_0] = var_22_1
			end

			local var_22_2 = 1.5

			if var_22_2 < arg_19_1.time_ and arg_19_1.time_ <= var_22_2 + arg_22_0 then
				local var_22_3 = manager.ui.mainCamera.transform.localPosition
				local var_22_4 = Vector3.New(0, 0, 10) + Vector3.New(var_22_3.x, var_22_3.y, 0)
				local var_22_5 = arg_19_1.bgs_.S0903

				var_22_5.transform.localPosition = var_22_4
				var_22_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_22_6 = var_22_5:GetComponent("SpriteRenderer")

				if var_22_6 and var_22_6.sprite then
					local var_22_7 = (var_22_5.transform.localPosition - var_22_3).z
					local var_22_8 = manager.ui.mainCameraCom_
					local var_22_9 = 2 * var_22_7 * Mathf.Tan(var_22_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_22_10 = var_22_9 * var_22_8.aspect
					local var_22_11 = var_22_6.sprite.bounds.size.x
					local var_22_12 = var_22_6.sprite.bounds.size.y
					local var_22_13 = var_22_10 / var_22_11
					local var_22_14 = var_22_9 / var_22_12
					local var_22_15 = var_22_14 < var_22_13 and var_22_13 or var_22_14

					var_22_5.transform.localScale = Vector3.New(var_22_15, var_22_15, 0)
				end

				for iter_22_0, iter_22_1 in pairs(arg_19_1.bgs_) do
					if iter_22_0 ~= "S0903" then
						iter_22_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_22_16 = arg_19_1.bgs_.B13
			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 then
				local var_22_18 = var_22_16:GetComponent("SpriteRenderer")

				if var_22_18 then
					var_22_18.material = arg_19_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_22_19 = var_22_18.material
					local var_22_20 = var_22_19:GetColor("_Color")

					arg_19_1.var_.alphaOldValueB13 = var_22_20.a
					arg_19_1.var_.alphaMatValueB13 = var_22_19
				end

				arg_19_1.var_.alphaOldValueB13 = 1
			end

			local var_22_21 = 1.5

			if var_22_17 <= arg_19_1.time_ and arg_19_1.time_ < var_22_17 + var_22_21 then
				local var_22_22 = (arg_19_1.time_ - var_22_17) / var_22_21
				local var_22_23 = Mathf.Lerp(arg_19_1.var_.alphaOldValueB13, 0, var_22_22)

				if arg_19_1.var_.alphaMatValueB13 then
					local var_22_24 = arg_19_1.var_.alphaMatValueB13
					local var_22_25 = var_22_24:GetColor("_Color")

					var_22_25.a = var_22_23

					var_22_24:SetColor("_Color", var_22_25)
				end
			end

			if arg_19_1.time_ >= var_22_17 + var_22_21 and arg_19_1.time_ < var_22_17 + var_22_21 + arg_22_0 and arg_19_1.var_.alphaMatValueB13 then
				local var_22_26 = arg_19_1.var_.alphaMatValueB13
				local var_22_27 = var_22_26:GetColor("_Color")

				var_22_27.a = 0

				var_22_26:SetColor("_Color", var_22_27)
			end

			local var_22_28 = arg_19_1.bgs_.S0903
			local var_22_29 = 1.5

			if var_22_29 < arg_19_1.time_ and arg_19_1.time_ <= var_22_29 + arg_22_0 then
				local var_22_30 = var_22_28:GetComponent("SpriteRenderer")

				if var_22_30 then
					var_22_30.material = arg_19_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_22_31 = var_22_30.material
					local var_22_32 = var_22_31:GetColor("_Color")

					arg_19_1.var_.alphaOldValueS0903 = var_22_32.a
					arg_19_1.var_.alphaMatValueS0903 = var_22_31
				end

				arg_19_1.var_.alphaOldValueS0903 = 0
			end

			local var_22_33 = 1.5

			if var_22_29 <= arg_19_1.time_ and arg_19_1.time_ < var_22_29 + var_22_33 then
				local var_22_34 = (arg_19_1.time_ - var_22_29) / var_22_33
				local var_22_35 = Mathf.Lerp(arg_19_1.var_.alphaOldValueS0903, 1, var_22_34)

				if arg_19_1.var_.alphaMatValueS0903 then
					local var_22_36 = arg_19_1.var_.alphaMatValueS0903
					local var_22_37 = var_22_36:GetColor("_Color")

					var_22_37.a = var_22_35

					var_22_36:SetColor("_Color", var_22_37)
				end
			end

			if arg_19_1.time_ >= var_22_29 + var_22_33 and arg_19_1.time_ < var_22_29 + var_22_33 + arg_22_0 and arg_19_1.var_.alphaMatValueS0903 then
				local var_22_38 = arg_19_1.var_.alphaMatValueS0903
				local var_22_39 = var_22_38:GetColor("_Color")

				var_22_39.a = 1

				var_22_38:SetColor("_Color", var_22_39)
			end

			if arg_19_1.frameCnt_ <= 1 then
				arg_19_1.dialog_:SetActive(false)
			end

			local var_22_40 = 3
			local var_22_41 = 0.175

			if var_22_40 < arg_19_1.time_ and arg_19_1.time_ <= var_22_40 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_42 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_42:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_43 = arg_19_1:GetWordFromCfg(103701005)
				local var_22_44 = arg_19_1:FormatText(var_22_43.content)

				arg_19_1.text_.text = var_22_44

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_45 = 7
				local var_22_46 = utf8.len(var_22_44)
				local var_22_47 = var_22_45 <= 0 and var_22_41 or var_22_41 * (var_22_46 / var_22_45)

				if var_22_47 > 0 and var_22_41 < var_22_47 then
					arg_19_1.talkMaxDuration = var_22_47
					var_22_40 = var_22_40 + 0.3

					if var_22_47 + var_22_40 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_47 + var_22_40
					end
				end

				arg_19_1.text_.text = var_22_44
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_48 = var_22_40 + 0.3
			local var_22_49 = math.max(var_22_41, arg_19_1.talkMaxDuration)

			if var_22_48 <= arg_19_1.time_ and arg_19_1.time_ < var_22_48 + var_22_49 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_48) / var_22_49

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_48 + var_22_49 and arg_19_1.time_ < var_22_48 + var_22_49 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play103701006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 103701006
		arg_25_1.duration_ = 12.1

		local var_25_0 = {
			ja = 12.1,
			ko = 7.266,
			en = 10.3
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
				arg_25_0:Play103701007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 1.2

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_2 = arg_25_1:FormatText(StoryNameCfg[5].name)

				arg_25_1.leftNameTxt_.text = var_28_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_3 = arg_25_1:GetWordFromCfg(103701006)
				local var_28_4 = arg_25_1:FormatText(var_28_3.content)

				arg_25_1.text_.text = var_28_4

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_5 = 48
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

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701006", "story_v_side_old_103701.awb") ~= 0 then
					local var_28_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701006", "story_v_side_old_103701.awb") / 1000

					if var_28_8 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_8 + var_28_0
					end

					if var_28_3.prefab_name ~= "" and arg_25_1.actors_[var_28_3.prefab_name] ~= nil then
						local var_28_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_3.prefab_name].transform, "story_v_side_old_103701", "103701006", "story_v_side_old_103701.awb")

						arg_25_1:RecordAudio("103701006", var_28_9)
						arg_25_1:RecordAudio("103701006", var_28_9)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701006", "story_v_side_old_103701.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701006", "story_v_side_old_103701.awb")
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
	Play103701007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 103701007
		arg_29_1.duration_ = 8.333

		local var_29_0 = {
			ja = 8.333,
			ko = 8.166,
			en = 7.233
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
				arg_29_0:Play103701008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 1.025

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_2 = arg_29_1:FormatText(StoryNameCfg[5].name)

				arg_29_1.leftNameTxt_.text = var_32_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_3 = arg_29_1:GetWordFromCfg(103701007)
				local var_32_4 = arg_29_1:FormatText(var_32_3.content)

				arg_29_1.text_.text = var_32_4

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_5 = 41
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

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701007", "story_v_side_old_103701.awb") ~= 0 then
					local var_32_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701007", "story_v_side_old_103701.awb") / 1000

					if var_32_8 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_8 + var_32_0
					end

					if var_32_3.prefab_name ~= "" and arg_29_1.actors_[var_32_3.prefab_name] ~= nil then
						local var_32_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_3.prefab_name].transform, "story_v_side_old_103701", "103701007", "story_v_side_old_103701.awb")

						arg_29_1:RecordAudio("103701007", var_32_9)
						arg_29_1:RecordAudio("103701007", var_32_9)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701007", "story_v_side_old_103701.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701007", "story_v_side_old_103701.awb")
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
	Play103701008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 103701008
		arg_33_1.duration_ = 5

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play103701009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 0.125

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[7].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(103701008)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 5
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
				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_8 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_8 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_8

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_8 and arg_33_1.time_ < var_36_0 + var_36_8 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play103701009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 103701009
		arg_37_1.duration_ = 8.933

		local var_37_0 = {
			ja = 8.933,
			ko = 8.6,
			en = 5.933
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
				arg_37_0:Play103701010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 1.125

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_2 = arg_37_1:FormatText(StoryNameCfg[5].name)

				arg_37_1.leftNameTxt_.text = var_40_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_3 = arg_37_1:GetWordFromCfg(103701009)
				local var_40_4 = arg_37_1:FormatText(var_40_3.content)

				arg_37_1.text_.text = var_40_4

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_5 = 45
				local var_40_6 = utf8.len(var_40_4)
				local var_40_7 = var_40_5 <= 0 and var_40_1 or var_40_1 * (var_40_6 / var_40_5)

				if var_40_7 > 0 and var_40_1 < var_40_7 then
					arg_37_1.talkMaxDuration = var_40_7

					if var_40_7 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_7 + var_40_0
					end
				end

				arg_37_1.text_.text = var_40_4
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701009", "story_v_side_old_103701.awb") ~= 0 then
					local var_40_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701009", "story_v_side_old_103701.awb") / 1000

					if var_40_8 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_8 + var_40_0
					end

					if var_40_3.prefab_name ~= "" and arg_37_1.actors_[var_40_3.prefab_name] ~= nil then
						local var_40_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_3.prefab_name].transform, "story_v_side_old_103701", "103701009", "story_v_side_old_103701.awb")

						arg_37_1:RecordAudio("103701009", var_40_9)
						arg_37_1:RecordAudio("103701009", var_40_9)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701009", "story_v_side_old_103701.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701009", "story_v_side_old_103701.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_10 = math.max(var_40_1, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_10 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_0) / var_40_10

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_10 and arg_37_1.time_ < var_40_0 + var_40_10 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play103701010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 103701010
		arg_41_1.duration_ = 8.5

		local var_41_0 = {
			ja = 8.5,
			ko = 4.933,
			en = 4.933
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
				arg_41_0:Play103701011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.625

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_2 = arg_41_1:FormatText(StoryNameCfg[5].name)

				arg_41_1.leftNameTxt_.text = var_44_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_3 = arg_41_1:GetWordFromCfg(103701010)
				local var_44_4 = arg_41_1:FormatText(var_44_3.content)

				arg_41_1.text_.text = var_44_4

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_5 = 25
				local var_44_6 = utf8.len(var_44_4)
				local var_44_7 = var_44_5 <= 0 and var_44_1 or var_44_1 * (var_44_6 / var_44_5)

				if var_44_7 > 0 and var_44_1 < var_44_7 then
					arg_41_1.talkMaxDuration = var_44_7

					if var_44_7 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_7 + var_44_0
					end
				end

				arg_41_1.text_.text = var_44_4
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701010", "story_v_side_old_103701.awb") ~= 0 then
					local var_44_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701010", "story_v_side_old_103701.awb") / 1000

					if var_44_8 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_8 + var_44_0
					end

					if var_44_3.prefab_name ~= "" and arg_41_1.actors_[var_44_3.prefab_name] ~= nil then
						local var_44_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_3.prefab_name].transform, "story_v_side_old_103701", "103701010", "story_v_side_old_103701.awb")

						arg_41_1:RecordAudio("103701010", var_44_9)
						arg_41_1:RecordAudio("103701010", var_44_9)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701010", "story_v_side_old_103701.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701010", "story_v_side_old_103701.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_10 = math.max(var_44_1, arg_41_1.talkMaxDuration)

			if var_44_0 <= arg_41_1.time_ and arg_41_1.time_ < var_44_0 + var_44_10 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_0) / var_44_10

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_0 + var_44_10 and arg_41_1.time_ < var_44_0 + var_44_10 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play103701011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 103701011
		arg_45_1.duration_ = 9.566

		local var_45_0 = {
			ja = 9.4,
			ko = 9.566,
			en = 8.333
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
				arg_45_0:Play103701012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 0.925

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_2 = arg_45_1:FormatText(StoryNameCfg[5].name)

				arg_45_1.leftNameTxt_.text = var_48_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_3 = arg_45_1:GetWordFromCfg(103701011)
				local var_48_4 = arg_45_1:FormatText(var_48_3.content)

				arg_45_1.text_.text = var_48_4

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_5 = 37
				local var_48_6 = utf8.len(var_48_4)
				local var_48_7 = var_48_5 <= 0 and var_48_1 or var_48_1 * (var_48_6 / var_48_5)

				if var_48_7 > 0 and var_48_1 < var_48_7 then
					arg_45_1.talkMaxDuration = var_48_7

					if var_48_7 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_7 + var_48_0
					end
				end

				arg_45_1.text_.text = var_48_4
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701011", "story_v_side_old_103701.awb") ~= 0 then
					local var_48_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701011", "story_v_side_old_103701.awb") / 1000

					if var_48_8 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_8 + var_48_0
					end

					if var_48_3.prefab_name ~= "" and arg_45_1.actors_[var_48_3.prefab_name] ~= nil then
						local var_48_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_3.prefab_name].transform, "story_v_side_old_103701", "103701011", "story_v_side_old_103701.awb")

						arg_45_1:RecordAudio("103701011", var_48_9)
						arg_45_1:RecordAudio("103701011", var_48_9)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701011", "story_v_side_old_103701.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701011", "story_v_side_old_103701.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_10 = math.max(var_48_1, arg_45_1.talkMaxDuration)

			if var_48_0 <= arg_45_1.time_ and arg_45_1.time_ < var_48_0 + var_48_10 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_0) / var_48_10

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_0 + var_48_10 and arg_45_1.time_ < var_48_0 + var_48_10 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play103701012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 103701012
		arg_49_1.duration_ = 5

		SetActive(arg_49_1.tipsGo_, false)

		function arg_49_1.onSingleLineFinish_()
			arg_49_1.onSingleLineUpdate_ = nil
			arg_49_1.onSingleLineFinish_ = nil
			arg_49_1.state_ = "waiting"
		end

		function arg_49_1.playNext_(arg_51_0)
			if arg_51_0 == 1 then
				arg_49_0:Play103701013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0
			local var_52_1 = 0.725

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, false)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_2 = arg_49_1:GetWordFromCfg(103701012)
				local var_52_3 = arg_49_1:FormatText(var_52_2.content)

				arg_49_1.text_.text = var_52_3

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_4 = 29
				local var_52_5 = utf8.len(var_52_3)
				local var_52_6 = var_52_4 <= 0 and var_52_1 or var_52_1 * (var_52_5 / var_52_4)

				if var_52_6 > 0 and var_52_1 < var_52_6 then
					arg_49_1.talkMaxDuration = var_52_6

					if var_52_6 + var_52_0 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_6 + var_52_0
					end
				end

				arg_49_1.text_.text = var_52_3
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)
				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_7 = math.max(var_52_1, arg_49_1.talkMaxDuration)

			if var_52_0 <= arg_49_1.time_ and arg_49_1.time_ < var_52_0 + var_52_7 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_0) / var_52_7

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_0 + var_52_7 and arg_49_1.time_ < var_52_0 + var_52_7 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play103701013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 103701013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play103701014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = 0
			local var_56_1 = 0.9

			if var_56_0 < arg_53_1.time_ and arg_53_1.time_ <= var_56_0 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, false)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_2 = arg_53_1:GetWordFromCfg(103701013)
				local var_56_3 = arg_53_1:FormatText(var_56_2.content)

				arg_53_1.text_.text = var_56_3

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_4 = 36
				local var_56_5 = utf8.len(var_56_3)
				local var_56_6 = var_56_4 <= 0 and var_56_1 or var_56_1 * (var_56_5 / var_56_4)

				if var_56_6 > 0 and var_56_1 < var_56_6 then
					arg_53_1.talkMaxDuration = var_56_6

					if var_56_6 + var_56_0 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_6 + var_56_0
					end
				end

				arg_53_1.text_.text = var_56_3
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_7 = math.max(var_56_1, arg_53_1.talkMaxDuration)

			if var_56_0 <= arg_53_1.time_ and arg_53_1.time_ < var_56_0 + var_56_7 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_0) / var_56_7

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_0 + var_56_7 and arg_53_1.time_ < var_56_0 + var_56_7 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play103701014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 103701014
		arg_57_1.duration_ = 5

		SetActive(arg_57_1.tipsGo_, false)

		function arg_57_1.onSingleLineFinish_()
			arg_57_1.onSingleLineUpdate_ = nil
			arg_57_1.onSingleLineFinish_ = nil
			arg_57_1.state_ = "waiting"
		end

		function arg_57_1.playNext_(arg_59_0)
			if arg_59_0 == 1 then
				arg_57_0:Play103701015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = 0
			local var_60_1 = 0.475

			if var_60_0 < arg_57_1.time_ and arg_57_1.time_ <= var_60_0 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, false)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_2 = arg_57_1:GetWordFromCfg(103701014)
				local var_60_3 = arg_57_1:FormatText(var_60_2.content)

				arg_57_1.text_.text = var_60_3

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_4 = 19
				local var_60_5 = utf8.len(var_60_3)
				local var_60_6 = var_60_4 <= 0 and var_60_1 or var_60_1 * (var_60_5 / var_60_4)

				if var_60_6 > 0 and var_60_1 < var_60_6 then
					arg_57_1.talkMaxDuration = var_60_6

					if var_60_6 + var_60_0 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_6 + var_60_0
					end
				end

				arg_57_1.text_.text = var_60_3
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)
				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_7 = math.max(var_60_1, arg_57_1.talkMaxDuration)

			if var_60_0 <= arg_57_1.time_ and arg_57_1.time_ < var_60_0 + var_60_7 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_0) / var_60_7

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_0 + var_60_7 and arg_57_1.time_ < var_60_0 + var_60_7 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play103701015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 103701015
		arg_61_1.duration_ = 0.166666666666

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"

			SetActive(arg_61_1.choicesGo_, true)

			for iter_62_0, iter_62_1 in ipairs(arg_61_1.choices_) do
				local var_62_0 = iter_62_0 <= 1

				SetActive(iter_62_1.go, var_62_0)
			end

			arg_61_1.choices_[1].txt.text = arg_61_1:FormatText(StoryChoiceCfg[117].name)
			arg_61_1.choices_[2].txt.text = arg_61_1:FormatText(StoryChoiceCfg[118].name)
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play103701016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			return
		end
	end,
	Play103701016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 103701016
		arg_65_1.duration_ = 9.633

		local var_65_0 = {
			ja = 9.633,
			ko = 8.366,
			en = 7.3
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
				arg_65_0:Play103701017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.825

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[5].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(103701016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 33
				local var_68_6 = utf8.len(var_68_4)
				local var_68_7 = var_68_5 <= 0 and var_68_1 or var_68_1 * (var_68_6 / var_68_5)

				if var_68_7 > 0 and var_68_1 < var_68_7 then
					arg_65_1.talkMaxDuration = var_68_7

					if var_68_7 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_7 + var_68_0
					end
				end

				arg_65_1.text_.text = var_68_4
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701016", "story_v_side_old_103701.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701016", "story_v_side_old_103701.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_side_old_103701", "103701016", "story_v_side_old_103701.awb")

						arg_65_1:RecordAudio("103701016", var_68_9)
						arg_65_1:RecordAudio("103701016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701016", "story_v_side_old_103701.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701016", "story_v_side_old_103701.awb")
				end

				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_10 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_10 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_10

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_10 and arg_65_1.time_ < var_68_0 + var_68_10 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play103701017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 103701017
		arg_69_1.duration_ = 10.2

		local var_69_0 = {
			ja = 7.066,
			ko = 8.066,
			en = 10.2
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
				arg_69_0:Play103701018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 1.05

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_2 = arg_69_1:FormatText(StoryNameCfg[5].name)

				arg_69_1.leftNameTxt_.text = var_72_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_3 = arg_69_1:GetWordFromCfg(103701017)
				local var_72_4 = arg_69_1:FormatText(var_72_3.content)

				arg_69_1.text_.text = var_72_4

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_5 = 42
				local var_72_6 = utf8.len(var_72_4)
				local var_72_7 = var_72_5 <= 0 and var_72_1 or var_72_1 * (var_72_6 / var_72_5)

				if var_72_7 > 0 and var_72_1 < var_72_7 then
					arg_69_1.talkMaxDuration = var_72_7

					if var_72_7 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_7 + var_72_0
					end
				end

				arg_69_1.text_.text = var_72_4
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701017", "story_v_side_old_103701.awb") ~= 0 then
					local var_72_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701017", "story_v_side_old_103701.awb") / 1000

					if var_72_8 + var_72_0 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_8 + var_72_0
					end

					if var_72_3.prefab_name ~= "" and arg_69_1.actors_[var_72_3.prefab_name] ~= nil then
						local var_72_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_3.prefab_name].transform, "story_v_side_old_103701", "103701017", "story_v_side_old_103701.awb")

						arg_69_1:RecordAudio("103701017", var_72_9)
						arg_69_1:RecordAudio("103701017", var_72_9)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701017", "story_v_side_old_103701.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701017", "story_v_side_old_103701.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_10 = math.max(var_72_1, arg_69_1.talkMaxDuration)

			if var_72_0 <= arg_69_1.time_ and arg_69_1.time_ < var_72_0 + var_72_10 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_0) / var_72_10

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_0 + var_72_10 and arg_69_1.time_ < var_72_0 + var_72_10 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play103701018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 103701018
		arg_73_1.duration_ = 8.166

		local var_73_0 = {
			ja = 7.2,
			ko = 6.466,
			en = 8.166
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
				arg_73_0:Play103701019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = 0
			local var_76_1 = 0.7

			if var_76_0 < arg_73_1.time_ and arg_73_1.time_ <= var_76_0 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_2 = arg_73_1:FormatText(StoryNameCfg[5].name)

				arg_73_1.leftNameTxt_.text = var_76_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_3 = arg_73_1:GetWordFromCfg(103701018)
				local var_76_4 = arg_73_1:FormatText(var_76_3.content)

				arg_73_1.text_.text = var_76_4

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701018", "story_v_side_old_103701.awb") ~= 0 then
					local var_76_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701018", "story_v_side_old_103701.awb") / 1000

					if var_76_8 + var_76_0 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_8 + var_76_0
					end

					if var_76_3.prefab_name ~= "" and arg_73_1.actors_[var_76_3.prefab_name] ~= nil then
						local var_76_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_3.prefab_name].transform, "story_v_side_old_103701", "103701018", "story_v_side_old_103701.awb")

						arg_73_1:RecordAudio("103701018", var_76_9)
						arg_73_1:RecordAudio("103701018", var_76_9)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701018", "story_v_side_old_103701.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701018", "story_v_side_old_103701.awb")
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
	Play103701019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 103701019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play103701020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.55

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_2 = arg_77_1:FormatText(StoryNameCfg[7].name)

				arg_77_1.leftNameTxt_.text = var_80_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_3 = arg_77_1:GetWordFromCfg(103701019)
				local var_80_4 = arg_77_1:FormatText(var_80_3.content)

				arg_77_1.text_.text = var_80_4

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_5 = 22
				local var_80_6 = utf8.len(var_80_4)
				local var_80_7 = var_80_5 <= 0 and var_80_1 or var_80_1 * (var_80_6 / var_80_5)

				if var_80_7 > 0 and var_80_1 < var_80_7 then
					arg_77_1.talkMaxDuration = var_80_7

					if var_80_7 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_7 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_4
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_8 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_8 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_8

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_8 and arg_77_1.time_ < var_80_0 + var_80_8 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play103701020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 103701020
		arg_81_1.duration_ = 6.533

		local var_81_0 = {
			ja = 3.666,
			ko = 6.533,
			en = 6.133
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
				arg_81_0:Play103701021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0
			local var_84_1 = 0.65

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_2 = arg_81_1:FormatText(StoryNameCfg[5].name)

				arg_81_1.leftNameTxt_.text = var_84_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_3 = arg_81_1:GetWordFromCfg(103701020)
				local var_84_4 = arg_81_1:FormatText(var_84_3.content)

				arg_81_1.text_.text = var_84_4

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_5 = 26
				local var_84_6 = utf8.len(var_84_4)
				local var_84_7 = var_84_5 <= 0 and var_84_1 or var_84_1 * (var_84_6 / var_84_5)

				if var_84_7 > 0 and var_84_1 < var_84_7 then
					arg_81_1.talkMaxDuration = var_84_7

					if var_84_7 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_7 + var_84_0
					end
				end

				arg_81_1.text_.text = var_84_4
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701020", "story_v_side_old_103701.awb") ~= 0 then
					local var_84_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701020", "story_v_side_old_103701.awb") / 1000

					if var_84_8 + var_84_0 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_8 + var_84_0
					end

					if var_84_3.prefab_name ~= "" and arg_81_1.actors_[var_84_3.prefab_name] ~= nil then
						local var_84_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_3.prefab_name].transform, "story_v_side_old_103701", "103701020", "story_v_side_old_103701.awb")

						arg_81_1:RecordAudio("103701020", var_84_9)
						arg_81_1:RecordAudio("103701020", var_84_9)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701020", "story_v_side_old_103701.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701020", "story_v_side_old_103701.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_10 = math.max(var_84_1, arg_81_1.talkMaxDuration)

			if var_84_0 <= arg_81_1.time_ and arg_81_1.time_ < var_84_0 + var_84_10 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_0) / var_84_10

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_0 + var_84_10 and arg_81_1.time_ < var_84_0 + var_84_10 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play103701021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 103701021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play103701022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.25

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_2 = arg_85_1:FormatText(StoryNameCfg[7].name)

				arg_85_1.leftNameTxt_.text = var_88_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(103701021)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 10
				local var_88_6 = utf8.len(var_88_4)
				local var_88_7 = var_88_5 <= 0 and var_88_1 or var_88_1 * (var_88_6 / var_88_5)

				if var_88_7 > 0 and var_88_1 < var_88_7 then
					arg_85_1.talkMaxDuration = var_88_7

					if var_88_7 + var_88_0 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_7 + var_88_0
					end
				end

				arg_85_1.text_.text = var_88_4
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_8 = math.max(var_88_1, arg_85_1.talkMaxDuration)

			if var_88_0 <= arg_85_1.time_ and arg_85_1.time_ < var_88_0 + var_88_8 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_0) / var_88_8

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_0 + var_88_8 and arg_85_1.time_ < var_88_0 + var_88_8 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play103701022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 103701022
		arg_89_1.duration_ = 8.533

		local var_89_0 = {
			ja = 8.533,
			ko = 6.7,
			en = 5.633
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
				arg_89_0:Play103701023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = 0
			local var_92_1 = 0.575

			if var_92_0 < arg_89_1.time_ and arg_89_1.time_ <= var_92_0 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_2 = arg_89_1:FormatText(StoryNameCfg[5].name)

				arg_89_1.leftNameTxt_.text = var_92_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_3 = arg_89_1:GetWordFromCfg(103701022)
				local var_92_4 = arg_89_1:FormatText(var_92_3.content)

				arg_89_1.text_.text = var_92_4

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701022", "story_v_side_old_103701.awb") ~= 0 then
					local var_92_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701022", "story_v_side_old_103701.awb") / 1000

					if var_92_8 + var_92_0 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_8 + var_92_0
					end

					if var_92_3.prefab_name ~= "" and arg_89_1.actors_[var_92_3.prefab_name] ~= nil then
						local var_92_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_3.prefab_name].transform, "story_v_side_old_103701", "103701022", "story_v_side_old_103701.awb")

						arg_89_1:RecordAudio("103701022", var_92_9)
						arg_89_1:RecordAudio("103701022", var_92_9)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701022", "story_v_side_old_103701.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701022", "story_v_side_old_103701.awb")
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
	Play103701023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 103701023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play103701024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0
			local var_96_1 = 0.45

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_2 = arg_93_1:FormatText(StoryNameCfg[7].name)

				arg_93_1.leftNameTxt_.text = var_96_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_3 = arg_93_1:GetWordFromCfg(103701023)
				local var_96_4 = arg_93_1:FormatText(var_96_3.content)

				arg_93_1.text_.text = var_96_4

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_5 = 18
				local var_96_6 = utf8.len(var_96_4)
				local var_96_7 = var_96_5 <= 0 and var_96_1 or var_96_1 * (var_96_6 / var_96_5)

				if var_96_7 > 0 and var_96_1 < var_96_7 then
					arg_93_1.talkMaxDuration = var_96_7

					if var_96_7 + var_96_0 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_7 + var_96_0
					end
				end

				arg_93_1.text_.text = var_96_4
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_8 = math.max(var_96_1, arg_93_1.talkMaxDuration)

			if var_96_0 <= arg_93_1.time_ and arg_93_1.time_ < var_96_0 + var_96_8 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_0) / var_96_8

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_0 + var_96_8 and arg_93_1.time_ < var_96_0 + var_96_8 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play103701024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 103701024
		arg_97_1.duration_ = 4.966

		local var_97_0 = {
			ja = 4.633,
			ko = 4.366,
			en = 4.966
		}
		local var_97_1 = manager.audio:GetLocalizationFlag()

		if var_97_0[var_97_1] ~= nil then
			arg_97_1.duration_ = var_97_0[var_97_1]
		end

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play103701025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.525

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[5].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(103701024)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 21
				local var_100_6 = utf8.len(var_100_4)
				local var_100_7 = var_100_5 <= 0 and var_100_1 or var_100_1 * (var_100_6 / var_100_5)

				if var_100_7 > 0 and var_100_1 < var_100_7 then
					arg_97_1.talkMaxDuration = var_100_7

					if var_100_7 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_7 + var_100_0
					end
				end

				arg_97_1.text_.text = var_100_4
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701024", "story_v_side_old_103701.awb") ~= 0 then
					local var_100_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701024", "story_v_side_old_103701.awb") / 1000

					if var_100_8 + var_100_0 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_8 + var_100_0
					end

					if var_100_3.prefab_name ~= "" and arg_97_1.actors_[var_100_3.prefab_name] ~= nil then
						local var_100_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_3.prefab_name].transform, "story_v_side_old_103701", "103701024", "story_v_side_old_103701.awb")

						arg_97_1:RecordAudio("103701024", var_100_9)
						arg_97_1:RecordAudio("103701024", var_100_9)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701024", "story_v_side_old_103701.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701024", "story_v_side_old_103701.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_10 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_10 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_10

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_10 and arg_97_1.time_ < var_100_0 + var_100_10 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play103701025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 103701025
		arg_101_1.duration_ = 9.933

		local var_101_0 = {
			ja = 5.1,
			ko = 8.6,
			en = 9.933
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
				arg_101_0:Play103701026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0
			local var_104_1 = 1.225

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_2 = arg_101_1:FormatText(StoryNameCfg[5].name)

				arg_101_1.leftNameTxt_.text = var_104_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_3 = arg_101_1:GetWordFromCfg(103701025)
				local var_104_4 = arg_101_1:FormatText(var_104_3.content)

				arg_101_1.text_.text = var_104_4

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701025", "story_v_side_old_103701.awb") ~= 0 then
					local var_104_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701025", "story_v_side_old_103701.awb") / 1000

					if var_104_8 + var_104_0 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_0
					end

					if var_104_3.prefab_name ~= "" and arg_101_1.actors_[var_104_3.prefab_name] ~= nil then
						local var_104_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_3.prefab_name].transform, "story_v_side_old_103701", "103701025", "story_v_side_old_103701.awb")

						arg_101_1:RecordAudio("103701025", var_104_9)
						arg_101_1:RecordAudio("103701025", var_104_9)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701025", "story_v_side_old_103701.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701025", "story_v_side_old_103701.awb")
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
	Play103701026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 103701026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play103701027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.675

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[7].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(103701026)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 27
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
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_8 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_8 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_8

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_8 and arg_105_1.time_ < var_108_0 + var_108_8 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play103701027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 103701027
		arg_109_1.duration_ = 6.533

		local var_109_0 = {
			ja = 6.1,
			ko = 6.533,
			en = 5.633
		}
		local var_109_1 = manager.audio:GetLocalizationFlag()

		if var_109_0[var_109_1] ~= nil then
			arg_109_1.duration_ = var_109_0[var_109_1]
		end

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play103701028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.6

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[5].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(103701027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 24
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701027", "story_v_side_old_103701.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701027", "story_v_side_old_103701.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_side_old_103701", "103701027", "story_v_side_old_103701.awb")

						arg_109_1:RecordAudio("103701027", var_112_9)
						arg_109_1:RecordAudio("103701027", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701027", "story_v_side_old_103701.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701027", "story_v_side_old_103701.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_10 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_10 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_10

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_10 and arg_109_1.time_ < var_112_0 + var_112_10 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play103701028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 103701028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play103701029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 0.375

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_2 = arg_113_1:FormatText(StoryNameCfg[7].name)

				arg_113_1.leftNameTxt_.text = var_116_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_3 = arg_113_1:GetWordFromCfg(103701028)
				local var_116_4 = arg_113_1:FormatText(var_116_3.content)

				arg_113_1.text_.text = var_116_4

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_5 = 15
				local var_116_6 = utf8.len(var_116_4)
				local var_116_7 = var_116_5 <= 0 and var_116_1 or var_116_1 * (var_116_6 / var_116_5)

				if var_116_7 > 0 and var_116_1 < var_116_7 then
					arg_113_1.talkMaxDuration = var_116_7

					if var_116_7 + var_116_0 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_7 + var_116_0
					end
				end

				arg_113_1.text_.text = var_116_4
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_8 = math.max(var_116_1, arg_113_1.talkMaxDuration)

			if var_116_0 <= arg_113_1.time_ and arg_113_1.time_ < var_116_0 + var_116_8 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_0) / var_116_8

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_0 + var_116_8 and arg_113_1.time_ < var_116_0 + var_116_8 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play103701029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 103701029
		arg_117_1.duration_ = 6.8

		local var_117_0 = {
			ja = 5.233,
			ko = 6.8,
			en = 6.633
		}
		local var_117_1 = manager.audio:GetLocalizationFlag()

		if var_117_0[var_117_1] ~= nil then
			arg_117_1.duration_ = var_117_0[var_117_1]
		end

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play103701030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 0.975

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_2 = arg_117_1:FormatText(StoryNameCfg[5].name)

				arg_117_1.leftNameTxt_.text = var_120_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_3 = arg_117_1:GetWordFromCfg(103701029)
				local var_120_4 = arg_117_1:FormatText(var_120_3.content)

				arg_117_1.text_.text = var_120_4

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_5 = 39
				local var_120_6 = utf8.len(var_120_4)
				local var_120_7 = var_120_5 <= 0 and var_120_1 or var_120_1 * (var_120_6 / var_120_5)

				if var_120_7 > 0 and var_120_1 < var_120_7 then
					arg_117_1.talkMaxDuration = var_120_7

					if var_120_7 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_7 + var_120_0
					end
				end

				arg_117_1.text_.text = var_120_4
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701029", "story_v_side_old_103701.awb") ~= 0 then
					local var_120_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701029", "story_v_side_old_103701.awb") / 1000

					if var_120_8 + var_120_0 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_0
					end

					if var_120_3.prefab_name ~= "" and arg_117_1.actors_[var_120_3.prefab_name] ~= nil then
						local var_120_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_3.prefab_name].transform, "story_v_side_old_103701", "103701029", "story_v_side_old_103701.awb")

						arg_117_1:RecordAudio("103701029", var_120_9)
						arg_117_1:RecordAudio("103701029", var_120_9)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701029", "story_v_side_old_103701.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701029", "story_v_side_old_103701.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_10 = math.max(var_120_1, arg_117_1.talkMaxDuration)

			if var_120_0 <= arg_117_1.time_ and arg_117_1.time_ < var_120_0 + var_120_10 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_0) / var_120_10

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_0 + var_120_10 and arg_117_1.time_ < var_120_0 + var_120_10 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play103701030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 103701030
		arg_121_1.duration_ = 5.033

		local var_121_0 = {
			ja = 3.566,
			ko = 5.033,
			en = 4.433
		}
		local var_121_1 = manager.audio:GetLocalizationFlag()

		if var_121_0[var_121_1] ~= nil then
			arg_121_1.duration_ = var_121_0[var_121_1]
		end

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play103701031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.475

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_2 = arg_121_1:FormatText(StoryNameCfg[5].name)

				arg_121_1.leftNameTxt_.text = var_124_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_3 = arg_121_1:GetWordFromCfg(103701030)
				local var_124_4 = arg_121_1:FormatText(var_124_3.content)

				arg_121_1.text_.text = var_124_4

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_5 = 19
				local var_124_6 = utf8.len(var_124_4)
				local var_124_7 = var_124_5 <= 0 and var_124_1 or var_124_1 * (var_124_6 / var_124_5)

				if var_124_7 > 0 and var_124_1 < var_124_7 then
					arg_121_1.talkMaxDuration = var_124_7

					if var_124_7 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_7 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_4
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701030", "story_v_side_old_103701.awb") ~= 0 then
					local var_124_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701030", "story_v_side_old_103701.awb") / 1000

					if var_124_8 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_8 + var_124_0
					end

					if var_124_3.prefab_name ~= "" and arg_121_1.actors_[var_124_3.prefab_name] ~= nil then
						local var_124_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_3.prefab_name].transform, "story_v_side_old_103701", "103701030", "story_v_side_old_103701.awb")

						arg_121_1:RecordAudio("103701030", var_124_9)
						arg_121_1:RecordAudio("103701030", var_124_9)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701030", "story_v_side_old_103701.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701030", "story_v_side_old_103701.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_10 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_10 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_10

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_10 and arg_121_1.time_ < var_124_0 + var_124_10 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play103701031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 103701031
		arg_125_1.duration_ = 8

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play103701032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 1.5

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				local var_128_1 = manager.ui.mainCamera.transform.localPosition
				local var_128_2 = Vector3.New(0, 0, 10) + Vector3.New(var_128_1.x, var_128_1.y, 0)
				local var_128_3 = arg_125_1.bgs_.B13

				var_128_3.transform.localPosition = var_128_2
				var_128_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_128_4 = var_128_3:GetComponent("SpriteRenderer")

				if var_128_4 and var_128_4.sprite then
					local var_128_5 = (var_128_3.transform.localPosition - var_128_1).z
					local var_128_6 = manager.ui.mainCameraCom_
					local var_128_7 = 2 * var_128_5 * Mathf.Tan(var_128_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_128_8 = var_128_7 * var_128_6.aspect
					local var_128_9 = var_128_4.sprite.bounds.size.x
					local var_128_10 = var_128_4.sprite.bounds.size.y
					local var_128_11 = var_128_8 / var_128_9
					local var_128_12 = var_128_7 / var_128_10
					local var_128_13 = var_128_12 < var_128_11 and var_128_11 or var_128_12

					var_128_3.transform.localScale = Vector3.New(var_128_13, var_128_13, 0)
				end

				for iter_128_0, iter_128_1 in pairs(arg_125_1.bgs_) do
					if iter_128_0 ~= "B13" then
						iter_128_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_128_14 = arg_125_1.bgs_.S0903
			local var_128_15 = 0

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				local var_128_16 = var_128_14:GetComponent("SpriteRenderer")

				if var_128_16 then
					var_128_16.material = arg_125_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_128_17 = var_128_16.material
					local var_128_18 = var_128_17:GetColor("_Color")

					arg_125_1.var_.alphaOldValueS0903 = var_128_18.a
					arg_125_1.var_.alphaMatValueS0903 = var_128_17
				end

				arg_125_1.var_.alphaOldValueS0903 = 1
			end

			local var_128_19 = 1.5

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_19 then
				local var_128_20 = (arg_125_1.time_ - var_128_15) / var_128_19
				local var_128_21 = Mathf.Lerp(arg_125_1.var_.alphaOldValueS0903, 0, var_128_20)

				if arg_125_1.var_.alphaMatValueS0903 then
					local var_128_22 = arg_125_1.var_.alphaMatValueS0903
					local var_128_23 = var_128_22:GetColor("_Color")

					var_128_23.a = var_128_21

					var_128_22:SetColor("_Color", var_128_23)
				end
			end

			if arg_125_1.time_ >= var_128_15 + var_128_19 and arg_125_1.time_ < var_128_15 + var_128_19 + arg_128_0 and arg_125_1.var_.alphaMatValueS0903 then
				local var_128_24 = arg_125_1.var_.alphaMatValueS0903
				local var_128_25 = var_128_24:GetColor("_Color")

				var_128_25.a = 0

				var_128_24:SetColor("_Color", var_128_25)
			end

			local var_128_26 = arg_125_1.bgs_.B13
			local var_128_27 = 1.5

			if var_128_27 < arg_125_1.time_ and arg_125_1.time_ <= var_128_27 + arg_128_0 then
				local var_128_28 = var_128_26:GetComponent("SpriteRenderer")

				if var_128_28 then
					var_128_28.material = arg_125_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_128_29 = var_128_28.material
					local var_128_30 = var_128_29:GetColor("_Color")

					arg_125_1.var_.alphaOldValueB13 = var_128_30.a
					arg_125_1.var_.alphaMatValueB13 = var_128_29
				end

				arg_125_1.var_.alphaOldValueB13 = 0
			end

			local var_128_31 = 1.5

			if var_128_27 <= arg_125_1.time_ and arg_125_1.time_ < var_128_27 + var_128_31 then
				local var_128_32 = (arg_125_1.time_ - var_128_27) / var_128_31
				local var_128_33 = Mathf.Lerp(arg_125_1.var_.alphaOldValueB13, 1, var_128_32)

				if arg_125_1.var_.alphaMatValueB13 then
					local var_128_34 = arg_125_1.var_.alphaMatValueB13
					local var_128_35 = var_128_34:GetColor("_Color")

					var_128_35.a = var_128_33

					var_128_34:SetColor("_Color", var_128_35)
				end
			end

			if arg_125_1.time_ >= var_128_27 + var_128_31 and arg_125_1.time_ < var_128_27 + var_128_31 + arg_128_0 and arg_125_1.var_.alphaMatValueB13 then
				local var_128_36 = arg_125_1.var_.alphaMatValueB13
				local var_128_37 = var_128_36:GetColor("_Color")

				var_128_37.a = 1

				var_128_36:SetColor("_Color", var_128_37)
			end

			if arg_125_1.frameCnt_ <= 1 then
				arg_125_1.dialog_:SetActive(false)
			end

			local var_128_38 = 3
			local var_128_39 = 0.35

			if var_128_38 < arg_125_1.time_ and arg_125_1.time_ <= var_128_38 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0

				arg_125_1.dialog_:SetActive(true)

				local var_128_40 = LeanTween.value(arg_125_1.dialog_, 0, 1, 0.3)

				var_128_40:setOnUpdate(LuaHelper.FloatAction(function(arg_129_0)
					arg_125_1.dialogCg_.alpha = arg_129_0
				end))
				var_128_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_125_1.dialog_)
					var_128_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_125_1.duration_ = arg_125_1.duration_ + 0.3

				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_41 = arg_125_1:GetWordFromCfg(103701031)
				local var_128_42 = arg_125_1:FormatText(var_128_41.content)

				arg_125_1.text_.text = var_128_42

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_43 = 14
				local var_128_44 = utf8.len(var_128_42)
				local var_128_45 = var_128_43 <= 0 and var_128_39 or var_128_39 * (var_128_44 / var_128_43)

				if var_128_45 > 0 and var_128_39 < var_128_45 then
					arg_125_1.talkMaxDuration = var_128_45
					var_128_38 = var_128_38 + 0.3

					if var_128_45 + var_128_38 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_45 + var_128_38
					end
				end

				arg_125_1.text_.text = var_128_42
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_46 = var_128_38 + 0.3
			local var_128_47 = math.max(var_128_39, arg_125_1.talkMaxDuration)

			if var_128_46 <= arg_125_1.time_ and arg_125_1.time_ < var_128_46 + var_128_47 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_46) / var_128_47

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_46 + var_128_47 and arg_125_1.time_ < var_128_46 + var_128_47 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play103701032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 103701032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play103701033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 1

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				local var_134_2 = "play"
				local var_134_3 = "effect"

				arg_131_1:AudioAction(var_134_2, var_134_3, "se_story_side_1037", "se_story_1037_knock", "")
			end

			local var_134_4 = 0
			local var_134_5 = 1.05

			if var_134_4 < arg_131_1.time_ and arg_131_1.time_ <= var_134_4 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_6 = arg_131_1:GetWordFromCfg(103701032)
				local var_134_7 = arg_131_1:FormatText(var_134_6.content)

				arg_131_1.text_.text = var_134_7

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_8 = 42
				local var_134_9 = utf8.len(var_134_7)
				local var_134_10 = var_134_8 <= 0 and var_134_5 or var_134_5 * (var_134_9 / var_134_8)

				if var_134_10 > 0 and var_134_5 < var_134_10 then
					arg_131_1.talkMaxDuration = var_134_10

					if var_134_10 + var_134_4 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_10 + var_134_4
					end
				end

				arg_131_1.text_.text = var_134_7
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_11 = math.max(var_134_5, arg_131_1.talkMaxDuration)

			if var_134_4 <= arg_131_1.time_ and arg_131_1.time_ < var_134_4 + var_134_11 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_4) / var_134_11

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_4 + var_134_11 and arg_131_1.time_ < var_134_4 + var_134_11 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play103701033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 103701033
		arg_135_1.duration_ = 8

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play103701034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = "ST13"

			if arg_135_1.bgs_[var_138_0] == nil then
				local var_138_1 = Object.Instantiate(arg_135_1.paintGo_)

				var_138_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_138_0)
				var_138_1.name = var_138_0
				var_138_1.transform.parent = arg_135_1.stage_.transform
				var_138_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_135_1.bgs_[var_138_0] = var_138_1
			end

			local var_138_2 = 1.5

			if var_138_2 < arg_135_1.time_ and arg_135_1.time_ <= var_138_2 + arg_138_0 then
				local var_138_3 = manager.ui.mainCamera.transform.localPosition
				local var_138_4 = Vector3.New(0, 0, 10) + Vector3.New(var_138_3.x, var_138_3.y, 0)
				local var_138_5 = arg_135_1.bgs_.ST13

				var_138_5.transform.localPosition = var_138_4
				var_138_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_138_6 = var_138_5:GetComponent("SpriteRenderer")

				if var_138_6 and var_138_6.sprite then
					local var_138_7 = (var_138_5.transform.localPosition - var_138_3).z
					local var_138_8 = manager.ui.mainCameraCom_
					local var_138_9 = 2 * var_138_7 * Mathf.Tan(var_138_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_138_10 = var_138_9 * var_138_8.aspect
					local var_138_11 = var_138_6.sprite.bounds.size.x
					local var_138_12 = var_138_6.sprite.bounds.size.y
					local var_138_13 = var_138_10 / var_138_11
					local var_138_14 = var_138_9 / var_138_12
					local var_138_15 = var_138_14 < var_138_13 and var_138_13 or var_138_14

					var_138_5.transform.localScale = Vector3.New(var_138_15, var_138_15, 0)
				end

				for iter_138_0, iter_138_1 in pairs(arg_135_1.bgs_) do
					if iter_138_0 ~= "ST13" then
						iter_138_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_138_16 = arg_135_1.bgs_.B13
			local var_138_17 = 0

			if var_138_17 < arg_135_1.time_ and arg_135_1.time_ <= var_138_17 + arg_138_0 then
				local var_138_18 = var_138_16:GetComponent("SpriteRenderer")

				if var_138_18 then
					var_138_18.material = arg_135_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_138_19 = var_138_18.material
					local var_138_20 = var_138_19:GetColor("_Color")

					arg_135_1.var_.alphaOldValueB13 = var_138_20.a
					arg_135_1.var_.alphaMatValueB13 = var_138_19
				end

				arg_135_1.var_.alphaOldValueB13 = 1
			end

			local var_138_21 = 1.5

			if var_138_17 <= arg_135_1.time_ and arg_135_1.time_ < var_138_17 + var_138_21 then
				local var_138_22 = (arg_135_1.time_ - var_138_17) / var_138_21
				local var_138_23 = Mathf.Lerp(arg_135_1.var_.alphaOldValueB13, 0, var_138_22)

				if arg_135_1.var_.alphaMatValueB13 then
					local var_138_24 = arg_135_1.var_.alphaMatValueB13
					local var_138_25 = var_138_24:GetColor("_Color")

					var_138_25.a = var_138_23

					var_138_24:SetColor("_Color", var_138_25)
				end
			end

			if arg_135_1.time_ >= var_138_17 + var_138_21 and arg_135_1.time_ < var_138_17 + var_138_21 + arg_138_0 and arg_135_1.var_.alphaMatValueB13 then
				local var_138_26 = arg_135_1.var_.alphaMatValueB13
				local var_138_27 = var_138_26:GetColor("_Color")

				var_138_27.a = 0

				var_138_26:SetColor("_Color", var_138_27)
			end

			local var_138_28 = arg_135_1.bgs_.ST13
			local var_138_29 = 1.5

			if var_138_29 < arg_135_1.time_ and arg_135_1.time_ <= var_138_29 + arg_138_0 then
				local var_138_30 = var_138_28:GetComponent("SpriteRenderer")

				if var_138_30 then
					var_138_30.material = arg_135_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_138_31 = var_138_30.material
					local var_138_32 = var_138_31:GetColor("_Color")

					arg_135_1.var_.alphaOldValueST13 = var_138_32.a
					arg_135_1.var_.alphaMatValueST13 = var_138_31
				end

				arg_135_1.var_.alphaOldValueST13 = 0
			end

			local var_138_33 = 1.5

			if var_138_29 <= arg_135_1.time_ and arg_135_1.time_ < var_138_29 + var_138_33 then
				local var_138_34 = (arg_135_1.time_ - var_138_29) / var_138_33
				local var_138_35 = Mathf.Lerp(arg_135_1.var_.alphaOldValueST13, 1, var_138_34)

				if arg_135_1.var_.alphaMatValueST13 then
					local var_138_36 = arg_135_1.var_.alphaMatValueST13
					local var_138_37 = var_138_36:GetColor("_Color")

					var_138_37.a = var_138_35

					var_138_36:SetColor("_Color", var_138_37)
				end
			end

			if arg_135_1.time_ >= var_138_29 + var_138_33 and arg_135_1.time_ < var_138_29 + var_138_33 + arg_138_0 and arg_135_1.var_.alphaMatValueST13 then
				local var_138_38 = arg_135_1.var_.alphaMatValueST13
				local var_138_39 = var_138_38:GetColor("_Color")

				var_138_39.a = 1

				var_138_38:SetColor("_Color", var_138_39)
			end

			if arg_135_1.frameCnt_ <= 1 then
				arg_135_1.dialog_:SetActive(false)
			end

			local var_138_40 = 3
			local var_138_41 = 0.775

			if var_138_40 < arg_135_1.time_ and arg_135_1.time_ <= var_138_40 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0

				arg_135_1.dialog_:SetActive(true)

				local var_138_42 = LeanTween.value(arg_135_1.dialog_, 0, 1, 0.3)

				var_138_42:setOnUpdate(LuaHelper.FloatAction(function(arg_139_0)
					arg_135_1.dialogCg_.alpha = arg_139_0
				end))
				var_138_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_135_1.dialog_)
					var_138_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_135_1.duration_ = arg_135_1.duration_ + 0.3

				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_43 = arg_135_1:GetWordFromCfg(103701033)
				local var_138_44 = arg_135_1:FormatText(var_138_43.content)

				arg_135_1.text_.text = var_138_44

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_45 = 31
				local var_138_46 = utf8.len(var_138_44)
				local var_138_47 = var_138_45 <= 0 and var_138_41 or var_138_41 * (var_138_46 / var_138_45)

				if var_138_47 > 0 and var_138_41 < var_138_47 then
					arg_135_1.talkMaxDuration = var_138_47
					var_138_40 = var_138_40 + 0.3

					if var_138_47 + var_138_40 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_47 + var_138_40
					end
				end

				arg_135_1.text_.text = var_138_44
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_48 = var_138_40 + 0.3
			local var_138_49 = math.max(var_138_41, arg_135_1.talkMaxDuration)

			if var_138_48 <= arg_135_1.time_ and arg_135_1.time_ < var_138_48 + var_138_49 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_48) / var_138_49

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_48 + var_138_49 and arg_135_1.time_ < var_138_48 + var_138_49 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play103701034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 103701034
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play103701035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 1.4

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, false)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_2 = arg_141_1:GetWordFromCfg(103701034)
				local var_144_3 = arg_141_1:FormatText(var_144_2.content)

				arg_141_1.text_.text = var_144_3

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_4 = 56
				local var_144_5 = utf8.len(var_144_3)
				local var_144_6 = var_144_4 <= 0 and var_144_1 or var_144_1 * (var_144_5 / var_144_4)

				if var_144_6 > 0 and var_144_1 < var_144_6 then
					arg_141_1.talkMaxDuration = var_144_6

					if var_144_6 + var_144_0 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_6 + var_144_0
					end
				end

				arg_141_1.text_.text = var_144_3
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)
				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_7 = math.max(var_144_1, arg_141_1.talkMaxDuration)

			if var_144_0 <= arg_141_1.time_ and arg_141_1.time_ < var_144_0 + var_144_7 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_0) / var_144_7

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_0 + var_144_7 and arg_141_1.time_ < var_144_0 + var_144_7 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play103701035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 103701035
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play103701036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 1.2

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

				local var_148_2 = arg_145_1:GetWordFromCfg(103701035)
				local var_148_3 = arg_145_1:FormatText(var_148_2.content)

				arg_145_1.text_.text = var_148_3

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_4 = 48
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
	Play103701036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 103701036
		arg_149_1.duration_ = 12.2

		local var_149_0 = {
			ja = 12.2,
			ko = 5.933,
			en = 5.2
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
				arg_149_0:Play103701037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.375

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[15].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, true)
				arg_149_1.iconController_:SetSelectedState("hero")

				arg_149_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1037")

				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(103701036)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 15
				local var_152_6 = utf8.len(var_152_4)
				local var_152_7 = var_152_5 <= 0 and var_152_1 or var_152_1 * (var_152_6 / var_152_5)

				if var_152_7 > 0 and var_152_1 < var_152_7 then
					arg_149_1.talkMaxDuration = var_152_7

					if var_152_7 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_7 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_4
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701036", "story_v_side_old_103701.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701036", "story_v_side_old_103701.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_side_old_103701", "103701036", "story_v_side_old_103701.awb")

						arg_149_1:RecordAudio("103701036", var_152_9)
						arg_149_1:RecordAudio("103701036", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701036", "story_v_side_old_103701.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701036", "story_v_side_old_103701.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_10 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_10 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_10

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_10 and arg_149_1.time_ < var_152_0 + var_152_10 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play103701037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 103701037
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play103701038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.8

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_2 = arg_153_1:GetWordFromCfg(103701037)
				local var_156_3 = arg_153_1:FormatText(var_156_2.content)

				arg_153_1.text_.text = var_156_3

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_4 = 32
				local var_156_5 = utf8.len(var_156_3)
				local var_156_6 = var_156_4 <= 0 and var_156_1 or var_156_1 * (var_156_5 / var_156_4)

				if var_156_6 > 0 and var_156_1 < var_156_6 then
					arg_153_1.talkMaxDuration = var_156_6

					if var_156_6 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_6 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_3
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_7 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_7 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_7

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_7 and arg_153_1.time_ < var_156_0 + var_156_7 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play103701038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 103701038
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play103701039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 0
			local var_160_1 = 1

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				local var_160_2 = "play"
				local var_160_3 = "effect"

				arg_157_1:AudioAction(var_160_2, var_160_3, "se_story_side_1037", "se_story_1037_doorbell", "")
			end

			local var_160_4 = 0
			local var_160_5 = 0.15

			if var_160_4 < arg_157_1.time_ and arg_157_1.time_ <= var_160_4 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_6 = arg_157_1:GetWordFromCfg(103701038)
				local var_160_7 = arg_157_1:FormatText(var_160_6.content)

				arg_157_1.text_.text = var_160_7

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_8 = 6
				local var_160_9 = utf8.len(var_160_7)
				local var_160_10 = var_160_8 <= 0 and var_160_5 or var_160_5 * (var_160_9 / var_160_8)

				if var_160_10 > 0 and var_160_5 < var_160_10 then
					arg_157_1.talkMaxDuration = var_160_10

					if var_160_10 + var_160_4 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_10 + var_160_4
					end
				end

				arg_157_1.text_.text = var_160_7
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_11 = math.max(var_160_5, arg_157_1.talkMaxDuration)

			if var_160_4 <= arg_157_1.time_ and arg_157_1.time_ < var_160_4 + var_160_11 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_4) / var_160_11

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_4 + var_160_11 and arg_157_1.time_ < var_160_4 + var_160_11 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play103701039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 103701039
		arg_161_1.duration_ = 7.366

		local var_161_0 = {
			ja = 7.033,
			ko = 7.366,
			en = 6.533
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
				arg_161_0:Play103701040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = "1037ui_story"

			if arg_161_1.actors_[var_164_0] == nil then
				local var_164_1 = Object.Instantiate(Asset.Load("Char/" .. var_164_0), arg_161_1.stage_.transform)

				var_164_1.name = var_164_0
				var_164_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_161_1.actors_[var_164_0] = var_164_1

				local var_164_2 = var_164_1:GetComponentInChildren(typeof(CharacterEffect))

				var_164_2.enabled = true

				local var_164_3 = GameObjectTools.GetOrAddComponent(var_164_1, typeof(DynamicBoneHelper))

				if var_164_3 then
					var_164_3:EnableDynamicBone(false)
				end

				arg_161_1:ShowWeapon(var_164_2.transform, false)

				arg_161_1.var_[var_164_0 .. "Animator"] = var_164_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_161_1.var_[var_164_0 .. "Animator"].applyRootMotion = true
				arg_161_1.var_[var_164_0 .. "LipSync"] = var_164_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_164_4 = arg_161_1.actors_["1037ui_story"].transform
			local var_164_5 = 0

			if var_164_5 < arg_161_1.time_ and arg_161_1.time_ <= var_164_5 + arg_164_0 then
				arg_161_1.var_.moveOldPos1037ui_story = var_164_4.localPosition
			end

			local var_164_6 = 0.001

			if var_164_5 <= arg_161_1.time_ and arg_161_1.time_ < var_164_5 + var_164_6 then
				local var_164_7 = (arg_161_1.time_ - var_164_5) / var_164_6
				local var_164_8 = Vector3.New(0, -1.09, -5.81)

				var_164_4.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1037ui_story, var_164_8, var_164_7)

				local var_164_9 = manager.ui.mainCamera.transform.position - var_164_4.position

				var_164_4.forward = Vector3.New(var_164_9.x, var_164_9.y, var_164_9.z)

				local var_164_10 = var_164_4.localEulerAngles

				var_164_10.z = 0
				var_164_10.x = 0
				var_164_4.localEulerAngles = var_164_10
			end

			if arg_161_1.time_ >= var_164_5 + var_164_6 and arg_161_1.time_ < var_164_5 + var_164_6 + arg_164_0 then
				var_164_4.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_164_11 = manager.ui.mainCamera.transform.position - var_164_4.position

				var_164_4.forward = Vector3.New(var_164_11.x, var_164_11.y, var_164_11.z)

				local var_164_12 = var_164_4.localEulerAngles

				var_164_12.z = 0
				var_164_12.x = 0
				var_164_4.localEulerAngles = var_164_12
			end

			local var_164_13 = arg_161_1.actors_["1037ui_story"]
			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 and arg_161_1.var_.characterEffect1037ui_story == nil then
				arg_161_1.var_.characterEffect1037ui_story = var_164_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_15 = 0.2

			if var_164_14 <= arg_161_1.time_ and arg_161_1.time_ < var_164_14 + var_164_15 then
				local var_164_16 = (arg_161_1.time_ - var_164_14) / var_164_15

				if arg_161_1.var_.characterEffect1037ui_story then
					arg_161_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_14 + var_164_15 and arg_161_1.time_ < var_164_14 + var_164_15 + arg_164_0 and arg_161_1.var_.characterEffect1037ui_story then
				arg_161_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_164_17 = 0

			if var_164_17 < arg_161_1.time_ and arg_161_1.time_ <= var_164_17 + arg_164_0 then
				arg_161_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_164_18 = 0

			if var_164_18 < arg_161_1.time_ and arg_161_1.time_ <= var_164_18 + arg_164_0 then
				arg_161_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action2_1")
			end

			local var_164_19 = 0
			local var_164_20 = 0.425

			if var_164_19 < arg_161_1.time_ and arg_161_1.time_ <= var_164_19 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_21 = arg_161_1:FormatText(StoryNameCfg[15].name)

				arg_161_1.leftNameTxt_.text = var_164_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_22 = arg_161_1:GetWordFromCfg(103701039)
				local var_164_23 = arg_161_1:FormatText(var_164_22.content)

				arg_161_1.text_.text = var_164_23

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_24 = 17
				local var_164_25 = utf8.len(var_164_23)
				local var_164_26 = var_164_24 <= 0 and var_164_20 or var_164_20 * (var_164_25 / var_164_24)

				if var_164_26 > 0 and var_164_20 < var_164_26 then
					arg_161_1.talkMaxDuration = var_164_26

					if var_164_26 + var_164_19 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_26 + var_164_19
					end
				end

				arg_161_1.text_.text = var_164_23
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701039", "story_v_side_old_103701.awb") ~= 0 then
					local var_164_27 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701039", "story_v_side_old_103701.awb") / 1000

					if var_164_27 + var_164_19 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_27 + var_164_19
					end

					if var_164_22.prefab_name ~= "" and arg_161_1.actors_[var_164_22.prefab_name] ~= nil then
						local var_164_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_22.prefab_name].transform, "story_v_side_old_103701", "103701039", "story_v_side_old_103701.awb")

						arg_161_1:RecordAudio("103701039", var_164_28)
						arg_161_1:RecordAudio("103701039", var_164_28)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701039", "story_v_side_old_103701.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701039", "story_v_side_old_103701.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_29 = math.max(var_164_20, arg_161_1.talkMaxDuration)

			if var_164_19 <= arg_161_1.time_ and arg_161_1.time_ < var_164_19 + var_164_29 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_19) / var_164_29

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_19 + var_164_29 and arg_161_1.time_ < var_164_19 + var_164_29 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play103701040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 103701040
		arg_165_1.duration_ = 5

		SetActive(arg_165_1.tipsGo_, false)

		function arg_165_1.onSingleLineFinish_()
			arg_165_1.onSingleLineUpdate_ = nil
			arg_165_1.onSingleLineFinish_ = nil
			arg_165_1.state_ = "waiting"
		end

		function arg_165_1.playNext_(arg_167_0)
			if arg_167_0 == 1 then
				arg_165_0:Play103701041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.3

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, false)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_2 = arg_165_1:GetWordFromCfg(103701040)
				local var_168_3 = arg_165_1:FormatText(var_168_2.content)

				arg_165_1.text_.text = var_168_3

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_4 = 12
				local var_168_5 = utf8.len(var_168_3)
				local var_168_6 = var_168_4 <= 0 and var_168_1 or var_168_1 * (var_168_5 / var_168_4)

				if var_168_6 > 0 and var_168_1 < var_168_6 then
					arg_165_1.talkMaxDuration = var_168_6

					if var_168_6 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_6 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_3
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)
				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_7 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_7 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_7

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_7 and arg_165_1.time_ < var_168_0 + var_168_7 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play103701041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 103701041
		arg_169_1.duration_ = 3.8

		local var_169_0 = {
			ja = 3.8,
			ko = 2,
			en = 1.999999999999
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
				arg_169_0:Play103701042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1037ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1037ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, 100, 0)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1037ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, 100, 0)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = "1019ui_story"

			if arg_169_1.actors_[var_172_9] == nil then
				local var_172_10 = Object.Instantiate(Asset.Load("Char/" .. var_172_9), arg_169_1.stage_.transform)

				var_172_10.name = var_172_9
				var_172_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_169_1.actors_[var_172_9] = var_172_10

				local var_172_11 = var_172_10:GetComponentInChildren(typeof(CharacterEffect))

				var_172_11.enabled = true

				local var_172_12 = GameObjectTools.GetOrAddComponent(var_172_10, typeof(DynamicBoneHelper))

				if var_172_12 then
					var_172_12:EnableDynamicBone(false)
				end

				arg_169_1:ShowWeapon(var_172_11.transform, false)

				arg_169_1.var_[var_172_9 .. "Animator"] = var_172_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_169_1.var_[var_172_9 .. "Animator"].applyRootMotion = true
				arg_169_1.var_[var_172_9 .. "LipSync"] = var_172_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_172_13 = arg_169_1.actors_["1019ui_story"].transform
			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1.var_.moveOldPos1019ui_story = var_172_13.localPosition
			end

			local var_172_15 = 0.001

			if var_172_14 <= arg_169_1.time_ and arg_169_1.time_ < var_172_14 + var_172_15 then
				local var_172_16 = (arg_169_1.time_ - var_172_14) / var_172_15
				local var_172_17 = Vector3.New(0, -1.08, -5.9)

				var_172_13.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1019ui_story, var_172_17, var_172_16)

				local var_172_18 = manager.ui.mainCamera.transform.position - var_172_13.position

				var_172_13.forward = Vector3.New(var_172_18.x, var_172_18.y, var_172_18.z)

				local var_172_19 = var_172_13.localEulerAngles

				var_172_19.z = 0
				var_172_19.x = 0
				var_172_13.localEulerAngles = var_172_19
			end

			if arg_169_1.time_ >= var_172_14 + var_172_15 and arg_169_1.time_ < var_172_14 + var_172_15 + arg_172_0 then
				var_172_13.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_172_20 = manager.ui.mainCamera.transform.position - var_172_13.position

				var_172_13.forward = Vector3.New(var_172_20.x, var_172_20.y, var_172_20.z)

				local var_172_21 = var_172_13.localEulerAngles

				var_172_21.z = 0
				var_172_21.x = 0
				var_172_13.localEulerAngles = var_172_21
			end

			local var_172_22 = arg_169_1.actors_["1019ui_story"]
			local var_172_23 = 0

			if var_172_23 < arg_169_1.time_ and arg_169_1.time_ <= var_172_23 + arg_172_0 and arg_169_1.var_.characterEffect1019ui_story == nil then
				arg_169_1.var_.characterEffect1019ui_story = var_172_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_24 = 0.2

			if var_172_23 <= arg_169_1.time_ and arg_169_1.time_ < var_172_23 + var_172_24 then
				local var_172_25 = (arg_169_1.time_ - var_172_23) / var_172_24

				if arg_169_1.var_.characterEffect1019ui_story then
					arg_169_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_23 + var_172_24 and arg_169_1.time_ < var_172_23 + var_172_24 + arg_172_0 and arg_169_1.var_.characterEffect1019ui_story then
				arg_169_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_172_26 = 0

			if var_172_26 < arg_169_1.time_ and arg_169_1.time_ <= var_172_26 + arg_172_0 then
				arg_169_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_172_27 = 0

			if var_172_27 < arg_169_1.time_ and arg_169_1.time_ <= var_172_27 + arg_172_0 then
				arg_169_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action6_1")
			end

			local var_172_28 = 0
			local var_172_29 = 0.225

			if var_172_28 < arg_169_1.time_ and arg_169_1.time_ <= var_172_28 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_30 = arg_169_1:FormatText(StoryNameCfg[13].name)

				arg_169_1.leftNameTxt_.text = var_172_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_31 = arg_169_1:GetWordFromCfg(103701041)
				local var_172_32 = arg_169_1:FormatText(var_172_31.content)

				arg_169_1.text_.text = var_172_32

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_33 = 9
				local var_172_34 = utf8.len(var_172_32)
				local var_172_35 = var_172_33 <= 0 and var_172_29 or var_172_29 * (var_172_34 / var_172_33)

				if var_172_35 > 0 and var_172_29 < var_172_35 then
					arg_169_1.talkMaxDuration = var_172_35

					if var_172_35 + var_172_28 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_35 + var_172_28
					end
				end

				arg_169_1.text_.text = var_172_32
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701041", "story_v_side_old_103701.awb") ~= 0 then
					local var_172_36 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701041", "story_v_side_old_103701.awb") / 1000

					if var_172_36 + var_172_28 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_36 + var_172_28
					end

					if var_172_31.prefab_name ~= "" and arg_169_1.actors_[var_172_31.prefab_name] ~= nil then
						local var_172_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_31.prefab_name].transform, "story_v_side_old_103701", "103701041", "story_v_side_old_103701.awb")

						arg_169_1:RecordAudio("103701041", var_172_37)
						arg_169_1:RecordAudio("103701041", var_172_37)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701041", "story_v_side_old_103701.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701041", "story_v_side_old_103701.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_38 = math.max(var_172_29, arg_169_1.talkMaxDuration)

			if var_172_28 <= arg_169_1.time_ and arg_169_1.time_ < var_172_28 + var_172_38 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_28) / var_172_38

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_28 + var_172_38 and arg_169_1.time_ < var_172_28 + var_172_38 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play103701042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 103701042
		arg_173_1.duration_ = 9.2

		local var_173_0 = {
			ja = 7.133,
			ko = 9.2,
			en = 6.133
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
				arg_173_0:Play103701043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = 0

			if var_176_0 < arg_173_1.time_ and arg_173_1.time_ <= var_176_0 + arg_176_0 then
				arg_173_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_176_1 = 0
			local var_176_2 = 0.875

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_3 = arg_173_1:FormatText(StoryNameCfg[13].name)

				arg_173_1.leftNameTxt_.text = var_176_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_4 = arg_173_1:GetWordFromCfg(103701042)
				local var_176_5 = arg_173_1:FormatText(var_176_4.content)

				arg_173_1.text_.text = var_176_5

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_6 = 35
				local var_176_7 = utf8.len(var_176_5)
				local var_176_8 = var_176_6 <= 0 and var_176_2 or var_176_2 * (var_176_7 / var_176_6)

				if var_176_8 > 0 and var_176_2 < var_176_8 then
					arg_173_1.talkMaxDuration = var_176_8

					if var_176_8 + var_176_1 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_8 + var_176_1
					end
				end

				arg_173_1.text_.text = var_176_5
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701042", "story_v_side_old_103701.awb") ~= 0 then
					local var_176_9 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701042", "story_v_side_old_103701.awb") / 1000

					if var_176_9 + var_176_1 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_9 + var_176_1
					end

					if var_176_4.prefab_name ~= "" and arg_173_1.actors_[var_176_4.prefab_name] ~= nil then
						local var_176_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_4.prefab_name].transform, "story_v_side_old_103701", "103701042", "story_v_side_old_103701.awb")

						arg_173_1:RecordAudio("103701042", var_176_10)
						arg_173_1:RecordAudio("103701042", var_176_10)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701042", "story_v_side_old_103701.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701042", "story_v_side_old_103701.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_11 = math.max(var_176_2, arg_173_1.talkMaxDuration)

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_11 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_1) / var_176_11

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_1 + var_176_11 and arg_173_1.time_ < var_176_1 + var_176_11 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play103701043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 103701043
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play103701044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1019ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1019ui_story == nil then
				arg_177_1.var_.characterEffect1019ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.2

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1019ui_story then
					local var_180_4 = Mathf.Lerp(0, 0.5, var_180_3)

					arg_177_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1019ui_story.fillRatio = var_180_4
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1019ui_story then
				local var_180_5 = 0.5

				arg_177_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1019ui_story.fillRatio = var_180_5
			end

			local var_180_6 = 0
			local var_180_7 = 0.25

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_8 = arg_177_1:FormatText(StoryNameCfg[7].name)

				arg_177_1.leftNameTxt_.text = var_180_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_9 = arg_177_1:GetWordFromCfg(103701043)
				local var_180_10 = arg_177_1:FormatText(var_180_9.content)

				arg_177_1.text_.text = var_180_10

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_11 = 10
				local var_180_12 = utf8.len(var_180_10)
				local var_180_13 = var_180_11 <= 0 and var_180_7 or var_180_7 * (var_180_12 / var_180_11)

				if var_180_13 > 0 and var_180_7 < var_180_13 then
					arg_177_1.talkMaxDuration = var_180_13

					if var_180_13 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_13 + var_180_6
					end
				end

				arg_177_1.text_.text = var_180_10
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_14 = math.max(var_180_7, arg_177_1.talkMaxDuration)

			if var_180_6 <= arg_177_1.time_ and arg_177_1.time_ < var_180_6 + var_180_14 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_6) / var_180_14

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_6 + var_180_14 and arg_177_1.time_ < var_180_6 + var_180_14 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play103701044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 103701044
		arg_181_1.duration_ = 0.166666666666

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"

			SetActive(arg_181_1.choicesGo_, true)

			for iter_182_0, iter_182_1 in ipairs(arg_181_1.choices_) do
				local var_182_0 = iter_182_0 <= 2

				SetActive(iter_182_1.go, var_182_0)
			end

			arg_181_1.choices_[1].txt.text = arg_181_1:FormatText(StoryChoiceCfg[119].name)
			arg_181_1.choices_[2].txt.text = arg_181_1:FormatText(StoryChoiceCfg[120].name)
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play103701045(arg_181_1)
			end

			if arg_183_0 == 2 then
				arg_181_0:Play103701046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			return
		end
	end,
	Play103701045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 103701045
		arg_185_1.duration_ = 4.966

		local var_185_0 = {
			ja = 4.966,
			ko = 1.999999999999,
			en = 4.766
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
				arg_185_0:Play103701047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1019ui_story"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.characterEffect1019ui_story == nil then
				arg_185_1.var_.characterEffect1019ui_story = var_188_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_2 = 0.2

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.characterEffect1019ui_story then
					arg_185_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.characterEffect1019ui_story then
				arg_185_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_188_4 = 0

			if var_188_4 < arg_185_1.time_ and arg_185_1.time_ <= var_188_4 + arg_188_0 then
				arg_185_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_188_5 = 0

			if var_188_5 < arg_185_1.time_ and arg_185_1.time_ <= var_188_5 + arg_188_0 then
				arg_185_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action462")
			end

			local var_188_6 = 0
			local var_188_7 = 1

			if var_188_6 < arg_185_1.time_ and arg_185_1.time_ <= var_188_6 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_8 = arg_185_1:FormatText(StoryNameCfg[13].name)

				arg_185_1.leftNameTxt_.text = var_188_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_9 = arg_185_1:GetWordFromCfg(103701045)
				local var_188_10 = arg_185_1:FormatText(var_188_9.content)

				arg_185_1.text_.text = var_188_10

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_11 = 14
				local var_188_12 = utf8.len(var_188_10)
				local var_188_13 = var_188_11 <= 0 and var_188_7 or var_188_7 * (var_188_12 / var_188_11)

				if var_188_13 > 0 and var_188_7 < var_188_13 then
					arg_185_1.talkMaxDuration = var_188_13

					if var_188_13 + var_188_6 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_13 + var_188_6
					end
				end

				arg_185_1.text_.text = var_188_10
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701045", "story_v_side_old_103701.awb") ~= 0 then
					local var_188_14 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701045", "story_v_side_old_103701.awb") / 1000

					if var_188_14 + var_188_6 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_14 + var_188_6
					end

					if var_188_9.prefab_name ~= "" and arg_185_1.actors_[var_188_9.prefab_name] ~= nil then
						local var_188_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_9.prefab_name].transform, "story_v_side_old_103701", "103701045", "story_v_side_old_103701.awb")

						arg_185_1:RecordAudio("103701045", var_188_15)
						arg_185_1:RecordAudio("103701045", var_188_15)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701045", "story_v_side_old_103701.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701045", "story_v_side_old_103701.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_16 = math.max(var_188_7, arg_185_1.talkMaxDuration)

			if var_188_6 <= arg_185_1.time_ and arg_185_1.time_ < var_188_6 + var_188_16 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_6) / var_188_16

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_6 + var_188_16 and arg_185_1.time_ < var_188_6 + var_188_16 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play103701047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 103701047
		arg_189_1.duration_ = 7.733

		local var_189_0 = {
			ja = 6.4,
			ko = 7.733,
			en = 5.733
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
				arg_189_0:Play103701048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1019ui_story"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1019ui_story = var_192_0.localPosition
			end

			local var_192_2 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2
				local var_192_4 = Vector3.New(0, 100, 0)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1019ui_story, var_192_4, var_192_3)

				local var_192_5 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_5.x, var_192_5.y, var_192_5.z)

				local var_192_6 = var_192_0.localEulerAngles

				var_192_6.z = 0
				var_192_6.x = 0
				var_192_0.localEulerAngles = var_192_6
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 then
				var_192_0.localPosition = Vector3.New(0, 100, 0)

				local var_192_7 = manager.ui.mainCamera.transform.position - var_192_0.position

				var_192_0.forward = Vector3.New(var_192_7.x, var_192_7.y, var_192_7.z)

				local var_192_8 = var_192_0.localEulerAngles

				var_192_8.z = 0
				var_192_8.x = 0
				var_192_0.localEulerAngles = var_192_8
			end

			local var_192_9 = arg_189_1.actors_["1037ui_story"].transform
			local var_192_10 = 0

			if var_192_10 < arg_189_1.time_ and arg_189_1.time_ <= var_192_10 + arg_192_0 then
				arg_189_1.var_.moveOldPos1037ui_story = var_192_9.localPosition
			end

			local var_192_11 = 0.001

			if var_192_10 <= arg_189_1.time_ and arg_189_1.time_ < var_192_10 + var_192_11 then
				local var_192_12 = (arg_189_1.time_ - var_192_10) / var_192_11
				local var_192_13 = Vector3.New(0, -1.09, -5.81)

				var_192_9.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1037ui_story, var_192_13, var_192_12)

				local var_192_14 = manager.ui.mainCamera.transform.position - var_192_9.position

				var_192_9.forward = Vector3.New(var_192_14.x, var_192_14.y, var_192_14.z)

				local var_192_15 = var_192_9.localEulerAngles

				var_192_15.z = 0
				var_192_15.x = 0
				var_192_9.localEulerAngles = var_192_15
			end

			if arg_189_1.time_ >= var_192_10 + var_192_11 and arg_189_1.time_ < var_192_10 + var_192_11 + arg_192_0 then
				var_192_9.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_192_16 = manager.ui.mainCamera.transform.position - var_192_9.position

				var_192_9.forward = Vector3.New(var_192_16.x, var_192_16.y, var_192_16.z)

				local var_192_17 = var_192_9.localEulerAngles

				var_192_17.z = 0
				var_192_17.x = 0
				var_192_9.localEulerAngles = var_192_17
			end

			local var_192_18 = arg_189_1.actors_["1037ui_story"]
			local var_192_19 = 0

			if var_192_19 < arg_189_1.time_ and arg_189_1.time_ <= var_192_19 + arg_192_0 and arg_189_1.var_.characterEffect1037ui_story == nil then
				arg_189_1.var_.characterEffect1037ui_story = var_192_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_20 = 0.2

			if var_192_19 <= arg_189_1.time_ and arg_189_1.time_ < var_192_19 + var_192_20 then
				local var_192_21 = (arg_189_1.time_ - var_192_19) / var_192_20

				if arg_189_1.var_.characterEffect1037ui_story then
					arg_189_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_19 + var_192_20 and arg_189_1.time_ < var_192_19 + var_192_20 + arg_192_0 and arg_189_1.var_.characterEffect1037ui_story then
				arg_189_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_192_22 = 0

			if var_192_22 < arg_189_1.time_ and arg_189_1.time_ <= var_192_22 + arg_192_0 then
				arg_189_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_192_23 = 0

			if var_192_23 < arg_189_1.time_ and arg_189_1.time_ <= var_192_23 + arg_192_0 then
				arg_189_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action2_1")
			end

			local var_192_24 = 0
			local var_192_25 = 0.625

			if var_192_24 < arg_189_1.time_ and arg_189_1.time_ <= var_192_24 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_26 = arg_189_1:FormatText(StoryNameCfg[15].name)

				arg_189_1.leftNameTxt_.text = var_192_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_27 = arg_189_1:GetWordFromCfg(103701047)
				local var_192_28 = arg_189_1:FormatText(var_192_27.content)

				arg_189_1.text_.text = var_192_28

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_29 = 25
				local var_192_30 = utf8.len(var_192_28)
				local var_192_31 = var_192_29 <= 0 and var_192_25 or var_192_25 * (var_192_30 / var_192_29)

				if var_192_31 > 0 and var_192_25 < var_192_31 then
					arg_189_1.talkMaxDuration = var_192_31

					if var_192_31 + var_192_24 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_31 + var_192_24
					end
				end

				arg_189_1.text_.text = var_192_28
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701047", "story_v_side_old_103701.awb") ~= 0 then
					local var_192_32 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701047", "story_v_side_old_103701.awb") / 1000

					if var_192_32 + var_192_24 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_32 + var_192_24
					end

					if var_192_27.prefab_name ~= "" and arg_189_1.actors_[var_192_27.prefab_name] ~= nil then
						local var_192_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_27.prefab_name].transform, "story_v_side_old_103701", "103701047", "story_v_side_old_103701.awb")

						arg_189_1:RecordAudio("103701047", var_192_33)
						arg_189_1:RecordAudio("103701047", var_192_33)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701047", "story_v_side_old_103701.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701047", "story_v_side_old_103701.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_34 = math.max(var_192_25, arg_189_1.talkMaxDuration)

			if var_192_24 <= arg_189_1.time_ and arg_189_1.time_ < var_192_24 + var_192_34 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_24) / var_192_34

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_24 + var_192_34 and arg_189_1.time_ < var_192_24 + var_192_34 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play103701048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 103701048
		arg_193_1.duration_ = 9.066

		local var_193_0 = {
			ja = 8.833,
			ko = 6,
			en = 9.066
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
				arg_193_0:Play103701049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["1037ui_story"].transform
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 then
				arg_193_1.var_.moveOldPos1037ui_story = var_196_0.localPosition
			end

			local var_196_2 = 0.001

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2
				local var_196_4 = Vector3.New(-0.7, -1.09, -5.81)

				var_196_0.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1037ui_story, var_196_4, var_196_3)

				local var_196_5 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_5.x, var_196_5.y, var_196_5.z)

				local var_196_6 = var_196_0.localEulerAngles

				var_196_6.z = 0
				var_196_6.x = 0
				var_196_0.localEulerAngles = var_196_6
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 then
				var_196_0.localPosition = Vector3.New(-0.7, -1.09, -5.81)

				local var_196_7 = manager.ui.mainCamera.transform.position - var_196_0.position

				var_196_0.forward = Vector3.New(var_196_7.x, var_196_7.y, var_196_7.z)

				local var_196_8 = var_196_0.localEulerAngles

				var_196_8.z = 0
				var_196_8.x = 0
				var_196_0.localEulerAngles = var_196_8
			end

			local var_196_9 = arg_193_1.actors_["1037ui_story"]
			local var_196_10 = 0

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 and arg_193_1.var_.characterEffect1037ui_story == nil then
				arg_193_1.var_.characterEffect1037ui_story = var_196_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_11 = 0.2

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11

				if arg_193_1.var_.characterEffect1037ui_story then
					local var_196_13 = Mathf.Lerp(0, 0.5, var_196_12)

					arg_193_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_193_1.var_.characterEffect1037ui_story.fillRatio = var_196_13
				end
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 and arg_193_1.var_.characterEffect1037ui_story then
				local var_196_14 = 0.5

				arg_193_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_193_1.var_.characterEffect1037ui_story.fillRatio = var_196_14
			end

			local var_196_15 = arg_193_1.actors_["1019ui_story"].transform
			local var_196_16 = 0

			if var_196_16 < arg_193_1.time_ and arg_193_1.time_ <= var_196_16 + arg_196_0 then
				arg_193_1.var_.moveOldPos1019ui_story = var_196_15.localPosition
			end

			local var_196_17 = 0.001

			if var_196_16 <= arg_193_1.time_ and arg_193_1.time_ < var_196_16 + var_196_17 then
				local var_196_18 = (arg_193_1.time_ - var_196_16) / var_196_17
				local var_196_19 = Vector3.New(0.7, -1.08, -5.9)

				var_196_15.localPosition = Vector3.Lerp(arg_193_1.var_.moveOldPos1019ui_story, var_196_19, var_196_18)

				local var_196_20 = manager.ui.mainCamera.transform.position - var_196_15.position

				var_196_15.forward = Vector3.New(var_196_20.x, var_196_20.y, var_196_20.z)

				local var_196_21 = var_196_15.localEulerAngles

				var_196_21.z = 0
				var_196_21.x = 0
				var_196_15.localEulerAngles = var_196_21
			end

			if arg_193_1.time_ >= var_196_16 + var_196_17 and arg_193_1.time_ < var_196_16 + var_196_17 + arg_196_0 then
				var_196_15.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_196_22 = manager.ui.mainCamera.transform.position - var_196_15.position

				var_196_15.forward = Vector3.New(var_196_22.x, var_196_22.y, var_196_22.z)

				local var_196_23 = var_196_15.localEulerAngles

				var_196_23.z = 0
				var_196_23.x = 0
				var_196_15.localEulerAngles = var_196_23
			end

			local var_196_24 = arg_193_1.actors_["1019ui_story"]
			local var_196_25 = 0

			if var_196_25 < arg_193_1.time_ and arg_193_1.time_ <= var_196_25 + arg_196_0 and arg_193_1.var_.characterEffect1019ui_story == nil then
				arg_193_1.var_.characterEffect1019ui_story = var_196_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_26 = 0.2

			if var_196_25 <= arg_193_1.time_ and arg_193_1.time_ < var_196_25 + var_196_26 then
				local var_196_27 = (arg_193_1.time_ - var_196_25) / var_196_26

				if arg_193_1.var_.characterEffect1019ui_story then
					arg_193_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_25 + var_196_26 and arg_193_1.time_ < var_196_25 + var_196_26 + arg_196_0 and arg_193_1.var_.characterEffect1019ui_story then
				arg_193_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_196_28 = 0

			if var_196_28 < arg_193_1.time_ and arg_193_1.time_ <= var_196_28 + arg_196_0 then
				arg_193_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_196_29 = 0

			if var_196_29 < arg_193_1.time_ and arg_193_1.time_ <= var_196_29 + arg_196_0 then
				arg_193_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_196_30 = 0
			local var_196_31 = 0.7

			if var_196_30 < arg_193_1.time_ and arg_193_1.time_ <= var_196_30 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_32 = arg_193_1:FormatText(StoryNameCfg[13].name)

				arg_193_1.leftNameTxt_.text = var_196_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_33 = arg_193_1:GetWordFromCfg(103701048)
				local var_196_34 = arg_193_1:FormatText(var_196_33.content)

				arg_193_1.text_.text = var_196_34

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_35 = 28
				local var_196_36 = utf8.len(var_196_34)
				local var_196_37 = var_196_35 <= 0 and var_196_31 or var_196_31 * (var_196_36 / var_196_35)

				if var_196_37 > 0 and var_196_31 < var_196_37 then
					arg_193_1.talkMaxDuration = var_196_37

					if var_196_37 + var_196_30 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_37 + var_196_30
					end
				end

				arg_193_1.text_.text = var_196_34
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701048", "story_v_side_old_103701.awb") ~= 0 then
					local var_196_38 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701048", "story_v_side_old_103701.awb") / 1000

					if var_196_38 + var_196_30 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_38 + var_196_30
					end

					if var_196_33.prefab_name ~= "" and arg_193_1.actors_[var_196_33.prefab_name] ~= nil then
						local var_196_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_33.prefab_name].transform, "story_v_side_old_103701", "103701048", "story_v_side_old_103701.awb")

						arg_193_1:RecordAudio("103701048", var_196_39)
						arg_193_1:RecordAudio("103701048", var_196_39)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701048", "story_v_side_old_103701.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701048", "story_v_side_old_103701.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_40 = math.max(var_196_31, arg_193_1.talkMaxDuration)

			if var_196_30 <= arg_193_1.time_ and arg_193_1.time_ < var_196_30 + var_196_40 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_30) / var_196_40

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_30 + var_196_40 and arg_193_1.time_ < var_196_30 + var_196_40 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play103701049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 103701049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play103701050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1019ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect1019ui_story == nil then
				arg_197_1.var_.characterEffect1019ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.2

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect1019ui_story then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1019ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect1019ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1019ui_story.fillRatio = var_200_5
			end

			local var_200_6 = 0
			local var_200_7 = 0.6

			if var_200_6 < arg_197_1.time_ and arg_197_1.time_ <= var_200_6 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_8 = arg_197_1:GetWordFromCfg(103701049)
				local var_200_9 = arg_197_1:FormatText(var_200_8.content)

				arg_197_1.text_.text = var_200_9

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_10 = 24
				local var_200_11 = utf8.len(var_200_9)
				local var_200_12 = var_200_10 <= 0 and var_200_7 or var_200_7 * (var_200_11 / var_200_10)

				if var_200_12 > 0 and var_200_7 < var_200_12 then
					arg_197_1.talkMaxDuration = var_200_12

					if var_200_12 + var_200_6 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_12 + var_200_6
					end
				end

				arg_197_1.text_.text = var_200_9
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_13 = math.max(var_200_7, arg_197_1.talkMaxDuration)

			if var_200_6 <= arg_197_1.time_ and arg_197_1.time_ < var_200_6 + var_200_13 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_6) / var_200_13

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_6 + var_200_13 and arg_197_1.time_ < var_200_6 + var_200_13 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play103701050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 103701050
		arg_201_1.duration_ = 6.3

		local var_201_0 = {
			ja = 5.933,
			ko = 5.466,
			en = 6.3
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
				arg_201_0:Play103701051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1037ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect1037ui_story == nil then
				arg_201_1.var_.characterEffect1037ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.2

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect1037ui_story then
					arg_201_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect1037ui_story then
				arg_201_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_204_4 = 0

			if var_204_4 < arg_201_1.time_ and arg_201_1.time_ <= var_204_4 + arg_204_0 then
				arg_201_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_204_5 = 0
			local var_204_6 = 0.475

			if var_204_5 < arg_201_1.time_ and arg_201_1.time_ <= var_204_5 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_7 = arg_201_1:FormatText(StoryNameCfg[15].name)

				arg_201_1.leftNameTxt_.text = var_204_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_8 = arg_201_1:GetWordFromCfg(103701050)
				local var_204_9 = arg_201_1:FormatText(var_204_8.content)

				arg_201_1.text_.text = var_204_9

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_10 = 19
				local var_204_11 = utf8.len(var_204_9)
				local var_204_12 = var_204_10 <= 0 and var_204_6 or var_204_6 * (var_204_11 / var_204_10)

				if var_204_12 > 0 and var_204_6 < var_204_12 then
					arg_201_1.talkMaxDuration = var_204_12

					if var_204_12 + var_204_5 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_12 + var_204_5
					end
				end

				arg_201_1.text_.text = var_204_9
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701050", "story_v_side_old_103701.awb") ~= 0 then
					local var_204_13 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701050", "story_v_side_old_103701.awb") / 1000

					if var_204_13 + var_204_5 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_13 + var_204_5
					end

					if var_204_8.prefab_name ~= "" and arg_201_1.actors_[var_204_8.prefab_name] ~= nil then
						local var_204_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_8.prefab_name].transform, "story_v_side_old_103701", "103701050", "story_v_side_old_103701.awb")

						arg_201_1:RecordAudio("103701050", var_204_14)
						arg_201_1:RecordAudio("103701050", var_204_14)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701050", "story_v_side_old_103701.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701050", "story_v_side_old_103701.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_15 = math.max(var_204_6, arg_201_1.talkMaxDuration)

			if var_204_5 <= arg_201_1.time_ and arg_201_1.time_ < var_204_5 + var_204_15 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_5) / var_204_15

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_5 + var_204_15 and arg_201_1.time_ < var_204_5 + var_204_15 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play103701051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 103701051
		arg_205_1.duration_ = 6.6

		local var_205_0 = {
			ja = 6.6,
			ko = 3.9,
			en = 3.266
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
				arg_205_0:Play103701052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1019ui_story"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.characterEffect1019ui_story == nil then
				arg_205_1.var_.characterEffect1019ui_story = var_208_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_2 = 0.2

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.characterEffect1019ui_story then
					arg_205_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.characterEffect1019ui_story then
				arg_205_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_208_4 = 0

			if var_208_4 < arg_205_1.time_ and arg_205_1.time_ <= var_208_4 + arg_208_0 then
				arg_205_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_208_5 = arg_205_1.actors_["1037ui_story"]
			local var_208_6 = 0

			if var_208_6 < arg_205_1.time_ and arg_205_1.time_ <= var_208_6 + arg_208_0 and arg_205_1.var_.characterEffect1037ui_story == nil then
				arg_205_1.var_.characterEffect1037ui_story = var_208_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_7 = 0.2

			if var_208_6 <= arg_205_1.time_ and arg_205_1.time_ < var_208_6 + var_208_7 then
				local var_208_8 = (arg_205_1.time_ - var_208_6) / var_208_7

				if arg_205_1.var_.characterEffect1037ui_story then
					local var_208_9 = Mathf.Lerp(0, 0.5, var_208_8)

					arg_205_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1037ui_story.fillRatio = var_208_9
				end
			end

			if arg_205_1.time_ >= var_208_6 + var_208_7 and arg_205_1.time_ < var_208_6 + var_208_7 + arg_208_0 and arg_205_1.var_.characterEffect1037ui_story then
				local var_208_10 = 0.5

				arg_205_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1037ui_story.fillRatio = var_208_10
			end

			local var_208_11 = 0
			local var_208_12 = 0.625

			if var_208_11 < arg_205_1.time_ and arg_205_1.time_ <= var_208_11 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_13 = arg_205_1:FormatText(StoryNameCfg[13].name)

				arg_205_1.leftNameTxt_.text = var_208_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_14 = arg_205_1:GetWordFromCfg(103701051)
				local var_208_15 = arg_205_1:FormatText(var_208_14.content)

				arg_205_1.text_.text = var_208_15

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_16 = 25
				local var_208_17 = utf8.len(var_208_15)
				local var_208_18 = var_208_16 <= 0 and var_208_12 or var_208_12 * (var_208_17 / var_208_16)

				if var_208_18 > 0 and var_208_12 < var_208_18 then
					arg_205_1.talkMaxDuration = var_208_18

					if var_208_18 + var_208_11 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_18 + var_208_11
					end
				end

				arg_205_1.text_.text = var_208_15
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701051", "story_v_side_old_103701.awb") ~= 0 then
					local var_208_19 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701051", "story_v_side_old_103701.awb") / 1000

					if var_208_19 + var_208_11 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_19 + var_208_11
					end

					if var_208_14.prefab_name ~= "" and arg_205_1.actors_[var_208_14.prefab_name] ~= nil then
						local var_208_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_14.prefab_name].transform, "story_v_side_old_103701", "103701051", "story_v_side_old_103701.awb")

						arg_205_1:RecordAudio("103701051", var_208_20)
						arg_205_1:RecordAudio("103701051", var_208_20)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701051", "story_v_side_old_103701.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701051", "story_v_side_old_103701.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_21 = math.max(var_208_12, arg_205_1.talkMaxDuration)

			if var_208_11 <= arg_205_1.time_ and arg_205_1.time_ < var_208_11 + var_208_21 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_11) / var_208_21

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_11 + var_208_21 and arg_205_1.time_ < var_208_11 + var_208_21 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play103701052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 103701052
		arg_209_1.duration_ = 9.8

		local var_209_0 = {
			ja = 9.8,
			ko = 5.7,
			en = 6.033
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
				arg_209_0:Play103701053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1019ui_story"]
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 and arg_209_1.var_.characterEffect1019ui_story == nil then
				arg_209_1.var_.characterEffect1019ui_story = var_212_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_2 = 0.2

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2

				if arg_209_1.var_.characterEffect1019ui_story then
					local var_212_4 = Mathf.Lerp(0, 0.5, var_212_3)

					arg_209_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1019ui_story.fillRatio = var_212_4
				end
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 and arg_209_1.var_.characterEffect1019ui_story then
				local var_212_5 = 0.5

				arg_209_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1019ui_story.fillRatio = var_212_5
			end

			local var_212_6 = arg_209_1.actors_["1037ui_story"]
			local var_212_7 = 0

			if var_212_7 < arg_209_1.time_ and arg_209_1.time_ <= var_212_7 + arg_212_0 and arg_209_1.var_.characterEffect1037ui_story == nil then
				arg_209_1.var_.characterEffect1037ui_story = var_212_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_8 = 0.2

			if var_212_7 <= arg_209_1.time_ and arg_209_1.time_ < var_212_7 + var_212_8 then
				local var_212_9 = (arg_209_1.time_ - var_212_7) / var_212_8

				if arg_209_1.var_.characterEffect1037ui_story then
					arg_209_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_7 + var_212_8 and arg_209_1.time_ < var_212_7 + var_212_8 + arg_212_0 and arg_209_1.var_.characterEffect1037ui_story then
				arg_209_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 then
				arg_209_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_212_11 = 0

			if var_212_11 < arg_209_1.time_ and arg_209_1.time_ <= var_212_11 + arg_212_0 then
				arg_209_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action425")
			end

			local var_212_12 = 0
			local var_212_13 = 0.65

			if var_212_12 < arg_209_1.time_ and arg_209_1.time_ <= var_212_12 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_14 = arg_209_1:FormatText(StoryNameCfg[15].name)

				arg_209_1.leftNameTxt_.text = var_212_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_15 = arg_209_1:GetWordFromCfg(103701052)
				local var_212_16 = arg_209_1:FormatText(var_212_15.content)

				arg_209_1.text_.text = var_212_16

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_17 = 26
				local var_212_18 = utf8.len(var_212_16)
				local var_212_19 = var_212_17 <= 0 and var_212_13 or var_212_13 * (var_212_18 / var_212_17)

				if var_212_19 > 0 and var_212_13 < var_212_19 then
					arg_209_1.talkMaxDuration = var_212_19

					if var_212_19 + var_212_12 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_19 + var_212_12
					end
				end

				arg_209_1.text_.text = var_212_16
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701052", "story_v_side_old_103701.awb") ~= 0 then
					local var_212_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701052", "story_v_side_old_103701.awb") / 1000

					if var_212_20 + var_212_12 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_20 + var_212_12
					end

					if var_212_15.prefab_name ~= "" and arg_209_1.actors_[var_212_15.prefab_name] ~= nil then
						local var_212_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_15.prefab_name].transform, "story_v_side_old_103701", "103701052", "story_v_side_old_103701.awb")

						arg_209_1:RecordAudio("103701052", var_212_21)
						arg_209_1:RecordAudio("103701052", var_212_21)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701052", "story_v_side_old_103701.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701052", "story_v_side_old_103701.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_22 = math.max(var_212_13, arg_209_1.talkMaxDuration)

			if var_212_12 <= arg_209_1.time_ and arg_209_1.time_ < var_212_12 + var_212_22 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_12) / var_212_22

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_12 + var_212_22 and arg_209_1.time_ < var_212_12 + var_212_22 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play103701053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 103701053
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play103701054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1019ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1019ui_story == nil then
				arg_213_1.var_.characterEffect1019ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.2

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1019ui_story then
					local var_216_4 = Mathf.Lerp(0, 0.5, var_216_3)

					arg_213_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1019ui_story.fillRatio = var_216_4
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1019ui_story then
				local var_216_5 = 0.5

				arg_213_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1019ui_story.fillRatio = var_216_5
			end

			local var_216_6 = arg_213_1.actors_["1037ui_story"]
			local var_216_7 = 0

			if var_216_7 < arg_213_1.time_ and arg_213_1.time_ <= var_216_7 + arg_216_0 and arg_213_1.var_.characterEffect1037ui_story == nil then
				arg_213_1.var_.characterEffect1037ui_story = var_216_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_8 = 0.2

			if var_216_7 <= arg_213_1.time_ and arg_213_1.time_ < var_216_7 + var_216_8 then
				local var_216_9 = (arg_213_1.time_ - var_216_7) / var_216_8

				if arg_213_1.var_.characterEffect1037ui_story then
					local var_216_10 = Mathf.Lerp(0, 0.5, var_216_9)

					arg_213_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1037ui_story.fillRatio = var_216_10
				end
			end

			if arg_213_1.time_ >= var_216_7 + var_216_8 and arg_213_1.time_ < var_216_7 + var_216_8 + arg_216_0 and arg_213_1.var_.characterEffect1037ui_story then
				local var_216_11 = 0.5

				arg_213_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1037ui_story.fillRatio = var_216_11
			end

			local var_216_12 = 0
			local var_216_13 = 0.175

			if var_216_12 < arg_213_1.time_ and arg_213_1.time_ <= var_216_12 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_14 = arg_213_1:FormatText(StoryNameCfg[7].name)

				arg_213_1.leftNameTxt_.text = var_216_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_15 = arg_213_1:GetWordFromCfg(103701053)
				local var_216_16 = arg_213_1:FormatText(var_216_15.content)

				arg_213_1.text_.text = var_216_16

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_17 = 7
				local var_216_18 = utf8.len(var_216_16)
				local var_216_19 = var_216_17 <= 0 and var_216_13 or var_216_13 * (var_216_18 / var_216_17)

				if var_216_19 > 0 and var_216_13 < var_216_19 then
					arg_213_1.talkMaxDuration = var_216_19

					if var_216_19 + var_216_12 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_19 + var_216_12
					end
				end

				arg_213_1.text_.text = var_216_16
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_20 = math.max(var_216_13, arg_213_1.talkMaxDuration)

			if var_216_12 <= arg_213_1.time_ and arg_213_1.time_ < var_216_12 + var_216_20 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_12) / var_216_20

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_12 + var_216_20 and arg_213_1.time_ < var_216_12 + var_216_20 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play103701054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 103701054
		arg_217_1.duration_ = 1.999999999999

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play103701055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1019ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and arg_217_1.var_.characterEffect1019ui_story == nil then
				arg_217_1.var_.characterEffect1019ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.2

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect1019ui_story then
					arg_217_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect1019ui_story then
				arg_217_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_220_4 = arg_217_1.actors_["1037ui_story"]
			local var_220_5 = 0

			if var_220_5 < arg_217_1.time_ and arg_217_1.time_ <= var_220_5 + arg_220_0 and arg_217_1.var_.characterEffect1037ui_story == nil then
				arg_217_1.var_.characterEffect1037ui_story = var_220_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_6 = 0.2

			if var_220_5 <= arg_217_1.time_ and arg_217_1.time_ < var_220_5 + var_220_6 then
				local var_220_7 = (arg_217_1.time_ - var_220_5) / var_220_6

				if arg_217_1.var_.characterEffect1037ui_story then
					arg_217_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_5 + var_220_6 and arg_217_1.time_ < var_220_5 + var_220_6 + arg_220_0 and arg_217_1.var_.characterEffect1037ui_story then
				arg_217_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_220_8 = 0

			if var_220_8 < arg_217_1.time_ and arg_217_1.time_ <= var_220_8 + arg_220_0 then
				arg_217_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_220_9 = 0

			if var_220_9 < arg_217_1.time_ and arg_217_1.time_ <= var_220_9 + arg_220_0 then
				arg_217_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action454")
			end

			local var_220_10 = 0

			if var_220_10 < arg_217_1.time_ and arg_217_1.time_ <= var_220_10 + arg_220_0 then
				arg_217_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_220_11 = 0

			if var_220_11 < arg_217_1.time_ and arg_217_1.time_ <= var_220_11 + arg_220_0 then
				arg_217_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_220_12 = 0
			local var_220_13 = 0.05

			if var_220_12 < arg_217_1.time_ and arg_217_1.time_ <= var_220_12 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_14 = arg_217_1:FormatText(StoryNameCfg[11].name)

				arg_217_1.leftNameTxt_.text = var_220_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_15 = arg_217_1:GetWordFromCfg(103701054)
				local var_220_16 = arg_217_1:FormatText(var_220_15.content)

				arg_217_1.text_.text = var_220_16

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_17 = 2
				local var_220_18 = utf8.len(var_220_16)
				local var_220_19 = var_220_17 <= 0 and var_220_13 or var_220_13 * (var_220_18 / var_220_17)

				if var_220_19 > 0 and var_220_13 < var_220_19 then
					arg_217_1.talkMaxDuration = var_220_19

					if var_220_19 + var_220_12 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_19 + var_220_12
					end
				end

				arg_217_1.text_.text = var_220_16
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701054", "story_v_side_old_103701.awb") ~= 0 then
					local var_220_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701054", "story_v_side_old_103701.awb") / 1000

					if var_220_20 + var_220_12 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_20 + var_220_12
					end

					if var_220_15.prefab_name ~= "" and arg_217_1.actors_[var_220_15.prefab_name] ~= nil then
						local var_220_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_15.prefab_name].transform, "story_v_side_old_103701", "103701054", "story_v_side_old_103701.awb")

						arg_217_1:RecordAudio("103701054", var_220_21)
						arg_217_1:RecordAudio("103701054", var_220_21)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701054", "story_v_side_old_103701.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701054", "story_v_side_old_103701.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_22 = math.max(var_220_13, arg_217_1.talkMaxDuration)

			if var_220_12 <= arg_217_1.time_ and arg_217_1.time_ < var_220_12 + var_220_22 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_12) / var_220_22

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_12 + var_220_22 and arg_217_1.time_ < var_220_12 + var_220_22 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play103701055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 103701055
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play103701056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1019ui_story"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 and arg_221_1.var_.characterEffect1019ui_story == nil then
				arg_221_1.var_.characterEffect1019ui_story = var_224_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_2 = 0.2

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2

				if arg_221_1.var_.characterEffect1019ui_story then
					local var_224_4 = Mathf.Lerp(0, 0.5, var_224_3)

					arg_221_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1019ui_story.fillRatio = var_224_4
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 and arg_221_1.var_.characterEffect1019ui_story then
				local var_224_5 = 0.5

				arg_221_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1019ui_story.fillRatio = var_224_5
			end

			local var_224_6 = arg_221_1.actors_["1037ui_story"]
			local var_224_7 = 0

			if var_224_7 < arg_221_1.time_ and arg_221_1.time_ <= var_224_7 + arg_224_0 and arg_221_1.var_.characterEffect1037ui_story == nil then
				arg_221_1.var_.characterEffect1037ui_story = var_224_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_8 = 0.2

			if var_224_7 <= arg_221_1.time_ and arg_221_1.time_ < var_224_7 + var_224_8 then
				local var_224_9 = (arg_221_1.time_ - var_224_7) / var_224_8

				if arg_221_1.var_.characterEffect1037ui_story then
					local var_224_10 = Mathf.Lerp(0, 0.5, var_224_9)

					arg_221_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_221_1.var_.characterEffect1037ui_story.fillRatio = var_224_10
				end
			end

			if arg_221_1.time_ >= var_224_7 + var_224_8 and arg_221_1.time_ < var_224_7 + var_224_8 + arg_224_0 and arg_221_1.var_.characterEffect1037ui_story then
				local var_224_11 = 0.5

				arg_221_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_221_1.var_.characterEffect1037ui_story.fillRatio = var_224_11
			end

			local var_224_12 = 0
			local var_224_13 = 0.525

			if var_224_12 < arg_221_1.time_ and arg_221_1.time_ <= var_224_12 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_14 = arg_221_1:FormatText(StoryNameCfg[7].name)

				arg_221_1.leftNameTxt_.text = var_224_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_15 = arg_221_1:GetWordFromCfg(103701055)
				local var_224_16 = arg_221_1:FormatText(var_224_15.content)

				arg_221_1.text_.text = var_224_16

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_17 = 21
				local var_224_18 = utf8.len(var_224_16)
				local var_224_19 = var_224_17 <= 0 and var_224_13 or var_224_13 * (var_224_18 / var_224_17)

				if var_224_19 > 0 and var_224_13 < var_224_19 then
					arg_221_1.talkMaxDuration = var_224_19

					if var_224_19 + var_224_12 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_19 + var_224_12
					end
				end

				arg_221_1.text_.text = var_224_16
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_20 = math.max(var_224_13, arg_221_1.talkMaxDuration)

			if var_224_12 <= arg_221_1.time_ and arg_221_1.time_ < var_224_12 + var_224_20 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_12) / var_224_20

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_12 + var_224_20 and arg_221_1.time_ < var_224_12 + var_224_20 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play103701056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 103701056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play103701057(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 0.6

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_2 = arg_225_1:FormatText(StoryNameCfg[7].name)

				arg_225_1.leftNameTxt_.text = var_228_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_3 = arg_225_1:GetWordFromCfg(103701056)
				local var_228_4 = arg_225_1:FormatText(var_228_3.content)

				arg_225_1.text_.text = var_228_4

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_5 = 24
				local var_228_6 = utf8.len(var_228_4)
				local var_228_7 = var_228_5 <= 0 and var_228_1 or var_228_1 * (var_228_6 / var_228_5)

				if var_228_7 > 0 and var_228_1 < var_228_7 then
					arg_225_1.talkMaxDuration = var_228_7

					if var_228_7 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_7 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_4
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_8 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_8 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_8

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_8 and arg_225_1.time_ < var_228_0 + var_228_8 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play103701057 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 103701057
		arg_229_1.duration_ = 1.999999999999

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play103701058(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1019ui_story"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.characterEffect1019ui_story == nil then
				arg_229_1.var_.characterEffect1019ui_story = var_232_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_2 = 0.2

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.characterEffect1019ui_story then
					arg_229_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1019ui_story then
				arg_229_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_232_4 = 0

			if var_232_4 < arg_229_1.time_ and arg_229_1.time_ <= var_232_4 + arg_232_0 then
				arg_229_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_232_5 = 0

			if var_232_5 < arg_229_1.time_ and arg_229_1.time_ <= var_232_5 + arg_232_0 then
				arg_229_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action462")
			end

			local var_232_6 = 0
			local var_232_7 = 0.175

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_8 = arg_229_1:FormatText(StoryNameCfg[13].name)

				arg_229_1.leftNameTxt_.text = var_232_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_9 = arg_229_1:GetWordFromCfg(103701057)
				local var_232_10 = arg_229_1:FormatText(var_232_9.content)

				arg_229_1.text_.text = var_232_10

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_11 = 7
				local var_232_12 = utf8.len(var_232_10)
				local var_232_13 = var_232_11 <= 0 and var_232_7 or var_232_7 * (var_232_12 / var_232_11)

				if var_232_13 > 0 and var_232_7 < var_232_13 then
					arg_229_1.talkMaxDuration = var_232_13

					if var_232_13 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_13 + var_232_6
					end
				end

				arg_229_1.text_.text = var_232_10
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701057", "story_v_side_old_103701.awb") ~= 0 then
					local var_232_14 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701057", "story_v_side_old_103701.awb") / 1000

					if var_232_14 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_14 + var_232_6
					end

					if var_232_9.prefab_name ~= "" and arg_229_1.actors_[var_232_9.prefab_name] ~= nil then
						local var_232_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_9.prefab_name].transform, "story_v_side_old_103701", "103701057", "story_v_side_old_103701.awb")

						arg_229_1:RecordAudio("103701057", var_232_15)
						arg_229_1:RecordAudio("103701057", var_232_15)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701057", "story_v_side_old_103701.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701057", "story_v_side_old_103701.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_16 = math.max(var_232_7, arg_229_1.talkMaxDuration)

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_16 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_6) / var_232_16

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_6 + var_232_16 and arg_229_1.time_ < var_232_6 + var_232_16 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play103701058 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 103701058
		arg_233_1.duration_ = 12.133

		local var_233_0 = {
			ja = 12.133,
			ko = 8,
			en = 6.7
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
				arg_233_0:Play103701059(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_236_1 = 0
			local var_236_2 = 0.925

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_3 = arg_233_1:FormatText(StoryNameCfg[13].name)

				arg_233_1.leftNameTxt_.text = var_236_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_4 = arg_233_1:GetWordFromCfg(103701058)
				local var_236_5 = arg_233_1:FormatText(var_236_4.content)

				arg_233_1.text_.text = var_236_5

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_6 = 37
				local var_236_7 = utf8.len(var_236_5)
				local var_236_8 = var_236_6 <= 0 and var_236_2 or var_236_2 * (var_236_7 / var_236_6)

				if var_236_8 > 0 and var_236_2 < var_236_8 then
					arg_233_1.talkMaxDuration = var_236_8

					if var_236_8 + var_236_1 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_8 + var_236_1
					end
				end

				arg_233_1.text_.text = var_236_5
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701058", "story_v_side_old_103701.awb") ~= 0 then
					local var_236_9 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701058", "story_v_side_old_103701.awb") / 1000

					if var_236_9 + var_236_1 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_9 + var_236_1
					end

					if var_236_4.prefab_name ~= "" and arg_233_1.actors_[var_236_4.prefab_name] ~= nil then
						local var_236_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_4.prefab_name].transform, "story_v_side_old_103701", "103701058", "story_v_side_old_103701.awb")

						arg_233_1:RecordAudio("103701058", var_236_10)
						arg_233_1:RecordAudio("103701058", var_236_10)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701058", "story_v_side_old_103701.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701058", "story_v_side_old_103701.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_11 = math.max(var_236_2, arg_233_1.talkMaxDuration)

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_11 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_1) / var_236_11

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_1 + var_236_11 and arg_233_1.time_ < var_236_1 + var_236_11 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play103701059 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 103701059
		arg_237_1.duration_ = 7.933

		local var_237_0 = {
			ja = 7.933,
			ko = 4.733,
			en = 4.4
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
				arg_237_0:Play103701060(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1019ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1019ui_story == nil then
				arg_237_1.var_.characterEffect1019ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1019ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1019ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1019ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1019ui_story.fillRatio = var_240_5
			end

			local var_240_6 = arg_237_1.actors_["1037ui_story"]
			local var_240_7 = 0

			if var_240_7 < arg_237_1.time_ and arg_237_1.time_ <= var_240_7 + arg_240_0 and arg_237_1.var_.characterEffect1037ui_story == nil then
				arg_237_1.var_.characterEffect1037ui_story = var_240_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_8 = 0.2

			if var_240_7 <= arg_237_1.time_ and arg_237_1.time_ < var_240_7 + var_240_8 then
				local var_240_9 = (arg_237_1.time_ - var_240_7) / var_240_8

				if arg_237_1.var_.characterEffect1037ui_story then
					arg_237_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_7 + var_240_8 and arg_237_1.time_ < var_240_7 + var_240_8 + arg_240_0 and arg_237_1.var_.characterEffect1037ui_story then
				arg_237_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_240_10 = 0

			if var_240_10 < arg_237_1.time_ and arg_237_1.time_ <= var_240_10 + arg_240_0 then
				arg_237_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_240_11 = 0

			if var_240_11 < arg_237_1.time_ and arg_237_1.time_ <= var_240_11 + arg_240_0 then
				arg_237_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action4_2")
			end

			local var_240_12 = 0
			local var_240_13 = 0.6

			if var_240_12 < arg_237_1.time_ and arg_237_1.time_ <= var_240_12 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_14 = arg_237_1:FormatText(StoryNameCfg[15].name)

				arg_237_1.leftNameTxt_.text = var_240_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_15 = arg_237_1:GetWordFromCfg(103701059)
				local var_240_16 = arg_237_1:FormatText(var_240_15.content)

				arg_237_1.text_.text = var_240_16

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_17 = 24
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

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701059", "story_v_side_old_103701.awb") ~= 0 then
					local var_240_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701059", "story_v_side_old_103701.awb") / 1000

					if var_240_20 + var_240_12 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_20 + var_240_12
					end

					if var_240_15.prefab_name ~= "" and arg_237_1.actors_[var_240_15.prefab_name] ~= nil then
						local var_240_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_15.prefab_name].transform, "story_v_side_old_103701", "103701059", "story_v_side_old_103701.awb")

						arg_237_1:RecordAudio("103701059", var_240_21)
						arg_237_1:RecordAudio("103701059", var_240_21)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701059", "story_v_side_old_103701.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701059", "story_v_side_old_103701.awb")
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
	Play103701060 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 103701060
		arg_241_1.duration_ = 7.8

		local var_241_0 = {
			ja = 5.733,
			ko = 4.833,
			en = 7.8
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
				arg_241_0:Play103701061(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_244_1 = 0
			local var_244_2 = 0.65

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_3 = arg_241_1:FormatText(StoryNameCfg[15].name)

				arg_241_1.leftNameTxt_.text = var_244_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_4 = arg_241_1:GetWordFromCfg(103701060)
				local var_244_5 = arg_241_1:FormatText(var_244_4.content)

				arg_241_1.text_.text = var_244_5

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_6 = 26
				local var_244_7 = utf8.len(var_244_5)
				local var_244_8 = var_244_6 <= 0 and var_244_2 or var_244_2 * (var_244_7 / var_244_6)

				if var_244_8 > 0 and var_244_2 < var_244_8 then
					arg_241_1.talkMaxDuration = var_244_8

					if var_244_8 + var_244_1 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_8 + var_244_1
					end
				end

				arg_241_1.text_.text = var_244_5
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701060", "story_v_side_old_103701.awb") ~= 0 then
					local var_244_9 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701060", "story_v_side_old_103701.awb") / 1000

					if var_244_9 + var_244_1 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_9 + var_244_1
					end

					if var_244_4.prefab_name ~= "" and arg_241_1.actors_[var_244_4.prefab_name] ~= nil then
						local var_244_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_4.prefab_name].transform, "story_v_side_old_103701", "103701060", "story_v_side_old_103701.awb")

						arg_241_1:RecordAudio("103701060", var_244_10)
						arg_241_1:RecordAudio("103701060", var_244_10)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701060", "story_v_side_old_103701.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701060", "story_v_side_old_103701.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_11 = math.max(var_244_2, arg_241_1.talkMaxDuration)

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_11 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_1) / var_244_11

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_1 + var_244_11 and arg_241_1.time_ < var_244_1 + var_244_11 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play103701061 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 103701061
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play103701062(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["1037ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect1037ui_story == nil then
				arg_245_1.var_.characterEffect1037ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.2

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect1037ui_story then
					local var_248_4 = Mathf.Lerp(0, 0.5, var_248_3)

					arg_245_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1037ui_story.fillRatio = var_248_4
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1037ui_story then
				local var_248_5 = 0.5

				arg_245_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1037ui_story.fillRatio = var_248_5
			end

			local var_248_6 = 0
			local var_248_7 = 0.875

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_8 = arg_245_1:FormatText(StoryNameCfg[7].name)

				arg_245_1.leftNameTxt_.text = var_248_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_9 = arg_245_1:GetWordFromCfg(103701061)
				local var_248_10 = arg_245_1:FormatText(var_248_9.content)

				arg_245_1.text_.text = var_248_10

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_11 = 35
				local var_248_12 = utf8.len(var_248_10)
				local var_248_13 = var_248_11 <= 0 and var_248_7 or var_248_7 * (var_248_12 / var_248_11)

				if var_248_13 > 0 and var_248_7 < var_248_13 then
					arg_245_1.talkMaxDuration = var_248_13

					if var_248_13 + var_248_6 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_13 + var_248_6
					end
				end

				arg_245_1.text_.text = var_248_10
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_14 = math.max(var_248_7, arg_245_1.talkMaxDuration)

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_14 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_6) / var_248_14

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_6 + var_248_14 and arg_245_1.time_ < var_248_6 + var_248_14 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play103701062 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 103701062
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play103701063(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_252_1 = 0
			local var_252_2 = 0.425

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, false)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(103701062)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 17
				local var_252_6 = utf8.len(var_252_4)
				local var_252_7 = var_252_5 <= 0 and var_252_2 or var_252_2 * (var_252_6 / var_252_5)

				if var_252_7 > 0 and var_252_2 < var_252_7 then
					arg_249_1.talkMaxDuration = var_252_7

					if var_252_7 + var_252_1 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_7 + var_252_1
					end
				end

				arg_249_1.text_.text = var_252_4
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_8 = math.max(var_252_2, arg_249_1.talkMaxDuration)

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_8 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_1) / var_252_8

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_1 + var_252_8 and arg_249_1.time_ < var_252_1 + var_252_8 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play103701063 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 103701063
		arg_253_1.duration_ = 7.566

		local var_253_0 = {
			ja = 5.8,
			ko = 5.633,
			en = 7.566
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
				arg_253_0:Play103701064(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1019ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1019ui_story == nil then
				arg_253_1.var_.characterEffect1019ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.2

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1019ui_story then
					arg_253_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1019ui_story then
				arg_253_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_256_4 = 0

			if var_256_4 < arg_253_1.time_ and arg_253_1.time_ <= var_256_4 + arg_256_0 then
				arg_253_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_256_5 = 0

			if var_256_5 < arg_253_1.time_ and arg_253_1.time_ <= var_256_5 + arg_256_0 then
				arg_253_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action465")
			end

			local var_256_6 = 0
			local var_256_7 = 0.925

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_8 = arg_253_1:FormatText(StoryNameCfg[13].name)

				arg_253_1.leftNameTxt_.text = var_256_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_9 = arg_253_1:GetWordFromCfg(103701063)
				local var_256_10 = arg_253_1:FormatText(var_256_9.content)

				arg_253_1.text_.text = var_256_10

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_11 = 37
				local var_256_12 = utf8.len(var_256_10)
				local var_256_13 = var_256_11 <= 0 and var_256_7 or var_256_7 * (var_256_12 / var_256_11)

				if var_256_13 > 0 and var_256_7 < var_256_13 then
					arg_253_1.talkMaxDuration = var_256_13

					if var_256_13 + var_256_6 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_13 + var_256_6
					end
				end

				arg_253_1.text_.text = var_256_10
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701063", "story_v_side_old_103701.awb") ~= 0 then
					local var_256_14 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701063", "story_v_side_old_103701.awb") / 1000

					if var_256_14 + var_256_6 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_14 + var_256_6
					end

					if var_256_9.prefab_name ~= "" and arg_253_1.actors_[var_256_9.prefab_name] ~= nil then
						local var_256_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_9.prefab_name].transform, "story_v_side_old_103701", "103701063", "story_v_side_old_103701.awb")

						arg_253_1:RecordAudio("103701063", var_256_15)
						arg_253_1:RecordAudio("103701063", var_256_15)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701063", "story_v_side_old_103701.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701063", "story_v_side_old_103701.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_16 = math.max(var_256_7, arg_253_1.talkMaxDuration)

			if var_256_6 <= arg_253_1.time_ and arg_253_1.time_ < var_256_6 + var_256_16 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_6) / var_256_16

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_6 + var_256_16 and arg_253_1.time_ < var_256_6 + var_256_16 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play103701064 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 103701064
		arg_257_1.duration_ = 6.466

		local var_257_0 = {
			ja = 6.466,
			ko = 4.8,
			en = 4.4
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
				arg_257_0:Play103701065(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_260_1 = 0
			local var_260_2 = 0.675

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_3 = arg_257_1:FormatText(StoryNameCfg[13].name)

				arg_257_1.leftNameTxt_.text = var_260_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_4 = arg_257_1:GetWordFromCfg(103701064)
				local var_260_5 = arg_257_1:FormatText(var_260_4.content)

				arg_257_1.text_.text = var_260_5

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_6 = 27
				local var_260_7 = utf8.len(var_260_5)
				local var_260_8 = var_260_6 <= 0 and var_260_2 or var_260_2 * (var_260_7 / var_260_6)

				if var_260_8 > 0 and var_260_2 < var_260_8 then
					arg_257_1.talkMaxDuration = var_260_8

					if var_260_8 + var_260_1 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_1
					end
				end

				arg_257_1.text_.text = var_260_5
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701064", "story_v_side_old_103701.awb") ~= 0 then
					local var_260_9 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701064", "story_v_side_old_103701.awb") / 1000

					if var_260_9 + var_260_1 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_9 + var_260_1
					end

					if var_260_4.prefab_name ~= "" and arg_257_1.actors_[var_260_4.prefab_name] ~= nil then
						local var_260_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_4.prefab_name].transform, "story_v_side_old_103701", "103701064", "story_v_side_old_103701.awb")

						arg_257_1:RecordAudio("103701064", var_260_10)
						arg_257_1:RecordAudio("103701064", var_260_10)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701064", "story_v_side_old_103701.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701064", "story_v_side_old_103701.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_11 = math.max(var_260_2, arg_257_1.talkMaxDuration)

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_11 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_1) / var_260_11

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_1 + var_260_11 and arg_257_1.time_ < var_260_1 + var_260_11 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play103701065 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 103701065
		arg_261_1.duration_ = 13.066

		local var_261_0 = {
			ja = 13.066,
			ko = 5.8,
			en = 7.4
		}
		local var_261_1 = manager.audio:GetLocalizationFlag()

		if var_261_0[var_261_1] ~= nil then
			arg_261_1.duration_ = var_261_0[var_261_1]
		end

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play103701066(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1019ui_story"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 and arg_261_1.var_.characterEffect1019ui_story == nil then
				arg_261_1.var_.characterEffect1019ui_story = var_264_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_2 = 0.2

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2

				if arg_261_1.var_.characterEffect1019ui_story then
					local var_264_4 = Mathf.Lerp(0, 0.5, var_264_3)

					arg_261_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_261_1.var_.characterEffect1019ui_story.fillRatio = var_264_4
				end
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 and arg_261_1.var_.characterEffect1019ui_story then
				local var_264_5 = 0.5

				arg_261_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_261_1.var_.characterEffect1019ui_story.fillRatio = var_264_5
			end

			local var_264_6 = arg_261_1.actors_["1037ui_story"]
			local var_264_7 = 0

			if var_264_7 < arg_261_1.time_ and arg_261_1.time_ <= var_264_7 + arg_264_0 and arg_261_1.var_.characterEffect1037ui_story == nil then
				arg_261_1.var_.characterEffect1037ui_story = var_264_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_8 = 0.2

			if var_264_7 <= arg_261_1.time_ and arg_261_1.time_ < var_264_7 + var_264_8 then
				local var_264_9 = (arg_261_1.time_ - var_264_7) / var_264_8

				if arg_261_1.var_.characterEffect1037ui_story then
					arg_261_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_7 + var_264_8 and arg_261_1.time_ < var_264_7 + var_264_8 + arg_264_0 and arg_261_1.var_.characterEffect1037ui_story then
				arg_261_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_264_10 = 0

			if var_264_10 < arg_261_1.time_ and arg_261_1.time_ <= var_264_10 + arg_264_0 then
				arg_261_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_264_11 = 0

			if var_264_11 < arg_261_1.time_ and arg_261_1.time_ <= var_264_11 + arg_264_0 then
				arg_261_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action2_1")
			end

			local var_264_12 = 0
			local var_264_13 = 0.875

			if var_264_12 < arg_261_1.time_ and arg_261_1.time_ <= var_264_12 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_14 = arg_261_1:FormatText(StoryNameCfg[15].name)

				arg_261_1.leftNameTxt_.text = var_264_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_15 = arg_261_1:GetWordFromCfg(103701065)
				local var_264_16 = arg_261_1:FormatText(var_264_15.content)

				arg_261_1.text_.text = var_264_16

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_17 = 35
				local var_264_18 = utf8.len(var_264_16)
				local var_264_19 = var_264_17 <= 0 and var_264_13 or var_264_13 * (var_264_18 / var_264_17)

				if var_264_19 > 0 and var_264_13 < var_264_19 then
					arg_261_1.talkMaxDuration = var_264_19

					if var_264_19 + var_264_12 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_19 + var_264_12
					end
				end

				arg_261_1.text_.text = var_264_16
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701065", "story_v_side_old_103701.awb") ~= 0 then
					local var_264_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701065", "story_v_side_old_103701.awb") / 1000

					if var_264_20 + var_264_12 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_20 + var_264_12
					end

					if var_264_15.prefab_name ~= "" and arg_261_1.actors_[var_264_15.prefab_name] ~= nil then
						local var_264_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_15.prefab_name].transform, "story_v_side_old_103701", "103701065", "story_v_side_old_103701.awb")

						arg_261_1:RecordAudio("103701065", var_264_21)
						arg_261_1:RecordAudio("103701065", var_264_21)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701065", "story_v_side_old_103701.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701065", "story_v_side_old_103701.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_22 = math.max(var_264_13, arg_261_1.talkMaxDuration)

			if var_264_12 <= arg_261_1.time_ and arg_261_1.time_ < var_264_12 + var_264_22 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_12) / var_264_22

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_12 + var_264_22 and arg_261_1.time_ < var_264_12 + var_264_22 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play103701066 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 103701066
		arg_265_1.duration_ = 6.766

		local var_265_0 = {
			ja = 6.766,
			ko = 4.633,
			en = 4.933
		}
		local var_265_1 = manager.audio:GetLocalizationFlag()

		if var_265_0[var_265_1] ~= nil then
			arg_265_1.duration_ = var_265_0[var_265_1]
		end

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play103701067(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action426")
			end

			local var_268_2 = 0
			local var_268_3 = 0.6

			if var_268_2 < arg_265_1.time_ and arg_265_1.time_ <= var_268_2 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_4 = arg_265_1:FormatText(StoryNameCfg[15].name)

				arg_265_1.leftNameTxt_.text = var_268_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_5 = arg_265_1:GetWordFromCfg(103701066)
				local var_268_6 = arg_265_1:FormatText(var_268_5.content)

				arg_265_1.text_.text = var_268_6

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_7 = 24
				local var_268_8 = utf8.len(var_268_6)
				local var_268_9 = var_268_7 <= 0 and var_268_3 or var_268_3 * (var_268_8 / var_268_7)

				if var_268_9 > 0 and var_268_3 < var_268_9 then
					arg_265_1.talkMaxDuration = var_268_9

					if var_268_9 + var_268_2 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_9 + var_268_2
					end
				end

				arg_265_1.text_.text = var_268_6
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701066", "story_v_side_old_103701.awb") ~= 0 then
					local var_268_10 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701066", "story_v_side_old_103701.awb") / 1000

					if var_268_10 + var_268_2 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_10 + var_268_2
					end

					if var_268_5.prefab_name ~= "" and arg_265_1.actors_[var_268_5.prefab_name] ~= nil then
						local var_268_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_5.prefab_name].transform, "story_v_side_old_103701", "103701066", "story_v_side_old_103701.awb")

						arg_265_1:RecordAudio("103701066", var_268_11)
						arg_265_1:RecordAudio("103701066", var_268_11)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701066", "story_v_side_old_103701.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701066", "story_v_side_old_103701.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_12 = math.max(var_268_3, arg_265_1.talkMaxDuration)

			if var_268_2 <= arg_265_1.time_ and arg_265_1.time_ < var_268_2 + var_268_12 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_2) / var_268_12

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_2 + var_268_12 and arg_265_1.time_ < var_268_2 + var_268_12 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play103701067 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 103701067
		arg_269_1.duration_ = 9.7

		local var_269_0 = {
			ja = 9.7,
			ko = 5.5,
			en = 4.633
		}
		local var_269_1 = manager.audio:GetLocalizationFlag()

		if var_269_0[var_269_1] ~= nil then
			arg_269_1.duration_ = var_269_0[var_269_1]
		end

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play103701068(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1037ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect1037ui_story == nil then
				arg_269_1.var_.characterEffect1037ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.2

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1037ui_story then
					local var_272_4 = Mathf.Lerp(0, 0.5, var_272_3)

					arg_269_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1037ui_story.fillRatio = var_272_4
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1037ui_story then
				local var_272_5 = 0.5

				arg_269_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1037ui_story.fillRatio = var_272_5
			end

			local var_272_6 = arg_269_1.actors_["1019ui_story"]
			local var_272_7 = 0

			if var_272_7 < arg_269_1.time_ and arg_269_1.time_ <= var_272_7 + arg_272_0 and arg_269_1.var_.characterEffect1019ui_story == nil then
				arg_269_1.var_.characterEffect1019ui_story = var_272_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_8 = 0.2

			if var_272_7 <= arg_269_1.time_ and arg_269_1.time_ < var_272_7 + var_272_8 then
				local var_272_9 = (arg_269_1.time_ - var_272_7) / var_272_8

				if arg_269_1.var_.characterEffect1019ui_story then
					arg_269_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_7 + var_272_8 and arg_269_1.time_ < var_272_7 + var_272_8 + arg_272_0 and arg_269_1.var_.characterEffect1019ui_story then
				arg_269_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_272_10 = 0

			if var_272_10 < arg_269_1.time_ and arg_269_1.time_ <= var_272_10 + arg_272_0 then
				arg_269_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_272_11 = 0
			local var_272_12 = 0.75

			if var_272_11 < arg_269_1.time_ and arg_269_1.time_ <= var_272_11 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_13 = arg_269_1:FormatText(StoryNameCfg[13].name)

				arg_269_1.leftNameTxt_.text = var_272_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_14 = arg_269_1:GetWordFromCfg(103701067)
				local var_272_15 = arg_269_1:FormatText(var_272_14.content)

				arg_269_1.text_.text = var_272_15

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_16 = 30
				local var_272_17 = utf8.len(var_272_15)
				local var_272_18 = var_272_16 <= 0 and var_272_12 or var_272_12 * (var_272_17 / var_272_16)

				if var_272_18 > 0 and var_272_12 < var_272_18 then
					arg_269_1.talkMaxDuration = var_272_18

					if var_272_18 + var_272_11 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_18 + var_272_11
					end
				end

				arg_269_1.text_.text = var_272_15
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701067", "story_v_side_old_103701.awb") ~= 0 then
					local var_272_19 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701067", "story_v_side_old_103701.awb") / 1000

					if var_272_19 + var_272_11 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_19 + var_272_11
					end

					if var_272_14.prefab_name ~= "" and arg_269_1.actors_[var_272_14.prefab_name] ~= nil then
						local var_272_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_14.prefab_name].transform, "story_v_side_old_103701", "103701067", "story_v_side_old_103701.awb")

						arg_269_1:RecordAudio("103701067", var_272_20)
						arg_269_1:RecordAudio("103701067", var_272_20)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701067", "story_v_side_old_103701.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701067", "story_v_side_old_103701.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_21 = math.max(var_272_12, arg_269_1.talkMaxDuration)

			if var_272_11 <= arg_269_1.time_ and arg_269_1.time_ < var_272_11 + var_272_21 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_11) / var_272_21

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_11 + var_272_21 and arg_269_1.time_ < var_272_11 + var_272_21 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play103701068 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 103701068
		arg_273_1.duration_ = 4.8

		local var_273_0 = {
			ja = 4.566,
			ko = 4.8,
			en = 4.8
		}
		local var_273_1 = manager.audio:GetLocalizationFlag()

		if var_273_0[var_273_1] ~= nil then
			arg_273_1.duration_ = var_273_0[var_273_1]
		end

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play103701069(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["1019ui_story"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and arg_273_1.var_.characterEffect1019ui_story == nil then
				arg_273_1.var_.characterEffect1019ui_story = var_276_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_2 = 0.2

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.characterEffect1019ui_story then
					local var_276_4 = Mathf.Lerp(0, 0.5, var_276_3)

					arg_273_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1019ui_story.fillRatio = var_276_4
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and arg_273_1.var_.characterEffect1019ui_story then
				local var_276_5 = 0.5

				arg_273_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1019ui_story.fillRatio = var_276_5
			end

			local var_276_6 = arg_273_1.actors_["1037ui_story"]
			local var_276_7 = 0

			if var_276_7 < arg_273_1.time_ and arg_273_1.time_ <= var_276_7 + arg_276_0 and arg_273_1.var_.characterEffect1037ui_story == nil then
				arg_273_1.var_.characterEffect1037ui_story = var_276_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_8 = 0.2

			if var_276_7 <= arg_273_1.time_ and arg_273_1.time_ < var_276_7 + var_276_8 then
				local var_276_9 = (arg_273_1.time_ - var_276_7) / var_276_8

				if arg_273_1.var_.characterEffect1037ui_story then
					arg_273_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_273_1.time_ >= var_276_7 + var_276_8 and arg_273_1.time_ < var_276_7 + var_276_8 + arg_276_0 and arg_273_1.var_.characterEffect1037ui_story then
				arg_273_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_276_10 = 0

			if var_276_10 < arg_273_1.time_ and arg_273_1.time_ <= var_276_10 + arg_276_0 then
				arg_273_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_276_11 = 0

			if var_276_11 < arg_273_1.time_ and arg_273_1.time_ <= var_276_11 + arg_276_0 then
				arg_273_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action462")
			end

			local var_276_12 = 0
			local var_276_13 = 0.45

			if var_276_12 < arg_273_1.time_ and arg_273_1.time_ <= var_276_12 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_14 = arg_273_1:FormatText(StoryNameCfg[15].name)

				arg_273_1.leftNameTxt_.text = var_276_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_15 = arg_273_1:GetWordFromCfg(103701068)
				local var_276_16 = arg_273_1:FormatText(var_276_15.content)

				arg_273_1.text_.text = var_276_16

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_17 = 18
				local var_276_18 = utf8.len(var_276_16)
				local var_276_19 = var_276_17 <= 0 and var_276_13 or var_276_13 * (var_276_18 / var_276_17)

				if var_276_19 > 0 and var_276_13 < var_276_19 then
					arg_273_1.talkMaxDuration = var_276_19

					if var_276_19 + var_276_12 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_19 + var_276_12
					end
				end

				arg_273_1.text_.text = var_276_16
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701068", "story_v_side_old_103701.awb") ~= 0 then
					local var_276_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701068", "story_v_side_old_103701.awb") / 1000

					if var_276_20 + var_276_12 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_20 + var_276_12
					end

					if var_276_15.prefab_name ~= "" and arg_273_1.actors_[var_276_15.prefab_name] ~= nil then
						local var_276_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_15.prefab_name].transform, "story_v_side_old_103701", "103701068", "story_v_side_old_103701.awb")

						arg_273_1:RecordAudio("103701068", var_276_21)
						arg_273_1:RecordAudio("103701068", var_276_21)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701068", "story_v_side_old_103701.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701068", "story_v_side_old_103701.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_22 = math.max(var_276_13, arg_273_1.talkMaxDuration)

			if var_276_12 <= arg_273_1.time_ and arg_273_1.time_ < var_276_12 + var_276_22 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_12) / var_276_22

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_12 + var_276_22 and arg_273_1.time_ < var_276_12 + var_276_22 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play103701069 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 103701069
		arg_277_1.duration_ = 8.633

		local var_277_0 = {
			ja = 8.633,
			ko = 4.566,
			en = 4.366
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
				arg_277_0:Play103701070(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1019ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect1019ui_story == nil then
				arg_277_1.var_.characterEffect1019ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.2

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect1019ui_story then
					arg_277_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect1019ui_story then
				arg_277_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_280_4 = 0

			if var_280_4 < arg_277_1.time_ and arg_277_1.time_ <= var_280_4 + arg_280_0 then
				arg_277_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_280_5 = 0
			local var_280_6 = 0.65

			if var_280_5 < arg_277_1.time_ and arg_277_1.time_ <= var_280_5 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_7 = arg_277_1:FormatText(StoryNameCfg[13].name)

				arg_277_1.leftNameTxt_.text = var_280_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_8 = arg_277_1:GetWordFromCfg(103701069)
				local var_280_9 = arg_277_1:FormatText(var_280_8.content)

				arg_277_1.text_.text = var_280_9

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_10 = 37
				local var_280_11 = utf8.len(var_280_9)
				local var_280_12 = var_280_10 <= 0 and var_280_6 or var_280_6 * (var_280_11 / var_280_10)

				if var_280_12 > 0 and var_280_6 < var_280_12 then
					arg_277_1.talkMaxDuration = var_280_12

					if var_280_12 + var_280_5 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_12 + var_280_5
					end
				end

				arg_277_1.text_.text = var_280_9
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701069", "story_v_side_old_103701.awb") ~= 0 then
					local var_280_13 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701069", "story_v_side_old_103701.awb") / 1000

					if var_280_13 + var_280_5 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_13 + var_280_5
					end

					if var_280_8.prefab_name ~= "" and arg_277_1.actors_[var_280_8.prefab_name] ~= nil then
						local var_280_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_8.prefab_name].transform, "story_v_side_old_103701", "103701069", "story_v_side_old_103701.awb")

						arg_277_1:RecordAudio("103701069", var_280_14)
						arg_277_1:RecordAudio("103701069", var_280_14)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701069", "story_v_side_old_103701.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701069", "story_v_side_old_103701.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_15 = math.max(var_280_6, arg_277_1.talkMaxDuration)

			if var_280_5 <= arg_277_1.time_ and arg_277_1.time_ < var_280_5 + var_280_15 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_5) / var_280_15

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_5 + var_280_15 and arg_277_1.time_ < var_280_5 + var_280_15 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play103701070 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 103701070
		arg_281_1.duration_ = 3.633

		local var_281_0 = {
			ja = 3.633,
			ko = 2.366,
			en = 1.999999999999
		}
		local var_281_1 = manager.audio:GetLocalizationFlag()

		if var_281_0[var_281_1] ~= nil then
			arg_281_1.duration_ = var_281_0[var_281_1]
		end

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play103701071(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1019ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect1019ui_story == nil then
				arg_281_1.var_.characterEffect1019ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.2

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect1019ui_story then
					local var_284_4 = Mathf.Lerp(0, 0.5, var_284_3)

					arg_281_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1019ui_story.fillRatio = var_284_4
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1019ui_story then
				local var_284_5 = 0.5

				arg_281_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1019ui_story.fillRatio = var_284_5
			end

			local var_284_6 = arg_281_1.actors_["1037ui_story"]
			local var_284_7 = 0

			if var_284_7 < arg_281_1.time_ and arg_281_1.time_ <= var_284_7 + arg_284_0 and arg_281_1.var_.characterEffect1037ui_story == nil then
				arg_281_1.var_.characterEffect1037ui_story = var_284_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_8 = 0.2

			if var_284_7 <= arg_281_1.time_ and arg_281_1.time_ < var_284_7 + var_284_8 then
				local var_284_9 = (arg_281_1.time_ - var_284_7) / var_284_8

				if arg_281_1.var_.characterEffect1037ui_story then
					arg_281_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_7 + var_284_8 and arg_281_1.time_ < var_284_7 + var_284_8 + arg_284_0 and arg_281_1.var_.characterEffect1037ui_story then
				arg_281_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_284_10 = 0

			if var_284_10 < arg_281_1.time_ and arg_281_1.time_ <= var_284_10 + arg_284_0 then
				arg_281_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_284_11 = 0
			local var_284_12 = 0.2

			if var_284_11 < arg_281_1.time_ and arg_281_1.time_ <= var_284_11 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_13 = arg_281_1:FormatText(StoryNameCfg[15].name)

				arg_281_1.leftNameTxt_.text = var_284_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_14 = arg_281_1:GetWordFromCfg(103701070)
				local var_284_15 = arg_281_1:FormatText(var_284_14.content)

				arg_281_1.text_.text = var_284_15

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_16 = 8
				local var_284_17 = utf8.len(var_284_15)
				local var_284_18 = var_284_16 <= 0 and var_284_12 or var_284_12 * (var_284_17 / var_284_16)

				if var_284_18 > 0 and var_284_12 < var_284_18 then
					arg_281_1.talkMaxDuration = var_284_18

					if var_284_18 + var_284_11 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_18 + var_284_11
					end
				end

				arg_281_1.text_.text = var_284_15
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701070", "story_v_side_old_103701.awb") ~= 0 then
					local var_284_19 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701070", "story_v_side_old_103701.awb") / 1000

					if var_284_19 + var_284_11 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_19 + var_284_11
					end

					if var_284_14.prefab_name ~= "" and arg_281_1.actors_[var_284_14.prefab_name] ~= nil then
						local var_284_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_14.prefab_name].transform, "story_v_side_old_103701", "103701070", "story_v_side_old_103701.awb")

						arg_281_1:RecordAudio("103701070", var_284_20)
						arg_281_1:RecordAudio("103701070", var_284_20)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701070", "story_v_side_old_103701.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701070", "story_v_side_old_103701.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_21 = math.max(var_284_12, arg_281_1.talkMaxDuration)

			if var_284_11 <= arg_281_1.time_ and arg_281_1.time_ < var_284_11 + var_284_21 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_11) / var_284_21

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_11 + var_284_21 and arg_281_1.time_ < var_284_11 + var_284_21 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play103701071 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 103701071
		arg_285_1.duration_ = 10.166

		local var_285_0 = {
			ja = 9.066,
			ko = 8,
			en = 10.166
		}
		local var_285_1 = manager.audio:GetLocalizationFlag()

		if var_285_0[var_285_1] ~= nil then
			arg_285_1.duration_ = var_285_0[var_285_1]
		end

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play103701072(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_288_1 = 0
			local var_288_2 = 0.7

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_3 = arg_285_1:FormatText(StoryNameCfg[15].name)

				arg_285_1.leftNameTxt_.text = var_288_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_4 = arg_285_1:GetWordFromCfg(103701071)
				local var_288_5 = arg_285_1:FormatText(var_288_4.content)

				arg_285_1.text_.text = var_288_5

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_6 = 28
				local var_288_7 = utf8.len(var_288_5)
				local var_288_8 = var_288_6 <= 0 and var_288_2 or var_288_2 * (var_288_7 / var_288_6)

				if var_288_8 > 0 and var_288_2 < var_288_8 then
					arg_285_1.talkMaxDuration = var_288_8

					if var_288_8 + var_288_1 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_1
					end
				end

				arg_285_1.text_.text = var_288_5
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701071", "story_v_side_old_103701.awb") ~= 0 then
					local var_288_9 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701071", "story_v_side_old_103701.awb") / 1000

					if var_288_9 + var_288_1 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_9 + var_288_1
					end

					if var_288_4.prefab_name ~= "" and arg_285_1.actors_[var_288_4.prefab_name] ~= nil then
						local var_288_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_4.prefab_name].transform, "story_v_side_old_103701", "103701071", "story_v_side_old_103701.awb")

						arg_285_1:RecordAudio("103701071", var_288_10)
						arg_285_1:RecordAudio("103701071", var_288_10)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701071", "story_v_side_old_103701.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701071", "story_v_side_old_103701.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_11 = math.max(var_288_2, arg_285_1.talkMaxDuration)

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_11 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_1) / var_288_11

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_1 + var_288_11 and arg_285_1.time_ < var_288_1 + var_288_11 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play103701072 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 103701072
		arg_289_1.duration_ = 7.366

		local var_289_0 = {
			ja = 7.366,
			ko = 7.333,
			en = 5.966
		}
		local var_289_1 = manager.audio:GetLocalizationFlag()

		if var_289_0[var_289_1] ~= nil then
			arg_289_1.duration_ = var_289_0[var_289_1]
		end

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play103701073(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_292_1 = 0
			local var_292_2 = 0.9

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_3 = arg_289_1:FormatText(StoryNameCfg[15].name)

				arg_289_1.leftNameTxt_.text = var_292_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_4 = arg_289_1:GetWordFromCfg(103701072)
				local var_292_5 = arg_289_1:FormatText(var_292_4.content)

				arg_289_1.text_.text = var_292_5

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_6 = 36
				local var_292_7 = utf8.len(var_292_5)
				local var_292_8 = var_292_6 <= 0 and var_292_2 or var_292_2 * (var_292_7 / var_292_6)

				if var_292_8 > 0 and var_292_2 < var_292_8 then
					arg_289_1.talkMaxDuration = var_292_8

					if var_292_8 + var_292_1 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_1
					end
				end

				arg_289_1.text_.text = var_292_5
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701072", "story_v_side_old_103701.awb") ~= 0 then
					local var_292_9 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701072", "story_v_side_old_103701.awb") / 1000

					if var_292_9 + var_292_1 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_9 + var_292_1
					end

					if var_292_4.prefab_name ~= "" and arg_289_1.actors_[var_292_4.prefab_name] ~= nil then
						local var_292_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_4.prefab_name].transform, "story_v_side_old_103701", "103701072", "story_v_side_old_103701.awb")

						arg_289_1:RecordAudio("103701072", var_292_10)
						arg_289_1:RecordAudio("103701072", var_292_10)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701072", "story_v_side_old_103701.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701072", "story_v_side_old_103701.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_11 = math.max(var_292_2, arg_289_1.talkMaxDuration)

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_11 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_1) / var_292_11

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_1 + var_292_11 and arg_289_1.time_ < var_292_1 + var_292_11 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play103701073 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 103701073
		arg_293_1.duration_ = 4.833

		local var_293_0 = {
			ja = 4.1,
			ko = 4.833,
			en = 4.733
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play103701074(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = arg_293_1.actors_["1037ui_story"]
			local var_296_1 = 0

			if var_296_1 < arg_293_1.time_ and arg_293_1.time_ <= var_296_1 + arg_296_0 and arg_293_1.var_.characterEffect1037ui_story == nil then
				arg_293_1.var_.characterEffect1037ui_story = var_296_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_2 = 0.2

			if var_296_1 <= arg_293_1.time_ and arg_293_1.time_ < var_296_1 + var_296_2 then
				local var_296_3 = (arg_293_1.time_ - var_296_1) / var_296_2

				if arg_293_1.var_.characterEffect1037ui_story then
					local var_296_4 = Mathf.Lerp(0, 0.5, var_296_3)

					arg_293_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_293_1.var_.characterEffect1037ui_story.fillRatio = var_296_4
				end
			end

			if arg_293_1.time_ >= var_296_1 + var_296_2 and arg_293_1.time_ < var_296_1 + var_296_2 + arg_296_0 and arg_293_1.var_.characterEffect1037ui_story then
				local var_296_5 = 0.5

				arg_293_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_293_1.var_.characterEffect1037ui_story.fillRatio = var_296_5
			end

			local var_296_6 = arg_293_1.actors_["1019ui_story"]
			local var_296_7 = 0

			if var_296_7 < arg_293_1.time_ and arg_293_1.time_ <= var_296_7 + arg_296_0 and arg_293_1.var_.characterEffect1019ui_story == nil then
				arg_293_1.var_.characterEffect1019ui_story = var_296_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_296_8 = 0.2

			if var_296_7 <= arg_293_1.time_ and arg_293_1.time_ < var_296_7 + var_296_8 then
				local var_296_9 = (arg_293_1.time_ - var_296_7) / var_296_8

				if arg_293_1.var_.characterEffect1019ui_story then
					arg_293_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_293_1.time_ >= var_296_7 + var_296_8 and arg_293_1.time_ < var_296_7 + var_296_8 + arg_296_0 and arg_293_1.var_.characterEffect1019ui_story then
				arg_293_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_296_10 = 0

			if var_296_10 < arg_293_1.time_ and arg_293_1.time_ <= var_296_10 + arg_296_0 then
				arg_293_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_296_11 = 0

			if var_296_11 < arg_293_1.time_ and arg_293_1.time_ <= var_296_11 + arg_296_0 then
				arg_293_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action456")
			end

			local var_296_12 = 0
			local var_296_13 = 0.6

			if var_296_12 < arg_293_1.time_ and arg_293_1.time_ <= var_296_12 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_14 = arg_293_1:FormatText(StoryNameCfg[13].name)

				arg_293_1.leftNameTxt_.text = var_296_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_15 = arg_293_1:GetWordFromCfg(103701073)
				local var_296_16 = arg_293_1:FormatText(var_296_15.content)

				arg_293_1.text_.text = var_296_16

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_17 = 24
				local var_296_18 = utf8.len(var_296_16)
				local var_296_19 = var_296_17 <= 0 and var_296_13 or var_296_13 * (var_296_18 / var_296_17)

				if var_296_19 > 0 and var_296_13 < var_296_19 then
					arg_293_1.talkMaxDuration = var_296_19

					if var_296_19 + var_296_12 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_19 + var_296_12
					end
				end

				arg_293_1.text_.text = var_296_16
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701073", "story_v_side_old_103701.awb") ~= 0 then
					local var_296_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701073", "story_v_side_old_103701.awb") / 1000

					if var_296_20 + var_296_12 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_20 + var_296_12
					end

					if var_296_15.prefab_name ~= "" and arg_293_1.actors_[var_296_15.prefab_name] ~= nil then
						local var_296_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_15.prefab_name].transform, "story_v_side_old_103701", "103701073", "story_v_side_old_103701.awb")

						arg_293_1:RecordAudio("103701073", var_296_21)
						arg_293_1:RecordAudio("103701073", var_296_21)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701073", "story_v_side_old_103701.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701073", "story_v_side_old_103701.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_22 = math.max(var_296_13, arg_293_1.talkMaxDuration)

			if var_296_12 <= arg_293_1.time_ and arg_293_1.time_ < var_296_12 + var_296_22 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_12) / var_296_22

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_12 + var_296_22 and arg_293_1.time_ < var_296_12 + var_296_22 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play103701074 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 103701074
		arg_297_1.duration_ = 7.8

		local var_297_0 = {
			ja = 6.366,
			ko = 7.8,
			en = 6.066
		}
		local var_297_1 = manager.audio:GetLocalizationFlag()

		if var_297_0[var_297_1] ~= nil then
			arg_297_1.duration_ = var_297_0[var_297_1]
		end

		SetActive(arg_297_1.tipsGo_, false)

		function arg_297_1.onSingleLineFinish_()
			arg_297_1.onSingleLineUpdate_ = nil
			arg_297_1.onSingleLineFinish_ = nil
			arg_297_1.state_ = "waiting"
		end

		function arg_297_1.playNext_(arg_299_0)
			if arg_299_0 == 1 then
				arg_297_0:Play103701075(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1019ui_story"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.characterEffect1019ui_story == nil then
				arg_297_1.var_.characterEffect1019ui_story = var_300_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_2 = 0.2

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.characterEffect1019ui_story then
					local var_300_4 = Mathf.Lerp(0, 0.5, var_300_3)

					arg_297_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_297_1.var_.characterEffect1019ui_story.fillRatio = var_300_4
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.characterEffect1019ui_story then
				local var_300_5 = 0.5

				arg_297_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_297_1.var_.characterEffect1019ui_story.fillRatio = var_300_5
			end

			local var_300_6 = arg_297_1.actors_["1037ui_story"]
			local var_300_7 = 0

			if var_300_7 < arg_297_1.time_ and arg_297_1.time_ <= var_300_7 + arg_300_0 and arg_297_1.var_.characterEffect1037ui_story == nil then
				arg_297_1.var_.characterEffect1037ui_story = var_300_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_300_8 = 0.2

			if var_300_7 <= arg_297_1.time_ and arg_297_1.time_ < var_300_7 + var_300_8 then
				local var_300_9 = (arg_297_1.time_ - var_300_7) / var_300_8

				if arg_297_1.var_.characterEffect1037ui_story then
					arg_297_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_297_1.time_ >= var_300_7 + var_300_8 and arg_297_1.time_ < var_300_7 + var_300_8 + arg_300_0 and arg_297_1.var_.characterEffect1037ui_story then
				arg_297_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_300_10 = 0

			if var_300_10 < arg_297_1.time_ and arg_297_1.time_ <= var_300_10 + arg_300_0 then
				arg_297_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_300_11 = 0

			if var_300_11 < arg_297_1.time_ and arg_297_1.time_ <= var_300_11 + arg_300_0 then
				arg_297_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action423")
			end

			local var_300_12 = 0
			local var_300_13 = 0.925

			if var_300_12 < arg_297_1.time_ and arg_297_1.time_ <= var_300_12 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_14 = arg_297_1:FormatText(StoryNameCfg[15].name)

				arg_297_1.leftNameTxt_.text = var_300_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_15 = arg_297_1:GetWordFromCfg(103701074)
				local var_300_16 = arg_297_1:FormatText(var_300_15.content)

				arg_297_1.text_.text = var_300_16

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_17 = 37
				local var_300_18 = utf8.len(var_300_16)
				local var_300_19 = var_300_17 <= 0 and var_300_13 or var_300_13 * (var_300_18 / var_300_17)

				if var_300_19 > 0 and var_300_13 < var_300_19 then
					arg_297_1.talkMaxDuration = var_300_19

					if var_300_19 + var_300_12 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_19 + var_300_12
					end
				end

				arg_297_1.text_.text = var_300_16
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701074", "story_v_side_old_103701.awb") ~= 0 then
					local var_300_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701074", "story_v_side_old_103701.awb") / 1000

					if var_300_20 + var_300_12 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_20 + var_300_12
					end

					if var_300_15.prefab_name ~= "" and arg_297_1.actors_[var_300_15.prefab_name] ~= nil then
						local var_300_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_15.prefab_name].transform, "story_v_side_old_103701", "103701074", "story_v_side_old_103701.awb")

						arg_297_1:RecordAudio("103701074", var_300_21)
						arg_297_1:RecordAudio("103701074", var_300_21)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701074", "story_v_side_old_103701.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701074", "story_v_side_old_103701.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_22 = math.max(var_300_13, arg_297_1.talkMaxDuration)

			if var_300_12 <= arg_297_1.time_ and arg_297_1.time_ < var_300_12 + var_300_22 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_12) / var_300_22

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_12 + var_300_22 and arg_297_1.time_ < var_300_12 + var_300_22 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play103701075 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 103701075
		arg_301_1.duration_ = 8.6

		local var_301_0 = {
			ja = 8.6,
			ko = 5.8,
			en = 5.866
		}
		local var_301_1 = manager.audio:GetLocalizationFlag()

		if var_301_0[var_301_1] ~= nil then
			arg_301_1.duration_ = var_301_0[var_301_1]
		end

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play103701076(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 then
				arg_301_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action436")
			end

			local var_304_2 = 0
			local var_304_3 = 0.85

			if var_304_2 < arg_301_1.time_ and arg_301_1.time_ <= var_304_2 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_4 = arg_301_1:FormatText(StoryNameCfg[15].name)

				arg_301_1.leftNameTxt_.text = var_304_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_5 = arg_301_1:GetWordFromCfg(103701075)
				local var_304_6 = arg_301_1:FormatText(var_304_5.content)

				arg_301_1.text_.text = var_304_6

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_7 = 34
				local var_304_8 = utf8.len(var_304_6)
				local var_304_9 = var_304_7 <= 0 and var_304_3 or var_304_3 * (var_304_8 / var_304_7)

				if var_304_9 > 0 and var_304_3 < var_304_9 then
					arg_301_1.talkMaxDuration = var_304_9

					if var_304_9 + var_304_2 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_9 + var_304_2
					end
				end

				arg_301_1.text_.text = var_304_6
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701075", "story_v_side_old_103701.awb") ~= 0 then
					local var_304_10 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701075", "story_v_side_old_103701.awb") / 1000

					if var_304_10 + var_304_2 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_10 + var_304_2
					end

					if var_304_5.prefab_name ~= "" and arg_301_1.actors_[var_304_5.prefab_name] ~= nil then
						local var_304_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_5.prefab_name].transform, "story_v_side_old_103701", "103701075", "story_v_side_old_103701.awb")

						arg_301_1:RecordAudio("103701075", var_304_11)
						arg_301_1:RecordAudio("103701075", var_304_11)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701075", "story_v_side_old_103701.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701075", "story_v_side_old_103701.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_12 = math.max(var_304_3, arg_301_1.talkMaxDuration)

			if var_304_2 <= arg_301_1.time_ and arg_301_1.time_ < var_304_2 + var_304_12 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_2) / var_304_12

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_2 + var_304_12 and arg_301_1.time_ < var_304_2 + var_304_12 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play103701076 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 103701076
		arg_305_1.duration_ = 6.266

		local var_305_0 = {
			ja = 6.266,
			ko = 3.7,
			en = 3.933
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
				arg_305_0:Play103701077(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1037ui_story"]
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 and arg_305_1.var_.characterEffect1037ui_story == nil then
				arg_305_1.var_.characterEffect1037ui_story = var_308_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_2 = 0.2

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2

				if arg_305_1.var_.characterEffect1037ui_story then
					local var_308_4 = Mathf.Lerp(0, 0.5, var_308_3)

					arg_305_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_305_1.var_.characterEffect1037ui_story.fillRatio = var_308_4
				end
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 and arg_305_1.var_.characterEffect1037ui_story then
				local var_308_5 = 0.5

				arg_305_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_305_1.var_.characterEffect1037ui_story.fillRatio = var_308_5
			end

			local var_308_6 = arg_305_1.actors_["1019ui_story"]
			local var_308_7 = 0

			if var_308_7 < arg_305_1.time_ and arg_305_1.time_ <= var_308_7 + arg_308_0 and arg_305_1.var_.characterEffect1019ui_story == nil then
				arg_305_1.var_.characterEffect1019ui_story = var_308_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_308_8 = 0.2

			if var_308_7 <= arg_305_1.time_ and arg_305_1.time_ < var_308_7 + var_308_8 then
				local var_308_9 = (arg_305_1.time_ - var_308_7) / var_308_8

				if arg_305_1.var_.characterEffect1019ui_story then
					arg_305_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_305_1.time_ >= var_308_7 + var_308_8 and arg_305_1.time_ < var_308_7 + var_308_8 + arg_308_0 and arg_305_1.var_.characterEffect1019ui_story then
				arg_305_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_308_10 = 0

			if var_308_10 < arg_305_1.time_ and arg_305_1.time_ <= var_308_10 + arg_308_0 then
				arg_305_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_308_11 = 0

			if var_308_11 < arg_305_1.time_ and arg_305_1.time_ <= var_308_11 + arg_308_0 then
				arg_305_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action465")
			end

			local var_308_12 = 0
			local var_308_13 = 0.35

			if var_308_12 < arg_305_1.time_ and arg_305_1.time_ <= var_308_12 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_14 = arg_305_1:FormatText(StoryNameCfg[13].name)

				arg_305_1.leftNameTxt_.text = var_308_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_15 = arg_305_1:GetWordFromCfg(103701076)
				local var_308_16 = arg_305_1:FormatText(var_308_15.content)

				arg_305_1.text_.text = var_308_16

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_17 = 14
				local var_308_18 = utf8.len(var_308_16)
				local var_308_19 = var_308_17 <= 0 and var_308_13 or var_308_13 * (var_308_18 / var_308_17)

				if var_308_19 > 0 and var_308_13 < var_308_19 then
					arg_305_1.talkMaxDuration = var_308_19

					if var_308_19 + var_308_12 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_19 + var_308_12
					end
				end

				arg_305_1.text_.text = var_308_16
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701076", "story_v_side_old_103701.awb") ~= 0 then
					local var_308_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701076", "story_v_side_old_103701.awb") / 1000

					if var_308_20 + var_308_12 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_20 + var_308_12
					end

					if var_308_15.prefab_name ~= "" and arg_305_1.actors_[var_308_15.prefab_name] ~= nil then
						local var_308_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_15.prefab_name].transform, "story_v_side_old_103701", "103701076", "story_v_side_old_103701.awb")

						arg_305_1:RecordAudio("103701076", var_308_21)
						arg_305_1:RecordAudio("103701076", var_308_21)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701076", "story_v_side_old_103701.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701076", "story_v_side_old_103701.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_22 = math.max(var_308_13, arg_305_1.talkMaxDuration)

			if var_308_12 <= arg_305_1.time_ and arg_305_1.time_ < var_308_12 + var_308_22 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_12) / var_308_22

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_12 + var_308_22 and arg_305_1.time_ < var_308_12 + var_308_22 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play103701077 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 103701077
		arg_309_1.duration_ = 13.133

		local var_309_0 = {
			ja = 11.566,
			ko = 11.8,
			en = 13.133
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
				arg_309_0:Play103701078(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action452")
			end

			local var_312_2 = 0
			local var_312_3 = 1.175

			if var_312_2 < arg_309_1.time_ and arg_309_1.time_ <= var_312_2 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_4 = arg_309_1:FormatText(StoryNameCfg[13].name)

				arg_309_1.leftNameTxt_.text = var_312_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_5 = arg_309_1:GetWordFromCfg(103701077)
				local var_312_6 = arg_309_1:FormatText(var_312_5.content)

				arg_309_1.text_.text = var_312_6

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_7 = 47
				local var_312_8 = utf8.len(var_312_6)
				local var_312_9 = var_312_7 <= 0 and var_312_3 or var_312_3 * (var_312_8 / var_312_7)

				if var_312_9 > 0 and var_312_3 < var_312_9 then
					arg_309_1.talkMaxDuration = var_312_9

					if var_312_9 + var_312_2 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_9 + var_312_2
					end
				end

				arg_309_1.text_.text = var_312_6
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701077", "story_v_side_old_103701.awb") ~= 0 then
					local var_312_10 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701077", "story_v_side_old_103701.awb") / 1000

					if var_312_10 + var_312_2 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_10 + var_312_2
					end

					if var_312_5.prefab_name ~= "" and arg_309_1.actors_[var_312_5.prefab_name] ~= nil then
						local var_312_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_5.prefab_name].transform, "story_v_side_old_103701", "103701077", "story_v_side_old_103701.awb")

						arg_309_1:RecordAudio("103701077", var_312_11)
						arg_309_1:RecordAudio("103701077", var_312_11)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701077", "story_v_side_old_103701.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701077", "story_v_side_old_103701.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_12 = math.max(var_312_3, arg_309_1.talkMaxDuration)

			if var_312_2 <= arg_309_1.time_ and arg_309_1.time_ < var_312_2 + var_312_12 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_2) / var_312_12

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_2 + var_312_12 and arg_309_1.time_ < var_312_2 + var_312_12 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play103701078 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 103701078
		arg_313_1.duration_ = 1.999999999999

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play103701079(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1019ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect1019ui_story == nil then
				arg_313_1.var_.characterEffect1019ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.2

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect1019ui_story then
					local var_316_4 = Mathf.Lerp(0, 0.5, var_316_3)

					arg_313_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1019ui_story.fillRatio = var_316_4
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect1019ui_story then
				local var_316_5 = 0.5

				arg_313_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1019ui_story.fillRatio = var_316_5
			end

			local var_316_6 = arg_313_1.actors_["1037ui_story"]
			local var_316_7 = 0

			if var_316_7 < arg_313_1.time_ and arg_313_1.time_ <= var_316_7 + arg_316_0 and arg_313_1.var_.characterEffect1037ui_story == nil then
				arg_313_1.var_.characterEffect1037ui_story = var_316_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_8 = 0.2

			if var_316_7 <= arg_313_1.time_ and arg_313_1.time_ < var_316_7 + var_316_8 then
				local var_316_9 = (arg_313_1.time_ - var_316_7) / var_316_8

				if arg_313_1.var_.characterEffect1037ui_story then
					arg_313_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_313_1.time_ >= var_316_7 + var_316_8 and arg_313_1.time_ < var_316_7 + var_316_8 + arg_316_0 and arg_313_1.var_.characterEffect1037ui_story then
				arg_313_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_316_10 = 0

			if var_316_10 < arg_313_1.time_ and arg_313_1.time_ <= var_316_10 + arg_316_0 then
				arg_313_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_316_11 = 0

			if var_316_11 < arg_313_1.time_ and arg_313_1.time_ <= var_316_11 + arg_316_0 then
				arg_313_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action452")
			end

			local var_316_12 = 0
			local var_316_13 = 0.1

			if var_316_12 < arg_313_1.time_ and arg_313_1.time_ <= var_316_12 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_14 = arg_313_1:FormatText(StoryNameCfg[15].name)

				arg_313_1.leftNameTxt_.text = var_316_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_15 = arg_313_1:GetWordFromCfg(103701078)
				local var_316_16 = arg_313_1:FormatText(var_316_15.content)

				arg_313_1.text_.text = var_316_16

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_17 = 4
				local var_316_18 = utf8.len(var_316_16)
				local var_316_19 = var_316_17 <= 0 and var_316_13 or var_316_13 * (var_316_18 / var_316_17)

				if var_316_19 > 0 and var_316_13 < var_316_19 then
					arg_313_1.talkMaxDuration = var_316_19

					if var_316_19 + var_316_12 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_19 + var_316_12
					end
				end

				arg_313_1.text_.text = var_316_16
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701078", "story_v_side_old_103701.awb") ~= 0 then
					local var_316_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701078", "story_v_side_old_103701.awb") / 1000

					if var_316_20 + var_316_12 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_20 + var_316_12
					end

					if var_316_15.prefab_name ~= "" and arg_313_1.actors_[var_316_15.prefab_name] ~= nil then
						local var_316_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_15.prefab_name].transform, "story_v_side_old_103701", "103701078", "story_v_side_old_103701.awb")

						arg_313_1:RecordAudio("103701078", var_316_21)
						arg_313_1:RecordAudio("103701078", var_316_21)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701078", "story_v_side_old_103701.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701078", "story_v_side_old_103701.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_22 = math.max(var_316_13, arg_313_1.talkMaxDuration)

			if var_316_12 <= arg_313_1.time_ and arg_313_1.time_ < var_316_12 + var_316_22 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_12) / var_316_22

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_12 + var_316_22 and arg_313_1.time_ < var_316_12 + var_316_22 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play103701079 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 103701079
		arg_317_1.duration_ = 4.433

		local var_317_0 = {
			ja = 4.433,
			ko = 4.2,
			en = 3.6
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
				arg_317_0:Play103701080(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1037ui_story"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.characterEffect1037ui_story == nil then
				arg_317_1.var_.characterEffect1037ui_story = var_320_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_2 = 0.2

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.characterEffect1037ui_story then
					local var_320_4 = Mathf.Lerp(0, 0.5, var_320_3)

					arg_317_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_317_1.var_.characterEffect1037ui_story.fillRatio = var_320_4
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.characterEffect1037ui_story then
				local var_320_5 = 0.5

				arg_317_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_317_1.var_.characterEffect1037ui_story.fillRatio = var_320_5
			end

			local var_320_6 = arg_317_1.actors_["1019ui_story"]
			local var_320_7 = 0

			if var_320_7 < arg_317_1.time_ and arg_317_1.time_ <= var_320_7 + arg_320_0 and arg_317_1.var_.characterEffect1019ui_story == nil then
				arg_317_1.var_.characterEffect1019ui_story = var_320_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_8 = 0.2

			if var_320_7 <= arg_317_1.time_ and arg_317_1.time_ < var_320_7 + var_320_8 then
				local var_320_9 = (arg_317_1.time_ - var_320_7) / var_320_8

				if arg_317_1.var_.characterEffect1019ui_story then
					arg_317_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_7 + var_320_8 and arg_317_1.time_ < var_320_7 + var_320_8 + arg_320_0 and arg_317_1.var_.characterEffect1019ui_story then
				arg_317_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_320_10 = 0

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 then
				arg_317_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_320_11 = 0

			if var_320_11 < arg_317_1.time_ and arg_317_1.time_ <= var_320_11 + arg_320_0 then
				arg_317_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action452")
			end

			local var_320_12 = 0
			local var_320_13 = 0.575

			if var_320_12 < arg_317_1.time_ and arg_317_1.time_ <= var_320_12 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_14 = arg_317_1:FormatText(StoryNameCfg[13].name)

				arg_317_1.leftNameTxt_.text = var_320_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_15 = arg_317_1:GetWordFromCfg(103701079)
				local var_320_16 = arg_317_1:FormatText(var_320_15.content)

				arg_317_1.text_.text = var_320_16

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_17 = 23
				local var_320_18 = utf8.len(var_320_16)
				local var_320_19 = var_320_17 <= 0 and var_320_13 or var_320_13 * (var_320_18 / var_320_17)

				if var_320_19 > 0 and var_320_13 < var_320_19 then
					arg_317_1.talkMaxDuration = var_320_19

					if var_320_19 + var_320_12 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_19 + var_320_12
					end
				end

				arg_317_1.text_.text = var_320_16
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701079", "story_v_side_old_103701.awb") ~= 0 then
					local var_320_20 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701079", "story_v_side_old_103701.awb") / 1000

					if var_320_20 + var_320_12 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_20 + var_320_12
					end

					if var_320_15.prefab_name ~= "" and arg_317_1.actors_[var_320_15.prefab_name] ~= nil then
						local var_320_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_15.prefab_name].transform, "story_v_side_old_103701", "103701079", "story_v_side_old_103701.awb")

						arg_317_1:RecordAudio("103701079", var_320_21)
						arg_317_1:RecordAudio("103701079", var_320_21)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701079", "story_v_side_old_103701.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701079", "story_v_side_old_103701.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_22 = math.max(var_320_13, arg_317_1.talkMaxDuration)

			if var_320_12 <= arg_317_1.time_ and arg_317_1.time_ < var_320_12 + var_320_22 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_12) / var_320_22

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_12 + var_320_22 and arg_317_1.time_ < var_320_12 + var_320_22 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play103701080 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 103701080
		arg_321_1.duration_ = 8.2

		local var_321_0 = {
			ja = 7.733,
			ko = 6.733,
			en = 8.2
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
				arg_321_0:Play103701081(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_324_1 = 0
			local var_324_2 = 0.725

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_3 = arg_321_1:FormatText(StoryNameCfg[13].name)

				arg_321_1.leftNameTxt_.text = var_324_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_4 = arg_321_1:GetWordFromCfg(103701080)
				local var_324_5 = arg_321_1:FormatText(var_324_4.content)

				arg_321_1.text_.text = var_324_5

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_6 = 29
				local var_324_7 = utf8.len(var_324_5)
				local var_324_8 = var_324_6 <= 0 and var_324_2 or var_324_2 * (var_324_7 / var_324_6)

				if var_324_8 > 0 and var_324_2 < var_324_8 then
					arg_321_1.talkMaxDuration = var_324_8

					if var_324_8 + var_324_1 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_8 + var_324_1
					end
				end

				arg_321_1.text_.text = var_324_5
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701080", "story_v_side_old_103701.awb") ~= 0 then
					local var_324_9 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701080", "story_v_side_old_103701.awb") / 1000

					if var_324_9 + var_324_1 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_9 + var_324_1
					end

					if var_324_4.prefab_name ~= "" and arg_321_1.actors_[var_324_4.prefab_name] ~= nil then
						local var_324_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_4.prefab_name].transform, "story_v_side_old_103701", "103701080", "story_v_side_old_103701.awb")

						arg_321_1:RecordAudio("103701080", var_324_10)
						arg_321_1:RecordAudio("103701080", var_324_10)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701080", "story_v_side_old_103701.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701080", "story_v_side_old_103701.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_11 = math.max(var_324_2, arg_321_1.talkMaxDuration)

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_11 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_1) / var_324_11

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_1 + var_324_11 and arg_321_1.time_ < var_324_1 + var_324_11 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play103701081 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 103701081
		arg_325_1.duration_ = 4.033

		local var_325_0 = {
			ja = 4.033,
			ko = 3.5,
			en = 2.733
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
				arg_325_0:Play103701082(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["1019ui_story"]
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 and arg_325_1.var_.characterEffect1019ui_story == nil then
				arg_325_1.var_.characterEffect1019ui_story = var_328_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_2 = 0.2

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_2 then
				local var_328_3 = (arg_325_1.time_ - var_328_1) / var_328_2

				if arg_325_1.var_.characterEffect1019ui_story then
					local var_328_4 = Mathf.Lerp(0, 0.5, var_328_3)

					arg_325_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_325_1.var_.characterEffect1019ui_story.fillRatio = var_328_4
				end
			end

			if arg_325_1.time_ >= var_328_1 + var_328_2 and arg_325_1.time_ < var_328_1 + var_328_2 + arg_328_0 and arg_325_1.var_.characterEffect1019ui_story then
				local var_328_5 = 0.5

				arg_325_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_325_1.var_.characterEffect1019ui_story.fillRatio = var_328_5
			end

			local var_328_6 = arg_325_1.actors_["1037ui_story"]
			local var_328_7 = 0

			if var_328_7 < arg_325_1.time_ and arg_325_1.time_ <= var_328_7 + arg_328_0 and arg_325_1.var_.characterEffect1037ui_story == nil then
				arg_325_1.var_.characterEffect1037ui_story = var_328_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_328_8 = 0.2

			if var_328_7 <= arg_325_1.time_ and arg_325_1.time_ < var_328_7 + var_328_8 then
				local var_328_9 = (arg_325_1.time_ - var_328_7) / var_328_8

				if arg_325_1.var_.characterEffect1037ui_story then
					arg_325_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_325_1.time_ >= var_328_7 + var_328_8 and arg_325_1.time_ < var_328_7 + var_328_8 + arg_328_0 and arg_325_1.var_.characterEffect1037ui_story then
				arg_325_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_328_10 = 0

			if var_328_10 < arg_325_1.time_ and arg_325_1.time_ <= var_328_10 + arg_328_0 then
				arg_325_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_328_11 = 0
			local var_328_12 = 0.2

			if var_328_11 < arg_325_1.time_ and arg_325_1.time_ <= var_328_11 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_13 = arg_325_1:FormatText(StoryNameCfg[15].name)

				arg_325_1.leftNameTxt_.text = var_328_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_14 = arg_325_1:GetWordFromCfg(103701081)
				local var_328_15 = arg_325_1:FormatText(var_328_14.content)

				arg_325_1.text_.text = var_328_15

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_16 = 8
				local var_328_17 = utf8.len(var_328_15)
				local var_328_18 = var_328_16 <= 0 and var_328_12 or var_328_12 * (var_328_17 / var_328_16)

				if var_328_18 > 0 and var_328_12 < var_328_18 then
					arg_325_1.talkMaxDuration = var_328_18

					if var_328_18 + var_328_11 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_18 + var_328_11
					end
				end

				arg_325_1.text_.text = var_328_15
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701081", "story_v_side_old_103701.awb") ~= 0 then
					local var_328_19 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701081", "story_v_side_old_103701.awb") / 1000

					if var_328_19 + var_328_11 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_19 + var_328_11
					end

					if var_328_14.prefab_name ~= "" and arg_325_1.actors_[var_328_14.prefab_name] ~= nil then
						local var_328_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_14.prefab_name].transform, "story_v_side_old_103701", "103701081", "story_v_side_old_103701.awb")

						arg_325_1:RecordAudio("103701081", var_328_20)
						arg_325_1:RecordAudio("103701081", var_328_20)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701081", "story_v_side_old_103701.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701081", "story_v_side_old_103701.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_21 = math.max(var_328_12, arg_325_1.talkMaxDuration)

			if var_328_11 <= arg_325_1.time_ and arg_325_1.time_ < var_328_11 + var_328_21 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_11) / var_328_21

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_11 + var_328_21 and arg_325_1.time_ < var_328_11 + var_328_21 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play103701082 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 103701082
		arg_329_1.duration_ = 5

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play103701083(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1037ui_story"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1037ui_story = var_332_0.localPosition
			end

			local var_332_2 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_2 then
				local var_332_3 = (arg_329_1.time_ - var_332_1) / var_332_2
				local var_332_4 = Vector3.New(0, 100, 0)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1037ui_story, var_332_4, var_332_3)

				local var_332_5 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_5.x, var_332_5.y, var_332_5.z)

				local var_332_6 = var_332_0.localEulerAngles

				var_332_6.z = 0
				var_332_6.x = 0
				var_332_0.localEulerAngles = var_332_6
			end

			if arg_329_1.time_ >= var_332_1 + var_332_2 and arg_329_1.time_ < var_332_1 + var_332_2 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(0, 100, 0)

				local var_332_7 = manager.ui.mainCamera.transform.position - var_332_0.position

				var_332_0.forward = Vector3.New(var_332_7.x, var_332_7.y, var_332_7.z)

				local var_332_8 = var_332_0.localEulerAngles

				var_332_8.z = 0
				var_332_8.x = 0
				var_332_0.localEulerAngles = var_332_8
			end

			local var_332_9 = arg_329_1.actors_["1019ui_story"].transform
			local var_332_10 = 0

			if var_332_10 < arg_329_1.time_ and arg_329_1.time_ <= var_332_10 + arg_332_0 then
				arg_329_1.var_.moveOldPos1019ui_story = var_332_9.localPosition
			end

			local var_332_11 = 0.001

			if var_332_10 <= arg_329_1.time_ and arg_329_1.time_ < var_332_10 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_10) / var_332_11
				local var_332_13 = Vector3.New(0, 100, 0)

				var_332_9.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1019ui_story, var_332_13, var_332_12)

				local var_332_14 = manager.ui.mainCamera.transform.position - var_332_9.position

				var_332_9.forward = Vector3.New(var_332_14.x, var_332_14.y, var_332_14.z)

				local var_332_15 = var_332_9.localEulerAngles

				var_332_15.z = 0
				var_332_15.x = 0
				var_332_9.localEulerAngles = var_332_15
			end

			if arg_329_1.time_ >= var_332_10 + var_332_11 and arg_329_1.time_ < var_332_10 + var_332_11 + arg_332_0 then
				var_332_9.localPosition = Vector3.New(0, 100, 0)

				local var_332_16 = manager.ui.mainCamera.transform.position - var_332_9.position

				var_332_9.forward = Vector3.New(var_332_16.x, var_332_16.y, var_332_16.z)

				local var_332_17 = var_332_9.localEulerAngles

				var_332_17.z = 0
				var_332_17.x = 0
				var_332_9.localEulerAngles = var_332_17
			end

			local var_332_18 = 0
			local var_332_19 = 0.325

			if var_332_18 < arg_329_1.time_ and arg_329_1.time_ <= var_332_18 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, false)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_20 = arg_329_1:GetWordFromCfg(103701082)
				local var_332_21 = arg_329_1:FormatText(var_332_20.content)

				arg_329_1.text_.text = var_332_21

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_22 = 13
				local var_332_23 = utf8.len(var_332_21)
				local var_332_24 = var_332_22 <= 0 and var_332_19 or var_332_19 * (var_332_23 / var_332_22)

				if var_332_24 > 0 and var_332_19 < var_332_24 then
					arg_329_1.talkMaxDuration = var_332_24

					if var_332_24 + var_332_18 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_24 + var_332_18
					end
				end

				arg_329_1.text_.text = var_332_21
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)
				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_25 = math.max(var_332_19, arg_329_1.talkMaxDuration)

			if var_332_18 <= arg_329_1.time_ and arg_329_1.time_ < var_332_18 + var_332_25 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_18) / var_332_25

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_18 + var_332_25 and arg_329_1.time_ < var_332_18 + var_332_25 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play103701083 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 103701083
		arg_333_1.duration_ = 5

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play103701084(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.45

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, false)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_2 = arg_333_1:GetWordFromCfg(103701083)
				local var_336_3 = arg_333_1:FormatText(var_336_2.content)

				arg_333_1.text_.text = var_336_3

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_4 = 18
				local var_336_5 = utf8.len(var_336_3)
				local var_336_6 = var_336_4 <= 0 and var_336_1 or var_336_1 * (var_336_5 / var_336_4)

				if var_336_6 > 0 and var_336_1 < var_336_6 then
					arg_333_1.talkMaxDuration = var_336_6

					if var_336_6 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_6 + var_336_0
					end
				end

				arg_333_1.text_.text = var_336_3
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)
				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_7 = math.max(var_336_1, arg_333_1.talkMaxDuration)

			if var_336_0 <= arg_333_1.time_ and arg_333_1.time_ < var_336_0 + var_336_7 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_0) / var_336_7

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_0 + var_336_7 and arg_333_1.time_ < var_336_0 + var_336_7 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play103701084 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 103701084
		arg_337_1.duration_ = 5

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play103701085(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 0.2

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_2 = arg_337_1:FormatText(StoryNameCfg[7].name)

				arg_337_1.leftNameTxt_.text = var_340_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_3 = arg_337_1:GetWordFromCfg(103701084)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 8
				local var_340_6 = utf8.len(var_340_4)
				local var_340_7 = var_340_5 <= 0 and var_340_1 or var_340_1 * (var_340_6 / var_340_5)

				if var_340_7 > 0 and var_340_1 < var_340_7 then
					arg_337_1.talkMaxDuration = var_340_7

					if var_340_7 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_7 + var_340_0
					end
				end

				arg_337_1.text_.text = var_340_4
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)
				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_8 = math.max(var_340_1, arg_337_1.talkMaxDuration)

			if var_340_0 <= arg_337_1.time_ and arg_337_1.time_ < var_340_0 + var_340_8 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_0) / var_340_8

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_0 + var_340_8 and arg_337_1.time_ < var_340_0 + var_340_8 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play103701085 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 103701085
		arg_341_1.duration_ = 6.2

		local var_341_0 = {
			ja = 4.866,
			ko = 6.2,
			en = 4.533
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
				arg_341_0:Play103701086(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["1037ui_story"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos1037ui_story = var_344_0.localPosition
			end

			local var_344_2 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_2 then
				local var_344_3 = (arg_341_1.time_ - var_344_1) / var_344_2
				local var_344_4 = Vector3.New(0, -1.09, -5.81)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos1037ui_story, var_344_4, var_344_3)

				local var_344_5 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_5.x, var_344_5.y, var_344_5.z)

				local var_344_6 = var_344_0.localEulerAngles

				var_344_6.z = 0
				var_344_6.x = 0
				var_344_0.localEulerAngles = var_344_6
			end

			if arg_341_1.time_ >= var_344_1 + var_344_2 and arg_341_1.time_ < var_344_1 + var_344_2 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(0, -1.09, -5.81)

				local var_344_7 = manager.ui.mainCamera.transform.position - var_344_0.position

				var_344_0.forward = Vector3.New(var_344_7.x, var_344_7.y, var_344_7.z)

				local var_344_8 = var_344_0.localEulerAngles

				var_344_8.z = 0
				var_344_8.x = 0
				var_344_0.localEulerAngles = var_344_8
			end

			local var_344_9 = arg_341_1.actors_["1037ui_story"]
			local var_344_10 = 0

			if var_344_10 < arg_341_1.time_ and arg_341_1.time_ <= var_344_10 + arg_344_0 and arg_341_1.var_.characterEffect1037ui_story == nil then
				arg_341_1.var_.characterEffect1037ui_story = var_344_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_344_11 = 0.2

			if var_344_10 <= arg_341_1.time_ and arg_341_1.time_ < var_344_10 + var_344_11 then
				local var_344_12 = (arg_341_1.time_ - var_344_10) / var_344_11

				if arg_341_1.var_.characterEffect1037ui_story then
					arg_341_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_341_1.time_ >= var_344_10 + var_344_11 and arg_341_1.time_ < var_344_10 + var_344_11 + arg_344_0 and arg_341_1.var_.characterEffect1037ui_story then
				arg_341_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_344_13 = 0

			if var_344_13 < arg_341_1.time_ and arg_341_1.time_ <= var_344_13 + arg_344_0 then
				arg_341_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_344_14 = 0

			if var_344_14 < arg_341_1.time_ and arg_341_1.time_ <= var_344_14 + arg_344_0 then
				arg_341_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037action/1037action2_1")
			end

			local var_344_15 = 0
			local var_344_16 = 0.475

			if var_344_15 < arg_341_1.time_ and arg_341_1.time_ <= var_344_15 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_17 = arg_341_1:FormatText(StoryNameCfg[15].name)

				arg_341_1.leftNameTxt_.text = var_344_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_18 = arg_341_1:GetWordFromCfg(103701085)
				local var_344_19 = arg_341_1:FormatText(var_344_18.content)

				arg_341_1.text_.text = var_344_19

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_20 = 19
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

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701085", "story_v_side_old_103701.awb") ~= 0 then
					local var_344_23 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701085", "story_v_side_old_103701.awb") / 1000

					if var_344_23 + var_344_15 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_23 + var_344_15
					end

					if var_344_18.prefab_name ~= "" and arg_341_1.actors_[var_344_18.prefab_name] ~= nil then
						local var_344_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_18.prefab_name].transform, "story_v_side_old_103701", "103701085", "story_v_side_old_103701.awb")

						arg_341_1:RecordAudio("103701085", var_344_24)
						arg_341_1:RecordAudio("103701085", var_344_24)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701085", "story_v_side_old_103701.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701085", "story_v_side_old_103701.awb")
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
	Play103701086 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 103701086
		arg_345_1.duration_ = 10

		local var_345_0 = {
			ja = 7.8,
			ko = 10,
			en = 6
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
				arg_345_0:Play103701087(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_348_1 = 0
			local var_348_2 = 0.9

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_3 = arg_345_1:FormatText(StoryNameCfg[15].name)

				arg_345_1.leftNameTxt_.text = var_348_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_4 = arg_345_1:GetWordFromCfg(103701086)
				local var_348_5 = arg_345_1:FormatText(var_348_4.content)

				arg_345_1.text_.text = var_348_5

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_6 = 36
				local var_348_7 = utf8.len(var_348_5)
				local var_348_8 = var_348_6 <= 0 and var_348_2 or var_348_2 * (var_348_7 / var_348_6)

				if var_348_8 > 0 and var_348_2 < var_348_8 then
					arg_345_1.talkMaxDuration = var_348_8

					if var_348_8 + var_348_1 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_8 + var_348_1
					end
				end

				arg_345_1.text_.text = var_348_5
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701086", "story_v_side_old_103701.awb") ~= 0 then
					local var_348_9 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701086", "story_v_side_old_103701.awb") / 1000

					if var_348_9 + var_348_1 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_9 + var_348_1
					end

					if var_348_4.prefab_name ~= "" and arg_345_1.actors_[var_348_4.prefab_name] ~= nil then
						local var_348_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_4.prefab_name].transform, "story_v_side_old_103701", "103701086", "story_v_side_old_103701.awb")

						arg_345_1:RecordAudio("103701086", var_348_10)
						arg_345_1:RecordAudio("103701086", var_348_10)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701086", "story_v_side_old_103701.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701086", "story_v_side_old_103701.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_11 = math.max(var_348_2, arg_345_1.talkMaxDuration)

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_11 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_1) / var_348_11

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_1 + var_348_11 and arg_345_1.time_ < var_348_1 + var_348_11 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play103701087 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 103701087
		arg_349_1.duration_ = 5

		SetActive(arg_349_1.tipsGo_, false)

		function arg_349_1.onSingleLineFinish_()
			arg_349_1.onSingleLineUpdate_ = nil
			arg_349_1.onSingleLineFinish_ = nil
			arg_349_1.state_ = "waiting"
		end

		function arg_349_1.playNext_(arg_351_0)
			if arg_351_0 == 1 then
				arg_349_0:Play103701088(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1037ui_story"]
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 and arg_349_1.var_.characterEffect1037ui_story == nil then
				arg_349_1.var_.characterEffect1037ui_story = var_352_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_352_2 = 0.2

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_2 then
				local var_352_3 = (arg_349_1.time_ - var_352_1) / var_352_2

				if arg_349_1.var_.characterEffect1037ui_story then
					local var_352_4 = Mathf.Lerp(0, 0.5, var_352_3)

					arg_349_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_349_1.var_.characterEffect1037ui_story.fillRatio = var_352_4
				end
			end

			if arg_349_1.time_ >= var_352_1 + var_352_2 and arg_349_1.time_ < var_352_1 + var_352_2 + arg_352_0 and arg_349_1.var_.characterEffect1037ui_story then
				local var_352_5 = 0.5

				arg_349_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_349_1.var_.characterEffect1037ui_story.fillRatio = var_352_5
			end

			local var_352_6 = 0
			local var_352_7 = 0.675

			if var_352_6 < arg_349_1.time_ and arg_349_1.time_ <= var_352_6 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, false)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_8 = arg_349_1:GetWordFromCfg(103701087)
				local var_352_9 = arg_349_1:FormatText(var_352_8.content)

				arg_349_1.text_.text = var_352_9

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_10 = 27
				local var_352_11 = utf8.len(var_352_9)
				local var_352_12 = var_352_10 <= 0 and var_352_7 or var_352_7 * (var_352_11 / var_352_10)

				if var_352_12 > 0 and var_352_7 < var_352_12 then
					arg_349_1.talkMaxDuration = var_352_12

					if var_352_12 + var_352_6 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_12 + var_352_6
					end
				end

				arg_349_1.text_.text = var_352_9
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)
				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_13 = math.max(var_352_7, arg_349_1.talkMaxDuration)

			if var_352_6 <= arg_349_1.time_ and arg_349_1.time_ < var_352_6 + var_352_13 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_6) / var_352_13

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_6 + var_352_13 and arg_349_1.time_ < var_352_6 + var_352_13 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play103701088 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 103701088
		arg_353_1.duration_ = 5

		SetActive(arg_353_1.tipsGo_, false)

		function arg_353_1.onSingleLineFinish_()
			arg_353_1.onSingleLineUpdate_ = nil
			arg_353_1.onSingleLineFinish_ = nil
			arg_353_1.state_ = "waiting"
		end

		function arg_353_1.playNext_(arg_355_0)
			if arg_355_0 == 1 then
				arg_353_0:Play103701089(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 0.65

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[7].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(103701088)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 26
				local var_356_6 = utf8.len(var_356_4)
				local var_356_7 = var_356_5 <= 0 and var_356_1 or var_356_1 * (var_356_6 / var_356_5)

				if var_356_7 > 0 and var_356_1 < var_356_7 then
					arg_353_1.talkMaxDuration = var_356_7

					if var_356_7 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_7 + var_356_0
					end
				end

				arg_353_1.text_.text = var_356_4
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)
				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_8 = math.max(var_356_1, arg_353_1.talkMaxDuration)

			if var_356_0 <= arg_353_1.time_ and arg_353_1.time_ < var_356_0 + var_356_8 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_0) / var_356_8

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_0 + var_356_8 and arg_353_1.time_ < var_356_0 + var_356_8 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play103701089 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 103701089
		arg_357_1.duration_ = 7.666

		local var_357_0 = {
			ja = 6.766,
			ko = 7.633,
			en = 7.666
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
				arg_357_0:Play103701090(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["1037ui_story"]
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 and arg_357_1.var_.characterEffect1037ui_story == nil then
				arg_357_1.var_.characterEffect1037ui_story = var_360_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_360_2 = 0.2

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_2 then
				local var_360_3 = (arg_357_1.time_ - var_360_1) / var_360_2

				if arg_357_1.var_.characterEffect1037ui_story then
					arg_357_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_357_1.time_ >= var_360_1 + var_360_2 and arg_357_1.time_ < var_360_1 + var_360_2 + arg_360_0 and arg_357_1.var_.characterEffect1037ui_story then
				arg_357_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_360_4 = 0

			if var_360_4 < arg_357_1.time_ and arg_357_1.time_ <= var_360_4 + arg_360_0 then
				arg_357_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_360_5 = 0

			if var_360_5 < arg_357_1.time_ and arg_357_1.time_ <= var_360_5 + arg_360_0 then
				arg_357_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action425")
			end

			local var_360_6 = 0
			local var_360_7 = 0.825

			if var_360_6 < arg_357_1.time_ and arg_357_1.time_ <= var_360_6 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_8 = arg_357_1:FormatText(StoryNameCfg[15].name)

				arg_357_1.leftNameTxt_.text = var_360_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_9 = arg_357_1:GetWordFromCfg(103701089)
				local var_360_10 = arg_357_1:FormatText(var_360_9.content)

				arg_357_1.text_.text = var_360_10

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_11 = 33
				local var_360_12 = utf8.len(var_360_10)
				local var_360_13 = var_360_11 <= 0 and var_360_7 or var_360_7 * (var_360_12 / var_360_11)

				if var_360_13 > 0 and var_360_7 < var_360_13 then
					arg_357_1.talkMaxDuration = var_360_13

					if var_360_13 + var_360_6 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_13 + var_360_6
					end
				end

				arg_357_1.text_.text = var_360_10
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701089", "story_v_side_old_103701.awb") ~= 0 then
					local var_360_14 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701089", "story_v_side_old_103701.awb") / 1000

					if var_360_14 + var_360_6 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_14 + var_360_6
					end

					if var_360_9.prefab_name ~= "" and arg_357_1.actors_[var_360_9.prefab_name] ~= nil then
						local var_360_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_9.prefab_name].transform, "story_v_side_old_103701", "103701089", "story_v_side_old_103701.awb")

						arg_357_1:RecordAudio("103701089", var_360_15)
						arg_357_1:RecordAudio("103701089", var_360_15)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701089", "story_v_side_old_103701.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701089", "story_v_side_old_103701.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_16 = math.max(var_360_7, arg_357_1.talkMaxDuration)

			if var_360_6 <= arg_357_1.time_ and arg_357_1.time_ < var_360_6 + var_360_16 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_6) / var_360_16

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_6 + var_360_16 and arg_357_1.time_ < var_360_6 + var_360_16 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play103701090 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 103701090
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play103701091(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1037ui_story"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.characterEffect1037ui_story == nil then
				arg_361_1.var_.characterEffect1037ui_story = var_364_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_364_2 = 0.2

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.characterEffect1037ui_story then
					local var_364_4 = Mathf.Lerp(0, 0.5, var_364_3)

					arg_361_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_361_1.var_.characterEffect1037ui_story.fillRatio = var_364_4
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.characterEffect1037ui_story then
				local var_364_5 = 0.5

				arg_361_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_361_1.var_.characterEffect1037ui_story.fillRatio = var_364_5
			end

			local var_364_6 = 0
			local var_364_7 = 0.675

			if var_364_6 < arg_361_1.time_ and arg_361_1.time_ <= var_364_6 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_8 = arg_361_1:FormatText(StoryNameCfg[7].name)

				arg_361_1.leftNameTxt_.text = var_364_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_9 = arg_361_1:GetWordFromCfg(103701090)
				local var_364_10 = arg_361_1:FormatText(var_364_9.content)

				arg_361_1.text_.text = var_364_10

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_11 = 27
				local var_364_12 = utf8.len(var_364_10)
				local var_364_13 = var_364_11 <= 0 and var_364_7 or var_364_7 * (var_364_12 / var_364_11)

				if var_364_13 > 0 and var_364_7 < var_364_13 then
					arg_361_1.talkMaxDuration = var_364_13

					if var_364_13 + var_364_6 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_13 + var_364_6
					end
				end

				arg_361_1.text_.text = var_364_10
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_14 = math.max(var_364_7, arg_361_1.talkMaxDuration)

			if var_364_6 <= arg_361_1.time_ and arg_361_1.time_ < var_364_6 + var_364_14 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_6) / var_364_14

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_6 + var_364_14 and arg_361_1.time_ < var_364_6 + var_364_14 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play103701091 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 103701091
		arg_365_1.duration_ = 10.3

		local var_365_0 = {
			ja = 10.066,
			ko = 10.3,
			en = 6.833
		}
		local var_365_1 = manager.audio:GetLocalizationFlag()

		if var_365_0[var_365_1] ~= nil then
			arg_365_1.duration_ = var_365_0[var_365_1]
		end

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play103701092(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1037ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect1037ui_story == nil then
				arg_365_1.var_.characterEffect1037ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.2

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect1037ui_story then
					arg_365_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect1037ui_story then
				arg_365_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_368_4 = 0

			if var_368_4 < arg_365_1.time_ and arg_365_1.time_ <= var_368_4 + arg_368_0 then
				arg_365_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_368_5 = 0

			if var_368_5 < arg_365_1.time_ and arg_365_1.time_ <= var_368_5 + arg_368_0 then
				arg_365_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action453")
			end

			local var_368_6 = 0
			local var_368_7 = 1.025

			if var_368_6 < arg_365_1.time_ and arg_365_1.time_ <= var_368_6 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_8 = arg_365_1:FormatText(StoryNameCfg[15].name)

				arg_365_1.leftNameTxt_.text = var_368_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_9 = arg_365_1:GetWordFromCfg(103701091)
				local var_368_10 = arg_365_1:FormatText(var_368_9.content)

				arg_365_1.text_.text = var_368_10

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_11 = 41
				local var_368_12 = utf8.len(var_368_10)
				local var_368_13 = var_368_11 <= 0 and var_368_7 or var_368_7 * (var_368_12 / var_368_11)

				if var_368_13 > 0 and var_368_7 < var_368_13 then
					arg_365_1.talkMaxDuration = var_368_13

					if var_368_13 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_13 + var_368_6
					end
				end

				arg_365_1.text_.text = var_368_10
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701091", "story_v_side_old_103701.awb") ~= 0 then
					local var_368_14 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701091", "story_v_side_old_103701.awb") / 1000

					if var_368_14 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_14 + var_368_6
					end

					if var_368_9.prefab_name ~= "" and arg_365_1.actors_[var_368_9.prefab_name] ~= nil then
						local var_368_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_9.prefab_name].transform, "story_v_side_old_103701", "103701091", "story_v_side_old_103701.awb")

						arg_365_1:RecordAudio("103701091", var_368_15)
						arg_365_1:RecordAudio("103701091", var_368_15)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701091", "story_v_side_old_103701.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701091", "story_v_side_old_103701.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_16 = math.max(var_368_7, arg_365_1.talkMaxDuration)

			if var_368_6 <= arg_365_1.time_ and arg_365_1.time_ < var_368_6 + var_368_16 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_6) / var_368_16

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_6 + var_368_16 and arg_365_1.time_ < var_368_6 + var_368_16 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play103701092 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 103701092
		arg_369_1.duration_ = 6.333

		local var_369_0 = {
			ja = 5.7,
			ko = 6.333,
			en = 5.3
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
				arg_369_0:Play103701093(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_372_1 = 0
			local var_372_2 = 0.7

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_3 = arg_369_1:FormatText(StoryNameCfg[15].name)

				arg_369_1.leftNameTxt_.text = var_372_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_4 = arg_369_1:GetWordFromCfg(103701092)
				local var_372_5 = arg_369_1:FormatText(var_372_4.content)

				arg_369_1.text_.text = var_372_5

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_6 = 28
				local var_372_7 = utf8.len(var_372_5)
				local var_372_8 = var_372_6 <= 0 and var_372_2 or var_372_2 * (var_372_7 / var_372_6)

				if var_372_8 > 0 and var_372_2 < var_372_8 then
					arg_369_1.talkMaxDuration = var_372_8

					if var_372_8 + var_372_1 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_1
					end
				end

				arg_369_1.text_.text = var_372_5
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701092", "story_v_side_old_103701.awb") ~= 0 then
					local var_372_9 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701092", "story_v_side_old_103701.awb") / 1000

					if var_372_9 + var_372_1 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_9 + var_372_1
					end

					if var_372_4.prefab_name ~= "" and arg_369_1.actors_[var_372_4.prefab_name] ~= nil then
						local var_372_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_4.prefab_name].transform, "story_v_side_old_103701", "103701092", "story_v_side_old_103701.awb")

						arg_369_1:RecordAudio("103701092", var_372_10)
						arg_369_1:RecordAudio("103701092", var_372_10)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701092", "story_v_side_old_103701.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701092", "story_v_side_old_103701.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_11 = math.max(var_372_2, arg_369_1.talkMaxDuration)

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_11 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_1) / var_372_11

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_1 + var_372_11 and arg_369_1.time_ < var_372_1 + var_372_11 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play103701093 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 103701093
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play103701094(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1037ui_story"]
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 and arg_373_1.var_.characterEffect1037ui_story == nil then
				arg_373_1.var_.characterEffect1037ui_story = var_376_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_2 = 0.2

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2

				if arg_373_1.var_.characterEffect1037ui_story then
					local var_376_4 = Mathf.Lerp(0, 0.5, var_376_3)

					arg_373_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_373_1.var_.characterEffect1037ui_story.fillRatio = var_376_4
				end
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 and arg_373_1.var_.characterEffect1037ui_story then
				local var_376_5 = 0.5

				arg_373_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_373_1.var_.characterEffect1037ui_story.fillRatio = var_376_5
			end

			local var_376_6 = 0
			local var_376_7 = 0.9

			if var_376_6 < arg_373_1.time_ and arg_373_1.time_ <= var_376_6 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, false)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_8 = arg_373_1:GetWordFromCfg(103701093)
				local var_376_9 = arg_373_1:FormatText(var_376_8.content)

				arg_373_1.text_.text = var_376_9

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_10 = 36
				local var_376_11 = utf8.len(var_376_9)
				local var_376_12 = var_376_10 <= 0 and var_376_7 or var_376_7 * (var_376_11 / var_376_10)

				if var_376_12 > 0 and var_376_7 < var_376_12 then
					arg_373_1.talkMaxDuration = var_376_12

					if var_376_12 + var_376_6 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_12 + var_376_6
					end
				end

				arg_373_1.text_.text = var_376_9
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_13 = math.max(var_376_7, arg_373_1.talkMaxDuration)

			if var_376_6 <= arg_373_1.time_ and arg_373_1.time_ < var_376_6 + var_376_13 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_6) / var_376_13

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_6 + var_376_13 and arg_373_1.time_ < var_376_6 + var_376_13 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play103701094 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 103701094
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play103701095(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 0.45

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_2 = arg_377_1:GetWordFromCfg(103701094)
				local var_380_3 = arg_377_1:FormatText(var_380_2.content)

				arg_377_1.text_.text = var_380_3

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_4 = 18
				local var_380_5 = utf8.len(var_380_3)
				local var_380_6 = var_380_4 <= 0 and var_380_1 or var_380_1 * (var_380_5 / var_380_4)

				if var_380_6 > 0 and var_380_1 < var_380_6 then
					arg_377_1.talkMaxDuration = var_380_6

					if var_380_6 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_6 + var_380_0
					end
				end

				arg_377_1.text_.text = var_380_3
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_7 = math.max(var_380_1, arg_377_1.talkMaxDuration)

			if var_380_0 <= arg_377_1.time_ and arg_377_1.time_ < var_380_0 + var_380_7 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_0) / var_380_7

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_0 + var_380_7 and arg_377_1.time_ < var_380_0 + var_380_7 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play103701095 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 103701095
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play103701096(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.975

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, false)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_2 = arg_381_1:GetWordFromCfg(103701095)
				local var_384_3 = arg_381_1:FormatText(var_384_2.content)

				arg_381_1.text_.text = var_384_3

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_4 = 39
				local var_384_5 = utf8.len(var_384_3)
				local var_384_6 = var_384_4 <= 0 and var_384_1 or var_384_1 * (var_384_5 / var_384_4)

				if var_384_6 > 0 and var_384_1 < var_384_6 then
					arg_381_1.talkMaxDuration = var_384_6

					if var_384_6 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_6 + var_384_0
					end
				end

				arg_381_1.text_.text = var_384_3
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_7 = math.max(var_384_1, arg_381_1.talkMaxDuration)

			if var_384_0 <= arg_381_1.time_ and arg_381_1.time_ < var_384_0 + var_384_7 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_0) / var_384_7

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_0 + var_384_7 and arg_381_1.time_ < var_384_0 + var_384_7 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play103701096 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 103701096
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play103701097(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 0.275

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_2 = arg_385_1:FormatText(StoryNameCfg[7].name)

				arg_385_1.leftNameTxt_.text = var_388_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_3 = arg_385_1:GetWordFromCfg(103701096)
				local var_388_4 = arg_385_1:FormatText(var_388_3.content)

				arg_385_1.text_.text = var_388_4

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_5 = 11
				local var_388_6 = utf8.len(var_388_4)
				local var_388_7 = var_388_5 <= 0 and var_388_1 or var_388_1 * (var_388_6 / var_388_5)

				if var_388_7 > 0 and var_388_1 < var_388_7 then
					arg_385_1.talkMaxDuration = var_388_7

					if var_388_7 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_7 + var_388_0
					end
				end

				arg_385_1.text_.text = var_388_4
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_8 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_8 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_8

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_8 and arg_385_1.time_ < var_388_0 + var_388_8 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play103701097 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 103701097
		arg_389_1.duration_ = 6.8

		local var_389_0 = {
			ja = 6.8,
			ko = 3.566,
			en = 2.8
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
				arg_389_0:Play103701098(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1037ui_story"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.characterEffect1037ui_story == nil then
				arg_389_1.var_.characterEffect1037ui_story = var_392_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_2 = 0.2

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.characterEffect1037ui_story then
					arg_389_1.var_.characterEffect1037ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect1037ui_story then
				arg_389_1.var_.characterEffect1037ui_story.fillFlat = false
			end

			local var_392_4 = 0

			if var_392_4 < arg_389_1.time_ and arg_389_1.time_ <= var_392_4 + arg_392_0 then
				arg_389_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_392_5 = 0

			if var_392_5 < arg_389_1.time_ and arg_389_1.time_ <= var_392_5 + arg_392_0 then
				arg_389_1:PlayTimeline("1037ui_story", "StoryTimeline/CharAction/1037/1037actionlink/1037action434")
			end

			local var_392_6 = 0
			local var_392_7 = 0.325

			if var_392_6 < arg_389_1.time_ and arg_389_1.time_ <= var_392_6 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_8 = arg_389_1:FormatText(StoryNameCfg[15].name)

				arg_389_1.leftNameTxt_.text = var_392_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_9 = arg_389_1:GetWordFromCfg(103701097)
				local var_392_10 = arg_389_1:FormatText(var_392_9.content)

				arg_389_1.text_.text = var_392_10

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_11 = 13
				local var_392_12 = utf8.len(var_392_10)
				local var_392_13 = var_392_11 <= 0 and var_392_7 or var_392_7 * (var_392_12 / var_392_11)

				if var_392_13 > 0 and var_392_7 < var_392_13 then
					arg_389_1.talkMaxDuration = var_392_13

					if var_392_13 + var_392_6 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_13 + var_392_6
					end
				end

				arg_389_1.text_.text = var_392_10
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701097", "story_v_side_old_103701.awb") ~= 0 then
					local var_392_14 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701097", "story_v_side_old_103701.awb") / 1000

					if var_392_14 + var_392_6 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_14 + var_392_6
					end

					if var_392_9.prefab_name ~= "" and arg_389_1.actors_[var_392_9.prefab_name] ~= nil then
						local var_392_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_9.prefab_name].transform, "story_v_side_old_103701", "103701097", "story_v_side_old_103701.awb")

						arg_389_1:RecordAudio("103701097", var_392_15)
						arg_389_1:RecordAudio("103701097", var_392_15)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701097", "story_v_side_old_103701.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701097", "story_v_side_old_103701.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_16 = math.max(var_392_7, arg_389_1.talkMaxDuration)

			if var_392_6 <= arg_389_1.time_ and arg_389_1.time_ < var_392_6 + var_392_16 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_6) / var_392_16

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_6 + var_392_16 and arg_389_1.time_ < var_392_6 + var_392_16 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play103701098 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 103701098
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play103701099(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1037ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect1037ui_story == nil then
				arg_393_1.var_.characterEffect1037ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.2

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect1037ui_story then
					local var_396_4 = Mathf.Lerp(0, 0.5, var_396_3)

					arg_393_1.var_.characterEffect1037ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1037ui_story.fillRatio = var_396_4
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect1037ui_story then
				local var_396_5 = 0.5

				arg_393_1.var_.characterEffect1037ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1037ui_story.fillRatio = var_396_5
			end

			local var_396_6 = 0
			local var_396_7 = 0.625

			if var_396_6 < arg_393_1.time_ and arg_393_1.time_ <= var_396_6 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_8 = arg_393_1:FormatText(StoryNameCfg[7].name)

				arg_393_1.leftNameTxt_.text = var_396_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_9 = arg_393_1:GetWordFromCfg(103701098)
				local var_396_10 = arg_393_1:FormatText(var_396_9.content)

				arg_393_1.text_.text = var_396_10

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_11 = 25
				local var_396_12 = utf8.len(var_396_10)
				local var_396_13 = var_396_11 <= 0 and var_396_7 or var_396_7 * (var_396_12 / var_396_11)

				if var_396_13 > 0 and var_396_7 < var_396_13 then
					arg_393_1.talkMaxDuration = var_396_13

					if var_396_13 + var_396_6 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_13 + var_396_6
					end
				end

				arg_393_1.text_.text = var_396_10
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_14 = math.max(var_396_7, arg_393_1.talkMaxDuration)

			if var_396_6 <= arg_393_1.time_ and arg_393_1.time_ < var_396_6 + var_396_14 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_6) / var_396_14

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_6 + var_396_14 and arg_393_1.time_ < var_396_6 + var_396_14 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play103701099 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 103701099
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play103701100(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 0.7

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_2 = arg_397_1:FormatText(StoryNameCfg[7].name)

				arg_397_1.leftNameTxt_.text = var_400_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_3 = arg_397_1:GetWordFromCfg(103701099)
				local var_400_4 = arg_397_1:FormatText(var_400_3.content)

				arg_397_1.text_.text = var_400_4

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_5 = 28
				local var_400_6 = utf8.len(var_400_4)
				local var_400_7 = var_400_5 <= 0 and var_400_1 or var_400_1 * (var_400_6 / var_400_5)

				if var_400_7 > 0 and var_400_1 < var_400_7 then
					arg_397_1.talkMaxDuration = var_400_7

					if var_400_7 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_7 + var_400_0
					end
				end

				arg_397_1.text_.text = var_400_4
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_8 = math.max(var_400_1, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_8 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_0) / var_400_8

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_8 and arg_397_1.time_ < var_400_0 + var_400_8 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play103701100 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 103701100
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play103701101(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1037ui_story"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos1037ui_story = var_404_0.localPosition
			end

			local var_404_2 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2
				local var_404_4 = Vector3.New(0, 100, 0)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1037ui_story, var_404_4, var_404_3)

				local var_404_5 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_5.x, var_404_5.y, var_404_5.z)

				local var_404_6 = var_404_0.localEulerAngles

				var_404_6.z = 0
				var_404_6.x = 0
				var_404_0.localEulerAngles = var_404_6
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(0, 100, 0)

				local var_404_7 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_7.x, var_404_7.y, var_404_7.z)

				local var_404_8 = var_404_0.localEulerAngles

				var_404_8.z = 0
				var_404_8.x = 0
				var_404_0.localEulerAngles = var_404_8
			end

			local var_404_9 = 0
			local var_404_10 = 0.55

			if var_404_9 < arg_401_1.time_ and arg_401_1.time_ <= var_404_9 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_11 = arg_401_1:GetWordFromCfg(103701100)
				local var_404_12 = arg_401_1:FormatText(var_404_11.content)

				arg_401_1.text_.text = var_404_12

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_13 = 22
				local var_404_14 = utf8.len(var_404_12)
				local var_404_15 = var_404_13 <= 0 and var_404_10 or var_404_10 * (var_404_14 / var_404_13)

				if var_404_15 > 0 and var_404_10 < var_404_15 then
					arg_401_1.talkMaxDuration = var_404_15

					if var_404_15 + var_404_9 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_15 + var_404_9
					end
				end

				arg_401_1.text_.text = var_404_12
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_16 = math.max(var_404_10, arg_401_1.talkMaxDuration)

			if var_404_9 <= arg_401_1.time_ and arg_401_1.time_ < var_404_9 + var_404_16 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_9) / var_404_16

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_9 + var_404_16 and arg_401_1.time_ < var_404_9 + var_404_16 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play103701101 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 103701101
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
			arg_405_1.auto_ = false
		end

		function arg_405_1.playNext_(arg_407_0)
			arg_405_1.onStoryFinished_()
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 0.525

			if var_408_0 < arg_405_1.time_ and arg_405_1.time_ <= var_408_0 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, false)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_2 = arg_405_1:GetWordFromCfg(103701101)
				local var_408_3 = arg_405_1:FormatText(var_408_2.content)

				arg_405_1.text_.text = var_408_3

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_4 = 21
				local var_408_5 = utf8.len(var_408_3)
				local var_408_6 = var_408_4 <= 0 and var_408_1 or var_408_1 * (var_408_5 / var_408_4)

				if var_408_6 > 0 and var_408_1 < var_408_6 then
					arg_405_1.talkMaxDuration = var_408_6

					if var_408_6 + var_408_0 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_6 + var_408_0
					end
				end

				arg_405_1.text_.text = var_408_3
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_7 = math.max(var_408_1, arg_405_1.talkMaxDuration)

			if var_408_0 <= arg_405_1.time_ and arg_405_1.time_ < var_408_0 + var_408_7 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_0) / var_408_7

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_0 + var_408_7 and arg_405_1.time_ < var_408_0 + var_408_7 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play103701046 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 103701046
		arg_409_1.duration_ = 5.266

		local var_409_0 = {
			ja = 5.266,
			ko = 3.3,
			en = 2.733
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
				arg_409_0:Play103701047(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["1019ui_story"]
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 and arg_409_1.var_.characterEffect1019ui_story == nil then
				arg_409_1.var_.characterEffect1019ui_story = var_412_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_412_2 = 0.2

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_2 then
				local var_412_3 = (arg_409_1.time_ - var_412_1) / var_412_2

				if arg_409_1.var_.characterEffect1019ui_story then
					arg_409_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_409_1.time_ >= var_412_1 + var_412_2 and arg_409_1.time_ < var_412_1 + var_412_2 + arg_412_0 and arg_409_1.var_.characterEffect1019ui_story then
				arg_409_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_412_4 = 0

			if var_412_4 < arg_409_1.time_ and arg_409_1.time_ <= var_412_4 + arg_412_0 then
				arg_409_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_412_5 = 0

			if var_412_5 < arg_409_1.time_ and arg_409_1.time_ <= var_412_5 + arg_412_0 then
				arg_409_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action462")
			end

			local var_412_6 = 0
			local var_412_7 = 0.2

			if var_412_6 < arg_409_1.time_ and arg_409_1.time_ <= var_412_6 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_8 = arg_409_1:FormatText(StoryNameCfg[13].name)

				arg_409_1.leftNameTxt_.text = var_412_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_9 = arg_409_1:GetWordFromCfg(103701046)
				local var_412_10 = arg_409_1:FormatText(var_412_9.content)

				arg_409_1.text_.text = var_412_10

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_11 = 8
				local var_412_12 = utf8.len(var_412_10)
				local var_412_13 = var_412_11 <= 0 and var_412_7 or var_412_7 * (var_412_12 / var_412_11)

				if var_412_13 > 0 and var_412_7 < var_412_13 then
					arg_409_1.talkMaxDuration = var_412_13

					if var_412_13 + var_412_6 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_13 + var_412_6
					end
				end

				arg_409_1.text_.text = var_412_10
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_old_103701", "103701046", "story_v_side_old_103701.awb") ~= 0 then
					local var_412_14 = manager.audio:GetVoiceLength("story_v_side_old_103701", "103701046", "story_v_side_old_103701.awb") / 1000

					if var_412_14 + var_412_6 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_14 + var_412_6
					end

					if var_412_9.prefab_name ~= "" and arg_409_1.actors_[var_412_9.prefab_name] ~= nil then
						local var_412_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_9.prefab_name].transform, "story_v_side_old_103701", "103701046", "story_v_side_old_103701.awb")

						arg_409_1:RecordAudio("103701046", var_412_15)
						arg_409_1:RecordAudio("103701046", var_412_15)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_side_old_103701", "103701046", "story_v_side_old_103701.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_side_old_103701", "103701046", "story_v_side_old_103701.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_16 = math.max(var_412_7, arg_409_1.talkMaxDuration)

			if var_412_6 <= arg_409_1.time_ and arg_409_1.time_ < var_412_6 + var_412_16 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_6) / var_412_16

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_6 + var_412_16 and arg_409_1.time_ < var_412_6 + var_412_16 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0903",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST13"
	},
	voices = {
		"story_v_side_old_103701.awb"
	}
}
