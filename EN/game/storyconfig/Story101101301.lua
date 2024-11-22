return {
	Play110131001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 110131001
		arg_1_1.duration_ = 7.8

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play110131002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST19"

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
				local var_4_5 = arg_1_1.bgs_.ST19

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
					if iter_4_0 ~= "ST19" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.ST19
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				local var_4_18 = var_4_16:GetComponent("SpriteRenderer")

				if var_4_18 then
					var_4_18.material = arg_1_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_4_19 = var_4_18.material
					local var_4_20 = var_4_19:GetColor("_Color")

					arg_1_1.var_.alphaOldValueST19 = var_4_20.a
					arg_1_1.var_.alphaMatValueST19 = var_4_19
				end

				arg_1_1.var_.alphaOldValueST19 = 0
			end

			local var_4_21 = 1.5

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_21 then
				local var_4_22 = (arg_1_1.time_ - var_4_17) / var_4_21
				local var_4_23 = Mathf.Lerp(arg_1_1.var_.alphaOldValueST19, 1, var_4_22)

				if arg_1_1.var_.alphaMatValueST19 then
					local var_4_24 = arg_1_1.var_.alphaMatValueST19
					local var_4_25 = var_4_24:GetColor("_Color")

					var_4_25.a = var_4_23

					var_4_24:SetColor("_Color", var_4_25)
				end
			end

			if arg_1_1.time_ >= var_4_17 + var_4_21 and arg_1_1.time_ < var_4_17 + var_4_21 + arg_4_0 and arg_1_1.var_.alphaMatValueST19 then
				local var_4_26 = arg_1_1.var_.alphaMatValueST19
				local var_4_27 = var_4_26:GetColor("_Color")

				var_4_27.a = 1

				var_4_26:SetColor("_Color", var_4_27)
			end

			local var_4_28 = arg_1_1.bgs_.ST19.transform
			local var_4_29 = 0

			if var_4_29 < arg_1_1.time_ and arg_1_1.time_ <= var_4_29 + arg_4_0 then
				arg_1_1.var_.moveOldPosST19 = var_4_28.localPosition
			end

			local var_4_30 = 0.001

			if var_4_29 <= arg_1_1.time_ and arg_1_1.time_ < var_4_29 + var_4_30 then
				local var_4_31 = (arg_1_1.time_ - var_4_29) / var_4_30
				local var_4_32 = Vector3.New(0, 1, 9)

				var_4_28.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosST19, var_4_32, var_4_31)
			end

			if arg_1_1.time_ >= var_4_29 + var_4_30 and arg_1_1.time_ < var_4_29 + var_4_30 + arg_4_0 then
				var_4_28.localPosition = Vector3.New(0, 1, 9)
			end

			local var_4_33 = arg_1_1.bgs_.ST19.transform
			local var_4_34 = 0.0166666666666666

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				arg_1_1.var_.moveOldPosST19 = var_4_33.localPosition
			end

			local var_4_35 = 2

			if var_4_34 <= arg_1_1.time_ and arg_1_1.time_ < var_4_34 + var_4_35 then
				local var_4_36 = (arg_1_1.time_ - var_4_34) / var_4_35
				local var_4_37 = Vector3.New(-0.5, 1, 9)

				var_4_33.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosST19, var_4_37, var_4_36)
			end

			if arg_1_1.time_ >= var_4_34 + var_4_35 and arg_1_1.time_ < var_4_34 + var_4_35 + arg_4_0 then
				var_4_33.localPosition = Vector3.New(-0.5, 1, 9)
			end

			local var_4_38 = arg_1_1.bgs_.ST19.transform
			local var_4_39 = 2.01666666666667

			if var_4_39 < arg_1_1.time_ and arg_1_1.time_ <= var_4_39 + arg_4_0 then
				arg_1_1.var_.moveOldPosST19 = var_4_38.localPosition
			end

			local var_4_40 = 2

			if var_4_39 <= arg_1_1.time_ and arg_1_1.time_ < var_4_39 + var_4_40 then
				local var_4_41 = (arg_1_1.time_ - var_4_39) / var_4_40
				local var_4_42 = Vector3.New(0.5, 1, 9)

				var_4_38.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosST19, var_4_42, var_4_41)
			end

			if arg_1_1.time_ >= var_4_39 + var_4_40 and arg_1_1.time_ < var_4_39 + var_4_40 + arg_4_0 then
				var_4_38.localPosition = Vector3.New(0.5, 1, 9)
			end

			local var_4_43 = 0

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_44 = 2.8

			if arg_1_1.time_ >= var_4_43 + var_4_44 and arg_1_1.time_ < var_4_43 + var_4_44 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_45 = 0
			local var_4_46 = 0.6

			if var_4_45 < arg_1_1.time_ and arg_1_1.time_ <= var_4_45 + arg_4_0 then
				local var_4_47 = "play"
				local var_4_48 = "music"

				arg_1_1:AudioAction(var_4_47, var_4_48, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_49 = 0.738461699336767
			local var_4_50 = 1

			if var_4_49 < arg_1_1.time_ and arg_1_1.time_ <= var_4_49 + arg_4_0 then
				local var_4_51 = "play"
				local var_4_52 = "music"

				arg_1_1:AudioAction(var_4_51, var_4_52, "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_53 = 2.8
			local var_4_54 = 0.125

			if var_4_53 < arg_1_1.time_ and arg_1_1.time_ <= var_4_53 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_55 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_55:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_56 = arg_1_1:FormatText(StoryNameCfg[7].name)

				arg_1_1.leftNameTxt_.text = var_4_56

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_57 = arg_1_1:GetWordFromCfg(110131001)
				local var_4_58 = arg_1_1:FormatText(var_4_57.content)

				arg_1_1.text_.text = var_4_58

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_59 = 5
				local var_4_60 = utf8.len(var_4_58)
				local var_4_61 = var_4_59 <= 0 and var_4_54 or var_4_54 * (var_4_60 / var_4_59)

				if var_4_61 > 0 and var_4_54 < var_4_61 then
					arg_1_1.talkMaxDuration = var_4_61
					var_4_53 = var_4_53 + 0.3

					if var_4_61 + var_4_53 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_61 + var_4_53
					end
				end

				arg_1_1.text_.text = var_4_58
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_62 = var_4_53 + 0.3
			local var_4_63 = math.max(var_4_54, arg_1_1.talkMaxDuration)

			if var_4_62 <= arg_1_1.time_ and arg_1_1.time_ < var_4_62 + var_4_63 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_62) / var_4_63

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_62 + var_4_63 and arg_1_1.time_ < var_4_62 + var_4_63 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play110131002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 110131002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play110131003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = arg_7_1.bgs_.ST19.transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				arg_7_1.var_.moveOldPosST19 = var_10_0.localPosition
			end

			local var_10_2 = 1

			if var_10_1 <= arg_7_1.time_ and arg_7_1.time_ < var_10_1 + var_10_2 then
				local var_10_3 = (arg_7_1.time_ - var_10_1) / var_10_2
				local var_10_4 = Vector3.New(0, 1, 10)

				var_10_0.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPosST19, var_10_4, var_10_3)
			end

			if arg_7_1.time_ >= var_10_1 + var_10_2 and arg_7_1.time_ < var_10_1 + var_10_2 + arg_10_0 then
				var_10_0.localPosition = Vector3.New(0, 1, 10)
			end

			local var_10_5 = 0
			local var_10_6 = 0.75

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_7 = arg_7_1:GetWordFromCfg(110131002)
				local var_10_8 = arg_7_1:FormatText(var_10_7.content)

				arg_7_1.text_.text = var_10_8

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_9 = 30
				local var_10_10 = utf8.len(var_10_8)
				local var_10_11 = var_10_9 <= 0 and var_10_6 or var_10_6 * (var_10_10 / var_10_9)

				if var_10_11 > 0 and var_10_6 < var_10_11 then
					arg_7_1.talkMaxDuration = var_10_11

					if var_10_11 + var_10_5 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_11 + var_10_5
					end
				end

				arg_7_1.text_.text = var_10_8
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_12 = math.max(var_10_6, arg_7_1.talkMaxDuration)

			if var_10_5 <= arg_7_1.time_ and arg_7_1.time_ < var_10_5 + var_10_12 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_5) / var_10_12

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_5 + var_10_12 and arg_7_1.time_ < var_10_5 + var_10_12 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play110131003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 110131003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play110131004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.25

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

				local var_14_2 = arg_11_1:GetWordFromCfg(110131003)
				local var_14_3 = arg_11_1:FormatText(var_14_2.content)

				arg_11_1.text_.text = var_14_3

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_4 = 50
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
	Play110131004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 110131004
		arg_15_1.duration_ = 5

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play110131005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.9

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[7].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(110131004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 36
				local var_18_6 = utf8.len(var_18_4)
				local var_18_7 = var_18_5 <= 0 and var_18_1 or var_18_1 * (var_18_6 / var_18_5)

				if var_18_7 > 0 and var_18_1 < var_18_7 then
					arg_15_1.talkMaxDuration = var_18_7

					if var_18_7 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_7 + var_18_0
					end
				end

				arg_15_1.text_.text = var_18_4
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_8 = math.max(var_18_1, arg_15_1.talkMaxDuration)

			if var_18_0 <= arg_15_1.time_ and arg_15_1.time_ < var_18_0 + var_18_8 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_0) / var_18_8

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_0 + var_18_8 and arg_15_1.time_ < var_18_0 + var_18_8 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play110131005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 110131005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play110131006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.175

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[7].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(110131005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 7
				local var_22_6 = utf8.len(var_22_4)
				local var_22_7 = var_22_5 <= 0 and var_22_1 or var_22_1 * (var_22_6 / var_22_5)

				if var_22_7 > 0 and var_22_1 < var_22_7 then
					arg_19_1.talkMaxDuration = var_22_7

					if var_22_7 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_7 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_4
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_8 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_0 <= arg_19_1.time_ and arg_19_1.time_ < var_22_0 + var_22_8 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_0) / var_22_8

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_0 + var_22_8 and arg_19_1.time_ < var_22_0 + var_22_8 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play110131006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 110131006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play110131007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.825

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, false)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_2 = arg_23_1:GetWordFromCfg(110131006)
				local var_26_3 = arg_23_1:FormatText(var_26_2.content)

				arg_23_1.text_.text = var_26_3

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_4 = 33
				local var_26_5 = utf8.len(var_26_3)
				local var_26_6 = var_26_4 <= 0 and var_26_1 or var_26_1 * (var_26_5 / var_26_4)

				if var_26_6 > 0 and var_26_1 < var_26_6 then
					arg_23_1.talkMaxDuration = var_26_6

					if var_26_6 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_6 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_3
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)
				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_7 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_7 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_7

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_7 and arg_23_1.time_ < var_26_0 + var_26_7 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play110131007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 110131007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play110131008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1.325

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[7].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(110131007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 53
				local var_30_6 = utf8.len(var_30_4)
				local var_30_7 = var_30_5 <= 0 and var_30_1 or var_30_1 * (var_30_6 / var_30_5)

				if var_30_7 > 0 and var_30_1 < var_30_7 then
					arg_27_1.talkMaxDuration = var_30_7

					if var_30_7 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_7 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_4
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_8 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_8 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_8

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_8 and arg_27_1.time_ < var_30_0 + var_30_8 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play110131008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 110131008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play110131009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.825

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[7].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(110131008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 33
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
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_8 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_8 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_8

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_8 and arg_31_1.time_ < var_34_0 + var_34_8 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play110131009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 110131009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play110131010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.525

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[7].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(110131009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 21
				local var_38_6 = utf8.len(var_38_4)
				local var_38_7 = var_38_5 <= 0 and var_38_1 or var_38_1 * (var_38_6 / var_38_5)

				if var_38_7 > 0 and var_38_1 < var_38_7 then
					arg_35_1.talkMaxDuration = var_38_7

					if var_38_7 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_7 + var_38_0
					end
				end

				arg_35_1.text_.text = var_38_4
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)
				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_8 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_8 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_8

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_8 and arg_35_1.time_ < var_38_0 + var_38_8 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play110131010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 110131010
		arg_39_1.duration_ = 2.633

		local var_39_0 = {
			ja = 2.066,
			ko = 1.533,
			zh = 2.633,
			en = 1.366
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
				arg_39_0:Play110131011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.15

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[36].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(110131010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131010", "story_v_out_110131.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131010", "story_v_out_110131.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_110131", "110131010", "story_v_out_110131.awb")

						arg_39_1:RecordAudio("110131010", var_42_9)
						arg_39_1:RecordAudio("110131010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_110131", "110131010", "story_v_out_110131.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_110131", "110131010", "story_v_out_110131.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_10 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_10 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_10

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_10 and arg_39_1.time_ < var_42_0 + var_42_10 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play110131011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 110131011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play110131012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.1

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[7].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(110131011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 4
				local var_46_6 = utf8.len(var_46_4)
				local var_46_7 = var_46_5 <= 0 and var_46_1 or var_46_1 * (var_46_6 / var_46_5)

				if var_46_7 > 0 and var_46_1 < var_46_7 then
					arg_43_1.talkMaxDuration = var_46_7

					if var_46_7 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_7 + var_46_0
					end
				end

				arg_43_1.text_.text = var_46_4
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_8 = math.max(var_46_1, arg_43_1.talkMaxDuration)

			if var_46_0 <= arg_43_1.time_ and arg_43_1.time_ < var_46_0 + var_46_8 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_0) / var_46_8

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_0 + var_46_8 and arg_43_1.time_ < var_46_0 + var_46_8 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play110131012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 110131012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play110131013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.925

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_2 = arg_47_1:GetWordFromCfg(110131012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 37
				local var_50_5 = utf8.len(var_50_3)
				local var_50_6 = var_50_4 <= 0 and var_50_1 or var_50_1 * (var_50_5 / var_50_4)

				if var_50_6 > 0 and var_50_1 < var_50_6 then
					arg_47_1.talkMaxDuration = var_50_6

					if var_50_6 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_6 + var_50_0
					end
				end

				arg_47_1.text_.text = var_50_3
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_7 = math.max(var_50_1, arg_47_1.talkMaxDuration)

			if var_50_0 <= arg_47_1.time_ and arg_47_1.time_ < var_50_0 + var_50_7 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_0) / var_50_7

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_0 + var_50_7 and arg_47_1.time_ < var_50_0 + var_50_7 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play110131013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 110131013
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play110131014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.175

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[7].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(110131013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 7
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
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_8 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_8 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_8

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_8 and arg_51_1.time_ < var_54_0 + var_54_8 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play110131014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 110131014
		arg_55_1.duration_ = 5.63333333333333

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play110131015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.bgs_.ST19.transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPosST19 = var_58_0.localPosition
			end

			local var_58_2 = 3.5

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(3.2, 2.5, 2.5)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosST19, var_58_4, var_58_3)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(3.2, 2.5, 2.5)
			end

			local var_58_5 = 0

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1.allBtn_.enabled = false
			end

			local var_58_6 = 0.633333333333333

			if arg_55_1.time_ >= var_58_5 + var_58_6 and arg_55_1.time_ < var_58_5 + var_58_6 + arg_58_0 then
				arg_55_1.allBtn_.enabled = true
			end

			if arg_55_1.frameCnt_ <= 1 then
				arg_55_1.dialog_:SetActive(false)
			end

			local var_58_7 = 0.633333333333333
			local var_58_8 = 1.8

			if var_58_7 < arg_55_1.time_ and arg_55_1.time_ <= var_58_7 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0

				arg_55_1.dialog_:SetActive(true)

				local var_58_9 = LeanTween.value(arg_55_1.dialog_, 0, 1, 0.3)

				var_58_9:setOnUpdate(LuaHelper.FloatAction(function(arg_59_0)
					arg_55_1.dialogCg_.alpha = arg_59_0
				end))
				var_58_9:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_55_1.dialog_)
					var_58_9:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_55_1.duration_ = arg_55_1.duration_ + 0.3

				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_10 = arg_55_1:GetWordFromCfg(110131014)
				local var_58_11 = arg_55_1:FormatText(var_58_10.content)

				arg_55_1.text_.text = var_58_11

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_12 = 72
				local var_58_13 = utf8.len(var_58_11)
				local var_58_14 = var_58_12 <= 0 and var_58_8 or var_58_8 * (var_58_13 / var_58_12)

				if var_58_14 > 0 and var_58_8 < var_58_14 then
					arg_55_1.talkMaxDuration = var_58_14
					var_58_7 = var_58_7 + 0.3

					if var_58_14 + var_58_7 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_14 + var_58_7
					end
				end

				arg_55_1.text_.text = var_58_11
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_15 = var_58_7 + 0.3
			local var_58_16 = math.max(var_58_8, arg_55_1.talkMaxDuration)

			if var_58_15 <= arg_55_1.time_ and arg_55_1.time_ < var_58_15 + var_58_16 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_15) / var_58_16

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_15 + var_58_16 and arg_55_1.time_ < var_58_15 + var_58_16 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play110131015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 110131015
		arg_61_1.duration_ = 7

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play110131016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = 0

			if var_64_0 < arg_61_1.time_ and arg_61_1.time_ <= var_64_0 + arg_64_0 then
				arg_61_1.mask_.enabled = true
				arg_61_1.mask_.raycastTarget = false

				arg_61_1:SetGaussion(false)
			end

			local var_64_1 = 1.5

			if var_64_0 <= arg_61_1.time_ and arg_61_1.time_ < var_64_0 + var_64_1 then
				local var_64_2 = (arg_61_1.time_ - var_64_0) / var_64_1
				local var_64_3 = Color.New(1, 1, 1)

				var_64_3.a = Mathf.Lerp(1, 0, var_64_2)
				arg_61_1.mask_.color = var_64_3
			end

			if arg_61_1.time_ >= var_64_0 + var_64_1 and arg_61_1.time_ < var_64_0 + var_64_1 + arg_64_0 then
				local var_64_4 = Color.New(1, 1, 1)
				local var_64_5 = 0

				arg_61_1.mask_.enabled = false
				var_64_4.a = var_64_5
				arg_61_1.mask_.color = var_64_4
			end

			local var_64_6 = "OS0102"

			if arg_61_1.bgs_[var_64_6] == nil then
				local var_64_7 = Object.Instantiate(arg_61_1.paintGo_)

				var_64_7:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_64_6)
				var_64_7.name = var_64_6
				var_64_7.transform.parent = arg_61_1.stage_.transform
				var_64_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_61_1.bgs_[var_64_6] = var_64_7
			end

			local var_64_8 = 0

			if var_64_8 < arg_61_1.time_ and arg_61_1.time_ <= var_64_8 + arg_64_0 then
				local var_64_9 = manager.ui.mainCamera.transform.localPosition
				local var_64_10 = Vector3.New(0, 0, 10) + Vector3.New(var_64_9.x, var_64_9.y, 0)
				local var_64_11 = arg_61_1.bgs_.OS0102

				var_64_11.transform.localPosition = var_64_10
				var_64_11.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_64_12 = var_64_11:GetComponent("SpriteRenderer")

				if var_64_12 and var_64_12.sprite then
					local var_64_13 = (var_64_11.transform.localPosition - var_64_9).z
					local var_64_14 = manager.ui.mainCameraCom_
					local var_64_15 = 2 * var_64_13 * Mathf.Tan(var_64_14.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_64_16 = var_64_15 * var_64_14.aspect
					local var_64_17 = var_64_12.sprite.bounds.size.x
					local var_64_18 = var_64_12.sprite.bounds.size.y
					local var_64_19 = var_64_16 / var_64_17
					local var_64_20 = var_64_15 / var_64_18
					local var_64_21 = var_64_20 < var_64_19 and var_64_19 or var_64_20

					var_64_11.transform.localScale = Vector3.New(var_64_21, var_64_21, 0)
				end

				for iter_64_0, iter_64_1 in pairs(arg_61_1.bgs_) do
					if iter_64_0 ~= "OS0102" then
						iter_64_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_64_22 = 0

			if var_64_22 < arg_61_1.time_ and arg_61_1.time_ <= var_64_22 + arg_64_0 then
				arg_61_1.allBtn_.enabled = false
			end

			local var_64_23 = 2

			if arg_61_1.time_ >= var_64_22 + var_64_23 and arg_61_1.time_ < var_64_22 + var_64_23 + arg_64_0 then
				arg_61_1.allBtn_.enabled = true
			end

			if arg_61_1.frameCnt_ <= 1 then
				arg_61_1.dialog_:SetActive(false)
			end

			local var_64_24 = 2
			local var_64_25 = 0.225

			if var_64_24 < arg_61_1.time_ and arg_61_1.time_ <= var_64_24 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0

				arg_61_1.dialog_:SetActive(true)

				local var_64_26 = LeanTween.value(arg_61_1.dialog_, 0, 1, 0.3)

				var_64_26:setOnUpdate(LuaHelper.FloatAction(function(arg_65_0)
					arg_61_1.dialogCg_.alpha = arg_65_0
				end))
				var_64_26:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_61_1.dialog_)
					var_64_26:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_61_1.duration_ = arg_61_1.duration_ + 0.3

				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_27 = arg_61_1:FormatText(StoryNameCfg[7].name)

				arg_61_1.leftNameTxt_.text = var_64_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_28 = arg_61_1:GetWordFromCfg(110131015)
				local var_64_29 = arg_61_1:FormatText(var_64_28.content)

				arg_61_1.text_.text = var_64_29

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_30 = 9
				local var_64_31 = utf8.len(var_64_29)
				local var_64_32 = var_64_30 <= 0 and var_64_25 or var_64_25 * (var_64_31 / var_64_30)

				if var_64_32 > 0 and var_64_25 < var_64_32 then
					arg_61_1.talkMaxDuration = var_64_32
					var_64_24 = var_64_24 + 0.3

					if var_64_32 + var_64_24 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_32 + var_64_24
					end
				end

				arg_61_1.text_.text = var_64_29
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_33 = var_64_24 + 0.3
			local var_64_34 = math.max(var_64_25, arg_61_1.talkMaxDuration)

			if var_64_33 <= arg_61_1.time_ and arg_61_1.time_ < var_64_33 + var_64_34 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_33) / var_64_34

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_33 + var_64_34 and arg_61_1.time_ < var_64_33 + var_64_34 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play110131016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 110131016
		arg_67_1.duration_ = 5.1

		local var_67_0 = {
			ja = 5.1,
			ko = 2.7,
			zh = 3.533,
			en = 3.733
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
				arg_67_0:Play110131017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.35

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[37].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(110131016)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 14
				local var_70_6 = utf8.len(var_70_4)
				local var_70_7 = var_70_5 <= 0 and var_70_1 or var_70_1 * (var_70_6 / var_70_5)

				if var_70_7 > 0 and var_70_1 < var_70_7 then
					arg_67_1.talkMaxDuration = var_70_7

					if var_70_7 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_7 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_4
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131016", "story_v_out_110131.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131016", "story_v_out_110131.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_110131", "110131016", "story_v_out_110131.awb")

						arg_67_1:RecordAudio("110131016", var_70_9)
						arg_67_1:RecordAudio("110131016", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_110131", "110131016", "story_v_out_110131.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_110131", "110131016", "story_v_out_110131.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_10 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_10 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_10

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_10 and arg_67_1.time_ < var_70_0 + var_70_10 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play110131017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 110131017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play110131018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.875

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_2 = arg_71_1:GetWordFromCfg(110131017)
				local var_74_3 = arg_71_1:FormatText(var_74_2.content)

				arg_71_1.text_.text = var_74_3

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_4 = 34
				local var_74_5 = utf8.len(var_74_3)
				local var_74_6 = var_74_4 <= 0 and var_74_1 or var_74_1 * (var_74_5 / var_74_4)

				if var_74_6 > 0 and var_74_1 < var_74_6 then
					arg_71_1.talkMaxDuration = var_74_6

					if var_74_6 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_6 + var_74_0
					end
				end

				arg_71_1.text_.text = var_74_3
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_7 = math.max(var_74_1, arg_71_1.talkMaxDuration)

			if var_74_0 <= arg_71_1.time_ and arg_71_1.time_ < var_74_0 + var_74_7 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_0) / var_74_7

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_0 + var_74_7 and arg_71_1.time_ < var_74_0 + var_74_7 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play110131018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 110131018
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play110131019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 0.725

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_2 = arg_75_1:FormatText(StoryNameCfg[7].name)

				arg_75_1.leftNameTxt_.text = var_78_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_3 = arg_75_1:GetWordFromCfg(110131018)
				local var_78_4 = arg_75_1:FormatText(var_78_3.content)

				arg_75_1.text_.text = var_78_4

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_5 = 29
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
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_8 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_8 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_8

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_8 and arg_75_1.time_ < var_78_0 + var_78_8 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play110131019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 110131019
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play110131020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = 0
			local var_82_1 = 0.675

			if var_82_0 < arg_79_1.time_ and arg_79_1.time_ <= var_82_0 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, false)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_2 = arg_79_1:GetWordFromCfg(110131019)
				local var_82_3 = arg_79_1:FormatText(var_82_2.content)

				arg_79_1.text_.text = var_82_3

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_4 = 27
				local var_82_5 = utf8.len(var_82_3)
				local var_82_6 = var_82_4 <= 0 and var_82_1 or var_82_1 * (var_82_5 / var_82_4)

				if var_82_6 > 0 and var_82_1 < var_82_6 then
					arg_79_1.talkMaxDuration = var_82_6

					if var_82_6 + var_82_0 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_6 + var_82_0
					end
				end

				arg_79_1.text_.text = var_82_3
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_7 = math.max(var_82_1, arg_79_1.talkMaxDuration)

			if var_82_0 <= arg_79_1.time_ and arg_79_1.time_ < var_82_0 + var_82_7 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_0) / var_82_7

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_0 + var_82_7 and arg_79_1.time_ < var_82_0 + var_82_7 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play110131020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 110131020
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play110131021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.125

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[7].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(110131020)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 5
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
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_8 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_8 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_8

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_8 and arg_83_1.time_ < var_86_0 + var_86_8 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play110131021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 110131021
		arg_87_1.duration_ = 9

		local var_87_0 = {
			ja = 4.6,
			ko = 8.366,
			zh = 9,
			en = 7.566
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
				arg_87_0:Play110131022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = 0
			local var_90_1 = 0.925

			if var_90_0 < arg_87_1.time_ and arg_87_1.time_ <= var_90_0 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_2 = arg_87_1:FormatText(StoryNameCfg[37].name)

				arg_87_1.leftNameTxt_.text = var_90_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_3 = arg_87_1:GetWordFromCfg(110131021)
				local var_90_4 = arg_87_1:FormatText(var_90_3.content)

				arg_87_1.text_.text = var_90_4

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131021", "story_v_out_110131.awb") ~= 0 then
					local var_90_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131021", "story_v_out_110131.awb") / 1000

					if var_90_8 + var_90_0 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_8 + var_90_0
					end

					if var_90_3.prefab_name ~= "" and arg_87_1.actors_[var_90_3.prefab_name] ~= nil then
						local var_90_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_3.prefab_name].transform, "story_v_out_110131", "110131021", "story_v_out_110131.awb")

						arg_87_1:RecordAudio("110131021", var_90_9)
						arg_87_1:RecordAudio("110131021", var_90_9)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_110131", "110131021", "story_v_out_110131.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_110131", "110131021", "story_v_out_110131.awb")
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
	Play110131022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 110131022
		arg_91_1.duration_ = 5

		SetActive(arg_91_1.tipsGo_, false)

		function arg_91_1.onSingleLineFinish_()
			arg_91_1.onSingleLineUpdate_ = nil
			arg_91_1.onSingleLineFinish_ = nil
			arg_91_1.state_ = "waiting"
		end

		function arg_91_1.playNext_(arg_93_0)
			if arg_93_0 == 1 then
				arg_91_0:Play110131023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.65

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[7].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(110131022)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 26
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
				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_8 = math.max(var_94_1, arg_91_1.talkMaxDuration)

			if var_94_0 <= arg_91_1.time_ and arg_91_1.time_ < var_94_0 + var_94_8 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_0) / var_94_8

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_0 + var_94_8 and arg_91_1.time_ < var_94_0 + var_94_8 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play110131023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 110131023
		arg_95_1.duration_ = 11.1

		local var_95_0 = {
			ja = 11.1,
			ko = 8.266,
			zh = 8.633,
			en = 7.4
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
				arg_95_0:Play110131024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = 0
			local var_98_1 = 0.85

			if var_98_0 < arg_95_1.time_ and arg_95_1.time_ <= var_98_0 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_2 = arg_95_1:FormatText(StoryNameCfg[37].name)

				arg_95_1.leftNameTxt_.text = var_98_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_3 = arg_95_1:GetWordFromCfg(110131023)
				local var_98_4 = arg_95_1:FormatText(var_98_3.content)

				arg_95_1.text_.text = var_98_4

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131023", "story_v_out_110131.awb") ~= 0 then
					local var_98_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131023", "story_v_out_110131.awb") / 1000

					if var_98_8 + var_98_0 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_8 + var_98_0
					end

					if var_98_3.prefab_name ~= "" and arg_95_1.actors_[var_98_3.prefab_name] ~= nil then
						local var_98_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_3.prefab_name].transform, "story_v_out_110131", "110131023", "story_v_out_110131.awb")

						arg_95_1:RecordAudio("110131023", var_98_9)
						arg_95_1:RecordAudio("110131023", var_98_9)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_110131", "110131023", "story_v_out_110131.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_110131", "110131023", "story_v_out_110131.awb")
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
	Play110131024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 110131024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play110131025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.375

			if var_102_0 < arg_99_1.time_ and arg_99_1.time_ <= var_102_0 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_2 = arg_99_1:FormatText(StoryNameCfg[7].name)

				arg_99_1.leftNameTxt_.text = var_102_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_3 = arg_99_1:GetWordFromCfg(110131024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 15
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
				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_8 = math.max(var_102_1, arg_99_1.talkMaxDuration)

			if var_102_0 <= arg_99_1.time_ and arg_99_1.time_ < var_102_0 + var_102_8 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_0) / var_102_8

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_0 + var_102_8 and arg_99_1.time_ < var_102_0 + var_102_8 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play110131025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 110131025
		arg_103_1.duration_ = 11.3

		local var_103_0 = {
			ja = 9.433,
			ko = 9.5,
			zh = 11.3,
			en = 8.7
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
				arg_103_0:Play110131026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.975

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[37].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(110131025)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131025", "story_v_out_110131.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131025", "story_v_out_110131.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_110131", "110131025", "story_v_out_110131.awb")

						arg_103_1:RecordAudio("110131025", var_106_9)
						arg_103_1:RecordAudio("110131025", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_110131", "110131025", "story_v_out_110131.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_110131", "110131025", "story_v_out_110131.awb")
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
	Play110131026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 110131026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play110131027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 1.125

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[7].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(110131026)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 45
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
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_8 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_8 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_8

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_8 and arg_107_1.time_ < var_110_0 + var_110_8 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play110131027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 110131027
		arg_111_1.duration_ = 5.8

		local var_111_0 = {
			ja = 5.8,
			ko = 4.233,
			zh = 5.066,
			en = 5.566
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
				arg_111_0:Play110131028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 0.525

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[37].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(110131027)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 21
				local var_114_6 = utf8.len(var_114_4)
				local var_114_7 = var_114_5 <= 0 and var_114_1 or var_114_1 * (var_114_6 / var_114_5)

				if var_114_7 > 0 and var_114_1 < var_114_7 then
					arg_111_1.talkMaxDuration = var_114_7

					if var_114_7 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_7 + var_114_0
					end
				end

				arg_111_1.text_.text = var_114_4
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131027", "story_v_out_110131.awb") ~= 0 then
					local var_114_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131027", "story_v_out_110131.awb") / 1000

					if var_114_8 + var_114_0 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_8 + var_114_0
					end

					if var_114_3.prefab_name ~= "" and arg_111_1.actors_[var_114_3.prefab_name] ~= nil then
						local var_114_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_3.prefab_name].transform, "story_v_out_110131", "110131027", "story_v_out_110131.awb")

						arg_111_1:RecordAudio("110131027", var_114_9)
						arg_111_1:RecordAudio("110131027", var_114_9)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_110131", "110131027", "story_v_out_110131.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_110131", "110131027", "story_v_out_110131.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_10 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_10 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_10

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_10 and arg_111_1.time_ < var_114_0 + var_114_10 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play110131028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 110131028
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play110131029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.15

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_2 = arg_115_1:FormatText(StoryNameCfg[7].name)

				arg_115_1.leftNameTxt_.text = var_118_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_3 = arg_115_1:GetWordFromCfg(110131028)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 6
				local var_118_6 = utf8.len(var_118_4)
				local var_118_7 = var_118_5 <= 0 and var_118_1 or var_118_1 * (var_118_6 / var_118_5)

				if var_118_7 > 0 and var_118_1 < var_118_7 then
					arg_115_1.talkMaxDuration = var_118_7

					if var_118_7 + var_118_0 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_7 + var_118_0
					end
				end

				arg_115_1.text_.text = var_118_4
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)
				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_8 = math.max(var_118_1, arg_115_1.talkMaxDuration)

			if var_118_0 <= arg_115_1.time_ and arg_115_1.time_ < var_118_0 + var_118_8 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_0) / var_118_8

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_0 + var_118_8 and arg_115_1.time_ < var_118_0 + var_118_8 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play110131029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 110131029
		arg_119_1.duration_ = 11.666

		local var_119_0 = {
			ja = 5.666,
			ko = 8.3,
			zh = 10.333,
			en = 11.666
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
				arg_119_0:Play110131030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = 0
			local var_122_1 = 0.975

			if var_122_0 < arg_119_1.time_ and arg_119_1.time_ <= var_122_0 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_2 = arg_119_1:FormatText(StoryNameCfg[37].name)

				arg_119_1.leftNameTxt_.text = var_122_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_3 = arg_119_1:GetWordFromCfg(110131029)
				local var_122_4 = arg_119_1:FormatText(var_122_3.content)

				arg_119_1.text_.text = var_122_4

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_5 = 39
				local var_122_6 = utf8.len(var_122_4)
				local var_122_7 = var_122_5 <= 0 and var_122_1 or var_122_1 * (var_122_6 / var_122_5)

				if var_122_7 > 0 and var_122_1 < var_122_7 then
					arg_119_1.talkMaxDuration = var_122_7

					if var_122_7 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_7 + var_122_0
					end
				end

				arg_119_1.text_.text = var_122_4
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131029", "story_v_out_110131.awb") ~= 0 then
					local var_122_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131029", "story_v_out_110131.awb") / 1000

					if var_122_8 + var_122_0 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_8 + var_122_0
					end

					if var_122_3.prefab_name ~= "" and arg_119_1.actors_[var_122_3.prefab_name] ~= nil then
						local var_122_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_3.prefab_name].transform, "story_v_out_110131", "110131029", "story_v_out_110131.awb")

						arg_119_1:RecordAudio("110131029", var_122_9)
						arg_119_1:RecordAudio("110131029", var_122_9)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_110131", "110131029", "story_v_out_110131.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_110131", "110131029", "story_v_out_110131.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_10 = math.max(var_122_1, arg_119_1.talkMaxDuration)

			if var_122_0 <= arg_119_1.time_ and arg_119_1.time_ < var_122_0 + var_122_10 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_0) / var_122_10

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_0 + var_122_10 and arg_119_1.time_ < var_122_0 + var_122_10 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play110131030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 110131030
		arg_123_1.duration_ = 5

		SetActive(arg_123_1.tipsGo_, false)

		function arg_123_1.onSingleLineFinish_()
			arg_123_1.onSingleLineUpdate_ = nil
			arg_123_1.onSingleLineFinish_ = nil
			arg_123_1.state_ = "waiting"
		end

		function arg_123_1.playNext_(arg_125_0)
			if arg_125_0 == 1 then
				arg_123_0:Play110131031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0
			local var_126_1 = 0.05

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_2 = arg_123_1:FormatText(StoryNameCfg[7].name)

				arg_123_1.leftNameTxt_.text = var_126_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_3 = arg_123_1:GetWordFromCfg(110131030)
				local var_126_4 = arg_123_1:FormatText(var_126_3.content)

				arg_123_1.text_.text = var_126_4

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_5 = 2
				local var_126_6 = utf8.len(var_126_4)
				local var_126_7 = var_126_5 <= 0 and var_126_1 or var_126_1 * (var_126_6 / var_126_5)

				if var_126_7 > 0 and var_126_1 < var_126_7 then
					arg_123_1.talkMaxDuration = var_126_7

					if var_126_7 + var_126_0 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_7 + var_126_0
					end
				end

				arg_123_1.text_.text = var_126_4
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)
				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_8 = math.max(var_126_1, arg_123_1.talkMaxDuration)

			if var_126_0 <= arg_123_1.time_ and arg_123_1.time_ < var_126_0 + var_126_8 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_0) / var_126_8

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_0 + var_126_8 and arg_123_1.time_ < var_126_0 + var_126_8 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play110131031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 110131031
		arg_127_1.duration_ = 13.6

		local var_127_0 = {
			ja = 13.6,
			ko = 12.066,
			zh = 12.3,
			en = 12.466
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
				arg_127_0:Play110131032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0
			local var_130_1 = 2

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_2 = arg_127_1:FormatText(StoryNameCfg[37].name)

				arg_127_1.leftNameTxt_.text = var_130_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_3 = arg_127_1:GetWordFromCfg(110131031)
				local var_130_4 = arg_127_1:FormatText(var_130_3.content)

				arg_127_1.text_.text = var_130_4

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_5 = 53
				local var_130_6 = utf8.len(var_130_4)
				local var_130_7 = var_130_5 <= 0 and var_130_1 or var_130_1 * (var_130_6 / var_130_5)

				if var_130_7 > 0 and var_130_1 < var_130_7 then
					arg_127_1.talkMaxDuration = var_130_7

					if var_130_7 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_7 + var_130_0
					end
				end

				arg_127_1.text_.text = var_130_4
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131031", "story_v_out_110131.awb") ~= 0 then
					local var_130_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131031", "story_v_out_110131.awb") / 1000

					if var_130_8 + var_130_0 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_0
					end

					if var_130_3.prefab_name ~= "" and arg_127_1.actors_[var_130_3.prefab_name] ~= nil then
						local var_130_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_3.prefab_name].transform, "story_v_out_110131", "110131031", "story_v_out_110131.awb")

						arg_127_1:RecordAudio("110131031", var_130_9)
						arg_127_1:RecordAudio("110131031", var_130_9)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_110131", "110131031", "story_v_out_110131.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_110131", "110131031", "story_v_out_110131.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_10 = math.max(var_130_1, arg_127_1.talkMaxDuration)

			if var_130_0 <= arg_127_1.time_ and arg_127_1.time_ < var_130_0 + var_130_10 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_0) / var_130_10

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_0 + var_130_10 and arg_127_1.time_ < var_130_0 + var_130_10 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play110131032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 110131032
		arg_131_1.duration_ = 13.666

		local var_131_0 = {
			ja = 5.8,
			ko = 3.5,
			zh = 13.2,
			en = 13.666
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
				arg_131_0:Play110131033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.bgs_.OS0102
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				local var_134_2 = var_134_0:GetComponent("SpriteRenderer")

				if var_134_2 then
					var_134_2.material = arg_131_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_134_3 = var_134_2.material
					local var_134_4 = var_134_3:GetColor("_Color")

					arg_131_1.var_.alphaOldValueOS0102 = var_134_4.a
					arg_131_1.var_.alphaMatValueOS0102 = var_134_3
				end

				arg_131_1.var_.alphaOldValueOS0102 = 1
			end

			local var_134_5 = 1.5

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_5 then
				local var_134_6 = (arg_131_1.time_ - var_134_1) / var_134_5
				local var_134_7 = Mathf.Lerp(arg_131_1.var_.alphaOldValueOS0102, 0, var_134_6)

				if arg_131_1.var_.alphaMatValueOS0102 then
					local var_134_8 = arg_131_1.var_.alphaMatValueOS0102
					local var_134_9 = var_134_8:GetColor("_Color")

					var_134_9.a = var_134_7

					var_134_8:SetColor("_Color", var_134_9)
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_5 and arg_131_1.time_ < var_134_1 + var_134_5 + arg_134_0 and arg_131_1.var_.alphaMatValueOS0102 then
				local var_134_10 = arg_131_1.var_.alphaMatValueOS0102
				local var_134_11 = var_134_10:GetColor("_Color")

				var_134_11.a = 0

				var_134_10:SetColor("_Color", var_134_11)
			end

			local var_134_12 = 0

			if var_134_12 < arg_131_1.time_ and arg_131_1.time_ <= var_134_12 + arg_134_0 then
				arg_131_1.allBtn_.enabled = false
			end

			local var_134_13 = 2

			if arg_131_1.time_ >= var_134_12 + var_134_13 and arg_131_1.time_ < var_134_12 + var_134_13 + arg_134_0 then
				arg_131_1.allBtn_.enabled = true
			end

			if arg_131_1.frameCnt_ <= 1 then
				arg_131_1.dialog_:SetActive(false)
			end

			local var_134_14 = 2
			local var_134_15 = 1.075

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0

				arg_131_1.dialog_:SetActive(true)

				local var_134_16 = LeanTween.value(arg_131_1.dialog_, 0, 1, 0.3)

				var_134_16:setOnUpdate(LuaHelper.FloatAction(function(arg_135_0)
					arg_131_1.dialogCg_.alpha = arg_135_0
				end))
				var_134_16:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_131_1.dialog_)
					var_134_16:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_131_1.duration_ = arg_131_1.duration_ + 0.3

				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_17 = arg_131_1:GetWordFromCfg(110131032)
				local var_134_18 = arg_131_1:FormatText(var_134_17.content)

				arg_131_1.text_.text = var_134_18

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_19 = 42
				local var_134_20 = utf8.len(var_134_18)
				local var_134_21 = var_134_19 <= 0 and var_134_15 or var_134_15 * (var_134_20 / var_134_19)

				if var_134_21 > 0 and var_134_15 < var_134_21 then
					arg_131_1.talkMaxDuration = var_134_21
					var_134_14 = var_134_14 + 0.3

					if var_134_21 + var_134_14 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_21 + var_134_14
					end
				end

				arg_131_1.text_.text = var_134_18
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131032", "story_v_out_110131.awb") ~= 0 then
					local var_134_22 = manager.audio:GetVoiceLength("story_v_out_110131", "110131032", "story_v_out_110131.awb") / 1000

					if var_134_22 + var_134_14 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_22 + var_134_14
					end

					if var_134_17.prefab_name ~= "" and arg_131_1.actors_[var_134_17.prefab_name] ~= nil then
						local var_134_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_17.prefab_name].transform, "story_v_out_110131", "110131032", "story_v_out_110131.awb")

						arg_131_1:RecordAudio("110131032", var_134_23)
						arg_131_1:RecordAudio("110131032", var_134_23)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_110131", "110131032", "story_v_out_110131.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_110131", "110131032", "story_v_out_110131.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_24 = var_134_14 + 0.3
			local var_134_25 = math.max(var_134_15, arg_131_1.talkMaxDuration)

			if var_134_24 <= arg_131_1.time_ and arg_131_1.time_ < var_134_24 + var_134_25 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_24) / var_134_25

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_24 + var_134_25 and arg_131_1.time_ < var_134_24 + var_134_25 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play110131033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 110131033
		arg_137_1.duration_ = 14.566

		local var_137_0 = {
			ja = 14.566,
			ko = 1.5,
			zh = 4.733,
			en = 6.466
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
				arg_137_0:Play110131034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.325

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, false)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_2 = arg_137_1:GetWordFromCfg(110131033)
				local var_140_3 = arg_137_1:FormatText(var_140_2.content)

				arg_137_1.text_.text = var_140_3

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_4 = 14
				local var_140_5 = utf8.len(var_140_3)
				local var_140_6 = var_140_4 <= 0 and var_140_1 or var_140_1 * (var_140_5 / var_140_4)

				if var_140_6 > 0 and var_140_1 < var_140_6 then
					arg_137_1.talkMaxDuration = var_140_6

					if var_140_6 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_6 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_3
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131033", "story_v_out_110131.awb") ~= 0 then
					local var_140_7 = manager.audio:GetVoiceLength("story_v_out_110131", "110131033", "story_v_out_110131.awb") / 1000

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end

					if var_140_2.prefab_name ~= "" and arg_137_1.actors_[var_140_2.prefab_name] ~= nil then
						local var_140_8 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_2.prefab_name].transform, "story_v_out_110131", "110131033", "story_v_out_110131.awb")

						arg_137_1:RecordAudio("110131033", var_140_8)
						arg_137_1:RecordAudio("110131033", var_140_8)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_110131", "110131033", "story_v_out_110131.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_110131", "110131033", "story_v_out_110131.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_9 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_9 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_9

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_9 and arg_137_1.time_ < var_140_0 + var_140_9 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play110131034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 110131034
		arg_141_1.duration_ = 15.966

		local var_141_0 = {
			ja = 15.966,
			ko = 10.2,
			zh = 10.033,
			en = 11.566
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
				arg_141_0:Play110131035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = "OS0102a"

			if arg_141_1.bgs_[var_144_0] == nil then
				local var_144_1 = Object.Instantiate(arg_141_1.paintGo_)

				var_144_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_144_0)
				var_144_1.name = var_144_0
				var_144_1.transform.parent = arg_141_1.stage_.transform
				var_144_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_141_1.bgs_[var_144_0] = var_144_1
			end

			local var_144_2 = arg_141_1.bgs_.OS0102a
			local var_144_3 = 0

			if var_144_3 < arg_141_1.time_ and arg_141_1.time_ <= var_144_3 + arg_144_0 then
				local var_144_4 = var_144_2:GetComponent("SpriteRenderer")

				if var_144_4 then
					var_144_4.material = arg_141_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_144_5 = var_144_4.material
					local var_144_6 = var_144_5:GetColor("_Color")

					arg_141_1.var_.alphaOldValueOS0102a = var_144_6.a
					arg_141_1.var_.alphaMatValueOS0102a = var_144_5
				end

				arg_141_1.var_.alphaOldValueOS0102a = 0
			end

			local var_144_7 = 1.5

			if var_144_3 <= arg_141_1.time_ and arg_141_1.time_ < var_144_3 + var_144_7 then
				local var_144_8 = (arg_141_1.time_ - var_144_3) / var_144_7
				local var_144_9 = Mathf.Lerp(arg_141_1.var_.alphaOldValueOS0102a, 1, var_144_8)

				if arg_141_1.var_.alphaMatValueOS0102a then
					local var_144_10 = arg_141_1.var_.alphaMatValueOS0102a
					local var_144_11 = var_144_10:GetColor("_Color")

					var_144_11.a = var_144_9

					var_144_10:SetColor("_Color", var_144_11)
				end
			end

			if arg_141_1.time_ >= var_144_3 + var_144_7 and arg_141_1.time_ < var_144_3 + var_144_7 + arg_144_0 and arg_141_1.var_.alphaMatValueOS0102a then
				local var_144_12 = arg_141_1.var_.alphaMatValueOS0102a
				local var_144_13 = var_144_12:GetColor("_Color")

				var_144_13.a = 1

				var_144_12:SetColor("_Color", var_144_13)
			end

			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1.allBtn_.enabled = false
			end

			local var_144_15 = 2

			if arg_141_1.time_ >= var_144_14 + var_144_15 and arg_141_1.time_ < var_144_14 + var_144_15 + arg_144_0 then
				arg_141_1.allBtn_.enabled = true
			end

			local var_144_16 = 0

			if var_144_16 < arg_141_1.time_ and arg_141_1.time_ <= var_144_16 + arg_144_0 then
				local var_144_17 = manager.ui.mainCamera.transform.localPosition
				local var_144_18 = Vector3.New(0, 0, 10) + Vector3.New(var_144_17.x, var_144_17.y, 0)
				local var_144_19 = arg_141_1.bgs_.OS0102a

				var_144_19.transform.localPosition = var_144_18
				var_144_19.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_144_20 = var_144_19:GetComponent("SpriteRenderer")

				if var_144_20 and var_144_20.sprite then
					local var_144_21 = (var_144_19.transform.localPosition - var_144_17).z
					local var_144_22 = manager.ui.mainCameraCom_
					local var_144_23 = 2 * var_144_21 * Mathf.Tan(var_144_22.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_144_24 = var_144_23 * var_144_22.aspect
					local var_144_25 = var_144_20.sprite.bounds.size.x
					local var_144_26 = var_144_20.sprite.bounds.size.y
					local var_144_27 = var_144_24 / var_144_25
					local var_144_28 = var_144_23 / var_144_26
					local var_144_29 = var_144_28 < var_144_27 and var_144_27 or var_144_28

					var_144_19.transform.localScale = Vector3.New(var_144_29, var_144_29, 0)
				end

				for iter_144_0, iter_144_1 in pairs(arg_141_1.bgs_) do
					if iter_144_0 ~= "OS0102a" then
						iter_144_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_141_1.frameCnt_ <= 1 then
				arg_141_1.dialog_:SetActive(false)
			end

			local var_144_30 = 2
			local var_144_31 = 0.825

			if var_144_30 < arg_141_1.time_ and arg_141_1.time_ <= var_144_30 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0

				arg_141_1.dialog_:SetActive(true)

				local var_144_32 = LeanTween.value(arg_141_1.dialog_, 0, 1, 0.3)

				var_144_32:setOnUpdate(LuaHelper.FloatAction(function(arg_145_0)
					arg_141_1.dialogCg_.alpha = arg_145_0
				end))
				var_144_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_141_1.dialog_)
					var_144_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_141_1.duration_ = arg_141_1.duration_ + 0.3

				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_33 = arg_141_1:FormatText(StoryNameCfg[37].name)

				arg_141_1.leftNameTxt_.text = var_144_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_34 = arg_141_1:GetWordFromCfg(110131034)
				local var_144_35 = arg_141_1:FormatText(var_144_34.content)

				arg_141_1.text_.text = var_144_35

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_36 = 33
				local var_144_37 = utf8.len(var_144_35)
				local var_144_38 = var_144_36 <= 0 and var_144_31 or var_144_31 * (var_144_37 / var_144_36)

				if var_144_38 > 0 and var_144_31 < var_144_38 then
					arg_141_1.talkMaxDuration = var_144_38
					var_144_30 = var_144_30 + 0.3

					if var_144_38 + var_144_30 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_38 + var_144_30
					end
				end

				arg_141_1.text_.text = var_144_35
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131034", "story_v_out_110131.awb") ~= 0 then
					local var_144_39 = manager.audio:GetVoiceLength("story_v_out_110131", "110131034", "story_v_out_110131.awb") / 1000

					if var_144_39 + var_144_30 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_39 + var_144_30
					end

					if var_144_34.prefab_name ~= "" and arg_141_1.actors_[var_144_34.prefab_name] ~= nil then
						local var_144_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_34.prefab_name].transform, "story_v_out_110131", "110131034", "story_v_out_110131.awb")

						arg_141_1:RecordAudio("110131034", var_144_40)
						arg_141_1:RecordAudio("110131034", var_144_40)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_110131", "110131034", "story_v_out_110131.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_110131", "110131034", "story_v_out_110131.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_41 = var_144_30 + 0.3
			local var_144_42 = math.max(var_144_31, arg_141_1.talkMaxDuration)

			if var_144_41 <= arg_141_1.time_ and arg_141_1.time_ < var_144_41 + var_144_42 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_41) / var_144_42

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_41 + var_144_42 and arg_141_1.time_ < var_144_41 + var_144_42 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play110131035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 110131035
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play110131036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.45

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

				local var_150_3 = arg_147_1:GetWordFromCfg(110131035)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 18
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
	Play110131036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 110131036
		arg_151_1.duration_ = 12.733

		local var_151_0 = {
			ja = 7.766,
			ko = 12.733,
			zh = 11.3,
			en = 10.566
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
				arg_151_0:Play110131037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 1

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[37].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(110131036)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131036", "story_v_out_110131.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131036", "story_v_out_110131.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_110131", "110131036", "story_v_out_110131.awb")

						arg_151_1:RecordAudio("110131036", var_154_9)
						arg_151_1:RecordAudio("110131036", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_110131", "110131036", "story_v_out_110131.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_110131", "110131036", "story_v_out_110131.awb")
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
	Play110131037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 110131037
		arg_155_1.duration_ = 13.666

		local var_155_0 = {
			ja = 13.666,
			ko = 12.2,
			zh = 12,
			en = 9.866
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
				arg_155_0:Play110131038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = 0
			local var_158_1 = 1.275

			if var_158_0 < arg_155_1.time_ and arg_155_1.time_ <= var_158_0 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_2 = arg_155_1:FormatText(StoryNameCfg[37].name)

				arg_155_1.leftNameTxt_.text = var_158_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_3 = arg_155_1:GetWordFromCfg(110131037)
				local var_158_4 = arg_155_1:FormatText(var_158_3.content)

				arg_155_1.text_.text = var_158_4

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_5 = 51
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

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131037", "story_v_out_110131.awb") ~= 0 then
					local var_158_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131037", "story_v_out_110131.awb") / 1000

					if var_158_8 + var_158_0 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_8 + var_158_0
					end

					if var_158_3.prefab_name ~= "" and arg_155_1.actors_[var_158_3.prefab_name] ~= nil then
						local var_158_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_3.prefab_name].transform, "story_v_out_110131", "110131037", "story_v_out_110131.awb")

						arg_155_1:RecordAudio("110131037", var_158_9)
						arg_155_1:RecordAudio("110131037", var_158_9)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_110131", "110131037", "story_v_out_110131.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_110131", "110131037", "story_v_out_110131.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_10 = math.max(var_158_1, arg_155_1.talkMaxDuration)

			if var_158_0 <= arg_155_1.time_ and arg_155_1.time_ < var_158_0 + var_158_10 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_0) / var_158_10

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_0 + var_158_10 and arg_155_1.time_ < var_158_0 + var_158_10 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play110131038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 110131038
		arg_159_1.duration_ = 5

		SetActive(arg_159_1.tipsGo_, false)

		function arg_159_1.onSingleLineFinish_()
			arg_159_1.onSingleLineUpdate_ = nil
			arg_159_1.onSingleLineFinish_ = nil
			arg_159_1.state_ = "waiting"
		end

		function arg_159_1.playNext_(arg_161_0)
			if arg_161_0 == 1 then
				arg_159_0:Play110131039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0
			local var_162_1 = 1.3

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

				local var_162_2 = arg_159_1:GetWordFromCfg(110131038)
				local var_162_3 = arg_159_1:FormatText(var_162_2.content)

				arg_159_1.text_.text = var_162_3

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_4 = 52
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
	Play110131039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 110131039
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play110131040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = 0
			local var_166_1 = 0.625

			if var_166_0 < arg_163_1.time_ and arg_163_1.time_ <= var_166_0 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_2 = arg_163_1:GetWordFromCfg(110131039)
				local var_166_3 = arg_163_1:FormatText(var_166_2.content)

				arg_163_1.text_.text = var_166_3

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_4 = 25
				local var_166_5 = utf8.len(var_166_3)
				local var_166_6 = var_166_4 <= 0 and var_166_1 or var_166_1 * (var_166_5 / var_166_4)

				if var_166_6 > 0 and var_166_1 < var_166_6 then
					arg_163_1.talkMaxDuration = var_166_6

					if var_166_6 + var_166_0 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_6 + var_166_0
					end
				end

				arg_163_1.text_.text = var_166_3
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_7 = math.max(var_166_1, arg_163_1.talkMaxDuration)

			if var_166_0 <= arg_163_1.time_ and arg_163_1.time_ < var_166_0 + var_166_7 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_0) / var_166_7

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_0 + var_166_7 and arg_163_1.time_ < var_166_0 + var_166_7 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play110131040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 110131040
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play110131041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0
			local var_170_1 = 1.225

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

				local var_170_2 = arg_167_1:GetWordFromCfg(110131040)
				local var_170_3 = arg_167_1:FormatText(var_170_2.content)

				arg_167_1.text_.text = var_170_3

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_4 = 49
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
	Play110131041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 110131041
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play110131042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.425

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

				local var_174_3 = arg_171_1:GetWordFromCfg(110131041)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 17
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
	Play110131042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 110131042
		arg_175_1.duration_ = 2.433

		local var_175_0 = {
			ja = 2.433,
			ko = 1.133,
			zh = 1.4,
			en = 1
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
				arg_175_0:Play110131043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.1

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[37].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(110131042)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131042", "story_v_out_110131.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131042", "story_v_out_110131.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_110131", "110131042", "story_v_out_110131.awb")

						arg_175_1:RecordAudio("110131042", var_178_9)
						arg_175_1:RecordAudio("110131042", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_110131", "110131042", "story_v_out_110131.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_110131", "110131042", "story_v_out_110131.awb")
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
	Play110131043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 110131043
		arg_179_1.duration_ = 5

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play110131044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = manager.ui.mainCamera.transform
			local var_182_1 = 0.25

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.shakeOldPos = var_182_0.localPosition
			end

			local var_182_2 = 0.6

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / 0.066
				local var_182_4, var_182_5 = math.modf(var_182_3)

				var_182_0.localPosition = Vector3.New(var_182_5 * 0.13, var_182_5 * 0.13, var_182_5 * 0.13) + arg_179_1.var_.shakeOldPos
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 then
				var_182_0.localPosition = arg_179_1.var_.shakeOldPos
			end

			local var_182_6 = 0
			local var_182_7 = 0.525

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_8 = arg_179_1:FormatText(StoryNameCfg[7].name)

				arg_179_1.leftNameTxt_.text = var_182_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_9 = arg_179_1:GetWordFromCfg(110131043)
				local var_182_10 = arg_179_1:FormatText(var_182_9.content)

				arg_179_1.text_.text = var_182_10

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_11 = 21
				local var_182_12 = utf8.len(var_182_10)
				local var_182_13 = var_182_11 <= 0 and var_182_7 or var_182_7 * (var_182_12 / var_182_11)

				if var_182_13 > 0 and var_182_7 < var_182_13 then
					arg_179_1.talkMaxDuration = var_182_13

					if var_182_13 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_13 + var_182_6
					end
				end

				arg_179_1.text_.text = var_182_10
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_14 = math.max(var_182_7, arg_179_1.talkMaxDuration)

			if var_182_6 <= arg_179_1.time_ and arg_179_1.time_ < var_182_6 + var_182_14 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_6) / var_182_14

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_6 + var_182_14 and arg_179_1.time_ < var_182_6 + var_182_14 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play110131044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 110131044
		arg_183_1.duration_ = 5

		local var_183_0 = {
			ja = 4.3,
			ko = 4.533,
			zh = 5,
			en = 4.3
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
				arg_183_0:Play110131045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.bgs_.OS0102a
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				local var_186_2 = var_186_0:GetComponent("SpriteRenderer")

				if var_186_2 then
					var_186_2.material = arg_183_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_186_3 = var_186_2.material
					local var_186_4 = var_186_3:GetColor("_Color")

					arg_183_1.var_.alphaOldValueOS0102a = var_186_4.a
					arg_183_1.var_.alphaMatValueOS0102a = var_186_3
				end

				arg_183_1.var_.alphaOldValueOS0102a = 1
			end

			local var_186_5 = 1

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_5 then
				local var_186_6 = (arg_183_1.time_ - var_186_1) / var_186_5
				local var_186_7 = Mathf.Lerp(arg_183_1.var_.alphaOldValueOS0102a, 0, var_186_6)

				if arg_183_1.var_.alphaMatValueOS0102a then
					local var_186_8 = arg_183_1.var_.alphaMatValueOS0102a
					local var_186_9 = var_186_8:GetColor("_Color")

					var_186_9.a = var_186_7

					var_186_8:SetColor("_Color", var_186_9)
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_5 and arg_183_1.time_ < var_186_1 + var_186_5 + arg_186_0 and arg_183_1.var_.alphaMatValueOS0102a then
				local var_186_10 = arg_183_1.var_.alphaMatValueOS0102a
				local var_186_11 = var_186_10:GetColor("_Color")

				var_186_11.a = 0

				var_186_10:SetColor("_Color", var_186_11)
			end

			local var_186_12 = arg_183_1.bgs_.ST19
			local var_186_13 = 1

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				local var_186_14 = var_186_12:GetComponent("SpriteRenderer")

				if var_186_14 then
					var_186_14.material = arg_183_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_186_15 = var_186_14.material
					local var_186_16 = var_186_15:GetColor("_Color")

					arg_183_1.var_.alphaOldValueST19 = var_186_16.a
					arg_183_1.var_.alphaMatValueST19 = var_186_15
				end

				arg_183_1.var_.alphaOldValueST19 = 0
			end

			local var_186_17 = 1

			if var_186_13 <= arg_183_1.time_ and arg_183_1.time_ < var_186_13 + var_186_17 then
				local var_186_18 = (arg_183_1.time_ - var_186_13) / var_186_17
				local var_186_19 = Mathf.Lerp(arg_183_1.var_.alphaOldValueST19, 1, var_186_18)

				if arg_183_1.var_.alphaMatValueST19 then
					local var_186_20 = arg_183_1.var_.alphaMatValueST19
					local var_186_21 = var_186_20:GetColor("_Color")

					var_186_21.a = var_186_19

					var_186_20:SetColor("_Color", var_186_21)
				end
			end

			if arg_183_1.time_ >= var_186_13 + var_186_17 and arg_183_1.time_ < var_186_13 + var_186_17 + arg_186_0 and arg_183_1.var_.alphaMatValueST19 then
				local var_186_22 = arg_183_1.var_.alphaMatValueST19
				local var_186_23 = var_186_22:GetColor("_Color")

				var_186_23.a = 1

				var_186_22:SetColor("_Color", var_186_23)
			end

			local var_186_24 = 1

			if var_186_24 < arg_183_1.time_ and arg_183_1.time_ <= var_186_24 + arg_186_0 then
				local var_186_25 = manager.ui.mainCamera.transform.localPosition
				local var_186_26 = Vector3.New(0, 0, 10) + Vector3.New(var_186_25.x, var_186_25.y, 0)
				local var_186_27 = arg_183_1.bgs_.ST19

				var_186_27.transform.localPosition = var_186_26
				var_186_27.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_186_28 = var_186_27:GetComponent("SpriteRenderer")

				if var_186_28 and var_186_28.sprite then
					local var_186_29 = (var_186_27.transform.localPosition - var_186_25).z
					local var_186_30 = manager.ui.mainCameraCom_
					local var_186_31 = 2 * var_186_29 * Mathf.Tan(var_186_30.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_186_32 = var_186_31 * var_186_30.aspect
					local var_186_33 = var_186_28.sprite.bounds.size.x
					local var_186_34 = var_186_28.sprite.bounds.size.y
					local var_186_35 = var_186_32 / var_186_33
					local var_186_36 = var_186_31 / var_186_34
					local var_186_37 = var_186_36 < var_186_35 and var_186_35 or var_186_36

					var_186_27.transform.localScale = Vector3.New(var_186_37, var_186_37, 0)
				end

				for iter_186_0, iter_186_1 in pairs(arg_183_1.bgs_) do
					if iter_186_0 ~= "ST19" then
						iter_186_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_186_38 = "1011ui_story"

			if arg_183_1.actors_[var_186_38] == nil then
				local var_186_39 = Object.Instantiate(Asset.Load("Char/" .. var_186_38), arg_183_1.stage_.transform)

				var_186_39.name = var_186_38
				var_186_39.transform.localPosition = Vector3.New(0, 100, 0)
				arg_183_1.actors_[var_186_38] = var_186_39

				local var_186_40 = var_186_39:GetComponentInChildren(typeof(CharacterEffect))

				var_186_40.enabled = true

				local var_186_41 = GameObjectTools.GetOrAddComponent(var_186_39, typeof(DynamicBoneHelper))

				if var_186_41 then
					var_186_41:EnableDynamicBone(false)
				end

				arg_183_1:ShowWeapon(var_186_40.transform, false)

				arg_183_1.var_[var_186_38 .. "Animator"] = var_186_40.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_183_1.var_[var_186_38 .. "Animator"].applyRootMotion = true
				arg_183_1.var_[var_186_38 .. "LipSync"] = var_186_40.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_186_42 = arg_183_1.actors_["1011ui_story"].transform
			local var_186_43 = 2

			if var_186_43 < arg_183_1.time_ and arg_183_1.time_ <= var_186_43 + arg_186_0 then
				arg_183_1.var_.moveOldPos1011ui_story = var_186_42.localPosition
			end

			local var_186_44 = 0.001

			if var_186_43 <= arg_183_1.time_ and arg_183_1.time_ < var_186_43 + var_186_44 then
				local var_186_45 = (arg_183_1.time_ - var_186_43) / var_186_44
				local var_186_46 = Vector3.New(0, -0.71, -6)

				var_186_42.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos1011ui_story, var_186_46, var_186_45)

				local var_186_47 = manager.ui.mainCamera.transform.position - var_186_42.position

				var_186_42.forward = Vector3.New(var_186_47.x, var_186_47.y, var_186_47.z)

				local var_186_48 = var_186_42.localEulerAngles

				var_186_48.z = 0
				var_186_48.x = 0
				var_186_42.localEulerAngles = var_186_48
			end

			if arg_183_1.time_ >= var_186_43 + var_186_44 and arg_183_1.time_ < var_186_43 + var_186_44 + arg_186_0 then
				var_186_42.localPosition = Vector3.New(0, -0.71, -6)

				local var_186_49 = manager.ui.mainCamera.transform.position - var_186_42.position

				var_186_42.forward = Vector3.New(var_186_49.x, var_186_49.y, var_186_49.z)

				local var_186_50 = var_186_42.localEulerAngles

				var_186_50.z = 0
				var_186_50.x = 0
				var_186_42.localEulerAngles = var_186_50
			end

			local var_186_51 = arg_183_1.actors_["1011ui_story"]
			local var_186_52 = 2

			if var_186_52 < arg_183_1.time_ and arg_183_1.time_ <= var_186_52 + arg_186_0 and arg_183_1.var_.characterEffect1011ui_story == nil then
				arg_183_1.var_.characterEffect1011ui_story = var_186_51:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_53 = 0.2

			if var_186_52 <= arg_183_1.time_ and arg_183_1.time_ < var_186_52 + var_186_53 then
				local var_186_54 = (arg_183_1.time_ - var_186_52) / var_186_53

				if arg_183_1.var_.characterEffect1011ui_story then
					arg_183_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_52 + var_186_53 and arg_183_1.time_ < var_186_52 + var_186_53 + arg_186_0 and arg_183_1.var_.characterEffect1011ui_story then
				arg_183_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_186_55 = 2

			if var_186_55 < arg_183_1.time_ and arg_183_1.time_ <= var_186_55 + arg_186_0 then
				arg_183_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_186_56 = 2

			if var_186_56 < arg_183_1.time_ and arg_183_1.time_ <= var_186_56 + arg_186_0 then
				arg_183_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			if arg_183_1.frameCnt_ <= 1 then
				arg_183_1.dialog_:SetActive(false)
			end

			local var_186_57 = 2.2
			local var_186_58 = 0.225

			if var_186_57 < arg_183_1.time_ and arg_183_1.time_ <= var_186_57 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0

				arg_183_1.dialog_:SetActive(true)

				local var_186_59 = LeanTween.value(arg_183_1.dialog_, 0, 1, 0.3)

				var_186_59:setOnUpdate(LuaHelper.FloatAction(function(arg_187_0)
					arg_183_1.dialogCg_.alpha = arg_187_0
				end))
				var_186_59:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_183_1.dialog_)
					var_186_59:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_183_1.duration_ = arg_183_1.duration_ + 0.3

				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_60 = arg_183_1:FormatText(StoryNameCfg[37].name)

				arg_183_1.leftNameTxt_.text = var_186_60

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_61 = arg_183_1:GetWordFromCfg(110131044)
				local var_186_62 = arg_183_1:FormatText(var_186_61.content)

				arg_183_1.text_.text = var_186_62

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_63 = 9
				local var_186_64 = utf8.len(var_186_62)
				local var_186_65 = var_186_63 <= 0 and var_186_58 or var_186_58 * (var_186_64 / var_186_63)

				if var_186_65 > 0 and var_186_58 < var_186_65 then
					arg_183_1.talkMaxDuration = var_186_65
					var_186_57 = var_186_57 + 0.3

					if var_186_65 + var_186_57 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_65 + var_186_57
					end
				end

				arg_183_1.text_.text = var_186_62
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131044", "story_v_out_110131.awb") ~= 0 then
					local var_186_66 = manager.audio:GetVoiceLength("story_v_out_110131", "110131044", "story_v_out_110131.awb") / 1000

					if var_186_66 + var_186_57 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_66 + var_186_57
					end

					if var_186_61.prefab_name ~= "" and arg_183_1.actors_[var_186_61.prefab_name] ~= nil then
						local var_186_67 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_61.prefab_name].transform, "story_v_out_110131", "110131044", "story_v_out_110131.awb")

						arg_183_1:RecordAudio("110131044", var_186_67)
						arg_183_1:RecordAudio("110131044", var_186_67)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_110131", "110131044", "story_v_out_110131.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_110131", "110131044", "story_v_out_110131.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_68 = var_186_57 + 0.3
			local var_186_69 = math.max(var_186_58, arg_183_1.talkMaxDuration)

			if var_186_68 <= arg_183_1.time_ and arg_183_1.time_ < var_186_68 + var_186_69 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_68) / var_186_69

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_68 + var_186_69 and arg_183_1.time_ < var_186_68 + var_186_69 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play110131045 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 110131045
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play110131046(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1011ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect1011ui_story == nil then
				arg_189_1.var_.characterEffect1011ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.2

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect1011ui_story then
					local var_192_4 = Mathf.Lerp(0, 0.5, var_192_3)

					arg_189_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_189_1.var_.characterEffect1011ui_story.fillRatio = var_192_4
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect1011ui_story then
				local var_192_5 = 0.5

				arg_189_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_189_1.var_.characterEffect1011ui_story.fillRatio = var_192_5
			end

			local var_192_6 = 0
			local var_192_7 = 0.7

			if var_192_6 < arg_189_1.time_ and arg_189_1.time_ <= var_192_6 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_8 = arg_189_1:FormatText(StoryNameCfg[7].name)

				arg_189_1.leftNameTxt_.text = var_192_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_9 = arg_189_1:GetWordFromCfg(110131045)
				local var_192_10 = arg_189_1:FormatText(var_192_9.content)

				arg_189_1.text_.text = var_192_10

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_11 = 28
				local var_192_12 = utf8.len(var_192_10)
				local var_192_13 = var_192_11 <= 0 and var_192_7 or var_192_7 * (var_192_12 / var_192_11)

				if var_192_13 > 0 and var_192_7 < var_192_13 then
					arg_189_1.talkMaxDuration = var_192_13

					if var_192_13 + var_192_6 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_13 + var_192_6
					end
				end

				arg_189_1.text_.text = var_192_10
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_14 = math.max(var_192_7, arg_189_1.talkMaxDuration)

			if var_192_6 <= arg_189_1.time_ and arg_189_1.time_ < var_192_6 + var_192_14 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_6) / var_192_14

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_6 + var_192_14 and arg_189_1.time_ < var_192_6 + var_192_14 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play110131046 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 110131046
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play110131047(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.65

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[7].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(110131046)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 26
				local var_196_6 = utf8.len(var_196_4)
				local var_196_7 = var_196_5 <= 0 and var_196_1 or var_196_1 * (var_196_6 / var_196_5)

				if var_196_7 > 0 and var_196_1 < var_196_7 then
					arg_193_1.talkMaxDuration = var_196_7

					if var_196_7 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_7 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_4
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_8 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_8 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_8

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_8 and arg_193_1.time_ < var_196_0 + var_196_8 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play110131047 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 110131047
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play110131048(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.925

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[7].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(110131047)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 37
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
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_8 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_8 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_8

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_8 and arg_197_1.time_ < var_200_0 + var_200_8 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play110131048 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 110131048
		arg_201_1.duration_ = 8.633

		local var_201_0 = {
			ja = 8.633,
			ko = 6.833,
			zh = 6.966,
			en = 6.7
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
				arg_201_0:Play110131049(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = "A00"

			if arg_201_1.bgs_[var_204_0] == nil then
				local var_204_1 = Object.Instantiate(arg_201_1.paintGo_)

				var_204_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_204_0)
				var_204_1.name = var_204_0
				var_204_1.transform.parent = arg_201_1.stage_.transform
				var_204_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_201_1.bgs_[var_204_0] = var_204_1
			end

			local var_204_2 = 0

			if var_204_2 < arg_201_1.time_ and arg_201_1.time_ <= var_204_2 + arg_204_0 then
				local var_204_3 = manager.ui.mainCamera.transform.localPosition
				local var_204_4 = Vector3.New(0, 0, 10) + Vector3.New(var_204_3.x, var_204_3.y, 0)
				local var_204_5 = arg_201_1.bgs_.A00

				var_204_5.transform.localPosition = var_204_4
				var_204_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_204_6 = var_204_5:GetComponent("SpriteRenderer")

				if var_204_6 and var_204_6.sprite then
					local var_204_7 = (var_204_5.transform.localPosition - var_204_3).z
					local var_204_8 = manager.ui.mainCameraCom_
					local var_204_9 = 2 * var_204_7 * Mathf.Tan(var_204_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_204_10 = var_204_9 * var_204_8.aspect
					local var_204_11 = var_204_6.sprite.bounds.size.x
					local var_204_12 = var_204_6.sprite.bounds.size.y
					local var_204_13 = var_204_10 / var_204_11
					local var_204_14 = var_204_9 / var_204_12
					local var_204_15 = var_204_14 < var_204_13 and var_204_13 or var_204_14

					var_204_5.transform.localScale = Vector3.New(var_204_15, var_204_15, 0)
				end

				for iter_204_0, iter_204_1 in pairs(arg_201_1.bgs_) do
					if iter_204_0 ~= "A00" then
						iter_204_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_204_16 = 0

			if var_204_16 < arg_201_1.time_ and arg_201_1.time_ <= var_204_16 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_17 = 1.5

			if var_204_16 <= arg_201_1.time_ and arg_201_1.time_ < var_204_16 + var_204_17 then
				local var_204_18 = (arg_201_1.time_ - var_204_16) / var_204_17
				local var_204_19 = Color.New(1, 1, 1)

				var_204_19.a = Mathf.Lerp(1, 0, var_204_18)
				arg_201_1.mask_.color = var_204_19
			end

			if arg_201_1.time_ >= var_204_16 + var_204_17 and arg_201_1.time_ < var_204_16 + var_204_17 + arg_204_0 then
				local var_204_20 = Color.New(1, 1, 1)
				local var_204_21 = 0

				arg_201_1.mask_.enabled = false
				var_204_20.a = var_204_21
				arg_201_1.mask_.color = var_204_20
			end

			local var_204_22 = 0

			if var_204_22 < arg_201_1.time_ and arg_201_1.time_ <= var_204_22 + arg_204_0 then
				arg_201_1.screenFilterGo_:SetActive(true)

				arg_201_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_204_23 = 0.5

			if var_204_22 <= arg_201_1.time_ and arg_201_1.time_ < var_204_22 + var_204_23 then
				local var_204_24 = (arg_201_1.time_ - var_204_22) / var_204_23

				arg_201_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_204_24)
			end

			if arg_201_1.time_ >= var_204_22 + var_204_23 and arg_201_1.time_ < var_204_22 + var_204_23 + arg_204_0 then
				arg_201_1.screenFilterEffect_.weight = 1
			end

			local var_204_25 = "1019ui_story"

			if arg_201_1.actors_[var_204_25] == nil then
				local var_204_26 = Object.Instantiate(Asset.Load("Char/" .. var_204_25), arg_201_1.stage_.transform)

				var_204_26.name = var_204_25
				var_204_26.transform.localPosition = Vector3.New(0, 100, 0)
				arg_201_1.actors_[var_204_25] = var_204_26

				local var_204_27 = var_204_26:GetComponentInChildren(typeof(CharacterEffect))

				var_204_27.enabled = true

				local var_204_28 = GameObjectTools.GetOrAddComponent(var_204_26, typeof(DynamicBoneHelper))

				if var_204_28 then
					var_204_28:EnableDynamicBone(false)
				end

				arg_201_1:ShowWeapon(var_204_27.transform, false)

				arg_201_1.var_[var_204_25 .. "Animator"] = var_204_27.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_201_1.var_[var_204_25 .. "Animator"].applyRootMotion = true
				arg_201_1.var_[var_204_25 .. "LipSync"] = var_204_27.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_204_29 = arg_201_1.actors_["1019ui_story"].transform
			local var_204_30 = 1.8

			if var_204_30 < arg_201_1.time_ and arg_201_1.time_ <= var_204_30 + arg_204_0 then
				arg_201_1.var_.moveOldPos1019ui_story = var_204_29.localPosition
			end

			local var_204_31 = 0.001

			if var_204_30 <= arg_201_1.time_ and arg_201_1.time_ < var_204_30 + var_204_31 then
				local var_204_32 = (arg_201_1.time_ - var_204_30) / var_204_31
				local var_204_33 = Vector3.New(0, -1.08, -5.9)

				var_204_29.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1019ui_story, var_204_33, var_204_32)

				local var_204_34 = manager.ui.mainCamera.transform.position - var_204_29.position

				var_204_29.forward = Vector3.New(var_204_34.x, var_204_34.y, var_204_34.z)

				local var_204_35 = var_204_29.localEulerAngles

				var_204_35.z = 0
				var_204_35.x = 0
				var_204_29.localEulerAngles = var_204_35
			end

			if arg_201_1.time_ >= var_204_30 + var_204_31 and arg_201_1.time_ < var_204_30 + var_204_31 + arg_204_0 then
				var_204_29.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_204_36 = manager.ui.mainCamera.transform.position - var_204_29.position

				var_204_29.forward = Vector3.New(var_204_36.x, var_204_36.y, var_204_36.z)

				local var_204_37 = var_204_29.localEulerAngles

				var_204_37.z = 0
				var_204_37.x = 0
				var_204_29.localEulerAngles = var_204_37
			end

			local var_204_38 = 1.8

			if var_204_38 < arg_201_1.time_ and arg_201_1.time_ <= var_204_38 + arg_204_0 then
				arg_201_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_204_39 = 1.8

			if var_204_39 < arg_201_1.time_ and arg_201_1.time_ <= var_204_39 + arg_204_0 then
				arg_201_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_204_40 = arg_201_1.actors_["1019ui_story"]
			local var_204_41 = 1.8

			if var_204_41 < arg_201_1.time_ and arg_201_1.time_ <= var_204_41 + arg_204_0 and arg_201_1.var_.characterEffect1019ui_story == nil then
				arg_201_1.var_.characterEffect1019ui_story = var_204_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_42 = 0.2

			if var_204_41 <= arg_201_1.time_ and arg_201_1.time_ < var_204_41 + var_204_42 then
				local var_204_43 = (arg_201_1.time_ - var_204_41) / var_204_42

				if arg_201_1.var_.characterEffect1019ui_story then
					arg_201_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_41 + var_204_42 and arg_201_1.time_ < var_204_41 + var_204_42 + arg_204_0 and arg_201_1.var_.characterEffect1019ui_story then
				arg_201_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_204_44 = 0

			if var_204_44 < arg_201_1.time_ and arg_201_1.time_ <= var_204_44 + arg_204_0 then
				arg_201_1.allBtn_.enabled = false
			end

			local var_204_45 = 2

			if arg_201_1.time_ >= var_204_44 + var_204_45 and arg_201_1.time_ < var_204_44 + var_204_45 + arg_204_0 then
				arg_201_1.allBtn_.enabled = true
			end

			local var_204_46 = arg_201_1.actors_["1011ui_story"].transform
			local var_204_47 = 0

			if var_204_47 < arg_201_1.time_ and arg_201_1.time_ <= var_204_47 + arg_204_0 then
				arg_201_1.var_.moveOldPos1011ui_story = var_204_46.localPosition
			end

			local var_204_48 = 0.001

			if var_204_47 <= arg_201_1.time_ and arg_201_1.time_ < var_204_47 + var_204_48 then
				local var_204_49 = (arg_201_1.time_ - var_204_47) / var_204_48
				local var_204_50 = Vector3.New(0, 100, 0)

				var_204_46.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1011ui_story, var_204_50, var_204_49)

				local var_204_51 = manager.ui.mainCamera.transform.position - var_204_46.position

				var_204_46.forward = Vector3.New(var_204_51.x, var_204_51.y, var_204_51.z)

				local var_204_52 = var_204_46.localEulerAngles

				var_204_52.z = 0
				var_204_52.x = 0
				var_204_46.localEulerAngles = var_204_52
			end

			if arg_201_1.time_ >= var_204_47 + var_204_48 and arg_201_1.time_ < var_204_47 + var_204_48 + arg_204_0 then
				var_204_46.localPosition = Vector3.New(0, 100, 0)

				local var_204_53 = manager.ui.mainCamera.transform.position - var_204_46.position

				var_204_46.forward = Vector3.New(var_204_53.x, var_204_53.y, var_204_53.z)

				local var_204_54 = var_204_46.localEulerAngles

				var_204_54.z = 0
				var_204_54.x = 0
				var_204_46.localEulerAngles = var_204_54
			end

			if arg_201_1.frameCnt_ <= 1 then
				arg_201_1.dialog_:SetActive(false)
			end

			local var_204_55 = 2
			local var_204_56 = 0.575

			if var_204_55 < arg_201_1.time_ and arg_201_1.time_ <= var_204_55 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0

				arg_201_1.dialog_:SetActive(true)

				local var_204_57 = LeanTween.value(arg_201_1.dialog_, 0, 1, 0.3)

				var_204_57:setOnUpdate(LuaHelper.FloatAction(function(arg_205_0)
					arg_201_1.dialogCg_.alpha = arg_205_0
				end))
				var_204_57:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_201_1.dialog_)
					var_204_57:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_201_1.duration_ = arg_201_1.duration_ + 0.3

				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_58 = arg_201_1:FormatText(StoryNameCfg[13].name)

				arg_201_1.leftNameTxt_.text = var_204_58

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_59 = arg_201_1:GetWordFromCfg(110131048)
				local var_204_60 = arg_201_1:FormatText(var_204_59.content)

				arg_201_1.text_.text = var_204_60

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_61 = 23
				local var_204_62 = utf8.len(var_204_60)
				local var_204_63 = var_204_61 <= 0 and var_204_56 or var_204_56 * (var_204_62 / var_204_61)

				if var_204_63 > 0 and var_204_56 < var_204_63 then
					arg_201_1.talkMaxDuration = var_204_63
					var_204_55 = var_204_55 + 0.3

					if var_204_63 + var_204_55 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_63 + var_204_55
					end
				end

				arg_201_1.text_.text = var_204_60
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131048", "story_v_out_110131.awb") ~= 0 then
					local var_204_64 = manager.audio:GetVoiceLength("story_v_out_110131", "110131048", "story_v_out_110131.awb") / 1000

					if var_204_64 + var_204_55 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_64 + var_204_55
					end

					if var_204_59.prefab_name ~= "" and arg_201_1.actors_[var_204_59.prefab_name] ~= nil then
						local var_204_65 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_59.prefab_name].transform, "story_v_out_110131", "110131048", "story_v_out_110131.awb")

						arg_201_1:RecordAudio("110131048", var_204_65)
						arg_201_1:RecordAudio("110131048", var_204_65)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_110131", "110131048", "story_v_out_110131.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_110131", "110131048", "story_v_out_110131.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_66 = var_204_55 + 0.3
			local var_204_67 = math.max(var_204_56, arg_201_1.talkMaxDuration)

			if var_204_66 <= arg_201_1.time_ and arg_201_1.time_ < var_204_66 + var_204_67 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_66) / var_204_67

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_66 + var_204_67 and arg_201_1.time_ < var_204_66 + var_204_67 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play110131049 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 110131049
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play110131050(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1019ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1019ui_story == nil then
				arg_207_1.var_.characterEffect1019ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.2

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1019ui_story then
					local var_210_4 = Mathf.Lerp(0, 0.5, var_210_3)

					arg_207_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1019ui_story.fillRatio = var_210_4
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1019ui_story then
				local var_210_5 = 0.5

				arg_207_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1019ui_story.fillRatio = var_210_5
			end

			local var_210_6 = 0
			local var_210_7 = 0.075

			if var_210_6 < arg_207_1.time_ and arg_207_1.time_ <= var_210_6 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_8 = arg_207_1:FormatText(StoryNameCfg[7].name)

				arg_207_1.leftNameTxt_.text = var_210_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_9 = arg_207_1:GetWordFromCfg(110131049)
				local var_210_10 = arg_207_1:FormatText(var_210_9.content)

				arg_207_1.text_.text = var_210_10

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_11 = 3
				local var_210_12 = utf8.len(var_210_10)
				local var_210_13 = var_210_11 <= 0 and var_210_7 or var_210_7 * (var_210_12 / var_210_11)

				if var_210_13 > 0 and var_210_7 < var_210_13 then
					arg_207_1.talkMaxDuration = var_210_13

					if var_210_13 + var_210_6 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_13 + var_210_6
					end
				end

				arg_207_1.text_.text = var_210_10
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_14 = math.max(var_210_7, arg_207_1.talkMaxDuration)

			if var_210_6 <= arg_207_1.time_ and arg_207_1.time_ < var_210_6 + var_210_14 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_6) / var_210_14

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_6 + var_210_14 and arg_207_1.time_ < var_210_6 + var_210_14 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play110131050 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 110131050
		arg_211_1.duration_ = 12

		local var_211_0 = {
			ja = 12,
			ko = 10.333,
			zh = 9.8,
			en = 10.833
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
				arg_211_0:Play110131051(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_214_2 = arg_211_1.actors_["1019ui_story"]
			local var_214_3 = 0

			if var_214_3 < arg_211_1.time_ and arg_211_1.time_ <= var_214_3 + arg_214_0 and arg_211_1.var_.characterEffect1019ui_story == nil then
				arg_211_1.var_.characterEffect1019ui_story = var_214_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_4 = 0.2

			if var_214_3 <= arg_211_1.time_ and arg_211_1.time_ < var_214_3 + var_214_4 then
				local var_214_5 = (arg_211_1.time_ - var_214_3) / var_214_4

				if arg_211_1.var_.characterEffect1019ui_story then
					arg_211_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_3 + var_214_4 and arg_211_1.time_ < var_214_3 + var_214_4 + arg_214_0 and arg_211_1.var_.characterEffect1019ui_story then
				arg_211_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_214_6 = 0
			local var_214_7 = 1.05

			if var_214_6 < arg_211_1.time_ and arg_211_1.time_ <= var_214_6 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_8 = arg_211_1:FormatText(StoryNameCfg[13].name)

				arg_211_1.leftNameTxt_.text = var_214_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_9 = arg_211_1:GetWordFromCfg(110131050)
				local var_214_10 = arg_211_1:FormatText(var_214_9.content)

				arg_211_1.text_.text = var_214_10

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_11 = 42
				local var_214_12 = utf8.len(var_214_10)
				local var_214_13 = var_214_11 <= 0 and var_214_7 or var_214_7 * (var_214_12 / var_214_11)

				if var_214_13 > 0 and var_214_7 < var_214_13 then
					arg_211_1.talkMaxDuration = var_214_13

					if var_214_13 + var_214_6 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_13 + var_214_6
					end
				end

				arg_211_1.text_.text = var_214_10
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131050", "story_v_out_110131.awb") ~= 0 then
					local var_214_14 = manager.audio:GetVoiceLength("story_v_out_110131", "110131050", "story_v_out_110131.awb") / 1000

					if var_214_14 + var_214_6 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_14 + var_214_6
					end

					if var_214_9.prefab_name ~= "" and arg_211_1.actors_[var_214_9.prefab_name] ~= nil then
						local var_214_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_9.prefab_name].transform, "story_v_out_110131", "110131050", "story_v_out_110131.awb")

						arg_211_1:RecordAudio("110131050", var_214_15)
						arg_211_1:RecordAudio("110131050", var_214_15)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_110131", "110131050", "story_v_out_110131.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_110131", "110131050", "story_v_out_110131.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_16 = math.max(var_214_7, arg_211_1.talkMaxDuration)

			if var_214_6 <= arg_211_1.time_ and arg_211_1.time_ < var_214_6 + var_214_16 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_6) / var_214_16

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_6 + var_214_16 and arg_211_1.time_ < var_214_6 + var_214_16 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play110131051 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 110131051
		arg_215_1.duration_ = 7.666

		local var_215_0 = {
			ja = 7.666,
			ko = 5.333,
			zh = 5.5,
			en = 4.5
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
				arg_215_0:Play110131052(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_218_1 = 0
			local var_218_2 = 0.65

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_3 = arg_215_1:FormatText(StoryNameCfg[13].name)

				arg_215_1.leftNameTxt_.text = var_218_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_4 = arg_215_1:GetWordFromCfg(110131051)
				local var_218_5 = arg_215_1:FormatText(var_218_4.content)

				arg_215_1.text_.text = var_218_5

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_6 = 26
				local var_218_7 = utf8.len(var_218_5)
				local var_218_8 = var_218_6 <= 0 and var_218_2 or var_218_2 * (var_218_7 / var_218_6)

				if var_218_8 > 0 and var_218_2 < var_218_8 then
					arg_215_1.talkMaxDuration = var_218_8

					if var_218_8 + var_218_1 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_1
					end
				end

				arg_215_1.text_.text = var_218_5
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131051", "story_v_out_110131.awb") ~= 0 then
					local var_218_9 = manager.audio:GetVoiceLength("story_v_out_110131", "110131051", "story_v_out_110131.awb") / 1000

					if var_218_9 + var_218_1 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_9 + var_218_1
					end

					if var_218_4.prefab_name ~= "" and arg_215_1.actors_[var_218_4.prefab_name] ~= nil then
						local var_218_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_4.prefab_name].transform, "story_v_out_110131", "110131051", "story_v_out_110131.awb")

						arg_215_1:RecordAudio("110131051", var_218_10)
						arg_215_1:RecordAudio("110131051", var_218_10)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_110131", "110131051", "story_v_out_110131.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_110131", "110131051", "story_v_out_110131.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_11 = math.max(var_218_2, arg_215_1.talkMaxDuration)

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_11 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_1) / var_218_11

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_1 + var_218_11 and arg_215_1.time_ < var_218_1 + var_218_11 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play110131052 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 110131052
		arg_219_1.duration_ = 13.566

		local var_219_0 = {
			ja = 8.033,
			ko = 11.766,
			zh = 13.566,
			en = 11.6
		}
		local var_219_1 = manager.audio:GetLocalizationFlag()

		if var_219_0[var_219_1] ~= nil then
			arg_219_1.duration_ = var_219_0[var_219_1]
		end

		SetActive(arg_219_1.tipsGo_, false)

		function arg_219_1.onSingleLineFinish_()
			arg_219_1.onSingleLineUpdate_ = nil
			arg_219_1.onSingleLineFinish_ = nil
			arg_219_1.state_ = "waiting"
		end

		function arg_219_1.playNext_(arg_221_0)
			if arg_221_0 == 1 then
				arg_219_0:Play110131053(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_222_1 = 0
			local var_222_2 = 1.425

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_3 = arg_219_1:FormatText(StoryNameCfg[13].name)

				arg_219_1.leftNameTxt_.text = var_222_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_4 = arg_219_1:GetWordFromCfg(110131052)
				local var_222_5 = arg_219_1:FormatText(var_222_4.content)

				arg_219_1.text_.text = var_222_5

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_6 = 57
				local var_222_7 = utf8.len(var_222_5)
				local var_222_8 = var_222_6 <= 0 and var_222_2 or var_222_2 * (var_222_7 / var_222_6)

				if var_222_8 > 0 and var_222_2 < var_222_8 then
					arg_219_1.talkMaxDuration = var_222_8

					if var_222_8 + var_222_1 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_1
					end
				end

				arg_219_1.text_.text = var_222_5
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131052", "story_v_out_110131.awb") ~= 0 then
					local var_222_9 = manager.audio:GetVoiceLength("story_v_out_110131", "110131052", "story_v_out_110131.awb") / 1000

					if var_222_9 + var_222_1 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_9 + var_222_1
					end

					if var_222_4.prefab_name ~= "" and arg_219_1.actors_[var_222_4.prefab_name] ~= nil then
						local var_222_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_4.prefab_name].transform, "story_v_out_110131", "110131052", "story_v_out_110131.awb")

						arg_219_1:RecordAudio("110131052", var_222_10)
						arg_219_1:RecordAudio("110131052", var_222_10)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_110131", "110131052", "story_v_out_110131.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_110131", "110131052", "story_v_out_110131.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_11 = math.max(var_222_2, arg_219_1.talkMaxDuration)

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_11 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_1) / var_222_11

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_1 + var_222_11 and arg_219_1.time_ < var_222_1 + var_222_11 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play110131053 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 110131053
		arg_223_1.duration_ = 8.066

		local var_223_0 = {
			ja = 8.066,
			ko = 6.166,
			zh = 7.133,
			en = 6.666
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
				arg_223_0:Play110131054(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action452")
			end

			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_226_2 = 0
			local var_226_3 = 0.9

			if var_226_2 < arg_223_1.time_ and arg_223_1.time_ <= var_226_2 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_4 = arg_223_1:FormatText(StoryNameCfg[13].name)

				arg_223_1.leftNameTxt_.text = var_226_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_5 = arg_223_1:GetWordFromCfg(110131053)
				local var_226_6 = arg_223_1:FormatText(var_226_5.content)

				arg_223_1.text_.text = var_226_6

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_7 = 36
				local var_226_8 = utf8.len(var_226_6)
				local var_226_9 = var_226_7 <= 0 and var_226_3 or var_226_3 * (var_226_8 / var_226_7)

				if var_226_9 > 0 and var_226_3 < var_226_9 then
					arg_223_1.talkMaxDuration = var_226_9

					if var_226_9 + var_226_2 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_9 + var_226_2
					end
				end

				arg_223_1.text_.text = var_226_6
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131053", "story_v_out_110131.awb") ~= 0 then
					local var_226_10 = manager.audio:GetVoiceLength("story_v_out_110131", "110131053", "story_v_out_110131.awb") / 1000

					if var_226_10 + var_226_2 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_10 + var_226_2
					end

					if var_226_5.prefab_name ~= "" and arg_223_1.actors_[var_226_5.prefab_name] ~= nil then
						local var_226_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_5.prefab_name].transform, "story_v_out_110131", "110131053", "story_v_out_110131.awb")

						arg_223_1:RecordAudio("110131053", var_226_11)
						arg_223_1:RecordAudio("110131053", var_226_11)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_110131", "110131053", "story_v_out_110131.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_110131", "110131053", "story_v_out_110131.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_12 = math.max(var_226_3, arg_223_1.talkMaxDuration)

			if var_226_2 <= arg_223_1.time_ and arg_223_1.time_ < var_226_2 + var_226_12 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_2) / var_226_12

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_2 + var_226_12 and arg_223_1.time_ < var_226_2 + var_226_12 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play110131054 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 110131054
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play110131055(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1019ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1019ui_story == nil then
				arg_227_1.var_.characterEffect1019ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.2

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1019ui_story then
					local var_230_4 = Mathf.Lerp(0, 0.5, var_230_3)

					arg_227_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1019ui_story.fillRatio = var_230_4
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1019ui_story then
				local var_230_5 = 0.5

				arg_227_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1019ui_story.fillRatio = var_230_5
			end

			local var_230_6 = 0
			local var_230_7 = 0.1

			if var_230_6 < arg_227_1.time_ and arg_227_1.time_ <= var_230_6 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_8 = arg_227_1:FormatText(StoryNameCfg[7].name)

				arg_227_1.leftNameTxt_.text = var_230_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_9 = arg_227_1:GetWordFromCfg(110131054)
				local var_230_10 = arg_227_1:FormatText(var_230_9.content)

				arg_227_1.text_.text = var_230_10

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_11 = 4
				local var_230_12 = utf8.len(var_230_10)
				local var_230_13 = var_230_11 <= 0 and var_230_7 or var_230_7 * (var_230_12 / var_230_11)

				if var_230_13 > 0 and var_230_7 < var_230_13 then
					arg_227_1.talkMaxDuration = var_230_13

					if var_230_13 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_13 + var_230_6
					end
				end

				arg_227_1.text_.text = var_230_10
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_14 = math.max(var_230_7, arg_227_1.talkMaxDuration)

			if var_230_6 <= arg_227_1.time_ and arg_227_1.time_ < var_230_6 + var_230_14 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_6) / var_230_14

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_6 + var_230_14 and arg_227_1.time_ < var_230_6 + var_230_14 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play110131055 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 110131055
		arg_231_1.duration_ = 13.433

		local var_231_0 = {
			ja = 11.7,
			ko = 8.233,
			zh = 10.933,
			en = 13.433
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
				arg_231_0:Play110131056(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1019ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1019ui_story == nil then
				arg_231_1.var_.characterEffect1019ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.2

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1019ui_story then
					arg_231_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1019ui_story then
				arg_231_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_234_4 = 0

			if var_234_4 < arg_231_1.time_ and arg_231_1.time_ <= var_234_4 + arg_234_0 then
				arg_231_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_234_5 = 0
			local var_234_6 = 1.375

			if var_234_5 < arg_231_1.time_ and arg_231_1.time_ <= var_234_5 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_7 = arg_231_1:FormatText(StoryNameCfg[13].name)

				arg_231_1.leftNameTxt_.text = var_234_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_8 = arg_231_1:GetWordFromCfg(110131055)
				local var_234_9 = arg_231_1:FormatText(var_234_8.content)

				arg_231_1.text_.text = var_234_9

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_10 = 55
				local var_234_11 = utf8.len(var_234_9)
				local var_234_12 = var_234_10 <= 0 and var_234_6 or var_234_6 * (var_234_11 / var_234_10)

				if var_234_12 > 0 and var_234_6 < var_234_12 then
					arg_231_1.talkMaxDuration = var_234_12

					if var_234_12 + var_234_5 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_12 + var_234_5
					end
				end

				arg_231_1.text_.text = var_234_9
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131055", "story_v_out_110131.awb") ~= 0 then
					local var_234_13 = manager.audio:GetVoiceLength("story_v_out_110131", "110131055", "story_v_out_110131.awb") / 1000

					if var_234_13 + var_234_5 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_13 + var_234_5
					end

					if var_234_8.prefab_name ~= "" and arg_231_1.actors_[var_234_8.prefab_name] ~= nil then
						local var_234_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_8.prefab_name].transform, "story_v_out_110131", "110131055", "story_v_out_110131.awb")

						arg_231_1:RecordAudio("110131055", var_234_14)
						arg_231_1:RecordAudio("110131055", var_234_14)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_110131", "110131055", "story_v_out_110131.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_110131", "110131055", "story_v_out_110131.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_15 = math.max(var_234_6, arg_231_1.talkMaxDuration)

			if var_234_5 <= arg_231_1.time_ and arg_231_1.time_ < var_234_5 + var_234_15 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_5) / var_234_15

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_5 + var_234_15 and arg_231_1.time_ < var_234_5 + var_234_15 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play110131056 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 110131056
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play110131057(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1019ui_story"]
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 and arg_235_1.var_.characterEffect1019ui_story == nil then
				arg_235_1.var_.characterEffect1019ui_story = var_238_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_2 = 0.2

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2

				if arg_235_1.var_.characterEffect1019ui_story then
					local var_238_4 = Mathf.Lerp(0, 0.5, var_238_3)

					arg_235_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_235_1.var_.characterEffect1019ui_story.fillRatio = var_238_4
				end
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 and arg_235_1.var_.characterEffect1019ui_story then
				local var_238_5 = 0.5

				arg_235_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_235_1.var_.characterEffect1019ui_story.fillRatio = var_238_5
			end

			local var_238_6 = 0
			local var_238_7 = 0.15

			if var_238_6 < arg_235_1.time_ and arg_235_1.time_ <= var_238_6 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_8 = arg_235_1:FormatText(StoryNameCfg[7].name)

				arg_235_1.leftNameTxt_.text = var_238_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_9 = arg_235_1:GetWordFromCfg(110131056)
				local var_238_10 = arg_235_1:FormatText(var_238_9.content)

				arg_235_1.text_.text = var_238_10

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_11 = 6
				local var_238_12 = utf8.len(var_238_10)
				local var_238_13 = var_238_11 <= 0 and var_238_7 or var_238_7 * (var_238_12 / var_238_11)

				if var_238_13 > 0 and var_238_7 < var_238_13 then
					arg_235_1.talkMaxDuration = var_238_13

					if var_238_13 + var_238_6 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_13 + var_238_6
					end
				end

				arg_235_1.text_.text = var_238_10
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_14 = math.max(var_238_7, arg_235_1.talkMaxDuration)

			if var_238_6 <= arg_235_1.time_ and arg_235_1.time_ < var_238_6 + var_238_14 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_6) / var_238_14

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_6 + var_238_14 and arg_235_1.time_ < var_238_6 + var_238_14 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play110131057 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 110131057
		arg_239_1.duration_ = 9.966

		local var_239_0 = {
			ja = 6.766,
			ko = 8.666,
			zh = 7.3,
			en = 9.966
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
				arg_239_0:Play110131058(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019actionlink/1019action425")
			end

			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_242_2 = arg_239_1.actors_["1019ui_story"]
			local var_242_3 = 0

			if var_242_3 < arg_239_1.time_ and arg_239_1.time_ <= var_242_3 + arg_242_0 and arg_239_1.var_.characterEffect1019ui_story == nil then
				arg_239_1.var_.characterEffect1019ui_story = var_242_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_4 = 0.2

			if var_242_3 <= arg_239_1.time_ and arg_239_1.time_ < var_242_3 + var_242_4 then
				local var_242_5 = (arg_239_1.time_ - var_242_3) / var_242_4

				if arg_239_1.var_.characterEffect1019ui_story then
					arg_239_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_3 + var_242_4 and arg_239_1.time_ < var_242_3 + var_242_4 + arg_242_0 and arg_239_1.var_.characterEffect1019ui_story then
				arg_239_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_242_6 = 0
			local var_242_7 = 0.775

			if var_242_6 < arg_239_1.time_ and arg_239_1.time_ <= var_242_6 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_8 = arg_239_1:FormatText(StoryNameCfg[13].name)

				arg_239_1.leftNameTxt_.text = var_242_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_9 = arg_239_1:GetWordFromCfg(110131057)
				local var_242_10 = arg_239_1:FormatText(var_242_9.content)

				arg_239_1.text_.text = var_242_10

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_11 = 31
				local var_242_12 = utf8.len(var_242_10)
				local var_242_13 = var_242_11 <= 0 and var_242_7 or var_242_7 * (var_242_12 / var_242_11)

				if var_242_13 > 0 and var_242_7 < var_242_13 then
					arg_239_1.talkMaxDuration = var_242_13

					if var_242_13 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_13 + var_242_6
					end
				end

				arg_239_1.text_.text = var_242_10
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131057", "story_v_out_110131.awb") ~= 0 then
					local var_242_14 = manager.audio:GetVoiceLength("story_v_out_110131", "110131057", "story_v_out_110131.awb") / 1000

					if var_242_14 + var_242_6 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_14 + var_242_6
					end

					if var_242_9.prefab_name ~= "" and arg_239_1.actors_[var_242_9.prefab_name] ~= nil then
						local var_242_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_9.prefab_name].transform, "story_v_out_110131", "110131057", "story_v_out_110131.awb")

						arg_239_1:RecordAudio("110131057", var_242_15)
						arg_239_1:RecordAudio("110131057", var_242_15)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_110131", "110131057", "story_v_out_110131.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_110131", "110131057", "story_v_out_110131.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_16 = math.max(var_242_7, arg_239_1.talkMaxDuration)

			if var_242_6 <= arg_239_1.time_ and arg_239_1.time_ < var_242_6 + var_242_16 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_6) / var_242_16

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_6 + var_242_16 and arg_239_1.time_ < var_242_6 + var_242_16 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play110131058 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 110131058
		arg_243_1.duration_ = 9.066

		local var_243_0 = {
			ja = 4.933,
			ko = 7.433,
			zh = 9.066,
			en = 7.333
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
				arg_243_0:Play110131059(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.mask_.enabled = true
				arg_243_1.mask_.raycastTarget = true

				arg_243_1:SetGaussion(false)
			end

			local var_246_1 = 1.5

			if var_246_0 <= arg_243_1.time_ and arg_243_1.time_ < var_246_0 + var_246_1 then
				local var_246_2 = (arg_243_1.time_ - var_246_0) / var_246_1
				local var_246_3 = Color.New(1, 1, 1)

				var_246_3.a = Mathf.Lerp(1, 0, var_246_2)
				arg_243_1.mask_.color = var_246_3
			end

			if arg_243_1.time_ >= var_246_0 + var_246_1 and arg_243_1.time_ < var_246_0 + var_246_1 + arg_246_0 then
				local var_246_4 = Color.New(1, 1, 1)
				local var_246_5 = 0

				arg_243_1.mask_.enabled = false
				var_246_4.a = var_246_5
				arg_243_1.mask_.color = var_246_4
			end

			local var_246_6 = arg_243_1.actors_["1019ui_story"].transform
			local var_246_7 = 0

			if var_246_7 < arg_243_1.time_ and arg_243_1.time_ <= var_246_7 + arg_246_0 then
				arg_243_1.var_.moveOldPos1019ui_story = var_246_6.localPosition
			end

			local var_246_8 = 0.001

			if var_246_7 <= arg_243_1.time_ and arg_243_1.time_ < var_246_7 + var_246_8 then
				local var_246_9 = (arg_243_1.time_ - var_246_7) / var_246_8
				local var_246_10 = Vector3.New(0, 100, 0)

				var_246_6.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1019ui_story, var_246_10, var_246_9)

				local var_246_11 = manager.ui.mainCamera.transform.position - var_246_6.position

				var_246_6.forward = Vector3.New(var_246_11.x, var_246_11.y, var_246_11.z)

				local var_246_12 = var_246_6.localEulerAngles

				var_246_12.z = 0
				var_246_12.x = 0
				var_246_6.localEulerAngles = var_246_12
			end

			if arg_243_1.time_ >= var_246_7 + var_246_8 and arg_243_1.time_ < var_246_7 + var_246_8 + arg_246_0 then
				var_246_6.localPosition = Vector3.New(0, 100, 0)

				local var_246_13 = manager.ui.mainCamera.transform.position - var_246_6.position

				var_246_6.forward = Vector3.New(var_246_13.x, var_246_13.y, var_246_13.z)

				local var_246_14 = var_246_6.localEulerAngles

				var_246_14.z = 0
				var_246_14.x = 0
				var_246_6.localEulerAngles = var_246_14
			end

			local var_246_15 = 0

			if var_246_15 < arg_243_1.time_ and arg_243_1.time_ <= var_246_15 + arg_246_0 then
				local var_246_16 = manager.ui.mainCamera.transform.localPosition
				local var_246_17 = Vector3.New(0, 0, 10) + Vector3.New(var_246_16.x, var_246_16.y, 0)
				local var_246_18 = arg_243_1.bgs_.ST19

				var_246_18.transform.localPosition = var_246_17
				var_246_18.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_246_19 = var_246_18:GetComponent("SpriteRenderer")

				if var_246_19 and var_246_19.sprite then
					local var_246_20 = (var_246_18.transform.localPosition - var_246_16).z
					local var_246_21 = manager.ui.mainCameraCom_
					local var_246_22 = 2 * var_246_20 * Mathf.Tan(var_246_21.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_246_23 = var_246_22 * var_246_21.aspect
					local var_246_24 = var_246_19.sprite.bounds.size.x
					local var_246_25 = var_246_19.sprite.bounds.size.y
					local var_246_26 = var_246_23 / var_246_24
					local var_246_27 = var_246_22 / var_246_25
					local var_246_28 = var_246_27 < var_246_26 and var_246_26 or var_246_27

					var_246_18.transform.localScale = Vector3.New(var_246_28, var_246_28, 0)
				end

				for iter_246_0, iter_246_1 in pairs(arg_243_1.bgs_) do
					if iter_246_0 ~= "ST19" then
						iter_246_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_246_29 = arg_243_1.actors_["1011ui_story"].transform
			local var_246_30 = 1.8

			if var_246_30 < arg_243_1.time_ and arg_243_1.time_ <= var_246_30 + arg_246_0 then
				arg_243_1.var_.moveOldPos1011ui_story = var_246_29.localPosition
			end

			local var_246_31 = 0.001

			if var_246_30 <= arg_243_1.time_ and arg_243_1.time_ < var_246_30 + var_246_31 then
				local var_246_32 = (arg_243_1.time_ - var_246_30) / var_246_31
				local var_246_33 = Vector3.New(0, -0.71, -6)

				var_246_29.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1011ui_story, var_246_33, var_246_32)

				local var_246_34 = manager.ui.mainCamera.transform.position - var_246_29.position

				var_246_29.forward = Vector3.New(var_246_34.x, var_246_34.y, var_246_34.z)

				local var_246_35 = var_246_29.localEulerAngles

				var_246_35.z = 0
				var_246_35.x = 0
				var_246_29.localEulerAngles = var_246_35
			end

			if arg_243_1.time_ >= var_246_30 + var_246_31 and arg_243_1.time_ < var_246_30 + var_246_31 + arg_246_0 then
				var_246_29.localPosition = Vector3.New(0, -0.71, -6)

				local var_246_36 = manager.ui.mainCamera.transform.position - var_246_29.position

				var_246_29.forward = Vector3.New(var_246_36.x, var_246_36.y, var_246_36.z)

				local var_246_37 = var_246_29.localEulerAngles

				var_246_37.z = 0
				var_246_37.x = 0
				var_246_29.localEulerAngles = var_246_37
			end

			local var_246_38 = 1.8

			if var_246_38 < arg_243_1.time_ and arg_243_1.time_ <= var_246_38 + arg_246_0 then
				arg_243_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_246_39 = 1.8

			if var_246_39 < arg_243_1.time_ and arg_243_1.time_ <= var_246_39 + arg_246_0 then
				arg_243_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_246_40 = arg_243_1.actors_["1011ui_story"]
			local var_246_41 = 1.8

			if var_246_41 < arg_243_1.time_ and arg_243_1.time_ <= var_246_41 + arg_246_0 and arg_243_1.var_.characterEffect1011ui_story == nil then
				arg_243_1.var_.characterEffect1011ui_story = var_246_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_42 = 0.2

			if var_246_41 <= arg_243_1.time_ and arg_243_1.time_ < var_246_41 + var_246_42 then
				local var_246_43 = (arg_243_1.time_ - var_246_41) / var_246_42

				if arg_243_1.var_.characterEffect1011ui_story then
					arg_243_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_41 + var_246_42 and arg_243_1.time_ < var_246_41 + var_246_42 + arg_246_0 and arg_243_1.var_.characterEffect1011ui_story then
				arg_243_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_246_44 = 0

			if var_246_44 < arg_243_1.time_ and arg_243_1.time_ <= var_246_44 + arg_246_0 then
				arg_243_1.screenFilterGo_:SetActive(false)
			end

			local var_246_45 = 1.5

			if var_246_44 <= arg_243_1.time_ and arg_243_1.time_ < var_246_44 + var_246_45 then
				local var_246_46 = (arg_243_1.time_ - var_246_44) / var_246_45

				arg_243_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_246_46)
			end

			if arg_243_1.time_ >= var_246_44 + var_246_45 and arg_243_1.time_ < var_246_44 + var_246_45 + arg_246_0 then
				arg_243_1.screenFilterEffect_.weight = 0
			end

			local var_246_47 = 0

			if var_246_47 < arg_243_1.time_ and arg_243_1.time_ <= var_246_47 + arg_246_0 then
				arg_243_1.allBtn_.enabled = false
			end

			local var_246_48 = 2

			if arg_243_1.time_ >= var_246_47 + var_246_48 and arg_243_1.time_ < var_246_47 + var_246_48 + arg_246_0 then
				arg_243_1.allBtn_.enabled = true
			end

			if arg_243_1.frameCnt_ <= 1 then
				arg_243_1.dialog_:SetActive(false)
			end

			local var_246_49 = 2
			local var_246_50 = 0.525

			if var_246_49 < arg_243_1.time_ and arg_243_1.time_ <= var_246_49 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0

				arg_243_1.dialog_:SetActive(true)

				local var_246_51 = LeanTween.value(arg_243_1.dialog_, 0, 1, 0.3)

				var_246_51:setOnUpdate(LuaHelper.FloatAction(function(arg_247_0)
					arg_243_1.dialogCg_.alpha = arg_247_0
				end))
				var_246_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_243_1.dialog_)
					var_246_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_243_1.duration_ = arg_243_1.duration_ + 0.3

				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_52 = arg_243_1:FormatText(StoryNameCfg[37].name)

				arg_243_1.leftNameTxt_.text = var_246_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_53 = arg_243_1:GetWordFromCfg(110131058)
				local var_246_54 = arg_243_1:FormatText(var_246_53.content)

				arg_243_1.text_.text = var_246_54

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_55 = 21
				local var_246_56 = utf8.len(var_246_54)
				local var_246_57 = var_246_55 <= 0 and var_246_50 or var_246_50 * (var_246_56 / var_246_55)

				if var_246_57 > 0 and var_246_50 < var_246_57 then
					arg_243_1.talkMaxDuration = var_246_57
					var_246_49 = var_246_49 + 0.3

					if var_246_57 + var_246_49 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_57 + var_246_49
					end
				end

				arg_243_1.text_.text = var_246_54
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131058", "story_v_out_110131.awb") ~= 0 then
					local var_246_58 = manager.audio:GetVoiceLength("story_v_out_110131", "110131058", "story_v_out_110131.awb") / 1000

					if var_246_58 + var_246_49 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_58 + var_246_49
					end

					if var_246_53.prefab_name ~= "" and arg_243_1.actors_[var_246_53.prefab_name] ~= nil then
						local var_246_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_53.prefab_name].transform, "story_v_out_110131", "110131058", "story_v_out_110131.awb")

						arg_243_1:RecordAudio("110131058", var_246_59)
						arg_243_1:RecordAudio("110131058", var_246_59)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_110131", "110131058", "story_v_out_110131.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_110131", "110131058", "story_v_out_110131.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_60 = var_246_49 + 0.3
			local var_246_61 = math.max(var_246_50, arg_243_1.talkMaxDuration)

			if var_246_60 <= arg_243_1.time_ and arg_243_1.time_ < var_246_60 + var_246_61 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_60) / var_246_61

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_60 + var_246_61 and arg_243_1.time_ < var_246_60 + var_246_61 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play110131059 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 110131059
		arg_249_1.duration_ = 4.133

		local var_249_0 = {
			ja = 4.133,
			ko = 3.7,
			zh = 3.266,
			en = 2.3
		}
		local var_249_1 = manager.audio:GetLocalizationFlag()

		if var_249_0[var_249_1] ~= nil then
			arg_249_1.duration_ = var_249_0[var_249_1]
		end

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play110131060(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_252_1 = 0
			local var_252_2 = 0.375

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_3 = arg_249_1:FormatText(StoryNameCfg[37].name)

				arg_249_1.leftNameTxt_.text = var_252_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_4 = arg_249_1:GetWordFromCfg(110131059)
				local var_252_5 = arg_249_1:FormatText(var_252_4.content)

				arg_249_1.text_.text = var_252_5

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_6 = 14
				local var_252_7 = utf8.len(var_252_5)
				local var_252_8 = var_252_6 <= 0 and var_252_2 or var_252_2 * (var_252_7 / var_252_6)

				if var_252_8 > 0 and var_252_2 < var_252_8 then
					arg_249_1.talkMaxDuration = var_252_8

					if var_252_8 + var_252_1 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_1
					end
				end

				arg_249_1.text_.text = var_252_5
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131059", "story_v_out_110131.awb") ~= 0 then
					local var_252_9 = manager.audio:GetVoiceLength("story_v_out_110131", "110131059", "story_v_out_110131.awb") / 1000

					if var_252_9 + var_252_1 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_9 + var_252_1
					end

					if var_252_4.prefab_name ~= "" and arg_249_1.actors_[var_252_4.prefab_name] ~= nil then
						local var_252_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_4.prefab_name].transform, "story_v_out_110131", "110131059", "story_v_out_110131.awb")

						arg_249_1:RecordAudio("110131059", var_252_10)
						arg_249_1:RecordAudio("110131059", var_252_10)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_110131", "110131059", "story_v_out_110131.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_110131", "110131059", "story_v_out_110131.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_11 = math.max(var_252_2, arg_249_1.talkMaxDuration)

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_11 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_1) / var_252_11

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_1 + var_252_11 and arg_249_1.time_ < var_252_1 + var_252_11 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play110131060 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 110131060
		arg_253_1.duration_ = 5

		SetActive(arg_253_1.tipsGo_, false)

		function arg_253_1.onSingleLineFinish_()
			arg_253_1.onSingleLineUpdate_ = nil
			arg_253_1.onSingleLineFinish_ = nil
			arg_253_1.state_ = "waiting"
		end

		function arg_253_1.playNext_(arg_255_0)
			if arg_255_0 == 1 then
				arg_253_0:Play110131061(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1011ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1011ui_story == nil then
				arg_253_1.var_.characterEffect1011ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.2

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1011ui_story then
					local var_256_4 = Mathf.Lerp(0, 0.5, var_256_3)

					arg_253_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_253_1.var_.characterEffect1011ui_story.fillRatio = var_256_4
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1011ui_story then
				local var_256_5 = 0.5

				arg_253_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_253_1.var_.characterEffect1011ui_story.fillRatio = var_256_5
			end

			local var_256_6 = 0
			local var_256_7 = 0.775

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_8 = arg_253_1:FormatText(StoryNameCfg[7].name)

				arg_253_1.leftNameTxt_.text = var_256_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_9 = arg_253_1:GetWordFromCfg(110131060)
				local var_256_10 = arg_253_1:FormatText(var_256_9.content)

				arg_253_1.text_.text = var_256_10

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_11 = 31
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
				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_14 = math.max(var_256_7, arg_253_1.talkMaxDuration)

			if var_256_6 <= arg_253_1.time_ and arg_253_1.time_ < var_256_6 + var_256_14 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_6) / var_256_14

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_6 + var_256_14 and arg_253_1.time_ < var_256_6 + var_256_14 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play110131061 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 110131061
		arg_257_1.duration_ = 5

		SetActive(arg_257_1.tipsGo_, false)

		function arg_257_1.onSingleLineFinish_()
			arg_257_1.onSingleLineUpdate_ = nil
			arg_257_1.onSingleLineFinish_ = nil
			arg_257_1.state_ = "waiting"
		end

		function arg_257_1.playNext_(arg_259_0)
			if arg_259_0 == 1 then
				arg_257_0:Play110131062(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 1.425

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[7].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(110131061)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 57
				local var_260_6 = utf8.len(var_260_4)
				local var_260_7 = var_260_5 <= 0 and var_260_1 or var_260_1 * (var_260_6 / var_260_5)

				if var_260_7 > 0 and var_260_1 < var_260_7 then
					arg_257_1.talkMaxDuration = var_260_7

					if var_260_7 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_7 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_4
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)
				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_8 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_8 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_8

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_8 and arg_257_1.time_ < var_260_0 + var_260_8 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play110131062 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 110131062
		arg_261_1.duration_ = 5

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play110131063(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = 0
			local var_264_1 = 1.25

			if var_264_0 < arg_261_1.time_ and arg_261_1.time_ <= var_264_0 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_2 = arg_261_1:FormatText(StoryNameCfg[7].name)

				arg_261_1.leftNameTxt_.text = var_264_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_3 = arg_261_1:GetWordFromCfg(110131062)
				local var_264_4 = arg_261_1:FormatText(var_264_3.content)

				arg_261_1.text_.text = var_264_4

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_5 = 50
				local var_264_6 = utf8.len(var_264_4)
				local var_264_7 = var_264_5 <= 0 and var_264_1 or var_264_1 * (var_264_6 / var_264_5)

				if var_264_7 > 0 and var_264_1 < var_264_7 then
					arg_261_1.talkMaxDuration = var_264_7

					if var_264_7 + var_264_0 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_7 + var_264_0
					end
				end

				arg_261_1.text_.text = var_264_4
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)
				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_8 = math.max(var_264_1, arg_261_1.talkMaxDuration)

			if var_264_0 <= arg_261_1.time_ and arg_261_1.time_ < var_264_0 + var_264_8 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_0) / var_264_8

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_0 + var_264_8 and arg_261_1.time_ < var_264_0 + var_264_8 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play110131063 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 110131063
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play110131064(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = 0
			local var_268_1 = 0.925

			if var_268_0 < arg_265_1.time_ and arg_265_1.time_ <= var_268_0 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_2 = arg_265_1:FormatText(StoryNameCfg[7].name)

				arg_265_1.leftNameTxt_.text = var_268_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_3 = arg_265_1:GetWordFromCfg(110131063)
				local var_268_4 = arg_265_1:FormatText(var_268_3.content)

				arg_265_1.text_.text = var_268_4

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_5 = 36
				local var_268_6 = utf8.len(var_268_4)
				local var_268_7 = var_268_5 <= 0 and var_268_1 or var_268_1 * (var_268_6 / var_268_5)

				if var_268_7 > 0 and var_268_1 < var_268_7 then
					arg_265_1.talkMaxDuration = var_268_7

					if var_268_7 + var_268_0 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_7 + var_268_0
					end
				end

				arg_265_1.text_.text = var_268_4
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_8 = math.max(var_268_1, arg_265_1.talkMaxDuration)

			if var_268_0 <= arg_265_1.time_ and arg_265_1.time_ < var_268_0 + var_268_8 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_0) / var_268_8

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_0 + var_268_8 and arg_265_1.time_ < var_268_0 + var_268_8 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play110131064 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 110131064
		arg_269_1.duration_ = 6.7

		local var_269_0 = {
			ja = 5.7,
			ko = 6.7,
			zh = 5.4,
			en = 3.766
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
				arg_269_0:Play110131065(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1011ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect1011ui_story == nil then
				arg_269_1.var_.characterEffect1011ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.2

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1011ui_story then
					arg_269_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1011ui_story then
				arg_269_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_272_4 = 0

			if var_272_4 < arg_269_1.time_ and arg_269_1.time_ <= var_272_4 + arg_272_0 then
				arg_269_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_272_5 = 0
			local var_272_6 = 0.55

			if var_272_5 < arg_269_1.time_ and arg_269_1.time_ <= var_272_5 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_7 = arg_269_1:FormatText(StoryNameCfg[37].name)

				arg_269_1.leftNameTxt_.text = var_272_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_8 = arg_269_1:GetWordFromCfg(110131064)
				local var_272_9 = arg_269_1:FormatText(var_272_8.content)

				arg_269_1.text_.text = var_272_9

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_10 = 22
				local var_272_11 = utf8.len(var_272_9)
				local var_272_12 = var_272_10 <= 0 and var_272_6 or var_272_6 * (var_272_11 / var_272_10)

				if var_272_12 > 0 and var_272_6 < var_272_12 then
					arg_269_1.talkMaxDuration = var_272_12

					if var_272_12 + var_272_5 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_12 + var_272_5
					end
				end

				arg_269_1.text_.text = var_272_9
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131064", "story_v_out_110131.awb") ~= 0 then
					local var_272_13 = manager.audio:GetVoiceLength("story_v_out_110131", "110131064", "story_v_out_110131.awb") / 1000

					if var_272_13 + var_272_5 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_13 + var_272_5
					end

					if var_272_8.prefab_name ~= "" and arg_269_1.actors_[var_272_8.prefab_name] ~= nil then
						local var_272_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_8.prefab_name].transform, "story_v_out_110131", "110131064", "story_v_out_110131.awb")

						arg_269_1:RecordAudio("110131064", var_272_14)
						arg_269_1:RecordAudio("110131064", var_272_14)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_110131", "110131064", "story_v_out_110131.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_110131", "110131064", "story_v_out_110131.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_15 = math.max(var_272_6, arg_269_1.talkMaxDuration)

			if var_272_5 <= arg_269_1.time_ and arg_269_1.time_ < var_272_5 + var_272_15 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_5) / var_272_15

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_5 + var_272_15 and arg_269_1.time_ < var_272_5 + var_272_15 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play110131065 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 110131065
		arg_273_1.duration_ = 5

		SetActive(arg_273_1.tipsGo_, false)

		function arg_273_1.onSingleLineFinish_()
			arg_273_1.onSingleLineUpdate_ = nil
			arg_273_1.onSingleLineFinish_ = nil
			arg_273_1.state_ = "waiting"
		end

		function arg_273_1.playNext_(arg_275_0)
			if arg_275_0 == 1 then
				arg_273_0:Play110131066(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_276_1 = arg_273_1.actors_["1011ui_story"]
			local var_276_2 = 0

			if var_276_2 < arg_273_1.time_ and arg_273_1.time_ <= var_276_2 + arg_276_0 and arg_273_1.var_.characterEffect1011ui_story == nil then
				arg_273_1.var_.characterEffect1011ui_story = var_276_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_276_3 = 0.2

			if var_276_2 <= arg_273_1.time_ and arg_273_1.time_ < var_276_2 + var_276_3 then
				local var_276_4 = (arg_273_1.time_ - var_276_2) / var_276_3

				if arg_273_1.var_.characterEffect1011ui_story then
					local var_276_5 = Mathf.Lerp(0, 0.5, var_276_4)

					arg_273_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_273_1.var_.characterEffect1011ui_story.fillRatio = var_276_5
				end
			end

			if arg_273_1.time_ >= var_276_2 + var_276_3 and arg_273_1.time_ < var_276_2 + var_276_3 + arg_276_0 and arg_273_1.var_.characterEffect1011ui_story then
				local var_276_6 = 0.5

				arg_273_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_273_1.var_.characterEffect1011ui_story.fillRatio = var_276_6
			end

			local var_276_7 = 0
			local var_276_8 = 0.95

			if var_276_7 < arg_273_1.time_ and arg_273_1.time_ <= var_276_7 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_9 = arg_273_1:FormatText(StoryNameCfg[7].name)

				arg_273_1.leftNameTxt_.text = var_276_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_10 = arg_273_1:GetWordFromCfg(110131065)
				local var_276_11 = arg_273_1:FormatText(var_276_10.content)

				arg_273_1.text_.text = var_276_11

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_12 = 38
				local var_276_13 = utf8.len(var_276_11)
				local var_276_14 = var_276_12 <= 0 and var_276_8 or var_276_8 * (var_276_13 / var_276_12)

				if var_276_14 > 0 and var_276_8 < var_276_14 then
					arg_273_1.talkMaxDuration = var_276_14

					if var_276_14 + var_276_7 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_14 + var_276_7
					end
				end

				arg_273_1.text_.text = var_276_11
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)
				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_15 = math.max(var_276_8, arg_273_1.talkMaxDuration)

			if var_276_7 <= arg_273_1.time_ and arg_273_1.time_ < var_276_7 + var_276_15 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_7) / var_276_15

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_7 + var_276_15 and arg_273_1.time_ < var_276_7 + var_276_15 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play110131066 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 110131066
		arg_277_1.duration_ = 2

		local var_277_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 2,
			en = 1.999999999999
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
				arg_277_0:Play110131067(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1011ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect1011ui_story == nil then
				arg_277_1.var_.characterEffect1011ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.2

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect1011ui_story then
					arg_277_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect1011ui_story then
				arg_277_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_280_4 = 0

			if var_280_4 < arg_277_1.time_ and arg_277_1.time_ <= var_280_4 + arg_280_0 then
				arg_277_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_280_5 = 0
			local var_280_6 = 0.125

			if var_280_5 < arg_277_1.time_ and arg_277_1.time_ <= var_280_5 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_7 = arg_277_1:FormatText(StoryNameCfg[37].name)

				arg_277_1.leftNameTxt_.text = var_280_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_8 = arg_277_1:GetWordFromCfg(110131066)
				local var_280_9 = arg_277_1:FormatText(var_280_8.content)

				arg_277_1.text_.text = var_280_9

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_10 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131066", "story_v_out_110131.awb") ~= 0 then
					local var_280_13 = manager.audio:GetVoiceLength("story_v_out_110131", "110131066", "story_v_out_110131.awb") / 1000

					if var_280_13 + var_280_5 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_13 + var_280_5
					end

					if var_280_8.prefab_name ~= "" and arg_277_1.actors_[var_280_8.prefab_name] ~= nil then
						local var_280_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_8.prefab_name].transform, "story_v_out_110131", "110131066", "story_v_out_110131.awb")

						arg_277_1:RecordAudio("110131066", var_280_14)
						arg_277_1:RecordAudio("110131066", var_280_14)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_110131", "110131066", "story_v_out_110131.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_110131", "110131066", "story_v_out_110131.awb")
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
	Play110131067 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 110131067
		arg_281_1.duration_ = 5

		SetActive(arg_281_1.tipsGo_, false)

		function arg_281_1.onSingleLineFinish_()
			arg_281_1.onSingleLineUpdate_ = nil
			arg_281_1.onSingleLineFinish_ = nil
			arg_281_1.state_ = "waiting"
		end

		function arg_281_1.playNext_(arg_283_0)
			if arg_283_0 == 1 then
				arg_281_0:Play110131068(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1011ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect1011ui_story == nil then
				arg_281_1.var_.characterEffect1011ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.2

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect1011ui_story then
					local var_284_4 = Mathf.Lerp(0, 0.5, var_284_3)

					arg_281_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_281_1.var_.characterEffect1011ui_story.fillRatio = var_284_4
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1011ui_story then
				local var_284_5 = 0.5

				arg_281_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_281_1.var_.characterEffect1011ui_story.fillRatio = var_284_5
			end

			local var_284_6 = 0
			local var_284_7 = 0.375

			if var_284_6 < arg_281_1.time_ and arg_281_1.time_ <= var_284_6 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_8 = arg_281_1:FormatText(StoryNameCfg[7].name)

				arg_281_1.leftNameTxt_.text = var_284_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_9 = arg_281_1:GetWordFromCfg(110131067)
				local var_284_10 = arg_281_1:FormatText(var_284_9.content)

				arg_281_1.text_.text = var_284_10

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_11 = 15
				local var_284_12 = utf8.len(var_284_10)
				local var_284_13 = var_284_11 <= 0 and var_284_7 or var_284_7 * (var_284_12 / var_284_11)

				if var_284_13 > 0 and var_284_7 < var_284_13 then
					arg_281_1.talkMaxDuration = var_284_13

					if var_284_13 + var_284_6 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_13 + var_284_6
					end
				end

				arg_281_1.text_.text = var_284_10
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)
				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_14 = math.max(var_284_7, arg_281_1.talkMaxDuration)

			if var_284_6 <= arg_281_1.time_ and arg_281_1.time_ < var_284_6 + var_284_14 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_6) / var_284_14

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_6 + var_284_14 and arg_281_1.time_ < var_284_6 + var_284_14 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play110131068 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 110131068
		arg_285_1.duration_ = 5.966

		local var_285_0 = {
			ja = 5.966,
			ko = 3.5,
			zh = 3.4,
			en = 3.866
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
				arg_285_0:Play110131069(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1011ui_story"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and arg_285_1.var_.characterEffect1011ui_story == nil then
				arg_285_1.var_.characterEffect1011ui_story = var_288_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_2 = 0.2

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.characterEffect1011ui_story then
					arg_285_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and arg_285_1.var_.characterEffect1011ui_story then
				arg_285_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_288_4 = 0

			if var_288_4 < arg_285_1.time_ and arg_285_1.time_ <= var_288_4 + arg_288_0 then
				arg_285_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action463")
			end

			local var_288_5 = 0

			if var_288_5 < arg_285_1.time_ and arg_285_1.time_ <= var_288_5 + arg_288_0 then
				arg_285_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_288_6 = 0
			local var_288_7 = 0.35

			if var_288_6 < arg_285_1.time_ and arg_285_1.time_ <= var_288_6 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_8 = arg_285_1:FormatText(StoryNameCfg[37].name)

				arg_285_1.leftNameTxt_.text = var_288_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_9 = arg_285_1:GetWordFromCfg(110131068)
				local var_288_10 = arg_285_1:FormatText(var_288_9.content)

				arg_285_1.text_.text = var_288_10

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_11 = 11
				local var_288_12 = utf8.len(var_288_10)
				local var_288_13 = var_288_11 <= 0 and var_288_7 or var_288_7 * (var_288_12 / var_288_11)

				if var_288_13 > 0 and var_288_7 < var_288_13 then
					arg_285_1.talkMaxDuration = var_288_13

					if var_288_13 + var_288_6 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_13 + var_288_6
					end
				end

				arg_285_1.text_.text = var_288_10
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131068", "story_v_out_110131.awb") ~= 0 then
					local var_288_14 = manager.audio:GetVoiceLength("story_v_out_110131", "110131068", "story_v_out_110131.awb") / 1000

					if var_288_14 + var_288_6 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_14 + var_288_6
					end

					if var_288_9.prefab_name ~= "" and arg_285_1.actors_[var_288_9.prefab_name] ~= nil then
						local var_288_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_9.prefab_name].transform, "story_v_out_110131", "110131068", "story_v_out_110131.awb")

						arg_285_1:RecordAudio("110131068", var_288_15)
						arg_285_1:RecordAudio("110131068", var_288_15)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_110131", "110131068", "story_v_out_110131.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_110131", "110131068", "story_v_out_110131.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_16 = math.max(var_288_7, arg_285_1.talkMaxDuration)

			if var_288_6 <= arg_285_1.time_ and arg_285_1.time_ < var_288_6 + var_288_16 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_6) / var_288_16

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_6 + var_288_16 and arg_285_1.time_ < var_288_6 + var_288_16 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play110131069 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 110131069
		arg_289_1.duration_ = 7.265999999999

		local var_289_0 = {
			ja = 5.532999999999,
			ko = 7.265999999999,
			zh = 6.299999999999,
			en = 6.999999999999
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
				arg_289_0:Play110131070(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = "B12a"

			if arg_289_1.bgs_[var_292_0] == nil then
				local var_292_1 = Object.Instantiate(arg_289_1.paintGo_)

				var_292_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_292_0)
				var_292_1.name = var_292_0
				var_292_1.transform.parent = arg_289_1.stage_.transform
				var_292_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_289_1.bgs_[var_292_0] = var_292_1
			end

			local var_292_2 = 1.5

			if var_292_2 < arg_289_1.time_ and arg_289_1.time_ <= var_292_2 + arg_292_0 then
				local var_292_3 = manager.ui.mainCamera.transform.localPosition
				local var_292_4 = Vector3.New(0, 0, 10) + Vector3.New(var_292_3.x, var_292_3.y, 0)
				local var_292_5 = arg_289_1.bgs_.B12a

				var_292_5.transform.localPosition = var_292_4
				var_292_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_292_6 = var_292_5:GetComponent("SpriteRenderer")

				if var_292_6 and var_292_6.sprite then
					local var_292_7 = (var_292_5.transform.localPosition - var_292_3).z
					local var_292_8 = manager.ui.mainCameraCom_
					local var_292_9 = 2 * var_292_7 * Mathf.Tan(var_292_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_292_10 = var_292_9 * var_292_8.aspect
					local var_292_11 = var_292_6.sprite.bounds.size.x
					local var_292_12 = var_292_6.sprite.bounds.size.y
					local var_292_13 = var_292_10 / var_292_11
					local var_292_14 = var_292_9 / var_292_12
					local var_292_15 = var_292_14 < var_292_13 and var_292_13 or var_292_14

					var_292_5.transform.localScale = Vector3.New(var_292_15, var_292_15, 0)
				end

				for iter_292_0, iter_292_1 in pairs(arg_289_1.bgs_) do
					if iter_292_0 ~= "B12a" then
						iter_292_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_292_16 = arg_289_1.bgs_.ST19
			local var_292_17 = 0

			if var_292_17 < arg_289_1.time_ and arg_289_1.time_ <= var_292_17 + arg_292_0 then
				local var_292_18 = var_292_16:GetComponent("SpriteRenderer")

				if var_292_18 then
					var_292_18.material = arg_289_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_292_19 = var_292_18.material
					local var_292_20 = var_292_19:GetColor("_Color")

					arg_289_1.var_.alphaOldValueST19 = var_292_20.a
					arg_289_1.var_.alphaMatValueST19 = var_292_19
				end

				arg_289_1.var_.alphaOldValueST19 = 1
			end

			local var_292_21 = 1.5

			if var_292_17 <= arg_289_1.time_ and arg_289_1.time_ < var_292_17 + var_292_21 then
				local var_292_22 = (arg_289_1.time_ - var_292_17) / var_292_21
				local var_292_23 = Mathf.Lerp(arg_289_1.var_.alphaOldValueST19, 0, var_292_22)

				if arg_289_1.var_.alphaMatValueST19 then
					local var_292_24 = arg_289_1.var_.alphaMatValueST19
					local var_292_25 = var_292_24:GetColor("_Color")

					var_292_25.a = var_292_23

					var_292_24:SetColor("_Color", var_292_25)
				end
			end

			if arg_289_1.time_ >= var_292_17 + var_292_21 and arg_289_1.time_ < var_292_17 + var_292_21 + arg_292_0 and arg_289_1.var_.alphaMatValueST19 then
				local var_292_26 = arg_289_1.var_.alphaMatValueST19
				local var_292_27 = var_292_26:GetColor("_Color")

				var_292_27.a = 0

				var_292_26:SetColor("_Color", var_292_27)
			end

			local var_292_28 = arg_289_1.bgs_.B12a
			local var_292_29 = 1.5

			if var_292_29 < arg_289_1.time_ and arg_289_1.time_ <= var_292_29 + arg_292_0 then
				local var_292_30 = var_292_28:GetComponent("SpriteRenderer")

				if var_292_30 then
					var_292_30.material = arg_289_1.transpaintGo_:GetComponent("SpriteRenderer").material

					local var_292_31 = var_292_30.material
					local var_292_32 = var_292_31:GetColor("_Color")

					arg_289_1.var_.alphaOldValueB12a = var_292_32.a
					arg_289_1.var_.alphaMatValueB12a = var_292_31
				end

				arg_289_1.var_.alphaOldValueB12a = 0
			end

			local var_292_33 = 1.5

			if var_292_29 <= arg_289_1.time_ and arg_289_1.time_ < var_292_29 + var_292_33 then
				local var_292_34 = (arg_289_1.time_ - var_292_29) / var_292_33
				local var_292_35 = Mathf.Lerp(arg_289_1.var_.alphaOldValueB12a, 1, var_292_34)

				if arg_289_1.var_.alphaMatValueB12a then
					local var_292_36 = arg_289_1.var_.alphaMatValueB12a
					local var_292_37 = var_292_36:GetColor("_Color")

					var_292_37.a = var_292_35

					var_292_36:SetColor("_Color", var_292_37)
				end
			end

			if arg_289_1.time_ >= var_292_29 + var_292_33 and arg_289_1.time_ < var_292_29 + var_292_33 + arg_292_0 and arg_289_1.var_.alphaMatValueB12a then
				local var_292_38 = arg_289_1.var_.alphaMatValueB12a
				local var_292_39 = var_292_38:GetColor("_Color")

				var_292_39.a = 1

				var_292_38:SetColor("_Color", var_292_39)
			end

			local var_292_40 = "1111ui_story"

			if arg_289_1.actors_[var_292_40] == nil then
				local var_292_41 = Object.Instantiate(Asset.Load("Char/" .. var_292_40), arg_289_1.stage_.transform)

				var_292_41.name = var_292_40
				var_292_41.transform.localPosition = Vector3.New(0, 100, 0)
				arg_289_1.actors_[var_292_40] = var_292_41

				local var_292_42 = var_292_41:GetComponentInChildren(typeof(CharacterEffect))

				var_292_42.enabled = true

				local var_292_43 = GameObjectTools.GetOrAddComponent(var_292_41, typeof(DynamicBoneHelper))

				if var_292_43 then
					var_292_43:EnableDynamicBone(false)
				end

				arg_289_1:ShowWeapon(var_292_42.transform, false)

				arg_289_1.var_[var_292_40 .. "Animator"] = var_292_42.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_289_1.var_[var_292_40 .. "Animator"].applyRootMotion = true
				arg_289_1.var_[var_292_40 .. "LipSync"] = var_292_42.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_292_44 = arg_289_1.actors_["1111ui_story"].transform
			local var_292_45 = 2.499999999999

			if var_292_45 < arg_289_1.time_ and arg_289_1.time_ <= var_292_45 + arg_292_0 then
				arg_289_1.var_.moveOldPos1111ui_story = var_292_44.localPosition
			end

			local var_292_46 = 0.001

			if var_292_45 <= arg_289_1.time_ and arg_289_1.time_ < var_292_45 + var_292_46 then
				local var_292_47 = (arg_289_1.time_ - var_292_45) / var_292_46
				local var_292_48 = Vector3.New(0, -0.83, -6)

				var_292_44.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1111ui_story, var_292_48, var_292_47)

				local var_292_49 = manager.ui.mainCamera.transform.position - var_292_44.position

				var_292_44.forward = Vector3.New(var_292_49.x, var_292_49.y, var_292_49.z)

				local var_292_50 = var_292_44.localEulerAngles

				var_292_50.z = 0
				var_292_50.x = 0
				var_292_44.localEulerAngles = var_292_50
			end

			if arg_289_1.time_ >= var_292_45 + var_292_46 and arg_289_1.time_ < var_292_45 + var_292_46 + arg_292_0 then
				var_292_44.localPosition = Vector3.New(0, -0.83, -6)

				local var_292_51 = manager.ui.mainCamera.transform.position - var_292_44.position

				var_292_44.forward = Vector3.New(var_292_51.x, var_292_51.y, var_292_51.z)

				local var_292_52 = var_292_44.localEulerAngles

				var_292_52.z = 0
				var_292_52.x = 0
				var_292_44.localEulerAngles = var_292_52
			end

			local var_292_53 = 2.499999999999

			if var_292_53 < arg_289_1.time_ and arg_289_1.time_ <= var_292_53 + arg_292_0 then
				arg_289_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_1")
			end

			local var_292_54 = 2.499999999999

			if var_292_54 < arg_289_1.time_ and arg_289_1.time_ <= var_292_54 + arg_292_0 then
				arg_289_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_292_55 = arg_289_1.actors_["1111ui_story"]
			local var_292_56 = 2.499999999999

			if var_292_56 < arg_289_1.time_ and arg_289_1.time_ <= var_292_56 + arg_292_0 and arg_289_1.var_.characterEffect1111ui_story == nil then
				arg_289_1.var_.characterEffect1111ui_story = var_292_55:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_292_57 = 0.2

			if var_292_56 <= arg_289_1.time_ and arg_289_1.time_ < var_292_56 + var_292_57 then
				local var_292_58 = (arg_289_1.time_ - var_292_56) / var_292_57

				if arg_289_1.var_.characterEffect1111ui_story then
					arg_289_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_289_1.time_ >= var_292_56 + var_292_57 and arg_289_1.time_ < var_292_56 + var_292_57 + arg_292_0 and arg_289_1.var_.characterEffect1111ui_story then
				arg_289_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_292_59 = 0

			if var_292_59 < arg_289_1.time_ and arg_289_1.time_ <= var_292_59 + arg_292_0 then
				arg_289_1.allBtn_.enabled = false
			end

			local var_292_60 = 2.499999999999

			if arg_289_1.time_ >= var_292_59 + var_292_60 and arg_289_1.time_ < var_292_59 + var_292_60 + arg_292_0 then
				arg_289_1.allBtn_.enabled = true
			end

			local var_292_61 = arg_289_1.actors_["1011ui_story"].transform
			local var_292_62 = 0

			if var_292_62 < arg_289_1.time_ and arg_289_1.time_ <= var_292_62 + arg_292_0 then
				arg_289_1.var_.moveOldPos1011ui_story = var_292_61.localPosition
			end

			local var_292_63 = 0.001

			if var_292_62 <= arg_289_1.time_ and arg_289_1.time_ < var_292_62 + var_292_63 then
				local var_292_64 = (arg_289_1.time_ - var_292_62) / var_292_63
				local var_292_65 = Vector3.New(0, 100, 0)

				var_292_61.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos1011ui_story, var_292_65, var_292_64)

				local var_292_66 = manager.ui.mainCamera.transform.position - var_292_61.position

				var_292_61.forward = Vector3.New(var_292_66.x, var_292_66.y, var_292_66.z)

				local var_292_67 = var_292_61.localEulerAngles

				var_292_67.z = 0
				var_292_67.x = 0
				var_292_61.localEulerAngles = var_292_67
			end

			if arg_289_1.time_ >= var_292_62 + var_292_63 and arg_289_1.time_ < var_292_62 + var_292_63 + arg_292_0 then
				var_292_61.localPosition = Vector3.New(0, 100, 0)

				local var_292_68 = manager.ui.mainCamera.transform.position - var_292_61.position

				var_292_61.forward = Vector3.New(var_292_68.x, var_292_68.y, var_292_68.z)

				local var_292_69 = var_292_61.localEulerAngles

				var_292_69.z = 0
				var_292_69.x = 0
				var_292_61.localEulerAngles = var_292_69
			end

			if arg_289_1.frameCnt_ <= 1 then
				arg_289_1.dialog_:SetActive(false)
			end

			local var_292_70 = 2.499999999999
			local var_292_71 = 1

			if var_292_70 < arg_289_1.time_ and arg_289_1.time_ <= var_292_70 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0

				arg_289_1.dialog_:SetActive(true)

				local var_292_72 = LeanTween.value(arg_289_1.dialog_, 0, 1, 0.3)

				var_292_72:setOnUpdate(LuaHelper.FloatAction(function(arg_293_0)
					arg_289_1.dialogCg_.alpha = arg_293_0
				end))
				var_292_72:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_289_1.dialog_)
					var_292_72:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_289_1.duration_ = arg_289_1.duration_ + 0.3

				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_73 = arg_289_1:FormatText(StoryNameCfg[67].name)

				arg_289_1.leftNameTxt_.text = var_292_73

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_74 = arg_289_1:GetWordFromCfg(110131069)
				local var_292_75 = arg_289_1:FormatText(var_292_74.content)

				arg_289_1.text_.text = var_292_75

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_76 = 16
				local var_292_77 = utf8.len(var_292_75)
				local var_292_78 = var_292_76 <= 0 and var_292_71 or var_292_71 * (var_292_77 / var_292_76)

				if var_292_78 > 0 and var_292_71 < var_292_78 then
					arg_289_1.talkMaxDuration = var_292_78
					var_292_70 = var_292_70 + 0.3

					if var_292_78 + var_292_70 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_78 + var_292_70
					end
				end

				arg_289_1.text_.text = var_292_75
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131069", "story_v_out_110131.awb") ~= 0 then
					local var_292_79 = manager.audio:GetVoiceLength("story_v_out_110131", "110131069", "story_v_out_110131.awb") / 1000

					if var_292_79 + var_292_70 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_79 + var_292_70
					end

					if var_292_74.prefab_name ~= "" and arg_289_1.actors_[var_292_74.prefab_name] ~= nil then
						local var_292_80 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_74.prefab_name].transform, "story_v_out_110131", "110131069", "story_v_out_110131.awb")

						arg_289_1:RecordAudio("110131069", var_292_80)
						arg_289_1:RecordAudio("110131069", var_292_80)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_110131", "110131069", "story_v_out_110131.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_110131", "110131069", "story_v_out_110131.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_81 = var_292_70 + 0.3
			local var_292_82 = math.max(var_292_71, arg_289_1.talkMaxDuration)

			if var_292_81 <= arg_289_1.time_ and arg_289_1.time_ < var_292_81 + var_292_82 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_81) / var_292_82

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_81 + var_292_82 and arg_289_1.time_ < var_292_81 + var_292_82 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play110131070 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 110131070
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play110131071(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1111ui_story"]
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 and arg_295_1.var_.characterEffect1111ui_story == nil then
				arg_295_1.var_.characterEffect1111ui_story = var_298_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_2 = 0.2

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_2 then
				local var_298_3 = (arg_295_1.time_ - var_298_1) / var_298_2

				if arg_295_1.var_.characterEffect1111ui_story then
					local var_298_4 = Mathf.Lerp(0, 0.5, var_298_3)

					arg_295_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_295_1.var_.characterEffect1111ui_story.fillRatio = var_298_4
				end
			end

			if arg_295_1.time_ >= var_298_1 + var_298_2 and arg_295_1.time_ < var_298_1 + var_298_2 + arg_298_0 and arg_295_1.var_.characterEffect1111ui_story then
				local var_298_5 = 0.5

				arg_295_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_295_1.var_.characterEffect1111ui_story.fillRatio = var_298_5
			end

			local var_298_6 = 0
			local var_298_7 = 0.325

			if var_298_6 < arg_295_1.time_ and arg_295_1.time_ <= var_298_6 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_8 = arg_295_1:FormatText(StoryNameCfg[7].name)

				arg_295_1.leftNameTxt_.text = var_298_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_9 = arg_295_1:GetWordFromCfg(110131070)
				local var_298_10 = arg_295_1:FormatText(var_298_9.content)

				arg_295_1.text_.text = var_298_10

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_11 = 13
				local var_298_12 = utf8.len(var_298_10)
				local var_298_13 = var_298_11 <= 0 and var_298_7 or var_298_7 * (var_298_12 / var_298_11)

				if var_298_13 > 0 and var_298_7 < var_298_13 then
					arg_295_1.talkMaxDuration = var_298_13

					if var_298_13 + var_298_6 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_13 + var_298_6
					end
				end

				arg_295_1.text_.text = var_298_10
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_14 = math.max(var_298_7, arg_295_1.talkMaxDuration)

			if var_298_6 <= arg_295_1.time_ and arg_295_1.time_ < var_298_6 + var_298_14 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_6) / var_298_14

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_6 + var_298_14 and arg_295_1.time_ < var_298_6 + var_298_14 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play110131071 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 110131071
		arg_299_1.duration_ = 5.733

		local var_299_0 = {
			ja = 4.333,
			ko = 5.466,
			zh = 4.6,
			en = 5.733
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
				arg_299_0:Play110131072(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action6_2")
			end

			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_302_2 = arg_299_1.actors_["1111ui_story"]
			local var_302_3 = 0

			if var_302_3 < arg_299_1.time_ and arg_299_1.time_ <= var_302_3 + arg_302_0 and arg_299_1.var_.characterEffect1111ui_story == nil then
				arg_299_1.var_.characterEffect1111ui_story = var_302_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_4 = 0.2

			if var_302_3 <= arg_299_1.time_ and arg_299_1.time_ < var_302_3 + var_302_4 then
				local var_302_5 = (arg_299_1.time_ - var_302_3) / var_302_4

				if arg_299_1.var_.characterEffect1111ui_story then
					arg_299_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_299_1.time_ >= var_302_3 + var_302_4 and arg_299_1.time_ < var_302_3 + var_302_4 + arg_302_0 and arg_299_1.var_.characterEffect1111ui_story then
				arg_299_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_302_6 = 0
			local var_302_7 = 0.575

			if var_302_6 < arg_299_1.time_ and arg_299_1.time_ <= var_302_6 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_8 = arg_299_1:FormatText(StoryNameCfg[67].name)

				arg_299_1.leftNameTxt_.text = var_302_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_9 = arg_299_1:GetWordFromCfg(110131071)
				local var_302_10 = arg_299_1:FormatText(var_302_9.content)

				arg_299_1.text_.text = var_302_10

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_11 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131071", "story_v_out_110131.awb") ~= 0 then
					local var_302_14 = manager.audio:GetVoiceLength("story_v_out_110131", "110131071", "story_v_out_110131.awb") / 1000

					if var_302_14 + var_302_6 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_14 + var_302_6
					end

					if var_302_9.prefab_name ~= "" and arg_299_1.actors_[var_302_9.prefab_name] ~= nil then
						local var_302_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_9.prefab_name].transform, "story_v_out_110131", "110131071", "story_v_out_110131.awb")

						arg_299_1:RecordAudio("110131071", var_302_15)
						arg_299_1:RecordAudio("110131071", var_302_15)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_110131", "110131071", "story_v_out_110131.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_110131", "110131071", "story_v_out_110131.awb")
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
	Play110131072 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 110131072
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play110131073(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1111ui_story"]
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 and arg_303_1.var_.characterEffect1111ui_story == nil then
				arg_303_1.var_.characterEffect1111ui_story = var_306_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_2 = 0.2

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2

				if arg_303_1.var_.characterEffect1111ui_story then
					local var_306_4 = Mathf.Lerp(0, 0.5, var_306_3)

					arg_303_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_303_1.var_.characterEffect1111ui_story.fillRatio = var_306_4
				end
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 and arg_303_1.var_.characterEffect1111ui_story then
				local var_306_5 = 0.5

				arg_303_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_303_1.var_.characterEffect1111ui_story.fillRatio = var_306_5
			end

			local var_306_6 = 0
			local var_306_7 = 0.325

			if var_306_6 < arg_303_1.time_ and arg_303_1.time_ <= var_306_6 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_8 = arg_303_1:FormatText(StoryNameCfg[7].name)

				arg_303_1.leftNameTxt_.text = var_306_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_9 = arg_303_1:GetWordFromCfg(110131072)
				local var_306_10 = arg_303_1:FormatText(var_306_9.content)

				arg_303_1.text_.text = var_306_10

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_11 = 13
				local var_306_12 = utf8.len(var_306_10)
				local var_306_13 = var_306_11 <= 0 and var_306_7 or var_306_7 * (var_306_12 / var_306_11)

				if var_306_13 > 0 and var_306_7 < var_306_13 then
					arg_303_1.talkMaxDuration = var_306_13

					if var_306_13 + var_306_6 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_13 + var_306_6
					end
				end

				arg_303_1.text_.text = var_306_10
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_14 = math.max(var_306_7, arg_303_1.talkMaxDuration)

			if var_306_6 <= arg_303_1.time_ and arg_303_1.time_ < var_306_6 + var_306_14 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_6) / var_306_14

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_6 + var_306_14 and arg_303_1.time_ < var_306_6 + var_306_14 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play110131073 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 110131073
		arg_307_1.duration_ = 10.866

		local var_307_0 = {
			ja = 10.866,
			ko = 7.166,
			zh = 8.3,
			en = 9.966
		}
		local var_307_1 = manager.audio:GetLocalizationFlag()

		if var_307_0[var_307_1] ~= nil then
			arg_307_1.duration_ = var_307_0[var_307_1]
		end

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play110131074(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 0.9

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_2 = arg_307_1:FormatText(StoryNameCfg[10].name)

				arg_307_1.leftNameTxt_.text = var_310_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, true)
				arg_307_1.iconController_:SetSelectedState("hero")

				arg_307_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_3 = arg_307_1:GetWordFromCfg(110131073)
				local var_310_4 = arg_307_1:FormatText(var_310_3.content)

				arg_307_1.text_.text = var_310_4

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_5 = 36
				local var_310_6 = utf8.len(var_310_4)
				local var_310_7 = var_310_5 <= 0 and var_310_1 or var_310_1 * (var_310_6 / var_310_5)

				if var_310_7 > 0 and var_310_1 < var_310_7 then
					arg_307_1.talkMaxDuration = var_310_7

					if var_310_7 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_7 + var_310_0
					end
				end

				arg_307_1.text_.text = var_310_4
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131073", "story_v_out_110131.awb") ~= 0 then
					local var_310_8 = manager.audio:GetVoiceLength("story_v_out_110131", "110131073", "story_v_out_110131.awb") / 1000

					if var_310_8 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_8 + var_310_0
					end

					if var_310_3.prefab_name ~= "" and arg_307_1.actors_[var_310_3.prefab_name] ~= nil then
						local var_310_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_3.prefab_name].transform, "story_v_out_110131", "110131073", "story_v_out_110131.awb")

						arg_307_1:RecordAudio("110131073", var_310_9)
						arg_307_1:RecordAudio("110131073", var_310_9)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_110131", "110131073", "story_v_out_110131.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_110131", "110131073", "story_v_out_110131.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_10 = math.max(var_310_1, arg_307_1.talkMaxDuration)

			if var_310_0 <= arg_307_1.time_ and arg_307_1.time_ < var_310_0 + var_310_10 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_0) / var_310_10

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_0 + var_310_10 and arg_307_1.time_ < var_310_0 + var_310_10 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play110131074 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 110131074
		arg_311_1.duration_ = 6.766

		local var_311_0 = {
			ja = 6.766,
			ko = 2.266,
			zh = 3.5,
			en = 4.9
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
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play110131075(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action4_1")
			end

			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 then
				arg_311_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_314_2 = arg_311_1.actors_["1111ui_story"]
			local var_314_3 = 0

			if var_314_3 < arg_311_1.time_ and arg_311_1.time_ <= var_314_3 + arg_314_0 and arg_311_1.var_.characterEffect1111ui_story == nil then
				arg_311_1.var_.characterEffect1111ui_story = var_314_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_4 = 0.2

			if var_314_3 <= arg_311_1.time_ and arg_311_1.time_ < var_314_3 + var_314_4 then
				local var_314_5 = (arg_311_1.time_ - var_314_3) / var_314_4

				if arg_311_1.var_.characterEffect1111ui_story then
					arg_311_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_3 + var_314_4 and arg_311_1.time_ < var_314_3 + var_314_4 + arg_314_0 and arg_311_1.var_.characterEffect1111ui_story then
				arg_311_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_314_6 = 0
			local var_314_7 = 0.375

			if var_314_6 < arg_311_1.time_ and arg_311_1.time_ <= var_314_6 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_8 = arg_311_1:FormatText(StoryNameCfg[67].name)

				arg_311_1.leftNameTxt_.text = var_314_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_9 = arg_311_1:GetWordFromCfg(110131074)
				local var_314_10 = arg_311_1:FormatText(var_314_9.content)

				arg_311_1.text_.text = var_314_10

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_11 = 15
				local var_314_12 = utf8.len(var_314_10)
				local var_314_13 = var_314_11 <= 0 and var_314_7 or var_314_7 * (var_314_12 / var_314_11)

				if var_314_13 > 0 and var_314_7 < var_314_13 then
					arg_311_1.talkMaxDuration = var_314_13

					if var_314_13 + var_314_6 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_13 + var_314_6
					end
				end

				arg_311_1.text_.text = var_314_10
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131074", "story_v_out_110131.awb") ~= 0 then
					local var_314_14 = manager.audio:GetVoiceLength("story_v_out_110131", "110131074", "story_v_out_110131.awb") / 1000

					if var_314_14 + var_314_6 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_14 + var_314_6
					end

					if var_314_9.prefab_name ~= "" and arg_311_1.actors_[var_314_9.prefab_name] ~= nil then
						local var_314_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_9.prefab_name].transform, "story_v_out_110131", "110131074", "story_v_out_110131.awb")

						arg_311_1:RecordAudio("110131074", var_314_15)
						arg_311_1:RecordAudio("110131074", var_314_15)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_110131", "110131074", "story_v_out_110131.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_110131", "110131074", "story_v_out_110131.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_16 = math.max(var_314_7, arg_311_1.talkMaxDuration)

			if var_314_6 <= arg_311_1.time_ and arg_311_1.time_ < var_314_6 + var_314_16 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_6) / var_314_16

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_6 + var_314_16 and arg_311_1.time_ < var_314_6 + var_314_16 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play110131075 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 110131075
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play110131076(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1111ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.characterEffect1111ui_story == nil then
				arg_315_1.var_.characterEffect1111ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.2

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect1111ui_story then
					local var_318_4 = Mathf.Lerp(0, 0.5, var_318_3)

					arg_315_1.var_.characterEffect1111ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1111ui_story.fillRatio = var_318_4
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect1111ui_story then
				local var_318_5 = 0.5

				arg_315_1.var_.characterEffect1111ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1111ui_story.fillRatio = var_318_5
			end

			local var_318_6 = arg_315_1.actors_["1111ui_story"].transform
			local var_318_7 = 0

			if var_318_7 < arg_315_1.time_ and arg_315_1.time_ <= var_318_7 + arg_318_0 then
				arg_315_1.var_.moveOldPos1111ui_story = var_318_6.localPosition
			end

			local var_318_8 = 0.1

			if var_318_7 <= arg_315_1.time_ and arg_315_1.time_ < var_318_7 + var_318_8 then
				local var_318_9 = (arg_315_1.time_ - var_318_7) / var_318_8
				local var_318_10 = Vector3.New(0, 100, 0)

				var_318_6.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1111ui_story, var_318_10, var_318_9)

				local var_318_11 = manager.ui.mainCamera.transform.position - var_318_6.position

				var_318_6.forward = Vector3.New(var_318_11.x, var_318_11.y, var_318_11.z)

				local var_318_12 = var_318_6.localEulerAngles

				var_318_12.z = 0
				var_318_12.x = 0
				var_318_6.localEulerAngles = var_318_12
			end

			if arg_315_1.time_ >= var_318_7 + var_318_8 and arg_315_1.time_ < var_318_7 + var_318_8 + arg_318_0 then
				var_318_6.localPosition = Vector3.New(0, 100, 0)

				local var_318_13 = manager.ui.mainCamera.transform.position - var_318_6.position

				var_318_6.forward = Vector3.New(var_318_13.x, var_318_13.y, var_318_13.z)

				local var_318_14 = var_318_6.localEulerAngles

				var_318_14.z = 0
				var_318_14.x = 0
				var_318_6.localEulerAngles = var_318_14
			end

			local var_318_15 = 0
			local var_318_16 = 0.5

			if var_318_15 < arg_315_1.time_ and arg_315_1.time_ <= var_318_15 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_17 = arg_315_1:FormatText(StoryNameCfg[7].name)

				arg_315_1.leftNameTxt_.text = var_318_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_18 = arg_315_1:GetWordFromCfg(110131075)
				local var_318_19 = arg_315_1:FormatText(var_318_18.content)

				arg_315_1.text_.text = var_318_19

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_20 = 20
				local var_318_21 = utf8.len(var_318_19)
				local var_318_22 = var_318_20 <= 0 and var_318_16 or var_318_16 * (var_318_21 / var_318_20)

				if var_318_22 > 0 and var_318_16 < var_318_22 then
					arg_315_1.talkMaxDuration = var_318_22

					if var_318_22 + var_318_15 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_22 + var_318_15
					end
				end

				arg_315_1.text_.text = var_318_19
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_23 = math.max(var_318_16, arg_315_1.talkMaxDuration)

			if var_318_15 <= arg_315_1.time_ and arg_315_1.time_ < var_318_15 + var_318_23 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_15) / var_318_23

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_15 + var_318_23 and arg_315_1.time_ < var_318_15 + var_318_23 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play110131076 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 110131076
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play110131077(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0
			local var_322_1 = 0.75

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, false)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_2 = arg_319_1:GetWordFromCfg(110131076)
				local var_322_3 = arg_319_1:FormatText(var_322_2.content)

				arg_319_1.text_.text = var_322_3

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_4 = 30
				local var_322_5 = utf8.len(var_322_3)
				local var_322_6 = var_322_4 <= 0 and var_322_1 or var_322_1 * (var_322_5 / var_322_4)

				if var_322_6 > 0 and var_322_1 < var_322_6 then
					arg_319_1.talkMaxDuration = var_322_6

					if var_322_6 + var_322_0 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_6 + var_322_0
					end
				end

				arg_319_1.text_.text = var_322_3
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_7 = math.max(var_322_1, arg_319_1.talkMaxDuration)

			if var_322_0 <= arg_319_1.time_ and arg_319_1.time_ < var_322_0 + var_322_7 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_0) / var_322_7

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_0 + var_322_7 and arg_319_1.time_ < var_322_0 + var_322_7 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play110131077 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 110131077
		arg_323_1.duration_ = 2.466

		local var_323_0 = {
			ja = 2.1,
			ko = 2.466,
			zh = 1.999999999999,
			en = 2.2
		}
		local var_323_1 = manager.audio:GetLocalizationFlag()

		if var_323_0[var_323_1] ~= nil then
			arg_323_1.duration_ = var_323_0[var_323_1]
		end

		SetActive(arg_323_1.tipsGo_, false)

		function arg_323_1.onSingleLineFinish_()
			arg_323_1.onSingleLineUpdate_ = nil
			arg_323_1.onSingleLineFinish_ = nil
			arg_323_1.state_ = "waiting"
		end

		function arg_323_1.playNext_(arg_325_0)
			if arg_325_0 == 1 then
				arg_323_0:Play110131078(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = "1184ui_story"

			if arg_323_1.actors_[var_326_0] == nil then
				local var_326_1 = Object.Instantiate(Asset.Load("Char/" .. var_326_0), arg_323_1.stage_.transform)

				var_326_1.name = var_326_0
				var_326_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_323_1.actors_[var_326_0] = var_326_1

				local var_326_2 = var_326_1:GetComponentInChildren(typeof(CharacterEffect))

				var_326_2.enabled = true

				local var_326_3 = GameObjectTools.GetOrAddComponent(var_326_1, typeof(DynamicBoneHelper))

				if var_326_3 then
					var_326_3:EnableDynamicBone(false)
				end

				arg_323_1:ShowWeapon(var_326_2.transform, false)

				arg_323_1.var_[var_326_0 .. "Animator"] = var_326_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_323_1.var_[var_326_0 .. "Animator"].applyRootMotion = true
				arg_323_1.var_[var_326_0 .. "LipSync"] = var_326_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_326_4 = arg_323_1.actors_["1184ui_story"].transform
			local var_326_5 = 0

			if var_326_5 < arg_323_1.time_ and arg_323_1.time_ <= var_326_5 + arg_326_0 then
				arg_323_1.var_.moveOldPos1184ui_story = var_326_4.localPosition

				local var_326_6 = "1184ui_story"

				arg_323_1:ShowWeapon(arg_323_1.var_[var_326_6 .. "Animator"].transform, true)
			end

			local var_326_7 = 0.001

			if var_326_5 <= arg_323_1.time_ and arg_323_1.time_ < var_326_5 + var_326_7 then
				local var_326_8 = (arg_323_1.time_ - var_326_5) / var_326_7
				local var_326_9 = Vector3.New(-0.7, -0.97, -6)

				var_326_4.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1184ui_story, var_326_9, var_326_8)

				local var_326_10 = manager.ui.mainCamera.transform.position - var_326_4.position

				var_326_4.forward = Vector3.New(var_326_10.x, var_326_10.y, var_326_10.z)

				local var_326_11 = var_326_4.localEulerAngles

				var_326_11.z = 0
				var_326_11.x = 0
				var_326_4.localEulerAngles = var_326_11
			end

			if arg_323_1.time_ >= var_326_5 + var_326_7 and arg_323_1.time_ < var_326_5 + var_326_7 + arg_326_0 then
				var_326_4.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_326_12 = manager.ui.mainCamera.transform.position - var_326_4.position

				var_326_4.forward = Vector3.New(var_326_12.x, var_326_12.y, var_326_12.z)

				local var_326_13 = var_326_4.localEulerAngles

				var_326_13.z = 0
				var_326_13.x = 0
				var_326_4.localEulerAngles = var_326_13
			end

			local var_326_14 = 0

			if var_326_14 < arg_323_1.time_ and arg_323_1.time_ <= var_326_14 + arg_326_0 then
				arg_323_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_326_15 = 0

			if var_326_15 < arg_323_1.time_ and arg_323_1.time_ <= var_326_15 + arg_326_0 then
				arg_323_1:PlayTimeline("1184ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_326_16 = "1084ui_story"

			if arg_323_1.actors_[var_326_16] == nil then
				local var_326_17 = Object.Instantiate(Asset.Load("Char/" .. var_326_16), arg_323_1.stage_.transform)

				var_326_17.name = var_326_16
				var_326_17.transform.localPosition = Vector3.New(0, 100, 0)
				arg_323_1.actors_[var_326_16] = var_326_17

				local var_326_18 = var_326_17:GetComponentInChildren(typeof(CharacterEffect))

				var_326_18.enabled = true

				local var_326_19 = GameObjectTools.GetOrAddComponent(var_326_17, typeof(DynamicBoneHelper))

				if var_326_19 then
					var_326_19:EnableDynamicBone(false)
				end

				arg_323_1:ShowWeapon(var_326_18.transform, false)

				arg_323_1.var_[var_326_16 .. "Animator"] = var_326_18.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_323_1.var_[var_326_16 .. "Animator"].applyRootMotion = true
				arg_323_1.var_[var_326_16 .. "LipSync"] = var_326_18.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_326_20 = arg_323_1.actors_["1084ui_story"]
			local var_326_21 = 0

			if var_326_21 < arg_323_1.time_ and arg_323_1.time_ <= var_326_21 + arg_326_0 and arg_323_1.var_.characterEffect1084ui_story == nil then
				arg_323_1.var_.characterEffect1084ui_story = var_326_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_22 = 0.2

			if var_326_21 <= arg_323_1.time_ and arg_323_1.time_ < var_326_21 + var_326_22 then
				local var_326_23 = (arg_323_1.time_ - var_326_21) / var_326_22

				if arg_323_1.var_.characterEffect1084ui_story then
					arg_323_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_21 + var_326_22 and arg_323_1.time_ < var_326_21 + var_326_22 + arg_326_0 and arg_323_1.var_.characterEffect1084ui_story then
				arg_323_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_326_24 = 0
			local var_326_25 = 0.225

			if var_326_24 < arg_323_1.time_ and arg_323_1.time_ <= var_326_24 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_26 = arg_323_1:FormatText(StoryNameCfg[6].name)

				arg_323_1.leftNameTxt_.text = var_326_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_27 = arg_323_1:GetWordFromCfg(110131077)
				local var_326_28 = arg_323_1:FormatText(var_326_27.content)

				arg_323_1.text_.text = var_326_28

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_29 = 9
				local var_326_30 = utf8.len(var_326_28)
				local var_326_31 = var_326_29 <= 0 and var_326_25 or var_326_25 * (var_326_30 / var_326_29)

				if var_326_31 > 0 and var_326_25 < var_326_31 then
					arg_323_1.talkMaxDuration = var_326_31

					if var_326_31 + var_326_24 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_31 + var_326_24
					end
				end

				arg_323_1.text_.text = var_326_28
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131077", "story_v_out_110131.awb") ~= 0 then
					local var_326_32 = manager.audio:GetVoiceLength("story_v_out_110131", "110131077", "story_v_out_110131.awb") / 1000

					if var_326_32 + var_326_24 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_32 + var_326_24
					end

					if var_326_27.prefab_name ~= "" and arg_323_1.actors_[var_326_27.prefab_name] ~= nil then
						local var_326_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_27.prefab_name].transform, "story_v_out_110131", "110131077", "story_v_out_110131.awb")

						arg_323_1:RecordAudio("110131077", var_326_33)
						arg_323_1:RecordAudio("110131077", var_326_33)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_110131", "110131077", "story_v_out_110131.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_110131", "110131077", "story_v_out_110131.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_34 = math.max(var_326_25, arg_323_1.talkMaxDuration)

			if var_326_24 <= arg_323_1.time_ and arg_323_1.time_ < var_326_24 + var_326_34 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_24) / var_326_34

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_24 + var_326_34 and arg_323_1.time_ < var_326_24 + var_326_34 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play110131078 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 110131078
		arg_327_1.duration_ = 5.3

		local var_327_0 = {
			ja = 3.966,
			ko = 5.3,
			zh = 4.133,
			en = 4.7
		}
		local var_327_1 = manager.audio:GetLocalizationFlag()

		if var_327_0[var_327_1] ~= nil then
			arg_327_1.duration_ = var_327_0[var_327_1]
		end

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play110131079(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1019ui_story"].transform
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				arg_327_1.var_.moveOldPos1019ui_story = var_330_0.localPosition
			end

			local var_330_2 = 0.1

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2
				local var_330_4 = Vector3.New(0.7, -1.08, -5.9)

				var_330_0.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1019ui_story, var_330_4, var_330_3)

				local var_330_5 = manager.ui.mainCamera.transform.position - var_330_0.position

				var_330_0.forward = Vector3.New(var_330_5.x, var_330_5.y, var_330_5.z)

				local var_330_6 = var_330_0.localEulerAngles

				var_330_6.z = 0
				var_330_6.x = 0
				var_330_0.localEulerAngles = var_330_6
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 then
				var_330_0.localPosition = Vector3.New(0.7, -1.08, -5.9)

				local var_330_7 = manager.ui.mainCamera.transform.position - var_330_0.position

				var_330_0.forward = Vector3.New(var_330_7.x, var_330_7.y, var_330_7.z)

				local var_330_8 = var_330_0.localEulerAngles

				var_330_8.z = 0
				var_330_8.x = 0
				var_330_0.localEulerAngles = var_330_8
			end

			local var_330_9 = 0

			if var_330_9 < arg_327_1.time_ and arg_327_1.time_ <= var_330_9 + arg_330_0 then
				arg_327_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_330_10 = 0

			if var_330_10 < arg_327_1.time_ and arg_327_1.time_ <= var_330_10 + arg_330_0 then
				arg_327_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_330_11 = arg_327_1.actors_["1184ui_story"]
			local var_330_12 = 0

			if var_330_12 < arg_327_1.time_ and arg_327_1.time_ <= var_330_12 + arg_330_0 and arg_327_1.var_.characterEffect1184ui_story == nil then
				arg_327_1.var_.characterEffect1184ui_story = var_330_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_13 = 0.2

			if var_330_12 <= arg_327_1.time_ and arg_327_1.time_ < var_330_12 + var_330_13 then
				local var_330_14 = (arg_327_1.time_ - var_330_12) / var_330_13

				if arg_327_1.var_.characterEffect1184ui_story then
					local var_330_15 = Mathf.Lerp(0, 0.5, var_330_14)

					arg_327_1.var_.characterEffect1184ui_story.fillFlat = true
					arg_327_1.var_.characterEffect1184ui_story.fillRatio = var_330_15
				end
			end

			if arg_327_1.time_ >= var_330_12 + var_330_13 and arg_327_1.time_ < var_330_12 + var_330_13 + arg_330_0 and arg_327_1.var_.characterEffect1184ui_story then
				local var_330_16 = 0.5

				arg_327_1.var_.characterEffect1184ui_story.fillFlat = true
				arg_327_1.var_.characterEffect1184ui_story.fillRatio = var_330_16
			end

			local var_330_17 = arg_327_1.actors_["1019ui_story"]
			local var_330_18 = 0

			if var_330_18 < arg_327_1.time_ and arg_327_1.time_ <= var_330_18 + arg_330_0 and arg_327_1.var_.characterEffect1019ui_story == nil then
				arg_327_1.var_.characterEffect1019ui_story = var_330_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_19 = 0.2

			if var_330_18 <= arg_327_1.time_ and arg_327_1.time_ < var_330_18 + var_330_19 then
				local var_330_20 = (arg_327_1.time_ - var_330_18) / var_330_19

				if arg_327_1.var_.characterEffect1019ui_story then
					arg_327_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_18 + var_330_19 and arg_327_1.time_ < var_330_18 + var_330_19 + arg_330_0 and arg_327_1.var_.characterEffect1019ui_story then
				arg_327_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_330_21 = 0
			local var_330_22 = 0.575

			if var_330_21 < arg_327_1.time_ and arg_327_1.time_ <= var_330_21 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_23 = arg_327_1:FormatText(StoryNameCfg[13].name)

				arg_327_1.leftNameTxt_.text = var_330_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_24 = arg_327_1:GetWordFromCfg(110131078)
				local var_330_25 = arg_327_1:FormatText(var_330_24.content)

				arg_327_1.text_.text = var_330_25

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_26 = 23
				local var_330_27 = utf8.len(var_330_25)
				local var_330_28 = var_330_26 <= 0 and var_330_22 or var_330_22 * (var_330_27 / var_330_26)

				if var_330_28 > 0 and var_330_22 < var_330_28 then
					arg_327_1.talkMaxDuration = var_330_28

					if var_330_28 + var_330_21 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_28 + var_330_21
					end
				end

				arg_327_1.text_.text = var_330_25
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131078", "story_v_out_110131.awb") ~= 0 then
					local var_330_29 = manager.audio:GetVoiceLength("story_v_out_110131", "110131078", "story_v_out_110131.awb") / 1000

					if var_330_29 + var_330_21 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_29 + var_330_21
					end

					if var_330_24.prefab_name ~= "" and arg_327_1.actors_[var_330_24.prefab_name] ~= nil then
						local var_330_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_24.prefab_name].transform, "story_v_out_110131", "110131078", "story_v_out_110131.awb")

						arg_327_1:RecordAudio("110131078", var_330_30)
						arg_327_1:RecordAudio("110131078", var_330_30)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_110131", "110131078", "story_v_out_110131.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_110131", "110131078", "story_v_out_110131.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_31 = math.max(var_330_22, arg_327_1.talkMaxDuration)

			if var_330_21 <= arg_327_1.time_ and arg_327_1.time_ < var_330_21 + var_330_31 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_21) / var_330_31

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_21 + var_330_31 and arg_327_1.time_ < var_330_21 + var_330_31 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play110131079 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 110131079
		arg_331_1.duration_ = 5

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play110131080(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1019ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1019ui_story == nil then
				arg_331_1.var_.characterEffect1019ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.2

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1019ui_story then
					local var_334_4 = Mathf.Lerp(0, 0.5, var_334_3)

					arg_331_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1019ui_story.fillRatio = var_334_4
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1019ui_story then
				local var_334_5 = 0.5

				arg_331_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1019ui_story.fillRatio = var_334_5
			end

			local var_334_6 = 0
			local var_334_7 = 0.4

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_8 = arg_331_1:FormatText(StoryNameCfg[7].name)

				arg_331_1.leftNameTxt_.text = var_334_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_9 = arg_331_1:GetWordFromCfg(110131079)
				local var_334_10 = arg_331_1:FormatText(var_334_9.content)

				arg_331_1.text_.text = var_334_10

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_11 = 16
				local var_334_12 = utf8.len(var_334_10)
				local var_334_13 = var_334_11 <= 0 and var_334_7 or var_334_7 * (var_334_12 / var_334_11)

				if var_334_13 > 0 and var_334_7 < var_334_13 then
					arg_331_1.talkMaxDuration = var_334_13

					if var_334_13 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_13 + var_334_6
					end
				end

				arg_331_1.text_.text = var_334_10
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_14 = math.max(var_334_7, arg_331_1.talkMaxDuration)

			if var_334_6 <= arg_331_1.time_ and arg_331_1.time_ < var_334_6 + var_334_14 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_6) / var_334_14

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_6 + var_334_14 and arg_331_1.time_ < var_334_6 + var_334_14 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play110131080 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 110131080
		arg_335_1.duration_ = 8.266

		local var_335_0 = {
			ja = 8.266,
			ko = 5,
			zh = 5.6,
			en = 5.566
		}
		local var_335_1 = manager.audio:GetLocalizationFlag()

		if var_335_0[var_335_1] ~= nil then
			arg_335_1.duration_ = var_335_0[var_335_1]
		end

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play110131081(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1019ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect1019ui_story == nil then
				arg_335_1.var_.characterEffect1019ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.2

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect1019ui_story then
					arg_335_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect1019ui_story then
				arg_335_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_338_4 = 0

			if var_338_4 < arg_335_1.time_ and arg_335_1.time_ <= var_338_4 + arg_338_0 then
				arg_335_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action5_1")
			end

			local var_338_5 = 0

			if var_338_5 < arg_335_1.time_ and arg_335_1.time_ <= var_338_5 + arg_338_0 then
				arg_335_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_338_6 = 0
			local var_338_7 = 0.625

			if var_338_6 < arg_335_1.time_ and arg_335_1.time_ <= var_338_6 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_8 = arg_335_1:FormatText(StoryNameCfg[13].name)

				arg_335_1.leftNameTxt_.text = var_338_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_9 = arg_335_1:GetWordFromCfg(110131080)
				local var_338_10 = arg_335_1:FormatText(var_338_9.content)

				arg_335_1.text_.text = var_338_10

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_11 = 25
				local var_338_12 = utf8.len(var_338_10)
				local var_338_13 = var_338_11 <= 0 and var_338_7 or var_338_7 * (var_338_12 / var_338_11)

				if var_338_13 > 0 and var_338_7 < var_338_13 then
					arg_335_1.talkMaxDuration = var_338_13

					if var_338_13 + var_338_6 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_13 + var_338_6
					end
				end

				arg_335_1.text_.text = var_338_10
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131080", "story_v_out_110131.awb") ~= 0 then
					local var_338_14 = manager.audio:GetVoiceLength("story_v_out_110131", "110131080", "story_v_out_110131.awb") / 1000

					if var_338_14 + var_338_6 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_14 + var_338_6
					end

					if var_338_9.prefab_name ~= "" and arg_335_1.actors_[var_338_9.prefab_name] ~= nil then
						local var_338_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_9.prefab_name].transform, "story_v_out_110131", "110131080", "story_v_out_110131.awb")

						arg_335_1:RecordAudio("110131080", var_338_15)
						arg_335_1:RecordAudio("110131080", var_338_15)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_110131", "110131080", "story_v_out_110131.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_110131", "110131080", "story_v_out_110131.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_16 = math.max(var_338_7, arg_335_1.talkMaxDuration)

			if var_338_6 <= arg_335_1.time_ and arg_335_1.time_ < var_338_6 + var_338_16 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_6) / var_338_16

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_6 + var_338_16 and arg_335_1.time_ < var_338_6 + var_338_16 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play110131081 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 110131081
		arg_339_1.duration_ = 9.933

		local var_339_0 = {
			ja = 9.9,
			ko = 9.633,
			zh = 9.933,
			en = 9.266
		}
		local var_339_1 = manager.audio:GetLocalizationFlag()

		if var_339_0[var_339_1] ~= nil then
			arg_339_1.duration_ = var_339_0[var_339_1]
		end

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play110131082(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1184ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1184ui_story = var_342_0.localPosition

				local var_342_2 = "1184ui_story"

				arg_339_1:ShowWeapon(arg_339_1.var_[var_342_2 .. "Animator"].transform, false)
			end

			local var_342_3 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_3 then
				local var_342_4 = (arg_339_1.time_ - var_342_1) / var_342_3
				local var_342_5 = Vector3.New(0, 100, 0)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1184ui_story, var_342_5, var_342_4)

				local var_342_6 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_6.x, var_342_6.y, var_342_6.z)

				local var_342_7 = var_342_0.localEulerAngles

				var_342_7.z = 0
				var_342_7.x = 0
				var_342_0.localEulerAngles = var_342_7
			end

			if arg_339_1.time_ >= var_342_1 + var_342_3 and arg_339_1.time_ < var_342_1 + var_342_3 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0, 100, 0)

				local var_342_8 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_8.x, var_342_8.y, var_342_8.z)

				local var_342_9 = var_342_0.localEulerAngles

				var_342_9.z = 0
				var_342_9.x = 0
				var_342_0.localEulerAngles = var_342_9
			end

			local var_342_10 = arg_339_1.actors_["1019ui_story"].transform
			local var_342_11 = 0

			if var_342_11 < arg_339_1.time_ and arg_339_1.time_ <= var_342_11 + arg_342_0 then
				arg_339_1.var_.moveOldPos1019ui_story = var_342_10.localPosition
			end

			local var_342_12 = 0.001

			if var_342_11 <= arg_339_1.time_ and arg_339_1.time_ < var_342_11 + var_342_12 then
				local var_342_13 = (arg_339_1.time_ - var_342_11) / var_342_12
				local var_342_14 = Vector3.New(0, 100, 0)

				var_342_10.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1019ui_story, var_342_14, var_342_13)

				local var_342_15 = manager.ui.mainCamera.transform.position - var_342_10.position

				var_342_10.forward = Vector3.New(var_342_15.x, var_342_15.y, var_342_15.z)

				local var_342_16 = var_342_10.localEulerAngles

				var_342_16.z = 0
				var_342_16.x = 0
				var_342_10.localEulerAngles = var_342_16
			end

			if arg_339_1.time_ >= var_342_11 + var_342_12 and arg_339_1.time_ < var_342_11 + var_342_12 + arg_342_0 then
				var_342_10.localPosition = Vector3.New(0, 100, 0)

				local var_342_17 = manager.ui.mainCamera.transform.position - var_342_10.position

				var_342_10.forward = Vector3.New(var_342_17.x, var_342_17.y, var_342_17.z)

				local var_342_18 = var_342_10.localEulerAngles

				var_342_18.z = 0
				var_342_18.x = 0
				var_342_10.localEulerAngles = var_342_18
			end

			local var_342_19 = arg_339_1.actors_["1111ui_story"].transform
			local var_342_20 = 0

			if var_342_20 < arg_339_1.time_ and arg_339_1.time_ <= var_342_20 + arg_342_0 then
				arg_339_1.var_.moveOldPos1111ui_story = var_342_19.localPosition
			end

			local var_342_21 = 0.1

			if var_342_20 <= arg_339_1.time_ and arg_339_1.time_ < var_342_20 + var_342_21 then
				local var_342_22 = (arg_339_1.time_ - var_342_20) / var_342_21
				local var_342_23 = Vector3.New(0, -0.83, -6)

				var_342_19.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1111ui_story, var_342_23, var_342_22)

				local var_342_24 = manager.ui.mainCamera.transform.position - var_342_19.position

				var_342_19.forward = Vector3.New(var_342_24.x, var_342_24.y, var_342_24.z)

				local var_342_25 = var_342_19.localEulerAngles

				var_342_25.z = 0
				var_342_25.x = 0
				var_342_19.localEulerAngles = var_342_25
			end

			if arg_339_1.time_ >= var_342_20 + var_342_21 and arg_339_1.time_ < var_342_20 + var_342_21 + arg_342_0 then
				var_342_19.localPosition = Vector3.New(0, -0.83, -6)

				local var_342_26 = manager.ui.mainCamera.transform.position - var_342_19.position

				var_342_19.forward = Vector3.New(var_342_26.x, var_342_26.y, var_342_26.z)

				local var_342_27 = var_342_19.localEulerAngles

				var_342_27.z = 0
				var_342_27.x = 0
				var_342_19.localEulerAngles = var_342_27
			end

			local var_342_28 = 0

			if var_342_28 < arg_339_1.time_ and arg_339_1.time_ <= var_342_28 + arg_342_0 then
				arg_339_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action5_1")
			end

			local var_342_29 = 0

			if var_342_29 < arg_339_1.time_ and arg_339_1.time_ <= var_342_29 + arg_342_0 then
				arg_339_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_342_30 = arg_339_1.actors_["1111ui_story"]
			local var_342_31 = 0

			if var_342_31 < arg_339_1.time_ and arg_339_1.time_ <= var_342_31 + arg_342_0 and arg_339_1.var_.characterEffect1111ui_story == nil then
				arg_339_1.var_.characterEffect1111ui_story = var_342_30:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_32 = 0.2

			if var_342_31 <= arg_339_1.time_ and arg_339_1.time_ < var_342_31 + var_342_32 then
				local var_342_33 = (arg_339_1.time_ - var_342_31) / var_342_32

				if arg_339_1.var_.characterEffect1111ui_story then
					arg_339_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_31 + var_342_32 and arg_339_1.time_ < var_342_31 + var_342_32 + arg_342_0 and arg_339_1.var_.characterEffect1111ui_story then
				arg_339_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_342_34 = 0
			local var_342_35 = 0.975

			if var_342_34 < arg_339_1.time_ and arg_339_1.time_ <= var_342_34 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_36 = arg_339_1:FormatText(StoryNameCfg[67].name)

				arg_339_1.leftNameTxt_.text = var_342_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_37 = arg_339_1:GetWordFromCfg(110131081)
				local var_342_38 = arg_339_1:FormatText(var_342_37.content)

				arg_339_1.text_.text = var_342_38

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_39 = 39
				local var_342_40 = utf8.len(var_342_38)
				local var_342_41 = var_342_39 <= 0 and var_342_35 or var_342_35 * (var_342_40 / var_342_39)

				if var_342_41 > 0 and var_342_35 < var_342_41 then
					arg_339_1.talkMaxDuration = var_342_41

					if var_342_41 + var_342_34 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_41 + var_342_34
					end
				end

				arg_339_1.text_.text = var_342_38
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131081", "story_v_out_110131.awb") ~= 0 then
					local var_342_42 = manager.audio:GetVoiceLength("story_v_out_110131", "110131081", "story_v_out_110131.awb") / 1000

					if var_342_42 + var_342_34 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_42 + var_342_34
					end

					if var_342_37.prefab_name ~= "" and arg_339_1.actors_[var_342_37.prefab_name] ~= nil then
						local var_342_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_37.prefab_name].transform, "story_v_out_110131", "110131081", "story_v_out_110131.awb")

						arg_339_1:RecordAudio("110131081", var_342_43)
						arg_339_1:RecordAudio("110131081", var_342_43)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_110131", "110131081", "story_v_out_110131.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_110131", "110131081", "story_v_out_110131.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_44 = math.max(var_342_35, arg_339_1.talkMaxDuration)

			if var_342_34 <= arg_339_1.time_ and arg_339_1.time_ < var_342_34 + var_342_44 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_34) / var_342_44

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_34 + var_342_44 and arg_339_1.time_ < var_342_34 + var_342_44 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play110131082 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 110131082
		arg_343_1.duration_ = 2.166

		local var_343_0 = {
			ja = 2.066,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.166
		}
		local var_343_1 = manager.audio:GetLocalizationFlag()

		if var_343_0[var_343_1] ~= nil then
			arg_343_1.duration_ = var_343_0[var_343_1]
		end

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play110131083(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1111ui_story"].transform
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1.var_.moveOldPos1111ui_story = var_346_0.localPosition
			end

			local var_346_2 = 0.001

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2
				local var_346_4 = Vector3.New(0, 100, 0)

				var_346_0.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1111ui_story, var_346_4, var_346_3)

				local var_346_5 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_5.x, var_346_5.y, var_346_5.z)

				local var_346_6 = var_346_0.localEulerAngles

				var_346_6.z = 0
				var_346_6.x = 0
				var_346_0.localEulerAngles = var_346_6
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 then
				var_346_0.localPosition = Vector3.New(0, 100, 0)

				local var_346_7 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_7.x, var_346_7.y, var_346_7.z)

				local var_346_8 = var_346_0.localEulerAngles

				var_346_8.z = 0
				var_346_8.x = 0
				var_346_0.localEulerAngles = var_346_8
			end

			local var_346_9 = arg_343_1.actors_["1019ui_story"].transform
			local var_346_10 = 0

			if var_346_10 < arg_343_1.time_ and arg_343_1.time_ <= var_346_10 + arg_346_0 then
				arg_343_1.var_.moveOldPos1019ui_story = var_346_9.localPosition
			end

			local var_346_11 = 0.001

			if var_346_10 <= arg_343_1.time_ and arg_343_1.time_ < var_346_10 + var_346_11 then
				local var_346_12 = (arg_343_1.time_ - var_346_10) / var_346_11
				local var_346_13 = Vector3.New(0, -1.08, -5.9)

				var_346_9.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1019ui_story, var_346_13, var_346_12)

				local var_346_14 = manager.ui.mainCamera.transform.position - var_346_9.position

				var_346_9.forward = Vector3.New(var_346_14.x, var_346_14.y, var_346_14.z)

				local var_346_15 = var_346_9.localEulerAngles

				var_346_15.z = 0
				var_346_15.x = 0
				var_346_9.localEulerAngles = var_346_15
			end

			if arg_343_1.time_ >= var_346_10 + var_346_11 and arg_343_1.time_ < var_346_10 + var_346_11 + arg_346_0 then
				var_346_9.localPosition = Vector3.New(0, -1.08, -5.9)

				local var_346_16 = manager.ui.mainCamera.transform.position - var_346_9.position

				var_346_9.forward = Vector3.New(var_346_16.x, var_346_16.y, var_346_16.z)

				local var_346_17 = var_346_9.localEulerAngles

				var_346_17.z = 0
				var_346_17.x = 0
				var_346_9.localEulerAngles = var_346_17
			end

			local var_346_18 = 0

			if var_346_18 < arg_343_1.time_ and arg_343_1.time_ <= var_346_18 + arg_346_0 then
				arg_343_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action1_1")
			end

			local var_346_19 = 0

			if var_346_19 < arg_343_1.time_ and arg_343_1.time_ <= var_346_19 + arg_346_0 then
				arg_343_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_346_20 = arg_343_1.actors_["1019ui_story"]
			local var_346_21 = 0

			if var_346_21 < arg_343_1.time_ and arg_343_1.time_ <= var_346_21 + arg_346_0 and arg_343_1.var_.characterEffect1019ui_story == nil then
				arg_343_1.var_.characterEffect1019ui_story = var_346_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_22 = 0.2

			if var_346_21 <= arg_343_1.time_ and arg_343_1.time_ < var_346_21 + var_346_22 then
				local var_346_23 = (arg_343_1.time_ - var_346_21) / var_346_22

				if arg_343_1.var_.characterEffect1019ui_story then
					arg_343_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_343_1.time_ >= var_346_21 + var_346_22 and arg_343_1.time_ < var_346_21 + var_346_22 + arg_346_0 and arg_343_1.var_.characterEffect1019ui_story then
				arg_343_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_346_24 = 0
			local var_346_25 = 0.15

			if var_346_24 < arg_343_1.time_ and arg_343_1.time_ <= var_346_24 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_26 = arg_343_1:FormatText(StoryNameCfg[13].name)

				arg_343_1.leftNameTxt_.text = var_346_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_27 = arg_343_1:GetWordFromCfg(110131082)
				local var_346_28 = arg_343_1:FormatText(var_346_27.content)

				arg_343_1.text_.text = var_346_28

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_29 = 6
				local var_346_30 = utf8.len(var_346_28)
				local var_346_31 = var_346_29 <= 0 and var_346_25 or var_346_25 * (var_346_30 / var_346_29)

				if var_346_31 > 0 and var_346_25 < var_346_31 then
					arg_343_1.talkMaxDuration = var_346_31

					if var_346_31 + var_346_24 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_31 + var_346_24
					end
				end

				arg_343_1.text_.text = var_346_28
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131082", "story_v_out_110131.awb") ~= 0 then
					local var_346_32 = manager.audio:GetVoiceLength("story_v_out_110131", "110131082", "story_v_out_110131.awb") / 1000

					if var_346_32 + var_346_24 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_32 + var_346_24
					end

					if var_346_27.prefab_name ~= "" and arg_343_1.actors_[var_346_27.prefab_name] ~= nil then
						local var_346_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_27.prefab_name].transform, "story_v_out_110131", "110131082", "story_v_out_110131.awb")

						arg_343_1:RecordAudio("110131082", var_346_33)
						arg_343_1:RecordAudio("110131082", var_346_33)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_110131", "110131082", "story_v_out_110131.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_110131", "110131082", "story_v_out_110131.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_34 = math.max(var_346_25, arg_343_1.talkMaxDuration)

			if var_346_24 <= arg_343_1.time_ and arg_343_1.time_ < var_346_24 + var_346_34 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_24) / var_346_34

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_24 + var_346_34 and arg_343_1.time_ < var_346_24 + var_346_34 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play110131083 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 110131083
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play110131084(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1019ui_story"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.characterEffect1019ui_story == nil then
				arg_347_1.var_.characterEffect1019ui_story = var_350_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_2 = 0.2

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.characterEffect1019ui_story then
					local var_350_4 = Mathf.Lerp(0, 0.5, var_350_3)

					arg_347_1.var_.characterEffect1019ui_story.fillFlat = true
					arg_347_1.var_.characterEffect1019ui_story.fillRatio = var_350_4
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.characterEffect1019ui_story then
				local var_350_5 = 0.5

				arg_347_1.var_.characterEffect1019ui_story.fillFlat = true
				arg_347_1.var_.characterEffect1019ui_story.fillRatio = var_350_5
			end

			local var_350_6 = 0
			local var_350_7 = 0.8

			if var_350_6 < arg_347_1.time_ and arg_347_1.time_ <= var_350_6 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_8 = arg_347_1:FormatText(StoryNameCfg[7].name)

				arg_347_1.leftNameTxt_.text = var_350_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_9 = arg_347_1:GetWordFromCfg(110131083)
				local var_350_10 = arg_347_1:FormatText(var_350_9.content)

				arg_347_1.text_.text = var_350_10

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_11 = 32
				local var_350_12 = utf8.len(var_350_10)
				local var_350_13 = var_350_11 <= 0 and var_350_7 or var_350_7 * (var_350_12 / var_350_11)

				if var_350_13 > 0 and var_350_7 < var_350_13 then
					arg_347_1.talkMaxDuration = var_350_13

					if var_350_13 + var_350_6 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_13 + var_350_6
					end
				end

				arg_347_1.text_.text = var_350_10
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_14 = math.max(var_350_7, arg_347_1.talkMaxDuration)

			if var_350_6 <= arg_347_1.time_ and arg_347_1.time_ < var_350_6 + var_350_14 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_6) / var_350_14

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_6 + var_350_14 and arg_347_1.time_ < var_350_6 + var_350_14 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play110131084 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 110131084
		arg_351_1.duration_ = 7.8

		local var_351_0 = {
			ja = 7.8,
			ko = 6.6,
			zh = 4.566,
			en = 5.5
		}
		local var_351_1 = manager.audio:GetLocalizationFlag()

		if var_351_0[var_351_1] ~= nil then
			arg_351_1.duration_ = var_351_0[var_351_1]
		end

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play110131085(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1019ui_story"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.characterEffect1019ui_story == nil then
				arg_351_1.var_.characterEffect1019ui_story = var_354_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_2 = 0.2

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.characterEffect1019ui_story then
					arg_351_1.var_.characterEffect1019ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.characterEffect1019ui_story then
				arg_351_1.var_.characterEffect1019ui_story.fillFlat = false
			end

			local var_354_4 = 0

			if var_354_4 < arg_351_1.time_ and arg_351_1.time_ <= var_354_4 + arg_354_0 then
				arg_351_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/1019/1019action/1019action4_1")
			end

			local var_354_5 = 0

			if var_354_5 < arg_351_1.time_ and arg_351_1.time_ <= var_354_5 + arg_354_0 then
				arg_351_1:PlayTimeline("1019ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_354_6 = 0
			local var_354_7 = 0.575

			if var_354_6 < arg_351_1.time_ and arg_351_1.time_ <= var_354_6 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_8 = arg_351_1:FormatText(StoryNameCfg[13].name)

				arg_351_1.leftNameTxt_.text = var_354_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_9 = arg_351_1:GetWordFromCfg(110131084)
				local var_354_10 = arg_351_1:FormatText(var_354_9.content)

				arg_351_1.text_.text = var_354_10

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_11 = 23
				local var_354_12 = utf8.len(var_354_10)
				local var_354_13 = var_354_11 <= 0 and var_354_7 or var_354_7 * (var_354_12 / var_354_11)

				if var_354_13 > 0 and var_354_7 < var_354_13 then
					arg_351_1.talkMaxDuration = var_354_13

					if var_354_13 + var_354_6 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_13 + var_354_6
					end
				end

				arg_351_1.text_.text = var_354_10
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131084", "story_v_out_110131.awb") ~= 0 then
					local var_354_14 = manager.audio:GetVoiceLength("story_v_out_110131", "110131084", "story_v_out_110131.awb") / 1000

					if var_354_14 + var_354_6 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_14 + var_354_6
					end

					if var_354_9.prefab_name ~= "" and arg_351_1.actors_[var_354_9.prefab_name] ~= nil then
						local var_354_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_9.prefab_name].transform, "story_v_out_110131", "110131084", "story_v_out_110131.awb")

						arg_351_1:RecordAudio("110131084", var_354_15)
						arg_351_1:RecordAudio("110131084", var_354_15)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_110131", "110131084", "story_v_out_110131.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_110131", "110131084", "story_v_out_110131.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_16 = math.max(var_354_7, arg_351_1.talkMaxDuration)

			if var_354_6 <= arg_351_1.time_ and arg_351_1.time_ < var_354_6 + var_354_16 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_6) / var_354_16

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_6 + var_354_16 and arg_351_1.time_ < var_354_6 + var_354_16 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play110131085 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 110131085
		arg_355_1.duration_ = 9.666

		local var_355_0 = {
			ja = 9.666,
			ko = 8.833,
			zh = 7.466,
			en = 9.066
		}
		local var_355_1 = manager.audio:GetLocalizationFlag()

		if var_355_0[var_355_1] ~= nil then
			arg_355_1.duration_ = var_355_0[var_355_1]
		end

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play110131086(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1019ui_story"].transform
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 then
				arg_355_1.var_.moveOldPos1019ui_story = var_358_0.localPosition
			end

			local var_358_2 = 0.001

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2
				local var_358_4 = Vector3.New(0, 100, 0)

				var_358_0.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos1019ui_story, var_358_4, var_358_3)

				local var_358_5 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_5.x, var_358_5.y, var_358_5.z)

				local var_358_6 = var_358_0.localEulerAngles

				var_358_6.z = 0
				var_358_6.x = 0
				var_358_0.localEulerAngles = var_358_6
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 then
				var_358_0.localPosition = Vector3.New(0, 100, 0)

				local var_358_7 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_7.x, var_358_7.y, var_358_7.z)

				local var_358_8 = var_358_0.localEulerAngles

				var_358_8.z = 0
				var_358_8.x = 0
				var_358_0.localEulerAngles = var_358_8
			end

			local var_358_9 = arg_355_1.actors_["1111ui_story"].transform
			local var_358_10 = 0

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 then
				arg_355_1.var_.moveOldPos1111ui_story = var_358_9.localPosition
			end

			local var_358_11 = 0.001

			if var_358_10 <= arg_355_1.time_ and arg_355_1.time_ < var_358_10 + var_358_11 then
				local var_358_12 = (arg_355_1.time_ - var_358_10) / var_358_11
				local var_358_13 = Vector3.New(0, -0.83, -6)

				var_358_9.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos1111ui_story, var_358_13, var_358_12)

				local var_358_14 = manager.ui.mainCamera.transform.position - var_358_9.position

				var_358_9.forward = Vector3.New(var_358_14.x, var_358_14.y, var_358_14.z)

				local var_358_15 = var_358_9.localEulerAngles

				var_358_15.z = 0
				var_358_15.x = 0
				var_358_9.localEulerAngles = var_358_15
			end

			if arg_355_1.time_ >= var_358_10 + var_358_11 and arg_355_1.time_ < var_358_10 + var_358_11 + arg_358_0 then
				var_358_9.localPosition = Vector3.New(0, -0.83, -6)

				local var_358_16 = manager.ui.mainCamera.transform.position - var_358_9.position

				var_358_9.forward = Vector3.New(var_358_16.x, var_358_16.y, var_358_16.z)

				local var_358_17 = var_358_9.localEulerAngles

				var_358_17.z = 0
				var_358_17.x = 0
				var_358_9.localEulerAngles = var_358_17
			end

			local var_358_18 = 0

			if var_358_18 < arg_355_1.time_ and arg_355_1.time_ <= var_358_18 + arg_358_0 then
				arg_355_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_358_19 = arg_355_1.actors_["1111ui_story"]
			local var_358_20 = 0

			if var_358_20 < arg_355_1.time_ and arg_355_1.time_ <= var_358_20 + arg_358_0 and arg_355_1.var_.characterEffect1111ui_story == nil then
				arg_355_1.var_.characterEffect1111ui_story = var_358_19:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_21 = 0.2

			if var_358_20 <= arg_355_1.time_ and arg_355_1.time_ < var_358_20 + var_358_21 then
				local var_358_22 = (arg_355_1.time_ - var_358_20) / var_358_21

				if arg_355_1.var_.characterEffect1111ui_story then
					arg_355_1.var_.characterEffect1111ui_story.fillFlat = false
				end
			end

			if arg_355_1.time_ >= var_358_20 + var_358_21 and arg_355_1.time_ < var_358_20 + var_358_21 + arg_358_0 and arg_355_1.var_.characterEffect1111ui_story then
				arg_355_1.var_.characterEffect1111ui_story.fillFlat = false
			end

			local var_358_23 = 0

			if var_358_23 < arg_355_1.time_ and arg_355_1.time_ <= var_358_23 + arg_358_0 then
				arg_355_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111action/1111action5_1")
			end

			local var_358_24 = 0
			local var_358_25 = 0.8

			if var_358_24 < arg_355_1.time_ and arg_355_1.time_ <= var_358_24 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_26 = arg_355_1:FormatText(StoryNameCfg[67].name)

				arg_355_1.leftNameTxt_.text = var_358_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_27 = arg_355_1:GetWordFromCfg(110131085)
				local var_358_28 = arg_355_1:FormatText(var_358_27.content)

				arg_355_1.text_.text = var_358_28

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_29 = 32
				local var_358_30 = utf8.len(var_358_28)
				local var_358_31 = var_358_29 <= 0 and var_358_25 or var_358_25 * (var_358_30 / var_358_29)

				if var_358_31 > 0 and var_358_25 < var_358_31 then
					arg_355_1.talkMaxDuration = var_358_31

					if var_358_31 + var_358_24 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_31 + var_358_24
					end
				end

				arg_355_1.text_.text = var_358_28
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131085", "story_v_out_110131.awb") ~= 0 then
					local var_358_32 = manager.audio:GetVoiceLength("story_v_out_110131", "110131085", "story_v_out_110131.awb") / 1000

					if var_358_32 + var_358_24 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_32 + var_358_24
					end

					if var_358_27.prefab_name ~= "" and arg_355_1.actors_[var_358_27.prefab_name] ~= nil then
						local var_358_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_27.prefab_name].transform, "story_v_out_110131", "110131085", "story_v_out_110131.awb")

						arg_355_1:RecordAudio("110131085", var_358_33)
						arg_355_1:RecordAudio("110131085", var_358_33)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_110131", "110131085", "story_v_out_110131.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_110131", "110131085", "story_v_out_110131.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_34 = math.max(var_358_25, arg_355_1.talkMaxDuration)

			if var_358_24 <= arg_355_1.time_ and arg_355_1.time_ < var_358_24 + var_358_34 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_24) / var_358_34

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_24 + var_358_34 and arg_355_1.time_ < var_358_24 + var_358_34 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play110131086 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 110131086
		arg_359_1.duration_ = 8.566

		local var_359_0 = {
			ja = 8.566,
			ko = 3.566,
			zh = 4.3,
			en = 4.566
		}
		local var_359_1 = manager.audio:GetLocalizationFlag()

		if var_359_0[var_359_1] ~= nil then
			arg_359_1.duration_ = var_359_0[var_359_1]
		end

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
			arg_359_1.auto_ = false
		end

		function arg_359_1.playNext_(arg_361_0)
			arg_359_1.onStoryFinished_()
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/1111/1111actionlink/1111action454")
			end

			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 then
				arg_359_1:PlayTimeline("1111ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_362_2 = 0
			local var_362_3 = 0.35

			if var_362_2 < arg_359_1.time_ and arg_359_1.time_ <= var_362_2 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_4 = arg_359_1:FormatText(StoryNameCfg[67].name)

				arg_359_1.leftNameTxt_.text = var_362_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_5 = arg_359_1:GetWordFromCfg(110131086)
				local var_362_6 = arg_359_1:FormatText(var_362_5.content)

				arg_359_1.text_.text = var_362_6

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_7 = 14
				local var_362_8 = utf8.len(var_362_6)
				local var_362_9 = var_362_7 <= 0 and var_362_3 or var_362_3 * (var_362_8 / var_362_7)

				if var_362_9 > 0 and var_362_3 < var_362_9 then
					arg_359_1.talkMaxDuration = var_362_9

					if var_362_9 + var_362_2 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_9 + var_362_2
					end
				end

				arg_359_1.text_.text = var_362_6
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_110131", "110131086", "story_v_out_110131.awb") ~= 0 then
					local var_362_10 = manager.audio:GetVoiceLength("story_v_out_110131", "110131086", "story_v_out_110131.awb") / 1000

					if var_362_10 + var_362_2 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_10 + var_362_2
					end

					if var_362_5.prefab_name ~= "" and arg_359_1.actors_[var_362_5.prefab_name] ~= nil then
						local var_362_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_5.prefab_name].transform, "story_v_out_110131", "110131086", "story_v_out_110131.awb")

						arg_359_1:RecordAudio("110131086", var_362_11)
						arg_359_1:RecordAudio("110131086", var_362_11)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_110131", "110131086", "story_v_out_110131.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_110131", "110131086", "story_v_out_110131.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_12 = math.max(var_362_3, arg_359_1.talkMaxDuration)

			if var_362_2 <= arg_359_1.time_ and arg_359_1.time_ < var_362_2 + var_362_12 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_2) / var_362_12

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_2 + var_362_12 and arg_359_1.time_ < var_362_2 + var_362_12 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST19",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OS0102",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OS0102a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B12a"
	},
	voices = {
		"story_v_out_110131.awb"
	}
}
