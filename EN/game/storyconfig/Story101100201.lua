return {
	Play110021001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 110021001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play110021002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "B13a"

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
				local var_4_5 = arg_1_1.bgs_.B13a

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
					if iter_4_0 ~= "B13a" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.B13a
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueB13a = var_4_20.a
					arg_1_1.var_.alphaMatValueB13a = var_4_19
				end

				arg_1_1.var_.alphaOldValueB13a = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueB13a, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueB13a then
					local var_4_24 = arg_1_1.var_.alphaMatValueB13a
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueB13a then
				local var_4_26 = arg_1_1.var_.alphaMatValueB13a
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = 0

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_29 = 2

			if arg_1_1.time_ >= var_4_28 + var_4_29 and arg_1_1.time_ < var_4_28 + var_4_29 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_30 = 0
			local var_4_31 = 0.6

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_34 = 0.738461699336767
			local var_4_35 = 1

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_36 = "play"
				local var_4_37 = "music"

				arg_1_1:AudioAction(var_4_36, var_4_37, "bgm_story_office", "bgm_story_office", "bgm_story_office.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_38 = 2
			local var_4_39 = 2

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_40 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_40:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_41 = arg_1_1:GetWordFromCfg(110021001)
				local var_4_42 = arg_1_1:FormatText(var_4_41.content)

				arg_1_1.text_.text = var_4_42

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_43 = 68
				local var_4_44 = utf8.len(var_4_42)
				local var_4_45 = var_4_43 <= 0 and var_4_39 or var_4_39 * (var_4_44 / var_4_43)

				if var_4_45 > 0 and var_4_39 < var_4_45 then
					arg_1_1.talkMaxDuration = var_4_45
					var_4_38 = var_4_38 + 0.3

					if var_4_45 + var_4_38 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_45 + var_4_38
					end
				end

				arg_1_1.text_.text = var_4_42
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_46 = var_4_38 + 0.3
			local var_4_47 = math.max(var_4_39, arg_1_1.talkMaxDuration)

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_46) / var_4_47

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play110021002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 110021002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play110021003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.625

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

				local var_10_2 = arg_7_1:GetWordFromCfg(110021002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 25
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
	Play110021003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 110021003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play110021004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.7

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

				local var_14_2 = arg_11_1:GetWordFromCfg(110021003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 28
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
	Play110021004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 110021004
		arg_15_1.duration_ = 7

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play110021005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "ST18"

			if arg_15_1.bgs_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(arg_15_1.paintGo_)

				var_18_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_18_0)
				var_18_1.name = var_18_0
				var_18_1.transform.parent = arg_15_1.stage_.transform
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.bgs_[var_18_0] = var_18_1
			end

			local var_18_2 = 1

			if var_18_2 < arg_15_1.time_ and arg_15_1.time_ <= var_18_2 + arg_18_0 then
				local var_18_3 = manager.ui.mainCamera.transform.localPosition
				local var_18_4 = Vector3.New(0, 0, 10) + Vector3.New(var_18_3.x, var_18_3.y, 0)
				local var_18_5 = arg_15_1.bgs_.ST18

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
					if iter_18_0 ~= "ST18" then
						iter_18_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				local var_18_17 = manager.ui.mainCamera.transform.localPosition
				local var_18_18 = Vector3.New(0, 0, 10) + Vector3.New(var_18_17.x, var_18_17.y, 0)
				local var_18_19 = arg_15_1.bgs_.B13a

				var_18_19.transform.localPosition = var_18_18
				var_18_19.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_18_20 = var_18_19:GetComponent("SpriteRenderer")

				if var_18_20 and var_18_20.sprite then
					local var_18_21 = (var_18_19.transform.localPosition - var_18_17).z
					local var_18_22 = manager.ui.mainCameraCom_
					local var_18_23 = 2 * var_18_21 * Mathf.Tan(var_18_22.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_18_24 = var_18_23 * var_18_22.aspect
					local var_18_25 = var_18_20.sprite.bounds.size.x
					local var_18_26 = var_18_20.sprite.bounds.size.y
					local var_18_27 = var_18_24 / var_18_25
					local var_18_28 = var_18_23 / var_18_26
					local var_18_29 = var_18_28 < var_18_27 and var_18_27 or var_18_28

					var_18_19.transform.localScale = Vector3.New(var_18_29, var_18_29, 0)
				end

				for iter_18_2, iter_18_3 in pairs(arg_15_1.bgs_) do
					if iter_18_2 ~= "B13a" then
						iter_18_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_18_30 = arg_15_1.bgs_.B13a
			local var_18_31 = 0

			if var_18_31 < arg_15_1.time_ and arg_15_1.time_ <= var_18_31 + arg_18_0 then
				local var_18_32 = var_18_30:GetComponent("SpriteRenderer")

				if var_18_32 then
					var_18_32.material = arg_15_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_18_33 = var_18_32.material
					local var_18_34 = var_18_33:GetColor("_Color")

					arg_15_1.var_.alphaOldValueB13a = var_18_34.a
					arg_15_1.var_.alphaMatValueB13a = var_18_33
				end

				arg_15_1.var_.alphaOldValueB13a = 1
			end

			local var_18_35 = 1

			if var_18_31 <= arg_15_1.time_ and arg_15_1.time_ < var_18_31 + var_18_35 then
				local var_18_36 = (arg_15_1.time_ - var_18_31) / var_18_35
				local var_18_37 = Mathf.Lerp(arg_15_1.var_.alphaOldValueB13a, 0, var_18_36)

				if arg_15_1.var_.alphaMatValueB13a then
					local var_18_38 = arg_15_1.var_.alphaMatValueB13a
					local var_18_39 = var_18_38:GetColor("_Color")

					var_18_39.a = var_18_37

					var_18_38:SetColor("_Color", var_18_39)
				end
			end

			if arg_15_1.time_ >= var_18_31 + var_18_35 and arg_15_1.time_ < var_18_31 + var_18_35 + arg_18_0 and arg_15_1.var_.alphaMatValueB13a then
				local var_18_40 = arg_15_1.var_.alphaMatValueB13a
				local var_18_41 = var_18_40:GetColor("_Color")

				var_18_41.a = 0

				var_18_40:SetColor("_Color", var_18_41)
			end

			local var_18_42 = arg_15_1.bgs_.ST18
			local var_18_43 = 1

			if var_18_43 < arg_15_1.time_ and arg_15_1.time_ <= var_18_43 + arg_18_0 then
				local var_18_44 = var_18_42:GetComponent("SpriteRenderer")

				if var_18_44 then
					var_18_44.material = arg_15_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_18_45 = var_18_44.material
					local var_18_46 = var_18_45:GetColor("_Color")

					arg_15_1.var_.alphaOldValueST18 = var_18_46.a
					arg_15_1.var_.alphaMatValueST18 = var_18_45
				end

				arg_15_1.var_.alphaOldValueST18 = 0
			end

			local var_18_47 = 1

			if var_18_43 <= arg_15_1.time_ and arg_15_1.time_ < var_18_43 + var_18_47 then
				local var_18_48 = (arg_15_1.time_ - var_18_43) / var_18_47
				local var_18_49 = Mathf.Lerp(arg_15_1.var_.alphaOldValueST18, 1, var_18_48)

				if arg_15_1.var_.alphaMatValueST18 then
					local var_18_50 = arg_15_1.var_.alphaMatValueST18
					local var_18_51 = var_18_50:GetColor("_Color")

					var_18_51.a = var_18_49

					var_18_50:SetColor("_Color", var_18_51)
				end
			end

			if arg_15_1.time_ >= var_18_43 + var_18_47 and arg_15_1.time_ < var_18_43 + var_18_47 + arg_18_0 and arg_15_1.var_.alphaMatValueST18 then
				local var_18_52 = arg_15_1.var_.alphaMatValueST18
				local var_18_53 = var_18_52:GetColor("_Color")

				var_18_53.a = 1

				var_18_52:SetColor("_Color", var_18_53)
			end

			local var_18_54 = manager.ui.mainCamera.transform
			local var_18_55 = 1.8

			if var_18_55 < arg_15_1.time_ and arg_15_1.time_ <= var_18_55 + arg_18_0 then
				arg_15_1.var_.shakeOldPos = var_18_54.localPosition
			end

			local var_18_56 = 0.6

			if var_18_55 <= arg_15_1.time_ and arg_15_1.time_ < var_18_55 + var_18_56 then
				local var_18_57 = (arg_15_1.time_ - var_18_55) / 0.099
				local var_18_58, var_18_59 = math.modf(var_18_57)

				var_18_54.localPosition = Vector3.New(var_18_59 * 0.13, var_18_59 * 0.13, var_18_59 * 0.13) + arg_15_1.var_.shakeOldPos
			end

			if arg_15_1.time_ >= var_18_55 + var_18_56 and arg_15_1.time_ < var_18_55 + var_18_56 + arg_18_0 then
				var_18_54.localPosition = arg_15_1.var_.shakeOldPos
			end

			local var_18_60 = 0

			if var_18_60 < arg_15_1.time_ and arg_15_1.time_ <= var_18_60 + arg_18_0 then
				arg_15_1.allBtn_.enabled = false
			end

			local var_18_61 = 2

			if arg_15_1.time_ >= var_18_60 + var_18_61 and arg_15_1.time_ < var_18_60 + var_18_61 + arg_18_0 then
				arg_15_1.allBtn_.enabled = true
			end

			if arg_15_1.frameCnt_ <= 1 then
				arg_15_1.dialog_:SetActive(false)
			end

			local var_18_62 = 2
			local var_18_63 = 0.1

			if var_18_62 < arg_15_1.time_ and arg_15_1.time_ <= var_18_62 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0

				arg_15_1.dialog_:SetActive(true)

				local var_18_64 = LeanTween.value(arg_15_1.dialog_, 0, 1, 0.3)

				var_18_64:setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
					arg_15_1.dialogCg_.alpha = arg_19_0
				end))
				var_18_64:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_15_1.dialog_)
					var_18_64:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_15_1.duration_ = arg_15_1.duration_ + 0.3

				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_65 = arg_15_1:GetWordFromCfg(110021004)
				local var_18_66 = arg_15_1:FormatText(var_18_65.content)

				arg_15_1.text_.text = var_18_66

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_67 = 4
				local var_18_68 = utf8.len(var_18_66)
				local var_18_69 = var_18_67 <= 0 and var_18_63 or var_18_63 * (var_18_68 / var_18_67)

				if var_18_69 > 0 and var_18_63 < var_18_69 then
					arg_15_1.talkMaxDuration = var_18_69
					var_18_62 = var_18_62 + 0.3

					if var_18_69 + var_18_62 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_69 + var_18_62
					end
				end

				arg_15_1.text_.text = var_18_66
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_70 = var_18_62 + 0.3
			local var_18_71 = math.max(var_18_63, arg_15_1.talkMaxDuration)

			if var_18_70 <= arg_15_1.time_ and arg_15_1.time_ < var_18_70 + var_18_71 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_70) / var_18_71

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_70 + var_18_71 and arg_15_1.time_ < var_18_70 + var_18_71 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play110021005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 110021005
		arg_21_1.duration_ = 5

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play110021006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = 0
			local var_24_1 = 1.55

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

				local var_24_2 = arg_21_1:GetWordFromCfg(110021005)
				local var_24_3 = arg_21_1:FormatText(var_24_2.content)

				arg_21_1.text_.text = var_24_3

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_4 = 62
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
	Play110021006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 110021006
		arg_25_1.duration_ = 6.166

		local var_25_0 = {
			ja = 5.933,
			ko = 5.366,
			zh = 4.833,
			en = 6.166
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
				arg_25_0:Play110021007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 0.375

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_2 = arg_25_1:FormatText(StoryNameCfg[67].name)

				arg_25_1.leftNameTxt_.text = var_28_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, true)
				arg_25_1.iconController_:SetSelectedState("hero")

				arg_25_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1111")

				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_3 = arg_25_1:GetWordFromCfg(110021006)
				local var_28_4 = arg_25_1:FormatText(var_28_3.content)

				arg_25_1.text_.text = var_28_4

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021006", "story_v_out_110021.awb") ~= 0 then
					local var_28_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021006", "story_v_out_110021.awb") / 1000

					if var_28_8 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_8 + var_28_0
					end

					if var_28_3.prefab_name ~= "" and arg_25_1.actors_[var_28_3.prefab_name] ~= nil then
						local var_28_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_3.prefab_name].transform, "story_v_out_110021", "110021006", "story_v_out_110021.awb")

						arg_25_1:RecordAudio("110021006", var_28_9)
						arg_25_1:RecordAudio("110021006", var_28_9)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_110021", "110021006", "story_v_out_110021.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_110021", "110021006", "story_v_out_110021.awb")
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
	Play110021007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 110021007
		arg_29_1.duration_ = 7.8

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play110021008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.bgs_.ST18
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 then
				local var_32_2 = var_32_0:GetComponent("SpriteRenderer")

				if var_32_2 then
					var_32_2.material = arg_29_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_32_3 = var_32_2.material
					local var_32_4 = var_32_3:GetColor("_Color")

					arg_29_1.var_.alphaOldValueST18 = var_32_4.a
					arg_29_1.var_.alphaMatValueST18 = var_32_3
				end

				arg_29_1.var_.alphaOldValueST18 = 1
			end

			local var_32_5 = 1.5

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_5 then
				local var_32_6 = (arg_29_1.time_ - var_32_1) / var_32_5
				local var_32_7 = Mathf.Lerp(arg_29_1.var_.alphaOldValueST18, 0, var_32_6)

				if arg_29_1.var_.alphaMatValueST18 then
					local var_32_8 = arg_29_1.var_.alphaMatValueST18
					local var_32_9 = var_32_8:GetColor("_Color")

					var_32_9.a = var_32_7

					var_32_8:SetColor("_Color", var_32_9)
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_5 and arg_29_1.time_ < var_32_1 + var_32_5 + arg_32_0 and arg_29_1.var_.alphaMatValueST18 then
				local var_32_10 = arg_29_1.var_.alphaMatValueST18
				local var_32_11 = var_32_10:GetColor("_Color")

				var_32_11.a = 0

				var_32_10:SetColor("_Color", var_32_11)
			end

			local var_32_12 = "OS0101"

			if arg_29_1.bgs_[var_32_12] == nil then
				local var_32_13 = Object.Instantiate(arg_29_1.paintGo_)

				var_32_13:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_32_12)
				var_32_13.name = var_32_12
				var_32_13.transform.parent = arg_29_1.stage_.transform
				var_32_13.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.bgs_[var_32_12] = var_32_13
			end

			local var_32_14 = arg_29_1.bgs_.OS0101
			local var_32_15 = 1.5

			if var_32_15 < arg_29_1.time_ and arg_29_1.time_ <= var_32_15 + arg_32_0 then
				local var_32_16 = var_32_14:GetComponent("SpriteRenderer")

				if var_32_16 then
					var_32_16.material = arg_29_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_32_17 = var_32_16.material
					local var_32_18 = var_32_17:GetColor("_Color")

					arg_29_1.var_.alphaOldValueOS0101 = var_32_18.a
					arg_29_1.var_.alphaMatValueOS0101 = var_32_17
				end

				arg_29_1.var_.alphaOldValueOS0101 = 0
			end

			local var_32_19 = 1.5

			if var_32_15 <= arg_29_1.time_ and arg_29_1.time_ < var_32_15 + var_32_19 then
				local var_32_20 = (arg_29_1.time_ - var_32_15) / var_32_19
				local var_32_21 = Mathf.Lerp(arg_29_1.var_.alphaOldValueOS0101, 1, var_32_20)

				if arg_29_1.var_.alphaMatValueOS0101 then
					local var_32_22 = arg_29_1.var_.alphaMatValueOS0101
					local var_32_23 = var_32_22:GetColor("_Color")

					var_32_23.a = var_32_21

					var_32_22:SetColor("_Color", var_32_23)
				end
			end

			if arg_29_1.time_ >= var_32_15 + var_32_19 and arg_29_1.time_ < var_32_15 + var_32_19 + arg_32_0 and arg_29_1.var_.alphaMatValueOS0101 then
				local var_32_24 = arg_29_1.var_.alphaMatValueOS0101
				local var_32_25 = var_32_24:GetColor("_Color")

				var_32_25.a = 1

				var_32_24:SetColor("_Color", var_32_25)
			end

			local var_32_26 = arg_29_1.bgs_.OS0101.transform
			local var_32_27 = 1.5

			if var_32_27 < arg_29_1.time_ and arg_29_1.time_ <= var_32_27 + arg_32_0 then
				arg_29_1.var_.moveOldPosOS0101 = var_32_26.localPosition
			end

			local var_32_28 = 0.001

			if var_32_27 <= arg_29_1.time_ and arg_29_1.time_ < var_32_27 + var_32_28 then
				local var_32_29 = (arg_29_1.time_ - var_32_27) / var_32_28
				local var_32_30 = Vector3.New(0, 2, 8.5)

				var_32_26.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPosOS0101, var_32_30, var_32_29)
			end

			if arg_29_1.time_ >= var_32_27 + var_32_28 and arg_29_1.time_ < var_32_27 + var_32_28 + arg_32_0 then
				var_32_26.localPosition = Vector3.New(0, 2, 8.5)
			end

			local var_32_31 = arg_29_1.bgs_.OS0101.transform
			local var_32_32 = 1.534

			if var_32_32 < arg_29_1.time_ and arg_29_1.time_ <= var_32_32 + arg_32_0 then
				arg_29_1.var_.moveOldPosOS0101 = var_32_31.localPosition
			end

			local var_32_33 = 2.5

			if var_32_32 <= arg_29_1.time_ and arg_29_1.time_ < var_32_32 + var_32_33 then
				local var_32_34 = (arg_29_1.time_ - var_32_32) / var_32_33
				local var_32_35 = Vector3.New(0, 0.7, 8.5)

				var_32_31.localPosition = Vector3.Lerp(arg_29_1.var_.moveOldPosOS0101, var_32_35, var_32_34)
			end

			if arg_29_1.time_ >= var_32_32 + var_32_33 and arg_29_1.time_ < var_32_32 + var_32_33 + arg_32_0 then
				var_32_31.localPosition = Vector3.New(0, 0.7, 8.5)
			end

			local var_32_36 = 0

			if var_32_36 < arg_29_1.time_ and arg_29_1.time_ <= var_32_36 + arg_32_0 then
				arg_29_1.allBtn_.enabled = false
			end

			local var_32_37 = 3

			if arg_29_1.time_ >= var_32_36 + var_32_37 and arg_29_1.time_ < var_32_36 + var_32_37 + arg_32_0 then
				arg_29_1.allBtn_.enabled = true
			end

			if arg_29_1.frameCnt_ <= 1 then
				arg_29_1.dialog_:SetActive(false)
			end

			local var_32_38 = 2.8
			local var_32_39 = 0.6

			if var_32_38 < arg_29_1.time_ and arg_29_1.time_ <= var_32_38 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0

				arg_29_1.dialog_:SetActive(true)

				local var_32_40 = LeanTween.value(arg_29_1.dialog_, 0, 1, 0.3)

				var_32_40:setOnUpdate(LuaHelper.FloatAction(function(arg_33_0)
					arg_29_1.dialogCg_.alpha = arg_33_0
				end))
				var_32_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_29_1.dialog_)
					var_32_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_29_1.duration_ = arg_29_1.duration_ + 0.3

				SetActive(arg_29_1.leftNameGo_, false)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_41 = arg_29_1:GetWordFromCfg(110021007)
				local var_32_42 = arg_29_1:FormatText(var_32_41.content)

				arg_29_1.text_.text = var_32_42

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_43 = 24
				local var_32_44 = utf8.len(var_32_42)
				local var_32_45 = var_32_43 <= 0 and var_32_39 or var_32_39 * (var_32_44 / var_32_43)

				if var_32_45 > 0 and var_32_39 < var_32_45 then
					arg_29_1.talkMaxDuration = var_32_45
					var_32_38 = var_32_38 + 0.3

					if var_32_45 + var_32_38 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_45 + var_32_38
					end
				end

				arg_29_1.text_.text = var_32_42
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_46 = var_32_38 + 0.3
			local var_32_47 = math.max(var_32_39, arg_29_1.talkMaxDuration)

			if var_32_46 <= arg_29_1.time_ and arg_29_1.time_ < var_32_46 + var_32_47 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_46) / var_32_47

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_46 + var_32_47 and arg_29_1.time_ < var_32_46 + var_32_47 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play110021008 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 110021008
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play110021009(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1.525

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, false)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_2 = arg_35_1:GetWordFromCfg(110021008)
				local var_38_3 = arg_35_1:FormatText(var_38_2.content)

				arg_35_1.text_.text = var_38_3

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_4 = 61
				local var_38_5 = utf8.len(var_38_3)
				local var_38_6 = var_38_4 <= 0 and var_38_1 or var_38_1 * (var_38_5 / var_38_4)

				if var_38_6 > 0 and var_38_1 < var_38_6 then
					arg_35_1.talkMaxDuration = var_38_6

					if var_38_6 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_6 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_3
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_7 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_7 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_7

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_7 and arg_35_1.time_ < var_38_0 + var_38_7 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play110021009 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 110021009
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play110021010(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.1

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(110021009)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 4
				local var_42_6 = utf8.len(var_42_4)
				local var_42_7 = var_42_5 <= 0 and var_42_1 or var_42_1 * (var_42_6 / var_42_5)

				if var_42_7 > 0 and var_42_1 < var_42_7 then
					arg_39_1.talkMaxDuration = var_42_7

					if var_42_7 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_7 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_4
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_8 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_8 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_8

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_8 and arg_39_1.time_ < var_42_0 + var_42_8 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play110021010 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 110021010
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play110021011(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1.35

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_2 = arg_43_1:GetWordFromCfg(110021010)
				local var_46_3 = arg_43_1:FormatText(var_46_2.content)

				arg_43_1.text_.text = var_46_3

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_4 = 54
				local var_46_5 = utf8.len(var_46_3)
				local var_46_6 = var_46_4 <= 0 and var_46_1 or var_46_1 * (var_46_5 / var_46_4)

				if var_46_6 > 0 and var_46_1 < var_46_6 then
					arg_43_1.talkMaxDuration = var_46_6

					if var_46_6 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_6 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_3
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_7 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_7 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_7

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_7 and arg_43_1.time_ < var_46_0 + var_46_7 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play110021011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 110021011
		arg_47_1.duration_ = 9.9

		local var_47_0 = {
			ja = 9.9,
			ko = 6.3,
			zh = 7.733,
			en = 8.866
		}
		local var_47_1 = manager.audio:GetLocalizationFlag()

		if var_47_0[var_47_1] ~= nil then
			arg_47_1.duration_ = var_47_0[var_47_1]
		end

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play110021012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.75

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[67].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(110021011)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 30
				local var_50_6 = utf8.len(var_50_4)
				local var_50_7 = var_50_5 <= 0 and var_50_1 or var_50_1 * (var_50_6 / var_50_5)

				if var_50_7 > 0 and var_50_1 < var_50_7 then
					arg_47_1.talkMaxDuration = var_50_7

					if var_50_7 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_7 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_4
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021011", "story_v_out_110021.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021011", "story_v_out_110021.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_110021", "110021011", "story_v_out_110021.awb")

						arg_47_1:RecordAudio("110021011", var_50_9)
						arg_47_1:RecordAudio("110021011", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_110021", "110021011", "story_v_out_110021.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_110021", "110021011", "story_v_out_110021.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_10 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_10 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_10

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_10 and arg_47_1.time_ < var_50_0 + var_50_10 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play110021012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 110021012
		arg_51_1.duration_ = 9.433

		local var_51_0 = {
			ja = 9.433,
			ko = 4.8,
			zh = 5.8,
			en = 6.033
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
				arg_51_0:Play110021013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.6

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[67].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(110021012)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 22
				local var_54_6 = utf8.len(var_54_4)
				local var_54_7 = var_54_5 <= 0 and var_54_1 or var_54_1 * (var_54_6 / var_54_5)

				if var_54_7 > 0 and var_54_1 < var_54_7 then
					arg_51_1.talkMaxDuration = var_54_7

					if var_54_7 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_7 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_4
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021012", "story_v_out_110021.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021012", "story_v_out_110021.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_110021", "110021012", "story_v_out_110021.awb")

						arg_51_1:RecordAudio("110021012", var_54_9)
						arg_51_1:RecordAudio("110021012", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_110021", "110021012", "story_v_out_110021.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_110021", "110021012", "story_v_out_110021.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_10 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_10 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_10

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_10 and arg_51_1.time_ < var_54_0 + var_54_10 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play110021013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 110021013
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play110021014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.05

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[7].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(110021013)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 2
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_8 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_8 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_8

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_8 and arg_55_1.time_ < var_58_0 + var_58_8 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play110021014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 110021014
		arg_59_1.duration_ = 7

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play110021015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "A00"

			if arg_59_1.bgs_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(arg_59_1.paintGo_)

				var_62_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_62_0)
				var_62_1.name = var_62_0
				var_62_1.transform.parent = arg_59_1.stage_.transform
				var_62_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.bgs_[var_62_0] = var_62_1
			end

			local var_62_2 = 1.5

			if var_62_2 < arg_59_1.time_ and arg_59_1.time_ <= var_62_2 + arg_62_0 then
				local var_62_3 = manager.ui.mainCamera.transform.localPosition
				local var_62_4 = Vector3.New(0, 0, 10) + Vector3.New(var_62_3.x, var_62_3.y, 0)
				local var_62_5 = arg_59_1.bgs_.A00

				var_62_5.transform.localPosition = var_62_4
				var_62_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_62_6 = var_62_5:GetComponent("SpriteRenderer")

				if var_62_6 and var_62_6.sprite then
					local var_62_7 = (var_62_5.transform.localPosition - var_62_3).z
					local var_62_8 = manager.ui.mainCameraCom_
					local var_62_9 = 2 * var_62_7 * Mathf.Tan(var_62_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_62_10 = var_62_9 * var_62_8.aspect
					local var_62_11 = var_62_6.sprite.bounds.size.x
					local var_62_12 = var_62_6.sprite.bounds.size.y
					local var_62_13 = var_62_10 / var_62_11
					local var_62_14 = var_62_9 / var_62_12
					local var_62_15 = var_62_14 < var_62_13 and var_62_13 or var_62_14

					var_62_5.transform.localScale = Vector3.New(var_62_15, var_62_15, 0)
				end

				for iter_62_0, iter_62_1 in pairs(arg_59_1.bgs_) do
					if iter_62_0 ~= "A00" then
						iter_62_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_62_16 = arg_59_1.bgs_.OS0101
			local var_62_17 = 0

			if var_62_17 < arg_59_1.time_ and arg_59_1.time_ <= var_62_17 + arg_62_0 then
				local var_62_18 = var_62_16:GetComponent("SpriteRenderer")

				if var_62_18 then
					var_62_18.material = arg_59_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_62_19 = var_62_18.material
					local var_62_20 = var_62_19:GetColor("_Color")

					arg_59_1.var_.alphaOldValueOS0101 = var_62_20.a
					arg_59_1.var_.alphaMatValueOS0101 = var_62_19
				end

				arg_59_1.var_.alphaOldValueOS0101 = 1
			end

			local var_62_21 = 1.5

			if var_62_17 <= arg_59_1.time_ and arg_59_1.time_ < var_62_17 + var_62_21 then
				local var_62_22 = (arg_59_1.time_ - var_62_17) / var_62_21
				local var_62_23 = Mathf.Lerp(arg_59_1.var_.alphaOldValueOS0101, 0, var_62_22)

				if arg_59_1.var_.alphaMatValueOS0101 then
					local var_62_24 = arg_59_1.var_.alphaMatValueOS0101
					local var_62_25 = var_62_24:GetColor("_Color")

					var_62_25.a = var_62_23

					var_62_24:SetColor("_Color", var_62_25)
				end
			end

			if arg_59_1.time_ >= var_62_17 + var_62_21 and arg_59_1.time_ < var_62_17 + var_62_21 + arg_62_0 and arg_59_1.var_.alphaMatValueOS0101 then
				local var_62_26 = arg_59_1.var_.alphaMatValueOS0101
				local var_62_27 = var_62_26:GetColor("_Color")

				var_62_27.a = 0

				var_62_26:SetColor("_Color", var_62_27)
			end

			local var_62_28 = arg_59_1.bgs_.A00
			local var_62_29 = 1.5

			if var_62_29 < arg_59_1.time_ and arg_59_1.time_ <= var_62_29 + arg_62_0 then
				local var_62_30 = var_62_28:GetComponent("SpriteRenderer")

				if var_62_30 then
					var_62_30.material = arg_59_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_62_31 = var_62_30.material
					local var_62_32 = var_62_31:GetColor("_Color")

					arg_59_1.var_.alphaOldValueA00 = var_62_32.a
					arg_59_1.var_.alphaMatValueA00 = var_62_31
				end

				arg_59_1.var_.alphaOldValueA00 = 0
			end

			local var_62_33 = 1.5

			if var_62_29 <= arg_59_1.time_ and arg_59_1.time_ < var_62_29 + var_62_33 then
				local var_62_34 = (arg_59_1.time_ - var_62_29) / var_62_33
				local var_62_35 = Mathf.Lerp(arg_59_1.var_.alphaOldValueA00, 1, var_62_34)

				if arg_59_1.var_.alphaMatValueA00 then
					local var_62_36 = arg_59_1.var_.alphaMatValueA00
					local var_62_37 = var_62_36:GetColor("_Color")

					var_62_37.a = var_62_35

					var_62_36:SetColor("_Color", var_62_37)
				end
			end

			if arg_59_1.time_ >= var_62_29 + var_62_33 and arg_59_1.time_ < var_62_29 + var_62_33 + arg_62_0 and arg_59_1.var_.alphaMatValueA00 then
				local var_62_38 = arg_59_1.var_.alphaMatValueA00
				local var_62_39 = var_62_38:GetColor("_Color")

				var_62_39.a = 1

				var_62_38:SetColor("_Color", var_62_39)
			end

			local var_62_40 = 1.5

			if var_62_40 < arg_59_1.time_ and arg_59_1.time_ <= var_62_40 + arg_62_0 then
				arg_59_1.screenFilterGo_:SetActive(true)

				arg_59_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_62_41 = 0.2

			if var_62_40 <= arg_59_1.time_ and arg_59_1.time_ < var_62_40 + var_62_41 then
				local var_62_42 = (arg_59_1.time_ - var_62_40) / var_62_41

				arg_59_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_62_42)
			end

			if arg_59_1.time_ >= var_62_40 + var_62_41 and arg_59_1.time_ < var_62_40 + var_62_41 + arg_62_0 then
				arg_59_1.screenFilterEffect_.weight = 1
			end

			local var_62_43 = 0

			if var_62_43 < arg_59_1.time_ and arg_59_1.time_ <= var_62_43 + arg_62_0 then
				arg_59_1.allBtn_.enabled = false
			end

			local var_62_44 = 2

			if arg_59_1.time_ >= var_62_43 + var_62_44 and arg_59_1.time_ < var_62_43 + var_62_44 + arg_62_0 then
				arg_59_1.allBtn_.enabled = true
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_45 = 2
			local var_62_46 = 0.325

			if var_62_45 < arg_59_1.time_ and arg_59_1.time_ <= var_62_45 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_47 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_47:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_48 = arg_59_1:GetWordFromCfg(110021014)
				local var_62_49 = arg_59_1:FormatText(var_62_48.content)

				arg_59_1.text_.text = var_62_49

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_50 = 13
				local var_62_51 = utf8.len(var_62_49)
				local var_62_52 = var_62_50 <= 0 and var_62_46 or var_62_46 * (var_62_51 / var_62_50)

				if var_62_52 > 0 and var_62_46 < var_62_52 then
					arg_59_1.talkMaxDuration = var_62_52
					var_62_45 = var_62_45 + 0.3

					if var_62_52 + var_62_45 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_52 + var_62_45
					end
				end

				arg_59_1.text_.text = var_62_49
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_53 = var_62_45 + 0.3
			local var_62_54 = math.max(var_62_46, arg_59_1.talkMaxDuration)

			if var_62_53 <= arg_59_1.time_ and arg_59_1.time_ < var_62_53 + var_62_54 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_53) / var_62_54

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_53 + var_62_54 and arg_59_1.time_ < var_62_53 + var_62_54 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play110021015 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 110021015
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play110021016(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.3

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[7].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(110021015)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 12
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
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_8 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_8 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_8

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_8 and arg_65_1.time_ < var_68_0 + var_68_8 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play110021016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 110021016
		arg_69_1.duration_ = 10

		local var_69_0 = {
			ja = 7.166,
			ko = 7.9,
			zh = 10,
			en = 8.7
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
				arg_69_0:Play110021017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "1019ui_story"

			if arg_69_1.actors_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(Asset.Load("Char/" .. var_72_0), arg_69_1.stage_.transform)

				var_72_1.name = var_72_0
				var_72_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.actors_[var_72_0] = var_72_1

				local var_72_2 = var_72_1:GetComponentInChildren(typeof(CharacterEffect))

				var_72_2.enabled = true

				local var_72_3 = GameObjectTools.GetOrAddComponent(var_72_1, typeof(DynamicBoneHelper))

				if var_72_3 then
					var_72_3:EnableDynamicBone(false)
				end

				arg_69_1:ShowWeapon(var_72_2.transform, false)

				arg_69_1.var_[var_72_0 .. "Animator"] = var_72_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_69_1.var_[var_72_0 .. "Animator"].applyRootMotion = true
				arg_69_1.var_[var_72_0 .. "LipSync"] = var_72_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_72_4 = arg_69_1.actors_["1019ui_story"].transform
			local var_72_5 = 0

			if var_72_5 < arg_69_1.time_ and arg_69_1.time_ <= var_72_5 + arg_72_0 then
				arg_69_1.var_.moveOldPos1019ui_story = var_72_4.localPosition
			end

			local var_72_6 = 0.001

			if var_72_5 <= arg_69_1.time_ and arg_69_1.time_ < var_72_5 + var_72_6 then
				local var_72_7 = (arg_69_1.time_ - var_72_5) / var_72_6
				local var_72_8 = Vector3.New(0, -1.08, -5.9)

				var_72_4.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1019ui_story, var_72_8, var_72_7)

				local var_72_9 = manager.ui.mainCamera.transform.position - var_72_4.position

				var_72_4.forward = Vector3.New(var_72_9.x, var_72_9.y, var_72_9.z)

				local var_72_10 = var_72_4.localEulerAngles

				var_72_10.z = 0
				var_72_10.x = 0
				var_72_4.localEulerAngles = var_72_10
			end

			if arg_69_1.time_ >= var_72_5 + var_72_6 and arg_69_1.time_ < var_72_5 + var_72_6 + arg_72_0 then
				var_72_4.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_72_11 = manager.ui.mainCamera.transform.position - var_72_4.position

				var_72_4.forward = Vector3.New(var_72_11.x, var_72_11.y, var_72_11.z)

				local var_72_12 = var_72_4.localEulerAngles

				var_72_12.z = 0
				var_72_12.x = 0
				var_72_4.localEulerAngles = var_72_12
			end

			local var_72_13 = 0

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				arg_69_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_72_15 = 0
			local var_72_16 = 0.925

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_17 = arg_69_1:FormatText(StoryNameCfg[13].name)

				arg_69_1.leftNameTxt_.text = var_72_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_18 = arg_69_1:GetWordFromCfg(110021016)
				local var_72_19 = arg_69_1:FormatText(var_72_18.content)

				arg_69_1.text_.text = var_72_19

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_20 = 37
				local var_72_21 = utf8.len(var_72_19)
				local var_72_22 = var_72_20 <= 0 and var_72_16 or var_72_16 * (var_72_21 / var_72_20)

				if var_72_22 > 0 and var_72_16 < var_72_22 then
					arg_69_1.talkMaxDuration = var_72_22

					if var_72_22 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_22 + var_72_15
					end
				end

				arg_69_1.text_.text = var_72_19
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021016", "story_v_out_110021.awb") ~= 0 then
					local var_72_23 = manager.audio:GetVoiceLength("story_v_out_110021", "110021016", "story_v_out_110021.awb") / 1000

					if var_72_23 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_23 + var_72_15
					end

					if var_72_18.prefab_name ~= "" and arg_69_1.actors_[var_72_18.prefab_name] ~= nil then
						local var_72_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_18.prefab_name].transform, "story_v_out_110021", "110021016", "story_v_out_110021.awb")

						arg_69_1:RecordAudio("110021016", var_72_24)
						arg_69_1:RecordAudio("110021016", var_72_24)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_110021", "110021016", "story_v_out_110021.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_110021", "110021016", "story_v_out_110021.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_25 = math.max(var_72_16, arg_69_1.talkMaxDuration)

			if var_72_15 <= arg_69_1.time_ and arg_69_1.time_ < var_72_15 + var_72_25 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_15) / var_72_25

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_15 + var_72_25 and arg_69_1.time_ < var_72_15 + var_72_25 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play110021017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 110021017
		arg_73_1.duration_ = 11.866

		local var_73_0 = {
			ja = 11.866,
			ko = 8.033,
			zh = 8.6,
			en = 8.3
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
				arg_73_0:Play110021018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = "B12a"

			if arg_73_1.bgs_[var_76_0] == nil then
				local var_76_1 = Object.Instantiate(arg_73_1.paintGo_)

				var_76_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_76_0)
				var_76_1.name = var_76_0
				var_76_1.transform.parent = arg_73_1.stage_.transform
				var_76_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.bgs_[var_76_0] = var_76_1
			end

			local var_76_2 = 0

			if var_76_2 < arg_73_1.time_ and arg_73_1.time_ <= var_76_2 + arg_76_0 then
				local var_76_3 = manager.ui.mainCamera.transform.localPosition
				local var_76_4 = Vector3.New(0, 0, 10) + Vector3.New(var_76_3.x, var_76_3.y, 0)
				local var_76_5 = arg_73_1.bgs_.B12a

				var_76_5.transform.localPosition = var_76_4
				var_76_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_76_6 = var_76_5:GetComponent("SpriteRenderer")

				if var_76_6 and var_76_6.sprite then
					local var_76_7 = (var_76_5.transform.localPosition - var_76_3).z
					local var_76_8 = manager.ui.mainCameraCom_
					local var_76_9 = 2 * var_76_7 * Mathf.Tan(var_76_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_76_10 = var_76_9 * var_76_8.aspect
					local var_76_11 = var_76_6.sprite.bounds.size.x
					local var_76_12 = var_76_6.sprite.bounds.size.y
					local var_76_13 = var_76_10 / var_76_11
					local var_76_14 = var_76_9 / var_76_12
					local var_76_15 = var_76_14 < var_76_13 and var_76_13 or var_76_14

					var_76_5.transform.localScale = Vector3.New(var_76_15, var_76_15, 0)
				end

				for iter_76_0, iter_76_1 in pairs(arg_73_1.bgs_) do
					if iter_76_0 ~= "B12a" then
						iter_76_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_76_16 = arg_73_1.actors_["1019ui_story"].transform
			local var_76_17 = 0

			if var_76_17 < arg_73_1.time_ and arg_73_1.time_ <= var_76_17 + arg_76_0 then
				arg_73_1.var_.moveOldPos1019ui_story = var_76_16.localPosition
			end

			local var_76_18 = 0.001

			if var_76_17 <= arg_73_1.time_ and arg_73_1.time_ < var_76_17 + var_76_18 then
				local var_76_19 = (arg_73_1.time_ - var_76_17) / var_76_18
				local var_76_20 = Vector3.New(0, 100, 0)

				var_76_16.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1019ui_story, var_76_20, var_76_19)

				local var_76_21 = manager.ui.mainCamera.transform.position - var_76_16.position

				var_76_16.forward = Vector3.New(var_76_21.x, var_76_21.y, var_76_21.z)

				local var_76_22 = var_76_16.localEulerAngles

				var_76_22.z = 0
				var_76_22.x = 0
				var_76_16.localEulerAngles = var_76_22
			end

			if arg_73_1.time_ >= var_76_17 + var_76_18 and arg_73_1.time_ < var_76_17 + var_76_18 + arg_76_0 then
				var_76_16.localPosition = Vector3.New(0, 100, 0)

				local var_76_23 = manager.ui.mainCamera.transform.position - var_76_16.position

				var_76_16.forward = Vector3.New(var_76_23.x, var_76_23.y, var_76_23.z)

				local var_76_24 = var_76_16.localEulerAngles

				var_76_24.z = 0
				var_76_24.x = 0
				var_76_16.localEulerAngles = var_76_24
			end

			local var_76_25 = 0

			if var_76_25 < arg_73_1.time_ and arg_73_1.time_ <= var_76_25 + arg_76_0 then
				arg_73_1.mask_.enabled = true
				arg_73_1.mask_.raycastTarget = true

				arg_73_1:SetGaussion(false)
			end

			local var_76_26 = 1.5

			if var_76_25 <= arg_73_1.time_ and arg_73_1.time_ < var_76_25 + var_76_26 then
				local var_76_27 = (arg_73_1.time_ - var_76_25) / var_76_26
				local var_76_28 = Color.New(1, 1, 1)

				var_76_28.a = Mathf.Lerp(1, 0, var_76_27)
				arg_73_1.mask_.color = var_76_28
			end

			if arg_73_1.time_ >= var_76_25 + var_76_26 and arg_73_1.time_ < var_76_25 + var_76_26 + arg_76_0 then
				local var_76_29 = Color.New(1, 1, 1)
				local var_76_30 = 0

				arg_73_1.mask_.enabled = false
				var_76_29.a = var_76_30
				arg_73_1.mask_.color = var_76_29
			end

			local var_76_31 = "1111ui_story"

			if arg_73_1.actors_[var_76_31] == nil then
				local var_76_32 = Object.Instantiate(Asset.Load("Char/" .. var_76_31), arg_73_1.stage_.transform)

				var_76_32.name = var_76_31
				var_76_32.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.actors_[var_76_31] = var_76_32

				local var_76_33 = var_76_32:GetComponentInChildren(typeof(CharacterEffect))

				var_76_33.enabled = true

				local var_76_34 = GameObjectTools.GetOrAddComponent(var_76_32, typeof(DynamicBoneHelper))

				if var_76_34 then
					var_76_34:EnableDynamicBone(false)
				end

				arg_73_1:ShowWeapon(var_76_33.transform, false)

				arg_73_1.var_[var_76_31 .. "Animator"] = var_76_33.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_73_1.var_[var_76_31 .. "Animator"].applyRootMotion = true
				arg_73_1.var_[var_76_31 .. "LipSync"] = var_76_33.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_76_35 = arg_73_1.actors_["1111ui_story"].transform
			local var_76_36 = 0.034

			if var_76_36 < arg_73_1.time_ and arg_73_1.time_ <= var_76_36 + arg_76_0 then
				arg_73_1.var_.moveOldPos1111ui_story = var_76_35.localPosition
			end

			local var_76_37 = 0.001

			if var_76_36 <= arg_73_1.time_ and arg_73_1.time_ < var_76_36 + var_76_37 then
				local var_76_38 = (arg_73_1.time_ - var_76_36) / var_76_37
				local var_76_39 = Vector3.New(0, -0.83, -6)

				var_76_35.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1111ui_story, var_76_39, var_76_38)

				local var_76_40 = manager.ui.mainCamera.transform.position - var_76_35.position

				var_76_35.forward = Vector3.New(var_76_40.x, var_76_40.y, var_76_40.z)

				local var_76_41 = var_76_35.localEulerAngles

				var_76_41.z = 0
				var_76_41.x = 0
				var_76_35.localEulerAngles = var_76_41
			end

			if arg_73_1.time_ >= var_76_36 + var_76_37 and arg_73_1.time_ < var_76_36 + var_76_37 + arg_76_0 then
				var_76_35.localPosition = Vector3.New(0, -0.83, -6)

				local var_76_42 = manager.ui.mainCamera.transform.position - var_76_35.position

				var_76_35.forward = Vector3.New(var_76_42.x, var_76_42.y, var_76_42.z)

				local var_76_43 = var_76_35.localEulerAngles

				var_76_43.z = 0
				var_76_43.x = 0
				var_76_35.localEulerAngles = var_76_43
			end

			local var_76_44 = arg_73_1.actors_["1111ui_story"]
			local var_76_45 = 0

			if var_76_45 < arg_73_1.time_ and arg_73_1.time_ <= var_76_45 + arg_76_0 and arg_73_1.var_.characterEffect1111ui_story == nil then
				arg_73_1.var_.characterEffect1111ui_story = var_76_44:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_46 = 0.034

			if var_76_45 <= arg_73_1.time_ and arg_73_1.time_ < var_76_45 + var_76_46 then
				local var_76_47 = (arg_73_1.time_ - var_76_45) / var_76_46

				if arg_73_1.var_.characterEffect1111ui_story then
					local var_76_48 = Mathf.Lerp(0, 0.5, var_76_47)

					arg_73_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1111ui_story.fillRatio = var_76_48
				end
			end

			if arg_73_1.time_ >= var_76_45 + var_76_46 and arg_73_1.time_ < var_76_45 + var_76_46 + arg_76_0 and arg_73_1.var_.characterEffect1111ui_story then
				local var_76_49 = 0.5

				arg_73_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1111ui_story.fillRatio = var_76_49
			end

			local var_76_50 = 0

			if var_76_50 < arg_73_1.time_ and arg_73_1.time_ <= var_76_50 + arg_76_0 then
				arg_73_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_1")
			end

			local var_76_51 = 0

			if var_76_51 < arg_73_1.time_ and arg_73_1.time_ <= var_76_51 + arg_76_0 then
				arg_73_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			if arg_73_1.frameCnt_ <= 1 then
				arg_73_1.dialog_:SetActive(false)
			end

			local var_76_52 = 2
			local var_76_53 = 0.65

			if var_76_52 < arg_73_1.time_ and arg_73_1.time_ <= var_76_52 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				arg_73_1.dialog_:SetActive(true)

				local var_76_54 = LeanTween.value(arg_73_1.dialog_, 0, 1, 0.3)

				var_76_54:setOnUpdate(LuaHelper.FloatAction(function(arg_77_0)
					arg_73_1.dialogCg_.alpha = arg_77_0
				end))
				var_76_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_73_1.dialog_)
					var_76_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_73_1.duration_ = arg_73_1.duration_ + 0.3

				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_55 = arg_73_1:FormatText(StoryNameCfg[37].name)

				arg_73_1.leftNameTxt_.text = var_76_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, true)
				arg_73_1.iconController_:SetSelectedState("hero")

				arg_73_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_56 = arg_73_1:GetWordFromCfg(110021017)
				local var_76_57 = arg_73_1:FormatText(var_76_56.content)

				arg_73_1.text_.text = var_76_57

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_58 = 26
				local var_76_59 = utf8.len(var_76_57)
				local var_76_60 = var_76_58 <= 0 and var_76_53 or var_76_53 * (var_76_59 / var_76_58)

				if var_76_60 > 0 and var_76_53 < var_76_60 then
					arg_73_1.talkMaxDuration = var_76_60
					var_76_52 = var_76_52 + 0.3

					if var_76_60 + var_76_52 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_60 + var_76_52
					end
				end

				arg_73_1.text_.text = var_76_57
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021017", "story_v_out_110021.awb") ~= 0 then
					local var_76_61 = manager.audio:GetVoiceLength("story_v_out_110021", "110021017", "story_v_out_110021.awb") / 1000

					if var_76_61 + var_76_52 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_61 + var_76_52
					end

					if var_76_56.prefab_name ~= "" and arg_73_1.actors_[var_76_56.prefab_name] ~= nil then
						local var_76_62 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_56.prefab_name].transform, "story_v_out_110021", "110021017", "story_v_out_110021.awb")

						arg_73_1:RecordAudio("110021017", var_76_62)
						arg_73_1:RecordAudio("110021017", var_76_62)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_110021", "110021017", "story_v_out_110021.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_110021", "110021017", "story_v_out_110021.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_63 = var_76_52 + 0.3
			local var_76_64 = math.max(var_76_53, arg_73_1.talkMaxDuration)

			if var_76_63 <= arg_73_1.time_ and arg_73_1.time_ < var_76_63 + var_76_64 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_63) / var_76_64

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_63 + var_76_64 and arg_73_1.time_ < var_76_63 + var_76_64 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play110021018 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 110021018
		arg_79_1.duration_ = 8.466

		local var_79_0 = {
			ja = 8.466,
			ko = 6.066,
			zh = 6.5,
			en = 4.566
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
				arg_79_0:Play110021019(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1111ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1111ui_story == nil then
				arg_79_1.var_.characterEffect1111ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.2

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1111ui_story then
					arg_79_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1111ui_story then
				arg_79_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_82_4 = 0

			if var_82_4 < arg_79_1.time_ and arg_79_1.time_ <= var_82_4 + arg_82_0 then
				arg_79_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2204cva")
			end

			local var_82_5 = 0
			local var_82_6 = 0.5

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_7 = arg_79_1:FormatText(StoryNameCfg[67].name)

				arg_79_1.leftNameTxt_.text = var_82_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_8 = arg_79_1:GetWordFromCfg(110021018)
				local var_82_9 = arg_79_1:FormatText(var_82_8.content)

				arg_79_1.text_.text = var_82_9

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_10 = 20
				local var_82_11 = utf8.len(var_82_9)
				local var_82_12 = var_82_10 <= 0 and var_82_6 or var_82_6 * (var_82_11 / var_82_10)

				if var_82_12 > 0 and var_82_6 < var_82_12 then
					arg_79_1.talkMaxDuration = var_82_12

					if var_82_12 + var_82_5 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_12 + var_82_5
					end
				end

				arg_79_1.text_.text = var_82_9
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021018", "story_v_out_110021.awb") ~= 0 then
					local var_82_13 = manager.audio:GetVoiceLength("story_v_out_110021", "110021018", "story_v_out_110021.awb") / 1000

					if var_82_13 + var_82_5 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_13 + var_82_5
					end

					if var_82_8.prefab_name ~= "" and arg_79_1.actors_[var_82_8.prefab_name] ~= nil then
						local var_82_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_8.prefab_name].transform, "story_v_out_110021", "110021018", "story_v_out_110021.awb")

						arg_79_1:RecordAudio("110021018", var_82_14)
						arg_79_1:RecordAudio("110021018", var_82_14)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_110021", "110021018", "story_v_out_110021.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_110021", "110021018", "story_v_out_110021.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_15 = math.max(var_82_6, arg_79_1.talkMaxDuration)

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_15 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_5) / var_82_15

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_5 + var_82_15 and arg_79_1.time_ < var_82_5 + var_82_15 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play110021019 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 110021019
		arg_83_1.duration_ = 7

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play110021020(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				local var_86_1 = manager.ui.mainCamera.transform.localPosition
				local var_86_2 = Vector3.New(0, 0, 10) + Vector3.New(var_86_1.x, var_86_1.y, 0)
				local var_86_3 = arg_83_1.bgs_.A00

				var_86_3.transform.localPosition = var_86_2
				var_86_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_86_4 = var_86_3:GetComponent("SpriteRenderer")

				if var_86_4 and var_86_4.sprite then
					local var_86_5 = (var_86_3.transform.localPosition - var_86_1).z
					local var_86_6 = manager.ui.mainCameraCom_
					local var_86_7 = 2 * var_86_5 * Mathf.Tan(var_86_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_86_8 = var_86_7 * var_86_6.aspect
					local var_86_9 = var_86_4.sprite.bounds.size.x
					local var_86_10 = var_86_4.sprite.bounds.size.y
					local var_86_11 = var_86_8 / var_86_9
					local var_86_12 = var_86_7 / var_86_10
					local var_86_13 = var_86_12 < var_86_11 and var_86_11 or var_86_12

					var_86_3.transform.localScale = Vector3.New(var_86_13, var_86_13, 0)
				end

				for iter_86_0, iter_86_1 in pairs(arg_83_1.bgs_) do
					if iter_86_0 ~= "A00" then
						iter_86_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1.screenFilterGo_:SetActive(true)

				arg_83_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_86_15 = 0.2

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_15 then
				local var_86_16 = (arg_83_1.time_ - var_86_14) / var_86_15

				arg_83_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_86_16)
			end

			if arg_83_1.time_ >= var_86_14 + var_86_15 and arg_83_1.time_ < var_86_14 + var_86_15 + arg_86_0 then
				arg_83_1.screenFilterEffect_.weight = 1
			end

			local var_86_17 = 0

			if var_86_17 < arg_83_1.time_ and arg_83_1.time_ <= var_86_17 + arg_86_0 then
				arg_83_1.allBtn_.enabled = false
			end

			local var_86_18 = 2

			if arg_83_1.time_ >= var_86_17 + var_86_18 and arg_83_1.time_ < var_86_17 + var_86_18 + arg_86_0 then
				arg_83_1.allBtn_.enabled = true
			end

			local var_86_19 = arg_83_1.actors_["1111ui_story"].transform
			local var_86_20 = 0

			if var_86_20 < arg_83_1.time_ and arg_83_1.time_ <= var_86_20 + arg_86_0 then
				arg_83_1.var_.moveOldPos1111ui_story = var_86_19.localPosition
			end

			local var_86_21 = 0.001

			if var_86_20 <= arg_83_1.time_ and arg_83_1.time_ < var_86_20 + var_86_21 then
				local var_86_22 = (arg_83_1.time_ - var_86_20) / var_86_21
				local var_86_23 = Vector3.New(0, 100, 0)

				var_86_19.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1111ui_story, var_86_23, var_86_22)

				local var_86_24 = manager.ui.mainCamera.transform.position - var_86_19.position

				var_86_19.forward = Vector3.New(var_86_24.x, var_86_24.y, var_86_24.z)

				local var_86_25 = var_86_19.localEulerAngles

				var_86_25.z = 0
				var_86_25.x = 0
				var_86_19.localEulerAngles = var_86_25
			end

			if arg_83_1.time_ >= var_86_20 + var_86_21 and arg_83_1.time_ < var_86_20 + var_86_21 + arg_86_0 then
				var_86_19.localPosition = Vector3.New(0, 100, 0)

				local var_86_26 = manager.ui.mainCamera.transform.position - var_86_19.position

				var_86_19.forward = Vector3.New(var_86_26.x, var_86_26.y, var_86_26.z)

				local var_86_27 = var_86_19.localEulerAngles

				var_86_27.z = 0
				var_86_27.x = 0
				var_86_19.localEulerAngles = var_86_27
			end

			local var_86_28 = 0

			if var_86_28 < arg_83_1.time_ and arg_83_1.time_ <= var_86_28 + arg_86_0 then
				arg_83_1.mask_.enabled = true
				arg_83_1.mask_.raycastTarget = false

				arg_83_1:SetGaussion(false)
			end

			local var_86_29 = 1.5

			if var_86_28 <= arg_83_1.time_ and arg_83_1.time_ < var_86_28 + var_86_29 then
				local var_86_30 = (arg_83_1.time_ - var_86_28) / var_86_29
				local var_86_31 = Color.New(1, 1, 1)

				var_86_31.a = Mathf.Lerp(1, 0, var_86_30)
				arg_83_1.mask_.color = var_86_31
			end

			if arg_83_1.time_ >= var_86_28 + var_86_29 and arg_83_1.time_ < var_86_28 + var_86_29 + arg_86_0 then
				local var_86_32 = Color.New(1, 1, 1)
				local var_86_33 = 0

				arg_83_1.mask_.enabled = false
				var_86_32.a = var_86_33
				arg_83_1.mask_.color = var_86_32
			end

			local var_86_34 = arg_83_1.actors_["1019ui_story"].transform
			local var_86_35 = 1.8

			if var_86_35 < arg_83_1.time_ and arg_83_1.time_ <= var_86_35 + arg_86_0 then
				arg_83_1.var_.moveOldPos1019ui_story = var_86_34.localPosition
			end

			local var_86_36 = 0.001

			if var_86_35 <= arg_83_1.time_ and arg_83_1.time_ < var_86_35 + var_86_36 then
				local var_86_37 = (arg_83_1.time_ - var_86_35) / var_86_36
				local var_86_38 = Vector3.New(0, -1.08, -5.9)

				var_86_34.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1019ui_story, var_86_38, var_86_37)

				local var_86_39 = manager.ui.mainCamera.transform.position - var_86_34.position

				var_86_34.forward = Vector3.New(var_86_39.x, var_86_39.y, var_86_39.z)

				local var_86_40 = var_86_34.localEulerAngles

				var_86_40.z = 0
				var_86_40.x = 0
				var_86_34.localEulerAngles = var_86_40
			end

			if arg_83_1.time_ >= var_86_35 + var_86_36 and arg_83_1.time_ < var_86_35 + var_86_36 + arg_86_0 then
				var_86_34.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_86_41 = manager.ui.mainCamera.transform.position - var_86_34.position

				var_86_34.forward = Vector3.New(var_86_41.x, var_86_41.y, var_86_41.z)

				local var_86_42 = var_86_34.localEulerAngles

				var_86_42.z = 0
				var_86_42.x = 0
				var_86_34.localEulerAngles = var_86_42
			end

			local var_86_43 = 1.8

			if var_86_43 < arg_83_1.time_ and arg_83_1.time_ <= var_86_43 + arg_86_0 then
				arg_83_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_86_44 = arg_83_1.actors_["1019ui_story"]
			local var_86_45 = 1.8

			if var_86_45 < arg_83_1.time_ and arg_83_1.time_ <= var_86_45 + arg_86_0 and arg_83_1.var_.characterEffect1019ui_story == nil then
				arg_83_1.var_.characterEffect1019ui_story = var_86_44:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_46 = 0.2

			if var_86_45 <= arg_83_1.time_ and arg_83_1.time_ < var_86_45 + var_86_46 then
				local var_86_47 = (arg_83_1.time_ - var_86_45) / var_86_46

				if arg_83_1.var_.characterEffect1019ui_story then
					local var_86_48 = Mathf.Lerp(0, 0.5, var_86_47)

					arg_83_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1019ui_story.fillRatio = var_86_48
				end
			end

			if arg_83_1.time_ >= var_86_45 + var_86_46 and arg_83_1.time_ < var_86_45 + var_86_46 + arg_86_0 and arg_83_1.var_.characterEffect1019ui_story then
				local var_86_49 = 0.5

				arg_83_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1019ui_story.fillRatio = var_86_49
			end

			if arg_83_1.frameCnt_ <= 1 then
				arg_83_1.dialog_:SetActive(false)
			end

			local var_86_50 = 2
			local var_86_51 = 0.975

			if var_86_50 < arg_83_1.time_ and arg_83_1.time_ <= var_86_50 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0

				arg_83_1.dialog_:SetActive(true)

				local var_86_52 = LeanTween.value(arg_83_1.dialog_, 0, 1, 0.3)

				var_86_52:setOnUpdate(LuaHelper.FloatAction(function(arg_87_0)
					arg_83_1.dialogCg_.alpha = arg_87_0
				end))
				var_86_52:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_83_1.dialog_)
					var_86_52:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_83_1.duration_ = arg_83_1.duration_ + 0.3

				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_53 = arg_83_1:FormatText(StoryNameCfg[7].name)

				arg_83_1.leftNameTxt_.text = var_86_53

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_54 = arg_83_1:GetWordFromCfg(110021019)
				local var_86_55 = arg_83_1:FormatText(var_86_54.content)

				arg_83_1.text_.text = var_86_55

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_56 = 39
				local var_86_57 = utf8.len(var_86_55)
				local var_86_58 = var_86_56 <= 0 and var_86_51 or var_86_51 * (var_86_57 / var_86_56)

				if var_86_58 > 0 and var_86_51 < var_86_58 then
					arg_83_1.talkMaxDuration = var_86_58
					var_86_50 = var_86_50 + 0.3

					if var_86_58 + var_86_50 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_58 + var_86_50
					end
				end

				arg_83_1.text_.text = var_86_55
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_59 = var_86_50 + 0.3
			local var_86_60 = math.max(var_86_51, arg_83_1.talkMaxDuration)

			if var_86_59 <= arg_83_1.time_ and arg_83_1.time_ < var_86_59 + var_86_60 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_59) / var_86_60

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_59 + var_86_60 and arg_83_1.time_ < var_86_59 + var_86_60 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play110021020 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 110021020
		arg_89_1.duration_ = 6.166

		local var_89_0 = {
			ja = 6.166,
			ko = 2.6,
			zh = 3.3,
			en = 2.466
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
				arg_89_0:Play110021021(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1019ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect1019ui_story == nil then
				arg_89_1.var_.characterEffect1019ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.2

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect1019ui_story then
					arg_89_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect1019ui_story then
				arg_89_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_92_4 = 0

			if var_92_4 < arg_89_1.time_ and arg_89_1.time_ <= var_92_4 + arg_92_0 then
				arg_89_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action7_1")
			end

			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 then
				arg_89_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_92_6 = 0
			local var_92_7 = 0.175

			if var_92_6 < arg_89_1.time_ and arg_89_1.time_ <= var_92_6 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_8 = arg_89_1:FormatText(StoryNameCfg[13].name)

				arg_89_1.leftNameTxt_.text = var_92_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_9 = arg_89_1:GetWordFromCfg(110021020)
				local var_92_10 = arg_89_1:FormatText(var_92_9.content)

				arg_89_1.text_.text = var_92_10

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_11 = 7
				local var_92_12 = utf8.len(var_92_10)
				local var_92_13 = var_92_11 <= 0 and var_92_7 or var_92_7 * (var_92_12 / var_92_11)

				if var_92_13 > 0 and var_92_7 < var_92_13 then
					arg_89_1.talkMaxDuration = var_92_13

					if var_92_13 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_13 + var_92_6
					end
				end

				arg_89_1.text_.text = var_92_10
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021020", "story_v_out_110021.awb") ~= 0 then
					local var_92_14 = manager.audio:GetVoiceLength("story_v_out_110021", "110021020", "story_v_out_110021.awb") / 1000

					if var_92_14 + var_92_6 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_14 + var_92_6
					end

					if var_92_9.prefab_name ~= "" and arg_89_1.actors_[var_92_9.prefab_name] ~= nil then
						local var_92_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_9.prefab_name].transform, "story_v_out_110021", "110021020", "story_v_out_110021.awb")

						arg_89_1:RecordAudio("110021020", var_92_15)
						arg_89_1:RecordAudio("110021020", var_92_15)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_110021", "110021020", "story_v_out_110021.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_110021", "110021020", "story_v_out_110021.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_16 = math.max(var_92_7, arg_89_1.talkMaxDuration)

			if var_92_6 <= arg_89_1.time_ and arg_89_1.time_ < var_92_6 + var_92_16 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_6) / var_92_16

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_6 + var_92_16 and arg_89_1.time_ < var_92_6 + var_92_16 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play110021021 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 110021021
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play110021022(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1019ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story == nil then
				arg_93_1.var_.characterEffect1019ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.2

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1019ui_story then
					local var_96_4 = Mathf.Lerp(0, 0.5, var_96_3)

					arg_93_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1019ui_story.fillRatio = var_96_4
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1019ui_story then
				local var_96_5 = 0.5

				arg_93_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1019ui_story.fillRatio = var_96_5
			end

			local var_96_6 = 0

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_96_7 = 0
			local var_96_8 = 0.65

			if var_96_7 < arg_93_1.time_ and arg_93_1.time_ <= var_96_7 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, false)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_9 = arg_93_1:GetWordFromCfg(110021021)
				local var_96_10 = arg_93_1:FormatText(var_96_9.content)

				arg_93_1.text_.text = var_96_10

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_11 = 27
				local var_96_12 = utf8.len(var_96_10)
				local var_96_13 = var_96_11 <= 0 and var_96_8 or var_96_8 * (var_96_12 / var_96_11)

				if var_96_13 > 0 and var_96_8 < var_96_13 then
					arg_93_1.talkMaxDuration = var_96_13

					if var_96_13 + var_96_7 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_13 + var_96_7
					end
				end

				arg_93_1.text_.text = var_96_10
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_14 = math.max(var_96_8, arg_93_1.talkMaxDuration)

			if var_96_7 <= arg_93_1.time_ and arg_93_1.time_ < var_96_7 + var_96_14 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_7) / var_96_14

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_7 + var_96_14 and arg_93_1.time_ < var_96_7 + var_96_14 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play110021022 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 110021022
		arg_97_1.duration_ = 12.466

		local var_97_0 = {
			ja = 6.6,
			ko = 12.466,
			zh = 11.9,
			en = 12.233
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
				arg_97_0:Play110021023(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1019ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story == nil then
				arg_97_1.var_.characterEffect1019ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.2

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1019ui_story then
					arg_97_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1019ui_story then
				arg_97_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_100_4 = 0

			if var_100_4 < arg_97_1.time_ and arg_97_1.time_ <= var_100_4 + arg_100_0 then
				arg_97_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action475")
			end

			local var_100_5 = 0

			if var_100_5 < arg_97_1.time_ and arg_97_1.time_ <= var_100_5 + arg_100_0 then
				arg_97_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_100_6 = 0
			local var_100_7 = 1.325

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_8 = arg_97_1:FormatText(StoryNameCfg[13].name)

				arg_97_1.leftNameTxt_.text = var_100_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_9 = arg_97_1:GetWordFromCfg(110021022)
				local var_100_10 = arg_97_1:FormatText(var_100_9.content)

				arg_97_1.text_.text = var_100_10

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_11 = 53
				local var_100_12 = utf8.len(var_100_10)
				local var_100_13 = var_100_11 <= 0 and var_100_7 or var_100_7 * (var_100_12 / var_100_11)

				if var_100_13 > 0 and var_100_7 < var_100_13 then
					arg_97_1.talkMaxDuration = var_100_13

					if var_100_13 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_13 + var_100_6
					end
				end

				arg_97_1.text_.text = var_100_10
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021022", "story_v_out_110021.awb") ~= 0 then
					local var_100_14 = manager.audio:GetVoiceLength("story_v_out_110021", "110021022", "story_v_out_110021.awb") / 1000

					if var_100_14 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_14 + var_100_6
					end

					if var_100_9.prefab_name ~= "" and arg_97_1.actors_[var_100_9.prefab_name] ~= nil then
						local var_100_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_9.prefab_name].transform, "story_v_out_110021", "110021022", "story_v_out_110021.awb")

						arg_97_1:RecordAudio("110021022", var_100_15)
						arg_97_1:RecordAudio("110021022", var_100_15)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_110021", "110021022", "story_v_out_110021.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_110021", "110021022", "story_v_out_110021.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_16 = math.max(var_100_7, arg_97_1.talkMaxDuration)

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_16 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_6) / var_100_16

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_6 + var_100_16 and arg_97_1.time_ < var_100_6 + var_100_16 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play110021023 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 110021023
		arg_101_1.duration_ = 17.433

		local var_101_0 = {
			ja = 17.433,
			ko = 15.733,
			zh = 13.7,
			en = 11.633
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
				arg_101_0:Play110021024(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = 0

			if var_104_0 < arg_101_1.time_ and arg_101_1.time_ <= var_104_0 + arg_104_0 then
				arg_101_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_104_1 = 0
			local var_104_2 = 1.5

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_3 = arg_101_1:FormatText(StoryNameCfg[13].name)

				arg_101_1.leftNameTxt_.text = var_104_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_4 = arg_101_1:GetWordFromCfg(110021023)
				local var_104_5 = arg_101_1:FormatText(var_104_4.content)

				arg_101_1.text_.text = var_104_5

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_6 = 60
				local var_104_7 = utf8.len(var_104_5)
				local var_104_8 = var_104_6 <= 0 and var_104_2 or var_104_2 * (var_104_7 / var_104_6)

				if var_104_8 > 0 and var_104_2 < var_104_8 then
					arg_101_1.talkMaxDuration = var_104_8

					if var_104_8 + var_104_1 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_8 + var_104_1
					end
				end

				arg_101_1.text_.text = var_104_5
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021023", "story_v_out_110021.awb") ~= 0 then
					local var_104_9 = manager.audio:GetVoiceLength("story_v_out_110021", "110021023", "story_v_out_110021.awb") / 1000

					if var_104_9 + var_104_1 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_9 + var_104_1
					end

					if var_104_4.prefab_name ~= "" and arg_101_1.actors_[var_104_4.prefab_name] ~= nil then
						local var_104_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_4.prefab_name].transform, "story_v_out_110021", "110021023", "story_v_out_110021.awb")

						arg_101_1:RecordAudio("110021023", var_104_10)
						arg_101_1:RecordAudio("110021023", var_104_10)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_110021", "110021023", "story_v_out_110021.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_110021", "110021023", "story_v_out_110021.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_11 = math.max(var_104_2, arg_101_1.talkMaxDuration)

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_11 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_1) / var_104_11

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_1 + var_104_11 and arg_101_1.time_ < var_104_1 + var_104_11 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play110021024 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 110021024
		arg_105_1.duration_ = 8.8

		local var_105_0 = {
			ja = 8.8,
			ko = 4.1,
			zh = 4.333,
			en = 4.266
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
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play110021025(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_108_1 = 0
			local var_108_2 = 0.5

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_3 = arg_105_1:FormatText(StoryNameCfg[13].name)

				arg_105_1.leftNameTxt_.text = var_108_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_4 = arg_105_1:GetWordFromCfg(110021024)
				local var_108_5 = arg_105_1:FormatText(var_108_4.content)

				arg_105_1.text_.text = var_108_5

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_6 = 19
				local var_108_7 = utf8.len(var_108_5)
				local var_108_8 = var_108_6 <= 0 and var_108_2 or var_108_2 * (var_108_7 / var_108_6)

				if var_108_8 > 0 and var_108_2 < var_108_8 then
					arg_105_1.talkMaxDuration = var_108_8

					if var_108_8 + var_108_1 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_1
					end
				end

				arg_105_1.text_.text = var_108_5
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021024", "story_v_out_110021.awb") ~= 0 then
					local var_108_9 = manager.audio:GetVoiceLength("story_v_out_110021", "110021024", "story_v_out_110021.awb") / 1000

					if var_108_9 + var_108_1 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_9 + var_108_1
					end

					if var_108_4.prefab_name ~= "" and arg_105_1.actors_[var_108_4.prefab_name] ~= nil then
						local var_108_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_4.prefab_name].transform, "story_v_out_110021", "110021024", "story_v_out_110021.awb")

						arg_105_1:RecordAudio("110021024", var_108_10)
						arg_105_1:RecordAudio("110021024", var_108_10)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_110021", "110021024", "story_v_out_110021.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_110021", "110021024", "story_v_out_110021.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_11 = math.max(var_108_2, arg_105_1.talkMaxDuration)

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_11 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_1) / var_108_11

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_1 + var_108_11 and arg_105_1.time_ < var_108_1 + var_108_11 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play110021025 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 110021025
		arg_109_1.duration_ = 6.633

		local var_109_0 = {
			ja = 6.333,
			ko = 6.633,
			zh = 6.233,
			en = 5.3
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
				arg_109_0:Play110021026(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1019ui_story"].transform
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1.var_.moveOldPos1019ui_story = var_112_0.localPosition
			end

			local var_112_2 = 0.001

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2
				local var_112_4 = Vector3.New(0, 100, 0)

				var_112_0.localPosition = Vector3.Lerp(arg_109_1.var_.moveOldPos1019ui_story, var_112_4, var_112_3)

				local var_112_5 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_5.x, var_112_5.y, var_112_5.z)

				local var_112_6 = var_112_0.localEulerAngles

				var_112_6.z = 0
				var_112_6.x = 0
				var_112_0.localEulerAngles = var_112_6
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 then
				var_112_0.localPosition = Vector3.New(0, 100, 0)

				local var_112_7 = manager.ui.mainCamera.transform.position - var_112_0.position

				var_112_0.forward = Vector3.New(var_112_7.x, var_112_7.y, var_112_7.z)

				local var_112_8 = var_112_0.localEulerAngles

				var_112_8.z = 0
				var_112_8.x = 0
				var_112_0.localEulerAngles = var_112_8
			end

			local var_112_9 = arg_109_1.bgs_.A00
			local var_112_10 = 0

			if var_112_10 < arg_109_1.time_ and arg_109_1.time_ <= var_112_10 + arg_112_0 then
				local var_112_11 = var_112_9:GetComponent("SpriteRenderer")

				if var_112_11 then
					var_112_11.material = arg_109_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_112_12 = var_112_11.material
					local var_112_13 = var_112_12:GetColor("_Color")

					arg_109_1.var_.alphaOldValueA00 = var_112_13.a
					arg_109_1.var_.alphaMatValueA00 = var_112_12
				end

				arg_109_1.var_.alphaOldValueA00 = 1
			end

			local var_112_14 = 1.5

			if var_112_10 <= arg_109_1.time_ and arg_109_1.time_ < var_112_10 + var_112_14 then
				local var_112_15 = (arg_109_1.time_ - var_112_10) / var_112_14
				local var_112_16 = Mathf.Lerp(arg_109_1.var_.alphaOldValueA00, 0, var_112_15)

				if arg_109_1.var_.alphaMatValueA00 then
					local var_112_17 = arg_109_1.var_.alphaMatValueA00
					local var_112_18 = var_112_17:GetColor("_Color")

					var_112_18.a = var_112_16

					var_112_17:SetColor("_Color", var_112_18)
				end
			end

			if arg_109_1.time_ >= var_112_10 + var_112_14 and arg_109_1.time_ < var_112_10 + var_112_14 + arg_112_0 and arg_109_1.var_.alphaMatValueA00 then
				local var_112_19 = arg_109_1.var_.alphaMatValueA00
				local var_112_20 = var_112_19:GetColor("_Color")

				var_112_20.a = 0

				var_112_19:SetColor("_Color", var_112_20)
			end

			local var_112_21 = arg_109_1.bgs_.OS0101
			local var_112_22 = 1.5

			if var_112_22 < arg_109_1.time_ and arg_109_1.time_ <= var_112_22 + arg_112_0 then
				local var_112_23 = var_112_21:GetComponent("SpriteRenderer")

				if var_112_23 then
					var_112_23.material = arg_109_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_112_24 = var_112_23.material
					local var_112_25 = var_112_24:GetColor("_Color")

					arg_109_1.var_.alphaOldValueOS0101 = var_112_25.a
					arg_109_1.var_.alphaMatValueOS0101 = var_112_24
				end

				arg_109_1.var_.alphaOldValueOS0101 = 0
			end

			local var_112_26 = 1.5

			if var_112_22 <= arg_109_1.time_ and arg_109_1.time_ < var_112_22 + var_112_26 then
				local var_112_27 = (arg_109_1.time_ - var_112_22) / var_112_26
				local var_112_28 = Mathf.Lerp(arg_109_1.var_.alphaOldValueOS0101, 1, var_112_27)

				if arg_109_1.var_.alphaMatValueOS0101 then
					local var_112_29 = arg_109_1.var_.alphaMatValueOS0101
					local var_112_30 = var_112_29:GetColor("_Color")

					var_112_30.a = var_112_28

					var_112_29:SetColor("_Color", var_112_30)
				end
			end

			if arg_109_1.time_ >= var_112_22 + var_112_26 and arg_109_1.time_ < var_112_22 + var_112_26 + arg_112_0 and arg_109_1.var_.alphaMatValueOS0101 then
				local var_112_31 = arg_109_1.var_.alphaMatValueOS0101
				local var_112_32 = var_112_31:GetColor("_Color")

				var_112_32.a = 1

				var_112_31:SetColor("_Color", var_112_32)
			end

			local var_112_33 = 1.5

			if var_112_33 < arg_109_1.time_ and arg_109_1.time_ <= var_112_33 + arg_112_0 then
				local var_112_34 = manager.ui.mainCamera.transform.localPosition
				local var_112_35 = Vector3.New(0, 0, 10) + Vector3.New(var_112_34.x, var_112_34.y, 0)
				local var_112_36 = arg_109_1.bgs_.OS0101

				var_112_36.transform.localPosition = var_112_35
				var_112_36.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_112_37 = var_112_36:GetComponent("SpriteRenderer")

				if var_112_37 and var_112_37.sprite then
					local var_112_38 = (var_112_36.transform.localPosition - var_112_34).z
					local var_112_39 = manager.ui.mainCameraCom_
					local var_112_40 = 2 * var_112_38 * Mathf.Tan(var_112_39.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_112_41 = var_112_40 * var_112_39.aspect
					local var_112_42 = var_112_37.sprite.bounds.size.x
					local var_112_43 = var_112_37.sprite.bounds.size.y
					local var_112_44 = var_112_41 / var_112_42
					local var_112_45 = var_112_40 / var_112_43
					local var_112_46 = var_112_45 < var_112_44 and var_112_44 or var_112_45

					var_112_36.transform.localScale = Vector3.New(var_112_46, var_112_46, 0)
				end

				for iter_112_0, iter_112_1 in pairs(arg_109_1.bgs_) do
					if iter_112_0 ~= "OS0101" then
						iter_112_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_112_47 = 0

			if var_112_47 < arg_109_1.time_ and arg_109_1.time_ <= var_112_47 + arg_112_0 then
				arg_109_1.allBtn_.enabled = false
			end

			local var_112_48 = 2

			if arg_109_1.time_ >= var_112_47 + var_112_48 and arg_109_1.time_ < var_112_47 + var_112_48 + arg_112_0 then
				arg_109_1.allBtn_.enabled = true
			end

			local var_112_49 = 1.5

			if var_112_49 < arg_109_1.time_ and arg_109_1.time_ <= var_112_49 + arg_112_0 then
				arg_109_1.screenFilterGo_:SetActive(false)
			end

			local var_112_50 = 0.5

			if var_112_49 <= arg_109_1.time_ and arg_109_1.time_ < var_112_49 + var_112_50 then
				local var_112_51 = (arg_109_1.time_ - var_112_49) / var_112_50

				arg_109_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_112_51)
			end

			if arg_109_1.time_ >= var_112_49 + var_112_50 and arg_109_1.time_ < var_112_49 + var_112_50 + arg_112_0 then
				arg_109_1.screenFilterEffect_.weight = 0
			end

			if arg_109_1.frameCnt_ <= 1 then
				arg_109_1.dialog_:SetActive(false)
			end

			local var_112_52 = 2
			local var_112_53 = 0.375

			if var_112_52 < arg_109_1.time_ and arg_109_1.time_ <= var_112_52 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0

				arg_109_1.dialog_:SetActive(true)

				local var_112_54 = LeanTween.value(arg_109_1.dialog_, 0, 1, 0.3)

				var_112_54:setOnUpdate(LuaHelper.FloatAction(function(arg_113_0)
					arg_109_1.dialogCg_.alpha = arg_113_0
				end))
				var_112_54:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_109_1.dialog_)
					var_112_54:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_109_1.duration_ = arg_109_1.duration_ + 0.3

				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_55 = arg_109_1:FormatText(StoryNameCfg[67].name)

				arg_109_1.leftNameTxt_.text = var_112_55

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_56 = arg_109_1:GetWordFromCfg(110021025)
				local var_112_57 = arg_109_1:FormatText(var_112_56.content)

				arg_109_1.text_.text = var_112_57

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_58 = 15
				local var_112_59 = utf8.len(var_112_57)
				local var_112_60 = var_112_58 <= 0 and var_112_53 or var_112_53 * (var_112_59 / var_112_58)

				if var_112_60 > 0 and var_112_53 < var_112_60 then
					arg_109_1.talkMaxDuration = var_112_60
					var_112_52 = var_112_52 + 0.3

					if var_112_60 + var_112_52 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_60 + var_112_52
					end
				end

				arg_109_1.text_.text = var_112_57
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021025", "story_v_out_110021.awb") ~= 0 then
					local var_112_61 = manager.audio:GetVoiceLength("story_v_out_110021", "110021025", "story_v_out_110021.awb") / 1000

					if var_112_61 + var_112_52 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_61 + var_112_52
					end

					if var_112_56.prefab_name ~= "" and arg_109_1.actors_[var_112_56.prefab_name] ~= nil then
						local var_112_62 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_56.prefab_name].transform, "story_v_out_110021", "110021025", "story_v_out_110021.awb")

						arg_109_1:RecordAudio("110021025", var_112_62)
						arg_109_1:RecordAudio("110021025", var_112_62)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_110021", "110021025", "story_v_out_110021.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_110021", "110021025", "story_v_out_110021.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_63 = var_112_52 + 0.3
			local var_112_64 = math.max(var_112_53, arg_109_1.talkMaxDuration)

			if var_112_63 <= arg_109_1.time_ and arg_109_1.time_ < var_112_63 + var_112_64 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_63) / var_112_64

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_63 + var_112_64 and arg_109_1.time_ < var_112_63 + var_112_64 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play110021026 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 110021026
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play110021027(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1111ui_story"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.characterEffect1111ui_story == nil then
				arg_115_1.var_.characterEffect1111ui_story = var_118_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.characterEffect1111ui_story then
					local var_118_4 = Mathf.Lerp(0, 0.5, var_118_3)

					arg_115_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1111ui_story.fillRatio = var_118_4
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1111ui_story then
				local var_118_5 = 0.5

				arg_115_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1111ui_story.fillRatio = var_118_5
			end

			local var_118_6 = 0
			local var_118_7 = 1.9

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, false)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_8 = arg_115_1:GetWordFromCfg(110021026)
				local var_118_9 = arg_115_1:FormatText(var_118_8.content)

				arg_115_1.text_.text = var_118_9

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_10 = 76
				local var_118_11 = utf8.len(var_118_9)
				local var_118_12 = var_118_10 <= 0 and var_118_7 or var_118_7 * (var_118_11 / var_118_10)

				if var_118_12 > 0 and var_118_7 < var_118_12 then
					arg_115_1.talkMaxDuration = var_118_12

					if var_118_12 + var_118_6 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_12 + var_118_6
					end
				end

				arg_115_1.text_.text = var_118_9
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_13 = math.max(var_118_7, arg_115_1.talkMaxDuration)

			if var_118_6 <= arg_115_1.time_ and arg_115_1.time_ < var_118_6 + var_118_13 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_6) / var_118_13

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_6 + var_118_13 and arg_115_1.time_ < var_118_6 + var_118_13 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play110021027 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 110021027
		arg_119_1.duration_ = 5

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play110021028(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 1

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_2 = arg_119_1:GetWordFromCfg(110021027)
				local var_122_3 = arg_119_1:FormatText(var_122_2.content)

				arg_119_1.text_.text = var_122_3

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_4 = 40
				local var_122_5 = utf8.len(var_122_3)
				local var_122_6 = var_122_4 <= 0 and var_122_1 or var_122_1 * (var_122_5 / var_122_4)

				if var_122_6 > 0 and var_122_1 < var_122_6 then
					arg_119_1.talkMaxDuration = var_122_6

					if var_122_6 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_6 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_3
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_7 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_7 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_7

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_7 and arg_119_1.time_ < var_122_0 + var_122_7 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play110021028 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 110021028
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play110021029(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.425

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, false)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_2 = arg_123_1:GetWordFromCfg(110021028)
				local var_126_3 = arg_123_1:FormatText(var_126_2.content)

				arg_123_1.text_.text = var_126_3

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_4 = 17
				local var_126_5 = utf8.len(var_126_3)
				local var_126_6 = var_126_4 <= 0 and var_126_1 or var_126_1 * (var_126_5 / var_126_4)

				if var_126_6 > 0 and var_126_1 < var_126_6 then
					arg_123_1.talkMaxDuration = var_126_6

					if var_126_6 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_6 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_3
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_7 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_7 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_7

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_7 and arg_123_1.time_ < var_126_0 + var_126_7 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play110021029 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 110021029
		arg_127_1.duration_ = 0.100000001489

		SetActive(arg_127_1.tipsGo_, false)

		function arg_127_1.onSingleLineFinish_()
			arg_127_1.onSingleLineUpdate_ = nil
			arg_127_1.onSingleLineFinish_ = nil
			arg_127_1.state_ = "waiting"

			SetActive(arg_127_1.choicesGo_, true)

			for iter_128_0, iter_128_1 in ipairs(arg_127_1.choices_) do
				local var_128_0 = iter_128_0 <= 2

				SetActive(iter_128_1.go, var_128_0)
			end

			arg_127_1.choices_[1].txt.text = arg_127_1:FormatText(StoryChoiceCfg[110].name)
			arg_127_1.choices_[2].txt.text = arg_127_1:FormatText(StoryChoiceCfg[111].name)
		end

		function arg_127_1.playNext_(arg_129_0)
			if arg_129_0 == 1 then
				arg_127_0:Play110021030(arg_127_1)
			end

			if arg_129_0 == 2 then
				arg_127_0:Play110021030(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			return
		end
	end,
	Play110021030 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 110021030
		arg_131_1.duration_ = 5.533

		local var_131_0 = {
			ja = 5.533,
			ko = 4.7,
			zh = 4.4,
			en = 4.133
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
				arg_131_0:Play110021031(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.4

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_2 = arg_131_1:FormatText(StoryNameCfg[67].name)

				arg_131_1.leftNameTxt_.text = var_134_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_3 = arg_131_1:GetWordFromCfg(110021030)
				local var_134_4 = arg_131_1:FormatText(var_134_3.content)

				arg_131_1.text_.text = var_134_4

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_5 = 16
				local var_134_6 = utf8.len(var_134_4)
				local var_134_7 = var_134_5 <= 0 and var_134_1 or var_134_1 * (var_134_6 / var_134_5)

				if var_134_7 > 0 and var_134_1 < var_134_7 then
					arg_131_1.talkMaxDuration = var_134_7

					if var_134_7 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_7 + var_134_0
					end
				end

				arg_131_1.text_.text = var_134_4
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021030", "story_v_out_110021.awb") ~= 0 then
					local var_134_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021030", "story_v_out_110021.awb") / 1000

					if var_134_8 + var_134_0 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_0
					end

					if var_134_3.prefab_name ~= "" and arg_131_1.actors_[var_134_3.prefab_name] ~= nil then
						local var_134_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_3.prefab_name].transform, "story_v_out_110021", "110021030", "story_v_out_110021.awb")

						arg_131_1:RecordAudio("110021030", var_134_9)
						arg_131_1:RecordAudio("110021030", var_134_9)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_110021", "110021030", "story_v_out_110021.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_110021", "110021030", "story_v_out_110021.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_10 = math.max(var_134_1, arg_131_1.talkMaxDuration)

			if var_134_0 <= arg_131_1.time_ and arg_131_1.time_ < var_134_0 + var_134_10 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_0) / var_134_10

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_0 + var_134_10 and arg_131_1.time_ < var_134_0 + var_134_10 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play110021031 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 110021031
		arg_135_1.duration_ = 9.1

		local var_135_0 = {
			ja = 9.1,
			ko = 6.666,
			zh = 7.833,
			en = 8.466
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
				arg_135_0:Play110021032(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0
			local var_138_1 = 0.775

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_2 = arg_135_1:FormatText(StoryNameCfg[67].name)

				arg_135_1.leftNameTxt_.text = var_138_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_3 = arg_135_1:GetWordFromCfg(110021031)
				local var_138_4 = arg_135_1:FormatText(var_138_3.content)

				arg_135_1.text_.text = var_138_4

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_5 = 29
				local var_138_6 = utf8.len(var_138_4)
				local var_138_7 = var_138_5 <= 0 and var_138_1 or var_138_1 * (var_138_6 / var_138_5)

				if var_138_7 > 0 and var_138_1 < var_138_7 then
					arg_135_1.talkMaxDuration = var_138_7

					if var_138_7 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_7 + var_138_0
					end
				end

				arg_135_1.text_.text = var_138_4
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021031", "story_v_out_110021.awb") ~= 0 then
					local var_138_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021031", "story_v_out_110021.awb") / 1000

					if var_138_8 + var_138_0 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_8 + var_138_0
					end

					if var_138_3.prefab_name ~= "" and arg_135_1.actors_[var_138_3.prefab_name] ~= nil then
						local var_138_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_3.prefab_name].transform, "story_v_out_110021", "110021031", "story_v_out_110021.awb")

						arg_135_1:RecordAudio("110021031", var_138_9)
						arg_135_1:RecordAudio("110021031", var_138_9)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_110021", "110021031", "story_v_out_110021.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_110021", "110021031", "story_v_out_110021.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_10 = math.max(var_138_1, arg_135_1.talkMaxDuration)

			if var_138_0 <= arg_135_1.time_ and arg_135_1.time_ < var_138_0 + var_138_10 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_0) / var_138_10

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_0 + var_138_10 and arg_135_1.time_ < var_138_0 + var_138_10 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play110021032 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 110021032
		arg_139_1.duration_ = 13.5

		local var_139_0 = {
			ja = 11.466,
			ko = 13.5,
			zh = 12.266,
			en = 11.366
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
				arg_139_0:Play110021033(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = manager.ui.mainCamera.transform
			local var_142_1 = 0.9

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.shakeOldPos = var_142_0.localPosition
			end

			local var_142_2 = 0.6

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / 0.066
				local var_142_4, var_142_5 = math.modf(var_142_3)

				var_142_0.localPosition = Vector3.New(var_142_5 * 0.13, var_142_5 * 0.13, var_142_5 * 0.13) + arg_139_1.var_.shakeOldPos
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = arg_139_1.var_.shakeOldPos
			end

			local var_142_6 = 0
			local var_142_7 = 1.3

			if var_142_6 < arg_139_1.time_ and arg_139_1.time_ <= var_142_6 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_8 = arg_139_1:FormatText(StoryNameCfg[67].name)

				arg_139_1.leftNameTxt_.text = var_142_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_9 = arg_139_1:GetWordFromCfg(110021032)
				local var_142_10 = arg_139_1:FormatText(var_142_9.content)

				arg_139_1.text_.text = var_142_10

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_11 = 50
				local var_142_12 = utf8.len(var_142_10)
				local var_142_13 = var_142_11 <= 0 and var_142_7 or var_142_7 * (var_142_12 / var_142_11)

				if var_142_13 > 0 and var_142_7 < var_142_13 then
					arg_139_1.talkMaxDuration = var_142_13

					if var_142_13 + var_142_6 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_13 + var_142_6
					end
				end

				arg_139_1.text_.text = var_142_10
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021032", "story_v_out_110021.awb") ~= 0 then
					local var_142_14 = manager.audio:GetVoiceLength("story_v_out_110021", "110021032", "story_v_out_110021.awb") / 1000

					if var_142_14 + var_142_6 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_14 + var_142_6
					end

					if var_142_9.prefab_name ~= "" and arg_139_1.actors_[var_142_9.prefab_name] ~= nil then
						local var_142_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_9.prefab_name].transform, "story_v_out_110021", "110021032", "story_v_out_110021.awb")

						arg_139_1:RecordAudio("110021032", var_142_15)
						arg_139_1:RecordAudio("110021032", var_142_15)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_110021", "110021032", "story_v_out_110021.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_110021", "110021032", "story_v_out_110021.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_16 = math.max(var_142_7, arg_139_1.talkMaxDuration)

			if var_142_6 <= arg_139_1.time_ and arg_139_1.time_ < var_142_6 + var_142_16 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_6) / var_142_16

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_6 + var_142_16 and arg_139_1.time_ < var_142_6 + var_142_16 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play110021033 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 110021033
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play110021034(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.775

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[7].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(110021033)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 31
				local var_146_6 = utf8.len(var_146_4)
				local var_146_7 = var_146_5 <= 0 and var_146_1 or var_146_1 * (var_146_6 / var_146_5)

				if var_146_7 > 0 and var_146_1 < var_146_7 then
					arg_143_1.talkMaxDuration = var_146_7

					if var_146_7 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_7 + var_146_0
					end
				end

				arg_143_1.text_.text = var_146_4
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_8 = math.max(var_146_1, arg_143_1.talkMaxDuration)

			if var_146_0 <= arg_143_1.time_ and arg_143_1.time_ < var_146_0 + var_146_8 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_0) / var_146_8

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_0 + var_146_8 and arg_143_1.time_ < var_146_0 + var_146_8 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play110021034 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 110021034
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play110021035(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.7

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_2 = arg_147_1:FormatText(StoryNameCfg[7].name)

				arg_147_1.leftNameTxt_.text = var_150_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_3 = arg_147_1:GetWordFromCfg(110021034)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 28
				local var_150_6 = utf8.len(var_150_4)
				local var_150_7 = var_150_5 <= 0 and var_150_1 or var_150_1 * (var_150_6 / var_150_5)

				if var_150_7 > 0 and var_150_1 < var_150_7 then
					arg_147_1.talkMaxDuration = var_150_7

					if var_150_7 + var_150_0 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_7 + var_150_0
					end
				end

				arg_147_1.text_.text = var_150_4
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)
				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_8 = math.max(var_150_1, arg_147_1.talkMaxDuration)

			if var_150_0 <= arg_147_1.time_ and arg_147_1.time_ < var_150_0 + var_150_8 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_0) / var_150_8

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_0 + var_150_8 and arg_147_1.time_ < var_150_0 + var_150_8 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play110021035 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 110021035
		arg_151_1.duration_ = 2.933

		local var_151_0 = {
			ja = 2.7,
			ko = 2.166,
			zh = 2.933,
			en = 2.7
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
				arg_151_0:Play110021036(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.25

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[67].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(110021035)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 10
				local var_154_6 = utf8.len(var_154_4)
				local var_154_7 = var_154_5 <= 0 and var_154_1 or var_154_1 * (var_154_6 / var_154_5)

				if var_154_7 > 0 and var_154_1 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_4
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021035", "story_v_out_110021.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021035", "story_v_out_110021.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_110021", "110021035", "story_v_out_110021.awb")

						arg_151_1:RecordAudio("110021035", var_154_9)
						arg_151_1:RecordAudio("110021035", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_110021", "110021035", "story_v_out_110021.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_110021", "110021035", "story_v_out_110021.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_10 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_10 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_10

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_10 and arg_151_1.time_ < var_154_0 + var_154_10 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play110021036 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 110021036
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play110021037(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 0.875

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[7].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(110021036)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 35
				local var_158_6 = utf8.len(var_158_4)
				local var_158_7 = var_158_5 <= 0 and var_158_1 or var_158_1 * (var_158_6 / var_158_5)

				if var_158_7 > 0 and var_158_1 < var_158_7 then
					arg_155_1.talkMaxDuration = var_158_7

					if var_158_7 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_7 + var_158_0
					end
				end

				arg_155_1.text_.text = var_158_4
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_8 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_8 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_8

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_8 and arg_155_1.time_ < var_158_0 + var_158_8 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play110021037 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 110021037
		arg_159_1.duration_ = 10.266

		local var_159_0 = {
			ja = 10.266,
			ko = 8.733,
			zh = 8,
			en = 8.066
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
				arg_159_0:Play110021038(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 0.9

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_2 = arg_159_1:FormatText(StoryNameCfg[67].name)

				arg_159_1.leftNameTxt_.text = var_162_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_3 = arg_159_1:GetWordFromCfg(110021037)
				local var_162_4 = arg_159_1:FormatText(var_162_3.content)

				arg_159_1.text_.text = var_162_4

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_5 = 34
				local var_162_6 = utf8.len(var_162_4)
				local var_162_7 = var_162_5 <= 0 and var_162_1 or var_162_1 * (var_162_6 / var_162_5)

				if var_162_7 > 0 and var_162_1 < var_162_7 then
					arg_159_1.talkMaxDuration = var_162_7

					if var_162_7 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_7 + var_162_0
					end
				end

				arg_159_1.text_.text = var_162_4
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021037", "story_v_out_110021.awb") ~= 0 then
					local var_162_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021037", "story_v_out_110021.awb") / 1000

					if var_162_8 + var_162_0 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_8 + var_162_0
					end

					if var_162_3.prefab_name ~= "" and arg_159_1.actors_[var_162_3.prefab_name] ~= nil then
						local var_162_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_3.prefab_name].transform, "story_v_out_110021", "110021037", "story_v_out_110021.awb")

						arg_159_1:RecordAudio("110021037", var_162_9)
						arg_159_1:RecordAudio("110021037", var_162_9)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_110021", "110021037", "story_v_out_110021.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_110021", "110021037", "story_v_out_110021.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_10 = math.max(var_162_1, arg_159_1.talkMaxDuration)

			if var_162_0 <= arg_159_1.time_ and arg_159_1.time_ < var_162_0 + var_162_10 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_0) / var_162_10

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_0 + var_162_10 and arg_159_1.time_ < var_162_0 + var_162_10 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play110021038 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 110021038
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play110021039(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.2

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_2 = arg_163_1:FormatText(StoryNameCfg[7].name)

				arg_163_1.leftNameTxt_.text = var_166_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_3 = arg_163_1:GetWordFromCfg(110021038)
				local var_166_4 = arg_163_1:FormatText(var_166_3.content)

				arg_163_1.text_.text = var_166_4

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_5 = 8
				local var_166_6 = utf8.len(var_166_4)
				local var_166_7 = var_166_5 <= 0 and var_166_1 or var_166_1 * (var_166_6 / var_166_5)

				if var_166_7 > 0 and var_166_1 < var_166_7 then
					arg_163_1.talkMaxDuration = var_166_7

					if var_166_7 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_7 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_4
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_8 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_8 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_8

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_8 and arg_163_1.time_ < var_166_0 + var_166_8 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play110021039 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 110021039
		arg_167_1.duration_ = 16.233

		local var_167_0 = {
			ja = 14.933,
			ko = 16.233,
			zh = 15.4,
			en = 13.6
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
				arg_167_0:Play110021040(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 1.5

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_2 = arg_167_1:FormatText(StoryNameCfg[67].name)

				arg_167_1.leftNameTxt_.text = var_170_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_3 = arg_167_1:GetWordFromCfg(110021039)
				local var_170_4 = arg_167_1:FormatText(var_170_3.content)

				arg_167_1.text_.text = var_170_4

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_5 = 60
				local var_170_6 = utf8.len(var_170_4)
				local var_170_7 = var_170_5 <= 0 and var_170_1 or var_170_1 * (var_170_6 / var_170_5)

				if var_170_7 > 0 and var_170_1 < var_170_7 then
					arg_167_1.talkMaxDuration = var_170_7

					if var_170_7 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_7 + var_170_0
					end
				end

				arg_167_1.text_.text = var_170_4
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021039", "story_v_out_110021.awb") ~= 0 then
					local var_170_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021039", "story_v_out_110021.awb") / 1000

					if var_170_8 + var_170_0 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_0
					end

					if var_170_3.prefab_name ~= "" and arg_167_1.actors_[var_170_3.prefab_name] ~= nil then
						local var_170_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_3.prefab_name].transform, "story_v_out_110021", "110021039", "story_v_out_110021.awb")

						arg_167_1:RecordAudio("110021039", var_170_9)
						arg_167_1:RecordAudio("110021039", var_170_9)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_110021", "110021039", "story_v_out_110021.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_110021", "110021039", "story_v_out_110021.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_10 = math.max(var_170_1, arg_167_1.talkMaxDuration)

			if var_170_0 <= arg_167_1.time_ and arg_167_1.time_ < var_170_0 + var_170_10 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_0) / var_170_10

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_0 + var_170_10 and arg_167_1.time_ < var_170_0 + var_170_10 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play110021040 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 110021040
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play110021041(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.925

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[7].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(110021040)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 37
				local var_174_6 = utf8.len(var_174_4)
				local var_174_7 = var_174_5 <= 0 and var_174_1 or var_174_1 * (var_174_6 / var_174_5)

				if var_174_7 > 0 and var_174_1 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_4
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_8 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_8 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_8

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_8 and arg_171_1.time_ < var_174_0 + var_174_8 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play110021041 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 110021041
		arg_175_1.duration_ = 6.966

		local var_175_0 = {
			ja = 5.733,
			ko = 6.133,
			zh = 6.933,
			en = 6.966
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
				arg_175_0:Play110021042(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.775

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[67].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(110021041)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 31
				local var_178_6 = utf8.len(var_178_4)
				local var_178_7 = var_178_5 <= 0 and var_178_1 or var_178_1 * (var_178_6 / var_178_5)

				if var_178_7 > 0 and var_178_1 < var_178_7 then
					arg_175_1.talkMaxDuration = var_178_7

					if var_178_7 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_7 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_4
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021041", "story_v_out_110021.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021041", "story_v_out_110021.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_110021", "110021041", "story_v_out_110021.awb")

						arg_175_1:RecordAudio("110021041", var_178_9)
						arg_175_1:RecordAudio("110021041", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_110021", "110021041", "story_v_out_110021.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_110021", "110021041", "story_v_out_110021.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_10 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_10 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_10

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_10 and arg_175_1.time_ < var_178_0 + var_178_10 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play110021042 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 110021042
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play110021043(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = 0
			local var_182_1 = 1.2

			if var_182_0 < arg_179_1.time_ and arg_179_1.time_ <= var_182_0 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_2 = arg_179_1:FormatText(StoryNameCfg[7].name)

				arg_179_1.leftNameTxt_.text = var_182_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_3 = arg_179_1:GetWordFromCfg(110021042)
				local var_182_4 = arg_179_1:FormatText(var_182_3.content)

				arg_179_1.text_.text = var_182_4

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_5 = 48
				local var_182_6 = utf8.len(var_182_4)
				local var_182_7 = var_182_5 <= 0 and var_182_1 or var_182_1 * (var_182_6 / var_182_5)

				if var_182_7 > 0 and var_182_1 < var_182_7 then
					arg_179_1.talkMaxDuration = var_182_7

					if var_182_7 + var_182_0 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_7 + var_182_0
					end
				end

				arg_179_1.text_.text = var_182_4
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_8 = math.max(var_182_1, arg_179_1.talkMaxDuration)

			if var_182_0 <= arg_179_1.time_ and arg_179_1.time_ < var_182_0 + var_182_8 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_0) / var_182_8

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_0 + var_182_8 and arg_179_1.time_ < var_182_0 + var_182_8 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play110021043 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 110021043
		arg_183_1.duration_ = 9.333

		local var_183_0 = {
			ja = 7.9,
			ko = 9.333,
			zh = 7.933,
			en = 8.4
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
				arg_183_0:Play110021044(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 1

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[67].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(110021043)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 40
				local var_186_6 = utf8.len(var_186_4)
				local var_186_7 = var_186_5 <= 0 and var_186_1 or var_186_1 * (var_186_6 / var_186_5)

				if var_186_7 > 0 and var_186_1 < var_186_7 then
					arg_183_1.talkMaxDuration = var_186_7

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_4
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021043", "story_v_out_110021.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_110021", "110021043", "story_v_out_110021.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_110021", "110021043", "story_v_out_110021.awb")

						arg_183_1:RecordAudio("110021043", var_186_9)
						arg_183_1:RecordAudio("110021043", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_110021", "110021043", "story_v_out_110021.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_110021", "110021043", "story_v_out_110021.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_10 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_10 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_10

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_10 and arg_183_1.time_ < var_186_0 + var_186_10 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play110021044 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 110021044
		arg_187_1.duration_ = 5

		SetActive(arg_187_1.tipsGo_, false)

		function arg_187_1.onSingleLineFinish_()
			arg_187_1.onSingleLineUpdate_ = nil
			arg_187_1.onSingleLineFinish_ = nil
			arg_187_1.state_ = "waiting"
		end

		function arg_187_1.playNext_(arg_189_0)
			if arg_189_0 == 1 then
				arg_187_0:Play110021045(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = 0
			local var_190_1 = 0.925

			if var_190_0 < arg_187_1.time_ and arg_187_1.time_ <= var_190_0 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_2 = arg_187_1:FormatText(StoryNameCfg[7].name)

				arg_187_1.leftNameTxt_.text = var_190_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_3 = arg_187_1:GetWordFromCfg(110021044)
				local var_190_4 = arg_187_1:FormatText(var_190_3.content)

				arg_187_1.text_.text = var_190_4

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_5 = 37
				local var_190_6 = utf8.len(var_190_4)
				local var_190_7 = var_190_5 <= 0 and var_190_1 or var_190_1 * (var_190_6 / var_190_5)

				if var_190_7 > 0 and var_190_1 < var_190_7 then
					arg_187_1.talkMaxDuration = var_190_7

					if var_190_7 + var_190_0 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_7 + var_190_0
					end
				end

				arg_187_1.text_.text = var_190_4
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)
				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_8 = math.max(var_190_1, arg_187_1.talkMaxDuration)

			if var_190_0 <= arg_187_1.time_ and arg_187_1.time_ < var_190_0 + var_190_8 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_0) / var_190_8

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_0 + var_190_8 and arg_187_1.time_ < var_190_0 + var_190_8 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play110021045 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 110021045
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play110021046(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0
			local var_194_1 = 1.1

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_2 = arg_191_1:GetWordFromCfg(110021045)
				local var_194_3 = arg_191_1:FormatText(var_194_2.content)

				arg_191_1.text_.text = var_194_3

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_4 = 44
				local var_194_5 = utf8.len(var_194_3)
				local var_194_6 = var_194_4 <= 0 and var_194_1 or var_194_1 * (var_194_5 / var_194_4)

				if var_194_6 > 0 and var_194_1 < var_194_6 then
					arg_191_1.talkMaxDuration = var_194_6

					if var_194_6 + var_194_0 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_6 + var_194_0
					end
				end

				arg_191_1.text_.text = var_194_3
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_7 = math.max(var_194_1, arg_191_1.talkMaxDuration)

			if var_194_0 <= arg_191_1.time_ and arg_191_1.time_ < var_194_0 + var_194_7 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_0) / var_194_7

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_0 + var_194_7 and arg_191_1.time_ < var_194_0 + var_194_7 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play110021046 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 110021046
		arg_195_1.duration_ = 5.541

		local var_195_0 = {
			ja = 5.541,
			ko = 4.941,
			zh = 5.041,
			en = 5.408
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
				arg_195_0:Play110021047(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 1.5

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				local var_198_1 = manager.ui.mainCamera.transform.localPosition
				local var_198_2 = Vector3.New(0, 0, 10) + Vector3.New(var_198_1.x, var_198_1.y, 0)
				local var_198_3 = arg_195_1.bgs_.ST18

				var_198_3.transform.localPosition = var_198_2
				var_198_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_198_4 = var_198_3:GetComponent("SpriteRenderer")

				if var_198_4 and var_198_4.sprite then
					local var_198_5 = (var_198_3.transform.localPosition - var_198_1).z
					local var_198_6 = manager.ui.mainCameraCom_
					local var_198_7 = 2 * var_198_5 * Mathf.Tan(var_198_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_198_8 = var_198_7 * var_198_6.aspect
					local var_198_9 = var_198_4.sprite.bounds.size.x
					local var_198_10 = var_198_4.sprite.bounds.size.y
					local var_198_11 = var_198_8 / var_198_9
					local var_198_12 = var_198_7 / var_198_10
					local var_198_13 = var_198_12 < var_198_11 and var_198_11 or var_198_12

					var_198_3.transform.localScale = Vector3.New(var_198_13, var_198_13, 0)
				end

				for iter_198_0, iter_198_1 in pairs(arg_195_1.bgs_) do
					if iter_198_0 ~= "ST18" then
						iter_198_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_198_14 = arg_195_1.bgs_.OS0101
			local var_198_15 = 0

			if var_198_15 < arg_195_1.time_ and arg_195_1.time_ <= var_198_15 + arg_198_0 then
				local var_198_16 = var_198_14:GetComponent("SpriteRenderer")

				if var_198_16 then
					var_198_16.material = arg_195_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_198_17 = var_198_16.material
					local var_198_18 = var_198_17:GetColor("_Color")

					arg_195_1.var_.alphaOldValueOS0101 = var_198_18.a
					arg_195_1.var_.alphaMatValueOS0101 = var_198_17
				end

				arg_195_1.var_.alphaOldValueOS0101 = 1
			end

			local var_198_19 = 1.5

			if var_198_15 <= arg_195_1.time_ and arg_195_1.time_ < var_198_15 + var_198_19 then
				local var_198_20 = (arg_195_1.time_ - var_198_15) / var_198_19
				local var_198_21 = Mathf.Lerp(arg_195_1.var_.alphaOldValueOS0101, 0, var_198_20)

				if arg_195_1.var_.alphaMatValueOS0101 then
					local var_198_22 = arg_195_1.var_.alphaMatValueOS0101
					local var_198_23 = var_198_22:GetColor("_Color")

					var_198_23.a = var_198_21

					var_198_22:SetColor("_Color", var_198_23)
				end
			end

			if arg_195_1.time_ >= var_198_15 + var_198_19 and arg_195_1.time_ < var_198_15 + var_198_19 + arg_198_0 and arg_195_1.var_.alphaMatValueOS0101 then
				local var_198_24 = arg_195_1.var_.alphaMatValueOS0101
				local var_198_25 = var_198_24:GetColor("_Color")

				var_198_25.a = 0

				var_198_24:SetColor("_Color", var_198_25)
			end

			local var_198_26 = arg_195_1.bgs_.ST18
			local var_198_27 = 1.5

			if var_198_27 < arg_195_1.time_ and arg_195_1.time_ <= var_198_27 + arg_198_0 then
				local var_198_28 = var_198_26:GetComponent("SpriteRenderer")

				if var_198_28 then
					var_198_28.material = arg_195_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_198_29 = var_198_28.material
					local var_198_30 = var_198_29:GetColor("_Color")

					arg_195_1.var_.alphaOldValueST18 = var_198_30.a
					arg_195_1.var_.alphaMatValueST18 = var_198_29
				end

				arg_195_1.var_.alphaOldValueST18 = 0
			end

			local var_198_31 = 1.5

			if var_198_27 <= arg_195_1.time_ and arg_195_1.time_ < var_198_27 + var_198_31 then
				local var_198_32 = (arg_195_1.time_ - var_198_27) / var_198_31
				local var_198_33 = Mathf.Lerp(arg_195_1.var_.alphaOldValueST18, 1, var_198_32)

				if arg_195_1.var_.alphaMatValueST18 then
					local var_198_34 = arg_195_1.var_.alphaMatValueST18
					local var_198_35 = var_198_34:GetColor("_Color")

					var_198_35.a = var_198_33

					var_198_34:SetColor("_Color", var_198_35)
				end
			end

			if arg_195_1.time_ >= var_198_27 + var_198_31 and arg_195_1.time_ < var_198_27 + var_198_31 + arg_198_0 and arg_195_1.var_.alphaMatValueST18 then
				local var_198_36 = arg_195_1.var_.alphaMatValueST18
				local var_198_37 = var_198_36:GetColor("_Color")

				var_198_37.a = 1

				var_198_36:SetColor("_Color", var_198_37)
			end

			local var_198_38 = arg_195_1.actors_["1111ui_story"].transform
			local var_198_39 = 2.4

			if var_198_39 < arg_195_1.time_ and arg_195_1.time_ <= var_198_39 + arg_198_0 then
				arg_195_1.var_.moveOldPos1111ui_story = var_198_38.localPosition
			end

			local var_198_40 = 0.001

			if var_198_39 <= arg_195_1.time_ and arg_195_1.time_ < var_198_39 + var_198_40 then
				local var_198_41 = (arg_195_1.time_ - var_198_39) / var_198_40
				local var_198_42 = Vector3.New(0, -0.83, -6)

				var_198_38.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos1111ui_story, var_198_42, var_198_41)

				local var_198_43 = manager.ui.mainCamera.transform.position - var_198_38.position

				var_198_38.forward = Vector3.New(var_198_43.x, var_198_43.y, var_198_43.z)

				local var_198_44 = var_198_38.localEulerAngles

				var_198_44.z = 0
				var_198_44.x = 0
				var_198_38.localEulerAngles = var_198_44
			end

			if arg_195_1.time_ >= var_198_39 + var_198_40 and arg_195_1.time_ < var_198_39 + var_198_40 + arg_198_0 then
				var_198_38.localPosition = Vector3.New(0, -0.83, -6)

				local var_198_45 = manager.ui.mainCamera.transform.position - var_198_38.position

				var_198_38.forward = Vector3.New(var_198_45.x, var_198_45.y, var_198_45.z)

				local var_198_46 = var_198_38.localEulerAngles

				var_198_46.z = 0
				var_198_46.x = 0
				var_198_38.localEulerAngles = var_198_46
			end

			local var_198_47 = 2.4

			if var_198_47 < arg_195_1.time_ and arg_195_1.time_ <= var_198_47 + arg_198_0 then
				arg_195_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action5_1")
			end

			local var_198_48 = 2.4

			if var_198_48 < arg_195_1.time_ and arg_195_1.time_ <= var_198_48 + arg_198_0 then
				arg_195_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_198_49 = arg_195_1.actors_["1111ui_story"]
			local var_198_50 = 2.4

			if var_198_50 < arg_195_1.time_ and arg_195_1.time_ <= var_198_50 + arg_198_0 and arg_195_1.var_.characterEffect1111ui_story == nil then
				arg_195_1.var_.characterEffect1111ui_story = var_198_49:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_51 = 0.2

			if var_198_50 <= arg_195_1.time_ and arg_195_1.time_ < var_198_50 + var_198_51 then
				local var_198_52 = (arg_195_1.time_ - var_198_50) / var_198_51

				if arg_195_1.var_.characterEffect1111ui_story then
					arg_195_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_50 + var_198_51 and arg_195_1.time_ < var_198_50 + var_198_51 + arg_198_0 and arg_195_1.var_.characterEffect1111ui_story then
				arg_195_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			if arg_195_1.frameCnt_ <= 1 then
				arg_195_1.dialog_:SetActive(false)
			end

			local var_198_53 = 2.675
			local var_198_54 = 0.325

			if var_198_53 < arg_195_1.time_ and arg_195_1.time_ <= var_198_53 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0

				arg_195_1.dialog_:SetActive(true)

				local var_198_55 = LeanTween.value(arg_195_1.dialog_, 0, 1, 0.3)

				var_198_55:setOnUpdate(LuaHelper.FloatAction(function(arg_199_0)
					arg_195_1.dialogCg_.alpha = arg_199_0
				end))
				var_198_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_195_1.dialog_)
					var_198_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_195_1.duration_ = arg_195_1.duration_ + 0.3

				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_56 = arg_195_1:FormatText(StoryNameCfg[67].name)

				arg_195_1.leftNameTxt_.text = var_198_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_57 = arg_195_1:GetWordFromCfg(110021046)
				local var_198_58 = arg_195_1:FormatText(var_198_57.content)

				arg_195_1.text_.text = var_198_58

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_59 = 13
				local var_198_60 = utf8.len(var_198_58)
				local var_198_61 = var_198_59 <= 0 and var_198_54 or var_198_54 * (var_198_60 / var_198_59)

				if var_198_61 > 0 and var_198_54 < var_198_61 then
					arg_195_1.talkMaxDuration = var_198_61
					var_198_53 = var_198_53 + 0.3

					if var_198_61 + var_198_53 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_61 + var_198_53
					end
				end

				arg_195_1.text_.text = var_198_58
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021046", "story_v_out_110021.awb") ~= 0 then
					local var_198_62 = manager.audio:GetVoiceLength("story_v_out_110021", "110021046", "story_v_out_110021.awb") / 1000

					if var_198_62 + var_198_53 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_62 + var_198_53
					end

					if var_198_57.prefab_name ~= "" and arg_195_1.actors_[var_198_57.prefab_name] ~= nil then
						local var_198_63 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_57.prefab_name].transform, "story_v_out_110021", "110021046", "story_v_out_110021.awb")

						arg_195_1:RecordAudio("110021046", var_198_63)
						arg_195_1:RecordAudio("110021046", var_198_63)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_110021", "110021046", "story_v_out_110021.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_110021", "110021046", "story_v_out_110021.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_64 = var_198_53 + 0.3
			local var_198_65 = math.max(var_198_54, arg_195_1.talkMaxDuration)

			if var_198_64 <= arg_195_1.time_ and arg_195_1.time_ < var_198_64 + var_198_65 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_64) / var_198_65

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_64 + var_198_65 and arg_195_1.time_ < var_198_64 + var_198_65 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play110021047 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 110021047
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play110021048(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1111ui_story"]
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 and arg_201_1.var_.characterEffect1111ui_story == nil then
				arg_201_1.var_.characterEffect1111ui_story = var_204_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_2 = 0.2

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2

				if arg_201_1.var_.characterEffect1111ui_story then
					local var_204_4 = Mathf.Lerp(0, 0.5, var_204_3)

					arg_201_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_201_1.var_.characterEffect1111ui_story.fillRatio = var_204_4
				end
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 and arg_201_1.var_.characterEffect1111ui_story then
				local var_204_5 = 0.5

				arg_201_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_201_1.var_.characterEffect1111ui_story.fillRatio = var_204_5
			end

			local var_204_6 = 0
			local var_204_7 = 0.875

			if var_204_6 < arg_201_1.time_ and arg_201_1.time_ <= var_204_6 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_8 = arg_201_1:FormatText(StoryNameCfg[7].name)

				arg_201_1.leftNameTxt_.text = var_204_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_9 = arg_201_1:GetWordFromCfg(110021047)
				local var_204_10 = arg_201_1:FormatText(var_204_9.content)

				arg_201_1.text_.text = var_204_10

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_11 = 34
				local var_204_12 = utf8.len(var_204_10)
				local var_204_13 = var_204_11 <= 0 and var_204_7 or var_204_7 * (var_204_12 / var_204_11)

				if var_204_13 > 0 and var_204_7 < var_204_13 then
					arg_201_1.talkMaxDuration = var_204_13

					if var_204_13 + var_204_6 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_13 + var_204_6
					end
				end

				arg_201_1.text_.text = var_204_10
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_14 = math.max(var_204_7, arg_201_1.talkMaxDuration)

			if var_204_6 <= arg_201_1.time_ and arg_201_1.time_ < var_204_6 + var_204_14 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_6) / var_204_14

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_6 + var_204_14 and arg_201_1.time_ < var_204_6 + var_204_14 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play110021048 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 110021048
		arg_205_1.duration_ = 5.533

		local var_205_0 = {
			ja = 1.999999999999,
			ko = 5.333,
			zh = 5.266,
			en = 5.533
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
				arg_205_0:Play110021049(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1111ui_story"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos1111ui_story = var_208_0.localPosition
			end

			local var_208_2 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2
				local var_208_4 = Vector3.New(0, -0.83, -6)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1111ui_story, var_208_4, var_208_3)

				local var_208_5 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_5.x, var_208_5.y, var_208_5.z)

				local var_208_6 = var_208_0.localEulerAngles

				var_208_6.z = 0
				var_208_6.x = 0
				var_208_0.localEulerAngles = var_208_6
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(0, -0.83, -6)

				local var_208_7 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_7.x, var_208_7.y, var_208_7.z)

				local var_208_8 = var_208_0.localEulerAngles

				var_208_8.z = 0
				var_208_8.x = 0
				var_208_0.localEulerAngles = var_208_8
			end

			local var_208_9 = 0

			if var_208_9 < arg_205_1.time_ and arg_205_1.time_ <= var_208_9 + arg_208_0 then
				arg_205_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action454")
			end

			local var_208_10 = 0

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 then
				arg_205_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_208_11 = arg_205_1.actors_["1111ui_story"]
			local var_208_12 = 0

			if var_208_12 < arg_205_1.time_ and arg_205_1.time_ <= var_208_12 + arg_208_0 and arg_205_1.var_.characterEffect1111ui_story == nil then
				arg_205_1.var_.characterEffect1111ui_story = var_208_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_13 = 0.2

			if var_208_12 <= arg_205_1.time_ and arg_205_1.time_ < var_208_12 + var_208_13 then
				local var_208_14 = (arg_205_1.time_ - var_208_12) / var_208_13

				if arg_205_1.var_.characterEffect1111ui_story then
					arg_205_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_12 + var_208_13 and arg_205_1.time_ < var_208_12 + var_208_13 + arg_208_0 and arg_205_1.var_.characterEffect1111ui_story then
				arg_205_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_208_15 = 0
			local var_208_16 = 0.65

			if var_208_15 < arg_205_1.time_ and arg_205_1.time_ <= var_208_15 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_17 = arg_205_1:FormatText(StoryNameCfg[67].name)

				arg_205_1.leftNameTxt_.text = var_208_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_18 = arg_205_1:GetWordFromCfg(110021048)
				local var_208_19 = arg_205_1:FormatText(var_208_18.content)

				arg_205_1.text_.text = var_208_19

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_20 = 23
				local var_208_21 = utf8.len(var_208_19)
				local var_208_22 = var_208_20 <= 0 and var_208_16 or var_208_16 * (var_208_21 / var_208_20)

				if var_208_22 > 0 and var_208_16 < var_208_22 then
					arg_205_1.talkMaxDuration = var_208_22

					if var_208_22 + var_208_15 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_22 + var_208_15
					end
				end

				arg_205_1.text_.text = var_208_19
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021048", "story_v_out_110021.awb") ~= 0 then
					local var_208_23 = manager.audio:GetVoiceLength("story_v_out_110021", "110021048", "story_v_out_110021.awb") / 1000

					if var_208_23 + var_208_15 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_23 + var_208_15
					end

					if var_208_18.prefab_name ~= "" and arg_205_1.actors_[var_208_18.prefab_name] ~= nil then
						local var_208_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_18.prefab_name].transform, "story_v_out_110021", "110021048", "story_v_out_110021.awb")

						arg_205_1:RecordAudio("110021048", var_208_24)
						arg_205_1:RecordAudio("110021048", var_208_24)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_110021", "110021048", "story_v_out_110021.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_110021", "110021048", "story_v_out_110021.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_25 = math.max(var_208_16, arg_205_1.talkMaxDuration)

			if var_208_15 <= arg_205_1.time_ and arg_205_1.time_ < var_208_15 + var_208_25 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_15) / var_208_25

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_15 + var_208_25 and arg_205_1.time_ < var_208_15 + var_208_25 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play110021049 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 110021049
		arg_209_1.duration_ = 8.4

		local var_209_0 = {
			ja = 8.4,
			ko = 4.533,
			zh = 4.933,
			en = 2.7
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
				arg_209_0:Play110021050(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = 0

			if var_212_0 < arg_209_1.time_ and arg_209_1.time_ <= var_212_0 + arg_212_0 then
				arg_209_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_212_1 = 0
			local var_212_2 = 0.475

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_3 = arg_209_1:FormatText(StoryNameCfg[67].name)

				arg_209_1.leftNameTxt_.text = var_212_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_4 = arg_209_1:GetWordFromCfg(110021049)
				local var_212_5 = arg_209_1:FormatText(var_212_4.content)

				arg_209_1.text_.text = var_212_5

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_6 = 18
				local var_212_7 = utf8.len(var_212_5)
				local var_212_8 = var_212_6 <= 0 and var_212_2 or var_212_2 * (var_212_7 / var_212_6)

				if var_212_8 > 0 and var_212_2 < var_212_8 then
					arg_209_1.talkMaxDuration = var_212_8

					if var_212_8 + var_212_1 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_8 + var_212_1
					end
				end

				arg_209_1.text_.text = var_212_5
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021049", "story_v_out_110021.awb") ~= 0 then
					local var_212_9 = manager.audio:GetVoiceLength("story_v_out_110021", "110021049", "story_v_out_110021.awb") / 1000

					if var_212_9 + var_212_1 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_9 + var_212_1
					end

					if var_212_4.prefab_name ~= "" and arg_209_1.actors_[var_212_4.prefab_name] ~= nil then
						local var_212_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_4.prefab_name].transform, "story_v_out_110021", "110021049", "story_v_out_110021.awb")

						arg_209_1:RecordAudio("110021049", var_212_10)
						arg_209_1:RecordAudio("110021049", var_212_10)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_110021", "110021049", "story_v_out_110021.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_110021", "110021049", "story_v_out_110021.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_11 = math.max(var_212_2, arg_209_1.talkMaxDuration)

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_11 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_1) / var_212_11

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_1 + var_212_11 and arg_209_1.time_ < var_212_1 + var_212_11 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play110021050 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 110021050
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play110021051(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1111ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1111ui_story == nil then
				arg_213_1.var_.characterEffect1111ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.2

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1111ui_story then
					local var_216_4 = Mathf.Lerp(0, 0.5, var_216_3)

					arg_213_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1111ui_story.fillRatio = var_216_4
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1111ui_story then
				local var_216_5 = 0.5

				arg_213_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1111ui_story.fillRatio = var_216_5
			end

			local var_216_6 = 0
			local var_216_7 = 0.65

			if var_216_6 < arg_213_1.time_ and arg_213_1.time_ <= var_216_6 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_8 = arg_213_1:FormatText(StoryNameCfg[7].name)

				arg_213_1.leftNameTxt_.text = var_216_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_9 = arg_213_1:GetWordFromCfg(110021050)
				local var_216_10 = arg_213_1:FormatText(var_216_9.content)

				arg_213_1.text_.text = var_216_10

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_11 = 26
				local var_216_12 = utf8.len(var_216_10)
				local var_216_13 = var_216_11 <= 0 and var_216_7 or var_216_7 * (var_216_12 / var_216_11)

				if var_216_13 > 0 and var_216_7 < var_216_13 then
					arg_213_1.talkMaxDuration = var_216_13

					if var_216_13 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_13 + var_216_6
					end
				end

				arg_213_1.text_.text = var_216_10
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_14 = math.max(var_216_7, arg_213_1.talkMaxDuration)

			if var_216_6 <= arg_213_1.time_ and arg_213_1.time_ < var_216_6 + var_216_14 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_6) / var_216_14

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_6 + var_216_14 and arg_213_1.time_ < var_216_6 + var_216_14 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play110021051 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 110021051
		arg_217_1.duration_ = 13

		local var_217_0 = {
			ja = 13,
			ko = 3.766,
			zh = 4,
			en = 4.6
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
				arg_217_0:Play110021052(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_220_1 = arg_217_1.actors_["1111ui_story"]
			local var_220_2 = 0

			if var_220_2 < arg_217_1.time_ and arg_217_1.time_ <= var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect1111ui_story == nil then
				arg_217_1.var_.characterEffect1111ui_story = var_220_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_3 = 0.2

			if var_220_2 <= arg_217_1.time_ and arg_217_1.time_ < var_220_2 + var_220_3 then
				local var_220_4 = (arg_217_1.time_ - var_220_2) / var_220_3

				if arg_217_1.var_.characterEffect1111ui_story then
					arg_217_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_2 + var_220_3 and arg_217_1.time_ < var_220_2 + var_220_3 + arg_220_0 and arg_217_1.var_.characterEffect1111ui_story then
				arg_217_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_220_5 = 0

			if var_220_5 < arg_217_1.time_ and arg_217_1.time_ <= var_220_5 + arg_220_0 then
				arg_217_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action442")
			end

			local var_220_6 = 0
			local var_220_7 = 0.475

			if var_220_6 < arg_217_1.time_ and arg_217_1.time_ <= var_220_6 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_8 = arg_217_1:FormatText(StoryNameCfg[67].name)

				arg_217_1.leftNameTxt_.text = var_220_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_9 = arg_217_1:GetWordFromCfg(110021051)
				local var_220_10 = arg_217_1:FormatText(var_220_9.content)

				arg_217_1.text_.text = var_220_10

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_11 = 19
				local var_220_12 = utf8.len(var_220_10)
				local var_220_13 = var_220_11 <= 0 and var_220_7 or var_220_7 * (var_220_12 / var_220_11)

				if var_220_13 > 0 and var_220_7 < var_220_13 then
					arg_217_1.talkMaxDuration = var_220_13

					if var_220_13 + var_220_6 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_13 + var_220_6
					end
				end

				arg_217_1.text_.text = var_220_10
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021051", "story_v_out_110021.awb") ~= 0 then
					local var_220_14 = manager.audio:GetVoiceLength("story_v_out_110021", "110021051", "story_v_out_110021.awb") / 1000

					if var_220_14 + var_220_6 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_14 + var_220_6
					end

					if var_220_9.prefab_name ~= "" and arg_217_1.actors_[var_220_9.prefab_name] ~= nil then
						local var_220_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_9.prefab_name].transform, "story_v_out_110021", "110021051", "story_v_out_110021.awb")

						arg_217_1:RecordAudio("110021051", var_220_15)
						arg_217_1:RecordAudio("110021051", var_220_15)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_110021", "110021051", "story_v_out_110021.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_110021", "110021051", "story_v_out_110021.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_16 = math.max(var_220_7, arg_217_1.talkMaxDuration)

			if var_220_6 <= arg_217_1.time_ and arg_217_1.time_ < var_220_6 + var_220_16 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_6) / var_220_16

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_6 + var_220_16 and arg_217_1.time_ < var_220_6 + var_220_16 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play110021052 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 110021052
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play110021053(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = manager.ui.mainCamera.transform
			local var_224_1 = 0.533333333333333

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.shakeOldPos = var_224_0.localPosition
			end

			local var_224_2 = 0.6

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / 0.066
				local var_224_4, var_224_5 = math.modf(var_224_3)

				var_224_0.localPosition = Vector3.New(var_224_5 * 0.13, var_224_5 * 0.13, var_224_5 * 0.13) + arg_221_1.var_.shakeOldPos
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = arg_221_1.var_.shakeOldPos
			end

			local var_224_6 = arg_221_1.actors_["1111ui_story"].transform
			local var_224_7 = 0

			if var_224_7 < arg_221_1.time_ and arg_221_1.time_ <= var_224_7 + arg_224_0 then
				arg_221_1.var_.moveOldPos1111ui_story = var_224_6.localPosition
			end

			local var_224_8 = 0.001

			if var_224_7 <= arg_221_1.time_ and arg_221_1.time_ < var_224_7 + var_224_8 then
				local var_224_9 = (arg_221_1.time_ - var_224_7) / var_224_8
				local var_224_10 = Vector3.New(0, 100, 0)

				var_224_6.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1111ui_story, var_224_10, var_224_9)

				local var_224_11 = manager.ui.mainCamera.transform.position - var_224_6.position

				var_224_6.forward = Vector3.New(var_224_11.x, var_224_11.y, var_224_11.z)

				local var_224_12 = var_224_6.localEulerAngles

				var_224_12.z = 0
				var_224_12.x = 0
				var_224_6.localEulerAngles = var_224_12
			end

			if arg_221_1.time_ >= var_224_7 + var_224_8 and arg_221_1.time_ < var_224_7 + var_224_8 + arg_224_0 then
				var_224_6.localPosition = Vector3.New(0, 100, 0)

				local var_224_13 = manager.ui.mainCamera.transform.position - var_224_6.position

				var_224_6.forward = Vector3.New(var_224_13.x, var_224_13.y, var_224_13.z)

				local var_224_14 = var_224_6.localEulerAngles

				var_224_14.z = 0
				var_224_14.x = 0
				var_224_6.localEulerAngles = var_224_14
			end

			local var_224_15 = 0
			local var_224_16 = 1

			if var_224_15 < arg_221_1.time_ and arg_221_1.time_ <= var_224_15 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, false)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_17 = arg_221_1:GetWordFromCfg(110021052)
				local var_224_18 = arg_221_1:FormatText(var_224_17.content)

				arg_221_1.text_.text = var_224_18

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_19 = 40
				local var_224_20 = utf8.len(var_224_18)
				local var_224_21 = var_224_19 <= 0 and var_224_16 or var_224_16 * (var_224_20 / var_224_19)

				if var_224_21 > 0 and var_224_16 < var_224_21 then
					arg_221_1.talkMaxDuration = var_224_21

					if var_224_21 + var_224_15 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_21 + var_224_15
					end
				end

				arg_221_1.text_.text = var_224_18
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_22 = math.max(var_224_16, arg_221_1.talkMaxDuration)

			if var_224_15 <= arg_221_1.time_ and arg_221_1.time_ < var_224_15 + var_224_22 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_15) / var_224_22

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_15 + var_224_22 and arg_221_1.time_ < var_224_15 + var_224_22 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play110021053 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 110021053
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
		end

		function arg_225_1.playNext_(arg_227_0)
			if arg_227_0 == 1 then
				arg_225_0:Play110021054(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = 0
			local var_228_1 = 1.55

			if var_228_0 < arg_225_1.time_ and arg_225_1.time_ <= var_228_0 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_2 = arg_225_1:GetWordFromCfg(110021053)
				local var_228_3 = arg_225_1:FormatText(var_228_2.content)

				arg_225_1.text_.text = var_228_3

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_4 = 62
				local var_228_5 = utf8.len(var_228_3)
				local var_228_6 = var_228_4 <= 0 and var_228_1 or var_228_1 * (var_228_5 / var_228_4)

				if var_228_6 > 0 and var_228_1 < var_228_6 then
					arg_225_1.talkMaxDuration = var_228_6

					if var_228_6 + var_228_0 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_6 + var_228_0
					end
				end

				arg_225_1.text_.text = var_228_3
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_7 = math.max(var_228_1, arg_225_1.talkMaxDuration)

			if var_228_0 <= arg_225_1.time_ and arg_225_1.time_ < var_228_0 + var_228_7 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_0) / var_228_7

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_0 + var_228_7 and arg_225_1.time_ < var_228_0 + var_228_7 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play110021054 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 110021054
		arg_229_1.duration_ = 6.566

		local var_229_0 = {
			ja = 2.866,
			ko = 6.566,
			zh = 5.4,
			en = 5.666
		}
		local var_229_1 = manager.audio:GetLocalizationFlag()

		if var_229_0[var_229_1] ~= nil then
			arg_229_1.duration_ = var_229_0[var_229_1]
		end

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play110021055(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = 0

			if var_232_0 < arg_229_1.time_ and arg_229_1.time_ <= var_232_0 + arg_232_0 then
				arg_229_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_232_1 = arg_229_1.actors_["1111ui_story"]
			local var_232_2 = 0

			if var_232_2 < arg_229_1.time_ and arg_229_1.time_ <= var_232_2 + arg_232_0 and arg_229_1.var_.characterEffect1111ui_story == nil then
				arg_229_1.var_.characterEffect1111ui_story = var_232_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_3 = 0.2

			if var_232_2 <= arg_229_1.time_ and arg_229_1.time_ < var_232_2 + var_232_3 then
				local var_232_4 = (arg_229_1.time_ - var_232_2) / var_232_3

				if arg_229_1.var_.characterEffect1111ui_story then
					arg_229_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_229_1.time_ >= var_232_2 + var_232_3 and arg_229_1.time_ < var_232_2 + var_232_3 + arg_232_0 and arg_229_1.var_.characterEffect1111ui_story then
				arg_229_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_232_5 = 0

			if var_232_5 < arg_229_1.time_ and arg_229_1.time_ <= var_232_5 + arg_232_0 then
				arg_229_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action5_1")
			end

			local var_232_6 = arg_229_1.actors_["1111ui_story"].transform
			local var_232_7 = 0

			if var_232_7 < arg_229_1.time_ and arg_229_1.time_ <= var_232_7 + arg_232_0 then
				arg_229_1.var_.moveOldPos1111ui_story = var_232_6.localPosition
			end

			local var_232_8 = 0.001

			if var_232_7 <= arg_229_1.time_ and arg_229_1.time_ < var_232_7 + var_232_8 then
				local var_232_9 = (arg_229_1.time_ - var_232_7) / var_232_8
				local var_232_10 = Vector3.New(0, -0.83, -6)

				var_232_6.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1111ui_story, var_232_10, var_232_9)

				local var_232_11 = manager.ui.mainCamera.transform.position - var_232_6.position

				var_232_6.forward = Vector3.New(var_232_11.x, var_232_11.y, var_232_11.z)

				local var_232_12 = var_232_6.localEulerAngles

				var_232_12.z = 0
				var_232_12.x = 0
				var_232_6.localEulerAngles = var_232_12
			end

			if arg_229_1.time_ >= var_232_7 + var_232_8 and arg_229_1.time_ < var_232_7 + var_232_8 + arg_232_0 then
				var_232_6.localPosition = Vector3.New(0, -0.83, -6)

				local var_232_13 = manager.ui.mainCamera.transform.position - var_232_6.position

				var_232_6.forward = Vector3.New(var_232_13.x, var_232_13.y, var_232_13.z)

				local var_232_14 = var_232_6.localEulerAngles

				var_232_14.z = 0
				var_232_14.x = 0
				var_232_6.localEulerAngles = var_232_14
			end

			local var_232_15 = 0
			local var_232_16 = 0.675

			if var_232_15 < arg_229_1.time_ and arg_229_1.time_ <= var_232_15 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_17 = arg_229_1:FormatText(StoryNameCfg[67].name)

				arg_229_1.leftNameTxt_.text = var_232_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_18 = arg_229_1:GetWordFromCfg(110021054)
				local var_232_19 = arg_229_1:FormatText(var_232_18.content)

				arg_229_1.text_.text = var_232_19

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_20 = 27
				local var_232_21 = utf8.len(var_232_19)
				local var_232_22 = var_232_20 <= 0 and var_232_16 or var_232_16 * (var_232_21 / var_232_20)

				if var_232_22 > 0 and var_232_16 < var_232_22 then
					arg_229_1.talkMaxDuration = var_232_22

					if var_232_22 + var_232_15 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_22 + var_232_15
					end
				end

				arg_229_1.text_.text = var_232_19
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021054", "story_v_out_110021.awb") ~= 0 then
					local var_232_23 = manager.audio:GetVoiceLength("story_v_out_110021", "110021054", "story_v_out_110021.awb") / 1000

					if var_232_23 + var_232_15 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_23 + var_232_15
					end

					if var_232_18.prefab_name ~= "" and arg_229_1.actors_[var_232_18.prefab_name] ~= nil then
						local var_232_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_18.prefab_name].transform, "story_v_out_110021", "110021054", "story_v_out_110021.awb")

						arg_229_1:RecordAudio("110021054", var_232_24)
						arg_229_1:RecordAudio("110021054", var_232_24)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_110021", "110021054", "story_v_out_110021.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_110021", "110021054", "story_v_out_110021.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_25 = math.max(var_232_16, arg_229_1.talkMaxDuration)

			if var_232_15 <= arg_229_1.time_ and arg_229_1.time_ < var_232_15 + var_232_25 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_15) / var_232_25

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_15 + var_232_25 and arg_229_1.time_ < var_232_15 + var_232_25 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play110021055 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 110021055
		arg_233_1.duration_ = 11.433

		local var_233_0 = {
			ja = 5.8,
			ko = 11.433,
			zh = 8.666,
			en = 8.4
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
				arg_233_0:Play110021056(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = 0

			if var_236_0 < arg_233_1.time_ and arg_233_1.time_ <= var_236_0 + arg_236_0 then
				arg_233_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_236_1 = 0
			local var_236_2 = 0.95

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_3 = arg_233_1:FormatText(StoryNameCfg[67].name)

				arg_233_1.leftNameTxt_.text = var_236_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_4 = arg_233_1:GetWordFromCfg(110021055)
				local var_236_5 = arg_233_1:FormatText(var_236_4.content)

				arg_233_1.text_.text = var_236_5

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_6 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021055", "story_v_out_110021.awb") ~= 0 then
					local var_236_9 = manager.audio:GetVoiceLength("story_v_out_110021", "110021055", "story_v_out_110021.awb") / 1000

					if var_236_9 + var_236_1 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_9 + var_236_1
					end

					if var_236_4.prefab_name ~= "" and arg_233_1.actors_[var_236_4.prefab_name] ~= nil then
						local var_236_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_4.prefab_name].transform, "story_v_out_110021", "110021055", "story_v_out_110021.awb")

						arg_233_1:RecordAudio("110021055", var_236_10)
						arg_233_1:RecordAudio("110021055", var_236_10)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_110021", "110021055", "story_v_out_110021.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_110021", "110021055", "story_v_out_110021.awb")
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
	Play110021056 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 110021056
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play110021057(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1111ui_story"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.characterEffect1111ui_story == nil then
				arg_237_1.var_.characterEffect1111ui_story = var_240_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.characterEffect1111ui_story then
					local var_240_4 = Mathf.Lerp(0, 0.5, var_240_3)

					arg_237_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1111ui_story.fillRatio = var_240_4
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.characterEffect1111ui_story then
				local var_240_5 = 0.5

				arg_237_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1111ui_story.fillRatio = var_240_5
			end

			local var_240_6 = 0
			local var_240_7 = 0.8

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_8 = arg_237_1:FormatText(StoryNameCfg[7].name)

				arg_237_1.leftNameTxt_.text = var_240_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_9 = arg_237_1:GetWordFromCfg(110021056)
				local var_240_10 = arg_237_1:FormatText(var_240_9.content)

				arg_237_1.text_.text = var_240_10

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_11 = 32
				local var_240_12 = utf8.len(var_240_10)
				local var_240_13 = var_240_11 <= 0 and var_240_7 or var_240_7 * (var_240_12 / var_240_11)

				if var_240_13 > 0 and var_240_7 < var_240_13 then
					arg_237_1.talkMaxDuration = var_240_13

					if var_240_13 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_13 + var_240_6
					end
				end

				arg_237_1.text_.text = var_240_10
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_14 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_14 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_14

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_14 and arg_237_1.time_ < var_240_6 + var_240_14 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play110021057 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 110021057
		arg_241_1.duration_ = 11.566

		local var_241_0 = {
			ja = 11.566,
			ko = 7.6,
			zh = 8.766,
			en = 10.1
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
				arg_241_0:Play110021058(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = 0

			if var_244_0 < arg_241_1.time_ and arg_241_1.time_ <= var_244_0 + arg_244_0 then
				arg_241_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_244_1 = arg_241_1.actors_["1111ui_story"]
			local var_244_2 = 0

			if var_244_2 < arg_241_1.time_ and arg_241_1.time_ <= var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect1111ui_story == nil then
				arg_241_1.var_.characterEffect1111ui_story = var_244_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_3 = 0.2

			if var_244_2 <= arg_241_1.time_ and arg_241_1.time_ < var_244_2 + var_244_3 then
				local var_244_4 = (arg_241_1.time_ - var_244_2) / var_244_3

				if arg_241_1.var_.characterEffect1111ui_story then
					arg_241_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_2 + var_244_3 and arg_241_1.time_ < var_244_2 + var_244_3 + arg_244_0 and arg_241_1.var_.characterEffect1111ui_story then
				arg_241_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_244_5 = 0

			if var_244_5 < arg_241_1.time_ and arg_241_1.time_ <= var_244_5 + arg_244_0 then
				arg_241_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action454")
			end

			local var_244_6 = 0
			local var_244_7 = 1.225

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_8 = arg_241_1:FormatText(StoryNameCfg[67].name)

				arg_241_1.leftNameTxt_.text = var_244_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_9 = arg_241_1:GetWordFromCfg(110021057)
				local var_244_10 = arg_241_1:FormatText(var_244_9.content)

				arg_241_1.text_.text = var_244_10

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_11 = 29
				local var_244_12 = utf8.len(var_244_10)
				local var_244_13 = var_244_11 <= 0 and var_244_7 or var_244_7 * (var_244_12 / var_244_11)

				if var_244_13 > 0 and var_244_7 < var_244_13 then
					arg_241_1.talkMaxDuration = var_244_13

					if var_244_13 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_13 + var_244_6
					end
				end

				arg_241_1.text_.text = var_244_10
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021057", "story_v_out_110021.awb") ~= 0 then
					local var_244_14 = manager.audio:GetVoiceLength("story_v_out_110021", "110021057", "story_v_out_110021.awb") / 1000

					if var_244_14 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_14 + var_244_6
					end

					if var_244_9.prefab_name ~= "" and arg_241_1.actors_[var_244_9.prefab_name] ~= nil then
						local var_244_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_9.prefab_name].transform, "story_v_out_110021", "110021057", "story_v_out_110021.awb")

						arg_241_1:RecordAudio("110021057", var_244_15)
						arg_241_1:RecordAudio("110021057", var_244_15)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_110021", "110021057", "story_v_out_110021.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_110021", "110021057", "story_v_out_110021.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_16 = math.max(var_244_7, arg_241_1.talkMaxDuration)

			if var_244_6 <= arg_241_1.time_ and arg_241_1.time_ < var_244_6 + var_244_16 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_6) / var_244_16

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_6 + var_244_16 and arg_241_1.time_ < var_244_6 + var_244_16 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play110021058 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 110021058
		arg_245_1.duration_ = 9.033

		local var_245_0 = {
			ja = 7.166,
			ko = 8.133,
			zh = 9.033,
			en = 8
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
				arg_245_0:Play110021059(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_248_1 = 0
			local var_248_2 = 0.925

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_3 = arg_245_1:FormatText(StoryNameCfg[67].name)

				arg_245_1.leftNameTxt_.text = var_248_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_4 = arg_245_1:GetWordFromCfg(110021058)
				local var_248_5 = arg_245_1:FormatText(var_248_4.content)

				arg_245_1.text_.text = var_248_5

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_6 = 37
				local var_248_7 = utf8.len(var_248_5)
				local var_248_8 = var_248_6 <= 0 and var_248_2 or var_248_2 * (var_248_7 / var_248_6)

				if var_248_8 > 0 and var_248_2 < var_248_8 then
					arg_245_1.talkMaxDuration = var_248_8

					if var_248_8 + var_248_1 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_8 + var_248_1
					end
				end

				arg_245_1.text_.text = var_248_5
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021058", "story_v_out_110021.awb") ~= 0 then
					local var_248_9 = manager.audio:GetVoiceLength("story_v_out_110021", "110021058", "story_v_out_110021.awb") / 1000

					if var_248_9 + var_248_1 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_9 + var_248_1
					end

					if var_248_4.prefab_name ~= "" and arg_245_1.actors_[var_248_4.prefab_name] ~= nil then
						local var_248_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_4.prefab_name].transform, "story_v_out_110021", "110021058", "story_v_out_110021.awb")

						arg_245_1:RecordAudio("110021058", var_248_10)
						arg_245_1:RecordAudio("110021058", var_248_10)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_110021", "110021058", "story_v_out_110021.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_110021", "110021058", "story_v_out_110021.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_11 = math.max(var_248_2, arg_245_1.talkMaxDuration)

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_11 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_1) / var_248_11

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_1 + var_248_11 and arg_245_1.time_ < var_248_1 + var_248_11 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play110021059 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 110021059
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play110021060(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1111ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect1111ui_story == nil then
				arg_249_1.var_.characterEffect1111ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.2

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect1111ui_story then
					local var_252_4 = Mathf.Lerp(0, 0.5, var_252_3)

					arg_249_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_249_1.var_.characterEffect1111ui_story.fillRatio = var_252_4
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1111ui_story then
				local var_252_5 = 0.5

				arg_249_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_249_1.var_.characterEffect1111ui_story.fillRatio = var_252_5
			end

			local var_252_6 = 0
			local var_252_7 = 0.1

			if var_252_6 < arg_249_1.time_ and arg_249_1.time_ <= var_252_6 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_8 = arg_249_1:FormatText(StoryNameCfg[7].name)

				arg_249_1.leftNameTxt_.text = var_252_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_9 = arg_249_1:GetWordFromCfg(110021059)
				local var_252_10 = arg_249_1:FormatText(var_252_9.content)

				arg_249_1.text_.text = var_252_10

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_11 = 4
				local var_252_12 = utf8.len(var_252_10)
				local var_252_13 = var_252_11 <= 0 and var_252_7 or var_252_7 * (var_252_12 / var_252_11)

				if var_252_13 > 0 and var_252_7 < var_252_13 then
					arg_249_1.talkMaxDuration = var_252_13

					if var_252_13 + var_252_6 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_13 + var_252_6
					end
				end

				arg_249_1.text_.text = var_252_10
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_14 = math.max(var_252_7, arg_249_1.talkMaxDuration)

			if var_252_6 <= arg_249_1.time_ and arg_249_1.time_ < var_252_6 + var_252_14 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_6) / var_252_14

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_6 + var_252_14 and arg_249_1.time_ < var_252_6 + var_252_14 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play110021060 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 110021060
		arg_253_1.duration_ = 11.1

		local var_253_0 = {
			ja = 8.8,
			ko = 11.1,
			zh = 10,
			en = 7.033
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
				arg_253_0:Play110021061(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1111ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1111ui_story == nil then
				arg_253_1.var_.characterEffect1111ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.2

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1111ui_story then
					arg_253_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1111ui_story then
				arg_253_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_256_4 = 0

			if var_256_4 < arg_253_1.time_ and arg_253_1.time_ <= var_256_4 + arg_256_0 then
				arg_253_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action446")
			end

			local var_256_5 = 0

			if var_256_5 < arg_253_1.time_ and arg_253_1.time_ <= var_256_5 + arg_256_0 then
				arg_253_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_256_6 = 0
			local var_256_7 = 1.15

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_8 = arg_253_1:FormatText(StoryNameCfg[67].name)

				arg_253_1.leftNameTxt_.text = var_256_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_9 = arg_253_1:GetWordFromCfg(110021060)
				local var_256_10 = arg_253_1:FormatText(var_256_9.content)

				arg_253_1.text_.text = var_256_10

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_11 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_110021", "110021060", "story_v_out_110021.awb") ~= 0 then
					local var_256_14 = manager.audio:GetVoiceLength("story_v_out_110021", "110021060", "story_v_out_110021.awb") / 1000

					if var_256_14 + var_256_6 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_14 + var_256_6
					end

					if var_256_9.prefab_name ~= "" and arg_253_1.actors_[var_256_9.prefab_name] ~= nil then
						local var_256_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_9.prefab_name].transform, "story_v_out_110021", "110021060", "story_v_out_110021.awb")

						arg_253_1:RecordAudio("110021060", var_256_15)
						arg_253_1:RecordAudio("110021060", var_256_15)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_110021", "110021060", "story_v_out_110021.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_110021", "110021060", "story_v_out_110021.awb")
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
	Play110021061 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 110021061
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
			arg_257_1.auto_ = false
		end

		function arg_257_1.playNext_(arg_259_0)
			arg_257_1.onStoryFinished_()
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = arg_257_1.actors_["1111ui_story"]
			local var_260_1 = 0

			if var_260_1 < arg_257_1.time_ and arg_257_1.time_ <= var_260_1 + arg_260_0 and arg_257_1.var_.characterEffect1111ui_story == nil then
				arg_257_1.var_.characterEffect1111ui_story = var_260_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_260_2 = 0.2

			if var_260_1 <= arg_257_1.time_ and arg_257_1.time_ < var_260_1 + var_260_2 then
				local var_260_3 = (arg_257_1.time_ - var_260_1) / var_260_2

				if arg_257_1.var_.characterEffect1111ui_story then
					local var_260_4 = Mathf.Lerp(0, 0.5, var_260_3)

					arg_257_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_257_1.var_.characterEffect1111ui_story.fillRatio = var_260_4
				end
			end

			if arg_257_1.time_ >= var_260_1 + var_260_2 and arg_257_1.time_ < var_260_1 + var_260_2 + arg_260_0 and arg_257_1.var_.characterEffect1111ui_story then
				local var_260_5 = 0.5

				arg_257_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_257_1.var_.characterEffect1111ui_story.fillRatio = var_260_5
			end

			local var_260_6 = 0
			local var_260_7 = 0.25

			if var_260_6 < arg_257_1.time_ and arg_257_1.time_ <= var_260_6 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_8 = arg_257_1:FormatText(StoryNameCfg[7].name)

				arg_257_1.leftNameTxt_.text = var_260_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_9 = arg_257_1:GetWordFromCfg(110021061)
				local var_260_10 = arg_257_1:FormatText(var_260_9.content)

				arg_257_1.text_.text = var_260_10

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_11 = 10
				local var_260_12 = utf8.len(var_260_10)
				local var_260_13 = var_260_11 <= 0 and var_260_7 or var_260_7 * (var_260_12 / var_260_11)

				if var_260_13 > 0 and var_260_7 < var_260_13 then
					arg_257_1.talkMaxDuration = var_260_13

					if var_260_13 + var_260_6 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_13 + var_260_6
					end
				end

				arg_257_1.text_.text = var_260_10
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_14 = math.max(var_260_7, arg_257_1.talkMaxDuration)

			if var_260_6 <= arg_257_1.time_ and arg_257_1.time_ < var_260_6 + var_260_14 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_6) / var_260_14

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_6 + var_260_14 and arg_257_1.time_ < var_260_6 + var_260_14 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST18",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B12a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OS0101"
	},
	voices = {
		"story_v_out_110021.awb"
	}
}
