return {
	Play1101101001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1101101001
		arg_1_1.duration_ = 5.699999999999

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play1101101002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "A02d"

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
				local var_4_5 = arg_1_1.bgs_.A02d

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
					if iter_4_0 ~= "A02d" then
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

			local var_4_17 = 3.5

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

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				arg_1_1.fswbg_:SetActive(true)
				arg_1_1.dialog_:SetActive(false)

				arg_1_1.fswtw_.percent = 0

				local var_4_23 = arg_1_1:GetWordFromCfg(1101101001)
				local var_4_24 = arg_1_1:FormatText(var_4_23.content)

				arg_1_1.fswt_.text = var_4_24

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.fswt_)

				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()

				arg_1_1.typewritterCharCountI18N = 0

				SetActive(arg_1_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_1_1:ShowNextGo(false)
			end

			local var_4_25 = 3.5

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.oldValueTypewriter = arg_1_1.fswtw_.percent

				arg_1_1:ShowNextGo(false)
			end

			local var_4_26 = 33
			local var_4_27 = 2.2
			local var_4_28 = arg_1_1:GetWordFromCfg(1101101001)
			local var_4_29 = arg_1_1:FormatText(var_4_28.content)
			local var_4_30, var_4_31 = arg_1_1:GetPercentByPara(var_4_29, 1)

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				local var_4_32 = var_4_26 <= 0 and var_4_27 or var_4_27 * ((var_4_31 - arg_1_1.typewritterCharCountI18N) / var_4_26)

				if var_4_32 > 0 and var_4_27 < var_4_32 then
					arg_1_1.talkMaxDuration = var_4_32

					if var_4_32 + var_4_25 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_32 + var_4_25
					end
				end
			end

			local var_4_33 = 2.2
			local var_4_34 = math.max(var_4_33, arg_1_1.talkMaxDuration)

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_34 then
				local var_4_35 = (arg_1_1.time_ - var_4_25) / var_4_34

				arg_1_1.fswtw_.percent = Mathf.Lerp(arg_1_1.var_.oldValueTypewriter, var_4_30, var_4_35)
				arg_1_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_1_1.fswtw_:SetDirty()
			end

			if arg_1_1.time_ >= var_4_25 + var_4_34 and arg_1_1.time_ < var_4_25 + var_4_34 + arg_4_0 then
				arg_1_1.fswtw_.percent = var_4_30

				arg_1_1.fswtw_:SetDirty()
				arg_1_1:ShowNextGo(true)

				arg_1_1.typewritterCharCountI18N = var_4_31
			end

			local var_4_36 = 3.5

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				local var_4_37 = arg_1_1.fswbg_.transform:Find("textbox/adapt/content") or arg_1_1.fswbg_.transform:Find("textbox/content")
				local var_4_38 = var_4_37:GetComponent("Text")
				local var_4_39 = var_4_37:GetComponent("RectTransform")

				var_4_38.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_4_39.offsetMin = Vector2.New(0, 0)
				var_4_39.offsetMax = Vector2.New(0, 0)
			end

			local var_4_40 = 0
			local var_4_41 = 0.3

			if var_4_40 < arg_1_1.time_ and arg_1_1.time_ <= var_4_40 + arg_4_0 then
				local var_4_42 = "play"
				local var_4_43 = "music"

				arg_1_1:AudioAction(var_4_42, var_4_43, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_44 = 0.533333333333333
			local var_4_45 = 1

			if var_4_44 < arg_1_1.time_ and arg_1_1.time_ <= var_4_44 + arg_4_0 then
				local var_4_46 = "play"
				local var_4_47 = "music"

				arg_1_1:AudioAction(var_4_46, var_4_47, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end
		end
	end,
	Play1101101002 = function(arg_5_0, arg_5_1)
		arg_5_1.time_ = 0
		arg_5_1.frameCnt_ = 0
		arg_5_1.state_ = "playing"
		arg_5_1.curTalkId_ = 1101101002
		arg_5_1.duration_ = 9.199999999999

		SetActive(arg_5_1.tipsGo_, false)

		function arg_5_1.onSingleLineFinish_()
			arg_5_1.onSingleLineUpdate_ = nil
			arg_5_1.onSingleLineFinish_ = nil
			arg_5_1.state_ = "waiting"
		end

		function arg_5_1.playNext_(arg_7_0)
			if arg_7_0 == 1 then
				arg_5_0:Play1101101003(arg_5_1)
			end
		end

		function arg_5_1.onSingleLineUpdate_(arg_8_0)
			local var_8_0 = "H03a"

			if arg_5_1.bgs_[var_8_0] == nil then
				local var_8_1 = Object.Instantiate(arg_5_1.paintGo_)

				var_8_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_8_0)
				var_8_1.name = var_8_0
				var_8_1.transform.parent = arg_5_1.stage_.transform
				var_8_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_5_1.bgs_[var_8_0] = var_8_1
			end

			local var_8_2 = 3.5

			if var_8_2 < arg_5_1.time_ and arg_5_1.time_ <= var_8_2 + arg_8_0 then
				local var_8_3 = manager.ui.mainCamera.transform.localPosition
				local var_8_4 = Vector3.New(0, 0, 10) + Vector3.New(var_8_3.x, var_8_3.y, 0)
				local var_8_5 = arg_5_1.bgs_.H03a

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
					if iter_8_0 ~= "H03a" then
						iter_8_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_8_16 = 3.5

			if var_8_16 < arg_5_1.time_ and arg_5_1.time_ <= var_8_16 + arg_8_0 then
				arg_5_1.mask_.enabled = true
				arg_5_1.mask_.raycastTarget = true

				arg_5_1:SetGaussion(false)
			end

			local var_8_17 = 3.5

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
				arg_5_1.mask_.enabled = true
				arg_5_1.mask_.raycastTarget = true

				arg_5_1:SetGaussion(false)
			end

			local var_8_23 = 3.5

			if var_8_22 <= arg_5_1.time_ and arg_5_1.time_ < var_8_22 + var_8_23 then
				local var_8_24 = (arg_5_1.time_ - var_8_22) / var_8_23
				local var_8_25 = Color.New(0, 0, 0)

				var_8_25.a = Mathf.Lerp(0, 1, var_8_24)
				arg_5_1.mask_.color = var_8_25
			end

			if arg_5_1.time_ >= var_8_22 + var_8_23 and arg_5_1.time_ < var_8_22 + var_8_23 + arg_8_0 then
				local var_8_26 = Color.New(0, 0, 0)

				var_8_26.a = 1
				arg_5_1.mask_.color = var_8_26
			end

			local var_8_27 = 7

			if var_8_27 < arg_5_1.time_ and arg_5_1.time_ <= var_8_27 + arg_8_0 then
				arg_5_1.var_.oldValueTypewriter = arg_5_1.fswtw_.percent

				arg_5_1:ShowNextGo(false)
			end

			local var_8_28 = 0
			local var_8_29 = 2.2
			local var_8_30 = arg_5_1:GetWordFromCfg(1101101001)
			local var_8_31 = arg_5_1:FormatText(var_8_30.content)
			local var_8_32, var_8_33 = arg_5_1:GetPercentByPara(var_8_31, 1)

			if var_8_27 < arg_5_1.time_ and arg_5_1.time_ <= var_8_27 + arg_8_0 then
				arg_5_1.talkMaxDuration = 0

				local var_8_34 = var_8_28 <= 0 and var_8_29 or var_8_29 * ((var_8_33 - arg_5_1.typewritterCharCountI18N) / var_8_28)

				if var_8_34 > 0 and var_8_29 < var_8_34 then
					arg_5_1.talkMaxDuration = var_8_34

					if var_8_34 + var_8_27 > arg_5_1.duration_ then
						arg_5_1.duration_ = var_8_34 + var_8_27
					end
				end
			end

			local var_8_35 = 2.2
			local var_8_36 = math.max(var_8_35, arg_5_1.talkMaxDuration)

			if var_8_27 <= arg_5_1.time_ and arg_5_1.time_ < var_8_27 + var_8_36 then
				local var_8_37 = (arg_5_1.time_ - var_8_27) / var_8_36

				arg_5_1.fswtw_.percent = Mathf.Lerp(arg_5_1.var_.oldValueTypewriter, var_8_32, var_8_37)
				arg_5_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_5_1.fswtw_:SetDirty()
			end

			if arg_5_1.time_ >= var_8_27 + var_8_36 and arg_5_1.time_ < var_8_27 + var_8_36 + arg_8_0 then
				arg_5_1.fswtw_.percent = var_8_32

				arg_5_1.fswtw_:SetDirty()
				arg_5_1:ShowNextGo(true)

				arg_5_1.typewritterCharCountI18N = var_8_33
			end

			local var_8_38 = 3.5

			if var_8_38 < arg_5_1.time_ and arg_5_1.time_ <= var_8_38 + arg_8_0 then
				arg_5_1.fswbg_:SetActive(false)
				arg_5_1.dialog_:SetActive(false)
				arg_5_1:ShowNextGo(false)
			end

			local var_8_39 = 3.51666666666667

			if var_8_39 < arg_5_1.time_ and arg_5_1.time_ <= var_8_39 + arg_8_0 then
				arg_5_1.fswbg_:SetActive(true)
				arg_5_1.dialog_:SetActive(false)

				arg_5_1.fswtw_.percent = 0

				local var_8_40 = arg_5_1:GetWordFromCfg(1101101002)
				local var_8_41 = arg_5_1:FormatText(var_8_40.content)

				arg_5_1.fswt_.text = var_8_41

				LuaForUtil.ClearLinePrefixSymbol(arg_5_1.fswt_)

				arg_5_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_5_1.fswtw_:SetDirty()

				arg_5_1.typewritterCharCountI18N = 0

				SetActive(arg_5_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_5_1:ShowNextGo(false)
			end
		end
	end,
	Play1101101003 = function(arg_9_0, arg_9_1)
		arg_9_1.time_ = 0
		arg_9_1.frameCnt_ = 0
		arg_9_1.state_ = "playing"
		arg_9_1.curTalkId_ = 1101101003
		arg_9_1.duration_ = 8.466666666666

		SetActive(arg_9_1.tipsGo_, false)

		function arg_9_1.onSingleLineFinish_()
			arg_9_1.onSingleLineUpdate_ = nil
			arg_9_1.onSingleLineFinish_ = nil
			arg_9_1.state_ = "waiting"
		end

		function arg_9_1.playNext_(arg_11_0)
			if arg_11_0 == 1 then
				arg_9_0:Play1101101004(arg_9_1)
			end
		end

		function arg_9_1.onSingleLineUpdate_(arg_12_0)
			local var_12_0 = "D07"

			if arg_9_1.bgs_[var_12_0] == nil then
				local var_12_1 = Object.Instantiate(arg_9_1.paintGo_)

				var_12_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_12_0)
				var_12_1.name = var_12_0
				var_12_1.transform.parent = arg_9_1.stage_.transform
				var_12_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_9_1.bgs_[var_12_0] = var_12_1
			end

			local var_12_2 = 3.5

			if var_12_2 < arg_9_1.time_ and arg_9_1.time_ <= var_12_2 + arg_12_0 then
				local var_12_3 = manager.ui.mainCamera.transform.localPosition
				local var_12_4 = Vector3.New(0, 0, 10) + Vector3.New(var_12_3.x, var_12_3.y, 0)
				local var_12_5 = arg_9_1.bgs_.D07

				var_12_5.transform.localPosition = var_12_4
				var_12_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_12_6 = var_12_5:GetComponent("SpriteRenderer")

				if var_12_6 and var_12_6.sprite then
					local var_12_7 = (var_12_5.transform.localPosition - var_12_3).z
					local var_12_8 = manager.ui.mainCameraCom_
					local var_12_9 = 2 * var_12_7 * Mathf.Tan(var_12_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_12_10 = var_12_9 * var_12_8.aspect
					local var_12_11 = var_12_6.sprite.bounds.size.x
					local var_12_12 = var_12_6.sprite.bounds.size.y
					local var_12_13 = var_12_10 / var_12_11
					local var_12_14 = var_12_9 / var_12_12
					local var_12_15 = var_12_14 < var_12_13 and var_12_13 or var_12_14

					var_12_5.transform.localScale = Vector3.New(var_12_15, var_12_15, 0)
				end

				for iter_12_0, iter_12_1 in pairs(arg_9_1.bgs_) do
					if iter_12_0 ~= "D07" then
						iter_12_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_12_16 = 0

			if var_12_16 < arg_9_1.time_ and arg_9_1.time_ <= var_12_16 + arg_12_0 then
				arg_9_1.mask_.enabled = true
				arg_9_1.mask_.raycastTarget = true

				arg_9_1:SetGaussion(false)
			end

			local var_12_17 = 3.5

			if var_12_16 <= arg_9_1.time_ and arg_9_1.time_ < var_12_16 + var_12_17 then
				local var_12_18 = (arg_9_1.time_ - var_12_16) / var_12_17
				local var_12_19 = Color.New(0, 0, 0)

				var_12_19.a = Mathf.Lerp(0, 1, var_12_18)
				arg_9_1.mask_.color = var_12_19
			end

			if arg_9_1.time_ >= var_12_16 + var_12_17 and arg_9_1.time_ < var_12_16 + var_12_17 + arg_12_0 then
				local var_12_20 = Color.New(0, 0, 0)

				var_12_20.a = 1
				arg_9_1.mask_.color = var_12_20
			end

			local var_12_21 = 3.5

			if var_12_21 < arg_9_1.time_ and arg_9_1.time_ <= var_12_21 + arg_12_0 then
				arg_9_1.mask_.enabled = true
				arg_9_1.mask_.raycastTarget = true

				arg_9_1:SetGaussion(false)
			end

			local var_12_22 = 3.5

			if var_12_21 <= arg_9_1.time_ and arg_9_1.time_ < var_12_21 + var_12_22 then
				local var_12_23 = (arg_9_1.time_ - var_12_21) / var_12_22
				local var_12_24 = Color.New(0, 0, 0)

				var_12_24.a = Mathf.Lerp(1, 0, var_12_23)
				arg_9_1.mask_.color = var_12_24
			end

			if arg_9_1.time_ >= var_12_21 + var_12_22 and arg_9_1.time_ < var_12_21 + var_12_22 + arg_12_0 then
				local var_12_25 = Color.New(0, 0, 0)
				local var_12_26 = 0

				arg_9_1.mask_.enabled = false
				var_12_25.a = var_12_26
				arg_9_1.mask_.color = var_12_25
			end

			local var_12_27 = 7

			if var_12_27 < arg_9_1.time_ and arg_9_1.time_ <= var_12_27 + arg_12_0 then
				arg_9_1.var_.oldValueTypewriter = arg_9_1.fswtw_.percent

				arg_9_1:ShowNextGo(false)
			end

			local var_12_28 = 22
			local var_12_29 = 1.46666666666667
			local var_12_30 = arg_9_1:GetWordFromCfg(1101101002)
			local var_12_31 = arg_9_1:FormatText(var_12_30.content)
			local var_12_32, var_12_33 = arg_9_1:GetPercentByPara(var_12_31, 1)

			if var_12_27 < arg_9_1.time_ and arg_9_1.time_ <= var_12_27 + arg_12_0 then
				arg_9_1.talkMaxDuration = 0

				local var_12_34 = var_12_28 <= 0 and var_12_29 or var_12_29 * ((var_12_33 - arg_9_1.typewritterCharCountI18N) / var_12_28)

				if var_12_34 > 0 and var_12_29 < var_12_34 then
					arg_9_1.talkMaxDuration = var_12_34

					if var_12_34 + var_12_27 > arg_9_1.duration_ then
						arg_9_1.duration_ = var_12_34 + var_12_27
					end
				end
			end

			local var_12_35 = 1.46666666666667
			local var_12_36 = math.max(var_12_35, arg_9_1.talkMaxDuration)

			if var_12_27 <= arg_9_1.time_ and arg_9_1.time_ < var_12_27 + var_12_36 then
				local var_12_37 = (arg_9_1.time_ - var_12_27) / var_12_36

				arg_9_1.fswtw_.percent = Mathf.Lerp(arg_9_1.var_.oldValueTypewriter, var_12_32, var_12_37)
				arg_9_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_9_1.fswtw_:SetDirty()
			end

			if arg_9_1.time_ >= var_12_27 + var_12_36 and arg_9_1.time_ < var_12_27 + var_12_36 + arg_12_0 then
				arg_9_1.fswtw_.percent = var_12_32

				arg_9_1.fswtw_:SetDirty()
				arg_9_1:ShowNextGo(true)

				arg_9_1.typewritterCharCountI18N = var_12_33
			end

			local var_12_38 = 3.5

			if var_12_38 < arg_9_1.time_ and arg_9_1.time_ <= var_12_38 + arg_12_0 then
				arg_9_1.fswbg_:SetActive(true)
				arg_9_1.dialog_:SetActive(false)

				arg_9_1.fswtw_.percent = 0

				local var_12_39 = arg_9_1:GetWordFromCfg(1101101003)
				local var_12_40 = arg_9_1:FormatText(var_12_39.content)

				arg_9_1.fswt_.text = var_12_40

				LuaForUtil.ClearLinePrefixSymbol(arg_9_1.fswt_)

				arg_9_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_9_1.fswtw_:SetDirty()

				arg_9_1.typewritterCharCountI18N = 0

				SetActive(arg_9_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_9_1:ShowNextGo(false)
			end

			local var_12_41 = "3016_tpose"

			if arg_9_1.actors_[var_12_41] == nil then
				local var_12_42 = Object.Instantiate(Asset.Load("Char/" .. var_12_41), arg_9_1.stage_.transform)

				var_12_42.name = var_12_41
				var_12_42.transform.localPosition = Vector3.New(0, 100, 0)
				arg_9_1.actors_[var_12_41] = var_12_42

				local var_12_43 = var_12_42:GetComponentInChildren(typeof(CharacterEffect))

				var_12_43.enabled = true

				local var_12_44 = GameObjectTools.GetOrAddComponent(var_12_42, typeof(DynamicBoneHelper))

				if var_12_44 then
					var_12_44:EnableDynamicBone(false)
				end

				arg_9_1:ShowWeapon(var_12_43.transform, false)

				arg_9_1.var_[var_12_41 .. "Animator"] = var_12_43.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_9_1.var_[var_12_41 .. "Animator"].applyRootMotion = true
				arg_9_1.var_[var_12_41 .. "LipSync"] = var_12_43.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_12_45 = arg_9_1.actors_["3016_tpose"].transform
			local var_12_46 = 3.5

			if var_12_46 < arg_9_1.time_ and arg_9_1.time_ <= var_12_46 + arg_12_0 then
				arg_9_1.var_.moveOldPos3016_tpose = var_12_45.localPosition
			end

			local var_12_47 = 0.001

			if var_12_46 <= arg_9_1.time_ and arg_9_1.time_ < var_12_46 + var_12_47 then
				local var_12_48 = (arg_9_1.time_ - var_12_46) / var_12_47
				local var_12_49 = Vector3.New(0, -1.781746, -0.41)

				var_12_45.localPosition = Vector3.Lerp(arg_9_1.var_.moveOldPos3016_tpose, var_12_49, var_12_48)

				local var_12_50 = manager.ui.mainCamera.transform.position - var_12_45.position

				var_12_45.forward = Vector3.New(var_12_50.x, var_12_50.y, var_12_50.z)

				local var_12_51 = var_12_45.localEulerAngles

				var_12_51.z = 0
				var_12_51.x = 0
				var_12_45.localEulerAngles = var_12_51
			end

			if arg_9_1.time_ >= var_12_46 + var_12_47 and arg_9_1.time_ < var_12_46 + var_12_47 + arg_12_0 then
				var_12_45.localPosition = Vector3.New(0, -1.781746, -0.41)

				local var_12_52 = manager.ui.mainCamera.transform.position - var_12_45.position

				var_12_45.forward = Vector3.New(var_12_52.x, var_12_52.y, var_12_52.z)

				local var_12_53 = var_12_45.localEulerAngles

				var_12_53.z = 0
				var_12_53.x = 0
				var_12_45.localEulerAngles = var_12_53
			end
		end
	end,
	Play1101101004 = function(arg_13_0, arg_13_1)
		arg_13_1.time_ = 0
		arg_13_1.frameCnt_ = 0
		arg_13_1.state_ = "playing"
		arg_13_1.curTalkId_ = 1101101004
		arg_13_1.duration_ = 5.799999999999

		SetActive(arg_13_1.tipsGo_, false)

		function arg_13_1.onSingleLineFinish_()
			arg_13_1.onSingleLineUpdate_ = nil
			arg_13_1.onSingleLineFinish_ = nil
			arg_13_1.state_ = "waiting"
		end

		function arg_13_1.playNext_(arg_15_0)
			if arg_15_0 == 1 then
				arg_13_0:Play1101101005(arg_13_1)
			end
		end

		function arg_13_1.onSingleLineUpdate_(arg_16_0)
			local var_16_0 = "STblack"

			if arg_13_1.bgs_[var_16_0] == nil then
				local var_16_1 = Object.Instantiate(arg_13_1.paintGo_)

				var_16_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_16_0)
				var_16_1.name = var_16_0
				var_16_1.transform.parent = arg_13_1.stage_.transform
				var_16_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_13_1.bgs_[var_16_0] = var_16_1
			end

			local var_16_2 = 2

			if var_16_2 < arg_13_1.time_ and arg_13_1.time_ <= var_16_2 + arg_16_0 then
				local var_16_3 = manager.ui.mainCamera.transform.localPosition
				local var_16_4 = Vector3.New(0, 0, 10) + Vector3.New(var_16_3.x, var_16_3.y, 0)
				local var_16_5 = arg_13_1.bgs_.STblack

				var_16_5.transform.localPosition = var_16_4
				var_16_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_16_6 = var_16_5:GetComponent("SpriteRenderer")

				if var_16_6 and var_16_6.sprite then
					local var_16_7 = (var_16_5.transform.localPosition - var_16_3).z
					local var_16_8 = manager.ui.mainCameraCom_
					local var_16_9 = 2 * var_16_7 * Mathf.Tan(var_16_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_16_10 = var_16_9 * var_16_8.aspect
					local var_16_11 = var_16_6.sprite.bounds.size.x
					local var_16_12 = var_16_6.sprite.bounds.size.y
					local var_16_13 = var_16_10 / var_16_11
					local var_16_14 = var_16_9 / var_16_12
					local var_16_15 = var_16_14 < var_16_13 and var_16_13 or var_16_14

					var_16_5.transform.localScale = Vector3.New(var_16_15, var_16_15, 0)
				end

				for iter_16_0, iter_16_1 in pairs(arg_13_1.bgs_) do
					if iter_16_0 ~= "STblack" then
						iter_16_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_16_16 = arg_13_1.actors_["3016_tpose"].transform
			local var_16_17 = 2

			if var_16_17 < arg_13_1.time_ and arg_13_1.time_ <= var_16_17 + arg_16_0 then
				arg_13_1.var_.moveOldPos3016_tpose = var_16_16.localPosition
			end

			local var_16_18 = 0.001

			if var_16_17 <= arg_13_1.time_ and arg_13_1.time_ < var_16_17 + var_16_18 then
				local var_16_19 = (arg_13_1.time_ - var_16_17) / var_16_18
				local var_16_20 = Vector3.New(0, 100, 0)

				var_16_16.localPosition = Vector3.Lerp(arg_13_1.var_.moveOldPos3016_tpose, var_16_20, var_16_19)

				local var_16_21 = manager.ui.mainCamera.transform.position - var_16_16.position

				var_16_16.forward = Vector3.New(var_16_21.x, var_16_21.y, var_16_21.z)

				local var_16_22 = var_16_16.localEulerAngles

				var_16_22.z = 0
				var_16_22.x = 0
				var_16_16.localEulerAngles = var_16_22
			end

			if arg_13_1.time_ >= var_16_17 + var_16_18 and arg_13_1.time_ < var_16_17 + var_16_18 + arg_16_0 then
				var_16_16.localPosition = Vector3.New(0, 100, 0)

				local var_16_23 = manager.ui.mainCamera.transform.position - var_16_16.position

				var_16_16.forward = Vector3.New(var_16_23.x, var_16_23.y, var_16_23.z)

				local var_16_24 = var_16_16.localEulerAngles

				var_16_24.z = 0
				var_16_24.x = 0
				var_16_16.localEulerAngles = var_16_24
			end

			local var_16_25 = 4

			if var_16_25 < arg_13_1.time_ and arg_13_1.time_ <= var_16_25 + arg_16_0 then
				arg_13_1.var_.oldValueTypewriter = arg_13_1.fswtw_.percent

				arg_13_1:ShowNextGo(false)
			end

			local var_16_26 = 27
			local var_16_27 = 1.8
			local var_16_28 = arg_13_1:GetWordFromCfg(1101101003)
			local var_16_29 = arg_13_1:FormatText(var_16_28.content)
			local var_16_30, var_16_31 = arg_13_1:GetPercentByPara(var_16_29, 1)

			if var_16_25 < arg_13_1.time_ and arg_13_1.time_ <= var_16_25 + arg_16_0 then
				arg_13_1.talkMaxDuration = 0

				local var_16_32 = var_16_26 <= 0 and var_16_27 or var_16_27 * ((var_16_31 - arg_13_1.typewritterCharCountI18N) / var_16_26)

				if var_16_32 > 0 and var_16_27 < var_16_32 then
					arg_13_1.talkMaxDuration = var_16_32

					if var_16_32 + var_16_25 > arg_13_1.duration_ then
						arg_13_1.duration_ = var_16_32 + var_16_25
					end
				end
			end

			local var_16_33 = 1.8
			local var_16_34 = math.max(var_16_33, arg_13_1.talkMaxDuration)

			if var_16_25 <= arg_13_1.time_ and arg_13_1.time_ < var_16_25 + var_16_34 then
				local var_16_35 = (arg_13_1.time_ - var_16_25) / var_16_34

				arg_13_1.fswtw_.percent = Mathf.Lerp(arg_13_1.var_.oldValueTypewriter, var_16_30, var_16_35)
				arg_13_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_13_1.fswtw_:SetDirty()
			end

			if arg_13_1.time_ >= var_16_25 + var_16_34 and arg_13_1.time_ < var_16_25 + var_16_34 + arg_16_0 then
				arg_13_1.fswtw_.percent = var_16_30

				arg_13_1.fswtw_:SetDirty()
				arg_13_1:ShowNextGo(true)

				arg_13_1.typewritterCharCountI18N = var_16_31
			end

			local var_16_36 = 2

			if var_16_36 < arg_13_1.time_ and arg_13_1.time_ <= var_16_36 + arg_16_0 then
				arg_13_1.fswbg_:SetActive(true)
				arg_13_1.dialog_:SetActive(false)

				arg_13_1.fswtw_.percent = 0

				local var_16_37 = arg_13_1:GetWordFromCfg(1101101004)
				local var_16_38 = arg_13_1:FormatText(var_16_37.content)

				arg_13_1.fswt_.text = var_16_38

				LuaForUtil.ClearLinePrefixSymbol(arg_13_1.fswt_)

				arg_13_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_13_1.fswtw_:SetDirty()

				arg_13_1.typewritterCharCountI18N = 0

				SetActive(arg_13_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_13_1:ShowNextGo(false)
			end

			local var_16_39 = 0

			if var_16_39 < arg_13_1.time_ and arg_13_1.time_ <= var_16_39 + arg_16_0 then
				arg_13_1.mask_.enabled = true
				arg_13_1.mask_.raycastTarget = true

				arg_13_1:SetGaussion(false)
			end

			local var_16_40 = 2

			if var_16_39 <= arg_13_1.time_ and arg_13_1.time_ < var_16_39 + var_16_40 then
				local var_16_41 = (arg_13_1.time_ - var_16_39) / var_16_40
				local var_16_42 = Color.New(0, 0, 0)

				var_16_42.a = Mathf.Lerp(0, 1, var_16_41)
				arg_13_1.mask_.color = var_16_42
			end

			if arg_13_1.time_ >= var_16_39 + var_16_40 and arg_13_1.time_ < var_16_39 + var_16_40 + arg_16_0 then
				local var_16_43 = Color.New(0, 0, 0)

				var_16_43.a = 1
				arg_13_1.mask_.color = var_16_43
			end

			local var_16_44 = 2

			if var_16_44 < arg_13_1.time_ and arg_13_1.time_ <= var_16_44 + arg_16_0 then
				arg_13_1.mask_.enabled = true
				arg_13_1.mask_.raycastTarget = true

				arg_13_1:SetGaussion(false)
			end

			local var_16_45 = 2

			if var_16_44 <= arg_13_1.time_ and arg_13_1.time_ < var_16_44 + var_16_45 then
				local var_16_46 = (arg_13_1.time_ - var_16_44) / var_16_45
				local var_16_47 = Color.New(0, 0, 0)

				var_16_47.a = Mathf.Lerp(1, 0, var_16_46)
				arg_13_1.mask_.color = var_16_47
			end

			if arg_13_1.time_ >= var_16_44 + var_16_45 and arg_13_1.time_ < var_16_44 + var_16_45 + arg_16_0 then
				local var_16_48 = Color.New(0, 0, 0)
				local var_16_49 = 0

				arg_13_1.mask_.enabled = false
				var_16_48.a = var_16_49
				arg_13_1.mask_.color = var_16_48
			end
		end
	end,
	Play1101101005 = function(arg_17_0, arg_17_1)
		arg_17_1.time_ = 0
		arg_17_1.frameCnt_ = 0
		arg_17_1.state_ = "playing"
		arg_17_1.curTalkId_ = 1101101005
		arg_17_1.duration_ = 9

		SetActive(arg_17_1.tipsGo_, false)

		function arg_17_1.onSingleLineFinish_()
			arg_17_1.onSingleLineUpdate_ = nil
			arg_17_1.onSingleLineFinish_ = nil
			arg_17_1.state_ = "waiting"
		end

		function arg_17_1.playNext_(arg_19_0)
			if arg_19_0 == 1 then
				arg_17_0:Play1101101006(arg_17_1)
			end
		end

		function arg_17_1.onSingleLineUpdate_(arg_20_0)
			local var_20_0 = "A01a"

			if arg_17_1.bgs_[var_20_0] == nil then
				local var_20_1 = Object.Instantiate(arg_17_1.paintGo_)

				var_20_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_20_0)
				var_20_1.name = var_20_0
				var_20_1.transform.parent = arg_17_1.stage_.transform
				var_20_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_17_1.bgs_[var_20_0] = var_20_1
			end

			local var_20_2 = 2

			if var_20_2 < arg_17_1.time_ and arg_17_1.time_ <= var_20_2 + arg_20_0 then
				local var_20_3 = manager.ui.mainCamera.transform.localPosition
				local var_20_4 = Vector3.New(0, 0, 10) + Vector3.New(var_20_3.x, var_20_3.y, 0)
				local var_20_5 = arg_17_1.bgs_.A01a

				var_20_5.transform.localPosition = var_20_4
				var_20_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_20_6 = var_20_5:GetComponent("SpriteRenderer")

				if var_20_6 and var_20_6.sprite then
					local var_20_7 = (var_20_5.transform.localPosition - var_20_3).z
					local var_20_8 = manager.ui.mainCameraCom_
					local var_20_9 = 2 * var_20_7 * Mathf.Tan(var_20_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_20_10 = var_20_9 * var_20_8.aspect
					local var_20_11 = var_20_6.sprite.bounds.size.x
					local var_20_12 = var_20_6.sprite.bounds.size.y
					local var_20_13 = var_20_10 / var_20_11
					local var_20_14 = var_20_9 / var_20_12
					local var_20_15 = var_20_14 < var_20_13 and var_20_13 or var_20_14

					var_20_5.transform.localScale = Vector3.New(var_20_15, var_20_15, 0)
				end

				for iter_20_0, iter_20_1 in pairs(arg_17_1.bgs_) do
					if iter_20_0 ~= "A01a" then
						iter_20_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_20_16 = 0

			if var_20_16 < arg_17_1.time_ and arg_17_1.time_ <= var_20_16 + arg_20_0 then
				arg_17_1.mask_.enabled = true
				arg_17_1.mask_.raycastTarget = true

				arg_17_1:SetGaussion(false)
			end

			local var_20_17 = 2

			if var_20_16 <= arg_17_1.time_ and arg_17_1.time_ < var_20_16 + var_20_17 then
				local var_20_18 = (arg_17_1.time_ - var_20_16) / var_20_17
				local var_20_19 = Color.New(0, 0, 0)

				var_20_19.a = Mathf.Lerp(0, 1, var_20_18)
				arg_17_1.mask_.color = var_20_19
			end

			if arg_17_1.time_ >= var_20_16 + var_20_17 and arg_17_1.time_ < var_20_16 + var_20_17 + arg_20_0 then
				local var_20_20 = Color.New(0, 0, 0)

				var_20_20.a = 1
				arg_17_1.mask_.color = var_20_20
			end

			local var_20_21 = 2

			if var_20_21 < arg_17_1.time_ and arg_17_1.time_ <= var_20_21 + arg_20_0 then
				arg_17_1.mask_.enabled = true
				arg_17_1.mask_.raycastTarget = true

				arg_17_1:SetGaussion(false)
			end

			local var_20_22 = 2

			if var_20_21 <= arg_17_1.time_ and arg_17_1.time_ < var_20_21 + var_20_22 then
				local var_20_23 = (arg_17_1.time_ - var_20_21) / var_20_22
				local var_20_24 = Color.New(0, 0, 0)

				var_20_24.a = Mathf.Lerp(1, 0, var_20_23)
				arg_17_1.mask_.color = var_20_24
			end

			if arg_17_1.time_ >= var_20_21 + var_20_22 and arg_17_1.time_ < var_20_21 + var_20_22 + arg_20_0 then
				local var_20_25 = Color.New(0, 0, 0)
				local var_20_26 = 0

				arg_17_1.mask_.enabled = false
				var_20_25.a = var_20_26
				arg_17_1.mask_.color = var_20_25
			end

			local var_20_27 = 2

			if var_20_27 < arg_17_1.time_ and arg_17_1.time_ <= var_20_27 + arg_20_0 then
				arg_17_1.fswbg_:SetActive(false)
				arg_17_1.dialog_:SetActive(false)
				arg_17_1:ShowNextGo(false)
			end

			if arg_17_1.frameCnt_ <= 1 then
				arg_17_1.dialog_:SetActive(false)
			end

			local var_20_28 = 4
			local var_20_29 = 0.075

			if var_20_28 < arg_17_1.time_ and arg_17_1.time_ <= var_20_28 + arg_20_0 then
				arg_17_1.talkMaxDuration = 0

				arg_17_1.dialog_:SetActive(true)

				local var_20_30 = LeanTween.value(arg_17_1.dialog_, 0, 1, 0.3)

				var_20_30:setOnUpdate(LuaHelper.FloatAction(function(arg_21_0)
					arg_17_1.dialogCg_.alpha = arg_21_0
				end))
				var_20_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_17_1.dialog_)
					var_20_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_17_1.duration_ = arg_17_1.duration_ + 0.3

				SetActive(arg_17_1.leftNameGo_, true)

				local var_20_31 = arg_17_1:FormatText(StoryNameCfg[7].name)

				arg_17_1.leftNameTxt_.text = var_20_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_17_1.leftNameTxt_.transform)

				arg_17_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_17_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_17_1:RecordName(arg_17_1.leftNameTxt_.text)
				SetActive(arg_17_1.iconTrs_.gameObject, false)
				arg_17_1.callingController_:SetSelectedState("normal")

				local var_20_32 = arg_17_1:GetWordFromCfg(1101101005)
				local var_20_33 = arg_17_1:FormatText(var_20_32.content)

				arg_17_1.text_.text = var_20_33

				LuaForUtil.ClearLinePrefixSymbol(arg_17_1.text_)

				local var_20_34 = 3
				local var_20_35 = utf8.len(var_20_33)
				local var_20_36 = var_20_34 <= 0 and var_20_29 or var_20_29 * (var_20_35 / var_20_34)

				if var_20_36 > 0 and var_20_29 < var_20_36 then
					arg_17_1.talkMaxDuration = var_20_36
					var_20_28 = var_20_28 + 0.3

					if var_20_36 + var_20_28 > arg_17_1.duration_ then
						arg_17_1.duration_ = var_20_36 + var_20_28
					end
				end

				arg_17_1.text_.text = var_20_33
				arg_17_1.typewritter.percent = 0

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(false)
				arg_17_1:RecordContent(arg_17_1.text_.text)
			end

			local var_20_37 = var_20_28 + 0.3
			local var_20_38 = math.max(var_20_29, arg_17_1.talkMaxDuration)

			if var_20_37 <= arg_17_1.time_ and arg_17_1.time_ < var_20_37 + var_20_38 then
				arg_17_1.typewritter.percent = (arg_17_1.time_ - var_20_37) / var_20_38

				arg_17_1.typewritter:SetDirty()
			end

			if arg_17_1.time_ >= var_20_37 + var_20_38 and arg_17_1.time_ < var_20_37 + var_20_38 + arg_20_0 then
				arg_17_1.typewritter.percent = 1

				arg_17_1.typewritter:SetDirty()
				arg_17_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 1101101006
		arg_23_1.duration_ = 4.666

		local var_23_0 = {
			zh = 2.433,
			ja = 4.666
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
				arg_23_0:Play1101101007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.225

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[14].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6064")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(1101101006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 9
				local var_26_6 = utf8.len(var_26_4)
				local var_26_7 = var_26_5 <= 0 and var_26_1 or var_26_1 * (var_26_6 / var_26_5)

				if var_26_7 > 0 and var_26_1 < var_26_7 then
					arg_23_1.talkMaxDuration = var_26_7

					if var_26_7 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_7 + var_26_0
					end
				end

				arg_23_1.text_.text = var_26_4
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101006", "story_v_side_new_1101101.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101006", "story_v_side_new_1101101.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_side_new_1101101", "1101101006", "story_v_side_new_1101101.awb")

						arg_23_1:RecordAudio("1101101006", var_26_9)
						arg_23_1:RecordAudio("1101101006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101006", "story_v_side_new_1101101.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101006", "story_v_side_new_1101101.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_10 = math.max(var_26_1, arg_23_1.talkMaxDuration)

			if var_26_0 <= arg_23_1.time_ and arg_23_1.time_ < var_26_0 + var_26_10 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_0) / var_26_10

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_0 + var_26_10 and arg_23_1.time_ < var_26_0 + var_26_10 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 1101101007
		arg_27_1.duration_ = 11.933

		local var_27_0 = {
			zh = 7.766,
			ja = 11.933
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
				arg_27_0:Play1101101008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1.25

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[14].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_6064")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(1101101007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101007", "story_v_side_new_1101101.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101007", "story_v_side_new_1101101.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_side_new_1101101", "1101101007", "story_v_side_new_1101101.awb")

						arg_27_1:RecordAudio("1101101007", var_30_9)
						arg_27_1:RecordAudio("1101101007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101007", "story_v_side_new_1101101.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101007", "story_v_side_new_1101101.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_10 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_10 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_10

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_10 and arg_27_1.time_ < var_30_0 + var_30_10 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 1101101008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play1101101009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.075

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

				local var_34_3 = arg_31_1:GetWordFromCfg(1101101008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 3
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
	Play1101101009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 1101101009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play1101101010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1.15

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

				local var_38_2 = arg_35_1:GetWordFromCfg(1101101009)
				local var_38_3 = arg_35_1:FormatText(var_38_2.content)

				arg_35_1.text_.text = var_38_3

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_4 = 46
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
	Play1101101010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 1101101010
		arg_39_1.duration_ = 2.866

		local var_39_0 = {
			zh = 2.2,
			ja = 2.866
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
				arg_39_0:Play1101101011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.225

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0

				arg_39_1.dialog_:SetActive(true)

				local var_42_2 = LeanTween.value(arg_39_1.dialog_, 0, 1, 0.3)

				var_42_2:setOnUpdate(LuaHelper.FloatAction(function(arg_43_0)
					arg_39_1.dialogCg_.alpha = arg_43_0
				end))
				var_42_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_39_1.dialog_)
					var_42_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_39_1.duration_ = arg_39_1.duration_ + 0.3

				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_3 = arg_39_1:FormatText(StoryNameCfg[36].name)

				arg_39_1.leftNameTxt_.text = var_42_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_4 = arg_39_1:GetWordFromCfg(1101101010)
				local var_42_5 = arg_39_1:FormatText(var_42_4.content)

				arg_39_1.text_.text = var_42_5

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_6 = 9
				local var_42_7 = utf8.len(var_42_5)
				local var_42_8 = var_42_6 <= 0 and var_42_1 or var_42_1 * (var_42_7 / var_42_6)

				if var_42_8 > 0 and var_42_1 < var_42_8 then
					arg_39_1.talkMaxDuration = var_42_8
					var_42_0 = var_42_0 + 0.3

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_5
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101010", "story_v_side_new_1101101.awb") ~= 0 then
					local var_42_9 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101010", "story_v_side_new_1101101.awb") / 1000

					if var_42_9 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_9 + var_42_0
					end

					if var_42_4.prefab_name ~= "" and arg_39_1.actors_[var_42_4.prefab_name] ~= nil then
						local var_42_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_4.prefab_name].transform, "story_v_side_new_1101101", "1101101010", "story_v_side_new_1101101.awb")

						arg_39_1:RecordAudio("1101101010", var_42_10)
						arg_39_1:RecordAudio("1101101010", var_42_10)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101010", "story_v_side_new_1101101.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101010", "story_v_side_new_1101101.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_11 = var_42_0 + 0.3
			local var_42_12 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_11 <= arg_39_1.time_ and arg_39_1.time_ < var_42_11 + var_42_12 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_11) / var_42_12

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_11 + var_42_12 and arg_39_1.time_ < var_42_11 + var_42_12 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 1101101011
		arg_45_1.duration_ = 9

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play1101101012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = "S0101"

			if arg_45_1.bgs_[var_48_0] == nil then
				local var_48_1 = Object.Instantiate(arg_45_1.paintGo_)

				var_48_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_48_0)
				var_48_1.name = var_48_0
				var_48_1.transform.parent = arg_45_1.stage_.transform
				var_48_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_45_1.bgs_[var_48_0] = var_48_1
			end

			local var_48_2 = 2

			if var_48_2 < arg_45_1.time_ and arg_45_1.time_ <= var_48_2 + arg_48_0 then
				local var_48_3 = manager.ui.mainCamera.transform.localPosition
				local var_48_4 = Vector3.New(0, 0, 10) + Vector3.New(var_48_3.x, var_48_3.y, 0)
				local var_48_5 = arg_45_1.bgs_.S0101

				var_48_5.transform.localPosition = var_48_4
				var_48_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_48_6 = var_48_5:GetComponent("SpriteRenderer")

				if var_48_6 and var_48_6.sprite then
					local var_48_7 = (var_48_5.transform.localPosition - var_48_3).z
					local var_48_8 = manager.ui.mainCameraCom_
					local var_48_9 = 2 * var_48_7 * Mathf.Tan(var_48_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_48_10 = var_48_9 * var_48_8.aspect
					local var_48_11 = var_48_6.sprite.bounds.size.x
					local var_48_12 = var_48_6.sprite.bounds.size.y
					local var_48_13 = var_48_10 / var_48_11
					local var_48_14 = var_48_9 / var_48_12
					local var_48_15 = var_48_14 < var_48_13 and var_48_13 or var_48_14

					var_48_5.transform.localScale = Vector3.New(var_48_15, var_48_15, 0)
				end

				for iter_48_0, iter_48_1 in pairs(arg_45_1.bgs_) do
					if iter_48_0 ~= "S0101" then
						iter_48_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_48_16 = 0

			if var_48_16 < arg_45_1.time_ and arg_45_1.time_ <= var_48_16 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_17 = 2

			if var_48_16 <= arg_45_1.time_ and arg_45_1.time_ < var_48_16 + var_48_17 then
				local var_48_18 = (arg_45_1.time_ - var_48_16) / var_48_17
				local var_48_19 = Color.New(0, 0, 0)

				var_48_19.a = Mathf.Lerp(0, 1, var_48_18)
				arg_45_1.mask_.color = var_48_19
			end

			if arg_45_1.time_ >= var_48_16 + var_48_17 and arg_45_1.time_ < var_48_16 + var_48_17 + arg_48_0 then
				local var_48_20 = Color.New(0, 0, 0)

				var_48_20.a = 1
				arg_45_1.mask_.color = var_48_20
			end

			local var_48_21 = 2

			if var_48_21 < arg_45_1.time_ and arg_45_1.time_ <= var_48_21 + arg_48_0 then
				arg_45_1.mask_.enabled = true
				arg_45_1.mask_.raycastTarget = true

				arg_45_1:SetGaussion(false)
			end

			local var_48_22 = 2

			if var_48_21 <= arg_45_1.time_ and arg_45_1.time_ < var_48_21 + var_48_22 then
				local var_48_23 = (arg_45_1.time_ - var_48_21) / var_48_22
				local var_48_24 = Color.New(0, 0, 0)

				var_48_24.a = Mathf.Lerp(1, 0, var_48_23)
				arg_45_1.mask_.color = var_48_24
			end

			if arg_45_1.time_ >= var_48_21 + var_48_22 and arg_45_1.time_ < var_48_21 + var_48_22 + arg_48_0 then
				local var_48_25 = Color.New(0, 0, 0)
				local var_48_26 = 0

				arg_45_1.mask_.enabled = false
				var_48_25.a = var_48_26
				arg_45_1.mask_.color = var_48_25
			end

			local var_48_27 = arg_45_1.bgs_.S0101.transform
			local var_48_28 = 2

			if var_48_28 < arg_45_1.time_ and arg_45_1.time_ <= var_48_28 + arg_48_0 then
				arg_45_1.var_.moveOldPosS0101 = var_48_27.localPosition
			end

			local var_48_29 = 0.001

			if var_48_28 <= arg_45_1.time_ and arg_45_1.time_ < var_48_28 + var_48_29 then
				local var_48_30 = (arg_45_1.time_ - var_48_28) / var_48_29
				local var_48_31 = Vector3.New(0, 1, 10.3)

				var_48_27.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPosS0101, var_48_31, var_48_30)
			end

			if arg_45_1.time_ >= var_48_28 + var_48_29 and arg_45_1.time_ < var_48_28 + var_48_29 + arg_48_0 then
				var_48_27.localPosition = Vector3.New(0, 1, 10.3)
			end

			local var_48_32 = arg_45_1.bgs_.S0101.transform
			local var_48_33 = 2.034

			if var_48_33 < arg_45_1.time_ and arg_45_1.time_ <= var_48_33 + arg_48_0 then
				arg_45_1.var_.moveOldPosS0101 = var_48_32.localPosition
			end

			local var_48_34 = 2.716

			if var_48_33 <= arg_45_1.time_ and arg_45_1.time_ < var_48_33 + var_48_34 then
				local var_48_35 = (arg_45_1.time_ - var_48_33) / var_48_34
				local var_48_36 = Vector3.New(0, 1, 10)

				var_48_32.localPosition = Vector3.Lerp(arg_45_1.var_.moveOldPosS0101, var_48_36, var_48_35)
			end

			if arg_45_1.time_ >= var_48_33 + var_48_34 and arg_45_1.time_ < var_48_33 + var_48_34 + arg_48_0 then
				var_48_32.localPosition = Vector3.New(0, 1, 10)
			end

			if arg_45_1.frameCnt_ <= 1 then
				arg_45_1.dialog_:SetActive(false)
			end

			local var_48_37 = 4
			local var_48_38 = 0.75

			if var_48_37 < arg_45_1.time_ and arg_45_1.time_ <= var_48_37 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0

				arg_45_1.dialog_:SetActive(true)

				local var_48_39 = LeanTween.value(arg_45_1.dialog_, 0, 1, 0.3)

				var_48_39:setOnUpdate(LuaHelper.FloatAction(function(arg_49_0)
					arg_45_1.dialogCg_.alpha = arg_49_0
				end))
				var_48_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_45_1.dialog_)
					var_48_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_45_1.duration_ = arg_45_1.duration_ + 0.3

				SetActive(arg_45_1.leftNameGo_, false)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_40 = arg_45_1:GetWordFromCfg(1101101011)
				local var_48_41 = arg_45_1:FormatText(var_48_40.content)

				arg_45_1.text_.text = var_48_41

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_42 = 30
				local var_48_43 = utf8.len(var_48_41)
				local var_48_44 = var_48_42 <= 0 and var_48_38 or var_48_38 * (var_48_43 / var_48_42)

				if var_48_44 > 0 and var_48_38 < var_48_44 then
					arg_45_1.talkMaxDuration = var_48_44
					var_48_37 = var_48_37 + 0.3

					if var_48_44 + var_48_37 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_44 + var_48_37
					end
				end

				arg_45_1.text_.text = var_48_41
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)
				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_45 = var_48_37 + 0.3
			local var_48_46 = math.max(var_48_38, arg_45_1.talkMaxDuration)

			if var_48_45 <= arg_45_1.time_ and arg_45_1.time_ < var_48_45 + var_48_46 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_45) / var_48_46

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_45 + var_48_46 and arg_45_1.time_ < var_48_45 + var_48_46 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 1101101012
		arg_51_1.duration_ = 5

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play1101101013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.6

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, false)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_2 = arg_51_1:GetWordFromCfg(1101101012)
				local var_54_3 = arg_51_1:FormatText(var_54_2.content)

				arg_51_1.text_.text = var_54_3

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_4 = 24
				local var_54_5 = utf8.len(var_54_3)
				local var_54_6 = var_54_4 <= 0 and var_54_1 or var_54_1 * (var_54_5 / var_54_4)

				if var_54_6 > 0 and var_54_1 < var_54_6 then
					arg_51_1.talkMaxDuration = var_54_6

					if var_54_6 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_6 + var_54_0
					end
				end

				arg_51_1.text_.text = var_54_3
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)
				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_7 = math.max(var_54_1, arg_51_1.talkMaxDuration)

			if var_54_0 <= arg_51_1.time_ and arg_51_1.time_ < var_54_0 + var_54_7 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_0) / var_54_7

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_0 + var_54_7 and arg_51_1.time_ < var_54_0 + var_54_7 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 1101101013
		arg_55_1.duration_ = 0.999999999999

		SetActive(arg_55_1.tipsGo_, true)

		arg_55_1.tipsText_.text = StoryTipsCfg[101101].name

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"

			SetActive(arg_55_1.choicesGo_, true)

			for iter_56_0, iter_56_1 in ipairs(arg_55_1.choices_) do
				local var_56_0 = iter_56_0 <= 2

				SetActive(iter_56_1.go, var_56_0)
			end

			arg_55_1.choices_[1].txt.text = arg_55_1:FormatText(StoryChoiceCfg[602].name)
			arg_55_1.choices_[2].txt.text = arg_55_1:FormatText(StoryChoiceCfg[603].name)
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				PlayerAction.UseStoryTrigger(1011011, 210110101, 1101101013, 1)
				arg_55_0:Play1101101014(arg_55_1)
			end

			if arg_57_0 == 2 then
				PlayerAction.UseStoryTrigger(1011011, 210110101, 1101101013, 2)
				arg_55_0:Play1101101015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.allBtn_.enabled = false
			end

			local var_58_1 = 0.5

			if arg_55_1.time_ >= var_58_0 + var_58_1 and arg_55_1.time_ < var_58_0 + var_58_1 + arg_58_0 then
				arg_55_1.allBtn_.enabled = true
			end
		end
	end,
	Play1101101014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 1101101014
		arg_59_1.duration_ = 5.733

		local var_59_0 = {
			zh = 5.533,
			ja = 5.733
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
				arg_59_0:Play1101101016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.575

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[37].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(1101101014)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 23
				local var_62_6 = utf8.len(var_62_4)
				local var_62_7 = var_62_5 <= 0 and var_62_1 or var_62_1 * (var_62_6 / var_62_5)

				if var_62_7 > 0 and var_62_1 < var_62_7 then
					arg_59_1.talkMaxDuration = var_62_7

					if var_62_7 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_7 + var_62_0
					end
				end

				arg_59_1.text_.text = var_62_4
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101014", "story_v_side_new_1101101.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101014", "story_v_side_new_1101101.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_side_new_1101101", "1101101014", "story_v_side_new_1101101.awb")

						arg_59_1:RecordAudio("1101101014", var_62_9)
						arg_59_1:RecordAudio("1101101014", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101014", "story_v_side_new_1101101.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101014", "story_v_side_new_1101101.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_10 = math.max(var_62_1, arg_59_1.talkMaxDuration)

			if var_62_0 <= arg_59_1.time_ and arg_59_1.time_ < var_62_0 + var_62_10 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_0) / var_62_10

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_0 + var_62_10 and arg_59_1.time_ < var_62_0 + var_62_10 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 1101101016
		arg_63_1.duration_ = 7.23333333333333

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play1101101017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 2

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				local var_66_1 = manager.ui.mainCamera.transform.localPosition
				local var_66_2 = Vector3.New(0, 0, 10) + Vector3.New(var_66_1.x, var_66_1.y, 0)
				local var_66_3 = arg_63_1.bgs_.STblack

				var_66_3.transform.localPosition = var_66_2
				var_66_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_66_4 = var_66_3:GetComponent("SpriteRenderer")

				if var_66_4 and var_66_4.sprite then
					local var_66_5 = (var_66_3.transform.localPosition - var_66_1).z
					local var_66_6 = manager.ui.mainCameraCom_
					local var_66_7 = 2 * var_66_5 * Mathf.Tan(var_66_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_66_8 = var_66_7 * var_66_6.aspect
					local var_66_9 = var_66_4.sprite.bounds.size.x
					local var_66_10 = var_66_4.sprite.bounds.size.y
					local var_66_11 = var_66_8 / var_66_9
					local var_66_12 = var_66_7 / var_66_10
					local var_66_13 = var_66_12 < var_66_11 and var_66_11 or var_66_12

					var_66_3.transform.localScale = Vector3.New(var_66_13, var_66_13, 0)
				end

				for iter_66_0, iter_66_1 in pairs(arg_63_1.bgs_) do
					if iter_66_0 ~= "STblack" then
						iter_66_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_15 = 2

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15
				local var_66_17 = Color.New(0, 0, 0)

				var_66_17.a = Mathf.Lerp(0, 1, var_66_16)
				arg_63_1.mask_.color = var_66_17
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 then
				local var_66_18 = Color.New(0, 0, 0)

				var_66_18.a = 1
				arg_63_1.mask_.color = var_66_18
			end

			local var_66_19 = 2

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_20 = 0.233333333333333

			if var_66_19 <= arg_63_1.time_ and arg_63_1.time_ < var_66_19 + var_66_20 then
				local var_66_21 = (arg_63_1.time_ - var_66_19) / var_66_20
				local var_66_22 = Color.New(0, 0, 0)

				var_66_22.a = Mathf.Lerp(1, 0, var_66_21)
				arg_63_1.mask_.color = var_66_22
			end

			if arg_63_1.time_ >= var_66_19 + var_66_20 and arg_63_1.time_ < var_66_19 + var_66_20 + arg_66_0 then
				local var_66_23 = Color.New(0, 0, 0)
				local var_66_24 = 0

				arg_63_1.mask_.enabled = false
				var_66_23.a = var_66_24
				arg_63_1.mask_.color = var_66_23
			end

			if arg_63_1.frameCnt_ <= 1 then
				arg_63_1.dialog_:SetActive(false)
			end

			local var_66_25 = 2.23333333333333
			local var_66_26 = 0.775

			if var_66_25 < arg_63_1.time_ and arg_63_1.time_ <= var_66_25 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				arg_63_1.dialog_:SetActive(true)

				local var_66_27 = LeanTween.value(arg_63_1.dialog_, 0, 1, 0.3)

				var_66_27:setOnUpdate(LuaHelper.FloatAction(function(arg_67_0)
					arg_63_1.dialogCg_.alpha = arg_67_0
				end))
				var_66_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_63_1.dialog_)
					var_66_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_63_1.duration_ = arg_63_1.duration_ + 0.3

				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_28 = arg_63_1:GetWordFromCfg(1101101016)
				local var_66_29 = arg_63_1:FormatText(var_66_28.content)

				arg_63_1.text_.text = var_66_29

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_30 = 31
				local var_66_31 = utf8.len(var_66_29)
				local var_66_32 = var_66_30 <= 0 and var_66_26 or var_66_26 * (var_66_31 / var_66_30)

				if var_66_32 > 0 and var_66_26 < var_66_32 then
					arg_63_1.talkMaxDuration = var_66_32
					var_66_25 = var_66_25 + 0.3

					if var_66_32 + var_66_25 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_32 + var_66_25
					end
				end

				arg_63_1.text_.text = var_66_29
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_33 = var_66_25 + 0.3
			local var_66_34 = math.max(var_66_26, arg_63_1.talkMaxDuration)

			if var_66_33 <= arg_63_1.time_ and arg_63_1.time_ < var_66_33 + var_66_34 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_33) / var_66_34

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_33 + var_66_34 and arg_63_1.time_ < var_66_33 + var_66_34 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 1101101017
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play1101101018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = 0
			local var_72_1 = 1

			if var_72_0 < arg_69_1.time_ and arg_69_1.time_ <= var_72_0 + arg_72_0 then
				local var_72_2 = "play"
				local var_72_3 = "effect"

				arg_69_1:AudioAction(var_72_2, var_72_3, "se_story_side_1011", "se_story_side_1011_spray", "se_story_side_1011.awb")
			end

			local var_72_4 = 0
			local var_72_5 = 0.725

			if var_72_4 < arg_69_1.time_ and arg_69_1.time_ <= var_72_4 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_6 = arg_69_1:GetWordFromCfg(1101101017)
				local var_72_7 = arg_69_1:FormatText(var_72_6.content)

				arg_69_1.text_.text = var_72_7

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_8 = 29
				local var_72_9 = utf8.len(var_72_7)
				local var_72_10 = var_72_8 <= 0 and var_72_5 or var_72_5 * (var_72_9 / var_72_8)

				if var_72_10 > 0 and var_72_5 < var_72_10 then
					arg_69_1.talkMaxDuration = var_72_10

					if var_72_10 + var_72_4 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_10 + var_72_4
					end
				end

				arg_69_1.text_.text = var_72_7
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_11 = math.max(var_72_5, arg_69_1.talkMaxDuration)

			if var_72_4 <= arg_69_1.time_ and arg_69_1.time_ < var_72_4 + var_72_11 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_4) / var_72_11

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_4 + var_72_11 and arg_69_1.time_ < var_72_4 + var_72_11 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 1101101018
		arg_73_1.duration_ = 5.966

		local var_73_0 = {
			zh = 4.966,
			ja = 5.966
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
				arg_73_0:Play1101101019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = "A00"

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
				local var_76_5 = arg_73_1.bgs_.A00

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
					if iter_76_0 ~= "A00" then
						iter_76_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_76_16 = 0

			if var_76_16 < arg_73_1.time_ and arg_73_1.time_ <= var_76_16 + arg_76_0 then
				arg_73_1.mask_.enabled = true
				arg_73_1.mask_.raycastTarget = true

				arg_73_1:SetGaussion(false)
			end

			local var_76_17 = 2

			if var_76_16 <= arg_73_1.time_ and arg_73_1.time_ < var_76_16 + var_76_17 then
				local var_76_18 = (arg_73_1.time_ - var_76_16) / var_76_17
				local var_76_19 = Color.New(0, 0, 0)

				var_76_19.a = Mathf.Lerp(1, 0, var_76_18)
				arg_73_1.mask_.color = var_76_19
			end

			if arg_73_1.time_ >= var_76_16 + var_76_17 and arg_73_1.time_ < var_76_16 + var_76_17 + arg_76_0 then
				local var_76_20 = Color.New(0, 0, 0)
				local var_76_21 = 0

				arg_73_1.mask_.enabled = false
				var_76_20.a = var_76_21
				arg_73_1.mask_.color = var_76_20
			end

			local var_76_22 = "1011ui_story"

			if arg_73_1.actors_[var_76_22] == nil then
				local var_76_23 = Object.Instantiate(Asset.Load("Char/" .. var_76_22), arg_73_1.stage_.transform)

				var_76_23.name = var_76_22
				var_76_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.actors_[var_76_22] = var_76_23

				local var_76_24 = var_76_23:GetComponentInChildren(typeof(CharacterEffect))

				var_76_24.enabled = true

				local var_76_25 = GameObjectTools.GetOrAddComponent(var_76_23, typeof(DynamicBoneHelper))

				if var_76_25 then
					var_76_25:EnableDynamicBone(false)
				end

				arg_73_1:ShowWeapon(var_76_24.transform, false)

				arg_73_1.var_[var_76_22 .. "Animator"] = var_76_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_73_1.var_[var_76_22 .. "Animator"].applyRootMotion = true
				arg_73_1.var_[var_76_22 .. "LipSync"] = var_76_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_76_26 = arg_73_1.actors_["1011ui_story"].transform
			local var_76_27 = 2

			if var_76_27 < arg_73_1.time_ and arg_73_1.time_ <= var_76_27 + arg_76_0 then
				arg_73_1.var_.moveOldPos1011ui_story = var_76_26.localPosition
			end

			local var_76_28 = 0.001

			if var_76_27 <= arg_73_1.time_ and arg_73_1.time_ < var_76_27 + var_76_28 then
				local var_76_29 = (arg_73_1.time_ - var_76_27) / var_76_28
				local var_76_30 = Vector3.New(0, -0.71, -6)

				var_76_26.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1011ui_story, var_76_30, var_76_29)

				local var_76_31 = manager.ui.mainCamera.transform.position - var_76_26.position

				var_76_26.forward = Vector3.New(var_76_31.x, var_76_31.y, var_76_31.z)

				local var_76_32 = var_76_26.localEulerAngles

				var_76_32.z = 0
				var_76_32.x = 0
				var_76_26.localEulerAngles = var_76_32
			end

			if arg_73_1.time_ >= var_76_27 + var_76_28 and arg_73_1.time_ < var_76_27 + var_76_28 + arg_76_0 then
				var_76_26.localPosition = Vector3.New(0, -0.71, -6)

				local var_76_33 = manager.ui.mainCamera.transform.position - var_76_26.position

				var_76_26.forward = Vector3.New(var_76_33.x, var_76_33.y, var_76_33.z)

				local var_76_34 = var_76_26.localEulerAngles

				var_76_34.z = 0
				var_76_34.x = 0
				var_76_26.localEulerAngles = var_76_34
			end

			local var_76_35 = arg_73_1.actors_["1011ui_story"]
			local var_76_36 = 2

			if var_76_36 < arg_73_1.time_ and arg_73_1.time_ <= var_76_36 + arg_76_0 and arg_73_1.var_.characterEffect1011ui_story == nil then
				arg_73_1.var_.characterEffect1011ui_story = var_76_35:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_37 = 0.200000002980232

			if var_76_36 <= arg_73_1.time_ and arg_73_1.time_ < var_76_36 + var_76_37 then
				local var_76_38 = (arg_73_1.time_ - var_76_36) / var_76_37

				if arg_73_1.var_.characterEffect1011ui_story then
					arg_73_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_36 + var_76_37 and arg_73_1.time_ < var_76_36 + var_76_37 + arg_76_0 and arg_73_1.var_.characterEffect1011ui_story then
				arg_73_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_76_39 = 2

			if var_76_39 < arg_73_1.time_ and arg_73_1.time_ <= var_76_39 + arg_76_0 then
				arg_73_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_76_40 = 2

			if var_76_40 < arg_73_1.time_ and arg_73_1.time_ <= var_76_40 + arg_76_0 then
				arg_73_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			if arg_73_1.frameCnt_ <= 1 then
				arg_73_1.dialog_:SetActive(false)
			end

			local var_76_41 = 2
			local var_76_42 = 0.375

			if var_76_41 < arg_73_1.time_ and arg_73_1.time_ <= var_76_41 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				arg_73_1.dialog_:SetActive(true)

				local var_76_43 = LeanTween.value(arg_73_1.dialog_, 0, 1, 0.3)

				var_76_43:setOnUpdate(LuaHelper.FloatAction(function(arg_77_0)
					arg_73_1.dialogCg_.alpha = arg_77_0
				end))
				var_76_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_73_1.dialog_)
					var_76_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_73_1.duration_ = arg_73_1.duration_ + 0.3

				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_44 = arg_73_1:FormatText(StoryNameCfg[37].name)

				arg_73_1.leftNameTxt_.text = var_76_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_45 = arg_73_1:GetWordFromCfg(1101101018)
				local var_76_46 = arg_73_1:FormatText(var_76_45.content)

				arg_73_1.text_.text = var_76_46

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_47 = 15
				local var_76_48 = utf8.len(var_76_46)
				local var_76_49 = var_76_47 <= 0 and var_76_42 or var_76_42 * (var_76_48 / var_76_47)

				if var_76_49 > 0 and var_76_42 < var_76_49 then
					arg_73_1.talkMaxDuration = var_76_49
					var_76_41 = var_76_41 + 0.3

					if var_76_49 + var_76_41 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_49 + var_76_41
					end
				end

				arg_73_1.text_.text = var_76_46
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101018", "story_v_side_new_1101101.awb") ~= 0 then
					local var_76_50 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101018", "story_v_side_new_1101101.awb") / 1000

					if var_76_50 + var_76_41 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_50 + var_76_41
					end

					if var_76_45.prefab_name ~= "" and arg_73_1.actors_[var_76_45.prefab_name] ~= nil then
						local var_76_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_45.prefab_name].transform, "story_v_side_new_1101101", "1101101018", "story_v_side_new_1101101.awb")

						arg_73_1:RecordAudio("1101101018", var_76_51)
						arg_73_1:RecordAudio("1101101018", var_76_51)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101018", "story_v_side_new_1101101.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101018", "story_v_side_new_1101101.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_52 = var_76_41 + 0.3
			local var_76_53 = math.max(var_76_42, arg_73_1.talkMaxDuration)

			if var_76_52 <= arg_73_1.time_ and arg_73_1.time_ < var_76_52 + var_76_53 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_52) / var_76_53

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_52 + var_76_53 and arg_73_1.time_ < var_76_52 + var_76_53 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 1101101019
		arg_79_1.duration_ = 5

		SetActive(arg_79_1.tipsGo_, false)

		function arg_79_1.onSingleLineFinish_()
			arg_79_1.onSingleLineUpdate_ = nil
			arg_79_1.onSingleLineFinish_ = nil
			arg_79_1.state_ = "waiting"
		end

		function arg_79_1.playNext_(arg_81_0)
			if arg_81_0 == 1 then
				arg_79_0:Play1101101020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1011ui_story"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.characterEffect1011ui_story == nil then
				arg_79_1.var_.characterEffect1011ui_story = var_82_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_2 = 0.200000002980232

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.characterEffect1011ui_story then
					local var_82_4 = Mathf.Lerp(0, 0.5, var_82_3)

					arg_79_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_79_1.var_.characterEffect1011ui_story.fillRatio = var_82_4
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.characterEffect1011ui_story then
				local var_82_5 = 0.5

				arg_79_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_79_1.var_.characterEffect1011ui_story.fillRatio = var_82_5
			end

			local var_82_6 = 0
			local var_82_7 = 0.625

			if var_82_6 < arg_79_1.time_ and arg_79_1.time_ <= var_82_6 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_8 = arg_79_1:FormatText(StoryNameCfg[7].name)

				arg_79_1.leftNameTxt_.text = var_82_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_9 = arg_79_1:GetWordFromCfg(1101101019)
				local var_82_10 = arg_79_1:FormatText(var_82_9.content)

				arg_79_1.text_.text = var_82_10

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_11 = 25
				local var_82_12 = utf8.len(var_82_10)
				local var_82_13 = var_82_11 <= 0 and var_82_7 or var_82_7 * (var_82_12 / var_82_11)

				if var_82_13 > 0 and var_82_7 < var_82_13 then
					arg_79_1.talkMaxDuration = var_82_13

					if var_82_13 + var_82_6 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_13 + var_82_6
					end
				end

				arg_79_1.text_.text = var_82_10
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)
				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_14 = math.max(var_82_7, arg_79_1.talkMaxDuration)

			if var_82_6 <= arg_79_1.time_ and arg_79_1.time_ < var_82_6 + var_82_14 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_6) / var_82_14

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_6 + var_82_14 and arg_79_1.time_ < var_82_6 + var_82_14 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 1101101020
		arg_83_1.duration_ = 7.533

		local var_83_0 = {
			zh = 3.8,
			ja = 7.533
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
				arg_83_0:Play1101101021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1011ui_story"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1011ui_story = var_86_0.localPosition
			end

			local var_86_2 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2
				local var_86_4 = Vector3.New(0, -0.71, -6)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1011ui_story, var_86_4, var_86_3)

				local var_86_5 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_5.x, var_86_5.y, var_86_5.z)

				local var_86_6 = var_86_0.localEulerAngles

				var_86_6.z = 0
				var_86_6.x = 0
				var_86_0.localEulerAngles = var_86_6
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_86_7 = manager.ui.mainCamera.transform.position - var_86_0.position

				var_86_0.forward = Vector3.New(var_86_7.x, var_86_7.y, var_86_7.z)

				local var_86_8 = var_86_0.localEulerAngles

				var_86_8.z = 0
				var_86_8.x = 0
				var_86_0.localEulerAngles = var_86_8
			end

			local var_86_9 = arg_83_1.actors_["1011ui_story"]
			local var_86_10 = 0

			if var_86_10 < arg_83_1.time_ and arg_83_1.time_ <= var_86_10 + arg_86_0 and arg_83_1.var_.characterEffect1011ui_story == nil then
				arg_83_1.var_.characterEffect1011ui_story = var_86_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_11 = 0.200000002980232

			if var_86_10 <= arg_83_1.time_ and arg_83_1.time_ < var_86_10 + var_86_11 then
				local var_86_12 = (arg_83_1.time_ - var_86_10) / var_86_11

				if arg_83_1.var_.characterEffect1011ui_story then
					arg_83_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_83_1.time_ >= var_86_10 + var_86_11 and arg_83_1.time_ < var_86_10 + var_86_11 + arg_86_0 and arg_83_1.var_.characterEffect1011ui_story then
				arg_83_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_86_13 = 0

			if var_86_13 < arg_83_1.time_ and arg_83_1.time_ <= var_86_13 + arg_86_0 then
				arg_83_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_86_14 = 0
			local var_86_15 = 0.425

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_16 = arg_83_1:FormatText(StoryNameCfg[37].name)

				arg_83_1.leftNameTxt_.text = var_86_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_17 = arg_83_1:GetWordFromCfg(1101101020)
				local var_86_18 = arg_83_1:FormatText(var_86_17.content)

				arg_83_1.text_.text = var_86_18

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_19 = 17
				local var_86_20 = utf8.len(var_86_18)
				local var_86_21 = var_86_19 <= 0 and var_86_15 or var_86_15 * (var_86_20 / var_86_19)

				if var_86_21 > 0 and var_86_15 < var_86_21 then
					arg_83_1.talkMaxDuration = var_86_21

					if var_86_21 + var_86_14 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_21 + var_86_14
					end
				end

				arg_83_1.text_.text = var_86_18
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101020", "story_v_side_new_1101101.awb") ~= 0 then
					local var_86_22 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101020", "story_v_side_new_1101101.awb") / 1000

					if var_86_22 + var_86_14 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_14
					end

					if var_86_17.prefab_name ~= "" and arg_83_1.actors_[var_86_17.prefab_name] ~= nil then
						local var_86_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_17.prefab_name].transform, "story_v_side_new_1101101", "1101101020", "story_v_side_new_1101101.awb")

						arg_83_1:RecordAudio("1101101020", var_86_23)
						arg_83_1:RecordAudio("1101101020", var_86_23)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101020", "story_v_side_new_1101101.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101020", "story_v_side_new_1101101.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_24 = math.max(var_86_15, arg_83_1.talkMaxDuration)

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_24 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_14) / var_86_24

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_14 + var_86_24 and arg_83_1.time_ < var_86_14 + var_86_24 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 1101101021
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play1101101022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1011ui_story"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 and arg_87_1.var_.characterEffect1011ui_story == nil then
				arg_87_1.var_.characterEffect1011ui_story = var_90_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_2 = 0.200000002980232

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2

				if arg_87_1.var_.characterEffect1011ui_story then
					local var_90_4 = Mathf.Lerp(0, 0.5, var_90_3)

					arg_87_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_87_1.var_.characterEffect1011ui_story.fillRatio = var_90_4
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 and arg_87_1.var_.characterEffect1011ui_story then
				local var_90_5 = 0.5

				arg_87_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_87_1.var_.characterEffect1011ui_story.fillRatio = var_90_5
			end

			local var_90_6 = 0
			local var_90_7 = 0.325

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_8 = arg_87_1:FormatText(StoryNameCfg[7].name)

				arg_87_1.leftNameTxt_.text = var_90_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_9 = arg_87_1:GetWordFromCfg(1101101021)
				local var_90_10 = arg_87_1:FormatText(var_90_9.content)

				arg_87_1.text_.text = var_90_10

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_11 = 13
				local var_90_12 = utf8.len(var_90_10)
				local var_90_13 = var_90_11 <= 0 and var_90_7 or var_90_7 * (var_90_12 / var_90_11)

				if var_90_13 > 0 and var_90_7 < var_90_13 then
					arg_87_1.talkMaxDuration = var_90_13

					if var_90_13 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_13 + var_90_6
					end
				end

				arg_87_1.text_.text = var_90_10
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_14 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_14 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_14

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_14 and arg_87_1.time_ < var_90_6 + var_90_14 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 1101101022
		arg_91_1.duration_ = 8.666

		local var_91_0 = {
			zh = 8.666,
			ja = 8.5
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
				arg_91_0:Play1101101023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1011ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1011ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0, -0.71, -6)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1011ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = arg_91_1.actors_["1011ui_story"]
			local var_94_10 = 0

			if var_94_10 < arg_91_1.time_ and arg_91_1.time_ <= var_94_10 + arg_94_0 and arg_91_1.var_.characterEffect1011ui_story == nil then
				arg_91_1.var_.characterEffect1011ui_story = var_94_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_11 = 0.200000002980232

			if var_94_10 <= arg_91_1.time_ and arg_91_1.time_ < var_94_10 + var_94_11 then
				local var_94_12 = (arg_91_1.time_ - var_94_10) / var_94_11

				if arg_91_1.var_.characterEffect1011ui_story then
					arg_91_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_10 + var_94_11 and arg_91_1.time_ < var_94_10 + var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1011ui_story then
				arg_91_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_94_13 = 0

			if var_94_13 < arg_91_1.time_ and arg_91_1.time_ <= var_94_13 + arg_94_0 then
				arg_91_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action424")
			end

			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_94_15 = 0
			local var_94_16 = 1.125

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_17 = arg_91_1:FormatText(StoryNameCfg[37].name)

				arg_91_1.leftNameTxt_.text = var_94_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_18 = arg_91_1:GetWordFromCfg(1101101022)
				local var_94_19 = arg_91_1:FormatText(var_94_18.content)

				arg_91_1.text_.text = var_94_19

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_20 = 45
				local var_94_21 = utf8.len(var_94_19)
				local var_94_22 = var_94_20 <= 0 and var_94_16 or var_94_16 * (var_94_21 / var_94_20)

				if var_94_22 > 0 and var_94_16 < var_94_22 then
					arg_91_1.talkMaxDuration = var_94_22

					if var_94_22 + var_94_15 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_22 + var_94_15
					end
				end

				arg_91_1.text_.text = var_94_19
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101022", "story_v_side_new_1101101.awb") ~= 0 then
					local var_94_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101022", "story_v_side_new_1101101.awb") / 1000

					if var_94_23 + var_94_15 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_23 + var_94_15
					end

					if var_94_18.prefab_name ~= "" and arg_91_1.actors_[var_94_18.prefab_name] ~= nil then
						local var_94_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_18.prefab_name].transform, "story_v_side_new_1101101", "1101101022", "story_v_side_new_1101101.awb")

						arg_91_1:RecordAudio("1101101022", var_94_24)
						arg_91_1:RecordAudio("1101101022", var_94_24)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101022", "story_v_side_new_1101101.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101022", "story_v_side_new_1101101.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_25 = math.max(var_94_16, arg_91_1.talkMaxDuration)

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_25 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_15) / var_94_25

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_15 + var_94_25 and arg_91_1.time_ < var_94_15 + var_94_25 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 1101101023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play1101101024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1011ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect1011ui_story == nil then
				arg_95_1.var_.characterEffect1011ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect1011ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_95_1.var_.characterEffect1011ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect1011ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_95_1.var_.characterEffect1011ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0
			local var_98_7 = 0.9

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_8 = arg_95_1:GetWordFromCfg(1101101023)
				local var_98_9 = arg_95_1:FormatText(var_98_8.content)

				arg_95_1.text_.text = var_98_9

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_10 = 36
				local var_98_11 = utf8.len(var_98_9)
				local var_98_12 = var_98_10 <= 0 and var_98_7 or var_98_7 * (var_98_11 / var_98_10)

				if var_98_12 > 0 and var_98_7 < var_98_12 then
					arg_95_1.talkMaxDuration = var_98_12

					if var_98_12 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_12 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_9
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_13 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_13 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_13

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_13 and arg_95_1.time_ < var_98_6 + var_98_13 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 1101101024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play1101101025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.275

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

				local var_102_3 = arg_99_1:GetWordFromCfg(1101101024)
				local var_102_4 = arg_99_1:FormatText(var_102_3.content)

				arg_99_1.text_.text = var_102_4

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_5 = 11
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
	Play1101101025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 1101101025
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play1101101026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.675

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_2 = arg_103_1:GetWordFromCfg(1101101025)
				local var_106_3 = arg_103_1:FormatText(var_106_2.content)

				arg_103_1.text_.text = var_106_3

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_4 = 29
				local var_106_5 = utf8.len(var_106_3)
				local var_106_6 = var_106_4 <= 0 and var_106_1 or var_106_1 * (var_106_5 / var_106_4)

				if var_106_6 > 0 and var_106_1 < var_106_6 then
					arg_103_1.talkMaxDuration = var_106_6

					if var_106_6 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_6 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_3
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_7 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_7 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_7

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_7 and arg_103_1.time_ < var_106_0 + var_106_7 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 1101101026
		arg_107_1.duration_ = 11.733

		local var_107_0 = {
			zh = 11,
			ja = 11.733
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
				arg_107_0:Play1101101027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1011ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1011ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0, -0.71, -6)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1011ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["1011ui_story"]
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 and arg_107_1.var_.characterEffect1011ui_story == nil then
				arg_107_1.var_.characterEffect1011ui_story = var_110_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_11 = 0.200000002980232

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11

				if arg_107_1.var_.characterEffect1011ui_story then
					arg_107_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 and arg_107_1.var_.characterEffect1011ui_story then
				arg_107_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_110_13 = 0

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_2")
			end

			local var_110_14 = 0

			if var_110_14 < arg_107_1.time_ and arg_107_1.time_ <= var_110_14 + arg_110_0 then
				arg_107_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_15 = 0
			local var_110_16 = 1.15

			if var_110_15 < arg_107_1.time_ and arg_107_1.time_ <= var_110_15 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_17 = arg_107_1:FormatText(StoryNameCfg[37].name)

				arg_107_1.leftNameTxt_.text = var_110_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_18 = arg_107_1:GetWordFromCfg(1101101026)
				local var_110_19 = arg_107_1:FormatText(var_110_18.content)

				arg_107_1.text_.text = var_110_19

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_20 = 46
				local var_110_21 = utf8.len(var_110_19)
				local var_110_22 = var_110_20 <= 0 and var_110_16 or var_110_16 * (var_110_21 / var_110_20)

				if var_110_22 > 0 and var_110_16 < var_110_22 then
					arg_107_1.talkMaxDuration = var_110_22

					if var_110_22 + var_110_15 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_22 + var_110_15
					end
				end

				arg_107_1.text_.text = var_110_19
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101026", "story_v_side_new_1101101.awb") ~= 0 then
					local var_110_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101026", "story_v_side_new_1101101.awb") / 1000

					if var_110_23 + var_110_15 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_23 + var_110_15
					end

					if var_110_18.prefab_name ~= "" and arg_107_1.actors_[var_110_18.prefab_name] ~= nil then
						local var_110_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_18.prefab_name].transform, "story_v_side_new_1101101", "1101101026", "story_v_side_new_1101101.awb")

						arg_107_1:RecordAudio("1101101026", var_110_24)
						arg_107_1:RecordAudio("1101101026", var_110_24)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101026", "story_v_side_new_1101101.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101026", "story_v_side_new_1101101.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_25 = math.max(var_110_16, arg_107_1.talkMaxDuration)

			if var_110_15 <= arg_107_1.time_ and arg_107_1.time_ < var_110_15 + var_110_25 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_15) / var_110_25

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_15 + var_110_25 and arg_107_1.time_ < var_110_15 + var_110_25 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 1101101027
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play1101101028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1011ui_story"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.characterEffect1011ui_story == nil then
				arg_111_1.var_.characterEffect1011ui_story = var_114_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_2 = 0.200000002980232

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.characterEffect1011ui_story then
					local var_114_4 = Mathf.Lerp(0, 0.5, var_114_3)

					arg_111_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1011ui_story.fillRatio = var_114_4
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.characterEffect1011ui_story then
				local var_114_5 = 0.5

				arg_111_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1011ui_story.fillRatio = var_114_5
			end

			local var_114_6 = 0
			local var_114_7 = 0.625

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_8 = arg_111_1:FormatText(StoryNameCfg[7].name)

				arg_111_1.leftNameTxt_.text = var_114_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_9 = arg_111_1:GetWordFromCfg(1101101027)
				local var_114_10 = arg_111_1:FormatText(var_114_9.content)

				arg_111_1.text_.text = var_114_10

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_11 = 25
				local var_114_12 = utf8.len(var_114_10)
				local var_114_13 = var_114_11 <= 0 and var_114_7 or var_114_7 * (var_114_12 / var_114_11)

				if var_114_13 > 0 and var_114_7 < var_114_13 then
					arg_111_1.talkMaxDuration = var_114_13

					if var_114_13 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_13 + var_114_6
					end
				end

				arg_111_1.text_.text = var_114_10
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_14 = math.max(var_114_7, arg_111_1.talkMaxDuration)

			if var_114_6 <= arg_111_1.time_ and arg_111_1.time_ < var_114_6 + var_114_14 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_6) / var_114_14

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_6 + var_114_14 and arg_111_1.time_ < var_114_6 + var_114_14 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 1101101028
		arg_115_1.duration_ = 5

		SetActive(arg_115_1.tipsGo_, false)

		function arg_115_1.onSingleLineFinish_()
			arg_115_1.onSingleLineUpdate_ = nil
			arg_115_1.onSingleLineFinish_ = nil
			arg_115_1.state_ = "waiting"
		end

		function arg_115_1.playNext_(arg_117_0)
			if arg_117_0 == 1 then
				arg_115_0:Play1101101029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0
			local var_118_1 = 0.5

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

				local var_118_3 = arg_115_1:GetWordFromCfg(1101101028)
				local var_118_4 = arg_115_1:FormatText(var_118_3.content)

				arg_115_1.text_.text = var_118_4

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_5 = 20
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
	Play1101101029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 1101101029
		arg_119_1.duration_ = 10.4

		local var_119_0 = {
			zh = 10.4,
			ja = 7
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
				arg_119_0:Play1101101030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1011ui_story"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos1011ui_story = var_122_0.localPosition
			end

			local var_122_2 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2
				local var_122_4 = Vector3.New(0, -0.71, -6)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos1011ui_story, var_122_4, var_122_3)

				local var_122_5 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_5.x, var_122_5.y, var_122_5.z)

				local var_122_6 = var_122_0.localEulerAngles

				var_122_6.z = 0
				var_122_6.x = 0
				var_122_0.localEulerAngles = var_122_6
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_122_7 = manager.ui.mainCamera.transform.position - var_122_0.position

				var_122_0.forward = Vector3.New(var_122_7.x, var_122_7.y, var_122_7.z)

				local var_122_8 = var_122_0.localEulerAngles

				var_122_8.z = 0
				var_122_8.x = 0
				var_122_0.localEulerAngles = var_122_8
			end

			local var_122_9 = arg_119_1.actors_["1011ui_story"]
			local var_122_10 = 0

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 and arg_119_1.var_.characterEffect1011ui_story == nil then
				arg_119_1.var_.characterEffect1011ui_story = var_122_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_11 = 0.200000002980232

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_11 then
				local var_122_12 = (arg_119_1.time_ - var_122_10) / var_122_11

				if arg_119_1.var_.characterEffect1011ui_story then
					arg_119_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_10 + var_122_11 and arg_119_1.time_ < var_122_10 + var_122_11 + arg_122_0 and arg_119_1.var_.characterEffect1011ui_story then
				arg_119_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_122_13 = 0

			if var_122_13 < arg_119_1.time_ and arg_119_1.time_ <= var_122_13 + arg_122_0 then
				arg_119_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_122_14 = 0
			local var_122_15 = 1

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_16 = arg_119_1:FormatText(StoryNameCfg[37].name)

				arg_119_1.leftNameTxt_.text = var_122_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_17 = arg_119_1:GetWordFromCfg(1101101029)
				local var_122_18 = arg_119_1:FormatText(var_122_17.content)

				arg_119_1.text_.text = var_122_18

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_19 = 40
				local var_122_20 = utf8.len(var_122_18)
				local var_122_21 = var_122_19 <= 0 and var_122_15 or var_122_15 * (var_122_20 / var_122_19)

				if var_122_21 > 0 and var_122_15 < var_122_21 then
					arg_119_1.talkMaxDuration = var_122_21

					if var_122_21 + var_122_14 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_21 + var_122_14
					end
				end

				arg_119_1.text_.text = var_122_18
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101029", "story_v_side_new_1101101.awb") ~= 0 then
					local var_122_22 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101029", "story_v_side_new_1101101.awb") / 1000

					if var_122_22 + var_122_14 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_22 + var_122_14
					end

					if var_122_17.prefab_name ~= "" and arg_119_1.actors_[var_122_17.prefab_name] ~= nil then
						local var_122_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_17.prefab_name].transform, "story_v_side_new_1101101", "1101101029", "story_v_side_new_1101101.awb")

						arg_119_1:RecordAudio("1101101029", var_122_23)
						arg_119_1:RecordAudio("1101101029", var_122_23)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101029", "story_v_side_new_1101101.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101029", "story_v_side_new_1101101.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_24 = math.max(var_122_15, arg_119_1.talkMaxDuration)

			if var_122_14 <= arg_119_1.time_ and arg_119_1.time_ < var_122_14 + var_122_24 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_14) / var_122_24

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_14 + var_122_24 and arg_119_1.time_ < var_122_14 + var_122_24 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 1101101030
		arg_123_1.duration_ = 11.166

		local var_123_0 = {
			zh = 8.566,
			ja = 11.166
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
				arg_123_0:Play1101101031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_126_2 = 0
			local var_126_3 = 1.1

			if var_126_2 < arg_123_1.time_ and arg_123_1.time_ <= var_126_2 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_4 = arg_123_1:FormatText(StoryNameCfg[37].name)

				arg_123_1.leftNameTxt_.text = var_126_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_5 = arg_123_1:GetWordFromCfg(1101101030)
				local var_126_6 = arg_123_1:FormatText(var_126_5.content)

				arg_123_1.text_.text = var_126_6

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_7 = 44
				local var_126_8 = utf8.len(var_126_6)
				local var_126_9 = var_126_7 <= 0 and var_126_3 or var_126_3 * (var_126_8 / var_126_7)

				if var_126_9 > 0 and var_126_3 < var_126_9 then
					arg_123_1.talkMaxDuration = var_126_9

					if var_126_9 + var_126_2 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_9 + var_126_2
					end
				end

				arg_123_1.text_.text = var_126_6
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101030", "story_v_side_new_1101101.awb") ~= 0 then
					local var_126_10 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101030", "story_v_side_new_1101101.awb") / 1000

					if var_126_10 + var_126_2 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_10 + var_126_2
					end

					if var_126_5.prefab_name ~= "" and arg_123_1.actors_[var_126_5.prefab_name] ~= nil then
						local var_126_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_5.prefab_name].transform, "story_v_side_new_1101101", "1101101030", "story_v_side_new_1101101.awb")

						arg_123_1:RecordAudio("1101101030", var_126_11)
						arg_123_1:RecordAudio("1101101030", var_126_11)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101030", "story_v_side_new_1101101.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101030", "story_v_side_new_1101101.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_12 = math.max(var_126_3, arg_123_1.talkMaxDuration)

			if var_126_2 <= arg_123_1.time_ and arg_123_1.time_ < var_126_2 + var_126_12 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_2) / var_126_12

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_2 + var_126_12 and arg_123_1.time_ < var_126_2 + var_126_12 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 1101101031
		arg_127_1.duration_ = 6.3

		local var_127_0 = {
			zh = 6.3,
			ja = 4.133
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
				arg_127_0:Play1101101032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_130_1 = 0
			local var_130_2 = 0.7

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_3 = arg_127_1:FormatText(StoryNameCfg[37].name)

				arg_127_1.leftNameTxt_.text = var_130_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_4 = arg_127_1:GetWordFromCfg(1101101031)
				local var_130_5 = arg_127_1:FormatText(var_130_4.content)

				arg_127_1.text_.text = var_130_5

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_6 = 28
				local var_130_7 = utf8.len(var_130_5)
				local var_130_8 = var_130_6 <= 0 and var_130_2 or var_130_2 * (var_130_7 / var_130_6)

				if var_130_8 > 0 and var_130_2 < var_130_8 then
					arg_127_1.talkMaxDuration = var_130_8

					if var_130_8 + var_130_1 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_8 + var_130_1
					end
				end

				arg_127_1.text_.text = var_130_5
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101031", "story_v_side_new_1101101.awb") ~= 0 then
					local var_130_9 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101031", "story_v_side_new_1101101.awb") / 1000

					if var_130_9 + var_130_1 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_9 + var_130_1
					end

					if var_130_4.prefab_name ~= "" and arg_127_1.actors_[var_130_4.prefab_name] ~= nil then
						local var_130_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_4.prefab_name].transform, "story_v_side_new_1101101", "1101101031", "story_v_side_new_1101101.awb")

						arg_127_1:RecordAudio("1101101031", var_130_10)
						arg_127_1:RecordAudio("1101101031", var_130_10)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101031", "story_v_side_new_1101101.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101031", "story_v_side_new_1101101.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_11 = math.max(var_130_2, arg_127_1.talkMaxDuration)

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_11 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_1) / var_130_11

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_1 + var_130_11 and arg_127_1.time_ < var_130_1 + var_130_11 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 1101101032
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play1101101033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["1011ui_story"]
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 and arg_131_1.var_.characterEffect1011ui_story == nil then
				arg_131_1.var_.characterEffect1011ui_story = var_134_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_134_2 = 0.200000002980232

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_2 then
				local var_134_3 = (arg_131_1.time_ - var_134_1) / var_134_2

				if arg_131_1.var_.characterEffect1011ui_story then
					local var_134_4 = Mathf.Lerp(0, 0.5, var_134_3)

					arg_131_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_131_1.var_.characterEffect1011ui_story.fillRatio = var_134_4
				end
			end

			if arg_131_1.time_ >= var_134_1 + var_134_2 and arg_131_1.time_ < var_134_1 + var_134_2 + arg_134_0 and arg_131_1.var_.characterEffect1011ui_story then
				local var_134_5 = 0.5

				arg_131_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_131_1.var_.characterEffect1011ui_story.fillRatio = var_134_5
			end

			local var_134_6 = 0
			local var_134_7 = 0.525

			if var_134_6 < arg_131_1.time_ and arg_131_1.time_ <= var_134_6 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, false)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_8 = arg_131_1:GetWordFromCfg(1101101032)
				local var_134_9 = arg_131_1:FormatText(var_134_8.content)

				arg_131_1.text_.text = var_134_9

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_10 = 21
				local var_134_11 = utf8.len(var_134_9)
				local var_134_12 = var_134_10 <= 0 and var_134_7 or var_134_7 * (var_134_11 / var_134_10)

				if var_134_12 > 0 and var_134_7 < var_134_12 then
					arg_131_1.talkMaxDuration = var_134_12

					if var_134_12 + var_134_6 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_12 + var_134_6
					end
				end

				arg_131_1.text_.text = var_134_9
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)
				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_13 = math.max(var_134_7, arg_131_1.talkMaxDuration)

			if var_134_6 <= arg_131_1.time_ and arg_131_1.time_ < var_134_6 + var_134_13 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_6) / var_134_13

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_6 + var_134_13 and arg_131_1.time_ < var_134_6 + var_134_13 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 1101101033
		arg_135_1.duration_ = 0.999999999999

		SetActive(arg_135_1.tipsGo_, true)

		arg_135_1.tipsText_.text = StoryTipsCfg[101101].name

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"

			SetActive(arg_135_1.choicesGo_, true)

			for iter_136_0, iter_136_1 in ipairs(arg_135_1.choices_) do
				local var_136_0 = iter_136_0 <= 2

				SetActive(iter_136_1.go, var_136_0)
			end

			arg_135_1.choices_[1].txt.text = arg_135_1:FormatText(StoryChoiceCfg[604].name)
			arg_135_1.choices_[2].txt.text = arg_135_1:FormatText(StoryChoiceCfg[605].name)
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				PlayerAction.UseStoryTrigger(1011012, 210110101, 1101101033, 1)
				arg_135_0:Play1101101034(arg_135_1)
			end

			if arg_137_0 == 2 then
				PlayerAction.UseStoryTrigger(1011012, 210110101, 1101101033, 2)
				arg_135_0:Play1101101036(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = 0

			if var_138_0 < arg_135_1.time_ and arg_135_1.time_ <= var_138_0 + arg_138_0 then
				arg_135_1.allBtn_.enabled = false
			end

			local var_138_1 = 0.5

			if arg_135_1.time_ >= var_138_0 + var_138_1 and arg_135_1.time_ < var_138_0 + var_138_1 + arg_138_0 then
				arg_135_1.allBtn_.enabled = true
			end
		end
	end,
	Play1101101034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 1101101034
		arg_139_1.duration_ = 2.833

		local var_139_0 = {
			zh = 1.999999999999,
			ja = 2.833
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
				arg_139_0:Play1101101035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = arg_139_1.actors_["1011ui_story"].transform
			local var_142_1 = 0

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.var_.moveOldPos1011ui_story = var_142_0.localPosition
			end

			local var_142_2 = 0.001

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_2 then
				local var_142_3 = (arg_139_1.time_ - var_142_1) / var_142_2
				local var_142_4 = Vector3.New(0, -0.71, -6)

				var_142_0.localPosition = Vector3.Lerp(arg_139_1.var_.moveOldPos1011ui_story, var_142_4, var_142_3)

				local var_142_5 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_5.x, var_142_5.y, var_142_5.z)

				local var_142_6 = var_142_0.localEulerAngles

				var_142_6.z = 0
				var_142_6.x = 0
				var_142_0.localEulerAngles = var_142_6
			end

			if arg_139_1.time_ >= var_142_1 + var_142_2 and arg_139_1.time_ < var_142_1 + var_142_2 + arg_142_0 then
				var_142_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_142_7 = manager.ui.mainCamera.transform.position - var_142_0.position

				var_142_0.forward = Vector3.New(var_142_7.x, var_142_7.y, var_142_7.z)

				local var_142_8 = var_142_0.localEulerAngles

				var_142_8.z = 0
				var_142_8.x = 0
				var_142_0.localEulerAngles = var_142_8
			end

			local var_142_9 = arg_139_1.actors_["1011ui_story"]
			local var_142_10 = 0

			if var_142_10 < arg_139_1.time_ and arg_139_1.time_ <= var_142_10 + arg_142_0 and arg_139_1.var_.characterEffect1011ui_story == nil then
				arg_139_1.var_.characterEffect1011ui_story = var_142_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_11 = 0.200000002980232

			if var_142_10 <= arg_139_1.time_ and arg_139_1.time_ < var_142_10 + var_142_11 then
				local var_142_12 = (arg_139_1.time_ - var_142_10) / var_142_11

				if arg_139_1.var_.characterEffect1011ui_story then
					arg_139_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_10 + var_142_11 and arg_139_1.time_ < var_142_10 + var_142_11 + arg_142_0 and arg_139_1.var_.characterEffect1011ui_story then
				arg_139_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_142_13 = 0

			if var_142_13 < arg_139_1.time_ and arg_139_1.time_ <= var_142_13 + arg_142_0 then
				arg_139_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_142_14 = 0
			local var_142_15 = 0.125

			if var_142_14 < arg_139_1.time_ and arg_139_1.time_ <= var_142_14 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_16 = arg_139_1:FormatText(StoryNameCfg[37].name)

				arg_139_1.leftNameTxt_.text = var_142_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_17 = arg_139_1:GetWordFromCfg(1101101034)
				local var_142_18 = arg_139_1:FormatText(var_142_17.content)

				arg_139_1.text_.text = var_142_18

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_19 = 5
				local var_142_20 = utf8.len(var_142_18)
				local var_142_21 = var_142_19 <= 0 and var_142_15 or var_142_15 * (var_142_20 / var_142_19)

				if var_142_21 > 0 and var_142_15 < var_142_21 then
					arg_139_1.talkMaxDuration = var_142_21

					if var_142_21 + var_142_14 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_21 + var_142_14
					end
				end

				arg_139_1.text_.text = var_142_18
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101034", "story_v_side_new_1101101.awb") ~= 0 then
					local var_142_22 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101034", "story_v_side_new_1101101.awb") / 1000

					if var_142_22 + var_142_14 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_22 + var_142_14
					end

					if var_142_17.prefab_name ~= "" and arg_139_1.actors_[var_142_17.prefab_name] ~= nil then
						local var_142_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_17.prefab_name].transform, "story_v_side_new_1101101", "1101101034", "story_v_side_new_1101101.awb")

						arg_139_1:RecordAudio("1101101034", var_142_23)
						arg_139_1:RecordAudio("1101101034", var_142_23)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101034", "story_v_side_new_1101101.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101034", "story_v_side_new_1101101.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_24 = math.max(var_142_15, arg_139_1.talkMaxDuration)

			if var_142_14 <= arg_139_1.time_ and arg_139_1.time_ < var_142_14 + var_142_24 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_14) / var_142_24

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_14 + var_142_24 and arg_139_1.time_ < var_142_14 + var_142_24 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 1101101035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play1101101038(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1011ui_story"]
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 and arg_143_1.var_.characterEffect1011ui_story == nil then
				arg_143_1.var_.characterEffect1011ui_story = var_146_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_2 = 0.200000002980232

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_2 then
				local var_146_3 = (arg_143_1.time_ - var_146_1) / var_146_2

				if arg_143_1.var_.characterEffect1011ui_story then
					local var_146_4 = Mathf.Lerp(0, 0.5, var_146_3)

					arg_143_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1011ui_story.fillRatio = var_146_4
				end
			end

			if arg_143_1.time_ >= var_146_1 + var_146_2 and arg_143_1.time_ < var_146_1 + var_146_2 + arg_146_0 and arg_143_1.var_.characterEffect1011ui_story then
				local var_146_5 = 0.5

				arg_143_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1011ui_story.fillRatio = var_146_5
			end

			local var_146_6 = 0
			local var_146_7 = 0.825

			if var_146_6 < arg_143_1.time_ and arg_143_1.time_ <= var_146_6 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, false)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_8 = arg_143_1:GetWordFromCfg(1101101035)
				local var_146_9 = arg_143_1:FormatText(var_146_8.content)

				arg_143_1.text_.text = var_146_9

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_10 = 33
				local var_146_11 = utf8.len(var_146_9)
				local var_146_12 = var_146_10 <= 0 and var_146_7 or var_146_7 * (var_146_11 / var_146_10)

				if var_146_12 > 0 and var_146_7 < var_146_12 then
					arg_143_1.talkMaxDuration = var_146_12

					if var_146_12 + var_146_6 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_12 + var_146_6
					end
				end

				arg_143_1.text_.text = var_146_9
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)
				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_13 = math.max(var_146_7, arg_143_1.talkMaxDuration)

			if var_146_6 <= arg_143_1.time_ and arg_143_1.time_ < var_146_6 + var_146_13 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_6) / var_146_13

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_6 + var_146_13 and arg_143_1.time_ < var_146_6 + var_146_13 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101038 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 1101101038
		arg_147_1.duration_ = 5

		SetActive(arg_147_1.tipsGo_, false)

		function arg_147_1.onSingleLineFinish_()
			arg_147_1.onSingleLineUpdate_ = nil
			arg_147_1.onSingleLineFinish_ = nil
			arg_147_1.state_ = "waiting"
		end

		function arg_147_1.playNext_(arg_149_0)
			if arg_149_0 == 1 then
				arg_147_0:Play1101101039(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0
			local var_150_1 = 0.525

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

				local var_150_3 = arg_147_1:GetWordFromCfg(1101101038)
				local var_150_4 = arg_147_1:FormatText(var_150_3.content)

				arg_147_1.text_.text = var_150_4

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_5 = 21
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
	Play1101101039 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 1101101039
		arg_151_1.duration_ = 2.533

		local var_151_0 = {
			zh = 1.999999999999,
			ja = 2.533
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
				arg_151_0:Play1101101040(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1011ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1011ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(0, -0.71, -6)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1011ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["1011ui_story"]
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 and arg_151_1.var_.characterEffect1011ui_story == nil then
				arg_151_1.var_.characterEffect1011ui_story = var_154_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_154_11 = 0.200000002980232

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11

				if arg_151_1.var_.characterEffect1011ui_story then
					arg_151_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 and arg_151_1.var_.characterEffect1011ui_story then
				arg_151_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_154_13 = 0

			if var_154_13 < arg_151_1.time_ and arg_151_1.time_ <= var_154_13 + arg_154_0 then
				arg_151_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_2")
			end

			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 then
				arg_151_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_154_15 = 0
			local var_154_16 = 0.125

			if var_154_15 < arg_151_1.time_ and arg_151_1.time_ <= var_154_15 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_17 = arg_151_1:FormatText(StoryNameCfg[37].name)

				arg_151_1.leftNameTxt_.text = var_154_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_18 = arg_151_1:GetWordFromCfg(1101101039)
				local var_154_19 = arg_151_1:FormatText(var_154_18.content)

				arg_151_1.text_.text = var_154_19

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_20 = 5
				local var_154_21 = utf8.len(var_154_19)
				local var_154_22 = var_154_20 <= 0 and var_154_16 or var_154_16 * (var_154_21 / var_154_20)

				if var_154_22 > 0 and var_154_16 < var_154_22 then
					arg_151_1.talkMaxDuration = var_154_22

					if var_154_22 + var_154_15 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_22 + var_154_15
					end
				end

				arg_151_1.text_.text = var_154_19
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101039", "story_v_side_new_1101101.awb") ~= 0 then
					local var_154_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101039", "story_v_side_new_1101101.awb") / 1000

					if var_154_23 + var_154_15 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_23 + var_154_15
					end

					if var_154_18.prefab_name ~= "" and arg_151_1.actors_[var_154_18.prefab_name] ~= nil then
						local var_154_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_18.prefab_name].transform, "story_v_side_new_1101101", "1101101039", "story_v_side_new_1101101.awb")

						arg_151_1:RecordAudio("1101101039", var_154_24)
						arg_151_1:RecordAudio("1101101039", var_154_24)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101039", "story_v_side_new_1101101.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101039", "story_v_side_new_1101101.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_25 = math.max(var_154_16, arg_151_1.talkMaxDuration)

			if var_154_15 <= arg_151_1.time_ and arg_151_1.time_ < var_154_15 + var_154_25 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_15) / var_154_25

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_15 + var_154_25 and arg_151_1.time_ < var_154_15 + var_154_25 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101040 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 1101101040
		arg_155_1.duration_ = 5

		SetActive(arg_155_1.tipsGo_, false)

		function arg_155_1.onSingleLineFinish_()
			arg_155_1.onSingleLineUpdate_ = nil
			arg_155_1.onSingleLineFinish_ = nil
			arg_155_1.state_ = "waiting"
		end

		function arg_155_1.playNext_(arg_157_0)
			if arg_157_0 == 1 then
				arg_155_0:Play1101101041(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1011ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1011ui_story == nil then
				arg_155_1.var_.characterEffect1011ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.200000002980232

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1011ui_story then
					local var_158_4 = Mathf.Lerp(0, 0.5, var_158_3)

					arg_155_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1011ui_story.fillRatio = var_158_4
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1011ui_story then
				local var_158_5 = 0.5

				arg_155_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1011ui_story.fillRatio = var_158_5
			end

			local var_158_6 = 0
			local var_158_7 = 1.125

			if var_158_6 < arg_155_1.time_ and arg_155_1.time_ <= var_158_6 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_8 = arg_155_1:FormatText(StoryNameCfg[7].name)

				arg_155_1.leftNameTxt_.text = var_158_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_9 = arg_155_1:GetWordFromCfg(1101101040)
				local var_158_10 = arg_155_1:FormatText(var_158_9.content)

				arg_155_1.text_.text = var_158_10

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_11 = 45
				local var_158_12 = utf8.len(var_158_10)
				local var_158_13 = var_158_11 <= 0 and var_158_7 or var_158_7 * (var_158_12 / var_158_11)

				if var_158_13 > 0 and var_158_7 < var_158_13 then
					arg_155_1.talkMaxDuration = var_158_13

					if var_158_13 + var_158_6 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_13 + var_158_6
					end
				end

				arg_155_1.text_.text = var_158_10
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)
				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_14 = math.max(var_158_7, arg_155_1.talkMaxDuration)

			if var_158_6 <= arg_155_1.time_ and arg_155_1.time_ < var_158_6 + var_158_14 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_6) / var_158_14

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_6 + var_158_14 and arg_155_1.time_ < var_158_6 + var_158_14 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101041 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 1101101041
		arg_159_1.duration_ = 4.6

		local var_159_0 = {
			zh = 3.1,
			ja = 4.6
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
				arg_159_0:Play1101101042(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1011ui_story"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos1011ui_story = var_162_0.localPosition
			end

			local var_162_2 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2
				local var_162_4 = Vector3.New(0, -0.71, -6)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1011ui_story, var_162_4, var_162_3)

				local var_162_5 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_5.x, var_162_5.y, var_162_5.z)

				local var_162_6 = var_162_0.localEulerAngles

				var_162_6.z = 0
				var_162_6.x = 0
				var_162_0.localEulerAngles = var_162_6
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_162_7 = manager.ui.mainCamera.transform.position - var_162_0.position

				var_162_0.forward = Vector3.New(var_162_7.x, var_162_7.y, var_162_7.z)

				local var_162_8 = var_162_0.localEulerAngles

				var_162_8.z = 0
				var_162_8.x = 0
				var_162_0.localEulerAngles = var_162_8
			end

			local var_162_9 = arg_159_1.actors_["1011ui_story"]
			local var_162_10 = 0

			if var_162_10 < arg_159_1.time_ and arg_159_1.time_ <= var_162_10 + arg_162_0 and arg_159_1.var_.characterEffect1011ui_story == nil then
				arg_159_1.var_.characterEffect1011ui_story = var_162_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_11 = 0.200000002980232

			if var_162_10 <= arg_159_1.time_ and arg_159_1.time_ < var_162_10 + var_162_11 then
				local var_162_12 = (arg_159_1.time_ - var_162_10) / var_162_11

				if arg_159_1.var_.characterEffect1011ui_story then
					arg_159_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_10 + var_162_11 and arg_159_1.time_ < var_162_10 + var_162_11 + arg_162_0 and arg_159_1.var_.characterEffect1011ui_story then
				arg_159_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_162_13 = 0

			if var_162_13 < arg_159_1.time_ and arg_159_1.time_ <= var_162_13 + arg_162_0 then
				arg_159_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_162_14 = 0

			if var_162_14 < arg_159_1.time_ and arg_159_1.time_ <= var_162_14 + arg_162_0 then
				arg_159_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_162_15 = 0
			local var_162_16 = 0.3

			if var_162_15 < arg_159_1.time_ and arg_159_1.time_ <= var_162_15 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_17 = arg_159_1:FormatText(StoryNameCfg[37].name)

				arg_159_1.leftNameTxt_.text = var_162_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_18 = arg_159_1:GetWordFromCfg(1101101041)
				local var_162_19 = arg_159_1:FormatText(var_162_18.content)

				arg_159_1.text_.text = var_162_19

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_20 = 12
				local var_162_21 = utf8.len(var_162_19)
				local var_162_22 = var_162_20 <= 0 and var_162_16 or var_162_16 * (var_162_21 / var_162_20)

				if var_162_22 > 0 and var_162_16 < var_162_22 then
					arg_159_1.talkMaxDuration = var_162_22

					if var_162_22 + var_162_15 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_22 + var_162_15
					end
				end

				arg_159_1.text_.text = var_162_19
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101041", "story_v_side_new_1101101.awb") ~= 0 then
					local var_162_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101041", "story_v_side_new_1101101.awb") / 1000

					if var_162_23 + var_162_15 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_23 + var_162_15
					end

					if var_162_18.prefab_name ~= "" and arg_159_1.actors_[var_162_18.prefab_name] ~= nil then
						local var_162_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_18.prefab_name].transform, "story_v_side_new_1101101", "1101101041", "story_v_side_new_1101101.awb")

						arg_159_1:RecordAudio("1101101041", var_162_24)
						arg_159_1:RecordAudio("1101101041", var_162_24)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101041", "story_v_side_new_1101101.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101041", "story_v_side_new_1101101.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_25 = math.max(var_162_16, arg_159_1.talkMaxDuration)

			if var_162_15 <= arg_159_1.time_ and arg_159_1.time_ < var_162_15 + var_162_25 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_15) / var_162_25

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_15 + var_162_25 and arg_159_1.time_ < var_162_15 + var_162_25 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101042 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 1101101042
		arg_163_1.duration_ = 11

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play1101101043(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = "D12b"

			if arg_163_1.bgs_[var_166_0] == nil then
				local var_166_1 = Object.Instantiate(arg_163_1.paintGo_)

				var_166_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_166_0)
				var_166_1.name = var_166_0
				var_166_1.transform.parent = arg_163_1.stage_.transform
				var_166_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_163_1.bgs_[var_166_0] = var_166_1
			end

			local var_166_2 = 3

			if var_166_2 < arg_163_1.time_ and arg_163_1.time_ <= var_166_2 + arg_166_0 then
				local var_166_3 = manager.ui.mainCamera.transform.localPosition
				local var_166_4 = Vector3.New(0, 0, 10) + Vector3.New(var_166_3.x, var_166_3.y, 0)
				local var_166_5 = arg_163_1.bgs_.D12b

				var_166_5.transform.localPosition = var_166_4
				var_166_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_166_6 = var_166_5:GetComponent("SpriteRenderer")

				if var_166_6 and var_166_6.sprite then
					local var_166_7 = (var_166_5.transform.localPosition - var_166_3).z
					local var_166_8 = manager.ui.mainCameraCom_
					local var_166_9 = 2 * var_166_7 * Mathf.Tan(var_166_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_166_10 = var_166_9 * var_166_8.aspect
					local var_166_11 = var_166_6.sprite.bounds.size.x
					local var_166_12 = var_166_6.sprite.bounds.size.y
					local var_166_13 = var_166_10 / var_166_11
					local var_166_14 = var_166_9 / var_166_12
					local var_166_15 = var_166_14 < var_166_13 and var_166_13 or var_166_14

					var_166_5.transform.localScale = Vector3.New(var_166_15, var_166_15, 0)
				end

				for iter_166_0, iter_166_1 in pairs(arg_163_1.bgs_) do
					if iter_166_0 ~= "D12b" then
						iter_166_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_166_16 = 0

			if var_166_16 < arg_163_1.time_ and arg_163_1.time_ <= var_166_16 + arg_166_0 then
				arg_163_1.mask_.enabled = true
				arg_163_1.mask_.raycastTarget = true

				arg_163_1:SetGaussion(false)
			end

			local var_166_17 = 3

			if var_166_16 <= arg_163_1.time_ and arg_163_1.time_ < var_166_16 + var_166_17 then
				local var_166_18 = (arg_163_1.time_ - var_166_16) / var_166_17
				local var_166_19 = Color.New(0, 0, 0)

				var_166_19.a = Mathf.Lerp(0, 1, var_166_18)
				arg_163_1.mask_.color = var_166_19
			end

			if arg_163_1.time_ >= var_166_16 + var_166_17 and arg_163_1.time_ < var_166_16 + var_166_17 + arg_166_0 then
				local var_166_20 = Color.New(0, 0, 0)

				var_166_20.a = 1
				arg_163_1.mask_.color = var_166_20
			end

			local var_166_21 = 3

			if var_166_21 < arg_163_1.time_ and arg_163_1.time_ <= var_166_21 + arg_166_0 then
				arg_163_1.mask_.enabled = true
				arg_163_1.mask_.raycastTarget = true

				arg_163_1:SetGaussion(false)
			end

			local var_166_22 = 3

			if var_166_21 <= arg_163_1.time_ and arg_163_1.time_ < var_166_21 + var_166_22 then
				local var_166_23 = (arg_163_1.time_ - var_166_21) / var_166_22
				local var_166_24 = Color.New(0, 0, 0)

				var_166_24.a = Mathf.Lerp(1, 0, var_166_23)
				arg_163_1.mask_.color = var_166_24
			end

			if arg_163_1.time_ >= var_166_21 + var_166_22 and arg_163_1.time_ < var_166_21 + var_166_22 + arg_166_0 then
				local var_166_25 = Color.New(0, 0, 0)
				local var_166_26 = 0

				arg_163_1.mask_.enabled = false
				var_166_25.a = var_166_26
				arg_163_1.mask_.color = var_166_25
			end

			local var_166_27 = arg_163_1.actors_["1011ui_story"].transform
			local var_166_28 = 3

			if var_166_28 < arg_163_1.time_ and arg_163_1.time_ <= var_166_28 + arg_166_0 then
				arg_163_1.var_.moveOldPos1011ui_story = var_166_27.localPosition
			end

			local var_166_29 = 0.001

			if var_166_28 <= arg_163_1.time_ and arg_163_1.time_ < var_166_28 + var_166_29 then
				local var_166_30 = (arg_163_1.time_ - var_166_28) / var_166_29
				local var_166_31 = Vector3.New(0, 100, 0)

				var_166_27.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1011ui_story, var_166_31, var_166_30)

				local var_166_32 = manager.ui.mainCamera.transform.position - var_166_27.position

				var_166_27.forward = Vector3.New(var_166_32.x, var_166_32.y, var_166_32.z)

				local var_166_33 = var_166_27.localEulerAngles

				var_166_33.z = 0
				var_166_33.x = 0
				var_166_27.localEulerAngles = var_166_33
			end

			if arg_163_1.time_ >= var_166_28 + var_166_29 and arg_163_1.time_ < var_166_28 + var_166_29 + arg_166_0 then
				var_166_27.localPosition = Vector3.New(0, 100, 0)

				local var_166_34 = manager.ui.mainCamera.transform.position - var_166_27.position

				var_166_27.forward = Vector3.New(var_166_34.x, var_166_34.y, var_166_34.z)

				local var_166_35 = var_166_27.localEulerAngles

				var_166_35.z = 0
				var_166_35.x = 0
				var_166_27.localEulerAngles = var_166_35
			end

			local var_166_36 = 0
			local var_166_37 = 0.3

			if var_166_36 < arg_163_1.time_ and arg_163_1.time_ <= var_166_36 + arg_166_0 then
				local var_166_38 = "play"
				local var_166_39 = "music"

				arg_163_1:AudioAction(var_166_38, var_166_39, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_163_1.frameCnt_ <= 1 then
				arg_163_1.dialog_:SetActive(false)
			end

			local var_166_40 = 6
			local var_166_41 = 0.875

			if var_166_40 < arg_163_1.time_ and arg_163_1.time_ <= var_166_40 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0

				arg_163_1.dialog_:SetActive(true)

				local var_166_42 = LeanTween.value(arg_163_1.dialog_, 0, 1, 0.3)

				var_166_42:setOnUpdate(LuaHelper.FloatAction(function(arg_167_0)
					arg_163_1.dialogCg_.alpha = arg_167_0
				end))
				var_166_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_163_1.dialog_)
					var_166_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_163_1.duration_ = arg_163_1.duration_ + 0.3

				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_43 = arg_163_1:GetWordFromCfg(1101101042)
				local var_166_44 = arg_163_1:FormatText(var_166_43.content)

				arg_163_1.text_.text = var_166_44

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_45 = 35
				local var_166_46 = utf8.len(var_166_44)
				local var_166_47 = var_166_45 <= 0 and var_166_41 or var_166_41 * (var_166_46 / var_166_45)

				if var_166_47 > 0 and var_166_41 < var_166_47 then
					arg_163_1.talkMaxDuration = var_166_47
					var_166_40 = var_166_40 + 0.3

					if var_166_47 + var_166_40 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_47 + var_166_40
					end
				end

				arg_163_1.text_.text = var_166_44
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_48 = var_166_40 + 0.3
			local var_166_49 = math.max(var_166_41, arg_163_1.talkMaxDuration)

			if var_166_48 <= arg_163_1.time_ and arg_163_1.time_ < var_166_48 + var_166_49 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_48) / var_166_49

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_48 + var_166_49 and arg_163_1.time_ < var_166_48 + var_166_49 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101043 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 1101101043
		arg_169_1.duration_ = 5

		SetActive(arg_169_1.tipsGo_, false)

		function arg_169_1.onSingleLineFinish_()
			arg_169_1.onSingleLineUpdate_ = nil
			arg_169_1.onSingleLineFinish_ = nil
			arg_169_1.state_ = "waiting"
		end

		function arg_169_1.playNext_(arg_171_0)
			if arg_171_0 == 1 then
				arg_169_0:Play1101101044(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = 0
			local var_172_1 = 0.825

			if var_172_0 < arg_169_1.time_ and arg_169_1.time_ <= var_172_0 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_2 = arg_169_1:FormatText(StoryNameCfg[7].name)

				arg_169_1.leftNameTxt_.text = var_172_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_3 = arg_169_1:GetWordFromCfg(1101101043)
				local var_172_4 = arg_169_1:FormatText(var_172_3.content)

				arg_169_1.text_.text = var_172_4

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_5 = 33
				local var_172_6 = utf8.len(var_172_4)
				local var_172_7 = var_172_5 <= 0 and var_172_1 or var_172_1 * (var_172_6 / var_172_5)

				if var_172_7 > 0 and var_172_1 < var_172_7 then
					arg_169_1.talkMaxDuration = var_172_7

					if var_172_7 + var_172_0 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_7 + var_172_0
					end
				end

				arg_169_1.text_.text = var_172_4
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)
				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_8 = math.max(var_172_1, arg_169_1.talkMaxDuration)

			if var_172_0 <= arg_169_1.time_ and arg_169_1.time_ < var_172_0 + var_172_8 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_0) / var_172_8

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_0 + var_172_8 and arg_169_1.time_ < var_172_0 + var_172_8 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101044 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 1101101044
		arg_173_1.duration_ = 9.966

		local var_173_0 = {
			zh = 6.3,
			ja = 9.966
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
				arg_173_0:Play1101101045(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1011ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1011ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(0, -0.71, -6)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1011ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = arg_173_1.actors_["1011ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1011ui_story == nil then
				arg_173_1.var_.characterEffect1011ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.200000002980232

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1011ui_story then
					arg_173_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1011ui_story then
				arg_173_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_176_13 = 0

			if var_176_13 < arg_173_1.time_ and arg_173_1.time_ <= var_176_13 + arg_176_0 then
				arg_173_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_176_15 = 0
			local var_176_16 = 0.200000002980232

			if var_176_15 < arg_173_1.time_ and arg_173_1.time_ <= var_176_15 + arg_176_0 then
				local var_176_17 = "play"
				local var_176_18 = "music"

				arg_173_1:AudioAction(var_176_17, var_176_18, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_176_19 = 0.266666666666667
			local var_176_20 = 1

			if var_176_19 < arg_173_1.time_ and arg_173_1.time_ <= var_176_19 + arg_176_0 then
				local var_176_21 = "play"
				local var_176_22 = "music"

				arg_173_1:AudioAction(var_176_21, var_176_22, "bgm_activity_1_5_battle_2", "bgm_activity_1_5_battle_2", "bgm_activity_1_5_battle_2.awb")
			end

			local var_176_23 = 0
			local var_176_24 = 0.775

			if var_176_23 < arg_173_1.time_ and arg_173_1.time_ <= var_176_23 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_25 = arg_173_1:FormatText(StoryNameCfg[37].name)

				arg_173_1.leftNameTxt_.text = var_176_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_26 = arg_173_1:GetWordFromCfg(1101101044)
				local var_176_27 = arg_173_1:FormatText(var_176_26.content)

				arg_173_1.text_.text = var_176_27

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_28 = 31
				local var_176_29 = utf8.len(var_176_27)
				local var_176_30 = var_176_28 <= 0 and var_176_24 or var_176_24 * (var_176_29 / var_176_28)

				if var_176_30 > 0 and var_176_24 < var_176_30 then
					arg_173_1.talkMaxDuration = var_176_30

					if var_176_30 + var_176_23 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_30 + var_176_23
					end
				end

				arg_173_1.text_.text = var_176_27
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101044", "story_v_side_new_1101101.awb") ~= 0 then
					local var_176_31 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101044", "story_v_side_new_1101101.awb") / 1000

					if var_176_31 + var_176_23 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_31 + var_176_23
					end

					if var_176_26.prefab_name ~= "" and arg_173_1.actors_[var_176_26.prefab_name] ~= nil then
						local var_176_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_26.prefab_name].transform, "story_v_side_new_1101101", "1101101044", "story_v_side_new_1101101.awb")

						arg_173_1:RecordAudio("1101101044", var_176_32)
						arg_173_1:RecordAudio("1101101044", var_176_32)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101044", "story_v_side_new_1101101.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101044", "story_v_side_new_1101101.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_33 = math.max(var_176_24, arg_173_1.talkMaxDuration)

			if var_176_23 <= arg_173_1.time_ and arg_173_1.time_ < var_176_23 + var_176_33 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_23) / var_176_33

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_23 + var_176_33 and arg_173_1.time_ < var_176_23 + var_176_33 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101045 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 1101101045
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play1101101046(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1011ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect1011ui_story == nil then
				arg_177_1.var_.characterEffect1011ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.200000002980232

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect1011ui_story then
					local var_180_4 = Mathf.Lerp(0, 0.5, var_180_3)

					arg_177_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1011ui_story.fillRatio = var_180_4
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect1011ui_story then
				local var_180_5 = 0.5

				arg_177_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1011ui_story.fillRatio = var_180_5
			end

			local var_180_6 = 0
			local var_180_7 = 0.575

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_8 = arg_177_1:GetWordFromCfg(1101101045)
				local var_180_9 = arg_177_1:FormatText(var_180_8.content)

				arg_177_1.text_.text = var_180_9

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_10 = 23
				local var_180_11 = utf8.len(var_180_9)
				local var_180_12 = var_180_10 <= 0 and var_180_7 or var_180_7 * (var_180_11 / var_180_10)

				if var_180_12 > 0 and var_180_7 < var_180_12 then
					arg_177_1.talkMaxDuration = var_180_12

					if var_180_12 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_12 + var_180_6
					end
				end

				arg_177_1.text_.text = var_180_9
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_13 = math.max(var_180_7, arg_177_1.talkMaxDuration)

			if var_180_6 <= arg_177_1.time_ and arg_177_1.time_ < var_180_6 + var_180_13 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_6) / var_180_13

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_6 + var_180_13 and arg_177_1.time_ < var_180_6 + var_180_13 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101046 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 1101101046
		arg_181_1.duration_ = 5

		SetActive(arg_181_1.tipsGo_, false)

		function arg_181_1.onSingleLineFinish_()
			arg_181_1.onSingleLineUpdate_ = nil
			arg_181_1.onSingleLineFinish_ = nil
			arg_181_1.state_ = "waiting"
		end

		function arg_181_1.playNext_(arg_183_0)
			if arg_183_0 == 1 then
				arg_181_0:Play1101101047(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = 0
			local var_184_1 = 0.9

			if var_184_0 < arg_181_1.time_ and arg_181_1.time_ <= var_184_0 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_2 = arg_181_1:FormatText(StoryNameCfg[7].name)

				arg_181_1.leftNameTxt_.text = var_184_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_3 = arg_181_1:GetWordFromCfg(1101101046)
				local var_184_4 = arg_181_1:FormatText(var_184_3.content)

				arg_181_1.text_.text = var_184_4

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_5 = 36
				local var_184_6 = utf8.len(var_184_4)
				local var_184_7 = var_184_5 <= 0 and var_184_1 or var_184_1 * (var_184_6 / var_184_5)

				if var_184_7 > 0 and var_184_1 < var_184_7 then
					arg_181_1.talkMaxDuration = var_184_7

					if var_184_7 + var_184_0 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_7 + var_184_0
					end
				end

				arg_181_1.text_.text = var_184_4
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)
				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_8 = math.max(var_184_1, arg_181_1.talkMaxDuration)

			if var_184_0 <= arg_181_1.time_ and arg_181_1.time_ < var_184_0 + var_184_8 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_0) / var_184_8

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_0 + var_184_8 and arg_181_1.time_ < var_184_0 + var_184_8 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101047 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 1101101047
		arg_185_1.duration_ = 7.666

		local var_185_0 = {
			zh = 7.666,
			ja = 3.6
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
				arg_185_0:Play1101101048(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["1011ui_story"].transform
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1.var_.moveOldPos1011ui_story = var_188_0.localPosition
			end

			local var_188_2 = 0.001

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2
				local var_188_4 = Vector3.New(0, -0.71, -6)

				var_188_0.localPosition = Vector3.Lerp(arg_185_1.var_.moveOldPos1011ui_story, var_188_4, var_188_3)

				local var_188_5 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_5.x, var_188_5.y, var_188_5.z)

				local var_188_6 = var_188_0.localEulerAngles

				var_188_6.z = 0
				var_188_6.x = 0
				var_188_0.localEulerAngles = var_188_6
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 then
				var_188_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_188_7 = manager.ui.mainCamera.transform.position - var_188_0.position

				var_188_0.forward = Vector3.New(var_188_7.x, var_188_7.y, var_188_7.z)

				local var_188_8 = var_188_0.localEulerAngles

				var_188_8.z = 0
				var_188_8.x = 0
				var_188_0.localEulerAngles = var_188_8
			end

			local var_188_9 = arg_185_1.actors_["1011ui_story"]
			local var_188_10 = 0

			if var_188_10 < arg_185_1.time_ and arg_185_1.time_ <= var_188_10 + arg_188_0 and arg_185_1.var_.characterEffect1011ui_story == nil then
				arg_185_1.var_.characterEffect1011ui_story = var_188_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_188_11 = 0.200000002980232

			if var_188_10 <= arg_185_1.time_ and arg_185_1.time_ < var_188_10 + var_188_11 then
				local var_188_12 = (arg_185_1.time_ - var_188_10) / var_188_11

				if arg_185_1.var_.characterEffect1011ui_story then
					arg_185_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_185_1.time_ >= var_188_10 + var_188_11 and arg_185_1.time_ < var_188_10 + var_188_11 + arg_188_0 and arg_185_1.var_.characterEffect1011ui_story then
				arg_185_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_188_13 = 0

			if var_188_13 < arg_185_1.time_ and arg_185_1.time_ <= var_188_13 + arg_188_0 then
				arg_185_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action2_1")
			end

			local var_188_14 = 0

			if var_188_14 < arg_185_1.time_ and arg_185_1.time_ <= var_188_14 + arg_188_0 then
				arg_185_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_188_15 = 0
			local var_188_16 = 0.925

			if var_188_15 < arg_185_1.time_ and arg_185_1.time_ <= var_188_15 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_17 = arg_185_1:FormatText(StoryNameCfg[37].name)

				arg_185_1.leftNameTxt_.text = var_188_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_18 = arg_185_1:GetWordFromCfg(1101101047)
				local var_188_19 = arg_185_1:FormatText(var_188_18.content)

				arg_185_1.text_.text = var_188_19

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_20 = 37
				local var_188_21 = utf8.len(var_188_19)
				local var_188_22 = var_188_20 <= 0 and var_188_16 or var_188_16 * (var_188_21 / var_188_20)

				if var_188_22 > 0 and var_188_16 < var_188_22 then
					arg_185_1.talkMaxDuration = var_188_22

					if var_188_22 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_22 + var_188_15
					end
				end

				arg_185_1.text_.text = var_188_19
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101047", "story_v_side_new_1101101.awb") ~= 0 then
					local var_188_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101047", "story_v_side_new_1101101.awb") / 1000

					if var_188_23 + var_188_15 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_23 + var_188_15
					end

					if var_188_18.prefab_name ~= "" and arg_185_1.actors_[var_188_18.prefab_name] ~= nil then
						local var_188_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_18.prefab_name].transform, "story_v_side_new_1101101", "1101101047", "story_v_side_new_1101101.awb")

						arg_185_1:RecordAudio("1101101047", var_188_24)
						arg_185_1:RecordAudio("1101101047", var_188_24)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101047", "story_v_side_new_1101101.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101047", "story_v_side_new_1101101.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_25 = math.max(var_188_16, arg_185_1.talkMaxDuration)

			if var_188_15 <= arg_185_1.time_ and arg_185_1.time_ < var_188_15 + var_188_25 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_15) / var_188_25

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_15 + var_188_25 and arg_185_1.time_ < var_188_15 + var_188_25 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101048 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 1101101048
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play1101101049(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["1011ui_story"].transform
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 then
				arg_189_1.var_.moveOldPos1011ui_story = var_192_0.localPosition
			end

			local var_192_2 = 0.001

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2
				local var_192_4 = Vector3.New(0, 100, 0)

				var_192_0.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos1011ui_story, var_192_4, var_192_3)

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

			local var_192_9 = 0
			local var_192_10 = 0.7

			if var_192_9 < arg_189_1.time_ and arg_189_1.time_ <= var_192_9 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, false)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_11 = arg_189_1:GetWordFromCfg(1101101048)
				local var_192_12 = arg_189_1:FormatText(var_192_11.content)

				arg_189_1.text_.text = var_192_12

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_13 = 28
				local var_192_14 = utf8.len(var_192_12)
				local var_192_15 = var_192_13 <= 0 and var_192_10 or var_192_10 * (var_192_14 / var_192_13)

				if var_192_15 > 0 and var_192_10 < var_192_15 then
					arg_189_1.talkMaxDuration = var_192_15

					if var_192_15 + var_192_9 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_15 + var_192_9
					end
				end

				arg_189_1.text_.text = var_192_12
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_16 = math.max(var_192_10, arg_189_1.talkMaxDuration)

			if var_192_9 <= arg_189_1.time_ and arg_189_1.time_ < var_192_9 + var_192_16 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_9) / var_192_16

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_9 + var_192_16 and arg_189_1.time_ < var_192_9 + var_192_16 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101049 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 1101101049
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play1101101050(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 1

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				local var_196_2 = "play"
				local var_196_3 = "effect"

				arg_193_1:AudioAction(var_196_2, var_196_3, "se_story_222_00", "se_story_222_00_gun", "se_story_222_00.awb")
			end

			local var_196_4 = 0

			if var_196_4 < arg_193_1.time_ and arg_193_1.time_ <= var_196_4 + arg_196_0 then
				arg_193_1.mask_.enabled = true
				arg_193_1.mask_.raycastTarget = false

				arg_193_1:SetGaussion(false)
			end

			local var_196_5 = 0.166666666666667

			if var_196_4 <= arg_193_1.time_ and arg_193_1.time_ < var_196_4 + var_196_5 then
				local var_196_6 = (arg_193_1.time_ - var_196_4) / var_196_5
				local var_196_7 = Color.New(1, 1, 1)

				var_196_7.a = Mathf.Lerp(1, 0, var_196_6)
				arg_193_1.mask_.color = var_196_7
			end

			if arg_193_1.time_ >= var_196_4 + var_196_5 and arg_193_1.time_ < var_196_4 + var_196_5 + arg_196_0 then
				local var_196_8 = Color.New(1, 1, 1)
				local var_196_9 = 0

				arg_193_1.mask_.enabled = false
				var_196_8.a = var_196_9
				arg_193_1.mask_.color = var_196_8
			end

			local var_196_10 = 0.208333333333333

			if var_196_10 < arg_193_1.time_ and arg_193_1.time_ <= var_196_10 + arg_196_0 then
				arg_193_1.mask_.enabled = true
				arg_193_1.mask_.raycastTarget = false

				arg_193_1:SetGaussion(false)
			end

			local var_196_11 = 0.158333333333333

			if var_196_10 <= arg_193_1.time_ and arg_193_1.time_ < var_196_10 + var_196_11 then
				local var_196_12 = (arg_193_1.time_ - var_196_10) / var_196_11
				local var_196_13 = Color.New(1, 1, 1)

				var_196_13.a = Mathf.Lerp(1, 0, var_196_12)
				arg_193_1.mask_.color = var_196_13
			end

			if arg_193_1.time_ >= var_196_10 + var_196_11 and arg_193_1.time_ < var_196_10 + var_196_11 + arg_196_0 then
				local var_196_14 = Color.New(1, 1, 1)
				local var_196_15 = 0

				arg_193_1.mask_.enabled = false
				var_196_14.a = var_196_15
				arg_193_1.mask_.color = var_196_14
			end

			local var_196_16 = 0.416666666666667

			if var_196_16 < arg_193_1.time_ and arg_193_1.time_ <= var_196_16 + arg_196_0 then
				arg_193_1.mask_.enabled = true
				arg_193_1.mask_.raycastTarget = false

				arg_193_1:SetGaussion(false)
			end

			local var_196_17 = 0.158333333333333

			if var_196_16 <= arg_193_1.time_ and arg_193_1.time_ < var_196_16 + var_196_17 then
				local var_196_18 = (arg_193_1.time_ - var_196_16) / var_196_17
				local var_196_19 = Color.New(1, 1, 1)

				var_196_19.a = Mathf.Lerp(1, 0, var_196_18)
				arg_193_1.mask_.color = var_196_19
			end

			if arg_193_1.time_ >= var_196_16 + var_196_17 and arg_193_1.time_ < var_196_16 + var_196_17 + arg_196_0 then
				local var_196_20 = Color.New(1, 1, 1)
				local var_196_21 = 0

				arg_193_1.mask_.enabled = false
				var_196_20.a = var_196_21
				arg_193_1.mask_.color = var_196_20
			end

			local var_196_22 = 0.641666666666667

			if var_196_22 < arg_193_1.time_ and arg_193_1.time_ <= var_196_22 + arg_196_0 then
				arg_193_1.mask_.enabled = true
				arg_193_1.mask_.raycastTarget = false

				arg_193_1:SetGaussion(false)
			end

			local var_196_23 = 0.158333333333333

			if var_196_22 <= arg_193_1.time_ and arg_193_1.time_ < var_196_22 + var_196_23 then
				local var_196_24 = (arg_193_1.time_ - var_196_22) / var_196_23
				local var_196_25 = Color.New(1, 1, 1)

				var_196_25.a = Mathf.Lerp(1, 0, var_196_24)
				arg_193_1.mask_.color = var_196_25
			end

			if arg_193_1.time_ >= var_196_22 + var_196_23 and arg_193_1.time_ < var_196_22 + var_196_23 + arg_196_0 then
				local var_196_26 = Color.New(1, 1, 1)
				local var_196_27 = 0

				arg_193_1.mask_.enabled = false
				var_196_26.a = var_196_27
				arg_193_1.mask_.color = var_196_26
			end

			local var_196_28 = 0.841666666666667

			if var_196_28 < arg_193_1.time_ and arg_193_1.time_ <= var_196_28 + arg_196_0 then
				arg_193_1.mask_.enabled = true
				arg_193_1.mask_.raycastTarget = false

				arg_193_1:SetGaussion(false)
			end

			local var_196_29 = 0.158333333333333

			if var_196_28 <= arg_193_1.time_ and arg_193_1.time_ < var_196_28 + var_196_29 then
				local var_196_30 = (arg_193_1.time_ - var_196_28) / var_196_29
				local var_196_31 = Color.New(1, 1, 1)

				var_196_31.a = Mathf.Lerp(1, 0, var_196_30)
				arg_193_1.mask_.color = var_196_31
			end

			if arg_193_1.time_ >= var_196_28 + var_196_29 and arg_193_1.time_ < var_196_28 + var_196_29 + arg_196_0 then
				local var_196_32 = Color.New(1, 1, 1)
				local var_196_33 = 0

				arg_193_1.mask_.enabled = false
				var_196_32.a = var_196_33
				arg_193_1.mask_.color = var_196_32
			end

			local var_196_34 = 0
			local var_196_35 = 0.575

			if var_196_34 < arg_193_1.time_ and arg_193_1.time_ <= var_196_34 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0

				arg_193_1.dialog_:SetActive(true)

				local var_196_36 = LeanTween.value(arg_193_1.dialog_, 0, 1, 0.3)

				var_196_36:setOnUpdate(LuaHelper.FloatAction(function(arg_197_0)
					arg_193_1.dialogCg_.alpha = arg_197_0
				end))
				var_196_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_193_1.dialog_)
					var_196_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_193_1.duration_ = arg_193_1.duration_ + 0.3

				SetActive(arg_193_1.leftNameGo_, false)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_37 = arg_193_1:GetWordFromCfg(1101101049)
				local var_196_38 = arg_193_1:FormatText(var_196_37.content)

				arg_193_1.text_.text = var_196_38

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_39 = 23
				local var_196_40 = utf8.len(var_196_38)
				local var_196_41 = var_196_39 <= 0 and var_196_35 or var_196_35 * (var_196_40 / var_196_39)

				if var_196_41 > 0 and var_196_35 < var_196_41 then
					arg_193_1.talkMaxDuration = var_196_41
					var_196_34 = var_196_34 + 0.3

					if var_196_41 + var_196_34 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_41 + var_196_34
					end
				end

				arg_193_1.text_.text = var_196_38
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)
				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_42 = var_196_34 + 0.3
			local var_196_43 = math.max(var_196_35, arg_193_1.talkMaxDuration)

			if var_196_42 <= arg_193_1.time_ and arg_193_1.time_ < var_196_42 + var_196_43 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_42) / var_196_43

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_42 + var_196_43 and arg_193_1.time_ < var_196_42 + var_196_43 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101050 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 1101101050
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play1101101051(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = "2017_tpose"

			if arg_199_1.actors_[var_202_0] == nil then
				local var_202_1 = Object.Instantiate(Asset.Load("Char/" .. var_202_0), arg_199_1.stage_.transform)

				var_202_1.name = var_202_0
				var_202_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_199_1.actors_[var_202_0] = var_202_1

				local var_202_2 = var_202_1:GetComponentInChildren(typeof(CharacterEffect))

				var_202_2.enabled = true

				local var_202_3 = GameObjectTools.GetOrAddComponent(var_202_1, typeof(DynamicBoneHelper))

				if var_202_3 then
					var_202_3:EnableDynamicBone(false)
				end

				arg_199_1:ShowWeapon(var_202_2.transform, false)

				arg_199_1.var_[var_202_0 .. "Animator"] = var_202_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_199_1.var_[var_202_0 .. "Animator"].applyRootMotion = true
				arg_199_1.var_[var_202_0 .. "LipSync"] = var_202_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_202_4 = arg_199_1.actors_["2017_tpose"]
			local var_202_5 = 0

			if var_202_5 < arg_199_1.time_ and arg_199_1.time_ <= var_202_5 + arg_202_0 and arg_199_1.var_.characterEffect2017_tpose == nil then
				arg_199_1.var_.characterEffect2017_tpose = var_202_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_6 = 0.2

			if var_202_5 <= arg_199_1.time_ and arg_199_1.time_ < var_202_5 + var_202_6 then
				local var_202_7 = (arg_199_1.time_ - var_202_5) / var_202_6

				if arg_199_1.var_.characterEffect2017_tpose then
					local var_202_8 = Mathf.Lerp(0, 0.5, var_202_7)

					arg_199_1.var_.characterEffect2017_tpose.fillFlat = true
					arg_199_1.var_.characterEffect2017_tpose.fillRatio = var_202_8
				end
			end

			if arg_199_1.time_ >= var_202_5 + var_202_6 and arg_199_1.time_ < var_202_5 + var_202_6 + arg_202_0 and arg_199_1.var_.characterEffect2017_tpose then
				local var_202_9 = 0.5

				arg_199_1.var_.characterEffect2017_tpose.fillFlat = true
				arg_199_1.var_.characterEffect2017_tpose.fillRatio = var_202_9
			end

			local var_202_10 = 0
			local var_202_11 = 0.425

			if var_202_10 < arg_199_1.time_ and arg_199_1.time_ <= var_202_10 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_12 = arg_199_1:FormatText(StoryNameCfg[7].name)

				arg_199_1.leftNameTxt_.text = var_202_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_13 = arg_199_1:GetWordFromCfg(1101101050)
				local var_202_14 = arg_199_1:FormatText(var_202_13.content)

				arg_199_1.text_.text = var_202_14

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_15 = 17
				local var_202_16 = utf8.len(var_202_14)
				local var_202_17 = var_202_15 <= 0 and var_202_11 or var_202_11 * (var_202_16 / var_202_15)

				if var_202_17 > 0 and var_202_11 < var_202_17 then
					arg_199_1.talkMaxDuration = var_202_17

					if var_202_17 + var_202_10 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_17 + var_202_10
					end
				end

				arg_199_1.text_.text = var_202_14
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_18 = math.max(var_202_11, arg_199_1.talkMaxDuration)

			if var_202_10 <= arg_199_1.time_ and arg_199_1.time_ < var_202_10 + var_202_18 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_10) / var_202_18

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_10 + var_202_18 and arg_199_1.time_ < var_202_10 + var_202_18 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101051 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 1101101051
		arg_203_1.duration_ = 1.999999999999

		SetActive(arg_203_1.tipsGo_, false)

		function arg_203_1.onSingleLineFinish_()
			arg_203_1.onSingleLineUpdate_ = nil
			arg_203_1.onSingleLineFinish_ = nil
			arg_203_1.state_ = "waiting"
		end

		function arg_203_1.playNext_(arg_205_0)
			if arg_205_0 == 1 then
				arg_203_0:Play1101101052(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1011ui_story"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos1011ui_story = var_206_0.localPosition
			end

			local var_206_2 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2
				local var_206_4 = Vector3.New(0, -0.71, -6)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos1011ui_story, var_206_4, var_206_3)

				local var_206_5 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_5.x, var_206_5.y, var_206_5.z)

				local var_206_6 = var_206_0.localEulerAngles

				var_206_6.z = 0
				var_206_6.x = 0
				var_206_0.localEulerAngles = var_206_6
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_206_7 = manager.ui.mainCamera.transform.position - var_206_0.position

				var_206_0.forward = Vector3.New(var_206_7.x, var_206_7.y, var_206_7.z)

				local var_206_8 = var_206_0.localEulerAngles

				var_206_8.z = 0
				var_206_8.x = 0
				var_206_0.localEulerAngles = var_206_8
			end

			local var_206_9 = arg_203_1.actors_["1011ui_story"]
			local var_206_10 = 0

			if var_206_10 < arg_203_1.time_ and arg_203_1.time_ <= var_206_10 + arg_206_0 and arg_203_1.var_.characterEffect1011ui_story == nil then
				arg_203_1.var_.characterEffect1011ui_story = var_206_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_11 = 0.200000002980232

			if var_206_10 <= arg_203_1.time_ and arg_203_1.time_ < var_206_10 + var_206_11 then
				local var_206_12 = (arg_203_1.time_ - var_206_10) / var_206_11

				if arg_203_1.var_.characterEffect1011ui_story then
					arg_203_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_10 + var_206_11 and arg_203_1.time_ < var_206_10 + var_206_11 + arg_206_0 and arg_203_1.var_.characterEffect1011ui_story then
				arg_203_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_206_13 = 0

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action426")
			end

			local var_206_14 = 0

			if var_206_14 < arg_203_1.time_ and arg_203_1.time_ <= var_206_14 + arg_206_0 then
				arg_203_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_206_15 = arg_203_1.actors_["2017_tpose"].transform
			local var_206_16 = 0

			if var_206_16 < arg_203_1.time_ and arg_203_1.time_ <= var_206_16 + arg_206_0 then
				arg_203_1.var_.moveOldPos2017_tpose = var_206_15.localPosition
			end

			local var_206_17 = 0.001

			if var_206_16 <= arg_203_1.time_ and arg_203_1.time_ < var_206_16 + var_206_17 then
				local var_206_18 = (arg_203_1.time_ - var_206_16) / var_206_17
				local var_206_19 = Vector3.New(0, 100, 0)

				var_206_15.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos2017_tpose, var_206_19, var_206_18)

				local var_206_20 = manager.ui.mainCamera.transform.position - var_206_15.position

				var_206_15.forward = Vector3.New(var_206_20.x, var_206_20.y, var_206_20.z)

				local var_206_21 = var_206_15.localEulerAngles

				var_206_21.z = 0
				var_206_21.x = 0
				var_206_15.localEulerAngles = var_206_21
			end

			if arg_203_1.time_ >= var_206_16 + var_206_17 and arg_203_1.time_ < var_206_16 + var_206_17 + arg_206_0 then
				var_206_15.localPosition = Vector3.New(0, 100, 0)

				local var_206_22 = manager.ui.mainCamera.transform.position - var_206_15.position

				var_206_15.forward = Vector3.New(var_206_22.x, var_206_22.y, var_206_22.z)

				local var_206_23 = var_206_15.localEulerAngles

				var_206_23.z = 0
				var_206_23.x = 0
				var_206_15.localEulerAngles = var_206_23
			end

			local var_206_24 = 0
			local var_206_25 = 0.075

			if var_206_24 < arg_203_1.time_ and arg_203_1.time_ <= var_206_24 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_26 = arg_203_1:FormatText(StoryNameCfg[37].name)

				arg_203_1.leftNameTxt_.text = var_206_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_27 = arg_203_1:GetWordFromCfg(1101101051)
				local var_206_28 = arg_203_1:FormatText(var_206_27.content)

				arg_203_1.text_.text = var_206_28

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_29 = 3
				local var_206_30 = utf8.len(var_206_28)
				local var_206_31 = var_206_29 <= 0 and var_206_25 or var_206_25 * (var_206_30 / var_206_29)

				if var_206_31 > 0 and var_206_25 < var_206_31 then
					arg_203_1.talkMaxDuration = var_206_31

					if var_206_31 + var_206_24 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_31 + var_206_24
					end
				end

				arg_203_1.text_.text = var_206_28
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101051", "story_v_side_new_1101101.awb") ~= 0 then
					local var_206_32 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101051", "story_v_side_new_1101101.awb") / 1000

					if var_206_32 + var_206_24 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_32 + var_206_24
					end

					if var_206_27.prefab_name ~= "" and arg_203_1.actors_[var_206_27.prefab_name] ~= nil then
						local var_206_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_27.prefab_name].transform, "story_v_side_new_1101101", "1101101051", "story_v_side_new_1101101.awb")

						arg_203_1:RecordAudio("1101101051", var_206_33)
						arg_203_1:RecordAudio("1101101051", var_206_33)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101051", "story_v_side_new_1101101.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101051", "story_v_side_new_1101101.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_34 = math.max(var_206_25, arg_203_1.talkMaxDuration)

			if var_206_24 <= arg_203_1.time_ and arg_203_1.time_ < var_206_24 + var_206_34 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_24) / var_206_34

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_24 + var_206_34 and arg_203_1.time_ < var_206_24 + var_206_34 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101052 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 1101101052
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play1101101053(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1011ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1011ui_story == nil then
				arg_207_1.var_.characterEffect1011ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.200000002980232

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1011ui_story then
					local var_210_4 = Mathf.Lerp(0, 0.5, var_210_3)

					arg_207_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1011ui_story.fillRatio = var_210_4
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1011ui_story then
				local var_210_5 = 0.5

				arg_207_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1011ui_story.fillRatio = var_210_5
			end

			local var_210_6 = 0
			local var_210_7 = 1

			if var_210_6 < arg_207_1.time_ and arg_207_1.time_ <= var_210_6 + arg_210_0 then
				local var_210_8 = "play"
				local var_210_9 = "effect"

				arg_207_1:AudioAction(var_210_8, var_210_9, "se_story_10", "se_story_10_sword02", "se_story_10_sword02.awb")
			end

			local var_210_10 = arg_207_1.actors_["1011ui_story"].transform
			local var_210_11 = 0

			if var_210_11 < arg_207_1.time_ and arg_207_1.time_ <= var_210_11 + arg_210_0 then
				arg_207_1.var_.moveOldPos1011ui_story = var_210_10.localPosition
			end

			local var_210_12 = 0.001

			if var_210_11 <= arg_207_1.time_ and arg_207_1.time_ < var_210_11 + var_210_12 then
				local var_210_13 = (arg_207_1.time_ - var_210_11) / var_210_12
				local var_210_14 = Vector3.New(0, 100, 0)

				var_210_10.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1011ui_story, var_210_14, var_210_13)

				local var_210_15 = manager.ui.mainCamera.transform.position - var_210_10.position

				var_210_10.forward = Vector3.New(var_210_15.x, var_210_15.y, var_210_15.z)

				local var_210_16 = var_210_10.localEulerAngles

				var_210_16.z = 0
				var_210_16.x = 0
				var_210_10.localEulerAngles = var_210_16
			end

			if arg_207_1.time_ >= var_210_11 + var_210_12 and arg_207_1.time_ < var_210_11 + var_210_12 + arg_210_0 then
				var_210_10.localPosition = Vector3.New(0, 100, 0)

				local var_210_17 = manager.ui.mainCamera.transform.position - var_210_10.position

				var_210_10.forward = Vector3.New(var_210_17.x, var_210_17.y, var_210_17.z)

				local var_210_18 = var_210_10.localEulerAngles

				var_210_18.z = 0
				var_210_18.x = 0
				var_210_10.localEulerAngles = var_210_18
			end

			local var_210_19 = 0

			if var_210_19 < arg_207_1.time_ and arg_207_1.time_ <= var_210_19 + arg_210_0 then
				arg_207_1.mask_.enabled = true
				arg_207_1.mask_.raycastTarget = false

				arg_207_1:SetGaussion(false)
			end

			local var_210_20 = 1

			if var_210_19 <= arg_207_1.time_ and arg_207_1.time_ < var_210_19 + var_210_20 then
				local var_210_21 = (arg_207_1.time_ - var_210_19) / var_210_20
				local var_210_22 = Color.New(1, 1, 1)

				var_210_22.a = Mathf.Lerp(1, 0, var_210_21)
				arg_207_1.mask_.color = var_210_22
			end

			if arg_207_1.time_ >= var_210_19 + var_210_20 and arg_207_1.time_ < var_210_19 + var_210_20 + arg_210_0 then
				local var_210_23 = Color.New(1, 1, 1)
				local var_210_24 = 0

				arg_207_1.mask_.enabled = false
				var_210_23.a = var_210_24
				arg_207_1.mask_.color = var_210_23
			end

			local var_210_25 = 0
			local var_210_26 = 0.9

			if var_210_25 < arg_207_1.time_ and arg_207_1.time_ <= var_210_25 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0

				arg_207_1.dialog_:SetActive(true)

				local var_210_27 = LeanTween.value(arg_207_1.dialog_, 0, 1, 0.3)

				var_210_27:setOnUpdate(LuaHelper.FloatAction(function(arg_211_0)
					arg_207_1.dialogCg_.alpha = arg_211_0
				end))
				var_210_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_207_1.dialog_)
					var_210_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_207_1.duration_ = arg_207_1.duration_ + 0.3

				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_28 = arg_207_1:GetWordFromCfg(1101101052)
				local var_210_29 = arg_207_1:FormatText(var_210_28.content)

				arg_207_1.text_.text = var_210_29

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_30 = 34
				local var_210_31 = utf8.len(var_210_29)
				local var_210_32 = var_210_30 <= 0 and var_210_26 or var_210_26 * (var_210_31 / var_210_30)

				if var_210_32 > 0 and var_210_26 < var_210_32 then
					arg_207_1.talkMaxDuration = var_210_32
					var_210_25 = var_210_25 + 0.3

					if var_210_32 + var_210_25 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_32 + var_210_25
					end
				end

				arg_207_1.text_.text = var_210_29
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_33 = var_210_25 + 0.3
			local var_210_34 = math.max(var_210_26, arg_207_1.talkMaxDuration)

			if var_210_33 <= arg_207_1.time_ and arg_207_1.time_ < var_210_33 + var_210_34 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_33) / var_210_34

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_33 + var_210_34 and arg_207_1.time_ < var_210_33 + var_210_34 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 1101101053
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play1101101054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 0.225

			if var_216_0 < arg_213_1.time_ and arg_213_1.time_ <= var_216_0 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_2 = arg_213_1:FormatText(StoryNameCfg[7].name)

				arg_213_1.leftNameTxt_.text = var_216_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_3 = arg_213_1:GetWordFromCfg(1101101053)
				local var_216_4 = arg_213_1:FormatText(var_216_3.content)

				arg_213_1.text_.text = var_216_4

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_5 = 9
				local var_216_6 = utf8.len(var_216_4)
				local var_216_7 = var_216_5 <= 0 and var_216_1 or var_216_1 * (var_216_6 / var_216_5)

				if var_216_7 > 0 and var_216_1 < var_216_7 then
					arg_213_1.talkMaxDuration = var_216_7

					if var_216_7 + var_216_0 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_7 + var_216_0
					end
				end

				arg_213_1.text_.text = var_216_4
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_8 = math.max(var_216_1, arg_213_1.talkMaxDuration)

			if var_216_0 <= arg_213_1.time_ and arg_213_1.time_ < var_216_0 + var_216_8 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_0) / var_216_8

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_0 + var_216_8 and arg_213_1.time_ < var_216_0 + var_216_8 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 1101101054
		arg_217_1.duration_ = 9

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play1101101055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 2

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				local var_220_1 = manager.ui.mainCamera.transform.localPosition
				local var_220_2 = Vector3.New(0, 0, 10) + Vector3.New(var_220_1.x, var_220_1.y, 0)
				local var_220_3 = arg_217_1.bgs_.D07

				var_220_3.transform.localPosition = var_220_2
				var_220_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_220_4 = var_220_3:GetComponent("SpriteRenderer")

				if var_220_4 and var_220_4.sprite then
					local var_220_5 = (var_220_3.transform.localPosition - var_220_1).z
					local var_220_6 = manager.ui.mainCameraCom_
					local var_220_7 = 2 * var_220_5 * Mathf.Tan(var_220_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_220_8 = var_220_7 * var_220_6.aspect
					local var_220_9 = var_220_4.sprite.bounds.size.x
					local var_220_10 = var_220_4.sprite.bounds.size.y
					local var_220_11 = var_220_8 / var_220_9
					local var_220_12 = var_220_7 / var_220_10
					local var_220_13 = var_220_12 < var_220_11 and var_220_11 or var_220_12

					var_220_3.transform.localScale = Vector3.New(var_220_13, var_220_13, 0)
				end

				for iter_220_0, iter_220_1 in pairs(arg_217_1.bgs_) do
					if iter_220_0 ~= "D07" then
						iter_220_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_220_14 = 0

			if var_220_14 < arg_217_1.time_ and arg_217_1.time_ <= var_220_14 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_15 = 2

			if var_220_14 <= arg_217_1.time_ and arg_217_1.time_ < var_220_14 + var_220_15 then
				local var_220_16 = (arg_217_1.time_ - var_220_14) / var_220_15
				local var_220_17 = Color.New(0, 0, 0)

				var_220_17.a = Mathf.Lerp(0, 1, var_220_16)
				arg_217_1.mask_.color = var_220_17
			end

			if arg_217_1.time_ >= var_220_14 + var_220_15 and arg_217_1.time_ < var_220_14 + var_220_15 + arg_220_0 then
				local var_220_18 = Color.New(0, 0, 0)

				var_220_18.a = 1
				arg_217_1.mask_.color = var_220_18
			end

			local var_220_19 = 2

			if var_220_19 < arg_217_1.time_ and arg_217_1.time_ <= var_220_19 + arg_220_0 then
				arg_217_1.mask_.enabled = true
				arg_217_1.mask_.raycastTarget = true

				arg_217_1:SetGaussion(false)
			end

			local var_220_20 = 2

			if var_220_19 <= arg_217_1.time_ and arg_217_1.time_ < var_220_19 + var_220_20 then
				local var_220_21 = (arg_217_1.time_ - var_220_19) / var_220_20
				local var_220_22 = Color.New(0, 0, 0)

				var_220_22.a = Mathf.Lerp(1, 0, var_220_21)
				arg_217_1.mask_.color = var_220_22
			end

			if arg_217_1.time_ >= var_220_19 + var_220_20 and arg_217_1.time_ < var_220_19 + var_220_20 + arg_220_0 then
				local var_220_23 = Color.New(0, 0, 0)
				local var_220_24 = 0

				arg_217_1.mask_.enabled = false
				var_220_23.a = var_220_24
				arg_217_1.mask_.color = var_220_23
			end

			if arg_217_1.frameCnt_ <= 1 then
				arg_217_1.dialog_:SetActive(false)
			end

			local var_220_25 = 4
			local var_220_26 = 0.525

			if var_220_25 < arg_217_1.time_ and arg_217_1.time_ <= var_220_25 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0

				arg_217_1.dialog_:SetActive(true)

				local var_220_27 = LeanTween.value(arg_217_1.dialog_, 0, 1, 0.3)

				var_220_27:setOnUpdate(LuaHelper.FloatAction(function(arg_221_0)
					arg_217_1.dialogCg_.alpha = arg_221_0
				end))
				var_220_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_217_1.dialog_)
					var_220_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_217_1.duration_ = arg_217_1.duration_ + 0.3

				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_28 = arg_217_1:GetWordFromCfg(1101101054)
				local var_220_29 = arg_217_1:FormatText(var_220_28.content)

				arg_217_1.text_.text = var_220_29

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_30 = 21
				local var_220_31 = utf8.len(var_220_29)
				local var_220_32 = var_220_30 <= 0 and var_220_26 or var_220_26 * (var_220_31 / var_220_30)

				if var_220_32 > 0 and var_220_26 < var_220_32 then
					arg_217_1.talkMaxDuration = var_220_32
					var_220_25 = var_220_25 + 0.3

					if var_220_32 + var_220_25 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_32 + var_220_25
					end
				end

				arg_217_1.text_.text = var_220_29
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_33 = var_220_25 + 0.3
			local var_220_34 = math.max(var_220_26, arg_217_1.talkMaxDuration)

			if var_220_33 <= arg_217_1.time_ and arg_217_1.time_ < var_220_33 + var_220_34 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_33) / var_220_34

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_33 + var_220_34 and arg_217_1.time_ < var_220_33 + var_220_34 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 1101101055
		arg_223_1.duration_ = 5

		SetActive(arg_223_1.tipsGo_, false)

		function arg_223_1.onSingleLineFinish_()
			arg_223_1.onSingleLineUpdate_ = nil
			arg_223_1.onSingleLineFinish_ = nil
			arg_223_1.state_ = "waiting"
		end

		function arg_223_1.playNext_(arg_225_0)
			if arg_225_0 == 1 then
				arg_223_0:Play1101101056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 0.925

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, false)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_2 = arg_223_1:GetWordFromCfg(1101101055)
				local var_226_3 = arg_223_1:FormatText(var_226_2.content)

				arg_223_1.text_.text = var_226_3

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_4 = 37
				local var_226_5 = utf8.len(var_226_3)
				local var_226_6 = var_226_4 <= 0 and var_226_1 or var_226_1 * (var_226_5 / var_226_4)

				if var_226_6 > 0 and var_226_1 < var_226_6 then
					arg_223_1.talkMaxDuration = var_226_6

					if var_226_6 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_6 + var_226_0
					end
				end

				arg_223_1.text_.text = var_226_3
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)
				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_7 = math.max(var_226_1, arg_223_1.talkMaxDuration)

			if var_226_0 <= arg_223_1.time_ and arg_223_1.time_ < var_226_0 + var_226_7 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_0) / var_226_7

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_0 + var_226_7 and arg_223_1.time_ < var_226_0 + var_226_7 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 1101101056
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play1101101057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["2017_tpose"].transform
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 then
				arg_227_1.var_.moveOldPos2017_tpose = var_230_0.localPosition
			end

			local var_230_2 = 0.001

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2
				local var_230_4 = Vector3.New(0, 100, 0)

				var_230_0.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos2017_tpose, var_230_4, var_230_3)

				local var_230_5 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_5.x, var_230_5.y, var_230_5.z)

				local var_230_6 = var_230_0.localEulerAngles

				var_230_6.z = 0
				var_230_6.x = 0
				var_230_0.localEulerAngles = var_230_6
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 then
				var_230_0.localPosition = Vector3.New(0, 100, 0)

				local var_230_7 = manager.ui.mainCamera.transform.position - var_230_0.position

				var_230_0.forward = Vector3.New(var_230_7.x, var_230_7.y, var_230_7.z)

				local var_230_8 = var_230_0.localEulerAngles

				var_230_8.z = 0
				var_230_8.x = 0
				var_230_0.localEulerAngles = var_230_8
			end

			local var_230_9 = "2037_tpose"

			if arg_227_1.actors_[var_230_9] == nil then
				local var_230_10 = Object.Instantiate(Asset.Load("Char/" .. var_230_9), arg_227_1.stage_.transform)

				var_230_10.name = var_230_9
				var_230_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_227_1.actors_[var_230_9] = var_230_10

				local var_230_11 = var_230_10:GetComponentInChildren(typeof(CharacterEffect))

				var_230_11.enabled = true

				local var_230_12 = GameObjectTools.GetOrAddComponent(var_230_10, typeof(DynamicBoneHelper))

				if var_230_12 then
					var_230_12:EnableDynamicBone(false)
				end

				arg_227_1:ShowWeapon(var_230_11.transform, false)

				arg_227_1.var_[var_230_9 .. "Animator"] = var_230_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_227_1.var_[var_230_9 .. "Animator"].applyRootMotion = true
				arg_227_1.var_[var_230_9 .. "LipSync"] = var_230_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_230_13 = arg_227_1.actors_["2037_tpose"].transform
			local var_230_14 = 0

			if var_230_14 < arg_227_1.time_ and arg_227_1.time_ <= var_230_14 + arg_230_0 then
				arg_227_1.var_.moveOldPos2037_tpose = var_230_13.localPosition
			end

			local var_230_15 = 0.001

			if var_230_14 <= arg_227_1.time_ and arg_227_1.time_ < var_230_14 + var_230_15 then
				local var_230_16 = (arg_227_1.time_ - var_230_14) / var_230_15
				local var_230_17 = Vector3.New(0, 100, 0)

				var_230_13.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos2037_tpose, var_230_17, var_230_16)

				local var_230_18 = manager.ui.mainCamera.transform.position - var_230_13.position

				var_230_13.forward = Vector3.New(var_230_18.x, var_230_18.y, var_230_18.z)

				local var_230_19 = var_230_13.localEulerAngles

				var_230_19.z = 0
				var_230_19.x = 0
				var_230_13.localEulerAngles = var_230_19
			end

			if arg_227_1.time_ >= var_230_14 + var_230_15 and arg_227_1.time_ < var_230_14 + var_230_15 + arg_230_0 then
				var_230_13.localPosition = Vector3.New(0, 100, 0)

				local var_230_20 = manager.ui.mainCamera.transform.position - var_230_13.position

				var_230_13.forward = Vector3.New(var_230_20.x, var_230_20.y, var_230_20.z)

				local var_230_21 = var_230_13.localEulerAngles

				var_230_21.z = 0
				var_230_21.x = 0
				var_230_13.localEulerAngles = var_230_21
			end

			local var_230_22 = "2038_tpose"

			if arg_227_1.actors_[var_230_22] == nil then
				local var_230_23 = Object.Instantiate(Asset.Load("Char/" .. var_230_22), arg_227_1.stage_.transform)

				var_230_23.name = var_230_22
				var_230_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_227_1.actors_[var_230_22] = var_230_23

				local var_230_24 = var_230_23:GetComponentInChildren(typeof(CharacterEffect))

				var_230_24.enabled = true

				local var_230_25 = GameObjectTools.GetOrAddComponent(var_230_23, typeof(DynamicBoneHelper))

				if var_230_25 then
					var_230_25:EnableDynamicBone(false)
				end

				arg_227_1:ShowWeapon(var_230_24.transform, false)

				arg_227_1.var_[var_230_22 .. "Animator"] = var_230_24.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_227_1.var_[var_230_22 .. "Animator"].applyRootMotion = true
				arg_227_1.var_[var_230_22 .. "LipSync"] = var_230_24.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_230_26 = arg_227_1.actors_["2038_tpose"].transform
			local var_230_27 = 0

			if var_230_27 < arg_227_1.time_ and arg_227_1.time_ <= var_230_27 + arg_230_0 then
				arg_227_1.var_.moveOldPos2038_tpose = var_230_26.localPosition
			end

			local var_230_28 = 0.001

			if var_230_27 <= arg_227_1.time_ and arg_227_1.time_ < var_230_27 + var_230_28 then
				local var_230_29 = (arg_227_1.time_ - var_230_27) / var_230_28
				local var_230_30 = Vector3.New(0, 100, 0)

				var_230_26.localPosition = Vector3.Lerp(arg_227_1.var_.moveOldPos2038_tpose, var_230_30, var_230_29)

				local var_230_31 = manager.ui.mainCamera.transform.position - var_230_26.position

				var_230_26.forward = Vector3.New(var_230_31.x, var_230_31.y, var_230_31.z)

				local var_230_32 = var_230_26.localEulerAngles

				var_230_32.z = 0
				var_230_32.x = 0
				var_230_26.localEulerAngles = var_230_32
			end

			if arg_227_1.time_ >= var_230_27 + var_230_28 and arg_227_1.time_ < var_230_27 + var_230_28 + arg_230_0 then
				var_230_26.localPosition = Vector3.New(0, 100, 0)

				local var_230_33 = manager.ui.mainCamera.transform.position - var_230_26.position

				var_230_26.forward = Vector3.New(var_230_33.x, var_230_33.y, var_230_33.z)

				local var_230_34 = var_230_26.localEulerAngles

				var_230_34.z = 0
				var_230_34.x = 0
				var_230_26.localEulerAngles = var_230_34
			end

			local var_230_35 = 0

			if var_230_35 < arg_227_1.time_ and arg_227_1.time_ <= var_230_35 + arg_230_0 then
				arg_227_1.mask_.enabled = true
				arg_227_1.mask_.raycastTarget = true

				arg_227_1:SetGaussion(false)
			end

			local var_230_36 = 1

			if var_230_35 <= arg_227_1.time_ and arg_227_1.time_ < var_230_35 + var_230_36 then
				local var_230_37 = (arg_227_1.time_ - var_230_35) / var_230_36
				local var_230_38 = Color.New(1, 1, 1)

				var_230_38.a = Mathf.Lerp(1, 0, var_230_37)
				arg_227_1.mask_.color = var_230_38
			end

			if arg_227_1.time_ >= var_230_35 + var_230_36 and arg_227_1.time_ < var_230_35 + var_230_36 + arg_230_0 then
				local var_230_39 = Color.New(1, 1, 1)
				local var_230_40 = 0

				arg_227_1.mask_.enabled = false
				var_230_39.a = var_230_40
				arg_227_1.mask_.color = var_230_39
			end

			local var_230_41 = 0
			local var_230_42 = 0.3

			if var_230_41 < arg_227_1.time_ and arg_227_1.time_ <= var_230_41 + arg_230_0 then
				local var_230_43 = "play"
				local var_230_44 = "effect"

				arg_227_1:AudioAction(var_230_43, var_230_44, "se_story_122_02", "se_story_122_02_hit", "")
			end

			local var_230_45 = 0
			local var_230_46 = 0.725

			if var_230_45 < arg_227_1.time_ and arg_227_1.time_ <= var_230_45 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, false)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_47 = arg_227_1:GetWordFromCfg(1101101056)
				local var_230_48 = arg_227_1:FormatText(var_230_47.content)

				arg_227_1.text_.text = var_230_48

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_49 = 29
				local var_230_50 = utf8.len(var_230_48)
				local var_230_51 = var_230_49 <= 0 and var_230_46 or var_230_46 * (var_230_50 / var_230_49)

				if var_230_51 > 0 and var_230_46 < var_230_51 then
					arg_227_1.talkMaxDuration = var_230_51

					if var_230_51 + var_230_45 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_51 + var_230_45
					end
				end

				arg_227_1.text_.text = var_230_48
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)
				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_52 = math.max(var_230_46, arg_227_1.talkMaxDuration)

			if var_230_45 <= arg_227_1.time_ and arg_227_1.time_ < var_230_45 + var_230_52 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_45) / var_230_52

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_45 + var_230_52 and arg_227_1.time_ < var_230_45 + var_230_52 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 1101101057
		arg_231_1.duration_ = 4.533

		local var_231_0 = {
			zh = 4.533,
			ja = 4.2
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
				arg_231_0:Play1101101058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1011ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1011ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0, -0.71, -6)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1011ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = arg_231_1.actors_["1011ui_story"]
			local var_234_10 = 0

			if var_234_10 < arg_231_1.time_ and arg_231_1.time_ <= var_234_10 + arg_234_0 and arg_231_1.var_.characterEffect1011ui_story == nil then
				arg_231_1.var_.characterEffect1011ui_story = var_234_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_11 = 0.200000002980232

			if var_234_10 <= arg_231_1.time_ and arg_231_1.time_ < var_234_10 + var_234_11 then
				local var_234_12 = (arg_231_1.time_ - var_234_10) / var_234_11

				if arg_231_1.var_.characterEffect1011ui_story then
					arg_231_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_231_1.time_ >= var_234_10 + var_234_11 and arg_231_1.time_ < var_234_10 + var_234_11 + arg_234_0 and arg_231_1.var_.characterEffect1011ui_story then
				arg_231_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_234_13 = 0

			if var_234_13 < arg_231_1.time_ and arg_231_1.time_ <= var_234_13 + arg_234_0 then
				arg_231_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_234_14 = 0

			if var_234_14 < arg_231_1.time_ and arg_231_1.time_ <= var_234_14 + arg_234_0 then
				arg_231_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_234_15 = 0
			local var_234_16 = 0.625

			if var_234_15 < arg_231_1.time_ and arg_231_1.time_ <= var_234_15 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_17 = arg_231_1:FormatText(StoryNameCfg[37].name)

				arg_231_1.leftNameTxt_.text = var_234_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_18 = arg_231_1:GetWordFromCfg(1101101057)
				local var_234_19 = arg_231_1:FormatText(var_234_18.content)

				arg_231_1.text_.text = var_234_19

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_20 = 25
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101057", "story_v_side_new_1101101.awb") ~= 0 then
					local var_234_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101057", "story_v_side_new_1101101.awb") / 1000

					if var_234_23 + var_234_15 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_23 + var_234_15
					end

					if var_234_18.prefab_name ~= "" and arg_231_1.actors_[var_234_18.prefab_name] ~= nil then
						local var_234_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_18.prefab_name].transform, "story_v_side_new_1101101", "1101101057", "story_v_side_new_1101101.awb")

						arg_231_1:RecordAudio("1101101057", var_234_24)
						arg_231_1:RecordAudio("1101101057", var_234_24)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101057", "story_v_side_new_1101101.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101057", "story_v_side_new_1101101.awb")
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
	Play1101101058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 1101101058
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play1101101059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1011ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1011ui_story = var_238_0.localPosition
			end

			local var_238_2 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_2 then
				local var_238_3 = (arg_235_1.time_ - var_238_1) / var_238_2
				local var_238_4 = Vector3.New(0, 100, 0)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1011ui_story, var_238_4, var_238_3)

				local var_238_5 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_5.x, var_238_5.y, var_238_5.z)

				local var_238_6 = var_238_0.localEulerAngles

				var_238_6.z = 0
				var_238_6.x = 0
				var_238_0.localEulerAngles = var_238_6
			end

			if arg_235_1.time_ >= var_238_1 + var_238_2 and arg_235_1.time_ < var_238_1 + var_238_2 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(0, 100, 0)

				local var_238_7 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_7.x, var_238_7.y, var_238_7.z)

				local var_238_8 = var_238_0.localEulerAngles

				var_238_8.z = 0
				var_238_8.x = 0
				var_238_0.localEulerAngles = var_238_8
			end

			local var_238_9 = arg_235_1.bgs_.D07.transform
			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 then
				arg_235_1.var_.moveOldPosD07 = var_238_9.localPosition
			end

			local var_238_11 = 0.001

			if var_238_10 <= arg_235_1.time_ and arg_235_1.time_ < var_238_10 + var_238_11 then
				local var_238_12 = (arg_235_1.time_ - var_238_10) / var_238_11
				local var_238_13 = Vector3.New(0, 1, 10)

				var_238_9.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPosD07, var_238_13, var_238_12)
			end

			if arg_235_1.time_ >= var_238_10 + var_238_11 and arg_235_1.time_ < var_238_10 + var_238_11 + arg_238_0 then
				var_238_9.localPosition = Vector3.New(0, 1, 10)
			end

			local var_238_14 = arg_235_1.bgs_.D07.transform
			local var_238_15 = 0.034

			if var_238_15 < arg_235_1.time_ and arg_235_1.time_ <= var_238_15 + arg_238_0 then
				arg_235_1.var_.moveOldPosD07 = var_238_14.localPosition
			end

			local var_238_16 = 2

			if var_238_15 <= arg_235_1.time_ and arg_235_1.time_ < var_238_15 + var_238_16 then
				local var_238_17 = (arg_235_1.time_ - var_238_15) / var_238_16
				local var_238_18 = Vector3.New(0, 1, 7)

				var_238_14.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPosD07, var_238_18, var_238_17)
			end

			if arg_235_1.time_ >= var_238_15 + var_238_16 and arg_235_1.time_ < var_238_15 + var_238_16 + arg_238_0 then
				var_238_14.localPosition = Vector3.New(0, 1, 7)
			end

			local var_238_19 = 0
			local var_238_20 = 0.8

			if var_238_19 < arg_235_1.time_ and arg_235_1.time_ <= var_238_19 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_21 = arg_235_1:GetWordFromCfg(1101101058)
				local var_238_22 = arg_235_1:FormatText(var_238_21.content)

				arg_235_1.text_.text = var_238_22

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_23 = 32
				local var_238_24 = utf8.len(var_238_22)
				local var_238_25 = var_238_23 <= 0 and var_238_20 or var_238_20 * (var_238_24 / var_238_23)

				if var_238_25 > 0 and var_238_20 < var_238_25 then
					arg_235_1.talkMaxDuration = var_238_25

					if var_238_25 + var_238_19 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_25 + var_238_19
					end
				end

				arg_235_1.text_.text = var_238_22
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_26 = math.max(var_238_20, arg_235_1.talkMaxDuration)

			if var_238_19 <= arg_235_1.time_ and arg_235_1.time_ < var_238_19 + var_238_26 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_19) / var_238_26

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_19 + var_238_26 and arg_235_1.time_ < var_238_19 + var_238_26 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 1101101059
		arg_239_1.duration_ = 5

		SetActive(arg_239_1.tipsGo_, false)

		function arg_239_1.onSingleLineFinish_()
			arg_239_1.onSingleLineUpdate_ = nil
			arg_239_1.onSingleLineFinish_ = nil
			arg_239_1.state_ = "waiting"
		end

		function arg_239_1.playNext_(arg_241_0)
			if arg_241_0 == 1 then
				arg_239_0:Play1101101060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = 0
			local var_242_1 = 0.25

			if var_242_0 < arg_239_1.time_ and arg_239_1.time_ <= var_242_0 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_2 = arg_239_1:FormatText(StoryNameCfg[7].name)

				arg_239_1.leftNameTxt_.text = var_242_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_3 = arg_239_1:GetWordFromCfg(1101101059)
				local var_242_4 = arg_239_1:FormatText(var_242_3.content)

				arg_239_1.text_.text = var_242_4

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_5 = 10
				local var_242_6 = utf8.len(var_242_4)
				local var_242_7 = var_242_5 <= 0 and var_242_1 or var_242_1 * (var_242_6 / var_242_5)

				if var_242_7 > 0 and var_242_1 < var_242_7 then
					arg_239_1.talkMaxDuration = var_242_7

					if var_242_7 + var_242_0 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_7 + var_242_0
					end
				end

				arg_239_1.text_.text = var_242_4
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)
				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_8 = math.max(var_242_1, arg_239_1.talkMaxDuration)

			if var_242_0 <= arg_239_1.time_ and arg_239_1.time_ < var_242_0 + var_242_8 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_0) / var_242_8

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_0 + var_242_8 and arg_239_1.time_ < var_242_0 + var_242_8 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 1101101060
		arg_243_1.duration_ = 2.066

		local var_243_0 = {
			zh = 2.066,
			ja = 1.999999999999
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
				arg_243_0:Play1101101061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1011ui_story"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1011ui_story = var_246_0.localPosition
			end

			local var_246_2 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2
				local var_246_4 = Vector3.New(0, -0.71, -6)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1011ui_story, var_246_4, var_246_3)

				local var_246_5 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_5.x, var_246_5.y, var_246_5.z)

				local var_246_6 = var_246_0.localEulerAngles

				var_246_6.z = 0
				var_246_6.x = 0
				var_246_0.localEulerAngles = var_246_6
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_246_7 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_7.x, var_246_7.y, var_246_7.z)

				local var_246_8 = var_246_0.localEulerAngles

				var_246_8.z = 0
				var_246_8.x = 0
				var_246_0.localEulerAngles = var_246_8
			end

			local var_246_9 = arg_243_1.actors_["1011ui_story"]
			local var_246_10 = 0

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 and arg_243_1.var_.characterEffect1011ui_story == nil then
				arg_243_1.var_.characterEffect1011ui_story = var_246_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_246_11 = 0.200000002980232

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_11 then
				local var_246_12 = (arg_243_1.time_ - var_246_10) / var_246_11

				if arg_243_1.var_.characterEffect1011ui_story then
					arg_243_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_243_1.time_ >= var_246_10 + var_246_11 and arg_243_1.time_ < var_246_10 + var_246_11 + arg_246_0 and arg_243_1.var_.characterEffect1011ui_story then
				arg_243_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_246_13 = 0

			if var_246_13 < arg_243_1.time_ and arg_243_1.time_ <= var_246_13 + arg_246_0 then
				arg_243_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_246_14 = 0

			if var_246_14 < arg_243_1.time_ and arg_243_1.time_ <= var_246_14 + arg_246_0 then
				arg_243_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_246_15 = 0
			local var_246_16 = 0.25

			if var_246_15 < arg_243_1.time_ and arg_243_1.time_ <= var_246_15 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_17 = arg_243_1:FormatText(StoryNameCfg[37].name)

				arg_243_1.leftNameTxt_.text = var_246_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_18 = arg_243_1:GetWordFromCfg(1101101060)
				local var_246_19 = arg_243_1:FormatText(var_246_18.content)

				arg_243_1.text_.text = var_246_19

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_20 = 10
				local var_246_21 = utf8.len(var_246_19)
				local var_246_22 = var_246_20 <= 0 and var_246_16 or var_246_16 * (var_246_21 / var_246_20)

				if var_246_22 > 0 and var_246_16 < var_246_22 then
					arg_243_1.talkMaxDuration = var_246_22

					if var_246_22 + var_246_15 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_22 + var_246_15
					end
				end

				arg_243_1.text_.text = var_246_19
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101060", "story_v_side_new_1101101.awb") ~= 0 then
					local var_246_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101060", "story_v_side_new_1101101.awb") / 1000

					if var_246_23 + var_246_15 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_23 + var_246_15
					end

					if var_246_18.prefab_name ~= "" and arg_243_1.actors_[var_246_18.prefab_name] ~= nil then
						local var_246_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_18.prefab_name].transform, "story_v_side_new_1101101", "1101101060", "story_v_side_new_1101101.awb")

						arg_243_1:RecordAudio("1101101060", var_246_24)
						arg_243_1:RecordAudio("1101101060", var_246_24)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101060", "story_v_side_new_1101101.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101060", "story_v_side_new_1101101.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_25 = math.max(var_246_16, arg_243_1.talkMaxDuration)

			if var_246_15 <= arg_243_1.time_ and arg_243_1.time_ < var_246_15 + var_246_25 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_15) / var_246_25

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_15 + var_246_25 and arg_243_1.time_ < var_246_15 + var_246_25 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 1101101061
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play1101101062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1011ui_story"].transform
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 then
				arg_247_1.var_.moveOldPos1011ui_story = var_250_0.localPosition
			end

			local var_250_2 = 0.001

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2
				local var_250_4 = Vector3.New(0, 100, 0)

				var_250_0.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPos1011ui_story, var_250_4, var_250_3)

				local var_250_5 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_5.x, var_250_5.y, var_250_5.z)

				local var_250_6 = var_250_0.localEulerAngles

				var_250_6.z = 0
				var_250_6.x = 0
				var_250_0.localEulerAngles = var_250_6
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 then
				var_250_0.localPosition = Vector3.New(0, 100, 0)

				local var_250_7 = manager.ui.mainCamera.transform.position - var_250_0.position

				var_250_0.forward = Vector3.New(var_250_7.x, var_250_7.y, var_250_7.z)

				local var_250_8 = var_250_0.localEulerAngles

				var_250_8.z = 0
				var_250_8.x = 0
				var_250_0.localEulerAngles = var_250_8
			end

			local var_250_9 = 0
			local var_250_10 = 0.975

			if var_250_9 < arg_247_1.time_ and arg_247_1.time_ <= var_250_9 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, false)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_11 = arg_247_1:GetWordFromCfg(1101101061)
				local var_250_12 = arg_247_1:FormatText(var_250_11.content)

				arg_247_1.text_.text = var_250_12

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_13 = 39
				local var_250_14 = utf8.len(var_250_12)
				local var_250_15 = var_250_13 <= 0 and var_250_10 or var_250_10 * (var_250_14 / var_250_13)

				if var_250_15 > 0 and var_250_10 < var_250_15 then
					arg_247_1.talkMaxDuration = var_250_15

					if var_250_15 + var_250_9 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_15 + var_250_9
					end
				end

				arg_247_1.text_.text = var_250_12
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_16 = math.max(var_250_10, arg_247_1.talkMaxDuration)

			if var_250_9 <= arg_247_1.time_ and arg_247_1.time_ < var_250_9 + var_250_16 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_9) / var_250_16

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_9 + var_250_16 and arg_247_1.time_ < var_250_9 + var_250_16 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 1101101062
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play1101101063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.975

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[7].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(1101101062)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 39
				local var_254_6 = utf8.len(var_254_4)
				local var_254_7 = var_254_5 <= 0 and var_254_1 or var_254_1 * (var_254_6 / var_254_5)

				if var_254_7 > 0 and var_254_1 < var_254_7 then
					arg_251_1.talkMaxDuration = var_254_7

					if var_254_7 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_7 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_4
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_8 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_8 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_8

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_8 and arg_251_1.time_ < var_254_0 + var_254_8 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 1101101063
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play1101101064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.625

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, false)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_2 = arg_255_1:GetWordFromCfg(1101101063)
				local var_258_3 = arg_255_1:FormatText(var_258_2.content)

				arg_255_1.text_.text = var_258_3

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_4 = 25
				local var_258_5 = utf8.len(var_258_3)
				local var_258_6 = var_258_4 <= 0 and var_258_1 or var_258_1 * (var_258_5 / var_258_4)

				if var_258_6 > 0 and var_258_1 < var_258_6 then
					arg_255_1.talkMaxDuration = var_258_6

					if var_258_6 + var_258_0 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_6 + var_258_0
					end
				end

				arg_255_1.text_.text = var_258_3
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_7 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_7 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_7

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_7 and arg_255_1.time_ < var_258_0 + var_258_7 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 1101101064
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play1101101065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 1.05

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[7].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(1101101064)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 42
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
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_8 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_8 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_8

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_8 and arg_259_1.time_ < var_262_0 + var_262_8 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 1101101065
		arg_263_1.duration_ = 2.633

		local var_263_0 = {
			zh = 2.633,
			ja = 2.333
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
				arg_263_0:Play1101101066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1011ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1011ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(0, -0.71, -6)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1011ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["1011ui_story"]
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 and arg_263_1.var_.characterEffect1011ui_story == nil then
				arg_263_1.var_.characterEffect1011ui_story = var_266_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_11 = 0.200000002980232

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_10) / var_266_11

				if arg_263_1.var_.characterEffect1011ui_story then
					arg_263_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_10 + var_266_11 and arg_263_1.time_ < var_266_10 + var_266_11 + arg_266_0 and arg_263_1.var_.characterEffect1011ui_story then
				arg_263_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_266_13 = 0

			if var_266_13 < arg_263_1.time_ and arg_263_1.time_ <= var_266_13 + arg_266_0 then
				arg_263_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action3_1")
			end

			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_266_15 = 0
			local var_266_16 = 0.175

			if var_266_15 < arg_263_1.time_ and arg_263_1.time_ <= var_266_15 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_17 = arg_263_1:FormatText(StoryNameCfg[37].name)

				arg_263_1.leftNameTxt_.text = var_266_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_18 = arg_263_1:GetWordFromCfg(1101101065)
				local var_266_19 = arg_263_1:FormatText(var_266_18.content)

				arg_263_1.text_.text = var_266_19

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_20 = 7
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101065", "story_v_side_new_1101101.awb") ~= 0 then
					local var_266_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101065", "story_v_side_new_1101101.awb") / 1000

					if var_266_23 + var_266_15 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_23 + var_266_15
					end

					if var_266_18.prefab_name ~= "" and arg_263_1.actors_[var_266_18.prefab_name] ~= nil then
						local var_266_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_18.prefab_name].transform, "story_v_side_new_1101101", "1101101065", "story_v_side_new_1101101.awb")

						arg_263_1:RecordAudio("1101101065", var_266_24)
						arg_263_1:RecordAudio("1101101065", var_266_24)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101065", "story_v_side_new_1101101.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101065", "story_v_side_new_1101101.awb")
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
	Play1101101066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 1101101066
		arg_267_1.duration_ = 5

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play1101101067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1011ui_story"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos1011ui_story = var_270_0.localPosition
			end

			local var_270_2 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2
				local var_270_4 = Vector3.New(0, 100, 0)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos1011ui_story, var_270_4, var_270_3)

				local var_270_5 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_5.x, var_270_5.y, var_270_5.z)

				local var_270_6 = var_270_0.localEulerAngles

				var_270_6.z = 0
				var_270_6.x = 0
				var_270_0.localEulerAngles = var_270_6
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(0, 100, 0)

				local var_270_7 = manager.ui.mainCamera.transform.position - var_270_0.position

				var_270_0.forward = Vector3.New(var_270_7.x, var_270_7.y, var_270_7.z)

				local var_270_8 = var_270_0.localEulerAngles

				var_270_8.z = 0
				var_270_8.x = 0
				var_270_0.localEulerAngles = var_270_8
			end

			local var_270_9 = 0
			local var_270_10 = 0.925

			if var_270_9 < arg_267_1.time_ and arg_267_1.time_ <= var_270_9 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, false)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_11 = arg_267_1:GetWordFromCfg(1101101066)
				local var_270_12 = arg_267_1:FormatText(var_270_11.content)

				arg_267_1.text_.text = var_270_12

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_13 = 39
				local var_270_14 = utf8.len(var_270_12)
				local var_270_15 = var_270_13 <= 0 and var_270_10 or var_270_10 * (var_270_14 / var_270_13)

				if var_270_15 > 0 and var_270_10 < var_270_15 then
					arg_267_1.talkMaxDuration = var_270_15

					if var_270_15 + var_270_9 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_15 + var_270_9
					end
				end

				arg_267_1.text_.text = var_270_12
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)
				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_16 = math.max(var_270_10, arg_267_1.talkMaxDuration)

			if var_270_9 <= arg_267_1.time_ and arg_267_1.time_ < var_270_9 + var_270_16 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_9) / var_270_16

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_9 + var_270_16 and arg_267_1.time_ < var_270_9 + var_270_16 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 1101101067
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play1101101068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = 0
			local var_274_1 = 1

			if var_274_0 < arg_271_1.time_ and arg_271_1.time_ <= var_274_0 + arg_274_0 then
				local var_274_2 = "play"
				local var_274_3 = "effect"

				arg_271_1:AudioAction(var_274_2, var_274_3, "se_story_10", "se_story_10_sword04", "se_story_10.awb")
			end

			local var_274_4 = 0

			if var_274_4 < arg_271_1.time_ and arg_271_1.time_ <= var_274_4 + arg_274_0 then
				arg_271_1.mask_.enabled = true
				arg_271_1.mask_.raycastTarget = true

				arg_271_1:SetGaussion(false)
			end

			local var_274_5 = 1

			if var_274_4 <= arg_271_1.time_ and arg_271_1.time_ < var_274_4 + var_274_5 then
				local var_274_6 = (arg_271_1.time_ - var_274_4) / var_274_5
				local var_274_7 = Color.New(1, 1, 1)

				var_274_7.a = Mathf.Lerp(1, 0, var_274_6)
				arg_271_1.mask_.color = var_274_7
			end

			if arg_271_1.time_ >= var_274_4 + var_274_5 and arg_271_1.time_ < var_274_4 + var_274_5 + arg_274_0 then
				local var_274_8 = Color.New(1, 1, 1)
				local var_274_9 = 0

				arg_271_1.mask_.enabled = false
				var_274_8.a = var_274_9
				arg_271_1.mask_.color = var_274_8
			end

			local var_274_10 = 0
			local var_274_11 = 0.05

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0

				arg_271_1.dialog_:SetActive(true)

				local var_274_12 = LeanTween.value(arg_271_1.dialog_, 0, 1, 0.3)

				var_274_12:setOnUpdate(LuaHelper.FloatAction(function(arg_275_0)
					arg_271_1.dialogCg_.alpha = arg_275_0
				end))
				var_274_12:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_271_1.dialog_)
					var_274_12:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_271_1.duration_ = arg_271_1.duration_ + 0.3

				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_13 = arg_271_1:GetWordFromCfg(1101101067)
				local var_274_14 = arg_271_1:FormatText(var_274_13.content)

				arg_271_1.text_.text = var_274_14

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_15 = 2
				local var_274_16 = utf8.len(var_274_14)
				local var_274_17 = var_274_15 <= 0 and var_274_11 or var_274_11 * (var_274_16 / var_274_15)

				if var_274_17 > 0 and var_274_11 < var_274_17 then
					arg_271_1.talkMaxDuration = var_274_17
					var_274_10 = var_274_10 + 0.3

					if var_274_17 + var_274_10 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_17 + var_274_10
					end
				end

				arg_271_1.text_.text = var_274_14
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_18 = var_274_10 + 0.3
			local var_274_19 = math.max(var_274_11, arg_271_1.talkMaxDuration)

			if var_274_18 <= arg_271_1.time_ and arg_271_1.time_ < var_274_18 + var_274_19 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_18) / var_274_19

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_18 + var_274_19 and arg_271_1.time_ < var_274_18 + var_274_19 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 1101101068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play1101101069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 1.125

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, false)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_2 = arg_277_1:GetWordFromCfg(1101101068)
				local var_280_3 = arg_277_1:FormatText(var_280_2.content)

				arg_277_1.text_.text = var_280_3

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_4 = 45
				local var_280_5 = utf8.len(var_280_3)
				local var_280_6 = var_280_4 <= 0 and var_280_1 or var_280_1 * (var_280_5 / var_280_4)

				if var_280_6 > 0 and var_280_1 < var_280_6 then
					arg_277_1.talkMaxDuration = var_280_6

					if var_280_6 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_6 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_3
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_7 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_7 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_7

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_7 and arg_277_1.time_ < var_280_0 + var_280_7 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 1101101069
		arg_281_1.duration_ = 4.1

		local var_281_0 = {
			zh = 4.033,
			ja = 4.1
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
				arg_281_0:Play1101101070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.5

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[37].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, true)
				arg_281_1.iconController_:SetSelectedState("hero")

				arg_281_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(1101101069)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 20
				local var_284_6 = utf8.len(var_284_4)
				local var_284_7 = var_284_5 <= 0 and var_284_1 or var_284_1 * (var_284_6 / var_284_5)

				if var_284_7 > 0 and var_284_1 < var_284_7 then
					arg_281_1.talkMaxDuration = var_284_7

					if var_284_7 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_7 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_4
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101069", "story_v_side_new_1101101.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101069", "story_v_side_new_1101101.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_side_new_1101101", "1101101069", "story_v_side_new_1101101.awb")

						arg_281_1:RecordAudio("1101101069", var_284_9)
						arg_281_1:RecordAudio("1101101069", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101069", "story_v_side_new_1101101.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101069", "story_v_side_new_1101101.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_10 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_10 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_10

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_10 and arg_281_1.time_ < var_284_0 + var_284_10 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 1101101070
		arg_285_1.duration_ = 5

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play1101101071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1011ui_story"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and arg_285_1.var_.characterEffect1011ui_story == nil then
				arg_285_1.var_.characterEffect1011ui_story = var_288_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_288_2 = 0.200000002980232

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.characterEffect1011ui_story then
					local var_288_4 = Mathf.Lerp(0, 0.5, var_288_3)

					arg_285_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_285_1.var_.characterEffect1011ui_story.fillRatio = var_288_4
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and arg_285_1.var_.characterEffect1011ui_story then
				local var_288_5 = 0.5

				arg_285_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_285_1.var_.characterEffect1011ui_story.fillRatio = var_288_5
			end

			local var_288_6 = 0
			local var_288_7 = 0.1

			if var_288_6 < arg_285_1.time_ and arg_285_1.time_ <= var_288_6 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_8 = arg_285_1:FormatText(StoryNameCfg[7].name)

				arg_285_1.leftNameTxt_.text = var_288_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_9 = arg_285_1:GetWordFromCfg(1101101070)
				local var_288_10 = arg_285_1:FormatText(var_288_9.content)

				arg_285_1.text_.text = var_288_10

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_11 = 4
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
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_14 = math.max(var_288_7, arg_285_1.talkMaxDuration)

			if var_288_6 <= arg_285_1.time_ and arg_285_1.time_ < var_288_6 + var_288_14 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_6) / var_288_14

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_6 + var_288_14 and arg_285_1.time_ < var_288_6 + var_288_14 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 1101101071
		arg_289_1.duration_ = 11

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play1101101072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = "D05"

			if arg_289_1.bgs_[var_292_0] == nil then
				local var_292_1 = Object.Instantiate(arg_289_1.paintGo_)

				var_292_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_292_0)
				var_292_1.name = var_292_0
				var_292_1.transform.parent = arg_289_1.stage_.transform
				var_292_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_289_1.bgs_[var_292_0] = var_292_1
			end

			local var_292_2 = 3

			if var_292_2 < arg_289_1.time_ and arg_289_1.time_ <= var_292_2 + arg_292_0 then
				local var_292_3 = manager.ui.mainCamera.transform.localPosition
				local var_292_4 = Vector3.New(0, 0, 10) + Vector3.New(var_292_3.x, var_292_3.y, 0)
				local var_292_5 = arg_289_1.bgs_.D05

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
					if iter_292_0 ~= "D05" then
						iter_292_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_292_16 = 0

			if var_292_16 < arg_289_1.time_ and arg_289_1.time_ <= var_292_16 + arg_292_0 then
				arg_289_1.mask_.enabled = true
				arg_289_1.mask_.raycastTarget = true

				arg_289_1:SetGaussion(false)
			end

			local var_292_17 = 3

			if var_292_16 <= arg_289_1.time_ and arg_289_1.time_ < var_292_16 + var_292_17 then
				local var_292_18 = (arg_289_1.time_ - var_292_16) / var_292_17
				local var_292_19 = Color.New(0, 0, 0)

				var_292_19.a = Mathf.Lerp(0, 1, var_292_18)
				arg_289_1.mask_.color = var_292_19
			end

			if arg_289_1.time_ >= var_292_16 + var_292_17 and arg_289_1.time_ < var_292_16 + var_292_17 + arg_292_0 then
				local var_292_20 = Color.New(0, 0, 0)

				var_292_20.a = 1
				arg_289_1.mask_.color = var_292_20
			end

			local var_292_21 = 3

			if var_292_21 < arg_289_1.time_ and arg_289_1.time_ <= var_292_21 + arg_292_0 then
				arg_289_1.mask_.enabled = true
				arg_289_1.mask_.raycastTarget = true

				arg_289_1:SetGaussion(false)
			end

			local var_292_22 = 3

			if var_292_21 <= arg_289_1.time_ and arg_289_1.time_ < var_292_21 + var_292_22 then
				local var_292_23 = (arg_289_1.time_ - var_292_21) / var_292_22
				local var_292_24 = Color.New(0, 0, 0)

				var_292_24.a = Mathf.Lerp(1, 0, var_292_23)
				arg_289_1.mask_.color = var_292_24
			end

			if arg_289_1.time_ >= var_292_21 + var_292_22 and arg_289_1.time_ < var_292_21 + var_292_22 + arg_292_0 then
				local var_292_25 = Color.New(0, 0, 0)
				local var_292_26 = 0

				arg_289_1.mask_.enabled = false
				var_292_25.a = var_292_26
				arg_289_1.mask_.color = var_292_25
			end

			if arg_289_1.frameCnt_ <= 1 then
				arg_289_1.dialog_:SetActive(false)
			end

			local var_292_27 = 6
			local var_292_28 = 0.75

			if var_292_27 < arg_289_1.time_ and arg_289_1.time_ <= var_292_27 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0

				arg_289_1.dialog_:SetActive(true)

				local var_292_29 = LeanTween.value(arg_289_1.dialog_, 0, 1, 0.3)

				var_292_29:setOnUpdate(LuaHelper.FloatAction(function(arg_293_0)
					arg_289_1.dialogCg_.alpha = arg_293_0
				end))
				var_292_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_289_1.dialog_)
					var_292_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_289_1.duration_ = arg_289_1.duration_ + 0.3

				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_30 = arg_289_1:GetWordFromCfg(1101101071)
				local var_292_31 = arg_289_1:FormatText(var_292_30.content)

				arg_289_1.text_.text = var_292_31

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_32 = 30
				local var_292_33 = utf8.len(var_292_31)
				local var_292_34 = var_292_32 <= 0 and var_292_28 or var_292_28 * (var_292_33 / var_292_32)

				if var_292_34 > 0 and var_292_28 < var_292_34 then
					arg_289_1.talkMaxDuration = var_292_34
					var_292_27 = var_292_27 + 0.3

					if var_292_34 + var_292_27 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_34 + var_292_27
					end
				end

				arg_289_1.text_.text = var_292_31
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_35 = var_292_27 + 0.3
			local var_292_36 = math.max(var_292_28, arg_289_1.talkMaxDuration)

			if var_292_35 <= arg_289_1.time_ and arg_289_1.time_ < var_292_35 + var_292_36 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_35) / var_292_36

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_35 + var_292_36 and arg_289_1.time_ < var_292_35 + var_292_36 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 1101101072
		arg_295_1.duration_ = 6.466

		local var_295_0 = {
			zh = 5.999999999999,
			ja = 6.466
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
				arg_295_0:Play1101101073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 2

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				local var_298_1 = manager.ui.mainCamera.transform.localPosition
				local var_298_2 = Vector3.New(0, 0, 10) + Vector3.New(var_298_1.x, var_298_1.y, 0)
				local var_298_3 = arg_295_1.bgs_.A00

				var_298_3.transform.localPosition = var_298_2
				var_298_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_298_4 = var_298_3:GetComponent("SpriteRenderer")

				if var_298_4 and var_298_4.sprite then
					local var_298_5 = (var_298_3.transform.localPosition - var_298_1).z
					local var_298_6 = manager.ui.mainCameraCom_
					local var_298_7 = 2 * var_298_5 * Mathf.Tan(var_298_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_298_8 = var_298_7 * var_298_6.aspect
					local var_298_9 = var_298_4.sprite.bounds.size.x
					local var_298_10 = var_298_4.sprite.bounds.size.y
					local var_298_11 = var_298_8 / var_298_9
					local var_298_12 = var_298_7 / var_298_10
					local var_298_13 = var_298_12 < var_298_11 and var_298_11 or var_298_12

					var_298_3.transform.localScale = Vector3.New(var_298_13, var_298_13, 0)
				end

				for iter_298_0, iter_298_1 in pairs(arg_295_1.bgs_) do
					if iter_298_0 ~= "A00" then
						iter_298_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 then
				arg_295_1.mask_.enabled = true
				arg_295_1.mask_.raycastTarget = true

				arg_295_1:SetGaussion(false)
			end

			local var_298_15 = 2

			if var_298_14 <= arg_295_1.time_ and arg_295_1.time_ < var_298_14 + var_298_15 then
				local var_298_16 = (arg_295_1.time_ - var_298_14) / var_298_15
				local var_298_17 = Color.New(0, 0, 0)

				var_298_17.a = Mathf.Lerp(0, 1, var_298_16)
				arg_295_1.mask_.color = var_298_17
			end

			if arg_295_1.time_ >= var_298_14 + var_298_15 and arg_295_1.time_ < var_298_14 + var_298_15 + arg_298_0 then
				local var_298_18 = Color.New(0, 0, 0)

				var_298_18.a = 1
				arg_295_1.mask_.color = var_298_18
			end

			local var_298_19 = 2

			if var_298_19 < arg_295_1.time_ and arg_295_1.time_ <= var_298_19 + arg_298_0 then
				arg_295_1.mask_.enabled = true
				arg_295_1.mask_.raycastTarget = true

				arg_295_1:SetGaussion(false)
			end

			local var_298_20 = 2

			if var_298_19 <= arg_295_1.time_ and arg_295_1.time_ < var_298_19 + var_298_20 then
				local var_298_21 = (arg_295_1.time_ - var_298_19) / var_298_20
				local var_298_22 = Color.New(0, 0, 0)

				var_298_22.a = Mathf.Lerp(1, 0, var_298_21)
				arg_295_1.mask_.color = var_298_22
			end

			if arg_295_1.time_ >= var_298_19 + var_298_20 and arg_295_1.time_ < var_298_19 + var_298_20 + arg_298_0 then
				local var_298_23 = Color.New(0, 0, 0)
				local var_298_24 = 0

				arg_295_1.mask_.enabled = false
				var_298_23.a = var_298_24
				arg_295_1.mask_.color = var_298_23
			end

			local var_298_25 = arg_295_1.actors_["1011ui_story"].transform
			local var_298_26 = 4

			if var_298_26 < arg_295_1.time_ and arg_295_1.time_ <= var_298_26 + arg_298_0 then
				arg_295_1.var_.moveOldPos1011ui_story = var_298_25.localPosition
			end

			local var_298_27 = 0.001

			if var_298_26 <= arg_295_1.time_ and arg_295_1.time_ < var_298_26 + var_298_27 then
				local var_298_28 = (arg_295_1.time_ - var_298_26) / var_298_27
				local var_298_29 = Vector3.New(0, -0.71, -6)

				var_298_25.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1011ui_story, var_298_29, var_298_28)

				local var_298_30 = manager.ui.mainCamera.transform.position - var_298_25.position

				var_298_25.forward = Vector3.New(var_298_30.x, var_298_30.y, var_298_30.z)

				local var_298_31 = var_298_25.localEulerAngles

				var_298_31.z = 0
				var_298_31.x = 0
				var_298_25.localEulerAngles = var_298_31
			end

			if arg_295_1.time_ >= var_298_26 + var_298_27 and arg_295_1.time_ < var_298_26 + var_298_27 + arg_298_0 then
				var_298_25.localPosition = Vector3.New(0, -0.71, -6)

				local var_298_32 = manager.ui.mainCamera.transform.position - var_298_25.position

				var_298_25.forward = Vector3.New(var_298_32.x, var_298_32.y, var_298_32.z)

				local var_298_33 = var_298_25.localEulerAngles

				var_298_33.z = 0
				var_298_33.x = 0
				var_298_25.localEulerAngles = var_298_33
			end

			local var_298_34 = arg_295_1.actors_["1011ui_story"]
			local var_298_35 = 4

			if var_298_35 < arg_295_1.time_ and arg_295_1.time_ <= var_298_35 + arg_298_0 and arg_295_1.var_.characterEffect1011ui_story == nil then
				arg_295_1.var_.characterEffect1011ui_story = var_298_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_36 = 0.200000002980232

			if var_298_35 <= arg_295_1.time_ and arg_295_1.time_ < var_298_35 + var_298_36 then
				local var_298_37 = (arg_295_1.time_ - var_298_35) / var_298_36

				if arg_295_1.var_.characterEffect1011ui_story then
					arg_295_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_35 + var_298_36 and arg_295_1.time_ < var_298_35 + var_298_36 + arg_298_0 and arg_295_1.var_.characterEffect1011ui_story then
				arg_295_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_298_38 = 4

			if var_298_38 < arg_295_1.time_ and arg_295_1.time_ <= var_298_38 + arg_298_0 then
				arg_295_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_298_39 = 4

			if var_298_39 < arg_295_1.time_ and arg_295_1.time_ <= var_298_39 + arg_298_0 then
				arg_295_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_1")
			end

			local var_298_40 = 0
			local var_298_41 = 0.3

			if var_298_40 < arg_295_1.time_ and arg_295_1.time_ <= var_298_40 + arg_298_0 then
				local var_298_42 = "play"
				local var_298_43 = "music"

				arg_295_1:AudioAction(var_298_42, var_298_43, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_295_1.frameCnt_ <= 1 then
				arg_295_1.dialog_:SetActive(false)
			end

			local var_298_44 = 4
			local var_298_45 = 0.1

			if var_298_44 < arg_295_1.time_ and arg_295_1.time_ <= var_298_44 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0

				arg_295_1.dialog_:SetActive(true)

				local var_298_46 = LeanTween.value(arg_295_1.dialog_, 0, 1, 0.3)

				var_298_46:setOnUpdate(LuaHelper.FloatAction(function(arg_299_0)
					arg_295_1.dialogCg_.alpha = arg_299_0
				end))
				var_298_46:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_295_1.dialog_)
					var_298_46:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_295_1.duration_ = arg_295_1.duration_ + 0.3

				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_47 = arg_295_1:FormatText(StoryNameCfg[580].name)

				arg_295_1.leftNameTxt_.text = var_298_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_48 = arg_295_1:GetWordFromCfg(1101101072)
				local var_298_49 = arg_295_1:FormatText(var_298_48.content)

				arg_295_1.text_.text = var_298_49

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_50 = 4
				local var_298_51 = utf8.len(var_298_49)
				local var_298_52 = var_298_50 <= 0 and var_298_45 or var_298_45 * (var_298_51 / var_298_50)

				if var_298_52 > 0 and var_298_45 < var_298_52 then
					arg_295_1.talkMaxDuration = var_298_52
					var_298_44 = var_298_44 + 0.3

					if var_298_52 + var_298_44 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_52 + var_298_44
					end
				end

				arg_295_1.text_.text = var_298_49
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101072", "story_v_side_new_1101101.awb") ~= 0 then
					local var_298_53 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101072", "story_v_side_new_1101101.awb") / 1000

					if var_298_53 + var_298_44 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_53 + var_298_44
					end

					if var_298_48.prefab_name ~= "" and arg_295_1.actors_[var_298_48.prefab_name] ~= nil then
						local var_298_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_48.prefab_name].transform, "story_v_side_new_1101101", "1101101072", "story_v_side_new_1101101.awb")

						arg_295_1:RecordAudio("1101101072", var_298_54)
						arg_295_1:RecordAudio("1101101072", var_298_54)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101072", "story_v_side_new_1101101.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101072", "story_v_side_new_1101101.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_55 = var_298_44 + 0.3
			local var_298_56 = math.max(var_298_45, arg_295_1.talkMaxDuration)

			if var_298_55 <= arg_295_1.time_ and arg_295_1.time_ < var_298_55 + var_298_56 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_55) / var_298_56

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_55 + var_298_56 and arg_295_1.time_ < var_298_55 + var_298_56 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101073 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 1101101073
		arg_301_1.duration_ = 5

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play1101101074(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = arg_301_1.actors_["1011ui_story"]
			local var_304_1 = 0

			if var_304_1 < arg_301_1.time_ and arg_301_1.time_ <= var_304_1 + arg_304_0 and arg_301_1.var_.characterEffect1011ui_story == nil then
				arg_301_1.var_.characterEffect1011ui_story = var_304_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_304_2 = 0.200000002980232

			if var_304_1 <= arg_301_1.time_ and arg_301_1.time_ < var_304_1 + var_304_2 then
				local var_304_3 = (arg_301_1.time_ - var_304_1) / var_304_2

				if arg_301_1.var_.characterEffect1011ui_story then
					local var_304_4 = Mathf.Lerp(0, 0.5, var_304_3)

					arg_301_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_301_1.var_.characterEffect1011ui_story.fillRatio = var_304_4
				end
			end

			if arg_301_1.time_ >= var_304_1 + var_304_2 and arg_301_1.time_ < var_304_1 + var_304_2 + arg_304_0 and arg_301_1.var_.characterEffect1011ui_story then
				local var_304_5 = 0.5

				arg_301_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_301_1.var_.characterEffect1011ui_story.fillRatio = var_304_5
			end

			local var_304_6 = 0
			local var_304_7 = 1

			if var_304_6 < arg_301_1.time_ and arg_301_1.time_ <= var_304_6 + arg_304_0 then
				local var_304_8 = "play"
				local var_304_9 = "effect"

				arg_301_1:AudioAction(var_304_8, var_304_9, "bgm_side_daily01", "bgm_side_daily01", "bgm_side_daily01.awb")
			end

			local var_304_10 = 0
			local var_304_11 = 0.4

			if var_304_10 < arg_301_1.time_ and arg_301_1.time_ <= var_304_10 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, false)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_12 = arg_301_1:GetWordFromCfg(1101101073)
				local var_304_13 = arg_301_1:FormatText(var_304_12.content)

				arg_301_1.text_.text = var_304_13

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_14 = 16
				local var_304_15 = utf8.len(var_304_13)
				local var_304_16 = var_304_14 <= 0 and var_304_11 or var_304_11 * (var_304_15 / var_304_14)

				if var_304_16 > 0 and var_304_11 < var_304_16 then
					arg_301_1.talkMaxDuration = var_304_16

					if var_304_16 + var_304_10 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_16 + var_304_10
					end
				end

				arg_301_1.text_.text = var_304_13
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)
				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_17 = math.max(var_304_11, arg_301_1.talkMaxDuration)

			if var_304_10 <= arg_301_1.time_ and arg_301_1.time_ < var_304_10 + var_304_17 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_10) / var_304_17

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_10 + var_304_17 and arg_301_1.time_ < var_304_10 + var_304_17 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101074 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 1101101074
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play1101101075(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.675

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, false)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_2 = arg_305_1:GetWordFromCfg(1101101074)
				local var_308_3 = arg_305_1:FormatText(var_308_2.content)

				arg_305_1.text_.text = var_308_3

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_4 = 27
				local var_308_5 = utf8.len(var_308_3)
				local var_308_6 = var_308_4 <= 0 and var_308_1 or var_308_1 * (var_308_5 / var_308_4)

				if var_308_6 > 0 and var_308_1 < var_308_6 then
					arg_305_1.talkMaxDuration = var_308_6

					if var_308_6 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_6 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_3
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_7 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_7 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_7

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_7 and arg_305_1.time_ < var_308_0 + var_308_7 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101075 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 1101101075
		arg_309_1.duration_ = 5.866

		local var_309_0 = {
			zh = 5.866,
			ja = 5.033
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
				arg_309_0:Play1101101076(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1011ui_story"].transform
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				arg_309_1.var_.moveOldPos1011ui_story = var_312_0.localPosition
			end

			local var_312_2 = 0.001

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_2 then
				local var_312_3 = (arg_309_1.time_ - var_312_1) / var_312_2
				local var_312_4 = Vector3.New(0, -0.71, -6)

				var_312_0.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos1011ui_story, var_312_4, var_312_3)

				local var_312_5 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_5.x, var_312_5.y, var_312_5.z)

				local var_312_6 = var_312_0.localEulerAngles

				var_312_6.z = 0
				var_312_6.x = 0
				var_312_0.localEulerAngles = var_312_6
			end

			if arg_309_1.time_ >= var_312_1 + var_312_2 and arg_309_1.time_ < var_312_1 + var_312_2 + arg_312_0 then
				var_312_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_312_7 = manager.ui.mainCamera.transform.position - var_312_0.position

				var_312_0.forward = Vector3.New(var_312_7.x, var_312_7.y, var_312_7.z)

				local var_312_8 = var_312_0.localEulerAngles

				var_312_8.z = 0
				var_312_8.x = 0
				var_312_0.localEulerAngles = var_312_8
			end

			local var_312_9 = arg_309_1.actors_["1011ui_story"]
			local var_312_10 = 0

			if var_312_10 < arg_309_1.time_ and arg_309_1.time_ <= var_312_10 + arg_312_0 and arg_309_1.var_.characterEffect1011ui_story == nil then
				arg_309_1.var_.characterEffect1011ui_story = var_312_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_312_11 = 0.200000002980232

			if var_312_10 <= arg_309_1.time_ and arg_309_1.time_ < var_312_10 + var_312_11 then
				local var_312_12 = (arg_309_1.time_ - var_312_10) / var_312_11

				if arg_309_1.var_.characterEffect1011ui_story then
					arg_309_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_309_1.time_ >= var_312_10 + var_312_11 and arg_309_1.time_ < var_312_10 + var_312_11 + arg_312_0 and arg_309_1.var_.characterEffect1011ui_story then
				arg_309_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_312_13 = 0

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action4_2")
			end

			local var_312_14 = 0

			if var_312_14 < arg_309_1.time_ and arg_309_1.time_ <= var_312_14 + arg_312_0 then
				arg_309_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_312_15 = 0
			local var_312_16 = 0.675

			if var_312_15 < arg_309_1.time_ and arg_309_1.time_ <= var_312_15 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_17 = arg_309_1:FormatText(StoryNameCfg[37].name)

				arg_309_1.leftNameTxt_.text = var_312_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_18 = arg_309_1:GetWordFromCfg(1101101075)
				local var_312_19 = arg_309_1:FormatText(var_312_18.content)

				arg_309_1.text_.text = var_312_19

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_20 = 27
				local var_312_21 = utf8.len(var_312_19)
				local var_312_22 = var_312_20 <= 0 and var_312_16 or var_312_16 * (var_312_21 / var_312_20)

				if var_312_22 > 0 and var_312_16 < var_312_22 then
					arg_309_1.talkMaxDuration = var_312_22

					if var_312_22 + var_312_15 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_22 + var_312_15
					end
				end

				arg_309_1.text_.text = var_312_19
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101075", "story_v_side_new_1101101.awb") ~= 0 then
					local var_312_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101075", "story_v_side_new_1101101.awb") / 1000

					if var_312_23 + var_312_15 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_23 + var_312_15
					end

					if var_312_18.prefab_name ~= "" and arg_309_1.actors_[var_312_18.prefab_name] ~= nil then
						local var_312_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_18.prefab_name].transform, "story_v_side_new_1101101", "1101101075", "story_v_side_new_1101101.awb")

						arg_309_1:RecordAudio("1101101075", var_312_24)
						arg_309_1:RecordAudio("1101101075", var_312_24)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101075", "story_v_side_new_1101101.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101075", "story_v_side_new_1101101.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_25 = math.max(var_312_16, arg_309_1.talkMaxDuration)

			if var_312_15 <= arg_309_1.time_ and arg_309_1.time_ < var_312_15 + var_312_25 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_15) / var_312_25

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_15 + var_312_25 and arg_309_1.time_ < var_312_15 + var_312_25 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101076 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 1101101076
		arg_313_1.duration_ = 5

		SetActive(arg_313_1.tipsGo_, false)

		function arg_313_1.onSingleLineFinish_()
			arg_313_1.onSingleLineUpdate_ = nil
			arg_313_1.onSingleLineFinish_ = nil
			arg_313_1.state_ = "waiting"
		end

		function arg_313_1.playNext_(arg_315_0)
			if arg_315_0 == 1 then
				arg_313_0:Play1101101077(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["1011ui_story"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.characterEffect1011ui_story == nil then
				arg_313_1.var_.characterEffect1011ui_story = var_316_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_316_2 = 0.200000002980232

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.characterEffect1011ui_story then
					local var_316_4 = Mathf.Lerp(0, 0.5, var_316_3)

					arg_313_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_313_1.var_.characterEffect1011ui_story.fillRatio = var_316_4
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.characterEffect1011ui_story then
				local var_316_5 = 0.5

				arg_313_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_313_1.var_.characterEffect1011ui_story.fillRatio = var_316_5
			end

			local var_316_6 = 0
			local var_316_7 = 0.725

			if var_316_6 < arg_313_1.time_ and arg_313_1.time_ <= var_316_6 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_8 = arg_313_1:FormatText(StoryNameCfg[7].name)

				arg_313_1.leftNameTxt_.text = var_316_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_9 = arg_313_1:GetWordFromCfg(1101101076)
				local var_316_10 = arg_313_1:FormatText(var_316_9.content)

				arg_313_1.text_.text = var_316_10

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_11 = 29
				local var_316_12 = utf8.len(var_316_10)
				local var_316_13 = var_316_11 <= 0 and var_316_7 or var_316_7 * (var_316_12 / var_316_11)

				if var_316_13 > 0 and var_316_7 < var_316_13 then
					arg_313_1.talkMaxDuration = var_316_13

					if var_316_13 + var_316_6 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_13 + var_316_6
					end
				end

				arg_313_1.text_.text = var_316_10
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)
				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_14 = math.max(var_316_7, arg_313_1.talkMaxDuration)

			if var_316_6 <= arg_313_1.time_ and arg_313_1.time_ < var_316_6 + var_316_14 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_6) / var_316_14

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_6 + var_316_14 and arg_313_1.time_ < var_316_6 + var_316_14 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 1101101077
		arg_317_1.duration_ = 6.566

		local var_317_0 = {
			zh = 2.9,
			ja = 6.566
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
				arg_317_0:Play1101101078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["1011ui_story"].transform
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				arg_317_1.var_.moveOldPos1011ui_story = var_320_0.localPosition
			end

			local var_320_2 = 0.001

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2
				local var_320_4 = Vector3.New(0, -0.71, -6)

				var_320_0.localPosition = Vector3.Lerp(arg_317_1.var_.moveOldPos1011ui_story, var_320_4, var_320_3)

				local var_320_5 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_5.x, var_320_5.y, var_320_5.z)

				local var_320_6 = var_320_0.localEulerAngles

				var_320_6.z = 0
				var_320_6.x = 0
				var_320_0.localEulerAngles = var_320_6
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 then
				var_320_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_320_7 = manager.ui.mainCamera.transform.position - var_320_0.position

				var_320_0.forward = Vector3.New(var_320_7.x, var_320_7.y, var_320_7.z)

				local var_320_8 = var_320_0.localEulerAngles

				var_320_8.z = 0
				var_320_8.x = 0
				var_320_0.localEulerAngles = var_320_8
			end

			local var_320_9 = arg_317_1.actors_["1011ui_story"]
			local var_320_10 = 0

			if var_320_10 < arg_317_1.time_ and arg_317_1.time_ <= var_320_10 + arg_320_0 and arg_317_1.var_.characterEffect1011ui_story == nil then
				arg_317_1.var_.characterEffect1011ui_story = var_320_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_320_11 = 0.200000002980232

			if var_320_10 <= arg_317_1.time_ and arg_317_1.time_ < var_320_10 + var_320_11 then
				local var_320_12 = (arg_317_1.time_ - var_320_10) / var_320_11

				if arg_317_1.var_.characterEffect1011ui_story then
					arg_317_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_317_1.time_ >= var_320_10 + var_320_11 and arg_317_1.time_ < var_320_10 + var_320_11 + arg_320_0 and arg_317_1.var_.characterEffect1011ui_story then
				arg_317_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_320_13 = 0

			if var_320_13 < arg_317_1.time_ and arg_317_1.time_ <= var_320_13 + arg_320_0 then
				arg_317_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action6_1")
			end

			local var_320_14 = 0

			if var_320_14 < arg_317_1.time_ and arg_317_1.time_ <= var_320_14 + arg_320_0 then
				arg_317_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_320_15 = 0
			local var_320_16 = 0.3

			if var_320_15 < arg_317_1.time_ and arg_317_1.time_ <= var_320_15 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_17 = arg_317_1:FormatText(StoryNameCfg[37].name)

				arg_317_1.leftNameTxt_.text = var_320_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_18 = arg_317_1:GetWordFromCfg(1101101077)
				local var_320_19 = arg_317_1:FormatText(var_320_18.content)

				arg_317_1.text_.text = var_320_19

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_20 = 12
				local var_320_21 = utf8.len(var_320_19)
				local var_320_22 = var_320_20 <= 0 and var_320_16 or var_320_16 * (var_320_21 / var_320_20)

				if var_320_22 > 0 and var_320_16 < var_320_22 then
					arg_317_1.talkMaxDuration = var_320_22

					if var_320_22 + var_320_15 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_22 + var_320_15
					end
				end

				arg_317_1.text_.text = var_320_19
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101077", "story_v_side_new_1101101.awb") ~= 0 then
					local var_320_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101077", "story_v_side_new_1101101.awb") / 1000

					if var_320_23 + var_320_15 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_23 + var_320_15
					end

					if var_320_18.prefab_name ~= "" and arg_317_1.actors_[var_320_18.prefab_name] ~= nil then
						local var_320_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_18.prefab_name].transform, "story_v_side_new_1101101", "1101101077", "story_v_side_new_1101101.awb")

						arg_317_1:RecordAudio("1101101077", var_320_24)
						arg_317_1:RecordAudio("1101101077", var_320_24)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101077", "story_v_side_new_1101101.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101077", "story_v_side_new_1101101.awb")
				end

				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_25 = math.max(var_320_16, arg_317_1.talkMaxDuration)

			if var_320_15 <= arg_317_1.time_ and arg_317_1.time_ < var_320_15 + var_320_25 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_15) / var_320_25

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_15 + var_320_25 and arg_317_1.time_ < var_320_15 + var_320_25 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 1101101078
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play1101101079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["1011ui_story"]
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 and arg_321_1.var_.characterEffect1011ui_story == nil then
				arg_321_1.var_.characterEffect1011ui_story = var_324_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_324_2 = 0.200000002980232

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_2 then
				local var_324_3 = (arg_321_1.time_ - var_324_1) / var_324_2

				if arg_321_1.var_.characterEffect1011ui_story then
					local var_324_4 = Mathf.Lerp(0, 0.5, var_324_3)

					arg_321_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_321_1.var_.characterEffect1011ui_story.fillRatio = var_324_4
				end
			end

			if arg_321_1.time_ >= var_324_1 + var_324_2 and arg_321_1.time_ < var_324_1 + var_324_2 + arg_324_0 and arg_321_1.var_.characterEffect1011ui_story then
				local var_324_5 = 0.5

				arg_321_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_321_1.var_.characterEffect1011ui_story.fillRatio = var_324_5
			end

			local var_324_6 = 0
			local var_324_7 = 0.3

			if var_324_6 < arg_321_1.time_ and arg_321_1.time_ <= var_324_6 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_8 = arg_321_1:FormatText(StoryNameCfg[7].name)

				arg_321_1.leftNameTxt_.text = var_324_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_9 = arg_321_1:GetWordFromCfg(1101101078)
				local var_324_10 = arg_321_1:FormatText(var_324_9.content)

				arg_321_1.text_.text = var_324_10

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_11 = 12
				local var_324_12 = utf8.len(var_324_10)
				local var_324_13 = var_324_11 <= 0 and var_324_7 or var_324_7 * (var_324_12 / var_324_11)

				if var_324_13 > 0 and var_324_7 < var_324_13 then
					arg_321_1.talkMaxDuration = var_324_13

					if var_324_13 + var_324_6 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_13 + var_324_6
					end
				end

				arg_321_1.text_.text = var_324_10
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_14 = math.max(var_324_7, arg_321_1.talkMaxDuration)

			if var_324_6 <= arg_321_1.time_ and arg_321_1.time_ < var_324_6 + var_324_14 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_6) / var_324_14

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_6 + var_324_14 and arg_321_1.time_ < var_324_6 + var_324_14 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 1101101079
		arg_325_1.duration_ = 5

		SetActive(arg_325_1.tipsGo_, false)

		function arg_325_1.onSingleLineFinish_()
			arg_325_1.onSingleLineUpdate_ = nil
			arg_325_1.onSingleLineFinish_ = nil
			arg_325_1.state_ = "waiting"
		end

		function arg_325_1.playNext_(arg_327_0)
			if arg_327_0 == 1 then
				arg_325_0:Play1101101080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011actionlink/1011action465")
			end

			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_328_2 = 0
			local var_328_3 = 0.625

			if var_328_2 < arg_325_1.time_ and arg_325_1.time_ <= var_328_2 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, false)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_4 = arg_325_1:GetWordFromCfg(1101101079)
				local var_328_5 = arg_325_1:FormatText(var_328_4.content)

				arg_325_1.text_.text = var_328_5

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_6 = 25
				local var_328_7 = utf8.len(var_328_5)
				local var_328_8 = var_328_6 <= 0 and var_328_3 or var_328_3 * (var_328_7 / var_328_6)

				if var_328_8 > 0 and var_328_3 < var_328_8 then
					arg_325_1.talkMaxDuration = var_328_8

					if var_328_8 + var_328_2 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_2
					end
				end

				arg_325_1.text_.text = var_328_5
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)
				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_9 = math.max(var_328_3, arg_325_1.talkMaxDuration)

			if var_328_2 <= arg_325_1.time_ and arg_325_1.time_ < var_328_2 + var_328_9 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_2) / var_328_9

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_2 + var_328_9 and arg_325_1.time_ < var_328_2 + var_328_9 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 1101101080
		arg_329_1.duration_ = 0.999999999999

		SetActive(arg_329_1.tipsGo_, false)

		function arg_329_1.onSingleLineFinish_()
			arg_329_1.onSingleLineUpdate_ = nil
			arg_329_1.onSingleLineFinish_ = nil
			arg_329_1.state_ = "waiting"

			SetActive(arg_329_1.choicesGo_, true)

			for iter_330_0, iter_330_1 in ipairs(arg_329_1.choices_) do
				local var_330_0 = iter_330_0 <= 2

				SetActive(iter_330_1.go, var_330_0)
			end

			arg_329_1.choices_[1].txt.text = arg_329_1:FormatText(StoryChoiceCfg[606].name)
			arg_329_1.choices_[2].txt.text = arg_329_1:FormatText(StoryChoiceCfg[607].name)
		end

		function arg_329_1.playNext_(arg_331_0)
			if arg_331_0 == 1 then
				arg_329_0:Play1101101081(arg_329_1)
			end

			if arg_331_0 == 2 then
				arg_329_0:Play1101101081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.allBtn_.enabled = false
			end

			local var_332_1 = 0.5

			if arg_329_1.time_ >= var_332_0 + var_332_1 and arg_329_1.time_ < var_332_0 + var_332_1 + arg_332_0 then
				arg_329_1.allBtn_.enabled = true
			end
		end
	end,
	Play1101101081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 1101101081
		arg_333_1.duration_ = 1.999999999999

		SetActive(arg_333_1.tipsGo_, false)

		function arg_333_1.onSingleLineFinish_()
			arg_333_1.onSingleLineUpdate_ = nil
			arg_333_1.onSingleLineFinish_ = nil
			arg_333_1.state_ = "waiting"
		end

		function arg_333_1.playNext_(arg_335_0)
			if arg_335_0 == 1 then
				arg_333_0:Play1101101082(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1011ui_story"].transform
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1.var_.moveOldPos1011ui_story = var_336_0.localPosition
			end

			local var_336_2 = 0.001

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_2 then
				local var_336_3 = (arg_333_1.time_ - var_336_1) / var_336_2
				local var_336_4 = Vector3.New(0, -0.71, -6)

				var_336_0.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1011ui_story, var_336_4, var_336_3)

				local var_336_5 = manager.ui.mainCamera.transform.position - var_336_0.position

				var_336_0.forward = Vector3.New(var_336_5.x, var_336_5.y, var_336_5.z)

				local var_336_6 = var_336_0.localEulerAngles

				var_336_6.z = 0
				var_336_6.x = 0
				var_336_0.localEulerAngles = var_336_6
			end

			if arg_333_1.time_ >= var_336_1 + var_336_2 and arg_333_1.time_ < var_336_1 + var_336_2 + arg_336_0 then
				var_336_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_336_7 = manager.ui.mainCamera.transform.position - var_336_0.position

				var_336_0.forward = Vector3.New(var_336_7.x, var_336_7.y, var_336_7.z)

				local var_336_8 = var_336_0.localEulerAngles

				var_336_8.z = 0
				var_336_8.x = 0
				var_336_0.localEulerAngles = var_336_8
			end

			local var_336_9 = arg_333_1.actors_["1011ui_story"]
			local var_336_10 = 0

			if var_336_10 < arg_333_1.time_ and arg_333_1.time_ <= var_336_10 + arg_336_0 and arg_333_1.var_.characterEffect1011ui_story == nil then
				arg_333_1.var_.characterEffect1011ui_story = var_336_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_336_11 = 0.200000002980232

			if var_336_10 <= arg_333_1.time_ and arg_333_1.time_ < var_336_10 + var_336_11 then
				local var_336_12 = (arg_333_1.time_ - var_336_10) / var_336_11

				if arg_333_1.var_.characterEffect1011ui_story then
					arg_333_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_333_1.time_ >= var_336_10 + var_336_11 and arg_333_1.time_ < var_336_10 + var_336_11 + arg_336_0 and arg_333_1.var_.characterEffect1011ui_story then
				arg_333_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_336_13 = 0

			if var_336_13 < arg_333_1.time_ and arg_333_1.time_ <= var_336_13 + arg_336_0 then
				arg_333_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action5_2")
			end

			local var_336_14 = 0

			if var_336_14 < arg_333_1.time_ and arg_333_1.time_ <= var_336_14 + arg_336_0 then
				arg_333_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_336_15 = 0
			local var_336_16 = 0.125

			if var_336_15 < arg_333_1.time_ and arg_333_1.time_ <= var_336_15 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_17 = arg_333_1:FormatText(StoryNameCfg[37].name)

				arg_333_1.leftNameTxt_.text = var_336_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_18 = arg_333_1:GetWordFromCfg(1101101081)
				local var_336_19 = arg_333_1:FormatText(var_336_18.content)

				arg_333_1.text_.text = var_336_19

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_20 = 5
				local var_336_21 = utf8.len(var_336_19)
				local var_336_22 = var_336_20 <= 0 and var_336_16 or var_336_16 * (var_336_21 / var_336_20)

				if var_336_22 > 0 and var_336_16 < var_336_22 then
					arg_333_1.talkMaxDuration = var_336_22

					if var_336_22 + var_336_15 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_22 + var_336_15
					end
				end

				arg_333_1.text_.text = var_336_19
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101081", "story_v_side_new_1101101.awb") ~= 0 then
					local var_336_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101081", "story_v_side_new_1101101.awb") / 1000

					if var_336_23 + var_336_15 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_23 + var_336_15
					end

					if var_336_18.prefab_name ~= "" and arg_333_1.actors_[var_336_18.prefab_name] ~= nil then
						local var_336_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_18.prefab_name].transform, "story_v_side_new_1101101", "1101101081", "story_v_side_new_1101101.awb")

						arg_333_1:RecordAudio("1101101081", var_336_24)
						arg_333_1:RecordAudio("1101101081", var_336_24)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101081", "story_v_side_new_1101101.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101081", "story_v_side_new_1101101.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_25 = math.max(var_336_16, arg_333_1.talkMaxDuration)

			if var_336_15 <= arg_333_1.time_ and arg_333_1.time_ < var_336_15 + var_336_25 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_15) / var_336_25

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_15 + var_336_25 and arg_333_1.time_ < var_336_15 + var_336_25 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101082 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 1101101082
		arg_337_1.duration_ = 4.666666666666

		SetActive(arg_337_1.tipsGo_, false)

		function arg_337_1.onSingleLineFinish_()
			arg_337_1.onSingleLineUpdate_ = nil
			arg_337_1.onSingleLineFinish_ = nil
			arg_337_1.state_ = "waiting"
		end

		function arg_337_1.playNext_(arg_339_0)
			if arg_339_0 == 1 then
				arg_337_0:Play1101101083(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 2

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				local var_340_1 = manager.ui.mainCamera.transform.localPosition
				local var_340_2 = Vector3.New(0, 0, 10) + Vector3.New(var_340_1.x, var_340_1.y, 0)
				local var_340_3 = arg_337_1.bgs_.STblack

				var_340_3.transform.localPosition = var_340_2
				var_340_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_340_4 = var_340_3:GetComponent("SpriteRenderer")

				if var_340_4 and var_340_4.sprite then
					local var_340_5 = (var_340_3.transform.localPosition - var_340_1).z
					local var_340_6 = manager.ui.mainCameraCom_
					local var_340_7 = 2 * var_340_5 * Mathf.Tan(var_340_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_340_8 = var_340_7 * var_340_6.aspect
					local var_340_9 = var_340_4.sprite.bounds.size.x
					local var_340_10 = var_340_4.sprite.bounds.size.y
					local var_340_11 = var_340_8 / var_340_9
					local var_340_12 = var_340_7 / var_340_10
					local var_340_13 = var_340_12 < var_340_11 and var_340_11 or var_340_12

					var_340_3.transform.localScale = Vector3.New(var_340_13, var_340_13, 0)
				end

				for iter_340_0, iter_340_1 in pairs(arg_337_1.bgs_) do
					if iter_340_0 ~= "STblack" then
						iter_340_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_340_14 = 0

			if var_340_14 < arg_337_1.time_ and arg_337_1.time_ <= var_340_14 + arg_340_0 then
				arg_337_1.mask_.enabled = true
				arg_337_1.mask_.raycastTarget = true

				arg_337_1:SetGaussion(false)
			end

			local var_340_15 = 2

			if var_340_14 <= arg_337_1.time_ and arg_337_1.time_ < var_340_14 + var_340_15 then
				local var_340_16 = (arg_337_1.time_ - var_340_14) / var_340_15
				local var_340_17 = Color.New(0, 0, 0)

				var_340_17.a = Mathf.Lerp(0, 1, var_340_16)
				arg_337_1.mask_.color = var_340_17
			end

			if arg_337_1.time_ >= var_340_14 + var_340_15 and arg_337_1.time_ < var_340_14 + var_340_15 + arg_340_0 then
				local var_340_18 = Color.New(0, 0, 0)

				var_340_18.a = 1
				arg_337_1.mask_.color = var_340_18
			end

			local var_340_19 = 2

			if var_340_19 < arg_337_1.time_ and arg_337_1.time_ <= var_340_19 + arg_340_0 then
				arg_337_1.mask_.enabled = true
				arg_337_1.mask_.raycastTarget = true

				arg_337_1:SetGaussion(false)
			end

			local var_340_20 = 0.333333333333333

			if var_340_19 <= arg_337_1.time_ and arg_337_1.time_ < var_340_19 + var_340_20 then
				local var_340_21 = (arg_337_1.time_ - var_340_19) / var_340_20
				local var_340_22 = Color.New(0, 0, 0)

				var_340_22.a = Mathf.Lerp(1, 0, var_340_21)
				arg_337_1.mask_.color = var_340_22
			end

			if arg_337_1.time_ >= var_340_19 + var_340_20 and arg_337_1.time_ < var_340_19 + var_340_20 + arg_340_0 then
				local var_340_23 = Color.New(0, 0, 0)
				local var_340_24 = 0

				arg_337_1.mask_.enabled = false
				var_340_23.a = var_340_24
				arg_337_1.mask_.color = var_340_23
			end

			local var_340_25 = arg_337_1.actors_["1011ui_story"].transform
			local var_340_26 = 2

			if var_340_26 < arg_337_1.time_ and arg_337_1.time_ <= var_340_26 + arg_340_0 then
				arg_337_1.var_.moveOldPos1011ui_story = var_340_25.localPosition
			end

			local var_340_27 = 0.001

			if var_340_26 <= arg_337_1.time_ and arg_337_1.time_ < var_340_26 + var_340_27 then
				local var_340_28 = (arg_337_1.time_ - var_340_26) / var_340_27
				local var_340_29 = Vector3.New(0, 100, 0)

				var_340_25.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1011ui_story, var_340_29, var_340_28)

				local var_340_30 = manager.ui.mainCamera.transform.position - var_340_25.position

				var_340_25.forward = Vector3.New(var_340_30.x, var_340_30.y, var_340_30.z)

				local var_340_31 = var_340_25.localEulerAngles

				var_340_31.z = 0
				var_340_31.x = 0
				var_340_25.localEulerAngles = var_340_31
			end

			if arg_337_1.time_ >= var_340_26 + var_340_27 and arg_337_1.time_ < var_340_26 + var_340_27 + arg_340_0 then
				var_340_25.localPosition = Vector3.New(0, 100, 0)

				local var_340_32 = manager.ui.mainCamera.transform.position - var_340_25.position

				var_340_25.forward = Vector3.New(var_340_32.x, var_340_32.y, var_340_32.z)

				local var_340_33 = var_340_25.localEulerAngles

				var_340_33.z = 0
				var_340_33.x = 0
				var_340_25.localEulerAngles = var_340_33
			end

			local var_340_34 = 2

			if var_340_34 < arg_337_1.time_ and arg_337_1.time_ <= var_340_34 + arg_340_0 then
				arg_337_1.fswbg_:SetActive(true)
				arg_337_1.dialog_:SetActive(false)

				arg_337_1.fswtw_.percent = 0

				local var_340_35 = arg_337_1:GetWordFromCfg(1101101082)
				local var_340_36 = arg_337_1:FormatText(var_340_35.content)

				arg_337_1.fswt_.text = var_340_36

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.fswt_)

				arg_337_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_337_1.fswtw_:SetDirty()

				arg_337_1.typewritterCharCountI18N = 0

				SetActive(arg_337_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_337_1:ShowNextGo(false)
			end

			local var_340_37 = 2.33333333333333

			if var_340_37 < arg_337_1.time_ and arg_337_1.time_ <= var_340_37 + arg_340_0 then
				arg_337_1.var_.oldValueTypewriter = arg_337_1.fswtw_.percent

				arg_337_1:ShowNextGo(false)
			end

			local var_340_38 = 35
			local var_340_39 = 2.33333333333333
			local var_340_40 = arg_337_1:GetWordFromCfg(1101101082)
			local var_340_41 = arg_337_1:FormatText(var_340_40.content)
			local var_340_42, var_340_43 = arg_337_1:GetPercentByPara(var_340_41, 1)

			if var_340_37 < arg_337_1.time_ and arg_337_1.time_ <= var_340_37 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0

				local var_340_44 = var_340_38 <= 0 and var_340_39 or var_340_39 * ((var_340_43 - arg_337_1.typewritterCharCountI18N) / var_340_38)

				if var_340_44 > 0 and var_340_39 < var_340_44 then
					arg_337_1.talkMaxDuration = var_340_44

					if var_340_44 + var_340_37 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_44 + var_340_37
					end
				end
			end

			local var_340_45 = 2.33333333333333
			local var_340_46 = math.max(var_340_45, arg_337_1.talkMaxDuration)

			if var_340_37 <= arg_337_1.time_ and arg_337_1.time_ < var_340_37 + var_340_46 then
				local var_340_47 = (arg_337_1.time_ - var_340_37) / var_340_46

				arg_337_1.fswtw_.percent = Mathf.Lerp(arg_337_1.var_.oldValueTypewriter, var_340_42, var_340_47)
				arg_337_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_337_1.fswtw_:SetDirty()
			end

			if arg_337_1.time_ >= var_340_37 + var_340_46 and arg_337_1.time_ < var_340_37 + var_340_46 + arg_340_0 then
				arg_337_1.fswtw_.percent = var_340_42

				arg_337_1.fswtw_:SetDirty()
				arg_337_1:ShowNextGo(true)

				arg_337_1.typewritterCharCountI18N = var_340_43
			end

			local var_340_48 = 2.3

			if var_340_48 < arg_337_1.time_ and arg_337_1.time_ <= var_340_48 + arg_340_0 then
				local var_340_49 = arg_337_1.fswbg_.transform:Find("textbox/adapt/content") or arg_337_1.fswbg_.transform:Find("textbox/content")
				local var_340_50 = var_340_49:GetComponent("Text")
				local var_340_51 = var_340_49:GetComponent("RectTransform")

				var_340_50.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_340_51.offsetMin = Vector2.New(0, 0)
				var_340_51.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play1101101083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 1101101083
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play1101101084(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				arg_341_1.fswbg_:SetActive(false)
				arg_341_1.dialog_:SetActive(true)
				arg_341_1:ShowNextGo(false)
			end

			local var_344_1 = 0
			local var_344_2 = 0.675

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, false)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_3 = arg_341_1:GetWordFromCfg(1101101083)
				local var_344_4 = arg_341_1:FormatText(var_344_3.content)

				arg_341_1.text_.text = var_344_4

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_5 = 27
				local var_344_6 = utf8.len(var_344_4)
				local var_344_7 = var_344_5 <= 0 and var_344_2 or var_344_2 * (var_344_6 / var_344_5)

				if var_344_7 > 0 and var_344_2 < var_344_7 then
					arg_341_1.talkMaxDuration = var_344_7

					if var_344_7 + var_344_1 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_7 + var_344_1
					end
				end

				arg_341_1.text_.text = var_344_4
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)
				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_8 = math.max(var_344_2, arg_341_1.talkMaxDuration)

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_8 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_1) / var_344_8

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_1 + var_344_8 and arg_341_1.time_ < var_344_1 + var_344_8 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101084 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 1101101084
		arg_345_1.duration_ = 7

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play1101101085(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = "B13g"

			if arg_345_1.bgs_[var_348_0] == nil then
				local var_348_1 = Object.Instantiate(arg_345_1.paintGo_)

				var_348_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_348_0)
				var_348_1.name = var_348_0
				var_348_1.transform.parent = arg_345_1.stage_.transform
				var_348_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_345_1.bgs_[var_348_0] = var_348_1
			end

			local var_348_2 = 0

			if var_348_2 < arg_345_1.time_ and arg_345_1.time_ <= var_348_2 + arg_348_0 then
				local var_348_3 = manager.ui.mainCamera.transform.localPosition
				local var_348_4 = Vector3.New(0, 0, 10) + Vector3.New(var_348_3.x, var_348_3.y, 0)
				local var_348_5 = arg_345_1.bgs_.B13g

				var_348_5.transform.localPosition = var_348_4
				var_348_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_348_6 = var_348_5:GetComponent("SpriteRenderer")

				if var_348_6 and var_348_6.sprite then
					local var_348_7 = (var_348_5.transform.localPosition - var_348_3).z
					local var_348_8 = manager.ui.mainCameraCom_
					local var_348_9 = 2 * var_348_7 * Mathf.Tan(var_348_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_348_10 = var_348_9 * var_348_8.aspect
					local var_348_11 = var_348_6.sprite.bounds.size.x
					local var_348_12 = var_348_6.sprite.bounds.size.y
					local var_348_13 = var_348_10 / var_348_11
					local var_348_14 = var_348_9 / var_348_12
					local var_348_15 = var_348_14 < var_348_13 and var_348_13 or var_348_14

					var_348_5.transform.localScale = Vector3.New(var_348_15, var_348_15, 0)
				end

				for iter_348_0, iter_348_1 in pairs(arg_345_1.bgs_) do
					if iter_348_0 ~= "B13g" then
						iter_348_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_348_16 = 0

			if var_348_16 < arg_345_1.time_ and arg_345_1.time_ <= var_348_16 + arg_348_0 then
				arg_345_1.mask_.enabled = true
				arg_345_1.mask_.raycastTarget = true

				arg_345_1:SetGaussion(false)
			end

			local var_348_17 = 2

			if var_348_16 <= arg_345_1.time_ and arg_345_1.time_ < var_348_16 + var_348_17 then
				local var_348_18 = (arg_345_1.time_ - var_348_16) / var_348_17
				local var_348_19 = Color.New(0, 0, 0)

				var_348_19.a = Mathf.Lerp(1, 0, var_348_18)
				arg_345_1.mask_.color = var_348_19
			end

			if arg_345_1.time_ >= var_348_16 + var_348_17 and arg_345_1.time_ < var_348_16 + var_348_17 + arg_348_0 then
				local var_348_20 = Color.New(0, 0, 0)
				local var_348_21 = 0

				arg_345_1.mask_.enabled = false
				var_348_20.a = var_348_21
				arg_345_1.mask_.color = var_348_20
			end

			if arg_345_1.frameCnt_ <= 1 then
				arg_345_1.dialog_:SetActive(false)
			end

			local var_348_22 = 2
			local var_348_23 = 0.625

			if var_348_22 < arg_345_1.time_ and arg_345_1.time_ <= var_348_22 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0

				arg_345_1.dialog_:SetActive(true)

				local var_348_24 = LeanTween.value(arg_345_1.dialog_, 0, 1, 0.3)

				var_348_24:setOnUpdate(LuaHelper.FloatAction(function(arg_349_0)
					arg_345_1.dialogCg_.alpha = arg_349_0
				end))
				var_348_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_345_1.dialog_)
					var_348_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_345_1.duration_ = arg_345_1.duration_ + 0.3

				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_25 = arg_345_1:FormatText(StoryNameCfg[7].name)

				arg_345_1.leftNameTxt_.text = var_348_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_26 = arg_345_1:GetWordFromCfg(1101101084)
				local var_348_27 = arg_345_1:FormatText(var_348_26.content)

				arg_345_1.text_.text = var_348_27

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_28 = 25
				local var_348_29 = utf8.len(var_348_27)
				local var_348_30 = var_348_28 <= 0 and var_348_23 or var_348_23 * (var_348_29 / var_348_28)

				if var_348_30 > 0 and var_348_23 < var_348_30 then
					arg_345_1.talkMaxDuration = var_348_30
					var_348_22 = var_348_22 + 0.3

					if var_348_30 + var_348_22 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_30 + var_348_22
					end
				end

				arg_345_1.text_.text = var_348_27
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)
				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_31 = var_348_22 + 0.3
			local var_348_32 = math.max(var_348_23, arg_345_1.talkMaxDuration)

			if var_348_31 <= arg_345_1.time_ and arg_345_1.time_ < var_348_31 + var_348_32 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_31) / var_348_32

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_31 + var_348_32 and arg_345_1.time_ < var_348_31 + var_348_32 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101085 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 1101101085
		arg_351_1.duration_ = 9.8

		local var_351_0 = {
			zh = 5.433,
			ja = 9.8
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
				arg_351_0:Play1101101086(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1011ui_story"].transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPos1011ui_story = var_354_0.localPosition
			end

			local var_354_2 = 0.001

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2
				local var_354_4 = Vector3.New(0, -0.71, -6)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1011ui_story, var_354_4, var_354_3)

				local var_354_5 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_5.x, var_354_5.y, var_354_5.z)

				local var_354_6 = var_354_0.localEulerAngles

				var_354_6.z = 0
				var_354_6.x = 0
				var_354_0.localEulerAngles = var_354_6
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_354_7 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_7.x, var_354_7.y, var_354_7.z)

				local var_354_8 = var_354_0.localEulerAngles

				var_354_8.z = 0
				var_354_8.x = 0
				var_354_0.localEulerAngles = var_354_8
			end

			local var_354_9 = arg_351_1.actors_["1011ui_story"]
			local var_354_10 = 0

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 and arg_351_1.var_.characterEffect1011ui_story == nil then
				arg_351_1.var_.characterEffect1011ui_story = var_354_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_11 = 0.200000002980232

			if var_354_10 <= arg_351_1.time_ and arg_351_1.time_ < var_354_10 + var_354_11 then
				local var_354_12 = (arg_351_1.time_ - var_354_10) / var_354_11

				if arg_351_1.var_.characterEffect1011ui_story then
					arg_351_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_10 + var_354_11 and arg_351_1.time_ < var_354_10 + var_354_11 + arg_354_0 and arg_351_1.var_.characterEffect1011ui_story then
				arg_351_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_354_13 = 0

			if var_354_13 < arg_351_1.time_ and arg_351_1.time_ <= var_354_13 + arg_354_0 then
				arg_351_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_354_14 = 0

			if var_354_14 < arg_351_1.time_ and arg_351_1.time_ <= var_354_14 + arg_354_0 then
				arg_351_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_354_15 = 0
			local var_354_16 = 0.675

			if var_354_15 < arg_351_1.time_ and arg_351_1.time_ <= var_354_15 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_17 = arg_351_1:FormatText(StoryNameCfg[37].name)

				arg_351_1.leftNameTxt_.text = var_354_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_18 = arg_351_1:GetWordFromCfg(1101101085)
				local var_354_19 = arg_351_1:FormatText(var_354_18.content)

				arg_351_1.text_.text = var_354_19

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_20 = 27
				local var_354_21 = utf8.len(var_354_19)
				local var_354_22 = var_354_20 <= 0 and var_354_16 or var_354_16 * (var_354_21 / var_354_20)

				if var_354_22 > 0 and var_354_16 < var_354_22 then
					arg_351_1.talkMaxDuration = var_354_22

					if var_354_22 + var_354_15 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_22 + var_354_15
					end
				end

				arg_351_1.text_.text = var_354_19
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101085", "story_v_side_new_1101101.awb") ~= 0 then
					local var_354_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101085", "story_v_side_new_1101101.awb") / 1000

					if var_354_23 + var_354_15 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_23 + var_354_15
					end

					if var_354_18.prefab_name ~= "" and arg_351_1.actors_[var_354_18.prefab_name] ~= nil then
						local var_354_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_18.prefab_name].transform, "story_v_side_new_1101101", "1101101085", "story_v_side_new_1101101.awb")

						arg_351_1:RecordAudio("1101101085", var_354_24)
						arg_351_1:RecordAudio("1101101085", var_354_24)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101085", "story_v_side_new_1101101.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101085", "story_v_side_new_1101101.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_25 = math.max(var_354_16, arg_351_1.talkMaxDuration)

			if var_354_15 <= arg_351_1.time_ and arg_351_1.time_ < var_354_15 + var_354_25 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_15) / var_354_25

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_15 + var_354_25 and arg_351_1.time_ < var_354_15 + var_354_25 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101086 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 1101101086
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play1101101087(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1011ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect1011ui_story == nil then
				arg_355_1.var_.characterEffect1011ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect1011ui_story then
					local var_358_4 = Mathf.Lerp(0, 0.5, var_358_3)

					arg_355_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1011ui_story.fillRatio = var_358_4
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1011ui_story then
				local var_358_5 = 0.5

				arg_355_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1011ui_story.fillRatio = var_358_5
			end

			local var_358_6 = 0
			local var_358_7 = 0.9

			if var_358_6 < arg_355_1.time_ and arg_355_1.time_ <= var_358_6 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_8 = arg_355_1:FormatText(StoryNameCfg[7].name)

				arg_355_1.leftNameTxt_.text = var_358_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_9 = arg_355_1:GetWordFromCfg(1101101086)
				local var_358_10 = arg_355_1:FormatText(var_358_9.content)

				arg_355_1.text_.text = var_358_10

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_11 = 36
				local var_358_12 = utf8.len(var_358_10)
				local var_358_13 = var_358_11 <= 0 and var_358_7 or var_358_7 * (var_358_12 / var_358_11)

				if var_358_13 > 0 and var_358_7 < var_358_13 then
					arg_355_1.talkMaxDuration = var_358_13

					if var_358_13 + var_358_6 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_13 + var_358_6
					end
				end

				arg_355_1.text_.text = var_358_10
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_14 = math.max(var_358_7, arg_355_1.talkMaxDuration)

			if var_358_6 <= arg_355_1.time_ and arg_355_1.time_ < var_358_6 + var_358_14 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_6) / var_358_14

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_6 + var_358_14 and arg_355_1.time_ < var_358_6 + var_358_14 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101087 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 1101101087
		arg_359_1.duration_ = 10.5

		local var_359_0 = {
			zh = 5.633,
			ja = 10.5
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
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play1101101088(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1011ui_story"].transform
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 then
				arg_359_1.var_.moveOldPos1011ui_story = var_362_0.localPosition
			end

			local var_362_2 = 0.001

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2
				local var_362_4 = Vector3.New(0, -0.71, -6)

				var_362_0.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1011ui_story, var_362_4, var_362_3)

				local var_362_5 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_5.x, var_362_5.y, var_362_5.z)

				local var_362_6 = var_362_0.localEulerAngles

				var_362_6.z = 0
				var_362_6.x = 0
				var_362_0.localEulerAngles = var_362_6
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 then
				var_362_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_362_7 = manager.ui.mainCamera.transform.position - var_362_0.position

				var_362_0.forward = Vector3.New(var_362_7.x, var_362_7.y, var_362_7.z)

				local var_362_8 = var_362_0.localEulerAngles

				var_362_8.z = 0
				var_362_8.x = 0
				var_362_0.localEulerAngles = var_362_8
			end

			local var_362_9 = arg_359_1.actors_["1011ui_story"]
			local var_362_10 = 0

			if var_362_10 < arg_359_1.time_ and arg_359_1.time_ <= var_362_10 + arg_362_0 and arg_359_1.var_.characterEffect1011ui_story == nil then
				arg_359_1.var_.characterEffect1011ui_story = var_362_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_11 = 0.200000002980232

			if var_362_10 <= arg_359_1.time_ and arg_359_1.time_ < var_362_10 + var_362_11 then
				local var_362_12 = (arg_359_1.time_ - var_362_10) / var_362_11

				if arg_359_1.var_.characterEffect1011ui_story then
					arg_359_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_10 + var_362_11 and arg_359_1.time_ < var_362_10 + var_362_11 + arg_362_0 and arg_359_1.var_.characterEffect1011ui_story then
				arg_359_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_362_13 = 0

			if var_362_13 < arg_359_1.time_ and arg_359_1.time_ <= var_362_13 + arg_362_0 then
				arg_359_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_362_14 = 0
			local var_362_15 = 0.625

			if var_362_14 < arg_359_1.time_ and arg_359_1.time_ <= var_362_14 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_16 = arg_359_1:FormatText(StoryNameCfg[37].name)

				arg_359_1.leftNameTxt_.text = var_362_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_17 = arg_359_1:GetWordFromCfg(1101101087)
				local var_362_18 = arg_359_1:FormatText(var_362_17.content)

				arg_359_1.text_.text = var_362_18

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_19 = 25
				local var_362_20 = utf8.len(var_362_18)
				local var_362_21 = var_362_19 <= 0 and var_362_15 or var_362_15 * (var_362_20 / var_362_19)

				if var_362_21 > 0 and var_362_15 < var_362_21 then
					arg_359_1.talkMaxDuration = var_362_21

					if var_362_21 + var_362_14 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_21 + var_362_14
					end
				end

				arg_359_1.text_.text = var_362_18
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101087", "story_v_side_new_1101101.awb") ~= 0 then
					local var_362_22 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101087", "story_v_side_new_1101101.awb") / 1000

					if var_362_22 + var_362_14 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_22 + var_362_14
					end

					if var_362_17.prefab_name ~= "" and arg_359_1.actors_[var_362_17.prefab_name] ~= nil then
						local var_362_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_17.prefab_name].transform, "story_v_side_new_1101101", "1101101087", "story_v_side_new_1101101.awb")

						arg_359_1:RecordAudio("1101101087", var_362_23)
						arg_359_1:RecordAudio("1101101087", var_362_23)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101087", "story_v_side_new_1101101.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101087", "story_v_side_new_1101101.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_24 = math.max(var_362_15, arg_359_1.talkMaxDuration)

			if var_362_14 <= arg_359_1.time_ and arg_359_1.time_ < var_362_14 + var_362_24 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_14) / var_362_24

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_14 + var_362_24 and arg_359_1.time_ < var_362_14 + var_362_24 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101088 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 1101101088
		arg_363_1.duration_ = 5

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play1101101089(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1011ui_story"]
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 and arg_363_1.var_.characterEffect1011ui_story == nil then
				arg_363_1.var_.characterEffect1011ui_story = var_366_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_2 = 0.200000002980232

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2

				if arg_363_1.var_.characterEffect1011ui_story then
					local var_366_4 = Mathf.Lerp(0, 0.5, var_366_3)

					arg_363_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_363_1.var_.characterEffect1011ui_story.fillRatio = var_366_4
				end
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 and arg_363_1.var_.characterEffect1011ui_story then
				local var_366_5 = 0.5

				arg_363_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_363_1.var_.characterEffect1011ui_story.fillRatio = var_366_5
			end

			local var_366_6 = 0
			local var_366_7 = 0.4

			if var_366_6 < arg_363_1.time_ and arg_363_1.time_ <= var_366_6 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_8 = arg_363_1:FormatText(StoryNameCfg[7].name)

				arg_363_1.leftNameTxt_.text = var_366_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_9 = arg_363_1:GetWordFromCfg(1101101088)
				local var_366_10 = arg_363_1:FormatText(var_366_9.content)

				arg_363_1.text_.text = var_366_10

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_11 = 16
				local var_366_12 = utf8.len(var_366_10)
				local var_366_13 = var_366_11 <= 0 and var_366_7 or var_366_7 * (var_366_12 / var_366_11)

				if var_366_13 > 0 and var_366_7 < var_366_13 then
					arg_363_1.talkMaxDuration = var_366_13

					if var_366_13 + var_366_6 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_13 + var_366_6
					end
				end

				arg_363_1.text_.text = var_366_10
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)
				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_14 = math.max(var_366_7, arg_363_1.talkMaxDuration)

			if var_366_6 <= arg_363_1.time_ and arg_363_1.time_ < var_366_6 + var_366_14 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_6) / var_366_14

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_6 + var_366_14 and arg_363_1.time_ < var_366_6 + var_366_14 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101089 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 1101101089
		arg_367_1.duration_ = 9

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play1101101090(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = "B13a"

			if arg_367_1.bgs_[var_370_0] == nil then
				local var_370_1 = Object.Instantiate(arg_367_1.paintGo_)

				var_370_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_370_0)
				var_370_1.name = var_370_0
				var_370_1.transform.parent = arg_367_1.stage_.transform
				var_370_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_367_1.bgs_[var_370_0] = var_370_1
			end

			local var_370_2 = 2

			if var_370_2 < arg_367_1.time_ and arg_367_1.time_ <= var_370_2 + arg_370_0 then
				local var_370_3 = manager.ui.mainCamera.transform.localPosition
				local var_370_4 = Vector3.New(0, 0, 10) + Vector3.New(var_370_3.x, var_370_3.y, 0)
				local var_370_5 = arg_367_1.bgs_.B13a

				var_370_5.transform.localPosition = var_370_4
				var_370_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_370_6 = var_370_5:GetComponent("SpriteRenderer")

				if var_370_6 and var_370_6.sprite then
					local var_370_7 = (var_370_5.transform.localPosition - var_370_3).z
					local var_370_8 = manager.ui.mainCameraCom_
					local var_370_9 = 2 * var_370_7 * Mathf.Tan(var_370_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_370_10 = var_370_9 * var_370_8.aspect
					local var_370_11 = var_370_6.sprite.bounds.size.x
					local var_370_12 = var_370_6.sprite.bounds.size.y
					local var_370_13 = var_370_10 / var_370_11
					local var_370_14 = var_370_9 / var_370_12
					local var_370_15 = var_370_14 < var_370_13 and var_370_13 or var_370_14

					var_370_5.transform.localScale = Vector3.New(var_370_15, var_370_15, 0)
				end

				for iter_370_0, iter_370_1 in pairs(arg_367_1.bgs_) do
					if iter_370_0 ~= "B13a" then
						iter_370_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_370_16 = arg_367_1.actors_["1011ui_story"].transform
			local var_370_17 = 2

			if var_370_17 < arg_367_1.time_ and arg_367_1.time_ <= var_370_17 + arg_370_0 then
				arg_367_1.var_.moveOldPos1011ui_story = var_370_16.localPosition
			end

			local var_370_18 = 0.001

			if var_370_17 <= arg_367_1.time_ and arg_367_1.time_ < var_370_17 + var_370_18 then
				local var_370_19 = (arg_367_1.time_ - var_370_17) / var_370_18
				local var_370_20 = Vector3.New(0, 100, 0)

				var_370_16.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos1011ui_story, var_370_20, var_370_19)

				local var_370_21 = manager.ui.mainCamera.transform.position - var_370_16.position

				var_370_16.forward = Vector3.New(var_370_21.x, var_370_21.y, var_370_21.z)

				local var_370_22 = var_370_16.localEulerAngles

				var_370_22.z = 0
				var_370_22.x = 0
				var_370_16.localEulerAngles = var_370_22
			end

			if arg_367_1.time_ >= var_370_17 + var_370_18 and arg_367_1.time_ < var_370_17 + var_370_18 + arg_370_0 then
				var_370_16.localPosition = Vector3.New(0, 100, 0)

				local var_370_23 = manager.ui.mainCamera.transform.position - var_370_16.position

				var_370_16.forward = Vector3.New(var_370_23.x, var_370_23.y, var_370_23.z)

				local var_370_24 = var_370_16.localEulerAngles

				var_370_24.z = 0
				var_370_24.x = 0
				var_370_16.localEulerAngles = var_370_24
			end

			local var_370_25 = 0

			if var_370_25 < arg_367_1.time_ and arg_367_1.time_ <= var_370_25 + arg_370_0 then
				arg_367_1.mask_.enabled = true
				arg_367_1.mask_.raycastTarget = true

				arg_367_1:SetGaussion(false)
			end

			local var_370_26 = 2

			if var_370_25 <= arg_367_1.time_ and arg_367_1.time_ < var_370_25 + var_370_26 then
				local var_370_27 = (arg_367_1.time_ - var_370_25) / var_370_26
				local var_370_28 = Color.New(0, 0, 0)

				var_370_28.a = Mathf.Lerp(0, 1, var_370_27)
				arg_367_1.mask_.color = var_370_28
			end

			if arg_367_1.time_ >= var_370_25 + var_370_26 and arg_367_1.time_ < var_370_25 + var_370_26 + arg_370_0 then
				local var_370_29 = Color.New(0, 0, 0)

				var_370_29.a = 1
				arg_367_1.mask_.color = var_370_29
			end

			local var_370_30 = 2

			if var_370_30 < arg_367_1.time_ and arg_367_1.time_ <= var_370_30 + arg_370_0 then
				arg_367_1.mask_.enabled = true
				arg_367_1.mask_.raycastTarget = true

				arg_367_1:SetGaussion(false)
			end

			local var_370_31 = 2

			if var_370_30 <= arg_367_1.time_ and arg_367_1.time_ < var_370_30 + var_370_31 then
				local var_370_32 = (arg_367_1.time_ - var_370_30) / var_370_31
				local var_370_33 = Color.New(0, 0, 0)

				var_370_33.a = Mathf.Lerp(1, 0, var_370_32)
				arg_367_1.mask_.color = var_370_33
			end

			if arg_367_1.time_ >= var_370_30 + var_370_31 and arg_367_1.time_ < var_370_30 + var_370_31 + arg_370_0 then
				local var_370_34 = Color.New(0, 0, 0)
				local var_370_35 = 0

				arg_367_1.mask_.enabled = false
				var_370_34.a = var_370_35
				arg_367_1.mask_.color = var_370_34
			end

			local var_370_36 = arg_367_1.actors_["1011ui_story"].transform
			local var_370_37 = 3.8

			if var_370_37 < arg_367_1.time_ and arg_367_1.time_ <= var_370_37 + arg_370_0 then
				arg_367_1.var_.moveOldPos1011ui_story = var_370_36.localPosition
			end

			local var_370_38 = 0.001

			if var_370_37 <= arg_367_1.time_ and arg_367_1.time_ < var_370_37 + var_370_38 then
				local var_370_39 = (arg_367_1.time_ - var_370_37) / var_370_38
				local var_370_40 = Vector3.New(0, -0.71, -6)

				var_370_36.localPosition = Vector3.Lerp(arg_367_1.var_.moveOldPos1011ui_story, var_370_40, var_370_39)

				local var_370_41 = manager.ui.mainCamera.transform.position - var_370_36.position

				var_370_36.forward = Vector3.New(var_370_41.x, var_370_41.y, var_370_41.z)

				local var_370_42 = var_370_36.localEulerAngles

				var_370_42.z = 0
				var_370_42.x = 0
				var_370_36.localEulerAngles = var_370_42
			end

			if arg_367_1.time_ >= var_370_37 + var_370_38 and arg_367_1.time_ < var_370_37 + var_370_38 + arg_370_0 then
				var_370_36.localPosition = Vector3.New(0, -0.71, -6)

				local var_370_43 = manager.ui.mainCamera.transform.position - var_370_36.position

				var_370_36.forward = Vector3.New(var_370_43.x, var_370_43.y, var_370_43.z)

				local var_370_44 = var_370_36.localEulerAngles

				var_370_44.z = 0
				var_370_44.x = 0
				var_370_36.localEulerAngles = var_370_44
			end

			local var_370_45 = 3.8

			if var_370_45 < arg_367_1.time_ and arg_367_1.time_ <= var_370_45 + arg_370_0 then
				arg_367_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			if arg_367_1.frameCnt_ <= 1 then
				arg_367_1.dialog_:SetActive(false)
			end

			local var_370_46 = 4
			local var_370_47 = 1.075

			if var_370_46 < arg_367_1.time_ and arg_367_1.time_ <= var_370_46 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0

				arg_367_1.dialog_:SetActive(true)

				local var_370_48 = LeanTween.value(arg_367_1.dialog_, 0, 1, 0.3)

				var_370_48:setOnUpdate(LuaHelper.FloatAction(function(arg_371_0)
					arg_367_1.dialogCg_.alpha = arg_371_0
				end))
				var_370_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_367_1.dialog_)
					var_370_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_367_1.duration_ = arg_367_1.duration_ + 0.3

				SetActive(arg_367_1.leftNameGo_, false)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_49 = arg_367_1:GetWordFromCfg(1101101089)
				local var_370_50 = arg_367_1:FormatText(var_370_49.content)

				arg_367_1.text_.text = var_370_50

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_51 = 43
				local var_370_52 = utf8.len(var_370_50)
				local var_370_53 = var_370_51 <= 0 and var_370_47 or var_370_47 * (var_370_52 / var_370_51)

				if var_370_53 > 0 and var_370_47 < var_370_53 then
					arg_367_1.talkMaxDuration = var_370_53
					var_370_46 = var_370_46 + 0.3

					if var_370_53 + var_370_46 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_53 + var_370_46
					end
				end

				arg_367_1.text_.text = var_370_50
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_54 = var_370_46 + 0.3
			local var_370_55 = math.max(var_370_47, arg_367_1.talkMaxDuration)

			if var_370_54 <= arg_367_1.time_ and arg_367_1.time_ < var_370_54 + var_370_55 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_54) / var_370_55

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_54 + var_370_55 and arg_367_1.time_ < var_370_54 + var_370_55 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101090 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 1101101090
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play1101101091(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.9

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, false)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_2 = arg_373_1:GetWordFromCfg(1101101090)
				local var_376_3 = arg_373_1:FormatText(var_376_2.content)

				arg_373_1.text_.text = var_376_3

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_4 = 36
				local var_376_5 = utf8.len(var_376_3)
				local var_376_6 = var_376_4 <= 0 and var_376_1 or var_376_1 * (var_376_5 / var_376_4)

				if var_376_6 > 0 and var_376_1 < var_376_6 then
					arg_373_1.talkMaxDuration = var_376_6

					if var_376_6 + var_376_0 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_6 + var_376_0
					end
				end

				arg_373_1.text_.text = var_376_3
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)
				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_7 = math.max(var_376_1, arg_373_1.talkMaxDuration)

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_7 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_0) / var_376_7

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_0 + var_376_7 and arg_373_1.time_ < var_376_0 + var_376_7 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101091 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 1101101091
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play1101101092(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 0.875

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

				local var_380_2 = arg_377_1:GetWordFromCfg(1101101091)
				local var_380_3 = arg_377_1:FormatText(var_380_2.content)

				arg_377_1.text_.text = var_380_3

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_4 = 35
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
	Play1101101092 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 1101101092
		arg_381_1.duration_ = 2.166

		local var_381_0 = {
			zh = 2.166,
			ja = 1.233
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
				arg_381_0:Play1101101093(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["1011ui_story"].transform
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 then
				arg_381_1.var_.moveOldPos1011ui_story = var_384_0.localPosition
			end

			local var_384_2 = 0.001

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2
				local var_384_4 = Vector3.New(0, 100, 0)

				var_384_0.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos1011ui_story, var_384_4, var_384_3)

				local var_384_5 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_5.x, var_384_5.y, var_384_5.z)

				local var_384_6 = var_384_0.localEulerAngles

				var_384_6.z = 0
				var_384_6.x = 0
				var_384_0.localEulerAngles = var_384_6
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 then
				var_384_0.localPosition = Vector3.New(0, 100, 0)

				local var_384_7 = manager.ui.mainCamera.transform.position - var_384_0.position

				var_384_0.forward = Vector3.New(var_384_7.x, var_384_7.y, var_384_7.z)

				local var_384_8 = var_384_0.localEulerAngles

				var_384_8.z = 0
				var_384_8.x = 0
				var_384_0.localEulerAngles = var_384_8
			end

			local var_384_9 = 0
			local var_384_10 = 0.175

			if var_384_9 < arg_381_1.time_ and arg_381_1.time_ <= var_384_9 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_11 = arg_381_1:FormatText(StoryNameCfg[580].name)

				arg_381_1.leftNameTxt_.text = var_384_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, true)
				arg_381_1.iconController_:SetSelectedState("hero")

				arg_381_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_12 = arg_381_1:GetWordFromCfg(1101101092)
				local var_384_13 = arg_381_1:FormatText(var_384_12.content)

				arg_381_1.text_.text = var_384_13

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_14 = 7
				local var_384_15 = utf8.len(var_384_13)
				local var_384_16 = var_384_14 <= 0 and var_384_10 or var_384_10 * (var_384_15 / var_384_14)

				if var_384_16 > 0 and var_384_10 < var_384_16 then
					arg_381_1.talkMaxDuration = var_384_16

					if var_384_16 + var_384_9 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_16 + var_384_9
					end
				end

				arg_381_1.text_.text = var_384_13
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101092", "story_v_side_new_1101101.awb") ~= 0 then
					local var_384_17 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101092", "story_v_side_new_1101101.awb") / 1000

					if var_384_17 + var_384_9 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_17 + var_384_9
					end

					if var_384_12.prefab_name ~= "" and arg_381_1.actors_[var_384_12.prefab_name] ~= nil then
						local var_384_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_12.prefab_name].transform, "story_v_side_new_1101101", "1101101092", "story_v_side_new_1101101.awb")

						arg_381_1:RecordAudio("1101101092", var_384_18)
						arg_381_1:RecordAudio("1101101092", var_384_18)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101092", "story_v_side_new_1101101.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101092", "story_v_side_new_1101101.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_19 = math.max(var_384_10, arg_381_1.talkMaxDuration)

			if var_384_9 <= arg_381_1.time_ and arg_381_1.time_ < var_384_9 + var_384_19 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_9) / var_384_19

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_9 + var_384_19 and arg_381_1.time_ < var_384_9 + var_384_19 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101093 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 1101101093
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play1101101094(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 0.625

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_2 = arg_385_1:GetWordFromCfg(1101101093)
				local var_388_3 = arg_385_1:FormatText(var_388_2.content)

				arg_385_1.text_.text = var_388_3

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_4 = 25
				local var_388_5 = utf8.len(var_388_3)
				local var_388_6 = var_388_4 <= 0 and var_388_1 or var_388_1 * (var_388_5 / var_388_4)

				if var_388_6 > 0 and var_388_1 < var_388_6 then
					arg_385_1.talkMaxDuration = var_388_6

					if var_388_6 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_6 + var_388_0
					end
				end

				arg_385_1.text_.text = var_388_3
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_7 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_7 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_7

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_7 and arg_385_1.time_ < var_388_0 + var_388_7 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101094 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 1101101094
		arg_389_1.duration_ = 3.066

		local var_389_0 = {
			zh = 1.999999999999,
			ja = 3.066
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
				arg_389_0:Play1101101095(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1011ui_story"].transform
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 then
				arg_389_1.var_.moveOldPos1011ui_story = var_392_0.localPosition
			end

			local var_392_2 = 0.001

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2
				local var_392_4 = Vector3.New(0, -0.71, -6)

				var_392_0.localPosition = Vector3.Lerp(arg_389_1.var_.moveOldPos1011ui_story, var_392_4, var_392_3)

				local var_392_5 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_5.x, var_392_5.y, var_392_5.z)

				local var_392_6 = var_392_0.localEulerAngles

				var_392_6.z = 0
				var_392_6.x = 0
				var_392_0.localEulerAngles = var_392_6
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 then
				var_392_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_392_7 = manager.ui.mainCamera.transform.position - var_392_0.position

				var_392_0.forward = Vector3.New(var_392_7.x, var_392_7.y, var_392_7.z)

				local var_392_8 = var_392_0.localEulerAngles

				var_392_8.z = 0
				var_392_8.x = 0
				var_392_0.localEulerAngles = var_392_8
			end

			local var_392_9 = arg_389_1.actors_["1011ui_story"]
			local var_392_10 = 0

			if var_392_10 < arg_389_1.time_ and arg_389_1.time_ <= var_392_10 + arg_392_0 and arg_389_1.var_.characterEffect1011ui_story == nil then
				arg_389_1.var_.characterEffect1011ui_story = var_392_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_11 = 0.200000002980232

			if var_392_10 <= arg_389_1.time_ and arg_389_1.time_ < var_392_10 + var_392_11 then
				local var_392_12 = (arg_389_1.time_ - var_392_10) / var_392_11

				if arg_389_1.var_.characterEffect1011ui_story then
					arg_389_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_389_1.time_ >= var_392_10 + var_392_11 and arg_389_1.time_ < var_392_10 + var_392_11 + arg_392_0 and arg_389_1.var_.characterEffect1011ui_story then
				arg_389_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_392_13 = 0

			if var_392_13 < arg_389_1.time_ and arg_389_1.time_ <= var_392_13 + arg_392_0 then
				arg_389_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_392_14 = 0

			if var_392_14 < arg_389_1.time_ and arg_389_1.time_ <= var_392_14 + arg_392_0 then
				arg_389_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_392_15 = 0
			local var_392_16 = 0.125

			if var_392_15 < arg_389_1.time_ and arg_389_1.time_ <= var_392_15 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_17 = arg_389_1:FormatText(StoryNameCfg[37].name)

				arg_389_1.leftNameTxt_.text = var_392_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_18 = arg_389_1:GetWordFromCfg(1101101094)
				local var_392_19 = arg_389_1:FormatText(var_392_18.content)

				arg_389_1.text_.text = var_392_19

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_20 = 5
				local var_392_21 = utf8.len(var_392_19)
				local var_392_22 = var_392_20 <= 0 and var_392_16 or var_392_16 * (var_392_21 / var_392_20)

				if var_392_22 > 0 and var_392_16 < var_392_22 then
					arg_389_1.talkMaxDuration = var_392_22

					if var_392_22 + var_392_15 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_22 + var_392_15
					end
				end

				arg_389_1.text_.text = var_392_19
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101094", "story_v_side_new_1101101.awb") ~= 0 then
					local var_392_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101094", "story_v_side_new_1101101.awb") / 1000

					if var_392_23 + var_392_15 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_23 + var_392_15
					end

					if var_392_18.prefab_name ~= "" and arg_389_1.actors_[var_392_18.prefab_name] ~= nil then
						local var_392_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_18.prefab_name].transform, "story_v_side_new_1101101", "1101101094", "story_v_side_new_1101101.awb")

						arg_389_1:RecordAudio("1101101094", var_392_24)
						arg_389_1:RecordAudio("1101101094", var_392_24)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101094", "story_v_side_new_1101101.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101094", "story_v_side_new_1101101.awb")
				end

				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_25 = math.max(var_392_16, arg_389_1.talkMaxDuration)

			if var_392_15 <= arg_389_1.time_ and arg_389_1.time_ < var_392_15 + var_392_25 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_15) / var_392_25

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_15 + var_392_25 and arg_389_1.time_ < var_392_15 + var_392_25 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101095 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 1101101095
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play1101101096(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["1011ui_story"]
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 and arg_393_1.var_.characterEffect1011ui_story == nil then
				arg_393_1.var_.characterEffect1011ui_story = var_396_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_396_2 = 0.200000002980232

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_2 then
				local var_396_3 = (arg_393_1.time_ - var_396_1) / var_396_2

				if arg_393_1.var_.characterEffect1011ui_story then
					local var_396_4 = Mathf.Lerp(0, 0.5, var_396_3)

					arg_393_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_393_1.var_.characterEffect1011ui_story.fillRatio = var_396_4
				end
			end

			if arg_393_1.time_ >= var_396_1 + var_396_2 and arg_393_1.time_ < var_396_1 + var_396_2 + arg_396_0 and arg_393_1.var_.characterEffect1011ui_story then
				local var_396_5 = 0.5

				arg_393_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_393_1.var_.characterEffect1011ui_story.fillRatio = var_396_5
			end

			local var_396_6 = 0
			local var_396_7 = 0.175

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

				local var_396_9 = arg_393_1:GetWordFromCfg(1101101095)
				local var_396_10 = arg_393_1:FormatText(var_396_9.content)

				arg_393_1.text_.text = var_396_10

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_11 = 7
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
	Play1101101096 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 1101101096
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play1101101097(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 0.725

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, false)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_2 = arg_397_1:GetWordFromCfg(1101101096)
				local var_400_3 = arg_397_1:FormatText(var_400_2.content)

				arg_397_1.text_.text = var_400_3

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_4 = 29
				local var_400_5 = utf8.len(var_400_3)
				local var_400_6 = var_400_4 <= 0 and var_400_1 or var_400_1 * (var_400_5 / var_400_4)

				if var_400_6 > 0 and var_400_1 < var_400_6 then
					arg_397_1.talkMaxDuration = var_400_6

					if var_400_6 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_6 + var_400_0
					end
				end

				arg_397_1.text_.text = var_400_3
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_7 = math.max(var_400_1, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_7 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_0) / var_400_7

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_7 and arg_397_1.time_ < var_400_0 + var_400_7 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101097 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 1101101097
		arg_401_1.duration_ = 5

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play1101101098(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_404_1 = 0
			local var_404_2 = 0.85

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_3 = arg_401_1:GetWordFromCfg(1101101097)
				local var_404_4 = arg_401_1:FormatText(var_404_3.content)

				arg_401_1.text_.text = var_404_4

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_5 = 34
				local var_404_6 = utf8.len(var_404_4)
				local var_404_7 = var_404_5 <= 0 and var_404_2 or var_404_2 * (var_404_6 / var_404_5)

				if var_404_7 > 0 and var_404_2 < var_404_7 then
					arg_401_1.talkMaxDuration = var_404_7

					if var_404_7 + var_404_1 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_7 + var_404_1
					end
				end

				arg_401_1.text_.text = var_404_4
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_8 = math.max(var_404_2, arg_401_1.talkMaxDuration)

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_8 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_1) / var_404_8

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_1 + var_404_8 and arg_401_1.time_ < var_404_1 + var_404_8 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101098 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 1101101098
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play1101101099(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = 0
			local var_408_1 = 0.5

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

				local var_408_2 = arg_405_1:GetWordFromCfg(1101101098)
				local var_408_3 = arg_405_1:FormatText(var_408_2.content)

				arg_405_1.text_.text = var_408_3

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_4 = 20
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
	Play1101101099 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 1101101099
		arg_409_1.duration_ = 5

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play1101101100(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = 0
			local var_412_1 = 1.075

			if var_412_0 < arg_409_1.time_ and arg_409_1.time_ <= var_412_0 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_2 = arg_409_1:FormatText(StoryNameCfg[7].name)

				arg_409_1.leftNameTxt_.text = var_412_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_3 = arg_409_1:GetWordFromCfg(1101101099)
				local var_412_4 = arg_409_1:FormatText(var_412_3.content)

				arg_409_1.text_.text = var_412_4

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_5 = 43
				local var_412_6 = utf8.len(var_412_4)
				local var_412_7 = var_412_5 <= 0 and var_412_1 or var_412_1 * (var_412_6 / var_412_5)

				if var_412_7 > 0 and var_412_1 < var_412_7 then
					arg_409_1.talkMaxDuration = var_412_7

					if var_412_7 + var_412_0 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_7 + var_412_0
					end
				end

				arg_409_1.text_.text = var_412_4
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)
				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_8 = math.max(var_412_1, arg_409_1.talkMaxDuration)

			if var_412_0 <= arg_409_1.time_ and arg_409_1.time_ < var_412_0 + var_412_8 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_0) / var_412_8

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_0 + var_412_8 and arg_409_1.time_ < var_412_0 + var_412_8 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101100 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 1101101100
		arg_413_1.duration_ = 5.166

		local var_413_0 = {
			zh = 5,
			ja = 5.166
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
				arg_413_0:Play1101101101(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1011ui_story"].transform
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.var_.moveOldPos1011ui_story = var_416_0.localPosition
			end

			local var_416_2 = 0.001

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2
				local var_416_4 = Vector3.New(0, -0.71, -6)

				var_416_0.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1011ui_story, var_416_4, var_416_3)

				local var_416_5 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_5.x, var_416_5.y, var_416_5.z)

				local var_416_6 = var_416_0.localEulerAngles

				var_416_6.z = 0
				var_416_6.x = 0
				var_416_0.localEulerAngles = var_416_6
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 then
				var_416_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_416_7 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_7.x, var_416_7.y, var_416_7.z)

				local var_416_8 = var_416_0.localEulerAngles

				var_416_8.z = 0
				var_416_8.x = 0
				var_416_0.localEulerAngles = var_416_8
			end

			local var_416_9 = arg_413_1.actors_["1011ui_story"]
			local var_416_10 = 0

			if var_416_10 < arg_413_1.time_ and arg_413_1.time_ <= var_416_10 + arg_416_0 and arg_413_1.var_.characterEffect1011ui_story == nil then
				arg_413_1.var_.characterEffect1011ui_story = var_416_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_11 = 0.200000002980232

			if var_416_10 <= arg_413_1.time_ and arg_413_1.time_ < var_416_10 + var_416_11 then
				local var_416_12 = (arg_413_1.time_ - var_416_10) / var_416_11

				if arg_413_1.var_.characterEffect1011ui_story then
					arg_413_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_10 + var_416_11 and arg_413_1.time_ < var_416_10 + var_416_11 + arg_416_0 and arg_413_1.var_.characterEffect1011ui_story then
				arg_413_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_416_13 = 0

			if var_416_13 < arg_413_1.time_ and arg_413_1.time_ <= var_416_13 + arg_416_0 then
				arg_413_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_416_14 = 0
			local var_416_15 = 0.525

			if var_416_14 < arg_413_1.time_ and arg_413_1.time_ <= var_416_14 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_16 = arg_413_1:FormatText(StoryNameCfg[37].name)

				arg_413_1.leftNameTxt_.text = var_416_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_17 = arg_413_1:GetWordFromCfg(1101101100)
				local var_416_18 = arg_413_1:FormatText(var_416_17.content)

				arg_413_1.text_.text = var_416_18

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_19 = 21
				local var_416_20 = utf8.len(var_416_18)
				local var_416_21 = var_416_19 <= 0 and var_416_15 or var_416_15 * (var_416_20 / var_416_19)

				if var_416_21 > 0 and var_416_15 < var_416_21 then
					arg_413_1.talkMaxDuration = var_416_21

					if var_416_21 + var_416_14 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_21 + var_416_14
					end
				end

				arg_413_1.text_.text = var_416_18
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101100", "story_v_side_new_1101101.awb") ~= 0 then
					local var_416_22 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101100", "story_v_side_new_1101101.awb") / 1000

					if var_416_22 + var_416_14 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_22 + var_416_14
					end

					if var_416_17.prefab_name ~= "" and arg_413_1.actors_[var_416_17.prefab_name] ~= nil then
						local var_416_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_17.prefab_name].transform, "story_v_side_new_1101101", "1101101100", "story_v_side_new_1101101.awb")

						arg_413_1:RecordAudio("1101101100", var_416_23)
						arg_413_1:RecordAudio("1101101100", var_416_23)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101100", "story_v_side_new_1101101.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101100", "story_v_side_new_1101101.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_24 = math.max(var_416_15, arg_413_1.talkMaxDuration)

			if var_416_14 <= arg_413_1.time_ and arg_413_1.time_ < var_416_14 + var_416_24 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_14) / var_416_24

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_14 + var_416_24 and arg_413_1.time_ < var_416_14 + var_416_24 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101101 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 1101101101
		arg_417_1.duration_ = 5

		SetActive(arg_417_1.tipsGo_, false)

		function arg_417_1.onSingleLineFinish_()
			arg_417_1.onSingleLineUpdate_ = nil
			arg_417_1.onSingleLineFinish_ = nil
			arg_417_1.state_ = "waiting"
		end

		function arg_417_1.playNext_(arg_419_0)
			if arg_419_0 == 1 then
				arg_417_0:Play1101101102(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["1011ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect1011ui_story == nil then
				arg_417_1.var_.characterEffect1011ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.200000002980232

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect1011ui_story then
					local var_420_4 = Mathf.Lerp(0, 0.5, var_420_3)

					arg_417_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_417_1.var_.characterEffect1011ui_story.fillRatio = var_420_4
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect1011ui_story then
				local var_420_5 = 0.5

				arg_417_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_417_1.var_.characterEffect1011ui_story.fillRatio = var_420_5
			end

			local var_420_6 = 0
			local var_420_7 = 0.6

			if var_420_6 < arg_417_1.time_ and arg_417_1.time_ <= var_420_6 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_8 = arg_417_1:FormatText(StoryNameCfg[7].name)

				arg_417_1.leftNameTxt_.text = var_420_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_9 = arg_417_1:GetWordFromCfg(1101101101)
				local var_420_10 = arg_417_1:FormatText(var_420_9.content)

				arg_417_1.text_.text = var_420_10

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_11 = 24
				local var_420_12 = utf8.len(var_420_10)
				local var_420_13 = var_420_11 <= 0 and var_420_7 or var_420_7 * (var_420_12 / var_420_11)

				if var_420_13 > 0 and var_420_7 < var_420_13 then
					arg_417_1.talkMaxDuration = var_420_13

					if var_420_13 + var_420_6 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_13 + var_420_6
					end
				end

				arg_417_1.text_.text = var_420_10
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)
				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_14 = math.max(var_420_7, arg_417_1.talkMaxDuration)

			if var_420_6 <= arg_417_1.time_ and arg_417_1.time_ < var_420_6 + var_420_14 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_6) / var_420_14

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_6 + var_420_14 and arg_417_1.time_ < var_420_6 + var_420_14 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101102 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 1101101102
		arg_421_1.duration_ = 4.9

		local var_421_0 = {
			zh = 3.4,
			ja = 4.9
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
				arg_421_0:Play1101101103(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["1011ui_story"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos1011ui_story = var_424_0.localPosition
			end

			local var_424_2 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2
				local var_424_4 = Vector3.New(0, -0.71, -6)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos1011ui_story, var_424_4, var_424_3)

				local var_424_5 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_5.x, var_424_5.y, var_424_5.z)

				local var_424_6 = var_424_0.localEulerAngles

				var_424_6.z = 0
				var_424_6.x = 0
				var_424_0.localEulerAngles = var_424_6
			end

			if arg_421_1.time_ >= var_424_1 + var_424_2 and arg_421_1.time_ < var_424_1 + var_424_2 + arg_424_0 then
				var_424_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_424_7 = manager.ui.mainCamera.transform.position - var_424_0.position

				var_424_0.forward = Vector3.New(var_424_7.x, var_424_7.y, var_424_7.z)

				local var_424_8 = var_424_0.localEulerAngles

				var_424_8.z = 0
				var_424_8.x = 0
				var_424_0.localEulerAngles = var_424_8
			end

			local var_424_9 = arg_421_1.actors_["1011ui_story"]
			local var_424_10 = 0

			if var_424_10 < arg_421_1.time_ and arg_421_1.time_ <= var_424_10 + arg_424_0 and arg_421_1.var_.characterEffect1011ui_story == nil then
				arg_421_1.var_.characterEffect1011ui_story = var_424_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_11 = 0.200000002980232

			if var_424_10 <= arg_421_1.time_ and arg_421_1.time_ < var_424_10 + var_424_11 then
				local var_424_12 = (arg_421_1.time_ - var_424_10) / var_424_11

				if arg_421_1.var_.characterEffect1011ui_story then
					arg_421_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_421_1.time_ >= var_424_10 + var_424_11 and arg_421_1.time_ < var_424_10 + var_424_11 + arg_424_0 and arg_421_1.var_.characterEffect1011ui_story then
				arg_421_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_424_13 = 0
			local var_424_14 = 0.3

			if var_424_13 < arg_421_1.time_ and arg_421_1.time_ <= var_424_13 + arg_424_0 then
				local var_424_15 = "play"
				local var_424_16 = "music"

				arg_421_1:AudioAction(var_424_15, var_424_16, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_424_17 = 0
			local var_424_18 = 0.15

			if var_424_17 < arg_421_1.time_ and arg_421_1.time_ <= var_424_17 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_19 = arg_421_1:FormatText(StoryNameCfg[37].name)

				arg_421_1.leftNameTxt_.text = var_424_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_20 = arg_421_1:GetWordFromCfg(1101101102)
				local var_424_21 = arg_421_1:FormatText(var_424_20.content)

				arg_421_1.text_.text = var_424_21

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_22 = 6
				local var_424_23 = utf8.len(var_424_21)
				local var_424_24 = var_424_22 <= 0 and var_424_18 or var_424_18 * (var_424_23 / var_424_22)

				if var_424_24 > 0 and var_424_18 < var_424_24 then
					arg_421_1.talkMaxDuration = var_424_24

					if var_424_24 + var_424_17 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_24 + var_424_17
					end
				end

				arg_421_1.text_.text = var_424_21
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101102", "story_v_side_new_1101101.awb") ~= 0 then
					local var_424_25 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101102", "story_v_side_new_1101101.awb") / 1000

					if var_424_25 + var_424_17 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_25 + var_424_17
					end

					if var_424_20.prefab_name ~= "" and arg_421_1.actors_[var_424_20.prefab_name] ~= nil then
						local var_424_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_20.prefab_name].transform, "story_v_side_new_1101101", "1101101102", "story_v_side_new_1101101.awb")

						arg_421_1:RecordAudio("1101101102", var_424_26)
						arg_421_1:RecordAudio("1101101102", var_424_26)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101102", "story_v_side_new_1101101.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101102", "story_v_side_new_1101101.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_27 = math.max(var_424_18, arg_421_1.talkMaxDuration)

			if var_424_17 <= arg_421_1.time_ and arg_421_1.time_ < var_424_17 + var_424_27 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_17) / var_424_27

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_17 + var_424_27 and arg_421_1.time_ < var_424_17 + var_424_27 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101103 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 1101101103
		arg_425_1.duration_ = 5

		SetActive(arg_425_1.tipsGo_, false)

		function arg_425_1.onSingleLineFinish_()
			arg_425_1.onSingleLineUpdate_ = nil
			arg_425_1.onSingleLineFinish_ = nil
			arg_425_1.state_ = "waiting"
		end

		function arg_425_1.playNext_(arg_427_0)
			if arg_427_0 == 1 then
				arg_425_0:Play1101101104(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1011ui_story"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.characterEffect1011ui_story == nil then
				arg_425_1.var_.characterEffect1011ui_story = var_428_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_2 = 0.200000002980232

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.characterEffect1011ui_story then
					local var_428_4 = Mathf.Lerp(0, 0.5, var_428_3)

					arg_425_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_425_1.var_.characterEffect1011ui_story.fillRatio = var_428_4
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.characterEffect1011ui_story then
				local var_428_5 = 0.5

				arg_425_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_425_1.var_.characterEffect1011ui_story.fillRatio = var_428_5
			end

			local var_428_6 = 0
			local var_428_7 = 0.8

			if var_428_6 < arg_425_1.time_ and arg_425_1.time_ <= var_428_6 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, false)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_8 = arg_425_1:GetWordFromCfg(1101101103)
				local var_428_9 = arg_425_1:FormatText(var_428_8.content)

				arg_425_1.text_.text = var_428_9

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_10 = 32
				local var_428_11 = utf8.len(var_428_9)
				local var_428_12 = var_428_10 <= 0 and var_428_7 or var_428_7 * (var_428_11 / var_428_10)

				if var_428_12 > 0 and var_428_7 < var_428_12 then
					arg_425_1.talkMaxDuration = var_428_12

					if var_428_12 + var_428_6 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_12 + var_428_6
					end
				end

				arg_425_1.text_.text = var_428_9
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)
				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_13 = math.max(var_428_7, arg_425_1.talkMaxDuration)

			if var_428_6 <= arg_425_1.time_ and arg_425_1.time_ < var_428_6 + var_428_13 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_6) / var_428_13

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_6 + var_428_13 and arg_425_1.time_ < var_428_6 + var_428_13 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101104 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 1101101104
		arg_429_1.duration_ = 5

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play1101101107(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = 0
			local var_432_1 = 0.075

			if var_432_0 < arg_429_1.time_ and arg_429_1.time_ <= var_432_0 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_2 = arg_429_1:FormatText(StoryNameCfg[7].name)

				arg_429_1.leftNameTxt_.text = var_432_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_3 = arg_429_1:GetWordFromCfg(1101101104)
				local var_432_4 = arg_429_1:FormatText(var_432_3.content)

				arg_429_1.text_.text = var_432_4

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_5 = 3
				local var_432_6 = utf8.len(var_432_4)
				local var_432_7 = var_432_5 <= 0 and var_432_1 or var_432_1 * (var_432_6 / var_432_5)

				if var_432_7 > 0 and var_432_1 < var_432_7 then
					arg_429_1.talkMaxDuration = var_432_7

					if var_432_7 + var_432_0 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_7 + var_432_0
					end
				end

				arg_429_1.text_.text = var_432_4
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_8 = math.max(var_432_1, arg_429_1.talkMaxDuration)

			if var_432_0 <= arg_429_1.time_ and arg_429_1.time_ < var_432_0 + var_432_8 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_0) / var_432_8

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_0 + var_432_8 and arg_429_1.time_ < var_432_0 + var_432_8 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101107 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 1101101107
		arg_433_1.duration_ = 8.833

		local var_433_0 = {
			zh = 5.133,
			ja = 8.833
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
				arg_433_0:Play1101101108(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = 0

			if var_436_0 < arg_433_1.time_ and arg_433_1.time_ <= var_436_0 + arg_436_0 then
				arg_433_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_436_1 = 0
			local var_436_2 = 0.45

			if var_436_1 < arg_433_1.time_ and arg_433_1.time_ <= var_436_1 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_3 = arg_433_1:FormatText(StoryNameCfg[37].name)

				arg_433_1.leftNameTxt_.text = var_436_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_4 = arg_433_1:GetWordFromCfg(1101101107)
				local var_436_5 = arg_433_1:FormatText(var_436_4.content)

				arg_433_1.text_.text = var_436_5

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_6 = 18
				local var_436_7 = utf8.len(var_436_5)
				local var_436_8 = var_436_6 <= 0 and var_436_2 or var_436_2 * (var_436_7 / var_436_6)

				if var_436_8 > 0 and var_436_2 < var_436_8 then
					arg_433_1.talkMaxDuration = var_436_8

					if var_436_8 + var_436_1 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_8 + var_436_1
					end
				end

				arg_433_1.text_.text = var_436_5
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101107", "story_v_side_new_1101101.awb") ~= 0 then
					local var_436_9 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101107", "story_v_side_new_1101101.awb") / 1000

					if var_436_9 + var_436_1 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_9 + var_436_1
					end

					if var_436_4.prefab_name ~= "" and arg_433_1.actors_[var_436_4.prefab_name] ~= nil then
						local var_436_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_4.prefab_name].transform, "story_v_side_new_1101101", "1101101107", "story_v_side_new_1101101.awb")

						arg_433_1:RecordAudio("1101101107", var_436_10)
						arg_433_1:RecordAudio("1101101107", var_436_10)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101107", "story_v_side_new_1101101.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101107", "story_v_side_new_1101101.awb")
				end

				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_11 = math.max(var_436_2, arg_433_1.talkMaxDuration)

			if var_436_1 <= arg_433_1.time_ and arg_433_1.time_ < var_436_1 + var_436_11 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_1) / var_436_11

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_1 + var_436_11 and arg_433_1.time_ < var_436_1 + var_436_11 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101108 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 1101101108
		arg_437_1.duration_ = 0.999999999999

		SetActive(arg_437_1.tipsGo_, false)

		function arg_437_1.onSingleLineFinish_()
			arg_437_1.onSingleLineUpdate_ = nil
			arg_437_1.onSingleLineFinish_ = nil
			arg_437_1.state_ = "waiting"

			SetActive(arg_437_1.choicesGo_, true)

			for iter_438_0, iter_438_1 in ipairs(arg_437_1.choices_) do
				local var_438_0 = iter_438_0 <= 1

				SetActive(iter_438_1.go, var_438_0)
			end

			arg_437_1.choices_[1].txt.text = arg_437_1:FormatText(StoryChoiceCfg[608].name)
		end

		function arg_437_1.playNext_(arg_439_0)
			if arg_439_0 == 1 then
				arg_437_0:Play1101101109(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = arg_437_1.actors_["1011ui_story"]
			local var_440_1 = 0

			if var_440_1 < arg_437_1.time_ and arg_437_1.time_ <= var_440_1 + arg_440_0 and arg_437_1.var_.characterEffect1011ui_story == nil then
				arg_437_1.var_.characterEffect1011ui_story = var_440_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_440_2 = 0.200000002980232

			if var_440_1 <= arg_437_1.time_ and arg_437_1.time_ < var_440_1 + var_440_2 then
				local var_440_3 = (arg_437_1.time_ - var_440_1) / var_440_2

				if arg_437_1.var_.characterEffect1011ui_story then
					local var_440_4 = Mathf.Lerp(0, 0.5, var_440_3)

					arg_437_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_437_1.var_.characterEffect1011ui_story.fillRatio = var_440_4
				end
			end

			if arg_437_1.time_ >= var_440_1 + var_440_2 and arg_437_1.time_ < var_440_1 + var_440_2 + arg_440_0 and arg_437_1.var_.characterEffect1011ui_story then
				local var_440_5 = 0.5

				arg_437_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_437_1.var_.characterEffect1011ui_story.fillRatio = var_440_5
			end

			local var_440_6 = 0

			if var_440_6 < arg_437_1.time_ and arg_437_1.time_ <= var_440_6 + arg_440_0 then
				arg_437_1.allBtn_.enabled = false
			end

			local var_440_7 = 0.5

			if arg_437_1.time_ >= var_440_6 + var_440_7 and arg_437_1.time_ < var_440_6 + var_440_7 + arg_440_0 then
				arg_437_1.allBtn_.enabled = true
			end
		end
	end,
	Play1101101109 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 1101101109
		arg_441_1.duration_ = 3.166

		local var_441_0 = {
			zh = 2.066,
			ja = 3.166
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
				arg_441_0:Play1101101110(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = arg_441_1.actors_["1011ui_story"].transform
			local var_444_1 = 0

			if var_444_1 < arg_441_1.time_ and arg_441_1.time_ <= var_444_1 + arg_444_0 then
				arg_441_1.var_.moveOldPos1011ui_story = var_444_0.localPosition
			end

			local var_444_2 = 0.001

			if var_444_1 <= arg_441_1.time_ and arg_441_1.time_ < var_444_1 + var_444_2 then
				local var_444_3 = (arg_441_1.time_ - var_444_1) / var_444_2
				local var_444_4 = Vector3.New(0, -0.71, -6)

				var_444_0.localPosition = Vector3.Lerp(arg_441_1.var_.moveOldPos1011ui_story, var_444_4, var_444_3)

				local var_444_5 = manager.ui.mainCamera.transform.position - var_444_0.position

				var_444_0.forward = Vector3.New(var_444_5.x, var_444_5.y, var_444_5.z)

				local var_444_6 = var_444_0.localEulerAngles

				var_444_6.z = 0
				var_444_6.x = 0
				var_444_0.localEulerAngles = var_444_6
			end

			if arg_441_1.time_ >= var_444_1 + var_444_2 and arg_441_1.time_ < var_444_1 + var_444_2 + arg_444_0 then
				var_444_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_444_7 = manager.ui.mainCamera.transform.position - var_444_0.position

				var_444_0.forward = Vector3.New(var_444_7.x, var_444_7.y, var_444_7.z)

				local var_444_8 = var_444_0.localEulerAngles

				var_444_8.z = 0
				var_444_8.x = 0
				var_444_0.localEulerAngles = var_444_8
			end

			local var_444_9 = arg_441_1.actors_["1011ui_story"]
			local var_444_10 = 0

			if var_444_10 < arg_441_1.time_ and arg_441_1.time_ <= var_444_10 + arg_444_0 and arg_441_1.var_.characterEffect1011ui_story == nil then
				arg_441_1.var_.characterEffect1011ui_story = var_444_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_444_11 = 0.200000002980232

			if var_444_10 <= arg_441_1.time_ and arg_441_1.time_ < var_444_10 + var_444_11 then
				local var_444_12 = (arg_441_1.time_ - var_444_10) / var_444_11

				if arg_441_1.var_.characterEffect1011ui_story then
					arg_441_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_441_1.time_ >= var_444_10 + var_444_11 and arg_441_1.time_ < var_444_10 + var_444_11 + arg_444_0 and arg_441_1.var_.characterEffect1011ui_story then
				arg_441_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_444_13 = 0

			if var_444_13 < arg_441_1.time_ and arg_441_1.time_ <= var_444_13 + arg_444_0 then
				arg_441_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_444_14 = 0

			if var_444_14 < arg_441_1.time_ and arg_441_1.time_ <= var_444_14 + arg_444_0 then
				arg_441_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_444_15 = 0
			local var_444_16 = 0.2

			if var_444_15 < arg_441_1.time_ and arg_441_1.time_ <= var_444_15 + arg_444_0 then
				arg_441_1.talkMaxDuration = 0
				arg_441_1.dialogCg_.alpha = 1

				arg_441_1.dialog_:SetActive(true)
				SetActive(arg_441_1.leftNameGo_, true)

				local var_444_17 = arg_441_1:FormatText(StoryNameCfg[37].name)

				arg_441_1.leftNameTxt_.text = var_444_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_441_1.leftNameTxt_.transform)

				arg_441_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_441_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_441_1:RecordName(arg_441_1.leftNameTxt_.text)
				SetActive(arg_441_1.iconTrs_.gameObject, false)
				arg_441_1.callingController_:SetSelectedState("normal")

				local var_444_18 = arg_441_1:GetWordFromCfg(1101101109)
				local var_444_19 = arg_441_1:FormatText(var_444_18.content)

				arg_441_1.text_.text = var_444_19

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_20 = 8
				local var_444_21 = utf8.len(var_444_19)
				local var_444_22 = var_444_20 <= 0 and var_444_16 or var_444_16 * (var_444_21 / var_444_20)

				if var_444_22 > 0 and var_444_16 < var_444_22 then
					arg_441_1.talkMaxDuration = var_444_22

					if var_444_22 + var_444_15 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_22 + var_444_15
					end
				end

				arg_441_1.text_.text = var_444_19
				arg_441_1.typewritter.percent = 0

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101109", "story_v_side_new_1101101.awb") ~= 0 then
					local var_444_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101109", "story_v_side_new_1101101.awb") / 1000

					if var_444_23 + var_444_15 > arg_441_1.duration_ then
						arg_441_1.duration_ = var_444_23 + var_444_15
					end

					if var_444_18.prefab_name ~= "" and arg_441_1.actors_[var_444_18.prefab_name] ~= nil then
						local var_444_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_441_1.actors_[var_444_18.prefab_name].transform, "story_v_side_new_1101101", "1101101109", "story_v_side_new_1101101.awb")

						arg_441_1:RecordAudio("1101101109", var_444_24)
						arg_441_1:RecordAudio("1101101109", var_444_24)
					else
						arg_441_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101109", "story_v_side_new_1101101.awb")
					end

					arg_441_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101109", "story_v_side_new_1101101.awb")
				end

				arg_441_1:RecordContent(arg_441_1.text_.text)
			end

			local var_444_25 = math.max(var_444_16, arg_441_1.talkMaxDuration)

			if var_444_15 <= arg_441_1.time_ and arg_441_1.time_ < var_444_15 + var_444_25 then
				arg_441_1.typewritter.percent = (arg_441_1.time_ - var_444_15) / var_444_25

				arg_441_1.typewritter:SetDirty()
			end

			if arg_441_1.time_ >= var_444_15 + var_444_25 and arg_441_1.time_ < var_444_15 + var_444_25 + arg_444_0 then
				arg_441_1.typewritter.percent = 1

				arg_441_1.typewritter:SetDirty()
				arg_441_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101110 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 1101101110
		arg_445_1.duration_ = 5

		SetActive(arg_445_1.tipsGo_, false)

		function arg_445_1.onSingleLineFinish_()
			arg_445_1.onSingleLineUpdate_ = nil
			arg_445_1.onSingleLineFinish_ = nil
			arg_445_1.state_ = "waiting"
		end

		function arg_445_1.playNext_(arg_447_0)
			if arg_447_0 == 1 then
				arg_445_0:Play1101101111(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = arg_445_1.actors_["1011ui_story"]
			local var_448_1 = 0

			if var_448_1 < arg_445_1.time_ and arg_445_1.time_ <= var_448_1 + arg_448_0 and arg_445_1.var_.characterEffect1011ui_story == nil then
				arg_445_1.var_.characterEffect1011ui_story = var_448_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_448_2 = 0.200000002980232

			if var_448_1 <= arg_445_1.time_ and arg_445_1.time_ < var_448_1 + var_448_2 then
				local var_448_3 = (arg_445_1.time_ - var_448_1) / var_448_2

				if arg_445_1.var_.characterEffect1011ui_story then
					local var_448_4 = Mathf.Lerp(0, 0.5, var_448_3)

					arg_445_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_445_1.var_.characterEffect1011ui_story.fillRatio = var_448_4
				end
			end

			if arg_445_1.time_ >= var_448_1 + var_448_2 and arg_445_1.time_ < var_448_1 + var_448_2 + arg_448_0 and arg_445_1.var_.characterEffect1011ui_story then
				local var_448_5 = 0.5

				arg_445_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_445_1.var_.characterEffect1011ui_story.fillRatio = var_448_5
			end

			local var_448_6 = 0
			local var_448_7 = 0.525

			if var_448_6 < arg_445_1.time_ and arg_445_1.time_ <= var_448_6 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, false)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_8 = arg_445_1:GetWordFromCfg(1101101110)
				local var_448_9 = arg_445_1:FormatText(var_448_8.content)

				arg_445_1.text_.text = var_448_9

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_10 = 21
				local var_448_11 = utf8.len(var_448_9)
				local var_448_12 = var_448_10 <= 0 and var_448_7 or var_448_7 * (var_448_11 / var_448_10)

				if var_448_12 > 0 and var_448_7 < var_448_12 then
					arg_445_1.talkMaxDuration = var_448_12

					if var_448_12 + var_448_6 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_12 + var_448_6
					end
				end

				arg_445_1.text_.text = var_448_9
				arg_445_1.typewritter.percent = 0

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(false)
				arg_445_1:RecordContent(arg_445_1.text_.text)
			end

			local var_448_13 = math.max(var_448_7, arg_445_1.talkMaxDuration)

			if var_448_6 <= arg_445_1.time_ and arg_445_1.time_ < var_448_6 + var_448_13 then
				arg_445_1.typewritter.percent = (arg_445_1.time_ - var_448_6) / var_448_13

				arg_445_1.typewritter:SetDirty()
			end

			if arg_445_1.time_ >= var_448_6 + var_448_13 and arg_445_1.time_ < var_448_6 + var_448_13 + arg_448_0 then
				arg_445_1.typewritter.percent = 1

				arg_445_1.typewritter:SetDirty()
				arg_445_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101111 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 1101101111
		arg_449_1.duration_ = 5

		SetActive(arg_449_1.tipsGo_, false)

		function arg_449_1.onSingleLineFinish_()
			arg_449_1.onSingleLineUpdate_ = nil
			arg_449_1.onSingleLineFinish_ = nil
			arg_449_1.state_ = "waiting"
		end

		function arg_449_1.playNext_(arg_451_0)
			if arg_451_0 == 1 then
				arg_449_0:Play1101101112(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 0
			local var_452_1 = 0.825

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_2 = arg_449_1:FormatText(StoryNameCfg[7].name)

				arg_449_1.leftNameTxt_.text = var_452_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, false)
				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_3 = arg_449_1:GetWordFromCfg(1101101111)
				local var_452_4 = arg_449_1:FormatText(var_452_3.content)

				arg_449_1.text_.text = var_452_4

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_5 = 33
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
				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_8 = math.max(var_452_1, arg_449_1.talkMaxDuration)

			if var_452_0 <= arg_449_1.time_ and arg_449_1.time_ < var_452_0 + var_452_8 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_0) / var_452_8

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_0 + var_452_8 and arg_449_1.time_ < var_452_0 + var_452_8 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101112 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 1101101112
		arg_453_1.duration_ = 3.533

		local var_453_0 = {
			zh = 2.366,
			ja = 3.533
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
				arg_453_0:Play1101101113(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = arg_453_1.actors_["1011ui_story"].transform
			local var_456_1 = 0

			if var_456_1 < arg_453_1.time_ and arg_453_1.time_ <= var_456_1 + arg_456_0 then
				arg_453_1.var_.moveOldPos1011ui_story = var_456_0.localPosition
			end

			local var_456_2 = 0.001

			if var_456_1 <= arg_453_1.time_ and arg_453_1.time_ < var_456_1 + var_456_2 then
				local var_456_3 = (arg_453_1.time_ - var_456_1) / var_456_2
				local var_456_4 = Vector3.New(0, -0.71, -6)

				var_456_0.localPosition = Vector3.Lerp(arg_453_1.var_.moveOldPos1011ui_story, var_456_4, var_456_3)

				local var_456_5 = manager.ui.mainCamera.transform.position - var_456_0.position

				var_456_0.forward = Vector3.New(var_456_5.x, var_456_5.y, var_456_5.z)

				local var_456_6 = var_456_0.localEulerAngles

				var_456_6.z = 0
				var_456_6.x = 0
				var_456_0.localEulerAngles = var_456_6
			end

			if arg_453_1.time_ >= var_456_1 + var_456_2 and arg_453_1.time_ < var_456_1 + var_456_2 + arg_456_0 then
				var_456_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_456_7 = manager.ui.mainCamera.transform.position - var_456_0.position

				var_456_0.forward = Vector3.New(var_456_7.x, var_456_7.y, var_456_7.z)

				local var_456_8 = var_456_0.localEulerAngles

				var_456_8.z = 0
				var_456_8.x = 0
				var_456_0.localEulerAngles = var_456_8
			end

			local var_456_9 = arg_453_1.actors_["1011ui_story"]
			local var_456_10 = 0

			if var_456_10 < arg_453_1.time_ and arg_453_1.time_ <= var_456_10 + arg_456_0 and arg_453_1.var_.characterEffect1011ui_story == nil then
				arg_453_1.var_.characterEffect1011ui_story = var_456_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_456_11 = 0.200000002980232

			if var_456_10 <= arg_453_1.time_ and arg_453_1.time_ < var_456_10 + var_456_11 then
				local var_456_12 = (arg_453_1.time_ - var_456_10) / var_456_11

				if arg_453_1.var_.characterEffect1011ui_story then
					arg_453_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_453_1.time_ >= var_456_10 + var_456_11 and arg_453_1.time_ < var_456_10 + var_456_11 + arg_456_0 and arg_453_1.var_.characterEffect1011ui_story then
				arg_453_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_456_13 = 0

			if var_456_13 < arg_453_1.time_ and arg_453_1.time_ <= var_456_13 + arg_456_0 then
				arg_453_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_456_14 = 0

			if var_456_14 < arg_453_1.time_ and arg_453_1.time_ <= var_456_14 + arg_456_0 then
				arg_453_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_456_15 = 0
			local var_456_16 = 0.175

			if var_456_15 < arg_453_1.time_ and arg_453_1.time_ <= var_456_15 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, true)

				local var_456_17 = arg_453_1:FormatText(StoryNameCfg[37].name)

				arg_453_1.leftNameTxt_.text = var_456_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_453_1.leftNameTxt_.transform)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1.leftNameTxt_.text)
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_18 = arg_453_1:GetWordFromCfg(1101101112)
				local var_456_19 = arg_453_1:FormatText(var_456_18.content)

				arg_453_1.text_.text = var_456_19

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_20 = 7
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

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101112", "story_v_side_new_1101101.awb") ~= 0 then
					local var_456_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101112", "story_v_side_new_1101101.awb") / 1000

					if var_456_23 + var_456_15 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_23 + var_456_15
					end

					if var_456_18.prefab_name ~= "" and arg_453_1.actors_[var_456_18.prefab_name] ~= nil then
						local var_456_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_453_1.actors_[var_456_18.prefab_name].transform, "story_v_side_new_1101101", "1101101112", "story_v_side_new_1101101.awb")

						arg_453_1:RecordAudio("1101101112", var_456_24)
						arg_453_1:RecordAudio("1101101112", var_456_24)
					else
						arg_453_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101112", "story_v_side_new_1101101.awb")
					end

					arg_453_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101112", "story_v_side_new_1101101.awb")
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
	Play1101101113 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 1101101113
		arg_457_1.duration_ = 5

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play1101101114(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = arg_457_1.actors_["1011ui_story"]
			local var_460_1 = 0

			if var_460_1 < arg_457_1.time_ and arg_457_1.time_ <= var_460_1 + arg_460_0 and arg_457_1.var_.characterEffect1011ui_story == nil then
				arg_457_1.var_.characterEffect1011ui_story = var_460_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_460_2 = 0.200000002980232

			if var_460_1 <= arg_457_1.time_ and arg_457_1.time_ < var_460_1 + var_460_2 then
				local var_460_3 = (arg_457_1.time_ - var_460_1) / var_460_2

				if arg_457_1.var_.characterEffect1011ui_story then
					local var_460_4 = Mathf.Lerp(0, 0.5, var_460_3)

					arg_457_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_457_1.var_.characterEffect1011ui_story.fillRatio = var_460_4
				end
			end

			if arg_457_1.time_ >= var_460_1 + var_460_2 and arg_457_1.time_ < var_460_1 + var_460_2 + arg_460_0 and arg_457_1.var_.characterEffect1011ui_story then
				local var_460_5 = 0.5

				arg_457_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_457_1.var_.characterEffect1011ui_story.fillRatio = var_460_5
			end

			local var_460_6 = 0
			local var_460_7 = 0.15

			if var_460_6 < arg_457_1.time_ and arg_457_1.time_ <= var_460_6 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_8 = arg_457_1:FormatText(StoryNameCfg[7].name)

				arg_457_1.leftNameTxt_.text = var_460_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, false)
				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_9 = arg_457_1:GetWordFromCfg(1101101113)
				local var_460_10 = arg_457_1:FormatText(var_460_9.content)

				arg_457_1.text_.text = var_460_10

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_11 = 6
				local var_460_12 = utf8.len(var_460_10)
				local var_460_13 = var_460_11 <= 0 and var_460_7 or var_460_7 * (var_460_12 / var_460_11)

				if var_460_13 > 0 and var_460_7 < var_460_13 then
					arg_457_1.talkMaxDuration = var_460_13

					if var_460_13 + var_460_6 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_13 + var_460_6
					end
				end

				arg_457_1.text_.text = var_460_10
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)
				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_14 = math.max(var_460_7, arg_457_1.talkMaxDuration)

			if var_460_6 <= arg_457_1.time_ and arg_457_1.time_ < var_460_6 + var_460_14 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_6) / var_460_14

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_6 + var_460_14 and arg_457_1.time_ < var_460_6 + var_460_14 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101114 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 1101101114
		arg_461_1.duration_ = 1.999999999999

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play1101101115(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = arg_461_1.actors_["1011ui_story"].transform
			local var_464_1 = 0

			if var_464_1 < arg_461_1.time_ and arg_461_1.time_ <= var_464_1 + arg_464_0 then
				arg_461_1.var_.moveOldPos1011ui_story = var_464_0.localPosition
			end

			local var_464_2 = 0.001

			if var_464_1 <= arg_461_1.time_ and arg_461_1.time_ < var_464_1 + var_464_2 then
				local var_464_3 = (arg_461_1.time_ - var_464_1) / var_464_2
				local var_464_4 = Vector3.New(0, -0.71, -6)

				var_464_0.localPosition = Vector3.Lerp(arg_461_1.var_.moveOldPos1011ui_story, var_464_4, var_464_3)

				local var_464_5 = manager.ui.mainCamera.transform.position - var_464_0.position

				var_464_0.forward = Vector3.New(var_464_5.x, var_464_5.y, var_464_5.z)

				local var_464_6 = var_464_0.localEulerAngles

				var_464_6.z = 0
				var_464_6.x = 0
				var_464_0.localEulerAngles = var_464_6
			end

			if arg_461_1.time_ >= var_464_1 + var_464_2 and arg_461_1.time_ < var_464_1 + var_464_2 + arg_464_0 then
				var_464_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_464_7 = manager.ui.mainCamera.transform.position - var_464_0.position

				var_464_0.forward = Vector3.New(var_464_7.x, var_464_7.y, var_464_7.z)

				local var_464_8 = var_464_0.localEulerAngles

				var_464_8.z = 0
				var_464_8.x = 0
				var_464_0.localEulerAngles = var_464_8
			end

			local var_464_9 = arg_461_1.actors_["1011ui_story"]
			local var_464_10 = 0

			if var_464_10 < arg_461_1.time_ and arg_461_1.time_ <= var_464_10 + arg_464_0 and arg_461_1.var_.characterEffect1011ui_story == nil then
				arg_461_1.var_.characterEffect1011ui_story = var_464_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_464_11 = 0.200000002980232

			if var_464_10 <= arg_461_1.time_ and arg_461_1.time_ < var_464_10 + var_464_11 then
				local var_464_12 = (arg_461_1.time_ - var_464_10) / var_464_11

				if arg_461_1.var_.characterEffect1011ui_story then
					arg_461_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_461_1.time_ >= var_464_10 + var_464_11 and arg_461_1.time_ < var_464_10 + var_464_11 + arg_464_0 and arg_461_1.var_.characterEffect1011ui_story then
				arg_461_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_464_13 = 0

			if var_464_13 < arg_461_1.time_ and arg_461_1.time_ <= var_464_13 + arg_464_0 then
				arg_461_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/1011/1011action/1011action1_1")
			end

			local var_464_14 = 0

			if var_464_14 < arg_461_1.time_ and arg_461_1.time_ <= var_464_14 + arg_464_0 then
				arg_461_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1202cva")
			end

			local var_464_15 = 0
			local var_464_16 = 0.05

			if var_464_15 < arg_461_1.time_ and arg_461_1.time_ <= var_464_15 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, true)

				local var_464_17 = arg_461_1:FormatText(StoryNameCfg[37].name)

				arg_461_1.leftNameTxt_.text = var_464_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_461_1.leftNameTxt_.transform)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1.leftNameTxt_.text)
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_18 = arg_461_1:GetWordFromCfg(1101101114)
				local var_464_19 = arg_461_1:FormatText(var_464_18.content)

				arg_461_1.text_.text = var_464_19

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_20 = 2
				local var_464_21 = utf8.len(var_464_19)
				local var_464_22 = var_464_20 <= 0 and var_464_16 or var_464_16 * (var_464_21 / var_464_20)

				if var_464_22 > 0 and var_464_16 < var_464_22 then
					arg_461_1.talkMaxDuration = var_464_22

					if var_464_22 + var_464_15 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_22 + var_464_15
					end
				end

				arg_461_1.text_.text = var_464_19
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101114", "story_v_side_new_1101101.awb") ~= 0 then
					local var_464_23 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101114", "story_v_side_new_1101101.awb") / 1000

					if var_464_23 + var_464_15 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_23 + var_464_15
					end

					if var_464_18.prefab_name ~= "" and arg_461_1.actors_[var_464_18.prefab_name] ~= nil then
						local var_464_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_461_1.actors_[var_464_18.prefab_name].transform, "story_v_side_new_1101101", "1101101114", "story_v_side_new_1101101.awb")

						arg_461_1:RecordAudio("1101101114", var_464_24)
						arg_461_1:RecordAudio("1101101114", var_464_24)
					else
						arg_461_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101114", "story_v_side_new_1101101.awb")
					end

					arg_461_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101114", "story_v_side_new_1101101.awb")
				end

				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_25 = math.max(var_464_16, arg_461_1.talkMaxDuration)

			if var_464_15 <= arg_461_1.time_ and arg_461_1.time_ < var_464_15 + var_464_25 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_15) / var_464_25

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_15 + var_464_25 and arg_461_1.time_ < var_464_15 + var_464_25 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101115 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 1101101115
		arg_465_1.duration_ = 9.565999999999

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play1101101116(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = "ST01a"

			if arg_465_1.bgs_[var_468_0] == nil then
				local var_468_1 = Object.Instantiate(arg_465_1.paintGo_)

				var_468_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_468_0)
				var_468_1.name = var_468_0
				var_468_1.transform.parent = arg_465_1.stage_.transform
				var_468_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_465_1.bgs_[var_468_0] = var_468_1
			end

			local var_468_2 = 2

			if var_468_2 < arg_465_1.time_ and arg_465_1.time_ <= var_468_2 + arg_468_0 then
				local var_468_3 = manager.ui.mainCamera.transform.localPosition
				local var_468_4 = Vector3.New(0, 0, 10) + Vector3.New(var_468_3.x, var_468_3.y, 0)
				local var_468_5 = arg_465_1.bgs_.ST01a

				var_468_5.transform.localPosition = var_468_4
				var_468_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_468_6 = var_468_5:GetComponent("SpriteRenderer")

				if var_468_6 and var_468_6.sprite then
					local var_468_7 = (var_468_5.transform.localPosition - var_468_3).z
					local var_468_8 = manager.ui.mainCameraCom_
					local var_468_9 = 2 * var_468_7 * Mathf.Tan(var_468_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_468_10 = var_468_9 * var_468_8.aspect
					local var_468_11 = var_468_6.sprite.bounds.size.x
					local var_468_12 = var_468_6.sprite.bounds.size.y
					local var_468_13 = var_468_10 / var_468_11
					local var_468_14 = var_468_9 / var_468_12
					local var_468_15 = var_468_14 < var_468_13 and var_468_13 or var_468_14

					var_468_5.transform.localScale = Vector3.New(var_468_15, var_468_15, 0)
				end

				for iter_468_0, iter_468_1 in pairs(arg_465_1.bgs_) do
					if iter_468_0 ~= "ST01a" then
						iter_468_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_468_16 = 0

			if var_468_16 < arg_465_1.time_ and arg_465_1.time_ <= var_468_16 + arg_468_0 then
				arg_465_1.mask_.enabled = true
				arg_465_1.mask_.raycastTarget = true

				arg_465_1:SetGaussion(false)
			end

			local var_468_17 = 2

			if var_468_16 <= arg_465_1.time_ and arg_465_1.time_ < var_468_16 + var_468_17 then
				local var_468_18 = (arg_465_1.time_ - var_468_16) / var_468_17
				local var_468_19 = Color.New(0, 0, 0)

				var_468_19.a = Mathf.Lerp(0, 1, var_468_18)
				arg_465_1.mask_.color = var_468_19
			end

			if arg_465_1.time_ >= var_468_16 + var_468_17 and arg_465_1.time_ < var_468_16 + var_468_17 + arg_468_0 then
				local var_468_20 = Color.New(0, 0, 0)

				var_468_20.a = 1
				arg_465_1.mask_.color = var_468_20
			end

			local var_468_21 = 2

			if var_468_21 < arg_465_1.time_ and arg_465_1.time_ <= var_468_21 + arg_468_0 then
				arg_465_1.mask_.enabled = true
				arg_465_1.mask_.raycastTarget = true

				arg_465_1:SetGaussion(false)
			end

			local var_468_22 = 2

			if var_468_21 <= arg_465_1.time_ and arg_465_1.time_ < var_468_21 + var_468_22 then
				local var_468_23 = (arg_465_1.time_ - var_468_21) / var_468_22
				local var_468_24 = Color.New(0, 0, 0)

				var_468_24.a = Mathf.Lerp(1, 0, var_468_23)
				arg_465_1.mask_.color = var_468_24
			end

			if arg_465_1.time_ >= var_468_21 + var_468_22 and arg_465_1.time_ < var_468_21 + var_468_22 + arg_468_0 then
				local var_468_25 = Color.New(0, 0, 0)
				local var_468_26 = 0

				arg_465_1.mask_.enabled = false
				var_468_25.a = var_468_26
				arg_465_1.mask_.color = var_468_25
			end

			local var_468_27 = arg_465_1.actors_["1011ui_story"].transform
			local var_468_28 = 2

			if var_468_28 < arg_465_1.time_ and arg_465_1.time_ <= var_468_28 + arg_468_0 then
				arg_465_1.var_.moveOldPos1011ui_story = var_468_27.localPosition
			end

			local var_468_29 = 0.001

			if var_468_28 <= arg_465_1.time_ and arg_465_1.time_ < var_468_28 + var_468_29 then
				local var_468_30 = (arg_465_1.time_ - var_468_28) / var_468_29
				local var_468_31 = Vector3.New(0, 100, 0)

				var_468_27.localPosition = Vector3.Lerp(arg_465_1.var_.moveOldPos1011ui_story, var_468_31, var_468_30)

				local var_468_32 = manager.ui.mainCamera.transform.position - var_468_27.position

				var_468_27.forward = Vector3.New(var_468_32.x, var_468_32.y, var_468_32.z)

				local var_468_33 = var_468_27.localEulerAngles

				var_468_33.z = 0
				var_468_33.x = 0
				var_468_27.localEulerAngles = var_468_33
			end

			if arg_465_1.time_ >= var_468_28 + var_468_29 and arg_465_1.time_ < var_468_28 + var_468_29 + arg_468_0 then
				var_468_27.localPosition = Vector3.New(0, 100, 0)

				local var_468_34 = manager.ui.mainCamera.transform.position - var_468_27.position

				var_468_27.forward = Vector3.New(var_468_34.x, var_468_34.y, var_468_34.z)

				local var_468_35 = var_468_27.localEulerAngles

				var_468_35.z = 0
				var_468_35.x = 0
				var_468_27.localEulerAngles = var_468_35
			end

			local var_468_36 = 2

			if var_468_36 < arg_465_1.time_ and arg_465_1.time_ <= var_468_36 + arg_468_0 then
				arg_465_1.fswbg_:SetActive(true)
				arg_465_1.dialog_:SetActive(false)

				arg_465_1.fswtw_.percent = 0

				local var_468_37 = arg_465_1:GetWordFromCfg(1101101115)
				local var_468_38 = arg_465_1:FormatText(var_468_37.content)

				arg_465_1.fswt_.text = var_468_38

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.fswt_)

				arg_465_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_465_1.fswtw_:SetDirty()

				arg_465_1.typewritterCharCountI18N = 0

				SetActive(arg_465_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_465_1:ShowNextGo(false)
			end

			local var_468_39 = 4

			if var_468_39 < arg_465_1.time_ and arg_465_1.time_ <= var_468_39 + arg_468_0 then
				arg_465_1.var_.oldValueTypewriter = arg_465_1.fswtw_.percent

				arg_465_1:ShowNextGo(false)
			end

			local var_468_40 = 20
			local var_468_41 = 1.33333333333333
			local var_468_42 = arg_465_1:GetWordFromCfg(1101101115)
			local var_468_43 = arg_465_1:FormatText(var_468_42.content)
			local var_468_44, var_468_45 = arg_465_1:GetPercentByPara(var_468_43, 1)

			if var_468_39 < arg_465_1.time_ and arg_465_1.time_ <= var_468_39 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0

				local var_468_46 = var_468_40 <= 0 and var_468_41 or var_468_41 * ((var_468_45 - arg_465_1.typewritterCharCountI18N) / var_468_40)

				if var_468_46 > 0 and var_468_41 < var_468_46 then
					arg_465_1.talkMaxDuration = var_468_46

					if var_468_46 + var_468_39 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_46 + var_468_39
					end
				end
			end

			local var_468_47 = 1.33333333333333
			local var_468_48 = math.max(var_468_47, arg_465_1.talkMaxDuration)

			if var_468_39 <= arg_465_1.time_ and arg_465_1.time_ < var_468_39 + var_468_48 then
				local var_468_49 = (arg_465_1.time_ - var_468_39) / var_468_48

				arg_465_1.fswtw_.percent = Mathf.Lerp(arg_465_1.var_.oldValueTypewriter, var_468_44, var_468_49)
				arg_465_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_465_1.fswtw_:SetDirty()
			end

			if arg_465_1.time_ >= var_468_39 + var_468_48 and arg_465_1.time_ < var_468_39 + var_468_48 + arg_468_0 then
				arg_465_1.fswtw_.percent = var_468_44

				arg_465_1.fswtw_:SetDirty()
				arg_465_1:ShowNextGo(true)

				arg_465_1.typewritterCharCountI18N = var_468_45
			end

			local var_468_50 = 4

			if var_468_50 < arg_465_1.time_ and arg_465_1.time_ <= var_468_50 + arg_468_0 then
				local var_468_51 = arg_465_1.fswbg_.transform:Find("textbox/adapt/content") or arg_465_1.fswbg_.transform:Find("textbox/content")
				local var_468_52 = var_468_51:GetComponent("Text")
				local var_468_53 = var_468_51:GetComponent("RectTransform")

				var_468_52.alignment = UnityEngine.TextAnchor.UpperLeft
				var_468_53.offsetMin = Vector2.New(0, 0)
				var_468_53.offsetMax = Vector2.New(0, 0)
			end

			local var_468_54 = 4
			local var_468_55 = 5.566
			local var_468_56 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101115", "story_v_side_new_1101101.awb") / 1000

			if var_468_56 > 0 and var_468_55 < var_468_56 and var_468_56 + var_468_54 > arg_465_1.duration_ then
				local var_468_57 = var_468_56

				arg_465_1.duration_ = var_468_56 + var_468_54
			end

			if var_468_54 < arg_465_1.time_ and arg_465_1.time_ <= var_468_54 + arg_468_0 then
				local var_468_58 = "play"
				local var_468_59 = "voice"

				arg_465_1:AudioAction(var_468_58, var_468_59, "story_v_side_new_1101101", "1101101115", "story_v_side_new_1101101.awb")
			end

			local var_468_60 = 0
			local var_468_61 = 0.3

			if var_468_60 < arg_465_1.time_ and arg_465_1.time_ <= var_468_60 + arg_468_0 then
				local var_468_62 = "play"
				local var_468_63 = "music"

				arg_465_1:AudioAction(var_468_62, var_468_63, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_468_64 = 0.533333333333333
			local var_468_65 = 1

			if var_468_64 < arg_465_1.time_ and arg_465_1.time_ <= var_468_64 + arg_468_0 then
				local var_468_66 = "play"
				local var_468_67 = "music"

				arg_465_1:AudioAction(var_468_66, var_468_67, "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui", "bgm_activity_1_0_1_osiris_ui.awb")
			end
		end
	end,
	Play1101101116 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 1101101116
		arg_469_1.duration_ = 4.732999999999

		SetActive(arg_469_1.tipsGo_, false)

		function arg_469_1.onSingleLineFinish_()
			arg_469_1.onSingleLineUpdate_ = nil
			arg_469_1.onSingleLineFinish_ = nil
			arg_469_1.state_ = "waiting"
		end

		function arg_469_1.playNext_(arg_471_0)
			if arg_471_0 == 1 then
				arg_469_0:Play1101101117(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = 0

			if var_472_0 < arg_469_1.time_ and arg_469_1.time_ <= var_472_0 + arg_472_0 then
				arg_469_1.var_.oldValueTypewriter = arg_469_1.fswtw_.percent

				arg_469_1:ShowNextGo(false)
			end

			local var_472_1 = 20
			local var_472_2 = 1.33333333333333
			local var_472_3 = arg_469_1:GetWordFromCfg(1101101115)
			local var_472_4 = arg_469_1:FormatText(var_472_3.content)
			local var_472_5, var_472_6 = arg_469_1:GetPercentByPara(var_472_4, 2)

			if var_472_0 < arg_469_1.time_ and arg_469_1.time_ <= var_472_0 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0

				local var_472_7 = var_472_1 <= 0 and var_472_2 or var_472_2 * ((var_472_6 - arg_469_1.typewritterCharCountI18N) / var_472_1)

				if var_472_7 > 0 and var_472_2 < var_472_7 then
					arg_469_1.talkMaxDuration = var_472_7

					if var_472_7 + var_472_0 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_7 + var_472_0
					end
				end
			end

			local var_472_8 = 1.33333333333333
			local var_472_9 = math.max(var_472_8, arg_469_1.talkMaxDuration)

			if var_472_0 <= arg_469_1.time_ and arg_469_1.time_ < var_472_0 + var_472_9 then
				local var_472_10 = (arg_469_1.time_ - var_472_0) / var_472_9

				arg_469_1.fswtw_.percent = Mathf.Lerp(arg_469_1.var_.oldValueTypewriter, var_472_5, var_472_10)
				arg_469_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_469_1.fswtw_:SetDirty()
			end

			if arg_469_1.time_ >= var_472_0 + var_472_9 and arg_469_1.time_ < var_472_0 + var_472_9 + arg_472_0 then
				arg_469_1.fswtw_.percent = var_472_5

				arg_469_1.fswtw_:SetDirty()
				arg_469_1:ShowNextGo(true)

				arg_469_1.typewritterCharCountI18N = var_472_6
			end

			local var_472_11 = 0
			local var_472_12 = 4.733
			local var_472_13 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101116", "story_v_side_new_1101101.awb") / 1000

			if var_472_13 > 0 and var_472_12 < var_472_13 and var_472_13 + var_472_11 > arg_469_1.duration_ then
				local var_472_14 = var_472_13

				arg_469_1.duration_ = var_472_13 + var_472_11
			end

			if var_472_11 < arg_469_1.time_ and arg_469_1.time_ <= var_472_11 + arg_472_0 then
				local var_472_15 = "play"
				local var_472_16 = "voice"

				arg_469_1:AudioAction(var_472_15, var_472_16, "story_v_side_new_1101101", "1101101116", "story_v_side_new_1101101.awb")
			end
		end
	end,
	Play1101101117 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 1101101117
		arg_473_1.duration_ = 3.365999999999

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play1101101118(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = 0

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1.var_.oldValueTypewriter = arg_473_1.fswtw_.percent

				arg_473_1:ShowNextGo(false)
			end

			local var_476_1 = 12
			local var_476_2 = 0.8
			local var_476_3 = arg_473_1:GetWordFromCfg(1101101115)
			local var_476_4 = arg_473_1:FormatText(var_476_3.content)
			local var_476_5, var_476_6 = arg_473_1:GetPercentByPara(var_476_4, 3)

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0

				local var_476_7 = var_476_1 <= 0 and var_476_2 or var_476_2 * ((var_476_6 - arg_473_1.typewritterCharCountI18N) / var_476_1)

				if var_476_7 > 0 and var_476_2 < var_476_7 then
					arg_473_1.talkMaxDuration = var_476_7

					if var_476_7 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_7 + var_476_0
					end
				end
			end

			local var_476_8 = 0.8
			local var_476_9 = math.max(var_476_8, arg_473_1.talkMaxDuration)

			if var_476_0 <= arg_473_1.time_ and arg_473_1.time_ < var_476_0 + var_476_9 then
				local var_476_10 = (arg_473_1.time_ - var_476_0) / var_476_9

				arg_473_1.fswtw_.percent = Mathf.Lerp(arg_473_1.var_.oldValueTypewriter, var_476_5, var_476_10)
				arg_473_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_473_1.fswtw_:SetDirty()
			end

			if arg_473_1.time_ >= var_476_0 + var_476_9 and arg_473_1.time_ < var_476_0 + var_476_9 + arg_476_0 then
				arg_473_1.fswtw_.percent = var_476_5

				arg_473_1.fswtw_:SetDirty()
				arg_473_1:ShowNextGo(true)

				arg_473_1.typewritterCharCountI18N = var_476_6
			end

			local var_476_11 = 0
			local var_476_12 = 3.366
			local var_476_13 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101117", "story_v_side_new_1101101.awb") / 1000

			if var_476_13 > 0 and var_476_12 < var_476_13 and var_476_13 + var_476_11 > arg_473_1.duration_ then
				local var_476_14 = var_476_13

				arg_473_1.duration_ = var_476_13 + var_476_11
			end

			if var_476_11 < arg_473_1.time_ and arg_473_1.time_ <= var_476_11 + arg_476_0 then
				local var_476_15 = "play"
				local var_476_16 = "voice"

				arg_473_1:AudioAction(var_476_15, var_476_16, "story_v_side_new_1101101", "1101101117", "story_v_side_new_1101101.awb")
			end
		end
	end,
	Play1101101118 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 1101101118
		arg_477_1.duration_ = 6.165999999999

		SetActive(arg_477_1.tipsGo_, false)

		function arg_477_1.onSingleLineFinish_()
			arg_477_1.onSingleLineUpdate_ = nil
			arg_477_1.onSingleLineFinish_ = nil
			arg_477_1.state_ = "waiting"
		end

		function arg_477_1.playNext_(arg_479_0)
			if arg_479_0 == 1 then
				arg_477_0:Play1101101119(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1.var_.oldValueTypewriter = arg_477_1.fswtw_.percent

				arg_477_1:ShowNextGo(false)
			end

			local var_480_1 = 15
			local var_480_2 = 1
			local var_480_3 = arg_477_1:GetWordFromCfg(1101101115)
			local var_480_4 = arg_477_1:FormatText(var_480_3.content)
			local var_480_5, var_480_6 = arg_477_1:GetPercentByPara(var_480_4, 4)

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0

				local var_480_7 = var_480_1 <= 0 and var_480_2 or var_480_2 * ((var_480_6 - arg_477_1.typewritterCharCountI18N) / var_480_1)

				if var_480_7 > 0 and var_480_2 < var_480_7 then
					arg_477_1.talkMaxDuration = var_480_7

					if var_480_7 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_7 + var_480_0
					end
				end
			end

			local var_480_8 = 1
			local var_480_9 = math.max(var_480_8, arg_477_1.talkMaxDuration)

			if var_480_0 <= arg_477_1.time_ and arg_477_1.time_ < var_480_0 + var_480_9 then
				local var_480_10 = (arg_477_1.time_ - var_480_0) / var_480_9

				arg_477_1.fswtw_.percent = Mathf.Lerp(arg_477_1.var_.oldValueTypewriter, var_480_5, var_480_10)
				arg_477_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_477_1.fswtw_:SetDirty()
			end

			if arg_477_1.time_ >= var_480_0 + var_480_9 and arg_477_1.time_ < var_480_0 + var_480_9 + arg_480_0 then
				arg_477_1.fswtw_.percent = var_480_5

				arg_477_1.fswtw_:SetDirty()
				arg_477_1:ShowNextGo(true)

				arg_477_1.typewritterCharCountI18N = var_480_6
			end

			local var_480_11 = 0
			local var_480_12 = 6.166
			local var_480_13 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101118", "story_v_side_new_1101101.awb") / 1000

			if var_480_13 > 0 and var_480_12 < var_480_13 and var_480_13 + var_480_11 > arg_477_1.duration_ then
				local var_480_14 = var_480_13

				arg_477_1.duration_ = var_480_13 + var_480_11
			end

			if var_480_11 < arg_477_1.time_ and arg_477_1.time_ <= var_480_11 + arg_480_0 then
				local var_480_15 = "play"
				local var_480_16 = "voice"

				arg_477_1:AudioAction(var_480_15, var_480_16, "story_v_side_new_1101101", "1101101118", "story_v_side_new_1101101.awb")
			end
		end
	end,
	Play1101101119 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 1101101119
		arg_481_1.duration_ = 0.999999999999

		SetActive(arg_481_1.tipsGo_, false)

		function arg_481_1.onSingleLineFinish_()
			arg_481_1.onSingleLineUpdate_ = nil
			arg_481_1.onSingleLineFinish_ = nil
			arg_481_1.state_ = "waiting"
		end

		function arg_481_1.playNext_(arg_483_0)
			if arg_483_0 == 1 then
				arg_481_0:Play1101101120(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 0

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				arg_481_1.var_.oldValueTypewriter = arg_481_1.fswtw_.percent

				arg_481_1:ShowNextGo(false)
			end

			local var_484_1 = 2
			local var_484_2 = 0.133333333333333
			local var_484_3 = arg_481_1:GetWordFromCfg(1101101115)
			local var_484_4 = arg_481_1:FormatText(var_484_3.content)
			local var_484_5, var_484_6 = arg_481_1:GetPercentByPara(var_484_4, 5)

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0

				local var_484_7 = var_484_1 <= 0 and var_484_2 or var_484_2 * ((var_484_6 - arg_481_1.typewritterCharCountI18N) / var_484_1)

				if var_484_7 > 0 and var_484_2 < var_484_7 then
					arg_481_1.talkMaxDuration = var_484_7

					if var_484_7 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_7 + var_484_0
					end
				end
			end

			local var_484_8 = 0.133333333333333
			local var_484_9 = math.max(var_484_8, arg_481_1.talkMaxDuration)

			if var_484_0 <= arg_481_1.time_ and arg_481_1.time_ < var_484_0 + var_484_9 then
				local var_484_10 = (arg_481_1.time_ - var_484_0) / var_484_9

				arg_481_1.fswtw_.percent = Mathf.Lerp(arg_481_1.var_.oldValueTypewriter, var_484_5, var_484_10)
				arg_481_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_481_1.fswtw_:SetDirty()
			end

			if arg_481_1.time_ >= var_484_0 + var_484_9 and arg_481_1.time_ < var_484_0 + var_484_9 + arg_484_0 then
				arg_481_1.fswtw_.percent = var_484_5

				arg_481_1.fswtw_:SetDirty()
				arg_481_1:ShowNextGo(true)

				arg_481_1.typewritterCharCountI18N = var_484_6
			end
		end
	end,
	Play1101101120 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 1101101120
		arg_485_1.duration_ = 5.733

		local var_485_0 = {
			zh = 5.733,
			ja = 0.999999999999
		}
		local var_485_1 = manager.audio:GetLocalizationFlag()

		if var_485_0[var_485_1] ~= nil then
			arg_485_1.duration_ = var_485_0[var_485_1]
		end

		SetActive(arg_485_1.tipsGo_, false)

		function arg_485_1.onSingleLineFinish_()
			arg_485_1.onSingleLineUpdate_ = nil
			arg_485_1.onSingleLineFinish_ = nil
			arg_485_1.state_ = "waiting"
		end

		function arg_485_1.playNext_(arg_487_0)
			if arg_487_0 == 1 then
				arg_485_0:Play1101101121(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.fswbg_:SetActive(false)
				arg_485_1.dialog_:SetActive(true)
				arg_485_1:ShowNextGo(false)
			end

			local var_488_1 = 0
			local var_488_2 = 0.05

			if var_488_1 < arg_485_1.time_ and arg_485_1.time_ <= var_488_1 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_3 = arg_485_1:FormatText(StoryNameCfg[37].name)

				arg_485_1.leftNameTxt_.text = var_488_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, true)
				arg_485_1.iconController_:SetSelectedState("hero")

				arg_485_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_4 = arg_485_1:GetWordFromCfg(1101101120)
				local var_488_5 = arg_485_1:FormatText(var_488_4.content)

				arg_485_1.text_.text = var_488_5

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_6 = 2
				local var_488_7 = utf8.len(var_488_5)
				local var_488_8 = var_488_6 <= 0 and var_488_2 or var_488_2 * (var_488_7 / var_488_6)

				if var_488_8 > 0 and var_488_2 < var_488_8 then
					arg_485_1.talkMaxDuration = var_488_8

					if var_488_8 + var_488_1 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_8 + var_488_1
					end
				end

				arg_485_1.text_.text = var_488_5
				arg_485_1.typewritter.percent = 0

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101120", "story_v_side_new_1101101.awb") ~= 0 then
					local var_488_9 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101120", "story_v_side_new_1101101.awb") / 1000

					if var_488_9 + var_488_1 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_9 + var_488_1
					end

					if var_488_4.prefab_name ~= "" and arg_485_1.actors_[var_488_4.prefab_name] ~= nil then
						local var_488_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_4.prefab_name].transform, "story_v_side_new_1101101", "1101101120", "story_v_side_new_1101101.awb")

						arg_485_1:RecordAudio("1101101120", var_488_10)
						arg_485_1:RecordAudio("1101101120", var_488_10)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101120", "story_v_side_new_1101101.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101120", "story_v_side_new_1101101.awb")
				end

				arg_485_1:RecordContent(arg_485_1.text_.text)
			end

			local var_488_11 = math.max(var_488_2, arg_485_1.talkMaxDuration)

			if var_488_1 <= arg_485_1.time_ and arg_485_1.time_ < var_488_1 + var_488_11 then
				arg_485_1.typewritter.percent = (arg_485_1.time_ - var_488_1) / var_488_11

				arg_485_1.typewritter:SetDirty()
			end

			if arg_485_1.time_ >= var_488_1 + var_488_11 and arg_485_1.time_ < var_488_1 + var_488_11 + arg_488_0 then
				arg_485_1.typewritter.percent = 1

				arg_485_1.typewritter:SetDirty()
				arg_485_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101121 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 1101101121
		arg_489_1.duration_ = 3.766

		local var_489_0 = {
			zh = 2,
			ja = 3.766
		}
		local var_489_1 = manager.audio:GetLocalizationFlag()

		if var_489_0[var_489_1] ~= nil then
			arg_489_1.duration_ = var_489_0[var_489_1]
		end

		SetActive(arg_489_1.tipsGo_, false)

		function arg_489_1.onSingleLineFinish_()
			arg_489_1.onSingleLineUpdate_ = nil
			arg_489_1.onSingleLineFinish_ = nil
			arg_489_1.state_ = "waiting"
			arg_489_1.auto_ = false
		end

		function arg_489_1.playNext_(arg_491_0)
			arg_489_1.onStoryFinished_()
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = 0
			local var_492_1 = 0.35

			if var_492_0 < arg_489_1.time_ and arg_489_1.time_ <= var_492_0 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_2 = arg_489_1:FormatText(StoryNameCfg[37].name)

				arg_489_1.leftNameTxt_.text = var_492_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, true)
				arg_489_1.iconController_:SetSelectedState("hero")

				arg_489_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1011")

				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_3 = arg_489_1:GetWordFromCfg(1101101121)
				local var_492_4 = arg_489_1:FormatText(var_492_3.content)

				arg_489_1.text_.text = var_492_4

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_5 = 14
				local var_492_6 = utf8.len(var_492_4)
				local var_492_7 = var_492_5 <= 0 and var_492_1 or var_492_1 * (var_492_6 / var_492_5)

				if var_492_7 > 0 and var_492_1 < var_492_7 then
					arg_489_1.talkMaxDuration = var_492_7

					if var_492_7 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_7 + var_492_0
					end
				end

				arg_489_1.text_.text = var_492_4
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101121", "story_v_side_new_1101101.awb") ~= 0 then
					local var_492_8 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101121", "story_v_side_new_1101101.awb") / 1000

					if var_492_8 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_8 + var_492_0
					end

					if var_492_3.prefab_name ~= "" and arg_489_1.actors_[var_492_3.prefab_name] ~= nil then
						local var_492_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_489_1.actors_[var_492_3.prefab_name].transform, "story_v_side_new_1101101", "1101101121", "story_v_side_new_1101101.awb")

						arg_489_1:RecordAudio("1101101121", var_492_9)
						arg_489_1:RecordAudio("1101101121", var_492_9)
					else
						arg_489_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101121", "story_v_side_new_1101101.awb")
					end

					arg_489_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101121", "story_v_side_new_1101101.awb")
				end

				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_10 = math.max(var_492_1, arg_489_1.talkMaxDuration)

			if var_492_0 <= arg_489_1.time_ and arg_489_1.time_ < var_492_0 + var_492_10 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_0) / var_492_10

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_0 + var_492_10 and arg_489_1.time_ < var_492_0 + var_492_10 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101036 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 1101101036
		arg_493_1.duration_ = 1.999999999999

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play1101101037(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = arg_493_1.actors_["1011ui_story"].transform
			local var_496_1 = 0

			if var_496_1 < arg_493_1.time_ and arg_493_1.time_ <= var_496_1 + arg_496_0 then
				arg_493_1.var_.moveOldPos1011ui_story = var_496_0.localPosition
			end

			local var_496_2 = 0.001

			if var_496_1 <= arg_493_1.time_ and arg_493_1.time_ < var_496_1 + var_496_2 then
				local var_496_3 = (arg_493_1.time_ - var_496_1) / var_496_2
				local var_496_4 = Vector3.New(0, -0.71, -6)

				var_496_0.localPosition = Vector3.Lerp(arg_493_1.var_.moveOldPos1011ui_story, var_496_4, var_496_3)

				local var_496_5 = manager.ui.mainCamera.transform.position - var_496_0.position

				var_496_0.forward = Vector3.New(var_496_5.x, var_496_5.y, var_496_5.z)

				local var_496_6 = var_496_0.localEulerAngles

				var_496_6.z = 0
				var_496_6.x = 0
				var_496_0.localEulerAngles = var_496_6
			end

			if arg_493_1.time_ >= var_496_1 + var_496_2 and arg_493_1.time_ < var_496_1 + var_496_2 + arg_496_0 then
				var_496_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_496_7 = manager.ui.mainCamera.transform.position - var_496_0.position

				var_496_0.forward = Vector3.New(var_496_7.x, var_496_7.y, var_496_7.z)

				local var_496_8 = var_496_0.localEulerAngles

				var_496_8.z = 0
				var_496_8.x = 0
				var_496_0.localEulerAngles = var_496_8
			end

			local var_496_9 = arg_493_1.actors_["1011ui_story"]
			local var_496_10 = 0

			if var_496_10 < arg_493_1.time_ and arg_493_1.time_ <= var_496_10 + arg_496_0 and arg_493_1.var_.characterEffect1011ui_story == nil then
				arg_493_1.var_.characterEffect1011ui_story = var_496_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_496_11 = 0.200000002980232

			if var_496_10 <= arg_493_1.time_ and arg_493_1.time_ < var_496_10 + var_496_11 then
				local var_496_12 = (arg_493_1.time_ - var_496_10) / var_496_11

				if arg_493_1.var_.characterEffect1011ui_story then
					arg_493_1.var_.characterEffect1011ui_story.fillFlat = false
				end
			end

			if arg_493_1.time_ >= var_496_10 + var_496_11 and arg_493_1.time_ < var_496_10 + var_496_11 + arg_496_0 and arg_493_1.var_.characterEffect1011ui_story then
				arg_493_1.var_.characterEffect1011ui_story.fillFlat = false
			end

			local var_496_13 = 0

			if var_496_13 < arg_493_1.time_ and arg_493_1.time_ <= var_496_13 + arg_496_0 then
				arg_493_1:PlayTimeline("1011ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_496_14 = 0
			local var_496_15 = 0.125

			if var_496_14 < arg_493_1.time_ and arg_493_1.time_ <= var_496_14 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_16 = arg_493_1:FormatText(StoryNameCfg[37].name)

				arg_493_1.leftNameTxt_.text = var_496_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_17 = arg_493_1:GetWordFromCfg(1101101036)
				local var_496_18 = arg_493_1:FormatText(var_496_17.content)

				arg_493_1.text_.text = var_496_18

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_19 = 5
				local var_496_20 = utf8.len(var_496_18)
				local var_496_21 = var_496_19 <= 0 and var_496_15 or var_496_15 * (var_496_20 / var_496_19)

				if var_496_21 > 0 and var_496_15 < var_496_21 then
					arg_493_1.talkMaxDuration = var_496_21

					if var_496_21 + var_496_14 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_21 + var_496_14
					end
				end

				arg_493_1.text_.text = var_496_18
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101036", "story_v_side_new_1101101.awb") ~= 0 then
					local var_496_22 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101036", "story_v_side_new_1101101.awb") / 1000

					if var_496_22 + var_496_14 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_22 + var_496_14
					end

					if var_496_17.prefab_name ~= "" and arg_493_1.actors_[var_496_17.prefab_name] ~= nil then
						local var_496_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_493_1.actors_[var_496_17.prefab_name].transform, "story_v_side_new_1101101", "1101101036", "story_v_side_new_1101101.awb")

						arg_493_1:RecordAudio("1101101036", var_496_23)
						arg_493_1:RecordAudio("1101101036", var_496_23)
					else
						arg_493_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101036", "story_v_side_new_1101101.awb")
					end

					arg_493_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101036", "story_v_side_new_1101101.awb")
				end

				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_24 = math.max(var_496_15, arg_493_1.talkMaxDuration)

			if var_496_14 <= arg_493_1.time_ and arg_493_1.time_ < var_496_14 + var_496_24 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_14) / var_496_24

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_14 + var_496_24 and arg_493_1.time_ < var_496_14 + var_496_24 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101037 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 1101101037
		arg_497_1.duration_ = 5

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play1101101038(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = arg_497_1.actors_["1011ui_story"]
			local var_500_1 = 0

			if var_500_1 < arg_497_1.time_ and arg_497_1.time_ <= var_500_1 + arg_500_0 and arg_497_1.var_.characterEffect1011ui_story == nil then
				arg_497_1.var_.characterEffect1011ui_story = var_500_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_500_2 = 0.200000002980232

			if var_500_1 <= arg_497_1.time_ and arg_497_1.time_ < var_500_1 + var_500_2 then
				local var_500_3 = (arg_497_1.time_ - var_500_1) / var_500_2

				if arg_497_1.var_.characterEffect1011ui_story then
					local var_500_4 = Mathf.Lerp(0, 0.5, var_500_3)

					arg_497_1.var_.characterEffect1011ui_story.fillFlat = true
					arg_497_1.var_.characterEffect1011ui_story.fillRatio = var_500_4
				end
			end

			if arg_497_1.time_ >= var_500_1 + var_500_2 and arg_497_1.time_ < var_500_1 + var_500_2 + arg_500_0 and arg_497_1.var_.characterEffect1011ui_story then
				local var_500_5 = 0.5

				arg_497_1.var_.characterEffect1011ui_story.fillFlat = true
				arg_497_1.var_.characterEffect1011ui_story.fillRatio = var_500_5
			end

			local var_500_6 = 0
			local var_500_7 = 0.625

			if var_500_6 < arg_497_1.time_ and arg_497_1.time_ <= var_500_6 + arg_500_0 then
				arg_497_1.talkMaxDuration = 0
				arg_497_1.dialogCg_.alpha = 1

				arg_497_1.dialog_:SetActive(true)
				SetActive(arg_497_1.leftNameGo_, false)

				arg_497_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_497_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_497_1:RecordName(arg_497_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_497_1.iconTrs_.gameObject, false)
				arg_497_1.callingController_:SetSelectedState("normal")

				local var_500_8 = arg_497_1:GetWordFromCfg(1101101037)
				local var_500_9 = arg_497_1:FormatText(var_500_8.content)

				arg_497_1.text_.text = var_500_9

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_10 = 25
				local var_500_11 = utf8.len(var_500_9)
				local var_500_12 = var_500_10 <= 0 and var_500_7 or var_500_7 * (var_500_11 / var_500_10)

				if var_500_12 > 0 and var_500_7 < var_500_12 then
					arg_497_1.talkMaxDuration = var_500_12

					if var_500_12 + var_500_6 > arg_497_1.duration_ then
						arg_497_1.duration_ = var_500_12 + var_500_6
					end
				end

				arg_497_1.text_.text = var_500_9
				arg_497_1.typewritter.percent = 0

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(false)
				arg_497_1:RecordContent(arg_497_1.text_.text)
			end

			local var_500_13 = math.max(var_500_7, arg_497_1.talkMaxDuration)

			if var_500_6 <= arg_497_1.time_ and arg_497_1.time_ < var_500_6 + var_500_13 then
				arg_497_1.typewritter.percent = (arg_497_1.time_ - var_500_6) / var_500_13

				arg_497_1.typewritter:SetDirty()
			end

			if arg_497_1.time_ >= var_500_6 + var_500_13 and arg_497_1.time_ < var_500_6 + var_500_13 + arg_500_0 then
				arg_497_1.typewritter.percent = 1

				arg_497_1.typewritter:SetDirty()
				arg_497_1:ShowNextGo(true)
			end
		end
	end,
	Play1101101015 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 1101101015
		arg_501_1.duration_ = 5.366

		local var_501_0 = {
			zh = 2.066,
			ja = 5.366
		}
		local var_501_1 = manager.audio:GetLocalizationFlag()

		if var_501_0[var_501_1] ~= nil then
			arg_501_1.duration_ = var_501_0[var_501_1]
		end

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play1101101016(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = 0
			local var_504_1 = 0.2

			if var_504_0 < arg_501_1.time_ and arg_501_1.time_ <= var_504_0 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0
				arg_501_1.dialogCg_.alpha = 1

				arg_501_1.dialog_:SetActive(true)
				SetActive(arg_501_1.leftNameGo_, true)

				local var_504_2 = arg_501_1:FormatText(StoryNameCfg[37].name)

				arg_501_1.leftNameTxt_.text = var_504_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_501_1.leftNameTxt_.transform)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1.leftNameTxt_.text)
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_3 = arg_501_1:GetWordFromCfg(1101101015)
				local var_504_4 = arg_501_1:FormatText(var_504_3.content)

				arg_501_1.text_.text = var_504_4

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_5 = 8
				local var_504_6 = utf8.len(var_504_4)
				local var_504_7 = var_504_5 <= 0 and var_504_1 or var_504_1 * (var_504_6 / var_504_5)

				if var_504_7 > 0 and var_504_1 < var_504_7 then
					arg_501_1.talkMaxDuration = var_504_7

					if var_504_7 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_7 + var_504_0
					end
				end

				arg_501_1.text_.text = var_504_4
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101015", "story_v_side_new_1101101.awb") ~= 0 then
					local var_504_8 = manager.audio:GetVoiceLength("story_v_side_new_1101101", "1101101015", "story_v_side_new_1101101.awb") / 1000

					if var_504_8 + var_504_0 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_8 + var_504_0
					end

					if var_504_3.prefab_name ~= "" and arg_501_1.actors_[var_504_3.prefab_name] ~= nil then
						local var_504_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_501_1.actors_[var_504_3.prefab_name].transform, "story_v_side_new_1101101", "1101101015", "story_v_side_new_1101101.awb")

						arg_501_1:RecordAudio("1101101015", var_504_9)
						arg_501_1:RecordAudio("1101101015", var_504_9)
					else
						arg_501_1:AudioAction("play", "voice", "story_v_side_new_1101101", "1101101015", "story_v_side_new_1101101.awb")
					end

					arg_501_1:RecordHistoryTalkVoice("story_v_side_new_1101101", "1101101015", "story_v_side_new_1101101.awb")
				end

				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_10 = math.max(var_504_1, arg_501_1.talkMaxDuration)

			if var_504_0 <= arg_501_1.time_ and arg_501_1.time_ < var_504_0 + var_504_10 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_0) / var_504_10

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_0 + var_504_10 and arg_501_1.time_ < var_504_0 + var_504_10 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/A02d",
		"Assets/UIResources/UI_AB/TextureConfig/Background/H03a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D07",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A01a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/S0101",
		"Assets/UIResources/UI_AB/TextureConfig/Background/A00",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D12b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D05",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13g",
		"Assets/UIResources/UI_AB/TextureConfig/Background/B13a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST01a"
	},
	voices = {
		"story_v_side_new_1101101.awb"
	}
}
